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


---

## Design progress update — 2026-11-08 (confirmed decisions and implementation backlog)

> **STATUS:** Design/planning only. Nothing in this section is implemented or tested merely because it is documented. This section supersedes conflicting or undecided statements in the 2026-11-06 design baseline above (especially the opening, death penalty, camera/combat, enemy AI, and boss/dungeon choices). Historical Stages 2–11 are still obsolete FPS migration assumptions. Do not overwrite Task 002 WIP without inspecting branch/status; user intends to git pull first when reopening Codespace.

### Confirmed: reincarnation, avatar creation, and single-character account

- [ ] Use **Latent Rebirth Resonance** as the chosen reincarnation-identity concept: a universal narrative/discovery trait for perceiving Qi traces, fragmented memories, inscriptions, and disturbances, **not an innate combat-stat advantage**. Proposed resonance stages: Dormant Echo, Awakened Echo, Resonant Memory, Soul Convergence (names/balance provisional).
- [ ] Opening direction: reincarnation prologue, Roblox-avatar-based R15-compatible fantasy appearance customization, in-world character identity, awakening in First Haven, introductory movement/Qi/resonance/combat, **trials of Sword, Body, and Arcane**, followed by informed, confirmed, permanent player choice of one path. Narrative details and cinematic pacing remain to be finalized.
- [ ] Character appearance is cosmetic, with standardized combat hitboxes; support hair, face, skin tone, outfits, accessories, and later appearance evolution. In-world character name is separate from Roblox username/UserId and must use Roblox text filtering and anti-impersonation safeguards.
- [ ] **Exactly one active character per Roblox account (one slot; no purchasable extra slots).** The cultivation path is permanent for that character; technique-point respecialization **within** the path and cosmetic changes are permitted. No alternate-character switching.
- [ ] Separate durable **account-level** metadata (UserId, settings, moderation/security, account cosmetics and recovery/audit references) from **character-level** progress (name/appearance, permanent path, level, attributes, realms, resonance, techniques, Qi, inventory, Spirit Coins, NPC relationships, quests, journal, Sects, and Soul Record).
- [ ] Add a **Soul Record** of key personal milestones (first awakening, path choice, breakthroughs, relationships, major discoveries). This is historical/narrative, not a second character or combat power track.
- [ ] **No self-service destructive character deletion/reset in Alpha 0.1.** Appearance changes do not require a reset. If a full reset is added later, design explicit typed confirmation, cooling-off/recovery window (7 days proposed), marketplace settlement, audit/recovery policy, and irreversible-loss disclosure; never promise untested backup guarantees.
- [ ] **Cross-character item transfers do not exist** under one-slot accounts. No inventory inheritance on character reset; trading between different accounts follows ordinary secure player-trading rules, including abuse monitoring. Account recovery must not duplicate items.
- [ ] Versioned, server-authoritative character saves with session ownership/fencing, migration, idempotent permanent path selection, crash/disconnect handling, and testable recovery.

### Confirmed: Temporary Qi Disruption, death, respawn, and revival

- [ ] Standard PvE flow: **Alive → Downed → Revived OR Dead → Sanctuary Respawn → Qi Recovery**. Solo players may opt for immediate respawn rather than waiting downed timer.
- [ ] **Temporary Qi Disruption** is the standard death penalty: proposed **−15% maximum Qi, −20% Qi regeneration, 3 minutes of active in-game time**. Repeated deaths refresh duration but **do not stack severity**. No permanent XP, cultivation realm, technique-point, Spirit Coin, or equipment loss.
- [ ] Initial downed/revival targets: **20-second downed timer**, universal **5-second uninterrupted basic revival** at short range, **15 Qi cost**, revive at **30% HP / 20% Qi**, brief post-revival protection ending on offensive action. Server validates range, timing, interruption, eligibility, and single successful revival. Figures provisional.
- [ ] Recover disruption naturally, through **safe-zone meditation** (30 seconds proposed), and later healer NPCs/medicines. Never require paid recovery consumables.
- [ ] **Sanctuary Points** in the world and **Sanctuary Anchors** inside realms define safe respawns; handle solo/group wipe, boss resets, reconnects, and non-exploitable checkpoint activation.
- [ ] Consensual duels and ceremonial tournaments are **nonlethal**: no Qi Disruption, inventory loss, or permanent setback.
- [ ] Spirit Arts may improve revival, but universal basic revival must remain available to all three paths.

### Confirmed: hybrid third-person martial action combat

- [ ] **Hybrid martial action**: responsive light/heavy combos, guard, timed perfect parry, dodge, stance/posture pressure and break, optional lock-on, Qi techniques, and progressive **Qinggong** traversal.
- [ ] Resources: **HP** for survival, **Stamina** for guard/dodge/sprint/heavy strikes/basic movement, and **Qi** for cultivation techniques, reinforcement, advanced mobility, and support. Basic attacks do not require Qi.
- [ ] Proposed starting balance: perfect parry **0.20s**, normal guard **60%** eligible damage reduction, successful perfect parry **100%** eligible damage reduction, guard-break stagger **0.8s**; dodge **0.45s** with **0.20s** invulnerability and **20 stamina** cost. Tune for Roblox latency and device differences; distinguish parryable and dodge-required attacks clearly.
- [ ] Stance pressure increases through heavy strikes, parries, and techniques, decays out of pressure, and creates short finisher windows at break. Bosses and players require anti-stunlock protection.
- [ ] Sword: precise chained strikes, parry/counter, aura and guided blades. Body: close-range combos, resilience, stance pressure/internal force. Arcane: Qi pulses, elemental/formation control and Spirit Arts. All paths viable solo and retain universal core actions.
- [ ] Qinggong progression (proposed): Foundation ground dash/enhanced leap → Flowing Step air dash → Cloud Step extra air step → Sky Traversal advanced aerial/wall movement → Celestial Movement. Preserve soft-gated exploration, stamina/Qi budgets, and movement anti-exploit checks.
- [ ] Four equipped path-technique slots; input proposals: WASD/mouse, LMB light, RMB heavy, F guard/parry, Q dodge, Shift sprint, Space jump, E interact, R reinforcement, 1–4 techniques, G Qinggong, Tab lock-on, X meditation. Remapping and mobile/gamepad equivalence required.
- [ ] Server validates attack states/hitboxes/damage, Qi/stamina, cooldowns, parry timing with bounded latency compensation, Qinggong movement, and RemoteEvent rate limits. Client predicts responsive presentation only.

### Confirmed: adaptive martial enemy AI and living encounters

- [ ] **Adaptive Martial AI** using high-level behavior states + utility-scored combat actions + **short-term encounter-local memory** (proposed 5–8 meaningful player actions); no omniscient input-reading or guaranteed counters.
- [ ] States include patrol/idle, investigate, engage, retreat/disengage, return, and defeat. Archetypes: Aggressive Striker, Defensive Guardian, Mobile Duelist, Qi Caster, Heavy Beast/Juggernaut.
- [ ] Enemies can respond probabilistically to repeated light spam, parries, kiting, dodge patterns, and formation use, with readable tells and exploitable recovery windows. Difficulty tiers: Common, Trained, Elite, Master, Boss, Realm Guardian.
- [ ] **Regional baseline + soft progression gates**, not universal player-level scaling. Proposed bands: First Haven outskirts 1–10, Whispering Forest 8–25, Aurelian Kingdom 15–45, Ashen Frontier 35–70; secret realms vary. All provisional.
- [ ] Bosses combine authored phases and mechanics with bounded adaptive choices. Proposed illustrative phases 100–70%, 70–35%, 35–0%; not every boss needs three phases. No unavoidable stunlock or unreadable attacks.
- [ ] Threat-based multiplayer targeting with limits on excessive target switching, boss leashing/reset abuse, and attack pileups. Active AI updates budgeted by relevance; server-authoritative rewards and encounters.
- [ ] Living-world encounters: ambient patrols/beasts, reactive conflicts, dynamic merchant ambushes/defenses, rare wandering masters and realm disturbances. Shared events are temporary/reversible; personal quest outcomes persist.
- [ ] Proposed early guardian: **Fallen Meridian Guardian**, a corrupted shrine guardian linked to Resonance memory fragments; working encounter concept, not finalized canon.

### Confirmed: hybrid shared world bosses and instanced guardians

- [ ] **Hybrid world bosses + instanced guardians**: shared discoverable regional/wandering/event bosses and controlled private story/secret-realm guardians.
- [ ] World bosses: server-managed spawn windows and multiple eligible locations, environmental/NPC/Resonance clues, leash/home areas, protected settlements, and anti-camping design. Example regional cadence **45–90 minutes** per server is provisional.
- [ ] **Open participation without compulsory squads**. Track meaningful individual contribution from damage, effective support, interruptions, objectives, and stance actions. Reject idle/last-second leeching while supporting legitimate late arrivals.
- [ ] **Personal loot** per eligible player, not shared loot rolls. One-time first-clear/story rewards and repeatable eligible materials; deterministic discovery milestones/pity-like protection for selected valuable items. Hidden weapons remain always tradeable, including path-incompatible/upgraded ones.
- [ ] Secret-realm entry: discover gateway, solve clues/puzzles or meet selected trial requirements, then enter solo or with voluntary companions. Normal story guardians and standard realms must be soloable; no path-specific mandatory solution.
- [ ] Instance scaling by committed participants; proposed **base HP × [1 + 0.45 × (participants − 1)]** for 1–4 participants, with authored mechanics adjusted to party size. Not final; avoid join/leave scaling exploits.
- [ ] Downed/revival and Qi Disruption integrate with guardians; full group wipe resets active encounter, fully dead participants cannot immediately respawn into the same active boss attempt.
- [ ] Robust entry/exit, teleport failure, disconnect recovery, encounter ownership, server-authoritative contribution, and idempotent reward claims. Reserve servers/separate places only where justified by Roblox constraints and testing.
- [ ] Preserve free-market weapon trading; control inflation through encounter/drop rates, crafting demand and currency sinks rather than bind-on-equip or rarity-based market price caps.

### Confirmed: exploration-driven handcrafted secret realms

- [ ] **Exploration-driven secret realms**, primarily handcrafted: hidden entrances, outer exploration, optional routes, ancient puzzles, environmental hazards, Sanctuary Anchors, adaptive guardians, and personal rewards.
- [ ] Realm families: Forgotten Sect Ruins, Spirit Vein Caverns, Celestial Sanctuaries, Corrupted Realms; thematic categories, not final world canon.
- [ ] Reusable puzzles: Qi Formation sequencing, Meridian Circuit energy routing, Martial Trials, Qinggong traversal, and Historical Reconstruction. Essential puzzles support solo solutions, mobile/gamepad, non-color-only clues, and recoverable failure.
- [ ] **Latent Rebirth Resonance** provides Echo Traces, Memory Fragments, and Soul Reflections as optional contextual clues; it does **not** automatically solve puzzles, and physical/lore clues must permit fair completion.
- [ ] Hidden chamber tiers: Minor Cache, Forgotten Archive, Sealed Vault, Ancient Legacy Chamber. Discover via environmental observation, Qinggong, puzzles, or quest lore; persist one-time claims independently of repeatable material rewards.
- [ ] Hazards: unstable Qi pulses, ancient traps, traversal gaps, corrupted miasma; readable telegraphs, appropriate checkpoint recovery, no unavoidable instant death, and no puzzle softlocks during Qi Disruption.
- [ ] Sanctuary Anchors preserve active-expedition checkpoints; instance-local puzzle state may reset on exit, while permanent discovery journal, Soul Record, first-clear flags, and rewards remain saved.
- [ ] Reward exploration, puzzles, martial mastery, guardians, and discovery with XP, Cultivation Insight, manuals, crafting/refinement materials, personal lore, and hidden armaments. Major narrative first-clear rewards should be guaranteed; repeatables may be randomized.
- [ ] Proposed first realm: **Forgotten Meridian Sanctuary** in Whispering Forest (suggested level 12–20): hidden entrance → Outer Hall → Four Meridian Seals puzzle and optional Forgotten Archive → Qi Conduit traversal/hazard → Sanctuary Anchor → Fallen Meridian Guardian → Legacy Chamber. First-time solo target 25–40 minutes; provisional.
- [ ] **Exploration guidance style is NOT YET SELECTED**: clue-driven, minimal guidance, or progressive Discovery Journal hints remain options. Do not label one confirmed without user selection.

### Updated Alpha 0.1 vertical slice — proposal, not implemented

- [ ] One-account/one-character profile, Roblox-avatar-based character creator, filtered in-world name, brief reincarnation/resonance introduction, three path trials and irreversible confirmed path selection; Soul Record starter milestones.
- [ ] Third-person combat sandbox: HP/Qi/stamina, light/heavy starter combos, guard/parry, dodge, stance, basic lock-on, ground dash/enhanced leap, one starter technique per path; baseline mobile/gamepad support.
- [ ] Temporary Qi Disruption, downed/revival, sanctuary respawn, meditation recovery; test solo, group, and disconnect behavior.
- [ ] Starter AI: training dummy, forest bandit with one adaptation, spirit beast, elite disciple, and one guardian with phase escalation.
- [ ] One shared regional mini-boss and one hidden realm: Forgotten Meridian Sanctuary prototype, one formation puzzle, optional archive, Qinggong section, hazard, checkpoint, guardian, and personal rewards.
- [ ] Character-level persistence, permanent path, first-clear/discovery claims, unique items, server-authoritative transactions, schema migrations, and multi-client failure testing.
- [ ] Maintain existing Alpha level/cultivation and story scope where feasible, but **sequence and split work into small explicit tasks**; this is a design backlog, not permission to implement all features at once.

### Next planning work and guardrails

1. Confirm exploration clue/hint presentation, then design map and Discovery Journal UX.
2. Rewrite obsolete historical Stages 2–11 into a new third-person Murim implementation sequence in a separately authorized planning pass, after inspecting Task 002 branch/WIP. Do not erase Task 001 verification history.
3. Treat all numerical timing, damage, stamina, Qi, spawn, loot, and HP scaling values as **unplaytested prototypes**.
4. Preserve confirmed constraints: one character/account; permanent chosen path; no character-reset feature in Alpha; no cross-character transfers; no forced parties; soloable standard story/realms; no permanent death loss; personal loot; always-tradeable hidden weapons; shared world with personal story choices.
