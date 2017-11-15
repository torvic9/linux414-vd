## Linux 4.14 with patches for Manjaro

This is in most parts the same as the official Manjaro kernel.

### A few things were removed: 
- algodev bfq patches (might be readded in the future)
- modules for very old or specialised hardware (analog TV, ISDN, amateur RADIO, old SCSI etc.) 

### A few things were added:
- patches for increasing readhead
- -O3 optimisation Kconfig option (disabled by default)
- graysky's CPU optimisation patch (-march=native by default)
- cfs tuning by Zen

### Config changes:
- Full refcount enabled
- ORC unwinder
- BBR congestion control algorithm
- blk-mq enabled, deadline scheduler

More to follow.
