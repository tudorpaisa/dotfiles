-- lua/local_settings.lua
local M = {}

local path = vim.fn.stdpath("config") .. "/local-settings.json"

if vim.fn.filereadable(path) == 1 then
  local lines = vim.fn.readfile(path)
  local ok, parsed = pcall(vim.fn.json_decode, table.concat(lines, "\n"))
  if ok and type(parsed) == "table" then
    M = parsed
  end
end

return M
