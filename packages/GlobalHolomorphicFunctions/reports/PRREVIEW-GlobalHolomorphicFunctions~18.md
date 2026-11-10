# Review of GlobalHolomorphicFunctions (pull request #992 at 8f130d7)

**Verdict:** needs changes

This is a full review: the folder changed by 178 lines since `dac43fb`. There is one blocking finding (P2) and there are two P3 findings. The P2 finding is the part of the previous review's R01 that is still open.

## R01 (P2) — ComplexKahlerGeometry at the head of #1234 still owns three objects this roadmap owns

**Location.** `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:74`–77: "ComplexKahlerGeometry K2 owns parameter-dependent solvers … they consume this roadmap's scalar results (… the finite-rank Runge operator of Layer 2.5) and the complex two-form exactness of Layer 7.2." The same claim appears at `:2519`–2523 (Downstream consumers).

**Claim.** ComplexKahlerGeometry consumes these objects from this roadmap and does not own them:
- the finite-rank Runge operator of 2.5 (`exists_finite_rank_runge_operator`, `Suggested.lean:177`);
- the scalar solver of 7.1 (`exists_smooth_conjWirtingerDeriv_eq`, `:290`);
- the complex two-form exactness of 7.2 (`exists_mextDeriv_eq_complex_two_form`, `:327`).

**Witness.** In #1234 at its new head `e86d496`:
- `README.md:598`–599 says "The finite-rank operator and its estimate are this roadmap's own".
- `:612`–613 says "Prove Runge's theorem for (Ω,K) in the form used here", by pole pushing.
- `:1935` says "passage from the scalar solver to two-forms is this roadmap's own".
- No line of that README cites GlobalHolomorphicFunctions.

**What changed since the last review.** The fourth row of the previous R01 is resolved. Layer 0.4 no longer claims the principal-part coefficient comparison. `:78`–81 cede it to K3, and #1234's K3 (`README.md:909`–923) owns it from Tau Ceti's `circleLaurentCoeff` and `meromorphicGerms.principalPart`, so neither side states it twice.

The other three rows are unchanged:

| This roadmap | #1234 at e86d496 |
|---|---|
| 2.5 `exists_finite_rank_runge_operator`, with Runge by pole pushing | K2.FiniteRankRunge (`README.md:591`–623): the same collar, the same bound `sup_K‖f−Af‖ ≤ ε sup_L‖f‖`, and its own Runge proof |
| 7.1 `exists_smooth_conjWirtingerDeriv_eq` | K2's `exists_mixed_parameter_dbar_solution` with P and Q points, the "scalar case" (`:644`) |
| 7.2 `exists_mextDeriv_eq_complex_two_form` | K5a.PlanarTwoForms (`:1926`–1937) |

`roadmaps grep -i 'finite-rank Runge'` still lists two owners: #992, and #1234 at `README.md:44` and `:591`. Whichever pull request merges second leaves two owners.

**Repair.** Option (b) of the previous review is not open to this pull request. #1234 revises a roadmap that is on main, so its K2.FiniteRankRunge and K5a.PlanarTwoForms cannot be cited as suppliers. On main, ComplexKahlerGeometry consumes all three from here (main `README.md:35`, `:199`–200, `:1637`). So this roadmap is the owner and keeps the three targets; its README needs no change. Two things remain:
- **In #992's description**, record: "#1234 (ComplexKahlerGeometry) is rebased on this pull request and merges after it. It restores main's citations of Layer 2.5's finite-rank operator, Layer 7.1's scalar solver and Layer 7.2's complex exactness."
- **In #1234**, replace three things with citations of Layers 2.5, 7.1 and 7.2: K2.FiniteRankRunge's own operator and Runge proof, the point case of its solver as K5a's scalar input, and K5a.PlanarTwoForms' "this roadmap's own" passage.

**Test.** `roadmaps grep -i 'finite-rank Runge'` should then show #1234 only as a consumer.

## R02 (P3) — 6.5's residue derivation applies the zero factorization to poles

**Location.** `README.md:2202`–2205: "at a pole of order `m` one with residue `−m`, since `f(z)=(z−a)^m g(z)` with `g` holomorphic and nonzero near `a` gives `f′/f = m/(z−a) + g′/g`".

**Claim.** The displayed factorization proves both residues.

**Witness.** For `f = 1/(z−1)²`, a pole of order 2, `f′/f = −2/(z−1)`. The contour integral gives residue −2.0000000.
- The cited factorization with `m = 2` describes a double zero, and it yields +2.
- Rainer treats the pole case separately (rainer lines 963–964).

**Repair.** Replace the clause after "since" with: "`f(z)=(z−a)^k g(z)`, with `k=m` at a zero of order `m` and `k=−m` at a pole of order `m`, and `g` holomorphic and nonzero near `a`, gives `f′/f = k/(z−a) + g′/g`". Add a Check: "`f=1/(z−1)²` has `f′/f=−2/(z−1)`, residue −2; the zero formula would give +2."

**Tested.** On `1/(z−1)²` the repaired formula with `k = −2` gives −2, which matches the computed −2.0000000. On `(z−1)²(z+2)` it gives 2, which matches the computed 2.0000000.

## R03 (P3) — The pull-request description still declares #886 a dependency and describes files the folder lacks

This is R08 of the previous review. The description has not changed.

**Location.** The description of #992 contains:
- "- [ ] depends on: #886";
- "`ProductCotangentTargets.lean` supplies eight actual formula definitions";
- "twenty-eight intentional proof-target admissions";
- the merge-order line "#886 (DifferentialGeometry) → **this pull request** (#992)".

**Witness.**
- `README.md:27` says "DifferentialGeometry is not a supplier".
- DifferentialGeometry is on main (`TauCetiRoadmap/DifferentialGeometry`), so #886 is a revision and never a dependency.
- The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- The build gives 23 `sorry` warnings.

**Repair.**
- Delete the #886 task line; the depends-on and merge-order blocks are generated from it.
- Delete four passages: those on `ProductCotangentTargets.lean`, the "GH4 paired-cotangent proof", the 28/18 admission counts, and the ZerosOfLFunctions #253 coordination paragraph. #253 and #953 are not open pull requests.
- Name the suppliers as the README does: ZerosOfLFunctions, AnalyticNumberTheoryPartI and ConformalMapping, all on main.
- Add the #1234 order of R01.

**Test.** The dependency check below reports `0 problem(s)`, so after the repair the depends-on block is empty.

## Previous findings (review of `dac43fb`), finding by finding

- **R01 (P2), ComplexKahlerGeometry #1234 overlap: partly repaired.** The K3 row is repaired: `README.md:78`–81 now reads "K3 owns … the identification of the negative Laurent coefficients of a finite-pole germ, and so of the coefficients of its finite principal part, with the circle coefficients of Layer 0.4". The 2.5, 7.1 and 7.2 rows are open; this is R01 above.
- **R02 (P2), Laurent headline: repaired.**
  - `Suggested.lean:68` states `exists_laurent_decomposition` as proposed, and `:7` imports `TauCeti.Analysis.Complex.Laurent.Basic`.
  - The module docstring (`:13`–14) and 0.4 (`README.md:781`–786) name it.
  - The file elaborates.
- **R03 (P3), RealAnalyticGeometry: repaired.** `README.md:69`–73 now reads "RealAnalyticGeometry R3.2 (item 1) owns scalar Cousin I … taking Layer 7.4 from RealAnalyticGeometry would be circular". I checked this against main `RealAnalyticGeometry/README.md:811`–812.
- **R04 (P3), polynomial hull: repaired.**
  - The From Tau Ceti contract is at `README.md:296`–303.
  - The comparison target is at `:1143`–1155.
  - The 2.5 specialization is at `:1385`–1394.
  - Two Checks are at `:1180`–1185.
- **R05 (P3), wedge comparison: repaired.** The sentence is deleted from 2.4 (`README.md:1345`–1347).
- **R06 (P3), locators: repaired.** 6.5 now cites "Rainer, Theorem 8.2 and its proof, pp. 18–19, rainer lines 941 and 963" (`:2205`). 7.2 cites "Rainer, Theorem 12.2, p. 31, rainer line 1630" (`:2372`–2374). The added 6.5 sentence carries the slip of R02.
- **R07 (P3), direction of `z↦−iz`: repaired.** `README.md:2030`–2032 now reads "the map `z↦−iz` carries the upper and lower half-planes and the real axis onto the right and left half-planes and the imaginary axis (at `z=i`, `−iz=1`)".
- **R08 (P3), description: not repaired.** It is carried as R03.

## Verified sound

### Gate, build and Lean form

- **Gate.** I ran it myself on 8f130d7. It ends with every counter at 0 and `OK`, and exits 0 in 4.2 s. The worker's run, which includes the targeted build, also reports that every check passed.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GlobalHolomorphicFunctions'` is empty.
- **Build.** `lake env lean` on `TauCetiRoadmap/GlobalHolomorphicFunctions/Suggested.lean` exits 0 in 4.6 s. The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. The only messages are 23 "declaration uses `sorry`" warnings, at lines 53, 68, 95, 114, 132, 152, 164, 177, 195, 205, 214, 222, 236, 248, 261, 273, 290, 299, 310, 327, 335, 343 and 350.
- **Signatures.** A scratch copy with `#check @name` for all 25 declarations elaborates.
  - Every elaborated type keeps its binders: `[SeminormedCommRing R]`, `[Countable ↑S]`, `hr₁`, `hρ₁`, `hρ₂`, `hRunge`, `hU`, `hKU`, `hEΩ`, `hE`, `hbounded`, `hclosure`, `htrace`, `hindex`, `hcover` and `hcycle`.
  - Each type matches its README statement in generality, including the new Laurent headline (`f : ℂ → ℂ`, `0 ≤ r₁`, `r₁ < ρ`, `ofReal ρ < r₂ ≤ ∞`).
  - There is no change from `scratch/signatures.md`.
- **One-tactic probe.** I replaced every `sorry` by `first | rfl | infer_instance | (simp; done) | trivial | sorry`. All 23 theorems still warn.
  - None restates a definition, mirrors a Check or treats a boundary case.
  - The closed completions and `subsingleton_deRhamCohomology_two` are short corollaries, but the Summary lists them, and they are not padding by this test.
- **Form.**
  - Imports: `import Mathlib` plus six `TauCeti.*` modules, all present at the pin.
  - No `set_option`, `lemma`, sorry'd data, `#eval` or `True` placeholder.
  - `IsRungeCompactPair` and `holomorphicHull` have real bodies.
  - Every Lean name occurs in the README.
- **Headlines.** I took them from the Summary and the Scope ownership statements. All are stated:
  - Looman–Menchoff;
  - the Laurent decomposition (new);
  - the sharp product bound;
  - both genus-one products;
  - Runge, the hull equality and the finite-rank operator;
  - zero-free approximation and both divisor realizations;
  - noncontinuation;
  - Mittag–Leffler, isolated singularities and the quotient;
  - Cauchy–Pompeiu;
  - the solver and both closed completions;
  - complex and real exactness and `H²_dR = 0`;
  - Cousin I.

  The one-variable polynomial-convexity equivalence of 2.5 is a specialization, not a headline.

### Dependency check

```text
depcheck: 235 roadmaps, 2268 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The merge order places GlobalHolomorphicFunctions at line 97, after ZerosOfLFunctions (48) and AnalyticNumberTheoryPartI (50). ConformalMapping (`Completed/`), Hyperfunctions, RealAnalyticGeometry and ComplexKahlerGeometry are on main.

### Seeded source sample (15 targets)

All four sources are cached and `certified` in `sources.toml`; none is flagged unverified. Page offsets:
- Rainer's printed page is the PDF page minus 6.
- Gray–Morris's PDF page 1 is p. 246.

| Target | Locator in the README | Checked at | Result |
|---|---|---|---|
| 0.2 Looman–Menchoff | Gray–Morris Thm 3, p. 247; App. Lemma 1, pp. 252–254 | gray-morris lines 66–70, 310–325 | Correct. The hypotheses are (i)–(iii) on a domain, and the claim is local. Lemma 1 is false as printed (Source issues); the README adds continuity and the aspect ratio `1/2 ≤ w/h ≤ 2`. |
| 0.3 Cauchy–Green | Rainer Thm 10.2, pp. 23–24; Thm 10.3, p. 24 | rainer 1255–1280, 1295–1301 | Correct. (10.4) and (10.6) give the README's `T` and cutoff sign. |
| 0.4 Laurent | L7.1, C7.2 p. 14; L7.3 pp. 14–15; T7.4, C7.5 p. 15; T7.6 p. 16 | rainer 674, 682, 692–697, 716, 754–768, 790–799 | Correct. The coefficient formula `(2πi)⁻¹∮f/(ζ−c)^(n+1)` is `circleLaurentCoeff`, and C7.5's uniqueness needs `f₋→0`. |
| 1.1 primary-factor derivatives | Remark 15.4, p. 38 | rainer 2030–2035 | Correct; this is the definition of `E_p` that is differentiated. |
| 2.1 hulls | L11.3 (1), (2), (4), pp. 27–28; Thm 12.1 proof, p. 31 | rainer 1437–1486, 1609–1611 | Correct. The README's direct compactness route also holds: points of the hull stay at distance ≥ dist(K,Ωᶜ) from Ωᶜ. |
| 2.2 metric | §11, (11.2), Exercises 19–20, p. 25 | rainer 1313–1332 | Correct. |
| 3.1 divisors | L15.1 p. 36; P15.2, T15.3 pp. 36–38 | rainer 1934, 1950–1993, 1997–2029 | Correct. The first route makes Lemma 15.1's domain explicit (the gap in Source issues). |
| 3.2 boundary zeros | Thm 15.5, p. 39 | rainer 2086–2107 | Correct for a region; the README strengthens it to meromorphic germs on every component. |
| 4.1 singular germs | T12.1 p. 31; T15.7 pp. 39–40; T15.6 p. 39 | rainer 1603–1606, 2126–2136, 2116 | Correct. T12.1 takes `p_a ∈ H(ℂ∖{a})`, as the README says. |
| 6.1 products | DLMF (4.22.2), (4.22.3), (5.8.2); `TauCeti.hasSum_cotTerm_two_mul` | dlmf-4-22 lines 77–80, 104–109; dlmf-5-8 line 79; `TanhSeries.lean:64` | Correct at argument `πz`, with `2z ∉ ℤ` for Tau Ceti's series. |
| 6.2 theta and ratios | Thm 14.3, pp. 35–36 | rainer 1868–1880 | Correct. |
| 6.4 Cauchy–Pompeiu | Prop 10.1, p. 23 | rainer 1216–1219, 1253 | Correct. `dξdη = −(2i)⁻¹dζ∧dζ̄` turns (10.2) into the README's `−π⁻¹` area term. |
| 7.2 forms | Thm 12.2, p. 31 | rainer 1630–1648 | Correct. Rainer's "domain" is a nonempty open set (rainer line 81). |
| 7.3 coordinate examples | (10.1) p. 23; proof of Prop 10.1, p. 23 | rainer 1211, 1237–1248 | Correct. |
| 7.4 Cousin I | P12.3, T12.4, p. 32 | rainer 1658–1700 | Correct. `f_ik = f_ij + f_jk` is `c i j + c j k + c k i = 0`, and `f_i − f_j = f_ij` is `b i − b j = c i j`. |

The 6.5 locator touched by R02 is also correct: Theorem 8.2 is at rainer line 941 (p. 18), and its proof at 959–965 (p. 19).

### Library declarations opened at the pins

**Tau Ceti.** All under `TauCeti/`:
- `circleLaurentCoeff` (`Analysis/Complex/Laurent/Basic.lean:49`), with:
  - `_natCast` (`:59`), which holds for every `R`, including 0;
  - `_smul` (`:82`) and `_add` (`:87`);
  - `norm_circleLaurentCoeff_le` (`:100`), which gives `M R^(−n)` for all `n ∈ ℤ`;
  - `circleLaurentCoeff_eq_of_differentiable_on_annulus_off_countable` (`:123`);
  - `circleLaurentCoeff_sub_zpow_smul` (`:145`);
  - the two-circle formula (`:167`).

  The file has no Laurent decomposition, so the new headline duplicates nothing.
- The polynomial hull:
  - `polynomialHull` (`Analysis/Complex/PolynomialHull/Basic.lean:102`), with the same "every real bound" clause as `holomorphicHull`;
  - `IsPolynomiallyConvex` (`:109`), `polynomialHull_empty` (`:129`) and `polynomialHull_polynomialHull` (`:134`);
  - `isPolynomiallyConvex_closedBall` (`:252`, `[Fintype ι]`).
- `IsFilledIn` (`Topology/FilledIn.lean:61`): compact closure inside `Ω`.
- `IsOpen.isFilledIn_closedBall_sdiff_thickening` (`Analysis/Normed/Module/Exhaustion.lean:57`).
- `meromorphicGerms.principalPart` (`Analysis/Meromorphic/PrincipalPart.lean:188`) and `coeff_principalPart_succ_eq_circleIntegral` (`Analysis/Contour/Residue/PrincipalPart.lean:86`). Both are named in Scope `:85`–86.
- `hasSum_cotTerm_two_mul` (`Analysis/SpecialFunctions/Trigonometric/TanhSeries.lean:64`, hypothesis `z ∈ integerComplement`).
- `norm_tprod_one_add_sub_one_le` (`Analysis/Normed/Ring/InfiniteProd.lean:47`). It is the exponential infinite-product bound under `NormOneClass`, not the sharp finite bound of 1.4.
- `Analysis/Hyperfunction/OneDimensional.lean:59`: the Cousin problem is "not proved here", so 7.4 duplicates nothing.

**Mathlib.**
- `cot_series_rep` and `cotTerm_identity` (`Analysis/SpecialFunctions/Trigonometric/Cotangent.lean:233`, `:207`).
- `summableLocallyUniformlyOn_iteratedDerivWithin_cotTerm` (`:322`, `1 ≤ k`, as 6.1 says).
- `Differentiable.hasFPowerSeriesOnBall` (`Analysis/Complex/CauchyIntegral.lean:764`).
- `HasFPowerSeriesOnBall.tendstoUniformlyOn` (`Analysis/Analytic/Basic.lean:919`).
- `ContinuousLinearEquiv.funUnique` (`Topology/Algebra/Module/Equiv/Pi.lean:121`, which is `Function.eval default`, so its inverse is `z ↦ fun _ => z`).
- `Differentiable.apply_eq_of_tendsto_cocompact` (`Analysis/Complex/Liouville.lean:164`).
- `Complex.differentiableOn_tsum_of_summable_norm` and `Complex.hasSum_deriv_of_summable_norm` (`Analysis/Complex/LocallyUniformLimit.lean:171`, `:182`).
- `Finset.norm_prod_one_add_sub_one_le` (`Analysis/SpecialFunctions/Log/Summable.lean:137`).

`scratch/citations.md` reports no unresolved name.

**Not found at the pins.** I found no:
- Looman–Menchoff;
- Runge, Mittag–Leffler or Weierstrass divisor theorem;
- global ∂̄ solver;
- Cousin theorem;
- annulus Laurent decomposition;
- sharp finite-product bound.

### Cross-roadmap citations resolved

- **ZerosOfLFunctions 5.1–5.4** on main (`README.md:929`, `:938`, `:957`, `:979`).
- **AnalyticNumberTheoryPartI §0.15** on main (`README.md:530`–552): `elementaryFactor` (`Suggested.lean:346`), `exists_entire_primary_product_exact` over a countable `ι` (`:351`), the sharp estimate, and the fibre-grouping bullet.
- **AnalyticNumberTheoryPartI §0.15a** on main (`:554`): `exists_entire_exp_mul_of_divisor_eq` (`:363`), with both nonvanishing hypotheses.
- **ConformalMapping §5.3 and §5.6** on main (`Completed/ConformalMapping/README.md:787`, `:906`): `jordan_index_of_isPiecewiseC1On` (`Suggested.lean:640`).
- **Hyperfunctions MalgrangeTopVanishing** on main (`README.md:192`).
- **RealAnalyticGeometry R3.2 item 1** on main (`:811`–812).
- **ComplexKahlerGeometry on main** (`:35`, `:199`–200, `:345`–350, `:1620`–1637) matches Scope and Downstream consumers, including the new K3 split. Main's line 347 reads "The generic local Laurent decomposition and coefficient extraction remain owned by GlobalHolomorphicFunctions".
- `scratch/overlaps.md` lists no dropped id and no other pull request changing this roadmap.
- **Two open pull requests cite this one for content that has moved.**
  - #1761, AutomorphicSpectralTheoryPartII (`README.md:15`, `:161`), cites a heading "Preparatory primary factors and locally uniform products"; the primary factors are AnalyticNumberTheoryPartI §0.15 here (`README.md:43`–46).
  - #1772, RelativisticQuantumFieldTheory (`README.md:97`, `:2089`), cites "GH2's local Laurent phase"; that phase is now Layer 0.4, as `README.md:1770`–1772 states.

  Both are new roadmaps that cite another open one, so updating these citations is up to those pull requests, not a defect of this folder.

**Ownership searches.** I ran `roadmaps grep -i` for Looman, finite-rank Runge, Mittag–Leffler, Weierstrass theorem, Cauchy–Pompeiu, Cousin, polynomially convex / polynomial hull, the annulus Laurent decomposition and `circleLaurentCoeff`. Only #1234 conflicts (R01). The other hits own different objects:
- Hyperfunctions: several-variable polynomially convex neighbourhoods.
- PseudoholomorphicCurveAnalysis: compactly supported Cauchy and Beurling transforms.
- AsymptoticExpansions: Darboux's method on `circleLaurentCoeff`.
- ColemanIntegration and PadicDifferentialEquationsAndRigidCohomology: p-adic annuli.
- DeRhamCohomologyAndDuality: main and #2085 at `df0682f`, continuous planar forms with local primitives. It defers `H¹_dR(ℂ∖{0};ℂ)` to K5a and owns no planar `H²` vanishing.

ComplexKahlerGeometry #1807, #1808 and #1854 do not contain "finite-rank Runge" and do not change these sections.

### Adversarial pass

`S` is `Suggested.lean` and `R` is `README.md`. All values were computed this round with my own scripts:
- circle integrals use 4000–20000 nodes;
- areas use polar grids;
- series are truncated as stated.

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| S Looman–Menchoff (0.2) | `z²` at `1+i`; `z̄` at `0.3+0.4i`; `exp(−z⁻⁴)`, `f(0)=0`; `Ω=∅` | `f_y = −2+2i = i f_x`; `f_y = −i`, `i f_x = +i`, excluded by `hline`; quotients at 0 are 0, 0 (t=0.1, 0.05), but `|f| = 11.489, 64.388, 2244.077` at r=0.8, 0.7, 0.6 on arg π/4, excluded by `hcont`; vacuous | Pass | none |
| R 0.2 balanced estimate vs Lemma 1 | `[0,20]×[0,1]`, E the corners (0,0) and (20,1), `φ=y(20−x)(1−e^{−10x})`, N=1 | max slope from (20,1) is 1.000000 ≤ N; left side 198.0100, against `5N·m(R∖E)=100` | Pass (the README's ratio bound excludes it) | none (source issue) |
| R 0.3 normalization | radial `ψ=(1−r²)³`; kernel on the unit disc | `∫₀¹ψ′ = ψ(1)−ψ(0) = −1 = −φ(0)`; `∫|ζ|⁻¹dA = ∫∫dr dθ = 6.283185 = 2π` | Pass | none |
| S `exists_laurent_decomposition`, annulus (0,1) | `1/(z(z−1))`, c=0, ρ=1/2 | `a_{−3..2} = 0, 0, −1, −1, −1, −1`; `fp+fm` at `0.3+0.2i` is `−3.6284470+1.1611030i = f`; `fm(5) = −0.2000000 = a_{−1}/5` | Pass | none |
| S `exists_laurent_decomposition`, annulus (1,∞) | same f, ρ=3 | `a_0=a_1=a_{−1}=0`, so `fp=0`; `fm(2) = 0.5000000 = f(2)` | Pass | none |
| Wrong models for the Laurent headline | ρ=0; ρ=2 for annulus (0,1); `1/z = 1+(1/z−1)` | every radius-0 coefficient is 0 (circle derivative 0), so `fp+fm=0≠f`, excluded by `hρ₁`; at ρ=2, `a_{−5..−2}=1` and `a_{−1}=a_0=0`, and the negative series diverges at 0.5, excluded by `hρ₂`; `1/z−1 → −1`, excluded by `Tendsto fm (cocompact ℂ) (𝓝 0)` | Pass | none |
| R 0.4 essential singularity | `e^{1/z}`, ρ=1 | `a_{−3},a_{−2},a_{−1},a_0,a_1 = 0.166667, 0.5, 1, 1, 0`; `fm(2) = 0.6487212`, against `e^{1/2}−1 = 0.6487213`; `fm(100) = 0.0100502 → 0` | Pass | none |
| R 0.4 order Check | `(z+1)/z²`; `z⁻³+z` | `a_{−3..1} = 0, 1, 1, 0, 0`, order −2; `a_{−4..2} = 0, 1, 0, 0, 0, 1, 0`, order −3 with one nonzero negative coefficient | Pass | none |
| R 1.1 derivative identities | `E₂′(−1)`; `E₁′(1)`; `log‖E₁(1/2)‖` | `−e^{−1/2} = −0.6065307`; `−e = −2.7182818`; `log(0.5)+0.5 = −0.193147 ≤ 0.25` | Pass | none |
| S `exists_entire_genusOne_product` | `S={n²}`, z=2+i, 2·10⁵ factors; `S={1}`, m=2; `S=∅` | product `−0.4312778−9.3328073i`, against `e^{π²z/6}sin(π√z)/(π√z) = −0.4312778−9.3328073i`; `((1−z)e^z)²` at 1/2 is `0.6795705 = e/4`, order 2 at 1; F=1 | Pass | none |
| S `exists_entire_genusOne_product_of_divisor` | `D=2[1]`; `D=[1]−[2]`; `D 0=1` | divisor 2 at 1; excluded by `hD`; excluded by `hDzero` | Pass | none |
| S sharp bound (1.4) | 20000 random complex families of size 0–7, about 20% with `u₀=−1`; `ℤ₃` with `u=(3,3)`; norm `2|z|` with `u=(1,1)`; `u=(1,1)` in ℂ | `max(lhs−rhs) = 2.2·10⁻¹⁶`; `0.3333 ≤ 0.7778`; `6 ≤ 8`; `3 = 3`, while the exponential form gives `6.389` | Pass | none |
| S `holomorphicHull`, `holomorphicHull_eq_fill` (2.1, 2.5) | `K={2≤|z|≤3}` in `D₄` and in `{1<|z|<4}`; `K=∅` | in `{1<|z|<4}`, `|1/1.5| = 0.667 > sup_K|1/z| = 0.5`, so 1.5 is excluded and the hull is K; in `D₄` the hull is the closed 3-disc; ∅ (B=−1 for f=0) | Pass | none |
| R 2.1 polynomial-hull comparison | unit circle; the unbounded set ℝ | `z` gives `1.5 > 1`, so 1.5 is excluded, and 0.5 is kept, so both hulls are the closed disc; `|e^{iz}|` at −i and `|e^{−iz}|` at i are `2.7182818 > 1`, so the hull of ℝ in ℂ is ℝ, while every nonconstant polynomial is unbounded on ℝ, so the polynomial hull is everything | Pass (compact K is needed, as stated) | none |
| R 2.1 explicit stages | unit disc, `K_0, K_1, K_2` | radii 0, 0.5, 0.6667 (thickening of radius 1 is `{z≠0}`) | Pass | none |
| R 2.2 metric | constants differing by 1; constants `1/(n+1)` | 0.5; 0.500000, 0.333333, 0.142857, equal to `1/(n+2)` | Pass | none |
| R 2.3 `O(K)` not closed | `Σzⁿ/(n+1)²` along the radius | `Σ n r^{n−1}/(n+1)² = 1.238, 3.078, 5.281` at r = 0.9, 0.99, 0.999 | Pass | none |
| S `isRungeCompactPair_iff_approximation` | annulus in `D₄` with `f=1/z`; `K=∅` | `∮_{|z|=2.5}dz/z = 6.2831853i`, but `∮z³dz = 0`: both sides false; both sides true | Pass | none |
| R 2.5 polynomial specialization | unit circle | bounded component `{|z|<1}`; closed-disc hull; `∮dz/z = 2πi`, against 0 for every polynomial: all three conditions fail | Pass | none |
| S `exists_finite_rank_runge_operator` | K the closed unit disc, Ω=ℂ, L the closed disc of radius 1.6; 60 nodes on `|ζ|=1.5`, `w_j=ζ_j/60`, `g_j` the degree-199 Taylor polynomials of `1/(ζ_j−z)` | `sup_K|f−Af|/sup_L|f| = 1.90e−11, 1.49e−11, 2.48e−13, 1.70e−11` for `1/(z−3)`, `e^z`, `z¹⁰`, `1/(z+2.6i)`, with one operator for all four | Pass | owner (R01) |
| S `exists_zero_free_holomorphic_approximation` (3.1) | `K={1≤|z|≤2}`, `Ω=ℂ∖{0}`, `u=z−1/2` | `G_N(1) = 0.6065307, 0.5134171, 0.5000412` for N=1, 3, 10, tending to 0.5; winding on `|z|=3/2` is 1.0000000 for `(z−1/2)/(z−3)` and 0.0000000 for `(z−1/2)/z` | Pass | none |
| S zero orders and signed divisor (3.1) | `2[0]−[1]` by `z²/(z−1)`; m=0 | `(2πi)⁻¹∮f′/f` is 2.000000 at 0 and −1.000000 at 1; f=1 | Pass | none |
| S `exists_holomorphic_no_meromorphic_boundary_germ` (3.2) | `Ω=ℂ∖{0}`, `f=sin(1/z)`; `Ω=∅`, `ℂ` | zeros 0.31831, 0.03183, 0.00318 tend to 0, while `f(2/π)=1`, so no meromorphic extension; frontier empty | Pass | none |
| S `exists_meromorphic_prescribed_principal_parts` (4.1) | `E=ℤ`, `P_n=1/(z−n)`, realized by `π cot πz` at i | `−3.1533481i`, against `−i(1+2S₁) = −3.1533471i` (`S₁=1.0766735` at 2·10⁶ terms, against `(π coth π−1)/2 = 1.0766740`) | Pass | none |
| S `exists_holomorphic_prescribed_isolated_singularities` (4.1) | `U₀=B(0,1/2)`, `φ₀=1/z+1/(z−1/2)`; `e^{1/z}` | `f=1/z`, remainder `−1/(z−1/2)` with value 2 at 0, analytic; remainder 0 | Pass | none |
| S `exists_holomorphic_quotient` | `F=cot` on ℂ | `(f,g)=(cos,sin)`, `sin≠0` off ℤ (codiscrete) | Pass | none |
| S `cauchyPompeiu` (6.4) | `Δ=D(0,1)∖B̄(0.4,0.3)`, `f=z²z̄+z̄²`, `∂̄f=z²+2z̄`, `ξ=−0.5+0.1i` | boundary `−0.5851921+0.0916318i`; area/π `−0.6951922−0.0343365i`; formula `0.1100000+0.1259682i`, against `f(ξ) = 0.11+0.126i`; reversed area sign `−1.2803843+0.0572953i` | Pass | none |
| R 6.4 boundary cycle | unreversed and reversed annulus; overlapping holes | `1−(−1)=2` at 0; `1−1=0` at 0 and `1−0=1` at 3/2; `1−1−1=−1` at 0 | Pass | none |
| R 6.1 tangent and products | z=0.3+0.2i; z=1/4; z=1; `cos(πz)` at `0.2−0.3i`; `1/Γ(1/2)` | `−π tan(πz) = −1.8790445−3.1898155i`, paired sum (4·10⁵ terms) `−1.8790430−3.1898145i`, half-sum `−0.9395222−1.5949078i`; `−3.1415914` against −π; `0.0000050 ≈ 0`; `1.1957245+0.6397076i` against product `1.1957245+0.6397072i`; `0.5641896` against `0.5641898` | Pass | none |
| R 6.2 theta and `e^z−1` | r=1/2 at `0.3+0.4i`; `0.9+2.1i`; z=2πi | ratio `1.3646775−0.5769764i = r⁻¹e^{−z}`; `−2.2417210+2.1231524i`, against product `−2.2417211+2.1231535i`; factor n=1 is 0, and the π² variant vanishes at πi, where `e^{πi}−1 = −2` | Pass | none |
| R 6.3 substitution | images under `z↦−iz` | `−i·i=1` (upper half-plane to right), `−i·1=−i`, `−i·(−i)=−1` | Pass | none |
| R 6.5 residues (R02) | `(z−1)²(z+2)` at 1; `1/(z−1)²` at 1; `−π tan(πz)` at 1/2 and 0 | 2.0000000; −2.0000000; 1.0000000, 0.0000000 | Values pass; derivation wrong for poles | reword (R02) |
| S `exists_smooth_conjWirtingerDeriv_eq` (7.1) | `f=zz̄²`, `u=zz̄³/3` at `0.3+0.8i`; `f=ze^{−|z|²}`, `u=−e^{−|z|²}` at 1 | `u_x+iu_y = 0.4380000−1.1680000i = 2f`; `∂̄u = 0.367879 = e⁻¹` | Pass | owner (R01) |
| S `exists_smooth_closed_completion` | `f=z̄z²`, `g=zz̄²` at `0.3+0.8i` | `g_x+ig_y = 2.9200000 = f_x−if_y` | Pass | none |
| S `exists_smooth_closed_completion_form` | `f=z`, `g=z̄`; `g=0` | `∂f−∂̄g = 1−1 = 0`; `g=0` leaves `dz∧dz̄`, of value −2i on `(1,i)` | Pass | none |
| S `exists_mextDeriv_eq_complex_two_form` (7.2) | `η=z̄ dz∧dz̄`, `β=−(z̄²/2)dz` at `0.3+0.8i` | `dβ(1,i) = −1.6000000−0.6000000i = η(1,i)`; with `+u dz`, `+1.6+0.6i` | Pass | owner (R01) |
| S `exists_mextDeriv_eq_real_two_form` (7.2) | `h=1+x²`, `u=z̄/2+(z²z̄+zz̄²+z̄³/3)/8` at `0.3+0.8i` | `(Re u)_x−(Im u)_y = 1.09000 = h`; swapped `−0.12000` | Pass | none |
| S `subsingleton_deRhamCohomology_two` | U=ℂ; the circle in degree 1 | `dx∧dy = d((x dy−y dx)/2)`, value 1 on `(1,i)`; `dθ` is closed but not exact, so the vanishing needs exactness, not closedness alone | Pass | none |
| R 7.3 coordinate examples | disc moments; `d(iz²)`, `d(i|z|²)` | `3.141593, 0, 1.570791, 1.047189, 0.785387`, against `π/(m+1)`: `3.141593, 0, 1.570796, 1.047198, 0.785398`; `2i, 2i` at z=1 and `−2, 0` at z=i (direction 1) | Pass | none |
| S `additive_cousin_I` (7.4) | slit-plane cover of `ℂ∖{0}` with `c₁₂ = 1` on `Im>0`; one-set cover | `b₁−b₂ = 1, 1, 0, 0` at i, 2+0.5i, −i, −3−0.1i; `3c₁₁=0` | Pass | none |

The table has 40 rows. It covers the 15 sampled targets, all 23 theorems and both definitions of `Suggested.lean`, and every target a finding touches.

## Not verifiable

None. All four sources in the manifest (rainer, gray-morris, dlmf-4-22, dlmf-5-8) are certified and cached, and I read every sampled locator there. The README flags no locator as unverified. Ownership against open pull requests was checked with the sibling checkouts (#1234, #2085) and `roadmaps grep`/`roadmaps show` for the rest.

## Source issues

- **Error** in gray-morris at Appendix, Lemma 1, p. 253: the source asserts the `5N·m(R−E)` bound for every closed rectangle; it should restrict the side ratio, since `[0,20]×[0,1]` with E the two corners gives 198.01 against 100; affects the proof.
- **Gap** in rainer at proof of Proposition 15.2, p. 37: the source applies Lemma 15.1 on a neighbourhood of K without naming the domain whose complement has `b_i`, `a_j` in one component; it should use ℂ∖P for a path P in `V_j` joining them; affects the proof.
- **Misprint** in rainer at proof of Proposition 15.2, p. 37: the source concludes `|f−G|_K < 2ε` while the proposition asserts ε; it should run the argument with ε/2; affects nothing.
- **Misprint** in rainer at proof of Theorem 14.3, p. 36: the source says the uniformly Cauchy partial products make `f_N` uniformly convergent; it should say `p_N`; affects nothing.
- **Misprint** in rainer at proof of Theorem 15.7, p. 40: the source invokes Theorem 12.1, whose data lie in `H(ℂ∖{a})`, for `φ_a/g`, given only near a; it should cite the local-data form derived after Theorem 12.4, p. 32; affects nothing.
