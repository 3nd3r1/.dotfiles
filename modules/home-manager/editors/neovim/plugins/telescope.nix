{
  programs.nixvim.plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native = {
        enable = true;
      };
      ui-select = {
        settings = {
          specific_opts = {
            codeactions = true;
          };
        };
      };
      undo = {
        enable = true;
      };
    };
    keymaps = {
      "<leader>pf" = {
        action = "find_files";
        options.desc = "Find project files";
      };
      "<leader>ps" = {
        action = "live_grep";
        options.desc = "Grep (root dir)";
      };
      "<leader>pb" = {
        action = "buffers";
        options.desc = "+buffer";
      };
      "<leader>pt" = {
        action = "lsp_document_symbols";
        options.desc = "Document symbols";
      };
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>pd";
      action.__raw = ''
        function()
          require("telescope.builtin").find_files({
            find_command = { "find", ".", "-type", "d" },
            prompt_title = "Find Directory",
            attach_mappings = function(_, map)
              map("i", "<CR>", function(prompt_bufnr)
                local entry = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
                require("telescope.actions").close(prompt_bufnr)
                require("oil").open(entry.value)
              end)
              map("n", "<CR>", function(prompt_bufnr)
                local entry = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
                require("telescope.actions").close(prompt_bufnr)
                require("oil").open(entry.value)
              end)
              return true
            end,
          })
        end
      '';
      options = {
        desc = "Find directory (Oil)";
      };
    }
  ];
}
