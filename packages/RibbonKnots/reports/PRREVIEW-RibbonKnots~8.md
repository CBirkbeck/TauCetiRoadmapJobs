# Review of RibbonKnots (pull request #2339 at 852bf53)

**Verdict:** needs changes

## R01 (P3) — Layer 1's Dependencies omit GeometricTopology 8.5.2, which 1.4 now needs

**Location:** TauCetiRoadmap/RibbonKnots/README.md, Layer 1 `### Dependencies`, lines 414–415: "1.4 also GeometricTopology 3.4, 5.1, 8.1, 8.3.1 and 11.2 (gap:knot-group-residually-finite, gap:knot-group-peripheral-injection)".
**Claim:** The change adds GeometricTopology 8.5.2 to the route and the *Needs:* line of 1.4. The layer's dependency summary was not updated, so it now disagrees with 1.4's *Needs:* line.
**Witness:** README line 361, on 1.4's *Needs:* line: "8.5.2 (irreducibility, boundary incompressibility and the Haken hypotheses for the exterior of a nontrivial knot)". The same section is cited at lines 36, 109 and 342. Line 415 lacks it.
**Repair:** At lines 414–415, write "1.4 also GeometricTopology 3.4, 5.1, 8.1, 8.3.1, 8.5.2 and 11.2 (gap:knot-group-residually-finite, gap:knot-group-peripheral-injection);". After this edit, the GeometricTopology sections listed for 1.4 are the same in both places: {3.4, 5.1, 8.1, 8.3.1, 8.5.2, 11.2}.

## Previous findings

- R01 — repaired: README lines 340–342 now read "Otherwise both knots are nontrivial, so both exteriors are irreducible with incompressible boundary and satisfy the Haken hypotheses of 8.3.1 (GeometricTopology 8.5.2)". Scope (34–36), the contract (107–111) and *Needs:* (360–362) name both sections. The Dependencies line was missed (R01 above).
- R02 — repaired: the description now reads "§1, Definition 1.1, Theorem 1.2, Corollary 1.3; §§2–7; §8; §9 and its Figure 8" and "Ozsváth–Szabó, « Holomorphic disks and genus bounds », Geom. Topol. 8 (2004), Theorem 1.2, is cited as Zemke 2019, §1, recalls it".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `RibbonLE.antisymm`, nontrivial branch (changed; sample 1.4) | trefoil, `refl`; square knot `3₁ # 3₁*`, `refl` | trefoil group `⟨x,y \| x²=y³⟩` maps onto `S₃` (`x↦(12)`, `y↦(123)`), so it is non-abelian and the knot is nontrivial; genus-1 Seifert surface essential. Square knot: composite, genus 2 | true; the hypotheses of 8.3.1 hold for both | none |
| Generality of the 8.5.2 citation | prime knot vs composite knot | 8.5.2's main theorem assumes prime knots. Its preparation (main lines 7454–7456) is stated "for a nontrivial knot", which covers the square knot. The README cites the preparation | matches the README's "nontrivial knot" | none |
| Exhaustiveness of the case split | `K₀ = unknot`, `K₁ = trefoil`; `K₀ = unknot`, `K₁ = unknot.rotate a` | first: the peripheral injection is an isomorphism, `ℤ ≅` a non-abelian group, impossible. Second: groups `ℤ, ℤ`, unknot branch | "unknot, else both nontrivial" covers every case | none |
| 8.3.1 inputs vs 8.5.2 outputs | knot exterior `X_K`, `K` nontrivial | 8.3.1 item 1 (main lines 7264–7266) asks: compact, connected, orientable, irreducible, sufficiently large, incompressible nonempty boundary. Item 3 asks for torus boundary. `∂X_K` is one torus | the inputs and outputs agree | none |
| 8.1 knot-group theorem, as now stated in the contract | GeometricTopology Suggested.lean:234; `singleton_iff` | hypothesis `Nonempty (K.KnotGroup x ≃* Multiplicative ℤ)`. Conclusion on singletons ⟺ `SmoothEmbedding.SmoothAmbientIsotopic K unknot`. Same carrier as `Knot` (Suggested.lean:122–123) | "smoothly ambient isotopic to `unknot`" is right | none |
| Agol 2022, Theorem 1.1, through Gordon 1981, Lemma 3.2 (changed passage) | Agol2022 line 36 (p. 2); lines 97–106 | Theorem 1.1 is the antisymmetry statement. Its proof gets the isomorphism `π₁(X₀) ≅ π₁(Y₁)`, then the peripheral structure from the 4th paragraph of Gordon's Lemma 3.2. The unknot is not treated separately | locator true; the README's split adds the hypotheses Waldhausen needs | none |
| Layer 1 Dependencies vs 1.4 *Needs:* | GeometricTopology sections listed | *Needs:* {3.4, 5.1, 8.1, 8.3.1, 8.5.2, 11.2}; Dependencies {3.4, 5.1, 8.1, 8.3.1, 11.2} | 8.5.2 missing | R01 |

The rows for the untouched statements stand as in the previous review, of 1b8c671.

- Source locators checked against the text: 1 (Agol2022: Theorem 1.1 at line 36, and its proof at lines 97–106), read from arXiv:2201.03626v1 through the sources service. The fetch was recorded in a scratch manifest; the package manifest was not edited.
- GeometricTopology on main (1a19c9f): 8.1 (lines 7111, 7120, 7139–7147; Suggested.lean:234), 8.3.1 (lines 7259, 7264–7266, 7275–7298), 8.5.2 (lines 7442, 7454–7456). Open revision #1797 keeps 8.1, 8.3.1 and 8.5.2 (README lines 9138, 9330, 9551, 9564).
- Tau Ceti at the pin: `SmoothLinkEmbedding.SmoothAmbientIsotopic.singleton_iff` (KnotTheory/SmoothLink/AmbientIsotopy.lean:267), `SmoothEmbedding.SmoothAmbientIsotopic` (Geometry/Manifold/SmoothEmbedding/SmoothAmbientIsotopy/Basic.lean:72), `unknot` (KnotTheory/SmoothCircle.lean:294), `IsIncompressible` (AlgebraicTopology/FundamentalGroup/Incompressible.lean:42).
- Dependency check with the candidate order: `depcheck: 245 roadmaps, 2230 edges, 0 problem(s)`; no UPWARD, no CYCLE.
- Gate: the worker's run passes every check, the build included. Rerun against the public order file, it reports only `depcheck: NOT IN ORDER: RibbonKnots (insert it after its last supplier)`. That is a roadmap not yet inserted, and the candidate order resolves it. No change outside the folder.
- Elaboration of Suggested.lean: 7 `sorry` warnings (lines 110, 150, 154, 168, 178, 188, 198), no error. The file is unchanged since a688830, so the `#check @name` comparison and the one-tactic probe stand. The binder flagged for `radialFunction` (`[InnerProductSpace ℝ E]`) is harmless, since its body uses only the norm.
- The description against this head: the Ownership and Suppliers lists include 8.5.2; seven gaps are declared, as in the README; metadata `topic = "math.GT"`. No sentence is contradicted.
- Remark on untouched text (no change asked): 8.1's extension theorem assumes the Gordon–Luecke filling theorem (main lines 7139–7147). 8.3.1's realization already sends meridian to meridian, so 5.2's filling comparison would be enough.

Overlap check: read GeometricTopology (main §§8.1, 8.3.1, 8.5.2; open revision #1797, which keeps all three). The head of draft #1791 carries an older outline, and the overlap tool, which reads its change, reports no cited id dropped. FourManifolds, HeegaardFloer and CombinatorialHeegaardFloer are untouched by the change and stand as at 1b8c671. The change brings in two objects: the knot-group theorem (owner GeometricTopology 8.1) and the Haken hypotheses of a nontrivial knot's exterior (owner GeometricTopology 8.5.2). Both are cited, not restated.

Source independence (changed passages only): 4 passages compared with 2 texts (Agol2022; GeometricTopology README on main, §8.5.2). The only shared wording is the six-word hypothesis list "irreducibility, boundary incompressibility and … Haken hypotheses" (GeometricTopology line 7455), which names the supplier's own target. Largest share: Lisca2007, 14 of 52 locators, unchanged. No layer was added, removed or reordered, so the contents were not compared again.

## Not verifiable

- Gordon 1981, Lemma 3.2 (fourth paragraph): paywalled; checked through Agol2022 lines 87–96 and 104–106.

## Source issues

- none

## For the human reviewers

- none
