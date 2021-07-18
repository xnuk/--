function get-pid
	if count $argv > /dev/null
		and set -l list (ps -C $argv[1] -o pid,tty,cmd --no-headers 2>/dev/null)
		and set -l len (count $list)
		
		if test $len -eq 1
			echo $list[1] 
		else
			for l in $list
				echo $l
			end | fzf --height=30% --reverse --no-multi
		end | awk '{print $1}'

	else
		false
	end
end
