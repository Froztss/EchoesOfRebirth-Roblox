# Echoes of Rebirth — Roblox Development Roadmap

This 11-stage plan adapts the browser roadmap to Roblox. Browser completion does not mean a Roblox feature is complete. Multiplayer compatibility and server authority apply from the foundation; Stage 10 expands and validates the co-op experience.

**Task 001 — Project Foundation: complete.** Source, configuration, documentation, and local checks are complete. User manual verification passed for synchronization, scene/camera preservation, correct mappings, single-player startup, and two-client startup without game-script errors. Task 002 has not started. Implement only the explicitly authorized task.

## Stage 1 — Project foundation

- [x] Implement Task 001 files: Rojo service mappings, strict client/server startup, shared configuration, documentation, and Git exclusions.
- [x] Pass Rojo validation and available static checks (standalone Luau analysis unavailable; Studio Script Analysis remains manual).
- [x] Confirm live synchronization, server/client startup messages, two-client startup, and preservation of Baseplate and Camera in Studio (user verified).

**Complete:** the existing place runs the minimal foundation without game-script startup errors or scene changes. The non-blocking Studio asset-type warning for asset ID `203785492` is documented in the [README](./README.md#known-studio-warning). No gameplay is required at this stage.

## Stage 2 — Exploration and interaction

- [ ] Establish first-person camera, movement, sprint, jumping, and collision using Roblox character systems.
- [ ] Build a compact Starting Village, Whispering Forest, and Ancient Ruins with clear routes and region labels.
- [ ] Add signposts and interaction prompts with server checks for consequential actions.
- [ ] Add baseline HUD, settings, and menus that leave the shared world running.

**Done when:** two clients can explore and interact independently without one player's UI interrupting the other.

## Stage 3 — Magic combat

- [ ] Add authoritative health, mana, regeneration, damage, and cooldowns.
- [ ] Implement Fireball and Frost Bolt, validated cast requests, and server hit resolution.
- [ ] Add bounded client effects, skill selection, HUD feedback, and test targets.
- [ ] Test duplicate, malformed, out-of-range, and excessive requests.

**Done when:** clients can cast and defeat test targets while the server enforces eligibility and damage.

## Stage 4 — Horde survival

- [ ] Add server-controlled Mossbound Marauder pursuit, navigation, melee, and defeat.
- [ ] Add capped waves, safe spawn selection, and a repeatable rift sealing objective.
- [ ] Replicate encounter state and profile AI, physics, and effects under load.

**Done when:** multiple players observe the same repeatable encounter and completion state within measured budgets.

## Stage 5 — First living companion

- [ ] Introduce Seraphine with stable identity and explicit player/party ownership rules.
- [ ] Implement recruitment, follow, fight, protect, and retreat behavior on the server.
- [ ] Implement health, downed state, timed revival, and current-session death.
- [ ] Add dialogue UI, server-validated choices, and relationship state.

**Done when:** two clients see consistent companion state; concurrent recruitment, revival, and dialogue cannot duplicate outcomes. Persistence follows in Stage 7.

## Stage 6 — Quest and progression systems

- [ ] Add a main objective tracker, one side quest, and branching decisions.
- [ ] Add server-owned experience, skill unlocks, inventory, and rewards.
- [ ] Connect quest events to combat and companion outcomes with explicit personal/party ownership.

**Done when:** a player completes an objective and receives a reward once; progress is ready for Stage 7 persistence.

## Stage 7 — Saving and world persistence

- [ ] Design versioned server-side DataStore schemas and migration/default handling.
- [ ] Persist progression, appropriate player state, and consequential companion outcomes.
- [ ] Define personal versus party/world save ownership, concurrent-session protection, retries, and shutdown behavior.
- [ ] Test missing/corrupt data, failures, reconnects, and dead-companion persistence in a separate test environment.

**Done when:** rejoining preserves consequential decisions and failed writes cannot silently overwrite good data.

## Stage 8 — Playable vertical slice

- [ ] Polish one region, one story mission, one side quest, one companion, and one meaningful decision.
- [ ] Integrate the rift encounter, rewards, tutorial, feedback, and persistence.
- [ ] Playtest a coherent 15–30 minute sample as a target, with solo and multiplayer sessions.

**Done when:** new players can complete the slice without blocking defects.

## Stage 9 — Large-scale world expansion

- [ ] Expand connected biomes, settlements, terrain routes, and at least one dungeon.
- [ ] Design StreamingEnabled behavior, travel boundaries, and client handling of streamed instances.
- [ ] Verify encounters and saved state across regions; profile memory, replication, and active simulation.

**Done when:** travel and state remain reliable across expanded areas within measured device budgets.

## Stage 10 — Online co-op campaign

- [ ] Expand the continuously multiplayer-compatible game toward 2–4 player parties.
- [ ] Finalize shared story choices, companion control, reward attribution, and party/session progression.
- [ ] Test late joins, disconnects, rejoining, latency, simultaneous interactions, and exploit attempts.

**Done when:** remote players can complete a shared encounter and retain the intended progression through reconnects.

## Stage 11 — Art, audio, optimization, and release

- [ ] Replace approved placeholders with original or appropriately licensed Roblox-compatible assets.
- [ ] Add animation, spell audio, ambience, accessibility, and graphics options.
- [ ] Profile supported devices, complete regression testing, and resolve release-blocking defects.
- [ ] Prepare Roblox publishing settings, release notes, and an approved release process.

**Done when:** the tested experience is ready for an explicitly authorized release.

## Task 001 verification record

Automated results and user manual acceptance are recorded separately below. Stage 1 is complete; later stages remain unstarted.

2026-11-02 — Automated verification: applied the code-only mapping after the user confirmed Studio's Rojo plugin was disconnected. Rojo 7.7.1 build and sourcemap generation passed. The generated hierarchy contains the expected Script, LocalScript, and ModuleScript with source matching disk, and no Workspace, Baseplate, Camera, Lighting, or SoundService instances. Editor diagnostics, documentation links, 11-stage count, strict directives, and whitespace checks passed. No Studio scene objects were edited. Standalone Luau analysis is unavailable; no separate Studio Script Analysis result has been reported.

2026-11-02 — User manual acceptance and Task 001 completion: Rojo synchronization, Baseplate and Camera preservation, Client/Server/Shared Config mappings, single-player startup, and two-client multiplayer startup passed. The server and both clients displayed their startup messages. No errors originating from game scripts were reported. Studio's asset-type warning for asset ID `203785492` is non-blocking and documented; its requesting component remains unidentified. The user authorized the private repository setup, foundation commit, and push to `main`. Task 002 remains unstarted.
