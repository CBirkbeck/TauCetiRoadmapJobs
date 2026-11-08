# Review of ExplicitZetaBounds (pull request #1954 at fcc94b0)

**Verdict:** needs changes

This is an incremental re-review of the 145 lines that changed since 1f1a271. There are five findings: two P2 and three P3.

- **R01 (P2), new.** 7.5's new "form for a modulus" duplicates the theorem that ExplicitPrimeCounting §6.1 proves.
- **R02 (P2), carried from the previous R04.** The polynomial certificates are still handed back and forth with ExplicitNumberFields.
- **R03 (P3), new.** The rewritten 7.2 says Ford's bound times `log t` decreases; in fact it increases.
- **R04 (P3), new.** The new 7.5 Check uses a constant that the form for a modulus does not allow modulo 6.
- **R05 (P3), carried from the previous R06.** ExplicitPrimeCounting still cites the deleted §8.2.

The repair of the old R01 (7.4 and 7.10 under `RH(30 610 046 000)`) is correct: I recomputed every number in it. The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with 24 `sorry` warnings and nothing else.

## R01 (P2) — The form for a modulus in 7.5 has two owners

**Location.** `TauCetiRoadmap/ExplicitZetaBounds/README.md`:
- lines 2274–2278: "Hence the form for a modulus: for `q ≥ 1`, `H ≥ 1000` and `0 < C ≤ C₁(k, H)` for the conductor `k` of every character modulo `q`, … satisfies `1 − β ≥ 1/(R log(q|γ|/C))`";
- the Check at lines 2314–2317.

**Claim.** 7.5 states, and gives the route for, the passage from Ramaré–Rumely's region for a conductor to the region for a modulus.

**Witness.** At #1945, head fc7b018, `TauCetiRoadmap/ExplicitPrimeCounting/README.md`:
- lines 3547–3558 prove *RamareRumelyRegion* `q H C₁(q)` "proved here from ExplicitZetaBounds §7.5", with the same three steps (imprimitive zeros, `k_χ ≤ q`, a positive logarithm);
- its gap at line 474 asks only for the conductor form.

**Repair.** One owner.
- **Preferred:** delete "Hence the form for a modulus … only grows." (lines 2274–2278) and the Check "The form for a modulus is weaker …" (lines 2314–2317). 7.5's fifth item then matches the text of #1945's `gap:dirichlet-zero-free-constants` (line 474) exactly, and #1945 keeps the passage in its §6.1.
- **Alternative:** keep the form here. #1945 §6.1 then cites §7.5 for *RamareRumelyRegion* at `C = C₁(q)`, which is allowed because `C₁(q) ≤ min_χ C₁(k_χ, H)`, instead of proving it. The Check must then be repaired as in R04.

**Tested.** At `q = 8`, `H = 10⁴`, `C = C₁(8)` (the instance #1945 uses for *ModEightFiniteInput*), the form for a modulus here gives exactly the conclusion of #1945's theorem. `roadmaps grep` finds no third roadmap stating it.

## R02 (P2) — The Dedekind polynomial certificates are still handed back and forth (the previous R04)

**Location.** `TauCetiRoadmap/ExplicitZetaBounds/README.md` lines 184–190: "the nonnegative trigonometric polynomials for Dedekind zeta functions that `ExplicitNumberFields` uses … by the Conventions it is named with that theorem".

**Claim.** ExplicitNumberFields names these certificates itself.

**Witness.** At #1944, head 4198f62 (unchanged since the last review), `TauCetiRoadmap/ExplicitNumberFields/README.md`:
- lines 516–519: "What ExplicitZetaBounds must provide (gap:nonnegative-trig-polynomials): the three polynomial certificates … Required location: §0.5";
- lines 119–120 repeat this.

**Repair.** Unchanged from the last review.
- **Preferred:** #1944 withdraws the gap and names its Dedekind and `dglsw2025` certificates with its own theorems (its 4.5–4.8), citing 7.3 here for `F₁₆` and Kadiri's `(0.91 + cos φ)²(0.265 + cos φ)²`. This pull request's description names that head.
- **In this package, if #1944 does not move:** add the three certificates to 0.5 by name and locator, and delete the hand-back in lines 184–190.

**Tested.** `dglsw2025` still occurs nowhere in this README, and no third roadmap states these polynomials (`roadmaps grep`).

## R03 (P3) — 7.2 says Ford's bound times `log t` decreases, but it increases

**Location.** `TauCetiRoadmap/ExplicitZetaBounds/README.md` lines 2028–2029: "(Theorem 4, lines 104–106: the bound of Theorem 3 times `log t` decreases in `t`, and below `5.45·10⁸` the hypothesis applies)".

**Claim.** Theorem 4 follows from Theorem 3 because the width of (1.8) times `log t` decreases in `t`.

**Witness.** With `log 3`, the width times `log t` takes these values, increasing towards `6 · 0.04962 = 0.29772`:

| `log t` | 20.116 | 25 | 40 | 100 | 1000 |
|---|---|---|---|---|---|
| width · `log t` | 0.118151 | 0.127921 | 0.152494 | 0.206380 | 0.280841 |

If the product decreased, Theorem 4 (`≥ 0.118147`) would fail above `5.45·10⁸`.

**Why it matters.** The README's own Check at lines 2056–2058 uses the minimum at `5.45·10⁸`, which only makes sense if the product increases. Ford's line 104 makes the same slip (Source issues). Anyone formalizing the step as written would be trying to prove a false monotonicity lemma.

**Repair.** Write "the bound of Theorem 3 times `log t` increases in `t`, from `0.118151` at `t = 5.45·10⁸`, which exceeds `1/8.464 = 0.118147`".

**Tested.** I evaluated Ford's exact `c₆` with step `10⁻⁴` in `log t` on `[20.116, 22.116]`, then with step `0.01` to `log t = 620.1` (with `log 3`) and step `0.005` to `1020.1` (with `log 0.618`). The product increases throughout.

## R04 (P3) — The new 7.5 Check applies the form for a modulus modulo 6 at a constant it does not allow

**Location.** `TauCetiRoadmap/ExplicitZetaBounds/README.md` lines 2314–2317: "modulo `6`, for the character induced by `χ₋₃` (`k = 3`) at `|γ| = 10⁴` with `C = 20.92`, it gives `1/(R log(6·10⁴/20.92)) = 0.013022`".

**Claim.** `C = 20.92` is admissible in the form for a modulus at `q = 6`, `H = 10⁴`.

**Witness.** The form needs `C ≤ C₁(k, H)` for every conductor modulo `6`, including `k = 1`. From the source's `C₁(1, 5.45·10⁸) = 38.31` (line 845) we get `G(1.01814) = 0.73057`. Since `G` is decreasing (Lemma 3.6.1) and `G₁/G₂` is increasing in `G`, `C₁(1, 10⁴) ≤ 20.114 < 20.92`.

**Repair.** This applies if the form stays (R01, alternative); under R01's preferred repair the Check goes with the form.
1. State the Check at `C = 9.14`. This value is at most `C₁(k, H)` for every `k ≥ 1` and `H ≥ 1000`: with `G = 0` at `Δ(1, 1000) = 0.061871`, `C₁ ≥ 9.149` (the source says the same at line 867). It gives `1/(R log(6·10⁴/9.14)) = 0.011795`, against `0.014264` for the conductor form.
2. Add as a negative control that `20.92 = C₁(3, 10⁴)` is not admissible modulo `6`, because `C₁(1, 10⁴) ≤ 20.12`.

#1945's Check at its lines 3604–3608 uses the same `20.92` at moduli `3` and `6`.

**Tested.**
- `G₁/G₂ = (a + bG)/(c + dG)` with `bc − ad = 1/x² > 0`, so the ratio increases in `G` at every `Δ`.
- `Δ(1, 10⁴) = 0.043564`.
- With `G ∈ [0, 0.73057]`, `C₁(1, 10⁴) ∈ [10.816, 20.114]`.

## R05 (P3) — ExplicitPrimeCounting still cites the deleted §8.2 (the previous R06)

**Location.** Layer 8 runs 8.1, 8.3, 8.4, 8.5. Ramaré's density theorem is under "Not owned here" (`TauCetiRoadmap/ExplicitZetaBounds/README.md` lines 154–165).

**Witness.** At #1945, head fc7b018, `TauCetiRoadmap/ExplicitPrimeCounting/README.md` line 4279: "ExplicitZetaBounds states neither form (its §8.2)".

**Repair.** #1945 line 4279 cites "ExplicitZetaBounds, Scope and ownership, Not owned here". This pull request's description records the change. The README needs no change.

**Tested.** `grep -n "^### 8\." README.md` lists 8.1, 8.3, 8.4 and 8.5 only.

## Previous findings

- R01 — repaired: README line 2176 reads "Given `RH(30 610 046 000)` (0.4), prove: `ζ(σ + it) ≠ 0` for `|t| ≥ 3`…", and line 2458 is the same for 7.10. `Suggested.lean` lines 247 and 321 match. 7.3's `5.573412` instance covers `20.12 ≤ L < 40.898`.
- R02 — repaired: #1946, head 556188c, lines 133–134 read "the bounds for `1/ζ` that the route of Lee–Leong's bound of 1.9 uses are ExplicitZetaBounds §7.10's"; its contract (lines 489–495) cites §7.10. The claim "This roadmap owns them" is gone.
- R03 — repaired: #1945, head fc7b018, lines 418–420 read "Ramaré–Rumely's region with the constant `C₁(k, H)` is that roadmap's (its §7.5, fifth item…), and §6.1 takes it from there". The repair crossed with 7.5's new form for a modulus (R01).
- R04 — not repaired: README lines 184–190 still say the Dedekind certificates belong to ExplicitNumberFields. #1944, head 4198f62, lines 516–519 still ask §0.5 for them (R02).
- R05 — repaired: 4.5's third bound now assumes "`f'` decreasing there, `f'(b) = α`, `f'(a) = β`, `0 < λ₂ ≤ |f''| ≤ h₂λ₂` and `|f'''| ≤ h₃λ₃` on `[a, b]`", with no stationary point. These are Lemma 2.3's hypotheses (`patelyang2024` lines 667–671).
- R06 — not repaired: #1945, head fc7b018, line 4279 still reads "ExplicitZetaBounds states neither form (its §8.2)" (R05).

## Verified sound

**Gate, order and Lean.**
- **Gate.** I ran it at fcc94b0. Every check is `0` and it ends `OK`; `dirty=0` and `outside-folder=0`.
- **Dependency check.** `depcheck: 244 roadmaps, 2465 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Merge order.** ZerosOfLFunctions is at 85, SieveMethodsAndPrimePatterns 269, this roadmap 270, and the four Explicit* consumers 271–274.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives 24 `declaration uses 'sorry'` warnings and no errors.
- **Signatures.** I put `#check @` for all 33 declarations in one scratch file. There is no `variable` block, so no binder can be lost. The changed theorems elaborate to:
  - `RiemannHypothesisUpTo 30610046000 → ∀ s, 3 ≤ |s.im| → 1 - log(log|s.im|)/(21.233 log|s.im|) < s.re → riemannZeta s ≠ 0`;
  - `RiemannHypothesisUpTo 30610046000 → ∀ t, 3 ≤ t → ‖ζ(1 + tI)‖⁻¹ ≤ 431.7 log t / log(log t)`.

  Both match README 7.4 and 7.10.
- **Docstring.** The module docstring's list of hypotheses (lines 44–47) matches the Lean:
  - `545439823` at lines 262 and 281;
  - `30610046000` at 247, 321, 340 and 358;
  - `3 * 10 ^ 12` at 236, 291, 389 and 400.
- **Padding probe on the two changed theorems.** `first | rfl | (simp; done) | (norm_num; done) | positivity | infer_instance | (intros; simp_all; done) | exact le_rfl | decide` leaves both open. The other 22 theorems are unchanged; the last review probed them.
- **Headlines.** The list is unchanged. 7.4's docstring now states the route that the README gives.

**Sources for the changed passages (each read at the cited lines).**
- `patelyang2024` Lemmas 2.2–2.3:
  - lines 475–477 (`c ∈ [a, b]`);
  - lines 667–671 (no stationary point; `4.686/√λ₂`);
  - (2.32)–(2.33) at lines 672–700 (Lemma 2.2 applied to `f(x) − νx` for `α + 1/2 < ν < β − 1/2`).
- `ford2002zerofree`:
  - Theorem 3 at lines 96–103, with `T₀ = 5.45·10⁸`, `J = min(L/4 + 1.8521, L/6 + log L + log 3)` and `c₆` as in the README;
  - (9.9) at line 1343 (`M₀ = 0.675`, `c₇ = 0.155`);
  - lines 104–106 (R03), 324 and 1272.
- `yang2024`:
  - lines 77–80 ((1.4) with `log 0.618`, for `|t| ≥ 3`);
  - lines 88–89 (Corollary 1.2);
  - lines 2326–2372 (`t₀ = e^{170.2}`, `M₁ = 0.0470978`, the step at `t₀ − 1 ≤ t' < t₀`).
- `mty2024` lines 107–119; `bellotti2025density` lines 350–356.
- `mossinghofftrudgian2015`: Theorem 1 at lines 117–118 (strict form for `|t| ≥ 2`), and line 265 (`T₀ = 3.06·10¹⁰`, `θ = 1.85573`, `r = 5`).
- `platt2017zeros` lines 524–528 (Theorem 5.1, `|ℑρ| ≤ 3.0610046·10¹⁰`).
- `hiaryleongyang2025`:
  - lines 41–43;
  - lines 1013–1017, where Yang's Corollary 1.2 is the only zero-free input;
  - lines 1157–1180 (`t₀ = 500`; `2.079 log t` for `2 ≤ t ≤ 500` by interval arithmetic).

  So `RH(30 610 046 000)` is all that 7.10's first item needs.
- `ramare-rumely-1996` lines 640–867: (3.6.4)–(3.6.7), Lemma 3.6.1, Theorems 3.6.2–3.6.3, line 843 (`R ln(k|γ|/C₁(χ)) ≥ 15`) and the examples at lines 845–849.
- **Seeded sample.** In the changed passages it falls on 0.4, which 7.4 and 7.10 cite (Platt's Theorem 5.1, above), and on 7.5 (fifth item). The other targets of the sample are untouched and were verified in earlier rounds.

**Cross-roadmap citations resolved at the current heads.**
- #1945 at fc7b018: lines 418–420, 474, 3547–3608 and 4279.
- #1946 at 556188c: lines 128–137, 476–520 and 1739–1771.
- #1944 at 4198f62: lines 116–120 and 516–519.
- #1948 at 7dbb08f: its citations of 4.2 and 6.5 are unchanged.
- `roadmaps grep` for `C₁(k, H)`, *RamareRumelyRegion* and `zeta-reciprocal-bounds` finds only this roadmap, #1945 and #1946.

**Remarks on untouched text (no change requested).**
- **#1946's new supplier gap.** At 556188c (its lines 498–520), #1946 declares `gap:zeta-reciprocal-bounds` on this roadmap, which the intake will announce here. The gap asks for:
  - Leong's `|ζ'/ζ| ≤ 10.175 log t` row;
  - the `(13, 1719)` row of Table 4;
  - a bound for `|t| ≤ 14`.

  Separately, the Downstream consumers paragraph (lines 2802–2806) still lists "on `σ ≥ 1` for `t ≥ 13`" and "in the classical region from `t = 13`" among what #1946 takes. #1946's line 493 says these do not serve its route.

**Adversarial table.** I computed the new rows with my own double-precision code. `ζ` was checked against `ζ(2)` and against `|ζ(1/2 + 14.134725142i)| = 2.1·10⁻¹⁰`. Rows marked "r4" are carried from the review at 1f1a271, for statements this diff leaves untouched.

| Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|
| 4.5, second bound with `c ∈ (a, b)` | `c = a` | `f'(a) = 0`: the source's term `1/|f'(a)|` is infinite, while Lean's `1/0 = 0` would make it false; for interior `c`, `f'(a) > 0 > f'(b)` | sound | — |
| 4.5, third bound | `x/2 − x²/(8M)`, `M = 100` | no integer in `(1/4, 1/2]`; `|S| = 1.12151 ≤ 101.0106` | sound | old R05 repaired |
| 4.5, third bound | `−x²/(2M)`, `M = 100`, `ν = 0`, `x₀ = 0` | `|S − e(−1/8)·10| = 3.4·10⁻¹⁴ ≤ 54.608` | sound | — |
| 4.5, third bound | `(t/2π) log x` on `[50, 100]`, `t = 1000`, `ν ∈ {2, 3}` | `|S − dual| = 1.46342 ≤ 288.897` | sound | — |
| 7.2, exact form with `log 3` | `t = 5.45·10⁸` | `J = 6.881174` (first branch), `c₆ = 0.0025072`, width · `log t = 0.1181506` against `1/8.464 = 0.1181474` | sound | — |
| 7.2, branch crossing with `log 3` | — | at `log t = 32.8682`, `t = 1.8814·10¹⁴` | sound | — |
| 7.2, passage to Theorem 4 | width · `log t` for `log t ∈ [20.116, 620.1]`, and at `10⁴` | `0.118151 → 0.127921` (25) `→ 0.152494` (40) `→ 0.206380` (100) `→ 0.280841` (1000) `→ 0.29547` (`10⁴`) | increases; the prose says "decreases" | R03 |
| 7.2, exact form implies simplified | `c₆ < 0.0196/(J + 1.15)` on `[32.87, 1032.87]` (`log 3`) and `[20.116, 1020.1]` (`log 0.618`), step `0.05`; `t = 10¹⁰` | no failure; `J = 6.492993`, `c₆ = 0.0021981 < 0.0025644`; widths `0.0061956` / `0.0061397` | sound | — |
| 7.2, `log 0.618` | which branch is the minimum; simplified width below `5.45·10⁸` | `log L − L/12 ≤ 1.48491 < 2.33337`; largest width `0.058327` at `t = 3` | sound | — |
| `riemannZeta_ne_zero_littlewood` (7.4), coverage | `L ≤ 24.1446`; `L = 24.1446` | boundary `≥ 0.982674`, right of `1/2`; `5.573412` region `0.0074312 ≥ 0.0062108` | sound | old R01 repaired |
| 7.4, containment ranges | `5.573412` region; Ford exact; simplified; check on `[41, 170.2]`, step `0.01` | contains up to `L = 45.1367`; Ford exact on `[40.8979, 185.644]`; simplified on `[50.1325, 170.2635]`; no failure | sound | — |
| 7.4, `L = 47`; `L = 100` | — | at 47: `0.0038276` (`5.558691`), `0.0038175` (`5.573412`), `0.0038581` (required), `0.0038820` (Ford exact); at 100: simplified `0.0021959 ≥ 0.0021689` | sound | — |
| 7.4, Yang's step at `t₀ = e^{170.2}` | `M₁ = 0.0470978` | needs `0.0014215052`; exact `0.0014271`; simplified `0.0014214873` (would need `M₁ ≤ 0.0470972`) | sound (Source issues) | — |
| 7.4, negative control | `t = 10¹⁰`, given only `RH(5.45·10⁸)` | claimed `0.0064156`; available `0.0061956` / `0.0061397` / `0.0051311` | sound | — |
| 7.5, form for a modulus | `q = 6`, `H = |γ| = 10⁴` | `C = 20.92`: `0.013022`, but `C₁(1, 10⁴) ∈ [10.816, 20.114]`; `C = 9.14`: `0.011795`; conductor form `0.014264` | the form is sound; the Check's constant is not allowed | R01, R04 |
| 7.5, positivity and monotonicity | `k ≤ q`, `C ≤ C₁(k, H)` | `q|γ|/C ≥ k|γ|/C₁ > 1`; `R log(k|γ|/C₁) ≥ 15` (line 843) | sound | — |
| `inv_norm_riemannZeta_one_add_le` (7.10) | `t = 3, 13, 100, 500, 1000, 10⁴` | `1.56747, 1.37875, 0.61190, 0.88622, 1.06155, 1.29873` against `5042.87, 1175.54, 1301.78, 1468.52, 1543.00, 1790.77` | sound; the hypothesis now suffices | old R01 repaired |
| `RiemannHypothesisUpTo` (0.2) | `H < 0`; strip dropped; imprimitive law at `q = 2` | vacuous; `ζ(−2) = 0`; zero `2πi/log 2` at height `9.0647` | sound (r4) | — |
| 0.4 and `riemannSiegelTheta` | Platt's count; `T = 100, 14, −100`; minimum | `103 800 788 359` zeros; `87.97217`, `−1.78295`, `−87.97217`; min `−3.53097` at `6.2898` | sound (r4) | — |
| 2.9 bracket | `T·excess` on `[e, 10⁴]` | max `0.006771 < 1/40` | sound (r4) | — |
| `norm_Gamma_bounds` (2.5) | 3000 random `s`; `s = 1/2 + 10i` | least log-margins `5.9·10⁻¹⁰` / `4.2·10⁻⁴`; `|Γ| = 3.7775321·10⁻⁷` | sound (r4) | — |
| 2.1, 2.3, 2.7 | Brent `k = 1`; `z = 1`, `10i` | `π/2 < √π`; `0.0772 ≤ 0.125`, `0.000834 ≤ 0.003536` | sound (r4) | — |
| `norm_LFunction_le_rademacher` (3.2) | four characters, `η ∈ {0.05, 0.25, 0.5}` | largest ratio `0.585` | sound (r4) | — |
| 3.5 | constant `F`; `e^{az}`; growth `π` | `1`; `a/2 = a/2`; `0` on both lines | sound (r4) | — |
| 4.2 | `b = (1, 1)`, `H = 2`; `(1, −1)` | `16 ≤ 18`; `0 ≤ 6` | sound (r4) | — |
| 4.3 | Patel at `L = 10`, `V = 2`, `W = 3` | `32.907 ≤ 41.362` | sound (r4) | — |
| `norm_riemannZeta_criticalLine_le` (4.7) | `t ∈ [3, 60]` | largest ratio `0.82103` | sound (r4) | — |
| `norm_riemannZeta_one_add_le` (4.8) | `t ∈ [3, 60]` | `0.64429` (Patel), `0.48520` (HLY) | sound (r4) | — |
| `vinogradovCount`, `vinogradovCount_le_ford` (4.9a) | `J₂,₁(2)`, `J₂,₂(3)`, `J₃,₃(2)`; `k = 1000` | `6, 15, 20`; `Δ_s = 11 343.29` | sound (r4) | — |
| `norm_riemannZeta_le_richert` (4.10) | grid in `σ`, `t`, `u` | largest ratio `0.010496` | sound (r4) | — |
| `abs_zetaZeroCount_sub_le(_of_recorded)` (5.2) | `T = e, 100, 1000` | `0.795`, `0.873`, `1.259`; right sides `8.184`/`3.886`, `8.921`/`4.482`, `9.252`/`4.791` | sound (r4) | — |
| `dirichletZeroCount_explicit` (5.3) | `χ₄`, `T = 10` | `N = 2 ∈ [0.777, 5.140]` | sound (r4) | — |
| `riemannZeta_ne_zero_classical` (7.3) | `|t| = 2`, `3·10¹²` | `σ ≥ 0.740461`, `0.993738` | sound (r4) | — |
| `LFunction_zeroFree_mcCurley`, `LFunction_ne_zero_kadiri` (7.5) | `q = 3` | `0.905635`; `0.837457` | sound (r4) | — |
| 7.5, Ramaré–Rumely conductor form | `k = 1`, `|γ| = 1000`; `k = 3`, `|γ| = 10⁴` | `0.022085`; `0.014264` | sound (r4) | — |
| `riemannZeta_ne_zero_vinogradovKorobov` (7.6) | `|t| = e^{1000}` | `9.5052·10⁻⁵` | sound (r4) | — |
| `LFunction_real_zero_le_bordignon` (7.7) | `q = 4·10⁵` | `0.0076021`; `0.00095026` | sound (r4) | — |
| `LFunction_real_ne_zero_luZamanZhao` (7.8) | `q = 10¹⁰`; `q = 4` | `[0.991314, 1)`; `L(0.85573, χ₄) = 0.75592` | sound (r4) | — |
| `zetaZeroCountRight_le_kadiri` (8.1) | `T = 3.061·10¹⁰` | `1.70220·10¹⁰`, `1.35323·10¹⁰` | sound (r4) | — |
| `zetaZeroDensityCount_nine_tenths_lt` (8.3) | `T = H₀` | `1.9139·10⁸` | sound (r4) | — |
| `primitiveLZeroCount_le_thornerZaman` (8.4) | `Q = 3`, `σ = 39/40` | `log₁₀` of the bound `99.706` | sound (r4) | — |
| `zetaZeroDensityCount_le_bellotti` (8.5) | `T = 10¹³`, `σ = 0.9927` | `2.2230·10¹¹` | sound (r4) | — |
| `norm_LFunction_one_le_ramare` (9.1) | `q = 3, 5, 8` | `0.604600 ≤ 1.257547`; `0.430409 ≤ 0.804719`; `1.110721 ≤ 1.220554` | sound (r4) | — |
| `norm_LFunction_one_ge`, `LFunction_one_ge_luZamanZhao` (9.3) | quartic modulo `5`; `q = 3` | `0.888577 ≥ 0.222066`; `0.604600 ≥ 0.113780` | sound (r4) | — |

## Not verifiable

- **The line locators of `leong2026` and `leeLeong2022` in 7.10's second to fourth items.** These items are unchanged. The worker's cache still has no text for either, and the last review checked them against the arXiv v5 PDFs by theorem and equation number.
- **Ownership against open pull requests.** I checked it against the four Explicit* heads and, by `roadmaps grep`, against the 478 open roadmap pull requests. Nothing here is unverifiable.

## Source issues

- **Misprint** in `ford2002zerofree` at the remark between Theorems 3 and 4, p. 3: the source says the right side of (1.8) times `log t` is decreasing in `t`; it should be increasing (`0.118151` at `T₀`, tending to `0.2977`), which is what Theorem 4 needs; affects the proof.
- **Gap** in `yang2024` at the proof of Corollary 1.2, p. 42: the source says (1.4) gives `1 − β' ≥ M₁ log log t₀/log t₀` for zeros with `t₀ − 1 ≤ t' < t₀`, and prints the inequalities reversed; (1.4) gives only `0.00142149 < 0.00142151`; it should use Ford's exact Theorem 3 (`0.0014271`) or `M₁ ≤ 0.0470972`; affects the proof.
