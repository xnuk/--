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
	$HOME/corepack/bin \
	$HOME/.local/share/gem/ruby/3.0.0/bin \
	$HOME/.fzf/bin \
	$HOME/.cargo/bin \
	$HOME/.npm/nodes/bin \
	$HOME/.ghcup/bin \
	$NPM_CONFIG_PREFIX/bin \
	/usr/local/opt/ruby/bin \
	/usr/lib/jvm/default/bin \
	/usr/lib/emscripten \
	/usr/local/bin \
	/usr/bin \
	/usr/bin/vendor_perl \
	/bin \
	/usr/sbin \
	/sbin

set -gx GPG_TTY (tty)

# chips
if [ -e $XDG_CONFIG_HOME/chips/build.fish ]
	source $XDG_CONFIG_HOME/chips/build.fish
end

alias tmux 'tmux -2'
alias git hub
alias ls "exa --git --time-style=long-iso"
alias rm "trash-put --trash-dir=$HOME/.local/share/Trash"
alias rm! /bin/rm
alias cp 'cp -i --reflink=auto'
alias mv 'mv -i'
alias trim "awk '{\$1=\$1};1'"
alias ip 'ip --color=auto'
alias fontforge 'env GDK_BACKEND=x11 fontforge'

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

abbr --add -g py2 "python2"
abbr --add -g py3 "python3"
abbr --add -g py "python3"
abbr --add -g md "mkdir"
abbr --add -g v "kak"
abbr --add -g i "paru -S"
abbr --add -g iy "paru"
abbr --add -g tn "to"
abbr --add -g pk "fkill"
abbr --add -g new "alacritty &; disown"
abbr --add -g gm "gm"
abbr --add -g gls "tar -tf"
abbr --add -g xxd "hexdump -C"
abbr --add -g xd "od -A n -c"
abbr --add -g k "kak"
abbr --add -g h "eval (history -n 1)"
abbr --add -g cat "bat"
abbr --add -g cat! "cat"
abbr --add -g ll "ls -lh"
abbr --add -g la "ls -lah"

abbr --add -g r "git add --all -p"

abbr --add -g gw "git w (list-branch | fzf)"
abbr --add -g gcmm "git commit -m"
abbr --add -g gr "git rm --cached"
abbr --add -g gs "git-show"
abbr --add -g gmi "git rebase master -i"
abbr --add -g gsw "git sw"
abbr --add -g gsm "git switch (git-default-branch)"
abbr --add -g gc! "git commit -vn --amend"
abbr --add -g g- "git switch -"
abbr --add -g grsh "git reset --soft HEAD~1"
abbr --add -g gun "git unstage"
abbr --add -g gst "git stash"
abbr --add -g grm "git switch (git-default-branch); and git pull --rebase; and git switch -; and git rebase - -i"

abbr --add -g preonic "dfu-util -d 0483:DF11 -a 0 -s 0x08000000:leave -w -D"
abbr --add -g pnpx "pnpm dlx"
abbr --add -g youtube-dl yt-dlp
abbr --add -g http-server darkhttpd

# thanks I hate it
function fish_command_not_found
	__fish_default_command_not_found_handler $argv
end

# theme
set -Ux fish_color_command 005fd7
set -Ux fish_color_comment red
set -Ux fish_color_end 009900
set -Ux fish_color_error ff0000
set -Ux fish_color_param 00afff
set -Ux fish_color_quote 999900
set -Ux fish_color_redirection 00afff
