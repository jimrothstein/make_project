# make package: jimPackage
# To run:   make -f make_jimPackage build

##	variables
HELLO=world
HELLO_WORLD=$(HELLO) world!
# This echoes "world world!"


.PHONY:	begin build install latest info

begin:
		@echo $(HELLO)
		HELLO=hello
		# This echoes "hello world!"
		 echo $(HELLO_WORLD)


build:
	R CMD build jimPackage


install: 
	sudo Rscript -e "install.packages('jimPackage_0.0001.tar.gz',repos=NULL)"
#	R CMD install jimPackage


##	why touch date-   does NOT work??
#
latest:
		touch "date-$(date +%F)"		# date=2018-04-24
	touch $@	# touch file "latest" as way to time stamp

info:
	@echo $(shell whoami)
	@echo $(shell arch)
