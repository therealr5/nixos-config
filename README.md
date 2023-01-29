# Rouven's NixOS configuariton files

![image](https://user-images.githubusercontent.com/72568063/213921069-670965f7-ad51-43ad-a211-63bb45a02648.png)

## Specs
- **Operating System:** [NixOS](https://nixos.org)
- **Window Manager:** [Hyprland](https://hyprland.org/)
- **Overall Theme:** [Base16 Dracula](https://github.com/dracula/base16-dracula-scheme)
- **Shell:** [Zsh](https://www.zsh.org/)
- **Terminal:** [Alacritty](https://github.com/alacritty/alacritty)
- **Editor:** [Neovim](https://neovim.io/)
- **Notifications:** [Mako](https://github.com/emersion/mako)
- **Panel:** [Waybar](https://github.com/Alexays/Waybar)
- **File Manager:** [Vifm](https://vifm.info/)

## Installation
Should work out of the box:\
Clone the repo, copy your hardware configuration to `./hosts/<hostname>/hardware-configuration.nix`, run `nixos-rebuild switch --flake .#<hostname>` and you are good to go.

## Currently configured machines (aka available hostnames)
### thinkpad
A ThinkPad L15 that I use for almost everything that one needs a monitor to.
### nuc
Old Intel Nuc that I got from @LeBogoo. Running a few personal services.
