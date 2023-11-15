return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "K", false }
    keys[#keys + 1] = { "<leader>cr", false }
    keys[#keys + 1] = { "gk", vim.lsp.buf.hover, desc = "Hover" }
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
  end,
}
