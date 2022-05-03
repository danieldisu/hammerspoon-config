hs.grid.GRIDHEIGHT = 5
hs.grid.GRIDWIDTH = 5

-- CMD + SHIFT + CTRL

-- fullscreen
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "Q", function()
  centered(1, 1)
end)

-- centered
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "W", function()
  centered(0.80, 0.90)
end)

-- centered smaller
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "E", function()
  centered(0.70, 0.80)
end)

-- left 70% right 30%

hs.hotkey.bind({"cmd", "ctrl", "shift", "alt"}, "Left", function()
  pushLeft(0.7)
end)

hs.hotkey.bind({"cmd", "ctrl", "shift", "alt"}, "Right", function()
  pushRight(0.3)
end)


-- left 50% right 50%

hs.hotkey.bind({"cmd", "ctrl", "shift"}, "Left", function()
  pushLeft(0.5)
end)

hs.hotkey.bind({"cmd", "ctrl", "shift"}, "Right", function()
  pushRight(0.5)
end)

-- up / down
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "up", function()
  pushTop(0.5)
end)

hs.hotkey.bind({"cmd", "ctrl", "shift"}, "down", function()
  pushDown(0.5)
end)

-- Move current window to next screen

hs.hotkey.bind({"cmd", "ctrl", "shift"}, "D", function()
  local grid = require "hs.grid"
 hs.grid.pushWindowNextScreen()
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

function centered(widthPercentage, heightPercentage)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.w = max.w * widthPercentage
  f.h = max.h * heightPercentage

  local percentageOfVerticalPadding = ((1 - widthPercentage)/ 2)
  local percentageOfHorizontalPadding = ((1 - heightPercentage)/ 2)
  local xPosition = max.w * percentageOfVerticalPadding
  local yPosition = max.h * percentageOfHorizontalPadding

  f.x = max.x + xPosition
  f.y = max.y + yPosition
  win:setFrame(f)
end

function centeredTop(widthPercentage, heightPercentage)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.w = max.w * widthPercentage
  f.h = max.h * heightPercentage

  local percentageOfVerticalPadding = ((1 - widthPercentage)/ 2)
  local percentageOfHorizontalPadding = ((1 - heightPercentage)/ 2)
  local xPosition = max.w * percentageOfVerticalPadding
  local yPosition = 0

  f.x = max.x + xPosition
  f.y = max.y + yPosition
  win:setFrame(f)
end

function pushLeft(widthPercentage)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = (max.w * widthPercentage)
  f.h = max.h
  win:setFrame(f)
end

function pushRight(widthPercentage)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  local desiredWidth = (max.w * widthPercentage)

  f.x = max.w - desiredWidth
  f.y = max.y
  f.w = desiredWidth
  f.h = max.h
  win:setFrame(f)
end

function pushTop(heightPercentage)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  local desiredHeight = (max.h * heightPercentage)

  f.x = 0
  f.y = 0
  f.w = max.w
  f.h = desiredHeight
  win:setFrame(f)
end

function pushDown(heightPercentage)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  local desiredHeight = (max.h * heightPercentage)

  f.x = 0
  f.y = max.h - desiredHeight
  f.w = max.w
  f.h = desiredHeight
  win:setFrame(f)
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
