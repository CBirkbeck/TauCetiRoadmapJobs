# Review of TopologicalKTheory (pull request #1807 at 4aa8b0b)

**Verdict:** needs changes

The pull request changes only `TauCetiRoadmap/TopologicalKTheory/README.md` in this folder (54 insertions, 16 deletions): T1.5 now owns the smooth graph-chart upgrade of its finite real/complex Grassmannians and the rank-one projective diffeomorphisms formerly cited from GeneralizedCohomology G4.0b, and the Serre-fibration homotopy sequence is cited from AlgebraicTopology Stage 5.5 instead of DGFloer Layer 1. Both moves are consistent on both sides (see Verified sound). The gate fails on this head, mostly on pre-existing form of `Suggested.lean`; every failing check is a finding below, with the remaining findings from the full review of the folder. Findings marked *pre-existing* are not introduced by this pull request.

## R01 (P1) — Gate: the build fails on the import header

- **Location.** `TauCetiRoadmap/TopologicalKTheory/Suggested.lean` lines 1–15: `import TauCeti.RingTheory.PowerSeries.Log` first, then thirteen `import Mathlib.<submodule>` lines, no `import Mathlib`. *Pre-existing.*
- **Claim.** The gate's `build`, `imports`, `mathlib-subimports` and `no-import-mathlib` checks all fail (gate: `build=13 … imports=1 mathlib-subimports=13 no-import-mathlib=1 FAIL`); the thirteen build messages are the module-system warnings produced by the submodule imports.
- **Witness.** The file elaborates under `lake env lean` with only `sorry` warnings, so nothing but the header is wrong. A scratch copy whose header is the three lines below elaborates in 7 s with only `sorry` warnings.
- **Repair.** Replace lines 1–15 by exactly
  ```lean
  import Mathlib
  import TauCeti.RingTheory.PowerSeries.Log
  import TauCeti.CategoryTheory.GrothendieckGroup.Monoidal.Basic
  ```
  (tested on the scratch copy). No other change is needed for the build.

## R02 (P2) — Three definitions with `sorry` in their bodies

- **Location.** `Suggested.lean` lines 238–240 (`finiteGrassmannianFrameSpan`), 258–260 (`finiteGrassmannianOrthonormalSpan`), 274–277 (`finiteGrassmannianQuotientConventionEquiv`, whole body `sorry`). Gate `sorry-data=3`. *Pre-existing.*
- **Claim.** Sorry'd data is a blocking defect; the topology instance at line 242 and four theorems mention the first two.
- **Witness.** Both span definitions have real bodies at the pin, tested in a scratch file: the finrank side goal closes by `rw [finrank_span_eq_card f.2]; simp` for the full-rank frame, and for the orthonormal frame by first obtaining `LinearIndependent 𝕜 f.1` as `LinearIndependent.of_comp (WithLp.linearEquiv 2 𝕜 (Fin N → 𝕜)).symm.toLinearMap f.2.linearIndependent`, then the same rewrite. The quotient-convention equivalence is a theorem about `Module.Grassmannian` (a structure extending `Submodule` with `rankAtStalk` of the quotient equal to `k`, `Mathlib/RingTheory/Grassmannian.lean` lines 66–69): its body needs `finrank_quotient_add_finrank` and projectivity of the quotient, i.e. it is a target, not a simple definition.
- **Repair.** Give the two span definitions the bodies above. Delete `finiteGrassmannianQuotientConventionEquiv` and `finiteGrassmannianQuotientConventionEquiv_submodule` (lines 273–282) from the file; T1.5 in the README already states the comparison with its `N−r` quotient-rank convention and keeps it as a target.

## R03 (P2) — Supplier drift: "CompactGroups Layer5.1" and its Banach density theorem

- **Location.** README line 88–90: "CompactGroups Layer5.1 supplies Haar averaging, Peter–Weyl and the generic G-finite-vector density theorem for strongly continuous Banach representations"; consumed at T6.1, lines 1008–1010. *Pre-existing.*
- **Claim.** CompactGroups on main has no subsection 5.1, and no statement about G-finite vectors, Banach representations or strong continuity anywhere (its Layer 5, lines 318–368, is Peter–Weyl with density in `C(G)` and `L²(G)`; a whole-file search for "G-finite", "Banach", "strongly continuous", "orbit span" returns nothing). T6.1 says explicitly that Peter–Weyl for `C(G)` or an `L²` density statement alone is not a substitute, so the theorem it consumes is unowned as cited.
- **Witness.** AutomorphicFormsOnReductiveGroups §2.1 (open head at #1037, supplier-contract line "What CompactGroups must provide (gap:banach-gfinite-density)") declares exactly this theorem as a gap on CompactGroups Layer 5: the predicate `IsGFinite`, the submodule `gFiniteSubmodule` and `gFiniteSubmodule_dense` for a compact Hausdorff group acting on a complex Banach space with continuous orbit maps. NoncompactQuantumSymmetry M0 (open head at #1015, scope line 9) likewise consumes it from that declaration.
- **Repair.** In both places cite "CompactGroups Layer 5, with the declared gap `gap:banach-gfinite-density` (AutomorphicFormsOnReductiveGroups §2.1: `IsGFinite`, `gFiniteSubmodule`, `gFiniteSubmodule_dense`)" and drop "5.1"; keep T6.1's own continuous-section and `L²`-section applications as stated.

## R04 (P3) — Commit-pinned blob links and pull-request numbers

- **Location.** README lines 83, 88, 92, 96 (links of the form `github.com/…/blob/<sha>/…`), line 108 (HomotopySpheres cited through `pull/1287`), line 763 (`Mathlib PR42468`). Gate `blob=4`, `prnum=1`.
- **Claim.** Policy: link a path on main or name the roadmap and section; never a pull-request number, including for roadmaps still in pull requests. `AdamsOperations`/`AdamsHom` do not exist at the pinned Mathlib (no `class AdamsOperations` or `structure AdamsHom` anywhere), so the Mathlib pull request is the only thing the sentence points at.
- **Repair.** Lines 83, 96: relative links `../ComplexKahlerGeometry/README.md`, `../BanachAlgebras/README.md`. Line 88: `../RepresentationTheory/CompactGroups/README.md`. Line 92: name "NoncompactQuantumSymmetry M0" without a link (it is not on main). Line 108: "HomotopySpheres §4A–4B" without a link. Line 762–763: "Consume a generic `AdamsOperations`/`AdamsHom` interface over ℤ if Mathlib provides one; otherwise provide it in Tau Ceti in the same shape", with no number.

## R05 (P3) — "Native bundle-to-Serre adapter" does not exist at the pin

- **Location.** README line 307 ("Consume the native bundle-to-Serre adapter and AT5.5's actual based LES") and line 53–54 ("native bundle-to-Serre comparison"), the latter introduced by this pull request.
- **Claim.** A claim that the library has something is checked at the pin: the pinned Tau Ceti has no `serreFibrations`, `mem_serreFibrations_*` or `hasHomotopyLiftingProperty_proj_cube`, and the pinned Mathlib has no `HomotopyLiftingProperty` (searches over both trees return only Lie-algebra "Serre relations"). AlgebraicTopology Stage 5.5 cites these names as native too, which is that roadmap's own finding; here the word "native" is the defect.
- **Repair.** Write "AlgebraicTopology Stage 5.5's bundle-to-Serre comparison and based homotopy long exact sequence" in both places, so the owner is the supplier section rather than a library declaration.

## R06 (P3) — Padding in `Suggested.lean`

- **Location.** `Suggested.lean` lines 250–252, 268–271, 117–121, 221–226, 279–282. *Pre-existing.*
- **Claim and witness.** `finiteGrassmannianFrameSpan_isQuotientMap` restates the definition of the topology (line 244 coinduces it): on a scratch copy it closes by `exact ⟨⟨rfl⟩, finiteGrassmannianFrameSpan_surjective 𝕜 r N⟩`. `finiteGrassmannian_isEmpty_of_rank_gt` is the `r > N` boundary case (closes from `Submodule.finrank_le`, tested). `bijective_of_surjective_trivial_identity_fiber` is a theorem about free variables only (an arbitrary monoid), the T2.4 exercise. `isUnit_segment_of_uniform_inverse_bound` is the Neumann-series one-liner `(1−t)u+tB = u(1 + t·u⁻¹(B−u))`. `finiteGrassmannianQuotientConventionEquiv_submodule` restates the intended definition of the equivalence it is about (see R02).
- **Repair.** Delete these five declarations from `Suggested.lean`; the README keeps each as a target or Check (T1.5 for the three Grassmannian facts, T2.4 for the monoid exercise, T4.2 for the segment invertibility).

## R07 (P3) — `Suggested.lean` form: docstring, headlines not named, sections, docstrings

- **Location.** `Suggested.lean` lines 17–23 (module docstring), 231, 234, 242, 246, 250, 258, 268 (declarations without docstrings). *Pre-existing.*
- **Claim.** The module docstring must say which headline theorems are not statable at the pins and what each lacks. The roadmap's headline theorems are complex Bott periodicity `K(X)⊕K(X)≃K(X×S²)` (T4), the complex Thom isomorphism (T5.3), equivariant Thom and representation Bott `R(G)≃K_(G,c)(V)` (T6.7), real periodicity with coefficient ring `ℤ[η,a,b,b⁻¹]/(2η,η³,ηa,a²−4b)` (T7.1) and `K(S²)≃ℤ[β]/(β²)` (T4.7). None is statable: the pinned libraries have no topological K-group carrier (`TauCeti.SplitK0` exists, but the finite-rank bundle category over a space does not), no `K_G`, no Thom class. The current docstring says only that these "are specified in the README". The file also has one `/-! ### T1.5 … -/` comment and no layer sections, and seven declarations without docstrings.
- **Repair.** Rewrite the docstring as "Topological K-theory: target signatures", stating that the roadmap is README.md, that the file states headline theorems against the pinned APIs, and listing the five headlines above with the missing carrier of each (K-groups of a space, equivariant K-groups, Thom classes). Add `/-! ## T1 … -/`-style section comments in README order and a docstring on every remaining declaration.

## R08 (P3) — README shape: no Checks, no per-claim locators, no `*Needs:*` lines

- **Location.** Whole README. The seeded targets show it: T2.0 (lines 651–700) and T7.0 (lines 1186–1254) carry no locator; T7.0 cites no source at all; the reference list (line 1379) names Hatcher "§1 and §§2.2–2.3" although T2.0's group completion is Hatcher §2.1 (Proposition 2.1 and the formal-difference construction, printed pp. 39–40, `hatcher-vbkt` lines 1505–1558). *Pre-existing.*
- **Claim.** Every definition needs an API list and at least three discriminating `**Checks.**`; every theorem its locator; every target a `*Needs:*` line; the headings `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, layers with `### Examples` and `### Dependencies`. The README has none of the `**Checks.**` bullets and none of the `*Needs:*` lines; its worked values (e.g. the degree `1−(−1)^m` at line 313, the sign `ε_k` at line 596, the gap identity at lines 388–393) are inline prose.
- **Repair.** Minimal for the next round: add the Hatcher §2.1 locator to T2.0 and change the reference line to "§§2.1–2.3"; add a locator for T7.0's connected-H-space inverse (none of the manifest's texts states it; record the text used in `sources.toml`); convert the three worked values just named into `**Checks.**` bullets of their definitions. The full re-shaping is larger than this pull request and may be scoped as its own change, but the two missing locators on the sampled targets are needed now.

## R09 (P3) — Manifest and reference list disagree

- **Location.** README line 1383 cites Atiyah, *Bott periodicity and the index of elliptic operators* (1968), §§2 and 4, Proposition 4.9, for T6.5; `sources.toml` has no entry for it. Conversely the manifest records `mitchell-principal-bundles`, `kolar-michor-slovak` and `husemoller-fibre-bundles` for T6.4, which the README's reference list omits.
- **Claim.** Every cited work is recorded in the manifest, and the README's references are the roadmap's sources.
- **Repair.** Add the Atiyah 1968 entry (DOI 10.1093/qmath/19.1.113; it will be `uncertified` if only the paywalled page resolves) and list the three T6.4 sources under the README's references.

## Verified sound

**Gate and tooling.** Gate at 4aa8b0b read from `gate.md` (R01, R02, R04 cover every failing check; `stray-files=0`, `outside-folder=0`, `set_option=0`, `latex=0`, `residue=0`). Dependency check run with `--movable`: `depcheck: 235 roadmaps, 2178 edges, 0 problem(s)` (no UPWARD or CYCLE line). `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. `git diff --stat origin/main...HEAD` outside the named folders: empty. `lake env lean Suggested.lean`: 17 `sorry` warnings, no error, 2.6 s. Elaborated signatures compared with the README for all 30 declarations: the only "dropped binder" lead (`RelativeSymbol`, section instances `IsTopologicalAddGroup`/`ContinuousSMul` absent from the elaborated type) is harmless, since neither `→L[ℂ]` nor `VectorBundle` needs them and the structure carries its own `FiberBundle`/`VectorBundle` binders.

**The two moves of this pull request.** (1) T1.5 smooth upgrade: GeneralizedCohomology at this head (G4.0b, lines 1992–2000 and supplier table line 38) consumes TopK T1.5's smooth graph-chart upgrade, orthogonal-complement diffeomorphisms, stabilization/sum and scalar-forgetting maps, rank-one diffeomorphisms and interleaved real model transport, and defines no second real/complex Grassmannian manifold; AlgebraicTopology Stage 4.6 (line 821–835) builds the real projective `C^∞` Mathlib manifold structure on `Projectivization ℝ (Fin (n+1) → ℝ)`; ComplexKahlerGeometry K7.1 (lines 1407–1443) builds the `Projectivization ℂ (Fin (n+1) → ℂ)` atlas with model `Fin n → ℂ`, its real restriction and K1's orientation; K7.2 owns O(−1). `Projectivization.equivSubmodule : ℙ K V ≃ {H : Submodule K V // finrank K H = 1}` exists at the pin (`Mathlib/LinearAlgebra/Projectivization/Basic.lean` line 164), so the rank-one pinning to `finiteGrassmannian 𝕜 1 (n+1)` is literal. Dimensions: Gr_ℝ(1,2)=RP¹ has dimension 1·1=1; Gr_ℂ(1,2)=CP¹ has real dimension 2·1·1=2; the interleaved block (Re z₀, Im z₀, …) matches K7.1's complex-linear comparison with `EuclideanSpace ℂ (Fin n)`. (2) AlgebraicTopology Stage 5.5 (lines 1017–1148) owns the fibration homotopy long exact sequence with components and names "TopologicalKTheory T1.5 consumes the based homotopy sequence" (line 1146); the removed DGFloer citation leaves no residue ("DGF" occurs nowhere in the README). The new dependency sentence (line 1365–1366) is consistent with T6.6 (line 1119–1126).

**Other supplier citations resolved** (section exists and states what is consumed): AlgebraicTopology 4.5 (`basedHomotopyInverseOfEquivalence` line 756, `cwProductKelley` line 767), 8.1 (`homotopyGroupKelleyProduct` line 1866, "TopK T7.0 uses it" line 1873), 8.5 (Whitehead, line 1928); GeneralizedCohomology G2.8 and G5.0 (named as owners of the permutative machine and the Spin lift, lines 1677, 2254–2306); CharacteristicClasses C1.1a (line 246, "Before TopK T1.6"), C1.1b (line 271, "After TopK T1.6a and T6.4"), C1.5/C1.5a (lines 477–587) at this head; HomotopySpheres §4A (lines 1202–1340) and §4B.1–4B.9 (lines 1343–1480) at its open head; BanachAlgebras Layer 2.1 "Holomorphic germs and Riesz projections" (line 442; the README's "A2" is that roadmap's own label); GeometricTopology Layer 1 tubular neighbourhoods (line 177, 218–221); SmoothBundlesConnections B1.4 (line 421) and B2 (`L²(E,h,μ)` of sections, line 33–34); RootSystems Layer 3.2 type A as a permutation group (line 562) with Tau Ceti exchange/deletion/Bruhat (lines 166–177); `TauCeti.RepresentationTheory.Spin.Structure`, `…Spin.OddStructure`, `…Spin.Polarization.CliffordAction` are modules at the pinned Tau Ceti (the README calls them by their short module names). NoncompactQuantumSymmetry M0 exists at its open head (#1015, Layer 3/M0) and is not on main.

**Mutual citation with HomotopySpheres, checked at target level.** HomotopySpheres 4A.2 needs TopK T1.5–T1.6; TopK T1.6d consumes HS 4B.1's model `R₀` and T7.1 consumes §4B.1–4B.9; HS 4B.1 needs only RiemannianGeometry R1–R2 and 4B.6 needs 4A. So HS 4A.2 → TopK T1.6d → HS 4B.1 → RiemannianGeometry has no cycle, and the mechanical check reports none.

**Library declarations opened at the pins.** `Module.Grassmannian` (`Mathlib/RingTheory/Grassmannian.lean` 66–69: extends `Submodule`, quotient finite projective of constant `rankAtStalk` `k`; the README's "`N−r` locally free quotients, retaining the submodule" is exactly this); `PartitionOfUnity.finsupport` (184), `exists_finset_nhds` (294), `exists_isSubordinate` (429, needs `NormalSpace` and `ParacompactSpace`, as the README says); `Orientation.map_of_isEmpty` (116), `eq_or_eq_neg_of_isEmpty` (217); `MvPolynomial.psum_eq_mul_esymm_sub_sum` (`NewtonIdentities.lean` 245); `ContRepresentation` (`RepresentationTheory/Continuous/Basic.lean` 54, no orbit-continuity, as T6.2 notes); `IsCoveringMap.liftHomotopy` (308) and `liftHomotopyRel` (341) in `Topology/Homotopy/Lifting.lean`; `OnePoint.equivProjectivization` (`ProjectiveLine.lean` 83); Mathlib `Analysis/Normed/Operator/Fredholm/{Basic,Open}.lean` and Tau Ceti `Analysis/Fredholm/{SmallPerturbation,CompactPerturbation,ContinuousFamily}.lean` present; `TauCeti.SplitK0` (`GrothendieckGroup/Split.lean` 113) with `of_biprod` (141), `liftEquiv` (256), `grothendieckAddGroupEquiv` (457); `TauCeti.repRing` (`RepresentationRing/Basic.lean` 106); `IsCoveringMap.existsUnique_continuousMap_lifts_of_subsingleton_fundamentalGroup` (`Topology/Homotopy/Covering.lean` 133); `PowerSeries.logDeriv` and `logDeriv_mul` (`TauCeti/RingTheory/PowerSeries/Log.lean` 48, 64). Not at the pin: `AdamsOperations`/`AdamsHom` (R04), any Serre-fibration or homotopy-lifting declaration (R05).

**Sources.** `hatcher-vbkt` lines 1505–1558 (§2.1, pp. 39–40): base spaces compact Hausdorff; `K(X)` as formal differences with `E₁−E₁′=E₂−E₂′` iff `E₁⊕E₂′` stably isomorphic to `E₂⊕E₁′`; `K(X)≃K̃(X)⊕ℤ` by a basepoint. This supports T2.0's compact-base statements and T2.2's splitting; T2.0's paracompact extension with an arbitrary common summand `G` is the roadmap's own generalisation (on compact `X` the two relations agree, since `G` has a complement `G′` with `G⊕G′` trivial, Proposition 2.1's proof). `hatcher-vbkt` line 2450 (Theorem 2.20, p. 62) and 2469–2508 (Newton polynomial definition, splitting principle) support T2.5's locator "§2.3, Adams operations and splitting". `debray-freed-ktheory` contents (lines 17–18): §5 "The K-theory of X×S²", §6 "The K-theory of the spheres", matching T4's citation. `kriz-may` line 3790 (Theorem 1.5, the linear isometries operad) matches T1.6b's citation. `segal-1968` §2 (line 138) and §3 (line 387) match T6.

**Adversarial table** (one row per statement checked; values on each side).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| T2.0 pair relation `(E,F)~(E′,F′)` iff `∃G, E⊕F′⊕G≃E′⊕F⊕G` | compact X; X=∅; X=ℝ | compact: G replaceable by trivial `ε^n` (Hatcher p. 39); ∅: zero ring; `K⁰(ℝ)=K⁰(pt)=ℤ`, `K_c⁰(ℝ)=K̃(S¹)=0` | agrees with README lines 655, 660, 689–690 |
| T2.5 `Σ_(k≥1)(−1)^(k−1)ψᵏ t^(k−1)=λ′_t/λ_t` and Lean `adamsValueOfLambdaSeries` | line L; β | `λ_t(L)=1+Lt`, `λ′/λ=L−L²t+L³t²…`, coeff_n·(−1)^n = `L^(n+1)=ψ^(n+1)(L)`; for β: `ψᵏβ=(1+β)ᵏ−1=kβ` (β²=0) | sign and index agree |
| T2.5 Newton congruence `N_p≡e₁^p mod p` | p=2 | `N₂=e₁²−2e₂≡e₁²` | holds |
| T1.6c sign `ε_k=(−1)^(k(k−1)/2)`, `μ(sV,sW)` vs `s²μ` sign `(−1)^k`, `ε_kε_(k+1)(−1)^k=1` | k=1,2,3 | interleaved frame `(e₀,e₂,…,e₁,e₃,…)`: inversions `k(k−1)/2` = 0,1,3; `ε`=+,−,−; `ε_kε_(k+1)(−1)^k` = 1·(−1)·(−1)=1, (−1)(−1)(+1)=1 | consistent, strict diagonal identity follows |
| T1.5a degree of `x↦2⟨x,e⟩x−e` = `1−(−1)^m` | m=1; m=2 | m=1: `(cos2θ, sin2θ)`, degree 2; m=2: 0 | matches ℤ/2 for m odd, ℤ for m even |
| T1.5a `π_m V_r(ℝ^n)` | `V_1(ℝ^n)=S^(n−1)`; `V_2(ℝ^3)`, m=1; `V_2(ℝ^4)`, m=2 | ℤ; ℤ/2; ℤ | agrees with lines 308–310 |
| T1.5a `π₁(SO(n))` | n=1,2,3 | 0, ℤ, ℤ/2 | agrees with line 321–322 |
| Conventions: folded rank-one Koszul symbol has class `−β` | trivial line on ℂ, `L=O(−1)` with transition z | folded even→odd map is `z̄`, glued bundle `O(1)=L⁻¹`, `[L⁻¹]−1=(1+β)⁻¹−1=−β` | consistent with T5.3's "negative of T4's β" |
| T5.2 relation `Σ(−1)^j[Λ^jE]t^(r−j)=0`, `t=[O(−1)]` | r=2, `E=M⊕1`; r=0 | `t²−(1+M)t+M=(t−1)(t−M)` (line 969); r=0: `P(E)=∅`, K=0, relation `1=0` | both agree with README |
| T1.6a gap identity `Σ_E|E|q_E=1` and `w_n` | weights (0.5,0.3,0.2); tie (0.5,0.5) | `q_top1=0.2, q_top2=0.1, q_top3=0.2`; `Σ|E|q_E=0.2+0.2+0.6=1`; tie: `q=0` for |E|=1, `q_top2=0.5`, sum `2·0.5=1` | holds, ties handled as stated |
| `sum_card_mul_partitionGap`, `partitionGap` junk values | `E=∅`; E containing a zero-weight index; ι with no j∉E | gap 0; `min=0`, gap `max(0,0−sup)=0`; outside sup defined 0 | finite support, continuity, subordination all follow |
| T2.4 / `bijective_of_surjective_trivial_identity_fiber` | S=ℕ→ℤ (not surjective, excluded); general | `t` with `f(t)=f(s)⁻¹`: `f(st)=f(ts)=1 ⇒ st=ts=1`, S is a group, kernel trivial | true; padding (R06) |
| `exists_continuous_inside_projection` | k=0; `B=diag(0,2)` constant | k=0 forces v=0, both branches 0; `P=diag(1,0)`: idempotent, commutes, `|0|<1 ↦ v`, `|2|>1 ↦ 0` | correct Riesz projection law |
| `isUnit_segment_of_uniform_inverse_bound` | u=1, `B=1+A`, ‖A‖<1; t=0 | `1+tA` invertible by Neumann series; t=0 gives u | true; padding (R06) |
| `finiteGrassmannian 𝕜 r N` and its topology | r=0; r=N; r>N; N=0 | point (⊥), point (⊤), empty, point/empty; frame space empty for r>N so coinduced topology on ∅ | consistent; `isEmpty` theorem is a boundary case |
| `Module.Grassmannian 𝕜 (Fin N→𝕜) (N−r)` vs `finrank V=r` | r≤N | quotient rank `N−finrank V=N−r` ⇔ `finrank V=r`; `toSubmodule=V` | convention claim at line 236–239 correct |
| `exists_finite_trivial_embedding` | X=∅; X compact Hausdorff | N=0 works; Hatcher Prop. 1.4 needs compact Hausdorff | hypotheses match T1.3 |
| T6.6 `U(r)/H_r≃CP^(r−1)` | r=1 | `U(1)/(U(0)×U(1))=pt=CP⁰` | handled separately as stated |
| T7.1 coefficients and `c`, `r` | `c r=1+ψ⁻¹` on `u²`; `r c=2` on a | `c(r(u²))=u²+u²=2u²=c(a)` so `r(u²)=a`; `r(c(a))=2a` | consistent with lines 1298–1302 |
| T7.1 relations `2η=η³=ηa=0`, `a²=4b` | degrees | `η³∈KO^(−3)=0`, `ηa∈KO^(−5)=0`, `a²∈KO^(−8)=ℤ` | consistent with the table at line 1303 |
| T7.3 failures | `(D²,S¹)`; `(D³,S²)` | `K(D²,S¹)=K̃(S²)=ℤ→K(D²)=ℤ` is 0 since `K̃(D²)=0`; `K̃(S²)=ℤβ` not hit from `K̃(D³)=0` | both as stated |
| T7.0 shear `sh(x,y)=(x,μ(x,y))` | π_n, connected BO | `sh_*=(a,b)↦(a,a+b)`, inverse `(a,b)↦(a,b−a)`; Whitehead on `k(BO×BO)` CW | route sound; needs a locator (R08) |
| T2.0 `K⁰(∐X_i)≃∏K⁰(X_i)` | two components of ranks 1 and 2 | ranks unbounded across components force the full product | as stated |

## Not verifiable

- `atiyah-bott-1964`, `abs-1964`, `husemoller-fibre-bundles`: settled as uncertified in the manifest; cited by locator only, not read.
- Atiyah, *Bott periodicity and the index of elliptic operators* (1968), §§2, 4, Proposition 4.9 (README line 1383): not in the manifest and not read (R09).
- T7.0 (seeded sample): the README names no source for the connected-H-space inverse; the mathematics was checked by computation (table) but no text could be opened at a locator (R08).
- Ownership against open pull requests was checked only through the sibling checkouts the brief lists and the `roadmaps grep`/`resolve` index of 2026-11-05.

## Source issues

- none
