{
  config,
  lib,
  ...
}:
with lib; let
  defCfg = concatStringsSep "\n" [
    "rapid-event-delay ${toString cfg.rapidEventDelay}"
    cfg.extraDefCfg
  ];
  cfg = config.akl;
in {
  imports = [./layouts];
  options.akl = {
    enable = mkEnableOption "enable alt keyboard layout";

    layout = mkOption {
      type = types.str;
      default = "graphite";
      description = "Choose which layout you want to enable";
    };

    variant = mkOption {
      type = types.str;
      default = "ansi";
      description = "Choose the keyboard variant you use";
    };

    rapidEventDelay = mkOption {
      type = types.int;
      default = 5;
      description = "Set Delay for rapid events. Useful to fix chords and one-shot shifts not working as intended.";
    };

    devices = mkOption {
      type = types.listOf types.str;
      default = [];
      description = "List of input devices for kanata to intercept. Empty list detects all keyboards.";
    };

    config = mkOption {
      type = types.str;
      default = "";
      description = "Additional kanata configuration (e.g., defalias, defchord).";
    };

    extraDefCfg = mkOption {
      type = types.str;
      default = "";
      description = "kanata defcfg options.";
    };
  };

  config = {
    services.kanata = mkIf cfg.enable {
      enable = true;

      keyboards.akl = {
        extraDefCfg = defCfg;
        config = cfg.layoutConfig + cfg.config;
        inherit (cfg) devices;
      };
    };
  };
}
