# GATE-VonNeumannAlgebras~4 — answers to human review

Head before: `c12286f`. Head after: `df71dfe` (one commit, README only; `Suggested.lean` unchanged).

## H01 (rwst) — answered

Correct: the folder never mentions QuantumFoundations, and finite Gleason is owned here (V12.J.Frame), so the QuantumFoundations paragraph of the PR description is stale. The PR description is outside the files this repair may touch; the worker should delete that paragraph when it updates the description.

## H02 (rwst) — answered

At `df71dfe`, `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean` has 11 `sorry` proofs (lines 76, 86, 97, 105, 121, 142, 171, 179, 185, 198, 213; the 12th grep hit is the word in the module docstring, line 11). `ProjectionClosureTargets.lean` has 3 more and `FiniteComplexModularTargets.lean` has 2. The "seven intentional admissions" sentence in the description is stale and should give 11 (or 0 extra once the two files in H05 are deleted).

## H03 (rwst) — answered

Closing the earlier pull request is a GitHub action outside the roadmap files. It stays a follow-up for the worker or a maintainer after merge. Nothing in the folder refers to that pull request.

## H04 (rwst) — answered

Confirmed on main (`6cfa9b1c`): `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md` lines 690 and 1391 link V4.0.Fields at blob `4831498…`. Those lines belong to OperatorTheory on main, not to this folder, so they stay a post-merge follow-up. V4.0.Fields still exists under that name (README `**V4.0.Fields — Hilbert and operator fields.**`, line 1132), so a redirect to main will resolve.

## H05 (rwst) — answered

Correct, and the problem covers more than one file. `ProjectionClosureTargets.lean` (lines 34–37) restates `closure_isStarProjection_eq_positive_contractions` (`Suggested.lean` lines 99–105) word for word. Its other two theorems are a proof-route lemma and a finite-dimensional boundary case, and the README declares neither. `FiniteComplexModularTargets.lean` has the same defect: the README declares none of `diagonalPower`, `diagonalModularPower`, `diagonalModularPower_star` or `diagonalModularPower_preserves_star_iff`. Both files import `Mathlib.*` submodules, and both were added by this pull request (commits `05418502` and `87aeca19`). Both should be deleted. This repair may edit only `README.md` and `Suggested.lean`, so the worker must delete them. Nothing in the README or `Suggested.lean` depends on either file. The gate did not flag them (`stray-files=0`, `mathlib-subimports=0`).

## H06 (rwst) — applied

Layer 2 Dependencies, README line 852: "SA-B49, SA-B52–B53 and SA-B85–B86, Mathlib `essSup`, V4.0.Fields and V4.Normality for V2.AbelianClassification and V2.AbelianRepresentationMultiplicity" → "SA-B05, SA-B49, SA-B52–B53 and SA-B85–B86, Layer 1's Kaplansky theorem and bounded-set metrizability, Mathlib `L∞` and `essSup`, and V4.Normality for …". The bullet now matches the two targets' own *Needs:* lines (lines 758–761 and 822), which never named Fields: they reach it only through SA-B85. Other bullets that name V4.0.Fields (lines 1169, 1197, 1330, 1381) belong to V4.0.Decomposition and V5, which use Fields directly, so they stay.

## H07 (rwst) — answered

No change needed. The cited ids exist on main: SA-B85 on main consumes V4.0.Fields (SelfAdjointSpectralTheory README lines 690 and 1391), and this README states that edge in its ordering note (lines 42–44 and 4079). Removing Fields from the H06 bullet keeps the order acyclic: V2.AbelianClassification follows Fields only through SA-B85.

## Adversarial pass on the changed statement

| Statement | Check | Values | Result | Change |
|---|---|---|---|---|
| Layer 2 Dependencies bullet for V2.AbelianClassification / V2.AbelianRepresentationMultiplicity | Item-by-item comparison with the targets' *Needs:* lines | Classification Needs: {SA-B05, SA-B49, SA-B52–53, SA-B85–86, single-generator (Layer 2), V1 Kaplansky + metrizability, Mathlib `L∞`, `essSup`, V4.Normality}. RepMultiplicity Needs: {SA-B85, V4.Normality, Φ_a}. Old bullet: lacked SA-B05, Kaplansky and `L∞`, and had an extra V4.0.Fields. New bullet: same set as the union of the Needs lines | Old bullet wrong (extra Fields, missing three items) | Bullet rewritten |
| Supply direction after the change | depcheck | `depcheck: 207 roadmaps, 1463 edges, 0 problem(s)` | No UPWARD or CYCLE | none |

I did not re-run `#check @name` because `Suggested.lean` is unchanged. Its 19 elaborated signatures in `signatures.md` still apply. Ownership against open pull requests is unaffected because the edit adds no construction.

## Build and gate

- `lake build TauCetiRoadmap.VonNeumannAlgebras.Suggested`: `Build completed successfully (8976 jobs).` The only warnings are `declaration uses 'sorry'`.
- Gate at `df71dfe`: `gate VonNeumannAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 207 roadmaps, 1463 edges, 0 problem(s)`
