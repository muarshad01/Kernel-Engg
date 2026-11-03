## Week 4: Nsight compute profiling theory + break week

#### Lecture 13: Profiling + Debugging (Nsight Compute)

| Kernel | Description | Read per Compute |  | Accumulators | Problem | Shared Memory |
|---|---|---|---|---|---|---|
| K1 | One thread an element | | | | LG throttle | 0 |
| K2 | One thread an element <br > (row / col swapped) <br> - Memory coalescing | $\frac{2}{1}$ || 1 || 0 | 
| K3 | - One thread an element <br> - (Chunked: tiles in shared memory) | $\frac{33}{32}$  || 8 | MIO throttle| :white_check_mark:|
| K4 | 1D tiling |  || 64 ||:white_check_mark:|
| K5 | 2D tiling |||||:white_check_mark:|
| K6 | |||||:white_check_mark:|
| K7 | Warp tiling |||||:white_check_mark:|

***

#### Hyperparameters

| Hyperparameter ||
|---|---|
| BM, BN | block size  |
| Bk     | chunk size  |
| WM, WK | warp size   |
| TM, TK | thread size |

***

* 20:00

#### How Nsight compute watches a launch
* Counters
* Sampling

***

* 30:00

#### 4 Sections
* 1 - Compute
* 2 - Memory
* 3 - Occupancy
* 4 - Launch Config

***

#### 1 - Compute: GPU Speed of light throughput
* Compute / Memory
* FFMA / LSM
* Buy is not fast

***

* 1:15:00

#### 2 - Memory: Where the bytes actully went?
* LSU
  * Global Load (LDG) -> L2 -> HBM
  * Shared Load (LDS) - Banks

***

* 1:40:00

#### 3 - Occupancy
* LG throttle - Warp's next instruction is a global load, and L1's queue for such loads is full. (Kernel-1)
* MIO throttle - Warp's next instruction uses shared memeory, and the queue in front of shared memory is full. (Kernel-3)
* Short scoreboard
* Long scoreboard

***






