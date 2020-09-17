##------------------
##	/home/jim/code/make_project/regex/makefile
##
##	practice:
##		regex 
##		echo glob 
##	g: practice : echo grep regex
##------------------- ## variables sep="------------------------" source="./source/" dir="./"
dir2="./bash_scripts_play/"

include ~/code/make_project/regex/hello_makefile
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

#	!make via #	-----------
#	remove blank lines from code
#	works at CLI and :grep .., but  not in !make via vim??
#	-----------
omit_blank_line1:
	grep -E . makefile | wc -l
	grep -E . makefile	# match files with 1 char (so blank lines omitted)

omit_blank_line2:
	# print, if do *not* have space, tab etc
	grep -Ev "^[[:space:]]*$$" makefile | wc -l

omit_blank_line3:
	grep -Ev "^$$" makefile | wc -l
	

