# Review of OptimalControlAndHamiltonJacobi (pull request #2733 at 102e2f4)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired. The trajectory theorem of 1.2 and the first estimate of 1.3 are now taken from the nonlinear Carathéodory theorem of DiracScatteringAndNonlinearFourierTransform §1.7, the reduction was recomputed and its hypotheses hold, and the earlier small correction and format note are both made. Two small corrections remain, neither blocking: the dependency summary of Layer 1 and the Mathlib contract still describe the Picard route that was removed, and the new route of 1.2 no longer says why the velocity is integrable. The human reviewers are asked, as before, to look at the fact that all three located sources are lecture notes.

## C01 — The Dependencies of Layer 1 and the Mathlib contract still list `ODE.picard`, which nothing uses any more, and the Dependencies do not name the new supplier

A reader of the layer's summary learns that Layer 1 needs Mathlib's Picard map and no roadmap, which is the state before the change. The Dependencies paragraph of Layer 1 (lines 188–190) reads "interval integrals, `ODE.picard`, `IsCompact.exists_isMaxOn`; Tau Ceti `TauCeti.le_mul_exp_of_le_add_mul_integral`. No other layer", and the Mathlib contract (lines 691–692) still gives `ODE.picard` with its formula; the *Needs:* lines of 1.2 and 1.3 no longer name it, and no other section does, while both now name DiracScatteringAndNonlinearFourierTransform §1.7.

In the Dependencies paragraph replace `ODE.picard` by "DiracScatteringAndNonlinearFourierTransform §1.7", and drop `ODE.picard` from the Mathlib contract, keeping `IsPicardLindelof` as named in the scope only. The paragraph of the overview on how the roadmap sits in Tau Ceti would also gain a clause naming that roadmap, since it is now the only roadmap supplier.

## C02 — The new route of 1.2 shows that the running cost is integrable along the trajectory but no longer that the velocity is

Admissibility has two integrability clauses, for `s ↦ f(y s, α s)` and for `s ↦ L(y s, α s)`, and the solution §1.7 provides is a continuous `Y` satisfying the integral equation; its global form does not list the integrability of `s ↦ F(s, Y(s))` among its conclusions. The route (lines 141–143) says "along a continuous `y` the function `s ↦ L(y s, α s)` is measurable and bounded on `[t, T]`", where the text it replaces said this of both functions. The same argument covers both: write "the functions `s ↦ f(y s, α s)` and `s ↦ L(y s, α s)` are measurable and bounded".

## Previous findings

- R01 — repaired: "Route: existence is a case of the nonlinear Carathéodory theorem of DiracScatteringAndNonlinearFourierTransform, Layer 1, §1.7, which owns the general statement in a Banach space"; both *Needs:* lines, the scope and a supplier contract name it. Two leftovers: C01, C02.
- C01 — repaired: "With `n = 1`, `U = [−1, 1]`, `L = 0` and `g(x) = x` the costs `g(y T)` are then all real numbers".
- N01 — repaired: the Check "The sign in `−p(f)`" of 3.2, with `U = [0, 1]`, `g(x) = x`, values `max(0, −1) = 0` against `max(0, 1) = 1`.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.2 existence by reduction to §1.7, `F(s, y) = f(y, α s)` on `[t, T]` | `ẏ=u`, bang-bang `α` from `(0,0)`; `f=−y+u`; `U=∅`; `t=T`; `f=2√|x|` | `K=0`, `m=1`, `Y=min(s,2−s)`, `|Y|≤s`; `K=1`, `m=|x|+1`; no control, vacuous; `Y(T)=x`; Lipschitz bound fails, solutions `0`, `(s−t)²` | hypotheses of §1.7 hold; conclusion is the trajectory | C02 |
| 1.2 uniqueness without compactness | `U=ℝ`, `f=u`, `α` integrable unbounded | difference satisfies `φ ≤ K∫φ` with `K=0`, so `φ=0`; §1.7 would need `m=|α|`, not a constant | holds; the clause on what it adds is true | none |
| 1.3 first estimate as §1.7's dependence on the initial value | `L=K` constant; `f=x`; `f=−x+u` | `exp|∫ₜˢ K| = e^(K(s−t))`; equality `e^(s−t)`; `e^(−(s−t))` below bound | agrees with §1.7 | none |
| 1.3 second estimate "which that section does not state" | `f=u cos x`, `|u|≤1` (`K=M=1`) | §1.7 gives `(s−t)e^(s−t)`; here `(s−t)`; at `s−t=1`: 2.718 against 1 | true: §1.7's bound is weaker | none |
| 3.2 new Check on the sign | `ẏ=u`, `U=[0,1]`, `L=0`, `g=x` | costs `x+∫α ≥ x`, so `v=x`; `H=sup(−pu)=max(0,−p)`; `0+max(0,−1)=0`; other sign `max(0,1)=1` | holds; separates the two | none |
| 5.1 first Check, `U=[−1,1]` added | `t>T`, `L=0`, `g=x` | `[t,T]=∅`, control `0` with any curve admissible, cost `g(y T)` any real; no least element | holds | none |
| Supplier contract for §1.7 | its text on main, lines 692–711, and at the head of its open revision | measurable sections, `L(t)`-Lipschitz, `‖F(t,x₀)‖≤m(t)`; solution, uniqueness, `‖x₀−x₀′‖exp|∫L|`: all there | contract states what §1.7 states | none |

The rows for the statements the change does not touch stand as in the previous review, of `3145b94`.

- Cross-roadmap citations resolved: 1 (DiracScatteringAndNonlinearFourierTransform §1.7, on main at README line 692 and unchanged in its open revision; that roadmap is at place 105 of the merge order, this one at 444).
- Library declarations opened at the pins: 3 named in the changed passages (`TauCeti.le_mul_exp_of_le_add_mul_integral`, `TauCeti/Analysis/ODE/Gronwall.lean` line 59, with `c`, `K ≥ 0` as used; `IsCompact.exists_isMaxOn`, `Mathlib/Topology/Order/Compact.lean` line 273; `TauCeti/Analysis/ODE/Caratheodory.lean` lines 196 and 219, linear only, so "not in the libraries" holds).
- Source locators: the changed passages contain none; the seeded sample falls in them only through the routes of 1.2 and 1.3, which cite the supplier and no source. The 27 locators stand as checked in the previous review.
- Dependency check: `depcheck: 182 roadmaps, 2069 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changed outside the folder.
- Automatic checks: all pass at this head. Elaboration of `Suggested.lean`: 9 `sorry` warnings and nothing else; the file is unchanged since `3145b94`, so the signatures and the one-tactic probe stand.
- Pull request text: read against the head; its paragraph on suppliers names DiracScatteringAndNonlinearFourierTransform §1.7 for 1.2 and 1.3, and the counts (9 theorems, 12 definitions, `import Mathlib` only) agree. Nothing to correct.
- Overlap check: read PDE, DiracScatteringAndNonlinearFourierTransform (main and its open revision), OneStepMethodsForODEs; the nonlinear Carathéodory theorem is shared, owner DiracScatteringAndNonlinearFourierTransform §1.7, now cited; nothing else shared.

Source independence: changed passages only: 5 passages compared (routes of 1.2 and 1.3, the Check of 3.2, the scope bullet, the supplier contract), which cite no source, with 3 sources as read in the previous review, none shared; largest share Liberzon-cvoc, 14 of 27 locators; no layer added, removed or reordered, so contents not compared again: independent as before.

Research link: The viscosity-solution theory of Crandall and Lions (1983) and the maximum principle of Pontryagin, Boltyanskii, Gamkrelidze and Mishchenko (1962); Layers 3–4 are the well-posedness theory of the former for Hamilton–Jacobi–Bellman equations, Layer 6 the latter for free final state. Rests on the README's References and Liberzon-cvoc line 6155.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- **Scope.** All three located sources are lecture notes or a preliminary copy on their authors' pages (Evans-control, Liberzon-cvoc, Calder-viscosity); the refereed papers (Crandall–Lions 1983, Pontryagin et al. 1962) are attributed in the References without locators.
- **Licence.** Liberzon-cvoc is the preliminary version of a book published by Princeton University Press; its first page invites browsing and download (Liberzon-cvoc lines 11–18). No reuse of its text was found.
