# Review of RibbonKnots (pull request #2339 at 1b8c671)

**Verdict:** needs changes

## R01 (P3) — The new case split of 1.4 uses two GeometricTopology results that the README never names as supplied

**Location:** TauCetiRoadmap/RibbonKnots/README.md, line 337: "Otherwise both exteriors have incompressible boundary"; lines 105–107: "section 8.1, the extension of a homeomorphism of exteriors over the meridional fillings"; Scope, lines 31–33 (same wording for 8.1).
**Claim:** The changed route of 1.4 now uses two results. The first is 8.1's knot-group theorem, which neither Scope nor the supplier contract lists. The second is that the exterior of a nontrivial knot is irreducible, has incompressible boundary and is Haken (the hypotheses of 8.3.1). GeometricTopology owns that in 8.5.2, which the README never cites.
**Witness:** GeometricTopology README (main), line 7120 (knot group `ℤ` ⇒ unknot) and Suggested.lean:234; lines 7455–7456, 8.5.2: for a nontrivial knot, "irreducibility, boundary incompressibility and the Haken hypotheses of 8.3.1". Instance: trefoil, `refl`.
**Repair:** Line 337: "Otherwise both knots are nontrivial, so both exteriors are irreducible with incompressible boundary and satisfy the Haken hypotheses of 8.3.1 (GeometricTopology 8.5.2), and Waldhausen's realization …". On the *Needs:* line, after the 8.1 item, insert "8.5.2 (irreducibility, boundary incompressibility and the Haken hypotheses for the exterior of a nontrivial knot),". In the supplier contract, write "section 8.1, the knot-group theorem (a knot in `S³` with knot group `ℤ` is smoothly ambient isotopic to `unknot`) and the extension of a homeomorphism of exteriors over the meridional fillings; section 8.5.2, the irreducibility, boundary incompressibility and Haken hypotheses of the exterior of a nontrivial knot;". In Scope, write "the knot-group theorem and the extension of a homeomorphism of exteriors over the meridional fillings are GeometricTopology 8.1's; the Haken hypotheses of the exterior of a nontrivial knot are GeometricTopology 8.5.2's;". In the description, add 8.5.2 to the GeometricTopology sections under Ownership and Suppliers. Tested on the trefoil: 8.5.2's preparation gives its exterior the hypotheses of 8.3.1.

## R02 (P3) — The description's list of sources leaves out two works the README cites

**Location:** pull request description, Sources: "Lisca, « Lens spaces, rational balls and the ribbon conjecture », Geom. Topol. 11 (2007): §1, Definition 1.1, Theorem 1.2, Corollary 1.3; §8; §9 and its Figure 8." No sentence names Ozsváth–Szabó 2004.
**Claim:** This is the part of the previous R03 that was not repaired. The description otherwise accounts for every cited work, including those cited only by locator and the research context. It names neither Lisca §§2–7 nor Ozsváth–Szabó 2004, Theorem 1.2, which the README cites second-hand through Zemke 2019.
**Witness:** README line 432: "(Lisca 2007, §§2–7 and §9)"; line 138: "(Ozsváth–Szabó 2004, Theorem 1.2, as recalled in Zemke 2019, §1)"; References, line 513.
**Repair:** In the Lisca item, write "§1, Definition 1.1, Theorem 1.2, Corollary 1.3; §§2–7; §8; §9 and its Figure 8". After the Fox sentence, add "Ozsváth–Szabó, « Holomorphic disks and genus bounds », Geom. Topol. 8 (2004), Theorem 1.2, is cited as Zemke 2019, §1, recalls it, for gap:hfk-genus-detection."

## Previous findings

- R01 — repaired: README lines 333–340: "If `K₀` or `K₁` is the unknot, both groups are then `ℤ`, so both knots are smoothly ambient isotopic to the unknot (GeometricTopology 8.1 …) … Otherwise both exteriors have incompressible boundary". The supplier sections this repair does not name are R01 above.
- R02 — repaired: README line 218: "The trefoil `K(3, 1)` is a twisted double of the unknot, so it bounds an immersed disc whose only singularity is one clasp".
- R03 — partly repaired: the description now has "It states 7 headlines: `isRibbon_of_isRibbonImmersion` (0.1), …", `IsRibbonImmersion`, the new Layer 0 and Layer 2 targets and three unstatable items. Its Sources paragraph still omits Lisca §§2–7 and Ozsváth–Szabó 2004 (R02 above). Leaving `Manifold.IsImmersion` out of "Mathlib" needs no change.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.1, sixth Check (sample 0.1) | `D₊(U, t)` for `t = 0, ±1`; the Seifert matrix `[[−1, 1], [0, t]]` | `Δ = −tT + (2t+1) − tT⁻¹`: `1`; `T − 1 + T⁻¹` (trefoil, `t = −1`); `−T + 3 − T⁻¹` (`4₁`); genus 1, so at least one clasp | true; the false inference from unknotting number is gone | none |
| `RibbonLE.antisymm`, unknot branch (sample 1.4) | `K₀ = unknot`, `K₁ = unknot.rotate a`; `K₁` the reverse; `K₁ = unknot`, `K₀` trefoil | groups `ℤ, ℤ`; `diag(1,−1,1,−1)`, det `+1`, sends `z ↦ (z,0)` to `z ↦ (z̄,0)`; `ℤ ≅ ⟨x,y \| xyx = yxy⟩` impossible (non-abelian) | true; the third Check of 1.4 is now covered | none |
| `RibbonLE.antisymm`, nontrivial branch | trefoil, `refl`; the hypotheses of 8.3.1 | genus-1 Seifert surface essential, boundary torus incompressible; 8.3.1 asks irreducible, sufficiently large, incompressible: GeometricTopology lines 7264–7266, provided by 8.5.2 (7455–7456) | true; supplier section not named | R01 |
| GeometricTopology 8.1 knot-group theorem, as cited | main line 7120; Suggested.lean:234; Tau Ceti `singleton_iff` | conclusion `SmoothAmbientIsotopic (singleton K) (singleton unknot)` ⟺ `SmoothEmbedding.SmoothAmbientIsotopic K unknot`, parametrized: the relation of `RibbonLE.antisymm` | matches; the clause on parametrizations (lines 335–337) is implied by it, and true | R01 (contract) |
| Agol 2022, Theorem 1.1 through Gordon 1981, Lemma 3.2 | Agol2022 line 36; lines 97–106 | self-concordance gives `π₁(X₀) ≅ π₁(Y₁)`; peripheral-preserving isomorphism by "the 4th paragraph" of Gordon's Lemma 3.2; the unknot is not separated | locator true; the README's split completes the route | none |

The rows for untouched statements stand as in the previous review, of a688830.

- Source locators checked against the text: 2 (Agol2022 line 36 and lines 97–106, read from arXiv:2201.03626v1).
- GeometricTopology on main: 8.1 (line 7120; Suggested.lean:234 `smoothAmbientIsotopic_unknot_of_knotGroup`), 8.3.1 (lines 7264–7266), 8.5.2 (lines 7451, 7455–7456). Its open revision keeps 8.1 (README:9137) and the declaration (README:9153, Suggested.lean:331); the overlap tool reports no cited id dropped.
- Tau Ceti at the pin: `SmoothLinkEmbedding.SmoothAmbientIsotopic` (KnotTheory/SmoothLink/Isotopy.lean:39), `SmoothLinkEmbedding.SmoothAmbientIsotopic.singleton_iff` (KnotTheory/SmoothLink/AmbientIsotopy.lean:267), `SmoothEmbedding.SmoothAmbientIsotopic` (Geometry/Manifold/SmoothEmbedding/SmoothAmbientIsotopy/Basic.lean:72).
- Dependency check with the candidate order: `depcheck: 245 roadmaps, 2230 edges, 0 problem(s)`; no UPWARD, no CYCLE; RibbonKnots (line 138) follows FourManifolds (line 137).
- Gate: the worker's run passes every check, the build included. A rerun against the public order file reports only `depcheck: NOT IN ORDER: RibbonKnots`, the case of a roadmap not yet inserted, which the candidate order resolves. No change outside the folder.
- Elaboration of `Suggested.lean`: 7 `sorry` warnings (lines 110, 150, 154, 168, 178, 188, 198), no error. The file is unchanged since a688830, so the `#check @name` comparison and the one-tactic probe stand as they were.

Overlap check: read GeometricTopology (main §§8.1, 8.3.1, 8.5.2; its open revision by search). FourManifolds, HeegaardFloer and CombinatorialHeegaardFloer are untouched by the change and stand as at a688830. The change brings in two objects: the knot-group theorem (owner GeometricTopology 8.1) and the Haken hypotheses of a nontrivial knot's exterior (owner GeometricTopology 8.5.2). Both are cited, not restated.

Source independence (changed passages only): 3 passages compared with 2 texts (Agol2022; GeometricTopology README on main), none shared. Line 334 repeats 8.1's twelve-word statement "a knot in `S³` with knot group `ℤ` is the unknot", which the mathematics forces. Largest share: Lisca2007, 14 of 52 locators, unchanged. No layer was added, removed or reordered, so the contents were not compared again.

## Not verifiable

- Gordon 1981, Lemma 3.2 (fourth paragraph): paywalled; checked through Agol2022 lines 87–96 and 104–106.

## Source issues

- none

## For the human reviewers

- none
