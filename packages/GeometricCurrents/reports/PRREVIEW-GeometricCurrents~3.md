# Review of GeometricCurrents (pull request #2490 at e520d07)

**Verdict:** accepted

**Summary.** Accepted: no finding remains. The previous finding is repaired. The Lipschitz bound for filling volume is now stated for L > 0, and a degree-one Check shows why L = 0 is excluded. The previous review's two small corrections and its format note are also repaired. The new Lean statement of the Bombieri–De Giorgi–Giusti theorem elaborates against the pins and says what G7 says, and it holds in every degenerate case and comparison tried. One small correction remains (the theorem is cited to no source), with no format notes. One question on generality goes to the author, and nothing is left for the human reviewers.

## C01 — The Bombieri–De Giorgi–Giusti theorem, now a headline of `Suggested.lean`, is cited to no source

A reader who wants to check the statement, or the subcalibration route that G7 gives for it, has nowhere to look. The sentence that names the theorem (G7, lines 1066–1072) has no locator, and the References (from line 1167) list no text that proves it. The diff makes this the roadmap's one stated headline. Would you cite E. Bombieri, E. De Giorgi and E. Giusti, *Minimal cones and the Bernstein problem*, Invent. Math. 7 (1969), at the theorem on the cones `{|x| = |y|}`? If G7's vector field `Y=(−a x,b y)/sqrt(a³+b³)` is taken from a later short proof, such as De Philippis–Paolini's (2009), would you cite that proof as well? Give each with the locator you read.

## Questions for the author

- G7 and `perimeter_simonsRegion_le` state minimality only for ℝ⁴ × ℝ⁴. As far as I know, Bombieri–De Giorgi–Giusti prove it for `{|x|² > |y|²} ⊂ ℝᵐ × ℝᵐ` for every m ≥ 4. The dimension condition is needed: for m = 1 the statement fails, because inside the unit disc the cross of length 4 is beaten by two chords of total length 2√2 (table below). Is the restriction to m = 4 deliberate, since the sharpness claim in ambient dimension 8 is all the roadmap uses? The 1969 paper is not among the roadmap's cited sources, and I did not open it.

## Previous findings

- R01 — repaired: lines 618–619 read "`FV_d(f_#α) ≤ Lᵈ FV_d(α)` for L-Lipschitz f with L > 0 (for L = 0 it can fail in degree one, Checks below)"; the degree-one Check (lines 653–655) gives the constant-map counterexample.
- C01 — repaired: line 96 links `#layer-2-calibrated-immersions-and-integral-smooth-chains-c2`, the anchor of the Layer 2 heading at CalibratedGeometry line 635 on main.
- C02 — repaired: lines 244–260 cite Tau Ceti's Euclidean constancy theorem with its local and degree-zero forms, and the criterion with its vector-valued and local-to-global forms; G1 no longer plans their proofs.
- N01 — repaired: line 88 cites "GeometricTopology Layer 1 and Layer 11.3", the layer to which GeometricTopology's anchor table (lines 776–778 on main) maps the old item.
- Previous question (is the BDG theorem statable at the pins and a headline?) — answered: `Suggested.lean` states it as `perimeter_simonsRegion_le` (line 56), and G7 names it at lines 1066–1072.

## Verified sound

| Statement | Instances tried | Values computed (README side / check side) | Result | Change |
|---|---|---|---|---|
| `simonsRegion` (Lean 49–50) | index maps; e₀, e₄, 0 | `castAdd 4 i` ↦ 0,1,2,3 and `natAdd 4 i` ↦ 4,5,6,7 (by `decide`); e₀ ∈ E, e₄ ∉ E, 0 ∉ E (by `simp`) | x is the first four coordinates, as the docstring says | none |
| `perimeter_simonsRegion_le`, trivial cases | Ω = ∅; F = E | Ω = ∅ forces K = ∅, F = E: 0 ≤ 0; F = E closes by `le_rfl` | holds | none |
| same, filling a ball | Ω = B_R, F = E ∪ B̄_r, r < R | cone in B_r: (π⁴/2)/7·r⁷ ≈ 6.96 r⁷; replaced by half of ∂B_r: (π⁴/6) r⁷ ≈ 16.23 r⁷ | 6.96 ≤ 16.23, consistent | none |
| same, unbounded Ω | Ω = ℝ⁸, F = E off a compact K | P(E;ℝ⁸) = H⁷(cone) = ∞; P(F;ℝ⁸) ≥ P(E;ℝ⁸∖K) = ∞ | ∞ ≤ ∞; general Ω reduces to a ball containing K via the perimeter measures | none |
| wrong model, m = 1 | E = {\|x\| > \|y\|} ⊂ ℝ²; chords y = ±1/√2 in B₁ | cross: 4; chords: 2√2 ≈ 2.83; traces agree on ∂B₁ | inequality fails for m = 1; Lean fixes m = 4 | question |
| README 1066–1072 against the Lean signature | Ω open, F null-measurable, F∆E ⊆ K compact ⊆ Ω | README "every open Ω and every null-measurable F"; Lean `Opens`, `NullMeasurableSet F volume`, `IsCompact K`, `K ⊆ Ω` | same generality | none |
| One-tactic probe of the headline | `simp`; `exact?` | `simp` makes no progress; `exact?` finds only the theorem itself | not padding | none |
| BDG source (C01) | README G7 and References | no locator at 1066–1072; no BDG or later proof in References | uncited | C01 |
| `FV_d(f_#α) ≤ Lᵈ FV_d(α)`, L > 0 (619) | d = 1, L = ½, α = ⟨y⟩; f = scaling by L, α = ⟨y₁⟩−⟨y₀⟩ in ℝⁿ | ∞ ≤ ½·∞ = ∞; L\|y₁−y₀\| ≤ L\|y₁−y₀\| | holds; no filling gives Lᵈ·∞ = ∞ | none |
| New degree-one Check (653–655) | d = 1, L = 0, α = ⟨y⟩ | FV₁(⟨p⟩) = ∞ (coefficient sum 1); 0¹·∞ = 0 | Check true; exclusion correct | none |
| G1 Euclidean constancy (244–249) | Ω = (0,1)∪(2,3); dimension 0 | [[(0,1)]]−[[(2,3)]] has ∂ = 0, not c[[Ω]]: excluded by `IsConnected` (Current.lean:102); dim 0: c·δ₀ (Current.lean:146) | matches the pin; no finite-mass hypothesis | none |
| G1 criterion (251–260) | the pin | Basic.lean:146 Banach F, any additive Haar μ, connected Ω; Basic.lean:201 vector-valued tests; LocalConstancy.lean:57 | hypotheses as the README states them | none |
| CalibratedGeometry anchor (96) | main heading, line 635 | slug `layer-2-calibrated-immersions-and-integral-smooth-chains-c2` | resolves | none |
| GeometricTopology row (88) | main lines 776–778, 783, 7887 | old item 1 ↦ Layer 11.3, smooth triangulations; Layer 1 collars and tubes | resolves | none |

The rows for statements this diff leaves untouched stand as in the previous review, of `e612e6f`.

- Source locators checked against the text: LeuzingerYoung2017 §2.4, p. 16 (lines 749–758), the filling-volume definitions that the changed sentence and Check extend. The other locators are unchanged.
- Tau Ceti declarations opened at the pin: `TauCeti.perimeter` (Analysis/BoundedVariation/Perimeter.lean:64), `perimeter_eq_iSup` (:73), the three constancy theorems (Analysis/Distribution/Constancy/Current.lean:102, 132, 146), the criterion and its vector-valued form (Constancy/Basic.lean:146, 201), and `existsUnique_eq_ofFun_const_of_locally` (Distribution/LocalConstancy.lean:57). Mathlib: `PiLp.ofLp_single` (Analysis/Normed/Lp/PiLp.lean:155), used in the probes.
- Cross-roadmap citations resolved on main: CalibratedGeometry's Layer 2 heading; GeometricTopology Layers 1 and 11.3 and its anchor table. Varifolds' citations of G1 for the criterion (lines 75–77, 1506, 1541) still land on G1's paragraph. GeometricMeasureTheory's extended perimeter (lines 44–51) is the same supremum as `TauCeti.perimeter_eq_iSup`.
- Dependency check: `depcheck: 213 roadmaps, 2280 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Automatic checks rerun on this head: all pass; nothing changes outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` prints only the `sorry` warning of `perimeter_simonsRegion_le`. `#check @` of both declarations agrees with README lines 1066–1072. The file has no `variable`, so no binder can be lost.
- Ownership: searched main, every open head and the pinned Tau Ceti for the Simons cone, the Bombieri–De Giorgi–Giusti theorem, perimeter minimizers and the constancy theorem by object. Apart from this roadmap there is no Simons-cone or BDG statement. Varifolds §6.4's constancy theorem is the varifold theorem and consumes G1.

Overlap check: read Varifolds, CalibratedGeometry and GeometricMeasureTheory (main), and searched MinimalSurfaces, HeegaardFloer, PDE, SobolevDifferentialForms and ComplexKahlerGeometry (open) for the changed objects. Tau Ceti owns the perimeter and the Euclidean constancy theorems, and GeometricMeasureTheory G6 owns Gauss–Green (its line 284 on main), consumed here. GeometricCurrents G1 owns the manifold constancy theorem, which Varifolds cites, and GeometricCurrents G7 owns the Simons-region theorem. Nothing else is shared.

Source independence: changed passages only. The 633 added words were compared mechanically with the 3 cached sources: no run of six words is shared. The G3a sentence and Check were compared by hand with LeuzingerYoung2017 §2.4: independent. G1's new paragraph repeats, in a run of 28 words, the docstring of the Tau Ceti declaration it cites (Constancy/Basic.lean:143–145), which is Apache 2.0 like this repository. No layer was added, removed or reordered, so the arrangement stands as compared with LeuzingerYoung2017 in the previous review.

Research link: Leuzinger–Young (2017) state their filling bounds for arithmetic groups in G3a's filling volume functions. G3's comparison is the one Riedweg–Schäppi (2009) make for Lipschitz chains. G6's regularity feeds nonspin positive mass, and G7's Bombieri–De Giorgi–Giusti theorem (1969) shows that regularity fails in dimension 8. This rests on LeuzingerYoung2017 §2.4, RiedwegSchaeppi2009 §2.2 and the README.

## Not verifiable

- Bombieri–De Giorgi–Giusti (1969) and De Philippis–Paolini (2009): neither is cited by the README nor in the sources cache, and I did not open them; the generality point stays a question.
- Federer, Simon, Wickramasekera, Mitsuishi and Hutchings (References only, no locators in the changed passages): not opened.

## Source issues

- **Misprint** in LeuzingerYoung2017 at §2.4, formula (11), p. 16: the source says the integrand evaluates f at the image under the whole chain α; it should be f at the image under the i-th simplex αᵢ of the sum; affects nothing.
- **Gap** in LeuzingerYoung2017 at §2.4, p. 16: the source says the chain integral is defined for continuous f, then applies it to the indicator of an arbitrary subset Z; it should require Z Borel and extend the integral to bounded Borel functions; affects nothing.

## For the human reviewers

- none
