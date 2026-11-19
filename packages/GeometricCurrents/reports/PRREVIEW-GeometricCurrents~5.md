# Review of GeometricCurrents (pull request #2490 at 6ca5f0e)

**Verdict:** accepted

**Summary.** Accepted: no finding. The four small corrections of the previous review are repaired and the repairs are correct: the Bombieri–De Giorgi–Giusti theorem is now stated for every m ≥ 4 in the README and in `Suggested.lean`, with the general divergence formula, and is cited to Bombieri–De Giorgi–Giusti (Theorem A) and De Philippis–Paolini (Proposition 2.1), both of which say what the README attributes to them at the locators given. The pull request's title and description agree with this head. There are two format notes, none blocking, and nothing is left for a human to decide.

## N01 — Backticked names of this roadmap that `Suggested.lean` does not declare

Carried from the previous review. Names in code font such as `locallyMinimizingIntegralHypersurface_regular` (README line 984), `integralCurrentHomologySingularIso` (449) and `strongSolution_interiorSchauderUpgrade` (905) are declared nowhere, and the Lean docstring says their theorems are not statable at the pins, so a reader cannot tell them from the declared `perimeter_simonsRegion_le`. A word such as "a theorem we call …" at each would do.

## N02 — One library pull request is still cited by number in the native-floor paragraph

Line 143 keeps the link "Mathlib's area-formula design #39120" beside the three pointers that now name pinned declarations. A reader a year on cannot tell from a pull-request number what shape is meant; a clause naming the statement (or the Mathlib declaration, once there is one) would read better.

## Previous findings

The previous review had no finding; its small corrections and format note are accounted for here.

- C01 — repaired: G7 cites "Bombieri–De Giorgi–Giusti 1969, Theorem A, p. 244" and "De Philippis–Paolini 2009, Proposition 2.1, pp. 239–240"; both are in the References with page ranges. Locators verified.
- C02 — repaired: "In Rᵐ×Rᵐ with m≥4 …"; `simonsRegion (m : ℕ)` and `perimeter_simonsRegion_le {m : ℕ} (hm : 4 ≤ m)` on `EuclideanSpace ℝ (Fin (m + m))`; m = 4 kept for the integral-current sharpness.
- C03 — repaired: "PositiveMass §3.1 … §3.2 … §3.3" and "ComplexComparisonPartII C5.4" at lines 187, 1097–1101 and 1129–1130; all four resolve on main.
- C04 — repaired: the paragraph cites `MeasureTheory.Measure.euclideanHausdorffMeasure`, `TauCeti.CountablyRectifiable` and `LipschitzWith.lintegral_normDet_fderiv_mul_eq_lintegral_tsum`, each with its file; all three exist at the pins as described.
- N01 — not repaired: the undeclared backticked names stand (N01 above).

## Verified sound

| Statement | Instances tried | Values computed (README side / check side) | Result | Change |
|---|---|---|---|---|
| `simonsRegion m` (Lean, line 50) | m = 0; m = 1; m = 4 index maps | m=0: empty sums, 0<0 false, set ∅ (`simp` proves it); m=4: `castAdd` ↦ 2, `natAdd` ↦ 6 (`decide`); m=1: `{y²<x²}`, boundary two lines | x = first m coordinates, as docstring says | none |
| `perimeter_simonsRegion_le` against G7 (1072–1077) | elaborated type; `simp`, `rfl`, `le_rfl`, unfolding `perimeter`, `infer_instance`, `aesop` | type has `4 ≤ m`, Ω open, F null-measurable, K compact, K ⊆ Ω, F∆E ⊆ K, as README; none of six tactics closes it | same generality; not padding | none |
| Same, against BDG Theorem A | source at BombieriDeGiorgiGiusti1969 lines 93–110 | source: m ≥ 4, set `{Σx² ≥ Σy²}` in ℝ²ᵐ, variation over compact K ⊇ supp g; differs from E by the null cone; Ω∖K contributes equally to both sides | supports the statement | none |
| Field Y and its source (1058–1061) | DePhilippisPaolini2009 lines 187–216 | source: f=(\|x\|⁴−\|y\|⁴)/4, ξ=Df/\|Df\|=(a x,−b y)/√(a³+b³); README Y=−ξ; E={f>0}, outward normal −Df/\|Df\|=Y | "negative of the unit field" correct | none |
| `div Y` for general m (1062–1064) | source lines 229–243; m = 1, 2, 3, 4 at a=b | \|Df\|³ div ξ=(a²−b²)[(m−1)(a²+b²)−(m+2)ab]; bracket at a=b=1: −3, −2, −1, 0; m=4: 3(a−b)²; discriminant 3m(4−m) ≤ 0 iff m ≥ 4 | formula and "exactly when m≥4" true | none |
| Cutoff error `O(ε^(2m−1))` (1070) | m = 4 | \|∇η_ε\| ≲ 1/ε on a ball of volume ≍ ε²ᵐ: ε²ᵐ⁻¹; m=4 gives the former ε⁷ | true | none |
| Area formula pointer (148–152) | pinned statement | `∫⁻ x in s, ofReal (fderiv ℝ f x).normDet * g x = ∫⁻ y, ∑' …, g x ∂μHE[finrank ℝ U]`, f Lipschitz, U, V finite-dimensional inner product, no rank hypothesis | as README says | none |
| Rectifiability pointer (146–147) | pinned file | `TauCeti.CountablyRectifiable` line 44; closure lemmas `mono`, `union`, `iUnion`, `image`, `isometry_image_iff` | present | none |
| Downstream pointers (187, 1097–1101, 1129–1130) | main | PositiveMass §3.1 torus obstruction, §3.2 negative mass to compact contradiction, §3.3 AE minimizing hypersurfaces; ComplexComparisonPartII C5.4 consumes G1 (its line 156) | resolve | none |

The rows for untouched statements stand as in the previous review, of `e520d07`. The seeded sample (Lipschitz chains, volume and mass, filling volume) lies in G3a, which this change does not touch; its rows stand likewise.

- Source locators checked against the text: 5 (BombieriDeGiorgiGiusti1969 lines 75, 93–110: Theorem A on printed p. 244; DePhilippisPaolini2009 lines 187–190 and 203–207: (10) on p. 238, (11) on p. 239; lines 208–246: Proposition 2.1, pp. 239–240; journal data of both), all as the README says.
- Library declarations opened at the pins: 10 (`MeasureTheory.Measure.euclideanHausdorffMeasure`, Measure.lean line 68; `TauCeti.CountablyRectifiable`, Rectifiable/Basic.lean line 44; `LipschitzWith.lintegral_normDet_fderiv_mul_eq_lintegral_tsum`, AreaFormula/Multiplicity.lean line 203; the two constancy theorems, `extDerivCLM`, `massMeasure`, `localMass`, `Distribution.mass_apply_finZero`, `AlternatingMap.map_linearDependent`).
- Cross-roadmap citations resolved on main: PositiveMass §3.1, §3.2, §3.3; ComplexComparisonPartII C5.4.
- Dependency check: `depcheck: 200 roadmaps, 2190 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Automatic checks rerun on this head: all pass; the pull request changes only `README.md` and `Suggested.lean` of this folder.
- Elaboration: `lake env lean` on `Suggested.lean` prints only the `sorry` warning at line 58. `#check @simonsRegion` and `#check @perimeter_simonsRegion_le` on a probe copy give the types compared above; the file has no `variable`, so no binder is lost.
- Pull request text: title and description read against this head. The description states that the roadmap on main is revised, the new item G3a, the 25 declarations removed and the two added (with `4 ≤ m`), the dropped supplier rows, the two new references and the three library pointers replaced; no sentence contradicts the head.
- Ownership and overlaps: no open pull request changes this roadmap, drops an id it cites, or cites an id it drops; the change adds no new object beyond the generalisation of `simonsRegion`, declared in no other roadmap.

Overlap check: read Varifolds, CalibratedGeometry, GeometricMeasureTheory (main) and MinimalSurfaces (open) as in the previous review; the change adds no object, and nothing is shared: Varifolds owns varifolds, GeometricMeasureTheory rectifiability and Gauss–Green, CalibratedGeometry comass, GeometricCurrents the Simons-region minimality.

Source independence: changed passages only; 4 passages compared with 2 sources (G7's field and divergence sentence, G7's theorem sentence, the two References entries, the Lean docstring against BombieriDeGiorgiGiusti1969 lines 93–114 and DePhilippisPaolini2009 lines 187–246), none shared beyond formulas; no layer added, removed or reordered, so the arrangement stands as compared before (largest share LeuzingerYoung2017: independent).

Research link: G3a's filling volume functions are those in which Leuzinger–Young (2017) state their bounds for arithmetic groups; G3's comparison is Riedweg–Schäppi's (2009) for Lipschitz chains; G7 states Bombieri–De Giorgi–Giusti's (1969) minimality of the Simons cones; G6–G7 feed nonspin positive mass (PositiveMass Layer 3). Rests on the sources read and the README.

## Not verifiable

- Federer, Simon, Mitsuishi, Wickramasekera and Hutchings: listed in References without claim-level locators in the changed passages; not opened.
- Whether the Mathlib pull request named at line 143 is contained in the pinned Mathlib was not determined.

## Source issues

- none

## For the human reviewers

- none
