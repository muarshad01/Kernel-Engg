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


| OFF - Chip |
|---|
| HBM (DRAM) - 80 GB  |

| ON - Chip ||
|---|---|
| Outside SMs (SRAM) | L2 Cache - 50 MB|
| Inside SMs  (SRAM) | L1 Cache |
| Inside SMs  (SRAM) | Shared Memory |
| Inside SMs  (SRAM) | Registers |

#### Off-Chip
1. HBM (Another name: DRAM) - off-chip - 80 GB

#### On-Chip

##### Outside SMs
3. L2 Cache (Shared by ALL the SMs) - on-chip - 50 MB
##### On SMs
4. L1 Cache
5. Share memory
6. Registers


* 
