## Blackwell and NVFP4: training a language model in 4 bits
* In this class, we train a language model end to end on a B200 in NVFP4.
* What changed from Hopper to Blackwell: tensor memory beside the tensor cores, one thread that starts a multiply, and two SMs that share one.
* Why 4-bit math is a big deal, how a floating-point number works, the E2M1 ladder and NVFP4's two levels of block scaling, and the two Blackwell instructions that quantize and multiply.

***

