self: super:
let
  # Filter the source based on the gitignore file. The path is the source path,
  # in which the gitignore should reside under `.gitignore`.
  gitignore = path:
  super.nix-gitignore.gitignoreSourcePure [ (path + /.gitignore) ] path;
  vividOverrides = selfh: superh:
  let src = gitignore ./.;
  in { vivid = (selfh.callCabal2nix "vivid" src { }); };
in {
  haskellPackages = super.haskellPackages.override (old: {
    overrides =
    super.lib.composeExtensions (old.overrides or (_: _: { })) vividOverrides;
  });
}
