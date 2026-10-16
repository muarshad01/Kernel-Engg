## Lecture 1: How fast this Can go? - Raj

- Graphic Designers
- 3D animators
- Opus 5.5 Astra

#### Limits: Speed and Memory

#### Data Centers
* GPU chips
* Chip design

#### Hierarchy
* NN
* LLM / SLM
* 5D-Parallelism
* Inference Engineering
* GPU Kernels

* 20:00

#### NVIDIA Vera Rubin
* [NVIDIA Vera Rubin](https://github.com/muarshad01/Kernel-Engg/blob/main/Nvidia-Vera-Rubin.md)

#### H100 die
* [H100](https://github.com/muarshad01/Kernel-Engg/blob/main/H100.md)

#### Qwen3 - 8B
* [Qwen3-8B](https://github.com/muarshad01/Kernel-Engg/blob/main/Qwen3-8B.md)

* 40:00

#### GPU Chip Limits
* [H100](https://github.com/muarshad01/Kernel-Engg/blob/main/H100.md) - FLOPS/s: 989 TFlops/s
  * Kernel Engineer: Extract as much of it as possible

***

* 1:20:00

$$
\begin{align}
   y &=m \times x\\
   FLOPs/s &= GPU ~Utilization \\ 
           &= Bandwith \times AI \\ 
           &= \frac{byte(s)}{s} \times \frac{FLOPs}{byte} \\
  operations-per-second &= bandwidth \times operations-per-byte \\                     
\end{align}
$$

* Bandwidth is fixed =3.35 TB/s
* Arithmetic Intensity (AI) = FLOPs/Byte  (Number of FLOP operations done per Byte which is transferred)

***

* 2:00:00





