# Repository Guidelines

## Project Structure & Module Organization
This repository centralizes personal dotfiles. Root-level configs such as `zshrc`, `tmux.conf`, `gitconfig`, and `vimrc` are meant to be symlinked into `$HOME`. The `bin/` directory hosts helper scripts; `bin/link` recreates the expected symlinks. Neovim settings live under `nvim/`, with `init.lua` delegating to modules in `nvim/lua/` and plugin specs inside `nvim/lua/plugins/`. Terminal styling is defined in `kitty/kitty.conf`, while `certs/` and `ref/` store supporting assets and reference material. Keep new files grouped with their matching tool to avoid scattering configuration.

## Build, Test, and Development Commands
After editing Neovim modules, validate the config with `nvim --headless "+checkhealth" +qa` to surface plugin or runtime issues.

## Coding Style & Naming Conventions
Shell scripts use bash or zsh; prefer POSIX-compatible syntax unless a tool requires otherwise. Lua files follow the repository `stylua.toml` (two-space indentation, 120-character width). Organize Neovim plugin definitions by feature inside `nvim/lua/plugins/` and name modules descriptively (e.g., `plugins/lsp.lua`). Keep environment-specific secrets out of version control

## Testing Guidelines
Before committing shell updates, run `zsh -n zshrc` or `bash -n` on the touched script to catch syntax errors. For Neovim changes, run the headless health check noted above and open a standard buffer to ensure keymaps load.

## Commit & Pull Request Guidelines
Follow the style used in `git log`: short (under 55 characters), present-tense summaries such as `tmux, fits, keymaps`. Group related adjustments into a single commit and avoid mixing unrelated tools. Pull requests should describe the motivation, list affected tools (`zsh`, `nvim`, etc.), and reference any related issues or screenshots that demonstrate visual changes.
