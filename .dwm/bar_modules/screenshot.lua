#!/bin/env lua
local options = "fullscreen\nselect"

local choice = io.popen("echo '"..options.."' | dmenu -g 1 -l 2"):read'*all'
choice = string.gsub(choice, "%s", "")

if choice == "fullscreen" then
  os.execute("scrot -d 1 ~/Pictures/screenshots/print.png")
elseif choice == "select" then
  os.execute("scrot -s -f ~/Pictures/screenshots/print.png")
end
