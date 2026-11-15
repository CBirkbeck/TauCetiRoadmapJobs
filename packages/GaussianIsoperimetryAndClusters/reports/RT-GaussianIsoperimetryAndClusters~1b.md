<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16957#issuecomment-6901824918 -->
Red team round 1 pass b (claude) of d462415

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) `modelMeasureMap_diffeomorph` does not state that the derivative is invertible

   - **Location.** `packages/GaussianIsoperimetryAndClusters/Suggested.lean:254–265`: "**The measure map
     is a diffeomorphism onto the open simplex** (§4.3)", with the four conjuncts injective, range,
     `ContDiff`, `HasFDerivAt … (-(√2)⁻¹ • L_{A^m(x)} ∘ subtypeL)`.
   - **Claim.** `packages/GaussianIsoperimetryAndClusters/README.md:378` (§4.3) states that the
     derivative `−L_{A^m(x)}/√2` "is invertible; hence `Ψ` is a diffeomorphism". The Lean theorem of
     that name omits invertibility, so on its own it does not give a smooth inverse.
   - **Witness.** `x ↦ x³` on `ℝ` is injective, `C^∞`, onto the open set `ℝ`, with a derivative formula
     at every point, and is no diffeomorphism. Here the missing fact is §4.1's `A^m_ij(x) > 0`
     (`README.md:345`). It is only implied indirectly, by `modelProfile_hessian` (if `L_A u = L_A u′`
     then `⟪u, b⟫ = ⟪u′, b⟫` for all `b`).
   - **Repair.** Add a fifth conjunct to `modelMeasureMap_diffeomorph`:

     ```lean
         ∧ ∀ (x : simplexTangent q) (i j : Fin q), i ≠ j → 0 < modelInterfaceArea q i j x
     ```

     and add to the docstring: "every model interface area is positive, so `L_{A^m(x)}` is positive
     definite on `E^{(q−1)}` and the derivative is invertible". Tested on the refuting instance: for
     `q = 2`, `x = t u`, the face is the single point `{x}`, `μHE[0]` is counting measure, and the area
     is `e^{−W(x)} = φ(t) > 0`; then `L_A u = 2 φ(t) u ≠ 0`, which the `x³` pattern violates at `0`.
     For `q = 3`, `x = 0` the three areas are `0.199471 > 0`.

2. **F02** (P3) Ehrhard's Théorème 2.4 cited for the general Gaussian law

   - **Location.** `packages/GaussianIsoperimetryAndClusters/Suggested.lean:358–361`, docstring of
     `borell_sudakov_tsirelson_multivariateGaussian`: "(Ledoux1999, (1.7); Ehrhard1983, Théorème 2.4)".
   - **Claim.** The docstring cites Ehrhard for the enlargement inequality of `multivariateGaussian m S`
     with the ellipsoid `r K(ball(0, 1))`.
   - **Witness.** Ehrhard1983 line 358–359: the theorem is for the standard measure `γ_n` and the
     Euclidean ball `B_n(0, r)` only. Ledoux1999 line 239–247 is the ellipsoid form.
   - **Repair.** In that docstring keep "(Ledoux1999, (1.7), for centred laws; the mean is a
     translation)", and move "Ehrhard1983, Théorème 2.4" to the docstring of `borell_sudakov_tsirelson`
     (`Suggested.lean:349–352`), whose statement it supports.

3. **F03** (P3) The pointwise mollification estimate is not a stated target of GeometricMeasureTheory G4

   - **Location.** `packages/GaussianIsoperimetryAndClusters/README.md:13`, `:105` ("G4: the pointwise
     mollification estimate `|∇(u ∗ ρ_ε)| ≤ |Du| ∗ ρ_ε` as measures"), `:114` ("every input above is a
     stated target of its roadmap"), and the *Needs:* line of §6.5 (`:529`).
   - **Claim.** G4 states the pointwise estimate.
   - **Witness.** `TauCetiRoadmap/GeometricMeasureTheory/README.md:214` (main, `6ca082e`) says only
     "Establish convolution estimates". The pinned
     `ContDiffBump.totalVariationOn_normed_convolution_le`
     (TauCeti/Analysis/BoundedVariation/Convolution.lean:110) already gives what §6.5 uses.
   - **Repair.** Drop the G4 item from `README.md:13` and `:105` and from the §6.5 and Layer 6
     dependency lines, and replace the last step of the §6.5 route by: "apply this to mollifications
     `v_ε = v_U ∗ ρ_ε` and pass to the limit: for every open `Ω′ ⊆ e^⊥`,
     `∫_{Ω′} ‖∇v_ε‖ ≤ |Dv_U|(Ω′ + ball(0, ε))` by Tau Ceti's
     `ContDiffBump.totalVariationOn_normed_convolution_le`, so the layer-cake formula over the open
     superlevel sets of the continuous weight gives
     `∫ e^{−W_{e^⊥}} ‖∇v_ε‖ ≤ ∫ sup_{ball(z, ε)} e^{−W_{e^⊥}} d|Dv_U|(z)`, which tends to
     `∫ e^{−W_{e^⊥}} d|Dv_U|` on bounded sets". Add that declaration (file and line as above) to the
     Tau Ceti contracts. Tested: for `v = Φ(1 + z)` the right side tends to `0.219696`, the first term
     of the §6.5 Check.

4. **F04** (P3) A reference that no target cites

   - **Location.** `packages/GaussianIsoperimetryAndClusters/README.md:768`: "[Ledoux1996] … Chapter 1,
     background for Layers 7–8, cited by locator".
   - **Claim.** The work is cited by locator.
   - **Witness.** `Ledoux1996` occurs once in the README, in the reference list itself; no target,
     Check or route cites it, and "Chapter 1" is attached to no statement.
   - **Repair.** Delete the bullet at `README.md:768` (and the `Ledoux1996` entry of `sources.toml`, which
     then records a work the roadmap does not cite). §7.3 and §8.1 keep their locators into Ledoux1999,
     Ledoux1993, Borell1975 and SudakovTsirelson1974.

One blocking finding (R01, P2) and three P3 findings. No false statement, no unowned prerequisite, no
upward or cyclic dependency and no second owner was found. No Lean was run in this pass (the brief
gives no Lean command): the elaborated types were read from the worker's signature listing, and the
repair text of R01 is not elaborated.

Dependency check output:

    depcheck: 239 roadmaps, 2243 edges, 0 problem(s)

## Verified sound

Counts: 36 declarations read (all of `Suggested.lean`, each against its elaborated type); 45 README
targets read (§1.1–§9.5, every line); 106 pinned-library locators verified at the pins (file, line
and declaration name: 97 by script, 9 by hand; all correct); 71 source locators verified against the
cached texts (MilmanNeeman2022 27, CianchiFuscoMaggiPratelli2011 19, Ehrhard1983 11, Ledoux1999 8,
Ledoux1993 3, Borell1975 2, Maggi2012 contents and synopsis 1); 155 Check bullets read, every
numerical value in them recomputed (all agree to the printed six places); 9 sibling citations checked
on main at `6ca082e` (GeometricMeasureTheory G2, G4, G5, G6; Isoperimetry I1, I2, I4; RandomMatrices
2.2; BanachSpaceTheory B7).

Ownership: searched main and the open roadmap heads (by object: Gaussian isoperimetry, Gaussian
perimeter, Ehrhard, Bobkov, Borell, Sudakov–Tsirelson, weighted perimeter, isoperimetric profile,
clusters, multi-bubble, Minkowski content, median concentration, and the Lean names). No other
roadmap states these objects; BanachSpaceTheory B7 states sphere concentration and RandomMatrices 2.2
the mean-centred Herbst bound, both different statements. Tau Ceti at the pin has no Gaussian tail
bound, weighted perimeter or Gaussian isoperimetric statement (its `MinkowskiContent.lean`,
`Isometry.lean` and `Convolution.lean` are Euclidean). This roadmap is the owner.

Policy: the pull request changes only `packages/GaussianIsoperimetryAndClusters/`; no `lemma`, no
`set_option`, no `#check` or `#eval`, no process wording or pull-request numbers in README or
docstrings; single `import Mathlib` plus six `TauCeti.*` modules. Headline theorems of the README
summary (§7.3, §7.4, §8.1, §8.3, §8.4, §9.5) are all stated; nothing in the file follows by one tactic
from the library or restates a definition. The three definitions flagged as having lost a section
binder (`gaussianWeight`, `gaussianSymmetral`, `closedGaussianSymmetral`) do not need it: every
theorem that uses them carries `[BorelSpace E]` and `[FiniteDimensional ℝ E]`.

Adversarial pass (values computed on each side):

| Statement | Instances tried | Values | Result |
|---|---|---|---|
| `gaussianIsoperimetricProfile` | `v = 1/3`, `0.3`, `0`, `1` | `0.363600`; `I′ = 0.524401`, `I″ = −2.876104 = −1/I`; endpoints `0` (quantile junk `0` would give `0.398942`) | sound |
| §1.2 tails | `r = 0, 1, 2` | `1/2 = 1/2`; `0.158655 < 0.241971`, `≤ 0.303265`; `0.022750 ≤ 0.067668` | sound |
| §1.3 coordinate laws | `q = 3` | `1 − Φ(√1.5) = 0.110336`; reciprocal factor `0.207108` | sound |
| `weightedVariation`, `W = 0` | integrand `u · div X · 1` | equals `TauCeti.totalVariationOn volume` integrand | sound |
| `weightedVariation_eq_lintegral_variationMeasure` | `U = (−1, 1)`, Gaussian weight | `2φ(1) = 0.483941` both sides | sound |
| `weightedPerimeter_eq_lintegral_reducedBoundary` | `n = 1` (counting measure), half-line; quadrant in `ℝ²` | `φ(s)`; `2 × 0.199471 = 0.398942` | sound; `n = 0` excluded by `hn` |
| `integral_weightedDivergence_eq_integral_reducedBoundary` | `U = (−∞, s)` | `X(s)φ(s)` both sides, outer normal `+1` | sound |
| `weightedVariation_eq_lintegral_weightedPerimeter` | `u = χ_U`; `u(t) = t` | `P_μ(U)`; `1 = 1` | sound |
| `Cluster`, `isoperimetricProfile` | `q = 0`, `q = 1`, `n = 0` | no `0`-cluster (`volume univ = 1`); `(E)` with perimeter `0`; `(1/2, 1/2)` empty infimum `⊤` | sound |
| `exists_cluster_…` | `q = 0` (`hsum` false), vertex `(1, 0)`, `n = 0` excluded by `[Nontrivial E]` | vacuous; `(E, ∅)`; — | sound |
| `modelMeasureMap_diffeomorph` | `q = 2`, `x = tu` | `Ψ₁ = Φ(−t)`, derivative `−φ(t)`; `−(L_A u)₁/√2 = −φ(t)` | derivative sound; R01 |
| `modelProfile_hessian` | `q = 2`; `q = 3`, `x = 0` | `Dg(0)[su] = ts/√2`, `H = −1/(2φ(t))`; `−1/(3A) = −1.671086`, trace `1.196827` | sound |
| §4.5 cut-piece bound | mean `c/2`, variance `1/4 + 1/4 + 1 = 3/2` | uniform in `c` as `d → ∞` | sound |
| `gaussianSymmetral` | half-space; disc; idempotence | fixed; section `(−∞, 0.475233)`; sections of a symmetral have measure exactly `v_U` | sound |
| `gaussianPerimeter_gaussianSymmetral_le` | disc in `ℝ²`; `n = 1` | `0.517483 ≤ 0.606531`; `0.356343 ≤ 0.483941` | sound |
| §6.3 pointwise control, §6.5 bound | escaping-tails set; tilted half-plane | `g_U(0) = 0`, `v′(0) = 1`, perimeter bound `0.995297`; `0.310697 ≤ 0.439391` | sound |
| `gaussian_isoperimetric` | `n = 0`; `∅`; disc; slab | `0 = 0`; equality via `γ = 0`; `0.606531 > 0.384633`; `0.483941 > 0.356343` | sound, both directions of the iff |
| `isoperimetricProfile_two_eq`, `Cluster.perimeter_eq_iff_halfSpaces` | `(1/2, 1/2)`, `(1, 0)` | `0.398942`; `0` | sound |
| `borell_sudakov_tsirelson` (both) | disc, `r = 1`; `S = 0`; `S` indefinite; non-measurable `A` | `0.864665 ≥ 0.767217`; `δ_m(A) = 1`; same; outer-measure inequality `(T_*γ)(X) ≥ γ(T⁻¹X)` | sound |
| `gaussian_minkowskiContent_ge` | Bernstein set; `ℚ²` | `0.398278`, `0.398936 → 0.398942`; `1/r → ∞` | sound |
| `bobkov_inequality` | `Φ(x)`, `Φ(2x)`, `min(x², 1)` | `0.398942` (equality, twice); `0.398619 ≤ 0.647406` | sound |
| `gaussian_concentration_median`, `gaussian_max_concentration` | `f = x₁`; two independent normals; `L = 0` | equality; `0.010899 ≤ 0.022750`; empty set | sound |
| §9.1 composition law | `closedBall(0, 1) ⊂ ℝ³` | both `{x₃ ≤ −0.846102}` | sound |
| §9.2 concavity of `g` | `(−1, 1)`, `(0, 2)`, `(−3, −0.5)`, `(0.5, 0.6)` | Hessian determinants `0.163502`, `0.015519`, `0.000142`, `15.648788`, diagonal negative | sound |
| §9.3 cone inclusion | directions `90°, 135°, 157.5°`; step `u₀ = αv − βu_{j+1}` | threshold moves by `≥ βt` by the one-dimensional §8.1 | sound |
| `ehrhard_inequality_convex`, `convex_closedGaussianSymmetral` | `[−1, 1]`, `[−3, 3]`, `θ = 1/2`; non-closed `C` | `1.690143 ≥ 1.628704`; `{x₁ > 0} ∪ {0} × (−∞, 0]` convex | sound |
| §7.2 negative control | strips, `ρ = 1/16` | area fraction `0.032981`; missing sections `(5/6)ρ` | sound |

## Not verifiable

- Bobkov1997, Corollary 1, inequality (10), p.209, and the argument after Corollary 2, p.210 (§8.3
  and the docstring of `bobkov_inequality`): the cached text is an unreadable OCR of glyph names, so
  neither the numbering nor the hypotheses could be read. Only the page markers (line 72, line 98)
  agree with the printed pages.
- Maggi2012 Theorem 15.9, Proposition 12.15, Theorem 12.26 and Exercise 29.7: the cached extract has
  the contents and the Part IV synopsis only. Section titles 13.1 and 18.1–18.3 and the synopsis
  (line 716–725) were checked.
- SudakovTsirelson1974, CarlenKerce2001, AmbrosioFuscoPallara2000, Bogachev1998: settled as
  uncertified; cited by locator, not read.
- The published (American Journal of Mathematics) numbering of CianchiFuscoMaggiPratelli2011: only
  the cvgmt preprint was read, which is the version the README says it cites.
- The repair text of R01 was not elaborated.

Source independence: 13 passages compared with 4 sources, none shared; largest share MilmanNeeman2022, 27 of 84 locators; contents compared with MilmanNeeman2022: independent (its Sections 2, 3, 4 correspond to Layers 4, 2–3, 3 in a different order and with wider scope here). Bobkov1997 could not be read.

## Source issues

- **Misprint** in CianchiFuscoMaggiPratelli2011 at equation (2.5), preprint line 201–208: the source says the Gaussian perimeter is the supremum of integrals against the probability measure; it should carry the factor `√(2π)` to agree with its definition (1.2); affects a stated result.
- **Misprint** in CianchiFuscoMaggiPratelli2011 at Lemma 4.4, equations (4.8)–(4.9), preprint line 613–622: the source gives the gradient of the section measure with weights `e^{−y²/2}`; it should have `(2π)^{−1/2} e^{−y²/2}`, as its own line 657 does; affects a stated result.
- **Error** in CianchiFuscoMaggiPratelli2011 at Lemma 4.5, inequality (4.10), preprint line 626–631: the source bounds the symmetral's perimeter by an unscaled variation term plus the section term; the variation term should carry `√(2π)` (a tilted half-plane gives `0.778801 ≤ 0.770391`); affects a stated result.
- **Gap** in MilmanNeeman2022 at Lemma 2.1, proof of injectivity, line 515–517: the source says some open model cell translated to `x` contains `y`; it should take an index maximizing `(y − x)_i`, which also covers ties; affects the proof.
- **Misprint** in MilmanNeeman2022 at Lemma 2.3, proof, line 612–614: the source says the translated cell and the fixed set inside it are given by a minimum over the other coordinates; it should be the maximum, with the constant added, `{z_j > max_{ℓ≠j} z_ℓ + C′}`; affects nothing.

## For the human reviewers

- **Scope/arrangement.** Layers 5, 6, 7 correspond to CianchiFuscoMaggiPratelli2011 Sections 3, 4.1, 4.2 (§5.2–5.3 ↔ Lemma 3.3, Prop. 3.1; §6.2–6.6 ↔ Thm 4.2, Lemmas 4.4, 4.6, 4.5, Thm 4.3; §7.1–7.3 ↔ Steps I–IV). It is the second source by share (19 of 84); the *Needs:* lines force the order.
- **Scope/wording.** The route of §4.5 (`README.md:402`) uses the same sequence of steps as the proof of MilmanNeeman2022 Lemma 2.3 (line 577–659), with the interface step reordered and the misprint of line 612–614 corrected; longest shared run of words: 4.
- **Not tested.** Bobkov1997 (`sources.toml` status `certified`, author-page copy): the cached extraction is unreadable, so wording and locators of §8.3 were not compared with it.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d462415827b6c4cf9edb312c1f1fa18496ca1968", "job": "RT-GaussianIsoperimetryAndClusters~1b", "model": "fable", "worker": "chris-x52"} -->
