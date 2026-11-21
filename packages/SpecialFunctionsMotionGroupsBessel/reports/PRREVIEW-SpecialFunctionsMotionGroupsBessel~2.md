# Review of SpecialFunctionsMotionGroupsBessel (pull request #2933 at f3fd2c3)

**Verdict:** accepted

**Summary.** Accepted: no finding. Both findings of the previous review are repaired (the zonal plane-wave form is now stated for `n ≥ 3`, and the dictionary to Vilenkin–Klimyk's `T_R` now reads `T_{−iR}`), and every statement of `Suggested.lean` and every printed Check value but one was recomputed and agrees. There are four small corrections (a worked example whose derivation the roadmap's Hankel inversion does not cover, a supplier cited outside its stated range, one wrong digit, an incomplete DLMF locator) and two format notes, none blocking. The five books could not be read from a legal place, so their locators, the nine misprints the README reports and the comparison of wording and arrangement are left to the human reviewers.

## C01 — The three-Bessel worked example does not follow from Hankel inversion as 5.2 states it

In Worked examples (line 843) the integral `∫₀^∞ J_{n−m}(R r₁) J_m(R r₂) Jₙ(R r) R dR = (2/π) cos(nφ − mφ₂)/√Δ` is derived "from 2.2 by Hankel inversion (5.2)". An implementer who follows that route is stuck: 5.2 proves inversion for smooth functions with compact support in `(0, ∞)` and extends it to `L²((0, ∞), r dr)`, and the function to be inverted, `r ↦ (2/π) cos(nφ − mφ₂)/√Δ` on `(|r₁ − r₂|, r₁ + r₂)`, is in neither class. Its square has the non-integrable singularity `1/Δ` at both endpoints: at `r₁ = 1.3`, `r₂ = 0.7`, `∫_{0.6+ε}^{1} r/Δ dr` is `0.571`, `1.205`, `1.822` at `ε = 10⁻², 10⁻⁴, 10⁻⁶`, growing like `log(1/ε)`. The left side is also not absolutely convergent (the integrand is of size `R^{−1/2}`), so it has to be read as an improper integral.

The identity itself is right (at `m = n = 0` it is `1/(2πA) = 0.35005 00923`, as the README says). The smallest change: say that the integral is improper and that the step uses the pointwise Hankel inversion theorem for integrable functions of bounded variation near `r`, which 5.2 does not contain; or keep the derivation for `m = n = 0` only, through DLMF 10.22.74 of SpecialFunctionsBessel 11.3.

## C02 — The `m = 0` Check of 3.3 cites the multiplication theorem of SpecialFunctionsBessel 4.2 outside the range that section states

The second Check of 3.3 (lines 441–444) calls the `m = 0` case of Weisner's identity "the case `ν = 0` of the multiplication theorem 10.23.1 of SpecialFunctionsBessel 4.2". That section states 10.23.1 "for `|λ² − 1| < 1`". Here `λ² − 1 = 2/(xt)`, which has modulus greater than `1` for every pair allowed by the hypothesis `|x t| < 2`; at the Check's own point `x = 0.9`, `t = 0.6` it is `3.7037`. So the cited statement never covers this case, although the identity holds there (both sides `0.25168 55588`). Say that the case is 10.23.1 for `J` beyond the range the supplier states (for `J` the series converges for every `λ`), or drop the attribution to 4.2.

## C03 — One digit of the angular-mode Check of 5.2 is wrong

The fourth Check of 5.2 (line 616) gives `−0.41081 82347 − 1.05668 67890 i`. With `∫₀^∞ r³ e^{−r²} J₂(br) dr = (b²/8) e^{−b²/4}` at `b = 0.7π` the value is `2π (−i)² e^{1.2i} (b²/8) e^{−b²/4} = −0.41081 82347 − 1.05668 67887 i`; the imaginary part ends in `67887`, not `67890`.

## C04 — The route of 3.3 cites DLMF 10.7.3–10.7.4 for the unboundedness of `Yₙ` at `0`, which covers only `n ≥ 1`

The route (lines 435–436, and the supplier contract for SpecialFunctionsBessel 2.2) applies the step to every Laurent coefficient `hₙ`, `n ∈ ℤ`. DLMF 10.7.3 is the behaviour of `J_ν`, and 10.7.4 is stated for `Re ν > 0` (or negative half-odd `ν`). For `n = 0` the behaviour `Y₀(z) ∼ (2/π) ln z` is 10.7.1, and for `n < 0` it is 10.7.5 (or `Y_{−n} = (−1)ⁿ Yₙ`). SpecialFunctionsBessel 2.2 covers 10.7.1–10.7.7, so the supplier section is right; only the equation numbers need 10.7.1 and 10.7.5 added.

## N01 — The first bullet of 5.1 says "for integrable `f`"; `fourier_comp_motionApply` and `fourier_comp_motionApply_circle` carry no integrability hypothesis (they hold without one, both sides being `0` for a non-integrable `f`). Say in the README that the identity holds for every `f`, or add the hypothesis to the Lean statements.

## N02 — The classification `T_R ≅ T_{R'}` exactly when `R'² = R²` (last bullet of 1.1, listed under "Owned here" as the equivalence classes) is statable with `IsCircleRealization` and an invertible bounded intertwiner, and has no Lean statement; it would sit naturally beside `IsCircleRealization.irreducible`.

## Earlier findings

- R01 (zonal form of 6.3 asserted at `n = 2`): repaired. 6.3 now reads "for general `n ≥ 3` the zonal form … `ν = n/2 − 1 > 0`", with the Jacobi–Anger expansion named for `n = 2`; Scope says "for `n ≥ 3` (and Jacobi–Anger for `n = 2`)".
- R02 (sign of the dictionary to Vilenkin–Klimyk's `T_R`): repaired. 1.3 reads "their `T_R`, our `T_{−iR}`" and 5.1 "their `T_R` is our `T_{−iR}`"; with `H± e_n = iR₀ e_{n±1}` at `R₀ = −iR` this is `R e_{n±1}`.
- C01 (uniqueness cited from SpecialFunctionsBessel 1.1 alone): repaired, 3.3 now cites 1.1 and 2.2 (see C04 above for the equation numbers).
- C02 (Tau Ceti's Fourier coefficients of `e^{κ cos θ}`): repaired; the overview says "for complex argument" and the declaration is under "From Tau Ceti".
- C03 (`ContDiff ℝ ⊤`): repaired; 6.1 says real-analyticity and the Lean has `ω`.
- C04 (unneeded hypotheses): repaired; `r₁ ≠ r₂` and the angle ranges are gone, and both statements hold without them (rows below).
- C05 (representations defined by choice): repaired; the eight theorems take a realization as an argument.
- C06 (computations from the definitions): repaired; twelve docstrings begin "Sanity check of the definition".
- N01 (unused import): repaired. N02 (section comment over `#check` lines): kept by the author; set aside below.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| 0.1 polar product law | `g(1,0;π/2)g(1,0;0)`; reversed; without rotation | `1 + e^{iπ/2} = 1+i`; `2`; `2` (direct product) | holds, Checks true |
| 1.1 circle model: law, half-turn, norm | symbolic; `R = i`, `r = 0.8` | `⟨k_α a', e(ψ)⟩ = ⟨a', e(ψ−α)⟩`; `e^{−0.8} = 0.4493289641` | holds |
| 1.1 irreducibility, complex `R ≠ 0` | derivative at `β = 0, π/2`; `R = 0` | `(iR/2)(e_{n+1}+e_{n−1})`, `(iR/2)(−i e_{n+1}+i e_{n−1})` independent; `T_0` diagonal | holds, `R ≠ 0` needed |
| 1.1 equivalence classes | intertwiner relations | `R a_{n+1} = R' a_n`, `R a_n = R' a_{n+1}` give `(R'/R)² = 1` | holds |
| 1.2 Bessel's integral | `R = 0.6+0.9i`, `n = 3`, `−2` | `−0.0112904293+0.0078416436i`; `−0.0427884706−0.0858315418i`, both sides | holds |
| 1.2 matrix elements | `R = 1.7` and `0.6+0.9i`, `D_{2,−1}(g(0.8,0.4;1.1))` | `−0.0046542661−0.0463874153i`; `0.0045357033+0.0129766161i`, inner product and closed form | holds |
| 1.2 unitarity sums | `x = 2.3` | `0.0000000000`; `1.0000000000` | holds |
| 1.3 ladder, Casimir, Lie derivative | `R = 1.2+0.3i`; `R = 1.7`, `(1,−2)`, finite difference | `−1.0220565417+0.5931122752i`; `−0.4240576722−1.4700595534i`; `0.0427848273−0.1613161715i` twice | holds |
| 2.1 addition theorem | `R = 0.7+0.2i`, `(1,3)`; `r₁ = −1.3`, `r < 0` | `0.0896774027+0.1715010358i`; `0.0551897329−0.0376118779i`, both sides | holds for all real radii |
| 2.2 circle mean | complex `R`; `r₁ = r₂ = 0.9` (`w = 0` once); `r₁ < 0` | `−0.0435939163+0.1116079861i`; `0.2412571456`; `0.0151943097`, both sides | holds |
| 2.2 radial form | `(1,3)`; `r₁ = r₂ = 0.9`; `(2,−1)`, `(0.4,1.1)` | `0.0602150045`; `0.0383972673`; `−0.0001802720`, both sides | holds without `r₁ ≠ r₂` |
| 3.1 Miller matrix, generating function, addition | given `g`, `h`; `z = 0.6−0.8i`; abelian law | `−0.0167321668+0.0064804404i`; `0.8902185867+0.1619926570i`; control `0.0074582509+0.0229890030i` | holds |
| 3.2 Bessel form | `(3,1)`, `(1,3)`, `(−2,−2)`, `m₀ = 0.3`; README point | `0.5261191515−0.0603968384i`; `−1.4422631081−0.0362210137i`; `0.4851079951−0.1157856057i` | holds |
| 3.3 Weisner | `m = 0.7`, `0.4+1.1i`, `−2`, `3`, `0`; `x = 0` | `0.6901327265`; `1.5475144340+0.5939098363i`; `0.2019359871`; `0.2674491938`; `0.2516855588`; `1.1005474055` | holds |
| 3.3 `m = 0` and the supplier's range (C02) | `x = 0.9`, `t = 0.6` | `λ² − 1 = 3.7037 > 1`; both sides `0.2516855588` | true, citation out of range |
| 4.1 hyperbola model | law; `Re R ≠ 0`, `a = (−1,0)` | `[x(θ), Λ_s a'] = [x(θ−s), a']`; multiplier modulus `e^{|Re R| cosh θ}` unbounded | holds |
| 4.2 boost, Macdonald kernel | Gaussians, `λ = 0.4+0.7i` | `1.6251390170+1.8130576583i`; `0.4742963035+0.0415661041i` both sides; `2K = 0.7734963299+0.0661700352i` | holds |
| 5.1 Fourier picture, cylindrical wave | change of variables; `R = 1.7`, `n = 2` | `x = a + ky` gives `e^{−2πi⟨a,ξ⟩} 𝓕f(k⁻¹ξ)`; `−R²u = −0.1838512093+0.4412429024i` | holds |
| 5.2 angular mode (C03) | `n = 2`, `φ = r² e^{−r²}`, closed form | `−0.4108182347−1.0566867887i`; README prints `…67890` | holds, one digit off |
| 5.2 inversion and Plancherel | bump on `(0.5, 2.5)`, `ν = 0.3, −0.6, −0.9`, `r = 1.2` | `0.33324738`, `0.33324068`, `0.33324398` vs `0.33323708`; norms `0.19962918` vs `0.19962918` | holds for `ν > −1` |
| 5.2 Laguerre eigenfunctions, Weber | `(0.3,2)`, `(0.3,1)`, `(−0.6,3)`, `(2,1)`; `ν = −0.6` | `−0.4479800523`; `0.1812461439`; `0.3112378337`; `−0.9509970353`; Weber `0.4598468172` | holds |
| 5.3 radial Fourier transform | `e^{−π|x|²}`, `n = 1, 2, 3, 5`, `|ξ| = 0.7` | `0.2145139731` each | holds |
| 6.1 zonal function | `Ω₁`, `Ω₃`, `Ω₄`; `n = 5`, `λ = 0.8+0.5i`; mean `n = 4`; ODE | `cos`; `0.7556272552`; `0.8142517801`; `0.9672909300−0.0633328652i`; `0.9588849231−0.0788595546i` | holds |
| 6.2 classification, bounds | `n = 3`; `n = 2` complex; `n = 4`; `n = 1`; `λ = 0.3i` | `0.1399431600`; `0.4522666555−0.6235910164i`; `0.2903144269`; `0.2675 ≠ 0.6114`; `|Ω₃(0.3i,40)| = 6781` | holds, `n ≥ 2` needed |
| 6.3 plane wave in `ℝ³` | README point; angles `θ = −0.7`, `θ' = 4.0` | `0.8196480178+0.5728674601i`; `0.9781113000−0.2080823991i` both sides | holds at all angles |
| 6.3 zonal form 10.23.9 | `ν = 1.5`, `z = 1.3`, `α = 0.7`; `k = 0` term | `0.5450942104+0.8383747979i` both; `Γ(ν+1)(2/z)^ν J_ν = Ω_n(1,z)` | holds for `n ≥ 3` |
| 7.1 Wigner `d` limit | `(0,0)`, `(1,0)`, `(0,1)`, `(2,−1)`, `(−1,2)`, `l = 800` | `0.3973710368` vs `0.3979848594`; `±0.5778269529` vs `±0.5777652315`; `±0.0852895484` vs `±0.0851499269` | holds, order `p − q` |
| 7.2 Gegenbauer limit | `p = 1.5`, `0.5`, `0.25`, `l = 400, 3000` | `0.2512309552`, `0.2525129826` → `0.2527104772`; `0.1101584227` → `0.1103622669`; `0.2441776522` → `0.2442233525` | holds |
| Worked example, three Bessel functions (C01) | `(1.3, 0.7, 1.5)`; `∫ r/Δ` near `0.6` | `1/(2πA) = 0.3500500923`; `0.571, 1.205, 1.822` at `ε = 10⁻², 10⁻⁴, 10⁻⁶` | identity true, not in `L²` |

- Source locators checked against the text: thirteen DLMF formulas (10.7.1, 10.7.3–10.7.5, 10.9.4, 10.22.51, 10.22.67, 10.22.74, 10.32.9, 10.40.1, 10.47.3, 10.60.7, 14.30.9, 18.11.5, 18.18.12), all as cited except the range noted in C04; none of the book locators.
- Library declarations opened at the pin: `Complex.besselJ` and `besselJ_neg_int` (`Mathlib/Analysis/SpecialFunctions/Bessel.lean` 55, 84), `ContRepresentation.IsUnitary` (`TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean` 49), `Real.integral_exp_mul_cos_sub_mul_fourier` (`TauCeti/Analysis/Fourier/ExpCos.lean` 41), `TauCeti.Probability.integral_exp_inner_toSphere_eq_besselI` (`TauCeti/Probability/Distributions/VonMisesFisher/Normalizer.lean` 157).
- Cross-roadmap citations resolved at main or at the open heads: SpecialFunctionsGroupModels §§0.3, 1.3, 2.6, 3.1–3.2, 4.3, 5.1–5.2; SpecialFunctionsSU2MatrixElements §§2.3, 2.4, 2.6, 6.1; SpecialFunctionsLegendre §3.2; SpecialFunctionsBessel 1.1, 1.5, 2.2, 4.1–4.3, 5.1, 6.2, 11.2, 11.3, 11.5 and its Beyond; LaguerreJacobi §§1.1, 2.4, 3.2, 6.2; NoncompactQuantumSymmetry M2. One out of range (C02).
- Local copies compared with their owners' `Suggested.lean`: 15 definitions, all identical.
- Elaboration: `sorry` the only warning, 58 of them. One-tactic probe (`rfl`, `simp`, `infer_instance`, `ext; simp` with the three actions) on all 58: none closed. Signatures compared with the README: one difference of generality (N01).
- Printed Check values recomputed: about 70, all agree except the one of C03; the `₀F₁` addition Check of 3.1 was not recomputed (its formula is Miller's (3.16), not read).
- Dependency check: `depcheck: 171 roadmaps, 1989 edges, 0 problem(s)`; no UPWARD or CYCLE line. The pull request changes nothing outside the folder.

Overlap check: read SpecialFunctionsGroupModels, SpecialFunctionsSU2MatrixElements, SpecialFunctionsHigherSpheres, SpecialFunctionsSU11MatrixElements, SpecialFunctionsAffineHeisenbergGroups, SpecialFunctionsBessel, LaguerreJacobi; the motion groups, sphere models for real `R > 0`, matrix elements and Gel'fand pairs are owned by SpecialFunctionsGroupModels, the zonal form 10.23.9 by SpecialFunctionsBessel 4.3, the plane-wave expansion for `n ≥ 4` and Bochner's theorem for degree `l ≥ 1` by SpecialFunctionsHigherSpheres, and the circle models for complex `R`, the Hankel transform, the radial Fourier transform (degree `0`), the plane-wave expansion in `ℝ³`, the spherical functions of `(M(n), SO(n))` and the two contraction limits by this roadmap; SpecialFunctionsHigherSpheres' scope states the same division, and no other roadmap, open or on main, states a Hankel transform of functions, a Mehler–Heine limit or Weisner's identity.

Source independence: 13 formulas compared with 1 source (DLMF), each forced by the mathematics; no prose passage could be compared with the five books, which could not be read legally; largest share VK1, 47 of about 130 locators; its contents not read. By the README's own locators Layers 0, 1, 2 lie in VK1 §4.1.1, §§4.1.2–4.1.5, §4.1.4 and Layers 4, 5 in §4.2, §4.4 (not one to one: Layer 1 spans several sections, §4.3 is absent, Layers 3, 6, 7 rest on other sources), and the order of Layers 0–2 is forced by the *Needs* lines of 1.1, 1.2 and 2.1.

Research link: the headline targets are the classical theory of motion-group representations and Bessel functions of Vilenkin–Klimyk (1991, 1993), Miller (1968) and Dieudonné (1980), with the Hankel transform and the spherical functions of `(M(n), SO(n))` used in harmonic analysis on `ℝⁿ`; this rests on the README's sources, not on a text read here.

## Not verifiable

- VK1, VK2, KV: the publisher's pages are paywalled; every locator into them (each of the fifteen sampled sections cites at least one) is unverified.
- M (Miller 1968): no legal copy found; (3.3)–(3.16), (3.32)–(3.38), Lemma 3.2 and the `₀F₁` addition Check of 3.1 unverified against the text.
- D (Dieudonné 1980): the publisher's landing page could not be classified as open; §16 (188)–(193) unverified.
- DLMF §10.23 (10.23.1, 10.23.3–10.23.4, 10.23.7, 10.23.9): the page returned only its figure this round; the formulas were recomputed (rows 2.1, 3.3 and 6.3) but not re-read.
- The nine misprints of the sources that the README reports (References, last list): the corrected formulas were recomputed and hold; what the sources print was not seen.
- The contents page of VK1: not read.

Automatic checks set aside as false positives: the section comment in `Suggested.lean` that heads the five `#check` lines pinning library declarations was reported as a heading with no declaration under it; pinning library declarations is what that block is for.

## Source issues

- none

## For the human reviewers

- Not tested: VK1 has the largest share of the locators (47 of about 130); its text and table of contents could not be read, so wording and arrangement were not compared with it, nor with VK2, KV, M or D.
- Licence: the README ("Prior formalization") says the Lean names are those of lean-SFVK (github.com/bjbraams/lean-SFVK, Apache-2.0, by the pull request's author), which proves 52 of the 58 targets; that repository was not opened.
- Sources: the README corrects nine formulas of its sources (References, last list); none could be checked against the printed text.
