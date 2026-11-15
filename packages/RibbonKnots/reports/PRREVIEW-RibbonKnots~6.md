# Review of RibbonKnots (pull request #2339 at a688830)

**Verdict:** needs changes

**Previous review (d65240b), finding by finding.**

| Previous | Status at this head | Passage |
|---|---|---|
| R01 ribbon-immersed disc not connected to 0.1 | repaired | README lines 176–189: "Define a ribbon immersion of the disc in `Sⁿ` … Prove that a knot `K` bounding a ribbon-immersed disc … is ribbon"; line 432: "hence is ribbon by 0.1"; `IsRibbonImmersion`, `isRibbon_of_isRibbonImmersion` in `Suggested.lean` |
| R02 set `R` undefined, Theorem 1.2 not a target | repaired | README lines 418–426: "Let `R` be the smallest set of fractions … Prove that for coprime `p > q > 0` the lens space `L(p, q)` smoothly bounds a rational homology ball if and only if `p/q ∈ R`" |
| R03 "fibered slice knots" | repaired | README lines 474–475: "obtain slice knots with no known ribbon disc by banding together the two components of slice links that contain the square knot" |
| R04 locator without a work | repaired | README line 138: "(Ozsváth–Szabó 2004, Theorem 1.2, as recalled in Zemke 2019, §1)"; References lines 507–508 |

## R01 (P2) — The route of 1.4 does not cover the unknot, where both cited suppliers exclude the exterior

**Location:** TauCetiRoadmap/RibbonKnots/README.md, 1.4, lines 333–334: "Waldhausen's realization gives a homeomorphism of the exteriors, which extends over the meridional fillings and is smoothed to an ambient isotopy".
**Claim:** `RibbonLE.antisymm` is stated for all knots, and the third Check of 1.4 takes `K₀ = unknot`. There the exterior is a solid torus, which GeometricTopology 8.3.1 excludes, and the extension theorem of 8.1 is stated for nontrivial knots only. The route has no step for this case.
**Witness:** GeometricTopology README (main), line 7300: a solid torus is not sufficiently large and "the hypotheses exclude it"; line 7145: the extension theorem is "for nontrivial K, J". Instance: `K₀ = unknot`, `RibbonLE` both ways.
**Repair:** After "By gap:knot-group-peripheral-injection this injection is an isomorphism." insert: "If `K₀` or `K₁` is the unknot, both groups are then `ℤ`, so both knots are smoothly ambient isotopic to the unknot (GeometricTopology 8.1: a knot in `S³` with knot group `ℤ` is the unknot), hence to each other; the parametrizations agree up to isotopy because every orientation-preserving diffeomorphism of the circle is isotopic to the identity and a rotation of `S³` carries the great circle to its reverse. Otherwise both exteriors have incompressible boundary, and" (continue with "Waldhausen's realization gives …"). In *Needs:*, write "8.1 (a knot with group `ℤ` is the unknot; extension over the meridional filling)". Tested on the instance: the group of `K₁` embeds in `ℤ` and has `H₁ = ℤ`, so it is `ℤ`.

## R02 (P3) — 0.1, sixth Check: one crossing change does not give a one-clasp disc

**Location:** TauCetiRoadmap/RibbonKnots/README.md, lines 218–219: "The trefoil `K(3, 1)` becomes the unknot after one crossing change, so it bounds an immersed disc whose only singularity is one clasp".
**Claim:** The conclusion holds for the trefoil; the inference does not. A disc with `c` clasps smooths to a Seifert surface of genus `c`, so the clasp number is at least the genus, whatever the unknotting number.
**Witness:** `6₂`: unknotting number 1, Alexander polynomial `t⁴ − 3t³ + 3t² − 3t + 1`, genus 2, so every clasp disc has at least 2 clasps.
**Repair:** "The trefoil `K(3, 1)` is a twisted double of the unknot, so it bounds an immersed disc whose only singularity is one clasp, …" (the sentence continues unchanged). Tested: the trefoil is the twist knot with one full twist; genus 1, one clasp.

## R03 (P3) — The description is written for an earlier head

**Location:** pull request description: "It states 6 headlines: `isRibbon_iff_ribbonLE_unknot` (1.1), …"; "The definitions have real bodies: `radialFunction`, …, `trackComplement`."; "6 `sorry` warnings"; "close none of the 6 statements".
**Claim:** The head states 7 theorems and one more definition; Layer 0 and Layer 2 have targets the description does not name; the docstring lists three items not stated.
**Witness:** `Suggested.lean` lines 93 (`IsRibbonImmersion`) and 110 (`isRibbon_of_isRibbonImmersion`); docstring lines 41–43; README lines 176–189 and 418–426. Elaboration at this head: 7 `sorry` warnings.
**Repair:** "It states 7 headlines: `isRibbon_of_isRibbonImmersion` (0.1), `isRibbon_iff_ribbonLE_unknot` (1.1), …"; add `IsRibbonImmersion` to the definitions; in the Layer 0 bullet add "ribbon immersions of the disc and the push-in of a ribbon-immersed disc to a ribbon disc (Lisca 2007, Theorem 1.2 (2), §1, §9)"; in the Layer 2 bullet add "Lisca's set `R` (Definition 1.1) and his Theorem 1.2 on lens spaces bounding rational homology balls"; add the third unstatable item, "Lisca's Theorem 1.2, lacking a manifold structure on the boundary of a manifold with boundary"; add `Manifold.IsImmersion` to the suppliers and Lisca §§2–7 and Ozsváth–Szabó 2004 (through Zemke 2019, §1) to the sources; write "7 `sorry` warnings" and "none of the 7 statements".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1 `IsRibbonDisc` (sample) | flat disc; second Check | `\|z\|²`, Hessian `2·id`, index 0; `ρ(1) = 1`, `ρ(1/6) = 23/48 > 1/4`, `ρ − 1 = (3s+2)(s−1)/4`, `ρ′(1) = 5/4`, Hessian at 0 `−id/2` | agrees with Livingston2005 lines 135–137 | none |
| 0.1 `IsRibbonImmersion` | `m = 0` cap; clasp; boundary injectivity; two `α` arcs with a common image | `((1+s)/2)²`, derivative `(1+s)/2 > 0`, Hessian `id`; clasp has one boundary endpoint per arc, excluded; a boundary double pair would need an `α` point on the circle; forces `α_j s = β_k u`, excluded | determines the object; Lisca2007 line 135 | R02 (justification of the clasp Check) |
| `isRibbon_of_isRibbonImmersion` | `n = 1`; `n = 2`; `n ≥ 4`; tangential sheets; arcs only continuous | no immersion `D² → S¹`, vacuous; double set of a codimension-0 immersion is open, so `m = 0`; `Φ = (1−d) g` with `d∘α_i > d∘β_i`: `Φ z = Φ w` forces `g z = g w` and `d z = d w`; `‖Φ‖² = (1−d)²`, `d` a base `ε(1−\|z\|²)` plus peaks on disc neighbourhoods of the `α_i` (maxima and saddles of `d`, no minimum) | true at the stated generality; Lisca2007 lines 103–104, 1657–1659 | none |
| Conventions, direction | Agol, Zemke, Friedl–Powell | `K₀` at time 0, indices 0 and 1 in all three; Agol and Gordon say "from `K₁` to `K₀`", Zemke "from `K₀` to `K₁`" | Agol2022 lines 13–18; Zemke2019 lines 13–17, 26–27 | none |
| 1.1 `IsRibbonConcordance`, `isRibbon_iff_ribbonLE_unknot` (sample) | `refl K`; `F.symm`; orientation of the unknot end | `τ = t`, `dτ = (0, 1)`; `1 − τ(s, 1−t)` (pin: `symm_apply`), index `k ↦ 2−k`; `SO(4)` carries any parametrized great circle to `unknot` | true; Zemke2019 lines 16–17 | none |
| 1.2 `RibbonLE.trans` (sample) | `t ≤ 1/2`; `t > 1/2`; `1/3 ≤ t ≤ 2/3` | pin: `((F(x,3t)).1, (F(x,3t)).2/3)` and `((G(x,3t−2)).2 + 2)/3`; Hessian `D H D/3`, `D = diag(1,3)`; critical values in `(0,1/3)` and `(2/3,1)` | true; Agol2022 lines 21–22 | none |
| 1.3 Gordon's lemma, both halves (sample) | `refl K`; unknot to `K`; ends swapped | isomorphisms; `ℤ ↪ π₁`; `ℤ` onto a non-cyclic group impossible | Zemke2019 lines 21–27; DLVW2022 lines 275–300; Agol2022 lines 53, 63 | none |
| 1.3 Gerstenhaber–Rothaus | `m = 0`; `x² = c` in `SO(2)`; `x c x⁻¹ = c′` | empty system; determinant 2, a square root exists; exponent sum 0, no solution for non-conjugate `c, c′` | `det ≠ 0` needed and present; DLVW2022 lines 283–291, 296–298 | none |
| `exists_extension_of_isRibbonConcordance` | `refl K`; `N = 0, 1` | `ρ ∘ pr`; trivial groups | true; Agol2022 lines 63–69; DLVW2022 line 268 (`G` compact connected) | none |
| `RibbonLE.antisymm` (sample) | `K`, `K.rotate a`; `K₀ = unknot`; torus-knot self-covers | time `t` both ways, maps differ; solid-torus exterior outside 8.3.1 and 8.1's extension; excluded by "onto" on peripheral subgroups | statement true (Agol2022 lines 36, 87–95, 99–106); route incomplete at the unknot | R01 |
| 1.4 Lemma A.2 and its Check | `Y = {xy = 1}`, `φ = (x−y, 0)` | `x − 1/x` onto `ℝ`; `(1,1) ∈ Y ∖ X` | Agol2022 lines 146–147, 164–172 | none |
| 1.5 (sample) | `refl`; trefoil to unknot; direction of divisibility | equalities; `1 ≤ 0` false; Friedl–Powell `J` is the surjective end `K₁`, so `Δ_{K₀} \| Δ_{K₁}`; injectivity not used | Zemke2019 lines 55–57, 67–69, 81–82, 241–244, 314–320; FriedlPowell2020 lines 37, 68–69 | none |
| 2.1 Lisca (sample) | `9/2`; `25/4`, `25/11`; `K(3,1)`, `K(5,2)`; `P(9,2)`; types (2), (3) at `m = 3` | `3·1−1 = 2`; `5·1−1`, `5·2+1`; 3, 5 not squares; `5 − 1/2 = 9/2`, `det [[−5,1],[1,−2]] = 9`; `d ∈ {5, 7}` gives `q = 20, 14 > 9`, none | Lisca2007 lines 86–99, 102–112, 129–136, 141–147, 1649–1690 | none |
| gaps (7) | each against its supplier | GeometricTopology main: no residual finiteness, 8.3.1 item 3 takes an isomorphism; HeegaardFloer 7.6: no link cobordism maps, no genus detection; FourManifolds §5.3 (line 2550): simply connected only | precise, minimal, each with a named supplier | none |

- Source locators checked against the text: 31 (Agol2022 9, Zemke2019 9, Lisca2007 8, Livingston2005 3, DLVW2022 1, FriedlPowell2020 1).
- Tau Ceti at the pin: `IsSmoothSliceDisc` (KnotTheory/Slice/Basic.lean:138), `Concordance` (Geometry/Manifold/SmoothEmbedding/Concordance.lean:109; `refl_apply` :239, `symm_apply` :254, `trans_apply_of_le` :304, `trans_apply_of_lt` :310, `ofDiffeotopy` :400), `IsCollaredTrack` (Topology/Homotopy/CollaredTrack.lean:81), `HasNondegenerateCriticalPointsOn` (Analysis/Calculus/Morse/Basic.lean:149), `morseIndex` (Morse/Index.lean:162), `unknot` (KnotTheory/SmoothCircle.lean:294).
- Mathlib at the pin: `Manifold.IsImmersion` (Geometry/Manifold/Immersion.lean:802; `ImmersionAtProp` :143 asks for the normal form on the chart's target only, so half-space charts of the disc are admitted), `Group.ResiduallyFinite` (GroupTheory/ResiduallyFinite.lean). Neither library has a ribbon disc, ribbon immersion or ribbon concordance; Tau Ceti has no Seifert genus or Alexander polynomial of a smooth circle embedding (KnotTheory/Alexander.lean takes a matrix; Slice/Genus.lean is the slice genus) and no two-bridge knot.
- Cross-roadmap citations resolved: GeometricTopology 3.4, 4.3, 4.4, 4.10, 5.1, 6.1, 6.2, 8.1, 8.3.1, 11.2 and HeegaardFloer 7.6 on main; FourManifolds §5.3 at its open head. GeometricTopology uses "ribbon disc" (Hypothesis 6.3) without defining it: no second owner.
- Dependency check: `depcheck: 245 roadmaps, 2230 edges, 0 problem(s)`; no UPWARD, no CYCLE; RibbonKnots follows FourManifolds in the order. Gate: every check at 0, the build included. No change outside the folder.
- Elaboration of `Suggested.lean`: 7 `sorry` warnings, no error. `#check @name` for the 17 declarations compared with the README: `radialFunction` drops `[InnerProductSpace ℝ E]`, which its body does not use; the rest match.
- One-tactic probe (`rfl`, `trivial`, `simp_all`, `infer_instance`, `assumption`, `constructor <;> assumption`) closes none of the 7 theorems. The same-name lead for `RibbonLE.trans` is a false hit.
- Headlines: 0.1 push-in, 1.1, 1.2, 1.3 (two halves), 1.4 (extension, antisymmetry) stated; 1.5 and 2.1 named in the docstring with the missing carriers, confirmed missing at the pins.

Overlap check: read GeometricTopology (main; the open revisions only by search), HeegaardFloer (main), CombinatorialHeegaardFloer (main), FourManifolds (open). Knots, concordance, Seifert genus, Alexander polynomial, two-bridge knots, exteriors, Waldhausen realization: GeometricTopology, cited. Knot Floer homology: HeegaardFloer 7.6, cited. Donaldson's theorem: FourManifolds §5.3, cited. Ribbon discs, ribbon immersions, ribbon concordance, Lisca's theorem: RibbonKnots only.

Source independence: 24 passages compared with 6 sources, none shared beyond forced statements (the three types of Lisca's Definition 1.1 are formulas); largest share Lisca2007, 14 of 52 locators; contents compared with Lisca2007 (§1–§9): independent, Layer 2 is one section.

## Not verifiable

- Gordon1981 (§1, Lemmas 3.1, 3.2, 3.4): paywalled; checked through Agol2022 lines 53, 63, 87 and Zemke2019 lines 21–27, 67–69.
- Gerstenhaber–Rothaus 1962 (Theorems 1 and 2): not readable; checked through DLVW2022 lines 283–300 and Agol2022 lines 64–66.
- Hempel1987, Waldhausen 1968, Ozsváth–Szabó 2004 (Theorem 1.2), Fox1962: not read; their use was checked in Agol2022 lines 78, 89–93, Zemke2019 lines 70–76 and Livingston2005 line 862.
- Lisca2007: read in the arXiv version; its numbering was not compared with the Geom. Topol. text.
- Gompf–Scharlemann–Thompson 2010 and Dunfield–Gong 2025 (Research context): not fetched again; the sentences are those checked at d65240b.

## Source issues

- **Misprint** in Agol2022 at the proof of Theorem 1.2, p. 2: the source calls the self-concordance one from the time-0 copy to the time-1 copy, the reverse of its §1 convention; it should keep the §1 wording; affects nothing.
- **Misprint** in Zemke2019 at §1, equation (3), p. 2: the genus formula indexes the Alexander grading by the letter that equation (1) assigns to the Maslov grading; it should use the Alexander index `j`; affects nothing.
- **Misprint** in Lisca2007 at §8, first display (arXiv version, p. 33): the continued-fraction coefficients are bounded below up to an index `h` that is not defined; it should be the last index `n`; affects nothing.

## For the human reviewers

- none
