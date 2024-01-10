{ buildGoModule
, fetchurl
, fetchFromGitHub
, openapi-generator-cli
, lib }:

let
  contabo-api-v1 = fetchurl {
    url = "https://api.contabo.com/api-v1.yaml";
    sha256 = "sha256-JfuqPEqUKnV6aZHD7X9NrC2NZ25zIpUnhVhBmEvob80=";
  };
in
buildGoModule rec {
  pname = "cntb";
  version = "1.4.2";
  src = fetchFromGitHub {
    owner = "contabo";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-8PxFqms2wSewDrdabmxxewYH3tdmHg30jDqi0MLLw3c=";
  };
  vendorHash = "sha256-6qv++UTPho6MEO76i5GCIR22LQ6a5K8xFO9ZH/zHv/w=";

  nativeBuildInputs = [
    openapi-generator-cli
  ];

  preBuild = ''
    openapi-generator-cli generate --skip-validate-spec --input-spec ${contabo-api-v1} --generator-name  go --output .
  '';

  meta = with lib; {
    description = "cntb is a command-line interface (CLI) for managing your products from Contabo like VPS and VDS.";
    homepage = "https://github.com/contabo/cntb";
    license = licenses.gpl3;
  };
}
