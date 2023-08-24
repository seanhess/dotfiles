return {
  {
    "Vigemus/iron.nvim",
    config = function(_, opts)
      local view = require("iron.view")
      local iron = require("iron.core")

      iron.setup({
        config = {
          -- Whether a repl should be discarded or not
          scratch_repl = true,
          -- Your repl definitions come here
          repl_definition = {
            sh = {
              -- Can be a table or a function that
              -- returns a table (see below)
              command = { "zsh" },
            },
            haskell = {
              command = function(meta)
                local file = vim.api.nvim_buf_get_name(meta.current_bufnr)
                -- call `require` in case iron is set up before haskell-tools
                return require("haskell-tools").repl.mk_repl_cmd(file)
              end,
            },
          },
          -- How the repl window will be displayed
          -- See below for more information
          repl_open_cmd = view.split.vertical.botright(),
          -- repl_open_cmd = "topright vertical 50% split",
        },
        -- Iron doesn't set keymaps by default anymore.
        -- You can set them here or manually add keymaps to the functions in iron.core
        keymaps = {
          -- send_motion = "<leader>sc",
          -- visual_send = "<leader>r<CR>",
          -- send_file = "<leader>sf",
          -- send_line = "<leader>sl",
          -- send_until_cursor = "<leader>su",
          send_mark = "<leader>r<CR>",
          -- mark_motion = "<leader>mc",
          mark_visual = "<leader>r<CR>",
          -- remove_mark = "<leader>md",
          -- cr = "<leader>s<cr>",
          -- interrupt = "<leader>s<space>",
          -- exit = "<leader>sq",
          -- clear = "<leader>cl",
        },
        -- If the highlight is on, you can change how it looks
        -- For the available options, check nvim_set_hl
        highlight = {
          italic = true,
        },
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      })

      -- iron also has a list of commands, see :h iron-commands for all available commands
      vim.keymap.set("n", "<space>rr", "<cmd>IronRepl<cr>")
      vim.keymap.set("n", "<space>rs", "<cmd>IronRestart<cr>")
      -- vim.keymap.set("n", "<space>rh", "<cmd>IronHide<cr>")

      -- in terminal mode, map it to close the repl
      -- vim.keymap.set("t", "<space>rr", "<cmd>quit<cr>")
    end,
    opts = {},
  },
}
