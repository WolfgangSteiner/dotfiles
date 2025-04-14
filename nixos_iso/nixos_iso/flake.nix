{
    description = "Custom NixOS Install ISO";
    inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    outputs = { nixpkgs, ... }@inputs: 
    {
        nixosConfigurations = {
            default = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; };
                modules = [ /home/wst/.dotfiles/nixos/mercury/configuration.nix ];
            };

            customIso = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; };
                modules = [ ./iso.nix ];
            };
        };
    };
}
