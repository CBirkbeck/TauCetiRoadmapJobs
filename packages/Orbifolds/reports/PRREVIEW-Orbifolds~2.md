# Review of Orbifolds (pull request #2624 at deb8249)

**Verdict:** accepted

**Summary.** Accepted: all findings from the previous review are repaired (Yang's general theorem now stands in §3.1 and in `Suggested.lean`, Layer 7 takes no input from HamiltonianReduction or ConvexityToric, and §1.2 cites LieGroupoidsPoisson §G3.5), and the Checks and worked examples I recomputed hold, apart from one slip. Three small corrections remain, none blocking: a Check in §3.1 needs its weights to be positive; HamiltonianReduction and ConvexityToric on main still assign a later comparison to Layer 7, which §7.3 now hands back to them; and §2.4 credits Tau Ceti with averaged metrics for properly discontinuous actions, but the Tau Ceti metric is only for finite groups. There is one format note, and nothing is left for the human reviewers to decide.

## C01 — The first Check of §3.1 needs the weights `a`, `b` to be positive, as §1.4 states them

As written ("`a`, `b` coprime", line 610), the Check also covers `(a, b) = (0, 1)`, and there it fails. The action is then `(z, w) ↦ (z, λw)`, which fixes the circle `w = 0` pointwise, so it is not locally free there. Its orbit space is `{(z, |w|)}`, the closed upper hemisphere: a disc, not `S²`. Writing "coprime positive integers", as §1.4 does (line 250), makes the Check true.

## C02 — Layer 7 hands the later Hamiltonian comparison back to HamiltonianReduction and ConvexityToric, which on main still assign it to Layer 7

After the merge, a reader who follows those roadmaps' pointer arrives at §7.3, which sends them back, so this comparison has no owner.

- HamiltonianReduction's README on main, line 258, comes right after R3's own comparison with O4.2: "O7 compares these constructed forms/classes with the other Hamiltonian carriers".
- ConvexityToric, line 802: "O7's later completed-model comparison is not a prerequisite".
- The numbering paragraph (lines 65–66) maps O7 to §§7.1–7.5.
- §7.3 (lines 1610–1616) says that those roadmaps "make the comparisons on their own models".

Nothing breaks: neither roadmap uses this comparison as an input, and both sides agree that the identifications they do use belong to them. One sentence would settle ownership so that the next revisions of those roadmaps can drop the pointer. It could go in §7.3 or in the paragraph "Owned elsewhere and applying this roadmap" (line 1733). It would say that the completed-model comparison they attribute to the former O7 is covered by their own identifications and is not planned here.

## C03 — §2.4 credits Tau Ceti with averaged metrics for properly discontinuous actions, but `TauCeti.averageRiemannianMetric` averages over a finite group

An implementer who needs an invariant metric for an infinite properly discontinuous action will not find one at the pin. `TauCeti.averageRiemannianMetric` (`Geometry/Manifold/Riemannian/Invariant.lean`, lines 41–46) takes `[Fintype G]` and averages over the whole group. Only the invariant partition of unity, `SmoothPartitionOfUnity.exists_isSubordinate_smul_invariant` (`Geometry/Manifold/PartitionOfUnity/Invariant.lean`, line 307), is stated for properly discontinuous actions. The supplier contract already describes both correctly. In §2.4 (lines 458–460), the sentence could read "invariant smooth partitions of unity for properly discontinuous actions, and averaged metrics for finite groups, are Tau Ceti's".

## N01 — A few published theorems that the layers prove again carry no locator

These are the smooth-extension criterion for quadrant models (§3.4), the realization lemma for proper simplicial spaces and the fat–thin comparison (§4.9), and the paracompactness of regular Lindelöf spaces (§4.9a). A citation for each would let an implementer check the hypotheses against a source.

## Verified sound

| Statement | Instances tried | Roadmap side | Computed | Result |
|---|---|---|---|---|
| §1.1 closure under Morita equivalence | pair groupoid `ℝ×ℝ⇉ℝ`; irrational rotation of `S¹` | equivalent to a point, not étale; étale, not proper | source is a rank-one projection; infinitely many arrows between fixed small sets | holds; Moerdijk2002 lines 287–289, p. 7 |
| §1.2 coarse space | `[*/K]` and its effective reduction; Čech groupoid of a cover | same coarse space, not Morita equivalent; Morita equivalent | isotropy orders `\|K\|` against 1; no smooth section of `⊔U_i → M` for connected `M` | holds; §G3.5 line 1110 on main states the cited invariance |
| §1.4 locally free actions (sample) | `S¹` on `S³`, weights `(a, b)` coprime positive; weights `(2, 2)` | stabilizers `ℤ/a`, `ℤ/b`; `ℤ/2` kept on slices | `λ^a = λ^b = 1` forces `λ = 1` off the axes; `−1` fixes all of `S³` | holds |
| §1.5 topological action groupoids (sample) | Tau Ceti `Functor.Elements` lemmas | source a local homeomorphism; target continuous iff the action is; `(s, t)` proper | read: `[T2Space F.Elements]`, proper `(s, t)` of `Γ`, continuous anchor and target (Elements.lean 136–250) | hypotheses match |
| §2.1 linear charts (headline) | `ℤ/4` on `ℂ`, generator `z ↦ −z`; `[*/K]` | chart group `ℤ/4` with every label; `K ⋉ {0}` | kernel `{0, 2}`, effective `ℤ/2`; Moerdijk2002 lines 347–355, p. 8 | holds |
| §2.4 averaging (sample) | `ℤ/2` swapping `ℤ²`, map `(a, b) ↦ a + b`; cutoff on `[*/G]` | invariants not exact over `ℤ`; `c = 1/\|G\|` | image `{2a} = 2ℤ`; `(½, ½) ↦ 1`; `\|G\| · 1/\|G\| = 1` | Checks true; metric claim (C03) |
| §2.6 coarse diffeology (sample) | `ℤ/2` on `ℝ`: `x²`, `\|x\|`; `[*/K]` against the point | `x²` descends `DSmooth`, `\|x\|` does not | `x²` smooth; `\|x\|` not differentiable at 0; integrals `1/\|K\|` against 1 | holds |
| §3.1 Yang (headline, Lean) | trivial `K`; `S¹` rotating `S²`; `ℝ`-flow on `T²`; weights `(0, 1)` | triangulable, no stabilizer hypothesis | `[−1, 1]`; indiscrete quotient; disc for `(0, 1)`; Yang1963 lines 119–121, p. 407 | holds; Check needs positive weights (C01) |
| §3.3 open-star covers (sample) | dimension-`n` component | multiplicity `≤ n + 1`; Čech complex zero above `n` | carrier simplex has `≤ n + 1` vertices; increasing `(p+1)`-tuples need `p ≤ n` | holds |
| §3.4 quadrant diffeology (sample) | quadrant `[0,∞)² ⊂ ℝ²`; swap of faces | D-topology is the relative topology; `DSmooth` iff corner-smooth | convex with nonempty interior: points joined by smooth plots, so D-topology equals the relative topology; face swap excluded | holds; no locator (N01) |
| §3.5 and §6.1 signs | cylinder `m = 0, 1`; square | ends `(−1)^m`, `(−1)^(m+1)`; interval first `∓Γ` | `m = 1`, base first: `+Γ` at 0, `−Γ` at 1, so reverse | Checks true |
| §4.1 orbibundles (sample) | sign line over `[*/(ℤ/2)]` | no nonzero invariant section | invariant `v` has `−v = v`, so `v = 0` | Check true |
| §4.3 fat model (sample) | unit groupoid of `M`; `[*/K]` | `BΓ ≃ M`; `BΓ ≃ BK` | fat point: `d_n = 1` for even `n ≥ 2`, 0 for odd `n`; acyclic, simply connected | holds |
| §§4.4–4.5 comparison and de Rham (headline) | `[*/(ℤ/2)]`; `ℤ ⋉ ℝ`; `ℤ/m` on `ℝ²` | isomorphism over `ℚ`, `ℝ`, not `ℤ`; `H¹ = ℝ` | `H²(Bℤ/2; ℤ) = ℤ/2`; `dx` closed, not `d` of a periodic function | holds; Moerdijk2002 lines 505–514, p. 12 |
| §4.8 Chern–Weil (sample) | nontrivial character `χ` of `K` over `[*/K]` | forms vanish; `c₁(E_B)` nonzero torsion | `c₁ = χ ∈ Hom(K, U(1)) ≅ H²(BK; ℤ)` | Check true |
| §4.9 thin and diagonal models (sample) | `[*/K]`; non-Hausdorff arrows | `L_p` clopen; `ε` a homotopy equivalence | units open (étale), closed (equalizer in a T2 space); vandenBergMoerdijk2018 lines 126–129 | holds |
| §4.9a nerve topology (sample) | `U_n = (−n, n)`, `V_n = (−n+½, n−½)` | `W_n = (−n, n) ∖ [−n+3/2, n−3/2]` | union of closures for `k < n` is `[−n+3/2, n−3/2]`; the open variant is not open | Check true |
| §4.9b stalks (sample) | `ℤ/2` on `(−1, 1)` | `ℚ` in degree 0 only; `𝔽₂[w]` | `EG ×_G B ≃ ℝP^∞`; `H*(ℝP^∞; 𝔽₂) = 𝔽₂[w]` | Check true |
| §4.9c torus classifier | `[*/(ℤ/n)]`, `T = S¹`; `m = 0` | class `±χ`, torsion; trivial | substitution gives `F_j(xg) = χ_j(g)F_j(x)`; `F_j(e) = 1` | holds |
| §§5.1, 5.4 weighted integration and duality (headline) | `[*/K]`; `ℤ/2` on `{a, b, c}`; `S²/(ℤ/m)`; `ℤ/m × ℤ/2` on `S²` | `1/\|K\|`; `3/2`; `4π/m`; `(1/k)[\|Γ\|]` | `½ · 3 = 1 + ½`; with `k = 2`: `½ · 4π/m = 4π/(2m)` | holds |
| §5.2 Stokes (sample) | `[*/K] × [0, 1]`, function `f` | `∫ df = (f(1) − f(0))/\|K\|` | both sides carry `1/\|K\|`; `m = 0` gives `{1} − {0}` | holds |
| §7.1 basic presentations (sample) | `[*/K]`, `K` acting on `ℂ` by nontrivial `χ` | not pulled back from the point; `c₁ = ±χ` | `EK ×_K ℂ_χ`; real image 0 | Check true |
| §7.3 effective reduction (sample) | trivial gerbe `K × N` | `∫_eff = \|K\| · ∫_full` | `∫_N` against `(1/\|K\|)∫_N`; chart weight `k/\|G\|` against `1/\|G\|` | holds; hand-off (C02) |

- Earlier findings, all repaired. R01: lines 589–590 and Lean lines 44–52 carry no stabilizer hypothesis. R02: no *Needs:* line or supplier contract names HamiltonianReduction or ConvexityToric (§7.3, lines 1610–1621). R03: lines 197–199 cite §G3.5. C01: lines 60–66. C02: lines 142, 345, 818, 1015–1016 and 1981–1982. C03: lines 41–43. C04: line 1399. C05: one theorem left. C06: the description. N01: every supplier is cited by section.
- Source locators checked against the text: Yang1963 lines 12–14 and 119–155; Moerdijk2002 lines 278–294, 347–355 and 505–514; MoerdijkPronk1999 lines 111–175; vandenBergMoerdijk2018 lines 106–135.
- Library declarations: all 107 backticked names in the README located at the pins. Hypotheses read for the declarations of §§1.5, 2.4, 2.6, 4.3 and 4.9, for `TauCeti.IsTriangulable` (weak topology on the realization) and `exists_equivariant_contMDiff_chart`, and for Mathlib's `Diffeology.dTopology` (an alias, `Geometry/Diffeology/Basic.lean` line 191) and `ContMDiffSMul` (`Geometry/Manifold/Algebra/SMul.lean` line 68).
- Cross-roadmap citations resolved on main: LieGroupoidsPoisson, SmoothBundlesConnections, CharacteristicClasses, DifferentialGeometry, AlgebraicTopology, TopologicalKTheory, LieGroups, GeometricTopology, ComplexKahlerGeometry and FuchsianOrbifolds, all by the sections named. All suppliers are on main. The citations of old ids in 34 roadmaps on main all resolve through the numbering paragraph. No other roadmap uses the 16 removed Lean names.
- Automatic checks: the full rerun passes. The dependency check prints `depcheck: 200 roadmaps, 2201 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives one `sorry` warning (line 44). `#check @isTriangulable_orbitRel_quotient` shows every binder, matching §3.1. Two one-tactic probes (`simp [IsTriangulable]`, and `exact` with `isTriangulable_of_discreteTopology`) fail, so the theorem is not padding. The universe `.{0}` loses nothing: the realization is Lindelöf, so its vertex set is countable.
- The description's counts are right: 29 Check lists, 45 Checks, 42 *Needs:* lines, 16 declarations removed (5 + 1 + 10).
- Ownership against open pull requests: searched the 423 open heads for Yang's theorem, groupoid cutoffs and weighted orbifold integration. Only this pull request has them.

Overlap check: read StringOrientation, ConvexityToric, ImplicitAtlases, TangentialBordism and LieGroupoidsPoisson (open list; their only open pull request is a multi-roadmap revision, so they were read on main), and CharacteristicClasses (main list). The results-and-headings list was empty. Shared objects and their owners:
- The Morita invariance of orbit spaces and isotropy belongs to LieGroupoidsPoisson §G3.5, which this roadmap cites.
- The manifold diffeology belongs to Tau Ceti (`TauCeti.manifoldDiffeology`). StringOrientation's "O2 item 6" maps to §2.6, which consumes it.
- The identifications of the Hamiltonian level presentation, form and torus bundle belong to HamiltonianReduction R3 and ConvexityToric Layer 4. Their pointer to O7 is C02.
- ImplicitAtlases' weights live on implicit atlases, a separate object. TangentialBordism and CharacteristicClasses share nothing.

Source independence: 12 passages compared with 4 sources (§§1.1, 1.2, 1.3, 2.1, 2.3, 3.1, 3.2, 4.1, 4.4, 4.8 and 4.9, and the `Suggested.lean` docstring), plus a scan of every 7-word run of the README and `Suggested.lean` against the four cached texts. The only shared runs are Yang's title and two forced phrases. The largest share of locators is Moerdijk2002, 3 of 8. Contents compared with Moerdijk2002 §§1–6: independent. Layers 3, 5 and 6 have no counterpart there. Layer 4 puts bundles before the classifying space. The order of Layers 1–2 is forced by the *Needs:* line of §2.1.

Research link: the layers build the groupoid model of orbifolds with ineffective isotropy and the rational comparison of `BΓ` with the coarse space (Moerdijk–Pronk 1997; Moerdijk 2002, §§3.4 and 4.4), Yang's 1963 triangulation theorem, and the weighted integration of Adem–Leida–Ruan 2007. GromovWittenTheory, on main, consumes the weighted pairing. This rests on the README's References and on Moerdijk2002 and Yang1963, which I read.

## Not verifiable

- Cairns1941 (*Lectures in Topology*, pp. 143–157, cited in §3.1): outside the sample and not opened this round; the earlier round found no legal copy.
- AdemLeidaRuan2007 (Chapters 1–2, cited in §5.1): outside the sample; the earlier round found only the publisher's landing page.
- MoerdijkPronk1997 (*K-Theory* 12, References only): not opened; the earlier round found only publisher and archive landing pages.
- Sampled §§1.4, 1.5, 2.4, 2.6, 3.3, 3.4, 4.1, 4.3, 4.8, 4.9a, 4.9b, 5.2, 7.1 and 7.3 cite no source text, so there was no locator to check. They were checked by computation and against the supplier sections and declarations they name.

Automatic checks set aside as false positives: the overlap listing reports that this change drops the id O4.2, which HamiltonianReduction cites. The README's numbering paragraph (line 62) maps O4.2 to §4.2 in a sentence that the listing does not read.

## Source issues

- **Misprint** in Moerdijk2002 at §2.5, p. 6: the source says one may think of H′ as a cover of H′; it should be a cover of H; affects nothing.
- **Misprint** in MoerdijkPronk1999 at §1.2, p. 5: the source calls good covers "as in Proposition 1.2.5", but the statement is numbered Corollary 1.2.5; it should cite Corollary 1.2.5; affects nothing.

## For the human reviewers

- none
