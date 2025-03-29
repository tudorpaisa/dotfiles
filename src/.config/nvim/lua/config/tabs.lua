local langs = require("config.languages")
local tabset = require("tabset")

local settings = {
  defaults = {
    tabwidth = 2,
    expandtab = true,
  },
  languages = {
  },
}

if langs.dotnet ~= nil and langs.dotnet.enabled == true then
  settings.languages["csharp"] = {
    tabwidth = 4,
    expandtab = true,
  }
end

if langs.python ~= nil and langs.python.enabled == true then
  settings.languages["python"] = {
    tabwidth = 4,
    expandtab = true,
  }
end

tabset.setup(settings)
