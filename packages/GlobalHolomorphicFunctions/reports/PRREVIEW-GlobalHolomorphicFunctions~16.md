# Review of GlobalHolomorphicFunctions (pull request #992 at dac43fb)

**Verdict:** needs changes

Incremental re-review of the 55 README lines changed since 2c635f6. The two README findings of the previous review are repaired and the repairs are correct. One P3 finding remains, and it is outside the folder: the pull-request description.

## R01 (P3) — The pull-request description still declares #886 a dependency and describes files the folder lacks

This is R03 of the previous review, first raised in the ninth review. The description is unchanged, and no edit of the folder can repair it.

**Location.** The description of #992 contains:

- "- [ ] depends on: #886";
- "`ProductCotangentTargets.lean` supplies eight actual formula definitions";
- "twenty-eight intentional proof-target admissions";
- the depends-on entry "#886 DifferentialGeometry";
- the merge-order line "#886 (DifferentialGeometry) → **this pull request** (#992)".

**Claim.** DifferentialGeometry #886 must merge first, and the folder holds a companion Lean file with 28 admissions.

**Witness.** `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:27` says "DifferentialGeometry is not a supplier." DifferentialGeometry is on main, so #886 revises it and is never a dependency. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`, and the build gives 22 `sorry` warnings.

**Repair.**

1. Delete the "depends on: #886" line, the #886 depends-on entry and the #886 merge-order line.
2. Delete these passages, which describe content the folder does not have:
   - the `ProductCotangentTargets.lean` passage;
   - the GH4 paired-cotangent proof;
   - the 28/18-admission counts;
   - the ZerosOfLFunctions #253 coordination paragraph (ZerosOfLFunctions is on main).
3. Name the suppliers as the README does: ZerosOfLFunctions, AnalyticNumberTheoryPartI and ConformalMapping, all on main.

**Tested.** The dependency check on this README (under Verified sound) reports `0 problem(s)` and names no open supplier, so the depends-on block is empty after the repair.

## Previous findings

- R01 — repaired: `README.md:1798`–1808 now states `−π tan(πz) = Σ_(n≥0) (1/(z−(n+1/2)) + 1/(z+(n+1/2)))` for `z ∉ ℤ+1/2`, cites `TauCeti.hasSum_cotTerm_two_mul` at `2z`, and names the three targets.
- R02 — repaired: `README.md:2137`–2146 adds three Checks on `C_Δ`: the unreversed clockwise hole (index 2), two disjoint holes about ±1, and the excluded overlapping holes (index −1).
- R03 — not repaired: the description still contains "- [ ] depends on: #886" and "twenty-eight intentional proof-target admissions". It is carried as R01 above.

Neither repair introduced a new problem; the checks are under Verified sound.

## Verified sound

### Gate, build and Lean form

- **Gate.** I ran the push gate on dac43fbb. Every counter is 0, it ends `OK` and exits 0. The worker's run, which includes the targeted build, reports `build=0 OK`.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GlobalHolomorphicFunctions'` is empty.
- **Build.** `lake env lean` on `TauCetiRoadmap/GlobalHolomorphicFunctions/Suggested.lean` exits 0 in 11.7 s with exactly 22 "declaration uses `sorry`" warnings and nothing else. The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`.
- **Lean file unchanged.** `Suggested.lean` and `metadata.toml` are byte-identical to 2c635f6. The signature comparison, the one-tactic probe (0 of 22 close) and the headline list of the previous review therefore stand, and I did not rerun them.

### Dependency check

```text
depcheck: 235 roadmaps, 2265 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The change adds no roadmap supplier: its only new citation is a pinned Tau Ceti declaration.

### The changed passages (5 hunks)

**The new supplier declaration.** `TauCeti.hasSum_cotTerm_two_mul` is at `TauCeti/Analysis/SpecialFunctions/Trigonometric/TanhSeries.lean:64` at the pin. It reads: for `z ∈ integerComplement`, `HasSum (fun n : ℕ ↦ cotTerm z (2 * n)) (π * cot (π * z) − π / 2 * cot (π * (z / 2)))`. Mathlib's `cotTerm x n` is `1/(x − (n+1)) + 1/(x + (n+1))` (`Mathlib/Analysis/SpecialFunctions/Trigonometric/Cotangent.lean:177`), and `ℂ_ℤ` is its notation for `integerComplement` (`:38`).

- The contract at `README.md:284`–287 matches: terms `1/(z−(2n+1)) + 1/(z+(2n+1))`, sum `π cot(πz) − (π/2) cot(πz/2)`, hypothesis `z ∈ ℂ_ℤ`.
- At `z = 0.3+0.2i` the 4·10⁵-term sum is `−0.7092480−0.5877991i` and the closed form is `−0.7092483−0.5877994i`.
- The theorem does not state local uniform convergence, residues or the tangent form, so those remain targets, as `:1807`–1808 says.

**6.1, the half-integer expansion (`:1798`–1808).** Each step, recomputed:

- At `2z` the theorem's term is `1/(2z−(2n+1)) + 1/(2z+(2n+1))`, which is half of `1/(z−(n+1/2)) + 1/(z+(n+1/2))`.
- Its sum is `π cot(2πz) − (π/2) cot(πz) = (π/2)(cot πz − tan πz) − (π/2) cot πz = −(π/2) tan(πz)`.
- Its hypothesis `2z ∉ ℤ` is `z ∉ (1/2)ℤ`, so the README's "Off `(1/2)ℤ`" is exact. The integers are the only points of `ℂ∖(ℤ+1/2)` left, and the README names them as a target.
- At an integer both sides are continuous once the convergence is locally uniform on `ℂ∖(ℤ+1/2)`, so the identity extends. The stated route is sound and does not use the target.
- Numerically the paired sum is `5.0·10⁻⁶` at `z=1`, `0` at `z=0` and `−1.0·10⁻⁵` at `z=−2`, which is the truncation error.

**6.1, the new Checks (`:1866`–1871).**

- `z=1/4`: paired sum `−3.1415914` against `−π`.
- `z=0.3+0.2i`: `−π tan(πz) = −1.8790445−3.1898155i`; paired sum `−1.8790430−3.1898145i`; `π cot(2πz) − (π/2) cot(πz) = −0.9395222−1.5949078i`, exactly half.
- One-sided series: real parts `−7.362`, `−11.970`, `−14.273` at `N = 10², 10⁴, 10⁵` against `−log N = −4.605, −9.210, −11.513`. The difference is constant at `−2.76`, so it diverges like `−log N`.
- Residue at `1/2`: `h·(−π tan(π(1/2+h))) = 0.9999967` at `h=10⁻³` and `1.0000000` at `h=10⁻⁵`.

**6.1, the attribution paragraph and *Needs:* line (`:1873`–1883); Scope (`:83`–86).** Each names the Tau Ceti theorem for the part it proves and keeps the residues, the convergence and the integer values as this roadmap's. I read the three DLMF locators again: dlmf-4-22 line 80 (4.22.2), dlmf-4-22 lines 104–109 (4.22.3, for `z ≠ nπ`) and dlmf-5-8 line 79 (5.8.2).

**6.4, the new Checks (`:2137`–2146).** Winding sums over 4000 segments per circle:

- Annulus: `2.0000` at `0` with `γ₁(t)=e^{−it}` unreversed, `0.0000` after the reversal, `1.0000` at `3/2`.
- Holes of radius 1/2 about ±1 in `|z|<3`: `0, 0, 1, 1, 0` at `1, −1, 0, 2i, 4`. The centres are at distance 2 > 1, so the closed holes are disjoint, and they lie in `D₀`.
- Holes of radius 1 about ±1/2: `−1.0000` at `0`. `|1/2 − (−1/2)| = 1`, so `1/2` is on the circle about `−1/2`, and it is the centre of the other hole, hence interior to the union of the closed holes and off `∂Δ`.
- The sign `σ=−1` for the clockwise circle is ConformalMapping §5.6's own Check (`Completed/ConformalMapping/README.md:943`), and `jordan_index_of_isPiecewiseC1On` (`Completed/ConformalMapping/Suggested.lean:640`) gives index `σ` on `filledHull C \ C` and `0` off `filledHull C`.
- rainer line 1216 (Proposition 10.1, p. 23) still supports the scalar formula.

**Duplication and ownership for the changed object.**

- No statement of a tangent partial-fraction series exists in the pinned Mathlib or Tau Ceti. The nearest are `TauCeti.hasSum_cotTerm_two_mul` and `TauCeti.hasSum_pi_div_two_mul_tanh` (`TanhSeries.lean:64`, `:85`), the latter for real arguments of `tanh`.
- `roadmaps grep --fixed --readme-only` for `hasSum_cotTerm_two_mul`, `π tan(πz)` and `tan(πz)` finds no other roadmap, on main or among the open pull requests. `odd-pole` finds only OperatorTheory SSP-A20, an integral of the expansion, not the expansion.
- `overlaps.md` reports no open pull request that changes this roadmap, no dropped id and no id that only a revision defines. `citations.md` reports no unresolved citation or name.

**The seeded sample.** Of the 15 sampled targets, 6.1 and 6.4 fall in the changed passages and are checked above. The other 13 are untouched; their locators were read in the previous review and stand.

### Adversarial pass

`S` is `Suggested.lean` and `R` is `README.md`. The first five rows are the changed statements, with values computed this round by my own script (series truncated at 4·10⁵ terms, winding sums over 4000 segments). The remaining 32 rows are carried from the review at 2c635f6 for statements the diff leaves untouched.

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| R supplier contract `TauCeti.hasSum_cotTerm_two_mul` (`:284`) | `z = 0.3+0.2i`; `z = 1` | sum `−0.7092480−0.5877991i` against `π cot(πz) − (π/2) cot(πz/2) = −0.7092483−0.5877994i`; excluded by `z ∈ ℂ_ℤ` | Pass | none |
| R 6.1 `−π tan(πz)` expansion (`:1798`) | `z = 0.3+0.2i`, `1/4`, `1`, `0`, `−2`; `z = 1/2` | `−1.8790445−3.1898155i` against `−1.8790430−3.1898145i`; `−π` against `−3.1415914`; `0` against `5.0·10⁻⁶`, `0`, `−1.0·10⁻⁵`; excluded, residue `1.0000000` | Pass | none |
| R 6.1 reduction to Tau Ceti at `2z` (`:1802`) | `z = 0.3+0.2i`; `z = 1` | odd-pole sum at `2z` `−0.9395215−1.5949073i`, closed form `−0.9395222−1.5949078i`, `−(π/2) tan(πz) = −0.9395222−1.5949078i`; `2z = 2 ∈ ℤ`, theorem not applicable, continuity route | Pass | none |
| R 6.1 pairing is necessary (`:1870`) | one-sided series, `N = 10², 10⁴, 10⁵` | real part `−7.362, −11.970, −14.273`; `−log N − 2.76` | Pass | none |
| R 6.4 `C_Δ` Checks (`:2137`) | unreversed clockwise hole; holes about ±1; overlapping holes | `2` at 0, `0` reversed, `1` at 3/2; `0, 0, 1, 1, 0`; `−1` at 0, `1/2` on the trace and off `∂Δ` | Pass | none |
| S Looman–Menchoff (0.2) | `z²` at `1+i`; `z̄`; `exp(−z⁻⁴)`, `f(0)=0`; `Ω=∅` | `f_y = −2+2i = i f_x`; `f_y = −i ≠ i = i f_x` (excluded); at 0 both partials 0, but `|f| = 11.489, 64.388, 2244.077` at `r = 0.8, 0.7, 0.6` on `arg = π/4`, so excluded by `hcont`; vacuous | Pass (review at 2c635f6) | none |
| R 0.2 balanced estimate | `[0,20]×[0,1]`, `E` = two corners, `N = 1`, `φ = y(20−x)c(x)` | left side `193.417` against `5N·m(R∖E) = 100`: the aspect-ratio hypothesis `1/2 ≤ w/h ≤ 2` is needed | Pass (review at 2c635f6) | none (source issue) |
| R 0.4 coefficients, radius dependence | `1/(z(z−2))` at `ρ = 1`; `ρ = 3` | `a_{−3..2} = 0, 0, −0.5, −0.25, −0.125, −0.0625`; `a_{−4..1} = 4, 2, 1, 0, 0, 0` | Pass (review at 2c635f6) | none |
| R 0.4 derivative law | `f′` for the same `f`, `ρ = 1` | coefficients in degrees −2, −1, 0: `0.5, 0, −0.125`; `(n+1)a_{n+1}`: `0.5, 0, −0.125` | Pass (review at 2c635f6) | none |
| R 1.1 factor derivatives | `E₂′(−1)`; `log‖E₁(1/2)‖` | `−0.6065307 = −e^{−1/2}`; `−0.193147 ≤ 0.25` | Pass (review at 2c635f6) | none |
| S `exists_entire_genusOne_product` (1.2) | `S = {n²}`, `m = 1`, `z = 2+i`; `S = {1}`, `m = 2`; `S = ∅` | product `−0.4312778−9.3328073i` = `e^{π²z/6} sin(π√z)/(π√z)` `−0.4312778−9.3328073i`, with `Σ1/n⁴ = 1.082323`; `(1−z)²e^{2z} = 0.679570` at `1/2`, order 2 at 1; `F = 1` | Pass (review at 2c635f6) | none |
| S `…_of_divisor` (1.2) | `D = 2[1]`; `D = [1]−[2]`; `D 0 ≠ 0` | divisor 2 at 1; excluded by `hD`; excluded by `hDzero` | Pass (review at 2c635f6) | none |
| R 1.3 log-derivative estimate | `∏_{n≤N}(1−z²/n²)` on `|z−0.5i| = 0.3`, `N = 10, 50, 200` | `sup|P′/P−F′/F| = 0.152, 0.0317, 0.00798` ≤ bound `2.387, 0.513, 0.130`, both → 0 | Pass (review at 2c635f6) | none |
| R 1.3 genus, `p_n = n−1` | `a_n = n`, `R = 3` | `Σ1/n` diverges, `Σ1/n² = 1.6449`: genus 1; `Σ_{n≥7}(3/n)^n = 0.0031` | Pass (review at 2c635f6) | none |
| S sharp bound (1.4) | 5000 random families of size 0–7, with some `u₀ = −1`; `ℤ₃`, `u = (3,3)`; norm `2|z|`, `u = (1,1)`; empty | `max(lhs−rhs) = 4.4·10⁻¹⁶`; `1/3 ≤ 7/9`; `6 ≤ 8` (the exponential form needs `‖1‖ = 1`); `0 ≤ 0`; full proof elaborates | Pass (review at 2c635f6) | none |
| R 1.5 uniform tail | `X = ℕ`, `u_n = [x=n]/(n+1)` | tail at `N = 9` is `0.1`; `Σ_{n<10⁵} sup|u_n| = 12.09`, divergent | Pass (review at 2c635f6) | none |
| R 2.2 metric | constants `1/(n+1)`, `n = 0, 1, 5` | `d = 0.5, 0.333333, 0.142857 = 1/(n+2)` | Pass (review at 2c635f6) | none |
| R 2.3 `O(K)` not closed | `Σzⁿ/(n+1)²` along the radius, `r = 0.9, 0.99, 0.999` | `Σ n r^{n−1}/(n+1)² = 1.238, 3.078, 5.281` → ∞; for `K = {0}`, `z` and `0` have the same value | Pass (review at 2c635f6) | none |
| S `IsRungeCompactPair`, `holomorphicHull`, `holomorphicHull_eq_fill` | `(∅,∅)`; `{2≤|z|≤3}` in `D₄`; same in `{1<|z|<4}`; unit circle in `ℂ∖{0}` | hull `∅` (`B = −1`, `f = 0`); hull = closed 3-disc on both sides; hull = `K` on both sides (`|1/1.5| = 0.667 > 0.5`); hull = `K`, both component closures contain `0 ∉ Ω` | Pass (review at 2c635f6) | none |
| S Runge equivalence (2.5) | annulus in `D₄`, `f = 1/z` | `∮_{|z|=2.5} dz/z = 2πi` against `0` for every `g ∈ H(D₄)`: both sides false | Pass (review at 2c635f6) | none |
| S finite-rank operator (2.5) | `Ω = ℂ`, `K` = closed unit disk, `U = B(0,2.5)`, `L = B̄(0,1.5)`, 60 nodes, `g_j` = 60-term geometric polynomials | `sup_K|f−Af|/sup_L|f| = 1.7·10⁻¹⁶` (`1/(z−3)`), `1.1·10⁻¹⁶` (`e^z`), `4.7·10⁻¹⁶` (`z¹⁰`), `3.1·10⁻¹⁵` (`1/(z+2.6i)`), one operator for all four; `K = ∅`: `L = ∅`, `N = 0` | Pass (review at 2c635f6) | none |
| S zero-free approximation (3.1) | `K = {1≤|z|≤2}`, `Ω = ℂ∖{0}`, `u = z−1/2` | `G_N(1) = 0.6065307, 0.5134171, 0.5000412` for `N = 1, 3, 10` → `0.5`; `G_N = z·exp(L_N)` has no zero on `Ω` | Pass (review at 2c635f6) | none |
| S zero orders; signed divisor (3.1) | `m = 0`; `2[2]`; `ν = 2[0]−[1]` | `f = 1`; `(z−2)²`; `z²/(z−1)` with orders 2 and −1 | Pass (review at 2c635f6) | none |
| S boundary germ (3.2) | `Ω = ℂ∖{0}`, `f = sin(1/z)`; `Ω = ∅`, `ℂ` | zeros `1/(kπ)` give order `⊤` at 0, so any extension vanishes codiscretely, while `f(2/π) = 1`; frontier empty | Pass (review at 2c635f6) | none |
| S Mittag–Leffler; isolated singularities; quotient (4.1) | `E = ℤ`, `P_n = 1/(z−n)`; `E = {0}`, `U₀ = B(0,1/2)`, `φ₀ = 1/z + 1/(z−1/2)`; `F = cot` | `π cot πz` with residue 1; `f = 1/z`, remainder `−1/(z−1/2)` analytic at 0; `(cos, sin)`, `sin ≠ 0` off `πℤ` | Pass (review at 2c635f6) | none |
| R 6.1 classical products | `cos(πz)` at `0.2−0.3i`; `1/Γ(1/2)`; `π cot(πi)` | `1.1957245+0.6397076i` against product `1.1957246+0.6397068i`; `0.5641896` against `0.5641898`; `−3.153348i = −i(1+2S₁)` | Pass (review at 2c635f6) | none |
| R 6.1 shifted sine | `α = 0.3`, `z = 0.7+0.2i` | `sin(π(z+α)) = −0.6704840i` against `sin(πα)e^{πz cot πα}∏ = 0.0000094−0.6704991i` (truncation `O(1/N)`) | Pass (review at 2c635f6) | none |
| R 6.2 theta | `r = 0.4`, `z = 0.2+0.7i`; `z = iπ−log r` | `H(z+2log r)/H(z) = 1.5654995−1.3186021i = r⁻¹e^{−z}`; `|H| = 8·10⁻¹⁷`; `H(z) = H(−z)` | Pass (review at 2c635f6) | none |
| R 6.2 `e^z−1`; Manhattan shells | `z = 0.9+2.1i`; `N = 1, 2, 3, 10` | `−2.2417210+2.1231524i` against `−2.2417211+2.1231535i`; `4, 8, 12, 40` points, `min|λ| ≥ N/√2`, `Σ|λ|⁻³ = 4, 1.914, 0.864, 0.0798` ≤ `11.31, 2.83, 1.26, 0.113` | Pass (review at 2c635f6) | none |
| R 6.3 crescent; normalization | `z = −1/2`; `n = 1` | `|z| = 0.5 < 1`, `|2z−1| = 2 > 1`; bound `(1/2)/(1−1/2) = 1` | Pass (review at 2c635f6) | none |
| S `cauchyPompeiu` (6.4) | `Δ = D(0,1)∖B̄(0.4,0.3)`, `C = [|z|=1]−[|z−0.4|=0.3]`, `f = z̄z² + Re z`, `∂̄f = z²+1/2`, `ξ = −0.5` | boundary `−0.816`, area/π `−0.1910008`; formula `−0.6249992` against `f(ξ) = −0.625`; with the area sign reversed, `−1.0070` | Pass (review at 2c635f6) | none |
| S ∂̄ solver (7.1) | `f = z z̄²`, `u = z z̄³/3` at `0.3+0.8i` | `u_x+iu_y = 0.438−1.168i = 2f` | Pass (review at 2c635f6) | none |
| S closed completion, scalar and form (7.1, 7.2) | `f = z̄z²`, `g = z z̄²` at `0.3+0.8i`; `f = z`, `g = z̄` | `g_x+ig_y = 2.92 = f_x−if_y`; `∂f − ∂̄g = 1−1 = 0`, while `g = 0` leaves `dz∧dz̄`, of value `−2i` on `(1,i)` | Pass (review at 2c635f6) | none |
| S complex exactness (7.2) | `η = z̄ dz∧dz̄`, `u = z̄²/2`, `β = −u dz` at `0.3+0.8i` | `dβ(1,i) = −1.6−0.6i = η(1,i)`; `+u dz` gives `1.6+0.6i` | Pass (review at 2c635f6) | none |
| S real exactness; `H²` (7.2) | `h = 1+x²`, `u = z̄/2 + (z²z̄+zz̄²+z̄³/3)/8`; circle | `∂̄u = 0.545 = h/2`, `(Re u)_x−(Im u)_y = 1.09 = h`, swapped `−0.12`; on `S¹` every one-form is closed but `H¹ = ℝ` | Pass (review at 2c635f6) | none |
| R 7.3 forms and moments | `d(iz²)(1)` at `1, i`; `d(i|z|²)(1)` at `i`; `d|z|⁴(1)`, `d(log|z|)²(1)` at 2; moments `(0,0)`, `(1,0)`, `(1,1)`, `(2,2)`, `(2,1)`, `(3,3)` | `2i, −2`; `0`; `32`, `0.693147 = log 2`; `3.1415927, 0, 1.5707914, 1.0471894, 0, 0.7853867` against `π, 0, π/2, π/3, 0, π/4` | Pass (review at 2c635f6) | none |
| S Cousin I (7.4) | `Ω = ℂ∖{0}`, `U₁ = ℂ∖[0,∞)`, `U₂ = ℂ∖(−∞,0]`, `c₁₂ = 1` on `Im > 0`, `0` on `Im < 0`; one set | `b₁−b₂ = 1` at `i` and `2+0.5i`, `0` at `−i` and `−3−0.1i`; `3c₁₁ = 0` | Pass (review at 2c635f6) | none |

The table has 37 rows. It covers the 15 sampled targets, all 22 theorems and both definitions of `Suggested.lean`, and every changed statement.

## Not verifiable

- None. The four sources in `sources.toml` (rainer, gray-morris, dlmf-4-22, dlmf-5-8) are in the sources cache, and I read the locators of the changed passages there.

## Source issues

- none (none new this round; the four issues listed in the review at 2c635f6 concern untouched passages and stand)
