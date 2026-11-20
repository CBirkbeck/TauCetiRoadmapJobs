# Review of SeibergWittenTheory (pull request #2651 at e8d937f)

**Verdict:** accepted

**Summary.** Accepted, with no findings. This is an incremental re-review of the 106 lines changed since 83f8b33: the six small corrections of the previous review are all repaired, and every locator, supplier attribution and library name the repairs add was read at its source, on main or at the pin and says what it is cited for. One small correction (a list in the description that is four sections short) and three format notes carried from the previous review remain, none blocking. Nothing is left for a human to decide.

## C01 — The description's list of sections without a source locator omits §§1.1 and 2.1–2.3

The description says "The sections without a locator (§§3.1, 3.3a, 4.4, 4.5, 5.3, 9.2, 11.3) are this roadmap's own constructions, with their routes in full." At this head §§1.1, 2.1, 2.2 and 2.3 also cite no published source: they rest on the Tau Ceti declarations named in them. A reader who takes the list as complete would look for a locator there and find none.

The sentence would read: "The sections without a published locator are §§1.1 and 2.1–2.3, whose pointwise algebra is proved in Tau Ceti and cited by declaration, and §§3.1, 3.3a, 4.4, 4.5, 5.3, 9.2 and 11.3, which are this roadmap's own constructions, with their routes in full."

## N01 — §10.1 still writes `η′_s` for a derivative where §6.2 writes η′ for the real form of η

In the Check of §6.2 (line 843) "η = iη′" makes η′ a real two-form; in §10.1 (line 1262) "`η′_s = −iω_g`" is the s-derivative of η_s. `∂_s η_s = −iω_g` would remove the clash.

## N02 — §10.3 names "a positive chamber of Baldridge" (line 1338), a work the References do not list

Citing it, or dropping the clause, would do.

## N03 — §1.3 uses the Levi-Civita connection (line 202) without naming Mathlib's `CovariantDerivative.leviCivitaConnection`

Its *Needs:* line would name it, as SpinGeometry §6.1 does.

## Previous findings

The previous report, of 83f8b33, had no findings; it listed three earlier ones as repaired or partly repaired and carried six small corrections and three format notes. Each at this head:

- R01 — repaired: §§1.2, 1.4, 4.1, 4.2, 8.1 and 9.3 now carry Okonek–Teleman locators, each read at its page; the title-only citations of Taubes are gone; the description says which sections have none (C01).
- R02 — repaired: `Suggested.lean` lines 21–23, "`d ≥ 0`, `0 ≤ r ≤ min(b₁, d)` and `r ≡ d ≡ b₁ mod 2`".
- R03 — repaired: §4.3, "a circle that the quotient here double covers".
- Previous C01 — repaired: §4.4, "its elliptic inverse `H^(s−1) → H^(s+1)`".
- Previous C02 — repaired: §11.1, "the homomorphism U(2) → Spinᶜ(4), constructed here"; *Needs:* "FourManifolds §4.1 (Spinᶜ lifts and their determinant lines)".
- Previous C03 — repaired: §3.1, "By SpinGeometry §6.1 applied to (W, c, ∇_A)" on the Leibniz, adjoint and symbol bullets; §3.3 cites "the symbol triple of SpinGeometry §6.1".
- Previous C04 — repaired: §3.3a, "not a zero divisor in the rational cohomology of B(Spin(4) × U(1)) by IndexTheory §6.3".
- Previous C05 — repaired: §9.4, "a divided-power structure, in the sense of Mathlib's `DividedPowers`"; the description now says "a divided-power structure on the cohomology of a torus".
- Previous C06 — repaired: as R01.
- Previous N01, N02, N03 — not repaired: unchanged at lines 1262, 1338 and 202; they are N01–N03 above.

No repair introduced a new problem.

## Verified sound

| Target | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.2 spinor bundles, locator | OkonekTeleman1996 lines 75–76 (p. 3) | source: both spinor bundles have determinant the det-associated line; README: `det W⁺ ≃ L ≃ det W⁻` | agrees | none |
| §1.3 gauge action, locator | f = u⁻¹ in OkonekTeleman1996 line 118 (p. 4) | f⁻¹Ψ = uΨ; action of f² on the determinant connection: A + 2f⁻¹df = A − 2u⁻¹du = Aᵘ of Convention 4 | agrees | none |
| §1.4 curvature normalization, locator | OkonekTeleman1996 lines 185–186 (p. 5); b = 0 | F_A represents −2πi c, so [iF_A/(2π)] = c; ∫F∧F = (−2πi)² l² = −4π² l² | agrees | none |
| §3.1 Dirac operator (sampled) | SpinGeometry §6.1 on main, lines 2340–2383 | Leibniz `D(fs) = c(df)s + fDs`; D⁺, D⁻ formal adjoints; phase homotopy `e^(iπt/2)c(ξ)`: t = 0 gives c(ξ), t = 1 gives i c(ξ) | agrees; attribution correct | none |
| §3.3a Euler class | IndexTheory §6.3 on main, lines 1304–1307; ℓ = 2, k = 1 | Spin(4) × U(1) is in the verified list; root product x₁x₂ = a₊² − a₋² ≠ 0 in ℚ[a₊, a₋, z], a domain | agrees | none |
| §4.1 Sobolev orders, locator | OkonekTeleman1996 lines 129–130 (p. 4) | source: connections and spinors order q, gauge group q + 1; README: s and s + 1 | agrees | none |
| §4.2 component group (sampled) | OkonekTeleman1996 lines 213–214 (p. 6) | source: gauge group mod constants = (functions mod constants) × H¹(X; ℤ); π₀ = H¹(X; ℤ), smooth case as the README says | agrees | none |
| §4.3 Picard lattice, locator | OkonekTeleman1996 line 343 (p. 10); S¹ × S³ | periods of 2u⁻¹du: 2·2πiℤ = 4πiℤ; dividing by 2πi gives 2H¹(X; ℤ), the source's T′ | agrees | none |
| §4.4 elliptic inverse | ψ = 0 on mean-zero; \|ψ\| ≡ ε | order-two operator H^(s+1) → H^(s−1); inverse gains two: H^(s−1) → H^(s+1); lowest eigenvalue ε² > 0 | holds | none |
| §§7.2, 8.2 point insertion (sampled) | OkonekTeleman1996 lines 226–229, 243 (p. 7) | Remark: circle bundle of the based group has Chern class u; Definition 6 pairs ν(l₁)…ν(l_r)·u^((w−r)/2), r ≡ w mod 2; README m = (d − r)/2 | agrees | none |
| §8.1 bordisms along paths, locator | OkonekTeleman1996 lines 149–159 (pp. 4–5) | iv): path of perturbations in one class gives a bordism; v): path of good pairs gives a bordism | agrees | none |
| §9.3 cohomological form, locator | OkonekTeleman1996 lines 431–446 (p. 13) | source: ch(index) = exp(c/2 + Σν′⊗l)(1 − p₁/24)/[X]; degree zero (c² − σ)/8 = δ | agrees | none |
| §9.4 divided powers | u = ν₁ν₂ + ν₃ν₄; Mathlib `DividedPowers` (Basic.lean line 77) | u² = 2ν₁ν₂ν₃ν₄, so γ₂(u) = ν₁ν₂ν₃ν₄; even-degree ring commutative; n!·γ_n(x) = xⁿ forces uniqueness without torsion | holds | none |
| §11.1 canonical lift (sampled) | OkonekTeleman1996 lines 767–769 (p. 22); U(1) ⊂ U(2) scalars | source: determinant K⁻¹, Σ⁺ = Λ⁰⁰ ⊕ Λ⁰², Σ⁻ = Λ⁰¹; det of W⁺ = 1 ⊕ K⁻¹ is K⁻¹ = det of T^(1,0) | agrees | none |
| §11.2 twists, locator | OkonekTeleman1996 lines 770–773 (p. 22); ℂP², e = h | source: 2c₁(M) − c₁(K) = c, bundles Σ± ⊗ M; d = ((2e − κ)² − κ²)/4 = e² − κe; ℂP²: 1 + 3 = 4 | agrees | none |

The rows of the previous review, of 83f8b33, stand for every statement the change does not touch; the sampled sections §§2.3, 3.4, 3.5, 6.2, 6.3, 7.1, 9.1, 9.2, 10.1 and 11.3 are unchanged since that head.

- Source locators checked against the text this round: 12, all in OkonekTeleman1996 (pp. 3, 4, 5, 6, 7, 10, 13, 22); each says what it is cited for.
- Library declarations opened at the pin: Mathlib `DividedPowers` (`Mathlib/RingTheory/DividedPowers/Basic.lean` line 77); the seven `quadraticEnd` declarations the description names (`TauCeti/Analysis/PDE/SeibergWitten/QuadraticEnd.lean`), `TauCeti.isMeagre_image_criticalPoints_of_isFredholm`, `cupInsertionForm`, `realCliffordSpinEvenSmoothHom`, `spinGroupEquivNeg`: all present.
- Cross-roadmap citations resolved on main: SpinGeometry §6.1 (lines 2322–2383), IndexTheory §6.3 (lines 1296–1307), FourManifolds §4.1 (line 1861). No open pull request drops an id this README cites.
- Old numbering: DGFloer's open head cites "SW3.3a"; lines 68–69 of this README map SWk.n to §k.n and SW3.3a to §3.3a, so the citation can be followed.
- Dependency check: `depcheck: 185 roadmaps, 2069 edges, 0 problem(s)`; no UPWARD or CYCLE line. The change adds or drops no supplier.
- Automatic checks: all pass at this head. Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no message; the file is unchanged and declares nothing, so there is no `#check @name` comparison and no one-tactic probe to run. Nothing outside the folder changed.
- Description against the head: 59 Checks in 38 sections, 14 supplier roadmaps, the seven removed Lean declarations, the unchanged numbering with its map, and the nine statements listed as changed all agree with the head; the one sentence that does not is C01.

Overlap check: read SpinGeometry, IndexTheory, FourManifolds, TaubesGromov, SpectralManifolds, InstantonFloerTheory (as the previous review; the change touches only the first three). Generic Dirac operators, their adjoints and symbols: SpinGeometry §6.1, now cited as owner in §§3.1 and 3.3. The Euler non-zero-divisor property for Spin(2ℓ) × U(k): IndexTheory §6.3, now cited in §3.3a. Spinᶜ(n) and its lifts: FourManifolds §4.1; the homomorphism U(2) → Spinᶜ(4) is owned here (§11.1), and FourManifolds does not state it. Nothing else shared.

Source independence: changed passages only; 12 passages compared with 1 source (OkonekTeleman1996), none shared beyond three words; largest share OkonekTeleman1996, as in the previous review with twelve locators added; the change adds, removes and reorders no layer, so the contents were not compared again (previous result: independent).

Research link: Layers 8–10 are the full Seiberg–Witten form and the universal wall-crossing formula of Okonek–Teleman (1996, Definition 6, Theorem 16), after Witten (1994); §5.1 is Booß-Bavnbek–Marcolli–Wang (2002, Theorem 2.7); TaubesGromov builds Taubes's SW = Gr on these invariants. Rests on the README and the three texts read.

## Not verifiable

- none at this head: the citations of Taubes's article, which could not be read, are removed.

## Source issues

- **Error** in OkonekTeleman1996 at §4.1, the Chern character of the index of the Dirac family, p. 13: the source says c₁ of the index bundle is +u_c, squaring the mixed class without the graded sign; it should be −u_c, so its Chern class is exp(−u_c) and Proposition 14 has exp(+u_c); affects a stated result.

## For the human reviewers

- none
