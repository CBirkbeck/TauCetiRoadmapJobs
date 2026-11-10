# Review of ThetaInvariantsOfEuclideanLattices (pull request #2038 at cff2e46)

**Verdict:** needs changes

One finding, R01 (P3); nothing blocking. Paths are relative to the repository; the README is
`TauCetiRoadmap/ThetaInvariantsOfEuclideanLattices/README.md`, the Lean file
`TauCetiRoadmap/ThetaInvariantsOfEuclideanLattices/Suggested.lean`.

## The previous review's findings at this head

| previous finding | passage at this head | status |
|---|---|---|
| R01 (P2): 1.7 narrowed to `τ = i`, route unowned | README:344–356: "for `t > 0`, with `a(t) = jacobiTheta (t·i)` and `b(t) = jacobiTheta (t·i + 1)` … `K(√(1 − (b/a)⁴)) = ½π a²`", route by `TauCeti.Real.legendreK_eq_pi_div_two_mul_agm` and the two duplication identities (API, README:360–362); README:384–387 derives the modulus `1/√2` in 1.8; Suggested.lean:126–130 states the relation for every `t > 0` | repaired (one API bullet restates a pinned declaration: R01 below) |
| R02 (P3): two sentences about pull requests | README:33–41 (the **Owned here** paragraph ends at "(Layer 4)."); README:694–696 "None." | repaired |

## R01 (P3) — the limits of 1.7 restate a pinned Tau Ceti theorem

**Location.** README:366–367: "Limits: `a(t) → 1` and `b(t) → 1` as `t → ∞`, since `|a − 1|` and
`|b − 1|` are at most `2∑_(n ≥ 1) exp(−πtn)`." Used by the route at README:352–353 and by the
positivity bullet at README:363–365.

**Claim.** The bullet is listed as API to be proved here, with its own estimate. Both limits are
already at the pins, and neither the `*Needs:*` line of 1.7 (README:354–356) nor the Tau Ceti
contract (README:140–156) names the declaration.

**Witness.** Tau Ceti, `TauCeti/NumberTheory/ModularForms/JacobiTheta/OneVariable.lean:129`:
`TauCeti.tendsto_jacobiTheta_comap_im_atTop : Tendsto jacobiTheta (comap im atTop) (𝓝 1)`. The
bullet's estimate is Mathlib `norm_jacobiTheta_sub_one_le`
(`Mathlib/NumberTheory/ModularForms/JacobiTheta/OneVariable.lean:90`).

**Repair.** Replace the bullet by a citation and name the declaration where the route uses it.

- README:366–367 becomes: "Limits: `a(t) → 1` and `b(t) → 1` as `t → ∞`, by Tau Ceti
  `TauCeti.tendsto_jacobiTheta_comap_im_atTop` along `t ↦ t·i` and `t ↦ t·i + 1`, whose imaginary
  parts are `t`."
- Add `TauCeti.tendsto_jacobiTheta_comap_im_atTop` to the `*Needs:*` line of 1.7 and, with its file
  `TauCeti/NumberTheory/ModularForms/JacobiTheta/OneVariable.lean`, to **From Tau Ceti** and to the
  Dependencies of Layer 1.

Tested at the pins: a scratch file importing that module derives
`Tendsto (fun t : ℝ ↦ (jacobiTheta (t * Complex.I)).re) atTop (𝓝 1)` and the same statement at
`t * Complex.I + 1` from the pinned theorem by composition (two lines each, no `sorry`, no error).

## Verified sound

**Gate and build.**

- The worker's gate at cff2e46 reports every scanner at `0` and the build `OK`. My own run, with the
  candidate merge order, prints the same line (every scanner `0`, `OK`).
- `lake env lean` on Suggested.lean prints 21 "declaration uses `sorry`" warnings and nothing else:
  3 definitions with real bodies (`h0θ`, `h1θ`, `h0Div`) and 21 theorems.
- Imports: `Mathlib`, `TauCeti.Algebra.Module.ZLattice.Dual`,
  `TauCeti.Analysis.SpecialFunctions.EllipticIntegral.Legendre`, both present at the pin. No
  `set_option`, no sorry'd data, no `lemma`.
- The pull request changes three files, all in the roadmap folder (README.md, Suggested.lean,
  metadata.toml). Its `lake-manifest.json` is that of main.
- All 20 library file paths backticked in the supplier contracts exist at the pins.

**Dependency check.** With the candidate merge order, verbatim:

```text
depcheck: 236 roadmaps, 2270 edges, 0 problem(s)
```

The roadmap is at line 141 of the order; its suppliers are LFunctions (27, on main),
GeometryOfNumbersAndQuadraticArithmetic (55), SieveMethodsAndPrimePatterns (57) and
ArakelovGeometryAndAbelianHeights (140). No UPWARD or CYCLE line.

**Elaborated signatures.** I compared the elaborated types of the 24 declarations with the README.
The one binder reported as dropped is `[InnerProductSpace ℝ E]` on `h0θ`, whose body uses only the
norm; nothing is lost. Every theorem carries its own binders (`FiniteDimensional`,
`DiscreteTopology`, `IsZLattice`, `Nontrivial E` for rank `≥ 1`), and README and Lean have the same
generality in each statement.

**Headline theorems.** The Summary lists 1.2–1.8, 2.1–2.4, 3.1–3.3 and 4.2–4.5. Each is stated in
Lean on the roadmap's carriers; the docstring declares none unstatable, correctly.

**Padding.** On a scratch copy each `sorry` was replaced by
`first | simp [h0θ, h1θ, h0Div] | rfl | norm_num [h0θ, h1θ, h0Div] | positivity | exact?`. All 21
theorems fail (21 errors). No declaration restates a definition or mirrors a Check.

**Seeded sample of locators.** Source ids: Bos15 (Bost, arXiv:1512.08946v2), GS98 (van der
Geer–Schoof, arXiv:math/9802121v3), Gro01 (Groenewegen, Numdam), dlmf-20-7 and dlmf-20-9 (DLMF
§20.7 and §20.9, version 1.2.8). Pages are printed pages (Bos15: file page − 14; Gro01: file page
+ 141).

| target | locator in README | read at | verdict |
|---|---|---|---|
| 1.1 | Bost (2.2.1), (2.2.2), p. 13 | Bos15 lines 1089–1093 | matches |
| 1.2 | Bost (2.1.6), (2.2.3), p. 13; Groenewegen Th. 3.2, p. 146 | Bos15 lines 1066–1071, 1102; Gro01 line 137 | matches (Groenewegen's display: Not verifiable) |
| 1.3 | Bost Prop. 2.3.1, p. 14; (2.3.2) | Bos15 lines 1136–1142 | matches |
| 1.4 | Bost Prop. 2.3.2 (1) and equality, p. 14 | Bos15 lines 1143–1170: equality in (2.3.5) iff norm-preserving, in (2.3.6) iff onto | matches |
| 1.5 | Bost Cor. 2.3.4, p. 16 | Bos15 lines 1213–1218 | matches, both chains |
| 1.7 | DLMF 20.9.1, 20.9.2; 20.7.5; 20.7.11 at `z = 0` | dlmf-20-9 lines 88–90, 121–127; dlmf-20-7 lines 186–188, 427–429 | matches: `k = θ₂²/θ₃²`, `K(k) = ½π θ₃²`, `θ₃⁴ = θ₂⁴ + θ₄⁴`, `θ₃(q)θ₄(q) = θ₄(q²)²` |
| 2.1 | Bost (2.1.7), p. 13; Groenewegen Lemma 5.2, p. 148 | Bos15 lines 1073–1079; Gro01 lines 174–183 | matches |
| 2.2 | Bost Lemma 2.8.2, p. 25 | Bos15 lines 1712–1725 | matches |
| 2.3 | Bost Prop. 2.8.1, p. 25; Groenewegen Lemma 5.3, p. 149 | Bos15 lines 1692–1702; Gro01 lines 186–190 (equality iff direct sum) | matches |
| 3.1 | Bost Prop. 2.6.2, (2.6.4), (2.6.6), p. 21; Prop. 2.6.1; Lemma 2.6.4; Groenewegen Prop. 4.4, p. 148 | Bos15 lines 1436–1440, 1477–1488, 1551; Gro01 line 164 | matches (Groenewegen's constant: Not verifiable) |
| 3.2 | Bost Cor. 3.2.3, (3.2.6), p. 34 | Bos15 lines 2111–2126, proof 2127–2137 | matches; `t > 1` is the correct strict form |
| 4.1 | vdG–S §2, §3; Bost (2.2.4), p. 13 | GS98 lines 108–114, 237–247; Bos15 line 1108 | matches: real `e^(−2x)`, complex `2e^(−x)` |
| 4.3 | vdG–S Prop. 1; Bost (2.2.6), p. 14; Groenewegen Prop. 6.4, p. 154 | GS98 lines 253–260; Bos15 line 1131; Gro01 line 358 | matches |
| 4.4 | vdG–S Cor. 1 of Prop. 2 | GS98 lines 523–527, 549–566 | matches (source strict, README `≤`); the shift by `u` at real and `2u` at complex places is README's `mult v · u` |
| 4.5 | vdG–S Prop. 3 | GS98 lines 659–674 | matches |

Outside the sample: 2.4 (Bos15 lines 1703–1706), 3.3 (Bos15 lines 2051–2058, 2096–2107), 1.8 (GS98
lines 697–699), 4.2 (GS98 lines 248–250), Examples 1 and 2 of GS98 §3 (lines 290–293, 307, 311–317;
`log(32 + 5√41) = 4.1591271`), Bost's Proposition 2.8.3 (lines 1781–1793), his comparison on p. 34
(lines 2138–2157), the attribution to Quillen (line 1707), Groenewegen's Theorem 7.4 (Gro01 line
394).

**Adversarial pass.** Every value recomputed in floating point (theta sums over `|n| ≤ 80`, `K` by
the midpoint rule with 200000 nodes, independent of the AGM).

| statement | instances | computed values | result |
|---|---|---|---|
| 1.1 `h0θ` | `⊥`; `ℤ`; sum over `L ∖ 0`; exponent `2π` | `0`; `0.0829015`; `log 0.0864348 = −2.4483648`; `0.0037279 = h0θ(√2ℤ)` | sound |
| 1.1 `h1θ` | `2ℤ` | `h1θ = 0.6931542`, `h0θ = 0.0000070` | sound |
| Gaussian convention | weight `e^(−‖v‖²)` at `2ℤ`, `½ℤ` | `−1.2295356` against `−log 2 = −0.6931472` | witness correct |
| 1.2 | `ℤ`; `2ℤ`; rank 0 | `0 = 0`; `0.0000070 − 0.6931542 = −0.6931472`; `0 = −log 1` | holds |
| 1.3 | `2ℤ`; non-discrete `ℤ + √2ℤ`; `ℤ²`, `½ℤ` | `0.0000070 > 0`; `tsum = 0`, `h0θ = 0`, `L ≠ ⊥`; `0.1658030 ≥ 0`, `0.6931542 ≥ 0.6931472` | holds; discreteness needed in the iff only |
| Non-target after 1.3 | hexagonal, `ℤ²`; fcc, bcc, `ℤ³` | `0.1480710 < 0.1658030`; `0.2082624 = 0.2082624 < 0.2487046` | sound |
| 1.4 | `½·id: ℤ → ½ℤ`; `2·id: ½ℤ → ℤ`; projection `ℤ² → ℤ`; `2ℤ ⊆ ℤ` | `0.0829015 ≤ 0.6931542`; `0.6931542 > 0.0829015`; `0.1658030 > 0.0829015`; `0.0000070 < 0.0829015` | holds; iff both ways; `L` in an infinite-dimensional `E` is summable by comparison with `M` |
| 1.5 | `2ℤ ⊆ ℤ`; `h¹`; `⊥ ≤ ℤ` | `−0.6102457 ≤ 0.0000070 ≤ 0.0829015`; `0.0829015 ≤ 0.6931542 ≤ 0.7760487`; `relIndex = 0` would give `0.0829 ≤ 0` | holds; `≠ 0` needed |
| 1.6 | `ℤ × ℤ`; sup norm | `0.1658030 = 2·0.0829015`; mass `1.3457671`, `log = 0.2969642` | holds |
| 1.7 duplication | `t = ½, 1, 2` | `a² + b²` and `2a(2t)²`: `2.3606812`, `2.0149674`, `2.0000279` on both sides; `ab` and `b(2t)²`: `0.8346268`, `0.9925442`, `0.9999861` on both sides | hold |
| 1.7 | `t = ½, 1, 2`; modulus `√(1 − (b/a)²)`; factor `π` | `K` and `½πa²`: `3.1651035`, `1.8540747`, `1.5825517` on both sides; moduli `0.9851714`, `0.7071068`, `0.1715729 = θ₂²/θ₃²`; `agm(a², b²) = 1.0000000` at each `t`; `1.7097562`; `3.7081494`, `6.3302069` | holds; Checks correct |
| 1.7 route | `k² = 1 − (b/a)⁴`, `√(1 − k²) = (b/a)²`; `agm(a², b²) = agm(ab, (a² + b²)/2) = agm(b(2t)², a(2t)²)` | at `t = 1`: `agm(1, b²/a²) = 1/a² = 0.8472131`; `b > 0` since `b(t) = b(2t)²/a(t)` and `b(2ᵏt) → 1` | route closes on pinned inputs |
| 1.8 | value; route; `Γ(1/4)` | `1.0864348112133` both sides; `a(½)² = 2.0149674 = 2a(2)²`, `a(1)⁴ = 1.3932039 = 2b(1)⁴`; `K(1/√2) = 1.8540747 = Γ(1/4)²/(4√π)`; `a² = 1.1803406 = Γ(1/4)²/(2π^(3/2)) = π^(1/2)/Γ(3/4)²`; `Γ(1/4)Γ(3/4) = 4.4428829 = π√2`; `0.3672031 < 1` | holds |
| 2.1 | `ℤ`, `x = ½`, `1`; `ℤ²`, `x = (½, 0)`; rank 0 | `0.9135791 < 1.0864348`; equal; `0.9925442 < 1.1803406`; `1 = 1` | holds, both directions |
| 2.2 | `ℤ²`, `K = ℝ(1,1)`, `g = (½,−½)`; `K = ℝe₁`, `g = e₂`; `g` outside the projection | `e^(−π/2)·0.4157606 ≤ e^(−π/2)·1.0037349`; `e^(−π)·1.0864348` both sides; `0 ≤` right side | holds |
| 2.3 and its iff | `ℤ²`, `K = ℝ(1,1)`; `K = ℝe₁`; `K = ⊤`; `K = ℝ(1,√2)` | `0.1658030 < 0.0037279 + 0.3503015 = 0.3540294`, `π(1,0) = (½,−½) ∉ ℤ²`; `0.1658030 = 2·0.0829015`; projection `0 ∈ L`, equality; `0.1658 ≤ 0` false without `hK` | holds; `hK` needed |
| 2.4 | `ℤ²`, `K = ℝ(1,1)` | duals `ℤ(½,½)`, `ℤ(1,−1)`: `0.1658030 < 0.3503015 + 0.0037279`, defect `0.1882264` as in 2.3 | holds |
| 3.1 | `2ℤ`, `r = 2`; `r = 0.3`; route | `0.0000070 ≤ 0.0000109`; `1 − 1/(2π·0.09) = −0.7683883`; ball of radius `ρ` has first minimum `λ₁/ρ`, count `≤ (2ρ/λ₁ + 1)ⁿ ≤ (3ρ/λ₁)ⁿ` for `ρ ≥ λ₁` | holds; hypotheses needed |
| 3.2 | `2ℤ`, `t = 5.0132565`; `t = 1`; route | `q = 0.0000288`, `0.0000070 ≤ 0.0000288`; `1/0 = 0` junk; `b(t/√(2π)) = t e^(−(t² − 1)/2)` | holds; `t > 1` needed |
| 3.3 | `ℤ`, `x = ½`, `t = 1`; `ℤ`, `x = 0`, `t = 2.6`; route | radius `0.3989423`, `0.9135791 ≤ 1.0864348`; radius `1.0372499`, `0.0000070 ≤ 0.1459504·1.0864348 = 0.1585656`; `tⁿ e^(−π(1 − t⁻²)R²) = (t e^(−(t² − 1)/2))ⁿ` | holds |
| 4.1 `h0Div` | ℚ, `x = 0, 1`; ℚ(i), `x = 0`, weight `2` against `1`; `I = 0` | `0.0829015`, `1.0000000`; `0.0074559` against `0.1658030`; `log 1 = 0` | sound |
| 4.2 | ℚ, `f = 2`, both signs; degree | `0.0829015` against `log θ(1/16) = 1.3862944`; `deg(D + (f)) = deg D − log\|N f\| + log\|N f\|` | holds; sign pinned |
| 4.3 | ℚ, `x = 1`; ℚ(i), `x = 0`, `0.3`; weight `mult·e^(−2x)` at `x = 1`; complex place counted once | `1 − 0 = 1`; `−0.6931472 = −½ log 4`; `−0.3931472` both sides; `1.3068528 ≠ 0.3068528`; `−1.2205053` | holds; normalisation pinned |
| 4.4 | ℚ, `x = −½`, `−1` | `0.0003910` against `0.0001955`; `1.658·10⁻¹⁰` against `8.290·10⁻¹¹`; ratio → `2` | holds with `β ≥ 2` over ℚ; `β` depends only on `K` in the Lean quantifier order |
| 4.5 | ℚ, `x = 1`; degree `0` | `1.0000000 ≤ 1.0829015`; conclusion is the hypothesis | holds |

**Library declarations opened at the pins** (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`).

Tau Ceti, under `TauCeti/`:

- `Analysis/SpecialFunctions/EllipticIntegral/Gauss.lean:60`:
  `legendreK_eq_pi_div_two_mul_agm {k : ℝ} (hk : k ^ 2 < 1) : legendreK k = π / (2 * agm 1 (√(1 - k ^ 2)).toNNReal)`,
  as README:349–350 quotes it.
- `Analysis/SpecialFunctions/EllipticIntegral/Lemniscate.lean:148`: `legendreK_one_div_sqrt_two`,
  `K(1/√2) = Γ(1/4)²/(4√π)`.
- `Algebra/Module/ZLattice/Dual.lean`: `dual` (78), `mem_dual` (89), the two instances (160, 165),
  `dual_dual` (173); `…/Covolume.lean`: `covolume_dual`.
- `Algebra/Module/ZLattice/Summable.lean:42`: `summable_exp_neg_mul_norm_add_sq`, for a discrete `L`
  in a finite-dimensional normed space, not necessarily full.
- `NumberTheory/ModularForms/ThetaSeries/Basic.lean:102`: `ZLattice.thetaSeries`;
  `…/RankOne.lean:37`: `thetaSeries_span_one`.
- `NumberTheory/ModularForms/ThetaSeries/Inversion.lean:104`: `thetaSeries_S_smul` assumes
  `finrank ℝ E = 2 * k`; 1.2 is not a specialisation of it.
- `NumberTheory/ModularForms/JacobiTheta/OneVariable.lean`: `jacobiTheta_sub_natCast_div_two` (37,
  the linear splitting `θ(τ − N/2)`, not one of 1.7's quadratic identities), `jacobiTheta_I_mul`
  (75), `tendsto_jacobiTheta_comap_im_atTop` (129, R01).
- No declaration at either pin relates `jacobiTheta` to `legendreK` or to `agm`, or evaluates
  `jacobiTheta` at `i`.

Mathlib, under `Mathlib/`:

- `Analysis/SpecialFunctions/ArithmeticGeometricMean.lean`: `NNReal.agm` (165), `agm_le_max` (181),
  `min_le_agm` (213), `agm_eq_agm_gm_am : agm x y = agm (sqrt (x * y)) ((x + y) / 2)` (251),
  `agm_mul_distrib : agm (k * x) (k * y) = k * agm x y` (293).
- `Analysis/SpecialFunctions/Gaussian/PoissonSummation.lean:120`: `Real.tsum_exp_neg_mul_int_sq`;
  at `a = ½` it gives `a(½) = √2·a(2)`.
- `NumberTheory/ModularForms/JacobiTheta/OneVariable.lean`: `jacobiTheta`,
  `norm_jacobiTheta_sub_one_le` (90).

**Cross-roadmap citations resolved** (each roadmap as it is now: on main, or at the head of its open
pull request).

- GeometryOfNumbersAndQuadraticArithmetic, README lines: §0.2.2 `projected_adapted_basis` (294,
  "discrete and full"), §0.3.1 `covolume_projection` (357), §4.4.4 `latticeGaussianSum` (1750), §4.4.6
  (1766), §4.4.7 `gaussian_shift_le` (1770), §4.4.8 `gaussian_scale_le` (1779),
  `gaussian_variable_tail` (1831, `b(c) = c√(2πe)exp(−πc²)`, `c ≥ (2π)^(−1/2)`), §4.4.13 (1804). Its
  §4.4.7 states the inequality only; the equality case of 2.1 is not there. Its §4.4.10 bounds the
  mass of `L ∖ 0` for `λ₁ > √n` with the constant `2e^(−3π/4)`; 3.2 is the statement at every
  `t > 1`, not a restatement.
- SieveMethodsAndPrimePatterns: §0.11a (README:1003), the first-minimum bound
  `|L ∩ K| ≤ (⌊2/λ₀⌋ + 1)^d` for `K` symmetric and `d ≥ 1`.
- ArakelovGeometryAndAbelianHeights: §1.7 (README:350) has the pairs `(𝔞, λ)`, the degree
  `log N(𝔞) + ∑λ_v`, `(f) = (f𝓞_K, v ↦ −mult v · log|f|_v)`, `O(D)` with `e^(−λ_v/mult v)|·|_v`, and
  the exact sequence, as Conventions say.
- LFunctions, on main: `latticeTheta` (Suggested.lean:761), `latticeTheta_inv` (787),
  `coe_dualIdealLattice` (614); README:465, 511–513.

**Ownership and overlaps.**

- `roadmaps grep` for `jacobiTheta` with `legendreK`, theta invariant, `h0θ`, size function,
  Poisson–Riemann–Roch, van der Geer, Banaszczyk and Groenewegen finds no other owner of the
  logarithmic invariants, of Jacobi's relation or of Layer 4. No declaration of `Suggested.lean`
  has the fully qualified name of a declaration in another roadmap.
- The overlap report: no open pull request changes this roadmap, no cited id is dropped, none is
  defined only by an open revision. The description's depends-on block names the three open
  suppliers.

## Not verifiable

- Groenewegen's displayed formulas (Theorem 3.2, Proposition 4.4, Lemmas 5.2 and 5.3, Proposition
  6.4). The Numdam file is a scan whose displays are images; its text layer has the prose only, and
  no page renderer is available on this worker. I confirmed the statement numbers, their printed
  pages and the surrounding prose; each of these targets also has a Bost locator, verified above.
  The constant `3ⁿπ(π − log 3)⁻¹` quoted at README:509 rests on the scan.
- Montgomery (1988) and Cohn–Kumar–Miller–Radchenko–Viazovska (2022), cited in the non-target
  paragraph after 1.3: not opened; the numerical values there were recomputed.
- Banaszczyk (1993), Francini (2001, 2004), Tran (2017), Tran–Tian (2018) and Tran–Tian–Feaver
  (2023), cited in Research context without targets: not opened.

## Source issues

- **Misprint** in Bos15 at Corollary 3.2.3, pp. 33–34: the source says the first minimum may equal `(n/2π)^(1/2)`, where the bracket in (3.2.5)–(3.2.6) is `1` and both bounds divide by zero; it should be the strict inequality, as p. 34 then assumes; affects nothing.
- **Misprint** in GS98 at §6, the definition of `η` and the next display, p. 16: the source says `k⁰(O_F)` is a sum over the inverse different and that `h⁰(κ)` equals `exp(η(F)√|Δ|)`; it should be a sum over `O_F` and `log(η(F)√|Δ|)`; affects nothing.
