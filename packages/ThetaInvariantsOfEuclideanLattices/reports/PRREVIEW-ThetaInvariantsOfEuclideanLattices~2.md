# Review of ThetaInvariantsOfEuclideanLattices (pull request #2038 at 9aeff7a)

**Verdict:** needs changes

Blocking: R01 (P2). R02 is P3. Paths are relative to the repository; the README is
`TauCetiRoadmap/ThetaInvariantsOfEuclideanLattices/README.md`, the Lean file
`TauCetiRoadmap/ThetaInvariantsOfEuclideanLattices/Suggested.lean`.

## The previous review's findings at this head

| previous finding | passage at this head | status |
|---|---|---|
| R01 route of the value at `ℤ` unowned | README:340–345 (new target 1.7), README:357–364 (1.8 from 1.7, `legendreK_one_div_sqrt_two`, the reflection formula) | partly: the two inputs are replaced by one target, whose own route still rests on an identity nothing owns (R01 below) |
| R02 Layer 4 absent from Lean | Suggested.lean:225–266: `h0Div`, `h0Div_add_principal`, `h0Div_sub_h0Div_dual`, `exists_h0Div_le`, `h0Div_le_deg_add` | repaired |
| R03 `gaussian_variable_tail` | README:49–58 (Scope), README:499–502 (route and *Needs:* of 3.2), README:519–521 | repaired |
| R04 Groenewegen's Proposition 4.4 | README:478–479: "cf. Groenewegen, Proposition 4.4, p. 148, the weaker bound … for `λ₁ ≥ √n`" | repaired |
| R05 lattice-point count | README:480–483, README:168–172: SieveMethodsAndPrimePatterns §0.11a | repaired |
| R06 complex places in 4.4, 4.5 | README:620 "`x_v + mult v · u`", README:641 "`x_v − mult v · u`" | repaired |
| R07 projected lattice | README:95–96, README:432–433, README:450–451: §0.2.2 `projected_adapted_basis` | repaired |
| R08 `h0θ_nonneg` hypotheses | Suggested.lean:83 `theorem h0θ_nonneg (L : Submodule ℤ E)`; README:260 | repaired |
| R09 Check digits | README:233 `−2.44836`; README:405 `0.9925442 < 1.1803406` | repaired |
| R10 API lists | README:218–228 (1.1), README:559–567 (4.1) | repaired |
| R11 abstract's overstatement | README:675–678: the clause is gone, the families are listed | repaired |

## R01 (P2) — 1.7 is narrowed to `τ = i`, and its route rests on the general identity that nothing owns

**Location.** README:340–345: "Prove `jacobiTheta_I_sq` … (DLMF, 20.9.1 and 20.9.2 at `τ = i`). Route:
DLMF 20.9.2 gives `K(k) = ½π θ₃(0|τ)²` and `K(k′) = −iτ K(k)` … *Needs:* Mathlib `jacobiTheta`; Tau
Ceti `TauCeti.Real.legendreK`." Suggested.lean:124–126.

**Claim.** Two defects in one target.

- The source states the relation for every `τ` (dlmf-20-9 lines 86–127). The target keeps one point
  of it, the one 1.8 consumes. On the imaginary axis the modulus is real, so the relation is statable
  with Tau Ceti's real `legendreK` for every `t > 0`.
- The route's two inputs are DLMF formulas, which the handbook states without proof. Neither is a
  target here, a supplier section or a pinned declaration, and the first, at `τ = i`, is the target
  itself. EllipticIntegrals (on main) excludes "Theta functions and the modular `λ`" (its README:59
  and 478), and `roadmaps grep` finds no other roadmap relating `jacobiTheta` to `legendreK`. The
  route also uses that `K` is strictly increasing, which the *Needs:* line omits.

**Witness.** At `τ = 2i`: `jacobiTheta(2i)² = 1.0074837` and `2K(0.1715729)/π = 1.0074837`, with
`k = θ₂²/θ₃² = 0.1715729`. The relation holds there and the README does not state it.

**Repair.** Restate 1.7 on the imaginary axis and give it a route whose inputs are owned.

- Statement. For `t > 0` put `a = jacobiTheta (t·i)` and `b = jacobiTheta (t·i + 1)`, which is
  `θ₄(0|it)` because `exp(πi n²) = (−1)ⁿ`; both are real and positive. Prove
  `legendreK (√(1 − (b/a)⁴)) = ½π a²`. This elaborates at the pins (probe, `sorry` the only
  warning) with `(jacobiTheta (t * Complex.I)).re` for `a`. State it in `Suggested.lean` in place of
  `jacobiTheta_I_sq`; the value at `i` becomes a step of 1.8.
- Route. Tau Ceti `TauCeti.Real.legendreK_eq_pi_div_two_mul_agm`
  (`TauCeti/Analysis/SpecialFunctions/EllipticIntegral/Gauss.lean:60`) turns the claim into
  `agm(a², b²) = 1`. List as API of 1.7 the two duplication identities
  `a(t)² + b(t)² = 2a(2t)²` and `a(t)·b(t) = b(2t)²`, both by the substitution `m = u + v`,
  `n = u − v` in the double series. They make `agm(a(t)², b(t)²)` invariant under `t ↦ 2t`, and
  `a, b → 1` as `t → ∞`.
- The value at `i`, for 1.8. The same two identities at `t = ½`, with `a(½)² = 2a(2)²` (Mathlib
  `Real.tsum_exp_neg_mul_int_sq`), give `a(1)⁴ = 2b(1)⁴`, so the modulus is `1/√2`.
- *Needs:* Mathlib `jacobiTheta`, `Real.tsum_exp_neg_mul_int_sq`; Tau Ceti `TauCeti.Real.legendreK`,
  `TauCeti.Real.legendreK_eq_pi_div_two_mul_agm`.

Tested, with `a = θ₃(0|it)`, `b = θ₄(0|it)`:

| `t` | `a² + b²`, `2a(2t)²` | `a·b`, `b(2t)²` | `1/agm(1, b²/a²)`, `a²` | `K(√(1 − (b/a)⁴))`, `½π a²` |
|---|---|---|---|---|
| `½` | `2.3606812`, `2.3606812` | `0.8346268`, `0.8346268` | `2.0149674`, `2.0149674` | `3.1651035`, `3.1651035` |
| `1` | `2.0149674`, `2.0149674` | `0.9925442`, `0.9925442` | `1.1803406`, `1.1803406` | `1.8540747`, `1.8540747` |
| `2` | `2.0000279`, `2.0000279` | `0.9999861`, `0.9999861` | `1.0074837`, `1.0074837` | `1.5825517`, `1.5825517` |

At `t = 1`: `a⁴ = 1.3932039 = 2b⁴`, so the modulus is `0.7071068`.

## R02 (P3) — two sentences describe the state of the repository at the time of writing

**Location.**

- README:41–42: "No roadmap on main or in an open pull request states a theta invariant as a
  logarithm or its inequalities."
- README:666: "No roadmap on main or in an open pull request cites this one."

**Claim.** Both sentences refer to pull requests and are true only on the day they were written. The
repository README asks that a roadmap read the same a year later ("Roadmaps are timeless").

**Witness.** No roadmap on main uses this phrasing for ownership or for consumers; `grep` for "open
pull request" over the READMEs on main finds two files, neither in such a sentence.

**Repair.** Delete the sentence at README:41–42; the **Owned here** paragraph already says what
this roadmap owns. Under `## Downstream consumers`, write "None." or name the roadmaps expected to
consume Layers 2 and 4.

## Verified sound

**Gate and build.**

- The worker's gate at 9aeff7a reports every scanner at `0` and the build `OK`. My own run agrees on
  every scanner. Its one line, `depcheck: NOT IN ORDER`, says only that the public merge-order file
  does not list this roadmap yet, which is not a defect.
- `lake env lean` on Suggested.lean prints 21 "declaration uses `sorry`" warnings and nothing else.
  The file has 24 declarations: 3 definitions with real bodies and 21 theorems. (The pull request
  description says 25.)
- Imports: `Mathlib`, `TauCeti.Algebra.Module.ZLattice.Dual` and
  `TauCeti.Analysis.SpecialFunctions.EllipticIntegral.Legendre`, both present at the pin. No
  `set_option`, no sorry'd data, no `lemma`.
- Nothing in the pull request lies outside the roadmap folder, which holds README.md, Suggested.lean
  and metadata.toml.

**Dependency check.** With the candidate merge order, verbatim:

```text
depcheck: 236 roadmaps, 2266 edges, 0 problem(s)
```

The roadmap is at line 141. Its suppliers are earlier: LFunctions (27, on main),
GeometryOfNumbersAndQuadraticArithmetic (55), SieveMethodsAndPrimePatterns (57) and
ArakelovGeometryAndAbelianHeights (140). The description's depends-on block names the three open
ones.

**Elaborated signatures.** I compared the elaborated types of all 24 declarations with the README.
The one binder reported as dropped, `[InnerProductSpace ℝ E]` on `h0θ`, is harmless: the body uses
only the norm. README and Lean have the same generality in every statement.

**Headline theorems.** The Summary lists 1.2–1.8, 2.1–2.4, 3.1–3.3 and 4.2–4.5. Each is stated in
Lean; none is declared unstatable. R01 concerns the generality of 1.7.

**Padding.** On a scratch copy I replaced each `sorry` by
`first | simp [h0θ, h1θ, h0Div] | rfl | norm_num [h0θ, h1θ, h0Div] | positivity`. All 21 theorems
fail. No declaration restates a definition or mirrors a Check.

**Seeded sample of locators.** Source ids: Bos15 (Bost, arXiv:1512.08946v2), GS98 (van der
Geer–Schoof, arXiv:math/9802121v3), Gro01 (Groenewegen, Numdam), dlmf-20-9 (DLMF §20.9, version
1.2.8). Pages are printed pages.

| target | locator in README | found | verdict |
|---|---|---|---|
| 1.2 | Bost (2.1.6), (2.2.3), p. 13; Groenewegen Th. 3.2, p. 146 | Bos15 lines 1066–1071, 1102; Gro01 line 137 | matches (Groenewegen's display: see Not verifiable) |
| 1.4 | Bost Prop. 2.3.2 (1) and equality, p. 14 | Bos15 lines 1143–1170: equality in (2.3.5) iff norm-preserving, in (2.3.6) iff `φ(E) = F` | matches |
| 1.5 | Bost Cor. 2.3.4, p. 16 | Bos15 lines 1213–1218 | matches |
| 1.6 | Bost Prop. 2.5.1, p. 18 | Bos15 lines 1331–1332 | matches |
| 1.7 | DLMF 20.9.1, 20.9.2 | dlmf-20-9 lines 88–90, 121–127 | matches at `τ = i`; narrowed (R01) |
| 1.8 | vdG–S Prop. 4 | GS98 lines 697–699 | matches |
| 2.1 | Bost (2.1.7), p. 13; Groenewegen Lemma 5.2, p. 148 | Bos15 lines 1073–1079 (equality iff `x ∈ V`); Gro01 lines 174–176 | matches |
| 2.3 | Bost Prop. 2.8.1, p. 25; Groenewegen Lemma 5.3, p. 149 | Bos15 lines 1692–1702; Gro01 lines 186–190 | matches |
| 2.4 | Bost (2.8.3), p. 25 | Bos15 lines 1705–1706 | matches |
| 3.2 | Bost Cor. 3.2.3, (3.2.6), p. 34 | Bos15 lines 2111–2126 | matches; `t > 1` is the correct strict form |
| 3.3 | Bost Prop. 3.2.2, (3.2.4), p. 33; Lemma 3.2.1 | Bos15 lines 2096–2107, 2051–2058 | matches |
| 4.1 | vdG–S §2, §3; Bost (2.2.4), p. 13 | GS98 lines 108–114, 237–247; Bos15 line 1108 | matches |
| 4.2 | vdG–S §3 | GS98 lines 248–250; principal divisors lines 89–91 | matches |
| 4.3 | vdG–S Prop. 1; Bost (2.2.6), p. 14; Groenewegen Prop. 6.4, p. 154 | GS98 lines 258–260; Bos15 line 1131; Gro01 line 358 | matches |
| 4.4 | vdG–S Cor. 1 of Prop. 2 | GS98 lines 523–527, 549–552, proof lines 553–565 | matches (source strict, README `≤`) |

Outside the sample: 1.3 (Bos15 lines 1136–1142), 2.2 (Bos15 lines 1712–1725), 3.1 (Bos15 lines
1436–1440 and 1477–1488; the route's integral gives `3ⁿ(1 − n/(2πλ²))⁻¹e^(−πλ²)`), 4.5 (GS98 lines
659–672), Example 1 and Example 2 of GS98 §3 (lines 290–293 and 311–317), Bost's Proposition 2.8.3
(lines 1781–1793), his comparison on p. 34 (lines 2138–2157), Groenewegen's Theorem 7.4 (Gro01 line
394).

**Adversarial pass.** Every value was recomputed in floating point (sums over `|n| ≤ 60`).

| statement | instances | computed values | result |
|---|---|---|---|
| 1.1 `h0θ` | `⊥`; `ℤ`; sum over `L ∖ 0`; exponent `2π` | `0`; `0.0829015`; `log 0.0864348 = −2.4483648`; `0.0037279` | sound |
| 1.1 `h1θ` | `2ℤ` | `h1θ = 0.6931542`, `h0θ = 0.0000070` | sound |
| Gaussian convention | weight `e^(−‖v‖²)` at `2ℤ`, `½ℤ` | `−1.2295356` against `−log 2 = −0.6931472` | witness correct |
| 1.2 | `ℤ`; `2ℤ`; rank 0 | `0 = 0`; `0.0000070 − 0.6931542 = −0.6931472`; `0 = −log 1` | holds |
| 1.3 | `2ℤ`; non-discrete `ℤ + √2ℤ` | `0.0000070 > 0`; `tsum = 0`, `h0θ = 0` with `L ≠ ⊥` | holds; discreteness needed in the iff only |
| 1.4 | `½·id: ℤ → ½ℤ`; `2·id: ½ℤ → ℤ`; projection `ℤ² → ℤ`; `2ℤ ⊆ ℤ` | `0.0829015 ≤ 0.6931542`; `0.6931542 > 0.0829015`; `0.1658030 > 0.0829015`; `0.0000070 < 0.0829015` | holds; iff both ways |
| 1.5 | `2ℤ ⊆ ℤ`; `⊥ ≤ ℤ` | `−0.6102457 ≤ 0.0000070 ≤ 0.0829015`; `0.6931542 ≤ 0.7760487`; `relIndex = 0` would give `0.0829 ≤ 0` | holds; `≠ 0` needed |
| 1.6 | `ℤ × ℤ`; sup norm | `0.1658030 = 2·0.0829015`; `log 1.3457671 = 0.2969642` | holds |
| 1.7 | `τ = i`; parameter `½`; factor `1/π`; `τ = 2i`, `i/2` | `1.1803406 = 2·1.8540747/π`; `1.0731820`; `0.7682254 < 1`; `1.0074837 = 1.0074837`, `2.0149674 = 2.0149674` | true at `i`; holds for every `t` tried, unstated (R01) |
| 1.8 | `π^(1/4)/Γ(3/4)`; route; `Γ(1/4)` | `1.0864348112133` both sides; `Γ(1/4)²/(2π^(3/2)) = 1.1803406 = π^(1/2)/Γ(3/4)²`, `Γ(1/4)Γ(3/4) = 4.4428829 = π√2`; `0.3672031` | holds |
| 2.1 | `ℤ`, `x = ½`, `1`; `ℤ²`, `x = (½, 0)`; rank 0 | `0.9135791 < 1.0864348`; equal; `0.9925442 < 1.1803406`; `1 = 1` | holds |
| 2.2 | `ℤ²`, `K = ℝ(1,1)`, `g = (½,−½)`; `K = ℝe₁`, `g = e₂` | `0.0864281 = e^(−π/2)·0.4157606 ≤ e^(−π/2)·1.0037349 = 0.2086560`; `0.0469491` both sides | holds |
| 2.3 | `ℤ²`, `K = ℝ(1,1)`; `K = ℝe₁`; `K = ℝ(1,√2)` | `0.1658030 < 0.0037279 + 0.3503015 = 0.3540294`; `0.1658030 = 2·0.0829015`; `0.1658 ≤ 0` false without `hK` | holds; `hK` needed |
| 2.3 iff | `K = ℝ(1,1)`; `K = ⊤` | `π(1,0) = (½,−½) ∉ ℤ²`, strict; projection `0 ∈ L`, equality | both directions |
| 2.4 | `ℤ²`, `K = ℝ(1,1)` | duals `ℤ(½,½)`, `ℤ(1,−1)`: `0.1658030 < 0.3540294`, defect `0.1882264` | holds |
| 3.1 | `2ℤ`, `r = 2`; `r = 0.3` | `0.0000070 ≤ 0.0000109` (Groenewegen's own form `0.0000161`); `1 − 1/(2π·0.09) = −0.7683883` | holds; hypotheses needed |
| 3.2 | `2ℤ`, `t = 5.0132565`; `t = 1` | `q = 0.0000288`, `0.0000070 ≤ 0.0000288`; `1/0 = 0` junk | holds; `t > 1` needed |
| 3.3 | `ℤ`, `x = ½`, `t = 1`; `ℤ`, `x = 0`, `t = 2.6` | radius `0.3989423`, `0.9135791 ≤ 1.0864348`; radius `1.0372499`, `0.0000070 ≤ 0.1459504·1.0864348 = 0.1585656` | holds |
| 4.1 `h0Div` | ℚ, `x = 0, 1`; ℚ(i), `x = 0`, weight `2` vs `1`; `I = 0` | `0.0829015`, `1.0000000`; `0.0074559` vs `0.1658030`; `log 1 = 0` | sound |
| 4.1 against LFunctions | ℚ(i): `latticeTheta` weighs a complex coordinate by `y_w‖z‖²` (LFunctions Suggested.lean:677–680) | `y = 2e^(−x)`; dual parameter `4y⁻¹ = 2e^(x)`; `covol·N(y)^(1/2)` gives `e^(∑x)/(√|Δ| N(I))` | parameter correct |
| 4.2 | ℚ, `f = 2`, both signs; ℚ(i), `f = 1 + i`, `x = 0.3` | `0.0829015` vs `1.3862944`; `0.0377094 = 0.0377094` | holds; sign and `mult` pinned |
| 4.3 | ℚ, `x = 1`; ℚ(i), `x = 0`, `0.3`; ℚ(√2), `x = 0`; wrong weight; `I = 0` | `1 = 1`; `−0.6931472 = −½ log 4`; `−0.3931472` both sides; `−1.0397208 = −½ log 8`; `1.3068528 ≠ 0.3068528`; `0 ≠ ∑x − ½ log|Δ|` | holds; `I ≠ 0` needed |
| 4.4 | ℚ, `x = −½`, `−1` | `0.0003910` vs `0.0001955`; `1.658·10⁻¹⁰` vs `8.290·10⁻¹¹`; ratio → `2` | holds with `β ≥ 2` over ℚ |
| 4.5 | ℚ, `x = 1`; ℚ(i), `D = (ℤ[i], 2)` | `1.0000000 ≤ 1.0829015`; `x − mult·u = 0`, degree `0` | holds; route normalised |
| Non-target after 1.3 | hexagonal, `ℤ²`; fcc, bcc, `ℤ³` | `0.1480710 < 0.1658030`; `0.2082624 = 0.2082624 < 0.2487046` | sound |

**Library declarations opened at the pins** (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`).

Tau Ceti, under `TauCeti/`:

- `Algebra/Module/ZLattice/Dual.lean`: `ZLattice.dual` (78), `mem_dual` (89), `dual_dual` (173).
- `Algebra/Module/ZLattice/Covolume.lean`: `ZLattice.covolume_dual`.
- `Algebra/Module/ZLattice/Summable.lean:42`: `summable_exp_neg_mul_norm_add_sq`, for a discrete `L`
  in a finite-dimensional normed space, not necessarily full.
- `Analysis/Fourier/PoissonSummation.lean:309`: `SchwartzMap.tsum_eq_tsum_dual_fourier`.
- `Analysis/Distribution/SchwartzSpace/ZLattice.lean`: `summable_poisson_left` (76),
  `summable_poisson_right` (167); `…/Gaussian.lean:56`: `SchwartzMap.gaussian`.
- `Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:46`: `TauCeti.fourier_gaussian_of_im_pos`.
- `NumberTheory/ModularForms/ThetaSeries/Basic.lean:102`: `ZLattice.thetaSeries`.
- `Analysis/SpecialFunctions/EllipticIntegral/Legendre.lean:95`: `TauCeti.Real.legendreK k`, the
  integral of `(1 − k² sin² θ)^(−1/2)`, so the argument is the modulus, as 1.7 says.
- `…/EllipticIntegral/Lemniscate.lean:148`: `legendreK_one_div_sqrt_two`;
  `…/Monotonicity.lean:128`: `strictMonoOn_legendreK`; `…/Gauss.lean:60`:
  `legendreK_eq_pi_div_two_mul_agm`.
- No declaration at either pin relates `jacobiTheta` to `legendreK` or evaluates `jacobiTheta` at `i`.

Mathlib, under `Mathlib/`: `IsZLattice` (`Algebra/Module/ZLattice/Basic.lean:434`),
`ZLattice.covolume` (`…/Covolume.lean:73`), `dualSubmodule`
(`LinearAlgebra/BilinearForm/DualLattice.lean:37`), `orthogonalProjectionOnto`, `starProjection`,
`HasOrthogonalProjection` (`Analysis/InnerProductSpace/Projection/Basic.lean:120`, `131`, `48`),
`WithLp.linearEquiv` (`Analysis/Normed/Lp/WithLp.lean:236`), `AddSubgroup.relIndex`
(`GroupTheory/Index.lean:62`), `Real.Gamma_mul_Gamma_one_sub`
(`Analysis/SpecialFunctions/Gamma/Beta.lean:512`), `Real.tsum_exp_neg_mul_int_sq`
(`Analysis/SpecialFunctions/Gaussian/PoissonSummation.lean`), `jacobiTheta`
(`NumberTheory/ModularForms/JacobiTheta/OneVariable.lean:29`), `InfinitePlace.mult`
(`NumberTheory/NumberField/InfinitePlace/Basic.lean:274`), `NumberField.discr`
(`NumberTheory/NumberField/Discriminant/Defs.lean:36`), `FractionalIdeal.dual`
(`RingTheory/DedekindDomain/Different.lean:230`), `FractionalIdeal.absNorm`
(`RingTheory/FractionalIdeal/Norm.lean:60`), `instFintypeClassGroup`
(`NumberTheory/NumberField/ClassNumber.lean:59`), `unitLattice_rank`
(`NumberTheory/NumberField/Units/DirichletTheorem.lean:385`). All 16 files named in the Mathlib
contract exist.

**Cross-roadmap citations resolved.**

- GeometryOfNumbersAndQuadraticArithmetic, at the head of its pull request (README lines): §0.2.2
  `projected_adapted_basis` (294, "discrete and full in W-perp"), §0.3.1 `covolume_projection` (357),
  §4.4.4 `latticeGaussianSum` (1750), §4.4.6 (1766), §4.4.7 `gaussian_shift_le` (1770), §4.4.8
  `gaussian_scale_le` (1779), `gaussian_variable_tail` (1831, with `b(c) = c√(2πe)exp(−πc²)`),
  §4.4.13 (1804). Each states what is consumed.
- SieveMethodsAndPrimePatterns, at its head: §0.11a (README:1002), the first-minimum bound
  `|L ∩ K| ≤ (⌊2/λ₀⌋ + 1)^d` for `K` symmetric and `d ≥ 1`.
- ArakelovGeometryAndAbelianHeights, at its head: §1.7 (README:350) has the pairs `(𝔞, λ)`, the
  degree, `(f)`, `O(D)` and the exact sequence, as Conventions say.
- LFunctions, on main: `latticeTheta`, `latticeTheta_inv` (README:510–513),
  `coe_dualIdealLattice` (README:464, Suggested.lean:613).
- EllipticIntegrals, on main: owns `legendreK` and the AGM; excludes theta functions.

**Ownership and overlaps.**

- `roadmaps grep` for `h⁰_θ`, theta invariant, size function, `h0Div`, Poisson–Riemann–Roch and
  Banaszczyk finds no other owner of the logarithmic invariants or of Layer 4;
  GeometryOfNumbersAndQuadraticArithmetic's Gaussian sums are cited, not restated.
- The overlap report: no open pull request changes this roadmap, no cited id is dropped, and none is
  defined only by an open revision.

## Not verifiable

- Groenewegen's displayed formulas (Theorem 3.2, Proposition 4.4, Lemmas 5.2 and 5.3, Proposition
  6.4). The cached Numdam file is a scan whose displays are images, and neither OCR nor a page
  renderer is available on this worker. I confirmed the statement numbers, their pages and the
  surrounding prose; each of these targets also has a Bost locator, verified above. The constant
  `3ⁿπ/(π − log 3)` quoted at README:479 rests on the scan.
- Montgomery (1988), cited in the non-target paragraph after 1.3. Not fetched; the hexagonal value
  was recomputed.
- Banaszczyk (1993), Francini (2001, 2004), Tran (2017), Tran–Tian (2018), Tran–Tian–Feaver (2023)
  and Cohn–Kumar–Miller–Radchenko–Viazovska (2022), cited in Research context or the non-target
  paragraph without targets. Not opened in this round.

## Source issues

- **Misprint** in Bos15 at Corollary 3.2.3, pp. 33–34: the source says the first minimum may equal `(n/2π)^(1/2)`, where the bracket in (3.2.5)–(3.2.6) is `1` and both bounds divide by zero; it should be the strict inequality, as p. 34 then assumes; affects nothing.
- **Misprint** in GS98 at §6, the definition of `η` and the next display, p. 16: the source says `k⁰(O_F)` is a sum over the inverse different and that `h⁰(κ)` equals `exp(η(F)√|Δ|)`; it should be a sum over `O_F` and `log(η(F)√|Δ|)`; affects nothing.
