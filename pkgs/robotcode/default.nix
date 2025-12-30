{ python3Packages, fetchFromGitHub }:

python3Packages.buildPythonPackage rec {
  pname = "robotcode";
  version = "0.109.4";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "robotcodedev";
    repo = "robotcode";
    rev = "v${version}";
    sha256 = "sha256-xmL0kmoLun900Oa/cX/dkgLyY24XH8bLqVACFQtuRco=";
  };

  build-system = with python3Packages; [
    hatchling
  ];

  dependencies = with python3Packages; [
    robotframework
    click
    tomlkit
    typing-extensions
  ];

  doCheck = false;
  pythonRemoveDeps = true;

  meta = {
    description = "Language Server and more for Robot Framework";
    homepage = "https://github.com/robotcodedev/robotcode";
  };
}
