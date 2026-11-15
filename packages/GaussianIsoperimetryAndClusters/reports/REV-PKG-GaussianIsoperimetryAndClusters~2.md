<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16957#issuecomment-6899700709 -->
Review (claude) of e51d7e8

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §2.3 Check: last digit of the segment's weighted length

   **Location.** `packages/GaussianIsoperimetryAndClusters/README.md` line 208: "its frontier is the
   segment itself, of `γ^1`-measure `φ(0)(Φ(1) − 1/2) = 0.136176`".

   **Claim.** The value to six places.

   **Witness.** `φ(0)(Φ(1) − 1/2) = 0.398942280 × 0.341344746 = 0.136176851`, which rounds to
   `0.136177`; Simpson quadrature of `(2π)^{−1} e^{−t²/2}` on `[0, 1]` gives the same. Every other value
   of the README is rounded, not truncated (`0.2959617 → 0.295962`).

   **Repair.** Write `0.136177`.

2. **F02** (P3) `gaussianPerimeter_gaussianSymmetral_le` carries a hypothesis it does not need

   **Location.** `packages/GaussianIsoperimetryAndClusters/Suggested.lean` line 304–306:
   `(hU : NullMeasurableSet U volume) (hP : gaussianPerimeter U < ⊤) : gaussianPerimeter
   (gaussianSymmetral (ℝ ∙ e) e U) ≤ gaussianPerimeter U`.

   **Claim.** Finite Gaussian perimeter is a hypothesis of the global inequality.

   **Witness.** When `hP` fails the conclusion reads `… ≤ ⊤`. Instance: `U = ⋃_{k ≥ 1}
   (1/(2k+1), 1/(2k)) ⊂ ℝ` (README §3.1) has `P_γ(U) = ∞`; its symmetral is a half-line.

   **Repair.** Delete `(hP : gaussianPerimeter U < ⊤)` and, in the docstring, "of finite Gaussian
   perimeter". In README §6.6 (line 539) keep `P_γ(U) < ∞` for the localized inequality over Borel
   `B`, and end the sentence "in particular `P_γ(S_e(U)) ≤ P_γ(U)`, which holds for every
   Lebesgue-measurable `U`, trivially when `P_γ(U) = ∞`". The repaired file elaborates (19 `sorry`
   warnings, nothing else). `hU` stays: for a non-measurable `U` the integral in the definition is the
   junk `0`.

3. **F03** (P3) §8.2 is stated for Borel sets, but its route proves it for every set

   **Location.** README line 620: "Prove that for every Borel `A ⊆ E`, `liminf_{r ↓ 0} …`";
   `Suggested.lean` line 372: `theorem gaussian_minkowskiContent_ge {A : Set E} (hA : MeasurableSet A)`.

   **Claim.** Measurability of `A` is needed.

   **Witness.** §8.1 is stated for every set with outer measure. For any `A` with `0 < γ*(A) < 1` and
   `a = Φ⁻¹(γ*(A))` it gives `γ(cthickening r A) ≥ Φ(a + r)`, so the quotient is at least
   `(Φ(a + r) − Φ(a))/r → φ(a) = I(γ*(A))`; for `γ*(A) ∈ {0, 1}` the right side is `0`.

   **Repair.** README: "for every set `A ⊆ E`, its Gaussian measure being the outer measure when `A`
   is not measurable"; the route is unchanged. Lean: `theorem gaussian_minkowskiContent_ge (A : Set E)`
   and "For every `A ⊆ E`" in the docstring. The repaired file elaborates. Instance: a non-measurable
   `A` of outer measure `1` gives `0 ≤ liminf`, true.

4. **F04** (P3) §3.5 locator drops the source's smoothness hypothesis

   **Location.** README line 320: "MilmanNeeman2022 Theorem 4.1 (i), line 918–922, for `q ≥ 2`, with
   its proof at line 939–956".

   **Claim.** The source states existence for the weights of this roadmap, apart from `q ≥ 2`.

   **Witness.** MilmanNeeman2022 line 920 states the theorem for `W ∈ C^∞`, and line 697–701 makes a
   `C^∞` positive density and Borel cells the standing assumptions of its Sections 3–4. The README
   states §3.5 and Layers 2–3 for `C¹` weights and Lebesgue-measurable cells, and never says so.

   **Repair.** In §3.5 write "for `q ≥ 2` and `W ∈ C^∞`", and add to the Conventions, after the
   definition of a weight: "Milman–Neeman assume a `C^∞` density and Borel cells throughout their
   Sections 3–4; the statements of Layers 2–3 are for `C¹` weights and Lebesgue-measurable sets, by the
   routes given." The statement itself is sound for `C¹`: its route uses only §2.4.

5. **F05** (P3) §4.5 route: the negation of divergence is "bounded above"

   **Location.** README line 402: "Otherwise, along a subsequence some such difference stays bounded".

   **Claim.** If `x_{m,l} − x_{m,i}` does not tend to `+∞`, a subsequence of it is bounded.

   **Witness.** A difference tending to `−∞` does not tend to `+∞` and has no bounded subsequence. The
   next step uses only the upper bound `x_{m,l} ≤ x_{m,j} + C` (as MilmanNeeman2022 line 607–608
   does).

   **Repair.** "Otherwise, along a subsequence some such difference stays bounded above". With that
   the contradiction covers the instance: the cell `x_m + Ω^m_l` still contains
   `{z : z_l > z_j + C for all j ≠ l}`.

Five findings, all P3, none blocking. The six findings of round 1 are repaired. No statement of
`Suggested.lean` was found false, the file elaborates with `sorry` as the only warning, every pinned
declaration and supplier section the README cites exists where it is cited, and the dependency check
is clean. The findings are one Check value wrong in its last digit, two hypotheses the statements do
not need, one locator that drops the source's hypothesis, and one imprecise step in a repaired route.

## Round 1 findings, one by one

- **F01 (P2), §2.3 convex route — repaired.** `packages/GaussianIsoperimetryAndClusters/README.md`
  line 199: "for every ball `B` the set `C ∩ B` is bounded and convex, so it has finite Euclidean
  perimeter (`Convex.perimeter_lt_top`) … Moreover `∂^M C = ∂C`." The route now uses only
  `Convex.perimeter_lt_top` (TauCeti/Analysis/BoundedVariation/Convex.lean:507),
  `TauCeti.perimeter_congr_ae` and `TauCeti.perimeter_mono` (Perimeter.lean:83, 87),
  `geometric_hahn_banach_open_point` (Mathlib/Analysis/LocallyConvex/Separation.lean:124),
  `Convex.openSegment_interior_closure_subset_interior` (Mathlib/Analysis/Convex/Topology.lean:142),
  `TauCeti.essentialBoundary_subset_frontier` and §2.2; G6 is kept for bounded Lipschitz domains
  only. All opened at the pins; each is in the *Needs:* line and the supplier contracts.
- **F02 (P2), §4.5 wording — repaired.** Line 402 now reads "let `y_m` be the orthogonal projection
  of `x_m` onto the copy of `E^{(k−1)}` in `E^{(q−1)}` formed by the vectors supported on `J`"; the
  10-word run is gone (longest run shared with MilmanNeeman2022 in the section: under 7 words). The
  new route was checked step by step against MilmanNeeman2022 line 577–659 (table below); one
  imprecision, R05.
- **F03 (P3), converse of Bobkov — repaired.** Summary (line 3): "Bobkov's functional inequality,
  sharp concentration …"; §8.3 (line 631): "for a nonempty closed `A ⊆ E` and `r > 0` the function
  `f_r = max(0, 1 − d_A/r)` … is `(1/r)`-Lipschitz". The restriction to nonempty `A` is right
  (`Metric.infDist_empty`, Mathlib/Topology/MetricSpace/HausdorffDistance.lean:478) and is a Check.
- **F04 (P3), preprint version — repaired.** Line 27: "The formulas of Cianchi–Fusco–Maggi–Pratelli
  are cited from their cvgmt preprint"; reference at line 752 names the preprint as the version read.
- **F05 (P3), Layer 7 described by a source — repaired.** Line 118: "then the structure of the
  minimizers that §3.5 provides: half-line sections, convexity of the density-one representative,
  and separation by a hyperplane."
- **F06 (P3), docstring — repaired.** `Suggested.lean` line 326: "(MilmanNeeman2022, Theorem 1.1 for
  `q = 2`)".

The repaired patterns were searched in the rest of the package: no other route rests on a convex
set being a Lipschitz domain (no match for "convex Lipschitz" or "is a Lipschitz domain"); no
theorem is announced as a converse of another ("its converse", "Conversely, if": no match); no other
layer is described by a source's argument; no other plural-locator slip. Maintainer notes: none were left.

## Verified sound

**Principles.** No `set_option`, no sorry'd data (17 definitions with bodies), no algorithm, no
copied passage, no supplier later in the merge order, no cycle; the general multi-bubble theorem is
left to a named Part II with the stopping point stated.

**Elaboration.** `lake env lean` on `packages/GaussianIsoperimetryAndClusters/Suggested.lean` from
the content checkout: 19 warnings, all "declaration uses `sorry`" (lines 100, 112, 129, 144, 190,
255, 269, 304, 316, 328, 338, 351, 360, 372, 381, 391, 400, 420, 428), no error. Header: `module`,
`import Mathlib`, six `TauCeti.*` modules, all used; 76 roadmaps on main open with `module`.

**Signatures.** The 36 elaborated types of the worker's `#check @name` listing were compared with
the README. The three flagged definitions (`gaussianWeight`, `gaussianSymmetral`,
`closedGaussianSymmetral`) lose only instances their bodies do not use; all 19 theorems carry
`FiniteDimensional`, `MeasurableSpace`, `BorelSpace`, and `Nontrivial` where the README says
`n ≥ 1`. The local-finiteness hypothesis `hfin` of the three Layer 2 theorems is word for word the
predicate in the definition of `TauCeti.variationMeasure` (VariationMeasure.lean:136), so the
statements never read its junk value `0`.

**One-tactic probe.** All 19 sorried theorems on a scratch copy with
`first | rfl | (simp; done) | infer_instance | (simp [the roadmap's definitions]; done) | aesop | sorry`:
none closes (9 fall through to `sorry`, 10 are left with unsolved goals by `aesop`). No padding.

**Headline theorems.** The Summary's end theorems and layer results against the Lean file:
`gaussian_isoperimetric`, `isoperimetricProfile_two_eq`, `Cluster.perimeter_eq_iff_halfSpaces`,
both `borell_sudakov_tsirelson` theorems, `gaussian_minkowskiContent_ge`, `bobkov_inequality`,
`gaussian_concentration_median`, `gaussian_max_concentration`, `convex_closedGaussianSymmetral`,
`ehrhard_inequality_convex`, and the seven results of §2.2, §2.5, §2.6, §3.5, §4.3, §4.6, §6.6: all
stated, none through a stand-in; the module docstring says none is omitted. All 36 Lean names occur
in the README, and every backticked name of the roadmap's own is declared (the resolver's lead on
`Cluster.perimeter_eq_iff_halfSpaces` is a false alarm: line 338).

**Pinned declarations.** 94 located citations of the README were opened at the pins: 89 matched by
script at the cited file and line, 5 by hand (`cdf_gaussianReal_pos` 205, `cdf_gaussianReal_lt_one`
212, `strictMono_cdf_gaussianReal` 219, `hasDerivAt_cdf_gaussianReal` 226 in
TauCeti/Probability/Distributions/Gaussian/Cdf.lean; `TauCeti.outerNormal` at
ReducedBoundary.lean:106). Read for content: `Convex.perimeter_lt_top` (bounded convex, additive
Haar measure, no measurability), `essentialBoundary` (complement of density-one and density-zero
points, EssentialBoundary.lean:143), `reducedBoundary` (a subset of `Ω`, ball averages of the polar
density), `multivariateGaussian` (Multivariate.lean:166, with `CFC.sqrt`),
`norm_fderiv_le_of_lipschitz` (FDeriv/Basic.lean:949), `Metric.lipschitz_infDist_pt` (551).

**Supplier sections, resolved on main.** GeometricMeasureTheory G2 (weighted area and coarea,
tangential area formula, graph surface measure), G4 (convolution estimates), G5 (De Giorgi with
blow-up, essential versus reduced boundary, converse criterion with a local version), G6 (Lipschitz
and `C¹` domains); Isoperimetry I1–I2, I4 (slicing theorem with reduced-boundary and normal
comparison for sets of positive finite volume and finite perimeter, the measure-preserving
`e^⊥ × ℝ` equivalence, essential convexity for sets of positive finite volume); RandomMatrices 2.2;
BanachSpaceTheory B7. Each exists with the content cited. No gap is declared (`design/plan.json`
has `gaps: []`) and none is needed.

**Dependency check.** Output: `depcheck: 246 roadmaps, 2241 edges, 0 problem(s)`. No UPWARD, CYCLE
or moved line.

**Shape and residue.** Nine layers, each ending with Examples and Dependencies; every definition has
its API bullets and at least three Checks; no LaTeX delimiters, pull-request numbers, dates, paths or
process words; no `lemma`, `#eval`, `True` placeholder. `sources.toml` records all 13 works of the
reference list.

### Adversarial table

Sections whose round-1 rows carried computed values and that no repair touched are not repeated; the
rows below are the repaired passages, the sampled targets, the sections round 1 had no row for
(§2.4, §3.4, §4.1, §4.4, §4.7, §5.1, §6.2, §7.2, §9.2) and the headline statements re-derived.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §2.3 open convex `C` (repaired) | quadrant; `∅`, `E`; closed segment; `n = 1`, `C = (a, b)` | half-line `1/(2√(2π)) = 0.199471`, `P_γ = 0.398942 > I(1/4) = φ(−0.674490) = 0.317777`; both sides `0`; segment `0.136176851`; `e^{−W}` at `a, b` by counting measure | sound; R01 |
| §2.3 route `∂^M C = ∂C` | corner of quadrant; ratio bounds at any `x ∈ ∂C` | density `1/4`; ratio `≤ 1/2` (half-space) and `≥ c > 0` (cone) at every radius, so neither density `1` nor `0` in `HasDensityAt` | sound |
| §2.4 | `{x_1 < k}`; `(k, k+1)`, weight `0`; `(−1,1) ∪ (1+1/k, 2)` | `φ(k) → 0`; perimeter `2`, no `L¹` limit; `3φ(1) + φ(2) = 0.779903` against `φ(1) + φ(2) = 0.295962` | sound |
| §2.6 (sampled) | `f = ‖x‖` on `ℝ²`; `u ∉ BV_loc` | `∫_0^∞ r e^{−r²/2} dr = 1`; both sides `∞` through `min e^{−W}` on a compact | sound |
| §3.1, §3.2 (sampled) | three intervals, `a = 0`, `b = 1`; half-annuli | `φ(0) + φ(1) = 0.640913`, minus `A_12 = 0.398942` is `0.241971`; boundary length `2^{−2k}(π + π/2 + 1)`, closed boundary so Gauss–Green vector `0` on `ball(0, 2^{−2k})` | sound |
| §3.3 (sampled) | three intervals; `(E, ∅, ∅)` | form `φ(a)(a_1−a_2)² + φ(b)(a_2−a_3)²` definite on `E^{(2)}`; `L_A = 0` at a vertex | sound |
| §3.4 | density `c(1+y²)exp(−x²(1+y²)⁴)` | `∫ dx = √π/(1+y²)²`, total mass finite; line `x = 0`: `∫ c(1+y²) dy = ∞`; line `x = t ≠ 0` finite | sound |
| §3.5 / `exists_cluster…` (sampled) | `q = 0`; `v = (2, −1)`; `n = 0` | `Σ v = 0 ≠ 1`; needs `μ(Ω_0) = 2 > 1`, excluded by `hv`; no cluster at `(1/2, 1/2)`, excluded by `Nontrivial` | sound; R04 on the locator |
| §4.1 (sampled) | `q = 2`, `x = tu`; `q = 3`, `x = 0`; conormals | `e^{−W(x)} = φ(t)` on a point; ray `0.199471`, total `0.598413`; `(−1,−1,2) + (2,−1,−1) + (−1,2,−1) = 0`, norms `√6`; `⟨n_12, n_13⟩ = 1/2`, mean norm `√3/2` | sound |
| §4.4, §4.7 | wrong evaluation point; three intervals in `ℝ` | `φ(0.482734) = 0.355065` against `φ(1) = 0.241971`; `2 × 0.363600 = 0.727200 > 0.598413` | sound |
| §4.5 (sampled, repaired) | `c = 0`, `d = 1`, `q = 3`; `c_m → ±∞`; `v = (1/2, 1/2, 0)` | `⟨e_i − e_l, n_ij⟩ = 1/√2`, residual `2 − 1/2 = 3/2`, mean `c/2`; piece `φ(0)(1 − Φ(1/√1.5)) = 0.082624`; bound `≤ φ(c/√2) → 0`; limit `φ(0) = 0.398942` | sound; R05 |
| §4.6 / `modelProfile_hessian` (sampled) | `q = 3`, `x = 0`; `q = 2` | `L_A = 3A = 0.598413`, `∇² = −1.671086`, `−tr(∇²)⁻¹ = 1.196827`, `DΨ = −0.423142`, boundary term `(2π)^{−1} = 0.159155`; `H(2A u, u) = −1` | sound |
| §5.1 | `(0,1) ∪ (1,2)` | `φ(0) + φ(2) = 0.452933` | sound |
| §5.3 (sampled) | half-lines of measure `1/3`; `(−1, 1)` | `Φ⁻¹(1/3) = −0.430727`, `I = 0.363600`; `2φ(1) = 0.483941 > I(0.682689) = I(0.317311) = 0.356343` | sound |
| §6.2 | half-disc cut of `{x_1 < 0}` | volume `πR²/2`, perimeter `πR + 2R`; section `(−√(R²−s²), 0)` | sound |
| §6.4 (sampled) | tilted half-plane; slab | `∫ φ(1+z)φ(z) dz = 0.219696`; `√2 ×` it `= φ(1/√2) = 0.310697`; source normalization `√(4π) × 0.219696 = 0.778801 = e^{−1/4}` against `√(2π+1) × 0.219696 = 0.592901`; slab `0.483941` both sides | sound |
| §6.6 / `gaussianPerimeter_gaussianSymmetral_le` (sampled) | disc; `n = 1`, `(−1, 1)`; `P_γ(U) = ∞` | `0.517483` between `0.384633` and `0.606531`; `(−∞, 0.475233)`, `0.356343 ≤ 0.483941`; conclusion `≤ ⊤` | sound; R02 |
| §6.5 Check (feeds §6.6) | disc | `2e^{−1/2}/π = 0.386129`, `∫ I(v_U) dγ = 0.252249`, sum `0.638378` | sound |
| §7.1 (sampled) | disc | section `(−1, 1)`, `0.606531 > 0.384633` | sound |
| §7.2 | strips `{|x_1 − 2^{−k}| < 4^{−k}}`, `ρ = 1/16`, `1/4` | actual area fraction `0.032981`, bound `(256/27)ρ/π = 0.188628`; missed sections `(5/6)ρ = 0.052083`, `0.208333`; cylinder count: bad base points `≤ 2ε` of the base | sound |
| §7.3 / `gaussian_isoperimetric` | `n = 0`; non-measurable `U`; `γ(U) = 0` | `0 ≤ 0`, no unit vector, left disjuncts hold; integral junk `0`, so `hU` is needed; `I(0) = 0 = P_γ` | sound |
| §7.4 | `v = (2, −1)`; `(E, ∅)` | profile `∞` against `ofReal(I(2)) = 0`, excluded by `hv`; perimeter `0 = I(1)`, excluded by `h1` | sound |
| §8.2 / `gaussian_minkowskiContent_ge` | non-measurable `A`, `γ*(A) = 1`; `0 < γ*(A) < 1` | right side `0`; quotient `≥ (Φ(a+r) − Φ(a))/r → φ(a)` | sound; R03 |
| §8.3 approximation (repaired) | `A = {x_1 ≤ 0}`, `r = 1`; `A = ∅` | `∫ ‖∇f_1‖ dγ = Φ(1) − 1/2 = 0.341345 =` quotient; `f_r ≡ 1`, `∫ f_r = 1 ≠ 0` | sound |
| §8.4 / `gaussian_concentration_median` (sampled) | `f = x_1`; `r < 0` with `f = max(m, L x_1)`; `L = 0` | equality, `0.022750 ≤ 0.067668`; `{f ≤ m + Lr} = ∅` has measure `0 < Φ(r)`, so `hr` is needed; set empty | sound |
| §9.2 (sampled) | `(−1, 1)`, `(0, 2)`, `(−3, −0.5)`, `(0.5, 0.6)`; `a = b` | `∂²_a = ∂²_b = −0.459912`; determinants `0.163502`, `0.015519`, `0.000142`, `15.648788` (closed form and finite differences agree); `g(−1, 1) = 0.475233`; point section has measure `0`, symmetral section empty, and `{b − a > 0}` is convex | sound |
| §9.4 / `convex_closedGaussianSymmetral` (sampled) | ball in `ℝ³`; half-space `{⟨x, w⟩ ≤ c}`, `w = w_F + w_⊥` | `γ = 0.198748`, `Φ⁻¹ = −0.846102`; symmetral `{‖w_F‖⟨x, u⟩ + ⟨x, w_⊥⟩ ≤ c}`, a half-space, or a slab condition on `x_⊥` when `w_F = 0` | sound |

## Not verifiable

- Maggi2012 (Theorem 15.9, Proposition 12.15, Theorem 12.26, Sections 13.1, 18.1–18.3, Exercise
  29.7): the cached extract holds the front matter, the contents and the Part IV synopsis. The
  contents confirm "13.1 The coarea formula" (line 79) and "18.1 The coarea formula revised"
  (line 99); the synopsis (line 716–725) was read for §3.1. The statements were not read, so whether
  Section 13.1 covers `L¹_loc` functions or only Lipschitz ones for §2.6 (b) is not settled; the
  unweighted `BV` form is Tau Ceti's theorem in any case.
- Bobkov1997: the cached text is OCR of glyph images and is unusable (line 72–112 are symbol
  fragments). The page markers at line 72 and 98 are PDF pages 4 and 5, printed pp. 209 and 210; the
  statements were not read this round.
- Ledoux1993 inequality (10) and Ledoux1999 (1.6): the extraction drops the displayed formulas; the
  surrounding text (line 257–264; line 220–226, 259, 269) confirms the statements and the absence of
  the factor `½`.
- SudakovTsirelson1974, CarlenKerce2001, AmbrosioFuscoPallara2000, Bogachev1998, Ledoux1996: recorded
  as uncertified, cited by locator, text not read.
- CianchiFuscoMaggiPratelli2011: the published article was not read; the README now says the
  preprint is the version cited.

## Sources: the sample

Read at the locators, all confirmed unless a finding says otherwise: §3.1 (MilmanNeeman2022 line
57–70, 697–702; Maggi2012 line 716–725); §3.2 (line 762–784; the display (3.6) is a statement about
supports, in agreement with the README's closure form); §3.3 (Lemma 3.4, line 892–905, proved there
from the Gaussian isoperimetric inequality, as the README says); §3.5 (Theorem 4.1 (i), line 920–922,
proof 939–956; R04); §4.1 (line 499–505, and 522–524 for the normal); §4.5 (Lemma 2.3, line 558–564,
proof 577–659); §4.6 (Proposition 2.4, line 669–695; (1.3)–(1.4), line 200–207, and the `√2` remark
at 208–209); §5.3 (CianchiFuscoMaggiPratelli2011 Proposition 3.1, line 220–223, proof 233–293);
§6.4 (Lemma 4.6, line 781–828, for `B ⊆ B_E`); §6.6 (Theorem 4.3, line 583–588, `n ≥ 2`, proof
833–846); §7.1 (Steps I–II, line 889–912); §8.4 (Ledoux1993 line 257–262; Ledoux1999 line 225–226);
§9.2 (Ehrhard1983 Lemme 3.3, line 410–438; one-dimensional case of Théorème 3.1, line 377–439);
§9.4 (Théorème 3.1, line 367–369; Corollaire 2.3, line 350–355, `k − 1` two-dimensional
symmetrisations); §2.6 (Maggi2012 contents only, see above). No locator is flagged by the author as
unverified beyond those under "Not verifiable".

## Duplication and overlap

By object at the pins, as in round 1 and re-searched: no weighted divergence, weighted perimeter,
Gaussian isoperimetric function, Gaussian symmetral or cluster in Mathlib or Tau Ceti; the 36
library near-match leads contain no same-name hit and no statement of a target. In the roadmaps on
main and at the 477 open heads there is no match for "Gaussian isoperimetr", "Ehrhard", "Bobkov",
"Sudakov", "isoperimetric profile", "multi-bubble", "double bubble" or any declaration name of
`Suggested.lean`; "weighted perimeter" matches only a hexagon count in TensorProductCombinatorics,
and "Gaussian concentration" in MathematicalStatisticsHighDimensional names a step that roadmap
replaces, not a target. The overlap report lists no changed, dropped or revision-only id, and the
board index has no second package of this name. Ownership against the open pull requests was
checked through the search over their heads.

Overlap check: read Isoperimetry, GeometricMeasureTheory, OptimalTransport (main), RandomMatrices 2.2, BanachSpaceTheory B7 (main), MathematicalStatisticsAsymptotic, MathematicalStatisticsNonparametric, MathematicalStatisticsFoundations, MathematicalStatisticsSemiparametric, MathematicalStatisticsHighDimensional, MathematicalBilliards (open); nothing shared: Euclidean perimeter, De Giorgi, area and coarea are GeometricMeasureTheory's, slicing, Steiner symmetrisation and essential convexity are Isoperimetry's, mean-centred Gaussian concentration is RandomMatrices 2.2's, and each is cited, not restated.

## Copyright and arrangement

Wording: the 15 sampled targets and six further passages (the repaired routes of §2.3, §4.5 and
§8.3, the routes of §7.2 and §7.3, and the docstrings of `Suggested.lean`) were set beside the
sources, and a word n-gram scan of the whole README (reference list excluded) and of the Lean file
was run against the eight readable texts. The longest shared run is 8 words, in §7.3 ("are disjoint
and their union has full measure", CianchiFuscoMaggiPratelli2011 line 965–966): a statement of two
hypotheses that the mathematics forces. Next are 7 words with MilmanNeeman2022 ("as a quadratic form
on `E^{(q−1)}`"), notation. No finding. Bobkov1997 could not be compared (unusable text).
Arrangement: MilmanNeeman2022 has the largest share; its Sections 2, 3, 4 correspond to Layers 4,
2–3, 3, in another order and with other scope (the weighted layer is general, the model layer comes
after clusters). Layers 5, 6, 7 follow CianchiFuscoMaggiPratelli2011 Sections 3, 4.1, 4.2 in order;
the *Needs:* lines of §6.2 (§5.1), §6.6 (§5.3) and §7.1 (§6.6) force that order, and the scopes
differ. Layer 9 draws §9.2 from Ehrhard1983 Section 3 before §9.3 from Section 1. Reuse: no table,
figure or list taken over; no public formalisation with matching names found.

Source independence: 21 passages compared with 8 sources, none shared beyond an 8-word forced run; largest share MilmanNeeman2022, 26 of 82 locators; contents compared with MilmanNeeman2022, CianchiFuscoMaggiPratelli2011 and Ehrhard1983: independent; Bobkov1997 and the body of Maggi2012 could not be read.

## Source issues

- **Misprint** in MilmanNeeman2022 at Lemma 2.3, proof, p. 14 (line 612–614): the source says the translated cell is where one shifted coordinate exceeds the minimum of the others; it should be the maximum of the others; affects nothing.
- **Gap** in MilmanNeeman2022 at Lemma 2.1, proof of injectivity, p. 11 (line 515–517): the source says some open cell of the translated cluster contains any other point; it should take an index maximizing the coordinate difference, which covers ties; affects the proof.
- **Error** in CianchiFuscoMaggiPratelli2011 at Lemma 4.5, inequality (4.10), preprint p. 13 (line 624–631): the source says the surface-normalized perimeter of the symmetral is at most the unscaled variation term plus the section term; it should carry `√(2π)` on the variation term; affects a stated result.
- **Error** in CianchiFuscoMaggiPratelli2011 at Lemma 4.4, formula (4.8), and Lemma 4.6, inequality (4.14), preprint pp. 12–14: the source says the gradient of the section probability is the boundary sum with unnormalized weights; it should be that sum divided by `√(2π)`; affects a stated result.
- **Misprint** in CianchiFuscoMaggiPratelli2011 at Theorem 4.1, preprint p. 10 (line 508–509): the source says equality holds exactly for sets equivalent to a half-space; it should add the sets of measure `0` or `1`, as its Proposition 3.1 does; affects a stated result.

## For the human reviewers

- Scope: the README (line 15 and line 746) assigns the multi-bubble theorem for `3 ≤ q ≤ n + 1` to "GaussianIsoperimetryAndClusters, Part II", which is neither on main, in the merge order, among the open pull requests nor in the board index.
- Licence: CianchiFuscoMaggiPratelli2011 was read from the cvgmt PostScript preprint (`sources.toml`, `licence_class = "institutional"`); the README's corrections to (4.7)–(4.14) are against that version, and the published article was not read.
- Licence: Maggi2012 is recorded as certified from the author's cvgmt extract (front matter, contents, Part IV synopsis); six of its seven locators point into text nobody read.
- Not tested: Bobkov1997 (`licence_class = "author-page"`) has an unusable cached text; the wording of §8.3 was not compared with it this round.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e51d7e8737f1724bb079acd5de7af109348130ef", "job": "REV-PKG-GaussianIsoperimetryAndClusters~2", "model": "fable", "worker": "chris-x55"} -->
