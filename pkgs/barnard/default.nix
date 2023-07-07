{ lib
, buildGoPackage
, fetchFromGitHub
}:
buildGoPackage rec {
  pname = "barnard";
  version = "c9876db";
  goPackagePath = "github.com/bmmcginty/barnard";
  src = fetchFromGitHub {
    owner = "bmmcginty";
    repo = pname;
    rev = version;
    hash = "sha256-eyfIbjD0fKJBNbKa4toWnPC0k0GZh4jSyx06bPmyqew=";
  };
  vendorHash = "";

  meta = with lib; {
    description = "barnard is a terminal-based client for the Mumble voice chat software";
    homepage = "https://github.com/bmmcginty/barnard";
    license = licenses.gpl2;
  };
}
