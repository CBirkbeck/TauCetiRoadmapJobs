# Review of SubadditiveAndMultiplicativeErgodicTheorems (pull request #2973 at 4cb7ac2)

**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 66 lines changed since `6cc86f7` finds both remaining format notes of the previous review repaired and no new problem in the changed passages (links to four roadmaps on main, a sharper Benoist–Quint locator in 6.3, the renamed "Mathlib results followed" contract, and the module docstring of `Suggested.lean`). No finding, no small correction and no format note. As before, none of the six cited books could be read from a legal place, so locators, wording and arrangement were not compared with the sources; that is left to the human reviewers.

## Questions for the author

- Does Viana's Thm 6.8 give the formula of 6.3 for every stationary measure, or as a maximum over stationary measures? The statement for every stationary measure under strong irreducibility is true (Furstenberg–Kifer), but the book could not be read, so I could not check that the locator supports that form.
- The locator of Furstenberg's theorem in 6.3 now reads "Thm 4.31 with (4.13)–(4.14), p. 70". Are (4.13)–(4.14) the displays that pass from determinant `±1` to the general normalised form `λ_0 > (1/d) ∫ log |det g| dν`? The statement is correct either way (row 1 of the table); the book is paywalled.

## Previous findings

- N01 — repaired: the contract is now "Mathlib results followed" and names the theorems; the two Mathlib pull-request numbers survive only as a parenthesis in "Prior formalization" (line 814), the form the previous note offered.
- N02 — repaired: the module docstring now says "Furstenberg's formula in 6.3, is left in prose because the pinned Mathlib has no measurable structure on the projective space `ℙ ℝ E`"; verified at the pin.

The previous review had no finding (R) and no small correction (C) open.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 6.3 Furstenberg, `λ_0 > (1/d) ∫ log |det g| dν` (locator changed) | `ν` on `c·SL(d)`; rotations by irrational angle; `d = 1` | scaling: both sides shift by `log |c|`; rotations: `0 > 0` fails, excluded (bounded); `d = 1`: `λ_0 = ∫ log |g|`, equality, excluded by `d ≥ 2` | true as stated | none |
| Contract from EigenvalueAndSingularValueInequalities §2.4 (reworded with a link) | `A = diag(2, 1/2)`, `k = 0, 1, 2, 3` | `‖⋀ᵏA‖ = 1, 2, 1, 0`; products of singular values `1, 2, 2·½ = 1, 0`; supplier states "both sides `1` at `k = 0` and `0` beyond the rank" | agrees with the supplier's §2.4 on main | none |
| Module docstring: no measurable structure on `ℙ ℝ E` at the pin | search of pinned Mathlib and Tau Ceti for a `MeasurableSpace` or `BorelSpace` instance on `Projectivization` | 0 hits; `Projectivization.instTopologicalSpace` at `Mathlib/Topology/Algebra/Projectivization.lean:44` | true | none |
| "Mathlib results followed" | does any statement depend on the Mathlib theorem? | Birkhoff is consumed from ProbabilisticAndMetricNumberTheory §4.1 (`birkhoff_pointwise`, conditional-expectation limit, on main); the sentence changes proof routes only | consistent | none |

The diff changes no theorem statement; the rows for the untouched statements stand as in the previous review, of `6cc86f7`.

- Source locators checked against the text: 0 (no text readable; the one changed locator is Benoist–Quint Thm 4.31 with (4.13)–(4.14), p. 70, settled as uncertified; no restatement of it in the sources cache).
- Library declarations opened at the pin: `Projectivization.instTopologicalSpace` (`Mathlib/Topology/Algebra/Projectivization.lean:44`); no measurable-space instance on `Projectivization` in either library. The 20 `#check` lines elaborate.
- Cross-roadmap citations resolved, all on main: EigenvalueAndSingularValueInequalities §2.4 "Exterior powers" (README line 205); BernoulliPercolation §1.3 (line 107, defines `criticalProb d`); ProbabilisticAndMetricNumberTheory §4.1 (line 4586, `birkhoff_pointwise`); ClassicalErgodicTheory (Ornstein–Weiss lemma at line 1286; no Kingman or Lyapunov target); MarkovChainsAndRenewal. The four new relative links point at folders that exist on main. HyperbolicDynamicsAndThermodynamicFormalism and RandomWalkFluctuationTheory are named as neighbours only, not suppliers.
- Dependency check: `depcheck: 106 roadmaps, 1217 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `Suggested.lean`: 33 `sorry` warnings, no error; no `set_option`, no sorried data; imports unchanged. The diff touches the module docstring only, so the one-tactic probe and the signature comparison of the earlier reviews stand.
- Automatic checks: all pass except the one on pull-request numbers in the README (set aside below).
- Pull request text against the head: the description's suppliers ("On main" for ProbabilisticAndMetricNumberTheory §4.1 and EigenvalueAndSingularValueInequalities §2.4), imports, counts (52 declarations, 33 `sorry`) and boundaries agree with this head; the changes since `6cc86f7` alter nothing it states.

Overlap check: read ClassicalErgodicTheory, BernoulliPercolation, GibbsMeasuresAndTheIsingModel (main, by vocabulary), MartingaleCentralLimitTheorem, SeriesOfIndependentRandomVariables, HyperbolicDynamicsAndThermodynamicFormalism (open, as in the previous reviews; the diff adds no object); nothing shared. Birkhoff's theorem: owner ProbabilisticAndMetricNumberTheory §4.1; exterior-power norm formula: owner EigenvalueAndSingularValueInequalities §2.4; critical probability: owner BernoulliPercolation §1.3, not consumed. The third list (results and headings) is empty.

Source independence: changed passages only; 0 passages compared with 0 sources (none of the six texts could be read); largest share Viana 2014, 23 of 64 locators; contents not compared with Viana 2014 (table of contents not read; the diff adds, removes and reorders no layer).

Research link: Layers 4–6 state the Furstenberg–Kesten, Oseledets and Furstenberg theorems on which Pesin theory, one-dimensional Anderson localisation and the limit theorems of Benoist–Quint (2016) build; Layer 7 underlies the shape theorem of first-passage percolation. Rests on the README's Downstream consumers and Beyond sections.

## Not verifiable

- Benoist–Quint 2016: paywalled, recorded as uncertified; the changed locator "Thm 4.31 with (4.13)–(4.14), p. 70" and the other locators for 6.2 and 6.3 are unverified. The sources cache holds no restatement of Thm 4.31.
- Kallenberg 2021: paywalled, recorded as uncertified; locators for 2.2–2.5 unverified.
- Viana 2014, Viana–Oliveira 2016, Durrett 2019, Barreira 2017: no legal copy was read in this or the earlier rounds; all sampled locators into these books are unverified.
- The author's repository lean-CKMA at commit `f4bd822`, named in "Prior formalization": not opened.

Automatic checks set aside as false positives: the rule against pull-request numbers in the README flags line 814, where two Mathlib pull-request numbers stand in a parenthesis of "Prior formalization" to identify prior work in another project; they are not references to this project's process, and the previous review offered exactly this form.

## Source issues

- none

## For the human reviewers

- **Not tested.** Viana 2014 has the largest share of locators (23 of 64); neither its text nor its table of contents could be read, so wording and arrangement were not compared with it or with the other five books.
- **Licence.** The README's "Prior formalization" (lines 806–812) names the author's own repository lean-CKMA (Apache 2.0, commit `f4bd822`) as proving Kingman's `L¹` form; `Suggested.lean` was not compared with that repository.
- **Scope.** All six sources are published monographs or textbooks (Cambridge, Springer, Birkhäuser); the README names Pesin theory and Anderson localisation as consumers.
