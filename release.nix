let 
  overlays = [ (import ../vivid-supercollider/overlay.nix) (import ./overlay.nix)];
  defPkgs = import <nixpkgs> { inherit overlays; }; # add the modified vivid package to haskellPackages
in 
{ inherit (defPkgs.haskellPackages) vivid; }
