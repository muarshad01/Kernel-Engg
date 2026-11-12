## FlashAttention
* (Pretraining, Inference) <--> Kernels

***

* [Flash Attention](https://github.com/muarshad01/Inference-Engg/blob/main/Lectures/Lecture-5.md)

***

* [Qwen3-8B](https://github.com/muarshad01/Kernel-Engg/blob/main/Qwen3-8B.md)
* Embedding dimentions = $d_{model}$ = 4,096

***

#### Example

* Consider $x = 196$ tokens

$$
  \mathcal{X}_{196 \times 4096} =
  \left[ {\begin{array}{cccc}
    a_{11} & a_{12} & \cdots & a_{1,4096}\\
    a_{21} & a_{22} & \cdots & a_{2,4086}\\
    \vdots & \vdots & \ddots & \vdots\\
    a_{196,1} & a_{196,2} & \cdots & a_{196,4096}\\
  \end{array} } \right]
$$

#### Compute $S,P,O$
* __Trainable matrices__
  * $W_K[4096,128]$
  * $W_Q[4096,128]$
  * $W_V[4096,128]$
* __Step__: Project into $K,Q,V$ space
  * $K [196,128] = x[196,4096] \times W_K[4096,128]$
  * $Q [196,128] = x[196,4096] \times W_Q[4096,128]$
  * $V [196,128] = x[196,4096] \times W_V[4096,128]$
* __Step__: Attention Score
  * $S = Q \times K^T [196,196]=Q \times K^T [tokens,tokens]$
* __Step__: Variance Issue
  * $S = \frac{Q \times K^T}{\sqrt{128}}=\frac{Q \times K^T}{\sqrt{keys}}$
* __Step__: Causal mask
  * Set above diagonal elements to $0$, i.e., causal mask
  * $S = Q \times K^T$, upper-half masked
* __Step__: Attention weights
  * Sum of each row should be $1$
  * [Softmax](https://github.com/muarshad01/DeepSeek/blob/main/softmax.md)
  * $P [196,196] = \text{softmax}(\frac{QK^T}{\sqrt{d_{keys}}})=\text{softmax}(\frac{QK^T}{\sqrt{128}})$
* __Step__: Context vector
  * For every token, we have now captured the influence of its neighbors.
  * $O [196,128] = P[196,196] \times V [196,128]$
* __NOTE__: For multi-head attention (if one layers has 32 heads) then

$$\underbrace{n_{heads} \times d_{head}}_{d_{model}} = 32 \times 128 = 4,096$$

***

* 30:00

***



