local switcher_table = require("switcher.switcher_table")

describe("Test switcher table", function()
  it("has all the pairs", function()
    for key, value in pairs(switcher_table) do
      assert(switcher_table[value] ~= nil, "table has no corresponding key")
      assert(switcher_table[value] == key, "table has no corresponding value")
    end
  end)
end)
