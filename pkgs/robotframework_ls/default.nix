{
  lib,
  python3,
  fetchFromGitHub,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "robotframework-lsp";
  version = "1.13.0";

  src = fetchFromGitHub {
    owner = "robocorp";
    repo = "robotframework-lsp";
    rev = "robotframework-lsp-${version}";
    hash = "sha256-Dwm3J2FiWKV6sURolx+oFGyzMLwcoa/2uNbyMD6+SZc=";
  };

  pyproject = false;

  sourceRoot = "source/robotframework-ls/src";

  nativeBuildInputs = with python3.pkgs; [
    setuptools
  ];

  propagatedBuildInputs = with python3.pkgs; [
    robotframework
  ];

  pythonImportsCheck = [ "robotframework_ls" ];

  meta = with lib; {
    description = "Language Server Protocol implementation for Robot Framework";
    homepage = "https://github.com/robocorp/robotframework-lsp";
    license = licenses.asl20;
    maintainers = [ ];
    mainProgram = "robotframework_ls";
  };
}
