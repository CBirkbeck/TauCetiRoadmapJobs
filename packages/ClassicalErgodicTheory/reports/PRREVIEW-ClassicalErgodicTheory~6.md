# Review of ClassicalErgodicTheory (pull request #2231 at 92f201c)

**Verdict:** needs changes

## R01 (P3) — §3.2 still has no locator and §6.2 still cites only a chapter (previous R02 partly repaired)

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md`:
- lines 1051–1061, §3.2 items 1–5 (the headlines `weakMixingVAdd_real_iff_exists_atomless_spectralMeasure` and `weakMixingVAdd_real_iff_weakMixing`);
- line 1870, "homeomorphisms (Walters1982, Chapter 8)";
- line 1876, "(Walters1982, Chapter 8, for the ergodic decomposition)".

**Claim:** The previous R02 asked for theorem numbers here. These are the parts it left unrepaired. §3.2 states its equivalences 1 ⇔ 3 and 1 ⇔ 4 ⇔ 5 without any locator, and §6.2 cites a whole chapter twice.

**Witness:** The only citations in §3.2 are Suggested.lean names and MathematicalBilliards §12.1 (for item 2). Secondary papers cite Walters Theorem 8.2 for upper semicontinuity under expansiveness (arXiv 1809.10022, arXiv 1712.05167) and Theorem 8.4 for Jacobs' theorem.

**Repair:**
- Line 1870: "(Walters1982, Theorem 8.2)".
- Line 1876: "(Walters1982, Theorem 8.4, Jacobs' theorem, for the ergodic decomposition)".
- Walters1982 is uncertified, so check these two numbers against the book before relying on them.
- §3.2, after item 5:
  - add "(Creutz, Proposition 13.2.1, p. 117, for locally compact second countable groups, which include `ℝ`: weak mixing iff `L²₀` has no finite-dimensional invariant subspace)";
  - give the theorem numbers in CornfeldFominSinai1982 (recorded, uncertified) for 1 ⇔ 3 and 1 ⇔ 4 ⇔ 5.

## Previous findings

- R01 — repaired: line 316 now reads "AmenableGroups; MathematicalBilliards §§12.4–12.5". Line 1196 reads "§§0.1, 3.1, 3.3; MathematicalBilliards §§8.2–8.3". Line 2114 reads "*Needs:* Layer 7; ArithmeticDynamics §2.7 (Goodwyn's inequality, item 1)". The §2.1 *Needs:* and the Dependencies of Layers 2, 3 and 8 match.
- R02 — partly repaired: §§0.2, 1.3, 2.4, 3.3 items 1–2, 5.3 and 8.6 now cite Creutz, ParryPollicott1990 or Bowen1972 theorems. §3.2 still has no locator, and §6.2 still cites "(Walters1982, Chapter 8)" (R01).
- R03 — repaired: References now list "M. Hochman, *Notes on ergodic theory* (2012), Proposition 3.4.2 … and Proposition 4.5.2" and "M. Misiurewicz, *A short proof of the variational principle …*, Astérisque 40 (1976), 147–157, §3".
- R04 — repaired: lines 1226–1231 add the `exp (2π i t)` value with `i` against `-i` at `t = 1/4`, and `flowCorrelation μ 1 1 t = 1 - 1 = 0` against the uncentred value `1`.
- R05 — repaired: line 864 reads "… are compatibility lemmas. Prove uniqueness, total mass, …".

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §0.2 Koopman continuity (Creutz line 4163) | `ℝ` on the circle, `f = 1_[0,1/2)` | `‖π(t)f − f‖₂² = 2\|t\|` → 0. Def 11.21's factor `√(dgν/dν)` is `1` for invariant `ν`. Def 11.14: standard Borel, quasi-invariant, p. 107 | holds |
| §1.3 `MixingVAdd` (Creutz lines 4529, 4536) | fair shift as `zAddAction`, `A = B = {x0 = 0}`; swap | shift: `1/4 = μA·μB` for `n ≠ 0`; swap: `1/2, 0, 1/2, …`. Creutz uses `ν(gA ∩ B)`, which agrees because inversion preserves `cocompact` | holds |
| §2.4 Prop 13.2.1, Thm 13.8 (Creutz lines 4479, 4513) | swap; fair shift | swap: `(1,−1)` spans an invariant line, diagonal has measure `1/2`, both conditions fail. Shift: neither fails | holds; pp. 117, 118 |
| §3.3 item 1 (ParryPollicott1990 line 1799, p. 90) | swap, `r ≡ 1`; identity on two points, `r ≡ 1` | one closed orbit, ergodic like the swap; two circles, not ergodic like the identity | holds |
| §3.3 item 2 (ParryPollicott1990 line 1857, Prop 6.2) | swap, `r ≡ 1`, `g = (1,−1)`, `α = 1/2` | `g∘T = e^{πi}g`. Their `a = 2πα = π` gives the same equation. `W(x,1) = −g x = W(Tx,0)` | holds; pp. 93–94 |
| §3.5 item 1 (MathematicalBilliards §§8.1–8.3) | unit square | `Σ` is `μ_P`-null and `X_P` invariant (§8.1); `F^t` is identity on `Σ` (§8.2); `μ_P` is invariant (§8.3): a conull flow | holds |
| §3.6 new Checks | circle flow, `e₁`; `f = g = 1` | `∫ e^{2πi(t+x)} e^{−2πix} = e^{2πit}`: `i` at `1/4`, `−i` with the conjugate swapped. Constants: `1 − 1 = 0`; uncentred, `1 ≤ ρ(t) → 0` fails | correct |
| §5.3 scale (Bowen1972 lines 188, 192, p. 327) | two-sided full 2-shift, `δ = 3/4`, `ε = 1/2` | `Γ_δ(x) = {x}`, so `h*_homeo = 0 = h*_f` by Cor 2.3; `h(σ, 1/2) = log 2 = h(σ)` | holds |
| §8.1 item 1 (ArithmeticDynamics §2.7, README line 2618 at ae79f44) | full 2-shift, any invariant `ν` | `h_ν ≤ coverEntropy = log 2 < ⊤`, so `toReal` loses nothing | holds |
| §8.6 item 2 (ParryPollicott1990 line 430, Prop 2.1) | full 2-shift, `φ ≡ −log 2`, `f = 1_{x0=0}` | `L1 = 1`, `Lf ≡ 1/2`, `Lip(Lf) = 0 ≤ C(θ + 1)`; `‖Lⁿ1‖_∞ = 1` | holds |
| §8.6 item 3 (ParryPollicott1990 lines 458, 890, 897) | full 2-shift, `φ = a_{x0}` | `β = e^{a₀} + e^{a₁}`, `h = 1`. `p_i = e^{a_i}/β` gives `H(p) + ∑ p_i a_i = log β = P` | holds; pp. 21, 42–43 |
| §8.6 item 4 (ParryPollicott1990 lines 768, 784) | `φ = log p_{x0}` (normalised) | `μ[x₀…x_{n−1}] = ∏ p = exp(S_n φ)`, `P = 0`, ratio `1` | holds; p. 37 |
| §8.6 item 5 (ParryPollicott1990 line 327, Prop 1.2) | two-sided shift, `φ = a_{x_{−1}}` | `ψ = a_{x0}`, `u = −a_{x_{−1}}`, `u∘σ − u = a_{x_{−1}} − a_{x0}`. Their `h ∈ F_{√θ}` is stronger than continuity | holds; p. 14 |
| §8.6 item 6 (ParryPollicott1990 line 1222, Prop 4.10) | full 2-shift, `φ = 0`, `ψ = 1_{x0=0}` | `P(tψ) = log(e^t + 1)`, derivative `e^t/(e^t+1) = μ_{tψ}[0]`; `1/2` at `0` | holds; p. 60 |
| `weakMixingVAdd_real_iff_weakMixing` (R01) | circle flow; suspension of fair shift, `r ≡ 1` | identity and irrational rotation, both not weakly mixing. Suspension: eigenfunction `e^{2πis}`; time-1 fixes `s`, time-1/2 has eigenvalue `−1` | both false; no locator |
| `weakMixingVAdd_real_iff_exists_atomless_spectralMeasure` (R01) | circle flow, `e₁` | `U_t e₁ = e^{−2πit}e₁`, `σ = δ_{−1}`, an atom | both false; no locator |
| §6.2 upper semicontinuity (R01) | full 2-shift, Bernoulli `(1−1/k, 1/k)` → `δ_{0^∞}` | `H(1/k) → 0 ≤ 0 = h(δ_{0^∞})` | holds; chapter only |
| §6.2 Jacobs (R01) | `ν = ½δ_{0^∞} + ½·Bernoulli(½,½)` | `h_ν = ½·0 + ½ log 2 = (log 2)/2` on both sides | holds; chapter only |

The diff changes no Lean statement. Rows for statements the diff leaves untouched stand as in the previous review, of `e4df427`.

- Source locators checked against cached texts: 16, all with matching printed pages:
  - Creutz, 5: Def 11.14, Thm 11.22, Prop 13.2.1, Thm 13.8, Def 13.9 with its remark.
  - ParryPollicott1990, 9: p. 90, Props 1.2, 2.1, 3.2, 4.10, 6.2; Thm 2.2; Cor 3.2.1; Thm 3.5 with its paragraph.
  - Bowen1972, 2: Cor 2.3, Thm 2.4.
  - The URLs and page ranges of the new Hochman, Misiurewicz1976, Bowen1972 and Parry–Pollicott references match the texts' headers.
- Cross-roadmap citations resolved:
  - MathematicalBilliards design: §§8.1–8.3 (README lines 566, 576, 592) and §§12.4, 12.4.1, 12.5 (lines 838, 848, 860).
  - ArithmeticDynamics §2.7 at ae79f44 (line 2548).
  - GeometryOfNumbersAndQuadraticArithmetic §4.2 at #851 (line 1258).
  - On main: MarkovChainsAndRenewal Layers 0 and 3 (lines 139, 234) and AmenableGroups Layer 5 (line 289).
- The build table rows match the Dependencies of Layers 0–3 and 6–8.
- Gate: the worker's gate passed. My rerun's only failure is `depcheck: NOT IN ORDER: ClassicalErgodicTheory` (default order file). Against the candidate order: `depcheck: 206 roadmaps, 1901 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- No change outside the folder; the change since `e4df427` touches only `README.md`.
- Elaboration: `lake env lean` gives 39 warnings, all `declaration uses sorry`, and no error. `Suggested.lean` is unchanged, so the previous `#check @name` comparison stands.
- The pull request's title and description match this head; the change adds only locators, Checks and citations within the suppliers the description names.
- Overlap check: read ProbabilisticAndMetricNumberTheory, ArithmeticDynamics, PointProcesses, Equidistribution, ProbabilisticAndMetricNumberTheoryPartII, Exchangeability, OptimalTransport and StochasticCalculus (scopes as read at `e4df427`; the third list is empty). The change adds citations only, no owned object. Shared objects keep the owners recorded at `e4df427`, and all are consumed here.

## Not verifiable

- Walters1982 and CornfeldFominSinai1982 are uncertified and were not read. The theorem numbers proposed in R01 come from secondary citations only.

## Source issues

- **Misprint** in ParryPollicott1990 at Proposition 6.2, pp. 93–94: the source states conditions (iii)–(v) for some `w` in `L²(m)` or `F_θ` without requiring `w` nonzero, so `w = 0` satisfies them trivially; it should require `w ≠ 0`, as p. 95 does; affects nothing.
