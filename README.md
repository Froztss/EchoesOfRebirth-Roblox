# Echoes of Rebirth — Roblox

A Roblox-native third-person Murim / xianxia cultivation MMORPG project, developed with Roblox Studio, Luau, and Rojo.

This repository is the clean starting foundation for Roblox development. The game design and planned implementation stages are documented in [ROADMAP.md](./ROADMAP.md). Roadmap items describe goals, not verified gameplay completion.

## Requirements

- Roblox Studio with a compatible Rojo plugin
- Rojo CLI (the foundation was prepared with version 7.7.1)
- Git

## Repository layout

| Path | Purpose |
| --- | --- |
| `src/client/` | Client startup and future player-facing systems |
| `src/server/` | Server startup and authoritative gameplay systems |
| `src/shared/` | Shared Luau modules and configuration |
| `default.project.json` | Production Rojo service mapping |
| `ROADMAP.md` | Murim game vision and development roadmap |

## Development

The production Rojo mapping owns code containers only. It deliberately does not map Workspace, Terrain, Baseplate, Camera, Lighting, or SoundService. Inspect the Rojo sync preview before applying changes to an existing Studio place.

```powershell
rojo serve default.project.json
```

For a source-only build check:

```powershell
rojo build default.project.json --output validation.rbxlx
```

Do not publish generated validation places over an existing game. Existing Studio places and assets must be backed up independently; Git alone cannot restore Studio-authored world content.

## Working principles

- Use `--!strict` in Luau source where appropriate.
- Keep combat, progression, inventory, persistence, and reward decisions server-authoritative.
- Design third-person R15 movement and accessible desktop, mobile, and gamepad controls.
- Test changes in an isolated Roblox Studio test place before integration into the main experience.
- Review existing branches, uncommitted work, Rojo mappings, and Studio identity before synchronizing or editing.
- Do not treat planning approval as implementation completion.

The project is developed natively for Roblox. No prior browser-game mechanics, assets, or content are assumed to be part of this foundation.
