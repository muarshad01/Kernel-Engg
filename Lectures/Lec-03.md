## Lecture 3: The CUDA programming model

* [CUDA Programming Guide v13.4.2](https://docs.nvidia.com/cuda/cuda-programming-guide/index.html)

#### GPU Limits
* Compute (FLOPs/s)
* Bandwidth (TB/s)
* In our control AI
* AI x Bandwith = Achievable FLOPs/s

***

* Chip -> GPC -> SM -> Blocks -> Warps -> Threads
* SMs -> Quadrants -> Warp schedulers -> Warps -> Threads

***

* Task -> Blocks

***

* 15:00

#### Image Example
* Grid -> Blocks -> Threads
* Grid = 768 x 1,024 = 786,432 pixels = 786,432 threads
* Grid = 3,072 blocks 
* Grid = 1 Block: 16 x 16 = 256 threads

* 30:00

#### Formula: Thread Location
```python
x = (blockIdx.x * blockDim.x) + threadIdx.x
y = (blockdim.y * blockDim.y) + threadIdx.y
```

***

* 40:00

* __GigaThread__ engine distributed block to SMs

#### SMs
* [H100](https://github.com/muarshad01/Kernel-Engg/blob/main/H100.md)
* SMs -> Quadrants -> Warp schedulers -> Warps -> Threads
* SM has 4 Quadrants: $$\{Q_1, Q_2, Q_3, Q_4\}$$
* Each quadrant has a Warp Scheduler
* Warps is a group of 32 threads, which are executed together.

***

* 1:20:00

#### The Register Wall
* 32 cols x 512 rows = 16,348 ergistres

***
#### SM Limits
1. Maximum number of threads = 64 Warps x 32 = 2,048 Threads
2. Maximum number of registers = 65,336 ??
3. Shared memory

***

* 1:40:00

#### SIMD & SIMT

***

* 2:20:00

***





