hs.grid.GRIDHEIGHT = 5
hs.grid.GRIDWIDTH = 5

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.alert.show("Hello World!")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "E", function()
	local spotify = hs.spotify
	spotify.displayCurrentTrack()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "F", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "C", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.w = max.w * 0.95
  f.h = max.h * 0.95

  f.x = max.x + (f.w * 0.025)
  f.y = max.y + (f.h * 0.025)
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "V", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.w = max.w * 0.9
  f.h = max.h * 0.9

  f.x = max.x + (f.w * 0.05)
  f.y = max.y + (f.h * 0.05)
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "B", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.w = max.w * 0.8
  f.h = max.h * 0.8

  f.x = max.x + (f.w * 0.1)
  f.y = max.y + (f.h * 0.1)
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "N", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.w = max.w * 0.7
  f.h = max.h * 0.7

  f.x = max.x + (f.w * 0.2)
  f.y = max.y + (f.h * 0.2)
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "M", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.w = max.w * 0.6
  f.h = max.h * 0.6

  f.x = max.x + (f.w * 0.3)
  f.y = max.y + (f.h * 0.3)
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "D", function()
 	local grid = require "hs.grid"
	hs.grid.pushWindowNextScreen()
end)

-- hs.hotkey.bind({"cmd", "ctrl"}, "LEFT", function()
--  	local grid = require "hs.grid"
-- 	hs.grid.resizeWindowThinner()
-- end)

-- hs.hotkey.bind({"cmd", "ctrl"}, "Right", function()
--  	local grid = require "hs.grid"
-- 	hs.grid.resizeWindowWider()
-- end)

hs.hotkey.bind({"cmd", "ctrl"}, "Down", function()
 	local grid = require "hs.grid"
	hs.grid.resizeWindowTaller()
end)

hs.hotkey.bind({"cmd", "ctrl"}, "Up", function()
 	local grid = require "hs.grid"
	hs.grid.resizeWindowShorter()
end)

hs.hotkey.bind({"cmd", "ctrl", "shift"}, "Right", function()
 	local grid = require "hs.grid"
	hs.grid.pushWindowRight()
end)

hs.hotkey.bind({"cmd", "ctrl", "shift"}, "Left", function()
 	local grid = require "hs.grid"
	hs.grid.pushWindowLeft()
end)


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x 
  f.y = max.y + (max.h / 2)
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "-", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h - 50
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "S", function()
  displayCurrentTrack()
end)

-- Spotify
local as = require "hs.applescript"

-- Internal function to pass a command to Applescript.
local function tell(cmd)
  local _cmd = 'tell application "Spotify" to ' .. cmd
  local ok, result = as.applescript(_cmd)
  if ok then
    return result
  else
    return nil
  end
end

function displayCurrentTrack()
  local artist = tell('artist of the current track') or "Unknown artist"
  local album  = tell('album of the current track') or "Unknown album"
  local track  = tell('name of the current track') or "Unknown track"
  hs.notify.new({title=artist, informativeText=track .. " - " .. album}):send():release()
end

function reload_config(files)
    hs.reload()
end

hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()

hs.alert.show("Config loaded")
