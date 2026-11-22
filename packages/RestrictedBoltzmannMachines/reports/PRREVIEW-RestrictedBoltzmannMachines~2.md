# Review of RestrictedBoltzmannMachines (pull request #2980 at 5e94446)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired (the route of 1.2 now carries the factor `exp(b · v)`), the earlier small correction is taken up (4.2 and the Summary now say that the contrastive divergence quantity is an expectation over the chain), and the 15 changed lines introduce no new problem. There are no small corrections and two format notes, neither blocking. For the humans who approve, the points of the previous review stand: Le Roux–Bengio (2008) could not be read from a legal place, and the explicit constant of 4.1–4.2 is proved in the roadmap and stated in no cited source.

## N01 — Library names are given without their namespaces

Unchanged from the previous review: for example `Kernel.IsReversible` is `ProbabilityTheory.Kernel.IsReversible`, `Measure.compProd` is `MeasureTheory.Measure.compProd`, `klDiv` is `InformationTheory.klDiv`. The supplier contracts give the files, so each is findable; full names there would save the search.

## N02 — Two leftovers of the rewording

In the Summary (README lines 19–22) the reflow left `(1 − ε)^k` alone on a line, and the same in the route of 1.2 (lines 107–108, "`Finset.prod_univ_sum` the masses of a" broken mid-sentence); the rendered text is unaffected. The docstrings of `cdGradient` and `abs_sub_cdGradient_le` in `Suggested.lean` (lines 196–204) still say "the `k`-step contrastive divergence approximation" without "expected"; the body is explicit, so a word would only align them with the README.

## Questions for the author

- Carried from the previous review, still open: is "Theorem 2.4" (and "Lemma 2.1", "Theorem 2.3", "Appendix 5.1–5.3") the numbering of the Neural Computation article that the References cite, or only of the preprint? Montúfar–Ay refer to the `s + 1` theorem as "Theorem 2 in Le Roux & Bengio (2008)" (MontufarAy2010 lines 76–82, 113–114). I could read neither version of Le Roux–Bengio, so I could not settle it.

## Previous findings

- R01 — repaired: "and `exp(b · v)` times the product of the normalisers is proportional to the visible mass `p(v)`" (README lines 105–106); recomputed, see the table.
- C01 (small correction) — taken up: 4.2 reads "in expectation over the chain and the data law; the source's CD-k uses one sampled state per data point and is random"; the Summary reads "the expected `k`-step contrastive divergence approximation".
- N01 (format note) — unchanged; written again above.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.2 route sentence on normalisers (changed) | `m = 1`, `n = 0`, `b = log 2`; random real machines `(m, n)` = `(0,0)`, `(1,0)`, `(0,2)`, `(2,2)`, `(3,3)` | `exp(b·v)·Π = 1, 2` → `(1/3, 2/3) = p_V`; ratio `p(v) / (exp(b·v)Π)` constant to `≤ 5.6e−16`; without the factor the ratio varies by `4.3`, `2.7`, `27.4` | holds as now written | none |
| 1.2 `jointLaw_eq_compProd` (cited by the changed route; statement untouched) | `(0,2)`: no visible unit | product of normalisers and `p_V` both constant (ratio spread `0`, `1.0`); consistent with theorem | holds | none |
| 4.2 definition of `cdGradient` and its attribution (changed) | standard example, `q = δ_1`, `k = 1` | `E[v^(1)] = 11/16`, expected `b`-coordinate `1 − 11/16 = 5/16` (= README's CD-1 value); a single sample gives `1` or `0`, so only the expectation is deterministic | attribution now correct | none |
| Summary sentence on the bias (changed) against `abs_sub_cdGradient_le` | same instance | bias `1/3 − 5/16 = 1/48 ≤ (1/2)(1/3) = 1/6` | agrees with 4.2 and the Lean statement | none |

The rows of the previous review for the untouched statements (1.1, 1.3, 2.1, 3.1, 3.2, 4.1, 5.1, 5.2, 5.3, the total variation convention) stand as in the previous review, of `ba40f7b`.

- Source locators checked against the text for the changed passages: 3 (FischerIgel2014 eq. (32) at lines 765–771, single sample `v^(k)`; Algorithm 1 at lines 777–793, sampling steps; Theorem 2 at lines 830–836, an expectation over the chain and the empirical law), all on p. 14–15 as cited.
- Library declarations: the diff names one, `Finset.prod_univ_sum`, unchanged and opened in the previous review (`Mathlib/Algebra/BigOperators/Ring/Finset.lean:160`); no supplier citation is added or changed.
- Cross-roadmap citations: none added or changed; none in the changed passages.
- Dependency check: `depcheck: 136 roadmaps, 1514 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed. Elaboration of `Suggested.lean` (unchanged since `ba40f7b`): 10 `sorry` warnings, nothing else.
- No file outside the roadmap folder is changed. No layer is added, removed or reordered.
- Pull request text against this head: the description's sentences on 1.2 and 4.2 ("the resulting coordinatewise bound on the bias of `k`-step contrastive divergence") remain true, the bias being the expected error; nothing to correct.

Overlap check: read SimulatedAnnealing, CurieWeissModel, GlauberDynamicsOfTheIsingModel, HopfieldNetworks, MathematicalStatisticsFoundations (as in the previous review; the change touches no owned object); shared objects: the Gibbs measure on a finite set and Dobrushin's coefficient (owner SimulatedAnnealing 3.1, 1.1–1.2, cited), `bit` (owner QuantumOptimization 1.1, cited), the gradient of the log partition function (owner MathematicalStatisticsFoundations 3.3, cited); no object has two owners.

Source independence: changed passages only: 3 passages compared with 1 source (FischerIgel2014 lines 758–796, 830–836), none shared beyond the standard term "k-step contrastive divergence"; largest share FischerIgel2014, 12 of 23 locators; the diff adds, removes or reorders no layer, so the contents comparison stands as in the previous review: independent. Le Roux–Bengio (8 locators) could not be read and was not compared.

Research link: Layer 5 states the universal approximation theorems of Le Roux–Bengio (2008) and Montúfar–Ay (2010); Layer 4 gives a bound of the form of Fischer–Igel's (2011) bias bound for contrastive divergence, quoted in Fischer–Igel (2014, Theorem 2), with its own constant. Rests on the README and on FischerIgel2014, MontufarAy2010.

## Not verifiable

- Le Roux–Bengio (2008), §1.1.1, eq. (1), Lemma 2.1, Theorems 2.3 and 2.4, Appendix 5.1–5.3: not readable from a legal place in the previous review; the change does not touch these locators and no new attempt was made.
- Fischer–Igel (2014) was read in the preprint on an author's page, which the README says is the version it cites; the journal pagination was not compared.

## Source issues

- **Misprint** in FischerIgel2014 at eq. (17), p. 9: the source says the left side is the unnormalised `|μP^k − π|` while the right carries the factor ½; it should be the same normalisation on both sides (false at `k = 0` as printed); affects nothing.
- **Misprint** in FischerIgel2014 at eqs. (28)–(29), p. 13: the source says the averaged products are of `v_i h_j`; it should be `h_i v_j`, as hidden units carry the index `i` and visible units `j` in (18) and (27); affects nothing.
- **Misprint** in FischerIgel2014 at Theorems 1 and 2, pp. 14–15: the source says these are Theorems 1 and 2, numbers already used on pp. 5 and 8; it should be distinct numbers; affects nothing.
- **Misprint** in MontufarAy2010 at §2.1, first sentence, p. 4: the source says Theorem 1 sharpens Theorem 2 of Le Roux–Bengio (2010); it should be the 2008 paper, as its introduction says; affects nothing.

## For the human reviewers

- **Scope.** The explicit rate `1 − Π_j 2σ(−A_j)` of 4.1 and the bias bound of 4.2 are proved in the README and stated in no cited source; Fischer–Igel's Theorem 2 has another constant (README 4.1, 4.2; FischerIgel2014 line 836).
- **Scope.** The subject is the theory of a machine-learning model; the three sources are a tutorial (Pattern Recognition 2014), a Neural Computation article (2008) and an arXiv preprint (1005.1593v2).
- **Not tested.** Le Roux–Bengio (2008), 8 of 23 locators, could not be read from a legal place: its wording and numbering were not compared with 5.1.
