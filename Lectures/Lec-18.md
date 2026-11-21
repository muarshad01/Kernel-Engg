## FlashAttention 2 & 3

#### FA2
* Blocks
* Inside blocks

#### FA3
* TMA 
* Producer Consumer

***

|||
|---|---|
| $N_{tokens}$ | 4,096|
| dim | 128 |
| $n_{heads}$ | 32 | 
| Query Matrix (Q) | 4,096 x 128 |
| Key Matrix (K)   | 4,096 x 128 |
| Query Value (V)  | 4,096 x 128 |

#### Tiling - Online softmax
* Q_1 (128,128)
* K_1 (64,128) -> K_2...
* V_1 (64,128) -> V_2...

* 10:00

#### Blocks launched by FlashAttention
* Query Matrix (Q) = 4,096 x 128
* Query Tile = 128 x 128
* Number or $Q_{tiles}$ in one head = $\frac{4096}{128} = 32$
* Number or $Q_{tiles}$ in 32 head  = $32 x 32 = 1,024$

***

### Block to lunch
* FA-1: Number of blocks = Number of heads = 32
* Drawback-1: 32/132 SM filled only
* Inside block: One query tile after other - Q_1, Q_2, ..., Q_{128} (sequential) not exploiting inherent parallelism
* FA-1: Number of blocks = Number of Query tiles = 1,024


| FlashAttention | Number of blocks | Number of heads |
|---|---|---|
| FA-1 | 32 | 32 | 


***

* 20:00

***

#### Inside Block
* Q_{tile}= 128 x 128
* K_{tile} = 64 x 128
* V_{tile} = 64 x 128

* Block: How many Warps?

***

* 35:00






