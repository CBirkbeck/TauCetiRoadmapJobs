# Review of SpecialFunctionsLegendre (pull request #2121 at 2742ccd)

**Verdict:** needs changes

Incremental re-review. The previous review read `9585279`; the folder `TauCetiRoadmap/SpecialFunctionsLegendre/` is byte-identical at `2742ccd` (0 changed lines; the new commit re-runs CI only) and the description is unchanged. So none of the fourteen findings of the previous report is repaired, and each is written again below under its old number, with the witness re-confirmed at this head. Nothing new was found. The gate still fails on `tex`.

## R01 (P1) — 14.7.21 is false for h < −1 with the printed right side

- **Location:** README 4.3, lines 532–536: "14.7.19–14.7.22 with the conditions printed (… `|h| > 1` in 14.7.21; … `|h| > x + (x² − 1)^{1/2}` in 14.7.21), and their complex forms … as `HasSum`"; all powers are principal (Conventions).
- **Claim:** `∑ₙ 𝖯ₙ(x) h^{−n−1} = (1 − 2xh + h²)^{−1/2}` for `|h| > 1`.
- **Witness (recomputed this round, 400 terms):** `(x, h) = (0, −2)`: sum `−0.4472135955`, printed side `+0.4472135955`. `(0.3, −2.5)`: `−0.3380617019` against `+0.3380617019`.
- **Repair:** state 14.7.21, its `x > 1` form and its complex form with right side `h⁻¹ (1 − 2x h⁻¹ + h⁻²)^{−1/2}` (principal power), and add the Check `(0, −2) ↦ −1/√5`. Tested: the corrected side equals the sum at `(0, −2)`, `(0.3, −2.5)`, `(0.3, 2.5)` (`0.4170288281`) and `(0.3, 1.5 + 1.2i)` (`0.4641341779 − 0.3400987768i`).

## R02 (P2) — 14.18.8 is claimed at x = 1, where the series diverges

- **Location:** README 8.3, line 810: "the zonal harmonic series 14.18.8 for `ν ∉ ℤ` and `x ∈ (−1, 1]`".
- **Witness (recomputed):** at `x = 1` every `𝖯ₙ(1) = 1`, and at `ν = 0.3` the partial sums of `(sin νπ/π) ∑ (2n+1)/((ν−n)(ν+n+1))` are `−1.8763`, `−3.0576`, `−4.2431`, `−5.4289` at `N = 10², 10³, 10⁴, 10⁵`: logarithmic divergence, matching the singularity of `𝖯_ν(−1)`.
- **Repair:** "for `ν ∉ ℤ` and `−1 < x < 1`, as `HasSum`"; the closed endpoint, if wanted, is `x = −1` (Dougall's case `x = 1`, `μ = 0`), as a limit of partial sums.

## R03 (P2) — the Legendre function of the second kind on (1, ∞) has a second owner, earlier in the order

- **Location:** README Scope and ownership (lines 54–137) and 7.2; `AutomorphicSpectralTheory` occurs nowhere in the README.
- **Witness (re-resolved):** AutomorphicSpectralTheory, at its open head, README line 653: "Define `legendre_q` … `Q_{s−1}(t)=∫₀∞(t+√(t²−1)cosh u)^(−s)du`" for `t > 1`, `Re s > 0`; line 700 `legendre_q_near_one`. It is line 96 of the merge order; this roadmap is line 402.
- **Repair:** add a Scope clause: "AutomorphicSpectralTheory §0.35–§0.38 defines `Q_{s−1}(t)` for `t > 1`, `Re s > 0` by Heine's integral; `associatedLegendreQ ν μ` is its continuation to all `ν, μ` and to `U`", and in 7.2 the comparison target `associatedLegendreQ (s − 1) 0 t = Q_{s−1}(t)` (14.12.6 at `μ = 0`). Both give `Q₀(3) = ½ ln 2`.

## R04 (P2) — the L² completeness in 11.3 restates RiemannianGeometry R8.2 at m = 2

- **Location:** README 11.3, lines 999–1005 (Stone–Weierstrass route); auxiliary table, line 114; Scope, lines 123–125: "it neither consumes nor restates RiemannianGeometry R8.2".
- **Witness (re-resolved):** RiemannianGeometry on main, "R8.2. Spectral completeness and eigenspace identification" (README line 1450): "Establish orthogonality, completeness and the comparison of the polynomial and Hilbert spectral bases" on every `Sᵐ`.
- **Repair:** add "From RiemannianGeometry: R8.2 (case m = 2)" to Exact supplier contracts and to the Layer 11 *Needs:* line; reduce the completeness bullet to the basis `p_{l,m}` of each `H_l` together with R8.2 and the change of variables to `(θ, φ)` with weight `sin θ`; delete the Stone–Weierstrass row of the auxiliary table. The headline `sphericalHarmonic_hilbertBasis` stays.

## R05 (P2) — the conical pair statement drops DLMF's standing assumption μ ≥ 0

- **Location:** README 10.2, lines 907–909: "for `−1 < x < 1` and `τ > 0`, `𝖯^{−μ}_{−½+iτ}(x)` and `𝖯^{−μ}_{−½+iτ}(−x)` are real, independent and form a numerically satisfactory pair in the sense of 5.1".
- **Witness (recomputed):** at `μ = −½`, `τ = 1` the ratio is `cosh θ / cosh(π − θ)` (14.5.11): `0.0862753` at `θ = 10⁻⁴`, with limit `1/cosh π = 0.0862667 ≠ 0`, so neither function is recessive at `x = 1`.
- **Repair:** add "`μ ≥ 0`" to the pair statement; write the exception of 14.20.3 (line 918) as "except at `τ = 0`, `μ ∈ ½ + ℤ`", which is what the Lean hypothesis of `conicalQHat_eq` encodes.

## R06 (P2) — headlines that can be stated at the pins are missing from `Suggested.lean`

- **Location:** `Suggested.lean` line 372 states only `ferrersP_zero_count` (`μ ≤ 0`, DLMF's unchanged case). The Layer 6 section has `associatedLegendreP_continuedFraction` only.
- **Witness:** the corrected count for `n = m`, `δ_ν ≤ δ_μ` (README 9.2), which the README and the description present as the roadmap's own result, uses the same carriers: `𝖯^{3/4}_{1/4}` has one zero, at `x = 0` (`cos(½π(ν + μ)) = 0` in 14.5.1), while `N₀ = 0`. 14.11.4 (6.1) is statable with `Complex.digamma`.
- **Repair:** add the `N₀ + 1` theorem (hypotheses `ν, μ ∉ ℤ`, `0 < μ`, `⌊μ⌋ ≤ ⌊ν⌋`, `Int.fract ν ≤ Int.fract μ`; conclusion: the zero set in `Ioo (-1) 1` is finite with `ncard = (⌈ν − μ⌉).toNat + 1`) and 14.11.4 for `ν ∉ ℤ` on `(−1, 1)`.

## R07 (P3) — the push gate fails: `tex`, 23 hits

- **Location:** README lines 306–307, 311–312, 316, 382, 418–419 and 1011.
- **Witness:** gate rerun on `2742ccd`: `tex=23 … FAIL`, every other check 0. Inline code spans that wrap across a line break expose `^{…}`, `_{…}` and `∑_{m=−1}^{1}` to the per-line scanner.
- **Repair:** keep each inline code span on one line, or move the long formulas into indented code blocks; rerun the gate.

## R08 (P3) — the Sturm targets of 9.1 have no locator and no exact statements

- **Location:** README 9.1, lines 844–849: "Sturm's comparison theorem; and, for a family of solutions depending continuously on a real parameter with a fixed endpoint behaviour, the number of zeros … changes only when a zero enters or leaves through an endpoint."
- **Witness:** no source in 9.1; the comparison hypotheses and "fixed endpoint behaviour" are undefined; the Abelian estimate (auxiliary table, line 113) has no locator.
- **Repair:** state the comparison theorem with its hypotheses (`q₁ ≤ q₂` on `I`; between consecutive zeros of a nontrivial solution for `q₁` lies a zero of every solution for `q₂`), define the endpoint condition (for example the leading term at `x → 1−` fixed by 14.8.1), and give each a locator (for example Hobson (1931), pp. 386–388, which DLMF names for §14.16(ii)); give the Abelian estimate a textbook locator.

## R09 (P3) — 14.2.4: the README says (−1, 1), the Lean says D

- **Location:** README 5.1, line 577: "14.2.3–14.2.11 on `(−1, 1)`, respectively `(1, ∞)`"; `wronskian_ferrersP_ferrersQ` (`Suggested.lean` line 253) quantifies over `z` with `1 − z, 1 + z ∈ slitPlane`.
- **Witness:** the Lean statement is the stronger one and holds (previous report: `1.35903689 + 0.08009636i` on both sides at a complex point).
- **Repair:** "14.2.3–14.2.6 on `D` (on `(−1, 1)` by restriction), 14.2.7–14.2.11 on `(1, ∞)` and on `U`".

## R10 (P3) — form of `Suggested.lean`

- **(a)** `wronskian_mul_one_sub_sq_eq_const` (line 164) is about arbitrary `f, g : ℂ → ℂ` and names none of the roadmap's objects; the README files it as auxiliary (table, line 109). **Repair:** delete it from `Suggested.lean`; the README keeps it in 1.3.
- **(b)** `eulerIntegral`, `IsEulerContinuation`, `legP`, `cfIndex` and `sphereMeasure` are declared in `Suggested.lean` and occur 0 times in the README (grep at this head). **Repair:** name each in Conventions or Exact supplier contracts, one clause each (the supplier's `𝐅` copied locally; `Pₙ(z)`; the index of the convergent read from a terminating fraction; `sin θ dθ dφ` on `(0, π) × (0, 2π)`).

## R11 (P3) — inputs already at the Tau Ceti pin are not cited, and a *Needs* line is incomplete

- **Witness:** `TauCeti.Contour.classicalResidueTheorem_circle` (`TauCeti/Analysis/Contour/Residue/Theorem.lean:349`) is what Dougall's proof (8.3) needs, but the contracts offer only "the residue theorem for rational functions" (line 266). `MvPolynomial.laplacian_eval_euclidean` and `MvPolynomial.harmonicOnNhd_eval_euclidean_iff` (`TauCeti/Analysis/MvPolynomial/Laplacian.lean:43, 58`) give Laplace's equation for `ρ^l Y_{l,m}` (11.3). None of the three names occurs in the README. The 10.3 *Needs:* line (957) lists "Layers 1–5, 8.2" while 14.20.9 comes from 14.12.1 (7.1) and the Dependencies line (961) says "Layers 1–5, 7–8".
- **Repair:** add the three declarations to "From Tau Ceti" and to the *Needs:* lines of 8.3 and 11.3; add Layer 7 to the *Needs:* line of 10.3.

## R12 (P3) — README shape: Examples sections and Checks

- **Witness:** `### Examples` occurs twice (lines 387 and 564, Layers 1 and 4); Layers 2, 3, 5, 6, 7, 8, 9, 10 and 11 end without one. `ferrersW₁` and `ferrersW₂` are definitions with one Check between them (3.4).
- **Repair:** add `### Examples` to each of those layers; give `ferrersW₁` and `ferrersW₂` three Checks each (the value at `z = 0` and, for `w₂`, the derivative there; the parities; the junk value `0` at `ν + μ = −1` against `𝖯_{−1}(0) = 1`).

## R13 (P3) — locators and references

- **(a)** README 1.2, line 326, cites "the last paragraph of §14.24" for holomorphy in the parameters; it is the penultimate paragraph (the last is about `z → −1` from the left).
- **(b)** References, lines 1114–1115, title Volkmer (2021) "Convergence of the Fourier series of Legendre functions"; DLMF's bibliography has "Fourier series representation of Ferrers function 𝖯".
- **Repair:** correct both.

## R14 (P3) — the description overstates the §14.27 correction

- **Location:** the description: "The roadmap states corrected forms of the DLMF statements recorded in the errata note: … the left-cut zero rule of §14.27."
- **What the head shows:** §14.27 is under Beyond (README line 1057); the README records that the printed rule fails and states no corrected rule.
- **Repair:** reword to "records an error in the left-cut zero rule of §14.27", or state the corrected rule in a layer.

## Previous findings

- R01 — not repaired: lines 532–536 still read "`|h| > 1` in 14.7.21 … `|h| > x + (x² − 1)^{1/2}` in 14.7.21" with the printed right side.
- R02 — not repaired: line 810 still reads "the zonal harmonic series 14.18.8 for `ν ∉ ℤ` and `x ∈ (−1, 1]`".
- R03 — not repaired: the README does not mention AutomorphicSpectralTheory; 7.2 has no comparison target.
- R04 — not repaired: lines 123–125 still read "it neither consumes nor restates RiemannianGeometry R8.2"; the Stone–Weierstrass route and table row remain.
- R05 — not repaired: lines 907–909 still state the pair "for `−1 < x < 1` and `τ > 0`" with no condition on `μ`.
- R06 — not repaired: `Suggested.lean` has `ferrersP_zero_count` only for Layer 9 and no statement of 6.1.
- R07 — not repaired: the gate reports `tex=23` on the same lines.
- R08 — not repaired: 9.1, lines 844–849, unchanged: "Sturm's comparison theorem; and, for a family of solutions … with a fixed endpoint behaviour".
- R09 — not repaired: line 577 still reads "14.2.3–14.2.11 on `(−1, 1)`, respectively `(1, ∞)`".
- R10 — not repaired: `wronskian_mul_one_sub_sq_eq_const` is still at line 164; the five names are still absent from the README.
- R11 — not repaired: line 266 still reads "the residue theorem for rational functions"; the 10.3 *Needs:* line is still "Layers 1–5, 8.2".
- R12 — not repaired: `### Examples` only in Layers 1 and 4; one Check for `ferrersW₁`, `ferrersW₂`.
- R13 — not repaired: line 326 "the last paragraph of §14.24"; lines 1114–1115 "Convergence of the Fourier series of Legendre functions".
- R14 — not repaired: the description still lists "the left-cut zero rule of §14.27" among corrected forms the roadmap states.

## Verified sound

**What changed.** `git diff 9585279 2742ccd` is empty for the whole tree; the folder holds `README.md` (1117 lines), `Suggested.lean` (444 lines) and `metadata.toml`; nothing is changed outside the folder. There are therefore no changed passages and no changed statements to review, and no repair that could have introduced a problem.

**Gate (rerun on 2742ccd).** `tex=23`, FAIL (R07); every other check is 0, including `imports`, `sorry-data`, `readme-ids-missing`, `stray-files`, `outside-folder` and `depcheck`.

**Dependency check (rerun).** Output: `depcheck: 236 roadmaps, 2270 edges, 0 problem(s)`; no UPWARD or CYCLE line.

**Elaboration (rerun).** `lake env lean` on `Suggested.lean`: 41 warnings, all "declaration uses `sorry`", nothing else. The file is unchanged, so the previous report's signature comparison (57 declarations, no `variable` block, none differing from the README) and its one-tactic probe (41 of 41 fall through to `sorry`) stand.

**Witnesses recomputed this round** (independently, double precision): R01 at four points, R02 at four `N`, R05's ratio and limit, R06's zero of `𝖯^{3/4}_{1/4}` at `0`; all agree with the previous report to the digits shown above.

**Citations re-resolved at this round's main (ed7c546) and open heads.**
- AutomorphicSpectralTheory at its open head: `legendre_q` (README line 653) and `legendre_q_near_one` (line 700); merge-order line 96 against 402.
- RiemannianGeometry on main: R8.2 (README line 1450).
- SpecialFunctionsHypergeometric and SpecialFunctionsEiLiErfIncompleteGamma are on main; the two "found nowhere" leads (`Complex.gaussHypergeometric`, `Complex.regularizedGaussHypergeometric`) are the supplier roadmap's README names for `𝐅`, not library declarations, as the README's Conventions say; not a finding.
- Tau Ceti pin: `classicalResidueTheorem_circle` (`Analysis/Contour/Residue/Theorem.lean:349`), `laplacian_eval_euclidean` and `harmonicOnNhd_eval_euclidean_iff` (`Analysis/MvPolynomial/Laplacian.lean:43, 58`).
- `overlaps.md`: no other open pull request changes this roadmap, no dropped ids; confirmed. The closest open roadmaps (SpecialFunctionsBessel, SpecialFunctionsConfluent, AsymptoticExpansions, LaguerreJacobi, Equidistribution) were compared in the previous review; ownership against open pull requests beyond R03 and R04 was not re-run this round.

**Locator sample.** The fifteen seeded targets fall in unchanged text. The previous report read the DLMF 1.2.8 pages for its own sample (1.1, 1.2, 2.2, 4.1, 4.2, 4.4, 5.1, 5.3, 6.1, 7.2, 9.1, 9.2, 10.2, 10.3, 11.2) and checked, in its adversarial table, the statements of this round's remaining seeds (1.4, 3.2, 3.3, 6.2, 7.1, 8.1, 8.2, 11.2, 11.3). DLMF was not re-read this round.

### Adversarial table

No statement changed, so there is no new row. Every row below is carried forward from the previous report (pull request #2121 at 9585279), whose values were computed there; the rows for 14.7.21, 14.18.8 at `x = 1` and the conical pair were recomputed this round with the same values. Values are left side / right side, or the quantity computed.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `ferrersP` (14.3.1), 1.1 Checks | `𝖯^{1/2}_{0.3}(cos 1)`; `𝖯^{0.4}_{0.3}(0.25)`; `𝖯^0_1(0.3+0.2i)` | 0.605997010362 / closed form 0.605997010362; 0.514894433658 (README 0.51489 44336 58); 0.3+0.2i | holds | — |
| `ferrersQ` (14.3.12), 1.1 Checks | `𝖰^0_0(0.5)`; `𝖰^1_0(0.3)`, `𝖰^1_0(−0.6)`; `𝖰^{0.4}_{0.3}(0.25)` | 0.549306144334 = ½ ln 3; −1.04828483672, −1.25 = −(1−x²)^{−1/2}; −0.993017785692 (README) | holds | — |
| `associatedLegendreP` (14.3.6) | `P^{1/2}_{0.3}(cosh 1)`; `P^{0.4}_{0.3}(1.5+0.7i)` | 0.984366026347 both; 0.990129160991+0.015249104129i (README) | holds | — |
| `olverLegendreQ` (14.3.7), branch | `𝑸^0_0(3)`; `𝑸^1_0(2i)`; `𝑸^1_0(−10⁻⁶+2i)` against the principal `(z²−1)^{−1/2}`; `𝑸^{0.4}_{0.3}(2)` | 0.34657359028 = ½ ln 2; −0.4472135955i; −0.44721i against +0.44721i; 0.355186769329 (README) | holds; the principal root is discontinuous at 2i | — |
| `associatedLegendreQ` (14.3.10) | `Q^0_1(2)`; `Q^{0.4}_{0.3}(2)`; `(ν, μ) = (−0.6, −0.4)` | 0.0986122886681 = ln 3 − 1; 0.0997310496112+0.306940609534i (README); junk 0 | holds | — |
| `differentiable_ferrersP_degree` | Cauchy–Riemann in ν at `(μ, z, ν) = (0.35+0.4i, 0.4+0.3i, 0.7−0.2i)` | ∂_{Re ν} = ∂_{Im ν}/i = −0.954373201+0.150303163i | holds | — |
| `ferrersP_conj` | same point | 0.395887831471−0.0746426733907i both | holds | — |
| `olverLegendreQ_neg_order` | `(0.3, ±0.4, −1.5+0.8i)`, a point of `U` with `Re z < 0` | −0.410652971574+0.0657549191513i both | holds | — |
| `ferrersP_legendreEquation`, `olverLegendreQ_legendreEquation` | real and complex points; `z = 2`, `z = −1.5+0.8i` | residuals 9·10⁻⁹, 1.4·10⁻⁸; 7.6·10⁻⁸, 6.9·10⁻⁸ (finite-difference noise) | holds | — |
| `wronskian_mul_one_sub_sq_eq_const` | symbolic | `((1−z²)W)′ = −2zW + 2zW = 0`, using the equation | true, not a headline | R10 |
| `ferrersP_neg_nat_order` (14.9.3 form) | ν ∈ {0.37, 1, 0, −1, 2.5+0.3i}, m ∈ {1, 2}, z = 0.2+0.1i | equal throughout (for example 3.86721275037+0.437897953822i at ν = 2.5+0.3i, m = 2); 0 = 0 at the Pochhammer zeros | holds | — |
| 1.4 Checks (14.9.3, 14.3.15) | `𝖯^{−1}_2(0.3)`; `P^{−0.4}_{0.3}(2)` | 0.143090880213 = −𝖯^1_2/6 = x√(1−x²)/2; 1.01402040115 by 14.3.15 and by 14.3.9 (README) | holds | — |
| `ferrersP_recurrence_14_10_3` | `(0.3, 0.4, 0.25)`; complex `(0.7−0.2i, 0.35+0.4i, 0.4+0.3i)` | residual −3.4·10⁻¹⁵; 4.4·10⁻¹⁶ | holds | — |
| `hasDerivAt_ferrersP` (14.10.4) | complex point | 0.997580940956+0.201207685314i / 0.997580940983+0.201207685278i | holds | — |
| `ferrersP_zero` (14.5.1) | `(0.3, 0.4)`; `(0.7−0.2i, 0.35+0.4i)`; `(−1.3, 2.2)` | 0.364525505405 both (README); −0.031383158013−0.263034678288i both; −0.0865273216194 both | holds | — |
| `ferrersP_eq_ferrersW` (14.3.11) | `(0.3, 0.4, 0.25)`, complex point, `(1, 0, 0.3)`; excluded point `(−1, 0, 0)` | equal; at the excluded point `𝖯 = 1`, `w₁ = w₂ = 0` | holds; the hypothesis is needed | — |
| `ferrersQ_eq_div_sin` (14.3.2) | three points, including `(−1.2, 0.5, −0.3)` | equal (1.24075892594 at the last) | holds | — |
| `regularizedGaussHypergeometric_eq_associatedLegendreP` (15.9.17) | `(0.3, 1.2, 0.5)`; complex z = 0.3+0.6i, −0.7+0.2i, 0.8−0.5i | 1.24282086548 both (README); equal at all three | holds | — |
| `ferrersP_neg_half_cos` (14.5.21), 14.5.27 | θ = 1; ξ = 1 | 1.06633424558 both; 1.11448003641 both (README) | holds | — |
| `ferrersP_nat_eq_shiftedLegendre` (14.7.1) | n = 0…4 and n = 12, x = 0.3 | equal (−0.181002179662 at n = 12) | holds | — |
| `ferrersQ_nat` (14.7.2–14.7.3) | n = 0…4, x = 0.3 | equal; 𝖰₂(0.3) = −0.562974655534 = 14.5.29 (README); W₁ = 0.45 | holds | — |
| `hasSum_ferrersP_nat_mul_pow` (14.7.19) | `(0.3, h = 0.5)`; `h = 0.6e^{2.3i}` | 1.02597835209 = 0.95^{−1/2}; 0.834922586863+0.204817877999i both | holds | — |
| 14.7.21 (README 4.3) | `(x, h) = (0, −2)`, `(0.3, −2.5)`, `(0.3, 2.5)` | −0.4472135955 / printed +0.4472135955; −0.33806 / +0.33806; equal for h > 0 | fails for h < −1 | R01 |
| `ferrersP_isEquivalent_one` (14.8.1) | `(0.3, 0.4)`, `(0.3, −1.6)`, `(1.1, 2.5)` at x = 1 − 10⁻⁶ | ratios 0.99999957, 1.0000003, 1.0000001 | holds | — |
| 14.8.3 Check | ν = 0.3, x = 1 − 10⁻⁵ | 𝖰_ν − ½ ln(2/(1−x)) = −0.408040; −γ − ψ(1.3) = −0.408024776035 (README) | holds | — |
| `wronskian_ferrersP_ferrersQ` (14.2.4) | `(0.3, 0.4, 0.2)`; complex point on D | 0.850284791 = Γ(1.7)/Γ(0.9) (README); 1.35903689+0.08009636i both | holds | R09 |
| `ferrersQ_connection_14_9_2` | four points, including μ = 2 and ν = −2.4 | equal (≈ 0 at μ = 2) | holds | — |
| `olverLegendreQ_whipple` (14.9.16) | `(0.3, 0.4, 2)`; complex (ν, μ), x = 1.3 | 0.355186769329 both; 0.470339772393+0.140821368994i both | holds | — |
| `tendsto_associatedLegendreP_cut` (14.23.1) | `(0.3, 0.4, 0.25)`, ε = 10⁻⁶ | 0.416558708−0.302646858i against e^{−0.2πi}𝖯 = 0.416558347−0.302647355i, an O(ε) gap | holds | — |
| `tendsto_olverLegendreQ_cut` (14.23.2) | ODE continuation from z = 2 via 2 ± i; real and complex (ν, μ) | −0.360947536 ∓ 1.36248818i, equal to the Lean right sides | holds | — |
| `associatedLegendreP_continuedFraction` (14.14.1 corrected) | `(0.3, 0.4, 1.5)`, `(1.7, −0.6, 3)`, `(−0.2, 1.3, 1.2)`; `(5/8, −11/8, 2)` | fraction 0.345161187629 = corrected side, printed side 0.81272070827 (README); same pattern at the other two; conv₃ = 0 with B₃ = 15/32, P^{11/8}_{5/8}(2) = −7·10⁻¹⁷, nested division 0.613636 = 27/44 | holds | — |
| Large-order estimate (minimality, 6.2) | k = 5, 20, 60 at `(0.3, 0.4, 2)` | 1.0290, 1.0090, 1.0032, tending to 1; large-degree estimate 0.99899, 0.99968, 0.99989 | holds | — |
| 14.14.3 | `(0.3, 0.4, 1.5)`; `(1.2, −0.7, 2.5)` | −0.0337444499303 both (README); 0.116363075112 both | holds | — |
| `ferrersP_cos_eq_integral` (14.12.1) | `(0.3, 0.2, θ = 1)`; `(1.3+0.4i, −0.7+0.1i, θ = 2)` | equal to 9 digits | holds | — |
| `olverLegendreQ_nat_eq_integral` (14.12.13) | n = 0, z = 3; n = 2, z = −1.5+0.7i; n = 3, z = 0.2+0.4i | 0.34657359 both; 0.000487074−0.017624178i both; 0.020429216+0.016951170i both | holds | — |
| `integral_cpow_mul_ferrersP` (14.17.5) | `(0.7, −0.4, 0.6)`; complex `(0.3+0.2i, 0.5, −0.6+0.3i)` | 0.574095286 / 0.574095287 (README); 1.0515543−1.1986380i / 1.0515547−1.1986378i | holds | — |
| `integral_ferrersP_mul_ferrersP` (14.17.6) | (l, m, n) = (2,1,2), (3,1,3), (1,2,3), (2,1,4) | 2.4 = 12/5; 3.4285714; 0; 0 | holds | — |
| `integral_ferrersQ_mul_ferrersP_mul` (14.17.17) | in range (2,1,2), (3,2,2), (2,2,3), (3,1,3); outside (4,1,2) | about 10⁻¹⁰ each; −0.194444444 = −7/36 (README) | holds | — |
| Adams coefficients (7.4) | (m, n) = (1, 2) | A(0..3) = 1, 1, 3/2, 5/2, giving c₀ = 3/5 and c₁ = 2/5 | holds | — |
| `ferrersP_cos_eq_fourier` (14.13.1) | `(0.3, −0.2, 1)`; `(0.3, 0.3, 1)` (conditional); `(1.1+0.2i, −0.6, 2.2)` | 0.88595484 (N = 2·10⁵) against 0.885954849 (README); averaged partial sums 0.7899305 against 0.7899317; equal | holds | — |
| `ferrersP_addition` (14.18.2) | n = 3, θ = (0.7, 1.9), φ = 0.8; also θ₁ + θ₂ = 4.2 | −0.252222484 both; −0.176929684 both | holds (DLMF's θ₁ + θ₂ < π is not needed for integer n) | — |
| `hasSum_ferrersP_dougall` (14.18.9) | `(0.3, 0.5, 0.2)`; `(0.3+0.4i, 0, −0.6)`; `(2.7, 1.25, 0.5)` | 0.89592599 / 0.895925986 (README); 0.4598041−0.8617199i both; 0.090493808 both | holds | — |
| 14.18.8 at x = 1 (README 8.3) | ν = 0.3 | partial sums −1.876, −3.058, −4.243, −5.429 at N = 10²…10⁵ | diverges | R02 |
| `hasSum_heine` (14.28.2) | z₁ = 2.5+0.5i, z₂ = 0.4−0.3i | 0.41584158−0.15841584i both | holds | — |
| `ferrersP_zero_count` (μ ≤ 0) | (2.5, −0.3), (−0.4, −0.05), (3, −2.5), (−½, 0), (1, −1), (2, −2), (½, −½) | zero counts 3, 0, 1, 0, 0, 0, 0; `⌈ν+μ⌉.toNat` gives the same | holds | — |
| 9.2 corrections | (¼,¾), (0.3,0.3), (1.6,1.6), (1.2,1.7), (2.2,2.9); (3.3,1.3); (2.7,1.3); (0.3,2.5); (0.3,1.5); (2.6,1); (3.3,2); 𝖰 at (−0.369,−0.206); P at (0.184,−0.088); 𝑸^{1/2}_{−3/2} | 1 zero each, N₀ = 0; 3; 2; 1; 0; 2; 2; minimum 2.24 > 0; minimum 0.4075 on (1, 10⁷); ≡ 0 | README corrections hold; DLMF's statements fail | R06 |
| `hasSum_olverLegendreQ_toroidal` (14.19.6) | (μ, ξ, φ) = (0.3, 0.8, 1.1); (−0.2+0.3i, 1.5, 2.5) | 1.335060409 both; 0.7581442002−0.0897431436i both | holds | — |
| 14.19.3 Check | (ν, μ) = (½, 0), ξ = 0.7 | 1.08952705 for all three expressions | holds | — |
| `conicalQHat_eq` (14.20.3) | (μ, τ, x) = (0.3, 1.1, 0.4), (0.7, 0.4, −0.3), (−0.6, 0.8, 0.2), (0.3, −1.1, 0.4), (1.2, 0, 0.3), (−0.3, −0.5, 0.6) | 0.3432632457 both (README), 1.22279441, 0.4109892143, −3.683343657, 2.27350404, 2.4669082, each on both sides | holds for all real μ, τ under the Lean hypothesis | R05 (prose only) |
| `conicalQHat_eq_cut` (14.23.7 corrected) | four points as above | corrected side equals 𝖰̂ (imaginary part about 10⁻¹¹); printed side 0.1172071991−0.1613218698i at (0.3, 1.1, 0.4) (README) | holds | — |
| Conical pair (10.2) | μ = −½, τ = 1, θ = 10⁻⁴ | ratio 0.086275 → 1/cosh π = 0.086267; at μ = ½ the ratio is 8.7·10⁻⁶ | fails for μ < 0 | R05 |
| 14.20.9, 14.20.7 | (τ, θ) = (1, 2); (μ, τ) = (0.6, 0.9) | 3.130976523 against quadrature 3.13097647 (README 3.13097 65197 5); ratio 0.9999941 | holds | — |
| `generalizedLegendre_solution` (14.29.1) | (0.37, 0.6, −0.45), z = 0.3+0.2i | residual 1.5·10⁻⁸ against abs(w) = 0.24 | holds | — |
| `integral_sphericalHarmonic_mul` (14.30.8) | (2,1,2,1), (2,−1,2,−1), (3,−2,3,−2), (2,1,3,1) | 1, 1, 1, 8·10⁻¹¹ | holds | — |
| `ferrersP_eq_sum_sphericalHarmonic` (14.30.9) | l = 1, 3; (θ₁, φ₁, θ₂, φ₂) = (0.7, 0.3, 2.1, 1.9) | −0.4023652997 both; 0.4406927729 both | holds | — |
| `sphericalHarmonic` Checks, Herglotz 14.30.8_5 | Y₀₀, Y₁₁, Y₁,₋₁; (t, r, θ, φ, λ) = (0.7, 0.9, 1.1, 0.5, 0.8+0.3i) | Y₀₀ = 0.282094791774; Y₁₁ = −√(3/8π) sin θ e^{iφ}; Y₁,₋₁ = −conj Y₁₁; Herglotz both sides 1.28163061−0.588281115i | holds | — |
| 14.3.17, 14.3.18, 14.3.19 regions (3.3) | 14.3.17 at z = 1.5 ± 10⁻⁹i, 0.3+0.5i, −0.4−0.7i, −2+0.3i; 14.3.18 at −0.5+0.5i and 1.3+0.4i; 14.3.19 at 2 and −1.5+0.8i | 14.3.17 equal, limits from both sides agree (0.8695535724); 14.3.18: 0.813110483704+0.570253092087i against 0.810056501843+0.388355814619i (README), equal at 1.3+0.4i; 14.3.19 equal | README regions correct | — |
| 14.12.4 second hypothesis (7.2) | (ν, μ) = (−1.5, 0.2) | growth exponent abs(Re(ν+½)) − Re μ − ½ = 0.3 > 0 while DLMF's conditions hold | README correct | — |
| `sphericalHarmonic_hilbertBasis` | statement read against R8.2 | true; also stated on main | holds | R04 |

## Not verifiable

As in the previous report; none of these texts was opened, and no text was fetched this round.
- Olver, *Asymptotics and Special Functions* (1974); Erdélyi et al., *Higher Transcendental Functions* I (1953): not opened.
- Hobson (1931): §132 and pp. 386–401 match the locators in DLMF's notes; the text was not read.
- Adams (1878): not opened; the linearization coefficients were checked only at `(m, n) = (1, 2)` and through 14.17.17.
- Dunster (1991), Volkmer (2021), Andrews–Askey–Roy (1999): not opened.
- The README's claims under Beyond about 14.15.23 and 14.20.17–14.20.18 were not checked.

## Source issues

These are the entries of the previous report, unchanged (the first was recomputed this round).

- **Error** in DLMF 1.2.8 at 14.7.21, §14.7(iv): the source says the sum of 𝖯ₙ(x)h^{−n−1} equals (1 − 2xh + h²)^{−1/2} for abs(h) > 1; it should be h^{−1}(1 − 2x/h + h^{−2})^{−1/2}, which differs in sign when h < −1 (x = 0, h = −2: −1/√5); affects a stated result.
- **Error** in DLMF 1.2.8 at 14.12.4, §14.12(ii): the source gives the integral for P^{−μ}_ν under ν + μ ≠ −1, −2, … and Re(μ − ν) > 0 only; it should also require Re(μ + ν) > −1, since at (ν, μ) = (−1.5, 0.2) the integrand grows like e^{0.3t}; affects a stated result.
- **Error** in DLMF 1.2.8 at 14.14.1, §14.14: the source equates the fraction with ½(x² − 1)^{1/2} P^μ_ν/P^{μ−1}_ν; it should be ½(x² − 1)^{1/2}(ν + μ)(ν − μ + 1) P^{−μ}_ν/P^{1−μ}_ν (at (0.3, 0.4, 1.5): 0.34516 against 0.81272); affects a stated result.
- **Gap** in DLMF 1.2.8 at §14.16(ii): the source's two lists of conditions cover neither n = m with δ_ν ≤ δ_μ (μ > 0, ν, μ ∉ ℤ); the N₀ + 1 list should read n ≥ m (𝖯^{3/4}_{1/4} has one zero, at x = 0); affects a stated result.
- **Error** in DLMF 1.2.8 at §14.16(ii): the source states the parity rule for the zeros of 𝖰^μ_ν for every real μ; it fails for μ < 0, since at (ν, μ) = (−0.369, −0.206) both cosines are positive but 𝖰^μ_ν > 0 on (−1, 1); affects a stated result.
- **Error** in DLMF 1.2.8 at §14.16(iii), condition (b): the source omits μ > 0; at (ν, μ) = (0, −½), P^{−1/2}_0(cosh ξ) = (2/(π sinh ξ))^{1/2}·2 sinh(ξ/2) has no zero on (1, ∞), though (b) predicts one; affects a stated result.
- **Error** in DLMF 1.2.8 at 14.23.7, §14.23: the source's second factor is e^{−3μπi/2}; it should be e^{μπi/2} (at (μ, τ, x) = (0.3, 1.1, 0.4) the printed side is 0.11721 − 0.16132i, and 𝖰̂ is 0.34326); affects a stated result.
- **Error** in DLMF 1.2.8 at §14.27, condition (a): the source predicts exactly one zero of P^μ_ν(x ± i0) on (−∞, −1) at ν = 1, μ = −½; it should predict none, because P^{−1/2}_1(x) = ((x − 1)/(x + 1))^{1/4}(1 + 2x)/(3Γ(3/2)) does not vanish there; affects a stated result.
- **Error** in DLMF 1.2.8 at §14.2(iii): the source calls 𝖯^{−μ}_ν(±x) recessive at ±1 whenever Re μ ≥ 0; it should require Re μ > 0 or μ = 0, since at ν = 0, μ = i the ratio of 𝖯^{∓i}_0 has modulus 1; affects a stated result.
- **Gap** in DLMF 1.2.8 at §14.21(iii): the source lists 14.3.18 among the formulas that extend to complex z without naming the branch of its 𝐅; it should say that with the principal 𝐅 it holds for Re z > 0 only (at z = −0.5 + 0.5i: 0.81311 + 0.57025i against 0.81006 + 0.38836i); affects a stated result.
