if status is-interactive
	set -g fish_greeting
	
	set -x USER_SYSTEM_PATH "$HOME/system/"

	fish_add_path $USER_SYSTEM_PATH/scripts/ -pP
	fish_add_path $USER_SYSTEM_PATH/apps/ -pP

  if test "$TERM" = "xterm-kitty"
    alias ssh="kitten ssh"
  end

	starship init fish | source
  enable_transience

	zoxide init fish | source

  # fish_config theme choose rose-pine
  theme_gruvbox dark medium

	# test $TERM != "tmux-256color"; and exec tmux

	if type -q wget
		alias wget="wget --hsts-file=\"$XDG_DATA_HOME/wget-hsts\""
	end

	abbr --add s sudo 
  abbr --add t task
	abbr --add c clear
	abbr --add l exa
	abbr --add ll exa -1la
	abbr --add v nvim
	abbr --add rm trash-put

	fish_vi_key_bindings
	set fish_cursor_default block # normal & visual mode
	set fish_cursor_insert block
	# set fish_cursor_replace_one underscore
	# set fish_cursor_replace underscore
end

function fish_greeting
	# ~/.system/scripts/ufetch
	nerdfetch
  # echo -ne "\n"
  # curl -f 'wttr.in/Orléans?format=%c%C+at+%f'
  # echo -ne "\n\n"
  # backup-status.sh
end

# function yy
# 	set tmp (mktemp -t "yazi-cwd.XXXXXX")
# 	yazi $argv --cwd-file="$tmp"
# 	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
# 		cd -- "$cwd"
# 	end
# 	rm -f -- "$tmp"
# end

# Created by `pipx` on 2024-05-02 23:15:08
set PATH $PATH /home/usr/.local/bin
