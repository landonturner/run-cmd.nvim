--
local wk = require("which-key")
local icons = require("which-key/icons")

local M = {}

local function tmux_command(command)
	local tmux_socket = vim.fn.split(vim.env.TMUX, ",")[1]
	return vim.fn.system("tmux -S " .. tmux_socket .. " " .. command)
end

local function run_command_in_pane(command)
	tmux_command("send-keys -t right C-c " .. command .. " C-m")
end

local function run_last_command()
	run_command_in_pane("\\!\\!")
end

local function run_jest_test()
	local current_file = vim.api.nvim_buf_get_name(0)
	run_command_in_pane("jest\\ " .. current_file)
end

function M.setup()
	wk.add({
		{ "<leader>r", group = "Run Command", icon = icons.get_icon("zsh") },
		{
			"<leader>rl",
			function()
				run_last_command()
			end,
			desc = "Run Last Command",
			icon = "󱈸󱈸",
		},
		{
			"<leader>rj",
			function()
				run_command_in_pane("jest")
			end,
			desc = "Run Jest",
			icon = "󰙨",
		},
		{
			"<leader>rt",
			function()
				run_jest_test()
			end,
			desc = "Run Current Test",
			icon = "󰙨",
		},
	})
end

return M
