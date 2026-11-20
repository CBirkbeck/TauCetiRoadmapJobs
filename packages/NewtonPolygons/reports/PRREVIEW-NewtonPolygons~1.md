# Review of NewtonPolygons (pull request #2609 at cfeb3c3)

**Verdict:** needs changes

**Summary.** One finding blocks acceptance. The radius-of-convergence formula (b raised to the supremum of the finite slopes) is stated in three places without the hypothesis that the series has infinitely many nonzero coefficients, and as stated it fails for every nonzero polynomial. Main's text and the Tau Ceti theorem both carry that hypothesis. I recomputed all six Lean statements, the 18 Checks and the 28 examples, and they are correct. There are two small corrections (book-level locators, and one sentence of the description) and two format notes. One licence question is left for the human reviewers.

## R01 (P2) — The radius of convergence is stated to be `b` to the supremum of the finite slopes with no hypothesis on the support, which is false for every nonzero polynomial

The Lean module docstring lists this formula among the headline theorems "proved at the pinned Tau Ceti", and the Layer 5 introduction lists it among the inputs. A consumer reading either gets a formula that the library does not prove and that is false for polynomials.

Over `ℚ_p` with `b = p`, take `f = 1 − pX`. It has the single finite slope `1`, so `b^(sup of slopes) = p`. Its radius is `∞` (Convention 6; Tau Ceti `PowerSeries.radius_coe`, `TauCeti/RingTheory/PowerSeries/Radius.lean:116`). Likewise `liminf w(aₙ)/n = +∞ ≠ 1`, although the coefficient heights of a polynomial are admissible. The library theorem `PowerSeries.radius_eq_exp_iSup_unitSlope_newtonPolygon` (`TauCeti/NumberTheory/NewtonPolygon/Radius.lean:163`) assumes `{n | coeff n f ≠ 0}.Infinite`. Its convex-geometry input `TauCeti.linearGrowthInf_eq_iSup_unitSlope_lowerConvexEnvelope` (`TauCeti/Analysis/Convex/Sequence/Asymptotic.lean:167`) assumes that the finite domain is infinite. The README's own Layer 5 example (line 841) says that a polynomial has infinite radius. Main's §5.1 stated the identification "for infinitely supported `f`" and warned against taking a polynomial's largest slope as its radius; both were lost when §5.1 moved to the supplier contracts.

The three places are:

- the Suggested.lean module docstring, lines 21–22: "the radius of convergence of a power series is `b` raised to the supremum of the finite slopes of its Newton polygon";
- the README overview, lines 28–30;
- the Layer 5 introduction, lines 781–784: "equal to the supremum of the finite slopes for admissible coefficients".

The fix is to add "for a series with infinitely many nonzero coefficients (a polynomial has radius `∞`)" at each place. In the Layer 5 sentence that means "when the coefficients are admissible and infinitely many are nonzero". The overview sentence (line 29) also says that the polygon of a product is the Minkowski sum of the polygons of the factors, without "of two polynomials or of two entire series". Layer 3's example `(1 − X)·Σ Xⁿ = 1` (lines 648–650) refutes that for series. The same edit would add the qualifier, which the Lean docstring (lines 19–20) already has.

## C01 — Five sections cite a book with no chapter, section or theorem, so the claim cannot be located

§§6.1, 6.2 and 6.5 say "Prove (Neukirch)" (lines 866, 895, 933). §4.2 says "(Koblitz IV; Lazard §3)" (line 699) and §5.2 says "(Koblitz IV)" (line 790). A reader cannot find the cited result in a 500-page book. These are exact locators in texts I read:

- the slope factorisation of §4.2 is Kedlaya, *Newton polygons*, Theorem 7 (p. 4, used in the untwisted case of its §5, where `r₀ = ∞`) and Lazard, Proposition 2 (p. 53);
- the constant-one disc factor of §4.1 and `discFactor_unique` is Lazard, Proposition 4, part 2, with `m₂ = +∞` (pp. 55–56), with uniqueness from Proposition 3 (p. 55);
- the product of §5.3 is Lazard (4.13) (p. 60), with the convergence criterion (4.11) (p. 58).

The §6.5 factorisation (roots `−1 ± i` of `ξ₂`) is a direct computation and needs no source. The Neukirch citations for §§6.1 and 6.2 would carry a chapter and a proposition number.

## C02 — The description says that no other statement changed, but the radius identification lost its hypothesis

The description says: "No other statement changed its hypotheses or conclusion." The former §5.1 identification of `λ` with the supremum of the finite slopes was stated on main for infinitely supported series, and it is now stated for all admissible coefficients (R01). Once R01 is repaired, the sentence is true again. Otherwise it should list this change.

## N01 — "finite domain" at line 217 means a bounded one

"A polygon with finite domain has finitely many vertices" uses Convention 1's name for `{n | h n ≠ ⊤}`, which every polygon has, to mean a bounded domain. "With bounded finite domain" would match §0.6's wording.

## N02 — Mathlib pull-request numbers and inspection revisions date the text

Convention 10 (lines 132–143) and the provenance section (lines 1001–1008) name Mathlib pull requests #38050, #43578 and #43580 and the revisions at which they were inspected. Naming each proposal by its content, with the links kept under References, would keep the text timeless.

## Questions for the author

- STATUS.md beside the README names Tau Ceti declarations for the slope factorisation and the constant-one disc preparation (`Polynomial.existsUnique_isPureSlopeFactorization`, `TauCeti.PowerSeries.IsDiscPreparation`). Neither exists at the pinned Tau Ceti (commit of 4 November 2026), so `existsUnique_slopeFactors` and `discFactor_unique` are correctly stated here. When the pin moves, are they meant to become supplier contracts? Because the declarations are absent at the pin, I could not compare their statements with these two.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
| --- | --- | --- | --- |
| 0.1 infimum of polygons (Check) | `P = n`, `Q = 2 − n` | min `(0,1,0,−1,…)`, `2·1 > 0+0`; secant slopes `2/n − 1 → −1`; envelope `−n` | true |
| 0.2 contact point vs vertex (Checks) | `(0,0,1/2,1/3,…)`; `⌈n√2⌉` | from 1: `(1/n)/(n−1) → 0`, envelope `0`, vertex `{0}`; `⌈n√2⌉/n → √2` unattained, envelope `n√2` | true |
| 0.2 restart slope strictly larger | `aₙ ≥ a_p + σ(n−p)` | secant from `q` `≥ σ`; equality at `n > q` contradicts `q` maximal | true |
| 0.3 trichotomy | slopes `1 − 1/(n+1)`; `0,1,0,1,…`; `n²` | `S = 1` unattained, `S_h(1) = inf(−H_n) = −∞` (case 3); all slopes `0 = S` (case 2); `S = ∞` (case 1) | true |
| 0.5 ℤ-indexed sequences | `|n|`, `−|n|` | `S(σ) = 0` for `|σ| ≤ 1`, `n(1−σ) → −∞` for `σ > 1`; `−|n| ≥ c+mn` forces `m ≤ −1` and `m ≥ 1` | true |
| 0.6 extraction recovers envelope | `a = (0,3,1)` | envelope `(0,1/2,1)`, slopes `(1/2,1/2)`, `1/2 < a(1) = 3` | true |
| 1.2 rational valuation `v_π` | `ℚ_p`, `π = p`, `x = p⁻²` | `‖x‖ = p² = ‖p‖^(−2)`, `v_π = −2`; `−log‖x‖ = −2 log p = (log p)(−2)` | true |
| 1.3 completion, `ℂ_p`, `e ≤ [L:K]` | `ℚ ⊂ ℚ_p`; `ℚ_p(√p)`; `p^(1/3)` | both norm sets `p^ℤ`; `e = 2 = [L:K]`; `v = 1/3`; archimedean `ℚ ⊂ ℝ` fails, excluded by standing ultrametric hypothesis | true |
| 2.3 `finiteFace_of_gaussExtrema` | `1 − pX`, `b = p`, `r = p²`, `r = p` | `r = p²`: tilted `(0,−1)`, face `[1,1]`, `l = u = 1`; `r = p`: `l = 0, u = 1`, face `[0,1]` | true |
| 2.3 hypothesis `r < s` needed | `1 + Σ p^⌈√n⌉ Xⁿ`, `r = s = 1` | `l = u = 0` but face at slope `0` is the whole ray | hypothesis necessary, present |
| 2.3 unit criterion without completeness | `f = a₀(1+g)`, `‖g‖_r = θ < 1` | inverse coefficients finite sums; `‖coeffₙ gᵏ‖rⁿ ≤ θᵏ`, each `gᵏ` restricted: inverse restricted | true |
| 2.4 first break and distinguishedness | `(0,0,1/2,…)`; `1 + pX + p³X²` | no break at 1; break `j = 1`, `σ₀ = 1`; at `r = p`: `1, 1, p⁻¹`, `l = 0`, `u = 1` | true |
| 3.2 local law on a common disc | `1 − X`, `Σ Xⁿ`, `σ < 0` | faces `[0,0]`, `[0,0]`; product `1`: `[0,0]`; global Minkowski sum is a ray, polygon of `1` a point | true |
| 3.3 roots and ball counts | `X²(1 − pX)`, `σ = 1` | slopes `{1}`, root `1/p` with `−w = 1`; face `[2,3]`: 2 roots `< p`, 3 `≤ p`, 1 `= p` | true |
| 4.1 `discFactor_unique` | `1 − pX`, `r = p²`, `r = 1` | `r = p²`: `d = 1`, `(1 − pX, 1)`; `r = 1`: `d = 0`, `(1, f)`, `‖f − 1‖₁ = 1/p < 1` | true |
| 4.1 estimate `‖f − P_r‖_r < ‖f‖_r` | `1 − pX`, `r = 1` | `‖pX‖₁ = 1/p < 1 = ‖f‖₁` | true |
| 4.2 `existsUnique_slopeFactors` | `1 + pX + p³X²`; `f = 2`; `X² + X + 2` over 2-adic `ℚ` | slopes `{1,2}`, two linear factors; empty family, `f = C 2`; slopes `{−1,0}` yet irreducible (disc `−7`): completeness needed, present | true |
| 4.3 `discPolynomial_root_counts` | `X − p`, `r = 1`, `r = 1/p` | `r = 1`: `l = u = 1`, counts `(1,1,0)`; `r = 1/p`: `l = 0, u = 1`, counts `(0,1,1)` | true |
| 4.3 `exists_zeros_card_eq` | `1 + X + Σ_{n≥2} p^⌈√n⌉ Xⁿ`, `r = 1` | `l = 0`, `u = 1`: one zero, on the unit sphere; `u_r(P) = u − u_r(e) = u` | true |
| 5.2 point radius | `Σ p^⌈n/2⌉ Xⁿ` over `ℚ_p` | `R = p^(1/2)`; converges at `|x| = p^k` iff `k ≤ 0`; point radius `1 < √p` | true |
| 5.3 `exists_zeros_tendsto_gaussNorm_sub_prod` | `Σ p^(n²) Xⁿ`; `ρ ≤ 0` | slopes `2n+1`, zeros of norm `p^(2n+1)`; `Z ρ = ∅` forced for `ρ ≤ 0` since `f(0) = 1` | true |
| 5.3 disc factors converge | `‖U_r − 1‖_r < 1`, `s < r` | `|Uₙ|sⁿ < (s/r)ⁿ ≤ s/r`; `‖f − P_r‖_s ≤ ‖f‖_s·s/r → 0` | true |
| 6.1 irreducibility (Checks) | `X² − 9`, `X² − 18` over `ℚ_3`; Eisenstein | heights `(2,∞,0)`, slope `−1`, `d_m = 2`, `q_m = 1`; reducible, irreducible; slope `−1/d`, reversal `+1/d` | true |
| 6.2 denominators divide `e` | `X^p − p`; `ξ₂` over `ℚ₂(i)` | `q = p = e`; slope `−1/2`, `q = 2 = e`, `(i−1)² = −2i` so `v(2) = 2` | true |
| 6.4 formal vs normed preparation | `p + X + X²` over `ℤ_p` | valuations `(1,0,0)`: `μ = 0`, `λ = 1`, normed degree `2`; root valuations `1` and `0` | true |
| 6.5 `ξ₂` factorisation | roots `−1 ± i` | sum `−2`, product `−(i²−1) = 2`; slope `−1` at `v(2) = 2`, `−1/2` at `v(2) = 1` | true |
| Headline: roots are slopes (pin) | `X²(1 − pX)` | `Polynomial.newtonSlopes_eq_map_roots_map`: `{1} = {−w(1/p)}` | true |
| Headline: product (pin) | `(1 − X)(1 − pX)` | heights `(0,0,1)` = Minkowski sum of `(0,0)` and `(0,1)` | true |
| Headline: radius (R01) | `1 − pX`, `b = p` | `R = ∞` (`radius_coe`); `b^(sup slope) = p`; `liminf w(aₙ)/n = +∞ ≠ 1` | false as stated; library assumes infinite support |
| Headline: `π^μ` preparation (pin) | `p(1 + X)` over `ℤ_p` | `μ = 1`, `λ = 0`, `P = 1`, `u = 1 + X` | true |
| Headline: Hodge–Newton (pin) | weights `(0,2)`, `(1 − pT)²` | Hodge `(0,0,2) ≤` Newton `(0,1,2)`; `diag(p,p)` vs `[[p,1],[0,p]]` invariant factors `(p,p)`, `(1,p²)` | true |

- Source locators checked against the text: 11. These are Lazard (1.7)–(1.11) (pp. 49–50), Propositions 1–4 (pp. 50–56) and (4.11)–(4.13) (pp. 58–60); Kedlaya, *Newton polygons*, Corollary 3 and Theorem 7; Kedlaya, *numerical analysis*, Theorem 16. Every locator in the seeded sample that cites Lazard or Kedlaya supports its statement as written.
- Library declarations: all 333 backticked names of the README elaborated with `#check` at the pins and resolve. Opened and read: `TauCeti/RingTheory/PowerSeries/GaussNorm.lean:351,459`, `Entire/GoodZero.lean:84`, `Analysis/Convex/Sequence/Face.lean:203`, `NumberTheory/NewtonPolygon/Basic.lean:100`, `Slopes.lean:110`, `GaussNorm.lean:215,228`, `Radius.lean:163`, `Asymptotic.lean:167`, `Weierstrass/Preparation.lean:467`. None of the six Lean targets is proved at the pin.
- Cross-roadmap citations resolved on main: RestrictedPowerSeries (Layers 0–1, §§2.1–2.4, §3.2, Layers 4 and 7), FormalLaurentPuiseux L1 and L5, CompactOperators §1.2 and Layer 4, PadicMeasuresIwasawaAlgebras §4.3, FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.16 and R07.3.2, CrystallineCohomology §CR.4.7, LocallyAnalyticDistributions §4.13, and Completed/LocalFieldsRamification. Main's citations of the eight emptied sections (ClassicalArithmeticCompletion §3.1, HypergeometricMotives §2.1, PadicDifferentialEquationsAndRigidCohomology §§0.7 and 2.1, DeligneWeightsAndPurity §0.7, PadicMeasuresIwasawaAlgebras §6.3 and its Lean name) resolve through the scope table.
- Dependency check output: `depcheck: 200 roadmaps, 2201 edges, 0 problem(s)`. All suppliers are on main.
- Automatic checks: all passed.
- Elaboration of `TauCetiRoadmap/NewtonPolygons/Suggested.lean`: six `sorry` warnings and nothing else. `#check @` of the six declarations shows every binder explicit and each type equal to its README statement.
- One-tactic probe (`simp`, `rfl`, `infer_instance`, `exact?`) on a scratch copy closes none of the six, so there is no padding.
- Checks and examples recomputed: 18 of 18 Checks and 28 of 28 example bullets are true.

Overlap check: read RestrictedPowerSeries, CompactOperators, PadicExtensionFamilies, FormalLaurentPuiseux (main and its open revision), LocallyAnalyticDistributions and PadicDifferentialEquationsAndRigidCohomology. Shared objects and their owners:
- Coefficient polygons over `K((t))`: owner Tau Ceti (`Polynomial.newtonPolygon` at `LaurentSeries.realAddVal`). Main's FormalLaurentPuiseux L5 still plans them; its open revision cites this roadmap and Tau Ceti instead.
- Normed preparation: owner RestrictedPowerSeries Layer 4, through Tau Ceti.
- Lattice minors: owner CompactOperators Layer 4; the polygon comparison is Tau Ceti's.
- Slope factorisation: owner this roadmap's §4.2, cited by PadicExtensionFamilies.

Source independence: 12 passages compared with 3 sources (Lazard, Kedlaya, KedlayaNumerical); none shared, none translated. The largest share is Lazard, 16 of 46 locator mentions. Contents compared with Lazard: independent. Lazard §§1–4 meet Layers 2–5 in the same order, but the *Needs:* lines of 4.2, 4.3 and 5.3 force that order. Layers 0, 1 and 6 and Lazard §§5–9 have no counterpart in the other.

Research link: Layers 4–5 are Lazard's 1962 theory of zeros of analytic functions over complete valued fields (disc factors, zero counts, (4.13)). Layer 6 is the μ–λ Weierstrass preparation of Iwasawa theory (Washington §7.1) that PadicMeasuresIwasawaAlgebras uses. The Hodge–Newton comparison feeds Fredholm determinants (Kedlaya 2007, Theorem 16). This rests on the README and the Lazard and Kedlaya texts.

## Not verifiable

- Koblitz IV §§3–4 (§§0.1–0.6, 2.4, 4.2, 5.2): GTM 58. The sources service finds only the paywalled publisher page.
- BGR §§3.2 and 5.2 (§§4.1, 4.3): Grundlehren 261. Paywalled publisher page only.
- Neukirch II §§3–4, 6, 8, and the bare "Neukirch" (Layer 1, §§6.1, 6.2, 6.5): Grundlehren 322. Paywalled publisher page only.
- Washington §7.1 (§6.4): GTM 83. Paywalled publisher page only.
- NSW (5.3.1)–(5.3.4), pp. 289–290 (§6.4): the authors host the book on their page, but the sources service returned only the landing page, not the PDF.

Automatic checks set aside as false positives: the citation resolver reads the reference key KedlayaNumerical §3 in the Layer 2 dependencies (line 596) as a citation of a roadmap. It is a source key listed under References.

## Source issues

- **Misprint** in Kedlaya at §1 (p. 1): the points of the Newton polygon use the valuation of `f_i` while the coefficients are named `P_i`; it should be the valuation of `P_i`; affects nothing.
- **Misprint** in Kedlaya at §2, proof of Proposition 1 (p. 2): the first displayed inequality uses the valuation of `b_j` where the coefficient is `Q_j`; it should be `v(Q_j)`; affects nothing.

## For the human reviewers

- Licence: the provenance section (README lines 983–1008) names a public repository (WilliamCoram/PhD at a fixed revision) as a source of candidate implementations for reuse with attribution. I did not read its licence or compare its declarations with Suggested.lean.
