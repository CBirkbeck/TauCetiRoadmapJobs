<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/124#issuecomment-6348136959 -->
Red team round 2 pass b (claude) of a42417a

Verdict: needs_changes

1. **F01** (P3) Title lower-cases the proper names “Dirichlet” and “Tauberian”

   **Location:** `packages/ArithmeticDirichletSeriesPartII/README.md:1`: “# Roadmap: arithmetic dirichlet series and tauberian methods, part II — poles of higher order”.

   **Claim:** The round-1 repair rewrote the title in lower case and in doing so lower-cased two proper names. Lower-case titles keep proper names capitalised; the title at the previous head wrote “Dirichlet” and “Tauberian”, and every other occurrence in the README (the parent link at line 4, the conventions table at line 112) still does.

   **Witness:** On `main`, `TauCetiRoadmap/LocalGaloisGroups/README.md:1` and `TauCetiRoadmap/PolynomialGaloisGroups/README.md:1` are lower-case titles that write “Galois”; the README's own line 112 writes “The Tauberian and counting theorems”.

   **Exact repair text:** `# Roadmap: arithmetic Dirichlet series and Tauberian methods, part II — poles of higher order`

2. **F02** (P3) The Osele locator “lines 121–123” covers one of the three declarations it names

   **Location:** `packages/ArithmeticDirichletSeriesPartII/README.md:247–249`: “declarations `LaplaceConvergent`, `laplace`, and `HasLaplace` (2026, `Mathlib/Analysis/LaplaceTransform.lean`, lines 121–123, commit …)”; the same locator at `README.md:1109–1112`; `Suggested.lean:40`: “declarations 121–123”.

   **Claim:** In the cited file at that commit, lines 121–123 are the definition of `HasLaplace` only. `LaplaceConvergent` is defined at lines 68–70 and `laplace` at lines 117–118, so the locator points two of the three named declarations at text that does not contain them; the Lean docstring's “declarations 121–123” is the same locator garbled into a declaration count.

   **Witness:** osele-laplace line 72 (`def LaplaceConvergent`, file line 68), line 121 (`def laplace`, file line 117), line 125 (`def HasLaplace`, file line 121); the cached legal copy's four header lines give file line = cached line − 4. `sources.toml:58` records the locator `LaplaceTransform.lean:121–123` for the manifest entry, which is correct for `HasLaplace` alone.

   **Exact repair text:** README lines 247–249: “The one-sided Laplace API follows Dennj Osele, “The Laplace transform”, declarations `LaplaceConvergent` (lines 68–70), `laplace` (lines 117–118) and `HasLaplace` (lines 121–123) of `Mathlib/Analysis/LaplaceTransform.lean` at commit `90482cd37e85e423459de2ed103cea2f4d98cb20`.” README lines 1111–1112: “declarations `LaplaceConvergent` (lines 68–70), `laplace` (lines 117–118) and `HasLaplace` (lines 121–123) at commit `90482cd37e85e423459de2ed103cea2f4d98cb20`, for the predicate's shape.” Suggested.lean line 40: “ordinary transform predicate `HasLaplace` in Osele, “The Laplace transform”, lines 121–123. -/”.

3. **F03** (P3) Five named theorem targets are provable now from the pinned libraries

   **Location:** `packages/ArithmeticDirichletSeriesPartII/Suggested.lean:446–449` (`delangeLaplace_test_model`), `:631–632` (`dyadic_test_residue`), `:466–469` (`logSummatory_test_initial`), `:480–483` (`logSummatory_test_endpoint`), `:107–108` (`HasLaplace_test_nonintegrable`); `README.md:38–39`: “Checks that require new analytic results are named theorem targets in `Suggested.lean`”.

   **Claim:** The README states that the named theorem targets are the Checks that need new analytic results. These five need none: each closes from the pinned Mathlib and Tau Ceti in a probe copy (one of them by a single term). `delangeLaplace_test_model` in addition mentions no object of the roadmap: its statement is the cancellation `x / x → 1` for a positive function, which is not a target of this roadmap and does not test the model's `PoleBoundary` or Laplace data as the README Check at line 793 does. Left as `sorry`, they are admitted statements the library will never need to prove.

   **Witness:** A probe copy of the file under the pinned `import Mathlib` and `import TauCeti.Order.Northcott.Basic` elaborates the five proofs below without error; the blanket one-tactic probe (`simp`/`norm_num` with the file's definitions unfolded) closed none of the 61 admitted declarations, so the other 56 are genuine targets.

   **Exact repair text:** replace each `sorry` by the verified proof (or, for `delangeLaplace_test_model`, delete the declaration; the README Check at line 793 keeps the statement):

   ```lean
   theorem delangeLaplace_test_model (k : ℕ) (a : ℝ) :
       Tendsto (fun t : ℝ ↦ (Real.exp (a * t) * t ^ k) / (Real.exp (a * t) * t ^ k))
         atTop (𝓝 (1 : ℝ)) :=
     tendsto_const_nhds.congr' (by
       filter_upwards [eventually_gt_atTop (0 : ℝ)] with t ht using (div_self (by positivity)).symm)

   theorem dyadic_test_residue : (4 / 3 : ℝ) < 1 / Real.log 2 ∧ 1 / Real.log 2 < 2 := by
     have h1 := Real.log_two_gt_d9
     have h2 := Real.log_two_lt_d9
     constructor
     · rw [lt_one_div (by norm_num) (by linarith)]; linarith
     · rw [one_div_lt (by linarith) (by norm_num)]; linarith

   theorem logSummatory_test_initial (c : ℕ → ℝ) :
       TauCeti.summatory (fun n : ℕ ↦ n) (fun n ↦ if n = 0 then 0 else c n)
         (Real.exp 0) = c 1 := by
     rw [Real.exp_zero, TauCeti.summatory_apply]
     have : TauCeti.normLE (fun n : ℕ ↦ n) (1 : ℝ) = {0, 1} := by
       ext n; simp [TauCeti.mem_normLE]; omega
     rw [this]; simp

   theorem logSummatory_test_endpoint (c : ℕ → ℝ) :
       TauCeti.summatory (fun n : ℕ ↦ n) (fun n ↦ if n = 0 then 0 else c n)
         (Real.exp (Real.log 2)) = c 1 + c 2 := by
     rw [Real.exp_log (by norm_num), TauCeti.summatory_apply]
     have : TauCeti.normLE (fun n : ℕ ↦ n) (2 : ℝ) = {0, 1, 2} := by
       ext n; simp [TauCeti.mem_normLE]; omega
     rw [this]; simp [Finset.sum_insert]

   theorem HasLaplace_test_nonintegrable : ¬ HasLaplace (fun _ : ℝ ↦ (1 : ℂ)) 0 0 := fun h => by
     have := h.1
     simp [integrable_const_iff] at this
     exact absurd this.measure_univ_lt_top (by simp [Real.volume_Ioi])
   ```

   And README line 38–40: “The definition Checks are proved examples or proved theorems when their proofs use the pinned APIs directly; the Checks that require new analytic results are admitted theorem targets in `Suggested.lean`.”

4. **F04** (P3) The equal-order control's coefficient bound quantifies over an unused variable

   **Location:** `packages/ArithmeticDirichletSeriesPartII/Suggested.lean:561–562`: “theorem lowerPole_test_equal_order : (∀ n : ℕ, |(2 : ℝ) - 1| ≤ 1) ∧”; `README.md:971–973`.

   **Claim:** The README Check says the sequences `c = b = 1`, `d = 2` on positive integers satisfy the coefficient bound `|d n − c n| ≤ b n` of HP.4.5. The Lean conjunct states `|2 − 1| ≤ 1` under a binder `n` that the proposition never uses: it is a numeral inequality, not the bound for the zero-suppressed sequences the other two conjuncts sum (`if n = 0 then 0 else 1`, `if n = 0 then 0 else 2`), and it says nothing about `n = 0`. A statement quantified over data it does not mention is vacuous as a test.

   **Witness:** Suggested.lean line 562 (binder `n` unused; the elaborator's unused-variable linter flags it in a probe copy); lines 563–566 sum `fun n ↦ if n = 0 then (0 : ℝ) else 1` and `… else 2`, which the first conjunct never mentions.

   **Exact repair text:** replace lines 561–562 by (the conjunct closes with `intro n; split_ifs <;> norm_num`; the full statement elaborates in a probe copy):

   ```lean
   theorem lowerPole_test_equal_order :
       (∀ n : ℕ, |(if n = 0 then (0 : ℝ) else 2) - (if n = 0 then (0 : ℝ) else 1)| ≤
         (if n = 0 then (0 : ℝ) else 1)) ∧
   ```

## Verified sound

**Scope read.** All 1112 README lines; all 634 Suggested.lean lines; `sources.toml` (4 entries), `metadata.toml` (`topic = "math.NT"`), `review.json`, the repair report `reports/FIX-RT-ArithmeticDirichletSeriesPartII~1.md`, the pull request body and all four comments (the round-2 brief, pass 1a, pass 1b, the fix notice). Declarations read: 82 (1 instance, 3 definitions, 1 structure, 5 proved examples, 11 proved theorems, 61 admitted theorems). Bold README targets read: 16 (HP.0.1–HP.5.2). API statements read: 28. Check bullets read: 45. The pull request changes only the six files of `packages/ArithmeticDirichletSeriesPartII/`.

**Round-1 repairs verified on a42417a (not re-raised).** Pass 1a: F01 five proved examples, at most two per definition (Lean lines 49, 95, 204, 208, 256), every other Check a named theorem (but see F03); F02 import `TauCeti.Order.Northcott.Basic` and pins `6b7abb3c`/`a91d3aaf`, which match the content repository's `lake-manifest.json`; F03 Wood's rank convention `C₂^(r+1)`, `C₂^r × {1}`, pole order `2^r`, `r ≥ 1` at README lines 25–26, 878–880, 979–983, 1030, checked against wood2019 lines 1586–1590 (`G′ = C₂^(k+1)`, `k ≥ 1`, trivial intersection with `C₂^k × {1}`) and 1692–1695 (pole of order `2^k`, partial sums `~ c_k X (log X)^(2^k − 1)`); F04 Lean mirrors present for every Check label; F05 `sources.toml` with four certified entries whose hashes are the cached legal copies; F06 no pull-request numbers or process narrative, parent links to `Completed/`, the name catalogue deleted; F07 the zero-function Check with `[SMulZeroClass ℂ E]` and every measure (Lean 49–51, proved); F08 the arbitrary-function Stieltjes comparison deleted (README 242–245). Pass 1b: F01 the parent heading now links the completed specification (README 188); F03 “current” deleted (README 85); F02 marked `not actionable` with the reason that `ArithmeticStatisticsPartV` precedes this roadmap in the merge order (board `main` lines 99 and 189) and so cannot be its consumer: the reason holds, the `ST.3` attribution is gone (README 94–97, 1082–1085), not re-raised. Pass 2a is not posted at the time of this pass.

**Elaboration.** The submitted file, copied to a probe in the content checkout and run with `lake env lean` at the pins, exits 0 with exactly 61 `declaration uses 'sorry'` warnings and no other diagnostic; the Tau Ceti import resolves (the module's object file is present in the review setup). Only `HasLaplace` lives in a `variable` section; its three section instances are all mentioned by its type, every other declaration carries its binders explicitly, and the consumers of `HasLaplace` elaborate with the same instances, so no hypothesis is lost.

**One-tactic probe.** Every `sorry` replaced by `first | (simp [HasLaplace, PoleBoundary, squaredSinc, delangeWeight, TauCeti.summatory, TauCeti.normLE]; done) | (norm_num [...]; done) | sorry`: all 61 warnings remain, none closes. Targeted attempts: the five proofs of F03 close; `PoleBoundary_test_*`, the kernel and weight milestones, the Gamma models, the boundary, smoothing, unsmoothing, Delange, counting, perturbation and dyadic statements were not attempted beyond the blanket probe and remain genuine targets.

**Locators verified against the cached legal copies (20).** Delange (journal page = marker + 211): p. 213 standing hypotheses (lines 24–28: real, nondecreasing, nonnegative, ordinary Laplace integral convergent for `Re s > a > 0`) and footnote 1 (lines 42–44, subtract `α(0)`); §3.1–3.2 pp. 220–221 (lines 278–296: `v(t)`, positive and decreasing, `v(t+h)/v(t) → 1`); §3.3–3.3.1 pp. 221–222 (lines 329–345: `h(s)` and its Laplace representation); §3.3.5 p. 226 (lines 489–514: the triangle weight, convergence by positivity, Riemann–Lebesgue, limit `πA`); §3.4.1–3.4.2 pp. 227–228 (lines 517–539: monotone two-sided argument, `J` bounded as a consequence); §4.1 pp. 228–229 (lines 570–604: Lemmas 1–2 not needed under Theorem I; uniform convergence of `h(a+ε+iy)` on closed intervals avoiding `0`); Lemma 3 §5.1.1 p. 231 (line 673, `l < 1`); Lemma 4 §5.1.2 p. 233 (lines 712–724: `∫₀^∞ e^(−st) t^ρ dt = Γ(ρ+1) s^(−ρ−1)` for `Re ρ > −1`, as the README states); Theorem III §5.2.1 pp. 235–236 (lines 818–832: `ω` not an integer `≤ 0`, holomorphic on the line off `a`, `(s−a)^(−ω) g + h`, `g(a) ≠ 0`, conclusion `α ~ (g(a)/Γ(ω)) e^(at) t^(ω−1)`); proof p. 237 (lines 870–884: `g(a) > 0` from positivity, `p = 0`, `l < 1`, `γ ∝ u^(ω−1)`); §5.3 p. 242 second remark (lines 1046–1058: order of magnitude only when the hypothesis off `a` is dropped). Wood: §7 pp. 415–417 as above (lines 1586–1590, 1636–1637, 1692–1700, including the trivial homomorphism set aside at 1695–1697 and the non-surjective bound via `F_(k−1)` at 1698–1700). Gamburd–Magee–Ronan: §4.1 pp. 790–791 (lines 1908–1913 the Laplace transform of the renewal method; line 1944 equation (4.4) `N̂(·, s) = s⁻¹(1 − L_s)⁻¹ 1`, running head 791 at line 1916) and §4.3 p. 797 (lines 2195–2203: a holomorphic neighbourhood of `β₀` for the resolvent minus the pole, and holomorphy at every `Re s = β₀` other than `β₀`; line 2205 the uniform small-o as a separate conclusion). Osele: lines 72–74, 121–122, 125–127 (F02). All four source URLs in the References match the cached copies' provenance lines.

**Checks recomputed (24), all correct.** Laplace of `1` is `1/s` and of `t²` is `2/s³` (Stieltjes variants `1`, `2/s²`); `K_λ(0) = λ/π`, `K_λ(π/λ) = 0`, the `sinc(λv/2)` variant gives `(λ/π)(2/π)²`; `K_λ ≤ 1/(πλv²)`; `∫₀^R sin²w/w² = −sin²R/R + ∫₀^R sin 2w/w`, mass `(1/π)·π = 1`; `∫_{−2λ}^{2λ}(1 − |y|/2λ) cos(yv) dy = (1 − cos 2λv)/(λv²) = 2λ sinc(λv)²`, value `2λ` at `v = 0`, so `(1/2π)·2λ sinc² = K_λ`; `w₀ = 1 − e^(−t)`, `t w₁ = 1 − (1+t)e^(−t)`, `t² w₂ = 1 − (1+t+t²/2)e^(−t)` for every real `t` including `0`, the `1/k!`-less variant `2 − (2+2t+t²)e^(−t)`; `w_k(t) tᵏ = (1/k!)∫₀ᵗ e^(−x)xᵏ dx`; the HP.2.2 `k = 1` boundary value `c(log(1+iy) − log(iy) + iy/(1+iy) − 1)` by the antiderivative `log w + iy/w` along a path with `Im = y ≠ 0`, growth `−c log|y|`; `|ε+u+iy| ≥ (u+|y|)/√2` and the logarithmic majorant for `j = k`; the one-bandwidth condition `ε < aC/(a+3λ)` and the vanishing of the triangle at frequency `3λ`; counting constants `1` (ones), `1` (`ζ²`), `1/6` (`ζ⁴`; wrong normalisations `1/3`, `1/2`, `1/24`), `1/2` (`c n = n`, `A/a` at `a = 2`); the `a = 0` control (`∑ 1/n ~ log X`, `ζ(s+1)/s` with numerator `sζ(s+1) → 1` for a double pole); the rescale cross-check `A/a^(k+1) · aᵏ = A/a` (also by dilating `α(t) = α̃(at)`); dyadic values `1, 3, 3, 7, 7, 15, 15`, ratios `→ 2` and `→ 4/3`, `1/log 2 ≈ 1.4427` strictly between, derivative `log 2` of the denominator at `1`; `d(4) = 3`; Wood `r = 2` gives order `2² = 4`; the equal-order control doubles the limit.

**Adversarial pass (instances tried; no change needed).** `HasLaplace`: `μ = 0`, `s = 0` with `f = 1` (non-integrable, predicate false: now provable, F03), real functions cast to `ℂ`, the non-zero-preserving action excluded by the Check's `SMulZeroClass`. `PoleBoundary`: `A = 0` (order `≤ k`), the model at `a = −1, 0, 2`, `Function.update` on the line, the dyadic `F` (fails only `away`, unbounded near `1 + 2πi/log 2`), the zero function (numerator vanishes on a half-disc, hence on the connected disc); `mul` orders `(k+1)+(l+1) = (k+l+1)+1`; `rescale` numerator `g(as)/a^(k+1)`; `div_argument` and `rescale` need `a > 0` and have it; `mul_regular` with `H = 0`. `squaredSinc`: `λ = 0` (zero kernel), `λ < 0` (negative; mass and tail claims assume `λ > 0`, the Lean has `hell`). `delangeWeight`: `t < 0`, `t = 0`, `k = 0`; `w_k(t) ≤ t/(k+1)!` so the damped identity converges absolutely at `ε > 0`. `integerGammaLaplace`: `k = 0`, `a < 0`, `s` on `Re s = a` excluded. `regularizedBoundaryL1`: `k = 0` (remainder analytic at `a`), the model (`R = 0`), `A = 0`; the integrand `y ↦ ‖H(a+ε+iy) − b(y)‖` is continuous minus integrable for `ε > 0`, so the Bochner integrals are genuine and the limit is not vacuous. `delangeSmoothedLimit`: `α = 0`, the Gamma model, `A < 0` contradicts the hypotheses (vacuous, not false); the undamped integrability by monotone convergence in `ε`. `monotoneUnsmoothing`: `C = 0`; the one-bandwidth construction (nondecreasing for `ε < aC/(a+3λ)`, compactly supported modification on `[0, t₀]`, no limit of `J`); `hC : 0 ≤ C` is implied by the smoothed limits (unused hypothesis, a note only). `delangeLaplace`: `k = 0, 1`, the model; Delange's Theorem III at `ω = k+1`. `logSummatory_hasLaplace`: `c = δ₁` (transform `1/s`), `c 0 ≠ 0` ignored, negative `t` (sum `0`), `s = 0` excluded. `delangeDirichlet`, `_positiveAbscissa`: `a = 1, 2`, `k = 0` against `wienerIkehara_rpow`'s `κ/σ` (`Variants.lean:135–139`, `Finset.Icc 1 ⌊x⌋₊` as the README's convention says). `finiteChange_asymptotic`: a change at `n = 1`, signed changes, via `eventually_summatory_sub_eq` (`Basic.lean:177`). `lowerPole_perturbation`: `l = 0, k = 1`; `k = 0` admits no `l`. `zetaSquare_counting`, `counting_test_divisor_fourfold`: `n = 0` weight `0`. `dyadicLocalPoleCounterexample`, `dyadic_test_values`: `j = 0, 1, 2, 3`. Universes and instances: `E` universe-polymorphic; no hidden section hypotheses.

**Supplier citations checked.** Tau Ceti at `a91d3aaf`: `summatory` (`TauCeti/Order/Northcott/Basic.lean:102`), `summatory_apply` (`:107`), `summatory_eq_summatory_natFloor` (`:138`), `summatory_nonneg` (`:155`), `summatory_mono` (`:164`), `eventually_summatory_sub_eq` (`:177`, weights equal off a finite set give an eventually constant difference, as the README says), `mem_normLE_natCast` (`:73`), `wienerIkehara` (`SharpCutoff.lean:301`, continuous `G` on `Re s ≥ 1`, sum over `Finset.Icc 1 ⌊x⌋₊`), `wienerIkehara_rpow` (`Variants.lean:135`, limit `κ/σ`). Mathlib at `6b7abb3c`: `Northcott` (`Mathlib/Order/Northcott.lean:36`), `Set.finite_Iic`, `integrableOn_exp_mul_complex_Ioi`, `integral_exp_mul_complex_Ioi`, `Real.sinc_of_ne_zero`, `Real.log_two_gt_d9`/`lt_d9` (all used by proofs that elaborate). The parent's Layer 9 is `Completed/ArithmeticDirichletSeries/README.md:337` (“### Layer 9: Wiener–Ikehara”, matching the anchor); the completed-parent heading form follows the round-1 repair. Duplication by object: no Laplace-transform predicate on functions, no squared-sinc kernel on `ℝ`, no Delange weight and no higher-order-pole Tauberian theorem at either pin (round 1 and the repair report's search, re-checked by grep for `HasLaplace`, `sinc`, `Delange` in the pinned Tau Ceti).

**Dependency check** (run on the submitted README with the supplied name):

```text
depcheck: 14 roadmaps, 101 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `ArithmeticDirichletSeriesPartII` is absent from the branch's `merge-order/ORDER.txt` (as the import opened) and present on the board's `main` at line 189; no roadmap supplier other than the completed parent; no declared supplier gaps. The board's open import pull requests include `ArithmeticStatistics` (#128) and `SieveMethodsAndPrimePatterns` (#177); neither is cited as a supplier.

**Policy.** No `lemma`, no `set_option`, no `#check`/`#eval`, no `def := sorry`, no LaTeX delimiters, no pull-request or issue numbers, no “review”, “round”, “so far” or “current”; `import Mathlib` plus the one `TauCeti.*` module actually used; at most two proved examples per definition and no admitted example; every Lean name appears in the README and every backticked name of the roadmap's own is declared in the Lean; module docstring and namespace in the prescribed form. Title: F01.

## Not verifiable

- Ownership against open pull requests was checked by name against the board's open import list only; the files of the open roadmap pull requests were not read in this pass (round 1 and the repair report searched nine sibling checkouts and found no overlap).
- Gamburd–Magee–Ronan page numbers `790` and `796` are inferred from the running heads `791` (line 1916) and `797` (line 2187) of the following pages in the cached copy; the pages themselves carry no marker text in the extraction.
- The `#check @name` probe of every elaborated type was not repeated this round; only `HasLaplace` depends on section variables, and its consumers elaborate with explicit binders.
