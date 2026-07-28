# Copyright 2020 Timothy Allen
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

define-command -hidden shellcheck-shell-blocks %{
    evaluate-commands -draft %{
        # Select all the instances of %sh followed by a grouping character.
        # We use hex escapes to avoid messing up Kakoune's nested-brackets
        # parsing.
        execute-keys '%s%sh[\x28\x3C\x5B\x7B]<ret>'

        # We only care about blocks containing at least one character.
        # (otherwise, the following trim-first-and-last-chars trick
        # doesn't work)
        execute-keys <a-k>...<ret>

        # Select up to the matching grouping character,
        # then trim off the first and last characters.
        execute-keys m <a-:>H<a-semicolon>L

        # Check the selected blocks with shellcheck.
        lint-selections -command "shellcheck -s sh -f gcc --exclude SC2154"
    }
}

evaluate-commands %sh{
    if command -V shellcheck >/dev/null 2>&1; then
        printf "%s\n" '
            # Use our custom lint-selections wrapper to lint Kakoune plugins.
            hook global WinSetOption filetype=kak %{
                alias window lint shellcheck-shell-blocks

                hook -once -always window WinSetOption filetype=.* %{
                    unalias window lint
                }
            }

            # Use shellcheck as-is when linting shell scripts.
            hook global WinSetOption filetype=sh %{
                set-option window lintcmd "shellcheck -f gcc"

                hook -once -always window WinSetOption filetype=.* %{
                    unset-option window lintcmd
                }
            }
        '
    else
        printf "echo -debug shellcheck not found in PATH"
    fi
}
