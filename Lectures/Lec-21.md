## Beating cuBLAS on an H100
* What Hopper added and why it matters for GEMM:
  * The Tensor Memory Accelerator (TMA), wgmma, thread-block clusters, asynchronous pipelines and warp specialisation.
* We use them to build a matrix multiply that beats NVIDIA's own library.

***


