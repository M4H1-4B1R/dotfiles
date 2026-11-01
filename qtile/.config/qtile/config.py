import os
import subprocess
from libqtile import bar, extension, hook, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy

@hook.subscribe.startup_once
def autostart():
   home = os.path.expanduser('~/.config/qtile/autostart.sh')
   subprocess.run([home])

mod = "mod4"
alt = "mod1"
terminal = "alacritty"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    # Key(
    #     [mod, "shift"],
    #     "Return",
    #     lazy.layout.toggle_split(),
    #     desc="Toggle between split and unsplit sides of stack",
    # ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn("brave"), desc="Launch browser"),
    Key([mod], "e", lazy.spawn("pcmanfm"), desc="Launch file browser"),
    Key([mod, "shift"], "e", lazy.spawn("thunar"), desc="Launch file browser"),
    Key([mod], "s", lazy.spawn("flameshot gui"), desc="Screenshot"),
    Key([mod], "w", lazy.spawn("feh --bg-fill --randomize /home/abir/walls/"), desc="random walls"),
    Key([mod], "x", lazy.spawn("archlinux-logout"), desc="logout screen"),
    Key([mod, "shift"], "Return", lazy.spawn("rofi -show drun"), desc="Launch run luancher"),
    Key([alt], "b", lazy.spawn("brightnessctl s +10%"), desc="increase brightness"),
    Key([alt, "shift"], "b", lazy.spawn("brightnessctl s 10%-"), desc="decrease brightness"),
    Key([alt, "control"], "l", lazy.spawn("betterlockscreen -l"), desc="lockscreen"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "space", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawn("redshift -O 5000"), desc="bluelight filter"),
]

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )

groups = []
group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

# group_labels = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
# group_labels = ["DEV", "WWW", "SYS", "DOC", "VBOX", "CHAT", "MUS", "VID", "GFX"]
# group_labels = [ "一", "二", "三", "四", "五", "六", "七", "八", "九" ]
group_labels = ["", "", "", "", "", "", "", "", "" ]
#group_labels = [" ", " ", " ", " ", " ", " ", "⛨ ", " ", " "]

group_layouts = ["monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall"]


for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        ))
 
for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=False),
                desc="Move focused window to group {}".format(i.name),
            ),
        ]
    )
layouts = [
    #layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4),
    layout.MonadTall(border_width=0, margin=10, ratio=0.5),
    layout.Max(border_width=0),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="JetbrainsMono Nerd Font",
    fontsize=16,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                # widget.CurrentLayoutIcon(scale=0.7),
                widget.TextBox(text="󰣇", fontsize=24, padding=5, foreground="#e0af68"),
                widget.GroupBox(padding = 7, active="#bb9af7", inactive="#ffffff", this_current_screen_border="#bb9af7", borderwidth=2, rounded=True),

                widget.TextBox(
                    text = '|',
                    font = "JetbrainsMono Nerd Font",
                    foreground = "#7d7d7d",
                    padding = 4,
                    fontsize = 14
                 ),
                widget.WindowName(max_chars=30, foreground="#a6e3a1"),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.TextBox(text="", font="JetbrainsMono Nerd Font", fontsize=44, padding=-6, foreground="#1e1e2e"),
                widget.Battery(background="#1e1e2e", foreground="#f5c2e7", battery="BAT0", format="  {percent:2.0%}", padding=5, mouse_callbacks={'Button1': lambda: qtile.cmd_spawn('alacritty -e sudo powertop')}),
                widget.TextBox(text="", font="JetbrainsMono Nerd Font", fontsize=44, padding=-6, foreground="#11111b", background="#1e1e2e"),
                widget.Memory(background="#11111b", foreground="#cba6f7", format='󰍛{MemUsed: .0f}{mm}/{MemTotal: .0f}{mm}', mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn('alacritty -e htop')}, padding=4),
                widget.TextBox(text="", font="JetbrainsMono Nerd Font", fontsize=44, padding=-6, foreground="#1e1e2e", background="#11111b"),
                widget.Backlight(background="#1e1e2e", foreground="#f38ba8", brightness_file="/sys/class/backlight/intel_backlight/brightness", max_brightness_file="/sys/class/backlight/intel_backlight/max_brightness", mouse_callbacks={'Button1': lambda: qtile.cmd_spawn('arandr')}, format=" {percent:2.0%}"),
                widget.TextBox(text="", font="JetbrainsMono Nerd Font", fontsize=44, padding=-6, foreground="#11111b", background="#1e1e2e"),
                widget.Clock(background="#11111b", format="󰥔 %I:%M %p", foreground="#fab387", mouse_callbacks={'Button1': lambda: qtile.cmd_spawn('alacritty -e calcurse')}, padding=5),
                widget.TextBox(text="", font="JetbrainsMono Nerd Font", fontsize=44, padding=-6, foreground="#1e1e2e", background="#11111b"),
                widget.Systray(background="#1e1e2e"),
            ],
            35,
            background="#040507",
            margin = [10,10,5,10],
            border_width = [0,0,0,0],
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        # x11_drag_polling_rate = 60,
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(title="pavucontrol"),  # GPG key password entry
    ],
    border_width=0,
)
auto_fullscreen = True 
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
