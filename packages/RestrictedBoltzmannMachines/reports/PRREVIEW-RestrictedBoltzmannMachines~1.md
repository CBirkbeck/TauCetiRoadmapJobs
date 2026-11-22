# Review of RestrictedBoltzmannMachines (pull request #2980 at ba40f7b)

**Verdict:** needs changes

**Summary.** Changes are needed for one sentence only: the route of 1.2 says that the product of the hidden normalisers is proportional to the visible mass, which is false whenever a visible bias is nonzero (the factor `exp(b · v)` is missing); the theorem of 1.2 and every other statement, Check and worked value were recomputed and hold. There is one small correction (the contrastive divergence quantity of 4.2 is an expectation over the chain, which the attribution to the source does not say) and one format note, neither blocking. Le Roux–Bengio (2008) could not be read from a legal place, so its locators are unverified, and the humans who approve should know that the explicit constant of 4.1–4.2 is proved in the roadmap and stated in no cited source.

## R01 (P2) — The route of 1.2 says the product of the normalisers is proportional to `p(v)`; it is `exp(b · v)` times that product which is

An implementer who follows the route of 1.2 as written (README line 104, "the product of the normalisers is proportional to the visible mass `p(v)`") identifies the wrong marginal and cannot conclude `jointLaw θ = visibleLaw θ ⊗ₘ hiddenKernel θ`. The normaliser of factor `i` is `1 + exp(hiddenField θ v i)`, and by the factorisation printed two lines above, `Σ_h exp(−E(v, h)) = exp(b · v) Π_i (1 + exp(hiddenField θ v i))`. As functions of `v` the product alone is not proportional to `p(v)` unless `b = 0`: with one visible unit, no hidden unit and `b = log 2` the product is `1` at both `v` while `p_V = (1/3, 2/3)`; with the standard example and `b = 1` the products are `2, 4` while the masses are `2, 4e`. The standard example has `b = 0`, which is why the Checks do not catch it. Section 1.3 states the correct form.

The smallest change: "and `exp(b · v)` times the product of the normalisers is proportional to the visible mass `p(v)`".

## C01 — `cdGradient` of 4.2 is the expectation of the source's CD-k over the chain, not only its average over the data

In 4.2 (line 304–307) the definition is attributed to "Fischer–Igel, eq. (32) and the update rules of their Algorithm 1, p. 14, averaged over the data", and the Summary speaks of "the `k`-step contrastive divergence approximation of the gradient". The source's (32) and Algorithm 1 use one sampled state `v^(k)` per data point (FischerIgel2014 lines 765–771, 781–793), so their approximation is random and no deterministic bound holds for it; what `cdGradient` defines, and what 4.2 bounds, is its expectation over the `k` steps of the chain as well as over the data law, the quantity of the source's Theorem 2 (FischerIgel2014 lines 830–836). The definition itself is unambiguous, so no stated result is affected. Would "the expectation, over the chain and the data law, of Fischer–Igel's (32)" in 4.2, and "the expected `k`-step contrastive divergence approximation" in the Summary, be acceptable?

## N01 — Library names are given without their namespaces

For example `Kernel.IsReversible` is `ProbabilityTheory.Kernel.IsReversible`, `Measure.compProd` is `MeasureTheory.Measure.compProd`, `integral_fintype` is `MeasureTheory.integral_fintype`, `klDiv` is `InformationTheory.klDiv`. The supplier contracts give the files, so each is findable; full names there would save the search.

## Questions for the author

- Is "Theorem 2.4" (and "Lemma 2.1", "Theorem 2.3", "Appendix 5.1–5.3") the numbering of the Neural Computation article that the References cite, or only of the preprint? Montúfar–Ay refer to the `s + 1` theorem as "Theorem 2 in Le Roux & Bengio (2008)" (MontufarAy2010 lines 76–82, 113–114), which suggests the printed article numbers differently. I could read neither version of Le Roux–Bengio, so I could not settle it; if the numberings differ, giving both in the References would let a reader with the journal find the statements.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 machine, `jointLaw`, marginals | standard example; `κ` empty; `ι` empty | weights `1,1,1,3`, `Z = 6`, `p_V = (1/3, 2/3)`; `κ = ∅`: product Bernoulli `σ(b_j)`; `ι = ∅`: point mass | holds | none |
| 1.2 `jointLaw_eq_compProd` (theorem) | standard example; random machines `(m,n)` up to `(3,3)`, weights up to 8, incl. `(0,0)`, `(0,2)`, `(2,0)` | `p_V(1)·3/4 = 1/2 = 3/6`; max error both sides `≤ 2.3e−16`; wrong sign gives `1/6 ≠ 1/2` | holds | none |
| 1.2 route sentence on normalisers | `n = 0`, `m = 1`, `b = log 2`; standard example with `b = 1` | product of normalisers `1, 1` vs `p_V = (1/3, 2/3)`; `2, 4` vs masses `2, 4e` | false as written | R01 |
| 1.3 `visibleLaw_eq_gibbs_freeEnergy` | standard example; same random machines; `±1` spins | masses `2, 4` → `(1/3, 2/3)`; max error `≤ 1.1e−16`; spins: `3 + 1/3 = 10/3` both | holds | none |
| 2.1 `hasFDerivAt_integral_log_visibleLaw` | standard example, `q = δ_1`; finite difference in `b_0` for random `q` on 10 machines; `q = p` | `1/4, 1/3, 1/12`; difference quotient vs formula `≤ 5.6e−10`; `q = p` gives `0` | holds | none |
| 3.1 block updates reversible; alternating update | standard example | `p(0,0)K = 1/48`, `p(0,1)K = 1/24`; detailed balance fails for 10 of 16 ordered pairs; `Σ_s p(s)K(s,t) = p(t)` for all 4 `t` | holds; Check true | none |
| 3.2 `isReversible_visibleChain` | standard example; random machines | `Q(0,·) = (3/8, 5/8)`, `Q(1,·) = (5/16, 11/16)`, flows `5/24 = 5/24`; max defect `≤ 2.8e−17`; eigenvalue `1/16` | holds | none |
| 4.1 `tvDist_bind_visibleChain_pow_le` | standard example; `θ = 0`; `m = 0`; random machines, `k = 0..4` | `ε = 1/2`, true coefficient `1/16`, column minima `5/16 + 5/8 = 15/16`; `2/3 → 1/24 ≤ 1/3`; `m = 0`: `ε = 1`, both sides `0`; Dobrushin `≤ 1 − ε` in all runs | holds | none |
| 4.2 `abs_sub_cdGradient_le` | standard example `q = δ_1`, `k = 1`; `k = 0`; random machines `k = 0..4` | CD-1 `15/64, 5/16, 5/64`; biases `1/64, 1/48, 1/192 ≤ 1/6`; `k = 0`: `b`-coordinate `1/3 = tvDist/2` (attained) | holds | C01 (attribution) |
| 5.1 `exists_klDiv_addHidden_lt` | `p = (1/2,1/2)`, `q = (1/4,3/4)`, `w = log 2`, `c = 0`; `q = p`; `m = 0` | `p' = (2/5, 3/5)`, `(5/4)(5/6)³ = 625/864 < 1`; derivative at `t = 0` is `Σ(p − q)u`; `m = 0`: hypothesis unsatisfiable | holds | none |
| 5.2 `exists_klDiv_lt_of_support_subset_edges` | `r = 0`; `r = 1`; `ι` empty; parity law `m = 2`, `r = 2`; step 3 with `y = 00`, `l = 2` | `r = 0`: no probability law meets the hypothesis; parity: product laws `KL ≥ log 2`, unit `b = (−a,−a)`, `w = (3a,3a)`, `c = −4a` gives `1+e^(−4a), e^(−a)(1+e^(−a)), 1+e^(−2a)` → `1,0,0,1`; step 3 exponent `−a·d(v,y) + …` rechecked | holds | none |
| 5.3 `exists_klDiv_lt` | `m = 0, 1, 2, 3` | hidden units `0, 0, 1, 3` (`2^(0−1) − 1 = 0` in ℕ); `m = 1`: `KL(δ_1‖σ(b)) = −log σ(b) → 0`; `2^(m−1)` edges cover the cube | holds | none |
| Conventions: `tvDist μ ν / 2 = max_A |μA − νA|` | pinned definitions | Mathlib `tvDist = (etvDist).toReal` on signed measures; Tau Ceti `etvDist = 2·⨆_A (μA − νA)` | agrees | none |

- Source locators checked against the text: 14 (FischerIgel2014: eqs. (13), (16), (17), (18), (19)–(22), (23)–(25), (26)–(31), (32), Algorithm 1, Theorem 1 with (33), Theorem 2 with (34), all on the pages given; MontufarAy2010: Theorem 1 pp. 4–5, Corollary 2 p. 5, proof pp. 5–7). Not read: Le Roux–Bengio (8 locators).
- Library declarations opened at the pins: 25 in Mathlib (among them `Real.sigmoid`, `Real.sigmoid_neg`, `Real.sigmoid_strictMono` in `Mathlib/Analysis/SpecialFunctions/Sigmoid.lean:64,109,87`; `Kernel.ofFunOfCountable` `Probability/Kernel/Basic.lean:237`; `Kernel.comp_apply` and the monoid of kernels `Probability/Kernel/Composition/Comp.lean:57,238`; `Measure.compProd_apply_prod` `Composition/MeasureCompProd.lean:68`; `Kernel.IsReversible`, `.invariant`, `Invariant.comp` `Probability/Kernel/Invariance.lean:58,63,50`; `Measure.bind_bind` `GiryMonad.lean:316`; `tvDist` `TotalVariation/Defs.lean:62`; `klDiv` `KullbackLeibler/Basic.lean:56`; `integral_fintype` `Bochner/SumMeasure.lean:206`; `lintegral_fintype` `Lebesgue/Countable.lean:153`; `Finset.prod_univ_sum` `BigOperators/Ring/Finset.lean:160`; `Fintype.card_fun` `Data/Fintype/BigOperators.lean:202`; `innerSL` `InnerProductSpace/LinearMap.lean:164`; `HasFDerivAt.sum` `FDeriv/Add.lean:416`) and 2 in Tau Ceti (`MeasureTheory.etvDist_eq_two_mul_iSup_sub` `TauCeti/MeasureTheory/Measure/TotalVariation.lean:74`; `TauCeti.klDiv_eq_ofReal_sum_log_singleton` `TauCeti/InformationTheory/KullbackLeibler/Finite.lean:53`). All exist with the statements the contracts give.
- Cross-roadmap citations resolved: 7. SimulatedAnnealing 1.1 (`dobrushinCoeff`, column-minimum bound, a stated item), 1.2 (`tvDist_bind_le_dobrushinCoeff_mul`, same normalisation `/ 2`), 3.1 (`gibbs`, body identical to the copy) at its open head; QuantumOptimization 1.1 (`bit`, identical) at its open head; MathematicalStatisticsFoundations 3.1 and 3.3 on main (`hasFDerivAt_logPartition`, hypotheses `ν ≠ 0`, `η` interior, as quoted); boundary statements MarkovChainMixing 6.1, HiddenMarkovModels 6.1, GraphicalModelsAndConditionalIndependence 2.3, HopfieldNetworks scope, UniversalApproximation summary read and as described.
- Dependency check: `depcheck: 136 roadmaps, 1514 edges, 0 problem(s)`; no UPWARD or CYCLE line. The two open suppliers add new roadmap folders and are named in the description's dependency block.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: 10 `sorry` warnings, nothing else; single `import Mathlib`, no `set_option`, no sorry'd data.
- One-tactic probe on a copy (`rfl`, `simp`, `simp` with the definitions unfolded, `infer_instance`, `constructor <;> rfl`): none of the 10 theorems closes. No padding found; all 10 headline theorems of the README are stated, none through a stand-in.
- Elaborated signatures compared with the README: the 10 definitions flagged as losing a binder lose only unused `Fintype`/`DecidableEq`/`MeasurableSingletonClass` instances; every theorem carries its hypotheses (`IsProbabilityMeasure q`, `q ≠ visibleLaw θ`, `0 < ε`) explicitly; README generality equals the Lean's.
- Pull request text against the head: title and description agree with the change (new roadmap, 10 theorems, 19 definitions, two copied definitions, two open suppliers named); nothing to correct.

Overlap check: read SimulatedAnnealing, CurieWeissModel, GlauberDynamicsOfTheIsingModel, HopfieldNetworks, MathematicalStatisticsFoundations (scope sections; LogSobolevForMarkovChains, DenoisingDiffusion and MathematicalStatisticsNonparametric searched by object only); shared objects: the Gibbs measure on a finite set and Dobrushin's coefficient (owner SimulatedAnnealing 3.1, 1.1–1.2, cited), `bit` (owner QuantumOptimization 1.1, cited), the gradient of the log partition function (owner MathematicalStatisticsFoundations 3.3, cited); no object has two owners. A search of all open heads and main for Boltzmann machines, contrastive divergence and block Gibbs sampling finds only HopfieldNetworks' exclusion of Boltzmann machines.

Source independence: 9 passages compared with 2 sources (FischerIgel2014, MontufarAy2010), none shared beyond standard three-word terms; largest share FischerIgel2014, 12 of 23 locators; contents compared with FischerIgel2014 (§§1–7): independent (Layers 1, 2, 4 touch §4–4.1, §4.2, §5.1, in an order forced by the Needs lines of 2.1, 4.1, 4.2; Layer 3's reversibility and Layer 5 have no counterpart section). Le Roux–Bengio (8 locators) could not be read and was not compared.

Research link: Layer 5 states the universal approximation theorems of Le Roux–Bengio (2008) and Montúfar–Ay (2010); Layer 4 gives a bound of the form of Fischer–Igel's (2011) bias bound for contrastive divergence, quoted in Fischer–Igel (2014, Theorem 2), with its own constant. Rests on the README and on FischerIgel2014, MontufarAy2010.

## Not verifiable

- Le Roux–Bengio (2008), §1.1.1, eq. (1), Lemma 2.1, Theorems 2.3 and 2.4, Appendix 5.1–5.3: the publisher's page refused access and no copy was found on an author's page at the address tried; the statements of 5.1 and of the `s + 1` consequence were checked mathematically and against Montúfar–Ay's and Fischer–Igel's descriptions of them, not against the text.
- Fischer–Igel (2014) was read in the preprint on an author's page, which the README says is the version it cites; the journal pagination (25–39) was not compared.

## Source issues

- **Misprint** in FischerIgel2014 at eq. (17), p. 9: the source says the left side is the unnormalised `|μP^k − π|` while the right carries the factor ½; it should be the same normalisation on both sides (false at `k = 0` as printed); affects nothing.
- **Misprint** in FischerIgel2014 at eqs. (28)–(29), p. 13: the source says the averaged products are of `v_i h_j`; it should be `h_i v_j`, as hidden units carry the index `i` and visible units `j` in (18) and (27); affects nothing.
- **Misprint** in FischerIgel2014 at Theorems 1 and 2, pp. 14–15: the source says these are Theorems 1 and 2, numbers already used on pp. 5 and 8; it should be distinct numbers; affects nothing.
- **Misprint** in MontufarAy2010 at §2.1, first sentence, p. 4: the source says Theorem 1 sharpens Theorem 2 of Le Roux–Bengio (2010); it should be the 2008 paper, as its introduction says; affects nothing.

## For the human reviewers

- **Scope.** The explicit rate `1 − Π_j 2σ(−A_j)` of 4.1 and the bias bound of 4.2 are proved in the README and stated in no cited source; Fischer–Igel's Theorem 2 has another constant (README 4.1, 4.2; FischerIgel2014 line 836).
- **Scope.** The subject is the theory of a machine-learning model; the three sources are a tutorial (Pattern Recognition 2014), a Neural Computation article (2008) and an arXiv preprint (1005.1593v2).
- **Not tested.** Le Roux–Bengio (2008), 8 of 23 locators, could not be read from a legal place: its wording and numbering were not compared with 5.1.
