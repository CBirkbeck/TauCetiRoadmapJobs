# Review of AutomorphicSpectralTheory (pull request #3027 at e47c8ec)

**Verdict:** accepted

**Summary.** An incremental re-review of the 23 lines changed since `f3b4ab1`. Accepted: the previous review had no finding, and this head repairs two of its three small corrections: the route of §4.5a now counts the real poles of `det C(s)` by Hadamard's factorization and Müller's uniform estimate, as [Mül89] does, and the SL₂ Check says "one even `τ`". The sharpened `*Needs:*` citations of AutomorphicLFunctionsAndLocalFactors all resolve to sections that state what they are cited for. One small correction (the description still does not mention this roadmap's two new sections and two new suppliers) and one format note remain; neither blocks, and nothing is left for a human to decide.

## C01 — The description does not say that this roadmap gains two sections and two suppliers

The description names AutomorphicSpectralTheory nowhere in its prose, and neither PseudodifferentialOperators nor RepresentationTheory/SmoothBanachRepresentations. Against `main` the head adds §4.5a and §6.4a, two rows to the supplier table (README lines 3751–3752: RepresentationTheory/SmoothBanachRepresentations §6.1 and PseudodifferentialOperators §6.1), and a new use of a supplier it already had (AnalyticNumberTheoryPartI §0.23, line 3750). A reader of the description cannot tell that the roadmap has new suppliers.

A sentence would do: "AutomorphicSpectralTheory gains §4.5a (Müller's polynomial bound on the discrete spectrum) and §6.4a (trace class on the cuspidal and discrete spectrum), with PseudodifferentialOperators §6.1 and RepresentationTheory/SmoothBanachRepresentations §6.1 as new suppliers and AnalyticNumberTheoryPartI §0.23 newly cited."

## N01 — In §4.5a (line 2237) "there is `k`" would read better as "there is `k≥0`"

The "In particular" bound `S(1+R²+λ_τ²)^k` is derived for a nonnegative exponent; for the trivial group the sum is finite for `k=−1` too, and the dimension bound then reads `1≤(1+R²)^{−1}`, which fails.

## Previous findings

The previous review (of `f3b4ab1`) had no finding. Its small corrections and its format note:

- C01 (Jensen against Hadamard in the route of §4.5a) — repaired: "`det C(s)` is a quotient of entire functions of finite order, so Hadamard's factorization (AnalyticNumberTheoryPartI §0.23) gives a product formula for it over its poles"; the Jensen citations are gone from the *Needs:* line and the Mathlib list.
- C02 (the quantifier over `τ` in the SL₂ Check) — repaired: "the sum over one even `τ` converges exactly when `k>1/2`".
- C03 (the description and the two new suppliers) — not repaired: the description's prose does not name AutomorphicSpectralTheory. Written again as C01.
- N01 ("there is `k`") — not repaired: "Then there is `k` with `Σ_{τ∈K̂_∞}Σ_π m(π)d(π,τ)(1+λ_π²+λ_τ²)^{−k}<∞`". Written again as N01.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §4.5a route, pole count (changed) | [Mül89] Thms 5.10, 6.8, 7.1, 7.5; `SL₂(ℤ)` | 5.10: `det C=F₁/F₂`, orders `≤n+2` (printed p. 65); 6.8: product over poles (p. 70); 7.1: `∫` of log-derivative on `iℝ`, constant independent of the data (p. 72); 7.5: poles in a real interval `≤C(1+μ^{3n/2})` (p. 75) | route as in the source | none |
| §4.5a route, Hadamard input | AnalyticNumberTheoryPartI §0.23 on `F₁`, `F₂` | §0.23 needs nonzero entire `f` of order `≤ρ`; `F_i` nonzero entire of order `≤n+2`: applies; `SL₂(ℤ)`: `ξ(2s−1)/ξ(2s)`, order 1 numerator and denominator | applies | none |
| §4.5a Check, one even `τ` (changed) | even `n`; odd `n` | even: `Σ_j(1+λ_j²+n⁴)^{−k}` with `N(X)∼X/12`, finite iff `2k>1`, plus finitely many weights `l≤n`; odd: `−I∈K₀` acts trivially, empty sum | true as now worded | none |
| §4.5a Check, all `τ` (same sentence) | Maass and holomorphic parts | `∫∫(X²+n⁴)^{−k}dX dn` finite iff `k>3/4`; `Σ_l l·l^{1−4k}` finite iff `k>3/4` | true | none |
| §4.5a "In particular" | `k≥0`; trivial `G`, `k=−1` | `k≥0`: count `≤S(1+R²+λ_τ²)^k`; `k=−1`: `1≤(1+R²)^{−1}` fails | holds for `k≥0` | N01 |
| *Needs:* of §1.6 | AutomorphicLFunctionsAndLocalFactors §AL.0.3.1 | README line 278: self-dual measure, `f̂̂(x)=f(−τx)`; at completions of number fields from AnalyticNumberTheoryPartII §5.3g | resolves | none |
| *Needs:* of §§2.3, 7.0a–7.1 | §§AL.R.1–AL.R.4, AL.2.1.4, AL.2.1.5, AL.3.1.1, AL.3.2.3, AL.3.3.2, AL.3.6.1, AL.3.6.3, AL.3.7.2 | headings at lines 392–422, 1000, 1026, 1231, 1330, 1386, 1597, 1626, 1665; AL.3.3.2 has `γ=εL(1−s,π∨×π′∨)/L(s,π×π′)`; AL.3.6.1 the pole at 1 iff `π≅π′` | resolve, subjects as labelled | none |
| *Needs:* of §§7.0b, 7.0c (internal) | §§6.1, 6.2, 6.9, 6.1–6.18 | headings at lines 2787, 2798, 2949, 3105 | resolve | none |

The rows of the previous review for untouched statements stand as in the previous review, of `f3b4ab1`.

- Change read: the route, Check and *Needs:* line of §4.5a, the AnalyticNumberTheoryPartI supplier row, the removed Mathlib bullet, and eight *Needs:* lines (§§1.6, 2.3, 7.0a, 7.0b, 7.0c twice, 7.1) whose new wording is that of `main`, merged into the branch. `Suggested.lean` is unchanged. The seeded sample (15 targets) does not fall in the changed passages.
- Source locators read: [Mül89] Theorem 5.10 (Mül89 line 1623, printed p. 65), §6 opening (line 1636, p. 66), Theorem 6.8 (line 1739, p. 70), Theorem 7.1 and its proof (lines 1771–1811, pp. 72–73), Theorem 7.5 (line 1849, p. 75), outline (lines 160–186, pp. 5–6). All as cited; "pp. 65–75" is right in the printed pagination the README uses.
- Cross-roadmap citations resolved at this head: 12 sections of AutomorphicLFunctionsAndLocalFactors (table above); AnalyticNumberTheoryPartI §0.23 (README line 533, also on main). No mention of `AnalyticOnNhd.sum_divisor_le` or of Jensen remains in the README, so the removed Mathlib bullet leaves nothing dangling.
- Record: against the merge base the head removes no heading and adds two (§4.5a, §6.4a); 8 layers before and after.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1480 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean`: two `sorry` warnings (lines 42, 84), nothing else.
- Other changes of the pull request: all lie in roadmap folders named as the pull request's own; nothing outside `TauCetiRoadmap/`.
- Other open pull requests: none changes this folder; no id cited here is dropped by one, and this change drops none.

Overlap check: read AutomorphicSpectralTheoryPartII (open), AutomorphicLFunctionsAndLocalFactors and EndoscopicTransferAndUnitaryTraceComparison (main and this head); the change adds no object. Shared object as in the previous review: the polynomial count of the discrete spectrum, owner AutomorphicSpectralTheory (on main, earlier); the open Part II should cite it.

Source independence: changed passages only; 3 passages (the route's closing sentence, the supplier row, the Check) compared with 1 source ([Mül89] lines 160–186, 1623–1637, 1771–1851), none shared; largest share Yu22, 63 of 310 bracketed locators; no layer added, removed or reordered, so the contents were not compared.

Research link: §§4.5a and 6.4a are Müller's bound on the discrete spectrum and the trace-class theorem (Müller 1989, 1998; Ji 1998), which Finis, Lapid and Müller (2011, §5.1) use for the absolute convergence of the spectral side of Arthur's trace formula, built in Layer 6. Rests on the README and [FLM11] Remark 3 and §5.1.

## Not verifiable

- [Mül98] Corollary 0.3 (Geom. Funct. Anal. 8, 1998): settled as uncertified (paywalled); its content was read only as [FLM11] applies it at the end of §5.1, p. 14.

Automatic checks set aside as false positives: the citation resolver reports four Lean names as found nowhere (`Modular.automorphic_green`, `Modular.green_kernel_continuation`, `SpecialFunctions.legendre_q`, `SpecialFunctions.point_pair_invariant`) although `Suggested.lean` declares them inside nested namespaces, and two (`LocallySymmetric.FrankeInput`, `LocallySymmetric.realPoints_lieGroup`) that are proposed names of ArithmeticLocallySymmetricSpaces' README; all six are in untouched text.

## Source issues

- none

## For the human reviewers

- none
