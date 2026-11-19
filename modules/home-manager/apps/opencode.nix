{ inputs, ... }:
{
  programs.opencode = {
    enable = true;
    mutableSettings = true;
    context = "${inputs.self}/config/agents/AGENTS.md";
    skills = "${inputs.self}/config/claude/skills";
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
