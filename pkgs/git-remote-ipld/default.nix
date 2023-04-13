{ lib, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  pname = "git-remote-ipld";
  version = "2a9c97b";
  src = fetchFromGitHub {
    owner = "ipfs-shipyard";
    repo = pname;
    rev = version;
    hash = "sha256-qxVNEVUK4JqaFAFYsIi/odnLi1DoJRc9pAmkB0nXxWk=";
  };
  vendorSha256 = "sha256-LpQYi8pqMIiNjDyXiNSEF8kwciK6eQq/yyPsgsArHko=";
  doCheck = false;

  meta = with lib; {
    description = "Git IPLD remote helper";
    homepage = "https://github.com/ipfs-shipyard/git-remote-ipld";
    license = licenses.mit;
  };
}
