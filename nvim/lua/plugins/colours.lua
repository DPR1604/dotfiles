return {
  { "Mofiqul/dracula.nvim",
    config = function()
      vim.cmd.colorscheme "dracula"
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependancies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      theme = 'dracula',
    },
  },
}
