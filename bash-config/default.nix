{stdenv, fzf}:

stdenv.mkDerivation rec {
  name = "bash-config";

  phases = [ "installPhase" ];

  src = ./.;

  installPhase = ''
    install -dm 755 $out/userHome
    substitute $src/bashrc $out/userHome/.bashrc --subst-var-by fzf_base ${fzf}/share/go/src/github.com/junegunn/fzf
  '';
}