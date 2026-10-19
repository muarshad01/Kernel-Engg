## Lecture 5: The memory hierarchy
* Registers, shared memory, L1 and L2, and HBM.
* Cache lines and 32-byte sectors.
* Coalesced and uncoalesced loads.
* Shared-memory banks and bank conflicts.
* Why most kernels spend their time waiting for data rather than doing arithmetic.

*** 

#### Companies
* NVIDIA
* Hyperscalers: Google, Amazon, Meta

#### Companies: Memory Wall
* [Cerebras](https://www.cerebras.ai/)
* [Weka](https://www.weka.io/)
* [Tellas??]()
* [Micron](https://www.micron.com/)

***

* 10:00

|| OFF - Chip ||
|---|---|---|
| DRAM | HBM | 80 GB |

|| ON - Chip |||
|---|---|---|---|
| SRAM | Outside SMs | L2 Cache | 50 MB |
| SRAM | On SMs      | L1 Cache | 256 KB on each SM (65,536 Registers) |
| SRAM | On SMs      | Shared Memory ||
| SRAM | On SMs      | Registers | 256 KB on each SM |

* __Flash Attention__: L1 Cache + Shared Memory

***

* 30:00






