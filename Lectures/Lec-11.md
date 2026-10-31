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

#### Example
* A[4096,4096] * B[4096,4096] = C[4096,4096]
* Multiply and Add Operations = $2n-1 \times n^3 = 2 \times n^3$ = 137.4 Billion

|||
|---|---|
| Operations   |  137.4 billion |
| Time         | $\frac{137.4 ~\text{billion ops}}{67 ~\text{trillion ops/s}}=2,052 ~\mu ~sec$ |
| Time cuBLAS  | $2,658 ~\mu ~sec$ |
