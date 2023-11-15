return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- disable default keymappings
    keys[#keys + 1] = { "K", false }
    keys[#keys + 1] = { "gI", false }
    keys[#keys + 1] = { "<leader>cr", false }

    -- change gk to hover
    keys[#keys + 1] = { "gk", vim.lsp.buf.hover, desc = "Hover" }

    -- change gk to hover
    keys[#keys + 1] = {
      "gi",
      function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end,
      desc =
      "Goto Implementation"
    }

    -- change gr to rename symbol
    if require("lazyvim.util").has("inc-rename.nvim") then
      keys[#keys + 1] = {
        "gr",
        function()
          local inc_rename = require("inc_rename")
          return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
        end,
        expr = true,
        desc = "Rename",
        has = "rename",
      }
    else
      keys[#keys + 1] = { "gr", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
    end

    -- add gl to open_float, but there's already a ghost text for diagnostics.
    -- keys[#keys + 1] = { "gl", vim.diagnostic.open_float }
  end,
}
