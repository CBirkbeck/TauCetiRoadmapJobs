# Review of QuadraticFormInvariants (pull request #1797 at a285fd7)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `11a9ca1`. `git diff --stat 11a9ca13 HEAD -- TauCetiRoadmap/QuadraticFormInvariants` is empty: the folder (`README.md` 3626 lines, `Suggested.lean` 3873 lines, `metadata.toml`, generated `PROGRESS.md` and `STATUS.md`) is byte-identical to the head the previous review read. The one commit since then (`a285fd71`) changes only `TauCetiRoadmap/AlgebraicTopology/README.md` and `AlgebraicTopology/Suggested.lean`. This brief names that folder as part of the pull request. Neither file mentions this roadmap, `hilbertSymbol` or `StiefelWhitney`, and this README does not cite AlgebraicTopology. The pins are unchanged: Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…` (by `git rev-parse HEAD` in the pinned packages), toolchain `v4.36.0-rc2`. So every previous finding stands, each re-checked below at this head and pin, and no new defect was introduced. Main has moved since the merge base (`eaf17b10` → `ad30d944`): `TauCetiRoadmap/IntegralLattices/Suggested.lean` on main no longer imports this module. The consumer note of R01 and the keep-list of R02 are updated for that.

What this pull request changes in this folder: against the merge base it deletes `NativeCompletion.md` and pastes its text into the README as `### Checked native completion interfaces` (README 152–332). `Suggested.lean` is byte-identical to main. So R05's README 152–332 is this pull request's own text. The other findings concern the folder as it already stands on main. The gate fails on them all the same, and no acceptance is possible while it fails.

## R01 (P1) — Layers 7–9 are stated on another roadmap's sorry'd data, and both headlines are native at the pin

Location: `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` lines 2–4 (`import TauCetiRoadmap.ProfiniteCohomology.Suggested`, `import Completed.LocalFieldsRamification.Suggested`, `import TauCetiRoadmap.ClassFieldTheory.Suggested`); `cup11` (1510), `kummerClass` (1560), `h2MuToUnits` (1585), `sw2Class` (2690), `galoisEvens2` (2970); the two headlines `galoisEvens2_kummerClass` (3723) and `relativeStiefelWhitney_quadraticExtension` (3792).

Claim: README 898–911 says the profinite-cohomology names consumed "are abbreviations of Tau Ceti's declarations of the same names or are proved by them", so that "every statement here is about Tau Ceti's objects".

Witness: `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean` (identical at this head and on main, re-read this round) has `cup` (3868), `inhomogeneousCochain2` (5145), `f2Pairing` (5332), `homClass` (5537) and `galoisF2Iso` (5846) as `noncomputable def`s with body `sorry`. Gate: `imports=1`. Both headlines are native: `TauCeti.galoisEvens2_kummerClass` (`FieldTheory/QuadraticForm/StiefelWhitney/Evens/Kummer/Value.lean:220`), `TauCeti.sw2Class_formClass_traceTransfer_smul_sq` (`StiefelWhitney/QuadraticExtension.lean:249`).

Repair: the imports become `import Mathlib` plus the `TauCeti.*` modules used, and the three roadmap imports go. State each headline as an `example` discharged by the native theorem (as the four-fold criterion is at 410–416), or name it in the module docstring as Tau Ceti's with its declaration. Nothing is restated on `cup11` or `galoisEvens2`. README 898–928 then says which supplier names are Tau Ceti's at the pin and which are the supplier's prototypes. On the consumer side, the earlier note about `IntegralLattices/Suggested.lean:753` no longer applies: on main at `ad30d944` that file imports `Mathlib` and `TauCeti.*` only and never mentions this namespace. The only Lean consumer on main is `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` (import at line 5; see R02).

## R02 (P2) — The file is an API catalogue of declarations proved at the pin

Location: `Suggested.lean`, 136 sorried declarations (136 `declaration uses sorry` warnings in this round's elaboration). Representative lines:

- Layer 5: `quaternionClass_symm/_sq/_mul/_congr/_one_sub` (561–596), `hasseInvariant_*` (613–636), `cliffordInvariant_eq` (777).
- Layer 6: `squareClass_finite` (971), the defect calculus (1069–1131), `hilbertSymbol_*` (1190–1302), the 6D block (1315–1358), `serreEps`/`serreOmega` (1377–1440).
- Layer 7: `kummerSquareClassEquiv` (1569), `Br2` (1659), the crossed-product and `Inflation` block (1706–2345), `hilbertSymbol_productFormula` (2578).
- Layers 8–9: the Pin model (3116–3295) with its own comparisons `pinE1_eq_native … pinLift_eq_native` (3338–3387), and `rootSign … galoisF2Iso_inv_kummerClass` (3395–3486).

Claim: the module docstring calls the file "target signatures". Under the house rules the file states headline theorems only; anything that exists at the pin is deleted and cited instead.

Witness: one-tactic probe re-run this round on a scratch copy. The seven sorries at 563, 570, 578, 1192, 1197, 1211, 1235 each close with one native term (`TauCeti.BrauerGroup.quaternionClass_comm/_sq/_mul`, `TauCeti.hilbertSymbol_congr_sq/_neg_self/_comm`, `TauCeti.hilbertSymbol_mul_right (Invertible.ne_zero (2 : K)) a b c`). Result: exit 0, 129 sorry warnings, no error.

Repair: delete every declaration whose object exists at the pin, together with the proved comparisons at 3338–3387. Keep only what the consumer on main uses from this namespace, as reducible aliases proved from the native declarations with no `sorry`. That consumer is `GlobalQuadraticForms/Suggested.lean` at `ad30d944`, which uses:

- `hilbertSymbol`, `hilbertSymbol_neg_self`, `hilbertSymbol_mul` and `exists_hilbertSymbol_eq_neg_one` (`#check`s at 63–66);
- `formClass` and `discr` (an `open` at 367);
- `localHasse` (an `open` at 460).

GlobalQuadraticForms unfolds `localHasse` (468) and simps `hilbertSymbol` (488), so these two keep their bodies. IntegralLattices on main cites `hilbertSymbol_productFormula` and "Layer 6D" in its README only (lines 476, 1027, 2229, 2305), so those README ids stay.

## R03 (P2) — The second headline theorem is statable at the pin and absent

Location: README 19–23 name three high points. `Suggested.lean` states the first (410–416) and the third (3792). The second has no statement: 1315–1351 state realization, `u(K) = 4` and quaternary uniqueness, not the classification.

Claim: two regular forms over `K` are isometric exactly when their dimension, discriminant and Hasse invariant `(dim, d, s)` agree.

Witness: `TauCeti.RegularFormClass.eq_iff_rank_eq_and_discr_eq_and_localHasse_eq` at `TauCeti/NumberTheory/LocalField/QuadraticForm/Classification.lean:132`, re-opened at the pin this round. `grep -c eq_iff_rank_eq_and_discr_eq_and_localHasse_eq Suggested.lean` prints 0.

Repair: state it as an `example` discharged by the native theorem, or name it in the module docstring as Tau Ceti's with that declaration.

## R04 (P2) — Sorry'd data and `set_option`

Location: `Suggested.lean`:

- nine bodies that are `sorry`: 822 `cliffordHomI2`, 864 `cliffordHomI2Bar`, 971 `instance squareClass_finite`, 1569 `kummerSquareClassEquiv`, 1619 `resHUnits`, 1835 `cocycleOfSplitting`, 1862 `TwoCocycle.comap` (`isCocycle := sorry`), 2353 `brauerCohomologyEquiv`, 2358 `brauer2EquivH2`;
- 51 `set_option … in` lines, from 1981 to 3552.

Gate at this head: `sorry-data=9 set_option=51`.

Claim: the docstrings at 2347–2352 and 2403–2407 call these "named definitions" that carry the normalisation.

Witness: a `def` whose body is `sorry` asserts nothing, so `brauerCohomologyEquiv_unique` (2393) is about an unknown map. Native bodies exist at the pin (paths under `TauCeti/`):

- `cliffordHomI2` and `cliffordHomI2Bar`: `LinearAlgebra/QuadraticForm/Witt/Clifford.lean:142,187`;
- `kummerSquareClassEquiv`: `GaloisCohomology/MuTwo/Basic.lean:668`;
- `cocycleOfSplitting`: `Algebra/CrossedProduct/Splitting/Basic.lean:321`;
- `brauerCohomologyEquiv`: `CrossedProduct/Comparison.lean:274`;
- `brauer2EquivH2`: `CrossedProduct/TwoTorsion.lean:152`.

Each was re-opened this round.

Repair: delete the nine with R02. The `set_option` lines go with the sections they sit in. Any statement that is kept is restated so that it elaborates under the defaults.

## R05 (P3) — The README carries a process document

Location:

- README 33–151 (on main): `## Completion audit (2026-10-28)`, "Audit status: incomplete. This roadmap remains active." at 35, the stale pin sentence (`a91d3aa…`) at 146.
- README 152–332 (this pull request's addition): the `/absolute/path/to/that/file.lean` placeholder at 169, and the Lean fence ending in `#print axioms` at 330–331.
- README 3618–3626: the "private migration and provenance ledger".
- `Suggested.lean` 403 and 1209: "`gq2`'s B11a", a label defined nowhere.

Witness: the README rules. A README is timeless: no process narrative, no local paths, never `#print axioms`.

Repair: delete 33–332, 3618–3626 and the two "B11a" phrases. Move the native-interface facts that are still true at the pin into the supplier contracts, with pin-true paths (R06). Because 152–332 came from deleting `NativeCompletion.md`, this deletion completes this pull request's own change.

## R06 (P3) — Claims about the pin that are false at `2fd255d9`, and ownership overclaims

Each re-checked in the pinned tree this round:

- Files cited that do not exist: `ls` fails on `NumberTheory/LocalField/WorkedExamples/DyadicSqrt/NormControl.lean` (README 134–137) and `LinearAlgebra/QuadraticForm/RegularFormClass/Matrix.lean` (117).
- Declarations cited that exist nowhere: `TauCeti.oneFoldPfister_smul_equivalent_of_mem_unitValueSet` and `twoFold…` (1603–1604). `grep -rn` of both full names over the pinned `TauCeti/` finds 0 hits. The pin's names are `oneFoldPfister_smul_equivalent_iff` and `twoFoldPfister_smul_equivalent_iff` (`LinearAlgebra/QuadraticForm/Witt/Round.lean:44`). The worker's citation leads list the same two names.
- The pin sentence at 146 (`a91d3aa…`) contradicts the manifest (`2fd255d9…`).
- Ownership claims that the pin refutes:
  - "The Hilbert symbol is this roadmap's, in both halves" (2174) and "the frozen declaration `hilbertSymbol_eq_cohomological`" (2180): `TauCeti.hilbertSymbol` (`NumberTheory/HilbertSymbol/Basic.lean:47`) and `TauCeti.hilbertSymbol_eq_cohomological` (`MuTwo/LocalSymbol.lean:191`) are native.
  - "canonical owner of the Kummer-cup/norm-equation criterion" (2824): `TauCeti.cup_kummerClass_eq_zero_iff` (`MuTwo/CupNorm.lean:103`) is native.
  - "`hilbertSymbol_productFormula`, exported to Global Quadratic Forms" (866): `TauCeti.hilbertSymbol_productFormula` (`NumberTheory/QuadraticForm/Global/ProductFormula.lean:67`) is native.
  - `exists_finiteGalois_splittingField` "is a target here and not an assumption" (2623–2626): `Algebra/CentralSimple/FiniteGalois.lean` has it.

Repair: each such sentence either says "Tau Ceti's, consumed" with the pin-true file, or is deleted. The two Pfister names become the pin's `_iff` names. The pin sentence goes with R05.

## R07 (P3) — Gate text rules

Location: my gate run at this head prints `set_option=51 … tex=14 … sorry-data=9 sorry-examples=10 … imports=1 … readme-ids-missing=11 … FAIL`, identical to the worker's line:

- `tex`: README 774, 1459, 1461, 1701, 2023, 2041, 2051, 2258, 2558, 3153–3154, 3294.
- `readme-ids-missing`: `brauerCohomologyEquiv_baseChange`, `discr_baseChange`, `discr_one_elem_eq_of_sq_algebraMap`, `finrank_adjoin_simple_eq_two_of_sq_mem_notMem`, `hilbertSymbol_mul_right`, `map_ker_reₗ_of_algEquiv`, `map_norm_unitFiltration_zero`, `signedDiscr_add`, `signedDiscr_mk_rankOne_mul`, `signedDiscr_mul`, `sw1Class_traceTransfer_mk_rankOne`.
- `sorry-examples`: `Suggested.lean` 1411, 1416, 1421, 1434, 1439, 2774, 2786, 2814, 2822, 3830.

Witness: the flagged identifiers are supplier or Tau Ceti names written without their namespace. Re-opened this round: `TauCeti.hilbertSymbol_mul_right` at `Bimultiplicativity.lean:97`. The other locations are carried from the previous report: `signedDiscr_mul` at `RegularFormClass/Discriminant.lean:321`, `map_norm_unitFiltration_zero` at `Completed/LocalFieldsRamification/Suggested.lean:857`.

Repair: put the 14 displays in code spans. Prefix the eleven names with their namespace, or state the fact in prose. Delete the ten admitted examples: their content is native (R02).

## R08 (P3) — Garbled text and README shape

Location:

- Sublayer labels fused to the preceding word: README 2167–2171 ("The full6B defect", "the classical6D … do6E/7B"), 2217 and 2225 ("direct6B", "of6B"), 3486–3490 ("Layer 6 first consumes6A", "feed6D", "the6C table outputs").
- The house headings are absent. The README's `## ` headings run `Completion audit`, `Suggested homes`, `Scope`, …, `Ownership and coordination`; there is no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` or `## How to read the build`.
- `grep -c 'Needs:'` prints 0, and no layer has `### Examples` or `### Dependencies`.

Witness: the house shape in the brief, and `TauCetiRoadmap/ClassFieldTheory/README.md` on main.

Repair: restore the spaces. Rewrite 2167–2171 as prose targets with `*Needs:*` lines, putting the four Tau Ceti declarations in backticks with their hypotheses. Move the README toward the house shape.

## R09 (P3) — The elaboration has two warnings besides `sorry`

Location: `Suggested.lean` 3332:77 and 3333:16, inside `pinDiagonalLift_mul` (3319–3335).

Witness: `lake env lean` on `Suggested.lean` at this head, run this round: exit 0 in 68 s, 136 `declaration uses sorry`, plus `Unused tactic linter: <;> can be removed` at 3332:77 and 3333:16. The worker's build lists the same two.

Repair: remove the two redundant `<;>`, or delete the Pin-model block with R02.

## Previous findings

- R01 — not repaired: `Suggested.lean` 2–4 still import the three roadmap modules; `cup11` (1510), `sw2Class` (2690), `galoisEvens2` (2970) and the headlines (3723, 3792) still sit on ProfiniteCohomology's sorry'd `cup`, `f2Pairing`, `galoisF2Iso`. Consumer note updated: IntegralLattices on main no longer imports this module.
- R02 — not repaired: 136 sorried declarations; seven of the seven probed close with the native term (probe re-run this round, exit 0, 129 sorry warnings). Keep-list updated to GlobalQuadraticForms' uses on main.
- R03 — not repaired: no statement of the `(dim, d, s)` classification; `Classification.lean:132` at the pin states it.
- R04 — not repaired: nine `def`/`instance` bodies are `sorry` (822, 864, 971, 1569, 1619, 1835, 1862, 2353, 2358); 51 `set_option … in` lines, from 1981 to 3552.
- R05 — not repaired: README 35 "Audit status: incomplete. This roadmap remains active."; 146 the `a91d3aa…` pin; 169 `/absolute/path/to/that/file.lean`; 330 `#print axioms`; 3618–3626 the private ledger.
- R06 — not repaired: `NormControl.lean` and `RegularFormClass/Matrix.lean` absent at the pin; the two `_of_mem_unitValueSet` names at 1603–1604; the ownership sentences at 866, 2174, 2180, 2623–2626, 2824.
- R07 — not repaired: the gate's line is identical: `set_option=51 tex=14 sorry-data=9 sorry-examples=10 imports=1 readme-ids-missing=11 FAIL`.
- R08 — not repaired: README 2171 "The full6B defect …", 3486 "Layer 6 first consumes6A"; the four house headings and the `*Needs:*` lines are absent.
- R09 — not repaired: the two `<;>` at 3332:77 and 3333:16 still trigger the unused-tactic linter.

## Verified sound

**The change.**

- `git diff --stat 11a9ca13 HEAD -- TauCetiRoadmap/QuadraticFormInvariants` is empty. `git diff --stat 11a9ca13 HEAD` lists 2 files (1915 insertions, 5144 deletions), both in `TauCetiRoadmap/AlgebraicTopology/`, a folder this brief names as the pull request's own. `grep -c` of `QuadraticFormInvariants|hilbertSymbol|StiefelWhitney|quaternionClass|QuadraticForm` over that diff prints 0, and this README and `Suggested.lean` never mention AlgebraicTopology.
- `git diff --stat origin/main...HEAD` outside the five folders named in the brief is empty. `lake-manifest.json` and `lean-toolchain` are unchanged against `origin/main`.
- Against the merge base `eaf17b10`, the pull request's change to this folder is the deletion of `NativeCompletion.md` (182 lines) and the README insertion at 152–332 (plus a 3-hunk relinking at 112–125). `Suggested.lean` is unchanged.
- The three imported supplier modules differ from `origin/main` only in ProfiniteCohomology's generated `PROGRESS.md` and `STATUS.md`; the three `Suggested.lean` files are identical to main.

**Gate and dependency check.**

- My gate run at this head (`--base origin/main`, 6 s) prints `set_option=51 blob=0 latex=0 tex=14 prnum=0 sorry-data=9 sorry-examples=10 residue=0 private-paths=0 imports=1 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=11 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=50 source-material=0 FAIL`.
- Every listed `outside-folder` line lies under `AlgebraicTopology/` or `GeometricTopology/`, both named in the brief as the pull request's own; none falls outside the five named folders.
- `gate --depcheck … --movable` prints `depcheck: 230 roadmaps, 2326 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean` from the worktree at this head and pin: exit 0 in 68 s, 136 `declaration uses sorry` warnings, the two unused-tactic warnings of R09, no error. No signature changed since the last `#check` comparison (the folder has been byte-identical since `6cec06f`), so that step is carried from the previous reports. The worker's `signatures.md` failed on the harvester's module path (`unknown module prefix 'TauCetiRoadmap'`), not on the file.

**Padding probe, re-run.** A scratch copy with the seven sorries at 563, 570, 578, 1192, 1197, 1211, 1235 each replaced by one native term (`diff` shows exactly 7 changed lines): exit 0 in 86 s, 129 sorry warnings, no error.

**Seeded sample** (each passage re-read at this head):

- "Audit status: incomplete. This roadmap remains active" (README 35): process text (R05). The pin claims around it are R06.
- "From the local-fields-ramification roadmap" (833): the contract names `normalizedValuation`, `unitFiltration`, `natCastValuation`, `UnitFiltrationGraded`, `ramificationIndex`, `inertiaDegree`, `absoluteRamificationIndex` and `teichmuller` as abbreviations of Tau Ceti's declarations. `Completed/LocalFieldsRamification/Suggested.lean` is identical to main, and the names resolved in earlier rounds are unchanged.
- "From the class-field-theory roadmap" (860): the table rows `H`, `muNRep`, `kummerClass`, `localSymbol`, `tateDualityPairing_perfect_mixed` and `hilbertProductFormula` are unchanged. The worker's leads `muNRepCoeffDictionary` (884) and `absoluteGaloisGroupComparison` (889) are ClassFieldTheory declarations, not library ones, so not defects. The "exported to Global Quadratic Forms" row (866) is R06.
- "From the profinite-cohomology roadmap" (898): the "abbreviations of Tau Ceti's declarations" claim fails for `cup`, `inhomogeneousCochain2`, `f2Pairing`, `homClass` and `galoisF2Iso`, which are sorry'd in the supplier at 3868, 5145, 5332, 5537, 5846 (R01).
- "The Hilbert symbol is this roadmap's, in both halves" (2174) and "This sublayer is the canonical owner of the Kummer-cup/norm-equation criterion" (2824): the mathematics is correct, and native at the pin. The ownership sentences are refuted (R06).
- "Compatibility with the cup product" (2458–2464): the two-step argument (`ι [(a,b)] = (a) ∪ (b)` and `ε (hasseInvariant q) = localHasse q`, hence `(a) ∪ (b) = 0 ⇔ (a,b)_K = +1`) agrees with the native `TauCeti.cup_kummerClass_eq_zero_iff` (`MuTwo/CupNorm.lean:103`) and with the adversarial row for `(a)` a square below.

**Sources re-read this round in the cache.**

- `kahn1984` line 55, Théorème 2: the transfer formula `w(T(q)) = N(w(q))·w(T(1))^r` with `r` the rank of `q`.
- `serre1984cmh` lines 560–562, Théorème 1′: `w₂(Q_E)` carries the term `(2)(d_E)`, with the remark that `d_E`, not `d(Q_E)`, enters.
- `kozlowski1984` lines 34–41, Theorem 1.1: the transfer for 2-coverings commutes with the total Stiefel–Whitney class.

Each matches the README statement that cites it. No `needs-references.toml` was written.

**Library declarations opened at `2fd255d9` this round** (files under `TauCeti/`):

- `FieldTheory/QuadraticForm/StiefelWhitney/Evens/Kummer/Value.lean:182,220`; `StiefelWhitney/QuadraticExtension.lean:249`;
- `NumberTheory/LocalField/QuadraticForm/Classification.lean:132`; `Bimultiplicativity.lean:97`;
- `GaloisCohomology/MuTwo/CupNorm.lean:103`; `MuTwo/LocalSymbol.lean:191`; `MuTwo/Basic.lean:668`;
- `NumberTheory/HilbertSymbol/Basic.lean:47`; `NumberTheory/QuadraticForm/Global/ProductFormula.lean:67`;
- `Algebra/Quaternion/BrauerClass.lean:173`; `Algebra/CrossedProduct/Comparison.lean:274`, `TwoTorsion.lean:152`, `Splitting/Basic.lean:321`;
- `LinearAlgebra/QuadraticForm/Witt/Clifford.lean:142,187`; `Witt/Round.lean:44`.

Confirmed absent: `NormControl.lean` and `RegularFormClass/Matrix.lean` (by `ls`), and the two `_of_mem_unitValueSet` names (by `grep -rn`, 0 hits).

**Consumers and overlaps.**

- On main at `ad30d944`, `GlobalQuadraticForms/Suggested.lean` imports this module (line 5) and uses the names listed in R02.
- `IntegralLattices` was revised on main after the merge base (`47fc6a3c`). Its `Suggested.lean` there has no import of or reference to this namespace, and its README cites `hilbertSymbol_productFormula` and Layer 6D by name only (476, 1027, 2229, 2305); both ids exist in this README.
- The open GlobalQuadraticForms revision's `Suggested.lean` imports only `Mathlib` and `TauCeti.*`, and QuadraticFormInvariantsPartII's `Suggested.lean` does not use this namespace.
- Overlap leads: no dropped id, no id defined only by an open revision, no second owner. The other open pull request touching this folder is the Tau Ceti bump #1187, which conflicts in `Suggested.lean`; as in the previous review, whichever merges second rebases, and the two share no target.
- The board's packages index lists no quadratic-form package.

**Adversarial table.** No statement changed since `6cec06f`, so the rows carry the previous report's values; the probe row is this report's re-run.

| Statement | Instances | Values | Result | Source of row |
|---|---|---|---|---|
| `hasseInvariant_smul` (632) | general `n`; `n = 0, 1, 2` | `∏_{i<j}(λa_i,λa_j) = (λ,λ)^{C(n,2)}·(λ,∏_{i<j}a_ia_j)·s(q)`, `∏_{i<j}a_ia_j = d^{n−1}`, `(λ,λ) = (λ,−1)`; `n = 2`: `(λa,λb) = (λ,−1)(λ,ab)(a,b)` | holds | previous report |
| `hasseInvariant_append` (622) | `⟨a⟩ ⊥ ⟨b⟩` | lhs `(a,b)`; rhs `1·1·(a,b)` | holds | previous report |
| `cliffordInvariant_eq` (777) | `⟨1,…,1⟩` over ℝ, `n = 1..8` | predicted `1,1,[ℍ],[ℍ],[ℍ],[ℍ],1,1`; actual `ℝ, M₂(ℝ), ℍ, M₂(ℍ), M₂(ℍ), M₄(ℍ), M₈(ℝ), M₁₆(ℝ)` | holds | previous report |
| `signedDiscr_mk` (483) | `⟨1,−1⟩` | `(−1)^1·(−1) = 1 = d±(ℍ)` | holds | previous report |
| `exists_of_realization` (1319) | `n = 1, s = −1`; `n = 2, d = [−1], s = −1`; `(2,[1],−1)` over ℚ₂ | first two excluded by `h₁`, `h₂`; `⟨−1,−1⟩`: `d = 1`, `s = (−1,−1)_{ℚ₂} = −1` | holds | previous report |
| `localHasse_of_discr_neg_one` | `⟨a,−a⟩` | `(a,−a) = 1` by `−a = 0² − a·1²` | holds | previous report |
| Serre's ℚ₂ formula (1396), README 2293 table | `(2,5)`, `(−1,−1)`, `(5,5)`, `(2,−1)`, `(−1,5)`, `(2,2)`, `(−1,2)` | `ε(1,3,5,7) = 0,1,0,1`, `ω = 0,1,1,0`; values `−1,−1,+1,+1,+1,+1,+1` | holds | previous report |
| Odd-residue formula (1276, README 2258) | `a = π^α u`, `b = π^β u'` | `(π,π)^{αβ}(π,u')^α(u,π)^β(u,u')`, `(u,u') = 1`, `(π,π) = (π,−1)` | holds | previous report |
| Bimultiplicativity over a general field (README 2341) | `K = ℚ`, `a = −1`, `b = 3`, `c = 7` | `3, 7` not sums of two squares, `21` not either | fails, as the README says | previous report |
| `defectExponent_unit` (1120) | ℚ₂: `u = 5, −1, 3`; `e = 0` | `δ = 2 = 2e`; `δ = 1`; `δ = 1`; `e = 0`: `δ = 0` | holds | previous report |
| `unitNorm_iff_integralBasis_families` (1150) | `K = ℚ₂(π)`, `π² = 2`, `a = 5` | `(π+½)² − 5·¼ = 1 + π`, a unit | holds | previous report |
| `card_squareClass_of_dyadic` (994) | ℚ₂; ℚ₂(√2) | `4·2¹ = 8`; `16 = 2^{2+2}` | holds | previous report |
| `cup_kummerClass_eq_zero_iff` (2462), `hilbertSymbol_eq_cohomological` (2552) | `a` a square | `(a) = 0 ⇒ cup = 0 ⇒ b = 1² − a·0²`, symbol `+1` | holds; native | previous report |
| 6E milestone 1 (1358) | `Q(K) = {1,[D]}`; ℚ | `ε` injective iff `|Q(K)| ≤ 2`; false over ℚ | holds under its hypotheses | previous report |
| `brauer2EquivH2_cliffordInvariant` (2763) | `n = 3` | `w₂ + 1·((−1)∪d) + 1·((−1)∪(−1))` | holds | previous report |
| `sw_append` (2746) | `⟨a⟩ ⊥ ⟨b⟩` | lhs `(a)∪(b)`; rhs `0 + 0 + (a)∪(b)` | holds | previous report |
| `discr_traceTransfer` (2896) | `a = 1`; `a = x` | `Tr_*⟨1⟩ = ⟨2,2d⟩`; `Tr(x(u+vx)²) = 4duv`, hyperbolic | holds | previous report |
| `galoisEvens2_kummerClass` (3723) | ℚ₂, `d = −1`, `a = 1+2i` | `(2)∪(−1) = 0`; `(2)∪(5) ≠ 0` | holds; native `Value.lean:220` | previous report |
| Relative formula, degree 2 (3792) | general `a`; `Tr a = 0` | rhs `(2)∪(d) + N((a)) + (d)∪(N a)`; trace zero: `0 = (2)∪(d) + (2)∪(d)` | holds; native `QuadraticExtension.lean:249` | previous report |
| `cup11_comm` (1521) | bidegree `(1,1)`, `𝔽₂` | sign `(−1)^{1·1} = +1` | holds (on the opaque cup, R01) | previous report |
| `kummerCharacter` homomorphism (3400) | `g r = ±r`, `h r = ±r` | `rootSign(gh) = rootSign g + rootSign h` in all four cases | holds | previous report |
| Pin model (3116–3335), `pinE1_mul_pinT_pow_four` (3229) | `e₁ = diag(1,−1)`, `r2² = 2` | `(e₁·pinT)² = [[0,−1],[1,0]]`; fourth power `−I` | holds | previous report |
| `galoisRes2_eq_zero_iff` (3083) | `L = K(√d)` | `ker(res) = (d) ∪ H¹(G_K)` | holds | previous report |
| README 2410 negative control | ℝ: `⟨1,1,1,1⟩`, `⟨−1,−1,−1,−1⟩` | `d = 1, 1`; `s = 1, 1`; signatures `4, −4` | holds | previous report |
| `dyadicLevel_eq_absoluteRamificationIndex` (919) | ℚ₂; ℚ₂(√2); ℚ₃ | `v(2) = 1 = e`; `v(2) = 2 = e`; ℚ₃ admits no `Algebra ℚ_[2] K` | holds | previous report |
| `hilbertSymbol_mul` (1233), `quaternionClass_symm/_sq/_mul` (561–578), `hilbertSymbol_congr_sq/_neg_self/_comm` (1190–1210): probe | `[Invertible (2 : K)]`, `a b c : Kˣ` | each closes with the native term; `Invertible.ne_zero (2 : K)` supplies `(2 : K) ≠ 0`; copy: exit 0, 129 sorry warnings | hold, native at `2fd255d9` | this report (re-run) |

## Not verifiable

- T. Y. Lam, *Introduction to Quadratic Forms over Fields*; O'Meara (`omeara1963`); Scharlau (`scharlau1985`); Gille–Szamuely, *Central Simple Algebras and Galois Cohomology*: no legal copy in the cache (paywalled). The statements cited to them were checked by computation and against the pinned Tau Ceti files.
- `serre1973cia`, `serre1979lf`, `milnor1970`: settled as uncertified and cited by locator.
- Ownership against open pull requests: checked through the brief's sibling checkouts, the overlap leads and the board's packages index. No other quadratic-form-invariants owner was found. Nothing changed in the folder, so no new object was searched for.

## Source issues

- none
