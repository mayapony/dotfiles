return {
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>qq", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
    },
  },
}
