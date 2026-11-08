# Review of ComplexKahlerGeometry (pull request #1807 at 12e0624)

**Verdict:** needs changes

Incremental re-review of 0 changed lines in `TauCetiRoadmap/ComplexKahlerGeometry/` since 0f7ed58, the head the previous review read. The three commits since (b0ef636, e752fe8, 12e0624) touch only `TauCetiRoadmap/BordismFormalGroups/README.md`, `TauCetiRoadmap/ClassifyingSpaces/README.md` and `TauCetiRoadmap/ClassifyingSpaces/Suggested.lean`, folders the brief names as the pull request's own; their diff contains no line mentioning this roadmap. `lake-manifest.json` and `lean-toolchain` are unchanged (Tau Ceti 2fd255d, Mathlib 1b1ccf4). `README.md` (1703 lines) and `Suggested.lean` (510 lines) have the same content hash as at 0f7ed58, so none of the eleven findings of the previous review is repaired; each is written again below with its witness re-read at this head, and every supplier it cites was re-resolved today on main (eaf17b1) or at the open head named. Main gained four commits since the head the previous review compared against (ComplexCurveModuli, DGFloer, HeegaardFloer and TaubesGromov now consume PseudoholomorphicCurveAnalysis); all four roadmaps are consumers of this one, this roadmap cites none of them as a supplier, and no supplier folder changed.

One finding is new: the gate's `statement-hygiene` scanner reports a hit at `Suggested.lean` line 400 that no previous report listed (R12). The worker's gate at this head: blob=29, sorry-data=20, imports=1, mathlib-subimports=5, no-import-mathlib=1, statement-hygiene=1, build=41 (lake's module-system advisories for the imported `TauCetiRoadmap.DifferentialGeometry.Suggested`, see R02), outside-folder=0, depcheck=0, FAIL. A gate run from the worktree reproduces every text count (and reports outside-folder=18 for the sibling folders the brief names as the pull request's own). Dependency check at this head: `depcheck: 239 roadmaps, 2338 edges, 0 problem(s)`, no UPWARD, no CYCLE, no `moved:` line. `git diff --stat origin/main...HEAD` restricted to paths outside the fourteen folders the brief names as the pull request's own is empty.

## R01 (P1) — Twenty sorried data declarations in `Suggested.lean`

Location: `TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` lines 77, 139, 151–168, 224, 234, 287–308, 348, 369, 397, 428, 434, 489 (gate rule `sorry-data`, 20 hits at this head).

Claim: `nijenhuisTensor`, `realBundleTestSubmodule`, the four `realBundleTest*` instances, `realBundleTestOfChart`, `bundleTestSubmodule`, `bundleTestSmul`, the four `bundleTest*` instances, `bundleTestOfChart`, `bundleTestRestrictScalars`, `bundleSobolevSubmodule`, `bundleSobolevToDistribution`, `realDistributionComplexify`, `bundleDistributionConjugation` and `complexBesselToL2` are `def`s or `instance`s whose bodies or proof fields are `sorry`. Everything downstream (`IsKahler`, `nijenhuisTensor_skew`, `BundleTest`, `BundleDistribution`, `BundleSobolev`, the `*_apply` and `*_continuous_iff` theorems, `complexBesselToL2_*`) mentions one of them. The elaborated types (below) show the consequence: `nijenhuisTensor`, `nijenhuisOnFields` and `IsKahler` elaborate without `[CompleteSpace E] [FiniteDimensional ℝ E] [T2Space M]`, which `nijenhuisTensor_skew` keeps.

Witness: lines 77–79 `def nijenhuisTensor … := by sorry`; line 96 `IsKahler` uses it; lines 151–153 `instance realBundleTestTopology … := by sorry`.

Repair: delete every sorried `def`/`instance` and every declaration that mentions one. The README keeps the LF test topology, the Sobolev carrier and the complexification maps as targets (K5a); none of them is a headline. For the Nijenhuis tensor, delete `nijenhuisTensor` and give `IsKahler` the real body `form.IsClosed ∧ form.Compatible J ∧ J.nijenhuis = 0` with `[FiniteDimensional ℝ E]` carried explicitly (R11 gives the pinned declaration).

## R02 (P1) — Import header: five `Mathlib.<submodule>` lines, no `import Mathlib`, and another roadmap's module

Location: `Suggested.lean` lines 1–9 (gate rules `imports`, `mathlib-subimports`, `no-import-mathlib`; the 41 `build` lines are the module-system advisories lake prints for the imported `TauCetiRoadmap/DifferentialGeometry/Suggested.lean`).

Claim: the header imports `Mathlib.Analysis.Complex.Basic`, `Mathlib.Analysis.FunctionalSpaces.BesselPotentialSpace`, `Mathlib.Analysis.Distribution.Distribution`, `Mathlib.Geometry.Manifold.VectorField.LieBracket`, `Mathlib.Geometry.Manifold.VectorBundle.ContMDiffSection`, and `TauCetiRoadmap.DifferentialGeometry.Suggested` (used only for `DensityFiber`, lines 120–121).

Witness: line 8 `import TauCetiRoadmap.DifferentialGeometry.Suggested`; no line reads `import Mathlib` (count 0 at this head).

Repair: replace the header by `import Mathlib` followed by the `TauCeti.*` modules actually used (`TauCeti.Geometry.Symplectic.Manifold.AlmostComplex.Basic`, `TauCeti.Geometry.Symplectic.Manifold.TwoForm`, and `TauCeti.Geometry.Symplectic.Manifold.Nijenhuis` once R01's `IsKahler` uses `J.nijenhuis`; `TauCeti.Analysis.Complex.CauchyIntegralPolydisc` is unused and can go). Delete `DensityFiber`: the density fibre is DifferentialGeometry's object and is cited in the README, not re-declared here. This also removes the 41 build advisories.

## R03 (P2) — No headline theorem is stated, and the docstring does not say which are not statable

Location: `Suggested.lean` lines 11–22 (module docstring) and the whole file.

Claim: the README's end theorems are Newlander–Nirenberg (K1), the Dolbeault–Grothendieck lemma on polydiscs and the parameter solver (K2), Weierstrass preparation, Rückert's Nullstellensatz, Oka and Cartan coherence and Hartogs extension (K3), Koszul–Malgrange and the flat-bundle/local-system equivalence (K4), elliptic regularity, the Hodge theorem and Serre duality (K5), the Kähler identities, Hodge decomposition, Hard Lefschetz and Hodge–Riemann (K6), the projective, torus, Hopf and Iwasawa computations (K7–K8). The file states none of them; its one theorem that is not an API lemma is `realified_isManifold_analytic` (K3.0, line 35). The docstring says "These are suggested forms, not an exhaustive checklist" and names no missing carrier.

Witness: at the pins, the scalar Dolbeault–Grothendieck lemma for a smooth `(0,1)`-form on a polydisc in `Fin n → ℂ` and Hartogs extension for `DifferentiableOn ℂ` functions on `(Fin n → ℂ)` minus a compact set with connected complement, `2 ≤ n`, are statable with Mathlib carriers only. Tau Ceti 2fd255d has `TauCeti.SmoothAlmostComplexStructure.delBar : SmoothForm I M F k →ₗ[ℂ] SmoothForm I M F (k+1)` (`TauCeti/Geometry/Manifold/DifferentialForm/Dolbeault/Basic.lean` line 95, re-opened today) and `TauCeti.SmoothForm.IsOfType` (`…/DifferentialForm/AlmostComplexType.lean` line 201) with `IsOfType.delBar` (Dolbeault/Basic.lean line 145), so the Dolbeault complex of a complex manifold `ofComplexManifold E M` (`TauCeti/Geometry/Manifold/Complex/AlmostComplexStructure.lean` line 76) is a complex of `Submodule ℂ (SmoothForm 𝓘(ℝ,E) M F k)` and `H^(p,q)_∂̄(M)` is a quotient of submodules at the pin.

Repair: state the statable headlines: the two Mathlib-only ones above, the compact-Riemann-surface constancy statements on `OnePoint ℂ`, the Hodge theorem of K5b.1 (README line 1230: for a compact complex manifold modelled on finite-dimensional `E`, `FiniteDimensional ℂ (H^(p,q)_∂̄(M))`) and Serre duality for the trivial bundle (`finrank H^(p,q) = finrank H^(n−p,n−q)`), with the ℙⁿ and torus Hodge numbers of K7 as consequences where the carriers exist. List in the docstring each headline that is still not statable with the carrier it lacks (Serre duality with coefficients needs the holomorphic-bundle mixin of ComplexManifolds Milestone 7; the Kähler identities need the complex-linear Hodge star on `(p,q)` forms, which the pin has only for real coefficients, R11).

## R04 (P2) — K7.2 re-plans the CW structure of ℂPⁿ that AlgebraicTopology Stage 4.6 owns

Location: `README.md` lines 1459–1462 ("construct on this same carrier Mathlib's `CWComplex` structure with one cell in each even dimension 0,2,…,2n and none in odd dimensions, specifying its characteristic maps and skeleta. The CW construction uses only K7.1 and AlgebraicTopology Stage 4") and lines 1668–1669 ("K7.2's CW construction uses K7.1 and AT Stage 4 before AT Stage 7").

Claim: two owners for one object. At this head, `TauCetiRoadmap/AlgebraicTopology/README.md` lines 826–830 construct complex projective n-space on `Projectivization ℂ (Fin (n+1) → ℂ)` as a finite CW complex with one cell in each even dimension, characteristic maps `z ↦ [z : √(1−|z|²)]`, and say "ComplexKahlerGeometry K7 consumes that topology and this cell input"; line 1821 repeats it ("ComplexKahlerGeometry K7 consumes Stage 4.6's projective carrier").

Witness: AlgebraicTopology README lines 826–830 and 1821 at this head (re-read today) versus ComplexKahlerGeometry README lines 1460–1463.

Repair: in K7.2, replace the construction sentence by "Consume AlgebraicTopology Stage 4.6's finite CW structure on `Projectivization ℂ (Fin (n+1) → ℂ)` (one cell in each even dimension, characteristic maps `z ↦ [z : √(1−|z|²)])`" and keep only the cellular/cup calculation `H*(ℂPⁿ;ℤ)=ℤ[u]/(u^(n+1))`, the hyperplane normalization and the de Rham/Chern–Weil comparison; update the order paragraph at lines 1668–1669. In the same passage, line 1475 "AT 8.12 consumes that later comparison" is stale: AlgebraicTopology's dependency table at this head says 8.12 uses no projective carrier or external comparison; the finite-to-infinite comparison is CharacteristicClasses C1.5/C1.6's (CharacteristicClasses README lines 99–106 at this head, which cite K4 and K7.1/K7.2). Delete the AT 8.12 clause.

## R05 (P2) — Two-way supply with RealAnalyticGeometry

Location: `README.md` lines 280–284 ("RealAnalyticGeometry R3.2 consumes this colimit theorem"), 424–430 ("RealAnalyticGeometry R5 supplies the global compatible triangulation"), 1337–1341 ("Consume RealAnalyticGeometry R0–R5"), 1688–1692 ("precede RealAnalyticGeometry R1's local semianalytic/component results; those results then supply K3's finite regular-piece partition").

Claim: `TauCetiRoadmap/RealAnalyticGeometry/README.md` on main (eaf17b1, re-read today) consumes this roadmap at line 173 ("The proof uses CK K3's convergent Weierstrass preparation"), line 217 ("Use CK K3's Noetherian germs"), R3.2 lines 736–758 (the structure sheaf "supplied by CK K4"), and lines 780–805 (K3's Oka coherence). This roadmap consumes RealAnalyticGeometry R1 in K3 and R0–R5 in K6.1. The chain K3/K4/K5b → RAG R1–R5 → K3's partition and K6.1 is a cycle between the two roadmaps' layers. The mechanical check does not report it because both roadmaps are on main; the pull request's stated purpose is to cut exactly such loops among roadmaps on main, and this one is left standing.

Witness: RealAnalyticGeometry README line 173 (`CK K3`), line 736 (`CK K4`); ComplexKahlerGeometry README line 1337 (`RealAnalyticGeometry R0–R5`).

Repair: make the supply one-directional. RealAnalyticGeometry R3–R5 depend on K3, K4 and K5b, so the consumer of R5 cannot be this roadmap: move K6.1's analytic-cycle triangulation and integral fundamental class (the paragraph from "For singular V, consume K3's finite regular-piece partition" to the end of K6.1) into "ComplexKahlerGeometry, Part II", placed after RealAnalyticGeometry, with the introduction saying where this roadmap stops (the real de Rham functional of `∫_(V_reg)`). In K3, prove the finiteness of the regular-piece partition from local parametrization and compactness here and drop the R1 citation; delete the consumer sentences at lines 280–284 and 1688–1692 or rewrite them to say that RealAnalyticGeometry consumes K2–K5b.

## R06 (P2) — Two-way supply with PseudodifferentialOperators

Location: `README.md` lines 45–53 ("PseudodifferentialOperators P1.0 supplies differential-operator carriers, jets, symbols and formal density adjoints after K5a's initial density-line construction and before its analytic scale"), 575–577 ("Its pointwise real star, orientation line and density bundle precede PDO P1.0. Its distributional operator action and Laplace analysis then consume P1.0's operator and symbol core"), 1647–1652 ("PDO P1.0 consumes that density bundle").

Claim: `TauCetiRoadmap/PseudodifferentialOperators/README.md` on main (re-read today) has a supplier contract "From TauCetiRoadmap.ComplexKahlerGeometry. K5a supplies bundle distributions, …" (line 91), "CKG K5a consumes this predicate for its analytic regularity" (line 441), `*Needs:* P1.0 differential operators; ComplexKahlerGeometry K5a's smooth-section Fréchet` (line 529) and "ComplexKahlerGeometry K5a's density and section-topology contracts" (line 541). The roadmap-level graph is K5a(early) → P1.0 → K5a(late) → P1.1 onward: each roadmap is the other's supplier.

Witness: PseudodifferentialOperators README lines 91, 441, 529 and 541 (main); ComplexKahlerGeometry README lines 575–577 and 1650.

Repair: one owner upstream. PseudodifferentialOperators is listed at position 8 of the merge order and this roadmap is unlisted, so move the pre-P1.0 part of K5a (the density line `DensityBundle M`, `BundleTest`, `BundleDistribution`, the Fréchet section topology and the Montel instance) into PseudodifferentialOperators P1.0's smooth-section floor and consume them here; K5a then starts at the Hilbert scale. The alternative (P1.0's operator core moves here and PseudodifferentialOperators consumes all of K5a) also works; either way the two READMEs must agree.

## R07 (P3) — Pull-request numbers and pinned-commit links as supplier citations

Location: `README.md`, 24 occurrences of "#279"/"#280" (21 and 3 at this head; for example lines 17, 28, 1551, 1591 and 1668: "#279 Milestones", "#280 Milestone 1", "ComplexManifolds #279 Milestone 4"), the `github.com/TauCetiProject/TauCetiRoadmap/blob/<sha>/…` links (the gate lists 29 lines at 26, 29, 31, 35, 41, 45, 53, 199, 200, 345, 472, 475, 572, 573, 1049, 1051, 1059, 1063, 1065, 1153 and further), and the 8 fork links `github.com/mccorvie/…` and `github.com/Paul-Lez/…` at lines 1488–1496, 1591 and 1674–1675.

Claim: cross-roadmap citations must name the roadmap and its section, never a pull-request number or a commit-pinned path; ComplexManifolds and ComplexTori are on main with Milestones 1–7 and 1–5 respectively, so "#279 Milestone 2.1" is "ComplexManifolds Milestone 2.1".

Witness: `ComplexManifolds/README.md` on main line 197 `## Milestone 2: the canonical real orientation`; `ComplexTori/README.md` on main line 130 `## Milestone 1: fixed complex tori` (both re-read today).

Repair: replace each "#279" by "ComplexManifolds", each "#280" by "ComplexTori", and each blob link by the roadmap name and section (DifferentialGeometry Layer 0.4, GlobalHolomorphicFunctions Layer 0.3/2.5/4.1/7.2, VariationalMethods §2.2–2.4, §3.1, §5.1–5.2, OperatorTheory/UnboundedOperators §4.7, PlanarTopology Layer 6, SurfaceTopology Layers 2–3/6/8, ComplexComparisonPartII C−1.1/C0.4/C5.1–C5.2, FormalConnectionsOpers F2.4, LieGroupoidsPoisson §G1.3a).

## R08 (P3) — Citation labels that do not resolve in the suppliers' own numbering

Location: `README.md` lines 572, 1049, 1059, 1063, 1065, 1153, 1653, 1656 (VariationalMethods "V2–V5.2", "V5.1", "V2.2–V2.4", "V3–V4", "V5.1–V5.2", "V3.1"), lines 35, 981 and 1637 ("GlobalHolomorphicFunctions GH5.1" for the exactness of every smooth complex 2-form), lines 1551, 1598 and 1683 ("LieGroupoidsPoisson G1.3").

Claim: VariationalMethods (at the head of pull request #1028) numbers its sections 2.2–2.4, 3.1, 3–4, 5.1–5.2 and never uses a "V" prefix (0 occurrences of a `V<digit>.<digit>` label in its README, re-counted today), which is why the resolver lists V5.1 and V2.2 as found nowhere (`citations.md`, 2 leads at this head, both confirmed); in GlobalHolomorphicFunctions (at the head of pull request #992) two-form exactness is Layer 7.2, while the label GH5.1 is Layer 7.4; LieGroupoidsPoisson's standalone Chevalley–Eilenberg complex is §G1.3a (its README on main, line 86, which itself names K8 as the consumer of §G1.3a).

Witness: VariationalMethods README line 452 `### 2.2 Quadratic energies` and line 839 `### 5.1 The compact-pair specialization`; GlobalHolomorphicFunctions README line 1807 `### 7.2 Planar coordinate forms and two-form exactness` and line 1925 `### 7.4 … (GH5.1)`; LieGroupoidsPoisson README line 86.

Repair: cite "VariationalMethods §5.1" (and §2.2–2.4, §3–4, §3.1, §5.1–5.2), "GlobalHolomorphicFunctions Layer 7.2", "LieGroupoidsPoisson §G1.3a".

## R09 (P3) — Padding in `Suggested.lean`

Location: `Suggested.lean` lines 55–66 (`dbarFunction_apply_J`, `dbarFunction_eq_zero_iff`), 88–91 (`nijenhuisTensor_skew`), 106–115 (`memSobolev_iff_bundled`, proved), 243–284 (`bundleTestComplexModule`, `bundleTestScalarTower`, proved field by field), 275–276 (`bundleTest_smul_apply`, `rfl`), 360–361, 383–385, 393–394, 405–409, 413–416, 503–506 (all proved in one term), 484–486 (`complexBesselDistributionMultiplier_real`).

Claim: these are API lemmas that restate a definition or follow in one step. Probe (carried from the review at fa7b83e; the declarations are byte-identical and re-elaborate at this pin): after `simp [dbarFunction, TauCeti.SmoothAlmostComplexStructure.apply_apply]` the goal of `dbarFunction_apply_J` is the scalar identity `(a' − i a)/2 = −i(a + i a')/2` with `a = df(v)`, `a' = df(Jv)`, and `dbarFunction_eq_zero_iff` reduces to `a + i a' = 0 ↔ a' = i a`; both close by `Complex.I_mul_I` and `ring`. `memSobolev_iff_bundled` is proved by `⟨hu.toBesselPotentialSpace, rfl⟩` and `v.memSobolev_toDistr`. `nijenhuisTensor_skew` is a statement about the sorried tensor of R01, and at the pin it is `TauCeti.SmoothAlmostComplexStructure.nijenhuis_antisymm` (R11). `complexBesselDistributionMultiplier_real` is the identity `exp((s/2) log(1+|ζ|²)) = (1+|ζ|²)^(s/2)`.

Repair: delete them from `Suggested.lean`; the README keeps the type law of `∂̄`, the skew-symmetry of N and the bundled/unbundled Sobolev comparison as Checks and API bullets.

## R10 (P3) — README shape: no Checks, no supplier-contract section, locators missing, undeclared Lean names

Location: whole `README.md`; in particular the title line 1 (`# Complex manifolds, Dolbeault theory, and Kähler geometry`, not `# Roadmap: …`), the absence of `**Summary.**`, `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build`, `### Examples` and `### Dependencies` per layer, and of any `**Checks.**` list (0 occurrences at this head; the ten `##` headings are "Conventions and suppliers", K1–K8 and "Order and references"); the reference list at lines 1694–1703 (Wells without chapter or theorem; Griffiths–Harris "chapter 0" without section); process wording at line 67 and in the Lean docstring ("these prototypes do not prove the analytic targets"); LaTeX macros inside code spans at lines 120–121 (`φ_{\bar z}d\bar z`); backticked names of this roadmap's own that `Suggested.lean` does not declare: `DensityBundle M` (line 626), `RealBundleSobolev V 0` (line 785), `BundleSobolev E s` with the signature `(E, s)` (lines 728 and 892; the Lean `BundleSobolev` takes `F V n q G localize s`).

Claim: the definitions of K5a and K3 have API prose but no `**Checks.**` bullets, so the three-Checks rule fails for every definition; several sampled targets (Parameter Cauchy–Green, K4.ComponentwiseFiniteRankAssembly, K5a.DistributionLocalStructure, K5a.SmoothSectionMontel, K5a.ComponentwiseCompact, K5b.0, K7.1) carry no locator at all.

Repair: bring the README to the TauCetiRoadmap form (title, Summary, Scope and ownership, Conventions, Exact supplier contracts, layers with Examples and Dependencies), add at least three discriminating Checks per definition (for example for `dz_j♯`: with `H = I` the value `2∂_(z_j)` and the failure of the dual-frame normalization `∂_(z_j)`; for the pointwise star: `*² = (−1)^(k(m−k))` on `k = 1, m = 2` giving `−1`; for the Hopf computation: the weight `2^(1−m−n)` of `z₁^(−m)z₂^(−n)dz_j` at `m = n = 1`), give each theorem a locator (Demailly chapter II §4.2 for Weierstrass preparation, II (4.22) for the Nullstellensatz, II (4.29) and (4.31) for coherence and the singular locus; Wells chapter IV §§4–5 for Hodge theory and Serre duality), remove the process wording, write `φ_z̄` and `dz̄` in Unicode, and either declare `DensityBundle`/`RealBundleSobolev` or unbacktick them.

## R11 (P2) — The pinned Tau Ceti owns the Nijenhuis tensor, the type decomposition, ∂ and ∂̄, the real Hodge star and the codifferential that K1, K2, K5a and `Suggested.lean` plan to construct

Location: `Suggested.lean` lines 50–53 (`dbarFunction`), 55–66 (`dbarFunction_apply_J`, `dbarFunction_eq_zero_iff`), 69–91 (`nijenhuisOnFields`, `nijenhuisTensor`, `nijenhuisTensor_onFields`, `nijenhuisTensor_skew`); `README.md` lines 164–172 ("construct the eigenbundles, exterior type `(p,q)`, projections … the decomposition of d into its four bidegrees. Define the Nijenhuis tensor by `N_J(X,Y)=[JX,JY]−[X,Y]−J[JX,Y]−J[X,JY]`; prove tensoriality, skew-symmetry … pin `∂̄²f(X,Y)=−(1/4)∂f(N_J(X,Y))`"), line 179 ("Prove equivalence of `N_J=0` and involutivity of both eigenbundles"), lines 195–196 ("construct ∂ and ∂̄ on generic type forms and prove their bidegrees, squares zero, anticommutation, graded Leibniz, conjugation and holomorphic-pullback naturality"), lines 598–606 ("construct the pointwise Hodge star on all exterior degrees … characterized by `α∧*β=⟨α,β⟩vol`, with `*²=(−1)^(k(m−k))` … orientation-reversal sign … Transport smoothly to real cotangent/exterior bundles").

Claim: duplication by object against the pinned library (Tau Ceti 2fd255d, the pin of this head's manifest):

- `TauCeti/Geometry/Symplectic/Manifold/Nijenhuis.lean`: `TauCeti.SmoothAlmostComplexStructure.nijenhuis (x : M) : TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ] TangentSpace I x` (line 158, under `[IsManifold I ∞ M]` line 85 and `[FiniteDimensional ℝ E]` line 153), `nijenhuis_apply` (line 170: on fields differentiable at `x` it is `mlieBracket I (J X) (J Y) − mlieBracket I X Y − J (mlieBracket I (J X) Y) − J (mlieBracket I X (J Y))`, the same expression as `nijenhuisOnFields`), `nijenhuis_eq_zero_iff` (188), `nijenhuis_antisymm` (207), `nijenhuis_self` (213).
- `TauCeti/Geometry/Symplectic/Manifold/AlmostComplex/Eigenbundle.lean`: `isInvolutiveComplexDistribution_eigenspace_I_iff` (line 96) and `…_neg_I_iff` (149): the `±i` eigenbundles are involutive exactly when `J.nijenhuis = 0` (README line 179).
- `TauCeti/Geometry/Manifold/DifferentialForm/AlmostComplexType.lean`: `TauCeti.SmoothForm.IsOfType φ J p q` (line 201) and `typeProjection p q : Module.End ℂ (SmoothForm I M F k)` (282); `SmoothForm I M F k` carries its `Module ℂ` structure at the pin, which README lines 134–140 plan to construct.
- `TauCeti/Geometry/Manifold/DifferentialForm/Dolbeault/Basic.lean`: `del`, `delBar : SmoothForm I M F k →ₗ[ℂ] SmoothForm I M F (k+1)` (lines 86, 95), `IsOfType.del`/`IsOfType.delBar` (140, 145), `IsOfType.mextDerivₗ_eq_add_del_add_delBar_add` (151, the four bidegrees of `d`), `delBar_apply_apply` (366: `∂̄f(v) = (df(v) + i df(Jv))/2`, exactly `dbarFunction`), `delBar_apply_eq_zero_iff` (378, exactly `dbarFunction_eq_zero_iff`), `delBar_delBar_apply` (405: `∂̄∂̄f(v,w) = −(1/4)·∂f(N_J(v,w))`, the README's pinned formula), `mextDerivₗ_eq_del_add_delBar_of_nijenhuis_eq_zero` (438).
- `…/Dolbeault/ComplexManifold.lean`: `mextDerivₗ_eq_del_add_delBar_ofComplexManifold` (150), `del_del_ofComplexManifold` (158), `delBar_delBar_ofComplexManifold` (166), `del_delBar_add_delBar_del_ofComplexManifold` (172); `…/Dolbeault/Leibniz.lean`: `del_wedgeWith` (136), `delBar_wedgeWith` (147); `…/Dolbeault/Holomorphic.lean`: `delBar_eq_zero_iff_isPseudoholomorphic` (87), `kerDelBarZeroEquiv` (131); `TauCeti/Geometry/Manifold/Complex/AlmostComplexStructure.lean`: `ofComplexManifold` (76), `nijenhuis_ofComplexManifold` (221).
- `TauCeti/Geometry/Manifold/Riemannian/HodgeStar.lean`: `TauCeti.RoughForm.hodgeStar` (73) and `TauCeti.SmoothForm.hodgeStar (o : Manifold.Orientation I M (Fin m)) (hkl : k + l = m) : SmoothForm I M ℝ k → SmoothForm I M ℝ l` (296), `hodgeStar_hodgeStar` (310: `** = (−1)^(k·l)`, with `k + l = m` this is the README's `(−1)^(k(m−k))`), `inner_smul_riemannianVolumeForm_eq_wedge_hodgeStar` (317: `⟨α,β⟩·vol = α ∧ *β`), `hodgeStar_neg_orientation` (340); `…/Riemannian/Codifferential.lean`: `codifferential` (88: `(−1)^(m(k+2)+1) * d *` on `(k+1)`-forms, which is the README's `(−1)^(m(k+1)+1)*d*` on degree `k` after `k ↦ k+1`), `hodgeStar_codifferential` (111).

Witness: `Suggested.lean` line 77 declares `nijenhuisTensor` with the type that `Nijenhuis.lean` line 158 gives `nijenhuis` (re-opened today at the pin); `Suggested.lean` line 50 `dbarFunction` is `delBar_apply_apply` on `k = 0` (line 366 at the pin); README line 601 `*²=(−1)^(k(m−k))` is `hodgeStar_hodgeStar` line 310.

Repair: in `Suggested.lean`, delete `dbarFunction`, `dbarFunction_apply_J`, `dbarFunction_eq_zero_iff`, `nijenhuisOnFields`, `nijenhuisTensor`, `nijenhuisTensor_onFields` and `nijenhuisTensor_skew`, and write `IsKahler` with `J.nijenhuis = 0` (R01). In the README, move these objects to the Tau Ceti supplier contract by their names and files above, and cut the corresponding construction sentences: K1 lines 164–172 keep only what the pin lacks (the complex-bilinear extension of `N` and the real-tangent evaluation formulas via the `(0,1)`/`(1,0)` projections, if not derivable in one step from `delBar_delBar_apply`), K1 line 179 and lines 134–140 become citations, K2 lines 195–196 keep only the conjugation and holomorphic-pullback naturality statements that are not at the pin (the module docstring of `Dolbeault/Basic.lean` lines 15–17 asserts both; cite the declarations when they are found, otherwise state them with a `*Needs:*` on the pinned `delBar`), and K5a lines 598–606 become "Consume `TauCeti.SmoothForm.hodgeStar` and `codifferential` with `hodgeStar_hodgeStar`, `inner_smul_riemannianVolumeForm_eq_wedge_hodgeStar`, `hodgeStar_neg_orientation`", keeping only the orientation-line twist and the complex-linear extension (lines 607–616), which the pin does not have. Re-audit the rest of K5a against `TauCeti/Geometry/Manifold/Riemannian/Laplacian.lean` and `Sobolev.lean` (also at this pin) before the next review.

## R12 (P3) — `bundleSobolevToDistribution` chooses its datum with `Classical.choose`

Location: `Suggested.lean` lines 397–402 (gate rule `statement-hygiene`, 1 hit at this head: "P3 def `bundleSobolevToDistribution` chooses its datum (`Classical.choose`)").

Claim: the `toFun` field of this `def` is `Classical.choose u.2`, so the map is defined by an unspecified choice from the existential in the Sobolev predicate; the gate refuses choice in the body of a `def`, and the companion theorem `bundleSobolevToDistribution_localize` (lines 405–409) only recovers the chosen witness through `Classical.choose_spec`. No previous report listed this hit; it is a gate failure at this head.

Witness: line 400 `toFun u := Classical.choose u.2`; lines 401–402 `map_add' := by sorry`, `map_smul' := by sorry`.

Repair: the gate's own: define the datum through a universal property, by `Quotient.lift`/descent, or take it as an argument. Under R01 the whole declaration is deleted (it is sorried data and nothing downstream is a headline), which discharges this finding at the same time; if the map is kept as a README target, state its injectivity-based uniqueness there and do not declare it in `Suggested.lean`.

## Previous findings

- R01 — not repaired: `Suggested.lean` lines 77–79 still read `def nijenhuisTensor … := by sorry`, and the gate still counts 20 `sorry-data` hits (now R01).
- R02 — not repaired: lines 1–9 still import five `Mathlib.<submodule>` lines and `TauCetiRoadmap.DifferentialGeometry.Suggested`, with no `import Mathlib` (now R02).
- R03 — not repaired: the docstring at lines 11–22 still says "suggested forms, not an exhaustive checklist" and no headline is stated (now R03).
- R04 — not repaired: README lines 1459–1462 still construct the `CWComplex` structure on ℂPⁿ while AlgebraicTopology Stage 4.6 at this head (lines 826–830, 1821) owns it (now R04).
- R05 — not repaired: README line 1337 still consumes RealAnalyticGeometry R0–R5 while RealAnalyticGeometry on main eaf17b1 (lines 173, 217, 736) consumes K3 and K4 (now R05).
- R06 — not repaired: README lines 575–577 still consume PDO P1.0 while PseudodifferentialOperators on main (lines 91, 441, 529, 541) consumes K5a (now R06).
- R07 — not repaired: 21 "#279" and 3 "#280" occurrences, the 29 blob-link lines and 8 fork links remain (counted today) (now R07).
- R08 — not repaired: "VariationalMethods V5.1" at line 1049, "GH5.1" at line 35, "LieGroupoidsPoisson G1.3" at line 1551 remain (now R08).
- R09 — not repaired: `dbarFunction_apply_J` (line 55), `memSobolev_iff_bundled` (line 106) and the other listed declarations remain (now R09).
- R10 — not repaired: line 1 still reads `# Complex manifolds, Dolbeault theory, and Kähler geometry`, `**Checks.**` occurs 0 times, lines 120–121 still carry `\bar` inside code spans (now R10).
- R11 — not repaired: `Suggested.lean` line 77 still declares `nijenhuisTensor` and README lines 164–172, 195–196, 598–606 still construct what `Nijenhuis.lean` line 158, `Dolbeault/Basic.lean` lines 86–95 and `HodgeStar.lean` line 296 declare at the pin (now R11).

## Verified sound

**The change set.** `git diff --stat 0f7ed58...HEAD -- TauCetiRoadmap/ComplexKahlerGeometry` is empty and both files have the content hash they had at 0f7ed58; `git diff --stat 0f7ed58 HEAD -- lake-manifest.json lean-toolchain` is empty (Tau Ceti `2fd255d997…`, Mathlib `1b1ccf4b08…`). The three commits since (BordismFormalGroups README; ClassifyingSpaces README and Suggested.lean) have no diff line matching `ComplexKahler`, `CKG`, `Kähler` or `Kahler`. The diff outside the fourteen folders the brief names as the pull request's own is empty. Main moved from ffac513 to eaf17b1 by four commits (ComplexCurveModuli, DGFloer, HeegaardFloer, TaubesGromov each now consume PseudoholomorphicCurveAnalysis for their curve analysis); the files they change mention this roadmap only as their supplier (for example HeegaardFloer README line 159 `### From TauCetiRoadmap.ComplexKahlerGeometry`, ComplexCurveModuli "Consume ComplexKahlerGeometry K1/K2 …"), this README names none of the four, nor PseudoholomorphicCurveAnalysis, as a supplier (its single mention of HeegaardFloer at line 107 is a remark that HeegaardFloer delegates its orientation carrier to DifferentialGeometry), and no supplier folder changed.

**Elaboration and signatures at the pins.** `lake env lean TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` from the worktree today: exit 0, 37 `declaration uses sorry` warnings and nothing else. The `#check @name` probe over all 62 declarations is carried from the previous review at the same content hash and the same pins: `nijenhuisOnFields`, `nijenhuisTensor` and `IsKahler` carry only `[NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]` (the sorried `def`s drop `[CompleteSpace E] [FiniteDimensional ℝ E] [T2Space M]`), while `nijenhuisTensor_skew` keeps `[CompleteSpace E] [FiniteDimensional ℝ E] … [T2Space M]`. No signature changed.

**Gate and dependency check.** The worker's gate at this head is quoted in the preamble; a gate run from the worktree today reproduces every text count (`set_option=0 blob=29 latex=0 tex=0 prnum=0 sorry-data=20 sorry-examples=0 residue=0 private-paths=0 imports=1 mathlib-subimports=5 no-import-mathlib=1 lean-lines=0 statement-hygiene=1 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=18 source-material=0 FAIL`, the 18 being the sibling folders the brief names as the pull request's own). Dependency check:

```
depcheck: 239 roadmaps, 2338 edges, 0 problem(s)
```

no UPWARD, no CYCLE, no `moved:` line.

**Adversarial table.** The diff changes no statement, so every row is carried forward from the review that computed it (r20 at 4f06ba2 for the pin-bump rows, r9 at fa7b83e, r14 at 1745f50), with its values; the pinned declarations the r20 rows cite were re-opened today at the same pin (`Nijenhuis.lean` line 158, `Dolbeault/Basic.lean` lines 95, 366, 405, `HodgeStar.lean` line 310, `Codifferential.lean` line 88).

| Statement | Instances tried | Values computed | Result | From |
|---|---|---|---|---|
| import `TauCeti.Geometry.Symplectic.Manifold.AlmostComplex.Basic` | pin 2fd255d | `SmoothAlmostComplexStructure` l.71, `apply_apply` l.126 present; file elaborates | sound | r20 |
| `nijenhuisOnFields J X Y x` equals the pin's `nijenhuis_apply` expression | symbolic | both: `[JX,JY] − [X,Y] − J[JX,Y] − J[X,JY]` with `mlieBracket I`; no scaling | duplicate (R11) | r20 |
| `dbarFunction J f x v = (df(v) + i·df(Jv))/2` versus `delBar_apply_apply` | `k = 0` | pin: `(2)⁻¹ • (mvfderiv f x v + I • mvfderiv f x (J x v))`; identical | duplicate (R11) | r20 |
| README `∂̄²f(X,Y)=−(1/4)∂f(N_J(X,Y))` versus `delBar_delBar_apply` | `v,w` tangent vectors | pin: `−(4)⁻¹ • (J.del f).1 x ![J.nijenhuis x v w]`; same sign and factor | sound, pin owns it (R11) | r20 |
| README `*²=(−1)^(k(m−k))` versus `hodgeStar_hodgeStar` | `k + l = m`, `k=1,m=2` | pin: `(−1)^(k·l)` = `(−1)^(k(m−k))`; at `k=1,m=2`: `−1` both | sound, pin owns it (R11) | r20 |
| README `d*=(−1)^(m(k+1)+1)*d*` on `k`-forms versus `codifferential` on `(k+1)`-forms | `m=3`, form degree 1 | pin: `(−1)^(3·2+1) = −1`; README: `(−1)^(3·2+1) = −1` | sound, pin owns it (R11) | r20 |
| `nijenhuisTensor_skew` versus `nijenhuis_antisymm` | `v, w` | both `N(v,w) = −N(w,v)` | duplicate (R09, R11) | r20 |
| `IsKahler form J` with `J.nijenhuis = 0` has a real body | `ofComplexManifold E M` | `nijenhuis_ofComplexManifold : (ofComplexManifold E M).nijenhuis = 0` (pin line 221); Kähler reduces to closed + compatible on a complex manifold | repair of R01 is sound | r20 |
| `bundleSobolevToDistribution u = Classical.choose u.2` is determined by `u` | `hinj` injective localization | the witness `D` with `(u.1 i).toDistr = localize i D` for all `i` is unique by `hinj`, so the choice is forced but not stated by a universal property | R12 | r27 |
| `g(u,v)=ω(u,Jv)`, `h_T=g+iω` conjugate-linear in the first slot (Conventions) | `h_T(Ju,v)` | `g(Ju,v)=ω(u,v)`, `ω(Ju,v)=−g(u,v)`; `h_T(Ju,v)=−i·h_T(u,v)` | sound | r9 |
| `h_T(u^(1,0),v^(1,0))=2g_ℂ(bar u^(1,0),v^(1,0))` | general `u,v` | `g_ℂ((u+iJu)/2,(v−iJv)/2)=h_T(u,v)/2`; twice gives `h_T(u,v)` | sound | r9 |
| `ω=(i/2)Σh_T(∂_(z_k),∂_(z_j))dz^j∧dbar z^k` gives `Σdx^j∧dy^j` for `h_T=δ` | `n=1` | `(i/2)(dx+idy)∧(dx−idy)=dx∧dy` | sound | r9 |
| `dd^c=2i∂∂̄` with `d^c=i(∂̄−∂)` | symbolic | `(∂+∂̄)i(∂̄−∂)=2i∂∂̄` | sound | r9 |
| `N(X^(0,1),Y^(0,1))=N(X,Y)^(1,0)` | `X=X^(1,0)+X^(0,1)` | `N(JX,Y)=−JN(X,Y)` puts `N(X^(0,1),·)` in `T^(1,0)`; mixed terms vanish | sound | r9 |
| Chern connection `A=h⁻¹∂h`, `A′=g⁻¹Ag+g⁻¹dg` | rank `r` | `dh=A*h+hA` with `A` of type `(1,0)` forces `∂h=hA` | sound | r9 |
| `ω_FS=(i/2π)∂∂̄log(1+|z|²)`, `∫_(ℙ¹)ω_FS=1`, `Θ(O(1))=−2πiω_FS` | `n=1` | `(1/π)(1+|z|²)^(−2)dx∧dy`, integral `1` | sound | r9 |
| Hodge Laplacian on functions is `−div grad` | `ℝⁿ` | `d*df=−Σ∂_i²f` | sound | r9 |
| `|dz_j|²_Gram=2(H⁻¹)_jj`, `dz_j♯=2Σ_k(H⁻¹)_kj∂_(z_k)` | `H=I`, `n=1` | `|dx+idy|²=2`; `c_k=2(H⁻¹)_kj` | sound | r9 |
| unitary coframe `φ` has Gram norm `√2`, `e_φ i_φ+i_φ e_φ=2δ` | `n=1` | `ψ=φ/√2` orthonormal gives `1` | sound | r9 |
| `*:Ω^(p,q)→Ω^(n−q,n−p)`, `barStar:Ω^(p,q)→Ω^(n−p,n−q)`, `∂̄*=−*∂*` | `n=1,(p,q)=(1,0)` | `*dz∝dz`; `barStar dz∝dbar z` | sound | r9 |
| `σ(Δ_∂̄)=½|ξ|²Id` | flat `ℂⁿ` | `Δ_d=2Δ_∂̄`, `σ(Δ_d)=|ξ|²` | sound | r9 |
| `[Λ,L]=n−k`, `[Λ,∂̄]=−i∂*`, `[Λ,∂]=i∂̄*`, `[Λ,d]=−(d^c)*`, `[L,d*]=d^c` | symbolic | `[Λ,d]=i(∂̄*−∂*)=−(d^c)*`; `[L,d*]=d^c` | sound | r9 |
| Hodge–Riemann sign `i^(p−q)(−1)^(k(k−1)/2)∫α∧bar α∧ω^(n−k)/(n−k)!>0` | `n=1,(p,q)=(1,0)` | `i|f|²dz∧dbar z=2|f|²dx∧dy>0` | sound | r9 |
| `[iΘ(E),Λ]≥ka` from Nakano `iΘ≥aω⊗Id` | `k=1` | eigenvalue sum `≥ka` | sound | r9 |
| `K_(ℙ¹)≃O(−2)`; `H¹(O(−1))=0` | `w=1/z` | transition `−w⁻²`; `h¹(O(−1))=h⁰(O(−1))=0` | sound | r9 |
| `h⁰(O(k))=binomial(n+k,n)`; torus `h^(p,q)=binomial(n,p)binomial(n,q)`; curve `h^(0,1)=g` | `n=1,k=2`; `n=1`; `g=1` | `3`; `1,1,1,1`; `1=b₁/2` | sound | r9 |
| Hopf `h^(0,1)=1`, `h^(1,0)=0`, `h^(1,1)=0`, `b_k=Σh^(p,q)` | weights `2^d`, `2^(d+1)`, `2^(1−m−n)` | coinvariants are the constants; `b₁=1`, `b₂=0`, `b₃=1` | sound | r9 |
| Iwasawa `h^(1,0)=3`, `h^(0,1)=2`, `b₁=4` | Sakane, Angella tables | `sakane-parallelisable` line 339; `angella-iwasawa` lines 701, 719, 724 | sound | r9 |
| Frölicher `d_r:E_r^(p,q)→E_r^(p+r,q−r+1)` | `r=1` | `∂:H^(p,q)_∂̄→H^(p+1,q)_∂̄` | sound | r9 |
| Laurent coefficient of order `−k`: `(2πi)⁻¹∮f(z)(z−a)^(k−1)dz` | `f=(z−a)^(−k)` | `1` | sound | r9 |
| `exp(1/‖x‖²)` nonextension | `0<c<1/4` | exponential beats every power | sound | r9 |
| `⟨δ^(n)/n!,φ⟩=2ⁿ` for `φ=1/(1+2x)` | `n=0,1,2` | `1,2,4` | sound | r9 |
| `H_m(t)=t_+^(m−1)/(m−1)!` is `C^(m−2)`, `D^mH_m=δ` | `m=2` | `t_+` is `C⁰`, `D²t_+=δ` | sound | r9 |
| Peetre `〈ζ+η〉^s≤2^(|s|/2)〈ζ〉^s〈η〉^|s|` | `s=1`, `ζ=η` | `1+4|ζ|²≤2(1+|ζ|²)²` | sound | r9 |
| `B_F(f,g)=B₀(f,Rg)`, `Rg(x)=g(−x)` | Plancherel | `∫f̂ĝ=∫f(x)g(−x)dx` | sound | r9 |
| link in codimension one: `H̃₀(c points)=ℤ^(c−1)` forces `c=2` | `c=1,2,3` | `0,ℤ,ℤ²` | sound | r9 |
| `OnePoint.equivProjectivization`: `t↦[t:1]`, `∞↦[1:0]` | pin | `Mathlib/Topology/Compactification/OnePoint/ProjectiveLine.lean` | sound | r9 |
| last nonzero lower-central ideal is central, positive-dimensional, proper | nonabelian nilpotent `𝔤` | `[𝔤,𝔤^(m)]=0`, `𝔤^(m)≠0`, `𝔤^(m)⊆[𝔤,𝔤]≠𝔤` | sound | r9 |
| sampled "Parameter Cauchy–Green": `∂̄_zT(χf)=χf`, joint smoothness | `T g(z)=(1/π)∫g(ζ)/(z−ζ)dA(ζ)` | differentiation under the integral on the fixed compact support of `χ` | sound | r9 |
| K8 (changed against main): the Frölicher column filtration is a finite decreasing filtration, so AlgebraicTopology Stage 5.0 applies | `n=1` | `F^0 ⊇ F^1 ⊇ F^2 = 0`; `E₁ = H_∂̄`, `d₁ = ∂` of bidegree `(1,0)` | sound | r14 |

**Cross-roadmap citations re-resolved today.** AlgebraicTopology at this head: Stage 4.6 (lines 826–830) owns ℂPⁿ's cell structure and names K7 as consumer; line 1821 repeats it (R04). CharacteristicClasses at this head lines 99–106 consume K4 and K7.1/K7.2 (R04's AT 8.12 clause). RealAnalyticGeometry on main eaf17b1 lines 173, 217, 736 (R05); PseudodifferentialOperators on main lines 91, 441, 529, 541 (R06); LieGroupoidsPoisson on main line 86, which names K8 as consumer of §G1.3a (R08); ComplexManifolds on main line 197 `## Milestone 2` and ComplexTori on main line 130 `## Milestone 1` (R07); VariationalMethods at the head of #1028 (`### 2.2` line 452, `### 5.1` line 839, 0 occurrences of a `V<digit>.<digit>` label); GlobalHolomorphicFunctions at the head of #992 (`### 7.2` line 1807, `### 7.4 … (GH5.1)` line 1925) (R08). The resolver's two leads at this head (V5.1, V2.2) are both confirmed in R08. None of the five supplier folders named in R04–R08 changed on main since the previous review (their last commit is the Tau Ceti pin bump a891cd1). Ownership against the open pull requests whose files the brief gives was checked by object in the review at fa7b83e; nothing in this change set adds an object to check.

**Library declarations opened at the pins** (Tau Ceti 2fd255d, Mathlib 1b1ccf4, the manifest's pins at this head): `TauCeti/Geometry/Symplectic/Manifold/Nijenhuis.lean` line 158; `TauCeti/Geometry/Manifold/DifferentialForm/Dolbeault/Basic.lean` lines 95, 366, 405; `TauCeti/Geometry/Manifold/Riemannian/HodgeStar.lean` line 310; `…/Riemannian/Codifferential.lean` line 88 (all re-opened today); the remaining lines cited in R03 and R11 are as recorded by the previous reviews at the same pin.

**Sources at their locators.** The seeded sample (Parameter Cauchy–Green, K3.HolomorphicStalk, K3.MeromorphicGermField, K4.ComponentwiseFiniteRankAssembly, K5a and its four named sub-targets, K5b with K5b.0–K5b.1, K7.1, K7.2, K8.NilpotentCentralReduction) falls entirely in unchanged passages; the readings of the review at fa7b83e stand: Łojasiewicz §3 Theorem 2, printed p. 464 (`lojasiewicz-triangulation` lines 512–515) for K6.1; Demailly chapter II (4.22), (4.29), (4.31) and §4.4 (`demailly-agbook` lines 4742, 4825, 4842, 4929) for K3; Sakane Theorem 1 and the example (`sakane-parallelisable` lines 46, 106–115, 339) for K8 and K8.NilpotentCentralReduction; Angella's tables (`angella-iwasawa` lines 700–705, 717–724) for the K8 values. The sampled targets that cite no printed source were checked as the roadmap's own constructions by the table (K5b.0's star conventions also against the pinned `hodgeStar_hodgeStar` and `codifferential`).

## Not verifiable

- Webster, *A new proof of the Newlander–Nirenberg theorem*, Math. Z. 201 (1989): paywalled; settled as `uncertified`, cited by locator alone.
- Hörmander, *Linear Partial Differential Operators* (1990), Wells, *Differential Analysis on Complex Manifolds* (2007), Griffiths–Harris, *Principles of Algebraic Geometry* chapter 0: settled as `uncertified` or not available from a legal open source; the K3 and K5 statements attributed to them were checked mathematically in the table, not against the text.
- The board manifest `packages/ComplexKahlerGeometry/sources.toml` records `ballmann-kahler`, `berwick-evans-tripathy`, `knutson-borel-weil` and `lojasiewicz-triangulation` under target names the README does not use, and lacks Demailly, Sakane, Angella, Webster, Griffiths–Harris and Wells. The manifest is not part of this pull request and was not edited.

## Source issues

- none
