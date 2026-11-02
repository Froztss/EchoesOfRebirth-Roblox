# Echoes of Rebirth — Roblox

A first-person dark fantasy survival RPG migrating from Three.js to Roblox Studio and Luau.

**Task 001 — Project Foundation: complete.** This repository contains strict startup scripts and shared metadata. Gameplay is not implemented. The user confirmed successful Rojo synchronization, correct mappings, intact Baseplate and Camera, single-player startup, and a two-client multiplayer test with startup messages and no errors originating from game scripts.

The code-only configuration has passed Rojo 7.7.1 build and sourcemap checks. The manual checklist below remains available for future regression testing. Task 002 has not started.

- [ROADMAP.md](./ROADMAP.md): the 11-stage Roblox development plan.
- [docs/MIGRATION.md](./docs/MIGRATION.md): completed browser features and planned Roblox equivalents.

## Requirements

- Roblox Studio with the Rojo plugin installed.
- Rojo CLI **7.7.1**, available as `rojo` in PowerShell; use a compatible plugin version.
- A saved copy of the existing Baseplate place. The scene remains authored in Studio.

No package manager, external assets, or runtime dependencies are required.

## Setup and scene ownership

Work from `C:\EchoesOfRebirth-Roblox`. Keep the original browser repository unchanged.

1. Open the existing Baseplate place in Studio and save a backup through Studio.
2. When switching from the generated Rojo template, disconnect the plugin first. The old template owns Baseplate, Lighting, and SoundService; removing those mappings during a live session could remove scene instances.
3. Start the server, or restart the existing server after a project-mapping change:

   ```powershell
   rojo --version
   rojo serve default.project.json
   ```

4. In Studio, connect the Rojo plugin to `localhost:34872`. If a server already uses that port, reuse it for source edits; stop it with Ctrl+C before restarting for mapping changes.
5. Inspect the sync preview before accepting it. Expected changes affect only the mapped code containers. If it proposes deleting or changing Baseplate, terrain, lighting, or other scene content, cancel and check that the server loaded the current project configuration.

[default.project.json](./default.project.json) omits Workspace (including Baseplate and Camera), Lighting, and SoundService, and sets no scene or camera properties. `$ignoreUnknownInstances` preserves unmapped instances at the DataModel and mapped service boundaries. The three mapped code containers are owned by Rojo; put their source changes on disk. Existing Studio-only descendants inside `Shared`, `Server`, or `Client` may be removed during reconciliation; inspect the preview before accepting it.

Rojo synchronizes source into the open place. A generated validation place is **not** a replacement for the existing scene. Keep scene backups independently: local place files are ignored by Git, and a source checkout alone cannot restore the Studio scene.

## Source layout

| Source | Roblox location | Responsibility |
| --- | --- | --- |
| [src/client/](./src/client/) | `StarterPlayer.StarterPlayerScripts.Client` | LocalScript startup; future input, camera, UI, and presentation |
| [src/server/](./src/server/) | `ServerScriptService.Server` | Script startup; future authoritative gameplay and persistence |
| [src/shared/](./src/shared/) | `ReplicatedStorage.Shared` | Public configuration, future types and pure utilities |

Rojo maps [init.client.luau](./src/client/init.client.luau) to the `Client` LocalScript and [init.server.luau](./src/server/init.server.luau) to the `Server` Script. Because these are init scripts, their containing directories become scripts rather than folders. [Config.luau](./src/shared/Config.luau) becomes a ModuleScript under `Shared`.

## Architecture and development

- Keep `--!strict` at the top of Luau source files. Edit mapped scripts in this repository; Studio-side script edits are not a source workflow.
- The server will own health, mana, damage, cooldowns, enemies, companions, encounters, quests, rewards, and saves. Those systems are future work.
- Clients will submit intent and render state. Future server handlers must validate input types, finite numbers, permissions, range, timing, and request rates before changing authoritative state.
- Shared modules are public and load separately in each execution environment. A mutable shared table is not replicated gameplay state; `Config` is frozen metadata, with no secrets.
- Use per-player state keyed by `Player`/`UserId` and explicit session state when gameplay arrives. Plan join/leave cleanup and avoid a singleton local-player gameplay model.
- Roblox character movement can involve client network ownership; future server validation must account for this. Server placement alone is not an anti-cheat system.
- A player's menu must not pause the multiplayer server. Test future features with multiple clients from the stage that introduces them.
- Add RemoteEvents, services, and dependencies only when an authorized feature needs them. Task 001 adds none.

Change source while Rojo is serving, verify the updated script in Explorer, then stop and restart Play for startup changes. Work on one task at a time; later roadmap entries do not authorize implementation.

## Automated and static checks

From the repository root:

```powershell
rojo sourcemap default.project.json --output sourcemap.json
New-Item -ItemType Directory -Force build | Out-Null
rojo build default.project.json --output build/foundation-validation.rbxlx
git diff --check
```

The sourcemap checks project paths and instance classes. The build validates Rojo serialization into an ignored, disposable place; do not open it over or publish it as the real scene. Rojo builds do **not** type-check or execute Luau. `git diff --check` checks tracked changes only, so new untracked files also need whitespace review before the first commit.

Use Studio **Script Analysis** to check all three Luau scripts. No standalone Luau analyzer, Selene, StyLua, test runner, or CI is configured for this minimal foundation. Add focused gameplay tests when behavior is introduced.

## Manual testing checklist

Task 001 acceptance passed user manual verification. Use this repeatable checklist for later changes; its empty boxes are not outstanding Task 001 requirements. A separate Studio Script Analysis run was not reported.

- [ ] Reconnect to the current Rojo project and confirm the preview only changes code.
- [ ] Verify `ReplicatedStorage.Shared.Config` is a ModuleScript, `ServerScriptService.Server` is a Script, and `StarterPlayer.StarterPlayerScripts.Client` is a LocalScript.
- [ ] Confirm Baseplate and existing scene objects retain their positions, sizes, appearance, and settings, including the edit-mode camera setup.
- [ ] Open Output, clear earlier messages, and press **Play** (not Run, which does not start a player client).
- [ ] Confirm one server message: `[Echoes of Rebirth] Server started (v0.1.0)`.
- [ ] Confirm one client message: `[Echoes of Rebirth] Client started (v0.1.0)`.
- [ ] Confirm no startup errors or infinite-yield warnings; check both client and server Output filters and Script Analysis.
- [ ] Stop Play and run Studio's **Server & Clients** test with two clients: one server startup and one client startup in each client session, with no duplicate startup scripts.
- [ ] Stop testing and confirm the original scene is still intact. Save the real place through Studio.

## Known Studio warning

Studio logs contain this non-blocking asset warning:

```text
ContentId: rbxassetid://203785492 failed due to: Asset type does not match requested type
```

The asset loader also records `AssetDelivery403IncorrectAssetType`. No Task 001 game source or project mapping references this asset. Its requesting Studio component or scene object has not been identified, so the warning is not attributed to a specific plugin or built-in feature. The user confirmed that synchronization, single-player startup, and two-client testing work, with no errors originating from the game scripts. No scene assets were removed or replaced to suppress the warning.

The foundation does not add custom movement, HUD, combat, NPCs, dialogue, or quests. Default Roblox character behavior may still be present in the existing place. Task 001 finalization includes the authorized private GitHub repository, foundation commit, and push to `main`. Further gameplay work requires a new task.
