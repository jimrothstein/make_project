##	grep -E (extended)
# source:
# https://ryanstutorials.net/regular-expressions-tutorial/regular-expressions-basics.php


#	b.g			exactly one character
#The big bag of bits was bugged.

#	l..e		exactly 2 characters	
#You can live like a king but make sure it isn't a lie.  lake loane

##### t[eo]d		NOT WORK, must escape 
#When today is over Ted will have a tedious time tidying up.  teo teod

##### t\[eo\]d		choose exactly 1,  must escape
#When today is over Ted will have a tedious time tidying up.  teo teod

####	"t[^eo]"	NOT, ti, ta, ts, t. , t<space>, all OK
#When today is over Ted will have a tedious time tidying up.  teo teod

#### \[1-8\]		MUST escape
#Room Allocations: G4 G9 F2 H1 L0 K7 M9   1 0 01 012


#### \[1-49\]
#[1-49] Room Allocations: G4 G9 F2 H1 L0 K7 M9    9 09 59 222259


####	rememeber to ESCAPE!   or put in quotes  
#"[1-5a-fx]" 
#A random set of characters: y, w, a, r, f, 4, 9, 6, 3, p, x, t


#t[^eo]d When today is over Ted will have a tedious time tidying up.

####	*  = match previous char 0,1,n times
#lo* Are you looking at the lock or the silk?   looooooo loow 

####	.* = match 0 or more of ANY char and  GREEDY
#Are you looking at the lock or the silk?   looooooo loow 


####	.*? = same as above,  NOT GREEDY.   (? does not mean prior char 0,1
#times)

1:
	@echo "hello" | grep --color=always -E "h" -

2:	
	@echo "tea toe toad tad"	| grep --color=always -E 't[eo]e' -
3:
	@echo "Letter Letter1 LetterA a1 Letter02 Letter223ab" | grep --color=always -E  'Letter[0-9]+.\$$\$$' - 
4:
	ls -la ~/Downloads/mp3/*	| grep --color=always -ER '\.mp3' -
