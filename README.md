# dotfiles
Personal config files

`. deploy.sh`

Adds aliases, clones my important repos, adds testing environment, add nvim config


### Encrypt storage in Linux

* `sudo apt-get install cryptsetup`
* `lsblk`  -find partition you want to encrypt
* `sudo cryptsetup --verbose --verify-passphrase luksFormat /dev/sdb1`
* `sudo cryptsetup luksOpen /dev/sdb1 sdb1` -use password you wrote in step before
* `sudo fdisk -l` verify that disk is listed
* `sudo mkfs.ext4 /dev/mapper/sdb1` - create new file system(recommend ext4)
* `sudo tune2fs -m 0 /dev/mapper/sdb1` -ext4 reserves some space by default,but you wont need it if you dont run sys on it
* `sudo mkdir /mnt/encrypted` - create folder to mount it on (/mnt is commont place to mount)
* `sudo mount /dev/mapper/sdb1 /mnt/encrypted` - mount it  
* `sudo touch /mnt/encrypted/test.txt` - create test file (you need root permision on encrypted partition)
* ``sudo chown -R `whoami`:users /mnt/encrypted`` -you can change that permision with this command
* `touch /mnt/encrypted/test.txt` - test it to see if you can create file without root

When you are done working on encrypted disk

* `sudo umount /dev/mapper/sdb1` - umount it
* `sudo cryptsetup luksClose sdb1` - and close mapped device

When you want to use it again
* `lsblk` - check its name
* `sudo cryptsetup luksOpen /dev/sdb1 sdb1` - open encrypted partition (enter passphrase)
* `sudo mount /dev/mapper/sdb1 /mnt/encrypted` - and mount it

#### Auto mount encrypted partitions during boot

* `lsblk` - check NAME of encrypted partition (sdb1 etc)
* `sudo cryptsetup luksUUID /dev/NAME` - get UUID
* `sudo nano /etc/crypttab` - and add this line `NAME /dev/disk/by-uuid/UUID_from_step_before none luks`
* `sudo mkdir /mnt/encrypted_disk` - create mount point 
* `sudo nano /etc/fstab` - add this mnt point `/dev/mapper/NAME /mnt/encrypted_disk ext4 defaults 0 2`



### Configuring nano

To configure global settings -> `sudo nano /etc/nanorc`

Optionally configure nano on a user by user basis by creating a .nanorc file in their home directory

```
So just uncomment/add this lines to alter its behaviour, il write few of them that i personally 
have but rest is on you..you are the one that will use this so make it for you :)
```
* Enable mouse support -> `set mouse`
* Convert typed tabs to spaces -> `set tabstospaces`
* Set tab size to 4 -> `set tabsize 4`
* Text highlighting -> `include /usr/share/nano/*.nanorc` (if you want specific language here is [list](https://pastebin.com/eNBBkKuZ))
* Binding keys '^'==CTRL and 'M'==ALT below are 2 examples

```
bind M-5 copytext all # alt+5 as copy
bind M-2 uncut all    # alt+2 as paste
```
