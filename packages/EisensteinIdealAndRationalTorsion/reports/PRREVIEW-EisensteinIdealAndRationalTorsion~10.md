# Review of EisensteinIdealAndRationalTorsion (pull request #1264 at e49787c)

**Verdict:** accepted

Incremental re-review of 0 changed lines since e49787c. The folder is unchanged; this round reads the pull request's title and description, as they stand now, against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads “That descent proves the `X₁(13)` model and cusp theorems it uses (§8.1) and the class number of `ℚ(ζ₁₃)` (§8.5), so the order-13 exclusion is unconditional.” No conditional clause remains.

## Verified sound

| Statement | Instances tried | Values computed on both sides | Result / change |
| --- | --- | --- | --- |
| Description (repaired sentence): the level-13 descent proves the §8.1 model and cusp theorems and the §8.5 class number; order-13 exclusion unconditional | `README.md:1094`, `:1226`, `:1228`, `:1338`; `Suggested.lean:83–89` | §8.1 is headed “The level-thirteen model and cusp theorems”; §8.5 proves `cyclotomic_thirteen_class_number`; both Lean statements carry no hypothesis; README says “unconditional”. | Agrees; R01 repaired. |
| `cyclotomic_thirteen_class_number` (§8.5), cited by the repaired sentence and by “proved from Mathlib's Minkowski bound” | Degree 12, six complex places, discriminant `13¹¹` | `(4/π)⁶·12!/12¹²·13^5.5 = 306.4158`, the README's bound; `README.md:1270` names `NumberField.exists_ideal_in_class_of_norm_le`. | Agrees. |
| Description: “obtain `all_prime_torsion`: prime-order rational points … have order 2, 3, 5 or 7” | `Suggested.lean:100`; `P = 4, 11, 13`; the identity point | Type: `P.Prime → addOrderOf Q = P → P=2∨3∨5∨7`. 4 is not prime; 11, 13 are not listed; `addOrderOf 0 = 1` is not prime. | Agrees. |
| Description: “`T/I ≅ ℤ/n`”, “at every prime P”, “genus-zero levels are included” | `P = 2, 3, 5, 7, 11, 13, 17, 37` | `(P−1)/gcd(P−1,12)` = 1, 1, 1, 1, 5, 1, 4, 3; `eisenstein_index` assumes only `P.Prime` and `[NeZero P]`. | Agrees. |
| Description: “not `J/IJ`, which always vanishes” | `P = 11` (`n = 5`), `P = 13` (`n = 1`) | `n ∈ I`, so `IJ ⊇ nJ = J`; at 13, `J = 0`. Both give `J/IJ = 0`; `README.md:21` says `A_Eis` is neither `J[I]` nor `J/IJ`. | Agrees. |
| Description: what each consumer takes; “everything else named in the README is a consumer” | `README.md:13`, `:1336–1338`; the roadmap names of the README | §3.1 constituents and §0.2 Fricke sign; fixed-vector exclusion, quotients, formal immersion; §7.9 imported by EllipticCurveModularityPartII §6.0c; winding lattice. Six cited roadmaps are on main; three consumers are not suppliers. | Agrees. |

The rows for the statements of the folder stand as in the previous review, of `e49787c`: no statement changed.

- Pull request text: the title and the 12 sentences of the summary block and prose were read against the head; none is contradicted. The description names the folder's three files (README, `Suggested.lean`, `metadata.toml`); the folder holds exactly these, all added (1467 insertions, 0 deletions; nothing removed or renumbered; 8 Lean declarations added, none removed).
- Gate at this head: every scanner at zero, `OK` (rerun); the worker's run includes `build=0`. No file changed outside the folder; the worktree is clean.
- Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with seven `sorry` warnings (lines 62, 73, 83, 89, 94, 100, 107) and nothing else; the one `def` has a real body.
- Citations: the worker's two “found nowhere” leads (`ContinuousRep.iso_of_charpoly_eq`, `NonabelianH1.equivSheafH`) are supplier-roadmap names resolved in an earlier review; unchanged. §8.9, cited at `README.md:1336`, exists (`README.md:1314`).
- Seeded sample: none of the 15 targets is a changed passage (the folder did not change); the README flags no locator as unverified.
- Overlap check: read EllipticCurveModularityPartII, ModularCurvesPartII, ModularForms (scope as cited at `README.md:7`, `:13`); nothing shared: §7.9 is owned here and imported by EllipticCurveModularityPartII §6.0c; the overlap listing shows no other pull request changing this roadmap, no dropped id and no second copy.
- Source independence: changed passages only: 0 passages changed in the folder, so none compared; largest share Mazur1977, 66 of 101 bracketed locators (count of the previous review; folder unchanged); no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- none in this round: no source locator is in a changed passage. The description's “AI assistance” sentence states provenance and cannot be checked against the head.

## Source issues

- none

## For the human reviewers

- Licence: `[SutherlandModels]` (`README.md` References) is an unpublished data file on an author's page, and `[BruinDerickxStoll2021]` is cited from an author-page preprint; §8.1 cites both for the level-13 model and cusps.
