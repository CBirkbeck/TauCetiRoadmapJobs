# Review of AnalyticNumberTheoryPartI (pull request #1126 at 3667daa)

**Verdict:** needs changes

One P2 finding and one P3 finding. Paths are relative to `TauCetiRoadmap/AnalyticNumberTheoryPartI/` unless another roadmap is named.

## R01 (P2) — Kadiri's explicit formula now has two owners: §1.8a here and ExplicitZetaBounds §7.3a

**Location.**
- `README.md:1143`: "`zeta_explicit_formula_laplace` is the formula above for a test `φ` that weights `Λ(n)` directly … two-sided Laplace transform of `φ`".
- `README.md:1141`: the critical-line form `zeta_weil_archimedean_critical_line`.
- `README.md:1159` cites PrimeNumberTheoremAnd's `Kadiri.lean` (`kadiri-thm-3-1-q1`) "for the critical-line form and the formula in `φ`".
- `Suggested.lean:583–615` states both theorems.

**Claim.** This head adds Kadiri's Théorème 3.1 at modulus 1 to this roadmap: an explicit formula for `Σ Λ(n)φ(log n)` in terms of the transform `Φ(z)=∫φ(x)e^(−zx)dx`, with the archimedean term written as a `Re ψ(z/2)` integral along `Re z=1/2`. ExplicitZetaBounds is an open roadmap later in the merge order (position 265; this roadmap is 49). Its §7.3a plans the same contour proof and does not consume §1.8a. That gives one object two owners. Nothing in this roadmap uses the two new theorems, and the Downstream consumers section (`README.md:3452–3468`) names no consumer for them.

**Witness.** ExplicitZetaBounds at the head of pull request #1954 (1a57053):
- `TauCetiRoadmap/ExplicitZetaBounds/README.md:2827–2869` (§7.3a) states Kadiri's smoothed formula. Its route integrates `−ζ′/ζ` against the transform and moves "the gamma term to `Re z = 1/2` (`kadiri2005` Théorème 3.1 at the modulus `1`)".
- Its contract with this roadmap (`:357–372`) lists §§0.23a, 1.5, 1.5a, 1.6, 0.34 and 0.34a, and its §7.3a *Needs:* line does not mention §1.8a.

**Repair.** This roadmap is the earlier one, so keep the owner here and make the hand-off explicit:
1. Name ExplicitZetaBounds §7.3a in Downstream consumers as the consumer of `zeta_explicit_formula_laplace` and `zeta_weil_archimedean_critical_line`.
2. The ExplicitZetaBounds pull request then cites §1.8a in its contract and route, in place of its own contour argument. It keeps only its harmonic continuation from `Re s>1` to `Re s>1/2`.

Tested on that consumer's instance, for `Re s>1`. Take its test function `φ_s(y)=(f(0)−f(y))e^(−sy)` for `y≥0` and `0` for `y<0`.
- Hypothesis: `x↦φ_s(x)e^(x/2)` is `C¹`, because `f′(0)=0` and `f(d)=f′(d)=0`. It is `O(e^((1/2−Re s)x))`, so `WeilC1TestFunction` holds for every `ε<Re s−1`.
- Transform: `Φ(z)=f(0)/(s+z)−F(s+z)`, which is exactly ExplicitZetaBounds' "Laplace steps".
- `n⁻¹`-series: `Σ Λ(n)n⁻¹φ_s(−log n)=0`, since `φ_s` vanishes on `y<0`.
- Prime side: `Σ Λ(n)φ_s(log n)=f(0)Σ Λ(n)n^(−s)−Σ Λ(n)n^(−s)f(log n)`, which is that roadmap's left side after its 7.1 recombination.

Fallback, if that consumer is not taken up: delete both theorems from §1.8a and `Suggested.lean` and leave Kadiri's formula to ExplicitZetaBounds. `grep` finds no other use of either name in this folder.

## R02 (P3) — The new references [116] and [117] point at moving repositories, with partial paths that read as pinned-Mathlib files and an unproved node

**Location.**
- `README.md:3530`: "[116][R116] Alex Kontorovich and Terence Tao, *Prime Number Theorem and More* (PrimeNumberTheoremAnd), Lean formalization, GitHub repository".
- `README.md:3531`: "[117][R117] *Integrated Explicit Analytic Number Theory Network* (IEANTN), GitHub repository; cited for §0.11b".
- The 17 citations at `README.md:284, 318, 350, 388, 467, 526, 550, 624, 654, 697, 707, 825, 869, 879, 1159, 1260, 2270`.

**Claim.** Three problems:
1. **No version.** Neither reference names a commit or release, and both are live repositories whose `main` moves (IEANTN was created on 2026-08-24; the commits read here are dated 2026-10-20 and 2026-11-02). File names and blueprint labels at `main` are therefore not exact locators.
2. **Partial paths.**
   - `Kadiri.lean`, `Mertens.lean` and `RosserSchoenfeldPrime.lean` live under `PrimeNumberTheoremAnd/IEANTN/`.
   - `Mathlib/Analysis/Complex/HadamardFactorization.lean`, `WeierstrassFactor.lean`, `CanonicalProduct.lean`, `Mathlib/NumberTheory/LSeries/RiemannZetaValues.lean` and `Mathlib/Analysis/SpecialFunctions/CompletedXi.lean` (`:526`, `:550`, `:654`) are PrimeNumberTheoremAnd's own folder `PrimeNumberTheoremAnd/Mathlib/…`. The pinned Mathlib has none of these files.
   - The pinned Mathlib does have `Mathlib/Analysis/Complex/ValueDistribution/LogCounting/` and `ValueDistribution/Cartan.lean`. `:654` attributes those same names to [116], so a reader checking at the pin finds different files.
3. **[117].** It has no author or year. The node cited at `:388`, `ZetaLogDerivValues/v1`, is a stub that formalizes Chirre–Helfgott, arXiv:2512.15709. Yet it is cited for a classical fact that the §0.11b Check already derives.

**Witness.**
- PrimeNumberTheoremAnd tree at 127b50e: the files sit at `PrimeNumberTheoremAnd/IEANTN/Kadiri.lean` and `PrimeNumberTheoremAnd/Mathlib/Analysis/Complex/HadamardFactorization.lean`.
- The pinned Mathlib's `Analysis/Complex/` has no `HadamardFactorization`, `WeierstrassFactor` or `CanonicalProduct`; its `Hadamard.lean` is the three-lines theorem.
- IEANTN `IEANTN/Nodes/ZetaLogDerivValues/v1/formalization.yaml`: node status "stub", "STATED BUT NOT PROVED".

**Repair.**
1. Give [116] and [117] a commit (PrimeNumberTheoremAnd `127b50e33f6033e2147921167a117af96d9ba4ea`, IEANTN `466b41b28ecc224398cf53a99c5fe9618131398b`), authors and a year.
2. Write every cited file with its full repository path, for example `PrimeNumberTheoremAnd/IEANTN/Kadiri.lean` and `PrimeNumberTheoremAnd/Mathlib/Analysis/Complex/HadamardFactorization.lean`.
3. At §0.11b, replace [117] by Mathlib's `tendsto_riemannZeta_sub_one_div` (`Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean:343`, `ζ(s)−1/(s−1)→γ`). The Check's Laurent argument starts from it.

Tested: at 127b50e the cited labels resolve, including `Mertens-third-theorem-error`, `Euler-Mascheroni-eq`, `log-zeta-eq-2` and `kadiri-thm-3-1-q1`.

## Verified sound

**Previous review (at 70913eb), finding by finding.**

| Id | Status at 3667daa | Evidence |
| --- | --- | --- |
| R01 | repaired | `grep -n "riemannXi\|besselY\|logRatio\|logarithmicWeight\|movingWeight\|movingPhase" README.md Suggested.lean` is empty. `:511` now reads "`2ξ=entireCompletion d₁`, where `d₁` is the record of the trivial character modulo 1 (LFunctions' `dirichletData` at that character and its primitivity…)". §§3.23b and 3.23d–e use `Y_ν`, `L(y)`, `w_(α,β,γ)`, `Q_T` and `h_T`. |
| R02 | repaired | `README.md:1460` gives Zaman's general form ("for every finite Galois extension `L/F` … `π_C(x)≥c D_L^(−19)(|C|/|G|)x/log x`"). `Suggested.lean:802–810` states it on `NumberField.Chebotarev.frobeniusPrimeCount`. The `L=F=k`, `C={1}` corollary bullet (`:1464`) has one absolute `c`. |
| R03 | repaired | `Suggested.lean:767–768`: `zamanDelta x t := (Complex.digamma (((x : ℂ) + (t : ℂ) * I) / 2)).re`. Checks were added at `README.md:1519–1526` and `:2686–2692`; all values are recomputed in rows 23–24 and 33 below. |
| R04 | repaired | `grep` for `f_chi`, `L_f prime`, `eta_E`, `kappa_`, `EulerGamma` and `Lean calculus` is empty. The repaired lines `:1727`, `:1739`, `:1947`, `:2108`, `:2180` and `:2190` read as requested. |

**Gate, build, form.**
- Gate re-run at this head: `… readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AnalyticNumberTheoryPartI'` is empty.
- `lake env lean …/Suggested.lean` exits 0 with exactly 62 ``declaration uses `sorry` `` warnings and nothing else.
- One-tactic probe: in a scratch copy, every `sorry` became `first | (simp <;> done) | rfl | infer_instance | (norm_num <;> done) | trivial | decide`. That gives 62 errors, one on each of the 62 probe lines (diffed), so nothing closes and nothing is padding. The two new §1.8a theorems are analytic identities, not restatements.
- Binder check: `#check @name` for all 112 declarations in one scratch file exits 0.
  - `frobeniusPrimeCount_lower_thirtyfive_nineteen` elaborates with `[IsGalois K L]`, `C : ConjClasses Gal(L/K)` and `|discr L|^35 ≤ x`, as the README says.
  - The two new §1.8a theorems carry only `F`/`φ` and `WeilC1TestFunction`.
  - Only `section Hecke`'s `{K} [Field K] [NumberField K]` is inherited, by the four Hecke declarations that use it. No change was needed.
- Dependency check: `depcheck: 239 roadmaps, 2356 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. ORDER.txt has ZerosOfLFunctions at 48, this roadmap at 49 and AnalyticNumberTheoryPartII at 50.
- Citations tool: its 10 "Lean names found nowhere" leads are all declared, at `Suggested.lean:953–969` and `:1018–1074`.
- Overlaps tool: it reports no other open pull request changing this roadmap and no dropped id; I confirmed both. The renamed §2.9 theorem's old name `primeIdeal_lower_thirtyfive_nineteen` occurs in no other roadmap (`roadmaps grep`). ExplicitNumberFields' citation of §2.9a (its README:172, Odlyzko input) still matches `README.md:1489`.

**Library declarations opened at the pins.**
- Mathlib:
  - `Complex.digamma_one`, `Complex.digamma_one_half` (`Analysis/SpecialFunctions/Gamma/Digamma.lean:56, 59`). Its TODO at `:38` ("Prove Gauss' integral representation") confirms §1.8a's need for `digamma_eq_integral`.
  - `Complex.Gamma_conj` (`Gamma/Basic.lean:356`).
  - `DirichletCharacter.IsPrimitive.completedLFunction_one_sub` (`LSeries/DirichletContinuation.lean:291`; `N^(s−1/2)·rootNumber`) and `rootNumber` (`:279`; `gaussSum/(I^a √N)`).
  - `logDeriv_riemannZeta_one_sub` (`LSeries/RiemannZetaLogDeriv.lean:35`; no overlap with this roadmap).
  - `riemannZetaZeros` and `IsCompact.inter_riemannZetaZeros_finite` (`LSeries/ZetaZeros.lean`), which make every `∑ᶠ` zero carrier finite.
  - `tendsto_riemannZeta_sub_one_div` (`Harmonic/ZetaAsymp.lean:343`).
  - `Analysis/Complex/Hadamard.lean` is the three-lines theorem. No Weierstrass factor exists at the pin (`grep` finds only `WeierstrassPreparation`), so §0.15 duplicates nothing.
- Tau Ceti:
  - `NumberField.Chebotarev.frobeniusPrimeCount` (`NumberTheory/Chebotarev/PrimeCounting/VonMangoldt.lean:177`; section `[IsGalois K L]` at `:66–67`) and `frobeniusPrimeCount_eq_card` (`:181`, inclusive cutoff `absNorm ≤ x`).
  - `frobeniusPrimeSet` (`…/FrobeniusPrimeSet.lean:93`, unramified primes only).
  - `artinSymbol` (`NumberTheory/NumberField/ArtinSymbol.lean:57`, arithmetic Frobenius).

**Cross-roadmap citations and ownership resolved.**
- On main:
  - ZerosOfLFunctions Layer 2 *analyticConductorAt* (README:586–622; archimedean factors `≥3`, `ζ` record `‖s‖+3`), which supports the new §0.1 text `log Q_an(χ,0)≤log(4N)≤3log N`.
  - LFunctions Layers 1, 2, 4, 5, 6 and 7 (README:428, 647, 859, 929, 1100, 1440).
- Open pull requests:
  - ExplicitZetaBounds #1954 (contract README:357–372; §7.3a; see R01).
  - ExplicitPrimeCounting #1945. Its contract with this roadmap consumes §§0.2, 0.3, 0.5, 0.7, 0.8, 0.16, 0.19, 0.20, 0.25, 0.26a, 0.30, 0.32, 0.34, 1.6, 1.9 and 0.11d, all present. Its §2.1 extends ZerosOfLFunctions 8.4's compact-support class, which is a different object from §1.8a.
  - ExplicitNumberFields #1944.
  - ProbabilisticAndMetricNumberTheoryPartII #1838 (its §2.5 two-sided Laplace adapters, later in the order, are not restated here).
- Ownership was searched with `roadmaps grep` for Kadiri, the Weil explicit formula, `Re ψ(z/2)` and two-sided Laplace transforms. Only R01 survives.

**Seeded sample (15 targets, each read at its locator).**

| Target | Source read | Result |
| --- | --- | --- |
| 0.14 | `kedlayaant` lines 1729 ((5.1.4), p.34), 1740–1743 (ξ and reflection, p.35), 2187–2195 (Lemma 8.3, p.47; `ξ=1/2+(1/2)s(s−1)∫…`) | supported |
| 0.25 | Bennett–Siksek (Annals cache) lines 423–438 (Lemma 5.1 proof, p.365: `∏(1+1/q)≤exp(0.27+5/log k)log k`, hence `≤2log k` for `k≥10^8`) | supported; RS Theorem 5 is not verifiable (below) |
| 0.33 | Green–Tao, Annals 167 (fetched to a scratch manifest), lines 2803–2810 (Lemma A.1, p.541); also arXiv v6, `greentao2008` lines 2606–2612 | supported, page confirmed |
| 1.7 | Bombieri, Astérisque 18, lines 2615–2619 (Théorème 20; PDF p.78 = printed p.77), 2732 (`A=19`) | supported; Jutila is not verifiable |
| 1.8 | Mestre lines 103–118 (hypotheses (i)–(iv), pp.210–211), 146 (Remark 1.1.3, p.212), 202–214 (Lemmas 1.2.1–1.2.2, p.214); Chenevier–Taïbi lines 30 (§2.3, p.275), 667 ((2.3.5), p.276) | supported |
| 1.9 | `kedlayaant` lines 2133 (Conj. 7.8, p.45), 2148–2149 ((7.3.1), p.46), 2827–2843 (Conj. 10.4, (10.3.1), Remark 10.5, p.61) | supported |
| 2.2a | Serre and Neukirch are not open texts. `cogdellartin` lines 649–699 (pp.14–15): additivity, inflation, inductivity `f(Ind)=D^(χ(1))N(f)`, conductor–discriminant | properties supported; values in row 19 |
| 2.3a | Neukirch is not an open text | mathematics checked (row 20) |
| 2.8 | DIT, Annals 184 (fetched to a scratch manifest), lines 901–933 (PDF p.22 = p.970: `ζ_A`, (7.1)–(7.3), `L=Σχ(A)ζ_A`) | supported |
| 2.9 | `zaman2017thesis` lines 382–384 ((1.15), p.6: unramified, `N p<x`), 570–575 (Thm 1.3.1, pp.11–12: `≫D_L^(−19)(|C|/|G|)Li(x)` for `x≥D_L^35`, `D_L` sufficiently large), 1059–1063 (absolute effective constants, p.26) | supported in the general form stated |
| 2.10 | Gross–Zagier lines 1712–1722 (Ch. IV intro after (0.3), p.268) | supported |
| 2.11 | Mathlib `completedLFunction_one_sub` (above); LFunctions Layer 5 on main (README:929) | supported |
| 2.16 | Gross–Zagier lines 2248–2260 (§4, proof of (4.1), p.282), 2548–2550 (after (5.4), p.290) | supported (the functional equation is used there; the root number is computed in row 27) |
| 3.5 | `2007.14567v3` lines 1381–1386 (§3.6 and (3.4), p.26) | supported |
| 3.34 | Hildebrand–Tenenbaum lines 147–151 (p.414: fixed-`u` Dickman limit, delay equation, initial condition) | supported |

**Adversarial table (values computed in scratch scripts).**

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| 1 | §0.3 `theta_lt_of_schoenfeld` | `x=2, 10, 100, 1000, 10⁵` | `θ=0.6931, 5.3471, 83.7284, 956.2453, 99685.39` against `2.0002, 10.0008, 100.0081, 1000.081, 100008.1` | holds |
| 2 | §0.5 | `x=59, 1000` | `16.2438<17<19.7924`; `155.2433<168<176.2001` | holds |
| 3 | §0.25 (sample) | `x=10⁸`; `x=10⁶` | `exp(0.27+5/log 10⁸)=1.7185<2`; at `10⁶`, `∏(1+1/p)=14.959≤25.99≤27.631=2log x` | holds |
| 4 | §0.11d identity and bounds | `x=4`; `x=1, 1.99, 2, 7.5, 100.3` | `log24=3.178054` on all three sides; bounds `−0.4276≤0≤0`, `−0.3923≤0≤0.7235`, `−0.3879≤0.6931≤0.7329`, `7.1767≤8.5252≤9.6192`, `360.17≤363.74≤365.20` | holds |
| 5 | §0.26a | `x=10⁵` | `Σ=3.020734` against `loglog x+γ=3.020686`; difference times `log x` is `0.0006` | holds |
| 6 | §0.14 (sample) | `s=0, 1, 2, −1` | `ξ(0)=ξ(1)=1/2`; `ξ(2)=ξ(−1)=π/6=0.523599`; `s(s−1)Λ₀=s(s−1)Λ−1` | holds |
| 7 | §0.33 (sample) | `s=1` | `G(1)=γ=0.5772` (`tendsto_riemannZeta_sub_one_div`); `R(1)=0`, against totalized `1/riemannZeta 1=−1.0236` | holds |
| 8 | §0.1 supplier comparison (new text) | `N=3, 4` | `Q_an(χ,0)=N(a+3)∈{3N,4N}`; `log(4N)≤3log N` iff `N≥2` | holds |
| 9 | §0.34c constant | `C=12, 15` | `(1+1/C)(2/3+1/(2C))=0.7674>3/4` at 12 and `0.7467<3/4` at 15 | holds for `C≥C₀` |
| 10 | §0.9 | `χ₋₄`, `χ₋₃` | `L(1)log q=1.0888, 0.6642` | holds for `c≤0.664` |
| 11 | §0.6 `landau_page_bounded_height` | `T=2`; `T≥2` | only `q=1` (ζ, first zero 14.1347>2); `T(T+2)≤T³` | holds |
| 12 | §1.2 `davenport_moebius` | `α=0`, `y=10⁵` | `M(10⁵)=−48` against `y(log y)^(−2)=754.4` | consistent |
| 13 | §1.5 | `N=2`, `a=(1,1)`, `T=1, 10, 100` | error `3.687, 3.485, 1.145` against `6π·3=56.55` | holds |
| 14 | §1.7 (sample) | `σ=4/5`; `σ=1−1/log QT` | Montgomery gives `QT^(1/2)≤QT^(3/5)`; right side `≤C_ε e^(5+ε)` | holds |
| 15 | §1.8 (sample) | ζ data | `F(0)log(AB)=−F(0)log π`; Gaussian `Φ(1/2)=√π=1.7725` | holds |
| 16 | §1.8a `zeta_weil_archimedean_critical_line` (new) | `F=e^(−x²)` | left side `−1.380419`, right side `F(0)log π−W=−1.380440`; with `Re ψ(s)` in place of `Re ψ(s/2)`: `−0.268352`; `Re ψ(1/4)=−4.227454`, `ψ(1/2)=−1.963510` | holds; normalization pinned |
| 17 | §1.8a `zeta_explicit_formula_laplace` (new) | `F=φe^(x/2)`; `φ_s` of R01 | `Φ(z)=Φ_F(−z)`; `n^(−1/2)F(−log n)=n^(−1)φ(−log n)`; for `φ_s`, `Φ(z)=f(0)/(s+z)−F(s+z)` and the `n⁻¹`-series is `0` | holds (R01 is ownership, not truth) |
| 18 | §1.9 (sample) | `χ₀` mod 2 | zero `2πi/log2` has `Re s=0`, outside `DirichletGRH` | holds |
| 19 | §2.2a (sample) | `ℚ(i)/ℚ`; `χ₈` over `ℚ₂` | `a₂=1+1=2` (conductor 4); `a=3` (conductor 8) | holds |
| 20 | §2.3a (sample) | `K=ℚ`, `ω=1`; norm twists | residues `−1` at 0 (`Γ(s/2)∼2/s`, `ζ(0)=−1/2`) and `+1` at 1; `W(|·|^(it))=|D_K|^(−it)` from `Λ_H(1,1−z)=Λ_H(1,z)` | holds |
| 21 | §2.8 (sample) | `ℚ(√−5)` | `x²+5y²=2` unsolvable, so `a_[1](2)=0` and `a_[𝔭₂](2)=1`; `a_A(1)=1` only for the principal class | holds |
| 22 | §2.9 (sample) | `L=ℚ(i)`, `K=ℚ`; `L=K=k`; `Li` | `|C|/|G|=1/2`, `D_L=4`, `x≥4^35=1.18·10²¹`; `|C|/|G|=1`; at `x=2^35`, `∫₂^x dt/log²t≥5.8·10⁷>2/log2=2.885` | holds |
| 23 | §2.9a `ZamanDigammaInput` | 11 triples, `α=5.8` | `Q=1.306632<1.308333`, …, `1.749816<1.75` (margin 0.000184), …, `1.358775<1.3625` (0.003725), …, `2.704779<2.708333`; `0.6881037<0.6882` | all 12 true |
| 24 | Zaman digamma Checks | `(2,0)`, `(1,0)`, `(2,2)`, `(1,2)`, `(1,0)` | `δ=−0.5772157, −1.9635100, 0.0946503` (series `0.0946503`); `G₁(1,2)=−1.3860126`; `G₂(1,2)=−1.1691891`; `Q(1,0)=2.25`, or `1.5297133` without the `0` | holds |
| 25 | §2.10 (sample) | `D=−20=(−4)(5)`, `𝔭₃` | `ε₅(3)=−1=ε₋₄(3)`; `𝔭₃` nonprincipal, so `χ=−1` | holds |
| 26 | §2.11 (sample) | `χ₋₄` | Gauss sum `2i`; `rootNumber=2i/(i·2)=1`; `N^((1−s)/2)N^(s−1/2)=N^(s/2)` | holds |
| 27 | §2.16 (sample) | `D=−4, −3` | `Λ_std(0)=Λ_std(1)=1`; `=1/√3` | holds |
| 28 | §2.22 | `ℚ(i)` | `ℓ₀+ℓ₁=0.7832+0.2456=1.0288=γ+log(π/2)` | holds |
| 29 | §3.5 (sample) | `x=4, 10` | `N₁(4)={2,3}`; `N₂(10)={35}`, `25≤35≤100`; `N₃(10)=∅` | holds |
| 30 | §3.34 (sample) | `x=10⁶`, `u=2` | `Ψ(10⁶,10³)/10⁶=0.344299` against `ρ(2)=0.306853` (gap `0.037`, consistent with `O(1/log x)`) | consistent |
| 31 | §3.13 `landau_ramanujan` | `X=10⁶` | count `216341` against `C_L X/√log X=205606.6`, `C_L=0.7642236` | consistent (ratio 1.052) |
| 32 | §3.24a | `s=2` | `ζ(2)⁴/ζ(4)=6.764520`; `Σ_(n≤2·10⁵)τ²/n²=6.762254` | holds |
| 33 | §3.23a coprime-error Checks | as listed in the README | `0.9915286` (wrong `0.5322543`); `0.9267283` (no signs `3.2014202`); `1.8370972`; `0.1537822` (wrong `−0.0315315`); `0.1541893`; `−0.0118280` | all match |
| 34 | §3.2 | `N=24, 8` | `3>0.94·log24=2.987`; `2>1.955` | holds |
| 35 | §2.15 `dedekindZeta_residue_le` | `ℚ(√5)` | `κ=0.4304≤e log5/2=2.1874` | holds |
| 36 | §2.3a `heckeContinuation` shift clause | `ω|·|^u` | `L_v(s,ω_v|·|^u)=L_v(s+u,ω_v)`, so `Λ_H(ω|·|^u,s)=A^(−u/2)Λ_H(ω,s+u)` | holds |
| 37 | R02 target (references) | the [116] and [117] paths | none of the cited `Mathlib/…` files exists at the pin; two same-named items (`ValueDistribution/LogCounting/`, `Cartan`) do; IEANTN node status "stub" | locator defect (R02) |

**Cached open copies read (labels used above).**
- Bennett–Siksek: Annals 191 (2020).
- Green–Tao: Annals 167 (2008).
- DIT: Annals 184 (2016).
- Gross–Zagier: Invent. Math. 84.
- Mestre: Compositio 58.
- Chenevier–Taïbi: Publ. IHÉS.
- Bombieri: Astérisque 18.
- Bary-Soroker–Koukoulopoulos–Kozma: arXiv 2007.14567v3.
- Hildebrand–Tenenbaum: JTNB 5.
- `kedlayaant`, `zaman2017thesis`, `cogdellartin`.

The Green–Tao and DIT Annals copies were fetched for this review into a scratch manifest only.

## Not verifiable

- **Jutila**, *On Linnik's constant*, Math. Scand. 41, Theorem 1 (1.8), p.46 (§1.7). The cached copy is an image-only scan, OCR is not installed and PDF rendering is unavailable. The two-range combination was checked arithmetically (row 14).
- **Serre**, *Local Fields*, Ch. VI §§1–3 and XV §2; **Neukirch**, *Algebraic Number Theory*, Ch. VII §§6–8 and §11 (§§2.2a, 2.3a). Paywalled books. Cogdell pp.14–15 was read for §2.2a's properties, and rows 19–20 were computed.
- **Rosser–Schoenfeld**, Illinois J. Math. 6 (1962), Theorems 5 and 8 (§0.25). No open copy. The implication used is elementary (row 3).
- **Koukoulopoulos**, Iwaniec–Kowalski, Montgomery–Vaughan and Titchmarsh: paywalled books.
- **Friedlander–Iwaniec 2018**: settled as uncertified.
- **Kadiri, *Une région explicite sans zéros pour la fonction ζ de Riemann*** (Théorème 3.1), the original of the new §1.8a Laplace form. The README does not cite it directly. Its sign of the `Λ(n)/n` term was not read; the README's sign was rederived from §1.8a (row 17).

## Source issues

- none
