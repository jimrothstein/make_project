#make -f device_info.mk
# vim: syntax=make
#
# ====================================
# ---- DEVICE, PARTITIONS, DISK ----
# ====================================
#
.PHONY:   version fdisk mount lsblk blkid fstab

version: 
	echo $(lsb_release -a)
	lsb_release -a

fdisk:
	sudo fdisk -l

mount:
	mount

lsblk:
	lsblk -f	# includes UUID
	echo " "
	lsblk -p	# includes SIZE
	echo " "

blkid:
	sudo blkid


fstab:
	cat /proc/partitions		# fs table
	cat /etc/fstab		# mount at boot
	cat /etc/mtab		# mounted now
	cat /proc/mounts			# more reliable for mounted now?

sources:
	cat /etc/apt/sources.list

storage:
	sudo du 

# limit to dir, -x = skip directories on other file system?
storage_dir:
	sudo du -hx / | sort -rn | head

backup:
	# what ??	
	sudo cp /etc/fstab /etc/fstab_$(date "+%y-%m-%d")

