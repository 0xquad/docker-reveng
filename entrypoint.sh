#!/bin/sh

[ -d /usr/lib/qemu ] || {
    # install qemu on first run (keep it out of the docker image)
    apt-get install -qqy qemu binfmt-support qemu-user-static
    update-binformats --register
}

# TODO: also install cross-compiler and debuggers for arm, mips ?

echo "use 'docker exec -ti $(hostname)' to enter a shell"
# just hang there
while true; do sleep 37337; done
