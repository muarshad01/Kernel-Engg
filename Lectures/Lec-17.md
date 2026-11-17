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

```
S_ij = ct.matmul(Q_i, ct.transpose(K_j))
```
* $S_{ij} = Q_i \times K_j^{T}$

```
col_idx = j * B_c + ct.arange(B_c, dtype=ct.int32)[None, :]
row_idx = bid * B_r + ct.arange(B_r, dtype=ct.int32)[:, None]  # shape: (B_r, 1)
causal_mask = (row_idx >= col_idx) & (col_idx < N)
S_ij = ct.where(causal_mask, S_ij, -float('inf'))
```
```

m_ij = ct.max(S_ij, axis=1, keepdims=True)
```
* $m_{ij}=\text{max}(S_{ij})$

```
P_ij = ct.exp(S_ij - m_ij)
```
* $P_{ij}=\text{max}(S_{ij} - m_{ij})$

```
l_ij = ct.sum(P_ij, axis=1, keepdims=True)
```
* $l_{ij}=\text{max}(P_{ij})$

```
m_i_new = ct.maximum(m_i, m_ij)
```
* $m_i^{new} = \text{max}(m_i, m_{ij})$

```
l_i_new = (ct.exp(m_i - m_i_new) * l_i) + (ct.exp(m_ij - m_i_new) * l_ij)
```
* $l_i^{new} = \text{exp}(m_i - m_i^{new}) * l_i + \text{exp}(m_{ij} - m_i^{new}) * l_{ij}$

```
O_i = (l_i * ct.exp(m_i - m_i_new) * O_i) + (ct.exp(m_ij - m_i_new) * ct.matmul(P_ij, V_j))
```
* $O_i = (l_i * \text{exp}(m_i - m_i^{new}) * O_i) + (\text{exp}(m_{ij} - m_i^{new}) * ct.matmul(P_{ij}, V_j))$

```
O_i = (1.0 / l_i_new) * O_i
```
* $O_i = \bigg(\frac{1.0}{l_i^{new}}\bigg) \times O_i$

```
l_i = l_i_new
```
* $l_i = l_i^{new}$

```
m_i = m_i_new
```
* $m_i = m_i^{new}$


