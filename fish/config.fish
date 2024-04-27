if status is-interactive
	set -g fish_greeting
	
	set -x USER_SYSTEM_PATH "$HOME/system/"

	fish_add_path $USER_SYSTEM_PATH/scripts/ -pP
	fish_add_path $USER_SYSTEM_PATH/apps/ -pP

  if test "$TERM" = "xterm-kitty"
    alias ssh="kitten ssh"
  end

	starship init fish | source
	zoxide init fish | source

	fish_config theme choose rose-pine

	# test $TERM != "tmux-256color"; and exec tmux

	if type -q wget
		alias wget="wget --hsts-file=\"$XDG_DATA_HOME/wget-hsts\""
	end

	abbr --add s sudo 
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
	# /.system/scripts/ufetch
	nerdfetch
end


