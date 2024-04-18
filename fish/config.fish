if status is-interactive
	set -g fish_greeting

	fish_add_path /home/usr/.system/scripts/ -pP

	starship init fish | source
	zoxide init fish | source

	fish_config theme choose rose-pine

	# test $TERM != "tmux-256color"; and exec tmux

	if type -q wget
		alias wget="wget --hsts-file=\"$XDG_DATA_HOME/wget-hsts\""
	end

	abbr --position command --add s sudo 
	abbr --position command --add c clear
	abbr --position command --add l exa
	abbr --position command --add ll exa -1la
	abbr --position command --add v nvim

	# alias v open_nvim

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

function open_nvim
	kitty @ set-spacing padding=0
	nvim $argv
	kitty @ set-spacing padding=default
end




