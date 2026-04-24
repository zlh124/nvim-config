return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim", },
        config = function()
            local telescope = require("telescope")

            telescope.setup()

            local builtin = require("telescope.builtin")
        end,
    },
}
