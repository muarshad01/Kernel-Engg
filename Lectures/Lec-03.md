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
* Block size = Num threads a block contains

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
x = (blockIdx.x * blockdim.x) + threadIdx.x
y = (blockdim.y * blockdim.y) + threadIdx.y
```

* 40:00



***






