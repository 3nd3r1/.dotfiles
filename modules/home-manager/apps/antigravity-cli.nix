{
  programs.antigravity-cli = {
    enable = true;
    mutableSettings = true;
    context.AGENTS = ../../../config/agents/AGENTS.md;
    skills = ../../../config/claude/skills;
    settings = {
      agentMode = "auto";
      enableTerminalSandbox = false;
    };
  };
}
