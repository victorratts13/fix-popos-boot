sudo mount /dev/sda3 /mnt
sudo mount /dev/sda1 /mnt/boot/efi
for i in /dev /dev/pts /proc /sys /run; do sudo mount -B $i /mnt$i; done
sudo cp -n /etc/resolv.conf /mnt/etc/

sudo chroot /mnt
apt install --reinstall linux-generic linux-headers-generic
update-initramfs -c -k all
exit
sudo bootctl --path=/mnt/boot/efi install
