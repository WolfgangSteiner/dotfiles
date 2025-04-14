-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- indentation
vim.cmd("set noexpandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- disable line numbers
vim.cmd("set nonumber")
vim.cmd("set norelativenumber")

vim.o.shell = "fish"

-- keymap
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})

vim.api.nvim_create_user_command('VS', function()
  vim.cmd('vsplit')
  builtin.find_files()
end, {})

require("ccls").setup({lsp = {use_defaults = true}})


-- vim.g.bld_cmd = 'echo "Hello World!"'
-- 
-- function run_build()
    -- local build_command = "bash -c './bld'"
    -- local term_buf = vim.api.nvim_create_buf(false, true)
    -- local term_win = vim.api.nvim_open_win(term_buf, true, {
        -- relative = 'editor',
        -- width = math.floor(vim.o.columns * 0.9), -- 80% of the columns
        -- height = math.floor(vim.o.lines * 0.9),  -- 80% of the lines
        -- row = math.floor(vim.o.lines * 0.0),     -- 10% from the top
        -- col = math.floor(vim.o.columns * 0.05),   -- 10% from the left
        -- style = 'minimal',
        -- border = 'single',
    -- })
    -- vim.fn.termopen(vim.g.bld_cmd, {
        -- --on_exit = function(job_id, exit_code, event_type)
            -- -- Close the terminal window on exit
        -- --    vim.api.nvim_win_close(term_win, true)
        -- --end,
        -- on_exit = function(_, exit_code, _)
            -- if exit_code == 0 then
            -- -- Close the terminal window when Esc is pressed
                -- vim.defer_fn(
                    -- function() 
                        -- vim.api.nvim_win_close(term_win, true)
                    -- end,
                    -- 1000)
            -- end
        -- end
    -- })
    -- vim.api.nvim_buf_set_keymap(term_buf, 'n', '<Esc>', [[:q<CR>]], { noremap = true, silent = true })
-- end
-- 
-- -- Map F1 to execute the build script function
-- vim.api.nvim_set_keymap('n', '<F1>', [[:lua run_build()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<F2>', [[:cexpr system("./bld")<CR>]], { noremap = true, silent = true })
-- -- The line beneath this is called `modeline`. See `:help modeline`
-- -- vim: ts=2 sts=2 sw=2 et
-- --
-- -- vim.o.errorformat = vim.o.errorformat .. ",%-G[TEST]%m,%-G[INFO]%m,%-G%[^.]....%m"
-- 
-- -- configure floaterm panes
-- vim.api.nvim_set_var('floaterm_borderchars', "        ")
-- vim.api.nvim_set_var('floaterm_width', 0.95)
-- vim.api.nvim_set_var('floaterm_height', 0.95)
-- 
-- vim.cmd("FloatermNew --silent --name=lazygit --position=center --autoclose=2 lazygit")
-- function show_lazygit()
    -- vim.cmd("FloatermToggle lazygit")
-- end
-- vim.api.nvim_set_keymap('n', '<F12>', '<Cmd>lua show_lazygit()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('t', '<F12>', '<Cmd>lua show_lazygit()<CR>', { noremap = true, silent = true })
-- -- Map <F11> to toggle terminal
-- vim.cmd("FloatermNew --silent --name=zsh --position=center --autoclose=2 zsh")
-- function show_zsh()
    -- vim.cmd("FloatermToggle zsh")
-- end
-- vim.api.nvim_set_keymap('n', '<F11>', '<Cmd>lua show_zsh()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('t', '<F11>', '<Cmd>lua show_zsh()<CR>', { noremap = true, silent = true })
-- 
-- -- Map <F12> to toggle lazygit
-- vim.cmd("FloatermNew --silent --name=lazygit --position=center --autoclose=2 lazygit")
-- function show_lazygit()
    -- vim.cmd("FloatermToggle lazygit")
-- end
-- vim.api.nvim_set_keymap('n', '<F12>', '<Cmd>lua show_lazygit()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('t', '<F12>', '<Cmd>lua show_lazygit()<CR>', { noremap = true, silent = true })
-- 
