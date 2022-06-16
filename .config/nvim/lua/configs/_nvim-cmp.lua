local cmp = require("cmp")
local lspkind = require("lspkind")
lspkind.init()

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = false, cmp.ConfirmBehavior.Insert }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip", option = { use_show_condition = false } },
    { name = "buffer", keyword_length = 5 },
  }),
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
      },
    }),
  },
})

-- Use buffer source for `/`.
cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

-- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- require('lspconfig')[%YOUR_LSP_SERVER%].setup {
--   capabilities = capabilities
-- }

local source = {}

source.new = function()
  local json_decode = vim.fn.json_decode
  if vim.fn.has("nvim-0.6") == 1 then
    json_decode = vim.json.decode
  end
  return setmetatable({
    running_job_id = 0,
    timer = vim.loop.new_timer(),
    json_decode = json_decode,
  }, { __index = source })
end

---Return this source is available in current context or not. (Optional)
---@return boolean
function source:is_available()
  return true
end

---Return the debug name of this source. (Optional)
---@return string
function source:get_debug_name()
  return "debug name"
end

---Return keyword pattern for triggering completion. (Optional)
---If this is ommited, nvim-cmp will use default keyword pattern. See |cmp-config.completion.keyword_pattern|
---@return string
function source:get_keyword_pattern()
  return [[\k\+]]
end

---Return trigger characters for triggering completion. (Optional)
function source:get_trigger_characters()
  return { "." }
end

---Invoke completion. (Required)
---@param params cmp.SourceCompletionApiParams
---@param callback fun(response: lsp.CompletionResponse|nil)
function source:complete(params, callback)
  callback({
    { label = "January" },
    { label = "February" },
    { label = "March" },
    { label = "April" },
    { label = "May" },
    { label = "June" },
    { label = "July" },
    { label = "August" },
    { label = "September" },
    { label = "October" },
    { label = "November" },
    { label = "December" },
  })
end

---Resolve completion item. (Optional)
---@param completion_item lsp.CompletionItem
---@param callback fun(completion_item: lsp.CompletionItem|nil)
function source:resolve(completion_item, callback)
  callback(completion_item)
end

---Execute command after item was accepted.
---@param completion_item lsp.CompletionItem
---@param callback fun(completion_item: lsp.CompletionItem|nil)
function source:execute(completion_item, callback)
  callback(completion_item)
end

---Register custom source to nvim-cmp.
cmp.register_source("month", source.new())
