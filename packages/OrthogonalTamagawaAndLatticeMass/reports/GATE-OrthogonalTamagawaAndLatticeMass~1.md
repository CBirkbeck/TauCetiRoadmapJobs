# GATE-OrthogonalTamagawaAndLatticeMass~1: answers to review

Points numbered from the single review (roed-math). The "Checks that support the rest of the design" list makes no request and is not numbered.

## H01 (roed-math) — applied

§0.2 "Consume the shared nondegenerate orthogonal algebraic-group construction, semisimplicity and Spin simple-connectedness" → "Construct here the algebraic groups O(V,Q), SO(V,Q) and Spin(V,Q) … and prove their structure theorems", since OrthogonalSpinGroups §3A and its consumer contract assign exactly this to this roadmap and no roadmap on main (ReductiveGroups, IntegralLattices) or earlier in the merge order owns it. The new §0.2 reuses `TauCeti.ConstantForm.groupScheme` and the standard-form SO package (`TauCeti.SpecialOrthogonal.smoothCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra`, `…reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra`), builds the Spin scheme with K-points equal to Mathlib `spinGroup`, the central μ₂-isogeny (`TauCeti.CommHopfAlgCat.IsCentralIsogeny`) matching `spinToSpecialOrthogonal Q`, and proves smoothness, geometric connectedness, semisimplicity and simple connectedness (`TauCeti.semisimpleCommHopfAlgProperty`, `TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty`) for n ≥ 3 via the split root datum (ReductiveGroups Layer 8) and descent (`IsCentralIsogeny.baseChange`, `isCentralIsogeny_baseChangeMap_iff`), with n = 3, 6 compared directly, n = 4 split/nonsplit factors as Res_(Z/K) SL₁(C₀), and four Checks (n = 2 torus, rank-4 factor count, non-surjectivity on ℚ-points, SO not simply connected). The Conventions paragraph now says OrthogonalSpinGroups does not supply the algebraic groups; §0.1's comparisons are unchanged.

## H02 (roed-math) — applied differently

§5 no longer claims an "existing generic TamagawaMeasures/AA owner": no such roadmap exists on main, among the open pull requests or in the merge order, and AA.2 / ET §6.5 do not export the defect theory. Rather than commission a general central-isogeny Tamagawa comparison inside a lattice-mass roadmap (no target here consumes it, and the direct route of 1.3 is independent of it), §5 now states it is outside this roadmap, names AdelicAlgebraicGroups Part II as its home, records the reviewer's G_m squaring example (ℚ×/ℚ×² infinite, adelic image not open, AA.1.4) as the reason any such formula must name its finite defect groups, and keeps the prohibition on substituting τ(Spin)=1 or |μ₂| for the orthogonal value. Heading "Retained generic measure library and limits" → "Limits and dependency order".

## H03 (roed-math) — applied

§3 "Construct Bernoulli numbers by the exact rational recurrence …" → consume Mathlib `bernoulli`, `bernoulli_one`, `sum_bernoulli` (the recurrence at n = k+1) and `bernoulliPowerSeries_mul_exp_sub_one` (all at the pin, `Mathlib/NumberTheory/Bernoulli.lean` lines 194, 204, 223, 268); the new work is the evaluation of B_2…B_20 and M8…M40. Added Checks: B_0+2B_1=0 separates `bernoulli` from `bernoulli'`, and M8 = (1/240)(1/24)(1/240)(1/504) = 1/696729600 (recomputed exactly).

## H04 (roed-math) — applied

§2.2 now consumes from IL3I only what IL3I defines (main IntegralLattices 3I: types I/II, bound/free, t, b, c, d_i, N_M, N_Q, N) and constructs here Cho's sublattices X_i, B_i, W_i, Y_i, Z_i (Cho2015 Remark 2.6), the refined types I^o, I^e, I^e_1, I^e_2 (free I^e only), the zero-lattice-is-type-II convention (Cho2015 Definition 2.1(c), Cho2015 line 117), V̄_i = B_i/Z_i with q̄_i and φ_i (Cho2015 §4.1, Remark 4.3), and α_Cho, β_Cho (Cho2015 Lemma 4.2, Cho2015 line 883), with the reductive-quotient theorem (Cho2015 Theorem 4.12, line 1191) and three Checks: ⟨1⟩ gives β_Cho = 1 (L_2 zero) and α_2 = 4, the convention-free reading gives 2; ⟨2⟩ gives 8; U gives 4, the SO-component reading gives 2.

## H05 (roed-math) — applied

§1.4c "`R_D^+` is the log of the least unit positive at both real embeddings" → R_D^+ = log σ(η) for the generator η of the infinite cyclic group O_K^{×,+} with σ(η) > 1, with embedding independence proved from σ'(η) = N(η)/σ(η) = 1/σ(η), and a sentence that no least totally positive unit exists. Added Checks D = 5 (ε of norm −1, η = ε², h⁺ = h = 1) and D = 12 (ε = 2+√3 of norm 1, h⁺ = 2 = 2h), both satisfying h⁺R⁺ = 2hR. The real angular/logarithmic Haar normalization is left where §1.4c already places it, in the 1.2/B7 measure-scalar comparison.

## Additional repairs needed for the gate (not raised in the review)

- `Suggested.lean` imports `Mathlib.NumberTheory.Bernoulli`, `Mathlib.LinearAlgebra.Matrix.PosDef` → `import Mathlib` followed by the five `TauCeti.LinearAlgebra.IntegralLattice.*` modules (all exist at the pin).
- `gramSetoid` had `iseqv := by sorry` (sorry'd data): it now has a real proof (identity; A⁻¹ with `Matrix.isUnit_nonsing_inv_det`; A·B).
- `def gramAutomorphismEquiv … := by sorry` (sorry'd data) → `theorem card_gramAutomorphism : Nat.card (GramAutomorphism G) = Nat.card (Isometry (nativeLattice G) (nativeLattice G))`, which is what the mass sum uses.
- Module docstring rewritten to the required form, naming the headlines not statable at the pins: the 0.2 Spin structure theorems (no Spin group scheme in Tau Ceti), the 1.1–1.3 arbitrary-genus mass formula (no adelic orthogonal quotient or local density), Cho's 2.1–2.2 model (no smooth integral model from a Jordan splitting).
- `R_{Z/K}` written as `Res_(Z/K)` (the gate's TeX check).

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 0.2 Spin for n = 2 is the norm-one torus of K[t]/(t²+det C) | Q = x²+y² over ℚ | (e₁e₂)² = −1 so C₀ = ℚ(i); (3+4i)/5 has norm 25/25 = 1; dim 1 | torus, not semisimple | stated as negative Check |
| 0.2 rank-4 factors | x²+y²+z²+w²; x²+y²+z²+2w² | signed disc (−1)^6·det = 1 (square) resp. 2 (nonsquare) | 2 factors resp. 1 non-absolutely-simple factor | Check added |
| 0.2 central isogeny not surjective on K-points | Q = x²+y²+z², τ_{e₁}τ_{e₁+e₂} | spinor norm 1·2 = 2 ∉ ℚ×²; with B = 2Q: 2·4 = 8 ≡ 2 | not in image | Check added |
| 0.2 SO not simply connected | n ≥ 3 | ker(Spin→SO) = μ₂ ≠ 1 | predicate fails for SO | Check added |
| 0.2 n = 3, 6 identifications | split forms | dim Spin₃ = 3 = dim SL₂; dim Spin₆ = 15 = dim SL₄ | consistent | — |
| 2.2 β_Cho with zero lattice | ⟨1⟩, ⟨2⟩ over ℤ₂ | β = 1, #𝒢̃(𝔽₂) = 2; α₂ = 2^(1−0)·2 = 4, 2^(2−0)·2 = 8 | matches direct counts | Checks added |
| 2.2 U | U over ℤ₂ | free type II, image O₂⁺(𝔽₂) of order 2, N = 2, α₂ = 2^(2−1)·2 = 4; SO-component reading: 2^1·1 = 2 | matches IL3I count 4 | Check added |
| 1.4c R⁺ embedding independence | D = 5, D = 12 | N(ε) = −1 → η = ε², R⁺ = 2R, h⁺ = h = 1; N(2+√3) = 1, 2−√3 > 0, R⁺ = R, h⁺ = 2 = 2h | h⁺R⁺ = 2hR in both | Checks added |
| 3 Bernoulli convention | k = 1; M8 | B₀+2B₁ = 0 → B₁ = −1/2 = `bernoulli_one`; M8 = 1/696729600 exactly (Fraction) | agrees with `bernoulliFullMass_four` | Check added |
| `gramSetoid` | refl/symm/trans | proved in Lean | elaborates | real proof |
| `card_gramAutomorphism` | n = 0 | both sides 1 (empty matrix, identity isometry) | consistent | replaces sorry'd equivalence |
| §5 isogeny defect | squaring on G_m/ℚ | ℚ×/ℚ×² infinite | raw cokernel not a finite defect | recorded as reason, not stated as target |

## Notes

- Ownership against open pull requests was checked with `roadmaps grep` for algebraic Spin simple connectedness and for finite-central-isogeny Tamagawa defects. The only other hit for an algebraic Spin construction is the IntegralLattices revision (N2). That is a revision of a roadmap already on main, so it cannot be a supplier, and main's IntegralLattices does not have it.
- I did not do the `#check @name` signature comparison in a scratch file, because the only Lean command the brief allows is the module build. The two changed declarations take every binder explicitly in their own signatures.
- `sources.toml` is outside the files this job may edit. Cho2015 (arXiv:1210.7625v3, open repository) was fetched and read for H04. Its manifest entry should be added by the worker. No text is missing, and `needs-references.toml` was not written.
- No suspicious instructions were found in the review text.

## Build and gate

- `lake build TauCetiRoadmap.OrthogonalTamagawaAndLatticeMass.Suggested`: Build completed successfully (8999 jobs), 15 `declaration uses sorry` warnings, no errors.
- Gate: `gate OrthogonalTamagawaAndLatticeMass: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`. The only failure is `depcheck: NOT IN ORDER: OrthogonalTamagawaAndLatticeMass (insert it after its last supplier)`. Before its design is accepted the roadmap is not in the merge order, so per the brief this is not a defect. Before these repairs the gate also failed on sorry-data=2, imports=1, mathlib-subimports=2 and no-import-mathlib=1.
- Depcheck `--movable`: `NOT IN ORDER: OrthogonalTamagawaAndLatticeMass (insert it after its last supplier)` / `depcheck: 148 roadmaps, 999 edges, 1 problem(s)`. No UPWARD or CYCLE line.
- Commit: "OrthogonalTamagawaAndLatticeMass: review repairs (own algebraic Spin, Cho refined data, isogeny scope, Bernoulli, units)". Not pushed.
