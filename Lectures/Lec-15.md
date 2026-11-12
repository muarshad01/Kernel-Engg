## FlashAttention
* (Pretraining, Inference) <--> Kernels

***

* [Flash Attention](https://github.com/muarshad01/Inference-Engg/blob/main/Lectures/Lecture-5.md)

***

* [Qwen3-8B](https://github.com/muarshad01/Kernel-Engg/blob/main/Qwen3-8B.md)
* d_{model} = 4,096
* x = 196 token

$$
  A_{196 \times 4096} =
  \left[ {\begin{array}{cccc}
    a_{11} & a_{12} & \cdots & a_{1,4096}\\
    a_{21} & a_{22} & \cdots & a_{2,4086}\\
    \vdots & \vdots & \ddots & \vdots\\
    a_{196,1} & a_{196,2} & \cdots & a_{196,4096}\\
  \end{array} } \right]
$$

***
