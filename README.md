<p align="center">
  <img width="510" src="/.github/data/header.png">
</p>

# Frankenstein's Neovim 

Personal [Neovim](https://neovim.io/) configuration. \
Ideally this configuation should be portable for as many users as possible, thus it tries to minimize hard-coding of paths, keybinds and plugins*.

*This currently being worked on.

## Installation

Technically the configuraion should install itself, once you load it via
neovim. No (firstparty) dependencies required, except maybe basic stuff like `unzip` or
`cmake`, since treesitter and mason are weird.

>[!NOTE] Treesitter needs `tree-sitter-cli` for some grammars to work.
This dependency is optional is only needed for some languages like latex.
Those can be installed via
- the AUR `paru -S tree-sitter-cli`,
- Cargo `cargo install tree-sitter-cli` or
- NodeJs `npm i -g tree-sitter-cli` / `yarn global add tree-sitter-cli`
