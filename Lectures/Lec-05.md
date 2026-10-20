## Lecture 5: The memory hierarchy
* Registers, shared memory, L1 and L2, and HBM.
* Cache lines (1,024 bytes) and 32-byte sectors.
* Coalesced and uncoalesced loads.
* Shared-memory banks and bank conflicts.
* Why most kernels spend their time waiting for data rather than doing arithmetic.

*** 

#### Companies
* [Companies](https://github.com/muarshad01/Inference-Engg/blob/main/companies.md)

***

* 10:00

|| OFF - Chip ||Ticks|
|---|---|---|---|
| DRAM | HBM | 80 GB | 800 |

|| ON - Chip |||Ticks|
|---|---|---|---|---|
| SRAM | Outside SMs | L2 Cache (Shared by ALL SMs) | 50 MB                                | 480 |
| SRAM | On SMs      | L1 Cache & Shared Memory     | 256 KB on each SM (65,536 Registers) | 320 |
| SRAM | On SMs      | Registers                    | 256 KB on each SM                    ||

* __Flash Attention__: L1 Cache + Shared Memory

***

* 50:00

#### Sector or Crate
* 32 bytes

***

* 1:00:00

#### One Warp, how many Creates!

***

* SIMT disaster a.k.a Warp Divergence
* Memory disaster / coalescing

***

* 1:30:00

#### L1 Cache & Share Memory

* Example: Blur image of Dog
* Blur: Every pixel becomes average of its neighbours


* 2:10:00







