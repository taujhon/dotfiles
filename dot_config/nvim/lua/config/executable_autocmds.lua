-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local agrp = vim.api.nvim_create_augroup
local acmd = vim.api.nvim_create_autocmd

local function nvim_generate_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    local au_group = agrp(group_name, { clear = true })
    for _, v in pairs(definition) do
      acmd(v.event, {
        pattern = v.pattern,
        command = v.command,
        callback = v.callback,
        group = au_group,
      })
    end
  end
end

local set_aufmt = function(pattern, state)
  return {
    event = { "FileType" },
    pattern = pattern,
    callback = function()
      vim.b.autoformat = state
    end
  }
end

local autoCommands = {
  general = {
    {
      event = { "InsertLeave", "TextChanged" },
      pattern = "*",
      callback = function()
        if vim.g.autosave then
          local buf = vim.api.nvim_get_current_buf()
          vim.api.nvim_buf_call(buf, function()
            vim.cmd("write")
            -- vim.cmd("silent! write")
            -- vim.print("Saved")
          end)
        end
      end
    }
  },
  project = {
  },
  filetype = {
    {
      event = { "FileType" },
      pattern = "markdown",
      callback = function()
        vim.opt.shiftwidth = 2
        vim.opt_local.spell = false
      end,
    },
  },
  autoformat = {
    set_aufmt({ "lua" }, false),
  }
}

nvim_generate_augroups(autoCommands)
