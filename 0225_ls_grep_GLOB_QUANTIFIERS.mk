# ---------# 	
# ============================
# USING ZSH GLOB Quantifiers
# ============================
#
# 0225_ls_grep_examples.mk
# COLLECT  ls, grep examples
# USING ZSH GLOB Quantifiers
# (or is it 'modifiers' ?)
# ---------# 	
#
# ---------#
# GREP [options]  [pattern]  [files]

# ---------
#  # variables
SHELL:=/bin/zsh
mp3_dir=~/Downloads/mp3/from_youtube

.PHONY: all clean

all:	1.txt 2.txt 3.txt

check:
	@echo "$$SHELL"
	@echo $(.SHELLSTATUS)

simple:
	# files only, desc, 
	ls -ldU -- **/*(.OL)  


hidden:
	# files only, desc, 
	ls -ldU -- **/*(.DOL)  

# no size, files only (much less output than ls)
print:
	print -rl -- **/*(.OL)


# =======================
# OLDER,   Begins HERE:
# =======================

list1:
	# WHY?  ll does not work
	ls -la $(mp3_dir)

list2:
	# file name only	
	ls -1FS $(mp3_dir)

grep1_quotes:
	# echo is what SHELL sees, study ...
	ls -la $(mp3_dir) | echo grep -EHn "[Jj]udith"

grep1_no_quotes:
	# with quotes, error ...
	ls -la $(mp3_dir) | echo grep -EHn [Jj]udith	


grep3:
	# Works
	ls -la $(mp3_dir) | grep -EHn "[Jj]udith"

clean:


find1:
	find ~ -name "*.tar.gz" -print

# useful?  -k 5   (key on field 5, size) |  -r reverse
files_only:
	ls -lRha | grep '^-' | sort -k 5 -rn

