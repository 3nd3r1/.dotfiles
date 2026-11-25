{ inputs, ... }:
{
  programs.antigravity-cli = {
    enable = true;
    mutableSettings = true;
    context.AGENTS = "${inputs.self}/config/agents/AGENTS.md";
    skills = "${inputs.self}/config/claude/skills";
  };
}
