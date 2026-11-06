# GATE-HyperellipticCurves~2 — answers to the external-formalisations note on `bc48fea`

One comment (CBirkbeck, 2026-11-06T14:21:13Z), a note on external formalisations. Its distinct points are numbered H01–H07 in order. All edits are in `TauCetiRoadmap/HyperellipticCurves/README.md`, commit `eb3039ba` (not pushed); `Suggested.lean` is unchanged.

The three repositories were read read-only through the GitHub API at their current heads: formal-arithmetic-geometry/weil-conjectures `55abf461`, AxiomMath/Weil `27cdb204` and AxiomMath/Stacks `5ed82d14`. All three are Apache-2.0, on Lean `v4.33.1`, `v4.34.0-rc2` and `v4.35.0` respectively. Every file and declaration named below was opened at that commit, and each namespace was checked.

## H01 (CBirkbeck) — applied

The repository's porting rule ("a roadmap that independently develops the same mathematics should still cite the existing work", in a secondary provenance section) applies. A new `## Provenance` section, placed before `## References` as in AbelianVarietiesOverFiniteFields and HypergeometricMotives, maps milestones 0.2, 0.4, 0.6, 3.5 and 5.3 to the three repositories at pinned commits. It records the licence, the differing toolchains and the attribution rule, and says that it prescribes nothing.

## H02 (CBirkbeck) — disputed

"Nothing hyperelliptic-specific" holds for weil-conjectures and AxiomMath/Weil: neither repository mentions hyperelliptic curves (0 hits for "hyperelliptic" in each). It does not hold for AxiomMath/Stacks, which the note lists as the third repository:
- `StacksFrontier/AlgebraicGeometry/Constructions/ProjHyperellipticDoubleCover.lean` constructs `Proj k[U,V,Z]/(Z² − ∏(U − λᵢV))` with weights `(1, 1, d)`. This is 0.2's weighted-projective model for `(f, h) = (∏(X − λᵢ), 0)`, `g = d − 1`. The file proves the two-chart cover, invertible twists, `𝒪(1)` ample, and `𝒪(n)` very ample only for `n ≥ d`.
- `StacksFrontier/NumberTheory/Drinfeld/SupersingularCurve.lean` is `y² + y = x³ + x + 1` over `𝔽₂` as `AdjoinRoot` over `RatFunc (ZMod 2)`, the shape of 0.4's `W.FunctionField`, with the involution `y ↦ y + 1` of convention 6.

Both are now recorded in the Provenance section.

## H03 (CBirkbeck) — applied

The files exist with the stated content, but the degree statements carry extra hypotheses, which the Provenance section now records:
- weil-conjectures `AlgebraicGeometry.Scheme.natDegree_eq_two_mul_arithmeticGenus_of_isWeilFactorization` assumes a Weil factorisation whose middle factor satisfies the Riemann hypothesis.
- AxiomMath/Weil `Weil.natDegree_rationalFrobeniusCharpolyReverse_eq_bettiNumber_of_inputs` takes `ArisesByGoodReduction`, Artin comparison and finite generation of `H^*(Y(ℂ), ℤ)` as hypotheses.

5.3's route is unchanged. It takes integrality, degree `2g` and `a_{2g} = q^g` from FunctionFieldArithmetic §5.3 (divisor counting, no Riemann hypothesis; checked at that roadmap's head `c5d655e`). It takes the Jacobian factor from NeronModelsAndSemistableAbelianVarieties §5.0c (Frobenius endomorphism; head `4c22d44`). Neither route uses `ℓ`-adic cohomology.

## H04 (CBirkbeck) — applied

At `d = i = 1`, `deg P₁ = 4`, the weil-conjectures reciprocity `AlgebraicGeometry.WeilFunctionalEquation.eval_zpow_mul_inv` only gives `a₄ = ±q²` and `a₃ = a₁a₄/q`, so the functional equation alone does not give the genus-2 shape. A Check was added to README 5.3:
- At `q = 3`, `1 − 9T⁴` satisfies the reciprocity and has `|α| = √3`.
- Its leading coefficient is `−q²` and `L(1) = −8`, which is not a group order.
- The supplier's `a_{2g} = q^g` excludes it.

The Provenance section records that AxiomMath/Weil's `Weil.even_bettiNumber_and_even_rootMultiplicity` is what fixes `det(F | H¹) = q^g`.

## H05 (CBirkbeck) — applied differently

`AlgebraicGeometry.Scheme.ArisesByGoodReduction` (AxiomMath/Weil `Weil/Definitions.lean`, line 298) is not a notion of good reduction of a model. It is a relation between a `κ`-scheme `S₀` and a `ℂ`-scheme `Y`: both are fibres of one smooth projective morphism over a domain of finite type over `ℤ`. The Provenance section says it is not 3.5's HasGoodReduction, which is a property of a curve over the fraction field of a DVR. It notes that a model over `ℤ` with `p ∤ Δ` gives an instance over `ℤ[1/Δ]`, via 0.2–0.3.

## H06 (CBirkbeck) — applied differently

weil-conjectures' `AlgebraicGeometry/Curve/` (297 files) contains no double-cover file, and the repository has 0 hits for "double cover" or "hyperelliptic". The nearest material is:
- `Curve/FiniteMapToLine.lean`: a finite morphism to `𝔸¹`, étale over a dense open, with no degree control. Flatness appears only in its docstring.
- `Morphisms/FiniteFlatDiscriminantBranchSupport.lean` and `FiniteFlatTraceDiscriminantGluing.lean`: the trace discriminant and branch locus of a finite locally free morphism.

Both are recorded, and a Check was added to README 0.6: the trace form of `R[x][y]/(y² + hy − f)` on `1, y` has determinant `4f + h²` (it is `h²` in characteristic 2). For `y² + y = x⁵` over `𝔽₂` it is the unit 1, whereas the roots of `f` would wrongly give a branch point over `x = 0`.

## H07 (CBirkbeck) — answered

This is correct for the objects this roadmap uses. None of the three has `H¹_ét(C_K̄, ℚ_ℓ)^{I_K}` for a curve over a local field, Artin conductors, or the `x − T` descent. The AxiomMath/Stacks "Selmer" hits are about Selmer polynomials `Xⁿ − X − 1`.

The wording "no inertia invariants" is too strong. AxiomMath/Stacks (`ProperBaseChange/BoundaryInertiaInvariants.lean`, `Trace/CurvePointInertiaStalk.lean`) and weil-conjectures (`FundamentalGroup/TameInertia.lean`, among others) have inertia invariants in the Weil II sense: stalks of `j_*` at a missing point of a curve. weil-conjectures' "conductor" files concern the conductor ideal of a normalisation. The Provenance section states this.

## Adversarial pass on the added statements

| statement | instances | values computed | result | change |
| --- | --- | --- | --- | --- |
| 5.3 Check: reciprocity alone allows `a₄ = −q²` | `L = 1 − 9T⁴`, `q = 3`; true `L = 1+2T+T²+6T³+9T⁴` | `α⁴ = 9`: `±√3, ±i√3`, `\|α\| = √3`, `α ↦ 3/α` permutes them; `L(1/(3T)) = 1 − 1/(9T⁴) = T⁻⁴·(−1/9)·L(T)`; `L(1) = −8`; for the true `L`, both sides are `1 + (2/3)T⁻¹ + (1/9)T⁻² + (2/9)T⁻³ + (1/9)T⁻⁴` and `L(1) = 19` | the false polynomial passes reciprocity and the Riemann hypothesis but fails `a_{2g} = q^g` | Check added |
| reciprocity coefficients at `d = i = 1` | generic `1 + a₁T + … + a₄T⁴` | `T⁰`: 1 = 1; `T⁻⁴`: `a₄² = q⁴`; `T⁻¹`: `a₃ = a₁a₄/q`; `T⁻²`: `a₂(a₄ − q²) = 0`; `T⁻³`: consistent | `a₄ = ±q²`, and `a₂ = 0` when `a₄ = −q²` | wording of the Check |
| even multiplicity gives `det F = q^g` | `1 − 9T⁴` | `√3·(−√3)·(i√3)·(−i√3) = −9 = −q²`; `±√3` have multiplicity 1 (odd) | excluded by the even-multiplicity theorem | Provenance sentence |
| 0.6 Check: trace discriminant `4f + h²` | `y² = x³ − x`; `y² = x⁵ − x`; `y² + y = x⁵`/`𝔽₂`; `y² + xy = x⁵ + 1`/`𝔽₂`; `y² = x` | `Tr 1 = 2`, `Tr y = −h`, `Tr y² = 2f + h²`, `det = 4f + h²`; roots `0, ±1` (+∞); `−1, 0, 1` rational (+∞), count 4 as in the existing Check; `det = 1`, no affine branch point, while `f = x⁵` points to `x = 0`; `det = x²`, branch over the root of `h`; `det = 4x`, branch at `0`, `∞` | agrees with convention 6 in both characteristics | Check added |
| `ArisesByGoodReduction` instance from 0.2–0.3 | `y² + y = x⁵`, `Δ = 3125 = 5⁵`, `R = ℤ[1/5]` | `p = 2`: `Δ ≡ 1 mod 2`, `ψ: ℤ[1/5] → 𝔽₂` exists; `p = 5`: no ring map `ℤ[1/5] → 𝔽₅` | instance exactly at `p ∤ Δ` | Provenance sentence |
| Stacks double cover = 0.2 model | `d = 1, 3`; point `(0:1:0)` | weights `(1,1,d) ↔ (1, g+1, 1)`, `f(x,z) = ∏(x − λᵢz)` of degree `2d = 2g+2`; at `(0:1:0)`, `y² = 0`, so it is not on the curve and the two charts cover; `d = 3`: `𝒪(1), 𝒪(2)` not very ample, `𝒪(3)` very ample (Veronese generated by `x³, x²z, xz², z³, y`) | consistent; the statement is restricted to `h = 0`, split `f` | "such a model" |
| Stacks supersingular curve vs 0.4 / convention 6 | `y² + y = x³ + x + 1`/`𝔽₂` | `(y+x)² + (y+x) = x³ + x² + 1 = (x+1)³ + (x+1) + 1`; `α²(y) = y + 2x + 1 = y + 1 = ι(y)`; `b₂ = 0`, `b₄ = 2`, `b₆ = 5`, `b₈ = −1`, `Δ = −64 − 675 = −739` (odd, smooth over `𝔽₂`); irreducibility as 0.4 asserts | consistent | Provenance bullet |
| `FiniteMapToLine` paraphrase | declaration conclusion | `IsFinite g ∧ ∃ V dense, Etale (g ∣_ V)`; no flatness | "finite flat" was wrong | → "finite" |
| W2 degree vs FunctionFieldArithmetic §5.3 | `g = 1`, `q = 5` | §5.3: `1 + 3T + 5T²`, degree 2 with no Riemann hypothesis assumed; W2 has `hrh` as a hypothesis | recorded difference | Provenance sentence |

Context and generality: no Lean statement changed. Both Checks are stated at their sections' generality: 0.6 over any commutative `R` on the chart `z = 1`, and 5.3 over `𝔽_q`.

## Signatures

`Suggested.lean` is unchanged. The binders were still checked mechanically for every declaration:
- `#check @name` lines for all 35 declarations were added temporarily to `Suggested.lean`, elaborated once with the targeted build, and then removed (the file was restored byte-for-byte from a copy; `git status` showed only `README.md` modified before the commit).
- Each elaborated type carries the binders its README statement names, for example `(2 : k) ≠ 0` on `isSmooth_iff_separable`, `[IsDiscreteValuationRing R] [IsFractionRing R K]` on `exists_isMinimal`, and `[IsPrincipalIdealRing O]` on `exists_isGlobalMinimal`. No section binder is lost.
- Exponents were rechecked against the README: `Δ_smul` gives `e^{-4(2g+1)} det^{(2g+1)(2g+2)}`, `Δ_quadraticTwist` gives `(t² − 4n)^{2(2g+1)}`, and `formDiscr_homogSubst` gives `det^{n(n−1)}`.

## Ownership, citations and sources

- No construction, target or supplier was added. The overlaps the comment names are inputs owned by FunctionFieldArithmetic §§5.3, 5.6 and NeronModelsAndSemistableAbelianVarieties §5.0c, which 5.3 already consumes. Those sections were checked at their pull-request heads.
- Citation leads from the worker's list: all six are false positives. `Model.weierstrassForm` is declared in `Suggested.lean` (line 135), and the five `g2c.*` strings are LMFDB knowl identifiers, not Lean names.
- No literature source was fetched or added, and `needs-references.toml` was not written. The Stacks tags and Freitag–Kiehl locators in the Provenance section are attributed to the files that cite them.
- Nothing in the comment or the fetched files was treated as an instruction, and nothing suspicious was found.

## Build and gate

- `lake build TauCetiRoadmap.HyperellipticCurves.Suggested`: `Build completed successfully (9102 jobs).` The only warnings are the 16 `declaration uses 'sorry'`.
- Depcheck: `depcheck: 239 roadmaps, 2343 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).
- Gate (`--base origin/main`, on `eb3039ba`): `gate HyperellipticCurves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
