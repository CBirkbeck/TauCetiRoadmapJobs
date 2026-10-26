## H01 (rwst) — applied

At `da87eeb` the étaleness conjunct is gone from `HasBoundedModel` in `TauCetiRoadmap/EffectiveBoundsPartII/Suggested.lean`, and the SchemeAndStackFoundations §0.10 contract is gone from the README. The *From Mathlib* bullet at README line 54 and §4.1 cite `Algebra.PreSubmersivePresentation.naive`, `jacobiMatrix_naive`, `localizationAway`, `comp`, `comp_jacobian_eq_jacobian_smul_jacobian` (all at the pin in `Mathlib/RingTheory/Extension/Presentation/Submersive.lean`, lines 486, 495, 247/570, 274, 383), `Algebra.SubmersivePresentation.isStandardSmoothOfRelativeDimension` (`Mathlib/RingTheory/Smooth/StandardSmooth.lean:104`) and the relative-dimension-zero `Etale` instance (`Mathlib/RingTheory/Smooth/StandardSmoothCotangent.lean:347`). The proposed `instance … : Algebra.Etale ℚ (JacobianOpenAlgebra E)` is kept as the README API bullet in §4.1 ("for every ordered integer system E … étale over ℚ") and not added to `Suggested.lean`. It is an API fact, not a headline, and the acceptance file carries no API lemmas.

## H02 (rwst) — applied differently

The diagnosis is right, but the proposed supplier is not usable. `Matrix.covolume_intLattice_ker_mulVecLin` does not exist at the pinned Tau Ceti `a91d3aa` (grep of `TauCeti/` finds no `minorGcd` and no `SuccessiveMinima.lean`). The same identity is planned on main, in HeightsAndUnits Layer 2.2 (`minorGcd`, `one_le_minorGcd`, `minorGcd_mul_subspaceHeight_ker`: minorGcd(A)·subspaceHeight(ker A)=√det(AAᵀ)) together with DiophantineApproximationAndTranscendence §2.8 `kernelLattice_covolume` at K=ℚ. So §2.2 is now "Relation covolume through the minor gcd". B is defined there, and the section proves covol(L)=√det(BBᵗ)/minorGcd(B)≤√det(BBᵗ). Removed: the transpose map, S, L⊥, `primitive_orthogonal_covolume` and GeometryOfNumbers §§0.2.1, 0.2.6, 0.3.3, plus Mathlib `ZLattice.covolume_div_covolume_eq_relIndex'` / `covolume_eq_det_mul_measureReal` and Tau Ceti `ZLattice.covolume_sq_eq_det_gram`, which only that route used. §2.3 keeps only det(BBᵗ)=det(VV*)/|disc K|. The ℚ(√5) check is kept and now tests the identity: minors 2, 0, −10, gcd 2, and √104/2=√26=covol(L). Scope (line 17), supplier contracts, §2.5, Layer 2 *Dependencies* and the first worked example are updated to match.

## H03 (rwst) — applied differently

The citations were stale. GeometryOfNumbersAndQuadraticArithmetic at its head `f1c97f8` no longer has §1.2.7 or §1.5.21, and its §0.1.2 Gram–Hadamard now points to SuccessiveMinima, which is on main. The proposed *From Tau Ceti* bullet would cite declarations absent at the pin `a91d3aa`. Instead the README now has a *From TauCetiRoadmap.SuccessiveMinima* contract: §0.1.2 `hermitian_gram_hadamard`, §1.5 `exists_successiveMin_witnesses`, and the upper inequality `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume` as SuccessiveMinima records it among its Tau Ceti inputs. That contract states that this Tau Ceti module is newer than the pin, so `Suggested.lean` does not use it. The *Needs* lines of §§0.3, 2.5, 3.1 and the Layer 0, 2 and 3 *Dependencies* now cite these. The GeometryOfNumbers dependency shrinks to §§1.1.2–1.1.5, whose names (`ordered_product_root_bound`, `orthonormal_cube_volume`, `inscribed_cube`, `intrinsic_ball_lower_bound`) are present at `f1c97f8`.

## H04 (rwst) — applied

At `da87eeb`, §5.5 names `isolatedAffinePoints_ncard_le_pow` and `jacobianOpen_points_finite_ncard_le` with no r,d≥1 hypotheses, and both are stated in `Suggested.lean` under Layer 5. The Jacobian-open statement is the proposed signature. *Downstream consumers* names ArithmeticStatisticsPartV §3.28 as a possible consumer and calls the multiplicity version a separate, stronger statement. Recomputed edge cases for the minimal-prime form: at r=0 the ideal is ⊥ in F and the single point counts 1=d⁰. At d=0 with r≥1 the ideal is ⊥ or ⊤ and neither has a point's maximal ideal as a minimal prime, so the count is 0=0^r. For X(X−1),XY only (1,0) is isolated: 1≤4.

## H05 (rwst) — applied

At `da87eeb`, `bounded_systems_field_class_bound` has no `hr`/`hd` (elaborated signature: binders `r d C m`, family, `hsep`, `hmodels` only), and README §5.5 reads "r,d,C≥0 are integers". The r=0 (m≤1) and d=0 (m=0) cases are Checks in §5.5.

## H06 (rwst) — applied

At `da87eeb`, §0.1 is the house body with Mathlib's standard product volume, of volume `convexBodyLTFactor K`=2^r₁π^r₂ (`Mathlib/NumberTheory/NumberField/CanonicalEmbedding/ConvexBody.lean:86`, `:98`). There is no second measure, and "weighted canonical measure" is gone from the scope. Recomputed: 2^n·2^(−r₂)δ^(n/2)/(2^r₁π^r₂)=(2/π)^r₂δ^(n/2), since n−r₁−r₂=r₂. For ℚ(i) this is 4/π≤2=δ, matching `covolume_integerLattice`=(2⁻¹)^r₂√|disc K| at the pin (`Discriminant/Basic.lean:124`).

## H07 (rwst) — applied

At `da87eeb` the quoted reply-sentences (old lines 76, 80, 251, 727, 738, 746) and the trailing paragraphs after every *Checks* list are gone. A scan for non-bullet text between `**Checks.**` and `*Needs:*` finds none, and the seven-collinear-points example now appears once (§1.2). This round also deletes the remaining reply-sentence in the GenericDoublePointInterpolation contract ("The full nonzero-minor construction is an input, not just an unspecified genericity predicate."). It rewrites the old line-17 paragraph as a plain ownership deferral to DiophantineApproximationAndTranscendence §2.8 and HeightsAndUnits Layer 2.2 (see H02).

### Ownership, merge order and citations

The new suppliers HeightsAndUnits, DiophantineApproximationAndTranscendence and SuccessiveMinima are roadmaps on main (`546d9e4`), checked there. No notion moves down and none comes from a later roadmap. `roadmaps resolve` on the edited README reports no cross-roadmap citation and no Lean name found nowhere. The two earlier leads (`NumberFieldFamily.isoFamily`, `isoDegree`) are present in ArithmeticStatisticsPartI at its indexed head. COU20 is the only cited source. No new source and no `needs-references.toml` entry.

### Elaborated signatures

`Suggested.lean` is unchanged this round. The 13 elaborated types in the scratch signature file were compared with the README statements. None has lost a binder, and the README generality matches: `bounded_systems_field_class_bound` has no r,d≥1 and the geometric bounds hold over any algebraically closed field.

### Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §2.2 L=ℤ^M∩ker B | ℚ(√5), κ=√5, d=2, β=(1,ω) | columns (1,0),(−1,2),(5,0); kernel x−y+5z=0, 2y=0 ⇒ generator (−5,0,1) | Matches §2.1 relation X²−5 | New statement |
| §2.2 covol(L)=√det(BBᵗ)/minorGcd(B) | same | BBᵗ=[[27,−2],[−2,4]], det 104; minors 2,0,−10, gcd 2; √104/2=√26=‖(−5,0,1)‖ | True | New Check |
| §2.2 index-one case | ℚ(√2), κ=√2, d=1, β=(1,√2) | B=I₂, L=0, covol 1, det 1, gcd 1 | True | New Check |
| §2.2 degenerate M−n=2, n=1 | ℚ, κ=0, d=2 | B=(1,0,0), det 1, gcd 1, L=⟨e₂,e₃⟩ covol 1 | True | Check kept |
| §2.2 direction of inequality | A=(2) | ker 0, covol 1; √det=2, gcd 2: 2·1=2 | Dropping the gcd gives 2≠1 | New Check |
| §2.2 minorGcd = index | ℚ(√5) | ℤ[√5] has index 2 in 𝓞_K; gcd 2 | Agrees; not used in proof | Stated |
| §2.2 basis change | B↦UB, U∈GL₂(ℤ) | det(UBBᵗUᵗ)=det(BBᵗ), minors scale by det U=±1 | Invariant | API bullet |
| HeightsAndUnits contract | row [2,2] | ker ⟨(1,−1)⟩ covol √2; √8=2·√2 | True | New contract Check |
| §2.3 Gram–discriminant | ℚ(i), κ=i; ℚ(√5) | 4/4=1, det VVᵗ=−4; 520/5=104; basis (1,√5): 520/20=26 | True | S-covolume clause removed |
| §2.5 covol(L)≤G^(n/2)/√|disc| | ℚ(√5), d=2 | √26≤√(520/5)=2√26 | True | Route via §2.2 |
| SuccessiveMinima upper inequality | L=2ℤ, K=[−3,3] | λ₁=2/3, (2/3)·6=4=2¹·2 | Direction and measure correct | Moved contract |
| §0.3 product bound | ℚ(i) | 2²·(2⁻¹·2)/π=4/π≤δ=2 | True | Supplier renamed |

### Build and gate

Build: `lake build TauCetiRoadmap.EffectiveBoundsPartII.Suggested`: `Build completed successfully (8976 jobs).` The only warnings are the intended `sorry` headlines.

Dependency check:

```text
depcheck: 55 roadmaps, 641 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

Commit `31c0eb11`: `EffectiveBoundsPartII: review repairs (minor-gcd relation covolume, SuccessiveMinima suppliers, residue sentence)`. Not pushed.

```text
gate EffectiveBoundsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
