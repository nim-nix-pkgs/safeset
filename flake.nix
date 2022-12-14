{
  description = ''Set that can safely add and remove elements while iterating.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."safeset-master".dir   = "master";
  inputs."safeset-master".owner = "nim-nix-pkgs";
  inputs."safeset-master".ref   = "master";
  inputs."safeset-master".repo  = "safeset";
  inputs."safeset-master".type  = "github";
  inputs."safeset-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."safeset-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."safeset-v0_1_1".dir   = "v0_1_1";
  inputs."safeset-v0_1_1".owner = "nim-nix-pkgs";
  inputs."safeset-v0_1_1".ref   = "master";
  inputs."safeset-v0_1_1".repo  = "safeset";
  inputs."safeset-v0_1_1".type  = "github";
  inputs."safeset-v0_1_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."safeset-v0_1_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}