local capabilities = require("blink.cmp").get_lsp_capabilities()
local servers = {
  lua_ls = {
    cmd = { "lua-language-server" },
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
        diagnostics = { disable = { "missing-fields" } },
      },
    },
  },
  pyright = {},
  bashls = {},
  jsonls = {},
  -- intelephense = {},
  rust_analyzer = {},
  marksman = {},
  phpactor = {},
  tinymist = {
    -- settings = {
    --   rootPath = vim.fn.getcwd(),
    -- },
  },
  hyprls = {},
}
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
  "stylua", -- Used to format Lua code
})
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
require("mason-lspconfig").setup({
  ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
  automatic_installation = false,
  automatic_enable = true,
  handlers = {
    function(server_name)
      local server = servers[server_name] or {}
      server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
      require("lspconfig")[server_name].setup(server)
    end,
  },
})
