if vim.fn.has("nvim-0.7.0") ~= 1 then
	vim.api.nvim_err_writeln("Your plugin requires at least nvim-0.7.0.")
	return
end
