{ pkgs ? import <nixpkgs> {} }:
pkgs.callPackage ./spotify-with-error-handling.nix {}
