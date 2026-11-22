# Review of SubadditiveAndMultiplicativeErgodicTheorems (pull request #2973 at 6cc86f7)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 82 lines changed since `303f783` finds the one earlier finding repaired (the moment condition of 7.2 is now restricted to `d ≥ 2`, with the `d = 1` counterexample as a Check) and all five earlier small corrections repaired, with no new problem in the changed passages. `Suggested.lean` elaborates with `sorry` as its only warning. Two format notes remain, neither blocking. As before, none of the six cited books could be read from a legal place, so locators, wording and arrangement were not compared with the sources; that is left to the human reviewers.

## N01 — Mathlib pull-request numbers remain in the README

"Mathlib pull requests followed" (lines 775–776) and "Prior formalization" (lines 809–810) still identify two Mathlib results only by pull-request number. The state words ("open", "merged", "when it lands") and the "open pull request" labels on neighbouring roadmaps are gone. A reader a year on is better served by the names of the results (the maximal ergodic theorem, the pointwise ergodic theorem for normed spaces) with the numbers dropped or kept only as a parenthesis in "Prior formalization".

## N02 — The module docstring of `Suggested.lean` still does not say which prose headline is left unstated and why

The docstring (lines 10–15) says the README's other headlines are "stated there in prose" without naming one. Since 6.3 now says how Furstenberg's formula is to be stated (Borel probability measures on `ℙ ℝ E` for `borel (ℙ ℝ E)`, action by `Projectivization.map`), one sentence would do: that the formula is left in prose because Mathlib has no measurable structure on `Projectivization` at the pin.

## Questions for the author

- Does Benoist–Quint Thm 4.31 state `λ_0 > (1/d) ∫ log |det g| dν` for laws on `GL`, or positivity for determinant `±1` with the general form obtained by normalising? The Lean statement is correct either way; the book could not be read.
- Does Viana's Thm 6.8 give the formula of 6.3 for every stationary measure, or as a maximum over stationary measures? The statement for every stationary measure under (strong) irreducibility is true (Furstenberg–Kifer), but I could not check that the locator supports that form.

## Previous findings

- R01 — repaired: 7.2 now reads "and, for `d ≥ 2`, more generally when the minimum of `2d` independent copies of `τ` has finite mean", and a Check gives the `d = 1` counterexample with mean `1 + 3 = 4`.
- C01 — repaired: 6.3 states the formula on `ℙ ℝ E` with `Projectivization.map`, and says Mathlib gives "the quotient topology (`Projectivization.instTopologicalSpace`) but no σ-algebra"; both verified at the pin.
- C02 — repaired: "Other directions" now opens "if `E T(0, e₀) < ∞` (by the symmetry of the lattice, the same as `E T(0, e_i) < ∞` for every `i`), then for every `x ∈ ℤ^d` …".
- C03 — repaired: the Check of 5.1 now says only "a definition by the expanded direction gets the middle range wrong".
- C04 — repaired: Scope reads "Bernoulli percolation and its critical probability belong to BernoulliPercolation (§1.3)"; that §1.3 defines `criticalProb d`.
- C05 — repaired: "the `EReal` statements of 2.2, 2.3 and 2.5"; all three are stated in `EReal`.
- N01 — partly repaired: process words and "open pull request" labels removed; the numbers #42078 and #34031 remain (N01 above).
- N02 — partly repaired: the closing section comment now explains the `#check` lines; the module docstring is unchanged (N02 above).
- N03 — repaired: "A law carried by rotations, one of them by an irrational multiple of `π`: strongly irreducible but bounded, and `λ_0 = 0`."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 7.2 moment condition, first clause for `d ≥ 2` | `2d` edge-disjoint paths of lengths `k_i ≤ K` | `P(min_i sum_i > t) ≤ ∏ k_i P(τ > t/k_i) ≤ K^{2d} P(τ > t/K)^{2d}`, integrable when `E min < ∞`; `d = 1`: one path only | true | none |
| 7.2 moment condition, converse clause "in every dimension" | `Y_n` = least weight at `n e₀`; `d = 1` | `T(0, n e₀) ≥ Y_n`; `Y_{2n}` i.i.d., `∑ P(Y_{2n} > 2Cn) = ∞`, so `limsup ≥ C` for all `C`; `d = 1`: `E min = ∞ ⇒ E τ = ∞`, sums `/n → ∞` | true | none |
| 7.2 new Check, `d = 1` | `P(τ > t) = t^{−2/3}`, `t ≥ 1` | `E τ = 1 + ∫_1^∞ t^{−2/3} = ∞`; min tail `t^{−4/3}`, mean `1 + 3 = 4`; `T(0, e₀) = τ_0` | true | none |
| 7.2 other directions | `x = e₀`; `x = 0`; `E τ = ∞` with `E T(0,e₀) < ∞` | `E T(0,x) ≤ ‖x‖₁ E T(0,e₀) < ∞`; `μ(0) = 0`; bound `μ(x) ≤ ∞` trivial | true under the new hypothesis | none |
| 6.3 Furstenberg's formula on `ℙ ℝ E` | `ν` on invertibles (Layer 6 standing); `diag(2,1/2)` alone (not irreducible) | `Projectivization.map` needs injectivity: supplied; reducible case: `η = δ_{[e₂]}` gives `−log 2 ≠ λ_0`, excluded by the hypothesis | true as stated | none |
| 6.3 Check, rotations | irrational angle `θ`; quarter turn alone | `kθ ∉ πℤ`, no finite family of lines invariant; norms `1`, `λ_0 = 0`; quarter turn permutes axes, now excluded | true | none |
| 5.1 Check | `diag(2, 1/2)`, expanded-direction variant | `V_t = ℝe₂` on `[−log 2, log 2)`; variant gives `ℝe₁` | Check separates | none |
| 2.1 Check | `f n = −n²` in 2.2, 2.3, 2.5 | `∫f_n/n = −n → ⊥`; `f_n/n → ⊥`; `γ = ⊥` | true | none |

The rows for the untouched statements stand as in the previous review, of `303f783`.

- Source locators checked against the text: 0 (no text readable; the changed passages cite Durrett p. 302–303 and Viana Thm 6.8).
- Library declarations opened at the pin: `Projectivization.instTopologicalSpace` (`Mathlib/Topology/Algebra/Projectivization.lean:44`), `Projectivization.map` (`Mathlib/LinearAlgebra/Projectivization/Basic.lean:209`, an injective semilinear map), `borel`; no `MeasurableSpace` or `BorelSpace` instance for `Projectivization` anywhere in the pinned Mathlib or Tau Ceti. The 20 `#check` lines elaborate.
- Cross-roadmap citations resolved: BernoulliPercolation §1.3 at its open head (defines the critical probability, README line 108); EigenvalueAndSingularValueInequalities §2.4 at its open head (norm formula and submultiplicativity, line 201); ProbabilisticAndMetricNumberTheory and MarkovChainsAndRenewal on main; ClassicalErgodicTheory, HyperbolicDynamicsAndThermodynamicFormalism and RandomWalkFluctuationTheory exist as open roadmaps.
- Dependency check: `depcheck: 136 roadmaps, 1515 edges, 0 problem(s)`; the roadmap is not in the merge order yet and is placed after its last supplier. No change outside the roadmap folder.
- Elaboration of `Suggested.lean`: 33 `sorry` warnings, no error, no `set_option`, no sorried data. The diff changes no theorem statement (three `#check` lines and a section comment), so the one-tactic probe and the signature comparison of the previous review stand.
- Automatic checks: all pass except the one on pull-request numbers in the README (N01).
- Pull request text against the head: the description's suppliers, imports, counts (52 declarations, 33 `sorry`) and boundaries agree with this head; the changes since `303f783` alter nothing it states.

Overlap check: read BernoulliPercolation (§1.3 and its scope), ClassicalErgodicTheory, MartingaleCentralLimitTheorem, SeriesOfIndependentRandomVariables, InfinitelyDivisibleLawsAndTriangularArrays, DimerModelsAndLozengeTilings, Exchangeability (as in the previous review; the diff adds no object); nothing shared. Birkhoff's theorem: owner ProbabilisticAndMetricNumberTheory §4.1; exterior-power norm formula: owner EigenvalueAndSingularValueInequalities §2.4; critical probability: owner BernoulliPercolation §1.3, not consumed.

Source independence: changed passages only; 0 passages compared with 0 sources (none of the six texts could be read); largest share Viana 2014, 23 of 64 locators; contents not compared with Viana 2014 (table of contents not read; the diff adds, removes and reorders no layer).

Research link: Layers 4–6 state the Furstenberg–Kesten, Oseledets and Furstenberg theorems on which Pesin theory, one-dimensional Anderson localisation and the limit theorems of Benoist–Quint (2016) build; Layer 7 underlies the shape theorem of first-passage percolation. Rests on the README's Downstream consumers and Beyond sections.

## Not verifiable

- Viana 2014, Viana–Oliveira 2016, Durrett 2019, Barreira 2017: no legal copy was available; the locators of the changed passages (Durrett p. 302 and p. 303 in 7.2; Viana Thm 6.8, p. 102 in 6.3) and all sampled locators into these books are unverified.
- Benoist–Quint 2016 and Kallenberg 2021: paywalled, recorded as uncertified; locators for 6.2, 6.3 and 2.2–2.5 unverified.
- The author's repository lean-CKMA at commit `f4bd822`, named in "Prior formalization": not opened.

## Source issues

- none

## For the human reviewers

- **Not tested.** Viana 2014 has the largest share of locators (23 of 64); neither its text nor its table of contents could be read, so wording and arrangement were not compared with it or with the other five books.
- **Licence.** The README's "Prior formalization" (lines 802–808) names the author's own repository lean-CKMA (Apache 2.0, commit `f4bd822`) as proving Kingman's `L¹` form; `Suggested.lean` was not compared with that repository.
- **Scope.** All six sources are published monographs or textbooks (Cambridge, Springer, Birkhäuser); the README names Pesin theory and Anderson localisation as consumers.
