# Review of IlluminationAndCoveringByHomothets (pull request #3190 at f265608)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired, and the rewritten routes of 1.2, 4.1 and 4.2 are correct (each step was recomputed, and each was read again beside the Aiger–Har-Peled–Žužić preprint: none follows its proofs any more). The two small corrections and the format note are also repaired; this review adds no remark. The three questions for the human reviewers stand (the weight of an unrefereed preprint among the sources, its licence, and the Lean development that accompanies it).

## Previous findings

- R01 — repaired: 1.2 (3 ⇒ 2) now uses the increasing open sets `V t` and no gauge; (4 ⇒ 3) a finite subcover by the sets `V u s` and its least `s₀`; 4.1 the closure–interior identity; 4.2 the inclusion `yⱼ ∈ (y₁ − c) +ᵥ G • K`.
- C01 — repaired: the second Check of 2.3 reads "`HasUniqueSupportAt K x` holds at every `x ∈ K`".
- C02 — repaired: 1.1 reads "the criterion is used in the proof of Glazyrin, Lemma 2.1, p. 5", which is where it stands (Gla19 lines 236–241).
- N01 — repaired: Scope and ownership reads "A 2026 preprint of Aiger, Har-Peled and Žužić".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.2, route (3 ⇒ 2) | `K = [0,1]`, `p = 1/2`, `w = ∓0.1`; monotonicity; the final inclusion | `V t = (1/2 − t/2, 1/2 + t/2)`; translates cover iff `t > 0.8`; at `t = 0.9`: `[−0.05, 0.85] ∪ [0.15, 1.05] ⊇ [0,1]`; `w + V t = (w + (1−t)p) + t • interior K` | route sound | none |
| 1.2, route (4 ⇒ 3) | `[0,1]²` with `U = (±1, ±1)`; weights; `U = ∅` | `V u s = (−s, 1−s)²` for `u = (1,1)`; centre lies in `V u s` only for `s < 1/2`, so `s₀ < 1/2`; at `s₀ = 1/4` the four open squares cover; weights `1 − s₀/s ≥ 0`, `s₀/s > 0` | route sound | none |
| 4.1, key identity and equivalence | unit disc, `π (a,b) = b`; segment `{0} × [−1,1]`; `w = 0` | `A = (−1,1)`, `closure A = [−1,1] = π '' K`, interior `= A`; segment: `A = ∅`, the nonemptiness step fails as the Check says; `w = 0`: line is `{x}`, both sides false | as stated | none |
| 4.2, Helly step | triangle path of the Check; `G = 0`; slack `lam − G` | `p = (0,0),(0,0),(1,0)`, `q = (1,0),(0,1),(0,1)`, `g = 1/4` each, `c = (1/4, 0)`, `G = 3/4`; `yⱼ + (1/4,0)` has coordinate sums `1/4, 1/2, 3/4, 3/4 ≤ 3/4`; weights `G + (lam − G) = lam` | as stated | none |
| 1.1, locator sentence | Glazyrin, proof of Lemma 2.1 | the lemma is about the nonnegative cone (lines 230–232); the criterion `u · n_x > 0` is in its proof (lines 236–241) | sentence true | none |
| 2.3, second Check | `x = 2e₁ ∉ K` against `x ∈ K` | off `K` two non-proportional functionals (maxima `1` and `√(1 + 1/400)`, both `≤ 2`); on `K` the maximiser `A²y/‖Ay‖` determines `y` up to a positive factor | Check true as now worded | none |

The rows for the untouched statements stand as in the previous review, of `94e67a2`.

- Source locators checked against the text: 1 (Gla19, proof of Lemma 2.1, p. 5), and the four rewritten passages read again beside AHŽ26 lines 306–330, 406–448 and 471–482.
- Library declarations opened at the pin: 8, all present with the hypotheses the routes use: `Convex.combo_closure_interior_mem_interior` (line 131), `Convex.interior` (210), `Convex.closure_interior_eq_closure_of_nonempty_interior` (279), `Convex.interior_closure_eq_interior_of_nonempty_interior` (285), all in `Mathlib/Analysis/Convex/Topology.lean`; `Convex.linear_image` (`Mathlib/Analysis/Convex/Basic.lean`, 177); `image_closure_subset_closure_image` (`Mathlib/Topology/Continuous.lean`, 213); `IsCompact.elim_finite_subcover` (`Mathlib/Topology/Compactness/Compact.lean`, 208); `IsCompact.exists_isMaxOn` is still used by 2.3.
- The names dropped from the needs of 1.2 (`continuous_gauge`, `interior_subset_gauge_lt_one`, the Tau Ceti gauge lemma) occur in no other route; the Tau Ceti gauge lemma remains a supplier of 4.2 only, as the contracts now say.
- Cross-roadmap citations: none in the changed passages.
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `TauCetiRoadmap/IlluminationAndCoveringByHomothets/Suggested.lean` (unchanged since `94e67a2`): 11 `sorry` warnings and nothing else.
- The automatic checks all passed on this head. The title and description still describe the head (the change touches only routes, two sentences of commentary and the needs lines).

Overlap check: read MeanWidthAndCauchyFormulas, SuccessiveMinima (the third list is empty); nothing shared.

Source independence: changed passages only; 4 passages compared with 1 source (AHŽ26), none shared and none following its proofs; largest share AHŽ26, 7 of 14 locators; no layer added, removed or reordered, so the arrangement stands as compared before: independent.

Research link: The Levi–Hadwiger covering conjecture and Boltyanski's illumination problem (Levi 1955, Boltyanski 1960; survey of Bezdek and Khan 2018; Glazyrin 2022; Prymak 2023 for `ℝ³`). Layer 4 generalises two lemmas of the Aiger–Har-Peled–Žužić 2026 preprint. Rests on the README's references and the four texts read.

## Not verifiable

- Levi 1955 and Boltyanski–Martini–Soltan 1997: not read; the README cites both bibliographically, through the sources read, with no locator of its own.
- The Lean development that accompanies AHŽ26 as an ancillary file: not opened, so the statement that no name or definition is taken from it was not tested.

## Source issues

- none

## For the human reviewers

- **Scope.** Half of the locators (7 of 14) go to AHŽ26, an arXiv preprint dated 25 November 2026, unrefereed, whose authors state its proof was found by an AI system; Layer 4 generalises its Lemmas 3.4 and 4.1. Layers 1–3 and 5 are classical.
- **Licence.** The licence under which AHŽ26 is posted was not established; the four routes that tracked its proofs are rewritten at this head.
- **Licence.** The Lean development accompanying AHŽ26 was not opened; `Suggested.lean` was not compared with it. The description says nothing is taken from it.
