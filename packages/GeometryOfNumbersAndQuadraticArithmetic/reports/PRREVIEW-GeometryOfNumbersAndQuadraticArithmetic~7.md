# Review of GeometryOfNumbersAndQuadraticArithmetic (pull request #851 at f5de135)

**Verdict:** accepted

Incremental re-review of the 4 lines changed since 48bc9a6 (README line 35, the *Already in Mathlib or Tau Ceti* list, and line 598, the Tau Ceti comparison sentence of 2.4.2; both now state the rank-at-least-two hypothesis of the odd-prime integral spinor-norm image). The gate passes on this head (rerun: every check `0`, `OK`), the dependency check prints no UPWARD or CYCLE line, and `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/Suggested.lean` elaborates with 20 `sorry` warnings (one per theorem) and no error. The one finding of the previous report concerned a Tau Ceti declaration absent at the pin: it exists, with exactly the hypotheses the README now states, in the Tau Ceti that the content repository's main branch pins; it is absent only from the older Tau Ceti that this branch's own manifest still pins, because the branch is based on a commit before main's pin moved. That is recorded below as a P3 with a repair that touches no roadmap file.

## R01 (P3) — The branch's manifest pins a Tau Ceti older than main's, so one cited declaration resolves only at main's pin

Location: `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md` line 94 ("the odd-prime integral stabilizer image `TauCeti.QuadraticMap.map_spinorNorm_comap_integralOrthogonalSubgroup_eq_unitSquareClasses` (`TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/Integral/SpinorNorm.lean`)"), line 35 and line 598 (the same name); the branch's `lake-manifest.json`, unchanged by the pull request.

Claim: the declaration is in Tau Ceti at the pin.

Witness: the content repository's main branch (`c994070`) pins Tau Ceti `358314d`, where `TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/Integral/SpinorNorm.lean` line 367 states the theorem with hypotheses `p ≠ 2`, `[Nontrivial ι]`, an orthogonal basis `b` of unit norms, `Q.Nondegenerate`, `FiniteDimensional ℚ_[p] V`, and conclusion: the image under `spinorNorm` of the comap of `integralOrthogonalSubgroup Q b` to the special orthogonal group equals the transported `unitSquareClasses ℚ_[p]`. This is word for word the README's "its image, the unit square classes, on the proper integral isometries of an orthogonal unit-norm basis of rank at least two over `ℤ_p` for odd `p`". The branch's `lake-manifest.json` still pins Tau Ceti `a91d3aa` (merge base with main `1af36dc`), whose `Integral/` directory holds only `Basic.lean` and `Spin.lean`; the gate's targeted build does not touch the declaration since `Suggested.lean` does not import that module, so the gate cannot see the gap either way.

Repair: update the branch to main (merge or rebase; the pull request changes nothing outside the roadmap folder, so the diff is unchanged) so that the manifest the gate builds against is main's and every backticked Tau Ceti name in *From Tau Ceti* resolves at the pin the merged roadmap will be checked against. No README or Lean edit is needed; the README text is correct against main's pin.

## Previous findings

- R01 — partly repaired: the sentence at line 598 now reads "for the lattice spanned by an orthogonal basis of unit norms of rank at least two" and line 35 "of rank at least two over `ℤ_p` for odd `p`", matching the declaration at Tau Ceti `358314d` (main's pin); the name still does not resolve at this branch's pin `a91d3aa`. Raised as R01 (P3) above: the gap is the branch's stale manifest, not the roadmap text, and deleting a citation of a declaration the library has would be a duplication defect once the pin moves.

## Verified sound

**Gate and build.** The gate rerun on this head from the worktree: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. I elaborated `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/Suggested.lean` with `lake env lean` from the worktree: 20 `declaration uses sorry` warnings at lines 81, 91, 116, 141, 177, 218, 226, 260, 269, 280, 300, 311, 324, 330, 370, 398, 408, 420, 433, 452 (one per `theorem`; the file has 20), no error, exit 0. Its three `TauCeti.*` imports (`Geometry.RealAlgebraic.Semialgebraic.Basic`, `NumberTheory.HurwitzClassNumber`, `RepresentationTheory.Continuous.Unitary.Basic`) exist at both Tau Ceti pins. `git diff --stat origin/main...HEAD` outside the roadmap folder is empty; the worktree is clean at `f5de135`. The Lean file is untouched since the previous review, so the signature check and the padding probe of the previous reports carry over.

**Dependency check** (`gate --depcheck … --movable`), verbatim:

```text
depcheck: 201 roadmaps, 1323 edges, 0 problem(s)
```

**Library declarations opened.** The fifteen spinor-norm names of *From Tau Ceti* (README line 94) and line 35 were resolved by grep at both pins: `orthogonalSpinorNorm`, `range_spinToSpecialOrthogonal_eq_ker_spinorNorm`, `index_range_spinorNorm_of_finrank_eq_two_of_anisotropic`, `spinorNorm_surjective_iff_not_anisotropic_of_finrank_eq_two`, `spinorNorm_surjective_of_three_le_finrank`, `spinorNorm_eq_one_of_posDef`, `spinorNorm_eq_one_of_negDef`, `spinorNorm_surjective_of_indefinite`, `OrthogonalCompactOpens.localSpinorNormImage` (`OrthogonalGroup/SpinorNormImage.lean` line 76), `adelicSpinorNorm` (`OrthogonalGroup/AdelicSpinorNorm.lean` line 79), `adelicSpinorNorm_apply`, `adelicSpinorKernel`, `finiteAdelicSpinToSpecialOrthogonal`, `unitSquareClasses_index`: 14 resolve at `a91d3aa` and at `358314d`; `map_spinorNorm_comap_integralOrthogonalSubgroup_eq_unitSquareClasses` resolves at `358314d` only (`Integral/SpinorNorm.lean` line 367; its file docstring, lines 14–47, states the route: the integral orthogonal subgroup is generated by reflections in integral unit-norm vectors, each of unit spinor norm, and in dimension at least two a unimodular binary form represents every unit). `localSpinorNormImage_ne_unitSquareClasses_of_finrank_le_one` (`OrthogonalGroup/LowRank.lean` line 124) at both pins is the rank-at-most-one negative control.

**Source read this round.** `SchulzePillot2021v2` (arXiv 2008.12847v2, the cached OCR text): Lemma 9.19 at lines 4990–4993 (printed pp.126–127): nondyadic nonarchimedean local field, unimodular lattice on a nondegenerate space of dimension at least two, `θ(SO(F;Λ)) = R^×(F^×)²`; its proof at lines 4996–5002 uses that a unimodular lattice of rank at least two represents every unit, which is the same step the Tau Ceti file's docstring names. Definition and Lemma 9.20 at lines 5003–5012 (printed p.127): almost all local spinor norms meet the units, by Lemma 9.19 applied to the almost-everywhere unimodular localisations. Both support 2.4.2 and 2.4.3 as written, including the new rank hypothesis.

**Seeded sample.** None of the sampled sections (0.2, 1.1, 1.3, 2.3, 2.6, 2.9, 3.1, 3.2, 3.4, 4.3, 4.6, 6.8a, 6.9, 6.10a, 6.11) falls in the changed lines; their locators were read in the full review and are unchanged. The README flags no locator as unverified.

**Cross-roadmap citations.** The changed lines cite no roadmap. Ownership against open pull requests without a path in the brief was not checked; the changed lines introduce no new object.

**Adversarial table.** New rows for the two changed statements; rows for untouched statements carried from the previous report (r6, itself carrying r5, r4, r3) with their values.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Line 35 and 598: image of proper integral isometries of an orthogonal unit-norm basis of rank ≥ 2 over `ℤ_p`, `p` odd, is the unit square classes (changed) | `p = 3`, rank 2, basis `(1,0),(0,1)` of `x² + y²`; rank 1 | unit classes of `ℚ_3`: `{1, [2]}`, index 2 (`unitSquareClasses_index`); the stabilizer of `ℤ_3²` contains reflections in `(1,0)` and `(1,1)` (norms 1 and 2, both units), whose product has spinor norm `[1·2] = [2]`, so the image is all of `{1,[2]}`; rank 1: `SO` trivial, image `{1} ≠ {1,[2]}` (LowRank line 124) | hypothesis `[Nontrivial ι]` is exactly "rank ≥ 2" (ι indexes the basis) and is load-bearing; README generality equals the declaration's at `358314d` | R01 (P3, the pin) |
| 2.4.2 target vs the Tau Ceti case (changed sentence) | the hypotheses of Lemma 9.19 against the declaration | Lemma 9.19: any nondyadic local field, any unimodular lattice, dimension ≥ 2; declaration: `ℚ_p`, `p ≠ 2`, lattice spanned by an orthogonal unit-norm basis, `Nontrivial ι`; every unimodular `ℤ_p`-lattice for odd `p` has such a basis, so the declaration is the `ℚ_p` case and the target the general one | the "variant differs in one clause" rule is met | none |
| 2.4.5 Check: over `ℚ_3`, `diag(2, 1/2)` stabilizes `ℤ_3²` and has nonsquare unit norm `[2]` | carried from r6, re-read against the new rank hypothesis | `q = xy`, rank 2 unimodular; spinor norm `[q(1,1) q(1,2)] = [2]`; `2 ∉ ℤ_3^{×2}` since squares mod 3 are `{1}` | consistent with rank ≥ 2 surjectivity onto unit classes | none |
| 2.4.3 adelic form | carried from r6 | target restricted product relative to `localSpinorNormImage`; odd-`p` unimodular image is the unit classes by 9.19; `p = 2` nothing assumed | number-field form is the target, `ℚ` case is the pin | none |
| 2.4.5 "Tau Ceti computes the images over a nonarchimedean local field with `2 ≠ 0` and over `ℝ`" | carried from r6 | index 2; surjective; surjective; trivial; trivial; surjective | five names resolve at both pins | none |
| 2.4.5 *Needs* | carried from r6 | Spin image = kernel of spinor norm (Basic line 200); finite adelic `Spin → SO` over `ℚ`; AA.1; 2.4.1 | every input owned | none |
| Scope line 29 ownership | carried from r6 | planner §3.3; consumer OrthogonalTamagawaAndLatticeMass head lines 11, 41; OrthogonalSpinGroups plans neither | one planner; no cycle | none |
| *Headline signatures* paragraph | carried from r6 | 20 names; 20 theorems; 20 `sorry` warnings | README and Lean agree | none |
| Lean docstring, four formulas | carried from r6 | `(∏ λ_i) μ(K) ≤ 2^d covol`; `< 2^{d−1} ∏(⌊2/λ_i⌋ + 1)`; `λ_i(L) λ_{n+1−i}(L*) ≤ n`; `1/2 ≤ μ(L) λ_1(L*) ≤ n`; `λ_i^{sq} = λ_i²` | identical | none |
| 1.2.13a semidefinite and indefinite Checks | carried from r5 | `diag(0,4)`: `λ_0^sq = 0`, `min L = 0`, `λ_1^sq = 4`; `[−1]`: junk `0` | holds | none |
| 1.2.14 `sqSuccessiveMin_eq_sq_successiveMin` and route | carried from r5 | `2² = 4`; `(1,2)² = (1,4)`; `(1,1)`; `(√2,√2)² = (2,2)`; route via SuccessiveMinima 1.4 at `r = √N`, `r = λ` | holds | none |
| 6.4.2a *Needs* and `W₀` vs Witt ring | carried from r5 | `ExactW0`, 2.1.1, QFI Layer 4; `(ℝ,2xy) ↦ ⟨1⟩`, `H(K) ↦ 0`, `𝔽₃: ⟨1⟩ ≠ ⟨2⟩` | holds | none |
| 1.3.3 upper Minkowski | carried from r4 | `(1/3)·1·12 = 4 = 2²·1`; cross-polytope `2 < 4`; `d = 0` equal; empty interior `0` | holds; README target | none |
| 4.5.1 `StarBody` locator | carried from r4 | Definitions 3–4, pp.156–157 | correct | none |
| 5.1 `IsLLLReduced` | carried from r3 | `μ = 1/2`, `1 ≥ (3/4−1/4)·1`; `1 ≥ 3` fails; `1 ≥ 2` fails | holds | none |
| 0.2.1, 0.2.3, 0.2.4, 0.2.5 | carried from r3 | det 1, det 2y even; `1 = 2·(1/2)`; `16 ≠ 1`; `(1/2)ℤ ≠ 2ℤ` | hold | none |
| 0.3.1 `covolume_projection`, 0.3.3 `primitive_orthogonal_covolume` | carried from r3 | `1/√2`; `3 = 6/2`; `√5, √5`; `√2, √2` | hold | none |
| 1.3.1 positivity, 1.3.2 monotonicity | carried from r3 | `1 > 0`, junk `0`; `(1/3, 1)`, `(1, 0)` | hold | none |
| 2.1.2, 2.4.6, 2.6.1, 2.6.3, 2.6.4, 2.6.10, 2.6.11 `atomic_normal_form` | carried from r3 | `det 2^{−n} det B`; det −1; `v(a)v(b) = 0`; `v(AC−B²) = 2v(B)`; `⟨1⟩⊥t⟨1⟩`, exponents 0, 1 | hold | none |
| 2.7.3, 2.8.3–2.8.4, 3.1.1–3.1.3 `finite_hermitian_isometry_formula` | carried from r3 | val 3, 2, `q^{2val}`; `e_i ↦ a_i e_i^*`; `q+1`; `0`; `3, 6, 36`; `(q²−1)(q+1)` | hold | none |
| 3.2.4–3.2.7, 3.3.6, `orthogonalTamagawa_two` scope | carried from r3 | `Σ(−X)^i`; `−m′(1) = 0, 1, 1+q`; `3/2, 1/2, (−q)^{−e}`; proper = 2× ordinary; rank-2 split torus `τ = 1 ≠ 2` | hold; rank ≥ 3 present | none |
| 4.1.12 Henk bound | carried from r3 | `9 < 18`; `1 < 2`; `3 < 6` | holds; README target | none |
| 4.1.13 `davenport_multiset_estimate` | carried from r3 | `sSup ∅ = 0`; error 2; count 2 vol 0; count 4 | holds | none |
| `howe_moore`, `moore_ergodicity`, Ratner 4.2.4–4.2.6, `dani_margulis_nondivergence`, `oppenheim_values` | carried from r3 | excluded by hypotheses; Dirac; orbit; `T ≥ (1−ε)T`; discrete values; `∣N∣ ≥ 1` | correct generality | none |
| `three_square_hurwitz`, `siegel_three_square_lower_bound`, Duke exponent, harmonic Gaussian, Kloosterman | carried from r3 | `6, 12, 8, 6, 0`; `6, 12, 8, 24, 24`; `−1/28+2ε`; `−iξe^{−πξ²}`; `1−i, 1+i, −1+i` | hold | none |
| 4.4.13, 4.4.14 transference and constants | carried from r3 | `1`; `≤ n`; `2/√3`; `0.148 < 0.15`; `1/2`; `√n/2` | hold; README targets | none |
| 4.5 `StarBody`, 4.5.9 `critical_lattice_exists`, 4.5.8 `mahler_relativelyCompact_iff` | carried from r3 | `2 > 1`; hexagonal `√3/2`; `√5`; `Δ = 1`; first minimum `→ 0` | hold | none |
| 4.6.1 `siegel_mean_value`, `siegel_mean_value_nonneg` | carried from r3 | `0` vs `1` (`n = 1` excluded); `2`; `f(0)` breaks it | hypotheses load-bearing | none |
| 5.1.3–5.1.4 `lll_short_vector_factor` | carried from r3 | ratio 2; factor 1 | hold | none |
| 6.1b, 6.4 `FH = 1+D`, 6.9.1, 6.10b, E16, E12 | carried from r3 | `[ℤ/2] = 0`; rank doubles; `Ext¹ = ℤ/p`; signature 8; `c₂ = 1, ℤ/240`; `√17 ∈ ℤ₂` | hold; errata confirmed | none |

## Not verifiable

- Nothing in the changed lines: they cite one Tau Ceti declaration (opened at main's pin, file and line above) and Schulze-Pillot's lecture notes (read in the cached arXiv text). The previous reports' list for the untouched passages (Banaszczyk 1993, Iwaniec 1987, Siegel 1945 and 1935, Davenport 1951, the paywalled DOIs and books, the image-only LLL scan) stands unchanged.

## Source issues

The six entries of the full review (Henk p.2 floor misprint; Voight 9.4.5, 9.8.2; Voight 2012 Example 3.14; Morris p.413; Weibel VI 10.1) were recorded there and are not repeated. New this round:

- none
