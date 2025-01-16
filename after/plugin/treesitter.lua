require"nvim-treesitter.configs".setup {
  ensure_installed = {
    "go", "lua", "json", "vim", "vimdoc",
    "tsx", "css", "rust", "typescript",
    "javascript", "html", "python", "c", "zig"
  },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  autotag = { enable = true }
}

-- configure tsx setup
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
