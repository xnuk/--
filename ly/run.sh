#!/bin/dash
# shellcheck shell=dash enable=all

# [ -f /etc/profile ] && . /etc/profile
[ -f "${HOME}/.config/environment.d/env.conf" ] && eval "$(
	sed -E 's/^([^=]+)=(.*)$/export \1="\2"/' "${HOME}/.config/environment.d/env.conf" || true
)"

exec "$@"
