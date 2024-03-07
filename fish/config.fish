if status is-interactive
	starship init fish | source
	set -g fish_greeting

	alias wget="wget --hsts-file=\"$XDG_DATA_HOME/wget-hsts\""

	abbr --position command --add s sudo 
	abbr --position command --add c clear
	abbr --position command --add v nvim
	abbr --position command --add l exa
	abbr --position command --add ll exa -1la
end

function fish_greeting
	# /.system/scripts/ufetch
	nerdfetch
end

fish_config theme choose rose-pine

fish_add_path /home/usr/.system/scripts/ -P
zoxide init fish | source
