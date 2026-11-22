# Review of SubadditiveAndMultiplicativeErgodicTheorems (pull request #2973 at 303f783)

**Verdict:** needs changes

**Summary.** Needs changes, for one mathematical finding: the moment condition of 7.2 (finite mean of the minimum of `2d` copies of the edge weight implies `E T(0, e₀) < ∞`) is false for `d = 1`, which the section admits and its own Check computes. Every other statement survived the degenerate-case pass, `Suggested.lean` elaborates with `sorry` as its only warning, and no sorried theorem closes in one tactic. There are five small corrections and three format notes, none blocking. None of the six cited books could be read from a legal place, so no locator, wording or arrangement was compared with the sources; that is left to the human reviewers.

## R01 (P2) — The moment condition of 7.2 is false in dimension one

An implementer who takes the prose target "Moment condition" of 7.2 (line 601) as stated must prove a false statement for `d = 1`, a case the section admits ("The edges of `ℤ^d`, `d ≥ 1`", line 586) and `Suggested.lean` admits (`[NeZero d]`). The target says that `E T(0, e₀) < ∞` holds "more generally when the minimum of `2d` independent copies of `τ` has finite mean".

For `d = 1` the first Check of the same section gives `T(0, e₀) = τ_0`, so `E T(0, e₀) = E τ`. Take `P(τ > t) = t^{−2/3}` for `t ≥ 1`: then `E τ = ∫ P(τ > t) dt = ∞`, while the minimum of two copies has tail `t^{−4/3}` and mean `1 + ∫_1^∞ t^{−4/3} dt = 4 < ∞`. The hypothesis holds and the conclusion fails. The implication needs `2d` edge-disjoint paths from `0` to `e₀`, which exist exactly when `d ≥ 2`.

The smallest change: restrict the second clause to `d ≥ 2` ("and, for `d ≥ 2`, more generally when …"), and add the instance above as a Check that for `d = 1` the condition is `E τ < ∞`.

## C01 — Mathlib at the pin does topologise projective space

In the prose target "Furstenberg's formula" of 6.3 (lines 525–527) the README says projective space is one "which Mathlib does not topologise" and therefore states the formula on the unit sphere with the antipodal identification. The pinned Mathlib has `Projectivization.instTopologicalSpace` (the quotient topology on `ℙ K V`) with `isOpenQuotientMap_mk'` and `continuous_map`, in `Mathlib/Topology/Algebra/Projectivization.lean`, line 44. An implementer following the README would build a second carrier for the same space. State the formula for Borel probability measures on `ℙ ℝ E` and correct the sentence; what Mathlib lacks, if anything, is the Borel σ-algebra instance, and the sentence should say that instead.

## C02 — The target "Other directions" of 7.2 states no moment hypothesis

The target (line 604) asserts that `lim T(0, n x)/n` exists almost surely and is constant "for every `x ∈ ℤ^d`", with no hypothesis, while the bullet before it says that without the moment condition `limsup T(0, n e₀)/n = ∞` almost surely; at `x = e₀` the two can agree only if the limit is `+∞`, which the stated bound `μ(x) ≤ ‖x‖₁ E τ` and the subadditivity are not written for. Say under which hypothesis it is claimed (for instance `E T(0, e_i) < ∞` for every `i`, which by symmetry is the hypothesis of the time-constant target).

## C03 — The Check of 5.1 cannot tell the definition from the `liminf` variant it names

The Check (lines 381–384) says that "a definition by `liminf` … gets the middle range wrong". For the constant generator `diag(2, 1/2)` every vector has an exact rate (`log 2` off the line `ℝ e₂`, `−log 2` on it), so `liminf` and `limsup` agree and the `liminf` variant gives the same `V_t = ℝ e₂` on `−log 2 ≤ t < log 2`. Drop the words "by `liminf` or", or add an instance with oscillating growth where the two differ.

## C04 — BernoulliPercolation does not own Kesten's theorem `p_c(ℤ²) = ½`

Scope and ownership (line 705) says that Kesten's theorem `p_c(ℤ²) = ½` belongs to BernoulliPercolation. That roadmap, at the head of its open pull request, lists the theorem under "Not treated here" (its README, line 622) and proves only `1/(2d − 1) ≤ p_c(d)` and `p_c(d) ≤ 2/3` for `d ≥ 2`. Nothing here consumes the theorem, so it is enough to delete it from the sentence, keeping the critical probability, which BernoulliPercolation §1.3 does define.

## C05 — The first Check of 2.1 points at the wrong sections

The Check (line 157) calls `γ = ⊥` "the case the `EReal` statements of 2.4–2.5 are written for". 2.4 assumes `γ > ⊥` and its limit is real; the `EReal` statements are 2.3 and 2.5. Write "2.3 and 2.5".

## N01 — Pull-request numbers and process words in the README

Mathlib pull-request numbers stand in "Mathlib pull requests followed" and "Prior formalization" (lines 763–766, 797–798), with "open", "merged after the pinned Mathlib" and "when it lands"; neighbouring roadmaps are called "of the open pull request" in the overview and in Scope (lines 50–55, 695–708). A reader a year on cannot use these; name the roadmaps and the Mathlib results without their state.

## N02 — `Suggested.lean`: an empty closing section and an unspecific docstring

The last section comment, "Library declarations named in the README" (line 540), has only `#check` lines under it. The module docstring says the other targets are "stated there in prose" without naming which headline is not statable and what it lacks (Furstenberg's formula: Borel measures on projective space); one sentence would do.

## N03 — "Rotations alone" in the Checks of 6.3 needs an irrational angle

The third Check of 6.3 (line 542) is true for a rotation by an irrational multiple of `π`, as in the Check of 6.2; a quarter turn alone permutes the two axes. Add the qualifier.

## Questions for the author

- Does Benoist–Quint Thm 4.31 state the inequality `λ_0 > (1/d) ∫ log |det g| dν` for laws on `GL`, or positivity for determinant `±1` with the general form obtained by normalising? The Lean statement is correct either way (normalising by `|det g|^{−1/d}` reduces one to the other); I could not read the book to check what the locator supports.
- Does Viana's Thm 6.8 give the formula of 6.3 for every stationary measure under strong irreducibility, or as a maximum over stationary measures in general? I could not read the book.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Fekete in `EReal` | `u n = −n²`; `u 0` | `u n/n = −n → ⊥ = inf`; `u 0 ≥ 0` forced, `n = 0` term excluded by `0 < n` | true | none |
| 2.1 subadditive process, Birkhoff sums | `f n = −n²`; `S_{m+n}φ = S_mφ + S_nφ∘T^m` | `−(m+n)² ≤ −m²−n²`; equality for sums; `γ = ⊥` | true | C05 |
| 2.2 expectations | integrable `f n`, `n ≥ 1` | `∫f_n∘T^m = ∫f_n`; `a_n = ∫f_n` subadditive; iInf over empty index is `⊤` in `EReal` | true | none |
| 2.3 Kingman a.e. | `f n = −n²`; `f n = nφ`, `T = id` | limits `⊥` and `φ`; `g ≠ ⊤`, `g⁺` integrable in both | true | none |
| 2.4 `L¹` form | `T = id` on two points, `φ = (0, 2)` | `g = φ`, `∫g = 1 = γ`; `γ > ⊥` in scope as `hγ` | true | none |
| 2.5 ergodic case | same non-ergodic instance; `γ = ⊥` route | limit `φ ≠ γ = 1` without ergodicity; `inf_K γ_K = inf_n (1/n)∫f_n` by monotone convergence | true | none |
| 3.1 `wedgeNorm` | body against EigenvalueAndSingularValueInequalities §2.4 | same expression `‖LinearMap.toContinuousLinearMap (exteriorPower.map k ·)‖` at that head | agrees | none |
| 3.2 consequences | `diag(3,2,1)`; nilpotent; `E = 0`; `k > d` | `3, 6, 6`; `1, 0`; `k=0`: `1 = det` on zero space; `1·0 ≤ 0²` | true | none |
| 4.1 cocycle, subadditivity | constant `A = B`; `k > d`; `k = 0` | `Bⁿ`; `log 0 = 0` on both sides; `log 1 = 0` | true | none |
| 4.2 Furstenberg–Kesten, extremes | `diag(2,1/2)`; Jordan block `n = 10⁶`; `d = 0` | `±log 2`; `1.3816·10⁻⁵`; all sums `0` | true | none |
| 4.3 order, sum, invariance | `2·id` on `ℝ²`; `d = 0`; index `i ≥ d` | sum `2 log 2 = log det`; empty sum `0 = log 1`; junk exponents still invariant | true | none |
| 5.1 slow subspace | `diag(2,1/2)`; `liminf` variant | `V_t = 0, ℝe₂, ℝ²`; `liminf` variant gives the same | true; Check commentary wrong | C03 |
| 5.2 one-sided theorem, singular values | `diag(2,1/2)`; Jordan block; `d = 0` | rates `log 2`, `−log 2`; `dim V_t = 0,1,2`; rate `0`, `V_0 = ℝ²` | true | none |
| 5.3 two-sided theorem, backward exponents | `T = id`, `diag(2,1/2)`; `t` not an exponent | backward cocycle `A_n(T⁻ⁿx)⁻¹`; `E_{±log 2} = ℝe₁, ℝe₂`; `E_t = 0`; `σ_i(M⁻¹) = 1/σ_{d−1−i}(M)` | true | none |
| 6.1 i.i.d. exponents | two diagonal matrices; `d = 0` | `½ log(3/2) = 0.2027`; simulation `0.199`; `c 0 = 0` | true | none |
| 6.2 strong irreducibility | `{diag(2,1/2), J}`; irrational rotation; no invertible element | axes permuted; `kθ ∉ πℤ`; false for `d ≥ 2`, vacuous for `d = 1` | determines the notion | N03 |
| 6.3 Furstenberg | `{D, J}`; `{D, R_{π/4}}`; singular support points | simulation `5·10⁻⁴`; `0.172`; `0^{−1/d} = 0` so they map to `0` | true as stated | C01, questions |
| 7.1 range | `p = 0.7` walk; shift indices | simulation `0.4018` against `0.4`; `1_{noReturn}∘shift^j = {S_{j+k} ≠ S_j}` | true | none |
| 7.2 first-passage percolation | `d = 1`, tail `t^{−2/3}`; constant weights | `Eτ = ∞`, `E min = 4`; `T = nc` | moment target false at `d = 1` | R01, C02 |
| 7.3 longest common subsequence | `[0,1,0]`, `[1,0,1]`; 2 and 4 letters, `n = 800`; real `⨆` at `n = 0` | `2`; `0.801`, `0.648`; junk `0 ≤ sup` since terms `≥ 0` | true | none |

- Source locators checked against the text: 0 of 64 (no text readable, see below).
- Library declarations opened at the pin: `Projectivization.instTopologicalSpace` (`Mathlib/Topology/Algebra/Projectivization.lean:44`), `Subadditive.tendsto_lim` (`Mathlib/Analysis/Subadditive.lean:155`), `Measure.support` (`Mathlib/MeasureTheory/Measure/Support.lean:59`), `LinearMap.singularValues` and `singularValues_antitone` (`Mathlib/Analysis/InnerProductSpace/SingularValues.lean:95, 142`), `LinearMap.norm_apply_le_singularValues_mul_norm` (`TauCeti/Analysis/InnerProductSpace/SingularValues.lean:358`), `TauCeti.Probability.shift` (`TauCeti/Probability/Process/PathLaw/Basic.lean:216`), `ergodic_shift_infinitePi_const` (`TauCeti/Probability/Ergodic/BernoulliShift.lean:63`); the 17 `#check` lines elaborate.
- Cross-roadmap citations resolved: ProbabilisticAndMetricNumberTheory §4.1 on main (Birkhoff with conditional-expectation limit); EigenvalueAndSingularValueInequalities §2.4 at its open head (both statements, same expression); the scope claims about ClassicalErgodicTheory, HyperbolicDynamicsAndThermodynamicFormalism (line 942), RandomWalkFluctuationTheory, MarkovChainsAndRenewal; BernoulliPercolation (C04).
- Duplication: the pinned Mathlib and Tau Ceti contain no subadditive process, Kingman theorem, Lyapunov exponent or Oseledets statement and no almost-everywhere Birkhoff theorem; no roadmap on main or open states Kingman, Furstenberg–Kesten, Oseledets, first-passage percolation, the range theorem or longest common subsequences.
- Dependency check: `depcheck: 154 roadmaps, 1769 edges, 0 problem(s)`; no change outside the roadmap folder.
- Elaboration of `Suggested.lean`: 33 `sorry` warnings, no error, no `set_option`, no sorried data. One-tactic probe (`rfl`, `simp`, `infer_instance`) on a copy: 0 of 33 theorems close.
- Signatures: the 13 declarations flagged as losing a section binder are definitions that do not need it (`cocycle`, `slowSubspace`, `backwardGenerator`, `oseledetsSpace`, `IsStronglyIrreducible`, `rangeCard`, `noReturn` and the like); every theorem keeps `FiniteDimensional`, the measurable structures and its hypotheses.
- Pull request text against the head: 52 declarations (33 theorems, 19 definitions), imports, suppliers and boundaries agree with the head.

Overlap check: read BernoulliPercolation, ClassicalErgodicTheory, MartingaleCentralLimitTheorem, SeriesOfIndependentRandomVariables, InfinitelyDivisibleLawsAndTriangularArrays (the last three by search of their texts for this roadmap's objects), DimerModelsAndLozengeTilings, Exchangeability (likewise); nothing shared. Birkhoff's theorem: owner ProbabilisticAndMetricNumberTheory §4.1; exterior-power norm formula: owner EigenvalueAndSingularValueInequalities §2.4; both consumed, not restated.

Source independence: 0 passages compared with 0 sources (none of the six texts could be read); largest share Viana 2014, 23 of 64 locators; contents not compared with Viana 2014 (table of contents not read).

Research link: Layers 4–6 state the Furstenberg–Kesten, Oseledets and Furstenberg theorems on which Pesin theory, one-dimensional Anderson localisation and the limit theorems of Benoist–Quint (2016) build; Layer 7 underlies the shape theorem of first-passage percolation. Rests on the README's Downstream consumers and Beyond sections.

## Not verifiable

- Viana 2014, Viana–Oliveira 2016, Durrett 2019, Barreira 2017: no legal copy found by the sources service (publisher pages only; a copy of Durrett on a university host was refused as not shown to be an author's page). All sampled locators into them (2.1–2.5, 3.1–3.2, 4.1, 4.3, 5.1–5.3, 6.3, 7.2) are unverified.
- Benoist–Quint 2016 and Kallenberg 2021: paywalled, recorded as uncertified; locators for 6.2, 6.3 and 2.2–2.5 unverified.
- The four-letter Chvátal–Sankoff value `≈ 0.64` of the Check of 7.3: a simulation at `n = 800` gives `0.648`; the limit itself was not computed.

## Source issues

- none

## For the human reviewers

- **Not tested.** Viana 2014 has the largest share of locators (23 of 64); neither its text nor its table of contents could be read, so wording and arrangement were not compared with it or with the other five books.
- **Licence.** The README's "Prior formalization" (lines 790–796) names the author's own repository lean-CKMA (Apache 2.0) as proving Kingman's `L¹` form; `Suggested.lean` was not compared with that repository.
- **Scope.** All six sources are published monographs or textbooks (Cambridge, Springer, Birkhäuser); the README names Pesin theory and Anderson localisation as consumers.
