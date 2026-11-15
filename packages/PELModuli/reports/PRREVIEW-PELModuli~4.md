# Review of PELModuli (pull request #966 at ba37185)

**Verdict:** accepted

Incremental re-review of the 15 lines changed since 697b514, and a check of the title and description against this head. No finding.

## Previous findings

- R01 — repaired: lines 1651–1655 read "congruent to a nonzero primitive element of one residue field `O_F/𝔭` of `O_F` above `p = char κ` and to `0` at the others"; characteristic `0` is now covered by an element generating `F`.
- R02 — repaired: the summary block's "Approach and generality" now opens "The integral isomorphism problem is compared with the rational quasi-isogeny problem."; the sentence naming two sources as followed is gone.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| M1.3, the two signature conditions agree over a field `κ`, `char κ = p` (lines 1650–1654) | `ℤ[i]`: `p = 5` split, `a = 2 − i`; `a = 5`; `p = 3` inert, `a = i`; `p = 2` ramified, `a = 1` | `p = 5`: `(T − 4)²` for `(2,0)`, `(T − 4)T` for `(1,1)`; `a = 5` (`T²` both) is now excluded; `p = 3`: `(T − i)²` against `T² + 1`; `p = 2`: one residue embedding, both conditions read `m_σ = 2` | sound | none |
| M1.3, characteristic `0` parenthesis (lines 1653–1654) | `F = ℚ(i)`, `κ = ℂ`, `a = i`; `a = 1` | `a = i`: `(T − i)²` against `(T − i)(T + i)`; `a = 1` gives `(T − 1)²` for both types and does not generate `F`, so is excluded | sound | none |
| Line 131, `TauCeti.Analysis.Matrix.HermitianSignature.Basic` with its four declarations | the module at the pin; `diag(1, −1, 0)`; `diag(1, 1)` negated | `signature` line 68, `signature_congr` 147, `signature_diagonal` 175, `signature_neg` 223, all in `Matrix.IsHermitian`; values `1 − 1 + 0 = 0` and `2 ↦ −2` | exact | none |
| Lines 319 and 339, the pins `1b1ccf4` and `2fd255d` | `lake-manifest.json` and the checked-out packages | Mathlib `1b1ccf4b088b…`, Tau Ceti `2fd255d997f4…` in both | exact | none |
| Lines 1003 and 1008, `Matrix.IsHermitian.signature_map_starRingEnd` (depends on the moved module) | the pin | `HermitianSignature/Basic.lean` line 255 | exact | none |

The rows for the untouched statements stand as in the previous review, of 697b514.

- Gate: the worker's gate at ba37185 passes with every counter zero and the targeted build OK; no file is changed outside the folder (`git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/PELModuli` is empty).
- Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/PELModuli/Suggested.lean` exits with three warnings, all `declaration uses sorry` (lines 62, 70, 80). The diff touches no Lean; the four elaborated signatures are those already compared with the README, and the earlier `#check @name` comparison and one-tactic probe stand.
- Library declarations opened at the new Tau Ceti pin: 16, all present (the five of `HermitianSignature/Basic.lean`; `hilbert90` and `subsingleton_H1_unitsCoeff` in `FieldTheory/GaloisCohomology/Hilbert90.lean` lines 267 and 221; `complexAssociatedForm` and `Compatible.hermitianCore` in `Geometry/Symplectic/Hermitian.lean` lines 78 and 260; `SymplecticForm`, `AlmostComplexStructure`, `Compatible` in `Geometry/Symplectic/AlmostComplex.lean` lines 440, 88, 571; `exists_compatible`; `HodgeStructureOn`; `IsPolarization`; `IsRiemannForm.isPolarization`). The worker's list of names found nowhere contains no Mathlib or Tau Ceti library name.
- Cross-roadmap citations resolved: the one lead, "NeronModelsAndSemistableAbelianVarieties R11.3 §3.10" (line 2500), is valid: that roadmap's open head names its six layers R11.1–R11.6 and has §3.10. The seeded sample targets (lines 1384, 1927, 1965, 2657, 2695, 2805) do not fall in the changed passages; no source locator is added or changed.
- Description against the head, sentence by sentence: title; the summary block against README lines 3–28 and M1.10, M0.15, M0.18; the folder's three files; the supplier paragraph. The nine roadmaps of the dependency list are exactly the README's suppliers not under main's active folder (AdelicAlgebraicGroups is on main); the other named roadmaps are on main (six of them under `Completed/`), consumers (lines 245–250, 4151–4168), or CrystallineCohomology (line 209) and ShimuraData (line 4159), as the description says. The pull request adds the roadmap and removes nothing.
- Overlap check: read AbelianSchemesAndArithmeticModuli, ShimuraCompactifications, HilbertModularVarietiesAndShimuraCurves, ShimuraVarieties, FaltingsFinitenessAndIsogenyTheorems; nothing shared (no roadmap on main is listed as close; no other open pull request changes this roadmap, no cited id is dropped, no second copy on main).
- Source independence: changed passages only; 1 passage compared (the M1.3 sentence, which has no source counterpart; the other changed lines are a module name and two commit hashes), none shared; largest share Lan, 92 locators; contents not compared again, since the diff adds, removes or reorders no layer.

## Not verifiable

- Liu–Tian–Xiao–Zhang–Zhu, Definition 3.4.3, p. 149 (named in the sentence before the changed M1.3 passage): not re-read this round; the changed sentence does not depend on its wording.
- The description's sentence on AI assistance and author-side passes: a statement about how the text was produced, with no counterpart in the folder.

## Source issues

- none

## For the human reviewers

- **Not tested.** Lan's book has the largest share of the locators (92). Its table of contents was not set beside the layers in this round, and no earlier report of this folder carries a full `Source independence:` comparison of contents.
