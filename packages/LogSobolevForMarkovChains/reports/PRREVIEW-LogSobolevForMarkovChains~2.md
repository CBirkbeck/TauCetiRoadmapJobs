# Review of LogSobolevForMarkovChains (pull request #2737 at 8be0b3b)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review is repaired, and the repair is correct (with `α = 1/(2n)`, `γ = 1/n` the bound of 3.3 on the cube is `(n/2) log(n log 2) + cn`, and the lazy walk does have its cutoff at `(n/2) log n`). Both small corrections are repaired and the repairs introduce nothing new. Three format notes remain, none blocking; the human reviewers are again asked to note that 14 of the 15 locators point into an unfinished draft monograph.

## N01 — Status words remain in four places

The phrase was removed from the ContinuousTimeMarkovChains paragraph, but "an open roadmap, not on main" still stands in Scope and ownership for MarkovChainMixing and BooleanFunctionAnalysis (lines 401, 406), "as they stand in its open version" in the supplier contracts (lines 466–467), and "Named for attribution; not consulted" twice in the References (lines 494, 496). They will be out of date once the supplier merges; the citations by roadmap and section carry the information without them.

## N02 — Two Checks still report experiments rather than values

The last Check of 2.3 ("agree to `10⁻⁶`", line 256) and the last of 3.2 ("no `f` … was found", line 333) give nothing a reader can recompute. One fixed instance with its two values would do the same work.

## N03 — One line of 2.2 runs past the wrap

The reworded citation in 2.2 (line 192) is a single line of about 140 characters; rewrapping it at 100 matches the rest of the file.

## Previous findings

- R01 — repaired: "the cube, for which 3.3 gives the time `(n/2) log(n log 2) + c n` with the constants `α = 1/(2n)` and `γ = 1/n` of 2.3; its leading term `(n/2) log n` is where the lazy walk on the cube has its cutoff."
- C01 — repaired: "stated there with the proof, by reduction to the two-point space, referred to the literature"; this is what ChenLiuSaloffCoste lines 156–160 say.
- C02 — repaired: "The facts of 3.1 (nonnegative entries, row sums `1`, the semigroup law) are the case `Q = P − I` of those theorems; 3.1 proves that case directly from Mathlib's exponential"; ContinuousTimeMarkovChains 1.2 and 1.3 state them.
- N01 — partly repaired: removed for ContinuousTimeMarkovChains; "an open roadmap, not on main" and "not consulted" remain (N01 above).
- N02 — not repaired: both Checks unchanged (N02 above).

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Layer 3 Examples: time of 3.3 on the cube | `π(x) = 2^(−n)`, `α = 1/(2n)`, `γ = 1/n`; `n = 3`, `c = 1` | `log(n log 2)/(4α) + c/γ = (n/2) log(n log 2) + cn`; `4.0981`, as the Check of 3.3 | sentence true |
| 3.3 at that time on the cube | `n = 2, 10, 1000`, `c = 0, 1, 3` | `L²` distance `1.40, 1.69, 1.80` against `e = 2.718`; `0.4525, 0.4619, 0.4643` against `1`; `0.0598–0.0599` against `0.1353`; total variation below half of each | bound holds |
| Layer 3 Examples: cutoff at `(n/2) log n` | `n = 1000`, `t = (n/2) log n + cn`, `c = −2, −1, 0, 1, 2`; `t = (n/4) log n` | total variation `0.9998, 0.827, 0.383, 0.146, 0.054`; at `(n/4) log n`: `0.995` | cutoff at `(n/2) log n`, window `n`; `(n/4) log n` not mixed |
| 2.2 citation of Example (E6) | ChenLiuSaloffCoste lines 156–160 | value `(1 − 2μ*)/log(1/μ* − 1)` stated for every positive law; proof by reduction to (E5), referred to three papers | wording now matches the source |
| Scope: ContinuousTimeMarkovChains 1.2, 1.3 | its open head | 1.2: `exp(tB) ≥ 0` for `t ≥ 0` iff `B` Metzler; 1.3: `exp(tQ)` stochastic iff `Q` a Q-matrix, with `P(s+t) = P(s)P(t)` | citation resolves; `P − I` is a Q-matrix |

The rows for the statements the change does not touch stand as in the previous review, of `a58a4f2`.

- Source locators checked against the text: 1 (ChenLiuSaloffCoste, Example (E6), lines 156–160); the seeded sample falls in the changed passages only at 2.2 and 3.3.
- Cross-roadmap citations resolved: ContinuousTimeMarkovChains 1.2 and 1.3 (open head), MarkovChainMixing 5.3 (open head, the walk that redraws a uniform coordinate).
- Library declarations opened: none new; the change touches no library name and no Lean statement.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: seven `sorry` warnings, nothing else; the file is unchanged since `a58a4f2`, so the signature comparison and the one-tactic probe of the previous review stand.
- Pull request's title and description read against this head: no sentence contradicted; the description does not mention the cube time, and its sentence on ContinuousTimeMarkovChains agrees with the new scope paragraph.

Overlap check: read MarkovChainMixing, ContinuousTimeMarkovChains (open) and MarkovChainsAndRenewal (main); the third list is empty. Dirichlet form, spectral gap, Poincaré inequality: owner MarkovChainMixing 2.4, cited here. Stochasticity of `exp(tQ)`: owner ContinuousTimeMarkovChains 1.2–1.3, now named as such in the scope paragraph. Nothing else shared.

Source independence: changed passages only; 3 passages compared with 2 sources, none shared; largest share AldousFill, 14 of 15 locators; the change adds, removes and reorders no layer, so the contents comparison of the previous review (independent) stands.

Research link: the constant and Gross's equivalence for finite chains are those of Diaconis and Saloff-Coste (1996), after Gross (1975); exact constants are the subject of Chen, Liu and Saloff-Coste (2008). Rests on the README's references and ChenLiuSaloffCoste Section 1.

## Not verifiable

- Diaconis and Saloff-Coste (1996): no legal copy read; the attributions to it in 2.2, 2.3 and 3.2 were not checked. No locator into it is cited.
- Gross (1975): named for attribution only; not read.
- AldousFill line 984, the hypothesis line of Theorem 26(a): the recognised text is unreadable there, so whether the source writes `c ≥ 0` or `c > 0` was not seen; 3.3 was verified independently.

## Source issues

- **Gap** in ChenLiuSaloffCoste at Example (E6), printed p. 242: the source says the constant is one minus twice the least mass over the logarithm of its odds ratio, for every positive law; it should be read as the limit one half when two equal points give zero over zero; affects nothing.

## For the human reviewers

- Scope: 14 of the 15 locators point into AldousFill, an unfinished draft chapter (May 1999, with the authors' working notes) on an author's page; the refereed primary source, Diaconis and Saloff-Coste (1996), is named in the References as not consulted.
