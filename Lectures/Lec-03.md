## Lecture 3: The CUDA programming model

* [CUDA Programming Guide v13.4.2](https://docs.nvidia.com/cuda/cuda-programming-guide/index.html)

#### GPU Limits
* Compute (FLOPs/s)
* Bandwidth (TB/s)
* In out control AI
* AI x Bandwith = Achievable FLOPs/s

***

* Chip -> GPC -> SM -> Blocks -> Warps -> Threads

***

* Task -> Blocks -> SMs -> Quadrants -> Warp schedulers -> Warps -> Threads

***

* 15:00

#### Image Example
* Grid -> Blocks -> Threads
* Grid: 768 x 1,024 = 3,072 blocks = 
* Block: 16 x 16 = 256 threads
* Each block has 256 threads

* 30:00

```
blockdim.x
blockdim.y

blockIdx.x
blockIdx.y

threadIdx.x
threadIdx.y
```

#### Formula: Thread Location
```
x = (blockIdx.x x blockdim.x) + threadIdx.x
y = (blockdim.y x blockdim.y) + threadIdx.y
```

* 40:00

* 1 Chip = 8 GPC = 8 x 18 = 144 SMs
* 1 GPUC = 18 SM


***

#### SM
* SM has 4 Quadrants: $$\{Q_1, Q_2, Q_3, Q_4\}$$
* Warp Schedulers
* Warps (A group of 32 threads, which are executed together)
* Threads

***

* 1:20:00

***

#### The Register Wall
* 32 cols x 512 rows = 16,348 ergistres

***


#### SM Limits
1. Maximum number of threads = 64 x 32 = 2,048 threads
2. Maximum number of registers = 65,336
3. Shared memory

***

* 1:40:00

#### SIMD & SIMT


***

* 2:00:00


***





