local M = {}

local switch_table = require("switcher.switcher_table")

--- Main function, responsible for switching words
--- @param word string | nil Word to be switched
function M.switch(word)
  if not word or word == "" then
    return
  end

  local replacement = switch_table[word]

  if not replacement then
    return
  end

  local keys = "ciw" .. replacement .. vim.api.nvim_replace_termcodes("<Esc>", true, true, true)

  vim.api.nvim_feedkeys(keys, "n", false)
end

return M
