{
  lib,
  fetchFromGitHub,
  jre,
  maven,
}:
maven.buildMavenPackage rec {
  pname = "keycloak-magic-link";
  version = "0.34";

  src = fetchFromGitHub {
    owner = "p2-inc";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-TINmbaKY8LxBYlMBE/bMRvtRoBMAWy7yCOVH7bBLaYQ=";
  };

  mvnHash = "";

  installPhase = ''
    install -Dm644 target/keycloak-magic-link-${version}.jar $out/keycloak-magic-link-${version}.jar
  '';

  meta = with lib; {
    homepage = "https://github.com/p2-inc/keycloak-magic-link";
    description = "Magic Link Authentication for Keycloak";
    # license = licenses.elastic20;
    # maintainers = with maintainers; [];
  };
}
