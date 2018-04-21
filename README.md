## Linux 4.14 with patches for Manjaro

This is in most parts the same as the official Manjaro kernel.

### A few things were removed: 
- modules for very old or specialised hardware (analog TV, ISDN, amateur radio, old SCSI and PATA, FC, IB etc.) 

### A few things were added:
- patches for increasing readhead values
- graysky's CPU optimisation patch
- cfs tuning by Zen
- event poll patch from 4.15
- Manjaro BFQ
- patches from Arch
- Zen (Ryzen) temp sensor patches from Manjaro

### Config changes:
- ORC unwinder
- LZ4 kernel compression
- disabled legacy things
- BBR congestion control algorithm
- RCU priority boosting




