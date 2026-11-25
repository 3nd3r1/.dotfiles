{
  programs.codex = {
    enable = true;
    mutableSettings = true;
    context = ../../../config/agents/AGENTS.md;
    settings = {
      model = "gpt-6-luna";
      model_reasoning_effort = "high";
      approval_policy = "on-request";
      approvals_reviewer = "auto_review";
      sandbox_mode = "workspace-write";
    };
  };
}
