{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage rec {
  pname = "openstack-rs";
  version = "0.9.5";
  src = fetchFromGitHub {
    owner = "gtema";
    repo = "openstack";
    tag = "v${version}";
    hash = "sha256-L06meGBiO/eKbPODJYbvfFYnOVtFzbXnzSLveWLYX/U=";
  };

  cargoLock = {
    lockFile = "${src}/Cargo.lock";
  };

  doCheck = false;

  meta = with lib; {
    description = "OpenStack SDK and CLI for Rust";
    homepage = "https://github.com/gtema/openstack";
    license = licenses.asl20;
  };
}
