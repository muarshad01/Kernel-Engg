
#### Matrix Transpose Kernel
* Bank Conflicts
* Shared Memory

***


* [How to Optimize a CUDA Matmul Kernel for cuBLAS-like Performance: a Worklog](https://siboehm.com/articles/22/CUDA-MMM)

*** 

* Get to matrix multiplication
* CUDA core
* Tensor core

***

* A: [1024, 2014]
* B: [1024, 2014]
* C: [1024, 2014]
* C = A*B

***

#### Part-1
1. Naive Kernel
2. Memory Coalencence Kerne
3. Chunked kernel
4. 1-D block tiling Kernel
5. 2-D block-tiling Kernel
6. Warp tiling kernel
7. Vector fusion Kernel
8. Autotuning Kernel

***

#### Comparision

* Theory: TFLOPs/s
* Gold Standard: cuBLAS is NVIDIA's GPU-accelerated implementation of the standard BLAS (Basic Linear Algebra Subprograms) library built on top of the CUDA runtime

***

#### Task at hand
* How many FLOPs?
* Think of ONE output elememnt (C), which is obtained by multiplying 1st row (A) multiplied by 1st col (B) - $n$ multiplications and $(n-1)$ additions = $(2n-1)$ operations
* Output matrix C has $n^2$ elements
* Total operations = $(2n-1) \times n^2 = 2n^3 = 2 \times 1024 \times 1024 \times 1024 = 2,147,483,648$

#### 1. Naive Kernel
