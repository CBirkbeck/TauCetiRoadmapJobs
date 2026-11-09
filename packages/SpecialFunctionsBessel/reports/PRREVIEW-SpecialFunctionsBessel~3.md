# Review of SpecialFunctionsBessel (pull request #1987 at 1e4c517)

**Verdict:** needs changes

Six findings: two P2 and four P3. The push gate passes on this head, the build elaborates with `sorry` as the only diagnostic, and the dependency check reports no problem. The two P2 are a case split of DLMF 10.22.75 that the README gets wrong (8.3) and a second owner of the auxiliary Gegenbauer polynomial among the open roadmap pull requests. Every repair was tested on the instance that refutes the original: numerically in plain Python (no mpmath), against the DLMF 1.2.8 text at the cited lines, or against the sibling roadmap's text.

**Repairs of the previous review (at 2736ecb), finding by finding.**
- R01 (plane wave, `shiftedLegendre`): repaired. README line 465 "`P_n(x) = P̃_n((1 − x)/2)`", line 1365, and `Suggested.lean` line 583 `.eval ((1 - Complex.cos α) / 2)`. Recomputed: the sum equals `e^{iz cos α}` at `(z, α) = (1, 0)`, `(1.3, 0.7)`, `(2 + 0.5i, 0.4)` to `2e−15`.
- R02 (positive-axis ownership): repaired. Lines 209–211 are gone; `### From AnalyticNumberTheoryPartI` (lines 369–386) and `### From AutomorphicSpectralTheory` (388–393) added; 5.3 lines 902–904 consume the size bounds; `besselK_ofReal_eq_positiveAxisBesselK` (`Suggested.lean` 363) is the agreement target; 1.7 and 5.5 cite §2.1a for positivity.
- R03 (Sturm comparison): repaired. Line 158 now concludes on `(a, b)` with the exception "unless `q₁ = q₂` on `[a, b]` and `v` is a constant multiple of `u` on `[a, b]`".
- R04 (7.5): repaired. Line 1145 "for `ν ≥ 0` and `λ > 1`"; lines 1147–1148 state the `(m + m₀)`th zero for 10.21.53.
- R05 (1.4, 1.5): repaired. Lines 549–550 "with `λ ≠ 0`, on every open set on which `z^q` and `λ z^q` avoid `(−∞, 0]`"; line 560 "all for `z` in the slit plane".
- R06 (divergent Check): repaired. Line 1260 now has `J_{7/2} J_{1/2}`.
- R07 (10.10.1 and 10.23.20 statable): repaired. `tendsto_convs_besselJ` (`Suggested.lean` 378–382), `tendsto_sum_fourierBessel` (510–518); docstring lines 14–18 no longer list 4.1 as unstatable.
- R08 (`tex`), R09 (`h.choose`), R10 (`readme-ids-missing`): repaired; the gate reports `tex=0`, `statement-hygiene=0`, `readme-ids-missing=0`. `besselY`/`besselK` use `Complex.cos (ν * π)` (lines 70, 89).
- R11: repaired, line 746 "10.12.4 is 10.12.2 at `θ = 0`". R12: repaired, lines 759, 780, 788 (10.32.12 in 3.2; 10.32.13–10.32.19 in 3.3).
- R13: repaired. Bickley's function defined at lines 1279–1282 with three Checks; `O_n` Checks 736–740; `ρ_ν` Checks 1104–1109; Kelvin phase Checks 1457–1461.
- R14: repaired. Lines 271–273 (10.61.5 for integer `n`, all real `x`); lines 1373–1378 (`b = 0` through 10.22.43).
- R15: repaired. `tendsto_integral_besselJ {ν : ℂ} (hν : -1 < ν.re)` (527), `integral_cpow_mul_besselK {ν μ : ℂ} (h : |ν.re| < μ.re)` (532), `besselJZero_spec (ν : ℝ)` (476); README lines 1191, 1276.
- R16: repaired. `besselJ_one_half`, `sphericalBesselJ_zero`, `integral_cpow_mul_exp_mul_besselJ` are deleted; README lines 829, 1310 carry the statements without backticked names.
- R17: repaired. Lines 1530–1536 name SpecialFunctionsConfluent and StandardDistributions only.
- R18: repaired. No pull-request number or coordination narrative remains (grep); line 227 reads "`I_ν` has the shape of Tau Ceti's `Real.besselI`"; lines 449–455 list `analyticAt_besselJ`, `analyticAt_besselJ_int`, `besselJ_neg_comm`.
- R19: repaired. Lines 1507–1513.

## R01 (P2) — 8.3 misstates the cases of DLMF 10.22.75: the two regions with `A < 0` carry opposite signs, and `A = 0` is not a case of the formula

**Location.** README lines 1268–1269: "DLMF 10.22.73–10.22.75 with `A` of 10.22.73: each case `A > 0`, `A < 0`, `A = 0` stated separately."

**Claim.** 10.22.74 and 10.22.75 split into the three cases `A > 0`, `A < 0`, `A = 0`, each a theorem.

**Witness.** DLMF 10.22 lines 3011–3016: for `|ν| < ½`, the integral of 10.22.75 is `−(abc)^ν (−A)^{−ν−½}/(π^{½} 2^{ν+1} Γ(½ − ν))` for `0 < a < |b − c|`, `0` for `|b − c| < a < b + c`, and `+(abc)^ν (−A)^{−ν−½}/(…)` for `a > b + c`. Both outer regions have `A < 0`, with opposite signs, and `A = 0` is not a case. Computed at `ν = 0`: for `(a, b, c) = (0.5, 2, 1)`, `A = −0.4102`, the partial integrals to `R ≈ 200–238` average `−0.246` (DLMF `−0.2485`); for `(4, 2, 1)`, `A = −6.5625`, they average `+0.0597` (DLMF `+0.0621`). At `A = 0` (`a = b + c = 3`, `b = 2`, `c = 1`, `ν = 0.4`) the partial integrals are `1.93, 3.61, 6.71, 12.49` at `R = 50, 100, 200, 400`: the integral diverges (the product has a non-oscillating component `∼ t^{ν−½}`).

**Repair.** Replace the sentence by: "DLMF 10.22.73–10.22.75 for positive `a`, `b`, `c` with `A` of 10.22.73: 10.22.74 for `Re ν > −½` with its two cases `A > 0` and `A ≤ 0`; 10.22.75 for `|ν| < ½` with its three cases `0 < a < |b − c|`, `|b − c| < a < b + c` and `a > b + c` (the first and third have `A < 0` and opposite signs; at `a = |b − c|` and `a = b + c` the integral diverges and nothing is stated)." Add the divergent instance above as a negative-control Check, and the two signed values as Checks.

## R02 (P2) — The auxiliary Gegenbauer polynomial has a second owner: LaguerreJacobi F2 defines `Polynomial.gegenbauer` by the same explicit sum

**Location.** README line 160 (auxiliary table: "Gegenbauer's polynomials `C_n^{(ν)}(x)` by the explicit sum 18.5.10 …"), lines 684–690 (2.5: "`Complex.gegenbauerC ν n x` … This roadmap owns the facts about it that 10.23.8–10.23.9 need"), and `Suggested.lean` lines 141–146.

**Claim.** Neither Mathlib, Tau Ceti nor a consumed roadmap provides Gegenbauer's polynomial, so this roadmap defines it (lines 151–152).

**Witness.** LaguerreJacobi (pull request #117, a new roadmap folder, found with `roadmaps grep --fixed Gegenbauer`), README lines 476–499, F2: `Polynomial.gegenbauer (lam : R) (n : ℕ) : R[X]` "given by its own explicit sum", `∑ₖ (−1)ᵏ (λ)ₙ₋ₖ/(k! (n − 2k)!) (2X)^{n−2k}`, with `gegenbauer lam 2 = C (2*lam*(lam+1)) * X^2 − C lam` and the multiplied-out relation to its Jacobi family. `Complex.gegenbauerC ν n x` is `(Polynomial.gegenbauer ν n).eval x` over `ℂ`, term for term. LaguerreJacobi is not in the merge order and not on main, and this README does not name it. Two open roadmaps own one object.

**Repair.** Either (a) consume it: add `### From TauCetiRoadmap.LaguerreJacobi` citing F2 for the polynomial, delete `gegenbauerC` from `Suggested.lean` and the auxiliary table, keep in 2.5 only the three facts F2 does not state (18.12.4, 18.18.17 and `C_n^{(1/2)} = P_n`) as auxiliaries about `Polynomial.gegenbauer`, and name LaguerreJacobi in the merge-order paragraph of the pull request; or (b) keep `gegenbauerC` as a roadmap-local copy, as the file already does for `airyAi` and `positiveAxisBesselK`: say so in Scope and ownership and in the docstring at line 141, naming LaguerreJacobi F2 as the owner of the polynomial, and state the agreement `gegenbauerC ν n x = (Polynomial.gegenbauer ν n).eval x` as a target of 2.5. The brief's list of sibling checkouts does not include #117; I report it because the roadmaps grep covers every open roadmap pull request.

## R03 (P3) — 5.2 states 10.40.1, 10.40.3 and 10.40.5 "on the principal sheet" without their sectors; 10.40.1 is false outside `|ph z| ≤ π/2 − δ`

**Location.** README lines 882–884: "DLMF 10.17.3–10.17.4, 10.17.9–10.17.10, 10.40.1, 10.40.3 and 10.40.5 on the principal sheet, and 10.40.6–10.40.9 … 10.17.3–10.17.4 hold in `|ph z| ≤ π − δ` as generalized expansions".

**Claim.** The sectors of 10.40.1, 10.40.3 and 10.40.5 are those of the principal sheet, as for 10.17.3–10.17.4.

**Witness.** DLMF 10.40 line 90: 10.40.1 holds for `|ph z| ≤ π/2 − δ`; line 181: 10.40.3 likewise; line 267: 10.40.5 for `−π/2 + δ ≤ ±ph z ≤ 3π/2 − δ`. At `z = 10 e^{i(π − 0.01)}`, `I₀(z) = 2801.65 − 266.56i` while the leading term `e^z/(2πz)^{1/2}` of 10.40.1 is `6.0×10⁻⁷ − 5.7×10⁻⁶ i`.

**Repair.** Write the sectors: "10.40.1 and 10.40.3 in `|ph z| ≤ π/2 − δ`; 10.40.5 in `−π/2 + δ ≤ ±ph z ≤ π − δ`, the part of DLMF's sector on the principal sheet; 10.40.6–10.40.9 with the sectors stated there." Add the instance above as a negative-control Check for 10.40.1.

## R04 (P3) — 7.3 states 10.21.16 for `ν ≥ 0`; DLMF requires `ν > 0`, and at `ν = 0` the formula divides by `j′_{0,1} = 0`

**Location.** README lines 1115–1116: "For `ν ≥ 0` and `z` in the slit plane, `J_ν(z) = (z/2)^ν/Γ(ν + 1) ∏_k (1 − z²/j_{ν,k}²)` (10.21.15; `hasProd_besselJ`), and 10.21.16."

**Claim.** 10.21.16 holds for `ν ≥ 0`.

**Witness.** DLMF 10.21 line 676 gives 10.21.15 for `ν ≥ 0` and line 710 gives 10.21.16 for `ν > 0`. At `ν = 0` the right side of 10.21.16 has the factor `1/Γ(0) = 0` and the product contains `1 − z²/j′_{0,1}²` with `j′_{0,1} = 0` (10.21.1), while `J′₀(1) = −J₁(1) = −0.4400506`.

**Repair.** Write "and, for `ν > 0`, 10.21.16".

## R05 (P3) — 7.2 omits `ν ≥ 0`, which DLMF assumes for the interlacing, for `ρ_ν`, `σ_ν` and for 10.21.12

**Location.** README lines 1099–1102: "DLMF 10.21.2–10.21.14: the interlacing 10.21.2 (`besselJZero_interlace`) and 10.21.3, the cylinder functions … and their zeros `ρ_ν(t)`, `σ_ν(t)` (10.21.4–10.21.11), defined as continuous increasing functions of `t` through the phase, and 10.21.12–10.21.14."

**Claim.** The statements hold for every real `ν` (7.1 is stated "for every real `ν`", and 7.2 adds no hypothesis).

**Witness.** DLMF 10.21 line 166 "When `ν ≥ 0`, the zeros interlace"; lines 382–383 "If `ν ≥ 0` and these functions are fixed by" 10.21.7; line 546 "if `ν ≥ 0`, then" 10.21.12. The phase `θ_ν` of 5.4, through which the README defines `ρ_ν`, is itself defined for `ν ≥ 0` (line 306). `besselJZero_interlace` carries `0 ≤ ν` (`Suggested.lean` 483); the README does not.

**Repair.** Begin 7.2 with "For `ν ≥ 0`:".

## R06 (P3) — 11.1 describes 9.8.9–9.8.12 as "through `M_{1/3}`, `θ_{1/3}` and their derivatives"; 9.8.10 and 9.8.12 are through the order `2/3`

**Location.** README lines 1485–1487: "DLMF 9.8.9–9.8.12, the Airy modulus and phase through `M_{1/3}`, `θ_{1/3}` and their derivatives".

**Claim.** The four formulas involve `M_{1/3}`, `θ_{1/3}` and derivatives.

**Witness.** DLMF 9.8 lines 371–374: `|x|^{1/2} M²(x) = ½ξ (J²_{1/3}(ξ) + Y²_{1/3}(ξ))`; lines 407–410: `|x|^{−1/2} N²(x) = ½ξ (J²_{2/3}(ξ) + Y²_{2/3}(ξ))`; lines 436–439 and 467–470: `θ(x) = 2π/3 + arctan(Y_{1/3}/J_{1/3})`, `φ(x) = π/3 + arctan(Y_{2/3}/J_{2/3})`, with `ξ = (2/3)|x|^{3/2}` and the branches fixed by `θ(0) = −φ(0) = π/6` (line 364). No derivative of a Bessel function occurs.

**Repair.** Write "DLMF 9.8.9–9.8.12: `M²`, `N²` through `M²_{1/3}(ξ)`, `M²_{2/3}(ξ)` and the arctan forms of `θ`, `φ` through `θ_{1/3}(ξ)`, `θ_{2/3}(ξ)` modulo `π`, with the branches `θ(0) = −φ(0) = π/6`".

## Verified sound

**Gate and build.**
- Gate re-run on this head with `--build` and the candidate merge order: every rule `0`, `OK` (13 s, oleans cached). The folder holds `README.md`, `Suggested.lean`, `metadata.toml`; nothing changes outside it.
- `lake env lean` of `Suggested.lean`: 49 warnings, all `declaration uses sorry`, and the 48 `#check` outputs; no other diagnostic.
- Dependency check (`--movable`): `depcheck: 236 roadmaps, 2263 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- One-tactic probe: a scratch copy with every `sorry` replaced by `first | rfl | simp | norm_num | infer_instance` reports `unsolved goals` at all 49 theorems; none is padding by that test. Each remaining theorem is a DLMF identity or expansion on the roadmap's carriers.
- Signatures: the 86 elaborated types in the worker's list were compared with the README statements; none lost a binder. Casts as intended: `k / 2` real in `hasSum_kelvinBer`, `(-3 : ℤ)` a zpow in McMahon, `((b / a : ℝ) ^ 2 : ℝ)` cast once in 10.22.64, `(n : ℂ) + 3 / 2` complex in the spherical series.
- Lean form: `import Mathlib` plus the two Tau Ceti modules, which exist at pin `2fd255d9`; no `set_option`, no `lemma`, no sorried data, no `example`.
- Overlaps: the worker's report lists no open pull request changing this roadmap, no dropped id cited, none cited that only an open revision defines.

**Library declarations opened at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`).**
- `Mathlib/Analysis/SpecialFunctions/Bessel.lean`: `besselJ` 55, `besselJ_def` 59, `besselJ_int_neg` 62, `odd_besselJ` 65, `even_besselJ` 69, `analyticAt_besselJ` 75, `analyticOnNhd_besselJ` 79, `besselJ_neg_int` 84, `besselJ_neg_comm` 100, `analyticAt_besselJ_int` 105, `analyticOnNhd_besselJ_int` 116, `besselJ_zero` 119, `two_mul_self_mul_besselJ` 123: the README's "From Mathlib" list is exactly this file.
- `Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean`: `regularizedHGFunCoeff` 67, `regularizedHGFun` 192, `analyticOnNhd_regularizedHGFun_of_card_le` 282, `regularizedGaussHGFun` 428, `radius_regularizedGaussHGFunSeries_eq_top_of_left` 468.
- `Mathlib/RingTheory/Polynomial/ShiftedLegendre.lean` 40 (`shiftedLegendre`), 84 (`coeff_shiftedLegendre`); the convention `P̃_n(y) = P_n(1 − 2y)` gives `P₁(0.3) = 0.3`, `P₃(0.3) = −0.3825`, `P₄(0.3) = 0.0729375` at `(1 − x)/2`.
- `Mathlib/Algebra/ContinuedFractions/Basic.lean` 95–130: `GenContFract` is `h + a₀/(b₀ + a₁/(b₁ + …))`, so `tendsto_convs_besselJ` with `a₀ = 1`, `aₙ = −1`, `bₙ = 2(ν + n)/z` is 10.10.1; `convs` 320; `Stream'.Seq.ofStream` `Data/Seq/Defs.lean` 592.
- `Mathlib/Analysis/Complex/RemovableSingularity.lean` 101 (`differentiableOn_update_limUnder_of_bddAbove`).
- Tau Ceti `Analysis/SpecialFunctions/BesselI.lean`: `besselI` 81, `besselI_def` 85, `besselI_eq_rpow_mul` 92, `hasSum_besselI` 102, `besselI_pos` 129, `besselI_zero` 150, `tendsto_rpow_neg_mul_besselI_nhdsGT_zero` 164, `hasDerivAt_besselI` 210, `hasDerivAt_rpow_neg_mul_besselI` 226, `besselI_sub_besselI` 237, `integral_exp_mul_cos_mul_cos` 315; `RegularizedHypergeometric.lean` 53 (`hasSum_regularizedHGFun`).

**Cross-roadmap citations resolved (on main at 1bea835, or at the open head).**
- AsymptoticExpansions (main): Conventions `Asymptotics.HasAsymptoticExpansion` (README 125, `Suggested.lean` 47); §§1.5 (381), Layer 2 (419), 4.2 (552), 4.3 (562), 5.4 (699), 5.5 (717), 8.1 (904), 8.2 (919), 8.6 (1052), 10.1 (1183), 10.2 (1201), 10.3 (1211), 10.4 (1229), 11.1 (1293), 11.4 (1327): every cited section and anchor exists.
- AnalyticNumberTheoryPartI (main): §2.1a at README 1216 with the `besselK` interface as quoted in the contract; `besselK (ν : ℂ) (c : ℝ)` at `Suggested.lean` 625–628 is character for character the body of `positiveAxisBesselK`; §3.23b at README 2698–2730 defines `Y_ν` on `Re z > 0` by the integral that is the right side of `besselY_eq_schlafli`, and states the 10.40.2 and 10.17.4 remainder bounds with `|ν| < m + ½` and `|ν| < min(2r + ½, 2s + 3/2)` as the contract says.
- AutomorphicSpectralTheory (#925 head): §0.25 at line 534 defines `I_ν(y) = (y/2)^ν ₀F̃₁(;ν+1;y²/4)` with the four API items the contract lists.
- SpecialFunctionsAiry (#1928 head): 1.7 at line 426, `exp_neg_mul_kummer_two_mul` at README 459 and `Suggested.lean` 259–261 with hypothesis `∀ k, 2a ≠ −k`, matching the contract; 8.3 at line 1343 owns the `J₀` integral "for every complex argument"; `airyAi` at `Suggested.lean` 64–66 equals the local copy; its Downstream consumers (1634–1640) name this roadmap for exactly the three items consumed. No cycle: it consumes nothing from here.
- SpecialFunctionsParabolicCylinder (main): Conventions 134–147 (`parabolicCylinderU`, `Real.parabolicCylinderW`). SpecialFunctionsEiLiErfIncompleteGamma (main): §4.1 at 700–718 (`IsMinimalSolution`, `contFrac`, `pincherle`); the 16 names of the contract at Conventions 163–177. StandardDistributions (main) owns `Real.besselI` (1229).
- SpecialFunctionsConfluent (#1995 head, lines 66–68, 375–386) consumes `Complex.besselY`, `hankelH1`, `hankelH2`, `besselI`, `besselK`, 10.39.5, 10.32.9 and the Sturm comparison of 7.1 from this roadmap, and owns 10.39.6–10.39.8 as this roadmap's exclusions say. SpecialFunctionsHypergeometric (#2089, line 896) uses the same `shiftedLegendre n` at `(1 − x)/2` convention.
- Ownership greps over main and the 458 open heads for Kelvin, spherical Bessel, Hankel, `besselY`, `besselK`, Neumann polynomial, Bickley, Debye, Fourier–Bessel: no second owner (MaassForms' and BianchiModularForms' "Fourier–Bessel expansion" is the automorphic expansion, a different object; #924 uses AnalyticNumberTheoryPartI's `besselK` as a variable). Gegenbauer: see R02.

**Sampled locators against DLMF Release 1.2.8 (texts in the cache; 10.8, 10.13, 10.34, 10.36, 10.38 fetched this round; 10.23 read online, since the service yields only its figure PDF).**
- 1.2 (10.2.3–10.2.4, lines 262–315; "each branch of `Y_ν(z)` is entire in `ν`" for fixed `z ≠ 0`, line 361): correct.
- 1.4 (10.6.1–10.6.10; 10.6.4–10.6.5 with `λ ≠ 0`, lines 196–237): correct.
- 1.9 (10.34.1–10.34.7, lines 53–261 of 10.34; 10.36.1–10.36.2, lines 47–75 of 10.36): correct, seven and two equations.
- 2.2 (10.8.1–10.8.3, lines 64–146 of 10.8; 10.31.1–10.31.3): correct; the Check "10.8.1 at `n = 0` reduces to 10.8.2 with `ψ(1) = −γ`" is right.
- 2.6 (10.23.10–10.23.13 and 10.44.4–10.44.6): correct; 10.23.13 is `O_n(t) = ¼ ∑_{k≤n/2} (n−k−1)! n/(k!(n−2k)!) (2/t)^{n−2k+1}`, which gives the Checks `O₁ = t⁻²`, `O₂ = t⁻¹ + 4t⁻³`.
- 3.1 (10.9.1–10.9.16, 10.32.1–10.32.11; 10.9.7 for `|ph z| < π/2`, line 354; 10.32.9 for `|ph z| < π/2`, line 349): correct, and the `φ = θ + π/2` reduction of the Airy integral to 10.9.1 is right.
- 3.2 (10.9.17–10.9.21 for `|ph z| < π/2`, 10.9.19's loop "continuous `t^{ν+1}`, principal on the positive axis", lines 772–953; 10.32.12, line 485): correct.
- 3.3 (10.9.22–10.9.30, 10.32.13–10.32.19; 10.9.30 for `|ph z| < π/2`, line 1354): correct.
- 4.2 (10.15.1–10.15.9, 10.15.6–10.15.9 for `x > 0` through `Si`, `Ci`, lines 295–415; 10.38.1–10.38.7, 10.38.6–10.38.7 for `x > 0` through `E₁`, `Ei`, lines 264–305): correct.
- 5.2: correct for 10.17.3–10.17.4 and 10.17.9–10.17.10 (`|ph z| ≤ π − δ`, lines 153, 201, 424, 462) and 10.40.6–10.40.9; see R03 for 10.40.1, 10.40.3, 10.40.5.
- 5.5 (10.14.1 `ν ≥ 0, x ∈ ℝ`, line 56; 10.14.4 `ν ≥ −½`, line 150; 10.14.8 `n = 0, 1, 2, …` with the principal `(1 − z²)^{1/2}`, lines 272–301; §10.37 lines 70–80 including the `|ph z| ≤ π/2` sector of 10.37.1 and its erratum): correct.
- 6.1 (10.41.3–10.41.6 "uniformly for `0 < z < ∞`", line 298; 10.41.12–10.41.13 "as `z → ∞` with `ℓ (≥ 1)` and `ν (> 0)` both fixed", `O(1/z^ℓ)` inside the bracket, lines 566–610; DLMF's own route through Olver pp. 377–378 and 10.34.3, lines 647–662): correct, and the Lean statements match (`atTop ×ˢ 𝓟 (Ioi 0)` for the uniform form, `atTop` with the bracket remainder for the fixed-order forms).
- 7.6 (10.22.37 for `ν > −1`, line 1486; 10.23.18 `∫₀¹ t^{1/2}|f| < ∞`, 10.23.19 for `ν ≥ −½`, 10.23.20 to `½(f(x−) + f(x+))` for `f` of bounded variation on `[a, b]`, `0 < a < x < b < 1`): correct; `tendsto_sum_fourierBessel` carries exactly these hypotheses.
- 8.3: see R01.
- 11.1 (9.6.2 with `ζ = (2/3)z^{3/2}`, lines 102–115; 9.6.15–9.6.20, lines 606–788; 9.12.22 for `|ph z| < π/3`, 9.12.23 principal value for `x > 0`, lines 915–953; 9.13.2 and 9.13.4, lines 108–187): correct except R06. DLMF states no sector for 9.6.2 (see Source issues); the README's `|ph z| < 2π/3` is the correct one for principal branches (table below).
- Also checked: 10.21.1, 10.21.2 (`ν ≥ 0`), 10.21.7–10.21.10 (`ρ_ν(0) = 0`, `j_{ν,m} = ρ_ν(m)`, `y_{ν,m} = ρ_ν(m − ½)`, `𝒞′_ν(ρ_ν) = (½ρ_ν ρ′_ν)^{−1/2}`), 10.21.15–10.21.16, 10.21.48–10.21.54 (lines 2251–2470: `ν ≥ 0`, `λ > 1`; "not necessarily the `m`th" for 10.21.53), 10.21.55, 10.22.41 (`Re ν > −1`), 10.22.43, 10.22.49 (`Re(μ+ν) > 0`, `Re(a ± ib) > 0`), 10.22.63–10.22.64, 10.13's standing `λ ≠ 0, p ≠ 0, q ≠ 0`, 10.61.5, 10.61.9.

**Adversarial table.** Computed in double precision from the pinned definitions (series for `|z| ≤ 22`, Hankel asymptotics beyond; `K` by 10.32.9 for `|w| > 6`; integrals by composite Simpson).

| Statement | Instance | Left side | Right side | Result |
|---|---|---|---|---|
| `besselY` def, integer branch | `Y_{10⁻⁶}(1) − Y₀(1)` | `−1.2019668e−6` | Check `−1.20197e−6` | holds |
| `besselY` def, sign | `Y_{1/2}(0.8+0.3i)` | `−0.5849283+0.2977076i` | `−(2/(πz))^{1/2} cos z`, same | holds |
| Checks 1.1, 1.2, 1.7 | `J₀(1), Y₀(1), Y₁(1), K₀(1), I₀(1)` | `0.7651976866, 0.0882569641, −0.7812128211, 0.4210244383, 1.2660658778` | Checks | hold |
| `besselJ_mul_deriv_besselY_sub` | `ν = 0.7`, `z = 1+0.5i` | `0.5092958−0.2546479i` | `2/(πz)` same | holds |
| `besselY_sub_one_add_besselY_add_one` | `ν = 1.3`, `z = 0.9+0.4i` | `−1.7924542+1.9336703i` | same | holds |
| `hankelH2_neg` | `ν = 0.3+0.2i`, `z = 1+i` | `−0.1618328−0.0476799i` | same | holds |
| `besselK_eq_hankelH1` | `ν = 0.3+0.1i` at `z = 2i, 1.5, 0.7−0.2i`; `ν = 2`, `z = 1.3−0.4i` | e.g. `−0.8213233−0.3453565i` | same (≤ 3e−11) | hold |
| `besselK_eq_hankelH1`, control | `z = −2` (`arg = π`, excluded) | `−0.0775−6.9876i` | `0.2211+6.9295i` | fails, as the hypothesis requires |
| `besselI_mul_besselK_add` | `ν = 0.4`, `z = 1.2−0.7i` | `0.6217617+0.3626943i` | `1/z` same | holds |
| `besselK` Check 10.39.2 | `K_{1/2}(0.9+0.4i)` | `0.4211130−0.2937676i` | `(π/(2z))^{1/2}e^{−z}` same | holds |
| `tendsto_besselY_div_cpow` | `ν = 0.6+2i`, `|z| = 1e−5` | `−0.0334295+0.0156560i` | `−Γ(ν)/π = −0.0334306+0.0156575i` | holds |
| `hasSum_besselJ_generating` | `z = 1.1−0.3i`, `t = 0.7+0.2i`, `|m| ≤ 30` | `0.7106220+0.3094166i` | same | holds |
| `hasSum_besselJ_sq` | `z = 1+2i` | `1 − 4e−15 i` | `1` | holds |
| `hasSum_besselJ_gegenbauer` | `ν = 1, u = 2, v = 1, α = π/3` | `0.6690525` | `𝐅(2)(−w²/4) = 2J₁(√3)/√3 = 0.6690525` | holds |
| `gegenbauerC` Checks | `C₂^{(0.7)}(0.3)`; `C₄^{(1/2)}(0.3)` | `−0.4858`; `0.0729375` | `2ν(ν+1)x² − ν`; `P₄(0.3)` via `shiftedLegendre` | hold |
| `besselJ_int_eq_integral` | `n = 2`, `z = 1+i` | `0.0415799+0.2473976i` | same | holds |
| `besselK_eq_integral` | `ν = 0.3+0.5i`, `z = 1+0.5i` | `0.3311108−0.2204341i` | same | holds |
| `besselK_ofReal_eq_positiveAxisBesselK` | `ν = 0.3+0.5i`, `x = 1.3` | `K = 0.2643757+0.0237187i` | `½∫ e^{−x(u+1/u)/2} u^ν du/u` same | holds |
| `besselY_eq_schlafli` | `ν = 0.4`, `z = 1.2+0.3i` | `−0.1531119+0.2341457i` | same | holds |
| `besselJ_sq_add_besselY_sq` | `ν = 0.4`, `z = 1+0.2i` | `0.5982292−0.1153564i` | `0.5994060−0.1153563i` (quadrature at the log singularity) | holds |
| `tendsto_convs_besselJ` | `ν = 0.3+0.2i`, `z = 1.7−0.4i`, 60 levels | `−0.5144211−1.0539424i` | `J_ν/J_{ν−1}` same | holds |
| `besselJ_eq_kummer` | `ν = 0.3`, `z = 1+i` | `1.0253730−0.1488605i` | same | holds |
| 10.40.1 (5.2) | `z = 10e^{i(π−0.01)}` | `I₀(z) = 2801.65−266.56i` | leading term `6.0e−7−5.7e−6 i` | fails outside `|ph z| ≤ π/2−δ` (R03) |
| 10.40.2 Checks (5.1, 5.3) | `K₀(10)` | `1.7780062e−5`; remainder ratio after one term `−0.011861` | three terms `1.7781211e−5`; first neglected `−1/80` | hold (size and sign) |
| 5.5 Checks | `x = 1.3` | `I: 1.188513, 0.797329, 0.242617`; `K: 0.299575, 0.372547, 0.851397` | Checks | hold |
| `norm_besselJ_le_one` Check | `ν = ½`, `x = −π/2` | `J = 0.6366198i`, norm `0.6366` | `2i/π` | holds |
| 10.6.5 (1.4) | `λ = e^{0.3i}, q = ½, p = 0, ν = 0.7, z = 1+i` | `z f′ = 0.2759799−0.0820897i` | same | holds |
| `isBigO_besselI_debye` Check | `I₁₀(10)` | `21.8917062` | leading `21.8648840`; with `U₁`: `21.8970940` | holds |
| `debyeU` Checks | `U₁`, `U₂` by the recursion (by hand) | `(3p−5p³)/24`, `(81p²−462p⁴+385p⁶)/1152` | 10.41.10 | hold |
| `besselJZero_spec`, Checks | `j_{0,1}, j_{0,2}` | `2.4048255577, 5.5200781103` | Check | hold |
| `isBigO_besselJZero_mcmahon` | `ν = 0`, `m = 1, 2, 5, 10`: `(j − a − 1/(8a))a³` | `−0.0578, −0.0740, −0.0797, −0.0805` | next coefficient `−124/1536 = −0.0807` | bounded; holds |
| `hasProd_besselJ` | `ν = ½`, `z = 1+0.5i`, 20000 factors | `0.8717153−0.1543028i` | `Γ(3/2)J_{1/2}/(z/2)^{1/2} = sin z/z = 0.8717112−0.1543066i` | holds (tail `6e−6`) |
| 7.1 Checks | `I_{−3/2}`, `I_{−5/2}` on `(0, 20)` | one sign change; minimum `0.6354 > 0` | Check | hold |
| 7.2 Checks | `ρ_{1/2}(t) = πt` | `𝒞_{1/2} = (2/(πx))^{1/2} sin(x − πt)`, zeros `πt + kπ`, `ρ(0) = 0` | 10.21.8 at `ν = ½`: `j = mπ`, `y = (m−½)π` | hold |
| 10.21.16 at `ν = 0` (R04) | `z = 1` | right side has `1/Γ(0) = 0` and `j′_{0,1} = 0` | `J′₀(1) = −0.4400506` | false at `ν = 0`; DLMF `ν > 0` |
| `tendsto_integral_besselJ_mul_besselJ` | `μ = ½, n = 1, a = 2, b = 1`; `b = a = 1` | `0.3103, 0.3089, 0.3091` at `R = 200, 400, 800`; `−0.4901, −0.4950, −0.4975` | `0.3093592167`; `−½` | hold |
| `exists_integral_cpow_mul_exp_mul_besselJ` Check | `μ = 1, ν = 0, a = 1, b = 2` | `0.4472135955` | `5^{−1/2}` | holds |
| `integral_cpow_mul_besselK` | `ν = 0.4+0.3i`, `μ = 1.1−0.5i` | `0.7963+0.6027i` | `0.7972+0.6030i` (quadrature at `0`) | holds |
| 10.22.75 (R01) | `ν = 0`: `(a,b,c) = (0.5,2,1)`; `(4,2,1)`; `ν = 0.4`: `(3,2,1)` | means `−0.246`; `+0.0597`; partials `1.93, 3.61, 6.71, 12.49` | `−0.2485`; `+0.0621`; no value | signs opposite; `A = 0` diverges |
| `sphericalBesselJ_eq_besselJ` | `n = 3`, `z = 0.9+0.2i` | `0.0057526+0.0042461i` | same | holds |
| `hasSum_planeWave` | `(z, α) = (1, 0), (1.3, 0.7), (2+0.5i, 0.4)` | `0.5403023+0.8414710i`, … | `e^{iz cos α}` same (≤ 2e−15) | holds |
| `kelvin_ode` | `ν = 0.6`, `x = 1.4` | residual `|…| < 2e−7` | `0` | holds |
| `hasSum_kelvinBer` | `ν = 0.4`, `x = 1.3` | `0.3120415371` | same | holds |
| 10.61.9, 10.61.5 (10.1) | `x = 1`; `n = 1`, `x = 0.7` | `ber_{1/2}(√2) + i bei = 0.0602046+0.9679013i`; `ber₁(−x) = 0.2623333−0.2320225i` | 10.61.9 same; `−ber₁(x)` same | hold |
| `kelvinPhase` Check (10.3) | `θ_{1/2}(√2)` tracked continuously from `x = 0.001` | `1.5086751752` (start `1.1780976 = 3π/8`) | `x + π/8 + Arg(1 − e^{−2(1+i)x})` = `1.5086751752` | holds |
| Bickley Checks (8.4) | `Ki₀(1)`; `Ki₁(1)`; `Ki_{3/2}(0+)`; `Ki₁(0+)` | `0.4210244382`; `0.3282864782`; `1.1981402347`; `1.5707963268` | `K₀(1)`; `∫₁^∞K₀ = 0.3282864782`; `√πΓ(¾)/(2Γ(5/4))`; `π/2` | hold |
| `O_n`, 10.23.12 (2.6) | `t = 1.7`; `z = 0.6+0.2i` | `O₁ = 0.3460208`, `O₂ = 1.4024018`; series `0.88+0.16i` | `t⁻²`, `t⁻¹+4t⁻³`; `1/(t−z) = 0.88+0.16i` | hold |
| `airyAi_eq_besselK` | `z = 1+i`, `2e^{2.0i}` | `0.0604583−0.1518896i`, `1.1797430−1.0941263i` | same | hold |
| `airyAi_eq_besselK`, control | `z = 2e^{±2.3i}` (`|arg| > 2π/3`) | `Ai = 1.5234965∓0.0256036i` | `−1.4887872±0.0415734i` | fails, as the hypothesis requires |

Not recomputed this round (hypotheses and sectors checked against the text only): `isBigO_hankelH1_sub_sum`, `isBigO_besselK_sub_sum` beyond the `K₀(10)` row, `besselModulus_besselPhase`, `besselDerivModulus_besselDerivPhase`, `integral_besselJ_mul_besselJZero`, `tendsto_sum_fourierBessel`, `sphericalBesselJ_ode`, `kelvinModulus_kelvinPhase`, `kelvinKModulus_kelvinKPhase`, `besselI_ofReal`, `analyticOnNhd_besselY`, `differentiable_besselY_left`, `besselJ_ode`, `besselY_ode`.

## Not verifiable

- **Watson 1944** (§7.3, §15.27, §18.24) and **Olver 1997** (Chapter 7 §13; Chapter 10 Theorem 3.1, pp. 377–378): no legal open copy; not read. The facts cited from them are also stated in DLMF §§10.21(i), 10.23(iii) and 10.41(iv) (lines 647–649 of 10.41 cite Olver pp. 377–378 for 10.41.13), which I checked. The constant `2 exp(2𝒱(A₁)/u)` in 6.1 is not verified.
- **Nemes 2017**, **Gautschi 1967**: cited in References only; not fetched.
- **DLMF §10.23**: the sources service returns only the figure PDF (image-only; OCR unavailable here), so I read the page online through a fetch tool that flattens the formulas. The 10.23.8–10.23.13 and 10.23.18–10.23.21 checks rest on that reading, cross-checked numerically (the `O_n` rows above).
- **Ownership against open pull requests** was checked with the roadmaps grep over the 458 open heads for the objects named above, and by reading #925, #1928, #1995, #2089 and #117. I did not read other open roadmaps.

## Source issues

- **Gap** in DLMF-Bessel (Chapter 9) at 9.6.2–9.6.5, §9.6(i), online: the formulas are stated with principal branches and `ζ = (2/3)z^{3/2}` but no sector; with principal values the `K` form of 9.6.2 holds only for `|ph z| < 2π/3`, failing at `z = 2e^{2.3i}` where `Ai = 1.5235 − 0.0256i` and the right side is `−1.4888 + 0.0416i`; it should state `|ph z| < 2π/3` (or analytic continuation of `K_{1/3}(ζ)`); affects a stated result.
