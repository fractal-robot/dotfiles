return {
  "nvim-neorg/neorg",
  dependencies = { "max397574/neorg-contexts" },

  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},

        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },

        ["core.concealer"] = {},

        ["external.context"] = {},

        ["core.latex.renderer"] = {
          config = {
            render_on_enter = false,
          },
        },

        ["core.autocommands"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.neorgcmd"] = {},
        ["core.integrations.image"] = {},

        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/notes",
            },
            default_workspace = "notes",
          },
        },
      },
    })

    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}
