return {{
  "nvim-telescope/telescope.nvim",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  config = function()
    require("telescope").setup({
      -- There should be no reason to need .git
      defaults = { file_ignore_patterns = { ".git" } },
    })
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<C-p>",
      function()
        builtin.find_files({
          hidden = true,
          no_ignore = false,
})
      end, {})
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
  end
}}
