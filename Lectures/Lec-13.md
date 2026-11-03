## Week 4: Nsight compute profiling theory + break week

#### Lecture 13: Profiling + Debugging (Nsight Compute)

| Kernel | | Read/Compute | Accumulators |Problem|
|---|---|---|---|---|
| K1: One thread an element | | | ||
| K2: One thread an element <br >(row / col swapped) ||| 1 ||
| K3: One thread an element <br> Chunked (tiles in shared memory) | 2/1  || 8 | LG throttle |
| K4: 1D tiling | 33/2 || 64 ||
| K5: 2D tiling |||||
| K6 |||||
| K7: Warp tiling ||||

***

#### Hyperparameters

* BM, BN - block size
* Bk - chunk size
* WM,WK - warp size
* TM,TK - thread size

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

***



