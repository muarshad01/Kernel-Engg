####  [Find the Bottleneck: Optimize AI Pipelines With Nsight Systems](https://learn.nvidia.com/courses/course-detail?course_id=course-v1:DLI+S-AC-14+V1)

***

## Week 4: Nsight compute profiling theory + break week
* Reading an Nsight Compute report from top to bottom.
* Stall reasons and the source view with SASS next to your code.
* compute-sanitizer for races and out-of-bounds accesses.
* A repeatable method for finding out why a kernel is slow.

***

#### Lecture 13: Profiling + Debugging (Nsight Compute)

| Kernel | Description | Read per Compute | Accumulators per Thread| Problem | Shared Memory |
|---|---|---|---|---|---|
| K-1 | One thread an element | | | LG throttle <br> - due to LDG | 0 |
| K-2 | One thread an element <br> - Memory coalescing <br> - row / col swapped | 2 | 1 | | 0 | 
| K-3 | One thread an element <br> - Chunked <br> - tiles in shared memory | $\frac{33}{32}$  | 8 | MIO throttle <br> - due to LDS | :white_check_mark:|
| K-4 | 1D tiling | $\frac{2n}{n^2}=\frac{64}{1024}~~~(n=32)$ | 64 | | :white_check_mark: |
| K-5 | 2D tiling | | | | :white_check_mark: |
| K-6 | | | | | :white_check_mark: |
| K-7 | Warp tiling | | | | :white_check_mark: |

***

#### Tunable Hyperparameters

| Tiling Levels | Hyper Parameters | Kernel |
|---|---|---|
||                                     | K-3|
| Block Level  | BM: block size (x)    | 32 |
|              | BN: block size (y)    | 32 |
|              | BK: chunk size        | 32 |
|---|---|---|
| Warp Level   | WM: Warp tiling (x)   | -- |
|              | WN: Warp tiling (y)   | -- |
|---|---|---|
| Thread Level | TM: thread access (x) | 32 |
|              | TN: thread access (y) | 32 |

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
* 4 - Launch Configuration

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

* 1:50:00

#### 4 - Launch Configuration

*** 

* 2:20:00

***








