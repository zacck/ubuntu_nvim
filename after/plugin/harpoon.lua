local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file) -- ad a file 
vim.keymap.set("n", "<leader>R", mark.clear_all) -- remove all files

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end) -- go to file 1 

vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end) -- go to 2 

vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end) -- go to 3 

vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)  -- go to 4

-- Delete support in quick menu 
local function toggle_quick_menu_with_delete()
	ui.toggle_quick_menu()

	vim.defer_fn(function()
		if vim.bo.filetype == "harpoon" then 
			vim.keymap.set("n", "d", function()
				local cursor = vim.api.nvim_win_get_cursor(0)
				local line = cursor[1] 
				if line  > 0 then 
					mark.rm_file(line)
					--refresh 
					ui.toggle_quick_menu()
					ui.toggle_quick_menu()
				end 
			end, { buffer = true, desc = "Remove file from Harpoon list"})
		end
	end, 50)
end
vim.keymap.set("n", "<C-e>", toggle_quick_menu_with_delete, {desc = "Harpoon menu with delete" })
