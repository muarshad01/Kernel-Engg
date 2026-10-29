
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
* Naive Kernel
* Memory Coalencence Kernel
* Chunked kernel
* 1-D block tiling Kernel

#### Part-2
* 2-D block-tiling Kernel
* Warp tiling kernel
* Vector fusion Kernel
* Autotuning Kernel

***

#### Comparision

* Theory: TFLOPs/s
* Gold Standard: cuBLAS is NVIDIA's GPU-accelerated implementation of the standard BLAS (Basic Linear Algebra Subprograms) library built on top of the CUDA runtime

***


