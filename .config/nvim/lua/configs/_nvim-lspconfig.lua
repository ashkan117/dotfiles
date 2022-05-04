local present1, lspconfig = pcall(require, "lspconfig")
-- local present2, lspinstall = pcall(require, "lspinstall")
local present1, lspinstall = pcall(require, "nvim-lsp-installer")
if not present1 then
	return
end

if not present2 then
	return
end

-- local function on_attach(client, bufnr)
-- 	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
--
-- 	local opts = { noremap = true, silent = true }
--
-- 	local function buf_set_keymap(...)
-- 		vim.api.nvim_buf_set_keymap(bufnr, ...)
-- 	end
--
-- 	-- Set some keybinds conditional on server capabilities
-- 	-- if client.resolved_capabilities.document_formatting then
-- 	--     buf_set_keymap("n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
-- 	-- elseif client.resolved_capabilities.document_range_formatting then
-- 	--     buf_set_keymap("n", "<space>fm", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
-- 	-- else
-- 	--     buf_set_keymap("n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
-- 	-- end
-- end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- lspInstall + lspconfig stuff
local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(clients)
      -- filter out clients that you don't want to use
      return vim.tbl_filter(function(client)
        return client.name ~= "tsserver"
      end, clients)
    end,
    bufnr = bufnr,
  })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end


local function setup_servers()
    lspinstall.setup()
    local servers = lspinstall.installed_servers()

    for _, lang in pairs(servers) do
      require('lspconfig')[lang].setup {
        on_attach = on_attach
      }
    end
end

setup_servers()


-- replace the default lsp diagnostic symbols
function lspSymbol(name, icon)
	vim.fn.sign_define("LspDiagnosticsSign" .. name, { text = icon, numhl = "LspDiagnosticsDefaul" .. name })
end

lspSymbol("Error", "")
lspSymbol("Warning", "")
lspSymbol("Information", "")
lspSymbol("Hint", "")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = {
		prefix = "",
		spacing = 0,
	},
	signs = true,
	underline = true,

	-- set this to true if you want diagnostics to show in insert mode
	update_in_insert = false,
})

-- suppress error messages from lang servers
vim.notify = function(msg, log_level, _opts)
	if msg:match("exit code") then
		return
	end
	if log_level == vim.log.levels.ERROR then
		vim.api.nvim_err_writeln(msg)
	else
		vim.api.nvim_echo({ { msg } }, true, {})
	end
end
