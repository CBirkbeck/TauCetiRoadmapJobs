# Review of IgusaVarietiesAndTorsionConcentration (pull request #1090 at 5447ef6)

**Verdict:** needs changes

Incremental re-review of the 12 lines changed in `TauCetiRoadmap/IgusaVarietiesAndTorsionConcentration/README.md` since `710c2e5`, and of the pull request's title and description against this head. Line numbers of other roadmaps refer to their README at the open head printed by `roadmaps show`.

## R01 (P3) — Downstream consumers cites BunGAndNewtonStrata sections that its head does not have

**Location:** `TauCetiRoadmap/IgusaVarietiesAndTorsionConcentration/README.md` line 2576: "the hyperspecial Mazur converse of 0.18a, used by its 1.29, and the smooth Grassmannian chart of 3.0c, used by its 3.17".

**Claim:** BunGAndNewtonStrata 1.29 uses 0.18a and its 3.17 uses 3.0c.

**Witness:** BunGAndNewtonStrata at #1241 (`c7d0555`): Layer 3 headings run 3.12 → 3.18, no 3.17; 1.29 (line 812) is integral conjugacy of an ordinary admissible element (He–Rapoport, He–Zhou), no Mazur converse. Its contract (line 84) consumes §§3.4–3.5, 0.3, 0.12, 0.25, 1.4a only.

**Repair:** "BunGAndNewtonStrata (the flag Newton stratification of 3.4–3.5, the unitary data of 0.3, 0.12 and 0.25, and the Igusa dimension of 1.4a)". The chart theorem the previous review saw at BunGAndNewtonStrata 3.17 is no longer stated there, so no second owner remains.

## R02 (P3) — The description contradicts the head in three sentences

**Location:** pull request description: (a) "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti"; (b) "the targeted Lake build succeeds with `sorry` as the only warning"; (c) summary block: "BunGAndNewtonStrata and HeckeStacksAndLocalShtukas draw on the flag stratification, the hyperspecial Mazur converse, …".

**Claim:** the description describes this head.

**Witness:** `Suggested.lean` is a docstring and an empty namespace ("none is statable at the pins, so it declares nothing"); `lake env lean` on it prints nothing, no `sorry`. `roadmaps grep` for a citation of 0.18a or of the Mazur converse from this roadmap: no match on main or at any open head.

**Repair:** (a) "the Lean file declares nothing: no headline theorem is statable against the pinned Mathlib and Tau Ceti, and its docstring names the missing carriers; every target is in the README". (b) "the targeted Lake build succeeds with no warning". (c) "BunGAndNewtonStrata and HeckeStacksAndLocalShtukas draw on the flag stratification, the unitary data and Igusa dimensions, the local PEL data and the Rapoport–Zink spaces."

## R03 (P3) — Build order: 3.0g needs 3.6 and 3.6 needs Layer 3 (carried from the previous R02)

**Location:** README line 1424 (3.0g: "*Needs:* 0.27, 3.6, 3.0a–3.0c, 3.0e; …") and line 1564 (3.6: "*Needs:* Layer 0; Layer 3; …").

**Claim:** the Needs lines form a build order.

**Witness:** by line 117 ("a bare layer (Layer `k`) means the preceding targets of that layer"), 3.6's "Layer 3" contains 3.0g, and 3.0g item (3) needs 3.6: the cycle 3.0g → 3.6 → 3.0g is unchanged at this head.

**Repair:** move item (3) of 3.0g (the identification with `M_{D,∞}`) into a target 3.6a after 3.6, with *Needs:* 0.27, 3.0a–3.0c, 3.0g, 3.6; have 3.0h and 3.26 cite 3.6a for it; write 3.6's Needs as "3.1–3.5, 3.0a–3.0b".

## R04 (P3) — The owned quotient theorem has no target id (carried from the previous R03)

**Location:** README lines 98–113, "### Family quotients by sub-`p`-divisible groups … **Quotients by sub-Barsotti–Tate groups (owned here).**", under Exact supplier contracts.

**Claim:** an owned theorem with a route, a Needs line and Checks is a numbered target of a layer.

**Witness:** unchanged at this head: `grep '^### 0.8'` finds only 0.8; the theorem has no `k.n` id, though FiniteFlatGroupsAndIntegralPadicHodgeTheory assigns it to this roadmap and 0.13, 2.6 and 2.11 use it.

**Repair:** move the paragraph into Layer 0 as 0.8a, cite it by that id from 0.13, 2.6 and 2.11, and leave a one-line pointer under Exact supplier contracts.

## R05 (P3) — 2.16 is narrower than its source (carried from the previous R05)

**Location:** README line 1220: "For arbitrary `X` in the same class, assume `p` splits in `F₀`. … The arbitrary-`X` assertion at an unramified nonsplit `p` is not exported by this route."

**Claim:** affineness of `C^{X,*}` for every `X` needs `p` split in `F₀`.

**Witness:** csnc Theorem 3.3.2 (csnc line 1975, p. 45) gives it for every `X` with `p` only unramified in `F`; Scope and ownership (line 7) does not record the narrowing.

**Repair:** extend 2.10–2.11 to a unit multiplier (absorbed by the `ℤ_p^×` scalar of the Igusa structures of 1.1) and state 2.16 at every unramified `p`; or add to Scope and ownership: "2.16 proves affineness of `C^{X,*}` for arbitrary `X` only when `p` splits in `F₀`; for nonsplit unramified `p` only the fundamental representative is treated."

## R06 (P3) — 7.9(1) for `D = F` restates a supplier's theorem (carried from the previous R06)

**Location:** README lines 2424–2430 (7.9): "every irreducible smooth `𝔽̄_ℓ`-representation of `G` has a supercuspidal support … unique up to `G`-conjugacy"; "*Needs:* SmoothRepresentationsOfLocalGroups SR.0 … and SR.2".

**Claim:** 7.9 owns statement (1) for every `GL_m(D)`, `D = F` included.

**Witness:** SmoothRepresentationsOfLocalGroups on main, README line 4257: exact supercuspidal supports of `k`-representations of `GL_n(F)` with normalized induction are owned there; 7.9 neither cites it nor restricts (1) to `D ≠ F`.

**Repair:** in 7.9 add "For `D = F` statement (1) is SmoothRepresentationsOfLocalGroups' exact supercuspidal support for `GL_n(F)` and is not proved again; owned here is its extension to `GL_m(D)`", and add that section to the Needs line.

## R07 (P3) — HKW page range for §§5.3–5.4 (carried from the previous R04)

**Location:** README line 2459 (7.9b): "local-term calculations in §§5.3–5.4, pp.49–53".

**Claim:** §§5.3–5.4 occupy pp. 49–53.

**Witness:** hkw21 (author copy): §5.3 begins at line 2104 (page 49), §5.4 at line 2212 (page 51), §5.5 at line 2252 (page 52), §5.6 at line 2268 (page 53; footers 52, 53 at lines 2262, 2309).

**Repair:** "§§5.3–5.4, pp.49–52". (The range 49–53 was this review series' own suggestion; the start page is now right.)

## Previous findings

- R01 — repaired: "Take `s` divisible by twice the length of every cycle … so that each cycle is traversed an even number of times, which removes the signs."
- R02 — not repaired: 3.0g "*Needs:* 0.27, 3.6, 3.0a–3.0c, 3.0e"; 3.6 "*Needs:* Layer 0; Layer 3". R03 above.
- R03 — not repaired: "### Family quotients by sub-`p`-divisible groups" is still under Exact supplier contracts with no `k.n` id. R04 above.
- R04 — partly repaired: "Theorem 4.3.1, p.1025" is right (sch15 lines 3056, 3065); "§§5.3–5.4, pp.49–53" starts right and ends one page late. R07 above.
- R05 — not repaired: "For arbitrary `X` in the same class, assume `p` splits in `F₀`"; Scope and ownership is silent. R05 above.
- R06 — partly repaired: 3.0b now cites RelativeFarguesFontaine §6.15; 7.9 is unchanged (R06 above); the Downstream consumers sentence names sections absent at the BunGAndNewtonStrata head (R01 above).

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.18a, sign-free power (changed) | `F = [[0,−p],[1,0]]σ`, one cycle `c = 2`, sign product `ε = −1`; cycles of lengths 2 and 3 | `F² = −pσ²`; `s = 4 = 2c`: `F⁴ = p²σ⁴`. Lengths 2, 3: `s = 12`, traversals 6 and 4, `ε⁶ = ε⁴ = 1`; the old rule allows `s = 6`, 3 traversals, `ε³ = −1` | agrees; old wording excluded |
| 3.0b, citation of RelativeFarguesFontaine §6.15 (changed) | `T = ℤ_p`, `Ξ = ξ⁻¹B⁺_dR`; `W = 0`; `W = T ⊗ C(−1)` | §6.15 rank one: `Ξ = ξ^k B⁺_dR ↦ O(−k)`, so `k = −1` gives `O(1)`; `W = 0` gives `V = T ⊗ O_X`, `W` full gives `T ⊗ O_X(1)`; range `T ⊗ B⁺_dR ⊂ Ξ ⊂ ξ⁻¹(T ⊗ B⁺_dR)` at #1209 line 2507 | agrees |
| 6.6b locator (changed) | sch15 Theorem 4.3.1 | line 3065, under running head 1025 (line 3056); page 1024 head at line 3018 | agrees |
| 7.9b locator (changed) | hkw21 §§5.3, 5.4, 5.5 | pages 49, 51, 52 | start agrees; end R07 |
| Downstream consumers (changed) | BunGAndNewtonStrata 1.29, 3.17 at #1241 | 1.29 = ordinary integral conjugacy; 3.17 absent (3.12 → 3.18) | R01 |
| 3.0g ↔ 3.6 | Needs lines 1424, 1564 with line 117's convention | 3.6 ∋ "Layer 3" ⊇ 3.0g; 3.0g ∋ 3.6 | cycle, R03 |

Rows for untouched statements stand as in the previous review, of `710c2e5`.

- Gate at `5447ef6`: every check 0, OK (rerun; the worker's run includes build=0). `lake env lean` on `Suggested.lean`: exit 0, no output. No file changed outside the folder.
- Dependency check: `depcheck: 246 roadmaps, 2269 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Source locators checked against the text: 2 (sch15, hkw21). Cross-roadmap citations resolved: RelativeFarguesFontaine §§6.6, 6.7, 6.15 at #1209 (lines 2215, 2267, 2479); BunGAndNewtonStrata 1.29, 3.17 at #1241; HeckeStacksAndLocalShtukas' citation of 0.11 and 0.27 at #1252 (lines 25, 228).
- Seeded sample: of its fifteen targets only 7.9b lies in a changed passage (row above).
- Title and summary block otherwise agree with the head: new roadmap (2690 added lines, nothing removed), two routes with `F⁺ ≠ ℚ` on the trace-formula route (README lines 38, 2278), consumers as in Downstream consumers.
- Remark (untouched text): README line 2097 cites "IntegralHeckeAndGaloisDeterminants Layer 3"; that roadmap at #1689 has Layers 3a and 3b.
- Overlap check: read HeckeStacksAndLocalShtukas, BunGAndNewtonStrata, SmoothRepresentationsOfLocalGroups; shared: exact supercuspidal support for `GL_n(F)`, owner SmoothRepresentationsOfLocalGroups (R06); the local PEL data 0.11 and Rapoport–Zink spaces 0.27, owner this roadmap, cited by HeckeStacksAndLocalShtukas.
- Source independence: changed passages only; 6 passages compared with 2 sources (sch15, hkw21), none shared; the diff adds, removes or reorders no layer, so the arrangement was not compared again.

## Not verifiable

- The items of the previous review (ls18a published and erratum, oz02 Documenta pagination, lil22 published pagination, rsz20 display numbers) are untouched by this change and were not reopened.
- The description's merge-order block is cut in the quoted copy; what follows the cut was not checked.

## Source issues

- none

## For the human reviewers

- none
