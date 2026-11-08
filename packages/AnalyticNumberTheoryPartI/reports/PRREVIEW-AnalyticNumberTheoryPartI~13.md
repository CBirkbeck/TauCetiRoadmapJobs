# Review of AnalyticNumberTheoryPartI (pull request #1126 at e2a37ca)

**Verdict:** needs changes

One P3 finding. This is an incremental re-review of the 46 README lines changed since 3667daa. `Suggested.lean` is byte-identical to that head (blob `7637d3c` at both). Paths are relative to `TauCetiRoadmap/AnalyticNumberTheoryPartI/` unless another roadmap is named.

## R01 (P3) — §3.4 places Tsimerman §2.2 on pp.380–381, but it is on p.382

**Location.** `README.md:2270` (§3.4; this head rewrites the line): "See [64][R64], Elementary fixed-degree adapter for Tsimerman §2.2, pp.380–381, using the small/large-prime split of the divisor bound".

**Claim.** [64] is Tsimerman, *The André–Oort conjecture for A_g*, Annals 187 (2018), 379–390, the PDF the [R64] link names. The page range is wrong:
- Printed pp.380–381 hold the end of the introduction (§§1.1–1.3) and §2.1 (Faltings height, Bost's lower bound).
- §2.2 ("Complex multiplication") is entirely on p.382. That includes the step §3.4 adapts: the number of ideals of norm `n` in the CM field is `n^(o(1))`, which leads to Proposition 2.2.

**Witness.** `tsimerman2018` (the publisher's open PDF, fetched into a scratch manifest only):
- line 39 is the header of p.380, line 79 the header of p.381 (§1.2 at line 84, §2.1 at line 106), line 117 the header of p.382;
- §2.2 runs from line 121 to Proposition 2.2 at lines 149–151; the ideal count is at lines 147–148; §2.3 starts at line 152.

**Repair.** At line 2270, replace "pp.380–381" by "p.382". Tested on the same text: p.382 runs from the §2.2 heading to Proposition 2.2. The step is used there without proof, which matches the README's word "adapter". The route given in §3.4 (`d_n(p^a)=binomial(a+n−1,n−1)≤n^a`, with finitely many small primes) is checked in row C below.

## Previous findings

- R01 — repaired: `README.md:3468–3470`: "Weil's explicit formula for `ζ` with `C¹` tests (§1.8a) has this downstream consumer: ExplicitZetaBounds: its §7.3a (Kadiri's smoothed explicit formula) on `Re s>1`, through `zeta_explicit_formula_laplace` and `zeta_weil_archimedean_critical_line`."
- R02 — repaired: `README.md:3534`: "[116] … commit `127b50e` of 20 October 2026 … its folder `PrimeNumberTheoremAnd/Mathlib/` holds the project's own files, not Mathlib's". [117] is gone; §0.11b (`:388`) now cites Mathlib's `log_deriv_riemannZeta_add_inv_sub_sub_isBigO`.

## Verified sound

**Gate, build, form.**
- Gate re-run at this head: `set_option=0 … statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`, exit 0.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AnalyticNumberTheoryPartI'` is empty.
- `lake env lean …/Suggested.lean` exits 0 with exactly 62 ``declaration uses `sorry` `` warnings and nothing else.
- One-tactic probe, re-run on a scratch copy: every `sorry` became `first | (simp <;> done) | rfl | infer_instance | (norm_num <;> done) | trivial | decide`. That gives 62 errors on exactly the 62 probe lines (diffed). Nothing closes, so nothing is padding.
- Binder check: the file is unchanged, so the previous round's `#check @name` pass over all 112 declarations still applies. `signatures.md` reports no lost binder.
- Dependency check: `depcheck: 239 roadmaps, 2356 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. ORDER.txt has ZerosOfLFunctions at 48, this roadmap at 49, AnalyticNumberTheoryPartII at 50 and ExplicitZetaBounds at 265, so the new consumer entry points downward.
- Overlaps tool: no other open pull request changes this roadmap, and no dropped id. The citations tool's 10 leads are the same Lean names as last round, all declared in `Suggested.lean`.

**Changed passages, one by one (PrimeNumberTheoremAnd read at commit `127b50e33f60…` by `git show`; author date 2026-10-20 03:09 +0100).**

| README line | Section | Checked | Result |
| --- | --- | --- | --- |
| 284, 318 | 0.8, 0.11 | `PrimeNumberTheoremAnd/IEANTN/RosserSchoenfeld/RosserSchoenfeldPrime.lean` defines blueprint labels `Mertens-constant` (its line 898) and `rs-420` (932); `IEANTN/Mertens.lean` defines `Mertens-sum-log-eq-sum-mangoldt` (443) and the three first-theorem labels | resolves |
| 350 | 0.11a | `IEANTN/Mertens.lean`, `Mertens-first-error-mangoldt` | resolves |
| 388, 391 | 0.11b | Mathlib `log_deriv_riemannZeta_add_inv_sub_sub_isBigO` (`NumberTheory/Harmonic/ZetaAsymp.lean:657`, root namespace): `ζ′/ζ(s)+(s−1)⁻¹−γ =O[𝓝[≠] 1] (s−1)`. `log_deriv_riemannZeta_add_inv_sub_bounded` (`:674`): `ζ′/ζ+(s−1)⁻¹ =O(1)` near 1. `tendsto_riemannZeta_sub_one_div` (`:343`). The proof of `differentiable_riemannZeta₀` (`:581–590`) uses the latter, so "built on" is accurate. The second Check is the regularized-error bullet. Values in row A | correct |
| 467 | 0.11d | `IEANTN/Chebyshev.lean` defines `cheby-def-T` (26), `cheby-T-upper` (33), `cheby-T-lower` (72), `cheby-T-Lambda` (108) | resolves |
| 526 | 0.14 | `PrimeNumberTheoremAnd/Mathlib/Analysis/SpecialFunctions/CompletedXi.lean`: `riemannXi s = (s(s−1)Λ₀(s)+1)/2` (47), `riemannXi_zero` (51), `differentiable_riemannXi` (60), `riemannXi_eq_mul_completedRiemannZeta` for `s≠0,1` (66), `riemannXi_one_sub` (74). `…/LSeries/RiemannZetaValues.lean:62` has `completedRiemannZeta_two = π/6`. Neither file and no `riemannXi` exists in pinned Mathlib | matches the description |
| 550 | 0.15 | `PrimeNumberTheoremAnd/Mathlib/Analysis/Complex/WeierstrassFactor.lean` and `CanonicalProduct.lean` exist. Pinned Mathlib's `Analysis/Complex/` has neither | resolves |
| 624 | 0.21 | `Meissel-Mertens-constant` (RosserSchoenfeldPrime 792; Mertens 1968), `rs-419` (823), `Mertens-second-error-prime-eq` | resolves |
| 654 | 0.23 | All 12 files exist under `PrimeNumberTheoremAnd/Mathlib/Analysis/Complex/`. Pinned Mathlib has `ValueDistribution/LogCounting/{Asymptotic,Basic,Truncated}.lean` and `ValueDistribution/Cartan.lean`, which are Nevanlinna theory (Cartan's formula for the characteristic function), as the new sentence says | correct |
| 697, 707 | 0.26, 0.26a | `IEANTN/Mertens.lean` defines `Mertens-third-error` (2259), `Mertens-third-theorem-error`, `Euler-Mascheroni-const-alt` (868), `Euler-Mascheroni-eq` (1899), `log-zeta-eq` (1604), `log-zeta-eq-2` (1453), and the four `Mertens-second-error-mangoldt*` and `…-weak` labels | resolves |
| 825 | 0.30a | `PrimeNumberTheoremAnd/StrongPNT.lean`: `CFunction` (447), `CfAnalytic` (487/496), `ZetaShiftFiniteZeros` (1646/1656), `def ZeroWindow` (1694). The new *Needs:* item `Complex.borelCaratheodory` is at pinned `Analysis/Complex/BorelCaratheodory.lean:109`, inside `namespace Complex` (36–125) | resolves |
| 869, 879 | 0.33, 0.33a | `PrimeNumberTheoremAnd/ZetaBounds.lean`: `ZetaUpperBnd` (1665), `ZetaBnd_aux2` (1476), `ZetaLowerBound3` (2360), `ZetaInvBound2` (2508), `ZetaInvBnd` (2706), `ZetaLowerBnd` (2823), `ZetaDerivUpperBnd` (2130), `theorem DerivUpperBnd_aux7` (1990), `LogDerivZetaBnd` (2998/3010), `LogDerivZetaBndUnif99` (3613/3623). `StrongPNT.lean`: `LogDerivZetaUniformLogSquaredBoundStrip` (2553) and `…Bound` (2816) | resolves |
| 1159 | 1.8a | `IEANTN/Kadiri.lean:1362–1385`: `Φ z = ∫ y, φ y * exp (−z*y)` over all of ℝ; the term `− ∑' Λ n / n * φ(−log n)`; the line term `(1/(2π))∫ Re ψ((1/2+it)/2) Φ(−(1/2+it)) dt`. The proof has `sorry` at 1424 and 1444. The six `KadiriEq*`/`KadiriSupport` files exist in `IEANTN/` | matches "two-sided transform", "minus sign", "not complete" |
| 1260, 2270 | 2.1b, 3.4 | `PrimeNumberTheoremAnd/IwaniecKowalskiCh1.lean`: `sigmaR` (356, `Σ_(d∣n) d^s`), `sigmaR_apply` (390), `d_apply_prime_pow` (314, `d k (p^a) = (a+k−1).choose (k−1)` for `0<k`), `d_apply` (344) | resolves (locator of [64] at 2270: R01) |
| 3468–3470 | Downstream consumers | rows B and B′ below; ExplicitZetaBounds at its open head 1a57053: §7.1 (README 2594) is the partial-fraction identity with real `B=−γ/2−1+(1/2)log 4π`; §7.3a (2801) is "Kadiri's smoothed explicit formula", with the same `φ_s`, `F(w)=∫_0^d e^(−wt)f(t)dt` and the harmonic continuation to `Re s>1/2` | correct |
| 3534, 3629 | [116] | the link is `…/tree/127b50e33f6033e2147921167a117af96d9ba4ea`. `CITATION.cff` at that commit: authors Kontorovich and Tao, released 2024-01-09. `git cat-file -e` succeeds for all 29 cited paths. The 16 citing lines map one-to-one onto the 16 sections of the "Cited for" list. No `[117]`/`R117` remains | correct |

**Ownership.** ExplicitZetaBounds' head has not moved since the last round (1a57053). Its §7.3a route still runs its own contour argument and its *Needs:* line does not cite §1.8a. This head has done what the hand-off asked of this roadmap: it keeps the earlier owner (position 49) and names the consumer and the exact instance. The citation of §1.8a in place of the contour is ExplicitZetaBounds' change. No other open roadmap was found owning Kadiri's Théorème 3.1 at modulus 1 (`roadmaps grep` for Kadiri and `Re ψ(z/2)`, as last round).

**Seeded sample.** Of the 15 sampled targets only §3.4 falls in a changed passage. Its locator was read (R01) and its mathematics computed (row C). No locator in the README is flagged as unverified (`grep -i unverified` is empty). The other 14 targets (0.5, 0.17, 0.18, 0.22, 2.5, 2.20, 2.22, 2.30, 2.46, 3.6, 3.27, 3.36, 3.38, 3.43) are untouched by this head.

**Remarks on untouched text (no change requested).**
- `README.md:2262` (§3.3) carries the same "Tsimerman §2.2, pp.380–381" for the same section.
- The new consumer paragraph lists ExplicitZetaBounds' `f` with `f(d)=f′(0)=f′(d)=0`; that roadmap also assumes `f″(d)=0`. The claimed properties of `φ_s` hold under the weaker list.
- [64] (Tsimerman) has no entry in the roadmap's `sources.toml`. This review read it through a scratch manifest only.

**Adversarial table.** Rows A–F are new, with values computed in scratch scripts. Rows 1–36 are carried from the previous report (at 3667daa, same numbering) for statements this head leaves untouched. Previous row 37 (the [116]/[117] locators) is replaced by row F.

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| A | §0.11b, regularized limit (Mathlib citation) | `η=0.1, 0.01`; `s−1=0.1i, 0.01+0.01i, −0.01` | `−ζ′/ζ(1+η)−η⁻¹=−0.558964, −0.575344` against `−γ=−0.577216`. `(ζ′/ζ(s)+(s−1)⁻¹−γ)/(s−1)=−0.1874+0.0052i, −0.1870+0.0005i, −0.1882`, bounded (the constant is `−γ²−2γ₁=−0.18755`). Wrong-sign pole: `19.44, 199.4` | holds |
| B | Downstream consumer: `φ_s` for ExplicitZetaBounds §7.3a | `d=log 30`, `f(t)=(d−t)³(d+3t)/d⁴` (`f(0)=1`, `f(d)=f′(0)=f′(d)=f″(d)=0`), `s=2+i` | `C¹`: `G′(0−)=0`, `G′(0+)=5·10⁻⁷` (`h=10⁻⁶`), `G′(d±)=0.010385+0.003539i` on both sides. Transform by quadrature against `f(0)/(s+z)−∫_0^d f e^(−(s+z)t)`: `z=−1`: `−0.0281003675−0.1880323665i` on both sides; `z=0`: `0.0236953796−0.0515265462i` on both; `z=−(1/2+14.134725i)`: `−0.0001854798−0.0004044637i` on both (differences `≤1.1·10⁻¹⁴`). Tail of the weighted integrand `∼e^((1+ε−Re s)x)`: exponent `−0.5, −0.01, 0` at `ε=0.5, 0.99, 1`, so it is integrable exactly for `ε<Re s−1=1`. `n⁻¹`-series `=0` and `φ_s(0)=0` | holds |
| B′ | Recombination with ExplicitZetaBounds 7.1 into its 7.3a | same data | `F(w)=f(0)/w+F₂(w)/w²` at `w=s`: `0.3763046204−0.1484734538i` on both sides; at `w=s−1`: `0.5281003675−0.3119676335i` on both. Prime side: `ΣΛ(n)φ_s(log n)` (`n≤2·10⁶`) `=−0.044250−0.178105i=f(0)(−ζ′/ζ(s))−Σ_(n<30)Λ(n)n^(−s)f(log n)`. Algebra: `Φ(−1)=f(0)/(s−1)−F(s−1)` cancels 7.1's pole; `Φ(0)=−F₂(s)/s²`; `f(0)/(s−ρ)` pairs with `1/ρ`; `B` is real and cancels `Σ_ρ Re(1/ρ)`; the line term becomes `+Re ψ(z/2)F₂(s−z)/(s−z)²`. This is 7.3a's right side | holds |
| C | §3.4 `d_n(m)≤C_(n,ε)m^ε` (sample) | `(n,ε)=(2,1/2), (3,1/2), (2,1/4)` | constant from the README's route `C=1.7321, 11.4096, 8.4470`. `max d_n(m)/m^ε=1.7321` (`m=12`, `d=6`, `m≤2·10⁵`), `11.4096` (`m=5040`, `d=810`, `m≤5·10⁴`), `7.9229` (`m=166320`). `binomial(a+n−1,n−1)≤n^a` for `n≤7`, `a<40`: true | holds; locator R01 |
| D | §1.8a citation of `kadiri_thm_3_1_q1` | the Lean statement at `127b50e` | transform `∫_ℝφ(y)e^(−zy)dy`; `n⁻¹`-series sign `−`; `(2π)⁻¹∫_t` equals `(2πi)⁻¹∫ dz` with `dz=i dt`; 2 `sorry` in the proof | citation accurate |
| E | §0.14 citation | `CompletedXi.lean`, `RiemannZetaValues.lean` | `ξ(0)=1/2`; `ξ(2)=Λ(2)=π⁻¹Γ(1)ζ(2)=π/6=0.523599`; product formula `s(s−1)Λ(s)/2` off `{0,1}` | citation accurate |
| F | [116] reference | 29 paths, 16 lines | 29/29 exist at the commit. 16 citing sections equal the 16 listed (0.8, 0.11, 0.11a, 0.11d, 0.14, 0.15, 0.21, 0.23, 0.26, 0.26a, 0.30a, 0.33, 0.33a, 1.8a, 2.1b, 3.4) | holds |
| 1 | §0.3 `theta_lt_of_schoenfeld` | `x=2,…,10⁵` | `θ=0.6931,…,99685.39` against `2.0002,…,100008.1` | holds (prev. row 1) |
| 2 | §0.5 | `x=59, 1000` | `16.2438<17<19.7924`; `155.2433<168<176.2001` | holds (prev. row 2) |
| 3 | §0.25 | `x=10⁸, 10⁶` | `1.7185<2`; `14.959≤27.631` | holds (prev. row 3) |
| 4 | §0.11d | `x=4`; five points | `log 24=3.178054` on all three sides; two-sided bounds as recorded | holds (prev. row 4) |
| 5 | §0.26a | `x=10⁵` | `3.020734` against `3.020686` | holds (prev. row 5) |
| 6 | §0.14 | `s=0,1,2,−1` | `ξ(0)=ξ(1)=1/2`, `ξ(2)=ξ(−1)=π/6` | holds (prev. row 6) |
| 7 | §0.33 | `s=1` | `G(1)=γ`, `R(1)=0` against `1/ζ(1)=−1.0236` | holds (prev. row 7) |
| 8 | §0.1 comparison | `N=3, 4` | `log(4N)≤3 log N` iff `N≥2` | holds (prev. row 8) |
| 9 | §0.34c | `C=12, 15` | `0.7674>3/4`, `0.7467<3/4` | holds for `C≥C₀` (prev. row 9) |
| 10 | §0.9 | `χ₋₄, χ₋₃` | `L(1)log q=1.0888, 0.6642` | holds (prev. row 10) |
| 11 | §0.6 | `T=2` | only `q=1`; first zero `14.1347>2` | holds (prev. row 11) |
| 12 | §1.2 | `y=10⁵` | `M=−48` against `754.4` | consistent (prev. row 12) |
| 13 | §1.5 | `N=2`, `T=1,10,100` | error `3.687, 3.485, 1.145` against `56.55` | holds (prev. row 13) |
| 14 | §1.7 | `σ=4/5` | `QT^(1/2)≤QT^(3/5)` | holds (prev. row 14) |
| 15 | §1.8 | ζ data, Gaussian | `Φ(1/2)=√π=1.7725` | holds (prev. row 15) |
| 16 | §1.8a critical-line form | `F=e^(−x²)` | `−1.380419` against `−1.380440`; `Re ψ(s)` variant `−0.268352` | holds (prev. row 16) |
| 17 | §1.8a Laplace form | `F=φe^(x/2)`; `φ_s` | `Φ(z)=Φ_F(−z)`; `n⁻¹`-series `0` for `φ_s` | holds (prev. row 17) |
| 18 | §1.9 | `χ₀` mod 2 | zero `2πi/log 2` outside `DirichletGRH` | holds (prev. row 18) |
| 19 | §2.2a | `ℚ(i)/ℚ`; `χ₈` | `a₂=2`; `a=3` | holds (prev. row 19) |
| 20 | §2.3a | `K=ℚ` | residues `−1` at 0, `+1` at 1 | holds (prev. row 20) |
| 21 | §2.8 | `ℚ(√−5)` | `a_[1](2)=0`, `a_[𝔭₂](2)=1` | holds (prev. row 21) |
| 22 | §2.9 | `ℚ(i)/ℚ` | `\|C\|/\|G\|=1/2`, `x≥4³⁵` | holds (prev. row 22) |
| 23 | §2.9a | 11 triples | all 12 inequalities true (least margin `0.000184`) | holds (prev. row 23) |
| 24 | Zaman digamma Checks | 5 points | `δ(2,0)=−0.5772157`, `δ(1,0)=−1.9635100`, … | holds (prev. row 24) |
| 25 | §2.10 | `D=−20`, `𝔭₃` | `χ=−1` | holds (prev. row 25) |
| 26 | §2.11 | `χ₋₄` | Gauss sum `2i`, root number `1` | holds (prev. row 26) |
| 27 | §2.16 | `D=−4, −3` | `Λ_std(0)=Λ_std(1)=1, 1/√3` | holds (prev. row 27) |
| 28 | §2.22 | `ℚ(i)` | `ℓ₀+ℓ₁=1.0288=γ+log(π/2)` | holds (prev. row 28) |
| 29 | §3.5 | `x=4, 10` | `N₁(4)={2,3}`, `N₂(10)={35}` | holds (prev. row 29) |
| 30 | §3.34 | `x=10⁶`, `u=2` | `0.344299` against `ρ(2)=0.306853` | consistent (prev. row 30) |
| 31 | §3.13 | `X=10⁶` | `216341` against `205606.6` | consistent (prev. row 31) |
| 32 | §3.24a | `s=2` | `6.764520` against `6.762254` | holds (prev. row 32) |
| 33 | §3.23a | README values | six values match | holds (prev. row 33) |
| 34 | §3.2 | `N=24, 8` | `3>2.987`; `2>1.955` | holds (prev. row 34) |
| 35 | §2.15 | `ℚ(√5)` | `κ=0.4304≤2.1874` | holds (prev. row 35) |
| 36 | §2.3a shift clause | `ω\|·\|^u` | `Λ_H(ω\|·\|^u,s)=A^(−u/2)Λ_H(ω,s+u)` | holds (prev. row 36) |

**Library declarations opened at the pins.**
- Mathlib: `ZetaAsymp.lean:343, 549–709` (the namespace block ends at 412, so the near-one lemmas are in the root namespace); `BorelCaratheodory.lean:36, 109, 125`; `Analysis/Complex/ValueDistribution/Cartan.lean` header and `LogCounting/Basic.lean` header.
- Absent at the pin: `riemannXi`, `completedRiemannZeta_two`, `HadamardFactorization`, `WeierstrassFactor`, `CanonicalProduct`.

## Not verifiable

- None in the passages this head changes. Tsimerman (Annals 187) was read through a scratch manifest; PrimeNumberTheoremAnd was read at the cited commit. The previous report's list (Jutila, Serre, Neukirch, Rosser–Schoenfeld 1962, Koukoulopoulos, Iwaniec–Kowalski, Montgomery–Vaughan, Titchmarsh, Friedlander–Iwaniec 2018 as uncertified, Kadiri 2005) concerns untouched passages and stands.

## Source issues

- none
