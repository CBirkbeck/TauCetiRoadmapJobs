# Review of Orbifolds (pull request #2624 at deb8249)

**Verdict:** needs changes

**Summary.** Changes are needed, for one finding: §3.2 asks for the isotropy group to be constant on each open simplex of "the triangulation of §3.1", but §3.1 states only that the orbit space is triangulable, and an arbitrary triangulation does not have that property, so §§3.2–3.3 and the descent of Layer 4 have no stated input. The head is the one the previous review read, so its three small corrections and its format note still stand and are repeated here; none blocks. One question for the author concerns the soundness of the Cairns step in the route of §3.1; nothing is left for the human reviewers.

## R01 (P2) — §3.2 needs a triangulation in which every orbit-type stratum is a union of open simplices, and §3.1 states only triangulability

An implementer who proves §3.1 exactly as stated, by any route, cannot prove §3.2 from it: "Transport the triangulation of §3.1 to `|Γ|` … Prove that the isotropy group is constant on each open simplex" (lines 618–620) is false for a general triangulation of the coarse space, and no stellar refinement repairs it. For `ℤ/m` rotating `ℝ³` about an axis, the coarse space is homeomorphic to `ℝ³` and the singular stratum is the image of the axis. Compose a linear triangulation of `ℝ³` with a homeomorphism that bends the axis into a parabola: the stratum is then a curve that is not piecewise linear in the simplices' coordinates, so it is a subcomplex of no subdivision, and the open simplices it crosses carry isotropy `ℤ/m` on the curve and trivial isotropy off it. The roadmap's own Layer 3 example already presupposes the stronger form ("with the origin as a vertex", line 703). Everything downstream uses it: the lifts of simplices and stars of §3.2, the centred charts and isotropy maps of §3.3, and through them §§4.4–4.5 and 5.3–5.4.

The stronger statement is the one the sources have. Yang's Theorem (Yang1963 lines 119–121) asserts triangulability only, but his proof triangulates the partition into components of the `M_(H)/K` (lines 132–136), and Moerdijk–Pronk use exactly "a triangulation subordinate to this stratification" before their lifting lemma (MoerdijkPronk1999 lines 120–125). The smallest change is one more sentence of target in §3.1: the triangulation can be chosen so that each connected component of each orbit-type stratum `M_(H)/K` is a union of open simplices; and in §3.2 "the triangulation of §3.1" becomes that stratum-compatible one, with the remark that for the frame action the `O(n)`-orbit types on `F_n` are the conjugacy classes of the effective isotropy groups. `isTriangulable_orbitRel_quotient` is true as it stands and need not change.

## C01 — The first Check of §3.1 needs the weights `a`, `b` to be positive, as §1.4 states them

As written ("`a`, `b` coprime", line 610) the Check covers `(a, b) = (0, 1)`, where it fails: the action `(z, w) ↦ (z, λw)` fixes the circle `w = 0` pointwise, so it is not locally free, and the orbit space `{(z, |w|)}` is a closed disc, not `S²`. "Coprime positive integers", as in §1.4 (line 250), makes it true.

## C02 — §7.3 hands the later Hamiltonian comparison to HamiltonianReduction and ConvexityToric, which on main still assign it to the former O7

A reader following those roadmaps' pointer arrives at §7.3, which sends them back. HamiltonianReduction's README on main says "O7 compares these constructed forms/classes with the other Hamiltonian carriers" (line 258) and ConvexityToric's "O7's later completed-model comparison is not a prerequisite" (line 802); the numbering paragraph maps O7 to §§7.1–7.5 (lines 65–66), and §7.3 says those roadmaps "make the comparisons on their own models" (lines 1610–1611). Neither roadmap uses the comparison as an input, so nothing breaks. One sentence in §7.3 or in "Owned elsewhere and applying this roadmap" (line 1733) would settle it: the completed-model comparison they attribute to the former O7 is covered by their own identifications and is not planned here.

## C03 — §2.4 credits Tau Ceti with averaged metrics for properly discontinuous actions, but `TauCeti.averageRiemannianMetric` averages over a finite group

An implementer who needs an invariant metric for an infinite properly discontinuous action finds none at the pin: `TauCeti.averageRiemannianMetric` takes `[Fintype G]` (`Geometry/Manifold/Riemannian/Invariant.lean`, lines 41–46). Only the partition of unity, `SmoothPartitionOfUnity.exists_isSubordinate_smul_invariant`, is for properly discontinuous actions. The supplier contract (lines 1841–1843) already says this correctly; in §2.4 (lines 458–460) the sentence could read "invariant smooth partitions of unity for properly discontinuous actions, and averaged metrics for finite groups, are Tau Ceti's".

## N01 — A few published theorems that the layers prove again carry no locator

The smooth-extension criterion for quadrant models (§3.4), the realization lemma for proper simplicial spaces and the fat–thin comparison (§4.9), the paracompactness of regular Lindelöf spaces (§4.9a) and the weak fibre product of §1.3 (Moerdijk, §2.3 and §3.3, would serve) have no citation. One each would let an implementer check hypotheses against a source.

## Questions for the author

- Is the Cairns step of §3.1 sound? Yang takes the triangulability of regular locally polyhedral spaces from Cairns without proof (Yang1963 lines 71–75), and §3.1 makes "its full proof … a target here" (lines 596–600). H. Yu, *On a new geometric homology theory…* (arXiv:2004.07698v8, §5, before the proof of Theorem 1.0.3), writes that Yang's result fails because this theorem of Cairns is now known to be false, and gives no reference. I could not check this: Cairns' text is not available to me, and I found no refereed statement of the error. The theorem of §3.1 itself is not in doubt (Verona, *Stratified mappings: structure and triangulability*, LNM 1102, 1984; Murayama–Shiota, arXiv:1004.4094, abstract, for proper actions of Lie groups). If the report is right, the route and the locator of §3.1 would better rest on one of those, which also give the stratum-compatible form R01 asks for.

## Verified sound

| Statement | Instances tried | Roadmap side | Computed | Result |
|---|---|---|---|---|
| §1.1 closure and Morita invariance of properness (sample) | pair groupoid `ℝ×ℝ⇉ℝ`; irrational rotation `ℤ⋉S¹`; `ℤ⋉ℝ` | equivalent to point, not étale; étale free, not proper; proper | source `ℝ²→ℝ` has rank 1; `(s,t)⁻¹(S¹×S¹) = ℤ×S¹` not compact | holds; Moerdijk2002 lines 287–289 |
| §1.2 coarse space, Morita (sample) | `[*/K]` vs point; Čech groupoid of a cover | same coarse space, not Morita equivalent; Morita equivalent | isotropy `K` vs 1; connected `M` maps into one `U_i` | holds; LieGroupoidsPoisson §G3.5 (main, line 1110) states the invariance |
| §1.3 weak fibre products (sample) | `f = x²−y²: ℝ²→ℝ`, `g: * ↦ 0`, unit groupoids | transversality required | object space `{x² = y²}`, a cross, not a manifold | hypothesis needed and stated; Moerdijk2002 lines 174–178, 193–196, 343–346 |
| §1.6 collared domains (sample) | quadrant in `ℝ²`; swap `ℤ/2`; `ρ = x+y` | collars satisfy equations; swap excluded; one face | `ρ₁(t,y) = t`, `ρ₂(t,y) = y`; `x∘swap = y ≠ x`; `x+y` invariant | Check true |
| §2.1 linear charts (headline) | `[*/K]`; `[ℝⁿ/G]` at `v ≠ 0`; Bochner average | `K⋉{0}`; `G_v` on a ball; `A(hy) = L_h A(y)`, `dA_x = id` | reindex `g ↦ gh⁻¹`: `L_{gh⁻¹}⁻¹ = L_h L_g⁻¹`; mean of `L_g⁻¹ L_g` | holds; Moerdijk2002 lines 347–355 |
| §2.3 kernel and effective reduction (sample) | `ℤ/4` on `ℂ` via `z ↦ −z`; shear `(x, y+x)` | kernel `{0,2}`, principal set `ℂ∖0`; `N ≠ 0`, `N² = 0`, infinite order | stabilizer of `z ≠ 0` is `{0,2}`; `(Id+N)^m = Id + mN` | Checks true; Moerdijk2002 lines 383–387 |
| §2.4 averaging and cutoff (sample) | `ℤ/2` swapping `ℤ²`, `(a,b) ↦ a+b`; cutoff on `[*/G]` | image of invariants `2ℤ`; `c = 1/|G|` | `(a,a) ↦ 2a`; over `ℚ` `(½,½) ↦ 1`; `|G|·1/|G| = 1` | Checks true; metric sentence C03 |
| §3.1 Yang (headline, Lean) | trivial `K`; irrational flow on `T²`; weights `(0,1)` | triangulable, no stabilizer hypothesis | Yang1963 lines 119–121; indiscrete quotient; disc for `(0,1)` | theorem holds; Check C01; route: see question |
| §3.2 subordinate triangulations (touched by R01) | `ℤ/m` on `ℝ³`, axis bent to a parabola | isotropy constant on open simplices | open simplices crossed by the curve carry `ℤ/m` and trivial isotropy | fails for a general triangulation: R01 |
| §3.5, §6.1 signs | cylinder base first, `m = 0, 1`; interval first | ends `(−1)^m`, `(−1)^(m+1)`; `−Γ` at 0, `+Γ` at 1 | `(∂_t, e₁…e_m)` vs `(e₁…e_m, ∂_t)`: sign `(−1)^m`; `m=0`: `{1}−{0}` | Checks true |
| §4.3 fat model (sample) | unit groupoid of `M`; `[*/K]` | `BΓ ≃ M`, `q` the equivalence; `BΓ ≃ BK` | fat realization of constant `M` is `M × ‖*‖`, `‖*‖` contractible | holds |
| §§4.4–4.5 comparison and de Rham (headline; §4.5 sample) | `[*/(ℤ/2)]`; `ℤ⋉ℝ`; `ℤ/m` on `ℝ²` | iso over `ℚ`, `ℝ`, not `ℤ`; `H¹ = ℝ`; `ℝ` in degree 0 | `H²(Bℤ/2;ℤ) = ℤ/2`; `dx` not `d` of a periodic function; invariants of `H*(ℝ²)` | holds; Moerdijk2002 lines 505–514 |
| §4.9a paracompactness (touches §4.9b) | `U_n = (−n,n)`, `V_n = (−n+½, n−½)` | `W_n = (−n,n) ∖ [−n+3/2, n−3/2]` | `⋃_{k<n} cl V_k = [−n+3/2, n−3/2]`; least `n` with `x ∈ cl V_n` gives `x ∈ W_n` | Check and proof true |
| §4.9b stalks and Leray (sample) | `ℤ/2` on `(−1,1)` | `ℚ` in degree 0; `𝔽₂[w]` | `EG×_G B ≃ ℝP^∞`; `H*(ℝP^∞;𝔽₂) = 𝔽₂[w]` | Check true; same route as Moerdijk2002 lines 505–514 |
| §5.1 weighted integration (headline, sample) | `[*/K]`; `ℤ/2` on `{a,b,c}`; half-turn on circle; `ℤ/m` on disc; index formula | `1/|K|`; `3/2`; `π`; `π/m`; `|H|⁻¹∫_V` | `½·3 = 1+½`; `½·2π`; `|G|⁻¹[G:H]∫_V = |H|⁻¹∫_V` | holds |
| §5.3–5.4 local homology, duality (headline) | `ℤ/2` on `ℝ` reversing; `ℤ/m` on `ℝ²`; `n = 0`; football | zero; `H₂ = ℚ`; `H₀ = ℚ`; `4π/m`, `k = 1` | pair `([0,1),(0,1))` acyclic; coinvariants of `H_n(B,B∖0;ℚ)`; `(1/m)·4π` | holds |
| §5.5 Thom classes (sample) | trivial `K` on `ℝ^r` over `[*/K]`; sign line over `[*/(ℤ/2)]` | both sides `1/|K|`; Thom pair rationally zero | `E_B∖0_B = Eℤ/2 ×_{ℤ/2} (ℝ∖0) ≃ *`; `H*(Bℤ/2;ℚ) = H*(*;ℚ)` | Checks true |
| §7.2 trivial gerbes (sample) | `K×N ⇒ N` | weighted class `(1/|K|)[N]`; effective reduction `N` | `k = |K|` at every point; chart group `K`, weight `1/|K|` | holds |
| §7.3 effective reduction (sample) | trivial gerbe; chart `G` with kernel of order `k` | `∫_eff = k·∫_full` | `(|G|/k)⁻¹ = k·|G|⁻¹`; gerbe: `∫_N = |K|·(1/|K|)∫_N` | holds; pointer C02 |
| §7.4 Fuchsian charts (sample) | elliptic point of order `m` | chart `ℤ/m` on a disc, weight `1/m` | FuchsianOrbifolds Layer 1 item 1 and L2.1 on main state the charts and area | citation resolves; comparison is a target |
| §7.5 complex-domain charts (sample) | complex chart with finite group acting holomorphically | complex orientation is preserved, so Layer 5 applies | holomorphic maps have Jacobian `|det_ℂ|² > 0`; ComplexKahlerGeometry §1.1 on main | hypotheses consistent |

- Earlier review (same head): it had no finding; its C01, C02, C03 and N01 are unchanged in the text (lines 610, 1610–1616, 458–460) and are repeated above.
- Source locators checked against the text: Yang1963 lines 12–14, 71–75, 119–155; Moerdijk2002 lines 174–196, 242–294, 343–355, 383–387, 505–514; MoerdijkPronk1999 lines 111–185, 210–223; vandenBergMoerdijk2018 lines 106–133.
- Library declarations: every backticked dotted name of the README (143 after removing mathematical notation) is declared at the pinned Mathlib or Tau Ceti; `TauCeti.IsTriangulable` (`Topology/Triangulable/Basic.lean`, lines 37–41) and `TauCeti.averageRiemannianMetric` (`Geometry/Manifold/Riemannian/Invariant.lean`, lines 38–51) read in full.
- Cross-roadmap citations resolved on main, by section: LieGroupoidsPoisson (G0.0–G0.4, G3.1, G3.5), SmoothBundlesConnections (B1.0, B1.4, B2.5, B3.1, B4.1, B6.1–B6.3), DifferentialGeometry (5.1, 5.5b, Layers 0–2, 5, 7, 8), AlgebraicTopology (4.7–4.9, 5.1, 6.1–6.4, 8.8), CharacteristicClasses (C1.1b, C1.2b, C1.5, C2.1, C4.1, C4.3), TopologicalKTheory T1, LieGroups Layer 2, GeometricTopology (1.1, 11.1, 11.3), ComplexKahlerGeometry 1.1, FuchsianOrbifolds Layers 1–2. All suppliers are on main; none is on the list of roadmaps never to cite as suppliers.
- Dependency check: `depcheck: 200 roadmaps, 2201 edges, 0 problem(s)`; no UPWARD or CYCLE line. The other automatic checks passed. No change outside the folder.
- Elaboration: `Suggested.lean` gives one warning, the `sorry` at line 44; the elaborated type keeps every binder of §3.1 (compact Lie group, Hausdorff second-countable boundaryless manifold, smooth action). `K` needs no separation hypothesis: a locally Euclidean topological group is T1, hence Hausdorff. One-tactic probes (`simp [TauCeti.IsTriangulable]`, `rfl`, `infer_instance`, `exact TauCeti.isTriangulable_of_discreteTopology _`) all fail: not padding. The four other headlines are named in the module docstring as not statable (no Lie groupoid carrier at the pins).
- Description: the counts hold (29 Check lists, 45 Checks, 42 *Needs:* lines, 16 declarations removed, 1 added), and its prose agrees with the head.
- Ownership against open pull requests: searched the open heads for the triangulation of orbit spaces, proper étale presentations and weighted orbifold integration; only this pull request plans them. StratifiedSpacesAndTameTopology (open) cites Murayama–Shiota for the Cairns–Whitehead theorem only and plans no orbit-space triangulation.

Overlap check: read StringOrientation, ConvexityToric, ImplicitAtlases, TangentialBordism and LieGroupoidsPoisson (open list, read on main: their only open pull request is a multi-roadmap revision), CharacteristicClasses (main list) and HamiltonianReduction; the results-and-headings list is empty. Shared objects: Morita invariance of orbit spaces and isotropy, owner LieGroupoidsPoisson §G3.5 (cited); the manifold diffeology, owner Tau Ceti (consumed in §2.6); the Hamiltonian level identifications, owners HamiltonianReduction R3 and ConvexityToric Layer 4 (their pointer to O7 is C02). Nothing else shared.

Source independence: 9 passages compared with 4 sources (§§1.1, 1.2, 1.3, 2.1, 2.3, 3.1, 3.2, 4.4/4.9b, 4.9 and the `Suggested.lean` docstring), none shared beyond the forced definition of the fibre-product objects and Yang's title; largest share Moerdijk2002, 3 of 8 locators; contents compared with Moerdijk2002 §§1–6: independent (Layers 3, 5, 6 have no counterpart; Layer 4 puts bundles and forms before the classifying space; the order of Layers 1–2 is forced by the *Needs:* line of §2.1).

Research link: the layers build the groupoid model of orbifolds with ineffective isotropy and the rational comparison of `BΓ` with the coarse space (Moerdijk–Pronk 1997; Moerdijk 2002, §§3.4, 4.4), Yang's 1963 triangulation theorem and the weighted integration of Adem–Leida–Ruan 2007; GromovWittenTheory, HamiltonianReduction and ConvexityToric on main consume them. Rests on the README's References and on Moerdijk2002 and Yang1963, read.

## Not verifiable

- Cairns1941 (*Lectures in Topology*, pp. 143–157, cited in §3.1): not among the cached texts; no legal copy known to the earlier rounds. The question above depends on it.
- AdemLeidaRuan2007 (Chapters 1–2, the locator of sampled §5.1): not among the cached texts; the earlier round found only the publisher's page. §5.1 was checked by computation.
- MoerdijkPronk1997 (*K-Theory* 12, References only): not opened.
- Sampled §§1.6, 2.4, 4.3, 4.5, 5.5, 7.2–7.5 cite no source text; they were checked by computation and against the supplier sections and declarations they name.

Automatic checks set aside as false positives: the overlap listing reports that this change drops the id O4.2, which HamiltonianReduction cites; the numbering paragraph maps it in a sentence ("O4.2 is §4.2", line 62) that the listing does not read.

## Source issues

- **Misprint** in Moerdijk2002 at §2.5, p. 6: the source says one may think of H′ as a cover of H′; it should be a cover of H; affects nothing.
- **Misprint** in MoerdijkPronk1999 at §1.2, p. 5: the source refers to good covers "as in Proposition 1.2.5", but that statement is numbered Corollary 1.2.5; it should cite Corollary 1.2.5; affects nothing.

## For the human reviewers

- none
