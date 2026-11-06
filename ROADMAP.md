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


---

## Current game design direction — 2026-11-06 (planning baseline; not implemented)

> **IMPORTANT FOR CODEX AND CONTRIBUTORS:** This section supersedes conflicting *design assumptions* in Stages 2–11 above. Those stages are historical migration planning, not authorization to implement obsolete FPS features. Task 001 remains verified complete. Task 002 has work-in-progress on a separate branch and must be inspected before editing or replacing any controller files. Do not mark features below complete without implementation and testing. Revise the stage-by-stage roadmap in a separate, explicitly authorized planning task before starting the next gameplay task.

### Product vision and player experience

- [ ] Build **Echoes of Rebirth** as a persistent, third-person, Murim/wuxia-inspired fantasy MMORPG on Roblox, centered on reincarnation, Qi cultivation, martial paths, exploration, discovery, player commerce, and social relationships.
- [ ] Use an **interconnected open world with soft progression gates**: ordinary regions are freely accessible, with danger signposting; certain sealed trials, deeper chambers, and secret realms require clues, cultivation, or other achievements.
- [ ] Keep the game open-ended; **returning to the original world is not the ending or objective**.
- [ ] Support solo play, voluntary Adventurer Pacts, high-level Master–Disciple relationships, and player-founded Sects. Do not reinstate the obsolete compulsory squad/leader structure.
- [ ] Keep multiplayer/server authority fundamental from the outset; provide mobile, desktop, and gamepad-compatible controls and scalable performance.

### Character paths, progression, and combat

- [ ] Implement a **player-chosen, permanent cultivation path** after an introductory test/confirmation: **Sword**, **Body**, or **Arcane**. Never randomly assign the permanent path. Players cannot switch paths after confirmation.
- [ ] Implement hybrid **character level + cultivation** with balanced contributions. Long-term Level 100; Alpha 0.1 Levels 1–20. Character levels provide baseline stats; cultivation improves Qi, efficiency, and unlocks; mastery and player skill remain relevant.
- [ ] Attributes: Vitality, Strength, Agility, Spirit, Control; proposed baseline 10 each and 3 allocation points per level, maximum 2 to one attribute per level. Validate on the server.
- [ ] Cultivation realms: **Qi Awakening (Lv 1), Qi Refinement (Lv 10), Meridian Opening (Lv 20), Core Formation (Lv 35), Martial Mastery (Lv 50), Transcendence (Lv 75)**, each with Early/Middle/Late/Peak stages. Advancement uses Cultivation Insight and appropriate breakthrough trials. These levels and numerical bonuses are untested design targets.
- [ ] Universal abilities: Qi Circulation, Qi Reinforcement, Qinggong mobility (dash through advanced air steps), and limited internal recovery. Develop path-specific techniques:
  - **Sword:** Sword Intent (precision/parries), Sword Aura (energy attacks), Sword Control (Guided Blade, Air Sword, Mind Sword).
  - **Body:** Iron Body (defense), Flowing Fist (combos/mobility), Internal Force (Qi Palm/shockwaves).
  - **Arcane:** Elemental Arts, Formation Arts (seals/control), Spirit Arts (barriers/healing).
- [ ] **Flexible specialization within the permanent path**: all three branches accessible, but limited refundable technique points and four equipped path-technique slots. Free foundation skills; standard/advanced/legendary unlocks proposed at 1/2/3 points.
- [ ] Technique lifecycle: **Discovered → Learned (permanent knowledge) → Unlocked (allocated points in current build) → Equipped (active slot)**. Manuals, trials, realm requirements, and prerequisites govern eligibility; mastery is persistent through respecs.
- [ ] Proposed technique point economy: one per five character levels plus one per major realm breakthrough, for **25 points at Level 100** (20 level points + five breakthroughs). First respec free, subsequent respecs use modest in-game currency; safe-zone/trainer only, not during combat, dungeons, or duels. All figures subject to balance testing.
- [ ] Server-authoritative damage, cooldowns, resource costs, unlocks, inventory, and XP/Insight/mastery rewards. Design for timing-sensitive third-person action, not the obsolete first-person Fireball/Frost Bolt-only system.
- [ ] Consensual unranked friendly duels and mentorship sparring; **no ranked duel ladder/MMR**. Eventual **Sovereign's Clash** Masters' tournament with spectators, temporary ceremonial title, and cosmetic recognition. Master qualification baseline: Level 50 + Martial Mastery + trial.

### Exploration, hidden realms, and discovery

- [ ] Regions (working names): **First Haven** starting settlement, **Whispering Forest**, **Aurelian Kingdom** capital/Grand Exchange/colosseum, and **Ashen Frontier**. Extend through additional connected regions.
- [ ] Secret realms (working names): **Celestial Expanse, Abyssal Depths, Frostbound Dominion, Forgotten Sanctum**. Discover entrances early, unlock access through clues/puzzles/keys/trials, and progressively access deeper chambers.
- [ ] Build a persistent, per-character **Discovery Journal** with **Unknown → Rumored → Discovered** entries for landmarks, inscriptions, caves, weapon vaults, realm gateways, and lore.
- [ ] Server-verified, one-time discovery rewards may include exploration XP, Cultivation Insight, materials, manuals, hidden armaments, lore, cosmetics, and titles. Do not expose all hidden locations on the map; preserve mystery.
- [ ] Permit solo and cooperative exploration; shared puzzle completion must not automatically grant unearned personal discoveries. Warn players about hazards rather than hard-blocking ordinary regions.
- [ ] Do not permanently destroy or drop equipped hidden weapons on ordinary player death.

### Hidden armaments, crafting, and item ownership

- [ ] Ordinary equipment starts at Common/Uncommon. **Hidden armaments** span **Rare → Epic → Legendary → Mythic → Transcendental**.
- [ ] Discover hidden weapons via secret locations, puzzles, hidden questlines, guardians, world events, and secret realms; avoid relying exclusively on vanishingly small RNG drops or permanently one-of-a-kind world ownership.
- [ ] Players may **discover, own, display, and trade weapons incompatible with their permanent path**; path compatibility limits equipping, not acquisition.
- [ ] **All hidden weapons remain tradeable** after equipping, upgrading, refinement, and awakening; never bind on equip or awakening. The weapon instance carries its unique ID, rarity, upgrades, enchantments, awakening stage, and compact provenance; personal mastery/attunement/trial progress remains with the character.
- [ ] Add crafting/refinement/enchantment/material systems and weapon awakening plus separate wielder attunement. Balance rarity through distinct mechanics and potential rather than automatic PvP dominance.
- [ ] Keep items personally owned unless explicitly transferred or donated to a Sect. Use unique server-generated item IDs and authoritative item minting.

### Player economy and secure trading

- [ ] **Spirit Coins** as the primary tradeable earned currency; no Robux-to-Spirit-Coins conversion or paid weapon-power advantage. Track faucets, sinks, inflation, and affordability.
- [ ] Support **direct player-to-player trades AND a public Grand Exchange marketplace**. Direct trades allow items/currency, no initial fee, dual confirmation, and offer-change resets.
- [ ] **Free-market pricing:** sellers choose any valid whole-number Spirit Coin asking price within technical bounds; **no rarity-based price caps**. Show reliable completed-sale comparisons for transparency, not mandatory prices.
- [ ] Marketplace initial *proposals*: fixed-price listings, 48-hour duration, five concurrent listings, 5% sale tax deducted from seller proceeds, minimum price 1 Spirit Coin, no listing fee; direct trading from Level 10, marketplace from Level 15. Tune through testing.
- [ ] Reserve items/currency during trades and listings. Validate ownership, balances, permissions, and capacity server-side. Use unique transaction IDs, durable transaction journal, idempotent commit/delivery, single-winner listing purchase, and reconciliation after disconnect/crash. Roblox DataStores are **not** cross-player atomic transactions; do not assume two separate writes are safe.
- [ ] Monitor duplication, remote-event abuse, alt farming, anomalous trades, market manipulation, and suspicious price history. Never claim exploit-proof trading without failure/concurrency testing.
- [ ] Introduce marketplace after inventory and direct trading are reliable; auctions and Sect treasury can follow later.

### Main story, NPCs, quests, and living world

- [ ] **Confirmed narrative structure:** a **shared persistent world with meaningful personal choices**. Player decisions affect personal dialogue, NPC relationships, faction standing, quest outcomes, and opportunities without permanently contradicting other players' shared world.
- [ ] Main narrative explores reincarnation and the nature of Qi/cultivation, but remains open-ended and compatible with independent exploration, commerce, and Sects.
- [ ] **Proposed, not yet confirmed canon:** the ancient **Fracturing** catastrophe, mysterious Rebirth of souls, and five expandable chapters: *The First Awakening*, *Whispers of the Forgotten*, *The Kingdom of Divided Oaths*, *The Broken Meridian*, *Echoes Beyond Rebirth*. Do not treat these names or plot details as final without approval.
- [ ] **Opening sequence is not decided yet:** mysterious awakening in First Haven, cinematic reincarnation prologue, and player-defined past are options for the next design discussion.
- [ ] NPC relationships track **Trust**, **Respect**, and **Faction Reputation** separately. NPC factions are distinct from player-founded Sects. Consequences persist per player; avoid locking core gameplay behind accidental dialogue choices.
- [ ] Quest categories: **main story, regional, character, cultivation, exploration, and dynamic events**; later Sect missions, Master–Disciple training, and crafting commissions. Persist quest journals, choices, and reward claims.
- [ ] NPCs use lightweight schedules and behavior, with more detailed routines for important characters. Essential services remain available.
- [ ] Shared, temporary/reversible world events: **monster invasions, roaming bosses, realm disturbances, festivals, and the Sovereign's Clash**. Event rewards and shared-state changes require server validation and should not permanently exclude late players.
- [ ] Personal branching quests should support cooperation without forcing all party members into identical outcomes.

### Alpha 0.1 vertical-slice priorities (proposed; not yet authorized as tasks)

- [ ] Third-person player controller and camera, with existing Task 002 WIP inspected before migration.
- [ ] Small First Haven plus forest outskirts, one hidden cave, one server-verified journal discovery.
- [ ] Reincarnation introduction and **permanent player-chosen path** with confirmation.
- [ ] Levels 1–20, Awakening/Refinement, Qi, basic stats, one breakthrough, foundational movement/combat and one introductory branch unlock per path.
- [ ] Introductory trainer/manual, skill-tree/loadout UI, server-owned technique points and persistence.
- [ ] A few story/regional quests, one personal branching decision, basic NPC relationship values, and a small regional event.
- [ ] Spirit Coins, inventory, unique item instances, Rare/Epic discovery examples; **do not ship a real-money or public high-value market before secure transaction infrastructure**.
- [ ] Implement/version saves, validate all consequential rewards server-side, and test single-player and multiple Studio clients.
- [ ] Keep advanced realms, legendary armaments, global marketplace, Sect governance, large events, and extensive world regions for staged expansion.

### Planning and implementation guardrails

1. **Do not treat this design backlog as completed code.** All unchecked items require explicit task authorization and validation.
2. **Revise Stages 2–11 and the Task 002 checkpoint before resuming implementation**, replacing obsolete FPS/companion assumptions with third-person Murim MMORPG milestones. Preserve Task 001 history and any existing WIP.
3. Numerical values (XP curves, Qi formulas, damage multipliers, prices, taxes, point budgets, thresholds, and level bands) are **initial balance proposals**, not playtested guarantees.
4. Design discussions still pending include the exact reincarnation opening, full narrative canon, death penalties, detailed technique balancing, party loot allocation, and final cross-server economy architecture.
