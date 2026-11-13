# Review of MixedHodgeModulesAndIrregularHodgeTheory (pull request #2279 at 248fdc1)

**Verdict:** accepted

## Deferred findings

- D01 — stands

## Previous findings

- R01 — repaired: README lines 23, 84, 1042 and 1173 import ComplexComparisonPartII §C5.5 (`DivisorialLog`, `LogDeRham`) in scope, supplier contract, 10.1 and Layer 10 dependencies.
- R02 — repaired: README lines 98, 793 and 854 name ShimuraVarieties §3.5b.2; 7.3 uses its one-variable estimates on the unipotent power cover, with canonical-extension eigenvalue exponents.
- R03 — repaired: README line 620 cites SZ Theorem 4.20 through FSY's proof of A.24(2), and separately Sai90 §4.4, p. 321 for adjunction.
- R04 — repaired: README line 1097 locates Yu's definition in §4, p. 25, and displays (24)–(25) in §4(a), p. 26.

## Verified sound

| Statement | Instances tried | Left-side values | Right-side values | Result / change |
|---|---|---|---|---|
| Logarithmic-complex contract; 10.1 | `A²`, boundary `xy=0`; empty boundary | `Ω¹(log D)=O²`; `d(dlog x)=0`; empty boundary gives `Ω¹` | §C5.5 gives basis `dlog x,dlog y`, closed generators, ordinary differentials for trivial log structure | Supplier matches; ownership repaired |
| 5.6 rigidity | Constant rank-two variation on connected `X`; non-admissible extension on `A¹` | `H⁰(X,ℚ²)=ℚ²`; evaluation matrix `I₂`; extension classes `0,i` | Fibre `ℚ²`, matrix `I₂`; `0≠i` in `ℂ/ℚ` excludes constancy without admissibility | Statement retained; locator repaired |
| 7.3 growth versus canonical filtration | Constant variation; nodal elliptic degeneration; rank-one monodromy `−1` | Squared norms `1`, `y,y⁻¹`; canonical frame norm `r^{1/2}` | Power exponents `0,0,0,1/2`; logarithmic factors change none; double cover gives residue exponent `1` | Correct supplier and power-cover argument |
| 10.1 pole bounds | `f=t⁻²`, `q=1`, `λ=1/2`; `(pt,0)` | Pole bound `⌊(1−1/2)·2⌋=1`; `F⁰=ℂ`, `F^{1/2}=0` | `Ω¹(log D)(P_red)`; point complex gives `ℂ,0` | New logarithmic-complex input fits |
| 10.2, seeded dependent target | Blow up `f=z/x` at the origin | Charts give `z′` and `1/x′`; exceptional pole coefficient `0` | Transformed poles `0,1`; `H⁰(P¹,O(−1))=H¹(P¹,O(−1))=0` | Added supplier preserves comparison |
| 10.4 Newton nondegeneracy | `φ=x`; face polynomial `(x+y)²` at `(1,−1)` | `θx=x≠0` on torus; second example has Euler derivatives `(0,0)` | Yu's systems: no solution; second example has `(φ,∂xφ,∂yφ)=(0,0,0)` | Definitions equivalent; locator repaired |
| 10.4 Newton filtration | `φ=x`, `q=1`, `λ=0,1/2`; `n=0` | Allowed exponents `{0,1}`, `{0}`; `h(0)=0` | Sections of `O(∞)`, `O`: dimensions `2,1`; point sections `ℂ` | Displays (24)–(25) support bounds |
| 10.6, seeded dependent headline | `φ=x` on `G_m`; constant polynomial, `n=0` | `H⁰=0`, `dim H¹=1`; point has `dim H⁰=1` | `1!·vol([0,1])=1`; `0!·vol({0})=1` | Compatible with repaired 10.4 locators |

Untouched adversarial rows stand as in the previous review of `2e2b596`.

- Source verification: 7 locators in 4 texts—FSY lines 3164 and 1474–1495; Sai90 lines 3426–3431; Sab05 lines 5340–5352; Yu lines 1336–1342, 1376 and 1395.
- Pinned library declarations opened: 3—`Mathlib/Analysis/Convex/Exposed.lean:55`, `Mathlib/Analysis/Convex/Hull.lean:48`, `Mathlib/Algebra/MonoidAlgebra/Module.lean:73`; nonempty-face and coefficient conventions agree with 10.4.
- Changed supplier sections resolved: 2—ComplexComparisonPartII §C5.5 and ShimuraVarieties §3.5b.2; citation resolver reports 0 unresolved roadmap citations.
- Gate: all scanners pass; targeted build passes. Dependency output: `depcheck: 239 roadmaps, 2175 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Standalone elaboration and the 13-declaration `#check @name` probe pass with only the theorem's `sorry` warning; signatures agree with the README, with no lost binders. Lake additionally emits a Mathlib module-system advisory.
- PR title, prose and `roadmap-summary` checked against the new-folder diff: 0 contradictions, 0 outside-folder changes, 0 declarations removed; repairs add supplier sections, not supplier roadmaps.
- Overlap check: read LefschetzPencilsAndVanishingCycles, EtaleDualityAndPerverseSheaves, MappingClassGroupsAndCanonicalRepresentations, KloostermanSheavesAndBesselIsocrystals, SheafConvolutionOnAbelianVarieties and EtaleCohomologyFoundations; shared monodromy algebra belongs to LefschetzPencilsAndVanishingCycles, étale foundations/perverse calculus to the étale suppliers, real variations to MappingClassGroupsAndCanonicalRepresentations, rational rigidity and regular Riemann–Hilbert here. The repaired inputs belong to ComplexComparisonPartII and ShimuraVarieties; no new competing ownership.
- Source independence: changed passages only—4 substantive passages compared with 4 source texts and 2 supplier roadmaps; no copied expression beyond standard mathematical wording. Largest share: FSY, 40 of 124 comma-led source citations, excluding repeated line references. No layers added, removed or reordered; the previous FSY contents comparison stands.

## Not verifiable

- SZ Theorem 4.20 remains recorded uncertified; its text was not read. FSY line 3164 verifies the corrected secondary locator for 5.6.

## Source issues

- **Error** in Yu at §4(a), p. 26 (Yu lines 1377–1378): the source says interior containment of the origin makes the Laurent polynomial a proper map to the line; it should claim exhaustiveness of the Newton filtration, without properness; affects nothing.

## For the human reviewers

- Licence: `packages/MixedHodgeModulesAndIrregularHodgeTheory/sources.toml` records Sai88, Sai90, Kash86 and AS with `licence_class = "answered-by:CBirkbeck"`; AS is hosted by Cambridge. Their legal status rests on the operator's answer.
- Licence: FSY cites for Theorem A.24 a work listed as “in preparation” (FSY line 3317); the roadmap does not cite it.
- Scope: nothing to flag; the previous review identifies every main source as refereed or the arXiv version of a refereed paper.

