# FIX-DESIGN-GaussianIsoperimetryAndClusters~8

Repair round for the review `REV-DESIGN-GaussianIsoperimetryAndClusters~7`, which has three findings, all P3. All three are right and all three are applied. The review's "For the human reviewers" section lists no finding, so nothing was changed because of it.

## F01 (P3) — applied

§7.2 route: "almost every nearby section … meet `H` near both points" → sections over all but a proportion `2ε` of the base `(n − 1)`-ball meet `H` in both cylinders. Being half-lines (§7.1), they give `|C_ρ(y) ∖ H| ≤ 2ε|C_ρ(y)|` on the open segment. A negative-control Check is added (plan test `strips_density_one`).

**Verification.** The review's witness is correct. Take `U = ℝ² ∖ ⋃_{k≥2} {|x_1 − 2^{−k}| < 4^{−k}}`; for `k ≥ 2` the strips are disjoint (checked numerically).
- A strip that meets `ball(x, ρ)`, for `x` on the `x_2`-axis, has `(3/4)2^{−k} ≤ 2^{−k} − 4^{−k} < ρ`. So the strips meet the ball in area at most `4ρ · (4/3)(4ρ/3)² = (256/27)ρ³`, and every point of the axis has density one in `U`.
- The exact fraction of the ball covered by the strips, computed by integrating chord lengths, is `0.166835`, `0.032981`, `0.007093` and `0.000389` at `ρ = 1/4, 1/16, 1/64, 1/1024`.
- Over `(−ρ, ρ)` with `ρ = 2^{−m}`, the empty vertical sections have total length `4^{−m} + Σ_{k>m} 2·4^{−k} = (5/3)4^{−m}`, a proportion `(5/6)ρ`. Summing over the strips gives `0.208333`, `0.104167`, `0.052083` and `0.013021` at `ρ = 1/4, 1/8, 1/16, 1/64`, equal to `(5/6)ρ`.
- So in every neighbourhood a set of base points of positive measure has sections that miss `U`. The old clause is false, and §7.2's statement is unaffected.

CianchiFuscoMaggiPratelli2011 line 935–943 indeed claims only the proportion `1 − 2ε` (their (4.16)). Line 951–960 then fills the segment `(y_1 + ρ, y_2 − ρ)` and concludes `|H ∩ Q_ρ(x̄)| ≥ (2ρ)^n(1 − 2ε)`.

**How the repair differs from the suggested text.** The source and the review use coordinate cubes. `E` is an intrinsic inner product space, so the new route uses cylinders `C_ρ(x) = {x + z + te : z ∈ e^⊥, ‖z‖ < ρ, |t| < ρ}`, which need no basis of `e^⊥`. They satisfy `ball(x, ρ) ⊆ C_ρ(x) ⊆ ball(x, √2 ρ)`. The proof of each step:
- **Density in cylinders.** `|C_ρ ∖ H| ≤ |ball(x, √2ρ) ∖ H| = o(ρ^n)`.
- **Fubini.** Let `B_i` be the set of base points whose section meets `H` in a null set inside `C_ρ(x_i)`. Then `|B_i| · 2ρ ≤ |C_ρ(x_i) ∖ H| ≤ ε ω_{n−1} ρ^{n−1} · 2ρ`, so `|B_1 ∪ B_2| ≤ 2ε` times the volume of the base ball.
- **Half-lines.** A section `(−∞, c)` of positive length in the window about `t_2` has `c > t_2 − ρ`. A section `(c, ∞)` of positive length in the window about `t_1` has `c < t_1 + ρ`. A conull section contains everything. In every case the section contains `(t_1 + ρ, t_2 − ρ)` up to a null set.
- **The window about `y`.** It is `(t_y − ρ, t_y + ρ) ⊆ (t_1 + ρ, t_2 − ρ)` once `ρ ≤ min(t_y − t_1, t_2 − t_y)/2`. That is the README's "at most half the distance from `y` to each endpoint".
- **Back to balls.** `|ball(y, ρ) ∖ H| ≤ 2ε |C_ρ(y)| = 2ε (2ω_{n−1}/ω_n) |ball(y, ρ)|`, and `ε` is arbitrary.

**Pattern search.** I searched README and plan for "nearby", "density one", "density-one" and "comparable with balls". The other hits are §5.1 (a one-dimensional density count, correct), §7.2's statement and the essential-interior contract line. None makes the section claim.

## F02 (P3) — applied

Tau Ceti contract: `TauCeti.Probability.hasDerivAt_cdf_gaussianReal` (Cdf.lean:226) is added, and so is a new bullet with `TauCeti.Probability.quantile_gaussianReal_zero_one` (Quantile.lean:72), `Real.erfInv` (Erf.lean:250) and `Real.hasDerivAt_erfInv` (Erf.lean:376). The §1.1 route now differentiates the closed form. The three names are in the §1.1 *Needs:* line and the plan; `hasDerivAt_cdf_gaussianReal` is also in the §1.2 and §5.2 *Needs:* lines and the plan.

**Verification at the pin.** Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` matches `lake-manifest.json` and the plan baseline.
- `TauCeti/Probability/Distributions/Gaussian/Cdf.lean:226`: `theorem hasDerivAt_cdf_gaussianReal (m : ℝ) {v : ℝ≥0} (hv : v ≠ 0) (x : ℝ) : HasDerivAt (cdf (gaussianReal m v)) (gaussianPDFReal m v x) x`.
- `TauCeti/Probability/Distributions/Gaussian/Quantile.lean:72`: `theorem quantile_gaussianReal_zero_one (hu : u ∈ Ioo 0 1) : (gaussianReal 0 1).quantile u = √2 * Real.erfInv (2 * u - 1)`.
- `TauCeti/Analysis/SpecialFunctions/Erf.lean:250` defines `Real.erfInv`, in the plain `Real` namespace opened at line 221, not `TauCeti.Real`. It inverts `erf` on `(−1, 1)` and is `0` outside.
- `Real.hasDerivAt_erfInv` (line 376) gives the derivative `√π/2 · exp(erfInv y ^ 2)` on `(−1, 1)`.
- No Mathlib declaration of these names exists at `1b1ccf4b`.

**Why `Real.hasDerivAt_erfInv` is added beyond the review's text.** The inverse-function rule with `Φ′ = φ` alone also needs continuity of `Φ⁻¹` at the point, which neither `cdf_quantile` nor `quantile_cdf` gives. The rewritten route gets differentiability of `Φ⁻¹` on `(0, 1)` from the closed form and `Real.hasDerivAt_erfInv`. It then gets the value `(Φ⁻¹)′ = 1/φ(Φ⁻¹)` from the chain rule on `Φ(Φ⁻¹(v)) = v` with `Φ′ = φ`. So every name in the contract is consumed.

**Pattern.** §1.2 differentiates `e^{r²/2}(1 − Φ(r))`, and §5.2 uses `db′/da′ = φ(a′)/φ(b′)`. Both use `Φ′ = φ` directly, so both *Needs:* lines and plan entries gain `TauCeti.Probability.hasDerivAt_cdf_gaussianReal`. The Layer 1 and Layer 5 Dependencies paragraphs now name the derivative of the distribution function, and the closed-form quantile with the inverse error function.

Other places were checked and left unchanged:
- §6.5 (`∂_s H = X^⊥(z + Φ⁻¹(s)e)`), §8.1 and §9.2 reach the derivative of `Φ⁻¹` through §1.1's API (`I″ = −1/I`, that is `(Φ⁻¹)′ = 1/I`), and all three list §1.1.
- The Checks of §2.5 and §4.3 differentiate `Φ`, but Checks carry no *Needs:* line.

## F03 (P3) — applied

- §3.3: "*Needs:* §3.2; Tau Ceti …" → "*Needs:* §2.1 (comparison of weighted and Euclidean variation on relatively compact open sets), §3.2; Tau Ceti …".
- §7.1: "*Needs:* §3.5, §5.3, §6.6." → "*Needs:* §3.5, §5.3, §6.1 (`γ(S_e(H)) = γ(H)`, so that `S_e(H)` is a competitor), §6.2 (good points), §6.4 (the lower bound by sections and its equality case), §6.6."
- Plan: `target:2.1` is added to 3.3, and `target:6.1`, `target:6.2`, `target:6.4` to 7.1.

**Verification.**
- **§3.3.** §2.1's fifth bullet states `(min_{cl Ω′} e^{−W}) |Du|(Ω′) ≤ V_μ(u; Ω′)` on open `Ω′` with compact closure. With `P_μ(U) = 0` this gives `|Dχ_U|(Ω′) = 0`, which is the step "zero perimeter makes `χ_U` locally of zero variation".
- **§7.1, the competitor.** By §6.1, `γ(S_e(H)) = γ(H) = r`, so `S_e(H)` is a competitor and `P_γ(S_e(H)) ≥ P_γ(H)`. Together with §6.6 on `B` and on `B^c` this forces equality on every Borel `B`.
- **§7.1, the chain.** On the good points of §6.2, the chain is §6.4's lower bound for `H`, then `p_H ≥ I(v_H)`, then §6.4's equality case for `S_e(H)`. Equality in `∫ √(p² + ‖∇v‖²)` forces `p_H = I(v_H)` almost everywhere, because `p ↦ √(p² + c²)` is strictly increasing on `[0, ∞)`.
- **Order.** Every added section is earlier than the section that cites it, so the plan's edges stay backward.

**Pattern.** I also read the routes of §7.2 (§2.1, §7.1, density theorem; the new route adds only Fubini, a library fact) and §7.3 (§2.3, §3.5, §5.3, §7.2). Their *Needs:* lines list what the routes use, so they are unchanged.

## Checks

**Dependency check** (command of the brief), after the last edit:

```text
candidate: GaussianIsoperimetryAndClusters is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2233 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. An earlier run in this round reported 2229 edges; the count changed while this roadmap's edges did not (it names no new roadmap).

**Citation resolver** (`roadmaps resolve` on the README): "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None." The tool did not check Lean names outside TauCetiRoadmap. I opened the four new Tau Ceti names at the pin myself (F02).

**Other checks.**
- `plan.json` parses as JSON, and its formatting is preserved: the diff touches only the prerequisite lists of 1.1, 1.2, 3.3, 5.2 and 7.1 and the tests of 7.2.
- No new target and no new roadmap supplier. `gaps` is still empty.
- `sources.toml` is unchanged. Nothing was fetched, and `needs-references.toml` was not written.
- No `Suggested.lean` exists at the design stage, so there was no elaboration and no `#check` binder audit.

## Adversarial pass on the changed text

Values were computed in double precision, with bisection on `erf` and central differences.

| Statement | Instances tried | Values on each side | Result / change |
|---|---|---|---|
| §1.1 route: `(Φ⁻¹)′ = 1/φ(Φ⁻¹)` from the closed form | `v = 0.3` | closed form `√2·2·(√π/2)·e^{erfInv(−0.4)²} = 2.8761037`; difference quotient `2.8761037`; `1/I(0.3) = 1/0.3476926 = 2.8761037` | holds |
| §1.1: `I′ = −Φ⁻¹`, `I″ = −1/I` | `v = 0.3` | `I′` numeric `0.5244005`, `−Φ⁻¹(0.3) = 0.5244005`; `I″` second difference `−2.876107`, `−1/I = −2.876104` | holds; the existing Check is unchanged |
| §1.1 closed form at the junk levels | `v = 0`, `1` | `2v − 1 = ∓1 ∉ (−1, 1)`: `erfInv` is junk `0`, and `quantile_gaussianReal_zero_one` requires `u ∈ (0, 1)` | the route uses it only on `(0, 1)`, as the contract says |
| §1.2 route derivative | `r = 1` | difference quotient `−0.1373640`; formula `e^{1/2}(1·0.158655 − 0.241971) = −0.1373640` | holds |
| §5.2 route `db′/da′ = φ(a′)/φ(b′)` | shift of `(0, 1)`, `a′ = 0.2` | difference quotient `2.6454748`; formula `2.6454748` | holds |
| §7.2 new route, proportion bound | strip set `U` on the `x_2`-axis | proportion of empty sections `(5/6)ρ`: `0.208333` at `ρ = 1/4`, `0.052083` at `1/16`; covered fraction of the square `C_ρ(0)` in `ℝ²` equals that proportion | `ε = (5/6)ρ` satisfies the route's hypothesis, and the `2ε` bound holds; the old "almost every" clause fails |
| §7.2 new route, segment fill | half-line `(−∞, c)` or `(c, ∞)`, windows about `t_1 < t_2`; conull section | positive length in both windows ⇒ `c > t_2 − ρ` or `c < t_1 + ρ` ⇒ contains `(t_1 + ρ, t_2 − ρ)`; a null section is excluded by positive length | holds for `ρ ≤ min(t_y − t_1, t_2 − t_y)/2` |
| §7.2 cylinders against balls | `n = 2`; general `n` | `ball(x, ρ) ⊆ C_ρ(x) ⊆ ball(x, √2ρ)`; `|C_ρ|/|ball| = 2ω_{n−1}/ω_n = 4/π` at `n = 2` | the comparison constant is finite, so density one transfers both ways |
| §7.2 new Check | `ρ = 1/16` | strip area bound `(256/27)ρ³` gives fraction `≤ 0.188628`; exact `0.032981` | holds |
| §3.3 *Needs:* §2.1 | `P_μ(U) = 0` on `ball(0, R)` | `(min e^{−W}) |Dχ_U|(ball) ≤ 0` with `min e^{−W} > 0` ⇒ `|Dχ_U| = 0` | §2.1 is used directly; added |
| §7.1 *Needs:* §6.1/6.2/6.4 | localisation on `B`, `B^c` | `P(S; B) ≤ P(H; B)`, `P(S; B^c) ≤ P(H; B^c)`, `P(S) ≥ P(H)` (competitor by §6.1, finite) ⇒ both equalities; equality in `√(p² + c²)` with `p_H ≥ I(v_H)` ⇒ `p_H = I(v_H)` a.e. | all three sections are used directly; added |

## For the maintainer

- No section was renumbered and no name that other roadmaps cite changed. The new names are pinned Tau Ceti declarations, not this roadmap's own.
- Ownership was not re-examined: this round adds no construction. The review's search, made with the `roadmaps` tool at the index of 2026-11-15, found no other owner.
- No untrusted text contained instructions.
