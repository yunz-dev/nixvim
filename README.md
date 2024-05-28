<h1 align="center">
      <img src="https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nix-snowflake-colours.svg" width="96px" height="96px" />
      <br>

  Akari <br>
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="600px" /> <br>
  <div align="center">

  <div align="center">
   <p></p>
   <a href="">
      <img src="https://img.shields.io/github/issues/spector700/Akari?color=fab387&labelColor=303446&style=for-the-badge">
   </a>
   <a href="https://github.com/sioodmy/dotfiles/">
      <img src="https://img.shields.io/github/repo-size/spector700/Akari?color=ea999c&labelColor=303446&style=for-the-badge">
   </a>
      <a = href="https://nixos.org">
      <img src="https://img.shields.io/badge/NixOS-unstable-blue.svg?style=for-the-badge&labelColor=303446&logo=NixOS&logoColor=white&color=91D7E3">
    </a>
   <br>
</div>
</h1>

<br>
</div>

![neovim-pic-1](./.github/assets/neovim-pic-1.png)
![neovim-pic-2](./.github/assets/neovim-pic-2.png)
![neovim-pic-3](./.github/assets/neovim-pic-3.png)
<p align="center"> Screenshots Circa: 2024-4-9</p>

---

# Akari

Standalone nixvim flake based on Lazyvim with some more changes.

## Installation

If you'd like to give it a try before installing: `nix run github:spector700/Akari`

<details>
    <summary><b>INSTALLATION GUIDE</b></summary>

```
1- Go to the flake.nix and add `Akari.url = "github:spector700/Akari"` to your inputs.

2- Run nix flake update

3- Install it by adding inputs.Akari.packages.${system}.default to your environment.systemPackages or home.packages if you're using home-manager.

4- Rebuild your system and you should be done.
```

</details>

## Configuring

To start configuring, just add or modify the nix files in `./config`.
If you add a new configuration file, remember to add it to the
[`config/default.nix`](./config/default.nix) file

## Testing your new configuration

To test your configuration simply run the following command

```
nix run .
```
