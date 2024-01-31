local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- I think this specifies the plugins you want and installs them.
-- Example using a list of specs with the default options
-- vim.apleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  "folke/which-key.nvim", -- show suggestions for command you have started typing
  -- { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim", -- Neovim setup for init.lua and plugin development
  { "nvim-telescope/telescope.nvim", tag = "0.1.5", dependencies = { "nvim-lua/plenary.nvim" } }
})
