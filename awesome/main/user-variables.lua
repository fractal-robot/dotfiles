local _M = {
	terminal = "kitty",
	editor = os.getenv("EDITOR"),
	modkey = "Mod4",
}

_M.editor_cmd = _M.terminal .. _M.editor

return _M
