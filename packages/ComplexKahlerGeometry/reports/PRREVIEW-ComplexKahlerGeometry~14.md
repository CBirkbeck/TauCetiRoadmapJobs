# Review of ComplexKahlerGeometry (pull request #1807 at 1745f50)

**Verdict:** needs changes

Incremental re-review of 0 changed lines in `TauCetiRoadmap/ComplexKahlerGeometry/` since fa7b83e, the head the previous review read. Against main the pull request still changes only three sentences of `README.md` (the K5a star consumer sentence at line 609, and the two K8 sentences at lines 1538 and 1613 that consume AlgebraicTopology Stage 5.0 instead of DGFloer); `Suggested.lean` is byte-identical to main. The commits since fa7b83e touched only sibling folders (BordismFormalGroups, CharacteristicClasses, TopologicalKTheory) and dropped the two hunks outside the pull request's folders. Of the previous review's eleven findings one is repaired (the out-of-folder edits); the other ten stand unchanged, because nothing in the folder changed, and they are written again below. The gate at this head reports blob=29, sorry-data=20, imports=1, mathlib-subimports=5, no-import-mathlib=1, build=35 (all 35 are lake's module-system advisories for the `TauCetiRoadmap.DifferentialGeometry.Suggested` import, see R02), outside-folder=0, depcheck=0; the dependency check reports no UPWARD or CYCLE line.

## R01 (P1) — Twenty sorried data declarations in `Suggested.lean`

Location: `TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` lines 77, 139, 151–168, 224, 234, 287–308, 348, 369, 397, 428, 434, 489 (gate rule `sorry-data`, 20 hits).

Claim: `nijenhuisTensor`, `realBundleTestSubmodule`, the four `realBundleTest*` instances, `realBundleTestOfChart`, `bundleTestSubmodule`, `bundleTestSmul`, the four `bundleTest*` instances, `bundleTestOfChart`, `bundleTestRestrictScalars`, `bundleSobolevSubmodule`, `bundleSobolevToDistribution`, `realDistributionComplexify`, `bundleDistributionConjugation` and `complexBesselToL2` are `def`s or `instance`s whose bodies or proof fields are `sorry`. Everything downstream (`IsKahler`, `nijenhuisTensor_skew`, `BundleTest`, `BundleDistribution`, `BundleSobolev`, the `*_apply` and `*_continuous_iff` theorems, `complexBesselToL2_*`) mentions one of them.

Witness: lines 77–79 `def nijenhuisTensor … := by sorry`; line 96 `IsKahler` uses it; lines 151–153 `instance realBundleTestTopology … := by sorry`.

Repair: delete every sorried `def`/`instance` and every declaration that mentions one. The README keeps the Nijenhuis tensor, the LF test topology, the Sobolev carrier and the complexification maps as targets (K1, K5a); none of them is a headline. If a Kähler predicate is wanted in the file, state it on fields (`∀ X Y smooth, nijenhuisOnFields J X Y = 0`), which has a real body.

## R02 (P1) — Import header: five `Mathlib.<submodule>` lines, no `import Mathlib`, and another roadmap's module

Location: `Suggested.lean` lines 1–9 (gate rules `imports`, `mathlib-subimports`, `no-import-mathlib`; the 35 `build` lines are the module-system advisories lake prints for the imported `TauCetiRoadmap.DifferentialGeometry.Suggested`).

Claim: the header imports `Mathlib.Analysis.Complex.Basic`, `Mathlib.Analysis.FunctionalSpaces.BesselPotentialSpace`, `Mathlib.Analysis.Distribution.Distribution`, `Mathlib.Geometry.Manifold.VectorField.LieBracket`, `Mathlib.Geometry.Manifold.VectorBundle.ContMDiffSection`, and `TauCetiRoadmap.DifferentialGeometry.Suggested` (used only for `DensityFiber`, lines 120–121).

Witness: line 8 `import TauCetiRoadmap.DifferentialGeometry.Suggested`; no line reads `import Mathlib`.

Repair: replace the header by `import Mathlib` followed by the `TauCeti.*` modules actually used (`TauCeti.Geometry.Symplectic.Manifold.AlmostComplex`, `TauCeti.Geometry.Symplectic.Manifold.TwoForm`; `TauCeti.Analysis.Complex.CauchyIntegralPolydisc` is currently unused and can go). Delete `DensityFiber`: the density fibre is DifferentialGeometry's object and is cited in the README, not re-declared here. This also removes the 35 build advisories.

## R03 (P2) — No headline theorem is stated, and the docstring does not say which are not statable

Location: `Suggested.lean` lines 11–22 (module docstring) and the whole file.

Claim: the README's end theorems are Newlander–Nirenberg (K1), the Dolbeault–Grothendieck lemma on polydiscs and the parameter solver (K2), Weierstrass preparation, Rückert's Nullstellensatz, Oka and Cartan coherence and Hartogs extension (K3), Koszul–Malgrange and the flat-bundle/local-system equivalence (K4), elliptic regularity, the Hodge theorem and Serre duality (K5), the Kähler identities, Hodge decomposition, Hard Lefschetz and Hodge–Riemann (K6), the projective, torus, Hopf and Iwasawa computations (K7–K8). The file states none of them; its one theorem that is not an API lemma is `realified_isManifold_analytic` (K3.0, line 35). The docstring says "These are suggested forms, not an exhaustive checklist" and names no missing carrier.

Witness: at the pins, the scalar Dolbeault–Grothendieck lemma for a smooth `(0,1)`-form on a polydisc in `Fin n → ℂ` (coefficients `f : Fin n → (Fin n → ℂ) → ℂ`, `ContDiff ℝ ⊤`, compatibility `∂f_j/∂z̄_k = ∂f_k/∂z̄_j` via `fderiv ℝ`) and Hartogs extension for `DifferentiableOn ℂ` functions on `(Fin n → ℂ)` minus a compact set with connected complement, `2 ≤ n`, are statable with Mathlib carriers only; the one-variable parameter Cauchy–Green identity `∂̄_z T(χ f) = χ f` is statable with `fderiv ℝ` and the Lebesgue integral.

Repair: state the statable headlines (at least the two above, and the compact-Riemann-surface constancy statements that use `MDifferentiable` on `OnePoint ℂ`), and list in the docstring each headline that is not statable with the carrier it lacks (Dolbeault cohomology and the Hodge star need the DifferentialGeometry form carrier, which is not at the pins; Serre duality needs the holomorphic-bundle mixin of ComplexManifolds Milestone 7).

## R04 (P2) — K7.2 re-plans the CW structure of ℂPⁿ that AlgebraicTopology Stage 4.6 owns

Location: `README.md` lines 1459–1462 ("construct on this same carrier Mathlib's `CWComplex` structure with one cell in each even dimension 0,2,…,2n and none in odd dimensions, specifying its characteristic maps and skeleta. The CW construction uses only K7.1 and AlgebraicTopology Stage 4") and lines 1668–1669 ("K7.2's CW construction uses K7.1 and AT Stage 4 before AT Stage 7").

Claim: two owners for one object. At this pull request's head, `TauCetiRoadmap/AlgebraicTopology/README.md` lines 826–830 construct complex projective n-space on `Projectivization ℂ (Fin (n+1) → ℂ)` as a finite CW complex with one cell in each even dimension and say "ComplexKahlerGeometry K7 consumes that topology and this cell structure"; lines 1819–1821 repeat it. The pull request moved the ownership there but K7.2 still constructs it.

Witness: AlgebraicTopology README lines 826–830 at head versus ComplexKahlerGeometry README lines 1460–1463.

Repair: in K7.2, replace the construction sentence by "Consume AlgebraicTopology Stage 4.6's finite CW structure on `Projectivization ℂ (Fin (n+1) → ℂ)` (one cell in each even dimension, characteristic maps `z ↦ [z : √(1−|z|²)]`)" and keep only the cellular/cup calculation `H*(ℂPⁿ;ℤ)=ℤ[u]/(u^(n+1))`, the hyperplane normalization and the de Rham/Chern–Weil comparison; update the order paragraph at lines 1668–1669. In the same passage, line 1475 "AT 8.12 consumes that later comparison" is stale: AlgebraicTopology's dependency table at head (line 2431) says 8.12 uses "no projective carrier or external comparison"; the finite-to-infinite comparison is CharacteristicClasses C1.5/C1.6's (CharacteristicClasses README lines 61–63 and 95–99 at head). Delete the AT 8.12 clause.

## R05 (P2) — Two-way supply with RealAnalyticGeometry

Location: `README.md` lines 280–284 ("RealAnalyticGeometry R3.2 consumes this colimit theorem"), 424–428 ("R1 local finiteness and compactness of V give finitely many such pieces … RealAnalyticGeometry R5 supplies the global compatible triangulation"), 1337–1341 ("Consume RealAnalyticGeometry R0–R5"), 1688–1692 ("Within K3 … precede RealAnalyticGeometry R1's local semianalytic/component results; those results then supply K3's finite regular-piece partition").

Claim: `TauCetiRoadmap/RealAnalyticGeometry/README.md` on main (d0bb87a6) consumes this roadmap at line 173 ("The proof uses CK K3's convergent Weierstrass preparation and division"), line 217 ("Use CK K3's Noetherian germs"), R3.2 lines 736–758 (the RingCat structure sheaf and `O_U ≅ O_W|_U` "supplied by CK K4"), and lines 780–805 (K3's Oka coherence). This roadmap consumes RealAnalyticGeometry R1 in K3 and R0–R5 in K6.1. The chain K3/K4/K5b → RAG R1–R5 → K3's partition and K6.1 is a cycle between the two roadmaps' layers. The mechanical check does not report it because both roadmaps are on main, which the check treats as consumable by anyone; the pull request's stated purpose is to cut exactly such loops among roadmaps on main, and this one is left standing.

Witness: RealAnalyticGeometry README line 173 (`CK K3`), line 736 (`CK K4`); ComplexKahlerGeometry README line 1337 (`RealAnalyticGeometry R0–R5`).

Repair: make the supply one-directional. RealAnalyticGeometry R3–R5 depend on K3, K4 and K5b, so the consumer of R5 cannot be this roadmap: move K6.1's analytic-cycle triangulation and integral fundamental class (the paragraph from "For singular V, consume K3's finite regular-piece partition" to the end of K6.1) into "ComplexKahlerGeometry, Part II", placed after RealAnalyticGeometry, with the introduction saying where this roadmap stops (the real de Rham functional of `∫_(V_reg)`). In K3, prove the finiteness of the regular-piece partition from local parametrization and compactness here (it needs no semianalytic normal decomposition) and drop the R1 citation; delete the consumer sentences at lines 280–284 and 1688–1692 or rewrite them to say that RealAnalyticGeometry consumes K2–K5b.

## R06 (P2) — Two-way supply with PseudodifferentialOperators

Location: `README.md` lines 46–53 ("PseudodifferentialOperators P1.0 supplies differential-operator carriers, jets, symbols and formal density adjoints after K5a's initial density-line construction and before its analytic scale"), 573–577 ("Its pointwise real star, orientation line and density bundle precede PDO P1.0. Its distributional operator action and Laplace analysis then consume P1.0's operator and symbol core"), 1647–1652 ("PDO P1.0 consumes that density bundle").

Claim: `TauCetiRoadmap/PseudodifferentialOperators/README.md` on main has a supplier contract "From TauCetiRoadmap.ComplexKahlerGeometry. K5a supplies bundle distributions, the shared compact-bundle H^s Hilbert scale …" (line 91), `*Needs:* P1.0 differential operators; ComplexKahlerGeometry K5a's smooth-section Fréchet topology` (line 529), "CKG K5a consumes this predicate" (line 441) and "ComplexKahlerGeometry K5a's density and section-topology contracts" (line 541). The roadmap-level graph is K5a(early) → P1.0 → K5a(late) → P1.1 onward: each roadmap is the other's supplier. The dependency check does not report the pair for the same reason as in R05.

Witness: PseudodifferentialOperators README lines 91, 441, 529 and 541; ComplexKahlerGeometry README lines 573–577 and 1650.

Repair: one owner upstream. PseudodifferentialOperators is listed at position 8 of the merge order and this roadmap is unlisted, so move the pre-P1.0 part of K5a (the density line `DensityBundle M`, `BundleTest`, `BundleDistribution`, the Fréchet section topology and the Montel instance) into PseudodifferentialOperators P1.0's smooth-section floor and consume them here; K5a then starts at the Hilbert scale. The alternative (P1.0's operator core moves here and PseudodifferentialOperators consumes all of K5a) also works; either way the two READMEs must agree.

## R07 (P3) — Pull-request numbers and pinned-commit links as supplier citations

Location: `README.md`, 24 occurrences of "#279"/"#280" (for example lines 17, 28, 1551, 1591 and 1668: "#279 Milestones", "#280 Milestone 1", "ComplexManifolds #279 Milestone 4"), the 29 `github.com/TauCetiProject/TauCetiRoadmap/blob/<sha>/…` links the gate lists (lines 26, 29, 31, 35, 41, 45, 53, 199, 200, 345, 472, 475, 572, 573, 1049, 1051, 1059, 1063, 1065, 1153 and further), and the fork links `github.com/mccorvie/…` and `github.com/Paul-Lez/…` at lines 1488–1496, 1591 and 1674–1675 (36 blob links in all).

Claim: cross-roadmap citations must name the roadmap and its section, never a pull-request number or a commit-pinned path; ComplexManifolds and ComplexTori are on main with Milestones 1–7 and 1–5 respectively, so "#279 Milestone 2.1" is "ComplexManifolds Milestone 2.1".

Witness: `ComplexManifolds/README.md` on main `## Milestone 2: the canonical real orientation`; `ComplexTori/README.md` on main `## Milestone 1: fixed complex tori`.

Repair: replace each "#279" by "ComplexManifolds", each "#280" by "ComplexTori", and each blob link by the roadmap name and section (DifferentialGeometry Layer 0.4, GlobalHolomorphicFunctions Layer 0.3/2.5/4.1/7.2, VariationalMethods §2.2–2.4, §3.1, §5.1–5.2, OperatorTheory/UnboundedOperators §4.7, PlanarTopology Layer 6, SurfaceTopology Layers 2–3/6/8, ComplexComparisonPartII C−1.1/C0.4/C5.1–C5.2, FormalConnectionsOpers F2.4, LieGroupoidsPoisson §G1.3a).

## R08 (P3) — Citation labels that do not resolve in the suppliers' own numbering

Location: `README.md` lines 572, 1049, 1059, 1063, 1065, 1153, 1653, 1656 (VariationalMethods "V2–V5.2", "V5.1", "V2.2–V2.4", "V3–V4", "V5.1–V5.2", "V3.1"), lines 35, 981 and 1637 ("GlobalHolomorphicFunctions GH5.1" for the exactness of every smooth complex 2-form), lines 1551, 1598 and 1683 ("LieGroupoidsPoisson G1.3").

Claim: VariationalMethods (at the head of pull request #1028) numbers its sections 2.2–2.4, 3.1, 3–4, 5.1–5.2 and never uses a "V" prefix, which is why the resolver lists V5.1 and V2.2 as found nowhere; in GlobalHolomorphicFunctions (at the head of pull request #992) two-form exactness is Layer 7.2 ("Planar coordinate forms and two-form exactness"), while the label GH5.1 is Layer 7.4 ("Cousin I and planar de Rham consequences"); LieGroupoidsPoisson's standalone Chevalley–Eilenberg complex is §G1.3a (its README on main, lines 18 and 86: "K8 consumes §G1.3a").

Witness: VariationalMethods README line 452 `### 2.2 Quadratic energies` and line 839 `### 5.1 The compact-pair specialization`; GlobalHolomorphicFunctions README line 1807 `### 7.2 Planar coordinate forms and two-form exactness` and line 1925 `### 7.4 … (GH5.1)`; LieGroupoidsPoisson README line 86.

Repair: cite "VariationalMethods §5.1" (and §2.2–2.4, §3–4, §3.1, §5.1–5.2), "GlobalHolomorphicFunctions Layer 7.2", "LieGroupoidsPoisson §G1.3a".

## R09 (P3) — Padding in `Suggested.lean`

Location: `Suggested.lean` lines 55–66 (`dbarFunction_apply_J`, `dbarFunction_eq_zero_iff`), 88–91 (`nijenhuisTensor_skew`), 106–115 (`memSobolev_iff_bundled`, proved), 243–284 (`bundleTestComplexModule`, `bundleTestScalarTower`, proved field by field), 275–276 (`bundleTest_smul_apply`, `rfl`), 360–361, 383–385, 393–394, 405–409, 413–416, 503–506 (all proved in one term), 484–486 (`complexBesselDistributionMultiplier_real`).

Claim: these are API lemmas that restate a definition or follow in one step. Probe (previous review, on a scratch copy; the file is unchanged): after `simp [dbarFunction, TauCeti.SmoothAlmostComplexStructure.apply_apply]` the goal of `dbarFunction_apply_J` is the scalar identity `(a' − i a)/2 = −i(a + i a')/2` with `a = df(v)`, `a' = df(Jv)`, and `dbarFunction_eq_zero_iff` reduces to `a + i a' = 0 ↔ a' = i a`; both are closed by `Complex.I_mul_I` and `ring`. `memSobolev_iff_bundled` is proved by `⟨hu.toBesselPotentialSpace, rfl⟩` and `v.memSobolev_toDistr`, two pinned declarations. `nijenhuisTensor_skew` is a statement about the sorried tensor of R01. `complexBesselDistributionMultiplier_real` is the identity `exp((s/2) log(1+|ζ|²)) = (1+|ζ|²)^(s/2)`.

Repair: delete them from `Suggested.lean`; the README keeps the type law of `∂̄`, the skew-symmetry of N and the bundled/unbundled Sobolev comparison as Checks and API bullets.

## R10 (P3) — README shape: no Checks, no supplier-contract section, locators missing, undeclared Lean names

Location: whole `README.md`; in particular the title line 1 (`# Complex manifolds, Dolbeault theory, and Kähler geometry`, not `# Roadmap: …`), the absence of `**Summary.**`, `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build`, `### Examples` and `### Dependencies` per layer, and of any `**Checks.**` list (0 occurrences); the reference list at lines 1694–1703 (Wells without chapter or theorem; Griffiths–Harris "chapter 0" for Dolbeault and Kähler foundations without section); process wording at line 67 ("the prototypes use that native carrier to pin these preservation laws during its migration") and in the Lean docstring ("these prototypes do not prove the analytic targets"); LaTeX macros inside code spans at lines 120–121 (`φ_{\bar z}d\bar z`); backticked names of this roadmap's own that `Suggested.lean` does not declare: `DensityBundle M` (line 626), `RealBundleSobolev V 0` (line 785), `BundleSobolev E s` with the signature `(E, s)` (lines 728 and 892; the Lean `BundleSobolev` takes `F V n q G localize s`).

Claim: the definitions of K5a (the density bundle, `BundleTest`, `BundleDistribution`, `BundleSobolev`, the complexification maps) and of K3 (holomorphic stalk, meromorphic germ field) have API prose but no `**Checks.**` bullets, so the three-Checks rule fails for every definition; several sampled targets (Parameter Cauchy–Green, K4.ComponentwiseFiniteRankAssembly, K5a.DistributionLocalStructure, K5a.SmoothSectionMontel, K5a.ComponentwiseCompact, K5b.0, K7.1) carry no locator at all.

Repair: bring the README to the TauCetiRoadmap form (title, Summary, Scope and ownership, Conventions, Exact supplier contracts, layers with Examples and Dependencies), add at least three discriminating Checks per definition (for example for `dz_j♯`: with `H = I` the value `2∂_(z_j)` and the failure of the dual-frame normalization `∂_(z_j)`; for the pointwise star: `*² = (−1)^(k(m−k))` on `k = 1, m = 2` giving `−1`; for the Hopf computation: the weight `2^(1−m−n)` of `z₁^(−m)z₂^(−n)dz_j` at `m = n = 1`), give each theorem a locator (Demailly chapter II §4.2 for Weierstrass preparation, II (4.22) for the Nullstellensatz, II (4.29) and (4.31) for coherence and the singular locus; Wells chapter IV §§4–5 for Hodge theory and Serre duality), remove the process wording, write `φ_z̄` and `dz̄` in Unicode, and either declare `DensityBundle`/`RealBundleSobolev` or unbacktick them.

## Previous findings

- R01 — not repaired: `Suggested.lean` is unchanged; lines 77–79 still read `def nijenhuisTensor … := by sorry`, and the gate still counts 20 `sorry-data` hits (now R01).
- R02 — not repaired: lines 1–9 still import five `Mathlib.<submodule>` lines and `TauCetiRoadmap.DifferentialGeometry.Suggested`, with no `import Mathlib` (now R02).
- R03 — not repaired: the docstring at lines 11–22 still says "suggested forms, not an exhaustive checklist" and no headline is stated (now R03).
- R04 — not repaired: README lines 1459–1462 still construct the `CWComplex` structure on ℂPⁿ while AlgebraicTopology Stage 4.6 at head (lines 826–830) owns it (now R04).
- R05 — not repaired: README line 1337 still consumes RealAnalyticGeometry R0–R5 while RealAnalyticGeometry on main (lines 173, 736) consumes K3 and K4 (now R05).
- R06 — not repaired: README lines 573–577 still consume PDO P1.0 while PseudodifferentialOperators on main (lines 91, 529) consumes K5a (now R06).
- R07 — not repaired: 24 "#279/#280" occurrences and 36 blob links remain (now R07).
- R08 — not repaired: "VariationalMethods V5.1" at line 1049, "GH5.1" at line 35, "LieGroupoidsPoisson G1.3" at line 1551 remain (now R08).
- R09 — not repaired: `dbarFunction_apply_J` (line 55), `memSobolev_iff_bundled` (line 106) and the other listed declarations remain (now R09).
- R10 — repaired: `git diff --stat origin/main...HEAD` restricted to paths outside the fourteen named folders is empty; commit 74e527e8 dropped the two out-of-folder hunks, and the gate reports `outside-folder=0`.
- R11 — not repaired: line 1 still reads `# Complex manifolds, Dolbeault theory, and Kähler geometry`, `**Checks.**` occurs 0 times, lines 120–121 still carry `\bar` inside code spans (now R10).

## Verified sound

**Scope of this re-review.** The folder is byte-identical to fa7b83e (0 changed lines), so no changed passage exists to review; the three sentences the pull request changes against main were re-read: line 609 (the K5a star is "consumed by RiemannianGeometry and consumed by SpinGeometry", a consumer sentence that creates no supply edge), lines 1538 and 1613 (K8 consumes "AlgebraicTopology Stage 5.0's generic filtered-complex spectral sequence"; AlgebraicTopology at head owns Stage 5.0 and is earlier in the merge order than every supplier this roadmap names, and DGFloer is no longer cited anywhere in the README). The seeded sample falls entirely in unchanged passages; its checks are carried forward from the previous review below.

**Gate and build at this head.** `lake env lean TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` from the worktree: exit 0, 37 `declaration uses 'sorry'` warnings and nothing else (no error, no other warning). The gate's 35 `build` lines are lake's "consider adding `module`" advisories for the imported `TauCetiRoadmap/DifferentialGeometry/Suggested.lean`, which R02 removes. Dependency check at this head: `depcheck: 224 roadmaps, 2095 edges, 0 problem(s)`, no UPWARD, no CYCLE, no `moved:` line. The `#check @name` comparison of all 32 declarations was done in the previous review on this identical file (the sorried `def`s drop the section binders `[CompleteSpace E] [FiniteDimensional ℝ E] [T2Space M]` their types do not mention; the theorems keep them; every bundle declaration carries its instance binders explicitly) and is not repeated.

**Adversarial table.** Every statement is untouched by the diff; each row carries forward the previous review (r9 at fa7b83e) with the values it computed.

| Statement | Instances tried | Values computed | Result | Carried from |
|---|---|---|---|---|
| `g(u,v)=ω(u,Jv)`, `h_T=g+iω` conjugate-linear in the first slot (Conventions) | `h_T(Ju,v)` | `g(Ju,v)=ω(Ju,Jv)=ω(u,v)`, `ω(Ju,v)=−g(u,v)`; `h_T(Ju,v)=ω−ig=−i·h_T(u,v)` | sound | r9 |
| `h_T(u^(1,0),v^(1,0))=2g_ℂ(bar u^(1,0),v^(1,0))` | general `u,v`, `u^(1,0)=(u−iJu)/2` | `g_ℂ((u+iJu)/2,(v−iJv)/2)=(1/4)(2g(u,v)+2iω(u,v))=h_T(u,v)/2`; twice gives `h_T(u,v)` | sound | r9 |
| `ω=(i/2)Σh_T(∂_(z_k),∂_(z_j))dz^j∧dbar z^k` gives `Σdx^j∧dy^j` for `h_T=δ` | `n=1` | `(i/2)(dx+idy)∧(dx−idy)=(i/2)(−2i)dx∧dy=dx∧dy` | sound | r9 |
| `dd^c=2i∂∂̄` with `d^c=i(∂̄−∂)` | symbolic | `(∂+∂̄)i(∂̄−∂)=i(∂∂̄−∂̄∂)=2i∂∂̄` | sound | r9 |
| `∂̄²f(X,Y)=−(1/4)∂f(N(X,Y))` on `(0,1)` fields, `N=[JX,JY]−[X,Y]−J[JX,Y]−J[X,JY]`, no `1/2` in `dα` | `JX=−iX`, `JY=−iY` | `N(X,Y)=−2[X,Y]+2iJ[X,Y]=−4[X,Y]^(1,0)`; `d(∂̄f)(X,Y)=[X,Y]f−∂̄f([X,Y])=∂f([X,Y]^(1,0))`; hence `=−(1/4)∂f(N(X,Y))` | sound | r9 |
| `N(X^(0,1),Y^(0,1))=N(X,Y)^(1,0)` | `X=X^(1,0)+X^(0,1)` | `N(JX,Y)=−JN(X,Y)` puts `N(X^(1,0),·)` in `T^(0,1)` and `N(X^(0,1),·)` in `T^(1,0)`; mixed terms vanish | sound | r9 |
| Chern connection `A=h⁻¹∂h`, `h′=g*hg`, `A′=g⁻¹Ag+g⁻¹dg` (columns, `h_ij=h(e_i,e_j)`) | rank `r`, `s=ev` | metric compatibility `dh=A*h+hA` with `A` of type `(1,0)` forces `∂h=hA`; frame change gives `A′=g⁻¹Ag−d(g⁻¹)g=g⁻¹Ag+g⁻¹dg` | sound | r9 |
| `ω_FS=(i/2π)∂∂̄log(1+|z|²)`, `∫_(ℙ¹)ω_FS=1`, `Θ(O(1))=−2πiω_FS` | `n=1` | `(i/2π)∂∂̄log(1+|z|²)=(1/π)(1+|z|²)^(−2)dx∧dy`, integral `1`; `c₁=(i/2π)Θ=ω_FS` | sound | r9 |
| `*²=(−1)^(k(m−k))`, `d*=(−1)^(m(k+1)+1)*d*` | `m=2,k=1`; `m=3,k=1` | `*²=−1` on 1-forms of a surface; `d*=−*d*` on 1-forms in dimension 3 | sound | r9 |
| Hodge Laplacian on functions is `−div grad` | `ℝⁿ` | `d*df=−Σ∂_i²f` | sound | r9 |
| `|dz_j|²_Gram=2(H⁻¹)_jj`, `dz_j♯=2Σ_k(H⁻¹)_kj∂_(z_k)` | `H=I`, `n=1` | `|dx+idy|²=2`; `⟨∂_x−i∂_y,∂_x⟩=1=dz(∂_x)`, `⟨∂_x−i∂_y,∂_y⟩=i=dz(∂_y)`; general `H`: `Σ_k conj(c_k)H_kl=2δ_jl` gives `c_k=2(H⁻¹)_kj` | sound | r9 |
| unitary coframe `φ` has Gram norm `√2`, `e_φ i_φ+i_φ e_φ=2δ` | `n=1` | `ψ=φ/√2` orthonormal gives `1`; rescaling by `2` | sound | r9 |
| `*:Ω^(p,q)→Ω^(n−q,n−p)`, `barStar:Ω^(p,q)→Ω^(n−p,n−q)`, `∂̄*=−*∂*` | `n=1,(p,q)=(1,0)` | `*dz∝dz` type `(1,0)=(n−q,n−p)`; `barStar dz∝dbar z` type `(0,1)` | sound | r9 |
| `σ(Δ_∂̄)=½|ξ|²Id` | flat `ℂⁿ` | `Δ_d=2Δ_∂̄`, `σ(Δ_d)=|ξ|²` | sound | r9 |
| `[Λ,L]=n−k`, `[Λ,∂̄]=−i∂*`, `[Λ,∂]=i∂̄*`, `[Λ,d]=−(d^c)*`, `[L,d*]=d^c` | symbolic | `[Λ,d]=i(∂̄*−∂*)`, `(d^c)*=−i(∂̄*−∂*)`; `[L,d*]=i∂̄−i∂=d^c` | sound | r9 |
| Hodge–Riemann sign `i^(p−q)(−1)^(k(k−1)/2)∫α∧bar α∧ω^(n−k)/(n−k)!>0` | `n=1,(p,q)=(1,0)` | `i∫α∧bar α`, `α=f dz`: `i|f|²dz∧dbar z=2|f|²dx∧dy>0` | sound | r9 |
| `[iΘ(E),Λ]≥ka` on `(n,k)` forms from Nakano `iΘ≥aω⊗Id` | `k=1` | eigenvalue sum `λ₁+…+λ_k≥ka` | sound | r9 |
| `K_(ℙ¹)≃O(−2)` from `dz=−w⁻²dw`; `H¹(O(−1))=0`, `h⁰(O(−1))−h¹(O(−1))=0` | `w=1/z` | transition `−w⁻²` of degree `−2`; Serre: `h¹(O(−1))=h⁰(O(1)⊗O(−2))=h⁰(O(−1))=0` | sound | r9 |
| `h⁰(O(k))=binomial(n+k,n)`; torus `h^(p,q)=binomial(n,p)binomial(n,q)`; curve `h^(0,1)=g`, `b₁=2g` | `n=1,k=2`; `n=1`; `g=1` | `3`; `1,1,1,1`; `h^(0,1)=1=b₁/2` | sound | r9 |
| Hopf `h^(0,1)=1`, `h^(1,0)=0`, `h^(1,1)=0`, `b_k=Σh^(p,q)` | weights of `z^α` (`2^d`), `z^αdz_j` (`2^(d+1)`), `z₁^(−m)z₂^(−n)dz_j` (`2^(1−m−n)`) | coinvariants of `𝒪(ℂ²)` are the constants; no weight `1` for `Ω¹` in `H⁰` or `H¹`; `b₁=1=0+1`, `b₂=0`, `b₃=1=h^(2,1)+h^(1,2)=1+0` | sound | r9 |
| Iwasawa `h^(1,0)=3`, `h^(0,1)=2`, `b₁=4` | Sakane example, Angella table | `sakane-parallelisable` line 339: `h^(0,1)=h^(0,2)=2`, `h^(1,0)=3`; `angella-iwasawa` lines 701, 719, 724: `b₁=4`, `3`, `2` | sound | r9 |
| Frölicher `d_r:E_r^(p,q)→E_r^(p+r,q−r+1)` | `r=1` | `∂:H^(p,q)_∂̄→H^(p+1,q)_∂̄` | sound | r9 |
| Laurent coefficient of order `−k`: `(2πi)⁻¹∮f(z)(z−a)^(k−1)dz` | `f=(z−a)^(−k)` | `(2πi)⁻¹∮(z−a)^(−1)dz=1` | sound | r9 |
| `exp(1/‖x‖²)` nonextension: lower bound `C′εⁿexp((1+c)^(−2)ε^(−2))` versus `Cε^(−N)` | `0<c<1/4`, support in `|x|∈[ε(1−c),ε(1+c)]` | `exp(1/|x|²)≥exp(((1+c)ε)^(−2))` on the support, volume `(cε)ⁿ‖φ‖₁`; exponential beats every power | sound | r9 |
| `⟨δ^(n)/n!,φ⟩=2ⁿ` for `φ=1/(1+2x)` near `0` | `n=0,1,2` | `φ^(n)(0)/n!=(−2)ⁿ`, sign `(−1)ⁿ` gives `2ⁿ`: `1,2,4` | sound | r9 |
| `H_m(t)=t_+^(m−1)/(m−1)!` is `C^(m−2)`, `D^mH_m=δ` | `m=2` | `t_+` is `C⁰`, `D²t_+=δ` | sound | r9 |
| Peetre `〈ζ+η〉^s≤2^(|s|/2)〈ζ〉^s〈η〉^|s|` | `s=1`, `ζ=η` | `〈2ζ〉≤√2〈ζ〉²` since `1+4|ζ|²≤2(1+|ζ|²)²` | sound | r9 |
| `B_F(f,g)=B₀(f,Rg)`, `Rg(x)=g(−x)` | Plancherel bilinear | `∫f̂ĝ=∫f·(ĝ)^=∫f(x)g(−x)dx` | sound | r9 |
| link in codimension one: `H̃₀(c points)=ℤ^(c−1)`, local group `ℤ` forces `c=2` | `c=1,2,3` | `0,ℤ,ℤ²` | sound | r9 |
| `OnePoint.equivProjectivization`: `t↦[t:1]`, `∞↦[1:0]` | pin | `Mathlib/Topology/Compactification/OnePoint/ProjectiveLine.lean` line 84 | sound | r9 |
| `dbarFunction` (Lean) `=(df(v)+i df(Jv))/2` vanishes for holomorphic `f` | `df(Jv)=i df(v)` | `(a+i·ia)/2=0` | sound | r9 |
| last nonzero lower-central ideal is central, positive-dimensional, proper | nonabelian nilpotent `𝔤` | `[𝔤,𝔤^(m)]=0`, `𝔤^(m)≠0`, `𝔤^(m)⊆[𝔤,𝔤]≠𝔤` | sound | r9 |
| sampled "Parameter Cauchy–Green": `∂̄_zT(χf)=χf`, joint smoothness, `∂̄_(q_j)T(χf)=T(χ∂̄_(q_j)f)` | `T g(z)=(1/π)∫g(ζ)/(z−ζ)dA(ζ)`, kernel `1/(πζ)` locally integrable | differentiation under the integral on the fixed compact support of `χ`; holomorphy off `tsupport χ` | sound | r9 |
| K8 (changed against main): the Frölicher column filtration is a finite decreasing filtration of the total complex, so AlgebraicTopology Stage 5.0's filtered-complex spectral sequence applies | `n=1`: `F^p = ⊕_(p'≥p) Ω^(p',·)` | `F^0 ⊇ F^1 ⊇ F^2 = 0`, `d = ∂ + ∂̄` preserves `F^p`; `E₀^(p,q) = Ω^(p,q)`, `d₀ = ∂̄`, `E₁ = H_∂̄`, `d₁ = ∂` of bidegree `(1,0)`; matches `d_r` of bidegree `(r, 1−r)` at `r=1` | sound | this review |

**Cross-roadmap citations re-resolved at this head** (main d0bb87a6, or the open head named): AlgebraicTopology at head Stage 4.6 (lines 826–830), Stage 5.0, Stage 8.12 table row (line 2431); CharacteristicClasses at head C1.5/C1.6 consuming K4 and K7.1/K7.2 (lines 61–63, 95–99), consistent with README line 1473; TopologicalKTheory at head consumes K1/K5–K7 (lines 67, 83, 157, 367) and is not cited back; BordismFormalGroups at head does not cite this roadmap; RealAnalyticGeometry on main lines 173, 217, 736–805, 1019 (R05); PseudodifferentialOperators on main lines 18, 91, 441, 529, 541 (R06); ComplexManifolds and ComplexTori Milestone headings on main (R07); VariationalMethods at the head of pull request #1028 (`### 2.2` line 452, `### 5.1` line 839), GlobalHolomorphicFunctions at the head of pull request #992 (Layer 7.2 line 1807, Layer 7.4 "(GH5.1)" line 1925), LieGroupoidsPoisson on main §G1.3a (lines 18, 86) (R08). The previous review's resolution of DifferentialGeometry, SmoothBundlesConnections, PDE, ComplexComparisonPartII, FormalConnectionsOpers, OperatorTheory/UnboundedOperators, HamiltonianReduction, Hyperfunctions, GeometricQuantization, GeometricTopology, RealAlgebraicGeometry, HopfRinow, RiemannianGeometry, PlanarTopology and SurfaceTopology citations stands: none of those roadmaps is among the folders changed since fa7b83e. Ownership against the open pull requests whose files the brief gives was checked by object in the previous review (CW structure of ℂPⁿ: AlgebraicTopology; filtered-complex spectral sequence: AlgebraicTopology 5.0; Fréchet/LF section carriers and real Hodge star: no other owner) and nothing in the folder changed.

**Library declarations at the pins** (Mathlib `358314d`, Tau Ceti `fb13df7`, unchanged lake-manifest): the list opened in the previous review stands for this identical file; `lake env lean` at this head confirms every name it uses still elaborates.

**Sources at their locators** (seeded sample, all in unchanged passages; carried from the previous review, read in this worker's cache): Łojasiewicz §3 Theorem 2, printed p. 464 (`lojasiewicz-triangulation` lines 512–515) supports K6.1; Demailly chapter II (4.22), (4.29), (4.31) and §4.4 (`demailly-agbook` lines 4742, 4825, 4842, 4929) support the K3 locators; Sakane Theorem 1 and the example (`sakane-parallelisable` lines 46, 106–115, 339) support K8 and K8.NilpotentCentralReduction; Angella's tables (`angella-iwasawa` lines 700–705, 717–724) support the K8 values. Parameter Cauchy–Green, K3.HolomorphicStalk, K3.MeromorphicGermField, K4.ComponentwiseFiniteRankAssembly, K5a and its four named sub-targets, K5b with K5b.0–K5b.1, K7.1 and K7.2 cite no printed source and were checked as the roadmap's own constructions by the table.

## Not verifiable

- Webster, *A new proof of the Newlander–Nirenberg theorem*, Math. Z. 201 (1989): paywalled (publisher prefix 10.1007); settled as `uncertified`, cited by locator alone. The README's description of the route is consistent with the published abstract but was not checked against the text.
- Hörmander, *Linear Partial Differential Operators* (1990), Wells, *Differential Analysis on Complex Manifolds* (2007), Griffiths–Harris, *Principles of Algebraic Geometry* chapter 0: settled as `uncertified` or not available from a legal open source; the K3 and K5 statements attributed to them were checked mathematically in the table, not against the text.
- The board manifest `packages/ComplexKahlerGeometry/sources.toml` records `ballmann-kahler`, `berwick-evans-tripathy`, `knutson-borel-weil` and `lojasiewicz-triangulation` under target names (K6.0, K7.FlatDegreeZero, K7.2.TautologicalIncidence) that the README does not use, and lacks Demailly, Sakane, Angella, Webster, Griffiths–Harris and Wells. The manifest is not part of this pull request and was not edited.

## Source issues

- none
