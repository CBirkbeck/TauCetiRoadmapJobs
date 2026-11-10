# Review of ZerosOfLFunctions (pull request #1907 at 123254c)

**Verdict:** needs changes

Two P3 findings, no blocking finding. The gate passes, `Suggested.lean` elaborates with `sorry` as the only warning, and all twelve findings of the previous review are repaired. Both findings are about generality: a statement is narrower than the route or the source this roadmap itself gives.

## Previous review (at 8d25d6d), finding by finding

| Previous | State at 123254c | Passage |
|---|---|---|
| R01 (P2) general end theorems absent | repaired | `Suggested.lean` now states `dedekindZeta_zeroFreeRegion`, `heckeLFunction_zeroFreeRegion` (with the "at most one" clause), `riemannVonMangoldt_dedekindZeta`, `riemannVonMangoldt_heckeLFunction`, `rayClassPrimeCount_effective`, `frobeniusPrimeCount_effective_abelian`; the docstring names only the completions as missing, which is true at the pin (no `completedDedekindZeta`, `completedHeckeLFunction`, `heckeData` or `dedekindZetaData` in Tau Ceti `2fd255d9`) |
| R02 (P3) contract names | repaired | README:230–250 lists `meromorphicOrderAt_eq`, `analyticAt`, `polarOrder_one_sub_conj`, `completed_eq`; the "From Tau Ceti" block carries the moved contracts with files; `HasMeromorphicContinuation.analyticAt` at README:120, 607, 1442 |
| R03 (P3) 6.4a `*Needs:*` | repaired | README:1352–1361 lists Layer 0, 1.2, 1.4, 1.6, 5.5 and the `dirichletData_*` and Mathlib names; 5.6, 6.4d and 6.5 are gone, and their Dirichlet instances are proved inside 6.4a (README:1251–1270) |
| R04 (P3) Trudgian locator | repaired, see R02 below | README:1507–1511 and 1522–1526; References 1944–1952 |
| R05 (P3) two non-headlines | repaired | *one_zero_le_logDeriv* and *bounded_level_zero_free* are italic README targets; the three kept 6.4a declarations sit in `## Layer 6` before Layer 7 |
| R06 (P3) two library names | repaired | `PhragmenLindelof.vertical_strip` (README:172, 750, 757, 866); `TauCeti.IsPiecewiseC1On` (README:216, 1412, 1419) |
| R07 (P3) digamma monotonicity | repaired | README:535–541: monotone through `ConvexOn.monotoneOn_deriv` and `Real.convexOn_log_Gamma`; the series is an aside |
| R08 (P3) 3.3/3.4 locators | repaired | README:765–766 and 813–814 |
| R09 (P3) 8.7 quantifier order | repaired | README:1719–1730: `c₀` depends on `n` alone; the Lean statement chooses `c` before `K`, `𝔪` and the class |
| R10 (P3) 4.2 divisor off `U` | repaired | README:898–906, with the `U = ∅` Check |
| R11 (P3) endpoint value | repaired | README:1283–1284: "between `−1.5542` and `−0.5541`" |
| R12 (P3) order against #1913 | repaired | the description's merge-order paragraph: #1913 → this pull request |

## R01 (P3) — The retained-zero inequalities of 6.4a are stated for real characters only, though the route given proves them for every primitive character

**Location.** README:1300–1301: "For a primitive nonprincipal real `χ` of conductor `q ≥ 3`, a real zero `0 < β < 1` … prove the one-zero inequality"; `Suggested.lean:223`, `(hreal : χ.IsQuadratic)` in `finite_zero_sum_le_logDeriv`.

**Claim.** Reality of `χ` is a hypothesis of both inequalities.

**Witness.** README:1266–1270 proves `Re B(χ) = −∑_ρ m_ρ Re (1/ρ)` for every primitive `χ ≠ 1` and says "Reality of `χ` is not used". The source is the same: `montgomery-vaughan2006` line 1315 (Corollary 10.18) assumes only "primitive modulo `q`, `q > 1`". With that identity, the equality `∑_ρ Re (1/(σ − ρ)) = Re (L'/L)(σ) + ½ log q + logDeriv Gammaℝ (σ + κ)` (README:1314) holds for every primitive `χ ≠ 1`, every summand is positive, and the gamma term is at most `C_Γ` for both parities. Instance: the quartic character modulo `5`, `σ = 2`, `S = ∅`: left side `0`; right side at least `−0.570 + 0.805 + 1.572 = 1.807` (using `|L'/L(2, χ)| ≤ −ζ'/ζ(2) = 0.570`). One zero in the strip adds less than `1/(2 − β) < 1` to the left.

**Repair.**
- In README 6.4a write "For a primitive nonprincipal `χ` of conductor `q`" for both inequalities, and keep "a real character" as the case Analytic Number Theory Part I §0.34b consumes. The one-zero inequality keeps its real zero `β`; a non-real `χ` may be given one.
- In `Suggested.lean` delete `(hreal : χ.IsQuadratic)` from `finite_zero_sum_le_logDeriv` and "real" from its docstring. `(hq : 3 ≤ q)` follows from `hne` (the moduli `1` and `2` carry only the principal character) and can go with it. The signature `(χ : DirichletCharacter ℂ q) (hprim : χ.IsPrimitive) (hne : χ ≠ 1) (S : Finset ℂ) (hS …) (σ : ℝ) (hσ : 1 < σ) (hσ2 : σ ≤ 2)` elaborates at the pins with only the `sorry` warning (tested on a scratch copy).

## R02 (P3) — The Dedekind count of 7.5 has no locator to a complete proof, and its constant is weaker than the available source gives

**Location.** README:1507–1511: "Trudgian, Theorem 2, states the Dedekind count … so that paper is cited for the shape of the main term only"; README:1503–1504: "the implied constant depending only on `n`"; `Suggested.lean:248–249`, `theorem riemannVonMangoldt_dedekindZeta (n : ℕ) : ∃ C : ℝ, ∀ (K …), Module.finrank ℚ K = n →`.

**Claim.** No source proves the Dedekind count, and the constant depends on the degree.

**Witness.** `hasanalizade2022` (Hasanalizade–Shen–Wong, *Counting zeros of Dedekind zeta functions*, arXiv:2102.04663v3) line 52–54, Theorem 1.1, p. 2: for every number field and `T ≥ 1`, `|N_K(T) − (T/π) log(d_K (T/2πe)^n) + r₁/4| ≤ 0.22737 log(d_K (T + 2)^n/(2π)^n) + 23.02528 n + 4.51954`, with `N_K(T)` the zeros in `0 < β < 1`, `|γ| ≤ T` with multiplicity (line 27): exactly the count of `riemannVonMangoldt_dedekindZeta`. Lines 40–50 record the gap in Trudgian's Theorem 2 and that this theorem repairs it. For `T ≥ 2`, with `L = log(d_K T^n) ≥ n log 2`: the error is at most `0.22737 L + (0.25 + 0.22737 log 2 + 23.02528 + 4.51954) n = 0.22737 L + 27.953 n ≤ 40.56 L`. So one absolute `C = 41` serves every field of every degree.

**Repair.**
- In README 7.5 cite "Hasanalizade–Shen–Wong, Theorem 1.1, p. 2 (arXiv v3 numbering)" for the Dedekind statement, keep the Trudgian sentence as history or drop it, and add the paper to the References (the roadmap's source manifest already records it under `hasanalizade2022`). Say that the Dedekind constant is absolute; the Hecke statement keeps its dependence on `n` unless a source for an absolute constant is cited.
- In `Suggested.lean` state the Dedekind count with the constant chosen before the degree, and cite the theorem in the docstring. This form elaborates at the pins with only the `sorry` warning (tested on a scratch copy):

```lean
theorem riemannVonMangoldt_dedekindZeta :
    ∃ C : ℝ, ∀ (K : Type*) [Field K] [NumberField K] (T : ℝ), 2 ≤ T →
        |(zeroCount (TauCeti.meromorphicContinuation 1 (dedekindZeta K)) univ
              (Ioo (0 : ℝ) 1 ×ℂ Icc (-T) T) : ℝ) -
            T / π * Real.log (|(discr K : ℝ)| * (T / (2 * π * Real.exp 1)) ^ Module.finrank ℚ K)| ≤
          C * Real.log (|(discr K : ℝ)| * T ^ Module.finrank ℚ K) :=
  sorry
```

## Verified sound

**Gate and build.**
- The worker's gate at `123254c` passes every counter. I ran it again without the build: the same line, `OK`.
- `lake env lean TauCetiRoadmap/ZerosOfLFunctions/Suggested.lean`: 19 warnings, all `declaration uses 'sorry'`, no error. Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ZerosOfLFunctions'` is empty.
- One module docstring, one `import Mathlib` and eight `TauCeti.*` modules that all exist at the pin, no `set_option`, no sorry'd data (the four definitions have real bodies), no `lemma`, no `example`.

**Dependency check.** Output: `depcheck: 236 roadmaps, 2270 edges, 0 problem(s)`. ZerosOfLFunctions is on main and at line 48 of the merge order, after LFunctions (27). Analytic Number Theory Part I (line 50, on main) appears only as a consumer (README:1238, 1328, 1928), never in a `*Needs:*` line.

**Signatures.** I compared the 24 elaborated signatures with their README statements. No binder is lost: every theorem carries its own binders, there is no `variable` block. The README's generality equals the Lean's except as R01 and R02 say.

**One-tactic probe.** Every `sorry` replaced by `first | (simp; done) | rfl | infer_instance | (norm_num; done) | positivity` on a scratch copy: 19 of 19 fail. By reading: `zetaEntireCompletion_hadamard` needs the order bound of 3.1, `riemannZeta_zeroFreeRegion` and `dedekindZeta_zeroFreeRegion` need the comparison of carriers with the general statements; none is a one-lemma consequence.

**Library names.** `#check` at the pins on 131 names the README backticks (60 Mathlib, 71 Tau Ceti): all resolve; `TauCeti.perronFormula` by reading `NumberTheory/ArithmeticDirichletSeries/Perron/Ideal.lean:161`. Statements opened and compared with the README:
- `AnalyticOnNhd.sum_divisor_le` (hypotheses `0 < |r| < |R|`, `1 ≤ M`, `f c ≠ 0`, sphere bound; conclusion `log (M/‖f c‖)/log (R/r)`), as 4.3 states;
- `Complex.exists_continuousOn_eqOn_exp_comp` (simply connected open `U`, `0 ∉ g '' U`; a continuous lift only), as 1.1 and 5.4 state;
- `TauCeti.Contour.argumentPrinciple_nullHomologous`, `windingNumber : (ℝ → ℂ) → ℝ → ℝ → ℂ → ℂ`, `IsNullHomologous γ a b U`, `TauCeti.IsPiecewiseC1On γ a b`, as 7.1–7.2 use them;
- `Complex.digamma_one_half`, `Complex.digamma_apply_add_one` (needs `s ≠ −m`), `Real.convexOn_log_Gamma`, `ConvexOn.monotoneOn_deriv` (needs differentiability on `S`, which 1.4 supplies);
- `TauCeti.LFunctions.dirichletData_gammaR` (`{if χ.Even then 0 else 1}`), `dirichletData_completed`, `dirichletData_polarOrder` (zero unless `N = 1`), `dirichletData_dual` (`Dirichlet/Basic.lean:66–122`); the three record predicates at `Data/Basic.lean:174–197`;
- `TauCeti.GlobalNumberFields.integralIdealsPrimeTo` (`RayClass/Modulus.lean:544`: nonzero integral ideals, so the zero ideal is not counted by `rayClassPrimeCount_effective`);
- `NumberField.Chebotarev.frobeniusPrimeCount` (`VonMangoldt.lean:177`, unramified primes only); `TauCeti.ClassFieldTheory.rayClassArtinMap`, `rayClassArtinMap_idealClass`, `rayClassArtinMap_surjective` (`K L : Type`, `[IsAbelianGalois K L]`), as 8.8 states;
- `TauCeti.truncatedPerronKernel_one` (`π⁻¹ arctan(T/c)`).

**Cross-roadmap citations.**
- The six names the citation tool could not find (`Grossencharacter.heckeMellinTotal` and five others) are declarations of `TauCetiRoadmap/LFunctions/Suggested.lean` on main; so are the other 32 L-functions names of README:323–353 that I looked up.
- L-functions README:306 on main states the continuation convention (`meromorphicContinuation σ f`) that README:207–214 quotes.
- Analytic Number Theory Part I on main has §0.11b (line 357), §0.12 (473), §0.30 (773) and §0.34b (the bold paragraph under §0.34, line 883); §0.34b is stated for real characters, which is the special case R01 keeps.

**Ownership and duplication.**
- `roadmaps grep` over the open pull requests and main for the Lean names of this file and for the 6.4a objects: no second owner. The declarations live in `TauCetiRoadmap.ZerosOfLFunctions`.
- `overlaps.md`: no dropped id, no revision-only id. The one other open pull request on this roadmap is #1913, and the description orders it before this one.
- Hadamard factorization, order of an entire function, complex Stirling, zero-free regions, Riemann–von Mangoldt and explicit formulas are absent from both pins (the worker's library near-matches list has no same-name hit and no candidate proving a target).

**Sources (seeded sample).**
- 1.1: a pinned declaration and a derivation (table).
- 1.2: `dlmf5` lines 104–108 (5.11.1 on `|ph z| ≤ π − δ`) and 563–569 (§5.11(ii): remainder at most `sec²(½ ph z)` times the first neglected term `1/(12 z)`), which gives the `δ`-dependent `O(1/‖s‖)`.
- 1.3–1.5, 3.3: `dlmf5` lines 490–492 (5.11.9), 158–160 (5.11.2); `dlmf-5.4` lines 428–431 and 490–492; `dlmf-5.5` lines 100–102; `dlmf-5.15` lines 64–66.
- 3.1, 4.1, 5.1, 5.4, 6.1, 7.1, 8.6, 8.7: derivations from pinned or supplier declarations; computed in the table.
- 4.3: Mathlib `AnalyticOnNhd.sum_divisor_le`, as above.
- 6.4a: `montgomery-vaughan2006` line 1262 (Theorem 10.16, printed p. 351), lines 1315–1328 (Corollary 10.18 with (10.36)–(10.38), p. 352, proof to p. 353), line 1299 ((10.33): `ξ'/ξ = L'/L + ½ Γ'/Γ((s+κ)/2) + ½ log(q/π)`, which is `½ log q + logDeriv Gammaℝ (s + κ) + L'/L`), lines 1225–1256 (the partial-summation and Stirling route to order one that `completed_orderLE_one` describes). The proof of (10.38) there uses `χ̄`, not reality.
- 6.2: `kadiri2012` lines 79–85 (Theorem 1.1, both regions, the exceptional zero simple and real).
- 7.5: `trudgian2015` lines 19–29; `bennett2021` lines 73–76 (the gap) and 83–84 (Corollary 1.2, p. 2: `q > 1`, `T ≥ 5/7`, `0.298 log qT + 4.358`); `hasanalizade2022` lines 27, 40–54 (R02).
- 7.6, 8.4, 8.8: see Not verifiable; the mathematics is in the table.

**Adversarial table** (values computed).

| Statement | Instance | Left / claimed | Right / computed | Result |
|---|---|---|---|---|
| 1.1 branch normalization | `logGamma δ 3` | `log 2` | `Γ > 0` on `[2, 3]`, `Γ(2) = 1`, `Γ(3) = 2`; shifted branch gives `log 2 + 2πi` | ✓ |
| 1.1 hypotheses of the pinned lift | `S_δ`, `g = Γ` | simply connected, open, `0 ∉ Γ(S_δ)` | image under `log` is `(0, ∞) × (−(π−δ), π−δ)`, convex; no nonpositive integer has `|arg| < π` | ✓ |
| 1.2 Stirling remainder | `z = 10` | `lnΓ(10) − main` | `0.0083306 ≤ 1/120 = 0.0083333` | ✓ |
| 1.4 / `gammaLogDerivBound` | definition | `(1.963510 + 0.036490 + 1.144730)/2` | `1.572365 = 1 + ½ log π` | ✓ |
| 6.4a gamma bound on `[1, 3]` | `s = 1`, `s = 3` | `−1.554120`, `−0.554120` | both of norm `≤ 1.572365` | ✓ |
| 3.1 tail integral | substitution `v = c u^α` | `∫_0^∞ u^(R+1) e^(−cu^α) du/u` | `c^(−(R+1)/α) Γ((R+1)/α)/α`; `R = 0`, `c = α = 1`: `0.2194 ≤ 1` | ✓ |
| 4.1 two counts | `z/(z − 1)` on `closedBall 0 2` | `zeroCount = 1` | `divisorCount = 1 − 1 = 0` | ✓ |
| 4.3 first form | `1 − z/2`, `r = 1`, `R = 3/2`, `M = 2` | count `0` | bound `log 2/log 1.5 = 1.7095` | ✓ |
| 4.3 trailing form | `f = z`, `r = ¼`, `R = ½`, `M = 1` | count `1` | `1 + log 2/log 2 = 2`; first form with `‖a‖` gives `0`, false | ✓ |
| 4.5 disc cover | unit rectangle on the strip | corner distance from centre | `√2/2 ≤ 1` | ✓ |
| 5.1 zero count | `f = 1 − s`, `r = 1` | `1` zero | Jensen with `R = 2r`: `log 3/log 2 = 1.585` | ✓ |
| 5.2 `E₁` | `z = −½` | `‖E₁ − 1‖ = 0.090204` | `≤ ½ · ¼` | ✓ |
| 5.4 entire logarithm | `g = exp`, `g = e^(2πi)·1` | `h = id`; `h = 0` or `2πi` | lifts differ by `2πi ℤ` | ✓ |
| 6.1 3-4-1 | `θ = π`; `θ = 2π/3` | `3 − 4 + 1 = 0`; `3 − 2 − ½ = ½` | `2(1 + cos θ)²`: `0`; `½` | ✓ |
| 6.2 cap | `n = 1`, height `0` | `(log 3/2)/log 3` | `½`, so the region lies in `Re s ≥ ½` | ✓ |
| 6.4a identity | MV (10.33), (10.36), (10.38) | `∑ Re 1/(σ − ρ)` | `Re L'/L + ½ log q + logDeriv Gammaℝ (σ + κ)`, any primitive `χ ≠ 1` | ✓ / R01 |
| `finite_zero_sum_le_logDeriv` without `hreal` | quartic `χ` mod `5`, `σ = 2`, `S = ∅` | `0` | `≥ −0.570 + 0.805 + 1.572 = 1.807` | R01 |
| `completed_orderLE_one` | `χ = 1` mod `1` (excluded by `hne`) | growth clause holds for `Λ_ζ` at infinity | entirety fails at `0`, `1`; `hne` is what the README's "entire" needs | ✓ |
| 7.1 winding | unit square, `z = ½ + i/2`; `z = 2` | `1`; `0` | counterclockwise; clockwise gives `−1` | ✓ |
| 7.5 Dedekind, `K = ℚ(i)` | `d = 4`, `n = 2`, `T = 100` | `(T/π) log(4 (T/2πe)²) = 156.636` | twice the `ζ` count `56.255` plus `(T/π) log 4 = 44.127`: `156.636` | ✓ |
| 7.5 absolute constant | Hasanalizade–Shen–Wong Theorem 1.1, `T ≥ 2` | `0.22737 L + 27.953 n` | `≤ 40.56 L`, `L = log(d T^n) ≥ n log 2` | R02 |
| 7.6 averaged count | translation of the integral | `∫_0^T (N(t+1) − N(t)) dt` | `∫_T^(T+1) N − ∫_0^1 N`; leading term `(n/2π) T log T` | ✓ |
| `riemannVonMangoldt` | `T = 100` | `N = 29` | main term `28.127` | ✓ |
| `riemannVonMangoldt_dirichlet` | `q = 1`, `T = 100` | `58` | `56.255`; poles at `0`, `1` have divisor `−1`, `toNat = 0` | ✓ |
| `riemannVonMangoldt_heckeLFunction` | gamma factors `Gammaℝ^a Gammaℝ(·+1)^b Gammaℂ^(r₂)` | `(T/π)(log(d 𝔑𝔣) + n log(T/2πe))` | each `Gammaℝ` factor contributes `(T/π) log(T/2πe)` and each `Gammaℂ` twice that, `n` in all; trivial zeros have `Re ≤ 0` | ✓ |
| `dedekindZeta_zeroFreeRegion` | trivial zero at `0`; continuation `0` | `1 − c/(n log 3) ≤ 0` only if `c ≥ n log 3` | excluded for small `c`; a zero continuation has order `⊤` everywhere, so the statement needs the continuation | ✓ |
| `heckeLFunction_zeroFreeRegion` | `ψ = 1` at `s = 1` | order `−1` | premise `0 < order` false; `ψ² = 1` holds | ✓ |
| `dirichletLFunction_zeroFreeRegion` | principal `χ` mod `2`, `ρ = 0` | `1 − (log 3/2)/log 6 = 0.693` | `> 0`, so the Euler-factor zeros on `Re s = 0` are outside | ✓ |
| `hadamard_of_orderLE_one` | `f = 1 − s`; `f = s` | `exp(−s)(1 − s)e^s`; factor at `0` is `1` | `1 − s`; `s = exp(a + bs)` false, so `f 0 ≠ 0` is needed | ✓ |
| `dirichletLFunction_convexity` | `q = 1`, `t = 0` | `|ζ(½)| = 1.4604` | `≤ C · 3^(¼+ε)` | ✓ |
| `chebyshevPsi_explicitFormula` | `T ≤ x` | `log x` near prime powers | `≤ x log² x/(T log 2)` | ✓ |
| 8.2–8.3 residues | zero of order `k` at `−m`; `s = 0` | `k x^(−m)/m`; `c_K − (r₁+r₂−1) log x` | sums `−½ log(1 − x⁻²)`, `½ log((x+1)/(x−1))`; `c_ℚ = −log 2π` | ✓ |
| 8.4 Weil | shift `(2) → (−1)`, `s ↦ 1 − s` | `∑ m_ρ φ̃(ρ) − φ̃(0) − φ̃(1)` | `(2πi)⁻¹ ∫_(2) (Λ'/Λ)(φ̃(s) + φ̃(1 − s))`; primes give `φ(n) + φ(1/n)/n`; discriminant term `(log d)φ(1)` | ✓ |
| 8.6 Check | quartic `χ` mod `5`, `χ(2) = i`, `φ(½) = 1` | `log 2 · conj(i) · ½` | `−(i log 2)/2` | ✓ |
| 8.6 trivial zeros | `Gammaℝ(s + a_j)` at `−m` | pole iff `m − a_j` even | `#{a_j ≡ m} + r₂` | ✓ |
| 8.7 width | `T = exp(√log x)` | `log(d 𝔑𝔣 T^n)` | `≤ 2n √log x` for large `x`; `c₀ = min(c/2n, ½)` up to constants | ✓ |
| 8.7 Abel summation | `u = t^β` | `∫_2^x t^(β−1)/log t dt` | `Li(x^β) − Li(2^β)`, `2^β ≥ √2 > 1` | ✓ |
| 8.7 Check | `𝔪 = (3)∞` | `(½)(1 − ⅓)` | `⅓`, the density of `n ≡ 1 (3)`, not the prime coefficient `½` | ✓ |
| `primeCounting_progression_effective` | `q = 4`, `a = 3`, `x = 100` | `13` primes | `Li(100)/2 = 14.540` | ✓ |
| 8.8 fibre sum | characters of `Cl_𝔪` not trivial on `ker Φ` | `∑_{c ∈ Φ⁻¹(σ)} ψ(c)` | `0`; the others give `ψ'(σ)/#G` | ✓ |
| `frobeniusPrimeCount_effective_abelian` | `L = ℚ(i)`, `x = 100` | `13` and `11` primes in the two classes | `Li(100)/2 = 14.540` each; `2` is ramified and not counted | ✓ |
| `primeIdealCount_effective` | `K = ℚ`, `x = 100` | `25` | `Li(100) = 29.081` | ✓ |
| `zetaEntireCompletion` | `s = 0`, `s = 1` | `1`, `1` | pole terms `−(s − 1) + s = 1` | ✓ |

## Not verifiable

- Titchmarsh, *The Theory of the Riemann Zeta-Function*, 2nd ed. (sampled 7.6: Theorem 9.4, printed p. 214; also §5.1, §§9.2–9.4): a publisher text with no open copy and no cache entry. I checked the corollaries of 7.6 from 7.5 instead (table).
- Lang, *Algebraic Number Theory* (`lang1994`, sampled 8.4: XVII §3, Theorem 3.1): settled as uncertified. I checked the formula by the contour shift (table).
- Davenport, *Multiplicative Number Theory* (`davenport2000`, §§11–20, cited in 5.5, 6.4a, 7.5, 8.2–8.7): settled as uncertified; cited by locator.
- Lagarias–Odlyzko (1977), cited in 8.8 as attribution without a theorem number: no open copy; the manifest's `lagarias1979` is a different paper. Nothing in 8.8 rests on it.
- Iwaniec–Kowalski §§5.1–5.2 (3.4, Layer 2): no open copy; the exponent of 3.4 is recomputed in the previous review's table and unchanged at this head.

## Source issues

- **Misprint** in montgomery-vaughan2006 at §10.2, the sentence before Corollary 10.18, printed p. 352: the source says the corollary comes from logarithmic differentiation of identity (10.31), which is the growth bound; it should be (10.32), the Hadamard product of Theorem 10.16; affects nothing.
- **Misprint** in montgomery-vaughan2006 at §10.2, the sentence before (10.33), printed p. 351: the source refers to (10.18) as the definition of `ξ(s, χ)`; it should be (10.19) of Corollary 10.8, since (10.18) is the incomplete-gamma series of Theorem 10.7; affects nothing.
- **Gap** in trudgian2015 at Theorems 1 and 2, proofs §§4–5: the source treats one of the parameter inequalities of its argument as redundant; it should be verified, as Bennett–Martin–O'Bryant–Rechnitzer §1 and Hasanalizade–Shen–Wong §1 point out; affects a stated result; corrected in print at bennett2021 Corollary 1.2 (Dirichlet) and hasanalizade2022 Theorem 1.1 (Dedekind).
