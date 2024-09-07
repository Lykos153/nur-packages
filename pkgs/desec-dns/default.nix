{
  lib,
  python312Packages,
  fetchFromGitHub,
}:
with python312Packages;
  buildPythonApplication rec {
    pname = "desec-dns";
    version = "1.1.0";

    src = fetchFromGitHub {
      owner = "s-hamann";
      repo = pname;
      rev = "v${version}";
      hash = "sha256-hE9rZa1mCJL6nclsfkHH6lr/j7L7a0iz4sYpliomjC0=";
    };

    pyproject = true;

    buildInputs = [
      poetry-core
    ];

    propagatedBuildInputs = [
      requests
      cryptography
      dnspython
    ];

    meta = with lib; {
      description = " A simple deSEC.io API client";
      homepage = "https://github.com/s-hamann/desec-dns";
      license = licenses.gpl3;
    };
  }
