{
  description = "Flake to get dissertation writing environment";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };


  outputs = { self, nixpkgs, flake-utils }:
    with flake-utils.lib; eachSystem allSystems (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      texname = "dissertation.tex";
      pdfname = "dissertation";

      tex = (pkgs.texlive.combine { inherit (pkgs.texlive)
        scheme-full
        ;
      });

      rpkgs = with pkgs.rPackages; [
        # r packages if used
      ];

      sysDeps = with pkgs; [
        # necessary programs
        # R
      ];

      editor = with pkgs; [
        # editor utils
      ];

      utils = with pkgs; [
        librsvg # convert svg to pdf
      ];

      fontsConf = pkgs.makeFontsConf {
         fontDirectories = [
            # put fonts here
         ];
      };

      pdfBuildInputs = sysDeps ++ rpkgs ++ utils;

  in rec {
    dissertation = pkgs.stdenvNoCC.mkDerivation rec {
      name = "dissertation";
      src = self;
        buildInputs = [ pkgs.bash pkgs.gnumake pkgs.coreutils tex ] ++ pdfBuildInputs;
        phases = ["unpackPhase" "buildPhase" "installPhase"];
        buildPhase = ''
          export HOME=$(mktemp -d)
          export PATH="${pkgs.lib.makeBinPath buildInputs}";
          export FONTCONFIG_FILE="${fontsConf}"
          make
        '';
        installPhase = ''
          mkdir -p $out
          cp ${pdfname}.pdf $out/
        '';
    };
    packages.default = dissertation;
    devShells.default = pkgs.mkShell {
      nativeBuildInputs = [
        editor
        rpkgs
        sysDeps
        tex
        utils
      ];
      shellHook = ''
        # run on shell startup
      '';
    };
  });
}

# vim:set et sw=2 ts=2:

