{
  description = "Bitmessage client in Rust";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          cargo
          rustc
          rustfmt
          clippy
          pkg-config
          openssl
          glib
          gtk3
          gdk-pixbuf
          pango
          cairo
          harfbuzz
          librsvg
          xdotool
          libayatana-appindicator
          libGL
          libXcursor
          libXi
          libXrandr
          libXinerama
          wayland
          libxkbcommon
        ];

        RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";

        LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
          pkgs.glib
          pkgs.gtk3
          pkgs.gdk-pixbuf
          pkgs.pango
          pkgs.cairo
          pkgs.harfbuzz
          pkgs.librsvg
          pkgs.xdotool
          pkgs.libayatana-appindicator
          pkgs.openssl
          pkgs.zlib
          pkgs.xz
          pkgs.libGL
          pkgs.libXcursor
          pkgs.libXi
          pkgs.libXrandr
          pkgs.libXinerama
          pkgs.wayland
          pkgs.libxkbcommon
        ];
      };
    };
}
