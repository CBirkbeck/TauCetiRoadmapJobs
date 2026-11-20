# Review of SimulatedAnnealing (pull request #2709 at b836781)

**Verdict:** accepted

**Summary.** Accepted, on an incremental re-review of the 63 lines changed since `f3f4259`: the one finding of the previous review is settled in substance, since Dobrushin's coefficient is now MarkovChainMixing 1.2's `d̄` at time `1`, in `Suggested.lean` and in the supplier contracts, and the file elaborates with `sorry` as its only warning. No mathematical error was found in the changed passages. There are two small corrections (Layer 1 and the scope section still describe the coefficient as defined and owned here; the pull-request description is behind the head) and one format note, none blocking. The two cited sources still could not be read from a legal place, which is left to the human reviewers as before.

## C01 — Layer 1 and the scope section still say that the coefficient is defined and owned here, while the contracts and the Lean file take it from MarkovChainMixing 1.2

A reader of the layers alone would define `δ` and prove its range a second time, and the README says two things about who owns it. The contracts (line 546) and `Suggested.lean` (lines 30–37) now make `dobrushinCoeff κ` the value `tvBetweenStarts κ 1` of MarkovChainMixing 1.2 and import that it lies in `[0, 1]` and is the supremum over pairs of initial laws. But 1.1 (line 80) still opens "Define `dobrushinCoeff κ` … as the maximum over pairs", lists `0 ≤ δ(κ) ≤ 1` among its targets (line 83), and neither its `*Needs:*` line (line 101) nor the Dependencies of Layer 1 (line 160) names MarkovChainMixing; the scope section opens "This roadmap owns Dobrushin's coefficient with its contraction and its submultiplicativity" (line 471); and "MarkovChainMixing, section 1.2, is a supplier, as said above" (line 490) refers to nothing above it, since the roadmap is named nowhere before that line.

It would be enough to say in 1.1 that `δ(κ)` is MarkovChainMixing 1.2's `d̄(1)` (the two expressions agree because `κ ^ 1 = κ`), to move the range `[0, 1]` out of the targets as a fact of that section, to add "MarkovChainMixing 1.2" to the `*Needs:*` of 1.1 and to the Dependencies of Layer 1, to make the scope sentence "owns the contraction and the submultiplicativity for two different kernels of Dobrushin's coefficient", and to replace "as said above" by "see the supplier contracts below". One sentence that MarkovChainMixing's `d̄(s + t) ≤ d̄(s) d̄(t)` is the case `κ^s`, `κ^t` of 1.3 (the earlier text had it) would tell an implementer that 1.3 is the general statement and not a second proof. The opening overview could name MarkovChainMixing among the roadmaps it builds on.

## C02 — Three statements of the pull-request description do not match the head

"its 8 headline theorems are `sorry` and its 6 definitions have real bodies": the file now has 7 definitions (`tvBetweenStarts` was added); say 7.

The paragraph "Suppliers and boundaries" does not say that MarkovChainMixing 1.2 supplies the definition of the coefficient (only the generated dependency list names that roadmap), nor that the Gibbs measure is identified with Mathlib's `Measure.tilted`. Add: "MarkovChainMixing 1.2 supplies `d̄`, whose value at time `1` is Dobrushin's coefficient, with its range and its characterization as a supremum over initial laws; Mathlib's `Measure.tilted` supplies the Gibbs measure as a tilt of the counting measure."

"the lower bound on the coefficient of a block of `r` Metropolis kernels" (raised before, unchanged): 4.2 proves an upper bound `δ(product) ≤ 1 − m^r exp(−β_hi r L)`; the lower bound is on the entries of column `z`. Say "the upper bound on the coefficient of a block (from a lower bound on one column of the product)".

## N01 — One line of the module docstring is longer than 100 characters

Line 10 of `Suggested.lean` has 111 characters after the inserted sentence; rewrap the paragraph.

## Previous findings

- R01 — partly repaired: "`abbrev dobrushinCoeff … := tvBetweenStarts κ 1`" and the contract "From TauCetiRoadmap.MarkovChainMixing — 1.2 … Used at `t = 1` as Dobrushin's coefficient"; Layer 1 and the scope sentence were not brought into line (C01, a small correction).
- C01 — repaired: "It is Mathlib's exponential tilt of the counting measure, `Measure.count.tilted (fun x ↦ −(β * U x))`; prove that identification", with the two library facts removed from the targets and the file added to the contracts.
- C02 — repaired: the bullet on PACBayesBounds is gone; the scope section names only MarkovChainMixing and HiddenMarkovModels.
- C03 — partly repaired: "One open roadmap borders it and is not used: HiddenMarkovModels 6.1" now agrees with the README; "the lower bound on the coefficient of a block" is unchanged (C02 above).
- N01 — repaired: "Statements of other roadmaps that border this one"; no mention of the state of a pull request remains.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `dobrushinCoeff κ := tvBetweenStarts κ 1` against the README's "maximum over pairs of `tvDist (κ x) (κ y) / 2`" | probe `dobrushinCoeff κ = sup' … tvDist (κ p.1) (κ p.2) / 2`; two-state `p=3/10, q=1/10`; identity; one state | probe closes by `simp [tvBetweenStarts]` (`κ ^ 1 = κ`); `3/5` both sides, equal to MarkovChainMixing's Check `d̄(1) = 3/5`; `1`; `0` | same object as before the change | C01 (text only) |
| `tvBetweenStarts` against MarkovChainMixing 1.2 at its open head | its `Suggested.lean` lines 48–50 beside lines 28–31 here; `t = 0, 1, 2` on the two-state chain | bodies identical; `d̄(0) = 1`, `d̄(1) = 3/5`, `d̄(2) = 9/25` | verbatim copy, other namespace, no name clash | none |
| 1.2 contraction, now through the abbreviation | point masses at a maximizing pair; identity on two states; `simp` probe | both sides `3/5`; equality with factor `1`; `simp` makes no progress | holds; not closed by one tactic | none |
| 1.3 two kernels against the supplier's `tvBetweenStarts_add_le` | `κ^s`, `κ^t`; `Kernel` monoid `η * κ = η ∘ₖ κ`, `pow_add`; `simp [tvBetweenStarts]` probe | `d̄(s+t) = δ(κ^s ∘ₖ κ^t) ≤ δ(κ^t) δ(κ^s)`: supplier's inequality is the homogeneous case; `(3/5)² = 9/25`, equality; probe leaves the inequality open | 1.3 strictly more general, not derivable from the supplier | C01 (one sentence) |
| 3.1 `gibbs U β = Measure.count.tilted (fun x ↦ −(β * U x))` | `U = (0,1)`, `β = 1`; `β = 0`; empty type; `simp [gibbs, Measure.tilted]` probe | integral against counting measure becomes `1 + e⁻¹`, masses `0.731, 0.269`; tilt by constant `0` is `(1/2, 1/2)`; both zero; probe reduces to sum of point masses = `count.withDensity` with the same density | identification true, and a real (small) target | none |
| 3.1 probability measure from the library | `isProbabilityMeasure_tilted` with `Integrable.of_finite` on nonempty finite `S` | term elaborates (`NeZero Measure.count` found) | library fact as stated | none |

The rows for the untouched statements (2.1–2.3, 3.2, 3.3, 4.1–4.3, the Summary headlines) stand as in the previous review, of `f3f4259`.

- Source locators checked against the text: 0; the changed passages add or change no source locator, and neither source is readable from a legal place (below).
- Library declarations opened at the pin: `Measure.tilted` (`Mathlib/MeasureTheory/Measure/Tilted.lean:42`), `tilted_const'` (:60), `isProbabilityMeasure_tilted` (:125, needs `[NeZero μ]` and integrability of `exp ∘ f`, as the contract says), the `Monoid (Kernel α α)` instance with `mul η κ := η ∘ₖ κ` (`Mathlib/Probability/Kernel/Composition/Comp.lean:238`) and `Kernel.pow_add` after it.
- Cross-roadmap citations resolved: MarkovChainMixing 1.2 at its open head (README lines 102–118, `Suggested.lean` lines 48–62): definition, range `[0, 1]` and supremum characterization are there as the contract states; that roadmap does not cite this one.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed; no file changed outside the folder. Elaboration: `Suggested.lean` elaborates with 8 `sorry` warnings and nothing else; the elaborated types of `tvBetweenStarts` and `dobrushinCoeff` were compared with the README (both drop `[MeasurableSingletonClass S]`, which their bodies do not need).
- Padding probe: neither Layer 1 theorem closes with `simp`; the new definition is the supplier's, kept only to state the headlines.

Overlap check: read MarkovChainMixing, LangevinAndHamiltonianMonteCarlo, MarkovChainsAndRenewal, MathematicalStatisticsFoundations, HiddenMarkovModels (the last four as in the previous review, their text here unchanged); `d̄` and so `δ(κ) = d̄(1)` is owned by MarkovChainMixing 1.2 and cited in the contracts, with the stale sentences of C01; the Metropolis–Hastings kernel by MathematicalStatisticsFoundations 9.4 and the total variation formula by MarkovChainsAndRenewal 3.5, both cited; nothing else shared.

Source independence: changed passages only: 4 passages compared with 0 sources (the changed passages cite Mathlib and MarkovChainMixing, no outside source; neither source text could be read); largest share Mitra–Romeo–Sangiovanni-Vincentelli, 14 of 15 locators; contents not compared again, the change adding, removing or reordering no layer, and the table of contents unread.

Research link: the headline 4.3 is the convergence theorem of Mitra–Romeo–Sangiovanni-Vincentelli (1985/1986) for logarithmic cooling, after Geman–Geman (1984), sharpened by Hajek (1988); Layers 1–2 are Dobrushin's (1956) and Isaacson–Madsen's (1976) theory of inhomogeneous chains. Rests on the README's references, not on a text read.

## Not verifiable

- Mitra–Romeo–Sangiovanni-Vincentelli, Memorandum UCB/ERL M85/23: all 14 locators, as in the previous review; no legal copy readable here. None of them is in a changed passage.
- Polyanskiy–Wu, Theorem 33.4, p. 630: as in the previous review; not in a changed passage.

## Source issues

- none

## For the human reviewers

- **Not tested.** The memorandum of Mitra, Romeo and Sangiovanni-Vincentelli carries 14 of the README's 15 locators and could not be read: wording, arrangement and every locator are unchecked against it.
- **Licence.** The README cites the memorandum as open on the Berkeley department's technical-report pages and Polyanskiy–Wu as open on the first author's pages (README lines 566–573); neither host could be classified here.
- **Scope.** The main source is a 1985 technical report; the README gives its published form as Advances in Applied Probability 18 (1986), 747–771, whose numbering it does not use.
- **Merge order.** This roadmap now depends on MarkovChainMixing, which is still an open pull request by the same author; `Suggested.lean` carries a copy of its definition `tvBetweenStarts` (lines 28–31) because that file cannot be imported.
