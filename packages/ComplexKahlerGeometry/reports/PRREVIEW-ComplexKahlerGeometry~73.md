# Review of ComplexKahlerGeometry (pull request #1854 at 0ab1982)

**Verdict:** needs changes

This is an incremental re-review of `TauCetiRoadmap/ComplexKahlerGeometry/`: 0 changed lines since 56715a5. `git diff 56715a5 HEAD` touches only eight of this pull request's other folders: AlgebraicCurves, AlgebraicTopology, BanachSpaceTheory, BordismFormalGroups, CharacteristicClasses, ClassifyingSpaces, LocalPurity and ReductiveGroups. Against main (now 32a0bcc) this folder still differs by the same three README lines (609, 1538, 1613).

None of the 19 previous findings is repaired. Each is written again below, with its witness re-checked at this head, at main 32a0bcc and at the open heads.

Two parts of the previous R12 were wrong and are withdrawn here:
- "GH5.1" resolves: it is GlobalHolomorphicFunctions Layer 7.4.
- "LieGroupoidsPoisson G1.3" resolves: §G1.3 is a section.

There is no new finding. None of the changed folders breaks a citation of this roadmap (see Verified sound).

**Gate.** I re-ran it and got the same text counts as the worker: blob=29, sorry-data=20, imports=1, mathlib-subimports=5, no-import-mathlib=1, statement-hygiene=1, dropped=14, FAIL. My run reports outside-folder=36 because the tool does not know the pull request's own folders. With the 17 named folders excluded, `git diff --stat origin/main...HEAD` lists exactly 2 files (R19).

**Dependency check.** Output: `depcheck: 239 roadmaps, 2315 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. R03 and R04 are two-way supplies that this check does not see, because the reverse citation sits in the other roadmap on main.

**Elaboration.** `lake env lean TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` exits 0 with 37 `sorry` warnings and no other diagnostic. Pins are unchanged: Tau Ceti 2fd255d, Mathlib 1b1ccf4.

**The shortest route (unchanged).** #1807, now at head 6d06f1d, carries a rewritten copy of this folder:
- its README begins "# Roadmap: complex manifolds, Dolbeault theory and Kähler geometry";
- it has 35 `**Checks.**` lists, 35 `*Needs:*` lines, 0 "#279", 0 commit-pinned links and 0 SurfaceTopology/PlanarTopology citations;
- it already makes this pull request's K8 edit (its line 2365: "Consume AlgebraicTopology Stage 5.0's generic filtered-complex spectral sequence").

This pull request's merge-order paragraph places #1807 first. Dropping this pull request's three-line edit of the folder (R18) therefore takes the folder out of this pull request. Its remaining findings would then be judged against #1807's copy, in that pull request's review.

## R01 (P1) — Twenty sorried data declarations in `Suggested.lean`

**Location.** `TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` lines 77–79, 139–174, 224–236, 287–314, 348–357, 369–375, 397–402, 428–437 and 489–492 (gate `sorry-data`, 20 hits). Line 77: "def nijenhuisTensor (J : TauCeti.SmoothAlmostComplexStructure I M) : … := by sorry".

**Claim.** The following carry sorried data:
- the `RealBundleTest`/`BundleTest` topology, `ContinuousSMul` and `LocallyConvexSpace` instances;
- `nijenhuisTensor`, `realBundleTestOfChart`, `bundleTestOfChart`, `realDistributionComplexify`, `bundleDistributionConjugation` and `complexBesselToL2`;
- the fields of the two submodules, of `bundleTestSmul`, of `bundleTestRestrictScalars` and of `bundleSobolevToDistribution`.

`IsKahler`, `BundleDistribution`, `BundleSobolev` and every `*_apply`, `*_continuous_iff` and `complexBesselToL2_*` theorem mention one of them.

**Witness.**
- `#check @IsKahler`, re-run at this head, elaborates to binders that end at `[IsManifold I (↑⊤) M]`, then `SmoothTwoForm I M → SmoothAlmostComplexStructure I M → Prop`. There is no `[FiniteDimensional ℝ E]`, `[CompleteSpace E]` or `[T2Space M]`.
- `bundleSobolevSubmodule` (lines 365–372) takes a free `localize`. With `localize = 0` its carrier is `{v | ∀ i, (v i).toDistr = 0}`, which is `{0}`.

**Repair.** Delete every sorried `def`, `abbrev` and `instance`, and every declaration that mentions one; the README keeps them as K5a targets. If `IsKahler` is kept, define it as `form.IsClosed ∧ form.Compatible J ∧ J.nijenhuis = 0`, with `[FiniteDimensional ℝ E]` in its own signature.

## R02 (P1) — K7.2 consumes SurfaceTopology and PlanarTopology, which may not be suppliers

**Location.** `README.md` line 1493: "Consume [SurfaceTopology Layers 2–3](https://github.com/mccorvie/…)'s". Lines 1488, 1492, 1495–1496, 1505–1506 and 1674–1675 have the same problem (gate `dropped`, 14 hits).

**Claim.** Both roadmaps are on the never-a-supplier list. Four objects of K7.2 therefore have no owner: the surface adapter, the classification homeomorphism, the standard CW model and the polygon cup matrix.

**Witness.** Main 32a0bcc has no `TauCetiRoadmap/SurfaceTopology` or `TauCetiRoadmap/PlanarTopology`. At the pin, `TauCeti/KnotTheory/Cobordism.lean` lines 56–58 say that the classification of compact surfaces "is not proved here".

**Repair.**
1. Delete lines 1487–1506 and 1673–1675.
2. Keep the `b₁=2g` Hodge comparison at line 1485.
3. Take `H²(Σ;ℤ)≃ℤ` and unimodularity of the integral cup pairing from AlgebraicTopology Stage 6.4 Poincaré duality.
4. Obtain the standard symplectic ℤ-basis from the normal form of unimodular alternating forms over ℤ.

## R03 (P1) — Two-way supply with RealAnalyticGeometry

**Location.** `README.md`:
- lines 430–431: "RealAnalyticGeometry R5 supplies the global compatible triangulation and its frontier refinement";
- line 1337: "Consume [RealAnalyticGeometry R0–R5]";
- lines 1689–1690: "precede RealAnalyticGeometry R1's local semianalytic/component results; those results then supply K3's finite regular-piece partition".

**Claim.** RealAnalyticGeometry consumes K3 and K4 of this roadmap, and K3 and K6.1 consume its R1 and R5. Neither roadmap can come first.

**Witness.** In `TauCetiRoadmap/RealAnalyticGeometry/README.md` on main 32a0bcc:
- line 173: "The proof uses CK K3's convergent Weierstrass preparation";
- line 736: "supplied by CK K4";
- line 1019: "This is the provider consumed by ComplexKahlerGeometry K6".

**Repair.**
1. In K3, prove finiteness of the regular-piece partition from local parametrization and compactness, without R1.
2. Move the K6.1 analytic-cycle triangulation and the integral fundamental class (line 1331 to the end of K6.1) to "ComplexKahlerGeometry, Part II", placed after RealAnalyticGeometry.
3. Rewrite lines 1688–1692 to say only that RealAnalyticGeometry consumes K2–K4.

## R04 (P1) — Two-way supply with PseudodifferentialOperators

**Location.** `README.md` lines 45–47: "[PseudodifferentialOperators P1.0] … supplies differential-operator carriers, jets, symbols and formal density adjoints after K5a's initial density-line construction". Lines 575–577 and 1650–1652 have the same problem.

**Claim.** PseudodifferentialOperators, at merge-order position 13, lists this roadmap as a supplier, and K5a consumes its P1.0.

**Witness.** In `TauCetiRoadmap/PseudodifferentialOperators/README.md` on main 32a0bcc:
- line 91: "**From TauCetiRoadmap.ComplexKahlerGeometry.** [K5a] supplies bundle";
- line 529: "*Needs:* P1.0 differential operators; ComplexKahlerGeometry K5a's smooth-section Fréchet".

**Repair.** K5a uses no complex structure. Move it into PseudodifferentialOperators, or into a new roadmap placed before it, and have K5b consume it from there. Both READMEs must then name the same owner.

## R05 (P2) — No headline theorem is stated, and the docstring names none as unstatable

**Location.** `Suggested.lean` lines 11–22 ("These are suggested forms, not an exhaustive checklist…") and the whole file.

**Claim.** The README's headlines include:
- Newlander–Nirenberg (line 180);
- polydisc Dolbeault–Grothendieck (197);
- Weierstrass preparation (325–327);
- Hartogs extension (437–440);
- Serre duality and finite Hodge numbers (1232–1236);
- Hodge decomposition, Hard Lefschetz and Hodge–Riemann (1276–1286);
- the ℂPⁿ, torus, Hopf and Iwasawa computations.

None of them is stated in `Suggested.lean`.

**Witness.** I re-ran this round, at the pins, the four statements of the previous report. The scratch file has `import Mathlib` plus six `TauCeti.*` modules: `Geometry.Manifold.Complex.AlmostComplexStructure`, `….Complex.Analytic`, `Geometry.Manifold.DifferentialForm.AlmostComplexType`, `….DifferentialForm.Dolbeault.Basic`, `Geometry.Symplectic.Manifold.JHolomorphic` and `….Manifold.Nijenhuis`. It exits 0 with four `sorry` warnings.

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

**Repair.**
1. State these four, each with its locator:
   - `webster-nn` for Newlander–Nirenberg;
   - `demailly-agbook` Ch. I (3.29), p. 28 (line 1288) for Dolbeault–Grothendieck;
   - `demailly-agbook` Ch. II (2.1), p. 80 (line 3794) for Weierstrass preparation;
   - `demailly-agbook` Ch. I (3.28) (line 1266) for Hartogs.
2. Either state the cohomological headlines on quotients of submodules of `SmoothForm`, or name them in the docstring as not statable, with the missing carrier.
3. Rewrite the docstring as "<title>: target signatures".

## R06 (P2) — The pinned Tau Ceti already owns objects that K1, K2, K3, K5a and K7.1 plan to build

**Location.** `README.md`:
- K1: lines 113–115, 134–158 and 164–179 ("equips the generic DG carrier `SmoothForm I M F k` with its natural `Module ℂ` action");
- K2: lines 195–197;
- K3: lines 298–374;
- K5a: lines 596–606 and 1083;
- K7.1: lines 1415–1431.

`Suggested.lean` declares `dbarFunction*` and `nijenhuis*`.

**Claim.** Each of these objects then has two owners.

**Witness.** In Tau Ceti 2fd255d, re-opened this round:
- `Geometry/Symplectic/Manifold/Nijenhuis.lean:158` has `def nijenhuis (x : M) : TangentSpace I x →L[ℝ] …`;
- `Geometry/Manifold/DifferentialForm/Dolbeault/Basic.lean:95` has `def delBar : SmoothForm I M F k →ₗ[ℂ] SmoothForm I M F (k + 1)`;
- `Geometry/Manifold/Complex/StructureSheaf/Basic.lean:68` has `holomorphicStructureSheaf`.

**Repair.** Add a `### From Tau Ceti` contract naming each of these, with its file:
- the three above, with `nijenhuis_apply` (170), `nijenhuis_antisymm` (207), `delBar_apply_apply` (366), `delBar_apply_eq_zero_iff` (378) and `delBar_delBar_apply` (405);
- `SmoothForm.instModule`, `mextDerivₗ_smul`, `mpullback_smul` and `mapCoeff_conj_smul` (`MapCoeff.lean` 273–322);
- `IsLocalDiffeomorphAt.isOrientationPreservingAt_complexManifoldOrientation` (`Complex/Orientation.lean:359`);
- `exists_jointImplicitFunction_of_eventually_mdifferentiableAt` (`Complex/ImplicitFunction.lean:52`);
- `isInvolutiveComplexDistribution_eigenspace_I_iff` (`AlmostComplex/Eigenbundle.lean:96`);
- `SmoothForm.IsOfType` and `typeProjection` (`AlmostComplexType.lean` 201, 282);
- `IsManifold.restrictScalars_of_ne_zero` (`Complex/Analytic.lean:115`);
- `isUnit_stalk_iff` and `isFractionRing_meromorphicGerms` (`StructureSheaf/`);
- `hodgeStar`, `hodgeStar_hodgeStar` and `codifferential` (`Riemannian/`);
- the projectivization instances and charts (`Topology/Algebra/Projectivization.lean`, `Instances/Projectivization.lean`).

Then cut the construction sentences down to what the pin lacks. Delete from `Suggested.lean`: `dbarFunction`, `dbarFunction_apply_J`, `dbarFunction_eq_zero_iff`, `nijenhuisOnFields`, `nijenhuisTensor`, `nijenhuisTensor_onFields` and `nijenhuisTensor_skew`.

## R07 (P2) — K7.2 builds the CW structure of ℂPⁿ, which the pin and AlgebraicTopology Stage 4.6 already own

**Location.** `README.md` lines 1458–1461: "construct on this same carrier Mathlib's `CWComplex` structure with one cell in each even dimension 0,2,…,2n and none in odd dimensions, specifying its characteristic maps and skeleta". Also lines 1668–1669.

**Claim.** The CW structure has three owners: the pinned Tau Ceti, AlgebraicTopology Stage 4.6 in this same pull request, and K7.2.

**Witness.**
- At the pin, `Topology/CWComplex/Classical/ComplexProjective.lean:419` has `def cwComplex : CWComplex (univ : Set (ComplexProjectiveSpace n))`.
- `TauCetiRoadmap/AlgebraicTopology/README.md` at this head, lines 1054–1071 (Stage 4 item 6), owns the transport of that structure to `Projectivization ℂ (Fin (n+1) → ℂ)`, and says "ComplexKahlerGeometry K7 consumes that topology and this cell structure". Line 2203 says the same.

**Repair.** Replace the construction sentence with "Consume AlgebraicTopology Stage 4.6's CW structure on `Projectivization ℂ (Fin (n+1) → ℂ)`, transported from the pinned `TauCeti.ComplexProjectiveSpace.cwComplex`". Keep only:
- the cellular/cup calculation;
- `⟨u,[ℂP¹]⟩=+1`;
- the de Rham/Chern–Weil comparison.

Update lines 1668–1669 to match.

## R08 (P2) — "Order and references" re-plans GlobalHolomorphicFunctions

**Location.** `README.md`:
- lines 1620–1622: "is a native-only preparatory phase before GH0; GH2's global prescribed-singularity patching follows GH0. Separate these phases explicitly.";
- line 1637: "The global one-variable provider order is GH0 (compact-support formula, area normalization, finite-rank Runge operators and exhaustion) → GH5 … → GH5.1".

**Claim.** The paragraph orders and specifies another roadmap's own targets. It also mislabels them: in that roadmap's numbering the compact-support formula is not GH0.

**Witness.** GlobalHolomorphicFunctions at its open head af99bc58 already orders and owns these targets:
- Layer 0.3 "Compact-support Cauchy–Green" at line 554;
- Layer 2 "(GH0)" at line 866, with Layer 2.5 at 1104, whose line 1159 names "CKG K2" as consumer of `exists_finite_rank_runge_operator`;
- Layer 4 "(GH2)" at line 1436, with Layer 4.1 at 1438;
- Layer 7.2 at line 1922.

Its line 2132 reads "ComplexKahlerGeometry K2 consumes Layer 0.3's uniform Riemann-sum estimate".

**Repair.** Delete lines 1620–1637 and cite by section: GlobalHolomorphicFunctions Layer 0.3, Layer 2.5, Layer 4.1, Layer 7.2 and Layer 7.4 (GH5.1).

## R09 (P3) — AlgebraicTopology names that do not exist, and a reversed 8.12 clause

**Location.** `README.md`:
- line 1352: "AT4.7's `simplicialRealizationCW`";
- line 1372: "AT Stage4's `cwSubcomplexNeighborhoods`";
- line 1475: "AT 8.12 consumes that later comparison".

**Claim.** Neither backticked name occurs in AlgebraicTopology at this head, and the edge in the 8.12 clause runs the other way.

**Witness.**
- AlgebraicTopology at this head has 0 occurrences of either name, in its README or its `Suggested.lean`. Line 989 reads "Own the subcomplex neighbourhoods" and line 1095 "Own the realization CW structure".
- AlgebraicTopology line 2960 gives 8.12's inputs as "8.8a, 8.10 and the native `AddCircle` EM instance; no projective carrier or external comparison".
- CharacteristicClasses lines 291–295 say that C1.5a consumes "AT8.12's native circle comparison".

**Repair.** Cite "AlgebraicTopology Stage 4.7's realization CW structure" and "Stage 4.5's subcomplex neighbourhoods", and delete the 8.12 clause at line 1475.

## R10 (P3) — K1 asserts a supply that LieGroupoidsPoisson denies

**Location.** `README.md` lines 190–191: "LieGroupoidsPoisson consumes the eigensubbundle/involutivity dictionary and builds their complex Lie algebroid structures."

**Claim.** The sentence adds a reverse edge to a supplier of K8.

**Witness.** `TauCetiRoadmap/LieGroupoidsPoisson/README.md` on main 32a0bcc, lines 85–86: ComplexKahlerGeometry "is a consumer of this roadmap (its K8 consumes §G1.3a) and is therefore never a supplier here."

**Repair.** Delete the sentence. The involutivity equivalence is already pinned (R06).

## R11 (P3) — Pull-request numbers and commit-pinned links as supplier citations

**Location.**
- 21 occurrences of "#279" and 3 of "#280", for example line 98: "Consume #279 Milestones 1 and 2".
- 29 `github.com/TauCetiProject/TauCetiRoadmap/blob/<sha>/…` links (gate `blob`).
- 8 fork links (`github.com/mccorvie/…`, `github.com/Paul-Lez/…`).

**Claim.** A citation names a roadmap and a section, never a pull request or a commit.

**Witness.** On main 32a0bcc:
- `TauCetiRoadmap/ComplexManifolds/README.md` has Milestones 1–7 at lines 172–319 (line 197: "## Milestone 2: the canonical real orientation");
- `TauCetiRoadmap/ComplexTori/README.md` has Milestones 1–6 at lines 130–341.

**Repair.**
- Replace "#279" by "ComplexManifolds" and "#280" by "ComplexTori".
- Replace each blob or fork link by the roadmap name and section, with a relative link for roadmaps on main.

## R12 (P3) — Citation labels that do not resolve in the suppliers' numbering

**Location.**
- "VariationalMethods V2–V5.2", "V5.1", "V2.2–V2.4", "V3–V4", "V3.1", "VM V2.3" and "V5.3" (lines 572, 1049, 1053, 1059, 1063, 1065, 1153, 1656–1657).
- `CompactFormPair.operator` (line 1050).
- "PDE Lane A.3" and "Lane B.9" (lines 571, 813, 825, 1652).

**Claim.** None of these labels exists in the cited roadmap.

**Witness.**
- VariationalMethods at head 7ea28a3b numbers its sections 1.1–5.3 (headings at lines 237–924) and has 0 `V<n>.<n>` labels. The resolver also reports "VariationalMethods has no V5.1" and "no V2.2". Line 841 says the compact-pair operator "is UnboundedOperators UO-D06's `closedFormOperator`", and line 845 defines `CompactFormPair.operatorDomainV`.
- PDE on main 32a0bcc has no "Lane" label. It has "### 1.3 Agreement with the Bessel-potential scale (A3)" (line 769) and "### 2.2 Interpolation (B9)" (line 1148).

**Repair.**
- Cite the VariationalMethods sections as §2.2–§5.3.
- Replace `CompactFormPair.operator` with "UO-D06's `closedFormOperator` through VariationalMethods §5.1 and `CompactFormPair.operatorDomainV`".
- Cite PDE §1.3 (A3) and §2.2 (B9).

The previous report also listed "GH5.1" (lines 35, 981) and "LieGroupoidsPoisson G1.3" (lines 1551, 1598, 1683). Both resolve, and both items are withdrawn:
- GlobalHolomorphicFunctions line 2090 is "### 7.4 … (GH5.1)", and its line 2133 says "K5a consumes GH5.1's complex two-form exactness". The same was true at db419f37.
- LieGroupoidsPoisson on main has "### G1.3 Chevalley–Eilenberg complexes" at line 636.

## R13 (P3) — Import header

**Location.** `Suggested.lean` lines 1–9: "import Mathlib.Analysis.Complex.Basic" … "import TauCetiRoadmap.DifferentialGeometry.Suggested" (gate `imports`, `mathlib-subimports` ×5, `no-import-mathlib`).

**Claim.** The file has no `import Mathlib`, has five submodule imports, and imports another roadmap's module.

**Witness.** Line 8 is used only by `DensityFiber` (lines 120–121), an abbreviation of DifferentialGeometry's `Density`.

**Repair.** Write `import Mathlib` followed only by the `TauCeti.*` modules used. Delete `DensityFiber` and cite DifferentialGeometry 5.5 in the README.

## R14 (P3) — Padding in `Suggested.lean`

**Location and claim.** Each of these restates a definition or a pinned lemma, or closes in one step:
- `realified_isManifold_analytic` (35);
- `memSobolev_iff_bundled` (106);
- `dbarFunction_apply_J` and `dbarFunction_eq_zero_iff` (55, 61);
- `nijenhuisTensor_skew` (88);
- `complexBesselDistributionMultiplier_real` (484);
- `bundleTest_smul_apply` (275), `bundleTestRestrictScalars_apply` (360) and `bundleSobolevLocalizations_apply` (393);
- `bundleSobolev_norm_sq` (383), `bundleSobolevComplete` (413) and `complexBesselToL2_norm` (503).

**Witness.** I re-ran the probe this round at the pins, with `realified_isManifold_analytic`'s own binders (`[FiniteDimensional ℂ E]`, `[h : IsManifold 𝓘(ℂ, E) ∞ M]`, goal `IsManifold 𝓘(ℝ, E) ω M`). The single term `IsManifold.restrictScalars_of_ne_zero ω (by simp) h` closes it, exit 0. `bundleSobolev_norm_sq` is already proved by the single term `PiLp.norm_sq_eq_of_L2 _ u.1` (line 385).

**Repair.** Delete them from `Suggested.lean`. The README keeps the statements as targets or Checks.

## R15 (P3) — `bundleSobolevToDistribution` chooses its datum

**Location.** `Suggested.lean` line 400: "toFun u := Classical.choose u.2" (gate `statement-hygiene`, P3).

**Claim.** The map is defined by an unspecified choice, and its `hinj` argument (line 398) is unused in the body.

**Witness.** The gate reports this as a statement-hygiene hit at line 400, re-run at this head.

**Repair.** The deletion in R01 removes it. As a README target, define the map as the inverse of the injective localization on its range.

## R16 (P3) — README shape, Checks and process wording

**Location.**
- Line 1 reads "# Complex manifolds, Dolbeault theory, and Kähler geometry".
- The `##` headings are only "Conventions and suppliers", K1–K8 and "Order and references".
- Line 67 says "during its migration"; line 1249 and `Suggested.lean` line 21 say "prototype(s)".
- Lines 120–121 and 229 contain `\bar`/`\setminus`.

**Claim.** The README does not follow the house form.

**Witness.** The README has 0 `**Checks.**` lists, 0 `*Needs:*` lines, no `### Examples` or `### Dependencies`, and no `**Summary.**`. `DensityBundle M` (line 626) and `RealBundleSobolev V 0` (line 785) are backticked but not declared.

**Repair.**
- Restructure under `# Roadmap: …`, Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, and `## Layer k` sections, each ending with `### Examples` and `### Dependencies`.
- Add `*Needs:*` lines and at least three Checks per definition. Rows 14, 17 and 23 of the table below are candidates.
- Write the formulas in Unicode, drop the process words, and either remove the backticks from those names or declare them.

#1807's copy of this folder already has this shape (see the introduction).

## R17 (P3) — Missing locators, including most of the seeded sample

**Location.** These targets carry no theorem, section or page locator:
- Parameter Cauchy–Green (214–225);
- K3.HolomorphicStalk (317–330) and K3.MeromorphicGermField (332–374);
- K4.ComponentwiseFiniteRankAssembly (517–535);
- K5a (570 ff.), K5a.DistributionLocalStructure (658–716), K5a.SmoothSectionMontel (726) and K5a.ComponentwiseCompact (1086–1166);
- K5b, K5b.0 and K5b.1 (1168–1241);
- K7.1 (1407–1442) and K7.2 (1444–1517).

The reference list (1694–1703) gives Wells and Griffiths–Harris without a chapter or theorem.

**Claim.** Every theorem needs a locator at the claim. K8.NilpotentCentralReduction (line 1558) omits the Malcev input it owns, and the Iwasawa numbers at line 1545 are uncited.

**Witness.**
- `sakane-parallelisable` lines 111–113 rest the lattice step on Raghunathan, p. 31 Corollary 1 and p. 23 Theorem 1.13.
- `angella-iwasawa` lines 916–920 (Appendix A, p. 17) give `b₁=4`, `h^(1,0)=3` and `h^(0,1)=2`.

**Repair.**
- Cite Raghunathan Thm 1.13 (p. 23) and Cor. 1 (p. 31) in K8.
- Cite Angella Appendix A at line 1545.
- In K3, add Demailly Ch. II (2.1), (2.7), (2.10), (4.19) and (4.22) (`demailly-agbook` lines 3794, 3872, 3931, 4613, 4742).
- Give a chapter and theorem for every use of Wells and of Griffiths–Harris, and a locator for each remaining sampled target.

## R18 (P3) — Other open pull requests change this folder, with no consistent order

**Location.** This pull request's folder diff (`README.md` lines 609, 1538, 1613) and its merge-order paragraph: "#1101 → #1807 → this pull request … #1808 is independent of this pull request".

**Claim.**
- #1807, which is to merge first, replaces this folder with a rewritten README and `Suggested.lean`, and already makes this pull request's K8 change.
- #1808, which the paragraph calls independent, also rewrites the folder.
- #1234 conflicts with this head in `README.md`, and #1398 conflicts in `Suggested.lean`.

**Witness.**
- `roadmaps show ComplexKahlerGeometry --pr 1807` (head 6d06f1d) prints a README beginning "# Roadmap: complex manifolds, Dolbeault theory and Kähler geometry". Its line 2365 reads "Consume AlgebraicTopology Stage 5.0's generic filtered-complex spectral sequence".
- The same command with `--pr 1808` (head 7933169) shows the same text at line 2448.
- The overlap report lists the #1234 (258d35d) and #1398 (1038b16) conflicts.

**Repair.** Drop this pull request's three-line edit of the folder, because #1807 carries it. Alternatively, rebase the folder onto #1807's copy. State the order relative to #1808, #1234 and #1398.

## R19 (P3) — Edits outside the folders named as this pull request's own

**Location.** `Completed/ArithmeticDirichletSeries/README.md` (2 lines) and `TauCetiRoadmap/SymplecticGeometry/README.md` (6 lines).

**Claim.** The description discusses both edits, but neither folder is among the folders this pull request's review covers.

**Witness.** `git diff --stat origin/main...HEAD`, with the 17 named folders excluded, lists exactly these two files (4 insertions, 4 deletions).

**Repair.** Either name both folders as this pull request's own so that they are reviewed, or move the two edits to their own pull request.

## Previous findings

- R01 — not repaired: `Suggested.lean` line 77: "def nijenhuisTensor (J : TauCeti.SmoothAlmostComplexStructure I M) : … := by sorry"; gate `sorry-data` still 20.
- R02 — not repaired: `README.md` line 1493: "Consume [SurfaceTopology Layers 2–3](https://github.com/mccorvie/…)'s"; gate `dropped` still 14.
- R03 — not repaired: `README.md` line 1337: "Consume [RealAnalyticGeometry R0–R5]"; line 430: "RealAnalyticGeometry R5 supplies the global compatible".
- R04 — not repaired: `README.md` lines 45–47: "[PseudodifferentialOperators P1.0] … supplies differential-operator carriers, jets, symbols and formal density adjoints after K5a's initial density-line construction".
- R05 — not repaired: `Suggested.lean` line 12: "These are suggested forms, not an exhaustive checklist."; no headline stated.
- R06 — not repaired: `README.md` line 134: "K1 also equips the generic DG carrier `SmoothForm I M F k` with its natural"; `dbarFunction` and `nijenhuisTensor` still declared.
- R07 — not repaired: `README.md` lines 1459–1460: "construct on this same carrier Mathlib's `CWComplex` structure with one cell in each even dimension 0,2,…,2n".
- R08 — not repaired: `README.md` lines 1621–1622: "is a native-only preparatory phase before GH0 … Separate these phases explicitly."
- R09 — not repaired: `README.md` line 1352 "AT4.7's `simplicialRealizationCW`", line 1372 "`cwSubcomplexNeighborhoods`", line 1475 "AT 8.12 consumes that later comparison".
- R10 — not repaired: `README.md` lines 190–191: "LieGroupoidsPoisson consumes the eigensubbundle/involutivity dictionary and builds their complex Lie algebroid structures."
- R11 — not repaired: `README.md` line 98: "Consume #279 Milestones 1 and 2"; gate `blob` still 29.
- R12 — not repaired: `README.md` line 1049: "[VariationalMethods V5.1](https://github.com/…)"; line 1050: "`CompactFormPair.operator`". The GH5.1 and G1.3 items are withdrawn as previous-review errors.
- R13 — not repaired: `Suggested.lean` line 1 "import Mathlib.Analysis.Complex.Basic", line 8 "import TauCetiRoadmap.DifferentialGeometry.Suggested".
- R14 — not repaired: `Suggested.lean` lines 35–39: "theorem realified_isManifold_analytic … [IsManifold 𝓘(ℂ, E) ∞ M] : IsManifold 𝓘(ℝ, E) ω M := by sorry".
- R15 — not repaired: `Suggested.lean` line 400: "toFun u := Classical.choose u.2".
- R16 — not repaired: `README.md` line 1: "# Complex manifolds, Dolbeault theory, and Kähler geometry"; 0 `**Checks.**`, 0 `*Needs:*`.
- R17 — not repaired: `README.md` line 214: "**Parameter Cauchy–Green.** Prove the following lemma for this solver." (no locator).
- R18 — not repaired: the folder diff is still lines 609, 1538, 1613; the merge-order paragraph still says "#1808 is independent of this pull request".
- R19 — not repaired: `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md` are still changed.

## Verified sound

**Change since 56715a5.** The folder diff is empty, and against main 32a0bcc the folder still differs by the same three lines. Main moved from bbbde05 to 32a0bcc. Among roadmap READMEs only ModularForms changed, and this roadmap does not cite it. The roadmaps this one cites changed only in `PROGRESS.md`/`STATUS.md`: CharacteristicClasses, LieGroupoidsPoisson, PseudodifferentialOperators and SmoothBundlesConnections.

**The pull request's other changed folders.** Only two of the eight changed folders mention this roadmap; AlgebraicCurves, BanachSpaceTheory, BordismFormalGroups, ClassifyingSpaces, LocalPurity and ReductiveGroups have 0 mentions of ComplexKahlerGeometry/CKG in their README or `Suggested.lean`.
- **AlgebraicTopology.** The diff since 56715a5 touches:
  - the inventory, in the hunks at new lines 393–402 and 452–467;
  - the Stage 8.8b uniqueness route, in the hunks at new lines 2489–2540 and 2544–2552;
  - a new Check, in the hunk at new lines 3017–3031;
  - one `Suggested.lean` docstring at lines 631–638.

  None of these touches Stage 4.5, 4.6, 4.7, 5.0, 6.3, 6.4 or 8.12, the stages this roadmap cites. Those stages still carry the cited content: 989 (subcomplex neighbourhoods), 1054–1071 (4.6, "ComplexKahlerGeometry K7 consumes"), 1095 (4.7 realization), 1209 (5.0, "ComplexKahlerGeometry K8's column-filtration adapter"), 2199–2205 and 2896/2960 (8.12).
- **CharacteristicClasses.** Its contract with this roadmap moved into a `### From TauCetiRoadmap.ComplexKahlerGeometry` subsection (lines 346–356) with the same content: K4, K7.1 and K7.2 supply the carrier, the lines, `ω_FS` and the O(1) curvature `−2πiω_FS`. This agrees with CKG line 1469 ("does not consume CharacteristicClasses' later universal class construction"), so the edge runs one way. Its conventions (lines 127–128 and 1979) and the C1.5a normalization (line 1133) were recomputed against this roadmap in rows 48–51.

**Gate, build and signatures.**
- Gate re-run: the same text counts as the worker's.
- Elaboration: exit 0, 37 `sorry` warnings.
- `#check @` for every declaration (62 names) in one scratch copy, run from the worktree: exit 0, 0 errors. Against the README, the only differences are those of R01: the binders of `IsKahler` and `nijenhuisTensor`, and the free `localize`. Nothing else changed from the previous report.
- Headline and padding probe: exit 0, four `sorry` warnings and the one-term closure (R05, R14).
- Depcheck: `depcheck: 239 roadmaps, 2315 edges, 0 problem(s)`.

**Library declarations opened at the pins (6 files, Tau Ceti 2fd255d).**
- `Geometry/Symplectic/Manifold/Nijenhuis.lean:158`;
- `Geometry/Manifold/DifferentialForm/Dolbeault/Basic.lean:95`;
- `Geometry/Manifold/Complex/StructureSheaf/Basic.lean:68`;
- `Topology/CWComplex/Classical/ComplexProjective.lean:419`;
- `KnotTheory/Cobordism.lean` 56–58;
- `Geometry/Manifold/Complex/Analytic.lean` 95–118 (`of_ne_zero`, `restrictScalars_of_ne_zero` with its explicit `n`).

The six modules imported by the headline probe also elaborate: `AlmostComplexStructure` (`ofComplexManifold` 76, `nijenhuis_ofComplexManifold` 221), `AlmostComplexType` (`IsOfType` 201), `JHolomorphic`, `Dolbeault/Basic`, `Nijenhuis` and `Analytic`. Mathlib: nothing newly relied on; the pin is unchanged.

**Cross-roadmap citations re-resolved: 46 locations.**
- Main 32a0bcc (12):
  - RealAnalyticGeometry 173, 736, 1019;
  - PseudodifferentialOperators 91, 529;
  - LieGroupoidsPoisson 18, 85–86, 636;
  - ComplexManifolds Milestones 172–319;
  - ComplexTori Milestones 130–341;
  - PDE 769, 1148.
- AlgebraicTopology at this head (10): 117, 135, 989, 1054–1071, 1095, 1209, 2199–2205, 2896, 2913, 2960.
- CharacteristicClasses at this head (7): 127, 291–296, 346–356, 1133, 1151, 1979, 1985.
- GlobalHolomorphicFunctions at head af99bc58 (10): 554, 866, 1104, 1159, 1438, 1922, 2002, 2090, 2101, 2132–2134.
- VariationalMethods at head 7ea28a3b (3): the headings 237–924, and lines 841, 845.
- This folder at #1807 6d06f1d, #1808 7933169, #1398 1038b16 and #1234 258d35d (4).

Of the resolver's two leads (V5.1, V2.2), both are confirmed in R12.

**Merge order.** SmoothBundlesConnections is at position 12, PseudodifferentialOperators at 13, ComplexComparisonPartII at 39, FormalConnectionsOpers at 40, GlobalHolomorphicFunctions at 97 and LieGroupoidsPoisson at 152. ComplexKahlerGeometry is not listed. Its placement after its last supplier is not a finding.

**Seeded sample.** No sampled target falls in changed text, so the previous results are carried, with locations re-checked at this head:
- Parameter Cauchy–Green (214): row 37; no locator (R17).
- K3.HolomorphicStalk (317) and K3.MeromorphicGermField (332): R06, R17.
- K4.ComponentwiseFiniteRankAssembly (517) and K5a (570), K5a.DistributionLocalStructure (658), K5a.SmoothSectionMontel (726) and K5a.ComponentwiseCompact (1086): R17, rows 23–25 and 31–32.
- K5b (1168), K5b.0 (1169) and K5b.1 (1208): Wells, with no chapter (R17); rows 14–16.
- K7.1 (1407): Stage 4.6 re-resolved (R07).
- K7.2 (1444): R02, R07, R09; rows 6, 21, 44, 49.
- K8.NilpotentCentralReduction (1558): Sakane Theorem 1, stated at `sakane-parallelisable` lines 46 and 102, with the central reduction at lines 106–115, re-read this round; R17 for the Raghunathan input.

The README flags no locator as unverified.

**Ownership against open roadmaps.** The overlap report's closest roadmaps in vocabulary are the same five as before: ComplexComparisonPartII, CalibratedGeometry, DifferentialGeometry, GeometricQuantization and RelativisticQuantumFieldTheory. Since no text changed, no new ownership question arises. The report lists no id that this roadmap cites and an open pull request drops, no id that only an open revision defines, and no id this pull request drops that others cite.

**Remarks on untouched text (no change requested).**
- Line 216 calls the compact-support operator "GH0's fixed-normalization Cauchy–Green operator". In GlobalHolomorphicFunctions' numbering, GH0 is Layer 2 (Runge, line 866) and the compact-support Cauchy–Green is Layer 0.3 (line 554). The R08 repair of citing by layer covers it.
- The overlap report lists #1807's and #1808's conflicts only in other folders, although both carry a rewritten copy of this folder. R18 rests on `roadmaps show`, not on the conflict list.

**Adversarial table.** No statement changed. Rows 1–47 are carried from the previous report (PRREVIEW-ComplexKahlerGeometry~57), with the same row numbers. "Re-run" marks a probe re-elaborated at the pins in this review, and "recomputed" a value recomputed by hand in this review. Rows 48–51 are new: they cross-check this roadmap against the CharacteristicClasses and AlgebraicTopology text changed since 56715a5.

| # | Statement | Instance | Left / right values | Result | Change |
|---|---|---|---|---|---|
| 1 | `h_T=g+iω`, conj-linear first slot (l. 68) | real `u,v` | `h_T(Ju,v)=ω−ig` / `−i h_T(u,v)=ω−ig` | equal | none |
| 2 | `h_T(u¹⁰,v¹⁰)=2g_ℂ(bar u¹⁰,v¹⁰)` (l. 71) | expand | `(2g+2iω)/4` / `h_T/2` | equal | none |
| 3 | `ω=(i/2)Σdz∧dz̄` (l. 72–73) | n=1 | `(i/2)(−2i)dx∧dy` / `dx∧dy` | equal | none |
| 4 | `h_src(u,v)=2h_T(v,u)` (l. 78) | `u=∂x, v=∂y` | `−2i` / `−2i` | equal | none |
| 5 | Chern `A=h⁻¹∂h` (l. 86) | metric compatibility | `A*H+HA=∂̄H+∂H` / `dH` | equal | none |
| 6 | `∫_(ℂP¹)ω_FS=1` (l. 88–89), recomputed | n=1 | `(1/π)∫₀^∞2πr dr/(1+r²)²=1` / `1` | equal | none |
| 7 | O(1) curvature `−2πiω_FS` (l. 89) | `h(e*,e*)=1/(1+\|z\|²)` | `Θ=∂∂̄log(1+\|z\|²)=(2π/i)ω_FS` / `−2πiω_FS` | equal | none |
| 8 | `dd^c=2i∂∂̄` (l. 59) | expand | `i(∂∂̄−∂̄∂)` / `2i∂∂̄` | equal | none |
| 9 | `∂̄²f(X,Y)=−¼∂f(N(X,Y))` (l. 171) | `JX=−iX` | `N=−4Z¹⁰` ⇒ `∂f(Z¹⁰)` / `−¼∂f(N)` | equal | none |
| 10 | `dbarFunction_apply_J` | `J²=−1` | `(df(Jv)−i df v)/2` / `−i(df v+i df(Jv))/2` | equal | R14 |
| 11 | `*²=(−1)^(k(m−k))`, `d*` sign (l. 601, 1083) | k=1, m=2 | `−1` = rotation²; same sign as pinned `codifferential` | equal | R06 |
| 12 | Hodge–Riemann sign (l. 1284) | n=1, α=dz | `i∫dz∧dz̄=2·area>0` | positive | none |
| 13 | `[Λ,L]=n−k` (l. 1254) | n=1, k=0 | `ΛL1−LΛ1=Λω=1` / `1−0=1` | equal | none |
| 14 | `\|dz_j\|²=2(H⁻¹)_jj`, `dz♯=2∂_z` (l. 1181–1183) | H=I | `\|dx\|²+\|dy\|²=2`; `∂x−i∂y=2∂_z` | equal | none |
| 15 | `α∧barStar β=⟨β,α⟩vol` (l. 616, 1197) | `⟨u,v⟩=B(ū,v)` | `B(α,β̄)` / `B(β̄,α)` | equal | none |
| 16 | `∂̄*=−*∂*` types (l. 1197) | `(p,q+1)` | `→(n−q−1,n−p)→(n−q,n−p)→(p,q)` | consistent | none |
| 17 | Hopf `h^(1,1)=0`, `h^(0,1)=1` (l. 1523–1530) | weights | `z^a dz_j↦2^(\|a\|+1)≥2`; weight 1 only on constants | `H¹(ℤ,𝒪)≅ℂ` | none |
| 18 | Hopf diamond vs Betti (l. 1531–1532) | S¹×S³ | `b₁=0+1=1`, `b₂=0`, `b₃=1` | equal | none |
| 19 | Iwasawa `h¹⁰=3, h⁰¹=2, b₁=4` (l. 1545), re-read | `angella-iwasawa` l. 918, 920 | `4; 3, 2` / `4; 3, 2`; `3+2≠4` | equal | R17 |
| 20 | ℂP¹ Serre (l. 1454–1457) | `K=O(−2)` | `H¹(O(−1))≅H⁰(O(−1))*=0` / 0 | equal | none |
| 21 | `h⁰(O(k))=C(n+k,n)` (l. 1450–1452) | n=1, k=2 | `{x²,xy,y²}`=3 / `C(3,1)=3` | equal | none |
| 22 | torus `h^(p,q)=C(n,p)C(n,q)` (l. 1482) | n=1 | `h¹⁰=h⁰¹=1`, `b₁=2` | equal | none |
| 23 | `⟨δ^(n)/n!,φ⟩=2^n` (l. 714) | `φ=1/(1+2x)` | `(−1)^n·(−2)^n` / `2^n` | equal | none |
| 24 | `H_m=t₊^(m−1)/(m−1)!`, `D^mH_m=δ` (l. 674–681) | m=k+2 | `C^(m−2)`; `D^(m−1)H_m`=Heaviside | holds | none |
| 25 | `exp(1/‖x‖²)` nonextension (l. 701–707) | `φ_ε` near `εe₁` | `≥C′εⁿe^((1+c)⁻²ε⁻²)` vs `Cε^(−N)` | contradiction ∀N | none |
| 26 | Peetre (l. 1005) | s=2, ζ=η=1; s=−2, ζ=1, η=−1 | `5≤8`; `1≤2` | holds | none |
| 27 | `B_F(f,g)=B₀(f,Rg)` (l. 800, 811) | unitary Fourier | `∫f̂ĝ=∫g(y)f(−y)dy` | equal | none |
| 28 | `u_ℂ(φ)=u(φ_R)+iu(φ_I)` (l. 756–760) | `split(iφ)=(−φ_I,φ_R)` | `u_ℂ(iφ)=i u_ℂ(φ)`; `κu_ℂ=u_ℂ` | true | R01 |
| 29 | sesquilinear `h` (l. 766) | first-slot i | `h(ix,y)=−i h(x,y)` both sides | equal | none |
| 30 | `A_sing` dimension drop (l. 413–418) | plane ∪ line in ℂ³ | `A_sing={0}`, 0<2 | holds | none |
| 31 | components open (l. 519–521) | ℂ ⊔ ℂ², rank 1 ⊔ 0 | clopen components | holds | none |
| 32 | finite component subcover (l. 1089–1092) | compact M | open components ⇒ finite | holds | none |
| 33 | K8 central reduction (l. 1570–1576), re-read | complex Heisenberg, Γ Gaussian | `A=Z≅ℂ`, fibre `ℂ/ℤ[i]`, dims 1+2=3 | matches Sakane l. 106–115 | R17 |
| 34 | Newlander–Nirenberg (headline), re-run | converse pinned (`nijenhuis_ofComplexManifold`, l. 221) | elaborates, exit 0 | statable | R05 |
| 35 | Weierstrass preparation (headline), re-run | `f=w²+zw`; d=0 | `u=1, a₁=z, a₀=0`; d=0 ⇒ `u=f` | statable | R05 |
| 36 | Hartogs (headline), re-run | n=1 `1/z`; shell | excluded by `2≤n`; by connectedness | statable | R05 |
| 37 | Parameter Cauchy–Green (l. 214–225) | `∂̄_z T(χf)=χf` | holomorphic on `ℂ∖tsupport χ` ∀p,q | holds | R17 |
| 38 | K2 solver tail bound (l. 236–237) | `A_jh=Σw_k h(ζ_k)g_k` | fixed nodes preserve q-holomorphy | holds | none |
| 39 | `realified_isManifold_analytic` (Lean 35), re-run | m=∞, n=ω, `[FiniteDimensional ℂ E]` | one term `restrictScalars_of_ne_zero ω (by simp) h`, exit 0 | padding | R14 |
| 40 | Riemann surface `b₁=2g` (l. 1484–1485) | torus; ℂP¹ | `2=2`; `0=0` | equal | R02 |
| 41 | `BundleSobolev` carrier (Lean 369–372), signature re-checked | `localize=0` | `{v \| ∀i, (v i).toDistr=0}={0}` | vacuous | R01 |
| 42 | `complexBesselSymbol` (Lean 466, 484) | `z=s`; `z=it` | `(1+\|ζ\|²)^(s/2)`; modulus 1 | holds | R14 |
| 43 | CharacteristicClasses: Chern form of O(1) is `+ω_FS` | K7 `Θ=−2πiω_FS` | `(i/2π)·(−2πi)ω_FS=+ω_FS` / `+ω_FS` | equal | none |
| 44 | CharacteristicClasses: `h` on ℂP¹ pairs to `+1`; K7.2 `⟨u,[ℂP¹]⟩=+1` (l. 1466) | row 6 | `∫_(ℂP¹)c₁(O(1))=∫ω_FS=1` / `+1` | equal; same orientation | none |
| 45 | K8 `d_r:E_r^(p,q)→E_r^(p+r,q−r+1)` (l. 1540) vs AlgebraicTopology Stage 5.0 decreasing cochain convention, deg=p+q | column filtration `F^p=⊕_(p′≥p)A^(p′,•)`, r=0,1 | `d₀=∂̄:(p,q)→(p,q+1)`, `d₁=∂:(p,q)→(p+1,q)` / formula gives `(p,q+1)`, `(p+1,q)`; degree `p+q→p+q+1` both | consistent | none |
| 46 | K7 `H*(ℂPⁿ;ℤ)=ℤ[u]/(u^(n+1))`, \|u\|=2 (l. 1463) vs AlgebraicTopology Stage 7 `χ(ℂPⁿ)=n+1` (AT l. 2199) | n=0; n=2 | `b=(1)`: χ=1 / 0+1; `b=(1,0,1,0,1)`: χ=3 / 2+1 | equal | none |
| 47 | K7.2 cell count (l. 1459–1460) vs pinned `cwComplex` (`ComplexProjective.lean` 419) | n=1 | cells in dims 0, 2 (ℂP¹=S²) / one cell per even m ≤ 2 | same object, already pinned | R07 |
| 48 | CharacteristicClasses at this head, l. 127–128 and 1979: "CKG's O(1) curvature −2πiω_FS gives Chern form +ω_FS", recomputed | CKG l. 89 `Θ=−2πiω_FS`, Chern form `(i/2π)Θ` | `(i/2π)(−2πi)=−i²=+1`, so `+ω_FS` / `+ω_FS` | equal | none |
| 49 | CharacteristicClasses l. 1133 and 1151: C1.5a's `f_h` restricted to ℂP¹ pairs to `+1` under CKG K7's orientation; consumes "CKG K7.2's u normalized on CP¹" | CKG K7.2 `⟨u,[ℂP¹]⟩=+1` (l. 1466); row 6 | `∫_(ℂP¹)ω_FS=1` / `+1` | equal; same normalization | none |
| 50 | CKG l. 1475 "AT 8.12 consumes that later comparison" vs AlgebraicTopology l. 2960 and CharacteristicClasses l. 291–295 | inputs of AT 8.12 | AT: {8.8a, 8.10, native `AddCircle` EM}, "no projective carrier or external comparison"; CharacteristicClasses: C1.5a consumes AT8.12 / CKG claims CharacteristicClasses' comparison is an input of 8.12 | edge reversed | R09 |
| 51 | CharacteristicClasses conventions l. 120–126 (same normalization as row 48), recomputed | `F=[[0,−dα],[dα,0]]`, `Pf([[0,a],[−a,0]])=a` | a=−dα ⇒ `Pf(F/2π)=−dα/(2π)`; complex: `F=dα·J↔i dα`, `(i/2π)(i dα)=−dα/(2π)` | Euler = c₁ form; consistent with `(i/2π)Θ` used in row 48 | none |

## Not verifiable

- Webster, Math. Z. 201 (1989), pp. 303–316 (`webster-nn`, uncertified, paywalled): the K1 Newlander–Nirenberg route. Cited by locator only.
- Griffiths–Harris, Ch. 0 §§1–2 (`griffiths-harris`, uncertified): K3's local rings and parametrization.
- Wells (`wells-dacm`, uncertified): K5b. The README gives no chapter (R17).
- Raghunathan, Thm 1.13 p. 23 and Cor. 1 p. 31 (`raghunathan-discrete-subgroups`, uncertified): taken from `sakane-parallelisable` lines 112–113, not read.
- Hörmander, ALPDO I, Thms 2.3.4–2.3.5 (`hormander-alpdo1`, uncertified): proposed in R17 from the manifest, not read.

## Source issues

- none
