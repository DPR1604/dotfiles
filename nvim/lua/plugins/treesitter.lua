return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      highight = { enable = true },
      indent = { enable = true },
      autotage = { enable = true },
      ensure_installed = {
	"lua",
	"yaml",
	"python",
	"bash",
	"terraform",
	"html",
	"css",
	"dockerfile",
      },
      auto_install = false,
    })
  end
}
