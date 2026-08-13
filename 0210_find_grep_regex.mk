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

##------------------
##	~/nonR/make_play/regex/makefile
##
##	practice:
##		regex 
##		echo glob 
##	g: practice : echo grep regex
##------------------- ## variables sep="------------------------" source="./source/" dir="./"
dir2="./bash_scripts_play/"

include ~/nonR/make_play/m/hello_makefile

.PHONY:	clean 1 2 3 4 5 dot dotOn

## fails:
## 1 2 3 init touch status touch1 clean :	@echo $@ ; touch $@

## var hello is from include
hello:	
	echo $(hello)

1:	
		sudo find ~ -name "\.R[[:lower:]]+"

2:	
		sudo find ~ -name "\.R[[:alpha:]]*"

3:
		echo $(source)*

## pathname expansion
## 1) expands file names 2) echo these
4:	
	@echo $@$(sep)$@
	echo *				# list files, dir on 1 line
	echo "*"			# prints *
		echo D*			# list of files begin with D
	echo "D*"			# prints D*
	echo ./*			# identical to next line
	echo $(dir)*		# list files, dir but prepends ./


5:
	grep -EHIRn '.PHONY' ~nonR		# recurse all dir
6:
		echo [[:upper:]]	# list files with EXACTLY 1 cap ONLY
		echo [[:upper:]]*	# lists above + D1 Da DD
		echo [[:upper:]].	# prints [[:upper:]].
		echo [[:upper:]]?	# list 2 character names, begin with CAP
		echo [[:upper:]]+	#prints litenal pattern
7:
	echo -d .[!.]?*
8:
	echo $(ls)
9:
		@echo $@$(sep)$@
		grep -EHnir [ro].w grep_words	# STUDY
		grep -EHnir r[o*]	grep_words	# not r, ra

dot:	
		#CLAIM Glob can find .git (hidden files)
		set -u dotglob
		ls ~/[.]bashrc			#F
		ls ~/?bashrc			#F
		ls ~/.[b]ashrc			#F
		
dotOn:

		set -s dotglob
		ls ~/[.]bashrc 
		ls ~/?bashrc
last:
	set -s dotglob
	ls ~/.[b]ashrc
	ls ~/?bashrc

	#ls ~/?bashrc
	#ls ~/.[b]ashrc

		
clean:
	#find . ! -name 'makefile' -exec rm -rd {} +
	ll
clean1:
	# remove all EXCEPT makefile
	#find . ! -name 'makefile' -type f -exec rm -rd {} +
	#find . ! -name 'makefile' -type d -exec rm -rd {} +



