# Review of StatisticalLearningTheory (pull request #2515 at 0a66c85)

**Verdict:** accepted

**Summary.** Accepted: the folder is unchanged since the review that accepted it, and this round read the pull request's title and description against the head; they describe the change correctly except for one sentence about the earlier formalization. The file elaborates with 49 `sorry` warnings and nothing else, the dependency check reports no problem, and the numerical claims of the description were recomputed. There are three small corrections (two carried over, one on the description) and two format notes, none blocking. The two points for the human reviewers stand: the most-cited source could not be read, and the Lean file was not compared with the author's earlier formalization.

## C01 — The description says parts of every layer are formalized in lean-CKSD, and the README's own account names nothing from Layers 3 and 8

The description's paragraph on prior formalization opens "Parts of every layer are formalized in `CKSD/Learning/`". The README's section "Prior formalization" (lines 1632–1648) lists what that project proves: Rademacher bounds, conformal coverage, the Bayes and surrogate results, a margin bound, stability, contraction, privacy, AdaBoost, ridge and `k`-means, and the nearest-neighbour results. Nothing in the list belongs to Layer 3 (VC dimension, PAC learnability, sample complexity, no free lunch) or to Layer 8 (fairness, covariate and label shift), and the description's own enumeration in the next sentence names nothing from them either. The file names shown in the public listing of `CKSD/Learning/` and its subfolders `Generalization/` and `Privacy/` give no evident home for them (I did not open the files). A reader would take the sentence to mean that a formal model exists for each layer.

Either say "Parts of Layers 1, 2 and 4–7 are formalized", or, if Layer 3 and Layer 8 results are there, name them in the description and in the README's list.

## C02 — The proof route of 3.4 points at the finite-dimensional lower bound, and the infinite-dimensional one it needs assumes measurable singletons that 3.4 does not

Carried over unchanged. The route of 3.4 (line 729) says realizable learnability with infinite dimension "contradicts 3.3 with `d` larger than `m(ε, δ)/c · ε`". The sample-complexity bound of 3.3 is for finite `d`; the input is the bullet of 3.3 on infinite VC dimension, whose Lean form `exists_lintegral_classificationError_ge_of_vcDim_eq_top` assumes `MeasurableSingletonClass X`, while `vcDim_lt_top_iff_isPACLearnable` does not. The theorem is true as stated (for rules with values in a class of measurable classifiers the shattered points are separated by measurable sets, and with a uniform random labelling of `K` shattered points `E R ≥ (1 − n/K)/2`, against `E R ≤ 1/4` at `ε = δ = 1/8`). Name the infinite-dimension bullet in the route and add one sentence that the argument needs no measurable singletons there.

## C03 — The forest example of Layer 6 says consistency is "covered by 5.3", and 5.3 says it is not a target

Carried over unchanged. The Example of Layer 6 (line 1214) reads "bootstrap aggregation of response-independent trees is covered by 5.3 for consistency"; 5.3 (line 1001) says consistency of a particular forest "is that verification and is not a target here". Say that such forests are local weight estimates in the sense of 5.3, so that Stone's theorem applies once its three conditions are verified.

## N01 — The closing section header of `Suggested.lean` has only `#check` lines under it

"Supplier declarations named in the README" (line 985) heads no declaration; a plain comment would do, or the header could go.

## N02 — Three layer titles in `Suggested.lean` differ from the README

Layer 2 ("symmetrization and Rademacher averages"), Layer 3 ("combinatorial capacity and PAC learnability") and Layer 8 ("fairness criteria and distribution shift") against the README's "Rademacher averages", "VC dimension and PAC learnability" and "fairness and distribution shift".

## Questions for the author

- 1.4 says Mohri–Rostamizadeh–Talwalkar's Thm 4.7 "omits the hypothesis" `P(h(X) = 0) = 0`. Does that text fix a sign convention at `0` under which the hypothesis is not needed, so that the difference is one of convention? The book could not be read.
- `tendsto_lintegral_weightEstimate_sub_sq` is stated on an arbitrary metric space with its Borel σ-algebra, while 5.3 writes `‖X_i − X‖`. Is a separable space intended? On a non-separable one the distance need not be measurable on the product; no counterexample was constructed.

## Previous findings

- none: the previous report, of this same head, had no finding (R01 and R02 of the first review were recorded there as repaired). Its small corrections C01 and C02 and its format notes N01 and N02 are not repaired, the folder being unchanged; they are C02, C03, N01 and N02 above.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Description: "its 49 theorems are admitted" | elaboration of `Suggested.lean` at this head | 49 `declaration uses sorry` warnings, 0 errors, 0 other warnings; 49 `theorem` lines, 51 definitions, 38 `#check` lines | agrees |
| Description and 7.4: clipped randomized response needs a constant above `4`, worst ratio `1/tanh(1/2)² = 4.683` | `min(4, 1/(n·tanh(ε/2)²)) / min(1, 1/(nε²))` over `ε ∈ (0, 1]` in steps of `10⁻³`, `n < 2000` | maximum `4.68269`, at `ε = 1`; `1/tanh(1/2)² = 4.68269`; README's `4.69` is above it | agrees |
| Description and 7.2: Gaussian mechanism needs `ε < 1`; `δ(ε) = 0.41` at `ε = 10`, `δ = 0.1` | `Φ(1/(2s) − εs) − e^ε Φ(−1/(2s) − εs)` with `c = 2.248`, `s = 0.2248`; control `ε = 0.5`, `δ = 10⁻³` | `√(2 log 12.5) = 2.24754 < 2.248`; `δ(ε) = 0.4052 > 0.1`; control `s = 7.553`, `δ(ε) = 3.19·10⁻⁶ ≤ 10⁻³` | agrees |
| Description and 3.2: realizable upper bound with `log(2/ε)` | all classifiers on `d` points, uniform law, `n ≤ d/200` | unseen mass `≥ 1 − n/d ≥ 0.995 > 0.99`; with `log(1/ε)` the bound tends to `C log(1/δ)` as `ε → 1`, independent of `d` | agrees |
| Description and 3.3: realizable lower bound needs three members | `{h, ¬h}` on one point | `d = 1`, two members, one sample identifies the target: complexity `≤ 1` for every `δ` | agrees |

The rows of the previous review for the statements of the layers stand as in that review, of `0a66c85`; no statement changed.

- Description read against the head, sentence by sentence: title; eight layers and their contents against the README's scope list; the three suppliers and their sections (Foundations 8.5, 9.1; Asymptotic 3.2, 3.3, 3.5; Nonparametric 1.4, 2.2, 5.6, 5.8), all three on main; the Mathlib and Tau Ceti lists against the supplier contracts; the two local copies (`vcDimSet`, `IsPointwiseSeparable`); the ownership paragraph (RegretMinimizationAndEquilibria 1.2 "Hedge", MarkovDecisionProcesses and Neuromanifolds on main; FirstOrderOptimization and MultiArmedBandits open as new roadmaps); the "Beyond" items; the two stated overlaps (2.3, and 5.3 at line 1008). One sentence to correct (C01).
- "No other roadmap consumes this one": a search of main and of the open heads for the roadmap's name finds it only in its own files; KernelsAndSpectralMethods (open) leaves kernel ridge regression to "a separate roadmap on statistical learning theory" without consuming it.
- The change against the base: the pull request adds the roadmap (three files, 2753 lines, nothing removed), as the description says; no file changed outside the folder.
- Elaboration: 49 `sorry` warnings and nothing else; no `set_option`, no sorry'd data.
- Dependency check: `depcheck: 200 roadmaps, 2190 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Automatic checks: one failed, a section header of `Suggested.lean` with no declaration under it (N01); every other check passed.
- Seeded sample and source locators: no passage changed, so none fell in a changed passage; not reread this round.

Overlap check: as in the previous review, read KernelsAndSpectralMethods, MultiArmedBandits, MathematicalStatisticsHigherOrderAndResampling, RandomizedSmoothing, TopologicalDataAnalysis, MathematicalStatisticsNonparametric, MathematicalStatisticsAsymptotic, MathematicalStatisticsHighDimensional; kernel ridge regression and its risk bounds are left to this roadmap by KernelsAndSpectralMethods (reread at its head) and owned here; VC theory of set families stays with Asymptotic 3.5, regression consistency and the representer theorem with Nonparametric 5.6 and 5.8, Hedge with RegretMinimizationAndEquilibria 1.2; nothing has two owners. No open pull request changes this roadmap, drops an id it cites, or defines one it cites.

Source independence: changed passages only: 0 passages compared with 0 sources, the folder being unchanged; as in the previous review, largest share Mohri–Rostamizadeh–Talwalkar, 23 of about 107 locators, whose text could not be read; contents not compared again (no layer added, removed or reordered): independent as far as that review could test.

Research link: The headline targets are the distribution-free learning results that the README's paper sources prove or build on: Zhang (2004) on surrogate consistency, Duchi–Jordan–Wainwright (2013) on local-privacy minimax rates, Ben-David et al. (2010) on domain adaptation, Lei et al. (2018) on conformal inference, Lipton–Wang–Smola (2018) on label shift; rests on the README and on the last as read.

## Not verifiable

- Whether lean-CKSD contains results of Layers 3 and 8 (C01): only the public directory listings of `CKSD/Learning/`, `Generalization/` and `Privacy/` were read, not the files.
- The sources that the previous review could not read (Mohri–Rostamizadeh–Talwalkar, Anthony–Bartlett, Vapnik, Schölkopf–Smola, Boucheron–Lugosi–Massart, Koltchinskii, Breiman–Friedman–Olshen–Stone, Quiñonero-Candela et al., Vovk–Gammerman–Shafer) were not tried again: no passage citing them changed.

## Source issues

- none

## For the human reviewers

- **Not tested.** The source with the largest share of locators (Mohri–Rostamizadeh–Talwalkar, 23 of about 107) could not be read: its wording was not compared, and its arrangement only through the chapter numbers the README cites.
- **Licence.** The README (section "Prior formalization") and the description name an earlier formalization by the author (lean-CKSD, `CKSD/Learning/`, Apache 2.0) and say no code is copied; `Suggested.lean` was not compared with that repository.
