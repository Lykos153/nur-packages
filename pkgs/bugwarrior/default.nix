{ lib
, python3Packages
}:
with python3Packages;

buildPythonApplication rec {
  pname = "bugwarrior";
  version = "1.8.0";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-8CTCnSCJuCbwVIHKzjOmKqmE8z6Y0ib25BiX5vEbP1E=";
  };

  propagatedBuildInputs = [ dateutil lockfile dogpile-cache jinja2 pytz requests click taskw future responses];
  doCheck = false; # needs network connection

  meta = with lib; {
    description = "Sync github, bitbucket, and trac issues with taskwarrior";
    homepage = "http://github.com/ralphbean/bugwarrior";
    license = licenses.gpl3;
  };
}
