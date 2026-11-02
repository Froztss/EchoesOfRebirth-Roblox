# Echoes of Rebirth — Browser to Roblox Migration

## Source and scope

The historical Three.js/Vite project is preserved locally at `C:\FPS` and in the private [EchoesOfRebirth/FPS repository](https://github.com/EchoesOfRebirth/FPS). Its [README](https://github.com/EchoesOfRebirth/FPS/blob/main/README.md), [roadmap](https://github.com/EchoesOfRebirth/FPS/blob/main/ROADMAP.md), [game design](https://github.com/EchoesOfRebirth/FPS/blob/main/GAME_DESIGN.md), and [balance definitions](https://github.com/EchoesOfRebirth/FPS/blob/main/src/core/balance.js) were inspected locally read-only on 2026-11-02. GitHub links require access to that private repository.

The browser README and roadmap summary record phases 1–5 as complete, including Task 021 dialogue/relationships and user manual review. Some older roadmap checkboxes and historical entries lag behind that summary. This document describes the latest recorded state; browser tests were not rerun during Task 001.

**Roblox status:** Task 001 foundation complete, including user-verified synchronization, correct mappings, intact Baseplate/Camera, single-player startup, and two-client startup without game-script errors. Every gameplay equivalent below is planned. No browser scene, source code, assets, or saved state is automatically imported. The non-blocking Studio warning for asset ID `203785492` is recorded in the [README](../README.md#known-studio-warning).

## Completed browser features and planned equivalents

| Browser feature | Completed browser behavior | Planned Roblox equivalent |
| --- | --- | --- |
| Project foundation | Modular JavaScript, Three.js rendering, Vite build, automated checks | Complete in Task 001: Rojo-managed Luau, strict client/server entrypoints, public shared metadata, and verified Studio startup |
| Movement and exploration | First-person mouse look, walking, sprinting, gravity/jumping, collision sliding, slope/bounds handling | Roblox character/camera/input APIs and collision groups; validate gameplay-relevant movement on the server |
| Connected areas | Starting Village, Whispering Forest, Ancient Ruins, routes, region labels, gateway landmark | Studio-authored terrain/models and region presentation; preserve landmarks and traversal intent |
| Interactions | Range-based E prompts and signpost read/close/reopen behavior | ProximityPrompt or input-driven UI; server validates distance and eligibility for state changes |
| Menus and settings | Pause/resume, mouse sensitivity, master volume, quality presets; browser-local preference persistence | ScreenGui/input management and Roblox audio/graphics controls; menus affect the local player while the server keeps running |
| Combat resources | Health, damage/healing, mana regeneration, independent cooldowns | Server-owned per-player resources, timers, and damage; clients render replicated values |
| Spells and targets | Fireball/Frost Bolt, bounded swept projectiles, world/target hits, reusable training targets | Validated cast intent, authoritative server hit resolution, bounded visual projectiles; targets as development fixtures |
| Effects and HUD | Elemental flashes/trails/impacts, synthesized placeholder sounds, resource bars, two-slot skill bar, notification stack, crosshair-targeted enemy health card | Client UI and bounded Roblox effects driven by server-confirmed events; audio requires a separate approved asset/implementation plan |
| Enemies | Mossbound Marauder pursuit, obstacle detours, melee cooldowns, defeat, collision-aware navigation | Server NPC state machines, PathfindingService where useful, server-owned NPC physics and attack validation |
| Rift encounter | Deliberate activation, two capped waves, objective tracking, return-to-rift sealing, timed completion message, restart | Server encounter lifecycle and safe spawning; synchronized objectives, duplicate-action protection, and participant rules |
| Seraphine | Stable ID `companion-seraphine`, recruitment, following, fight/protect/retreat behavior, line-of-sight arc bolt | Server companion lifecycle/navigation with explicit party ownership; replicated state and local presentation |
| Companion mortality | 100 HP, 30-second downed window, 3-second hold-to-revive restoring 50 HP, current-run death on expiry | Server-clock deadlines and validated revival range/state; resolve concurrent attempts once; persistence introduced later |
| Dialogue and relationships | Conversation topics and choices, each scored opinion once per run, Neutral/Positive/Negative relationship state; world remains active during dialogue | Local dialogue UI with server-owned conversation eligibility, choice history, and relationships |
| Performance tooling | Bounded enemies/effects, quality presets, opt-in counters, repeatable browser profiling | Studio MicroProfiler and developer statistics; measure server, client, physics, replication, and streaming budgets |

## Reference balance, not Roblox commitments

The latest browser balance defines 100 player health, 100 mana, and 5 mana regenerated per active second. Fireball costs 20 mana, deals 30 damage, and has a 1.5-second cooldown. Frost Bolt costs 12 mana, deals 18 damage, and has a 0.8-second cooldown. Rift waves contain 4 then 6 Marauders, with at most 6 active. Seraphine's arc bolt deals 14 damage with a 1.8-second cooldown.

These are migration references only. Roblox studs, character scale, physics, networking, and shared encounter difficulty require separate tuning. Task 001 does not add these values to runtime configuration.

## Features not completed in the browser

- General quest/progression systems, inventory, skill unlocks, and quest rewards.
- Versioned game-progress saving and persistent consequences. Browser preferences persist, but player resources/position, relationship changes, and companion outcomes reset between sessions.
- A complete story vertical slice, meaningful branching quest consequences, and endings.
- Expanded world regions/dungeons, production streaming, and online co-op.
- Final art/audio and a release-ready experience. The ruins gateway remains a landmark, not a functional travel portal.

These stay planned in the [Roblox roadmap](../ROADMAP.md); their presence in design documents is not evidence of implementation.

## Architecture changes

The browser runs a local simulation and can freeze that simulation when paused. Roblox will run shared gameplay on the server. A menu, focus loss, or dialogue must not pause other players, enemy AI, regeneration, cooldowns, or revival deadlines.

The server will decide damage, resource costs, cooldowns, NPC behavior, encounter transitions, quest rewards, and saves. Clients provide intent and display feedback. Validate each future remote request against server state, including type/range checks, finite numbers, ownership, distance, line of sight, timing, and rate limits. Do not trust client-reported hits, rewards, or a client-side copy of configuration.

Keep per-player state separate from session/party state. Resolve ownership and simultaneous interactions explicitly for recruitment, dialogue, revival, sealing, and rewards. Clean up references on departure; design late-join snapshots and reconnect behavior alongside each system. Roblox supplies transport and replication, but application-level validation and consistency still need implementation.

Browser localStorage saves do not become DataStores automatically. Future persistence will use versioned server-side schemas, failure handling, and a defined player/party/world ownership policy. Persistent companion death must wait for that policy.

## Migration workflow

1. Preserve the verified Task 001 foundation and original Baseplate place.
2. Implement one authorized Roblox task at a time, following the [11-stage plan](../ROADMAP.md).
3. Reuse browser behavior and tests as acceptance references; rebuild the implementation with Roblox APIs.
4. Verify both solo and multiple-client behavior from the first gameplay stage.
5. Keep the original browser repository unchanged. Task 001 finalization authorizes a private Roblox repository, foundation commit, and push to `main`; Roblox publishing and later-stage gameplay remain outside scope.
