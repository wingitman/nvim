return {
  "chrisbra/unicode.vim",
  cmd = { "Digraphs", "UnicodeSearch", "UnicodeName", "UnicodeTable", "DownloadUnicode", "UnicodeCache" },
  keys = {
    { "<leader>uug", "<cmd>Digraphs<cr>",        desc = "Unicode Digraphs" },
    { "<leader>uus", "<cmd>UnicodeSearch<cr>",   desc = ".. Search" },
    { "<leader>uun", "<cmd>UnicodeName<cr>",     desc = ".. Name" },
    { "<leader>uut", "<cmd>UnicodeTable<cr>",    desc = ".. Table" },
    { "<leader>uud", "<cmd>DownloadUnicode<cr>", desc = ".. Download" },
    { "<leader>uuc", "<cmd>UnicodeCache<cr>",    desc = ".. Cache" },
  },
}

-- xnoremap <leader>c <esc>:'<,'>:w !command<CR>
