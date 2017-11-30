## Linux 4.14 with patches for Manjaro

This is in most parts the same as the official Manjaro kernel.

### A few things were removed: 
- modules for very old or specialised hardware (analog TV, ISDN, amateur RADIO, old SCSI etc.) 

### A few things were added:
- patches for increasing readhead
- -O3 optimisation Kconfig option (disabled by default)
- graysky's CPU optimisation patch (-march=native by default)
- cfs tuning by Zen
- event poll patch
- readded algodev/Manjaro BFQ

### Config changes:
- Full refcount enabled
- ORC unwinder
- LZ4 kernel compression
- disabled legacy things
- BBR congestion control algorithm
- blk-mq disabled, bfq-sq default scheduler

More to follow, probably going for mq-deadline IO scheduler in the future.
