# KEYBINDS:
## Tmux
install tpm: https://github.com/tmux-plugins/tpm

tmux source ~/.tmux.conf

prefix + I

## zsh
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word


## Other
<leader>dd - diagnost open_float
<leader>cf - lsp.buf.format
<leader>cr - lsp.buf.references
<leader>ca - lsp.buf.code_actions
<leader>cd - lsp.buf.definitions
<leader>ch - lsp.buf.hover
<leader>g - vim-test TestVisit
<leader>l - .. TestLast
<leader>a - .. TestSuite
<leader>T - .. TestFile
<leader>t - .. TestNearest
<leader>hj - Harpoon ..
<leader>hk - .. ..
<leader> hh - open
<leader> hr - remove page
<leader>ha - add page
<leader>cf - lsp.buf.format
<leader>db - dap.continue (debugger open)
<leader>p - find_files
<leader>fg - live_grep
