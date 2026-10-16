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
* 8HMB
1. GPC: Graphic Processing Clusters
2. SM: Symmetric Multiprocessors (1 GPC = 28 SM)
3. TC: Tensor Cores (1 SM = 4 TC)
4. Threads

#### H100 die
* [H100](https://github.com/muarshad01/Kernel-Engg/blob/main/H100.md)

#### Qwen3 - 8B
* [Qwen3-8B](https://github.com/muarshad01/Kernel-Engg/blob/main/Qwen3-8B.md)

* 40:00

#### GPU Chip Limits
* FLOPS/s (H100: 989 TFlops/sec)
  * Kernel Engineer: Extract as much of it as possible
* Memory


***

* 1:20:00

* Bandwidth: 3.35 TB/s (Bytes/s)
* Arithmetic Intensity (AI) = FLOPs/Byte  (Number of FLOP operations done per Byte which is transferred)
* AI x Bandwith = FLOPs/s = GPU Utilization
* operations-per-byte (x) X bandwidth (m) = operations per second (y)

$$
\begin{align}
   y &=mx\\
   FLOPs/s &= Bandwith \times Arithmatic ~Intensity (AI) =    GPU ~Utilization\\ 
           &= \frac{byte(s)}{s} \times \frac{FLOPs}{byte}
\end{align}
$$

***

* 2:00:00





