if status is-interactive
	starship init fish | source
	set -g fish_greeting

	alias wget="wget --hsts-file=\"$XDG_DATA_HOME/wget-hsts\""

	abbr --position anywhere --add s sudo 
	abbr --position anywhere --add v nvim
	abbr --position anywhere --add l exa
	abbr --position anywhere --add ll exa -1la
end

function fish_greeting
	# /.system/scripts/ufetch
	nerdfetch
end

fish_config theme choose rose-pine

fish_add_path /home/usr/.system/scripts/ -P
zoxide init fish | source
