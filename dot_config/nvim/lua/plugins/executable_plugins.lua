return {
  {
    "L3MON4D3/LuaSnip",
    opts = function()
      require("luasnip.loaders.from_snipmate").lazy_load()
    end,
  },
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        ghost_text = { enabled = false, },
      },
      keymap = {
        ["<CR>"] = { "fallback" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {},
      },
      linters = {
        markdownlint = {
          args = { "--disable", "MD013", "--" },
        },
      },
    },
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   ---@class PluginLspOpts
  --   opts = {
  --     servers = {
  --       pyright = {},
  --       bashls = {},
  --       jsonls = {},
  --       rust_analyzer = {},
  --       marksman = {},
  --       phpactor = {},
  --       tinymist = {},
  --       hyprls = {},
  --       gdscript = {},
  --     },
  --   },
  -- },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(p)
        return not vim.tbl_contains({ "gitcommit" }, p)
      end, opts.ensure_installed)
      table.insert(opts.ensure_installed, "gdscript")
      table.insert(opts.ensure_installed, "godot_resource")
      table.insert(opts.ensure_installed, "gdshader")
      opts.highlight.enable = true
      opts.auto_install = false
    end,
    disable = function(_, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
  },
  {
    "folke/snacks.nvim",
    keys = {
      { "<Leader>fe", false },
      { "<Leader>fE", false },
      { "<Leader>e", false },
      { "<Leader>E", false },
    },
    opts = {
      explorer = { enabled = false },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        section_separators = {},
        component_separators = {}
      },
      sections = { lualine_z = {} }
    }
  }
}
