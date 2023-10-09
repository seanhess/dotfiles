return {
  { "nvim-telescope/telescope-file-browser.nvim" },

  -- {
  --   "stevearc/oil.nvim",
  --   opts = {
  --     delete_to_trash = true,
  --     trash_command = "trash",
  --
  --     view_options = {
  --       show_hidden = true,
  --     },
  --
  --     keymaps = {
  --       ["g?"] = "actions.show_help",
  --       ["<CR>"] = "actions.select",
  --       -- ["<C-s>"] = "actions.select_vsplit",
  --       ["<C-h>"] = "actions.select_split",
  --       ["<C-t>"] = "actions.select_tab",
  --       ["<C-p>"] = "actions.preview",
  --       -- ["q"] = "actions.close",
  --       -- ["<C-c>"] = "actions.close",
  --       ["<C-l>"] = "actions.refresh",
  --       ["-"] = "actions.parent",
  --       ["_"] = "actions.open_cwd",
  --       ["`"] = "actions.cd",
  --       ["~"] = "actions.tcd",
  --       ["gs"] = "actions.change_sort",
  --       ["gx"] = "actions.open_external",
  --       ["g."] = "actions.toggle_hidden",
  --     },
  --     use_default_keymaps = false,
  --   },
  --
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  -- },

  {
    "echasnovski/mini.files",
    opts = {
      windows = {
        preview = true,
        width_focus = 40,
        width_preview = 40,
      },
      mappings = {
        close = "q",
        go_in = "",
        go_in_plus = "<CR>",
        go_out = "-",
        go_out_plus = "H",
        reset = "<BS>",
        -- reveal_cwd = "@",
        -- show_help = "g?",
        synchronize = " ",
        -- trim_left = "<",
        -- trim_right = ">",
      },
      options = {
        -- Whether to use for editing directories
        -- Disabled by default in LazyVim because neo-tree is used for that
        use_as_default_explorer = true,
      },
    },
    keys = {
      {
        "<leader>fm",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (directory of current file)",
      },
      {
        "-",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (directory of current file)",
      },
      {
        "<leader>fM",
        function()
          require("mini.files").open(vim.loop.cwd(), true)
        end,
        desc = "Open mini.files (cwd)",
      },
    },
    config = function(_, opts)
      require("mini.files").setup(opts)

      local show_dotfiles = true
      local filter_show = function(fs_entry)
        return true
      end
      local filter_hide = function(fs_entry)
        return not vim.startswith(fs_entry.name, ".")
      end

      local toggle_dotfiles = function()
        show_dotfiles = not show_dotfiles
        local new_filter = show_dotfiles and filter_show or filter_hide
        require("mini.files").refresh({ content = { filter = new_filter } })
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id
          -- Tweak left-hand side of mapping to your liking
          vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id })
        end,
      })
    end,
  },
}
