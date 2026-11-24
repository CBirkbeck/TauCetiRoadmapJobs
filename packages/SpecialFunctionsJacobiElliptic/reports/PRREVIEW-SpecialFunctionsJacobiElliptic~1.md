# Review of SpecialFunctionsJacobiElliptic (pull request #3075 at eb82a19)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of `Suggested.lean` and the main Check values were recomputed numerically from the Lean definitions at three values of `τ` and at moduli on and off the cuts, and all hold; the supplier sections of SpecialFunctionsTheta and the pinned Tau Ceti declarations exist as cited. There are nine small corrections (two proof sketches, four source attributions, a list of library files that are not at the pin, one redundant hypothesis, one missing exclusion `k ≠ −1`, and the description) and two format notes, none blocking. Nine of the eleven cited texts are paywalled books and could not be read; that is left to the human reviewers.

## C01 — The sketches of 4.4 and 4.5 cross the two directions, and Whittaker–Watson derive the law of 4.5, not the first law of 4.4

An implementer who follows "4.4 at `τ/2`, solved for the functions at `τ`" (4.5, line 525) does not arrive at the displayed laws. Solving 4.4 at `τ/2` gives `sn(u|τ) = (1 + k₂′) sn(2x)/(1 + dn(2x))` with `x = u/(1 + k₂′)` and the functions at `τ/2` (computed: both sides agree to `10⁻¹⁵` at the three test values of `τ`); the displayed `(1 + k₂′) sn x cn x/dn x` then needs the half-argument identity of 5.2, which is a later layer and not in Layer 4's dependencies.

Whittaker–Watson §22.42 (3rd ed. text, line 34048, p. 508) prove `sn((1 + k′)u, k₁) = (1 + k′) sn(u, k) cd(u, k)`, the functions at `2τ` in terms of those at `τ`. That is the first law of 4.5 with `τ/2` in place of `τ`, and it comes directly from the first quotient of SpecialFunctionsTheta 4.4. So "the first law as Whittaker–Watson derive it" (4.4, line 504) is not what they derive. The smallest change: in 4.5 say "the first quotient of SpecialFunctionsTheta 4.4 at `τ/2`, as Whittaker–Watson §22.42 derive it; the others from 1.2"; in 4.4 say that the first law follows from the second quotient of SpecialFunctionsTheta 4.4, which gives `sc(u|τ) = (1 + k₁) sn/(cn dn)` at `(w|2τ)`, and 1.2.

## C02 — The contour of 6.1 passes through poles, and it is not Whittaker–Watson's

The sketch (line 607) integrates `sn(2Kx/π) e^{inx}` "around the parallelogram with corners `±π`, `±π + πτ`". The integrand has poles at `x = mπ + (n + ½)πτ`, so `x = ±π + πτ/2` lie on the two slanted sides (computed: `θ_n` vanishes at `u = 2K + τK` to `4 · 10⁻¹⁶` at `τ = 0.3 + 0.8i`). Whittaker–Watson §22.6 (line 34211, p. 510) use the corners `−π`, `π`, `πτ`, `−2π + πτ`, which avoid them. Give those corners.

## C03 — Whittaker–Watson §22.11 supports 3.1 only off the cuts

The inversion is stated for every `μ ∉ {0, 1}` and cites "Whittaker–Watson §22.11, p. 491" among its sources (line 320). At that place (lines 33028–33029) the existence of `τ` is asserted unless `k² ≥ 1` or `k² ≤ 0`. The statement itself is true and the README's own proof covers the two cuts by `τ + 1` and `τ/(1 − τ)`; cite Whittaker–Watson "for `μ` off the two cuts".

## C04 — DLMF 22.7.5 already defines `k₂′` as the quotient

Line 522 says "DLMF 22.7.5 defines `k₂′` by a root of `1 − k₂²`; the quotient is the right branch". DLMF 22.7.5 (version 1.2.8; its text, lines 211–217) reads `k₂ = 2√k/(1 + k)`, `k₂′ = (1 − k)/(1 + k)`. Drop the parenthesis, or say that the quotient is DLMF's definition and that the other root of `1 − k₂²` fails (the negative control already shows it: `0.02854` at `k = 0.6`, recomputed).

## C05 — The DLMF locator of 8.1 is the real integral; Carlson's form is DLMF 19.25.33

8.1 cites DLMF 22.15.11 (line 804, and the docstring of `jacobiSn_mul_carlsonRF`). That equation is `x = ∫₀^{sn(x,k)} dt/√((1 − t²)(1 − k²t²))` for `−1 ≤ x ≤ 1`, `0 ≤ k ≤ 1` (its text, lines 386–390). The form `arcsn x = x R_F(1 − x², 1 − k²x², 1)` is DLMF 19.25.33 with `p = n` (its text, line 1227: `arcsp(x, k) = x R_F(1, 1 + Δ(q,p)x², 1 + Δ(r,p)x²)`). Add 19.25.33; the extension to the star-shaped complex domain is the README's own, and it holds at the 46 pairs `(k, x)` in the domain that I tried.

## C06 — Six library files named under "Inputs" are not in the pinned Tau Ceti

Scope and ownership (lines 865–874) says Tau Ceti proves the real addition theorems in `JacobiElliptic/Addition.lean`, the limit in `JacobiElliptic/Degeneration.lean`, the pendulum in `JacobiElliptic/Pendulum.lean`, formalizes theta functions in `JacobiTheta/Basic.lean`, and has `Elliptic/Weierstrass/Zeta.lean` and `Sigma.lean`. At the pinned commit `TauCeti/Analysis/SpecialFunctions/JacobiElliptic/` holds only `Basic.lean`, `Elliptic/` only `Uniformization.lean` and `WeierstrassZeta.lean`, and there is no `SpecialFunctions/JacobiTheta/`. A reader who looks for these inputs finds nothing. Name only what the pin has, or cite the owning roadmap sections (EllipticIntegrals Milestone 7, SpecialFunctionsTheta Layer 1) without file names.

Conversely, the rectangular case of 7.4 is at the pin and is not listed: `TauCeti.Real.legendre_relation` (`TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Relation.lean`, line 88; EllipticIntegrals §3.2), for `0 < k < 1`. It belongs in the same list.

## C07 — The hypothesis `hd` of `jacobiSnTau_landen` follows from the other two

Where `θ_n(w|2τ) ≠ 0`, `dn² = 1 − k₁² sn²` (1.2), so `1 + k₁ − dn² = k₁(1 + k₁ sn²)` (recomputed: equal to `5 · 10⁻¹⁶` at the three test values), and `k₁ = thetaModulus (2τ)` never vanishes. So `hd` is implied by `hn` and `hs`. Drop it, or say in 4.4 that the two denominators vanish together.

## C08 — The modulus form of 4.5 needs `k ≠ −1`

4.4 excludes `k′ = −1` for its modulus form; the corresponding bullet of 4.5 (line 521) states no exclusion. At `k = −1` the quotients give `k₂ = k₂′ = 0` with `x / 0 = 0`, and the first law would read `tanh u = sin u cos u`. For `k ≠ −1` it holds, including on the cut (recomputed at `k = −0.6`, `−3`, `−0.7 + 0.9i`, both roots). Add "for `k ≠ −1`".

## C09 — Two sentences of the description do not match the head

"recorded the errata above" follows "DLMF errors: none found", so it refers to nothing; say "recorded errata, none of which fall in this roadmap's scope" or drop the clause. The description gives Magnus–Oberhettinger–Soni as "§§10.3–10.6" and the README's Summary as "§§10.3–10.4", while the layers cite §10.3, §10.4 and §10.6; use one of them in both places.

## N01 — Process and software words in the text

"SpecialFunctionsHeun (an open PR)" (line 832): cite it as "SpecialFunctionsHeun 2.4". Three Checks give "mpmath's" value as the comparison (lines 181, 371, 762); "the value of `sn(u, k)` computed from the integral" would be timeless.

## N02 — Four locator slips, none affecting a statement

5.2 cites DLMF 22.6.19–22.6.20 for three half-argument laws; `dn²(z/2)` is 22.6.21. 5.1 cites Whittaker–Watson §22.2, pp. 494–496, for all three addition theorems; `cn` and `dn` are §22.21, p. 497. 2.3 cites §22.35, p. 505, for the residues; they are computed in §22.341, p. 504. The Summary's "Magnus–Oberhettinger–Soni §§10.3–10.4" omits §10.6, cited in 7.1.

## Verified sound

Values are from a plain double-precision recomputation of the Lean definitions (`jacobiTheta₂` as its series, Carlson's `R_F`, `R_D` by duplication with principal roots, `℘` and `ζ` as lattice sums over `|m|, |n| ≤ 150`). `T` = the three test values `τ = 0.3 + 0.8i`, `−1.2 + 0.5i`, `0.55 + 1.4i`; `u = 0.37 + 0.21i`.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 1.1 definitions, meromorphy (sample) | `T`; `θ₁′(0)` vs `θ₂θ₃θ₄(0)` | `sn = 0.3732144444 + 0.1874422823i` at `τ₁`; `θ₁′(0)` difference `≤ 3 · 10⁻¹⁶`; W–W (A)–(C) p. 492 read | holds |
| 1.2 quadratic relations | `T` | three residuals `≤ 5 · 10⁻¹⁵`; `k(−1.2 + 0.5i) = −3.3728 − 1.7256i` | holds |
| 1.3 derivatives (sample) | `T`, central differences | `sn′ − cn dn` etc. `≤ 10⁻⁹`; wrong `−k′²` off by `0.38858`; W–W (I) p. 492, DLMF Table 22.13.1 read | holds |
| 2.1 quarter periods | nine rows at `T` | all residuals `≤ 10⁻¹⁴`; `+k′ sd` off by `0.57698` | holds |
| 2.2 half periods | six laws at `T` | residuals `≤ 2 · 10⁻¹⁵` | holds |
| 2.3 zeros, residues | `T` | `θ_n(τK) ≈ 10⁻¹⁵`; residues `1/k`, `−i/k`, `−i` to `4 · 10⁻¹⁰` at `ε = 10⁻⁶` | holds |
| 3.1 inversion (sample) | `μ = −10⁻⁶`, `1.002`, `4`, `−4`, `2.25` via `τ + 1`, `τ/(1 − τ)` | `λ(τ) − μ` `≤ 5 · 10⁻¹⁵` | holds; C03 |
| 3.2 `λ` only | `τ₁`, `τ₁ + 2`, `τ₁/(1 − 2τ₁)` | `sn`, `ℰ` agree to `5 · 10⁻¹⁶`; `K` differs by `3.265` | holds |
| 3.3 `carlsonTau_spec` (sample) | 11 moduli incl. `k² = −1 + 0.01i`, `2 ± 0.01i`, `−5 − 0.001i` | `Im τ > 0`; `λ − k²`, `K − R_F`, `K(−1/τ) − R_F(0,k²,1)` all `≤ 4 · 10⁻¹⁴` | holds |
| 3.4 reconciliation, sanity check | `k = 0.6`, `u = 0.7`; `k = 0, 1` | `0.6299171153`, `0.7766623641`, `0.9258258983`; sanity check closes by one `simp` | holds; already marked a sanity check |
| 3.5 limits (sample) | `k = 0.001`, `0.001i`; `1 ± 0.001`, `1 ± 0.001i`; `u = iπ/2` | `1.2 · 10⁻⁸` both; `2.4 · 10⁻⁵`; rate `−0.0016009 − 0.0119374i`; blow-up `127, 1273, 12732` | holds |
| 4.1 imaginary transformation | `T` | residuals `≤ 6 · 10⁻¹⁶`; `K(−1/τ) = −iτK` | holds |
| 4.2 reciprocal modulus | 10 moduli incl. `2`, `0.5`, `i`, `−1`, `2i` | residuals `≤ 10⁻¹⁵`; wrong form off by `1.00876` | holds |
| 4.3 imaginary modulus | 8 moduli, both signs of `k₁′`, incl. `0`, `2i`, `3` | residuals `≤ 10⁻¹⁵` | holds |
| 4.4 Landen (sample) | `T`; modulus form at 3 moduli, both roots | `k₁ = (1 − k′)/(1 + k′)`, `(1 + k₁)K(2τ) = K(τ)`, three laws `≤ 1.4 · 10⁻¹⁴` | holds; C01, C07 |
| 4.5 Gauss (sample) | `T`; modulus form at 6 moduli incl. `−0.6`, `−3` | laws `≤ 2 · 10⁻¹⁵`; other root off by `0.02854`; `k = −1` fails | holds; C01, C04, C08 |
| 5.1 addition | `T`; `k = 0.5 + 0.3i`, `v = −0.52 + 0.33i` | `sn(u + v) = −0.1825942323 + 0.5551885064i` both sides | holds |
| 5.2 double, half (sample) | `k = 0.5 + 0.3i`; `sn²(K/2)` at `T`, `i` | six laws `≤ 10⁻¹⁵`; `0.5857864376 = 2 − √2` at `i` | holds |
| 6.1 Fourier (sample) | `T`, `ζ = 0.21 + 0.17i` | three sums `≤ 7 · 10⁻¹⁶`; strip is DLMF's `q e^{2|Im ζ|} < 1` | holds; C02 |
| 6.2 cosecant series (sample) | `T`, `t = 0.13 + 0.07i`, `|n| ≤ 60` | residuals `≤ 2 · 10⁻¹⁵`; DLMF 22.12.2–3 read | holds |
| 6.3 products | `T`, 100 factors | residuals `≤ 2 · 10⁻¹⁵`; principal roots give `−i sn` at `τ₂` | holds |
| 7.1 `℘` (sample) | `T`, direct lattice sum | first law to `4 · 10⁻⁶`; `e₁, e₂, e₃` to `2 · 10⁻⁵` (truncation) | holds |
| 7.2 `ℰ′ = dn²`, `E` (sample) | `T`; `τ = 1.13968i` | `E(τ₁) = 1.2500459245 − 0.2368369224i`; `E = 1.4180833944` at `k = 0.6` | holds |
| 7.3 quasi-periods, `ℰ(iu)` | `T` | five laws `≤ 5 · 10⁻¹⁵` | holds |
| 7.4 Legendre, Carlson `E` (sample) | `T`; 11 moduli | `π/2` to `1.4 · 10⁻¹⁵`; `E − (R_F − k²R_D/3)` `≤ 6 · 10⁻¹⁵` | holds |
| 7.5 `ζ` (sample) | `T`, direct lattice sum | two sides agree to `5 · 10⁻⁷`; derivative identity checked by hand | holds |
| 8.1 `arcsn` (sample) | 7 moduli × 7 points, 46 pairs in the domain | `sn(g(x)) − x` `≤ 2 · 10⁻¹⁴`; `g(1) = 1.7507538029`; `π/6`, `artanh ½` | holds; C05 |

- Source locators checked against the text: 16 in Whittaker–Watson (3rd ed. text, same pages in Ch. XXII), about 40 DLMF equations in §§22.2, 22.5–22.8, 22.11–22.13, 22.15–22.17 and 19.25.
- Library declarations opened at the pin: `TauCeti.Real.jacobiSn`/`Cn`/`Dn` (`JacobiElliptic/Basic.lean`, lines 66–72), `Complex.carlsonRF` (`Carlson/Basic.lean`, line 91), `carlsonRD` (`Carlson/RJ.lean`, line 91), `UpperHalfPlane.periodPair` and `PeriodPair.weierstrassP_smul` (`UpperHalfPlane/PeriodPair.lean`, lines 99, 614), `PeriodPair.weierstrassZeta` (`Elliptic/WeierstrassZeta.lean`, line 71), `legendre_relation` (`EllipticIntegral/Relation.lean`, line 88).
- Cross-roadmap citations resolved: SpecialFunctionsTheta 1.1–1.3, 2.2–2.3, 3.1, 4.2–4.4, 6.1–6.4, 6.6 on main; the eight local copies agree with its `Suggested.lean`; ModularCurvesPartII §1.4a, QSeriesPartitionsAndMockModularForms §5.1, SpecialFunctionsHeun 2.4.
- Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: `Suggested.lean` elaborates with 33 `sorry` warnings and nothing else; no section variables, so no binder can be lost; one-tactic probe closes only the sanity check of 3.4.
- Headlines: the 31 named headlines of the README are all stated; none is absent or forced through a stand-in.

Overlap check: read SpecialFunctionsTheta, EllipticIntegrals, SpecialFunctionsHeun; theta quotients `φ_{m,n}` and `λ` on `F`: SpecialFunctionsTheta (6.6, 6.2); real `sn, cn, dn` and real Legendre relation: EllipticIntegrals (Milestones 7, 3); both leave the complex functions to this roadmap; nothing has two owners.

Source independence: 61 passages compared with 2 sources, none shared; largest share DLMF, 43 of 169 locators (Lawden 36, not readable); contents compared with DLMF Chapter 22 and Whittaker–Watson Ch. XXII: independent.

Research link: the complex-modulus theory is that of Walker (2003), which DLMF §22.17(ii) cites for it; the README's consumers are Lamé functions and ellipsoidal harmonics (Whittaker–Watson Ch. XXIII), cnoidal-wave solutions of KdV and NLS, and conformal maps by `sn` (DLMF §22.18(ii)). Rests on the README and DLMF.

## Not verifiable

- Lawden 1989, Armitage–Eberlein 2006, Takebe 2023, Chandrasekharan 1985, Magnus–Oberhettinger–Soni 1966, Temme 1996, Schwalm 2015, Lang 1987, Koecher–Krieg: paywalled books (Springer, Cambridge, IOP, Wiley); the sources service finds no legal copy. Their locators were not opened.
- Whittaker–Watson: read in the 3rd edition (1920) text; the README cites the 4th (1927). Section numbers and the pages of Ch. XXII agree with the README's.
- The README's 30-digit agreements were recomputed only to double precision.

Automatic checks set aside as false positives: a section comment of `Suggested.lean` with no declaration under it, which holds the `#check` lines that pin library declarations, as the rules allow.

## Source issues

- none

## For the human reviewers

- Not tested: nine of eleven cited texts, among them Lawden (36 of 169 locators), could not be read; wording and arrangement were compared only with DLMF Chapter 22 and Whittaker–Watson Ch. XXII.
- Licence: the description says the author's lean-DLMF project formalized much of DLMF Chapter 22; `Suggested.lean` was not compared with that repository.
