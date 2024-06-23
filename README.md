<p align="center">
  <img width="510" src="/.github/data/header.png">
</p>

# Frankenstein's Neovim 

Personal [Neovim](https://neovim.io/) configuration. \
Ideally this configuation should be portable.

## Installation

Technically the configuraion should install itself once you load it via neovim.
There are no (firstparty) dependencies required, except maybe basic stuff like
`unzip` or `cmake`, since treesitter and mason are weird.

> [!NOTE]
> Treesitter needs `tree-sitter-cli` for some grammars to work.
> This dependency is optional is only needed for some languages like latex.
> Those can be installed via
> - AUR `paru -S tree-sitter-cli`,
> - Cargo `cargo install tree-sitter-cli` or
> - Nodejs `npm i -g tree-sitter-cli`

