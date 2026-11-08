# Review of ComplexKahlerGeometry (pull request #1854 at c07dda7)

**Verdict:** needs changes

This is an incremental re-review of `TauCetiRoadmap/ComplexKahlerGeometry/` since c9c60d0. The folder is byte-identical at c07dda7 and c9c60d0: `git diff c9c60d0 c07dda7` touches only `TauCetiRoadmap/CharacteristicClasses/README.md` and `Suggested.lean`. Against main (c58403c) the folder still differs by the same three README lines (609, 1538, 1613). None of the 19 findings of the previous review is repaired. Each is written again below, with its witness re-checked at this head, on main c58403c and at the open heads. The CharacteristicClasses change was checked wherever this roadmap relies on it, and it introduces no new defect here. Pins are unchanged: Tau Ceti 2fd255d, Mathlib 1b1ccf4.

**Gate.** I re-ran it and got the same counts as the worker: blob=29, sorry-data=20, imports=1, mathlib-subimports=5, no-import-mathlib=1, statement-hygiene=1, dropped=14, FAIL. My run reports outside-folder=34 because it does not know the pull request's own folders. With those folders excluded, `git diff --stat origin/main...HEAD` lists exactly the worker's 2 files.

**Dependency check.** Output: `depcheck: 237 roadmaps, 2332 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. R03 and R04 are two-way supplies that this check does not see.

**Elaboration.** `lake env lean TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` exits 0 with 37 `sorry` warnings and no other diagnostic.

## R01 (P1) — Twenty sorried data declarations in `Suggested.lean`

Carried from the previous review's R01; the text is unchanged.

**Location.** `TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` lines 77–79, 139–174, 224–236, 287–314, 348–357, 369–375, 397–402, 428–437 and 489–492 (gate `sorry-data`, 20 hits). Line 77 reads: "def nijenhuisTensor (J : TauCeti.SmoothAlmostComplexStructure I M) : (x : M) → TangentSpace I x →L[ℝ] … := by sorry".

**Claim.** The following carry sorried data:
- the `RealBundleTest`/`BundleTest` topology, `ContinuousSMul` and `LocallyConvexSpace` instances;
- `nijenhuisTensor`, `realBundleTestOfChart`, `bundleTestOfChart`, `realDistributionComplexify`, `bundleDistributionConjugation` and `complexBesselToL2`;
- the fields of the two submodules, of `bundleTestSmul`, of `bundleTestRestrictScalars` and of `bundleSobolevToDistribution`.

`IsKahler`, `BundleDistribution`, `BundleSobolev` and every `*_apply`, `*_continuous_iff` and `complexBesselToL2_*` theorem mention one of them.

I re-ran `#check @` on the 61 declarations at this head:
- `IsKahler` and `nijenhuisTensor` still elaborate without `[CompleteSpace E] [FiniteDimensional ℝ E] [T2Space M]`.
- `BundleSobolev` still takes an arbitrary `localize : Fin q → … →L[ℂ] …`.

**Witness.** With `localize = 0`, the carrier at line 371 becomes `{v | ∃ u, ∀ i, (v i).toDistr = 0}`. Since `toDistr` is injective, that set is `{0}`. So `BundleSobolev … 0 s = ⊥` for every bundle.

**Repair.** Delete every sorried `def`, `abbrev` and `instance`, and every declaration that mentions one; the README keeps them as K5a targets. If `IsKahler` is kept, define it as `form.IsClosed ∧ form.Compatible J ∧ J.nijenhuis = 0`, with `[FiniteDimensional ℝ E]` in its own signature.

## R02 (P1) — K7.2 consumes SurfaceTopology and PlanarTopology, which may not be suppliers

Carried from the previous review's R02.

**Location.** `README.md` line 1493: "Consume [SurfaceTopology Layers 2–3](https://github.com/mccorvie/…)". Lines 1488, 1492, 1495–1496, 1505–1506 and 1674–1675 have the same problem (gate `dropped`, 14 hits).

**Claim.** Both roadmaps are on the project's never-a-supplier list. Four objects of K7.2 therefore have no owner: the surface adapter, the classification homeomorphism, the standard CW model and the polygon cup matrix.

**Witness.** Main c58403c has no `TauCetiRoadmap/SurfaceTopology` or `TauCetiRoadmap/PlanarTopology`. At the pin, `TauCeti/KnotTheory/Cobordism.lean` line 58 says that the classification of compact surfaces "is not proved here".

**Repair.**
- Delete lines 1487–1506 and 1673–1675.
- Keep the `b₁=2g` Hodge comparison at line 1485.
- Take `H²(Σ;ℤ)≃ℤ` and unimodularity of the integral cup pairing from AlgebraicTopology Stage 6.4 Poincaré duality.
- Obtain the standard symplectic ℤ-basis from the normal form of unimodular alternating forms over ℤ.

## R03 (P1) — Two-way supply with RealAnalyticGeometry

Carried from the previous review's R03.

**Location.** `README.md`:
- lines 424–431: "R1 local finiteness and compactness of V … RealAnalyticGeometry R5 supplies the global compatible";
- line 1337: "Consume [RealAnalyticGeometry R0–R5]";
- lines 1688–1692: "results then supply K3's finite regular-piece partition".

**Claim.** RealAnalyticGeometry consumes K3 and K4 of this roadmap, and K3 and K6.1 consume its R1 and R5. Neither roadmap can come first.

**Witness.** In `TauCetiRoadmap/RealAnalyticGeometry/README.md` on main c58403c:
- line 173: "The proof uses CK K3's convergent Weierstrass preparation";
- line 736: "supplied by CK K4";
- line 1019: "the provider consumed by ComplexKahlerGeometry K6".

**Repair.**
1. In K3, prove finiteness of the regular-piece partition from local parametrization and compactness, without R1.
2. Move the K6.1 analytic-cycle triangulation and integral fundamental class (line 1331 to the end of K6.1) to "ComplexKahlerGeometry, Part II", placed after RealAnalyticGeometry.
3. Rewrite lines 1688–1692 to say only that RealAnalyticGeometry consumes K2–K4.

## R04 (P1) — Two-way supply with PseudodifferentialOperators

Carried from the previous review's R04.

**Location.** `README.md` lines 45–47: "[PseudodifferentialOperators P1.0] supplies differential-operator carriers, jets, symbols and formal density adjoints after K5a's initial density-line construction". Lines 575–577 and 1650–1652 have the same problem.

**Claim.** PseudodifferentialOperators, at merge-order position 13, lists this roadmap as a supplier, and K5a consumes its P1.0.

**Witness.** In `TauCetiRoadmap/PseudodifferentialOperators/README.md` on main c58403c:
- line 91: "**From TauCetiRoadmap.ComplexKahlerGeometry.** [K5a] supplies bundle";
- line 529: "*Needs:* P1.0 differential operators; ComplexKahlerGeometry K5a's smooth-section Fréchet".

**Repair.** K5a uses no complex structure. Move it into PseudodifferentialOperators, or into a new roadmap placed before it, and have K5b consume it from there. Both READMEs must then name the same owner.

## R05 (P2) — No headline theorem is stated, and the docstring names none as unstatable

Carried from the previous review's R05.

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

**Witness.** I re-ran the block below at the pins in a scratch file importing `Mathlib` and five `TauCeti.*` modules (`…Complex.AlmostComplexStructure`, `…Complex.Analytic`, `…DifferentialForm.AlmostComplexType`, `…Dolbeault.Basic`, `…Symplectic.Manifold.JHolomorphic`/`Nijenhuis`). It exits 0 with four `sorry` warnings.

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
2. Either state the cohomological headlines on quotients of submodules of `SmoothForm`, or name them in the docstring as unstatable, with the missing carrier.
3. Rewrite the docstring as "<title>: target signatures".

## R06 (P2) — The pinned Tau Ceti already owns objects that K1, K2, K3, K5a and K7.1 plan to build

Carried from the previous review's R06. The pins are unchanged, and the declarations were re-opened at the same lines.

**Location.** `README.md`:
- K1: lines 113–115, 134–158 and 164–179 ("equips the generic DG carrier `SmoothForm I M F k` with its natural `Module ℂ` action");
- K2: lines 195–197;
- K3: lines 298–374;
- K5a: lines 596–606 and 1083;
- K7.1: lines 1415–1431.

`Suggested.lean` declares `dbarFunction*` and `nijenhuis*`.

**Claim.** Each object then has two owners.

**Witness.** In Tau Ceti 2fd255d:
- `Geometry/Symplectic/Manifold/Nijenhuis.lean`: `nijenhuis` (158), `nijenhuis_apply` (170), `nijenhuis_antisymm` (207);
- `Geometry/Manifold/DifferentialForm/Dolbeault/Basic.lean`: `delBar` (95), `delBar_apply_apply` (366), `delBar_apply_eq_zero_iff` (378), `delBar_delBar_apply` (405);
- `Geometry/Manifold/Complex/StructureSheaf/Basic.lean:68`: `holomorphicStructureSheaf`.

**Repair.** Add a `### From Tau Ceti` contract naming each of these, with its file:
- the three above;
- `SmoothForm.instModule`, `mextDerivₗ_smul`, `mpullback_smul` and `mapCoeff_conj_smul` (`MapCoeff.lean` 273–322);
- `IsLocalDiffeomorphAt.isOrientationPreservingAt_complexManifoldOrientation` (`Complex/Orientation.lean:359`);
- `exists_jointImplicitFunction_of_eventually_mdifferentiableAt` (`Complex/ImplicitFunction.lean:52`);
- `isInvolutiveComplexDistribution_eigenspace_I_iff` (`AlmostComplex/Eigenbundle.lean:96`);
- `SmoothForm.IsOfType` and `typeProjection` (`AlmostComplexType.lean` 201, 282);
- `IsManifold.restrictScalars_of_ne_zero` (`Complex/Analytic.lean:115`);
- `isUnit_stalk_iff` and `isFractionRing_meromorphicGerms` (`StructureSheaf/`);
- `hodgeStar`, `hodgeStar_hodgeStar` and `codifferential` (`Riemannian/`);
- the projectivization instances and charts (`Topology/Algebra/Projectivization.lean`, `Instances/Projectivization.lean`).

Then cut the construction sentences down to what the pin lacks, and delete these declarations from `Suggested.lean`: `dbarFunction`, `dbarFunction_apply_J`, `dbarFunction_eq_zero_iff`, `nijenhuisOnFields`, `nijenhuisTensor`, `nijenhuisTensor_onFields` and `nijenhuisTensor_skew`.

## R07 (P2) — K7.2 builds the CW structure of ℂPⁿ, which AlgebraicTopology Stage 4.6 owns in this same pull request

Carried from the previous review's R07. The AlgebraicTopology folder is unchanged since c9c60d0.

**Location.** `README.md` lines 1458–1463: "construct on this same carrier Mathlib's `CWComplex` structure with one cell in each even dimension 0,2,…,2n … The CW construction uses only K7.1 and AlgebraicTopology Stage 4". Also lines 1668–1669.

**Claim.** The CW structure has two owners.

**Witness.** `TauCetiRoadmap/AlgebraicTopology/README.md` at this head, lines 1037–1040: Stage 4.6 owns the homeomorphism of `TauCeti.ComplexProjectiveSpace` with `Projectivization ℂ (Fin (n+1) → ℂ)` "and the transport of the CW structure … ComplexKahlerGeometry K7 consumes that topology and this cell structure". Line 2172 says the same.

**Repair.** Replace the construction sentence with "Consume AlgebraicTopology Stage 4.6's CW structure on `Projectivization ℂ (Fin (n+1) → ℂ)`". Keep only:
- the cellular/cup calculation;
- `⟨u,[ℂP¹]⟩=+1`;
- the de Rham/Chern–Weil comparison.

Update lines 1668–1669 to match.

## R08 (P2) — "Order and references" re-plans GlobalHolomorphicFunctions

Carried from the previous review's R08.

**Location.** `README.md` lines 1620–1637: "is a native-only preparatory phase before GH0; GH2's global prescribed-singularity patching follows GH0. Separate these phases explicitly."

**Claim.** The paragraph orders and specifies another roadmap's own targets, including "the global one-variable provider order" at line 1637.

**Witness.** At the open head of GlobalHolomorphicFunctions (c42ca426):
- Layer 4.1 (line 1261) owns the local Laurent decomposition;
- Layer 2.5 (line 984) already names "CKG K2" as consumer of `exists_finite_rank_runge_operator`;
- line 1994 names K2 as consumer of Layer 0.3.

**Repair.** Delete lines 1620–1637 and cite by section:
- Layer 0.3 (line 430);
- Layer 2.5 (930);
- Layer 4.1 (1261);
- Layer 7.2 (1829).

## R09 (P3) — AlgebraicTopology names that this pull request drops, and a reversed 8.12 clause

Carried from the previous review's R09.

**Location.** `README.md`:
- line 1352: "AT4.7's `simplicialRealizationCW`";
- line 1372: "AT Stage4's `cwSubcomplexNeighborhoods`";
- line 1475: "AT 8.12 consumes that later comparison".

**Claim.** Neither backticked name occurs in AlgebraicTopology's README or `Suggested.lean` at this head. The edge in the 8.12 clause runs the other way.

**Witness.** At this head:
- AlgebraicTopology README line 958 reads "Own the subcomplex neighbourhoods" and line 1064 reads "Own the realization CW structure", with neither name.
- CharacteristicClasses README lines 64–70 say that C1.5a consumes "AT8.12's native circle comparison", and that "C1.5's comparison portion … consume[s] no … AT8.12".

**Repair.** Cite "AlgebraicTopology Stage 4.7's realization CW structure" and "Stage 4.5's subcomplex neighbourhoods", and delete the 8.12 clause at line 1475.

## R10 (P3) — K1 asserts a supply that LieGroupoidsPoisson denies

Carried from the previous review's R10.

**Location.** `README.md` lines 190–191: "LieGroupoidsPoisson consumes the eigensubbundle/involutivity dictionary and builds their complex Lie algebroid structures."

**Claim.** The sentence adds a reverse edge to a supplier of K8.

**Witness.** `TauCetiRoadmap/LieGroupoidsPoisson/README.md` on main c58403c, lines 85–86: ComplexKahlerGeometry "is a consumer of this roadmap (its K8 consumes §G1.3a) and is therefore never a supplier here."

**Repair.** Delete the sentence. The involutivity equivalence is already pinned (R06).

## R11 (P3) — Pull-request numbers and commit-pinned links as supplier citations

Carried from the previous review's R11.

**Location.**
- 21 occurrences of "#279" and 3 of "#280", for example line 98: "Consume #279 Milestones 1 and 2".
- 29 `github.com/TauCetiProject/TauCetiRoadmap/blob/<sha>/…` links (gate `blob`).
- 8 fork links (`github.com/mccorvie/…`, `github.com/Paul-Lez/…`).

**Claim.** A citation names a roadmap and a section, never a pull request or a commit.

**Witness.** `TauCetiRoadmap/ComplexManifolds/README.md` on main c58403c, line 197: "## Milestone 2: the canonical real orientation". ComplexTori is on main with its Milestone 1.

**Repair.**
- Replace "#279" by "ComplexManifolds" and "#280" by "ComplexTori".
- Replace each blob or fork link by the roadmap name and section, with a relative link for roadmaps on main.

## R12 (P3) — Citation labels that do not resolve in the suppliers' numbering

Carried from the previous review's R12.

**Location.**
- "VariationalMethods V2–V5.2", "V5.1", "V2.2–V2.4", "V3–V4", "V3.1", "V5.3" (lines 572, 1049, 1053, 1059, 1063, 1065, 1153, 1653–1657).
- `CompactFormPair.operator` (line 1050).
- "GH5.1" for two-form exactness (lines 35, 981).
- "PDE Lane A.3"/"Lane B.9" (lines 571, 813, 825, 1652).
- "LieGroupoidsPoisson G1.3" (lines 1551, 1598, 1683).

**Claim.** None of these labels exists in the cited roadmap.

**Witness.**
- VariationalMethods at its open head numbers its sections 1.1–5.3 and has 0 `V<n>.<n>` labels. Its line 1063 says that UO-D06's `closedFormOperator` "is the operator".
- GH5.1 is Layer 7.4. Exactness is in Layer 7.2.
- PDE has "1.3 … (A3)" and "2.2 … (B9)".
- LieGroupoidsPoisson's target is §G1.3a.

**Repair.**
- Cite the VariationalMethods sections as §2.2–§5.3.
- Replace `CompactFormPair.operator` with "UO-D06's `closedFormOperator` through VariationalMethods §5.1 and `CompactFormPair.operatorDomainV`".
- Cite GlobalHolomorphicFunctions Layer 7.2, PDE §1.3 (A3) and §2.2 (B9), and LieGroupoidsPoisson §G1.3a.

## R13 (P3) — Import header

Carried from the previous review's R13.

**Location.** `Suggested.lean` lines 1–9: "import Mathlib.Analysis.Complex.Basic" … "import TauCetiRoadmap.DifferentialGeometry.Suggested" (gate `imports`, `mathlib-subimports` ×5, `no-import-mathlib`).

**Claim.** The file has no `import Mathlib`, has five submodule imports, and imports another roadmap's module.

**Witness.** Line 8 is used only by `DensityFiber` (lines 120–121), an abbreviation of DifferentialGeometry's `Density`.

**Repair.** Write `import Mathlib` followed only by the `TauCeti.*` modules used. Delete `DensityFiber` and cite DifferentialGeometry 5.5 in the README.

## R14 (P3) — Padding in `Suggested.lean`

Carried from the previous review's R14.

**Location and claim.** Each of these restates a definition or a pinned lemma, or closes in one step:
- `realified_isManifold_analytic` (35);
- `memSobolev_iff_bundled` (106);
- `dbarFunction_apply_J` and `dbarFunction_eq_zero_iff` (55, 61);
- `nijenhuisTensor_skew` (88);
- `complexBesselDistributionMultiplier_real` (484);
- `bundleTest_smul_apply` (275), `bundleTestRestrictScalars_apply` (360) and `bundleSobolevLocalizations_apply` (393);
- `bundleSobolev_norm_sq` (383), `bundleSobolevComplete` (413) and `complexBesselToL2_norm` (503).

**Witness.** I re-ran the probe at the pins. The term `IsManifold.restrictScalars_of_ne_zero ω (by simp) h` closes `IsManifold 𝓘(ℝ, E) ω M` from `[h : IsManifold 𝓘(ℂ, E) ∞ M]` with exit 0. `complexBesselToL2_norm` (line 503) is already proved by the single term `(complexBesselToL2 n G s t).norm_map u`.

**Repair.** Delete them from `Suggested.lean`. The README keeps the statements as targets or Checks.

## R15 (P3) — `bundleSobolevToDistribution` chooses its datum

Carried from the previous review's R15.

**Location.** `Suggested.lean` line 400: "toFun u := Classical.choose u.2" (gate `statement-hygiene`, P3).

**Claim.** The map is defined by an unspecified choice, and its `hinj` argument is unused in the body.

**Witness.** The gate reports this as a statement-hygiene hit at line 400.

**Repair.** The deletion in R01 removes it. As a README target, define it as the inverse of the injective localization on its range.

## R16 (P3) — README shape, Checks and process wording

Carried from the previous review's R16.

**Location.**
- Line 1 reads "# Complex manifolds, Dolbeault theory, and Kähler geometry".
- The `##` headings are only "Conventions and suppliers", K1–K8 and "Order and references".
- Line 67 says "during its migration"; line 1249 and `Suggested.lean` line 21 say "prototype(s)".
- Lines 120–121 and 229 contain `\bar`/`\setminus`.

**Claim.** The README does not follow the house form.

**Witness.** The README has 0 `**Checks.**` lists, 0 `*Needs:*` lines, no `### Examples`/`### Dependencies` and no `**Summary.**`. `DensityBundle M` (line 626) and `RealBundleSobolev V 0` (line 785) are backticked but not declared.

**Repair.**
- Restructure under: `# Roadmap: …`, Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, and `## Layer k` sections each with `### Examples` and `### Dependencies`.
- Add `*Needs:*` lines and at least three Checks per definition. Candidates from the table below: rows 14, 17 and 23.
- Write the formulas in Unicode, drop the process words, and either unbacktick or declare the names.

## R17 (P3) — Missing locators, including most of the seeded sample

Carried from the previous review's R17.

**Location.** These targets carry no theorem, section or page locator:
- Parameter Cauchy–Green (214–225);
- K3.HolomorphicStalk (317–330) and K3.MeromorphicGermField (332–374);
- K4.ComponentwiseFiniteRankAssembly (517–535);
- K5a (570 ff.), K5a.DistributionLocalStructure (658–716), K5a.SmoothSectionMontel (726) and K5a.ComponentwiseCompact (1086–1166);
- K5b, K5b.0 and K5b.1 (1168–1241);
- K7.1 (1407–1442) and K7.2 (1444–1517).

The reference list (1694–1703) gives Wells and Griffiths–Harris without chapter or theorem.

**Claim.** Every theorem needs a locator at the claim. K8.NilpotentCentralReduction omits the Malcev input it owns, and the Iwasawa numbers (line 1545) are uncited.

**Witness.** `sakane-parallelisable` lines 112–113 rest the lattice step on Raghunathan, p. 31 Corollary 1 and p. 23 Theorem 1.13. `angella-iwasawa` lines 917–920 (Appendix A) give `b₁=4`, `h^(1,0)=3` and `h^(0,1)=2`.

**Repair.**
- Cite Raghunathan Thm 1.13 (p. 23) and Cor. 1 (p. 31) in K8.
- Cite Angella Appendix A at line 1545.
- Add Demailly Ch. II (2.1), (2.7), (2.10), (4.19) and (4.22) (`demailly-agbook` lines 3794, 3872, 3931, 4613, 4742) in K3.
- Give a chapter and theorem for every use of Wells and Griffiths–Harris, and a locator for each remaining sampled target.

## R18 (P3) — Other open pull requests change this folder, with no consistent order

Carried from the previous review's R18.

**Location.** This pull request's folder diff (`README.md` lines 609, 1538, 1613) and its merge-order paragraph: "#1101 → #1807 → this pull request … #1808 is independent of this pull request".

**Claim.**
- #1807, which is to merge first, rewrites this folder (2304-line README, 320-line `Suggested.lean`) and already makes the K8 "Stage 5.0" change (its README lines 2125 and 2169).
- #1808, described as independent, also rewrites the folder (2535 lines).
- #1234 conflicts with this head in `README.md`, and #1398 conflicts in `Suggested.lean`.

**Witness.** `roadmaps show ComplexKahlerGeometry --pr 1807` prints 2304 README lines, and its line 2125 reads "Consume AlgebraicTopology Stage 5.0's generic filtered-complex spectral sequence". The overlap report lists the #1234 and #1398 conflicts.

**Repair.** Drop this folder's three-line edit, because #1807 carries it, or rebase the folder on #1807's head. State the order relative to #1808, #1234 and #1398.

## R19 (P3) — Edits outside the folders named as this pull request's own

Carried from the previous review's R19.

**Location.** `Completed/ArithmeticDirichletSeries/README.md` (2 lines) and `TauCetiRoadmap/SymplecticGeometry/README.md` (6 lines).

**Claim.** Neither folder is among the folders this pull request's review covers.

**Witness.** `git diff --stat origin/main...HEAD`, with the 17 named folders excluded, lists exactly these two files (4 insertions, 4 deletions).

**Repair.** Either name both folders as this pull request's own so that they are reviewed, or move the two edits to their own pull request.

## Previous findings

- R01 — not repaired: `Suggested.lean` line 77–79: "def nijenhuisTensor (J : TauCeti.SmoothAlmostComplexStructure I M) : (x : M) → TangentSpace I x →L[ℝ] … := by sorry"; gate `sorry-data` still 20.
- R02 — not repaired: `README.md` line 1493: "Consume [SurfaceTopology Layers 2–3](https://github.com/mccorvie/…)"; gate `dropped` still 14.
- R03 — not repaired: `README.md` line 1337: "Consume [RealAnalyticGeometry R0–R5]"; line 430: "RealAnalyticGeometry R5 supplies the global compatible".
- R04 — not repaired: `README.md` line 45: "[PseudodifferentialOperators P1.0] supplies differential-operator carriers, jets, symbols and formal density adjoints after K5a's initial density-line construction".
- R05 — not repaired: `Suggested.lean` line 11: "These are suggested forms, not an exhaustive checklist."; no headline stated.
- R06 — not repaired: `README.md` line 134: "K1 also equips the generic DG carrier `SmoothForm I M F k` with its natural"; `dbarFunction`/`nijenhuisTensor` still declared.
- R07 — not repaired: `README.md` lines 1458–1460: "construct on this same carrier Mathlib's `CWComplex` structure with one cell in each even dimension 0,2,…,2n".
- R08 — not repaired: `README.md` lines 1620–1622: "is a native-only preparatory phase before GH0 … Separate these phases explicitly."
- R09 — not repaired: `README.md` line 1352 "AT4.7's `simplicialRealizationCW`", line 1372 "`cwSubcomplexNeighborhoods`", line 1475 "AT 8.12 consumes that later comparison".
- R10 — not repaired: `README.md` lines 190–191: "LieGroupoidsPoisson consumes the eigensubbundle/involutivity dictionary and builds their complex Lie algebroid structures."
- R11 — not repaired: `README.md` line 98: "Consume #279 Milestones 1 and 2"; gate `blob` still 29.
- R12 — not repaired: `README.md` line 1049: "[VariationalMethods V5.1](https://github.com/…)"; line 1050 "`CompactFormPair.operator`".
- R13 — not repaired: `Suggested.lean` line 1 "import Mathlib.Analysis.Complex.Basic", line 8 "import TauCetiRoadmap.DifferentialGeometry.Suggested".
- R14 — not repaired: `Suggested.lean` line 35: "theorem realified_isManifold_analytic … : IsManifold 𝓘(ℝ, E) ω M := by sorry".
- R15 — not repaired: `Suggested.lean` line 400: "toFun u := Classical.choose u.2".
- R16 — not repaired: `README.md` line 1: "# Complex manifolds, Dolbeault theory, and Kähler geometry"; 0 `**Checks.**`, 0 `*Needs:*`.
- R17 — not repaired: `README.md` line 214: "**Parameter Cauchy–Green.** Prove the following lemma for this solver." (no locator).
- R18 — not repaired: folder diff still lines 609, 1538, 1613; merge-order paragraph unchanged ("#1808 is independent of this pull request").
- R19 — not repaired: `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md` still changed.

## Verified sound

**Change since c9c60d0.** The folder diff is empty, and against main the folder still differs by three lines. The only files changed elsewhere are in CharacteristicClasses, one of this pull request's own folders. None of its changed lines mentions CKG, K4, K7, C1.5 or 8.12. At this head, CharacteristicClasses still consumes "ComplexKahlerGeometry K4" and "K7.1/K7.2" (lines 109–117), which matches this README's line 1473 ("CharacteristicClasses C1.5 consumes these finite carrier inclusions"). The direction is one-way, CKG → CC. Its O(1) sign (line 225–226) agrees with K7; see rows 43–44.

**Gate, build and signatures.**
- Gate re-run: same text counts as the worker's.
- Elaboration: exit 0, 37 `sorry` warnings.
- `#check @` of 61 declarations in one scratch file, run from the worktree: exit 0. Changes against the README are only those of R01 (`IsKahler`/`nijenhuisTensor` binders, free `localize`).
- Headline probe: four theorems and one padding term, exit 0 (R05, R14).
- Depcheck: `depcheck: 237 roadmaps, 2332 edges, 0 problem(s)`.

**Library declarations re-opened at the pins.**
- Tau Ceti:
  - `Geometry/Symplectic/Manifold/Nijenhuis.lean` 158, 170, 207–237;
  - `Geometry/Manifold/DifferentialForm/Dolbeault/Basic.lean` 69–121, 366, 378, 405;
  - `Geometry/Manifold/DifferentialForm/AlmostComplexType.lean` 86–201;
  - `Geometry/Manifold/Complex/AlmostComplexStructure.lean` 65–80, 188–221 (`ofComplexManifold`; `nijenhuis_ofComplexManifold` at 221);
  - `Geometry/Manifold/Complex/Analytic.lean` 100–125;
  - `Geometry/Manifold/Complex/StructureSheaf/Basic.lean` 68;
  - `Geometry/Symplectic/Manifold/JHolomorphic.lean` 67–184;
  - `KnotTheory/Cobordism.lean` 56–58.
- Mathlib: nothing newly relied on. The pins are unchanged, so the previous review's Mathlib list stands (`BesselPotentialSpace.lean` 77, 250, 299; `ProjectiveLine.lean` 84; `LocallyConvex/Montel.lean` 46, 104; `ExteriorPower/HodgeStar.lean` 48).

**Cross-roadmap citations re-resolved** (main c58403c unless stated):
- RealAnalyticGeometry lines 173, 736, 1019;
- PseudodifferentialOperators 91, 529;
- LieGroupoidsPoisson 18, 85–86;
- ComplexManifolds 197;
- PDE 769 (A3) and 1148 (B9).
- AlgebraicTopology at this head: 129, 958, 1026–1040, 1064, 1178, 2172, 2788.
- CharacteristicClasses at this head: 55–117, 222–226, 760–822.
- GlobalHolomorphicFunctions at its open head c42ca426: Layer 0.3 (430), 2.5 (930, 984), 4.1 (1261), 7.2 (1829), 7.4 (1953), and consumer lines 44, 1881, 1963, 1994.
- VariationalMethods at its open head: §1.1–§5.3, lines 845, 1063.

That is 32 cited locations resolved. Both resolver leads (V5.1, V2.2) are confirmed in R12.

**Merge order.** IndexTheory (10), PseudodifferentialOperators (13), ComplexComparisonPartII (39) and FormalConnectionsOpers (40) list this roadmap as a supplier, while it consumes GlobalHolomorphicFunctions (96) and LieGroupoidsPoisson (153). Those upward edges belong to the consumers' own reviews, except PseudodifferentialOperators (R04). ComplexKahlerGeometry and CharacteristicClasses are not in the merge order.

**Seeded sample.** No sampled target falls in changed text. The previous review's results are carried forward:
- Parameter Cauchy–Green: GH Layer 0.3 exists at its head, line 430.
- K3.HolomorphicStalk and K3.MeromorphicGermField: R06, R17.
- K4.ComponentwiseFiniteRankAssembly and the K5a items: R17.
- K5b, K5b.0, K5b.1: Wells, no chapter (R17).
- K7.1: Mathlib `OnePoint.equivProjectivization`.
- K7.2: R02, R07, R09.
- K8.NilpotentCentralReduction: Sakane Theorem 1, stated at `sakane-parallelisable` lines 46 and 102, with the central reduction at lines 106–115.

Re-read for this review:
- `sakane-parallelisable` lines 44–48 and 100–116;
- `demailly-agbook` line 1288 ((3.29), extraction page 28) and line 4842 ((4.29) Cartan);
- `angella-iwasawa` lines 915–921.

All three agree with the README's use.

**Ownership against open roadmaps (closest in vocabulary).** ComplexComparisonPartII, DifferentialGeometry, CalibratedGeometry, RelativisticQuantumFieldTheory and GlobalHolomorphicFunctions are the same set as the previous review found. This review checked GlobalHolomorphicFunctions' head again (R08). The overlap report lists no id that this roadmap cites and an open pull request drops, and no id that only a revision defines.

**Adversarial table.** Rows 1–42 are carried from the previous review (same row numbers), because no statement changed. "Re-run" marks a probe re-elaborated at the pins in this review, and "recomputed" a value recomputed by hand in this review. Rows 43–44 are new: they cross-check this roadmap's conventions against CharacteristicClasses at this head.

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
| 10 | `dbarFunction_apply_J` | `J²=−1` | `(df(Jv)−i df v)/2` / `−i(df v+i df(Jv))/2` | equal (probe) | R14 |
| 11 | `*²=(−1)^(k(m−k))`, `d*` sign (l. 601, 1083) | k=1, m=2 | `−1` = rotation²; same sign as pinned `codifferential` | equal | R06 |
| 12 | Hodge–Riemann sign (l. 1284) | n=1, α=dz | `i∫dz∧dz̄=2·area>0` | positive | none |
| 13 | `[Λ,L]=n−k` (l. 1254) | n=1, k=0 | `1−0` / `1` | equal | none |
| 14 | `\|dz_j\|²=2(H⁻¹)_jj`, `dz♯=2∂_z` (l. 1181–1183) | H=I | `\|dx\|²+\|dy\|²=2`; `∂x−i∂y=2∂_z` | equal | none |
| 15 | `α∧barStar β=⟨β,α⟩vol` (l. 616, 1197) | `⟨u,v⟩=B(ū,v)` | `B(α,β̄)` / `B(β̄,α)` | equal | none |
| 16 | `∂̄*=−*∂*` types (l. 1197) | `(p,q+1)` | `→(n−q−1,n−p)→(n−q,n−p)→(p,q)` | consistent | none |
| 17 | Hopf `h^(1,1)=0`, `h^(0,1)=1` (l. 1523–1530) | weights | `z^a dz_j↦2^(\|a\|+1)≥2`; weight 1 only on constants | `H¹(ℤ,𝒪)≅ℂ` | none |
| 18 | Hopf diamond vs Betti (l. 1531–1532) | S¹×S³ | `b₁=0+1=1`, `b₂=0`, `b₃=1` | equal | none |
| 19 | Iwasawa `h¹⁰=3, h⁰¹=2, b₁=4` (l. 1545), recomputed | `angella-iwasawa` l. 918, 920 | `4; 3, 2` / `4; 3, 2`; `3+2≠4` | equal | R17 |
| 20 | ℂP¹ Serre (l. 1454–1457) | `K=O(−2)` | `H¹(O(−1))≅H⁰(O(−1))*=0` / 0 | equal | none |
| 21 | `h⁰(O(k))=C(n+k,n)` (l. 1450–1452) | n=1, k=2 | `{x²,xy,y²}`=3 / `C(3,1)=3` | equal | none |
| 22 | torus `h^(p,q)=C(n,p)C(n,q)` (l. 1482) | n=1 | `h¹⁰=h⁰¹=1`, `b₁=2` | equal | none |
| 23 | `⟨δ^(n)/n!,φ⟩=2^n` (l. 714), recomputed | `φ=1/(1+2x)` | `(−1)^n·(−2)^n` / `2^n` | equal | none |
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
| 34 | Newlander–Nirenberg (headline), re-run | converse pinned (`nijenhuis_ofComplexManifold`, l. 221) | elaborates, exit 0 | statable | R05 |
| 35 | Weierstrass preparation (headline), re-run | `f=w²+zw`; d=0 | `u=1, a₁=z, a₀=0`; d=0 ⇒ `u=f` | statable | R05 |
| 36 | Hartogs (headline), re-run | n=1 `1/z`; shell | excluded by `2≤n`; by connectedness | statable | R05 |
| 37 | Parameter Cauchy–Green (l. 214–225) | `∂̄_z T(χf)=χf` | holomorphic on `ℂ∖tsupport χ` ∀p,q | holds | R17 |
| 38 | K2 solver tail bound (l. 236–237) | `A_jh=Σw_k h(ζ_k)g_k` | fixed nodes preserve q-holomorphy | holds | none |
| 39 | `realified_isManifold_analytic` (Lean 35), re-run | m=∞, n=ω | one term `restrictScalars_of_ne_zero ω (by simp) h`, exit 0 | padding | R14 |
| 40 | Riemann surface `b₁=2g` (l. 1484–1485) | torus; ℂP¹ | `2=2`; `0=0` | equal | R02 |
| 41 | `BundleSobolev` carrier (Lean 369–372), signature re-checked | `localize=0` | `{v \| ∀i, (v i).toDistr=0}={0}` | vacuous | R01 |
| 42 | `complexBesselSymbol` (Lean 466, 484) | `z=s`; `z=it` | `(1+\|ζ\|²)^(s/2)`; modulus 1 | holds | R14 |
| 43 | CC l. 225–226: Chern form of O(1) is `+ω_FS` | K7 `Θ=−2πiω_FS` | `(i/2π)·(−2πi)ω_FS=+ω_FS` / `+ω_FS` | equal | none |
| 44 | CC l. 802: `h` on CP¹ pairs to `+1`; K7.2 `⟨u,[ℂP¹]⟩=+1` (l. 1466) | row 6 | `∫_(ℂP¹)c₁(O(1))=∫ω_FS=1` / `+1` | equal; same orientation | none |

## Not verifiable

- Webster, Math. Z. 201 (1989), pp. 303–316 (`webster-nn`, uncertified, paywalled): the K1 Newlander–Nirenberg route. Cited by locator only.
- Griffiths–Harris, Ch. 0 §§1–2 (`griffiths-harris`, uncertified): K3's local rings and parametrization.
- Wells (`wells-dacm`, uncertified): K5b. The README gives no chapter (R17).
- Raghunathan, Thm 1.13 p. 23 and Cor. 1 p. 31 (`raghunathan-discrete-subgroups`, uncertified): taken from `sakane-parallelisable` lines 112–113, not read.
- Hörmander, ALPDO I, Thms 2.3.4–2.3.5 (`hormander-alpdo1`, uncertified): proposed in R17 from the manifest, not read.

## Source issues

- none
