# Review of GaussianChannelsAndWaterFilling (pull request #3212 at 93bff32)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired, and the repair introduced no new problem. The golden formula of 1.1 is now stated for a probability measure on a nonempty standard Borel space and an arbitrary Markov kernel, with the additive form kept as its corollary; the new statement, its route, its new Check and the new scope sentence were recomputed and agree. There is no small correction and no format note; the scope question and the untested-reuse question remain for a human.

## Previous findings

- R01 — repaired: 1.1 now proves `lintegral_klDiv_eq_mutualInfo_add` "for a probability measure `μ` on a nonempty standard Borel space `α`, a Markov kernel `κ` … and a probability measure `Q` on `β`", keeps the additive form as its case, and the scope paragraph names the uniform-input case of MathematicalStatisticsNonparametric 2.4.
- N01 — repaired: no line of `TauCetiRoadmap/GaussianChannelsAndWaterFilling/Suggested.lean` exceeds 100 characters, and its Layer 1 section comment carries the README's title.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 golden formula, general kernel (`lintegral_klDiv_eq_mutualInfo_add`) | README Check: `α = β = {0,1}`, `μ` uniform, `κ 0 = δ₀`, `κ 1` uniform, `Q` uniform; `κ` constant `= Q` | LHS `(log 2)/2`; output `(3/4, 1/4)`; joint `(1/2, 0, 1/4, 1/4)` against product `(3/8, 1/8, 3/8, 1/8)` gives `(3/4) log(4/3)`; divergence `(3/4) log(3/2) − (1/4) log 2`; sum `(1/2) log 2`. Constant kernel: `0 = 0 + 0` | true | none |
| 1.1 route | hypotheses of each step at the pins | `TauCeti.klDiv_compProd_right` needs `CountableOrCountablyGenerated α β` (from standard Borel `α`) and finite kernels; `klDiv_compProd_eq_add` has no space hypothesis; `condKernel` on `β × α` needs `α` standard Borel, nonempty | every input in scope; `β` arbitrary is correct | none |
| 1.1 additive form (`lintegral_klDiv_map_add_eq`) | shift kernel `x ↦ ν.map (x + ·)` | `μ ⊗ₘ κ` and `inputOutputLaw (μ.prod ν)` agree on rectangles; `κ ∘ₘ μ = μ ∗ ν`; statement unchanged since `d33acd9` | the general statement for the shift kernel | none |
| Scope sentence on MathematicalStatisticsNonparametric 2.4 | `α = Fin M`, `μ` uniform, `κ j = P j` | LHS `M⁻¹ ∑ klDiv (P j) Q`; `κ ∘ₘ μ = P̄`; `mutualInfo (μ ⊗ₘ κ) = M⁻¹ ∑ klDiv (P j) P̄ = mutualInfoUniform P` by the kernel chain rule | true; that roadmap's `X` is an arbitrary measurable space, as said | none |

The rows for the untouched statements (1.2, 1.3, 2.1–2.3, 3.1–3.4 and the three definitions) stand as in the previous review, of `d33acd9`.

- Source locators checked against the text: 1 (Polyanskiy–Wu, Theorem 4.1, p. 67, itbook-export line 4099: stated for an arbitrary channel and every reference output law; Corollary 4.2 on p. 68 as before).
- Library declarations opened at the pins: `TauCeti.klDiv_compProd_right` (`TauCeti/InformationTheory/KullbackLeibler/ChainRule.lean` 125, variables at 116–121), Mathlib `klDiv_compProd_eq_add` (`Mathlib/InformationTheory/KullbackLeibler/ChainRule.lean` 203), `Measure.compProd_const` and `Measure.fst_compProd` (`Mathlib/Probability/Kernel/Composition/MeasureCompProd.lean` 140, 170), `Measure.snd_compProd` (`Mathlib/Probability/Kernel/Composition/MeasureComp.lean` 45).
- Cross-roadmap citations resolved on main: MathematicalStatisticsNonparametric 2.4, `mutualInfoUniform` (its `Suggested.lean` 396) and `inv_mul_sum_klDiv_eq` (498, for `M ≥ 1`, probability measures on a measurable space `X`).
- Counts: `Suggested.lean` has 11 theorems and 3 definitions, as the scope section ("eleven theorems") and the description say.
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: `Suggested.lean` elaborates with `sorry` as its only warning (11 warnings). `#check @lintegral_klDiv_eq_mutualInfo_add` shows every binder of the README statement (standard Borel, nonempty, probability measures, Markov kernel). The one-tactic probe (`rfl`, `simp`, `simp [mutualInfo]`, `exact?`) does not close the new theorem.
- The automatic checks all passed on this head.
- The pull request's title and description agree with this head: the description's first bullet states the general formula and its additive case, and counts 11 theorems and 3 definitions.

Overlap check: read DifferentialEntropyAndEntropyPower, ChannelCoding, HypothesisTestingExponents, RateDistortionTheory, SequentialAnalysis, DiffusionReverseStepKLBound, DenoisingDiffusion, RenyiDivergenceAndPrivacy as in the previous review; nothing shared. The general golden formula has no other owner: MathematicalStatisticsNonparametric 2.4 on main states only its uniform finite-input case, which the scope section now names.

Source independence: changed passages only; 3 passages compared with 1 source (the statement of 1.1, its route, the docstring of the new theorem, against Polyanskiy–Wu Theorem 4.1 and its proof), none shared; largest share Polyanskiy–Wu, 13 of 15 locators; the diff adds, removes or reorders no layer, so the contents were not compared again (independent in the previous review).

Research link: The headline targets are the Gaussian saddle point and water-filling capacity of Polyanskiy–Wu (2024), Theorems 5.11 and 20.14, and the bound of Ihara (1978) as their Theorem 20.12; rests on the README's sources, read in the text.

## Not verifiable

- Whether a public Lean formalisation states the same declarations: no repository was searched; the description says none was used.

## Source issues

- **Error** in Polyanskiy–Wu at Theorem 5.11, part 2, p. 100: the source says that under a bound on the variance of the input, equality holds only for the centred Gaussian input; it should be every Gaussian input of that variance, with any mean; affects a stated result.

## For the human reviewers

- Scope: the roadmap's sources are a 2024 Cambridge University Press textbook and Boyd–Vandenberghe; its headline theorems are textbook results (Shannon's Gaussian capacity, water-filling, Ihara 1978). Whether that is research-level scope is yours to decide.
- Licence: the Polyanskiy–Wu text was read from the first author's own page (a prepublication PDF of 16 August 2024); reuse from other Lean formalisations was not tested.
