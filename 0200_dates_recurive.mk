
## 0200_dates_recurive.mk

########
# PURPOSE: date practice, recursive variables
# #####
#
##	variables
HELLO=world
HELLO_WORLD=$(HELLO) world!				# world world


##	recursive variables
foo	=	$(bar)							# bar unknown
bar	=	$(ugh)
ugh	=	Huh?

##	simple variables, no recurse
x	:=	foo
y	:=	$(x) bar
x	:=	later

theDate	:=	$(shell date +"%^a %d%b%Y")				# simple, no recurse - set once

1:
	echo $(theDate)
	echo $(.SHELLSTATUS)

2:	1
	echo $(theDate)

manual:
		@echo $(foo)						# Huh?
		@echo $(x)						# later
		@echo $(y)						# foo bar
begin:
		@echo $(HELLO)					# world
		@HELLO=hello
		@# This echoes "hello world!"
		@echo $(HELLO_WORLD)

date:
		@echo $(shell whoami)			# jim
		@echo $(shell arch)				# x86_64
		@echo $(theDate)				# WED Sept 26 ....
		@echo $(shell date +%Y%m%d)
		@echo $(shell date +"%^a %d%b%Y")

