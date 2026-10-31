## Lecture 11
* Tensor cores
* What a tensor core computes in a single instruction, and why it changes the GEMM ladder.
* FP16, BF16 and FP8.
* WMMA and mma.sync fragments, ldmatrix and shared-memory swizzling.

*** 

* [Muse Spark Open Kernel Challenge](https://openkernelchallenge.dev/)

* 10:00

***

* CUDA cores
* Tensor cores - tiling

* A[4096,4096] * B[4096,4096]=C[4096,4096]
* Multiply and Add Operations = $2n^3$ = 137 Billion
