# Review of RieszSumsOverPrimesAndExceptionalZeros (pull request #3027 at 3bddf73)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RieszSumsOverPrimesAndExceptionalZeros/`
**Verdict:** needs changes

**Summary.** A review of the change against `main`: 297 changed lines since `b8f3652`. The folder's text is the one the previous review read, so its finding stands; this time the attributions of 1.4i were checked against the source of the formal proof itself, together with the `*Corollary of:*` lines against AnalyticNumberTheoryPartI §§1.4e, 1.7a and 1.7b at this head, the statement at the head of 2.9b, and `Suggested.lean`. There are two findings (P2), both in 1.4i and both about what the formal proof states: the README still credits it with (b′) for every `α`, which its theorem does not give, and the change now denies it the bound for `G_1`, which it states and proves verbatim. There are four small corrections and one format note, none blocking; the standing of the formal proof as a source is left to the human reviewers.

## R01 (P2) — The README credits the formal proof with 1.4i (b′) for every `α`; the theorem the formal proof states gives (b′) for no `α`

A reader of headline (1) and of 1.4i is told that the formal proof gives the saving `exp(−c₁(log y)^(1−α))` in the range `log f ≤ (log y)^α` for every `α ∈ [1/2, 1)`. It gives a weaker bound, so the attribution this change set out to correct is still wrong in two places. The summary (line 5) says: "This consequence is this roadmap's; the formal proof [FormalProof] proves it when no real `L(s, χ*)` has a real zero in `(1 − c_ex, 1)`". Line 437 heads (b′) "*The form of the formal proof.*", and the Conventions (line 23) define that heading as the form, with its parameters, that the formal proof provides.

The formal proof's statement is `QH.thin` (`Development/AutomorphicArithmetic/MeanSquareBounds/Thin.lean`, line 10), and the README records it correctly at lines 445–448: for every `ε, A, c, c₀ > 0` there is `x₀` with `|G_χ(y)| ≤ y exp(−c x^(ε/8))` whenever `x ≥ x₀`, `log f_χ ≤ A x^(ε/5)(log x)²` and `y ≥ exp(x^(ε/3))/3`. No other declaration of the proof bounds `G_χ` with a pair of exponents `(α, 1 − α)`. The best choice is `x = (log 3y)^(3/ε)`, which gives conductors up to about `(log y)^(3/5)(log log y)²` and the saving `exp(−c(log y)^(3/8))`. To give (b′) at `α` it would need `α ≤ 3/5` for the conductor range and `1 − α ≤ 3/8`, that is `α ≥ 5/8`, for the saving; no `α` satisfies both. Conversely (b′) at `α = 31/50` implies the formal proof's statement, since `31/150 > 1/5` and `19/150 > 1/8`. Line 448, "For every `α`, (b′) follows from (c′) below by the route of (b)", rested on (c′) being the formal proof's, which lines 515–516 now deny.

The smallest change:
- In the summary, say that under the same zero-free hypothesis the formal proof proves the weaker form recorded in 1.4i: conductors up to `(log y)^(3/5)` and the saving `exp(−c(log y)^(3/8))`.
- At line 437, replace "*The form of the formal proof.*" in the heading of (b′), for instance by "*The form under a zero-free interval.*", and say in the paragraph after it that the formal proof's statement is the consequence of (b′) at `α = 31/50` written there.

The [FormalProof] entry of the References (line 1245), the `*Origin:*` label of 1.4i (line 395), the Status lines (421, 516) and the two docstrings of `Suggested.lean` that say "the statement of the formal proof in 1.4i is (b′)" would then name the parametrised consequence of (b′) rather than (b′). The description's bullet on §1.4i ("only one, (b′), is a statement of it") would change with them.

## R02 (P2) — The change says that the bound for `G_1` is not a statement of the formal proof; the formal proof states and proves it

At the merge base the Status of 1.4i (a) read "The bound for `G_1` is that of the formal proof", and the References listed "the bound for `G_1`" among what the formal proof gives. The change reverses both. The summary (line 5) now says "the bound for `G_1` is also this roadmap's"; the `*Origin:*` label (lines 393–394) says "the bounds for `G_1`, are this roadmap's own formulations"; the Status of (a) (lines 421–422) says "The bound for `G_1` is also this roadmap's own", under a heading the Conventions define as "not a statement of [FormalProof]"; and the References entry drops the bound.

The formal proof has it. `Formalism.ZF.GzPNT` (`Formalism/ZeroFreeRegion/Statement.lean`, lines 16–18) is the proposition that there are `c > 0` and `K` with `|Gz y| ≤ K y exp(−c√(log y))` for every `y ≥ 2`, where `Formalism.Gz x = Σ_{n≤x} Λ(n)(x/n − 1) − x log x + (1 + γ)x` (`Formalism/StatementOC.lean`, lines 11–13) is the `G_1` of 1.4h. It is proved as `Formalism.ZF.gzPNT` (`Formalism/ZeroFreeRegion/LogDerivRegion.lean`, line 20) and used downstream, for example in `Formalism/LandauZeroFreeBounds/SiegelWalfiszAPOfSiegelLower.lean`, line 24. Range, shape and constants agree with the bound for `G_1` in (a), (c) and (c′).

The smallest change is to restore the three sentences: "the bound for `G_1` is that of the formal proof" in the summary and in the Status of (a); "the bounds for `G_χ` in (a), (b), (c) and (c′) are this roadmap's own formulations" in the `*Origin:*` label, with the bound for `G_1` named as a statement of [FormalProof]; and "the bound for `G_1`" back in the list of the References entry. The `*Method of the formal proof:*` label could add that the proof obtains it from the zero-free region of `ζ` by Perron's formula and a contour shift.

## C01 — The Origin of 1.7a says that (a) is Lemma 2.1 of Kadiri, Ng and Wong, but that lemma states something weaker

Lines 551–552 say "(a) is published as Lemma 2.1 of Kadiri, Ng and Wong (2019)". That lemma (arXiv:1902.08640v1, p. 3) is about `P(r, θ) = Σ_j (1 − j/(J+1)) r^j cos jθ` and states three facts: `P ≥ −1/2`, `P(1, 0) = J/2` and `P ≥ −r/(1 + r)`. Neither inequality of (a), with the weights `(1 − j/(J+1))(1 + cos jθ)`, is among them. Both follow from parts (i)–(ii) through the splitting `P(w) + ½P(we^(iθ)) + ½P(we^(−iθ))` that the authors use in the proof of their Theorem 2.2: for the second, `Σ c_j cos jθ = P(1, θ) + J/4 + ½P(1, 2θ) ≥ J/4 − 3/4`. The exact wording would be "(a) follows from Lemma 2.1 (i)–(ii) of Kadiri, Ng and Wong (2019), by the splitting in their proof of Theorem 2.2".

## C02 — `Suggested.lean` refers to "the remark of 2.9b", which the README does not have

Lines 23 and 148 of `Suggested.lean` say that the count for every imaginary quadratic field is "stated in the remark of 2.9b". The README states it as (iv) (c), under the paragraph headed **Wider form** (line 891). "stated in the wider form of 2.9b" tells the reader where to look.

## C03 — `Suggested.lean` keeps the repulsion and Linnik's theorem, which AnalyticNumberTheoryPartI's file states identically at this head, without saying so

`TauCetiRoadmap/AnalyticNumberTheoryPartI/Suggested.lean` declares `deuring_heilbronn_repulsion` and `exists_prime_modEq_le` (lines 486 and 502). Their statements are those of lines 95 and 135 here, up to `χ₁.IsQuadratic` there for `χ₁ ^ 2 = 1` here and the name of the exponent. This module docstring leaves 1.4g (b) out because "it is AnalyticNumberTheoryPartI §1.4e", but says nothing of the kind about these two, so an implementer sees two acceptance tests of one theorem and no word that they are the same.

One sentence in the module docstring would settle it: that these two are the statements of AnalyticNumberTheoryPartI §§1.7a and 1.7b, kept here as the record of 1.7b (i) and (iii). Alternatively they could be treated as 1.4g (b) is; that is the author's choice.

## C04 — The description does not say that headline (3) and the statement of 2.9b changed, or that 0.30b no longer cites ZerosOfLFunctions 3.3–3.4

The description mentions this roadmap only for §1.4i. At this head, headline (3) of the summary and the statement at the head of 2.9b are the formal proof's count over `ℚ(√−d)` with `B^A`; the count for every imaginary quadratic field with `B²`, formerly the headline, is the wider form. In addition 0.30b now proves the polynomial growth of `L(s, χ)` and of `(s − 1)ζ(s)` itself, so ZerosOfLFunctions 3.3–3.4 leave its `*Needs:*` line and the supplier contracts.

A sentence such as this would say it: "In RieszSumsOverPrimesAndExceptionalZeros, 2.9b and headline (3) now state the formal proof's count over `ℚ(√−d)`, with the count for every imaginary quadratic field as the wider form; 0.30b proves its growth bounds itself and no longer cites ZerosOfLFunctions 3.3–3.4."

## N01 — The reference to Chirre et al. (line 1239) gives the authors as "A. Chirre, A. Simonic and M. Valas Hagen"; arXiv:2206.00819v2 lists Andrés Chirre, Markus Valås Hagen and Aleksander Simonič, in that order.

## Previous findings

- R01 — not repaired: the folder's text is unchanged since the head the previous review read. Line 5 still says "the formal proof [FormalProof] proves it when no real `L(s, χ*)` has a real zero in `(1 − c_ex, 1)`" and line 437 still heads (b′) "*The form of the formal proof.*". Raised again as R01, now checked against the formal proof's theorem.
- C01, C02, C03, C04, N01 — not repaired (same text); repeated above.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Headline (1) consequence and 1.4i (b′), against `QH.thin` | `x = (log 3y)^(3/ε)`; `α = 1/2, 3/5, 31/50, 5/8, 7/10` | conductors `(log y)^(3/5)`, saving `exp(−c(log y)^(3/8))`; needs `α ≤ 3/5` and `α ≥ 5/8`: none; `31/150 > 1/5`, `19/150 > 1/8` | formal proof weaker than (b′) | R01 |
| 1.4i bound for `G_1`, against `Formalism.ZF.GzPNT` | `y ≥ 2`; definition of `Gz` | proof: `|Gz y| ≤ K y exp(−c√log y)`, `Gz = Σ Λ(n)(x/n − 1) − x log x + (1+γ)x`; README: same | is a statement of the proof | R02 |
| 1.4i (c′), attribution | search of the proof for bounds on `G_χ` | only `QH.thin` and its consumers; `QH.psi_thin` bounds `ψ_χ`, not `G_χ` | not a top-level statement, as the README says | none |
| 1.4i `*Corollary of:*` line | nonprincipal `χ`; trivial `χ`; (c) | (a) from §1.4e through `G_χ(y) = −y∫_y^∞ψ_χ u^(−2)du`; `G_1` excluded; (c) needs §0.34 | holds | none |
| 1.4g (b) against AnalyticNumberTheoryPartI §1.4e | `N ≥ 3`, window `(1 − c₁/log N, 1)` | same threshold, factor `(log N)^4`, term `−X^(β₁)/β₁`, both sides | holds | none |
| 1.7b (i) against AnalyticNumberTheoryPartI §1.7a | `q ≥ 3`, `β₁ ∈ [1/2, 1)`, multiple-zero clause | same hypotheses and conclusion; Lean identical up to `χ₁² = 1` against `IsQuadratic` | holds | C03 |
| 1.7b (iii) against AnalyticNumberTheoryPartI §1.7b | `q ≥ 3`, `a` coprime | `p ≤ q^L` against `q^A`; Lean statements identical | holds | C03 |
| 1.7a (a), Fejér weights | `J = 1, 2, 3, 5, 10, 37`; 4000 random `(θ, w)` each, `|w| ≤ 1` | minimum of first sum `−1.0000`; minimum of second minus `(J/4 − 3/4)`: `1.3·10⁻¹⁰` | holds, both sharp | none |
| 1.7a (a) against Kadiri–Ng–Wong Lemma 2.1 | weights `(1 − j/(J+1))(1 + cos jθ)` | lemma: `P ≥ −1/2`, `P(1,0) = J/2`, `P ≥ −r/(1+r)`; (a) needs `P(1,θ) + J/4 + ½P(1,2θ)` | derived, not stated | C01 |
| 2.9b (iv) (c′) and headline (3), against the proof's short-interval theorem | `X = 1`; `B ≥ 900` | proof: `∃ A c c′`, `X ≥ 1`, `log B ≤ c√log X`, `e^(−c√log X) ≤ h ≤ 1`, `c′hX/B^A`; at `X = 1`, `log B ≤ 0` impossible | holds (vacuous at `X = 1`) | none |
| 1.4f against Ihara–Murty–Shimura as quoted | — | quoted `2 log log q + 2(1 − log 2) + O(log log q/log q)` under GRH; 1.4f is unconditional in a box: an adaptation | holds | N01 |
| 0.30b, 1.4e, 1.4h labels: declarations named | six names the README cites from the proof | all six are declarations of the proof (4 theorems, 2 definitions) | exist | none |
| 2.41a | diff of the section | no line of the section changed; only the summary's sentence on its consumer | unchanged | none |

- Source locators checked against the text: 3 this round (KadiriNgWong2019, arXiv:1902.08640v1, Lemma 2.1, lines 103–106; ChirreSimonicHagen2022, arXiv:2206.00819v2, lines 8 and 36–37; the formal proof at four declarations).
- Formal proof declarations opened: `QH.thin`, `QH.psi_thin`, `Formalism.ZF.GzPNT` and `gzPNT`, `Formalism.Gz`, the short-interval theorem of `GlobalInterpolation/TrivialClassShortInterval.lean`; six further names confirmed to exist.
- Cross-roadmap citations resolved: AnalyticNumberTheoryPartI §§1.4e, 1.7a, 1.7b at this head (README lines 945, 1047, 1073; `Suggested.lean` lines 486, 502). Its changes since the previous review touch `*Needs:*` lines only, none in these sections.
- Elaboration: `Suggested.lean` elaborates with seven `sorry` warnings and nothing else; the statements are those of the merge base (the diff touches docstrings only). The automatic checks all passed.
- Dependency check: `depcheck: 129 roadmaps, 1441 edges, 0 problem(s)`.
- Record: no layer, item or heading is removed or renumbered.
- Outside the folder: every changed file lies under `TauCetiRoadmap/`, in a folder the pull request owns or in a family index.

Overlap check: read AnalyticNumberTheoryPartI (this head), QuadraticTwistSelectionOverPrimes and RiemannHypothesisStatementsAndConsequences (this head), ZerosOfLFunctions (this head); LiCoefficientsArithmeticFormula and SpecialFunctionsGamma name none of these objects. Shared: the character prime number theorem with the exceptional term, the one-modulus repulsion and Linnik's theorem, owner AnalyticNumberTheoryPartI §§1.4e, 1.7a, 1.7b, restated here under `*Corollary of:*` lines; Riesz sums, owner RiemannHypothesisStatementsAndConsequences §8.4a. Nothing else is shared.

Source independence: changed passages only; 5 passages compared with 3 sources (KadiriNgWong2019, ChirreSimonicHagen2022, the formal proof), none shared beyond formulas and declaration names; largest share Linnik1944a/b and Bombieri1987, 4 each of about 40 locators; the diff adds, removes and reorders no layer, so the contents were not compared.

Research link: 1.7b is Linnik's theorem with the Deuring–Heilbronn repulsion (Linnik 1944; Bombieri 1987) and Gallagher's theorem (Gallagher 1970; Thorner–Zaman 2019, Th. 1.4); 1.4g (b) is Iwaniec–Kowalski Th. 5.27, used by Bennett–Siksek (2020); 2.9b adapts Thorner–Zaman 2019. Rests on the README and the texts read.

## Not verifiable

- Koukoulopoulos 2019 (0.30b Origin), Iwaniec–Kowalski 2004, Lagarias–Montgomery–Odlyzko 1979, Fogels 1964: publisher's pages only; not read.
- Davenport 1980 and Stark 1974: settled as uncertified, cited by locator.
- Ihara–Murty–Shimura 2009: read only as quoted in arXiv:2206.00819v2.
- Granville–Soundararajan 2003, Thorner–Zaman 2019, Bennett–Siksek 2020 and Gallagher 1970 were not reread this round; the text citing them is unchanged since the previous review, which read them.
- [Announcement]: not read.

## Source issues

- none

## For the human reviewers

- The decision on GeneralizedRiemannHypothesisFromWindowBounds was applied: this README no longer names it as a consumer of 2.41a, and no section of this roadmap moved.
- The decision on published theorems was applied: no section is removed here; 1.4g (b), 1.7b (i) and (iii) keep their statements under `*Corollary of:*` lines, and AnalyticNumberTheoryPartI §§1.4e, 1.7a, 1.7b at this head state them.
- Licence: R01 and R02 rest on [FormalProof], read in a clone of its public GitHub repository, which carries no licence; declaration names and file paths are cited, no code.
