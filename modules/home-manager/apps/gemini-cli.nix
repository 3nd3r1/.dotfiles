{ pkgs, inputs, ... }:
{
  home.packages = [ pkgs.gemini-cli ];

  home.file = {
    ".gemini/GEMINI.md".source = "${inputs.self}/config/agents/AGENTS.md";
    ".gemini/skills".source = "${inputs.self}/config/claude/skills";
  };
}
