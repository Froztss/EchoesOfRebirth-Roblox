# Echoes of Rebirth — Roblox Development Roadmap

**Platform:** Roblox Studio + Luau + Rojo. **Genre:** third-person, persistent shared-world Murim/xianxia cultivation MMORPG. **Design authority:** approved choices in the 2026-11-06 baseline and 2026-11-08 update below; later explicit user decisions supersede earlier proposals.

> **Implementation status (2026-11-08):** **Task 001 foundation verified complete.** **Task 002 has reported work-in-progress/checkpoint material, but its current branch, commit, and Studio acceptance have not been verified here.** No later gameplay stage is claimed complete. Unchecked tasks are design/implementation backlog, not evidence of working code. Do not infer task completion from design approval.

> **Before any AI-agent or manual code edits:** Open the project workspace (including Codespace in VS Code when used) and **git pull first**; inspect `git status`, current branch, latest commits, Task 002 checkpoint, Rojo mapping, and existing controller modules. Preserve WIP, avoid destructive overwrites, and obtain explicit task authorization. Coordinate agents through clear task ownership and handoffs; maintain incremental checkpoints/commits and test in Roblox Studio where needed. The workflow is tool-agnostic: Codex and other coding, testing, documentation, design, or asset agents may contribute under the same safeguards.

## Development stages — authoritative implementation order

Stages represent **dependency order**, not a claim that all listed work fits into a single task or release. Build small vertical slices and verify server authority, persistence, mobile/gamepad controls, and multi-client behavior continuously. Alpha 0.1 is a compact playable slice across relevant early stages; advanced features may remain post-Alpha.

### Stage 1 — Project foundation [VERIFIED COMPLETE]

- [x] Rojo service mappings, strict client/server bootstrap, shared configuration, documentation, and Git exclusions (Task 001).
- [x] Rojo build/sourcemap and available checks; preserve Baseplate/Camera and unmanaged Studio scene.
- [x] User-verified Studio sync, single-player and two-client startup without game-script startup errors.

**Acceptance:** Task 001 verification record below remains authoritative. No new gameplay is implied.

### Stage 2 — Character controller, camera, and input

- [ ] **Inspect and reconcile Task 002 WIP first**; do not replace `PlayerController`, `CharacterSetup`, lifecycle modules, or checkpoints without review.
- [ ] Third-person R15 movement, camera orbit/lock-on foundation, collision, sprint/jump, input abstraction, and character respawn lifecycle.
- [ ] Establish client responsiveness and server validation for consequential movement/actions; support desktop, mobile, and controller.
- [ ] Basic region transitions, interaction prompts, HUD, and two-client isolation.

**Acceptance:** Player controls, camera, lifecycle, and interactions work in Studio with two clients and no obsolete first-person assumptions. Preserve Task 002 changes.

### Stage 3 — Character identity, onboarding, and durable profile foundation

- [ ] One character per Roblox UserId; versioned server-owned profile, session locking/fencing, migrations, safe retries, and crash/disconnect tests.
- [ ] Roblox-avatar-based appearance customization, filtered in-world name, cosmetic/stat separation, and Soul Record.
- [ ] Reincarnation prologue, Latent Rebirth Resonance introduction, First Haven onboarding, Sword/Body/Arcane trial previews, and **explicit confirmed permanent path choice**.
- [ ] Persist path, appearance, identity, account/character boundaries, and initial discovery/quest state; no self-service character reset in Alpha.

**Acceptance:** Rejoin preserves a single valid character and irreversible path choice; failed/duplicate requests cannot create extra slots or double-grant rewards.

### Stage 4 — Core martial combat, resources, and death/revival

- [ ] HP, stamina, Qi, damage/hitboxes, attack state machine, light/heavy combos, guard/perfect parry, dodge, stance break, and basic lock-on.
- [ ] Basic Qinggong dash/enhanced leap and one starter technique per path; latency-aware server validation and responsive client presentation.
- [ ] Alive/downed/revive/respawn lifecycle, universal basic revival, Sanctuary Points, Temporary Qi Disruption, and safe meditation recovery.
- [ ] Combat input buffering/cancel priorities, readable telegraphs, mobile/gamepad parity, and abuse/latency tests.

**Acceptance:** All three paths can defeat test targets and survive basic combat solo; two clients cannot forge damage, invulnerability, revival, or resources. Numerical values remain playtest targets.

### Stage 5 — Cultivation progression, techniques, and inventory

- [ ] Hybrid character level + cultivation, attributes, Qi circulation/reinforcement, Insight, breakthrough trials, and persistent realm stages.
- [ ] Sword/Body/Arcane technique branches, Discovered → Learned → Unlocked → Equipped lifecycle, four active slots, limited refundable points, trainer respec within permanent path.
- [ ] Basic inventory, unique item instances, path-incompatible ownership, equipment, Spirit Coins, and server-owned rewards.
- [ ] Introductory crafting/refinement and manuals only after inventory/reward correctness is verified.

**Acceptance:** Progression, respec, inventory, and equipment persist without duplicate grants or unauthorized path switching.

### Stage 6 — Adaptive martial AI and core encounters

- [ ] Reusable NPC behavior states, utility-based action selection, short-term combat memory, threat targeting, and enemy archetypes.
- [ ] Training dummy, forest bandit, spirit beast, elite martial disciple; telegraphed attacks, fair counterplay, leash/reset rules.
- [ ] Regional baseline difficulty and controlled multiplayer participation; server-controlled spawns, bounded AI/physics/effects budgets.
- [ ] Instrument and test enemy decisions, reaction delays, adaptation decay, latency, and anti-stunlock behavior.

**Acceptance:** Solo and two-client encounters are readable, performant, and server-authoritative; AI cannot perfectly read player inputs.

### Stage 7 — First Haven, NPCs, quests, and personal story

- [ ] First Haven and Whispering Forest starter routes, landmarks, Sanctuary Points, interactable NPCs, and accessible services.
- [ ] Main/regional/character/cultivation quest foundations, journal, NPC Trust/Respect/Faction Reputation, and one meaningful personal branch.
- [ ] Shared-world events with personal progression/rewards and no forced shared narrative decisions.
- [ ] Adventurer Pact and Master–Disciple design hooks only where needed; do not add compulsory squads or obsolete Seraphine companion mechanics.

**Acceptance:** A player can complete onboarding and a coherent quest branch; two players see compatible shared world state while keeping distinct choices.

### Stage 8 — Qinggong exploration, discovery, and puzzle foundations

- [ ] Interconnected world with soft gates, hazard signposting, region labels, and discoverable realm entrances.
- [ ] Discovery Journal (Unknown → Rumored → Discovered), resonance traces/memory clues, and server-verified one-time discoveries.
- [ ] Basic Qi formation puzzle, optional hidden chamber, Qinggong traversal section, telegraphed hazard, and Sanctuary Anchor.
- [ ] Solo-accessible puzzle alternatives, mobile/gamepad accessibility, and checkpoint/discovery persistence boundaries.

**Acceptance:** Players can find and solve one secret without external guides or another player; no duplicate first-discovery claims or Qi-disruption softlocks.

### Stage 9 — World bosses, instanced guardians, and first secret realm

- [ ] One shared regional mini-boss: spawn/discovery cues, encounter boundaries, contribution eligibility, anti-griefing, and personal loot.
- [ ] One private guardian expedition: solo/voluntary group entry, participant-based scaling, reconnect/teleport failure recovery, wipe reset, and first-clear journal.
- [ ] **Forgotten Meridian Sanctuary** prototype: entrance, Outer Hall, Four Meridian Seals, optional archive, Qi Conduit hazard/traversal, Sanctuary Anchor, Fallen Meridian Guardian, Legacy Chamber.
- [ ] Idempotent item/currency/first-clear grants, participation fairness, and multi-client failure testing.

**Acceptance:** Solo and cooperating players can complete the realm; loot is individually earned, claimed once where applicable, and remains correct after retry/disconnect.

### Stage 10 — Economy, social systems, and world expansion

- [ ] Expand crafting/refinement/enchantment, Rare→Transcendental hidden armaments, and always-tradeable equipment including awakened/path-incompatible items.
- [ ] Secure direct trades first; public Grand Exchange later with durable escrow/journaling, idempotency, reconciliation, free-market Spirit Coin prices, and anti-duplication testing.
- [ ] Voluntary Adventurer Pacts, Master–Disciple mentorship, player-founded Sects, consensual nonlethal duels, and later Sovereign's Clash.
- [ ] Expand regions, dynamic events, secret realms, quests, and scalable shared-world operations only after foundation is measured.

**Acceptance:** Trades cannot duplicate assets across disconnects or concurrent purchases; social play is optional; regional expansion stays within performance budgets.

### Stage 11 — Integration, optimization, accessibility, and release

- [ ] Integrate the Alpha 0.1 20–30-minute onboarding/early-world slice before wider content expansion; separate post-Alpha work from release blockers.
- [ ] Original/licensed Roblox-compatible assets, martial animations, audio, effects, UI, graphics settings, and accessibility.
- [ ] Profile low-end mobile, PC, and controller experience; stress-test AI, bosses, DataStore failures, teleports, multiplayer, and exploit attempts.
- [ ] Document acceptance results, regressions, publishing configuration, and explicit release authorization.

**Acceptance:** Release only after an explicitly authorized, measured and tested build passes its defined scope.

## Cross-stage engineering requirements

- **Server authority:** All consequential combat, movement eligibility, quests, cultivation, items, trades, puzzle states, participation, and rewards are validated server-side.
- **Persistence:** Versioned data, session ownership, retries, idempotent claims/transactions, and failure recovery are built incrementally, not postponed until late development.
- **Compatibility:** Desktop, mobile, and gamepad controls; solo viability for standard story/realms; two-client tests at every relevant stage.
- **Performance:** Profile AI scheduling, physics, effects, streaming, replication, and memory before expanding scope.
- **Security:** Never assume Roblox DataStores offer atomic cross-player transactions; design explicit journals, escrow, and reconciliation.
- **Scope control:** One explicitly approved implementation task per agent at a time, with coordinated ownership to prevent overlapping edits. Multiple AI agents may collaborate on distinct scoped tasks; review changes before merging. Preserve source history, document manual Studio checks, and never mark unchecked design items implemented.

## Alpha 0.1 milestone gates (proposed)

1. **Foundation gate:** Task 001 verified; Task 002 reviewed/reconciled before further controller edits.
2. **Character gate:** one character, onboarding, path choice, identity/resonance, persistent save.
3. **Combat gate:** basic Sword/Body/Arcane, parry/dodge/stance, Qinggong, downed/revive/Qi Disruption.
4. **World gate:** First Haven and forest outskirts, starter NPCs/quests, one personal choice, discovery journal.
5. **Encounter gate:** basic adaptive enemies, one shared mini-boss, one compact hidden realm/guardian, personal loot.
6. **Quality gate:** repeatable solo and multiplayer Studio acceptance, device accessibility, exploit and persistence failure tests.

**Alpha is a target scope, not a commitment to ship every Stage 10 economy/social feature.** Large realms, Grand Exchange, Sect governance, high-tier weapons, and large world events are later expansion unless separately prioritized.

---

## Task 001 verification record

Automated results and user manual acceptance are recorded separately below. Stage 1 is complete; later-stage completion must be verified against the current branch and Studio. Task 002 has reported work-in-progress, not a verified completion.

2026-11-02 — Automated verification: applied the code-only mapping after the user confirmed Studio's Rojo plugin was disconnected. Rojo 7.7.1 build and sourcemap generation passed. The generated hierarchy contains the expected Script, LocalScript, and ModuleScript with source matching disk, and no Workspace, Baseplate, Camera, Lighting, or SoundService instances. Editor diagnostics, documentation links, 11-stage count, strict directives, and whitespace checks passed. No Studio scene objects were edited. Standalone Luau analysis is unavailable; no separate Studio Script Analysis result has been reported.

2026-11-02 — User manual acceptance and Task 001 completion: Rojo synchronization, Baseplate and Camera preservation, Client/Server/Shared Config mappings, single-player startup, and two-client multiplayer startup passed. The server and both clients displayed their startup messages. No errors originating from game scripts were reported. Studio's asset-type warning for asset ID `203785492` is non-blocking and documented; its requesting component remains unidentified. The user authorized the private repository setup, foundation commit, and push to `main`. Task 002 status requires branch/worktree verification; do not assume it is unstarted or complete.


---

## Current game design direction — 2026-11-06 (planning baseline; not implemented)

> **HISTORICAL DESIGN BASELINE (2026-11-06):** This section preserves earlier approved choices and provisional proposals. The newer 2026-11-08 design update below overrides conflicting statements here. The authoritative implementation order is Stages 1–11 at the top of this file. Task 001 is complete; Task 002 is unverified WIP and must be inspected before editing controller files. Unchecked items are not implemented.

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
- [ ] **SUPERSEDED:** The opening direction was subsequently chosen: reincarnation prologue, Roblox-avatar-based customization, First Haven onboarding, three cultivation-path trials, and confirmed permanent player choice. See the 2026-11-08 update; cinematic details remain provisional.
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
2. **Stages 2–11 have been revised** to third-person Murim MMORPG milestones at the top of this file. Before implementation, inspect the current Task 002 branch/checkpoint, preserve WIP, and reconcile existing files with the new staged plan.
3. Numerical values (XP curves, Qi formulas, damage multipliers, prices, taxes, point budgets, thresholds, and level bands) are **initial balance proposals**, not playtested guarantees.
4. **Updated 2026-11-08:** Reincarnation opening direction, Temporary Qi Disruption, personal boss loot, hybrid combat, adaptive AI, hybrid bosses, and exploration-driven realms are now selected. Still pending: exact narrative canon, numerical combat tuning, exploration clue/hint presentation, and final cross-server economy architecture.


---

## Design progress update — 2026-11-08 (confirmed decisions and implementation backlog)

> **STATUS:** Design/planning only. Nothing in this section is implemented or tested merely because it is documented. This section supersedes conflicting or undecided statements in the 2026-11-06 design baseline above (especially the opening, death penalty, camera/combat, enemy AI, and boss/dungeon choices). Stages 2–11 above have now been rewritten for the Roblox Murim MMORPG. Do not overwrite Task 002 WIP without inspecting branch/status; user intends to git pull first when reopening Codespace.

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
- [ ] **CONFIRMED world map discovery — Option C (Hybrid Map):** The Wanderer's Atlas displays broad geography from the outset (major regions, mountain ranges, rivers, and known settlements), while local terrain detail, traversed paths, ordinary landmarks, and points of interest reveal progressively through physical exploration. Secret realm entrances and hidden locations remain concealed until each player personally discovers them.
- [ ] **Personal discovery persistence:** explored map detail, confirmed discoveries, and discovered realm entrance markers persist per character across sessions; sharing a world does not automatically share another player's secret markers. A discovered entrance can be revisited without needing to rediscover it.
- [ ] **Map/journal integration:** NPC rumors and clues belong in the Discovery Journal; they can suggest approximate search areas but must not automatically pinpoint secret entrances. Latent Rebirth Resonance supplements environmental and lore clues, without replacing exploration. Detailed UI, reveal radius, fast travel rules, and journal hint thresholds remain proposals pending approval.
- [ ] **CONFIRMED reconciliation difficulty — Option C (Severity-Based Reconciliation):** Scale eligible relationship repair to the seriousness of the harm: minor conflicts require modest, contextual effort; serious betrayals require meaningful multi-stage personal quests, restitution, or trials. Some narrative outcomes remain irreversible, but essential character/cultivation progression must always have viable alternative routes. Avoid premium-currency requirements, rote repeatable-contract grinding, and mandatory multiplayer reconciliation gates; keep original choices recorded even after renewed cooperation.
- [ ] **Reconciliation tier and mission balance details pending approval:** Define severity classification, eligibility, stage count, acceptable restitution, branch-specific but equivalent-power reward budgets, cooldowns, anti-abuse rules, personal save flags, and NPC Chronicle record presentation. No exact durations, numeric costs, or example quests are approved by this pacing choice.
- [ ] **CONFIRMED branching quest rewards — Option C (Equivalent Power, Different Opportunities):** Meaningful quest choices grant comparable overall character/cultivation progression value while differentiating narrative outcomes, NPC trust, faction access, questlines, training routes, cosmetics, and appropriately balanced techniques or equipment. Do not make one story branch the objectively strongest or lock essential progression behind a single irreversible choice; preserve viable alternative acquisition paths and tradeability rules for equipment. Equivalent power does not require identical rewards or identical stories.
- [ ] **Branch/reconciliation reward balance pending approval:** Specify reward-budget bands by mission tier, alternate technique parity, first-clear versus repeatable claims, reconciliation costs and eligibility, anti-farming rules, NPC state/quest flag validation, and no-softlock fallback paths. Example missions, numbers, and specific costs remain proposals.
- [ ] **CONFIRMED NPC consequence persistence — Option C (Persistent History with Earned Reconciliation):** Significant personal choices remain permanently recorded in character-specific relationship/quest history, and some story outcomes are irreversible. Where narratively appropriate, meaningful reconciliation quests can restore cooperation, trust, or alternate opportunities without deleting the original decision or allowing repetitive contracts to erase consequences. Preserve viable cultivation and character progression through alternative routes; prevent irreversible decisions from softlocking the single active character. Shared-world state must remain distinct from private personal consequences.
- [ ] **Consequence implementation design pending:** Define choice flags, irreversible versus repairable outcomes, reconciliation eligibility and costs, branching mission fallbacks, Chronicle People & Bonds presentation, save migration and idempotent quest rewards. Sample NPCs and specific missions are proposals, not approved canon.
- [ ] **CONFIRMED NPC relationship visibility — Option C (Narrative Relationship Indicators):** Show readable descriptive relationship states (e.g., Wary, Neutral, Trusted, Bonded, and appropriate hostile states) and significant relationship milestones in the player's journal; keep exact numerical trust/affinity values hidden. Communicate important shifts through NPC dialogue, behavior, and clear narrative feedback rather than point farming. Relationship indicators are personal per character and must not expose other players' private choice history.
- [ ] **NPC relationship records and consequence persistence — design pending:** Define journal records, significant choice flags, trust state changes, reconciliation boundaries, save schema, mission unlock/fallback paths, shared-world versus personal state separation, and progression/reward balancing. Specific state labels, thresholds, and UI layouts are illustrative until approved.
- [ ] **CONFIRMED NPC relationship progression — Option C (Hybrid Relationship System):** Everyday interactions and eligible missions gradually build or erode NPC trust, while meaningful story choices create persistent relationship milestones, loyalties, rivalries, and personal narrative/quest consequences. Repeatable quest grinding must not automatically undo consequential decisions. Keep character-specific NPC state distinct from shared-world event state; ensure alternative progression remains viable when relationships close some opportunities.
- [ ] **NPC relationship details pending approval:** Design relationship states/visibility, affinity pacing and caps, decision flags, reputation vs individual trust, recovery/reconciliation opportunities, NPC mission unlocks, reward budgets, anti-farming rules, and early-game level pacing. Do not treat illustrative numerical rewards or quest level bands as approved.
- [ ] **CONFIRMED mission system — Option C (Hybrid Murim Mission System):** Combine handcrafted main-story and cultivation-path quests, repeatable martial contracts, dynamic shared-world events, sect/master assignments, and exploration investigations. Support multiple viable leveling routes (combat, cultivation, exploration, crafting/service, and NPC/social quests), while preserving shared-world events with persistent personal story choices, NPC relationships, and quest consequences. Keep solo play viable; do not reinstate rigid squads or mandatory group progression.
- [ ] **Mission design pending approval:** Specify quest categories, eligibility, repeatability/cooldowns, reward budgets (Character XP, Cultivation Insight, martial proficiency, Spirit Coins, reputation, Legacy Points where genuinely earned), NPC relationship state and consequences, anti-exploit measures, and early-game level pacing. Example quest names and level bands are not yet confirmed implementation requirements.
- [ ] **CONFIRMED exploration rank pacing — Option B (Balanced Progression):** Early Chronicle exploration ranks should be attainable through ordinary, varied exploration with frequent initial recognition; later ranks should require broader investigations and meaningful discoveries, providing sustainable long-term goals without excessive grind, completionism pressure, mandatory group play, or exclusive combat power. Balance pacing against the actual discoverable-content budget and solo accessibility.
- [ ] **Rank pacing calibration pending:** Five illustrative ranks, names, LP thresholds (0/75/250/600/1200), discovery-tier point awards (5/15/40/100), achievement gates, and reward frequencies are NOT approved numerical specifications. Define measurable expected playtime, content availability, reward tables, and server-side validation before implementation.
- [ ] **CONFIRMED exploration achievement progression — Option C (Hybrid Legacy Progression):** Unique, personally completed discoveries grant one-time legacy progress points scaled by discovery significance; advancement at major Chronicle exploration ranks also requires varied exploration achievements (e.g., investigation, puzzle, secret-realm, or lore milestones). Repeating trivial discoveries cannot substitute for major achievements or generate duplicate rank points. No mandatory group-only milestones; solo play remains viable. Exploration rank grants optional recognition/cosmetics/lore/nonessential benefits, never exclusive combat-stat power.
- [ ] **Progression details pending approval:** Rank count/names, point values and thresholds, achievement diversity gates, discovery tier definitions, first-discovery reward tables, UI layouts, anti-exploit validation, and accessibility fallbacks remain design proposals, not implemented or confirmed.
- [ ] **CONFIRMED discovery milestone tracking — Option C (Hybrid Legacy Milestones):** Every significant discovery has its own persistent personal record and guaranteed eligible first-discovery reward. Separately, cumulative exploration achievements unlock optional titles, cosmetics, lore, recognition, and nonessential benefits through the Chronicle of Echoes. Exploration rank must NOT grant exclusive combat-stat bonuses or become mandatory for viable cultivation/combat progression.
- [ ] **Milestone design still pending:** Discovery-significance tiers (Wanderer's Discovery, Forgotten Knowledge, Ancient Legacy, Transcendent Revelation), milestone points/thresholds, repeatable reward pacing, anti-farming safeguards, and Chronicle milestone interface are proposals requiring review; discovery tier must not imply guaranteed item rarity.
- [ ] **CONFIRMED exploration reward philosophy — Option C (Balanced Legacy Rewards):** Exploration yields both meaningful cultivation/martial progression (Insight, technique knowledge, materials, equipment opportunities) and world/narrative discoveries (lore, hidden masters, sect relationships, optional quests, titles, and story branches). Discovering every secret must NOT be mandatory for viable character progression or competitive PvE participation; combat, cultivation training, and social activities remain viable alternatives.
- [ ] **Balanced first-discovery and repeatable rewards:** Preserve guaranteed significant first-discovery/story milestones and separately tracked repeatable eligible materials/loot; hidden Rare–Transcendental armaments remain tradeable. Reward amounts, rarity probabilities, milestone thresholds, anti-farming limits, and detailed progression balance are proposals pending approval.
- [ ] **CONFIRMED Discovery Journal interface — Option C (Hybrid Chronicle):** The Chronicle of Echoes combines an ancient Murim manuscript aesthetic (illustrated parchment, ink, seals, and lore presentation) with practical modern UX: searchable entries, clear categories, readable evidence/progression tracking, and accessible navigation on PC, mobile, and gamepad. Decorative page effects must not slow navigation or obscure text.
- [ ] **Journal information architecture (design refinement pending):** organize rumors, active investigations, and completed legacy records with map links, evidence, optional hints, and personal discovery history. Final screen layouts, search/filter details, completion criteria, reward values, and progression pacing require separate approval.
- [ ] **CONFIRMED Discovery Journal hint unlock — Option C (Hybrid Hints):** Players earn progressively more useful hints by investigating rumors, collecting evidence, and exploring relevant landmarks. When genuinely stuck, players can explicitly request accessible assistance after sufficient investigation or difficulty; no compulsory waiting-only gate, paid hints, or mandatory external guides.
- [ ] **Hint boundaries:** Optional hints increase from contextual clues toward approximate search regions; never automatically reveal the exact secret entrance, complete puzzles, or replace player discovery. Hint use is player-controlled and should not penalize discovery rewards. Exact eligibility thresholds, accessibility fallback, and UI remain to be designed and approved.
- [ ] **CONFIRMED exploration guidance — Option A + C:** clue-driven exploration is the default, with **optional progressive Discovery Journal hints** when players get stuck. NPC rumors, ancient maps, environmental storytelling, world landmarks, and Latent Rebirth Resonance Echo Traces offer contextual leads, not exact automatic waypoints or puzzle solutions.
- [ ] **Progressive hint UX (design details pending):** the journal starts with vague recorded leads, adds clearer contextual hints after exploration/discovery or explicit player request, and may eventually indicate an approximate region without pinpointing secret entrances. Hints must remain optional and never erase the value of independent discovery.
- [ ] **Accessibility and fairness:** important secrets have multiple discoverable clue channels; journal clues remain readable on PC/mobile/gamepad; no mandatory external guides, no path-locked solutions, and no automatic puzzle completion. Final map markers, hint timing, unlock rules, and spoiler controls require separate approval.

### Updated Alpha 0.1 vertical slice — proposal, not implemented

- [ ] One-account/one-character profile, Roblox-avatar-based character creator, filtered in-world name, brief reincarnation/resonance introduction, three path trials and irreversible confirmed path selection; Soul Record starter milestones.
- [ ] Third-person combat sandbox: HP/Qi/stamina, light/heavy starter combos, guard/parry, dodge, stance, basic lock-on, ground dash/enhanced leap, one starter technique per path; baseline mobile/gamepad support.
- [ ] Temporary Qi Disruption, downed/revival, sanctuary respawn, meditation recovery; test solo, group, and disconnect behavior.
- [ ] Starter AI: training dummy, forest bandit with one adaptation, spirit beast, elite disciple, and one guardian with phase escalation.
- [ ] One shared regional mini-boss and one hidden realm: Forgotten Meridian Sanctuary prototype, one formation puzzle, optional archive, Qinggong section, hazard, checkpoint, guardian, and personal rewards.
- [ ] Character-level persistence, permanent path, first-clear/discovery claims, unique items, server-authoritative transactions, schema migrations, and multi-client failure testing.
- [ ] Maintain existing Alpha level/cultivation and story scope where feasible, but **sequence and split work into small explicit tasks**; this is a design backlog, not permission to implement all features at once.

### Next planning work and guardrails

1. **Exploration guidance A + C, hybrid world map C, and Discovery Journal hybrid hints C approved:** next calibrate rank point thresholds and achievement gates to content budgets, first-discovery/repeatable reward tables, cultivation balance, Chronicle milestone interface, completion criteria, map integration, and spoiler-safe accessibility; do not treat unapproved UX specifics as final.
2. **Completed planning correction:** Stages 2–11 now specify the Roblox Murim implementation sequence. Next inspect Task 002 branch/WIP and split the next authorized stage into small tasks; Task 001 verification history remains preserved.
3. Treat all numerical timing, damage, stamina, Qi, spawn, loot, and HP scaling values as **unplaytested prototypes**.
4. Preserve confirmed constraints: one character/account; permanent chosen path; no character-reset feature in Alpha; no cross-character transfers; no forced parties; soloable standard story/realms; no permanent death loss; personal loot; always-tradeable hidden weapons; shared world with personal story choices.
