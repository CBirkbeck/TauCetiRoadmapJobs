# Review of RealFunctionsDerivativesAndVariation (pull request #2971 at a05a8bf)

**Verdict:** needs changes

**Summary.** Changes are needed, for two reasons. The density notion of Layer 7 and Lebesgue's density theorem are already in the pinned Tau Ceti (the roadmap's definition is the library's, word for word), so they must be cited and not planned again; and one Check of Layer 2 says something false about `x ↦ -x`. Every other statement survived the computed pass: no false theorem, no missing hypothesis, the build is clean and no supplier is upward. There are five small corrections and three format notes, none blocking. No cited book could be read legally (all nine are behind paywalls), so no locator was verified; that and two licence and scope facts are left to the human reviewers.

## R01 (P2) — Density at a point and Lebesgue's density theorem are already in the pinned Tau Ceti, and the roadmap plans them again

An implementer following §7.1 would build a second copy of an existing definition and re-prove an existing theorem, and every later statement of Layer 7 would then live on a carrier that the library's density lemmas do not apply to.

`TauCeti/MeasureTheory/Covering/EssentialBoundary.lean`, line 81, defines `TauCeti.HasDensityAt μ s x d` as the convergence of `μ (s ∩ closedBall x r) / μ (closedBall x r)` to `d` along `𝓝[>] 0`. The body of `HasDensityZeroAt s x` in `Suggested.lean` (line 356) is that expression with `μ = volume` and `d = 0`: in a scratch file importing both, `HasDensityZeroAt s x ↔ TauCeti.HasDensityAt volume s x 0` closes by `Iff.rfl`, and `IsDensityPoint s x ↔ x ∈ TauCeti.essentialExterior volume sᶜ` by `TauCeti.mem_essentialExterior.symm`. Line 402 of the same file is Lebesgue's density theorem, `TauCeti.ae_hasDensityAt_indicator`, for null-measurable sets; applied to `sᶜ` it gives `ae_isDensityPoint` in two lines (`filter_upwards` and one `simpa`), which I ran. The library file realises the item "Define measure-theoretic density, essential interior/exterior … Prove the Lebesgue density facts" of GeometricMeasureTheory on main (its README, line 256), so that roadmap is the owner. The README names four Tau Ceti files under *From Tau Ceti*; this one is not among them, and the description's supplier list omits it too.

The smallest change: state `HasDensityZeroAt` and `IsDensityPoint` through `TauCeti.HasDensityAt volume` (as abbreviations, or use the library's predicate directly, importing `TauCeti.MeasureTheory.Covering.EssentialBoundary`, whose compiled module is present at the pin); drop `ae_isDensityPoint` as a target and cite `TauCeti.ae_hasDensityAt_indicator`; add the file to *From Tau Ceti* and the ownership sentence to *Scope and ownership*; and replace the first sentence of the proof route of §7.1 by that citation. Approximate continuity, the Lusin–Menchoff theorem, Zahorski's lemma and the density topology are not in the library and stay.

## R02 (P2) — The Check "`x ↦ -x` violates every hypothesis" is false

A reader uses this Check to see which hypotheses the three monotonicity theorems cannot do without, and it tells them the wrong thing for two of the three.

For `f x = -x` all four Dini derivatives equal `-1` at every point. So in §2.3 the hypothesis `D⁺f > -∞` off a countable set holds everywhere, and in the Goldowski–Tonelli theorem the hypothesis that a derivative in `EReal` exists off a countable set holds everywhere; continuity and order-connectedness hold as well. The only hypothesis that fails is the sign condition (`D⁺f ≥ 0` off a countable set in §2.2, almost everywhere in §2.3). The sentence is in the Checks of Layer 2, line 246.

The smallest change: "`x ↦ -x` has `D⁺ = -1` everywhere, so it violates the sign hypothesis of each of the three theorems, and it is not monotone".

## C01 — The proof route of §3.1 calls the easy implication "the forward direction", and its use of the estimate does not work on a set of infinite measure

The statement reads "`λ(f(A)) = 0` iff `f' = 0` almost everywhere on `A`", so its forward direction is "null image implies `f' = 0` a.e.". The route (line 272) gives under that name the argument for the other implication, and assigns Benedetto–Czaja's proof to "the converse". Also "apply the estimate with `K = ε` on `{f' = 0}`" gives `ε · ∞` when that set has infinite outer measure; `K = 0` gives the conclusion at once (the Lean statement has `0 * ⊤ = 0`), and so does Mathlib's `MeasureTheory.addHaar_image_eq_zero_of_det_fderivWithin_eq_zero`, which the supplier contracts already list. Swap the two labels and write `K = 0`.

## C02 — "Layers 2 and 3 use only Layer 1" contradicts the *Needs* line of §2.3

*How to read the build* (line 54) says Layers 2 and 3 use only Layer 1 and Mathlib, while §2.3 has "*Needs:* §2.2; §3.1" and the Dependencies of Layer 2 say "§3.1 for §2.3". So Layer 2 uses a section of the later Layer 3. There is no cycle, since §3.1 needs nothing from the roadmap. Say in the guide that §2.3 uses the image estimates of §3.1 (or, if preferred, place §3.1 before it).

## C03 — Two of the three numerical values in the Check on `x sin(1/x)` are off in the second digit

The Check of Layer 4 (line 417) gives `≈ 3.0, 4.6, 5.9` for `δ = 10⁻², 10⁻³, 10⁻⁴`. Summing `|f(c_{i+1}) − f(c_i)|` over the critical points `1/u`, `tan u = u`, in `[δ, 1]` gives `3.03, 4.50, 5.97` for the variation (equal to `∫ |f'|` there), against `2.93, 4.40, 5.86` for `(2/π) log(1/δ)`. The values should read `≈ 3.0, 4.5, 6.0`.

## C04 — The route to Denjoy's criterion uses Lusin's theorem and names no supplier for it

§7.1 proves the forward direction "from Lusin's theorem" (line 579), and its *Needs* line lists only §5.1. Mathlib has no Lusin theorem; the pinned Tau Ceti has it, as `AEMeasurable.exists_isClosed_measure_sdiff_lt_continuousOn` in `TauCeti/MeasureTheory/Function/Lusin.lean` (line 138). Name it in the *Needs* line and under *From Tau Ceti*.

## C05 — For measurable `A` the image estimate of §3.1 already follows from a pinned Mathlib theorem that the README does not cite

`MeasureTheory.addHaar_image_le_lintegral_abs_det_fderiv` (`Mathlib/MeasureTheory/Function/Jacobian.lean`, line 898) gives `μ (f '' s) ≤ ∫⁻ x in s, |det (f' x)|` for measurable `s` with a derivative within `s` at each of its points, hence `λ(f(A)) ≤ K λ(A)` for measurable `A`. The target here is the extension to arbitrary `A` and to outer measure. Say so in §3.1 and list the theorem under *From Mathlib*, so that an implementer starts from it.

## N01 — Pull-request numbers and statements about the state of a build are in the README

"The open Mathlib pull request #41552" (lines 761 and 823), "(an open pull request)" (line 723), "is in Tau Ceti after the pin" (line 728) and "the shared build of the pin does not contain their compiled modules" (line 785) will be out of date soon. Describe the Mathlib file and the Young-integration roadmap by name, and drop the sentence about compiled modules.

## N02 — One declaration of `Suggested.lean` is placed in the root namespace

`_root_.Differentiable.isBaireOne_deriv` (line 294) is declared outside the roadmap's namespace, unlike `LipschitzOnWith.hasLusinN` and every other declaration, so it can collide with a later library or roadmap name. Declaring it inside the namespace, as the Lipschitz statement is, would be consistent.

## N03 — The failure of normality in §7.3 has a proof route and no locator

Every other headline of §7.3 carries a locator; a reference for non-normality of the density topology would complete the list.

## Questions for the author

- In the proof route of §2.3 (line 225), is it Bruckner's claim that a continuous `f` has property (N) on the whole set where `D⁺f` is finite and `≤ 0`? With only the upper right derivate finite I could prove a null image only for the set of "last points at a level" that the argument actually uses: there `f + εt` agrees with the monotone function `t ↦ sup` of `f + εt` over `[t, x₂]`, and a monotone function maps a null set on which one derivate is finite to a null set. I could not read Bruckner, p. 189, to see which statement is made there.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Dini definitions, `hasDerivAt_iff_dini` | `|x|`, `x sin(1/x)`, `√|x|` at 0 | right slopes `1`, left `-1`; slope `sin(1/y)`, limsup `1`, liminf `-1`; `y^(-1/2)=10` at `10⁻²`, limit `⊤` | true | none |
| 1.2 `dini_bounds` | `x³` on `[-1,1]`; converse via `z = sup{g ≤ g x}` | slope `x²+xy+y²`: sup `3` on diagonal, not attained, inf `0`; `3x²` sup `3` at `-1`; `D₊f(z) ≥ M`, `z < y ≤ b` | true | none |
| 1.2 measurability | `AEMeasurable f` for volume | equals Lebesgue measurability; Banach's theorem; continuous case countable limsup | true | none |
| 1.3 Young | `-|x|` at 0; reflection `t ↦ -f(-t)` | `D⁺=-1 < 1=D₋`; `D⁺g(t)=D⁻f(-t)`, `D₋g(t)=D₊f(-t)` | true | none |
| 2.1 `risingSun` | `sin` on `[0,2π]`; `a ≥ b`; `d = b` | `E=(0,π/2)∪(π,2π)`; `0<1` on first, `0=0` on second; `E=∅` vacuous | true | none |
| 2.2 countable exceptions | route at level `y₀ ∉ g(s)`; Mathlib comparison lemma | last point `z ∈ (x₁,x₂)`, `D⁺g(z) ≤ 0 < ε`; lemma is liminf form for `-f` | true | none |
| 2.3 a.e. criterion, Goldowski–Tonelli | `-C`; `-x`; my proof via monotone majorant | `-C`: each theorem's countable hypothesis fails on an uncountable set; `-x`: `D⁺=-1`, only sign fails | theorems true; Check false | R02 |
| 3.1 image estimate, null images | `x²`, `K=2`; `K=0`, `λ(A)=∞`; Cantor function | `1 ≤ 2`; `0·⊤=0`, image null; `C(A)` = dyadic rationals, countable | true | C01, C05 |
| 3.2 Denjoy–Young–Saks | `|x|` at 0; monotone `f`; corollary | no alternative holds at 0 (null set); alternatives 2–4 each have a lower derivate `-∞`; lower `≠ ⊤`, upper `≠ ⊥` in all four | true | none |
| 4.1 Helly | `sin(nx)` on `[0,π]` | variation `2n`; `∫(sin nx − sin mx)² = π` | true | none |
| 4.2 inequality, Tonelli, Fubini | `a > b`, `a = b`; step function; `x sin(1/x)` | `0 ≤ 0`; variation `1 ≠ 0`; variation `3.03, 4.50, 5.97` vs README `3.0, 4.6, 5.9` | true | C03 |
| 4.3 property (N), Banach–Zarecki, images | Cantor function; `(x + C)/2` | `C(cantorSet)=[0,1]`; image of Cantor set has measure `1/2` | true | none |
| 4.4 singular, Weil | `∑ 2⁻ⁿ C(x − qₙ)`; `sin` indicatrix | `C=0` on `x ≤ 0` (library), positive after; variation `4 = 2·2` | true | none |
| 5.1 `IsBaireOne`, derivatives | indicator of `{0}`, of `ℚ` | tents `max 0 (1 − n|x|)`; continuous nowhere, excluded by Baire | true | none |
| 5.2 Lebesgue–Hausdorff, Baire | empty `X`; closed `F` nonempty | both sides vacuous; `ContinuousWithinAt f F x` is the restriction | true | none |
| 5.3 continuity sets | `x² sin(1/x)`; `A = [a,b]` | `ℝ∖{0}` dense `G_δ`; `F = x` | true | none |
| 6 Banach–Mazurkiewicz | polynomials; Weierstrass; `x < b` | meagre set dense; Mathlib bounds `|slope|` from below by `c(ab)^m` along points to the right | true | none |
| 7.1 density, approximate continuity | sparse set; `(0,∞)`; indicator of `ℚ`; library | ratios `2.6e-2, 4.07e-3, 6.36e-4, 2.48e-5`; density `1/2`; definition `Iff.rfl` to `TauCeti.HasDensityAt` | true; duplicated | R01, C04 |
| 7.2 Lusin–Menchoff, Zahorski | `X=∅`; `X={0}`, `E=ℝ`; `E=∅`; `E=ℝ` | `P=∅` perfect; `P=[-1,1]`; `f=0`; `f=1` | true | none |
| 7.3 density topology | unions, intersections; null sets; non-normality route | subadditivity for `Uᶜ∪Vᶜ`; complement of null set density-open; `3/4 + 1 > 1` at rational `q` | true | N03 |

- Source locators checked against the text: 0 of about 85; all nine books are paywalled.
- Library declarations opened at the pin: 14 (among them `TauCeti/MeasureTheory/Covering/EssentialBoundary.lean` 81 and 402; `TauCeti/MeasureTheory/Function/Lusin.lean` 138; `TauCeti/Analysis/SpecialFunctions/CantorFunction.lean` 162–245; `TauCeti/MeasureTheory/Function/MetricDerivative/Variation.lean` 141; `TauCeti/MeasureTheory/Function/AreaFormula/Curve.lean` 115; `TauCeti/Topology/EMetricSpace/BoundedVariation.lean` 49; `Mathlib/MeasureTheory/Function/Jacobian.lean` 556, 645, 898; `Mathlib/MeasureTheory/Covering/Besicovitch.lean` 1104; `Mathlib/MeasureTheory/Function/AbsolutelyContinuous.lean` 155; `Mathlib/Topology/Separation/CompletelyRegular.lean` 69; `Mathlib/Analysis/Calculus/MeanValue.lean` comparison lemma; `Counterexamples/NowhereDifferentiable.lean` 235).
- Cross-roadmap citations resolved: 4 (GeometricMeasureTheory G1 and G3, PDE §1.1, Poincare3D §11.1), all on main; the Young-integration roadmap's `r`-variation at its open head.
- Dependency check: `depcheck: 154 roadmaps, 1768 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: `sorry` the only warning; 51 `sorry` declarations, no `sorry` in a definition, no `set_option`.
- One-tactic probe on a scratch copy (`rfl`, `simp`, `infer_instance`, `simp` with the definitions unfolded): none of the 51 statements closes. The ten statements that mirror Checks are already marked as sanity checks.
- Elaborated signatures compared with the README for all declarations: same hypotheses and generality; no section binder lost. Nothing in `Suggested.lean` was changed.
- Mathlib and Tau Ceti searched by object for Dini derivatives, Helly selection, property (N), Baire class one, approximate continuity, density topology: none found, apart from the density notion of R01.

Overlap check: read GeometricMeasureTheory (main and its open revision), Isoperimetry, YoungIntegrationAndRoughPaths, ProjectionsSlicesAndKakeya, GaussianIsoperimetryAndClusters; density of a set at a point and Lebesgue's density theorem are shared with GeometricMeasureTheory, which owns them (realised in the pinned Tau Ceti; R01); the `r`-variation for `r ≠ 1` is owned by YoungIntegrationAndRoughPaths and not stated here; nothing else shared.

Source independence: 0 passages compared with 0 sources, because none of the nine cited books could be read legally; largest share Bruckner, about 33 of 85 locators; its table of contents could not be read. By the README's own locators, Layers 1, 2, 5 and 7 draw on its Chapters IV, XI, III and II in that order, which is not a run of chapters in the source's order.

Research link: Layers 1–4 and 7 are the prerequisites of the descriptive theory of the Denjoy, Perron and Henstock–Kurzweil integrals, and Layers 5 and 7 of the Zahorski classes of derivatives (Bruckner, 1978, Chapter VI); Poincare3D §11.1 uses the upper right Dini derivative. This rests on the README (*Downstream consumers*, *Beyond this roadmap*) only.

## Not verifiable

- Every locator into Bruckner, Thomson, Hewitt–Stromberg, Benedetto–Czaja, Kechris, Bourbaki and Kharazishvili: the publisher pages are paywalled and the texts are not held locally; this includes all fifteen sampled targets.
- Every locator into Leoni and Stein–Shakarchi: no legal copy found by the sources service.
- The description of the open Mathlib pull request on monotonicity with countable exceptions (*Exact supplier contracts*): not opened.
- The attribution of the Goldowski–Tonelli proof to Saks (Thomson, §56) and the property (N) step of §2.3 (Bruckner, p. 189): see the question above.

Automatic checks set aside as false positives: the report of a section comment with no declaration under it, for the closing block of `Suggested.lean`, which holds only `#check` lines pinning library declarations, as is allowed.

## Source issues

- none

## For the human reviewers

- **Not tested.** Bruckner, *Differentiation of Real Functions* (1978), has the largest share of the locators (about 33 of 85). Neither its text nor its table of contents could be read, so wording and arrangement were not compared with it or with any other source.
- **Licence.** The README (*Prior formalization*) says §§1.1, 2.1, 3.2, 5.1 and 7.1 start from the author's Lean project CKMA (github.com/bjbraams/lean-CKMA, Apache 2.0 by its own statement). I did not compare `Suggested.lean` with its files.
- **Scope.** The sources are textbooks and monographs of 1975–2017 on classical real analysis; the only consumer the README names for most layers is a roadmap on nonabsolute integration that does not exist on main or among the open pull requests I searched.
