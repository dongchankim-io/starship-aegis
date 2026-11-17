<div align="center">

# 🛰️ Starship Aegis

**The Multi-Server & Polyglot Telemetry Cockpit for [Starship](https://starship.rs)**  
*Designed by [Dongchan Kim (@dongchankim-io)](https://github.com/dongchankim-io)*

[![Starship](https://img.shields.io/badge/Starship-Preset-cb96f7?style=for-the-badge&logo=starship&logoColor=white)](https://starship.rs)
[![Palettes](https://img.shields.io/badge/24--Bit_Palettes-6_Included-89b4fa?style=for-the-badge)](#🎨-the-big-6-built-in-palettes)
[![License: MIT](https://img.shields.io/badge/License-MIT-a6e3a1?style=for-the-badge)](./LICENSE)

</div>

---

Most terminal prompts force a painful compromise: either **bloated 1990s Powerline bars** that eat up half your screen, or **ultra-minimalist dots** that hide which server, user, or Kubernetes cluster you're about to run `rm -rf` on.

**Starship Aegis** introduces a **Neo-HUD Micro-Badge Architecture**:
- **Floating Rounded Micro-Badges (`...`)** for critical session identity & danger states (`user@host`, `🚨 PROD`, `root`, `REBASING 3/7`, `⚡ SIGKILL`).
- **Crisp, Breathing Typography** for directories, repo-root highlighting, live Git diff gauges (`+48/-12`), and polyglot runtimes.
- **Built for Multi-Server Ops**: Always-on `[os user@host · local_ip]` identity header that adapts automatically across Local macOS, Remote SSH servers, `tmux` sessions, Docker/K8s containers, and `root` escalations.

---

## ⚡ Live HUD States at a Glance

```text
# 1. Local Development (Repo-Root Underline + Live Git Diff Metrics + Runtime)
╭─ 󰀵 donk@macbook ~/work/aegis-core/src/api  main [!2 +1 ⇡1] +48/-12  1.82.0      ⏱ 640ms  20:25:12
╰─ ❯ cargo test --workspace

# 2. Remote SSH Server + Persistent Tmux Badge + Auto Internal IPv4 Disambiguation
╭─ 󰕈 ubuntu@worker-us-east-04 󰣀 · 10.24.8.19  tmux /var/log/envoy 󰌾                        20:26:04
╰─ ❯ tail -f access.log

# 3. Production Hostname Auto-Alert + Root Danger Escalation + Nested Shell Counter (↕2)
╭─ 󱄛 root@prod-db-primary-01 󰣀 · 172.16.0.10 🚨 PROD ↕2 /etc/postgresql/16/main             20:27:19
╰─ 󰌆 ❯ systemctl reload postgresql

# 4. Interactive Rebase Progress Pill + Signal & Exit-Code Decoder
╭─ 󰀵 donk@macbook aegis-core (a1b2c3d 🏷 v2.1.0) REBASING 3/7 [⚡2]               ⏱ 4.12s  20:28:45
╰─ ✦1 ⚡ SIGKILL ❯
```

---

## 🚀 1-Line Installation

### Option A: Full Install (Config + `aegis` Theme Switcher CLI)
```bash
curl -fsSL https://raw.githubusercontent.com/dongchankim-io/starship-aegis/main/install.sh | bash
```
*(Automatically backs up your existing `~/.config/starship.toml` before installing).*

### Option B: Direct Config Download (`starship.toml` only)
```bash
curl -fsSL https://raw.githubusercontent.com/dongchankim-io/starship-aegis/main/starship.toml -o ~/.config/starship.toml
```

> **Prerequisite**: Requires [Starship](https://starship.rs) and a [Nerd Font](https://www.nerdfonts.com/) (e.g., *JetBrainsMono Nerd Font*, *MesloLGS NF*, or *GeistMono Nerd Font*).

---

## 🎨 The "Big 6" Built-In Palettes (24-Bit TrueColor)

Every color in **Starship Aegis** is mapped through semantic tokens (`user`, `host`, `dir`, `dir_root`, `git`, `ok`, `warn`, `infra`, `danger`, `surface`, `crust`) using 24-bit hex codes—so your prompt looks identical across macOS, Linux, tmux, and remote SSH sessions.

Switch themes instantly with the included `aegis` CLI (or by changing `palette = "..."` on line 10 of `starship.toml`):

```bash
aegis theme catppuccin_mocha   # Default — Crisp pastel contrast, zero eye strain
aegis theme tokyo_night        # Deep cyberpunk slate & electric neon accents
aegis theme kanagawa           # Warm Japanese sumi-ink & woodblock pigments
aegis theme rose_pine          # Soho pine, muted gold, and iris
aegis theme gruvbox_material   # Earthy retro ops & warm amber telemetry
aegis theme nord               # Arctic frost & polar night
```

Preview all operational states right in your terminal anytime:
```bash
aegis demo
```

---

## 🧠 Why Power Users Switch to Aegis

| Feature | Standard Presets | **Starship Aegis** |
| :--- | :--- | :--- |
| **Multi-Server Identity** | Hidden locally or static text | Always-on `󰀵 user@host`, adds `󰣀 · <local_ipv4>` on SSH, turns solid red on `root` |
| **Production Guardrails** | None | Auto-injects `🚨 PROD` when `$HOSTNAME` matches `*prod*`, `*prd*`, or `*live*` |
| **Multiplexer Awareness** | None | Displays ` tmux` when inside a persistent `tmux` pane |
| **Git Monorepo Context** | Branch + basic `[!+]` | Underlines repo root, counts statuses (`[!2 +1 ?3]`), shows live `+added/-deleted` line diff |
| **Rebase / Merge Clarity** | Hidden or plain text | High-contrast `REBASING 3/7` pill + detached HEAD commit hash & tag |
| **Process Diagnostics** | Red `❯` only | Decodes signals (`⚡ SIGKILL`, `🧱 SIGINT`, `🔍 127`), suspended jobs (`✦2`), and shell depth (`↕2`) |
| **Multi-Line Commands** | Misaligned `>` | Seamless box continuation (`├─▸`) connecting `╭─` and `╰─` |

---

## 📄 License

MIT License © [Dongchan Kim (@dongchankim-io)](https://github.com/dongchankim-io)
