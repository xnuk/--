function d
	set -l base
	set -l top (git rev-parse --show-cdup)

	if not count $argv > /dev/null
		set base (git-default-branch)
	else
		set base $argv[1]
	end

	if set -l p (
		for l in (git log --name-only --pretty=format:'' $base..HEAD | grep -v '^$')
			realpath --relative-to=. "$top$l"
		end | sort -u | fzf -m
	)
		eval $EDITOR $p
	end
end

