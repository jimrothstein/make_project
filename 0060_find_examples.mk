# find_examples.mk
# 
#
# ----  FIND ----
#
#
# variables
mp3_dir=~/Downloads/mp3/09NOV2018/

.PHONY: all clean

all:	1.txt 2.txt 3.txt

clean:
	rm -rf $(OUT)* 

find1:
	find ~ -name "*.tar.gz" -print


proc:
# if find gives annoying /proc errors, skip it with xdev
# (racket deleted long ago)
	sudo find / -xdev -name "*racket*"

find2:
# slow - see disk_space target largest_files 
	find ~/code -type f -exec ls -sa {} \; | sort -n -r | head -5	

#find2:
#	find ~ -name -exec ls '{}' \;			# fails

find3:
	find ~ -name "*.tar.gz" -o -name "*.md" -print # OR

find4:
	find ~/code -name "*.md" -print					# only in ~/code
# 2 dir, 1 simple  criteria
find5:
	find ~/code ~/Downloads/documents -name "*.md" -print	# only in 2 directories

# 2 dir, 1 OR
# next line,  comment, 2 lines, 2 dir
find6:
	find ~/code ~/Downloads/documents -name "*.md" -o -name "*.tar.gz"	\
	# 2 dir,  

# 1 dir ,   1 OR 
# note:  escaped () and note spacing
find7:
	find ~/code \( -name "*.md" -o -name "*.tar.gz" \)


# Find *.jpg files; ASK user to proceed; if yes list the file.
# NOTE: {} is placement, pronoun ... for the search results.
# NOTE: \; ends the expression and is escaped b/c ; is special character.
find_ok:
	find . -name '*.jpg' -ok ls {} \;

# equivalent way to 'protect' the ;
find_ok2:
	find . -name '*.jpg' -ok ls{} ';'
#
# ---- ls ----
#
ls1:
	ls -hl $(mp3_dir)									# mtime (modify, default)
ls2:
	ls -hltu $(mp3_dir)									# atime (access) + sort
Judith1:
	find $(mp3_dir) -name "*Judith*" 					# all files contain "Judith"
	find $(mp3_dir) -name "*Judith*" | wc -l			# count only
Judith2:
	find $(mp3_dir) -name "*Judith*" -exec ls -haltu {} \;	# last access date

