# Review of CalibratedGeometry (pull request #946 at 37684bb)
**Verdict:** needs changes

:robot: Independent AI review: a full review of the head the previous report read (no change in the folder since). The gate, the dependency check and the elaboration pass. Nine findings, five blocking. The previous report's one finding is not repaired (R03 here). The new findings come from checking the pinned Tau Ceti (`2fd255d9`) object by object, from the PDE roadmap's restructure on main, and from computing the 6.3 Campanato statement on an instance. The worktree was not changed; every probe ran on scratch copies.

## R01 (P2) — 6.3's Campanato Hölder bound is false without connectedness or an L² term

**Location.** `TauCetiRoadmap/CalibratedGeometry/README.md:947`, "`[f̃]_(C^(0,ζ)(U′)) ≤ C [f]_(ζ,U′)^(1/2)`", in the exact form stated at `:942–951` for any open `U′ ⋐ U` with `dist(U′, ∂U) > ρ₀`.

**Claim.** The global ζ-Hölder seminorm of the representative on `U′` is bounded by the Campanato seminorm alone.

**Witness.** Take `n = 1`, `U = (−10,10)`, `U′ = (−3,−1) ∪ (1,3)`, `ρ₀ = 1/2` and `f = 1` on `[0,10)`, `0` elsewhere. `f` is constant on every ball centred in `U′` of radius `≤ ρ₀`, so `[f] = 0`, yet `[f̃]_(C^(0,ζ)(U′)) = 2^(−ζ) > 0`. Campanato1963 line 81 assumes Ω connected and line 238 uses it.

**Repair.** State `[f̃]_(C^(0,ζ)(U′)) ≤ C([f]_(ζ,U′)^(1/2) + ‖f‖_(L²(U)))` with `C = C(n, ζ, ρ₀)`. Pairs with `|x − y| ≤ ρ₀/2` follow from the Campanato chain through `B_(|x−y|)(y) ⊂ B_(2|x−y|)(x) ⊂ U`, and farther pairs from the sup bound. On the instance the right side becomes `C·√10 > 0`. Alternatively restrict the seminorm to pairs with `|x − y| ≤ ρ₀/2`. Add the two-interval function as a negative-control Check. If R04's repair replaces this statement with Tau Ceti's local two-point estimate, that also settles this finding.

## R02 (P2) — The fundamental theorem of calibrations is statable at the pins but absent; the docstring's reasons are false

**Location.** `TauCetiRoadmap/CalibratedGeometry/Suggested.lean:15–18`: "the pins have no differential forms on manifolds, no exterior derivative of such forms and no integration of forms over smooth chains or submanifolds". Also `:25`, "no de Rham cohomology of a manifold", and `:28`, "no Hodge star or codifferential on a manifold".

**Claim.** Layer 3's headline cannot be stated at the pins, and Layer 6's cannot for the reasons given.

**Witness.** Tau Ceti `2fd255d9` has `TauCeti.RoughForm` (`TauCeti/Geometry/Manifold/DifferentialForm/Basic.lean:41`), `TauCeti.mextDeriv` (`…/ExtDeriv.lean:145`), `TauCeti.integralTopForm` (`…/Integration/TopForm.lean:518`) and `Bundle.ContMDiffRiemannianMetric.pullback` (`…/Riemannian/Pullback/Basic.lean:158`). The statement below elaborates against them: exit 0, one `sorry`.

**Repair.** Add the closed-source form of the theorem under a `/-! ## Layer 3: … -/` heading. It is 3.1's homology version, and its competitor hypothesis (equal pairing with every smooth closed k-form, i.e. real-homologous) is weaker than an integral bounding chain. It was tested on a scratch copy with the extra imports `public import TauCeti.Geometry.Manifold.DifferentialForm.{ExtDeriv, Pullback.Basic, Integration.TopForm, Smooth}` and `TauCeti.Geometry.Manifold.Riemannian.{VolumeForm, Pullback.Basic}`, written one module per line; the scratch build gives exit 0 with the `sorry` as its only warning.

```lean
/-- A calibration for `g`: a smooth closed `k`-form at most one on every `g`-orthonormal frame. -/
def IsCalibration (g : ContMDiffRiemannianMetric I ∞ E (fun x : M ↦ TangentSpace I x)) {k : ℕ}
    (φ : RoughForm I M ℝ k) : Prop :=
  IsSmoothForm I ∞ φ ∧ mextDeriv φ = 0 ∧
    ∀ x (v : Fin k → TangentSpace I x),
      (∀ i j, g.inner x (v i) (v j) = if i = j then 1 else 0) → φ x v ≤ 1

/-- The metric of `g` pulled back along an immersion. -/
@[reducible] def pullbackBundle (g : ContMDiffRiemannianMetric I ∞ E (fun x : M ↦ TangentSpace I x))
    (f : N → M) (hf : ContMDiff I' I ∞ f) (hinj : ∀ x, Function.Injective (mfderiv I' I f x)) :
    RiemannianBundle (fun x : N ↦ TangentSpace I' x) :=
  ⟨(g.pullback f (by simpa using hf) hinj).toRiemannianMetric⟩

/-- The volume of an oriented immersion: the integral of its pulled-back volume form. -/
def immersionVolume {k : ℕ} (g : ContMDiffRiemannianMetric I ∞ E (fun x : M ↦ TangentSpace I x))
    (f : N → M) (hf : ContMDiff I' I ∞ f) (hinj : ∀ x, Function.Injective (mfderiv I' I f x))
    (o : Manifold.Orientation I' N (Fin k)) : ℝ :=
  letI := pullbackBundle g f hf hinj
  integralTopForm o (riemannianVolumeForm o)

/-- `f` is calibrated by `φ`: `f*φ` is the volume form of the pulled-back metric. -/
def IsCalibratedImmersion {k : ℕ}
    (g : ContMDiffRiemannianMetric I ∞ E (fun x : M ↦ TangentSpace I x)) (φ : RoughForm I M ℝ k)
    (f : N → M) (hf : ContMDiff I' I ∞ f) (hinj : ∀ x, Function.Injective (mfderiv I' I f x))
    (o : Manifold.Orientation I' N (Fin k)) : Prop :=
  letI := pullbackBundle g f hf hinj
  mpullback I' I f φ = riemannianVolumeForm o

theorem immersionVolume_le_of_isCalibratedImmersion {k : ℕ} [I'.Boundaryless] [I''.Boundaryless]
    [CompactSpace N] [CompactSpace N'] [T2Space N] [T2Space N']
    (g : ContMDiffRiemannianMetric I ∞ E (fun x : M ↦ TangentSpace I x)) (φ : RoughForm I M ℝ k)
    (hφ : IsCalibration g φ)
    (f : N → M) (hf : ContMDiff I' I ∞ f) (hinj : ∀ x, Function.Injective (mfderiv I' I f x))
    (o : Manifold.Orientation I' N (Fin k)) (hcal : IsCalibratedImmersion g φ f hf hinj o)
    (f' : N' → M) (hf' : ContMDiff I'' I ∞ f') (hinj' : ∀ x, Function.Injective (mfderiv I'' I f' x))
    (o' : Manifold.Orientation I'' N' (Fin k))
    (hhom : ∀ η : RoughForm I M ℝ k, IsSmoothForm I ∞ η → mextDeriv η = 0 →
      integralTopForm o (mpullback I' I f η) = integralTopForm o' (mpullback I'' I f' η)) :
    immersionVolume g f hf hinj o ≤ immersionVolume g f' hf' hinj' o' := by
  sorry
```

The statement is true: `Vol(f) = ∫ f*φ = ∫ f′*φ ≤ Vol(f′)`, with `hhom` applied at `η = φ` and the pointwise bound of 2.2. The variable block is three manifolds with finite-dimensional real inner-product models, `IsManifold … ∞`.

Then rewrite the docstring bullets against the pin:
- Layer 6's missing carrier is the space of nearby submanifolds modulo reparametrization with its C¹ topology. De Rham cohomology (`TauCeti.deRhamCohomology`, `TauCeti/Geometry/Manifold/DeRham/Basic.lean:127`), the Hodge star (`TauCeti.SmoothForm.hodgeStar`, `…/Riemannian/HodgeStar.lean:296`) and the codifferential (`TauCeti.SmoothForm.codifferential`, `…/Riemannian/Codifferential.lean:88`) are pinned.
- Re-check the Layer 4–5 bullets against pinned complex manifolds (`TauCeti.SmoothAlmostComplexStructure.ofComplexManifold`, `…/Complex/AlmostComplexStructure.lean`), the wedge of smooth forms (`TauCeti.SmoothForm.wedge`, `…/DifferentialForm/Wedge/Smooth/Basic.lean:171`) and the Levi-Civita connection.

Finally, name the new declarations in 3.1 and update `README.md:30–32`.

## R03 (P2) — DifferentialGeometry Layers 6, 8 and 9 are dropped at the open DifferentialGeometry head, with no stated order (carried: R01 of the previous report)

**Location.** `TauCetiRoadmap/CalibratedGeometry/README.md:521`, "DifferentialGeometry 5.1, 5.2, 8.3, 8.4, 9.3". The same citations appear at `:43, :62, :100, :173–175, :471, :489, :518, :543, :559, :563, :809, :1077`.

**Claim.** These are supplier citations that resolve on main, at `TauCetiRoadmap/DifferentialGeometry/README.md:782, :836, :845, :872`.

**Witness.** At #886's head `a565de62` the layers run 0–5, 5.6, 12 (`README.md:288–1204`). Lines `:1378–1381` hand smooth singular chains, the de Rham theorem, Poincaré duality and the fundamental-class integration comparison to DeRhamCohomologyAndDuality, which is `ORDER.txt:395`, after this roadmap at `:226`.

**Repair.** Do not cite DeRhamCohomologyAndDuality (it would be an upward citation). Two steps:

1. Repoint what is pinned, since it survives #886:
   - 8.3 and 8.4's carrier and integral: `TauCeti.SmoothSimplex`, `TauCeti.smoothSingularSubcomplex` (`TauCeti/Geometry/Manifold/SmoothSingular/Basic.lean:121, :77`) and `TauCeti.SmoothSimplex.integral` (`…/SmoothSingular/Integral.lean:86`).
   - 5.3's de Rham cohomology: `TauCeti.deRhamCohomology`.
2. For the de Rham map into singular cohomology and 9.3's fundamental-class integration comparison (2.4, 3.1, 5.3), which are not pinned, do one of these:
   - state in the pull request's merge-order paragraph that #946 merges before #886 and that #886 repoints these lines, as it must for GeometricCurrents and HeegaardFloer on main; or
   - own the closed-source comparison in 2.4, against the pinned `TauCeti.HomologicalOrientation.evalFundamentalClass` (`TauCeti/AlgebraicTopology/Cohomology/FundamentalClass.lean:88`).

## R04 (P2) — 6.3 owns the Campanato, Dirichlet-growth and iteration lemmas that Tau Ceti already proves

**Location.** `TauCetiRoadmap/CalibratedGeometry/README.md:940–953`: "consume PDE's scalar statement … and extend it componentwise … Own its Dirichlet-growth consequence … and the quantitative geometric iteration lemma." Also `:55–57`, "its vector-valued Campanato package".

**Claim.** These three results are this roadmap's to build.

**Witness.** All three are pinned at Tau Ceti `2fd255d9`:
- `TauCeti.MeasureTheory.dist_preciseRepresentative_le_of_setAverage_norm_sub_le` (`TauCeti/MeasureTheory/Function/Campanato.lean:257`): local, with any normed target;
- `TauCeti.W1p.holderOnWith_preciseRepresentative_of_setIntegral_norm_gradient_le` (`…/Sobolev/W1p/DirichletGrowth.lean:167`);
- `TauCeti.exists_le_mul_div_rpow_mul_add_mul_rpow_of_le_mul_add` (`…/SpecificLimits/DecayIteration.lean:109`).

**Repair.** Delete the three owned statements and the restated exact form, and list the declarations under "From Tau Ceti". The L² hypotheses reach their L¹ forms by Cauchy–Schwarz: `∫_(B_ρ)|Dw|² ≤ Mρ^(n−2+2ζ)` gives `∫_(B_ρ)|Dw| ≤ |B₁|^(1/2) M^(1/2) ρ^(n−1+ζ)`, which is the growth hypothesis of `DirichletGrowth.lean:167` with `α = ζ`. Keep as targets here:
- the Legendre-system comparison;
- the full-tensor energy and excess decay (the pinned `TauCeti/Analysis/PDE/Regularity/ConstantCoefficientDecay.lean` covers one scalar matrix only);
- the system Caccioppoli inequality.

## R05 (P2) — 2.3 constructs the integral smooth-chain complex that Tau Ceti already has

**Location.** `TauCetiRoadmap/CalibratedGeometry/README.md:471–473`: "construct the integral chain complex with chains `SmoothSimplex I M p →₀ ℤ`, the alternating face boundary and `∂∂ = 0`". The Scope line at `:42–44` claims the same.

**Claim.** The integral complex and its map into singular chains are owned here.

**Witness.** `TauCeti.smoothSingularSubcomplex` (`TauCeti/Geometry/Manifold/SmoothSingular/Basic.lean:77`) with Mathlib `SSet.chainComplex` (`Mathlib/AlgebraicTopology/SimplicialSet/Homology/Basic.lean:67`) gives smooth chains over any coefficient object. `SSet.chainComplexMap (smoothSingularSubcomplex I M).ι` maps them into singular chains, and `TauCeti.smoothSingularSubcomplexMap` (`:205`) pushes them forward.

**Repair.** Consume these for ℤ and ℝ coefficients; change of coefficients is naturality in the coefficient object. Keep as targets the quasi-isomorphism with its chain homotopies, the subdivision laws, the chain integral (sums of `TauCeti.SmoothSimplex.integral`) and mass. Rewrite the Scope bullet and the GeometricCurrents line at `:1072–1078` to match.

## R06 (P3) — PDE citations drifted when PDE was restructured on main

**Location.** `TauCetiRoadmap/CalibratedGeometry/README.md:1006`, "prove uniform ellipticity and apply PDE E.22 componentwise", applied to the system with principal part `g^(ij)(x,u,Du) ∂_ij u`. Likewise `:231, :964, :977, :1017` (E.22), `:228, :931` (A.1, A.2) and `:940` ("build inventory's Campanato/Morrey item").

**Claim.** E.22 supplies the Schauder estimate for this non-divergence system, and A.1 supplies Sobolev spaces on domains of ℝⁿ.

**Witness.** PDE on main since `d0bb87a6` (2026-11-05): `TauCetiRoadmap/PDE/README.md:1927` "5.3 Divergence-form Schauder estimates (E22)" concludes C^(1,β); `:2097` "5.6 Non-divergence Schauder estimates (E25)" gives C^(2,α); `:677` "1.1 … Sobolev classes on intervals (A1)".

**Repair.**
- Cite PDE 5.6 (E25) at `:1006` and `:1017`, or rewrite the system in divergence form with C¹ coefficients and keep E22 for its C^(1,β) conclusion.
- For A.1, A.2 and A.5, cite the pinned Tau Ceti carriers PDE names: `TauCeti.W1p` (`TauCeti/Analysis/Sobolev/W1p/Basic.lean:372`), `TauCeti.W1p0` (`…/W1p/Zero.lean:158`) and `TauCeti.W1p.norm_value_le_mul_norm_gradient_of_subset_slab` (`…/Poincare/W1p0.lean:102`).
- Cite PDE 1.7 (A7) by its own title, which now states the Campanato characterization itself.

## R07 (P3) — The supplier contracts route pinned objects through roadmaps and misdescribe RiemannianGeometry R1

**Location.** `TauCetiRoadmap/CalibratedGeometry/README.md:185–188`, "0.1.2 `hermitian_gram_hadamard`" (also `:65–66, :268, :273, :311, :426`). `:192`: "R1 (Levi-Civita connection, normal bundles, second fundamental form)". The "From Tau Ceti" section at `:152–166` lists only symplectic and Maslov declarations.

**Claim.** The Gram–Hadamard bound comes from SuccessiveMinima, and R1 supplies normal bundles and the second fundamental form.

**Witness.** Tau Ceti `Matrix.re_det_gram_le_prod_norm_sq` (`TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean:139`) holds for any finite family, empty and dependent ones included. On main, RiemannianGeometry R1 (`README.md:179`) is curvature calculus; normal bundles and B are R5a (`:1044–1051`).

**Repair.** Under "From Tau Ceti", list:
- `Matrix.re_det_gram_le_prod_norm_sq`, plus `OrthonormalBasis.norm_det_le_prod_norm` (`:77`) for 5.1's route `|det_ℂ v| ≤ 1`, which 5.1's *Needs:* omits;
- `TauCeti.Manifold.ContMDiffNondegenerateMetric.leviCivitaConnection` (`…/LeviCivita/Nondegenerate/Existence.lean:102`);
- `TauCeti.IsSmoothTriangulation` (`TauCeti/Geometry/Manifold/SmoothTriangulation/Basic.lean:191`), the carrier of 2.4's triangulations;
- `Bundle.ContMDiffRiemannianMetric.pullback` and `TauCeti.riemannianVolumeForm` for 2.2.

Drop the SuccessiveMinima section. Describe R1 as curvature and tensor connections, and cite R5a for the normal bundle, B and the normal connection.

## R08 (P3) — Two sampled locators do not contain the statement as written

**Location.** `TauCetiRoadmap/CalibratedGeometry/README.md:326–328`: the 1.3 comparison `comass(φ) ≤ |φ|_H ≤ sqrt(binomial(dim E, k))·comass(φ)` cites "Harvey–Lawson 1982, II.(3.1), p. 56". `:805–807`: 5.3's constant-phase criterion in the Kähler ambient cites "Harvey–Lawson 1982, Proposition III.2.17, p. 96".

**Claim.** The cited passages state these results.

**Witness.** HarveyLawson1982 line 370, (3.1), only defines comass as a supremum over unit simple p-vectors. Line 1647, Proposition 2.17, concerns submanifolds of ℂⁿ, proved through the flat identity (2.19).

**Repair.**
- Keep (3.1) for the definition and the simple-vector inequality. Give the Hilbert-norm comparison its two-line proof: pair with a unit simple vector for the lower bound; bound each of the `binomial(n, k)` coefficients by comass for the upper bound.
- In 5.3, say the source proves the flat case, and that the Kähler case is the same computation using `∇Ω = 0`, owned here.

## R09 (P3) — `specialLagrangianFrame_iff` assumes `1 ≤ n` without needing it

**Location.** `TauCetiRoadmap/CalibratedGeometry/Suggested.lean:188`: "theorem specialLagrangianFrame_iff (n : ℕ) (hn : 1 ≤ n) (θ : ℝ)".

**Claim.** The equality classification needs `n ≥ 1`.

**Witness.** At `n = 0`, `Ω ![] = 1` and `φ_θ ![] = cos θ`. The left side is `cos θ = 1` and the right side is `sin θ = 0 ∧ 0 < cos θ`, which are equivalent. The `n = 0` instance without `hn` is proved in a scratch copy (exit 0).

**Repair.** Delete `hn`; the signature without it was elaborated on a scratch copy. In 5.1, state that the classification holds for every n and only the comass statement needs `n ≥ 1`, matching `isCalibratedFrame_kahlerPowerForm_iff`, which carries no `r ≤ n`.

## Previous findings

- Previous R01 (DifferentialGeometry Layers 6, 8.3, 8.4 and 9.3 dropped at #886) is not repaired. The folder is unchanged (`changes.md`: 0 lines). The pull request's merge-order paragraph now reads "#860 (CStarAlgebras) → … → #942 (TangentialBordism) → **this pull request** (#946)" and names no order against #886, whose head is still `a565de62`. It is carried as R03, with an added repair route through the pinned smooth-simplex declarations.

## Verified sound

**Gate and build.**
- The worker's gate and my rerun of `gate … --base origin/main` both end in `OK`; every scanner reads 0, and the worker's run includes `build=0`.
- The dependency check, `gate --depcheck … --movable`, prints `depcheck: 244 roadmaps, 2465 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `lake env lean TauCetiRoadmap/CalibratedGeometry/Suggested.lean`: exit 0 in 8 s, eight `sorry` warnings (lines 56, 63, 87, 93, 142, 150, 179, 188) and nothing else.
- No file outside the folder changed; the folder holds README.md, Suggested.lean and metadata.toml only.

**Signatures and padding.**
- All 16 elaborated signatures were compared with the README. The hypotheses are where the README puts them (`FiniteDimensional` on the Layer 1 theorems, `1 ≤ n`, `r ≤ n`, `Orthonormal ℝ v`); the one surplus is `hn` (R09). `FiniteDimensional ℝ E` is not needed for the truth of either Layer 1 theorem (restrict to the span of the frame); this is noted, not raised.
- One-tactic probe, `first | rfl | simp | infer_instance | norm_num | aesop`, run on all eight theorems: none closes.
- `norm_standardKahlerForm` is not padding even though README 4.1 calls it the r = 1 instance. Deducing it needs the identification of `kahlerPowerForm n 1` with `standardKahlerForm n` (a Gram computation), and `standardKahlerForm` is also 5.2's carrier.

**Seeded sample.** 15 targets, all locators read at the text:
- McLean1998 lines 27, 32, 37–48, 448, 450–462, 483, 486, 493, 510, 519 (Cor 3.7 gives `b₁ ≥ n`, consistent with the torus Check), 527, 530, 532, 539–550, 572, 580, 589–595, 598 (p. 723), 603;
- Joyce2001SLLectures lines 53, 58, 62, 70, 76, 96, 107, 678;
- Zust2025Products lines 59 and 74 (page 2), 76;
- Campanato1963 line 224, Teorema I.2 on printed p. 183, where the label is lost in the OCR; Teoremi I.1 and I.3 are at lines 182 and 291;
- HarveyLawson1982 II.(3.1) p. 56, (3.3) and Lemma 3.5 p. 57, Thm 4.2 p. 59, Thm 6.11 and Lemma 6.13 p. 70, Prop 7.10 p. 76, Thm III.1.10 and Cor 1.11 p. 89, Thm 2.3 p. 91, Thm 2.13 p. 95, Prop 2.17 p. 96.

Every sampled locator checks out, apart from the two in R08 and the dropped Campanato hypothesis in R01.

**Library declarations opened at the pins.** Mathlib `1b1ccf4b`:
- `LinearMap.normDet` (`NormDet.lean:69`), with its `_sq_eq_det_gram` (:303), `_eq_zero_iff_ker_ne_bot` (:111), `_eq_norm_det_toMatrix_rangeRestrict` (:82) and `_of_subsingleton` (:228) lemmas;
- `ContinuousAlternatingMap.norm_def` (`Alternating/Basic.lean:194`), `norm_constOfIsEmpty` (:310), `norm_compContinuousLinearMap_le` (:432), `restrictScalars` (`Topology/Algebra/Module/Alternating/Basic.lean:448`);
- `ContinuousMultilinearMap.norm_compContinuous_linearIsometryEquiv` (`Multilinear/Basic.lean:1038`);
- `exteriorPower.inner_ιMulti_ιMulti` (`ExteriorPower.lean:127`; it gives `det(⟪x j, y i⟫)`, the README's convention), `alternatingMapLinearEquiv` (`ExteriorPower/Basic.lean:212`);
- `Matrix.det_gram_ne_zero_iff_linearIndependent` (`GramMatrix.lean:126`), `Matrix.detRowAlternating` (`Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:53`), `Submodule.pow_mem_pow` (`Operations.lean:358`), `contDiffAt_implicitFunction` (`ImplicitContDiff.lean:41`), Lax–Milgram (`LaxMilgram.lean`).

Tau Ceti `2fd255d9`:
- `stdSymplecticForm` (`StandardCompatible.lean:72`, evaluation `⟪u.1,w.2⟫ − ⟪u.2,w.1⟫`);
- `SymplecticForm.transport` (`SymplecticTransport.lean:61`, `ω(e.symm v, e.symm w)`), `Compatible.transport` (:224), `AlmostComplexStructure.transport` (`Transport.lean:58`);
- `SymplecticForm.IsLagrangian` (`Lagrangian/Basic.lean:115`, equality with the orthogonal), `complexAssociatedForm` (`Hermitian.lean:78`), `hermitianCore` (:260);
- `TotallyRealLoop.maslovIndex` (`Maslov/Index.lean:99`, with `ρ = det A / conj det A`), `alternatizeBilinCLM` (`Alternating/Bilinear.lean:43`, giving `B v₀ v₁ − B v₁ v₀`);
- plus every declaration cited in R02–R07.

**Supplier citations resolved.**
- On main `3b3f7ef`:
  - AlgebraicTopology Stages 2, 3.1, 6.3 (`:326, :481, :1180`);
  - GeometricTopology Layer 1 collars and tubes (`:206, :219`) and smoothing item 1 (`:938`);
  - RiemannianGeometry R5a, R5a.1 `volumeVariation_isContDiff`, R5a.2 (`:1044, :1069, :1103`);
  - ComplexKahlerGeometry K1, K2, K4, K5a, K5b.0, K6.1 (`:96, :193, :444, :570, :1169, :1274`);
  - PseudodifferentialOperators P1.0, P5, P6;
  - SmoothBundlesConnections B1.4, B2, B5;
  - LieGroups Layer 2;
  - CharacteristicClasses C1.1a, TopologicalKTheory T1.5 and T1.6a, GeneralizedCohomology G4.0b;
  - HeegaardFloer F1.4 (`:2195`) and F2.6c (`:2915`, owning the degree-two compatible-triple Wirtinger at `:47–48`);
  - GeometricCurrents' consumer lines (`:81, :88`);
  - DifferentialGeometry 0.3, 1.2, 5.1–5.4, 12.1, 12.4, 12.5, which #886 keeps.
- TangentialBordism B1.5 at #942 head `059ac6a9` (`README.md:632–660`): owns the relative triangulation (Munkres Thm 10.6) and names CalibratedGeometry 2.4 as consumer. TangentialBordism is `ORDER.txt:15`, before this roadmap at `:226`, and is in "Depends on".

**Open revisions read by hand** (the overlaps tool misses heading renames):
- AlgebraicTopology #1652 (`4e825d6a`) renames Stage k to Layer k and states that mapping at `README.md:452–460`.
- GeometricTopology #903 (`69d384f3`) maps "smoothing-and-triangulation item 1 → Layer 11.3" at `README.md:558–560`.
- ComplexKahlerGeometry #1398 keeps the K-ids in its headings.
- AlgebraicTopology #1663 keeps "Stage".

These citations survive those merges; only #886 drops ids without a mapping.

**Ownership.**
- Comass, calibrations, the Kähler-power calibration and special Lagrangian geometry occur in no other open roadmap. The `roadmaps grep` for comass, special Lagrangian, Wirtinger and McLean finds only consumers: GeometricCurrents, ComplexComparisonPartII's comass mass of currents, GromovWittenTheory's and TaubesGromov's comass bounds, and HeegaardFloer F2.6c.
- Tau Ceti has no comass, calibration or special Lagrangian declaration.

**Adversarial table.** Values computed for the headlines, the sampled targets and every target a finding touches.

| Statement | Instances | Values computed (each side) | Result |
|---|---|---|---|
| `norm_eq_sSup_abs_orthonormal` | `2dx₁∧dx₂` on ℝ²; constant −3 (k = 0); k = 3 on ℝ² | ±2 on orthonormal frames, sup 2 = `2|det| ≤ 2‖v₁‖‖v₂‖`; {3}, 3 = ‖const‖; `sSup ∅ = 0 = ‖0‖` | holds |
| `abs_eval_le_norm_mul_frameVolume`, `frameVolume` | `((1,0,0),(1,1,0))` and `dx₁∧dx₂`; `(v,v)`; `((2,0),(0,3))`; empty frame | `1 ≤ 1·1` (Gram det 1); `0 ≤ 0`; normDet 6; `normDet_of_subsingleton` gives 1 | holds; equality without orthonormality |
| 1.3 comparison | `dx₁∧dx₂+dx₃∧dx₄` on ℝ⁴; degree 1; `dx₁∧⋯∧dx_k` | `1 ≤ √2 ≤ √6`; equal; `1 = 1` | holds (locator: R08) |
| 1.5 Checks | `dx₁∧dx₂` on `(e₁,e₂)`, `(e₂,e₁)`, `(e₁,e₃)`; `((2,0,0),(0,1/2,0))` | `1, −1, 0`; value `2·½ = 1`, not orthonormal | holds |
| 1.6 Checks | `dx∧dx`; `ω₁∧ω₂`; Züst Φ₁∧Φ₂ | value ±1, `binomial(2,1)=2`; value 1 on `(e₁,ie₁,e₂,ie₂)`, `binomial(4,2)=6`; `294/256 ≈ 1.148 > 1` | holds |
| 2.1 Checks | `dx₁∧dx₂`, `2dx₁∧dx₂`, `x₃dx₁∧dx₂` | comass 1, 2, `|x₃|`; `d(x₃dx₁∧dx₂) = dx₁∧dx₂∧dx₃` (two transpositions) | holds |
| 2.3 boundary | 2-simplex with and without signs | `∂∂σ = 0`; unsigned: each vertex twice, `≠ 0` | holds (R05: complex pinned) |
| 2.4 square | `a<b<c<d`, `[a,b,d]`, `[a,c,d]` | `det((1,0),(1,1)) = 1`, `det((0,1),(1,1)) = −1`; `[a,d]` coefficients −1, +1; `∂c = [a,b]+[b,d]−[c,d]−[a,c]` | holds |
| 2.4 example | Δ² | `∂c = [e₁,e₂]−[e₀,e₂]+[e₀,e₁]`, `∫dx∧dy = 1/2` | holds |
| 3.1 / 3.2 | disk vs hemisphere; equator `Sᵐ ⊂ S^(m+1)` | `π ≤ 2π`; `(cos^m t)″(0) = −m`, `−2π` at m = 1 | holds |
| FTC probe (R02) | closed sources, `η = φ` in `hhom` | `Vol(f) = ∫f*φ = ∫f′*φ ≤ Vol(f′)`; scratch build exit 0 | holds, statable |
| `standardKahlerForm`, `norm_standardKahlerForm` | n = 1 `(1,i)`, `(i,1)`; n = 0 | `Im(conj 1·i) = 1`, `−1`; zero form, norm 0, so `hn` is needed | holds |
| `isCalibratedFrame_standardKahlerForm_iff` | n = 1 `(1,i)`, `(i,1)`, `(1,−i)`; n = 2 `(e₁,e₂)`; n = 0 | T/T, F/F (`1 ≠ −1`), F/F, F/F (`ω = 0`), F/F | both directions agree |
| `kahlerPowerForm`, `norm_kahlerPowerForm` | n = r = 2; r = 0; r = 3 > n = 2 | `ω̂² = 2e₁∧ie₁∧e₂∧ie₂`, value `2/2! = 1`; constant 1, norm 1; zero form, so `hr` is needed | holds |
| `isCalibratedFrame_kahlerPowerForm_iff` | n = 3, r = 2, `(e₁,ie₁,e₂,cos t·ie₂+sin t·e₃)` at t = 0, π, π/2 | value `cos t`: 1 / −1 / 0; right side: u = `(e₁,e₂)` matches at t = 0; reversed orientation at π; real 4-plane at π/2 | T/T, F/F, F/F |
| 4.2 ordering Checks | `(ie₁,e₁,e₂,ie₂)`, `(e₁,e₂,ie₁,ie₂)` | −1, −1 (one transposition each) | holds |
| 4.3 Checks | `ℂʳ×0`; lattice `a_jℤ+ib_jℤ`; real torus in ℂ² | `dx₁∧dy₁∧⋯`; `Π a_j b_j`; `ω(e₁,e₂) = Im⟨e₁,e₂⟩ = 0` | holds |
| `standardComplexVolume`, `norm_standardSpecialLagrangianForm` | n = 2 `(e₁,ie₂)`; n = 1; n = 0, θ = π/2 | `det = i`; `sup Re(e^(−iθ)z) = 1`; constant `cos(π/2) = 0`, so `hn` is needed | holds |
| `specialLagrangianFrame_iff` | n = 2 `(e₁,ie₂)` at θ = 0 and π/2; `(e₁,ie₁)`; n = 0 | `Re i = 0`, F/F (Im = 1); `Re(−i·i) = 1`, T/T; Ω = 0 and `Im⟨e₁,ie₁⟩ = 1`, F/F; `cos θ = 1 ⇔ sin θ = 0 ∧ cos θ > 0` (proved) | holds; `hn` unused (R09) |
| 5.2 dims and transport | `U(n)/SO(n)`, `SU(n)/SO(n)` at n = 1, 2, 3; `ω₀((1,0),(0,1))` | 1, 3, 6 and 0, 2, 5; `1 = standardKahlerForm 1 ![1,i]` | holds |
| 5.3 circle | radius ρ, `t = ie^(is)` | θ = s + π/2, `H = −e^(is)/ρ = J∇θ`, `ι_Hω(t) = −1/ρ = −dθ(t)`, Maslov degree 2 | holds (HL (2.19) sign: Source issues) |
| 5.4 Checks | `ax²/2`; `x₁x₂`; `|x|²/2` | `arctan a`; `det[[1,i],[i,1]] = 2`, Σ arctan(±1) = 0; `(1+i)² = 2i`, phase π/2; derivative `tr((I+H²)⁻¹K)` | holds |
| 6.1 sign | `V = Σa_j∂_(y_j)` on ℝⁿ | `β = −Σa_j dx_j`, `ι_V Im Ω|ℝⁿ = Σa_j ★dx_j = −★β`, second component `−d★β = (δβ) dvol` | holds |
| 6.2 Checks | S¹; two circles; Tⁿ | `∫f = 0`; per-component integrals ±1 with sum 0, so not in `Z_⊥`; `b₁ = n` | holds |
| 6.3 Campanato (R01) | two-interval `f` above | `[f] = 0`, `[f̃] = 2^(−ζ)`; repaired right side `C√10` | false as stated |
| 6.3 Dirichlet growth (R04) | L² growth exponent `n−2+2ζ` | L¹ exponent `n/2 + (n−2+2ζ)/2 = n−1+ζ` | matches the pin with `α = ζ` |
| 6.3 κ₀ | n = 1, γ = 0.75; n = 2, 3 | `κ₀ = 0.5 ∈ (0,1)`; `2γ`, `1+2γ`, both in `(0,n)` | holds |
| 6.4 Checks | Tⁿ in T^(2n); n = 1 | n y-translates = `b₁(Tⁿ)`; one family = `b₁(S¹)` | holds |
| 6.5 second jet | `A = (a)`; `diag(1,−1)`; `[[0,1],[−1,0]]` | `(√(1+t²a²))″ = a²`; `1+t² − (1+t²) = 0`; `(1+t²) − (1−t²) = 2t²`, so 4 = `(A₁₂−A₂₁)²` = `|W′|²` with `W₁₂ = 2t`; general `tr AᵀA − tr A² + (tr A)²` | holds |

## Not verifiable

- Munkres1966EDT (Chapter II, §10; Theorem 10.6, p. 104, via TangentialBordism) is waived. It was not read.
- HarveyLawson1982 is recorded as `uncertified` (paywalled). Acta Mathematica is free to read (the Institut Mittag-Leffler page links the 1882–2018 archive on Project Euclid), so the locators above were checked against the article's text in the sources cache. Whether the manifest status should change is the operator's call; this review edits no manifest.
- The truth of the eight admitted Lean theorems is not established by the build. Only the `n = 0` instance of `specialLagrangianFrame_iff` was proved.
- Of the Layer 4–5 docstring bullets, only the stated reasons were checked against the pin (R02). Whether those headlines are statable on the pinned complex-manifold carriers was not tested.

## Source issues

- **Misprint** in HarveyLawson1982 at Proposition III.2.17, formula (2.19), printed p. 96: the source gives the derivative of the phase along V as minus the pairing of H with JV. It should be plus that pairing for the trace mean-curvature vector, as the radius-ρ circle shows (both sides 1/ρ); affects nothing.
- **Misprint** in McLean1998 at the proof of Theorem 3.6, (3.6), printed p. 722: the source identifies the normal field with minus its contraction into the Kähler form. With the coframe of p. 719 this is the negative of the form (JV)♭ named in Theorem 3.13; the two should agree; affects nothing.
