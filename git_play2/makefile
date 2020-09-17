init:		
	git init
touch:	init
	touch latest

status:
	git status

1:	touch1 add1
	
touch1:
	touch 1
add1:
	git add makefile 1

clean:
	find . ! -name 'makefile' -exec rm -rd {} +
	ll
clean1:
	# remove all EXCEPT makefile
	find . ! -name 'makefile' -type f -exec rm -rd {} +
	find . ! -name 'makefile' -type d -exec rm -rd {} +
