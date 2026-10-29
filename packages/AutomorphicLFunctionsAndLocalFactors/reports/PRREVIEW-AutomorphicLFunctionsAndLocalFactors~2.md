# Review of AutomorphicLFunctionsAndLocalFactors (pull request #924 at e8f16d4)

**Verdict:** needs changes

Incremental re-review of the 124 changed lines since 322ade4. No P1 or P2 finding remains; the only obstacle to acceptance is that the recorded push gate still fails on its residue rule (R01 below, a P3 style finding re-raised from the previous report). The dependency check now reports no problem, the build passes, and the mathematics of every changed passage checked out.

## R01 (P3) — Raw HTML anchors still fail the gate

**Location:** `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1965`: `<a id="local-whittaker-uniqueness"></a>`; 179 such lines in the file (176 before, plus the three added by this revision at lines 1965, 3042 and 3050).

**Claim:** The folder passes the push gate. It does not: the recorded gate at this head reads `residue=179 … FAIL`, with every other scanner count at zero, and the residue rule names `<a id=` anchor tags explicitly. This is the previous report's R05, not repaired (the broken Gaussian Check it also named is fixed).

**Witness:** `grep -c '<a id=' README.md` returns 179, equal to the gate's residue count; the gate's first twenty listed lines (240–560) are all anchor lines. Several anchor ids also carry job-style labels (`r16-2-casselman-newvector`, lines 1771, 1804).

**Repair:** Convert each anchored target into a numbered `### k.n <topic>` heading in its layer and point the internal `[…](#…)` links at those headings; cite supplier-facing targets by section number so that consumers (for example GanGrossPrasadUnitaryGroups, which imports AL.0–AL.5 by layer) need no fragment ids. Re-run the gate: `residue` must be 0 with every other count unchanged.

## R02 (P3) — The Landau step is stated with its conclusion as a hypothesis

**Location:** `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:2265`, in the pole-criterion target: “its logarithm is a Dirichlet series with nonnegative coefficients, holomorphic on `Re(s)>1`, so Landau's theorem applies”.

**Claim:** The logarithm of `L^S(s,π×π∨)` is holomorphic on `Re(s)>1`. Before the convergence is known, holomorphy of the logarithm there is equivalent to nonvanishing of `L^S` on `Re(s)>1`, which is the consequence being proved; the pole criterion only gives that `L^S` itself is holomorphic there. The route is sound, but the sketch skips the step that makes it so.

**Witness:** Let `σ_c>1` be the abscissa of the nonnegative log-series. For real `s>σ_c` the series is nonnegative, so `L^S(s)≥1`; by continuity `L^S(σ_c)≥1≠0`, hence the logarithm is holomorphic near `σ_c` and Landau's theorem (ArithmeticDirichletSeries layer 8.1) gives the contradiction. Without this line the sketch assumes `L^S≠0` on `Re(s)>1`. `cogdellfields` lines 3225–3232 (Lecture 9 §1, printed p.70) state the `Re(s)>1` result and say it needs more work than the lecture gives.

**Repair:** Insert the one-line nonvanishing observation above (or apply Landau to the Dirichlet series of `L^S` itself, whose coefficients are nonnegative as the exponential of a nonnegative series, as Jacquet–Shalika do), and add the primary locator, Jacquet–Shalika, *On Euler products and the classification of automorphic representations I*, Amer. J. Math. 103 (1981), for the `Re(s)>1` statement, keeping Cogdell p.70 for the statement only. Test on the trivial self-pair over `ℚ`: the log-series is `Σ_p Σ_k p^(−ks)/k`, nonnegative, abscissa 1, and `L^S(σ)≥1` for real `σ>1`.

## Previous findings

- R01 — repaired: “The order is Whittaker uniqueness, Whittaker realization, local Rankin–Selberg integrals, local factor and functional equation, and only then the dimension-one, essential-vector and conductor assertions; none of the Rankin–Selberg targets consumes this one.” (line 1590). The new target “Local Whittaker uniqueness” (1965) owns `dim Hom_N(π,ψ_N)≤1`; `whittaker-model` (2008) and `rs-local-factor` (2089) now need it instead of the newform theorem. I followed every `*Needs:*` edge of `rs-local-integrals`, `rs-local-convergence`, `rs-local-factor`, `rs-local-functional-equation`, `whittaker-model`, `whittaker-compact-parameter-estimates` and the four GL₂ newvector targets (1721–1804): none reaches `generic-local-newforms`; its remaining consumers (288, 1822, 2136, 2352, 3020) are downstream. No new cycle.
- R02 — repaired by the merge order: “LFunctions, layers 0, 5–6” (line 1460) is unchanged, but the order file now lists LFunctions at position 23 and this roadmap at 77; the brief lists LFunctions among the earlier roadmaps and the dependency check reports `0 problem(s)`.
- R03 — repaired by the merge order: “ZerosOfLFunctions, layer 0 and layer 5.1–5.6” (line 1871); ZerosOfLFunctions is now at position 76, before this roadmap at 77; no UPWARD line.
- R04 — repaired: “When both inputs are unramified, with normalized Satake roots … for ramified inputs the factor is only the generator of the fractional ideal above.” (line 2078), and the ramified-character Check now computes the values 1 and 3/2 (line 2086); recomputed below.
- R05 — partly repaired: the complex Gaussian Check is now one bullet (line 711), but the 179 anchors remain and the gate still fails; re-raised as R01.
- R06 — repaired: `namespace TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors` with subnamespaces `AL0`, `TateZeta`, `AL2`, `GL2Blueprint` (`Suggested.lean:43–465`), layer section comments in README order, README line 41 declares the convention, and line 1721 documents `AL2.lastRowStabilizer` as the matrices whose last row is the last standard basis row, matching the Lean carrier at line 318. The `#check` probe below confirms all 33 names.
- R07 — repaired: “Godement–Jacquet, Theorem 3.3 for nonarchimedean F and Theorem 8.7 for archimedean F and K-finite data, for every irreducible admissible π; Jacquet, §4.7, pp.30–31, for smooth archimedean data” (lines 1617, 1639, 1661), plus the domination argument for the derivatives and three Checks including the nongeneric trivial GL₂ representation. The Jacquet locator is verified below; the Godement–Jacquet text is paywalled and stays uncertified.

## Verified sound

**Scope of this pass.** Only the diff since 322ade4 (README 94 lines, `Suggested.lean` 30 lines) and what cites or depends on it were reviewed in full; untouched statements carry the previous report's rows. The outside-folder diff is empty. No file in the pull request was changed by this review. No `set_option`, sorry'd data, copied passage, algorithm, upward supplier or good-prime shortcut was introduced by the change.

**Gate and build.** Recorded gate at e8f16d4: `residue=179`, all other counts 0, `build=0`, `depcheck=0`, FAIL (R01). Dependency check run by me:

```text
depcheck: 201 roadmaps, 1327 edges, 0 problem(s)
```

Merge-order positions: LFunctions 23, ZerosOfLFunctions 76, AutomorphicLFunctionsAndLocalFactors 77, GanGrossPrasadUnitaryGroups 221. No UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean` on `Suggested.lean` (both Hecke-character object files present at the Tau Ceti pin `a91d3aa`): exit 0, exactly 15 `declaration uses sorry` warnings, no other output. A scratch copy with `#check @` for all **33 declarations** elaborated with exit 0; every name resolves under `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors.{AL0,TateZeta,AL2,GL2Blueprint}` and the binders printed are those the previous report verified (the diff touches no statement, only namespaces, section comments and the `localK1` abbreviation's reference, now `AL2.newformLocalK1 F 1 c`). The one-tactic padding probe of the previous report carries over unchanged, since no theorem statement changed.

**Seeded sample.** Of the fifteen seeded targets, only “Convergence of the matrix zeta integral” lies in the changed passages; it and every locator the diff adds were read. The others were checked only where cheap cached texts allowed; the rest carry the previous report's verification or are outside this pass.

| Target / locator | What was read and the outcome |
|---|---|
| Convergence of the matrix zeta integral (1625–1639) | `jacquetarch` lines 1422–1474, §4.7 printed pp.30–31: Godement–Jacquet integral for matrix coefficients of induced `I_{µ,u}`, convergence for `Re(s)≫0`, holomorphic multiple of `L(s,σ_u)`, extension from K-finite to smooth data by continuity and density. Supports the “smooth archimedean data” citation. Godement–Jacquet Theorems 3.3/8.7: paywalled, uncertified. The derivative argument is the roadmap's own; see the table. Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le` at `Mathlib/Analysis/Calculus/ParametricIntegral.lean:286` has exactly the local-bound shape the sketch uses. |
| Local Whittaker uniqueness (1965), Bernstein–Zelevinsky | `bernsteinzelevinsky1976` (author-page copy) lines 2089–2096: Theorem 5.16, `dim E_{U,θ}=1` for every non-degenerate θ when π is non-degenerate irreducible admissible, and Corollary 5.17 (Whittaker model), on printed p.50; §7 “Proof of Theorems 5.16 and 5.21” at lines 2393–2526, printed pp.57–60, continuing to p.62. The `≤1` for degenerate π is the definition (line 2044). Verified. |
| Local Whittaker uniqueness, Cogdell Theorem 4.1 | `cogdellfields` lines 1526–1528, printed p.32 (physical 36): uniqueness for irreducible admissible smooth representations, continuous functionals at infinity. Verified. |
| Rankin–Selberg pole criterion, Cogdell Lecture 9 §1 p.70 | `cogdellfields` lines 3200–3232, printed p.70 (physical 74): the `Re(s)>1` absolute convergence is attributed to Jacquet–Shalika and not proved there (R02). |
| Jacquet–Shalika Satake bound (1827), now consumed by the changed pole target | `cogdellfields` lines 2880–2896, Corollary 7.1.2, printed pp.58–59: the proof is local (closed-boundary convergence for unitary inputs plus the unramified `GL_n×GL_n` computation applied to π and its complex conjugate), matching the target's `*Needs:*` and creating no cycle with the global pole criterion. Verified. |
| Ordinary global multiplicity one (2185) | `cogdellfields` line 1614, Theorem 4.2, printed p.33. Verified. |
| The GL(n) cuspidal Fourier expansion (2144) | `cogdellfields` lines 1427–1500, Lecture 4 §§1–2, physical pp.33–35 = printed 29–31. Verified. |
| Finite Euler corrections at critical points (2905) | `cogdellfields` lines 3412–3449, Lecture 9 §7, printed pp.74–75: comparison of L-functions differing in finitely many Euler factors and its pole consequence. Supports the cited “finite-product comparison”. |
| The global Rankin–Selberg functional equation (2282) | Locator unchanged (Lecture 9 §4 and Theorems 9.1–9.2); verified in the previous report. |
| Explicit local ε-factors (1300), The finite Maass adjoint L-function, The Maass standard functional equation | Unchanged locators; verified in the previous report (ArithmeticGaloisRepresentations §2.7, Chenevier–Taïbi, Humphries–Nordentoft). |
| Fourier transform of a character modulation (442), The additive local-field duality map (603), Hecke/eigensystem/RS data, converse theorem through rank n−2, Tensor cohomological determinant, function-field pair Euler product, Cuspidal pair degrees and poles | Outside the changed passages; their computed rows are carried from the previous report below and their locators were not re-read this round. |

**Pinned declarations opened.** Mathlib `6b7abb3`: `ParametricIntegral.lean:286` (dominated differentiation under the integral, local bound on a neighbourhood). Tau Ceti `a91d3aa`: `NumberTheory/NumberField/Global/HeckeCharacter/{FiniteComponent,InfinityType}.olean` present and imported. Completed/ArithmeticDirichletSeries `README.md:190` (Layer 3: local factors and Euler products) and `:320–322` (Layer 8.1 Landau's theorem, singularity at the abscissa for nonnegative coefficients), as cited by the pole-criterion target.

**Supplier citations resolved this round.** SmoothRepresentationsOfLocalGroups at its open head: SR.2.3 (line 2125, *whittaker-functionals* at 2189), Layer SR.3 (2481), SR.5.1 *mirabolic-derivatives* (3635, 3673), SR.5.3 *highest-derivative-adapter* (4752), all cited by the new uniqueness target. ArithmeticDirichletSeries layers 3 and 8 as above. LFunctions and ZerosOfLFunctions are now earlier in the merge order. Ownership: the Whittaker-uniqueness theorem for `GL_n`, `n≥3`, is claimed by no supplier (SR.2.3 covers `GL₂`; the roadmap says so at line 154); the open-pull-request search of the previous report stands.

**Adversarial calculations for the changed statements.** Lines refer to `README.md` at this head.

| Statement | Instances | Computed values | Result | Change |
|---|---|---|---|---|
|711 Complex trace Gaussian Check|`exp(−2π abs(z)²)` with pairing `Tr(zw)`, measure `2dxdy`|Positive transform of `exp(−2π(x²+y²))` under `e^{2πi·2(xu−yv)}` with `dxdy` is `(1/2)exp(−2π(u²+v²))`; the factor 2 in the measure restores the fixed point; `dxdy` alone halves it.|Pass|Check restored to one bullet.|
|1590 Generic newforms, depth existence|Smooth vector in `GL₃(ℚ₃)`, fixed by the principal congruence subgroup of level `P^m`|That subgroup has last row `≡(0,0,1) mod P^m`, so lies in `K₁(P^m)`; the level set is nonempty and `c` is its least element; vanishing below `c` is minimality.|Pass|None.|
|1590 Generic newforms, dimension one|`n=1`, ramified character of conductor exponent 2; spherical `GL₃`|Fixed spaces at depths 0,1,2 have dimensions 0,0,1 for the character; the spherical line has dimension 1 at `c=0`; both agree with the JPSS route's output.|Pass|Order now realization → integrals → factor → functional equation → newform; no return edge.|
|1625 Convergence, trivial `GL₂` Check|`β=1`, `Φ=1_{M₂(O)}`, `vol GL₂(O)=1`|Coefficient of `q^{−Ns}` on the left: `Σ_{a≥b, a+b=N} vol(K diag(ϖ^a,ϖ^b)K)q^{−N/2}` with volumes `q^{a−b}(1+q^{−1})` (a>b), 1 (a=b): `N=1` gives `q+1`, `N=2` gives `q²+q+1`; on the right `q^{−N/2}(q^{N+1}−1)/(q−1)`, the same. Terms grow like `q^{N(1/2−σ)}`: convergent iff `σ>1/2`.|Pass|None.|
|1625 Convergence, unitary unramified Check|Satake roots of modulus 1, `n=2`|Term size `(a−b+1)q^{−b−(a+b)σ}`; the `b=0` series `Σ(a+1)q^{−aσ}` converges iff `σ>0`; `Z=L(s,π)` by the spherical computation.|Pass|None.|
|1625 Convergence, real Check|`n=1`, `Φ=exp(−πx²)`|`Z=∫exp(−πx²)abs(x)^{s−1}dx=Γ_ℝ(s)`; `s`-derivative integrand `log abs(x)·exp(−πx²)abs(x)^{σ−1}`, integrable at 0 iff `σ>0`.|Pass|None.|
|1625 Domination argument|`x∈(0,1)` and `x≥1`, `σ∈[σ₁,σ₂]`, `k=1`|For `x<1`: `abs(log x)x^σ≤abs(log x)x^{σ₁}≤A x^{σ₁−ε}` since `x^ε abs(log x)` is bounded on (0,1) by `1/(eε)`; for `x≥1`: `≤A x^{σ₂+ε}`. Both exponents exceed `c_π` because `σ₁−ε>c_π`.|Pass|Mathlib lemma shape matches.|
|1721 Level subgroups, `lastRowStabilizer`|`n=1` over `ℤ/3`, `g=[[1,1],[0,1]]` and `[[1,0],[1,1]]`|Last rows `(0,1)` and `(1,1)`: first in the stabilizer, second not; preimage under reduction mod `3ℤ₃` of the first class is the stated `K₁(3)`.|Pass|README description matches the Lean carrier.|
|1841 Global standard function, `n=1` Euler product|Unitary `χ` over `ℚ`, `s` real|`Σ_p abs(χ(p))p^{−s}=Σ_p p^{−s}` converges iff `s>1`; for `n≥2` only a far-right half-plane is asserted here.|Pass|Sharp boundary moved to 2265.|
|1965 Whittaker uniqueness, `ψ`-independence|`GL₃`, characters `ψ(a u₁₂+b u₂₃)`, `a,b≠0`|Conjugation by `diag(t₁,t₂,t₃)` scales `(a,b)` to `(a t₁/t₂, b t₂/t₃)`; choosing `t₂=1`, `t₁=a⁻¹`, `t₃=b` reaches `(1,1)`.|Pass|None.|
|1965 Whittaker uniqueness Checks|`n=1`; trivial character of `GL₂`; Steinberg; unramified `GL₃` principal series|Dimensions 1 (dual of a character), 0 (`ψ_N` nontrivial on `N` while `N` acts trivially), 1, 1; BZ Theorem 5.16 gives `=1` exactly for non-degenerate π.|Pass|None.|
|2078 Tensor factor, unramified formula|Satake roots `(2,3)` and `5`|`∏(1−α_iβ_jT)=(1−10T)(1−15T)`.|Pass|Now stated only for unramified inputs.|
|2086 Ramified quadratic Check|`χ` the nontrivial quadratic character of `ℤ₃^×`, `χ(3)=1`|`L(s,χ)=1`, rootwise product 1; `χ²=1` so `L(s,χ×χ)=(1−3^{−s})^{−1}=3/2` at `s=1`.|Pass|R04 closed; values match my computation.|
|2265 Landau step|Trivial self-pair over `ℚ`; abscissa argument|Log-series `Σ_pΣ_k p^{−ks}/k`, nonnegative, abscissa 1; for real `σ>σ_c` the series is `≥0`, so `L^S(σ)≥1`; continuity gives `L^S(σ_c)≥1≠0`, so the logarithm is holomorphic near `σ_c` and Landau applies.|Pass with gap|R02: state the nonvanishing line.|
|2265 Cauchy–Schwarz step|`k=1` terms, `1<σ′<2σ−1`; `k≥2` terms with `abs(α)<q^{1/2}`|`Σ_v abs(S_{v,1})q_v^{−σ}≤(Σ_v abs(S_{v,1})²q_v^{−σ′})^{1/2}(Σ_v q_v^{−(2σ−σ′)})^{1/2}<∞`; for `k≥2`, `abs(S_{v,k})q_v^{−kσ}≤n q_v^{k(1/2−σ)}` summable for `σ>1`.|Pass|Needs line lists the Satake bound.|
|2270 Pole Check `n=m=1`|`π₁=1`, `π₂=abs(·)^{2i}`|Completed pair `Γ_ℝ(s+2i)ζ(s+2i)`, poles `−2i`, `1−2i`; `π₁∨=1=π₂⊗abs(·)^{−2i}`, so `σ=−2`.|Pass|None.|
|2272 Partial zeta Check|Real `s>1`, `s=1`|Partial `ζ` converges absolutely for `s>1`, diverges at 1 (finitely many factors removed).|Pass|None.|
|2274 `GL₂×GL₁` Check|Cusp form `φ`, character `χ`|`∫_{K^×\𝔸^×}φ(diag(a,1))χ(a)abs(a)^{s−1/2}d^×a` with `φ` rapidly decreasing on the torus: entire.|Pass|None.|
|1827 Satake bound, now consumed at 2265|Unitary unramified `GL₂`, roots `q^{a},q^{−a}`|Closed-boundary convergence at `s=1` forces `1−abs(α_i)²q^{−s}≠0` at `s=1`, i.e. `abs(α_i)<q^{1/2}`; `a=1/2` violates it; local proof, no global input.|Pass|No cycle.|
|Lean namespaces|`#check` of all 33 names|All resolve under the roadmap namespace; `GL2Blueprint.localK1 F c = AL2.newformLocalK1 F 1 c` elaborates.|Pass|None.|

**Rows carried from the previous report** (statements the diff leaves untouched; line numbers as in the previous report at 322ade4, which shift by at most 30 lines here; values are in that report's table):

| Statement (previous report line) | Instances and values | Result |
|---|---|---|
|241 Archimedean Whittaker comparison|carried from r1 (values there)|Pass|
|251 Archimedean parameters|carried from r1 (values there)|Pass|
|261 Restricted tensor realizations|carried from r1 (values there)|Pass|
|271 Isobaric sums|carried from r1 (values there)|Pass|
|281 Finite-part rationality|carried from r1 (values there)|Pass|
|297 Annihilator definition|carried from r1 (values there)|Pass|
|322 Annihilator membership|carried from r1 (values there)|Pass|
|339 Closedness|carried from r1 (values there)|Pass|
|356 Openness|carried from r1 (values there)|Pass|
|373 Vanishing from a period|carried from r1 (values there)|Pass|
|390 Support in period annihilator|carried from r1 (values there)|Pass|
|407 Subgroup indicator|carried from r1 (values there)|Pass|
|424 Coset indicator|carried from r1 (values there)|Pass|
|441 Modulation|carried from r1 (values there)|Pass|
|458 Frequency periods (sample)|carried from r1 (values there)|Pass|
|475 Local constancy|carried from r1 (values there)|Pass|
|492 Compact transform support|carried from r1 (values there)|Pass|
|509 Indicator inversion|carried from r1 (values there)|Pass|
|537 Standard character|carried from r1 (values there)|Pass|
|561 Fractional-ideal trace annihilator|carried from r1 (values there)|Pass|
|578 Self-dual additive measure|carried from r1 (values there)|Pass|
|602 Local additive duality map|carried from r1 (values there)|Pass|
|627 Local self-duality|carried from r1 (values there)|Pass|
|647 Schwartz space/actions/distributions|carried from r1 (values there)|Pass|
|671 Finite Schwartz levels|carried from r1 (values there)|Pass|
|688 Finite Fourier inversion|carried from r1 (values there)|Pass|
|724 Local Fourier inversion|carried from r1 (values there)|Pass|
|741 Finite jets; Lean pointSupported_finiteJet|carried from r1 (values there)|Pass|
|760 Parameter-integral domination|carried from r1 (values there)|Pass|
|800 Vector Poisson/compact estimates|carried from r1 (values there)|Pass|
|822 Partial Fourier transform|carried from r1 (values there)|Pass|
|849 Bessel kernel; Lean BesselK|carried from r1 (values there)|Pass|
|874 Half-order derivative; Lean negativeEi/BesselHalfOrderDerivative|carried from r1 (values there)|Pass|
|897 Bessel–Laplace Mellin; Lean BesselLaplaceMellin|carried from r1 (values there)|Pass|
|928 Quasi-characters/conductor (sample)|carried from r1 (values there)|Pass|
|962 Local Tate integral; Lean localZetaIntegral|carried from r1 (values there)|Pass|
|999 Eigenspaces; Lean inverseScalar/archimedeanEigenSpace|carried from r1 (values there)|Pass|
|1039 Distributions on F×|carried from r1 (values there)|Pass|
|1056 Point-supported eigenvectors|carried from r1 (values there)|Pass|
|1076 Unramified local theory|carried from r1 (values there)|Pass|
|1093 Invariant distribution line|carried from r1 (values there)|Pass|
|1110 Ramified local theory|carried from r1 (values there)|Pass|
|1127 Archimedean standard functions|carried from r1 (values there)|Pass|
|1147 Local uniqueness; Lean finiteEigenSpace_finrank/archimedeanEigenSpace.finrank|carried from r1 (values there)|Pass|
|1171 Fourier action on eigencharacters|carried from r1 (values there)|Pass|
|1191 Epsilon/gamma definition|carried from r1 (values there)|Pass|
|1229 Tate local equation; Lean finite/archimedean FE|carried from r1 (values there)|Pass|
|1251 Distributional equation|carried from r1 (values there)|Pass|
|1268 Gauss sum|carried from r1 (values there)|Pass|
|1301 Explicit epsilon (sample)|carried from r1 (values there)|Pass|
|1316 GL₂ parameter coordinates|carried from r1 (values there)|Pass|
|1339 Canonical archimedean factors|carried from r1 (values there)|Pass|
|1369 Archimedean epsilon (sample)|carried from r1 (values there)|Pass|
|1387 Global factorized eigenline|carried from r1 (values there)|Pass|
|1404 Hecke completion normalization|carried from r1 (values there)|Values agree|
|1440 Canonical rank-one comparison|carried from r1 (values there)|Pass|
|1476 Global distribution epsilon (sample)|carried from r1 (values there)|Pass|
|1507 Hecke continuation; Lean heckeContinuation|carried from r1 (values there)|Pass|
|1515 Hecke factor definitions|carried from r1 (values there)|Pass|
|1541 CM quadratic completion|carried from r1 (values there)|Pass|
|1554 CM gamma logarithmic correction|carried from r1 (values there)|Pass|
|1565 Quadratic orbital Tate comparison|carried from r1 (values there)|Pass|
|1601 Matrix zeta integral|carried from r1 (values there)|Pass|
|1661 Godement–Jacquet equation|carried from r1 (values there)|Pass|
|1678 Spherical matrix test|carried from r1 (values there)|Pass|
|1689 Real self-dual coefficients|carried from r1 (values there)|Pass|
|1700 GL₂ genericity criterion|carried from r1 (values there)|Pass|
|1732 Level existence; Lean newvectorLevelExists|carried from r1 (values there)|Pass|
|1746 Conductor; Lean conductorExponent|carried from r1 (values there)|Pass|
|1768 Casselman dimension; Lean casselmanNewvector|carried from r1 (values there)|Pass|
|1768 K₀ action; Lean casselmanNewvector_k0_character|carried from r1 (values there)|Pass|
|1778 Normalized Whittaker vector|carried from r1 (values there)|Pass|
|1809 Ramified matrix test|carried from r1 (values there)|Pass|
|1820 Satake bound|carried from r1 (values there)|Pass|
|1853 Centered order|carried from r1 (values there)|Pass|
|1861 Paired factorization; Lean PairedHadamardFactorization|carried from r1 (values there)|Pass|
|1865 Nonnegative derivatives; Lean PairedHadamard_derivatives_nonnegative|carried from r1 (values there)|Pass|
|1865 Strict derivatives; Lean PairedHadamard_derivatives_positive|carried from r1 (values there)|Pass|
|1879 Maass standard series|carried from r1 (values there)|Pass|
|1911 Maass functional equation|carried from r1 (values there)|Pass|
|1922 Finite Maass adjoint (sample)|carried from r1 (values there)|Pass|
|1932 Maass Petersson normalization|carried from r1 (values there)|Pass|
|1989 Uniform Whittaker estimates|carried from r1 (values there)|Pass|
|2003 Unequal/equal local RS integrals|carried from r1 (values there)|Pass|
|2035 Local convergence/continuity|carried from r1 (values there)|Pass|
|2073 Normalized induction factors|carried from r1 (values there)|Pass|
|2084 Local RS equation|carried from r1 (values there)|Pass|
|2095 Holomorphic multiples (sample)|carried from r1 (values there)|Pass|
|2106 Unramified RS test|carried from r1 (values there)|Pass|
|2120 Cuspidal Fourier expansion|carried from r1 (values there)|Pass|
|2143 Global Whittaker factorization|carried from r1 (values there)|Pass|
|2161 Ordinary multiplicity one|carried from r1 (values there)|Pass|
|2186 Mirabolic Eisenstein definition|carried from r1 (values there)|Pass|
|2202 Theta–Mellin Check|carried from r1 (values there)|Pass|
|2214 Mirabolic continuation/residues|carried from r1 (values there)|Pass|
|2227 Global RS unfolding|carried from r1 (values there)|Pass|
|2252 Global RS equation|carried from r1 (values there)|Pass|
|2265 Boundary nonvanishing|carried from r1 (values there)|Pass|
|2279 Strong multiplicity one|carried from r1 (values there)|Pass|
|2290 Isobaric multiplicity one|carried from r1 (values there)|Pass|
|2304 Adjacent-rank normalized period|carried from r1 (values there)|Pass|
|2327 Central period factorization|carried from r1 (values there)|Pass|
|2340 L-data|carried from r1 (values there)|Pass|
|2352 Finite-strip boundedness|carried from r1 (values there)|Pass|
|2362 Pinned niceness|carried from r1 (values there)|Pass|
|2372 Eigensystem/RS data|carried from r1 (values there)|Pass|
|2387 Full-rank converse|carried from r1 (values there)|Pass|
|2400 Reduced-rank converse|carried from r1 (values there)|Pass|
|2416 Curve additive analysis|carried from r1 (values there)|Pass|
|2422 Rank-one unramified reciprocity|carried from r1 (values there)|Pass|
|2428 Function-field local factors/converse|carried from r1 (values there)|Pass|
|2438 Ramified reciprocity|carried from r1 (values there)|Pass|
|2448 Curve slopes/HN|carried from r1 (values there)|Pass|
|2458 Polygon semicontinuity|carried from r1 (values there)|Pass|
|2468 Bounded bundle loci|carried from r1 (values there)|Pass|
|2476 Two-leg shtukas|carried from r1 (values there)|Pass|
|2482 Leg-in-level counting|carried from r1 (values there)|Pass|
|2492 Normalized IC purity|carried from r1 (values there)|Pass|
|2510 Shtuka IC/essential comparison|carried from r1 (values there)|Pass|
|2531 Ramified rank induction|carried from r1 (values there)|Pass|
|2539 Essential cohomology (sample)|carried from r1 (values there)|Pass|
|2556 Pure realization|carried from r1 (values there)|Pass|
|2562 Tensor cohomological determinant|carried from r1 (values there)|Pass|
|2567 Weight suite|carried from r1 (values there)|Pass|
|2621 Function-field pair Euler product|carried from r1 (values there)|Pass|
|2651 Cuspidal pair degree/poles|carried from r1 (values there)|Pass|
|2662 Polynomial reflection|carried from r1 (values there)|Pass|
|2686 Open-disc index (sample)|carried from r1 (values there)|Pass|
|2714 Whittaker conductor shift|carried from r1 (values there)|Pass|
|2728 Rational periods/twists|carried from r1 (values there)|Pass|
|2768 L-group determinant|carried from r1 (values there)|Pass|
|2792 Partial-product convergence|carried from r1 (values there)|Pass|
|2806 Parameter transport (sample)|carried from r1 (values there)|Pass|
|2819 Factor operations|carried from r1 (values there)|Pass|
|2838 Exterior factors|carried from r1 (values there)|Pass|
|2849 Motivic centre|carried from r1 (values there)|Pass|
|2875 Finite Euler corrections|carried from r1 (values there)|Pass|
|2899 Correction leading term|carried from r1 (values there)|Pass|
|2915 Complex period/stabilization dictionary|carried from r1 (values there)|Pass|
|2931 Critical value/period|carried from r1 (values there)|Pass|
|2944 Central sign|carried from r1 (values there)|Pass|
|2958 Ordinary interpolation (sample)|carried from r1 (values there)|Pass|
|2984 Conductor/test-vector comparison|carried from r1 (values there)|Pass|

The table has 20 new rows with computed values and 143 carried rows, covering all 15 seeded targets, all 15 admitted theorems and every target a finding touches.

## Not verifiable

- **Godement–Jacquet 1972, Theorems 3.3 and 8.7:** the DOI resolves only to a paywalled Springer page; recorded `uncertified` by the sources service. The theorem numbers agree with the standard citations of the local nonarchimedean and archimedean theory but were not read.
- **Jacquet–Shalika 1981 I:** paywalled; not read. The `Re(s)>1` convergence statement is therefore verified only as stated by Cogdell (p.70), and the roadmap's own proof route was checked instead (R02).
- **Seeded targets outside the changed passages** (modulation, additive duality map, Hecke/eigensystem data, converse theorem, tensor cohomological determinant, function-field pair Euler product, cuspidal pair degrees): their locators were not re-read this round; their calculations carry from the previous report.
- **Ownership against open pull requests** beyond the sibling checkouts in the brief was not re-run; the previous report's search stands.

## Source issues

- none
