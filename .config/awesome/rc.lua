#!/usr/bin/lua5.3
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local radical = require("radical")
--local blind = require("blind")

local string = string
local awful  = require("awful")
local capi = {
  mouse = mouse,
  screen = screen,
  client = client,
  timer = timer
}

--function check_mouse_screen()
--	if (not awful.screen.focused() or awful.screen.focused() ~= 1.0)
--		then
--
--		awful.screen.focused() = 1;
--
--	end
--
--end
--
--check_mouse_screen()

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)

if awesome.startup_errors
  then
    naughty.notify({
      preset = naughty.config.presets.critical,
      title = "Oops, there were errors during startup!",
      text = awesome.startup_errors
    })
  end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init("/root/.config/awesome/themes/zenburn/theme.lua")
--beautiful.init("/usr/share/awesome/themes/default/theme.lua")
--for s = 1, screen.count() do
--	gears.wallpaper.centered(beautiful.wallpaper, s, 'white')
--end

--beautiful.init("/usr/share/awesome/lib/blind/arrow/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "urxvt"
editor = "vim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts = {
  awful.layout.suit.floating,
  awful.layout.suit.tile.left,
  awful.layout.suit.tile.right,
  awful.layout.suit.tile.top,
  awful.layout.suit.tile.bottom,
  awful.layout.suit.tile.bottom,
  awful.layout.suit.spiral,
  awful.layout.suit.spiral.dwindle,
  awful.layout.suit.magnifier,
  awful.layout.suit.fair,
  awful.layout.suit.fair.horizontal,
  awful.layout.suit.max.fullscreen
}

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Helper functions
local function client_menu_toggle_fn()
    local instance = nil

    return function ()
        if instance and instance.wibox.visible then
            instance:hide()
            instance = nil
        else
            instance = awful.menu.clients({ theme = { width = 250 } })
        end
    end
end
-- Create a wibox for each screen and add it
local taglist_buttons = awful.util.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    awful.button({ modkey }, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() and c.first_tag then
                                                      c.first_tag:view_only()
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, client_menu_toggle_fn()),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, false)
    end
end
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {
  names  = { "1", "2", "3", "4", "5", "6", "7" },
  layout = { layouts[4], layouts[1], layouts[1], layouts[1], layouts[1], layouts[3], layouts[4] }
}
--for s = 1, screen.count() do
--  -- Each screen has its own tag table.
--  tags[s] = awful.tag(tags.names, s, tags.layout)
--end
-- }}}

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag(tags.names, s, tags.layout)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            mykeyboardlayout,
            wibox.widget.systray(),
            mytextclock,
            s.mylayoutbox,
        },
    }
end)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

-- {{{ Menu
-- Create a laucher widget and a main menu
-- {{{ Menu
-- Create a laucher widget and a main menu
--myawesomemenu = {
--   { "restart", awesome.restart },
--   { "quit", awesome.quit }
--}

--mymainmenu = awful.menu(
--  { items = {
--      { "restart", awesome.restart },
--      { "quit", awesome.quit },
--      { "open terminal", terminal }
--    }
--  }
--)

 --   menu = radical.context({})
 --   menu:add_item({text="Screen 1",button1=function() print("Hello World! ") end})
 --   menu:add_item({text="Screen 9"})
 --   menu:add_item({text="Sub Menu",sub_menu = function()
 --       local smenu = radical.context({})
 --       smenu:add_item({text="item 1"})
 --       smenu:add_item({text="item 2"})
 --       return smenu
 --   end})
mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon})

-- Menubar configuration
--menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock()

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  --instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

--for s = 1, screen.count() do
--    -- Create a promptbox for each screen
--    mypromptbox[s] = awful.widget.prompt()
--    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
--    -- We need one layoutbox per screen.
--    mylayoutbox[s] = awful.widget.layoutbox(s)
--    mylayoutbox[s]:buttons(awful.util.table.join(
--                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
--                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
--                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
--                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
--    -- Create a taglist widget
--    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)
--
--    -- Create a tasklist widget
--    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)
--
--    -- Create the wibox
--    mywibox[s] = awful.wibox({ position = "top", screen = s })
--
--    -- Widgets that are aligned to the left
--    local left_layout = wibox.layout.fixed.horizontal()
--    --left_layout:add(mylauncher)
--    left_layout:add(mytaglist[s])
--    left_layout:add(mypromptbox[s])
--
--    -- Widgets that are aligned to the right
--    local right_layout = wibox.layout.fixed.horizontal()
--    if s == 1 then right_layout:add(wibox.widget.systray()) end
--    right_layout:add(mytextclock)
--    right_layout:add(mylayoutbox[s])
--
--    -- Now bring it all together (with the tasklist in the middle)
--    local layout = wibox.layout.align.horizontal()
--    layout:set_left(left_layout)
--    layout:set_middle(mytasklist[s])
--    layout:set_right(right_layout)
--
--    mywibox[s]:set_widget(layout)
--  mywibox[s].visible = false
----tags[s][1]:connect_signal("property::selected", function(t)
----  mywibox[s].visible = not(t.selected) end)
----tags[s][2]:connect_signal("property::selected", function(t)
----  mywibox[s].visible = not(t.selected) end)
----tags[s][3]:connect_signal("property::selected", function(t)
----  mywibox[s].visible = not(t.selected) end)
----tags[s][5]:connect_signal("property::selected", function(t)
----  mywibox[s].visible = not(t.selected) end)
----tags[s][6]:connect_signal("property::selected", function(t)
----  mywibox[s].visible = not(t.selected) end)
----tags[s][4]:connect_signal("property::selected", function(t)
----  mywibox[s].visible = not(t.selected) end)
--end
---- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- Autoload section.
--awful.util.spawn_with_shell("run_once cairo-dock")
awful.util.spawn_with_shell("sudo -u noname cairo-dock")
--awful.util.spawn_with_shell("compton -c -C   --vsync opengl --detect-rounded-corners  --refresh-rate 60 --vsync-aggressive -r 15 -l -22 -t -22 -m 1")
--awful.util.spawn_with_shell("feh --bg-fill ~/linux.jpg")
--awful.util.spawn_with_shell("netbookInit.sh")
awful.util.spawn_with_shell("conky&")
--awful.util.spawn_with_shell("compton -c -C --vsync drm --detect-rounded-corners -r 10 -l -15 -t -15 -m 1 -z")
--awful.util.spawn_with_shell("compton -c -C --vsync opengl --detect-rounded-corners -r 10 -l -15 -t -15 -m 1 -z")
--awful.util.spawn_with_shell("compton --config ~/.compton.conf")
awful.util.spawn_with_shell("xcompmgr -n &")
awful.util.spawn_with_shell("sleep 100; chown -R noname:noname /home/noname &")
awful.util.spawn_with_shell("xrdb -merge ~/.Xresources")
awful.util.spawn_with_shell("xbindkeys -p")
awful.util.spawn_with_shell("kbd-layout-set.set")
--awful.util.spawn_with_shell("bluetooth_apple.sh")
awful.util.spawn_with_shell("setxkbmap -model pc104 -layout us,ru -option grp:alt_shift_toggle")
awful.util.spawn_with_shell("bluetooth_apple_settings.sh")
awful.util.spawn_with_shell("xmodmap ~/.Xmodmap")
awful.util.spawn_with_shell("onboard -x 2510 -y 1569")
awful.util.spawn_with_shell("imwheel -b 45")
--awful.util.spawn_with_shell('nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceCompositionPipeline = On }"')

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
  --awful.button({ }, 3, function () if not menu.visible then  menu.visible = true else menu.visible = false end end),
  awful.button({ }, 4, awful.tag.viewnext),
  awful.button({ }, 5, awful.tag.viewprev)
))
    -- }}}
function disableFocus(c)
  client:lower()
  awful.focus.history.previous()
  client.focus:raise()
end

function dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k,v in pairs(o) do
      if type(k) ~= 'number' then k = '"'..k..'"' end
      s = s .. '['..k..'] = ' .. dump(v) .. ','
    end
      return s .. '} '
    else
      return tostring(o)
  end
end

screenshot = '/tmp/screenshot.png'

function scrot_full()
    scrot("scrot " .. screenshot .. " -e 'xclip -selection c -t image/png < $f', scrot_callback", scrot_callback, "Take a screenshot of entire screen")
end

function scrot_selection()
    scrot("scrot -s " .. screenshot .. " -e 'xclip -selection c -t image/png < $f'", scrot_callback, "Take a screenshot of selection")
end

function scrot_window()
    scrot("scrot -u " .. screenshot .. " -e 'xclip -selection c -t image/png < $f'", scrot_callback, "Take a screenshot of focused window")    
end

function scrot(cmd , callback, args)
    awful.util.spawn_with_shell(cmd)
    callback(args)
end

function scrot_callback(text)
    naughty.notify({
        text = text,
        timeout = 0.5
    })
end

 -- Variable to track the toggle state

local dictation = {
    off = -1,
    suspended = 0,
    on = 1
}

local dictation_cmd = "sudo -u noname nerd-dictation "
local dictation_state = dictation.off

-- {{{ Key bindings
globalkeys = awful.util.table.join(
--awful.key({ modkey,           }, "a",     function (c) naughty.notify({naughty.config.presets.critical, title = 'debug', text = dump(c.focus)}) end),
awful.key({ modkey,           }, "a",     function () client.focus:raise() end),
awful.key({ modkey,           }, "c",     function () client.focus:lower() end),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            --client.focus:lower()
            awful.client.focus.byidx(1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
 --   awful.key({ modkey,           }, "w", function () mymainmenu:show() end),

 -- Layout manipulation
 awful.key({ modkey, "Shift" }, "j", function () awful.client.swap.byidx( 1) end),
 awful.key({ modkey, "Shift" }, "k", function () awful.client.swap.byidx( -1) end),
 awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
 awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
 awful.key({ modkey, }, "u", awful.client.urgent.jumpto),
 awful.key({ modkey, }, "Tab",
   function ()
     awful.client.focus.history.previous()
     if client.focus then
     client.focus:raise()
   end
 end),

 -- Custom shortcuts.
 awful.key({ modkey, }, "Return", function () awful.spawn(terminal) end),
 awful.key({ modkey, }, "z", function () awful.spawn("gtrs") end),
 --awful.key({ modkey, }, "v", function () awful.spawn("sudo -u noname nerd-dictation begin") end),
 awful.key({ modkey, }, "v",
 	function ()
 		awful.spawn("sudo -u noname nerd-dictation end")
		dictation_state = dictation.off
        	naughty.notify({ text = "Dictation off" })
	end
),

-- Define the shortcut with toggle behavior
awful.key({ modkey }, "e",  
    function()
        -- Toggle toggle_state
        if dictation_state == dictation.off then
		awful.spawn(dictation_cmd .. " begin")
		dictation_state = dictation.on
        	naughty.notify({ text = "Dictation on" })
        elseif dictation_state == dictation.suspended then
		awful.spawn(dictation_cmd .. " resume")
		dictation_state = dictation.on
        	naughty.notify({ text = "Dictation resume" })
        elseif dictation_state == dictation.on then
		awful.spawn(dictation_cmd .. " suspend")
		dictation_state = dictation.suspended
        	naughty.notify({ text = "Dictation suspend" })
        end
    end,
    {description = "Toggle something", group = "custom"}
),

 --awful.key({ modkey, }, "v", function () awful.spawn("urxvt -hold -e sh -c 'vim'") end),
 --awful.key({ modkey, }, "v", function () naughty.notify({ preset = naughty.config.presets.warning, title = "Oops", text = client.focus.class 'fdefs' }) end),
 awful.key({ modkey, }, "g", function () awful.spawn("env BROWSER_BIN=chromium google-as-noname.sh http://google.com") end),
 awful.key({ modkey, }, "h", function () awful.spawn("env BROWSER_BIN=chromium google-as-noname.sh http://translate.google.ru/?hl=ru&tab=wTenve") end),
--awful.key({ modkey, }, "m", function () awful.spawn("env BROWSER_BIN=chromium google-as-noname.sh http://somi.qajedi.ru/open-door") end),
 --awful.key({ modkey, }, "d", function () awful.spawn("shutter -f") end),
 --awful.key({ modkey, }, "s", function () awful.spawn("maim -sl | xclip -selection clipboard -t image/png") end),
--awful.key({ modkey, }, "s", function () awful.spawn("maim -s x") end),
--awful.key({ modkey, }, "s", scrot_selection, {description = "Take a screenshot of selection", group = "screenshot"}),
--awful.key({ modkey, }, "d", function () awful.spawn("whoami > /root/x; env >> /root/x") end),
 awful.key({ modkey, }, "d", function () awful.spawn("shutter -t") end),
 awful.key({ modkey, }, "s", function () awful.spawn("shutter -s") end),
 --awful.key({ modkey, }, "v", function () awful.spawn("shutter -w") end),
--awful.key({ modkey, }, "g", function () awful.spawn("env firefox https://google.com") end),
--awful.key({ modkey, }, "b", function () awful.spawn("env firefox https://prj.adyax.com/projects/skimium/issues?query_id=1215") end),
--awful.key({ modkey, }, "h", function () awful.spawn("env firefox https://translate.google.ru/?hl=ru&tab=wTenve") end),
 awful.key({ }, "Print", function () awful.spawn("scrot -e 'mv $f ~/screenshots/ 2>/dev/null'") end),

 --awful.key({ modkey }, "p", function() awful.spawn("env /root/PhpStorm-7.1.2/bin/phpstorm.sh") end),
 --awful.key({ modkey }, "p", function() awful.spawn("env /root/PhpStorm-172.4155.41/bin/phpstorm.sh") end),
 --awful.key({ modkey }, "p", function() awful.spawn("env /root/PhpStorm/bin/phpstorm.sh") end),
 awful.key({ modkey }, "p", function() awful.spawn("env /root/PhpStorm-243.23654.168/bin/phpstorm -Dide.browser.jcef.sandbox.enable=false") end),
 awful.key({ modkey }, "r", function() awful.spawn("env /usr/bin/toggle-brush.sh") end),

 -- Standard program
 awful.key({ modkey, "Control" }, "r", awesome.restart),
 awful.key({ modkey, "Shift" }, "q", awesome.quit),

 awful.key({ modkey, }, "l", function () awful.tag.incmwfact( 0.05) end),
 awful.key({ modkey, }, "h", function () awful.tag.incmwfact(-0.05) end),
 awful.key({ modkey, "Shift" }, "h", function () awful.tag.incnmaster( 1) end),
 awful.key({ modkey, "Shift" }, "l", function () awful.tag.incnmaster(-1) end),
 awful.key({ modkey, "Control" }, "h", function () awful.tag.incncol( 1) end),
 awful.key({ modkey, "Control" }, "l", function () awful.tag.incncol(-1) end),
 awful.key({ modkey, }, "space", function () awful.layout.inc(layouts, 1) end),
 awful.key({ modkey, "Shift" }, "space", function () awful.layout.inc(layouts, -1) end),

 awful.key({ modkey, "Control" }, "n", awful.client.restore),

 -- Prompt
 awful.key({ modkey }, "]", function () awful.screen.focused().mypromptbox:run() end)

 --awful.key({ modkey }, "x",
 -- function ()
 -- awful.prompt.run({ prompt = "Run Lua code: " },
 -- mypromptbox[awful.screen.focused()].widget,
 -- awful.util.eval, nil,
 -- awful.util.getdir("cache") .. "/history_eval")
 --end),
 -- Menubar
 --awful.key({ modkey }, "p", function() menubar.show() end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c", function (c)
      if c.class ~= 'conky'
        then

        c:kill()
      end
    end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "y",      function (c) c.sticky = not c.sticky            end),
    awful.key({ modkey,           }, "i",      function (c) c.maximized = not c.maximazed            end),
    awful.key({ modkey,           }, "x",      function (c) c.dockable = not c.dockable            end),
    awful.key({ modkey,           }, "c",      function (c) c.marked = not c.marked            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
--for s = 1, screen.count() do
--   keynumber = math.min(9, math.max(#tags[s], keynumber))
--end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
--for i = 1, keynumber do
--    globalkeys = awful.util.table.join(globalkeys,
--        awful.key({ modkey }, "#" .. i + 9,
--                  function ()
--                        local screen = awful.screen.focused()
--                        if tags[screen][i] then
--                            awful.tag.viewonly(tags[screen][i])
--                        end
--                  end),
--        awful.key({ modkey, "Control" }, "#" .. i + 9,
--                  function ()
--                      local screen = awful.screen.focused()
--                      if tags[screen][i] then
--                          awful.tag.viewtoggle(tags[screen][i])
--                      end
--                  end),
--        awful.key({ modkey, "Shift" }, "#" .. i + 9,
--                  function ()
--                      if client.focus and tags[client.focus.screen][i] then
--                          awful.client.movetotag(tags[client.focus.screen][i])
--                      end
--                  end),
--        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
--                  function ()
--                      if client.focus and tags[client.focus.screen][i] then
--                          awful.client.toggletag(tags[client.focus.screen][i])
--                      end
--                  end))
--end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    {
      rule = { },
      properties = {
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        --focus = awful.client.focus.filter,
        keys = clientkeys,
        size_hints_honor = false,
        buttons = clientbuttons
      },
      callback = function(c)

        local scr_area = screen[c.screen].workarea
        local cl_strut = c:struts()
        local geometry = c:geometry()

        c:geometry({
          x = scr_area.width / 2 - geometry.width / 2,
          y = scr_area.height / 2 -  geometry.height / 2
        })

       end
    },
    {
      rule = {class = "URxvt" },
      properties = {
        border_width = 1,
        border_color = 0,
	titlebar_bg_focus = "#000000",
        size_hints_honor = false
      }
    },
    {
      rule_any = { {class = "Steam", class = "steam", class = "vrmonitor"} },
      properties = {
        border_width = 0,
        border_color = 0,
	floating = true,
	modal = true,
	sticky = false,
        size_hints_honor = false
      }
    },
    {
      rule_any = { {class = "cairo-dock", class = "Cairo-dock", name = "cairo-dock"} },
      properties = {
        border_width = 0,
        border_color = 0,
        size_hints_honor = false,
        floating = true,
        focusable = false,
        modal = true,
        below =  true
      }
    },
    {
      rule = { class = "Cairo-dock" },
      properties = {
        border_width = 0,
        border_color = 0,
        size_hints_honor = false,
        floating = true,
        focusable = false,
        modal = true,
        below =  true
      }
    },
    {
      rule = { name = "cairo-dock" },
      properties = {
        border_width = 0,
        border_color = 0,
        size_hints_honor = false,
        floating = true,
        focusable = false,
        modal = true,
        below =  true
      }
    },
    {
      rule = { class = "cube" },
      properties = {
        border_width = 0,
        border_color = 0,
        size_hints_honor = false,
        floating = true,
        focusable = false,
        modal = true,
        sticky = true,
        below =  true
      },
      callback = function(c)

        local scr_area = screen[c.screen].workarea
        local cl_strut = c:struts()
        local geometry = nil

        c:geometry({
          x = 20,
          y = 20,
          width = 940,
          height = 940,
        })

       end
    },
    {
      rule = { class = "conky" },
      properties = {
        border_width = 0,
        border_color = 0,
        size_hints_honor = false,
        floating = true,
        focusable = false,
        modal = true,
        width = 303,
        height = 450,
        below =  true
      },
      callback = function(c)

        local scr_area = screen[c.screen].workarea
        local cl_strut = c:struts()
        local geometry = nil

        c:geometry({
          x = (scr_area.width - 285),
          y = 500,
          width = 305,
          height = 450,
        })

       end
    },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
   -- { rule = { class = "Gitk" },
   --   properties = { tag = tags[1][3], floating = true, maximized_vertical = true, maximized_horizontal = true } },
   -- { rule = { class = "spacefm" },
   --   properties = { floating = true, tag = tags[1][4], maximized_vertical = true, maximized_horizontal = true } },

	-- New formatted rule for gimp
	{
		rule = {
			--class = "gimp",
			--name = "Layers",
			role = "gimp-dock"
		},
      		properties = {
			ontop = true,
			floating = true
		},
		callback = function(c)
			local scr_area = screen[c.screen].workarea
			local cl_strut = c:struts()
			local geometry = nil

			c:geometry({
				x = 0,
				y = scr_area.height - 300,
				width = 200,
				height = 300
			})
		end
	},
	{
		rule = {
			role = "gimp-image-window"
		},
      		properties = {
			fullscreen = true
		}
	},
	{
		rule = {
			--class = "gimp",
			name = "Tool Options"
		--	role = "gimp-toolbox"
		},
      		properties = {
			ontop = true,
			floating = true
		},
		callback = function(c)
			local scr_area = screen[c.screen].workarea
			local cl_strut = c:struts()
			local geometry = nil

			c:geometry({
				x = scr_area.width - 261,
				y = scr_area.height - 569,
				width = 261,
				height = 569
			})
		end
	},
	{
		rule = {
			--class = "gimp",
			--name = "Toolbox",
			role = "gimp-toolbox"
		},
      		properties = {
			ontop = true,
			floating = true
		},
		callback = function(c)
			local scr_area = screen[c.screen].workarea
			local cl_strut = c:struts()
			local geometry = nil

			c:geometry({
				x = 0, --(scr_area.width - 285),
				y = 0,
				width = 64,
				height = 673
			})
		end
	},

    { rule = { class = "gimp" },
      properties = { floating = true, layout = layouts[4], maximized_vertical = true, maximized_horizontal = true } },
   -- Set Firefox to always map on tags number 2 of screen 1.
--     { rule_any = { class = "cairo-dock", class = "Cairo-dock", name = "cairo-dock" },
--       properties = { focus = false } },

    {
      rule = { class = "Geary" },
      properties = {
        border_width = 0,
        border_color = 0,
        size_hints_honor = false,
        --floating = false,
        --focusable = true,
        --modal = true,
        --below =  false,
        --tag = tags[1][4]
        --layout = layouts[1]
      },
      callback = function(c)

        local scr_area = screen[c.screen].workarea
        local cl_strut = c:struts()
        local geometry = nil

      --  c:geometry({
      --    x = 3,
      --    y = 3,
      --    width = 60,
      --    height = 60,
      -- --   width = (scr_area.width - 60),
      -- --   height = (scr_area.height - 60),
      --  })

       end
    },
    {
      rule = { class = "onboard" },
      properties = {
        border_width = 0,
        border_color = 0,
        size_hints_honor = false,
        floating = true,
        focusable = false,
        --modal = true,
        --below =  false,
        --tag = tags[1][4]
        --layout = layouts[1]
      },
      callback = function(c)

        local scr_area = screen[c.screen].workarea
        local cl_strut = c:struts()
        local geometry = nil

      --  c:geometry({
      --    x = 3,
      --    y = 3,
      --    width = 60,
      --    height = 60,
      -- --   width = (scr_area.width - 60),
      -- --   height = (scr_area.height - 60),
      --  })

       end
    }
--    {
--      rule = { class = "Skype" },
--      properties = {
--        border_width = 1,
--        border_color = 0,
--        size_hints_honor = false,
--        floating = true,
--        focusable = true,
--        modal = true,
--        below =  false,
--        tag = tags[1][4]
--      },
--      callback = function(c)
--        local scr_area = screen[c.screen].workarea
--        local cl_strut = c:struts()
--        local geometry = nil
--
--        c:geometry({
--          x = 400,
--          y = 60,
--          width = (scr_area.width - 450),
--          height = (scr_area.height - 90),
--        })
--
--       end
--    },
--    {
--      rule = { class = "Skype", name = "Skype™ 4.3 for Linux" },
--      properties = {
--        border_width = 1,
--        border_color = 0,
--        size_hints_honor = false,
--        floating = true,
--        focusable = true,
--        modal = true,
--        --width = auto,
--        --height = 450,
--        below =  false,
--        tag = tags[1][4]
--      },
--      callback = function(c)
--        local scr_area = screen[c.screen].workarea
--        local cl_strut = c:struts()
--        local geometry = nil
--
--        c:geometry({
--          x = (scr_area.width / 2 - (720 / 2)),
--          y = (scr_area.height / 2 - (470 / 2)),
--          width = 720,
--          height = 470,
--        })
--
--       end
--    },
--    {
--	    rule = { class = "jetbrains-phpstorm"},
--	    properties = { floating = true }
--    },
--    {
--      rule = { class = "Skype", name = "pavel--ruban - Skype™" },
--      properties = {
--        border_width = 1,
--        border_color = 0,
--        size_hints_honor = false,
--        floating = true,
--        focusable = true,
--        modal = true,
--        below =  false,
--        tag = tags[1][4]
--      },
--      callback = function(c)
--        local scr_area = screen[c.screen].workarea
--        local cl_strut = c:struts()
--        local geometry = nil
--
--        c:geometry({
--          x = 50,
--          y = 60,
--          width = 300,
--          height = (scr_area.height - 90),
--        })
--
--       end
--    },
--    { rule = { class = "Chromium" },
--      properties = { tag = tags[1][1], maximized_vertical = true, maximized_horizontal = true, floating = true  } },
--    { rule = { class = "Firefox", class = "Navigator" },
--      properties = { tag = tags[1][1], layout = layouts[4] } },
--    { except = { class = "Firefox", name = "Downloads" } },
--    { rule = { class = "Firefox", name = "Downloads" },
--,  = 700, y = 350 , width = 450, height = 600
--      properties = { tag = tags[1][1], floating = true },
--      callback =  function(c)
--       local scr_area = screen[c.screen].workarea
--       local cl_strut = c:struts()
--       local geometry = nil
--
--       -- adjust scr_area for this client's struts
--      -- if cl_strut ~= nil then
--      --     if cl_strut.left ~= nil and cl_strut.left > 0 then
--      --         geometry = {x=scr_area.x-cl_strut.left, y=scr_area.y,
--      --                     width=cl_strut.left}
--      --     elseif cl_strut.right ~= nil and cl_strut.right > 0 then
--      --         geometry = {x=scr_area.x+scr_area.width, y=scr_area.y,
--      --                     width=cl_strut.right}
--      --     end
--      -- end
--      -- scr_area is unaffected, so we can use the naive coordinates
--       c:geometry({
--         x = (scr_area.width - scr_area.width * 0.25),
--         y = (scr_area.height - scr_area.height * 0.7),
--         width = 300
--       })
--
--      end
--
--      }
--     { rule = { id = 0xc00001  },
----, x = 700, y = 350 , width = 450, height = 600
--       callback =  function(c)
--
--    naughty.notify({ preset = naughty.config.presets.warning,
--                     title = "Oops",
--                     text = 'dadas' })
--       end }
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
  awful.client.movetoscreen(c, awful.screen.focused())
  if c.class == 'cairo-dock' or c.class == 'cube' or c.class == 'onboard' or c.class == 'Onboard' or c.id == 'Onboard' then
    return
  elseif c.class == 'conky' then
    return
    --c.below = true
    --c.focusable = false
    --c.focus = false
    --c.floating = true
    --c:lower()
     --c.unmanage(c)
  else
    client.focus = c
    client.focus:raise()
  end
    -- Enable sloppy focus
   --c:connect_signal("focus", function(c)
--       if c.class == 'conky' or c.class == 'Conky' then
--       else
--         if c.class == 'Cairo-dock' or c.class == 'cairo-dock' then
--           c.below = false
--           c.focus = false
--         end
--       end
--naughty.notify({naughty.config.presets.critical, title = 'conky', text = client.class })
--naughty.notify({naughty.config.presets.critical, title = 'focus_signal', text = c.name })
-- client.focus = c
--  client.focus:raise()
--    end)
 --  c:connect_signal("mouse::enter", function(c)
 --      if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
 --          and awful.client.focus.filter(c) then
 --          client.focus = c
 --      end
 --  end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = true
    --if c and c.class ~= 'Chromium' and c.class ~= 'Cairo-dock' and c.class ~= 'URxvt' and c.class ~= 'Firefox' and titlebars_enabled   then
    --if c and c.class ~= 'Google-chrome' and c.class ~= 'google-chrome' and c.class ~= 'Cairo-dock' and c.class ~= 'Cairo-dock' and c.class ~= 'URxvt' and c.class ~= 'jetbrains-phpstorm'   and c.class ~= 'Firefox' and titlebars_enabled   then
    if c and c.class ~= 'Steam' and c.class ~= 'vrmonitor' and c.class ~= 'Gimp' and c.class ~= 'gimp' and c.class ~= 'Virtualbox' and c.class ~= 'Chromium' and c.class ~= 'chromium' and c.class ~= 'MPlayer' and c.class ~= 'vdpau' and c.class ~= 'Google-chrome' and c.class ~= 'Google-chrome-beta' and c.class ~= 'URxvt' and c.class ~= 'google-chrome' and c.class ~= 'Cairo-dock' and c.class ~= 'Cairo-dock' and c.class ~= 'jetbrains-phpstorm'   and c.class ~= 'Firefox' and c.class ~= 'jetbrains-idea' and titlebars_enabled   then
            -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local title = awful.titlebar.widget.titlewidget(c)
        title:buttons(awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                ))

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(title)
   --     c.border_width = 1
        awful.titlebar(c, {size = "17"}):set_widget(layout)
    end

--        local scr_area = screen[c.screen].workarea
--        local cl_strut = c:struts()
--        local geometry = c:geometry()
--
--        c:geometry({
--          x = scr_area.width / 2 - geometry.width / 2,
--          y = scr_area.height / 2 -  geometry.height / 2
--        })


    function printObj(obj, hierarchyLevel)
        if (hierarchyLevel == nil) then
            hierarchyLevel = 0
        elseif (hierarchyLevel == 4) then
            return 0
        end

        local whitespace = ""
        for i=0,hierarchyLevel,1 do
            whitespace = whitespace .. "-"
        end
        io.write(whitespace)

        print(obj)
        if (type(obj) == "table") then
            for k,v in pairs(obj) do
                io.write(whitespace .. "-")
                if (type(v) == "table") then
                    printObj(v, hierarchyLevel+1)
                else
                    print(v)
                end
            end
        else
            print(obj)
        end
    end

    --require('mobdebug').start()
    if c and (c.class == 'Chromium' or c.class == 'chromium' or c.class == 'Google-chrome' or c.class == 'Google-chrome-beta' or c.class == 'google-chrome' or c.class == 'Firefox'
            or (c.class == 'jetbrains-idea' and c.width > 1800)or (c.class == 'jetbrains-phpstorm' and c.width > 1800)) then
            c.maximized = not c.maximized
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
    else
    --	    c.maximized = true
    --        c.maximized_horizontal = true
    --        c.maximized_vertical   = true
    end
end)

client.connect_signal("focus", function(c)
  c.opacity = 1
  --naughty.notify({naughty.config.presets.critical, title = 'Привет Артём!', text = 'Archlinux is AWESOME!!!' })
  if c.class == 'conky' or c.class == 'cube'
    then
  --naughty.notify({naughty.config.presets.critical, title = 'conky focus signal', text = c.screen })
    if c.screen and awful.client.history then
      c = get_proper_client_for_focus(c)
      if c then
        awful.client.focus = c
      end
    end
    return
  end
  if c.class == 'cairo-dock' or c.class == 'Cairo-dock' then
  --naughty.notify({naughty.config.presets.critical, title = 'this is focus signal', text = c.screen })
    if c.screen and awful.client.history then
      c = get_proper_client_for_focus(c)
      if c then
        awful.client.focus = c
      end
    end
    return
  end
  c.border_color = beautiful.border_focus
  --naughty.notify({naughty.config.presets.critical, title = 'this is focus signal', text = c.class })
end)
client.connect_signal("unfocus", function(c)
	c.border_color = beautiful.border_normal
	if c and c.class ~= 'urxvt' and c.class ~= 'URxvt' and c.class ~= 'libreoffice' and c.class ~= 'libreoffice-startcenter' and c.class ~= 'libreoffice-calc' and c.class ~= 'chromium' and c.class ~= 'Chromium' and c.class ~= 'Skype' and c.class ~= 'skype' and c.class ~= 'Cairo-dock' and c.class ~= 'Gimp' and c.class ~= 'gimp' and c.class ~= 'Virtualbox' and c.class ~= 'Chromium' and c.class ~= 'MPlayer' and c.class ~= 'vdpau' and c.class ~= 'cinelerra' and c.class ~= "Cinelerra" and c.class ~= 'jetbrains-phpstorm' then
		--c.opacity = 0.4
	end
end)
-- }}}
--compton -c -C  -z --vsync opengl --detect-rounded-corners  --refresh-rate 60 --vsync-aggressive -r 15 -l -22 -t -22 -m 1

local quake = require("quake")

local quakeconsole = {}
--for s = 1, screen.count() do
--   quakeconsole[s] = quake({ terminal = "urxvt",
--			     height = 0.6,
--			     screen = s })
--end
quakeconsole[awful.screen.focused()] = quake({
	terminal = "urxvt",
	height = 1,
	screen = s
})

--local mouse = {screen = 1}
globalkeys = awful.util.table.join(
   globalkeys,
   awful.key({ modkey }, "`",
	     function ()
	     	--check_mouse_screen()
	     	quakeconsole[awful.screen.focused()]:toggle()
	     end)
)
globalkeys = awful.util.table.join(
   globalkeys,
   awful.key({ modkey }, "=",
	     function ()
	     	--check_mouse_screen()
	     	quakeconsole[awful.screen.focused()]:changeSize("+")
	     end)
)
globalkeys = awful.util.table.join(
   globalkeys,
   awful.key({ modkey }, "-",
	     function ()
	     	--check_mouse_screen()
	     	quakeconsole[awful.screen.focused()]:changeSize("-")
	     end)
)
globalkeys = awful.util.table.join(
   globalkeys,
   awful.key({ modkey }, "0",
	     function ()
	     	--check_mouse_screen()
	     	quakeconsole[awful.screen.focused()]:changeSize("max")
	     end)
)
globalkeys = awful.util.table.join(
   globalkeys,
   awful.key({ modkey }, "9",
	     function ()
	     	--check_mouse_screen()
	     	quakeconsole[awful.screen.focused()]:changeSize("min")
	     end)
)

-- Set keys
root.keys(globalkeys)
