if true then
  return {}
else
  return {
    "lmburns/lf.nvim",
    cmd = "Lf",
    dependencies = { "nvim-lua/plenary.nvim", "akinsho/toggleterm.nvim" },
    opts = {
      winblend = 0,
      highlights = { NormalFloat = { guibg = "NONE" } },
      border = "single",
      escape_quit = true,
    },
    keys = {
      { "<Leader>F", "<Cmd>Lf<CR>", desc = "lf" },
    },
  }
end
