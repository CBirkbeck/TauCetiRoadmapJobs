# Review of ComplexKahlerGeometry (pull request #1854 at c9c60d0)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/ComplexKahlerGeometry/` at c9c60d0 (README.md 1703 lines, Suggested.lean 510 lines). In this folder the pull request changes three README lines. Two replace "DGFloer" by "AlgebraicTopology Stage 5.0" in K8 (lines 1538 and 1613), and one rewords the RiemannianGeometry/SpinGeometry consumer clause (lines 609–610). Everything else is main's text and is reviewed as such. Pins: Tau Ceti 2fd255d, Mathlib 1b1ccf4.

Gate (re-run from the worktree, same text counts as the worker's): blob=29, sorry-data=20, imports=1, mathlib-subimports=5, no-import-mathlib=1, statement-hygiene=1, dropped=14, outside-folder=2 in the worker's run, FAIL. Dependency check: `depcheck: 237 roadmaps, 2416 edges, 0 problem(s)` (no UPWARD, CYCLE or `moved:` line). R03 and R04 describe two-way supplies that this check does not see. `lake env lean TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean`: exit 0, 37 `sorry` warnings, no other diagnostic.

## R01 (P1) — Twenty sorried data declarations in `Suggested.lean`

Location: `TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` lines 77–79, 139–174, 224–236, 287–314, 348–357, 369–375, 397–402, 428–437, 489–492 (gate rule `sorry-data`, 20 hits). Line 77: "def nijenhuisTensor (J : …) : (x : M) → TangentSpace I x →L[ℝ] … := by sorry".

Claim: the topology, `ContinuousSMul` and `LocallyConvexSpace` instances on `RealBundleTest`/`BundleTest` have bodies `by sorry`. So do `nijenhuisTensor`, `realBundleTestOfChart`, `bundleTestOfChart`, `realDistributionComplexify`, `bundleDistributionConjugation` and `complexBesselToL2`. The submodules, `bundleTestSmul`, `bundleTestRestrictScalars` and `bundleSobolevToDistribution` have sorried fields. `IsKahler` (line 94), `BundleDistribution`, `BundleSobolev` and every `*_apply`, `*_continuous_iff` and `complexBesselToL2_*` theorem mention one of them. Two more defects show up in the elaborated signatures (`#check @…` of all 34 declarations, scratch file):
- `nijenhuisTensor` and `IsKahler` elaborate without `[CompleteSpace E] [FiniteDimensional ℝ E] [T2Space M]`.
- `BundleSobolev` is quantified over an arbitrary `localize : Fin q → BundleDistribution →L[ℂ] TemperedDistribution …`, with nothing tying it to an atlas.

Witness: with `localize = 0` the carrier at line 371 is `{v | ∀ i, (v i).toDistr = 0} = {0}`, because `toDistr` is injective. So `BundleSobolev F V n q G 0 s = 0` for every bundle, which is not the Sobolev space of the bundle.

Repair: delete every sorried `def`, `abbrev` and `instance` and every declaration that mentions one; the README keeps them as K5a targets. If `IsKahler` is kept, use the pinned tensor and carry the binder: `form.IsClosed ∧ form.Compatible J ∧ J.nijenhuis = 0` with `[FiniteDimensional ℝ E]` in its own signature. Tested: `J.nijenhuis x (X x) (Y x) = nijenhuisOnFields J X Y x` is closed by `J.nijenhuis_apply hX hY` at the pin.

## R02 (P1) — K7.2 consumes SurfaceTopology and PlanarTopology, which may not be suppliers

Location: `README.md` lines 1487–1506: "native topological surface required by [PlanarTopology's surface convention](https://github.com/mccorvie/…)… Consume [SurfaceTopology Layers 2–3]…'s presentation/realization comparisons, [Layer 6]'s polygon normal forms and [Layer 8]'s compact-surface classification". The same citations recur at lines 1673–1675 (gate rule `dropped`, 14 hits).

Claim: the project's never-a-supplier list includes both roadmaps. Neither is on main, so the topological dictionary of K7.2 has no owner: the half-space-charted surface adapter, the classification homeomorphism, the standard CW model and the polygon cup matrix.

Witness: no `TauCetiRoadmap/SurfaceTopology` or `PlanarTopology` on main. GeometricTopology on main (Layers 1–11) has no surface classification. At the pin, `TauCeti/KnotTheory/Cobordism.lean` line 58 says that the classification of compact surfaces "is not proved here".

Repair: drop the classification route. K7.2 already proves `b₁=2g` by Hodge comparison (line 1485). Obtain `H²(Σ;ℤ)≃ℤ`, its generator, and unimodularity of the integral cup pairing from AlgebraicTopology Stage 6.4's Poincaré duality on the closed oriented surface. State "some ℤ-basis has the standard symplectic Gram matrix" via the algebraic normal form of unimodular alternating forms over ℤ, not via polygon generators. Delete lines 1487–1506 and 1673–1675. If the polygon model is wanted, it becomes a target owned here, with its own locator.

## R03 (P1) — Two-way supply with RealAnalyticGeometry

Location: `README.md` lines 424–431: "R1 local finiteness and compactness of V give finitely many such pieces … RealAnalyticGeometry R5 supplies the global compatible triangulation". Line 1337: "Consume [RealAnalyticGeometry R0–R5]". Lines 1688–1692: "those results then supply K3's finite regular-piece partition".

Claim: each roadmap supplies the other. RealAnalyticGeometry on main consumes K2, K3 and K4 of this roadmap, while K3 and K6.1 consume its R1 and R5. Neither can come first in the merge order. The item-level order is acyclic, but the roadmap-level supply is not. The mechanical check does not report the loop: RealAnalyticGeometry writes "CK K3", and neither roadmap is in the merge order.

Witness: `TauCetiRoadmap/RealAnalyticGeometry/README.md` on main, line 173: "The proof uses CK K3's convergent Weierstrass preparation". Line 736: "holomorphic structure sheaf R_W supplied by CK K4". Line 1019: "the provider consumed by ComplexKahlerGeometry K6".

Repair: one direction only. RealAnalyticGeometry consumes K2–K4, so this roadmap must not consume it. Prove finiteness of the regular-piece partition in K3 from local parametrization and compactness, without R1. Move the analytic-cycle triangulation and integral fundamental class of K6.1 (line 1331 to the end of K6.1) to "ComplexKahlerGeometry, Part II", placed after RealAnalyticGeometry. Its introduction should say that this roadmap stops at the real de Rham functional `[α]↦∫_(V_reg)α`. Rewrite lines 1688–1692 to say only that RealAnalyticGeometry consumes K2–K4.

## R04 (P1) — Two-way supply with PseudodifferentialOperators

Location: `README.md` lines 45–47: "[PseudodifferentialOperators P1.0] supplies differential-operator carriers, jets, symbols and formal density adjoints after K5a's initial density-line construction and before its analytic scale". Also lines 575–577 and 1650–1652 ("PDO P1.0 consumes that density bundle; K5a's distributional operator action … then consume P1.0").

Claim: PseudodifferentialOperators (merge order position 14) lists this roadmap as a supplier, and K5a consumes its P1.0. The supply runs both ways between the two roadmaps.

Witness: `TauCetiRoadmap/PseudodifferentialOperators/README.md` on main, line 91: "**From TauCetiRoadmap.ComplexKahlerGeometry.** K5a supplies bundle …". Line 529: "*Needs:* P1.0 differential operators; ComplexKahlerGeometry K5a's smooth-section Fréchet".

Repair: K5a is real-manifold analysis: density line, `BundleTest`, distributions, the Sobolev scale, Laplace-type regularity and de Rham Hodge theory. None of it uses a complex structure. Move K5a into PseudodifferentialOperators, or into a new roadmap placed before it, and have K5b consume it from there. Then neither README cites the other in both directions. The two READMEs must state the same owner.

## R05 (P2) — No headline theorem is stated in `Suggested.lean`, and the docstring names none as unstatable

Location: `Suggested.lean` lines 11–22 ("These are suggested forms, not an exhaustive checklist…") and the whole file.

Claim: the README's end theorems include the following:
- Newlander–Nirenberg (line 180)
- whole-polydisc Dolbeault–Grothendieck (line 197)
- Weierstrass preparation (lines 325–327) and Hartogs extension (lines 437–440)
- Serre duality and finite Hodge numbers (lines 1232–1236)
- Hodge decomposition, Hard Lefschetz and Hodge–Riemann (lines 1276–1286)
- the ℂPⁿ, torus, Hopf and Iwasawa computations

None is stated. The one non-API theorem in the file, `realified_isManifold_analytic`, is a pinned Tau Ceti theorem (R14).

Witness: the block below elaborates at the pins, with `sorry` warnings only, in a scratch file importing `Mathlib` and `TauCeti.Geometry.Manifold.Complex.AlmostComplexStructure`, `…DifferentialForm.AlmostComplexType`, `…DifferentialForm.Dolbeault.Basic`, `TauCeti.Geometry.Symplectic.Manifold.JHolomorphic` and `…Nijenhuis`:

```lean
theorem newlander_nirenberg {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    [FiniteDimensional ℂ E] {M : Type*} [TopologicalSpace M] [ChartedSpace E M]
    [IsManifold 𝓘(ℝ, E) ∞ M] (J : SmoothAlmostComplexStructure 𝓘(ℝ, E) M)
    (hJ : J.nijenhuis = 0) (x : M) :
    ∃ e ∈ IsManifold.maximalAtlas 𝓘(ℝ, E) ∞ M, x ∈ e.source ∧
      IsPseudoholomorphicOn J (ofComplexManifold E E) e e.source := by sorry

noncomputable def polydisc {n : ℕ} (r : Fin n → ℝ) : TopologicalSpace.Opens (Fin n → ℂ) where
  carrier := Set.univ.pi fun j ↦ Metric.ball 0 (r j)
  is_open' := isOpen_set_pi Set.finite_univ fun _ _ ↦ Metric.isOpen_ball

theorem dolbeault_grothendieck_polydisc {n : ℕ} (r : Fin n → ℝ) (p q : ℕ)
    (φ : SmoothForm 𝓘(ℝ, Fin n → ℂ) (polydisc r) ℂ (p + q + 1))
    (hφ : φ.IsOfType (ofComplexManifold (Fin n → ℂ) (polydisc r)) p (q + 1))
    (hclosed : (ofComplexManifold (Fin n → ℂ) (polydisc r)).delBar φ = 0) :
    ∃ ψ : SmoothForm 𝓘(ℝ, Fin n → ℂ) (polydisc r) ℂ (p + q),
      ψ.IsOfType (ofComplexManifold (Fin n → ℂ) (polydisc r)) p q ∧
        (ofComplexManifold (Fin n → ℂ) (polydisc r)).delBar ψ = φ := by sorry

theorem weierstrass_preparation {n d : ℕ} {f : (Fin n → ℂ) × ℂ → ℂ} (hf : AnalyticAt ℂ f 0)
    (hlow : ∀ i < d, iteratedDeriv i (fun w ↦ f (0, w)) 0 = 0)
    (hd : iteratedDeriv d (fun w ↦ f (0, w)) 0 ≠ 0) :
    ∃ (u : (Fin n → ℂ) × ℂ → ℂ) (a : Fin d → (Fin n → ℂ) → ℂ),
      AnalyticAt ℂ u 0 ∧ u 0 ≠ 0 ∧ (∀ i, AnalyticAt ℂ (a i) 0 ∧ a i 0 = 0) ∧
        ∀ᶠ zw in 𝓝 (0 : (Fin n → ℂ) × ℂ),
          f zw = u zw * (zw.2 ^ d + ∑ i : Fin d, a i zw.1 * zw.2 ^ (i : ℕ)) := by sorry

theorem hartogs_extension {n : ℕ} (hn : 2 ≤ n) {Ω K : Set (Fin n → ℂ)} (hΩ : IsOpen Ω)
    (hK : IsCompact K) (hKΩ : K ⊆ Ω) (hconn : IsConnected (Ω \ K))
    {f : (Fin n → ℂ) → ℂ} (hf : DifferentiableOn ℂ f (Ω \ K)) :
    ∃ F : (Fin n → ℂ) → ℂ, DifferentiableOn ℂ F Ω ∧ Set.EqOn F f (Ω \ K) := by sorry
```

Repair: state these four, each with its locator:
- Webster for Newlander–Nirenberg
- Demailly Chapter I (3.29), p. 28 (`demailly-agbook` line 1288), with the whole-polydisc form from K2
- Demailly Chapter II (2.1), p. 80 (line 3794)
- Demailly Chapter I (3.28) (line 1266)

Also state the headlines that become statable once Dolbeault and complex de Rham cohomology are defined as quotients of submodules of `SmoothForm` (finiteness, trivial-coefficient Serre duality, Hodge symmetry, odd Betti parity), or name them as unstatable. The docstring must take the "<title>: target signatures" form and list every headline left out, with the carrier it lacks; bundle-coefficient Serre duality, for example, lacks a holomorphic-bundle carrier at the pin.

## R06 (P2) — The pinned Tau Ceti already owns objects that K1, K2, K3, K5a and K7.1 plan to build

Location and witness, each README passage against the pinned declaration that already provides it (Tau Ceti 2fd255d, files under `TauCeti/`, re-opened for this review):
- **K1, lines 134–147** ("equips the generic DG carrier `SmoothForm I M F k` with its natural `Module ℂ` action…"): `Geometry/Manifold/DifferentialForm/MapCoeff.lean` has `SmoothForm.instModule` (273), `mextDerivₗ_smul` (305), `mpullback_smul` (312) and `mapCoeff_conj_smul` (322).
- **K1, lines 113–115 and 149–158** (orientation preservation by biholomorphisms; the joint holomorphic implicit map with local uniqueness): `Geometry/Manifold/Complex/Orientation.lean:359` (`IsLocalDiffeomorphAt.isOrientationPreservingAt_complexManifoldOrientation`) and `Geometry/Manifold/Complex/ImplicitFunction.lean:52` (`exists_jointImplicitFunction_of_eventually_mdifferentiableAt`).
- **K1, lines 164–179, and K2, lines 195–197** (eigenbundles, types, the four bidegrees of d, Nijenhuis tensor, `∂̄²f=−¼∂f(N)`, involutivity, ∂ and ∂̄):
  - `Symplectic/Manifold/Nijenhuis.lean` has `nijenhuis` (158), `nijenhuis_apply` (170) and `nijenhuis_antisymm` (207).
  - `Symplectic/Manifold/AlmostComplex/Eigenbundle.lean:96` has `isInvolutiveComplexDistribution_eigenspace_I_iff`.
  - `DifferentialForm/AlmostComplexType.lean` has `SmoothForm.IsOfType` (201) and `typeProjection` (282).
  - `DifferentialForm/Dolbeault/Basic.lean` has `delBar` (95), `delBar_apply_apply` (366), `delBar_apply_eq_zero_iff` (378) and `delBar_delBar_apply` (405).
- **K3.0, lines 298–315** (Osgood; the realified analytic atlas): `Analysis/Complex/CauchyIntegralPolydisc.lean:311,318` and `Geometry/Manifold/Complex/Analytic.lean:115` (`IsManifold.restrictScalars_of_ne_zero`).
- **K3.HolomorphicStalk and K3.MeromorphicGermField, lines 317–374:** `Geometry/Manifold/Complex/StructureSheaf/` has `holomorphicStructureSheaf` (Basic.lean:68), `isUnit_stalk_iff` (LocalRing.lean:46), `isFractionRing_meromorphicGerms` (MeromorphicGerm.lean:141), `regularPart` (166) and principal parts (181). SmoothComparison.lean compares the sheaf with Mathlib's `smoothSheafCommRing`.
- **K5a, lines 596–606 and 1083** (pointwise and smooth real Hodge star, `*²`, the sign of d*): Mathlib `LinearAlgebra/ExteriorPower/HodgeStar.lean:48`; Tau Ceti `Geometry/Manifold/Riemannian/HodgeStar.lean` has `hodgeStar` (296), `hodgeStar_hodgeStar` (310) and `inner_smul_riemannianVolumeForm_eq_wedge_hodgeStar` (317), and `Riemannian/Codifferential.lean` has `codifferential` (88) and the formal-adjoint theorem (252).
- **K7.1, lines 1415–1431** (affine charts, holomorphic transitions, `T2Space`, `CompactSpace`, `SecondCountableTopology`, connectedness): `Topology/Algebra/Projectivization.lean` has instances at lines 90, 149, 188, 215 and 251 and charts at 311; `Geometry/Manifold/Instances/Projectivization.lean` has `instChartedSpace` (54) and `instIsManifold` (82).

Claim: two owners for one object. The README sends contributors to rebuild these. `Suggested.lean` declares duplicates: `nijenhuisOnFields`/`nijenhuisTensor` duplicate `nijenhuis`/`nijenhuis_apply`, and `dbarFunction` is `delBar_apply_apply` at degree 0. The conventions agree, so nothing has to change sign (adversarial rows 9–11).

Repair: list these declarations, by name and file, under a `### From Tau Ceti` supplier contract. Cut the construction sentences down to what the pin lacks. On the evidence above, that is:
- the complex-bilinear extension of N and its evaluation on `(0,1)` fields
- conjugation and holomorphic-pullback naturality of ∂̄
- the orientation-line twist and the complex-linear star on complexified forms
- the Riemann-sphere biholomorphism

In K3, consume `holomorphicStructureSheaf` instead of building stalks on `smoothSheafCommRing`. In `Suggested.lean`, delete `dbarFunction`, `dbarFunction_apply_J`, `dbarFunction_eq_zero_iff`, `nijenhuisOnFields`, `nijenhuisTensor`, `nijenhuisTensor_onFields` and `nijenhuisTensor_skew`.

## R07 (P2) — K7.2 builds the CW structure of ℂPⁿ, which AlgebraicTopology Stage 4.6 owns in this same pull request

Location: `README.md` lines 1458–1463: "construct on this same carrier Mathlib's `CWComplex` structure with one cell in each even dimension 0,2,…,2n … specifying its characteristic maps and skeleta. The CW construction uses only K7.1 and AlgebraicTopology Stage 4." Also lines 1668–1669.

Claim: two owners for the same object.

Witness: `TauCetiRoadmap/AlgebraicTopology/README.md` at this head, lines 1028–1040. Stage 4.6 consumes the native `TauCeti.ComplexProjectiveSpace.cwComplex`, owns its transport to `Projectivization ℂ (Fin (n+1) → ℂ)`, and adds "ComplexKahlerGeometry K7 consumes that topology and this cell structure". Line 2172 repeats this.

Repair: replace the construction sentence by "Consume AlgebraicTopology Stage 4.6's CW structure on `Projectivization ℂ (Fin (n+1) → ℂ)`, transported from `TauCeti.ComplexProjectiveSpace.cwComplex`." Keep only the cellular/cup calculation, the hyperplane normalization `⟨u,[ℂP¹]⟩=+1` and the de Rham/Chern–Weil comparison, and update lines 1668–1669.

## R08 (P2) — "Order and references" re-plans GlobalHolomorphicFunctions

Location: `README.md` lines 1620–1637: "The local Laurent construction within GlobalHolomorphicFunctions GH2 is a native-only preparatory phase before GH0 … Separate these phases explicitly. On a punctured disk of any radius r … construct Laurent coefficients by circle integrals and prove radius independence…"

Claim: this paragraph tells another roadmap how to order and prove its own targets, and fixes its "global one-variable provider order". That is planning GlobalHolomorphicFunctions again, not importing it by section.

Witness: at the head of GlobalHolomorphicFunctions' open pull request, the local Laurent decomposition is Layer 4.1 (README line 1286 ff., after Layer 2 "GH0"). Its own Layer 2.5 (line 1009) and Layer 7.4 (line 1989) already name CKG K2 and K5a as consumers.

Repair: delete lines 1620–1637. Cite by section instead:
- GlobalHolomorphicFunctions Layer 0.3 (compact-support Cauchy–Green)
- Layer 2.5 (`exists_finite_rank_runge_operator`)
- Layer 4.1 (local Laurent decomposition)
- Layer 7.2 (two-form exactness)

Any ordering requirement goes to that roadmap's own review.

## R09 (P3) — AlgebraicTopology names that this pull request drops, and a stale 8.12 clause

Location: `README.md` line 1352 ("AT4.7's `simplicialRealizationCW`"), line 1371 ("AT Stage4's `cwSubcomplexNeighborhoods`") and line 1475 ("AT 8.12 consumes that later comparison").

Claim: this pull request's AlgebraicTopology revision removes both backticked names. Main's AlgebraicTopology README has them at lines 755 and 817, and its `Suggested.lean` declares `simplicialRealizationCW` at line 1265; neither name occurs at this head. At this head, AT 8.12 is the native circle comparison and consumes no CharacteristicClasses comparison.

Witness: `TauCetiRoadmap/AlgebraicTopology/README.md` at this head, line 958 ("Own the subcomplex neighbourhoods"), line 1064 ("Own the realization CW structure of every native simplicial set K") and line 2788 ("12. Native circle comparison of the degree-one model").

Repair: cite "AlgebraicTopology Stage 4.7's realization CW structure" and "Stage 4.5's subcomplex neighbourhoods", and delete the 8.12 clause at line 1475.

## R10 (P3) — K1 asserts a supply that LieGroupoidsPoisson denies

Location: `README.md` lines 190–191: "LieGroupoidsPoisson consumes the eigensubbundle/involutivity dictionary and builds their complex Lie algebroid structures."

Claim: LieGroupoidsPoisson is a supplier of K8 (§G1.3a). The sentence would add the reverse edge.

Witness: `TauCetiRoadmap/LieGroupoidsPoisson/README.md` on main, lines 85–86: "ComplexKahlerGeometry … is a consumer of this roadmap (its K8 consumes §G1.3a) and is therefore never a supplier here."

Repair: delete the sentence. If the `±i` specialisation is wanted, write "K1 may consume LieGroupoidsPoisson §G1.6's subalgebroid/involutivity equivalence"; the equivalence is already pinned (R06).

## R11 (P3) — Pull-request numbers and commit-pinned links as supplier citations

Location: 21 occurrences of "#279" and 3 of "#280" (for example line 98, "Consume #279 Milestones 1 and 2"). Also 29 `github.com/TauCetiProject/TauCetiRoadmap/blob/<sha>/…` lines (gate `blob`, lines 26–1683) and 8 fork links to `github.com/mccorvie/…` and `github.com/Paul-Lez/…` (lines 1488–1496, 1591, 1674–1675).

Claim: cross-roadmap citations name the roadmap and section, never a pull request or a commit.

Witness: `TauCetiRoadmap/ComplexManifolds/README.md` on main, line 197 ("## Milestone 2: the canonical real orientation"). ComplexTori is on main with "Milestone 1".

Repair: replace "#279" by "ComplexManifolds" and "#280" by "ComplexTori". Replace each blob or fork link by the roadmap name and section, using a relative link where the roadmap is on main.

## R12 (P3) — Citation labels that do not resolve in the suppliers' numbering

Location and witness:
- **VariationalMethods "V2–V5.2", "V5.1", "V2.2–V2.4", "V3–V4", "V3.1", "V5.3"** (lines 572, 1049, 1059, 1063, 1065, 1153, 1653–1658): VariationalMethods, at the head of its open pull request, numbers its sections 2.2–5.3 and has no `V<n>.<n>` label (0 occurrences). The resolver flagged V5.1 and V2.2, and both are confirmed. `CompactFormPair.operator` (line 1050) does not exist there: its README lines 1062–1063 say "there is no separate operator declaration; UO-D06's `closedFormOperator` is the operator".
- **"GlobalHolomorphicFunctions GH5.1" for two-form exactness** (lines 35, 981, 1637): that is Layer 7.2. GH5.1 is Layer 7.4, which itself says "Layer 7.2 gives exactness". "GH0's compact-support operator" (line 198) is Layer 0.3.
- **"PDE Lane A.3", "Lane B.9"** (lines 571, 813, 825, 1652): PDE on main has §1.3 "(A3)" and §2.2 "(B9)" and no "Lane" headings.
- **"LieGroupoidsPoisson G1.3"** (lines 1551, 1598, 1683): the Chevalley–Eilenberg target is §G1.3a (LieGroupoidsPoisson README line 18).

Repair: cite each by the section label shown above. In line 1050, replace `CompactFormPair.operator` with "UO-D06's `closedFormOperator` through VariationalMethods §5.1's graph characterization and `CompactFormPair.operatorDomainV`".

## R13 (P3) — Import header

Location: `Suggested.lean` lines 1–9 (gate rules `imports`, `mathlib-subimports` ×5, `no-import-mathlib`).

Claim: there is no `import Mathlib`. There are five `Mathlib.<submodule>` lines, and `import TauCetiRoadmap.DifferentialGeometry.Suggested` imports another roadmap's module.

Witness: line 8. That import is used only by `DensityFiber` (lines 120–121), an abbreviation of DifferentialGeometry's `Density`.

Repair: write `import Mathlib` followed only by the `TauCeti.*` modules used. Delete `DensityFiber`; the density fibre is DifferentialGeometry 5.5's object and is cited in the README.

## R14 (P3) — Padding in `Suggested.lean`

Location and probe result for each declaration (one-tactic probes on a scratch copy, elaborated at the pins):
- **`realified_isManifold_analytic`** (35): closed by the single term `IsManifold.restrictScalars_of_ne_zero ω (by simp) h`.
- **`memSobolev_iff_bundled`** (106): already proved from the library lemmas `MemSobolev.toBesselPotentialSpace` and `memSobolev_toDistr`.
- **`dbarFunction_apply_J` and `dbarFunction_eq_zero_iff`** (55, 61): the first closes by `J²=−1` and `ring`. These are the pinned `delBar_apply_apply` and `delBar_apply_eq_zero_iff`.
- **`nijenhuisTensor_skew`** (88): this is the pinned `nijenhuis_antisymm`.
- **`complexBesselDistributionMultiplier_real`** (484): closes by unfolding, `Real.rpow_def_of_pos`, `push_cast` and `ring_nf`.
- **`bundleTest_smul_apply`, `bundleTestRestrictScalars_apply` and `bundleSobolevLocalizations_apply`** (275, 360, 393): `rfl`.
- **`bundleSobolev_norm_sq`, `bundleSobolevComplete` and `complexBesselToL2_norm`** (383, 413, 503): one library term each.

Claim: each declaration restates a definition or a library lemma, or follows in one step. None is a headline.

Repair: delete them from `Suggested.lean`. The README keeps the statements as targets or Checks.

## R15 (P3) — `bundleSobolevToDistribution` chooses its datum

Location: `Suggested.lean` line 400: `toFun u := Classical.choose u.2` (gate rule `statement-hygiene`, P3).

Claim: the map is defined by an unspecified choice, and the argument `hinj` that would make the choice unique is unused in its body.

Repair: the deletion in R01 removes it. If it is kept as a README target, state the map through injectivity of the localization, i.e. as the inverse on its range.

## R16 (P3) — README shape, Checks and process wording

Location: line 1 reads `# Complex manifolds, Dolbeault theory, and Kähler geometry`, with no `**Summary.**`. The `##` headings are only "Conventions and suppliers", K1–K8 and "Order and references". The README has 0 `**Checks.**` lists, 0 `*Needs:*` lines, and no `### Examples` or `### Dependencies` sections. Line 67 has "during its migration". Lines 1249 and Suggested.lean line 21 use "prototype(s)". Lines 120 and 229 put LaTeX macros in code spans (`φ_{\bar z}d\bar z`, `K_{j+1}\setminus K_{j-1}^+`).

Claim: the README does not follow the house form. No definition has three discriminating Checks. Scope, supplier contracts and order are mixed into one paragraph (lines 10–55). Backticked names of this roadmap's own (`DensityBundle M` at 626, `RealBundleSobolev V 0` at 785) are not declared in `Suggested.lean`.

Repair: restructure as `# Roadmap: …`, Summary, Scope and ownership, Conventions, Exact supplier contracts (From Mathlib / From Tau Ceti (R06) / From each roadmap), How to read the build, and `## Layer k` with `### Examples` and `### Dependencies`. Add `*Needs:*` lines and at least three Checks per definition. Examples, taken from the adversarial table: `dz♯=2∂_z` at `H=I`, which the dual-frame normalization gets wrong; Hopf weight `2^(1−m−n)=1/2` at `m=n=1`; `⟨δ^(n)/n!,φ⟩=2^n`. Write `φ_z̄ dz̄` in Unicode, drop the process words, and unbacktick or declare the names.

## R17 (P3) — Missing locators, including most of the seeded sample

Location: the sampled targets Parameter Cauchy–Green (214–225), K3.HolomorphicStalk (317–330), K3.MeromorphicGermField (332–374), K4.ComponentwiseFiniteRankAssembly (517–535), K5a (570 ff.), K5a.DistributionLocalStructure (658–716), K5a.SmoothSectionMontel (726), K5a.ComponentwiseCompact (1086–1166), K5b/K5b.0/K5b.1 (1168–1241), K7.1 (1407–1442) and K7.2 (1444–1517) carry no theorem, section or page locator. The reference list (1694–1703) gives Wells and Griffiths–Harris without chapter and theorem.

Claim: every theorem needs a locator at the claim. K8.NilpotentCentralReduction cites Sakane but not the Malcev input it owns. The Iwasawa numbers (line 1545) are not cited to Angella.

Witness: `sakane-parallelisable` lines 112–113 rest the lattice step on Raghunathan, p. 31 Corollary 1 and p. 23 Theorem 1.13. `angella-iwasawa` lines 917–920 (Appendix A) give `b₁=4`, `h^(1,0)=3`, `h^(0,1)=2`. Demailly Chapter II (2.1), p. 80 (`demailly-agbook` line 3794) is Weierstrass preparation; (2.7) (line 3872) is the Noetherian property; (2.10) (line 3931) is factoriality; (4.19) (line 4613) is local parametrization; (4.22) (line 4742) is the Nullstellensatz.

Repair: add those locators at the claims. Cite Raghunathan (Theorem 1.13, p. 23; Corollary 1, p. 31) in K8.NilpotentCentralReduction. Give Wells and Griffiths–Harris chapter, section and theorem at each use. Give each remaining sampled target a locator (for example Hörmander, ALPDO I, Theorems 2.3.4–2.3.5 for point-supported distributions).

## R18 (P3) — Other open pull requests change this folder, with no consistent order

Location: this pull request's folder diff (`README.md` lines 609–610, 1538, 1613) and its merge-order paragraph: "#1101 → #1807 → this pull request … #1808 is independent of this pull request".

Claim:
- #1807, stated to merge first, rewrites this folder: a house-form README of 2304 lines with a 320-line `Suggested.lean`. Its README line 75 already cites AlgebraicTopology's "generic filtered-complex spectral sequence (Stage 5.0)". Its commits (for example 21108697) are not ancestors of c9c60d0. After #1807 merges, this pull request's three-line diff is against text that no longer exists, and it restates a change #1807 already makes.
- #1808, called independent, also rewrites the folder (2535 lines).
- #1234 conflicts with this head in `README.md`, and #1398 conflicts in `Suggested.lean` (overlap report). No order is stated for either.

Repair: drop this folder's edits from this pull request, since #1807 carries them, or rebase the folder on #1807's head. State the order relative to #1808, #1234 and #1398.

## R19 (P3) — Edits outside the folders named as this pull request's own

Location: `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md` (gate `outside-folder`, 2 in the worker's run).

Claim: neither folder is among those the review brief names for this pull request, although the description explains both edits.

Repair: name both folders as this pull request's own, so they are reviewed, or move the two edits to their own pull request.

## Verified sound

**Gate and build.** The gate re-run reproduces every text count listed above. `lake env lean` of `Suggested.lean`: exit 0, 37 `sorry` warnings. Signature check: `#check @` of 34 declarations in one scratch file, compared with the README. The only changes found are the dropped binders of `nijenhuisTensor` and `IsKahler` and the free `localize` of `BundleSobolev` (R01). Depcheck output: `depcheck: 237 roadmaps, 2416 edges, 0 problem(s)`. The checker does not see the two-way supplies of R03 and R04 (reverse edges written as "CK K3" or in the other roadmap's supplier section); I report this as a false negative, not as a disagreement with the order.

**Pull-request change.** The new citation "AlgebraicTopology Stage 5.0" resolves at this head (AT README line 1143, "Spectral sequence of a filtered complex"). Its consumer clause names "ComplexKahlerGeometry K8's column-filtration adapter" (line 1178). The rewording at lines 609–610 matches RiemannianGeometry (main, line 1192) and SpinGeometry (main, lines 43, 75), which cite K5/K5a.

**Seeded sample.**

| Target | Locator in README | Result |
|---|---|---|
| Parameter Cauchy–Green | none (cites GH0) | supplier exists at GH Layer 0.3 (open PR head); maths rows 37–38; R17 |
| K3.HolomorphicStalk | none at the target | Demailly II (2.1) p. 80 checked; R06, R17 |
| K3.MeromorphicGermField | none | pinned `MeromorphicGerm.lean` covers most of it; R06, R17 |
| K4.ComponentwiseFiniteRankAssembly | none | row 31; R17 |
| K5a heading | none | suppliers resolved (SBC B2–B4 main; HopfRinow Layer 1 Levi-Civita, Completed; UO-D06 = UnboundedOperators §4.7 at its open head; VM 2–5 at its open head); R12, R17 |
| K5a.DistributionLocalStructure | none | rows 21–23; R17 |
| K5a.SmoothSectionMontel | none | Mathlib `MontelSpace` (Montel.lean:46), `ContinuousLinearEquiv.toCompactConvergenceCLM` (104) exist; R17 |
| K5a.ComponentwiseCompact | none | row 32; VM §3.1 exists; R17 |
| K5b, K5b.0, K5b.1 | Wells (no chapter) | rows 14–15, 18; R17 |
| K7.1 | none | Mathlib `OnePoint.equivProjectivization` (ProjectiveLine.lean:84–85) sends `t ↦ [t:1]`, `∞ ↦ [1:0]` as the README pins; R06, R17 |
| K7.2 | none | rows 18–20, 40; R02, R07, R09, R17 |
| K8.NilpotentCentralReduction | Sakane pp. 188–189 | confirmed: Theorem 1 stated p. 188 and again p. 189 (`sakane-parallelisable` lines 46, 102); central reduction p. 189 (lines 106–115); R17 for Malcev |

The README itself has two further locators, both verified:
- **Demailly Chapter II §4.4, Theorem 4.29** (Cartan's coherence theorem for the ideal sheaf of any analytic set, `demailly-agbook` line 4842, p. 99) and **Theorem 4.31** (`A_sing` analytic, line 4929, p. 100). Both support lines 396–419 as written; the proof route (reduce to irreducible germs, `I_A=⋂I_(A_k)`) matches lines 4845–4849.
- **Łojasiewicz §3, Theorem 2, p. 464** (`lojasiewicz-triangulation` lines 504–515): countable real-analytic manifold, locally finite semi-analytic family, and properties (a)–(c). This supports lines 1338–1348; property (c) gives "inside a single stratum".

**Adversarial table** (values computed by hand unless marked "probe", which means elaborated in Lean at the pins).

| # | Statement | Instance | Left / right values | Result | Change |
|---|---|---|---|---|---|
| 1 | `h_T=g+iω` conj-linear first slot (l. 68) | real `u,v`, `ω(a,b)=g(Ja,b)` | `h_T(Ju,v)=ω(u,v)−ig(u,v)` / `−i h_T(u,v)=ω−ig` | equal | none |
| 2 | `h_T(u¹⁰,v¹⁰)=2g_ℂ(bar u¹⁰,v¹⁰)` (l. 71) | expand | `g_ℂ((u+iJu)/2,(v−iJv)/2)=(2g+2iω)/4` / `h_T/2` | equal | none |
| 3 | `ω=(i/2)Σdz∧dz̄` standard (l. 72–73) | n=1 | `(i/2)(−2i)dx∧dy` / `dx∧dy` | equal | none |
| 4 | `h_src(u,v)=2h_T(v,u)` (l. 78) | `u=∂x, v=∂y` | `2·1·conj(i)=−2i` / `2(0+iω(∂y,∂x))=−2i` | equal | none |
| 5 | Chern `A=h⁻¹∂h` (l. 86) | metric compatibility | `A*H+HA=∂̄H+∂H` / `dH` | equal | none |
| 6 | `∫_(ℂP¹)ω_FS=1` (l. 88–89) | n=1 | `(1/π)∫2πr dr/(1+r²)²=1` / `1` | equal | none |
| 7 | O(1) curvature `−2πiω_FS` (l. 89) | `h(e*,e*)=1/(1+|z|²)` | `Θ=∂∂̄log(1+|z|²)` / `(2π/i)ω_FS` | equal | none |
| 8 | `dd^c=2i∂∂̄` (l. 59) | expand | `(∂+∂̄)i(∂̄−∂)=i(∂∂̄−∂̄∂)` / `2i∂∂̄` | equal | none |
| 9 | `∂̄²f(X,Y)=−¼∂f(N(X,Y))` on (0,1) fields (l. 171) | `JX=−iX`, `Z=[X,Y]` | `N=−2Z+2iJZ=−4Z¹⁰`, `∂̄²f=∂f(Z¹⁰)` / `−¼∂f(N)` | equal; agrees with pinned `delBar_delBar_apply` on real vectors via `N(X⁰¹,Y⁰¹)=N¹⁰` (`¼(2N−2iJN)`) | none |
| 10 | `dbarFunction_apply_J` | `J²=−1` | `(df(Jv)−i df v)/2` / `−i(df v+i df(Jv))/2` | equal (probe) | R14 |
| 11 | `*²=(−1)^(k(m−k))`, `d*` sign (l. 601, 1083) | k=1, m=2; pinned `codifferential` sign `(−1)^(m(j+1)+1)` at j=k+1 | `−1` = rotation²; same sign | equal | R06 |
| 12 | Hodge–Riemann sign (l. 1284) | n=1, α=dz; α=dz̄; k=0 | `i·∫dz∧dz̄=2·area>0`; `−i·∫dz̄∧dz=2·area>0`; `∫ω^n/n!>0` | positive | none |
| 13 | `[Λ,L]=n−k` (l. 1254) | n=1, k=0, α=1 | `ΛLα−LΛα=1−0` / `1` | equal | none |
| 14 | `|dz_j|²=2(H⁻¹)_jj`, `dz♯=2∂_z` (l. 1181–1183) | H=I | `|dx|²+|dy|²=2`; `∂x−i∂y=2∂_z`; anticommutator `dz(2∂_z)=2` | equal | none |
| 15 | `α∧barStar β=⟨β,α⟩vol` (l. 616, 1197) | `⟨u,v⟩=B(ū,v)` | `B(α,β̄)` / `B(β̄,α)` | equal | none |
| 16 | `∂̄*=−*∂*` types (l. 1197) | `(p,q+1)` form | `*`→`(n−q−1,n−p)`, `∂`→`(n−q,n−p)`, `*`→`(p,q)` | type-consistent | none |
| 17 | Hopf `h^(1,1)=0`, `h^(0,1)=1` (l. 1523–1530) | weights | `z^a dz_j↦2^(|a|+1)≥2`; `z₁⁻¹z₂⁻¹dz_j↦1/2`; constants weight 1 | no weight 1 in Ω¹; `H¹(ℤ,𝒪(ℂ²))≅ℂ` | none |
| 18 | Hopf diamond vs Betti (l. 1531–1532) | S¹×S³ | `b₁=h¹⁰+h⁰¹=0+1=1`, `b₂=0`, `b₃=h¹²+h²¹=1` | equal | none |
| 19 | Iwasawa `h¹⁰=3, h⁰¹=2, b₁=4` (l. 1545) | `angella-iwasawa` l. 918–920; `sakane-parallelisable` l. 339 | 4; 3, 2 / 4; 3, 2; `3+2≠4` | equal; no additive decomposition | R17 (locator) |
| 20 | ℂP¹ Serre (l. 1454–1457) | `K=O(−2)` from `dz=−w⁻²dw` | `H¹(O(−1))≅H⁰(O(−1))*=0` / 0 | equal | none |
| 21 | `h⁰(O(k))=C(n+k,n)` (l. 1450–1452) | n=1, k=2 | `{x²,xy,y²}` 3 / `C(3,1)=3` | equal | none |
| 22 | torus `h^(p,q)=C(n,p)C(n,q)` (l. 1482) | n=1 | `h¹⁰=h⁰¹=1`, `b₁=2` / genus 1 | equal | none |
| 23 | `⟨δ^(n)/n!,φ⟩=2^n` (l. 714) | `φ=Σ(−2x)^k` near 0 | `(−1)^n(−2)^n` / `2^n` | equal | none |
| 24 | `H_m=t₊^(m−1)/(m−1)!`, `D^mH_m=δ` (l. 674–681) | m=k+2 | `C^(m−2)=C^k`; `D^(m−1)H_m`=Heaviside | holds | none |
| 25 | `exp(1/‖x‖²)` nonextension (l. 701–707) | `supp φ_ε⊂B(εe₁,cε)`, c<1/4 | `|x|∈[(1−c)ε,(1+c)ε]`; integral `≥C′εⁿe^((1+c)⁻²ε⁻²)` vs `Cε^(−N)` | contradiction for all N | none |
| 26 | Peetre `〈ζ+η〉^s≤2^(|s|/2)〈ζ〉^s〈η〉^|s|` (l. 1005) | n=1, s=2, ζ=η=1; s=−2, ζ=1, η=−1 | `5≤8`; `1≤2` | holds | none |
| 27 | `B_F(f,g)=B₀(f,Rg)`; transpose `A(−x)ᵀ` (l. 800, 811) | Mathlib's unitary Fourier normalization | `∫f̂ĝ=∫g(y)f(−y)dy`; `∫A f·g(−x)=∫f·A(x)ᵀg(−x)` | equal | none |
| 28 | `u_ℂ(φ)=u(φ_R)+iu(φ_I)`, κ-fixed image (l. 756–760; Lean 443–456) | `split(iφ)=(−φ_I,φ_R)` | `u_ℂ(iφ)=i u_ℂ(φ)`; `κu_ℂ=u_ℂ`; fixed `v=(v∘split.symm(·,0))_ℂ` | true as stated | R01 (sorried data) |
| 29 | sesquilinear `h(a+ib,c+id)` (l. 766) | first-slot `i` | `h(ix,y)=−i h(x,y)` both sides | equal | none |
| 30 | `A_sing` analytic with dimension drop (l. 413–418) | plane ∪ line through 0 in ℂ³ | `A_sing={0}`, dim 0 < 2 | holds | none |
| 31 | components open, rank constant (l. 519–521) | M = ℂ ⊔ ℂ², rank 1 ⊔ 0 | locally connected ⇒ components clopen | holds; rank 0 covered | none |
| 32 | finite component subcover (l. 1089–1092) | compact M | locally connected ⇒ open components ⇒ finite | holds | none |
| 33 | K8 central reduction (l. 1570–1576) | complex Heisenberg, Γ=Gaussian | `A=C¹=Z≅ℂ`, fibre `ℂ/ℤ[i]`, base `ℂ²/ℤ[i]²`, dims 1+2=3 | matches Sakane p. 189 | R17 (Malcev locator) |
| 34 | Newlander–Nirenberg (headline) | converse = pinned `nijenhuis_ofComplexManifold` | statement elaborates (probe) | statable | R05 |
| 35 | Weierstrass preparation (headline) | `f=w²+zw`; d=0 | `u=1, a₁=z, a₀=0`; d=0 ⇒ `u=f`, `f(0)≠0` | statement elaborates (probe) | R05 |
| 36 | Hartogs (headline) | n=1: `1/z`; spherical shell | excluded by `2≤n`; excluded by connectedness | statement elaborates (probe) | R05 |
| 37 | Parameter Cauchy–Green (l. 214–225) | `∂̄_z T(χf)=χf`; holomorphy region | `ℂ∖tsupport χ` independent of p, q | holds | R17 |
| 38 | K2 solver tail bound (l. 236–237) | `A_jh=Σw_k h(ζ_k)g_k` | fixed nodes ⇒ preserves q-holomorphy | holds | none |
| 39 | `realified_isManifold_analytic` (Lean 35) | m=∞≠0, n=ω | one term `restrictScalars_of_ne_zero ω (by simp) h` (probe) | padding | R14 |
| 40 | Riemann surface `b₁=2g` (l. 1484–1485) | torus; ℂP¹ | `g=1,b₁=2`; `g=0,b₁=0` | equal | R02 (route) |
| 41 | `BundleSobolev` carrier (Lean 369) | `localize=0` | carrier `{0}` for every bundle | vacuous | R01 |
| 42 | `complexBesselSymbol` at real z (Lean 466, 484) | `z=s`; `z=it` | `(1+|ζ|²)^(s/2)` = Mathlib symbol (probe); `|·|=1` | holds | R14 |

**Library declarations opened at the pins.** Tau Ceti:
- `Nijenhuis.lean` 153–213
- `Dolbeault/Basic.lean` 360–420
- `AlmostComplexType.lean` 201, 282
- `Eigenbundle.lean` 96
- `MapCoeff.lean` 270–322
- `Complex/Analytic.lean` 105–125
- `CauchyIntegralPolydisc.lean` 300–320
- `Complex/ImplicitFunction.lean` 1–52
- `Complex/Orientation.lean` 126–414
- `StructureSheaf/Basic.lean` 68, `MeromorphicGerm.lean` 59–254
- `Riemannian/HodgeStar.lean` 73–340, `Codifferential.lean` 80–100
- `Topology/Algebra/Projectivization.lean` 90–330, `Instances/Projectivization.lean` 54–96
- `Topology/CWComplex/Classical/ComplexProjective.lean` 22–43
- `AlmostComplex/Basic.lean` 71–100, `Symplectic/Manifold/TwoForm.lean` 225–237 (`Compatible` = invariant ∧ tames, matching `g(u,v)=ω(u,Jv)`)

Mathlib: `Distribution/Sobolev.lean` 60–80; `BesselPotentialSpace.lean` 77, 250, 299; `ProjectiveLine.lean` 84; `LocallyConvex/Montel.lean` 46, 104; `ExteriorPower/HodgeStar.lean` 48; `Geometry/Manifold/Complex.lean` 155, 170. A further 44 Mathlib and Tau Ceti names that the README cites were looked up in a declaration index of the pins, and all were found, among them `real_linearMap_map_smul_complex`, `differentiableAt_complex_iff_differentiableAt_real`, `IsWeierstrassFactorization`, `meromorphicOrderAt_eq_int_iff`, `overPullbackSheafEquivOver`, `memSobolev_zero_iff`, `fourier_convolution`, `norm_le_interp_of_mem_verticalClosedStrip'`, `starConvex_one_slitPlane`, `LinearMap.det_restrictScalars`, `Algebra.norm_complex_eq`, `continuousLinearEquivOfBilin`, `TestFunction.continuous_iff_continuous_comp`, `CWComplex` and `SpectralObject`.

**Cross-roadmap citations resolved** (main 1653eec unless stated):
- ComplexManifolds Milestones 1–7 and ComplexTori Milestone 1.
- DifferentialGeometry 0.4, 2.1, 5.4, 5.5, 6.2, 12.4 (`legacySmoothTwoFormEquiv`, `Density` and `RoughDensity` are in its `Suggested.lean`; `Density` has a real body).
- SmoothBundlesConnections B1.0–B6.4, including B6.2 c₁ and B6.3 Chern–Weil.
- PDE §1.3 (A3) and §2.2 (B9); HopfRinow Layer 1 (Completed); RealAlgebraicGeometry Layer 7 (Completed).
- GeometricTopology Layer 11; LieGroupoidsPoisson §G1.3a; CharacteristicClasses C1.5 (this head, lines 62–106).
- AlgebraicTopology 4.5, 4.6, 4.7, 5.0, 6.1, 6.3, 6.4, 7, 8.12 (this head; R09).
- At open heads: GlobalHolomorphicFunctions Layers 0.3, 2.5, 4.1, 7.2, 7.4; VariationalMethods 2.2–5.3; UnboundedOperators §4.7.

**Ownership against open roadmaps** (closest in vocabulary):
- ComplexComparisonPartII lists K2–K5a as suppliers; consistent with K4's statement.
- CalibratedGeometry consumes K1, K2, K4, K5a, K5b.0, K6.0 and K6.1. It owns the Wirtinger inequality and the calibrated-implies-complex direction, while K5b.0 and K6.1 own the volume of complex planes, so there is no double owner.
- RelativisticQuantumFieldTheory consumes K3, and DifferentialGeometry's revision defers compact bundle Laplace analysis to K5a; both are consistent.
- GlobalHolomorphicFunctions: R08.

Observation for the merge order, not a finding here: IndexTheory (position 11), ComplexComparisonPartII (43) and FormalConnectionsOpers (44) list this roadmap as a supplier, while it consumes GlobalHolomorphicFunctions (89) and LieGroupoidsPoisson (149). Those upward edges belong to the consumers' own reviews.

## Not verifiable

- Webster, Math. Z. 201 (1989), pp. 303–316 (`webster-nn`, uncertified, paywalled): the convex-domain homotopy operator and the iteration route of K1. Cited by locator only.
- Griffiths–Harris, Chapter 0 §§1–2 (`griffiths-harris`, uncertified; the DOI landing page refuses access): K3's local rings and parametrization.
- Wells, *Differential Analysis on Complex Manifolds* (`wells-dacm`, uncertified): K5b. The README gives no chapter, so there is nothing to check (R17).
- Raghunathan, Theorem 1.13 p. 23 and Corollary 1 p. 31 (`raghunathan-discrete-subgroups`, uncertified): taken from Sakane's own citation (`sakane-parallelisable` lines 112–113), not read.
- Hörmander, ALPDO I, Theorems 2.3.4–2.3.5 (`hormander-alpdo1`, uncertified): proposed in R17 from the manifest, not read.

## Source issues

- none
