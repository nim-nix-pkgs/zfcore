{
  description = ''High performance asynchttpserver and web framework for nim lang.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-zfcore-1_0_30.flake = false;
  inputs.src-zfcore-1_0_30.ref   = "refs/tags/1.0.30";
  inputs.src-zfcore-1_0_30.owner = "zendbit";
  inputs.src-zfcore-1_0_30.repo  = "nim.zfcore";
  inputs.src-zfcore-1_0_30.type  = "github";
  
  inputs."zfblast".owner = "nim-nix-pkgs";
  inputs."zfblast".ref   = "master";
  inputs."zfblast".repo  = "zfblast";
  inputs."zfblast".dir   = "v0_2_8";
  inputs."zfblast".type  = "github";
  inputs."zfblast".inputs.nixpkgs.follows = "nixpkgs";
  inputs."zfblast".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."uri3".owner = "nim-nix-pkgs";
  inputs."uri3".ref   = "master";
  inputs."uri3".repo  = "uri3";
  inputs."uri3".dir   = "v0_1_7";
  inputs."uri3".type  = "github";
  inputs."uri3".inputs.nixpkgs.follows = "nixpkgs";
  inputs."uri3".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."stdext".owner = "nim-nix-pkgs";
  inputs."stdext".ref   = "master";
  inputs."stdext".repo  = "stdext";
  inputs."stdext".dir   = "v0_0_14";
  inputs."stdext".type  = "github";
  inputs."stdext".inputs.nixpkgs.follows = "nixpkgs";
  inputs."stdext".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-zfcore-1_0_30"];
    over = if builtins.pathExists ./override.nix 
           then { override = import ./override.nix; }
           else { };
  in lib.mkRefOutput (over // {
    inherit self nixpkgs ;
    src  = deps."src-zfcore-1_0_30";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  } );
}