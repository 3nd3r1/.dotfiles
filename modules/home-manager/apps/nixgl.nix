{ nixGL, ... }:

{
  nixGL = {
    packages = nixGL.packages;
    defaultWrapper = "mesa";
  };
}
