return {
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd.colorscheme "tokyonight"
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependancies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      theme = 'tokyonight',
    },
  },
}
