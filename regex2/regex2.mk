# #################
# regex2.mk
#
#   echo ""   | grep -E
# #################
#
#	NOTES:
#	use quotes,     grep -E "x{2}"
#	-n	give match line number
#
#
str="x xx xxa xxx xxxx"
file="row_words"		# OFFICIAL makefile way:   $(VAR), but so does ${VAR}
file1="letter_words"
SHELL:=/bin/zsh

0:	
	@echo "$$SHELL"
1:
	@echo ${str}  | grep -E --color=always "x{2}" > junk  

2:
	grep -E x{2} "x xx xxa xxx xxxx"
3:
	@echo "x xx xxa xxx xxxx"  | grep -E --color=auto "x{2}"


# --------
#  no color
#  -------
#
4:	
	@echo "----------YES------------"
	@cat ${file} | grep -En "[!ao]w"		# any 1 of 3
	@echo "----------NO-------------"
	@cat ${file} | grep -Env "[!ao]w"

5:	
	cat ${file} | grep -En "[^ao]w"		#not

6:	
	cat ${file} | grep -En "r[^ao]w"

7:
	@cat ${file1} | grep -En "Letter[0-9]$$"
	@echo "---------- NO -----------"	
	@cat ${file1} | grep -Env "Letter[0-9]$$"

