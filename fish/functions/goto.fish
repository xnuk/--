function goto
	set -l cmd (
		rg . --no-config -nH -0 --color=always |
		fzf --ansi -d '\0|:' --nth=3.. --preview='bat -H{+2} {+1} --line-range=(expr "(" {+2} - 10 ">" 0 ")" "*" "(" {+2} - 10 ")"): --color=always --style=plain' --preview-window=top |
		sed -E 's/^([^\x0]+)\x0([0-9]+):.*$/kak \1 +\2/'
	)

	if test -n "$cmd"
		sh -c "$cmd"
	end
end
