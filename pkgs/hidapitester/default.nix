{ stdenv
, fetchFromGitHub
, hidapi
, udev
, pkg-config
}:

stdenv.mkDerivation rec {
  name = "hidapitester";
  version = "0.5";

  buildInputs = [
    udev
    hidapi
    pkg-config
  ];


  src = fetchFromGitHub {
    owner = "todbot";
    repo = "hidapitester";
    rev = "v${version}";
    hash = "sha256-OpLeKTouCB3efsXWJO0lZxUHxtDKeBY7OYk0HwC2NF4=";
  };

  postUnpack = ''
    cp --no-preserve=mode -r ${hidapi.src} hidapi
    export HIDAPI_DIR=$PWD/hidapi
  '';

  installPhase = ''
    mkdir -p $out/bin
    install -m755 hidapitester $out/bin
  '';
}
