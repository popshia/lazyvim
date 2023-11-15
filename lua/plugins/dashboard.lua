return {
  "nvimdev/dashboard-nvim",
  opts = function(_, opts)
    local header = [[









  ____   ___   ____  _   _   (_) ____ ___
  / __ \ / _ \ / __ \| | / / / / / __ `__ \
 / / / //  __// /_/ /| |/ / / / / / / / / /
/_/ /_/ \___/ \____/ |___/ /_/ /_/ /_/ /_/
]]
    opts.theme = "doom"
    opts.config.header = vim.split(header, "\n", { trimempty = false })
  end,
}
