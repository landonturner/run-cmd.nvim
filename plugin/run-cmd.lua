if vim.fn.has("nvim-0.7.0") ~= 1 then
	vim.api.nvim_err_writeln("run-cmd requires at least nvim-0.7.0.")
	return
end

local function is_tmux_available()
	vim.fn.system("which tmux")
	return vim.v.shell_error == 0
end

if not is_tmux_available() then
	vim.api.nvim_err_writeln("tmux is not installed")
	return
end
