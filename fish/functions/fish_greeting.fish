function fish_greeting
	df -Ph ~ | sed -n 2p | read -l _ all used avail percent _
	echo "Disk: $percent used ($used / $all), $avail available."
end

