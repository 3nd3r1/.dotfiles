local gitblame = require("gitblame")

gitblame.setup({
	enabled = false,
})

require("which-key").add({
	{ "<leader>gb", gitblame.toggle, desc = "Toggle Git Blame" },
})
