
##---------------------
##		~/nonR/git_play/makefile
##		to learn GIT
##		replaces reset.sh
##---------------------


##---------------------
##		variables
##---------------------

divide="--------------"

.PHONY: clean 1 2 3 

## first commit
1:			
		@echo "$(divide)"
		touch  result/1
		git add result/1
		git commit -m "1-commit"



## stage 2nd change
2:	
		echo "$@$(divide)$@"
		touch   result/2
		git add result/2


## modify 3rd
3:	
		echo "$@$(divide)$@"
		touch   result/3 

4:
	echo "1-line" >> result/aFile
	git add result/aFile
	git commit -m "1-line"

5:
	echo "2-line" >> result/aFile
	@git add result/aFile

6:	
	echo "3-line" >> result/aFile


## clean
clean:	
		rm -f ./result/1
		rm -f result/2
		rm -f result/3






