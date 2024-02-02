# Magical-Deer's AstroNvim Configuration

A user configuration for [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## ⚡ Requirements
- Nerd Fonts (Optional with manual intervention: See Recipes/Customizing Icons) [1]
- Neovim v0.8+ (Not including nightly)
- Tree-sitter CLI (Note: This is only necessary if you want to use auto_install feature with Treesitter)
- ripgrep - live grep telescope search (<leader>fw)
- lazygit - git ui toggle terminal (<leader>tl or <leader>gg)
- go DiskUsage() - disk usage toggle terminal (<leader>tu)
- bottom - process viewer toggle terminal (<leader>tt)
- Python - python repl toggle terminal (<leader>tp)
- Node - Node is needed for a lot of the LSPs, and for the node repl toggle terminal (<leader>tn)


## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

#### Clone AstroNvim

```shell
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone https://github.com/Broken-Deer/nvim-config ~/.config/nvim/lua/user
```

#### Start Neovim

```shell
nvim
```

