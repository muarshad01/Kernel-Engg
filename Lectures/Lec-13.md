## Week 4: Nsight compute profiling theory + break week

#### Lecture 13: Profiling + Debugging (Nsight Compute)

| Kernel | | Read/Compute |  | Accumulators | Problem | Shared Memory |
|---|---|---|---|---|---|---|
| K1 | One thread an element | | | || 0 |
| K2 | One thread an element <br >(row / col swapped) |$\frac{2}{1}$|| 1 || 0 | 
| K3 | - One thread an element <br> - Chunked (tiles in shared memory) <br> - Memory coalescing | $\frac{33}{32}$  || 8 | LG throttle | :white_check_mark:|
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

#### 4 sections
* Compute
* Memory
* Occupancy
* Launch Config

***

#### GPU Speed of light throughput
* Compute / Memory
* FFMA / LSM
* Buy is not fast

***

* 1:15:00

#### Where the bytes actully went?
* LSU
  * Global Load (LDG) -> L2 -> HBM
  * Shared Load (LDS) - Banks

***








