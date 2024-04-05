return {
  {
    "vhyrro/luarocks.nvim",
    branch = "go-away-python",
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }, -- Specify LuaRocks packages to install
    },
  },
  {
    "rest-nvim/rest.nvim",
    event = "VeryLazy",
    ft = { "http" },
    dependencies = {
      {
        "luarocks.nvim",
      },
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<leader>r"] = { name = " Rest http" },
              ["<leader>rr"] = { "<cmd>Rest run<cr>", desc = "Run rest http request under cursor" },
              ["<leader>re"] = {
                "<cmd>Telescope rest select_env<cr>",
                desc = "Select environment file for rest testing",
              },
            },
          },
        },
      },
    },
    config = function()
      require("rest-nvim").setup()
      require("telescope").load_extension "rest"
    end,
  },
}
