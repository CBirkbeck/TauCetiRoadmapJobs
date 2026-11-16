# Review of GSp4NonregularModularityLifting (pull request #1817 at 11b3de3)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 11b3de3. This round reads the pull request's title and description against the head, and re-resolves ownership against the open heads as they are now.

## R01 (P2) — Secondary Hasse, formal operators, neighbor reciprocity and theta operators have two owners

**Location:** `TauCetiRoadmap/GSp4NonregularModularityLifting/README.md` line 9: "§1.1 owns the normalized genus-two H⁰ p-actions, §3.1 owns Hasse lifts and torsion congruences, §3.2 owns secondary Hasse geometry, and §4.2 owns the corrected theta construction and injectivity."

**Claim:** AlgebraicModularFormsAndSerreWeightsPartII (open, a new roadmap, earlier in the merge order: line 263 against 299) owns the same objects and says this roadmap imports them; this README never cites it. Its ownership sentence dates from 2026-11-06, after the previous review of this head, so this is not a second reading of text that review passed.

**Witness:** Pull request #1822, `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeightsPartII/README.md` line 16: "GSp4NonregularModularityLifting §§3.2, 4.1–4.2, 4.4 and 4.7 import these by section"; its §§3.1, 5.3–5.7, 6.3, 8.2, 8.6–8.7 state this README's §§3.2, 4.1, 4.7, 4.2.

**Repair:** Add `### From TauCetiRoadmap.AlgebraicModularFormsAndSerreWeightsPartII` naming Layers 3–8 (§§3.1–3.8, 4.1–4.3, 5.3–5.7, 6.1–6.3, 7.6, 8.2, 8.6–8.7). Replace the quoted sentence by: "The secondary Hasse section, Hasse lifts, the formal operators U, Z, Z₂, X₂, Q₂, neighbor reciprocity and the theta operators with their injectivity are stated by AlgebraicModularFormsAndSerreWeightsPartII Layers 3–8; §§1.1, 3.1–3.2, 4.1–4.2, 4.4 and 4.7 keep only their specializations to weights (a,2) and the tame levels of §0.4." Cut the general constructions from those sections, cite the supplier in each `*Needs:*` line, and name the supplier in the description's dependency paragraph.

## R02 (P3) — The description says the Lean file states definitions and theorems; it declares nothing

**Location:** Pull request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim:** At this head `Suggested.lean` has no declaration, so there is no definition, no theorem and no `sorry` warning; a reader is told to expect Lean statements that do not exist.

**Witness:** `TauCetiRoadmap/GSp4NonregularModularityLifting/Suggested.lean` line 10: "None of the headline theorems is statable at the pins, so this file declares nothing"; 0 declarations counted; `lake env lean` prints nothing.

**Repair:** Replace by: "`Suggested.lean` declares nothing: no headline theorem is statable against the pinned Mathlib and Tau Ceti, and its docstring names the carrier each one lacks; every target is in the README." and "Validation: the targeted Lake build succeeds with no warning (the file has no declaration and no `sorry`); …".

## R03 (P3) — "Klingen newvector" names no contract of the head

**Location:** Pull request description: "the integral `p`-actions, Klingen newvector and projective Satake statements it needs from its suppliers are stated as named supplier contracts".

**Claim:** The head has no Klingen newvector statement: the Klingen contract is the level comparison with its no-newforms result, and the newvector contract is paramodular.

**Witness:** `README.md` line 155: "the Klingen level-comparison contract): Prove the Klingen no-newforms result"; line 157: "the paramodular newvector contract"; 19 contracts in all, none called Klingen newvector.

**Repair:** Replace by: "the integral `p`-actions, the Klingen level comparison (no newforms), the paramodular newvector and the projective Satake statements it needs from its suppliers are among the 19 named supplier contracts".

## Previous findings

- none: the previous report (of 11b3de3) had no finding; its R01 and R02 of the round before were recorded there as repaired and the passages are unchanged.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §4.2 theta operators against AlgebraicModularFormsAndSerreWeightsPartII §8.2 (R01) | p = 7; (j,k) = (4,2); k = 2, 4 | both: θ₁ (4,2) → (10,10), symmetric degree 4−2−2 = 0 = 10−10; no det(Q) factor; scalar: k(2k−1) = 6 (7 ∤ 6), 28 (7 ∣ 28, excluded) | same object, same normalisation, two owners | R01 |
| §3.2 secondary Hasse against that roadmap's §3.1 (R01) | p = 5 | both: section of (det ω_G)^(p²−1), exponent 24, built from v^(p−1) and Ha(Gᵐ)^(p+1): (p−1)(p+1) = 24 | same object, two owners | R01 |
| §4.7 neighbor reciprocity against that roadmap's §6.3 (R01) | Γ̄ = SL₂(ℤ); general tame level | both: Δ∨ = {pM⁻¹}, symmetric at full level, reverse correspondence kept otherwise; both cite CG20 Lemma 8.20, p. 872 | same statement, two owners | R01 |
| `Suggested.lean` against the description (R02) | whole file | declarations 0; elaboration messages 0; `sorry` warnings 0 | description wrong | R02 |
| Klingen level-comparison contract against the description (R03) | x ≡ 1 mod p, p ≥ 5 | degree 1+x+x²+x³ ≡ 4, a unit; contract asks no-newforms and the pullback/trace constant, not a newvector | description misnames it | R03 |
| §8.5, cited by the description as "4 ≤ a < p−1" | p = 5, 7 | p = 5: no a (only a = 2 remains in the branch); p = 7: a ∈ {4,5}, oddness forces a = 4; weights 0,0,3,3, multiplier ε⁻³ | description agrees with the head | none |

The rows for the untouched statements stand as in the previous review, of `11b3de3`.

- Description sentences checked against the head and found right: adds a new roadmap (not on main; 1735 insertions, three files); coefficients O of any finite E/ℚₚ (Conventions); three endpoints (Layers 8, 9, 10–11); CG branch p ≥ 5; equal-variable criterion for the Pilloni branch (line 87); p = 2 in Layers 10–11 (lines 1369, 1555, 1602); all-degree interpolation (§2.3); symplectic descent in every residue characteristic (line 111); consumer sentence (line 1664).
- Suppliers: the 23 `From TauCetiRoadmap.*` headings all appear in the description's dependency list; the worker's citation check lists no cross-roadmap citation found nowhere.
- Gate: the worker's gate at 11b3de3 passes every check, build included. Dependency check re-run: `depcheck: 235 roadmaps, 2240 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. `lake env lean` on `Suggested.lean`: no output. Outside-folder diff against `origin/main`: empty.
- Seeded sample: the folder is unchanged, so no sampled target falls in a changed passage; none was re-read.
- Declared gaps: 19 contracts in the README, one for each of the 19 declared gaps; unchanged.
- Cross-roadmap text opened this round: AlgebraicModularFormsAndSerreWeightsPartII (scope, §§3.1, 4.1, 6.3, 7.6, 8.2), PadicFamiliesPartII, OrdinaryAutomorphicFormsAndModularityLiftingPartII, AutomorphicBundlesPartII, AbelianSurfacesModularity and IntegralHeckeAndGaloisDeterminants (scope sections).
- Overlap check: read AlgebraicModularFormsAndSerreWeightsPartII, PadicFamiliesPartII, OrdinaryAutomorphicFormsAndModularityLiftingPartII, AutomorphicBundlesPartII, AbelianSurfacesModularity, IntegralHeckeAndGaloisDeterminants; secondary Hasse section, Hasse lifts, formal operators with Q₂, neighbor reciprocity and theta operators are shared with AlgebraicModularFormsAndSerreWeightsPartII, which is their owner (R01); nothing else shared.
- Source independence: changed passages only; 0 passages changed in the folder, so none compared; largest share CG20, 78 of 149 locators; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- The description's "5 independent review rounds and 2 red-team rounds": a statement about the job board, not about the head.

## Source issues

- none

## For the human reviewers

- **Licence.** BCGP25 carries 43 of 149 locators and the Layer 10–11 headlines; `README.md` References cites it as arXiv:2502.20645v1 with no journal reference, so whether it is refereed was not settled here.
