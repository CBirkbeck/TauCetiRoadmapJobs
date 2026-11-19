# Review of SpecialFunctionsEiLiErfIncompleteGamma (pull request #2553 at 54c9507)

**Verdict:** needs changes

**Summary.** Changes are needed for one statement: in 10.3 the limits `Si(a, ∞)` and `Ci(a, ∞)` (DLMF 8.21.12–8.21.13) are claimed with only DLMF's pole exclusions, but they exist only for `Re a < 1`, and the roadmap's own Check `Si(1, z) = 1 − cos z` shows it. The statement predates this pull request, which changes only locators and framing prose; everything else sampled holds numerically and against the DLMF. There is one small correction (a DLMF equation number) and one format note, neither blocking. None of the eleven books whose locators this pull request adds could be read legally here, so those locators are unverified; that, and whether keeping the section skeleton meets the request not to follow one source, are left to the human reviewers.

## R01 (P2) — The limits 8.21.12–8.21.13 of 10.3 exist only for `Re a < 1`, a hypothesis the text does not state

In 10.3 (line 1284) the target reads "8.21.12–8.21.13 as limits along the positive axis with the stated exclusions." The only exclusions stated, here or in the DLMF, are the parameter poles (`a ≠ −1, −3, …` for `Si`, `a ≠ 0, −2, …` for `Ci`; DLMF-8.21 lines 575 and 605). An implementer who states `Si(a, x) → Γ(a) sin(πa/2)` as `x → +∞` under those exclusions alone is asked to prove something false.

By 8.21.8, `Si(a, x) = Γ(a) sin(πa/2) − si(a, x)`, and `si(a, x) = ∫_x^∞ t^{a−1} sin t dt ≍ x^{a−1} cos x`, which tends to `0` only when `Re a < 1`. The Check of 10.1 already shows the failure at `a = 1`: `Si(1, x) = 1 − cos x` and `Ci(1, x) = sin x` have no limit. Computed from `∫₀ˣ t^{a−1} sin t dt` at `x = 1000π, 1000.5π, 1001π`: for `a = ½` the values are 1.23547, 1.25331, 1.27115 (limit `Γ(½) sin(π/4) = 1.25331`); for `a = 1` they are 0, 1, 2; for `a = 3/2` they are −55.42, 0.636, 56.70 against `Γ(3/2) sin(3π/4) = 0.62666`. For `Ci(3/2, x)` at the same points: −0.618, 55.44, −0.636. The DLMF's own derivation note (DLMF-8.21 lines 503–504) uses 8.21.4–8.21.5, which carry `Re a < 1` (lines 254, 294), so the restriction is implicit there and missing from the displayed conditions.

The smallest repair: "8.21.12–8.21.13 as limits along the positive axis, for `Re a < 1` and with the stated exclusions". If the formula's value at the remaining poles of `Γ` (`a = 0, −2, …` for `Si`, where `Γ(a) sin(πa/2)` is a limiting value) is meant too, the convention on parameter poles already says how to state it.

## C01 — The function `χ` in 8.4 is DLMF 9.7.3, not 9.7.2

In 8.4 (line 1108) the remainder bound for 6.12.2 cites "`χ(n) = π^{1/2} Γ(n/2 + 1)/Γ(n/2 + ½)` (DLMF 9.7.2)". In the DLMF, 9.7.2 defines the coefficients `u_k`, `v_k` of the Airy expansions; `χ` is 9.7.3 (DLMF-9.7 lines 149–151). The formula written out in the README is the right one, so only the number needs changing.

## N01 — The source list of the Summary and the References entry disagree with the layers in three places

The Summary gives Lebedev as "Chs. 2–3 and §9.13" and Beals–Wong as "§§2.6 and 6.4", while 1.2 and 2.4 cite Lebedev Ch. 1, Problems 10–11, and 15.2 cites Beals–Wong Ex. 8.7; the References entry for Temme lists Chapter 3, which no layer cites. The Beals–Wong entry in References starts with a doubled space after the bullet.

## Verified sound

Source ids `DLMF-<n>` are the extractions of `https://dlmf.nist.gov/<n>`; "line N" is a line of that extraction. Values were computed in double precision with my own Gauss–Legendre quadrature, Lanczos Gamma and series code.

| Statement | Instances | Values (left; right) | Result | Change |
|---|---|---|---|---|
| 1.1 series 8.7.1 (both), 8.4.12, 8.2.7, Checks | `a=−1.5+0.5i, z=2−i`; `γ*(−2,z)`; `γ*(1,z)`; `a=0.6+0.3i` | `1.19130101−2.38705268i` both; `3−4i = z²`; `0.39352736+0.13982332i` both; `0.55067434−0.01816628i` both | true | — |
| 2.1 8.4.7–8.4.8, incl. on the cut | `n=3, z=1.2+0.5i`; `z=−2` | `5.89844813−0.25872740i` both; `0.10155187+0.25872740i` both; at `−2`: −14.7781122 both | true for every `z` | — |
| 3.1 8.6.1, 8.6.3, 8.6.4, 8.6.5, 8.6.7 | `a=−1.5, z=0.6+0.8i`; `a=0.7+0.4i, z=−1.5+0.6i`; `a=0.3+0.1i, z=−1+i`; `a=2.2+0.3i, z=1+2i` | `2.53501834+0.11161911i`; `0.17138822+1.29233331i`; `−1.01471245−1.51543513i`; `0.75781085−0.70792515i`, each both sides | true | — |
| 3.3 8.6.10, 8.6.11, 8.6.12 | `a=1.2+0.3i, z=0.8+0.4i, c=0.6`; `a=−0.3+0.2i, z=1.5+0.5i, c=0.5`, then `c=0.2`; `a=0.2+0.3i, z=1+0.5i, c=−0.5` | `0.41333195+0.01271728i` both; `0.05737431−0.04451067i` both; at `c=0.2 < −Re a`: `−1.8348−1.2926i`; `0.17158576−0.11408625i` both | true; `c > −Re a` needed and stated | — |
| 5.1 8.11.2 remainder bound, `n ≥ a − 1` | `(a,x,n)=(2.5,3,2)`, `(2.5,3,3)`, `(−0.5,2,1)`; controls `(3.5,3,1)`, `(3.5,3,2)` | `R` vs `u_n/xⁿ`: 0.0735 vs 0.0833; −0.0098 vs −0.0139; −0.371 vs −0.75; controls 1.311 vs 0.833, 0.478 vs 0.417 | true; fails without `n ≥ a − 1` | — |
| 5.3 8.11.6, 8.11.7, 8.11.8–8.11.9 | `a=50, 200`; `λ=½`, `λ=2`; `b₁, b₂` from the recurrence | 8.11.6: 0.0386063 vs 3 terms 0.038656; 0.00990376 vs 0.009904. 8.11.7: 0.0192692 vs 0.019280; 0.00495120 vs 0.00495125. `b₁=λ`, `b₂=λ(2λ+1)` | true | — |
| 8.4 6.8.1–6.8.3 | `x = 0.1, 1, 10` | `eˣE₁`: 1.5223<2.0146<2.3979; 0.5493<0.5963<0.6931; `x eˣE₁` at 10: 0.915493<0.915633<0.915663 | true | — |
| 8.4 6.9.1, 6.12.1 bounds, 6.12.2 bound | `z=−1+0.5i`; `|z|=6`, `ph z = 0, π/2, 3π/4`, `n=3`; `x=5, n=10` | `−1.88314832−1.83364789i` both; `|R|` 0.0173, 0.0226, 0.0337 vs term 0.0278 (`csc`·term 0.0393); 0.4506 ≤ 1.952 | true; `csc` factor needed beyond `π/2` | — |
| 9.4 6.12.5–6.12.8 and bounds | `z=3+2i, n=2`; `|z|=4`, `ph z = 0, π/4, 0.4π` | `f`: `0.22642021−0.12476116i` both; `g`: `0.03566020−0.05191413i` both; `|R_f|` 0.0104, 0.0130, 0.0192 vs 0.0234, 0.0234, 0.0399 | true | — |
| 10.1 Checks, 8.21.3 | `z=1.3−0.7i`; `a=0.4+0.3i` | `Si(0,z)=Si(z)`: `1.27536756−0.52929344i`; `Si(1,z)=1−cos z`: `0.66424376−0.73093954i`; `si(1,z)=cos z`; 8.21.3 regularised `1.0582−0.0314i` vs `1.0579−0.0309i` | true | — |
| 10.3 8.21.12–8.21.13 | `a = ½, 1, 3/2, −½`; `x = 1000π, 1000.5π, 1001π` | `Si`: 1.2355, 1.2533, 1.2712; 0, 1, 2; −55.42, 0.636, 56.70; 2.50662, 2.50663, 2.50663 | false for `Re a ≥ 1` | R01 |
| 10.2 8.21.8 (touched by R01) | `a=0.3+0.4i, z=1.2+0.7i`; `a=1.5` | `1.31502113−0.20272483i` both; 0.62665707 both | true as an identity, also for `Re a ≥ 1` | — |
| 11.1 definitions, 7.5.8, 7.5.1, 7.7.2, 7.10.2 | `z=0.6−0.3i`; `z=0.4+0.8i` | `0.77838760−0.24083627i`; `0.54375702−0.12868617i`; `0.45657879+0.13110144i`; `−1.56107129+0.58519029i`, each both sides | true | — |
| 11.5 8.4.1, 8.4.3, 8.4.6, 8.4.14 | `z=0.8+0.3i`; `z=−0.8+0.3i`; `z=0.7−0.4i`; `n=2` | `1.39325511+0.31345058i` both; sign flips at `Re z<0`; `1.22158792−0.25165445i` both; `0.37919874−0.31345058i` both; `0.99006724−0.09208895i` both | true; `Re z > 0` needed and stated | — |
| 14.3 7.19.3, 7.19.4, 7.19.8–7.19.11, Checks | `x=−0.8, t=0.6`; `a=0.8, u=1.3`; `t=10⁻⁴` | `0.54931425−0.22486144i` both; `H`: 0.25346096 both; 0.35939829, 0.38290606 both; `H(a,0)`: 0.48910059 both; `𝖴(0.7,t)` 0.67117 vs 0.67114 | true | — |
| 15.2 8.17.7–8.17.10, 8.17.6 | `a=0.7, b=1.6, x=0.45, c=0.7`; `a=1.3, x=0.3` | 0.7198875654 on all four sides; `I_x`: 0.72415758 vs 0.72415754 (line truncated at ±400); 0.26967854 both | true | — |
| 15.3 8.17.12–8.17.21 | `a=1.7, b=2.4, x=0.35` | 0.42206817; 1.73047948; 1.07205314; 1.47934892; 0.35722769; 1.37325179; then 0.42206817 four times, each both sides | true | — |
| `tendsto_convs_upperIncompleteGamma` (8.9.2) | `a=0.5+0.2i, z=1+i` | 400th and 4000th convergent `0.50366788−0.33757041i`; target the same | true | — |
| `erf_eq_mul_tricomiIncompleteGamma`, `erf_eq_lowerIncompleteGamma` | `z=−1.1+0.6i` | `−1.01733943+0.16223809i` both; the `γ` form gives the opposite sign at `Re z<0` | true; `Re z > 0` present | — |
| `tendsto_sum_sin_odd_div_odd_gibbs` | `n = 100, 2000` | 0.92597507, 0.92596854; `Si(π)/2 = 0.92596853`; `π/4 = 0.78539816` | true | — |
| `millsRatio_bounds`, `upperIncompleteGamma_bound` | `x=0, 2`; `(a,x)=(0.3,0.01)`, `(0.3,5)`, `(1,2)`, control `(1.5,2)` | 0.7071<0.8862≤0.8862; 0.2247<0.2263≤0.2328; 0.0867, 0.8922, 1.0000; control 1.2107 | true; `a ≤ 1` needed | — |
| `upperIncompleteGammaLog` laws (8.2.9, limiting form, 8.2.11, `_log`) | `a=0.3+0.2i, w=0.2+0.5i, m=1`; `a=−1`; `z=0.8−0.5i`; `z=−1+0.3i` | `1.79321082−2.02208529i`; `0.02373728+6.18102934i`; `−0.15646445−1.64604264i`; `1.92292816−2.23114565i`, each both sides | true | — |
| Layer 1–2 headlines (8.2.1, 8.2.3, pole, 8.8.2, 8.8.13) | `a=0.3+0.2i, z=0.8−0.5i`; `a=−1+10⁻⁵`; `a=−0.4+0.3i, z=−1+0.7i` | 8.2.3: `1.98035817−1.41457601i` both; `(a+1)γ → −1.0000047`; `0.34851041−1.52108651i` both; `0.4856501−0.8307906i` both | true | — |
| Layer 7–9 headlines (8.19.3, 8.19.12, 8.19.25, 8.8.14, 6.2.4, 6.5.5, 6.13.1) | `p=0.6+0.3i, z=1.2+0.9i`; `(a,b,p)=(½,1,2)`; `z=−1+0.5i`; `z=0.7+0.4i` | `0.00508158−0.15111466i`; `0.18722532−0.23593353i`; 0.37812 vs 0.37814; `−1.88314832−1.83364789i`; `0.69913142+0.37118655i`; `Ei(0.3725074)=−1.4e−12` | true | — |
| Layer 14 headlines (7.18.7, 7.18.12) | `z=0.3+0.2i`, `n=1`; `n=2` | `0.03408323−0.02324860i` both; `0.10732464−0.06146415i` both | true | — |
| One-tactic probe, all 69 theorems | `simp` in place of each `sorry` | 47 "`simp` made no progress", 22 "unsolved goals", none closes | no padding | — |

- Source locators checked against the text: the DLMF numbers and side conditions of the fifteen sampled subsections, on DLMF-8.2, 8.4, 8.6, 8.7, 8.11, 6.8, 6.9, 6.12, 8.21, 8.19, 7.2, 7.19, 8.17, 6.16, 8.20 and 9.7; one wrong (C01), one source gap (below).
- Book locators: 126 page locators in 11 books, none read (below); the DLMF's own source notes point to the same pages for ten of them (DLMF-8.2 line 59, DLMF-8.11 lines 63–64, DLMF-8.6 line 66, DLMF-7.2 lines 64–65, DLMF-8.19 lines 75 and 929, DLMF-6.16 line 53, DLMF-8.17 lines 287, 396, 449, 767, 838).
- Library declarations opened at the pin: `TauCeti.Contour.tendsto_integral_sin_div_atTop` (`TauCeti/Analysis/Contour/WorkedExamples/HalfDisc/SineIntegral.lean:351`), `sum_Icc_choose_mul_pow_eq_regularizedIncompleteBeta` (`TauCeti/Probability/Distributions/Binomial/Tail.lean:134`); the 31 `#check` pins of the file elaborate; no Tricomi function exists in the pinned Tau Ceti.
- Cross-roadmap citations resolved on main: AsymptoticExpansions §3.3, §4.2, §4.3, §8.1, §8.2, §8.6, §8.7, §12.1 and Layers 1, 3, 4, 5, 8; SpecialFunctionsParabolicCylinder §5.1, §5.3; ContourIntegration (completed).
- Dependency check: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`; no UPWARD or CYCLE line. The automatic checks all passed; nothing changes outside the folder.
- Elaboration of `Suggested.lean` (byte-identical to main): 69 `declaration uses sorry` warnings, no error, no other warning; no `variable` block, so no binder can be lost.
- Pull request text against the head: 69 subsections, 44 with a book locator, the 25 listed without; the per-source counts (24, 23, 22, 14, 7, 5, 5, 4, 3, 2, 1) all match; no heading or Lean declaration changed. The previous review ended with no finding open, so there was none to re-check.

Overlap check: read SpecialFunctionsConfluent, SpecialFunctionsParabolicCylinder (open revision and main), SpecialFunctionsHypergeometric, SpecialFunctionsGamma, SpecialFunctionsLegendre, SpecialFunctionsBessel, SpecialFunctionsAiry; Dawson's integral and `Hh_n` are owned by SpecialFunctionsParabolicCylinder §5.1 and §5.3 and consumed here; the incomplete Gamma, `E_p`, error functions and Pincherle's theorem are owned here and consumed by the others; nothing has two owners.

Source independence: 8 passages compared with 1 source (the DLMF; 5.1, 5.2, 8.4, 9.4, 10.1, 3.3, 14.3 and one docstring), none shared beyond forced formulas; largest share DLMF, about 443 of 569 locators in the layers; contents compared with the DLMF: the layers are not its chapters (base Chapter 8 first, Chapter 6 split by function, formulas moved between chapters), but subsections 5.1–5.4, 10.1–10.4, 12.1–12.3, 14.1–14.3 and 15.1–15.5 run parallel to its §8.11, §8.21, §§7.7–7.9, §§7.17–7.19 and §§8.17–8.18; the eleven books could not be read.

Research link: the README's own sources place it in the classical theory of Tricomi (1950), Gautschi (1967), Kölbig (1972), Temme (1996), Paris–Kaminski (2001) and MacLeod (2002); its functions are consumed by the Bessel, Airy, hypergeometric and Legendre roadmaps and identified with kernels of QSeriesPartitionsAndMockModularForms and AutomorphicLFunctionsAndLocalFactors. Rests on the README.

## Not verifiable

- Every book locator this pull request adds (Andrews–Askey–Roy, Beals–Wong, Cuyt et al., Duverney, Gautschi 2004, Lebedev, Nikiforov–Uvarov, Olver, Paris–Kaminski, Temme, Wong): the sources service found no legal copy of any of them (publisher pages paywalled or refusing access), so no page, equation or exercise number in them was read.
- Of the sampled subsections this covers the book locators of 1.1, 2.1, 3.1, 3.3, 5.1, 8.4, 9.4, 11.1, 11.5, 15.2 and 15.3; their DLMF numbers were verified.
- The Cuyt et al. locator for 6.9.1 in 8.4 is p. 277, while the DLMF's note on 6.9.1 points to pp. 287–290 of that book (DLMF-6.9 line 76); which page carries the fraction could not be settled without the book.
- Gautschi 1967, Jones–Thron, Tricomi 1950, Kölbig 1972, MacLeod 2002: not fetched; no sampled subsection cites them.

## Source issues

- **Gap** in DLMF-8.21 at 8.21.12–8.21.13 (§8.21(v), online): the source gives the values of `Si(a, ∞)` and `Ci(a, ∞)` with only the pole exclusions; it should also require `Re a < 1`, since `si(a, x) ≍ x^{a−1} cos x`; affects a stated result.

## For the human reviewers

- Not tested: the locators in the eleven books (126 page references) could not be read from any legal source here; the description says an AI model checked them against extracted text of the books.
- Scope of the revision: the pull request keeps every section number; subsections 5.1–5.4, 10.1–10.4, 12.1–12.3, 14.1–14.3 and 15.1–15.5 still run parallel to DLMF §8.11, §8.21, §§7.7–7.9, §§7.17–7.19, §§8.17–8.18. Whether that meets the request is yours.
- Licence: `README.md` (Prior formalization, line 1766) names the author's `lean-DLMF` (Apache-2.0) as source material for every layer; `Suggested.lean` was not compared with it.
