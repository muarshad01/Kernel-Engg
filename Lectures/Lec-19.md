## Blackwell and NVFP4: training a language model in 4 bits
* In this class, we train a language model end to end on a B200 in NVFP4 (NVIDIA FP4).
* What changed from Hopper to Blackwell:
1. `Tensor memory (TMEM - 256KB)` beside the tensor cores,
2. ONE thread (`tcgen05.mma`) that starts a multiply, and
3. TWO SMs that share one (Co-operative Thread Array (CTA) pairs).
* Why 4-bit math is a big deal, how a floating-point number works, the **E2M1** ladder and NVFP4's two levels of block scaling, and the two Blackwell instructions that quantize and multiply.

***

#### Thinking Machines Lab
* [The Inkling family](https://thinkingmachines.ai/inkling/)
* Inkling 2 Small is the largest model we are aware of that was trained end-to-end with a native 4-bit forward pass.
* [End‑to‑End 4‑Bit Training](https://thinkingmachines.ai/blog/end-to-end-4-bit-training/)
* [4-Bit Training, Tested on a Real B200 - VIZUARA](https://4bit.vizuara.ai/)
  * Faster
  * Preserves Inference Quality

***

* [H100 versusw B200](https://github.com/muarshad01/Kernel-Engg/blob/main/H100-versus-B200.md)

***

* 20:00

#### FlashAttention
* $Q_{tile} = 128 \times 256 = 32,768$ (Stored in Shared memory - Registers)
* Registers per threads = 32,768/128 = 32k / 128 = 256 (limit!!!)
* [SM Limits](https://github.com/muarshad01/Kernel-Engg/blob/main/H100.md)
1. Threads
2. Shared Mem
3. Registers

* Remember: Consumer WG1 (64 x 128 = 16k/128), Consumer WG2 (64 x 128 = 16k/128)

***

#### Blackwell - What is different?
* 1 - TMEM
* 2 - Who issues an instruction
* 3 - CTA Pairs (Co-operative Thread Array)

***

* 1:10:00

#### Quantization 4-bit (Blackwell)

***

* 1:50:00

#### NVFP4 
1. E2M1
2. Block of size 16
3. Each block has own scaling factor stored as block of 8-bit

***

* 2:25:00

* Project (e2e 4-bit pretraining)

***








