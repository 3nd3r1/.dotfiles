{
  programs.obsidian = {
    enable = true;
    cli.enable = true;

    # Applied to every vault unless the vault overrides them.
    defaultSettings = {
      app = {
        alwaysUpdateLinks = true;
        defaultViewMode = "source";
        promptDelete = false;
        showLineNumber = true;
        spellcheck = false;
      };

      appearance = {
        theme = "obsidian";
        nativeMenus = false;
      };

      corePlugins = [
        "backlink"
        "bookmarks"
        "canvas"
        "command-palette"
        "daily-notes"
        "editor-status"
        "file-explorer"
        "file-recovery"
        "global-search"
        "graph"
        "note-composer"
        "outgoing-link"
        "outline"
        "page-preview"
        "properties"
        "switcher"
        "tag-pane"
        "templates"
        "word-count"
        "bases"
      ];
    };
  };
}
