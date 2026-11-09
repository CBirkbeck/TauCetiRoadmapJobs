# Review of TopologicalKTheory (pull request #1808 at dc47c7e)

**Verdict:** needs changes

R01 is the root cause. This folder is an older copy of TopologicalKTheory: main has since rewritten it, and #1807 (which this pull request's own merge-order paragraph places first) already carries the same two edits together with most of the repairs below. Each finding records the folder as it stands at dc47c7e and says whether main or #1807's head already repairs it.

## R01 (P2) — The TopologicalKTheory edits repeat #1807's, on a superseded base, and conflict with main

- **Location.** `TauCetiRoadmap/TopologicalKTheory/README.md` lines 51–74, 248–254, 301–302, 333–362, 1119–1126 and 1365–1366: the AT Stage 5.5 swap for DGFloer Layer 1 item 2, and T1.5 taking the smooth graph-chart upgrade from GeneralizedCohomology G4.0b.
- **Claim.** This pull request changes this roadmap. The description's merge order is "#1101 (ModularCurves) → #1807 (the other loops) → this pull request", and the house rule is "do not restate what the other already changes".
- **Witness.**
  - The README at #1807's head already makes both changes: line 127 has "its Stage 5.5 supplies the bundle-to-Serre comparison", lines 137–148 have "T1.5 owns … the smooth graph-chart upgrade" with G4.0b as consumer, and line 459 has "Own the smooth upgrade".
  - `git merge-tree origin/main HEAD` reports a content conflict in this README: one hunk at the AT/DGFloer supplier bullet and one at T1.5a.
  - Since the merge base a891cd1, main has changed this README by 541 lines and rewritten Suggested.lean.
- **Repair.** Restore `TauCetiRoadmap/TopologicalKTheory/README.md` to `origin/main` in this pull request and leave both changes to #1807. Afterwards `git diff origin/main...HEAD -- TauCetiRoadmap/TopologicalKTheory` is empty. Findings R02–R16 then apply to whichever pull request next edits this folder; each one says where it is already repaired.

## R02 (P2) — HomotopySpheres is cited as a supplier; the gate refuses the name (dropped=6)

- **Location.** README lines 108–120 ("HomotopySpheres §4A–4B supplies stable O/SO, the loop comparison with T1.6's oriented classifier, and the full real Bott loop chain"), and lines 372, 615, 1258 and 1374.
- **Claim.** T1.6a, T1.6d and T7.1's real periodicity rest on HomotopySpheres §4A–4B. HomotopySpheres is on the list of roadmaps that may never be cited as suppliers. It is not on main and sits at merge-order line 45.
- **Witness.** DGFloerPartII (merge-order line 46, before this roadmap's placement) proves real Bott periodicity in 4.2c ("`O ≃ Ω⁸O` … `π_(i+8)(O) ≅ π_i(O)`"). Its Downstream consumers section says "TopologicalKTheory can consume 4.2a–4.2c in T1.6a, T1.6d and T7".
- **Repair.**
  - Replace the six HomotopySpheres citations with DGFloerPartII 4.2a–4.2c: stable `O` for the ΩBSO comparison, Ω₇ with its stabilization for ℤ×BO, and the eight stable Bott maps for T7.1.
  - Keep the comparisons with BO here.
  - #1807's head already does this (line 192); main still has the citations.

## R03 (P2) — TopologicalKTheory and CharacteristicClasses supply each other

- **Location.** README line 367 ("For oriented real bundles of fixed positive rank n≥1 compare using CharacteristicClasses C1.1a's finite oriented-cover precursor"); also lines 75–82, 431, 475 and 581.
- **Claim.** T1.6a and T1.6c consume CC C1.1a, while CC consumes T1, T1.5, T1.6 and T6.4. Two roadmaps citing each other is a cycle, even when the layer order is acyclic.
- **Witness.**
  - `CharacteristicClasses/README.md` at this head, line 293: "C1.1a. Finite oriented-cover precursor. Before TopK T1.6"; line 20: "Use TopK T1.5's actual finite real Grassmannians"; line 334: "Use TopK T6.4".
  - The precursor's carrier is pinned: `TauCeti.finiteOrientedGrassmannian`, with `forget` and `Tautological` (`TauCeti/Topology/Grassmannian/Oriented.lean:44,53`).
- **Repair.**
  - Consume the pinned oriented Grassmannian directly.
  - Own the lifted Schubert cells, the SO-Stiefel comparison and the BSO→BO double cover in T1.6a/T1.6c.
  - Name CC only as a consumer. #1807's head does this at lines 151–152.

## R04 (P2) — The finite CPⁿ CW cells that T1.6d compares with have no owner

- **Location.** README lines 628–636: "transport AT4.6's real and CKG K7.2's complex characteristic cells through the actual ratio charts".
- **Claim.** ComplexKahlerGeometry K7.2 is cited for the complex characteristic cells, but K7.2 does not construct them.
- **Witness.**
  - `ComplexKahlerGeometry/README.md` line 2242 (this head): "Consume AlgebraicTopology Stage 4.6's finite CW structure on `Projectivization ℂ (Fin (n+1) → ℂ)`".
  - AT Stage 4.6 (`AlgebraicTopology/README.md` lines 816–845) builds only RPⁿ.
  - AT lines 1839–1843: "No complex-projective construction is required in Stage4" (the CW structure is K7.2's).
- **Repair.** Settle a single owner in this pull request: K7.2 should construct the cells, as AT expects. Alternatively, T1.6d uses T1.5's rank-one Schubert cells as the CPⁿ cells and drops the K7.2 premise. This persists at #1807's head (line 852).

## R05 (P2) — Suggested.lean and T1.5 restate pinned Tau Ceti declarations

- **Location.**
  - `Suggested.lean` lines 231–282 (finite Grassmannian block), lines 59–113 (partition gaps) and lines 196–201 (finite trivial embedding).
  - README lines 343–345, new in this pull request: "In rank one own the real and complex projective comparison homeomorphisms from native `Projectivization 𝕜 (Fin (n+1)→𝕜)` to `finiteGrassmannian 𝕜 1 (n+1)`".
- **Claim.** These objects exist at the pinned Tau Ceti; the README does not cite them and the Lean file redeclares them.
- **Witness.**
  - On a scratch copy, each of six declarations closes with a single tactic:
    - `finiteGrassmannianFrameSpan_surjective`: `exact TauCeti.finiteGrassmannian.frameSpan_surjective`
    - `finiteGrassmannianFrameSpan_isQuotientMap`: `exact …isQuotientMap_frameSpan`
    - `finiteGrassmannianOrthonormalSpan_isQuotientMap`: `exact …isQuotientMap_frameSpan_toFullRankFrame`
    - `finiteGrassmannian_isEmpty_of_rank_gt`: `exact …isEmpty_of_lt h`
    - `finiteGrassmannianQuotientConventionEquiv`: `exact …equivModuleGrassmannian 𝕜 hr`
    - `finiteGrassmannianQuotientConventionEquiv_submodule`: `rfl`
  - `partitionGap` is the same object as `PartitionOfUnity.gap` (`Topology/PartitionOfUnity/Gap.lean:67`).
  - `TauCeti.finiteGrassmannian.projectivizationHomeomorph` (`Topology/Grassmannian/Projectivization.lean:46`) is the rank-one homeomorphism.
- **Repair.**
  - Delete these declarations.
  - In T1.3, T1.5 and T1.6a cite `TauCeti.finiteGrassmannian`, `frameSpan`, `isQuotientMap_frameSpan`, `finiteOrthonormalFrame`, `equivModuleGrassmannian`, `projectivizationHomeomorph`, `Tautological`, `PartitionOfUnity.gap`/`gapPartition` and `exists_continuous_injective_fin_of_compactSpace`, with their files.
  - Keep only the smooth upgrade, which is not at the pin.
  - #1807's head does this at lines 62–90 and 471–472.

## R06 (P2) — Sorry'd data (gate sorry-data=3)

- **Location.** `Suggested.lean` line 240 (`⟨Submodule.span 𝕜 (Set.range f.1), by sorry⟩`), line 260 (the same) and lines 274–277 (`… ≃ Module.Grassmannian … := by sorry`).
- **Claim.** These are a `def` with a sorry'd field and a sorry'd `Equiv`, and the `instance` at line 242 is built on the first.
- **Witness.** The gate lists all three. Main's Suggested.lean has real bodies for all three, and Tau Ceti has them (R05).
- **Repair.** Delete them, as in R05.

## R07 (P2) — No headline theorem is stated, though several are statable at the pins

- **Location.** `Suggested.lean` lines 17–23. The docstring names no headline and no missing carrier.
- **Claim.** The file is an API catalogue. The following statements elaborate at the pins with `sorry` as the only warning, using `TauCeti.FiniteRankBundleCore` (preadditive, Whitney biproducts, pullback functor) and `TauCeti.SplitK0`, whose `EssentiallySmall` instance is inferred:

```lean
theorem nonempty_pullback_iso_of_homotopic {𝕜 : Type} [RCLike 𝕜] {X Y : Type}
    [TopologicalSpace X] [TopologicalSpace Y] [ParacompactSpace X] [T2Space X]
    (A : TauCeti.FiniteRankBundleCore 𝕜 Y) {f g : C(X, Y)} (h : f.Homotopic g) :
    Nonempty (A.pullback f ≅ A.pullback g)
theorem exists_iso_pullback_tautological {𝕜 : Type} [RCLike 𝕜] {X : Type}
    [TopologicalSpace X] [CompactSpace X] [T2Space X] (A : TauCeti.FiniteRankBundleCore 𝕜 X) :
    ∃ (N : ℕ) (f : C(X, TauCeti.finiteGrassmannian 𝕜 A.rank N)),
      Nonempty (A ≅ (TauCeti.FiniteRankBundleCore.ofBundle 𝕜 A.rank
        (TauCeti.finiteGrassmannian.Tautological 𝕜 A.rank N)).pullback f)
theorem kZero_evenSphere (n : ℕ) :
    Nonempty (TauCeti.SplitK0.{0} (TauCeti.FiniteRankBundleCore ℂ
      (Metric.sphere (0 : EuclideanSpace ℝ (Fin (2 * n + 3))) 1)) ≃+ ℤ × ℤ)
```

- **Witness.**
  - These are T1.4's homotopy invariance (hatcher-vbkt Theorem 1.6, p. 20) and T1.6a's compact-base Grassmannian classification (Proposition 1.4, p. 13; Theorem 1.16, p. 29). The third is T4.8's sphere groups: positive-dimensional spheres are connected, so constant-rank cores give all of K⁰.
  - Not statable at the pin:
    - the periodicity map `a⊠1+b⊠β` and the ring `K(S²)`: no tensor product on cores;
    - the Thom isomorphism: no compactly supported K;
    - `R(G)≃K_(G,c)(V)`: no equivariant bundle category;
    - the KO coefficient ring: no graded theory;
    - `[X,BU×ℤ]`: no stable Grassmannian.
- **Repair.** State these three theorems with sources in their docstrings. Write a module docstring naming each headline that is not statable and the carrier it lacks. This persists at #1807's head, which states none of the three.

## R08 (P3) — Padding: non-headline declarations

- **Location.** `Suggested.lean`:
  - lines 34–37 `FiniteRankAtlas`; lines 45–53 `BundleCategoryK0` and the `example … := inferInstance`;
  - line 117 `bijective_of_surjective_trivial_identity_fiber` (the T2.4 exercise);
  - lines 125–163 `adamsValueOfLambdaSeries` with two proved lemmas, which are T2.5 Checks;
  - lines 183–193 `RelativeSymbol`; lines 210–226 (T4.2/T4.4 lemmas);
  - line 268 (the boundary case `r > N`).
- **Claim.** None of these is a headline. The `example` closes by `inferInstance`, line 268 closes by `exact TauCeti.finiteGrassmannian.isEmpty_of_lt h`, and no theorem uses `FiniteRankAtlas`, `RelativeSymbol` or `BundleCategoryK0`.
- **Witness.** The one-tactic probe above; `exact?` closes neither line 117, line 96 nor line 221.
- **Repair.** Delete these declarations from `Suggested.lean`; the README keeps them as targets and Checks.

## R09 (P3) — Imports (gate imports=1, mathlib-subimports=13, no-import-mathlib=1)

- **Location.** `Suggested.lean` lines 1–15, which begin with `import TauCeti.RingTheory.PowerSeries.Log`, followed by thirteen `import Mathlib.…` lines.
- **Claim.** The file must import `Mathlib` first, then only the Tau Ceti modules it uses.
- **Witness.** Gate output. Main's and #1807's files use `public import Mathlib`.
- **Repair.** Use `import Mathlib` followed only by the Tau Ceti modules the R07 statements need: `TauCeti.Topology.VectorBundle.FiniteRank.Biproduct`, `….FiniteRank.Pullback`, `TauCeti.Topology.Grassmannian.Tautological` and `TauCeti.CategoryTheory.GrothendieckGroup.Split`.

## R10 (P3) — Commit-pinned links (gate blob=4)

- **Location.** README lines 83, 88, 92 and 96 (`…/blob/13b2335…/ComplexKahlerGeometry/README.md` and three others).
- **Claim.** Cite roadmaps by name and section, not by commit.
- **Witness.** Gate output. Main's README has none.
- **Repair.** Use `../ComplexKahlerGeometry/README.md` K5–K7, `../RepresentationTheory/CompactGroups/README.md` Layer 5.1, NoncompactQuantumSymmetry M0 by name, and `../BanachAlgebras/README.md` A2.

## R11 (P3) — Mathlib PR link, and an interface that is not at the pin (gate prnum=1)

- **Location.** README lines 762–768: "Consume the generic `AdamsOperations` and `AdamsHom` interfaces of [Mathlib PR42468] … If this interface is unavailable, provide it in Tau Ceti in the same shape."
- **Claim.** The README cites a declaration that does not exist at the pin, and makes the scope conditional on Mathlib.
- **Witness.** `grep AdamsOperations` over the pinned Mathlib finds nothing.
- **Repair.** Make the package of ψᵏ on `K(X)` (composition, prime congruence, pullback compatibility) a definite T2.5 target, delete the link, and drop the "if". The conditional also persists at #1807's head (line 990).

## R12 (P3) — Edits outside the roadmap folders of this pull request (gate outside-folder=2)

- **Location.** `Completed/ArithmeticDirichletSeries/README.md` line 331 and `TauCetiRoadmap/SymplecticGeometry/README.md` line 77.
- **Claim.** Neither folder is one of this pull request's roadmap folders.
- **Witness.** `git diff --stat origin/main...HEAD` with the pull request's folders excluded lists exactly these two files.
- **Repair.** Drop both edits, or move them to the pull request that owns those roadmaps.

## R13 (P3) — The sampled targets T2.0 and T7.0 have no locator

- **Location.** README lines 651–700 (T2.0) and 1186–1254 (T7.0). Neither paragraph cites a source.
- **Claim.** Every claim needs its locator.
- **Witness.**
  - T2.0's compact case is hatcher-vbkt §2.1, pp. 39–40 (lines 1504–1558, which assume compact Hausdorff bases), and its homotopy invariance is Theorem 1.6, p. 20 (line 788). The paracompact, unbounded-rank extension is the roadmap's own.
  - T7.0's manifest entry `sibson-1969` (pp. 19–21) is never cited in the README.
- **Repair.**
  - At T2.0 add "(Hatcher, VBKT, §2.1, pp. 39–40; Theorem 1.6, p. 20)".
  - At T7.0 add "(Sibson 1969, pp. 19–21)" and list Sibson under References.

## R14 (P3) — README and Lean names disagree

- **Location.**
  - Sixteen backticked names of this roadmap appear in the README but are not declared in `Suggested.lean`: `complexKClassifyingMap`, `realKOClassifyingMap`, `adamsOperation`, `adamsOperation_lambdaSeriesComparison`, `adamsOperation_frobeniusModPrime`, `adamsOperation_bottSphere`, `suspensionRight`, `coneBoundary`, `stableRealGrassmannian`, `stableComplexGrassmannian`, `stableOrientedGrassmannian`, `stableOrientedGrassmannianWhitneySum`, `stableRealGrassmannianShear`, `stableRealGrassmannianInverse`, `stableOrientedGrassmannianInverse` and `stableGrassmannianInverseComplementComparison_stabilization`.
  - Conversely, `partitionGap`, `adamsValueOfLambdaSeries` and `exists_finite_trivial_embedding` are declared in the Lean file but never mentioned in the README.
- **Claim.** A backticked name of the roadmap's own claims a Lean declaration.
- **Witness.** A grep of the README's backticked identifiers against the declarations in `Suggested.lean`.
- **Repair.** Write README-only names in italics. After R07/R08, every Lean name appears in the README.

## R15 (P3) — The README is not in house form

- **Location.**
  - Line 1, "# Topological K-theory of vector bundles": there is no `# Roadmap:` title and no `**Summary.**` paragraph.
  - The sections are "Scope, carriers and suppliers" and "T1."–"T7." headings. There is no Exact supplier contracts, How to read the build, `## Layer k`, `### k.n`, Examples, Dependencies or Downstream consumers section.
  - The text has process words: "prototype" (lines 37 and 798) and "If this interface is unavailable" (line 767).
- **Claim.** Definitions lack API bullets and three Checks, and no target has a `*Needs:*` line.
- **Witness.** `grep -c '\*\*Checks\.\*\*'` and `grep -c '\*Needs:\*'` both return 0.
- **Repair.** Recast T1–T7 as Layers 1–7 with `### k.n` subsections. Give each definition API bullets and at least three Checks; for example, the Checks for β could use the Conventions computations (`s₀=z·s∞`; the folded symbol `z̄` gives `−β`). Give each target a `*Needs:*` line, and move suppliers into Exact supplier contracts.

## R16 (P3) — #1854 changes this roadmap, with no stated order

- **Location.** The pull request's description: its merge-order paragraph names #1101 and #1807 only.
- **Claim.** #1854 rewrites the same TopK supplier bullet (its head's README line 54 is "its Stage 5.5 supplies the bundle-to-Serre comparison"). It also conflicts with this pull request in `AlgebraicTopology`, `CharacteristicClasses`, `ClassifyingSpaces` and `RigidAnalyticGeometry`.
- **Witness.** `roadmaps overlaps TopologicalKTheory`.
- **Repair.** State in the description whether #1854 merges before or after this pull request, and rebase on it if it comes first. After R01 this pull request no longer touches TopK.

## Verified sound

**Gate and build.**
- My gate re-run at dc47c7e agrees with the worker's on every rule except outside-folder: I get 28 because my run also counts this pull request's own folders; the worker's 2 is the right count.
- `lake env lean …/Suggested.lean` exits 0 with 17 `sorry` warnings and nothing else.
- I compiled `scratch/signatures/SignatureCheck.lean` (30 `#check @`). The only binders dropped are on `RelativeSymbol` (`IsTopologicalAddGroup`, `ContinuousSMul`). No field needs them; `VectorBundle` and `→L[ℂ]` need neither. I did not edit the file.

**Dependency check.** `gate --depcheck … --movable`: "depcheck: 239 roadmaps, 2375 edges, 0 problem(s)". No UPWARD or CYCLE line. The CC mutual citation (R03) and the HomotopySpheres citation (R02) are prose citations that the dependency check does not read.

**Library declarations opened at the pins.**
- Tau Ceti:
  - `Topology/Grassmannian/Basic.lean:52,57,120,127,181,216,246`; `Orthonormal.lean:54,218`; `Projectivization.lean:46`; `Tautological.lean:143,150`; `Oriented.lean:44,53`
  - `Topology/PartitionOfUnity/Gap.lean:67,203,217,236,368,419`
  - `Topology/VectorBundle/TrivialEmbedding.lean:137`
  - `Topology/VectorBundle/FiniteRank/Basic.lean:56,209`; `Biproduct.lean:353`; `Pullback.lean:43,140`
  - `CategoryTheory/GrothendieckGroup/Split.lean:128,156,271,577`
  - `RingTheory/PowerSeries/Log.lean:73,89`; `RepresentationTheory/RepresentationRing/Basic.lean:106`
  - `Topology/Homotopy/Covering.lean:142`; the modules `Spin/Structure`, `Spin/OddStructure` and `Spin/Polarization/CliffordAction`; `Analysis/Fredholm/{SmallPerturbation,CompactPerturbation,ContinuousFamily}`
- Mathlib:
  - `LinearAlgebra/Orientation.lean:116,217`; `RingTheory/MvPolynomial/Symmetric/NewtonIdentities.lean:245`
  - `Topology/PartitionOfUnity.lean:185,295,430`; `Topology/Homotopy/Lifting.lean:310,343`
  - `RepresentationTheory/Continuous/Basic.lean:55`; `Analysis/Normed/Operator/Fredholm/{Basic,Open}`
  - There is no smooth manifold structure on Grassmannians at the pin, so T1.5's smooth upgrade is a legitimate new target.

**Cross-roadmap citations resolved at this head.**
- AT 4.5 (`cwProductKelley`, `basedHomotopyInverseOfEquivalence`, lines 737–753), AT 4.6 (line 816, smooth RPⁿ), AT 5.5 (lines 1007–1037 and 1136, which names TopK T1.5), AT 8.1 (`homotopyGroupKelleyProduct`, line 1890) and AT 8.5 (line 1969).
- CKG K1, K5 and K7.1 (lines 2182–2222: real restriction and atlas agreement); K7.2's O(−1) (line 2226).
- GeneralizedCohomology G4.0b, G2.8 and G5.0 (GC's table at line 38 consumes TopK T1.5; there is no return edge).
- CharacteristicClasses C1.1a/b and C1.5; DGFloerPartII 4.2a–4.2c (#1799 head, lines 1414–1510 and 1879).
- The rest resolve by name on main: GrothendieckEulerForms, SmoothBundlesConnections, CompactGroups, BanachAlgebras, LieGroups, SpinRepresentations and GeometricTopology.

**Sources.** hatcher-vbkt lines 517–518 (Prop 1.4, p. 13), 788–795 (Thm 1.6 and Prop 1.7, p. 20), 1161–1162 (Thm 1.16, p. 29) and 1504–1558 (§2.1, pp. 39–40: K(X) for compact X, the splitting `K≈K̃⊕ℤ`, the ring structure, homotopy invariance of f*). T2.0's compact statements agree with these pages.

**Adversarial table.** Every row shows the values computed on each side.

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| Conventions: L with transition z is O(−1) | `[z:1]`, s₀=(z,1), s∞=(1,1/z) | s₀ = z·s∞, so the first-to-second transition is z | holds |
| Folded rank-one Koszul symbol z̄ gives −β | K(S²), (H−1)²=0 | H(2−H)=2H−H²=1, so H*=2−H and [H*]−1=1−H=−β | holds |
| Wedge vs Koszul class `(−1)^r det E·u_dual` | r=1, zero section | wedge gives 1−E; (−1)·E·(1−E*) = −E+1 | holds |
| T2.0: `rc=2`, `cr=1+conj` | real line ℝ; complex line L | r(c(ℝ)) = r(ℂ) = ℝ² = 2; c(r(L)) = L⊕L̄ | holds |
| T2.0: empty base gives the zero ring | X=∅ | one bundle up to isomorphism, so the trivial line is 0 and 1=0 | holds |
| T2.0: K⁰(ℝ)=ℤ, K_c⁰(ℝ)=K̃(S¹)=0 | ℝ contractible; GL_n(ℂ) connected | homotopy invariance gives K⁰(pt)=ℤ; every bundle on S¹ is trivial | holds |
| T2.0: arbitrary products over ∐X_i | X=ℕ discrete | (0,1,2,…) is realised by rank n at n; a finite-support claim would fail | holds |
| T2.5: λ'_t/λ_t = Σ(−1)^(k−1)ψ^k t^(k−1) | a line L | L/(1+Lt) = Σ(−1)^(k−1)L^k t^(k−1); ψ^kβ = (1+β)^k−1 = kβ | holds |
| Lean `adamsValueOfLambdaSeries`: index n gives ψ^(n+1) | coefficient of tⁿ | (−1)ⁿ·coeff_n(λ'λ⁻¹) = ψ^(n+1) | holds |
| T5.2 relation `Σ(−1)^j[Λ^jE]t^(r−j)=0` | r=1; r=2 trivial; r=0; E=M⊕1 | t−E=0; (t−1)²=0; 1=0 in the zero ring; (t−1)(t−M)=0 | holds |
| T4.3 companion pencil | d=1, d=2 | det[[1,−z],[p₁,p₀]] = p₀+p₁z; the 3×3 determinant is p₀+p₁z+p₂z² | holds |
| T4.5 H_t(z) = (A+tB)z+(tA+B) | \|z\|=1, 0≤t<1 | H_t = (1+tz)(A·m_t(z)+B) with m_t(z)=(z+t)/(1+tz) mapping S¹ to S¹; H_0 = Az+B; A+tB → A+B = H(1) | holds |
| T4.6 β-coefficient `[V_d]−m[E]` | p=z; z⁻¹ | V=E gives E, and E⊗L = E+Eβ; −E, and E⊗L* = E(1−β) | holds |
| T3.5 block matrix M | entries of M*M and MM* | diagonals σ*σ⊗1+1⊗τ*τ, σσ*⊗1+1⊗ττ*; (1,2) entry −σ*⊗τ*+σ*⊗τ* = 0 | holds |
| T1.5a boundary of degree 1−(−1)^m | m=1; m=2 | x↦2⟨x,e⟩x−e is θ↦2θ, degree 2; f(−x)=f(x) on S² gives degree 0 | holds |
| T1.5a π₁SO(n) | n=0,1,2,3 | 0, 0, ℤ, ℤ/2 | holds |
| T1.6b connectivity of V_(2k)(𝕜^(3k)); dim D | ℝ, ℂ | 3k−2k−1 = k−1; 2(3k−2k) = 2k; dim D = r+(N−jk) = r+(r−j)k | holds |
| T1.6c Whitney sign ε_k | k=1..7 | k(k−1)/2 inversions; ε = +,−,−,+,+,−,− (−1 exactly when k ≡ 2,3 mod 4); ε_kε_(k+1)(−1)^k = (−1)^(k²+k) = 1 | holds |
| T1.6c μ(sV,sW) against s²μ(V,W) | frames | (e₀,A,e₁,B) vs (e₀,e₁,A,B): e₁ passes k vectors, sign (−1)^k | holds |
| T1.6d virtual dimension k−n | (k,2n)→(k+1,2n+2) | (k+1)−(n+1) = k−n | holds |
| T7.0 shear | π_* | sh_*(a,b) = (a,a+b), inverse (a,b−a); μ(*,*) = span(e₀..e_(2k−1)) = *_(2k) strictly | holds |
| T7.0 complement class | Gr(k,ℝᴺ) | −([γ]−k) = [γ^⊥]−(N−k) from γ⊕γ^⊥=N; with rank −k this is [γ^⊥]−N | holds |
| T7.0 basepoint track | k=0 | rotate e_i to e_(N+i), then back along the same arc: a backtracking loop | holds |
| T7.1 c and r on generators | conj(u)=−u | c(r(u)) = u−u = 0 = c(η²); c(r(u²)) = 2u² = c(a); c(r(u⁴)) = 2u⁴ = c(2b); c(a²) = 4u⁴ = c(4b) | holds |
| T7.3 relative failures | (D²,S¹), (D³,S²) | rank β = 0, so ℤ→K(D²) is zero; K(D³)=ℤ·1 misses β | holds |
| T6.6 U(r)/(U(r−1)×U(1)) ≅ CP^(r−1) | dimensions | r²−(r−1)²−1 = 2r−2 = dim_ℝ CP^(r−1) | holds |
| T1.6a rank-0 orientations | `Orientation ℝ (Fin 0→ℝ) (Fin 0)` | exactly two orientations (`eq_or_eq_neg_of_isEmpty`), fixed by every isomorphism (`map_of_isEmpty`); [pt,BSO(0)] has one element | holds |
| Lean `partitionGap` identity | weights (0.7,0.3); (0.5,0.5) | 1·0.4+2·0.3 = 1; ties give 0, 0, and 2·0.5 = 1 | holds |
| Lean `exists_continuous_inside_projection` | scalar λ·1 with \|λ\|<1 and >1; k=0 | P=1 and P=0; k=0 forces v=0; `[CompactSpace X]` is unused (a note, not a finding) | holds |
| Lean `isUnit_segment_of_uniform_inverse_bound` | t=0, t=1 | (1−t)u+tB = u(1+t·u⁻¹(B−u)) with norm < 1 | holds |
| Lean monoid exercise | general argument | f(st)=1 forces st=1 and ts=1, so S is a group and the kernel is trivial | holds |
| R07 probe statements | elaboration | three statements elaborate; `EssentiallySmall.{0}` is inferred | statable |
| R05 probe | one tactic each | six Grassmannian declarations close | duplicates |

**Ownership against open pull requests.** I checked #1807, #1854 and the CC, IndexTheory and GC heads named by `roadmaps overlaps`, and DGFloerPartII #1799. The overlaps file lists no dropped or revision-only ids.

## Not verifiable

- `sibson-1969` (T7.0, pp. 19–21) is paywalled (uncertified). Hatcher's *Algebraic Topology* (pi.math.cornell.edu/~hatcher/AT/AT.pdf, §3.C and its exercises) states no H-space inverse theorem that T7.0 could cite. I checked the shear argument's algebra myself (table).
- `atiyah-bott-1964`, `abs-1964`, `atiyah-1968-bott-index` and `husemoller-fibre-bundles` are uncertified. The KO ring and Clifford sign conventions of T7.1 were checked only for internal consistency (table), not against ABS §§6 and 11.

## Source issues

- none
