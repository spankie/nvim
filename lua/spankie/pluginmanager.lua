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
  {
    "folke/trouble.nvim", -- shows the disgnostics (errors) at the bottom of the page
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  "folke/which-key.nvim", -- show suggestions for command you have started typing
  -- { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",    -- Neovim setup for init.lua and plugin development
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "BurntSushi/ripgrep",
      "nvim-lua/plenary.nvim",
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },
  "navarasu/onedark.nvim",
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { 'fatih/vim-go',                    build = ':GoUpdateBinaries' },
  -- "nvim-treesitter/playground"
  "mbbill/undotree", -- not sure of this yet
  "tpope/vim-fugitive",
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = false,
    -- config = false,
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },           -- Required
      { 'williamboman/mason.nvim' },         -- Optional (If you don't install mason.nvim then you'll need to list the LSP servers you have installed using .setup_servers().
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },   -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },   -- Required
    }
  },
  { 'wakatime/vim-wakatime', lazy = false },
  "airblade/vim-gitgutter",
  "tpope/vim-surround",       -- not working at the moment
  "scrooloose/nerdcommenter", -- check the docs (for remap): https://vimawesome.com/plugin/the-nerd-commenter
})
