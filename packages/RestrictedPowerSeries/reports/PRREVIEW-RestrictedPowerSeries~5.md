# Review of RestrictedPowerSeries (pull request #2656 at fe06f84)

**Verdict:** accepted

**Summary.** Accepted: a full review of this head found no false statement, no missing hypothesis and no supply defect. Every stated result, Check and worked example was recomputed, the cited declarations were opened at the pins, and the six readable sources were read at their locators. There is one small correction (a sentence of §5.2 that leaves the radius of three properties unclear) and no format note; neither blocks. Two facts are left for the human reviewers: the most-cited source could not be read, and the licence of a linked repository was not checked.

## Previous findings

The previous review, of this same head, raised no finding, no small correction and no format note, so there is nothing to check for repair. Its two notes for the human reviewers are carried over above.

## C01 — The opening sentence of §5.2 leaves unclear at which radii factoriality, the Jacobson property and the dimension are claimed

The sentence (line 914) reads "`T_n` is a noetherian domain at every positive polyradius (…), a unique factorisation domain (…), … a Jacobson ring (…) and of Krull dimension `n`". Layer 5 defines `T_n` as the unit-polyradius algebra, so "`T_n` at every positive polyradius" already strains the notation, and a reader can take the polyradius clause to govern the whole list. The declarations cited do not support that reading: `TauCeti.MvPowerSeries.isNoetherianRing_isRestricted_subring` (`TateAlgebra/Groebner.lean` line 427) and `TauCeti.instIsDomainIsRestrictedSubring` (`TateAlgebra/Basic.lean` line 90) take an arbitrary polyradius `c`, while `uniqueFactorizationMonoid`, `isJacobsonRing` and `ringKrullDim_isRestricted_subring` are stated for `fun _ ↦ 1` only (`UniqueFactorization.lean` line 94, `Jacobson.lean` line 122, `KrullDimension.lean` line 102). The scope section already draws the line correctly ("unit-radius Tate algebras … factoriality, the Jacobson property, Krull dimension …; noetherianity at every positive polyradius").

It would be enough to split the sentence: "`K⟨r⁻¹X⟩` is a noetherian domain at every positive polyradius (…). At unit radius `T_n` is a unique factorisation domain, …".

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 native algebra, zero variables, `X i` | `σ = ∅`; zero ring; `ℚ_p` | only exponent `0`, so `R⟨⟩ = R`; zero ring `X i = 0`; nonzero ring: one coefficient `1` at `single i 1` | holds; Mathlib one-variable predicate is an `abbrev` on `Unit` | none |
| §0.2 coefficient maps, example `ℤ_p → 𝔽_p` | `a = p`, `a = 1`; lift by digits; zero map | `‖φ p‖ = 0 ≤ p⁻¹`, `‖φ 1‖ = 1`; `L = 1`; kernel `p ℤ_p⟨X⟩`; `R → 0` kills all | holds | none |
| §0.3 module-valued families | `E = R`; `E = 0`; non-ultrametric `E` | recovers Mathlib predicate; zero module allowed; convolution needs ultrametric `E` (sum of products bounded by max) | matches pin hypotheses | none |
| §1.1 Checks | `X^n` at radius 1; `r = √p` over `ℚ_p` | coefficientwise limit 0, `‖X^n‖ = 1`; `‖X‖ = √p ∉ p^ℤ` | hold | none |
| §1.2 radius change and rescaling | `Σ p^(2n)X^n`, `Σ p^n X^n`; `u`, `‖u‖ s = r` | weights `p^(−n)` at `p`, norm 1; `Σ p^n X^n` weights 1 at `p`; rescaled weight `‖a_ν‖‖u‖^ν s^ν = ‖a_ν‖ r^ν` | direction `R⟨r⁻¹X⟩ ≃ R⟨s⁻¹X⟩` matches pin | none |
| §1.3 `c₀` model, iteration | `Σ X^i Y^i`; `u^ν • a_ν` | slices `Y^i` of norm 1, not restricted; `‖u^ν a_ν‖ = r^ν‖a_ν‖`, composite of rescale and unit-radius model | holds | none |
| §2.1 evaluation | `ℓ¹(ℕ, ℚ_p)`, `b = e₁`; module form over `ℚ` | `‖Σ a_n e_n‖ = Σ‖a_n‖` diverges; `f(x)` needs complete `R`, stated | ultrametric and completeness hypotheses needed and present | none |
| §2.2–2.3 translation, Hasse derivatives | `X²` translated by 1; characteristic 2; norm bound | `X² + 2X + 1`, `D⁽ᵏ⁾(X²)(1) = 1, 2, 1`; `D⁽²⁾(T²) = 1` vs `2 = 0`; `‖C(n+k,k)a_(n+k)‖r^n ≤ r^(−k)‖f‖` | hold | none |
| §2.4 Strassmann, roots of unity, Checks | `X^p − X` on `ℤ_p` and over trivial `𝔽_p`; Fourier inversion | `‖x^p − x‖ ≤ p⁻¹ < 1`; vanishes on all of `𝔽_p`; `a_ν = m^(−k) Σ g(ζ^j)ζ^(−j·ν)` forces a point of norm `‖f‖` when `‖m‖ = 1` | hold | none |
| Headline: maximum principle and separation | pin `exists_pointNorm_eq_norm`; image of evaluation | `pointNorm` is the spectral norm in `T_n/m`, finite over `K`; image a domain finite over `K`, so a field | pin proves the maximal-ideal form; extension-point reading is the stated §2.4 target | none |
| §3.1 multiplicative units | `u` with `‖u⁻¹‖ = ‖u‖⁻¹`; `1 + a`, `‖a‖ < 1` | `‖a‖ ≤ ‖u⁻¹‖‖ua‖` gives `‖ua‖ ≥ ‖u‖‖a‖`; `‖(1+a)b‖ = ‖b‖` | matches martin lines 673–688 and pin (`NormOneClass`) | none |
| §3.2–3.3 units and reduction | `1 − pX`, `1 − X`; `1 + εX` in `K[ε]/(ε²)`; `p`, `1 + X` | `‖pX‖ < 1`; `1 − X` vanishes at 1; `(1+εX)(1−εX) = 1` with `‖ε‖ = 1`; `1 + X` vanishes at `−1` | hold | none |
| Headline: division and norm identity (§§4.1–4.2) | `T⁴ ÷ (T² − ε)` at `r = 1` and `r < 1`; `s = 0`; zero ring | `(T²−ε)(T²+ε) = T⁴`; at `r < 1` greatest attaining index 0, `−ε` not a unit; `b = 0`; no distinguished series (`0 < 0`) | pin signature and martin 1.26–1.27 match | none |
| Headline: preparation (§4.3) and its targets | `p + X + pX²`; `w = T^s − b`; polynomial `g` | `e = pX + (1 + pa)`, `−(1+pa)a = p ⇔ g(a) = 0`; `T^s = gq + b` gives `q = e⁻¹`, `q_w = e q_g`; uniqueness forces `e` polynomial | hold; martin 1.28 | none |
| §4.4 Checks | `X − 1` at 1; `X² − p` at `p^(−1/2)` | weights `1, 1`; weights `p⁻¹, p⁻¹`, zeros `±√p` of norm `r` | hold | none |
| §5.1 Weierstrass polynomials | `X² − p`; `X − a`, `‖a‖ ≤ 1`; degree 0 | basis `1, X`, quotient `ℚ_p(√p)`; quotient `K`; quotient by `1` is zero | holds; pin `quotientBasis`, `finite_of_isTorsionBy` hypotheses match | none |
| Headline: noetherian, factorial, Jacobson, dimension (§5.2) | `n = 0`; trivially normed `K`; `K⟦X⟧` for the Rückert criterion | `T_0 = K`; `T_n = K[X]`; `W = {X^n}` is a datum over a field but `K⟦X⟧` is not Jacobson, radical nonzero | true at unit radius; pin UFD, Jacobson, dimension are unit-radius only | C01 |
| §5.2 Rückert datum | factoriality; finite quotients | prime monic `w ∈ W` gives `B/(φ w) ≃ A[X]/(w)` a domain; `B/(b) ≃ B/(α b) ≃ A[X]/(w)` free of rank `deg w` | consequences follow from the stated definition | none |
| §5.3 closed ideals, norm-one generators, strict closedness | `N = 0`; radius 2 over `ℚ_3` (norm-one generators) | empty family; `(X)` has norms in `2·3^ℤ·2^ℕ`, never 1, so the generator statement is unit-radius, as cited | pin: closedness any polyradius, generators unit radius; bosch Cor. 7–10 | none |
| §5.4 finite presentations | `r = √p`, `s = 2`, `c = p` | `‖p‖(√p)² = 1`; `‖a(pX²) + X b(pX²)‖ = max(‖a‖, √p‖b‖)` by parity | holds | none |
| §6.1–6.2 weighted series and Gauss comparison | weights `{u_i}`, `‖u_i‖c_i = 1`; union vs coordinatewise power-boundedness | `a_ν ∈ u^ν U` eventually iff `‖a_ν‖c^ν → 0`; finite products of bounded sets bounded | holds; wedhorn lines 1686–1689, 1719–1768, 2050 | none |
| §6.3 adic series | `A = ℤ_p`, `I = (p)`; `Σ X^n`; `B` linearly topologised | finitely many coefficients outside `p^m ℤ_p`; coefficients do not tend to 0; `b^k J ⊆ J` makes every `b` power-bounded | holds; ega lines 2634–2688 | none |
| §6.4 finite presentations | `T_n^a → T_n^b → M → 0`; `M = 0` | surjection by bounded lifts for the quotient norm; middle exactness by bounded lifts onto the closed image | hypotheses sufficient | none |
| Headline: entire division and inverse (§7.2) | `T³ ÷ (T² + aT + b)`; `P = T − a`; `F(0) = 1`, `F(a) = 0` | quotient `T − a`, remainder `(a²−b)T + ab`; `q_n = Σ_k F_(n+1+k)a^k`; `a·(−Σ c_(n+1)a^n) = 1` | hold; pin needs complete `A` only for the inverse | none |
| §7.2 resultant, preparation, non-normability | `Res(T², a+bT)`; `(1 − T/p)(1 − T)` at `r = p⁻¹`; trivial norm | `a²`; `P = 1 − T/p`, `G = 1 − T` a unit there, swapped factor is not; entire = polynomials, discrete | hold; uniqueness is for fixed `d` under distinguishedness, as at the pin | none |
| §7.1 open disc | `log(1+X)` over `ℚ_p`; `ℤ_p`; evaluation at `‖b‖ < R₀` | coefficient norms `p^k` unbounded; bounded = all over `ℤ_p`; `‖a_n‖‖b‖^n ≤ C(‖b‖/r)^n` summable without ultrametricity | holds | none |
| §7.3 overconvergent series | `Σ p^⌈n/2⌉X^n`; `n = 0`; exponential | even-index weights `(ρ²/p)^(n/2)`, restricted iff `ρ < √p`, no `ρ ∈ p^ℤ`, `ρ > 1`; radius `p^(−1/(p−1))` | holds; gk lines 72–88 | none |
| Supply direction | AdicSpaces §§0.1–0.5, AdicSpacesPartIII §F0.1; AdicSpacesPartII §R0.3, AdicSpacesPartIV §F1.1 | first two on main and in *Needs*; last two only consume (main lines 1992 and 3003) | one direction | none |
| `Suggested.lean` | docstring's 20 names against the pin; elaboration | every name present at the pin; no message, no declaration | an empty file is consistent with the headline list | none |

- Source locators checked against the text: 27 (martin 8, bosch 7, wedhorn 5, ega 4, colmez 2, gk 1).
- Library declarations opened at the pins (file and line read): 54, among them `TateAlgebra/UniqueFactorization.lean` 94, `Jacobson.lean` 122, `KrullDimension.lean` 102, `Groebner.lean` 427 and 448, `ClosedIdeal.lean` 45, `Submodule.lean` 203, `Weierstrass/Division.lean` 244 and 527, `Weierstrass/Preparation.lean` 358, `Entire/Division.lean` 665, `Entire/Preparation.lean` 83–223, `Affinoid/MaximumModulus.lean` 73 and 114, `Weierstrass/Strassmann.lean` 65, Mathlib `RingTheory/PowerSeries/Restricted.lean` 28 and 90.
- All 472 backticked dotted names of the README were searched in the pinned Mathlib and Tau Ceti sources: each is declared there.
- Cross-roadmap citations resolved on main: AdicSpaces §§0.1–0.5 (lines 139–233), AdicSpacesPartIII §F0.1 (231, 270), AdicSpacesPartII §R0.3 (1769, 1992), AdicSpacesPartIV §F1.1 (2998–3003), RigidAnalyticGeometry §1.5 (642), PadicMeasuresIwasawaAlgebras §4.3 (2485); the nine linked roadmaps exist on main.
- Automatic checks: all passed. Dependency check output: `depcheck: 196 roadmaps, 2161 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: exit 0, no message. It declares nothing, so there was nothing to probe with one tactic and no signature to compare.
- The pull request description was read against the head: its count of 24 Checks, the kept section numbers, the dropped AdicSpacesPartIV supplier, the listed changes of content and the empty `Suggested.lean` all agree with the head; ColemanIntegration (main, line 96) does cite the two removed prototype names, as it says.
- No change outside the roadmap folder.

Overlap check: read NewtonPolygons, CompactOperators, LocallyAnalyticDistributions, AdicSpacesPartIV and QuaternionicModularForms (open heads), and LocallyAnalyticDistributions, RigidAnalyticGeometry and PadicFunctionalAnalysis (main). Shared objects: Gauss norms, Layer 4 division, Strassmann's bound, evaluation, Hasse derivatives, entire division and resultants are owned here and consumed by each of them by section; `W_n` is owned by AdicSpacesPartIV and used here through Tau Ceti only; unit-radius Tate noetherianity is owned by AdicSpaces §0.5 and cited in §5.2.

Source independence: 9 passages compared with 6 sources (martin, bosch, wedhorn, ega, gk, colmez), none shared beyond formulas and definitions the mathematics forces; largest share bgr, 7 of 23 locators; contents compared with bgr through the README's own section numbers only (text not readable): Layers 3, 6 and 7 have no counterpart there and Layer 4 is in Martin's generality, independent.

Research link: Layer 4 is the Banach-ring Weierstrass theory of Martin (2016, §1.3), used there for overconvergent subanalytic sets; §7.2 is the entire-series input of Coleman's Fredholm theory (1997, Appendix A3); `W_n` of §7.3 is Große-Klönne's Washnitzer algebra (2000, §1). Rests on the README and on martin and gk.

## Not verifiable

- bgr, coleman and huber are paywalled and settled as uncertified: their locators (BGR §§5.1–5.2 and 7.1.1, including the Rückert datum of §5.2.5; Coleman Appendix A3; Huber §1.2) were not read.
- Cited declarations were read in the pinned sources, not elaborated one by one with `#check`.
- Ownership against the open heads of NewtonPolygons, CompactOperators, LocallyAnalyticDistributions, AdicSpacesPartIV and QuaternionicModularForms was read through the roadmap search tools.

## Source issues

- none

## For the human reviewers

- **Not tested.** `bgr` has the largest share of the README's source locators (7 of 23) and is paywalled (settled as uncertified): neither its wording nor its table of contents was compared; the arrangement was judged from the README's own `bgr` section numbers.
- **Licence.** The Provenance section (`TauCetiRoadmap/RestrictedPowerSeries/README.md` lines 1400–1413) links William Coram's public GitHub repository as prior work whose proofs may be reused with attribution; that repository's licence was not read.

