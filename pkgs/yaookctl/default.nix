{ lib
, buildPythonApplication
, fetchFromGitLab
, setuptools
, click
, prettytable
}:

buildPythonApplication rec {
  pname = "yaookctl";
  version = "ef2fc91000180578733dcab9c8b48764c6298692";

  src = fetchFromGitLab {
    owner = "yaook";
    repo = pname;
    rev = "${version}";
    hash = "sha256-y0IWyG4AE8PJCwJ60h9bj+7gckCYm9+ZhuiuDqp8pvY=";
  };

  propagatedBuildInputs = [ setuptools click prettytable ];

  meta = with lib; {
    description = "Toolbox for interacting with Yaook clusters";
    homepage = "https://gitlab.com/yaook/yaookctl";
    license = licenses.asl20;
  };
}
