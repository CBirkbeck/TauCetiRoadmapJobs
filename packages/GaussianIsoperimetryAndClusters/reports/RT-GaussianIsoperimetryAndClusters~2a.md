<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16957#issuecomment-6902666260 -->
Red team round 2 pass a (claude) of 6f340f4

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) §8.5 cites Ledoux's display (1.8) for a sharper bound than (1.8) states

   Location: `packages/GaussianIsoperimetryAndClusters/README.md:662` ("`γ_{0,S}({x : max_i x_i > m + σr}) ≤ 1 − Φ(r)` for every `r ≥ 0` (`gaussian_max_concentration`; Ledoux1999 inequality (1.8), line 252–271, for covariance matrices)") and `Suggested.lean:418–419` ("(Ledoux1999, (1.8))").

   Claim: (1.8) is the stated bound.

   Witness: Ledoux1999 line 269–271: (1.8) as displayed bounds the tail by `e^{−r²/2}`. The `Φ(r)` form appears only inside its derivation (line 258–259, "by (1.7) (with a = 0)"). §8.4 (`README.md:651`) already makes this distinction for (1.6); §8.5 does not.

   Repair, README §8.5, replace the locator by: "Ledoux1999, the derivation of inequality (1.8), line 252–263, which obtains the bound `Φ(r)` for the enlargement from (1.7) with `a = 0`; (1.8) itself, line 269–271, states only the weaker tail `e^{−r²/2}`, and is for covariance matrices". In the docstring of `gaussian_max_concentration` replace "(Ledoux1999, (1.8))" by "(Ledoux1999, the derivation of (1.8) from (1.7); (1.8) itself states the weaker tail `e^{−r²/2}`)". Tested on the instance: one coordinate, `S = (1)`, `r = 2`: the stated bound is `1 − Φ(2) = 0.022750` (an equality), against `e^{−2} = 0.135335` for (1.8).

2. **F02** (P3) docstring of `gaussianIsoperimetricProfile` cites equation (1.1) for the definition

   Location: `Suggested.lean:54–56` ("The **Gaussian isoperimetric function** `I(v) = φ(Φ⁻¹(v))` … (MilmanNeeman2022, equation (1.1); Ledoux1999, (1.4))").

   Claim: equation (1.1) gives the function.

   Witness: MilmanNeeman2022 line 187: (1.1) is the differential equation `(I_m^{(1)})″ = −1/I_m^{(1)}`. The formula `φ ∘ Φ⁻¹` is at line 182–185, before (1.1); README §1.1 (`README.md:123`, `:128`) cites the two places separately and correctly.

   Repair: in the docstring replace "(MilmanNeeman2022, equation (1.1); Ledoux1999, (1.4))" by "(MilmanNeeman2022, Section 1.2, the formula `I_m^{(1)} = φ ∘ Φ⁻¹` before equation (1.1); Ledoux1999, (1.4))".

3. **F03** (P3) the Summary calls the general weighted boundary measure "Gaussian-weighted"

   Location: `README.md:3` ("The weighted layer defines weighted variation and perimeter by duality with test vector fields, identifies them with the Gaussian-weighted reduced-boundary measure supplied by Euclidean De Giorgi theory").

   Claim: the weighted layer identifies perimeter with a Gaussian-weighted measure.

   Witness: §2.2 (`README.md:189`) and `weightedPerimeter_eq_lintegral_reducedBoundary` state `P_μ(U; Ω) = μ^{n−1}(∂*U)` with `μ^{n−1} = e^{−W} μHE[n−1]` for every `C¹` weight. For `W = 0` on `ℝ`, `U = (0, 1)`: the value is `2`, not `2φ`-weighted.

   Repair: replace "the Gaussian-weighted reduced-boundary measure" by "the `e^{−W}`-weighted Hausdorff measure of the reduced boundary".

Three P3 findings (S01–S03): two locators that cite a display for more than it states, and one word in the Summary. No P1 or P2 was found. Lean was not elaborated in this pass (read-only, no Lean command given); the supplied elaborated signatures of all 37 declarations were compared with the README instead.

## Round 1 findings: state at this head

| Round 1 id | State | Witness at `6f340f4` |
|---|---|---|
| 1a/F01 (P2), §4.7 absent from the Lean | repaired | `Suggested.lean:292–298`: `theorem isoperimetricProfile_le_modelProfile … (hqn : q ≤ Module.finrank ℝ E + 1) {v : Fin q → ℝ} (hv : ∀ i, 0 < v i) (hsum : ∑ i, v i = 1) : isoperimetricProfile (gaussianWeight E) q v ≤ ENNReal.ofReal (modelProfile q (WithLp.toLp 2 v))`. All five `E` binders are explicit in the elaborated type. Named in `README.md:5` and `README.md:422`. Recomputed below (rows 14–17): true, and each hypothesis is needed. |
| 1a/F02 = 1b/F03, G4 mollification estimate unowned | repaired | `README.md` has no occurrence of `G4`. `README.md:530`: "`‖∇v_ε(z)‖ ≤ ∫ ρ_ε(z − y) d|Dv_U|(y)` at every `z`: the derivative of the convolution gives …", from `TauCeti.integral_lineDeriv_mul_eq_neg_integral_mul_inner_polarDensity` (PolarDecomposition.lean:292) and `HasCompactSupport.hasFDerivAt_convolution_left` (Convolution.lean:92); both exist at the pins at those lines. Sign recomputed on `u = χ_{(−∞,0)}`: `(u ∗ ρ)′ = −ρ`, and the formula gives `∫ ρ(x − y)(−1) dδ_0 = −ρ(x)`. `design/plan.json:1352` and `:2029–2033` still list G4; the repair worker may not edit them and the dependency check reads the README. |
| 1a/F03 (P3), `n = 0` in the §8.1 and §9.5 routes | repaired | `README.md:610`: "for `n = 0`, `γ` is the Dirac mass at the origin and `Φ(a) > 0`, so `Φ(a) ≤ γ(A)` forces `A = E = {0}`"; `README.md:730`: "for `n = 0` … the hypotheses force `A = B = E = {0}`". Both computed: `1 ≥ Φ(a + r)`. |
| 1a/F04 = 1b/F04, `Ledoux1996` uncited | repaired | No occurrence of `Ledoux1996` in `README.md` or `sources.toml`; the 12 remaining manifest ids are each cited in the README. |
| 1a/F05 (P3), Maggi numbers cited as read | repaired | `README.md:189` "Maggi2012 Theorem 15.9, cited by locator"; `README.md:211` "Proposition 12.15 and Theorem 12.26, cited by locator"; `README.md:766` separates what was read (contents and synopsis) from what is cited by locator. MilmanNeeman2022 line 756, 939, 946 and 769 corroborate the four numbers. |
| 1b/F01 (P2), invertibility of `DΨ` | repaired | `Suggested.lean:269`: `∀ (x : simplexTangent q) (i j : Fin q), i ≠ j → 0 < modelInterfaceArea q i j x`. With it `⟨a, L_A a⟩ = Σ A_ij (a_i − a_j)²` vanishes on `E^{(q−1)}` only at `0`. `q = 2`: `A_12(tu) = φ(t) > 0`. `i ≠ j` is needed: for `i = j` the set is a closed half-line and the `μHE[0]` integral is the junk `0`. |
| 1b/F02 (P3), Ehrhard 2.4 cited for general laws | repaired | `Suggested.lean:378`: "(Ledoux1999, (1.7), for centred laws; the mean `m` is a translation)". Ledoux1999 line 239–247 states the ellipsoid form for centred laws; Ehrhard1983 line 358–359 (standard measure, Euclidean ball) now sits on `borell_sudakov_tsirelson`. |

No repair introduced an error that I could find; the new and changed statements are rows 12–17 and 30 of the table below.

## The adversarial pass

`Φ`, `φ`, `I` as in the README. Every number below was recomputed in this pass (standard-library normal distribution, midpoint quadrature, exact formulas where a singularity made quadrature slow).

| # | Statement (context) | Instances tried | Values computed | Result |
|---|---|---|---|---|
| 1 | `gaussianIsoperimetricProfile` (no section variables) | `v = 1/3, 0.3, 0, 1, 1/2` | `I(1/3) = 0.363600`, `Φ⁻¹(1/3) = −0.430727`; `I″(0.3) = −2.876104 = −1/I(0.3)`; `I′(0.3) = 0.524401`; quantile at `0`, `1` is `sInf` of `univ`, `∅`, both `0`, so `φ(0) = 0.398942` without the `if` | sound; the `if` is forced |
| 2 | `weightedVariation`, `weightedPerimeter` (`Weighted` section: `E` f.d. inner product, Borel) | `n = 0`; `W = 0`; `U = ℝ` under `γ` with the term `−DW(X)` dropped | `n = 0`: only `X = 0`, value `0`; `W = 0`: Tau Ceti's `totalVariationOn`; dropped term: `∫ |t| dγ = 0.797885 ≠ 0` | sound |
| 3 | `weightedVariation_eq_lintegral_variationMeasure` | `hfin` with `U ⊄ Ω`; `Measure Ω` carrier | `TauCeti.variationMeasure : Measure Ω` (VariationMeasure.lean:136), same `hfin` shape as its `dif` condition; `U = (−1, 1)`: `2φ(1) = 0.483941` | sound |
| 4 | `weightedPerimeter_eq_lintegral_reducedBoundary` | `n = 1` (`μHE[0]` counting); `n = 0` without `hn` | `(−1, 1)`: `φ(−1) + φ(1) = 0.483941`; `n = 0`: `0 − 1 = 0` in `ℕ`, so `hn` is needed | sound |
| 5 | `integral_weightedDivergence_eq_integral_reducedBoundary` | `n = 1`, `U = (−∞, s)` | `∫_{−∞}^{s} (X′ − tX) φ = X(s) φ(s)`; `Dχ_U = −δ_s`, outer normal `+1` (ReducedBoundary.lean:106 has the minus sign) | sound |
| 6 | `weightedVariation_eq_lintegral_weightedPerimeter` | `u = χ_U`; `u(t) = t` under `γ`; `u ∉ BV_loc` | `∫_0^1 P_μ(U) dt = P_μ(U)`; `∫ φ = 1` on both sides; both sides `∞` (lower integral of a pointwise-larger function) | sound |
| 7 | `Cluster`, `Cluster.perimeter`, `isoperimetricProfile` | `q = 0, 1, 2`; `n = 0` | `q = 0`: `volume(univ) = 0` fails, no cluster; `q = 1`: `(E)`, perimeter `0`; three intervals: `φ(a) + φ(b)`; `n = 0`, `v = (1/2, 1/2)`: empty infimum `∞` | sound |
| 8 | `exists_cluster_perimeter_eq_isoperimetricProfile` (`[Nontrivial E]`, `hW`, `hμ`) | `q = 0`; `q = 1`; vertex; `n = 0` dropped; `μ` infinite | `q = 0`: `hsum` is `0 = 1`; `q = 1`: `(E)`; vertex `(1, 0)`: `(E, ∅)`; without `Nontrivial`: no cluster at `(1/2, 1/2)`; annuli give a competitor for every `v` when `n ≥ 1` | sound; each hypothesis needed |
| 9 | `simplexTangent`, `modelCell`, `modelMeasureMap`, `modelInterfaceArea` | `q = 1, 2, 3` | `q = 2`, `x = tu`: `Ψ_1 = Φ(−t)`, `A_12 = e^{−W(x)} = φ(t)` (counting measure of a point); `q = 3`, `x = 0`: areas `0.199471`, cells `1/3`; `q = 1`: `Ψ(0) = (1)`, no pair `i < j` | sound |
| 10 | `interfaceOperator` | `q = 2`; `q = 3` equal areas | `L_A u = 2A u` on `E^{(1)}`; `L_A = 3A Id` on `E^{(2)}` | sound |
| 11 | `modelProfile` | `q = 1`; off the open simplex; wrong base point | `0`; `0`; `φ(0.482734) = 0.355065 ≠ φ(1) = 0.241971` | sound |
| 12 | `modelMeasureMap_diffeomorph` | `q = 2`, `t = 0.7`; `q = 3`, `x = 0`; sign | derivative `−φ(0.7) = −0.312254`; `DΨ(0) = −0.423142 Id`; `+L_A/√2` gives `+φ(t)` | sound |
| 13 | `modelProfile_hessian` | `q = 2` general `t`; `q = 3` centre | `Dg(0)(u) = I′(Φ(−t))/√2 = t/√2 = ⟨x, u⟩/√2`; `H(2Au, u) = 2A · (−1/(2A)) = −1`; `q = 3`: `−1/(3A) = −1.671086`, `−tr = 1.196827 = 2 × 0.598413` | sound |
| 14 | `isoperimetricProfile_le_modelProfile` | `q = 2`, `n = 1`, `v = (1/2, 1/2)` and `(Φ(1), 1 − Φ(1))` | `0.398942` both sides; `0.241971` both sides | sound |
| 15 | same | `q = 1`, `n = 0`; `q = 0` | `volume{0} = 1`, `e^{−W} = 1`, cluster `(E)`: `0 ≤ 0`; `q = 0`: `hsum` false | sound |
| 16 | same, `hqn` dropped | `n = 0`, `q = 2` | left `∞`, right `0.398942` | `hqn` needed |
| 17 | same, `hv` dropped | `n = 2`, `v = (1/2, 1/2, 0)` | left `0.398942`, right `0` | `hv` needed |
| 18 | `gaussianSymmetral`, `gaussianPerimeter_gaussianSymmetral_le` (`Symmetrisation` section) | disc in `ℝ²`; `n = 1`, `(−1, 1)`; infinite perimeter; null-measurable `U` | `0.517483 ≤ 0.606531` (substitution `z = sin θ`); `(−∞, 0.475233)`, `0.356343 ≤ 0.483941`; `γ(U) = 0.116140`, symmetral `(−∞, −1.194508)`, `0.195467 ≤ ∞`; non-measurable sections lie over a null set of `e^⊥` | sound |
| 19 | `gaussian_isoperimetric` | `n = 0`; `∅`; half-space; disc; slab | `0 = 0` with `γ ∈ {0, 1}`; `∅` attains equality, not a half-space; `φ(s) = I(Φ(s))`; `0.606531 > 0.384633`; `0.483941 > 0.356343` | sound, both directions of the iff |
| 20 | `isoperimetricProfile_two_eq` | `v = (1/2, 1/2)`, `(1, 0)`; `n = 0` | `0.398942`; `0 = I(1)`; `∞ ≠ 0.398942` without `Nontrivial` | sound |
| 21 | `Cluster.perimeter_eq_iff_halfSpaces` | `h0` dropped with `cell 0 = ∅` | left side `0 = I(0)` true, right side false (no real `s` gives a null half-space) | `h0`, `h1` needed |
| 22 | `borell_sudakov_tsirelson` | half-space; disc, `r = 1`; `r = 0`; `{x_1 < 0} ∪ ℚ²` | equality; `0.864665 ≥ 0.767217` (`a = −0.270288`); `thickening 0 A = ∅`; thickening `ℝ²`, `1 ≥ Φ(r)` | sound |
| 23 | `borell_sudakov_tsirelson_multivariateGaussian` | `S` not PSD; `S = diag(1, 0)`; `ι` empty | `K = 0`, `δ_m(A) ≥ Φ(a) > 0` forces `m ∈ A`; `(−∞, 0] × {0}` gives `Φ(r)`, equality at `a = 0`; one-point space | sound |
| 24 | `gaussian_minkowskiContent_ge` | half-space; `ℚ²`; Bernstein set | `φ(a)`; quotient `1/r → ∞`; `(Φ(r) − 1/2)/r = 0.398278, 0.398936 → 0.398942` | sound in `[0, ∞]` |
| 25 | `bobkov_inequality` | `f = Φ`; `f = min(x², 1)`; constant; `n = 0` | `0.398942 = 0.398942`; `I(0.516059) = 0.398619 ≤ 0.647406`; `I(c)` both sides; `I(f(0)) ≤ I(f(0))` | sound |
| 26 | `gaussian_concentration_median` | `f = x_1`; `L = 0`; `r = 0` | equality `1 − Φ(r)`; `{f > m} = ∅`; `γ{f > m} ≤ 1/2` | sound |
| 27 | `gaussian_max_concentration` | two independent coordinates; `S = 0`; `S = [[1, 2], [2, 1]]` | median `0.544952`, `0.010899 ≤ 0.022750`; `σ = 0`; eigenvalue `−1`, law `δ_0`, left side `0` | sound |
| 28 | `closedGaussianSymmetral`, `convex_closedGaussianSymmetral` | closed disc, `F = ℝ²`; non-closed convex `C` of §9.5 | `{⟨y, u⟩ ≤ −0.270288}`; `{x_1 > 0} ∪ {0} × (−∞, 0]`, midpoint of `(0, −5)`, `(1, 100)` inside | sound |
| 29 | `ehrhard_inequality_convex` | `[−1, 1]`, `[−3, 3]`, `θ = 1/2`; `θ = 0`; `γ(A) = 1` | `1.690143 ≥ 1.628704`; `0 • A = {0}` for nonempty `A`; a convex set of full measure is `E` | sound |
| 30 | §6.5 pointwise mollification bound (new text) | `u = χ_{(−∞, 0)}` | `−ρ(x)` on both sides | sound |
| 31 | §1.2 tails | `r = 0, 1, 2` | `1/2 = 1/2`; `0.158655 < 0.241971`, `≤ 0.303265`; `0.022750 ≤ 0.067668` | sound |
| 32 | §1.3 coordinates on `E^{(q−1)}` | `q = 3` | `1 − Φ(√1.5) = 0.110336`; reciprocal factor `0.207108` | sound |
| 33 | §2.3 explicit perimeters | disc; quadrant; segment | `0.606531`; `2 × 0.199471 = 0.398942 > I(1/4) = 0.317777`; `0.136177` | sound |
| 34 | §2.4 strict lower semicontinuity | `(−1, 1) ∪ (1 + 1/k, 2)` | `0.779903 → ` against `0.295962` | sound |
| 35 | §3.2 merging and the half-annulus control | `a = 0`, `b = 1`; annuli `2^{−2k}` | `0.640913 − 0.398942 = 0.241971`; boundary length `2^{−2k}(3π/2 + 1)`, closed curve, total normal `0` | sound |
| 36 | §3.4 density `c(1 + y²) exp(−x²(1 + y²)⁴)` | integrability; line `x = 0` | `∫ dx = √π/(1 + y²)²`, total finite; `∫ c(1 + y²) dy = ∞` | sound |
| 37 | §4.3 injectivity and properness | ties `y − x = (1, 1, −2)` | `i` maximal gives `y + Ω_i ⊊ x + Ω_i`; `x + Ω_i ⊆ {z_i ≥ x_i}` | sound |
| 38 | §4.5 boundary limit | hyperplane `{z_i − z_j = c}` | distance `c/√2`; `z_i − z_l` has mean `c/2`, variance `2 − 1/2 = 3/2` | sound |
| 39 | §5.2 shifts | `(0, 1)`; `(−1, 0)` | `(0.408796, ∞)`, `0.366963`; `(−0.9, 0.063724)`: `0.664218`, `(−0.5, 0.385003)`: `0.722510`, both above `0.640913` | sound |
| 40 | §6.3–§6.5 on `{x_2 < 1 + x_1}` and the disc | both normalizations | `0.219696`, `0.310697`, `0.439391`; Cianchi et al. (4.10) as printed: `0.778801 ≤ 0.770391` fails; disc: `0.386129`, `0.252249` | sound; source errors listed below |
| 41 | §7.2 strip control | `ρ = 1/16`, `1/4` | bound `(256/27)ρ³` from `2^{−k_0} < 4ρ/3`; actual fraction `≈ 0.0329`; missing-section proportion `(5/6)ρ` | sound |
| 42 | §9.1 composition law | `F_1 ∩ F_2 = ℝu`, complements orthogonal | section measure after step one is `∫ γ_{F_1}(C_{a+g}) dγ(g) = γ_{F_1+F_2}(C_a)`, independent of the `F_1 ⊖ ℝu` coordinate | sound |
| 43 | §9.2 concavity of `g` | four points, closed-form second derivatives | determinants `0.163502`, `0.015519`, `0.000142`, `15.648788`, diagonal entries negative | sound |
| 44 | §9.3 cone inclusion | `u_j` at `90°, 135°, 157.5°` | `u_0` and `u_j` are mirror images in `u_{j+1}^⊥`, so each section grows by an interval of half-width `|⟨u_0, u_{j+1}⟩|`, and the line case of §8.1 moves the half-line endpoint by that amount | sound |
| 45 | §9.5 checks | `θ = 0.9` | `0.561033 + 0.993113 = 1.554146 ≤ 1.690143`; `0.954500 ≥ 0.948312 ≥ 0.825134` | sound |

## Dependency check

    depcheck: 239 roadmaps, 2254 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere (the earlier lead `Cluster.perimeter_eq_iff_halfSpaces` is declared at `Suggested.lean:357`).

## Verified sound

- **Declarations read: 37 of 37** (17 definitions and the structure with its fields, 20 theorems), each against its section's `variable` block and the supplied elaborated type. The three definitions flagged as losing binders (`gaussianWeight`, `gaussianSymmetral`, `closedGaussianSymmetral`) lose only instances their bodies do not use; every theorem carries the full block. No `lemma`, `set_option`, `#eval`, `#check`, sorry'd data or `True` placeholder; one `import Mathlib` and six `TauCeti.*` imports, each used.
- **Targets read: 47 sections of 9 layers, every line.** Every section has a `*Needs:*` line; no forward reference and no cycle (Layer 9 uses §8.1 only for `n = 1`, which rests on §5.3).
- **Headlines.** The eleven end theorems of the Summary and the nine layer results named in `README.md:5` are all stated; none is forced through a stand-in. No declaration is padding by the one-tactic probe: no pinned declaration states any of them (Tau Ceti's Gaussian `Cdf`, `Quantile`, `Projection`, `Density`, `Maximum` files and its `BoundedVariation` directory were read by declaration list; `MinkowskiContent.lean`, `HalfSpace.lean`, `Isometry.lean` are Euclidean only).
- **Pinned declarations: 93 name-and-line locators of the supplier contracts checked mechanically** against the pinned Mathlib and Tau Ceti; all resolve (three script mismatches were checked by hand: `Probability/Quantile.lean:340`, `:359`, `ReducedBoundary.lean:106`). Definitions relied on were read at the pin: `variationMeasure` (a `Measure Ω`, `0` outside the locally finite case), `reducedBoundary`, `outerNormal` (with the minus sign), `essentialBoundary` (complement of density-`0` and density-`1` points, so points with no density belong to it), `quantile`, `reducedBoundary_subset_essentialBoundary` (`2 ≤ finrank`).
- **Sibling citations checked: 8.** GeometricMeasureTheory G2, G5, G6 and Isoperimetry I1–I2, I4 (slicing, essential convexity) on main say what the contracts say; RandomMatrices 2.2 and BanachSpaceTheory B7 exist as cited. Ownership: `roadmaps grep` over main and the open heads for Ehrhard, Bobkov, Sudakov, Gaussian isoperimetry, Gaussian perimeter, isoperimetric profile, multi-bubble, Minkowski content and median concentration found no second owner; the only median bounds elsewhere are spherical (BanachSpaceTheory B7) and Talagrand's (RandomMatrices 2.2).
- **Locators verified: 58** (MilmanNeeman2022 26 ranges, CianchiFuscoMaggiPratelli2011 15, Ehrhard1983 10, Ledoux1999 4, Borell1975 1, Ledoux1993 1, Maggi2012 contents and synopsis 1), all correct except as S01 and S02 say.
- **Checks tested: the Checks of all 47 sections were read against their statements, and about 60 numerical values in them recomputed**; all correct. Every definition has at least three discriminating Checks (for `interfaceOperator` they are spread over the Conventions, §3.3 and §4.3).
- **Policy.** The pull request changes only `packages/GaussianIsoperimetryAndClusters/`. No pull-request number or process wording in the README or docstrings. No declared gaps; `design/plan.json` has `"gaps": []` and the README declares none.

## Not verifiable

- Bobkov1997, Corollary 1, inequality (10), p.209 and the argument after Corollary 2, p.210: the cached text is unusable OCR (only page markers are legible). Ledoux1999 line 296–313 confirms the inequality and the approximation by `(1 − d/r)_+`, but not Bobkov's numbering or his "locally Lipschitz" hypothesis.
- SudakovTsirelson1974 Theorem 1, CarlenKerce2001 Theorem 1, AmbrosioFuscoPallara2000 Theorem 3.108, Bogachev1998 Chapter 4: settled as uncertified, cited by locator only.
- Maggi2012 Theorem 15.9, Proposition 12.15, Theorem 12.26, Exercise 29.7: the extract has only contents and synopsis; the numbers are corroborated by MilmanNeeman2022 line 756, 939, 946, 769, not read.
- Ledoux1993 inequality (10) and Théorème 3: the OCR lost the displayed formulas; the labels are confirmed at line 241 and 264, the formulas are not.
- Elaboration of `Suggested.lean`: not run in this pass. The supplied elaborated signatures and the repair report's `lake env lean` result were relied on.
- Ownership against open pull requests was checked only through `roadmaps grep` on the indexed heads, not by reading each of the 197 sibling folders.

Source independence: 11 passages compared with 6 sources (MilmanNeeman2022 line 57–67, 515–517, 660–666, 892–893, 939–947; CianchiFuscoMaggiPratelli2011 line 226–232, 527–531; Ehrhard1983 line 118–127, 458–469; Ledoux1999 line 239–247; Borell1975 line 88–99; Maggi2012 line 716–725), none shared beyond statements the mathematics forces; largest share MilmanNeeman2022, 27 of 85 locators; contents compared with MilmanNeeman2022 (its Sections 2, 3, 4 appear as Layers 4, 2–3, 3, reordered and with wider scope): independent. Layers 5, 6, 7 draw on CianchiFuscoMaggiPratelli2011 Sections 3, 4.1, 4.2 in that order, which the `*Needs:*` lines §5.3 → §6.6 → §7.1 → §7.3 force, with different scope (§6.1 for subspaces, §6.2 and §7.2 by other routes). Bobkov1997 could not be read.

## Source issues

- **Gap** in MilmanNeeman2022 at Lemma 2.1, proof of injectivity, printed page 11: the source says a point `y ≠ x` lies in some open cell `x + Ω_i`; it should take an index maximizing `(y − x)_i`, since a tie puts `y` in no open cell; affects the proof.
- **Error** in CianchiFuscoMaggiPratelli2011 at equation (2.5), printed page 5 of the cvgmt preprint: the source says the surface-normalized perimeter of (1.2) equals a supremum of integrals against the probability measure; it should carry the factor `√(2π)` on the supremum; affects a stated result.
- **Misprint** in CianchiFuscoMaggiPratelli2011 at Lemma 4.4, equation (4.8), printed page 12: the source weights the section sum by the unnormalized exponential; it should carry `(2π)^{−1/2}`, the section measure being a probability; affects a stated result.
- **Error** in CianchiFuscoMaggiPratelli2011 at Lemma 4.5, inequality (4.10), printed page 13: the source bounds the surface-normalized perimeter of the symmetral by the unscaled variation term plus the section term; it should have `√(2π)` on the variation term (tilted half-plane: `0.778801 ≤ 0.770391` fails); affects a stated result.
- **Misprint** in CianchiFuscoMaggiPratelli2011 at Lemma 4.6, inequality (4.14), and equation (4.6), printed pages 12–14: the source claims equality for symmetrals with the gradient of the section measure; it should use the gradient of `√(2π)` times that measure; affects a stated result.

## For the human reviewers

- **Not tested.** Bobkov1997 (author-page PDF, 1 of 85 locators in the README, plus one docstring): the cached text is unusable OCR, so its wording, numbering and hypotheses were not compared; `sources.toml` records it as certified.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6f340f4dc4ed1993ddbb2cf3c5ed8b634cdb7198", "job": "RT-GaussianIsoperimetryAndClusters~2a", "model": "fable", "worker": "chris-x30"} -->
