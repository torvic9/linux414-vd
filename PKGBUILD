# Based on the file created for Arch Linux by:
# Tobias Powalowski <tpowa@archlinux.org>
# Thomas Baechler <thomas@archlinux.org>

# Maintainer: Philip Müller <philm@manjaro.org>
# Maintainer: Guinux <guillaume@manjaro.org>
# Maintainer: Rob McCathie <rob@manjaro.org>
# torvic9

pkgbase=linux414-vd
pkgname=('linux414-vd' 'linux414-vd-headers')
_kernelname=-vd
_basekernel=4.14
_basever=414
_bfq=v8r12
_sub=0
pkgver=${_basekernel}.${_sub}
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'elfutils')
options=('!strip')
source=("https://www.kernel.org/pub/linux/kernel/v4.x/linux-${_basekernel}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v4.x/linux-${_basekernel}.tar.sign"
        #"https://git.kernel.org/torvalds/t/linux-${_basekernel}-${_rc}.tar.gz"
        #https://github.com/torvalds/linux/archive/v${_basekernel}.tar.gz
        #linux-${_basekernel}${_rc}${_shortgit}-${pkgrel}.tar.gz::https://github.com/torvalds/linux/archive/${_git}.tar.gz
        #"http://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.xz"
        #"http://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.sign"
        # the main kernel config files
        'config' 'config.vd' # 'config.x86_64'
        # standard config files for mkinitcpio ramdisk
        "${pkgbase}.preset"
        "${pkgbase}.hook"
        # BFS patch
        #"0001-BFQ-${_bfq}-v${pkgver}.patch::https://github.com/Algodev-github/bfq-mq/compare/d93d4ce...abdfb33.patch"
        # vd patches
        #'init-20160927-dev-root-proc-mount-fix.patch'
        'patch-enable_additional_cpu_optimizations.patch'
        'patch-lowlatency_for_cfs.patch'
        'patch-new_config_option_for_O3.patch'
        'patch-blkrq.patch'
        'mm-20171004-increase-maximum-readahead-window.patch'
        'block-20171009-disable-writeback-throttling-for-bfq.patch'
        # ARCH Patches
        # MANJARO Patches
        # Zen temperature
        '0001-zen-temp.patch::https://lkml.org/lkml/diff/2017/9/6/682/1'
        '0002-zen-temp.patch::https://lkml.org/lkml/diff/2017/9/6/683/1'
        '0003-zen-temp.patch::https://lkml.org/lkml/diff/2017/9/6/684/1'
)
sha256sums=('f81d59477e90a130857ce18dc02f4fbe5725854911db1e7ba770c7cd350f96a7'
            'SKIP'
            'a1f34dbcbda9931c01e71fec54f97f2b17165ac55c3cbf77c0389b025d3686ce'
            '4b0d57a8dc8ed708b38a333a6c78a918bc7f49c992a229ae28702de6d778e38e'
            '09350ab57ed917cb569703f73e4350e5b2fc2e1dce2eea92d5f0816b2f0b2381'
            '99ae56d09e92ae94e15fd42ba40e9d320392a21f96bf31879c84581321dd4911'
            '8b00041911e67654b0bd9602125853a1a94f6155c5cac4f886507554c8324ee8'
            '1e1459e8d3685d72a1a9eb72f60c684bd6d43e21a7b7d51622ab207384537dc5'
            'd3ea49085ea47c0ec65ca4e25847889ecf87ef7452a7d9d147ca2c1e3ecb9cca'
            '0c25460731dd82fbd533b32df833b98befd3d2f603cdb97a2ded125e4a6c2239'
            'c1f4e8be6f2a2ebc10c2481bce21c6e5b20eb99f70ec79b43b9e31c1ea89231f'
            '9e9fbcf77d1f7bf6f15dccc28b9b7e42482d087d8faa6932de1ca384f61e04bb'
            'a1b1c30d53d0a7ffe2b84331f634388807489b807b20cc24041e2591f7da2ec1'
            'df9ff4580281ce431b42490a69f51d0a839471983930044bebe268aaee70c5ad'
            '009da98553e3c9b5d452b7850aac25b9e81fa39de9f2aa33744c012c1a912006')

prepare() {
  #mv "${srcdir}/linux-${_git}" "${srcdir}/linux-${_basekernel}"
  #mv "${srcdir}/linux-${_basekernel}-${_rc}" "${srcdir}/linux-${_basekernel}"
  cd "${srcdir}/linux-${_basekernel}"

  # add upstream patch
  #patch -p1 -i "${srcdir}/patch-${pkgver}"

  # add latest fixes from stable queue, if needed
  # http://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git
  # enable only if you have "gen-stable-queue-patch.sh" executed before
  #patch -Np1 -i "${srcdir}/prepatch-${_basekernel}`date +%Y%m%d`"

  # Add support for temperature sensors on Family 17h (Ryzen) processors.
  patch -Np1 -i "${srcdir}/0001-zen-temp.patch"
  patch -Np1 -i "${srcdir}/0002-zen-temp.patch"
  patch -Np1 -i "${srcdir}/0003-zen-temp.patch"

  # add BFQ scheduler
  #msg "Fix naming schema in BFQ-MQ patch"
  #sed -i -e "s|EXTRAVERSION = -rc8|EXTRAVERSION =|g" \
  #    -i -e "s|EXTRAVERSION = -rc8-bfq-mq|EXTRAVERSION =|g" "${srcdir}/0001-BFQ-${_bfq}-v${pkgver}.patch"
  #patch -Np1 -i "${srcdir}/0001-BFQ-${_bfq}-v${pkgver}.patch"
  
  # vd patches
  patch -Np1 -i "${srcdir}/patch-enable_additional_cpu_optimizations.patch"
  patch -Np1 -i "${srcdir}/patch-lowlatency_for_cfs.patch"
  patch -Np1 -i "${srcdir}/patch-new_config_option_for_O3.patch"
  patch -Np1 -i "${srcdir}/patch-blkrq.patch"
  patch -Np1 -i "${srcdir}/mm-20171004-increase-maximum-readahead-window.patch"
  patch -Np1 -i "${srcdir}/block-20171009-disable-writeback-throttling-for-bfq.patch"

  if [ "${CARCH}" = "x86_64" ]; then
    cat "${srcdir}/config.vd" > ./.config
  else
    cat "${srcdir}/config" > ./.config
  fi

  #cat "${srcdir}/config.aufs" >> ./.config

  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
    sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
  fi

  # set extraversion to pkgrel
  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  # normally not needed
  make clean

  # get kernel version
  make prepare

  # load configuration
  # Configure the kernel. Replace the line below with one of your choice.
  #make menuconfig # CLI menu for configuration
  make nconfig # new CLI menu for configuration
  #make xconfig # X-based configuration
  #make oldconfig # using old config from previous kernel version
  # ... or manually edit .config

  # rewrite configuration
  yes "" | make config >/dev/null
}

build() {
  cd "${srcdir}/linux-${_basekernel}"

  # build!
  make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

package_linux414-vd() {
  pkgdesc="The ${pkgbase/linux/Linux} vd kernel and modules"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=("linux=${pkgver}")
  install=${pkgname}.install

  cd "${srcdir}/linux-${_basekernel}"

  KARCH=x86

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"

  mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
  cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-${_basekernel}${_kernelname}-${CARCH}"

  # add kernel version
  if [ "${CARCH}" = "x86_64" ]; then
     echo "${pkgver}-${pkgrel}-vd x64" > "${pkgdir}/boot/${pkgbase}-${CARCH}.kver"
  else
     echo "${pkgver}-${pkgrel}-vd x32" > "${pkgdir}/boot/${pkgbase}-${CARCH}.kver"
  fi

  # set correct depmod command for install
  sed -e "s|%BASEKERNEL%|${_basekernel}|g;s|%KERNVER%|${_kernver}|g;s|%ARCH%|${CARCH}|g" \
  "${startdir}/${install}" > "${startdir}/${install}.pkg"
  true && install=${install}.pkg

  # install mkinitcpio preset file for kernel
  sed "s|%PKGBASE%|${pkgbase}|g;s|%BASEKERNEL%|${_basekernel}|g;s|%ARCH%|${CARCH}|g" "${srcdir}/${pkgbase}.preset" |
  install -D -m644 /dev/stdin "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # install pacman hook for initramfs regeneration
  sed "s|%PKGBASE%|${pkgbase}|g;s|%BASEKERNEL%|${_basekernel}|g;s|%ARCH%|${CARCH}|g" "${srcdir}/${pkgbase}.hook" |
  install -D -m644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/98-${pkgbase}.hook"

  # remove build and source links
  rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
  # remove the firmware
  rm -rf "${pkgdir}/lib/firmware"
  # gzip -9 all modules to save 100MB of space
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
  # make room for external modules
  ln -s "../extramodules-${_basekernel}${_kernelname:--vd}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
  # add real version for building modules and running depmod from post_install/upgrade
  mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--vd}"
  echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--vd}/version"

  # Now we call depmod...
  depmod -b "${pkgdir}" -F System.map "${_kernver}"

  # move module tree /lib -> /usr/lib
  mkdir -p "${pkgdir}/usr"
  mv "${pkgdir}/lib" "${pkgdir}/usr/"

  # add vmlinux
  install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux" 
}

package_linux414-vd-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} vd kernel"
  provides=("linux-headers=$pkgver")

  install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

  cd "${srcdir}/linux-${_basekernel}"
  install -D -m644 Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/Makefile"
  install -D -m644 kernel/Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/kernel/Makefile"
  install -D -m644 .config \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/.config"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include"

  for i in acpi asm-generic config crypto drm generated keys linux math-emu \
    media net pcmcia scsi sound trace uapi video xen; do
    cp -a include/${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/include/"
  done

  # copy arch includes for external modules
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86"
  cp -a arch/x86/include "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86/"

  # copy files necessary for later builds, like nvidia and vmware
  cp Module.symvers "${pkgdir}/usr/lib/modules/${_kernver}/build"
  cp -a scripts "${pkgdir}/usr/lib/modules/${_kernver}/build"

  # fix permissions on scripts dir
  chmod og-w -R "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/.tmp_versions"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel"

  cp arch/${KARCH}/Makefile "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"

  if [ "${CARCH}" = "i686" ]; then
    cp arch/${KARCH}/Makefile_32.cpu "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"
  fi

  cp arch/${KARCH}/kernel/asm-offsets.s "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel/"

  # add docbook makefile
  #install -D -m644 Documentation/DocBook/Makefile \
  #  "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"

  # add dm headers
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"
  cp drivers/md/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"

  # add inotify.h
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux"
  cp include/linux/inotify.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux/"

  # add wireless headers
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211/"
  cp net/mac80211/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211/"

  # add dvb headers for external modules
  # in reference to:
  # http://bugs.archlinux.org/task/9912
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-core"
  cp drivers/media/dvb-core/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-core/"
  # and...
  # http://bugs.archlinux.org/task/11194
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"
  cp include/config/dvb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"

  # add dvb headers for http://mcentral.de/hg/~mrec/em28xx-new
  # in reference to:
  # http://bugs.archlinux.org/task/13146
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  cp drivers/media/dvb-frontends/lgdt330x.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"
  cp drivers/media/i2c/msp3400-driver.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"

  # add dvb headers
  # in reference to:
  # http://bugs.archlinux.org/task/20402
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb"
  cp drivers/media/usb/dvb-usb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends"
  cp drivers/media/dvb-frontends/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners"
  cp drivers/media/tuners/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners/"

  # add xfs and shmem for aufs building
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs/libxfs"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/mm"
  cp fs/xfs/libxfs/xfs_sb.h "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs/libxfs/xfs_sb.h"

  # copy in Kconfig files
  for i in $(find . -name "Kconfig*"); do
    mkdir -p "${pkgdir}"/usr/lib/modules/${_kernver}/build/`echo ${i} | sed 's|/Kconfig.*||'`
    cp ${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/${i}"
  done

  # add objtool for external module building and enabled VALIDATION_STACK option
  if [ -f tools/objtool/objtool ]; then
    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/tools/objtool"
    cp -a tools/objtool/objtool ${pkgdir}/usr/lib/modules/${_kernver}/build/tools/objtool/
  fi

  chown -R root.root "${pkgdir}/usr/lib/modules/${_kernver}/build"
  find "${pkgdir}/usr/lib/modules/${_kernver}/build" -type d -exec chmod 755 {} \;

  # strip scripts directory
  find "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts" -type f -perm -u+w 2>/dev/null | while read binary ; do
    case "$(file -bi "${binary}")" in
      *application/x-sharedlib*) # Libraries (.so)
        /usr/bin/strip ${STRIP_SHARED} "${binary}";;
      *application/x-archive*) # Libraries (.a)
        /usr/bin/strip ${STRIP_STATIC} "${binary}";;
      *application/x-executable*) # Binaries
        /usr/bin/strip ${STRIP_BINARIES} "${binary}";;
    esac
  done

  # remove unneeded architectures
  rm -rf "${pkgdir}"/usr/lib/modules/${_kernver}/build/arch/{alpha,arc,arm,arm26,arm64,avr32,blackfin,c6x,cris,frv,h8300,hexagon,ia64,m32r,m68k,m68knommu,metag,mips,microblaze,mn10300,openrisc,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,unicore32,um,v850,xtensa}

  # remove a files already in linux-docs package
  rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/kbuild/Kconfig.recursion-issue-01"
  rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/kbuild/Kconfig.recursion-issue-02"
  rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/kbuild/Kconfig.select-break"
}
