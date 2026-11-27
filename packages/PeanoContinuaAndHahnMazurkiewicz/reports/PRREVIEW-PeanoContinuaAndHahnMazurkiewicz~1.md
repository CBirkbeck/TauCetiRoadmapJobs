# Review of PeanoContinuaAndHahnMazurkiewicz (pull request #3213 at 2f6122b)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, proof route, Check and example was recomputed (degenerate cases, each hypothesis, both directions of each equivalence) and every cited Mathlib and Tau Ceti declaration was opened at the pins; nothing false was found, and `Suggested.lean` elaborates with `sorry` as its only warning. There are one small correction (a Check of 1.2 takes `δ` from the wrong statement) and five format notes, none blocking. The only source the README cites, D. Calegari's lecture notes, could not be read through a legal route, so its five locators, the wording and the arrangement were not compared with it: that, and a roadmap whose single source is unpublished notes, are left to the human reviewers.

## C01 — The Check of 1.2 that derives the forward half from Tau Ceti takes `δ` from the definition, where the enclosing lemma supplies its own

A reader who follows the third Check of 1.2 (README lines 120–123) literally gets a cover by connected sets that are only `2ε`-small. The Check says "with `δ` from `IsCompact.isUniformlyLocallyConnected` for `ε`, cover the space by finitely many balls of radius `δ / 3` and enclose each in a connected `ε`-small set". With the `δ` that the definition gives for `ε`, each point of the ball is joined to the centre by a connected `ε`-small set, and the union of these is connected and `2ε`-small, no better. `TauCeti.IsUniformlyLocallyConnected.exists_isConnected_superset` (`TauCeti/Topology/UniformlyLocallyConnected.lean`, line 143) returns its own `δ`, built from `ε / 2`, and it is for that `δ` that a set of diameter less than `δ` has a connected superset of diameter at most `ε`.

The smallest change: "with `δ` from `TauCeti.IsUniformlyLocallyConnected.exists_isConnected_superset` for `ε` (applied to the whole space, which is uniformly locally connected by `IsCompact.isUniformlyLocallyConnected`), cover the space by finitely many balls of radius `δ / 3` …". The conclusion of the Check is unaffected.

## N01 — Targets 1.2, 1.3 and 4.1 carry no source locator

They are proved in full in the README, so nothing is unsupported, but all three are textbook results (the property S characterisation of local connectedness, the closed sine curve, the non-existence of an injective curve onto the square), and the README's only cited text is a set of lecture notes. A locator into a refereed text for each would let a reader check the statements against the literature. I name none, having opened none.

## N02 — The Summary states two headline theorems for metric spaces where the layers and the Lean file state them for pseudometric spaces

The Extension bullet (line 13, "If a metric space is path connected …") and the property S bullet (line 19, "A compact metric space …") are 3.1 and 1.2, which the layers and `Suggested.lean` state with `PseudoMetricSpace`. Writing "pseudometric" in the two bullets would make the Summary agree with the statements it announces.

## N03 — The Summary's list of headline theorems omits 1.3, which `Suggested.lean` states

The module docstring says the file states the headline theorems; the closed sine curve (1.3) is in the file and in the layer guide but not among the five bullets. Either add a bullet, or say in its docstring that it is the negative control for the local connectedness hypothesis of 3.2.

## N04 — The route of 4.1 could cite a Tau Ceti lemma, and the argument proves more than the square

`unitInterval.isPathConnected_Ioo_prod_Ioo_diff_singleton` (`TauCeti/Topology/UnitInterval/OpenSquare.lean`, line 82) says the open unit square in `I × I` minus a point is path connected. Choosing `p` in the open square, `(I × I) \ {p}` lies between that set and its closure and is connected by `IsConnected.subset_closure`, with no case analysis on corners. Separately, the argument shows that a continuous bijection from `I` onto a Hausdorff space `Y` cannot exist as soon as some point of `Y` other than the two endpoint values has connected complement; the author may wish to state 4.1 in that form (or for `Iⁿ`, `n ≥ 2`) with the square as the instance.

## N05 — `HasPropertyS` and `IsUniformlyLocallyPathConnected` are predicates on a type, Tau Ceti's `IsUniformlyLocallyConnected` on a set

`TauCeti.IsUniformlyLocallyConnected (s : Set X)` (`TauCeti/Topology/UniformlyLocallyConnected.lean`, line 94) is set-level, the form in which a boundary or a closure inside a normed space is usually met. The two new predicates work for a subset through its subtype, so nothing is lost; a sentence in the Conventions saying so, or set-level forms, would spare a consumer the comparison.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 metrizable image | Sierpiński image of `I`; identity discrete → `ℝ → I`; identity of `ℝ → I`; non-surjective `f` | Sierpiński not T1; `|ℝ → I| = 2^(2^ℵ₀) > 2^ℵ₀`; route: `V(U) ⊆ V` uses surjectivity (fibre nonempty) | true; each hypothesis needed | none |
| 1.2 property S iff locally connected | empty space; `ℝ`; Cantor set; pseudometric with distance-0 pairs | empty: family `∅`, both sides true; `ℝ`: LC, finitely many 1-small sets bounded; Cantor: preconnected sets are points, finite union finite | true both directions; backward half needs no compactness | none |
| 1.2 third Check | `δ` of the definition against `δ` of the superset lemma | definition's `δ`: union through centre is `2ε`-small; lemma's `δ` (from `ε/2`): `ε` | wording imprecise | C01 |
| 1.3 closed sine curve | `xₖ = 1/(arcsin y + 2π(k+1))`; `t = 1/(π/2 + 2πk)`; points `(1/(kπ), 0)` | `arcsin y + 2π(k+1) ≥ 3π/2 > 1` so `xₖ ∈ (0,1]`; `(t,1)` at sup-distance 1 > 1/2; `(1/(kπ),0) → (0,0)` | compact, connected, not LC | none |
| 2.1 small paths | empty space; two components; graph over `(0,1]`; closed sine curve | graph: `dist p q = 1/(k(k+1)π) → 0`, every path passes `(t, ±1)` at distance 1; Lebesgue number puts `b ∈ ball a δ ⊆ Cₓ` | true; compactness and LC needed, connectedness not | none |
| 2.1 Step 3 | stage 1 with `m = 1`; adjacent intervals at stage `n` | interval lengths `≤ 1/2`, then halved; adjacent values within `2·2⁻ⁿ`; closures in `closedBall x ρ ⊆ U` | route sound | none |
| 3.1 extension | `K = ∅`; `K = I`; `K` one point; gap with `dist (f u) (f v) = 0`; two-point target; comb space | `∅`: constant, `X` nonempty; right limit bound `εₙ + δₙ/2 → 0`; comb: `F sₙ` at height 0, `F 0 = (0,1)` | true for pseudometric `X`; both hypotheses needed | none |
| 3.2 Hahn–Mazurkiewicz | empty, point, `I`, circle, `I × I`, Cantor set, sine curve, Sierpiński, `ℝ`, two points, `ℝ → I` | empty: no map from `I`, not connected; Sierpiński: image, not metrizable; `ℝ → I`: all but metrizable, cardinality exceeds `I` | iff holds in each; five hypotheses each needed | none |
| 4.1 no injective curve | `p` on the segment `z w`; `p` a corner; Hölder example | corner off the line exists (four corners not collinear); `dimH`: `2 ≤ 1/r` gives `r ≤ 1/2` | true | N04 (offer) |
| `HasPropertyS`, `IsUniformlyLocallyPathConnected`, `closedSineCurve` | `<` against `≤`; preconnected against connected; Mathlib's unbounded curve | variants equivalent under `∀ ε`; empty members droppable; set equals graph over `Ioc 0 1` ∪ segment as in README | definitions are the intended objects | none |

- Source locators checked against the text: 0 of 5 (Calegari not readable; see below).
- Library declarations opened at the pins: 31 Mathlib names (file and line found for each, among them `exists_nat_bool_continuous_surjective_of_compact` at `Topology/MetricSpace/HausdorffAlexandroff.lean:78`, `locallyConnectedSpace_iff_connected_subsets` at `Topology/Connected/LocallyConnected.lean:99`, `Pi.locallyConnectedSpace` at line 213 there, `metrizableSpace_of_t3_secondCountable` at `Topology/Metrizable/Urysohn.lean:128`), 4 Tau Ceti names (`TauCeti/Topology/LocallyConnected.lean:59`, `TauCeti/Topology/UniformlyLocallyConnected.lean:94, 143, 200, 269`), and `Counterexamples/PeanoCurve.lean:37`, `Counterexamples/TopologistsSineCurve.lean:110, 159`.
- Library claims tested: "Mathlib has no instance" of `LocallyConnectedSpace unitInterval` holds at the pin (instance search fails, also for `LocallyPathConnectedSpace`); the second-countability instance for compact metrizable spaces resolves.
- Duplication by object: no metrizability-of-images, property S, uniform local path connectedness, Hahn–Mazurkiewicz or injectivity statement in the pinned Mathlib or Tau Ceti (`Topology.IsOpenQuotientMap.secondCountableTopology` needs an open map; `TauCeti/Topology/Continuum.lean` has directed intersections only).
- Cross-roadmap citations: none in the README. Dependency check output: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`.
- Elaboration: `Suggested.lean` elaborates, seven `sorry` warnings and nothing else; the ten elaborated types were compared with the README statements, no binder lost, nothing changed. One-tactic probe (`infer_instance`, `simp`, `exact?`) on 1.1, 3.2, 4.1 and on local path connectedness of compact locally connected metric spaces: none closes.
- Pull request text: title and description read against the head; no sentence contradicted (7 theorems, 3 definitions, no supplier roadmap, no change outside the folder).
- Automatic checks: all passed on this head.

Overlap check: read CantorSetAndCompactMetricSpaces, PlanarTopology, SorgenfreyLineAndClassicalCounterexamples, FractalGeometry; nothing shared (CantorSetAndCompactMetricSpaces lists Hahn–Mazurkiewicz as not treated; PlanarTopology names it as outside its scope; FractalGeometry owns the Hölder dimension bounds, used here only in an Example through Mathlib).

Source independence: 7 passages compared with 5 pinned library files (Mathlib `HausdorffAlexandroff.lean`, `Counterexamples/PeanoCurve.lean`, `Counterexamples/TopologistsSineCurve.lean`, Tau Ceti `LocallyConnected.lean`, `UniformlyLocallyConnected.lean`), none shared beyond a standard statement of nine words and forced formulas; largest share Calegari, 5 of 5 locators; its text and its table of contents could not be read, so wording and arrangement were not compared with it.

Research link: Peano continua and Hahn–Mazurkiewicz are the first items of the continuum-theory programme (Moore's decomposition theorem, the Kline sphere characterisation proved by Bing) that the PlanarTopology roadmap's README sketches after Cannon, *Topology as Fluid Geometry*, vol. 2; this rests on that README, not on this roadmap's own sources.

## Not verifiable

- Calegari, *Topics in point set topology* (version of March 7, 2025): Proposition 2.5 (1.1), Lemma 3.5, Propositions 3.6 and 3.8 and Definition 3.7 (2.1), Theorem 3.2 and its proof (3.1, 3.2). The sources service refused the URL the README gives, since it does not name the author; no other legal copy was sought. The seeded sample's locators for 1.1, 2.1, 3.1 and 3.2 are therefore unchecked; 1.2, 1.3 and 4.1 cite no source.
- Ownership against open pull requests was checked for the roadmaps whose files were available and by a search of all open heads for the objects; none owns them.

## Source issues

- none

## For the human reviewers

- **Scope.** The README's only cited text is unpublished lecture notes of one author (Calegari, References, README line 453); no refereed source is cited for any target. The subject, Hahn–Mazurkiewicz and Peano continua, is classical.
- **Licence.** The notes are at a university user page (README line 454) that the sources service could not classify as the author's own; the text was not fetched.
- **Not tested.** Calegari holds 5 of 5 source locators; neither its text nor its table of contents was read, so the wording and arrangement comparisons were not made against it.
