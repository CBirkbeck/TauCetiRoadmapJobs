# Review of HomotopyTheoryOfCategories (pull request #1521 at a61ddd4)

**Verdict:** accepted

Incremental re-review of 54 changed lines since `2562b5f`, all in `TauCetiRoadmap/HomotopyTheoryOfCategories/README.md`. No finding.

## Previous findings

- R01 — repaired: no occurrence of HigherToposTheory, F1.8, L5.4 or `≺₀` remains in the README, `Suggested.lean` or the description; 7.2 reads "*Needs:* 7.1; Mathlib `HomotopicalAlgebra.ReedyStructure`, `WellFounded.rank`."
- R02 — repaired: Downstream consumers opens "StableHomotopyKTheory records this roadmap as the owner of Theorem A for an arbitrary basic localizer (2.3–2.4) …"; the sentence about main is gone.

## Verified sound

| Statement | Instance | Computed on each side | Result |
| --- | --- | --- | --- |
| 7.2, new route, Reedy ⇒ direct (`IsDirect.of_reedyStructure`) | Mathlib `lt₂` with `W₂ = ⊤`; `ℤ`; `SingleObj (ℤ/2)` | `lt₂`: non-identity `X ⟶ Y` gives `deg X < deg Y`, so a descending `DirectRel` chain descends in well-ordered `α`. `ℤ`, `ℤ/2`: no degree, not direct. | holds; negatives agree |
| 7.2, direct ⇒ Reedy with `α = Ordinal.{u}` | `[1]`; `ω + 1` | `[1]`: rank 0, 1; `lt₁` vacuous on identities; factorization data forced to `(X, 𝟙, f)`. `ω + 1`: `rank ω = sup(n + 1) = ω`. | holds |
| 7.2, "with some `α`" sentence | `[1]`, `α = ℕ`, degree `0 ↦ 5`, `1 ↦ 7` | `5 < 7` on the one non-identity map; `lift (rank) = 0, 1 ≤ typein = 5, 7`. | consistent with the minimality clause and the first Check |
| 7.3 against the rewritten 7.2 | `ω + 1`; `ℕ ×ₗ ℕ` | `rank ω = ω`, `rank (1, 0) = ω`: not `< ω`, and an `ℕ`-degree would need `deg > every n`. | both sides false; agree |
| Layer 7 Dependencies and "How to read the build" | *Needs:* lines of 7.1–7.5 | 7.1: Mathlib. 7.2: 7.1. 7.3: 7.2. 7.4: 7.1, 7.2. 7.5: 7.1. No roadmap supplier in the layer. | "Mathlib. … 7.2–7.5 use 7.1, and 7.3 and 7.4 use 7.2" is exact |
| 10.1 locators (seeded sample; Example 1.11 → 1.2) | `groth2013` | Def. 1.1 at line 188; Ex. 1.2 at line 216 is the represented prederivator; Def. 1.15 at line 725; Thm. 1.31 at line 1344. | all four support the text |
| 2.4 and Scope comparison with StableHomotopyKTheory §2.31 | main | §2.31 resolves on main; its line 21 names this roadmap owner of the localizer form. | resolves; one-directional |
| Downstream consumers, new sentence | PosetHomotopyAndSubgroupComplexes (#2296 head) lines 70–72, 213, 624 | It cites 2.1 (`IsBasicLocalizer`, `IsAsphericalFunctor`, `Winfty`) and 2.4 (`mem_of_isAsphericalFunctor`); the README says 2.1 and 2.4. | agree |
| Description: the supplier list | README table lines 56–62 | Four roadmaps on each side (GeneralizedCohomology, StableHomotopyKTheory, SchemeAndStackFoundations, GrothendieckInfinityGroupoids), same sections. | true |
| Description: "changes nothing outside it"; "fourteen layers"; build claim | three-dot diff; headings; `lake env lean` | Outside the folder: empty. Layers 0–13: 14. 52 `sorry` warnings, 0 other. | true |

The rows of the previous reviews for statements that did not change stand as in the review of `2562b5f`.

- **Gate.** The worker's gate at `a61ddd4` is 0 on every check with `build=0`, OK. My re-run (`--base origin/main`) is 0 on every text scanner; its only non-zero check is `depcheck: NOT IN ORDER: HomotopyTheoryOfCategories` against the public merge order, which is not a finding.
- **Dependency check** against the candidate order: `depcheck: 245 roadmaps, 2230 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean`: exit 0, 52 "declaration uses `sorry`" warnings, nothing else. `Suggested.lean` and the pins are unchanged since `2562b5f`, so the signature comparison and the one-tactic probe stand.
- **Source locators checked against the text:** 4 (`groth2013` lines 188, 216, 725, 1344).
- **Pinned declarations opened:** 1, `HomotopicalAlgebra.ReedyStructure` at `Mathlib/AlgebraicTopology/Reedy/Basic.lean` line 45 (fields `deg`, `lt₁`, `lt₂`, `nonempty_unique`; `α` a well-ordered `LinearOrder` with `OrderBot`, `SuccOrder`).
- **Cross-roadmap citations resolved:** StableHomotopyKTheory §2.31 (main) and the consumer citations of PosetHomotopyAndSubgroupComplexes, GrothendieckInfinityGroupoids (#1060, lines 172, 595) and StableHomotopyKTheory (main lines 21, 2844). The resolver lists no cross-roadmap citation as found nowhere.
- **Description against the head:** the HigherToposTheory bullet is gone and the remaining claims match; no change of this head is left unstated.

Remark on untouched text (no change requested): in 7.2 the clause "a direct category has no non-identity endomorphism (7.1)" is true but not needed for Mathlib's `ReedyStructure`, whose fields ask only for the degree inequalities and unique factorization.

Overlap check: read GrothendieckInfinityGroupoids (#1060), ModelCategories, KanQuillen, EnrichedLocalization and SimplicialCategories (#2269), and StableHomotopyKTheory and BordismFormalGroups (main), as in the previous review; the change touches no shared object. `Globe`: GrothendieckInfinityGroupoids 0.1. Theorem A for realised nerves: StableHomotopyKTheory §2.31. The general Reedy characterization: ModelCategories 7.4.1; 7.2 here states only the direct case on `IsDirect`. No object is owned twice.

Source independence: changed passages only; 2 passages (the rewritten 7.2 route, the 10.1 sentence) compared with 1 source (`groth2013`), none shared: the 7.2 route cites no source and the 10.1 change is a locator. No layer was added, removed or reordered, so the arrangement stands as compared in the full review.

## Not verifiable

- Brown–Heath–Kamps 1983, Brown–Spencer 1976 and Joyal–Street 1993: `uncertified` in the manifest and cited by locator alone. No changed text cites them.
- Hirschhorn 2003 (8.3): verified only through secondary sources, as in the earlier reports. No changed text cites it.

## Source issues

- none

## For the human reviewers

- Licence: `bhk1983`, `brownspencer1976` and `joyalstreet1993` are recorded as `uncertified` in the manifest (paywalled). The README cites them by locator only, and no text was compared with them.
