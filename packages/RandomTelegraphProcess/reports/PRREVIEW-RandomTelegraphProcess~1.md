# Review of RandomTelegraphProcess (pull request #3206 at d4f7455)

**Verdict:** accepted

**Summary.** Accepted: every stated result, Check and route formula was recomputed and none is false, and the Lean statements agree with the README at the same generality. There are two small corrections (the route of 3.5 does not cover `t = 0`; the description refers to a section 2.4 that the roadmap does not have) and two format notes, none blocking. Durrett's text could not be read, so its two attribution locators are unverified, and whether its host is the author's page is left to a human.

## C01 — The route of 3.5 proves the limit only for `t > 0`, while the statement is for every `t ≥ 0`

An implementer who follows the route literally is stuck at `t = 0`. The route says (README line 388) that `e^(−a_m t) cosh(r_m t)` and `e^(−a_m t) a_m sinh(r_m t)/r_m` "each tend to `e^(−stξ²/2)/2`". Since `e^(−at) cosh(rt) = (e^((r−a)t) + e^(−(r+a)t))/2`, the second exponential tends to `0` only when `t > 0`; at `t = 0` the two quantities are `1` and `0` for every `m`, not `1/2` and `1/2`. Their sum is `1` in both cases, so the theorem is unaffected.

It would be enough to write "for `t > 0`" in that sentence and add that at `t = 0` the position is `0` and the limit law is `δ_0`.

## C02 — The description cites sections "2.2–2.4", but Layer 2 ends at 2.3

In the paragraph on AI use the description says the review tested "negative speed and non-symmetric initial laws for 2.2–2.4". The head has 2.1, 2.2 and 2.3 only; the characteristic function, which that sentence presumably meant, is 3.4. The text that would be right: "for 2.2, 2.3 and 3.4" (or whichever sections were in fact simulated).

## N01 — Layer 3 has one title in the README and another in the Lean file

The README heading is "Layer 3: Kac's equations and the diffusive limit"; the section comment of `Suggested.lean` (line 110) is "Layer 3: Kac's equations". One title for both would be tidier.

## N02 — Two wordings in the overview and examples

The overview gives the characteristic function with `sinh(rt)/r` and no word on `r = 0` (README line 25); 3.4 handles it, and "(read as `t` when `r = 0`)" would make the overview agree with it. In the Examples of Layer 3 (line 404) "the standard Gaussian law of variance `t`" would read better as "the centred Gaussian law of variance `t`".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 `exp_smul_twoStateGenerator` | general `a, b`; `(1,2)`; `(1,−1)`; `a=0<b` | `Q² = −(a+b)Q`; `Σ_{n≥1} tⁿλ^(n−1)/n! = (e^(λt)−1)/λ`; `(1,2)`: entries `(1−e^(−3t))/3`, `(2+e^(−3t))/3`; `(1,−1)`: `Q²=0`, LHS `1+tQ`, RHS `1` | true; hypothesis needed | none |
| 2.1 `measureReal_twoStateProcess_eq` | `n=0`; equal times; Laplace transform; non-monotone `t=(1,0)`; rate `0` | transform `Σ_m (ab/((a+λ)(b+λ)))^m/(a+λ) = (b+λ)/(λ(λ+a+b))` = transform of `b/(a+b)+a e^(−(a+b)t)/(a+b)`; non-monotone: `0` vs `((1+e^(−2))/2)((1−e²)/2)`; rate `0` vacuous | true | none |
| 2.1 route, step 3 | small `u` | `P(N_u=1) = a∫₀ᵘ e^(−av)e^(−b(u−v))dv = au+O(u²)`; `P(N_u≥3)=O(u³)`; `Q'_01=a`, `Q'_10=b` | sound | none |
| 2.2 `integral_telegraphPosition` | general; small and large `t`; dependent `σ` at `a=c=t=1` | mean `c E[σ]∫₀ᵗe^(−2as)ds`; `2c²∫₀ᵗ(1−e^(−2au))/(2a)du = (c²/a)(t−(1−e^(−2at))/(2a))`; expansion `c²t²−(2/3)ac²t³`; dependent: `0.3034` vs `−0.1142` | true | none |
| 2.3 `map_telegraphPosition_eq` | `t=0`; `c<0`; `c=0`; `N_t=1`; `n` odd and even | `t=0`: both sides `δ_0`; `c=0`: LHS mass `1`, RHS `e^(−at)`; `N_t=1`: `X=c(2T₀−t)`, density `ae^(−at)/(2|c|)`, mass `ate^(−at)`; coefficient of `T_j`: `±2cσ` | true; `c≠0` needed | none |
| 3.1 `integral_comp_telegraphPosition_eq` | decomposition at `T₀`; `f=1/|y|` | on `{T₀≤t}`: `X^c_t = cT₀ + X^(−c)_(t−T₀)(T')`; unbounded `f`: LHS `0` (not integrable), RHS `≥ e^(−at)/t` | true; boundedness needed | none |
| 3.2 first-order system | `f(y)=y`; route algebra | `∂_t E X^c_t = ce^(−2at)`; `c + a(−2c(1−e^(−2at))/(2a)) = ce^(−2at)`; `e^(as)u_c(s,y−cs) = f(y)+∫₀ˢ ae^(ar)u_(−c)(r,y−cr)dr` | true | none |
| 3.3 telegraph equation | `f=y²`; generator; step 3 algebra | `v = 2xcE[σ]e^(−2at)+c²(1−e^(−2at))/a`; `v_t = 2c²−2av` both `−4axcE[σ]e^(−2at)+2c²e^(−2at)`; step 3 sum `c²Ef″−2av_c` | true | none |
| 3.4 characteristic function | initial values; `r=0`; coefficient of `ξ` | ODE `φ″+2aφ′+c²ξ²φ=0`; `ψ(0)=1`, `ψ′(0)=−a+(a+icξE[σ])`; first-order term `icξE[σ](1−e^(−2at))/(2a)` matches 2.2 | true | none |
| 3.5 diffusive limit | `t>0`; `t=0`; `s=0`; fixed rates | `r_m−a_m = −c_m²ξ²/(r_m+a_m) → −sξ²/2`; sign term `≤ (|c_m||ξ|/r_m)e^((r_m−a_m)t) → 0`; `t=0`: terms are `1` and `0`, sum `1` | theorem true; route incomplete at `t=0` | C01 |
| Conventions: forced positive rates | rate `0` | `gammaPDFReal 1 0 x = 0`, so `expMeasure 0 = 0`; `iIndepFun.isProbabilityMeasure` gives a probability measure; contradiction | claim true | none |
| Conventions: count on explosive paths | definition at the pin | `renewalCountNat` is `0` at all times off `{S_n → ∞}` (`TauCeti/Probability/Renewal/Count.lean` line 46) | README agrees | none |
| ContinuousTimeMarkovChains 2.2 | README and Lean on main | hypotheses `P 0 = 1`, semigroup law, row stochastic, continuity at `0` within `[0,∞)`; conclusion unique Q-matrix | as cited | none |

- Source locators checked against the text: 9 (Kolesnik2014 lines 65–73, 138–148, 149–158, 159–179, 252–291; IacusYoshida2006 lines 24–34, 89–99); 2 not readable (Durrett).
- Library declarations opened at the pins: 23 (15 Mathlib, 8 Tau Ceti), all present with the hypotheses the README assumes.
- Cross-roadmap citations resolved on main: ContinuousTimeMarkovChains 2.2, MarkovChainsAndRenewal Layer 7 and 7.3, StochasticCalculus 0.6.
- Dependency check output: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/RandomTelegraphProcess/Suggested.lean`: 9 `sorry` warnings, nothing else; elaborated signatures compared with the README, no binder lost, nothing changed.
- One-tactic probe (`simp` with the definitions unfolded, `rfl`, `infer_instance`): closes none of the 9 theorems; all 9 README headlines are stated; no padding.
- Duplication by object: no two-state exponential formula, telegraph process or Kac equation in the pinned Mathlib or Tau Ceti, on main or in an open roadmap; ContinuousTimeMarkovChains has the `(1,2)` exponential only as a Check and places the construction from holding times outside its scope.
- No change outside the roadmap folder; no `set_option`, no sorry'd data.

Overlap check: read ShotNoiseAndCampbellTheorem, RuinTheory, QueueingModels, LevyProcesses, TimeReversalOfMarkovChains, MarkovChainsAndRenewal, MartingaleCentralLimitTheorem, SeriesOfIndependentRandomVariables (the third list is empty); nothing shared.

Source independence: 9 passages compared with 2 sources, none shared beyond formulas; largest share Kolesnik2014, 7 of 11 locators; contents compared with Kolesnik2014: independent (all its locators lie in its §2, and the order 2.3, 3.3, 3.4 is forced by the Needs lines 3.4 → 3.3 → 3.2 → 3.1). Durrett's text and contents could not be read.

Research link: The headline targets are the Goldstein (1951) and Kac (1974) telegraph model; Kolesnik (2014) uses the law and the characteristic function (its (2.1)–(2.12)) for sums of telegraph processes, and Iacus and Yoshida (2006) use the moments (their (2.1), (2.2)) for estimation. Rests on the two sources read.

## Not verifiable

- Durrett, *Essentials of Stochastic Processes*, §4.1 pp. 127–128 with (4.3) (cited in 2.1) and §4.2 Example 4.8 p. 132 (cited in 1.1): the sources service refused the URL in the README as not shown to be an author's page; the text is requested. Both locators attribute statements that the roadmap proves itself.
- Kac (1974), Goldstein (1951), Orsingher (1990): cited for origin only, with no locator; not opened.

## Source issues

- **Gap** in Kolesnik2014 at (2.12), printed page 5: the source says the hyperbolic branch, with the square root of `λ² − c²ξ²` in a denominator, applies for `|ξ| ≤ λ/c`, endpoint included; it should be read at `|ξ| = λ/c` as the limit `e^(−λt)(1 + λt)`; affects nothing.

## For the human reviewers

- **Licence.** The README reads Durrett's book at `sites.math.duke.edu/~rtd/EOSP/EOSP2021.pdf` (README line 498); the sources service could not classify that host as the author's own page.
- **Scope.** The sources read are two arXiv preprints (Kolesnik2014, IacusYoshida2006) citing Goldstein (1951) and Kac (1974); 2.1, 3.1, 3.2 and 3.5 are marked "proved here" with no source stating them in this form.
- **Not tested.** Durrett's text and table of contents were not read; the wording of 1.1 and 2.1 was not compared with it (2 of 11 locators).
