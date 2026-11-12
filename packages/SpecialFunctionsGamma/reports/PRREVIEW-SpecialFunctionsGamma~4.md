# Review of SpecialFunctionsGamma (pull request #2191 at 64d932a)

**Verdict:** needs changes

## R01 (P3) — Two ownership statements still claim 5.8.2

**Location:** `TauCetiRoadmap/SpecialFunctionsGamma/README.md:57` "2. **Series and products** (DLMF §§5.7–5.8 without 5.7.6 on `Re z > 0`, 5.8.1 and 5.8.3), and DLMF 5.15.1."; `README.md:161–164`, the boundary sentence.

**Claim:** The previous R01 moved 5.8.2 to GlobalHolomorphicFunctions 6.1. The completion list at line 57 still includes 5.8.2. The boundary sentence also still claims it: 5.8.2 is not in the pins, is not consumed, and is not in the sentence's list of exclusions.

**Witness:** `README.md:151`, under "What it does not own": "The Weierstrass product 5.8.2 (GlobalHolomorphicFunctions 6.1)." Neither pin has a product formula for `Γ`: no `HasProd` in Mathlib `Analysis/SpecialFunctions/Gamma/`, none in Tau Ceti.

**Repair:**
- Line 57: "(DLMF §§5.7–5.8 without 5.7.6 on `Re z > 0`, 5.8.1, 5.8.2 and 5.8.3)".
- Boundary sentence: "…, the continued fraction of §5.10, the Weierstrass product 5.8.2, the decimal values 5.4.7–5.4.10 and the extrema 5.4.20."

## R02 (P3) — The description's build sentence gives the old theorem count

**Location:** Description, **Build.**: "`Suggested.lean` compiles at the pins of main with `sorry` as the only warning (75 theorems)".

**Claim:** This head states 73 theorems, because the repairs of the previous R01 and R03 deleted two. The description's own sentence a paragraph earlier says 73.

**Witness:** `Suggested.lean` has 73 `theorem` lines. `lake env lean` gives 73 `sorry` warnings. The description also says "It states 73 theorems, with the 6 definitions they need".

**Repair:** "… with `sorry` as the only warning (73 theorems), …".

## Previous findings

- R01 — partly repaired: `README.md:151` "The Weierstrass product 5.8.2 (GlobalHolomorphicFunctions 6.1)." The table row now reads "5.8.4–5.8.5 | The balanced products (2.4)", and `hasProd_inv_Gamma` and the 5.8.2 Check are gone. Line 57 and the boundary sentence still claim 5.8.2 (R01 above).
- R02 — repaired: `Suggested.lean:58` "`if t = 0 then 0 else 1 - t * Real.cot t + Real.log (t / Real.sin t)`"; `README.md:709` "with `Φ` the helper `temmePhi`, whose value at the removable point is `Φ(0) = 0`".
- R03 — repaired: `README.md:109–112` lists 5.4.2, the first equality of 5.9.18 and 5.9.19 for `n ≤ 1` as inputs, with their pinned names. `doubleFactorial_odd_eq_Gamma` is deleted, and `eulerMascheroni_eq_integrals` now has three conjuncts.
- R04 — repaired: `README.md:1053` "`1/10 + 1/200 + 1/6000 − 1/3000000 = 0.1051663333333`".
- R05 — repaired: `README.md:1096–1100` "splits the integral at `g = 1`. On `{g > 1}`, `g^s ≤ g^{s*}` for `s < s*` … On `{g ≤ 1}`, the Taylor coefficients at `s*` are `∫ w g^{s*} (log g)^k`, of sign `(−1)^k`".
- R06 — repaired: `README.md:992–993` "(DLMF §5.15, opening paragraph: `ψ⁽ⁿ⁾` is the `n`-th derivative of `ψ`, `n ≥ 1`)".
- R07 — repaired: `README.md:222` "(6.3, 8.4)"; `224` "(8.3)"; `233` "(3.4, 4.1, 4.4, 5.2, 7.3)"; `1049` "*Needs:* 7.2; AsymptoticExpansions 1.1, 1.3, 4.1–4.3; Mathlib `bernoulli`."
- R08 — repaired: `README.md:163–164` "the continued fraction of §5.10, the decimal values 5.4.7–5.4.10 and the extrema 5.4.20". Lines 153–154 list the decimal values.
- R09 — repaired: the description's Overlaps now reads "(its 1.1–1.2, 2.4–2.5, which the README names) … (its 1.3)". On main gains GlobalHolomorphicFunctions 6.1, the Mathlib list gains 5.4.2, 5.9.18 and 5.9.19, and Layer 2 no longer names 5.8.2. The Build count is new (R02 above).

## Verified sound

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| 4.3 `temmePhi`, as changed | `t = 0, 0.1, 1, 3, −2, π`; 19999-point grid on `(−π, π)` | Lean `temmePhi 0 = 0` by `simp`; `Φ(0.1) = 0.0050028` against `t²/2 = 0.005`; `0.53051`, `25.1025`, `2.70355`; grid minimum `0` at `t = 0`; Lean junk `temmePhi π = 1`, on a null set | holds |
| 4.3 `inv_Gamma_eq_temme`, with the new helper | `z = 1`, `2.5` | `0.99999999999999` / `1`; `0.75225277806364` / `0.75225277806368` | holds |
| 4.4 `eulerMascheroni_eq_integrals`, three conjuncts | — | `0.57721566490154`, `0.57721566490153`, `0.57721566490111` / `γ = 0.57721566490153` | holds |
| Input 5.4.2 (pinned names) | odd `k = 0…3`; even `n = 0…3` | `(2k+1)‼ = 1, 3, 15, 105` against `π^{−½}2^{k+1}Γ(k+3/2)`, the same values; `(2n)‼ = 1, 2, 8, 48 = 2ⁿn!` | holds |
| Input 5.9.19 at `n ≤ 1`, against `iteratedDeriv_Gamma_eq_integral` | `n = 1`, `z = 1` | `−∫ e^{−t} log t = 0.57721566490154 = γ`; the pinned integrand `t^{s−1}(log t·e^{−t})` is the target's at `n = 1` | holds |
| 7.3 Check | `n = 1`, `z = 10`, `k ≤ 2` | `ψ′(10) = 0.10516633568169`; partial sum `0.10516633333333`; difference `2.348·10⁻⁹` against `B₆/10⁷ = 2.381·10⁻⁹`; the old `−1/300000` gives `0.10516333` | holds |
| 7.1 locator | DLMF §5.15, opening paragraph; `ψ″(1)` | the page calls the functions `ψ⁽ⁿ⁾`, `n ≥ 1`, the polygamma functions; `polygamma 2 1 = −2ζ(3) = −2.4041138` | holds |
| 8.1 Landau proof note | 8.5 at `n = 2`, `g = 4 sin²((θ₁−θ₂)/2)`, `s* = 0`, `k = 1` | `{g ≤ 1}`: `−25.5088`, sign `(−1)¹`; `{g > 1}`: `+25.5083`; total `≈ 0` (exactly `0`), so only the split gives a constant sign; `g = 4`, `s = −0.3`: `0.660 ≤ 1` | holds |
| 5.8.2 (R01), as GlobalHolomorphicFunctions 6.1 states it | `z = 1`, partial products `(N+1)e^{−H_N}` | `N = 10⁶`: `0.56145976` / `e^{−γ} = 0.56145948` | owner on main; R01 |

All other rows stand as in the previous review, of `b0ab817`.

- Sources: through the sources service, DLMF §5.4 (5.4.2, line 98), §5.8 (5.8.2, line 79) and §5.15 (opening, lines 53–57; 5.15.8, line 255). The changed formulas and the 7.1 locator agree with them.
- Pinned Mathlib `1b1ccf4`, opened and `#check`ed:
  - `Real.Gamma_nat_add_one_add_half` (`Gaussian/GaussianIntegral.lean:329`);
  - `Real.eulerMascheroniConstant_eq_neg_integral_log` (`Harmonic/GammaDeriv.lean:97`);
  - `Complex.hasDerivAt_Gamma_of_re_pos` (`Gamma/Deriv.lean:65`);
  - `Complex.Gamma_eq_integral` (`Gamma/Basic.lean:319`), `Complex.Gamma_nat_eq_factorial` (`:325`);
  - `Nat.doubleFactorial_two_mul` (`DoubleFactorial.lean:60`).
- Cross-roadmap citations:
  - GlobalHolomorphicFunctions 6.1 on main (`README.md:1874–1878`) states 5.8.2 for every `z`.
  - The contract use-sites match the *Needs:* lines at `README.md` 578, 618, 668, 755, 832, 914, 951, 971, 1049, 1157–1158 and 1184.
  - No roadmap, on main or open, cites the dropped `hasProd_inv_Gamma` or `doubleFactorial_odd_eq_Gamma`.
- Gate:
  - The worker's run reports every check 0, the build included.
  - My run reports the same except `depcheck: NOT IN ORDER`: the configured order lacks this roadmap, and the candidate order lists it after ExplicitNumberFields.
  - The dependency check with the candidate order gives "depcheck: 206 roadmaps, 1899 edges, 0 problem(s)".
  - Nothing changed outside the folder.
- Elaboration:
  - `lake env lean` of `Suggested.lean` gives 73 `sorry` warnings and nothing else.
  - `#check` of `eulerMascheroni_eq_integrals`, `inv_Gamma_eq_temme`, `iteratedDeriv_Gamma_eq_integral` and `hasProd_balanced` matches the README; no binder is lost.
  - `simp`, `norm_num`, `rfl` and `constructor <;> simp` do not close `eulerMascheroni_eq_integrals`.
- Overlap check: the three closest-roadmap lists are unchanged since `b0ab817`. Their scope was read then: SpecialFunctionsGeneralizedHypergeometric, SpecialFunctionsStruve, SpecialFunctionsBessel, SpecialFunctionsConfluent, SpecialFunctionsAppell, SpecialFunctionsHypergeometric, SpecialFunctionsAiry, SpecialFunctionsParabolicCylinder and SpecialFunctionsEiLiErfIncompleteGamma. The change adds no object. The shared objects keep the owners recorded then. 5.8.2 is now GlobalHolomorphicFunctions 6.1's, and it is cited.
- Remark on untouched text, no change asked: the 4.4 route at `README.md:752` still derives the first equality of 5.9.18, which is now an input. It leaves the second equality's integration by parts on `(0, 1)` and `(1, ∞)` implicit.
- Remarks on untouched text, no change asked:
  - `Complex.Gamma_nat_eq_factorial` (`README.md:94`, `109`) is not under "From Mathlib".
  - Line 56's "§5.4" includes 5.4.7–5.4.10 and 5.4.20, which lines 153–154 exclude.

## Not verifiable

- DLMF §5.9 (5.9.18, 5.9.19): this round the sources service resolves the page to the Figure 5.9.1 PDF. These formulas were read at `b0ab817` and are recomputed above.
- Widder, *The Laplace Transform* (1941), Chapter II, §5, Theorem 5b, p. 58 (Landau's theorem, whose proof note changed): the sources service found no legal copy.
- Titchmarsh, *The Theory of Functions* (1939), §5.81; Andrews–Askey–Roy, *Special Functions* (1999); Temme, *Special Functions* (1996): unchanged passages, not verifiable for the reasons given at `b0ab817`.

## Source issues

- none
