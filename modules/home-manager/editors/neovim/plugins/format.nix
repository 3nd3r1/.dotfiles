{ pkgs, ... }:
let
  prettierFormat = {
    __unkeyed-1 = "prettierd";
    __unkeyed-2 = "prettier";
    stop_after_first = true;
  };
in {
  home.packages = with pkgs; [
    stylua
    isort
    black
    prettier
    prettierd
    robotframework-tidy
    go
    beautysh
    nixfmt
    deno
  ];

  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        lua = [ "stylua" ];
        python = [ "isort" "black" ];
        javascript = prettierFormat;
        javascriptreact = prettierFormat;
        typescript = prettierFormat;
        typescriptreact = prettierFormat;
        html = prettierFormat;
        css = prettierFormat;
        scss = prettierFormat;
        yaml = prettierFormat;
        robot = [ "robotidy" ];
        go = [ "gofmt" "goimports" ];
        markdown = prettierFormat;
        json = prettierFormat;
        bash = [ "beautysh" ];
        sh = [ "beautysh" ];
        nix = [ "nixfmt" ];
      };

      formatters = {
        dockfmt = {
          command = "/usr/local/bin/dockfmt";
          args = [ "fmt" "$FILENAME" ];
        };

        robotidy = {
          command = "robotidy";
          args.__raw = ''
            function()
              local fp = io.open(os.getenv("HOME") .. "/.robotidy.toml", "r")
              if fp ~= nil then
                io.close(fp)
                return { "--config", os.getenv("HOME") .. "/.robotidy.toml", "$FILENAME", "--overwrite" }
              else
                return { "$FILENAME", "--overwrite" }
              end
            end
          '';
          range_args.__raw = ''
            function(self, ctx)
              local fp = io.open(os.getenv("HOME") .. "/.robotidy.toml", "r")
              if fp ~= nil then
                io.close(fp)
                return {
                  "--startline",
                  ctx.range["start"][1],
                  "--endline", 
                  ctx.range["end"][1],
                  "--config",
                  os.getenv("HOME") .. "/.robotidy.toml",
                  "$FILENAME",
                  "--overwrite",
                }
              else
                return {
                  "--startline",
                  ctx.range["start"][1],
                  "--endline",
                  ctx.range["end"][1], 
                  "$FILENAME",
                  "--overwrite",
                }
              end
            end
          '';
          stdin = false;
        };

        deno_fmt = {
          command = "deno";
          args = [ "fmt" "-" ];
          cwd.__raw = ''
            function(_, ctx)
              return vim.fn.fnamemodify(ctx.filename, ":h")
            end
          '';
        };
      };
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>f";
      action.__raw = ''
        function()
          require("conform").format({
            lsp_format = "fallback",
          })
        end
      '';
      options = { desc = "Format code"; };
    }

    {
      mode = "v";
      key = "<leader>f";
      action.__raw = ''
        function()
          require("conform").format({
            lsp_format = "fallback",
          })
        end
      '';
      options = { desc = "Format code"; };
    }
  ];
}
