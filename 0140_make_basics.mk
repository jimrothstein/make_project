.PHONY:	dir1 dir2 base clean

# touch from bottom up
#
dir1: dir2
	touch dir1/dir1_file

dir2:
	touch dir1/dir2/dir2_file

base: dir1
	touch base_file

clean:
		rm -f base_file
		rm -f dir1/dir1_file
		rm -f dir1/dir2/dir2_file


