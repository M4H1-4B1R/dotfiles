pcall(require, "luarocks.loader")

-- Standard awesome library
local awful = require("awful")

--autostart
awful.spawn.with_shell("/home/abir/.config/awesome/autostart.sh")
