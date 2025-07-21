local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

local function replicate5(func)
  print("HI")
  func()
  func()
  func()
  func()
  func()
end

local function get_line_preview(filepath, lnum)
  -- Try to find an existing buffer for the file
  -- print("get_line_preview", filepath, lnum)
  local bufnr = vim.fn.bufnr(filepath)
  if bufnr ~= -1 and vim.api.nvim_buf_is_loaded(bufnr) then
    -- Get line from loaded buffer (0-indexed)
    local line = vim.api.nvim_buf_get_lines(bufnr, lnum - 1, lnum, false)[1]
    return line or ""
  else
    -- Get line from file on disk (1-indexed)
    local ok, lines = pcall(vim.fn.readfile, filepath)
    if ok then
      return lines[lnum] or ""
    else
      return "[unreadable file]"
    end
  end
end


local function add_mark(marks, mark, file, pos)
  local cwd = vim.fn.getcwd()
  if file:find(cwd, 1, true) and mark:match("^'[a-zA-Z]$") then
    local local_path = file:sub(#cwd + 2)
    table.insert(marks, {
      mark = mark:sub(2),
      file = local_path,
      line = pos[2],
      col = pos[3],
      -- bufnr = mark.pos[1],
    })
  end
end


local function bookmarks()
  local bufnr = vim.api.nvim_get_current_buf()


  local marks_all = vim.fn.getmarklist()
  local marks_buffer = vim.fn.getmarklist(bufnr)
  local bmarks = {}

  for _, m in ipairs(marks_buffer) do
    local currentfile = vim.fn.expand("%:p")
    add_mark(bmarks, m.mark, currentfile, m.pos)
  end


  for _, m in ipairs(marks_all) do
    -- local abs_path = vim.fn.fnamemodify(file, ":p")
    local abs_path = vim.fn.fnamemodify(m.file, ":p")
    add_mark(bmarks, m.mark, abs_path, m.pos)
  end

  pickers.new({}, {
    prompt_title = "Bookmarks",
    finder = finders.new_table({
      results = bmarks,
      entry_maker = function(mark)
        local preview = get_line_preview(mark.file, mark.line)
        local disp = string.format("%s %s:%d    %s", mark.mark, mark.file, mark.line, preview)
        return {
          value = mark,
          display = disp,
          ordinal = disp,
          filename = mark.file,
          lnum = mark.line,
          col = 0
        }
      end,
    }),
    previewer = conf.grep_previewer({}),
    sorter = conf.generic_sorter({}),
  }):find()
end

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {},
  config = function(opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- Nested mappings don't work in the maps list above!
    wk.add({

      { "//",         "<CMD>noh<CR>",                            desc = "Clear Search Highlight" },
      { "<C-s>",      "<CMD>w<CR>",                              desc = "Save Buffer" },
      { "<leader>ce", require("haskell-tools").lsp.buf_eval_all, desc = "Eval All CodeLenses" },
      { "<leader>q",  "<CMD>bd<CR>",                             desc = "Quit Buffer" },
      { "<leader>hr", require("haskell-tools").lsp.restart,      desc = "HLS Restart" },
      {
        group = "LSP",
        -- {
        --   "<leader>hs",
        --   function()
        --     require("telescope").extensions.hoogle.hoogle()
        --   end,
        --   desc = "Hoogle Search",
        -- },
        {
          "<leader>lr",
          desc = "LSP Restart",
          vim.lsp.restart
        },

      },
      {
        group = "Telescope",
        {
          "<leader>td",
          desc = "Diagnostics",
          require("telescope.builtin").diagnostics,
        },
        {
          "<leader>te",
          desc = "Erors",
          function()
            require("telescope.builtin").diagnostics({ severity = vim.lsp.protocol.DiagnosticSeverity.Error })
          end,
        },
        {
          "<leader>tw",
          desc = "Warnings",
          function()
            require("telescope.builtin").diagnostics({ severity = vim.lsp.protocol.DiagnosticSeverity.Warning })
          end,
        },
        { "<leader>tt", ":TodoTelescope<CR>",                 desc = "TODOs", },
        {
          "<leader>tm",
          desc = "Marks",
          function()
            require("telescope.builtin").marks({ mark_type = "all" })
          end,
        },
        { "<leader>tb", require("telescope.builtin").buffers, desc = "Buffers" },
      },
      { "<leader><space>", require("telescope.builtin").find_files, desc = "Find Files" },
      { "<leader>mp",      "<CMD>MarkdownPreview<CR>",              desc = "Markdown Preview" },
      { "<leader>bb",      require("telescope.builtin").buffers,    desc = "Buffers" },
      {
        "<leader>mm",
        desc = "Marks",
        function()
          bookmarks()
        end,
      },

      {
        mode = { "i" },
        { "<C-p>", "<C-r>", desc = "Paste Register" }
      },
      {
        mode = { "n", "v" }, -- NORMAL and VISUAL mode
        {
          "]e",
          desc = "Error Next",
          function()
            vim.diagnostic.goto_next({ severity = vim.lsp.protocol.DiagnosticSeverity.Error })
          end
        },
        {
          "[e",
          desc = "Error Prev",
          function()
            vim.diagnostic.goto_prev({ severity = vim.lsp.protocol.DiagnosticSeverity.Error })
          end
        },
        { "]d", desc = "Diagnostic Next", vim.diagnostic.goto_next },
        { "[d", desc = "Diagnostic Prev", vim.diagnostic.goto_prev },

        -- {
        --   "gd",
        --   desc = "Goto Definition",
        --   function()
        --     require("telescope.builtin").lsp_definitions({ reuse_win = true })
        --   end,
        -- },
      },
      {
        mode = { "i", "n", "v", "t" },
        group = "windows",

        { "<C-w>q" },
        { "<C-w>/",    "<ESC><C-w>v",   desc = "Split Vertical" },
        { "<C-w>-",    "<ESC><C-w>s",   desc = "Split Horizontal" },
        { "<C-w>w",    "<ESC><C-w>q",   desc = "Quit Window" },
        { "<C-w><BS>", "<ESC><C-w>q",   desc = "Quit Window" },
        { "<C-w><CR>", ":tabnew %<CR>", desc = "Zoom Window" },
        -- {
        --   "<A-h>",
        --   desc = "Resize Left",
        --   function()
        --     replicate5(require("tmux").resize_left)
        --   end,
        -- },
        -- {
        --   "<A-j>",
        --   desc = "Resize Bottom",
        --   function()
        --     replicate5(require("tmux").resize_bottom)
        --   end,
        -- },
        -- {
        --   "<A-k>",
        --   desc = "Resize Top",
        --   function()
        --     replicate5(require("tmux").resize_top)
        --   end,
        -- },
        -- {
        --   "<A-l>",
        --   desc = "Resize Right",
        --   function()
        --     replicate5(require("tmux").resize_right)
        --   end,
        -- },
        { "<C-q>",     "<ESC><C-w>q",   desc = "Quit Window" },
      },
      {
        mode = { "n", "v", "t" },
        group = "glance",
        { "gd", "<CMD>Glance definitions<CR>", desc = "Glance Definitions" },
        { "gr", "<CMD>Glance references<CR>",  desc = "Glance References" },
        -- { "gy", "<CMD>Glance type_definitions<CR>", desc = "Glance type definitions" },
        -- { "gM", "<CMD>Glance implementations<CR>", desc = "Glance implementations" },
      }

    })
  end
}
