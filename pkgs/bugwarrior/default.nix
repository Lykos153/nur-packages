{ lib
, python3Packages
, fetchFromGitHub
}:
with python3Packages;

buildPythonApplication rec {
  pname = "bugwarrior";
  version = "15ac6a2197f490db3cf9b5a4a934b5a41804ce76";

  src = fetchFromGitHub {
    owner = "ralphbean";
    repo = pname;
    rev = "${version}";
    hash = "sha256-pKyPnjazSQoy12IQP+Av2Qod0bCMLep2YG2cVC4Oh6s=";
  };

  propagatedBuildInputs = [ dateutil lockfile dogpile-cache jinja2 pytz requests click taskw future responses typing-extensions pydantic email-validator tomli];
  doCheck = false; # needs network connection

  meta = with lib; {
    description = "Sync github, bitbucket, and trac issues with taskwarrior";
    homepage = "http://github.com/ralphbean/bugwarrior";
    license = licenses.gpl3;
  };
}
