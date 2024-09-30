# AstroNvim Configuration

**NOTE:** This is for AstroNvim v4+

## ⚡ Requirements

- [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
- [Tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/blob/master/cli/README.md)
- Nodejs
- Python
- [Yazi](https://github.com/sxyazi/yazi/releases)
- [ripgrep](https://github.com/BurntSushi/ripgrep/releases)
- [lazygit](https://github.com/jesseduffield/lazygit/releases)
- [bottom](https://github.com/ClementTsang/bottom/releases)
- [go DiskUsage()](https://github.com/dundee/gdu/releases)

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Clone the repository

```shell
git clone https://github.com/Broken-Deer/nvim-config ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```

## After Installation

- Run `:checkhealth`

## Mappings

### Type `tx` and input some text

`tx Hello<Enter>`

```
 _   _      _ _
| | | | ___| | | ___
| |_| |/ _ \ | |/ _ \
|  _  |  __/ | | (_) |
|_| |_|\___|_|_|\___/
```
