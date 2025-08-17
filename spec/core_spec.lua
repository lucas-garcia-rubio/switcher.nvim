---@diagnostic disable: undefined-global, duplicate-set-field

local core = require("switcher.core")

describe("Test core function", function()
  local original_nvim_feedkeys
  local original_nvim_replace_termcodes
  local feedkeys_calls = {}
  local replace_termcodes_calls = {}

  before_each(function()
    original_nvim_feedkeys = vim.api.nvim_feedkeys
    original_nvim_replace_termcodes = vim.api.nvim_replace_termcodes

    feedkeys_calls = {}
    replace_termcodes_calls = {}

    ---@diagnostic disable-next-line: duplicate-set-field
    vim.api.nvim_feedkeys = function(keys, mode, escape_csi)
      table.insert(feedkeys_calls, {
        keys = keys,
        mode = mode,
        escape_csi = escape_csi,
      })
    end

    ---@diagnostic disable-next-line: duplicate-set-field
    vim.api.nvim_replace_termcodes = function(str, from_part, do_lt, special)
      local call = {
        str = str,
        from_part = from_part,
        do_lt = do_lt,
        special = special,
      }
      table.insert(replace_termcodes_calls, call)
      return str
    end
  end)

  after_each(function()
    vim.api.nvim_feedkeys = original_nvim_feedkeys
    vim.api.nvim_replace_termcodes = original_nvim_replace_termcodes
  end)

  it("switches valid words correctly", function()
    core.switch("true")

    assert.are.equal(1, #feedkeys_calls)
    assert.are.equal("ciw" .. "false" .. "<Esc>", feedkeys_calls[1].keys)
    assert.are.equal("n", feedkeys_calls[1].mode)
    assert.are.equal(false, feedkeys_calls[1].escape_csi)

    assert.are.equal(1, #replace_termcodes_calls)
    assert.are.equal("<Esc>", replace_termcodes_calls[1].str)
    assert.are.equal(true, replace_termcodes_calls[1].from_part)
    assert.are.equal(true, replace_termcodes_calls[1].do_lt)
    assert.are.equal(true, replace_termcodes_calls[1].special)
  end)

  it("does nothing for invalid words", function()
    core.switch("nonexistent")

    assert.are.equal(0, #feedkeys_calls)
    assert.are.equal(0, #replace_termcodes_calls)
  end)

  it("does nothing for empty or nil words", function()
    core.switch("")
    core.switch(nil)

    assert.are.equal(0, #feedkeys_calls)
    assert.are.equal(0, #replace_termcodes_calls)
  end)
end)
