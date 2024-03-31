let
  pkgs = import <nixpkgs> {};
  ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_12;
  # dream = ocamlPackages.buildDunePackage rec {
  #   pname = "dream";
  #   version = "0.15.0";

  #   minimalOCamlVersion = "4.12";

  #   src = pkgs.fetchFromGitHub {
  #     owner  = "aantron";
  #     repo   = pname;
  #     rev    = version;
  #     hash   = "sha256-vVRjQzDDeaiY047bBS0Ncvz1p3SpH8nlLBUs3Ay2aIs=";
  #   };
  #   doCheck = true;
  #   checkInputs = [
  #     alcotest-lwt
  #   ];
  #   propagatedBuildInputs = [
  #     ocamlPackages.lwt_ppx
  #     ocamlPackages.magic-mime
  #     ocamlPackages.httpaf
  #   ];
  # };
in
pkgs.mkShell {
  packages = [
    pkgs.opam 
    pkgs.ocaml
    pkgs.dune_3
    ocamlPackages.findlib
    ocamlPackages.ocaml-lsp
    # ocamlPackages.eliom
  ];
}