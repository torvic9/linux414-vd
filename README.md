## Linux 4.14 with patches for Manjaro

This is in most parts the same as the official Manjaro kernel.

### A few things were removed: 
- modules for very old or specialised hardware (analog TV, ISDN, amateur radio, old SCSI and PATA, FC, IB etc.) 

### A few things were added:
- MuQSS scheduler with runqueue sharing patches (default)
- patches for increasing readhead values
- graysky's CPU optimisation patch (-march=native by default)
- cfs tuning by Zen
- event poll patch from 4.15
- Manjaro BFQ
- patches from Arch
- Zen (Ryzen) temp sensor patches from Manjaro

### Config changes:
- Full refcount enabled
- ORC unwinder
- LZ4 kernel compression
- disabled legacy things
- BBR congestion control algorithm
- blk-mq disabled, bfq-sq default scheduler

More to follow, probably going for mq-deadline IO scheduler in the future.
