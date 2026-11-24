## Blackwell and NVFP4: training a language model in 4 bits
* In this class, we train a language model end to end on a B200 in NVFP4.
* What changed from Hopper to Blackwell: tensor memory beside the tensor cores, one thread that starts a multiply, and two SMs that share one.
* Why 4-bit math is a big deal, how a floating-point number works, the E2M1 ladder and NVFP4's two levels of block scaling, and the two Blackwell instructions that quantize and multiply.

***

<p align="center">
  <img src="https://github.com/muarshad01/Kernel-Engg/blob/main/images/Lecture-19/blackwell.png" width="600" height="600" />
</p>p

#### Thinking Machines Lab
* [End‑to‑End 4‑Bit Training](https://thinkingmachines.ai/blog/end-to-end-4-bit-training/)
  * Inkling 2 Small is the largest model we are aware of that was trained end-to-end with a native 4-bit forward pass.
  * [4-Bit Training, Tested on a Real B200 - VIZUARA](https://4bit.vizuara.ai/)
 
***

* 10:00

#### Blackwell - What is different?
