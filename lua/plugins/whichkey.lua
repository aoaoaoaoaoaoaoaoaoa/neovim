return {
  "folke/which-key.nvim",
  event = "VeryLazy",

  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,

  config = function()
    local wk = require("which-key")

    wk.add({
      { "<leader>f", group = "Find" },
      { "<leader>ff", desc = "Find File" },
      { "<leader>ft", desc = "Find Text" },
      { "<leader>fb", desc = "Find Buffer" },
      { "<leader>fh", desc = "Find Help" },

      { "<leader>g", group = "Git" },
      { "<leader>gb", desc = "Open Branches" },
      { "<leader>gc", desc = "Open Commits" },
      { "<leader>gs", desc = "Open Status" },

      { "<leader>e", desc = "Open Diagnostic Window" },

      { "<leader>l", group = "LSP", icon = "󰘦" },
      { "<leader>lD", desc = "Declaration" },
      { "<leader>ld", desc = "Definition" },
      { "<leader>lk", desc = "Hover" },

      { "<leader>t", group = "Tree", icon = "󰙅" },
      { "<leader>tt", desc = "Tree Toggle" },
      { "<leader>tf", desc = "Tree Focus", icon = "󰙅" },

      { "<leader>n", group = "TodoList", icon = "󰄬" },
      { "<leader>nl", desc = "Open List" },

      { "<leader>s", desc = "Open Terminal" },

      { "<leader>r", desc = "Ruff", icon = { icon = "󰌠", color = "yellow"}, },
      { "<leader>c", group = "Color Schemes", icon = "󰏘" },
      { "<leader>cs", desc = "Open" },

       -- Git
       { "<leader>g", group = "Git" },
        { "<leader>gb", desc = "Open Branches" },
        { "<leader>gc", desc = "Open Commits" },
        { "<leader>gs", desc = "Open Status" },

        -- GitSign
        { "<leader>gh", group = "Hunks" },
        { "<leader>ghs", desc = "Stage Hunk" },
        { "<leader>ghr", desc = "Reset Hunk" },
        { "<leader>ghp", desc = "Preview Hunk" },
        { "<leader>ghS", desc = "Stage Buffer" },
        { "<leader>ghR", desc = "Reset Buffer" },
        { "<leader>ghb", desc = "Blame Line" },
        { "<leader>ghd", desc = "Diff" },
        { "<leader>ghi", desc = "Inline Hunk" },

        --BufferLine for closing current Tab
        { "<leader>x", desc = "Close Buffer"},

        --utils
        { "<leader>p", desc = "Utils", icon = "󰒓"},
        -- Conform Formatting
        { "<leader>pf", desc = "Format", icon = "󰛨" },
        
        -- View for save folders and etc
        { "<leader>pv", desc = "Save View", icon = "󰆓" },
        { "<leader>pd", desc = "Delete View", icon = "󰆴" },

        -- for path find
        { "<leader>tp", desc = "Change root", icon = "󰉋"},

        -- bufferline
       { "<leader>b", group = "Bufferline" },
        { "<leader>bp", desc = "Pin buffer"},
        { "<leader>bx", desc = "Close buffer"},
    })
  end,
}
