function update_shell_env
	set -l __envd "$HOME/.config/environment.d/env.conf"
	if [ -f "$__envd" ]
		eval ("$HOME/.config/bin/dotenv" set -gx '\1' '"\2"' ';' < "$__envd")
	end
end

update_shell_env

# if status is-login
# 	and test -z "$DISPLAY" -a "$XDG_VTNR" = 1
# 	and not swaymsg -q
# 	sh -c "exec /usr/local/bin/sway-run" & disown
# 	exit
# end

set -g fish_user_paths \
	$XDG_CONFIG_HOME/bin \
	$HOME/.local/bin \
	$HOME/.cargo/bin \
	$HOME/.npm/nodes/bin \
	$HOME/.ghcup/bin \
	$NPM_CONFIG_PREFIX/bin \
	/usr/local/opt/ruby/bin \
	/usr/lib/jvm/default/bin \
	/usr/lib/emscripten \
	/usr/lib/rustup/bin/ \
	/usr/local/bin \
	/usr/bin \
	/usr/bin/vendor_perl \
	/bin \
	/usr/sbin \
	/sbin

set -gx GPG_TTY (tty)

# cgitc
if test -f "$XDG_CONFIG_HOME/fish/plugins/cgitc/init.fish"
	source "$XDG_CONFIG_HOME/fish/plugins/cgitc/init.fish"
end

alias tmux 'tmux -2'
alias ls "eza --git --time-style=long-iso"
alias rm "trash-put --trash-dir=$HOME/.local/share/Trash"
alias rm! /bin/rm
alias cp 'cp -i --reflink=auto'
alias mv 'mv -i'
alias trim "awk '{\$1=\$1};1'"
alias ip 'ip --color=auto'
alias fontforge 'env GDK_BACKEND=x11 fontforge'
alias gparted 'sudo -EH gparted'

# Inlining fish-sensible
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../..'
alias ......='cd ../../../..'
alias .......='cd ../../../../..'
alias ........='cd ../../../../../..'

alias 교자 exit

if not type -q firefox
	alias firefox firefox-developer-edition
end

abbr --add -g --position anywhere '>' '>?'

abbr --add -g py "python3"
abbr --add -g md "mkdir"
abbr --add -g i "paru -S"
abbr --add -g tn "to"
abbr --add -g gm "gm"
abbr --add -g gls "tar -tf"
abbr --add -g xxd "hexdump -C"
abbr --add -g xd "od -A n -c"
abbr --add -g k "kak"
abbr --add -g h "eval (history -n 1)"
abbr --add -g cat "bat"
abbr --add -g cat! "cat"
abbr --add -g ll "ls -lhb"
abbr --add -g la "ls -lhba"

abbr --add -g r "git add --all -p"

abbr --add -g gs "git-show"
abbr --add -g gsw "git sw"

abbr --add -g preonic "dfu-util -d 0483:DF11 -a 0 -s 0x08000000:leave -w -D"
abbr --add -g pnpx "pnpm dlx"
abbr --add -g why 'paru -Qo'

abbr --add -g windows-reboot "systemctl reboot --boot-loader-entry=auto-windows"
abbr --add -g bios-reboot "systemctl reboot --firmware-setup"

abbr --add -g ncdu 'dua i'

# thanks I hate it
function fish_command_not_found
	__fish_default_command_not_found_handler $argv
end

# theme
set -gx fish_color_command 005fd7
set -gx fish_color_comment red
set -gx fish_color_end 009900
set -gx fish_color_error ff0000
set -gx fish_color_param 00afff
set -gx fish_color_quote 999900
set -gx fish_color_redirection 00afff

# nix
if test -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
	source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
end
