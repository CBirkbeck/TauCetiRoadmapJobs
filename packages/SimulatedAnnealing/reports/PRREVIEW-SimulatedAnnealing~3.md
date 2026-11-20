# Review of SimulatedAnnealing (pull request #2709 at 90371a5)

**Verdict:** accepted

**Summary.** Accepted, on an incremental re-review of the 44 lines changed since `b836781`: both small corrections of the previous review are repaired. Layer 1, the overview and the scope section now take Dobrushin's coefficient from MarkovChainMixing 1.2 and state what this roadmap adds to it, and the pull-request description agrees with the head. No mathematical error was found in the changed passages, and the repair introduced no new problem. One format note remains (line lengths), not blocking. The two cited sources still could not be read from a legal place, which is left to the human reviewers as before.

## N01 — Four lines are longer than 100 characters

Line 10 of `Suggested.lean` (111 characters, as noted before) and lines 36, 411 and 490 of the README (106, 101 and 120 characters; lines 36 and 490 are the sentences inserted by this change into the overview and the scope section). Rewrap the three paragraphs.

## Previous findings

- C01 — repaired: "The coefficient is not a new object: `dobrushinCoeff κ` … is the name used here for `tvBetweenStarts κ 1` of MarkovChainMixing 1.2"; the range is no longer a target; `*Needs:*`, Dependencies, scope and overview name the supplier.
- C02 — repaired: the description now says "its 7 definitions have real bodies", "MarkovChainMixing 1.2 … supplies `d̄`", "Mathlib's `Measure.tilted` supplies the Gibbs measure" and "the upper bound on the coefficient of a block".
- N01 — not repaired: line 10 of `Suggested.lean` is unchanged, 111 characters (N01 above, a format note).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 "`δ(κ)` is `tvBetweenStarts κ 1`, the maximum over pairs of `tvDist (κ x) (κ y) / 2`" | probe equality on a copy of the file; two-state `p = 3/10`, `q = 1/10`; identity; one state | probe closes by `simp [tvBetweenStarts]`; rows `(7/10, 3/10)`, `(1/10, 9/10)` at distance `3/5`, the supplier's Check `d̄(1) = 3/5`; `1`; `0` | same object | none |
| 1.1 facts imported at `t = 1`: range `[0, 1]`, supremum over initial laws | supplier's first bullet of 1.2 read at its open head; identity and constant kernels on two states | supplier states both for every `t`; identity: supremum of `‖μ − ν‖` is `1 = δ`; constant: `μκ = νκ`, supremum `0 = δ` | imported as stated there | none |
| 1.2 "sharpens the supremum characterization … carries the factor `‖μ − ν‖`" | two-state kernel above, `μ` uniform, `ν = δ_a`; point masses at `a`, `b` | `‖μ − ν‖ = 1/2`, `μκ − νκ = (κ_b − κ_a)/2`, distance `3/10 = 3/5 · 1/2`; supremum bound alone gives `3/5`; point masses: both sides `3/5` | true; strictly stronger; `simp` does not close the theorem | none |
| 1.3 "`d̄(s + t) ≤ d̄(s) d̄(t)` is the case `κ^s`, `κ^t`" | supplier's `tvBetweenStarts_add_le`; `s = t = 1` on the two-state kernel; the README's three-state pair `κ ≠ η` | `κ^(s+t) = κ^t ∘ₖ κ^s`, so `d̄(s+t) = δ(κ^t ∘ₖ κ^s) ≤ δ(κ^s) δ(κ^t)`; `9/25 = (3/5)²`; `δ(κ) = δ(η) = 1`, all rows of `κη` equal `δ_(x₃)`, `δ(κη) = 0` | supplier's statement is the homogeneous case; 1.3 not stated there | none |
| Scope: "that roadmap owns it, with its range, its characterization … and its submultiplicativity along the powers of one kernel" | supplier's 1.2 and its scope section at its open head; search of all open heads and main for the coefficient and for inhomogeneous chains | supplier's scope lists "the distances `d` and `d̄`"; its 1.2 has the three facts; no other roadmap states the coefficient, the two-kernel inequality or weak ergodicity | one owner for each object | none |

The diff changes no Lean statement. The rows for the untouched statements (2.1–2.3, 3.1–3.3, 4.1–4.3, the Summary headlines) stand as in the previous review, of `b836781`.

- Source locators checked against the text: 0. The diff adds or changes no source locator; the locators of the sampled targets 1.1–4.3 are all into the two texts that could not be read (below).
- Library declarations opened at the pin: none new; the changed passages cite only `tvDist`, `tvDist_triangle`, `tvDist_comm`, checked in the earlier reviews, and the probe used the `Kernel` monoid power (`κ ^ 1 = κ` by `simp`).
- Cross-roadmap citations resolved: MarkovChainMixing 1.2 at its open head (README lines 102–131: definition, range, supremum characterization, `d̄(s + t) ≤ d̄(s) d̄(t)`; `Suggested.lean` lines 48–62: `tvBetweenStarts` identical to lines 30–31 here, `tvBetweenStarts_add_le`); that roadmap does not cite this one. MarkovChainsAndRenewal 3.5 unchanged.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed; no file changed outside the folder. Elaboration: `Suggested.lean` elaborates with 8 `sorry` warnings and nothing else (file unchanged since the previous review).
- Padding probe: `tvDist_bind_le_dobrushinCoeff_mul` is not closed by `simp [tvBetweenStarts]`; nothing else was added.
- Pull-request text: title and description read against the head; no sentence contradicted, the supplier MarkovChainMixing and the copied definition are stated.

Overlap check: read MarkovChainMixing, MCMCAsymptoticVariance, LogSobolevForMarkovChains, LangevinAndHamiltonianMonteCarlo, MarkovChainsAndRenewal, MathematicalStatisticsFoundations; `d̄`, and so `δ(κ) = d̄(1)`, is owned by MarkovChainMixing 1.2 and cited in Layer 1, the scope section and the contracts; the Metropolis–Hastings kernel by MathematicalStatisticsFoundations 9.4 and the total variation formula by MarkovChainsAndRenewal 3.5, both cited; nothing else shared.

Source independence: changed passages only: 6 passages compared with 0 outside sources (the changed passages cite MarkovChainMixing and Mathlib only, and are not that roadmap's sentences; neither source text could be read); largest share Mitra–Romeo–Sangiovanni-Vincentelli, 14 of 15 locators; contents not compared again, the change adding, removing or reordering no layer, and the table of contents unread.

Research link: the headline 4.3 is the convergence theorem of Mitra–Romeo–Sangiovanni-Vincentelli (1985/1986) for logarithmic cooling, after Geman–Geman (1984), sharpened by Hajek (1988); Layers 1–2 are Dobrushin's (1956) and Isaacson–Madsen's (1976) theory of inhomogeneous chains. Rests on the README's references, not on a text read.

## Not verifiable

- Mitra–Romeo–Sangiovanni-Vincentelli, Memorandum UCB/ERL M85/23: all 14 locators, as in the previous reviews; the sources service again found only a publisher's landing page. None of them is in a changed sentence.
- Polyanskiy–Wu, Theorem 33.4, p. 630: as in the previous reviews; the service again found only the publisher's page. Not in a changed sentence.

## Source issues

- none

## For the human reviewers

- **Not tested.** The memorandum of Mitra, Romeo and Sangiovanni-Vincentelli carries 14 of the README's 15 locators and could not be read: wording, arrangement and every locator are unchecked against it.
- **Licence.** The README cites the memorandum as open on the Berkeley department's technical-report pages and Polyanskiy–Wu as open on the first author's pages (README, References); neither host could be classified here.
- **Scope.** The main source is a 1985 technical report; the README gives its published form as Advances in Applied Probability 18 (1986), 747–771, whose numbering it does not use.
- **Merge order.** This roadmap depends on MarkovChainMixing, still an open pull request by the same author and not yet in the merge order; `Suggested.lean` carries a copy of its definition `tvBetweenStarts` (lines 28–31) because that file cannot be imported.
