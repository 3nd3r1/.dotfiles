{
  programs.ruff = {
    enable = true;
    settings = {
      line-length = 88;
      target-version = "py38";

      lint = {
        # Select rule categories - not too strict
        select = [
          "E" # pycodestyle errors (indentation, whitespace)
          "W" # pycodestyle warnings
          "F" # pyflakes (imports, undefined variables)
          "I" # isort (import sorting)
          "N" # pep8-naming (basic naming conventions)
          "UP" # pyupgrade (modernize Python syntax)
          "B" # flake8-bugbear (common bugs)
          "Q" # flake8-quotes (quote consistency)
        ];

        # Rules to ignore (keep it relaxed)
        ignore = [
          "E501" # Line too long (let formatter handle this)
          "B008" # Do not perform function calls in argument defaults
          "N803" # Argument name should be lowercase (too strict for existing code)
          # N806 removed - now checking variable names
        ];

        flake8-quotes = {
          # Enforce double quotes instead of single quotes
          inline-quotes = "double";
          multiline-quotes = "double";
          docstring-quotes = "double";
        };

        isort = {
          # Keep import sorting simple
          known-first-party = [ ];
          force-single-line = false;
          lines-after-imports = 2;
        };

        pep8-naming = {
          # Relax some naming rules
          ignore-names = [
            "setUp"
            "tearDown"
            "setUpClass"
            "tearDownClass"
          ];
        };
      };

      format = {
        # Use double quotes for consistency
        quote-style = "double";
        indent-style = "space";
        line-ending = "auto";
      };
    };
  };

  programs.nixvim.plugins.lsp.servers = {
    pyright = {
      enable = true;
    };
    ruff = {
      enable = true;
    };
  };
}
