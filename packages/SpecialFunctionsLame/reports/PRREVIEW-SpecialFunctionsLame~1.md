# Review of SpecialFunctionsLame (pull request #3081 at 956d531)

**Verdict:** needs changes

**Summary.** Changes are needed: three findings, all P2. The ratio limit of the Fourier coefficients in 3.2 (and in `lameEc_even_fourier`) is false at `ν = −2n − 1`, because DLMF's standing hypothesis `ν ≥ −½` was dropped there; the proof sketch of the duality in 4.4 gives a wrong count of zeros; and the continued fraction of 3.2 is routed through a section of SpecialFunctionsMathieu whose hypotheses the Lamé recurrence does not satisfy. There are three small corrections and two format notes, none blocking. Four of the six cited books could not be read, which is left to the human reviewers.

## R01 (P2) — The ratio limit `A_{2p+2}/A_{2p} → k²/(1 + k′)²` of 3.2 fails at `ν = −2n − 1`, `m ≤ n`: the hypothesis `ν ≥ −½` of DLMF 29.6.7 was dropped

An implementer cannot prove `lameEc_even_fourier` as stated, because it is false. The Conventions say that statements carry `ν ≥ −½` "only where the proof uses it", and 3.2 (lines 383–386) and the Lean statement (`Suggested.lean`, lines 285–287) exclude only "`ν = 2n` with `m ≤ n`". DLMF 29.6.7 has the condition "`ν ≠ 2n`, or `ν = 2n` and `m > n`" under the chapter's standing `ν ≥ −½` (§29.2(i)). Since the equation depends on `ν` only through `ν(ν + 1)`, the order `ν = −2n − 1` is the polynomial case `ν = 2n` again, and it is not excluded.

Take `ν = −1`, `m = 0`, any `0 < k < 1`. Then `ν(ν + 1) = 0`, `Q = 0`, `a⁰ = 0`, `Ec⁰ = 2^{−1/2}`, and the cosine series, which is unique, has `A₀ = √2` and `A_{2p} = 0` for `p ≥ 1`. The recurrence holds (`H = 0`, `β₀ = 0`, `A₂ = 0`; `γ₁ = ½ν(ν + 1)k² = 0`), as do the normalization `½A₀² = 1` and the sign. The hypothesis `∀ n : ℕ, ν = 2n → n < m` holds vacuously, but `A (p + 1) / A p` is `0/0 = 0` for `p ≥ 1` and tends to `0`, not to `k²/(1 + k′)² > 0`.

The smallest change: give the ratio clause the hypothesis `ν ≥ −½` (in the README sentence and as `-1 / 2 ≤ ν →` in the Lean clause), or exclude `ν = −2n − 1` with `m ≤ n` as well. The case `ν = −1`, `m = 0` would make a good negative-control Check.

## R02 (P2) — The proof sketch of the duality in 4.4 miscounts the zeros: a Lamé polynomial with eigenvalue `a^m_n` does not have `m` zeros in `(0, K)` and `n − m` on the segment from `K` to `K + iK′`

A reader who follows the sketch (lines 619–621: "the `m` zeros in `(0, K)` and the `n − m` on the segment from `K` to `K + iK′` exchange roles") gets the wrong index bookkeeping. With `m` and `n` as in the bullet just above it (the superscript and the order), the function of `a^m_n` has `⌊m/2⌋` zeros in `(0, K)` (Conventions; 3.1), and the count on the open segment is `deg P − ⌊m/2⌋` (4.3, line 581; DLMF §29.12(i), where `n` is the degree of `P`, not the order). For `n = 1`, `m = 0` the function is `dn`: it has no zero in `(0, K)` and none on the open segment (`dn(K + it, k) = k′ cn(t, k′)/dn(t, k′)`), not `n − m = 1`. The stated duality is right (I recomputed `a^m_n(k) + a^{n−m}_n(k′) = n(n + 1)` and the `b` sums for `n = 2, 3`, `k² = 0.3`: all `6` and `12` to `10⁻⁹`); `dn` goes to a multiple of `sn(z′, k′)`, type `s`, which is how `a⁰_1(k)` meets `a¹_1(k′)`.

The smallest change: say that the `⌊m/2⌋` (resp. `⌊(m − 1)/2⌋`) zeros in `(0, K)` and the `deg P −` that number on the open segment exchange roles, and that the type factors are exchanged by 29.10.2 (`sn ↔ dn`, `cn` fixed, up to constants), so that the superscript `m` goes to `n − m` (resp. `n − m + 1`).

## R03 (P2) — SpecialFunctionsMathieu 7.3 does not supply the continued fraction 29.3.10, and it does not consume AsymptoticExpansions §12.1

The route of 3.2 for the continued fraction has no supplier as written. Lines 395–400 say the ratio limit is "Perron's theorem … (AsymptoticExpansions §12.1, as consumed by SpecialFunctionsMathieu 7.3)" and that the continued fraction "follows from the recessive solution as in SpecialFunctionsMathieu 7.3"; the supplier contracts (line 1000) list "the continued fraction from the recessive solution (for 3.2)" under Mathieu 7.3. At the head of its pull request, Mathieu 7.3 states its auxiliary for a recurrence `x_{k+1} − β_k x_k + α_k x_{k−1} = 0` "with `|β_k| → ∞` and `α_k` bounded and nonzero", and takes minimal solutions and Pincherle's theorem from SpecialFunctionsEiLiErfIncompleteGamma §4.1; it does not cite AsymptoticExpansions §12.1 at all. The Lamé recurrence, normalized the same way, has `β_p = −(β_p − H)/α_p → 2(2 − k²)/k²` and `γ_p/α_p → 1` (from `α_p, γ_p ~ −2k²p²`, `β_p ~ 4(2 − k²)p²`, as the README computes), so `|β_k| → ∞` fails and that auxiliary does not apply.

Both inputs have owners on main, earlier in the order: AsymptoticExpansions §12.1 (distinct characteristic roots: the recessive solution, unique up to a factor, with its ratio) applies since the roots `(1 ± k′)²/k²` are distinct, and SpecialFunctionsEiLiErfIncompleteGamma §4.1 states Pincherle's theorem for a general three-term recurrence. The smallest change: in 3.2 cite these two sections directly, in the sketch and on the `*Needs:*` line; add a `### From` entry for each in the supplier contracts; and drop "7.3 … the continued fraction" from the Mathieu contract and from the dependencies of Layer 3.

## C01 — Two Whittaker–Watson locators point at text that is not there

3.2 cites "Whittaker–Watson §23.5, p. 564 (the `φ`-forms)". §23.5 (pp. 563–564) introduces the variables `α, β, γ`, the Jacobian form and the scheme of species in `sn, cn, dn`; neither it nor the rest of Chapter XXIII has the trigonometric form in `φ = π/2 − am` or a Fourier series. DLMF 29.2.4–29.2.5 and §29.6(i), already cited, carry the section; the W–W citation would be dropped or changed to what §23.5 does contain.

The Conventions, 1.3 and the docstring of `IsLameWeierstrassSolution` give the Weierstrass form as "§23.4, p. 555". In the copy I read (3rd edition, whose pagination of this chapter agrees with every other locator in the README) the Weierstrassian form and the relation between `B` and `C` are on p. 554; p. 555 has the second algebraic form and the Jacobian form with `A`. "pp. 554–555" would cover both.

## C02 — The module docstring of `Suggested.lean` does not say which headlines are left unstated and what each lacks

The docstring explains only the bridge of 1.3 (it needs the complex Jacobi functions). A reader cannot tell why the other headlines the Summary announces have no statement: the ellipsoidal harmonics of 6.1 (ellipsoidal coordinates are not at the pins), the Hermite–Halphen form of 5.1 (Weierstrass's `σ`), the integral equations of 3.4 and the eigenfunction limits of 3.3 (Ferrers functions, `ce_m`, `se_m`). One clause each in the docstring, naming the missing carrier, would do.

## C03 — The description's list of suppliers omits AsymptoticExpansions

"**Suppliers.** On main: EllipticIntegrals (§2.1, §3.1); Tau Ceti's …" leaves out AsymptoticExpansions §12.1, which the `*Needs:*` line of 3.2 names; the README's own supplier contracts omit it too. After R03 the list would read "On main: EllipticIntegrals (§2.1, §3.1); AsymptoticExpansions (§12.1); SpecialFunctionsEiLiErfIncompleteGamma (§4.1)", and the Mathieu entry would lose 7.3.

## N01 — Five declarations of `Suggested.lean` are not named in the README

`lameEcRaw`, `lameEsRaw`, `lameTypeDegree` and the two proved sanity checks `lamePotential_zero_modulus`, `lameTypeDegree_scd` appear in no README section, so the prose cannot be matched to them. A line in the Conventions table (or under 3.1 and 4.1) would name them.

## N02 — Words that date the text

"four open roadmaps" in the Summary, "(open)" in four supplier-contract headings, and "verified with sympy" / "(sympy, exact)" in the Checks of 1.2 and 5.1 describe the state of pull requests and how a value was obtained; the first two will be false once the suppliers merge.

## Questions for the author

- Conventions (Hermite's invariant) say that in Whittaker–Watson's notation, p. 572, the invariant is `4Θ²`. In the copy I read the constant of the Wronskian is a Gothic letter (probably `𝔆`), and `Θ` on pp. 573–575 is Jacobi's theta function. Is `Θ` Whittaker–Watson's letter here? The copy is an OCR text, which stopped me from deciding.
- 5.3 and 5.4 cite Gesztesy–Holden, p. 114, for Ince's theorem that `a^m_ν ≠ b^m_ν` for `ν ∉ ℤ`. Does that page state the theorem for all real non-integer `ν`, or only record the integer case as the finite-gap property? I could not read the book.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Hill normalization, `lameHillPotential_spec` | chain rule; `k² = ½` | `w̃″ = (2K/π)²w″`; `K = 1.8540746773`; `(2K/π)²·0.8701032362 = 1.21223` | holds | none |
| 1.1 periodicity | `k² = ½`, `x = 0.3` | `sn²(x+K) − sn²(x) = cd² − sn² = 0.9551 − 0.0861 = 0.8690` | holds | none |
| 1.2 algebraic form | Heun parameters | `αβ = −ν(ν+1)/4`, `q = −hk⁻²/4`, `α+β+1 = 3/2 = γ+δ+ε`; DLMF 29.2.2 read | holds | none |
| 1.2 `lame_dassios_form` | `x = h₃ sn`, `k = h₃/h₂` | `(x′)² = (h₃²−x²)(h₂²−x²)/h₂²`, `x″ = x(2x²−h₂²−h₃²)/h₂²`; `h = B/h₂²` | holds | none |
| 1.3 Weierstrass form | `ν = 1`, `k² = 0.3` | `B/(2K)² = 2(1+k²)/3 − h`: `h = 0.3, 1, 1.3 ↦ e₁, e₂, e₃`; `g = −B`; W–W `B + e₃n(n+1) = A(e₁−e₃)`, `A = −h` | holds | C01 (page) |
| 2.1 `lameA`, `lameB` | `k = 0`; `ν = 1.5, 2, 3, −0.3` at `k² = ½` (own RK4 shooting) | `k = 0`: `cos`, `sin` give `j²`; `ν = 1.5`: `0.8701032362, 1.2284497466, 2.1676493363, 3.9043425823, 3.9716716409, 7.4962153683, 7.4979119816` | agrees with README | none |
| 2.2 `lame_interlacing` | general even potential; `ν = 0` | NN_m < DN_m < NN_{m+1}, ND_m < DD_m < ND_{m+1} etc.; `ν = 0`: `(mπ/2K)²` | holds for all real `ν` | none |
| 2.2 `hillEigenvalue_lame` | parity of superscript | period `π` in `x` ⇔ `2K` in `z` ⇔ even superscript; `μ_{n+1}` indexing matches Mathieu's copy | holds | none |
| 3.1 `lameEc_spec`, `lameEs_spec` | symmetries composed; zero counts | `Ec(x+2K) = Ec(−x) = (−1)^j Ec(x)`; `Es(x+2K) = −Es(−x) = (−1)^j Es(x)`; zeros in `[0,2K)`: `2m, 2m+1, 2m+1, 2m+2` | holds | none |
| 3.1 normalization at `k = 0` | `Ec^m = cos m(π/2−z)` | `∫₀^{π/2} cos² = π/4`; `Ec⁰ = 2^{−1/2}`: `½·π/2 = π/4`; `Es′(K) = −m < 0` | holds | none |
| 3.2 recurrence | inserted `Σ c_p cos 2pφ` in 29.2.4 | `γ_q = ½(ν−2q+2)(ν+2q−1)k²`, `α_q = ½(ν−2q−1)(ν+2q+2)k²`, `α₀ = (ν−1)(ν+2)k²`, `γ₁ = ½ν(ν+1)k²`; Parseval gives `½A₀² + ΣA² = 1` | holds | none |
| 3.2 ratio limit | `ν = −1`, `m = 0` | `A₀ = √2`, `A_{2p} = 0`; ratio `0`, claimed `k²/(1+k′)² > 0` | false | R01 |
| 3.2 continued fraction route | normalized Lamé recurrence | `β → 2(2−k²)/k²` (bounded), Mathieu 7.3 needs `|β_k| → ∞` | supplier does not apply | R03 |
| 3.3 `lame_modulus_zero` | `Q = 0`, `K = π/2` (`legendreK_zero`) | four root sets `{4m²}`, `{(2m+1)²}`, `{(2m+1)²}`, `{(2m+2)²}` | holds | none |
| 3.3 `tendsto_lame_modulus_one` | `ν = 1.5, 2`, `1 − k² = 10⁻¹⁰`; `ν = −0.3` | `a⁰ = 1.4999999999`, `a¹ = 3.4999936`; `ν = 2`: `2.0000000`, `5.0000000`; `ν<0`: limit `ν(ν+1)` (bottom of continuum) | holds | none |
| 3.4 integral equations | all `z_i = 0`; `z₁=z₂=z₃=K` | `x = (1−k²)/k′² = 1`; `x = k² sn z + k′ dn z`; `y ∈ [k′, 1/k′]`; DLMF 29.8.1–29.8.6 read | holds | none |
| 4.1 `lamePolynomial_eigenvalues` | `n = 0, 1, 2, 3`; type parities | counts `n/2+1+3·n/2 = 2n+1`, `3(n+1)/2 + (n−1)/2 = 2n+1`; `n = 3`, `k² = ½`: `2.0505102572, 2.1270166538, 5.0505102572, 6, 6.9494897428, 9.8729833462, 9.9494897428` | agrees | none |
| 4.2 `lameUMatrix_charpoly_roots` | `ν = 2`, `k² = ½`; `n = 0` | `M = [[0,2],[3/2,6]]`, `H² − 6H − 3`, `a = (H+3)/2 = 3 ∓ √3`; `n = 0`: root `0 = H₀` | holds | none |
| 4.3 Stieltjes equations | derived from 29.2.2 | `P″/P′ = Σ 2/(ξ_p−ξ_q)`, charges `2ρ+½` halved to `ρ+¼` | holds | none |
| 4.4 duality | `n = 1` exact; `n = 2, 3`, `k² = 0.3` | `k² + 1 + k′² = 2`; sums `6.000000000` (5 of them), `12.000000000` (7) | statement holds; sketch miscounts | R02 |
| 4.4 imaginary transformation | `z = K + iK′ − iz′` | `k² sn²(z,k) = dn²(z′,k′)`, `h′ = ν(ν+1) − h` | holds | none |
| 5.1 `lame_hermite` | `n = 0…5` exact rational arithmetic (`g₂ = 7`, `g₃ = 3`); `n = 1, 2` by hand | degree `2n+1`; leading `4, 4, 4/81, 4/50625, 4/121550625, 4/797493650625 = 4/((2n−1)!!)⁴`; `n = 2`: `R = (B²−3g₂)(4B³−9g₂B+27g₃)/81` exactly | holds | none |
| 5.1 invariant | product of solutions | `d/du = −2X·(product equation)`; value `W(Λ₁,Λ₂)²`; `Λ = √X` solves when `R = 0` | holds | none |
| 5.2 `lameHermiteInvariant_eq_zero_iff` | `n = 2, 3`, `k² = 0.3`; `n = 0` | roots of `R` mapped by `h = n(n+1)(1+k²)/3 − B/(2K)²`: `0.82236112, 1.3, 2.2, 4.3, 4.37763888` and the seven for `n = 3`, equal to shooting; `n = 0`: `{0}` both sides | holds | none |
| 5.3 `lame_coexistence` | `ν = 2, 3` (`m > n`); `ν = 1.5, −0.3`, `m = 1…4` | `a³−b³ = −4·10⁻¹⁴` (`ν=2`); `ν=1.5`: `0.939, 0.0673, −0.00170, 6.8·10⁻⁵` vs products `1.5, 0.75, −0.375, 0.5625`; `ν=−0.3`: `−0.0522, 0.00498, −0.00033, 2.0·10⁻⁵` vs `−0.3, 0.39, −0.897, 2.96` | signs agree | none |
| 5.3 no other coexistence | `ν` half-integer and generic | local monodromy eigenvalues `e^{∓2πiν}`; `= −1` twice or distinct, never the identity for `ν ∉ ℤ` | holds | none |
| 5.4 `lame_stability` | `ν = 1`, `k² = ½`; `m ≤ n` ordering | `a⁰ = ½`, `b¹ = 1`, `a¹ = 3/2`; `b^m < a^m` for `m ≤ n` from 29.3.6 (product positive); DLMF §29.9 read | holds | none |
| 6.2 `lame_double_orthogonal` | `k² = ½`, `n = 0` against `n = 2` | weighted integrals `−4·10⁻¹²`, `−3·10⁻¹¹`; unweighted `0.17206`, `2.39650`; `sn(K+it,k) = 1/dn(t,k′)` | holds | none |
| 6.2 class hypothesis | `sE·dE` on the segment, `k² = ½` | `∫ k′ cn/dn² = k′ sd(K′,k′) = 1` | nonzero, as the Check says | none |
| 6.3 `lame_integral_equation` | `n = 0`; `n = 1`; `uE₂`, `h = 3−√3`, `α = 0.3` | `c = 4K`; `c = 4(K−E)/k = 2.84783`; ratio `−2.43150001`; `shiftedLegendre n = P_n(1 − 2x)` at the pin | holds; `c ≠ 0` by nonzero Legendre coefficients | none |

- Source locators checked against the text: DLMF §§29.1, 29.2, 29.3, 29.5, 29.6(i), 29.8, 29.9, 29.10, 29.12, 29.14, 29.15(i) and 29.15.43, 29.17 (about 60 equation numbers, all correct); Whittaker–Watson §§23.2, 23.21, 23.4, 23.41–23.47, 23.5, 23.6, 23.61, 23.7, 23.71 (13 locators; 2 wrong, C01).
- Library declarations opened at the pin: `TauCeti.Real.legendreK` (EllipticIntegral/Legendre.lean:95), `legendreK_zero` (:352), `legendreK_pos` (:338), `TauCeti.Real.jacobiSn` (JacobiElliptic/Basic.lean:66), `jacobiSn_antiperiodic` (:317), `jacobiSn_legendreK` (:344), `UpperHalfPlane.periodPair` (UpperHalfPlane/PeriodPair.lean:99, `ω₁ = τ`, `ω₂ = 1`), `PeriodPair.weierstrassZeta` (Elliptic/WeierstrassZeta.lean:71), Mathlib `Polynomial.shiftedLegendre` (RingTheory/Polynomial/ShiftedLegendre.lean:40). Neither library has Lamé's equation or its functions.
- Cross-roadmap citations resolved: SpecialFunctionsMathieu Conventions, 1.1, 2.1, 2.5, 3.1, 3.3, 3.4, 4.1, 7.1–7.3 (the eight copied definitions agree with its `Suggested.lean` body for body); SpecialFunctionsHeun 2.4, 4.1–4.3; SpecialFunctionsJacobiElliptic 2.1–2.3, 3.4, 3.5, 4.1, 7.1; SpecialFunctionsLegendre 1.1, 3.3, 4.3; EllipticIntegrals 2.1, 3.1; AsymptoticExpansions §12.1. All exist; Mathieu 7.3 does not say what it is cited for (R03).
- Dependency check: `depcheck: 129 roadmaps, 1436 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: the targeted build of the module succeeds with `sorry` as the only warning (22 of them); the elaborated types of all 53 declarations were compared with the README (no binder lost; `lameUMatrix_charpoly_roots` casts `n` as intended).
- One-tactic probe (`simp`, `rfl`, `infer_instance`, `decide`) on a scratch copy: none of the 22 sorried theorems closes. The two proved declarations are marked as sanity checks.

Overlap check: read SpecialFunctionsHeun, SpecialFunctionsMathieu, SpecialFunctionsJacobiElliptic, SpecialFunctionsLegendre (open) and EllipticIntegrals, SpecialFunctionsTheta, SpecialFunctionsBessel (main); Lamé's equation as a case of Heun's: owner SpecialFunctionsHeun 2.4, cited here; Hill's definitions: owner SpecialFunctionsMathieu, copied here as marked local copies in this roadmap's namespace; Lamé functions, polynomials and ellipsoidal harmonics: owned here only (Heun's scope excludes them by name). A search of all open heads and main for these objects found no other owner.

Source independence: 21 passages compared with 2 sources (DLMF Chapter 29, Whittaker–Watson Chapter XXIII), none shared beyond formulas and statements that can be written one way; largest share DLMF, 53 of 151 source mentions; contents compared with DLMF Chapter 29: independent (Layer 3 reorders §§29.5, 29.6, 29.8; §29.3 is split over Layers 2, 3, 4.4 and 5.3; §29.9 sits in Layer 5, which is built on Whittaker–Watson §23.7). Dassios, Ronveaux, Gesztesy–Holden and Kristensson could not be read.

Research link: Layer 5 states the finite-gap property of the Lamé potential `n(n + 1)℘`, the basic example of the algebro-geometric potentials of Gesztesy–Holden (2003); Layer 6 gives the harmonics used in Dassios (2012) for ellipsoidal boundary-value problems; 29.3.6 is Volkmer (2004). Rests on the README's references and DLMF §29.3.

## Not verifiable

- Dassios, *Ellipsoidal Harmonics* (Cambridge University Press, 2012): no legal copy; every locator into it (1.2, 4.1–4.4, 6.1, 6.2) is unchecked. The identity of 1.2 was verified by computation instead.
- Gesztesy–Holden, *Soliton Equations*, Vol. I (Cambridge University Press, 2003): no legal copy; (1.12)–(1.14), Example 1.32, (1.293)–(1.295) and p. 114 are unchecked. The normalization `4/((2n − 1)!!)⁴` was verified by computation.
- Ronveaux (ed.), *Heun's Differential Equations* (Oxford University Press, 1995) and Kristensson (Springer, 2010): no legal copy.
- The printed page numbers of the NIST Handbook (pp. 683–695): the online DLMF has no pages; equation and section numbers were checked.
- Whittaker–Watson was read in the 3rd edition (1920), as an OCR text; the README cites the 4th. Section numbers and pages of Chapter XXIII agree wherever they could be compared.
- Checks not recomputed: the zeros and residuals of 4.3, the values of `Δ` in 5.4, the Fourier coefficients of 3.2, the norms of 6.2.

Automatic checks set aside as false positives: the report that `lameHermitePoly` chooses its datum (the polynomial is characterised by a universal property, monic of degree `n` solving the product equation, and clauses 1–2 of `lame_hermite` state its existence and uniqueness, exactly as for the copied `hillWI`); the report of a section header with no declaration under it (the header "Library declarations consumed" is followed by `#check` lines that pin library declarations, which the form rules allow).

## Source issues

- none

## For the human reviewers

- **Not tested.** Dassios (2012), Gesztesy–Holden (2003), Ronveaux (1995) and Kristensson (2010) are paywalled; wording and arrangement were compared only with DLMF Chapter 29 and Whittaker–Watson Chapter XXIII, which carry 86 of the 151 source mentions.
- **Licence.** The description says the open-source lean-DLMF project "informed the survey of DLMF Chapter 29 but is not a supplier". I did not compare `Suggested.lean` with that repository.
