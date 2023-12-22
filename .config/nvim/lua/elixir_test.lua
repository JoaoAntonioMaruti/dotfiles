local notify = require("utils.notify")

local M = {}
M._name = "elixir"
M._current_win = vim.api.nvim_get_current_win()

function M.is_test_file()
    local current_file_name = vim.fn.expand('%:t')
    return current_file_name:match('_test%.exs$') ~= nil
end

function M.replace_lib_with_test(path)
    local replaced_string = string.gsub(path, "lib", "test")
    return string.gsub(replaced_string, ".ex", "_test.exs")
end

function M.generate_module_name(file_content)
    local first_line = file_content:match("[^\r\n]+")
    first_line = first_line:gsub("defmodule", "")
    first_line = first_line:gsub(" do", "")
    first_line:gsub("%s+", "")

    local module_name = first_line .. "Test"
    return module_name
end

function M.create_directories(path)
    local dir = path:match("(.*[/\\])")
    if dir and vim.fn.isdirectory(dir) == 0 then
        vim.fn.mkdir(dir, "p")
    end
end

function M.create_test_file(test_file, module_name)
    M.create_directories(test_file)

    local file = io.open(test_file, "w")
    local file_content = [[
defmodule]] .. module_name .. [[ do

end]]

    file:write(file_content)
    file:close()
end

function M.ask_to_create_test_file(test_file, module_name)
    local input = vim.fn.input(
        "The test file does not exist. Do you want to create in " .. test_file .. "? [Y]es, [N]o: ",
        "",
        "customlist,Y,N"
    )

    if input:lower() == "y" then
        M.create_test_file(test_file, module_name)

        vim.fn.feedkeys("\\<CR>")
        vim.api.nvim_command(':vsp ' .. test_file)
        return 0
    end
    vim.cmd("redraw!")
    notify.info("File creation canceled.", M)
end

function M.go_to_test(opts)
    local current_file = vim.fn.expand('%:p')
    local test_file = M.replace_lib_with_test(current_file)

    if M.is_test_file() then
        notify.warn("The file is already a test", M)
        return 0
    end
    if vim.fn.filereadable(test_file) == 0 then
        local file_content = vim.fn.readfile(current_file)[1] or ""
        local module_name = M.generate_module_name(file_content)

        M.ask_to_create_test_file(test_file, module_name)
        return 0
    end

    vim.api.nvim_command(':vsp ' .. test_file)
    return 0
end

return M
