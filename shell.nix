let
  nixpkgs = import <nixpkgs> { };
  release = import ./release.nix;
in nixpkgs.haskellPackages.shellFor {
  packages = p: builtins.attrValues release;
  buildInputs = with nixpkgs; [
    haskellPackages.cabal-install
    haskellPackages.ghcid
    haskellPackages.stylish-haskell
  ];
}
