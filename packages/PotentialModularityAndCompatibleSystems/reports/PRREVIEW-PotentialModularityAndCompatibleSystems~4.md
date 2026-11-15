# Review of PotentialModularityAndCompatibleSystems (pull request #1075 at 5a6a670)

**Verdict:** needs changes

Incremental re-review of the 8 lines changed since `d54b60d`, and of the pull request's title and description against this head.

## R01 (P3) — The reductions of §§2.3–2.7 over an arithmetic base are still planned here and in the supplier

**Location:** `TauCetiRoadmap/PotentialModularityAndCompatibleSystems/README.md` line 546: "the theorem over a geometric base is proved here from the reductions of §§2.2–2.7, which are stated for both kinds of base because their proofs do not depend on the kind".

**Claim:** Second half of the previous R04. §2.8's *Needs:* (line 722) now restricts §§2.4, 2.6, 2.7 to a geometric base, but the Layer 2 introduction still plans their arithmetic-base instances, which nothing here consumes and the supplier owns.

**Witness:** ClassicalSerreModularity README line 402 (at its open head): the *Needs:* of `I.0/moret-bailly-split-points` says the relative Picard and idèle-class compactness inside the integral-point theorem "are part of this target". Lines 605, 647, 676, 712, 722 here: §2.8 is the only consumer.

**Repair:** replace the clause by: "the theorem over a geometric base is proved here from the reductions of §§2.2–2.7; their statements cover both kinds of base, and over an arithmetic base they are steps of the supplier's target and are not proved again here".

## R02 (P3) — The description's sentence on the Lean file describes an earlier head

**Location:** pull request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti, every target is in the README."

**Claim:** At this head `Suggested.lean` has no definition and one theorem; the Moret-Bailly, split-field-density and complete-intersection headlines are consumed from suppliers and named in the module docstring, which the description does not say.

**Witness:** `Suggested.lean` lines 48–61: the only declaration is `additiveStrongApproximationAwayFromPlace`; docstring lines 14–19 name ClassicalSerreModularity I.0 and DeformationAndDerivedPatchingAlgebra §3.5 as the owners of the unstated headlines.

**Repair:** "`Suggested.lean` states the one headline the pins can express, additive strong approximation away from one place (§2.5a); its docstring names the headlines consumed from ClassicalSerreModularity I.0 and DeformationAndDerivedPatchingAlgebra §3.5 and those not statable at the pins. Every target is in the README."

## R03 (P3) — "red-team passes to follow" is contradicted by the branch

**Location:** pull request description: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with author-side red-team passes to follow."

**Claim:** The head already contains the red-team repairs and four rounds of review repairs.

**Witness:** `git log` at `5a6a670`: `56bdc758` "red-team repairs (state contragredient milestone …)", then `29f60252`, `56ec9b71`, `d54b60dd`, `5a6a6707` ("review repairs").

**Repair:** "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package; red-team and review repairs are applied on this branch."

## Previous findings

- R01 — repaired: line 1016 reads "*Needs:* HilbertModularVarietiesAndShimuraCurves H2.2–H2.2b; the joint paired moduli of this section; …"; the bold item "Joint paired moduli" is at line 992 of §3.5.
- R02 — repaired: line 89 states "In Layer 1 construct the KW carrier of §1.2 before its comparison in §1.1, and construct the character families of §1.9 before the rank-one comparison in §1.3", the second repair offered.
- R03 — repaired: line 1350 reads "For G trivial, under the standing hypothesis that K is linearly disjoint from `E′F_avoid` over E, `L′ = K′`, and the disjointness … is equivalent …".
- R04 — partly repaired: line 722 reads "§§2.4, 2.6, 2.7 over a geometric base (…)"; line 546 still reads "stated for both kinds of base because their proofs do not depend on the kind" (R01 above).
- R05 — repaired: line 1153 reads "`χ_(v,2)χ_(v,1)⁻¹|I_v=ε̄_l^n`", no asterisks inside the code span.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §6.2 trivial-`G` Check (changed) | `E = ℚ`, `E′ = ℚ(√2)`, `F_avoid = ℚ(√3)`, `K = ℚ(√5)`; `K = E′ = ℚ(√2)`, `F_avoid = ℚ` | `K ⊗ E′F_avoid = ℚ(√2,√3,√5)`, degree 8, a field; `K′ ⊗_(E′) E′F_avoid` the same field. Second: `K ⊗ E′ ≅ ℚ(√2)²`, hypothesis fails | true under the added hypothesis; the former counterexample is excluded | none |
| §2.8 *Needs:* (changed) | consumers of §§2.4, 2.6, 2.7 | *Needs:* lines 605, 647, 676, 712 cite only own earlier sections; 722 is the single consumer of 2.4, 2.6, 2.7 | restriction to a geometric base loses no edge | R01 for line 546 |
| §3.5 *Needs:* (changed) | self-edge scan | line 1016 cites no `§3.5`; "Joint paired moduli" precedes "Good-reduction neighborhoods" in the section | no cycle | none |
| §2.5a Lean headline (cited by §2.6, line 676) | `K = ℚ`, `w = ∞`, `S = T = ∅`; `w = 2`, `T = {∞}`, `V = (1/4, 3/4)` | `x = 0`; `x = 1/2 ∈ ℤ[1/2]`, integral at every odd prime | true as stated | none |

The rows for the untouched statements stand as in the previous review, of `d54b60d`.

- Gate, re-run at `5a6a670`: every counter 0, `OK` (the worker's run adds `build=0`). Dependency check: `depcheck: 246 roadmaps, 2273 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Elaboration: `lake env lean` on a scratch copy with `#check @additiveStrongApproximationAwayFromPlace`: `sorry` the only warning; the elaborated type keeps `[Field K] [NumberField K]`, `w`, `S`, `T`, `hS`, `hT`, `harch`, `U`, `V`, `hU`, `hV`, as README §2.5a states. `simp` in place of `sorry` leaves the goal unsolved: no padding. `signatures.md`'s declaration "over" is the docstring's word "theorem over" (line 15), not a declaration.
- Library at the pin: `TauCeti/NumberTheory/NumberField/Global/Places/Basic.lean` line 70, `abbrev Place := HeightOneSpectrum (𝓞 K) ⊕ InfinitePlace K`.
- Seeded sample: none of its fifteen targets (1.8, 1.9, 1.11, 1.13, 1.19, 2.10, 2.16, 2.17, 2.20, 4.6, 4.9, 8.2, 9.1, 10.2, 12.1) lies in a changed passage (§§2.8, 3.5, 4.7, 6.2); no source locator changed.
- Cross-roadmap citations resolved this round: ClassicalSerreModularity `I.0/moret-bailly-split-points` (README lines 78, 402 at its open head), cited by the changed line 722; `overlaps.md` reports no dropped id and no other pull request changing this folder.
- Description checked against the head, sentence by sentence: the summary block's layer contents (headings of Layers 1, 2, 5, 8, 9, 12, 13), "proved here over global function fields" (README line 3), rank zero (line 250), `TauCeti.repRing`, `IntermediateField.LinearDisjoint`, `Complex.Gammaℝ` (lines 54, 60, 65), the six consumers (line 1963) and the validation counters (the gate) agree with it; R02 and R03 are the two sentences that do not.
- Overlap check: read ClassicalSerreModularity, GL2ModularityLifting, PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensions, PotentialAutomorphyInfrastructure; shared object: the integral-point theorem over a number-field base and its reductions, owner ClassicalSerreModularity I.0 (R01); the geometric base, §2.15, §§8.3–8.6 and Layer 1 are owned here and the others cite them.
- Source independence: 4 passages compared (changed passages only: two *Needs:* lines, one Check clause, one code span) with 1 source (`bcgp-published`, Proposition 9.1.12, for the §6.2 clause), none shared; largest share and contents not recomputed (the diff adds, removes and reorders no layer).

## Not verifiable

- Nothing new this round; the items of the review of `d54b60d` (Thorne 2017 §7; the published page of BHKT Proposition 9.2; Larsen 1995, Sen 1973, Skinner–Wiles Duke 107, Savitt's corrigendum) are in untouched text and were not reopened.

## Source issues

- none

## For the human reviewers

- none
