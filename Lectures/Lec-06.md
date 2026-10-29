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

* A: [1024, 1,024] x B: [1024, 1,024] = C: [1024, 1,024]

***

#### Part-1
1. Naive Kernel
2. Memory Coalencence Kernel
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

#### 1. Kernel-1: Naive Kernel 

* 1-block size = Block(0, 0) = $32 \times 32$ = $1,024$ threads (We are assuming each block has 1,024 threads)
    * Consider every column as a Warp: $\\{Warp_0, \ldots, Warp_{31}\\}$
    * Neighboring threads are in columns
    * Each thread owns one element
* $A \times B = C [1024, 1024] = \frac{1,024 \times 1,024}{32 \times 32} = 1,024$ total blocks for output C matrix

***

* What part of A and B matrices is needed for Block(0, 0) of output matrix C
* From A, we'll need entire 32 rows - A[32,1024]
* From B, we'll need entire 32 columns - B[1024, 32]
* $A[32,1024] \times B[1024, 32] = C_{Block(0,0)}[32,32]$

***

#### Single Instruciton on Multiple Thread (SIMT)
* We have memeory coalenence issue
* __NOTE__: 1 sector is 32 bytes (8 elements)
* 1-element: 4 bytes
* $A[32,1024] \times B[1024, 32] = C_{Block(0,0)}[32,32]$

| Kernel-1       | |
|---|---|
| Bytes transferred for A (1 col)      | 1,024 bytes = 32 sector X 32 (bytes for each sector) <br> NOTE: for one element we transfer 1 sector or 8 elements (i.e., 32 bytes)|
| Bytes transferred for B (1 element)  | 32 bytes (Only one element) |
| Total bytes transferred (A+B) |  $${\color{red}1,024 + 32 = 1,056 ~bytes}$$ |
| FLOPs                         | 64 (32 additions and multiplications) |
| FLOPs/bytes                   | $\frac{64}{1,056} = 0.06$ |
| Our aim is                    | Achive a reach point of 20 ([H100](https://github.com/muarshad01/Kernel-Engg/blob/main/H100.md)) |

***

* 1:10:00

#### Kernel-2: Memory Coalencence Kernel
* $A[32,1024] \times B[1024, 32] = C_{Block(0,0)}[32,32]$
    * Consider every row as a Warp: $\\{Warp_0, \ldots, Warp_{31}\\}$
    * Neighboring threads are in rows
    * Each thread owns one element
    * 1 element = 4 bytes

| Kernel-2       | |
|---|---|
| Bytes transferred for A (1 element)      | 32 bytes (1 sector = 8 elements) <br> NOTE: for one element we transfer 1 sector or 8 elements (i.e., 32 bytes) |
| Bytes transferred for B (1 row)       | Full row = 128 bytes (4 sector = 32 elememts)|
| Total bytes transferred (A+B) |  $${\color{red}32 + 128 = 160 ~bytes}$$ |
| FLOPs                         | 64 (32 additions and multiplications) |
| AI = FLOPs/bytes              | $\frac{64}{160} = 0.4$ |
| Our aim is                    | Achive a reach point of 20 ([H100](https://github.com/muarshad01/Kernel-Engg/blob/main/H100.md)) |


***

* 1:25:00

#### Kernel-2: Chunked Kernel (Reduce number of READS) 
* Divide and Concur

* 1:30

* ALL threads read same value of A = Use Shared memory
* What to put in Shared memory
   * Entire A[32, 1024] = $32 \times 1024 \times 4 = 131,072$ bytes
   * Entire B[1024, 32] = $1024 \times 32 \times 4 = 131,072$ bytes
   * Total = 256 KB
   * [H100 shared memory](https://github.com/muarshad01/Kernel-Engg/blob/main/Lectures/Lec-05.md) - 228 KB
 
* NOTE: A block goes to SM. SM has limits
* [SM Limits](https://github.com/muarshad01/Kernel-Engg/blob/main/Lectures/Lec-03.md)
* Blocks of SM: 48 KB of Shared Memory (unless it asks for more)

$$
\begin{align}
A[32,1024] &= A_1[32,32], A_2[32,32], \dots, A_{32}[32,32]\\
B[32,1024] &= B_1[32,32], B_2[32,32], \dots, B_{32}[32,32]\\
A \times B &= A_1 \times B_1, A_2 \times B_2, \dots, A_{32}\times B_{32}
\end{align}
$$

#### Chunking Steps
1. Each thread will load A_1, B_1 and then synchronize
2. Multiply add for all threads
3. Wait for all threads to finish
4. Load the next chunk

* __NOTE__: size of chunk is a hyper parameter as long as it fits under Shared memory. This parameter needs to be tuned.

| Kernel-3       | |
|---|---|
| Bytes transferred for (A_i, B_i) - Global mem to Shared mem | $2 (block) \times 32 \times 32 \times 4(bytes) = 8,192$|
| FLOPs                         | $2n^3 = 2 \times 32 \times 32 \times 32 = 65,523$ |
| AI = FLOPs/bytes              | $\frac{65,536}{8,192} = 8 (Actually ~lower)$ |
| Our aim is                    | Achive a reach point of 20 ([H100](https://github.com/muarshad01/Kernel-Engg/blob/main/H100.md)) |

* $K_1 (0.01) \rightarrow K_2 (0.4) \rightarrow K_3 (xx)$

* Measure: Kernel-3 took 235.1 micor seconds, 9.14 TFLOPs/s: 1.5 times as fast as kernel 2. The bytes asked of global memory fell 20 times; the time did not.

#### Why Kernel-3 is not 20 times faster

* 1:50:00
* How many READs for one WRITE?
* ALL these thread take 2 READs for each compute!
* For every multiply add therads makes 2 READs.

#### MIO Throttle
* There is a lot of waiting due to share memory.

***

* READs/WRITE = 2/1 (Can we readuce this RATIO!!!)

#### Kernel-4: 1-D Block Tiling
* Thread ownership of row-col
* 1-thread has 32 accumulators (Instruction Level Parallelism)
* READs/Compute = 33/32 

***

* 2:30:00

***

* NOTE: 1 SM = 8 blocks
* NOTE: 1 SM = 64 Warps at most
* Total Blocks = 1,024 for 132 SMs
* Kernel-3: 1-block = 1,024 threads = 32 Warps; 
* Kernel-4: 1-block =    32 threads =  1 Warp 
*                   =     8 SMs     =. 8 Warps

|   | Kernel-3 | Kernel-4 |
|---|---|---|
| Total Blocks | 1,024 |    1,024 |
| 1 SM         |       | 8 Blocks |
| 1 Block.     | 1,024 Threads |       32 Threads |
| Warps        |    32 |        1 |
| 1 SM         |       |  8 Warps | 

***
