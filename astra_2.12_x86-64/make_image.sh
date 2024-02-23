#!/bin/bash

REPO=http://mirror.yandex.ru/astra/stable/2.12_x86-64/repository
CODENAME=orel
IMAGE=astra_2.12_x86-64-rootfs

sudo -E /usr/sbin/debootstrap --no-check-gpg --components=main,contrib,non-free $CODENAME "$(pwd)/docker-chroot" $REPO

echo "deb $REPO $CODENAME contrib main non-free" | sudo tee "$(pwd)/docker-chroot/etc/apt/sources.list"

sudo tar -C "$(pwd)/docker-chroot" -c . | docker import - "$IMAGE"

