local langs = require("config.languages")

if not langs["vue"] then
  return {}
end

if not langs["vue"]["enabled"] then
  return {}
end

return {

}
