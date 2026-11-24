# Review of RieszSumsOverPrimesAndExceptionalZeros (pull request #3027 at 374b9ce)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RieszSumsOverPrimesAndExceptionalZeros/`
**Verdict:** needs changes

**Summary.** A review of the change against `main`: 297 changed lines since `74a09b7`. I checked the new `*Origin:*`, `*Method of the formal proof:*` and `*Corollary of:*` labels against the sources I could read and against AnalyticNumberTheoryPartI §§1.4e, 1.7a and 1.7b at this head, the new route of 0.30b, the restructured 2.9b and the docstring changes of `Suggested.lean`. There is one finding (P2): the change takes 1.4i (c′) away from the formal proof, but the summary and the heading of 1.4i (b′) still credit the formal proof with (b′) for every `α`, and the formal proof's statement, as the README records it, gives (b′) for no `α`. There are four small corrections and one format note, none blocking; the standing of the formal proof as a source is left to the human reviewers, and both of their decisions were applied.

## R01 (P2) — After the change, the README still credits the formal proof with 1.4i (b′) for every `α`, and the statement it records for the formal proof does not give that

A reader of headline (1) and of 1.4i is told that the formal proof gives the saving `exp(−c₁(log y)^(1−α))` in the range `log f ≤ (log y)^α` for every `α ∈ [1/2, 1)`. By the README's own account it gives a weaker bound, so the attribution this change set out to correct is still wrong in two places. The summary (line 5) says: "This consequence is this roadmap's; the formal proof [FormalProof] proves it when no real `L(s, χ*)` has a real zero in `(1 − c_ex, 1)`". Line 437 heads (b′) "*The form of the formal proof.*", and the Conventions (line 23) define that heading as the form, with its parameters, that the formal proof provides.

Lines 445–448 record the formal proof's statement: for every `ε, A, c, c_ex`, `|G_χ(y)| ≤ y exp(−c x^(ε/8))` whenever `log f_χ ≤ A x^(ε/5)(log x)²` and `y ≥ exp(x^(ε/3))/3`. Both the admissible conductors and the saving grow with `x`, so the best choice is `x = (log 3y)^(3/ε)`. That gives conductors up to about `(log y)^(3/5)(log log y)²` and the saving `exp(−c(log y)^(3/8))`. To give (b′) at `α`, it would need `α ≤ 3/5` for the conductor range and `1 − α ≤ 3/8` for the saving, and no `α` satisfies both. Conversely, (b′) at `α = 31/50` implies the formal proof's statement, since `31/150 > 1/5` and `19/150 > 1/8` (the computation in the Check of FrobeniusRestrictedRieszSums 1.4).

At the merge base the claim rested on 1.4i (c′), which was then credited to the formal proof, through line 448: "For every `α`, (b′) follows from (c′) below by the route of (b)". Lines 515–516 now say that (c′) is not a statement of the formal proof, and nothing else in the README takes its place.

The smallest change:
- In the summary, say that under the same zero-free hypothesis the formal proof proves the weaker form recorded in 1.4i: conductors up to `(log y)^(3/5)` and the saving `exp(−c(log y)^(3/8))`.
- At line 437, remove "*The form of the formal proof.*" from the heading of (b′), for instance as "*The form under a zero-free interval.*", and add to the paragraph after it that the formal proof's statement is the consequence of (b′) at `α = 31/50` written there.

The [FormalProof] entry of the References (line 1245) would then list the parametrised consequence of 1.4i (b′) rather than (b′). If the formal proof does state (b′) for every `α`, cite that statement instead. The description's bullet on §1.4i would change accordingly.

## C01 — The Origin of 1.7a says that (a) is Lemma 2.1 of Kadiri, Ng and Wong, but that lemma states something weaker

Line 551 says "(a) is published as Lemma 2.1 of Kadiri, Ng and Wong (2019)". That lemma (KadiriNgWong2019 lines 103–106, p. 3) is about `P(r, θ) = Σ_j (1 − j/(J+1)) r^j cos jθ` and states three facts: `P ≥ −1/2`, `P(1, 0) = J/2` and `P ≥ −r/(1 + r)`. Neither inequality of (a), with the weights `(1 − j/(J+1))(1 + cos jθ)`, is among them. Both follow from parts (i)–(ii) through the splitting `P(w) + ½P(we^(iθ)) + ½P(we^(−iθ))` that the authors use at (2.2) in the proof of their Theorem 2.2 (lines 146–152). For the second inequality, `Σ c_j cos jθ = P(1, θ) + J/4 + ½P(1, 2θ) ≥ J/4 − 3/4`. The exact wording would be "(a) follows from Lemma 2.1 (i)–(ii) of Kadiri, Ng and Wong (2019), by the splitting in their proof of Theorem 2.2".

## C02 — `Suggested.lean` refers to "the remark of 2.9b", which the README does not have

Lines 23 and 148 of `Suggested.lean` say that the count for every imaginary quadratic field is "stated in the remark of 2.9b". The README states it as (iv) (c) (line 1033), under the paragraph headed **Wider form** (line 891). "stated in the wider form of 2.9b" tells the reader where to look.

## C03 — `Suggested.lean` keeps the repulsion and Linnik's theorem, which AnalyticNumberTheoryPartI's file now states identically, without saying so

This change adds `deuring_heilbronn_repulsion` and `exists_prime_modEq_le` to `TauCetiRoadmap/AnalyticNumberTheoryPartI/Suggested.lean` (lines 486 and 502). Their statements are those of lines 95 and 135 here, up to two differences: `χ₁.IsQuadratic` there for `χ₁ ^ 2 = 1` here, which is equivalent, and the name of the exponent. This module docstring leaves 1.4g (b) out because "it is AnalyticNumberTheoryPartI §1.4e", but says nothing of the kind about these two. An implementer therefore sees two acceptance tests of one theorem and no word that they are the same.

One sentence in the module docstring would settle it: that these two are the statements of AnalyticNumberTheoryPartI §§1.7a and 1.7b, kept here as the record of 1.7b (i) and (iii). Alternatively they could be treated as 1.4g (b) is; that is the author's choice.

## C04 — The description does not say that headline (3) and the statement of 2.9b changed, or that 0.30b no longer cites ZerosOfLFunctions 3.3–3.4

The description mentions this roadmap only for §1.4i. At this head, headline (3) of the summary and the statement at the head of 2.9b are the formal proof's count over `ℚ(√−d)` with `B^A` (`card_primes_norm_one_mod_shortInterval_ge_of_discr_eq_neg_prime`). The count for every imaginary quadratic field with `B²`, formerly the headline, is now the wider form. In addition, 0.30b now proves the polynomial growth of `L(s, χ)` and of `(s − 1)ζ(s)` itself, so ZerosOfLFunctions 3.3–3.4 leave its *Needs:* line and the supplier contracts.

A sentence such as this would say it: "In RieszSumsOverPrimesAndExceptionalZeros, 2.9b and headline (3) now state the formal proof's count over `ℚ(√−d)`, with the count for every imaginary quadratic field as the wider form; 0.30b proves its growth bounds itself and no longer cites ZerosOfLFunctions 3.3–3.4."

## N01 — The reference to Chirre et al. (line 1239) gives the authors as "A. Chirre, A. Simonic and M. Valas Hagen"; arXiv:2206.00819 lists Andrés Chirre, Markus Valås Hagen and Aleksander Simonič, in that order.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Headline (1) consequence and 1.4i (b′), against the formal proof's recorded statement | `x = (log 3y)^(3/ε)`; `α = 3/5`, `31/50` | formal proof: conductors `(log y)^(3/5)(log log y)²`, saving `exp(−c(log y)^(3/8))`; (b′) needs `α ≤ 3/5` and `1 − α ≤ 3/8`: impossible | does not give (b′) | R01 |
| 0.30b new route: value at the centre and growth | `Re z = 2`; `p = 2`; `Re s = −7/4` | `1/ζ(2) ≈ 0.608 > 1/2`; `1 + 2^(7/4) ≈ 4.36 ≤ 8`; three partial summations reach `Re s > −2` | holds | none |
| 0.30b Method: circle of radius `σ` about `σ + it` | `σ ∈ (1, 2]` | the circle lies in `|s − (2 + it)| ≤ 2 ≤ 5/2`, where `g` is bounded; gives `σ^(−k)` | holds | none |
| 1.4g (b) against AnalyticNumberTheoryPartI §1.4e and Bennett–Siksek (26) | `N ≥ 3`, window `(1 − c₁/log N, 1)` | same constants, absolute threshold, factor `(log N)^4` and term `−X^(β₁)/β₁` in all three | holds | none |
| 1.4i `*Corollary of:*` line | nonprincipal and trivial `χ`; (c) | (a) from §1.4e through `G_χ(y) = −y∫_y^∞ψ_χ(u)u^(−2)du`; `G_1` excluded; (c) also needs §0.34, as the line says | holds | none |
| 1.4i (c) implies (c′), in Lean | probe theorem from `norm_rieszRemainder_le` | `obtain` and `exact`, dropping the zero-free hypothesis; elaborates | holds | none |
| 1.7b (i) against AnalyticNumberTheoryPartI §1.7a | `q ≥ 3`, `β₁ ∈ [1/2, 1)`, multiple-zero clause, `ℒ` | same hypotheses and conclusion; Lean identical up to `χ₁² = 1 ⇔ IsQuadratic`; effectivity excluded by the line | holds | C03 |
| 1.7b (iii) against AnalyticNumberTheoryPartI §1.7b | `q ≥ 3`, `a` coprime | least prime `≤ q^L` against `q^A`; Lean identical; `exact?` finds only the file's own declaration | holds | C03 |
| 1.7b (ii), the line for `π`, against Thorner–Zaman Th. 1.4 | `L = ℚ(ζ_q)`, `F = K = ℚ`, `H = G` | `D_K = n_K = 1`, `Q ≤ q`: `x ≥ q^(c₂)`, error `e^(−c₃ log x/log q) + e^(−√(c₃ log x))`, `θ₁ = χ₁(a)` | holds | none |
| 2.9b Origin against Thorner–Zaman Th. 1.4 | ray class field of `K` modulo `𝔪`, `H = G` | `Q ≤ 𝔑𝔪`, `x ≥ (D_K Q n_K^(n_K))^(c₂)`: ray-class counts uniform in field and conductor | holds | none |
| 2.9b (c) implies the moved (c′) | `X ∈ [1, X₀)`; `X = 1` | `B ≥ 900`, `log B ≥ 6.80`: smaller `c` empties `[1, X₀)`; at `X = 1`, `log B ≤ 0` is impossible | holds | none |
| 1.7a (a) against Kadiri–Ng–Wong Lemma 2.1 | weights `(1 − j/(J+1))(1 + cos jθ)` | `Σc_j cos jθ = P(1,θ) + J/4 + ½P(1,2θ) ≥ J/4 − 3/4`; the lemma states only `P ≥ −1/2`, `P(1,0) = J/2` | derived, not stated | C01 |
| 1.4e Origin against Granville–Soundararajan Lemma 2.1 | rectangle `σ₀ < Re z ≤ 1`, `|Im z − t| ≤ y + 3` | `log L(s,χ) = Σ_{n≤y} Λ(n)χ(n)/(n^s log n) + O(…)`, proved in their Lemmas 8.1–8.2 | holds | none |
| 1.4f Origin against Ihara–Murty–Shimura, as quoted | `δ₀ → 1/2` | quoted `2 log log q + 2(1 − log 2) + O(log log q/log q)`; 1.4f (a) gives `(4 + 2ε) log log Q`: an adaptation | holds | none |
| 1.4f Method | `x = (log Q)^(5/2)`, `z = x^400` | `log z = 1000 log log Q`, the constant of (a′) | holds | none |
| 1.4h Method, trivial character | `a = 1`, `w > 1`; `t ∈ (k, k + 1)` | `w·G_1(1/w) = log w + 1 + γ`; `G_1′(t) = Σ_{n≤k} Λ(n)/n − log t + γ` | holds | none |

- Source locators checked against the text: 7. GranvilleSoundararajan2003 lines 296–313 (Lemma 2.1, p. 7); ChirreSimonicHagen2022 lines 36–37 and 639–640 (Ihara–Murty–Shimura, Cor. 3.3.2); KadiriNgWong2019 lines 103–106 and 131–152 (Lemma 2.1, Theorem 2.2, pp. 3–4); KadiriWong2021 lines 207–213 (Theorem 7); ThornerZaman2019 lines 112–127 (Theorem 1.4, p. 3); BennettSiksek2020 lines 793–807 (Theorem 5, (26), p. 17); Gallagher1970 lines 358–395 (Theorem 7 and the Knapowski credit, pp. 336–337).
- Library declarations opened at the pins: Mathlib `DirichletCharacter.LFunction_changeLevel` (NumberTheory/LSeries/DirichletContinuation.lean:149); `LFunction_ne_zero_of_one_le_re` and `LFunction_apply_one_ne_zero` (NumberTheory/LSeries/Nonvanishing.lean:404, 412); `Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le` (Analysis/Complex/Liouville.lean:47); `Chebyshev.psi_le` (NumberTheory/Chebyshev.lean:473). Neither Mathlib nor Tau Ceti has a statement of Linnik's theorem or of the Deuring–Heilbronn repulsion.
- Cross-roadmap citations resolved:
  - AnalyticNumberTheoryPartI §§1.4e, 1.7a, 1.7b at this head (README lines 939–1091, `Suggested.lean` lines 486, 502); its other open revision defines none of these ids.
  - FrobeniusRestrictedRieszSums 1.4 uses 1.4i (b) and (b′).
  - ThetaChainsOnDefiniteUnitaryGroups and ThetaChainsAndFrobeniusPrimeSums cite 2.9b (iv) (c′).
  - GeneralizedRiemannHypothesisFromWindowBounds and ConsequencesOfTheRiemannHypothesisForDirichletLFunctions no longer cite 2.41a.
- Signatures: `#check @` for all seven declarations, in one probe file, elaborated. The statements are those of the merge base (the diff touches docstrings only), and no binder is lost.
- Elaboration: `Suggested.lean` elaborates with seven `sorry` warnings and nothing else. The worker's automatic checks all passed. Dependency check: `depcheck: 132 roadmaps, 1469 edges, 0 problem(s)`.
- Record: no layer, item or heading is removed or renumbered. 2.9b (iv) (c′) moved to the head of 2.9b, with a pointer at its old place. The Lean declaration listed as removed (`for`) was the first word of a docstring line.
- Outside the folder: every changed file lies in a folder the pull request owns or in the family's index.

Overlap check: I read AnalyticNumberTheoryPartI (this head and its other open revision), ZerosOfLFunctions, ExplicitPrimeCounting, ErdosProgressionPowers and LiCoefficientsArithmeticFormula (open heads), and QuadraticTwistSelectionOverPrimes and RiemannHypothesisStatementsAndConsequences (main and this head). Shared objects and their owners:
- The character prime number theorem with the exceptional term, the one-modulus repulsion and Linnik's theorem: AnalyticNumberTheoryPartI §§1.4e, 1.7a, 1.7b. This roadmap restates them as 1.4g (b), 1.7b (i) and (iii) under `*Corollary of:*` lines.
- Riesz sums and remainders: RiemannHypothesisStatementsAndConsequences §8.4a.

Nothing else is shared; ExplicitPrimeCounting §6.5 is the least prime under GRH, a different statement.

Source independence: changed passages only; 9 passages compared with 7 sources (GranvilleSoundararajan2003, ChirreSimonicHagen2022, KadiriNgWong2019, KadiriWong2021, ThornerZaman2019, BennettSiksek2020, Gallagher1970), none shared beyond formulas and titles; largest share Linnik1944a/b and Bombieri1987, 4 each of about 40 locators; the diff adds, removes and reorders no layer, so the contents were not compared again.

Research link: 1.7b is Linnik's theorem with the Deuring–Heilbronn repulsion (Linnik 1944; Knapowski 1962; Bombieri 1987, Th. 13, 16) and Gallagher's theorem (Gallagher 1970, Th. 7; Thorner–Zaman 2019, Th. 1.4); 1.4g (b) is Iwaniec–Kowalski Th. 5.27, used by Bennett–Siksek (2020); 2.9b adapts Thorner–Zaman 2019. Rests on the README and the texts read.

## Not verifiable

- [FormalProof] and [Announcement]: hosts in no licence class. The `*Method of the formal proof:*` labels, the formal proof's file paths and its six declaration names were checked only against the README.
- Koukoulopoulos 2019 (0.30b Origin): the sources service found only the publisher's page (pubs.ams.org), so Lemmas 8.5–8.6, 11.2 and 11.4 were not checked.
- Iwaniec–Kowalski 2004: only the publisher's page. Theorem 5.27 was checked through Bennett–Siksek, Theorem 5, (26).
- Davenport 1980 and Stark 1974: settled as uncertified, cited by locator.
- Ihara–Murty–Shimura 2009: read only as quoted in Chirre et al., arXiv:2206.00819.
- Lagarias–Montgomery–Odlyzko 1979: paywalled (DOI 10.1007). Lemma 4.1 is unchecked; Theorem 4.2 is confirmed only by Kadiri–Ng–Wong's reference to it.
- Fogels 1964: the service found only the publisher's page (impan.pl). Landau 1907, Knapowski 1962 and Turán 1953 were not read; all four are cited only in Method labels or for statements the change does not alter.

## Source issues

- none

## For the human reviewers

- The decision on GeneralizedRiemannHypothesisFromWindowBounds was applied: this README no longer names it as a consumer of 2.41a (summary, Scope), and no section of this roadmap moved.
- The decision on published theorems was applied: no section is removed here. 1.4g (b), 1.7b (i) and (iii) keep their statements with `*Corollary of:*` lines, and AnalyticNumberTheoryPartI §§1.4e, 1.7a and 1.7b at this head state them.
- Licence and standing: the `*Method of the formal proof:*` labels, the formal proof's file paths in 0.30b and 1.7a (c), and R01 rest on [FormalProof] (a GitHub repository) and [Announcement] (20 November 2026), which I could not read.
