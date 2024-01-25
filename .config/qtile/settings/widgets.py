from libqtile import widget
from libqtile.command import lazy
from .theme import colors

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)

def base(fg='text', bg='dark'): 
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }


def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)


def icon(fg='text', bg='dark', fontsize=16, text="?"):
    return widget.TextBox(
        **base(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=3
    )


def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
        text="",
        fontsize=37,
        padding=-2
    )


def workspaces(): 
    return [
        separator(),
        widget.GroupBox(
            **base(fg='light'),
            font='MesloLGLDZNerdFont',
            fontsize=15,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=1,
            active=colors['active'],
            inactive=colors['inactive'],
            rounded=False,
            highlight_method='block',
            urgent_alert_method='block',
            urgent_border=colors['urgent'],
            this_current_screen_border=colors['focus'],
            this_screen_border=colors['grey'],
            other_current_screen_border=colors['dark'],
            other_screen_border=colors['dark'],
            disable_drag=True
        ),
        separator(),
        powerline('color5', 'dark'),
        widget.CurrentLayoutIcon(**base(bg='color5'), scale=0.65, padding=10),
        widget.CurrentLayout(**base(bg='color5'), padding=5),
        powerline('dark', 'color5'),
        separator(),
        widget.WindowName(**base(fg='focus'), fontsize=14, padding=5),
    ]


primary_widgets = [
    *workspaces(),

    separator(),

    powerline('color5', 'dark'),

    icon(bg="color5", text='  '), # Icon: nf-fa-download
    widget.CheckUpdates(
        background=colors['color5'],
        colour_have_updates=colors['text'],
        colour_no_updates=colors['text'],
        no_update_string='0',
        display_format='{updates}',
        update_interval=1800,
        distro="Ubuntu",
    ),

    powerline('color4', 'color5'),

    icon(bg="color4", text='  '),  # Icon: nf-fa-feed
    widget.Wlan(**base(bg='color4'), interface='wlp0s20f3',
                disconnected_message='Disconnected', format='{essid}',
                mouse_callbacks={'Button3': lazy.spawn('st -e nmtui')}),

    powerline('color3', 'color4'),

    widget.Volume(**base(bg='color3'), device='pulse',
                  fontsize=17,
                  emoji=True,
                  emoji_list=[' 󰝟 ', ' 󰕿 ', ' 󰖀 ', ' 󰕾 '],
                  mouse_callbacks={'Button3': lazy.spawn('st -e pulsemixer')}),
    widget.Volume(**base(bg='color3'), device='pulse',
                  mouse_callbacks={'Button3': lazy.spawn('st -e pulsemixer')}),

    powerline('color2', 'color3'),

    widget.Battery(**base(bg='color2'), format=' {char} {percent:2.0%}',
                   charge_char='󰂄', full_char='󰁹', discharge_char='󰂂',
                   empty_char='󰁻', not_charging_char='󰂂', update_interval=5, show_short_text=False),
    powerline('color1', 'color2'),

    icon(bg="color1", fontsize=17, text='  '), # Icon: nf-mdi-calendar_clock

    widget.Clock(**base(bg='color1'), format='%d/%m - %H:%M '),

    powerline('dark', 'color1'),

    widget.Systray(background=colors['dark'], padding=5),
]

secondary_widgets = [
    *workspaces(),

    separator(),
    powerline('color2', 'dark'),
    icon(bg="color2", fontsize=17, text='  '), # Icon: nf-mdi-calendar_clock
    widget.Clock(**base(bg='color2'), format='%d/%m - %H:%M  '),
    powerline('dark', 'color2'),
]

widget_defaults = {
    'font': 'MesloLGLDZNerdFont',
    'fontsize': 14,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()
