# a million commits
for Y in {2016..2018}
do
	mkdir $Y
	cd $Y
	for M in {1..12}
	do
		mkdir $M
		cd $M
		for D in {1..31}
		do
			mkdir $D
			cd $D
			# the next line controls number of commits per day
			for i in {1..10}
			do
				echo "Commit $i on $M/$D/$Y" > commit.md
				export GIT_COMMITTER_DATE="$Y-$M-$D 12:00:00"
				export GIT_AUTHOR_DATE="$Y-$M-$D 12:00:00"
				git add commit.md -f
				git commit --date="$Y-$M-$D 12:00:00" -m "Committed $i on $M $D $Y"
			done
			cd ../
		done
		cd ../
	done
	cd ../
done
git push origin master
git rm -rf 20**
git rm -rf 19**
git add --all && git commit -m "cleanup"
git push origin master
