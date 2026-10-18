## Lecture 1: How fast this Can go? - Raj
* __Qwen3-8B__ on one H100 writes about 149 tokens per second, far below what the chip's arithmetic allows. We find out why with the roofline model: arithmetic intensity (AI), memory-bound and compute-bound work. In the second hour, the class becomes the batch and we watch throughput change as more users arrive.

#### Limits
* Compute (FLOPs/s)
* Memory (TB/s)

#### Data Centers
* GPU chips
* Chip design

#### Hierarchy
1. NN
2. LLM / SLM
3. 5D-Parallelism
4. Inference Engineering
5. GPU Kernels

***

* 20:00

#### NVIDIA Vera Rubin
* [NVIDIA Vera Rubin](https://github.com/muarshad01/Kernel-Engg/blob/main/Nvidia-Vera-Rubin.md)

#### H100 die
* [H100](https://github.com/muarshad01/Kernel-Engg/blob/main/H100.md)

#### Qwen3 - 8B
* [Qwen3-8B](https://github.com/muarshad01/Kernel-Engg/blob/main/Qwen3-8B.md)

* 40:00

#### GPU Chip Limits
* [H100](https://github.com/muarshad01/Kernel-Engg/blob/main/H100.md)
  * FLOPs/s theoretical: 989 TFLOPs/s
  * FLOPs/s actual: 
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





