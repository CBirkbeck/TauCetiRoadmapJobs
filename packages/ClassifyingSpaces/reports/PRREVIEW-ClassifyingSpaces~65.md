# Review of ClassifyingSpaces (pull request #1807 at 8d8b243)

**Verdict:** accepted

## Previous findings

- R01 — repaired: the description now says "its §§8.8 and 8.14 now take Hatcher's Proposition 1B.9 from ClassifyingSpaces items 1.1–1.2" and keeps "So is ClassifyingSpaces: the check reads its `TauCeti/AlgebraicTopology/` paths as citations". Together these state the loop that the check reads.
- R02 — repaired: `TauCetiRoadmap/ClassifyingSpaces/README.md:1200–1201`: "item 8.8 obtains that map from items 1.1 and 1.2 (next bullet), so C1.5a consumes them through item 8.8 and cites no item of this roadmap directly."

## Verified sound

| Statement | Instance | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Changed bullet (README 1196–1201): C1.5a's map is the map of items 1.1–1.2, reached through AT 8.8 | `X = RP^∞`, `π = ℤ/2`, `φ` the isomorphism | `|Hom(ℤ/2, ℤ/2)| = 2`; `[RP^∞, Bℤ/2]_* = H¹(RP^∞; 𝔽₂)`: 2 classes; `φ` ↦ `a` with `a² ≠ 0`, and `0` ↦ the constant map | holds: one pointed class for each `φ` | none |
| Same: "unique up to pointed homotopy" | `X = S¹` with `π = S₃`, and with `π = ℤ/2` | `S₃`: 6 pointed classes (`|Hom(ℤ, S₃)|`) but 3 free ones (conjugacy classes). `ℤ/2`: 2 pointed = 2 free | "pointed" matches item 1.2 (rel `{x}`) and Hatcher's "fixing x₀"; "free" fails for `S₃` | none |
| Headline `exists_continuousMap_mapOfEq_eq_of_isAspherical` (items 1.1–1.2) at C1.5a's instance | its signature against AT 8.8 (lines 4290–4291) and C1.5a | `RP^∞`: Hausdorff, CW (weak topology), path-connected, any `x`. `Bℤ/2`: `IsAspherical` by 8.8a. Universes `u_1` and `u_2` independent | hypotheses match | none |
| Same, negative control on asphericity | `Y = RP²` (`π₂ = ℤ`), `φ : π₁(RP^∞) ≅ π₁(RP²)` | a realizing map pulls `a ↦ a`, but `a³ ≠ 0` in `H³(RP^∞; 𝔽₂) = 𝔽₂` and `a³ = 0` in `H³(RP²; 𝔽₂) = 0` | no realizing map exists; `IsAspherical` excludes `RP²` | none |
| "C1.5a cites no item of this roadmap directly" | CharacteristicClasses C1.5a *Needs:* (lines 1056–1059) and its dependency line 1130–1131 | lists T1.6, C1.1b, C1.5, AT 8.3, 8.5, 8.8, 8.10, 8.12 and CKG K7.2: 0 ClassifyingSpaces items. The 4 other mentions (64, 190, 569, 1119) concern the join model | holds | none |
| Description: ClassifyingSpaces is read inside the large loop | `depgraph.supplier_edges` and the strongly connected components at this head | CS→AT read at 360, 407, 954; AT→CS at 970, 4257, 5160; CC→CS at 190, 1115. CS lies in a component of 65 roadmaps | the description is true | none |

The rows for the untouched statements (headlines 2–4, the Checks of Layers 1–2, the conventions) stand as in the previous review, of `d524e59`.

- **Gate.** The worker's gate at `8d8b243` passes, build included. My run prints 0 for every content counter, `depcheck=0` included. Its only failure, `outside-folder=24`, lists files in the pull request's own sibling folders. Outside the 13 folders, `git diff --stat origin/main...HEAD` is empty.
- **Dependency check.** `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`; it prints no UPWARD or CYCLE line.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` exits 0 in 6 s. The only warnings are four `declaration uses 'sorry'`, at lines 84, 102, 123 and 138. The file is unchanged since `d524e59`, so `signatures.md` and the padding probe stand.
- **Source locators re-read: 3.** `hatcher-at` line 3884 (printed p. 90); lines 3897–3898, Theorem 1B.8 (item 1.3); lines 3905–3907, Proposition 1B.9 (items 1.1–1.2), whose "homotopy fixing x₀" is the bullet's pointed uniqueness.
- **Cross-roadmap citations resolved at this head: 6.** AlgebraicTopology 8.8 (4257, 4288–4294), its *From TauCetiRoadmap.ClassifyingSpaces* contract (970–980), 8.14 (5160, 5179–5181) and the table rows 5477 and 5487; CharacteristicClasses C1.5a (1022–1059) and 204–210.
- **Overlap check:** read AlgebraicTopology (main, #1808, #1854), StableHomotopyKTheory, DGFloer, DGFloerPartII and UniversalCovers.
  - The pointed classification of maps into an aspherical space is owned by this roadmap's items 1.1–1.2. AlgebraicTopology 8.8 and 8.14 consume it.
  - The nerve model `Bπ` is owned by AlgebraicTopology 8.8.
  - UniversalCovers owns only the recognition of `K(G, 1)` spaces. The DGFloer roadmaps use asphericity only.
  - StableHomotopyKTheory cites the former Stage items, which resolve through this README's item map (line 107).
  - #1808 and #1854 follow this pull request in the stated shared-folder order.
- **Remark.** Besides the two `TauCeti/AlgebraicTopology/` paths (lines 361 and 419), the check reads CS→AT from Mathlib's `AlgebraicTopology.singularHomologyFunctor` in the *Needs:* of line 954 (at line 970).
- **Remark.** TeichmullerGeometry (open) proves the surface case of Proposition 1B.9 itself (its README line 597). The general statement is owned here.

## Not verifiable

- `brown-cohomology`, Chapter III §1 (items 2.1–2.3): uncertified, with no legal text. Those passages are untouched.
- `schwamberger-vogt-2009` §2 and `milnor-1956` §3: uncertified. The changed text cites neither.

## Source issues

- none
