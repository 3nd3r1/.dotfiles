{
  programs.claude-code = {
    enable = true;
    mutableSettings = true;
    context = ../../../config/agents/AGENTS.md;
    skills = ../../../config/claude/skills;
    settings = {
      attribution = {
        commit = "";
        pr = "";
        sessionUrl = false;
      };
      permissions.defaultMode = "auto";
      model = "opus";
      enabledPlugins = {
        "github@claude-plugins-official" = true;
        "clangd-lsp@claude-plugins-official" = true;
      };
      modelSettings = {
        claude-opus-5.effortLevel = "high";
        claude-opus-5-5.effortLevel = "medium";
        claude-fable-5-2.effortLevel = "medium";
      };
      tui = "fullscreen";
      voice = {
        enabled = true;
        mode = "hold";
      };
      theme = "dark-ansi";
      editorMode = "vim";
      remoteControlAtStartup = true;
      agentPushNotifEnabled = true;
    };
  };
}
