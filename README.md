# AKL Flake

Only tested with vitrimak.
PRs to add more layouts, ISO support, etc are welcome

## Quick Start

```nix
{
  description = "Your NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    akl = {
      url = "github:nyawox/akl";
      # Recommended to not clutter your flake.lock
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, akl, ...}: {
    nixosConfigurations = {
      yourHost = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          # This is not a complete NixOS configuration and you need to reference
          # your normal configuration here.

          # Import the module
          akl.nixosModules.akl

          ({
            akl = {
              enable = true;
              layout = "vitrimak";
            };
          })
        ];
      };
    };
  };
}
```
