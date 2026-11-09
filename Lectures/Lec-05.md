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

| DRAM/SRAM | ON/OFF Chip | Memory Type | Memory Size |Ticks|Bandwidth|
|---|---|---|---|---|---|
|| **OFF - Chip** |||  |  | 
| DRAM | HBM | | 80 GB | 800 | 3.35 TB/s|
|| **ON - Chip** ||||  | 
| SRAM | Outside SMs | L2         | 50 MB (__Shared by ALL SMs__)            | 480 | 12 TB/s|
| SRAM | On SMs      | L1 / SMEM  | 256 KB on each SM = 64K Register <br> 228 KB Shared Memory <br> 1-block of SM has 48 KB of Shared memory <br> Shared across ALL threads/ALL WARPS of an SM | 320 | 19 TB/s |
| SRAM | On SMs      | Registers                    | 256 KB on each SM                    || 20 TB/s |

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

***

* 2:10:00

#### Bank Conflicts (Padding)
* Shared Memory has 32 banks
* Warp has 32 threads


* 2:40:00

* Threads, Registers, Shared Memory





