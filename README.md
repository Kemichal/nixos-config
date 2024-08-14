# NixOS config

My NixOS configurations


```
nix flake update ~/nixos-config
```

```
sudo nixos-rebuild switch --flake ~/nixos-config
```

Test configuration
```
sudo nixos-rebuild test --flake ~/nixos-config#vivo
```

Clean up
```
sudo nix-collect-garbage
```
