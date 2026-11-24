# Review of CharacterSumsOverFiniteFields (pull request #3027 at e7914b5)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 59 changed lines since `aecb53a`. It checked the new §3.1a (Gauss's formula for the number of monic irreducible polynomials over `𝔽_q`, the lower bound `n·Π_q(n) ≥ q^n − 2q^{n/2}`, and the two-sided form with the upper bound of SieveMethodsAndPrimePatterns §0.10) and the dependency lines, scope bullet, supplier contract and references that go with it. The formula, both bounds, the derivation from the logarithmic derivative of `(1 − qT)⁻¹`, both Checks and the cited Proposition 8.1 of Bary-Soroker–Koukoulopoulos–Kozma are correct as written, and the new supplier is on `main` and earlier in the merge order. Accepted: there is no finding, one small correction (the description does not name the new supplier) and one format note, neither blocking, and nothing is left for a human to decide.

## C01 — The description does not say that CharacterSumsOverFiniteFields gains §3.1a and a new supplier

A reader of the description learns that general roadmaps receive sections and new suppliers, but the paragraph that lists the new supplier relations names AutomorphicBundles, AlgebraicModuliForArithmeticGeometryPartII, ComplexComparisonPartII, ExplicitNumberFields and ArithmeticKTheory, and not this roadmap. The head adds `### From SieveMethodsAndPrimePatterns` to the supplier contracts and cites §0.10 from §3.1a and from the Dependencies of Layer 3 (README line 837). A sentence in "For reviewers" would cover it: "CharacterSumsOverFiniteFields gains §3.1a (Gauss's formula for the number `Π_q(n)` of monic irreducible polynomials of degree `n` over `𝔽_q`, and `(q^n − 2q^{n/2})/n ≤ Π_q(n) ≤ q^n/n`), with SieveMethodsAndPrimePatterns §0.10 (the upper bound) as a new supplier."

## N01 — The *Needs:* line of 3.1a could name Mathlib's Möbius inversion as well as the Möbius function

The route of 3.1a (README line 637) is Möbius inversion of `∑_{d ∣ n} d·Π_q(d) = q^n`, and Mathlib has it as `ArithmeticFunction.sum_eq_iff_sum_mul_moebius_eq` (`Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean`, line 257), next to `ArithmeticFunction.moebius` (line 54), which the line already names.

## Questions for the author

- Is Gauss's formula Proposition 2.1 of Rosen's *Number Theory in Function Fields*, or a corollary of it, and on which page? The citation at 3.1a (line 630) and in the References (line 2462) gives only "Chapter 2", while the Bary-Soroker–Koukoulopoulos–Kozma entry (line 2468) records their reference as Rosen, Proposition 2.1. I could not open Rosen: the book is behind the publisher's paywall.

<details>
<summary>What was checked</summary>

The change was read line by line against the README at `aecb53a`. No layer, section or item is removed or renumbered, and the new id 3.1a is fresh. The automatic checks all passed. `Suggested.lean` is unchanged and still elaborates, with `sorry` as the only warning. The dependency check reports no problem. Gauss's formula, the lower bound and its geometric-sum step, and the Checks of 3.1a were recomputed at `q = 2` (`n = 1, …, 6`) and `q = 3` (`n = 2`). Proposition 8.1 (p. 39) of arXiv:2007.14567v3 was read at its locator. SieveMethodsAndPrimePatterns §0.10 was opened on `main`. Ownership was checked against the pinned Mathlib and Tau Ceti, FunctionFieldArithmetic §5.1, and the closest open roadmaps and roadmaps on `main`. Not verifiable: Rosen, Chapter 2 (paywalled). Of the seeded sample, only the dependency summaries of 4.5–4.9 and 5.4 fall in the change. Their *Needs:* lines agree with the rewritten summaries.

</details>

## Verified sound

| Statement | Instances tried | Values computed (README side / independent side) | Result |
|---|---|---|---|
| 3.1a Gauss's formula `n·Π_q(n) = ∑_{d∣n} μ(n/d) q^d` | `q = 2`, `n = 1…6`; `q = 3`, `n = 2` | `Π_2 = 2,1,2,3,6,9`; `n=6`: `64−8−4+2 = 54 = 6·9`; `𝔽_3`: `9−3 = 6`, three quadratics `X²+1, X²+X+2, X²+2X+2` | holds |
| 3.1a lower bound `n·Π_q(n) ≥ q^n − 2q^{n/2}` | `(2,1),(2,2),(2,4),(2,6),(3,2)` | `2 ≥ −0.83`; `2 ≥ 0`; `12 ≥ 8`; `54 ≥ 48`; `6 ≥ 3` | holds; negative right side for `n = 1`, `q ≤ 3` is harmless |
| 3.1a step `∑_{1≤d≤n/2} q^d ≤ 2q^{n/2}` | `q = 2`, `n = 4, 5, 6`; general `q` | `6 ≤ 8`; `6 ≤ 11.31`; `14 ≤ 16`; sum `< q^{⌊n/2⌋}·q/(q−1) ≤ 2q^{n/2}` | holds for `q ≥ 2` |
| 3.1a two-sided form, prime fields (BSKK Prop. 8.1, p. 39) | source at bsk2023 lines 2263–2266 | source: `p^k/k − 2p^{k/2}/k ≤ π_p(k) ≤ p^k/k`, `k ∈ ℕ`; README: same with `F` of prime order | agrees; Rosen Prop. 2.1 cited there (line 3983) |
| Supplier: SieveMethodsAndPrimePatterns §0.10 upper bound | `main` line 845, field of cardinality `q`, `j ≥ 1` | `jΠ_q(j) ≤ q^j`; `𝔽_2`: `j=1`: `2 = 2`, `j=2`: `2 ≤ 4` | statement as consumed; order 62 < 171 |
| 3.1 Check `S_n(1) = q^n` (cited by 3.1a) | log-derivative of `(1−qT)⁻¹`; `q = 2`, `n = 2, 4` | `T·L′/L = qT/(1−qT)`; `2+2 = 4`; `2+2+4·3 = 16` | holds |
| 3.1a Check `q = 2`, `n = 4` | Möbius sum; wrong variant `μ(d)q^d` | `0·2 − 4 + 16 = 12`, `Π = 3`; variant `2 − 4 + 0 = −2`; quartics have `f(0)=f(1)=1`, none is `(X²+X+1)² = X⁴+X²+1` | true, separates variant |
| 3.1a Check `n = 1` | count of `X − a`; variant excluding `X` | `Π_q(1) = q = μ(1)q`; bounds `q − 2√q ≤ q ≤ q`; excluding `X` gives `q − 1` | true, separates `N*_q` |
| Wrong model: count of irreducibles of degree dividing `n` | `q = 2`, `n = 4` | `∑_{d∣4} Π_2(d) = 2+1+3 = 6 ≠ 3` | excluded by the first Check |
| Dependency lines of Layers 3–5 (sample 4.5, 4.7; 5.4) | *Needs:* lines at README 953, 991, 1026, 1156 | 4.5: 3.1, 3.2, 0.3, 0.6; 4.6: 3.1, 3.2; 4.7: 4.2, 4.4, 4.5, 3.2; 5.4: 3.1, 3.2, 0.6 | match the rewritten summaries |

- Source locators checked against the text: 2 (bsk2023 Proposition 8.1, p. 39, lines 2263–2266; its reference [35] = Rosen, line 3983); the DOI 10.1007/s00222-023-01193-6 confirmed on the arXiv abstract page.
- Library declarations opened at the pins: `ArithmeticFunction.moebius` (`Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean:54`), `ArithmeticFunction.sum_eq_iff_sum_mul_moebius_eq` (same file, line 257); no count of monic irreducibles in Mathlib or Tau Ceti (`TauCeti/FieldTheory/Finite/Irreducible.lean:45–60` gives existence only).
- Cross-roadmap citations resolved: SieveMethodsAndPrimePatterns §0.10 (heading line 812, item line 845, on `main` and identical at the head); FiniteReductiveGroups at the head cites §3.1a eight times (e.g. lines 1698, 1740), downstream of this roadmap.
- Dependency check output: `depcheck: 65 roadmaps, 799 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean` (unchanged by the pull request): exit 0, 35 warnings, all `declaration uses 'sorry'`.
- Automatic checks: all passed. The signature leads on `crtFactorLeft`/`crtFactorRight` are anonymous explicit coprimality arguments, not lost binders. The citation leads are an existing module (`TauCeti/NumberTheory/NumberField/Cyclotomic/Three/CubicReciprocity.lean`) and three LMFDB knowl names. All are in untouched text and none is a defect.
- Record comparison with `aecb53a`: 8 layers, none removed, retitled or renumbered; the 2 added headings are 3.1a and the supplier subsection.
- Overlap check: read PaleyGraphsAndCharacterSums, KloostermanMomentsAndPotentialAutomorphy, KloostermanSheavesAndBesselIsocrystals, CurvesOverFiniteFields, HalfIntegralWeightModularForms (open), HypergeometricMotives, QuadraticCharactersAndReduction, FourierDeligneTransform (on `main`), and also FunctionFieldArithmetic §5.1. Nothing is shared: the upper bound is owned by SieveMethodsAndPrimePatterns §0.10 and cited, and FunctionFieldArithmetic §5.1 counts places of a general function field, a different object.

Source independence: changed passages only; 7 passages (3.1a statement, route, two Checks, scope bullet, supplier contract, two reference entries) compared with 1 readable source (bsk2023 pp. 38–39), none shared beyond the formula; 2 new locators (Rosen Ch. 2, bsk2023 Prop. 8.1); arrangement not compared, since the change adds a section and no layer.

Research link: 3.1a is the prime polynomial theorem that Bary-Soroker, Koukoulopoulos and Kozma (2023, Proposition 8.1) use throughout their sieve for the irreducibility of random polynomials. The roadmap's Weil, Kloosterman and Gross–Koblitz layers rest on Weil (1948), Schmidt (1973) and Gross–Koblitz (1979), as its References give them. Rests on the README and bsk2023 p. 39.

## Not verifiable

- Rosen, *Number Theory in Function Fields*, Chapter 2 (Gauss's formula, 3.1a): Springer GTM 210, paywalled; the sources service refused the DOI prefix, so the locator was not checked against the text.
- The volume and pages "Invent. Math. 233 (2023), 1041–1120" of the Bary-Soroker–Koukoulopoulos–Kozma entry: the publisher's page needs a login. The DOI was confirmed on arXiv, and the README cites the arXiv numbering.

## Source issues

- **Misprint** in bsk2023 at Proposition 8.1, p. 39 (arXiv v3): the source leaves out the preposition "of" in defining `π_p(k)` as the number of irreducible elements of `M_p(k)`; it should read "the number of irreducible elements"; affects nothing.

## For the human reviewers

- none
