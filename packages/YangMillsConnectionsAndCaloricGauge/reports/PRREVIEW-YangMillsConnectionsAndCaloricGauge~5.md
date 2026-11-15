# Review of YangMillsConnectionsAndCaloricGauge (pull request #2164 at 00950d4)

**Verdict:** needs changes

## R01 (P3) — the §9.4 group paragraph names a consumer its `*Needs:*` line does not

**Location:** `TauCetiRoadmap/YangMillsConnectionsAndCaloricGauge/README.md` line 2138: "The caloric gauge (10.2) consumes 9.4, 9.5 and 9.7; 10.3 uses 9.4–9.5, and 10.4–10.5 use 9.5."

**Claim:** 10.4 does not consume 9.5: its route takes `C¹` regularity from 10.2 and its *Needs:* line has no Layer 9 item, so the paragraph and the *Needs:* line disagree.

**Witness:** README line 2493, 10.4: "*Needs:* … PDE §3.2 (weak maximum principle); 8.1 (homogeneous product bounds), 8.2, 10.2, 10.3." README line 2526, 10.5: "… 9.1, 9.5, 10.2–10.4." Only 10.5 lists 9.5.

**Repair:** Replace the sentence with: "The caloric gauge (10.2) consumes 9.4, 9.5 and 9.7; 10.3 uses 9.4–9.5, and 10.5 uses 9.5." (10.4 reaches 9.5 only through 10.2 and 10.3, as its *Needs:* line says.)

## R02 (P3) — the description says the roadmap follows a source

**Location:** pull request description, block `<!-- roadmap-summary -->`, "Approach and generality": "The route follows Oh and Tataru from critical Sobolev approximation and local Coulomb gauges through gauges at infinity to heat flow and the caloric manifold."

**Claim:** The head does not organise itself after a source: its sections are grouped by what the targets consume and its build paragraph derives the order from dependencies; a roadmap does not say it follows a source.

**Witness:** README lines 485–488: "Layer 1 depends only on suppliers; … Layers 2–7 form a chain …"; lines 779–781, 955–957, 1198–1200 (the new group paragraphs) name each group by its consumers. No README sentence says it follows a source.

**Repair:** Replace the sentence with: "The build runs from critical Sobolev approximation and local Coulomb gauges through gauges at infinity to heat flow and the caloric manifold, each layer being what the later ones consume; the main results are those of four papers of Oh and Tataru, cited by locator."

## Previous findings

- none: the review of `8e1ec25` accepted with no finding of its own, and its earlier R01 (the closed-subgroup citation, README lines 349–354 and 527–528) is untouched by this change.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Group paragraph §9.4 (line 2138) against the *Needs:* lines | 10.2, 10.3, 10.4, 10.5 | 10.2: 9.4, 9.5, 9.7 listed; 10.3: 9.4, 9.5 listed; 10.4: no Layer 9 item; 10.5: 9.1, 9.5 | 10.4 fails | R01 |
| Group paragraphs §2.2, §3.3, §5.1, §5.4, §8.3, §9.1, §10.1, §10.3 against the *Needs:* lines | all 36 consumer claims | each named consumer lists the named item (e.g. 4.4: 3.3, 3.4; 5.2: 3.3, 3.4; 6.1: 5.1; 6.3: 5.5; 9.3: 8.1–8.4; 10.5: 9.1) | 36 of 36 agree | none |
| Heading §5.4, "`Top(4, G) ≅ π₃(G)`" with "for connected `G` (5.6)" | `SU(2)`; `U(1)`; disconnected `(SU(2) × SU(2)) ⋊ ℤ/2` (swap) | `SU(2)`: `ℤ = ℤ`; `U(1)`: one class, `π₃ = 0`; swap group: `π₃ = ℤ²` but classes `(1,0) ~ (0,1)` in `Top`, map not injective | correct; connectedness needed and stated | none |
| Heading §8.2, "inverse … on `Ḣ^{σ−2}` and `ℓ¹L²`" (also the changed docstring line of `Suggested.lean`) | `A = 0`, `F = e^{2πiξ·x}X`; blocks `‖P_k F‖ = k⁻²`, `k ≤ −1` | `Δ(−F/(4π²|ξ|²)) = F`; `ℓ¹L²` norm `π²/6`, `Ḣ^{σ−2}` norm² `Σ 2^{2k(2−σ)}k⁻⁴ = ∞` for `σ < 2` | two distinct domains, as titled | none |
| Heading §8.3 and bold 8.4 against their statements | ranges | 8.3: `−2 < σ < 2`, `ℓ²L¹` for `−1 < σ < 1`, decay on `[0,∞)`; 8.4: `−2 < σ < 4/p`, `‖P_k A(s)‖ ≲ c_k(1 + 2^{2k}s)^{−N}` | titles describe the statements | none |

The rows for the untouched statements stand as in the previous review, of `8e1ec25`.

- **Source locators re-read (sample targets whose headings changed):** OhTataru-YMHF lines 963 and 1111 (Theorems 4.1–4.2, §8.2), 1187, 1220, 1288 (Theorems 4.3, 4.5, 4.6, §8.3), 1353, 1514 (Theorems 4.7–4.8, 8.4): all inside the README's line ranges. The diff changes no locator.
- **Numbering.** All 52 ids 1.1–10.5 remain, 16 of them as bold paragraph labels, so the numbers cited in *Needs:* lines and in the docstring's layer list still name a labelled passage (gate `layer-ids=0`, `target-ids=0`). No other roadmap cites an id of this folder (overlaps: none).
- **Elaboration.** `lake env lean` on `Suggested.lean`: exit 0, two `sorry` warnings (lines 139, 152). The one changed line is docstring prose; the five signatures are unchanged.
- **Gate.** Re-run at `00950d4`: every check 0, `OK`. Dependency check: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. No file changed outside the folder.
- **Pull request text.** Checked against the head: the eight suppliers and LocalVariationalFieldTheory, HamiltonianReduction (under SymplecticGeometry) and SeibergWittenTheory are on main; FourManifolds (line 137) and InstantonFloerTheory (line 301) are open and after this roadmap (line 14) in the merge order; the six gaps, three definitions and two theorems are as described. One sentence fails (R02).
- **Overlap check:** scope and ownership text is unchanged since `8e1ec25` and the closest roadmaps (IncompressibleFlows, InstantonFloerTheory, PDE, FourManifolds, SobolevMapsBetweenManifolds, PseudodifferentialOperators) were not re-read; the overlap tool reports no shared roadmap, dropped id or second copy.
- **Source independence:** changed passages only: 10 new group paragraphs and 12 new headings compared with 2 sources (OhTataru-YMHF, OhTataru-TopClass contents and text search), none shared; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- Nothing new. The `uncertified` sources are untouched by this change.
- The description's account of earlier review rounds ("2 independent review rounds and 2 red-team rounds") was not checked.

## Source issues

- none

## For the human reviewers

- none
