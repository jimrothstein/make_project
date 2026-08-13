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

# lists partitions, but not best format
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

#make -f disk_space.mk
#
# ---- Purpose ----
#  Commands to probe files sizes, disk usage etc
# -----------------
#
#
SHELL := /bin/zsh
the_dir = /var/host/media/fuse/drivefs-34a039d82ac00e8c8d62cd30042f3741/root/

.PHONY:   version fdisk mount lsblk blkid fstab

help:
	@echo "sudo apt remove pkg1 pkg2 pgk3"

version: 
	@echo $(lsb_release -a)
#	lsb_release -a
#
# shows partition, but not really useful display
fdisk:
	sudo fdisk -l

storage:
	sudo du 

## or du -h | sort -hr
## available space
basic_use:
    df -h

disk_use:
	df -kh --total

# maybe be SLOW
# each dir (skip proc etc)
storage_total:
	sudo du -hx --total / | sort -n

# ==========================
# -a each file (excellent)
# ==========================
largest:
    # *** USE
	# largest directories, human readable, replace ~ with specific directory
	du -ah ~ | sort -rh | head -10

# fails
largest_google_drive:
	# directories
	du -ah $(the_dir) | sort -rh | head -10

largest_g_drive:
	# files
	ls -lh -- $(the_dir)**/*(DOL[1,20])

regular_files:
	# . regular files, no dir
	# -U  do not sort
	#  O  sort by size
	ls -ldU -- **/*(.OL)

largest_files: 
	# zsh:  ls -lh ~/**/*(.Lm+20)
	# list files, size > 20M
	ls -lh ~/**/*(.Lm+20)

largest_6:
	# O = reverse order, 
	# D =
	ls -ldh -- **/*(DOL[1,6])

list_google_files:
	ls /var/host/media/fuse/drivefs-34a039d82ac00e8c8d62cd30042f3741/root/ | less

ls_process:
	# separate process for each file found
	# fails if too many files, but very safe
	# begins with -exec, ends with "+"
	sudo find . -type f  -exec ls -lSd {} +

empty_dir:
	sudo find ~ -empty -type d
	sudo find ~ -empty -type d | wc -l

empty_files:
	# careful of lock files (in /var, /lib ....)	
	sudo find ~ -empty -type f
	sudo find ~ -empty -type f | wc -l
	#careful!
	#sudo find ~ -empty -type f -delete

# need to check!
# print0 ends line with nul, not new line (so continuous stream of output)
# print0 is careful with files with spaces, quotes...
#
empty_files2:
	sudo find ~ -empty -type f -print0 

empty_files3:
	sudo find ~ -empty -type f -print

## linux images, print column 2
images:
    dpkg -l | grep linux-image | awk '{print$2}'
# ~/code/unix_tools_make
#
## -----
##
## send output to separate directory
## remove comments from .zshrc for printing
##
## ----
#
# from github https://github.com/unix-tools/tutorial-makefiles

SHELL := /bin/zsh

# variables
OUT=./output/
mp3_dir=~/Downloads/mp3/09NOV2018/

#
#  touch, archive, clean --------------------------
#
#
.PHONY: all clean

all:	1.txt 2.txt 3.txt

1.txt:
	mkdir $(OUT)	
	touch $(OUT)1.txt

2.txt:
	touch ./output/2.txt

3.txt: 1.txt
	touch ./output/3.txt

# archive files in $(OUT) 
archive1: 3.txt	
	tar -cvzf $(OUT)archive.tar.gz $(OUT)*

clean:
	rm -rf $(OUT)
#
#
# ---------
#  list all files/dir 1 level
#  and size
#  --------
#
du:	
	sudo du -hd1 ~
	

# list all the env variables (source:  coreutils - gnu)
env:
	printenv



# ====== SEE .sh =============
# list each element in $path
# path:
# 	for e in $path[@]; echo $e
# ============================

# ----- simplify .zshrc for printing: ----
#
#  file .zshrc, remove comments, collapse multiple blank lines into 1
#  blankline.
#  :make zshrc (be sure working dir = same as file location)
# --------
zshrc:

	grep -vE "^#" ~/dotfiles/.zshrc | cat -s > ~/Downloads/print_and_delete/zshrc_no_comments.zshrc


# BROKEN, TODO ;   $path is in shell, how to reference?
# list all path items in zsh
show_path:
	$(info $(PATH))
	#$(origin path)
	$(info $(path))

#	for e in $(info $(path[@] );echo $e

show_path1:
	$(shell 'for e in $(path[@]);echo $e')
