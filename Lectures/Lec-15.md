## FlashAttention
* (Pretraining, Inference) <--> Kernels
* Inference: Prefill and Decode
  * Prefill is compute bound
  * Decode is memory bound
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

* 40:00

#### Simple Attentions
```python
S = Q @ K.transpose(-2, -1) * 128 ** -0.5
S = S.masked_fill(mask, float('inf'))
P = torch.softmax(S, dim=-1)
O = P @ V
```

***

* 45:00

#### Issues with Simple Attention
* __Issue 1__:
  * Quadratic memory for Attention matrix: (s \times s \ 2 ) bytes

***

* s = 4,096
* Memory per head = $s \times s \times 2$ = 32 MB per head
* Memory per layers = 32 MB x 32 = 1 GB

| Kernel ||||
|---|---|---|---|
| Kernel-1 | $S=Q \times K^T$         | - Multipley $Q$ by $K^T$ <br> - WRITE S to HBM | - 1024 MB (Write)|
| Kernel-2 | Scale by $\frac{1}{128}$ | - READ S <br> - Scale every score <br> - WRITE S | - 1024 MB (Read) <br> - 1024 MB (Write) |
| Kernel-3 | softmax                  | - READ S <br> - WRITE P | - 1024 MB (Read) <br> - 1024 MB (Write) |
| Kernel-4 | $O = P \times V$         | - READ P | - 1024 MB (Read) |





