# Review of RibbonKnots (pull request #2339 at 6c2523c)

**Verdict:** needs changes

**Previous review (fab3ea6), finding by finding.**

| Previous | Status at this head | Passage |
|---|---|---|
| R01 build | repaired | `open scoped Classical in` (`Suggested.lean` line 59); complements typed `Set S3` (lines 136–138); elaborates |
| R02 HeegaardFloer supply | repaired as proposed; the proposed gap is too narrow (R04 below) | README lines 31–33, 96–101: "Its concordance maps and the detection of the Seifert genus are asked of HeegaardFloer" |
| R03 discs vs concordances | repaired | README line 174, `Suggested.lean` line 117: `isRibbon_iff_ribbonLE_unknot` |
| R04 1.4 inputs | partly: GeometricTopology 5.1, 8.3.1 and three targets added; further inputs missing (R01–R03 below) | README lines 248–262 |
| R05 Donaldson | repaired; the plumbing is missing (R05 below) | README lines 107–109, 319–325: gap:donaldson-definite-any-pi1 |
| R06 copied sentence | repaired | README line 357: "By an observation of Casson, every slice knot becomes ribbon…" |
| R07 false Check | repaired | README lines 209–210: "a change of the source coordinate alone, even `t ↦ −3t`, leaves every index unchanged" |
| R08 figure-eight Check | repaired | README lines 333–335 |
| R09 vacuous Check | repaired | README lines 266–268: `K` and `K.rotate a` |
| R10 `ribbonLE_refl` | repaired | deleted; README line 199 has no Lean name |
| R11 knot group | repaired | `Suggested.lean` lines 139, 149: `K₀.KnotGroup x` |
| R12 Fox–Milnor | repaired | README lines 27–28 |
| R13 Livingston locator | repaired | README lines 130–134 |
| R14 description | repaired | "The gate passes with 0 on every check" holds at this head |

## R01 (P2) — Gordon's lemma and the extension target rest on unowned results

**Location:** README 1.3, "*Needs:* 1.1, `FundamentalGroup.map`, `TauCeti.SmoothEmbedding.Concordance`, `TauCeti.SmoothCircleEmbedding.KnotGroup`."; README 1.4, "citing Daemi, Lidman, Vela-Vick and Wong 2022, Proposition 2.1, after Gerstenhaber and Rothaus".
**Claim:** Both halves of 1.3 and `exists_extension_of_isRibbonConcordance` need the 1-/2-handle structure of the exterior and the two Gerstenhaber–Rothaus theorems. No target, supplier section or pinned declaration states either. Injectivity also needs residual finiteness, which is stated only later, in 1.4.
**Witness:** DLVW2022 lines 279–291: surjectivity and the extension come from the handle structure and [GR62, Theorem 1]. Lines 292–300: injectivity comes from residual finiteness and [GR62, Theorem 2]. Line 273: the argument "repeats that of Gordon".
**Repair:** Open 1.3 with: "Prove that the exterior of a ribbon concordance from `K₀` to `K₁` is obtained from the exterior of `K₀` by attaching one 1-handle for each minimum and one 2-handle for each saddle of the time function, equally many, the 2-handles cancelling the 1-handles in rational homology (Agol 2022, proof of Theorem 1.2; Daemi–Lidman–Vela-Vick–Wong 2022, proof of Proposition 2.1). Prove the Gerstenhaber–Rothaus theorems. First, a system of `m` equations in `m` unknowns with constants in a compact connected Lie group `G`, whose matrix of exponent sums in the unknowns has nonzero determinant, has a solution in `G`. Second, with constants in a finite group `H`, such a system has a solution in some finite group containing `H` (Gerstenhaber–Rothaus 1962, Theorems 1 and 2, as used in Daemi–Lidman–Vela-Vick–Wong 2022, proof of Proposition 2.1)." Make 1.3's *Needs:* "1.1, `FundamentalGroup.map`, `TauCeti.SmoothEmbedding.Concordance`, `TauCeti.SmoothCircleEmbedding.KnotGroup`, `Matrix.specialOrthogonalGroup`; gap:knot-group-residually-finite (R03)". Add M. Gerstenhaber, O. S. Rothaus, *The solution of sets of equations in groups*, Proc. Nat. Acad. Sci. U.S.A. 48 (1962), 1531–1533 to the references.

## R02 (P2) — Agol's route needs Waldhausen's covering theorem and the isotopy bridges

**Location:** README 1.4: "whose exterior is a relative s-cobordism by representation varieties … with Gordon's lemma the inclusions induce isomorphisms preserving the peripheral subgroups"; "*Needs:* … GeometricTopology 5.1 … and 8.3.1 (relative Waldhausen realization)".
**Claim:** Gordon's lemma gives only an injection at the time-0 end. Agol upgrades it to an isomorphism by Waldhausen's covering theorem, which 8.3.1 does not state. The step from an exterior homeomorphism to a smooth ambient isotopy uses GeometricTopology 8.1, 11.2 and 3.4, none of which is listed. The s-cobordism is not needed here.
**Witness:** Agol2022 lines 89–93: a peripheral-preserving injection is realized by a cover of index 1. Lines 95–96: the s-cobordism is unnecessary. GeometricTopology 8.3.1 items 2–3 realize only homotopy equivalences and isomorphisms. GeometricTopology 8.5.2 routes isotopy "through 11.2 and 3.4".
**Repair:** Replace the route sentence of 1.4 by: "Stacking gives a ribbon self-concordance of `K₀`. Its time-1 end induces an isomorphism on fundamental groups. It is onto by Gordon's lemma, and one-to-one because restriction is a polynomial surjection of `SO(N)`-representation varieties onto the larger one (Agol 2022, Theorem 1.2 and its proof). The time-0 end of the concordance from `K₁` to `K₀` then injects the group of `K₁` into that of `K₀`, meridian to meridian and longitude to longitude. By gap:knot-group-peripheral-injection this injection is an isomorphism. Waldhausen's realization gives a homeomorphism of the exteriors, which extends over the meridional fillings and is smoothed to an ambient isotopy (Agol 2022, Theorem 1.1, through Gordon 1981, Lemma 3.2)." Under "From TauCetiRoadmap.GeometricTopology" add: "What GeometricTopology must provide (gap:knot-group-peripheral-injection): for knots `K`, `J` in `S³`, an injective homomorphism from the group of `K` to the group of `J` that carries the peripheral subgroup of `K` onto a conjugate of that of `J`, meridian to meridian and longitude to longitude, is an isomorphism (Waldhausen's covering theorem, as used in Agol 2022, proof of Theorem 1.2)." Make 1.4's *Needs:* "1.2, 1.3, `TauCeti.SmoothEmbedding.SmoothAmbientIsotopic`, `TauCeti.SmoothCircleEmbedding.KnotGroup`, `Matrix.specialOrthogonalGroup`, `MvPolynomial.eval`; GeometricTopology 5.1 (knot exteriors, peripheral markings), 8.3.1 (relative Waldhausen realization), 8.1 (extension over the meridional filling), 11.2 and 3.4 (smooth realization, Cerf's theorem); gap:knot-group-peripheral-injection", and add the new slugs to Layer 1's Dependencies.

## R03 (P2) — Residual finiteness of knot groups: no route, inputs unowned, Mathlib class unfolded

**Location:** README 1.4: "knot groups are residually finite (`knotGroup_residuallyFinite`: a nontrivial element survives in a finite quotient; Hempel 1987, …)"; `Suggested.lean` lines 154–156.
**Claim:** The target has no route. Its proof (Hempel) needs hyperbolization of knot exteriors, which no layer or supplier provides: GeometricTopology 8.6 states only the geometrization of closed manifolds. The Lean statement also unfolds a class that Mathlib has at the pin.
**Witness:** Mathlib `Group.ResiduallyFinite` (`Mathlib/GroupTheory/ResiduallyFinite.lean:34`) and `residuallyFinite_iff_exists_finiteIndexNormalSubgroup` (same file) exist at the pin. DLVW2022 lines 145–149 call residual finiteness a deep property tied to geometrization. The GeometricTopology README on main states no residual-finiteness result.
**Repair:** Under "From TauCetiRoadmap.GeometricTopology" add: "What GeometricTopology must provide (gap:knot-group-residually-finite): for every smooth knot `K` in `S³` and base point `x` of its complement, `Group.ResiduallyFinite (K.KnotGroup x)` (Hempel 1987; used in Agol 2022, proof of Theorem 1.2)." Delete the residual-finiteness bullet and the unknot sentence of the fourth Check from 1.4, and delete `knotGroup_residuallyFinite` from `Suggested.lean` and its docstring. Under "From Mathlib" cite `Group.ResiduallyFinite` in place of `Subgroup.Normal` and `Subgroup.FiniteIndex`. In the Scope, write "with the inputs of Agol's proof stated in 1.3 and 1.4". Put the slug in the *Needs:* lines of 1.3 and 1.4. Tested: `Group.ResiduallyFinite (K.KnotGroup x)` elaborates at the pins.

## R04 (P2) — The HeegaardFloer gap does not cover Zemke's proof

**Location:** README, "What HeegaardFloer must provide (gap:hfk-concordance-maps): for a decorated smooth concordance `C` … functorial under stacking and the identity on the product concordance."
**Claim:** Zemke's proof of Theorem 1.1, which this roadmap owns, uses link cobordism maps for surfaces in `D² × S²` and `S⁴`, their composition law, the grading-shift formulas and the 2-knot lemma. Concordance maps in `[0, 1] × S³` provide none of these, and HeegaardFloer on main has no link cobordism maps.
**Witness:** Zemke2019 lines 299–313: maps of discs in `D² × S²` and the composition law. Lines 349–358: grading formulas (7)–(8), and `F_{S⁴,S}` invertible by Lemma 2.3. The HeegaardFloer README on main has only F4.5's 3-manifold cobordism maps.
**Repair:** Replace gap:hfk-concordance-maps by: "What HeegaardFloer must provide (gap:link-floer-cobordism-maps): for a decorated link cobordism `(W, F)` between multi-based links in closed oriented 3-manifolds and `s ∈ Spinᶜ(W)`, a map `F_{W,F,s} : HFL̂(Y₀, L₀, s|Y₀) → HFL̂(Y₁, L₁, s|Y₁)`, unchanged by isotopy of `F` rel boundary and satisfying the composition law (Zemke 2019, §2, Definition 2.2). What HeegaardFloer must provide (gap:link-floer-grading-shift): when `s` restricts to torsion structures and the links are null-homologous, `F_{W,F,s}` shifts `gr_w` and `gr_z` by Zemke 2019, §2, equations (7) and (8). What HeegaardFloer must provide (gap:link-floer-two-knot): for a smooth 2-knot `S ⊂ S⁴` with one dividing curve, `F_{S⁴,S} : 𝔽₂ → 𝔽₂` is an isomorphism (Zemke 2019, Lemma 2.3)." In 1.5 add: "Prove on the way that two properly embedded discs in `D² × S²` meeting `S¹ × S²` in the same unknot induce the same map (Zemke 2019, Lemma 3.1)." Put the three slugs in 1.5's *Needs:*, in the Scope and in Layer 1's Dependencies.

## R05 (P2) — Lisca's route uses a plumbing that nobody supplies

**Location:** README 2.1, "*Needs:* 0.1; GeometricTopology 4.10 and 4.4 (the determinant); the lens spaces of `TauCeti/Geometry/Manifold/Instances/LensSpace.lean`; FourManifolds §5.3, gap:donaldson-definite-any-pi1."
**Claim:** The step through Donaldson's theorem glues a rational ball to the negative-definite plumbing `P(p, q)` bounded by `L(p, q)`. No target, supplier section or pinned declaration provides that plumbing. `TauCeti.PlumbingGraph` is a weighted graph with its lattice, not a four-manifold.
**Witness:** Lisca2007 lines 1670–1681: `L(p, q)` bounds the chain plumbing `−a₁, …, −a_n`, with `p/q = [a₁, …, a_n]⁻`, and `X(p, q) = P(p, q) ∪ −W`. Example: `9/2 = [5, 2]⁻`, and `det [[5, −1], [−1, 2]] = 9`.
**Repair:** Add to 2.1: "State as targets: for `p/q = [a₁, …, a_n]⁻` with every `a_i ≥ 2`, the linear plumbing `P(p, q)` of disc bundles over `S²` with Euler numbers `−a₁, …, −a_n` is a smooth compact negative-definite four-manifold bounded by `L(p, q)`, whose intersection lattice is that of `TauCeti.PlumbingGraph` on the weighted chain (Lisca 2007, §9); and, for `p/q ∈ R`, `K(p, q)` bounds a ribbon-immersed disc (Lisca 2007, §8)." Add `TauCeti.LowDimTopology.Plumbing`: `TauCeti.PlumbingGraph` to "From Tau Ceti" and to 2.1's *Needs:*.

## R06 (P3) — `algebraicSet_eq_of_surjOn` is not a headline

**Location:** `Suggested.lean` lines 169–180; README 1.4: "(`algebraicSet_eq_of_surjOn`; Agol 2022, Lemma A.2)" and Check "cannot be dropped in `algebraicSet_eq_of_surjOn`".
**Claim:** The statement names none of this roadmap's objects, so it is not a headline. A README Check names it as a Lean counterpart. Its route (Lemma A.1 and the dimension of polynomial images) has no *Needs:*.
**Witness:** The signature mentions only `MvPolynomial (Fin n) ℝ` and `Fin n → ℝ`. Agol2022 lines 146–147 and 176–177 use Lemma A.1 and the dimension of images. Tau Ceti `TauCeti.semialgebraicDim` (`RealAlgebraic/Semialgebraic/Dimension/Basic.lean:76`).
**Repair:** Delete the theorem from `Suggested.lean` and from its docstring list. In 1.4 write: "- if `Y ⊆ X` are real algebraic sets and a polynomial map sends `Y` onto `X`, then `Y = X` (Agol 2022, Lemma A.2), through the fact that an algebraic subset of an irreducible real algebraic set with the same dimension is the whole set (Agol 2022, Lemma A.1)." Begin the Check with "The inclusion `Y ⊆ X` cannot be dropped:". Add to 1.4's *Needs:* "Tau Ceti `TauCeti.semialgebraicDim`, `TauCeti.IsSemialgebraic.semialgebraicDim_image_comp_le`".

## R07 (P3) — 1.5's *Needs:* omits Gordon's lemma

**Location:** README 1.5, "*Needs:* 1.1, GeometricTopology 4.3, GeometricTopology 4.4, HeegaardFloer 7.6, gap:hfk-concordance-maps, gap:hfk-genus-detection."
**Claim:** The degree bound is proved from the surjection on fundamental groups in 1.3. The *Needs:* line omits 1.3, and the section gives no route for the bound.
**Witness:** FriedlPowell2020 lines 29–31, 37 and 68–69: the polynomial of the injective end divides that of the surjective end, and only the surjection is used. In this README's direction that is `Δ_{K₀} | Δ_{K₁}`, so `deg Δ_{K₀} ≤ deg Δ_{K₁}`.
**Repair:** After "(Gordon 1981, Lemma 3.4)" add: "; it follows from the divisibility `Δ_{K₀} | Δ_{K₁}`, proved from the surjection of 1.3 on Alexander modules (Friedl–Powell 2020, Theorem 1.1)". Make the *Needs:* "1.1, 1.3, GeometricTopology 4.3, GeometricTopology 4.4, HeegaardFloer 7.6", followed by the slugs of R04 and gap:hfk-genus-detection.

## R08 (P3) — Layer 2 Examples: wrong locator, no example

**Location:** README Layer 2, Examples: "Lisca 2007, Corollary 1.3, for the full list of the fractions `p/q` concerned."
**Claim:** The list (the set `R`) is Lisca's Definition 1.1; Corollary 1.3 only refers to it. The section states no example.
**Witness:** Lisca2007 lines 86–99 give Definition 1.1, the set `R`. Line 143 is Corollary 1.3, whose condition (1) only says that `p/q` belongs to `R`.
**Repair:** "- `K(25, 4)` and `K(25, 11)` are ribbon, and `L(25, 4)` and `L(25, 11)` bound rational homology balls: `25 = 5²`, `4 = 5·1 − 1`, `11 = 5·2 + 1` (type (1) of Lisca 2007, Definition 1.1, with Corollary 1.3)."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 `IsRibbonDisc` (sample) | flat disc `Φ₀`; Check-2 disc; disc tangent to `S³`, `(z(3−\|z\|²)/2, (1−\|z\|²)/2, 0)` | `\|z\|²`, Hessian `2·id`, index 0; `ρ(1)=1`, `ρ(1/6)=23/48`, `ρ′(1)=5/4`, Hessian `−id/2`; tangent disc `R′(1)=0` | tangent disc is not a slice disc: `ImmersionAtProp` is a chart normal form, so slice discs are neat | none |
| Conventions, `‖Φ‖²` versus `‖Φ‖` | a critical point with `Φ z ≠ 0` | `Hess(r²) = 2r·Hess(r)` there, `r > 0` | same critical points, same indices | none |
| 1.1 `IsRibbonConcordance` (sample) | `refl K`; `F.symm`; `s ↦ s + 2π` | `τ = t`, `dτ = (0, 1)`; `1 − τ(s, 1−t)`, Hessian `−D′HD′`, index `k ↦ 2−k`; period `2π` | agrees with Agol2022 lines 13–18, Zemke2019 lines 13–17 | none |
| `isRibbon_iff_ribbonLE_unknot` | flat cap on a ribbon concordance; disc minus its lowest minimum | radius `(1+τ)/2`, `dr = ((1+τ)/2)·dτ`, factor in `[1/2, 1]`; neat boundary, finitely many critical points | true; `simp` does not close it | none |
| 1.2 `RibbonLE.trans` (sample) | stack below `1/2`; `t ∈ [1/3, 2/3]`; `refl` stacked with `refl` | `τ(s,3t)/3`, Hessian `[[τ_ss/3, τ_st],[τ_st, 3τ_tt]] = DHD/3`; time `t`; no critical point | agrees with Agol2022 lines 21–22; `simp_all` fails | none |
| 1.3 injective half (sample) | `refl K`; disc minus a minimum; existence of `i` | `(S³∖K)×[0,1]`, isomorphism; `ℤ ↪ π₁`; `F(x,t) = (K₀x, t)` for `t ≤ 0`, slab into slab | true (Zemke2019 lines 21–25); route unowned | R01 |
| 1.3 surjective half | ribbon disc of `K`; ends swapped | `π₁(S³∖K) ↠ π₁(B⁴∖D)`; `ℤ` onto a non-cyclic group impossible | true (DLVW2022 lines 279–281) | R01 |
| `exists_extension_of_isRibbonConcordance` | `refl K`; `N = 0, 1`; `N = 2` | `ρ ∘ pr`; `SO(0)`, `SO(1)` trivial; abelian, factors through `H₁ = ℤ = H₁(Y)` | true (DLVW2022 lines 275–278, `G` compact connected) | R01 |
| `knotGroup_residuallyFinite` | unknot; `infer_instance` | `g ≠ 0` survives in `ℤ/m`, `m > \|g\|`; no instance found | true; unfolds Mathlib's class | R03 |
| `algebraicSet_eq_of_surjOn` | Check; `n = 0`; `T = ∅`; `SurjOn` without `MapsTo` | `x − 1/x` onto `ℝ`, `(1,1) ∈ Y∖X`; both sides in a point; `Y = ℝⁿ = X`; dimension count still forces `Y = X` | true; not a headline | R06 |
| `RibbonLE.antisymm` (sample) | `K`, `K.rotate a`; unknot and a nontrivial slice knot; torus-knot self-cover | time `t`, ribbon both ways, `K(az) ≠ K(z)`; concordant, not ribbon both ways; peripheral degree `d > 1` excluded by "onto" | true (Agol2022 line 36); route incomplete | R02 |
| 1.5 (sample) | `refl`; trefoil; Friedl–Powell direction | equalities; `RibbonLE trefoil unknot` gives `1 ≤ 0`; `Δ_{K₀} \| Δ_{K₁}`, so `deg Δ_{K₀} ≤ deg Δ_{K₁}` | agrees with Zemke2019 lines 67–69, 81–82 | R04, R07 |
| 2.1 Lisca (sample) | `9/2`; `K(3,1)`; `K(5,2)`; `P(9,2)` | `m=3, k=1`, `3·1−1 = 2`; determinants `3`, `5` not squares; `9/2 = [5,2]⁻`, `det = 5·2−1 = 9` | agrees with Lisca2007 lines 86–99, 110–112, 141–147 | R05 |
| Layer 2 Examples | `25/4`, `25/11` | `5·1 − 1 = 4`, `5·2 + 1 = 11`, both coprime to `25` | in `R`, type (1) | R08 |

- Source locators checked against the text: 28 (Agol2022 8, Zemke2019 7, Lisca2007 7, Livingston2005 3, DLVW2022 1, FriedlPowell2020 1, DunfieldGong2025 1). Gordon1981's 3 were checked only through Agol2022 lines 53, 63, 87 and Zemke2019 lines 21–27, 67–69.
- Mathlib at the pin: `Group.ResiduallyFinite` (GroupTheory/ResiduallyFinite.lean:34), `ImmersionAtProp` (Geometry/Manifold/Immersion.lean:143), `MvPolynomial.zeroLocus` (RingTheory/Nullstellensatz.lean:39).
- Tau Ceti at the pin: `IsSmoothSliceDisc` (KnotTheory/Slice/Basic.lean:138, neatness 33–40); `Concordance` (SmoothEmbedding/Concordance.lean:109, with `refl_apply` :239, `symm_apply` :254, `trans_apply_of_le` :304); `IsCollaredTrack` (CollaredTrack.lean:81); `HasNondegenerateCriticalPointsOn` (Morse/Basic.lean:149); `morseIndex` (Morse/Index.lean:162).
- More Tau Ceti: `SmoothAmbientIsotopic` (SmoothAmbientIsotopy/Basic.lean:72); `KnotGroup` (KnotGroup.lean:96); `unknot` (SmoothCircle.lean:294); `rotate` (SmoothCircle.lean:135); `LensSpace` (UniversalCover/LensSpace/Basic.lean:186). There is no Seifert genus or Alexander polynomial of a smooth knot, only `sliceGenus` and `KnotTheory.alexander` of a matrix.
- Cross-roadmap citations resolved: GeometricTopology 3.4, 4.3, 4.4, 4.10, 5.1, 6.1, 6.2, 8.1, 8.3.1 and 11.2, on main and at #1797; HeegaardFloer 7.6 on main; FourManifolds §5.3 at #936, the simply connected case. None breaks.
- Gate: the worker's run reports every check at 0, the build included. My rerun reports every text check at 0, plus `depcheck: NOT IN ORDER: RibbonKnots (insert it after its last supplier)`, which is expected before insertion. The dependency check printed `depcheck: 247 roadmaps, 2236 edges, 0 problem(s)`: no UPWARD, no CYCLE.
- Elaboration: `lake env lean` on `Suggested.lean` gives 8 `sorry` warnings and no error. `#check @` on all 17 declarations: only `radialFunction` drops `[InnerProductSpace ℝ E]`, which its body does not use; the others match the README's generality.
- One-tactic probe: `simp`, `simp_all` and `infer_instance` close none of the 8 theorems.

Overlap check: read GeometricTopology (main; #1797, #1791), FourManifolds (#936), CombinatorialHeegaardFloer (main) and DiagrammaticCoherence (main). Owners of the shared objects:
- knots, concordance, Seifert genus, Alexander polynomial, two-bridge knots, exteriors and Waldhausen realization: GeometricTopology, cited here;
- knot Floer homology: HeegaardFloer 7.6; genus detection is asked of it, and CombinatorialHeegaardFloer item 8 states only the genus bound;
- Donaldson's theorem: FourManifolds §5.3;
- ribbon discs, ribbon concordance and Lisca's theorem: RibbonKnots; no other roadmap and neither pinned library defines them.

Source independence: 33 passages compared with 7 sources. No passage is shared beyond forced vocabulary: "representation varieties of the knot groups" (Agol2022 line 9, 6 words) and "is a smooth rational homology ball" (Lisca2007 lines 105–106, 6 words). Largest share Agol2022, 8 of 35 locators. Contents compared with Agol2022 (§1 introduction, §2 proofs, §3 conclusion, Appendix A) against Layers 0–2: independent.

## Not verifiable

- Gordon1981 (§1, Lemmas 3.1, 3.2, 3.4): doi:10.1007/BF01458281 resolves only to a paywalled page (sources service: uncertified). Checked through Agol2022 and Zemke2019.
- Hempel1987 (doi:10.1515/9781400882083-018): the De Gruyter landing page has no legal open copy. Checked through Agol2022 line 78 and DLVW2022 lines 145–149.
- Fox1962 (Prentice-Hall volume): not fetched; cited in the form of Livingston2005 §10, Problem 1 (line 862), which was checked.
- Gompf–Scharlemann–Thompson 2010: not fetched; research context only, checked against its title.
- Gerstenhaber–Rothaus 1962 and Waldhausen 1968 (named in R01, R02): not read; their use was checked in DLVW2022 lines 283–300 and Agol2022 lines 89–93.

## Source issues

- **Misprint** in Agol2022 at the proof of Theorem 1.2, p. 2: the source calls the self-concordance one from the time-0 copy to the time-1 copy, the reverse of its §1 convention; it should keep the §1 wording; affects nothing.
- **Misprint** in Zemke2019 at §1, equation (3), p. 2: the genus formula names the Alexander grading `i`, the letter equation (1) uses for the Maslov grading; it should read `max{j : HFK̂(K, j) ≠ 0}`; affects nothing.

## For the human reviewers

- none
