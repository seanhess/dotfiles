-- local function get_python_path(workspace)
--   local util = require("lspconfig/util")
--   local path = util.path
--   -- Use activated virtualenv.
--   if vim.env.VIRTUAL_ENV then
--     return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
--   end
--
--   -- Find and use virtualenv in workspace directory.
--   for _, pattern in ipairs({ "*", ".*" }) do
--     local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
--     if match ~= "" then
--       return path.join(path.dirname(match), "bin", "python")
--     end
--   end
--
--   -- Fallback to system Python.
--   return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
-- end

return {
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {
          autoImportCompletion = true,
        },
      },
    },
  }

  -- WARNING: overriding config disables haskell auto-format for some reason
  --   config = function(opts)
  --     local lsp = require('lspconfig')
  --     lsp.hls.setup({
  --       settings {
  --         formattingProvider = "fourmolu"
  --       }
  --     })
  --     lsp.pyright.setup({
  --       before_init = function(_, config)
  --         local python_path = get_python_path(config.root_dir)
  --         config.settings.python.pythonPath = python_path
  --         vim.g.python_host_prog = python_path
  --         vim.g.python3_host_prog = python_path
  --       end,
  --     })
  --   end,
  -- },
}
-- return {}
