# Review of HilbertModularVarietiesAndShimuraCurvesPartII (pull request #1745 at 5fc1730)

**Verdict:** needs changes

Incremental re-review of the 62 lines changed since b5ace90, and of the pull request's title and description against this head.

## R01 (P2) — gap:tame-types asks its supplier for an object the supplier imports and does not own

**Location:** `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurvesPartII/README.md` line 70: “supply the tame inertial correspondence τ↦σ(τ) with its Diamond-box constituents”. Unchanged since b5ace90 (previous R01, then P3).

**Claim:** the gap asks LocalGaloisDeformationRingsPartII only for what no earlier roadmap provides. It is raised to P2 because the supplier's head is now open and disclaims the object.

**Witness:** LocalGaloisDeformationRingsPartII at its open head, README line 15, lists Henniart's σ(τ) and σ̄(τ) under “imported and are not targets here” (PadicLocalLanglandsForGL2Qp §4.4); its §0.5 “Weights of a tame type” (line 154) already proves the constituents.

**Repair:** replace the contract sentence of line 70 by: “What LocalGaloisDeformationRingsPartII must provide (gap:tame-types): For K/ℚ_p unramified and sufficiently large E, with τ↦σ(τ) and its reduction constituents as consumed from T.0 “Tame inertial types” and “Weights of a tame type”: every irreducible smooth E-representation of GL₂(O_K) inflated from GL₂(k) and not a Steinberg twist is σ(τ) for a tame inertial type τ after scalar extension; supply the irreducible-cosocle lattices σ_J°(τ) and their capped-interval subquotients (EGS15 §5.1 and Definition 10.1.4, pp. 25–27, 60).” The slug is unchanged. In line 9 change “The characteristic-zero correspondence and lattices” to “The image statement for the characteristic-zero correspondence, its lattices”.

## R02 (P3) — items still listed twice in *Needs* and Dependencies lines

**Location:** `README.md` line 460 (“DeformationAndDerivedPatchingAlgebra §3.1, 6.1; DeformationAndDerivedPatchingAlgebra §3.1”), the same pair in lines 559 and 807; lines 1115 and 1144 (“GlobalGaloisDeformations §3.3–3.4; GlobalGaloisDeformations §3.4”).

**Claim:** the repair removed every item repeated verbatim or after a range that contains it (previous R02). Line 559 was edited by the repair and still carries one.

**Witness:** §3.1 is inside “§3.1, 6.1”, and §3.4 inside “§3.3–3.4”: five lines, two repeated items.

**Repair:** delete the second item in each of the five lines (“DeformationAndDerivedPatchingAlgebra §3.1” in 460, 559, 807; “GlobalGaloisDeformations §3.4” in 1115, 1144).

## R03 (P3) — the description says the Lean file states definitions and theorems; it states none

**Location:** pull request description: “the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti”, and “the targeted Lake build succeeds with `sorry` as the only warning”.

**Claim:** the description tells a reader what `Suggested.lean` tests.

**Witness:** `Suggested.lean` at this head has an empty namespace (0 declarations; elaboration prints no warning); its docstring and README line 138 say “Suggested.lean states no theorem: no end theorem is statable at the pins”.

**Repair:** replace the two clauses by: “`Suggested.lean` states no declaration: none of the headline theorems (README §§5.1–5.5, 5.7) is statable at the pins, and its module docstring names the carrier each one lacks; every target is in the README.” and “the targeted Lake build succeeds with no warning”.

## Previous findings

- R01 — not repaired: line 70 still reads “supply the tame inertial correspondence τ↦σ(τ) with its Diamond-box constituents: every irreducible smooth E-representation … supply the irreducible-cosocle lattices σ_J°(τ)”. Written again as R01.
- R02 — partly repaired: the repeats in lines 327, 358, 495, 547, 559 (§8.4, §5.6) and 1068 are gone; “DeformationAndDerivedPatchingAlgebra §3.1, 6.1; … §3.1” remains in 460, 559, 807 and “§3.3–3.4; … §3.4” in 1115, 1144. Written again as R02.

## Verified sound

| Statement | Instances | Values | Result |
|---|---|---|---|
| New §3.1 paragraph: “§3.4, §§4.3–4.5, §4.8, §4.9 and §5.2 consume it” | every *Needs* line citing §3.1, §3.2 or §3.3 from outside the group | §3.4 (3.2, 3.3); §4.3 (3.2); §4.4 (3.2); §4.5 (3.3); §4.8 (3.3); §4.9 (3.2); §5.2 (3.2) | 7 consumers on each side; equal |
| New §4.2 paragraph: “§4.7 and §4.8 consume it” | *Needs* lines citing §§4.2–4.5 from outside the group | §4.7 (4.2); §4.8 (4.4, 4.5); §4.9 cites only 4.8 | equal |
| New §4.6 paragraph: “§4.8 consumes it” | *Needs* lines citing §4.6 or §4.7 from outside the group | §4.8 (4.7) only | equal |
| §5.1, new heading “dimension f” | f=1, 2, 3; \|S\|=2, q=1, f=1 | 2f ≥ 3f − dim π gives dim π ≥ 1, 2, 3; upper bound f; dim R∞ − dim S∞ = 11 − 9 = 2 = 2f | equality forced; heading agrees with the statement |
| gap:tame-types, “Diamond-box constituents” (R01) | supplier §0.5 with f=1, p=29; f=2 | \|Σ\| = 2^f = 2, 4 constituents; f=1 cuspidal type: 13+15 = 28 = q−1 | the supplier's set is the one the gap asks for again |
| R02 lines | 9 lines named by the previous R02; all *Needs* and Dependencies lines | 6 true repeats removed; lines 591, 665, 682, 698, 1052 pair NoncommutativeAndEquivariantIwasawa §F.1 with CompletedCohomologyPartII §F.1 (distinct); 5 lines keep a repeat | partly repaired |
| R03 | declarations in `Suggested.lean` | 0 `theorem`, 0 `def`; warnings 0 | description clause does not describe the head |

The rows for untouched statements stand as in the previous review, of b5ace90.

- Gate at 5fc1730: every check 0, `OK` (rerun; the worker's run also has `build=0`). Outside-folder diff against `origin/main`: empty.
- Dependency check: `depcheck: 237 roadmaps, 2250 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output; no declaration, so there is no signature to compare and no padding to probe.
- Source locators checked against the text in the re-headed or regrouped sections, 9 of 9 confirmed: BHHMS23 lines 4591 (Lemma 8.2.2, p. 91), 4987 (Lemma 8.3.6, p. 99), 5070 (Theorem 8.3.9), 5145 (Corollary 8.3.10, p. 103), 5172 (Theorem 8.4.1, p. 104), 5246 (Theorem 8.4.2, p. 105), 5292 (Corollary 8.4.4, p. 106), 5311 (Corollary 8.4.6), 5447 (Corollary 8.5.1, p. 109); Theorems 1.1–1.3 at lines 118, 148, 173. Each section whose heading lost its “(BHHMS23 Theorem …)” suffix keeps that locator in its body (§§4.8, 4.9, 5.1, 5.2, 5.4, 5.5, 5.7).
- Seeded sample in the changed passages (3.1, 4.6, 4.9, 5.1, 5.2, 5.4, 5.5): headings and locators as above; the regrouped §§3.2, 3.3, 4.3–4.5, 4.7 keep their numbers, statements, Checks and *Needs* lines as run-in paragraphs, and every internal “§3.2”, “§4.5”, “§4.7” reference still resolves.
- Description against the head, other than R03: field unramified at p, r̄ semisimple generic at v (README lines 25, 144, 161); grade comparison over R∞⟦K₁/Z₁⟧ (line 1012); odd [F:ℚ] and the unused even-degree §§R18.3.9, R18.3.14 (line 60); complete DVR finite over ℤ_p in Layer 2 (line 25); `TauCeti.completedGroupAlgebra` at the pin (`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145`); consumers as in “Downstream consumers”; 4 package review rounds and 2 red-team rounds match the board's reports. It presents the pull request as adding the roadmap folder, which the base confirms.
- Remark (untouched text, no change asked): LocalGaloisDeformationRingsPartII's open head numbers its sections §0.1, §0.5, §4.3, §6.1–6.3, §7.1–7.5 and carries no slug `single-presentation`, `weight-shape-bijection` or `p-membership`; the T.4, T.6, T.7 slugs cited here are its design's labels. ModpRepresentationsOfGL2OverLocalFields (MP labels) and PotentialAutomorphyInfrastructurePartII (PL.5) resolve at their heads.
- Overlap check: read ModpRepresentationsOfGL2OverLocalFields, LocalGaloisDeformationRingsPartII, CompletedCohomologyAndLocalGlobalCompatibilityPartII; the lattices R and L_j are owned by ModpRepresentationsOfGL2OverLocalFields §8.4 and cited here; σ(τ) is owned by PadicLocalLanglandsForGL2Qp §4.4 (R01); nothing else shared.
- Source independence: changed passages only; 8 passages (three new section paragraphs, five new headings) compared with 1 source (BHHMS23 §§8.2–8.4 at the lines above), none shared; largest share BHHMS23, 173 of 437 locators; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- CompletedCohomologyAndLocalGlobalCompatibility and GL2ModularityLifting (closest-roadmap lists): their checkouts were not found under the listed names, so their scope was not read again this round.
- The items of the previous review's list stand: none of them lies in a changed passage.

## Source issues

- none

## For the human reviewers

- none
