-- Telescope fuzzy finding (all the things)
return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			-- "nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
			-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-u>"] = false,
							["<C-d>"] = false,
						},
					},
				},
			})

			-- Enable telescope fzf native, if installed
			pcall(require("telescope").load_extension, "fzf")

			local map = require("helpers.keys").map
			map("n", "<leader>fr", require("telescope.builtin").oldfiles, "Search recently opened")
			map("n", "<leader><space>", require("telescope.builtin").buffers, "Search open buffers")
			map("n", "<leader>/", function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, "Search in current buffer")

			map("n", "<leader>sf", require("telescope.builtin").find_files, "Search files")
			map("n", "<leader>sp", require("telescope.builtin").git_files, "Search project files")
			map("n", "<leader>sh", require("telescope.builtin").help_tags, "Search help")
			map("n", "<leader>sw", require("telescope.builtin").grep_string, "Search current word")
			map("n", "<leader>sg", require("telescope.builtin").live_grep, "Grep current buffer")
			map("n", "<leader>sd", require("telescope.builtin").diagnostics, "Search diagnostics")
			map("n", "<leader>sk", require("telescope.builtin").keymaps, "Search keymaps")
		end,
	},
}
