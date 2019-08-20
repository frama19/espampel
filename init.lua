


files= file.list()

if (files["webserver.lua"]) then
  print("Compiling webserver.lua to webserver.lc")
  file.remove("webserver.lc")
  node.compile("webserver.lua")
  file.remove("webserver.lua")
  node.restart()
else if (files["wifi_config.lua"]) then
  print("Compiling wifi_config.lua to wifi_config.lc")
  file.remove("wifi_config.lc")
  node.compile("wifi_config.lua")
  file.remove("wifi_config.lua")
  node.restart()
else if (files["steps.lua"]) then
  print("Compiling steps.lua to steps.lc")
  file.remove("steps.lc")
  node.compile("steps.lua")
  file.remove("steps.lua")
  node.restart()
else
--start logic out of wifi_config.lua
print("Starting wifi configuration")
dofile("wifi_config.lc")
end
end
end