# Review of ComplexKahlerGeometry (pull request #1807 at fa7b83e)

**Verdict:** needs changes

The pull request changes three sentences of `TauCetiRoadmap/ComplexKahlerGeometry/README.md` (the K5a star consumer sentence, and the two K8 sentences that now consume AlgebraicTopology Stage 5.0 instead of DGFloer). The brief asks for a full review of the folder, so the findings below cover the whole folder as it stands at this head; most of them are inherited from main, and the gate fails on them regardless of the three-line change. The gate at this head reports blob=29, sorry-data=20, imports=1, mathlib-subimports=5, no-import-mathlib=1, outside-folder=2, and the dependency check reports no UPWARD or CYCLE line for this roadmap (`depcheck: 235 roadmaps, 2061 edges, 0 problem(s)`). `lake env lean` on `Suggested.lean` exits 0 with `sorry` the only non-module-system warning.

## R01 (P1) — Twenty sorried data declarations in `Suggested.lean`

Location: `TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` lines 77, 139, 151–168, 224, 234, 287–308, 348, 369, 397, 428, 434, 489 (gate rule `sorry-data`).

Claim: `nijenhuisTensor`, `realBundleTestSubmodule`, four `realBundleTest*` instances, `realBundleTestOfChart`, `bundleTestSubmodule`, `bundleTestSmul`, four `bundleTest*` instances, `bundleTestOfChart`, `bundleTestRestrictScalars`, `bundleSobolevSubmodule`, `bundleSobolevToDistribution`, `realDistributionComplexify`, `bundleDistributionConjugation`, `complexBesselToL2` are `def`s or `instance`s whose bodies (or proof fields) are `sorry`. Everything downstream (`IsKahler`, `nijenhuisTensor_skew`, `BundleTest`, `BundleDistribution`, `BundleSobolev`, the `*_apply` and `*_continuous_iff` theorems, `complexBesselToL2_*`) mentions one of them.

Witness: line 77–79 `def nijenhuisTensor … := by sorry`; line 96 `IsKahler` uses it; line 153 `instance realBundleTestTopology … := by sorry`.

Repair: delete every sorried `def`/`instance` and every declaration that mentions one. The README keeps the Nijenhuis tensor, the LF test topology, the Sobolev carrier and the complexification maps as targets (K1, K5a); none of them is a headline. If a Kähler predicate is wanted in the file, state it on fields (`∀ X Y smooth, nijenhuisOnFields J X Y = 0`), which has a real body.

## R02 (P1) — Import header: five `Mathlib.<submodule>` lines, no `import Mathlib`, and another roadmap's module

Location: `Suggested.lean` lines 1–9 (gate rules `imports`, `mathlib-subimports`, `no-import-mathlib`).

Claim: the header imports `Mathlib.Analysis.Complex.Basic`, `Mathlib.Analysis.FunctionalSpaces.BesselPotentialSpace`, `Mathlib.Analysis.Distribution.Distribution`, `Mathlib.Geometry.Manifold.VectorField.LieBracket`, `Mathlib.Geometry.Manifold.VectorBundle.ContMDiffSection`, and `TauCetiRoadmap.DifferentialGeometry.Suggested` (used only for `DensityFiber`, line 120–121).

Witness: line 8 `import TauCetiRoadmap.DifferentialGeometry.Suggested`; no line reads `import Mathlib`.

Repair: replace the header by `import Mathlib` followed by the three `TauCeti.*` modules actually used (`TauCeti.Geometry.Symplectic.Manifold.AlmostComplex`, `TauCeti.Geometry.Symplectic.Manifold.TwoForm`, `TauCeti.Analysis.Complex.CauchyIntegralPolydisc`; the last is currently unused and can go). Delete `DensityFiber`: the density fibre is DifferentialGeometry's object and is cited in the README, not re-declared here.

## R03 (P2) — No headline theorem is stated, and the docstring does not say which are not statable

Location: `Suggested.lean` lines 11–22 (module docstring) and the whole file.

Claim: the README's end theorems are Newlander–Nirenberg (K1), the Dolbeault–Grothendieck lemma on polydiscs and the parameter solver (K2), Weierstrass preparation, Rückert's Nullstellensatz, Oka and Cartan coherence and Hartogs extension (K3), Koszul–Malgrange and the flat-bundle/local-system equivalence (K4), elliptic regularity, the Hodge theorem and Serre duality (K5), the Kähler identities, Hodge decomposition, Hard Lefschetz and Hodge–Riemann (K6), the projective, torus, Hopf and Iwasawa computations (K7–K8). The file states none of them; its one theorem that is not an API lemma is `realified_isManifold_analytic` (K3.0, line 35). The docstring says "These are suggested forms, not an exhaustive checklist" and names no missing carrier.

Witness: at the pins, the scalar Dolbeault–Grothendieck lemma for a smooth `(0,1)`-form on a polydisc in `Fin n → ℂ` (coefficients `f : Fin n → (Fin n → ℂ) → ℂ`, `ContDiff ℝ ⊤`, compatibility `∂f_j/∂z̄_k = ∂f_k/∂z̄_j` via `fderiv ℝ`) and Hartogs extension for `DifferentiableOn ℂ` functions on `(Fin n → ℂ)` minus a compact set with connected complement, `2 ≤ n`, are statable with Mathlib carriers only; the one-variable parameter Cauchy–Green identity `∂̄_z T(χ f) = χ f` is statable with `fderiv ℝ` and the Lebesgue integral.

Repair: state the statable headlines (at least the two above, and the compact-Riemann-surface constancy statements that use `MDifferentiable` on `OnePoint ℂ`), and list in the docstring each headline that is not statable with the carrier it lacks (Dolbeault cohomology and the Hodge star need the DifferentialGeometry form carrier, which is not at the pins; Serre duality needs the holomorphic-bundle mixin of ComplexManifolds Milestone 7).

## R04 (P2) — K7.2 re-plans the CW structure of ℂPⁿ that AlgebraicTopology Stage 4.6 now owns

Location: `README.md` lines 1459–1462 ("construct on this same carrier Mathlib's `CWComplex` structure with one cell in each even dimension 0,2,…,2n and none in odd dimensions, specifying its characteristic maps and skeleta. The CW construction uses only K7.1 and AlgebraicTopology Stage 4") and lines 1668–1669 ("K7.2's CW construction uses K7.1 and AT Stage 4 before AT Stage 7").

Claim: two owners for one object. At this pull request's head, `TauCetiRoadmap/AlgebraicTopology/README.md` lines 825–831 construct complex projective n-space on `Projectivization ℂ (Fin (n+1) → ℂ)` as a finite CW complex with one cell in each even dimension, with the characteristic maps `z ↦ [z : √(1−|z|²)]`, and say "ComplexKahlerGeometry K7 consumes that topology and this cell structure"; line 1817–1822 repeats it. This pull request moved the ownership there (commit fa7b83e) but did not rewrite K7.2 to consume it.

Witness: AlgebraicTopology README line 826–830 at head versus ComplexKahlerGeometry README line 1460–1463.

Repair: in K7.2, replace the construction sentence by "Consume AlgebraicTopology Stage 4.6's finite CW structure on `Projectivization ℂ (Fin (n+1) → ℂ)` (one cell in each even dimension, characteristic maps `z ↦ [z : √(1−|z|²)]`)" and keep only the cellular/cup calculation `H*(ℂPⁿ;ℤ)=ℤ[u]/(u^(n+1))`, the hyperplane normalization and the de Rham/Chern–Weil comparison; update the order paragraph at lines 1668–1669. In the same passage, line 1475 "AT 8.12 consumes that later comparison" is stale: AlgebraicTopology's dependency table at head (line 2431) says 8.12 uses "no projective carrier or external comparison"; the finite-to-infinite comparison is CharacteristicClasses C1.5/C1.6's (CharacteristicClasses README lines 57–61). Delete the AT 8.12 clause.

## R05 (P2) — Two-way supply with RealAnalyticGeometry

Location: `README.md` lines 280–284 ("RealAnalyticGeometry R3.2 consumes this colimit theorem"), 424–428 ("R1 local finiteness and compactness of V give finitely many such pieces … RealAnalyticGeometry R5 supplies the global compatible triangulation"), 1337–1341 ("Consume RealAnalyticGeometry R0–R5"), 1688–1692 ("Within K3 … precede RealAnalyticGeometry R1's local semianalytic/component results; those results then supply K3's finite regular-piece partition").

Claim: `TauCetiRoadmap/RealAnalyticGeometry/README.md` on main consumes this roadmap at three places: line 173 ("The proof uses CK K3's convergent Weierstrass preparation and division"), R3.2 item 0 lines 734–739 (the RingCat structure sheaf and `O_U ≅ O_W|_U` "supplied by CK K4"), and R3.1 (K5b.0's Dolbeault adjoint and principal symbol `½|ξ|² Id`). This roadmap consumes RealAnalyticGeometry R1 in K3 and R0–R5 in K6.1. The chain K3/K4/K5b → RAG R1–R5 → K3's partition and K6.1 is a cycle between the two roadmaps' layers. The mechanical check does not report it because both roadmaps are on main, which the check treats as consumable by anyone; the pull request's stated purpose is to cut exactly such loops among roadmaps on main, and this one is left standing.

Witness: RealAnalyticGeometry README line 173 (`CK K3`), line 735 (`CK K4`); ComplexKahlerGeometry README line 1337 (`RealAnalyticGeometry R0–R5`).

Repair: make the supply one-directional. RealAnalyticGeometry R3–R5 depend on K4 and K5b, so the consumer of R5 cannot be this roadmap: move K6.1's analytic-cycle triangulation and integral fundamental class (the paragraph from "For singular V, consume K3's finite regular-piece partition" to the end of K6.1) into "ComplexKahlerGeometry, Part II", placed after RealAnalyticGeometry, with the introduction saying where this roadmap stops (the real de Rham functional of `∫_(V_reg)`). In K3, prove the finiteness of the regular-piece partition from local parametrization and compactness here (it needs no semianalytic normal decomposition) and drop the R1 citation; delete the consumer sentences at lines 280–284 and 1688–1692 or rewrite them to say that RealAnalyticGeometry consumes K2–K5b.

## R06 (P2) — Two-way supply with PseudodifferentialOperators

Location: `README.md` lines 46–53 ("PseudodifferentialOperators P1.0 supplies differential-operator carriers, jets, symbols and formal density adjoints after K5a's initial density-line construction and before its analytic scale"), 573–577 ("Its pointwise real star, orientation line and density bundle precede PDO P1.0. Its distributional operator action and Laplace analysis then consume P1.0's operator and symbol core"), 1647–1652 ("PDO P1.0 consumes that density bundle").

Claim: `TauCetiRoadmap/PseudodifferentialOperators/README.md` on main has a supplier contract "From TauCetiRoadmap.ComplexKahlerGeometry. K5a supplies bundle distributions, the shared compact-bundle H^s Hilbert scale … Consume that scale" (lines 91–95), `*Needs:* P1.0 differential operators; ComplexKahlerGeometry K5a's smooth-section Fréchet topology` (line 529) and "CKG K5a consumes this predicate" (line 441). The roadmap-level graph is K5a(early) → P1.0 → K5a(late) → P1.1 onward: each roadmap is the other's supplier. The dependency check for PseudodifferentialOperators run with the same order file reports only its UPWARD edge to VonNeumannAlgebras, not this pair, for the same reason as in R05.

Witness: PseudodifferentialOperators README lines 91–95 and 529; ComplexKahlerGeometry README lines 573–577 and 1650.

Repair: one owner upstream. PseudodifferentialOperators is listed at position 8 of the merge order and this roadmap is unlisted, so move the pre-P1.0 part of K5a (the density line `DensityBundle M`, `BundleTest`, `BundleDistribution`, the Fréchet section topology and the Montel instance) into PseudodifferentialOperators P1.0's smooth-section floor and consume them here; K5a then starts at the Hilbert scale. The alternative (P1.0's operator core moves here and PseudodifferentialOperators consumes all of K5a) also works; either way the two READMEs must agree.

## R07 (P3) — Pull-request numbers and pinned-commit links as supplier citations

Location: `README.md`, 24 occurrences of "#279"/"#280" (for example lines 17, 28, 1551 and 1668: "#279 Milestones", "#280 Milestone 1", "ComplexManifolds #279 Milestone 4"), and the 29 `github.com/…/blob/<sha>/…` links the gate lists (lines 26, 29, 31, 35, 41, 45, 53, 199, 200, 345, 472, 475, 572, 573, 1049, 1051, 1059, 1063, 1065, 1153 and the mccorvie/Paul-Lez fork links at lines 1489–1497 and 1592).

Claim: cross-roadmap citations must name the roadmap and its section, never a pull-request number or a commit-pinned path; ComplexManifolds and ComplexTori are on main with Milestones 1–7 and 1–5 respectively, so "#279 Milestone 2.1" is "ComplexManifolds Milestone 2.1".

Witness: `ComplexManifolds/README.md` line 197 `## Milestone 2: the canonical real orientation`; `ComplexTori/README.md` line 130 `## Milestone 1: fixed complex tori`.

Repair: replace each "#279" by "ComplexManifolds", each "#280" by "ComplexTori", and each blob link by the roadmap name and section (DifferentialGeometry Layer 0.4, GlobalHolomorphicFunctions Layer 0.3/2.5/4.1/7.2, VariationalMethods §2.2–2.4, §3.1, §5.1–5.2, OperatorTheory/UnboundedOperators §4.7, PlanarTopology Layer 6, SurfaceTopology Layers 2–3/6/8, ComplexComparisonPartII C−1.1/C0.4/C5.1–C5.2, FormalConnectionsOpers F2.4, LieGroupoidsPoisson §G1.3a).

## R08 (P3) — Citation labels that do not resolve in the suppliers' own numbering

Location: `README.md` lines 572, 1049, 1059, 1063, 1065, 1153, 1653, 1656 (VariationalMethods "V2–V5.2", "V5.1", "V2.2–V2.4", "V3–V4", "V5.1–V5.2", "V3.1"), lines 35, 981 and 1637 ("GlobalHolomorphicFunctions GH5.1" for the exactness of every smooth complex 2-form), lines 1551, 1598 and 1683 ("LieGroupoidsPoisson G1.3").

Claim: VariationalMethods (pull request #1028) numbers its sections 2.2–2.4, 3.1, 3–4, 5.1–5.2 and never uses a "V" prefix, which is why the resolver lists V5.1 and V2.2 as found nowhere; in GlobalHolomorphicFunctions (pull request #992) two-form exactness is Layer 7.2 ("Planar coordinate forms and two-form exactness", line 1807), while 7.1 is the global solvability theorem; LieGroupoidsPoisson's standalone Chevalley–Eilenberg complex is §G1.3a (its README lines 85–86 and 2020–2021 say "K8 consumes §G1.3a").

Witness: VariationalMethods README line 839 `### 5.1 The compact-pair specialization`; GlobalHolomorphicFunctions README line 1807; LieGroupoidsPoisson README line 638 `**G1.3a, the algebroid complex.**`.

Repair: cite "VariationalMethods §5.1" (and §2.2–2.4, §3–4, §3.1, §5.1–5.2), "GlobalHolomorphicFunctions Layer 7.2", "LieGroupoidsPoisson §G1.3a".

## R09 (P3) — Padding in `Suggested.lean`

Location: `Suggested.lean` lines 55–66 (`dbarFunction_apply_J`, `dbarFunction_eq_zero_iff`), 88–91 (`nijenhuisTensor_skew`), 106–115 (`memSobolev_iff_bundled`, proved), 243–284 (`bundleTestComplexModule`, `bundleTestScalarTower`, proved field by field), 275–276 (`bundleTest_smul_apply`, `rfl`), 360–361, 383–385, 393–394, 405–409, 413–416, 503–506 (all proved in one term), 484–486 (`complexBesselDistributionMultiplier_real`).

Claim: these are API lemmas that restate a definition or follow in one step. Probe on a scratch copy: after `simp [dbarFunction, TauCeti.SmoothAlmostComplexStructure.apply_apply]` the goal of `dbarFunction_apply_J` is the scalar identity `(a' − i a)/2 = −i(a + i a')/2` with `a = df(v)`, `a' = df(Jv)`, and `dbarFunction_eq_zero_iff` reduces to `a + i a' = 0 ↔ a' = i a`; both are closed by `Complex.I_mul_I` and `ring`. `memSobolev_iff_bundled` is proved by `⟨hu.toBesselPotentialSpace, rfl⟩` and `v.memSobolev_toDistr`, i.e. two pinned declarations. `nijenhuisTensor_skew` is a statement about the sorried tensor of R01. `complexBesselDistributionMultiplier_real` is the identity `exp((s/2) log(1+|ζ|²)) = (1+|ζ|²)^(s/2)` (not `rfl` at the pin: `TemperedDistribution.besselPotential` is defined with the power symbol).

Repair: delete them from `Suggested.lean`; the README keeps the type law of `∂̄`, the skew-symmetry of N and the bundled/unbundled Sobolev comparison as Checks and API bullets.

## R10 (P3) — Edits outside the folders this pull request owns

Location: `Completed/ArithmeticDirichletSeries/README.md` line 331 and `TauCetiRoadmap/SymplecticGeometry/README.md` line 77 (gate rule `outside-folder`).

Claim: the pull request's own folders, as named in the brief, are the fourteen roadmap folders listed there; these two files are outside them (one-sentence consumer rewrites).

Witness: `git diff --stat origin/main...HEAD` restricted to paths outside the named folders lists exactly these two files.

Repair: either move the two sentences into a pull request that revises those roadmaps, or have the brief's list of owned folders extended; the review cannot accept a change outside the named folders.

## R11 (P3) — README shape: no Checks, no supplier-contract section, locators missing, undeclared Lean names

Location: whole `README.md`; in particular the title line 1 (`# Complex manifolds, Dolbeault theory, and Kähler geometry`, not `# Roadmap: …`), the absence of `**Summary.**`, `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build`, `### Examples` and `### Dependencies` per layer, and of any `**Checks.**` list; the reference list at lines 1694–1703 (Wells without chapter or theorem; Griffiths–Harris "chapter 0" for Dolbeault and Kähler foundations without section); process wording at line 67 ("the prototypes use that native carrier to pin these preservation laws during its migration") and in the Lean docstring ("these prototypes do not prove the analytic targets"); LaTeX macros inside code spans at lines 120–121 (`φ_{\bar z}d\bar z`); backticked names of this roadmap's own that `Suggested.lean` does not declare: `DensityBundle M` (line 626), `RealBundleSobolev V 0` (line 785), `BundleSobolev E s` with the signature `(E, s)` (lines 728 and 892; the Lean `BundleSobolev` takes `F V n q G localize s`).

Claim: the definitions of K5a (the density bundle, `BundleTest`, `BundleDistribution`, `BundleSobolev`, the complexification maps) and of K3 (holomorphic stalk, meromorphic germ field) have API prose but no `**Checks.**` bullets, so the three-Checks rule fails for every definition; several sampled targets (Parameter Cauchy–Green, K4.ComponentwiseFiniteRankAssembly, K5a.DistributionLocalStructure, K5a.SmoothSectionMontel, K5a.ComponentwiseCompact, K5b.0, K7.1) carry no locator at all.

Repair: bring the README to the TauCetiRoadmap form (title, Summary, Scope and ownership, Conventions, Exact supplier contracts, layers with Examples and Dependencies), add at least three discriminating Checks per definition (for example for `dz_j♯`: with `H = I` the value `2∂_(z_j)` and the failure of the dual-frame normalization `∂_(z_j)`; for the pointwise star: `*² = (−1)^(k(m−k))` on `k = 1, m = 2` giving `−1`; for the Hopf computation: the weight `2^(1−m−n)` of `z₁^(−m)z₂^(−n)dz_j` at `m = n = 1`), give each theorem a locator (Demailly chapter II §4.2 for Weierstrass preparation, II (4.22) for the Nullstellensatz, II (4.29) and (4.31) for coherence and the singular locus; Wells chapter IV §§4–5 for Hodge theory and Serre duality), remove the process wording, write `φ_z̄` and `dz̄` in Unicode, and either declare `DensityBundle`/`RealBundleSobolev` or unbacktick them.

## Verified sound

**Gate and build.** `lake env lean TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` from the worktree: exit 0, 37 `declaration uses sorry` warnings and module-system warnings only. A `#check @name` file for all 32 declarations elaborated (exit 0): the sorried `def`s `dbarFunction`, `nijenhuisOnFields`, `nijenhuisTensor`, `IsKahler` drop the section binders `[CompleteSpace E] [FiniteDimensional ℝ E] [T2Space M]` their types do not mention, as expected; the theorems keep them; every bundle declaration carries its instance binders explicitly. Dependency check: `depcheck: 235 roadmaps, 2061 edges, 0 problem(s)`, no UPWARD, no CYCLE, no `moved:` line.

**Adversarial table** (values computed on each side; conventions as the README pins them).

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `g(u,v)=ω(u,Jv)`, `h_T=g+iω` conjugate-linear in the first slot (Conventions) | `h_T(Ju,v)` | `g(Ju,v)=ω(Ju,Jv)=ω(u,v)`, `ω(Ju,v)=−g(u,v)`; `h_T(Ju,v)=ω−ig=−i·h_T(u,v)` | sound |
| `h_T(u^(1,0),v^(1,0))=2g_ℂ(bar u^(1,0),v^(1,0))` | general `u,v`, `u^(1,0)=(u−iJu)/2` | `g_ℂ((u+iJu)/2,(v−iJv)/2)=(1/4)(2g(u,v)+2iω(u,v))=h_T(u,v)/2`; twice gives `h_T(u,v)` | sound |
| `ω=(i/2)Σh_T(∂_(z_k),∂_(z_j))dz^j∧dbar z^k` gives `Σdx^j∧dy^j` for `h_T=δ` | `n=1` | `(i/2)(dx+idy)∧(dx−idy)=(i/2)(−2i)dx∧dy=dx∧dy` | sound |
| `dd^c=2i∂∂̄` with `d^c=i(∂̄−∂)` | symbolic | `(∂+∂̄)i(∂̄−∂)=i(∂∂̄−∂̄∂)=2i∂∂̄` | sound |
| `∂̄²f(X,Y)=−(1/4)∂f(N(X,Y))` on `(0,1)` fields, `N=[JX,JY]−[X,Y]−J[JX,Y]−J[X,JY]`, no `1/2` in `dα` | `JX=−iX`, `JY=−iY` | `N(X,Y)=−2[X,Y]+2iJ[X,Y]=−4[X,Y]^(1,0)`; `d(∂̄f)(X,Y)=[X,Y]f−∂̄f([X,Y])=∂f([X,Y]^(1,0))`; hence `=−(1/4)∂f(N(X,Y))` | sound |
| `N(X^(0,1),Y^(0,1))=N(X,Y)^(1,0)` | `X=X^(1,0)+X^(0,1)` | `N(JX,Y)=−JN(X,Y)` puts `N(X^(1,0),·)` in `T^(0,1)` and `N(X^(0,1),·)` in `T^(1,0)`; mixed terms vanish; the `(1,0)` part is `N(X^(0,1),Y^(0,1))` | sound |
| Chern connection `A=h⁻¹∂h`, `h′=g*hg`, `A′=g⁻¹Ag+g⁻¹dg` (columns, `h_ij=h(e_i,e_j)`) | rank `r`, `s=ev` | metric compatibility `dh=A*h+hA` with `A` of type `(1,0)` forces `∂h=hA`; frame change gives `A′=g⁻¹Ag−d(g⁻¹)g=g⁻¹Ag+g⁻¹dg` | sound |
| `ω_FS=(i/2π)∂∂̄log(1+|z|²)`, `∫_(ℙ¹)ω_FS=1`, `Θ(O(1))=−2πiω_FS` | `n=1` | `(i/2π)∂∂̄log(1+|z|²)=(1/π)(1+|z|²)^(−2)dx∧dy`, integral `1`; `c₁=(i/2π)Θ=ω_FS` | sound |
| `*²=(−1)^(k(m−k))`, `d*=(−1)^(m(k+1)+1)*d*` | `m=2,k=1`; `m=3,k=1` | `*²=−1` on 1-forms of a surface; `d*=−*d*` on 1-forms in dimension 3 | sound |
| Hodge Laplacian on functions is `−div grad` | `ℝⁿ` | `d*df=−Σ∂_i²f` | sound |
| `|dz_j|²_Gram=2(H⁻¹)_jj`, `dz_j♯=2Σ_k(H⁻¹)_kj∂_(z_k)` | `H=I`, `n=1` | `|dx+idy|²=2`; `⟨∂_x−i∂_y,∂_x⟩=1=dz(∂_x)`, `⟨∂_x−i∂_y,∂_y⟩=i=dz(∂_y)`; general `H`: `Σ_k conj(c_k)H_kl=2δ_jl` gives `c_k=2(H⁻¹)_kj` | sound |
| unitary coframe `φ` has Gram norm `√2`, `e_φ i_φ+i_φ e_φ=2δ` | `n=1` | `ψ=φ/√2` orthonormal gives `1`; rescaling by `2` | sound |
| `*:Ω^(p,q)→Ω^(n−q,n−p)`, `barStar:Ω^(p,q)→Ω^(n−p,n−q)`, `∂̄*=−*∂*` | `n=1,(p,q)=(1,0)` | `*dz∝dz` type `(1,0)=(n−q,n−p)`; `barStar dz∝dbar z` type `(0,1)` | sound |
| `σ(Δ_∂̄)=½|ξ|²Id` | flat `ℂⁿ` | `Δ_d=2Δ_∂̄`, `σ(Δ_d)=|ξ|²` | sound |
| `[Λ,L]=n−k`, `[Λ,∂̄]=−i∂*`, `[Λ,∂]=i∂̄*`, `[Λ,d]=−(d^c)*`, `[L,d*]=d^c` | symbolic | `[Λ,d]=i(∂̄*−∂*)`, `(d^c)*=−i(∂̄*−∂*)`; `[L,d*]=i∂̄−i∂=d^c` | sound |
| Hodge–Riemann sign `i^(p−q)(−1)^(k(k−1)/2)∫α∧bar α∧ω^(n−k)/(n−k)!>0` | `n=1,(p,q)=(1,0)` | `i∫α∧bar α`, `α=f dz`: `i|f|²dz∧dbar z=2|f|²dx∧dy>0` | sound |
| `[iΘ(E),Λ]≥ka` on `(n,k)` forms from Nakano `iΘ≥aω⊗Id` | `k=1` | eigenvalue sum `λ₁+…+λ_k≥ka` | sound |
| `K_(ℙ¹)≃O(−2)` from `dz=−w⁻²dw`; `H¹(O(−1))=0`, `h⁰(O(−1))−h¹(O(−1))=0` | `w=1/z` | transition `−w⁻²` of degree `−2`; Serre: `h¹(O(−1))=h⁰(O(1)⊗O(−2))=h⁰(O(−1))=0` | sound |
| `h⁰(O(k))=binomial(n+k,n)`; torus `h^(p,q)=binomial(n,p)binomial(n,q)`; curve `h^(0,1)=g`, `b₁=2g` | `n=1,k=2`; `n=1`; `g=1` | `3`; `1,1,1,1`; `h^(0,1)=1=b₁/2` | sound |
| Hopf `h^(0,1)=1`, `h^(1,0)=0`, `h^(1,1)=0`, `b_k=Σh^(p,q)` | weights of `z^α` (`2^d`), `z^αdz_j` (`2^(d+1)`), `z₁^(−m)z₂^(−n)dz_j` (`2^(1−m−n)`) | coinvariants of `𝒪(ℂ²)` are the constants (`ℂ`); no weight `1` for `Ω¹` in either `H⁰` or `H¹`; `b₁=1=0+1`, `b₂=0`, `b₃=1=h^(2,1)+h^(1,2)=1+0` | sound |
| Iwasawa `h^(1,0)=3`, `h^(0,1)=2`, `b₁=4` | Sakane example, Angella table | `sakane-parallelisable` line 339: `h^(0,1)=h^(0,2)=2`, `h^(1,0)=3`; `angella-iwasawa` lines 701, 719, 724: `b₁=4`, `3`, `2` | sound |
| Frölicher `d_r:E_r^(p,q)→E_r^(p+r,q−r+1)` | `r=1` | `∂:H^(p,q)_∂̄→H^(p+1,q)_∂̄` | sound |
| Laurent coefficient of order `−k`: `(2πi)⁻¹∮f(z)(z−a)^(k−1)dz` | `f=(z−a)^(−k)` | `(2πi)⁻¹∮(z−a)^(−1)dz=1` | sound |
| `exp(1/‖x‖²)` nonextension: lower bound `C′εⁿexp((1+c)^(−2)ε^(−2))` versus `Cε^(−N)` | `0<c<1/4`, support in `|x|∈[ε(1−c),ε(1+c)]` | `exp(1/|x|²)≥exp(((1+c)ε)^(−2))` on the support, volume `(cε)ⁿ‖φ‖₁`; exponential beats every power | sound |
| `⟨δ^(n)/n!,φ⟩=2ⁿ` for `φ=1/(1+2x)` near `0` | `n=0,1,2` | `φ^(n)(0)/n!=(−2)ⁿ`, sign `(−1)ⁿ` gives `2ⁿ`: `1,2,4` | sound |
| `H_m(t)=t_+^(m−1)/(m−1)!` is `C^(m−2)`, `D^mH_m=δ` | `m=2` | `t_+` is `C⁰`, `D²t_+=δ` | sound |
| Peetre `〈ζ+η〉^s≤2^(|s|/2)〈ζ〉^s〈η〉^|s|` | `s=1`, `ζ=η` | `〈2ζ〉≤√2〈ζ〉²` holds since `1+4|ζ|²≤2(1+|ζ|²)²` | sound |
| `B_F(f,g)=B₀(f,Rg)`, `Rg(x)=g(−x)` | Plancherel bilinear | `∫f̂ĝ=∫f·(ĝ)^=∫f(x)g(−x)dx` | sound |
| link in codimension one: `H̃₀(c points)=ℤ^(c−1)`, local group `ℤ` forces `c=2` | `c=1,2,3` | `0,ℤ,ℤ²` | sound |
| `OnePoint.equivProjectivization`: `t↦[t:1]`, `∞↦[1:0]` | pin | `Mathlib/Topology/Compactification/OnePoint/ProjectiveLine.lean` line 84 | sound |
| `dbarFunction` (Lean) `=(df(v)+i df(Jv))/2` vanishes for holomorphic `f` | `df(Jv)=i df(v)` | `(a+i·ia)/2=0` | sound |
| last nonzero lower-central ideal is central, positive-dimensional, proper | nonabelian nilpotent `𝔤` | `[𝔤,𝔤^(m)]=0`, `𝔤^(m)≠0`, `𝔤^(m)⊆[𝔤,𝔤]≠𝔤` | sound |
| sampled "Parameter Cauchy–Green": `∂̄_zT(χf)=χf`, joint smoothness, `∂̄_(q_j)T(χf)=T(χ∂̄_(q_j)f)` | `T g(z)=(1/π)∫g(ζ)/(z−ζ)dA(ζ)`, kernel `1/(πζ)` locally integrable | differentiation under the integral on the fixed compact support of `χ`; holomorphy off `tsupport χ` | sound |

**Library declarations opened at the pins** (Mathlib `358314d`, Tau Ceti `fb13df7`): `MDifferentiable.isLocallyConstant` and `exists_eq_const_of_compactSpace` (`Mathlib/Geometry/Manifold/Complex.lean` 154–171; the former needs `[CompactSpace M]`, the latter adds `[PreconnectedSpace M]`, as the README states); `differentiableAt_complex_iff_differentiableAt_real`, `real_linearMap_map_smul_complex`, `ContinuousLinearMap.complexOfReal` (`Analysis/Complex/Conformal.lean` 206–217); `ContDiffAt.to_localInverse` (`Analysis/Calculus/ImplicitContDiff.lean`), `ContDiffAt.implicitFunction` (`Analysis/Calculus/Implicit.lean`); `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` (`Analysis/Analytic/Uniqueness.lean` 223); `MvPolynomial.mul_esymm_eq_sum`, `PowerSeries.IsWeierstrassFactorization`, `meromorphicOrderAt_eq_int_iff`, `smoothSheafCommRing`, `isUnit_stalk_iff`, `Opens.overPullbackSheafEquivOver`, `sheafRestrict`, `TestFunction.continuous_iff_continuous_comp`, `TemperedDistribution.MemSobolev`, `memSobolev_zero_iff`, `fourierMultiplierCLM`, `besselPotential`, `toLpₗᵢ`, `Complex.HadamardThreeLines.norm_le_interp_of_mem_verticalClosedStrip'`, `SchwartzMap.fourier_convolution`, `MontelSpace`, `ContinuousLinearEquiv.toCompactConvergenceCLM`, `Complex.starConvex_one_slitPlane`, `OnePoint.equivProjectivization`, `RelCWComplex`/`CWComplex`, `IsCoercive.continuousLinearEquivOfBilin`, `Orientation.volumeForm`, `SpectralObject`, `LinearMap.det_restrictScalars`, `Algebra.norm_complex_eq`; Tau Ceti `riemannianVolume`, `isLocallyFiniteMeasure_riemannianVolume` (`Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean`), `ImplicitFunctionData.analyticAt_implicitFunction` (`Analysis/Analytic/Inverse.lean`), `analyticAt_circleIntegral`, `analyticOnNhd_circleIntegral`, `analyticOnNhd_iff_differentiableOn_of_finiteDimensional`, `DifferentiableOn.analyticOnNhd_of_finiteDimensional` (`Analysis/Complex/CauchyIntegralPolydisc.lean`), `SmoothAlmostComplexStructure` with `square_neg` and `apply_apply` (`Geometry/Symplectic/Manifold/AlmostComplex.lean` 67–122), `SmoothTwoForm.Compatible` (`Geometry/Symplectic/Manifold/TwoForm.lean` 157). Not at the pins (so not citable as existing): a topology on `Projectivization` (AlgebraicTopology 4.6 owns it), Tau Ceti `TopCat.serreFibrations`, `CochainComplex.spectralObject`, `coreE₂Cohomological`, `contMDiff_iff_mdifferentiable`, `IsManifold.restrictScalars_of_ne_zero`, `isFractionRing_meromorphicGerms`, `Projectivization.instIsManifold` (the STATUS file describes these as later Tau Ceti work; the README does not claim them).

**Cross-roadmap citations resolved** (main or the named heads): ComplexManifolds Milestones 1–7 (items 7.4–7.5) and `OnePoint` atlas; ComplexTori Milestone 1; DifferentialGeometry Layers 0, 1, 2, 5, 5.6, 6, 8, 9, 12 and the names `legacySmoothTwoFormEquiv`, `legacySmoothTwoFormEquiv_isClosed_iff`, `mextDeriv`, `mpullback`, `wedgeWith`, `OrientationLift`, `IsOrientationPreservingAt`, `homotopyOperator`, `Density`, `RoughDensity`, `integralTopForm_eq_integralDensity`, `deRhamHom`, `laplaceBeltrami` (DifferentialGeometry `Suggested.lean` 138–3219); SmoothBundlesConnections B1.0–B1.5, B2.1–B2.5, B3.1–B3.3, B4.1–B4.2, B5.0–B5.2, B6.0–B6.6; PseudodifferentialOperators P1.0 (line 164), P1.1 (= 1.2, line 507), P5 (Layer 5), P7 (Layer 7); PDE Lane A (A.3 at line 542) and Lane B; GlobalHolomorphicFunctions (pull request #992) Layer 0.3 compact-support Cauchy–Green, Layer 2.5 `exists_finite_rank_runge_operator` "used by GH5 and CKG K2" (line 953), Layer 4.1 principal parts, Layer 7.1–7.2; ComplexComparisonPartII (#848) C−1.1, C0.4, C5.1, C5.2; FormalConnectionsOpers (#1056) F2.4; VariationalMethods (#1028) §2.2–2.4, §3.1, §3–4, §5.1–5.2 (`CompactFormPair.operator`); OperatorTheory/UnboundedOperators (#1027) §4.7 (UO-D06, `closedFormOperator`); LieGroupoidsPoisson §G0.1, §G1.3/§G1.3a, §G1.6; HamiltonianReduction R5; Hyperfunctions HF5; GeometricQuantization (#1186) Q2; GeometricTopology Layer 11; RealAlgebraicGeometry Layer 7; HopfRinow Layer 1 (owns the Levi-Civita connection); CharacteristicClasses C1.5; RiemannianGeometry R7 (R7.1–R7.8 is one section); PlanarTopology (#271) Layer 6 `Surface.Orientation`; SurfaceTopology (#271) Layers 2, 3, 6, 8; AlgebraicTopology at this head Stage 4.5, 4.6, 4.7 (`simplicialRealizationCW`), 4 (`cwSubcomplexNeighborhoods`), 5.0, 6.3, 8.3, 8.12; RealAnalyticGeometry R0–R5, R1, R3.1, R3.2. Direction: DGFloer on main still consumes K7.1–K7.2 and this roadmap no longer cites DGFloer, so that loop is cut on this side; HeegaardFloer, GeometricCurrents, SpinGeometry, RiemannianGeometry, CharacteristicClasses, IndexTheory, PositiveScalarCurvature, RelativisticQuantumFieldTheory consume this roadmap and are not cited as suppliers. Ownership against the open pull requests whose files the brief gives was checked by object for the CW structure of ℂPⁿ (AlgebraicTopology, R04), the filtered-complex spectral sequence (AlgebraicTopology 5.0), the Fréchet/LF section carriers (no other owner found), and the real Hodge star (no other owner found).

**Sources at their locators** (seeded sample). Łojasiewicz, §3 Theorem 2, printed p. 464: `lojasiewicz-triangulation` line 512–515 (countable real analytic manifold, locally finite semi-analytic family, properties (a)–(c); (b) is the analytic-isomorphism-onto-a-submanifold condition the README requires) — supports K6.1 as written. Demailly chapter II: `demailly-agbook` line 4842 ((4.29) Theorem, Cartan: the ideal sheaf of an analytic set is coherent), line 4929 ((4.31) Theorem: the singular locus is an analytic subset), line 4742 ((4.22) Nullstellensatz `I(V(𝔞))=√𝔞`), §4.4 at line 4825 — the K3 locators "chapter II §4.4, Theorem 4.29 / 4.31" are right. Sakane: `sakane-parallelisable` line 46 (Theorem 1), lines 106–115 (the central subgroup `A=C^m(G)`, `A∩Γ` a lattice and `AΓ` closed citing Raghunathan, the holomorphic principal torus bundle; printed p. 189), line 339 (the example's `h^(0,1)=h^(0,2)=2`, `h^(1,0)=3`) — supports K8 and K8.NilpotentCentralReduction as written. Angella: `angella-iwasawa` lines 700–705 (de Rham table, `b₁=4`), 717–724 (`h^(1,0)=3`, `h^(0,1)=2` at `t=0`) — supports the K8 values. Of the fourteen sampled targets, Parameter Cauchy–Green, K3.HolomorphicStalk (Demailly II §4.2 and (4.22)), K3.MeromorphicGermField, K4.ComponentwiseFiniteRankAssembly, K5a and its four named sub-targets, K5b and K5b.0–K5b.1, K7.1 and K7.2 cite no printed source and were checked as the roadmap's own constructions by the table above; K8.NilpotentCentralReduction against Sakane as recorded.

## Not verifiable

- Webster, *A new proof of the Newlander–Nirenberg theorem*, Math. Z. 201 (1989): the sources service resolves it only to a paywalled page (publisher prefix 10.1007); cited by locator alone, `uncertified`. The README's description of the route (Henkin homotopy operator on strictly convex domains, Hölder–Zygmund gain, Nash–Moser iteration) is consistent with the published abstract but was not checked against the text.
- Griffiths–Harris, *Principles of Algebraic Geometry*, chapter 0, and Wells, *Differential Analysis on Complex Manifolds*: books not available from a legal open source; the K3 and K5 statements attributed to them were checked mathematically in the table, not against the text.
- The board manifest `packages/ComplexKahlerGeometry/sources.toml` records `ballmann-kahler` (for "K6.0"), `berwick-evans-tripathy` (for "K7.FlatDegreeZero"), `knutson-borel-weil` (for "K7.2.TautologicalIncidence") and `lojasiewicz-triangulation`; the README has no targets named K7.FlatDegreeZero or K7.2.TautologicalIncidence and does not list the first three works, while Demailly, Sakane, Angella, Webster, Griffiths–Harris and Wells are not in the manifest. The manifest is not part of this pull request and was not edited; the three texts fetched for this review were recorded in scratch copies only.

## Source issues

- none
