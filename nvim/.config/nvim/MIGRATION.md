# Neovim Migration Plan: VS Code + Visual Studio → Neovim

Goal: Do everything in Neovim — editing, navigating, building, debugging C#/.NET — paired with GitHub Copilot CLI on a second screen.

## Current State
- [x] Basic nvim config (tokyonight, telescope, treesitter, oil, copilot, blink.cmp)
- [x] LSP: lua_ls, roslyn (C#), pyright (Python)
- [x] Telescope with ripgrep backend
- [x] Floating terminal
- [x] Nerd Font (JetBrainsMono NF)
- [x] Caps Lock → Ctrl remap (PowerToys)

## Phase 1: Replace VS Code (Editing & Navigation) ✅
- [x] **Code navigation** — go-to-definition, find references, peek definition (LSP keybindings)
- [x] **Symbol search** — find classes/methods across the solution (`<leader>fs`, `<leader>fw`)
- [x] **Better status line** — show current file, git branch, LSP diagnostics (lualine.nvim)
- [x] **Git integration** — inline blame, diff view, stage hunks (gitsigns.nvim)
- [x] **Which-key** — popup showing available keybindings (which-key.nvim)
- [x] **Solution-aware LSP** — roslyn.nvim (same engine as Visual Studio)
- [ ] **File tree sidebar** — alternative to Oil for project overview (neo-tree.nvim, optional)

## Phase 2: Replace Visual Studio (Building & Testing)
- [ ] **Build from nvim** — `:!dotnet build` or mapped to a keybinding
- [ ] **Test runner** — run/debug individual tests (neotest + neotest-dotnet)
- [x] **Diagnostics workflow** — jump between errors with `[d`/`]d`, `<leader>fd`, quickfix list
- [x] **Manual format** — `<leader>f` to format buffer on demand

## Phase 3: Debugging (Deferred)
> Keeping Visual Studio as fallback for complex debug sessions for now.
> Revisit nvim-dap + netcoredbg later if needed.

## Phase 4: Quality of Life
- [ ] **Session management** — auto-save/restore sessions per project
- [ ] **Snippets** — C# common patterns (class, interface, async method, etc.)
- [ ] **Todo comments** — highlight TODO/FIXME/HACK in code (todo-comments.nvim)
- [ ] **Zen mode** — distraction-free coding (zen-mode.nvim, optional)
- [ ] **Copilot Chat** — in-editor AI chat (CopilotChat.nvim)

## Notes
- Main project: C:\OneBranch\AAPT\Antares\ApiHub (ApiHub.sln, 50+ .csproj files)
- Roslyn LSP installed via Mason (`:MasonInstall roslyn`)
- PowerShell alias `apihub` opens nvim in ApiHub/src
- The realistic endgame: nvim for 90% of work, Visual Studio as fallback for complex debug sessions
