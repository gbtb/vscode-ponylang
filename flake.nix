{
  inputs = {
    nixpkgs.url = "github:redvers/nixpkgs/ponyc-0.44.0"; #todo: change to main nixpkgs once it's merged
    makeShell.url = "github:ursi/nix-make-shell";
  };

  outputs = { self, nixpkgs, makeShell, ... }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config = { allowUnfree = true; };
      };
      make-shell = import makeShell {
        pkgs = pkgs;
        system = "x86_64-linux";
      };
    in
    {

      devShell.x86_64-linux = make-shell {

        packages = with pkgs; [
          yarn
          ponyc
          vscode
        ];
        shellHook = ''
          #export PS1='\n\[\033[1;32m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\$\[\033[0m\]'
        '';
      };
    };
}
