# Review of GeometryOfNumbersAndQuadraticArithmetic (pull request #851 at cd2b780)

**Verdict:** needs changes

Incremental re-review of the 74 lines changed since 4c5dbb9. The gate still fails on this head: the acceptance test imports another roadmap's module (`imports=1`), and the dependency check prints three UPWARD lines and the same CYCLE line as before. The targeted build passes (24 `sorry` warnings, no error). Of the nine previous findings, six are repaired and one is partly repaired; the two that block (the supply cycle and the roadmap import) are untouched by this change set. The rewritten passages (§1.2.13a, 1.2.14, the removal of the §1.3 status text, the new 6.4.2a, the locator and supplier-row edits) are mathematically sound; three small defects in them are P3.

## R01 (P1) — Supply cycle through OrthogonalSpinGroups and OrthogonalTamagawaAndLatticeMass, not repaired

Location: `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md` line 29 ("§3.3 is the canonical owner of `orthogonalTamagawa_two` over number fields, the orthogonal gauges … and `smoothMaximalOrthogonalModel`"), lines 122–124 (supplier section "From TauCetiRoadmap.OrthogonalSpinGroups"), line 1044.

Claim: this roadmap consumes OrthogonalSpinGroups 1D, 2F, 3F and owns the orthogonal Tamagawa number and the maximal-lattice models that OrthogonalTamagawaAndLatticeMass consumes.

Witness: the dependency check at this head prints `CYCLE among: GeometryOfNumbersAndQuadraticArithmetic, OrthogonalSpinGroups, OrthogonalTamagawaAndLatticeMass`. OrthogonalSpinGroups on main, README line 30, still names OrthogonalTamagawaAndLatticeMass "the single named owner" of the Tamagawa number and mass formula; OrthogonalTamagawaAndLatticeMass at its open head, README line 11, still consumes "GeometryOfNumbersAndQuadraticArithmetic §§2.4/3.3". None of these lines changed since the previous review.

Repair: as in the previous report. Either hand `orthogonalTamagawa_two`, the gauges, `smoothMaximalOrthogonalModel`, the dyadic maximal-lattice congruence theory and the maximal-lattice mass formula to OrthogonalTamagawaAndLatticeMass (listing them under *Scope and ownership* as deferred there, keeping only the finite stabilizers, class-set finiteness and the genus mass here), or keep §3.3 and cite Tau Ceti's `CliffordAlgebra.spinorNorm` and `OrthogonalCompactOpens.adelicSpinorNorm` directly in 2.4 so that OrthogonalSpinGroups is no longer a supplier, and in either case resolve the ownership statement on main. Rerun the dependency check; it must print no CYCLE line.

## R02 (P2) — `Suggested.lean` imports another roadmap's module, not repaired

Location: `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/Suggested.lean` line 5 (`import TauCetiRoadmap.SuccessiveMinima.Suggested`), used at lines 171, 191, 371, 380; README lines 57–77 (*Headline signatures*).

Claim: the file states the headline theorems against the pinned Mathlib and Tau Ceti.

Witness: the gate prints `imports (1)`; the rule allows `import Mathlib` and `TauCeti.*` modules only. Neither Tau Ceti pin (the pull request's `a91d3aa`, main's `358314d`) contains `TauCeti/Algebra/Module/ZLattice/SuccessiveMinima.lean`; `successiveMin` exists only in SuccessiveMinima's own `Suggested.lean` (its line 156). The diff changed the docstrings around these theorems but not the import.

Repair: delete line 5; remove `prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`, `lattice_count_lt_successive_minima`, `euclidean_dual_transference_upper` and `covering_dual_transference` from the file (the README keeps 1.3.3, 4.1.12, 4.4.13 and 4.4.14 as targets) and name them in the module docstring as not statable at the pins because the successive-minima carrier is SuccessiveMinima's; update the *Headline signatures* paragraph. The remaining file elaborates with `import Mathlib` plus the three `TauCeti.*` lines.

## R03 (P2) — Three upward supplier edges remain in the merge order

Location: `README.md` lines 138, 140, 2239, 2241, 2244, 3154 (AlgebraicKTheory); 178, 180, 2276, 2278, 3190, 3192 (HomotopySpheres); 170, 228, 229, 1139 (LFunctions).

Claim: every supplier cited precedes this roadmap.

Witness: the dependency check (full text under *Verified sound*) prints UPWARD edges to AlgebraicKTheory (#273), HomotopySpheres (#217) and LFunctions (#268) against this roadmap's position #54, and `not movable` because EffectiveBoundsPartII (#81) consumes this roadmap. The six edges of the previous report to roadmaps on main have disappeared with the new merge order, so this is partly repaired. The three that remain are other authors' open pull requests adding new folders, which the supplier rule admits in principle; the gate rule is nonetheless binding and the placement cannot be fixed by moving this roadmap alone.

Repair (author side): state the consumed notions here as targets where they are small (the low-degree matrix and patching interfaces of AlgebraicKTheory A0–A2/A5/A6 used in §6.1.7 and §6.10; the real Bott chain and local-coefficient inputs of HomotopySpheres used in §6.10a; the completed Dedekind zeta interface of LFunctions §0/§3 used in §3.3), recording each move under *Scope and ownership*; or leave the ordering to the board and say so. Rerun the dependency check after the edit.

## R04 (P3) — A Check in §1.2.13a asserts a difference that does not exist

Location: `README.md` line 425 ("For the semidefinite Gram matrix `diag(0,4)` … `λ_0^sq` would be `0` while the first minimum of a lattice is taken over nonzero vectors: positive definiteness is load-bearing for `λ_0^sq(L) = min L`").

Claim: without positive definiteness the first squared minimum and Tau Ceti's `IntegralLattice.minimum` differ.

Witness: Tau Ceti's `minimum` at the pin (`TauCeti/LinearAlgebra/IntegralLattice/PosDef/Minimum.lean` line 81) is the least natural number that is the integral norm of a nonzero vector. For `diag(0,4)` the nonzero vector `e₁` has norm `0`, so `min L = 0`, and `λ_0^sq = 0` for the same vector: the two sides agree. At main's Tau Ceti pin the module `PosDef/SuccessiveMinima.lean` proves exactly this equality under semidefiniteness (`IsPosSemidef.successiveMinimum_zero`, line 103). What positive definiteness buys is positivity of the minima, not the equality.

Repair: replace the Check by "for `diag(0,4)` both `λ_0^sq` and `min L` are `0`, attained by `e₁`; positive definiteness is what makes every `λ_i^sq` positive, and `Gram [−1]` shows the natural-valued infimum is the junk value `0` on an indefinite lattice". Tested on `diag(0,4)`: both sides `0`.

## R05 (P3) — The *Needs* lines of the two rewritten targets

Location: `README.md` line 436 (1.2.14 *Needs:* "SuccessiveMinima 1.4 `successiveMin_le_iff_finrank` and 1.5 (attainment)") and line 2529 (6.4.2a *Needs:* "2.2 `IntegralQuadraticLattice.ofCarrier`").

Claim: the listed inputs carry the stated route.

Witness: the sketch of 1.2.14 takes from SuccessiveMinima 1.5 "`i+1` independent vectors of norm at most `λ`". Its 1.5 (`exists_successiveMin_witnesses`, SuccessiveMinima `Suggested.lean` line 275) gives `b_j` with gauge exactly `λ_j`; bounding `b_0, …, b_i` by `λ_i` needs index monotonicity, which is 1.3.2 of this roadmap, later in the build (the forward reference the previous R08 removed, in a milder form). The threshold form 1.4 at `r = λ_i ≥ 0` gives `i+1 ≤ dim span(L ∩ λ_i K)` directly and needs no monotonicity. For 6.4.2a, the statement is about finite-dimensional vector spaces over a field and mentions no integral lattice; `IntegralQuadraticLattice.ofCarrier` is a leftover of the old 2.1.3 line.

Repair: in 1.2.14 replace "1.5 (attainment)" by "1.4 at `r = λ_i`" and adjust the sentence; in 6.4.2a delete `2.2 IntegralQuadraticLattice.ofCarrier` from *Needs*.

## Previous findings

- R01 — not repaired: README line 29 still makes §3.3 "the canonical owner of `orthogonalTamagawa_two`", lines 122–124 still consume OrthogonalSpinGroups 1D/2F/3F; the dependency check prints the same CYCLE line.
- R02 — not repaired: `Suggested.lean` line 5 still reads `import TauCetiRoadmap.SuccessiveMinima.Suggested`; the gate reports `imports (1)`.
- R03 — partly repaired: nine UPWARD edges are now three (AlgebraicKTheory, HomotopySpheres, LFunctions); the roadmap is still "not movable" past them because EffectiveBoundsPartII consumes it.
- R04 — repaired: §1.2.13a now reads "Use IntegralLattices §2F on Tau Ceti's `IntegralLattice` carrier … the least natural number `N` for which some `i+1` linearly independent vectors…"; the Tau Ceti module and declaration names are gone, 1.2.14 is `sqSuccessiveMin_eq_sq_successiveMin`, and the *Status* paragraph is deleted. IntegralLattices §2F on main (README line 801) states the squared-norm minima, existence, `λ₁ = min L`, monotonicity and attainment for positive definite `L` of rank `n ≥ 1`, as the new text says. Note for the author, not a finding: main's Tau Ceti pin `358314d` already carries `TauCeti/LinearAlgebra/IntegralLattice/PosDef/SuccessiveMinima.lean` with `successiveMinimum`, `successiveMinimum_le_iff`, `monotone_successiveMinimum`, `IsPosSemidef.successiveMinimum_zero`, `IsPosSemidef.exists_linearIndependent_integralNorm_eq_successiveMinimum` and `IsPosDef.successiveMinimum_pos`; this pull request's pin `a91d3aa` (an ancestor) lacks it. When the manifest catches up, §1.2.13a should defer to those declarations by name.
- R05 — repaired: the Lean docstrings now say "body minima `successiveMin`, real-valued on a `ConvexBody` and indexed by `Fin (finrank ℝ E)`" and "Source: Henk, *Successive minima and lattice points*, Theorem 1.3 and its proof in §3"; README line 32 says "not planned by SuccessiveMinima and are not among the pinned declarations"; no pin or revision narrative remains.
- R06 — repaired: the PivotalSpherical row and §6.1b now cite "The decomposition API (existence of a decomposition into simples and multiplicities), `SimpleClasses`". The LFunctions row was not changed, and rightly: `HasDirichletAgreement.completes` exists at LFunctions' open head (`Suggested.lean` line 181, the third field of `structure HasDirichletAgreement`); the previous report's claim that it was missing was a false positive.
- R07 — repaired: Mahler 4.5.1 now "Definitions 3–4, printed pp.156–157" (Definition 3 on p.156, mahler-1946 line 216; Definition 4 on p.157, line 226); Barwick "Corollary 5.16.1, p.19" (barwick-heart line 808, page 19); Milne now `ADTnot.pdf`, which the sources service fetched (Creative Commons licence on its page 2). The Emery–Kim locator for 2.8.5 changed to "printed p.11": against the version of record the README cites (Forum of Mathematics, Sigma 10, e68), Lemma 5.2 and its full proof occupy p.11 (emery-kim-2022 lines 504–550; page 12 begins at line 552), §5.1 begins on p.10 (line 475) and Lemma 5.1 is on p.11 (line 494), so lines 749–771 are all correct and the previous report's page numbers were those of the arXiv version. Likewise Cho–Yamauchi Definition 3.1 is on physical p.11 of arXiv v2 (cho-yamauchi-2020 line 553; the Definition 2.3 on p.9 only cites a "Definition 3.1" of another paper) and CDH III Theorem 2.2.4, Corollary 2.2.5 and Remark 2.2.6 are on pp.38–39 of arXiv v4 (lines 1717, 1765, 1774), so the untouched locators at lines 890, 900 and 3091 are correct as they stand.
- R08 — repaired: 1.2.14's *Needs* no longer lists 1.3.1 ("Positivity of `λ` is not used"), and 2.1.3 is now a one-line pointer to 6.4.2a, which sits after `ExactW0` (6.4.2). The milder residue is R05 above.
- R09 — repaired: line 2185 now reads "The reduction algorithm … is not a target of this roadmap; Layer 5 states properties of reduced bases only. Reducedness here uses `η = 1/2`".

## Verified sound

**Gate and build.** The worker's gate at this head: `set_option=0 latex=0 prnum=0 sorry-data=0 sorry-examples=0 imports=1 depcheck=4 stray-files=0 outside-folder=0 source-material=0 build=0 FAIL`. I re-elaborated `Suggested.lean` with `lake env lean` from the worktree: 24 `declaration uses 'sorry'` warnings, no error. `git diff --stat origin/main...HEAD` outside the folder is empty.

**Dependency check** (`gate --depcheck … --movable`), verbatim:

```text
not movable: GeometryOfNumbersAndQuadraticArithmetic consumes AlgebraicKTheory (#273) and is consumed by EffectiveBoundsPartII (#81), which comes first: moving GeometryOfNumbersAndQuadraticArithmetic after AlgebraicKTheory would put a supplier after a consumer, a cycle through GeometryOfNumbersAndQuadraticArithmetic
UPWARD: GeometryOfNumbersAndQuadraticArithmetic (#54) -> AlgebraicKTheory (#273) at README lines [138, 140, 2239, 2241, 2244, 3154]
UPWARD: GeometryOfNumbersAndQuadraticArithmetic (#54) -> HomotopySpheres (#217) at README lines [178, 180, 2276, 2278, 3190, 3192]
UPWARD: GeometryOfNumbersAndQuadraticArithmetic (#54) -> LFunctions (#268) at README lines [170, 228, 229, 1139]
CYCLE among: GeometryOfNumbersAndQuadraticArithmetic, OrthogonalSpinGroups, OrthogonalTamagawaAndLatticeMass
depcheck: 201 roadmaps, 1323 edges, 4 problem(s)
```

**Signature check.** The diff touches no Lean statement, only two docstrings. I elaborated a scratch copy with `#check @prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume` appended: the elaborated type carries `[FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]`, `[DiscreteTopology L] [IsZLattice ℝ L]`, the symmetry hypothesis and `[μ.IsAddHaarMeasure]`, which is the README's 1.3.3 statement; nothing changed. The previous report's `#check` of all 40 declarations and its one-tactic probe (no theorem closes) carry over since no statement changed; no `set_option`, no `lemma`, no sorried data (41 declarations, 24 theorems).

**Pins.** This pull request's manifest pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`; main's pins Tau Ceti `358314d` (a descendant) and Mathlib `f6090c7`. Neither Tau Ceti commit contains `Algebra/Module/ZLattice/SuccessiveMinima.lean` or `NumberTheory/GeometryOfNumbers/MinkowskiSecond.lean`, so the three §1.3 targets duplicate nothing at either pin and README line 32 is accurate. Main's pin does contain `LinearAlgebra/IntegralLattice/PosDef/SuccessiveMinima.lean` (see R04 above).

**Library declarations opened at the pull request's pin.** Tau Ceti: `IntegralLattice.minimum` (`PosDef/Minimum.lean` line 81: `sInf {k : ℕ | ∃ x : L, x ≠ 0 ∧ L.integralNorm x = k}`), `minimum_def` (line 86), `IsPosSemidef.exists_ne_zero_integralNorm_eq_minimum` (line 103), `IsPosSemidef.isLeast_minimum` (line 123); `WittRing` and `WittGrothendieckRing` (`LinearAlgebra/QuadraticForm/Witt/Ring.lean` lines 123–234). At main's Tau Ceti pin, `IntegralLattice.successiveMinimum` (`PosDef/SuccessiveMinima.lean` line 45: `sInf {c : ℕ | ∃ x : Fin (i.val+1) → L, LinearIndependent ℤ x ∧ ∀ j, L.integralNorm (x j) ≤ c}`, index `Fin (finrank ℤ L)`), its threshold lemma (line 82), monotonicity (line 94), first-minimum identification under semidefiniteness (line 103), simultaneous attainment under semidefiniteness (line 143) and positivity under definiteness (line 212): the conventions of §1.2.13a (zero-based index, natural value, threshold with independent families, `λ_0^sq = min L`) agree with it.

**Cross-roadmap citations resolved.** IntegralLattices §2F on main (README lines 801–811: positive definite `L`, rank `n ≥ 1`, `λ_i` a value `β x x`, existence, `λ₁ = min L`, nondecreasing, attaining vectors, no `ℤ`-basis claim). SuccessiveMinima on main: `successiveMin` (`Suggested.lean` line 156, `sInf {t | 0 ≤ t ∧ ∃ v : Fin (i.val+1) → E, LinearIndependent ℝ v ∧ ∀ j, v j ∈ L ∧ v j ∈ t • K}`), 1.4 `successiveMin_le_iff_finrank` (line 269, hypothesis `0 ≤ r`, section hypotheses `DiscreteTopology L`, `IsZLattice ℝ L`, `0 ∈ interior K`), 1.5 `exists_successiveMin_witnesses` (line 275); its README lines 70–92 and 270–286 take positivity, index monotonicity and the upper inequality from Tau Ceti modules that are at neither pin and plan no target for them, so §1.3 has one owner. QuadraticFormInvariants Layer 4 on main (README line 68: `LinearAlgebra/QuadraticForm/Witt/`, the Witt ring). PivotalSpherical Layer 3 on main (`SimpleClasses C`, README line 380). LFunctions at its open head (`HasDirichletAgreement.completes`, `Suggested.lean` line 181). OrthogonalSpinGroups on main line 30 and OrthogonalTamagawaAndLatticeMass at its open head line 11 (R01). Ownership against open pull requests without a path in the brief was not re-checked this round.

**Sources read at their locators this round** (line numbers into the sources cache): Henk Theorem 1.3 (henk-2002 line 58, p.2; the box-equality sentence line 60) and §3 "Proof of Theorem 1.3" (line 221, p.5); Emery–Kim version of record §5.1 (emery-kim-2022 line 475, p.10), Lemma 5.1 (line 494, p.11), Lemma 5.2 and proof (lines 504–550, p.11); Mahler 1946 Definitions 3–6 (mahler-1946 lines 216, 226, 244, 246; pp.156–157); Schlichting 2010 §2.2 "Witt and Grothendieck-Witt groups" (schlichting-2010 line 268, physical p.7 = printed p.111, `W₀(E)` as isometry classes modulo metabolic spaces); Barwick Theorem 5.16 and Corollary 5.16.1 (barwick-heart lines 801, 808, p.19); CDH III Theorem 2.2.4, Corollary 2.2.5, Remark 2.2.6 (cdh-iii lines 1717, 1765, 1774; pp.38–39 of v4); Cho–Yamauchi Definition 3.1 (cho-yamauchi-2020 line 553, p.11); Milne ADT second edition (fetched, title and licence page).

**Adversarial table.** New rows for every changed statement; rows for untouched statements are carried from the previous report (r3) with their values.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 1.2.13a squared minima (new text) | Gram `[4]`; `diag(1,4)`; `A₂ = [[2,1],[1,2]]`; `diag(0,4)`; `diag(1,1)` | threshold 3: no nonzero vector (norms `4k²`), fails; 4 holds. `(1,4)`. `2(a²+ab+b²) ≥ 2`, `e₁,e₂` give `(2,2)`. `e₁` norm 0: `λ_0^sq = 0` and `min L = sInf{k : ∃ x ≠ 0, norm x = k} = 0`, equal. `(1,0),(1,1)` norms `(1,2)`; `(1,0),(0,1)` norms `(1,1)` | four Checks hold; the `diag(0,4)` Check claims a difference that is not there | R04 |
| 1.2.13a vs IntegralLattices §2F | "`{x : βxx ≤ c}` spans rank ≥ i" vs "`i` independent vectors of norm ≤ c" | a set spans rank ≥ i iff it contains `i` independent vectors; zero-based `i : Fin n` ↔ `1 ≤ i ≤ n` | same object | none |
| 1.2.14 `sqSuccessiveMin_eq_sq_successiveMin` | Gram `[4]`, `K` = closed unit ball; `diag(1,4)`; `I₂`; `A₂` | real `λ_0 = 2`, `2² = 4`; `(1,2)² = (1,4)`; `(1,1)`; `(√2,√2)² = (2,2)` | holds | none |
| 1.2.14 route | `N = λ^sq`, `r = √N`; converse | 1.4 at `r = √N ≥ 0` gives `λ ≤ √N`; 1.4 at `r = λ_i` gives `i+1` independent vectors in `λ_i K`, norms `≤ λ_i`, integers `≤ λ_i²`, so `N ≤ ⌊λ_i²⌋`; via 1.5 instead, `b_j` has gauge `λ_j` and `λ_j ≤ λ_i` needs 1.3.2 | correct with 1.4; the listed 1.5 route is incomplete | R05 |
| 1.2.14 independence transfer | `ℤ`-independent `v` in `L`, `e(L)` full | integer coordinates in a lattice basis that is an `ℝ`-basis: a real relation forces a rational one; conversely `ℝ`-independent ⇒ `ℤ`-independent | holds (uses fullness, as the *Needs* supplies through ThetaSeries 2D) | none |
| 1.3.3 upper Minkowski (docstring only) | `ℤ²`, `[−3,3]×[−1,1]`, Lebesgue; cross-polytope; `d = 0`; empty-interior `K` | `(1/3)·1·12 = 4 = 2²·1` equality (Henk line 60: boxes give equality); `1·1·2 = 2 < 4`; empty product 1, both sides `μ(0-space)`; threshold set empty, `sInf ∅ = 0`, LHS 0 | holds; Henk Theorem 1.3 is this statement for Lebesgue measure and `K ∈ K^d_0`, the Haar generalisation is a scalar | R02 |
| 6.4.2a `W₀` vs Witt ring | `ℝ`, `B = 2xy`; `H(K)`; `𝔽₃`, `B = 2xy` and `xy`; zero space; wrong model `B ↦ B(x,x)` | `q = x²`, `⟨1⟩`, signature 1 generates `W(ℝ) ≅ ℤ`; `q((x,f)) = f(x) = xy`, class 0 = metabolic; `x² = ⟨1⟩` vs `2x² = ⟨2⟩ = ⟨−1⟩`, classes `1 ≠ 3` in `W(𝔽₃) ≅ ℤ/4`; `0 ↦ 0`; the wrong model sends `2xy ↦ ⟨2⟩`, excluded by the third Check | holds; metabolic = hyperbolic with 2 invertible so `W₀` is the classical Witt group | R05 (unused *Needs*) |
| 4.5.1 `StarBody` (locator only) | — | Definition 3 p.156, Definition 4 p.157, Definitions 5–6 p.157 | locator correct | none |
| 5.1 `IsLLLReduced` (prose only) | `(1,0),(1/2,1)`; `(2,0),(0,1)`; `(2,0),(1,1)` | carried from r3: `μ = 1/2`, `1 ≥ (3/4−1/4)·1`; `1 ≥ 3` fails; `1 ≥ 2` fails | holds | none |
| 0.2.1 adapted basis | ℤ², W = ℝ(1,1); first column (2,0) | carried from r3: det 1; det 2y even | holds | none |
| 0.2.3 Gram block product | b = (1,1),(0,1); sign-reversed; empty family | carried from r3: 1 = 2·(1/2); Gram det 1; 1 = 1·1 | holds | none |
| 0.2.4 biorthogonal Gram | b=2,d=1/2; [[2,1],[1,1]] vs [[1,−1],[−1,2]]; b=d=2 | carried from r3: 1; 1; 16 ≠ 1 | holds | none |
| 0.2.5 dual of projection | Δ=2ℤ; y ∈ W⊥ | carried from r3: (1/2)ℤ ≠ 2ℤ; ⟨y,πx⟩=⟨y,x⟩ | holds | none |
| 0.3.1 `covolume_projection` | ℤ² off diagonal; 2ℤe₁⊕3ℤe₂, W=ℝe₁; W=E; W=0 | carried from r3: 1/√2; 3 = 6/2; 1; covol Δ | holds | none |
| 0.3.3 `primitive_orthogonal_covolume` | ℤ², W=ℝ(1,2); ℝ(1,1) | carried from r3: √5, √5; √2, √2 | holds | none |
| 1.3.1 positivity | ℤ, [−1,1]; ℤ×{0} in ℝ²; ℤ², segment | carried from r3: 1>0; junk 0; junk 0 | holds | none |
| 1.3.2 monotonicity | ℤ², [−3,3]×[−1,1]; cube; ℤ×{0} | carried from r3: (1/3,1); all 1; (1,0) | holds | none |
| 2.1.2 discriminant scaling | q = B(x,x)/2, dim n | carried from r3: det 2^{−n} det B, sign (−1)^{n(n−1)/2} | consistent | none |
| 2.4.5 spinor orbit | q=xy; ℚ₂; ℚ₃ | carried from r3: norm [2]; non-square in ℚ₂; unit non-square in ℚ₃ | holds | none |
| 2.4.6 reflection | ℤ₂, q=xy, v=(1,1); v=(1,2); rank 0 | carried from r3: det −1; image ∉ L; none | holds | none |
| 2.6.1 atomic predicate | xy over ℤ₂; x²+xy+y²; 2 a unit; n=0 | carried from r3: v(a)v(b)=0 ⇔ a or b unit | matches Voight 9.8.1 | none |
| 2.6.3 | v(A),v(C)>v(B) | carried from r3: v(AC−B²)=2v(B) | holds | none |
| 2.6.4 splitting | polar [[A,B],[B,C]] | carried from r3: α,β integral | holds | none |
| 2.6.10 | [a,b,c] | carried from r3: q = c − b²/(4a), cross term 0 | holds | none |
| 2.6.11 `atomic_normal_form` | 𝔽₂[[t]]; ℤ₂, xy; 2 unit; zero form | carried from r3: ⟨1⟩⊥t⟨1⟩; one binary block; exponents 0,1; r zero blocks | holds | none |
| 2.7.3 dual quotient | π³; (0,1,1); unramified | carried from r3: val 3; val 2; q^{2val} | holds | none |
| 2.8.3–2.8.4 | (f·a)(x)=ā f(x) | carried from r3: adjoint e_i ↦ a_i e_i*, inverse e_i a_i⁻¹ | holds | none |
| 3.1.1–3.1.2 counts | ℤ/3; G=1,B=0; n=0 | carried from r3: 2; 1; 1 | holds | none |
| 3.1.3 `finite_hermitian_isometry_formula` | n=m=1,a=0,1; q=2,n=1,m=1,2,3; n=1,a=1,m=2 | carried from r3: q+1; 0; 3, 6, 36; (q²−1)(q+1) | holds | none |
| 3.2.4–3.2.7, density transform, finite Fourier count | val 1,2,3; a=0,1,2; q=2 | carried from r3: Σ(−X)^i; −m′(1)=0,1,1+q; D(1)=0 for odd a; 3/2, 1/2, (−q)^{−e} | holds | none |
| 3.3.6 proper vs ordinary mass | improper isometry present/absent | carried from r3: proper = 2× ordinary | holds | none |
| `orthogonalTamagawa_two` scope | rank 2 split torus | carried from r3: τ=1 ≠ 2 | rank ≥ 3 present | R01 |
| 4.1.12 `lattice_count_lt_successive_minima` | ℤ² square; tiny ball; rectangle (1,3) | carried from r3: 9 < 18; 1 < 2; 3 < 6 | holds | R02 |
| 4.1.13 `davenport_multiset_estimate` | n=1; 2·1_{[0,N]}; {0,2}; shear | carried from r3: sSup ∅ = 0; error 2; count 2 vol 0; count 4 | holds | none |
| `howe_moore`, `moore_ergodicity`, Ratner 4.2.4–4.2.6, `dani_margulis_nondivergence`, `oppenheim_values` | compact G; infinite centre; trivial U; periodic orbit; identity flow; integral/definite/x²−(3+2√2)y² | carried from r3: excluded by hypotheses; Dirac; orbit; T ≥ (1−ε)T; discrete values; |N| ≥ 1 | correct generality | none |
| `three_square_hurwitz`, `signedThreeSquareCount`, class-number formula, Duke exponent, harmonic Gaussian, degree-4 harmonic, Kloosterman | n=0..7; k=ℓ+3/2; P=x; Σx_i⁴−(3/5)(Σx_i²)²; c=4 | carried from r3: 6,12,8,6,0; 6,12,8,0; 6,12,8,24,24; −1/28+2ε; −iξe^{−πξ²}; Δ=0; 1−i,1+i,−1+i | holds | none |
| 4.4.13 `euclidean_dual_transference_upper`, constants, 4.4.14 `covering_dual_transference` | aℤ; ℤⁿ; hexagonal; c=3/4,n=3 | carried from r3: 1; ≤ n; 2/√3; 0.148 < 0.15; 1/2; √n/2 | holds | R02 |
| 4.5 `StarBody`, 4.5.9 `critical_lattice_exists`, 4.5.8 `mahler_relativelyCompact_iff` | (√|x|+√|y|)²; √|xy|; strip; disc; rank 0; diag(t,t⁻¹)ℤ² | carried from r3: 2 > 1; |N| ≥ 1; hexagonal √3/2; √5; Δ=1; first minimum → 0 | holds | none |
| 4.6.1 `siegel_mean_value` | ℤ ⊂ ℝ, 1_{[−1/2,1/2]}; 1_{[−1,1]}; v=0 | carried from r3: 0 vs 1 (n=1 excluded); 2; f(0) breaks it | hypotheses load-bearing | none |
| 5.1.3–5.1.4 | GS lengths 1, 1/2; n=1 | carried from r3: ratio 2; factor 1 | holds | none |
| 6.1b Checks, 6.4 FH = 1+D, 6.9.1 residue, 6.10b signatures, E16, E12 | cofiber of 2; C₃; hyperbolic plane; ℤ at (2),(3); E₈; n=6,7; [1,1,1] vs [5,1,5] | carried from r3: [ℤ/2]=0; rank doubles; Ext¹ = ℤ/p; signature 8; c₂=1, ℤ/240; √17 ∈ ℤ₂ | holds; errata confirmed | none |

## Not verifiable

- Nothing in the changed passages. The previous report's list (Banaszczyk 1993, Iwaniec 1987, Siegel 1945 and 1935, Davenport 1951, the paywalled DOIs and books, the image-only LLL scan) stands unchanged for the untouched passages.

## Source issues

The six entries of the previous report (Henk p.2 floor misprint; Voight 9.4.5, 9.8.2; Voight 2012 Example 3.14; Morris p.413; Weibel VI 10.1) were recorded there and are not repeated. New this round:

- none
