from typing import List
from libqtile import bar, layout, widget, qtile, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
import os
import subprocess

mod = "mod4"
#terminal = "st"
terminal = "alacritty"

keys = [
    Key([mod], "j", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "k", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "i", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    Key([mod, "shift"], "j", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
                desc="Move window to the right"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "i", lazy.layout.shuffle_up(), desc="Move window up"),

    Key([mod, "control"], "j", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "k", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "i", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "q", lazy.spawn("i3lock"), desc="screen lock"),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),
    Key([mod], "d", lazy.spawn("rofi -show run -theme ~/.config/rofi/rofi.rasi"), desc="launch rofi"),
    Key([mod, "control"], "s", lazy.spawn("tkscreenshot.sh"), desc="display screenshot panel"),
    Key([mod, "control"], "p", lazy.spawn("powermenu.sh"), desc="display power panel"),
    #Key([mod], "c", lazy.spawn("code --disable-web-security"), desc="launch visual studio code"),
]

group_names = [("", {'layout': 'columns'}),
    ("", {'layout': 'columns'}),
    ("", {'layout': 'columns'}),
    ("", {'layout': 'columns'}),
    ("ﭮ", {'layout': 'columns'}),
    ("", {'layout': 'columns'}),
    ("", {'layout': 'columns'}),
    ("", {'layout': 'columns'}),
    ("", {'layout': 'columns'}),]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))

def init_layout_theme():
    return {"margin":5,
            "border_width":1,
            "border_focus": "#a3be8c",
            "border_normal": "#b48ead"
            }

layout_theme = init_layout_theme()

layouts = [
    layout.Columns(**layout_theme),
    layout.Max(**layout_theme),
    # Try more layouts by unleashing below layouts.
    #layout.Stack(num_stacks=2, **layout_theme),
    # layout.Bsp(**layout_theme),
    # layout.Matrix(**layout_theme),
    # layout.MonadTall(**layout_theme),
    # layout.MonadWide(**layout_theme),
    # layout.RatioTile(**layout_theme),
    # layout.Tile(**layout_theme),
    # layout.TreeTab(**layout_theme),
    # layout.VerticalTile(**layout_theme),
    #layout.Zoomy(**layout_theme),
]

widget_defaults = dict(
    font='monospace',
    fontsize=10,
    padding=3,
)
extension_defaults = widget_defaults.copy()

colors = [
    "#2e3440", "#3b4252", "#434c5e", "#4c566a",
    "#8fbcbb", "#88c0d0", "#81a1c1", "#5e81ac",
    "#bf616a", "#d08770", "#ebcb8b", "#a3be8c", "#b48ead"
]
def sep():
    return widget.Sep(linewidth=0, padding=4, background=colors[6])

def space():
    return widget.TextBox("  ")

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.TextBox(" ", foreground=colors[5], fontsize=16),
                widget.CurrentLayout(foreground=colors[5]),
                space(),
                sep(),
                widget.GroupBox(background=colors[2], highlight_method="text", active=colors[11], disable_drag = True, rounded=False, this_current_screen_border=colors[9], inactive=colors[5], font="JetBrainsMono Nerd Font", fontsize=14, urgent_alert_method="text", urgent_text=colors[8]),
                sep(),
                space(),
                widget.WindowName(foreground=colors[5]),
                sep(),
                widget.DF(visible_on_warn=False, padding=12, background=colors[11], foreground=colors[0], fontsize=8),
                sep(),
                widget.Memory(padding=12, background=colors[10], fontsize=8, foreground=colors[0]),
                sep(),
                widget.CPU(background=colors[9], fontsize=8, padding=12, foreground=colors[0]),
                sep(),
                widget.Clock(format='%m-%d-%Y %I:%M', background=colors[8], padding=12, fontsize=8, foreground=colors[0]),
                sep(),
                widget.TextBox(" ", fontsize=16, background=colors[12]),
                widget.PulseVolume(background=colors[12], fontsize=12, padding=10) 
            ],
            20,
            background=colors[0],
            opacity=0.95        ),
    ),
]

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),
    Match(wm_class='makebranch'),
    Match(wm_class='makebranch'),
    Match(wm_class='ssh-askpass'),
    Match(title='branchdialog'),
    Match(title='pinentry'),
])

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

auto_minimize = True

wmname = "NORD >>> ALL"

# Autostart
@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])
