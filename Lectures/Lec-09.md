## Lecture 7: Kernel Optimization Part-2
* GEMM worklog II
* 2D block tiling, register reuse, vectorised memory access, warp tiling and autotuning: the steps that take a hand-written FP32 kernel close to cuBLAS.

***

* 15:00
  
#### 2-D block tiling kernel

* A[32,32] * B[32,32]=C[32,32]
* One single thread owns all of C!!!
* One singel thread owns 1,024 values.

* 30:00

***

#### READs/COMPUTE
* $n=32$

| Kernel | Reads/Compute|
|---|---|
| Kernel-2 | 2 |
| Kernel-3 | $\frac{33}{32}$|
| Kernel-4 | $\frac{2n}{n^2}=\frac{64}{1024}$ |

#### Accumulators/Threads
* Instruction level parallelism

| Kernel | Accumulators/Threads |
|---|---|
| Kernel-2 | 1 |
| Kernel-3 | 32 |
| Kernel-4 | 1,024 |

* __LIMIT__: Maximum number of registers / thread = 256!!!

***

* __GMEM__: A,B,C
* __SMEM__: Chunk of A, Chunk of B
* __Regiters/Thread__: 1,024+64 = 1088

***

#### Tunable Parameters
* BM -> block size (x) - 32
* BN -> block size (y) - 32
* BK -> chunk size - 32
* TM -> thread access (x) - 32
* TN -> thread access (y) - 32

***

* 50:00



#### Warp tiling kernel
#### Vector fusion kernel
#### Auto-tuning kernel
