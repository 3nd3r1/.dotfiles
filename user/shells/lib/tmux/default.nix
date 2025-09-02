{ pkgs, settings, ... }:
let theme = import ./themes/pain.nix { inherit pkgs; };
in {
  programs.tmux = {
    enable = true;
    prefix = "C-a";
    terminal = "tmux-256color";
    escapeTime = 0;
    mouse = true;
    historyLimit = 10000;
    plugins = with pkgs.tmuxPlugins;
      [
        vim-tmux-navigator
        {
          plugin = resurrect;
          extraConfig = ''
            set -g @resurrect-save 'C-F1'
            set -g @resurrect-restore 'C-F2'
          '';
        }
        {
          plugin = continuum;
          extraConfig = ''
            set -g @continuum-restore 'on'
          '';
        }
        sensible
        prefix-highlight
        yank
        tmux-fzf
        #tmux-window-name
        #kube-tmux
      ] ++ theme;
    extraConfig = ''
      # Tmux nesting
      if-shell 'test -n "$SSH_CLIENT"' 'unbind F12'
      bind -T root F12  \
          set prefix None \;\
          set key-table off \;\
          set status off \;\
          if -F '#{pane_in_mode}' 'send-keys -X cancel' \;\
          refresh-client -S \;\

      bind -T off F12 \
        set -u prefix\;\
        set -u status\;\
        set -u key-table \;\
        refresh-client -S

      ####################
      #     Shortcuts    #
      ####################

      # new window and retain cwd
      bind c new-window -c "#{pane_current_path}"

      # Rename session and window
      bind r command-prompt -I "#{window_name}" "rename-window '%%'"
      bind R command-prompt -I "#{session_name}" "rename-session '%%'"

      # Split panes
      bind | split-window -h -c "#{pane_current_path}"
      bind _ split-window -v -c "#{pane_current_path}"

      # Select pane and windows
      bind -r k select-pane -U
      bind -r j select-pane -D
      bind -r h select-pane -L
      bind -r l select-pane -R
      bind -r C-o swap-pane -D

      # Copy mode
      bind q copy-mode
      bind-key -T copy-mode-vi v send-keys -X begin-selection

      # Zoom pane
      bind + resize-pane -Z

      # Kill pane/window/session shortcuts
      bind x kill-pane
      bind X kill-window

      # Detach from session
      bind d detach

      # Cht
      bind-key -r i run-shell "tmux neww cht.sh --shell"

      # Session switcher
      bind-key -r f run-shell -b "$HOME/.config/tmux/plugins/tmux-fzf/scripts/session.sh switch"
    '';
  };
}
