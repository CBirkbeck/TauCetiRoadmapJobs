# Review of SeibergWittenTheory (pull request #2651 at 609b5a7)

**Verdict:** needs changes

**Summary.** The mathematics I could compute holds up: all 59 Checks, the index and dimension formulas, the Weitzenböck and maximum-principle constants, the orientation and Segre computations and the E × ℙ¹ normalization recompute correctly, and every library name and supplier section resolves at the pins and on main. Three findings block acceptance: no target carries an exact source locator, the four headline theorems included; the module docstring of `Suggested.lean` states the wall-crossing formula without its range of degrees and parities, and without that range it is false; and a Check in §4.3 puts a double cover the wrong way round. There are two small corrections and two format notes, none blocking, and one point is left to the human reviewers: Taubes's paper could not be read legally here.

## R01 (P2) — No target carries an exact source locator, the four headline theorems included, so none can be checked against the literature

Without a theorem and page, a reader cannot see which published statement a target restates or under which hypotheses. Nor can they see where the roadmap departs from its source; one such departure is the sign of the wall-crossing formula.

How I know: I sampled fifteen sections (§§2.3, 3.1, 3.3, 3.3a, 3.4, 3.5, 4.4, 6.2, 6.3, 7.1, 7.3, 9.1, 10.2, 10.4 and 11.1). Ten cite no source at all. The other five cite a work by title only, with no theorem, section or page: Okonek–Teleman in §§7.1, 7.3 and 9.1, and Taubes in §11.1. The headline theorems are in the same state:
- Compactness (§§5.2, 5.4), the dimension and structure theorem (§§3.5, 6.3) and invariance (§8.3) cite nothing.
- The wall-crossing formula is credited only to "(Okonek and Teleman, *op. cit.*, for the universal wall-crossing formula)" (line 1272).
- §10.2 compares with "the source's model" (line 1242) without naming a source.

The smallest repair is to put locators at the claims. These are ones I opened.

From Okonek–Teleman (arXiv alg-geom/9603003v4):
- Proposition 4 i), ii) and vi) (pp. 4–6): properness, universal transversality and the codimension-b⁺ wall (§§5.4, 6.1, 8.3).
- Lemma 5 and the Remark after it (pp. 6–7): μ (§7.2).
- Definition 6 (p. 7): the insertions (§8.2).
- Definition 7 (p. 8): the chambers (§6.2).
- §4.1 (p. 10): the Picard cover (§9.1).
- Lemma 13 (p. 13): the classes `c_k = u^k/k!` (§9.4).
- Proposition 15 (p. 14): the Segre recurrence (§10.2).
- Theorem 16 with Proposition 14 (pp. 14–16): §10.3. Say at this citation that the printed formula there, `exp(−u_c)`, differs from §10.3 by `(−1)^k`. The difference comes from the Koszul sign that the §9.4 Check keeps (see Source issues).

From Booß-Bavnbek–Marcolli–Wang: Lemma 2.2 (p. 5), Lemma 2.4 (p. 7) and Theorem 2.7 (p. 8), for §5.1.

From Witten, *Monopoles and four-manifolds* (arXiv hep-th/9411102):
- eq. (2.5) and the index sentence before it (p. 6): §§3.3 and 3.5.
- eq. (3.1) (p. 14): the integrated Weitzenböck identity (§§3.2, 5.2).

The citations of Taubes need locators as well; I could not read that paper.

## R02 (P2) — The module docstring of `Suggested.lean` states the wall-crossing formula without its range of degrees and parities, and so stated it is false

The docstring is where the file records the headline that the finished roadmap is tested against. A reader who takes it as written gets a false formula.

Lines 21–22 read: "for `b₂⁺ = 1` the jump `SW^r_+(λ) − SW^r_−(λ)` is `⟨ν_T(λ) u^k/k!, [T]_h⟩`". Two counterexamples:
- **ℂP² with l = h.** Here b₁ = 0, δ = 0 and d = −2. For r = 0 and k = 0 both invariants are 0, because the regular moduli spaces are empty. The right-hand side is ⟨1, [pt]_h⟩ = ±1.
- **Σ₂ × S² with l = 0.** This fails even with d ≥ 0. Here b₁ = 4, b₂⁺ = 1, δ = 0 and d = 2. For r = 4 and k = 0 the left-hand side vanishes for degree reasons, while the right-hand side is det(⟨α_j, γ_i⟩) = ±1 on a basis.

§10.3 and the README overview both carry the hypotheses d ≥ 0, 0 ≤ r ≤ min(b₁, d) and r ≡ d ≡ b₁ mod 2. Add them to the docstring, with k = (b₁ − r)/2.

## R03 (P2) — The second Check of §4.3 puts the double cover the wrong way round

A reader comparing it with §9.1 finds two opposite statements about the same covering. Lines 596–598 read: "the gauge transformations of L alone (A ↦ A − u⁻¹du) would give period 2πα, its double cover."

The Spinᶜ gauge group translates the harmonic part by 4πiℤα; the gauge group of L translates it by 2πiℤα. The map ℝ/4πℤ → ℝ/2πℤ has degree two, so the circle of period 4πα (the quotient taken here) double covers the circle of period 2πα, not the reverse. §9.1 says the same thing correctly: the map from T to the 2π torus is the finite cover that multiplies the integral generators by two.

Repair: "…would give period 2πα, a circle that the quotient here double covers."

## C01 — Other roadmaps cite the former SW numbering, and the README does not record how it maps to the new numbering

These citations break at the merge unless the README records the map:
- TaubesGromov on main cites SW7.1 and SW8.3 (line 38), SW4.5 and SW7.2 (line 173), SW5.4 (line 316), and SW1–SW11 (line 9).
- FourManifolds cites SW1 (line 3158).
- YangMillsConnectionsAndCaloricGauge cites SW4 (line 93).
- DGFloer, at the head of its open pull request #1798, cites SW3.3a (line 3791).

The description gives the map, but the README is where those citations land. One sentence would do, for example: "Section SWk.n of the former numbering is §k.n here, SW3.3a is §3.3a, and SWk is Layer k."

## C02 — The pinned Tau Ceti already has the smooth half-spin action of compact Spin; §1.1 does not cite it and the description says it is absent

The declaration is `AlgHom.realCliffordSpinEvenSmoothHom` in `TauCeti/Geometry/Lie/CliffordAlgebra/Spin/EvenRepresentation.lean`. Its docstring covers either half-spin action. Its differential is `AlgHom.lieMap_realCliffordSpinEvenSmoothHom_eq`.

The Spinᶜ(4) statement of §1.1 is still new, since at the pin the Spinᶜ representation is only continuous, so the target stands. The suggested changes:
- Add these declarations to the *Needs:* line of §1.1, to §1.3 (where ρ_* acts through the spin Lie algebra) and to the supplier contracts.
- In the description, replace "smoothness of the half-spin representations (only continuity)" with "smoothness on Spinᶜ(4) (the library has the smooth action of compact Spin, and continuity on Spinᶜ)".

## N01 — The ruled-surface test of §10.4 needs §11.2, which sits in a later layer

Either say in "How to read the build" that §11.2 comes before the E × ℙ¹ bullet of §10.4, or move that bullet to the Checks of §11.2.

## N02 — Many sentences say what the route does not do

Examples: §6.3 (lines 831–832, a residual set "not intersected with C∞ and called dense"), §7.1 (lines 882–883, "not through an unnamed claim") and §9.2 (line 1115, "not a second definition of K-theory"). They read as replies to past objections. Stating the route positively, or dropping these clauses, would be timeless; this is optional.

## Questions for the author

- §1.1 says FourManifolds §4.1 builds its Spinᶜ structures "on this group", meaning `CliffordAlgebra.spinCGroup`. But FourManifolds §4.1 (its line 1863) defines Spinᶜ(n) itself, from the native Spin group, and never names the library's group. If the two carriers differ, which roadmap owns the isomorphism along which §1.1 transfers smoothness? I could not tell from FourManifolds which carrier it intends.

## Verified sound

| Target | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §2.3 quadratic two-form | vacuum u₀, ω = e¹²+e³⁴ | q(u₀) = iω/4, \|q\|² = 2/16 = 1/8 = \|u₀\|⁴/8; Hilbert–Schmidt variant gives 1/2 | holds; no locator (R01) |
| §2.1 Clifford map | ω = e¹²+e³⁴ on W⁺ | c₂(ω) = 2c₁c₂ there, C(iω) eigenvalues ±2, tr C*C = 8 = 4\|ω\|², operator norm 2 = √2\|ω\| | holds |
| §3.1 Dirac symbols | ξ ≠ 0; u = e^(iθ) | c(ξ)(−c(ξ)/\|ξ\|²) = 1, the variant gives −1; D_(A−2u⁻¹du)(uψ) = uD_Aψ | holds; no locator |
| §3.3 index | K3, ℂP² (3h), ℂP² (h) | (0+16)/8 = 2 = χ(O); (9−1)/8 = 1; (1−1)/8 = 0; variant (l²+σ)/8 gives −2 and 10/8; Witten p. 6 agrees | holds; no locator |
| §3.3a character | torus a₊, a₋, z | e^z(2cosh a₊ − 2cosh a₋) = e^z·4 sinh(x₁/2)sinh(x₂/2); Td(TX⊗ℂ) = Â² | holds; no locator |
| §3.4 abelian operator | S⁴, T⁴, K3, ℂP² | b₁−1−b₂⁺ = −1, 0, −4, −2 | holds; no locator |
| §3.5 linearization | symbolic; K3; ℂP² (h) | d₁d₀ξ = (0, ξD⁺ψ); 2δ+b₁−1−b₂⁺ = (l²−2χ−3σ)/4 identically; values 0 and −2; Witten (2.5) agrees | holds; no locator |
| §4.4 slices | ξ = it; \|ψ\| ≡ ε | d₀*d₀ξ = 4Δξ + \|ψ\|²ξ, using Re⟨itψ, φ⟩ = t·Im⟨ψ, φ⟩; lowest eigenvalue ε² → 0 | holds; no locator |
| §6.2 walls | ℂP² Fubini–Study, η = −irω | w = −6π h·[ω] < 0; ∂w/∂r = ‖ω‖² = 1; C₊ equals Okonek–Teleman CH₀,+ with b = [iη/2π] | holds; no locator |
| §6.3 Sard–Smale | surjective Fredholm map, d < 0 | index = dim ker ≥ 0, so empty; SardSmale.lean:409 threshold (dim ker)²+1 matches Convention 10 | holds; no locator |
| §7.1 orientation | [0,1]×M, parameter first or last | boundary M₁−M₀ versus (−1)^d(M₁−M₀) | holds; title only |
| §7.3 slant | determinant line at {x₀}×B | weight u(y)², class 2μ; Okonek–Teleman p. 12 has factor 2 on c₁(P×det) | holds; title only |
| §9.1 Poincaré line | A_t = A_ref + 4πitα | c₁ = [i·2πi dt∧α/2π] = [α∧dt]; slant +⟨α,γ⟩; determinant curvature would double it | holds; title only |
| §10.2 Segre | W = 0; general W | π_!(ζ^m) = s_(m−k+1)(K); Σ_j c_j(W)s_(w−j+m−k+1)(K) = s_(m−δ+1)(K−W); Okonek–Teleman Prop. 15 agrees | holds; no locator |
| §10.4 E×ℙ¹ | m₀, n > 0 | l = 2m₀x+2ny, l² = 8m₀n, δ = m₀n, d = 2m₀n = e²−κe; ⟨lα₁α₂⟩ = 2n; jumps 1 and n | holds; no locator |
| §11.1 canonical lift | Fock module, degrees 0, 1, 2 | c₂(ω) = i(2p−2) gives −2i, 0, 2i (Kahler.lean:230); even part = W⁺ (Polarization/Chirality.lean:233) | holds; Taubes unreadable |
| §11.2 twists | ℂP², K3, l = −κ+2e | κ² = 9 = 6+3 and 0 = 48−48; d = e²−κe; δ − (e²−κe)/2 = (κ²+χ)/12 | holds |
| §9.4 Pfaffian | b = 4; u = ν₁ν₂+ν₃ν₄ | u²/2 = a₁₂a₃₄ − a₁₃a₂₄ + a₁₄a₂₃ (signs recomputed); value ν₁ν₂ν₃ν₄ | holds |
| Headline: compactness | maximum of f = \|ψ\|² | 0 ≥ Scal·f/4 + f²/4 − √2\|η\|f/2, so f ≤ 2√2\|η\| − Scal; Hilbert–Schmidt norm would give 4\|η\| | holds; no locator |
| Headline: structure | K3, ℂP² (3h), ℂP² (h) | d = 0, 0, −2 (empty); Fredholm surjectivity forces d ≥ 0 | holds; no locator |
| Headline: invariance | regular path; b₂⁺ = 2 | ∂W = M₁−M₀ gives difference 0; generic 2-families meet a codim-2 wall in points; ⟨ν(γ)²μ^m⟩ = 0 | holds; no locator |
| Headline: wall crossing | degree count; Okonek–Teleman | m−δ+1 = k; Okonek–Teleman print (−1)^k u^k/k!; graded Koszul sign gives c₁(I) = −u, hence +u^k/k! | holds as §10.3 states; R01 |
| §4.3 Check (R03) | S¹×S³ | Spinᶜ lattice 4πiℤα, L lattice 2πiℤα; ℝ/4πℤ → ℝ/2πℤ has degree 2 | README reverses it |
| Docstring (R02) | ℂP² (h), r = 0; Σ₂×S² (l = 0), r = 4 | left side 0 and 0; right side ±1 and ±1 | false without range |
| §1.1 smoothness (C02) | pinned library | EvenRepresentation.lean: smooth half-spin action of compact Spin; Spinᶜ only continuous | target stands; citation missing |

- Source locators checked against the text: 18, in three texts. Okonek–Teleman: Prop. 4, Lemma 5, Remark p. 7, Def. 6, Def. 7, §4.1, Lemma 13, Props. 14–15, Thm. 16, and the blowup on p. 17. Booß-Bavnbek–Marcolli–Wang: Thm. 2.1, Lemma 2.2, Lemma 2.4, Thm. 2.7, Appendix. Witten: eqs. (2.5) and (3.1). Taubes was unreadable.
- Library declarations opened at the pins: 22, in 12 files (`Analysis/Fredholm/SardSmale.lean` 409, 433; `LinearAlgebra/CliffordAlgebra/Chirality.lean` 174; `RepresentationTheory/Spin/Polarization/Chirality.lean` 233; `…/Fock/Kahler.lean` 230, 246; `…/Fock/Basic.lean` 162; `Analysis/PDE/SeibergWitten/CliffordRestriction.lean` 347, 497; `…/QuadraticTwoForm.lean` 273; `LinearAlgebra/CliffordAlgebra/HalfSpinor.lean` 333; `…/Spin/Real/Chirality.lean` 201; `…/ChargeConjugation.lean` 77; `…/SelfDualSplitting.lean` 320; `…/QuadraticEnd.lean` 86, 90, 105, 115, 120, 195, 325); all 113 dotted backticked names are declared at the pins (one is a namespace).
- Cross-roadmap citations resolved on main: all 14 suppliers and every cited section. FourManifolds §4.1 and Layer 5; SmoothBundlesConnections B2.1, B2.2, B3.1, B3.3, B4.1, B4.2, B6.2, B6.3; ComplexKahlerGeometry 5.1, 5.4, 5.5, 5.7; PseudodifferentialOperators Layers 1, 4–7; SpinGeometry 6.1–6.3; IndexTheory Layers 1–7, 6.1–6.3, 7.2, 7.3; HeegaardFloer 2.1, 2.2, 2.5, 3.4; AlgebraicTopology Layers 6–8; CharacteristicClasses 1.1b, 1.5, 2.4–2.5, 3.1–3.3, 5.2–5.3, 6.1–6.5; GeometricTopology Layer 1; DGFloer Layer 1 item 2 (the cohomological Serre spectral sequence); TopologicalKTheory T1, T1.6a, T4, T5, T6.5; OperatorKTheory K4 4.1–4.2; HilbertModules H5.
- Automatic checks: all passed. Dependency check output: `depcheck: 200 roadmaps, 2202 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no messages. The file declares nothing, so there was no `#check @name` comparison to make.
- Checks: all 59 Check bullets, in 38 sections, recomputed.
- Wording comparison: 13 passages, in §§5.1 (three), 6.1, 6.2, 7.2, 8.2, 9.1, 9.4, 10.1, 10.2, 10.3 and the `Suggested.lean` docstring, set beside Okonek–Teleman and Booß-Bavnbek–Marcolli–Wang at their locators. They share only formulas and phrases of at most three words.

Overlap check: read SpinGeometry, IndexTheory, FourManifolds, TaubesGromov, InstantonFloerTheory and SpectralManifolds. Shared objects and their owners:
- Spinᶜ lifts and determinant lines: FourManifolds §4.1, cited here.
- The generic Dirac operator and square formulas: SpinGeometry §§6.1–6.3, cited here.
- The index theorem: IndexTheory Layers 1–7, cited here.
- SU(2) anti-self-dual theory: FourManifolds Layer 5, not used here.
- SW = Gr and the large-parameter theory: TaubesGromov, a consumer of this roadmap.

Nothing is owned twice. The open DGFloer head cites §SW3.3a only as a consumer, so there is no cycle.

Source independence: 13 passages compared with 2 sources, none shared. The largest share of the citations is tied between Okonek–Teleman and Taubes, 6 of 13 each; no citation carries a locator. Contents compared with Okonek–Teleman (§§1–5): independent; the 11 layers map onto no run of its sections. Taubes's text and table of contents were not readable.

Research link: Layers 8–10 are the full exterior-form invariant and wall-crossing formula of Okonek–Teleman (1996, Theorem 16), which generalizes Witten (1994) and Li–Liu. Taubes (1995) uses these invariants for SW = Gr, consumed by TaubesGromov. Weak unique continuation (§5.1) is Booß-Bavnbek–Marcolli–Wang (2002, Theorem 2.7). This rests on the README and on the texts of Okonek–Teleman and Booß-Bavnbek–Marcolli–Wang that I read.

## Not verifiable

- Taubes, *The Seiberg–Witten and Gromov invariants*, Math. Res. Lett. 2 (1995). The publisher's page refused access (HTTP 403) and no open copy was found. Its uses in §§1.3, 4.3, 7.2, 8.2 and 11.1–11.2 were not checked.

## Source issues

- **Error** in OkonekTeleman1996 at §4.1, the Chern character of index(D_A), p. 13: the source says c₁(index) = +u_c, squaring Σν′(l_i)⊗l^i without the Koszul sign; it should be −u_c under the graded Künneth product, so c(index) = exp(−u_c); affects a stated result.
- **Misprint** in BBMW2002 at the proof of Theorem 2.7, p. 9: the source says the absorption factor is 1 − 2CC₀/R, with C₀ bounding \|P\|; it should be 1 − 2CC₀²/R, since \|P_A(u)\|² ≤ C₀²\|u\|²; affects nothing.

## For the human reviewers

- Not tested: Taubes 1995 (6 of 13 citations, tied for the largest share) could not be read legally (publisher HTTP 403), so the wording and arrangement were not checked against it.
