## Lecture 1

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

#### GH100 die
* 5HBM stacks in use
* SRAM (100 MB)??
* 80 GB
* Bandwidth: 3.35 TB/s (Bytes / sec)
* `989 TFlops/s = 132 (SMs) X 4 (tensor cores in each SM) X 1024 (operations per tick in each tensor core) X 1.83 (ticks per second)`
* GPU Utilization % = 3.35/989 = 

#### Qwen3 - 8B
* 36 transformer blocks

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
* (operations/Byte) X bandwidth = operations/s

* 1:40:00

