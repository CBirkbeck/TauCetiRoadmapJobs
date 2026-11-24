# Review of AutomorphicSpectralTheory (pull request #3027 at f3b4ab1)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 45 changed lines since `74a09b7`. Accepted: the two added sections, §4.5a (Müller's polynomial bound on the discrete spectrum) and §6.4a (trace class of `R(f)` on the cuspidal and discrete spectrum), were recomputed statement by statement and read against [Mül89] and [FLM11], and no finding results. The folder is unchanged since the previous review, so its three small corrections are still open (the route of §4.5a names Jensen's inequality where Müller uses Hadamard's factorization; an SL₂ Check drops "even"; the description omits this roadmap's two new suppliers), and there is one format note; none blocks. Nothing is left for a human to decide.

## C01 — The route of §4.5a counts the real poles of `det C(s)` with Jensen's inequality, whereas Müller counts them with Hadamard's factorization and an integral estimate, which is where the uniformity in the inducing data comes from

The route (line 2241) ends "the growth of `det C(s)` as a quotient of entire functions of finite order; Jensen's inequality bounds the zeros of such a function in a disc by its growth on a larger circle", and the *Needs:* line (line 2249) and the Mathlib bullet (line 3775) list `AnalyticOnNhd.sum_divisor_le` for it. An implementer who applies Jensen to the quotient gets a count for each `C(s)` with a constant depending on that operator; the summed bound needs a count polynomial in the `K_∞`-type and the Levi Casimir eigenvalue with a constant independent of them.

[Mül89] does not use Jensen (the word does not occur in the text). It writes `det C(s)` as a quotient of entire functions of finite order (Theorem 5.10, p. 65, Mül89 line 1623), applies Hadamard's factorization to obtain a product formula (introduction, p. 6, line 181; Theorem 6.8, p. 70, line 1739), and bounds the poles in `[−c, λ]` with a constant independent of the inducing representation through the estimate of §7 (Theorem 7.5, p. 75, line 1849).

The smallest repair: name Hadamard's factorization for the product formula (AnalyticNumberTheoryPartI §0.23, already a supplier of this roadmap) and say that the uniform polynomial count comes from Müller's Theorems 7.1 and 7.5. Alternatively keep Jensen and state the growth bound, uniform in the type, that makes it suffice.

## C02 — The SL₂ Check of §4.5a says the sum over one `τ` converges exactly when `k>1/2`; this holds for even `τ` only

In the Check (line 2245), `−I∈SL₂(ℚ)` has finite component in `K₀=SL₂(Ẑ)`, so `−I_∞` acts trivially on `K₀`-invariant functions and an odd `τ` occurs in no summand: its sum is empty and converges for every `k`. For even `τ=n` the Maass forms give `Σ_j(1+λ_j²+n⁴)^{−k}` with `N(X)∼X/12`, finite exactly when `k>1/2`, as stated. Write "the sum over one even `τ`".

## C03 — The description does not say that this roadmap gains two sections and two suppliers

The description's "For reviewers" paragraph lists the new supplier relations between general roadmaps, and does not name AutomorphicSpectralTheory. The head adds §4.5a and §6.4a and two rows to the supplier table (lines 3751–3752): RepresentationTheory/SmoothBanachRepresentations §6.1 and PseudodifferentialOperators §6.1. A sentence would do: "AutomorphicSpectralTheory gains §4.5a (Müller's polynomial bound on the discrete spectrum) and §6.4a (trace class on the cuspidal and discrete spectrum), with PseudodifferentialOperators §6.1 and RepresentationTheory/SmoothBanachRepresentations §6.1 as new suppliers."

## N01 — In §4.5a (line 2237) "there is `k`" would read better as "there is `k≥0`"

The "In particular" bound `S(1+R²+λ_τ²)^k` is derived for a nonnegative exponent; for the trivial group the sum is finite for `k=−1` too, and the dimension bound then fails (`1≤(1+R²)^{−1}`).

## Previous findings

The previous review (of `644c332`) had no finding. Its three small corrections are in text that has not changed since:

- C01 (Jensen against Hadamard in the route of §4.5a) — not repaired: "Jensen's inequality bounds the zeros of such a function in a disc by its growth on a larger circle". Raised again as C01.
- C02 (the quantifier over `τ` in the SL₂ Check) — not repaired: "the sum over one `τ` converges exactly when `k>1/2`". Raised again as C02.
- C03 (the description and the two new suppliers) — not repaired: the description names AutomorphicSpectralTheory only in its generated merge-order block. Raised again as C03.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §4.5a bound, all `τ` | `SL₂/ℚ`, `K₀=SL₂(Ẑ)` | Maass: `∫∫(X²+n⁴)^{−k}dX dn`, polar exponent `−2k+1/2<−1`; holomorphic: `Σ_l l·l^{1−4k}`; both finite iff `k>3/4` | true | none |
| §4.5a Check, one `τ` | even `n`; odd `n` | even: `Σλ_j^{−2k}`, `N(X)∼(π/3)/(4π)·X=X/12`, finite iff `k>1/2`; odd: empty sum | slip in quantifier | C02 |
| §4.5a Check, `λ_τ` dropped | one Maass form | terms `(1+λ_j²)^{−k}` repeated for every even `n`: divergent for all `k` | true | none |
| §4.5a bound | `GL₁/ℚ(√2)`; trivial `G` | `𝔨=0`, `λ_τ=0`, `λ_π=−ct²`, `t` in a lattice: finite iff `k>1/4`; trivial: sum `=1` | true | none |
| §4.5a "In particular" | `k≥0`; trivial `G`, `k=−1` | `k≥0`: count `≤S(1+R²+λ_τ²)^k`; `k=−1`: `1≤(1+R²)^{−1}` fails | holds for `k≥0` | N01 |
| §4.5a signs | `Z_k` orthonormal for `−B` on `𝔨`, `Y_j` on `𝔭` | `Ω=ΣY_j²−ΣZ_k²`, `Ω_K=−ΣZ_k²≥0`, `−Ω+Ω_K=−ΣY_j²≥0`, `Δ=1−ΣY_j²−ΣZ_k²` elliptic | true | none |
| §4.5a comparison of `μ` | `a=λ_τ−λ_π≥0`, `b=λ_τ≥0` | `μ=1+a+b`; `1+(b−a)²+b²≤2(1+a+b)²≤3μ²`; Cauchy–Schwarz with `(1,−1,2)`: `μ²≤6(1+λ_π²+λ_τ²)` | true | none |
| §4.5a Hilbert–Schmidt clause | `Δ^{−k}` on `τ`-isotypic vectors | HS norm² `=Σ m d μ^{−2k}`, comparable to `Σ m d(1+λ_π²+λ_τ²)^{−k}` by the row above | true | none |
| §4.5a cuspidal route | parametrix identity | `R(h)Δ^m=1+R(g)` gives `Δ^{−m}=R(h)−R(g)Δ^{−m}`; HS plus HS·bounded | true | none |
| §4.5a residual route | Mül89 pp. 3–6, 65, 70, 75 | iterated residues, rank-one reduction, auxiliary operator: as stated; pole count by Hadamard and §7, no Jensen | tool differs | C01 |
| §6.4a cuspidal clause | `GL₁/ℚ` | `G(𝔸)¹∩(G(F_∞)×K₀)=G(F_∞)¹×K₀`, open; `ψ_i(g)=f(x_i g)`; `(a⊗1_{K₀})∗(b⊗1_{K₀})=vol(K₀)(a∗b)⊗1_{K₀}` | true | none |
| §6.4a discrete clause | `f` right-`K₀`-invariant | `R(f)R(k)=R(f)`, so `R(f)=R(f)e_{K₀}`; `R(f)=R(f_k)Δ^{−2k}`; trace norm of `Δ^{−2k}` `=Σ m d μ^{−2k}<∞` | true | none |
| §6.4a Checks | `GL₁/ℚ`; `SL₂` | `ℚ^×\𝔸¹` compact, no proper parabolic so `L²_cusp=L²`, trace `Σ_χ χ̂(f)`; `SL₂`: continuous spectrum, not trace class | true | none |
| §6.4a locator remark | `Res_{ℚ(√2)/ℚ}GL₁`, `GLₙ/ℚ` | `Z(ℝ)⁰=ℝ_{>0}²` against `A_G(ℝ)⁰=ℝ_{>0}`; `GLₙ/ℚ`: both `ℝ_{>0}` | true | none |
| `analytic_fredholm`, `green_kernel_continuation` (headlines) | unchanged file | elaborate with `sorry` only (lines 42, 84); the change adds no statable headline | stand | none |

- Change read: §4.5a and §6.4a in full, the Layer 4 and Layer 6 Dependencies sentences, two supplier rows, one Mathlib bullet, three reference entries. `Suggested.lean` is unchanged; its module docstring already names Layer 4 and the Layer 6 trace formulas as not statable (adelic quotients absent from the pins). The seeded sample (15 targets) does not fall in the changed or affected passages.
- Source locators read: [Mül89] Theorem 0.1 and Corollary 0.2, p. 2 (lines 78–85); the remark on Proposition 3.17, p. 3 (lines 91–97); the outline, pp. 3–6 (lines 100–186); Theorem 7.5, p. 75 (line 1849); Proposition 8.5, p. 82 (line 2054); Corollary 8.8, p. 84 (lines 2102–2117). [FLM11] Remark 3, p. 10 (lines 387–389); end of §5.1, p. 14 (lines 618–640). All as cited.
- Library declaration opened: `AnalyticOnNhd.sum_divisor_le`, `Mathlib/Analysis/Complex/JensenFormula.lean:389` at the pin.
- Cross-roadmap citations resolved on main: PseudodifferentialOperators §6.1 (README line 1429, two-sided properly supported parametrix); RepresentationTheory/SmoothBanachRepresentations §6.1 (README lines 348, 377; `dixmierMalliavin_function`, Suggested.lean line 188); OperatorTheory/OperatorIdeals OI-B30, OI-B41 (README lines 350, 375); AnalyticNumberTheoryPartI §0.23 (line 533). Internal §§0.6, 0.8, 0.9, 1.5, 2.4, 2.6, 3.2–3.6, 4.4, 4.5, 4.9, 6.4, 6.17 exist. DiscreteSeriesCoefficientsAndAutomorphicMetrics §9.1 (line 462 at this head) cites §6.4a.
- Record: the README at the merge base has 8 layers; the head has the same 8, removes no heading and adds two (§4.5a, §6.4a).
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1480 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean`: two `sorry` warnings, nothing else.
- Other open pull requests: one other open revision changes this folder, and the description's merge-order paragraph states the order (it first, then this one). No id cited here is dropped by an open pull request, and this change drops none.

Overlap check: read AutomorphicSpectralTheoryPartII (open head, §4.5a at README line 1320), AutomorphicLFunctionsAndLocalFactors and EndoscopicTransferAndUnitaryTraceComparison (searched by object for Müller's bound and the trace-class theorem; neither states them). Shared object: the polynomial count of the discrete spectrum, here summed over `K_∞`-types on `[G]¹`, in the open Part II for a finite set of types with a fixed central character. Owner: AutomorphicSpectralTheory, on main and earlier; Part II should cite it, a repair for that pull request. Trace class on the cuspidal and discrete spectrum is owned here and cited by DiscreteSeriesCoefficientsAndAutomorphicMetrics §9.1.

Source independence: changed passages only; 7 passages compared with 2 sources ([Mül89] lines 60–160, 176–186, 2040–2131; [FLM11] lines 385–392, 618–640), none shared beyond "is spanned by iterated residues", which the mathematics forces; largest share Yu22, 63 of 310 bracketed locators; no layer added, removed or reordered, so the contents were not compared.

Research link: §§4.5a and 6.4a are Müller's bound on the discrete spectrum and the trace-class theorem (Müller 1989, 1998; Ji 1998), which Finis, Lapid and Müller (2011, §5.1) use for the absolute convergence of the spectral side of Arthur's trace formula, built in Layer 6. Rests on the README and [FLM11] Remark 3 and §5.1.

## Not verifiable

- [Mül98] Corollary 0.3 (Geom. Funct. Anal. 8, 1998): settled as uncertified (paywalled); its content was read only as [FLM11] applies it at the end of §5.1, p. 14.

Automatic checks set aside as false positives: the citation resolver reports four Lean names as found nowhere (`Modular.automorphic_green`, `Modular.green_kernel_continuation`, `SpecialFunctions.legendre_q`, `SpecialFunctions.point_pair_invariant`) although `Suggested.lean` declares them inside nested namespaces (lines 61, 66, 77, 84), and two (`LocallySymmetric.FrankeInput`, `LocallySymmetric.realPoints_lieGroup`) that are proposed names of ArithmeticLocallySymmetricSpaces' README on main; all six are in untouched text.

## Source issues

- none

## For the human reviewers

- none
