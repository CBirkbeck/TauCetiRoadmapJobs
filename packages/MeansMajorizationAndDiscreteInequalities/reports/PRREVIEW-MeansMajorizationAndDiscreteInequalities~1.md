# Review of MeansMajorizationAndDiscreteInequalities (pull request #2500 at f3fdd95)

**Verdict:** needs changes

**Summary.** Needs changes. Every stated theorem survived the computed checks, and `Suggested.lean` elaborates with `sorry` as its only warning, but three proof routes assert steps that are false (the upper bound `x ≤ z ≺ y` in 4.4, the monotone approximation in 6.1, the Hölder step in 1.2), and the zero-convention target of 6.3 is a lemma Mathlib already proves at the pin and is not cited. There are also two small corrections and four format notes, none blocking. None of the seven cited books could be read legally, so no source locator was verified; that, the scope and one licence question are left to the human reviewers.

## R01 (P2) — The route for `x ≺_w y ⇒ x ≤ z ≺ y` in 4.4 raises the smallest entry of `x`, and the resulting `z` is in general not majorized by `y`

An implementer who follows the route cannot finish `weaklyMajorizes_iff_exists_le_majorizes`, and Tomić–Weyl and the doubly substochastic form are both routed through it. The sentence (4.4, proof route, line 807) reads: "raise the smallest entry of `x` by `∑ y − ∑ x`; the prefix inequalities persist because the increase is at the last position after sorting". Take `x = (0, 0)`, `y = (3, 1)`: `x ≺_w y` since `0 ≤ 3` and `0 ≤ 4`, the deficit is `4`, and `z = (0, 4)` has largest entry `4 > 3`, so `z ⊀ y`. The raised entry does not stay in the last position.

The statement itself is true. A route that works: among all `z ≥ x` with `z ≺_w y` (a nonempty compact set) take one with the largest total. If `∑ z < ∑ y`, sort `z` decreasingly and let `k < n` be the last index whose prefix sum is tight (`k = 0` if none). Tightness at `k` and slack at `k + 1` give `z_(k+1) < y_(k+1) ≤ y_k ≤ z_k`, so `z_(k+1)` can be raised by a small `ε` without changing the order or breaking any prefix inequality, contradicting maximality. Replace the sentence by this (or by any other valid argument).

## R02 (P2) — The approximating sequence in the proof route of 6.1 is not increasing, so monotone convergence does not apply to it

The `⇐` direction of the stop-loss characterisation and the strong form both rest on this limit. The route (6.1, line 1047) says a convex `φ` is the increasing limit of piecewise-linear convex functions obtained by "interpolat[ing] `φ` at a growing finite grid and extend[ing] linearly by one-sided slopes". Chord interpolants lie above `φ` between grid points and decrease under refinement: for `φ = x²` the grid `{−1, 0, 1}` gives the value `1/4` at `x = 1/4`, and the grid of step `1/2` gives `1/8`, while `φ(1/4) = 1/16`. So `φ_n − ℓ` is not monotone and `φ_n ≤ φ` fails.

Use instead the maximum of the supporting lines of `φ` at the first `n` points of a countable dense set. It is convex and piecewise linear with finitely many kinks, hence of the stated form `a + b x + ∑ c_k max (x − t_k) 0` with `c_k ≥ 0`; it is increasing in `n`, lies below `φ`, and converges to `φ` pointwise because `φ` is continuous.

## R03 (P2) — The Hölder step in the proof route of 1.2 is applied to the wrong pair of families and does not give the finite form

The route (1.2, line 302) says the finite form "is Hölder with exponents `1/(1−t)` and `1/t` applied to `w x ^ ((1−t) r)` and `x ^ (t s)`". With `Real.inner_le_Lp_mul_Lq` that yields `(∑ w ^ (1/(1−t)) x ^ r) ^ (1−t) (∑ x ^ s) ^ t` on the right, not `(∑ w x ^ r) ^ (1−t) (∑ w x ^ s) ^ t`. At `w = (1, 0.01)`, `x = (1, 2)`, `r = 1`, `s = 3`, `t = 1/2` the left side is `1.04`, the target's right side is `1.0496`, and the bound the sentence produces is `3.0003`. Apply Hölder to `w ^ (1−t) x ^ ((1−t) r)` and `w ^ t x ^ (t s)` instead.

## R04 (P2) — The zero-convention target of 6.3 is Mathlib's `InformationTheory.mul_log_le_klDiv`, which the roadmap neither names nor cites

6.3 lists as a prose target (line 1080) the log-sum inequality with `b i = 0` allowed, "stated through `InformationTheory.klDiv` on finite measures", without giving the statement. At the pin, `Mathlib/InformationTheory/KullbackLeibler/Basic.lean` line 355 proves, for all finite measures `μ, ν`, `ENNReal.ofReal (μ.real univ * log (μ.real univ / ν.real univ) + ν.real univ − μ.real univ) ≤ klDiv μ ν`, with `klDiv μ ν = ∞` when `μ` is not absolutely continuous; line 341 (`mul_log_le_toReal_klDiv`) is the real-valued form. That is the promised extension, so the target asks for a pinned lemma to be proved again. The supplier contracts list `klDiv`, `klDiv_eq_zero_iff` and `klDiv_map_le` but not these two.

Move the item from target to consumed, naming `InformationTheory.mul_log_le_klDiv` and `InformationTheory.mul_log_le_toReal_klDiv` in the Mathlib contracts, and say in one clause how `sum_mul_log_div_le` differs (the finite-sum real form with `b > 0`, and its equality case, which the pin does not have).

## C01 — The Check on `doublySubstochastic` glosses `(1/2) • 1` as the all-`1/2` matrix

In the Checks of Layer 4 (line 858), `(1/2) • 1` is half the identity matrix, `diag (1/2, 1/2)`; the matrix with all entries `1/2` on two indices is a different one (and is doubly stochastic). Both lie in `doublySubstochastic (Fin 2)`, so nothing false is claimed, but the label names the wrong object. Write either "half the identity" or `!![1/2, 1/2; 1/2, 1/2]`.

## C02 — "Prior formalization" refers to "synopsis entries 11.1 … 11.72" of a document the README never identifies

Lines 1163–1171 sort numbers `11.x` into consumed, targets and owned elsewhere, but no synopsis is cited or defined, so a reader cannot tell what `11.17` is or check the coverage claim. Name the document (title and where it is), or replace the numbers by the section numbers of this README.

## N01 — `Suggested.lean` ends with a section header that has no declaration under it, followed by 68 `#check` lines

Several of the names pinned there are not supplier declarations of the README (`Real.exp`, `Real.rpow`, `Finset.sup'`). The list would be shorter and the header unnecessary if only the declarations of the supplier contracts were pinned.

## N02 — `TauCeti.Analysis.MeanInequalities` is imported but nothing from it is used or cited

No statement, `#check` or README contract mentions a declaration of that module.

## N03 — `ENNReal.HolderTriple` is cited in `Mathlib/Data/ENNReal/Holder.lean`

At the pin that file is a deprecated re-export; the class is defined in `Mathlib/Basic/ENNReal/Holder.lean` (line 42).

## N04 — `maxSubsetSum`, `Majorizes` and `WeaklyMajorizes` are declared over an ordered additive monoid `M`, the README defines them for real vectors

The section's `[IsOrderedAddMonoid M]` does not appear in the three elaborated types (they do not need it). Either say in 4.1 that the definitions are stated for a linearly ordered additive commutative monoid, or state them over `ℝ`.

## Questions for the author

- 5.1 attaches "differentiability suffices; no `C¹` hypothesis" to Niculescu–Persson, Thm 4.3.3, and lists Marshall–Olkin–Arnold, 3.A.4, first. Is 3.A.4 stated for continuously differentiable functions only, and does Thm 4.3.3 state the differentiable case? The statement is true as written (checked by the mean value theorem along T-transforms), but neither text could be read.
- 6.1 cites Shaked–Shanthikumar Thm 3.A.1 for the stop-loss form, Thm 3.A.2 for the absolute-deviation form and Thm 3.A.4 for the martingale coupling. Are these the theorem numbers of the 2007 edition? The text could not be read.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `powerMean` and Checks | `w=(1/2,1/2)`, `x=(1,4)`, `r=−1,0,1,2,±200` | `1.6, 2, 2.5, 2.91548, 3.98616, 1.00347`; no case split at `0`: `1^0 = 1` | agree | none |
| 1.2 finite form (sampled) | `w=(1,0.01)`, `x=(1,2)`, `r=1,s=3,t=1/2` | LHS `1.04`; target RHS `1.0496`; route's RHS `3.0003` | statement true, route false | R03 |
| 1.2 integral form (sampled) | `t=0`; `f=⊤`; `f=0` | `∫f^r ≤ (∫f^r)·1`; `⊤ ≤ ⊤`; `0 ≤ 0` | true | none |
| 1.3 quasi-arithmetic (sampled) | `I=∅`; `I={c}`; `n=0`; generators `log`, `−1/t`, `exp` on `(1,4)` | both sides vacuous/true; `2`, `1.6`, `3.35544` | true | none |
| 1.3 homogeneous ⇒ power mean | `r<0` needs increasing generator `−t^r` | `StrictMonoOn` satisfied by `−t^r`, `log`, `t^r` | true | none |
| 1.4 Lin and sharpness | `(1,4)`; `g'(t)`; Taylor at `b=a(1+ε)` | `G=2 < L=2.16404 < M_(1/3)=2.16522`; `M_0.3=2.14835<L`; `g'=(t−1)⁴/(t(1+t)⁴)`; `−1/12` vs `(r−1)/8` | true | none |
| 1.4 integral representation | `a=b`; `a≠b` | `a`; `(b−a)/(log b − log a)` | true | none |
| 2.1 Jensen equality (sampled) | `s=∅`; `φ=\|t\|`, `f≥0`; `⇐` by integrating the line | hypothesis contradictory; equality with `c=1`; `φ(m)+c(m−m)` | true | none |
| 2.2 Jensen–Steffensen (sampled) | `w=(1/2,−1/2,1)`, `x=(0,1,2)` and `(0,2,1)`, `φ=t²`; `n=0` | `2.25 ≤ 3.5`; `0 > −1` (non-monotone fails); `∑w=0≠1` vacuous | true | none |
| 2.3 Hermite–Hadamard (sampled) | `t²` on `[0,1]`; `exp` on `[0,1]`; endpoint jump | `1/4 ≤ 1/3 ≤ 1/2`; `1.64872 ≤ 1.71828 ≤ 1.85914`; bounded, integrable | true | none |
| 2.4 Kantorovich | masses `1/2` on `{1,4}`; `m>M` | `2.5·0.625 = 25/16 =` bound; hypothesis contradictory | true | none |
| 3.1 Chebyshev, Grüss (sampled) | `w=(1/4,3/4)`, `a=(1,2)`, `b=(3,5)` / `(5,3)`; Rademacher `f=g` | `7.875 ≤ 8.25`; `6.125 > 5.75`; `1 ≤ 1` | true | none |
| 3.2 Bergström equality (sampled) | `s=∅`; `a=(1,1),b=(1,2)`; `a=b=(1,2)` | `0=0`, `c` any; `4/3 < 3/2`; `3 = 3` | true | none |
| 3.3 reverse Minkowski (sampled) | two points, `f=(1,0)`, `g=(0,1)`, `p=1/2`; `∫f^p=∞` | `2 ≤ 4`; both sides `∞`; route: `f^p=(fS^(p−1))^p (S^p)^(1−p)` | true | none |
| 3.4 Hölder, Minkowski (sampled) | `s=∅`; some `p i=0`; `p=q=2`, `f=g=(1,2)`; `f^p=c g^q` | `r=∞`, `≤1`; `r=0`, LHS `0`; `5=√5·√5`; both sides `c^(1/p)∫g^q` | true | none |
| 4.1 definitions and Checks | `(3,1,2)`; `(−1,−2)`; `(0,0)` vs `(1,−1)`; `(2,2)` vs `(3,0)`; `ι=∅` | `0,3,5`; `−1`; `0≤1`; `4>3`; trivially true | agree | C01, N04 |
| 4.1 bridge to `IsWeaklyMajorizedBy` | structure at the pin: antitone, nonnegative, `prefixSum k x ≤ prefixSum k y` all `k` | `k≥n` gives the total; matches `sum_le` | true | none |
| 4.2 HLP, Rado (sampled) | `ι=∅`; `(1/2,1/2)=D(1,0)` with averaging `D` | both sides true; `D` doubly stochastic | true | none |
| 4.3 Karamata (sampled) | `t²` on `(1/2,1/2) ≺ (1,0)`; test `max(t−c,0)`, `±id` | `1/2 ≤ 1`; recovers subset sums and totals | true | none |
| 4.4 weak majorization (sampled) | `x=(0,0)`, `y=(3,1)`; row scaling by `x_i/z_i` | route's `z=(0,4)`, `4>3`; valid `z=(3,1)`; `P y = x` | statements true, route false | R01 |
| 4.5 contraction | `ℓ¹`, `ℓ²` on `(1/2,1/2)` vs `(1,0)` | `1=1`; `√(1/2)<1` | true | none |
| 5.1 Schur–Ostrowski (sampled) | `x ↦ x 0`; `∏x_i`; `I=∅`; differentiable only | not symmetric, `1>0`; sign `−`; trivial; MVT along segment suffices | true | question |
| 5.2 Muirhead | `(1,1)` vs `(2,0)` at `(1,2)`; `(1,1,1)` vs `(3,0,0)` at `(1,2,3)` | `4 ≤ 5`; `36 ≤ 72` | true | none |
| 5.3 Schur (sampled) | `t=1`: `(1,1,1)`, `(1,1,0)`, `(2,1,0)`, `(1,1,−1)`; `t<0` grouping | `0, 0, 3, −4`; both grouped terms `≥0` | true | none |
| 5.4 entropy | `(1/2,1/2)`, `(1/2,1/4,1/4)`, `(2,0)`; `ι=∅` | `0.69315`, `1.03972<1.09861`, `−2 log 2`; `∑p=0≠1` vacuous | true | none |
| 6.1 convex order | `δ₀` vs Rademacher; Cauchy; chords of `x²` at `1/4` | `0 ≤ 1/2` at `t=0`; `Integrable id` fails; `1/4` then `1/8` (decreasing) | statements true, route false | R02 |
| 6.2 empirical laws (sampled) | definition at the pin `(card κ)⁻¹ ∑ δ_(x i)`; `(1/2,1/2)` vs `(1,0)` | `δ_(1/2)` vs two-point law; integrals are averages | true | none |
| 6.3 log-sum | `a=(1,2)`: `b=(2,1)`, `b=(2,4)`; `s=∅`; all `a=0` | `0 < 0.69315`; `−2.07944` both; `0=0`; `c=0` | true; pin has measure form | R04 |

- Source locators checked against the text: 0 of 70 (none of the seven books is legally readable; see below).
- Library declarations opened at the pin: 41 in Mathlib (the contracts of the README by file and line, and `InformationTheory.mul_log_le_klDiv` at `Mathlib/InformationTheory/KullbackLeibler/Basic.lean:355`) and 11 in Tau Ceti (the consumed files under `TauCeti/Analysis/Convex/`, `TauCeti/Probability/Process/EmpiricalMeasure.lean`, `TauCeti/Algebra/BigOperators/Finset/PartialSum.lean`).
- Cross-roadmap citations resolved on main: 6 (OperatorTheory/Majorization MAJ-A01–A40, MathematicalStatisticsFoundations §7.5, ComplexHessianEquations §2.1, NumberFieldEnumeration §1.1, OperatorTheory/PrincipalAngles PA-B31, SymplecticGeometry/ConvexityToric §3.2).
- Dependency check: `depcheck: 213 roadmaps, 2276 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/MeansMajorizationAndDiscreteInequalities/Suggested.lean` exits 0 with 44 `sorry` warnings and no other warning or error.
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on a separate copy of the file: 0 of 44 theorems closed; no padding found.
- Signatures: all 55 elaborated types compared with the README statements; the only section binder not carried is `[IsOrderedAddMonoid M]` on three definitions (N04).
- Pull-request text: the description's count (44 theorems), suppliers and layer list agree with the head; nothing to correct.

Overlap check: read Majorization (OperatorTheory/Majorization, main), ComplexHessianEquations (main), OptimalTransport (main), OperatorMonotoneFunctionsAndMatrixMeans (open), LargeDeviations (open), and MathematicalStatisticsFoundations §7.5; nothing shared. Weak majorization of antitone nonnegative tuples, transfer descent and symmetric gauges stay with OperatorTheory/Majorization and are consumed; majorization of unsorted real vectors, Karamata, Schur-convexity and the convex order on `ℝ` are stated nowhere else and are owned here. No declaration of `Suggested.lean` shares a fully qualified name with another roadmap.

Source independence: 0 passages compared with 0 sources, because none of the seven cited texts could be read legally; largest share Marshall–Olkin–Arnold, 20 of 70 locators; its contents could not be opened, and by the README's own locators Layer 4 draws on its chapters 1–5 and Layer 5 on chapters 3–4, which is not a one-to-one run.

Research link: the headline targets are the doubly stochastic characterisation of majorization (Hardy–Littlewood–Pólya 1934), Schur–Ostrowski and Tomić–Weyl (Marshall–Olkin–Arnold 2011) and the convex order (Shaked–Shanthikumar 2007); the README's downstream section names Strassen-type comparison of experiments and Schur–Horn as users. Rests on the README.

## Not verifiable

- Hardy–Littlewood–Pólya, *Inequalities* (1934): no legal copy found; 19 locators unchecked.
- Marshall–Olkin–Arnold (2011), Bullen (2003), Mitrinović (1970), Mitrinović–Pečarić–Fink (1993), Niculescu–Persson (2018), Shaked–Shanthikumar (2007): each resolves only to a paywalled publisher page; 51 locators unchecked, including all fifteen sampled sections.
- Wording and arrangement against the sources: not checked, for the same reason.
- That every label MAJ-A18 to MAJ-A40 is implemented in Tau Ceti (the "Not owned here" paragraph): only the files for weak majorization, Schur–Horn and Ky Fan sums were opened.

## Source issues

- none

## For the human reviewers

- **Scope.** The subject is classical inequalities; all seven sources are published monographs (1934–2018). Several targets (Schur's inequality 5.3, Muirhead 5.2, Bergström 3.2) are also standard competition material. Whether this is in scope is yours to decide.
- **Licence.** `README.md` lines 1158–1162 name the author's project lean-CKMA as prior formalization, and `Suggested.lean` line 259 calls `maxSubsetSum` a local copy of the shape of Mathlib pull request #41898. Neither repository was opened.
- **Not tested.** Marshall–Olkin–Arnold has the largest share of locators (20 of 70); neither its text nor its table of contents could be read, so wording and arrangement were not compared with it or with any other source.
