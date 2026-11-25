{
  programs.opencode = {
    enable = true;
    mutableSettings = true;
    context = ../../../config/agents/AGENTS.md;
    skills = ../../../config/claude/skills;
    validateFiles = {
      config = true;
      cli = true;
    };
    settings = {
      update = "disable";
      share = "disabled";
    };
    cli = {
      theme = {
        name = "system";
        mode = "dark";
      };
      attention.notifications = true;
    };
  };
}
