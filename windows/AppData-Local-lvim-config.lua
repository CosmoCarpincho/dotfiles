-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Enable powershell as your default shell
vim.opt.shell = "pwsh.exe"
vim.opt.shellcmdflag =
  "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd [[
		let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		set shellquote= shellxquote=
  ]]

-- Set a compatible clipboard manager
vim.g.clipboard = {
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
}


-- lvim.plugins = {
--   { "MeanderingProgrammer/render-markdown.nvim" },
--   {
--     "MeanderingProgrammer/render-markdown.nvim",
--     config = function()
--     end,
--     dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
--     -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
--     -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
--     ---@module 'render-markdown'
--     ---@type render.md.UserConfig
--     opts = {},
--   }
-- }
--

-- lvim.plugins = {
--   {"nvim-treesitter/nvim-treesitter"},
--   {
--     "nvim-treesitter/nvim-treesitter",
--     config = function ()
--       require("nvim-treesitter.configs").setup {
--         ensure_installed = { "nu" },
--       }
--     end,
--     dependencies = {
--       { "nushell/tree-sitter-nu"}
--     }
--   }
-- }
--

lvim.plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "nu" },
        highlight = {
          enable = true,
        },
      --   textobjects = {
      --     select = {
      --       enable = true,
      --       keymaps = {
      --         -- Keymaps para Nushell
      --         ["aP"] = "@pipeline.outer",
      --         ["iP"] = "@pipeline.inner",
      --         -- Keymaps generales
      --         ["af"] = "@function.outer",
      --         ["if"] = "@function.inner",
      --         ["al"] = "@loop.outer",
      --         ["il"] = "@loop.inner",
      --         ["aC"] = "@conditional.outer",
      --         ["iC"] = "@conditional.inner",
      --         ["iS"] = "@statement.inner",
      --         ["aS"] = "@statement.outer",
      --       },
      --     },
      --   },
      }
    end,
    dependencies = {
      { "nushell/tree-sitter-nu" },
    },
    build = ":TSUpdate",
  },
}

lvim.transparent_window = true

-- Para tener le hover como en visual code
lvim.lsp.buffer_mappings.normal_mode["gh"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "LSP Hover"}
