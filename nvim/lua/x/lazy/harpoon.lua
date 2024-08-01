return {{
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim"},
  config = function()
    local harpoon = require("harpoon")
    vim.keymap.set("n", "<C-e>", function() 
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, {})
    -- Has a way to use telescope if I end up caring in the future.
    -- https://github.com/ThePrimeagen/harpoon/tree/harpoon2
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, {})

    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

    vim.keymap.set("n", "<leader>q", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<leader>e", function() harpoon:list():next() end)
  end
}}
