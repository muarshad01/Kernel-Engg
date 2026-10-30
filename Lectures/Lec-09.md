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

#### READs/COMPUTE

***

#### Warp tiling kernel
#### Vector fusion kernel
#### Auto-tuning kernel
