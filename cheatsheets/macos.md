# macos

## Mounting EXT4 filesystem on Mac:

After installing ext4fuse (https://hackmylinux.com/2018/02/18/how-to-mount-and-read-a-linux-partition-on-a-mac-ext2-ext3-ext4/
        
        diskutil list
        sudo ext4fuse /dev/diskNsN ~/tmp/MY_EXT_PARTITION -o allow_other

To use finder on the mounted filesystem:
        open ~/tmp/

Unmounting after use:
        diskutil unmountDisk /dev/diskN