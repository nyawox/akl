{
  lib,
  config,
  ...
}:
with lib; let
  layoutName = "gallium";
  ansi = ''
    (defsrc
      esc  1     2    3    4    5    6     7    8    9    0    -    =    \    grv
      tab  q     w    e    r    t    y     u    i    o    p    [    ]    bspc
      lctl a     s    d    f    g    h     j    k    l    ;    '    ret
      lsft z     x    c    v    b    n     m    ,    .    /    rsft
      caps lmet                 spc             ralt rmet rctl
    )
    (deflayer ${layoutName}
      esc  1     2    3    4    5    6     7    8    9    0    -    =    \     grv
      tab  b     l    d    c    v    z     y    o    u    ,    [    ]    bspc
      lctl n     r    t    s    g    p     h    a    e    i    /    ret
      lsft q     x    m    w    j    k     f    '    ;    .    rsft
      caps lmet                 spc             ralt rmet rctl
    )
  '';
  jis = ''
    (defsrc
      grv  1    2    3    4    5    6    7    8    9    0    -    =    ¥   bspc
      tab  q    w    e    r    t    y    u    i    o    p    [    ]    ret
      caps a    s    d    f    g    h    j    k    l    ;    '    \
      lsft z    x    c    v    b    n    m    ,    .    /    ro   rsft
      lctl lmet lalt mhnk      spc       henk  kana ralt prtsc rctl
    )

    (deflayer ${layoutName}
      grv  1    2    3    4    5    6    7    8    9    0    -    =    ¥   bspc
      tab  b    l    d    w    z    '    f    o    u    j    [    ]    ret
      caps n    r    t    s    g    y    h    a    e    i    ;    \
      lsft q    x    m    c    v    k    p    ,    .    /    ro   rsft
      lctl lmet lalt mhnk      spc       henk  kana ralt prtsc rctl
    )
  '';
in {
  config = mkIf (config.akl.layout == layoutName) {
    akl.layoutConfig = concatStringsSep "\n" [
      (optionalString (config.akl.variant == "ansi") ansi)
      (optionalString (config.akl.variant == "jis") jis)
    ];
  };
}
