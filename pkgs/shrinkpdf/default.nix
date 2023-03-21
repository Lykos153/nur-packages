{ writeShellApplication, fetchFromGitHub, lib, pkgs }:

writeShellApplication rec {
  name = "shrinkpdf";

  runtimeInputs = [ pkgs.ghostscript ];

  text = builtins.readFile (fetchFromGitHub 
  {
    owner = "aklomp";
    repo = name;
    rev = "v1.1";
    hash = "sha256-SGsJW/meVs2MxywbqcgylvsKGuFck1x1vxb1gyXnJAk=";
  } + "/shrinkpdf.sh");
}
