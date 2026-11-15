#### Triton
* [Triton Tutorials](https://triton-lang.org/main/getting-started/tutorials/index.html)
* [Triton GitHub](https://github.com/triton-lang/triton)
* [Triton: An Intermediate Language and Compiler for
Tiled Neural Network Computations - 2021](https://www.eecs.harvard.edu/~htk/publication/2019-mapl-tillet-kung-cox.pdf)
* [Introducing Triton: Open-source GPU programming for neural networks - OpenAI](https://openai.com/index/triton/)
* [Triton Kernel Compilation Stages](https://pytorch.org/blog/triton-kernel-compilation-stages/)
* [CUTLASS](https://github.com/NVIDIA/cutlass)

*** 

#### Lecture 16: Tile Programming using Triton, NVIDIA cuTile, and PyTorch Helion

***

* 1:10:00

* CUDA C++ ->
* NVCC (NVIDIA CUDA Compiler) ->
* frontend (clang) ->
* LLVM IR ->
* backend ->
* PTX/SASS
* ptxas is NVIDIA's Parallel Thread Execution (PTX) assembler included in the CUDA Toolkit

***

* 1:25:00

```
t1.program_id(axis=0)
```
* 2:00:00


||||
|---|---|---|
| $x = [11,12,13]$ | ||
| $[:, None] = [[11], [12], [13]]$ | ||
| $[None, : ] = [[11, 12, 13]]$ | ||




