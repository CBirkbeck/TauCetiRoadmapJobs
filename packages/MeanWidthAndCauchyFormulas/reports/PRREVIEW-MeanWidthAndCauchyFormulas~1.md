# Review of MeanWidthAndCauchyFormulas (pull request #3189 at 2d9525d)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check, example or route was found false, and every source locator that could be opened supports the statement it is attached to. All twelve sampled targets were recomputed in degenerate cases (dimension 0, 1, 2, 3, empty and one-point sets, empty index family, `a > b`) and against each other. There are two small corrections (the routes of 2.1 and 5.1 are those of a preprint that the text calls "context only"; compactness is not needed in 2.2) and three format notes, none blocking. Two points are left to the human reviewers: the relation to the Aiger–Har-Peled–Žužić preprint and its Lean development, and two texts that could not be read.

## C01 — The routes of 2.1 and 5.1 are the arguments of Lemma 5.1 and Theorem 5.3 of the Aiger–Har-Peled–Žužić preprint, which the README lists as "context only"

A reader is told that 2.1 and 5.1 are "(Proved here.)" and that the preprint is cited for context, and 2.1 carries no source locator at all, so nothing points to where the three-dimensional statement and its proof appear. Opened at its locator, the preprint proves the three-dimensional case of 2.1 as Lemma 5.1 (p. 14) by the same steps in the same order as the converse in 2.1: symmetry puts the centre at the origin, each coordinate has range of the right length on `K`, `K` is recentred to a set `K₀` inside the centred box, each sign vector is a difference `x − y` of points of `K₀` whose coordinates are thereby forced, and convexity fills the box (AigerHarPeledZuzic2026 lines 608–616). Its Theorem 5.3 (pp. 15–16) proves the three-dimensional case of 5.1 by the chain of steps 1 to 4 of 5.1: the pairing inequality `h ≤ ∑ cᵢ |⟪vᵢ, u⟫|`, vanishing of a continuous nonnegative function of integral zero, evaluation at a contact vector giving `∑ cᵢ |aᵢ| (1 − |aᵢ|) = 0`, and equality of support functions by separation (lines 679–719). The roadmap's text is at greater generality (any real vector space and any linearly independent family; any dimension, repeated and opposite contact vectors) and shares no sentence with the preprint; what is missing is the pointer.

The smallest change: at 2.1 add a locator such as "(for invertible affine images of the cube in `ℝ³`: Aiger–Har-Peled–Žužić, Lemma 5.1, p. 14, whose argument the route extends)", at 5.1 add "(the route extends that of Aiger–Har-Peled–Žužić, Theorem 5.3, pp. 15–16)", and in the References replace "(context only, under Scope)" by these two locators.

## C02 — In 2.2 the compactness of `K` is not needed: the inequality holds for every convex set

The statement asks for `IsCompact K`, and an implementer who has a bounded open convex set, or any convex set, must pass to a closure by hand. The inequality holds for every convex `K ⊆ E`: if `K` has empty interior both sides are `0` (the first case of the route, which does not use compactness); if `K` has nonempty interior and is unbounded then `vol K = ∞`; if it is bounded, `closure K` is compact and convex with `vol(closure K) = vol K` (Mathlib `Convex.addHaar_frontier`), and `K − K ⊆ closure K − closure K`, so the compact case gives the bound. If the compact form is kept on purpose, as the sources state it for convex bodies, a clause saying that the general convex case follows in this way would do; otherwise the hypothesis could be dropped from the README statement and from `volume_sub_le_choose_mul_volume`.

## N01 — Several Mathlib names are written with a shortened namespace

`Measure.addHaar_smul`, `Measure.addHaar_submodule`, `Measure.isOpenPosMeasure_smul`, `Measure.nullSingletonClass_hausdorff`, `Measure.toSphere.instIsOpenPosMeasure` and Tau Ceti's `Measure.euclideanHausdorffMeasure_one` live in `MeasureTheory.Measure`, and `lintegral_iSup`, `lintegral_finsetSum`, `lintegral_lintegral_swap`, `lintegral_comp_eq_lintegral_meas_le_mul`, `ofReal_integral_eq_lintegral_ofReal`, `integral_eq_zero_iff_of_nonneg` in `MeasureTheory`; a reader who pastes them without `open MeasureTheory` finds nothing. Full names in the supplier contracts would settle it.

## N02 — The Tropp entry of the References is cited by no section

The entry gives three locators (Definition 2.5.5, Theorem 14.5.1, Lemma 14.5.2, p. 125), but no layer, convention or scope paragraph refers to it. It would fit at the support-function convention and at the sentence of 5.1 on John's position; otherwise a reader cannot tell what it supports.

## N03 — Three statements of `Suggested.lean` are bundles of calculus rules rather than headline theorems

`realSupportFunction_spec`, `widthFunction_spec` and `meanWidth_spec` each conjoin three to six facts of Layers 1 and 3. None closes with one tactic, so they are not padding, but a conjunction of five clauses is awkward to use and to match with the README bullets. They could stay as they are, or be left to the README as targets, the file keeping 2.1, 2.2, 3.2, 3.3 and Layers 4 and 5.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 1.1 support function | `K = {p}`; `closedBall c r`; `K = ∅`; `c = 0`; `(0,1) ⊂ ℝ` | `⟪p,u⟫`; `⟪c,u⟫ + r‖u‖`; `toReal ⊥ = 0`, no greatest element; `0 • K = {0}`, both `0`; sup `1` not attained | holds; hypotheses needed |
| 1.2 width and diameter | `E = {0}`; one point; equilateral triangle side 1; `[0,1]²` | sphere empty, no greatest; width `0 = diam`; widths in `[√3/2, 1]`, max `1 = diam`; max `√2 = diam` | holds |
| 2.1 parallelepiped criterion | `ι = ∅`; `K = ∅`; triangle `conv{0,(2,0),(0,2)}` with 3 dependent vectors; `∂[0,1]²` | both sides "K is a point"; both false; `max(|a|,|b|,|a−b|) = ½(|a|+|b|+|a−b|)` so hexagon equals zonotope, `T` not; `∂Q − ∂Q = [−1,1]²` | iff holds; both negative controls true |
| 2.2 Rogers–Shephard | `K = ∅`; `n = 0`; `[0,1]²`; simplex `n = 1,2,3`; `[0,1] ∪ [10,11]`; beta integral `n = 1..4` | `0 ≤ 0`; `1 ≤ C(0,0)·1`; `4 ≤ 6`; ratios `2, 6, 20 = C(2n,n)`; `6 > 4`; `1/2, 1/6, 1/20, 1/70` | holds; convexity needed; compactness not (C02) |
| 3.1 mean width | ball radius `r`; `d = 0`; `∅ + L`; translate | `2r`; `σ = 0`, all sides `0`; `0 ≠ meanWidth L`; `⟪a,u⟫ + ⟪a,−u⟫ = 0` | holds |
| 3.2 constant and zonotopes | `d = 0..5`; `β = (d−1)/2` beta moment; cube `d = 1..4`; `[0,v]`; `ι = ∅` | `m = 0, 1, 2/π, 1/2, 4/(3π), 3/8`; `Γ(β+½)/(√π Γ(β+1)) = m_d`; `2, 8/π, 3, 32/(3π)`; `m_d‖v‖`; `0 = 0` | holds |
| 3.3 planar formula | unit disc; `[−1,1]²`; `K = ∅` | `(1/π)·2π = 2`; `(1/π)∫(|cos|+|sin|) = 8/π`, equals 3.2; `0 = 0` | holds |
| 4.1 Crofton | circle radius `r`; segment in `ℝ³`; `a > b`; `d = 0`; `d = 1` | `(2/π)·2πr = 4r`; `m₃·1 = ½ = avg|u₁|`; `0 = 0`; `0·V = 0`; `V = ½V + ½V` | holds, factor `¼∫dθ` matches Ghomi |
| 4.2 closed curves | square boundary in a plane of `ℝ³`; open segment; `a = b`; planar case | `2·(m₃+m₃) = 2 = m₃·4`; `1 > ½` without closedness; `0 ≤ 0`; `L ≥ π·meanWidth` | holds, equality attained |
| 4.3 Cauchy | triangle `(0,0),(1,0),(0,1)`; quadrilateral `(0,0),(3,0),(4,2),(1,3)` (convex, cross products `6,7,10,9`); disc; segment | `2+√2`; `3+√5+2√10`; `2πr = π·2r`; `ℓ ≠ 2ℓ` without interior | holds; interior needed |
| 4.4 Barbier | `w = 0`; disc; Reuleaux width 1 | point, `μ = 0 = π·0`; `2π = π·2`; `3·(π/3) = π` | holds |
| 5.1 cube bound | `d = 0`; `d = 1`; weights `(2,2,−2)` at `±30°, 0°`; `vᵢ = eᵢ/2`, `c = 4`; hexagon `c = 2/3`; `e₁,e₁,e₂`; octahedron `c = 3/8` | `0 ≤ 0`, cube `= {0}`; length `≤ 2`; sum is `I`, perimeter `16−4√3 > 8`; `16/π > 8/π`; `4√3 < 8`; equality iff `[−1,1]²`; `∑ c vvᵀ = I` | holds; each hypothesis needed |
| Lean/README generality | all 12 theorems, 5 definitions | elaborated types read against README: casts `↑(finrank)`, `ofReal`, sphere subtype, `Nontrivial E` in 1.2, `FiniteDimensional` from 2.2 on | agree |

- Source locators checked against the text: 7 (Ghomi Lemma 2.3 p. 5 and Corollary 2.4 p. 6; Resnikoff §2.2.2 eq. (2.28) p. 15, theorem and Barbier remark p. 16; Böröczky–Fodor–Hug Theorem 1.1(ii) pp. 3–4; Colesanti p. 3 (5) and (6)); all support the statements. The four claims of the Related-work paragraph were checked against the preprint (abstract, Lemma 5.1, Theorem 5.3, Lemma 6.4).
- Library declarations opened: 68 names resolved by `#check` at the pins, among them `TauCeti/Probability/Distributions/Uniform/Sphere/Basic.lean:77, 82, 97, 104, 138`, `…/Sphere/Coordinate.lean:169`, `…/Sphere/OneDimensional.lean:98`, `…/Sphere/Circle.lean:51`, `TauCeti/Probability/Distributions/Beta/Basic.lean:225`, `TauCeti/Topology/EMetricSpace/CurveLength.lean:173`, `TauCeti/Geometry/Euclidean/Volume/Measure.lean:88`, `TauCeti/Analysis/Convex/Gauge.lean:56`, `TauCeti/MeasureTheory/Measure/Lebesgue/BrunnMinkowski/Basic.lean:175`, `Mathlib/Geometry/Euclidean/Volume/Measure.lean:68`; hypotheses read for each Tau Ceti lemma.
- Cross-roadmap citations resolved on main: 3 (ConvexAnalysisAndDuality §2.1 `supportFunction`, README line 258 and `Suggested.lean` line 138, copy and `variable` line identical; BanachSpaceTheory 7.2; Isoperimetry §2.3).
- Duplication: no declaration or prose on support functions of sets, mean width, Rogers–Shephard, Crofton for curves, Barbier or the cube bound in the pinned Mathlib or Tau Ceti, on main or at the 335 open heads; Tau Ceti's isodiametric file uses half the difference body only for a volume lower bound.
- Overlap check: read Isoperimetry, GeometricMeasureTheory, GaussianIsoperimetryAndClusters; nothing shared (Isoperimetry owns perimeter = Hausdorff measure of the boundary, GeometricMeasureTheory owns curve length and rectifiability; both are cited, not restated).
- Dependency check: `depcheck: 23 roadmaps, 113 edges, 0 problem(s)`; suppliers are on main; no change outside the folder.
- Elaboration: `Suggested.lean` elaborates with twelve `sorry` warnings and nothing else; single `import Mathlib` plus one Tau Ceti module; no `set_option`, no sorry'd data. One-tactic probe (`simp`, `rfl`, `infer_instance`) on a copy: none of the twelve theorems closes.
- Pull request text: title and description agree with the head (12 theorems, 5 definitions, one new folder, three roadmaps cited, none a declared dependency).

Source independence: 14 passages compared with 5 sources, no sentence shared; the routes of 2.1 and 5.1 have the step order of AigerHarPeledZuzic2026 Lemma 5.1 and Theorem 5.3 at greater generality and in other words (C01); largest share Ghomi2016, 2 of 6 locators (tied with Resnikoff2015); contents compared with Ghomi2016 (§§2–8) and AigerHarPeledZuzic2026 (§§2–6): independent, the three shared results stand in Layers 2, 5 and 4, against §5, §5 and §6. Tropp's notes could not be read.

Research link: 5.1 is the mean-width inequality of Schechtman–Schmuckenschläger (1995) with Barthe's (1998) equality case, as stated in Böröczky–Fodor–Hug (2025), Theorem 1.1(ii); 2.2 is Rogers–Shephard (1957); 4.1–4.2 are the projection lemmas of Ghomi's work on widths of curves; 2.1, 4.3, 5.1 are used by Aiger–Har-Peled–Žužić (2026). Rests on the sources read.

## Not verifiable

- Tropp, *Lectures on Convex Geometry*: the DOI resolves to a host the sources service does not classify; its three locators in the References were not checked (no section cites them).
- Rogers–Shephard 1957: not opened; the statement was checked through Colesanti p. 3, and the route of 2.2 was checked by computation, not against the original.
- The journal data of Böröczky–Fodor–Hug (Math. Ann. 393 (2025) 271–316): only the arXiv version v1 was read.
- The Lean development in the ancillary files of arXiv:2611.32334 was not opened, so `Suggested.lean` was not compared with it.

## Source issues

- none

## For the human reviewers

- **Licence.** The routes of 2.1 and 5.1 follow, step for step and in other words, Lemma 5.1 and Theorem 5.3 of arXiv:2611.32334v2 (dated 25 November 2026, unrefereed); the README cites it as context only (C01). Its licence was not checked.
- **Licence.** That preprint ships a Lean 4 development in its arXiv ancillary files; it was not opened here. The description says the author compared `Suggested.lean` with it for shared names and docstrings; this review did not repeat that.
- **Scope.** The headline results are classical and refereed (Rogers–Shephard 1957; Böröczky–Fodor–Hug, Theorem 1.1); the README's stated consumer (Scope, "Related work") is the unrefereed preprint above, which announces Hadwiger's covering conjecture in dimension three.
- **Not tested.** Tropp's lecture notes (References) could not be read legally; no statement rests on them.
