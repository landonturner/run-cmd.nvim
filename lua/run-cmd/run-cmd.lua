--
local wk = require("which-key")
local icons = require("which-key/icons")

local M = {}

local function tmux_command(command)
	local tmux_socket = vim.fn.split(vim.env.TMUX, ",")[1]
	return vim.fn.system("tmux -S " .. tmux_socket .. " " .. command)
end

local function run_last_command()
	tmux_command("send-keys -t right C-c \\!\\! C-m")
end

function M.setup()
	print("Running setup now")
	wk.add({
		{ "<leader>r", group = "Run Command", icon = icons.get_icon("zsh") },
		{
			"<leader>rl",
			function()
				run_last_command()
			end,
			desc = "Run Last Command",
		},
	})
end

return M
