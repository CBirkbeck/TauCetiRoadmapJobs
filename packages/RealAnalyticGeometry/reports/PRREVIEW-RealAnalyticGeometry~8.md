# Review of RealAnalyticGeometry (pull request #2634 at 9cd6998)

**Verdict:** accepted

**Summary.** Accepted: no statement of the roadmap was found false or unsupported, every layer and item of the README on main is kept under its id with its statement, and the declarations named on the *In Tau Ceti:* lines exist at the pin and say what the items say. There are three small corrections, two of them sentences of the pull request's description that main or the diff contradicts and one a word in a Check, and one format note; none blocks. Nothing is left for a human to decide.

## C01 — The description says `Suggested.lean` is unchanged, but against main the pull request rewrites it

A reader of the description alone would not learn that seventeen declarations leave the Lean file. "`Suggested.lean` is unchanged" is true only of the last repair: against the merge base the file changes by 483 lines. It drops, among others, `LocalAnalyticFunction`, `SemiAnalyticFormula` with `realize` and `radiusBound`, `SemiAnalyticAt`, `IsNashAt`, `IsLocallySemialgebraic`, `rankOneProjector`, `projectiveProjector`, `ProjectorLocus` and `ProperRealAnalyticEmbedding.isProperMap`, and it adds the statements of Theorems 1, 2 and 4, the Stein criterion and Cartan's theorems A and B with the definitions they need.

Text that would be right: "`Suggested.lean` is rewritten as the acceptance test: the definitions and lemmas that Tau Ceti now has are removed (list), and Theorems 1, 2 and 4, the Stein criterion and Cartan's theorems A and B are stated beside Theorem 3 and Grauert's theorem, which stay."

## C02 — The description says main's weighted `∂̄` theorem omitted square-integrability of the datum; main has it

"It also assumes the datum square-integrable for the weight, which the statement on main omitted" misreports the record. R3.1 of the README on main reads "distributionally closed data f belong to weighted L² with `∫⟨B⁻¹f,f⟩e⁻φ dV<∞`", and the head's §3.1 (lines 1450–1452) asks the same two conditions. Dropping the clause "which the statement on main omitted" makes the sentence true; the change from positive definite to positive semi-definite `B`, stated just before it, is the real one.

## C03 — In the second Check of §2.0b the projections are open sets, not open intervals

"the projections of its relatively open subsets are open intervals" (line 796): for `Z = {u = t²} ∪ {u = −t²}`, the relatively open subset `Z ∩ {t > 0, |(u, t)| < ε}` projects onto `(−ε′, 0) ∪ (0, ε′)`, which is open but not an interval. Property (P) asks for openness only, and that holds; "are open" is the statement the Check needs.

## N01 — The second Check of §2.1 counts the cells of one triangulation as if of all

"`B_1` is the image of two open edges and one vertex" (lines 1214–1216) holds for the vertices `0`, `1/2`, `1`; with `0`, `1/4`, `1/2`, `1` it is three open edges and two vertices. "In the triangulation with vertices `0`, `1/2`, `1`" would say which is meant.

## Previous findings

The previous review, of `38c4ef3`, had no finding and no small correction; its one format note is not repaired and is carried as N01 above (the Check is unchanged at lines 1214–1216).

## Verified sound

| Target | Instances tried | Roadmap side (computed) | Source or library side (computed) | Result |
|---|---|---|---|---|
| §0.2 chartwise submanifolds, `ChartwiseRealAnalyticSubmanifold` | `M = ℝⁿ` with identity chart; the cross `{xy = 0}`; empty `S` | identity chart: `U ∩ S` an analytic submanifold near each point; cross: no chart at origin, rejected; empty `S` rejected | Lean body lines 75–77: `S.Nonempty ∧ ∀ x ∈ S, ∃ U open …`; `IsAnalyticSubmanifold` has field `nonempty` (`Submanifold/Basic.lean:238`) | sound; no source locator in the section |
| §1.1 Nash germs and locally semialgebraic sets | `√(1+x)`; `exp`; bounded locally semialgebraic set | `4a⁴ − 4(1+x)a² − y² = 0`, at `y = 0` factor `4a²(a² − 1 − x)`; `exp` beats Cauchy root bound | Lojasiewicz1964 lines 194–205, printed p. 454; `IsNashAt` (`Nash/Basic.lean:71`), graph criterion (`Nash/Graph.lean:126, 163, 192`) | sound |
| §2.0 normal boxes | `n = 2, k = 0`; partition `V^n, …, V^0` | `{H¹₂ = 0, H⁰₁ = 0} = {0}`; loci "all above vanish, next does not" are disjoint and cover `Q` | Lojasiewicz1964 lines 94–117 (pp. 451–452), 129–136 (II.4, II.6), 144–167 (III.1–3, pp. 452–453) | sound |
| §2.0b Lemmas 5–7, closure rules | `{sin t = 0}`; `f = t² − u`, `g = t² + u` | fibres `πℤ` infinite, so not partially semialgebraic; `π{f = 0} = [0, ∞)`; `Z ∩ {t > 0}` projects to `(−ε, 0) ∪ (0, ε)` | Lojasiewicz1964 lines 175–193 (§1.V), 319–321, 327–337, 338–341; `exists_topographic` (`Topographic.lean:215`), shear constant `A/(1 − A‖z‖)` (line 293) | sound; wording C03 |
| §2.0c Lemmas 8–9 | hypotheses read against text | adapted box, lower pieces union `{fg = 0}` with (P); pieces topographic, projected labels kept | Lojasiewicz1964 lines 370–378 and 380–388, printed p. 459 | sound |
| §2.0d Lemma 10 and Lemmas 11–14 | point `(2, 3)`, `h = 2 + t²` and `h ≡ 1`; collapsed fibre without compact base | `g₁ = (22, 3)`, `3/√485 ≈ 0.136 < 1`; `3/√5 ≈ 1.342 > 1`; ratio in `[0,1]` times width `→ 0` | Lojasiewicz1964 lines 389–404, 440–466; `continuousOn_regionBetweenMap` (`Topology/Order/RegionBetween.lean:331`) has no compactness hypothesis; lines 150, 225–239, 306 | sound |
| §2.0e topographic family | six recorded properties against (1)–(6); boundary planes | planes `M × {±1}` unbounded, bounded over bounded bases; tails compact, disjoint | Lojasiewicz1964 lines 545–558 (p. 465), 620–628; formula of (3) lost in the extraction, line 553 | sound; see Not verifiable and Source issues |
| §2.0f prismatic decomposition | clipped family; diagonal pair | complement splits into `M ∖ πΓ` and `{|Γ| ≥ 2}`, disjoint and closed | Lojasiewicz1964 lines 658–684 (step II), 685–765 (step III); `π(Γ ∩ Γ′ ∩ (M × (−2, 2)))` at line 665 | sound |
| §2.0g transfer map | `s(β)`; conditions IV(1)–(4); (A⁻¹) then inverse | heights at `τ_b(v)` prescribed; `τ = f⁻¹ ∘ τ*` | Lojasiewicz1964 lines 687–688, 768–819; step V at lines 820–826, printed p. 473 | sound |
| Theorem 1, `exists_affine_semianalytic_triangulation` | `n = 0`; `B = ℤ`, `n = 1`; `sin` | point complex, `card − 1 = 0`; infinitely many vertices; `sin` has (A⁻¹), fibres of `y = sin x` infinite so not (A) | Lojasiewicz1964 lines 486–508 (pp. 463–464): graph partially semialgebraic in the source variable; Lean set `{p | p.1 = τ p.2}`, base target | sound |
| Theorem 3, §2.1, `bounded_semialgebraic_analytic_triangulation` | `k = 0`; `n = 1`, `B₁ = (0,1)`, `B₂ = {1/2}`; `t ↦ (t, |t|)` | `X = ∅ = |K|`; vertices `{0,1/2,1}` give 2 edges + 1 vertex, `{0,1/4,1/2,1}` give 3 + 2; corner forces a vertex | Lojasiewicz1964 lines 519–523, p. 464; `image_of_leftInvOn` (`Submanifold/Image.lean:48`) keeps dimension `k` | sound; N01 |
| §2.1a projective coordinates | `n = 1` locus; two topology instances | `a² + b² = a`, circle of radius `1/2`; `(cos²θ, cos θ sin θ)` on it | Lojasiewicz1964 lines 206–229, 530–533; `projector_injective`, `range_projector` (`Projector.lean:206, 214`); `instTopologicalSpace` declared in both libraries (Tau Ceti line 90, Mathlib line 44) | sound |
| Theorem 4, `exists_multiprojective_semialgebraic_triangulation` | `m = 0`; a factor with `n i = 0`; `ℝP¹`, empty family | one-point space, `∑ n i = 0`, one vertex; chart to `Fin 0 → ℝ`; at least 3 vertices | Lojasiewicz1964 lines 526–529, p. 464; Lean `W.Nonempty →` guards empty chart parts | sound |
| Weighted `∂̄` theorem, §3.1 | `B = 0` where `f ≠ 0`; `B = ε·Id` | no admissible `α`, value `+∞`, hypothesis fails; `|f|²/ε`, bound `ε^(−1/2)‖f‖` | DemaillyAgbook lines 18115–18131, (4.5) Theorem on printed p. 371; (3.2) at line 17987 | sound |
| Stein criterion, `isStein_of_strictlyPlurisubharmonic_exhaustion` | dimension 0; `ℂ² ∖ {0}`; `K = ∅` | discrete countable: hull of finite `K` is `K`, `r = 0` coordinates; sublevels of `|z|²+|w|²` not compact; hull of `∅` is `∅` | Lean lines 255–280: `∀ c, IsCompact {q ≤ c}` equals proper and bounded below; Grauert locator not readable | sound |
| §3.2 Cartan A and B | `sin(πz)` on `ℂ`; `1/(zw)` on `ℂ² ∖ {0}` | simple zeros exactly at `ℤ`; no splitting, each side lacks one sign of negative powers | Lean lines 287–324: finite type plus finite-type kernels of `𝒪_U^q → F|_U`; `ringCatSheaf` (`Sheaf/Defs.lean:62`) | sound; Hörmander numbers not readable |
| §4.1 embedding of the tube | `k = 1, 2`; `g` valued in `ℂⁿ` | `k² − k + 2 = 2, 4`; codimension `(n+1) − k + 1 = n + 2 − k`; `dim D_h = 2n − n = n` | Forstneric2018 lines 97–101 (Theorem 2.1), 113–117 (Proposition 2.2), 136–141 (polyhedral exhaustion) | sound |
| §4.2 Grauert, `grauert_proper_real_analytic_embedding` | `n = 0`; empty `M`; `t ↦ (cos 2 arctan t, sin 2 arctan t)` | target `ℝ²`; empty map is a closed embedding; image misses `(−1, 0)`, not closed | Lean lines 331–360: closed embedding, analytic and immersive in every chart | sound; Grauert locator not readable |
| Theorem 2, §5.2, `exists_manifold_semianalytic_triangulation` | empty `M`; `S¹` with one point; fan at `0` in §5.1 | `Nonempty M` needed for `f`; at least 3 vertices; `x_k → 0` yet weakly closed | Lojasiewicz1964 lines 509–515, p. 464; `IsMSemianalytic` (`Semianalytic/Manifold.lean:143`) | sound |
| §5.3 frontier stratification | semianalyticity of `τ(σ)` | graph over `σ` partially semialgebraic, projection to base semianalytic | Lojasiewicz1964 lines 486–489, p. 463; `semianalyticAt_image_fst` (`PartiallySemialgebraic/Projection.lean:143`) | sound |
| Record: README at the merge base against the head | R0–R5, R1.1, R2.1, R3.0–R3.2, items 0–6 of R3.2, steps 1–8 of R2, 1–5 of R4 | every id kept with its subject and statement; projective atlas item restated on Mathlib's topology, said in the description | Tau Ceti atlas `Projectivization.instIsManifold` (`Manifold/Instances/Projectivization.lean:82`) sits on the clashing topology module | kept |
| Description against the diff (C01, C02) | `Suggested.lean` at merge base and head; R3.1 on main | 231 lines against 404; 17 names removed, 17 added, 1 restated | main R3.1: "data f belong to weighted L²" | two sentences wrong |

- Source locators checked against the text: 39 (Lojasiewicz1964: 33, namely §1.II–III, V, VI, Lemmas 1–15, Theorems 1–4, property (A), §4 steps I–V; Forstneric2018: 3; DemaillyAgbook: 2; WhitneyBruhat1959: Proposition 1 at line 95). The DOIs of Hörmander 1965 and Whitney–Bruhat resolve to the cited articles.
- Library declarations opened at the pin: 63, among them `ContMDiff.isMeagre_range_of_finrank_mfderiv_lt` (`Geometry/Manifold/Sard/Meagre.lean:126`), `HasFDerivAt.finrank_range_lt_of_infinite` (`Analysis/Calculus/FDeriv/RankDrop.lean:73`), `Geometry.SimplicialComplex.exists_subdivision_extending` and `exists_subdivision` (`Analysis/Convex/SimplicialComplex/Subdivision.lean:312, 354`), `closedRegionBetween_convexHull`, `intrinsicInterior_closedRegionBetween`, `intrinsicFrontier_closedRegionBetween` (`Analysis/Convex/RegionBetween.lean:84, 208, 245`), `AnalyticOnNhd.exists_complexification`, `exists_eqOn_of_forall_real` (`Complexification/Neighborhood.lean:132, 158`), `semialgebraicDim_eq_finrank_of_chartedSpace` (`Dimension/Manifold.lean:40`). All 203 Tau Ceti names in the README were located in the pinned sources.
- The pinned Tau Ceti has no declaration for Lemma 5, for the assembled Lemma 10 or for real Weierstrass preparation, so the README rightly keeps them as targets; the generated `STATUS.md` describes a later Tau Ceti.
- Cross-roadmap citations resolved on main: AffineMorseLefschetz §§5.1–5.8, ComplexKahlerGeometry §§2.5, 3.1, 3.2, 3.4, 4.1, 4.2, 5.1, 5.7, 5.9, 6.1, 6.4, 7.1, ComplexManifolds Milestones 5 and 7, GeometricTopology §1.5, AlgebraicTopology §4.6, SmoothBundlesConnections §§B2.1–B2.2, RealAlgebraicGeometry Layers 1, 2, 4, 6, 7; the consumers (ComplexComparisonPartII, SchubertGeometry, GlobalHolomorphicFunctions, Hyperfunctions, AlgebraicTopologyPartII, ComplexKahlerGeometry) cite the labels R0–R5, R3.0–R3.2, which the head keeps.
- Dependency check: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`; no UPWARD or CYCLE line. All seven supplier roadmaps are on main. ComplexKahlerGeometry and this roadmap cite each other by layer, as on main; the item order (K3 §3.2 → R1 → K3 §3.4's partition; K6.0 → R3 → R5 → K6.1) has no cycle.
- Automatic checks: all pass at this head; nothing changes outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with eight `sorry` warnings and no error. One-tactic probe (`rfl`, `infer_instance`, `trivial`, `simp`, anonymous constructor) on a copy: none of the eight theorems closes. The elaborated signatures were compared with the README statements: no binder lost, nothing changed.
- Headline theorems stated: Theorems 1–4, the Stein criterion, Cartan A and B, Grauert's theorem. Named in the module docstring as not statable: the Stein tube of the complexification and the weighted `L²` estimate.

Overlap check: read AffineMorseLefschetz (main and its open revision), ComplexKahlerGeometry (main and its open revision), RealAlgebraicGeometry (main) and Hyperfunctions (open). Finite semialgebraic triangulation and semialgebraic dimension: AffineMorseLefschetz §5.1, cited here. Holomorphic structure sheaf: ComplexKahlerGeometry §4.1, cited here. Continuous band maps: stated in AffineMorseLefschetz §5.6 for its own lift and in §2.0d here as items of main's record, realised once in Tau Ceti (`TauCeti.regionBetweenMap`); unchanged by this pull request. Semianalytic decomposition, Łojasiewicz's theorems, complexification, the Stein predicate and Cartan A/B: this roadmap. No open pull request changes this roadmap or drops an id it cites, and this head drops no id another roadmap cites.

Source independence: 10 passages compared with 4 sources (Lojasiewicz1964, Forstneric2018, DemaillyAgbook, WhitneyBruhat1959), none shared beyond formulas and lists of hypotheses; largest share Lojasiewicz1964, 29 of 46 locators; contents compared with Lojasiewicz1964: independent. §§2.0a–2.0g follow the order of its Lemmas 1–14 and steps I–IV, which the *Needs:* lines of §§2.0a–2.0h force; R0, R1.1, R3–R5 and the placement of Lemma 15 and the theorems have no counterpart in its sections. Grauert1958, Hormander1965 and Hormander1990 could not be read.

Research link: Theorems 1–4 are Łojasiewicz's 1964 triangulation of locally finite semianalytic families; R3–R4 are Hörmander's 1965 `L²` theory, Cartan's theorems A and B and Grauert's 1958 embedding, which Theorem 2 uses. Rests on Lojasiewicz1964 lines 491–529 and the README's consumers section (analytic cycles in ComplexKahlerGeometry, Hyperfunctions).

## Not verifiable

- Grauert1958 (*Annals* 68): cited by locator alone; "Theorem 3, p. 470" (§4.2), "§3, Propositions 6 and 7" (§3.0) and "§2, Theorem 2" (§3.1) could not be checked against the text.
- Hormander1990, Chapter VII: cited by locator alone; the numbers (7.2.2), (7.2.4), (7.2.7), (7.2.8), (7.2.9) and (7.4.3) of §3.2 could not be checked. Hormander1965 likewise.
- Lojasiewicz1964, §4, step I, property (3), printed p. 465: the inequality after "they are empty when" is lost in the extraction (line 553), so the README's report that the source prints `dim Γ < n` there was not read; line 673 prints `dim Γ = n` for such a member, which agrees with it.

## Source issues

- **Error** in Lojasiewicz1964 at §4, step I, property (1), printed p. 465: the source says every member of the family is bounded, yet the family contains the hyperplanes at heights 1 and −1 (p. 466); it should be bounded over every bounded subset of the base; affects nothing.
- **Misprint** in Lojasiewicz1964 at §4, step II, proof of (2), printed p. 468: the source says the remaining case is a member of dimension n; it should be n − 1, members being graphs over subsets of the (n − 1)-dimensional base; affects nothing.

## For the human reviewers

- none
