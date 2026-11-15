<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16957#issuecomment-6899200026 -->
Review (claude) of 7f882e2

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §2.3: the route for convex sets uses a fact no layer, supplier or pinned declaration provides

   **Location.** `packages/GaussianIsoperimetryAndClusters/README.md` line 196 (§2.3): "For convex `C`,
   the intersection with any ball is a bounded convex Lipschitz domain and locality transfers its
   boundary measure"; the *Needs:* line then cites "GeometricMeasureTheory … G6 (Lipschitz domains)".

   **Claim.** The target `P_μ(C; Ω) = μ^{n−1}(∂C ∩ Ω)` for every open convex `C` is reached through
   G6's identity for bounded Lipschitz domains, which needs "a nonempty bounded open convex set is a
   Lipschitz domain".

   **Witness.** That fact is stated nowhere: `TauCetiRoadmap/GeometricMeasureTheory/README.md` has no
   occurrence of "convex"; at the pin, `TauCeti/Analysis/Sobolev/LipschitzDomain/Basic.lean` gives
   `Set.IsLipschitzDomain` image, dilation and epigraph lemmas (lines 322, 330, 397) and none for convex
   sets; `TauCeti/Analysis/BoundedVariation/Convex.lean` has only `Convex.perimeter_inter_le` (442),
   `Convex.perimeter_le_of_subset` (501), `Convex.perimeter_lt_top` (507).

   **Repair.** Replace the convex part of the route, and drop G6 from the convex case (G6 stays for the
   Lipschitz-domain statement):

   > For a nonempty open convex `C`, every ball `B` gives a bounded convex set `C ∩ B` of finite
   > Euclidean perimeter (`Convex.perimeter_lt_top`, TauCeti/Analysis/BoundedVariation/Convex.lean:507),
   > so `C` has locally finite perimeter by locality (`TauCeti.perimeter_congr_ae`). Prove
   > `∂^M C = ∂C`: at `x ∈ ∂C` a supporting half-space bounds the density of `C` by `1/2`, and the cone
   > over a ball `ball(c, ρ) ⊆ C` with apex `x` lies in `C` and has positive density at `x`, so `x` has
   > neither density `1` nor density `0`; the other inclusion is `TauCeti.essentialBoundary_subset_frontier`.
   > The second statement of §2.2 then gives `P_μ(C; Ω) = μ^{n−1}(∂^M C ∩ Ω) = μ^{n−1}(∂C ∩ Ω)`.

   and list `Convex.perimeter_lt_top` under "From Tau Ceti". Tested on the instances of the section:
   `C = {x_1 < 1} ⊂ ℝ²` has `∂^M C = {x_1 = 1}` and `P_γ = φ(1) = 0.241971`; `C = ball(0, 1) ⊂ ℝ²` has
   `∂^M C` the unit circle and `P_γ = (2π)^{−1} e^{−1/2} · 2π = 0.606531`, the values of the Checks.

2. **F02** (P2) §4.5: one clause of the proof plan follows the source's sentence

   **Location.** `README.md` line 397 (§4.5): "compare `x + Ω^m` with the lower-dimensional model
   obtained by deleting the small cells and extending the large ones".

   **Claim.** The passage is the roadmap's own wording.

   **Witness.** MilmanNeeman2022 line 572–574 (and the caption at line 570): 10 consecutive words are
   shared ("obtained by deleting the small cells and extending the large"), and the clause before them
   differs by one noun.

   **Repair.** Write the step from the mathematics of the proof (MilmanNeeman2022 line 577–659), for
   example:

   > for the boundary, let `v_k → v ∈ Δ_J` with `v_k` interior and `x_k = Ψ⁻¹(v_k)`. Each cell of
   > `x_k + Ω^m` indexed by `J` lies in the cylinder over the corresponding cell of the `|J|`-cell model
   > translated by the projection `Π_J x_k`; comparing measures through §1.3 gives
   > `Π_J x_k → (Ψ^{(|J|)})⁻¹(v_J)`, and then `x_{k,l} − x_{k,i} → ∞` for `i ∈ J`, `l ∉ J`. By the
   > one-dimensional laws of `(x_i − x_j)/√2` and the tail bound of §1.2, every interface with an index
   > outside `J` has area tending to `0`, and every interface with both indices in `J` differs from the
   > interface of the `|J|`-cell model by a set whose area tends to `0`.

   Check on `q = 3`, `J = {1, 2}`, `v = (1/2, 1/2, 0)`: `Π_J x_k → 0`, the limit of `A^m_12` is
   `φ(0) = 0.398942` and `A^m_13, A^m_23 → 0`, the value `I_m^{(2)}(1/2, 1/2, 0) = 0.398942` of the
   first Check.

3. **F03** (P3) §8.3 and the Summary: the "converse" of Bobkov's inequality is not a statement of its own

   **Location.** `README.md` line 626: "Conversely, if Bobkov's inequality holds for every Lipschitz
   `f : E → [0, 1]`, then the Minkowski-content inequality of §8.2 holds for every closed `A`"; line 3
   lists "Bobkov's functional inequality and its converse" among the end theorems.

   **Claim.** The converse is an end theorem.

   **Witness.** Its conclusion is §8.2 (proved for every Borel `A` from §8.1), so the implication holds
   with the hypothesis unused; `Suggested.lean` states no converse, while its module docstring
   (line 41) says no headline is omitted.

   **Repair.** In the Summary write "Bobkov's functional inequality". In §8.3 replace the sentence by
   the facts that carry the content: "For closed `A`, `r > 0` and `f_r = max(0, 1 − d_A/r)`, prove that
   `f_r` is `(1/r)`-Lipschitz with values in `[0, 1]`, `∫ f_r dγ → γ(A)` and `∫ I(f_r) dγ → 0` as
   `r ↓ 0`, and `∫ ‖∇f_r‖ dγ ≤ (γ(Metric.cthickening r A) − γ(A))/r`; with Bobkov's inequality these
   give §8.2 for closed sets by a second route." Instance: `A = {x_1 ≤ 0}`, `r = 1`: `f_1 = 1` on `A`,
   `1 − x_1` on `0 < x_1 < 1`; `∫ ‖∇f_1‖ dγ = Φ(1) − 1/2 = 0.341345`, equal to the quotient.

4. **F04** (P3) Cianchi–Fusco–Maggi–Pratelli: the README cites the published article and reports what is "printed", but the text read is the preprint

   **Location.** `README.md` line 746 (References: "American Journal of Mathematics 133 (2011),
   131–186. Sections 2–4"), and lines 27, 504, 510, 524, 529 ("as printed", "fails as printed",
   "as Cianchi–Fusco–Maggi–Pratelli print it").

   **Claim.** The numbering and the defects of (4.6)–(4.14) are those of the published article.

   **Witness.** `sources.toml`, entry `CianchiFuscoMaggiPratelli2011`: `fetched_from` is the cvgmt
   PostScript file and `version_note = "cvgmt preprint read; all locators refer to that version"`. The
   MilmanNeeman2022 reference line names its arXiv version; this one does not.

   **Repair.** In the reference add "cvgmt preprint; section, theorem, equation and line locators
   refer to that version", and in the Conventions add once "the formulas of Cianchi–Fusco–Maggi–Pratelli
   are quoted from the cvgmt preprint", so that "as printed" is scoped to the version read.

5. **F05** (P3) "How to read the build" describes Layer 7 by a source instead of by its mathematics

   **Location.** `README.md` line 115: "then the existence-and-symmetrisation argument of
   Cianchi–Fusco–Maggi–Pratelli".

   **Claim.** Each layer is described by what it delivers.

   **Witness.** The sentence names Layer 7 by an article's argument; Layers 5, 6, 7 also correspond in
   order to that article's Sections 3, 4.1, 4.2 (the order is forced: §6.2 needs §5.1, §6.6 needs §5.3,
   §7.1 needs §6.6), so the sentence is the one place where the build reads as that source's.

   **Repair.** "…then the structure of minimizers: half-line sections, convexity of the density-one
   representative, and separation by a hyperplane." The attribution stays at the locators of
   §§7.1–7.3.

6. **F06** (P3) docstring slip in `Suggested.lean`

   **Location.** `packages/GaussianIsoperimetryAndClusters/Suggested.lean` line 326:
   "(MilmanNeeman2022, Theorems 1.1 for `q = 2`)".

   **Claim.** The locator of `isoperimetricProfile_two_eq`.

   **Witness.** One theorem is cited (MilmanNeeman2022 line 98–99); the README at §7.4 cites
   "Theorems 1.1–1.2".

   **Repair.** "(MilmanNeeman2022, Theorem 1.1 for `q = 2`)".

Six findings: two blocking (P2), four P3. No statement of `Suggested.lean` was found false, the file
elaborates with `sorry` as the only warning, every pinned declaration the README names exists where
it is cited, every recomputed Check value agrees, and the dependency check is clean. The findings
are one proof route that rests on a fact nobody owns, one clause that tracks a source's wording, and
four points of statement shape, version and style.

There is no earlier review of this package and no maintainer note.

## Verified sound

**Principles.** No `set_option`, no sorry'd data (17 definitions, all with bodies, all used by a
stated theorem), no computational algorithm, no supplier later in the merge order, no cycle. The
general multi-bubble theorem is left to a named Part II with the stopping point stated (README
line 15); see the human reviewers' section.

**Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout: 19 warnings, all
"declaration uses `sorry`", no error. Imports: `import Mathlib` and six `TauCeti.*` modules, each
used (`ReducedBoundary`, `TotalVariation`, `VariationMeasure`, `TestFunction.Divergence`,
`EssentialBoundary`, `Quantile`).

**Signatures.** The elaborated types of all 36 declarations (the worker's `#check @name` output for
the file as it stands) were compared with the README statements. Three definitions lose a section
binder their type does not mention (`gaussianWeight`: `FiniteDimensional`, `MeasurableSpace`,
`BorelSpace`; `gaussianSymmetral`, `closedGaussianSymmetral`: `BorelSpace`); none is needed by the
definition, and all 19 theorems carry `FiniteDimensional`, `MeasurableSpace`, `BorelSpace`, and
`Nontrivial` where the README says `n ≥ 1`. Nothing changed.

**One-tactic probe.** All 19 sorried theorems were tried on a scratch copy with `rfl`, `simp`,
`infer_instance`, `simp` with the roadmap's definitions unfolded, `aesop` and `exact?`: none closes
(18 fall through to `sorry`; on `gaussianPerimeter_gaussianSymmetral_le` the search ran out of
heartbeats). No padding.

**Headline theorems.** Summary list against the Lean file: Gaussian isoperimetric theorem with
equality (`gaussian_isoperimetric`), two-cell form (`isoperimetricProfile_two_eq`,
`Cluster.perimeter_eq_iff_halfSpaces`), Borell–Sudakov–Tsirelson for `stdGaussian` and for
`multivariateGaussian` (two theorems), Minkowski content, Bobkov, concentration about a median,
maxima, convexity of closed symmetrals, Ehrhard's inequality, and the layer results of §2.2, §2.5,
§2.6, §3.5, §4.3, §4.6, §6.6: all stated. The only Summary item not stated is the converse of R03.
All 36 Lean names occur in the README and every backticked name of the roadmap's own in the README
is declared (the lead on `Cluster.perimeter_eq_iff_halfSpaces` is a false alarm: line 338 declares
it).

**Pinned declarations.** 91 located citations of the README were opened at the pins (83 matched by
script at the cited line, 8 by hand: `TestFunction` 67 and its notation 80, `ContDiffBump` 70, the
Besicovitch instance 500, and the four `Cdf.lean` lines 205, 212, 219, 226), plus
`multivariateGaussian_of_not_posSemidef` (Multivariate.lean:170), `quantile_of_nonpos` (209),
`quantile_of_one_lt` (216), `variationMeasure_preimage_coe` (150),
`ContDiffBump.totalVariationOn_normed_convolution_le` (Convolution.lean:110),
`lintegral_perimeter_lineSection_le` (Slicing.lean:190). The statements were read for the ones the
routes lean on: `quantile` is `sInf {x | t ≤ cdf μ x}` (junk `0` at `t ≤ 0`, `t > 1`, and at `t = 1`
for the Gaussian); `cdf_quantile` needs continuity and `0 < t < 1`; the four `cdf_gaussianReal`
lemmas need `v ≠ 0`; `reducedBoundary` and `outerNormal` are defined by ball averages of the polar
density with `Dχ = −ν|Dχ|`; `perimeter_setOf_inner_lt` is the half-space identity on every open
`Ω`; `ae_perimeter_inter_ball_le` assumes only null-measurability; the Poincaré constant is
`2^{n+1} R`; `reducedBoundary_subset_essentialBoundary` needs `n ≥ 2`. All as the README says.

**Supplier sections.** GeometricMeasureTheory G2 (area, coarea with weights, tangential area
formula, graph surface measure), G4 (convolution estimates), G5 (De Giorgi, blow-up, essential
versus reduced boundary, converse criterion), G6 (Lipschitz and `C¹` domain surface comparison);
Isoperimetry I1–I2 and I4 (slicing theorem with the measure-preserving `e^⊥ × ℝ` identification,
essential-convexity theorem for sets of positive finite volume); RandomMatrices 2.2 (logarithmic
Sobolev, Herbst, mean-centred bound); BanachSpaceTheory B7 (sphere concentration): each exists on
main with the content cited. No gap is declared and none is needed apart from R01.

**Dependency check.** Output: `depcheck: 246 roadmaps, 2241 edges, 0 problem(s)`.

**Checks recomputed.** 105 numeric values of the README's Checks and Examples, taken from the
Conventions and all nine layers, were recomputed independently (error function, bisection for
`Φ⁻¹`, Simpson quadrature, closed forms); all agree to the six places printed. Among them:
`I(1/3) = 0.363600`, `−1/I(0.3) = −2.876104` (second difference `−2.876104`), `1 − Φ(√1.5) =
0.110336`, `3φ(1) + φ(2) = 0.779903`, `1/(2√(2π)) = 0.199471`, `DΨ(0) = −0.423142`, right shifts
`0.664218`, `0.722510`, `∫ I(v_U) dγ = 0.252249`, symmetral perimeter `0.517483`, `0.647406` for
`min(x², 1)`, `0.010899`, Hessian determinants `0.163502`, `0.015519`, `0.000142`, `15.648788`,
`1.554146`, strip fraction `0.032981` and section proportions `0.208333`, `0.052083`.

### Adversarial table

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.1 `I`, `gaussianIsoperimetricProfile` | `v = 1/2, 1/3, 2/3, 0, 1, 0.3` | `0.398942`; `0.363600` both; `0` at ends, where `φ(quantile) = φ(0) = 0.398942` would be wrong; `I″(0.3) = −2.876104 = −1/I(0.3)`; `I′(0.3) = 0.524401 = −Φ⁻¹(0.3)` | sound |
| §1.2 tails | `r = 0, 1, 2` | `1/2 = 1/2`; `0.158655 < 0.241971`, `≤ 0.303265`; `0.022750 ≤ 0.067668`; constant `1/4` fails at `0` | sound |
| §1.3 splitting | `ℝ²`, `F = ℝ(e_1+e_2)/√2`; `E^{(2)}`; `F = {0}`, `E` | `Φ(1) = 0.841345`; variance of `x_i` on `E^{(q−1)}` is `(q−1)/q`, `1 − Φ(√1.5) = 0.110336` against `0.207108` for the reciprocal factor; `q = 1` has variance `0`, excluded | sound |
| §2.1 `weightedVariation` | `W = 0` on `ℝ`; `U = ℝ` under `γ`; `W + c` | `P((0,1)) = 2`; own definition gives `0`, Tau Ceti's `perimeter γ` gives `√(2/π) = 0.797885`; factor `e^{−c}` | sound; wrong model excluded |
| §2.2 / `weightedPerimeter_eq_lintegral_reducedBoundary` | `(−1, 1) ⊂ ℝ` (`n = 1`, `μHE[0]` counting); disc with null modifications; `n = 0` | `2φ(1) = 0.483941`; `0.606531` unchanged; `n = 0` excluded by `0 < finrank` | sound |
| §2.3 half-space, ball | `s = 0, 1`; `n = 1, 2`, `r = 1` | `φ(0) = 0.398942`, `φ(1) = 0.241971`; `n = 1`: `2φ(1)`; `n = 2`: `e^{−1/2} = 0.606531 > I(0.393469) = 0.384633` | sound; route for convex sets: R01 |
| §2.5 / Gauss–Green, translation derivative | `U = (−∞, s)`; `U = {x_1 < s}`, `w = e_1`; `U = E` | both sides `X(s)φ(s)`; `d/dt Φ(s + t) = φ(s) = ⟨e_1, ν_U⟩φ(s)`, inner normal gives `−φ(s)`; `−∫ x_1 dγ = 0` | sound; sign pinned |
| §2.6 coarea | `f = ‖x‖` on `ℝ²`; `u = χ_U`; `u(t) = t` | `1 = 1`; `P_μ(U)`; `∫ φ = 1`; non-`BV_loc` case: both sides `∞` | sound |
| §2.7 invariance, cylinders | `F = ℝe_1 ⊂ ℝ²`, `U = (−∞, s)`; `F = {0}`; translation | `φ(s)` both sides; `0`; `0.398942 → 0.241971`, so no translation invariance | sound |
| §3.1 `Cluster` | three intervals; `(E, ∅)`; `q = 0, 1`; `n = 0` | `φ(a) + φ(b)` with the factor `½`; perimeter `0`, vector `(1, 0)`; no `0`-cluster since `volume(E) > 0`; `1`-cluster `(E)` only | sound |
| §3.2 interfaces | three intervals; merge `a = 0`, `b = 1`; half-annuli example | `A = (φ(a), 0, φ(b))`; `0.640913 − 0.398942 = 0.241971`; half-annulus boundary length `2^{−2k}(3π/2 + 1)`, total Gauss–Green vector `0`, so the origin is in `∂*Ω_1` only | sound; closure form needed |
| §3.3 `L_A` | three intervals; `(E, ∅, ∅)`; `q = 1`; `q = 2` | `φ(a)(a_1−a_2)² + φ(b)(a_2−a_3)²` definite on `E^{(2)}`; `L_A = 0` at a vertex; vacuous on `E^{(0)}`; `L_A u = 2A_12 u` | sound |
| §3.5 / `exists_cluster…` | `q = 0`; `q = 1`; `n = 0`, `v = (1/2, 1/2)`; `W = 0` on `ℝ` | `Σ v_i = 0 ≠ 1`, vacuous; `(E)`; no cluster, profile `∞`, excluded by `Nontrivial`; infinite mass, hypothesis `IsProbabilityMeasure` excludes | sound |
| §4.2 simplicial clusters | `q = 2`; centres `−1, 1` scaled by `λ = 2, −1, 0`; collinear `0, 1, 2` | half-spaces, `(Φ(s), 1−Φ(s))`, `φ(s)`; `8y < 0` same cell, `−4y < 0` swapped, `0 < 0` empty; not equidistant and `q > n + 1` | sound |
| §4.3 / `modelMeasureMap_diffeomorph` | `q = 2`, `x = tu`; `q = 3`, `x = 0`; ties `y − x = (1, 1, −2)`; `q = 1` | `Ψ_1 = Φ(−t)`, derivative `−φ(t)`, and `−(L_A u)_1/√2 = −√2 A/√2 = −φ(t)` with `modelInterfaceArea = e^{−W(x)} = φ(t)` on the point `{x}`; `DΨ(0) = −3A/√2 = −0.423142`; `i = 1` gives strict inclusion; excluded by `2 ≤ q` | sound; sign pinned |
| §4.5 boundary behaviour | `(1/2, 1/2, 0)`; vertex; `q = 2` ends | `0.398942`; `0`; `I(0) = I(1) = 0` | sound; wording: R02 |
| §4.6 / `modelProfile_hessian` | `q = 2`; `q = 3` symmetric point | `Dg(0)u = t/√2 = ⟨x, u⟩/√2`; `H(2A u, u) = 2A · (−1/(2A)) = −1 = −⟨u, u⟩`; `∇² = −1.671086`, `−tr(∇²)⁻¹ = 1.196827 = 2 · 0.598413` | sound |
| §5.2, §5.3 | `(0, 1)`; `(−1, 0)` shifted right; `(−1, 1)` | `0.640913 → 0.366963 = I(0.341345)`; `0.664218`, `0.722510` increase when `a + b < 0`; `0.483941 > 0.356343` | sound |
| §6.1 `gaussianSymmetral` | half-space; unit disc; null line `ℝe_2`; idempotence | fixed; section `(−∞, 0.475233)`, measure `0.393469`; `S(U) = U ≠ ∅`, null; `γ_F{Φ(⟨y,u⟩) < v} = v` for every `v ∈ [0, 1]` | sound |
| §6.3 | `{x_2 < a + bx_1}`; escaping-tails example | `g_U = bφ(a + bz) = v_U′`; `0.219696 ≤ 0.310697`; `g_U(0) = 0 ≠ v_U′(0) = 1` on a null set, `P_γ ≤ 0.995297` | sound |
| §6.4 | tilted half-plane; slab | both sides `0.310697`; in the source's normalization `0.778801` against `0.592901` with the unscaled gradient; slab `0.483941` both sides | sound; source formula corrected |
| §6.5 | `{x_2 < a}`; tilted half-plane; disc | `0 + φ(a)`; `0.439391 ≥ 0.310697`, source's printed form `0.778801 ≤ 0.770391` false; `0.386129 + 0.252249 = 0.638378 ≥ 0.517483` | sound |
| §6.6 / `gaussianPerimeter_gaussianSymmetral_le` | disc; `n = 1`, `(−1, 1)`; `n = 0` | `0.517483 ≤ 0.606531`; `0.356343 ≤ 0.483941`; no unit vector, vacuous | sound |
| §7.1 | half-space; disc | conclusion holds; section `(−1, 1)` has two boundary points, `0.606531 > 0.384633` | sound |
| §7.3 / `gaussian_isoperimetric` | `n = 0`; `U = ∅`; disc; slab; half-space; both directions of the iff | `0 ≤ 0` and both sides of the iff true; equality with `γ = 0`, not a half-space; `0.606531 > 0.384633`; `0.483941 > 0.356343`; `φ(s) = I(Φ(s))`; `P_γ = ∞` never equals the finite right side | sound |
| §7.4 / two-cell theorems | `v = (1/2, 1/2)`, `(1, 0)`; `n = 0` | `0.398942`; `0 = I(1)` by `(E, ∅)`; profile `∞ ≠ 0.398942`, excluded by `Nontrivial`; `Ω.perimeter = P_γ(Ω_0)` by complement invariance | sound |
| §8.1 / both `borell_sudakov_tsirelson` | half-space; disc, `r = 1`; `r = 0`; `S` not positive semidefinite, `S = 0`; `S = diag(1, 0)`; non-measurable `A`; `A = ∅` | equality; `0.864665 ≥ 0.767217`; `thickening 0 A = ∅`, excluded by `0 < r`; law `δ_m`, `m ∈ A`, bound `1`; `Φ(r)` equality on the axis; outer measure of a cylinder over `ker K` equals that of its base; hypothesis false | sound |
| §8.2 / `gaussian_minkowskiContent_ge` | half-space; disc; `ℚ²`; `{x_1 < 0} ∪ ℚ²` | `φ(a)`; `0.606531 ≥ 0.384633`; quotient `1/r → ∞`; `0.5/r`, lower limit `∞` in `[0, ∞]` | sound |
| §8.3 / `bobkov_inequality` | `Φ(x)`, `Φ(2x)`; `min(x², 1)`; constants incl. `0, 1`; `(1 + sin e^{x²})/2`; `n = 0` | `0.398942 = 0.398942` twice; `0.398619 ≤ 0.647406`; `I(c) ≤ I(c)`; right side `∞`; `I(c) ≤ I(c)` | sound; converse: R03 |
| §8.4 / `gaussian_concentration_median` | `f = x_1`; constant `f`, `r = 0`; `L = 0` | equality `1 − Φ(r)`, `0.022750 ≤ 0.067668`; strict set needed; `{f > m} = ∅` | sound |
| §8.5 / `gaussian_max_concentration` | `S = (1)`; `S = I_2`; `S = 0`; `S = [[1,2],[2,1]]` | equality; `0.010899 ≤ 0.022750`, median `0.544952`; `σ = 0`, set null; law `δ_0`, `m ≥ 0`, left side `0` | sound |
| §9.1 `closedGaussianSymmetral` | closed disc; ball in `ℝ³` by one and by two steps; `±u` | `{⟨y,u⟩ ≤ −0.270288}`; `{x_3 ≤ −0.846102}` both ways, measure `0.198748`; `{⟨x,u⟩ ≥ −a}` under `−u` | sound |
| §9.3 planar approximation | directions; half-plane; disc; cone step | `90°, 135°, 157.5°`; fixed; `{⟨x, u_1⟩ ≥ 0.270288}`; with `u_0 = cos θ w − sin θ u_j`, sections satisfy `A_{z + s cos θ} ⊇ A_z + [−s sin θ, s sin θ]`, and §8.1 on the line lowers the threshold by `s sin θ` | sound |
| §9.4 / `convex_closedGaussianSymmetral` | `C = ∅`, `E`, a point, a closed set containing a flat `x + F`; ball in `ℝ³` | `∅`; `E`; `∅` (null sections); cylinder over the projection; half-space | sound |
| §9.5 / `ehrhard_inequality_convex` | `[−1,1]`, `[−3,3]`, `θ = 1/2`; `θ = 0, 1`; half-spaces; `n = 0` | `1.690143 ≥ 1.628704`; `0 • A = {0}` since `A ≠ ∅`, reduces to the hypothesis; equality; both sides `1` | sound |

## Not verifiable

- Maggi2012, Theorem 15.9, Proposition 12.15, Theorem 12.26, Exercise 29.7: the cached extract holds
  the front matter, the contents and the Part IV synopsis only. The contents confirm Sections 12.1,
  12.4, 13.1, 15.2, 18.1–18.3 by number and title, and MilmanNeeman2022 (line 756, 769, 939, 946)
  cites the same four items of the same book; the statements themselves were not read.
- SudakovTsirelson1974, CarlenKerce2001, AmbrosioFuscoPallara2000, Bogachev1998, Ledoux1996:
  recorded as uncertified; cited by locator, text not read.
- Bobkov1997: the OCR text is unusable. A plain text extraction of PDF pages 4–5 (printed
  pp. 209–210) was legible enough to confirm Corollary 1 with inequality (10) for locally Lipschitz
  `f : ℝ^n → [0, 1]` and the approximation `max(1 − dist(A, x)/h, 0)` after Corollary 2; formulas
  are partly garbled, so the constants in (10) were confirmed by the README's equality cases, not by
  the text.
- CianchiFuscoMaggiPratelli2011: the published article was not read (R04); whether its numbering and
  its formulas (2.5), (4.6)–(4.14) agree with the preprint is unknown.
- Ledoux1999 (1.6): the extraction drops symbols; the absence of the factor `½` was inferred from
  line 259 and line 269–271, where the same bound is printed without it.

## Sources: the sample

Read at the locators in the cached texts, all confirmed: §1.1 (MilmanNeeman2022 line 182–187;
Ledoux1999 line 214–217; CianchiFuscoMaggiPratelli2011 line 55–57); §1.3 (MilmanNeeman2022 line
481–483, 490–497; Ledoux1993 line 251–252); §2.7 (line 481–483, 554–556); §3.1 (line 57–70, 697–702;
Maggi2012 line 716–725); §3.2 (line 762–784); §3.3 (line 892–905); §4.2 (line 76–82); §4.5 (line
558–564, proof 577–659); §6.4 (CianchiFuscoMaggiPratelli2011 line 781–828); §6.5 (line 624–631,
633–779); §7.1 (line 889–912); §7.3 (line 508–509, 220–223; MilmanNeeman2022 line 47–52, 83–84;
Ledoux1999 line 212–219; Borell1975 line 85–99); §8.1 (Ledoux1993 line 238–256; Ledoux1999 line
220–247; Ehrhard1983 line 356–359); §8.3 (Ledoux1999 line 296–313;
CianchiFuscoMaggiPratelli2011 line 597–601, 656–721; Bobkov1997 as above); §9.3 (Ehrhard1983 line
212–295, 440–457). Beyond the sample: MilmanNeeman2022 line 30–33, 98–102, 169–170, 200–207, 499–556,
660–695, 705–708, 753–761, 918–956, 2606–2640; CianchiFuscoMaggiPratelli2011 line 48–56, 174–213,
226–299, 527–552, 583–618, 833–846, 913–966; Ehrhard1983 line 64–66, 117–140, 329–376, 410–469. No
author-flagged unverified locator remains apart from those under "Not verifiable". The README's
statements are in its own normalization and, where the source's hypotheses are narrower (Theorem 4.1
(i) for smooth `W`, Theorem 4.3 for `n ≥ 2`, clusters for `q ≥ 2`), it says so and proves the
wider case by its own route.

## Duplication and overlap

By object, at the pins: no weighted divergence, weighted perimeter, Gaussian isoperimetric
function, Gaussian symmetral, cluster or Gaussian tail bound exists in Mathlib or Tau Ceti (searched
`Probability/Distributions/Gaussian/`, `Analysis/BoundedVariation/`, `Analysis/SpecialFunctions/Erf.lean`,
and both libraries for "isoperimetric", "Ehrhard", "Borell", "Bobkov", "Mills"). Tau Ceti's
`Gaussian/Maximum.lean:83` is a lower bound for an expected maximum, not §8.5; `Real.lean:309–347`
is the Euclidean inequality on the line, not §5.3; `Convex.lean` and `MinkowskiContent.lean` are
Euclidean. In the roadmaps on main and at the 477 open heads there is no match for "Gaussian
isoperimetr", "Ehrhard", "Bobkov", "isoperimetric profile", "multi-bubble", "minimizing cluster" or
any declaration name of `Suggested.lean`. The overlap report lists no changed, dropped or
revision-only id; none was found. Ownership against the open pull requests was checked through the
search over their heads.

Overlap check: read Isoperimetry, GeometricMeasureTheory, OptimalTransport (main), RandomMatrices 2.2, BanachSpaceTheory B7 (main and its open revision), MathematicalStatisticsAsymptotic, MathematicalStatisticsNonparametric, MathematicalStatisticsFoundations, MathematicalStatisticsSemiparametric, MathematicalBilliards, MathematicalStatisticsHighDimensional (open); nothing shared: Euclidean perimeter, De Giorgi, slicing and Steiner symmetrisation are GeometricMeasureTheory's and Isoperimetry's and are cited, mean-centred Gaussian concentration is RandomMatrices 2.2's and is cited as a different statement.

## Copyright and arrangement

Wording: 22 passages (the 15 sampled targets and the proof plans of §3.5, §4.3, §4.6, §7.2, §8.1,
§9.5 and the docstring of `gaussian_isoperimetric`) were set beside 8 sources; one shared run, R02.
Statements that coincide with a source's theorem (§9.3 with Ehrhard1983 Théorème 1.6, §3.1 with the
definition of a cluster) are forced by their quantifiers. Arrangement: MilmanNeeman2022 has the
largest share; its Sections 2, 3, 4 correspond to Layers 4, 2–3, 3 in a different order and with
different scope (the weighted layer is general, the model layer comes after clusters). Layers 5, 6,
7 correspond in order to CianchiFuscoMaggiPratelli2011 Sections 3, 4.1, 4.2; the order is forced by
the *Needs:* lines of §6.2, §6.6 and §7.1, and the scopes differ (Layer 5 has the structure theorem
of §5.1 and none of that section's quantitative estimate; Layer 6 has symmetrals for every `(F, u)`;
Layer 7 has `n = 0, 1` and the cluster form). Reuse: no table, figure or list is taken over; no
public formalisation with matching names was found.

Source independence: 22 passages compared with 8 sources, one shared (R02, 10 consecutive words); largest share MilmanNeeman2022, 25 of 81 locators in the layers; contents compared with MilmanNeeman2022 and CianchiFuscoMaggiPratelli2011: independent.

## Source issues

- **Gap** in MilmanNeeman2022 at Lemma 2.1, proof of injectivity, p. 11 (line 515–517): the source says that for `y ≠ x` some open cell of the cluster translated by `x` contains `y`; it should be an index maximizing `(y − x)_i`, which also covers ties such as `(1, 1, −2)`; affects the proof.
- **Error** in CianchiFuscoMaggiPratelli2011 at Lemma 4.5, inequality (4.10), preprint p. 13 (line 624–631): the source says the surface-normalized perimeter of the symmetral is at most the unscaled variation term plus the section term; it should carry `√(2π)` on the variation term (tilted half-plane: `0.778801` against `0.770391`); affects a stated result.
- **Error** in CianchiFuscoMaggiPratelli2011 at Lemma 4.4, formula (4.8), Theorem 4.3, formula (4.6), and Lemma 4.6, inequality (4.14), preprint pp. 12–14: the source says the gradient of the section probability is the boundary sum with weights `e^{−y²/2}`; it should be that sum divided by `√(2π)`, or the gradient of `√(2π)` times the section probability; affects a stated result.
- **Misprint** in CianchiFuscoMaggiPratelli2011 at formula (2.5), preprint p. 5 (line 200–208): the source says the relative Gaussian perimeter equals a supremum of integrals against the probability measure; it should carry the factor `√(2π)` to agree with the half-space value `e^{−s²/2}` of p. 2; affects a stated result.
- **Misprint** in CianchiFuscoMaggiPratelli2011 at Theorem 4.1, preprint p. 10 (line 508–509): the source says equality holds exactly for sets equivalent to a half-space; it should add the sets of measure `0` or `1`, as its Proposition 3.1 does; affects a stated result.

## For the human reviewers

- Scope: the README (lines 15, 740) assigns the multi-bubble theorem for `3 ≤ q ≤ n + 1` to "GaussianIsoperimetryAndClusters, Part II", which exists neither on main, in the merge order, among the open pull requests nor in the board index.
- Licence: CianchiFuscoMaggiPratelli2011 was read from the cvgmt PostScript preprint (`sources.toml`, `licence_class = "institutional"`); the published article was not read, and the README's corrections to (4.6)–(4.14) are against the preprint.
- Licence: Maggi2012 is recorded as certified from the author's cvgmt extract, which holds the front matter, the contents and the Part IV synopsis; six of its seven locators point into text that was not read.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7f882e2e3f5fd360ad7b513f139d8f3f4a9c4928", "job": "REV-PKG-GaussianIsoperimetryAndClusters", "model": "fable", "worker": "chris-x52"} -->
