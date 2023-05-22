return {
  {
    'stevearc/resession.nvim',
    config = function()
      require('resession').setup({
        autosave = {
          enabled = true,
          interval = 60,
          notify = true,
        },
        extensions = {
          overseer = {}
        }
      })
    end,
    keys = function()
      local resession = require("resession")
      return {
        { "<leader>qs", resession.save,   desc = "Save session" },
        { "<leader>ql", resession.load,   desc = "Load session" },
        { "<leader>qd", resession.delete, desc = "Delete session" }
      }
    end
  }
}
