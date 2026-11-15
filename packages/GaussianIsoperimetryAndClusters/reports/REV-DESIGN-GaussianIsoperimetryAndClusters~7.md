<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13761#issuecomment-6896213193 -->
Review (claude) of 418e940

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §7.2 route: "almost every nearby section" overstates what density one gives

   **Location.** `packages/GaussianIsoperimetryAndClusters/design/README.md` line 541: "density one at both points makes almost every nearby section in direction `e` meet `H` near both points".

   **Claim.** At two density-one points, almost every nearby line in direction `e` meets `H` near both.

   **Witness.** `U = ℝ² ∖ ⋃_k {|x_1 − 2^{−k}| < 4^{−k}}` has density one at `0` (removed fraction of `ball(0, ρ)` is `O(ρ)`), yet every vertical section over the strips misses `U`. CianchiFuscoMaggiPratelli2011 line 936–943 claims only the proportion `1 − 2ε`.

   **Exact repair.** Replace the clause by: "for every `ε > 0` and all small `ρ`, the sections in direction `e` over all but a proportion `2ε` of the `(n − 1)`-cube of half-side `ρ` about the common base point meet `H` in positive measure within `ρ` of both points; these are half-lines by §7.1 and contain the segment between up to a null set, so `H` fills a proportion at least `1 − 2ε` of the cube of half-side `ρ` about each point of the open segment". Tested on the witness: its sections over the strips are excluded by the proportion, and the statement of §7.2 is unchanged.

2. **F02** (P3) §1.1: the pinned derivative of `Φ` and the pinned Gaussian quantile are used or available but not cited

   **Location.** `design/README.md` line 109: "differentiate the inverse and use `φ′(t) = −t φ(t)`"; its *Needs:* line and the "Gaussian laws and quantiles" contract (lines 59–63).

   **Claim.** The contract lists every pinned input of §1.1.

   **Witness.** The route needs `Φ′ = φ`. Pinned: `TauCeti.Probability.hasDerivAt_cdf_gaussianReal` (TauCeti/Probability/Distributions/Gaussian/Cdf.lean:226); also `TauCeti.Probability.quantile_gaussianReal_zero_one` (TauCeti/Probability/Distributions/Gaussian/Quantile.lean:72), `Φ⁻¹(u) = √2 erfInv(2u − 1)` on `(0, 1)`. Neither is named.

   **Exact repair.** Add to the Tau Ceti contract: "`TauCeti.Probability.hasDerivAt_cdf_gaussianReal` (Cdf.lean:226): for nonzero variance the distribution function has the Gaussian density as derivative at every point; `TauCeti.Probability.quantile_gaussianReal_zero_one` (TauCeti/Probability/Distributions/Gaussian/Quantile.lean:72): on `(0, 1)` the standard normal quantile is `√2 erfInv(2u − 1)`". Add the first to the *Needs:* line of §1.1 and to the plan's 1.1 prerequisites. Checked on the instance: with `Φ′ = φ`, `(Φ⁻¹)′ = 1/φ(Φ⁻¹)` and `I′ = φ′(Φ⁻¹)/φ(Φ⁻¹) = −Φ⁻¹`, which is `0.524401` at `v = 0.3`.

3. **F03** (P3) two *Needs:* lines omit sections their routes use directly

   **Location.** `design/README.md` line 269 (§3.3): "*Needs:* §3.2; Tau Ceti `TauCeti.setLIntegral_enorm_sub_setAverage_le_mul_totalVariationOn_of_eq_ball`"; line 532 (§7.1): "*Needs:* §3.5, §5.3, §6.6."

   **Claim.** Each line lists what the route needs, item by item.

   **Witness.** §3.3: "zero perimeter makes `χ_U` locally of zero variation" is the local comparison bullet of §2.1. §7.1: "on good points the chain of §6.6 is then an equality" uses the good points of §6.2, the section bound of §6.4 and `γ(S_e(H)) = γ(H)` of §6.1.

   **Exact repair.** §3.3: "*Needs:* §2.1, §3.2; Tau Ceti …". §7.1: "*Needs:* §3.5, §5.3, §6.1, §6.2, §6.4, §6.6." Add `target:2.1` to the plan's 3.3 prerequisites and `target:6.1`, `target:6.2`, `target:6.4` to 7.1. All four are earlier sections, so no order changes (the plan's edges stay backward).

Three findings, all P3 (no P1, no P2): none is blocking, but each carries a repair, so the verdict asks for changes and a fix round applies R01–R03. The round-6 finding is repaired. The reviewed README, plan and manifest were left unchanged; no source was fetched and no manifest entry was added. There are no maintainer notes and no declared supplier gaps.

## Repairs of the previous round

| Round-6 finding | Disposition | Repaired passage and my check |
|---|---|---|
| F01 (P3), §9.1 called Ehrhard's convention sublevel | **Repaired** | §9.1: "in the mirrored superlevel convention: his half-space `H(u, a) = {⟨x, u⟩ > a}` (line 64–66) is a superlevel set, so with his `T = F^⊥` his `S(T, u)` is `S̄_{F,−u}` on closed sets"; §6.1: "Ehrhard1983 Définition 1.1, line 117–129, for open and closed sets and also in the mirrored superlevel convention … his `S(T, u)` is `S_{F,−u}` on open sets". Read Ehrhard1983 line 63–66 (open half-space with `>`) and line 118–127 (`T` of dimension `n − k`, `u ⊥ T`, section `H(u, a)` or its closed counterpart, `a` fixed by equal `γ_k`-measure). Computed: closed section of measure `v` is `{⟨y, u⟩ ≥ a}` with `1 − Φ(a) = v`, so `a = −Φ⁻¹(v)`; `S̄_{F,−u}` gives `{Φ(−⟨y, u⟩) ≤ v} = {⟨y, u⟩ ≥ −Φ⁻¹(v)}`: the same set. At `v = Φ(1)`: threshold `−1`, measure `0.841345`. |

It was not marked not actionable. **Adversarial pass on the changed text.** The extended third Check of §9.1 was evaluated: `S̄_{F,u}` fixes `{⟨x, u⟩ ≤ 1}`, Ehrhard's rule gives `{⟨x, u⟩ ≥ −1}`, both of measure `0.841345`; the two sets differ for every `a` (at `a = 0` they are opposite half-spaces), so "different half-space" holds without exception. Proposition 1.2 (Ehrhard1983 line 135–136, `S(T, u)[∁A] = ∁S(T, −u)[A]`) against the bullet `S_{F,u}(E ∖ C) = E ∖ S̄_{F,−u}(C)`: on a fibre, `{Φ(s) < 1 − v}` is the complement of `{Φ(−s) ≤ v} = {Φ(s) ≥ 1 − v}`. **Pattern search.** "sublevel", "superlevel", "mirrored", "Définition", "Definition 1": the remaining uses (Conventions, §6.1 first Check, §9.1 route, §9.3) describe this roadmap's own sublevel rule or Ehrhard's superlevel one correctly. Plan locators of 6.1 and 9.1 and the test `direction_matters` carry the same wording.

## Verified sound

**Coverage.** Whole README (733 lines, nine layers), plan (46 targets: 10 definitions, 36 theorems; every `target:` prerequisite points backwards; `gaps` is empty; no definition has fewer than three tests), manifest (13 works, one key each; every work cited in the README has an entry). Principles: the weighted theory is for every positive `C¹` density on intrinsic finite-dimensional inner product spaces; no route-specific restriction, no re-planned roadmap, no upward or cyclic supply, no copied passage, no algorithm, no `set_option`, no sorry'd data. No `Suggested.lean` exists at the design stage, so there is no Lean form, one-tactic probe or `#check` binder audit. **Elaboration: not available (this lane does not elaborate; say so in the report).**

**Dependency gate** (command of the brief):

```text
candidate: GaussianIsoperimetryAndClusters is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2229 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

**Source sample** (the 15 seeded targets of this round; the author flagged no locator as unverified). Read at the cited lines of the cached texts:

| Target | Lines read | Result |
|---|---|---|
| 2.1 | MilmanNeeman2022 line 26–33, 753–754; CianchiFuscoMaggiPratelli2011 line 200–208 | supremum of `∫_U (div X − ⟨∇W, X⟩) dμ` over `C^∞_c` fields of norm `≤ 1`; (2.5) for open sets with `C¹_0` fields and the probability measure |
| 2.3 | MilmanNeeman2022 line 32–33; CianchiFuscoMaggiPratelli2011 line 48–56, 182–184 | agreement with `γ^{n−1}(∂U)` for nice sets; half-space perimeter `e^{−s²/2}` in the other normalization; converse criterion on bounded open sets |
| 3.3 | MilmanNeeman2022 line 892–905 | Lemma 3.4 as stated; the source proves connectedness by the Gaussian isoperimetric inequality, the roadmap by BV Poincaré (its own route, valid for every weight) |
| 4.1 | MilmanNeeman2022 line 499–505 | `Ω^m_i = int{max_j x_j = x_i}`, translated cluster, `Σ^m_ij = ∂Ω^m_i ∩ ∂Ω^m_j`, `A^m_ij(x) = γ^{q−2}(x + Σ^m_ij)` |
| 4.3 | MilmanNeeman2022 line 506–543 | Lemma 2.1, (2.2) `DΨ = −L_{A^m}/√2`; injectivity step at line 515–517 has the tie gap the README repairs; invariance of domain at line 539–540 |
| 5.2 | CianchiFuscoMaggiPratelli2011 line 226–232 | Definition 3.2 (`a < a′ < b′ ≤ ∞`), Lemma 3.3 (`a + b ≥ 0`, strict) |
| 6.2 | CianchiFuscoMaggiPratelli2011 line 527–542 | Vol'pert's theorem (i)–(iii) for locally finite perimeter, `n ≥ 2`, and (4.1) for Borel `g ≥ 0` |
| 7.1 | CianchiFuscoMaggiPratelli2011 line 889–912 | Steps I–II: local equality for every Borel `B`, then `p_H = p_{H^s}` a.e. and Proposition 3.1 |
| 7.2 | CianchiFuscoMaggiPratelli2011 line 913–966 | Steps III–IV; the proportion `1 − 2ε` at line 943 (R01) |
| 7.3 | CianchiFuscoMaggiPratelli2011 line 508–509, 220–223; MilmanNeeman2022 line 47–52, 83–84; Ledoux1999 line 212–219; Borell1975 line 85–99 | Theorem 4.1 (`n ≥ 2`), Proposition 3.1 (`n = 1`, with the measure `0`/`1` cases); uniqueness attributed to Carlen–Kerce |
| 7.4 | MilmanNeeman2022 line 98–102, 83–84, 68–70 | Theorems 1.1–1.2 for `2 ≤ q ≤ n + 1`; for `q = 2` simplicial cells are half-spaces |
| 8.1 | Borell1975 line 88–99; Ledoux1993 line 241–256; Ledoux1999 line 220–247; Ehrhard1983 line 356–359 | (3.1) with `Φ(α) = μ(A)`; "ou seulement `≥`"; (1.5), (1.7) with `K = M(B_2)`; Théorème 2.4 for Borel sets, `r ≥ 0` |
| 8.3 | Bobkov1997 pp.209–210 (text layer of the cached PDF); Ledoux1999 line 296–313; CianchiFuscoMaggiPratelli2011 line 596–601, 656–721 | "Corollary 1 … for any locally Lipschitz function", running heads 209 and 210, Corollary 2 and the cutoff `max(1 − dist/h, 0)`; (1.11) and `f_r = (1 − d/r)^+`; (4.6), (4.13) |
| 8.4 | Ledoux1993 line 255–262; Ledoux1999 line 225–226 | median form for `‖f‖_Lip ≤ 1`; `γ(A_r) ≥ Φ(r) ≥ 1 − e^{−r²/2}` (no factor `½`, as the README says) |
| 9.1 | Ehrhard1983 line 63–66, 118–140, 329–355 | Définition 1.1, Proposition 1.2, Lemme 2.2, Corollaire 2.3 (`k − 1` two-dimensional symmetrisations) |

Outside the sample I also read MilmanNeeman2022 line 57–82, 548–560, 764–784 and Maggi2012 line 67–112, 161–175, 713–727 (contents and Part IV synopsis).

**Adversarial table** (my own computation, double precision: bisection on `erfc`, midpoint and Simpson quadrature).

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| Conventions | half-space `{⟨x, ν⟩ > 1}` | `1 − Φ(1) = 0.158655`, `φ(1) = 0.241971`, `e^{−1/2} = 0.606531`, ratio `2.506628` | sound |
| 1.1 | `v = 0.3`, `1/3`, `1/2` | `I(0.3) = 0.347693`, `−1/I = −2.876104`, `−Φ⁻¹(0.3) = 0.524401`; `Φ⁻¹(1/3) = −0.430727`, `I = 0.363600`; `0.398942` | sound; R02 on the cited inputs |
| 2.1 (sampled) | wrong model on `U = ℝ`; `U = E`; weight `W + c` | `∫ X′ φ = ∫ tXφ`, supremum `√(2/π) = 0.797885`; `∫ div(e^{−W}X) dx = 0`; `div_μ` unchanged, `dμ` scaled by `e^{−c}` | sound |
| 2.3 (sampled) | `n = 1, 2` ball; `C = ∅, E`; dense null set added | `2φ(1) = 0.483941`; `e^{−1/2} = 0.606531`, `γ = 0.393469`, `I = 0.384633`; `0 = 0`; middle term `0.606531`, frontier term `∞` | sound |
| 3.3 (sampled) | three intervals; `(E, ∅, ∅)`; component `S` | form `φ(a)(a_1 − a_2)² + φ(b)(a_2 − a_3)²` zero on `E^{(2)}` only at `0`; `L_A = 0` at a vertex; `P_μ(U) = 0` forces `χ_U` a.e. constant on every `ball(0, R)` | sound; R03 |
| 4.1 (sampled) | `q = 2`; `q = 3`, `x = 0`; conormals; `q = 2` factorization | measure `Φ(−t)`, `A_12 = φ(t)`; `A = 0.199471`, total `0.598413`; `(−1,−1,2) + (2,−1,−1) + (−1,2,−1) = 0`; `γ_{{0}}({0}) = 1` so `A_12 = φ(⟨n_12, x⟩)`; mean of normals at `60°` has norm `0.866025` | sound |
| 4.3 (sampled) | `q = 2`, `t = 0.7`; `q = 3`; ties `(1, 1, −2)`; properness | `−φ(0.7) = −0.312254`, difference quotient `−0.312254`; `3A/√2 = 0.423142`; `(z − x)_1 − (z − x)_j = (z − y)_1 − (z − y)_j + (y − x)_1 − (y − x)_j > 0`; mean-zero `z − x` in cell `i` has `(z − x)_i > 0` | sound |
| 4.4 / 4.6 | wrong centre for `v = (Φ(1), 1 − Φ(1))`; `q = 2`, `q = 3` | `t = 0.482734`, `φ(t) = 0.355065` against `0.241971`; `−½⟨−√2 L⁻¹δ, Lx⟩ = ⟨δ, x⟩/√2`; `−1/(3A) = −1.671086`, `6A = 1.196827` | sound |
| 5.2 (sampled) | `(0, 1)`; `(−1, 0)` shifted right | derivative `−φ(a′)(a′ + b′)`; `0.341345`, `0.640913`, `0.408796`, `0.366963`; `(−0.9, 0.063724)`: `0.664218`; `(−0.5, 0.385003)`: `0.722510` | sound |
| 6.2 (sampled) | tilted half-plane; half-plane cut by a ball; `|U| = 0` | `√(1 + m²) · 1/√(1 + m²) = 1 = ∫_0^1 dz`; volume `πR²/2`, perimeter `πR + 2R`, section `(−√(R² − s²), 0)`; empty reduced boundary | sound |
| 6.6 | unit disc | `∫ √(I(v_U)² + v_U′²) φ dz = 0.517483` (midpoint rule in `z = sin θ`, 4000 and 64000 nodes agree) | sound |
| 7.1 (sampled) | localisation step | `P(S; B) ≤ P(H; B)`, `P(S; B^c) ≤ P(H; B^c)`, sums `P(S) ≥ P(H)` finite: both equalities | sound; R03 |
| 7.2 (sampled) | half-space; `{x_1 < 0} ∪ ℚ²`; strip example | `H^{(1)} = H`; `H^{(1)} = {x_1 < 0}`; density one at `0` with empty sections over strips of positive measure | statement sound; route wording R01 |
| 7.3 / 7.4 (sampled) | disc, slab, `∅`, `(E, ∅)` | `0.606531 > 0.384633`; `0.483941 > 0.356343`; `0 = I(0)`; vertex value `0`, not simplicial | sound |
| 8.1 (sampled) | half-space; disc `r = 1`; `S = 0`; `A = ∅`; `r = 0` closed form | `Φ(a + r)` both; `a = −0.270288`, `0.864665 ≥ 0.767217`; `δ_m(A) = 1` forced; no real `a`; `γ(closure A) ≥ Φ(a)`; `f′ ≥ I(f)` a.e., `G′ ≥ 1`, `G(s) − G(s′) ≥ s − s′` | sound |
| 8.3 (sampled) | `Φ(x)`, `Φ(2x)`, `min(x², 1)`; converse with `A = ∅` | `0.398942`, `0.398942`; `0.516059`, `0.398619 ≤ 0.647406`; `0 ≥ I(0) = 0` | sound |
| 8.4 / 8.5 (sampled) | `x_1`; `|x_1|`; constant `f`; two normals | `0.022750 ≤ 0.067668`; `0.674490`, `0.797885`; `{f > m}` empty; `0.544952`, `0.010899 ≤ 0.022750` | sound |
| 9.1 (sampled) | disc; ball in `ℝ³`; composition law; complement law | `−0.270288`; `0.198748`, `−0.846102`; second-step section measure `∫ v_C(x″ + g_2) dγ(g_2) = γ_{F_1 + F_2}(C_{x″})`, independent of `g_1`; fibres agree | sound |
| 9.3 / 9.5 | directions; `[−1, 1]`, `[−3, 3]` | `90°`, `135°`, `157.5°`; `1.690143 ≥ ½(0.475233) + ½(2.782175) = 1.628704` | sound |
| 1.3, 4.7 | `q = 3` coordinate law; three intervals | `0.110336` against `0.207108`; `0.727200 > 0.598413` | sound |

**Pinned libraries.** `lake-manifest.json` pins Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, equal to the plan baseline. All 67 declarations of the supplier contracts were opened at their stated file and line (24 Mathlib, 43 Tau Ceti): each name is at the line the README gives. Read in full: `TauCeti.totalVariationOn` (TotalVariation.lean:99, supremum of `∫ div φ · u ∂μ` with the plain divergence, so the §2.1 third Check is right), `TauCeti.perimeter` (Perimeter.lean:64), `TauCeti.perimeter_compl` (line 109, "against an additive Haar measure"), `TauCeti.ae_perimeter_inter_ball_le` (CutByBall.lean:228, null-measurable set, no finiteness), `MeasureTheory.Measure.quantile` (Quantile.lean:164, `sInf {x | t ≤ cdf μ x}`), the Poincaré inequality (Poincare.lean:251, constant `2^{finrank + 1} R`), `ProbabilityTheory.multivariateGaussian` (Multivariate.lean:166) with `multivariateGaussian_of_not_posSemidef` (line 170), `TauCeti.lintegral_perimeter_lineSection_le` (Slicing.lean:190).

**Duplication by object at the pins.** No weighted divergence, weighted or Gaussian perimeter, isoperimetric profile, Ehrhard symmetral, Bobkov inequality or median concentration at either pin (search for "ehrhard", "bobkov", "gaussian isoperim", "sudakov", "weighted perimeter": no file). Tau Ceti's `BoundedVariation/Hyperplane.lean`, `Convex.lean`, `MinkowskiContent.lean`, `Isoperimetric.lean` and `Real.lean` are Euclidean (plain divergence); `Gaussian/Cdf.lean:325` is a lower tail bound, not §1.2; `Gaussian/Maximum.lean:83` is a lower bound for an expected maximum, not §8.5. The two declarations of R02 are the only pinned ones on the roadmap's objects that the contract does not name.

**Cross-roadmap citations**, resolved on main: GeometricMeasureTheory G2 (`TauCetiRoadmap/GeometricMeasureTheory/README.md:148`; tangential area formula 166–167, weighted coarea 170–175, graph surface measure 177), G4 (line 210, convolution estimates 215), G5 (line 248; De Giorgi 255–261, essential versus reduced boundary 263–264, converse criterion 264–265), G6 (line 275; surface area on Lipschitz domains 286–288); Isoperimetry I4 (`TauCetiRoadmap/Isoperimetry/README.md:223`; standing set `0 < |E| < ∞`, `P(E) < ∞` at 237, slicing theorem 247–249), I1 (104), I2 (144); RandomMatrices 2.2 (`TauCetiRoadmap/RandomMatrices/README.md:503`); BanachSpaceTheory B7 (`TauCetiRoadmap/BanachSpaceTheory/README.md:1264`). All are on main; none is on the never-cite list. `scratch/citations.md` lists nothing unresolved; `scratch/overlaps.md` lists no shared edit, dropped id, revision-only id or second copy.

**Ownership.** `roadmaps grep` over main and the open heads (index of 2026-11-15) for Ehrhard, Gaussian isoperimetr, Bobkov, Sudakov, Gaussian perimeter, multi-/double-bubble, isoperimetric profile: no match. "weighted perimeter": a hexagon weight in TensorProductCombinatorics only. "Borell": NoncompactQuantumSymmetry, unrelated. Concentration: BanachSpaceTheory (sphere) and RandomMatrices (mean-centred), both named in the scope section. GeometricCurrents owns weighted coarea on rectifiable sets for currents, a different object from the `e^{−W}`-weighted perimeter. The board-package index lists AnalyticNumberTheory and LawrenceVenkateshMethod only. This roadmap is the owner of weighted perimeter for `C¹` densities, Gaussian clusters, Gaussian symmetrisation and the Gaussian isoperimetric theorem.

Overlap check: read Isoperimetry, GeometricMeasureTheory, GeometricCurrents (main) and MathematicalStatisticsAsymptotic, MathematicalStatisticsNonparametric, MathematicalStatisticsFoundations, MathematicalStatisticsSemiparametric, MathematicalBilliards (open); nothing shared.

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, nine layers each ending with Examples and Dependencies, Downstream consumers, References. Every definition (1.1, 2.1, 3.1, 3.4, 4.1, 4.2, 4.4, 6.1, 8.3, 9.1) has an API list and at least three Checks; every theorem section has its hypotheses in the sentence, a locator and a *Needs:* line. No LaTeX delimiters, target tables, pull-request numbers, dates, machine paths or job ids. No backticked name is presented as this roadmap's own declaration. Layer names are mathematical; the order is the roadmap's own (arrangement check below).

**Headline theorems** (for the package stage): weighted representation, Gauss–Green and coarea (§§2.2, 2.5, 2.6); existence of minimizing clusters (§3.5); the measure-map diffeomorphism (§4.3); `∇²I_m = −L_A⁻¹` (§4.6); Ehrhard symmetrisation decreases Gaussian perimeter (§6.6); the Gaussian isoperimetric theorem with equality (§7.3) and its two-cell form (§7.4); Borell–Sudakov–Tsirelson (§8.1); Minkowski content (§8.2); Bobkov (§8.3); median concentration (§§8.4–8.5); Ehrhard for convex sets (§9.5).

**Copyright and arrangement.** Wording: beside the 15 sampled locators, six further passages were set against their sources: the §3.1 cluster definition (MilmanNeeman2022 line 57–63), the §3.3 route (line 898–905), the §4.3 route (line 513–543), the §7.2 route (CianchiFuscoMaggiPratelli2011 line 913–962), the §8.1 route (Ledoux1999 line 229–238) and the §8.3 converse (Ledoux1999 line 305–313). None shares a run of words beyond standard names, formulas and the forced list of the cluster conditions; three routes differ from their source in substance (§3.3, §4.3, §8.1). Arrangement: MilmanNeeman2022 has the largest share, 27 of the README's 95 citations by source id. Its sections are 1 introduction, 2 model simplicial clusters, 3 definitions and notation, 4 minimizing clusters, 5–10 second variation, 11 conclusion; the roadmap puts weighted perimeter and clusters (Layers 2–3, source §§3–4) before the model clusters (Layer 4, source §2), omits §§5–10 and interleaves five layers from other sources: no one-to-one run. Layers 5–7 share the order of CianchiFuscoMaggiPratelli2011 §§3, 4.1, 4.2, which the dependency lines force (§6.5 and §6.6 need §5.3; §7.1 needs §6.6). Reuse: no table, figure, exercise list or data is taken over.

Source independence: 21 passages compared with 6 sources, none shared; largest share MilmanNeeman2022, 27 of 95 locators; contents compared with MilmanNeeman2022: independent.

## Not verifiable

- Maggi2012 Proposition 12.15, Theorem 12.26, Theorem 15.9, Sections 13.1 and 18.1–18.3, Exercise 29.7: the cached extract holds front matter, contents and the Part IV synopsis only. The contents confirm the chapter subjects (12.1, 12.4, 13.1, 15, 18.1–18.3, 29); MilmanNeeman2022 line 756 and 769 cite Theorem 15.9 and Exercise 29.7 for the same facts.
- SudakovTsirelson1974, Ledoux1996, CarlenKerce2001, AmbrosioFuscoPallara2000, Bogachev1998: settled as uncertified; cited by locator, not reopened.
- Bobkov1997: the OCR text is unusable; the text layer of the cached PDF shows the words of Corollaries 1 and 2 and the cutoff, but the displayed inequality (10) is garbled. Ledoux1999 (1.11) corroborates the statement.
- Borell1975 line 94: the OCR does not distinguish inner from outer measure in (3.1); the README's "stated there with inner measure" was not confirmed from the scan text.
- Lean elaboration, the one-tactic probe and the `#check` binder audit: no `Suggested.lean` at the design stage, and this lane does not elaborate.
- Ownership against open pull requests was checked through the `roadmaps` tool at the index of 2026-11-15; board packages on other pull requests' branches by the index list only.

## Source issues

- **Gap** in MilmanNeeman2022 at Lemma 2.1, printed page 11 (arXiv v3): the source says a displaced point lies in some open translated model cell; it should take a maximal coordinate of the displacement, which covers ties; affects the proof.
- **Misprint** in CianchiFuscoMaggiPratelli2011 at Theorem 4.1, printed page 10 (cvgmt preprint): the source says equality holds exactly for sets equivalent to a half-space; it should also allow Gaussian measure zero or one, as its Proposition 3.1 does; affects a stated result.
- **Misprint** in CianchiFuscoMaggiPratelli2011 at equation (2.5), printed page 5 (cvgmt preprint): the source says its surface-normalized perimeter equals a supremum taken against the probability measure; it should carry the factor √(2π); affects nothing.

## For the human reviewers

- **Scope.** Ehrhard's inequality is proved for convex sets only; the Borel-set case is listed as outside (`design/README.md` line 13).
- **Scope.** The README ends with a section stating the Gaussian multi-bubble theorem for `q ≥ 3` as motivation for a future roadmap, and names a "proposed Part II" under Downstream consumers (`design/README.md` lines 712–717); the house style asks that nothing be "for later".
- **Licence.** Bobkov1997 was read from an author-page PDF of the published article and Maggi2012 from an author's extract on an institutional server; the manifest records both as certified with those classes.
- **Not tested.** Maggi2012 is cited at seven places by chapter locators whose text is not in the extract; the wording check could not be run against those chapters.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "418e940bd07257bce75334fc21a0195ca4486a05", "job": "REV-DESIGN-GaussianIsoperimetryAndClusters~7", "model": "fable", "worker": "chris-x79"} -->
