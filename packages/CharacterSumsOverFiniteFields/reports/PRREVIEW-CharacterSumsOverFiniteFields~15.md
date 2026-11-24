# Review of CharacterSumsOverFiniteFields (pull request #3027 at c832fa9)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 59 changed lines since `74a09b7`. It checked the new §3.1a (Gauss's formula for the number `Π_q(n)` of monic irreducible polynomials of degree `n` over `𝔽_q`, the lower bound `n·Π_q(n) ≥ q^n − 2q^{n/2}`, and the two-sided form with the upper bound of SieveMethodsAndPrimePatterns §0.10) together with the dependency lines, scope bullet, supplier contract and references that go with it. The formula, the bounds, the route through the logarithmic derivative of `(1 − qT)⁻¹`, both Checks and the cited Proposition 8.1 of Bary-Soroker–Koukoulopoulos–Kozma are correct as written, and the new supplier is on `main`. Accepted: no finding, one small correction (the description still does not name this roadmap's new section and supplier) and two format notes, none blocking; nothing is left for a human to decide.

## C01 — The description does not say that CharacterSumsOverFiniteFields gains §3.1a and a new supplier

A reader of the description learns that the additions "create new supplier relations between general roadmaps", and the paragraph that lists them names AutomorphicSpectralTheory, AutomorphicBundles and AlgebraicModuliForArithmeticGeometryPartII among others, but not this roadmap. The head adds `### From SieveMethodsAndPrimePatterns` to the supplier contracts (README line 2433) and cites §0.10 from §3.1a (line 632) and from the Dependencies of Layer 3 (line 838). This remark was made on the previous head and the description is unchanged in this respect. A sentence in "For reviewers" would cover it: "CharacterSumsOverFiniteFields gains §3.1a (Gauss's formula for the number `Π_q(n)` of monic irreducible polynomials of degree `n` over `𝔽_q`, and `(q^n − 2q^{n/2})/n ≤ Π_q(n) ≤ q^n/n`), with SieveMethodsAndPrimePatterns §0.10 (the upper bound) as a new supplier."

## N01 — The *Needs:* line of 3.1a could name Mathlib's Möbius inversion as well as the Möbius function

The route of 3.1a (README line 637) is Möbius inversion of `∑_{d ∣ n} d·Π_q(d) = q^n`. Mathlib has it as `ArithmeticFunction.sum_eq_iff_sum_mul_moebius_eq` (`Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean`, line 257), next to `ArithmeticFunction.moebius` (line 54), which the line already names.

## N02 — 3.1a could name the Tau Ceti carrier for the set it counts

The pinned Tau Ceti already has the set of monic irreducible polynomials of a given degree, `Polynomial.monicIrreduciblesOfDegree` (`TauCeti/RingTheory/Polynomial/Monic/Irreducible.lean`, line 52), its finiteness over a finite ring (line 64) and the count in degree one, `Polynomial.ncard_monicIrreduciblesOfDegree_one` (line 93), which is the `n = 1` Check of 3.1a. Naming it in the *Needs:* line would tell an implementer that `Π_q(n)` is `(monicIrreduciblesOfDegree F n).ncard` and not a new definition. The library has no count beyond degree one, so the section's statements are not duplicated.

## Questions for the author

- Is Gauss's formula Proposition 2.1 of Rosen's *Number Theory in Function Fields*, or a corollary of it, and on which page? The citation in 3.1a (line 630) and in the References (line 2462) gives only "Chapter 2", while the Bary-Soroker–Koukoulopoulos–Kozma entry (line 2468) records their reference as Rosen, Proposition 2.1. I could not open Rosen: the book is behind the publisher's paywall.

<details>
<summary>What was checked</summary>

The previous review of this folder had no finding; its small correction (the description) is not repaired and is C01 above, and its format note is N01 above, the passage (`*Needs:* 3.1; SieveMethodsAndPrimePatterns §0.10 …; Mathlib's ArithmeticFunction.moebius`) being unchanged. The folder's change is the same as the one that review read. It was read again line by line against the README at `74a09b7`: no layer, section or item is removed, retitled or renumbered, the two added headings are 3.1a and the supplier subsection, and nothing outside roadmap folders changes. The automatic checks all passed. `Suggested.lean` is unchanged and elaborates with `sorry` as the only warning. The dependency check reports no problem. Gauss's formula, the lower bound with its geometric-sum step, and both Checks of 3.1a were recomputed. Proposition 8.1 (p. 39) of arXiv:2007.14567v3 was read at its locator. SieveMethodsAndPrimePatterns §0.10 was opened on `main` and at this head. Ownership of the count was searched by object in the pinned Mathlib and Tau Ceti and in every roadmap on `main` and at the open heads. Of the seeded sample, only the dependency summaries covering 4.5, 4.7 and 5.4 fall in the change; their *Needs:* lines agree with the rewritten summaries. Not verifiable: Rosen, Chapter 2 (paywalled).

</details>

## Verified sound

| Statement | Instances tried | Values computed (README side / independent side) | Result |
|---|---|---|---|
| 3.1a Gauss's formula `n·Π_q(n) = ∑_{d∣n} μ(n/d) q^d` | `q = 2`, `n = 1, 2, 3, 4, 6`; `q = 3`, `n = 2` | `Π_2 = 2, 1, 2, 3, 9`; `n=6`: `64−8−4+2 = 54 = 6·9`; `𝔽_3`: `9−3 = 6 = 2·3` (`X²+1`, `X²+X+2`, `X²+2X+2`) | holds |
| 3.1a lower bound `n·Π_q(n) ≥ q^n − 2q^{n/2}` | `(q,n) = (2,1), (2,2), (2,4), (2,6), (3,2)` | `2 ≥ −0.83`; `2 ≥ 0`; `12 ≥ 8`; `54 ≥ 48`; `6 ≥ 3` | holds; a negative right side at `n = 1` is harmless |
| 3.1a step `∑_{1≤d≤n/2} q^d ≤ 2q^{n/2}` | `q = 2`, `n = 1, 4, 5, 6`; general `q ≥ 2` | empty sum `0 ≤ 2.83`; `6 ≤ 8`; `6 ≤ 11.3`; `14 ≤ 16`; sum `< q^{⌊n/2⌋}·q/(q−1) ≤ 2q^{n/2}` | holds |
| 3.1a two-sided form over a prime field (Prop. 8.1, p. 39) | bsk2023 lines 2263–2267 | source: `p^k/k − 2p^{k/2}/k ≤ π_p(k) ≤ p^k/k`, `k ∈ ℕ`, monic irreducibles of degree `k` over `𝔽_p`; README: the same for `F` of prime order | agrees; the source cites Rosen, Prop. 2.1 (line 3983) |
| Supplier: SieveMethodsAndPrimePatterns §0.10 upper bound | README on `main`, heading line 812, item line 845 | `jΠ_q(j) ≤ q^j` for a finite field of cardinality `q`, `j ≥ 1`; `𝔽_2`: `2 ≤ 2`, `2 ≤ 4`, `12 ≤ 16` | the statement as consumed; merge order 62 before 171 |
| 3.1 Check `S_n(1) = q^n` (cited by 3.1a) | `T·L′/L` for `L = (1−qT)⁻¹`; `q = 2`, `n = 2, 4` | `qT/(1−qT) = ∑ q^n T^n`; `1·2 + 2·1 = 4`; `2 + 2 + 4·3 = 16` | holds |
| 3.1a Check `q = 2`, `n = 4` | Möbius sum; the variant `μ(d) q^d` | `0·2 − 4 + 16 = 12`, `Π = 3`; the three quartics have `f(0) = f(1) = 1` and are not `(X²+X+1)² = X⁴+X²+1`; variant `2 − 4 + 0 = −2`; bounds `2 ≤ 3 ≤ 4` | true, separates the variant |
| 3.1a Check `n = 1` | count of `X − a`; variant excluding `X` | `Π_q(1) = q = μ(1)·q`; `q − 2√q ≤ q ≤ q`; excluding `X` gives `q − 1 ≠ q` | true; agrees with `ncard_monicIrreduciblesOfDegree_one` |
| Wrong model: irreducibles of degree dividing `n` | `q = 2`, `n = 4` | `2 + 1 + 3 = 6 ≠ 3` | excluded by the first Check |
| Dependency summaries of Layers 3–5 (sample 4.5, 4.7, 5.4) | *Needs:* lines at README 953, 991, 1026, 1156 | 4.5: 3.1, 3.2, 0.3, 0.6; 4.6: 3.1, 3.2; 4.7: 4.2, 4.4, 4.5, 3.2; 5.4: 3.1, 3.2, 0.6; none needs 3.1a | match the rewritten summaries |

- Source locators checked against the text: 2 (bsk2023 Proposition 8.1, p. 39, lines 2263–2267; its reference [35], Rosen, line 3983).
- Library declarations opened at the pins: 5 (`ArithmeticFunction.moebius`, `Moebius.lean:54`; `ArithmeticFunction.sum_eq_iff_sum_mul_moebius_eq`, `:257`; `Polynomial.monicIrreduciblesOfDegree`, `TauCeti/RingTheory/Polynomial/Monic/Irreducible.lean:52`; its finiteness `:64`; `ncard_monicIrreduciblesOfDegree_one`, `:93`); `TauCeti/FieldTheory/Finite/Irreducible.lean:47, 65` gives existence only. No count of monic irreducibles in degree above one at either pin.
- Cross-roadmap citations resolved: 1 (SieveMethodsAndPrimePatterns §0.10, on `main` and identical at this head); FiniteReductiveGroups at this head cites §3.1a (for example lines 1736, 1778), downstream of this roadmap.
- Dependency check output: `depcheck: 132 roadmaps, 1469 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean` (unchanged by the pull request): exit 0, 35 warnings, all `declaration uses 'sorry'`; no `#check` comparison was needed since no declaration changed.
- Headline theorems: unchanged; 3.1a is a supporting section of Layer 3, not a headline, and adds no declaration. Automatic checks: all passed, none set aside.
- Record comparison with `74a09b7`: heading lists differ only by the two added headings (3.1a, `From SieveMethodsAndPrimePatterns`); 8 layers, none removed, retitled or renumbered.
- Overlap check: read PaleyGraphsAndCharacterSums, KloostermanMomentsAndPotentialAutomorphy, KloostermanSheavesAndBesselIsocrystals, CurvesOverFiniteFields, HalfIntegralWeightModularForms (open), HypergeometricMotives, QuadraticCharactersAndReduction, FourierDeligneTransform (on `main`); nothing shared. The upper bound of the count is owned by SieveMethodsAndPrimePatterns §0.10 and cited; no other roadmap states Gauss's formula or the lower bound.

Source independence: changed passages only; 7 passages (the statement of 3.1a, its route, two Checks, the scope bullet, the supplier contract, the two reference entries) compared with 1 readable source (bsk2023 pp. 38–39), none shared beyond the formula; 2 new locators (Rosen Ch. 2, bsk2023 Prop. 8.1); Rosen could not be read; arrangement not compared, since the change adds a section and no layer.

Research link: 3.1a is the prime polynomial theorem that Bary-Soroker, Koukoulopoulos and Kozma (2023, Proposition 8.1) use in their sieve for the irreducibility of random polynomials; the roadmap's Weil, Kloosterman and Gross–Koblitz layers rest on Weil (1948), Schmidt (1973) and Gross–Koblitz (1979), as its References give them. Rests on the README and bsk2023 p. 39.

## Not verifiable

- Rosen, *Number Theory in Function Fields*, Chapter 2 (Gauss's formula, 3.1a): Springer GTM 210, paywalled; the locator was not checked against the text.
- The volume and pages "Invent. Math. 233 (2023), 1041–1120" of the Bary-Soroker–Koukoulopoulos–Kozma entry: not checked against the publisher's page; the README cites the arXiv numbering, which was read.

## Source issues

- **Misprint** in bsk2023 at Proposition 8.1, p. 39 (arXiv v3): the source leaves out the preposition "of" when defining `π_p(k)` as a number of irreducible elements; it should read "the number of irreducible elements"; affects nothing.

## For the human reviewers

- none
