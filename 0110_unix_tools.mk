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
