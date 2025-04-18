# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage
{pkgs ? import <nixpkgs> {}}: {
  # The `lib`, `modules`, and `overlay` names are special
  lib = import ./lib {inherit pkgs;}; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  keyboard_layout_optimizer = pkgs.callPackage ./pkgs/keyboard_layout_optimizer {};
  polybar-pulseaudio-control = pkgs.callPackage ./pkgs/polybar-pulseaudio-control {};

  python3Packages = pkgs.recurseIntoAttrs (
    pkgs.python3Packages.callPackage ./pkgs/python-pkgs {}
  );
  yaookctl = pkgs.python3Packages.callPackage ./pkgs/yaookctl {};

  shrinkpdf = pkgs.callPackage ./pkgs/shrinkpdf {};
  hidapitester = pkgs.callPackage ./pkgs/hidapitester {};
  list-iommu-groups = pkgs.callPackage ./pkgs/list-iommu-groups {};
  git-rstash = pkgs.callPackage ./pkgs/git-rstash {};
  cb = pkgs.callPackage ./pkgs/cb {};
  toki = pkgs.callPackage ./pkgs/toki {};
  task-timewarrior-hook = pkgs.callPackage ./pkgs/task-timewarrior-hook {};
  garden = pkgs.callPackage ./pkgs/garden {};
  bugwarrior = pkgs.callPackage ./pkgs/bugwarrior {};
  acloud-dl = pkgs.callPackage ./pkgs/acloud-dl {};

  cntb-bin = pkgs.callPackage ./pkgs/cntb-bin {};
  rofi-blocks = pkgs.callPackage ./pkgs/rofi-blocks {};
  coord = pkgs.callPackage ./pkgs/coord {};
  ruqola = pkgs.callPackage ./pkgs/ruqola {};
}
