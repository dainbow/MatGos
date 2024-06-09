{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell { packages = with pkgs; [ typst typst-preview ]; }
