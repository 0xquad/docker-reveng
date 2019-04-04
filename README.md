A container suitable for reverse engineering
============================================

Install reverse engineering tools in a container so that it does not pollute
your main Linux system.


    ./dc.sh build
    ./dc.sh up

It will map Memory Technology Devices (MTDs) and UBI devices into the container
so that firmware files, etc. can be mapped and examined.

For this to work, the main Linux system kernel needs to be compiled with a few
`CONFIG_` parameters. (Basically anything with `MTD`, `UBI` and `JFFS2` in
it.).
