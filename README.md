# AKL Flake

Not tested.
PRs to add more layouts, ISO support, etc are welcome

## Quick Start

**flake.nix**
```nix
inputs = {
  akl = {
    url = "github:nyawox/akl";
    inputs.nixpkgs.follows = "nixpkgs";
  };
};
```

**configuration.nix**
```nix
{inputs, ...}: {
  imports = [inputs.akl.nixosModules.akl];
  akl = {
    enable = true;
    layout = "vitrimak";
  };
}
```
