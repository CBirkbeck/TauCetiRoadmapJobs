# Review of ComplexKahlerGeometry (pull request #1854 at 56715a5)

**Verdict:** needs changes

This is an incremental re-review of `TauCetiRoadmap/ComplexKahlerGeometry/` since c07dda7. The folder has not changed: `git diff c07dda7 56715a5` touches only `TauCetiRoadmap/AlgebraicTopology/` and `TauCetiRoadmap/BordismFormalGroups/` (README and `Suggested.lean` of each). Against main (now bbbde05) the folder still differs by the same three README lines (609, 1538, 1613).

None of the 19 previous findings is repaired. Each is written again below, with its witness re-checked at this head, on main bbbde05 and at the open heads. Two supplier heads have advanced since the last review (GlobalHolomorphicFunctions to db419f37, VariationalMethods to 7ea28a3b), so those witnesses carry new line numbers. Neither changed folder breaks a citation of this roadmap:
- BordismFormalGroups never names ComplexKahlerGeometry, in its README or in its `Suggested.lean`.
- Every AlgebraicTopology section this README cites still exists with the content it cites: Stage 4.5, 4.6, 4.7, 5.0, 6.3, 6.4 and 8.12. Only the line numbers moved.

There is no new finding. Pins are unchanged: Tau Ceti 2fd255d, Mathlib 1b1ccf4.

**The shortest route.** #1807 (head 64a16e1) carries a rewritten copy of this folder, and this pull request's own merge-order paragraph places #1807 first. That copy has 0 "#279", 0 commit-pinned links, 0 SurfaceTopology/PlanarTopology citations, 35 `**Checks.**` lists, 35 `*Needs:*` lines and an `import Mathlib` header. It already makes this pull request's K8 change ("Consume AlgebraicTopology Stage 5.0's generic filtered-complex spectral sequence"). Dropping this pull request's three-line edit of the folder (R18) therefore removes the folder from this pull request, and its remaining findings are then judged against #1807's copy in that pull request's review.

**Gate.** I re-ran it and got the same counts as the worker: blob=29, sorry-data=20, imports=1, mathlib-subimports=5, no-import-mathlib=1, statement-hygiene=1, dropped=14, FAIL. My run reports outside-folder=34 because it does not know the pull request's own folders. With the 17 named folders excluded, `git diff --stat origin/main...HEAD` lists exactly the worker's 2 files (R19).

**Dependency check.** Output: `depcheck: 238 roadmaps, 2343 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. R03 and R04 are two-way supplies that this check does not see, because the reverse citation sits in the other roadmap on main.

**Elaboration.** `lake env lean TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` exits 0 with 37 `sorry` warnings and no other diagnostic. I also elaborated a scratch copy with one `#check @` per declaration: exit 0, no error, and the elaborated types are those described in the previous review (see R01).

## R01 (P1) — Twenty sorried data declarations in `Suggested.lean`

**Location.** `TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` lines 77–79, 139–174, 224–236, 287–314, 348–357, 369–375, 397–402, 428–437 and 489–492 (gate `sorry-data`, 20 hits). Line 77: "def nijenhuisTensor (J : TauCeti.SmoothAlmostComplexStructure I M) : (x : M) → TangentSpace I x →L[ℝ] … := by sorry".

**Claim.** The following carry sorried data:
- the `RealBundleTest`/`BundleTest` topology, `ContinuousSMul` and `LocallyConvexSpace` instances;
- `nijenhuisTensor`, `realBundleTestOfChart`, `bundleTestOfChart`, `realDistributionComplexify`, `bundleDistributionConjugation` and `complexBesselToL2`;
- the fields of the two submodules, of `bundleTestSmul`, of `bundleTestRestrictScalars` and of `bundleSobolevToDistribution`.

`IsKahler`, `BundleDistribution`, `BundleSobolev` and every `*_apply`, `*_continuous_iff` and `complexBesselToL2_*` theorem mention one of them.

**Witness.**
- `#check @IsKahler` and `#check @nijenhuisTensor`, re-run at this head: the binders stop at `[IsManifold I ⊤ M]`, with no `[FiniteDimensional ℝ E]`, `[CompleteSpace E]` or `[T2Space M]`.
- The carrier of `bundleSobolevSubmodule` (lines 371–372) uses a free `localize`. With `localize = 0` it becomes `{v | ∀ i, (v i).toDistr = 0}`, which is `{0}`.

**Repair.** Delete every sorried `def`, `abbrev` and `instance`, and every declaration that mentions one; the README keeps them as K5a targets. If `IsKahler` is kept, define it as `form.IsClosed ∧ form.Compatible J ∧ J.nijenhuis = 0`, with `[FiniteDimensional ℝ E]` in its own signature.

## R02 (P1) — K7.2 consumes SurfaceTopology and PlanarTopology, which may not be suppliers

**Location.** `README.md` line 1493: "Consume [SurfaceTopology Layers 2–3](https://github.com/mccorvie/…)'s". Lines 1488, 1492, 1495–1496, 1505–1506 and 1674–1675 have the same problem (gate `dropped`, 14 hits).

**Claim.** Both roadmaps are on the project's never-a-supplier list. Four objects of K7.2 therefore have no owner: the surface adapter, the classification homeomorphism, the standard CW model and the polygon cup matrix.

**Witness.** Main bbbde05 has no `TauCetiRoadmap/SurfaceTopology` or `TauCetiRoadmap/PlanarTopology`. At the pin, `TauCeti/KnotTheory/Cobordism.lean` lines 56–58 say that the classification of compact surfaces "is not proved here".

**Repair.**
- Delete lines 1487–1506 and 1673–1675.
- Keep the `b₁=2g` Hodge comparison at line 1485.
- Take `H²(Σ;ℤ)≃ℤ` and unimodularity of the integral cup pairing from AlgebraicTopology Stage 6.4 Poincaré duality.
- Obtain the standard symplectic ℤ-basis from the normal form of unimodular alternating forms over ℤ.

## R03 (P1) — Two-way supply with RealAnalyticGeometry

**Location.** `README.md`:
- lines 430–431: "RealAnalyticGeometry R5 supplies the global compatible triangulation and its frontier refinement";
- line 1337: "Consume [RealAnalyticGeometry R0–R5]";
- lines 1689–1690: "precede RealAnalyticGeometry R1's local semianalytic/component results; those results then supply K3's finite regular-piece partition".

**Claim.** RealAnalyticGeometry consumes K3 and K4 of this roadmap, and K3 and K6.1 consume its R1 and R5. Neither roadmap can come first.

**Witness.** In `TauCetiRoadmap/RealAnalyticGeometry/README.md` on main bbbde05:
- line 173: "The proof uses CK K3's convergent Weierstrass preparation";
- line 736: "supplied by CK K4";
- line 1019: "the provider consumed by ComplexKahlerGeometry K6".

**Repair.**
1. In K3, prove finiteness of the regular-piece partition from local parametrization and compactness, without R1.
2. Move the K6.1 analytic-cycle triangulation and the integral fundamental class (line 1331 to the end of K6.1) to "ComplexKahlerGeometry, Part II", placed after RealAnalyticGeometry.
3. Rewrite lines 1688–1692 to say only that RealAnalyticGeometry consumes K2–K4.

## R04 (P1) — Two-way supply with PseudodifferentialOperators

**Location.** `README.md` lines 45–47: "[PseudodifferentialOperators P1.0] … supplies differential-operator carriers, jets, symbols and formal density adjoints after K5a's initial density-line construction". Lines 575–577 and 1650–1652 have the same problem.

**Claim.** PseudodifferentialOperators, at merge-order position 13, lists this roadmap as a supplier, and K5a consumes its P1.0.

**Witness.** In `TauCetiRoadmap/PseudodifferentialOperators/README.md` on main bbbde05:
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

**Witness.** I re-ran the block below at the pins, in a scratch file with `import Mathlib` and six `TauCeti.*` modules: `Geometry.Manifold.Complex.AlmostComplexStructure`, `….Complex.Analytic`, `Geometry.Manifold.DifferentialForm.AlmostComplexType`, `….DifferentialForm.Dolbeault.Basic`, `Geometry.Symplectic.Manifold.JHolomorphic` and `….Manifold.Nijenhuis`. It exits 0 with four `sorry` warnings.

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
   - Webster for Newlander–Nirenberg;
   - Demailly Ch. I (3.29), p. 28 (`demailly-agbook` line 1288);
   - Demailly Ch. II (2.1), p. 80 (line 3794);
   - Demailly Ch. I (3.28) (line 1266).
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

**Witness.** In Tau Ceti 2fd255d, re-opened at the same lines:
- `Geometry/Symplectic/Manifold/Nijenhuis.lean:158` has `nijenhuis`;
- `Geometry/Manifold/DifferentialForm/Dolbeault/Basic.lean:95` has `delBar` as a `ℂ`-linear map `SmoothForm I M F k →ₗ[ℂ] SmoothForm I M F (k + 1)`;
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
- At the pin, `Topology/CWComplex/Classical/ComplexProjective.lean:419` defines `TauCeti.ComplexProjectiveSpace.cwComplex`, with one cell in each even dimension (`nat_card_cell_cwComplex`, docstring lines 44–47).
- `TauCetiRoadmap/AlgebraicTopology/README.md` at this head, lines 1042–1059: Stage 4.6 transports that structure to `Projectivization ℂ (Fin (n+1) → ℂ)`, and "ComplexKahlerGeometry K7 consumes that topology and this cell structure". Line 2191 says the same.

**Repair.** Replace the construction sentence with "Consume AlgebraicTopology Stage 4.6's CW structure on `Projectivization ℂ (Fin (n+1) → ℂ)`, transported from the pinned `TauCeti.ComplexProjectiveSpace.cwComplex`". Keep only:
- the cellular/cup calculation;
- `⟨u,[ℂP¹]⟩=+1`;
- the de Rham/Chern–Weil comparison.

Update lines 1668–1669 to match.

## R08 (P2) — "Order and references" re-plans GlobalHolomorphicFunctions

**Location.** `README.md` lines 1620–1637: "is a native-only preparatory phase before GH0; GH2's global prescribed-singularity patching follows GH0. Separate these phases explicitly." Line 1637: "The global one-variable provider order is GH0 … → GH5 … → GH5.1".

**Claim.** The paragraph orders and specifies another roadmap's own targets.

**Witness.** GlobalHolomorphicFunctions at its open head db419f37 already orders and owns these targets:
- Layer 0.3 at line 483;
- Layer 2.5 at line 987, whose line 1042 names "CKG K2" as consumer of `exists_finite_rank_runge_operator`;
- Layer 4.1 at line 1319;
- Layer 7.2 at line 1851.

Its line 2042 reads "ComplexKahlerGeometry K2 consumes Layer 0.3's derivative transfer".

**Repair.** Delete lines 1620–1637 and cite by section: GlobalHolomorphicFunctions Layer 0.3, Layer 2.5, Layer 4.1 and Layer 7.2.

## R09 (P3) — AlgebraicTopology names that do not exist, and a reversed 8.12 clause

**Location.** `README.md`:
- line 1352: "AT4.7's `simplicialRealizationCW`";
- line 1372: "AT Stage4's `cwSubcomplexNeighborhoods`";
- line 1475: "AT 8.12 consumes that later comparison".

**Claim.** Neither backticked name occurs in AlgebraicTopology at this head, and the edge in the 8.12 clause runs the other way.

**Witness.**
- AlgebraicTopology at this head has 0 occurrences of either name, in its README or its `Suggested.lean`. Its line 977 reads "Own the subcomplex neighbourhoods" and line 1083 "Own the realization CW structure".
- CharacteristicClasses README lines 64–70 say that C1.5a consumes "AT8.12's native circle comparison".

**Repair.** Cite "AlgebraicTopology Stage 4.7's realization CW structure" and "Stage 4.5's subcomplex neighbourhoods", and delete the 8.12 clause at line 1475.

## R10 (P3) — K1 asserts a supply that LieGroupoidsPoisson denies

**Location.** `README.md` lines 190–191: "LieGroupoidsPoisson consumes the eigensubbundle/involutivity dictionary and builds their complex Lie algebroid structures."

**Claim.** The sentence adds a reverse edge to a supplier of K8.

**Witness.** `TauCetiRoadmap/LieGroupoidsPoisson/README.md` on main bbbde05, lines 85–86: ComplexKahlerGeometry "is a consumer of this roadmap (its K8 consumes §G1.3a) and is therefore never a supplier here."

**Repair.** Delete the sentence. The involutivity equivalence is already pinned (R06).

## R11 (P3) — Pull-request numbers and commit-pinned links as supplier citations

**Location.**
- 21 occurrences of "#279" and 3 of "#280", for example line 98: "Consume #279 Milestones 1 and 2".
- 29 `github.com/TauCetiProject/TauCetiRoadmap/blob/<sha>/…` links (gate `blob`).
- 8 fork links (`github.com/mccorvie/…`, `github.com/Paul-Lez/…`).

**Claim.** A citation names a roadmap and a section, never a pull request or a commit.

**Witness.** `TauCetiRoadmap/ComplexManifolds/README.md` on main bbbde05, line 197: "## Milestone 2: the canonical real orientation". ComplexTori is on main with Milestones 1–6 (lines 130–341).

**Repair.**
- Replace "#279" by "ComplexManifolds" and "#280" by "ComplexTori".
- Replace each blob or fork link by the roadmap name and section, with a relative link for roadmaps on main.

## R12 (P3) — Citation labels that do not resolve in the suppliers' numbering

**Location.**
- "VariationalMethods V2–V5.2", "V5.1", "V2.2–V2.4", "V3–V4", "V3.1" and "V5.3" (lines 572, 1049, 1053, 1059, 1063, 1065, 1153, 1653–1657).
- `CompactFormPair.operator` (line 1050).
- "GH5.1" for two-form exactness (lines 35, 981).
- "PDE Lane A.3" and "Lane B.9" (lines 571, 813, 825, 1652).
- "LieGroupoidsPoisson G1.3" (lines 1551, 1598, 1683).

**Claim.** None of these labels exists in the cited roadmap.

**Witness.**
- VariationalMethods at head 7ea28a3b numbers its sections 1.1–5.3 and has 0 `V<n>.<n>` labels. Line 841 says the compact-pair operator "is UnboundedOperators UO-D06's `closedFormOperator`", and line 845 defines `CompactFormPair.operatorDomainV`.
- GlobalHolomorphicFunctions' "GH5.1" is Layer 7.4 (line 2000). The exactness is proved in Layer 7.2, whose line 1919 names CKG K5a as consumer.
- PDE on main has "### 1.3 … (A3)" (line 769) and "### 2.2 Interpolation (B9)" (line 1148).
- LieGroupoidsPoisson's target is §G1.3a (line 18).

**Repair.**
- Cite the VariationalMethods sections as §2.2–§5.3.
- Replace `CompactFormPair.operator` with "UO-D06's `closedFormOperator` through VariationalMethods §5.1 and `CompactFormPair.operatorDomainV`".
- Cite GlobalHolomorphicFunctions Layer 7.2, PDE §1.3 (A3) and §2.2 (B9), and LieGroupoidsPoisson §G1.3a.

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

**Witness.** I re-ran the probe at the pins with `realified_isManifold_analytic`'s own binders (`[FiniteDimensional ℂ E]`, `[IsManifold 𝓘(ℂ, E) ∞ M]`). The term `IsManifold.restrictScalars_of_ne_zero ω (by simp) h` closes it, exit 0. `complexBesselToL2_norm` is already proved by the single term `(complexBesselToL2 n G s t).norm_map u` (lines 505–506).

**Repair.** Delete them from `Suggested.lean`. The README keeps the statements as targets or Checks.

## R15 (P3) — `bundleSobolevToDistribution` chooses its datum

**Location.** `Suggested.lean` line 400: "toFun u := Classical.choose u.2" (gate `statement-hygiene`, P3).

**Claim.** The map is defined by an unspecified choice, and its `hinj` argument (line 398) is unused in the body.

**Witness.** The gate reports this as a statement-hygiene hit at line 400.

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

**Claim.** Every theorem needs a locator at the claim. K8.NilpotentCentralReduction omits the Malcev input it owns, and the Iwasawa numbers at line 1545 are uncited.

**Witness.** `sakane-parallelisable` lines 112–113 rest the lattice step on Raghunathan, p. 31 Corollary 1 and p. 23 Theorem 1.13. `angella-iwasawa` lines 917–920 (Appendix A) give `b₁=4`, `h^(1,0)=3` and `h^(0,1)=2`.

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
- `roadmaps show ComplexKahlerGeometry --pr 1807` (head 64a16e1) prints a README beginning "# Roadmap: complex manifolds, Dolbeault theory and Kähler geometry", which contains "Consume AlgebraicTopology Stage 5.0's generic filtered-complex spectral sequence".
- The same command with `--pr 1808` (head a96d197) shows the same Stage 5.0 text.
- The overlap report lists the #1234 and #1398 conflicts.

**Repair.** Drop this pull request's three-line edit of the folder, because #1807 carries it. Alternatively, rebase the folder onto #1807's copy. State the order relative to #1808, #1234 and #1398.

## R19 (P3) — Edits outside the folders named as this pull request's own

**Location.** `Completed/ArithmeticDirichletSeries/README.md` (2 lines) and `TauCetiRoadmap/SymplecticGeometry/README.md` (6 lines).

**Claim.** The description discusses both edits, but neither folder is among the folders this pull request's review covers.

**Witness.** `git diff --stat origin/main...HEAD`, with the 17 named folders excluded, lists exactly these two files (4 insertions, 4 deletions).

**Repair.** Either name both folders as this pull request's own so that they are reviewed, or move the two edits to their own pull request.

## Previous findings

- R01 — not repaired: `Suggested.lean` lines 77–79: "def nijenhuisTensor (J : TauCeti.SmoothAlmostComplexStructure I M) : (x : M) → TangentSpace I x →L[ℝ] … := by sorry"; gate `sorry-data` still 20.
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
- R12 — not repaired: `README.md` line 1049: "[VariationalMethods V5.1](https://github.com/…)"; line 1050: "`CompactFormPair.operator`".
- R13 — not repaired: `Suggested.lean` line 1 "import Mathlib.Analysis.Complex.Basic", line 8 "import TauCetiRoadmap.DifferentialGeometry.Suggested".
- R14 — not repaired: `Suggested.lean` lines 35–39: "theorem realified_isManifold_analytic … : IsManifold 𝓘(ℝ, E) ω M := by sorry".
- R15 — not repaired: `Suggested.lean` line 400: "toFun u := Classical.choose u.2".
- R16 — not repaired: `README.md` line 1: "# Complex manifolds, Dolbeault theory, and Kähler geometry"; 0 `**Checks.**`, 0 `*Needs:*`.
- R17 — not repaired: `README.md` line 214: "**Parameter Cauchy–Green.** Prove the following lemma for this solver." (no locator).
- R18 — not repaired: the folder diff is still lines 609, 1538, 1613; the merge-order paragraph is unchanged ("#1808 is independent of this pull request").
- R19 — not repaired: `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md` are still changed.

## Verified sound

**Change since c07dda7.** The folder diff is empty. Against main bbbde05 the folder still differs by the same three lines. Main moved from c58403c to bbbde05; within the roadmaps this one cites, only progress reports changed (ComplexManifolds and ComplexTori `PROGRESS.md`/`STATUS.md`), and no README this roadmap cites changed.

The files changed elsewhere belong to two of this pull request's own folders:
- **AlgebraicTopology.** The diff's hunks lie at new lines 97–110, 449–469, 2300–2320, 2472–2506, 2554–2581 and 2901–2907. They concern Stage 8.8b, 8.8c and relative Hurewicz. None of the changed lines mentions ComplexKahlerGeometry, K7, K8, projective space, CW structures or spectral sequences. `git diff` of its `Suggested.lean` has no such line either.
- **BordismFormalGroups.** It never names ComplexKahlerGeometry.

So the changes introduce no new defect here.

**Gate, build and signatures.**
- Gate re-run: the same text counts as the worker's.
- Elaboration: exit 0, 37 `sorry` warnings.
- `#check @` for every declaration (62 names) in one scratch copy, run from the worktree: exit 0, no error. Against the README, the only differences are those of R01: the binders of `IsKahler` and `nijenhuisTensor`, and the free `localize`.
- Headline probe: four theorems plus one padding term, exit 0 (R05, R14).
- Depcheck: `depcheck: 238 roadmaps, 2343 edges, 0 problem(s)`.

**Library declarations opened at the pins (11 files).** All in Tau Ceti 2fd255d:
- `Geometry/Symplectic/Manifold/Nijenhuis.lean` 158;
- `Geometry/Manifold/DifferentialForm/Dolbeault/Basic.lean` 71–117 and 95;
- `Geometry/Manifold/Complex/StructureSheaf/Basic.lean` 68;
- `Geometry/Manifold/Complex/Analytic.lean` 100–118 (`restrictScalars_of_ne_zero`, which needs finite dimensionality);
- `Geometry/Manifold/Complex/AlmostComplexStructure.lean` 65–76 (`ofComplexManifold`);
- `Geometry/Symplectic/Manifold/JHolomorphic.lean` 96 (`IsPseudoholomorphicOn`);
- `Geometry/Manifold/DifferentialForm/AlmostComplexType.lean` 201 (`IsOfType`);
- `Geometry/Manifold/DifferentialForm/Smooth.lean` 479 (`SmoothForm`);
- `KnotTheory/Cobordism.lean` 56–58;
- `Topology/CWComplex/Classical/ComplexProjective.lean` 22, 41–47, 271, 419 and 433 (`cwComplex`, `cellMap`, `map_cwComplex`).

Mathlib: nothing newly relied on. The pins are unchanged, so the earlier Mathlib list stands.

**Cross-roadmap citations re-resolved: 38 locations.**
- AlgebraicTopology at this head (10): lines 125–137, 977, 1042–1059, 1083, 1162–1198 (Stage 5.0, which names "ComplexKahlerGeometry K8's column-filtration adapter" as consumer), Stage 6 items 1 and 3–4 at 1507, 1743 and 2105, 2185–2194 and 2847–2862.
- CharacteristicClasses at this head (1): lines 60–72.
- Main bbbde05 (11):
  - RealAnalyticGeometry 173, 736, 1019;
  - PseudodifferentialOperators 91, 529;
  - LieGroupoidsPoisson 18, 85–86;
  - ComplexManifolds 197 (Milestones 172–319);
  - ComplexTori Milestones 130–341;
  - PDE 769, 1148.
- GlobalHolomorphicFunctions at head db419f37 (10): 50, 483, 987, 1042, 1319, 1851, 1919, 2000, 2011, 2042.
- VariationalMethods at head 7ea28a3b (4): section headings 233–924, and lines 841, 845, 862.
- This folder at #1807 (64a16e1) and #1808 (a96d197) (2).

Both resolver leads (V5.1, V2.2) are confirmed in R12.

**Merge order.** PseudodifferentialOperators is at position 13, GlobalHolomorphicFunctions at 95 and LieGroupoidsPoisson at 151. ComplexKahlerGeometry is not listed. Its placement after its last supplier is not a finding.

**Seeded sample.** No sampled target falls in changed text, so the previous results are carried:
- Parameter Cauchy–Green: GlobalHolomorphicFunctions Layer 0.3 exists at its head, line 483; no locator (R17).
- K3.HolomorphicStalk and K3.MeromorphicGermField: R06, R17.
- K4.ComponentwiseFiniteRankAssembly and the K5a items: R17.
- K5b, K5b.0 and K5b.1: Wells, with no chapter (R17).
- K7.1: Mathlib `OnePoint.equivProjectivization`, and Stage 4.6 re-resolved (R07).
- K7.2: R02, R07, R09.
- K8.NilpotentCentralReduction: Sakane Theorem 1, stated at `sakane-parallelisable` lines 46 and 102, with the central reduction at lines 106–115 (R17 for the Raghunathan input).

**Ownership against open roadmaps.** The overlap report's closest roadmaps in vocabulary are ComplexComparisonPartII, CalibratedGeometry, DifferentialGeometry, RelativisticQuantumFieldTheory and GeometricQuantization, the same set as before. Since no text changed, no new ownership question arises. This round I re-read GlobalHolomorphicFunctions (R08, R12) and VariationalMethods (R12) at their open heads, and this folder at #1807 and #1808 (R18). The overlap report lists no id that this roadmap cites and an open pull request drops, and no id that only a revision defines.

**Remark on the overlap report (no change requested).** It lists #1807's and #1808's conflicts only in other folders, although both carry a rewritten copy of this folder; R18 rests on `roadmaps show`, not on the conflict list.

**Adversarial table.** No statement changed. Rows 1–44 are carried from the previous review (same row numbers). "Re-run" marks a probe re-elaborated at the pins in this review, and "recomputed" a value recomputed by hand in this review. Rows 45–47 are new: they cross-check this roadmap against AlgebraicTopology and the pin at this head.

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
| 13 | `[Λ,L]=n−k` (l. 1254), recomputed | n=1, k=0 | `ΛL1−LΛ1=Λω=1` / `1−0=1` | equal | none |
| 14 | `\|dz_j\|²=2(H⁻¹)_jj`, `dz♯=2∂_z` (l. 1181–1183) | H=I | `\|dx\|²+\|dy\|²=2`; `∂x−i∂y=2∂_z` | equal | none |
| 15 | `α∧barStar β=⟨β,α⟩vol` (l. 616, 1197) | `⟨u,v⟩=B(ū,v)` | `B(α,β̄)` / `B(β̄,α)` | equal | none |
| 16 | `∂̄*=−*∂*` types (l. 1197) | `(p,q+1)` | `→(n−q−1,n−p)→(n−q,n−p)→(p,q)` | consistent | none |
| 17 | Hopf `h^(1,1)=0`, `h^(0,1)=1` (l. 1523–1530) | weights | `z^a dz_j↦2^(\|a\|+1)≥2`; weight 1 only on constants | `H¹(ℤ,𝒪)≅ℂ` | none |
| 18 | Hopf diamond vs Betti (l. 1531–1532) | S¹×S³ | `b₁=0+1=1`, `b₂=0`, `b₃=1` | equal | none |
| 19 | Iwasawa `h¹⁰=3, h⁰¹=2, b₁=4` (l. 1545) | `angella-iwasawa` l. 918, 920 | `4; 3, 2` / `4; 3, 2`; `3+2≠4` | equal | R17 |
| 20 | ℂP¹ Serre (l. 1454–1457) | `K=O(−2)` | `H¹(O(−1))≅H⁰(O(−1))*=0` / 0 | equal | none |
| 21 | `h⁰(O(k))=C(n+k,n)` (l. 1450–1452), recomputed | n=1, k=2 | `{x²,xy,y²}`=3 / `C(3,1)=3` | equal | none |
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
| 33 | K8 central reduction (l. 1570–1576) | complex Heisenberg, Γ Gaussian | `A=Z≅ℂ`, fibre `ℂ/ℤ[i]`, dims 1+2=3 | matches Sakane l. 106–115 | R17 |
| 34 | Newlander–Nirenberg (headline), re-run | converse pinned (`nijenhuis_ofComplexManifold`) | elaborates, exit 0 | statable | R05 |
| 35 | Weierstrass preparation (headline), re-run | `f=w²+zw`; d=0 | `u=1, a₁=z, a₀=0`; d=0 ⇒ `u=f` | statable | R05 |
| 36 | Hartogs (headline), re-run | n=1 `1/z`; shell | excluded by `2≤n`; by connectedness | statable | R05 |
| 37 | Parameter Cauchy–Green (l. 214–225) | `∂̄_z T(χf)=χf` | holomorphic on `ℂ∖tsupport χ` ∀p,q | holds | R17 |
| 38 | K2 solver tail bound (l. 236–237) | `A_jh=Σw_k h(ζ_k)g_k` | fixed nodes preserve q-holomorphy | holds | none |
| 39 | `realified_isManifold_analytic` (Lean 35), re-run | m=∞, n=ω, `[FiniteDimensional ℂ E]` | one term `restrictScalars_of_ne_zero ω (by simp) h`, exit 0 | padding | R14 |
| 40 | Riemann surface `b₁=2g` (l. 1484–1485) | torus; ℂP¹ | `2=2`; `0=0` | equal | R02 |
| 41 | `BundleSobolev` carrier (Lean 369–372), signature re-checked | `localize=0` | `{v \| ∀i, (v i).toDistr=0}={0}` | vacuous | R01 |
| 42 | `complexBesselSymbol` (Lean 466, 484) | `z=s`; `z=it` | `(1+\|ζ\|²)^(s/2)`; modulus 1 | holds | R14 |
| 43 | CharacteristicClasses l. 225–226: Chern form of O(1) is `+ω_FS` | K7 `Θ=−2πiω_FS` | `(i/2π)·(−2πi)ω_FS=+ω_FS` / `+ω_FS` | equal | none |
| 44 | CharacteristicClasses l. 802: `h` on ℂP¹ pairs to `+1`; K7.2 `⟨u,[ℂP¹]⟩=+1` (l. 1466) | row 6 | `∫_(ℂP¹)c₁(O(1))=∫ω_FS=1` / `+1` | equal; same orientation | none |
| 45 | K8 `d_r:E_r^(p,q)→E_r^(p+r,q−r+1)` (l. 1540) vs AlgebraicTopology Stage 5.0 decreasing cochain convention, deg=p+q (AT l. 1184–1186), recomputed | column filtration `F^p=⊕_(p′≥p)A^(p′,•)`, r=0,1 | `d₀=∂̄:(p,q)→(p,q+1)`, `d₁=∂:(p,q)→(p+1,q)` / formula gives `(p,q+1)`, `(p+1,q)`; degree `p+q→p+q+1` both | consistent | none |
| 46 | K7 `H*(ℂPⁿ;ℤ)=ℤ[u]/(u^(n+1))`, \|u\|=2 (l. 1463) vs AlgebraicTopology Stage 7 `χ(ℂPⁿ)=n+1` (AT l. 2187), recomputed | n=0; n=2 | `b=(1)`: χ=1 / 0+1; `b=(1,0,1,0,1)`: χ=3 / 2+1 | equal | none |
| 47 | K7.2 cell count (l. 1459–1460) vs pinned `nat_card_cell_cwComplex` (`ComplexProjective.lean` 44–47) | n=1 | cells in dims 0, 2 (ℂP¹=S²) / one cell per even m ≤ 2 | same object, already pinned | R07 |

## Not verifiable

- Webster, Math. Z. 201 (1989), pp. 303–316 (`webster-nn`, uncertified, paywalled): the K1 Newlander–Nirenberg route. Cited by locator only.
- Griffiths–Harris, Ch. 0 §§1–2 (`griffiths-harris`, uncertified): K3's local rings and parametrization.
- Wells (`wells-dacm`, uncertified): K5b. The README gives no chapter (R17).
- Raghunathan, Thm 1.13 p. 23 and Cor. 1 p. 31 (`raghunathan-discrete-subgroups`, uncertified): taken from `sakane-parallelisable` lines 112–113, not read.
- Hörmander, ALPDO I, Thms 2.3.4–2.3.5 (`hormander-alpdo1`, uncertified): proposed in R17 from the manifest, not read.

## Source issues

- none
