# Review of EisensteinIdealAndRationalTorsion (pull request #1264 at e49787c)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since e49787c. The folder is unchanged; this round reads the pull request's title and description against the head. One sentence of the description is out of date. Nothing in the folder needs to change.

## R01 (P3) — The description still calls the level-13 descent conditional

**Location:** pull request description, first paragraph after the summary block: “…and includes the separate level-thirteen norm-19 descent under explicit modular-curve and class-number hypotheses.”

**Claim:** At this head the level-13 descent carries no such hypotheses: the model identification and the class number are theorems of the roadmap, and the exclusion is unconditional.

**Witness:** `README.md:3` “using the modular-curve identification and class-number theorem proved in §§8.1 and 8.5”; `README.md:1278` “no extra model or class-number hypothesis”; `Suggested.lean:83–89` states `cyclotomic_thirteen_class_number` and `order_thirteen_exclusion` with no hypothesis. The description's own summary block says the class number is “proved”.

**Repair:** Replace the clause with: “…and includes the separate level-thirteen norm-19 descent, proving the `X₁(13)` model and cusp facts (§8.1) and the class number of `ℚ(ζ₁₃)` (§8.5) that it uses, so that the order-13 exclusion is unconditional.”

## Previous findings

- none: the previous report, of `e49787c`, listed no finding.

## Verified sound

| Statement | Instances tried | Values computed on both sides | Result / change |
| --- | --- | --- | --- |
| Description: “obtain `all_prime_torsion`: prime-order rational points … have order 2, 3, 5 or 7” | Elaborated type at `Suggested.lean:100`; `P=4`, `11`, `13`; identity point | Type: `Nat.Prime P → … addOrderOf Q = P → P=2∨3∨5∨7`. 4 is not prime; 11 and 13 are not in the list; `addOrderOf 0 = 1` is not prime. | Agrees with the description. |
| Description: “`T/I ≅ ℤ/n`”, “at every prime P”, “genus-zero levels are included” | `P=2,3,5,7,13,11,17,37` | `(P−1)/gcd(P−1,12)` = 1,1,1,1,1,5,4,3; `eisenstein_index` has only `Nat.Prime P` and `[NeZero P]`. | Agrees. |
| Description: “class number of ℚ(ζ₁₃) proved from Mathlib's Minkowski bound” (against R01's sentence) | Degree 12, six complex places, discriminant `13¹¹` | `(4/π)⁶·12!/12¹²·√(13¹¹) = 306.4158`, the value in §8.5; `README.md:145` names `NumberField.exists_ideal_in_class_of_norm_le`; `Suggested.lean:83` has no hypothesis. | Summary block right; the prose sentence wrong (R01). |
| Description: “not `J/IJ`, which always vanishes” | `P=11` (`n=5`), `P=13` (`n=1`) | `n∈I`, so `IJ ⊇ nJ = J` (multiplication by 5 on an abelian variety is surjective); at 13, `J=0`. Both give `J/IJ=0`. | Agrees with Conventions (`README.md:21`). |
| Description: consumers and suppliers named in the prose | 18 roadmap names in the README | 6 on main (ClassFieldTheory, EllipticCurves, JacobianChallenge, ModularCurves, ModularForms, SchemeAndStackFoundations); 9 open suppliers, the 9 of the depends-on block; 3 consumers (SerreWeightAndLevelOptimisation, EllipticCurveModularity, EllipticCurveModularityPartII), all in `## Downstream consumers`. | Agrees: “everything else named … is a consumer”. |
| Description: what each consumer takes | `README.md:1336–1338`, `:13` | §3.1 constituents and §0.2 Fricke normalization; fixed-vector exclusion, quotients, formal immersion; §7.9 Manin–Drinfeld imported by EllipticCurveModularityPartII §6.0c; the integral winding lattice. 4 of 4 sentences match. | Agrees. |

The rows for the statements of the folder stand as in the previous review, of `e49787c`: no statement changed.

- Pull request text: the title and 11 sentences of prose and summary block were read against the head; 1 contradicted (R01). The description says the folder is a roadmap's README, `Suggested.lean` and `metadata.toml`; the folder holds exactly these three, all added (1467 insertions, 0 deletions, nothing removed or renumbered).
- Gate at this head: every scanner at zero, `OK`; the worker's run includes `build=0`. No file changed outside the folder (the `git diff --stat` excluding it is empty); the worktree is clean.
- Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `Suggested.lean` exits with seven `sorry` warnings and nothing else; the 8 elaborated types equal those of the previous review.
- Citations: the worker's two “found nowhere” leads (`ContinuousRep.iso_of_charpoly_eq`, `NonabelianH1.equivSheafH`) are roadmap names resolved in the previous review; unchanged.
- Seeded sample: none of the 15 targets is a changed passage (the folder did not change); the README flags no locator as unverified.
- Overlap check: read EllipticCurveModularityPartII, ModularCurvesPartII, ModularForms (scope lines as cited in `README.md:7,13`); nothing shared: §7.9 is owned here and imported by EllipticCurveModularityPartII §6.0c; `overlaps.md` lists no other pull request changing this roadmap and no dropped id.
- Source independence: changed passages only: 0 passages changed in the folder, so none compared; largest share Mazur1977, 66 of 101 bracketed locators; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- none in this round: no source locator is in a changed passage.

## Source issues

- none

## For the human reviewers

- Licence: `[SutherlandModels]` (`README.md` References) is an unpublished data file on an author's page, and `[BruinDerickxStoll2021]` is cited from an author-page preprint; §8.1 cites both for the level-13 model and cusps.
