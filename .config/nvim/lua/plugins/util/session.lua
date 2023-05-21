return {
  {
    'stevearc/resession.nvim',
    opts = {
      autosave = {
        enabled = true,
        interval = 60,
        notify = false,
      },
      extensions = {
        overseer = {}
      }
    },
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
