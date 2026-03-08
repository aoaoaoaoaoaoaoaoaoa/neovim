return {
  "neovim/nvim-lspconfig",

  config = function()

    -- PYTHON
    vim.lsp.config("pyright", {
      settings = {
        pyright = {
          disableOrganizeImports = true,
        },
      },
    })

    -- RUFF
    vim.lsp.config("ruff", {})

    -- JS / TS
    vim.lsp.config("ts_ls", {})

    -- HTML
    vim.lsp.config("html", {})

    -- CSS
    vim.lsp.config("cssls", {})

    -- включаем серверы
    vim.lsp.enable("pyright")
    vim.lsp.enable("ruff")
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("html")
    vim.lsp.enable("cssls")

    -- diagnostics
    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

    -- LSP attach
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),

      callback = function(ev)
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        local opts = { buffer = ev.buf }

        vim.keymap.set("n", "lD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "ld", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "lk", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

        vim.keymap.set({ "n", "v" }, "<space>r", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

        vim.keymap.set("n", "<space>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
      end,
    })

  end,
}
