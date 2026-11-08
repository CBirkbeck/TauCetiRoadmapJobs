# Review of ArithmeticDirichletSeriesPartII (pull request #1415 at aa2af10)

**Verdict:** needs changes

:robot: Independent AI review of the full roadmap folder at `aa2af100366540a71b098d40feb7b4305189c8e2`. There are six findings, all P3, none blocking. The push gate, the dependency check and the Lean elaboration pass. Every new statement (§0.1a, §2.2a, §5.1) is mathematically correct as written. The findings concern sources, citations of existing owners and locators. "Needs changes" means a further round before this folder is ready for a human's final approval. It is not a rejection.

## R01 (P3) — §2.2a rests on an unrecorded, paywalled chapter; its readable source is not cited

**Location.** `TauCetiRoadmap/ArithmeticDirichletSeriesPartII/README.md:930`: “*Source.* Korevaar (2004), Chapter III, for the Wiener–Ikehara theorem by Wiener's method.” References entry at :1408.

**Claim.** The only locator for `wienerIkehara_smoothed` and `wienerIkehara_interval` is a whole book chapter, with no theorem and no page. `sources.toml` has no record of the book. The README says the majorant interval form is its own, but it does not say the same of the continuous-ψ extension (ψ(0) ≠ 0 allowed, no separate summability hypothesis).

**Witness.** `sources.toml` lists only `delange1954`, `wood2019`, `gmr2019` and `osele-laplace`. The sources service rejects DOI 10.1007/978-3-662-10225-1 as paywalled. A readable statement does exist: `wiener_ikehara_smooth` (blueprint label “WienerIkeharaSmooth”) at `PrimeNumberTheoremAnd/Wiener.lean` line 1877, revision `2667e414`, Apache-2.0. It is stated for complex `f` with a Chebyshev bound and smooth Ψ supported in `(0, ∞)`. Tau Ceti's `SharpCutoff.lean:51` names that file as its provenance.

**Repair.**
- Cite `WienerIkeharaSmooth` (Wiener.lean:1877) and `WienerIkeharaInterval` (:2147, which assumes `f ≥ 0` and `0 < a ≤ b`) at that revision as the sources of §2.2a, and record them in `sources.toml`.
- Keep Korevaar only with a theorem number and page, recorded as `uncertified`.
- Extend the sentence “not taken from the source” to cover these points: continuous ψ, `ψ(0) ≠ 0`, the summability derived from the Chebyshev bound, and `a = 0`.

Each §2.2a hypothesis is then either in a cited declaration (complex `f`, `cheby`, `hG`, `hG'`) or marked as derived here.

## R02 (P3) — §0.1a has no source locator

**Location.** `README.md:383–441`, “### 0.1a The transform of a derivative”. The subsection has a proof sketch, *Needs* and Checks, but no *Source.* line. `Suggested.lean:62` and `:72` carry none either.

**Claim.** `hasLaplace_deriv_of_primitive` and `hasLaplace_deriv` are targets without a locator. The only Laplace source the roadmap cites does not contain the rule.

**Witness.** Osele's file at the cited commit has no derivative rule. Its theorems at osele-laplace lines 86–285 cover congruence, zero, negation, addition, subtraction, scaling and norm bounds only.

**Repair.**
- Add a *Source.* line: a textbook theorem for the derivative rule, with its number and page, recorded in `sources.toml`.
- Textbook statements usually assume exponential order or `Re s` beyond the abscissa. If so, say in one clause that the integrability-only form with no condition on `Re s` is derived here, by the boundary-term argument of the proof sketch.

Its Check at `s = 0` for `f = e^(−t)` (`−1 = 0·1 − 1`) then documents what goes beyond the source.

## R03 (P3) — Tau Ceti's smoothed Wiener–Ikehara theorem is restated in a proof step but never cited

**Location.** `README.md:101–103` lists the Tau Ceti Wiener–Ikehara theorems as `wienerIkehara`, `_zero`, `_of_eventually_nonneg`, `_nat` and `_rpow`. :107–108 says: “Layer 9 does not state the smoothed form … those are §2.2a, owned here.” Step 4 at :898–902 builds `W(v) = e^(2πv) ψ(e^(2πv))` as a Schwartz function.

**Claim.** The smoothed form already exists at the pin for nonnegative coefficients. §2.2a strictly generalises it, but neither the scope nor the supplier contracts cite it, and step 4 reruns its proof without attribution.

**Witness.** `TauCeti.LSeries.tendsto_inv_mul_tsum_mul_div_atTop` (`TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean:125`) gives `x⁻¹ ∑ a n Ψ(n/x) → A ∫_(0,∞) Ψ`. It assumes `0 ≤ a` and smooth Ψ with `tsupport Ψ ⊆ Ioi 0`, and it proves this through the same `expWeight`, `toSchwartzMap` and `fourier_fourierInv_eq` steps.

**Repair.**
- Add the theorem, with its file and line, to “Not owned here” and to *From Tau Ceti*.
- Say in one clause that `wienerIkehara_smoothed` differs by allowing complex coefficients under a Chebyshev bound and continuous ψ not vanishing near `0`.
- In step 4, cite it as the nonnegative case whose argument is rerun, as step 3 already does for `tendsto_tsum_term_mul_fourier_schwartz_atTop`.

## R04 (P3) — §5.1 claims ownership of the d_k partial-sum asymptotic, which an earlier roadmap states

**Location.** `README.md:1276–1277`: “this section owns its Dirichlet series and the asymptotic of its partial sums”. :1305 adds: “At `k = 1` this is the divisor sum … → 1”.

**Claim.** The leading-term asymptotic of `∑_{n≤X} d_(k+1)(n)` is an instance of a target of AnalyticNumberTheoryPartI, which is earlier in the merge order (line 49 against this roadmap's 91). The README must cite it rather than claim it. This also contradicts the README's own framing of these counts “as checks” (:17–18, :77–78).

**Witness.** AnalyticNumberTheoryPartI is read at the head of its open pull request.
- §3.12a (`TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:2345`) is the Selberg–Delange expansion. Take `f = τ_(k+1)` and `α = k + 1`; the prime sum is `(k+1)θ(x)`. With `q_0 = 1`, the main term is `x(log x)^k/k!`.
- §3.22 (`:2548`) states `∑_{n≤x} τ(n) = x log x + (2γ−1)x + O(√x)`.

**Repair.**
- In Scope and §5.1, cite AnalyticNumberTheoryPartI §3.12a, with `α = k + 1`, and §3.22 at `k = 1` for the asymptotic, with error terms.
- Reword the ownership sentence. This section owns the Dirichlet series of `d_k` for `k ∈ ℕ` and the derivation of the leading constant from §4.2 as a normalisation check.
- `zetaPow_counting` may stay as that check. At `k = 1`, `8/(4 log 4) ≈ 1.44` at `X = 4` is consistent with §3.22's secondary term `(2γ−1)/log X`.

## R05 (P3) — Stale pin labels and a supplier path that does not exist at the pin

**Location.** `README.md:156` “From Mathlib (pinned 6b7abb3c)”; :221 “From Tau Ceti (pinned a91d3aaf)”; :249 “`TauCeti/Analysis/Asymptotics/SumWindow.lean`”.

**Claim.** `lake-manifest.json` at this head pins Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. At the Tau Ceti pin, the file cited for `TauCeti.exists_sum_Icc_le_mul_of_isBigO` does not exist.

**Witness.** At `2fd255d9`, `TauCeti/Analysis/Asymptotics/` contains `Lemmas.lean`, `MvPolynomial.lean` and `Sum/`. The declaration is at `TauCeti/Analysis/Asymptotics/Sum/Window.lean:111`. `SumWindow.lean` exists only at the old `a91d3aaf`.

**Repair.** Update both pin labels to the manifest revisions and the path to `Sum/Window.lean`. Every other library file and declaration the README names was re-checked at the new pins (see *Verified sound*).

## R06 (P3) — Wood §7: one wrong page, and group notation that contradicts the README's own Check

**Location.**
- `README.md:1133–1136`: “Wood (2019), §7, p. 417: for the series `F_r` … (wood2019 line 1652)”.
- “meet `C₂^r × {1}` trivially” at :30, :1135 and :1252; `C₂² × {1}` at :1335.
- The Check at :1149–1151 uses `{0} × C₂`, `C₂ × {0}` and `(0, 1)`.

**Claim.** (a) wood2019 line 1652 is on printed p. 416, not p. 417. (b) The headline condition writes the trivial factor multiplicatively (`{1}`), while the Check computes additively. Read additively, `C₂ × {1}` is the coset `{(0,1), (1,1)}`. The ℚ(i) character's inertia `{0} × C₂` meets that coset in `(0, 1)`, so the Check's conclusion “it satisfies the finite-prime inertia condition” would be false.

**Witness.** The page header at wood2019 line 1614 reads 416, and p. 417 starts at line 1682. Wood writes the condition multiplicatively, as an intersection with `C₂^k` equal to 1 (wood2019 line 1653).

**Repair.** Change “p. 417” to “p. 416” at :1133. Write the subgroup as `C₂^r × {0}` (additive, as in the Check) at :30, :1135, :1252 and :1335. Under that reading, `{0} × C₂ ∩ C₂ × {0} = {(0, 0)}`, matching the Check.

## Verified sound

### Previous findings

The previous review (at `93f5273`) was accepted with no findings, so there is nothing new to check for repair. It had confirmed four earlier findings as repaired, and they stay repaired at this head:

| Earlier finding | Passage at this head | Status |
| --- | --- | --- |
| Prefixed target headings | `README.md:319` “### 0.1 The one-sided Laplace transform”; new targets `### 0.1a` (:383) and `### 2.2a` (:836) | Repaired; gate `layer-ids=0 target-ids=0` |
| Archived supplier link | `README.md:119` “[OneParameterSemigroups](../../Completed/OneParameterSemigroups/README.md)” | Repaired; Part B at main `Completed/OneParameterSemigroups/README.md:162` |
| Dyadic control in Lean | `Suggested.lean:18–19` “the dyadic counterexample of README §5.2 is a negative control … not an acceptance theorem here” | Repaired; no such declaration |
| Sign hypothesis on `C` | `Suggested.lean:204` “No sign of `C` is assumed” | Repaired; elaborated `monotoneUnsmoothing` has no `hC` |

### Gate, dependency check, elaboration, signatures, padding

- **Gate.** The worker's gate is all zeros, ending `OK`. My re-run on this head gives the same: `… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The outside-folder diff is empty (`git diff --stat origin/main...HEAD` excluding the folder: 0 paths). The worktree is unchanged.
- **Dependency check.** The `--movable` run printed exactly `depcheck: 229 roadmaps, 2316 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. Merge order: AnalyticNumberTheoryPartI is at line 49, AnalyticNumberTheoryPartII at 50, SieveMethodsAndPrimePatterns at 56, this roadmap at 91. I read every *Needs* line. The suppliers are AnalyticNumberTheoryPartII §4.5c, the completed ArithmeticDirichletSeries (Layers 4.2, 9 and 9.2), Mathlib and Tau Ceti. Internal order is acyclic. §0.1a needs only §0.1. §2.2a needs no earlier layer. §5.1 needs §§0.2 and 4.2. No gap is declared and none is needed.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with exactly 19 warnings, all `declaration uses sorry`, and no errors.
- **Signatures.** A scratch copy with `#check @name` for all 24 declarations elaborated, and its types match the worker's `signatures.md`. Compared with the README:
  - `hasLaplace_deriv_of_primitive` and `hasLaplace_deriv` keep `NormedSpace ℂ E` and `CompleteSpace E`, and impose no condition on `Re s`.
  - `wienerIkehara_smoothed` takes `Continuous ψ` and `HasCompactSupport ψ` with no sign or summability hypothesis.
  - `wienerIkehara_interval` keeps `‖f n‖ ≤ g n`, summability of `g` on `σ > 1`, both sets of boundary data, and `0 ≤ a ≤ b`.
  - `LSeriesHasSum_zeta_pow` and `zetaPow_counting` use the Dirichlet power `ArithmeticFunction.zeta ^ k` in `ArithmeticFunction ℕ`.
  - No binder is lost, and generality matches the README.
- **Padding.** On a scratch copy, each of the 19 admissions was replaced by `first | rfl | infer_instance | simp | norm_num | simp_all`, and all 19 still fail. By reading: `hasLaplace_deriv` needs `hasLaplace_deriv_of_primitive` plus the fundamental theorem of calculus, and `LSeriesHasSum_zeta_pow` needs an induction over five Mathlib lemmas. Neither restates a definition or mirrors a Check.
- **Headlines.** The headline theorems are `delangeLaplace`, `delangeDirichlet`, `delangeDirichlet_positiveAbscissa`, `finiteChange_asymptotic`, `lowerPole_perturbation`, the Layer 0–3 milestones, the §0.1a and §2.2a statements, and the §5.1 series and counts. All are statable at the pins and stated, as the module docstring says. No stand-in or free predicate is used.

### Source sample (15 seeded targets)

Delange's printed page is the extraction page plus 211. All passages are paraphrased.

| Target | Locator checked | Result |
| --- | --- | --- |
| §0.1 | delange1954 line 24 (p. 213: `α` real, nondecreasing, ≥ 0; integral convergent on `Re s > a`, `a > 0`); osele-laplace lines 72, 121, 125 (= source lines 68, 117, 121 plus the 4-line header) | Supported |
| §0.1a | No locator; osele-laplace has no derivative rule | R02 |
| §1.1 | delange1954 line 428 (§3.3.3, p. 224), line 489 (§3.3.5, p. 226, triangle weight; limit `πA`) | Supported after division by π |
| §1.2 | delange1954 line 278 (§3.1, p. 220, `v(t) = ∫₀^l e^(−tu)γ(u)du`), line 673 (Lemma 3, p. 231), line 875 (p. 237: `p = 0`, `l < 1`) | Supported; cutoff 1 is the roadmap's own, as stated |
| §2.1 | delange1954 line 329 (§3.3, p. 221: regularised `h`), line 570 (§4.1, p. 228) | Supported; compact `L¹` form derived |
| §2.2 | delange1954 lines 489–500 (p. 226: damped identity; positivity gives the undamped integral) | Supported |
| §2.2a | Korevaar Ch. III not readable; PNT+ Wiener.lean:1877, :2147 read | R01 |
| §3.1 | delange1954 line 517 (§3.4, p. 227), line 520 (§3.4.1 window bounds) | Supported |
| §3.2 | delange1954 line 818 (Theorem III, pp. 235–236: `ω` not an integer ≤ 0, `g(a) ≠ 0`, conclusion `g(a)/Γ(ω) e^(at) t^(ω−1)`), line 871 (p. 237: `g(a) > 0` for `ω ≥ 1`) | Supported at `ω = k + 1` |
| §4.2 | wood2019 lines 1617, 1652, 1692–1695 | Supported; page slip, R06 |
| §4.3 | delange1954 line 26 (any `a > 0`) | Supported; `1/a` from the ordinary transform |
| §4.4 | delange1954 lines 42–44 (footnote 1: subtract `α(0)`); wood2019 line 1695 (trivial homomorphism set aside) | Supported |
| §4.5 | wood2019 lines 1698–1700 (non-surjective count bounded via the next smaller group) | Supported as the generic form; source misprint below |
| §5.1 | delange1954 line 818 at `ω = k + 1`; Mathlib identities listed below | Supported; ownership R04 |
| §5.2 | delange1954 lines 1046–1052 (§5.3, second remark, p. 242: local hypothesis gives only order of magnitude) | Supported; dyadic series is the roadmap's own, as stated |

The README flags no locator as unverified.

### Adversarial table (computed values)

Notation: `K_λ(v) = (λ/π)sinc(λv)²`, `w_k(t) = t∫₀¹e^(−ut)u^k/k! du`, and `S` drops index 0.

| Statement | Instances | Values computed (left / right) | Result | Change |
| --- | --- | --- | --- | --- |
| `northcott_natId` | b = 0, 2 | sublevels {0}, {0,1,2}: sizes 1, 3 | Finite, inclusive | none |
| `HasLaplace` | f = 1 at s = 2, s = 0; f = t² at s = 1 | 1/2; norm integral ∞, so false although the Bochner value is 0; 2 = 2/s³ | Convergence enforced | none |
| `hasLaplace_deriv_of_primitive` | f = t, g = 1, s = 2 | s·(1/4) − 0 = 1/2 = ∫e^(−2t) | Holds | none |
| same | f = sin, g = cos, s = 1 | 1·(1/2) − 0 = 1/2 = s/(s²+1) | Holds | none |
| same, Re s < 0 | f = e^(−2t), g = −2e^(−2t), s = −1 | (−1)·1 − 1 = −2 = ∫e^t(−2e^(−2t)) | No Re s condition needed | none |
| same, control | f = 1 on (0,∞), f(0) = 0, g = 0 | primitive hypothesis fails at t = 1 (1 ≠ 0); s·(1/s) − 0 = 1 ≠ 0 | Hypothesis needed | none |
| `hasLaplace_deriv` | f = t², f′ = 2t, s = 1 | 1·2 − 0 = 2 = 2/s² | Holds | none |
| `PoleBoundary` | 1/(s−1) with A = 2; ζ with A = 1 | numerator value 1 ≠ 2, rejected; (s−1)ζ(s) → 1, accepted | Coefficient tied to F | none |
| `squaredSinc`, `_fourier` | λ = 1, v = 0, π/2, π | K = 1/π, 4/π³, 0; (1−cos 2v)/v² over 2π = 4/π³ at π/2 | Agree | none |
| `squaredSinc_mass` | λ = 1, 2; λ = 0 | (1/π)·π = 1 for both; K₀ ≡ 0 has mass 0 | λ > 0 needed | none |
| `delangeWeight`, normalization | k = 0, 1, 2 at t = 1 | w₀ = 1−1/e; w₁ = 1−2/e ≈ 0.264; w₂ = 1−5/(2e) ≈ 0.080; products → 1 | Factorial placed correctly | none |
| `delangeWeight_shift` | k = 1, h = 1, t = 10 | ≈ (10/11)(1−12e^(−11))/(1−11e^(−10)) ≈ 0.9095 → 1 | Holds | none |
| `regularizedBoundaryL1` | k = 1, R = c/(s−a) | b(y) = c(log(1+iy) − log(iy) + iy/(1+iy) − 1), size ~ \|c log\|y\|\|, integrable; model F gives R = H = b = 0 | Holds | none |
| `delangeSmoothedLimit` | α = e^(at)t^k, A = k! | limit A/k! = 1; directly w_k(t)t^k → 1 | Agree | none |
| `wienerIkehara_smoothed` | f = 1, ψ = (1−\|y\|)₊, x = 10 | (1/10)(9 − 4.5) = 0.45 → 1/2 = ∫₀¹(1−y) | ψ(0) ≠ 0 handled | none |
| same | f = 1, tent at 1 | → 1 = ∫ψ | Holds | none |
| same | f = 0 | −A/(s−1) has no continuous extension unless A = 0; both sides 0 | Holds | none |
| `wienerIkehara_interval` | f = g = 1, a = 1, b = 2, x = 10, 10.5 | 1, 1.0476 → 1 = A(b−a) | Holds | none |
| same | f = (−1)^n, g = 1, B = 1, A = 0 | \|S_f\| ≤ 1, ratio → 0 = A(b−a) | Holds | none |
| same, control | f(2^j) = 2^j, f(2^j+1) = −2^j | Chebyshev bound ≤ 4x; S_f(2^j)/2^j = 1, S_f(2^j+1) = 0: no limit; \|f\| has poles at 1 + 2πim/log 2 | Majorant needed | none |
| same | a = b = 3 | 0 = A·0 | Holds | none |
| `monotoneUnsmoothing` | α = e^t (a = 1, k = 0); α = 0 | smoothed limits 1, 0 give ratios 1, 0 | Sign-free form holds | none |
| `delangeLaplace` | te^(at); t²e^(at) | (k, A) = (1, 1), (2, 2): limits 1/1!, 2/2! = 1 | Constants agree | none |
| `logSummatory_hasLaplace` | only c₁ = 1, s = 2; only c₂ = 1, s = 2 | 1/2 = F(2)/2; ∫_(log 2)^∞ e^(−2t) = 1/8 = (1/4)/2 | Ordinary transform | none |
| same, control | only c₁ = 1, s = 0 | series sum 1, but ∫₀^∞ 1 diverges | Re s > 0 needed | none |
| `delangeDirichlet` | c = 1; c = d₂ | ⌊X⌋/X → 1/0!; S/(X log X) → 1/1! | Holds | none |
| `delangeDirichlet_positiveAbscissa` | c_n = n, a = 2; c_n = 1/n at a = 0 | N(N+1)/(2X²) → 1/2 = A/a; ∑1/n ~ log X, so a = 0 is excluded | 1/a and a > 0 needed | none |
| `finiteChange_asymptotic` | d₂ + 7·1[n = 1] | difference 7, divided by X log X → 0 | Holds | none |
| `lowerPole_perturbation` | d₂ + (−1)^n, b = 1, l = 0 < k = 1; c = b = 1, d = 2, l = k = 0 | errors −1, 0, −1, 0, so the limit is unchanged; limits 1 against 2 | Strict l < k needed | none |
| `LSeriesHasSum_zeta_pow` | k = 0; k = 2, s = 2; k = 3 | δ-series = 1 = ζ⁰; ζ(2)² = π⁴/36 ≈ 2.706, partial sum to 4 = 1.910; d₃(4) = 6, unordered 2 | Dirichlet power correct | none |
| `zetaPow_counting` | k = 0, 1, 3 | ⌊X⌋/X → 1; 8/(4 log 4) ≈ 1.44 at X = 4, limit 1; constant 1/6 against 1/3, 1/2, 1/24 | True; ownership R04 | R04 |
| §5.2 dyadic | j = 0..3 | S(2^j) = 1, 3, 7, 15, ratios → 2; S(3·2^j) ratios 1, 7/6, 5/4 → 4/3; 1/log 2 ≈ 1.4427 | Negative control holds | none |
| Wood locator | wood2019 line 1652 | header at line 1614 reads 416; README says p. 417 | Wrong page | R06 |
| Wood notation | ℚ(i) character, r = 1 | additive reading: {0}×C₂ ∩ C₂×{1} = {(0,1)}, so the Check fails; with C₂×{0}: {(0,0)}, so the Check holds | Ambiguous | R06 |
| Supplier path | `SumWindow.lean` at 2fd255d9 | absent; declaration at `Sum/Window.lean:111` | Wrong path | R05 |

### Library declarations opened at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`)

**Mathlib (file and line):**
- `NumberTheory/LSeries/Basic.lean:74` (`term`), :217 (`LSeriesHasSum`), :310 (`LSeries_delta`)
- `Analysis/Analytic/Uniqueness.lean:224`
- `MeasureTheory/Integral/Prod.lean:481`
- `MeasureTheory/Integral/DominatedConvergence.lean:68`, :89
- `MeasureTheory/Integral/Lebesgue/Add.lean:220`
- `Analysis/Calculus/ParametricIntegral.lean:569`
- `MeasureTheory/Integral/IntegralEqImproper.lean:658`, :1205
- `Analysis/SpecialFunctions/ImproperIntegrals.lean:63`, :87
- `Analysis/SpecialFunctions/Gamma/Basic.lean:66`, :325 (Complex namespace, matching the README's line 325), :465
- `Analysis/SpecialFunctions/Trigonometric/Sinc.lean:40`, :59, :88
- `Analysis/Fourier/RiemannLebesgueLemma.lean:205`
- `Analysis/Complex/RemovableSingularity.lean:36`
- `NumberTheory/LSeries/RiemannZeta.lean:146`, :207, :242
- `Analysis/PSeriesComplex.lean:26`
- `NumberTheory/LSeries/Convolution.lean:140`, :183
- `NumberTheory/ArithmeticFunction/Misc.lean:129`, :181, :198
- `NumberTheory/ArithmeticFunction/Defs.lean:165`, :261
- `NumberTheory/LSeries/Dirichlet.lean:41`, :292
- `Analysis/Normed/Module/FiniteDimension.lean:605`
- `Analysis/SpecificLimits/Normed.lean:476`
- `MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean:1140`
- `Analysis/Distribution/SchwartzSpace/Basic.lean:546`
- `Analysis/Fourier/Notation.lean:215`: `fourier_fourierInv_eq` is the `FourierInvPair` field, exported to `FourierTransform`; its Schwartz instance is at `SchwartzSpace/Fourier.lean:138`
- `Analysis/Calculus/BumpFunction/Convolution.lean:71`
- `Order/Northcott.lean:36`

There is no identity-on-ℕ `Northcott` instance, no `ζ^k` L-series lemma and no function Laplace transform at the pin.

**Tau Ceti:**
- `Order/Northcott/Basic.lean:74`, :158, :175, :184, :197
- `Analysis/Contour/MeromorphicLaurent.lean:223`
- `Analysis/Contour/WorkedExamples/HalfDisc/SineIntegral.lean:339`, :357
- `WienerIkehara/Asymptotic.lean:161`: complex `a`, no sign hypothesis, as the README says
- `Approximation.lean:271`, :282, :308, :394: `0 ≤ a` is used only for the Chebyshev bound and for summability, as the README says
- `Chebyshev.lean:162`
- `SharpCutoff.lean:125` (R03), :300, :333
- `Variants.lean:60`, :120, :135
- `Analysis/Asymptotics/Sum/Window.lean:111` (R05)
- `Algebra/Order/BigOperators/Sum/ByParts.lean:56`
- `Analysis/Distribution/SchwartzSpace/Cutoff.lean:193`
- Measure-valued Laplace transforms (`CompletelyMonotone/Laplace/Representation.lean:75`, `Kernel.lean:81`) are a different carrier, as Scope says.

### Cross-roadmap citations and ownership

**Citations resolved:**
- Completed ArithmeticDirichletSeries on main: Layer 4.2 (`README.md:227`), Layer 9 (:337), 9.2 (:353). 9.2 lists natural cutoffs, finite changes, positive abscissa and normed algebras. It has no smoothed form and no complex interval form, so §2.2a extends the parent rather than replanning it.
- Completed OneParameterSemigroups Part B (:162).
- AnalyticNumberTheoryPartII §4.5c at its open head (`README.md:271`).
- SieveMethodsAndPrimePatterns §1.1 at its open head: §1.1 spans :1077–1162, and the τ_k majorant `∑ τ_k(n) ≤ Z(1+log Z)^(k−1)` is at :1141, as the README says.
- ProbabilisticAndMetricNumberTheoryPartII cites §§0.1, 1.1, 3.1 and 3.2 (README :59, :202), and all still resolve.

**Ownership searches.** I searched by object across main, the sibling open heads and the board packages for the derivative rule, the smoothed and interval Wiener–Ikehara forms, `HasLaplace`, the d_k series and d_k asymptotics. One `roadmaps grep` run aborted on an unresolvable ref, so I repeated that search with a direct grep over the same trees. No second owner of `HasLaplace`, the derivative rule or §2.2a exists. The d_k findings:
- AnalyticNumberTheoryPartI §§3.12a and 3.22 cover the asymptotic (R04).
- The board design AnalyticNumberTheoryPartIII (`packages/AnalyticNumberTheoryPartIII/design/README.md:59–62`) claims the `d_k` series as the `z = k` case of its 11.2 and says this roadmap consumes it. That design is not in the merge order. If this roadmap took the series from it, the dependency would point upward, so the k ∈ ℕ series stays here and the design should cite §5.1. This is the design's repair, not a finding here.

## Not verifiable

- Korevaar, *Tauberian Theory: A Century of Developments*, Chapter III, cited for §2.2a. The sources service reports DOI 10.1007/978-3-662-10225-1 as a paywalled publisher, and I found no open copy. I did not guess its contents. R01 asks for a readable source instead.
- This is a statement and source review. The 19 admitted theorems are not proved. The table records computed instances, not formal proofs.

## Source issues

- **Misprint** in wood2019 at §7, printed p. 417 (wood2019 line 1699): the source says the discarded homomorphisms fail to surject onto C₂^k; it should be C₂^(k+1), the target of the homomorphisms counted by F_k; affects the proof.
