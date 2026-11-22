# Review of HypothesisTestingExponents (pull request #2993 at 618a29c)

**Verdict:** needs changes

**Summary.** Changes are needed for one false sentence: a Check of 2.1 (and the Conventions and the description after it) says the Chernoff coefficient would come out wrong if the infimum ran over the closed interval of orders, whereas for probability measures the closed and open infima are equal. Every stated theorem, every numeric Check and the lower-bound route of Chernoff's theorem were recomputed and hold; `Suggested.lean` elaborates and states all six headlines. There are three small corrections and no format notes. The roadmap's only source could not be read through the project's sources service, so its locators are unverified; that, and the single-source basis, are left to the human reviewers.

## R01 (P2) — The Check of 2.1 that the closed interval of orders "would give the wrong value" is false: the infimum over `[0, 1]` equals the infimum over `(0, 1)`

A reader is told that the open interval in `chernoffCoefficient` is forced, and an implementer who meets the closed-interval form in the literature will believe the two definitions differ; they do not, so the stated reason for a design choice is wrong.

In the Check of 2.1 on the non-attained infimum (README line 307): "The closed interval with the copied definition would give the wrong value: at `s = 0` it returns `1`, because `0^0 = 1` in `ℝ≥0∞`." For `P = (1/2, 1/2, 0)`, `Q = (1/4, 1/4, 1/2)` the copied definition gives `H_s = 2^(s−1)` on `(0, 1)` and `H_0 = H_1 = 1`, so the infimum over `[0, 1]` is `inf({2^(s−1) : 0 < s < 1} ∪ {1}) = 1/2`, the same as over `(0, 1)`. This is general: the range fact of the same section gives `H_s ≤ 1` for `0 < s < 1`, and the endpoint values of the copied definition are `Q(X) = P(X) = 1`, so adding the endpoints never changes the infimum. What is true is only that the value at the endpoint is `1` and not `Q(p > 0) = 1/2`, so the infimum is not attained on `[0, 1]` either.

Smallest change: replace the sentence by, for example, "At `s = 0` the copied definition returns `1`, not `Q(p > 0) = 1/2`, because `0^0 = 1` in `ℝ≥0∞`; since `H_s ≤ 1`, the infimum over the closed interval is the same `1/2`, and it is attained at no order." In the Conventions (line 62), "which is why every infimum below runs over the open interval" then becomes a statement of choice ("the infima below run over the open interval, where no `0^0` occurs; the endpoints, of value `1`, would not change them").

## C01 — Two "facts used below" of 2.1 restate what RenyiDivergenceAndPrivacy already states

In 2.1 the *Range* bullet (lines 283–285) proves that `hellingerIntegral s P Q ≤ 1` for `0 < s < 1`, with value `0` exactly for mutually singular laws; that is the *Range* bullet of RenyiDivergenceAndPrivacy 1.1 at its head. The *Products* bullet (lines 286–294) rebuilds `renyiDiv s Pⁿ Qⁿ = n · renyiDiv s P Q` by induction from 3.2 and 3.1 through `MeasurableEquiv.piFinSuccAbove`; RenyiDivergenceAndPrivacy 3.2 already states the finite form `renyiDiv α (Measure.pi P) (Measure.pi Q) = ∑ i, renyiDiv α (P i) (Q i)` for families indexed by `Fin n`, by that same induction. The symmetry `H_s(P, Q) = H_(1−s)(Q, P)` in the last Check is the skew symmetry of its 1.1.

Cite those three places and keep here only what is new (the translation from the additive Rényi form back to the power `H_s(P, Q)ⁿ`, with `0ⁿ` for `n ≥ 1`). The data-processing citation 3.1 and the two `piFinSuccAbove` declarations then leave the *Needs* line of 2.1.

## C02 — The second Check of 1.2 holds only for `0 < D(P ‖ Q) < ∞`

Line 138: "The bound alone gives `liminf −(1/n) log β_n ≤ D(P ‖ Q)/(1 − ε)`, which exceeds `D(P ‖ Q)` for every `ε > 0`". For `P = Q` both sides are `0`, and for infinite divergence both are `∞`, so nothing is exceeded. The bound also controls the `limsup`, which is the useful statement. Would read: "gives `limsup −(1/n) log β_n ≤ D(P ‖ Q)/(1 − ε)`, which for `0 < D(P ‖ Q) < ∞` exceeds `D(P ‖ Q)` for every `0 < ε < 1`".

## C03 — The description repeats the claim of R01

The description says: "the infimum runs over the open interval of orders, which is needed when it is not attained (Check of 2.1)". By R01 it is not needed. Text that would be right: "the infimum runs over the open interval of orders, where the copied definition has no `0^0`; it need not be attained (Check of 2.1)".

## Questions for the author

- The general form of Chernoff's theorem (2.3: no mutual absolute continuity, no finite log-moment generating function) has no source that states it; the README says so and gives a route, which I re-derived and found complete. Is there a refereed statement at this generality you could cite beside Polyanskiy–Wu (Chernoff's 1952 paper is the natural candidate)? I did not open it, so this is a question and not a request.
- The same holds for the Hellinger bound 2.2, marked "proved here". I could not check whether Polyanskiy–Wu state it elsewhere, because the text was not readable (below).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `steinBeta`, Checks | `P=(1/2,1/2)`, `Q=(1/4,3/4)`, `ε=1/2`, `n=0..6`; `ε=1/4`, `n=1..6`; `P=Q`; `ε=0,1`; `ε<0` | `1/2,1/4,1/4,5/32,5/32,53/512,53/512`; `5/8,7/16,7/16,47/128,161/512,295/1024`; `1−ε`; `1` and `0`; empty class, `sInf ∅ = 0` | all as stated | none |
| 1.1 randomized vs deterministic | `n=1`, `ε=1/4` | deterministic `1`; randomized `1−(1/2)(3/4)=5/8` | as stated | none |
| 1.2 weak converse | `ε=1/2`: `1/β ≤ 4(4/3)ⁿ`, `n=0..6`; `ε=1/4`: `β⁻³ ≤ 16(4/3)^(2n)`, `n=1..6`; `D=∞`, `n=0`; `P=δ₀,Q=δ₁`, `n≥1` | `n=6`: `9.66 ≤ 22.5`; all hold exactly; `n=0`: `(1−ε)log(1/(1−ε)) ≤ 1/e < log 2`, RHS `0·∞+log 2`; `β=0`, `log 0=0`, RHS `∞` | true | none |
| 1.2 route | `klBin(a,b) ≥ a log(1/b) − log 2`; event `{φ x ≤ u}` | `(Pⁿ⊗U)(B)=∫(1−φ)dPⁿ`; `klDiv_prod_prod_eq_add` gives `D(Pⁿ‖Qⁿ)+1·0` | sound | none |
| 1.2 second Check | `P=Q` | `D/(1−ε)=0=D` | "exceeds" fails at `D=0` | C02 |
| 1.3 achievability | not `≪`: `P=(1/2,1/2,0)`, `Q=(0,1/2,1/2)`; `P≪Q`, `D=∞`: `P(k)=1/(k(k+1))`, `Q(k)=2^(−k)`; `P=Q` | `Pⁿ(Aₙ)=2^(−n)`, `Qⁿ(Aₙᶜ)=0`; `ΣP(k)k=Σ1/(k+1)=∞`, `llr⁻ ≤ (dQ/dP−1)⁺` integrable; hypothesis `E<0` empty | true; truncated strong law route sound | none |
| 1.4 strong converse | finite form `(1−ε)−γβ ≤ Pⁿ(dPⁿ/dQⁿ>γ)`, `ε∈{1/4,1/2}`, `n=1..6`, six `γ`; `ε=1`; `P(k)=4/(k(k+1)(k+2))` | all 72 inequalities hold exactly; always-reject has errors `1`, `0`; `ΣP=1`, `ΣP k²≈Σ4/k=∞`, `ΣP k<∞` | true; threshold uniform in `φ` | none |
| 1.5 Stein's lemma | `ε=0`, `ε=1`; `P=Q`; `n=6` rate; `D=∞` with `E<0` | exponents `0` and junk `0` vs `½log(4/3)`; `−log(1−ε)/n→0`; `512·729=373248 > 53·4096=217088`; `E=max E' 0` | true | none |
| 2.1 Bayes error formula | weights finite positive, `t=π₁/π₀`; `npTest P Q t 0` | risk `=π₀·npSumError`; on reject `p<tq` or `p=0`, integrand `p`; else `tq` | `∫min(π₀p,π₁q)` | none |
| 2.1 `chernoffCoefficient`, Checks | `P=Q`; `δ₀,δ₁`; swapped `(1/4,3/4)`; `(1/2,1/2,0)` vs `(1/4,1/4,1/2)`; closed interval | `1`; `0`; `H_(1/2)=√3/2`, `C=½log(4/3) ≤ ½log 3`; `H_s=2^(s−1)`, inf `1/2`; inf over `[0,1]` also `1/2` | closed-interval sentence false | R01 |
| 2.1 range and products | `H_s ≤ s+(1−s)=1`; `H=0`, `n=0` and `n≥1` | `0·∞=0` gives `H=1` at `n=0`; `n·∞=∞` gives `0ⁿ=0` | true; already in the Rényi roadmap | C01 |
| 2.2 Hellinger bound | swapped pair, equal priors, `n=0..6`, `s=1/2`; priors `(0,∞)`, `(∞,1)`, `(∞,0)`, `(∞,∞)` with singular and non-singular laws | `Pe=1/2,1/4,1/4,5/32,5/32,53/512,53/512`, `Pe² ≤ ¼(3/4)ⁿ` each; RHS `0·∞=0` vs risk `0`; RHS `∞`; singular `n≥1`: both `0` | true for every measure on `Bool` | none |
| 2.3 Chernoff's theorem | swapped pair `n=6`; non-attained pair, priors `(1/10,9/10)`; singular; `π₀=0`; `π₀=∞,π₁=1` | `53·64=3392 < 27·512=13824`; `Pe=min(π₀,π₁2^(−n))`, `=π₁2^(−n)` from `n=4`; `0`; `0` vs `√3/2`; `Qⁿ(pⁿ>0)=1` vs `√3/2` | true; both hypotheses on `π` needed | none |
| 2.3 lower-bound route | `min(e^a,e^b) ≥ e^(sa+(1−s)b)e^(−|b−a|)`; `s*` interior; `s*=0` | exponent `(1−s)(a−b)` or `s(b−a) ≥ −|b−a|`; `h'(s*)=−h(s*)E_R[L]=0`; `0 ≤ ∫_S q log(p/q) ≤ P(S)−Q(S)`, so `E_R[L] ≤ 0` | complete | none |
| Lean vs README | six theorems, five definitions | `E : ℝ≥0` equivalent to real `E > D ≥ 0`; `∀ᶠ n, ∀ φ` order; no section binder lost | agree | none |

- Source locators checked against the text: 0 of 9 (the text was not readable; see below).
- Library declarations opened at the pins: 30 (among them `klDiv_ne_top_iff` at `Mathlib/InformationTheory/KullbackLeibler/Basic.lean:96`, `bayesRisk` at `Mathlib/Probability/Decision/Risk/Defs.lean:54`, `Kernel.boolKernel` at `Mathlib/Probability/Kernel/Basic.lean:432`, `strong_law_ae` at `Mathlib/Probability/StrongLaw.lean:787`, `TauCeti.pi_withDensity` at `TauCeti/MeasureTheory/Measure/PiWithDensity.lean:81`, `TauCeti.klDiv_prod_prod_eq_add` at `TauCeti/InformationTheory/KullbackLeibler/ChainRule.lean:224`); all exist with the stated hypotheses.
- Cross-roadmap citations resolved: 14 (MathematicalStatisticsFoundations 1.3 and 6.2 with four declarations, MathematicalStatisticsNonparametric 1.1, 1.3, 1.4 with six, on main; RenyiDivergenceAndPrivacy 1.1, 1.2, 2.1, 2.2, 3.1, 3.2 at its open head). The two copied definitions agree character for character with their originals.
- Objects searched in the pinned libraries: Hellinger integral, Rényi divergence, Chernoff coefficient, least type II error, Neyman–Pearson, Bayes risk of a pair: none of this roadmap's targets is there.
- Automatic checks: all passed. Dependency check output: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`.
- Elaboration of `TauCetiRoadmap/HypothesisTestingExponents/Suggested.lean`: six `sorry` warnings, nothing else. One-tactic probe (`simp`, `rfl`, `simp` with the five definitions unfolded) on a separate copy of the file: none of the six theorems closes.
- Headlines: weak converse, achievability, strong converse, Stein's lemma, Hellinger bound, Chernoff's theorem; all six stated, none through a stand-in; no padding.
- Pull request text: adds a new roadmap, 6 theorems and 5 definitions, supplier RenyiDivergenceAndPrivacy named; one sentence wrong (C03).

Overlap check: read RenyiDivergenceAndPrivacy, MathematicalStatisticsNonparametric, MathematicalStatisticsFoundations, MathematicalStatisticsAsymptotic, ChannelCoding (and searched PACBayesBounds, ImportanceSamplingAndVarianceReduction, RateDistortionTheory, EvidenceLowerBound for the objects); Hellinger integral, Rényi divergence and their range, symmetry and product forms: RenyiDivergenceAndPrivacy (cited; two facts restated, C01); randomized tests and Neyman–Pearson: MathematicalStatisticsFoundations (cited); testing affinity of one pair and `klDiv_pi`: MathematicalStatisticsNonparametric (cited); least type II error, Stein's lemma, Chernoff coefficient and Bayes exponent: this roadmap only (ChannelCoding puts error exponents outside its scope).

Source independence: 0 passages compared with 1 source, because the text of PolyanskiyWu could not be read; largest share PolyanskiyWu, 9 of 9 locators; contents not compared (table of contents not read). The order weak converse, achievability, strong converse, limit in Layer 1 is forced by the *Needs* lines of 1.5 (1.3 and 1.4).

Research link: Stein's lemma and Chernoff's theorem on the Bayes exponent, as treated in Polyanskiy–Wu 2025, chapters 14 and 16 (README references); the README names no later research that uses them. Rests on the README alone.

## Not verifiable

- Every source locator (1.1: Theorem 14.3, p. 279; 1.2: Theorem 14.8, p. 282, and (14.18), pp. 287–288; 1.3: Theorem 14.14 with Corollary 14.12, pp. 285–288; 1.4: Lemma 14.9, Theorem 14.10, p. 283; 1.5: Definition 14.13, Theorem 14.14, pp. 286–288; 2.2: (14.1), p. 277, §14.4, p. 284; 2.3: Corollary 16.2, p. 315): the sources service refused the URL the README gives for the prepublication version, as not shown to be an author's page, and the published book is behind a paywall. I looked nowhere else.
- The README's description of what Corollary 16.2 assumes (mutual absolute continuity, proofs under a finite log-moment generating function): same reason.
- Wording and arrangement against the source: same reason.

Automatic checks set aside as false positives: none failed; for the operator, the list of Lean declarations counts the words "class is empty" in the docstring of `steinBeta` as a class named `is`.

## Source issues

- none

## For the human reviewers

- **Not tested.** PolyanskiyWu carries all 9 source locators and could not be read (the service did not accept the URL in the README's References as an author's page); wording and table of contents were not compared with it.
- **Licence.** The README cites a prepublication PDF of 16 August 2024 on a host path that appears to be the first author's home directory; its status as an author's page was not settled.
- **Scope.** One source, a textbook. 2.2 and the general form of 2.3 are stated wider than that source and marked "proved here" (README lines 329, 354–356); no refereed source for them at this generality is cited.
