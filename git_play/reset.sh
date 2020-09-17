#!/bin/dash 
divide="--------------"
rm -f aFile

# 1file - stage and commit
echo "1line" >> aFile
git add aFile
git commit -m "1line"

echo "$divide"
git log1
echo "$divide"
git st
echo "------------"
echo "---commited 1line"
echo "------------"

# 2file - stage, not commit"
echo "2line" >> aFile
git add aFile
echo "$divide"
git st
echo "$divide"

# 3file - modify, not staged, not commited
echo "3line" >> aFile
git st
echo "$divide"



