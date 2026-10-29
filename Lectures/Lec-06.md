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

* A: [1024, 1,024]
* B: [1024, 1,024]
* C: [1024, 1,024]
* C = A*B

***

#### Part-1
1. Naive Kernel
2. Memory Coalencence Kerne
3. Chunked kernel
4. 1-D block tiling Kernel
5. 2-D block tiling Kernel
6. Warp tiling kernel
7. Vector fusion Kernel
8. Autotuning Kernel

***

#### Comparision

* Theory: TFLOPs/s
* Gold Standard: cuBLAS is NVIDIA's GPU-accelerated implementation of the standard BLAS (Basic Linear Algebra Subprograms) library built on top of the CUDA runtime

***

#### Task at hand
1. __How many FLOPs?__
* Think of ONE output elememnt (C), which is obtained by multiplying 1st row (A) multiplied by 1st col (B) - $n$ multiplications and $(n-1)$ additions = $(2n-1)$ operations
* Output matrix C has $n^2$ elements
* __Total operations__ = $(2n-1) \times n^2 = 2n^3 = 2 \times 1024 \times 1024 \times 1024 = 2,147,483,648$

2. __Arithmetic: Compute__
* H100 - 67 TFLOPs/s (operations/s)
* __Total compute time__: $\frac{2,147,483,648}{67~\text{TFLOPs/s}} = 32 ~\mu sec = 56 ~\mu sec (cuBLAS)$

3. __Memory: How much memory would move from HBM__
* A: [1024, 1,024] - read once - $1024 \times 1024 \times 4 = 4,194,304$ bytes
* B: [1024, 1,024] - read once
* C: [1024, 1,024] - write once
* __Total bytes moved__ = $12,582,912$ bytes
* Memory Bandwidth: 3.35 TB/s (Bytes / sec)
* __Time memory time, i.e., time it takes to move these bytes__ = $\frac{12,582,912}{3.35 ~\text{Tera bytes/s}} = 3.76 ~\mu sec$

4. __How a matrix is stored (Byte line format)__
* Each row is $1024x4=4,096$ bytes apart
* Each adjacent element is $4$ bytes apart

#### Conclusion: 
* From above we conclude, MM is compute bound.
* Arithmentic Intensity (AI) = $\frac{2,147,483,648 ~ops}{12,582,912 ~bytes}=171$


***

* 35:00

#### 1. Naive Kernel

* 1 block size = $32 \times 32$ = $1,024$ threads (We are assuming each block has 1,024 threads)
* $A \times B = C [1024, 1024] = \frac{1,024 \times 1,024}{32 \times 32} = 1,024$ blocks




***


