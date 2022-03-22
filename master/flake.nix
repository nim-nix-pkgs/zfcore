{
  description = ''High performance asynchttpserver and web framework for nim lang.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-zfcore-master.flake = false;
  inputs.src-zfcore-master.owner = "zendbit";
  inputs.src-zfcore-master.ref   = "master";
  inputs.src-zfcore-master.repo  = "nim.zfcore";
  inputs.src-zfcore-master.type  = "github";
  
  inputs."zfblast".owner = "nim-nix-pkgs";
  inputs."zfblast".ref   = "master";
  inputs."zfblast".repo  = "zfblast";
  inputs."zfblast".dir   = "";
  inputs."zfblast".type  = "github";
  inputs."zfblast".inputs.nixpkgs.follows = "nixpkgs";
  inputs."zfblast".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."uri3".owner = "nim-nix-pkgs";
  inputs."uri3".ref   = "master";
  inputs."uri3".repo  = "uri3";
  inputs."uri3".dir   = "";
  inputs."uri3".type  = "github";
  inputs."uri3".inputs.nixpkgs.follows = "nixpkgs";
  inputs."uri3".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."stdext".owner = "nim-nix-pkgs";
  inputs."stdext".ref   = "master";
  inputs."stdext".repo  = "stdext";
  inputs."stdext".dir   = "";
  inputs."stdext".type  = "github";
  inputs."stdext".inputs.nixpkgs.follows = "nixpkgs";
  inputs."stdext".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."zip".owner = "nim-nix-pkgs";
  inputs."zip".ref   = "master";
  inputs."zip".repo  = "zip";
  inputs."zip".dir   = "0_3_1";
  inputs."zip".type  = "github";
  inputs."zip".inputs.nixpkgs.follows = "nixpkgs";
  inputs."zip".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-zfcore-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-zfcore-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}