# Review of SeibergWittenTheory (pull request #2651 at 83f8b33)

**Verdict:** accepted

**Summary.** Accepted, with no findings. The head is the one the previous review read, so its three findings stay repaired; this round recomputed every Check, headline formula and sign convention independently and found no false statement, including the sign `c₁(I) = −u` on which the wall-crossing formula departs from Okonek–Teleman, which an independent computation with the Picard bundle on E × ℙ¹ confirms. There are six small corrections and three format notes, none blocking: an inverse written with its Sobolev orders reversed in §4.4, a supplier credited in §11.1 with a construction it does not state, two restatements of theorems SpinGeometry and IndexTheory already state, Mathlib's divided powers unnamed, and thirteen sections without a source locator. Nothing is left for a human to decide.

## C01 — The elliptic inverse of §4.4 is written with its Sobolev orders reversed

In §4.4 (lines 621–622) the text asks for the "elliptic inverse `H^(s+1) → H^(s−1)`" of `d₀*d₀ = 4Δ + |ψ|²`. That is the direction of the operator itself: it has order two and maps `H^(s+1)` to `H^(s−1)`, so its inverse maps `H^(s−1)` to `H^(s+1)`. An implementer reading the arrow as written would state a map that loses two derivatives where the slice construction (the implicit function theorem applied to the Coulomb map, and the "unique small gauge transformation" of §4.5) needs the gain of two.

"its elliptic inverse `H^(s−1) → H^(s+1)`" would be right.

## C02 — The *Needs:* line of §11.1 credits FourManifolds §4.1 with "lifts from a U(2) reduction", which that section does not state

FourManifolds §4.1 on main (`TauCetiRoadmap/FourManifolds/README.md` lines 1861–1911) defines Spinᶜ(n), its projection and determinant character, principal lifts of a fixed frame bundle and the torsor of twists. The string "U(2)" does not occur in that README, and no homomorphism U(2) → Spinᶜ(4) or lift attached to an almost-complex structure is stated there; its Checks only use "the complex Spinᶜ determinant" of ℂP² and of the Enriques surface. The body of §11.1 says "construct the canonical Spinᶜ lift from the reduction to U(2)", so the construction is this section's own, and the parenthesis in the *Needs:* line (line 1381) reads as if it were supplied.

The parenthesis would read "(Spinᶜ lifts and their determinant lines)", with one clause in the body saying that the homomorphism U(2) → Spinᶜ(4) covering the inclusion in SO(4), with determinant character det, is constructed here.

## C03 — Three bullets of §3.1 and the chiral symbol of §3.3 are theorems of SpinGeometry §6.1, listed here as targets

SpinGeometry §6.1 on main proves, for every Hermitian Clifford module with a Levi-Civita-compatible Hermitian connection and a parallel grading: the Leibniz rule `D(fs) = c(df)s + fDs`, the formal adjoint identity between D⁺ and D⁻ with H¹ domains, the geometric symbol triple of D⁺, and the phase homotopy joining it to the Fourier symbol `i c(ξ)` (`TauCetiRoadmap/SpinGeometry/README.md` lines 2338–2341 and 2374–2383). By §1.3 here, (W, c, ∇_A) is such a module. The second half of the first bullet group (line 408), the adjoint bullet (line 410), the symbol bullet (lines 411–413) and the first sentence of §3.3 (line 436) restate these without saying so, and invite a second proof.

A clause "by SpinGeometry §6.1 applied to (W, c, ∇_A)" on those bullets would leave `D_(A+a) = D_A + c(a)/2`, the gauge covariance and the comparison with the Spinᶜ Thom character as this roadmap's targets.

## C04 — §3.3a proves again that the Euler class is not a zero divisor for Spin(4) × U(1), which IndexTheory §6.3 verifies

§3.3a (lines 464–467) asks to prove that the tangent Euler class of SU(2)₊ × SU(2)₋ × U(1) restricts to the root product x₁x₂ and is not a zero divisor. IndexTheory §6.3 on main verifies the non-zero-divisor hypothesis for `Spin(2ℓ) × U(k)` through the torus injection and the Euler-root product (`TauCetiRoadmap/IndexTheory/README.md` lines 1304–1307); ℓ = 2, k = 1 is this group acting on ℝ⁴. The section already calls itself an application of IndexTheory §§6.2–6.3.

Citing §6.3 for that step would leave what is new here: the rational isomorphism from B(Spin(4) × U(1)) to BSpinᶜ(4), which carries the property to Spinᶜ(4), and the characters `z ± a₊`, `z ± a₋`.

## C05 — §9.4 builds integral divided powers without naming Mathlib's `DividedPowers`, and the description says the library has none

Mathlib at the pin has `DividedPowers`, a divided-power structure on an ideal of a commutative semiring (`Mathlib/RingTheory/DividedPowers/Basic.lean` line 77). The class `u^k/k!` of §9.4 (lines 1195–1199) is the value of such a structure on the positive even-degree part of the integral cohomology of the torus. A reader cannot tell whether the target is an instance of the library's structure or a separate construction.

§9.4 would name `DividedPowers` as the structure instantiated, or say why it is not used. In the description, "the library has none of the following at the pins: … divided powers" would read "no divided-power structure on the cohomology of a torus".

## C06 — Thirteen sections cite no source, and the citations of Taubes give no theorem, section or page

§§1.2, 1.4, 3.1, 3.3a, 4.1, 4.2, 4.4, 4.5, 5.3, 8.1, 9.2, 9.3 and 11.3 carry no locator, and Taubes, *The Seiberg–Witten and Gromov invariants*, is cited by title only in §§1.3, 4.3, 7.2, 8.2, 11.1 and 11.2. Most of these are constructions whose routes the README gives in full, and every formula in them was recomputed (table below), so nothing stated is in doubt. The larger ones (the smooth Banach quotient of §4.5, the relative parameter theorem of §8.1, the family index theorem over the Picard torus of §9.3) still cannot be compared with a published statement.

A published statement with theorem and page at each would close this; a paywalled text may be cited by locator alone.

## N01 — §10.1 writes `η′_s` for a derivative where §6.2 writes η′ for the real form of η

In the Check of §6.2 (line 839) "η = iη′" makes η′ a real two-form; in §10.1 (line 1252) "`η′_s = −iω_g`" is the s-derivative of η_s, an imaginary form. `∂_s η_s = −iω_g` would remove the clash.

## N02 — Several sentences say what the route does not do, and one names a work the References do not list

Lines 594, 625, 714–716, 963, 1246–1248, 1258–1260 and 1327–1329; the last mentions "a positive chamber of Baldridge", which the References do not list. Dropping these clauses, or citing Baldridge, is optional.

## N03 — §1.3 uses the Levi-Civita connection without naming Mathlib's `CovariantDerivative.leviCivitaConnection`

It exists at the pin (`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean`), and SpinGeometry §6.1 cites it; the *Needs:* line of §1.3 (lines 207–209) would name it.

## Earlier findings

The head is unchanged since the previous review (0 changed lines in the folder), so each was checked again at the same passages.

- R01 (no locators): partly repaired, as before. For example line 766, "Okonek and Teleman, Proposition 4 i), p. 4, for the properness of the projection to the parameters". The remainder is C06.
- R02 (docstring range of the wall-crossing formula): repaired. `Suggested.lean` lines 21–23: "`d ≥ 0`, `0 ≤ r ≤ min(b₁, d)` and `r ≡ d ≡ b₁ mod 2`", with both invariants vanishing outside the range.
- R03 (§4.3 double cover): repaired. Lines 614–615: "a circle that the quotient here double covers".
- The previous round's small corrections C01–C04 and notes N01–N02 are not acted on at this head; they are C06, C03, C04, C05, N02 and N03 above. C01, C02 and N01 above are new.

## Verified sound

| Target | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.4 curvature normalization | O(−1) on ℂP¹; ℂP², l = 3h | `∫iF/(2π) = −1`; F = iβ, `∫β∧β = 4π²l²`, `‖F‖² = 2‖F⁺‖² − 36π²`; `∫F∧F = −36π²` | holds; no locator | C06 |
| §2.3 quadratic two-form | vacuum u₀; ψ = (α, β) | `Cτ(ψψ*)/4 = tf(ψψ*) = Q₀`; `|Q₀|²_HS = |ψ|⁴/2 = 4|q|²`; q(u₀) = iω/4, norm² 1/8; H^s algebra for s ≥ 3 > 2 | holds | none |
| §3.1 Dirac operator and symbols | ξ ≠ 0; u = e^(iθ) | `c(ξ)(−c(ξ)/|ξ|²) = +1`; `D_(Aᵘ)(uψ) = c(du)ψ + uDψ − c(u⁻¹du)uψ = uDψ` | holds; three bullets are SpinGeometry §6.1's | C03 |
| §3.3 index | K3 l = 0; ℂP² l = 3h, h | (0+16)/8 = 2; (9−1)/8 = 1; (1−1)/8 = 0; variant (l²+σ)/8: −2 and 10/8 | holds; Witten1994 lines 158–160 with c₁(L_W) = l/2 | none |
| §3.3a universal comparison | torus a₊, a₋, z | `4 sinh(x₁/2) sinh(x₂/2) = 2(cosh a₊ − cosh a₋)`; det character e^(2z); degree four l²/8 − p₁/24 | holds; zero-divisor step is IndexTheory §6.3's | C04 |
| §3.4 abelian deformation operator | S⁴; T⁴; general | −1 = 0−1−0; 0 = 4−1−3; χ+σ = 2−2b₁+2b₂⁺ so −(χ+σ)/2 = b₁−1−b₂⁺; library kernel lemma needs compact boundaryless (AbelianDeformation.lean 113, 135) | holds | none |
| §3.5 linearization, dimension | ξ = it; K3; ℂP² l = h | `d₁d₀ξ = (0, ξD⁺ψ)`; `Re⟨itψ, φ⟩ = t Im⟨ψ, φ⟩`; d = 0; d = (1−6−3)/4 = −2 | holds; Witten1994 line 161 | none |
| §4.4 local slices | ψ = 0; \|ψ\| ≡ ε | `d₀*d₀ξ = 4Δξ + \|ψ\|²ξ`; kernel constants at ψ = 0; lowest eigenvalue ε²; operator H^(s+1) → H^(s−1), inverse the other way | holds; arrow of the inverse reversed | C01 |
| §5.3 bootstrap | n = 4, p = 6 | 3 − 2 = 1 > 1 − 4/q all finite q; H³ ⊂ W^(2,q) iff q ≤ 4; W^(2,6) ⊂ C^(1,1/3); H³ an algebra | holds; no locator | C06 |
| §5.4 compactness | η_n → η in H^s | uniform H^(s+1) bound, Rellich to H^s; OkonekTeleman1996 line 145 states properness of both projections | holds | none |
| §6.2 walls and chambers | ℂP², l = 3h; η = −irω_g | `⟨−2πiλ, iω⟩ = −2π l·[ω]`; w = −6π < 0; ∂w/∂r = 1; C₊ = {(l−b)·ω < 0} = C_(H₀,+) at OkonekTeleman1996 line 275 with β = iη/(2π) | holds | none |
| §6.3 Sard–Smale | n = ∞; d < 0 | library hypothesis `finrank ker² + 1 ≤ n` (SardSmale.lean 411) automatic at ∞; no surjective Fredholm map of negative index | holds; OkonekTeleman1996 line 231 | none |
| §9.2 stabilized index | D_t onto; one jump | W = 0 gives [ker D], rank δ; ker(D, W) constant rank δ + rank W | holds; no locator | C06 |
| §9.4 adapters | b = 4; E × ℙ¹ | graded `Ω² = −2Σ_(i<j) ν_iν_j ⊗ α_iα_j`, so c₁(I) = −u; Picard bundle of degree m₀ on E has c₁ = −θ, n copies give −nθ = −u; u²/2 Pfaffian | holds; source has +u_c | C05 |
| §10.2 Gysin recurrence | W = 0; general W | relation Σc_i(K)ζ^(k−i) = 0 gives π_!(ζ^(k−1+j)) = s_j(K); index w−j+m−k+1+j = m−δ+1; OkonekTeleman1996 line 506 is the Segre recursion | holds | none |
| §10.4 normalization tests | E × ℙ¹ (m₀, n); b = 0 | κ = −2y, l = 2m₀x + 2ny, l² = 8m₀n, δ = m₀n, d = 2m₀n = e² − κe; ⟨lα₁α₂⟩ = 2n; jumps 1 (r = 2, k = 0) and n (r = 0, k = 1); b = 0 jump ±1 | holds; OkonekTeleman1996 lines 291–292 | none |
| §11.1 canonical lift | Fock model p = 0, 1, 2 | c₂(ω) = i(2p − 2): −2i, 0, 2i; C(iω) = 2, −2 on Λ^(0,0), Λ^(0,2); Witten1994 lines 550–556 split S⁺ ⊗ L | holds; FourManifolds §4.1 has no U(2) lift | C02 |
| §11.3 symplectic interface | — | no formula asserted; (κ²+χ)/12 = (χ+σ)/4 and d = e² − κe of §11.2 recomputed; ℂP² twist: d = 4 both ways | holds; no locator | C06 |
| Headline: compactness | maximum of f = \|ψ\|² | `0 ≥ Scal f/4 + f²/4 − √2\|η\|f/2` gives f ≤ 2√2\|η\| − Scal; ‖C(iω)‖ = 2 = √2·√2 | holds | none |
| Headline: structure | K3; ℂP² | d = 2δ + b₁ − 1 − b₂⁺ = (l² − 2χ − 3σ)/4: 0, 0, −2, 4 (l = 5h) | holds | none |
| Headline: invariance | b₂⁺ = 2; repeated loop | wall codimension b₂⁺ > 1 missed by paths; ∂W = M₁ − M₀ parameter first; 2⟨ν(γ)²μ^m⟩ = 0 in ℤ | holds | none |
| Headline: wall crossing | ℂP², l = (2j+1)h; E × ℙ¹ | δ = j(j+1)/2, d = j² + j − 2; m − δ + 1 = (b − r)/2 = k; s(I) = 1/c(I) = exp(u) | holds | none |
| Docstring range | b₂⁺ = 1 | d = b + 2δ − 2 ≡ b mod 2, so r ≡ d ≡ b is r ≡ b | holds | none |

- Source locators checked against the text: 32 (OkonekTeleman1996 22, Witten1994 6, BBMW2002 4); every one says what it is cited for. The Taubes citations carry no locator and the text is unreadable.
- Library: every backticked name in the README resolves at the pins (one is the namespace `TauCeti.SeibergWitten`). Opened: SardSmale.lean 409–413; AbelianDeformation.lean 93, 113, 135; ChargeConjugation.lean 77 (`quadraticEnd_map`, for a conjugate-linear isometry with j² = −1 in dimension two, as the Layer 2 example uses it); Mathlib DividedPowers/Basic.lean 77; LeviCivita.lean 37. No Spinᶜ structure or Dirac operator on a manifold exists at either pin, so no headline is statable.
- Cross-roadmap citations resolved on main: all 14 suppliers, each cited section opened by heading (FourManifolds §4.1; SmoothBundlesConnections B2.1–B6.3; ComplexKahlerGeometry 5.1, 5.4, 5.5, 5.7; PseudodifferentialOperators Layers 1, 4–7; SpinGeometry 6.1–6.3; IndexTheory Layers 2–7, 6.2–6.3, 7.2–7.3; HeegaardFloer 2.1, 2.2, 2.5, 3.4; CharacteristicClasses 1.1b, 1.5, 2.4–2.5, 3.1–3.3, 5.2–5.3, 6.1–6.5; DGFloer Layer 1 item 2, lines 470–620, with the cohomological Serre sequence at 553; TopologicalKTheory T1, T4, T5 and the T1.6a, T6.5 targets; OperatorKTheory 4.1–4.2; HilbertModules H5). The same ids exist at the open heads that revise SpinGeometry, FourManifolds and IndexTheory.
- Dependency check: `depcheck: 191 roadmaps, 2126 edges, 0 problem(s)`; no UPWARD or CYCLE line. The supplier set is the one on main.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no message. The file declares nothing, so there is no `#check @name` comparison and no one-tactic probe to run. Nothing outside the folder changed.
- Checks: 59 bullets in 38 sections, as the description says; all recomputed.
- Old numbering: DGFloer's open head cites "SW3.3a"; lines 68–69 of this README map SWk.n to §k.n and SW3.3a to §3.3a, so the citation can be followed.
- Wording: 10 passages compared with the sources at their locators (§§3.5, 5.1, 5.2, 6.1, 6.2, 7.1, 8.2, 10.1, 10.2, 11.1); no shared run longer than four words.

Overlap check: read SpinGeometry, IndexTheory, FourManifolds, TaubesGromov, SpectralManifolds, InstantonFloerTheory. Generic Dirac operators and their symbols: SpinGeometry §6.1 (C03). The Euler non-zero-divisor property for Spin(2ℓ) × U(k): IndexTheory §6.3 (C04). Spinᶜ(n) and lifts: FourManifolds §4.1, cited here; SpectralManifolds also consumes it and plans nothing in dimension four that this roadmap owns. SW = Gr: TaubesGromov, a consumer. InstantonFloerTheory: nothing shared.

Source independence: 10 passages compared with 3 sources, none shared beyond four words; largest share OkonekTeleman1996, 20 of the 27 located citations in the layers; contents compared with OkonekTeleman1996 §§1–5: independent (Layers 1–5 and 11 have no counterpart there, its Proposition 15 of §4.1 sits in Layer 10 here, and the order Layer 9 → 10 is forced by the *Needs:* lines of §§10.2–10.3). Taubes's text could not be read.

Research link: Layers 8–10 are the full Seiberg–Witten form and the universal wall-crossing formula of Okonek–Teleman (1996, Definition 6, Theorem 16), after Witten (1994); §5.1 is Booß-Bavnbek–Marcolli–Wang (2002, Theorem 2.7); TaubesGromov builds Taubes's SW = Gr on these invariants. Rests on the README and the three texts read.

## Not verifiable

- Taubes, *The Seiberg–Witten and Gromov invariants*, Math. Res. Lett. 2 (1995): the DOI landing page refuses access (HTTP 403) and no open copy was found, so its citations in §§1.3, 4.3, 7.2, 8.2, 11.1 and 11.2 were not checked against the text; the conventions they support were recomputed.

## Source issues

- **Error** in OkonekTeleman1996 at §4.1, the Chern character of the index of the Dirac family, p. 13: the source says c₁ of the index bundle is +u_c, squaring the mixed class without the graded sign; it should be −u_c, so its Chern class is exp(−u_c) and Proposition 14 has exp(+u_c); affects a stated result.
- **Misprint** in BBMW2002 at the proof of Theorem 2.7, p. 9: the source says the absorbed factor is 1 − 2CC₀/R, with C₀ the bound on the perturbation coefficient; it should be 1 − 2CC₀²/R, since the perturbation term enters squared; affects nothing.

## For the human reviewers

- none
