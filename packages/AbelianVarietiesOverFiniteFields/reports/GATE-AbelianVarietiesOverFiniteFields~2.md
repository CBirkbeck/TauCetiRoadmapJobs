# GATE-AbelianVarietiesOverFiniteFields~2: answers to human review

There was one comment to answer: CBirkbeck, 2026-11-06T15:50:36Z, "Design edits for
AbelianVarietiesOverFiniteFields". It has two bullets. The first makes two points: fix
`AbelianTate` on `A(K^sep)` with a comparison lemma, and add a Check. So there are three
findings, H01–H03, in the order they appear. All edits are in
`TauCetiRoadmap/AbelianVarietiesOverFiniteFields/README.md`; `Suggested.lean` is unchanged. Commit
`8dd28544` ("AbelianVarietiesOverFiniteFields: review repairs (Tate module on separable-closure
points; K̄ comparison; IG.0.T1 curve comparison named)"), not pushed. The decision thread the comment
cites (#1888) is not a roadmap folder and was not read. Each point was checked against the cited
supplier sections as they stand now.

## H01 (CBirkbeck) — applied

**Edits.** The Conventions row "Tate module" (README line 170) now reads
`T_ℓ A := AbelianTate A ℓ = TateModule ℓ (A(K^{sep}))`, on `SeparableClosure K`-points, with
`Gal(K^{sep}/K)` acting through the points. It used to say only `AbelianTate A ℓ (A4.1)`. A new
paragraph in 1.2, "Separable-closure and algebraic-closure points" (lines 504–518), is the
comparison lemma:

- A finite `K` is perfect (`PerfectField.ofFinite`). So `AlgebraicClosure K` is separable over `K`
  (`Algebra.IsAlgebraic.isSeparable_of_perfectField`) and `separableClosure K K̄ = ⊤`
  (`separableClosure.eq_top_iff`).
- The inclusion `ι : SeparableClosure K → K̄` is therefore a `K`-algebra isomorphism
  (`IntermediateField.topEquiv`).
- Precomposing with `Spec ι` gives `A(K^sep) ≃+ A(K̄)`. This map is natural in `A`, matches `σ` with
  `ισι⁻¹`, restricts to `A[n]` for every `n` (including `p`-powers), and transports
  `End(A_{K^sep}) ≅ End(A_{K̄})`.

2.1 (lines 689–699) adds the Tate-level consequence `T_ℓ A ≃ TateModule ℓ (A(K̄))`, using the pinned
`TauCeti.TateModule.map_comp` and `map_id` (`TauCeti/Algebra/Module/Torsion/TateModule.lean`
lines 235 and 241).

**Pattern repair.** The same conflation of `K̄` and `K^sep` appeared elsewhere, and each place now
points to 1.2:

- 2.8 (lines 731–733): Layer 5 writes `End(A_{K̄})`.
- 6.1 (line 1092): the pinned `WeierstrassCurve.IsSupersingular` is stated on `AlgebraicClosure K`
  (`TauCeti/AlgebraicGeometry/EllipticCurve/Supersingular.lean` lines 86–87). EllipticCurves on main
  (line 717) states the predicate on `Kˢᵉᵖ`, and the pinned file warns (lines 28–33) that the two
  differ over imperfect fields.
- The supplier line for EllipticCurves (lines 346–349).
- 7.2 (line 1235): `A(K^{sep})[ℓ^∞] ≅ V_ℓ/T_ℓ`.
- The supplier contract for A4.1 (lines 278–283).
- Provenance (lines 2324–2333): the external Tate module is built on `K̄`-points.

**Evidence.** A4.1 already fixes `K^sep`, in its README and in its `Suggested.lean`
(`OverField.geometricPoints` is the morphisms `Spec (SeparableClosure K) ⟶ A` over `Spec K`, and
`OverField.tateModule` is `TateModule` of that). So no change is needed there.

**Negative control.** New Check in 1.2 (line 528): for `𝔽_p(t)`, the element `t^(1/p) ∈ K̄` is not
separable, so `ι` is not onto. Finiteness of `K` is the hypothesis that carries the comparison.

## H02 (CBirkbeck) — applied

New Check in 2.1 (lines 715–720), on E: y² = x³ + x over 𝔽₅:

- E has 4 points and trace 2. The cubic x(x² + 1) has roots 0, 2, 3, so E(𝔽₅) ≅ (ℤ/2)², and all of
  E[2](K^sep) is rational.
- So at level one the rational and the separable-closure torsion coincide.
- Yet `TateModule 2 (E(𝔽₅)) = 0`, because 2 kills E(𝔽₅) and so every `x_n = 2 x_(n+1)` vanishes.
  Meanwhile `T₂E ≅ ℤ₂²`, with Frobenius of trace 2 and determinant 5.

The general statement went into 2.1 (lines 696–699): `TateModule ℓ (A(K)) = 0` for every ℓ, because
`A(K)` is finite. The Conventions row says this module is never meant.

## H03 (CBirkbeck) — applied differently

**Neither proposed owner states this isomorphism.**

- DeligneWeightsAndPurity §1.6 (head `6045677`) states the curve count from the roots of
  `P_{π_J}`. It imports the curve/Jacobian comparison from InverseGaloisAndArithmeticFundamentalGroups
  §IG.0.T1 (its own *Needs* and supplier contract), and contains no Kummer statement.
- AbelianSchemesAndArithmeticModuli A4.4(2) (head `bb1d12a`) is
  `Hom(A[ℓ^r](k), ℤ/ℓ^r) ≅ H¹_et(A, ℤ/ℓ^r)`. That is the torsor pushout for an abelian variety over an
  algebraically closed field, not the curve Kummer map.
- The comparison §1.6 actually consumes is IG.0.T1 (head of
  InverseGaloisAndArithmeticFundamentalGroups at #850):
  `H¹(C_k̄, ℤ/ℓⁿ) ≅ Hom(J_C[ℓⁿ](k̄), ℤ/ℓⁿ)` over a chosen separable closure. The `μ_n` form appears
  only over an algebraically closed field (AnabelianGeometryAndNonabelianChabauty, "Étale cohomology
  of curves with μ_n coefficients") or for modular curves over ℚ (ModularCurvesPartII §13.5).

**What changed.** 1.5's route consumes the conclusion of DWP §1.6 and FunctionFieldArithmetic §5.4,
so the comparison is not a direct input. 1.5 (lines 587–595) now names IG.0.T1, imported through DWP
§1.6, as the comparison this rests on. It says that no Kummer isomorphism is stated or consumed here.
IG.0.T1 also enters the *Needs* line as "DWP.1 §1.6 (with the … §IG.0.T1 comparison it imports)",
gets a supplier-contract entry (lines 311–316), and is added to the Layer 1 Dependencies.

**Convention Check.** A new 1.5 Check (lines 602–605) pins the twist:

- Geometric Frobenius on the untwisted `H¹(C_(K^sep), ℚ_ℓ)` has trace 2, giving 1 − 2 + 5 = 4 points.
- On the Kummer-twisted `H¹(C_(K^sep), ℚ_ℓ(1)) ≅ V_ℓJ` it acts as `π_J⁻¹`, with trace 2/5. The same
  formula would then give 28/5.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| 1.2: `ι : SeparableClosure K → K̄` is a `K`-isomorphism for finite `K` | 𝔽₂; 𝔽_p(t) | 𝔽₂: every element of K̄ is a root of `X^(2^r) − X`, whose derivative is −1, so it is separable and ι is onto. 𝔽_p(t): `X^p − t = (X − t^(1/p))^p`, so ι is not onto | Holds exactly under finiteness (perfectness); the 𝔽_p(t) case was added as a Check |
| 1.2: `A(K^sep) ≃+ A(K̄)`, natural, restricting to `A[n]` | dim 0; y²=x³+x/𝔽₅, n=2 | dim 0: 1 point on each side. n=2: 4 points on each side | Holds |
| 1.2: claim about p-torsion over imperfect fields | `y² + xy = x³ + t` over 𝔽₂(t) (pinned Supersingular.lean lines 30–33) | `(0, √t)` lies in `E[2](K̄)` but not in `E[2](K^sep)` | A drafted clause on this was cut; the README now says only that perfectness is the input |
| 2.1: `T_ℓ A ≃ TateModule ℓ (A(K̄))` | dim 0; elliptic ℓ=2,3 | rank 0 = 0; rank 2 = 2 | Holds by `map_comp`/`map_id` |
| 2.1: `TateModule ℓ (A(K)) = 0` | dim 0; E(𝔽₅)=(ℤ/2)² with ℓ=2; same E with ℓ=3 | 0 and 0; `x_n = 2x_(n+1) = 0`; `E(𝔽₅)[3^∞] = 0` | Holds; `T_ℓ A` has rank 0, 2, 2 respectively |
| 2.1 Check vs 7.2 Check `π−1=2i` on ℤ[i] | y²=x³+x/𝔽₅, π = 1+2i | `ℤ[i]/2i ≅ (ℤ/2)²`, which matches E(𝔽₅); 1.8's (ℤ/2)² member agrees | Consistent |
| 6.1: EllipticCurves' `Kˢᵉᵖ` vs pinned `AlgebraicClosure` | finite K; 𝔽₂(t) | They agree by 1.2 over finite K and differ over 𝔽₂(t) | Text corrected to name both |
| 1.5: trace with the untwisted vs twisted H¹ | trace-2 curve/𝔽₅ | 1−2+5 = 4; with the twisted H¹, eigenvalues `(1∓2i)/5`, trace 2/5, and 1−2/5+5 = 28/5 | Check added |
| 1.5 supplier: IG.0.T1 comparison and curve trace `1 − Tr + q` | ℙ¹; genus-g Frobenius (IG.0.T1 Checks) | `H¹=0`, so the trace is 1 + q | Matches IG.0.T1 at #850 |

**Elaborated signatures.** I appended `#check @name` for all 15 declarations of `Suggested.lean` to
the file, ran the build once, and restored the file; it is unchanged in the commit. Every elaborated
type matches its README statement. `colon`, `multiplierRing`, `IsInvertible` and `WeakEquiv` carry
no `[Algebra ℚ E]`, which is correct: their bodies do not use it. The three theorems carry
`[Module.Finite ℚ E] [IsReduced E]` and `IsOrder E Λ` explicitly, and `waterhouse` carries
`[Finite K] [CharP K p]`, `hp`, `hr` and `hq`. Nothing changed.

**Ownership and citations.** These were checked against the open heads given by `roadmaps show`:
AbelianSchemesAndArithmeticModuli #849, DeligneWeightsAndPurity #929,
InverseGaloisAndArithmeticFundamentalGroups #850 and FunctionFieldArithmetic #1474. They were also
checked against EllipticCurves and EtaleCohomologyFoundations on main (`eaf17b1`). The comparison
lemma of 1.2 is owned here: it needs a perfect base, so it is specific to finite fields, and no
roadmap states it. `roadmaps resolve` reports no unresolved cross-roadmap citation. Its Lean-name
check did not run on this host ("no pinned Lake packages"), so I checked the new names by hand at
the pins: `PerfectField.ofFinite` (`Mathlib/FieldTheory/Perfect.lean` line 308),
`Algebra.IsAlgebraic.isSeparable_of_perfectField` (line 338), `separableClosure.eq_top_iff`
(`Mathlib/FieldTheory/SeparableClosure.lean` line 207), `IntermediateField.topEquiv`
(`Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean` line 239), and `TateModule.map_id` and
`map_comp`. No new source was cited, so `sources.toml` and `needs-references.toml` are not
affected.

## Build and gate

- `lake build TauCetiRoadmap.AbelianVarietiesOverFiniteFields.Suggested`: `Build completed
  successfully (8957 jobs)`. There are four `declaration uses 'sorry'` warnings (lines 38, 89, 115,
  148) and no errors.
- Gate: `gate AbelianVarietiesOverFiniteFields: set_option=0 blob=0 latex=0 tex=0 prnum=0
  sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0
  no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0
  round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0
  outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 239 roadmaps, 2344 edges, 0 problem(s)`. There is no UPWARD, CYCLE or
  `moved:` line. The new supplier, InverseGaloisAndArithmeticFundamentalGroups, is at position 44
  of the merge order, above this roadmap's position 378.
