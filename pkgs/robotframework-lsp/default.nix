{ python3Packages, fetchPypi }:
python3Packages.buildPythonApplication rec {
  pname = "robotframework-lsp";
  version = "1.11.0";
  format = "setuptools";
  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-/GN2bN2S2SAV9FsfN28Qky/drMas0B0MXfVZkIVhwVM=";
  };
  doCheck = false;
}
