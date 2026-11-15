# Review of ClassicalSerreModularity (pull request #1020 at e8c5264)

**Verdict:** accepted

Incremental re-review of the 2 changed lines since `bacf7a7` (1 insertion, 1 deletion, in `TauCetiRoadmap/ClassicalSerreModularity/README.md` line 1263; `Suggested.lean` and `metadata.toml` unchanged; nothing changed outside the folder), and a check of the pull request's title and description against this head. No finding. Source id: `blggt` is Barnet-Lamb–Gee–Geraghty–Taylor, arXiv 1010.2561v4, read through the sources service; `blggt line N` is a line of its line-numbered extraction.

## Previous findings

- R01 — repaired: README 1263 now reads “Theorem 5.5.2, p. 81, which proves irreducibility in every rank for a density-one set of `ℓ` under extreme regularity; the rank-two statement for every `ℓ` is proved here directly.” No new problem introduced.

## Verified sound

| Statement / object | Instances and computed values | Result / change |
| --- | --- | --- |
| Source line of `R33.1/rank-two-unitary-irreducibility` (README 1263) against BLGGT Theorem 5.5.2 | `blggt line 3787`–`3792`: `F` CM, `π` regular algebraic polarizable cuspidal on `GL_n`, extremely regular weight; conclusion for `l` in a density-1 set. README: every rank, density-one set, extreme regularity | Pass: the three clauses agree |
| Same, page locators | `=== page 81 ===` at `blggt line 3760`, page 82 at `3807`, theorem at `3787`; definition at `blggt line 1473`–`1475`, between page 32 (`1435`) and page 33 (`1482`) | Pass: p. 81 and p. 32 |
| Same, “the rank-two statement for every `ℓ` is proved here directly” | `n = 2`, labels `{a₁+1, a₂}` with `a₁ ≥ a₂`: singleton sums `a₁+1 ≠ a₂`, one two-element subset, so every weight is extremely regular; the source then gives a density-one set, the target every `ℓ`: strictly more | Pass: not a case of the source; the target's own route (AG2.6 admissibility, §3.13, AL.3) is what the sentence points to |
| Same, negative control against the target's Checks | `ψ₁ ⊞ ψ₂`: regular algebraic, conjugate self-dual, not cuspidal, Galois representation `χ₁ ⊕ χ₂` reducible; Theorem 5.5.2 also assumes cuspidality | Pass: sentence and first Check consistent |
| `n = 1` under the changed sentence | a character: irreducible for every `ℓ`; extreme regularity holds (one singleton) | Pass: “every rank” has no degenerate failure |
| Description, “needs only three early classical targets” | README 368 and 1551: good-dihedral definition, Lemma 6.3, Lemma 8.2; count `3` | Pass |
| Description, owned theorems and consumers | README 31, 39, 76–79: Moret-Bailly, Skinner–Wiles, Khare–Wintenberger and Kisin lifting, Hypothesis `(H)`, Kisin and Pan; EllipticCurveModularity R29.2; PotentialModularityAndCompatibleSystems on I.0, I.2, I.3 | Pass |
| Description, scalar dyadic case and imaginary-quadratic dihedral case | README 47, 1258, 1634 (scalar dyadic passage not written in the sources, supplied by `R27.4`); README 470, 1651 (induction from an imaginary quadratic field kept in I.1) | Pass |
| Description, numerical table and lattice Checks | README 135: finite estimate for primes `5 ≤ p ≤ 21591`, proved in R26.3, “no standing finite hypothesis”; README 292: the two lattice reductions at `(q,N) = (3,2)` | Pass |
| Description, folder and Lean claims | folder holds `README.md`, `Suggested.lean`, `metadata.toml`; imports are `Mathlib` and one `TauCeti` module, no roadmap module; 15 definitions with bodies, 5 theorems | Pass |
| Description, dependencies sentence against the README | 30 roadmap names in the README: 20 open suppliers, all in the depends-on block and at merge positions 28–169 < 172; 5 on main (ModularForms, ClassFieldTheory, Chebotarev, LocalGaloisGroups, LocalFieldsRamification); 5 consumers at 173–256 | Pass |

The rows for all other statements stand as in the previous review, of `bacf7a7`.

- Source locators checked against the text: 2 (`blggt line 1473`, `blggt line 3787`), both in the changed line; the fourteen other seeded targets and “Lemma 2.3” lie in untouched passages.
- Previous findings accounted for: 1 of 1, repaired.
- Pull-request text: title and every prose sentence of the description read against this head and the folder's change (new roadmap, 46 headings and 20 declarations added, none removed); no sentence contradicted, no removed section, headline or supplier left unstated.
- Cross-roadmap citations resolved: the two leads `AlgebraicModularFormsAndSerreWeights R15.3` and `R15.4` resolve at that roadmap's open head, whose Scope section maps R15.1–R15.5 to its Layers 1–5; the changed line cites no roadmap.
- Gate rerun at `e8c5264`: every counter zero, OK. Dependency check: `depcheck: 245 roadmaps, 2251 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ClassicalSerreModularity/Suggested.lean` gives five `sorry` warnings (lines 112, 123, 156, 168, 178) and nothing else; the file is byte-identical to the one the previous review probed, so its `#check` comparison and one-tactic probe stand.
- Remark on untouched text: the reference link `[cheb]` (README 1703) points to `TauCetiRoadmap/Chebotarev/README.md`; on main that roadmap is under `Completed/Chebotarev`.
- Wording: the changed sentence beside `blggt line 3787`–`3792` shares no run of words beyond the standard terms.

Overlap check: read GL2ModularityLifting, PotentialModularityAndCompatibleSystems, OrdinaryAutomorphicFormsAndModularityLifting, SerreWeightAndLevelOptimisation, CompletedCohomologyAndLocalGlobalCompatibility; nothing shared (each cites this roadmap's Layer I, R27.6 or scalar dyadic completion as owner and states its own generalization separately; `scratch/overlaps.md` lists no dropped id, second copy or conflicting head).

Source independence: changed passages only; 1 passage compared with 1 source (`blggt`), none shared; the diff adds, removes and reorders no layer, so the arrangement was not compared again.

## Not verifiable

- Labesse, *Changement de base CM et séries discrètes*, Corollaire 5.3; Chenevier–Harris Theorem 3.2.3: supplier citations, not read; untouched by the diff.
- Kisin (*Modularity for some geometric Galois representations*; 2-adic Barsotti–Tate), Khare 1997, the Skinner–Wiles 2001 correction: no legal open text found in earlier rounds; the diff does not touch the passages citing them.
- The description's statement of which AI tools assisted: not checkable from the repository.

## Source issues

- none

## For the human reviewers

- none
