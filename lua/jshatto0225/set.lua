vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 8
vim.opt.softtabstop = 8
vim.opt.shiftwidth = 8
vim.opt.expandtab = false

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.cursorline = false

--vim.api.nvim_create_autocmd("VimEnter", {
--    pattern = "*",
--    command = "vsplit"
--})

vim.api.nvim_set_keymap('n', '<M-w>', ':wincmd w<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-j>', '/^\\s*$<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '?^\\s*$<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', 'b', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', 'w', { noremap = true, silent = true })

Path = vim.fn.getcwd()

function HandleCompilation()
    local buf_exists = false
    local bufname = "*compilation*"
    local bufnr = nil

    vim.api.nvim_command('wincmd w')

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        local name = vim.api.nvim_buf_get_name(buf)
        if name == Path .. "\\" .. bufname or name == Path .. "/" .. bufname then
            bufnr = buf
            buf_exists = true
            vim.api.nvim_set_current_buf(buf)
            break
        end
    end

    if buf_exists then
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {})
        vim.api.nvim_set_current_buf(bufnr)
    else
        bufnr = vim.api.nvim_create_buf(true, true)
        vim.api.nvim_buf_set_name(bufnr, bufname)
        vim.api.nvim_set_current_buf(bufnr)
    end

    local last_line = vim.api.nvim_buf_line_count(bufnr)

    local function on_stdout(_, data)
        if data then
            for _, line in ipairs(data) do
                local clean = string.gsub(line, "\r", "")
                vim.api.nvim_buf_set_lines(bufnr, last_line, last_line, false, {clean})
                last_line = last_line + 1
            end
        end
    end

    local function on_stderr(_, data)
        if data then
            for _, line in ipairs(data) do
                local clean = string.gsub(line, "\r", "")
                vim.api.nvim_buf_set_lines(bufnr, last_line, last_line, false, {clean})
                last_line = last_line + 1
            end
        end
    end

    local function on_exit(_, code)
        if code > 0 then
            vim.api.nvim_buf_set_lines(
                bufnr,
                last_line,
                last_line,
                false,
                { "********** Compilation Failed **********" }
            )

            vim.cmd("highlight Error guifg=#FF0000")
            local id = vim.api.nvim_create_namespace("error")
            vim.api.nvim_buf_add_highlight(bufnr, id, "Error", last_line, 0, -1)

        else
            vim.api.nvim_buf_set_lines(
                bufnr,
                last_line,
                last_line,
                false,
                { "********** Compilation Succeeded **********" }
            )

            vim.cmd("highlight Success guifg=#00FF00")
            local id = vim.api.nvim_create_namespace("success")
            vim.api.nvim_buf_add_highlight(
                bufnr,
                id,
                "Success",
                last_line,
                0,
                -1
            )
        end
    end

    vim.fn.jobstart('./build', {
        on_stdout = on_stdout,
        on_stderr = on_stderr,
        on_exit = on_exit,
        stdout_buffered = false,
        stderr_buffered = false
    })

    vim.api.nvim_command('wincmd w')
end

vim.api.nvim_set_keymap(
    'n',
    'm',
    ':lua HandleCompilation()<CR>',
    { noremap = true, silent = true }
)

--vim.api.nvim_create_autocmd("LspAttach", {
--  callback = function(args)
--    local client = vim.lsp.get_client_by_id(args.data.client_id)
--    client.server_capabilities.semanticTokensProvider = nil
--  end,
--});
