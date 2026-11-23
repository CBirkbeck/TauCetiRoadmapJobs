# Review of RealFunctionsDerivativesAndVariation (pull request #2971 at b0fe75e)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review, the false sentence in the proof route of the Denjoy–Young–Saks theorem (§3.2), is repaired, and so are both small corrections; the three rewritten passages were recomputed and are true, and the repairs introduced no new problem. One format note remains, not blocking. As before, none of the cited books could be read legally, so no locator is verified; that, the licence of the prior formalization and the scope are left to the human reviewers.

## N01 — The failure of normality in §7.3 still has a proof route and no locator

Every other headline of §7.3 carries a locator (line 647); a reference for the non-normality of the density topology would complete the list.

## Previous findings

- R01 — repaired: "an upper Dini derivative `< +∞` on one side strictly above the lower one on the other side (the set where `D⁺f < +∞` and `D₋f < D⁺f`, and its three images under `f ↦ -f` and `x ↦ -x`)".
- C01 — repaired: "applied to `g t = f t + ε t` … Choose a level `y₀` strictly between `g x₂` and `g x₁`, outside the countable image `g(s)`".
- C02 — repaired: "not a target here: it follows from Mathlib's Jordan decomposition and Mathlib's continuity of the variation function at points of continuity, both in `Mathlib/Topology/EMetricSpace/VariationOnFromTo.lean`"; both are there at the pin.
- N01 — not repaired: "**Failure of normality** (`not_normalSpace_densityTopology`): the density topology is not normal." with no locator; written again as N01 above.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.2 route: `{D⁺f < +∞, D₋f < D⁺f}` and its three images are null | each of the four alternatives of `ae_dini_alternatives`; images `-f`, `f(-x)`, `-f(-x)`; the tent function on a fat Cantor set | alt. 1, 2: `D₋ = D⁺`; alt. 3, 4: `D⁺ = +∞`. Images: `{D₊ > -∞, D₊ < D⁻}`, `{D₋ > -∞, D₋ < D⁺}`, `{D⁻ < +∞, D₊ < D⁻}`, each empty on all four alternatives; tents: `D⁻ = 0 = D₊` | true, consistent with the theorem | none |
| 2.2 route with `g = f + εt` | `x₁` an endpoint of `D`; `ε < (f x₁ − f x₂)/(x₂ − x₁)`; last point `t` | `g x₁ − g x₂ = f x₁ − f x₂ − ε(x₂ − x₁) > 0`; `g x₂ < y₀` so `t < x₂`, `g t = y₀ ∉ g(s)`; `t ∈ [x₁, x₂) ⊆ interior D`; `g < y₀` on `(t, x₂]` gives `D⁺g(t) ≤ 0`, `D⁺f(t) ≤ -ε` | true | none |
| Scope: continuous Jordan decomposition from Mathlib | the file at the pin | `exists_monotoneOn_sub_monotoneOn'` (line 378) takes `p = (V + f)/2`, `q = (V − f)/2`; `continuousWithinAt_variationOnFromTo_iff` (line 351): `V` continuous where `f` is | pointer correct | none |

The rows of the previous review, of `c41aba9`, stand for every untouched statement; the diff changes no statement and no line of `Suggested.lean`.

- Source locators checked against the text: 0; the two changed routes cite Bruckner, Chapter XI, Theorem 4.1, p. 189, and Thomson, §70, p. 166, neither readable.
- Library declarations opened at the pin: 4 (`Mathlib/Topology/EMetricSpace/VariationOnFromTo.lean` lines 351, 359, 378, 404).
- Cross-roadmap citations: none added or changed; none found unresolved.
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: exit 0, 50 `sorry` warnings and no other; single `import Mathlib` plus one Tau Ceti module, no `set_option`; nothing changed outside the roadmap folder.
- Pull request text read against this head: no sentence contradicted; the change since `c41aba9` touches nothing the title or description states.

Overlap check: read NonabsoluteIntegration (open), GeometricMeasureTheory (main), YoungIntegrationAndRoughPaths and Isoperimetry (open), GaussianIsoperimetryAndClusters (main), as in the previous review; the change adds no object. NonabsoluteIntegration consumes the Dini derivatives and property (N) and names this roadmap as owner; density and Lebesgue's density theorem are owned by GeometricMeasureTheory G5 and cited here; nothing else shared.

Source independence: changed passages only; 3 passages compared with 0 sources, because none of the cited books could be read legally; largest share Bruckner, about 30 of 85 locators; its table of contents could not be read. No layer was added, removed or reordered.

Research link: Layers 1–4 and 7 are prerequisites of the descriptive theory of the Denjoy, Perron and Henstock–Kurzweil integrals, planned in the open roadmap NonabsoluteIntegration, which cites §§1.1, 3.1, 4.3; Layers 5 and 7 of the Zahorski classes (Bruckner, 1978, Chapter VI). Rests on the README and on that roadmap's text.

## Not verifiable

- Every locator into Bruckner, Thomson, Hewitt–Stromberg, Benedetto–Czaja, Kechris and Kharazishvili, including all fifteen sampled targets and the two locators of the changed routes: the texts are paywalled and not held locally.
- Every locator into Leoni, Bourbaki and Stein–Shakarchi: no legal copy found.
- The content of the proposed Mathlib file named under *From Mathlib*: it is not in the pinned Mathlib.

Automatic checks set aside as false positives: the report of a section comment with no declaration under it, for the closing block of `Suggested.lean`, which holds only `#check` lines pinning library declarations, as is allowed.

## Source issues

- none

## For the human reviewers

- **Not tested.** Bruckner, *Differentiation of Real Functions* (1978), has the largest share of the locators (about 30 of 85). Neither its text nor its table of contents could be read; wording and arrangement were compared with no source.
- **Licence.** README, *Prior formalization*: §§1.1, 2.1, 3.2, 5.1, 7.1 start from the author's Lean project CKMA (github.com/bjbraams/lean-CKMA, Apache 2.0 by the README's statement). `Suggested.lean` was not compared with its files.
- **Scope.** The sources are textbooks and monographs of 1975–2017 on classical real analysis; the only consumer found is the open roadmap NonabsoluteIntegration, by the same author.
