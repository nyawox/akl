{lib, ...}:
with lib; let
  folder = ./.;
  toImport = name: _value: folder + ("/" + name);
  filterCaches = key: value: value == "regular" && hasSuffix ".nix" key && key != "default.nix";
  imports = mapAttrsToList toImport (filterAttrs filterCaches (builtins.readDir folder));
in {
  options.akl.layoutConfig = mkOption {
    type = types.str;
  };
  inherit imports;
}
