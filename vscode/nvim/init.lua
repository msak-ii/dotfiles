-- #region: plugins
vim.pack.add({
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/junegunn/vim-easy-align",
})

-- #region: mini
-- Text editing
-- require('mini.ai').setup()
-- require('mini.align').setup()
-- require('mini.comment').setup()
-- require('mini.completion').setup()
-- require('mini.keymap').setup()
-- require('mini.move').setup()
-- require('mini.operators').setup()
-- require('mini.pairs').setup()
-- require('mini.snippets').setup()
-- require('mini.splitjoin').setup()
-- require('mini.surround').setup()

-- General workflow
require("mini.basics").setup()
-- require('mini.bracketed').setup()
-- require('mini.bufremove').setup()
-- require("mini.clue").setup()
-- require('mini.cmdline').setup()
-- require('mini.deps').setup()
-- require('mini.diff').setup()
-- require('mini.extra').setup()
-- require('mini.files').setup()
-- require('mini.git').setup()
-- require('mini.input').setup()
-- require('mini.jump').setup()
-- require('mini.jump2d').setup()
-- require('mini.misc').setup()
-- require('mini.pick').setup()
-- require('mini.sessions').setup()
-- require('mini.visits').setup()

-- Appearance
-- require('mini.animate').setup()
-- require('mini.base16').setup()
-- require('mini.colors').setup()
require("mini.cursorword").setup()
-- require('mini.hipatterns').setup()
-- require('mini.hues').setup()
-- require('mini.icons').setup()
require("mini.indentscope").setup()
-- require('mini.map').setup()
-- require('mini.notify').setup()
-- require('mini.starter').setup()
-- require('mini.statuscolumn').setup()
-- require('mini.statusline').setup()
-- require('mini.tabline').setup()
-- require('mini.trailspace').setup()

-- Other
-- require('mini.doc').setup()
-- require('mini.fuzzy').setup()
-- require('mini.test').setup()
-- #endregion: mini

-- #region: easy-align
vim.keymap.set({ "n", "x" }, "ga", "<Plug>(EasyAlign)")
-- #endregion: easy-align
-- #endregion: plugins

-- #region: options
vim.opt.clipboard = "unnamed"
require("vim._core.ui2").enable({ enable = false })
-- #endregion: options

-- #region: keymaps
local vscode = require("vscode")

vim.keymap.set("n", "<C-h>", function()
	vscode.action("workbench.action.focusLeftGroup")
end)
vim.keymap.set("n", "<C-j>", function()
	vscode.action("workbench.action.focusBelowGroup")
end)
vim.keymap.set("n", "<C-k>", function()
	vscode.action("workbench.action.focusAboveGroup")
end)
vim.keymap.set("n", "<C-l>", function()
	vscode.action("workbench.action.focusRightGroup")
end)

vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<Cr>")

vim.keymap.set("n", "<Leader><Leader>", function()
	vscode.action("buf.pick")
end)
vim.keymap.set("n", "<Leader>=", "gg=G``")
vim.keymap.set("n", "<Leader>Q", function()
	vscode.action("workbench.action.closeOtherEditors")
end)
vim.keymap.set("n", "<Leader>a", function()
	vscode.action("workbench.action.closeAllEditors")
end)
vim.keymap.set("n", "<Leader>bd", function()
	vscode.action("buf.bdelete")
end)
vim.keymap.set("n", "<Leader>f", function()
	vscode.action("editor.action.formatDocument")
end)
vim.keymap.set("n", "<Leader>o", function()
	vscode.action("workbench.action.gotoSymbol")
end)
vim.keymap.set("n", "<Leader>q", function()
	vscode.action("buf.quit")
end)
vim.keymap.set("n", "<Leader>s", function()
	vscode.action("workbench.action.splitEditorDown")
end)
vim.keymap.set("n", "<Leader>t", function()
	vscode.action("editor.action.trimTrailingWhitespace")
end)
vim.keymap.set("n", "<Leader>v", function()
	vscode.action("workbench.action.splitEditorRight")
end)
vim.keymap.set("n", "<Leader>w", function()
	vscode.action("workbench.action.files.save")
end)

vim.keymap.set("n", "H", function()
	vscode.action("editor.action.dirtydiff.next")
end)
vim.keymap.set("n", "S", function()
	vscode.action("editor.action.triggerParameterHints")
end)

vim.keymap.set("n", "[c", function()
	vscode.action("workbench.action.editor.previousChange")
end)
vim.keymap.set("n", "]c", function()
	vscode.action("workbench.action.editor.nextChange")
end)

vim.keymap.set("n", "grD", function()
	vscode.action("editor.action.goToDeclaration")
end)
vim.keymap.set("n", "grI", function()
	vscode.action("editor.showIncomingCalls")
end)
vim.keymap.set("n", "grO", function()
	vscode.action("editor.showOutgoingCalls")
end)
vim.keymap.set("n", "grd", function()
	vscode.action("editor.action.revealDefinition")
end)

vim.keymap.set("n", "za", function()
	vscode.action("editor.toggleFold")
end)
vim.keymap.set("n", "zm", function()
	vscode.action("editor.foldAll")
end)
vim.keymap.set("n", "zr", function()
	vscode.action("editor.unfoldAll")
end)
-- #endregion: keymaps
