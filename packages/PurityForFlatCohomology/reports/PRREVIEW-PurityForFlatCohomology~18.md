# Review of PurityForFlatCohomology (pull request #1840 at a825987)

**Verdict:** accepted

Incremental re-review of 0 changed lines since a825987: the folder is unchanged; this round reads the pull request's title and description against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "Zariski–Nagata purity and the étale-depth bound for coefficients of invertible order need no perfectoid input; for every commutative finite étale group the bound follows from complete-intersection purity", as §§1.6 and 6.3 say.

## Verified sound

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | Description: étale-depth bound, invertible order (§1.6) against every finite étale `G` (§6.3, `etaleDepth_ge_virtualDimension`) | `R = ℤ_p`, `vdim = 1`, `i = 0`; `G = ℤ/ℓ` (`ℓ ≠ p`), `G = ℤ/p` | `H⁰_𝔪 = ker(G(ℤ_p) → G(ℚ_p)) = 0` for both; `ℤ/ℓ` falls under §1.6, `ℤ/p` only under §6.3 (`*Needs:* §6.2`) | description agrees with README lines 781–783, 1199, 2065 and CS24 lines 1381–1384, 3540–3549 | none |
| 2 | Description: `H^i_𝔪(R, G) = 0` for `i ≤ dim R`, `R` regular and not a field (§6.5) | `R = k` a field, `G = μ_ℓ`; `R = ℤ_p`, `G = μ_p`, `i = 1, 2` | Field: `H⁰_𝔪 = G(k) ≠ 0` over `k̄`, so "not a field" is needed. `ℤ_p`: `H¹_𝔪 = ker(ℤ_p^×/p → ℚ_p^×/p) = 0`; `H²_𝔪 ⊇ ℚ_p^×/(ℤ_p^× ℚ_p^{×p}) = ℤ/p ≠ 0` | description, README §6.5 and CS24 line 3566–3568 agree; bound sharp | none |
| 3 | Description: "The vanishing and Hartogs lemmas hold over any ring" (§§0.4, 0.5) | `A = k[x, y]`, `Z` the origin; `Z = V(x)` | Origin: `H⁰_Z = H¹_Z = 0`, `Γ(𝔸² ∖ 0, 𝒪) = k[x, y]`. `V(x)`: `Γ = k[x^{±1}, y] ≠ k[x, y]` | §§0.4 and 0.5 state "No Noetherian hypothesis"; the sentence matches | none |

The rows of the previous reviews for untouched statements stand as in the previous review, of `a825987`; the diff is empty and changes no statement.

- The title and description against the head: the title (a new roadmap; the folder is not on main, 4059 insertions, 0 deletions); the summary block's three paragraphs; the list of what `Suggested.lean` states (15 theorems named in the description, 15 sorried theorems in the file, the same ones: `zariskiNagata_full_faithful_connected`, `zariskiNagata_isEquivalence`, `etaleDepth_ge_virtualDimension`, `localPicard_torsion_eq_one`, `localPicard_subsingleton`, the two `picard_globalCompleteIntersection_*`, `etaleCohomology_two_gm_torsion_purity`, `etaleCohomology_two_gm_puncturedSpectrum_subsingleton`, `etaleCohomology_gm_purity_regular`, the two torus theorems, `frobeniusSemilinear_exists_fixed_basis`, `free_of_endomorphisms_iso_pi`, `isRegularLocalRing_uniqueFactorizationMonoid`); the folder's three files; the two consumers named (README Downstream consumers); the suppliers named (PrismaticCohomologyPartIII and PartII, README supplier contracts); the validation paragraph. No sentence is contradicted by the head and no removal, renumbering or dropped supplier is left unstated (the pull request removes nothing).
- Suppliers: the eleven open suppliers of the README's contracts are the eleven of the description's dependency list; the other eight (SchemeAndStackFoundations, LocalPurity, ModularCurves, ReductiveGroups, EtaleCohomologyFoundations, DerivedModuleAlgebra, EnhancedDerivedSheaves, PerfectoidSpaces) are on main. The three declared gaps are stated at README lines 657, 732, 751 with their slugs.
- Source locators checked: 3 (CS24 Theorem 3.2.4, lines 1381–1384, p. 33; Theorem 6.2.4, lines 3540–3549; Theorem 6.2.7, lines 3566–3568). No seeded target falls in a changed passage; the README flags no locator as unverified.
- Gate rerun at a825987: every counter 0, `OK` (the worker's `gate.md`: `build=0`). Dependency check: `depcheck: 244 roadmaps, 2230 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/PurityForFlatCohomology/Suggested.lean`: 15 warnings, all ``declaration uses `sorry` ``, 0 errors. The file is unchanged, so the 25 elaborated signatures and the one-tactic probe stand as recorded.
- Outside-folder diff against `origin/main`: empty. Overlaps: no other open pull request changes the roadmap, no cited id dropped, none defined only by an open revision; cross-roadmap citations found nowhere: 0.
- Remark (untouched text): §§1.5–1.6 take the henselian completion comparison from PrismaticCohomology §2.0; it is a statement about torsion étale cohomology, not about perfectoid rings, so "no perfectoid input" (README line 1006, the description) stands.
- Overlap check: read SchemeAndStackFoundationsPartII, GroupSchemesOverABase, LocalPurity; fppf cohomology with supports and Layer 3: owner PurityForFlatCohomology, cited by SchemeAndStackFoundationsPartII; multiplicative type over an affine base: owner ReductiveGroups Layer 9D, cited here; over an arbitrary base: see For the human reviewers.
- Source independence: changed passages only; the folder has no changed passage, 3 passages of the description compared with 1 source (CS24), none shared; largest share CS24, unchanged; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- As before: SGA3 VIII–X (§§7.12a–7.12e), Aus62 Theorem 1.3 (§7.2), DF84 Remark 3 (§8.18), Avr77 Proposition 3.6 (§1.2) are uncertified and cited by locator only.
- The description's "AI assistance" sentence (the numbers of review and red-team rounds) describes the job board, not the head; not checked.

## Source issues

- none

## For the human reviewers

- **Scope.** GroupSchemesOverABase (open, #1522; its Downstream consumers bullet on this roadmap) owns the same objects as §§7.12a–7.12e and asks this roadmap to cite it; the gate's `dropped` check refuses that name here. Which roadmap owns them is undecided.
