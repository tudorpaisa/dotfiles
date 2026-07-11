if vim.fn.has("win32") == 1 then
   vim.opt.fileformat = "dos"
   vim.opt.fileformats = { "dos", "unix" }
end

require("local_settings") -- loading here to cache the read
require("config.lazy")
