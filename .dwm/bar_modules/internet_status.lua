#!/bin/env lua
local http = require("socket.http")
local status, text = pcall(http.request, "api.kanye.rest")
if status then
    print("說")
else
    print("ﲁ")
end