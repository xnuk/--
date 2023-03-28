function fish_greeting
	df -Ph ~ | sed -n 2p | read -l dummy all used avail percent dummy
	echo "Disk: $percent used ($used / $all), $avail available."
end
