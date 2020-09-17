# make -f /home/jim/code/make_project/unix_tools_make/view_file_contents.mk 
#
# ---- PURPOSE:  view contents of .R file, ----
#
# ---- CLEAN UP!  ----
#
#
#
# variables first
FOO="hello"
scripts = *.R
script1 = $(wildcard *.R)

# target not files
#
.PHONY: test clean all R

# 1st target is all, and list its dependencies
all: clean R

# cat, but add line numbers: (shortcut for filename?)
nl:
	nl ~/code/make_project/0120_view_file_contents.mk  

# print, dir tree
tree:
	tree


test:
	@echo "FOO1 = " $(FOO)		# hello
	@echo "FOO2 = " $FOO		# OO
	


###### experimental

R:	
		@echo $(script)			# fails
		@echo $(script1)		# works


clean:
