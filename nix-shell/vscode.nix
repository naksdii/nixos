{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    clang-tools
    gcc
    bear
    nixfmt
    nil
  ];
  shellHook = ''
    code
    '';
}
