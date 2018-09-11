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
_bfqdate=20171108
_bfqdate2=20180404
_sub=69
pkgver=${_basekernel}.${_sub}
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'elfutils' 'git' 'rxvt-unicode' 'ccache')
options=('!strip')
source=("https://www.kernel.org/pub/linux/kernel/v4.x/linux-${_basekernel}.${_sub}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v4.x/linux-${_basekernel}.${_sub}.tar.sign"
        #"http://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.xz"
        #"http://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.sign"
        # stable queue generator
        #'gen-stable-queue-patch.sh'
        # the main kernel config files
        'config' 'config.vd' # 'config.x86_64'
        # standard config files for mkinitcpio ramdisk
        "${pkgbase}.preset"
        '60-linux.hook'
        '90-linux.hook'
        # BFQ patch
        0001-BFQ-${_bfq}-${_bfqdate}.patch
        0002-BFQ-${_bfq}-${_bfqdate2}.patch
        # vd patches
        #'init-20160927-dev-root-proc-mount-fix.patch'
        'patch-enable_additional_cpu_optimizations.patch'
        'patch-lowlatency_for_cfs.patch'
        'patch-blkrq.patch'
        # GCC 8 patches
        #
        # HHO patches
        'mm-20171004-increase-maximum-readahead-window.patch'
        'epoll-20171031-remove-ep_call_nested-from-ep_eventpoll_poll.patch'
        "epoll-20171117-avoid-calling-ep_call_nested()-from-ep_poll_safewake().patch"
        'block-20180213-optimization-for-classic-polling.patch'
        # ARCH Patches
        '0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch'
        '0001-drm-i915-edp-Only-use-the-alternate-fixed-mode-if-it.patch'
        # MANJARO Patches
        # Zen temperature
        '0001-zen-temp.patch::https://patchwork.kernel.org/patch/9941409/raw/'
        '0002-zen-temp.patch::https://patchwork.kernel.org/patch/9941421/raw/'
        '0003-zen-temp.patch::https://patchwork.kernel.org/patch/9941427/raw/'
)
sha256sums=('61bdd5fbb0e33362d27476e7d8aade0aa1ad11ddb5959a27094c254cc03b19f0'
            'SKIP'
            'a1f34dbcbda9931c01e71fec54f97f2b17165ac55c3cbf77c0389b025d3686ce'
            '35ee114cee3b513318605fa25a52ed4a621932027be827d7037b2676d0b5bfcc'
            '09350ab57ed917cb569703f73e4350e5b2fc2e1dce2eea92d5f0816b2f0b2381'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            '26780f590adfa76700e20e67f7783eca9ef72157baf95883b489f20528eecc7d'
            '5ac0d9fb774ed038c5537c59836b389bb64bdb50a01f32d0ee8ae03159ca9198'
            'f51c1b8709bf9f0e642ebd12d48ee1ac41047902a87cf6a783ca794cfa5142dc'
            '8b00041911e67654b0bd9602125853a1a94f6155c5cac4f886507554c8324ee8'
            '1e1459e8d3685d72a1a9eb72f60c684bd6d43e21a7b7d51622ab207384537dc5'
            '0c25460731dd82fbd533b32df833b98befd3d2f603cdb97a2ded125e4a6c2239'
            'c1f4e8be6f2a2ebc10c2481bce21c6e5b20eb99f70ec79b43b9e31c1ea89231f'
            'b8e07c0b517cec85ddbf305097148b66a67cb82f0dd141cb7ad3ee54eb37c54e'
            'd40540ac578e7b8a30c4bc0e63e9778a84769ec6c73b805bbb09a0eac28cc3f0'
            'ac439d96e941e815d0caa77cb3d02b8a4da5aeddfc1557d465bff89360e5927a'
            '37b86ca3de148a34258e3176dbf41488d9dbd19e93adbd22a062b3c41332ce85'
            'c08d12c699398ef88b764be1837b9ee11f2efd3188bd1bf4e8f85dfbeee58148'
            'ee46e4c25b58d1dbd7db963382cf37aeae83dd0b4c13a59bdd11153dc324d8e8'
            'cd463af7193bcf864c42e95d804976a627ac11132886f25e04dfc2471c28bf6c'
            '70cee696fb4204ac7f787cef0742c50637e8bb7f68e2c7bca01aeefff32affc8')

validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)

prepare() {
  #mv "${srcdir}/linux-${_git}" "${srcdir}/linux-${_basekernel}"
  #mv "${srcdir}/linux-${_basekernel}-${_rc}" "${srcdir}/linux-${_basekernel}"
  cd "${srcdir}/linux-${_basekernel}.${_sub}"

  # add upstream patch
  # switch to full package instead of patch
  #patch -p1 -i "${srcdir}/patch-${pkgver}"

  # add latest fixes from stable queue, if needed
  # http://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git
  # enable only if you have "gen-stable-queue-patch.sh" executed before
  #sh ${srcdir}/gen-stable-queue-patch.sh
  #_ser=1
  #patch -Np1 -i "${srcdir}/prepatch-${_basekernel}-${_ser}"

  # Add support for temperature sensors on Family 17h (Ryzen) processors.
  patch -Np1 -i "${srcdir}/0001-zen-temp.patch"
  patch -Np1 -i "${srcdir}/0002-zen-temp.patch"
  patch -Np1 -i "${srcdir}/0003-zen-temp.patch"

  # Arch patches
  patch -Np1 -i "${srcdir}/0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch"
  patch -Np1 -i "${srcdir}/0001-drm-i915-edp-Only-use-the-alternate-fixed-mode-if-it.patch"

  # Manjaro patches

  # add BFQ scheduler
  msg "Fix naming schema in BFQ-MQ patch"
  sed -i -e "s|SUBLEVEL = 0|SUBLEVEL = ${_sub}|g" \
      -i -e "s|EXTRAVERSION = -rc8|EXTRAVERSION =|g" \
      -i -e "s|EXTRAVERSION = -rc8-bfq-mq|EXTRAVERSION =|g" \
      -i -e "s|NAME = Fearless Coyote|NAME = Petit Gorille|g" \
      "${srcdir}/0001-BFQ-${_bfq}-${_bfqdate}.patch"

  patch -Np1 -i "${srcdir}/0001-BFQ-${_bfq}-${_bfqdate}.patch"
  patch -Np1 -i "${srcdir}/0002-BFQ-${_bfq}-${_bfqdate2}.patch"

  # vd patches
  patch -Np1 -i "${srcdir}/patch-enable_additional_cpu_optimizations.patch"
  patch -Np1 -i "${srcdir}/patch-lowlatency_for_cfs.patch"
  patch -Np1 -i "${srcdir}/patch-blkrq.patch"
  # GCC patches
  #
  # HHO patches
  patch -Np1 -i "${srcdir}/mm-20171004-increase-maximum-readahead-window.patch"
  patch -Np1 -i "${srcdir}/epoll-20171031-remove-ep_call_nested-from-ep_eventpoll_poll.patch"
  patch -Np1 -i "${srcdir}/epoll-20171117-avoid-calling-ep_call_nested()-from-ep_poll_safewake().patch"
  patch -Np1 -i "${srcdir}/block-20180213-optimization-for-classic-polling.patch"

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
  cd "${srcdir}/linux-${_basekernel}.${_sub}"

  # build!
  ccache make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

package_linux414-vd() {
  pkgdesc="The ${pkgbase/linux/Linux} vd kernel and modules"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=("linux=${pkgver}")
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=${pkgname}.install

  cd "${srcdir}/linux-${_basekernel}.${_sub}"

  KARCH=x86

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"

  mkdir -p "${pkgdir}"/{boot,lib/{modules,firmware},usr}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
  cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-${_basekernel}${_kernelname}-${CARCH}"

  # add kernel version
  if [ "${CARCH}" = "x86_64" ]; then
     echo "${pkgver}-${pkgrel}-vd x64" > "${pkgdir}/boot/${pkgbase}-${CARCH}.kver"
  else
     echo "${pkgver}-${pkgrel}-vd x32" > "${pkgdir}/boot/${pkgbase}-${CARCH}.kver"
  fi

  # make room for external modules
  local _extramodules="extramodules-${_basekernel}${_kernelname:--vd}"
  ln -s "../${_extramodules}" "${pkgdir}/lib/modules/${_kernver}/extramodules"

  # add real version for building modules and running depmod from hook
  echo "${_kernver}" |
    install -Dm644 /dev/stdin "${pkgdir}/lib/modules/${_extramodules}/version"

  # remove build and source links
  rm "${pkgdir}"/lib/modules/${_kernver}/{source,build}
  # remove the firmware
  #rm -r "${pkgdir}/lib/firmware"

  # now we call depmod...
  depmod -b "${pkgdir}" -F System.map "${_kernver}"

  # add vmlinux
  install -Dt "${pkgdir}/lib/modules/${_kernver}/build" -m644 vmlinux

  # move module tree /lib -> /usr/lib
  mv -t "${pkgdir}/usr" "${pkgdir}/lib"

  # sed expression for following substitutions
  local _subst="
    s|%PKGBASE%|${pkgbase}|g
    s|%BASEKERNEL%|${_basekernel}|g
    s|%ARCH%|${CARCH}|g
    s|%KERNVER%|${_kernver}|g
    s|%EXTRAMODULES%|${_extramodules}|g
  "

  # hack to allow specifying an initially nonexisting install file
  sed "${_subst}" "${startdir}/${install}" > "${startdir}/${install}.pkg"
  true && install=${install}.pkg

  # install mkinitcpio preset file
  sed "${_subst}" ${srcdir}/linux414-vd.preset |
    install -Dm644 /dev/stdin "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # install pacman hooks
  sed "${_subst}" ${srcdir}/60-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/60-${pkgbase}.hook"
  sed "${_subst}" ${srcdir}/90-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/90-${pkgbase}.hook"

}

package_linux414-vd-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} vd kernel"
  provides=("linux-headers=$pkgver")

  cd "${srcdir}/linux-${_basekernel}.${_sub}"
  local _builddir="${pkgdir}/usr/lib/modules/${_kernver}/build"

  install -Dt "${_builddir}" -m644 Makefile .config Module.symvers
  install -Dt "${_builddir}/kernel" -m644 kernel/Makefile

  mkdir "${_builddir}/.tmp_versions"

  cp -t "${_builddir}" -a include scripts

  install -Dt "${_builddir}/arch/${KARCH}" -m644 "arch/${KARCH}/Makefile"
  install -Dt "${_builddir}/arch/${KARCH}/kernel" -m644 "arch/${KARCH}/kernel/asm-offsets.s"

  cp -t "${_builddir}/arch/${KARCH}" -a "arch/${KARCH}/include"

  install -Dt "${_builddir}/drivers/md" -m644 drivers/md/*.h
  install -Dt "${_builddir}/net/mac80211" -m644 net/mac80211/*.h

  # http://bugs.archlinux.org/task/9912
  install -Dt "${_builddir}/drivers/media/dvb-core" -m644 drivers/media/dvb-core/*.h

  # http://bugs.archlinux.org/task/13146
  install -Dt "${_builddir}/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/lgdt330x.h
  install -Dt "${_builddir}/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
  install -Dt "${_builddir}/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "${_builddir}/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "${_builddir}/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # add xfs and shmem for aufs building
  mkdir -p "${_builddir}"/{fs/xfs,mm}

  # copy in Kconfig files
  find . -name Kconfig\* -exec install -Dm644 {} "${_builddir}/{}" \;

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "${_builddir}/tools/objtool" tools/objtool/objtool

  # remove unneeded architectures
  local _arch
  for _arch in "${_builddir}"/arch/*/; do
    [[ ${_arch} == */x86/ ]] && continue
    rm -r "${_arch}"
  done

  # remove files already in linux-docs package
  rm -r "${_builddir}/Documentation"

  # Fix permissions
  chmod -R u=rwX,go=rX "${_builddir}"

  # strip scripts directory
  local _binary _strip
  while read -rd '' _binary; do
    case "$(file -bi "${_binary}")" in
      *application/x-sharedlib*)  _strip="${STRIP_SHARED}"   ;; # Libraries (.so)
      *application/x-archive*)    _strip="${STRIP_STATIC}"   ;; # Libraries (.a)
      *application/x-executable*) _strip="${STRIP_BINARIES}" ;; # Binaries
      *) continue ;;
    esac
    /usr/bin/strip ${_strip} "${_binary}"
  done < <(find "${_builddir}/scripts" -type f -perm -u+w -print0 2>/dev/null)
}
