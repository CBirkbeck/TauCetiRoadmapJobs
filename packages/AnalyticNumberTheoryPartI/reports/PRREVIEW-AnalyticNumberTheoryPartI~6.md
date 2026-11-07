# Review of AnalyticNumberTheoryPartI (pull request #1126 at 2b9b7af)

**Verdict:** accepted

This is an incremental re-review of the 2 lines that changed since 20d500c, the head r5 read. One line of `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md` changed: line 396, the second Check of §0.11b. `Suggested.lean` and `metadata.toml` are byte-identical to 20d500c (`git diff --stat 20d500c HEAD` lists only the README). Nothing changed outside the folder: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AnalyticNumberTheoryPartI'` is empty.

**Gate.** I ran the brief's gate command on this head and every check passes (`set_option=0 … latex=0 tex=0 … sorry-data=0 sorry-examples=0 … depcheck=0 … outside-folder=0 … OK`). The worker's run at this head also reports `build=0`.

**Dependency check.** I ran the brief's command and got `depcheck: 240 roadmaps, 2440 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. The roadmap is at `ORDER.txt` line 90, after ZerosOfLFunctions (85) and GlobalHolomorphicFunctions (89).

**Elaboration.** I ran `lake env lean` on `TauCetiRoadmap/AnalyticNumberTheoryPartI/Suggested.lean` from the worktree. Exit code 0, 28 lines of output, all of the form `warning: declaration uses `sorry``. There is one per `theorem`: `grep -c '^theorem'` gives 28. Line 1 is `module` and line 3 is the only import, `import Mathlib`. The file has no `set_option` and no `lemma`.

No finding remains.

## Previous findings

- R01 — repaired: line 396 now reads "which gives `ζ′/ζ(1+η) = −η⁻¹ + γ + O(η)`; subtracting the pole with the wrong sign, `−ζ′/ζ(1+η) + η⁻¹ = 2η⁻¹ − γ + O(η)`, is unbounded as `η → 0⁺` and equals `≈ 1.5700` at `η = 1`."

The repair introduces no new problem:
- The expansion it states is correct. From `ζ(s) = 1/(s−1) + γ + O(s−1)` we get `ζ′(s) = −(s−1)⁻² + O(1)` and `ζ′/ζ(s) = −(s−1)⁻¹ + γ + O(s−1)`.
- Hence the target error `−ζ′/ζ(1+η) − η⁻¹` equals `−γ + O(η)`, which is bounded, and the wrong-sign expression `−ζ′/ζ(1+η) + η⁻¹` equals `2η⁻¹ − γ + O(η)`, which is unbounded.
- The numerical value at `η = 1`, `0.56996 + 1 = 1.56996`, matches the "≈ 1.5700" now in the Check. Other values are in the table below.
- The sign agrees with Mathlib's regularized function at the pin. `DirichletCharacter.LFunctionTrivChar₁` is `(s − 1)·L(s, χ₀)` (`NumberTheory/LSeries/DirichletContinuation.lean` line 345), and `continuousOn_neg_logDeriv_LFunctionTrivChar₁` (line 376) gives continuity of `−L₁′/L₁ = −L′/L − (s−1)⁻¹` at `s = 1`. At level 1 this is the target error, with value `−γ` at the pole. That is the identification the section's prose asks for.
- The line is Unicode in code spans with no LaTeX (gate `latex=0 tex=0`) and has no process wording.

## Verified sound

**What the change touches.** The changed text is a Check, not a statement. The statement of §0.11b (lines 370–383) is unchanged: the uniform bound `|L′/L(σ,χ) + Σ_p χ(p)(log p)/p^σ| ≤ C` and "`−ζ′/ζ(1+η) = η⁻¹ + O(1)` for `0 < η ≤ 1`". Three places cite §0.11b, and I re-checked each against the corrected Check:
- **§0.34b (line 812)** uses `−ζ′/ζ(s) ≤ 1/(s−1) + O(1)` for `1 < s ≤ 2`. The computed errors `−0.4300, −0.4948, −0.5590, −0.5753` at `η = 1, 0.5, 0.1, 0.01` are all negative, so this holds even with constant 0, consistent with the Check.
- **§0.34's Needs line (line 835)** names "the regularized `−ζ′/ζ(1+η)`". Its sign is the one the Check now pins.
- **§0.9 (line 305)** uses `|L′/L(σ′,χ)| ≤ −ζ′/ζ(σ′)`. This follows from `|χ(n)| ≤ 1` term by term and does not involve the Check.

§0.34 is a seeded target, and the change leaves its route and its three sub-targets untouched. The other fourteen seeded targets lie outside the changed passages. Their statements and locators are byte-identical to 20d500c and were not re-read at source this round, as the incremental brief directs. The README flags no locator as unverified: `grep -i 'unverified\|not verified\|uncertified'` finds nothing. For every seeded target with no row in r5's table, I added a computed row (marked "new, sample" below).

**Library declarations opened at the pins** (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9, from `lake-manifest.json`), all in Mathlib:
- `DirichletCharacter.LSeries_twist_vonMangoldt_eq`, `NumberTheory/LSeries/Dirichlet.lean` line 412
- `LSeries_vonMangoldt_eq_deriv_riemannZeta_div`, same file, line 439
- `ArithmeticFunction.vonMangoldt.continuousOn_LFunctionResidueClassAux`, `NumberTheory/LSeries/PrimesInAP.lean` line 289
- `DirichletCharacter.LFunctionTrivChar₁`, `NumberTheory/LSeries/DirichletContinuation.lean` line 345
- `continuousOn_neg_logDeriv_LFunctionTrivChar₁`, same file, line 376

These are all the library names §0.11b cites, and all are present.

**Overlaps and ownership.** `scratch/overlaps.md` lists no other pull request that changes this roadmap, no dropped id, and no id defined only by an open revision. The change adds no citation, name or supplier, so r5's ownership audit stands unchanged: §0.34 is the owner cited by ArithmeticStatisticsPartVII, ErdosProgressionPowers, EffectiveClassNumbers and SieveMethodsAndPrimePatterns, and §0.34a is owned here by merge order.

**Elaborated signatures.** The Lean file is unchanged, and the worker's `scratch/signatures.md` (55 declarations, 0 lost binders) is for this file. r5 compared every theorem with its README sentence. The file has no `variable` block, so no section binder can be lost.

**One-tactic probe.** The file is unchanged, so r5's result carries over: all 28 theorems resist `simp`, `norm_num`, `rfl`, `infer_instance`, `positivity` and `simp_all`.

**Adversarial table.** Rows marked *new* were computed this round. Rows marked *(r5)* are carried forward from the r5 report (`PRREVIEW-AnalyticNumberTheoryPartI~5.md`, head 20d500c) for statements the diff leaves untouched, with the values r5 computed. My numbers come from two Python checks. Values of `ζ′/ζ` use Euler–Maclaurin with `N = 50`, seven Bernoulli terms and a central difference with `h = 10⁻⁶`; the check `ζ(2) = π²/6` agrees to 16 digits. Prime sums use a sieve to `10⁶`.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §0.11b regularized error, changed Check (*new*) | `η = 1, 0.5, 0.1, 0.01` | `−ζ′/ζ(1+η) − η⁻¹ = −0.430039, −0.494765, −0.558964, −0.575344`, tending to `−γ = −0.577216`; the remainder at `η = 0.01` is `0.00187 ≈ (γ² + 2γ₁)η` with `γ² + 2γ₁ = 0.1876` | ✓ matches "≈ −0.4300" and "→ −γ" |
| §0.11b wrong-sign control, changed Check (*new*) | `η = 1, 0.5, 0.1, 0.01` | `−ζ′/ζ(1+η) + η⁻¹ = 1.569961, 3.505235, 19.441036, 199.424656`, against `2η⁻¹ − γ = 1.4228, 3.4228, 19.4228, 199.4228`; the difference goes to 0 with `η`, and the sum diverges | ✓ matches "≈ 1.5700" and "unbounded" |
| §0.11b Laurent step (*new*) | symbolic | `ζ′/ζ = (−(s−1)⁻² + O(1))·(s−1)(1 − γ(s−1) + O((s−1)²)) = −(s−1)⁻¹ + γ + O(s−1)` | ✓ |
| §0.11b against Mathlib's `LFunctionTrivChar₁` (*new*) | level 1 | `−logDeriv((s−1)ζ(s)) = −(s−1)⁻¹ − ζ′/ζ(s)`; the value at 1 is `−γ`, because `(s−1)ζ(s) = 1 + γ(s−1) + …` | ✓ same sign as the Check |
| §0.34b use of §0.11b (*new*) | `1 < s ≤ 2` | `−ζ′/ζ(s) − 1/(s−1) ≤ 0` at every computed point (row 1) | ✓ |
| §0.21 Mertens II (*new, sample*) | `x = 2, 3, 100, 10⁴, 10⁶`, `B = 0.261497` | `Σ_{p≤x} 1/p = 0.5, 0.83333, 1.80282, 2.48306, 2.88733`; remainder `0.60502, 0.47779, 0.01414, 0.00124, 0.00004`; remainder·`log x` = `0.419, 0.525, 0.065, 0.011, 0.0006`, so the remainder is `O(1/log x)` | ✓ endpoint `x = 2` included |
| §0.24 repulsion (*new, sample*) | `N₁ = 5`, `N₂ = 24 ≤ 25` | `log(N₁N₂) = 4.787 ≤ 3 log 5 = 4.828`; then `3c*/log(N₁N₂) ≥ c*/log N₁ ≥ c*/log N₂`, so both strict cutoffs contradict §0.17's `min β < 1 − 3c*/log(N₁N₂)`; vacuous by §0.1 since `c* ≤ c_LS`, as line 185 says | ✓ |
| `weil_explicit_formula` §1.8 (*new, sample*) | `F = 0`; `M = d = 0`; completed `ζ` | `F = 0`: every term is 0 (`weilGammaTerm` integrand `0 − 0`). `M = d = 0`: `hEuler` forces `Λᵢ = Aᵢ^s`, and reflection forces `A₀A₁ = 1`, `w = A₀`, so both sides are 0 (`log(A₀A₁) = 0`, no divisor). `ζ`: `A = π^{−1/2}`, `a = 1/2`, `b = 0`, so `A^sΓ(s/2) = π^{−s/2}Γ(s/2)`; slope sums `1/2 = 1/2`; the signed divisor gives `−Φ(0) − Φ(1)` | ✓ |
| §2.4 Hecke boundary adapter (*new, sample*) | `K = ℚ`: `ζ`, `χ₋₄`, deletion at 2 | `ord₁ ζ = −1`; `L(1,χ₋₄) = π/4 ≠ 0`, order 0; `|1 − 2^{−1−it}| ≥ 1/2 > 0` | ✓ |
| §2.6 conductor bound (*new, sample*) | `g = 1`, `E = ℚ(i)` | `L = E`, `|G| = 2 ≤ 2!`, `F(E) = {χ₋₄}` with `χ₋₄(c) = −1`, `dim = 1`; `f = 4 ≤ D_L^{2·1/2} = 4` (equality); conductor–discriminant: `f^{dim ρ} ≤ D_L` | ✓ |
| §2.16 completion and root number (*new, sample*) | `D = −4`, `D = −3` | `D = −4`: `Λ_std(1) = (4/π)·1·π/4 = 1` and `Λ_std(0) = (2/√π)·√π·L(0,χ₋₄) = 2·(1/2) = 1`. `D = −3`: `Λ_std(1) = (3/π)·π/(3√3) = 1/√3` and `Λ_std(0) = √3·(1/3) = 1/√3`. Equal endpoint values, consistent with root number `+1` | ✓ the Check's values |
| §3.30 shifted coprime Möbius (*new, sample*) | `T = 10⁶`; `q = 1, 2, 6` | the sum plus `q/φ(q)` is `0.00279, −0.00083, 0.00535`. Sign: `G(s) = 1/(ζ(s)∏_{p∣q}(1−p^{−s}))` has `G′(1) = q/φ(q)`, so `Σ_{(t,q)=1} μ(t)log t/t = −q/φ(q)` and `Σ μ(t)/t = 0` | ✓ |
| `shiu_bound` §3.37 (*new, sample*) | `f = 1` (`κ = 1`, `b = Λ`); `q = 1`; `2^Ω` | `q = 1`: `ZMod 1`, `a = 0` is a unit; `z = x` gives `⌈0⌉₊ = 0`, excluded by `0 < n`; LHS `⌊x⌋`, RHS `C x/log x · exp(log log x + B + o(1)) = C e^B x(1+o(1))`. `HalaszCoefficientClass`: `‖b 1‖ ≤ κΛ(1) = 0` makes the `log 1 = 0` junk harmless. `2^Ω`: `Λ_f(2^k) = 2^k log 2 > κ log 2` for large `k`, so not in `C(κ)`, as the README says | ✓ |
| §0.4 (sample, *r5*) | as r5 | `M/k ≤ 2.39·10⁻⁵ < 4.59·10⁻⁵` | ✓ (r5) |
| `finite_order_hadamard` §0.23 (sample, *r5*) | `f = 1`, `z²e^z`, `e^{z²}`, `1/Γ`, `sin πz` | `ρ = 0, 1, 2`: degree `≤ ⌊ρ⌋₊`; order-1 summability at exponent 2 | ✓ (r5) |
| `siegel_walfisz` §0.32 (sample, *r5*) | `q = 1`, `a = 0`; `psiAP 2 0 4`, `psiAP 4 0 8`, `primeCountAP 2 0 10`, `primeCountAP 4 3 3` | PNT at `q = 1`; `2 log 2`; `2 log 2`; 1; 1 | ✓ (r5) |
| §0.34 combination, small conductors, `landau_siegel_exclusion` (sample, *r5*) | `X = q^C`; `β ≤ 1/2`; `q = 3, 4`, imprimitive mod 6 | `(C/4 − 1 − A − AC²δ) log q ≤ B + K_C`; `δ ≥ (log 3)/2`; the induced level-6 character is excluded | ✓ (r5) |
| §0.34a–c (sample, *r5*) | `q = 3, 4, 5, 8, 12`; `C = 12, 24`; `s = 1 + 1/log X` | `D = −3, −4, 5, ±8, 12`; `221/288 = 0.7674 > 3/4`, `825/1152 = 0.7161 < 3/4`; `(1−β)/((s−1)(s−β)) ≤ (1−β)(log X)²` | ✓ (r5) |
| 2.17 class-number value (sample, *r5*) | `D = −4, −3` | `π/4`, `π/(3√3)` | ✓ (r5) |
| §3.23 second moment (sample, *r5*) | `T = 2π`; `x = 1, 3/2, 4` | main term identity; `Δ(1) = 2 − 2γ`, `κ₇ = 0.408` | ✓ (r5) |
| `BeurlingPrimeSystem.pnt_iff_integerCount` §3.42 (sample, *r5*) | ordinary primes; each prime twice; `p₁ = p₂ = 2` | `N(10) = 10`, `π(10) = 4`; doubled system: both sides false; `N(2) = 3`, `π_P(2) = 2` | ✓ (r5) |
| §0.11a tail bound, `(log p)/p` control (*r5*) | `y = 2` | `Σ_p (log p)/p² = 0.49309`; `C = 2 log 4 = 2.7726` | ✓ (r5) |
| §0.11b level 1 at `σ = 2`; principal mod `q` (*r5*, unchanged Checks 1 and 3) | `q = 6`, `σ = 1` | `0.56996 − 0.49309 = 0.07687`; `Σ_p (log p)/(p(p−1)) = 0.75537` | ✓ (r5) |
| §0.11c weighted sum, Mellin, scalars, Jensen (*r5*) | `x = 1, 2, 2.9, 4`; `η = 1, 2` | `A(1) = 0`; both sides `0.4931`; `η⁻¹ = 1/2`; `0.6533 ≤ 0.7413` | ✓ (r5) |
| `inert_prime_sum_le`, `split_prime_sum_le_of_real_zero`, `quadratic_character_kronecker` (*r5*) | `C₀ = C = 0`; `q = 10⁶`, `X = 3` | `0 ≤ K`; `0.713 ≤ 13.8A`; Jacobi values | ✓ (r5) |
| §0.9 and `quadratic_LFunction_one_lower_bound` (*r5*) | `q = 3, 4` | `c ≤ 0.664`; `c_ε = ecε` | ✓ (r5) |
| §0.6, §0.1, §0.18, §1.2 effective forms (*r5*) | `T = 2`; `N ≤ (log x)^B` | `log(T(T+2)) ≤ 3 log T`; error `x exp(−(c/2)√log x)(B log log x)⁴` | ✓ (r5) |
| §2.13; `dedekindZeta_residue_le`; `bounded_degree_brauer_siegel` (*r5*) | `D = 5`; `ℚ(i)`, `ℚ(√5)`, `ℚ(√−3)`; `L = ℚ` | `0.430`; residues `0.7854, 0.4304, 0.6046` against bounds `1.884, 2.187, 1.493`; `C⁻¹ ≤ 1 ≤ C` | ✓ (r5) |
| `half_interval_explicit_formula`, `dirichlet_polynomial_mean_square`, `selberg_zero_density`, `DirichletGRH` (*r5*) | `k = 4, 5`; `N = 0, 1`; `σ = 1, 3/4`; `s = 2πi/log 2`, `−2` | `{3,4}`, `{3,4,5}`; `0 ≤ 6π|a₁|²`; empty strip; unconstrained | ✓ (r5) |
| `landau_ramanujan`, `halasz_mean`, `smoothCount_dickman`, `restricted_sathe_selberg` (*r5*) | `K = 3, 5`; `f = n^{it₀}`; `ρ(2)`; `N = 14` | `0.7642`; counts 2, 4; `D(0,0;2)² = 1/2`; `1 − log 2`; `{2,5,13}`, `{10}` | ✓ (r5) |
| §3.22, §3.23a, `atkinson_*`, `zetaFourthMoment` (*r5*) | `x = 1, 4`; `T = 4π` | `8`; `12`; `cutoff = 1 < 2`; `1/(2π²)` | ✓ (r5) |
| §0.14, §2.22, §2.27, §2.30, §2.7, §2.23, §3.10, §3.12, §3.19, §3.28, §3.29, §3.35, §3.38, §0.26 (*r5*) | as r5 | `ξ(2) = π/6`; `γ + log(π/2)`; `h/u = 2`; `2i`, `i√3`; ramified/inert/split factors; `D = −4` identity; `γ₁(p) = 1 + 1/(p(p−1))`; uniformity `q ≤ T⁴`; `Λ_μ = −Λ`; `N₂(10) = {35}`; `Λ₂(0) = log 2`; `Ψ(2,2) = 2 ≤ 4`; `C ≤ N^{δ/2}`; `2 − 1.234 = 0.766` | ✓ (r5) |
| §0.5, §0.7, §0.17, §0.25, §0.27, §2.15a, §3.7, §3.17, §3.40, §1.5a, §3.45a, §3.36b, §3.14 (*r5*) | as r5 | `π(59) = 17`; `43.9 > 40`; `2.4C + 2.4 ≤ C` impossible; `1.718 < 2`; `16a³ ≤ (a+4)⁵`; `2.467 ≥ 1.49`; `8 = u² + 3v²` unsolvable | ✓ (r5) |

**Not re-run this round, carried from r5 because the files are unchanged:** the source sample of r5's fifteen targets, the duplication-by-object grep of both pins, and the Lean-form audit of every library name used by the statements.

## Not verifiable

- No new item. The changed Check makes no source claim; it follows from the Laurent expansion and Mathlib's `LFunctionTrivChar₁`.
- The items r5 listed remain as they were: Koukoulopoulos's book, Neukirch's book and Davenport's book (no legal copy in the cache), and Friedlander–Iwaniec 2018 (paywalled, `uncertified`). None of them bears on the changed line.

## Source issues

- none
