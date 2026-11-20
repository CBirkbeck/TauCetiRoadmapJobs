# Review of RealAnalyticGeometry (pull request #2634 at 4f3110d)

**Verdict:** needs changes

**Summary.** Changes are needed for three findings. The weighted `∂̄` theorem of §3.1, and the Summary's statement of it, drop the square-integrability of the datum: Demailly's Theorem 4.5 assumes it and the stated route needs it. Łojasiewicz's manifold theorem, the first headline, can be stated at the pins with the README's own chartwise predicates, but `Suggested.lean` lists it as not statable. The Whitney-umbrella Check calls a two-component set connected. There are also seven small corrections and one format note, none blocking, and nothing is left for a human to decide.

## R01 (P2) — The weighted `∂̄` theorem of §3.1 omits the hypothesis that `f` is square-integrable for the weight, which the cited theorem assumes and the stated route needs

As written, an implementer must prove more than the source proves, and by a route that does not reach it. §3.1 (lines 1105–1107) asks only that `f` be distributionally `∂̄`-closed with `∫⟨B⁻¹f, f⟩ e^(−φ) dV < ∞`. The Summary (lines 29–32) says the same: "for every `∂̄`-closed bundle-valued `(n, k)`-form `f` of finite weighted inverse-curvature norm".

The cited locator, Demailly, Chapter VIII, Theorem 4.5 (printed p. 371), takes `g ∈ L²_(p,q)(X, E)` with `D″g = 0` and a finite inverse-curvature integral. Its proof uses the fact that `g` lies in the closed subspace `Ker D″` of that Hilbert space to discard the `(Ker D″)^⊥` component. The README's own route, "orthogonal projection onto `ker ∂̄` and the Riesz representation theorem" (line 1112), needs the same fact.

The hypothesis is not implied by the inverse-curvature bound. On `ℂ` with the Euclidean metric, take `φ = |z|² + |z|⁴`, so that `B ≍ φ_zz̄ = 1 + 4|z|²` is positive definite, and `f = g dz ∧ dz̄` with `|g|² e^(−φ) = (1 + |z|)^(−2)`. Every such `(1,1)`-form is `∂̄`-closed. The inverse-curvature integral then behaves like `∫ r dr / ((1 + r)² (1 + 4r²))` and converges, while `∫|f|² e^(−φ) ≍ ∫ r dr/(1 + r)²` diverges.

The fix is to add `∫|f|² e^(−φ) dV < ∞` to the hypotheses at line 1106 and the word "square-integrable" to the Summary. Every application in §§3.1–3.2 uses `f = ∂̄v` with `v` compactly supported, so it already satisfies the added hypothesis.

## R02 (P2) — Łojasiewicz's manifold theorem (Theorem 2), the roadmap's first headline, is statable at the pins, but `Suggested.lean` declares it not statable

As it stands, the acceptance test leaves out the roadmap's main result. The module docstring (lines 26–29) says the libraries have no analytic submanifolds of a manifold, no maps analytic on them and no property (A) over a manifold base. These are exactly the predicates the README defines in §0.2 (lines 185–193) and §5.2 (lines 1530–1533), and each has a real body on carriers at the pins:

- read `extChartAt I x` through a fixed `e : E ≃L[ℝ] (Fin n → ℝ)`;
- then apply `TauCeti.IsAnalyticSubmanifold` to the chart image on an open set inside the chart's target;
- use `TauCeti.AnalyticOnSubmanifold` for maps into `M` and, through the inverse charts, for maps out of `M`;
- use `TauCeti.PartiallySemialgebraicAt` at `e (extChartAt I y y)` for property (A).

The hypothesis is `TauCeti.IsMSemianalytic I`. We wrote these definitions and a statement of Theorem 2 against the pins:

- some `N` and a `Geometry.SimplicialComplex ℝ (Fin N → ℝ)` whose convex hulls form a locally finite family;
- a homeomorphism `K.space ≃ₜ M`, with total extensions as in `FiniteCompatibleAnalyticTriangulation`;
- property (A), analytic isomorphisms of the open simplices onto analytic submanifolds of `M`, and compatibility with every `B ν`.

It takes about 45 lines, and in a `noncomputable section` it elaborates against the pins with `sorry` as the only warning. Add the definitions and the theorem; the former `ChartwiseRealAnalyticSubmanifold` was the first of them. Then remove Theorem 2 from the docstring's list of statements that are not statable.

## R03 (P2) — The Whitney-umbrella Check of §1.0a calls `T = W ∖ S` connected, but `T` has two components

The Check (lines 308–312) presents `{S, T}` as "this partition into connected analytic submanifolds". Every point of `T` has `y ≠ 0`, and `T` is the graph of `z = x²/y²` over `{y ≠ 0}`. That domain is two half-planes, so `T` has exactly two components, `y > 0` and `y < 0`. The argument still works on each half. With `T₊ = W ∩ {y > 0}`, the curve `(√z · y, y, z)` with `y → 0⁺` gives `closure(T₊) ∩ S = {z ≥ 0}`. Write "split into the `z`-axis `S` and the two halves `T± = W ∩ {±y > 0}`" and run the same argument with `T₊`.

## C01 — The normal-box theorems of §2.0 carry no locator

§2.0 (lines 419–432) states the existence of normal boxes compatible with finitely many functions and sets, the form with a prescribed zero set, and the projection statement, all without a locator. Łojasiewicz states them (without proof) in §1.III.1 and §1.III.2 (printed pp. 452–453) and §1.II.6 (p. 452). Add these locators, as §§2.0a–2.0d do for the lemmas.

## C02 — The numbered results of §3.2 name no text

The finite-cut lemma, summable sections, coherent approximation, theorem A, coefficient lifting and theorem B are cited as (7.2.2), (7.2.4), (7.2.7), (7.2.8), (7.2.9) and (7.4.3) (lines 1293, 1333–1334, 1338, 1340, 1355). Nothing in the References has that numbering: Hörmander's entry is the 1965 *Acta* paper. Name the book and edition these numbers come from, at the first citation and in the References.

## C03 — §2.1a credits Tau Ceti's instances with making Mathlib's topological projective space an analytic manifold

Lines 898–903 put Mathlib's quotient topology on `Projectivization ℝ (Fin (n+1) → ℝ)` and say that `Projectivization.instChartedSpace` and `Projectivization.instIsManifold` make it analytic, with "no second topology or atlas" introduced. At the pin, those instances are built on Tau Ceti's own `Projectivization.instTopologicalSpace` (`TauCeti/Topology/Algebra/Projectivization.lean`, line 90). That instance has the same name as Mathlib's (`Mathlib/Topology/Algebra/Projectivization.lean`, line 44), so the module cannot be imported beside `import Mathlib`. The supplier contracts say this themselves (lines 1836–1839). Would the author say instead that §2.1a reads analyticity through the chart maps `Projectivization.affineChart`, a `PartialEquiv` whose file imports no topology, or else own an atlas on Mathlib's topology?

## C04 — One of the docstring's reasons for leaving out the Stein tube is not a missing carrier

The module docstring (lines 34–36) gives "no Stein predicate" as a reason. Convention 8's predicate has a real body on Mathlib's carriers:

- the holomorphic hull defined through `MDifferentiable` functions;
- separation of points;
- an injective `mfderiv` of finitely many global functions.

Written out with that predicate, the Stein criterion of §3.1 elaborated at the pins in about 20 lines: a smooth exhaustion that is `TauCeti.IsManifoldStrictlyPlurisubharmonicAt` at every point makes the manifold Stein. The tube itself does still need a complexification carrier. Would the author keep only that reason, and perhaps state the criterion, on which the tube's Steinness rests?

## C05 — The link from ComplexComparisonPartII into §3.1 loses its anchor

ComplexComparisonPartII links to `../RealAnalyticGeometry/README.md#r31-weighted-estimates-stein-criteria-and-approximation`, at line 245 of its README on main and again at the head of its open revision. The renamed heading of §3.1 no longer produces that anchor, so the link lands at the top of the file. The label R3.1 is still in the heading, so a reader can find the section. Keeping the old anchor, for example with an HTML anchor before the heading, would keep the link working. Hyperfunctions' link points at a fixed commit and is unaffected.

## C06 — The Forstnerič reference points at "§4.1" ambiguously

The entry ends "The constrained transversality and shell approximation are proved in §4.1" (lines 1915–1916). Next to a citation of Forstnerič this reads as his §4.1, which treats strongly pseudoconvex domains. Write "in §4.1 above".

## C07 — The description says the planned mathematics is unchanged, but the head removes many targets from the plan

The description says "The mathematics planned is unchanged." Its own later paragraph, and the head, move many former targets into supplier contracts, so they are no longer planned. Examples are the neighbourhood complexification of R0, most of R1.1, Lemmas 1, 2 and 6, and the band calculus. Suggested text: "No statement is weakened; targets that the pins already prove become supplier contracts, listed below."

## N01 — The README says it follows a source

The README says "following Łojasiewicz's §§2 and 4" (line 59) and "following Łojasiewicz's Lemmas 1–15 (§2) and the four steps of his §4" (lines 401–402), and §2.0d's proof route opens with "Route, following the construction" (line 582). The order of §§2.0a–2.0h is forced by their *Needs:* lines, so say that and keep the locators.

## Questions for the author

- Grauert's 1958 paper is usually quoted for a real-analytic embedding into `ℝ^(2n+1)`, while §4.2 and `grauert_proper_real_analytic_embedding` state `ℝ^(4n+2)`. Is the weaker target dimension deliberate, a statement of what the Stein route gives directly, with the sharp form left out? The paper is paywalled, so its statement could not be read.
- Could Theorem 4 be stated in the same way as Theorem 2? That would take semialgebraicity of subsets of a product of projective spaces through the quotient maps from nonzero vectors (§2.1a's definition), with the chartwise condition read through `Projectivization.affineChart`, which needs no topology. We checked that the chart's file imports no topology, but did not elaborate a full statement.

## Verified sound

| Target | Instances tried | Roadmap side (computed) | Source or library side (computed) | Result |
|---|---|---|---|---|
| 0.1 germs, complexification | chart `x ↦ x³`; S¹ two charts | coordinate read in it is `y^(1/3)`, not analytic at 0; transition `z ↦ 1/z` | Whitney–Bruhat §1 Prop. 1 p. 133: existence for paracompact, uniqueness near Ω; involution remark p. 136 | sound |
| 0.2 chartwise submanifolds | cross `{xy = 0}` in ℝ²; diagonal of `M × M` | origin has 4 branches: not 1-dim; axes minus origin are | `IsAnalyticSubmanifold`: nonempty, `d ≤ n`, straightening charts (Submanifold/Basic.lean:238) | sound |
| 1.0 normal decomposition | `x² − y²` at 0 | 9 pieces (point, 4 rays, 4 sectors) vs 5 sign components incl. the cross | Łojasiewicz §1.II: members connected, finite | sound |
| 1.0a dimension, frontier | segment `[0,1]×{0}`; umbrella `x² = zy²` | `dim 1`, `closure∖A = ∅`, frontier = A; `T` = graph over `{y≠0}`: 2 components | closure(T₊) ∩ S = `{z ≥ 0}` via `(√z·y, y, z)` | R03 |
| 1.1 Nash | `√(1+x)`; `exp` | `4a⁴ − 4(1+x)a² − y² = 0`; at `y = 0`: `4a²(a²−1−x)`; Cauchy root bound polynomial | §1.VI p. 454: analytic-algebraic functions, locally semialgebraic sets | sound |
| 2.0 normal boxes | projection to first `m` coords | labels `k ≤ m` preserved | §1.II.6 p. 452; §1.III.1–2 pp. 452–453 | C01 (no locator) |
| 2.0a Lemmas 1–4 | `f = y`; `f = exp y` | singular set {horizontal}; none singular, though positive-order derivatives vanish | Lemma 3 p. 456: meagre for `f ≢ 0` on connected open | sound |
| 2.0b Lemmas 5–7 | `{sin t = 0}`; `t² − u`, `g = t² + u` | fibres `πℤ`: not partially semialgebraic; `[0,∞)` not open; `{u = ±t²}` open projections | Lemma 5 p. 457 needs bounded | sound |
| 2.0d Lemma 10 | `(u,t) = (2,3)`, `h = 2 + t²`; `h ≡ 1` | `g₁ = (22, 3)`, `3/√485 ≈ 0.136 < 1`; `3/√5 ≈ 1.34 > 1` | pp. 459–460: conditions 1°–6° as README; β, `g₁`, `g₂` as README | sound |
| 2.0f steps II–III | diagonal pair, Γ graph over open set | `M ∖ πΓ` closed, unbounded; `{|Γ| ≥ 2}` compact | p. 468 calls both compact (error, see Source issues) | README correct |
| 2.0g step IV | interpolant conditions | projection, strict order, bounds, face inclusion | IV(1)–(4) p. 471, same four | sound |
| 2.0h Theorem 1 (Lean) | `n = 0`; `n = 1`, `B = ℤ`; `sin` | point: `K = {{pt}}`, `τ = id` meets all clauses; infinitely many vertices; (A⁻¹) holds, (A) fails | p. 463: (A) = graph partially semialgebraic in source; (A⁻¹) p. 462 | sound |
| 2.1 Theorem 3 (Lean) | `y = |x|`; `(0,1), {1/2}`; `k = 0` | vertex at `(0,0)` forced; vertex at `1/2`; empty complex | p. 464: finite `K` in `M`, semialgebraic `τ : |K| → ⋃ closure B_i`, (b), (c) | sound |
| 2.1a projector | `n = 1` | locus `a² + b² = a`; `(cos²θ, cosθ sinθ)` on it; sign of `b` separates | p. 464 formula: indices `1..n`, target `ℝ^(n²)` (misprint) | sound; C03 |
| 2.1b Theorem 4 | `ℝP¹`, empty family | `K` has ≥ 3 vertices | p. 464: finite `K`, semialgebraic onto `M`, (b), (c) | sound; question |
| 3.0 complexification, tube | `p = (Im z)²`; `|Im z|`; `ℂ² ∖ {0}` | `i∂∂̄p = dx∧dy > 0`; not C¹; hull of sphere = closed ball minus 0 | W–B p. 134: three covers, disjoint buffers `A*`, `B*` | sound |
| 3.1 weighted theorem | `φ = |z|² + |z|⁴` on ℂ | `B⁻¹`-integral `∫ r/((1+r)²(1+4r²))` finite; L² `∫ r/(1+r)²` infinite | Demailly VIII Th. 4.5 p. 371 assumes `g ∈ L²` | R01 |
| 3.1 jet interpolation | ℂ, `d = 0`, `s_a = 1` | `∫|z−a|^(−2)` diverges, `m ≥ 1` converges; `m > s − n` | — | sound |
| 3.2 Cartan A/B | `ℤ ⊂ ℂ`; `ℂ² ∖ {0}`, `1/(zw)` | `sin(πz)` simple zeros at ℤ; Laurent terms exclude coboundary | no text named | sound; C02 |
| 4.1 tube embedding | coranks `k = 1, 2` | surplus `k² − k + 2` = 2, 4; codim `n + 2 − k` | Forstnerič §2.1 Th. 2.1(a) `N > 2n`, (d) almost proper; Bishop shells p. 4 | sound |
| 4.2 Grauert (Lean) | `n = 0`; `M = ℝ`; arctan circle | countable discrete into ℝ²; `t ↦ (t,0,…)` in ℝ⁶; image not closed, excluded | Grauert unread | sound; question |
| 5.1 realization | star at 0, `x_k = (1,1/k)/k` | weak-closed, converges to 0 | Tau Ceti realization file | sound |
| 5.2 Theorem 2 | `S¹`, one point | ≥ 3 vertices | p. 464: countable manifold, `K` in affine Λ, (a)(b)(c) | sound; R02 (Lean) |
| Stein tube, Stein criterion | — | not statable without complexification | criterion elaborates with a 20-line predicate | C04 |

- Source locators checked against the text: 31 (Łojasiewicz Theorems 1–4, Lemmas 1–10, 14, the (A)/(A⁻¹) definitions, §1.V–VI, §4 steps I–IV; Whitney–Bruhat Prop. 1 and remark; Forstnerič Th. 2.1, Prop. 2.2; Demailly VIII Th. 3.2, 4.5).
- Library declarations opened at the pins: Tau Ceti `IsSemialgebraicOn` (Semialgebraic/Function.lean:49), `PartiallySemialgebraicAt`, `IsPartiallySemialgebraic` (PartiallySemialgebraic.lean:447, 628), `IsAnalyticChart`, `IsAnalyticSubmanifold`, `AnalyticOnSubmanifold` (Submanifold/Basic.lean:130, 238, 308), `SemianalyticAt`, `IsSemianalytic` (Semianalytic/Basic.lean:242, 433), `IsMSemianalytic` (Manifold.lean:143), `IsManifoldStrictlyPlurisubharmonicAt` (Complex/LeviForm.lean:343), `exists_subdivision_extending` (SimplicialComplex/Subdivision.lean:312), `affineChart` (Projectivization/AffineChart.lean:101), both `Projectivization.instTopologicalSpace`; Mathlib `sheafOfModulesEquivOver` (Topology/Sheaves/Module.lean:28), `AbstractSimplicialComplex`.
- Cross-roadmap citations resolved on main: ComplexKahlerGeometry §§2.5, 3.1, 3.2, 3.4, 4.1, 4.2, 5.1, 5.7, 5.9, 6.1, 6.4, 7.1; ComplexManifolds Milestones 5, 7; GeometricTopology §1.5; AlgebraicTopology §4.6; SmoothBundlesConnections B2.1–B2.2; AffineMorseLefschetz §§5.1–5.8; RealAlgebraicGeometry Layers 1, 2, 4, 6, 7. All suppliers are on main.
- Dependency check: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`. The two-way supply with ComplexKahlerGeometry interleaves at section level (its §3.4 consumes §§1.0–1.0a; §2.0a consumes its §3.4 Noetherian germs), as on main.
- Automatic checks: all passed. No change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with three `sorry` warnings only; `#check @` of every declaration matches the README statements (no binder lost); `simp` and `infer_instance` close none of the three theorems; written statements of Theorem 2 and of the Stein criterion elaborate.
- Overlap check: read AffineMorseLefschetz, ComplexKahlerGeometry, RealAlgebraicGeometry, Hyperfunctions and ComplexComparisonPartII (main) and StratifiedSpacesAndTameTopology (open). Shared objects and their owners: finite semialgebraic triangulation → AffineMorseLefschetz §5.1, which this roadmap refines (Theorem 3); bounded semialgebraic triangulation → this roadmap §2.1, which StratifiedSpacesAndTameTopology 4.3 cites; coherent module predicate → this roadmap §3.2 item 0, which ComplexKahlerGeometry concedes; manifold complexification → this roadmap §3.0, which Hyperfunctions consumes.

Source independence: 11 passages compared with 4 sources (Lojasiewicz1964, WhitneyBruhat1959, Forstneric2018, DemaillyAgbook). None shares wording beyond forced formulas and theorem statements; the longest common run is 5 words (Forstneric2018 line 140). The largest share is Lojasiewicz1964, with 18 of 33 locators. Contents compared with Lojasiewicz1964: §§2.0a–2.0h run in the order of its Lemmas 1–15 and §4 steps I–V, an order forced by their *Needs:* lines, and each has roadmap-owned scope. Layers 0, 3, 4 and 5 and §§2.1–2.1b have no counterpart. Result: independent.

Research link: Theorems 1–2 are Łojasiewicz's 1964 triangulation of semianalytic sets, whose property (A) forces non-algebraic singularities in homeomorphisms between Milnor's 1961 polyhedra; Layers 3–4 are Grauert's 1958 Levi-problem and embedding theorems, which Theorem 2 uses. ComplexKahlerGeometry consumes Layers 1 and 5, SchubertGeometry Layer 3. Rests on Lojasiewicz1964 pp. 449, 464 and the README.

## Not verifiable

- Grauert 1958, *Annals* (JSTOR): paywalled. This affects §§3.0 and 4.2 attributions and the target dimension.
- Hörmander 1965, *Acta Mathematica* (Springer DOI): paywalled. This affects §3.1.
- The numbered results (7.2.2)–(7.4.3) of §3.2: they name no text (C02).
- Łojasiewicz §1.II items 2–5 (pp. 451–452): the text extraction is garbled. Only the items cited above were read on the page images.

## Source issues

- **Misprint** in Lojasiewicz1964 at Theorem 4, proof, printed p. 464: the source says the projector uses indices `1, …, n` with target `ℝ^(n²)`; it should be indices `0, …, n` and target `ℝ^((n+1)²)`, since otherwise the map is not injective; affects the proof.
- **Misprint** in Lojasiewicz1964 at Lemma 10, printed p. 459: the source says `G` is a subset of `M` whose interior contains `{c} × ℝ`; it should be a subset of `M × ℝ`; affects nothing.
- **Misprint** in Lojasiewicz1964 at Lemma 10, proof, printed p. 460: the source says `|β′(t)| ≤ min(2, 1/t)`; it should be `min(2, 1/|t|)`; affects nothing.
- **Gap** in Lojasiewicz1964 at Lemma 3, proof, printed pp. 456–457: the source says the set cut out by all directional derivatives is analytic because germ rings are Noetherian; finite generation at each point gives no common neighbourhood, so an identity argument on components is needed; affects the proof.
- **Error** in Lojasiewicz1964 at §4, step I, printed p. 466: the source says the collection including the hyperplanes `M × {±1}` satisfies condition (1), which requires every member bounded; the hyperplanes are unbounded, and the condition should require boundedness over bounded base sets; affects the proof.
- **Error** in Lojasiewicz1964 at §4, step II, printed p. 468: the source says `M ∖ π(Γ)` and `{u ∈ π(Γ) : |Γ(u)| ≥ 2}` are each compact; the first is unbounded, and both should be called closed, which suffices; affects the proof.

## For the human reviewers

- none
