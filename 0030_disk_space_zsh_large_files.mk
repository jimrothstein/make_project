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
fdisk:
	fdisk -l

storage:
	sudo du 

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
	# largest directories, human readable
	du -ah ~ | sort -rh | head -10

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
