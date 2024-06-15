----------------------------------------------------------------
-- Effortless wmii-style dynamic tagging.
----------------------------------------------------------------
-- Lucas de Vries <lucas@glacicle.org>
-- Licensed under the WTFPL version 2
--   * http://sam.zoy.org/wtfpl/COPYING
----------------------------------------------------------------
-- To use this module add:
--   require("eminent")
-- to the top of your rc.lua. 
--
-- That's it. Through magical monkey-patching, all you need to
-- do to start dynamic tagging is loading it.
--
-- Use awesome like you normally would, you don't need to
-- change a thing.
----------------------------------------------------------------

-- Grab environment
local ipairs = ipairs
local pairs = pairs
local awful = require("awful")
local naughty = require("naughty")
local table = table
local capi = {
    tag = tag,
    mouse = mouse,
    client = client,
    screen = screen,
    wibox = wibox,
    timer = timer,
    keygrabber = keygrabber,
}

-- Grab the original functions we're replacing
local orig = {
    viewidx = awful.tag.viewidx,

    taglist = awful.widget.taglist.new,
}

-- Return tags with stuff on them, mark others hidden
local gettags = function(screen)
    local tags = {}
    local add_tag = true
    local new_tag = nil

    for k, t in ipairs(awful.tag.gettags(screen)) do
        local has_clients = (#t:clients() > 0)
        if has_clients then
            add_tag = t.selected
            new_tag = nil
        end
        if t.selected or has_clients then
            awful.tag.setproperty(t, "hide", false)
            table.insert(tags, t)
        else
            awful.tag.setproperty(t, "hide", true)
            if add_tag and new_tag == nil then
                new_tag = t
            end
        end
    end

    if add_tag and new_tag ~= nil then
        awful.tag.setproperty(new_tag, "hide", false)
        table.insert(tags, new_tag)
    end

    return tags
end


-- Update hidden status
local function uc(c) gettags(c.screen) end
local function ut(s, t) gettags(s.index) end

capi.client.connect_signal("unmanage", uc)
capi.client.connect_signal("new", function(c)
    c:connect_signal("property::screen", uc)
    c:connect_signal("tagged", uc)
    c:connect_signal("untagged", uc)
end)

for screen=1, capi.screen.count() do
    awful.tag.attached_connect_signal(screen, "property::selected", uc)
    capi.screen[screen]:connect_signal("tag::history::update", ut)
end
