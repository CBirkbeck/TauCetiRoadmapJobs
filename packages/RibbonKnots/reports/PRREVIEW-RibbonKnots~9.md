# Review of RibbonKnots (pull request #2339 at de19ccf)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README lines 414–415 now read "1.4 also GeometricTopology 3.4, 5.1, 8.1, 8.3.1, 8.5.2 and 11.2 (gap:knot-group-residually-finite, gap:knot-group-peripheral-injection)". This matches 1.4's *Needs:* line (356–362). The repair introduces nothing new.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Layer 1 Dependencies vs 1.4 *Needs:* (changed passage) | GeometricTopology sections and gaps listed | *Needs:* {3.4, 5.1, 8.1, 8.3.1, 8.5.2, 11.2} and 2 gaps; Dependencies {3.4, 5.1, 8.1, 8.3.1, 8.5.2, 11.2} and the same 2 gaps | equal | none |
| Layer 1 Dependencies vs 1.3 and 1.5 *Needs:* (same changed line) | 1.3 (line 310), 1.5 (line 395) | 1.3: {gap:knot-group-residually-finite} on both. 1.5: GT {4.3, 4.4}, HF {7.6} and 4 link-Floer/genus gaps on both | equal | none |
| `RibbonLE.antisymm` through 8.5.2 (cited by the changed line) | `K₀ = unknot`, `K₁ = unknot.rotate a`; `K₀ = K₁ = trefoil`, `refl` | first: groups `ℤ, ℤ`, so the unknot branch applies (8.1). Second: `⟨x,y \| x²=y³⟩ ↠ S₃` (`x↦(12)`, `y↦(123)`), so the group is non-abelian, not `ℤ` | each case gets its branch's hypotheses | none |
| GeometricTopology 8.5.2 as cited | main line 7442; preparation at lines 7454–7456 | preparation, "for a nontrivial knot": irreducibility, boundary incompressibility, Haken hypotheses of 8.3.1. This is the set named at README 36, 109, 342, 361, 415 | citation holds; not restricted to prime knots | none |

The rows for the untouched statements stand as in the previous review, of `852bf53`.

- Source locators checked against the text: 0 this round. The changed lines carry no locator, and the locators of the sampled targets 0.1–2.1 stand as verified in earlier rounds.
- Cross-roadmap citations resolved: GeometricTopology 3.4, 5.1, 8.1, 8.3.1, 8.5.2 and 11.2. On main (1a19c9f) they are at lines 1551, 5906, 7111, 7259, 7442 and 7788. At the open revision #1797 they are at lines 2446, 7175, 9138, 9330, 9551 and 10568.
- Gate: the worker's run at de19ccf passes every check, the build included. Rerun against the public order file, it reports only `depcheck: NOT IN ORDER: RibbonKnots (insert it after its last supplier)`. The candidate order lists RibbonKnots at line 139.
- Dependency check with the candidate order: `depcheck: 245 roadmaps, 2233 edges, 0 problem(s)`; no UPWARD, no CYCLE.
- Elaboration of Suggested.lean: 7 `sorry` warnings (lines 110, 150, 154, 168, 178, 188, 198), no error. The file is unchanged since a688830, so the `#check @name` comparison and the one-tactic probe stand.
- No change outside the folder (`git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/RibbonKnots` is empty).
- The description against this head: Suggested.lean has five Tau Ceti imports (lines 4–8), and 7 headlines plus 10 definitions make its 17 declarations. GeometricTopology 8.5.2 is in its Ownership and Suppliers lists. The change adds no supplier, and no sentence is contradicted.

Overlap check: read GeometricTopology on main (§§3.4, 5.1, 8.1, 8.3.1, 8.5.2, 11.2) and at open revision #1797, which keeps all six. The overlap tool reports no cited id dropped by #1791. FourManifolds, CombinatorialHeegaardFloer and HeegaardFloer are untouched by the change and stand as at 852bf53. The change brings in no new object; 8.5.2's exterior hypotheses are owned by GeometricTopology and cited.

Source independence: changed passages only; 1 passage compared (Layer 1 Dependencies, README lines 414–415, a list of section numbers and gap slugs) with 1 text (GeometricTopology README on main, the six cited sections), none shared; largest share Lisca2007, 14 of 52 locators, unchanged; contents compared with Lisca2007 (§1–§9) in the review of a688830: independent, Layer 2 is one section; no layer added, removed or reordered since, so that result stands.

## Not verifiable

- Gordon 1981, Lemma 3.2 (fourth paragraph): paywalled. It was checked through Agol2022 lines 87–96 and 104–106 in an earlier round and was not re-read, since the change does not touch it.

## Source issues

- none

## For the human reviewers

- none
