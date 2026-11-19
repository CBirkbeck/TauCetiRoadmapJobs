# Review of GeometricMeasureTheory (pull request #2581 at 4f5daa9)

**Verdict:** needs changes

**Summary.** I found no false statement. Every Check and worked example I recomputed is correct, the fourteen declarations of `Suggested.lean` elaborate at the pins with only `sorry` warnings and say what the README says, and the dependency check is clean. Two findings block acceptance. First, no target has a theorem or page locator: the README has fourteen bare "(Maggi)" or "(Simon)" attributions, and eight sections cite no source at all. Second, the module docstring says the tangential area formula cannot be stated at the pins, but one predicate in the style of `IsApproxTangentPlane` is enough to state it. There are also two small corrections and one format note. The human reviewers have three points to decide: how two source copies are hosted, a source that could not be read, and the prior formalisations the README names.

## R01 (P2) — No target carries a locator, so no stated result can be checked against its source

A reader cannot tell where a hypothesis comes from. For example, the structure theorems are stated relative to an open `Ω`, while the cited book proves them for sets of locally finite perimeter in the whole space; without a locator, nobody can see where the relative form is established.

The README cites a source fourteen times, always as a bare name:

- "(Maggi)" nine times: 4.1 line 539, 4.3 line 580, 5.1 lines 633 and 635, 5.2 line 664, 5.3 line 695, 5.4 line 734, 6.1 line 797, 6.2 line 814;
- "(Simon)" five times: 2.1 lines 220 and 223, 2.2 line 273, 2.3 line 301, 2.4 line 321.

The docstrings of `Suggested.lean` (lines 57–186) do the same nine times. Sections 1.1, 3.1–3.4, 4.2, 6.3 and 6.4 (lines 130, 383, 413, 456, 479, 559, 832, 874) cite nothing. The README on main had no locators either, but this revision adds the attributions without them.

The smallest change is a theorem and page at each claim. I checked the following in Simon's *Lectures on Geometric Measure Theory* (1983, open copy at ANU):

- §2.1: Definition 11.2, p. 60, and Theorem 11.6 with Remark 11.5, p. 61. Same hypotheses: `Hⁿ`-measurable, locally finite.
- §2.3: the tangential gradient and the area formula on rectifiable sets, 12.1–12.5, pp. 67–69.
- §2.4: the coarea formula for `f` locally Lipschitz on an open set, with `N < n`, 12.6–12.7, pp. 69–70. The linear and `C¹` cases are §10, pp. 53–56. The case `dim F = dim E` is the area formula 12.4.

For Maggi, the public table of contents gives only section and page:

- §5.1: §13.2, p. 150;
- §5.2–§5.3: Chapter 15 and §15.1, pp. 167–171;
- §5.4: Chapter 16, p. 183;
- §6.2: §9.3, p. 93.

The theorem numbers have to come from the book. The BV sections (3.1–3.4, 4.2, 6.3) and §6.4 need a named source, for instance one of the BV monographs that the Tau Ceti files on the reduced boundary already cite (Evans–Gariepy, Ambrosio–Fusco–Pallara), with theorem and page.

## R02 (P2) — The tangential area formula can be stated at the pins, but `Suggested.lean` leaves it out and says it cannot be stated

The acceptance test lacks one of the two Layer 2 headlines that its own docstring lists (line 21). Varifolds and GeometricCurrents consume that formula.

Lines 34–37 say it is not statable because its integrand needs a tangential differential, "a carrier that neither library has". A predicate with a real body is enough, which is exactly how the file already handles `IsApproxTangentPlane`. I appended the following to a copy of the file. It elaborates at the pins with only the `sorry` warning:

```lean
def IsTangentialDifferential (k : ℕ) (M : Set E) (f : E → F) (x : E) (P : Submodule ℝ E)
    (L : P →L[ℝ] F) : Prop :=
  ∀ ε : ℝ, 0 < ε → Tendsto (fun r : ℝ => μHE[k] ({y ∈ M | ε * ‖y - x‖ <
      ‖f y - f x - L (P.orthogonalProjectionOnto (y - x))‖} ∩ Metric.closedBall x r) /
      ENNReal.ofReal (r ^ k)) (𝓝[>] 0) (𝓝 0)

theorem lintegral_mul_normDet_tangentialDifferential {k : ℕ} {M : Set E}
    (hM : CountablyRectifiable k M) (hMm : NullMeasurableSet M μHE[k])
    (hfin : ∀ K, IsCompact K → μHE[k] (M ∩ K) ≠ ⊤) {f : E → F} {K : ℝ≥0} (hf : LipschitzWith K f)
    (P : E → Submodule ℝ E) (L : ∀ x, P x →L[ℝ] F)
    (hPL : ∀ᵐ x ∂(μHE[k] : Measure E).restrict M, finrank ℝ (P x) = k ∧
      IsApproxTangentPlane k M x (P x) ∧ IsTangentialDifferential k M f x (P x) (L x))
    {g : E → ℝ≥0∞} (hg : Measurable g) :
    ∫⁻ x in M, g x * ENNReal.ofReal ((L x : P x →ₗ[ℝ] F).normDet) ∂μHE[k] =
      ∫⁻ y, ∑' x : ↥(M ∩ f ⁻¹' {y}), g x ∂μHE[k] :=
  sorry
```

The predicate is the README's own definition in §2.3. The integrand is a.e. equal to a measurable function, so the lower integral on the left is the intended one.

The fix:

- add the predicate and the theorem, or a variant in your own form;
- name both in §2.3;
- remove the bullet at lines 34–37, so that the docstring lists no unstatable headline.

## C01 — The Simon reference names the 1983 Lectures but links to the 2014 Tsinghua notes, whose numbering differs

References, line 1412: the title is *Lectures on Geometric Measure Theory*, but the link goes to the revised notes *Introduction to Geometric Measure Theory*. There, Theorem 11.6 of the Lectures is Chapter 3, Theorem 1.6, p. 71. The locators that R01 asks for must refer to one of the two texts. Either link the open ANU copy of the Lectures (`maths.anu.edu.au/files/CMAProcVol3-Complete_1.pdf`) or retitle the entry and cite the notes' numbering.

## C02 — The README does not say that Layers 1–6 are the former G1–G6, so other roadmaps' citations cannot be followed

Several roadmaps on main cite the old labels:

- Varifolds, line 352 ("G2");
- GeometricCurrents, line 79 ("G2–G6");
- GaussianIsoperimetryAndClusters, lines 109–110 ("G2", "G5");
- Isoperimetry, lines 56–57;
- DifferentialGeometry, line 3120;
- RiemannianGeometry, lines 974, 2854, 3008 and 3026, including the anchors `#g1--rectifiable-curves-and-arclength` and `#g3--distributional-bv-and-variation-measures`.

The head no longer uses any "G" label. The pull request's description gives the correspondence, but the README does not. One sentence would let those citations be followed, for example in Scope and ownership: "Layers 1–6 were numbered G1–G6 in the former numbering of this roadmap."

## N01 — References (lines 1414–1421) and Convention 12 (lines 117–120) cite Mathlib pull requests and a Zulip thread

These are process references in a README. Either state the API direction they fix in words, or drop the links.

## Questions for the author

- §4.1 (README line 539, Lean line 106) attributes strict approximation of an integrable function on an arbitrary open set to Maggi. Maggi's book is about sets, and its index lists the total variation of a function only at p. 146 (§13.1). Which result is meant? I could not read the book legally.
- §6.2 (line 814): does the claim `|Dχ_Ω| = Hⁿ⁻¹⌊∂Ω` for bounded Lipschitz domains come from Maggi's Gauss–Green theorem on sets with almost `C¹` boundary (§9.3; the index lists "set with Lipschitz boundary" at p. 92)? Same obstacle.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §1.1 metric speed, arclength factorization | `γ = exp(2πiφ)`, `φ = (t+C)/2`; pausing `γ` on `[0,3]` | `‖γ'‖ = π` a.e., `∫ = π` vs length `2π`; `s = γ`, `c(ℓ) = ℓ`, `γ' = s' = 0` on `(1,2)` | holds; AC needed for length, as stated |
| `IsApproxTangentPlane` (§2.1) | `M = P` a `k`-plane; two axes at `0`; `k = 0`, `M` discrete | `r⁻ᵏ∫ = ∫_P φ` for all `r`; blow-up is `M`, no line; `Σ φ((y−x)/r) → φ(0) = ∫_{0} φ dH⁰` | matches Simon Def 11.2 (p. 60) |
| `ae_existsUnique_isApproxTangentPlane` | `k > n`; circle radius `ρ`; Simon Thm 11.6 | `μHE[k] = 0`, vacuous; `4ρ arcsin(r/2ρ)/(2r) → 1`; same measurability and local finiteness | holds |
| §2.3 tangential area formula | unit circle, `f = x`; `dim F < k` | `∫|sin θ| = 4 = ∫₋₁¹ 2`; both sides `0` (normDet of non-injective map, `Hᵏ` on `F`) | holds (Simon 12.4–12.5); R02 |
| `lintegral_setLIntegral_inter_preimage_eq_setLIntegral_mul_normDet_adjoint` | `f = ‖x‖` on ball `R`; `dim F = 0`; `dim F = dim E` | `∫₀ᴿ nω_n r^{n−1} = ω_n Rⁿ`; `normDet_of_subsingleton = 1` gives `∫_s g` both sides; `|det|`, `H⁰` counting | holds |
| §3.1 derivative measure | `1_{(0,∞)}`, `1_{(−∞,0)}`; `⟪a,x⟫` on bounded `Ω` | `∫₀^∞ ψ' = −ψ(0)` gives `δ₀`, `−δ₀`; `|Du|(Ω) = ‖a‖|Ω|` | sign matches Convention 6 |
| §3.2 lattice, dilation | `1_(0,2)`, `1_(1,3)`; `1_(0,1)`, `1_(1,2)`; `1_{B₁}(r·)` | `2+2 = 4` equality; `2 < 4`; variation `nω_n r^{1−n}`, `L¹` norm `ω_n r^{−n}` | holds |
| §3.4 Cantor function | `C(1/3)`, `C(2/3)`; `DC([1/3,2/3])`; `∫_ℝ C` | `1/2`, `1/2`; `0` (no atoms); `∞`, so not in `BV(ℝ)`, in `BV(Ω)` for bounded `Ω` | holds (values `0`/`1` off `[0,1]` checked in the definition) |
| `exists_contDiffOn_tendsto_totalVariationOn` | `u = 1`, `u_j = 1+sin(jx)/j`; `sin(1/x)`; `Ω = ∅` | variation `→ 2/π ≠ 0` (not strict); variation `∞` forces `→ ∞` by lower semicontinuity; trivial | holds |
| §4.2 compactness | `sin(jπx)` on `(0,1)`; `1_{(j,j+1)}` on `(0,∞)` | variation `2j`, `L¹` norm `2/π`, no convergent subsequence; BV norm `3`, none | both hypotheses needed, as the Checks say |
| §4.3 regular levels | `‖x‖²`, `t = r²`; `x²`, `t = 0`, `n = 1` | `P = nω_n r^{n−1}`, `ν = −x/‖x‖` into ball; `P = 0` vs `H⁰{0} = 1` | holds |
| §5.1 truncation | `(0,1)²`, `x₀ = 0`, `r = 1/2` | `1 + π/4` on both sides | holds, equality |
| `tendsto_measure_preimage_add_smul_symmDiff_setOf_inner_lt_inter` | unit ball at `e₁`; `{y₂ > 0}`; `dim E = 0` | limit `{y₁ < 0}`; `ν = −e₂`, half-space is `s`; reduced boundary `∅` | holds, sign right |
| `countablyRectifiable_reducedBoundary`, `variationMeasure_indicator_eq_comap_restrict_reducedBoundary` | ball radius `r`; `(0,1)∪(2,3)` in `ℝ`; `dim E = 0` | `nω_n r^{n−1}` both sides; counting measure on four points; `0 = 0` | holds |
| `euclideanHausdorffMeasure_essentialBoundary_inter_diff_reducedBoundary`, `perimeter_le_…_essentialBoundary_inter` | ball ∪ `ℚⁿ`; `⋃(1/(2k+1),1/(2k))` on `(0,1)`; `dim E = 0` | `P = nω_n = H(∂ᴹ) < H(frontier) = ∞`; `P = ∞ = H⁰(endpoints)`; `∂ᴹ = ∅` (`volume {0} = 1`) | holds |
| `integral_trace_fderiv_mul_indicator_eq_setIntegral_reducedBoundary` | ball `R`, `φ = x`; exterior with `φ = x/‖x‖ⁿ` | `nω_n Rⁿ` both sides; LHS `0` vs RHS `−nω_n` without the extension's hypotheses | holds; the hypotheses of the extension are needed |
| §6.2 Lipschitz domains | `{t > |y|}`; unit cube | `ν = (−1, sign y)/√2`, pointing outward; `P = 2n` | holds |
| `exists_trace_memBV` | `u = 1`; `1_{B_{1/2}}` in `B₁`; `Ω = ∅`; slit disc | divergence theorem, sign `−ν` as in Convention 8; trace `0`; `0 = 0`; limits `0` and `2π`, no trace | holds; sign as in the classical BV trace formula |
| `exists_windingNumber_eq_of_injOn_Ico` | counterclockwise and clockwise circle; Cantor-reparametrized circle | `σ = 1`, `−1`; index integral `1/2 ≠ ±1` | holds; AC needed |
| `perimeter_filledHull_sdiff`, `exists_ae_outerNormal_filledHull_sdiff_eq` | unit circle; square `0,1,1+i,i`; Koch curve | `−σiγ' = e^{it}` outward, `P = 2π = H¹`; `−i` on the bottom edge; `H¹ = ∞` excluded | holds |

- Source locators checked against the text: Simon 1983 Definition 11.2 (p. 60), Theorem 11.6 and Remark 11.5 (p. 61), 12.1–12.7 (pp. 67–70), §10 (pp. 53–56); Simon 2014 Chapter 3, Definition 1.4 and Theorem 1.6 (p. 71), (2.1)–(2.9) (pp. 75–77), Chapter 2 (6.1)–(6.6) (pp. 65–67); Maggi extract contents and index (pp. vii–xi, 453–454).
- Tau Ceti declarations opened at the pin: `ReducedBoundary.lean`:95, 106, 171; `Perimeter.lean`:64; `TotalVariation.lean`:100; `Dilation.lean`:75, 141; `CutByBall.lean`:228; `Volume/Polar.lean`:333; `Volume/Measure.lean`:233; `AreaFormula/Circle.lean`:49; `Sard/OutermostStratum.lean`:347; `CantorFunction.lean`:71, 235; `Winding/Number/Basic.lean`:76; `LowerDensityEstimates.lean`:281; `Coarea/Basic.lean`:445. The general Lipschitz coarea formula, the blow-up theorem, De Giorgi's and Federer's theorems and the Jordan index theorem are absent at the pin.
- Mathlib declarations opened at the pin: `NormDet.lean`:69, 228; `VectorMeasure/Variation/Defs.lean`:51; `VectorMeasure/BoundedVariation.lean`:119, 139, 386; `WithDensityVec.lean`:366; `Lp/MeasurableSpace.lean`:29, 43.
- Cross-roadmap citations resolved on main: PDE §1.1–§1.3, §1.5, §1.6; ConformalMapping §5.3, §5.5, §5.6; ContourIntegration Layer 0; DifferentialGeometry 5.6.1, 5.6.3, 12.5, 12.6; Isoperimetry I3, I6; all seven named downstream consumers exist on main and cite this roadmap.
- Automatic checks: all passed. Dependency check output: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`. All suppliers are on main. DifferentialGeometry and this roadmap cite each other, but only through pinned Tau Ceti declarations (5.6.1, 5.6.3) and DifferentialGeometry 12.5, which is used solely by the comparison in §6.2, so there is no section-level cycle.
- Elaboration: `lake env lean` on `Suggested.lean` gives 13 `sorry` warnings and nothing else. I ran `#check @` on all 14 declarations in one probe file and compared each type with its README statement; nothing needed to change. `IsApproxTangentPlane` loses `[FiniteDimensional ℝ E]`, which its body does not use.
- One-tactic probe: `simp` makes no progress on the perimeter bound, Federer's theorem or the Jordan perimeter. The other theorems are deep, and none mirrors a Check.
- Wording scan: shared 7-word runs between the README or `Suggested.lean` and the two readable texts are stock phrases only ("the reduced boundary of a set of", the book title).

Overlap check: read Varifolds, GaussianIsoperimetryAndClusters, Isoperimetry, GeometricCurrents, ConformalMapping and DifferentialGeometry on main. The shared objects and their owners:

- approximate tangent planes of rectifiable sets: this roadmap. Varifolds 2.1 owns tangent spaces of measures and cites Layer 2.
- the Euclidean Lipschitz coarea formula: this roadmap. GeometricCurrents owns coarea on rectifiable sets.
- De Giorgi's theorem and the blow-up theorem: this roadmap. GaussianIsoperimetryAndClusters cites them.
- signed area as `σ` times area: Isoperimetry I3.
- the Jordan index theorem: ConformalMapping §5.6 for continuous and piecewise-`C¹` parametrizations, this roadmap §6.4 for absolutely continuous ones.
- the divergence theorem on manifolds: DifferentialGeometry 12.5.

No object has two owners.

Source independence: 20 passages compared with 2 sources: the three Simon-attributed targets at their locators, the two Simon docstrings, Conventions 3 and 9, and the §2.4, §4.1, §5.3 and §6.4 routes, by reading and by a 7-word scan; none is shared. Largest share: Maggi2012, 9 of 14 README attributions. Contents compared with Maggi2012's public table of contents: independent. Layers 1, 3 and 6 have no Maggi chapter. Layer 2 overlaps parts of Chapters 8 and 10–11, Layer 5 overlaps Chapters 15–16. The order 2 → 4 → 5 → 6 is forced by the *Needs:* lines (§5.3 needs §2.1, §5.1 needs §4.1 and §4.3, §6.1 needs §5.3).

Research link: Layers 5–6 are De Giorgi's and Federer's structure theory of sets of finite perimeter (Maggi 2012, Chapters 15–16, per its contents). Isoperimetry and GaussianIsoperimetryAndClusters use them for sharp isoperimetry. Layer 2 is the rectifiability, area and coarea theory of Simon 1983 §§11–12, which Varifolds and GeometricCurrents consume. This rests on the README and the texts I read.

## Not verifiable

- Maggi 2012 (Cambridge University Press, DOI 10.1017/CBO9781139108133): only the author's extract on the CVGMT server is legally readable (front matter, contents, synopses, references, index), so the attributions to Maggi in §§4.1, 4.3, 5.1–5.4, 6.1 and 6.2 were not checked against the text.
- Ownership against the open revisions of GaussianIsoperimetryAndClusters, Varifolds, GeometricCurrents and ConformalMapping was not checked, because their heads were not given to this review. Their versions on main were read.

## Source issues

- none

## For the human reviewers

- Licence: Simon's 2014 notes were read from a Stanford course page (`web.stanford.edu/class/math285`), and Maggi's extract from the CVGMT server of the Scuola Normale. I classed both as institutional copies.
- Not tested: Maggi 2012 carries the largest share of attributions (9 of 14 in the README), but its text could not be read. The wording comparison was therefore not run against it, and the arrangement was compared only with its public table of contents.
- Licence: the README's References name prior formalisations (MovingSofa, a Hugging Face problem archive, hojonathanho/isoperimetric, its LeanPool copy, kim-em/isoperimetric). The declarations of `Suggested.lean` were not compared with them.
