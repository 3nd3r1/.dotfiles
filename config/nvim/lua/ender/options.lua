local o = vim.opt

o.number = true
o.relativenumber = true
o.shiftwidth = 4
o.tabstop = 4
o.expandtab = true
o.clipboard = "unnamedplus"
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.signcolumn = "yes"
