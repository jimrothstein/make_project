##	make legal_18SC21468    target
#
# #######
# PURPOSE:  Backup legal files
#
########
.PHONY:   backup list begin test date manual 1


# messy
theDate	:=	$(shell date +"%^a %d%b%Y")				# simple, no recurse - set once

# no date problme!
theDate	:=	$(shell date +"%^a_%d%b%Y")


1:
	@echo $(theDate)
	@echo $(.SHELLSTATUS)

2:	1
	@echo $(theDate)

date:
		@echo $(shell whoami)			# jim
		@echo $(shell arch)				# x86_64
		@echo $(theDate)				# WED Sept 26 ....
		@echo $(shell date +%Y%m%d)     # 20200301
		@echo $(shell date +"%^a %d%b%Y") # WED Sept 26 


test:
	# works
	tar -cvzf test.tar.gz *

test_mess:
	tar -cvzf test_'$(theDate)'_.tar.gz *

backup: 
	@#	Something still wrong with date.... extra ???
	@#	tar [options] <backup_to.tar.gz> -X <exclude> <files>

	@echo $(theDate)
	@tar -cvpzf ~/Downloads/toGoogle/legal_backup_"$(theDate)".tar.gz -X exclude_files.txt *
	@echo $(theDate)

backup_list:
	@tar -tf ~/Downloads/toGoogle/legal_backup_"$(theDate)".tar.gz
	@echo $(theDate)


find:
	find ~ -name "*.tar.gz"




