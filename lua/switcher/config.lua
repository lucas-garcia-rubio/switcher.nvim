local M = {}

M.defaults = {
  keymap = "<leader>z",
}

M.opts = {}

--- @param opts table | nil Config table provided by user
function M.setup(opts)
  M.opts = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})
end

return M
