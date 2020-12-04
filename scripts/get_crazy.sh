#!bin/sh

touch a b c d
touch e f
mkdir g h i
mkdir j k

touch file2
touch file0
mkdir file1
mkdir dir0
mkdir dir1 dir2
touch dir0/a dir0/b

cp -a file0 cp_a0
cp -a file0 cp_a1

touch c f

touch dir0/b file3
touch file2 file4

ln e he
ln a ha

ln -s dir0 slink0
ln -s file2 slink1

touch he
touch slink0
