{ lib
, fetchFromGitLab
, rustPlatform
}:

rustPlatform.buildRustPackage rec {
  pname = "garden";
  version = "0.9.1";
  src = fetchFromGitLab {
    owner = "garden-rs";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-cUnkfP7r8tuFSuGHXwRyki12nmpTX7iHzrUkj67S5sk=";
  };
  cargoSha256 = "sha256-tTd6OThaJIm/mf917WVrDOwj/GeNuNhNPEG8/ycbNCk=";

  doCheck = false;

  meta = with lib; {
    description = "Garden grows and cultivates collections of Git trees.";
    homepage = "https://gitlab.com/garden-rs/garden";
    license = licenses.mit;
  };
}
