# Review of SimulatedAnnealing (pull request #2709 at f3f4259)

**Verdict:** needs changes

**Summary.** Needs changes, for one reason: the coefficient `δ(κ)` of Layer 1 and the distance `d̄(t)` of the open roadmap MarkovChainMixing are the same object (`d̄(t) = δ(κ^t)`), each roadmap says it owns it, and each plans its own proof of the same submultiplicativity. No mathematical error was found: every statement, route and Check was recomputed and holds, and the Lean statements agree with the README. There are three small corrections and one format note, none blocking. Neither cited source could be read from a legal place here, so the locators are unverified and the comparison of wording and arrangement with the memorandum is left to the human reviewers.

## R01 (P2) — Dobrushin's coefficient and MarkovChainMixing's `d̄` are one object with two owners and two planned proofs of the same inequality

An implementer of either roadmap would build the same definition and prove the same theorem a second time, under a second name, and nothing in either text says which is the library's.

MarkovChainMixing, at the head of its open pull request (#2502), defines in its section 1.2 (README lines 104–105; `Suggested.lean` line 48) `tvBetweenStarts κ t` as the maximum over pairs of `tvDist ((κ ^ t) x) ((κ ^ t) y) / 2`. That is `dobrushinCoeff (κ ^ t)` word for word, with the same normalization and the same `Finset.sup'`. Its three facts about `d̄` are instances of Layer 1 here at the kernel `κ^t`: the range `[0, 1]` is the first bullet of 1.1; "the supremum of the distance between `κ^t ∘ μ` and `κ^t ∘ ν`" is the two bullets after 1.2; and `tvBetweenStarts_add_le` (its line 115, `Suggested.lean` line 58) is `dobrushinCoeff_comp_le` for the pair `κ^s`, `κ^t`, proved there by an optimal coupling and here from the contraction. Its scope section says it "owns … the distances `d` and `d̄`"; the scope section here (line 468) says this roadmap "owns Dobrushin's coefficient with its contraction and its submultiplicativity". The paragraph at lines 488–495 records the relation accurately but leaves both owners in place ("this roadmap does not depend on either").

The smallest change is to name one owner. Since Layer 1 is the general statement (two different kernels, an arbitrary pair of initial laws), the natural choice is that it owns `δ`, 1.1, 1.2 and 1.3, that the scope paragraph says so in one sentence ("MarkovChainMixing 1.2's `d̄(t)` is `δ(κ^t)`, and its bounds on `d̄` are 1.1–1.3 at `κ^t`"), and that MarkovChainMixing 1.2 cites these sections instead of re-proving them, which places this roadmap before that one. The other choice is to import `d̄(1)`, its range and its supremum characterization from MarkovChainMixing 1.2 and keep here only what that section lacks: the contraction by the factor `δ(κ)` for two arbitrary laws and the two-kernel inequality. Either is fine; the two pull requests have the same author, so the choice is theirs.

## C01 — The Gibbs measure of 3.1 is Mathlib's exponential tilt of the counting measure, and 3.1 does not say so

A reader cannot tell that the first two API bullets of 3.1 are library facts. Mathlib has `MeasureTheory.Measure.tilted` (`Mathlib/MeasureTheory/Measure/Tilted.lean`, line 42): `μ.tilted f` is `μ` with density `exp (f x) / ∫ exp f ∂μ`. Under the roadmap's conventions (finite `S`, measurable singletons) `gibbs U β` is `Measure.count.tilted (fun x ↦ -(β * U x))`; "a probability measure when `S` is nonempty" is `isProbabilityMeasure_tilted` (line 125), and the uniform law at `β = 0` is `tilted_const'` (line 60).

It would be enough to say in 3.1 that `gibbs U β` is this tilt, to add the file to the Mathlib contracts, and to keep as targets only what the library lacks (the derivative formula and the invariance under adding a constant to `U`, if it is not there). The hand-written body in `Suggested.lean` may stay, or become the tilt.

## C02 — The scope section points to a roadmap, PACBayesBounds, that exists neither on main nor in any open pull request

At lines 500–503 the README describes "PACBayesBounds (an open roadmap, not on main), section 4.1" and its Gibbs posterior. No roadmap of that name is on main or among the open roadmap pull requests as of today, and the phrase "Gibbs posterior" occurs in no roadmap other than this one, so the comparison cannot be followed. Remove the bullet, or name the roadmap as it is actually called where it is open. Nothing depends on it.

## C03 — Two sentences of the pull-request description do not match the head

"the lower bound on the coefficient of a block of `r` Metropolis kernels": 4.2 proves an upper bound, `δ(product) ≤ 1 − m^r exp(−β_hi r L)`; the lower bound is on the entries of column `z`. Say "the upper bound on the coefficient of a block (a lower bound on one column of the product)".

"Two open roadmaps border it and are not used: MarkovChainMixing 1.2 … HiddenMarkovModels 6.1": the README's scope section lists three bordering roadmaps (see C02 for the third). Make the two agree once C02 is settled.

## N01 — The scope section describes the state of pull requests

"(an open roadmap, not on main)", three times at lines 485–503, and "Statements of open roadmaps (not on main)" will be out of date when those roadmaps merge. Name the roadmap and section only.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 coefficient, formula, column minima | two-state `p=3/10, q=1/10`; identity; constant; one state; 3-state "uniform on the others" | `δ=3/5`; `1`; `0`; `0`; rows differ by `1/2`, column minima all `0` so bound `1` | holds | none |
| 1.1 vs MarkovChainMixing 1.2 | `t=1` in `tvBetweenStarts`; same two-state chain | `d̄(1)=3/5=δ(κ)`; definitions coincide at `κ^t` | same object | R01 |
| 1.2 contraction | point masses at a maximizing pair; `μ=2ν` with constant kernel; identity on two states | both sides `δ(κ)`; left `1/2`, right `0`; equality with factor `1` | holds; Checks true | none |
| 1.3 two kernels | lazy `ε=1/2` twice; deterministic 3-state pair | `δ=1/2, 1/2`, product lazy `ε=3/4`, `δ=1/4`; `δ=1,1`, product constant at `x₃`, `δ=0` | holds, order `η ∘ₖ κ` = `κ` first | none |
| 2.1 products | `P 0` constant at `a`, `P 1` exchange; `n=0,1,2` | `P_(0,2)` constant at `b`; `P_(m,1)=P m` | recursion and order right | none |
| 2.2 block criterion, both directions | lazy `ε_k=1/(k+1)²`; `ε_k=1/(k+1)`; identity; one state | `m=0`: `0`; `m=1`: `Π(1−1/j²)=1/2`; `m/(m+n)`; terms `0`; terms `1`, ergodic | iff holds; `k (j+1) − k j` safe by strict monotonicity | none |
| 2.3 Isaacson–Madsen | alternating constants; identity; homogeneous `p=3/10,q=1/10` | distances `1`, not summable; `δ=1`; `π=(1/4,3/4)`, `δ(κ^n)=(3/5)^n` | holds; telescoping identity rechecked term by term | none |
| 3.1 Gibbs measure | `U=(0,1)`, `β=1`; `β=0`; empty type | `0.731, 0.269`; uniform; zero measure | equals `count.tilted (−βU)` | C01 |
| 3.2 concentration | `U=(0,0,1)`, `β=log 2`; diagonal case of the Tau Ceti limit | `(1/2)/(5/2)=1/5`; `Tr(P₀E_xx)/Tr P₀ = 1/|argmin|` on `argmin` | holds | none |
| 3.3 monotonicity, summability | `U=(0,1,5)` middle mass; alternating `β`; empty `S`; bounded `β` | `0.333, 0.377, 0.268`; term `0.462` each; all terms `0`; three-part bound finite | holds | none |
| 4.1 Metropolis kernel | exchange, `U=(0,1)`; rows `(0,1),(1/2,1/2)`, `U=0`; `β=0`; `β<0` | rows `(1−e^(−β), e^(−β))`, `(1,0)`; stationary `(1/3,2/3)`; `q`; row mass `e^(−β)>1` | holds for `β ≥ 0`; agrees with MathematicalStatisticsFoundations 9.4 acceptance | none |
| 4.2 block bound | path `a–m–b`; 8745 random instances, `r` up to eccentricity + 2, `β_lo` from `0` | ecc `2`, `L=2`; path part `≥ (a e^(−β_hi L))^d`, stay part `≥ m^(r−d)`; no violation | holds | none |
| 4.3 strong ergodicity | 3-state example `c=1/2, 1, 4`; `β 0<0`; constant `U`; `β≡0` | `Π=0.7164`, limit mass at `a` `0.149`; `0.79/0.93`; `0.83/0.94`; mass `>1`; periodic; uniform limit | holds; forced `r≥1`, `L>0`, `c>0`, `b≥0` | none |
| 4.3 probability of the minimizers | follows from 4.3 by convexity in `μ` | `uniformOn (argmin U) (argmin U) = 1` | holds; not closed by one tactic | none |
| Summary headlines vs Lean | four headlines against the 8 theorems | hypotheses identical; all statable and stated | agree | none |

- Source locators checked against the text: 0 of 15 (neither source readable from a legal place; see below).
- Library declarations opened at the pins: 24 in Mathlib (among them `tvDist` at `MeasureTheory/Measure/TotalVariation/Defs.lean:62`, `tvDist_triangle` :221, `Kernel.comp_apply` at `Probability/Kernel/Composition/Comp.lean:57`, `Kernel.IsReversible.invariant` at `Probability/Kernel/Invariance.lean:63`, `SimpleGraph.eccent` at `Combinatorics/SimpleGraph/Diam.lean:41`, `Measure.tilted` at `MeasureTheory/Measure/Tilted.lean:42`) and 1 in Tau Ceti (`Matrix.IsHermitian.tendsto_trace_exp_neg_smul_mul_div`, `Analysis/Matrix/Exponential/ZeroTemperature.lean:63`); all exist where cited. No Dobrushin coefficient or Metropolis kernel at either pin.
- Cross-roadmap citations resolved: MarkovChainsAndRenewal Layer 3 item 5 and MathematicalStatisticsFoundations 9.4 on main, both as described; MarkovChainMixing 1.2 and 6.1 and HiddenMarkovModels 6.1 at their open heads, as described; PACBayesBounds 4.1 found nowhere.
- Dependency check: `depcheck: 178 roadmaps, 2027 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration: the file elaborates with `sorry` as the only warning; the elaborated types of all 14 declarations were compared with the README (the five definitions that drop `[MeasurableSingletonClass S]` do not need it); none of the 8 theorems closes with `rfl`, `simp`, `infer_instance` or `exact?`.
- Ownership against open pull requests was checked by object with the roadmap search (Dobrushin, weak ergodicity, inhomogeneous chains, annealing, Gibbs posterior, Metropolis); QuantumOptimization lists simulated annealing as out of scope.

Overlap check: read MarkovChainMixing, LangevinAndHamiltonianMonteCarlo, MarkovChainsAndRenewal, MathematicalStatisticsFoundations, HiddenMarkovModels; `δ(κ) = d̄(1)` and its submultiplicativity are shared with MarkovChainMixing and have no single owner (R01); the Metropolis–Hastings kernel and its reversibility are owned by MathematicalStatisticsFoundations 9.4 and cited; the total variation formula by MarkovChainsAndRenewal 3.5 and cited; nothing else shared.

Source independence: 0 passages compared with 0 sources (neither text could be read); largest share Mitra–Romeo–Sangiovanni-Vincentelli, 14 of 15 locators; contents not compared: by the README's own locators Layer 1 draws on its sections 4 and 6, Layer 2 on 4, Layer 3 on 3 and 5, Layer 4 on 3 and 5, which is not a one-to-one ordered mapping, but the table of contents was not read.

Research link: the headline 4.3 is the convergence theorem of Mitra–Romeo–Sangiovanni-Vincentelli (1985/1986) for logarithmic cooling, after Geman–Geman (1984), sharpened by Hajek (1988); Layers 1–2 are Dobrushin's (1956) and Isaacson–Madsen's (1976) theory of inhomogeneous chains. Rests on the README's references, not on a text read.

## Not verifiable

- Mitra–Romeo–Sangiovanni-Vincentelli, Memorandum UCB/ERL M85/23: all 14 locators (Definitions 4.1–4.3, Theorems 4.1, 4.2, 5.1, 5.2, 6.1, Propositions 3.1–3.3, 5.1, equations (3.8), (5.1)–(5.8)). The sources service does not classify the department's technical-report host and found only a publisher landing page for the published version; the text was requested.
- Polyanskiy–Wu, Theorem 33.4, p. 630: the service did not accept the prepublication copy's address as an author's page and found only the publisher's page; the text was requested.

## Source issues

- none

## For the human reviewers

- **Not tested.** The memorandum of Mitra, Romeo and Sangiovanni-Vincentelli carries 14 of the README's 15 locators and could not be read: wording, arrangement and every locator are unchecked against it.
- **Licence.** The README cites the memorandum as open on the Berkeley department's technical-report pages and Polyanskiy–Wu as open on the first author's pages (README lines 561–568); neither host could be classified here.
- **Scope.** The main source is a 1985 technical report; the README gives its published form as Advances in Applied Probability 18 (1986), 747–771, whose numbering it does not use.
