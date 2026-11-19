## FlashAttention 2 & 3

#### FA2
* Blocks
* Inside blocks

#### FA3
* TMA 
* Producer Consumer

***

* $N_{tokens}=4,096$
* $dim = 128$
* $n_{heads} = 32$
* Query Matrix (Q) = 4,096 x 128
* Key Matrix (K) = 4,096 x 128
* Query Value (V) = 4,096 x 128

#### Tiling - Online softmax
* Q_1 (128,128)
* K_1 (64,128) -> K_2...
* V_1 (64,128) -> V_2...

* 10:00

***

