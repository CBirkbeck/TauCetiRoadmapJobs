# Review of GeometryOfNumbersAndQuadraticArithmetic (pull request #851 at cb1195a)

**Verdict:** needs changes

Incremental re-review of the 8 lines changed since cd2b780 (README only: the semidefinite Check of §1.2.13a, the converse route and *Needs* line of 1.2.14, the *Needs* line of 6.4.2a). The gate still fails on this head for the same four reasons as before: the acceptance test imports another roadmap's module (`imports=1`), and the dependency check prints three UPWARD lines and one CYCLE line. The targeted elaboration passes (24 `sorry` warnings, no error). Of the five previous findings, the two P3 ones are repaired by this change set and the three blocking ones (the supply cycle, the roadmap import, the upward edges) are untouched. The rewritten passages are correct; this round adds no new finding.

## R01 (P1) — Supply cycle through OrthogonalSpinGroups and OrthogonalTamagawaAndLatticeMass, not repaired

Location: `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md` line 29 ("§3.3 is the canonical owner of `orthogonalTamagawa_two` over number fields, the orthogonal gauges … and `smoothMaximalOrthogonalModel`"), lines 122–124 (supplier section "From TauCetiRoadmap.OrthogonalSpinGroups"), line 1044.

Claim: this roadmap consumes OrthogonalSpinGroups 1D, 2F and 3F and owns the orthogonal Tamagawa number and the maximal-lattice models that OrthogonalTamagawaAndLatticeMass consumes.

Witness: the dependency check at this head prints `CYCLE among: GeometryOfNumbersAndQuadraticArithmetic, OrthogonalSpinGroups, OrthogonalTamagawaAndLatticeMass`. OrthogonalSpinGroups on main, README line 30, still names OrthogonalTamagawaAndLatticeMass "the single named owner" of the Tamagawa half; OrthogonalTamagawaAndLatticeMass at its open head, README line 11, still consumes "GeometryOfNumbersAndQuadraticArithmetic §§2.4/3.3" and says "§3.3 owns orthogonalTamagawa_two". None of these lines changed in this change set.

Repair: as in the previous two reports. Either hand `orthogonalTamagawa_two`, the gauges, `smoothMaximalOrthogonalModel`, the dyadic maximal-lattice congruence theory and the maximal-lattice mass formula to OrthogonalTamagawaAndLatticeMass (listing them under *Scope and ownership* as deferred there and keeping only the finite stabilizers, class-set finiteness and the genus mass here), or keep §3.3 and cite Tau Ceti's `CliffordAlgebra.spinorNorm` and `OrthogonalCompactOpens.adelicSpinorNorm` directly in 2.4 so that OrthogonalSpinGroups is no longer a supplier; in either case the ownership statement on OrthogonalSpinGroups main line 30 has to be reconciled. Rerun the dependency check; it must print no CYCLE line.

## R02 (P2) — `Suggested.lean` imports another roadmap's module, not repaired

Location: `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/Suggested.lean` line 5 (`import TauCetiRoadmap.SuccessiveMinima.Suggested`), used at lines 171, 191, 371, 380; README lines 57–77 (*Headline signatures*).

Claim: the file states the headline theorems against the pinned Mathlib and Tau Ceti.

Witness: the gate at this head prints `imports (1)` with the rule "only the individual `TauCeti.*` modules"; the pinned Tau Ceti `a91d3aa` has no `TauCeti/Algebra/Module/ZLattice/SuccessiveMinima.lean`, and `successiveMin` exists only in SuccessiveMinima's own `Suggested.lean` (its line 156). The Lean file is byte-identical to the one the previous review read.

Repair: delete line 5; remove `prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`, `lattice_count_lt_successive_minima`, `euclidean_dual_transference_upper` and `covering_dual_transference` from the file (the README keeps 1.3.3, 4.1.12, 4.4.13 and 4.4.14 as targets) and name them in the module docstring as not statable at the pins because the successive-minima carrier is SuccessiveMinima's; update the *Headline signatures* paragraph. The rest of the file elaborates with `import Mathlib` plus the three `TauCeti.*` lines.

## R03 (P2) — Three upward supplier edges remain in the merge order

Location: `README.md` lines 138, 140, 2239, 2241, 2244, 3154 (AlgebraicKTheory); 178, 180, 2276, 2278, 3190, 3192 (HomotopySpheres); 170, 228, 229, 1139 (LFunctions).

Claim: every supplier cited precedes this roadmap.

Witness: the dependency check (full text under *Verified sound*) prints UPWARD edges to AlgebraicKTheory (#275), HomotopySpheres (#219) and LFunctions (#270) against this roadmap's position #54, and `not movable` because EffectiveBoundsPartII (#81) consumes this roadmap. The cited lines did not change in this change set.

Repair (author side): state the consumed notions here as targets where they are small (the low-degree matrix and patching interfaces of AlgebraicKTheory A0–A2/A5/A6 used in §6.1.7 and §6.10; the real Bott chain and local-coefficient inputs of HomotopySpheres used in §6.10a; the completed Dedekind zeta interface of LFunctions §0/§3 used in §3.3), recording each move under *Scope and ownership*; or leave the ordering to the board and say so in the pull request. Rerun the dependency check after the edit.

## Previous findings

- R01 — not repaired: README line 29 still makes §3.3 "the canonical owner of `orthogonalTamagawa_two`", lines 122–124 still consume OrthogonalSpinGroups 1D/2F/3F; the dependency check prints the same CYCLE line.
- R02 — not repaired: `Suggested.lean` line 5 still reads `import TauCetiRoadmap.SuccessiveMinima.Suggested`; the gate reports `imports (1)`; the Lean file is unchanged since cd2b780.
- R03 — not repaired: the same three UPWARD edges (AlgebraicKTheory, HomotopySpheres, LFunctions) print at the same README lines; still "not movable" because EffectiveBoundsPartII consumes this roadmap.
- R04 — repaired: README line 425 now reads "For the semidefinite Gram matrix `diag(0,4)` both `λ_0^sq` and `min L` are `0`, attained by the nonzero vector `e₁`, while `λ_1^sq = 4` … For the indefinite Gram matrix `[−1]` no nonzero vector has a natural norm, so `min L` is the junk value `0`". Both claims recomputed below against Tau Ceti `IntegralLattice.minimum` at the pin.
- R05 — repaired: 1.2.14's route now reads "SuccessiveMinima 1.4 at `r = λ` gives `i+1 ≤ dim span(e(L) ∩ closedBall(0,λ))`" and its *Needs* lists "SuccessiveMinima 1.4 `successiveMin_le_iff_finrank` (at `r = √N` and at `r = λ`)"; 1.5 and index monotonicity are no longer used. 6.4.2a's *Needs* (line 2529) is now "6.4 `ExactW0`, 2.1.1, QuadraticFormInvariants Layer 4"; the `IntegralQuadraticLattice.ofCarrier` leftover is gone.

## Verified sound

**Gate and build.** The gate rerun on this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=1 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=4 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`, the failures being the one import line and the four dependency lines below. I elaborated `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/Suggested.lean` with `lake env lean` from the worktree: 24 `declaration uses 'sorry'` warnings, no error. `git diff --stat origin/main...HEAD` outside the folder is empty. `git diff cd2b780 HEAD` on `Suggested.lean` is empty: the change set is README-only.

**Dependency check** (`gate --depcheck … --movable`), verbatim:

```text
not movable: GeometryOfNumbersAndQuadraticArithmetic consumes AlgebraicKTheory (#275) and is consumed by EffectiveBoundsPartII (#81), which comes first: moving GeometryOfNumbersAndQuadraticArithmetic after AlgebraicKTheory would put a supplier after a consumer, a cycle through GeometryOfNumbersAndQuadraticArithmetic
UPWARD: GeometryOfNumbersAndQuadraticArithmetic (#54) -> AlgebraicKTheory (#275) at README lines [138, 140, 2239, 2241, 2244, 3154]
UPWARD: GeometryOfNumbersAndQuadraticArithmetic (#54) -> HomotopySpheres (#219) at README lines [178, 180, 2276, 2278, 3190, 3192]
UPWARD: GeometryOfNumbersAndQuadraticArithmetic (#54) -> LFunctions (#270) at README lines [170, 228, 229, 1139]
CYCLE among: GeometryOfNumbersAndQuadraticArithmetic, OrthogonalSpinGroups, OrthogonalTamagawaAndLatticeMass
depcheck: 201 roadmaps, 1326 edges, 4 problem(s)
```

**Signature check.** The Lean file is unchanged, so no statement could have lost a binder since the previous check; I nonetheless re-elaborated a scratch copy with `#check @<name>` appended for all 40 declarations: no error, the 24 `sorry` warnings only, and the elaborated type of `prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume` still carries `[FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]`, `[DiscreteTopology L] [IsZLattice ℝ L]`, the symmetry hypothesis and the Haar hypothesis, which is README 1.3.3. The one-tactic padding probe of the full review (no theorem closes) carries over unchanged. No `set_option`, no `lemma`, no sorried data (41 declarations, 24 theorems).

**Library declarations opened at the pull request's pins.** Tau Ceti `a91d3aa`: `IntegralLattice.integralNorm` (`TauCeti/LinearAlgebra/IntegralLattice/Norm.lean` line 94, a `QuadraticForm ℤ L`, so integer-valued); `IntegralLattice.minimum` (`PosDef/Minimum.lean` line 81, `sInf {k : ℕ | ∃ x : L, x ≠ 0 ∧ L.integralNorm x = k}`, a natural-number infimum), `minimum_def` (line 86), `minimum_eq_zero_of_subsingleton` (line 92), `IsPosSemidef.exists_ne_zero_integralNorm_eq_minimum` (line 103, uses `Int.toNat` of the nonnegative norm), `IsPosSemidef.isLeast_minimum` (line 123). Mathlib `6b7abb3`: `Int.le_floor` (`Mathlib/Algebra/Order/Floor/Defs.lean` line 291, `z ≤ ⌊a⌋ ↔ (z : α) ≤ a`), `Real.sInf_nonneg` (`Mathlib/Algebra/Order/Archimedean/Real/Basic.lean` line 258). Both names in the rewritten *Needs* line of 1.2.14 exist at the pin.

**Cross-roadmap citations resolved this round.** SuccessiveMinima on main, `Suggested.lean` line 269: `successiveMin_le_iff_finrank (i : Fin (finrank ℝ E)) (r : ℝ) (hr : 0 ≤ r) : successiveMin L K i ≤ r ↔ i.val + 1 ≤ finrank ℝ (span ℝ (L ∩ r • K))`, which is the "threshold form 1.4" the new route uses at `r = √N` and at `r = λ`; its line 275 `exists_successiveMin_witnesses` is no longer cited by 1.2.14. IntegralLattices §2F on main (README lines 801–811, unchanged). This roadmap's own 2.1.1 (README line 486) and `ExactW0` 6.4.2 (line 2513), both cited by 6.4.2a's new *Needs* line, exist and precede 6.4.2a in the build. OrthogonalSpinGroups main line 30 and OrthogonalTamagawaAndLatticeMass open head line 11 reread for R01. Ownership against open pull requests without a path in the brief was not re-checked this round; the changed lines introduce no new object.

**Seeded sample.** None of the fifteen sampled sections (0.2, 0.3, 2.1, 2.2, 2.6, 2.7, 3.1, 4.3, 4.4, 4.6, 6.1a, 6.2, 6.5, 6.10a, 6.11) is touched by the diff; the only overlap is 6.4.2a's citation of 2.1.1 (sampled section 2.1), checked above. The README flags no locator as unverified. The sampled locators were verified in the full review and the r3/r4 rounds and carry over.

**Adversarial table.** New rows for every changed statement; rows for untouched statements are carried from the previous report (r4, itself carrying r3) with their values.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 1.2.13a semidefinite Check (new text) | Gram `diag(0,4)`: `λ_0^sq`, `min L`, `λ_1^sq` | `e₁` has norm `0`, so `λ_0^sq = 0` (one independent vector of norm `≤ 0`) and `min L = sInf{k : ℕ ∣ ∃ x ≠ 0, norm x = k} ∋ 0`, so `0`. Two independent `(a,b),(c,d)` have `ad − bc ≠ 0`, so `b, d` not both `0`; norms `4b², 4d²`, max `≥ 4`, and `e₁, e₂` give `(0,4)`: `λ_1^sq = 4` | all three values as stated | none |
| 1.2.13a indefinite Check (new text) | Gram `[−1]` | nonzero `x = a` has `integralNorm = −a² < 0`, never a natural; the set is empty; `Nat.sInf ∅ = 0` | junk value `0` as stated | none |
| 1.2.13a vs IntegralLattices §2F | carried from r4 | a set spans rank ≥ i iff it contains i independent vectors; zero-based `i : Fin n` ↔ `1 ≤ i ≤ n` | same object | none |
| 1.2.14 `sqSuccessiveMin_eq_sq_successiveMin` | Gram `[4]`, unit ball; `diag(1,4)`; `I₂`; `A₂` | carried from r4: `2² = 4`; `(1,2)² = (1,4)`; `(1,1)`; `(√2,√2)² = (2,2)` | holds | none |
| 1.2.14 route (new text) | forward at `r = √N`; converse at `r = λ`; `λ = 0` edge | forward: threshold at `N` gives `i+1` ℤ-independent `x` with `B(x,x) ≤ N`, so `‖e x‖ ≤ √N`, `√N ≥ 0`, 1.4 gives `λ ≤ √N`, `λ² ≤ N`. Converse: `λ ≥ 0` (`Real.sInf_nonneg`), `λ ≤ λ`, 1.4 at `r = λ` gives `i+1 ≤ dim span(e(L) ∩ λ·ball)`, hence `i+1` ℝ-independent lattice vectors with `‖v‖ ≤ λ`, `B(x,x) = ‖v‖² ≤ λ²`, integers, so `≤ ⌊λ²⌋` (`Int.le_floor`), threshold at `⌊λ²⌋` gives `N ≤ ⌊λ²⌋ ≤ λ²`. At `λ = 0` the converse gives `N ≤ 0`, consistent with positivity not being used | route closes with 1.4 alone; 1.5 and 1.3.2 no longer needed | none |
| 6.4.2a *Needs* (new line) | inputs of the sketch | `ExactW0` (6.4.2, line 2513) for the source, 2.1.1 (line 486) for the hyperbolic-plane match, QuadraticFormInvariants Layer 4 for `WittRing K`; no integral lattice appears in the statement | every input listed, nothing superfluous | none |
| 6.4.2a `W₀` vs Witt ring | carried from r4 | `(ℝ, 2xy) ↦ ⟨1⟩`; `H(K) ↦ xy`, class 0; `𝔽₃`: `⟨1⟩ ≠ ⟨2⟩ = ⟨−1⟩` in `W(𝔽₃) ≅ ℤ/4`; zero space `↦ 0`; wrong model `B ↦ B(x,x)` sends `2xy ↦ ⟨2⟩`, excluded by the third Check | holds | none |
| 1.3.3 upper Minkowski | carried from r4 | `(1/3)·1·12 = 4 = 2²·1`; cross-polytope `2 < 4`; `d = 0` both sides `μ(0-space)`; empty interior gives LHS `0` | holds | R02 |
| 4.5.1 `StarBody` locator | carried from r4 | Definitions 3–4, pp.156–157 | correct | none |
| 5.1 `IsLLLReduced` | carried from r3 | `μ = 1/2`, `1 ≥ (3/4−1/4)·1`; `1 ≥ 3` fails; `1 ≥ 2` fails | holds | none |
| 0.2.1 adapted basis | carried from r3 | det 1; det 2y even | holds | none |
| 0.2.3 Gram block product | carried from r3 | 1 = 2·(1/2); Gram det 1; 1 = 1·1 | holds | none |
| 0.2.4 biorthogonal Gram | carried from r3 | 1; 1; 16 ≠ 1 | holds | none |
| 0.2.5 dual of projection | carried from r3 | (1/2)ℤ ≠ 2ℤ; ⟨y,πx⟩ = ⟨y,x⟩ | holds | none |
| 0.3.1 `covolume_projection` | carried from r3 | 1/√2; 3 = 6/2; 1; covol Δ | holds | none |
| 0.3.3 `primitive_orthogonal_covolume` | carried from r3 | √5, √5; √2, √2 | holds | none |
| 1.3.1 positivity | carried from r3 | 1 > 0; junk 0; junk 0 | holds | none |
| 1.3.2 monotonicity | carried from r3 | (1/3,1); all 1; (1,0) | holds | none |
| 2.1.2 discriminant scaling | carried from r3 | det 2^{−n} det B, sign (−1)^{n(n−1)/2} | consistent | none |
| 2.4.5 spinor orbit | carried from r3 | norm [2]; non-square in ℚ₂; unit non-square in ℚ₃ | holds | none |
| 2.4.6 reflection | carried from r3 | det −1; image ∉ L; none | holds | none |
| 2.6.1 atomic predicate | carried from r3 | v(a)v(b) = 0 ⇔ a or b unit | matches Voight 9.8.1 | none |
| 2.6.3 | carried from r3 | v(AC−B²) = 2v(B) | holds | none |
| 2.6.4 splitting | carried from r3 | α, β integral | holds | none |
| 2.6.10 | carried from r3 | q = c − b²/(4a), cross term 0 | holds | none |
| 2.6.11 `atomic_normal_form` | carried from r3 | ⟨1⟩⊥t⟨1⟩; one binary block; exponents 0,1; r zero blocks | holds | none |
| 2.7.3 dual quotient | carried from r3 | val 3; val 2; q^{2val} | holds | none |
| 2.8.3–2.8.4 | carried from r3 | adjoint e_i ↦ a_i e_i*, inverse e_i a_i⁻¹ | holds | none |
| 3.1.1–3.1.2 counts | carried from r3 | 2; 1; 1 | holds | none |
| 3.1.3 `finite_hermitian_isometry_formula` | carried from r3 | q+1; 0; 3, 6, 36; (q²−1)(q+1) | holds | none |
| 3.2.4–3.2.7, density transform, finite Fourier count | carried from r3 | Σ(−X)^i; −m′(1) = 0, 1, 1+q; D(1) = 0 for odd a; 3/2, 1/2, (−q)^{−e} | holds | none |
| 3.3.6 proper vs ordinary mass | carried from r3 | proper = 2× ordinary | holds | none |
| `orthogonalTamagawa_two` scope | carried from r3 | rank-2 split torus τ = 1 ≠ 2 | rank ≥ 3 present | R01 |
| 4.1.12 `lattice_count_lt_successive_minima` | carried from r3 | 9 < 18; 1 < 2; 3 < 6 | holds | R02 |
| 4.1.13 `davenport_multiset_estimate` | carried from r3 | sSup ∅ = 0; error 2; count 2 vol 0; count 4 | holds | none |
| `howe_moore`, `moore_ergodicity`, Ratner 4.2.4–4.2.6, `dani_margulis_nondivergence`, `oppenheim_values` | carried from r3 | excluded by hypotheses; Dirac; orbit; T ≥ (1−ε)T; discrete values; ∣N∣ ≥ 1 | correct generality | none |
| `three_square_hurwitz`, `signedThreeSquareCount`, class-number formula, Duke exponent, harmonic Gaussian, degree-4 harmonic, Kloosterman | carried from r3 | 6,12,8,6,0; 6,12,8,0; 6,12,8,24,24; −1/28+2ε; −iξe^{−πξ²}; Δ = 0; 1−i, 1+i, −1+i | holds | none |
| 4.4.13 `euclidean_dual_transference_upper`, constants, 4.4.14 `covering_dual_transference` | carried from r3 | 1; ≤ n; 2/√3; 0.148 < 0.15; 1/2; √n/2 | holds | R02 |
| 4.5 `StarBody`, 4.5.9 `critical_lattice_exists`, 4.5.8 `mahler_relativelyCompact_iff` | carried from r3 | 2 > 1; ∣N∣ ≥ 1; hexagonal √3/2; √5; Δ = 1; first minimum → 0 | holds | none |
| 4.6.1 `siegel_mean_value` | carried from r3 | 0 vs 1 (n = 1 excluded); 2; f(0) breaks it | hypotheses load-bearing | none |
| 5.1.3–5.1.4 | carried from r3 | ratio 2; factor 1 | holds | none |
| 6.1b Checks, 6.4 FH = 1+D, 6.9.1 residue, 6.10b signatures, E16, E12 | carried from r3 | [ℤ/2] = 0; rank doubles; Ext¹ = ℤ/p; signature 8; c₂ = 1, ℤ/240; √17 ∈ ℤ₂ | holds; errata confirmed | none |

## Not verifiable

- Nothing in the changed passages: the new text cites only IntegralLattices §2F, SuccessiveMinima 1.4, Tau Ceti and Mathlib declarations and this roadmap's own 2.1.1 and 6.4.2, all resolved above; the Evertse2023 §2.3 locator is unchanged and was read in the full review. The previous report's list (Banaszczyk 1993, Iwaniec 1987, Siegel 1945 and 1935, Davenport 1951, the paywalled DOIs and books, the image-only LLL scan) stands unchanged for the untouched passages.

## Source issues

The six entries of the full review (Henk p.2 floor misprint; Voight 9.4.5, 9.8.2; Voight 2012 Example 3.14; Morris p.413; Weibel VI 10.1) were recorded there and are not repeated. New this round:

- none
