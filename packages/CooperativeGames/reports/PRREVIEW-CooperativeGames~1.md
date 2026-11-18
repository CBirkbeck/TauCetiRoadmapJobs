# Review of CooperativeGames (pull request #2492 at bf2aa32)

**Verdict:** accepted

**Summary.** Accepted: no statement was found false, vacuous or unsupported. Every theorem and Check was recomputed (degenerate cases included: empty player set, `v ∅ ≠ 0`, `m = 0`, `a = b`), every source locator was read at its place, and every supplier was opened at the pins. There are two small corrections (one sentence of commentary in 6.2 is false by a factor of two; five named results carry no reference) and two format notes, none blocking. Two questions of licence class and two of scope are left for the human reviewers.

## C01 — In 6.2 the range `b − a` of the marginal contributions of the baseline game is bounded by twice the oscillation of `f`, not by the oscillation

A reader who applies the bound of 6.1 with `b − a` equal to the oscillation gets a sample size too small by a factor of four. The sentence (6.2, line 1002) reads "with `b − a` at most the oscillation of `f` on the points `S.piecewise x x₀`". A marginal contribution is a difference `f(p) − f(q)` of two values of `f` at such points, so it lies in `[−osc, osc]`. Two coordinates, `x₀ = (0, 0)`, `x = (1, 1)`, `f(0,0) = 0`, `f(1,0) = f(0,1) = 1`, `f(1,1) = 0`: the oscillation is `1`, and the marginal contributions of the first coordinate are `1` (at `S = ∅`) and `−1` (at `S = {2}`), so `b − a = 2`.

The smallest change: "with `a = −ω` and `b = ω`, where `ω` is the oscillation of `f` on the points `S.piecewise x x₀`", or "with `b − a` at most twice the oscillation".

## C02 — Weber's inclusion, Ichiishi's converse, Young's characterization, the Banzhaf value and the Harsanyi dividends are named after their authors and have no entry in the References

A reader cannot check that 4.5 is Young's theorem, or 2.4 Weber's, because the only locator is "proved here" (2.3 line 365, 2.4 line 405, 4.5 line 767, 5.3 line 895), and the References list none of these authors; Bondareva is likewise named in the title of Layer 3 and cited only through Nisan et al. and Shapley. The statements themselves are sound: the proofs sketched in 2.3, 2.4 and 4.5 were checked step by step (see the board report), and 4.5 as stated, with equal treatment and marginality, is implied by the sketch.

The smallest change is to add the bibliographic entries and one clause at each place saying how the statement here differs from the original. The usual references are Weber 1988 (*Probabilistic values for games*), Ichiishi 1981 (J. Econom. Theory 25), Young 1985 (Internat. J. Game Theory 14), Bondareva 1963 (Problemy Kibernetiki 10), Banzhaf 1965 and Harsanyi 1963; I did not open these, so the theorem numbers are for the author to supply.

## N01 — The `## Provenance` section describes demonstration scripts of an external repository

It is the one passage of the README that is not about the mathematics and will date; it would sit better in the pull request description, where the same information already is.

## N02 — The module docstring of `Suggested.lean` lists some twenty supplier names that the file does not use

Only `TauCeti.IsSubmodular` occurs in a statement; the list repeats the README's supplier contracts and would be shorter as a pointer to them.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 increasing marginal contributions; classes | `|S|²` on 3; majority; constant 1; `√|S|` on 2 | marginals `2s+1`; `2 > 1`; `1+1 > 1`; `2 > √2` | true; Checks true |
| 1.2 inversion, basis, dividend criterion | majority; `unanimity {1}`; `max(|S|−1,0)`; 3000 random `d` with `d_S ≥ 0` for `|S| ≥ 2`, n ≤ 4 | dividends `1,1,1,−2`, sum `1`; `1` vs `−1` with wrong sign; `−1` at grand coalition, convex; all random cases convex | true; converse fails as the Check says |
| 2.1 core, imputations | 2 players; majority; glove; `v ∅ = 1`; empty `ι` | segment; `2·1 ≥ 3` fails; `{(1,0,0)}`; empty; `0 ≤ 1` but no efficient vector | true |
| 2.2 marginal vectors, count of orders | `|S|²`; majority; `n=3, S={2}, i=1` | `(1,3,5)`; `(0,1,0)`; one order, `1!·1! = 1` | true |
| 2.3 convex iff all marginal vectors in core | 4000 random integer games, n ≤ 4, `v ∅ = 0`; constant 1 on one player; `v ∅ = −1, v{1} = 0` | equivalence held in all (2289 convex, 1711 not); core empty, marginal `0`; marginal `1`, core `{0}` | true; `v ∅ = 0` needed, `≤ 0` not enough |
| 2.4 Weber; extreme points; hull | glove; majority; one player `v ∅ = −1`; empty `ι`; summation by parts recomputed | glove marginals `e₂, e₃, e₁×4`, core `e₁` inside; triangle vs empty; core `{0}`, marginal `1`; both sides the one empty vector | true; identity `∑ y·m = ∑(y_k − y_{k+1}) v(P_k) + y_n v(N) − y_1 v ∅` |
| 3.1 balanced weights | half-pairs on 3; `{1},{2,3}`; signed weight; empty `ι` | each player total `1`; `1`; equations hold, `−1 < 0`; no equation | true |
| 3.2 Bondareva–Shapley, all set functions | majority; `v ∅ = 1` one player; empty `ι`; `v ∅ < 0`; Tucker cases `q > 0`, `q = 0, μ > 0`, `μ = 0` | `3/2 > 1`; `w ∅ = w{1} = 1` gives `1 > 0`; both sides iff `v ∅ = 0`; `w ∅ v ∅ ≤ 0` harmless; each case yields core point or violating weight | true with `w ∅` free, as stated |
| 3.3 sharp form, `v ∅ ≤ 0` | n = 1, 3, 4; empty `ι`; one player `v ∅ = 1` | 1, 6, 42 extreme points (source: 41 proper for n = 4, plus `{N}`); extreme point `0`, `0 ≤ v ∅ ≤ 0`; inequality holds, core empty | true; hypothesis needed |
| 3.4 duality | majority; `v{1}=v{2}=1, v{12}=0`; `v ∅ = 1`; empty `ι`, `v ∅ < 0`; step `w univ < 1` | `c = 3/2` both sides; `c = 2`; first set empty; `{0}` and `{w ∅ v ∅}`, max `0`; `w univ = 1` forces `w ∅ v ∅ > 0` | true |
| 4.1 coalition and random-order formulas | majority; glove; 2 players `0,1,2,5`; random games n ≤ 5 | `1/3` each; `(2/3,1/6,1/6)`; `(2,3)`; formula = order average in all | true |
| 4.2 efficiency, desirability, duality, covariance | one player `v ∅=1, v{1}=3`; random n ≤ 5; desirability identity expanded | `2 = 3 − 1`; `∑φ = v(N) − v ∅` and dual game equal in all; `φ_j − φ_i = ∑ (w_t + w_{t+1})(v(T∪j) − v(T∪i))` | true |
| 4.3 dividend formula | majority; random n ≤ 5 | `1/2 + 1/2 − 2/3 = 1/3`; equal in all | true |
| 4.4 uniqueness on `C` | six Checks recomputed; empty `ι`; `p, q ∈ C` step | one-player `C`: Shapley `4`, `ψ = 5`; two-player `C`: Shapley `(1,2)`, `ψ = (3,0)`; equal division among non-null players treats symmetric players equally | true; both hypotheses on `C` needed |
| 4.5 Young | induction sketch at `R = ∅`, `R ≠ ∅`; equal division on `u₁`, `u₁+u₂` | players of `R` symmetric since every `d_S ≠ 0` has `S ⊇ R`; `1/2` vs `1` with equal marginals | true |
| 4.6 Shapley value in core | `|S|²`; glove; constant 1 | `(3,3,3)`; `(2/3,1/6,1/6) ∉ {(1,0,0)}`; core empty | true |
| 5.1 core of 0-1 set functions | all 0-1 set functions with `v univ = 1` for n ≤ 3 on a half-integer grid, `v ∅ = 1` and empty `ι` included | both sides agree at every grid point | true |
| 5.2 Shapley–Shubik | `[3; 2,1,1]`; `[5; 3,2,1,1]`; non-monotone example | pivots `4,1,1`; `14,6,2,2`, index `(7/12,1/4,1/12,1/12)`; pivot count `2/6` vs value `1/6` | true |
| 5.3 Banzhaf, dividend formula | majority; `[3;2,1,1]`; `[5;3,2,1,1]`; random n ≤ 5 | `1/2`; `(3/4,1/4,1/4)`; `(5/8,3/8,1/8,1/8)`; formula equal in all | true |
| 6.1 unbiasedness, Hoeffding | majority `m=1, ε=2/3`; `m=2, ε=1/2`; `m=0`; `a=b`; `a>b`; `ε=−1`; `δ=1/20` | `1/3 ≤ 0.82`; `1/9 ≤ 0.74`; RHS `2`; RHS `2`; hypothesis empty; `1 > 2e⁻¹⁰⁰`; `184.4 → 185`; exponent `(mε)²/(2m(b−a)²/4)` | true |
| 6.2 baseline game | product at `(3,5)` from `(0,0)` and `(1,1)`; `max`; exchange via dual; C01 example | `(15/2,15/2)`; `(6,8)`; `(1,3)`; `v'(S) = −v*(S)`; marginals `1, −1`, oscillation `1` | statements true; one sentence of commentary false (C01) |

- Source locators checked against the text: 28 of 28 (ShapleyP295 7, ShapleyRM4571 6, ShapleyRM4601 6, AGT 5, MTH+13 2, SK10 1, SN19 1), all fifteen sampled sections included; 4.5 and 5.3 cite no source.
- Library declarations opened at the pins: 4 Tau Ceti (`TauCeti/Order/Lattice/Submodular.lean` 43, 67, 80; `TauCeti/Geometry/Convex/Cone/Alternative.lean` 144; `TauCeti/Data/Finset/Basic.lean` 106, 442) and 16 Mathlib, each at the file the README names; all exist with the stated hypotheses.
- Cross-roadmap citations resolved: 2 (GraphConnectivityAndFlows 4.1 and RegretMinimizationAndEquilibria, both on main, both as scope boundaries, neither a supplier).
- Dependency check: `depcheck: 215 roadmaps, 2306 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/CooperativeGames/Suggested.lean`: 22 `sorry` warnings and nothing else; 10 definitions with real bodies, no `set_option`, imports `Mathlib` and one `TauCeti` module.
- Signatures: all 32 elaborated types compared with the README; the four dropped instance binders are `DecidableEq`/`Fintype` instances the types do not need; nothing changed.
- One-tactic probe (`rfl`, `simp`, `simp` with the definitions unfolded) on a copy of the file: none of the 22 theorems closes; no padding. All headline theorems of the Summary are stated.
- Duplication: no declaration on Shapley values, cores, balanced weights or unanimity games in the pinned Mathlib or Tau Ceti; no other roadmap, open or on main, states them.

Overlap check: read RegretMinimizationAndEquilibria, MathematicalStatisticsFoundations, GraphConnectivityAndFlows; nothing shared (submodularity is owned by GraphConnectivityAndFlows 4.1 and consumed through Tau Ceti; noncooperative games by RegretMinimizationAndEquilibria).

Source independence: 12 passages compared with 7 sources, none shared; largest share ShapleyP295, 7 of 28 locators; contents compared with ShapleyP295 (sections 1–6) and ShapleyRM4571 (sections 1–3): independent.

Research link: Layers 2–4 state the results of Shapley 1953 (value), Bondareva 1963 and Shapley 1967 (balancedness), Shapley 1971 (cores of convex games); Layer 6 is the estimator analysed by Štrumbelj–Kononenko 2010 and Maleki et al. 2013 and the baseline attribution of Sundararajan–Najmi 2020. Rests on the README's references and the texts read.

## Not verifiable

- The attributions to Weber, Ichiishi and Young (2.3, 2.4, 4.5): the README cites no text for them and none was opened; the statements were checked through the proof sketches instead.

## Source issues

- **Error** in AGT at Definition 15.25 and Theorem 15.26, printed page 404: the source says the Shapley value is the unique value satisfying anonymity, dummy and additivity, with no efficiency axiom; it should be anonymity, dummy, additivity and budget balance, since the zero value satisfies the three; affects nothing.

## For the human reviewers

- **Licence.** The three RAND papers (ShapleyP295, ShapleyRM4571, ShapleyRM4601) were read from Internet Archive snapshots of RAND's own freely downloadable PDFs, because RAND's site refused the fetch; I classed them as publisher-open.
- **Licence.** Nisan et al. (AGT) was read from a copy on a university course page, classed institutional; the publisher's free online edition was not found at its former address.
- **Scope.** All statements are over `ℝ` (README line 49 excludes other ordered fields), although the suppliers `TauCeti.IsSubmodular` and Tucker's lemma are stated over general ordered fields and Layers 1, 4 and 5 use no analysis.
- **Scope.** Layer 6 rests on two arXiv preprints and one journal article from machine learning (MTH+13, SK10, SN19); the README's Provenance section ties it to the author's own repository.
