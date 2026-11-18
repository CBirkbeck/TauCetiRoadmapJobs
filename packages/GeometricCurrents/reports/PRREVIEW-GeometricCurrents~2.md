# Review of GeometricCurrents (pull request #2490 at e612e6f)

**Verdict:** needs changes

**Summary.** Changes are needed because of one finding, in G3a. The Lipschitz bound for filling volume, `FV_d(f_#α) ≤ Lᵈ FV_d(α)`, fails in degree one for a constant map: there it reads ∞ ≤ 0·∞ = 0. Every finding and note of the previous review is repaired. The Lean file now states nothing and its docstring names each headline with the carrier it lacks, and G3a now says where its filling volume function departs from Leuzinger–Young. There are two small corrections (a broken section anchor, and two Euclidean results that G1 still plans although the pinned Tau Ceti proves them) and one format note. Nothing is left for a human to decide.

## R01 (P2) — The Lipschitz bound for filling volume, `FV_d(f_#α) ≤ Lᵈ FV_d(α)`, is false for d = 1 and a constant map

G3a works in `[0,∞]`, so an implementer who states this target there is asked to prove a false inequality. The filling-volume paragraph (lines 616–617) asserts the bound "for L-Lipschitz f". Take d = 1, any nonempty Y, the 0-cycle α = ⟨y⟩, and f constant at a point p, which is 0-Lipschitz. By the README's own degree-one Check (lines 647–650), ⟨y⟩ and f_#α = ⟨p⟩ have coefficient sum 1 and do not bound. The left side is therefore FV_1(⟨p⟩) = ∞. The right side is 0¹·∞ = 0, under the convention 0·∞ = 0 of extended measure theory and of `ENNReal`.

The bound does hold for every L > 0. It also holds for d ≥ 2 and L = 0: there f_#α is m times the constant (d−1)-simplex c. For d even, c is the boundary of the constant d-simplex, which has volume 0. For d odd, ∂c is a nonzero constant simplex while f_#α is a cycle, which forces m = 0. The smallest repair is "for L-Lipschitz f with L > 0". Alternatively, state the bound for α a boundary, or for d ≥ 2.

## C01 — The link to CalibratedGeometry C2 points at an anchor that does not exist on main

The sentence after the supplier table (line 95) links `../CalibratedGeometry/README.md#c2-calibrated-immersions-and-integration`. On main the C2 heading is "Layer 2: Calibrated immersions and integral smooth chains (C2)" (CalibratedGeometry README, line 635), so the anchor resolves to nothing and the reader lands at the top of that file. Use `#layer-2-calibrated-immersions-and-integral-smooth-chains-c2`, or drop the anchor.

## C02 — G1 still plans two Euclidean results that the pinned Tau Ceti proves, without citing them

The native-floor paragraph (lines 130–140) and G1's mass-measure sentence (lines 205–211) now cite Tau Ceti's Euclidean model. Lines 239–258, however, still ask G1 to construct two results that the pin already has. The first is the scalar criterion: a distribution on a connected Euclidean open set whose coordinate derivatives vanish is a constant multiple of Lebesgue measure, together with its vector-valued version. This is `Distribution.existsUnique_eq_ofFun_const_of_forall_lineDerivOp_eq_zero` (`TauCeti/Analysis/Distribution/Constancy/Basic.lean:146`, Banach-valued, for any additive Haar measure). The second is the Euclidean case of the constancy theorem, `Orientation.existsUnique_eq_smul_integrationCurrent_of_comp_extDerivCLM_eq_zero` (`TauCeti/Analysis/Distribution/Constancy/Current.lean:102`). An implementer reading G1 would rebuild both. Cite them where G1 plans them, as G1 now does for the mass measure. G1 should stay their owner, since Varifolds on main cites "GeometricCurrents G1" for the criterion.

## N01 — The GeometricTopology supplier row (line 87) cites "smoothing-and-triangulation item1", a heading that GeometricTopology on main has replaced; its anchor table maps that item to Layer 11.3, which could be cited directly.

## Questions for the author

- On the way to the sharpness theorem, G7 (lines 1057–1062) proves the Bombieri–De Giorgi–Giusti theorem: E = {|x|² > |y|²} in ℝ⁴ × ℝ⁴ is locally perimeter minimizing. Unlike the integral-current form, this is statable at the pins with `TauCeti.perimeter` (`TauCeti/Analysis/BoundedVariation/Perimeter.lean:64`). A statement written against the pins elaborates with only the `sorry` warning. It reads: for a bounded open Ω and a measurable F with F Δ E inside a compact subset of Ω, `perimeter volume Ω E ≤ perimeter volume Ω F`. Do you count it among the roadmap's headlines? If so, `Suggested.lean` could state it, and the integral-current form would stay named as not statable. Whether it is a headline or a step of the route is your decision, which is why this is a question and not a finding.

## Earlier findings

- R01 (sorry'd `massMeasure` and `intervalCurrent`): repaired. `Suggested.lean` declares nothing, and its docstring says each headline "needs integral currents … which neither library has". The file elaborates without any message.
- C01 (domain of the filling volume function): repaired. Lines 612–614 say "Leuzinger–Young define this function only for (d−1)-connected Y; here it is the same supremum without that hypothesis", and two Checks follow at lines 647–655.
- C02 (`simplexVolume` name clash): repaired; the volume is now the notation `vol(σ)` (line 567).
- C03 (G3 building the Lipschitz complex a second time): repaired. Lines 454–456 now read "The Lipschitz singular complex used in this proof is G3a's Lipschitz chain complex".
- C04 (subdivision missing from the dependency line): repaired. Line 1102 adds "Tau Ceti's barycentric subdivision of Δᵈ", and the route names `TauCeti.AffineChain.subdivision`.
- C05 (Ambrosio–Kirchheim attribution): repaired. Lines 600–601 now read "stated for Lipschitz maps from ℝᵈ into any metric space".
- N01 (submodule imports): repaired; the file has the single import `Mathlib`.
- N02 (undeclared code names in G3a): repaired; G3a uses mathematical notation.
- N03 (commit-pinned links, TeX): repaired. Lines 47, 81, 92 and 93 now use relative links, and the TeX fragments are in code spans (lines 884, 892, 950, 954, 962).
- N04 (docstring silent on unstatable headlines): repaired; the docstring names six headlines and what each lacks.

## Verified sound

| Statement | Instances tried | Values computed (README side / check side) | Result | Change |
|---|---|---|---|---|
| Lipschitz chains, ∂, support, pushforward (548–564) | constant 2-simplex; 1-simplex; α = 0 | ∂c₂ = c₁−c₁+c₁ = c₁; ∂σ = ⟨σ(e₁)⟩−⟨σ(e₀)⟩ vs RS line 213; supp 0 = ∅ | agrees with RS Def 2.4, LY p. 15 | none |
| vol(σ), mass(α) (566–573) | d = 0; Δ² ⊂ ℝ³; doubled circle; constant 1-simplex | 1 (H⁰ counting); √3/2 vs raw 2√3/π; 4π vs H¹(image) = 2π; ∞·0 = 0 | Checks hold; matches LY lines 712–748 | none |
| Route of the volume bound (575–587) | subdivision diameters; child/parent counts; L = 0 | vertex distance ≤ (d/(d+1))ⁿ → 0; counts nondecreasing; L = 0, d ≥ 1: 0 ≤ 0; d = 0: 1 ≤ 0⁰·1 | valid | none |
| vol(σ) ≤ Lip(σ)ᵈ Hᵈ(Δᵈ) | d = 1, 2 | Hᵈ(Δᵈ) = √(d+1)/d!: √2, √3/2 | finite | none |
| mass(f_#α) ≤ Lᵈ mass(α) | d = 0, L = 0, α = ⟨y₀⟩+⟨y₁⟩ | mass(2⟨p⟩) = 2 ≤ 0⁰·2 = 2 | holds | none |
| FV_d(f_#α) ≤ Lᵈ FV_d(α) (616) | d = 1, L = 0, α = ⟨y⟩; d = 2, L = 0, circle loop; d = 3 | ∞ vs 0·∞ = 0; 0 vs 0 (c₁ = ∂c₂); f_#α = 0 | false at d = 1, L = 0 | R01 |
| FV_d(α) < ∞ iff boundary; FV_d(0) = 0; subadditivity | ⟨y⟩; 0; α + α′ | ∞ (no filling); 0 (β = 0); sum of fillings | holds | none |
| Check FV_1(⟨y₁⟩−⟨y₀⟩) = \|y₁−y₀\| | segment; projection p with IVT; y₀ = y₁ | upper \|y₁−y₀\|; lower ∫Σ\|cₖ\|#(pσₖ)⁻¹(t)dt ≥ \|y₁−y₀\|; 0 = 0 | equality | none |
| Check FV_2(σ−σ′) = 0 | prism plus constant 2-simplices | ∂(const at a) = c_a; images in segment, H² = 0 | holds | none |
| FV_d(Y, V) and its two Checks | d = 1, V = 1 and ½; S¹, d = 2, V = 2π | ∞ and 0; ∞; LY line 754 assumes (d−1)-connected | departure stated correctly | none |
| Riemannian area formula (593–597) | Δ² ↪ ℝ³ | √det(Dσ*Dσ) = 1 on hyperplane; ∫ = √3/2 = vol | holds | none |
| M([α]) ≤ mass(α) (602–606) | σ − σ∘ρ, ρ(1−s,s) = (1−s²,s²) | 0 < 2ℓ | strict, as stated | none |
| AK (9.2)–(9.3) attribution (599–601) | AK lines 1828–1862 | metric differential exists a.e. for Lipschitz maps into any metric space | matches | none |
| Native floor and G1 Tau Ceti names | pin | 11 names found: ExtDeriv.lean:67, 86; Mass/Basic.lean:77, 84, 353, 484; Mass/Measure.lean:191–348 | resolve | none |
| G1 scalar criterion, Euclidean constancy (239–258) | pin | Constancy/Basic.lean:146; Constancy/Current.lean:102 | proved, not cited | C02 |
| Headline: interior regularity, 2 ≤ n ≤ 7 | n = 2; n = 8 | minimizing 1-currents on a surface: geodesic arcs, smooth; Simons cone singular at 0 | consistent; no integral currents at pin | none |
| Headline: Federer–Fleming (G4b) | δ at xᵢ → ∞ in ℝ; fixed K | escaping masses have weak limit 0, mass not kept; README requires fixed K and both mass bounds | hypotheses present | none |
| Headline: homology isomorphism (G3) | RP², degree 1 | integral H₁ = ℤ/2; real fillings give 0 | the Check separates them | none |
| Headline: Plateau (G5) | B = δ_b − δ_a; δ_a alone | augmentation 0, minimizer mass \|b−a\|; augmentation 1, no filling | consistent with 725–726 | none |
| Headline: smooth local limits (G7) | two parallel planes converging | limit plane with multiplicity 2 = number of sheets | consistent | none |
| Headline: sharpness, ambient 8 | Y = (−ax, by)/√(a³+b³) | \|Y\|² = 1; div Y = −3(a+b)(a−b)³/(a³+b³)^{3/2} recomputed; ∫\|∇η_ε\| ~ ε⁷ | matches 1052–1060 | none |
| BDG perimeter minimality (1057–1062) | statement with `TauCeti.perimeter` | elaborates, only the `sorry` warning | statable | question |
| Calib C2 anchor (95) | main heading, line 635 | `#layer-2-…-c2` ≠ `#c2-calibrated-immersions-and-integration` | broken | C01 |

- Source locators checked against the text: 6 (RiedwegSchaeppi2009 §2.2, Def 2.4, pp. 4–5, lines 191–250; LeuzingerYoung2017 §2.4, pp. 15–16, lines 705–758, four locators; AmbrosioKirchheim2000 §9 item (2), lines 1809–1862).
- Library declarations opened at the pins (Mathlib): `Measure.euclideanHausdorffMeasure` (Geometry/Euclidean/Volume/Measure.lean:68), `LipschitzWith.hausdorffMeasure_image_le` (MeasureTheory/Measure/Hausdorff.lean:745), `LipschitzWith.ae_differentiableAt` (Analysis/Calculus/Rademacher.lean:386), `SimplexCategory.toTop` (AlgebraicTopology/TopologicalSimplex.lean:44), `singularChainComplexFunctor` (AlgebraicTopology/SingularHomology/Basic.lean:37), `AlternatingMap.map_linearDependent` (LinearAlgebra/Alternating/Basic.lean:783).
- Library declarations opened at the pins (Tau Ceti): the 11 native-floor and G1 names; `AffineChain.subdivision` (AlgebraicTopology/Singular/Subdivision/AffineChain.lean:142); `AffineChain.dist_weights_le_of_mem_support_subdivision_iterate` (…/Subdivision/Small/Basic.lean:130); `riemannianVolume` (Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:82); `formSolutionOperator`; the two constancy theorems; `perimeter`; `CountablyRectifiable`. No integer-rectifiable current at the pin.
- Cross-roadmap citations resolved on main: ComplexKahlerGeometry §5.1 (K5a); PDE §1.7, §§2.1–2.3, §§3.1–3.2, §§4.1–4.4, §5.6 (E25), §5.7 (E26), unchanged at PDE's open revision; RiemannianGeometry R5a.1 and R5b, which uses Tau Ceti's coercive-form solution operator and no VariationalMethods or UnboundedOperators; CalibratedGeometry C1, which consumes GeneralizedCohomology G4.0b and CharacteristicClasses C1.1a and not HomotopySpheres; GeometricMeasureTheory G2; MorseTheory M3; AlgebraicTopology 2.6 and Layer 3; HopfRinow Layer 0; DGFloer Layer 0, also at its open revision; GeometricTopology's anchor table.
- The 25 removed Lean names are cited by no roadmap on main or at an open head.
- Dependency check output: `depcheck: 214 roadmaps, 2298 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Automatic checks rerun on this head: all pass; nothing changes outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` prints nothing. The file has no declaration, so no `#check @name` comparison applies.
- Wording: the whole README was compared mechanically with the three cached sources. The longest shared run is 8 words ("the boundary of a current T is", a standard phrase); the other shared runs are titles.

Overlap check: read Varifolds, CalibratedGeometry and GeometricMeasureTheory (main), and MinimalSurfaces, HeegaardFloer, PDE, SobolevDifferentialForms and ManifoldOptimization (open). Varifolds, MinimalSurfaces and HeegaardFloer consume GeometricCurrents G1–G6, whose owner is GeometricCurrents. The Euclidean area formula with multiplicity belongs to GeometricMeasureTheory G2, and comass and the integral smooth chains belong to CalibratedGeometry C1–C2; GeometricCurrents consumes both. Nothing else is shared, and no other roadmap owns Lipschitz chains or filling volume.

Source independence: 8 passages compared by hand with 3 sources: G3a's chains, volume, mass and filling-volume sentences, the connectivity sentence, the degree-one and circle Checks, and the area-formula paragraph. The whole README was compared mechanically with the same 3 sources. Nothing is shared. The largest share of locators is LeuzingerYoung2017's, 5 of 8. Contents compared with LeuzingerYoung2017 §2.4: independent. The order chains → mass → filling is forced by the definitions, and the Lipschitz bound, area formula, current comparison and Checks are not in §2.4.

Research link: G3a's filling volume functions are the invariants in which Leuzinger–Young (2017) state their filling bounds for arithmetic groups. G3's homology comparison is the one Riedweg–Schäppi (2009) study for Lipschitz chains. G6's regularity is the minimizing-hypersurface input to nonspin positive mass. Rests on LeuzingerYoung2017 §2.4, RiedwegSchaeppi2009 §2.2 and the README.

## Not verifiable

- Federer, *Geometric Measure Theory* (References only, no locator in the sample): no open legal copy; not opened.
- Simon, Wickramasekera, Mitsuishi and Hutchings (References only, cited without locators): not opened.

## Source issues

- **Misprint** in LeuzingerYoung2017 at §2.4, formula (11), p. 16: the source says the integrand evaluates f at the image under the whole chain α; it should be f at the image under the i-th simplex αᵢ of the sum; affects nothing.
- **Gap** in LeuzingerYoung2017 at §2.4, p. 16: the source says the chain integral is defined for continuous f, then applies it to the indicator of an arbitrary subset Z; it should require Z Borel and extend the integral to bounded Borel functions; affects nothing.

## For the human reviewers

- none
