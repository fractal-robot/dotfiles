# Set XDG variables
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_STATE_HOME "$HOME/.local/state"
set -x XDG_CACHE_HOME "$HOME/.cache"

# Set other variables 
set -x EDITOR "/bin/nvim"

set -x HISTFILE "$XDG_STATE_HOME/bash/history"
set -x CARGO_HOME "$XDG_DATA_HOME/cargo"
set -x CUDA_CACHE_PATH "$XDG_CACHE_HOME/nv"
set -x GNUPGHOME "$XDG_DATA_HOME/gnupg"
set -x GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
set -x LESSHISTFILE "$XDG_STATE_HOME/less/history"
set -x GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
set -x _JAVA_OPTIONS -Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
set -x XAUTHORITY "$XDG_RUNTIME_DIR/Xauthority"
set -x GOPATH "$XDG_DATA_HOME/go"
set -x GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
