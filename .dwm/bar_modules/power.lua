#!/bin/env lua
local options = "shutdown\nrestart\nlock screen\nlogout"

local choice = io.popen("echo '"..options.."' | dmenu -g 1 -l 4"):read'*all'
choice = string.gsub(choice, "%s", "")
print(choice)
if choice == "shutdown" then
  os.execute("systemctl poweroff")
elseif choice == "restart" then
  os.execute("systemctl reboot")
elseif choice == "lockscreen" then
  os.execute("i3lock")
elseif choice == "logout" then
  os.execute("pkill -u $USER")
end
