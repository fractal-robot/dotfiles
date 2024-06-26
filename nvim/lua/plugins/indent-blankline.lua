return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},

  config = function()
    require("ibl").setup({
      exclude = { filetypes = { "norg" } },

      scope = {
        enabled = true,
        show_start = true,
        show_end = false,
        injected_languages = false,
        highlight = { "Function", "Label" },
        priority = 500,
      },
    })
  end,
}
