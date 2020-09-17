# variables first
FOO="hello"

# target not files
.PHONY: test clean all

# 1st target is all, and list its dependencies
all: clean archive.tar archive.tar.gz

test:
	@echo "FOO1 = " $(FOO)		# hello
	@echo "FOO2 = " $FOO		# OO
	

archive.tar:	makefile clean		# clean old first
	tar -cvf archive.tar *
	
archive.tar.gz: 	archive.tar
		@gzip archive.tar

clean:	
		@rm -f archive.tar.gz # -f = no error if no file


###### experimental


