{ pkgs, ... }:

[{
  plugin = pkgs.tmuxPlugins.tokyo-night-tmux;
  extraConfig = ''
    color_dark="color0"
    color_light="color7"
    color_session_text="color3"
    color_status_text="colour245"
    color_main="colour1"
    color_secondary="colour4"
    color_level_ok="colour076"
    color_level_warn="colour220"
    color_level_stress="colour160"
    color_window_off_indicator="colour088"
    color_window_off_status_bg="colour238"
    color_window_off_status_current_bg="colour254"
    set -g mode-style "fg=default,bg=$color_main"

    # command line style
    set -g message-style "fg=$color_main,bg=$color_dark"

    # status line style
    set -g status-style "fg=$color_status_text,bg=$color_dark"

    # window segments in status line
    set -g window-status-separator ""
    separator_powerline_left=""
    separator_powerline_right=""

    setw -g window-status-style "fg=$color_status_text,bg=$color_dark"
    setw -g window-status-format " #I:#W "
    setw -g window-status-current-style "fg=$color_light,bold,bg=$color_main"
    setw -g window-status-current-format "#[fg=$color_dark,bg=$color_main]$separator_powerline_right#[default] #I:#W# #[fg=$color_main,bg=$color_dark]$separator_powerline_right#[default]"

    # when window has monitoring notification
    setw -g window-status-activity-style "fg=$color_main"

    # outline for active pane
    setw -g pane-active-border-style "fg=$color_main"

    # general status bar settings
    set -g status on
    set -g status-interval 5
    set -g status-position top
    set -g status-justify left
    set -g status-right-length 100

    # define widgets we're going to use in status bar
    # note, that this is not the complete list, some of them are loaded from plugins
    wg_session="#[fg=$color_session_text] #S #[default]"
    wg_host="#[default]#H"
    wg_git_branch="#(cd #{pane_current_path}; git rev-parse --abbrev-ref HEAD)"
    wg_kube_context="#(/bin/bash $HOME/.config/tmux/plugins/kube-tmux/kube.tmux)"
    wg_is_zoomed="#[fg=$color_dark,bg=$color_secondary]#{?window_zoomed_flag,[Z],}#[default]"
    wg_is_keys_off="#[fg=$color_light,bg=$color_window_off_indicator]#([ $(tmux show-option -qv key-table) = 'off' ] && echo 'OFF')#[default]"

    set -g status-right-length 120
    set -g status-left "$wg_session"
    set -g status-right "#{prefix_highlight} $wg_is_keys_off $wg_is_zoomed #{sysstat_cpu}  #{sysstat_mem}   $wg_kube_context  $wg_host"
  '';
}]
