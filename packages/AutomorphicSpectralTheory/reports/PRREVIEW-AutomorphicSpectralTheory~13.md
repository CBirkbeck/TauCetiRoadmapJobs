# Review of AutomorphicSpectralTheory (pull request #3027 at 644c332)

**Verdict:** accepted

**Summary.** Accepted: no finding remains, and all four earlier remarks (R01, R02, C01, N01) are repaired. The new §4.5a states Müller's polynomial bound on the discrete spectrum correctly, summed over `K_∞`-types on `[G]¹` over a number field; §6.4a now takes its discrete clause from §4.5a and its cuspidal clause from the compactly supported Dixmier–Malliavin factorization on `G(F_∞)¹`, without the restriction-of-scalars step. Three small corrections remain, none blocking: §4.5a's route names Jensen's inequality where Müller uses Hadamard's factorization, an SL₂ Check misstates its quantifier for odd `K_∞`-types, and the description omits two new suppliers. Nothing is left for a human to decide.

## C01 — §4.5a's route counts the real poles of `det C(s)` with Jensen's inequality, but Müller counts them with Hadamard's factorization and an integral estimate, and that estimate is where the uniformity in the `K_∞`-type comes from

The route (line 2241) ends: "the growth of `det C(s)` as a quotient of entire functions of finite order; Jensen's inequality bounds the zeros of such a function in a disc by its growth on a larger circle". The *Needs:* line (line 2249) then lists `AnalyticOnNhd.sum_divisor_le` as the zero-counting input. An implementer following this would apply Jensen to `F₁/F₂`. That gives a count for each `C(s)` separately. The summed bound, however, needs a count that grows only polynomially in the `K_∞`-type and the Levi Casimir eigenvalue.

In [Mül89] the count runs differently. Theorem 5.10 (p. 65, Mül89 line 1623) gives `det C(s)=F₁/F₂` with `F₁, F₂` entire of order at most `n+2`. Hadamard's factorization then gives the product formula of Theorem 6.8 (p. 70, line 1739). Theorem 7.1 (p. 72, line 1778) bounds the integral of the logarithmic derivative over the imaginary axis using the eigenvalue count of the auxiliary operator. That estimate, (7.3)–(7.4) (p. 74), yields Theorem 7.5 with a constant independent of the type (p. 75, line 1849). Jensen's inequality appears nowhere in this argument.

The smallest repair is to name Hadamard's factorization for the product formula. AnalyticNumberTheoryPartI §0.23 (finite-order Hadamard factorization, on main and already a supplier) provides it. Say that the polynomial dependence comes from the integral estimate of Mül89 Theorem 7.1. Alternatively, keep Jensen and state the growth bound, uniform in the type, that makes it suffice.

## C02 — The SL₂ Check says the sum over one `τ` converges exactly when `k>1/2`, which fails for odd `τ`

In the Check of §4.5a (line 2245), `−I` lies in `SL₂(ℚ)` and its finite component lies in `K₀=SL₂(Ẑ)`. So `−I_∞` acts trivially on the `K₀`-invariant vectors, and an odd `τ` has none. For such `τ` the sum is empty and converges for every `k`. The threshold `k>1/2` is right for every even `τ`: the Maass forms contribute `Σ_j λ_j^{−2k}` with `N(X)∼X/12`. Write "the sum over one even `τ`".

## C03 — The description does not mention that this roadmap gains two suppliers

The description's "For reviewers" paragraph says the additions create new supplier relations, and it names several of them. It does not name the two this roadmap gains in its supplier contracts (lines 3751–3752). These are PseudodifferentialOperators §6.1 (parametrices of elliptic operators, used in §4.5a) and RepresentationTheory/SmoothBanachRepresentations §6.1 (`dixmierMalliavin_function`, used in §6.4a). Its count of added sections also does not say that AutomorphicSpectralTheory receives §§4.5a and 6.4a. A sentence would fix both: "AutomorphicSpectralTheory gains §4.5a (Müller's polynomial bound on the discrete spectrum) and §6.4a (trace class on the cuspidal and discrete spectrum), with PseudodifferentialOperators §6.1 and RepresentationTheory/SmoothBanachRepresentations §6.1 as new suppliers."

## Previous findings

- R01 — repaired: §4.5a states the bound, "there is `k` with `Σ_{τ∈K̂_∞}Σ_π m(π)d(π,τ)(1+λ_π²+λ_τ²)^{−k}<∞`", with Müller's route. §6.4a's discrete clause uses it ("`Δ^{−2k}` is trace class there for large `k` by §4.5a"). It is in the *Needs:* line and in the Layer 6 Dependencies.
- R02 — repaired: the restriction-of-scalars sentence is gone. The locator now says that Corollary 8.8 is on `L²_disc(Z(ℝ)⁰G(ℚ)\G(𝔸))`, "but not for the restriction of scalars of `GLₙ` from a number field other than `ℚ`".
- C01 (small correction) — repaired: "The Dixmier–Malliavin factorization on the real Lie group `G(F_∞)¹` (RepresentationTheory/SmoothBanachRepresentations §6.1, `dixmierMalliavin_function`) writes each `ψ` as a finite sum of convolutions of two functions in `C_c^∞(G(F_∞)¹)`".
- N01 (format note) — repaired: "[Mül98], Corollary 0.3, for the form summed over `K_∞`-types". The reference entry adds the DOI and that locator.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §4.5a bound | `SL₂/ℚ`, `K₀=SL₂(Ẑ)` | Maass terms ≍ `(r_j⁴+n⁴)^{−k}`, density `r dr`; holomorphic `Σ_l (l/12)l^{1−4k}`: both finite iff `k>3/4` | true | none |
| §4.5a bound | `GL₁` over `ℚ(√2)`, `ε=1+√2` | `𝔨=0`, `Y=(1,−1)`, `λ_π=−4t²`, `t∈(π/log ε)ℤ`, `λ_τ=0`: `Σ(1+16t⁴)^{−k}<∞` iff `k>1/4` | true | none |
| §4.5a bound | trivial `G`; `[G]¹` compact, `G(F_∞)¹` compact | trivial: sum `=1`; compact: `𝔭=0`, `Σ_τ(dim τ)²(1+2λ_τ²)^{−k}` finite by Weyl's dimension formula | true | none |
| §4.5a sign of `−Ω+Ω_K` | `SL₂(ℝ)`, `B=tr` | `Ω=(H²+V²−W²)/2`, `Ω_K=−W²/2`↦`n²/2`; `D_l`: `λ_π=l(l−2)/2≤n²/2` (`n≥l`); Maass: `λ_π=−2(1/4+r²)≤0` | true | none |
| §4.5a comparison `μ` | `a=λ_τ−λ_π≥0`, `b=λ_τ`; `(λ_π,λ_τ)=(−5,0),(4,4)` | `μ=1+a+b`; `(−5,0)`: `26≤108`, `36≤156`; `(4,4)`: `33≤75`, `25≤198`; Cauchy–Schwarz with `(1,−1,2)` | true | none |
| §4.5a Check, one `τ` | even `n`; odd `n` | even: `Σλ_j^{−2k}`, `N(X)∼X/12`, finite iff `k>1/2`; odd: no `K₀`-invariant vectors, empty sum | quantifier slip | C02 |
| §4.5a route | Mül89 lines 100–215, 1623, 1739, 1778–1849, 1901–2060 | Donnelly cusp part; residues along flags; Maass–Selberg; adjacent chambers; Hadamard + Thm 7.1, no Jensen | route tool differs | C01 |
| §4.5a locators | Mül89 preprint; FLM11 authors' copy | Thm 0.1 p. 2 (line 78); remark p. 3 (lines 91–97); §8 pp. 77–82; Prop. 8.5 p. 82 (line 2054); FLM11 p. 14 (lines 596–640) | exact | none |
| §6.4a cuspidal route | `GL₁/ℚ`, `K₀=Ẑ^×` | `G(F_∞)¹K₀=G(𝔸)¹∩(G(F_∞)×K₀)`, open; `GL₁`: `{±1}×Ẑ^×` open in `𝔸¹`; `L_x(a∗b)=(L_x a)∗b` | true | none |
| §6.4a discrete route | `f` right-`K₀`-invariant | `R(f)=R(f)e_{K₀}=R(f_k)Δ^{−2k}e_{K₀}`; trace norm of `Δ^{−2k}` = `Σ m d μ^{−2k}` = HS² of `Δ^{−k}` | true | none |
| §6.4a locator | `Res_{ℚ(√2)/ℚ}GL₁` | `Z(ℝ)⁰=ℝ_{>0}²` against `A_G=ℝ_{>0}`; text restricts Cor. 8.8 to `Z(ℝ)⁰=A_G(ℝ)⁰` (Mül89 lines 2102–2117) | true | none |
| §2.4 (sample, cited by §4.5a) | Art05 p. 35 | Thm 7.2(a) (line 1878), (7.3) and (7.4) `M(ts,λ)=M(t,sλ)M(s,λ)` (line 1887): the cocycle §4.5a uses | exact | none |
| §1.5 (sample, cited by §4.5a) | Lan66 pp. 3–4 | Lemma 3 (line 125): zero for non-associate, sum over `Ω(a,a′)` otherwise; Bruhat computation (lines 142–170) | exact | none |
| New suppliers | PseudodifferentialOperators §6.1; SmoothBanachRepresentations §6.1 | `Δ=1−ΣY_j²−ΣZ_k²` elliptic; two-sided properly supported parametrix (main line 1429); `φ=Σ f_j∗h_j` (main Suggested.lean line 188) | supply as stated | none |

The rows for the other statements, including the two headline theorems of `Suggested.lean` (`analytic_fredholm`, `green_kernel_continuation`), stand as in the previous review, of `71bbefa`.

- Change since `71bbefa`: 32 lines of `README.md` only (§4.5a added; §6.4a route, locator and *Needs:*; Layer 4 and Layer 6 Dependencies; two supplier rows; one Mathlib bullet; the [Mül98] entry). The files outside the folder that changed in that range are the pull request's own folders or arrive through the merge of main. `Suggested.lean` is unchanged. Its module docstring (lines 17–19) covers §4.5a, which needs adelic quotients absent from the pins.
- Source locators checked against the text: 9 in [Mül89] (Theorem 0.1, p. 2; the remark on Proposition 3.17, p. 3; the proof outline, pp. 3–6; Theorem 5.10, p. 65; Theorem 6.8, p. 70; Theorems 7.1 and 7.5, pp. 72–75; §8 and Proposition 8.5, pp. 77–82; Corollary 0.2, p. 2; Corollary 8.8, p. 84). 2 in [FLM11] (Remark 3, p. 10; end of §5.1, p. 14). 1 in [Art05] (Theorem 7.2(a), p. 35). 1 in [Lan66] (§3, Lemma 3, pp. 3–4).
- Library declarations opened: `AnalyticOnNhd.sum_divisor_le`, `Mathlib/Analysis/Complex/JensenFormula.lean:389` at the Mathlib pin `1b1ccf4`, which matches the Mathlib bullet. No Hadamard factorization is at the Mathlib pin.
- Cross-roadmap citations resolved: PseudodifferentialOperators §6.1 (main, README line 1429). RepresentationTheory/SmoothBanachRepresentations §6.1 (main, README line 348; `dixmierMalliavin_function` at Suggested.lean line 188). AnalyticNumberTheoryPartI §0.23 (main line 533, the same at this head). AutomorphicSpectralTheoryPartII §4.5a at its open head (line 1319). DiscreteSeriesCoefficientsAndAutomorphicMetrics §9.1 at this head (line 462) cites §6.4a with the unchanged statement. Internal §§0.6, 0.8, 0.9, 1.5, 2.4, 2.6, 3.2–3.6, 4.4, 4.5, 4.9 exist and say what the new text uses them for.
- Record: the README at the merge base `74a09b7` has Layers 0–7. The head keeps every id and title and adds two headings (§4.5a, §6.4a).
- Automatic checks: the worker's checks all passed. The dependency check prints `depcheck: 132 roadmaps, 1480 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean` gives two `sorry` warnings (lines 42, 84) only.

Overlap check: read AutomorphicSpectralTheoryPartII (§§4.5–4.7, 5.7 at its open head). Searched main and every open head by object for Müller's counting bound and the trace-class conjecture; the scopes of AutomorphicLFunctionsAndLocalFactors, EndoscopicTransferAndUnitaryTraceComparison and AutomorphicFormsOnReductiveGroups stand as read in the previous reviews. Shared object: the polynomial count of discrete-spectrum Casimir eigenvalues. It is here as §4.5a (summed over `K_∞`-types on `[G]¹`) and in the open AutomorphicSpectralTheoryPartII §4.5a (finite type set, fixed central character). Its owner is AutomorphicSpectralTheory, which is on main and earlier in the merge order; Part II's section should cite this one, which is a repair in that pull request. Trace class on the cuspidal and discrete spectrum is owned here (§6.4a), and DiscreteSeriesCoefficientsAndAutomorphicMetrics §9.1 cites it. Nothing else is shared.

Source independence: changed passages only. 7 passages were compared with 2 sources: [Mül89] lines 100–124, 155–215, 1901–1976 and 2102–2131, and [FLM11] lines 387–389 and 596–640. At most four consecutive words are shared ("is spanned by iterated residues"), and the mathematics forces them. The largest share of locators is Yu22, 65 of 367 bracketed citations. No layer was added, removed or reordered, so the contents were not compared again.

Research link: §§4.5a and 6.4a are Müller's polynomial bound on the discrete spectrum and the trace-class theorem (Müller 1989, 1998; Ji 1998). Finis, Lapid and Müller (2011, §5.1) use this bound to prove absolute convergence of the spectral side of Arthur's trace formula, which Layer 6 builds. This line rests on the README and on [FLM11] Remark 3 and §5.1.

## Not verifiable

- [Mül98] Corollary 0.3 (Geom. Funct. Anal. 8, 1998): the manifest settles it as uncertified (paywalled). Its content was taken from [FLM11], end of §5.1, p. 14.

Automatic checks set aside as false positives: the citation resolver lists four Lean names (`Modular.automorphic_green`, `Modular.green_kernel_continuation`, `SpecialFunctions.legendre_q`, `SpecialFunctions.point_pair_invariant`) as found nowhere, although `Suggested.lean` declares them (lines 61, 66, 77, 84). It lists two more (`LocallySymmetric.FrankeInput`, `LocallySymmetric.realPoints_lieGroup`) that are proposed names in ArithmeticLocallySymmetricSpaces' README on main.

## Source issues

- none

## For the human reviewers

- none
