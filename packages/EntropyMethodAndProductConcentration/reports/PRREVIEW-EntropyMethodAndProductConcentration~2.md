# Review of EntropyMethodAndProductConcentration (pull request #3057 at 67e3431)

**Verdict:** accepted

**Summary.** Accepted: both findings of the previous review are repaired, and the repairs are correct. The route of 4.4 now uses `f(t) = t/(1 - a t/2)`, for which the hypothesis of the comparison lemma does follow, step 7 of 6.3 no longer carries the factor `v/2` twice, and 7.2 and the scope section name SeriesOfIndependentRandomVariables §2.2 as the owner of the real-valued Lévy inequalities. There are no small corrections and no format notes. For the humans, as before: Boucheron–Lugosi–Massart and four of the other five books could not be read legally, so most page locators remain unchecked.

## Previous findings

- R01 — repaired: 4.4 reads "Take `f(t) = t/(1 - a t/2)` on `(0, 2/a)` … 2.3 with `g = v/2` gives `ψ(t) ≤ f(t) v t/2`"; step 7 of 6.3 reads "`G(t) ≤ f(t) ∫₀^t g` … `(v/2)(2 f(t) - t) = v φ(t)`". Both recomputed.
- R02 — repaired: 7.2 reads "With `E = ℝ` the first inequality is the case `t ≥ 0` of Lévy's inequality in SeriesOfIndependentRandomVariables §2.2, which owns the real case and its signed form"; the scope section and the description say the same.

The small corrections and format notes of the previous review: C01 (file paths absent from the pinned Tau Ceti) repaired, the paths are removed and the eight that remain in the supplier contracts exist at the pin; C02 (standard Borel chain rule in the route of 3.2) repaired, the route now uses Fubini and the chain rule is listed for 5.2 only, where the coordinates are standard Borel; C03 (attribution of `freedman`) repaired, the docstring cites Bercu–Delyon–Rio Theorem 3.10, (3.31), as 7.1 does; N02 and N03 repaired (the docstring names the one unstated headline and its missing carrier; the three one-variable inequalities are marked auxiliary). N01 is withdrawn: `public import Mathlib` under `module` is the form of 140 roadmaps on main.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 4.4 route, `f = t/(1 - a t/2)` | `f'/f`; hypothesis of 2.3; `Bin(10, 0.1)`, `a = 1`, `b = 0`, `t ∈ {0.1, 0.5, 1, 1.5, 1.9}`; limit at `0⁺` | `f'/f = 1/(t(1 - a t/2))`; `f ψ' - f' ψ ≤ f² v/2`: `0.0047 ≤ 0.0055`, `0.137 ≤ 0.222`, `0.297 ≤ 2`; `ψ/f → ψ'(0) = 0` | true | none |
| 4.4 new Checks | `ψ(t) = 10 log(0.9 + 0.1 e^t) - t`; bound `t²/(2(1 - t/2))`; old `f = t - a t²/2` | `ψ(1) = 0.58565`, `ψ(1.5) = 1.48747`; bounds `1`, `4.5`; extra term `a t ψ = 0.5857` at `t = 1` | true | none |
| 6.3 step 7 | `f = φ + t/2`; `g(0)`; `∫₀^t g`; `n = 1`, `t = 1/2` | `(t f' - f)/f² → 2`, so `g(0) = v`; `∫ = (v/2)(2 - t/f)`; `f ∫ g = v φ`; `0.0744 < 0.1201 ≤ 0.1487` | true | none |
| 3.2 route by Fubini | `g = dQ/dP`, `gᵢ = ∫ g dPᵢ`; integrability of `gᵢ log gᵢ`; `n = 1` | `∫ Entᵢ(g) dP = ∫ g log g dP - ∫ gᵢ log gᵢ dP = D(Q‖P) - D(Q⁽ⁱ⁾‖P⁽ⁱ⁾)`; `-1/e ≤ gᵢ log gᵢ ≤ ∫ g log g dPᵢ`; `0 ≤ 0` | true with no standard Borel hypothesis | none |
| 7.2 boundary with SeriesOfIndependentRandomVariables §2.2 | its `levy_symmetric` at the open head: real `X i`, `k ∈ [1, n]`, every real `a`, signed and absolute forms | with `E = ℝ`, `t ≥ 0`, the first conjunct of `levy` is its second conjunct (`k = 0` adds nothing: `‖S₀‖ = 0 ≤ t`); it has no bound for `max ‖X i‖` | boundary as stated | none |
| 7.1 `freedman` docstring | README 7.1 against the docstring and the Lean bound | both give `exp(-x²/(2(y + b x/3)))` and Bercu–Delyon–Rio Theorem 3.10, (3.31) | agree | none |

The rows for the statements the change does not touch stand as in the previous review, of `ffd3ac5`.

- Source locators checked against the text: 0 new (the changed passages cite Boucheron–Lugosi–Massart pp. 105, 350–351, Ledoux–Talagrand Proposition 2.3 and Bercu–Delyon–Rio Theorem 3.10, none readable).
- Library declarations and files opened at the pin: the eight Tau Ceti files named in the supplier contracts exist; `TauCeti.klDiv_eq_klDiv_fst_add_lintegral_condKernel` still resolves (`#check`).
- Cross-roadmap citations resolved: SeriesOfIndependentRandomVariables §2.2 and `levy_symmetric` at its open head; the citation resolver reports no cross-roadmap citation found nowhere.
- Dependency check: `depcheck: 129 roadmaps, 1436 edges, 0 problem(s)`; nothing changed outside the folder.
- Elaboration: `Suggested.lean` elaborates, `sorry` the only warning (45 declarations with `sorry`), no `set_option`. The change touches docstrings only, so no statement changed and the one-tactic probe of the previous review stands.
- Pull request text: the description states the Fubini route of 3.2, the chain rule used in 5.2 only, and the boundary with SeriesOfIndependentRandomVariables; nothing in it contradicts this head.

Overlap check: read LogConcaveFunctionalInequalities, PACBayesBounds, StatisticalLearningTheory, RandomMatrices, MathematicalStatisticsNonparametric, MathematicalStatisticsHighDimensional (as in the previous review) and SeriesOfIndependentRandomVariables at its open head; Lévy's inequality for real symmetric summands: SeriesOfIndependentRandomVariables §2.2, now named in 7.2 and in the scope section; the normed-group form and the bound for `max ‖X i‖`: this roadmap; the other shared objects as in the previous review.

Source independence: changed passages only; 4 changed passages (the routes of 3.2 and 4.4, step 7 of 6.3, the boundary sentence of 7.2) are computations written out in the roadmap's own terms and could not be set beside Boucheron–Lugosi–Massart, which remains unread; largest share Boucheron–Lugosi–Massart, about 60 of 100 page locators; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: Layers 3–6 state the entropy and transport methods (Ledoux 2001; Boucheron–Lugosi–Massart 2013; Marton's inequality) and reach Talagrand's convex distance inequality (Talagrand 1995) and Bousquet's inequality for suprema of empirical processes (Bousquet 2002), used in empirical-process and model-selection theory (Massart 2007); this rests on the README's references and on van Handel's notes.

## Not verifiable

- Boucheron–Lugosi–Massart 2013 (all locators, including the sampled 1.3, 1.4, 2.4, 3.2, 4.1, 4.2, 4.3, 4.5, 6.3 and pp. 105, 350–351 in the changed passages): no legal copy found.
- Ledoux 2001, Ledoux–Talagrand 1991 (Proposition 2.3 in 7.2), Massart 2007, Bercu–Delyon–Rio 2015 (Theorem 3.10 in 7.1): paywalled, as in the previous review.

Automatic checks set aside as false positives: the remark that a section comment in `Suggested.lean` has no declaration under it concerns the final block of `#check` lines that pin library declarations, which is what that heading is for.

## Source issues

- none

## For the human reviewers

- **Not tested.** Boucheron–Lugosi–Massart 2013 carries about 60 of the README's 100 page locators; neither its text nor its table of contents could be read, so wording and arrangement were not compared with it.
- **Not tested.** Ledoux 2001, Ledoux–Talagrand 1991, Massart 2007 and Bercu–Delyon–Rio 2015 could not be read; the theorems cited to them were recomputed, their locators were not checked.
- **Licence.** van Handel's *Probability in High Dimension* (README References) is an unpublished set of lecture notes read from the author's Princeton page; it is cited only beside published sources.
