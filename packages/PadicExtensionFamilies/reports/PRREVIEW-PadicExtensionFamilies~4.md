# Review of PadicExtensionFamilies (pull request #1713 at 4cf9622)

**Verdict:** accepted

Incremental re-review of 84 changed lines since db1f941. Both previous P2 findings are repaired; no P1 or P2 remains. One P3 documentation note remains. This is ready for a human's final approval, not an AI approval or merge.

## R01 (P3) — The source manifest remains absent

**Location:** `TauCetiRoadmap/PadicExtensionFamilies/`, References at `README.md:2086` onward; previous R03.

**Claim:** The review contract requires a source manifest recording one key per work, versions, locators and verification status.

**Witness:** The folder still contains only `README.md`, `Suggested.lean` and `metadata.toml`; there is no `sources.toml`. The references have not changed, and the gate's source-material check passes.

**Repair:** Add `sources.toml` with the cited works, exact versions and available verification records. Distinguish unreadable sources from readable texts. In particular, `lf.eisenstein_diagram` is now readable; its incorrect general ram count must not be certified as stated. This is nonblocking P3.

## Previous findings

- R01 — repaired: `README.md:1546–1552` uses the ceiling difference for all indices and the simpler ceiling only at run ends; `README.md:1602–1609` tests the former counterexample, obtaining 0 and 1.
- R02 — repaired: `README.md:110–119`, `266–272`, `337–338`, `554–557`, `585–587`, and `867` cite actual NewtonPolygons sections and MassFormula declarations; the invented slope names and asserted module paths are gone.
- R03 — not repaired: No `sources.toml` exists. Carried as this report's nonblocking R01.
- R04 — repaired: `README.md:481` and `1328` now say `*Needs:*`; their suppliers remain the canonical tower, local unramified theory and MassFormula's box volumes.
- R05 — repaired: `README.md:260–261`, `286–290`, and `1779–1780` assign principal units to LocalFieldsRamification Layer 1 and retain reciprocity and existence in ClassFieldTheory Layers 6–8.

## Verified sound

The review is restricted to the changed passages and their dependencies. `Suggested.lean` is byte-for-byte unchanged from db1f941. The diff outside the folder is empty, and the worktree remains clean. The three folder files are the PR's own roadmap, acceptance test and topic metadata. No new route restriction, algorithm, duplicated construction or reversed supply was introduced.

The table below carries forward 50 unchanged adversarial rows from the previous report, explicitly attributed per row. The old failing diagram-count row is replaced by the fresh computations that follow. Those computations use exact fractions and direct enumeration of diagram points, including repeated rams, odd residue characteristic and a nontrivial tame factor.

| Statement | Instances | Values on each side | Result and change |
|---|---|---|---|
| §0.1 tame/wild split | `ℚ_2 ⊂ ℚ_2(√2) ⊂ ℚ_2(∜2)`; tame cubic over `ℚ_5` | `w`: `1+1 = 2`; `ε`: `1·1 = 1`; cubic `e = 3·5⁰` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §0.3 height, mean, wild bound | `ℚ_2(i)`, `ℚ_2(√2)`, tame cubic, unramified quadratic | `(H,m) = (1,1/2),(2,1),(0,0),(0,0)`; `c = f(e−1+H)` gives `2,3,2,0`; `H ≤ v_L(e)` reads `1 ≤ 2`, `2 ≤ 2` (pinned `differentExponent_bounds_of_wild`, `Different/Wild.lean:90`) | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §0.4 square class | bases `(1,√2)`, `(1,2√2)` | discriminants `8`, `32`, ratio `4 = 2²`, same class `2` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §0.5 tame Galois criterion | `ℚ_5(∛5)`, `ℚ_7(∛7)` | `μ_3 ⊄ ℚ_5` (`3 ∤ 4`): not Galois, `#Aut = 1`; `μ_3 ⊂ ℚ_7` (`3 ∣ 6`): Galois, `#Aut = 3`; pinned statement at `TamelyRamified/Galois.lean:74` has exactly `IsTotallyRamified`, `IsTamelyRamified` hypotheses | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §0.6 orbit classification | quartic over `ℚ_2`, `f = 2` | `[ℚ_4ˣ : ℚ_4ˣ²] = 16`, `14` ramified classes; `6 + 2·4 = 14`, orbits `6 + 4 = 10`, total `48 + 10 + 1 = 59` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §0.6 mass relation | orbit of size `f/#Stab` | `Σ_{orbit} 1/#Aut_{K_f} = (f/#Stab)/#Aut_{K_f} = f/#Aut_K` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §1.1 coefficient formula | `X⁴−2`; `X⁴+2X³+2`; `X⁴+2X³+2X²+2` | `v_L(ρ_i)`: `(8,4,8,0)`; `(3,3,3,0)`; `(3,2,3,0)`; `v_L(ρ_1) = H` in all three (`8, 3, 3`) | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §1.2 rams, slope dictionary | `X⁴−2`; `X⁴−4X²+2` | second: `ρ = x⁴+4x³+(6−4α⁻²)x²+(4−8α⁻²)x`, heights `(8,4,8,0)`; both give rams `(2,4)`, Swan `[2,3]`, `c = 3+4·2 = 11` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §1.2 denominator | `X⁴+2X+2` | face `(1,1)–(4,0)`, slope `−1/3`, `2^{0}(2²−1)/3 = 1 ∈ ℕ` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §1.3 residual polynomials | `X⁴+2X³+2`; `X⁴+2X³+2X²+2` | residues of `ρ_{j+1}α^{j−3}`: `(1,0,0,1)` → `z³+1`; `(1,1,0,1)` → `z³+z+1`; `xA(x)`: `x⁴+x`, `x⁴+x²+x`, kernels on `𝔽_2` of sizes `2`, `1` | pass; R09 pair separates  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §1.3 additivity needs positive slope | tame cubic over `ℚ_5` | `A = z²+3z+3`, `zA(z) = z³+3z²+3z` not additive | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §1.4 scaling orbit | `α⁴ = 2` over the unramified quadratic base, `δ` of order `3` | `γ_1 = δ⁻⁴ = δ²`, `γ_2 = δ⁻⁸ = δ`; `(z²+1, z+1) ↦ (z²+δ², δ²z+δ)`; reversed recursion gives `x+δ⁻⁴`, monic | pass; Pauli–Sinclair Thm 4.8 base case is the rightmost segment  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §1.5 unramified transport | `ℚ_2(ζ_3)`, uniformizers `2`, `2ζ_3` | raw `K`-embedding lists `{−1}`, `{0}`; over `L^{ur} = L` both empty | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §2.0 non-Galois Herbrand | `ℚ_2(∜2)`, `D_4` closure | `\|G_t\| = 8,8,4,4,2,2,2,2,1`; `φ_{M/K}(1,3,7) = 1,2,3`; `φ_{M/L}(3) = 2`, `φ_{M/L}(7) = 4` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §2.1 orbit count | same; tame cubic `S_3`, `H = C_2` | `[G:G_tH] = 1,1,2,4` for `t ≤ 3, ≤ 3, 4–7, ≥ 8`; cubic: `1` at `0`, `3` for `u > 0` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §2.2 breaks and `card = w` | `ℚ_2(∜2)`; `ℚ_2(ζ_8)`; tame cubic | jumps of `G^uH` at `u = 2, 3`; `[G:G^{0+}H] = fε = 1`, total `log_2(4/1) = 2 = w`; `ζ_8`: orders `4,2,1` at Artin `2,3`, multiplicities `1,1`; cubic: `0` positive breaks | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §2.3 integral | identity; unramified quadratic; tame cubic; `ℚ_2(∜2)` | integrands `0`; `0`; `2` on `(−1,0]`; `3` on `(−1,2]`, `2` on `(2,3]`: `c = 0, 0, 2, 11` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §2.4 slope polygon | `ℚ_2(∜2)`; tame cubic; unramified quadratic | `(1,0),(2,3),(4,11)`: slopes `3,4`; `(1,0),(3,2)`: `1`; `(1,0),(2,0)`: `0` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §2.5 non-normal sum formula | `σ = r²`, `σ = r` in `D_4` | `v_M(−2α) = 10 = i(r²)+i(r²s) = 8+2`; `v_M((i−1)α) = 6 = 4+2`; `Σ_{s∈H} min(m, i_H(s))`: `8+2 = 2(φ_{M/L}(7)+1)`, `4+2 = 2(φ_{M/L}(3)+1)`; rams `4, 2` with multiplicities `1, 2` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §2.6 four identities | `ζ_8` | Swan `[1,2]` → `m = (1/2, 5/4)`, `r = (1, 3)`; `s_2 = (2·5/4 − 1/2)/1 = 2`; `r_2 = 4(5/4−1/2) = 3`; `c = 3 + 4·5/4 = 8` | pass; identical to knowl `lf.herbrand_invariant` lines 111–117  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §2.6 small and tiny rams | general | `r_k^* = (p−1)r_k/(εp^k) = m_k − m_{k−1}`; `s_k − m_k = (m_k−m_{k−1})/(p−1) = r_k/(εp^k)` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §2.7 top slope | identity; `ℚ_2(√5)`; `ℚ_5(∛5)`; `ℚ_2(∜2)` | `0, 0, 1, 4` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §3.1 slope content degrees | `D_4`, `S_4`, `S_3`, `[]^2` | `1·1·2³ = 8`, `3·2·2² = 24`, `2·1·3 = 6`, `1·2·1 = 2` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §3.2 hidden slopes | `ℚ_2(∜2)`; `X⁴+2X²+2`; `ℚ_3(∛3)` | `[2,3,4]−[3,4] = [2]`; `[2,3,7/2]−[2,7/2] = [3]`; `[5/2]−[5/2] = []` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §3.3 weighted formula versus Jones–Roberts (2) | `[2,3,4]`; `[4/3,4/3]_3^2`; `[]_3^2`; `[]^2` | `7/8+1/8+2/4+3/2 = 3`; `1−1/12+1/12+1/6 = 7/6`; `2/3`; `0`; the two formulas agree after `1 − (p−1)Σ_{j≤k} p^{−j} = p^{−k}` with `t` the tame degree | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §3.4 normalizer | `S_3, H = C_2`; `C_2², H = 1` | `[N(H):H] = 1`, `4` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §3.5 splitting models | `x³−5` at `5`; `x³−7` at `7` | orders `(6,6)`; `(3,6)` since `ζ_3 ∈ ℚ_7` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §4.1 indices | `X⁴−2`; `X²−2`; `X²+t^mX+t` over `𝔽_2((t))` | auxiliary `(∞,∞,0)` → `(8,4,0)`; `(∞,0)` → `(2,0)`; `(2m−1, 0)`, inseparable `X²+t` gives `(∞,0)`; `0·∞ = 0` in `ℕ∞` keeps `i_ν = 0` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §4.2 Miki | `ℚ_2(√2)`, `a = −1` | `v(−2) = 2`, `1 ≤ 2 < 4 = e'p`, `l = 1`; `(1+√2)²(−3+2√2) = −1`, levels `1, 3`, weighted `2 < 3`; `−1` not a square there (Miki Lemma 17, `miki-1981 line 524`, condition (B) line 530) | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §4.2 jump sets | `p = 2, e = 2` | `ρ(1) = 2`, `ρ(2) = 4`, `T = {1,3}`, `e^* = 4 = ⌈pe/(p−1)⌉` (Pagano line 113); `A = {1,3}` ↔ `(I = {1,3}, β = (2,1))`, `ρ²(1) = 4 < ρ(3) = 5` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §5.1 Ore | `ℚ_2, n = 4`; `n = 1`; `𝔽_2((t)), n = 2` | admissible `{1,3,5,6,7,8}` (`2`: `v(2) = 1 > 0`; `4`: `a = 1 ≠ 2`); `n = 1`: only `j = 0`; equal characteristic: `b = 0` needs `a = ∞`, impossible, odd `j` admissible | pass; equivalent to Pauli–Roblot Prop. 3.1 (`pauli-roblot line 113`)  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §5.2 box depths | `ℚ_2, n = 2, j = 1, 2` | `ν_1 = 1` exact, measure `1/16`; `ν_1 = max(1, 2) = 2`, measure `1/16`; `ν_h` from `t_h ≥ j` with the `[h<b]` shift | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §5.3 Krasner closed form | `ℚ_2, n = 2`; `ℚ_3, n = 3`; `𝔽_2((t)), n = 2` | `2, 4`; `6, 6, 9`; `2^m` at height `2m−1`; the `⌊b/p^{a+1}⌋` of the README equals the source's `⌊(b−1)/p^{a+1}⌋` because `p^{a+1} ∤ b` under Ore (`pauli-roblot line 352`) | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| `krasnerCount` (Lean) | `n = 1, j = 0`; general | `1·q⁰·1 = 1` (field `K`); exponent `(n+j−1) − Σν_h` in `ℤ` reproduces `n q^{n+j} μ(box)/(1−q^{−1})` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §5.4 totals | `ℚ_2, n = 2`; `𝔽_2((t)), n = 2`; `𝔽_3((t)), n = 2` | `6`; `∞`; `2` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §6.2 compatibility | `ℚ_2`, `e = 2`: rams `1,2,3`; `[2,3]` of `ℚ_2(∜2)`; `𝔽_2((t))` | `1 < 2` geometric, `2 = 2` arithmetic, `3` rejected; `r_1^* = 1 = e_K`, `r_2^* = 1 = e_K`: both bands arithmetic; `(2−1)(2m−1)` odd, no bound | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §6.3 relative to absolute | `e = f = 2` over `ℚ_2` | relative masses `3`, `4` → `6`, `8` classes; orbits `10` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §6.4 point types | `[1]`, `[2]` over `ℚ_2`; `[2,3]`; `[1/3,1/3]` | `(α,β,γ,δ) = (1,0,1,0)`, `(0,1,1,0)`, `(0,3,2,0)`, `(1,0,0,0)` (i = 0 points have index `0`, so `P_2` of `[2]` is a C-point as the Check says) | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §6.4 full-residue count and fibre | same | sets of size `2, 4, 32, 1`; `[2]`: `X²+2`, `X²+10`, `X²+4X+2`, `X²+4X+10` are `ℚ_2(√−2), ℚ_2(√−10), ℚ_2(√2), ℚ_2(√10)`, each once (`2/2 = 1`); `[1]`: `ℚ_2(i)`, `ℚ_2(√−5)`, each once; `[2,3]`: `Σ fibres = 32` and `Σ 1/#Aut = 8` are consistent with Galois members of fibre `1` (`X⁴−4X²+2`) and `D_4` members of fibre `2` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §6.4 C-point count | `[1]`, `[2]`, `[2,3]`, `[1/3,1/3]` | `1 = ⌊1⌋`; `2 = ⌊2⌋`; `k = 1`: `σ = 4, 8` → `2`; `k = 2`: `σ = 4, 8, 10, 12` → `4 = ⌊4⌋`; `0 = ⌊1/3⌋` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §6.4 tame branch | `[]_2`, `[]_3` over `ℚ_5`; `ε = 1` | `K_f(ε√(uπ)) ≅ K_f(ε√(u'π))` iff `ū'/ū ∈ (𝓀ˣ)^ε` (unit `ε`-th roots lift by Hensel, `p ∤ ε`); classes `gcd(2,4) = 2`, `gcd(3,4) = 1`; `#Aut = gcd(ε, q^f−1)`, mass `1` | pass; Monge §2.4 p.11  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §6.5 reduced count and ambiguity | general; `[1]` over `ℚ_4` | `#ker(S_m)` is a `p`-power `≤ p^{ρ_j}` inside `𝔽_{q^f}`, so divides `gcd(p^{ρ_j}, q^f)`; `fB/#Aut(L/K) = (f/#Stab)·B/#Aut(L/K_f)`; `B/#Aut = 2/2 = 1` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §6.5 Serre comparison | `ℚ_2, e = 2`; `𝔽_2((t))` | `1·2⁻¹ + 2·2⁻² = 1`; partial sums `1 − 2^{−M}` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §6.6 packets | `X⁴−2` vs `X⁴−4X²+2`; `X⁴+2X³+2` vs `X⁴+2X³+2X²+2` | same rams, Swan, `c`; groups `D_4` vs `C_4` (real subfield of `ℚ_2(ζ_16)`), hidden `[2]` vs `[]`; residual classes `{z³+1}` vs `{z³+z+1}` under `𝔽_2ˣ = {1}` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §6.7 Monge count | `(p,e,f) = (2,2,1)` over `ℚ_2`; `(2,1)` over `ℚ_4` | summands `1+3+2 = 6`; over the unramified quadratic base `3+7+4 = 14`, the relative count whose Frobenius orbits give `N_2(2,2) = 10`; Lean `mongeSigma`, `mongeDelta`, `mongeCount` transcribe (6), (7) and Theorem 1 (`monge-count lines 158–217`) with `N' = n_0 n(i) e' f'` and `h'' ∣ p^{f_0 f(i) f'} − 1` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §6.8 completeness | `n = 1`; dyadic quadratics; `𝔽_3((t)), n = 2`; wild equal characteristic | `{⊥}`: `1`; `∅`: `0`; `2/4 + 4/8 = 1`, omissions `3/4`, `7/8`; `√t, √(2t)`: `1/2+1/2 = 1`; both sides false for finite `S` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| `totallyRamifiedHeight` (Lean) | member `E`; infinite `E` | `c + 1 − n ≥ 0` by the pinned lower bound, no truncation; junk `0` excluded by `hmem` | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| `mass_completeness` quantifiers | `S` with two isomorphic members | `hpair` fails; without it the sum could be `2` with the left side true | hypothesis needed, present  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| §7.1–7.3 GRD | `ℚ`; `ℚ(√5)`; `ℚ(∜2)`; `ℚ(ζ_5)` | `1`; `√5`; closure degree `8`, discriminant `2²⁴`, `2³ = 8 > 2^{11/4}`; `5^{3/4}`; bound `gms_p ≤ 1 − 1/e_p + v_p(e_p)`: `3 ≤ 1 − 1/8 + 3`, `3/4 ≤ 3/4`; strictness needs nonempty support (`ℚ`: `1 = 1`) | pass; Jones–Roberts GRD (2.1)–(2.5), `jones-roberts-grd lines 121–165`  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |
| Boundary checks | `x²+4x+2`, `x²+2x+4`, `x²+x+2` | constant valuations `1, 2, 1`; linear `2, 1, 0`: Eisenstein, not, not | pass  carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md) |

Fresh checks of the changed statements and their dependencies:

| Statement | Instances tried | Computed values on each side | Result; change |
|---|---|---|---|
| §1.2 slope cardinality and sign | Eisenstein degree 1; tame cubic; `X⁴+2X+2` | `ρ=X`: degree 1, order 1, 0 slopes = 1−1. Tame cubic: 2 slopes 0 = 3−1. Quartic: face `(1,1)–(4,0)` has three slopes −1/3 and root valuations +1/3 = 4−1. | Pass; supplier's nonzero-root convention retained. |
| §1.2 product and denominator contracts | Quartic face `(1,1)–(4,0)` | Reduced slope denominator 3 divides horizontal length 3; product of the three nonzero linear factors contributes three copies of −1/3. | Pass; names replaced by NewtonPolygons §§3.2–3.3, 6.1. |
| §2.4 lower-envelope supplier | Quartic intermediate degrees 1,2,4 | Points `(1,0),(2,3),(4,11)` have slopes 3 and 4; shear by `c−n+1` gives heights 0,2,8, slopes 2 and 3. | Pass; renamed supplier is the same envelope construction. |
| §0.6 dependency spelling and orbit mass | `f=2`, trivial stabilizer, relative automorphism order 2 | Orbit size 2; relative sum `2·(1/2)=1`; absolute expression `f/Aut_K=2/2=1`. | Pass; `Needs` now exposes the existing supplier edge. |
| §5.2 dependency spelling and Haar normalization | `q=2,n=2`, heights 1 and 2 | Constant shell volume 1/4; other coefficient shell/deep ball volume 1/4; both boxes 1/16. Eisenstein region 1/8 = 1/16+1/16. | Pass; MassFormula Layers 2–3 provide the consumed normalization. |
| §6.4 divisibility and interval count, geometric quadratic | `p=2,ε=1,s=[1]`, `m=[1/2]` | Interval `[1,2)`; points `{P₁}`; count 1 = `ceil(2)−ceil(1)` = `ceil(r₁)`; C-count 1 = `floor(1)`. | Pass; exact count agrees with the old formula here. |
| §6.4 interval count, arithmetic quadratic | `p=2,ε=1,s=[2]`, `m=[1]` | Interval `[2,4)`; `{P₂,P₃}`; count 2 = 4−2 = `ceil(2)`; C-points `{P₂,P₄}`, count 2 = `floor(2)`. | Pass; includes points of index zero. |
| §6.4 first run end and point rescaling | `s=[2,3]`, `m=[1,2]`, `k=1` | Interval `[2,4)` in `σ/2`; `{P₄,P₆}`; count 2 = 4−2 = `ceil(r₁)`; C-points `{P₄,P₈}`, count 2. | Pass; scaled integer and point labels agree. |
| §6.4 final run end | Same quartic, `k=2` | Interval `[8,12)`; `{P₈,P₉,P₁₀,P₁₁}`; count 4 = 12−8 = `ceil(r₂)`; C-points `{P₄,P₈,P₁₀,P₁₂}`, count 4. | Pass; height at the left endpoint is 8. |
| §6.4 repeated run, former counterexample | `s=[1/3,1/3]`, `m=[1/6,1/4]`, `k=1` | `B₁` contains only `P₁`, index 2; eligible points empty. Interval `[1/3,2/3)` gives count 0 = 1−1, whereas `ceil(r₁)=1`. C-count 0 = `floor(1/3)`. | Pass; former R01 repaired. |
| §6.4 repeated run, final index | Same quartic, `k=2` | Interval `[1,4/3)` gives `{P₁}`; count 1 = 2−1 = `ceil(r₂)`; C-count 0 = `floor(1/3)`. | Pass; the integral-height condition applies. |
| §6.4 odd-prime negative control | `p=3,ε=1,s=[1/8,1/8]`, `m=[1/12,1/9]` | At k=1: `[1/4,3/8)` gives 0 = 1−1, not ceiling 1. At k=2: `[1,9/8)` gives 1 = 2−1. Rams both 1/8; C-counts both 0. | Pass; compatible repeated run since `(3²−1)/8=1` is prime to 3. |
| §6.4 tame-factor normalization | `p=2,ε=3,s=[1/3]`, `m=[1/6]` | `e=6`, ram 1; interval `[1,2)` gives `{P₁}`, count 1 = 2−1; C-count 1. | Pass; ε is required in both endpoints. |
| §6.4 interval-length identity from §2.6 | Repeated quartic, k=1 and 2 | `εp^k(s_k−m_k)=2(1/3−1/6)=1/3`, and `4(1/3−1/4)=1/3`, both equal r_k; left endpoints 1/3 and 1. | Pass; integer left endpoint is sufficient, not asserted necessary. |
| Principal-unit supplier and §6.7 consumer | `K=ℚ₃`, depths 0,1,2 | `U⁰/U¹` has 2 elements = q−1; `U¹/U²` has 3 = q. `2∉U¹`, `4∈U¹` but `4∉U²`. Three quadratic norm subgroups give one unramified and two ramified extensions. | Pass; LocalFieldsRamification owns the filtration, ClassFieldTheory owns the correspondence. |
| §3.6 intrinsic prefix (sample coverage) | `ℚ₂(√2)`; identity over `ℚ₂` | `(p,f,e,c)=(2,1,2,3)` gives `2.1.2.3`; `(2,1,1,0)` gives `2.1.1.0`. | Pass; unchanged definition, extra direct check. |

The new interval formula also follows for every permitted k: `p^(w−k)` divides σ exactly when its index is at most k. Since the means increase, points in B_k with such an index are not Z-points. Dividing σ by this power gives precisely the integers in the displayed half-open interval. Its length is r_k by §2.6. At a run end the left endpoint is the integral height of V_k. None of this excludes repeated rams or equal characteristic. The companion C-point count survives all nine numerical band tests above.

### Source sample and availability

Of this round's seeded sample, §1.2 has changed supplier citations, §5.2 only the dependency marker, and §6.4 the changed mathematical assertion. The other sampled statements and their source checks are carried from [r3](packages/PadicExtensionFamilies/reports/PRREVIEW-PadicExtensionFamilies~3.md), not represented as newly reread. The immediately used §2.6 identities were reread too.

| Passage | Locator actually opened | Outcome |
|---|---|---|
| §1.2 | `TauCetiRoadmap/NewtonPolygons/README.md:512` (§2.1), `647` (§3.2), `667` (§3.3), `870` (§6.1), `892` (§6.2), on main | Nonzero polynomial, degree minus order, negative nonzero-root valuations, product law and normalized denominator statements are exactly the imported contracts. |
| §§2.6, 6.4 | `lf-herbrand-invariant line 108`, lines 111–119 and 129–136 | Initial values, four identities and mixed-characteristic compatibility agree. The interval computation is the roadmap's deduction. |
| §6.4 | `lf-eisenstein-diagram line 125`, lines 138–168 and 185; rendered page 1, “Bands”, “Index and types of points”, “Slopes, means, and rams on Eisenstein diagrams” | The source is now readable through the sources service. Bands, indices and point types agree. Line 185 makes the overly general ceiling assertion; the roadmap correctly replaces it. |
| §6.4 coverage and specialization counts | `lf-eisenstein-diagram line 165`, lines 168–177 | Confirms the full-residue versus reduced-choice distinction. The earlier Monge/Pauli–Sinclair primary-source checks are carried from r3. The source's total-versus-fibre wording at line 176 is incorrect; the roadmap already separates these quantities. |

No source passages were copied into the review or repository. Two source texts were opened this round. Both were fetched through the sources service; no manifest was edited.

### Suppliers, pins and ownership

The repaired contracts were resolved against main, not against an unrelated revision PR:

- NewtonPolygons: `README.md:211` (§0.1), `320` (§0.6), `512` (§2.1), `647` (§3.2), `667` (§3.3), `870` (§6.1), `892` (§6.2). The three actual names are `lowerConvexEnvelope`, `ConvexPolygon.FiniteSlopeData`, `Polynomial.newtonPolygon`; the other claims are correctly cited as prose targets. Searching both pinned libraries finds none of the four polygon/slope object names queried, so these are roadmap contracts, not pinned imports.
- MassFormula: `README.md:214`, `253`, `280`, `303`, `350` (Layers 0–4). Its nine consumed names were located in `Suggested.lean:123`, `174`, `180`, `248`, `327`, `365`, `372`, `386`, `467`. The quantifiers of `card_aroots_eq` include a monic separable starting polynomial and a uniform T for all degree-n totally ramified fields. The measure statement is normalized on the integer box. Invented module paths have been removed.
- LocalFieldsRamification: `Completed/LocalFieldsRamification/README.md:283` defines the filtration; `320` supplies its graded pieces. Layers 0–4 remain the canonical tower, valuation and ramification owner. ClassFieldTheory `README.md:1220`, `1312`, `1433` supplies finite reciprocity, the absolute Artin map and local existence/correspondence, respectively. The §6.7 application is to finite extensions of ℚ_p, within Layer 8's stated scope.

Three useful main-branch shape references were read: NewtonPolygons, MassFormula, and completed LocalFieldsRamification. Other existing supplier/deferral citations were resolved again: NumberFieldArithmetic §§4.2, 5.1–5.3, 5.6, 5.10, 6.3, 6.5 (completed README lines 1123, 1302, 1336, 1393, 1493, 1714, 1798, 1873); PolynomialGaloisGroups' label model (completed README lines 198–218); ClassicalArithmeticCompletion §§3.11, 3.33, 3.46, 3.52–3.53; ArithmeticGaloisRepresentations Layer 3 through `roadmaps show`; and the existing completed LocalGaloisGroups folder. The deferrals to ArtinRepresentations and FiniteGroupInvariants were checked at the supplied open heads, especially the latter's explicit allocation of field groups to this roadmap (`README.md:159–163`). No upward supplier is introduced by these deferrals.

Fresh pinned declarations opened:

| Pinned file and line | Declaration or contract checked |
|---|---|
| `Mathlib/NumberTheory/LocalField/Basic.lean:45` | `IsNonarchimedeanLocalField` extends valuative topology, local compactness and nontriviality; no arbitrary-topology local field is admitted. |
| `TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean:99` | `unitFiltration`: image in Kˣ of the kernel of reduction modulo the i-th maximal-ideal power. |
| Same file, `105`, `285` | Membership via congruence; `natCard_unitFiltrationGraded_zero = q−1`. |
| `TauCeti/NumberTheory/LocalField/UnitFiltration/Uniformizer.lean:54` | `unitFiltrationGradedSuccEquivResidueFieldOfUniformizer`, requiring an irreducible uniformizer, is the positive-depth additive residue-field equivalence. |
| `TauCeti/NumberTheory/LocalField/RamificationIndex.lean:103` | `ramificationIndex` uses the top field's normalized valuation; a compatibility instance is not needed to define it. |
| `TauCeti/NumberTheory/LocalField/Different/Wild.lean:90` | `differentExponent_bounds_of_wild` requires e nonzero in L; the unchanged equal-characteristic route does not invoke this finite bound. |

The fresh object search used `roadmaps grep` over the indexed open heads and main for ramification polygons, Eisenstein diagrams, finite slope multisets and unit filtrations. The focused polygon/diagram search identifies this roadmap and NewtonPolygons as the relevant owners; filtration hits are suppliers or consumers of the existing local-field API. The board package index names no package in these subjects. No construction moved ownership in this repair, and no Lean declaration was added or renamed. The prior broader duplication audit is carried forward rather than repeated.

### Gate and dependency output

The full gate with the supplied candidate order, content checkout and targeted build returned:

```text
gate PadicExtensionFamilies: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The separately requested dependency command returned:

```text
depcheck: 204 roadmaps, 1615 edges, 0 problem(s)
```

No UPWARD or CYCLE. The initial command using the configured default order reported `depcheck: NOT IN ORDER: PadicExtensionFamilies (insert it after its last supplier)`. This is an order-selection false positive, not a roadmap defect: the supplied candidate order contains the roadmap at line 370, and both the explicit dependency check and full gate against that order pass. No order or tooling file was changed.

### Lean acceptance test

Direct elaboration of the unchanged `Suggested.lean` succeeds with exactly 13 `sorry` warnings and no other warning or error. A fresh elaboration of the scratch signature copy runs `#check @` for all 39 declarations. Comparison with the README and the previous elaboration finds no changed type. The six binder-loss leads remain benign: the polynomial, subgroup and arithmetic definitions need only their actual inputs; the geometric theorems explicitly retain compatible valuations, finiteness, Galois/separability and total-ramification hypotheses as appropriate. The raw definitions' broader domains are already explained after Convention 12.

The scratch one-tactic probe tried `rfl`, `simp`, `infer_instance`, `exact le_rfl`, and `exact Iff.rfl` on each of the 13 admissions; none closed, and all 13 fell back to `sorry`. No new padding was found. The previous pinned-library comparison of the unchanged headlines is carried forward.

The statable headlines remain root-difference invariance and tame multiplicity, wild residual additivity, the discriminant integral, inseparability-index invariance, Miki decomposition, Ore realizability, Krasner's refined count, Monge's class count, mass completeness, and GRD monotonicity, product and support. The docstring names the missing native carriers for polygon-to-break, slope-polygon, slope dictionary/content, filtered-unit jump classification, generic-family and family-mass statements. The supplier-name repair does not make those native carriers available at the pins. Imports retain one `import Mathlib` plus six used Tau Ceti modules; no sorried data or `set_option` appears.

## Not verifiable

The limitations below are carried from r3 because their passages were unchanged; they were not subjected to a new full-source search. The changed diagram-count assertion is independently verified above, and its source is now readable.

- The previous CAPTCHA limitation remains unrefreshed for `lf.family_ambiguity`, `lf.family_invariants`, `lf.family_mass`, `lf.family_polynomial`, `lf.galois_splitting_model`, `lf.heights`, `lf.jump_set`, `lf.means`, `lf.packet`, `lf.rams`, `lf.subfamily`, `lf.top_slope`, `nf.galois_root_discriminant`. R3 records its cache and sources-service attempts. Remove `lf.eisenstein_diagram` from that limitation: the present fetch returns the actual text.
- Deligne Appendix A.6 (Props. A.6.1–A.6.2) was not obtained by the earlier legal-source search. The previously computed non-Galois tests are carried in the table.
- Serre's *Local Fields*, Krasner 1966, Serre 1978, Ore 1928 and Fried 1974 retain the previous paywalled/not-obtained status; their unchanged citations are by locator.
- The previous checks of Jones–Roberts, Pagano and Heiermann used the preprint versions named in the README; published numbering was not compared anew.

## Source issues

The first three entries are carried from r3; the last three concern the newly readable diagram knowl.

- **Misprint** in monge-family at §2.4, printed p.11: the source says tame reduced polynomials use representatives of K×/(K×)^n; it should be residue-field representatives κ_K×/(κ_K×)^n, as in Definition 1; affects nothing.
- **Error** in jones-roberts-database at §3.6, equation (2), printed p.8: the source says the tame term uses t equal to the unramified quotient order; it should be the tame inertia quotient order; affects a stated result.
- **Error** in jones-roberts-database at §3.6, after (2), printed p.8: the source says root and Galois root discriminants agree exactly when hidden slopes are absent; it should be exactly when the closure is unramified over the field; affects a stated result.
- **Error** in lf-eisenstein-diagram at “Slopes, means, and rams on Eisenstein diagrams”, rendered p.1, line 185: the source says every band's eligible point count is ceil(r_k); it should be ceil(εp^k s_k)−ceil(εp^k m_k), with ceil(r_k) valid at run ends; affects a stated result.
- **Misprint** in lf-eisenstein-diagram at “The size of a family”, rendered p.1, line 176: the source says the automorphism-denominator expression is another expression for the total number of specializations; it should be the number over an individual field class (for f=1, the quadratic [1] has total 2 and fibre 1); affects a stated result.
- **Error** in lf-eisenstein-diagram at “The size of a family”, rendered p.1, lines 176–177: the source says the displayed mass uses K-automorphisms of K-classes for general residue degree f; it should use relative K_f-classes and automorphisms, or multiply the absolute mass by f; affects a stated result.
