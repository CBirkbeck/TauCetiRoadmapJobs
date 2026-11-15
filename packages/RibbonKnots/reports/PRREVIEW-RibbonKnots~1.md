# Review of RibbonKnots (pull request #2339 at fab3ea6)

**Verdict:** needs changes

## R01 (P1) — `Suggested.lean` does not build

**Location:** `TauCetiRoadmap/RibbonKnots/Suggested.lean` lines 57, 125, 127, 134, 136: `if h : z ∈ closedBall (0 : ℂ) 1 then …`, `C((range K₀)ᶜ, trackComplement F)`, `(x : (range K₀)ᶜ)`.
**Claim:** The targeted build fails, so none of the five headline statements is checked.
**Witness:** Gate at fab3ea6: `build=6 FAIL`. `lake env lean`: `failed to synthesize Decidable (z ∈ closedBall 0 1)` at 57:10; `failed to synthesize Compl Type` at 125:40, 127:9, 134:40, 136:9.
**Repair:** Put `open scoped Classical in` on the line before the docstring of `radialFunction`. In `knotGroup_injective_of_isRibbonConcordance` write `(i : C(((range K₀)ᶜ : Set (sphere (0 : EuclideanSpace ℝ (Fin 4)) 1)), trackComplement F))`, `(hi : ∀ x, (i x : sphere (0 : EuclideanSpace ℝ (Fin 4)) 1 × ℝ) = (x.1, 0))` and `(x : ((range K₀)ᶜ : Set (sphere (0 : EuclideanSpace ℝ (Fin 4)) 1)))`; the same with `K₁` and `(x.1, 1)` in the surjective half. Tested on a copy: it then elaborates with `sorry` as its only warning.

## R02 (P1) — HeegaardFloer 7.6 does not supply what 1.5 takes from it

**Location:** README, Scope: "Knot Floer homology, and with it Zemke's injectivity theorem behind 1.5, is HeegaardFloer's (Layer 7.6)"; supplier contract: "Section 7.6, knot Floer homology and its concordance maps".
**Claim:** HeegaardFloer 7.6 builds the knot Floer complexes only. It states no concordance maps, no genus detection and no injectivity theorem, so 1.5's route has no owner.
**Witness:** HeegaardFloer README on main, 7.6 (lines 4544–4611): doubly pointed diagrams, filtrations, grid comparison. `roadmaps grep 'concordance map|Juh[aá]sz.Marengon|genus detection'` matches only RibbonKnots README line 76.
**Repair:** Scope: "Knot Floer homology is HeegaardFloer's (Layer 7.6); Zemke's injectivity theorem (Zemke 2019, Theorem 1.1) is a target of 1.5." Supplier contract: "Section 7.6, the knot Floer complexes. What HeegaardFloer must provide (gap:hfk-concordance-maps): for a decorated smooth concordance `C` from `K₀` to `K₁` in `[0, 1] × S³`, a graded map `F_C : HFK̂(K₀) → HFK̂(K₁)`, functorial under stacking and the identity on the product concordance. What HeegaardFloer must provide (gap:hfk-genus-detection): `g₃(K) = max{j : HFK̂(K, j) ≠ 0}` (Ozsváth–Szabó, Theorem 1.2, as recalled in Zemke 2019, §1)." Put both slugs in 1.5's *Needs:* line and in the plan's `gaps`.

## R03 (P2) — Ribbon discs and ribbon concordances are never related

**Location:** README, Conventions: "a ribbon disc for `K`, with a small disc around a minimum removed, is a ribbon concordance with the unknot at time `0`, so it gives `RibbonLE unknot K`"; `Suggested.lean` lines 53–73.
**Claim:** The comparison `IsRibbon K ↔ RibbonLE unknot K` is used by the Conventions witness and Checks of 1.3, 1.4 and 1.5, but it is not a target. It is statable at the pins. No theorem in `Suggested.lean` uses `radialFunction`, `IsRibbonDisc` or `IsRibbon`.
**Witness:** Zemke2019 line 16 defines ribbon knots by a ribbon concordance from the unknot; Livingston2005 line 135 defines them by a disc. No declaration of `Suggested.lean` after line 75 mentions `IsRibbon`.
**Repair:** Add to 1.1: "Prove that a knot `K` in `S³` is ribbon iff `RibbonLE unknot K` (`isRibbon_iff_ribbonLE_unknot`): remove a small disc around the lowest minimum of the radial function and rescale the shell to `S³ × [0, 1]`; conversely, cap the unknot end with a flat disc (Zemke 2019, §1, takes the right side as the definition). *Needs:* 0.1, `TauCeti.unknot`, `Concordance.ofDiffeotopy`, `Concordance.trans`." In `Suggested.lean`, after `RibbonLE`: `attribute [local instance] TauCeti.finrank_euclideanSpace_fin_succ_fact in`, a docstring, then `theorem isRibbon_iff_ribbonLE_unknot (K : Knot) : IsRibbon K ↔ RibbonLE unknot K := by sorry` (tested: elaborates). Add the theorem to the module docstring's list of headlines.

## R04 (P2) — 1.4's *Needs:* line omits the inputs of its route

**Location:** README 1.4: "*Needs:* 1.2, 1.3, `TauCeti.SmoothEmbedding.SmoothAmbientIsotopic`."
**Claim:** The route 1.4 names (representation varieties, then a peripheral-structure-preserving isomorphism, then isotopy) uses results that no layer here, no named supplier section and no pinned declaration provides.
**Witness:** Agol2022 lines 63–69 and 77–81 use Daemi–Lidman–Vela-Vick–Wong, Proposition 2.1 (after Gerstenhaber–Rothaus), residual finiteness (Hempel, reference [9]) and Lemma A.2. Lines 89–95 use Waldhausen's theorem.
**Repair:** "*Needs:* 1.2, 1.3, `TauCeti.SmoothEmbedding.SmoothAmbientIsotopic`, `TauCeti.SmoothCircleEmbedding.KnotGroup`; GeometricTopology 5.1 (knot exteriors, peripheral markings) and 8.3.1 (relative Waldhausen realization). State three further targets in 1.4, each with its locator: the residual finiteness of knot groups (Hempel); the fact that every `SO(N)`-representation of the group of the time-`0` end extends over the exterior of a ribbon concordance (Agol 2022, proof of Theorem 1.2, citing Daemi–Lidman–Vela-Vick–Wong, Proposition 2.1); and Agol 2022, Lemma A.2."

## R05 (P2) — 2.1's route needs a Donaldson theorem that no roadmap owns

**Location:** README 2.1: "(Lisca 2007, Corollary 1.3, from Theorem 1.2 through Donaldson's diagonalization theorem)" and "*Needs:* 0.1, GeometricTopology 4.10."
**Claim:** The route needs three inputs that the *Needs:* line does not name: Donaldson's theorem for closed smooth definite four-manifolds with no hypothesis on `π₁`, lens spaces, and the double branched cover of `B⁴` along a slice disc. FourManifolds owns only the simply connected case of Donaldson's theorem.
**Witness:** In Lisca2007, lines 104–106 use the branched cover. Lines 148–153 apply Donaldson's theorem to `X(p, q) = P ∪ −W` with `W` a rational ball, citing reference [4] (line 1749), Donaldson's orientation paper. FourManifolds `Suggested.lean` line 26 (#936) is the simply connected case.
**Repair:** "*Needs:* 0.1; GeometricTopology 4.10 and 4.4 (the determinant); the lens spaces of `TauCeti/Geometry/Manifold/Instances/LensSpace.lean`; FourManifolds §5.3. What FourManifolds must provide (gap:donaldson-definite-any-pi1): the intersection lattice of a closed oriented smooth negative-definite four-manifold, with no hypothesis on its fundamental group, is diagonal (the theorem Lisca 2007, §1, cites as [4])." Also state as a target of 2.1 that the double branched cover of `B⁴` along a slice disc of `K(p, q)`, `p` odd, is a rational homology ball bounded by `L(p, q)` (Lisca 2007, §1).

## R06 (P2) — A sentence of Livingston's survey is copied

**Location:** README, Research context: "Casson observed that for every slice knot `K` there is a ribbon knot `J` with `K # J` ribbon (Livingston 2005, §2.1)."
**Claim:** The sentence reproduces the source's sentence; only the connective is changed.
**Witness:** Livingston2005 lines 138–139: 14 consecutive words are shared, from "Casson" to "ribbon knot J"; the rest differs by one word.
**Repair:** "By an observation of Casson, every slice knot becomes ribbon after connected sum with a suitably chosen ribbon knot (Livingston 2005, §2.1)."

## R07 (P3) — False Check in 1.2: a source reparametrization does not change the index

**Location:** README 1.2, first Check: "A reparametrization `t ↦ −3t` would send index `k` to `2 − k`."
**Claim:** False. Changing the source coordinate conjugates the Hessian to `D′ H D′` with `D′ = diag(1, −3)`, which has the same index as `H`. Only negating the function's value sends `k` to `2 − k`.
**Witness:** `f(s, t) = s² + t²` has index `0`. `f(s, −3t)/3 = (s² + 9t²)/3` has Hessian `diag(2/3, 6)`, so its index is `0`, not `2`.
**Repair:** "Negating the time function, as `Concordance.symm` does (1.1, second Check), sends index `k` to `2 − k`; a change of the source coordinate alone, even `t ↦ −3t`, leaves every index unchanged."

## R08 (P3) — The figure-eight Check misstates which data obstruct sliceness

**Location:** README 2.1, third Check: "although its Alexander polynomial `−t + 3 − t⁻¹` has determinant `5` and its signature is `0`; the obstruction used is Casson and Gordon's, not the signature."
**Claim:** A non-square determinant is itself an Alexander-polynomial obstruction to sliceness (Fox–Milnor). The word "although" says the reverse.
**Witness:** If `K` is slice, then `Δ ≐ f(t) f(t⁻¹)`, so `|Δ(−1)| = f(−1)²`. Here `|Δ(−1)| = 1 + 3 + 1 = 5`, which is not a square.
**Repair:** "`K(5, 2)` is the figure-eight knot: its determinant `|Δ(−1)| = 5` is not a perfect square, so it is neither slice nor ribbon (Lisca 2007, §1) and `L(5, 2)` bounds no rational homology ball; its signature `0` does not detect this."

## R09 (P3) — Vacuous Check in 1.4

**Location:** README 1.4, first Check: "`RibbonLE.antisymm (ribbonLE_refl K) (ribbonLE_refl K)` returns the isotopy class of `K` itself."
**Claim:** Vacuous. The conclusion is a `Prop`, and `SmoothAmbientIsotopic K K` holds without the theorem. The Check also names Lean counterparts.
**Witness:** The Check would also hold for the false strengthening that concludes `K₀ = K₁`.
**Repair:** "For `a ≠ 1` in the circle, `K` and `K.rotate a` are ribbon concordant in both directions, through the trace of a rotation of the circle (time function `t`, no critical point), yet differ as maps since `K` is injective: the conclusion must be isotopy, not equality."

## R10 (P3) — Padding in `Suggested.lean`: `ribbonLE_refl`

**Location:** `Suggested.lean` lines 107–110: `theorem ribbonLE_refl (K : Knot) : RibbonLE K K`.
**Claim:** This repeats README 1.1's first Check: the product concordance has time function `t` and therefore no critical point.
**Witness:** `Concordance.refl_apply` (`TauCeti/Geometry/Manifold/SmoothEmbedding/Concordance.lean:239`) gives the time function `p.2`, whose derivative `(0, 1)` never vanishes.
**Repair:** Delete it from `Suggested.lean` and from the module docstring. In README 1.2, write "Prove that `RibbonLE` is reflexive, by the product concordance" without the backticked Lean name.

## R11 (P3) — The pinned knot group is restated, not cited

**Location:** `Suggested.lean` lines 124–137, `FundamentalGroup.map i x` on `(range K₀)ᶜ` and `(range K₁)ᶜ`; README "From Tau Ceti".
**Claim:** The knot group of a smooth circle embedding exists at the pin.
**Witness:** `TauCeti.SmoothCircleEmbedding.KnotGroup K x := FundamentalGroup ((range K)ᶜ : Set M) x` (`TauCeti/KnotTheory/KnotGroup.lean:96`).
**Repair:** Import `TauCeti.KnotTheory.KnotGroup` and state `Function.Injective (FundamentalGroup.map i x : K₀.KnotGroup x →* _)` and `Function.Surjective (FundamentalGroup.map i x : K₁.KnotGroup x →* _)` (tested with R01: elaborates). Cite `TauCeti.SmoothCircleEmbedding.KnotGroup` under "From Tau Ceti" and in 1.3's *Needs:* line.

## R12 (P3) — Scope attributes the Fox–Milnor condition to GeometricTopology 6.2

**Location:** README, Scope: "the Fox–Milnor condition and the Levine–Tristram signatures of slice knots are GeometricTopology 6.2's".
**Claim:** GeometricTopology 6.2 has no Fox–Milnor target.
**Witness:** The GeometricTopology README on main names Fox–Milnor once, at line 6443, inside a source remark on the Arf invariant.
**Repair:** "the Levine–Tristram signatures of slice knots are GeometricTopology 6.2's".

## R13 (P3) — Livingston's locator is attached to claims it does not make

**Location:** README 0.1: "and under linear isometries of `E`, as Tau Ceti proves for sliceness (Livingston 2005, Definition 2.3)."
**Claim:** The locator supports the definition of a ribbon disc, not the invariance claims it follows.
**Witness:** Livingston2005 lines 135–137: Definition 2.3 defines ribbon knots through the radial function. It states no invariance.
**Repair:** Move "(Livingston 2005, Definition 2.3)" to the end of the sentence that defines `IsRibbonDisc` ("… none of index `2`"). End the invariance sentence with "(by the arguments of `TauCeti.isSmoothlySlice_rotate_iff`, `TauCeti.isSmoothlySlice_reverse_iff` and `TauCeti.isSmoothlySlice_congr_linearIsometryEquiv`)".

## R14 (P3) — The description's "Checks run" paragraph does not match the head

**Location:** Pull-request description, "Checks run": "The worker gate passes with 0 on every check."
**Claim:** The head contradicts it, because the targeted build fails.
**Witness:** Gate at fab3ea6: `build=6 FAIL` (R01).
**Repair:** After R01, write "The gate passes with 0 on every check, including the targeted build of `Suggested.lean`, which elaborates with `sorry` as its only warning." Add the further changes under "Suggested.lean" and "Suppliers": the target `isRibbon_iff_ribbonLE_unknot` added, `ribbonLE_refl` deleted, and the gaps declared on HeegaardFloer and FourManifolds.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 `IsRibbonDisc` (sample) | flat disc `Φ₀`; Check-2 disc; a point with `Φ z = 0` | `|z|²`, Hessian `2·id`, index 0; `ρ(|z|²)`, Hessian `−id/2` at 0, index 2; Hessian `2·DΦᵀDΦ`, index 0 | matches Livingston2005 line 135 | R13 |
| 0.1 second Check | `ρ(s) = 1/2 − s/4 + 3s²/4` | `ρ(1) = 1`; `ρ − 1 = (3s+2)(s−1)/4`; min `ρ(1/6) = 23/48 > 1/4`; `ρ′(1) = 5/4` | all four claims hold; critical circle `|z|² = 1/6` | none |
| `‖Φ‖²` versus `‖Φ‖` | `Φ z ≠ 0` | `d(r²) = 2r dr`; at critical points `Hess(r²) = 2r·Hess(r)`, `r > 0` | same critical points, same indices | none |
| 1.1 `IsRibbonConcordance` (sample) | `refl K`; `F.symm`; `s ↦ s + 2π` | time `t`, derivative `(0, 1)`; `1 − τ(s, 1−t)`, Hessian `−D′HD′`, `k ↦ 2−k`; `Circle.periodic_exp` | direction agrees with Agol2022 lines 13–18, Zemke2019 line 26 | R03 |
| 1.2 reflexive, transitive (sample) | stack for `t ≤ 1/2`; `t ∈ [1/3, 2/3]`; `t ↦ −3t` | `τ(s,3t)/3`, Hessian `DHD/3`, index kept; time `t`; Hessian `D′HD′`, index kept | Agol2022 line 22; one Check false | R07, R10 |
| 1.3 Gordon's lemma (sample) | `refl K`; ribbon disc minus its lowest minimum; existence of `i` | `(S³∖K)×[0,1]`, both maps isomorphisms; `ℤ ↪`, knot group `↠`; `F⁻¹(S³×{0}) = S¹×{0}` | ends agree with Zemke2019 line 25, Agol2022 lines 53, 63 | R01, R11 |
| 1.4 Agol's theorem (sample) | `K`, `K.rotate a`; unknot versus square knot | ribbon both ways, isotopic, unequal; concordant both ways, not isotopic, not ribbon both ways | Agol2022 Theorems 1.1, 1.2 (lines 36–39) | R04, R09 |
| 1.5 monotonicity (sample) | `refl`; `RibbonLE unknot K`; `RibbonLE trefoil unknot` | equalities; `0 ≤ g(K)`; `1 ≤ 0`, so excluded | Zemke2019 lines 55, 67–69, 81 | R02 |
| 2.1 Lisca's theorem (sample) | `9/2`; `K(3, 1)`; `K(5, 2)` | `m = 3, k = 1, 3·1 − 1 = 2`, type (1); determinants 3 and 5, not squares | Lisca2007 lines 86–99, 129–146 | R05, R08 |
| `isRibbon_iff_ribbonLE_unknot` (proposed) | flat-disc cap on an annulus | radius `((1+t)/2)²` increasing in `t`; indices kept | elaborates at the pins | R03 |

- Source locators checked against the text: 15 (Agol2022 4, Zemke2019 3, Lisca2007 5, Livingston2005 3). Gordon1981's 4 were checked only through Zemke2019 lines 21–27 and 67–69 and Agol2022 lines 53, 63 and 87.
- Pinned declarations opened: `IsSmoothSliceDisc` (TauCeti/KnotTheory/Slice/Basic.lean), `SmoothEmbedding.Concordance` (…/SmoothEmbedding/Concordance.lean:109, `symm_apply` :254, `trans_apply_of_le` :304), `IsCollaredTrack` (TauCeti/Topology/Homotopy/CollaredTrack.lean:81), `HasNondegenerateCriticalPointsOn` (Morse/Basic.lean:149), `morseIndex` (Morse/Index.lean:162).
- More pinned declarations: `SmoothAmbientIsotopic` (SmoothAmbientIsotopy/Basic.lean:72), `KnotGroup` (KnotTheory/KnotGroup.lean:96), `unknot` (KnotTheory/SmoothCircle.lean:294), `finrank_euclideanSpace_fin_succ_fact` (Instances/Sphere.lean:122); Mathlib `Circle.periodic_exp` (Complex/Circle.lean:80), `FundamentalGroup.map` (FundamentalGroup.lean:79).
- Cross-roadmap citations resolved on main: GeometricTopology Layer 4, 4.3, 4.4, 4.10, 6.1, 6.2 and HeegaardFloer 7.6. Two do not supply what is claimed: 6.2 for Fox–Milnor (R12) and 7.6 for concordance maps (R02).
- Gate: the worker's run reports `build=6 FAIL` with every other check at 0. My rerun reported every text check at 0 and printed no build field. The dependency check printed `depcheck: 245 roadmaps, 2206 edges, 0 problem(s)` (no UPWARD, no CYCLE).
- Elaboration: the head has 5 errors (R01); the repaired copy has `sorry` warnings only. `#check @` on all 13 declarations: only `radialFunction` drops `[InnerProductSpace ℝ E]`, which its body does not use. The other signatures match the README's generality.
- One-tactic probe on `ribbonLE_refl`: `simp [RibbonLE, IsRibbonConcordance, timeFunction]` fails, and so does `exact ⟨.refl K, by simp …⟩`. It is padding because it repeats a Check (R10). The other four headlines are deep results.

Overlap check: read GeometricTopology (main; open #1791, #1797), FourManifolds (#936), CombinatorialHeegaardFloer and DiagrammaticCoherence (main). Owners of the shared objects:
- knots, concordance, Seifert genus, Alexander polynomial and two-bridge knots: GeometricTopology, cited here;
- knot Floer complexes: HeegaardFloer; their concordance maps have no owner (R02);
- Donaldson's theorem: FourManifolds §5.3, simply connected case only (R05);
- ribbon discs, ribbon concordance and Lisca's theorem: RibbonKnots; no other roadmap defines them.

The overlap report lists no dropped id and no second copy.

Source independence: 21 passages compared with 6 sources (Agol2022, Zemke2019, Lisca2007, Livingston2005, FriedlPowell2020, DunfieldGong2025), 1 shared (R06); largest share Lisca2007, 5 of 20 locators; contents compared with Lisca2007: independent (Layer 2 is one subsection drawn from its §1).

## Not verifiable

- Gordon1981 (§1, Lemmas 3.1, 3.2 and 3.4): DOI 10.1007/BF01458281 resolves only to a paywalled page, and a search by citation found no open copy. It was checked through Zemke2019's and Agol2022's restatements.
- Fox 1962 (Prentice-Hall volume): not fetched. The README cites it in the form of Livingston2005 §10, Problem 1 (line 862), which was checked.

## Source issues

- **Misprint** in Agol2022 at the proof of Theorem 1.2, p. 2: the source calls the self-concordance one "from" the time-0 copy "to" the time-1 copy, the reverse of its §1 convention ("from K₁ to K₀"); it should use one wording throughout; affects nothing.

## For the human reviewers

- none
