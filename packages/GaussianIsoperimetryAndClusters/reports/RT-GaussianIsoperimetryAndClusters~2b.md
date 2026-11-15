<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16957#issuecomment-6902678609 -->
Red team round 2 pass b (claude) of 6f340f4

Verdict: accepted

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

Round 2. Every round-1 finding is repaired at this head, no repair introduced an error, and the full pass found no new finding (no S-numbered finding is raised). The tables under `## Verified sound` carry the values computed for each statement. No Lean was run in this pass: the brief gives no Lean command, so elaborated types were read from the worker's signature listing (37 declarations) and compared with the README.

## Round-1 findings at this head

| Round-1 finding | Status | Witness at `6f340f4` |
|---|---|---|
| 1a/F01 (P2), §4.7 headline absent | repaired | `packages/GaussianIsoperimetryAndClusters/Suggested.lean:292–298`: `theorem isoperimetricProfile_le_modelProfile … (hqn : q ≤ Module.finrank ℝ E + 1) … isoperimetricProfile (gaussianWeight E) q v ≤ ENNReal.ofReal (modelProfile q (WithLp.toLp 2 v))`; named in `README.md:5` and §4.7 (`README.md:422`). The full `E` instance block is in the signature. Dropping `2 ≤ q` is sound: `q = 1` gives `0 ≤ 0`, `q = 0` makes `hsum` read `0 = 1`. |
| 1a/F02 and 1b/F03, G4 cited for a statement it does not make | repaired | "G4" occurs nowhere in the README or the Lean file. §6.5 (`README.md:530`) derives "`‖∇v_ε(z)‖ ≤ ∫ ρ_ε(z − y) d|Dv_U|(y)` at every `z`" from the pinned `TauCeti.integral_lineDeriv_mul_eq_neg_integral_mul_inner_polarDensity` (PolarDecomposition.lean:292, read: scalar test function, vector `v`, right side `−∫ φ ⟪v, σ⟫ d|Du|`) and Mathlib `HasCompactSupport.hasFDerivAt_convolution_left` (Convolution.lean:92, read: `ContDiff 𝕜 1 f`, compact support, `LocallyIntegrable g`, `[IsNegInvariant μ]`); both are in the contracts (`README.md:63`, `:85`). Sign recomputed on `u = χ_{(−∞,0)}`: `(ρ ∗ u)′(x) = −ρ(x)`, formula `∫ ρ(x − y)(−1) dδ_0 = −ρ(x)`. |
| 1a/F03 (P3), §8.1 route at `n = 0` | repaired | `README.md:610`: "for `n = 0`, `γ` is the Dirac mass at the origin and `Φ(a) > 0`, so `Φ(a) ≤ γ(A)` forces `A = E = {0}`"; the same opening is in §9.5 (`README.md:730`). |
| 1a/F04 and 1b/F04 (P3), `Ledoux1996` | repaired | No `Ledoux1996` in the README or in `sources.toml` (12 ids, each cited in the README). |
| 1a/F05 (P3), Maggi2012 numbers cited as read | repaired | `README.md:189`, `:211`, `:221`, `:282` carry "cited by locator"; `README.md:766` separates the sections read in the extract from the four numbers cited by locator. The docstring at `Suggested.lean:113–114` cites the number bare, as the file does for every source. |
| 1b/F01 (P2), invertibility missing from `modelMeasureMap_diffeomorph` | repaired | `Suggested.lean:269`: `∀ (x : simplexTangent q) (i j : Fin q), i ≠ j → 0 < modelInterfaceArea q i j x`. Recomputed: `q = 2`, `x = 0.7u`: area `φ(0.7) = 0.312254`; `q = 3`, `x = 0`: `0.199471`. `i ≠ j` is needed: for `i = j` the set is a closed cell, not integrable for `μHE[q−2]`, integral `0`. |
| 1b/F02 (P3), Ehrhard 2.4 cited for general laws | repaired | `Suggested.lean:378`: "(Ledoux1999, (1.7), for centred laws; the mean `m` is a translation)"; Ehrhard1983 Théorème 2.4 now at `Suggested.lean:369`. Ehrhard1983 line 358–359 and Ledoux1999 line 239–247 read. |

New text introduced by the repairs (§4.7 Checks, the `t³` Check of §4.3, the §6.5 mollification route, the `n = 0` openings) was recomputed; values are in the table below.

## Findings

None.

## Verified sound

Counts: 37 declarations read (17 definitions, 20 theorems; whole file); 45 bold README targets and their Checks read (whole README, 768 lines); about 55 source locators verified against the cached texts; about 100 numerical values in Checks recomputed (all agree to the printed six places, up to quadrature error in two integrals with endpoint singularities); every file:line citation of the supplier contracts resolved at the pins (about 110; each declaration is at the cited line, and the statements this pass relies on were read); 9 sibling citations checked (GeometricMeasureTheory G2, G5, G6; Isoperimetry I1, I2, I4 twice; RandomMatrices 2.2; BanachSpaceTheory B7; all on main).

### Statement table (Suggested.lean)

Context: sections `Weighted`, `Clusters`, `Symmetrisation` carry `{E} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]`; section `Model` has no variables. The three definitions the listing flags (`gaussianWeight`, `gaussianSymmetral`, `closedGaussianSymmetral`) lose only instances their bodies do not use; every theorem about them carries the full block.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `gaussianIsoperimetricProfile` | `v = 1/2, 1/3, 0, 1, 1.5`; wrong model `φ(quantile)` at `0` | `0.398942`, `0.363600`, `0`, `0`, `0`; wrong model gives `0.398942` at `0` | determined |
| `weightedVariation`, `weightedPerimeter` | `W = 0` against `TauCeti.totalVariationOn` (TotalVariation.lean:100, same supremum); `U = ℝ` under `γ`; model without `−⟨∇W, X⟩` | body equal at `W = 0`; `0`; wrong model `0.797885` | determined |
| `weightedMeasure`, `gaussianWeight` | density at `0 ∈ ℝ²`; against `stdGaussian_eq_withDensity_norm` (Density.lean:178) | `e^{−W(0)} = (2π)^{−1} = 0.159155` on both sides | agrees |
| `gaussianPerimeter` | `{x_1 < 1}`; unit disc; `(−1, 1)` | `0.241971`; `0.606531`; `0.483941` | agrees with §2.3 |
| `weightedVariation_eq_lintegral_variationMeasure` | `u = χ_{(−1,1)}`, `γ` on `ℝ`; `u(t) = t` | `2φ(1) = 0.483941` both sides; `1` both sides. Right side integrates over `↥Ω` (`variationMeasure : Measure Ω`) | holds |
| `weightedPerimeter_eq_lintegral_reducedBoundary` | `n = 1`, `(−1, 1)` (`μHE[0]` counting); `n = 0` without `hn` | `0.483941` on all three; at `n = 0`, `μHE[0]` would be read: excluded by `hn` | holds; `hn` needed |
| `integral_weightedDivergence_eq_integral_reducedBoundary` | `U = (−∞, s)`; inner normal | both sides `X(s)φ(s)`; inner normal gives `−X(s)φ(s)` | sign fixed |
| `weightedVariation_eq_lintegral_weightedPerimeter` | `u = χ_U`; `u(t) = t`; `u ∉ BV_loc` | `P`; `1 = ∫φ`; both sides `∞` by the local comparison of §2.1 | holds |
| `Cluster`, `Cluster.perimeter` | `q = 0`; `q = 1`; three intervals; overlapping cells | none (`volume E > 0`); only `(E)`, perimeter `0`; `φ(a) + φ(b)`; excluded | determined |
| `isoperimetricProfile` | `n = 0`, `v = (1/2, 1/2)`; vertex | empty infimum `∞`; `0` | as README |
| `exists_cluster_perimeter_eq_isoperimetricProfile` | `n = 0`, `q = 2`, `v = (1/2, 1/2)`; `q = 0`; `q = 1`; density with one line of infinite weighted length | no cluster, profile `∞`, statement would be false: `[Nontrivial E]` needed; vacuous; `(E)`; annuli give a finite-perimeter competitor (spheres compact) | holds |
| `simplexTangent`, `modelCell`, `modelMeasureMap` | `q = 2`, `x = tu`; `q = 1` | `Ψ_1(tu) = Φ(−t)`; `Ψ(0) = (1)` | agrees with §4.1 |
| `modelInterfaceArea` | `q = 2`; `q = 3`, `x = 0`; `i = j` | `φ(t)`; `0.199471`; junk `0` | used for `i ≠ j` only |
| `interfaceOperator` | `q = 2` on `u` | `L_A u = 2A u` | agrees |
| `modelProfile` | `q = 2`, `v = (Φ(1), 1 − Φ(1))`; wrong point `v − 1/q` | `0.241971`; wrong model `0.355065` | determined |
| `modelMeasureMap_diffeomorph` | `q = 2`, `t = 0.7`; `q = 3`, `x = 0`; sign `+L_A/√2` | derivative `−0.312254`; `−0.423142 Id`; wrong sign `+0.312254` | holds |
| `modelProfile_hessian` | `q = 2`; `q = 3` centre | `Dg(0)u = t/√2 = I′(v_1)/√2`; `H(2φu, u) = −1`; `∇² = −1.671086`, trace identity `1.196827 = 2 × 0.598413` | holds |
| `isoperimetricProfile_le_modelProfile` | `q = 2`, `v = (1/2, 1/2)`; `q = 1`; `n = 0`, `q = 2`; `v = (1/2, 1/2, 0)` | `0.398942 ≤ 0.398942`; `0 ≤ 0`; `∞ ≤ 0.398942` false, excluded by `hqn`; `0.398942 ≤ 0` false, excluded by `hv` | holds |
| `gaussianSymmetral` | `{⟨x, e⟩ < 1}`; disc, section at `0`; flipped side | fixed; `(−∞, 0.475233)`; wrong measure `0.158655` | determined |
| `gaussianPerimeter_gaussianSymmetral_le` | disc; `n = 1`, `(−1, 1)`; infinite perimeter | `0.5175 ≤ 0.606531`; `0.356343 ≤ 0.483941`; `0.195467 ≤ ∞` | holds |
| `gaussian_isoperimetric` | disc; `∅`; `n = 0`; half-space | `0.606531 > 0.384633`; equality with `γ = 0`; `0 = 0` and first disjunct; `φ(s) = I(Φ(s))` | iff holds both ways |
| `isoperimetricProfile_two_eq` | `(1/2, 1/2)`; `(1, 0)`; `n = 0` | `0.398942`; `0`; `∞ ≠ 0.398942`, excluded | holds |
| `Cluster.perimeter_eq_iff_halfSpaces` | half-space pair; `(E, ∅)` | both sides true; perimeter `0 = I(1)` but not half-spaces, excluded by `h1` | holds |
| `borell_sudakov_tsirelson` | half-space; disc, `r = 1`; `n = 0`; `A = ∅` | equality; `0.864665 ≥ 0.767217`; `1 ≥ Φ(a + r)`; vacuous | holds |
| `borell_sudakov_tsirelson_multivariateGaussian` | `S` not PSD; `S = diag(1, 0)`; non-measurable `A` | `δ_m`, `m ∈ A`, `1`; equality `Φ(r)`; outer measure of a cylinder equals that of its base, so `(T_*γ)(A) = γ*(T⁻¹A)` | holds |
| `gaussian_minkowskiContent_ge` | half-space; `ℚ²`; Bernstein set | `φ(a)`; `∞ ≥ 0`; `0.398278`, `0.398936 → 0.398942` | holds |
| `bobkov_inequality` | `Φ(x)`; `Φ(2x)`; `min(x², 1)`; constant | `0.398942` both; same; `0.398619 ≤ 0.647406`; equality | holds |
| `gaussian_concentration_median` | `f = x_1`; `L = 0`; `r = 0` | equality; empty set; `≤ 1/2` | holds |
| `gaussian_max_concentration` | two independent normals; `S = 0`; `S` not PSD | `0.010899 ≤ 0.022750`; `0`; `0` | holds |
| `closedGaussianSymmetral` | closed disc; closed ball in `ℝ³`; direction `−u` | `{⟨y, u⟩ ≤ −0.270288}`; `{x_3 ≤ −0.846102}`; reflected half-space | determined |
| `ehrhard_inequality_convex` | `[−1, 1]`, `[−3, 3]`, `θ = 1/2`; `θ = 0`; `A = ∅` | `1.690143 ≥ 1.628704`; `0 • A + B = B` for nonempty `A`; vacuous | holds |
| `convex_closedGaussianSymmetral` | non-open, non-closed `C` of §9.5 | midpoint `(1/2, 47.5)` in the symmetral | holds. Note: the route never uses `hu` or `hu1` (the level `⟨x, u⟩` is linear for any `u`); they tie `u` to the object of §9.1 and are harmless. |

### README targets

Recomputed and agreeing, by section: §1.1 (`I′(0.3) = 0.524401`, second difference `−2.876104`); §1.2 (`0.158655 < 0.241971`, `0.303265`, `0.022750 ≤ 0.067668`; monotonicity of `e^{r²/2}(1 − Φ)`); §1.3 (`0.110336`, wrong factor `0.207108`); §2.3 (ball formula, quadrant `0.398942 > 0.317777`, segment `0.136177`); §2.4 (`0.779903` against `0.295962`); §3.2 (merge `0.640913 − 0.398942 = 0.241971`); §3.4 (the density `c(1 + y²)exp(−x²(1 + y²)⁴)`: marginal `c√π/(1 + y²)` integrable, line `x = 0` of infinite weighted length); §4.1 (conormals sum to `0`); §4.3 (`∂_wΨ_i = Σ_j ⟨w, n_ij⟩A_ij = −(L_A w)_i/√2`; properness bound); §4.5 (mean `c/2`, variance `3/2` of `z_i − z_l` on `{z_i − z_j = c}`); §4.6 (`∇_w Σ A_ij = −½⟨w, L_A x⟩`, then `∇I_m = Ψ⁻¹/√2`); §5.2 (derivative `−φ(a′)(a′ + b′)`; `0.408796`, `0.366963`; controls `0.664218`, `0.722510`); §6.3 (`0.219696 ≤ 0.310697`; the escaping-tails control, `v_U = 1/2 + h`, bound `0.995297`); §6.4 (`0.778801`, `0.592901`); §6.5 (`0.439391`; ball `0.386129`, `0.252249`); §6.6 (`0.116140`, `−1.194508`, `0.195467`); §7.2 control (`0.032981`; proportions `0.208333`, `0.052083`; bound `(256/27)ρ³` rederived); §8.1 (`−0.270288`, `0.767217`); §8.5 (`0.544952`); §9.1 (`0.198748`, `−0.846102`; composition law verified by Fubini in `ℝu ⊕ G_1 ⊕ G_2 ⊕ R`); §9.2 (Hessians at four points, determinants `0.163502`, `0.015519`, `0.000142`, `15.65`); §9.3 (directions `90°`, `135°`, `157.5°`); §9.5 (`1.628704`, `0.948312`, `0.825134`; `0.561033 + 0.993113`).

Proof routes checked for unowned inputs and cycles: every *Needs:* line names an earlier section, a pinned declaration (resolved) or G2/G5/G6/I4 on main. §9.5 uses §9.4 in dimension `n + 1` and the symmetral corollary uses §9.5 in `F`: no cycle. §9.3 uses §8.1 on the line only.

Ownership: `roadmaps grep` for Gaussian isoperimetry, Ehrhard, Bobkov, Borell, Sudakov–Tsirelson, weighted or Gaussian perimeter, multi-bubble, minimizing cluster and Gaussian concentration found no other owner on main or in the open pull requests; RandomMatrices 2.2 (mean-centred, logarithmic Sobolev) and BanachSpaceTheory B7 (spherical) state different results. The pins contain no Gaussian isoperimetric, Ehrhard or Bobkov statement (grep of both libraries).

Policy: the pull request changes only `packages/GaussianIsoperimetryAndClusters/` (9 files); no `lemma`, `set_option`, pull-request number or process word in the README or the Lean file; imports are `Mathlib` and six `TauCeti.*` modules, each used. Headline theorems named in the Summary are all stated; no declaration is a one-step consequence of the library or of a definition.

Dependency check (the brief's command):

    depcheck: 239 roadmaps, 2254 edges, 0 problem(s)

Source independence: 13 passages compared with 5 sources (MilmanNeeman2022 line 57–61, 548–553, 892–895, 939–956; CianchiFuscoMaggiPratelli2011 line 226–232, 508–509, 527–531; Ehrhard1983 line 134–140, 458–469; Ledoux1999 line 252–271, 306–313; Borell1975 line 88–99; and the `Cluster` docstring against MilmanNeeman2022 line 57–59), none shared beyond statements the mathematics forces (longest run 8 words, MilmanNeeman2022 line 893–894); largest share MilmanNeeman2022, 25 of 83 locators; contents compared with MilmanNeeman2022: independent (its Sections 2, 3, 4 correspond to Layers 4, 2–3, 3, in a different order and with wider scope here). Layers 5, 6, 7 run parallel to CianchiFuscoMaggiPratelli2011 Sections 3, 4.1, 4.2; that order is forced by the *Needs:* lines of §6.5 and §6.6 (on §5.3) and of §7.1 (on §6.6), and each layer has material of its own (§5.1, the `n = 1` and infinite-perimeter cases of §6.6, §7.4). Bobkov1997 could not be compared (below).

## Not verifiable

- Bobkov1997 Corollary 1, inequality (10), p.209 and the argument after Corollary 2, p.210 (§8.3): the cached text is unreadable OCR (no word "Corollary" or "Lipschitz" in 225 lines). Ledoux1999 line 296–313 states the inequality and the approximation, which corroborates the mathematics, not the numbering.
- SudakovTsirelson1974, CarlenKerce2001, AmbrosioFuscoPallara2000, Bogachev1998: settled as uncertified, cited by locator.
- Maggi2012 Theorem 15.9, Proposition 12.15, Theorem 12.26, Exercise 29.7: not in the cached extract; MilmanNeeman2022 line 756, 769, 939, 946 cite the same numbers.
- Locator ranges not opened in this pass: CianchiFuscoMaggiPratelli2011 line 633–779 beyond line 652–660; Ehrhard1983 line 222–285 and 377–457; MilmanNeeman2022 line 577–659.
- Elaboration: not run here. The types compared are those of the worker's listing for this head.

## Source issues

- **Error** in CianchiFuscoMaggiPratelli2011 at Lemma 4.5, inequality (4.10), preprint p.13 (line 624–631): the source says the surface-normalized perimeter of the symmetral is at most the unscaled variation term plus the section term; it should carry the factor `√(2π)` on the variation term (tilted half-plane: `0.778801 ≤ 0.770391` fails); affects a stated result.
- **Misprint** in CianchiFuscoMaggiPratelli2011 at Lemma 4.4, equation (4.8), preprint p.12 (line 613–618): the source says the gradient of the section measure is the sum of normal ratios against the unnormalized weight; it should have the factor `(2π)^{−1/2}`, as its own line 657 uses; affects the proof.
- **Gap** in CianchiFuscoMaggiPratelli2011 at Theorem 4.1, preprint p.10 (line 508–509): the source says equality holds exactly for sets equivalent to a half-space; it should also allow sets of measure `0` or `1`, as its Proposition 3.1 does; affects a stated result.
- **Gap** in MilmanNeeman2022 at the proof of Theorem 4.1 (i), p.22 (line 948–949): the source says the family of clusters with a prescribed measure vector is clearly non-empty; it should exhibit one of finite weighted perimeter (annuli; half-spaces can fail); affects the proof.
- **Gap** in MilmanNeeman2022 at the proof of Lemma 2.1, p.11 (line 513–543): the source says that a second apex lies in some open translated cell; it should treat ties of the maximal coordinate; affects the proof.

## For the human reviewers

- **Not tested.** Bobkov1997 (`sources.toml`: `certified`, author-page copy): the cached extraction is unreadable, so the wording and the locators of §8.3 were not compared with it; the manifest says they were read from the PDF.
- **Licence.** Maggi2012 is read in a 38-page extract (contents and synopsis); four numbered results are cited by locator only (`README.md:766`).
- **Scope.** `design/plan.json` (line 1352, 2029–2033) still names GeometricMeasureTheory G4 as a supplier; the README no longer cites G4 and the dependency check reads the README. Whether the plan is amended is the maintainer's decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6f340f4dc4ed1993ddbb2cf3c5ed8b634cdb7198", "job": "RT-GaussianIsoperimetryAndClusters~2b", "model": "fable", "worker": "chris-x90"} -->
