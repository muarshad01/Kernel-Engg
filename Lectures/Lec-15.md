## FlashAttention
* (Pretraining, Inference) <--> Kernels

***

* [Flash Attention](https://github.com/muarshad01/Inference-Engg/blob/main/Lectures/Lecture-5.md)

***

* [Qwen3-8B](https://github.com/muarshad01/Kernel-Engg/blob/main/Qwen3-8B.md)
* $d_{model}$ = 4,096
* x = 196 token

$$
  \mathcal{X}_{196 \times 4096} =
  \left[ {\begin{array}{cccc}
    a_{11} & a_{12} & \cdots & a_{1,4096}\\
    a_{21} & a_{22} & \cdots & a_{2,4086}\\
    \vdots & \vdots & \ddots & \vdots\\
    a_{196,1} & a_{196,2} & \cdots & a_{196,4096}\\
  \end{array} } \right]
$$

* __Trainable matrices__
  * $W_K[4096,128]$
  * $W_Q[4096,128]$
  * $W_V[4096,128]$
* __Step__: Project into $K,Q,V$ space
  * $K [196,128] = x \times W_K$
  * $Q [196,128] = x \times W_Q$
  * $V [196,128] = x \times W_V$
* __Step__: Attention Score
  * $Q \times K^T [196,196]$
* __Step__: Variance Issue
  * $\frac{Q \times K^T}{\sqrt{128}}$
* __Step__: Causal mask
  * Set above diagonal elements to $0$, i.e., causal mask
* __Step__: Sum of each row should be $1$
  * [Softmax](https://github.com/muarshad01/DeepSeek/blob/main/softmax.md)
  * $S = Q \times K^T$, upper-half masked
  * $P [196,196] = \text{softmax}(\frac{QK^T}{\sqrt{d_{keys}}})$
* __Step__: Context vector
  * $O [196,128] = P \times V [196,128]$

***



