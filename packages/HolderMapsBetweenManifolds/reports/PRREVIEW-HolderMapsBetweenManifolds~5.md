# Review of HolderMapsBetweenManifolds (pull request #3015 at b5192d1)

**Verdict:** accepted

**Summary.** Accepted: the two sentences changed since the last review (§3.3 on `k = 0`, §5.1 item 2 on "not onto") are now true as written, including in dimension zero and for `F = 0`, and the pull request's title and description agree with this head. There are no findings and no small corrections; three format notes remain (two carried over, one on the wording of the new example), none blocking. The human reviewers still have to decide about de la Llave–Obaya, the source with the most locators, of which no legal copy could be read.

## N01 — Most targets still carry no source locator

§§1.2 and 1.3, Layers 2 and 4, §§3.1–3.3 and §§5.1–5.3 cite no source. The References entry describes dLO §3 (interpolation) and §6 (examples of discontinuity), natural locators for §1.2 (line 163) and §4.3 (line 456); a textbook locator would suit the openness of diffeomorphisms in §4.2 (line 444).

## N02 — Layers 3–5 depend on all of Layer 2, which includes the comparisons of §2.2

Layer 2's *Needs:* line (lines 325–328) names HeegaardFloer §2.3 and PseudodifferentialOperators §5.4 for the comparisons of §2.2; the *Needs:* lines of Layers 3, 4 and 5 (lines 406, 499, 571) cite "Layer 2" as a whole, though none uses those comparisons. "Layer 2, without the comparisons of §2.2" would keep them from appearing to wait on those sections.

## N03 — The new example of §5.1 item 2 does not say that `z₀` lies in the chart's target

In §5.1 item 2 (lines 516–520) the point `z₀` is "interior to `Set.range I`" and `ψ` has "support in a small ball around `z₀`"; for the map to be "equal in a chart to" the formula and `0` elsewhere, `z₀` must also lie in that chart's target and the ball inside it. Such a point exists (the target is a nonempty relatively open subset of `Set.range I`, which is convex with nonempty interior), so nothing is false; "for `z₀` in the chart's target and interior to `Set.range I`" would say it.

## Previous findings

- C01 — repaired: "for nonempty `M` of positive dimension and `F ≠ 0` it is not onto" (§5.1 item 2, line 516) and "For `k = 0` and `0 < α < 1` the set need not be closed under composition: on the circle, …" (§3.3, line 368).
- N01 — not repaired: "this is Mathlib's `HolderOnWith.interpolate` applied to the `α`-Hölder bound" (§1.2, line 164) still carries no source locator. Carried over as N01.
- N02 — not repaired: "*Needs:* Layer 2; §1.3; Mathlib `Diffeomorph`" (line 406). Carried over as N02.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §3.3, `k = 0`, `0 < α < 1`: the set need not be closed under composition | circle, `f = sign(x)\|x\|^α` on `[-δ, δ]`, smooth with `f' > 0` elsewhere; `α = 1/2` | `f⁻¹ = sign(y)\|y\|^{1/α}`, Lipschitz near `0`, so `α`-Hölder; `f∘f = sign(x)\|x\|^{α²}` for `\|x\| ≤ δ^{1/α}`; quotient `\|h\|^{α²−α} → ∞` (`\|h\|^{-1/4}`) | True; `M` a point: one-element group, closed, consistent with "need not" |
| §5.1 item 2: `C^{k+1}_A → C^{k,1}_A` not onto for nonempty `M`, `dim > 0`, `F ≠ 0` | `g(t) = t^k\|t\|`; `k = 0, 1`; `M` a point; `F = 0`; `E = 0` | `g^{(k)}(t) = (k+1)!\|t\|`: Lipschitz constant `(k+1)!`, one-sided derivatives `±(k+1)!` at `0`. `k = 0`: `\|ℓ(z−z₀)\|v`; `k = 1`: the `x\|x\|` of §2.5. Point or `F = 0`: both spaces equal, identity onto; `E = 0` has no `ℓ ≠ 0` | True with the stated hypotheses, each needed |
| §5.1 item 2, existence of `z₀` | chart target against `interior (range I)` | Target nonempty, relatively open in `range I`; `range I` convex with nonempty interior, so its interior is dense in it and meets the target | Exists (N03 on wording) |
| §3.3 `coe_holderDiff` (cites the changed sentence) | `k = 0` example above against the hypothesis `1 ≤ k` | Generated subgroup contains `f∘f`, of exponent `α² < α`: not in the generating set | `1 ≤ k` needed and stated in README and Lean |

The rows for the untouched statements stand as in the previous review, of `1db4050`.

- Changed passages: 2 (README §3.3 line 368–370, §5.1 item 2 lines 516–520); no Lean statement, heading, layer or supplier changed; nothing changed outside the folder.
- Library declarations opened at the pin, Mathlib: `ModelWithCorners.convex_range'` and `nonempty_interior'` (`Geometry/Manifold/IsManifold/Basic.lean:171`, `:177`), `ModelWithCorners.nonempty_interior` (`:294`).
- Source locators: the changed passages cite no source; the seeded sample falls outside them (it stands as in the previous review: 4 of 4 DKRH locators read, 0 of 5 dLO).
- Cross-roadmap citations: the changed passages add none; the six supplier roadmaps the description calls "all on main" (PDE, HeegaardFloer, PseudodifferentialOperators, GeometricTopology, SmoothBundlesConnections, ComplexHessianEquations) each have a folder on main.
- Dependency check: `depcheck: 132 roadmaps, 1466 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` gives 12 `sorry` warnings and nothing else; the file is unchanged since `1db4050`, so the `#check` comparison and the one-tactic probe of the previous review stand. All automatic checks pass on this head.
- Pull request text: title and description read sentence by sentence against the head: it adds a new roadmap (not on main); the five layer bullets, the supplier paragraph, the list of 12 theorems and 9 definitions of `Suggested.lean`, the not-statable paragraph, the dLO/DKRH locator note and topic `math.DS` all match. The summary block's "nonempty boundaryless manifolds of positive dimension" matches §4.3. No correction.

Overlap check: read HyperbolicDynamicsAndThermodynamicFormalism, ComplexManifolds, ManifoldOptimization, LorentzianGeometry, SobolevMapsBetweenManifolds, MorseTheory, RiemannianManifoldsWithConvexBoundary (as in the previous review; the change touches no owned object); nothing newly shared. Shared objects, each cited with its owner: real `C^k` spaces (HeegaardFloer §2.3), bundle `C^{k,α}` norms (PseudodifferentialOperators §5.4), Hölder compactness on compact complex manifolds (ComplexHessianEquations §5.2), Euclidean Hölder spaces of real functions (PDE §1.7).

Source independence: changed passages only: 2 passages compared with 1 source (DKRH), none shared (neither example occurs there); largest share dLO, 5 of 9 locators, whose text and table of contents could not be read; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: Layer 3's `C^{1+α}` diffeomorphisms, §3.4's estimate (DKRH (2.2)) and §5.4's smoothing (DKRH Lemma B.1) are inputs to Dolgopyat, Kanigowski and Rodriguez Hertz, *Exponential mixing implies Bernoulli* (2024); Layer 4 rests on de la Llave and Obaya (1999). Rests on the README and DKRH lines 12–31, 417–421, 2482–2499.

## Not verifiable

- dLO, the five §4 and §6 locators of §1.1: no legal copy was found (the DOI's landing page and the mp_arc preprint archive are on hosts in no licence class). Unchanged text; the statements were checked by computation in the previous review.

## Source issues

- none

## For the human reviewers

- **Not tested.** dLO has the largest share of locators, 5 of 9, all in §1.1 of `TauCetiRoadmap/HolderMapsBetweenManifolds/README.md`. Its text and table of contents could not be read, so wording and arrangement were not compared with it.
- **Licence.** Is the mp_arc preprint archive (`web.ma.utexas.edu`, preprint 98-11) an open repository from which dLO may be read? If so, the five dLO locators can be checked.
