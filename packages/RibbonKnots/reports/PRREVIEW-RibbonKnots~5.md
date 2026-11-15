# Review of RibbonKnots (pull request #2339 at d65240b)

**Verdict:** needs changes

**Previous review (6c2523c), finding by finding.**

| Previous | Status at this head | Passage |
|---|---|---|
| R01 handle structure, Gerstenhaber–Rothaus | repaired | README lines 254–262: "Prove that the exterior of a ribbon concordance … Prove the Gerstenhaber–Rothaus theorems."; line 275: gap:knot-group-residually-finite |
| R02 Waldhausen covering, isotopy bridges | repaired | README lines 112–116 (gap:knot-group-peripheral-injection), 292–301, 316–318 |
| R03 residual finiteness | repaired | README lines 108–110; `knotGroup_residuallyFinite` deleted; line 72 cites `Group.ResiduallyFinite` |
| R04 HeegaardFloer gaps | repaired | README lines 122–132, 345–347 |
| R05 plumbing | repaired as proposed; the proposed text leaves two holes (R01, R02 below) | README lines 382–387 |
| R06 `algebraicSet_eq_of_surjOn` | repaired | deleted from `Suggested.lean`; README lines 309–311, 332 |
| R07 1.5 *Needs:* | repaired | README lines 340–342, 350 |
| R08 Layer 2 Examples | repaired | README lines 410–412 |

## R01 (P2) — A ribbon-immersed disc is not a ribbon disc of 0.1, and nothing connects them

**Location:** README 2.1, lines 386–387: "for `p/q ∈ R` with `p` odd, `K(p, q)` bounds a ribbon-immersed disc (Lisca 2007, §8)".
**Claim:** `IsRibbon` (0.1) is a Morse condition on an embedded disc in the ball. A ribbon-immersed disc in `S³` is another object, not defined here. No target, supplier section or pinned declaration turns one into the other, so "`p/q ∈ R` ⇒ `K(p, q)` is ribbon" has no route.
**Witness:** Lisca2007 lines 133–135: the object is a ribbon immersion `Σ → S³`. Lines 103–104: pushing its interior into `B⁴` is a separate step. README 0.1 states only the radial condition; GeometricTopology on main has no ribbon immersion.
**Repair:** Add to 0.1, after "Define `IsRibbon K` as the existence of a ribbon disc.": "Define a ribbon immersion of the disc in `S³`: a smooth immersion `g : D² → S³`, injective on the boundary circle, whose double points form finitely many disjoint arcs, the preimage of each arc being two disjoint arcs of `D²`, one in the open disc and one with exactly its endpoints on the boundary circle. Prove that a knot in `S³` bounding a ribbon-immersed disc, that is, equal to `g` on the boundary circle for such a `g`, is ribbon: push the interior of the disc radially into the ball, deeper along the interior preimage arcs (Lisca 2007, §1)." Add 0.1 to the route of 2.1: "…bounds a ribbon-immersed disc (Lisca 2007, §8), hence is ribbon by 0.1."

## R02 (P2) — The set `R` is never defined, and Lisca's Theorem 1.2 is not a target

**Location:** README 2.1, line 386: "for `p/q ∈ R` with `p` odd"; line 398: "`9/2` belongs to Lisca's set `R`"; line 380: "(Lisca 2007, Corollary 1.3, from Theorem 1.2 through Donaldson's diagonalization theorem)".
**Claim:** A target, two Checks and the Examples use `R`, which the README does not define, so none of them is determined. The step "`L(p, q)` bounds a rational homology ball ⇒ `p/q ∈ R`", on which "slice ⇒ ribbon" rests, is not stated as a target.
**Witness:** Lisca2007 lines 86–99 (Definition 1.1) and 129–136 (Theorem 1.2, (1) ⇔ (3)). In the README, `R` occurs only at lines 386 and 398, and "type (1)" at lines 398 and 411.
**Repair:** Insert in 2.1 before "State as targets": "Let `R` be the smallest set of fractions `p/q`, `p > q > 0` coprime, that is closed under `p/q ↦ p/(p − q)` and `p/q ↦ p/q′` (`0 < q′ < p`, `q q′ ≡ 1 mod p`) and contains every `m²/q` with `0 < q < m²`, `q` coprime to `m` and of one of three types: (1) `q = mk ± 1` with `0 < k < m` and `gcd(m, k) = 1`; (2) `q = d(m ± 1)` with `d > 1` dividing `2m ∓ 1`; (3) `q = d(m ± 1)` with `d > 1` odd dividing `m ± 1` (Lisca 2007, Definition 1.1). Prove that for coprime `p > q > 0` the lens space `L(p, q)` smoothly bounds a rational homology ball if and only if `p/q ∈ R` (Lisca 2007, Theorem 1.2): gluing the ball to `P(p, q)` and to `P(p, p − q)` gives closed negative-definite four-manifolds, whose diagonal lattices contain the two plumbing lattices, and the pairs of such embeddings are classified (Lisca 2007, §§2–7 and §9)." Tested: `9/2`, `m = 3`, `k = 1`, `3·1 − 1 = 2`, type (1).

## R03 (P3) — Research context: "fibered slice knots" is not what the source gives

**Location:** README Research context, lines 427–428: "Gompf, Scharlemann and Thompson (2010) give fibered slice knots that are potential counterexamples."
**Claim:** The source's potential counterexamples are band sums of the two components of slice links; it does not say they are fibered. "Fibered" in its title refers to components of the links.
**Witness:** GST2010 (arXiv:1103.1601) lines 67–71: the links `L_{n,k}` are slice, slice knots come from band-summing the two components, and for `n ≥ 3` nothing suggests they are ribbon.
**Repair:** "Gompf, Scharlemann and Thompson (2010) obtain slice knots with no known ribbon disc by banding together the two components of slice links that contain the square knot."

## R04 (P3) — A locator into a work the References do not list

**Location:** README, gap:hfk-genus-detection, line 135: "(Ozsváth–Szabó, Theorem 1.2, as recalled in Zemke 2019, §1)".
**Claim:** The locator names no work, and the References have no entry by Ozsváth and Szabó.
**Witness:** Zemke2019 line 70 cites [OS04, Theorem 1.2]; its bibliography gives [OS04] as *Holomorphic disks and genus bounds*. README lines 437–462 list twelve works, none of them this one.
**Repair:** Write "(Ozsváth–Szabó 2004, Theorem 1.2, as recalled in Zemke 2019, §1)" and add to the References: "P. Ozsváth, Z. Szabó, *Holomorphic disks and genus bounds*, Geom. Topol. 8 (2004), 311–334; doi:10.2140/gt.2004.8.311; arXiv:math/0311496."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 `IsRibbonDisc` (sample) | flat disc; second Check's disc | `\|z\|²`, Hessian `2·id`, index 0; `ρ(1) = 1`, `ρ(1/6) = 23/48`, `ρ − s/4` has discriminant `1/4 − 3/2 < 0`, `ρ′(1) = 5/4`, Hessian at 0 `−id/2` | agrees with Livingston2005 lines 135–137 | R01 adds the immersed form |
| Conventions, `‖Φ‖²` versus `‖Φ‖` | critical point with `r > 0` | `Hess(r²) = 2r·Hess(r)` | same points, same indices | none |
| 1.1 `IsRibbonConcordance` (sample) | `refl K`; `F.symm`; a track dipping below time 0 | `τ = t`, `dτ = (0, 1)`; `1 − τ(s, 1−t)`, index `k ↦ 2−k`; excluded by `snd_apply_mem_Ioo` | agrees with Agol2022 lines 13–18, Zemke2019 lines 13–17 | none |
| `isRibbon_iff_ribbonLE_unknot` | two minima at the lowest level; critical points near `t = 0` | sublevel is two discs, an unlink, until one minimum is pushed up; `∂τ/∂t = 1` on the collar, so none near the ends | true; the route's "lowest minimum" needs it unique, by a small radial perturbation | none |
| 1.2 `RibbonLE.trans` (sample) | `t ≤ 1/2`; `t ∈ [1/3, 2/3]` | `τ(s, 3t)/3`, Hessian `[[τ_ss/3, τ_st], [τ_st, 3τ_tt]] = DHD/3`; `3t ≥ 1` or `3t − 2 ≤ 0`, both collars | true; agrees with Agol2022 lines 21–22 | none |
| 1.3 injective half (sample) | `refl K`; unknot to `K`; existence of `i` | isomorphism; `ℤ ↪ π₁`; track meets `S³ × {0}` only in `K₀ × {0}` (collar and open slab) | Zemke2019 lines 21–27; DLVW2022 lines 292–300 | none |
| 1.3 surjective half | ends swapped on unknot to `K` | `ℤ` onto a non-cyclic group: impossible | DLVW2022 lines 279–281; Agol2022 line 53 | none |
| 1.3 Gerstenhaber–Rothaus | `m = 0`; `m = 1`, equation `x² = c` in `SO(2)`; exponent sum 0, `x c x⁻¹ = c′` | empty system solved; determinant 2, a square root exists; non-conjugate `c, c′` have no solution | hypothesis `det ≠ 0` needed and present; DLVW2022 lines 283–291, 297–298 | none |
| `exists_extension_of_isRibbonConcordance` | `refl K`; `N = 0, 1`; `O(N)` instead | `ρ ∘ pr`; trivial groups; `O(N)` is not connected, outside Theorem 1 | true for `SO(N)`, compact connected (DLVW2022 line 268) | none |
| `RibbonLE.antisymm` (sample) | `K`, `K.rotate a`; reversed orientation; torus-knot self-cover | time `t` both ways, `K(az) ≠ K(z)`; oriented `μ`, `λ` carried along the annulus, so the parametrized conclusion holds; degree `d > 1` excluded by "onto" | true (Agol2022 lines 36, 87–95, 99–106) | none |
| 1.4, Lemma A.2 and its Check | `X = ∅`; `Y = {xy = 1}`, `φ = (x − y, 0)` | `Y = ∅`; `x − 1/x` onto `ℝ`, `(1, 1) ∈ Y ∖ X` | agrees with Agol2022 lines 146–147, 164–172 | none |
| 1.5 (sample) | `refl`; trefoil to unknot; Friedl–Powell direction | equalities; `1 ≤ 0` false; `Δ_L \| Δ_J` with `J` the surjective end `K₁`, so `Δ_{K₀} \| Δ_{K₁}` | Zemke2019 lines 55–57, 67–69, 81–82, 241–244, 314–320; FriedlPowell2020 line 37 | R04 |
| 2.1 Lisca (sample) | `9/2`; `K(3,1)`; `K(5,2)`; `P(9,2)`; `25/4`, `25/11`; mirror `p/(p−q)` | `3·1 − 1 = 2`; 3, 5 not squares; `5 − 1/2 = 9/2`, `det [[−5,1],[1,−2]] = 9`; `5·1 − 1`, `5·2 + 1`; `R` closed under `f`, so the mirror convention is immaterial | Lisca2007 lines 86–99, 102–112, 141–147, 1670–1672 | R01, R02 |
| Research context | Dunfield–Gong counts; Casson's observation | 352.2 million, about 11,400, slice ones ribbon; `K # J` ribbon | DunfieldGong2025 lines 9–15; Livingston2005 lines 138–139, 862 | R03 |

- Source locators checked against the text: 37 (Agol2022 10, Zemke2019 10, Lisca2007 9, Livingston2005 3, DLVW2022 2, FriedlPowell2020 1, DunfieldGong2025 1, GST2010 1). Gordon1981's four were checked only through Agol2022 lines 53, 63, 87 and Zemke2019 lines 21–27, 67–69.
- Tau Ceti at the pin: `IsSmoothSliceDisc` (KnotTheory/Slice/Basic.lean:138), `Concordance` (Geometry/Manifold/SmoothEmbedding/Concordance.lean:109; `refl` :232, `symm_apply` :254, `trans_apply_of_le` :304, `ofDiffeotopy` :400), `IsCollaredTrack` (Topology/Homotopy/CollaredTrack.lean:81), `HasNondegenerateCriticalPointsOn` (Analysis/Calculus/Morse/Basic.lean:149), `morseIndex` (Morse/Index.lean:162), `KnotGroup` (KnotTheory/KnotGroup.lean:96), `unknot` (KnotTheory/SmoothCircle.lean:294).
- More at the pins: `PlumbingGraph` (LowDimTopology/Plumbing/IntersectionForm.lean:89, `intersectionForm` :171), `semialgebraicDim` (Dimension/Basic.lean:76), `semialgebraicDim_image_comp_le` (Dimension/Projection.lean:89), `LensSpace` (defined in AlgebraicTopology/UniversalCover/LensSpace/Basic.lean:186, its manifold structure in the cited module), Mathlib `Group.ResiduallyFinite` (GroupTheory/ResiduallyFinite.lean:34). Neither library has a ribbon disc, a ribbon concordance or a ribbon immersion.
- Cross-roadmap citations resolved: GeometricTopology 3.4, 4.3, 4.4, 4.10, 5.1, 6.1, 6.2, 8.1 (the extension over the fillings is in its "Meridian uniqueness" paragraph), 8.3.1 and 11.2 on main; HeegaardFloer 7.6 on main; FourManifolds §5.3 at its open head (simply connected case, so the gap asks for nothing it has). The heads of the open GeometricTopology revisions were not among the checkouts given: ownership against them was not checked beyond the overlap list, which reports no dropped id.
- Dependency check: `depcheck: 245 roadmaps, 2232 edges, 0 problem(s)`; no UPWARD, no CYCLE. Gate: the worker's run reports every check at 0, the build included; my rerun differs only by `depcheck: NOT IN ORDER: RibbonKnots`, expected before insertion. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean`: 6 `sorry` warnings, no error. Elaborated types of the 15 declarations compared with the README: `radialFunction` drops `[InnerProductSpace ℝ E]`, which its body does not use; the rest match.
- One-tactic probe (`rfl`, `infer_instance`, `trivial`, `simp_all`, `exact?`): closes none of the 6 theorems. The same-name lead for `RibbonLE.trans` is a false hit.
- Pull-request text against the head: 6 headlines, 5 Tau Ceti imports, 7 gaps, the layer summary and the list of sources all agree.

Overlap check: read GeometricTopology (main), HeegaardFloer (main), CombinatorialHeegaardFloer (main) and FourManifolds (open). Knots, concordance, Seifert genus, Alexander polynomial, two-bridge knots, exteriors and Waldhausen realization: GeometricTopology, cited. Knot Floer homology: HeegaardFloer 7.6, cited. Donaldson's theorem: FourManifolds §5.3, cited. Ribbon discs, ribbon concordance and Lisca's theorem: RibbonKnots only.

Source independence: 22 passages compared with 8 sources, none shared beyond forced statements (longest run 5 words, "for all but about 11,400", DunfieldGong2025 lines 12–13); largest share Agol2022 and Zemke2019, 11 of 46 locators each; contents compared with Agol2022 (§1, §2, §3, Appendix A) and Zemke2019 (§1–§4): independent.

## Not verifiable

- Gordon1981 (§1, Lemmas 3.1, 3.2, 3.4): the DOI resolves only to a paywalled page (sources service: uncertified).
- Gerstenhaber–Rothaus 1962 (Theorems 1 and 2): the publisher's page refused the sources service; checked through DLVW2022 lines 283–300 and Agol2022 lines 64–66.
- Hempel1987: no legal open copy; its use was checked in Agol2022 line 78 and DLVW2022 lines 145–149.
- Fox1962: not fetched; cited in the form of Livingston2005 line 862, which was checked.
- Ozsváth–Szabó 2004, Theorem 1.2 (R04) and Waldhausen 1968: not read; checked through Zemke2019 lines 70–76 and Agol2022 lines 89–93.

## Source issues

- **Misprint** in Agol2022 at the proof of Theorem 1.2, p. 2: the source calls the self-concordance one from the time-0 copy to the time-1 copy, the reverse of its §1 convention; it should keep the §1 wording; affects nothing.
- **Misprint** in Zemke2019 at §1, equation (3), p. 2: the genus formula indexes the Alexander grading by the letter that equation (1) assigns to the Maslov grading; it should use the Alexander index `j`; affects nothing.

## For the human reviewers

- none
