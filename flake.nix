{
  description = "Alt Keyboard Layouts";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
      flake.nixosModules = {
        akl = {
          imports = [
            ./kanata.nix
          ];
        };
      };
    };
}
