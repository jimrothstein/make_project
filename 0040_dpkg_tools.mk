# ~/code/dpkg_tools.mk
#
# ---- APT + DPKG ----
#
# variables
OUT=./output/

SHELL := /bin/zsh
#
#  touch, archive, clean --------------------------
#
.PHONY: all clean

all:	1.txt 2.txt 3.txt


# ---- APT ----
#
# clean up
cleanup:
	sudo apt autoremove
	sudo apt purge
	sudo apt clean

# search all R packages (begin r-)
search:
	apt-cache search "^r-.*"

# all installed packages
installed:
#  sometimes old fshioned "sudo find / -name "*xxx*" is easier to locate
	apt-cache pkgnames

# info about 1 pkg
show:
	apt-cache showpkg shim

# pkgs which depend upon this one.
depends:
	apt-cache depends "shim"

# installed pkgs, manual-installed pkgs
list:
	apt list --installed | wc -l
	apt list --manual-installed | wc -l
	apt list --installed > /tmp/apt_list_installed
	apt list --manual-installed > /tmp/apt_list_manual_installed

archives:
	# sudo apt clean should remove
	sudo du -sh /var/cache/apt/archives

#-----------------
# ---- dpkg -----
#
# Fix:   works at CLI, not in make
#		Need to supress expansion till expression gets to shell
# list all installed pkgs
#
query:
	#a := '${binary:Summary}'
#	b = '$${binary:Summary}'
#	dpkg-query  -Wf '${binary:Summary} ${binary:Package}\n' 'q*'
#	dpkg-query  -Wf '$(x) ${binary:Package}\n' 'q*'
#	dpkg-query -W -f= $(a) dpkg
#	dpkg-query -W -f= '$b' dpkg
	dpkg-query -W -f='$${binary:Package}...\t $${Version}\n' "q*"  


dpkg_list:
	# nice list, can add: | grep -E "search_for_word"
	dpkg --list

# install | deinstall | hold
dpkg_selections:
	dpkg --get-selections

# any deb packages "on hold" ?
dpkg_selections_hold:
	dpkg --get-selections | grep 'hold'

# any old linux-images? (No, returns empty)
dpkg_linux:
	dpkg -l | grep linux-image 

# ---- soap box ----
#
# from github https://github.com/unix-tools/tutorial-makefiles
1.txt:
	mkdir $(OUT)	
	touch $(OUT)1.txt

2.txt:
	touch ./output/2.txt

3.txt: 1.txt
	touch ./output/3.txt

# archive files in $(OUT) 
archive1: 3.txt	
	tar -cvzf $(OUT)archive.tar.gz $(OUT)*

clean:
	rm -rf $(OUT)
#

