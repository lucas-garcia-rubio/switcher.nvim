local M = {}

local config = require("switcher.config")
local core = require("switcher.core")

local function setup_keymap()
  if not config.opts.keymap then
    return
  end

  vim.keymap.set("n", config.opts.keymap, function()
    core.switch(vim.fn.expand("<cword>"))
  end, { desc = "Switcher: Trocar palavra sob o cursor" })
end

--- @param opts table | nil
function M.setup(opts)
  config.setup(opts)
  setup_keymap()
end

--- @param word string | nil
function M.switch(word)
  core.switch(word)
end

return M
