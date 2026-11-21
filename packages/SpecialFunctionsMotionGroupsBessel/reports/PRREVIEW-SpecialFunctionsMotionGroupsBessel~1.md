# Review of SpecialFunctionsMotionGroupsBessel (pull request #2933 at 5f032be)

**Verdict:** needs changes

**Summary.** Two findings, both in the prose and both one-line repairs: the general-`n` plane-wave form of 6.3 is asserted for `n ≥ 2` but is degenerate at `n = 2` (`ν = 0`), and the dictionary to Vilenkin–Klimyk's `T_R` in 1.3 and 5.1 has the wrong sign against the roadmap's own Conventions. Every numerical Check I recomputed (all layers) agrees to the printed digits, and `Suggested.lean` elaborates with 58 `sorry` warnings and nothing else. There are six small corrections and two format notes, none blocking. None of the five cited books could be read from a legal place, so their locators and the nine misprints the README reports are unverified; that is left to the human reviewers.

## R01 (P2) — The zonal plane-wave form of 6.3 is stated for `n ≥ 2`, but at `n = 2` it reads `Γ(0) · 0`

In the second bullet of 6.3 (README lines 738–741) the target is "for general `n ≥ 2` the zonal form `e^{iz cos α} = Γ(ν)(z/2)^{−ν} Σ_k (ν + k) i^k J_{ν+k}(z) C_k^ν(cos α)`, `ν = n/2 − 1`". At `n = 2` this is `ν = 0`: `Γ(ν)` has a pole and `C_k^0 = 0` for `k ≥ 1`, so an implementer asked to "state the agreement" has nothing to state; with the pinned conventions (`Complex.Gamma 0 = 0`, Mathlib `Analysis/SpecialFunctions/Gamma/Basic.lean` line 340, and the local `gegenbauer`, whose docstring says it vanishes at `λ = 0`) the right side is `0`, not `e^{iz cos α}`.

DLMF 10.23.9 carries the restriction `ν ≠ 0, −1, −2, …`, and the supplier states it too (SpecialFunctionsBessel 4.3: "for `ν ∉ {0, −1, −2, …}`"). For `ν > 0` the form is right: at `ν = 1`, `z = 1.3`, `α = 0.7` both sides are `0.54509 42104 + 0.83837 47979 i`, and the same at `ν = 1/2`.

Smallest change: "for general `n ≥ 3`", with a clause that at `n = 2` the expansion is the Jacobi–Anger expansion of SpecialFunctionsBessel 4.1, whose constant term `J₀(z)` is the sphere mean of 6.1. The Scope paragraph (line 902, "6.3 states only the zonal form 10.23.9 for general `n`") takes the same bound.

## R02 (P2) — "Their `T_R`, our `T_{iR}`" in 1.3 and 5.1 contradicts Conventions; it is our `T_{−iR}`

Conventions (lines 76–78) say our `T_R` is Vilenkin–Klimyk's `T_{iR}`, their `T_R` having the real exponent `e^{Rr cos(ψ−φ)}`. Hence their `T_R` is our `T_{−iR}`. The negative control of 1.3 (lines 270–271) says instead that their `H± e_n = R e_{n±1}` "is the same identity for their `T_R`, our `T_{iR}`". By the ladder formula of the same section, `H± e_n = iR₀ e_{n±1}` in our `T_{R₀}`: at `R₀ = iR` this is `−R e_{n±1}`, at `R₀ = −iR` it is `R e_{n±1}`. So the sentence is false as written, and a reader who uses it to translate a formula of the source gets every odd power of `R` with the wrong sign. The same phrase stands in 5.1 (line 531), where it is harmless only because `T_{iR} ≅ T_{−iR}`.

Smallest change: write "our `T_{−iR}`" in both places.

## C01 — SpecialFunctionsBessel 1.1 does not state the uniqueness of the solution bounded at `0`

The route of 3.3 concludes that a solution of Bessel's equation of integer order bounded at `x = 0` is a multiple of `Jₙ`, "by the uniqueness of SpecialFunctionsBessel 1.1" (line 426; also the *Needs* line 439 and the supplier contract, line 950). Section 1.1 of that roadmap states uniqueness for given value and derivative at a point, and that every solution is `c₁ J_ν + c₂ Y_ν`; the step used here also needs that `Yₙ` is unbounded at the origin, which is its 2.2 (leading behaviour as `z → 0`, DLMF 10.7.3–10.7.4). Cite 1.1 together with 2.2.

## C02 — Tau Ceti has the real-exponent case of Bessel's integral on the circle

The overview says neither library has "Bessel's integral on the circle" (lines 38–39). The pinned Tau Ceti has `Real.integral_exp_mul_cos_sub_mul_fourier` (`TauCeti/Analysis/Fourier/ExpCos.lean`, line 41): for real `κ`, `∫ e^{κ cos(θ − m)} e^{inθ} dθ/2π = e^{inm} I_{|n|}(κ)` against `haarAddCircle`. That is the first target of 1.2 at `R r = −iκ` (`iⁿ Jₙ(−iκ) = Iₙ(κ)`). The target for complex `R` is more general and stays; the sentence would be true as "neither has Bessel's integral for complex argument", and the declaration belongs under "From Tau Ceti" (it also gives a second route, by the identity theorem, as 6.1 does with the von Mises–Fisher normalizer).

## C03 — `contDiff_besselZonal` asserts real-analyticity, the README smoothness

`Suggested.lean` line 822 has `ContDiff ℝ ⊤ (besselZonal n lam)`. At the pin `⊤ : WithTop ℕ∞` is `ω` (Mathlib `Analysis/Calculus/ContDiff/Defs.lean`, lines 90 and 118–132), so this says analytic; the README (line 654) says "Smoothness", and the other statements of the file write `∞`. Both are true of an entire series; use `∞`, or say "real-analytic" in 6.1.

## C04 — Two statements carry hypotheses they do not need

`besselJ_mul_besselJ_eq_integral` (2.2) assumes `r₁ ≠ r₂`. At `r₁ = r₂ = 0.9`, `(m, n) = (1, 3)` the right side is `0.03839 72673 = J₂(0.9) J₁(0.9)`: the integrand stays integrable at `r = 0`. `hasSum_planeWave_sphericalHarmonic` (6.3) assumes both polar angles in `[0, π]`; since `sphericalHarmonic` is a polynomial on `ℝ³`, the identity holds at every point of the sphere: at `θ = −0.7`, `φ = 0.3`, `θ' = 4.0`, `φ' = 1.0`, `κ = 1.5`, `r = 1.1` both sides are `0.97811 13000 − 0.20808 23991 i`. The range is needed only for the comparison with SpecialFunctionsLegendre's `Y_{l,m}`, which the route cites. Drop the hypotheses, or say what they are kept for.

## C05 — The theorems about `circleRep` and `hyperbolaRep` would say more about an arbitrary realization

Both representations are defined by choice with the trivial representation as fallback (`Suggested.lean` lines 382–386 and 648–651). For the hyperbola model the fallback is the generic case, so `isUnitary_hyperbolaRep` holds for every `R` (the trivial representation is unitary) and its hypothesis `Re R = 0` carries nothing, as the README's own "Prior formalization" notes. The content is "a realization of the hyperbola model is unitary", and it could be stated so: for `U` with `IsHyperbolaRealization R U`, `U.IsUnitary`. The same form (`U` and `IsCircleRealization R U` as arguments) would free `circleRep_irreducible`, the matrix-element theorems and `isUnitary_circleRep_iff` from the choice, and uniqueness of the realization makes the two forms equivalent once `exists_circleRealization` is proved.

## C06 — About a dozen of the 58 statements of `Suggested.lean` are computations from the definitions

`circleAction_one`, `millerAction_one`, `hyperbolaAction_one`, `rotation_add`, `polar_mul_k`, `toComplex_polar_mul_a`, `norm_circleAction`, `circleAction_eq_motionAction`, `circleAction_neg` and the three representation laws `circleAction_mul`, `millerAction_mul`, `hyperbolaAction_mul` are pointwise identities obtained by unfolding one definition (none closed with a bare `rfl` or `simp` in my probe, but each is a few lines). As acceptance tests they ask an implementer for little beside the headline theorems (irreducibility, the matrix elements, Weisner, Hankel inversion, the classification). If they are kept as sanity checks of the definitions, mark them as such in their docstrings, as SpecialFunctionsGroupModels does; the README keeps them as targets either way.

## N01 — `public import TauCeti.RepresentationTheory.Continuous.MatrixCoefficient` (line 4) is not used: the file elaborates unchanged without it.

## N02 — The section comment "Supplier names used in the README" (line 47) heads only `#check` lines, and the Lean title of Layer 7 ("contraction of `SO(3)` and `SO(n+1)` to the motion groups") differs from the README's.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| 0.1 polar product law | `g(1,0;π/2)g(1,0;0)`; reversed order | translation `1+i`; `2`; rotation `k_{π/2}` both | agrees with Checks |
| 1.1 half-turn `T_{−R} ≅ T_R` | symbolic; `R=1.7`, `(0.8e₁,1)`, `(m,n)=(2,−1)` | `−0.0466203227i` and `+0.0466203227i` | holds |
| 1.1 irreducibility, complex `R≠0` | derivative at `β=0, π/2`; `R=0` | `e_{n+1}+e_{n−1}`, `−i e_{n+1}+i e_{n−1}` independent; `R=0` splits | holds, `R≠0` needed |
| 1.2 Bessel's integral / matrix elements | `R=1.7` and `0.6+0.9i`, `D_{2,−1}(g(0.8,0.4;1.1))`; `r=0`; `n<0` | `−0.0046542661−0.0463874153i`; `0.0045357033+0.0129766161i`; integral = closed form | holds |
| 1.2 unitarity sums | `x=2.3` | `−9e−18`; `1.0000000000` | holds |
| 1.3 ladder, Casimir, Lie derivative | `R=1.2+0.3i`; `R=1.7`,`(1,−2)` | `−1.0220565417+0.5931122752i`; `−0.4240576722−1.4700595534i`; `0.0427848273−0.1613161715i` (finite difference agrees) | holds |
| 1.3 dictionary to V–K (R02) | `R₀=iR`, `R₀=−iR` in `H±e_n=iR₀e_{n±1}` | `−R`; `+R` | README sign wrong |
| 2.1 addition theorem | `R=0.7+0.2i`,`(1,3)`; `r=0`; `m=n=0`; `Σ J_{n+k}J_k` | `0.0896774027+0.1715010358i` both; `0.1766154560` both; `1,0,0` | holds |
| 2.2 circle mean, radial form | `(1,2)`,`(1,3)`, complex `R`; `r₁=r₂=0`; `r₁=r₂=0.9` | `0.1717434254`; `0.0602150045`; `−0.0069381873+0.0177629627i`; `0.0383972673` | holds; `r₁≠r₂` unneeded |
| 3.1 Miller matrix, addition | given `g,h`; `z=0`; abelian law | `−0.0006784434−0.0064724196i`; `−0.0167321668+0.0064804404i`; `0.0074582509+0.0229890030i` | holds |
| 3.2 Bessel form | `(3,1)`,`(1,3)`,`(2,1)`; `r=0` | `0.4851079951−0.1157856057i`; `−1.3525879958+0.1287354117i`; `0.8514120393−0.3254091509i` | holds |
| 3.3 Weisner | `m=0.7,0,−1,2,−3,−1.3`; complex `x,t`; `x=0` | `0.6901327265`; `0.2516855588`; `−0.4452228727`; `0.7427306567+0.4034581418i` both sides | holds |
| 4.1 hyperbola model | law symbolic; `Re R≠0`, `a=(−1,0)` | `x(θ−s)=Λ_{−s}x(θ)`; multiplier `e^{cosh θ}` unbounded | holds |
| 4.2 boost, Macdonald kernel | Gaussians, `λ=0.4+0.7i` | `1.6251390170+1.8130576583i`; `0.4742963035+0.0415661041i`; inner `0.7734963299+0.0661700352i` | holds |
| 5.1 Fourier picture, cylindrical wave | `R=1.7,n=2,x=(0.6,−0.4)` | `Δu=−0.18385117+0.44124284i` (h=1e−3) vs `−0.1838512093+0.4412429024i` | holds |
| 5.2 angular mode, Laguerre, moments, Weber | `n=2`; `ν=0.3`,`k=0,1,2`; `ν=−0.6` | `−0.4108182347−1.0566867887i`; `0.4647337023`,`0.1812461439`,`−0.4479800523`; `1.2879624607`; `0.4598468172` | holds |
| 5.3 radial Fourier transform | `e^{−π|x|²}`, `n=1..5`, `|ξ|=0.7` | `0.2145139731` for each `n` | holds |
| 6.1 zonal function | `Ω₁,Ω₃,Ω₄`; complex `λ`, `n=5`; sphere mean `n=2,5`; ODE `n=4`; `n=0` | `0.3058169084`; `0.7556272552`; `0.8142517801`; `0.9293323896−0.1287917669i` (series, Bessel form, mean) | holds |
| 6.2 functional equation | `n=3`,`n=4`; `n=2`, `λ=0.6+0.9i`; `n=1` | `0.1399431600`; `0.2903144269`; `1.0498382859−1.4452454684i` both; `0.2675≠0.6114` | holds, `n≥2` needed |
| 6.3 plane wave in `ℝ³` | README point; angles outside `[0,π]` | `0.8196480178+0.5728674601i`; `0.9781113000−0.2080823991i` both sides | holds; angle range unneeded |
| 6.3 zonal form 10.23.9 (R01) | `ν=1`, `1/2`; `ν=0` | `0.5450942104+0.8383747979i` both; `Γ(0)·0` | false as stated at `n=2` |
| 7.1 Wigner `d` limit | `(0,0),(1,0),(0,1),(2,−1)`, `l=800, 20000` | `0.3973710368→0.3979603045` vs `0.3979848594`; `0.5778269529` vs `0.5777652315`; `(0,1)` negative | holds, sign `J_{p−q}` |
| 7.2 Gegenbauer limit | `p=1.5`; `p=0.8+0.6i`; `p=1/2` | `0.2409812503, 0.2512309552, 0.2525129826 → 0.2527104772`; `0.84384+0.20382i → 0.8439356619+0.2038250935i` | holds |
| Worked example, three Bessel functions | `(1.3,0.7,1.5)`, `m=n=0` | `0.3500500923` both forms | holds |

- Source locators checked against the text: DLMF 10.22.51, 10.22.67, 10.22.74, 10.23.1, 10.23.3, 10.23.4, 10.23.7, 10.23.9, 18.11.5, 18.18.12 (ten, all as cited); none of the 96 book locators.
- Library declarations opened at the pin: `Complex.besselJ` and `besselJ_neg_int` (`Mathlib/Analysis/SpecialFunctions/Bessel.lean` 55, 84), `Gamma_zero` (Gamma/Basic 340, 433), `ContRepresentation.IsUnitary` (`TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean` 49), `TauCeti.Probability.integral_exp_inner_toSphere_eq_besselI` (VonMisesFisher/Normalizer 157), `Real.integral_exp_mul_cos_sub_mul_fourier` (Fourier/ExpCos 41), the `ContDiff` order notation (Defs 90).
- Cross-roadmap citations resolved: SpecialFunctionsGroupModels §§0.3, 1.3, 2.6, 3.1–3.2, 4.3, 5.2; SpecialFunctionsSU2MatrixElements §§2.3, 2.4, 2.6, 6.1; SpecialFunctionsLegendre §3.2; SpecialFunctionsBessel 1.1, 1.5, 4.1–4.3, 5.1, 6.2, 11.2, 11.3, 11.5 and its Beyond; LaguerreJacobi §§1.1, 2.4, 3.2, 6.2; NoncompactQuantumSymmetry M2. One drift (C01).
- Local copies compared with their owners' `Suggested.lean`: 15 definitions, all identical.
- Elaboration: `sorry` the only warning, 58 of them; signatures compared with the README, one difference (C03). One-tactic probe on 15 statements: none closed.
- Dependency check: `depcheck: 171 roadmaps, 1989 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: two hits (choice in two definitions, raised as C05; a section comment over `#check` lines, N02); the targeted build passes.
- Overlap check: read SpecialFunctionsGroupModels, SpecialFunctionsSU2MatrixElements, SpecialFunctionsHigherSpheres, SpecialFunctionsBessel, LaguerreJacobi; motion groups, sphere models, matrix elements and Gel'fand pairs are owned by SpecialFunctionsGroupModels, the zonal form 10.23.9 by SpecialFunctionsBessel 4.3, the plane-wave expansion for `n ≥ 4` by SpecialFunctionsHigherSpheres, and the Hankel transform, the radial Fourier transform, the plane-wave expansion in `ℝ³` and the spherical functions of `(M(n), SO(n))` by this roadmap (SpecialFunctionsHigherSpheres' scope says the same); the irreducibility of `T_R` at `n = 2`, real `R > 0`, is in SpecialFunctionsGroupModels §2.6 and is kept here as the complex-`R` variant, with the difference stated in Scope.

Source independence: 0 passages compared with the five books (none could be read legally); 10 DLMF formulas compared, forced by the mathematics; largest share VK1, 42 of 117 locators; its contents not read. By the README's own locators Layers 0, 1, 2 lie in VK1 §4.1.1, §§4.1.2–4.1.3, §4.1.4 and Layers 4, 5 in §4.2, §4.4, not one to one (Layer 1 spans two sections, Layers 3, 6, 7 rest on other sources, §4.3 is absent), and the order of Layers 0–2 is forced by the *Needs* lines of 1.1, 1.2 and 2.1.

Research link: the headline targets are the classical theory of motion-group representations and Bessel functions of Vilenkin–Klimyk (1991, 1993), Miller (1968) and Dieudonné (1980), with the Hankel transform and the spherical functions of `(M(n), SO(n))` as used in harmonic analysis on `ℝⁿ`; this rests on the README's sources, not on a text I read.

## Not verifiable

- VK1, VK2, KV: the publisher's pages are paywalled; every locator into them (all fifteen sampled sections cite at least one) is unverified.
- M (Miller 1968): no legal copy found (the author's page did not resolve); (3.4)–(3.16), (3.32)–(3.38), Lemma 3.2 unverified.
- D (Dieudonné 1980): the publisher's landing page could not be classified as open; §16 (188)–(193) unverified.
- The nine misprints of the sources that the README reports (References, last list) and the remarks "printed … is off" in 2.2, 3.3, 4.1, 5.1, 5.2, 5.3, 6.1, 7.2: the corrected formulas were recomputed and hold; what the sources print was not seen.
- The contents page of VK1: not read.

## Source issues

- none

## For the human reviewers

- Not tested: VK1 has the largest share of the locators (42 of 117); its text and its table of contents could not be read, so wording and arrangement were not compared with it, nor with VK2, KV, M or D.
- Licence: the README ("Prior formalization") says the Lean names are those of lean-SFVK (github.com/bjbraams/lean-SFVK, Apache-2.0, by the pull request's author), which proves 52 of the 58 targets; I did not open that repository.
- Sources: the README corrects nine formulas of its sources (References, last list); none could be checked against the printed text.
