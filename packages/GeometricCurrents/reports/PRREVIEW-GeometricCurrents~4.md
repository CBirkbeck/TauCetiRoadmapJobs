# Review of GeometricCurrents (pull request #2490 at e520d07)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of G3a (Lipschitz chains, volume and mass, filling volume) and each of its Checks was recomputed and holds, its three sources say what the README attributes to them at the locators given, and the Lean statement of the Bombieri–De Giorgi–Giusti theorem elaborates, agrees with G7 and is not closed by one tactic. There are four small corrections (the theorem has no source; G7's own vector field proves it for ℝᵐ × ℝᵐ with every m ≥ 4; two downstream pointers use labels their roadmaps do not have; two design pointers are overtaken by the pins) and one format note, none blocking. Nothing is left for a human to decide.

## C01 — The Bombieri–De Giorgi–Giusti theorem, the one headline stated in `Suggested.lean`, is cited to no source

A reader who wants to check the statement or the subcalibration route has nowhere to look: the sentence of G7 that names the theorem (lines 1066–1071) has no locator, and the References (from line 1167) list no text that proves it. The head is the one the previous review read, so this remark stands unchanged. Would you cite E. Bombieri, E. De Giorgi and E. Giusti, *Minimal cones and the Bernstein problem*, Invent. Math. 7 (1969), at its theorem on the cones `{|x| = |y|}`, and, if the field `Y=(−a x,b y)/sqrt(a³+b³)` is taken from a later short proof, that proof as well, each with the locator you read?

## C02 — G7's vector field proves the minimality of `{|x|² > |y|²}` in ℝᵐ × ℝᵐ for every m ≥ 4, but the theorem is stated for m = 4 only

An implementer who follows G7 proves the general statement and is then asked to record its first case. With x, y ∈ ℝᵐ, a=|x|², b=|y|² and the same Y, the computation of line 1059 gives

`div Y = −(a−b)(a+b)[(m−1)(a²+b²) − (m+2)ab] / (a³+b³)^(3/2)`,

which for m = 4 is the README's `−3(a+b)(a−b)³/(a³+b³)^(3/2)`. The bracket is nonnegative for all a, b exactly when `m+2 ≤ 2(m−1)`, that is m ≥ 4, so div Y has the sign of b−a and the Gauss–Green argument of lines 1062–1066 runs unchanged (the cutoff error becomes `O(ε^(2m−1))`). For m = 3 the bracket is `2(a²+b²)−5ab = −a²` at a=b, so the field fails, as it must. Would you state `perimeter_simonsRegion_le` on `EuclideanSpace ℝ (Fin (m + m))` with `4 ≤ m`, keeping ℝ⁴ × ℝ⁴ as the sharpness case of the regularity headline? If m = 4 is deliberate, a clause in G7 saying so would do.

## C03 — Two downstream pointers use labels that the roadmaps they point to do not have

"PositiveMass P3a … P3b … P3c" (lines 1091–1097) cannot be followed: PositiveMass on main has no item with those labels. Its Layer 3 has §3.1 "Compact torus obstruction and boundary Gauss–Bonnet", §3.2 "Negative mass to a compact contradiction" (the Kelvin transform and capping) and §3.3 "AE minimizing hypersurfaces and the three-dimensional route" (the coordinate-plane Plateau problems and the logarithmic cutoff), which are the three items described. Write PositiveMass §3.1, §3.2 and §3.3.

"C5.4" (lines 185 and 1123–1124) names no roadmap, and in this README the letter C otherwise means CalibratedGeometry (C1–C4, C6), whose §5.4 is "Gradient graphs". The real/complex current comparison is ComplexComparisonPartII C5.4 (its supplier table on main, line 156, consumes G1). Write the roadmap's name at both places.

## C04 — Two design pointers in "Native floor and design direction" describe as proposals what the pins now contain

Lines 143–147 tell an implementer to follow the "normalized-measure design" and to use the "countable-rectifiability design" of two library pull requests. Both are in the pinned libraries: the normalized measure is Mathlib's `MeasureTheory.Measure.euclideanHausdorffMeasure` (`Mathlib/Geometry/Euclidean/Volume/Measure.lean`, line 68), which the Conventions already cite at line 65, and Tau Ceti has `CountablyRectifiable` (`TauCeti/Geometry/MeasureTheory/Rectifiable/Basic.lean`, line 44), as the docstring of `Suggested.lean` itself says. Cite the two declarations in place of the two pull requests. I did not check the other two pointers of the paragraph against the pins.

## N01 — Backticked names of this roadmap that `Suggested.lean` does not declare

Eight names in code font, for example `locallyMinimizingIntegralHypersurface_regular` (line 982), `integralCurrentHomologySingularIso` (447) and `strongSolution_interiorSchauderUpgrade` (903), are declared nowhere, and the Lean docstring says their theorems are not statable at the pins. A reader cannot tell them from the declared `perimeter_simonsRegion_le`. A word such as "a theorem we call …" at each would do.

## Previous findings

- The previous review, of this same head, accepted with no finding. Its small correction (the Bombieri–De Giorgi–Giusti theorem cited to no source) is not repaired, since the head has not changed: C01 above.
- Its question (is m = 4 deliberate?) is settled here by computation and is now C02.

## Verified sound

| Statement | Instances tried | Values computed (README side / check side) | Result | Change |
|---|---|---|---|---|
| Lipschitz chains (G3a, 550–566) | extended metric Y; faces; RS Def. 2.4, LY p. 15 | Lipschitz image of connected Δᵈ has finite distances; `∂σ=⟨σ(e₁)⟩−⟨σ(e₀)⟩` for d=1; sources: integer sums of Lipschitz simplices | agrees | none |
| Subdivision route for `vol(f∘σ) ≤ Lᵈ vol(σ)` (577–589) | preimage on a shared face; d=0; L=0 | count of B with y∈σ(B) is 2 for one preimage on a face, hence "off the faces"; d=0: 0ⁿ; L=0, d≥1: ∞·Hᵈ(pt)=0 ≤ 0 | holds as stated | none |
| Diameter bound `(d/(d+1))ⁿ` (583–584) | pinned lemma | Tau Ceti states `dist … ≤ (k/(k+1))^n` on weight vectors, sup metric | matches | none |
| Volume and mass (568–593) | n=0 scaling; coinciding composites | `mass(0·α)=0=0·mass(α)`; `f∘σ₁=f∘σ₂` merges coefficients, `|c₁+c₂| ≤ |c₁|+|c₂|` | holds | none |
| Check: normalization (630–632) | Δ² ⊂ ℝ³ | side √2, area (√3/4)·2 = √3/2; raw measure (4/π)(√3/2)=2√3/π | true | none |
| Check: multiplicity (633–635) | double loop | length 4π; image H¹ = 2π; σ(0)=σ(1) | true | none |
| Check: mass not a norm (636–641) | constant 1-simplex; σ−σ∘ρ | ∞·H¹(pt)=0; mass ℓ+ℓ; constant 2-simplex has boundary c−c+c=c, fills prism edges; images in a segment, H²=0 | true | none |
| Check: `FV_1(⟨y₁⟩−⟨y₀⟩)=\|y₁−y₀\|` (642–649) | functional 1_{p>t} on ∂β | 1_{y₁>t}−1_{y₀>t}=1 for y₀<t<y₁; integrate: ≥ \|y₁−y₀\| | true | none |
| Filling volume, `FV_d(f_#α) ≤ Lᵈ FV_d(α)`, L>0 (617–620) | α not bounding; L=0, d=1; L=0, d≥2 | Lᵈ·∞=∞; d=1: ∞ vs 0·∞=0 fails; d≥2: constant cycles bound at mass 0, 0 ≤ 0 | hypothesis exact | none |
| Checks: degree one and S¹ (650–660) | V<1; V≥1; V≥2π | 0-chain mass is an integer, so only 0; ⟨y⟩ has sum 1; loop generates H₁(S¹) | true; LY require (d−1)-connected (line 754) | none |
| `perimeter_simonsRegion_le` against G7 (1055–1071) | index maps; 0; `simp`, `rfl`, `perimeter_mono` | `castAdd` ↦ 0..3, `natAdd` ↦ 4..7 (`decide`); 0 ∉ E; none closes it | same generality as README; not padding | none |
| G7 field Y (1056–1059) | \|Y\|², div Y, general m | (a³+b³)/(a³+b³)=1; −3(a+b)(a−b)³/D³ for m=4; bracket (m−1)(a²+b²)−(m+2)ab ≥ 0 iff m ≥ 4 | README formula correct; general m | C02 |
| Same, Ω unbounded | Ω = ℝ⁸ | P(E;Ω)=∞ and P(F;Ω) ≥ P(E;Ω∖K)=∞ | ∞ ≤ ∞ | none |
| Regularity headline (982–986) | n=2; n=8 | geodesic segments; Simons cone excluded by n ≤ 7 | consistent with G7 | none |
| Leibniz and slicing signs (229–231, 398–403, 741) | ∂(fT)(ω); ∂⟨T,u,t⟩ | T(f dω)=∂T(fω)−T(df∧ω); ∂⟨T⟩=−∂((∂T)⌞{u<t})=−⟨∂T⟩ | consistent in G1, G2, G5 | none |
| Product and homotopy (62–63, 308–309, 379) | k=1 interval factor | −[0,1]×∂T from (−1)¹; mass ≤ \|b−a\|M(T); boundary ≤ 2M(T)+\|b−a\|M(∂T) | consistent | none |
| Stability inequality (860–864, 876) | Gauss equation, minimal | \|A\|²+Ric(ν,ν) = ½(Scal_N−Scal_Σ+\|A\|²); ×2 gives line 864; surface coefficient ½ | true | none |
| ABP and difference quotient (915, 944, 965) | signs; product rule | C/λ from det a ≥ λᵐ; a:D²(ηu) expands to g_η; δ_h(a D²u) formula | true | none |
| Bivector `e₀∧e₁+e₂∧e₃` (1163–1164) | Kähler form | pairing 2 with a comass-1 form, sum of two simple unit vectors; Hilbert norm √2 | true | none |
| Tau Ceti's form norm is the comass (138–140) | Hadamard | \|ω(v₁..v_k)\| ≤ comass·Π‖vᵢ‖ in an inner-product space | true | none |
| PositiveMass and C5.4 pointers | main | no P3a–c in PositiveMass; §§3.1–3.3; ComplexComparisonPartII C5.4 | labels stale | C03 |
| Design pointers (143–147) | the pins | `euclideanHausdorffMeasure` Measure.lean:68; `CountablyRectifiable` Rectifiable/Basic.lean:44 | present at pins | C04 |

- Source locators checked against the text: 6 (LeuzingerYoung2017 lines 705–709, 712–758; RiedwegSchaeppi2009 lines 191–223; AmbrosioKirchheim2000 lines 1828–1862), all as the README says.
- Library declarations opened at the pins: 26 (Tau Ceti: the test-form derivative, mass, local mass, mass measure and its five lemmas, the three constancy theorems, the criterion with its two companions, `AffineChain.subdivision` and its diameter lemma, `riemannianVolume`, `perimeter`, `hasWeakFDerivOn_of_differentiableOn`, `CountablyRectifiable`; Mathlib: `euclideanHausdorffMeasure`, `LipschitzWith.hausdorffMeasure_image_le`, `LipschitzWith.ae_differentiableAt`, `LinearMap.normDet`, `singularChainComplexFunctor`).
- Cross-roadmap citations resolved on main: ComplexKahlerGeometry §5.1, PDE §§1.7, 2.1–2.3, 3.1–3.2, 4.1–4.4, 5.6, 5.7, RiemannianGeometry R5a.1, R5a.2, R5b, CalibratedGeometry Layers 1–4 and 6, AlgebraicTopology §2.6 and Layer 3, DifferentialGeometry 8.3, GeometricTopology Layers 1 and 11.3, MorseTheory Layer 3, TopologicalKTheory T1.5, DGFloer Layer 0, HopfRinow Layer 0, Yamabe Y7.
- Dependency check: `depcheck: 200 roadmaps, 2187 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Automatic checks rerun on this head: all pass; the pull request changes only `README.md` and `Suggested.lean` of this folder.
- Elaboration: `lake env lean` on `Suggested.lean` prints only the `sorry` warning at line 56. The file has no `variable`; the elaborated type of `perimeter_simonsRegion_le` carries all four hypotheses of README lines 1067–1070.
- Pull request text: read against the head; the removal of 25 declarations, the new item G3a, the two dropped suppliers and the stated headline are all described; no sentence contradicts the head. None of the removed names is cited by another roadmap, on main or at an open head.
- Ownership: searched main and every open head for filling volume, Lipschitz chains, the Simons cone and integral currents by object: no other owner.

Overlap check: read Varifolds, CalibratedGeometry and GeometricMeasureTheory (main) and MinimalSurfaces (open); searched HeegaardFloer, PDE, SobolevDifferentialForms and ComplexKahlerGeometry. Varifolds owns varifolds and cites GeometricCurrents G1, G2, G5, G6; GeometricMeasureTheory owns rectifiability, perimeter structure and Gauss–Green; CalibratedGeometry owns comass and the integral smooth chains; MinimalSurfaces consumes G6. Nothing is owned twice.

Source independence: 6 passages compared with 3 sources, none shared (no run of six words); largest share LeuzingerYoung2017, 5 of 8 locators; contents compared with LeuzingerYoung2017 (its §§1–2.4 and later sections on arithmetic groups against G1–G7): independent.

Research link: G3a's filling volume functions are those in which Leuzinger–Young (2017) state their bounds for arithmetic groups; G3's comparison is Riedweg–Schäppi's (2009) for Lipschitz chains; G6–G7 give the minimizing-hypersurface input to nonspin positive mass (PositiveMass Layer 3). Rests on LeuzingerYoung2017 §2.4, RiedwegSchaeppi2009 §2.2 and the README.

## Not verifiable

- Bombieri–De Giorgi–Giusti (1969): not cited by the README and not among the texts held; the statement was checked by computing G7's route, not against the paper.
- Federer, Simon, Mitsuishi, Wickramasekera and Hutchings: listed in References without claim-level locators; not opened.

## Source issues

- **Misprint** in LeuzingerYoung2017 at §2.4, formula (11), p. 16: the source says the integrand evaluates f at the image under the whole chain α; it should be f at the image under the i-th simplex αᵢ; affects nothing.
- **Gap** in LeuzingerYoung2017 at §2.4, p. 16: the source says the chain integral is defined for continuous f, then applies it to the indicator of an arbitrary subset Z; it should take Z Borel and extend the integral to bounded Borel functions; affects nothing.

## For the human reviewers

- none
