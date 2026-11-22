# Review of HypothesisTestingExponents (pull request #2993 at d9d5da8)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review (the false sentence that a closed interval of orders would change the Chernoff coefficient) is repaired in the Check of 2.1, in the Conventions and in the description, and the three small corrections are applied; the rewritten passages were recomputed and hold. There is one format note and no small correction. The roadmap's only source still could not be read through the project's sources service, so its locators remain unverified; that, the terms of use of the prepublication text and the single-source basis are left to the human reviewers.

## N01 — Three sentences describe the supplier's Lean file rather than its mathematics

In the *Range* and *Products* bullets of 2.1 (lines 287, 296), in the last Check of 2.1 (line 328), in the scope paragraph (line 454) and in the supplier contract (lines 535, 549) the text says that an item of RenyiDivergenceAndPrivacy has "no Lean declaration". This is true at that roadmap's head, and it stops being true the day that roadmap states the item formally. Would read as well without it: "the *Range* item of RenyiDivergenceAndPrivacy 1.1; its short proof is repeated here because 2.3 uses the pointwise bound".

## Previous findings

- R01 — repaired: "since `H_s ≤ 1`, the infimum over the closed interval is the same `1/2`, and it is attained at no order" (line 321); the Conventions now say the endpoints "would not change them" (line 64).
- C01 — repaired: the *Range*, *Skew symmetry* and finite-product items are cited to RenyiDivergenceAndPrivacy 1.1 and 3.2 (lines 285–307, 328, 451–455, 534–551); the short proofs are kept as routes, and only the translation to `Hⁿ` is claimed as new.
- C02 — repaired: "gives `limsup −(1/n) log β_n ≤ D(P ‖ Q)/(1 − ε)`, which for `0 < D(P ‖ Q) < ∞` exceeds `D(P ‖ Q)` for every `0 < ε < 1`" (lines 140–141).
- C03 — repaired: the description now reads "the infimum runs over the open interval of orders, where the copied definition has no `0^0`; it need not be attained (Check of 2.1)".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions, endpoint values of `H_s` | `s = 0`, `s = 1`; `P = (1/2, 1/2, 0)`, `Q = (1/4, 1/4, 1/2)` | `∫ p⁰ q = Q(X) = 1` (not `Q(p>0) = 1/2`); `∫ p q⁰ = P(X) = 1`; `inf({2^(s−1)} ∪ {1}) = 1/2` | endpoints do not change the infimum | none |
| 1.2 second Check | `P = (1/2, 1/2)`, `Q = (1/4, 3/4)`, `ε = 1/2`, `n = 6`; `P = Q` | `D = 0.1438`, `D/(1−ε) = 0.2877 > D`; `−(1/6) log(53/512) = 0.378 ≤ 0.2877 + log 2/3 = 0.519`; `P = Q`: `0 = 0`, now excluded | true as restated | none |
| 2.1 *Range* | `P = Q`; `δ₀, δ₁`; swapped pair `(1/4, 3/4)`, `(3/4, 1/4)`, `s = 1/2` | `1`; `0` (`p q = 0` everywhere); `√3/2 ≤ 1`; agrees with RenyiDivergenceAndPrivacy 1.1 *Range* (probability measures, `0 < α < 1`) | true; citation resolves | none |
| 2.1 *Products*, translation to `Hⁿ` | swapped pair, `s = 1/2`, `n = 2`; `δ₀, δ₁`, `n = 0, 2`; `H > 0` general | `H₂ = 4 · 3/16 = 3/4 = (√3/2)²`; `n = 2`: divergence `2 · ∞ = ∞`, so `H₂ = 0 = 0²`; `n = 0`: empty sum `0`, `H₀ = 1 = 0⁰`; `log Hₙ/(s−1) = n log H/(s−1)` with both sides `≥ 0`, `ofReal` injective | true for every `n` | none |
| 2.1 Check, infimum not attained | `P = (1/2, 1/2, 0)`, `Q = (1/4, 1/4, 1/2)` | `H_s = 2^(s−1) > 1/2` on `(0, 1)`; `H_0 = H_1 = 1`; infimum over `[0, 1]` and over `(0, 1)` both `1/2` | true | none |
| 2.1 Check, skew symmetry citation | `H_s(P, Q)` vs `H_(1−s)(Q, P)`, swapped pair, `s = 1/4` | both `(1/4)^(1/4)(3/4)^(3/4) + (3/4)^(1/4)(1/4)^(3/4) = 0.8989`; supplier 1.1 states it for `0 < α < 1` | true; citation resolves | none |
| 2.3 Check, coefficient not attained | same pair, priors `(1/10, 9/10)`, `n = 3, 4` | `Pe(n) = min(π₀, π₁ 2^(−n))`: `min(0.1, 0.1125) = 0.1`; `min(0.1, 0.05625) = 0.05625`; root `→ 1/2` | true | none |
| 2.3 `tendsto_bayesRisk_rpow` (cited by the changed Check) | singular laws; `π₀ = 0` | `Pe = 0` for `n ≥ 1`, coefficient `0`; `Pe = 0` against `√3/2` | hypotheses needed, as stated | none |

The rows for the untouched statements stand as in the previous review, of `618a29c`.

- Source locators checked against the text: 0 (the text is still not readable through the sources service; see below).
- Cross-roadmap citations resolved at the open head of RenyiDivergenceAndPrivacy: 5 (1.1 *Range* and *Skew symmetry*, 1.2 definition of `renyiDiv`, 3.2 `renyiDiv_prod` and its finite form over `Fin n` with value `0` at `n = 0`); its `Suggested.lean` declares `renyiDiv_prod` and none of the three README items, as this README says.
- Web page read: the first author's publications page has the section "Books, notes, code" and links the prepublication text under the terms the References quote.
- The change touches the README only (54 insertions, 29 deletions); no Lean declaration changed and nothing outside the folder.
- Automatic checks: all passed. Dependency check output: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`.
- Elaboration of `TauCetiRoadmap/HypothesisTestingExponents/Suggested.lean`: six `sorry` warnings, nothing else.
- Pull request text: agrees with this head (new roadmap, 6 theorems, 5 definitions, supplier RenyiDivergenceAndPrivacy with the range, skew symmetry and finite form named).

Overlap check: read RenyiDivergenceAndPrivacy, MathematicalStatisticsNonparametric, MathematicalStatisticsFoundations, MathematicalStatisticsAsymptotic, ChannelCoding (as in the previous review; RenyiDivergenceAndPrivacy read again at its head); Hellinger integral, Rényi divergence and their range, skew symmetry and product forms: RenyiDivergenceAndPrivacy (cited); randomized tests and Neyman–Pearson: MathematicalStatisticsFoundations (cited); testing affinity of one pair and `klDiv_pi`: MathematicalStatisticsNonparametric (cited); least type II error, Stein's lemma, Chernoff coefficient and Bayes exponent: this roadmap only.

Source independence: changed passages only; 0 passages compared with 1 source, because the text of PolyanskiyWu could not be read; largest share PolyanskiyWu, 9 of 9 locators; contents not compared (table of contents not read; the change adds, removes and reorders no layer).

Research link: Stein's lemma and Chernoff's theorem on the Bayes exponent, as treated in Polyanskiy–Wu 2025, chapters 14 and 16 (README references); the README names no later research that uses them. Rests on the README alone.

## Not verifiable

- Every source locator (1.1: Theorem 14.3, p. 279; 1.2: Theorem 14.8, p. 282, and (14.18), pp. 287–288; 1.3: Theorem 14.14 with Corollary 14.12, pp. 285–288; 1.4: Lemma 14.9, Theorem 14.10, p. 283; 1.5: Definition 14.13, Theorem 14.14, pp. 286–288; 2.2: (14.1), p. 277, §14.4, p. 284; 2.3: Corollary 16.2, p. 315): the sources service again refused the URL of the prepublication version (its path carries only the author's initials, so it is not shown to be an author's page), and the published book's page is on a host in no licence class. I looked nowhere else.
- The README's description of what Corollary 16.2 assumes, and the wording and arrangement against the source: same reason.

## Source issues

- none

## For the human reviewers

- **Not tested.** PolyanskiyWu carries all 9 source locators and could not be read through the sources service; wording and table of contents were not compared with it.
- **Licence.** The first author's publications page (the URL in the README's References) links the prepublication PDF with the notice: personal use only, not for redistribution, resale or derivative works. The README gives locators only.
- **Scope.** One source, a textbook. 2.2 and the general form of 2.3 are stated wider than that source and marked as proved in the README (lines 344, 369–371); no refereed source for them at this generality is cited.
