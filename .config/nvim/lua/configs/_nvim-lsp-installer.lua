local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
        local opts = {}


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

  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  opts.on_attach = function(client, bufnr)
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
--
--   -- (optional) Customize the options passed to the server
--   -- if server.name == "volar" then
--   -- 	opts.filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" }
--   -- 	-- opts.on_attach = function(client)
--     -- 	-- 	client.resolved_capabilities.document_formatting = false
--     -- 	-- 	client.resolved_capabilities.document_range_formatting = false
--     -- 	-- end
--     -- end
--     -- -- (optional) Customize the options passed to the server
--     -- if server.name == "tsserver" then
--     -- 	opts.filetypes = { "typescript", "javascript" }
--     -- 	opts.on_attach = function(client)
--       -- 		client.resolved_capabilities.document_formatting = false
--       -- 		client.resolved_capabilities.document_range_formatting = false
--       -- 	end
--       -- end
--
--       -- This setup() function is exactly the same as lspconfig's setup function.
--       -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/ADVANCED_README.md
      server:setup(opts)
    end)
