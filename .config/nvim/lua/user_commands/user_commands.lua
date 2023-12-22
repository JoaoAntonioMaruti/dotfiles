local script_dir = vim.fn.expand("<sfile>:p:h")
package.path = script_dir .. "/../;" .. package.path

local elixir_test = require("elixir_test")

local M = {}

M._name = "user_commands"
function M.execute_diff()
  vim.cmd("cnoreabbrev diff Diff")

  vim.api.nvim_command(':DiffviewOpen')
end

function M.go_to_test(opts)
  elixir_test.go_to_test(opts)
end

vim.api.nvim_create_user_command('Ex', function(opts)
 M.go_to_test(opts)
end, { nargs = '?' })

vim.api.nvim_create_user_command('Diff', M.execute_diff, { nargs = '?' })
