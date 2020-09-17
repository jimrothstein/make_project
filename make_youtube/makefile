##------------------
##	Sun Jan 27 14:57:55 PST 2019
##	makefile
##	/home/jim/code/make_project/make_youtube
##		regex, grep, find, ls, sort, 
##------------------- ## variables 
mp3=~/Downloads/mp3/from_youtube
files=('file1' 'file2' 'file3' 'file4')

.PHONY:	clean 

## -------------------
##	Part I  - using ls
## -------------------

sort:
	# list size, file name, classify, largest to smallest
	ls -h1FsS $(mp3)		
	ls -h1FsS $(mp3)	| wc -l

sort2: clean		# largest to smallest
	find $(mp3) -type f -exec ls -hsa {} \; | sort -hr > youtube_list

digits:				# begin with 4-6 digits, sorted by Size (desc)
	# ignores less (in vim)
	ls -1FS $(mp3)	| grep -E "^[0-9]{4,6}"	| less

not_digits:			# do NOT begin with digits
	ls -1FS $(mp3)	| grep -Ev "^[0-9]{4,6}"	
	ls -1FS $(mp3)	| grep -Ev "^[0-9]{4,6}" | wc -l



## -------------------
##	Part II  - using find
## -------------------

total:
	find $(mp3) -type f -exec ls -sa {} \; | wc -l
	#

list:	clean
	find $(mp3) -type f -exec ls -sa {} \; > youtube_list

ogg: # end in ogg
	find $(mp3) -type f -exec ls -sa {} \; | grep -E ogg$


# 	OR:  must esc mp3\|ogg    or use single quote
#	omits files ending in .sh
or:	
	find $(mp3) -type f -exec ls -sa {} \; | grep -E 'mp3|ogg' > youtube_list

# old examples
1:	
		sudo find ~ -name "\.R[[:lower:]]+"


judith:
	find $(mp3) -type f -exec ls -lasSh {} \; | grep -E "[Jj]udith" | sort -hr
	find $(mp3) -type f -exec ls -h {} \; | grep -E "[Jj]udith" | wc -l



clean:
	zsh check.sh
	ls -la
# zsh check.sh
#if [[ -f youtube_list ]] ; then
#rm -i youtube_list
#fi


## -------------------
##	Part III  - using 
## -------------------


subset:
	# -----
	#  not going to work
	#  `for` breaks into words, problem if filenames have spaces
	#  exist work arounds, but generally:
	#  AVOID ls,   find is better
	for f in (ls -1 ${mp3} | egrep "^[0-9]{4,6}")
	do 
		echo $f
	done

2:
	#--------- glob, array -----
	#	works at CLI (1 long stream)
	#	NOT work in make
	#
	#files=(*)
	@echo "files=${files[@]}"

3:
	# simple sed (warmup)
	#for f in "${files[@]}"
	#do
#		echo "${f}" | sed 's/2/ZZZZ/'
#	done

4:
	grep *  

#		echo "${f}" | sed 's/2/ZZZZ/'
