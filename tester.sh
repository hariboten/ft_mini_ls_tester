#!bin/sh

#path from tester root dir
mini_ls_path=../ft_mini_ls/ft_mini_ls

ls_com=ls -1tr

scripts_dir=./scripts
testdir=./testdir
your_out=./your_out
ls_out=./ls_out
diff=./diff

abs_scrpt_dir=$(cd ${scripts_dir} && pwd)
abs_root_dir=$(pwd)


BLUE = "echo \e[32m"
RED = "echo \e[31m"
COL_END = "echo \e[m"

clean ()
{
	rm -rf ${testdir};
	rm -f ${your_out} ${ls_out};
}

exec_ls ()
{
	pushd ${testdir};
	${abs_root_dir}/${mini_ls_path} > ${abs_root_dir}/${your_out};
	${ls_com} > ${abs_root_dir}/${ls_out};
	popd;
}

result ()
{
	if [ -s ${diff} ] ; then
		${BLUE};
		echo OK;
		${COL_END};
	else
		${RED};
		cat ${diff};
		${COL_END};
	fi
}

# arg 1 is abs path to script
set_test_case ()
{
	echo case `$basename $1`;
	pushd ${testdir};
	sh $1;
	popd;
}

# arg 1 is abs path to script
do_test ()
{
	set_test_case $1
	exec_ls;
	diff ${your_out} ${ls_out} > ${diff};
	result;
	clean;
}

# test all case using all script in $scripts_dir
test_all ()
{
	if [ ! `ls ${abs_scrpt_dir}` ] ; then
		${RED};
		echo no script;
		${COL_END}
		return ;
	fi
	files="${abs_scrpt_dir}/*"
	for script in $files; do
		do_test script;
	done
}

#main
# if arg1 is "all" or no arg, use default script dir and test all
if [ !$1 ] ; then
	test_all;
elif [ $1 = "all" ] ; then
	test_all;
fi

# if arg1 is directory, use test all script in that directory
if [ -d $1 ] ; then
	testdir=$1
	test_all;
fi

# else test all arg as script
for arg in "$@"; do
	abs=$(cd $(dirname $arg) && pwd)/$(basename $arg);
	do_test abs;
done
