# Review of HolderMapsBetweenManifolds (pull request #3015 at 6c5a9ef)

**Verdict:** accepted

**Summary.** Accepted: the 27 lines changed since the last review add locators to §§1.2, 4.2 and 4.3, narrow three *Needs:* lines and place the point `z₀` of §5.1 item 2 in the chart's target, and each new sentence is true as written. There are no findings; one small correction (a sentence of the description that §4.2's new citation makes out of date) and one format note, neither blocking. The human reviewers still have to decide about de la Llave–Obaya, the source with the most locators, of which no legal copy could be read; the new Hirsch citation is paywalled and was not read either.

## C01 — The description still says that §4.2 carries no citation

The description's sentence "The openness of diffeomorphisms (§4.2) and the continuity of inversion in the lower Hölder topology (§4.4) carry proof outlines rather than citations" is contradicted by this head: §4.2 (README lines 455–457) now cites Hirsch, *Differential Topology*, Chapter 2, and References has a Hirsch entry (lines 702–704). The same paragraph lists the sources as dLO and DKRH only. Text that would be right: "The openness of diffeomorphisms (§4.2) carries a proof outline and cites Hirsch, *Differential Topology*, Chapter 2, for the `C^1` statement; the continuity of inversion in the lower Hölder topology (§4.4) carries a proof outline rather than a citation."

## N01 — Several targets still carry no source locator

§1.3, Layer 2, §§3.1–3.3, §§4.1 and 4.4 and §§5.1–5.3 cite no source (the three locators suggested earlier, for §§1.2, 4.2 and 4.3, are now there). The Hirsch citation of §4.2 is by chapter; a theorem number would let a reader find the statement.

## Questions for the author

- Is the openness statement cited in §4.2 Hirsch's Theorem 1.6 of Chapter 2, §1? I recall that number but could not read the book (Springer, paywalled), so I do not ask for it.

## Previous findings

- N01 — partly repaired: "(interpolation of Hölder norms, dLO §3)" (§1.2, line 166), "The `C^1` statement is in Hirsch, *Differential Topology*, Chapter 2" (§4.2, line 455), "among the examples of dLO §6" (§4.3, line 471); other targets still have none. Carried over as N01.
- N02 — repaired: "*Needs:* Layer 2, without the comparisons of §2.2" (line 407), "Layers 1–3 (Layer 2 without the comparisons of §2.2)" (line 503), "with the finite-atlas spaces of §2.2 and without its comparisons" (line 578).
- N03 — repaired: "for `z₀` in the chart's target and interior to `Set.range I` (such points exist, the target being a nonempty relatively open subset of the convex set `Set.range I`, which has nonempty interior)" (§5.1 item 2, lines 523–525).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §1.2 interpolation `[v]_β ≤ 2^{1−θ} S^{1−θ} [v]_α^θ`, `θ = β/α` (locator added) | general `v`, `S = sup‖v‖`, `H = [v]_α`; `v = \|x\|^α` on `[-1,1]`, `α = 1`, `β = 1/2` | `‖Δv‖ = ‖Δv‖^{1−θ}‖Δv‖^θ ≤ (2S)^{1−θ}(H d^α)^θ = (2S)^{1−θ}H^θ d^β`. Example: left `[\|x\|]_{1/2} = 1` (points `0`, `1`), right `√2·1·1 = √2` | True |
| §4.3 `[D^k(f∘φ_t − f)]_α ≥ 2ε` for small `t` (locator added) | `D^k ξ₁ = \|x₁\|^α` near the point, `φ_t` translation by `t e₁`; points `x₁ = 0` and `x₁ = −t` | difference `ε(\|x₁+t\|^α − \|x₁\|^α)`: at `0` it is `εt^α`, at `−t` it is `−εt^α`; quotient `2εt^α / t^α = 2ε` | True; `φ_t` is the inner factor, as the new clause says |
| §4.2 `C^1` diffeomorphisms open in the weak `C^1` topology, `M`, `N` compact boundaryless (citation added) | `M` compact: weak against strong topology; `M = N = S¹`, `h = id`, `g = id + εsin` | compact `M`: one compact set covers `M`, so strong neighbourhoods are weak ones. `g' = 1 + εcos ≥ 1 − ε > 0` for `ε < 1`: degree-one immersion, a diffeomorphism | Consistent with the cited statement; Hirsch itself not read |
| §5.1 item 2, `z₀` in the chart's target and interior to `range I`, ball inside the target | target `T` relatively open in `range I`; half-space model, chart at a boundary point | `interior(range I)` dense in the convex `range I`, so meets `T`; at such `z₀` a small ball lies in `interior(range I) ∩ T`. Half-space: `T ∋ 0`, `z₀ = (δ,0,…)`, radius `< δ` | Exists; the support stays in the target |
| *Needs:* lines of Layers 3–5 without the comparisons of §2.2 | every mention of HeegaardFloer §2.3 and PseudodifferentialOperators §5.4 in the README | they occur in §2.2 (lines 283–285), Layer 2's *Needs:* (328–329), scope and supplier contracts (612–667); none in a statement or route of Layers 3–5 | True |

The rows for the untouched statements stand as in the previous review, of `b5192d1`.

- Changed passages: 7 (§1.2 line 166; *Needs:* lines 407, 503, 578; §4.2 lines 455–457; §4.3 lines 470–471; §5.1 item 2 lines 523–526; References lines 702–704). No Lean statement, heading, layer or supplier changed; nothing changed outside the folder.
- Source locators: 3 added (dLO §3, dLO §6, Hirsch Ch. 2); 0 read against the text (both sources unreadable legally, see below). The new dLO locators agree with the References entry's own description of §3 (interpolation) and §6 (examples of discontinuity). The seeded sample falls on these passages only at §4.2; elsewhere it stands as in the previous review (4 of 4 DKRH locators read, 0 of dLO).
- Library declarations: the changed passages name none newly; `Suggested.lean` is unchanged since `1db4050`, so the `#check` comparison and the one-tactic probe of the earlier review stand.
- Cross-roadmap citations: none added; the tools' resolution of the README's cross-roadmap citations finds all of them. The three Lean names it reports as found nowhere are this roadmap's own declarations in `Suggested.lean`.
- Dependency check: `depcheck: 124 roadmaps, 1405 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/HolderMapsBetweenManifolds/Suggested.lean` gives 12 `sorry` warnings and nothing else. All automatic checks pass on this head.
- Pull request text: read against the head; one sentence out of date (C01); the rest (new roadmap, five layer bullets, suppliers, the 12 theorems and 9 definitions, the not-statable paragraph) matches.

Overlap check: read HyperbolicDynamicsAndThermodynamicFormalism, ManifoldOptimization, LorentzianGeometry, DifferentialGeometry, SobolevMapsBetweenManifolds, MorseTheory, RiemannianManifoldsWithConvexBoundary (scopes as in the previous reviews; the change touches no owned object and the overlap report lists no dropped id, no second copy and no other pull request changing this roadmap); nothing newly shared. Shared objects, each cited with its owner: real `C^k` spaces (HeegaardFloer §2.3), bundle `C^{k,α}` norms (PseudodifferentialOperators §5.4), Hölder compactness on compact complex manifolds (ComplexHessianEquations §5.2), Euclidean Hölder spaces of real functions (PDE §1.7).

Source independence: changed passages only: 7 passages; the two sources they cite (dLO, Hirsch) could not be read, so they were compared with DKRH alone (1 source), none shared (DKRH has no interpolation statement beyond a footnote at line 47 and no openness statement); largest share dLO, 7 of 12 locators, whose text and table of contents could not be read; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: Layer 3's `C^{1+α}` diffeomorphisms, §3.4's estimate (DKRH (2.2)) and §5.4's smoothing (DKRH Lemma B.1) are inputs to Dolgopyat, Kanigowski and Rodriguez Hertz, *Exponential mixing implies Bernoulli* (2024); Layer 4 rests on de la Llave and Obaya (1999). Rests on the README and DKRH lines 12–31, 417–421, 2482–2499.

## Not verifiable

- dLO §3 (§1.2) and dLO §6 (§4.3), with the five earlier §4 and §6 locators of §1.1: no legal copy (the DOI's landing page is on a host in no licence class; the mp_arc preprint archive likewise). The two statements were checked by computation.
- Hirsch, Chapter 2 (§4.2): the DOI resolves only to the paywalled Springer page and no cached text restates the theorem with its number; the statement is the standard one and §4.2 gives its own proof outline.

## Source issues

- none

## For the human reviewers

- **Not tested.** dLO has the largest share of locators, 7 of 12 (§§1.1, 1.2, 4.3 of `TauCetiRoadmap/HolderMapsBetweenManifolds/README.md`). Its text and table of contents could not be read, so wording and arrangement were not compared with it.
- **Licence.** Is the mp_arc preprint archive (`web.ma.utexas.edu`, preprint 98-11) an open repository from which dLO may be read? If so, the seven dLO locators can be checked.
