
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

#### 1. Naive Kernel
