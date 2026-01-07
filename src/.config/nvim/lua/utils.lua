local M = {}

--- Checks if a plugin is available.
--- @param plugin string The name of the plugin to check.
--- @return boolean True if the plugin is found, false otherwise.
function M.has(plugin)
  return M.get_plugin(plugin) ~= nil
end

---@param name string
function M.get_plugin(name)
  return require("lazy.core.config").spec.plugins[name]
end

---@param name string
---@param path string?
function M.get_plugin_path(name, path)
  local plugin = M.get_plugin(name)
  path = path and "/" .. path or ""
  return plugin and (plugin.dir .. path)
end

return M
