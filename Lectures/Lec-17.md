## Triton, CUTLASS and CuTe-DSL
* The abstraction ladder above raw CUDA.
* Triton's blocks, CUTLASS templates, CuTe layouts, and CuTe-DSL for writing CUTLASS-class kernels in Python.
* We write one fused kernel in each and compare the code and the speed.
 
*** 

#### FlashAttention Varients
* FA
* FA2 - 
* FA3 - Hopper
* FA4 - Blackwell
* FA5 - Ruben???

***

#### [Tile Arena](https://tile-arena.vizuara.ai/)

***

* 10:00

#### FlashAttention
* Fused exact attention kernel
* Reduces number of HMB (global mem) accesses
* Letency reduced
* Longer context

***

```
LOAD Q,K
Compute QK^T
STORE QK^T

LOAD QK^T
Compute softmax(QK^T)
STORE softmax(QK^T)
===

FUSED
-----
LOAD Q,K
...
STORE result
```
***

* 25:00

* [softmax](https://github.com/muarshad01/DeepSeek/blob/main/softmax.md)

***

* 40:00

#### Coding

***

* 1:00:00

* $0 \leq bid \leq \lceil\frac{N}{B_r}\rceil$
* $\frac{(bid+1)*B_r}{B_c}$

* 1:30:00

*** 





