#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y emacs \
     libvterm \
     pandoc \
     zathura \
     zathura-pdf-mupdf \
     niri \
     waybar \
     swaylock \
     swayidle \
     mako \
     swaybg \
     brightnessctl \
     wlsunset \
     fuzzel \
     wob \
     enchant2-devel \
     pavucontrol \
     kde-connect

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

dnf5 -y copr enable avengemedia/dms
dnf5 -y install dms --setopt=install_weak_deps=False
dnf5 -y copr disable avengemedia/dms

#### Example for enabling a System Unit File

# systemctl enable podman.socket

cd /ctx
make install
cd /
