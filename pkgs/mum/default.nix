{ lib
, fetchFromGitHub
, rustPlatform
, pkg-config
, cmake
, openssl
, glib
, gdk-pixbuf
, alsa-lib
, libnotify
, libopus
}:

rustPlatform.buildRustPackage rec {
  pname = "mum";
  # renovate: datasource=github-releases depName=mum-rs/mum
  version = "0.5.1";
  src = fetchFromGitHub {
    owner = "mum-rs";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-r2isuwXq79dOQQWB+CsofYCLQYu9VKm7kzoxw103YV4=";
  };

  cargoLock = {
    lockFile = "${src}/Cargo.lock";
  };

  nativeBuildInputs = [
    pkg-config
    cmake
  ];

  buildInputs = [
    openssl
    glib
    gdk-pixbuf
    alsa-lib
    libnotify
    libopus
  ];

  meta = with lib; {
    description = "Daemon/cli mumble client";
    homepage = "https://github.com/mum-rs/mum";
    license = licenses.mit;
  };
}
