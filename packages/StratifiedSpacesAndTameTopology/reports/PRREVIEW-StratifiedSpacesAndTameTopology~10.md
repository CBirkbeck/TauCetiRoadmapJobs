# Review of StratifiedSpacesAndTameTopology (pull request #1519 at eeaa5dc)

**Verdict:** needs changes

This is a full re-review: the folder changed by 985 lines since 1622479. The two ownership findings of the previous review are repaired. The third was a dropped-names hit outside the folder, and it no longer fires. Eight findings remain at this head. The blocking ones are a false local-triviality claim in 6.7 for the whole tube (R01) and a false identification in Layer 4 of 4.3 with RealAnalyticGeometry R2.1's bounded theorem (R02). The other six are locators, ownership prose and the Lean carrier of the open simplex.

## R01 (P2) — 6.7: the mixed tubes are not locally trivial with conical fibre over the whole tube `T_i`

Location: `TauCetiRoadmap/StratifiedSpacesAndTameTopology/README.md` 865–868, "over a small open `U ⊆ X_i`, `π_i : M^j_{ik} ∩ π_i⁻¹(U) → U` is trivial with fibre the subset of `C(L_i) ∩ closure X_k` obtained by deleting the strata indexed in `[j, k[`"; and the third Check, 881–882.

Claim: for normalised control data, the whole tube `T_i` restricted over a small `U` is a product with the cone on the link.

Witness: take ℝ with `X₀ = {0} < X₁ = ℝ ∖ {0}`, `T₀ = (−1, 1) ∪ (2, 3)`, `π₀ = 0`, `ρ₀ = x²` on `(−1, 1)` and `ρ₀ = x` on `(2, 3)`, and `T₁ = X₁`. These data satisfy every clause of AlgebraicTopologyPartII §16.1b. `T₀` meets only `X₀` and `X₁` (A10), and the indices 0 and 1 are comparable (A11). The derivative of `ρ₀` on `T₀ ∩ X₁` is `2x` or `1`, never 0. For properness take `ε₀ = 1/8`: `{ρ₀ ≤ 1/8} = [−1/√8, 1/√8]`, which is compact. Now `M^0_{01} ∩ π₀⁻¹(X₀) = (−1, 0) ∪ (0, 1) ∪ (2, 3)` has three components. But `L₀ = {±√r}`, so `C(L₀)` minus the apex has two. In the same way `M^1_{01} = T₀` has two components while `C(L₀) ≅ ℝ` has one, which refutes the third Check.

Repair: restrict the triviality to the ε-tube of AlgebraicTopologyPartII §16.1e's local conical structure. Write: "and, for a small open ball `U ⊆ X_i` and `ε > 0` small as in the local conical structure of AlgebraicTopologyPartII §16.1e, `π_i : M^j_{ik} ∩ π_i⁻¹(U) ∩ {ρ_i < ε} → U` is trivial with fibre …". Make the same change in the third Check ("`M^k_{ik} ∩ {ρ_i < ε}`, whose fibre over `U` is the whole `C(L_i) ∩ closure X_k`"). Add the data above as a negative-control Check. Tested on that instance with `ε = 1/8`: `M^0_{01} ∩ {ρ₀ < 1/8} = (−1/√8, 0) ∪ (0, 1/√8)`, which is two rays, `C(L₀)` minus the apex. And `M^1_{01} ∩ {ρ₀ < 1/8} = (−1/√8, 1/√8) ≅ C(L₀)`. The three identities `M^i_{ik} = T_i ∩ X_k`, `M^k_{ik} = T_i ∩ closure X_k` and monotonicity in `j` are correct as stated and stay.

## R02 (P2) — Layer 4 identifies bounded 4.3 with RealAnalyticGeometry R2.1's theorem and proposes that R2.1 and A4.1 restate theirs as specializations of this later roadmap

Location: `README.md` 574–576, "Restricted to bounded `A`, 4.3 is RealAnalyticGeometry R2.1's bounded affine theorem"; 599–601, "so A4.1 and R2.1 can state theirs as specializations of 4.1 and 4.3 without a cycle".

Claim: bounded 4.3 and R2.1's bounded affine theorem are the same theorem, and R2.1's theorem is a specialization of 4.3.

Witness: RealAnalyticGeometry on main, `Suggested.lean` 111–137. `FiniteCompatibleAnalyticTriangulation` has `homeomorph : complex.space ≃ₜ (⋃ i, closure (B i))` and `analytic_simplex`, so R2.1 triangulates the closure with analytic maps on the open simplices. 4.3 gives neither. For `B = {(0, 1)}`, R2.1 yields `|K| ≃ₜ [0, 1]`, while 4.3 only carries `(0, 1)`. Both roadmaps are on main, and so earlier than this one.

Repair: replace 572–576 ("For compact `A` it is … specialization of 4.1.") with the following. "For compact `A`, the union of the open simplices of `T` is closed, so `T` is a subcomplex, and 4.3 implies AffineMorseLefschetz A4.1's compatible triangulation with the complex in the same ambient space. For bounded `A`, 4.3 follows from RealAnalyticGeometry R2.1's bounded affine theorem applied to `A` and the `B_i`, by inverting its homeomorphism on `A`. R2.1 proves more: a triangulation of the closure with Nash maps on the open simplices. 4.3 adds the unbounded case." End the Dependencies paragraph at "… triangulation theorems." Tested on R2.1's two fields above, and on A4.1's `finite_semialgebraic_triangulation` (main, `AffineMorseLefschetz/Suggested.lean` 129): with `m = n` it follows from compact 4.3, because a closed union of open simplices of a finite complex contains the faces of its simplices.

## R03 (P3) — Scope assigns subanalytic sets and the o-minimality of `ℝ_an` and `ℝ_exp` to RealAnalyticGeometry, which states neither

Location: `README.md` 54–56, "Semianalytic and subanalytic sets, the o-minimality of `ℝ_an` and `ℝ_exp`, … are RealAnalyticGeometry (R1, R2, R5)".

Claim: RealAnalyticGeometry owns subanalytic sets and these o-minimality theorems.

Witness: RealAnalyticGeometry on main, `README.md` line 20: "This roadmap does not silently extend the category to subanalytic sets". "o-minimal" occurs nowhere in that README. The o-minimality of `R_an,exp` is ShimuraVarieties §3.5a (its README line 939, at the open head).

Repair: write "Semianalytic sets, Nash and analytic regularity of simplices, semianalytic dimension (R1.1) and Łojasiewicz's triangulation are RealAnalyticGeometry (R1, R2, R5). The o-minimality of `ℝ_an,exp`, and hence of its reducts `ℝ_an` and `ℝ_exp`, is ShimuraVarieties §3.5a." Move subanalytic sets to **Out of scope**: the grep over main finds no owner.

## R04 (P3) — Convention 6: the chain-length depth is attributed to Ayala–Francis–Tanaka and Nocera–Volpe, whose depth is a codimension

Location: `README.md` 109–112, "the depth of a nonempty stratum `p` is the largest `k` with a chain … have depth `0`, as in Ayala–Francis–Tanaka and Nocera–Volpe".

Witness: aft2017 line 1093 defines the local depth as `dim_x X − dim_x X_{s(x)}`. nocera-volpe2023 lines 274–278 (Definition 2.19) do the same. Their Remark 2.21 (lines 287–291) names the chain-length depth as a different notion, at most theirs. For ℝ² stratified by `{0} < ℝ² ∖ {0}`, the chain depth of the origin is 1 and the AFT depth is 2. The chain-length definition is that of almp2012 lines 412–413 (§2.1).

Repair: "as in Albin, Leichtnam, Mazzeo and Piazza, §2.1. Ayala–Francis–Tanaka, Definition 2.4.4, use the codimension `dim_x X − dim_x X_{s(x)}` instead, which is at least the chain depth (Nocera–Volpe, Remark 2.21)." Add the ℝ² example as a witness: chain depth 1 against codimension 2. The two existing witnesses do not separate the two notions, since they give 1 = 1 and 2 = 2.

## R05 (P3) — 6.2 cites ALMP §2.3's déplissage for the gluing, which is ALMP's blowdown in §2.2

Location: `README.md` 751–752, "Own construction; the gluing follows the déplissage of Albin, Leichtnam, Mazzeo and Piazza, §2.3."

Witness: almp2012 lines 693–717. §2.3 is the resolution, a blow-up, "adapting the construction of the 'deplissage'", which is 6.3's unfolding. The collapse of the fibres of the boundary hypersurfaces, which is `glue`, is Proposition 2.2 in §2.2 (lines 601–605).

Repair: "Own construction; the gluing is the blowdown of Albin, Leichtnam, Mazzeo and Piazza, Proposition 2.2 (§2.2)." In 6.3 sharpen "§2" to "Proposition 2.3 (§2.3), which adapts the déplissage of Brasselet–Hector–Saralegi".

## R06 (P3) — 6.4: wrong theorem number for unzipping

Location: `README.md` 806–807, "the unzipping of Ayala, Francis and Tanaka, Theorem 6.3.8".

Witness: aft2017 line 4305, "Theorem 7.3.8 (Unzip)" (arXiv numbering, as References line 994 says).

Repair: change "Theorem 6.3.8" to "Theorem 7.3.8".

## R07 (P3) — `openSimplex` restates Mathlib's intrinsic interior of the convex hull, in a different encoding from the two main roadmaps 4.3 is compared with

Location: `Suggested.lean` 212–217, `def openSimplex {R : Type u} [Field R] [LinearOrder R] …`, used at 229 and 231. `README.md` 532–533, and the Checks at 548 and 587, which name the Lean declaration.

Claim: the open simplex needs its own definition over an ordered field.

Witness: RealAnalyticGeometry `Suggested.lean` 126 and 135 and AffineMorseLefschetz `Suggested.lean` 143–144 (main) write the open simplex of a face as `intrinsicInterior ℝ (convexHull ℝ (s : Set _))` (Mathlib `Mathlib/Analysis/Convex/Intrinsic.lean` 61). The binders also admit `ZMod 3` ordered `0 < 1 < 2`, where the README says "ordered field". A Check must not name a Lean declaration.

Repair: delete `openSimplex`. In `exists_triangulation_semialgebraic`, write `intrinsicInterior ℝ (convexHull ℝ (τ : Set (Fin n → ℝ)))` in both places. Elaborated on a scratch copy: no error, the only warning is `sorry`, and `#check` shows the intended type. Then drop `openSimplex` from the docstring list (line 28). In 4.1, define the open simplex of an affinely independent `τ` in prose as the intrinsic interior of its convex hull, that is, the strictly positive barycentric combinations. Rewrite the Checks at 548 and 587 without the Lean name; their values (a point, an open segment, `∅`, and `[0, 1)`) are unchanged.

## R08 (P3) — wrong file for `TauCeti.IsTriangulable`

Location: `README.md` 174, "`TauCeti.IsTriangulable` (`TauCeti/Topology/Triangulable.lean`)".

Witness: at the Tau Ceti pin 2fd255d the file does not exist. The definition is `TauCeti/Topology/Triangulable/Basic.lean` line 38.

Repair: change the path to `TauCeti/Topology/Triangulable/Basic.lean`.

## Previous findings

- R01 (Layer 5 owned by AlgebraicTopologyPartII §§16.1a–16.1e): **repaired**. Scope 46–50 reads "Smooth stratified spaces, Whitney's condition (b), Thom–Mather control data … are AlgebraicTopologyPartII §§16.1a–16.1e, consumed in Layers 6 and 7". The supplier contract is at 193–208. The `*Needs:*` lines of 1.3, 6.3, 6.7, 7.2 and 7.3 are repointed, and Downstream (957) says that no roadmap cites this one.
- R02 (Layer 4 owned by ShimuraVarieties §§3.4b–3.4e): **repaired**. Scope 43–46 reads "General o-minimal structures and definable maps, … are ShimuraVarieties §§3.4b–3.4e". The supplier contract is at 179–191. `OMinimalStructure`, `IsCell`, `IsCellDecomposition`, `exists_isCellDecomposition` and `exists_oMinimalStructure_eq_isSemialgebraic` are gone from `Suggested.lean`, and its docstring (34–35) names the o-minimal triangulation theorem as not statable.
- R03 (dropped-names list): **cleared outside the folder**. My gate run reports `dropped=0`.

## Verified sound

**Gate.** My run of the brief's gate command reports every check at 0 except `depcheck=1`, with the single line `depcheck: NOT IN ORDER: StratifiedSpacesAndTameTopology (insert it after its last supplier)`. That line comes from the public order file and is not a defect before insertion; the worker's gate at this head, against the candidate order, prints OK. The depcheck against the candidate order with `--movable` prints `depcheck: 237 roadmaps, 2424 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line. In the candidate order this roadmap is line 227, right after AlgebraicTopologyPartII (226), with ShimuraVarieties at 105. `git diff --stat origin/main...HEAD` outside the folder is empty.

**Lean.** `lake env lean` on `TauCetiRoadmap/StratifiedSpacesAndTameTopology/Suggested.lean` exits 0 with exactly four `sorry` warnings, at lines 171, 180, 206 and 223. I elaborated a scratch copy with `#check @name` for all 17 declarations. Each type matches its README statement; the dropped-binder lead count is 0; nothing changed. The one-tactic probe (`first | rfl | simp | infer_instance | decide | exact ⟨inferInstance⟩` in place of each `sorry`) fails on all four theorems, so there is no padding. There is no sorry'd data and no `set_option`. The imports are `Mathlib` and the two Tau Ceti modules actually used.

**Headline theorems.** The Summary's end theorems are 3.3(a), 3.3(e) and 3.4, which are stated; the o-minimal triangulation 4.1, which is not statable (it needs ShimuraVarieties §3.4b's carrier), with its semialgebraic case 4.3 stated; and 6.3–6.4, which are not statable (they need AlgebraicTopologyPartII's `IsSmoothStratification` and `ControlData` and DifferentialGeometry 5.5's abstract boundary). 7.2 and 7.3 are named as not statable for the same reasons. The docstring at 31–42 says all this.

**Library declarations opened at the pins.** All of the following exist with the binders the README uses (Mathlib `1b1ccf4`, checked with `#check`): `Topology.WithUpperSet`, `Topology.IsUpperSet.closure_eq_lowerClosure`, `Topology.IsUpperSet.specializes_iff_le`, `IsLocallyClosed`, `OnePoint.isOpen_range_coe`, `Path.Homotopy.eval`, `Path.Homotopic`, `FundamentalGroupoid`, `CategoryTheory.Paths.of`, `CategoryTheory.Quotient`, `HomRel`, `Preorder.smallCategory`, `Bundle.Trivialization`, `Manifold.IsSubmersionAt`, `Manifold.IsImmersionAt`, `EuclideanQuadrant`, `modelWithCornersEuclideanQuadrant`, `ModelWithCorners.boundary`, `ModelWithCorners.interior`, `tangentConeAt`, `Geometry.SimplicialComplex`, `intrinsicInterior` (31 names).

Mathlib's `Affine.Simplex.interior` (`Mathlib/LinearAlgebra/AffineSpace/Simplex/Basic.lean` 460) takes weights in `Ioo 0 1`, so it is empty on 0-simplices and is not the open simplex. That is why R07 points to `intrinsicInterior` instead.

The following Tau Ceti declarations (pin 2fd255d) were read in source:
- `TauCeti.IsSemialgebraic` (`Semialgebraic/Basic.lean` 75) and `TauCeti.IsSemialgebraicOn` (`Function.lean` 49), both over `[CommRing R] [LinearOrder R]`.
- `TauCeti.AbstractSimplicialComplex.orderComplex` (`OrderComplex.lean` 57).
- `AbstractSimplicialComplex.Realization` (`Realization/Basic.lean` 71, weak topology).
- `TauCeti.IsCollar` (`Collar/Global.lean` 46: an open embedding whose zero slice is `f`).
- `TauCeti.IsLocallyCollared` (213).
- `TauCeti.IsLocallyCollared.isCollared` (`Collar/Brown.lean` 459, with `[CompactSpace N] [T2Space M]` and injectivity, all satisfied in 5.4).

Neither pin has stratifications, open cones, exit paths or control data (grep, 0 hits), as README line 223 says.

**Cross-roadmap citations resolved** (main c4fb24e; open heads from the roadmaps tool):
- AlgebraicTopologyPartII at c6348a93 (#1694). §§16.1a–16.1e are at README 1539–1671, with `IsSmoothStratification`, `IsWhitneyStratification` and `ControlData`. Its §16.1b Checks are the ones the README reuses, with the same data: the first (1588), the fourth (1591) and the last (1592). §16.1c is normalised control data compatible with a stratumwise submersion, §16.1e has both forms of the isotopy lemma plus the local conical structure, and the supplier header's hypotheses match its 16.1a, 16.1b and 16.1c.
- ShimuraVarieties at the head of #933. §§3.4b–3.4e are at README 818–937; the `Fin.cons`/`Fin.tail`/`Fin.append` coordinates of Convention 7 are its 3.4b; 3.4c requires a nonempty dense order without endpoints, 3.4d works in `WithBot ℕ∞`, and 3.4e covers ordered abelian groups with definable addition, as the contract states.
- DifferentialGeometry 5.5 on main: the abstract boundary, README 83–86 and 529–533.
- GeometricTopology Layer 1: the collar theorem (Lee 9.25) and the tubular neighbourhood theorem, README 206–221.
- AlgebraicTopology Stage 7 (line 1573), AffineMorseLefschetz A4.1 (Layer 5, line 946), and RealAnalyticGeometry R2.1 (429–470) and R1.1, all on main.
- ImplicitAtlases 6.1 at the head of #974, line 698, described correctly as a non-citing user.
- The `roadmaps grep` for this roadmap's name over main and every open head finds only its own `namespace`/`end` lines.

**Ownership by object.** I grepped main and all open heads for exit paths, conically stratified spaces, embedded corners, boundary hypersurfaces, Whitney stratifications, open cones, unfolding and triangulation theorems. Outside this pull request the only hits in this sense are AlgebraicTopologyPartII (Whitney stratifications, consumed) and RealAnalyticGeometry and AffineMorseLefschetz (triangulation, R02).

The board package LogicAndDefinabilityInNumberTheory §6.5 (head 972ee8e) also states the o-minimal triangulation theorem, citing vdd-miller1996 4.10. It is at line 322 of the candidate order, after this roadmap (227), so this roadmap is the earlier owner of 4.1 and that package should consume it. Its §6.6 (definable manifolds with corners) does not overlap Layer 5. Overlaps: no open pull request changes this roadmap, and no cited id is dropped.

**Sources: the sample.**
- 2.1 and Convention 4: lurie-ha lines 54489–54520 (Definitions A.5.1, A.5.3 and A.5.5, with Remark A.5.4 for compact Hausdorff `L`). The README's "compact `L`" is the stronger statement and is still true by the tube lemma.
- 2.3(b): lurie-ha 55036–55048 (Proposition A.6.8, for locally finite complexes ordered by inclusion).
- 3.2: woolf2009 lines 145–157 (Definition 2.1: homotopy classes of po-paths through po-paths).
- 3.4: treumann2009 lines 71–77 (Example 1.4).
- 5.1: joyce2012 lines 151–158 (Definition 2.3), 167–171 (Definition 2.5), 190–198 (Definition 2.6, `|i⁻¹(x)| = depth`) and 212–213 (Proposition 2.7, `∂X = ∅` when `n = 0`).
- 5.2: joyce2012 lines 277–298 (Remark 2.11: (b) is "faces", (c) implies (b), and they are equivalent for compact `X`; the teardrop).
- 6.3 and 6.5: almp2012 lines 380–410 (§2.1) and 513–532 (Definition 2: chains of hypersurfaces are the corners).
- 6.7: mather2012 line 828 (`T_{X,Y} = T_X ∩ Y`) and 852 (A10).
- 7.2: vdd-miller1996 lines 189–212 (condition (b) and the frontier and dimension clauses of a stratification) and 530–532 (4.8(1)). Taking the strata contained in `S` from a Whitney stratification of `ℝ^m` compatible with `{S, B_i}` gives 7.2.
- 6.4: aft2017 line 4305 (R06).
- 2.4, 4.2, 5.3 and 6.5 are the author's own statements and are checked in the table below. 4.3, 5.4 and 7.3 rest on vdd1998, lee2013 and bcr1998: see Not verifiable.

**Adversarial table** (values computed this round).

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conv. 1, 1.1 `Stratification` | ℝ over `{0<1}` both ways; Sierpiński `{o,c}` | `s⁻¹{1} = ℝ∖{0}` open vs `{0}` not open; `{o}` open vs `{c}` not open; lower-set definition reverses both | true | none |
| Conv. 2, 3, 11 | `s = 0` on `{±1}`; `[0,1)∪{2}`; `⌈x⌉` over ℤ | `s⁻¹{1} = ℝ∖{±1}` open; `closure X₁ = [0,1)` meets `X₀` at 0 but misses 2; `⌈x⌉ ≥ n ⟺ x > n−1`, open | true | none |
| Conv. 8 figure eight | `t ↦ (sin 2t, sin t)` on `(−π,π)` | `sin t = 0` only at 0, so injective; `cos t = 0` forces `cos 2t = −1`, so an immersion; origin minus point leaves 4 arcs | true | none |
| Conv. 6 depth | ℝ² with `{0} < ℝ²∖{0}` | chain depth 1; AFT `dim_x X − dim_x X_{s(x)} = 2` | attribution false | R04 |
| 1.3 incidence order | `[0,1]`, three strata; discrete `{a,b}` | `{0}`, `{1}` incomparable, both below `(0,1)`; `{a}` maximal while `0` is not maximal in `P` | true | none |
| 1.4 | `[0,∞)²`, four faces | 4 vertices, 5 edges, 2 triangles, `χ = 1`; depths 2, 1, 0 (reversed chains give 0, 1, 2) | true | none |
| 2.1 `OpenCone` topology | `L = ℕ`, `∅`, `Fin 2`, point with apex index 1 | quotient-open `{apex} ∪ ⋃{n}×(0,1/(n+1))` contains no `ℕ×(0,ε)`; `C(∅)` is a point; `C(Fin 2) ≅ ℝ`; `{apex}` has no collar, so it is not open | true | none |
| 2.2 checks | `K = {0}∪{1/n}`; `L = L' = Fin 2` | frontier holds (`closure X₁ = ℝ`); components `{z}×C(L)` separate 0 and `1/n`, so not conical; `L'' = ∂[−1,1]²` with `(0,±1)` of index `(0,1)`, `(±1,0)` of index `(1,0)`, four arcs of index `(1,1)` | true | none |
| 2.4 | `ε ∈ (0,1]`, the seven traces | each trace is open in its set; `(0,δ) ∉ W`; with the disc `V₀₂`, `W ∩ V₀₂ ∋ 0` contains no `(0,δ)` | true | none |
| 3.2 relations | monoid `{1,e}`, every arrow sent to `e` | relation 1: `e = e`; relation 2: `e = e·e`; relation 3: `e ≠ 1` | true (relation 3 needed) | none |
| 3.3(a) Lean `[Subsingleton P]` | `P = Unit`, `P = ∅` | constant index, so every path is exit and exit homotopy is homotopy rel endpoints; `P = ∅` forces `X = ∅` | true | none |
| 3.3(e) Lean, arbitrary `L` | `L = ∅`, `Fin 2`, `ℕ` | `Hom(apex, apex) = {id}`; `Hom(apex, ±1)` singletons; slide `H(u,t) = (x(max(t,u)), t·t₁)` is continuous at the apex because heights `< ε` uniformly, which fails in the quotient topology for `L = ℕ` | true | none |
| 3.4 Lean | `Hom` among `∞` and `z, w ∈ ℂ`; upper sets of `Fin 2` | `Hom(∞,∞)` constant; `Hom(z,w)` one (ℂ simply connected); `Hom(z,∞) = ∅`; `Hom(∞,z)` one (chart `C(S¹)`); preimages `∅`, ℂ, `S²` | `≌ Fin 2` | none |
| 4.1 `openSimplex` | `τ = ∅`, `{v}`, `{v,w}`; `ZMod 3` with `0<1<2` | weight sum `0 ≠ 1` gives `∅`; `{v}`; open segment; `ZMod 3` admitted by the binders | true over ℝ; wider binders | R07 |
| 4.1 checks | `(0,1]` with `T = {{1},{0,1}}`; disc map `x ↦ (|x|/‖x‖_∞)x` | `id` image `{1} ∪ (0,1) = (0,1]`; unit circle goes to `‖·‖_∞ = 1`, the square's boundary | true | none |
| 4.2 | non-subcomplex `T` | the open star of `τ ∈ T` in the union is `τ° × C(L')` with `L' = ⋃_{σ∈T, σ⊋τ}(σ∖τ)°` (Lurie's `h` restricted); the closure in the union is `⋃_{ρ⊆σ, ρ∈T} ρ°`, so the frontier condition holds | true | none |
| 4.3 Lean | `A = ∅`; `n = 0`, `A = pt`; `A = [0,∞)` | `K` empty; `T = {{pt}}`; `Φ = x/(1+x)` onto `{0}° ∪ {0,1}° = [0,1)`, graph `{y(1+x) = x, x ≥ 0}` | true | R07 carrier |
| 4.3 vs R2.1, A4.1 | `B = {(0,1)}` | R2.1 gives `|K| ≃ₜ [0,1]` plus `analytic_simplex`; 4.3 gives a map on `(0,1)` only; compact 4.3 with `m = n` gives A4.1 | not the same theorem | R02 |
| 5.1 | `[0,1]²`, teardrop, `n = 0` | corner `|j⁻¹| = 2` = depth; teardrop `∂̃` an interval whose two ends go to the corner; `(0,0)` depth `1+1`; `∂̃ = ∅` | true | none |
| 5.2, 5.3 | `[0,1]²`, teardrop, `EuclideanQuadrant 2` | corner in 2 hypersurfaces vs teardrop corner in 1; adjacent edges meet in a point, so `k = 2` and dimension `2 − 2 = 0`; opposite edges are disjoint | true | none |
| 5.4 | edge `{0}×[0,1]` | `((0,y),t) ↦ (t/2,y)` has the inclusion as zero slice and open image; `(t/2,y/2)` has zero slice `(0,y/2)` and non-open image | true | none |
| 6.1, 6.2 `[0,1]` datum | `a, b < c` incomparable | `∂_aΣ_c ∩ ∂_bΣ_c = {ε} ∩ {1−ε} = ∅`; `glue = [ε,1−ε] ≅ [0,1]` | true | none |
| 6.2, 6.3 ℝ² datum | `ε₁ < ε₀/3` | `Σ₂ = {|y| ≥ √ε₁, x²+2y² ≥ ε₀}` (where `|x| ≤ |y| < √ε₁`, `x²+2y² < 3ε₁ < ε₀`); corners `(±√(ε₀−2ε₁), ±√ε₁)` lie in `T₁` exactly when `3ε₁ < ε₀`; `π₁` sends them to `(±√ε₀, 0)`; link of the origin: 2 arcs + 2 points form a circle | true | R05 (locator) |
| 6.3 negative control | §16.1b last Check, `ε < 1` | `Σ_j = (−∞,−√ε] ∪ [√ε,1] ∪ [1+ε,∞)`, with 1 in no `∂`; open stratum of `glue` has 3 components vs 2 | true | none |
| 6.5 | ℝ², `d = (0<1<2)`, `d' = (0<2)` | 4 corners map 2-to-1 onto 2 endpoints; boundary of the arcs is the corners, indexed by `{1}` | true | none |
| 6.6 | ℝ² corner | predecessors `s₁₂y` and `s₀₂y` form a chain by `∂₀Σ₂ ∩ ∂₁Σ₂ = s₁₂⁻¹(∂₀Σ₁)`; 2 = corner depth | true | none |
| 6.7 identities | §16.1b fourth Check | `M^a_{ac} = T_a∖{0} ∋ 5 ∈ X_b` | true | none |
| 6.7 local triviality | R01 data, `ε₀ = 1/8` | `M^0_{01}` has 3 components vs 2 for `C(L₀)` minus the apex; `M^1_{01}` has 2 vs 1 | false | R01 |
| 7.2 | `S` closed, 4.8(1) on `{S, B_i}` | strata in `S`: frontier, `dim Y < dim X`, condition (b) | true | none |
| 7.3 | closed disc; `{xy=0} ∩ [−1,1]²` | 2 Nash strata; 1 + 4 + 4 strata | true (BCR not checked: uncertified) | none |
| Scope 54–56 | RealAnalyticGeometry README | "subanalytic" excluded (line 20); "o-minimal" 0 hits | false attribution | R03 |
| 6.4 locator | aft2017 | 7.3.8 (line 4305) vs 6.3.8 | wrong number | R06 |

## Not verifiable

- vdd1998 (van den Dries, *Tame Topology and o-minimal Structures*): it has no manifest key and no legal copy was found in earlier rounds; this round did not search again. The locators Chapter 8 (2.9) (4.1, and through it 4.3), Chapter 7 (7.1) and Chapter 4 §2 are unchecked.
- lee2013 Theorem 9.25 (5.4) and bcr1998 Theorem 9.7.11 (7.3) are settled as uncertified.
- The out-of-scope remarks in Scope 69–76 were checked at second hand in earlier rounds and not reopened. They cite Peterzil–Steinhorn 1999 (paywalled), Andújar Guerrero 2025, Murayama–Shiota 2013 and Commelin–Huber Proposition A.1.
- Grothendieck's *Esquisse*, §5 is cited for motivation only.
- Note for the worker: the board's `sources.toml` lacks keys for vdd1998, Peterzil–Steinhorn, Andújar Guerrero, Murayama–Shiota, Huber and Grothendieck. It still lists verona1984 and thom1969, which the README no longer cites.

## Source issues

- **Gap** in vdd-miller1996 at D.16 (Whitney stratification of maps, 4.8(2)), revised version p. 1 and p. 38: the author's revision note says the proof of `C^p` Whitney stratification of maps has a gap that can be repaired; it should be completed by the announced corrigendum; affects nothing (7.2 uses 4.8(1), stratification of sets).
