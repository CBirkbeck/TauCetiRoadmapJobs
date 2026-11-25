# Review of SpecialFunctionsLame (pull request #3081 at 81ab41b)

**Verdict:** needs changes

**Summary.** Changes are needed for one finding (P2): the roadmap plans Weierstrass's `σ` as a target of its own in 5.1, but ModularCurvesPartII §1.4a on main already owns the sigma function of a `PeriodPair`, so it must be cited there instead. The three findings of the previous review are repaired, and every statement and numerical Check I recomputed holds. There are two small corrections and no format notes. Four of the six cited books could not be read, which is left to the human reviewers.

## R01 (P2) — Weierstrass's `σ` is planned here as an owned target, but ModularCurvesPartII §1.4a on main already owns it

Two roadmaps would each build the sigma function of a `PeriodPair`, and an implementer of 5.1 would construct it a second time. In 5.1 (line 713) the text says "`σ` itself is a target here, as the entire function with `σ′/σ = ζ` and `σ(u)/u → 1`", and Scope and ownership (lines 993–999) lists it among the "Auxiliary results owned here, which … neither Mathlib, Tau Ceti nor a consumed roadmap provides"; the module docstring of `Suggested.lean` (line 27) repeats "Weierstrass's `σ`, a target of the README".

On main, `TauCetiRoadmap/ModularCurvesPartII/README.md`, §1.4a "Sigma, quasi-periods and the oriented Legendre relation" (line 227) constructs, for a native `PeriodPair`, the function it calls `latticeSigma` by the canonical product, and proves normal convergence, that it is entire and odd, `σ′(0) = 1`, simple zeros exactly on the lattice, and that minus the derivative of its logarithmic derivative is the native `℘`. That is the same object with the same normalization (`σ′(0) = 1` is `σ(u)/u → 1`). ModularCurvesPartII is on main, so it is a permitted supplier, earlier in the order.

The smallest change: in 5.1 replace the sentence on `σ` by a citation of ModularCurvesPartII §1.4a, and keep here only what that section does not state and the Hermite–Halphen form uses, namely `σ′/σ = PeriodPair.weierstrassZeta` off the lattice (both sides are odd with derivative `−℘`). Add ModularCurvesPartII §1.4a to the `*Needs:*` line of 5.1 and to the dependencies of Layer 5; move the `σ` bullet from "Auxiliary results owned here" to "What it does not own"; add a `### From ModularCurvesPartII` entry to the supplier contracts; and reword the docstring clause to say that the Hermite–Halphen form needs the sigma function of ModularCurvesPartII, which is not at the pins. The description's list of suppliers on main then gains ModularCurvesPartII (§1.4a).

## C01 — In 6.2 the letter `p` of the one-dimensional orthogonality relations is not defined, and under the reading as an index the second relation is false

6.2 (lines 896–899) says that two Lamé functions of the same class "with `p = p′` and `n ≠ n′`" are orthogonal on `[h₃, h₂]` with the weight `μ²`. Elsewhere in the README `p` is an index (3.2, 4.3), and only 1.2 uses it for Dassios's separation constant (`B = (h₃² + h₂²)p`). The relation is true when `p` is that constant (same `B`, different `n(n + 1)`: the Lagrange identity leaves the `x²` term). Read as the index it fails: at `k² = ½`, class `K`, the first functions of degree `0` and `2` (`E = 1` and `E = 1 − (h/2)ξ`, `h = 3 − √3`, `ξ = dn(t, k′)⁻²` on the segment) give `∫₀^{K′} ξ E₀E₂ dt = 0.05982` and the unweighted integral `0.14153`; only the combination `h · 0.14153 − 6k² · 0.05982 = 0` vanishes. For the same degree the unweighted integral of the two type-`u` functions of degree 2 is `1 · 10⁻¹⁴`, as the first relation says.

It would be enough to write "with the same separation constant `p` (that of 1.2, `B = (h₃² + h₂²)p`)" in both relations.

## C02 — The type-`u` double orthogonality of 6.2 is the case `γ = δ = ε = ½` of SpecialFunctionsHeun 6.2, which 6.2 does not cite

SpecialFunctionsHeun 6.2 states, for `a > 1` and `γ, δ, ε > 0`, that `∫₀¹∫₁^a (t − s)ρ(s)ρ(t) w₁(s)w₁(t)w₂(s)w₂(t) dt ds = 0` for Heun polynomials with `(n₁, q₁) ≠ (n₂, q₂)`, `ρ(x) = x^{γ−1}|1 − x|^{δ−1}|a − x|^{ε−1}`. With `a = k⁻²`, `γ = δ = ε = ½`, `s = sn²(σ, k)` and `t = dn(τ, k′)⁻²` one gets `ρ(s) ds = 2k dσ` and `ρ(t) dt = 2k dτ` (from `√(t(t − 1)(a − t)) = k′² sn cn/(k dn³)` at modulus `k′`), so Heun's integral is `4k²` times the integral of `lame_double_orthogonal`, and `q = −ah/4` turns its hypothesis into `(n, h) ≠ (n′, h′)`. The statement in elliptic variables is worth keeping; the reader should be told that it is this special case, in one clause in 6.2 and with SpecialFunctionsHeun 6.2 on the `*Needs:*` line, so that the general statement has one owner and the route through Green's identity is seen to be an alternative.

## Questions for the author

- 5.3 and 5.4 now cite Gesztesy–Holden, p. 115, for Ince's statement that the Lamé potential is finite-band exactly for integer order. I could not read the book: is the page 115 in the 2003 printing, and does it state the non-integer case as the README records it ("infinitely many of the gaps are open")?
- 6.2 cites Dassios, Theorem 4.2, (4.94)–(4.95), p. 83. Is the `p` of (4.95) there the separation constant, as C01 assumes? The book is not available to me.

## Previous findings

- R01 of the previous review (ratio limit false at `ν = −2n − 1`): repaired. 3.2 now reads "for `ν ≥ −½` unless `ν = 2n` with `m ≤ n`", the Lean clause begins `-1 / 2 ≤ ν →`, and the case `ν = −1`, `m = 0` is a negative-control Check. I rechecked the remaining cases: for `ν ≥ −½`, `γ_q = 0` with `q ≥ 1` only at `ν = 2q − 2`; at `ν = 2n`, `m > n` the tail cannot vanish; at odd `ν = 2p + 1` only `α_p = 0`, which does not affect the tail.
- R02 (zero count in the duality sketch): repaired. The sketch now counts `r = ⌊m/2⌋` (resp. `⌊(m − 1)/2⌋`) zeros in `(0, K)` and `deg P − r` on the segment, and exchanges `sn ↔ dn`. I rederived the three formulas `sn(z, k) = dn(z′, k′)/k`, `cn(z, k) = −ik′ cn(z′, k′)/k`, `dn(z, k) = k′ sn(z′, k′)` from the quarter-period table and the imaginary transformation, and the index map for all eight types.
- R03 (continued fraction routed through a section that does not apply): repaired. 3.2 cites AsymptoticExpansions §12.1 in its tail form and SpecialFunctionsEiLiErfIncompleteGamma §4.1 directly; both sections on main say what the contracts state.
- C01–C03, N01, N02 and the question on `Θ`: all addressed (pp. 554–555; the `φ`-form citation dropped; docstring names the unstated headlines; description lists the two suppliers; the five names are in the README; "open" and "sympy" removed; `4ℭ²` with `Λ₁Λ₂′ − Λ₂Λ₁′ = 2ℭ`, which Whittaker–Watson p. 571 has).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Hill normalization, `lameHillPotential_spec` | chain rule, `k = 0` | `w̃″ = (2K/π)² w″`; `Q = 0`, `K = π/2` at `k = 0` | holds | none |
| 1.2 `lame_dassios_form` | `x = h₃ sn`, `k = h₃/h₂` | `(x′)² = (h₃² − x²)(h₂² − x²)/h₂²`; `h = B/h₂²`; `sn ∈ (−1, 1)` on `(−K, K)` | holds | none |
| 1.3 Weierstrass form | `ν = 1`; negative control `k² = 0.3` | `h = k², 1, 1 + k² ↦ e₁, e₂, e₃`; `B = +g` gives `1.4333, 0.7333, 0.4333` | holds | none |
| 1.3 bridge | supplier 7.1 and 2.1 | `k sn(z) = ns(z − iK′)`; `Λ″ = (ν(ν+1)℘ + (2K)²(ν(ν+1)(1+k²)/3 − h))Λ` | holds | none |
| 2.1 `lameA`, `lameB` at `k = 0` | `w_I = cos √h x`, `w_II = sin √h x/√h` | root sets `{4m²}`, `{(2m+1)²}`, `{(2m+1)²}`, `{(2m+2)²}` | `j²` | none |
| 2.2 `lame_interlacing` | all eight comparisons by boundary conditions | N–N `j` < D–N `j` < N–N `j+1`; N–D `j` < D–D `j` < N–D `j+1` etc. | holds, all real `ν` | none |
| 2.2 example | `ν = 2`, `k² = ½` (own shooting) | `a⁴ = b⁴ = 13.1393197882` | agrees | none |
| 3.1 `lameEc_spec`, `lameEs_spec` | `k = 0` model; DLMF 29.3.18 | `Ec⁰ = 2^{−1/2}`: `½ · π/2 = π/4`; `Es′(K) = −m < 0` | holds | none |
| 3.2 recurrence, `lameEc_even_fourier` | `ν = 1.5`, `k² = ½`, `m = 0`, backward recursion from `p = 80` | `a⁰ = 0.8701032362`, `β₀ − H = 0.1347935276`, first row residual `2 · 10⁻¹⁴` | holds | none |
| 3.2 ratio limit | same; `ν = −1`; odd `ν` | ratio at `p = 12`: `0.15127`; limit `0.1715729`; `ν = −1` excluded by `ν ≥ −½` | holds | none |
| 3.3 `tendsto_lame_modulus_one` | `ν ∈ [−½, 0)`, `ν = m` | `μ = 0`, limit `ν(ν + 1)` (bottom of continuum); parity of `m` matches condition at `0` | holds | none |
| 4.1 `lamePolynomial_eigenvalues` | `n = 0`; `n = 2, 3` at `k² = ½` against duality | `n = 0`: `{0}`; sums `a⁰+a³ = a¹+a² = b¹+b³ = 12`, `2b² = 12` | holds | none |
| 4.1 type table | boundary values of each type at `0`, `K` | `sd`: `w(0) = 0`, `w′(K) = 0` ⇒ `a^{2m+1}`; `cd` ⇒ `b^{2m+1}`; `scd` ⇒ `b^{2m+2}` | agrees with DLMF Table 29.12.1 | none |
| 4.2 `lameUMatrix_charpoly_roots` | `ν = 2`, `k² = ½`; `n = 0`; `ν = 4` | `M = [[0, 2], [3/2, 6]]`, roots `3 ∓ 2√3`; `[0]`, root `0`; `a⁰ + a⁴ = 20` | holds | none |
| 4.3 `lamePolynomial_zeros` | `n = 4`, type `u`, `k² = 0.3` (own recurrence) | `h = 2.05788, 7.27891, 16.66321`; zeros `{1.43035, 3.03206}`, `{0.30335, 2.91596}`, `{0.13989, 0.84506}` | agrees | none |
| 4.3 Stieltjes 29.12.13 | same zeros; charges without `¼` | residuals `≤ 7 · 10⁻¹⁵`; without `¼`: `0.6243`, `0.3828` | holds | none |
| 4.4 `lame_eigenvalue_duality` | index map for all eight types; `n = 1` | `u: a^{2j} ↦ a^{n−2j}`; `sc ↦ cd: b^{2j+2} ↦ b^{n−2j−1}`; `k² + 1 + k′² = 2` | holds | none |
| 5.1 `lame_hermite` | `n = 0`, `n = 1` by hand | `n = 0`: `F = 1`, `R = 4B`, `(−1)!! = 0!! = 1`; `n = 1`: `F = ℘ − B`, `R = 4B³ − g₂B − g₃` | holds | none |
| 5.1 uniqueness, criterion | exponents `−2n, 1, 2n + 2` of the product equation | a polynomial solution has degree `n`; `Λ = √X` solves iff invariant `= 0` | holds | none |
| 5.1 `σ` | ModularCurvesPartII §1.4a on main | `latticeSigma` for a `PeriodPair`, `σ′(0) = 1`, `(σ′/σ)′ = −℘` | already owned | R01 |
| 5.2 `lameHermiteInvariant_eq_zero_iff` | `n = 1`; `n = 2`, `k² = ½` | `h = k² ↦ B = e₁`, `dn² = e₁ − ℘` (scaled); roots `±√3, ±3/2, 0 = 3 − h` | holds | none |
| 5.3 `lame_coexistence` | `m = 2`, `k = 0.1, 0.05`, `ν = 1.5, 0.5, −0.3, 2.5, 3.5` | `(a² − b²)/(k⁴ ν(ν+1)(ν−1)(ν+2)) = 0.03141`, `0.03129` for every `ν` (→ `1/32`) | `c₂ > 0`, signs agree | none |
| 5.4 `lame_stability` | `n = 0`; `ν = 2`, `k² = ½`; `ν = 1.5` | `Δ = −0.53531, −5.09335, 1.45669, 2.01755, 0.34004, −2.00000, −1.98588`; `Δ(7.497) = −2.0000004` | agrees | none |
| 6.1 ellipsoidal harmonics | `n = 0, 1`; dimension count | `1`; `x₁, x₂, x₃`; `2n + 1 = dim` of harmonic polynomials of degree `n` | consistent | none |
| 6.2 `lame_double_orthogonal` | Heun 6.2 at `γ = δ = ε = ½` | `ρ(s)ds = 2k dσ`, `ρ(t)dt = 2k dτ`; Heun integral `= 4k²` × Lamé integral | holds; special case | C02 |
| 6.2 one-dimensional relations | class `K`, `n = 0, 2`, `k² = ½` | same `n`: `1 · 10⁻¹⁴`; `n ≠ n′`: `0.14153` unweighted, `0.05982` with `μ²` | true only for equal constant | C01 |
| 6.3 `lame_integral_equation` | `n = 1`; nonvanishing of `c` | `c = 4(K − E)/k`; `Σ e_j ∫ sn^j E = ∫E² > 0` gives some `∫ sn^j E ≠ 0`; `shiftedLegendre n ((1 − y)/2) = P_n(y)` | holds | none |

- Source locators checked against the text: DLMF §§29.1, 29.2, 29.3, 29.5, 29.6(i), 29.8, 29.9, 29.10, 29.12, 29.14, 29.17(i) (about 55 equation and table numbers, all correct); Whittaker–Watson §23.7, pp. 570–572 (product equation, recurrence in powers of `℘ − e₂`, case (I), the constant `ℭ`, the `σ`-form) and the page positions of §§23.41, 23.47, 23.5, 23.6.
- Library declarations opened at the pin: `Polynomial.shiftedLegendre` (Mathlib `RingTheory/Polynomial/ShiftedLegendre.lean`, line 40), `PeriodPair.weierstrassZeta` (Tau Ceti `Analysis/SpecialFunctions/Elliptic/WeierstrassZeta.lean`, line 71); the 21 `#check` lines of `Suggested.lean` resolve. Neither library has a sigma function or any Lamé object.
- Cross-roadmap citations resolved at this round's heads: SpecialFunctionsMathieu Conventions, 1.1, 2.1, 2.5, 3.1, 3.3, 4.1, 7.1–7.2 (the eight copied definitions agree body for body); SpecialFunctionsHeun 2.4, 4.1–4.3, 6.2; SpecialFunctionsJacobiElliptic 2.1–2.3, 3.4, 3.5, 4.1, 7.1; SpecialFunctionsLegendre 1.1, 3.3, 4.3; AsymptoticExpansions §12.1; SpecialFunctionsEiLiErfIncompleteGamma §4.1; EllipticIntegrals 2.1, 3.1. All exist and say what they are cited for.
- Dependency check: `depcheck: 124 roadmaps, 1403 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (22). The elaborated types of the 53 declarations were compared with the README; no binder is lost.
- One-tactic probe (`rfl`, `simp`, `decide`, `infer_instance`) on a scratch copy: none of the 22 sorried theorems closes; the two proved declarations are marked as sanity checks.
- Headlines: the 22 statable ones are stated; the docstring names those that are not (eigenfunction limits of 3.3, integral equations of 3.4, Hermite–Halphen form, ellipsoidal harmonics) with the missing carrier.

Overlap check: read SpecialFunctionsHeun, SpecialFunctionsMathieu, SpecialFunctionsJacobiElliptic, SpecialFunctionsLegendre, SpecialFunctionsHypergeometric (open) and EllipticIntegrals, SpecialFunctionsBessel, SpecialFunctionsConfluent (main); Lamé's equation as a case of Heun's: owner SpecialFunctionsHeun 2.4, cited; double orthogonality of Heun polynomials: owner SpecialFunctionsHeun 6.2, the Lamé case kept here without citation (C02); Hill's definitions: owner SpecialFunctionsMathieu, copied as marked local copies; Weierstrass's `σ`: owner ModularCurvesPartII §1.4a on main, claimed here (R01); Lamé functions, polynomials and ellipsoidal harmonics: owned here only (Heun's and JacobiElliptic's scopes hand them over by name).

Source independence: 17 passages compared with 2 sources (DLMF Chapter 29, Whittaker–Watson Chapter XXIII), none shared beyond formulas and statements that can be written one way; largest share DLMF, 55 of 152 source mentions; contents compared with DLMF Chapter 29: independent (Layer 3 draws on §§29.3, 29.5, 29.6, 29.8 in another order; §29.3 is split over Layers 2, 3, 4.4 and 5.3; §29.9 sits in Layer 5, built on Whittaker–Watson §23.7). Dassios, Gesztesy–Holden, Ronveaux and Kristensson could not be read.

Research link: Layer 5 states the finite-gap property of the Lamé potential `n(n + 1)℘`, the basic example of the algebro-geometric potentials of Gesztesy–Holden (2003); Layer 6 gives the harmonics Dassios (2012) uses for ellipsoidal boundary-value problems; 29.3.6 is Volkmer (2004). Rests on the README's references and DLMF §29.3.

## Not verifiable

- Dassios, *Ellipsoidal Harmonics* (Cambridge University Press, 2012): no legal copy; every locator into it (1.2, 4.1–4.4, 6.1, 6.2) is unchecked. The identity of 1.2 and the relations of 6.2 were checked by computation.
- Gesztesy–Holden, *Soliton Equations*, Vol. I (Cambridge University Press, 2003): no legal copy; (1.12)–(1.14), Example 1.32, (1.293)–(1.295) and p. 115 are unchecked.
- Ronveaux (ed.), *Heun's Differential Equations* (Oxford University Press, 1995) and Kristensson (Springer, 2010): no legal copy.
- The printed page numbers of the NIST Handbook (pp. 683–695): the online DLMF has no pages; equation and section numbers were checked.
- Whittaker–Watson was read in the 3rd edition (1920), as an OCR text; the README cites the 4th. The displayed Wronskian on p. 571 is lost in the OCR; the line after it gives `2ℭ/X` for the difference of the logarithmic derivatives, which is the same statement.
- Checks not recomputed this round: the Fourier-series values of `Ec⁰, Ec², Ec⁴` in 3.2, the norms `π`, `0.09022`, `17.50` of 6.2, the `1 − k² = 10⁻¹⁰` values of 3.3.

Automatic checks set aside as false positives: the report that `lameHermitePoly` chooses its datum (the polynomial is characterised by a universal property, monic of degree `n` solving the product equation, and the first two clauses of `lame_hermite` state its existence and uniqueness, exactly as for the copied `hillWI`); the report of a section header with no declaration under it (the header "Library declarations consumed" is followed by `#check` lines that pin library declarations, which the form rules allow).

## Source issues

- none

## For the human reviewers

- **Not tested.** Dassios (2012), Gesztesy–Holden (2003), Ronveaux (1995) and Kristensson (2010) are paywalled; wording and arrangement were compared only with DLMF Chapter 29 and Whittaker–Watson Chapter XXIII, which carry 87 of the 152 source mentions.
- **Licence.** The description says the open-source lean-DLMF project "informed the survey of DLMF Chapter 29 but is not a supplier". `Suggested.lean` was not compared with that repository.
