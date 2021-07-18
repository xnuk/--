function git-default-branch
	string replace refs/remotes/origin/ '' (
		git symbolic-ref refs/remotes/origin/HEAD
	)
end
