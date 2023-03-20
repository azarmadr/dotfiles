local config = {
  options = {
    opt = {
      relativenumber = true,
      title = true,
      gfn = "Fira Code:h7",
      fileignorecase = true,
      wrap = true,
      linebreak = true,
    },
    g = {
      neovide_scale_factor = 0.72,
      autoformat_enabled = false,
    },
  },

  lsp = {
    formatting = {
      format_on_save = {
        enabled = false,
        allow_filetypes = {},
        ignore_filetypes = {"rust"},
      },
      disabled = {},
    },
    ["server-settings"] = {
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            imports = {
              granularity = {
                group = "module",
              },
              prefix = "self",
            },
            cargo = {
              features = "all",
              buildScripts = {
                enable = true,
              },
            },
            procMacro = {
              enable = true,
            },
            checkOnSave = {
              features = "all",
            },
          },
        },
      },
    },
  },

  plugins = {
    init = {
      { "junegunn/vim-easy-align" },
      {
        "beauwilliams/focus.nvim",
        config = function() require("focus").setup() end,
      },
    },
    bufferline = { options = { numbers = "buffer_id" } },
  },

  polish = function()
    vim.keymap.set({ "n", "v" }, ";", ":")
    vim.keymap.set({ "n" }, "<tab>", "<c-^>")
    vim.keymap.set({ "n", "i" }, "<c-s>", "<esc>:wa<cr>")
    vim.keymap.set({ "n", "v" }, "ga", "<Plug>(EasyAlign)")
  end,
}

return config
