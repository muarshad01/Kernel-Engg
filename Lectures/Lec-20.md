## Flash Attention 4 (FA4)
* From FlashAttention 3 on Hopper to FlashAttention 4 on Blackwell.
* Why, on the newest chips, the exponentials in softmax rather than the matrix multiplications become the limit, and the tricks FA4 uses to work around it.

*** 

* [Hopper versus Blackwell](https://github.com/muarshad01/Kernel-Engg/blob/main/H100-versus-B200.md)

***

* 15:00

#### FA4
* Bigger query tiles
  * $Q_1(128, 128), Q_2(128, 128)$
* Asymmetric hardware scaling


<p align="center">
  <img src="https://github.com/muarshad01/Kernel-Engg/blob/main/images/Lecture-20/asymm-hardware-scaling.png" width="500" height="400" />
</p>

***

* 30:00

* FA4: 4 Warp Groups = 16 Warps = 512 threads
* Warpgroups - drives work on TCs: wg1
* Warpgroups - Softmax: wg2, wg3
* Warpgroups - corrections: wg4

*** 

* 50:00

***




