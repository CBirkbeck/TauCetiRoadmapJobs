# FIX-RT-ConstructiveFieldTheoryPhi4~1

Two red-team reviews of 961d8dd (`RT-ConstructiveFieldTheoryPhi4~1a`, four findings; `RT-ConstructiveFieldTheoryPhi4~1b`, two findings). Both F01s report the same defect and are settled once. The two F02s report the same defect but propose different repairs, so each has its own section. Every finding is right. The reviews' "For the human reviewers" and "Source issues" sections list no finding, and nothing was changed because of them.

## RT-ConstructiveFieldTheoryPhi4~1a/F01, RT-ConstructiveFieldTheoryPhi4~1b/F01 (P2) — applied

Verified. At d = 0, `Fin 0 → ZMod (2L)` has one point and `Sym2` of it is diagonal only. The Hamiltonian is then 0, the Gibbs measure is ρ, and `f ≡ −1` gives `|−1|¹ = 1 ≤ −1`. `chessboard`: added binder `(hd : 1 ≤ d)`; the docstring now says d ≥ 1 with `|T_L|` even. README §5.2: "for bounded measurable…" → "for d ≥ 1 and bounded measurable…", plus the f ≡ −1 Check (both sides 1; at d = 0, `1 ≤ −1`).

Pattern: I checked every other Lean statement involving d at d = 0:
- `reflectionPositive`, `twoPoint_reflection_monotone` and `infrared_bound` hold vacuously (no `j : Fin 0` or `i : Fin 0`; no nonzero `k`).
- `gaussian_domination` holds with equality (empty j-sums).
- `exists_infiniteVolume_limit` and `phi4_uniform_expMoment` hold: the box sequence is constant.
- `criticalPoint_ising_ge` holds (see below).
- `gff_reachable` holds: both sides are `N(0, f_i(0) f_j(0))`.
- `exists_reachableField` and `isGaussianProcess_iff_wick` are dimension-free.
- `ising_longRangeOrder` assumes `3 ≤ d`.

The README Conventions ("d ≥ 1 is the dimension") now add that the Lean statements take d ∈ ℕ, hold at d = 0, and that only the chessboard estimate carries d ≥ 1. With this sentence the README and the Lean have the same generality. I did not change README line 511 ("Throughout, ρ is admissible…"), as review ~1a suggested: the Conventions already fix d ≥ 1, and the hypothesis now sits in the sentence that needs it.

## RT-ConstructiveFieldTheoryPhi4~1a/F02 (P3) — applied differently

Verified: the elaborated type was only `(2d)⁻¹ ≤ criticalPoint …`, while the README target and the docstring state `χ ≤ 1/(1 − 2dβ)`. Review ~1a would narrow the README to match the Lean. That would drop the quantitative bound, which is the target's real content. So the Lean was strengthened to match the README instead: this is the repair of ~1b/F02, below. The README target text is unchanged apart from "(`criticalPoint_ising_ge`, which states both inequalities)".

## RT-ConstructiveFieldTheoryPhi4~1b/F02 (P3) — applied

`criticalPoint_ising_ge` now states the conjunction: `∀ β : ℝ≥0, 2dβ < 1 → susceptibility d (β·nnCoupling d) isingMeasure ≤ ENNReal.ofReal (1 − 2dβ)⁻¹`, and `(2d)⁻¹ ≤ criticalPoint d (nnCoupling d) isingMeasure`. The docstring says this, and the module docstring's Layer 4 line now names the susceptibility bound. The README gains a Check at d = 0: χ = 1 = 1/(1 − 0), so the bound is attained there, and β_c = ∞ = (2·0)⁻¹. The existing Checks are unchanged and still hold: β = ¼ gives 1.648721 ≤ 2, and β = 1 is excluded.

## RT-ConstructiveFieldTheoryPhi4~1a/F03 (P3) — applied

Verified at Tau Ceti 2fd255d:
- `TauCeti.Probability.integrable_prod_pow_sub_multivariateGaussian` (MixedMoments.lean:135): any `m`, `c`, any matrix `S`, any exponents `n`.
- `TauCeti.Probability.integral_prod_sub_multivariateGaussian_eq_zero_of_odd` (OddMoments.lean:102): any `S`, repeated indices allowed, `Odd s.card`.

The pin has no general pairing formula, only the fourth moment, `integral_mul_mul_mul_multivariateGaussian` (MixedMoments.lean:162). Main's StandardDistributions §5.3 ("Mixed moments") states the pairing formula.

Changes:
- "From Tau Ceti" gains both declarations.
- The StandardDistributions contract is reduced to the even pairing formula. It now says "Used in 6.4"; the old "and the Gaussian Checks of 3.5" was dropped because those Checks use only `centralMoment_id_two_mul_gaussianReal`.
- The Scope bullet, the 6.4 route, 6.4 *Needs* and the Layer 6 Dependencies are updated to match.

## RT-ConstructiveFieldTheoryPhi4~1a/F04 (P3) — applied

Verified with the review's witness: `S = 1[|x−y| ≤ 1+|x|]` vanishes once `|y| > 1 + 2|x|`. But for every r, the set `{|x| ≥ r, r ≤ |x−y| ≤ 1+|x|}` has positive measure, so (1.10) fails at ε = ½.

The phrase "`S_2(x, y) → 0` pointwise" was replaced by "`sup_{|x−y|≥r} |S_2(x, y)| → 0` as r → ∞", with the one-line proof (set S_2 = 0 on the union of the exceptional null sets for ε = 1/k). The witness is added as a §6.2 Check.

Pattern: every other "(1.10)" occurrence (§6.2 Checks, 7.4, 8.1, 8.2) applies it to a function of x − y or to one dominated by `e^{−|x−y|²/2}`, so each is uniform and correct.

## Checks run

- **Elaboration.** `lake env lean packages/ConstructiveFieldTheoryPhi4/Suggested.lean` gives no errors, only `declaration uses 'sorry'` warnings: 29 of them, one per theorem. No `TauCeti.*` build was needed: the `PerfectMatching` object file was present.
- **Signatures.** I elaborated one scratch copy with `#check @name` for all 60 declarations, with 0 errors. I compared the two changed types with the README:
  - `chessboard : ∀ (d L : ℕ), 1 ≤ d → ∀ [NeZero L] {J}, 0 ≤ J → …` matches §5.2.
  - `criticalPoint_ising_ge : ∀ d, (∀ β : ℝ≥0, 2*↑d*↑β < 1 → susceptibility d (fun e ↦ ↑β * nnCoupling d e) isingMeasure ≤ ENNReal.ofReal (1 − 2*↑d*↑β)⁻¹) ∧ (2*↑d)⁻¹ ≤ criticalPoint …` matches §4.3.

  No binder was lost. The text of the other 58 declarations is unchanged.
- **Dependency check** (command of the brief):

      depcheck: 240 roadmaps, 2254 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name found nowhere. The new Tau Ceti names were opened at the pin, at the lines cited above.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `chessboard` (with d ≥ 1) | d = 0, f ≡ −1; d = 1, L = 1, f ≡ −1; f₀ = f₁ = id, Ising; J = 0, Ising, f₀ = 1+t, f₁ = 1−t; same with J > 0, `τ = tanh 2J` | `1 ≤ −1` (now excluded); `1 ≤ 1`; `τ² ≤ τ²`; `1 ≤ 1·1`; `(1−τ)² ≤ (1+τ)²` | true for d ≥ 1; false at d = 0 | `hd : 1 ≤ d`, Check |
| `criticalPoint_ising_ge` (conjunction) | d = 0; d = 1, β = ¼, 0.4, ↑½, 1; d = 2 and 3 to second order | χ = 1 ≤ 1 and ∞ ≤ ∞; `e^{0.5} = 1.648721 ≤ 2`, `e^{0.8} = 2.225541 ≤ 5`, χ → e ≤ ∞; at β = 1 the hypothesis fails (`ofReal(−1) = 0 < e² = 7.389`); `1+4β+12β² ≤ 1+4β+16β²`, `1+6β+30β² ≤ 1+6β+36β²` | true; the hypothesis 2dβ < 1 is needed under Lean's junk values | Lean stated as the README target, plus a d = 0 Check |
| Conventions: the Lean statements hold at d = 0 except `chessboard` | each theorem with d (list under F01) | vacuous (`Fin 0` index, k ≠ 0); equal sides (`gaussian_domination`); constant sequences (Layer 4); `f_i(0)f_j(0)/m² ÷ 1/m²` (`gff_reachable`) | true | sentence added |
| §6.2: (1.10) iff a representative with `sup_{|x−y|≥r} |S_2| → 0` | the witness S; `e^{−|x|²−|y|²}`; S ≡ 1 | sup = 1 for every r, and (1.10) fails; sup ≤ `e^{−r²/2}`, and (1.10) holds; sup = 1, and (1.10) fails | true both ways | wording, Check |
| From Tau Ceti: integrability and odd vanishing | S non-PSD (the Dirac law); n with odd total degree; repeated index | Dirac at m: odd centred product = 0; `∫x₁³ dN(0,1) = 0`; (x₁, x₁, x₂) with S = I: `E[x₁²]E[x₂] = 0` | matches the pinned statements | contract |
| StandardDistributions §5.3 (pairing only) | n = 1; n = 2 with i = (1,1,1,1); n = 2 with (1,1,2,2), S = I | `S_{11}`; `3S_{11}²`; `1 = S₁₁S₂₂ + 0 + 0` | true | contract narrowed |

## Ownership and sources

No new object or target is introduced. The two Tau Ceti declarations are cited at the pin, and StandardDistributions §5.3 on main stays the owner of the pairing formula. No source was added; `sources.toml`, `metadata.toml` and `design/plan.json` are unchanged (no supplier gap).

## For the maintainer

- `chessboard` has a new explicit binder `hd : 1 ≤ d` after `(d L : ℕ)`.
- `criticalPoint_ising_ge` is now a conjunction whose first component is the susceptibility bound.
- No roadmap on main or at an open head cites either name (`roadmaps grep`).
