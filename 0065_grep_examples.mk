# grep_examples.mk
# 
# ========================
#  FIND  & GREP EXAMPLES
# ========================
#
# ----  GREP ----
#  GREP to search file. 
#  CONSOLIDATE GREP EXAMPLES HERE
#
#		grep [flags]  Pattern (regex)   Files (Glob)
#   -E		Extended
#		-H    File Name
#		-r
#		-n		Line #
#		-i		case insenstive
#		-w		whole word  ('cat', not 'catastrophe')
#
# * 0,1,n
# ? 0,1
# + 1,n
#
#  REMINDER:  MAKE expects TABS (not indented spaces)
# variables
#
main_dir=~/code

.PHONY: all clean grep1

all:	1.txt 2.txt 3.txt

clean:
	rm -rf $(OUT)* 

grep1:
	grep -EHrni 'hello.*world' $(main_dir)*

# current directory
grep1_:
	grep -EHrni 'hello.*world' 

# --include uses GLOB
grep2:
	grep -EHrni 'tibble' $(main_dir) --include='*.Rd'

# + 1,n
grep3:
	grep -EHrni 'tib+le' $(main_dir) --include='*.Rd'

grep4:
	grep -EHrni 'tibble' $(main_dir)/*.R

# ================
# ----  FIND ---
# ================
find1:
	find ~ -name "*.tar.gz" -print

find2:
# slow - see disk_space target largest_files 
	find ~/code -type f -exec ls -sa {} \; | sort -n -r | head -5	

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


#
# ---- ls ----
#
ls1:
#' 	ls -hl $(main_dir)									# mtime (modify, default)
ls2:
	ls -hltu $(mp3_dir)									# atime (access) + sort
Judith1:
	find $(mp3_dir) -name "*Judith*" 					# all files contain "Judith"
	find $(mp3_dir) -name "*Judith*" | wc -l			# count only
Judith2:
	find $(mp3_dir) -name "*Judith*" -exec ls -haltu {} \;	# last access date

