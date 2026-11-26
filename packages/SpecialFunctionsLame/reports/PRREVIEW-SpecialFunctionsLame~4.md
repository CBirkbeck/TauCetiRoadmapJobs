# Review of SpecialFunctionsLame (pull request #3081 at d5115dd)

**Verdict:** accepted

**Summary.** Accepted: no finding remains. The one finding of the previous review is repaired (Weierstrass's `σ` is now consumed from ModularCurvesPartII §1.4a, and only `σ′/σ = ζ` is kept here as an auxiliary result), and both small corrections are applied; the changed passages, the new Check of 6.2 and the reduction to SpecialFunctionsHeun 6.2 were recomputed and hold. There are no small corrections and no format notes. Four of the six cited books could not be read, which is left to the human reviewers.

## Previous findings

- R01 — repaired: 5.1 now reads "`σ` is the lattice sigma function of ModularCurvesPartII §1.4a"; the `*Needs:*` line, the Layer 5 dependencies, Scope and ownership, the supplier contracts and the module docstring all cite it; only `σ′/σ = ζ` is owned here.
- C01 — repaired: 6.2 now says "with separation constants `p`, `p′` (that of 1.2, `B = (h₃² + h₂²)p` …)" and adds a negative control for `p = p′`, whose values I recomputed.
- C02 — repaired: 6.2 states that the type-`u` relation "is the case `a = k⁻²`, `γ = δ = ε = ½` of the double orthogonality of Heun polynomials, SpecialFunctionsHeun 6.2", with that section on the `*Needs:*` line and in the contracts.
- Questions of the previous review — the `p` of 6.2 is answered in the text (the separation constant, "Dassios's `p_n^m` in (4.96)"); neither that locator nor Gesztesy–Holden p. 115 could be read (see Not verifiable).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 5.1 `σ′/σ = ζ` off the lattice (auxiliary result, new) | supplier §1.4a on main; Tau Ceti at the pin | §1.4a: `σ` odd, `−(σ′/σ)′ = ℘`; pin: `ζ′ = −℘`, `ζ(−z) = −ζ(z)`; difference `c` is constant and `c = −c` | holds | none |
| 5.1 citation of ModularCurvesPartII §1.4a | README on main, line 225 | canonical product, normal convergence, entire, odd, `σ′(0) = 1`, simple zeros exactly on `Λ`, minus derivative of `σ′/σ` is native `℘` | contract agrees | none |
| 6.2 `lame_double_orthogonal` as a case of Heun 6.2 | `k² = ½`; `P = 1`, `1 − (h/2)ξ`, `h = 3 ∓ √3` | `ρ(ξ)dξ = 2k ds`, `2k dt` by hand; mixed integrals `−4·10⁻¹⁷`, `−4·10⁻¹⁶`, `7·10⁻¹⁷`; norms `3.14159`, `0.090222`, `17.5027` | holds | none |
| 6.2 Heun parameters | `α = −n/2`, `β = (n + 1)/2` | `β_{n/2} = γ + δ + ε + n/2 − 1 = (n + 1)/2`; `q = −ah/4` injective in `h` | hypotheses match | none |
| 6.2 one-dimensional relations (reworded) | class `K`, `k² = ½`, `n = 0, 2` and two of degree 2 | same degree, `p ≠ p′`: `8·10⁻¹⁷`; `n ≠ n′`, `p ≠ p′`: unweighted `0.1415269`, weighted `0.0598163` | true as now stated | none |
| 6.2 new negative control | same | `h·0.1415269 − 6k²·0.0598163 = 6·10⁻¹⁷` (double precision); `p = 0` against `p ≠ 0` | Check true | none |
| SpecialFunctionsHeun 6.2 contract | README at its open head, line 972 | `a > 1`, `γ, δ, ε > 0`, `(n₁, q₁) ≠ (n₂, q₂)`, weight `(t − s)ρ(s)ρ(t)` on `(0, 1) × (1, a)` | contract agrees | none |

The rows for the untouched statements stand as in the previous review, of `81ab41b`.

- Library declarations opened at the pin: `PeriodPair.hasDerivAt_weierstrassZeta` (Tau Ceti `Analysis/SpecialFunctions/Elliptic/WeierstrassZeta.lean`, line 122: `HasDerivAt L.weierstrassZeta (-℘[L] z) z` for `z ∉ L.lattice`), `PeriodPair.weierstrassZeta_neg` (same file, line 151); both new `#check` lines resolve.
- Cross-roadmap citations resolved: ModularCurvesPartII §1.4a (main), SpecialFunctionsHeun 6.2 (open head), SpecialFunctionsLegendre (on main, as the summary now says).
- Source locators checked against the text: none new readable; the changed locators are into Dassios (below). Seeded sample: of its targets only 5.1 has a changed passage, checked above.
- Dependency check: `depcheck: 101 roadmaps, 1130 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (22). No statement changed, so the elaborated types and the one-tactic probe stand as before; the diff touches only the module docstring and two `#check` lines.
- Pull request text: the description names ModularCurvesPartII §1.4a, SpecialFunctionsHeun 6.2, the two new pinned lemmas and the counts 22 + 2 + 21 + 8 = 53 declarations; it agrees with the head.
- Headlines: unchanged; the docstring names the Hermite–Halphen form as not statable because the sigma function of ModularCurvesPartII §1.4a is not at the pins (neither library has a sigma function).

Overlap check: read SpecialFunctionsHeun, SpecialFunctionsMathieu, SpecialFunctionsJacobiElliptic (open) and SpecialFunctionsLegendre, EllipticIntegrals, ModularCurvesPartII (main); Weierstrass's `σ`: owner ModularCurvesPartII §1.4a, cited; double orthogonality of Heun polynomials: owner SpecialFunctionsHeun 6.2, cited, the Lamé case kept as its stated special case; `σ′/σ = ζ`: stated by no other roadmap, owned here; Lamé functions, polynomials and ellipsoidal harmonics: owned here only.

Source independence: changed passages only; 5 passages compared with 2 texts (ModularCurvesPartII §1.4a, SpecialFunctionsHeun 6.2, both roadmap texts cited as suppliers), none shared beyond formulas; largest share DLMF, as in the previous review; no layer added, removed or reordered, so the arrangement was not compared again. Dassios, Gesztesy–Holden, Ronveaux and Kristensson could not be read.

Research link: Layer 5 states the finite-gap property of the Lamé potential `n(n + 1)℘`, the basic example of the algebro-geometric potentials of Gesztesy–Holden (2003); Layer 6 gives the harmonics Dassios (2012) uses for ellipsoidal boundary-value problems; 29.3.6 is Volkmer (2004). Rests on the README's references and DLMF §29.3.

## Not verifiable

- Dassios, *Ellipsoidal Harmonics* (Cambridge University Press, 2012): no legal copy; the changed locators of 6.2 (Theorem 4.2, (4.93)–(4.95), p. 83, and `p_n^m` in (4.96)) are unchecked, as are the other locators into the book. The relations of 6.2 were checked by computation.
- Gesztesy–Holden (2003), Ronveaux (1995), Kristensson (2010): no legal copy, as in the previous review.
- The new Check of 6.2 says the Lagrange combination vanishes "below `10⁻³⁰`"; I computed it in double precision only (`6·10⁻¹⁷`). The identity is exact.

Automatic checks set aside as false positives: the report that `lameHermitePoly` chooses its datum (the polynomial is characterised as the monic solution of degree `n` of the product equation, and `lame_hermite` states its existence and uniqueness); the report of a section header with no declaration under it (the header "Library declarations consumed" is followed by `#check` lines pinning library declarations, which the form rules allow).

## Source issues

- none

## For the human reviewers

- **Not tested.** Dassios (2012), Gesztesy–Holden (2003), Ronveaux (1995) and Kristensson (2010) are paywalled; wording and arrangement were compared only with DLMF Chapter 29 and Whittaker–Watson Chapter XXIII (previous review), which carry 87 of the 152 source mentions.
- **Licence.** The description says the open-source lean-DLMF project "informed the survey of DLMF Chapter 29 but is not a supplier". `Suggested.lean` was not compared with that repository.
