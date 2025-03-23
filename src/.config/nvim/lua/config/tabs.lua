local langs = require("config.languages")
local tabset = require("tabset")

settings = {
  defaults = {
    tabwidth = 4,
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

if langs.lua ~= nil and langs.lua.enabled == true then
  settings.languages["lua"] = {
    tabwidth = 2,
    expandtab = true,
  }
end

if langs.yaml ~= nil and langs.yaml.enabled == true then
  settings.languages["yaml"] = {
    tabwidth = 2,
    expandtab = true,
  }
end

tabset.setup(settings)
