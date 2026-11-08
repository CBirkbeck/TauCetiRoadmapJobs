# DESIGN-ExplicitZetaBounds — design report

## What the design covers

`packages/ExplicitZetaBounds/design/README.md` (TauCetiRoadmap form) and `design/plan.json` describe
ten layers, 0–9, with 70 plan targets (6 definitions, 63 theorems, 1 example) and 131 tests. Every
definition has at least three tests, and every target has a locator. One gap is declared:
`explicit-vinogradov-mean-value`, with supplier `none`.

| Layer | Content | Plan targets |
| --- | --- | --- |
| 0 | `O*` calculus; `RH(H)`, `GRH(q, H)` with API; the Platt bridge (from `ComputationalNumberTheory` §4.22); recorded verifications; admissible cosine polynomials | 0.1, 0.2a, 0.2b, 0.3–0.5 |
| 1 | Stirling's series with periodic Bernoulli remainder; Alzer's brackets for `log Γ` and polygamma; Ramanujan–Mortici; Diamond–Straub; Mortici's digamma bound | 1.1–1.6 |
| 2 | Stieltjes, Lindelöf, Brent and Nemes remainder bounds; Binet's formulas with `Re ξ > 0`; the two-sided `|Γ|` bound; Stirling coefficients; digamma in sectors; Rademacher's gamma quotients | 2.1–2.8 |
| 3 | Explicit Phragmén–Lindelöf (Fiori); Rademacher's convexity on records of finite-order type, with the Dirichlet and `ζ` instances; Backlund's strip bounds; bounds right of one; Poisson–Jensen on a strip | 3.1, 3.2a, 3.2–3.5 |
| 4 | Kusmin–Landau, the A-process, second- and `k`-th-derivative tests, truncated Poisson/stationary phase/B-process; explicit approximate functional equations (Simonič, Kadiri); Riemann–Siegel with Gabcke's remainder; critical-line bounds (Hiary–Patel–Yang 0.618, Hiary 1.461, Lehman for `t ≥ 0.2`, Patel–Yang 66.7 t^{27/164}, Thorner–Zaman 2.97655, Hiary hybrid); one-line bounds (Patel; Hiary–Leong–Yang); Yang's `σ_k` lines; Richert-type bounds (gap) | 4.1–4.5, 4.5a, 4.6, 4.7a–d, 4.8–4.10 |
| 5 | Backlund's argument lemma (general `f`); `N(T)` (Bellotti–Wong, Rosser); `N(T, χ)` (BMOR); Lehman's lemma, its Brent–Platt–Trudgian form, and `Σ γ⁻²` | 5.1, 5.2a–b, 5.3, 5.4a–b |
| 6 | Ramaré's and Cully-Hugill–Johnston's Perron formulas, including the averaged form; majorant principle, Logan, Gallagher; Preissmann's weighted Hilbert inequality and Ramaré's mean value; weighted (3/2, c₀) and Elliott's maximal large sieves; mean squares of `ζ` (DHZ, Simonič, Kadiri) | 6.1–6.6 |
| 7 | Partial-fraction identities; Ford's intermediate region; Kadiri's criterion with the instances 5.69693, 5.68371, 5.573412, 5.558691 and 4.896 (preprint); Yang's Littlewood region (gap); Dirichlet regions (Kadiri 6.4355 and 5.60, McCurley/Thorner–Zaman, Lu–Zaman–Zhao); Vinogradov–Korobov regions and Khale (gap); real zeros (Bordignon, Ralaivaosaona–Razakarinoro, Lu–Zaman–Zhao); *HasLandauSiegelGap* and Banks' `3.0·10⁻³`; `1/|ζ(1 + it)|` (gap) | 7.1–7.10 |
| 8 | Kadiri 2013; Ramaré's averaged Dirichlet density; Kadiri–Lumley–Ng; Thorner–Zaman log-free; Bellotti log-free (gap) | 8.1–8.5 |
| 9 | Ramaré's `L(1, χ)` upper bounds; Platt–Saad Eddin and Saad Eddin; lower bounds (Mossinghoff–Starichkova–Trudgian, Louboutin as corollary, Lu–Zaman–Zhao) | 9.1–9.3 |

### Where each final target of `target.md` went

| Target | Section | Changes |
| --- | --- | --- |
| 1 Alzer | 1.2, 1.3 | as filed |
| 2 Batir, Ramanujan–Mortici, Mortici eighth root, Chen | 1.4 (Ramanujan–Mortici) | Batir Thms 1.1/1.5, Mortici's eighth-root refinement and Chen's `2117/(5080320x⁷)` bound are not stated. The target gives no formulas for them, the texts are paywalled and settled uncertified, and no readable source quotes them (Diamond–Straub mentions Mortici only by name). |
| 3 Diamond–Straub, Allasia–Giordano–Pečarić, Mortici ψ | 1.5, 1.6 | AGP Theorem 2 is not stated, for the same reason (no formula available). |
| 4 complex Stirling | 2.1–2.7 | The remainder bound is `sec^{2n}(θ/2)` (Stieltjes; `brent2019` l. 258), not the target's `cos^{2n−1}` in the denominator. The lower `|Γ|` factor is sharpened to `e^{−σ³/(3t²)}` (via Binet's second formula). Nemes and Brent are added. |
| 5 Rademacher | 3.1, 3.2 | General form on "records of finite-order type"; the Dedekind instance is left to `ExplicitNumberFields`. The PL principle is Fiori's corrected theorem. |
| 6 Backlund, Kadiri AFE, right-of-one | 3.3, 4.5a, 3.4 | Simonič's two-sided AFE is added. Kadiri's AFE is restated from the now-readable arXiv text, with the bracket `ζ(2)/(2πc) + 1 + 1/(2πc − 1)` checked against `c₀ = 2.1946`. Ramaré's zeta bound is his Lemma 5.4, not 5.1. |
| 7 critical and one line | 4.6–4.9 | Hiary–Patel–Yang 0.618 replaces Hiary's 0.63, whose proof uses the incorrect Kusmin–Landau constant. Trudgian's `(3/4) log t` and the "2.38" are not targets (Cheng–Graham Lemma 3). Lehman's lemma holds for `|t| ≥ 128π` (Ford's quotation), not `64/(2π)`. Its extension to `t ≥ 0.2` is derived from Hiary's 1.461 and HPY, so C8 is not a hypothesis. Hiary–Leong–Yang, Patel–Yang and Yang `σ_k` are added. |
| 8 `N(T)` | 5.1, 5.2 | Bellotti–Wong (Math. Comp. 2025, with Fiori's appendix) and Rosser are targets. Trudgian 2014 and Hasanalizade–Shen–Wong are not: both use the logarithmic PL lemma that Fiori corrects, and HSW's 9.3675 is a typo for 9.4925. |
| 9 `N(T, χ)` | 5.3 | as filed |
| 10 Lehman | 5.4 | Brent–Platt–Trudgian's Lemma 3/Theorem 1 and `Σ γ⁻²` are added. |
| 11 Perron | 6.1, 6.2 | Cully-Hugill–Johnston's Theorem 2.1 and averaged Corollary 3.2 are added. |
| 12 majorant, means, Helfgott | 6.3, 6.4, 6.6 | Helfgott's MO bounds are replaced by DHZ 2022 (refereed). Ramaré's Corollaries 6.3/6.4 are not stated (see Proposed Part II). |
| 13 large sieves | 6.5 | as filed |
| 14 `L(1, χ)` upper | 9.1, 9.2 | Johnston–Ramaré–Trudgian goes to a Part II: it uses explicit Pólya–Vinogradov inequalities, which `ExplicitCharacterSumsAndSieves` owns and which comes later in the merge order. Its Theorem 2 constant `9/20` is confirmed in the body (l. 77–78). |
| 15 `L(1, χ)` lower | 9.3 | Louboutin becomes a corollary of MST (`9.690292 < 10`); Lu–Zaman–Zhao is added. |
| 16 classical regions | 7.1–7.3, 7.5 | Kadiri 2005 is stated with the published `5.69693` (quoted in three readable later papers; the preprint prints 5.70176/5.70175). The starting region `9.645908801` follows from Ford's Theorem 4 (8.464) plus RH(14). McCurley's region (via Thorner–Zaman Lemma 2.3) and Lu–Zaman–Zhao are added. Bellotti–Trudgian–Yang (4.896, preprint) is added. |
| 17 VK and Ford | 4.10, 7.4, 7.6, 7.10 | All rest on `gap:explicit-vinogradov-mean-value`. Bellotti's region is stated with the arXiv `54.004` (the journal prints 53.989). |
| 18 real zeros | 7.7–7.9 | Bordignon 2019/2020 are added. Ralaivaosaona–Razakarinoro is stated with the weaker published `6.035/√d`; arXiv v2 prints 6.5. *HasLandauSiegelGap* and Banks' `3.0·10⁻³` (unrefereed) are added, the existence statement being `AnalyticNumberTheoryPartI` §0.34. |
| 19 densities | 8.1–8.5 | Kadiri 2013 is a bound for `N(σ, T)`, not `2N(σ, T, χ₀)`, with `H₀ = 3.061·10¹⁰`. KLN at `σ = 0.9` is `11.499 (log T)^{16/5} T^{4/15} + 3.186 log² T` for `T ≥ 3.0610046·10¹⁰`; the target's `1.5 … 3.2 … T ≥ 1` is not in the paper. Ramaré's `ζ`-only density is not a target: KLN record a mistake and the revision rests on an unpublished proof. Thorner–Zaman and Bellotti (gap) log-free densities are added. |
| 20 verified zeros | 0.2–0.5 | C6 (Rumely) is implied by the Platt bridge for all listed moduli, so it is not a hypothesis. C9 is Hiary's interval-arithmetic certificate (4.7). C10/C11 are the polynomial and numerical certificates of the Conventions. |

## Adversarial-pass table

Values were computed with my own double-precision toolbox (complex `log Γ` via shift plus Stirling, and
`ζ` and Hurwitz `ζ` via Euler–Maclaurin), kept in the job's scratch directory.

| Statement | Instances tried | Values computed (both sides) | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 `O*` | π vs 3; π vs 4; e = −1; ‖i‖; relative reading | π−3 = 0.14159 ≤ 0.1416, > 0.1415; ‖π−4‖ = 0.858 > 0; 1 = 1 + O*(−1) fails; ‖i‖ = 1 | holds as defined | three non-example Checks added |
| 0.2a/b `RH(H)`, `GRH(q,H)` | H < 0; trivial zero −2; q = 2; q = 1 | RH(−1) vacuous; ζ(−2) = 0 at Re = −2 would break RH(0) without the strip; mod 2 has no primitive character | correct with the open strip | strip condition kept; q ≡ 2 mod 4 Check |
| 0.3 Platt bridge | q = 3, 5, 13, 112, 399 999, 400 000 | H(3) = 3.33·10⁷; H(400 000) = 387.5 (second branch); H(399 999) = 293.75; 10⁸/13 = 7.69·10⁶ ≥ 10⁴; 10⁸/112 = 8.93·10⁵ ≥ 2500 | Rumely ranges implied | C6 dropped as a hypothesis |
| 0.4 recorded RH | ordering; Platt count | 3·10¹² ≥ 3.0610046·10¹⁰ ≥ 10⁹ ≥ 5.45·10⁸; main + 7/8 = 103 800 788 358.63 vs 103 800 788 359 | consistent | — |
| 0.5 admissible polynomials | (3,4,1); (1,2); (1,1); (a₀) | P(π) = 0 for 3-4-1; P(π) = −1 for (1,2); a₀ = a₁ for (1,1); a₁ = 0 ≤ a₀ | definition separates them | four Checks |
| 1.1 Stirling series | z = 1, n = 1; z = 2, n = 2 | r₁(1) = 0.081061 ∈ (0, 0.083333); r₂(2) = −0.000326 vs T₂(2) = −0.000347 | holds | — |
| 1.2 Alzer Thm 8 | x = 0.3, 1, 2, 5 with m = 0, 1 | F₀, F₂ > 0 and −F₁, −F₃ > 0 at all four points; ψ(1) = −0.577216 ∈ (−0.583333, −0.5); ψ(0.2) = −5.28904 ∈ (−6.19277, −4.10944) | holds | swapped parity as a non-example |
| 1.3 Alzer Thm 9 | k = 1, 2 at x = 1 | ψ'(1) = 1.644934 ∈ (1.5, 1.666667); −ψ''(1) = 2.404114 ∈ (2, 2.5) | holds | empty-product Check |
| 1.4 Ramanujan–Mortici | x = 1, 1.5, 2, 3, 5, 10, 30, 100; x → 0⁺ | θ = 0.33593, 0.42832, 0.51176, 0.63051, 0.75623, 0.87001, 0.95497, 0.98625; θ_{0.5} = 0.32076; θ_{0.9} = 0.32036; θ → 30/π³ = 0.96755 | 3/10 < θ < 1 on [1, ∞), increasing there; not monotone on (0, 1] | range x ≥ 1 kept; non-monotonicity Check |
| 1.5 Diamond–Straub | N = 1, 3 (λ = 1/2), N = 2, 4 (λ = 0) at x = 0.6, 1, 2, 10 | all four inequalities hold; ψ(2) = 0.422784 < F₃(1/2; 2) = 0.423984 | holds | a wrong value 0.42328 corrected in a draft Check |
| 1.6 Mortici ψ | x = 0.5, 1, 2, 5, 10, 20, 50, 100 (exact series for ψ) | relative position in [a, b]: 0.66 (x = 2) … 0.990 (x = 100); x = 1: −0.009968 ∈ (−0.075347, 0.059375) | holds; at x = 20 a finite-difference ψ gave a false failure, and the exact series confirms it | — |
| 2.1 Stieltjes | 2000 random z, 0.3 ≤ \|z\| ≤ 100, \|θ\| ≤ 3.1, n = 1, 2; z = e^{3.1i} | max ratio 0.99998 (n = 1), 0.9996 (n = 2); \|ξ(e^{3.1i})\| = 1.389 > \|T₁\| = 1/12 | holds; the secant factor is needed | target's cos^{2n−1} replaced by sec^{2n} |
| 2.2 Lindelöf | θ = π/3 | K = 1.1547 < sec²(π/6) = 1.3333 | consistent | — |
| 2.3 Brent | k = 1; z = −1 + i | Γ(3/2)/Γ(1) = 0.886227 < 1; \|u+z\|² = 1 < 3 at u = 1 | Re z ≥ 0 needed | non-example Check |
| 2.4 Binet | z = i; z = −1/2 + 2i | Re ξ(i) = 0.000934 (formula and computation agree to 10⁻¹⁴); Re ξ(−1/2 + 2i) = −0.01004 | Re ξ > 0 needs Re z > 0 | — |
| 2.5 two-sided \|Γ\| | 3000 random σ ∈ [0.01, 31], \|t\| ∈ [0.1, 300]; s = 1/2 + 10i | min log-margin 1.27·10⁻⁸ (lower), 5.3·10⁻⁴ (upper); \|Γ(1/2 + 10i)\| = 3.77753·10⁻⁷ = √(2π)e^{−5π}(1 + e^{−20π})^{−1/2} | holds, sharper than the target's e^{−σ³/t²} | lower factor sharpened |
| 2.6 Stirling coefficients and Nemes | γ₁…γ₄; N = 2, z = 10; real x = 0.01, 1, 10 | γ₃ = −1/360 + 1/10368 = −139/51840; bound 0.000355 ≥ R₂(10) = 3.20·10⁻⁵; ratios 4.195 < 44.06, 1.084438 < 1.086806, 1.0083654 < 1.0083681 | holds | 1.4 folded into 2.6 (build order) |
| 2.7 digamma | z = 1; z = 10i | \|ψ(1) + 1/2\| = 0.0772 ≤ 1/8; \|ψ(10i) − Log(10i) + 1/(20i)\| = 0.000834 ≤ 0.003536 | holds | the shifted-argument constant corrected from 1/√2 to √2 |
| 2.8 gamma quotient | 8000 random (σ ∈ [−1/2, 1/2], \|t\| ≤ 200, a = 0, 1); σ = −1/2, t = 100 | max ratio 0.99999999956; equality \|Γ(3/4)/Γ(−1/4)\| = 1/4; quotient 50.0006 = \|(1+s)/2\| | holds, sharp at σ = −1/2 | wrong-exponent Check |
| 3.1 explicit PL | constant G; G = 1/4 + s on [−1/2, 3/2] | reduces to the three-lines theorem; 1/4 + s vanishes at −1/4 | hypothesis Q > −a needed | log-factor caveat (Fiori) |
| 3.2 Rademacher | 300 random points each for χ₄, χ₅ (η ∈ [0.05, 1/2], \|t\| ≤ 60); ζ at 300 points; s = 1/2; s = 1.01 | max ratio 0.546 (Dirichlet), 0.192 (ζ); \|ζ(1/2)\| = 1.46035 ≤ 11.488; without P: 1.976 < ζ(1.01) = 100.578 | holds; pole factor needed | general record restricted to finite-order type (shifts in {0, 1}) |
| 3.2a finite-order type | dirichletData χ₄; shift 1/2; ζ majorant | gammaR = {1}; shift 1/2 excluded; majorant equality for ζ | definition fits Rademacher's hypotheses | — |
| 3.3 Backlund | t ∈ [50, 125], σ ∈ {1, …, 3}, {0, …, 1}, {−1/2, …, 0} | max ratios 0.623, 0.615, 0.616; t = 50: 6.581 vs Lehman 6.718; t = 55: 6.902 vs 6.880 | holds | target's Check ("Backlund weaker than Lehman at t = 50") reversed |
| 3.4 right of one | σ ∈ (1, 11], step 1/40 | max ζ(σ)(σ−1)e^{−γ(σ−1)} = 0.99994; Delange excess ≤ −0.0957 on σ ≥ 1.025, limit −0.0772 | holds | locator Lemma 5.4 (not 5.1) |
| 3.5 Poisson–Jensen | constant; e^{az}; exp(e^{−iπ(z−1/2)}) | equality for harmonic log\|F\|; counterexample with growth rate exactly π | c < π needed | — |
| 4.1 Kusmin–Landau | f = x/2; θ = 0.01 vs Cheng–Graham | \|Σ(−1)^n\| ≤ 1 = cot(π/4); cot(0.005π) = 63.66 > 1/(0.01π) + 1 = 32.83 | Landau sharp; CG false | — |
| 4.2 A-process | q = 1, 2; linear phase | trivial bound at q = 1 | consistent | — |
| 4.3 second-derivative | f = x²/(2Y); λ → 0 | ≈ 6.77√Y; Lemma 4 vs 5 switch at λ = 0.2883 | consistent | — |
| 4.4 k-th derivative | k = 3 exponents; h = 3, k = 10 | λ₃^{1/6}; h^{2/512} = 1.0043 | consistent | — |
| 4.5 B-process | Gaussian integral | ∫e(−x²/2) = e(−1/8) | normalization pinned | orientation Check |
| 4.5a AFE | s = 1/2 + 100i, x = y = 3.98942; Kadiri c = 1, t₀ = 14.1347 | \|R₁\| = 0.4532 ≤ 18.07 (and ≤ 2.131 symmetric); C = 1.5 + 0.47866·1.45107 = 2.1946 | holds; the bracket has a "+1" | moved from Layer 3 to Layer 4 (build order) |
| 4.6 Riemann–Siegel | t = 200; t ∈ [200, 260] | 2·2.7964 + 0.3959 = 5.989 ≥ \|ζ\| = 5.590; RSL 7.421 vs max ratio 0.766 | holds; factor 2 needed (3.192 < 5.590) | Lehman's range corrected to \|t\| ≥ 128π |
| 4.7a HPY, Hiary, Lehman | t ∈ [3, 60]; [0, 3]; [0.2, 3], [3, 200] | max ratio 0.822; max \|ζ(1/2+it)\| on [0,3] = 1.46035 ≤ 1.461; 4(0.2/2π)^{1/4} = 1.6895 > 1.461; HPY ≤ Lehman on [3, 200] with margin ≥ 1.58 | holds | C8 replaced by a derivation |
| 4.7b Patel–Yang | crossover with HPY | PY < HPY iff log t > 89.90; 79.92 at t = 3 | consistent | — |
| 4.7c Thorner–Zaman | χ₄, χ₅ on t ∈ [0, 100] | max ratios 0.334, 0.519 | holds | — |
| 4.7d Hiary hybrid | q = 64, t = 200 | 8911 vs TZ 31.66; wins for log(q\|t\|) > 123.4 | consistent (Weyl-type) | "q" read as the analytic conductor |
| 4.8 one line | t ∈ [3, 60]; branch crossovers | \|ζ(1+3i)\| = 0.63797 ≤ 1.0986; max ratio to log t 0.645; crossovers t = 47.5, 8.54·10⁶⁰ (Patel prints 8.261·10⁶⁰) | holds | Trudgian 3/4 log t not a target |
| 4.9 Yang σ_k | k = 4, t ∈ [3, 60] | bound 1.837 at t = 3; max ratio 0.387 | holds | — |
| 4.10 Richert | σ = 1, t = 10¹⁰ | 616.7 (Ford) vs 572.2 (Bellotti); exponents 1.573, 1.569 at σ = 1/2 | consistent | gap declared |
| 5.1 Backlund lemma | f = z − b − i(T+ε); constant f | variation ≈ π ≤ bound > π; constant: 0 ≤ π | holds | general-f form, as `ExplicitNumberFields` asked |
| 5.2a/b N(T) | T = 14, 100, 1000; T = 3.0610046·10¹⁰ | N(14) = 0 ∈ 0.432 ± 2.379; N(100) = 29 ∈ 29.002 ± 2.895 (Rosser), 28.127 ± 8.921/4.482 (BW); N(1000) = 649 ∈ 648.616 ± 3.391; main 103 800 788 358.63 vs 103 800 788 359 | consistent | Trudgian/HSW not targets |
| 5.3 BMOR | q = 3, T = 5/7; χ₄, T = 10 | ℓ = 0.259 ⇒ N = 0; ℓ = 2.0333, 2.959 ± 2.182 ∋ 2 | consistent | — |
| 5.4a/b Lehman, BPT | φ = 1; first zero | Riemann–von Mangoldt with error 4 log T₁ + 2 log(T₂/T₁); 14.1347⁻² = 0.005005 ≤ 0.023105 | consistent | — |
| 6.1 Perron | F = 1 at x = 1; θ' | error 2 ≥ \|1 − π⁻¹arctan(T/κ)\|; θ' = 0.29130, x^κ/(πθ') = 1.0927x^κ | finite at integers | — |
| 6.2 averaged Perron | λ = θ'/T | R ≤ 1.384 x^κ Σ\|a_n\|/n^κ | consistent | constants read from OCR at l. 409–421 |
| 6.3 majorant, Logan, Gallagher | one frequency; a = (1, −1) | 2T ≤ 6T; 2T ≥ T; 2T ≤ (π²/2)T; Logan fails for signed a | consistent | — |
| 6.4 Preissmann | c₀; a = (1, 1) | c₀ = 1.31541, πc₀ = 4.1325 < 3π/2 = 4.7124; deviation ≤ 2.885 ≤ 20.66 | consistent | — |
| 6.5 large sieves | X = {0, 1/2}, N = 1; equally spaced X | weights 1/4, 0.2754; (N + cR) vs N − 1 + R | consistent | — |
| 6.6 mean squares | T = 4; T = 2000 | 107.2 (σ = 1/2), 43.54 (σ = 1); Simonič 62 278 vs true ≈ 11 835 | consistent | Helfgott MO → DHZ |
| 7.1 partial fractions | s = 2; χ₄ constant | zero sum 0.069066 = 1 + 0.211392 − 0.572365 − 0.569961; first pair 0.014848; (1/2)log(4/π) = 0.120782 | consistent | — |
| 7.2 Ford | t = 3; t = 1.88·10¹⁴; e^{64.1} | σ ≥ 0.892458; 0.004238 vs 0.005473; 0.0028064 vs 0.0028065 | consistent with mty2024 l. 113–119 | Cheng–Graham input replaced by Lehman/HPY (monotone) |
| 7.3 Kadiri criterion, instances | \|t\| = 2, 3·10¹²; chain | σ ≥ 0.740461, 0.993738; 1/(5.558691 log 2) = 0.2595 < 1/2 | consistent | published 5.69693 stated |
| 7.4 Littlewood | t = e^{200}; t = 3 | 0.0012477 vs 0.0008995; log log 3 = 0.094 | consistent | gap |
| 7.5 Dirichlet regions | q = 3, t = 0; Q = 3; q = 10¹⁰ | σ ≥ 0.837457; 1/9.645908801 = 0.103671, σ ≥ 0.905635; σ > 0.995657 | consistent | — |
| 7.6 VK | \|t\| = e^{1000}; Khale q = 3, t = 10 | 9.125, 9.505, 9.723 (·10⁻⁵); σ ≥ 0.991109 | consistent | 54.004 stated |
| 7.7 real zeros | q = 4·10⁵; d = 3·10⁸; crossover with Banks | 0.007602, 0.000950; 0.000348 (6.035) vs 0.000375 (6.5); Banks wins over 100/(√q log²q) for q > 4.7·10⁶ | consistent | weaker journal constant stated |
| 7.8 LZZ real zeros | q = 4; q = 10¹⁰ | [0.855730, 1) with L(σ, χ₄) > 0; [0.991314, 1) | consistent | — |
| 7.9 Landau–Siegel gap | q = 3, 10¹⁰; q = 1 | 0.002731 vs 0.18205; 1.303·10⁻⁴ vs 8.686·10⁻³; log 1 = 0 | q ≥ 3 needed | — |
| 7.10 reciprocal | t = 3 | 1/\|ζ(1+3i)\| = 1.5675 ≤ 5043 | consistent | gap |
| 8.1 Kadiri density | T = H₀ | 1.70·10¹⁰ and 1.35·10¹⁰ vs N(H₀)/2 = 5.19·10¹⁰; true value 0 | consistent | N, not 2N |
| 8.2 Ramaré averaged | Q = 10, T = 2000, σ = 0.6 | 1.23·10¹² | consistent (weak away from 1) | ζ-only form dropped |
| 8.3 KLN | σ = 0.9 exponents; T = H₀ | 8(0.1)/3 = 4/15; 2σ + 5 − 4σ = 16/5; 1.91·10⁸ | consistent | constants corrected |
| 8.4 TZ log-free | Q = 3, σ = 39/40 | log₁₀ = 99.71 | consistent | — |
| 8.5 Bellotti log-free | T = 10¹³, σ = 0.9927 | 2.22·10¹¹ vs N(T)/2 = 2.16·10¹³ | consistent | gap |
| 9.1 Ramaré L(1, χ) | q = 3, 4, 5, 8 (even and odd), 12, 24 | 0.604600 ≤ 1.257547; 0.785398 ≤ 1.047267; 0.430409 ≤ 0.804719; 0.623225 ≤ 0.866434; 1.110721 ≤ 1.220554; 0.760346 ≤ 0.968; 1.2826 ≤ 1.4952 | consistent; 5/2 − log 6 = 0.708241 matches the 0.7083 quoted by Saad Eddin | — |
| 9.2 PSE, SE | q = 3, 12; q = 17 | 0.604600 ≤ 1.204578; 0.760346 ≤ 1.196598; 1.016085 ≤ 1.396487 | consistent | — |
| 9.3 lower bounds | quartic χ mod 5; q = 3 | 0.888577 ≥ 0.222066 ≥ 0.215189; 0.604600 ≥ 0.113780 | consistent | Louboutin as corollary |

## Notions moved down from later roadmaps

- **The explicit van der Corput toolkit** (4.1–4.5): Kusmin–Landau (Landau's cot form and the
  asymmetric form), the A-process, the second-derivative and `k`-th-derivative tests, truncated
  Poisson summation, stationary phase and the B-process. `ExplicitCharacterSumsAndSieves` claims these
  in its filed Layer 1 (targets 1–5 and 1f), but it is at position 271 of the merge order, after this
  roadmap (269). A trial gate run that cited it reported
  `UPWARD: ExplicitZetaBounds (#268) -> ExplicitCharacterSumsAndSieves (#270)`. Following the
  move-down rule, the toolkit is stated here at the generality its uses need (general phases with the
  sources' derivative hypotheses). `ExplicitCharacterSumsAndSieves` should cite 4.1–4.5 instead of
  planning them. Its lattice-point tests (filed targets 7–9) and the Burgess and Pólya–Vinogradov
  material are not used here and stay there.

## Proposed Part IIs and later roadmaps

- **ExplicitZetaBoundsPartII**, placed after `ExplicitCharacterSumsAndSieves`:
  - Johnston–Ramaré–Trudgian's `L(1, χ) ≤ (1/2) log q` (odd quadratic, `q ≥ 2·10²³`) and
    `(9/20) log q`, which need the explicit Pólya–Vinogradov inequalities of that roadmap;
  - a general explicit Hoffstein lemma (`L(σ, χ) ≠ 0` on `[1 − λ/log q, 1)` ⇒ `L(1, χ) ≥ c(λ)/log q`
    for small `λ`), which would turn Banks' gap into a numerical lower bound for quadratic `L(1, χ)`;
  - the explicit Deuring–Heilbronn repulsion of Benli–Goel–Twiss–Zaman (Corollary 1.1), whose
    constants `c₂`, `c₄` are illegible in the OCR of the arXiv text (only `c₁ = 10`, `c₃ = 107` read);
  - Mossinghoff–Trudgian–Yang's Theorem 1.4 (the intermediate region with
    `h(t) = (27/164) log t + 7.096`), whose displayed formula is ambiguous in the extraction;
  - Ramaré's hybrid large sieves (Corollaries 6.3–6.4), where the starred sum's normalization could
    not be pinned from the extraction.
- **A roadmap on Vinogradov's mean value theorem** (explicit, in Ford's Theorem 3 and Bellotti's
  Theorem 1.4 forms): the supplier of `gap:explicit-vinogradov-mean-value`.
- **A roadmap on explicit exponent pairs** beyond the A- and B-processes (Huxley, decoupling).

## Gaps

| Slug | Needed by | Supplier | What is missing |
| --- | --- | --- | --- |
| `explicit-vinogradov-mean-value` | 4.10, 7.3 (instance 4.896 only), 7.4, 7.6, 7.10, 8.5 | none | an explicit bound `J_{s,k}(N) ≤ C(s,k) N^{2s − k(k+1)/2 + Δ(s,k)}` with Ford's (Theorem 3) and Bellotti's (Theorem 1.4) explicit `C`, `Δ` |

I searched main and every open pull request for "Vinogradov", "Richert" and "mean value theorem".
The hits in `SieveMethodsAndPrimePatterns` are Richert's weighted sieve, and those in
`ProbabilisticAndMetricNumberTheory` are qualitative.

## Ownership checks (by object)

`roadmaps grep` across main and the 472 open pull requests:

- Euler–Maclaurin: `AsymptoticExpansions` §13.1. It is an open new-roadmap PR by another author, and
  is consumed; the gate accepts it.
- Kusmin–Landau / Kuzmin: only Gauss–Kuzmin in `ProbabilisticAndMetricNumberTheory`.
- Riemann–Siegel, Gabcke, Backlund, Lehman: no matches.
- Binet: unrelated contexts.
- The Stieltjes remainder: `AnalyticNumberTheoryPartI` §0.23a, consumed; it has constant 1/8 and
  this roadmap owns the sharp constants.
- Rademacher and explicit PL: `AnalyticNumberTheoryPartI` §2.21 has an inexplicit constant.
- Weighted Hilbert: `AnalyticNumberTheoryPartI` §1.5a (3π/2), consumed.
- Kadiri's regions: cited only as background by `ZerosOfLFunctions` and `AnalyticNumberTheoryPartI`.
- Nonnegative trigonometric polynomials: Tau Ceti's `IsNonnegativeTrigonometricCombination` is
  reused, not redefined.
- `O*` and `RH(H)`: no other owner.

The sibling targets `ExplicitPrimeCounting` (its review F05 asks this roadmap to own `RH(H)`,
`GRH(q, H)` and the bridge) and `ExplicitNumberFields` (it asks for a degree/conductor-general
Backlund lemma, provided as 5.1 with 3.2) are consistent with this design. Their citations of "target
8, 9, 10, 16, 17, 19, 20" map to 5.2, 5.3, 5.4, 7.3/7.5, 4.10/7.6, Layer 8 and Layer 0.

## Overlaps with open pull requests

No `scratch/overlaps.md` was provided. `roadmaps overlaps ZerosOfLFunctions` lists #1907 and #1913,
which revise `ZerosOfLFunctions` and merge cleanly. A heading diff of both heads against main shows
no renumbering (#1913 only adds a scope subsection), so every `ZerosOfLFunctions` citation here is
valid at main and at both heads. No cited id is defined only by an open revision.

## Sources

- **Fetched and read** in this design (all recorded with sha256, as certified):
  - nemes2015, brent2019, simonic2020, hiarypatelyang2024, patelyang2024, hiaryleongyang2025;
  - bellottiwong2025 (OCR), brentplatttrudgian2021, cullyhugilljohnston2023;
  - cullyhugilljohnston2025 (OCR), donahelfgottzunigaalterman2022, luzamanzhao2026 (OCR);
  - benligoeltwisszaman2026 (OCR), bordignon2019, bordignon2020, yang2024, bellotti2025density;
  - ariasdereyna2024, fiori2025 (OCR), banks2026, bellottitrudgianyang2026 (OCR);
  - kadiri2013density (arXiv copy under the existing key);
  - ralaivaosaonarazakarinoro2026 (arXiv v2 under the existing key);
  - ramare2016density (AMS free back volume, under the existing key, `--licence-class publisher-open`).
- **Added as uncertified** (books or paywalled, cited by locator): davenport2000, mccurley1984 (used
  as restated in Thorner–Zaman Lemma 2.3), titchmarsh1986.
- **Could not read**:
  - ramare2001: the IMPAN URL was refused as being in no licence class, and the entry stays settled
    uncertified. Its odd constant is corroborated by saadeddin2016 l. 56–65.
  - The other entries settled as uncertified (batir2008, mortici2011ramanujan, chen2016, gordon1994,
    allasia2002, rademacher1959, backlund1918, lehman1966, lehman1970, rosser1941,
    montgomeryvaughan1973/1974, elliott1987, preissmann1984, louboutin2015, montgomery1994ten,
    logan1988, gallagher1970, delange1987, bastienrogalski2002, andrewsberndt2013,
    ramare2022excursions, platt2011thesis, vandeluneterielewinter1986, rumely1993, dlmf, gabcke1979)
    are cited by locator; the formulas used are corroborated where a readable source quotes them.
  - Batir, Chen, Allasia–Giordano–Pečarić and Mortici's eighth-root bound are omitted because no
    formula is available.
- **No `needs-references.toml` is submitted.** The sources service created one during a failed fetch.
  It listed ramare2001, which is settled and must never be requested, and ramare2016density, which
  was then fetched. It is kept in scratch as a log only.
- **Source issues recorded** (all are reflected in the design):
  - Cheng–Graham Lemmas 2–3 are false: Hiary 0.63, Trudgian (3/4) log t and Trudgian 2.38 are not
    proved by their papers.
  - Trudgian 2014 Lemma 3 (logarithmic PL) is corrected by Fiori.
  - HSW 9.3675 → 9.4925.
  - Ramaré 2016's ζ density has a mistake (KLN).
  - Ramaré 2016's averaged Perron formulas have errors (Cully-Hugill–Johnston).
  - Kadiri 2005 preprint and published constants differ.
  - R–R arXiv v2 and journal constants differ.
  - Bellotti 2024 arXiv 54.004 vs journal 53.989.
  - Diamond–Straub's arXiv id is 1508.03267, as already corrected in the manifest.

## Dependency check

```
tauceti-roadmap gate --candidate packages/ExplicitZetaBounds/design/README.md --only ExplicitZetaBounds --order merge-order/ORDER.txt --content <content>
depcheck: 240 roadmaps, 2433 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. `roadmaps resolve` reports no cross-roadmap citation and
no TauCetiRoadmap Lean name found nowhere. I checked the Mathlib and Tau Ceti names myself at the
pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9) and replaced three that do not exist there
(`MeasureTheory.integral_Ioc`, `MeasureTheory.integral_fourier`, `Real.fourierIntegral` →
`Fourier.fourierIntegral`).

## Suspicious text

None. No fetched text, issue or report asked for any action.
