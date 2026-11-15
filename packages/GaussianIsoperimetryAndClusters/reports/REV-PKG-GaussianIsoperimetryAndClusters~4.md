<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16957#issuecomment-6901225665 -->
Review (claude) of d462415

Verdict: accepted

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No finding. The three findings of round 3 are repaired, the repaired passages and the fifteen sampled
targets were recomputed, `Suggested.lean` elaborates with `sorry` as the only warning, no sorried
theorem closes under the one-tactic probe, every pinned declaration and supplier section the README
cites exists where it is cited, and the dependency check is clean. `design/plan.json` declares no
gap (`gaps: []`) and none is needed, so the acceptance is unconditional.

## Round 3 findings, one by one

- **F01 (P3), §8.2 with the open thickening: repaired.** `packages/GaussianIsoperimetryAndClusters/README.md`
  line 621: "`liminf_{r ↓ 0} (γ(Metric.thickening r A) − γ(A))/r ≥ I(γ(A))` … with the open
  `r`-neighbourhood of line 211"; `Suggested.lean` line 377: `stdGaussian E (thickening r A)`. The
  Checks at lines 627 and 629 and the bound of §8.3 (line 633, "`{0 < d_A < r} = Metric.thickening r A ∖ A`
  for closed nonempty `A`") follow. Ledoux1999 line 211 has the open neighbourhood.
- **F02 (P3), convexity for every convex set: repaired.** README line 731: "for every subspace `F` of
  dimension `k ≥ 1`, unit vector `u ∈ F` and convex `C ⊆ E`, with no topological assumption, the
  closed symmetral … (`convex_closedGaussianSymmetral`) and the symmetral `S_{F,u}(C)` of §6.1 are
  convex"; line 720 keeps the closed case as §9.4's target without a Lean name; `Suggested.lean`
  line 435–437 has no `IsClosed` hypothesis; the Summary (line 5) and the module docstring place the
  theorem in §9.5. The new Check (line 739) was recomputed (table).
- **F03 (P3), two line numbers: repaired.** README line 112: "(TauCeti/Analysis/BoundedVariation/Slicing.lean:190 and 199)".

The repaired patterns were searched in the rest of the package. Closed thickenings remain only as a
consequence (§8.1), a route step (§8.4) and a computed value (Layer 8 Examples). The closedness
hypotheses of §9.2–§9.4 are needed there (those sections also claim that the symmetral is closed).
Every "name (file:line)" citation of the supplier contracts was matched again by script (below).
Maintainer notes: none were left.

## Verified sound

**Principles.** No `set_option`, no sorried data (16 definitions and one structure, all with
bodies), no algorithm, no copied passage, no supplier later in the merge order, no cycle. The
general multi-bubble theorem is left to a named Part II whose starting point is stated.

**Elaboration.** `lake env lean` on `packages/GaussianIsoperimetryAndClusters/Suggested.lean`, run
from the content checkout: no error, 19 warnings, all "declaration uses `sorry`". Header: `module`,
`import Mathlib`, six `TauCeti.*` modules, each present at the pin and each used
(`reducedBoundary`/`outerNormal`, `totalVariationOn`, `variationMeasure`, `divergenceCLM`,
`essentialBoundary`, `quantile`).

**Signatures.** `#check @name` for all 36 declarations on a scratch copy, compared with the README.
The three definitions the worker's listing flags (`gaussianWeight`, `gaussianSymmetral`,
`closedGaussianSymmetral`) lose only instances their bodies never use; all 19 theorems carry
`FiniteDimensional`, `MeasurableSpace`, `BorelSpace`, and `Nontrivial E` or `0 < finrank` where the
README says `n ≥ 1`. Nothing to change.

**One-tactic probe, all 19 sorried theorems.** Each `sorry` replaced by
`first | rfl | (simp; done) | infer_instance | (simp [the roadmap's 15 definitions]; done) | (aesop; done) | (norm_num; done) | sorry`:
19 "declaration uses `sorry`" warnings remain and there is no error, so none closes. None restates a
definition, mirrors a Check or treats a boundary case. No padding.

**Headline theorems.** From the Summary: the single-bubble theorem with equality
(`gaussian_isoperimetric`), its two-cell form (`isoperimetricProfile_two_eq`,
`Cluster.perimeter_eq_iff_halfSpaces`), Borell–Sudakov–Tsirelson for the standard and for every
Gaussian law (two theorems), the Minkowski-content form, Bobkov's inequality, concentration about a
median (two theorems), Ehrhard's inequality and convexity of symmetrals; with the layer results of
§2.2 (two), §2.5, §2.6, §3.5, §4.3, §4.6 and §6.6. All 19 are stated on the roadmap's carriers and
none through a stand-in; the module docstring says none is omitted. All 36 Lean names occur in the
README, and the citation resolver reports no backticked name and no cross-roadmap citation that is
found nowhere.

**Pinned declarations** (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, the pins of the manifest). A script
read every "name (file:line)" citation of the supplier contracts at the pins: 93 matched at the
cited line; the four of TauCeti/Probability/Distributions/Gaussian/Cdf.lean (205, 212, 219, 226), the
instance at Mathlib/MeasureTheory/Covering/BesicovitchVectorSpace.lean:500 and the notation at
Mathlib/Analysis/Distribution/TestFunction.lean:80 were matched by hand. Read for content:
`TauCeti.reducedBoundary` and `TauCeti.outerNormal` (ReducedBoundary.lean:95, 106: minus the limit of
the polar-density averages, so `Dχ_s = −ν_s |Dχ_s|`);
`TauCeti.integral_trace_fderiv_mul_indicator_eq_integral_inner_outerNormal` (line 271, same
`hu`/`hfin` hypotheses as the Lean statements of Layer 2); `TauCeti.variationMeasure`
(VariationMeasure.lean:136, `0` outside the predicate that the Lean hypotheses `hu`, `hfin` restate);
`ProbabilityTheory.multivariateGaussian` and `multivariateGaussian_of_not_posSemidef`
(Multivariate.lean:166, 170: Dirac mass at the mean when `S` is not positive semidefinite);
`MeasureTheory.Measure.quantile`, `quantile_of_nonpos`, `quantile_of_one_lt`, `cdf_quantile`,
`quantile_cdf` (Quantile.lean:164, 209, 216, 340, 359); `TauCeti.perimeter_setOf_inner_lt`
(Hyperplane.lean:61); `TauCeti.ae_perimeter_inter_ball_le` (CutByBall.lean:228, null-measurable `s`
only); `Metric.thickening_subset_cthickening`, `Metric.self_subset_thickening`,
`Metric.thickening_closure` (Thickening.lean:267, 309, 376); `Convex.nullMeasurableSet`
(Mathlib/Analysis/Convex/Measure.lean:89).

**Supplier sections, resolved on main (`d1f3b7d`).** GeometricMeasureTheory G2 (area and coarea with
nonnegative weights, tangential forms, `C¹` graphs), G4 (convolution estimates, scalar coarea), G5
(De Giorgi's structure theorem with blow-up, essential against reduced boundary, the converse
criterion), G6 (Lipschitz domains, surface comparison); Isoperimetry I1, I2 and I4 (the slicing
theorem with its reduced-boundary and normal comparison, the `e⊥ × ℝ` equivalence, the
essential-convexity theorem for positive finite volume); RandomMatrices 2.2 (logarithmic Sobolev,
Herbst); BanachSpaceTheory B7 (Dvoretzky, sphere concentration). Each heading exists with the
content cited. The overlap report lists no changed, dropped or revision-only id.

**Dependency check.** Output: `depcheck: 243 roadmaps, 2246 edges, 0 problem(s)`. No UPWARD, CYCLE or
moved line.

**Shape and residue.** Nine layers named by their mathematics, each ending with Examples and
Dependencies; every definition has its API and at least three Checks (§1.1, §2.1, §3.1, §3.2, §3.4,
§4.1, §4.2, §4.4, §6.1, §8.3, §9.1); no LaTeX delimiters, pull-request numbers, dates, machine paths,
process words, `lemma`, `#eval`, `#print` or `True` placeholder (searched). `sources.toml` records
all 13 works of the reference list, with `cited_for` matching the sections that cite them.

**Remarks, no change asked.** In §7.2's negative control, `0.032981` is the exact share of the strips
in the disc of radius `1/16` (recomputed: `0.0329808`), below the stated bound `(256/27)ρ³`, which is
`0.188628` of that disc. `design/plan.json` still describes §8.2 and §9.4 as before the round 3
repairs; it is not a reviewed file and only its `gaps` list may change after the design.

### Adversarial table

Rows: the repaired passages, the 15 sampled targets and the headline statements. Values were
recomputed independently (error function, bisection for `Φ⁻¹`, midpoint quadrature).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.1 `gaussianIsoperimetricProfile` (sampled) | `v = ½, ⅓, ⅔, 1 − Φ(1), 0.3`; endpoints | `0.398942`, `0.363600` twice with `Φ⁻¹(⅓) = −0.430727`, `0.241971`; second difference `−2.876104 = −1/I(0.3)`, `I′(0.3) = 0.524401 = −Φ⁻¹(0.3)`; `0` at `0, 1`, where the quantile junk `0` would give `0.398942` | sound |
| §1.2 (sampled) | `r = 1, 2, 0` | `0.158655 < 0.241971` and `≤ 0.303265`; `0.022750 < 0.026995` and `≤ 0.067668`; both sides `½` at `0`; derivative of `e^{r²/2}(1 − Φ)` is `e^{r²/2}(r(1 − Φ) − φ) < 0` | sound |
| §2.2 (sampled), both Lean theorems | `(−1, 1)`; `Ω = ∅`; `W = 0`; non-`BV` `u` | `2φ(1) = 0.483941`, `γ = 0.682689`, `I = 0.356343`; `0 = 0`; reduces to `|Du|(Ω)`; excluded by `hfin` (junk measure `0`) | sound |
| §2.5 Gauss–Green | `(−∞, s)`; `{x_1 < s}`, `w = e_1` | `X(s)φ(s)` on both sides with `ν = +1`; `d/dt Φ(s + t) = φ(s)` | sound |
| §2.6 coarea | `u = χ_U`; `u(t) = t` | `∫_0^1 P = P`; `∫ φ = 1` on both sides; both sides `∞` off `BV_loc` | sound |
| §2.7 (sampled) | `F = ℝe_1`, `(−∞, s)`; `F = {0}`; translate | `φ(s)` on both sides; `0 = 0`; `0.398942 → 0.241971`, no translation invariance claimed | sound |
| §3.5 / `exists_cluster…` (sampled) | `q = 0`; `q = 1`; `n = 0`, `v = (½, ½)`; competitor | empty sum `0 ≠ 1`, vacuous; `(E)` with perimeter `0`; no cluster, excluded by `Nontrivial`; annuli of finite weighted area give every `v`, so the infimum is finite | sound |
| §4.1 (sampled) | `q = 2`; `q = 3`, `x = 0`; conormals | `Φ(−t)`, `A = φ(t)`; `A = 1/(2√(2π)) = 0.199471`, total `0.598413`; `(−1,−1,2) + (2,−1,−1) + (−1,2,−1) = 0`; sector density `⅓`, averaged normal of norm `cos 30° < 1` | sound |
| §4.2 (sampled) | centres `±1`, `λ = 2, −1, 0`; general | `8y < 0`, `−4y < 0`, `0 < 0`; `‖y − p_i‖ < ‖y − p_j‖ ⇔ ⟨y − c, p_j − p_i⟩ < 0`; cell `i` is `{(z − x)_i > (z − x)_j}` with `ι(x)` the projection of `c` | sound |
| `modelMeasureMap_diffeomorph` | `q = 2`, `x = tu`; `q = 3`, `x = 0`; injectivity with ties | `Ψ_1 = Φ(−t)`, derivative `−φ(0.7) = −0.312254 = −(L_A u)_1/√2`; `3A/√2 = 0.423142`; `y + Ω_i ⊊ x + Ω_i` for `i` maximizing `(y − x)_i` | sound |
| `modelProfile_hessian` | `q = 2`; `q = 3`, `x = 0` | `Dg(0)u = t/√2`; `H(2φu, u) = 2φ · (−1/(2φ)) = −1`; `−1/(3A) = −1.671086`, `−tr = 1.196827 = 2 × 0.598413` | sound |
| §6.2 (sampled) | `{x_2 < m x_1}`; vertical boundary; cut half-plane | `√(1 + m²) · 1/√(1 + m²) = 1`; left side `0`, one projected point; section `(−√(R² − s²), 0)`, only `0` belongs to `∂*U` | sound |
| §6.5 (sampled) | `{x_2 < a}`; `{x_2 < 1 + x_1}`; disc; (4.10) as printed | `0 + φ(a)`; `0.219696 + 0.219696 = 0.439391 ≥ 0.310697`, below `0.621393`; `0.386129 + 0.252250 = 0.638379` between `0.517483` and `1.213061`; `0.778801 ≤ 0.770391` fails, `≤ 1.101391` holds | sound |
| `gaussianPerimeter_gaussianSymmetral_le` | disc; `n = 1`, `(−1, 1)`; infinite perimeter | `0.517483 ≤ 0.606531`; `0.356343 ≤ 0.483941`; `γ = 0.116140`, `Φ⁻¹ = −1.194508`, `0.195467 ≤ ∞` | sound |
| §7.1 (sampled) | half-space; disc; localisation | all sections half-lines; section `(−1, 1)` over `0`, `0.606531 > 0.384633`; `P(H; ·) ≥ P(S_e H; ·)` on every Borel cylinder with equal totals forces equality on each | sound |
| `gaussian_isoperimetric` | `n = 0`; `∅`; half-space; disc; slab | `0 ≤ 0`, both sides of the iff true; `0 = I(0)`; `φ(s) = I(Φ(s))`; `0.606531 > 0.384633`; `0.483941 > 0.356343` | sound |
| `isoperimetricProfile_two_eq`, `Cluster.perimeter_eq_iff_halfSpaces` | `v = (1, 0)`; `(½, ½)`; `n = 0` | `(E, ∅)` gives `0 = I(1)`; `0.398942`; no cluster, excluded by `Nontrivial` | sound |
| both `borell_sudakov_tsirelson` | half-space; disc, `r = 1`; `S` not PSD; `S = diag(1, 0)`; arbitrary `A` | equality; `a = −0.270288`, `0.864665 ≥ 0.767217`; `δ_m`, `m ∈ A`; `(−∞, r) × {0}`, `Φ(r)`; closure has the same open thickenings, and `(T_*γ)^*(A) = γ^*(T⁻¹A)` for a cylinder over `ker K` | sound |
| §8.2 / `gaussian_minkowskiContent_ge` (sampled, repaired) | `∅`; `E`; half-space; disc; `ℚ²`; Bernstein set | `0 ≥ 0`; `0 ≥ 0`; `φ(a)`; `0.606531 ≥ 0.384633`; `1/r → ∞`; `0.398278`, `0.398936 → 0.398942 = I(½)`; filter `𝓝[>] 0` keeps `r > 0` | sound |
| §8.3 / `bobkov_inequality` (sampled, repaired) | `Φ(x)`, `Φ(2x)`; `min(x², 1)`; constants; `f_r`, closed `A`; `A = (0, 1)` | `0.398942` both; `∫f = 0.516059`, `I = 0.398619 ≤ 0.647406`; `I(c) = I(c)`; `{0 < d_A < r} = thickening ∖ A`, half-space `Φ(1) − ½ = 0.341345` on both sides; sets differ at `0` and `1`, so "closed" is needed | sound |
| §8.4 / `gaussian_concentration_median` (sampled) | `f = x_1`; `L = 0`; `r = 0`; `|x_1|` | equality, `0.022750 ≤ 0.067668`; `c ≤ m`, empty set; `γ{f > m} ≤ ½`; median `0.674490`, mean `0.797885` | sound |
| §8.5 / `gaussian_max_concentration` (sampled) | two independent normals; `S = 0`; `[[1,2],[2,1]]` | median `0.544952`, `0.010899 ≤ 0.022750`; `σ = 0`, set empty; `δ_0`, `m ≥ 0`, left side `0`; row norm of `√S` is `√(S_ii)` | sound |
| §9.1 (sampled) | complement law; composition law; discs and balls | `{Φ(t) < 1 − v_C}` on both sides; after the first step the `F_2`-section has measure `∫ v_C dγ = γ_{F_1+F_2}(C_w)`, independent of the `F_1`-coordinate; `−0.270288`; `0.198748`, `−0.846102` | sound |
| §9.2 | Hessian of `g` at four points | `(−0.459912, −0.459912, det 0.163502)`, dets `0.015519`, `0.000142`, `15.648788`, diagonals negative; `g(−1, 1) = 0.475233` | sound |
| §9.5 / `ehrhard_inequality_convex` | `[−1,1]`, `[−3,3]`, `θ = ½`; `θ = 0.9`; `γ(A) = 0`; `θ = 0` | `1.690143 ≥ 1.628704`; `0.954500 ≥ 0.948312 ≥ 0.825134`; `0.561033 + 0.993113 = 1.554146 ≤ 1.690143`; no admissible `a`; `0 • A = {0}` as `A ≠ ∅` | sound |
| §9.5 / `convex_closedGaussianSymmetral` (repaired) | `C = {x_1 > 0} ∪ {0} × [0, ∞)`; `F = E`; strict rule | `v_C = 1, ½, 0`, set `{x_1 > 0} ∪ {0} × (−∞, 0]`, midpoint level `Φ(47.5) ≤ 1`; half-space, `∅` or `E`; levels raised to `s`, `s′`, then `Φ(θ⟨y,u⟩ + (1−θ)⟨y′,u⟩) < Φ(θs + (1−θ)s′) ≤ v_C` | sound |

## Sources: the sample

Read at the locators and confirmed: §1.1 (MilmanNeeman2022 line 180–187; CianchiFuscoMaggiPratelli2011
line 48–57; Ledoux1999 line 214–217); §1.2 (CianchiFuscoMaggiPratelli2011 line 295–299; Ledoux1999
line 225–226); §2.2 (MilmanNeeman2022 line 753–757; CianchiFuscoMaggiPratelli2011 line 174–208);
§2.7 (MilmanNeeman2022 line 481–483, 554–556); §3.5 (MilmanNeeman2022 line 918–922 and 939–947,
`W ∈ C^∞`, as the README says); §4.1 (line 499–505); §4.2 (line 76–82); §6.2
(CianchiFuscoMaggiPratelli2011 line 526–542); §6.5 (line 624–631); §7.1 (line 889–912); §8.2
(Ledoux1999 line 207–219, open neighbourhood at line 211); §8.3 (Ledoux1999 line 296–313, the
functional inequality and the approximation by `(1 − d(·, A)/r)⁺`); §8.4 (Ledoux1993 line 255–262;
Ledoux1999 line 220–226); §8.5 (Ledoux1999 line 252–271); §9.1 (Ehrhard1983 line 64–66, 117–129,
134–140, 329–355). Also read: MilmanNeeman2022 line 57–70, 98–102, 169–170, 697–708;
CianchiFuscoMaggiPratelli2011 line 36–47, 220–223, 508–509, 583–588, 605–618; Ehrhard1983 line
356–376; Borell1975 line 85–99; the contents and Part IV synopsis of Maggi2012 (line 79, 99–101, 169,
716–725). The author flags no locator as unverified beyond those under "Not verifiable".

## Duplication and overlap

By object at the pins: no weighted divergence, weighted perimeter, Gaussian isoperimetric function,
Gaussian symmetral, cluster or Gaussian upper-tail bound in Mathlib or Tau Ceti. The pinned
TauCeti/Probability/Distributions/Gaussian/Cdf.lean has the distribution function, its derivative
and a lower bound for the upper tail (line 325); Maximum.lean has a lower bound for the expected
maximum; neither is a target here. The search over main and the open heads finds no match for
"Gaussian isoperimetr", "Ehrhard", "Bobkov", "Sudakov", "isoperimetric profile", "multi-bubble",
"Minkowski content", median concentration, or any declaration name of `Suggested.lean`; "weighted
perimeter" matches only a hexagon count in TensorProductCombinatorics, "Gaussian concentration" in
MathematicalStatisticsHighDimensional names a step that roadmap replaces, and "Herbst" is
RandomMatrices 2.2, which this roadmap cites. The board index has no second package of this name.
Ownership against the open pull requests was checked through the search over their heads.

Overlap check: read Isoperimetry, GeometricMeasureTheory, OptimalTransport (main), and by search over their heads MathematicalStatisticsAsymptotic, MathematicalStatisticsFoundations, MathematicalStatisticsNonparametric, MathematicalStatisticsSemiparametric, MathematicalBilliards (open); nothing shared: Euclidean perimeter, De Giorgi, area and coarea are GeometricMeasureTheory's, slicing, Steiner symmetrisation and essential convexity are Isoperimetry's, Gaussian laws in OptimalTransport enter only through Wasserstein distances and barycentres, and each supplier is cited, not restated.

## Copyright and arrangement

Wording: the 15 sampled statements with their routes, the cluster definition of §3.1 and the
docstrings of `Cluster`, `gaussianSymmetral` and `gaussian_minkowskiContent_ge` were set beside the
sources at their locators. Nothing reproduces a source's sentence; what is shared is forced (the
three conclusions of the slicing theorem, the definition of the simplex, formulas). Ehrhard1983 and
Ledoux1993 are in French and no passage translates them clause by clause. Arrangement:
MilmanNeeman2022 has the largest share; its Sections 2, 3, 4 correspond to Layers 4, 2–3, 3, in
another order and with another scope. Layers 5, 6, 7 share the order of
CianchiFuscoMaggiPratelli2011 Sections 3, 4.1, 4.2; the *Needs:* lines of §6.5 and §6.6 (§5.3) and of
§7.1 (§6.6) force it, and Layer 7 also holds the cluster form of §7.4. Layer 9 takes §9.2 from
Ehrhard1983 Section 3 before §9.3 from Section 1. Reuse: no table, figure or list taken over; no
public formalisation with matching names was found.

Source independence: 18 passages compared with 7 sources, none shared; largest share MilmanNeeman2022, 25 of 82 locators in the layers; contents compared with MilmanNeeman2022, CianchiFuscoMaggiPratelli2011 and Ehrhard1983: independent; Bobkov1997 and the body of Maggi2012 could not be read.

## Not verifiable

- Bobkov1997 (Corollary 1, inequality (10), p.209; the argument after Corollary 2, p.210): the cached
  text is OCR of glyph fragments and shows no words. A second fetch through the sources service by
  DOI found no other legal copy. The inequality and the approximation are confirmed from Ledoux1999
  line 296–313; the numbers "Corollary 1" and "(10)" were not read. The manifest records the work as
  certified, so no request was left for it.
- Maggi2012 (Theorem 15.9, Proposition 12.15, Theorem 12.26, Sections 13.1, 18.1–18.3, Exercise
  29.7): the cached extract holds the contents and the Part IV synopsis; the section titles are
  confirmed, the statements were not read. MilmanNeeman2022 line 756 and 939–946 cite Theorem 15.9,
  Proposition 12.15 and Theorem 12.26 for the same facts.
- Ledoux1993 inequality (10) and Ledoux1999 (1.5)–(1.8), (1.11): the extraction drops the displayed
  formulas; the surrounding sentences confirm the statements.
- SudakovTsirelson1974, CarlenKerce2001, AmbrosioFuscoPallara2000, Bogachev1998, Ledoux1996: recorded
  as uncertified, cited by locator, text not read.
- The sections outside the sample and the repairs (§3.2–§3.3, §4.5, §5.1, §6.3–§6.4, §7.2, §9.3) rest
  on the earlier rounds' computed rows; this round recomputed their Checks' numbers (all agree) and
  re-derived single steps only (the conditional variance `3/2` of §4.5, the chain of §6.6, the
  strip proportions `(5/6)ρ` of §7.2).

## Source issues

- **Error** in CianchiFuscoMaggiPratelli2011 at Lemma 4.5, inequality (4.10), preprint p. 13 (line 624–631): the source says the surface-normalized perimeter of the symmetral is at most the unscaled variation term plus the section term; it should carry the factor `√(2π)` on the variation term; affects a stated result.
- **Error** in CianchiFuscoMaggiPratelli2011 at Lemma 4.4, equation (4.8), preprint p. 12 (line 613–618): the source says the gradient of the section measure is the boundary sum with weights `e^{−y²/2}`; it should have weights `(2π)^{−1/2} e^{−y²/2}`, the section measure being a probability; affects a stated result.
- **Misprint** in CianchiFuscoMaggiPratelli2011 at Theorem 4.1, preprint p. 10 (line 508–509): the source says equality holds exactly for sets equivalent to a half-space; it should add the sets of measure `0` or `1`, as its Proposition 3.1 does; affects a stated result.
- **Misprint** in MilmanNeeman2022 at equation (1.1), p. 5 (line 186–187): the source says the single-bubble profile satisfies the differential equation on the closed interval; it should be the open interval, the profile vanishing at both endpoints; affects nothing.

## For the human reviewers

- Scope: the README (line 15 and line 751) assigns the multi-bubble theorem for `3 ≤ q ≤ n + 1` to "GaussianIsoperimetryAndClusters, Part II", which is neither on main, in the merge order, among the open pull requests nor in the board index.
- Licence: CianchiFuscoMaggiPratelli2011 was read from the cvgmt preprint and Maggi2012 from a cvgmt extract (`sources.toml`, `licence_class = "institutional"`); Bobkov1997 from the author's page (`author-page`). The hosts' terms were not read.
- Not tested: the wording of §8.3 against Bobkov1997 (unreadable OCR) and of §2.2, §2.4–§2.6, §6.2 against the body of Maggi2012 (only contents and synopsis are in the extract).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d462415827b6c4cf9edb312c1f1fa18496ca1968", "job": "REV-PKG-GaussianIsoperimetryAndClusters~4", "model": "fable", "worker": "chris-x89"} -->
