# Review of GlobalHolomorphicFunctions (pull request #992 at 9b76a62)

**Verdict:** needs changes

This is a full review of the repaired head. The folder changed by 282 lines since f34a288. The five README and Lean findings of the previous review are repaired and verified below. One P3 finding remains, carried forward from the two previous reviews: the pull-request description.

## R01 (P3) — The pull-request description still declares #886 a dependency and describes files the folder lacks

Re-raised: R06 of the previous review (itself R01 of the review before). Not repaired: the change set touches only `README.md` and `Suggested.lean`.

**Location.** The description of #992 contains:

- "- [ ] depends on: #886";
- "DifferentialGeometry #886 supplies generic forms and finite-cycle Green";
- "`ProductCotangentTargets.lean` supplies eight actual formula definitions and eighteen illustrative theorem targets";
- "twenty-eight intentional proof-target admissions";
- the depends-on block "- [ ] #886 DifferentialGeometry" and the merge-order line "#886 (DifferentialGeometry) → this pull request (#992)".

**Claim.** DifferentialGeometry #886 is a supplier that must merge first, and the folder holds a companion Lean file with 28 admissions.

**Witness.**

- `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:25`–26: "none of these is a target here, and DifferentialGeometry is not a supplier."
- DifferentialGeometry is on main (`TauCetiRoadmap/DifferentialGeometry/README.md`), so #886 is a revision and never a dependency.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.
- The build of `Suggested.lean` gives exactly 22 `sorry` warnings.
- The dependency check prints `0 problem(s)` and lists no open supplier.

**Repair.**

1. Delete the line "- [ ] depends on: #886" and the "#886 DifferentialGeometry" entry of the depends-on block, and the merge-order line naming #886.
2. Delete the DifferentialGeometry, `ProductCotangentTargets.lean`, GH4 paired-cotangent and 28/18-admission passages.
3. Name the suppliers as the README does: ZerosOfLFunctions, AnalyticNumberTheoryPartI and ConformalMapping, all on main.

**Tested.** With the README as it is, the dependency check lists no open pull request, so the depends-on block is empty after the repair.

## Previous findings

- **R01 (P2, 6.4 re-planned ConformalMapping §5.6): repaired.** The supplier contract at `README.md:339`–348 now consumes "§5.3, the Jordan curve theorem, in the pinned Tau Ceti form listed above, and §5.6's `jordan_index_of_isPiecewiseC1On`", with the sign law "σ = +1 is the positive orientation, and reversing γ negates σ". 6.4 at `:1823`–1825 defines "Call γⱼ counterclockwise when its sign in ConformalMapping §5.6 is σ=+1", and `:1832`–1834 reads "The single-curve facts are consumed … The targets here are the hole-index assembly and the trace identification." The *Needs:* line at `:1954`–1956 names §5.3 and §5.6. The Scope paragraph (`:29`–32) assigns ownership the same way. I resolved both sections on main: `Completed/ConformalMapping/README.md:787` (§5.3, `jordan_separation`) and `:906`, `:928` (§5.6, `jordan_index_of_isPiecewiseC1On`, also declared at `Completed/ConformalMapping/Suggested.lean:640`). The six pinned `TauCeti.IsJordanCurve.*` declarations the contract names exist at `TauCeti/Analysis/Complex/PlaneSeparation/Inside.lean:103`, 110, 118, 128, 145 and 177, and say what the README says (listed under Verified sound).
- **R02 (P3, pointwise logDeriv lemma used for a uniform limit): repaired.** `README.md:800`–806 now gives the quotient estimate "`|P_s′/P_s−F′/F| ≤ (2/m)|P_s′−F′| + (2 sup_K|F′|/m²)|P_s−F|` on `K`" with `|P_s|≥m/2` eventually, and says "`Complex.logDeriv_tendsto` is the pointwise case of this estimate and does not by itself give the uniform statement". The *Needs:* line (`:822`–824) lists `TendstoLocallyUniformlyOn.deriv`, `logDeriv_prod` and continuity of the nonzero limit. I checked the estimate: `P′/P − F′/F = ((P′−F′)F + F′(F−P))/(PF)`, and with `|P| ≥ m/2`, `|F| ≥ m` the two terms are bounded as displayed. `logDeriv_prod` is at `Mathlib/Analysis/Calculus/LogDeriv.lean:104` with exactly the hypotheses the README states (factors nonzero and differentiable at the point).
- **R03 (P3, no locator for the classical products): repaired.** `:1618` cites "(DLMF, §4.22, eq. (4.22.2), at the argument `πz`)" for the cosine product, `:1621` "(DLMF, §4.22, eq. (4.22.3), at the argument `πz`)" for the paired cotangent series, `:1632` "(DLMF, §5.8, eq. (5.8.2))" for `1/Γ`, and `:1687`–1691 separates these three from the derived one-sided product, half-integer shift and shifted-sine formula. References (`:2295`–2300) and `sources.toml` (`dlmf-4-22`, `dlmf-5-8`, both `certified`, `institutional`) record DLMF. I read all three equations: dlmf-4-22 line 80 gives `cos z = ∏(1 − 4z²/((2n−1)²π²))`, line 109 gives `cot z = 1/z + 2z Σ 1/(z² − n²π²)` for `z ≠ nπ`; dlmf-5-8 line 79 gives `1/Γ(z) = z e^{γz} ∏(1 + z/k) e^{−z/k}`. The substitution `z ↦ πz` yields the README's displays.
- **R04 (P3, approximation and product targets under 6.4): repaired.** The half-plane, point-normalized, annulus-hull and transfer targets now sit in 6.3 (`:1792`–1833) with their Checks (`:1844`–1845); the half-plane example cites "Rainer, Exercise 22, p. 30 (rainer line 1592), after the substitution `z↦−iz`" (`:1803`–1805), and the transfer theorem cites "Rainer, Theorem 11.1, p. 25 (rainer line 1338), applied to `H`, which is filled in `Ω₂` by Lemma 11.3 (3)–(4)" (`:1823`–1825). 6.3's *Needs:* (`:1850`–1852) lists Layer 2.5's polynomial and rational Runge and Layer 2.1's hull. The `e^z−1` identity moved to 6.2 beside the hyperbolic sine product (`:1709`–1713), derived from `sinh(z/2)` at `z/(2π)`, with the Check at `:1756`–1758. 6.4 keeps `cauchyPompeiu`, the boundary adapter and the disk-moment cross-check only. I verified Exercise 22 at rainer line 1592 (limits 1, −1, 0 on compacta of the right half-plane, the left half-plane and `iℝ`) and that `z ↦ −iz` carries `Im z > 0` to `Re(−iz) = Im z > 0`.
- **R05 (P3, sharp bound only over ℂ): repaired, more generally than requested.** `Suggested.lean:109`–111 now reads `{ι R : Type*} [SeminormedCommRing R] (s : Finset ι) (u : ι → R)`, and `README.md:828`–830 says "Let `R` be a seminormed commutative ring … no condition is put on `‖1‖`". I checked that the induction survives dropping `‖1‖ = 1`: the insertion identity `P_(insert i s)−1 = (P_s−1) + u_i(P_s−1) + u_i` (`:836`) is an algebraic identity (tested on three random complex pairs), and `‖·‖ ≤ (A_s−1)(1+‖u_i‖) + ‖u_i‖ = A_(insert i s)−1` uses only the triangle inequality and `‖xy‖ ≤ ‖x‖‖y‖`, the axioms of `SeminormedRing` (`Mathlib/Analysis/Normed/Ring/Basic.lean:127`). The two new Checks compute: 3-adic `u=(3,3)`: `‖15‖₃ = 1/3 ≤ (4/3)²−1 = 7/9`; the norm `2|z|` on ℂ with `u=(1,1)`: `6 ≤ 8`, while `‖1+u₁‖ = 4 > 3 = 1+‖u₁‖`.
- **R06 (P3, pull-request description): not repaired.** Carried forward as R01 above.

## Verified sound

**Gate, build and Lean form.**

- **Gate.** The worker's gate on 9b76a62 reports every check 0 and ends `OK` (`set_option=0 … build=0 OK`).
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GlobalHolomorphicFunctions'` is empty.
- **Build.** `lake env lean …/Suggested.lean` exits 0 and prints exactly 22 "declaration uses `sorry`" warnings, at lines 51, 72, 91, 109, 129, 141, 154, 172, 182, 191, 199, 213, 225, 238, 250, 267, 276, 287, 304, 312, 320 and 327, and nothing else. Pins: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`.
- **Signatures.** I compared the elaborated `#check @name` output for all 24 declarations (the worker's `signatures.md`, generated from the file as it stands) with the README statements. Each type matches. The file has no `variable` block, so no binder can be lost; the new `[SeminormedCommRing R]` binder appears in the elaborated type.
- **One-tactic probe.** On a scratch copy with every `sorry` replaced by `first | rfl | infer_instance | simp | norm_num | trivial | positivity | aesop`, elaboration gives 22 errors, one per sorried theorem (lines 57, 85, 99, 111, 135, 146, 165, 177, 185, 194, 205, 219, 232, 240, 259, 270, 280, 298, 306, 314, 321, 334 of the copy), so nothing closes in one tactic: no padding.
- **Headlines.** The README's headline theorems (Looman–Menchoff, the sharp bound, the weighted genus-one products, Runge with the hull equality and the finite-rank operator, zero-free approximation, divisor realization, boundary noncontinuation, Mittag–Leffler and isolated singularities, the quotient, Cauchy–Pompeiu on a cycle, the ∂̄ solver with closed completion in scalar and form versions, two-form exactness, `H²_dR = 0`, Cousin I) are all stated. `IsRungeCompactPair` and `holomorphicHull` have real bodies on native carriers. The docstring says every headline is statable at the pins, and none is forced through a stand-in.
- **Imports.** `import Mathlib` plus five `TauCeti.*` modules, each present at the pin. No `set_option`, no `lemma`, no sorry'd data.

**Dependency check.** The brief's command printed:

```text
depcheck: 235 roadmaps, 2259 edges, 0 problem(s)
```

The merge order has ZerosOfLFunctions at 48, AnalyticNumberTheoryPartI at 50 and this roadmap at 97. ConformalMapping is completed on main. No UPWARD, CYCLE or `moved:` line.

**Library declarations opened at the pins this round (14).**

| Declaration | Location | What it says |
|---|---|---|
| `IsJordanCurve.filledHull_sdiff_eq_connectedComponentIn` | `PlaneSeparation/Inside.lean:103` | for `x ∈ filledHull C \ C`, that set is `connectedComponentIn Cᶜ x` |
| `IsJordanCurve.isConnected_filledHull_sdiff` | `:110` | inside connected |
| `IsJordanCurve.frontier_filledHull_sdiff` | `:118` | `frontier (filledHull C \ C) = C` |
| `IsJordanCurve.frontier_filledHull` | `:128` | `frontier (filledHull C) = C` |
| `IsJordanCurve.closure_filledHull_sdiff` | `:145` | `closure (filledHull C \ C) = filledHull C` |
| `IsJordanCurve.connectedComponentIn_eq_filledHull_sdiff_or_compl` | `:177` | every complementary component is the inside or `(filledHull C)ᶜ` |
| `Contour.Cycle.trace` | `Contour/Cycle/Basic.lean:198` | union of generator images over the support (nonzero coefficient) |
| `Contour.Cycle.windingNumber` | `:426` | `Cycle →+ ℂ`, additive |
| `Contour.Cycle.windingNumber_of_raw` | `:431` | one-generator cycle has the raw `Contour.windingNumber γ a b` |
| `Contour.Cycle.trace_add_subset` | `:247` | trace of a sum inside the union; cancellation possible (6.4's "every generator keeps coefficient ±1" addresses it) |
| `Contour.Cycle.green_winding` | `Green/Cycle.lean:36` | open `U`, `IsIn C U`, `C¹` fields, `IsNullHomologous C U` |
| `logDeriv_prod` | `Mathlib/Analysis/Calculus/LogDeriv.lean:104` | finite-product rule at a point, factors nonzero and differentiable |
| `Complex.logDeriv_tendsto` | `LocallyUniformLimit.lean:201` | pointwise limit at one `x ∈ s` |
| `SeminormedCommRing` | `Normed/Ring/Basic.lean:127` | `SeminormedRing` + `CommRing`; no `NormOneClass` |

No Jordan index theorem exists at the Tau Ceti pin under any name (grep for `windingNumber` with `IsJordanCurve`/`InjOn` in `Contour/Winding`, `PlaneSeparation`, `Green`), so citing ConformalMapping §5.6 is the right owner.

**Cross-roadmap citations resolved (6).**

- **ConformalMapping (Completed, on main).** §5.3 `jordan_separation` at `Completed/ConformalMapping/README.md:787`–809; §5.6 `continuous_jordan_index` and `jordan_index_of_isPiecewiseC1On` at `:906`–936, with the sign laws "`σ` is `+1` iff … the positively oriented parametrization" and "Reversal of `γ` negates `σ`"; the Lean name at `Completed/ConformalMapping/Suggested.lean:640`. The README's restatement (`:339`–348) matches.
- **ZerosOfLFunctions on main**, `README.md:927`–979: Layer 5.1 zeros, 5.2 elementary factor, 5.3 canonical product, 5.4 entire logarithm.
- **AnalyticNumberTheoryPartI on main.** §0.15 at `README.md:530` with the fibre-grouping law at `:537`; `elementaryFactor` at `Suggested.lean:346`, `exists_entire_primary_product_exact` at `:351`, `exists_entire_exp_mul_of_divisor_eq` at `:363`.
- **ComplexKahlerGeometry #1234** cites this roadmap as a consumer only (`README.md:35`, `:264`–267, `:489`–491, `:510`).
- **DifferentialGeometry #886** at its head mentions Jordan curves only in a Green-theorem specialization list (`README.md:2399`, "rectangle, square, smooth Jordan, finite-hole … specializations") and owns no Cauchy–Pompeiu, Runge, Cousin or ∂̄ object.
- `roadmaps resolve` and `citations.md`: no unresolved citation or Lean name.

**Ownership against open pull requests.** `roadmaps grep` over the 457 open pull requests and main: `Looman` and `IsRungeCompactPair|Runge pair` hit only #992; `holomorphicHull|holomorphic hull` hits #992, RealAnalyticGeometry on main (Stein-space holomorphic convexity, a different object) and ComplexComparisonPartII #848 (a consumer sentence); `Pompeiu` hits on main are PseudoholomorphicCurveAnalysis and DGFloer consuming Tau Ceti's Cauchy transform, not a cycle formula; `Cousin` hits elsewhere are scheme-theoretic Cousin complexes; `Mittag` hits elsewhere are Mittag-Leffler conditions on inverse systems. `overlaps.md` lists no pull request that changes this roadmap, no dropped id and no revision-only id; the closest roadmaps by vocabulary (#886, #1807/#1808/#1854 ComplexKahlerGeometry) own none of these objects.

**Sources: the seeded sample.** Rainer's printed page is the PDF page minus 6. Every cited line was read this round.

| Target | Locator in README | Text at the locator | Verdict |
|---|---|---|---|
| 0.1 | Rainer §10, (10.1), p. 23 (rainer 1211) | `∮_∂U g dζ = 2i ∬ g_ζ̄ dξ dη` convention, `U` on the left of `∂U` | correct |
| 0.2 | gray-morris Thm 3, p. 247 (66); Appendix, Lemma 1, pp. 252–253 (310–325) | partials exist everywhere, CR everywhere, `f` continuous on a domain ⇒ analytic; Lemma 1's `5N·m(R−E)` bounds | correct; the README's balanced-rectangle restriction repairs the source gap recorded below |
| 1.3 | Remark 15.4, p. 38 (2030) | defines `E_p` | supports the factors; genus and `p_n = n−1` derived from §0.15 |
| 1.4 | proof of Prop. 14.2, p. 35 (1843–1853) | `∏(1+a_n)−1` is a sum of monomials; the absolute-value product is the same sum | correct, for complex numbers as the Lean docstring says |
| 1.5 | Thm 14.3, pp. 35–36 (1868) | `Σ|f_n|` uniformly convergent on compacta ⇒ partial products converge | correct |
| 2.1 | Lemma 11.3 (1),(2),(4), pp. 27–28 (1437) | distance, convex hull, compact and idempotent | correct |
| 2.3 | §11, p. 25 (1333) | `O(K)` defined; "in general it is not closed" | correct |
| 2.4 | native interval-integral bound | — | derived, as stated |
| 2.5 | Thm 11.1, p. 25 (1338); Thm 11.7, p. 29 (1550); Lemma 11.3(3) | (1)⇔(2); rational Runge with poles in compact complementary components; hull = `K` ∪ relatively compact components | correct |
| 3.1 | Lemma 15.1 (1934), Prop. 15.2 (1950), Thm 15.3 (1997) | logarithm of `(z−a)/(z−b)`; zero-free approximation under `K = K̂_U`; Weierstrass | correct |
| 3.3 | Thm 15.5, p. 39 (2086) | region, natural boundary via locally finite disks | correct; README strengthens, as it says |
| 4.1 | Thm 12.1 (1603), Thm 15.7 (2126), Thm 15.6 (2116) | singular parts in `H(ℂ*_a)`; punctured germs with an order; quotient | correct |
| 6.1 | DLMF (4.22.2), (4.22.3), (5.8.2) | read at dlmf-4-22 lines 80, 109 and dlmf-5-8 line 79 | correct |
| 6.2 | derived from 1.5 and the sine product | `e^z−1 = 2e^{z/2} sinh(z/2)` | correct |
| 6.4 | Prop. 10.1, p. 23 (1216) | bounded domain, boundary finitely many simple closed `C¹` paths, `f ∈ C¹(Ū)` | correct; `dζ∧dζ̄ = −2i dA` turns `+(2πi)⁻¹∬` into `−π⁻¹∫` |
| 7.1 | Thm 12.2, p. 31 (1630) | `∂u/∂z̄ = f` solvable for `f ∈ C^∞(U)` | correct |
| Conventions | Notation, p. v (rainer 81) | "A domain is a nonempty open subset" | correct |

**Adversarial pass.** S = `Suggested.lean`, R = `README.md`. Values computed this round with a pure-Python script (truncated products at `N = 2·10⁵`, midpoint quadrature, 20 000-step winding sums).

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| S Looman–Menchoff (0.2) | `z`; `z̄`; `exp(−z⁻⁴)` with `f(0)=0`; `Ω=∅` | `fy = i·1 = i` (holds); `−i ≠ i` (excluded); `|f| = 11.49, 2244, 8.89·10⁶` at `r = 0.8, 0.6, 0.5` on `arg = π/4` (excluded by `hcont`); vacuous | Pass | none |
| R 0.2 balanced estimate | `R = [0,20]×[0,1]`, `E = {(0,0),(20,1)}`, `N = 1`, `φ = y(20−x)c(x)` with a smooth cutoff `c`, `c(0)=0`, `c=1` on `[0.01,20]` | increment hypotheses hold at both points of `E` (checked on 20 000 random `(ξ,η)`); `∫_0^20 (φ(x,1)−φ(x,0)) dx = 199.90` while `5N·m(R∖E) = 100`, so the unrestricted lemma fails; with `w_R ≤ 2h_R` the empty-slice bound `N(2w_J+h_J) ≤ 5N h_R` holds, which is the README's restriction | Pass | none (source issue) |
| R 0.3 transform | radial cutoff; unit disk | `∫ φ′ = −1 = −φ(0)`; `∫_{|ζ|≤1} |ζ|⁻¹ = 2π` | Pass | none |
| R 1.1 derivatives | `E₂′(−1)`, `E₀′`, `E₁′(1)` | `−e^{−1/2}` both ways; `−1`; `−e` | Pass | none |
| S `exists_entire_genusOne_product` | `S=∅`; `S={1}, m=2`; `S={2}, m=0` | `F=1`; `(1−z)²e^{2z}`, order 2, majorant `2R²`; factor 1, order 0 | Pass | none |
| S `…_of_divisor` | `D=0`; `2[1]`; `[1]−[2]` | `F=1`; divisor 2 at 1; excluded by `hD` | Pass | none |
| S sharp bound (1.4) | ℂ `(1,1)`; `(−1,0)`; `∅`; ℤ₃ `(3,3)`; norm `2|z|` `(1,1)` | `3 ≤ 3` (exp bound 6.389); `1 ≤ 1`; `0 ≤ 0`; `1/3 ≤ 7/9`; `6 ≤ 8` with `‖1+u₁‖ = 4 > 3`; insertion identity holds on 3 random pairs | Pass | none (R05 repaired) |
| R 1.3 logDeriv | `P_N = ∏(1−z²/n²)`, `|z| = 1/2` | `sup|logDeriv P_N − (π cot πz − 1/z)|` = 0.0952, 0.00995, 0.000999 at `N = 10, 100, 1000`: uniform, `O(1/N)` | Pass | none (R02 repaired) |
| R 1.3 genus | `aₙ = n`; `2ⁿ` | genus 1; genus 0, tail from `N=2` at `R=1` is `0.5 = 2^{1−N}` | Pass | none |
| R 1.5 | `X=ℕ`, `uₙ = [x=n]/(n+1)`; `u₀ ≡ −1` | tail `1/(N+1)` while `Σ sup` is harmonic; product 0, order ∞ | Pass | none |
| S `IsRungeCompactPair` | `(∅,∅)`; circle in ℂ; `{2≤|z|≤3}` in `D₄`; same in `{1<|z|<4}` | true; false; false; true | Pass | none |
| S `holomorphicHull` | `K=∅`, `f=0`, `B=−1`; annulus in `{1<|z|<4}` at 1.5 | `∅`; `|1/1.5| = 0.667 > 0.5`, excluded | Pass | none |
| S `holomorphicHull_eq_fill` | `K=∅` in the unit disk; circle in ℂ; annulus in `D₄` | RHS `∅` (a component with compact closure inside `Ω` would be clopen in ℂ); closed disk both sides; closed 3-disk both sides | Pass | none |
| R 2.1 stages | unit disk | `K₀={0}`, `K₁ = {|z|≤1/2}`, `K₂ = {|z|≤2/3}`; `0 ∈ int K₁` | Pass | none |
| R 2.2 metric | constants `1/(n+1)` | `d = 1/3, 1/6, 1/11 = 1/(n+2)` at `n = 1, 4, 9` | Pass | none |
| R 2.3 `O(K)` | `{0}`; `{0,1}`; `εz̄` | `O=ℂ`, germs infinite-dimensional; `a+(b−a)z`; `∂̄ = ε ≠ 0` | Pass | none |
| S Runge equivalence | annulus in `D₄` with `1/z`; disk in `D₂`; `K=∅` | `∮_{|z|=5/2} = 2πi` vs 0: both sides false; both true; both true | Pass | none |
| S finite-rank operator | `K=∅`; `K={0}`, `U=Ω=ℂ`; `f=0` | `L=∅, N=0`; `N=1, ζ=0, w=1, g=1`, error 0; `0 ≤ 0` | Pass | none |
| R 2.5 pole step | `dist > 2δ`, `|a−b| < δ` | ratio `< 1/2` | Pass | none |
| S zero-free approximation | `K={1≤|z|≤2}`, `Ω=ℂ∖{0}`, `u=z−1/2` | `G_N(1) = 0.606531, 0.513417, 0.500041, 0.5000000000146` at `N = 1, 3, 10, 30`, toward `u(1) = 0.5`; `G_N = z·exp(L_N)` nowhere zero | Pass | none |
| R 3.1 pairing Check | `(z−1/2)/(z−3)` vs `(z−1/2)/z` on `|z|=3/2` | winding 1 vs 0 | Pass | none |
| S zero orders | `m=0`; `2[2]`; `Ω=∅` | `f=1`; `(z−2)²`; vacuous | Pass | none |
| S signed divisor | `2[0]−[1]`; two disks, `ν=0` | `z²/(z−1)`, orders 2, −1; `f=1`; `f≡0` excluded | Pass | none |
| S boundary germ (3.2) | `Ω=∅`, ℂ; disk with zeros `1−1/n`; `Ω=ℂ∖{0}`, `ξ=0` | frontier `∅`; zeros accumulate inside the branch, `F≡0` near `ξ` against `f≠0` on `C∖E`; punctured disk connected, same contradiction | Pass | none |
| R 3.3 stages | levels `n ≥ m` in `D_m` | `dist(z_{n,j}, Ωᶜ) < 1/n ≤ 1/m`, 0 points | Pass | none |
| S Mittag–Leffler | `E=∅`; `2/z`; `i=j=k` in the cocycle | `f=0`; `f=2/z`, remainder 0 | Pass | none |
| S isolated singularities | `exp(1/z)`; `1/z + 1/(z−1/2)` on `ball(0,1/2)` | remainder 0; remainder `−1/(z−1/2)`, analytic at 0 | Pass | none |
| S quotient | `F=1/z`; `F≡0`; `Ω=∅` | `f=1, g=z`; `f=0, g=1`; vacuous | Pass | none |
| R 6.1 products | cos at `0.3+0.1i`; `1/Γ(1/2)`; `π cot(πi)`; shifted sine at 3 points | `0.6170306−0.2583616i` vs `0.6170310−0.2583616i`; `0.5641896` vs `0.5641899`; `−3.153348i` vs paired `−3.153338i` (`N=2·10⁵`), `S₁ = 1.076669` vs `1.076674`; `|LHS−RHS| = 1.8·10⁻⁶, 2.6·10⁻⁵, 1.5·10⁻⁵` | Pass | none (R03 repaired) |
| R 6.2 theta | `r=0.4`, `z=0.2+0.7i` | ratio `1.5654995−1.3186021i = r⁻¹e^{−z}` | Pass | none |
| R 6.2 `e^z−1` | `z=1.3−0.4i`; `z=2πi`; wrong `π²` at `πi` | `2.3796460−1.4288914i` vs `2.3796458−1.4288908i`; factor `n=1` is 0 and `e^z−1 = 0`; factor 0 while `e^z−1 = −2` | Pass | none (R04 repaired) |
| R 6.3 crescent | `−1/2`; `−0.99`; `0.9`; `0.5+0.6i` | in; in; out (`|2z−1| = 0.8`); in | Pass | none |
| R 6.3 point-normalized | `n=1` | `(1/2)/(1−1/2) = 1`; `|Q(0)| ≥ 1−1/(n+1) = n/(n+1)` | Pass | none |
| R 6.3 half-plane | `z ↦ −iz` | `Im z > 0 ⇔ Re(−iz) > 0` | Pass | none |
| R 6.3 transfer | annulus `2≤|z|≤3`, `Ω₁=D₄`, `Ω₂=D₄∖D̄₁` | `K̂_{Ω₁} = D̄₃`, `K̂_{Ω₂} = K` (the component `1<|z|<2` touches `|z|=1 ∉ Ω₂`) | Pass | none |
| S `cauchyPompeiu` | `f=|z|²`, `ξ=0.3`, unit circle | boundary `1.0000000`; area `0.9099981`; difference `0.0900019` vs `f(ξ) = 0.09` | Pass | none |
| R 6.4 adapter | annulus `1<|z|<2`, both curves `σ=+1` | `n₀−n₁ = 0, 0, 1, 0` at `0, i/2, 3/2, 3`; clockwise inner gives `−1` | Pass | none (R01 repaired) |
| R 6.4 trace identification | `Δ = D₀ ∖ ⋃ closure(Dⱼ)` | each `Cⱼ` misses `Δ` and lies in its closure (holes compact in open `D₀` at positive distance); a point of `∂Δ` off `C₀` lies in `D₀`, in some `closure(Dⱼ)`, not in `Dⱼ` | Pass | none |
| R 6.5 residues | `π cot πz` at 0; double zero | 1; 2 | Pass | none |
| S ∂̄ solver | `z̄` at `0.7−0.4i`; `z`; `z e^{−|z|²}` at 1 | `1.4+0.8i = 2f`; `1.4−0.8i = 2f`; `0.7357589 = 2e⁻¹` | Pass | none |
| S closed completion | `f=z`, `g=z̄` | `g_x + i g_y = 2 = f_x − i f_y` | Pass | none |
| S completion form; two-form exactness | `f=z, g=z̄`; `dz∧dz̄`; `dx∧dy` on `(1,i)` | `dz̄∧dz + dz∧dz̄ = 0`; `−2i` with `β = −z̄ dz`; `1` with `β = (x dy − y dx)/2` | Pass | none |
| S `H²_dR` vanishing | `U=∅`; ℂ; circle as contrast | zero form; `[dx∧dy] = 0`; on `S¹` every one-form is closed yet `H¹ = ℝ` | Pass | none |
| S Cousin I | `c₁₂=1`; one set; empty cover; `i=j=k` | `b=(1,0)`; `3c₁₁ = 0`; vacuous; antisymmetry `c_ji = −c_ij` follows | Pass | none |
| R 7.3 | `d(iz²)`, `d(i|z|²)` at 1 and `i`; `d|z|⁴` at 2; log-square at 2; moments | `2i, 2i`; `−2, 0`; `32`; `log 2` both sides; `π, 0, π/2` | Pass | none |

The table has 44 rows. They cover the 15 sampled targets, all 22 theorems and both definitions of `Suggested.lean`, and every passage the repairs changed.

## Not verifiable

- None. Both texts recorded as the roadmap's sources and the two DLMF sections were read at every sampled locator from the sources cache.

## Source issues

- **Error** in gray-morris at Appendix, Lemma 1, p. 253: the source says the bound `5N·m(R−E)` holds for every closed rectangle `R`; it should be restricted to rectangles of bounded side ratio (on `[0,20]×[0,1]` with `E = {(0,0),(20,1)}`, `N = 1` and `φ = y(20−x)c(x)` for a smooth cutoff `c` vanishing at 0, the left side is 199.9 and the right side 100); affects the proof.
- **Gap** in gray-morris at Appendix, proof of the Looman–Menchoff theorem, p. 253: the source says Baire is applied to `E` as a complete metric space; it should be applied to `E` as a locally compact space, since `E` is only relatively closed in `D`; affects the proof.
- **Gap** in rainer at proof of Proposition 15.2, p. 37: the source says Lemma 15.1, stated for a domain whose complement joins `a` and `b`, applies on an unnamed neighbourhood of `K`; it should be applied on `ℂ∖P` for a path `P` from `b` to `a` in `V_j`; affects the proof.
- **Misprint** in rainer at proof of Proposition 15.2, p. 37: the source says the final error is below `2ε` while the proposition asserts `ε`; it should be run with `ε/2`; affects nothing.
- **Misprint** in rainer at proof of Theorem 14.3, p. 36: the source says `f_N` converges uniformly; it should be the partial products `p_N`; affects nothing.
