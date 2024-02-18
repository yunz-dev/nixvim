{
  description = "A nixvim configuration";

  inputs = {
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixvim
    , flake-utils
    , nixpkgs
    , ...
    } @ inputs:
    let
      config = import ./config; # import the module directly
    in
    flake-utils.lib.eachDefaultSystem (system:
    let
      nixvimLib = nixvim.lib.${system};
      pkgs = import nixpkgs { inherit system; };
      nixvim' = nixvim.legacyPackages.${system};
      nvim = nixvim'.makeNixvimWithModule {
        inherit pkgs;
        module = config;
        # You can use `extraSpecialArgs` to pass additional arguments to your module files
        extraSpecialArgs = {
          # inherit (inputs) foo;
        };
      };
    in
    {
      checks = {
        # Run `nix flake check` to verify that your config is not broken
        default = nixvimLib.check.mkTestDerivationFromNvim {
          inherit nvim;
          name = "Akari";
        };
      };

      # Lets you run `nix run` to start nixvim
      packages.default = nvim;
    });
}
