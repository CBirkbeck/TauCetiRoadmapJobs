# Review of ZigzagPreprojective (pull request #1653 at 237fc0b)

**Verdict:** needs changes

## Status of the previous review's findings

| Previous finding | Status at 237fc0b | Evidence |
|---|---|---|
| R01 admitted data (13 `sorry` bodies) | repaired | `Suggested.lean` has six declarations: three `sorry`'d theorems, one `def` by pattern matching, one `structure … : Prop`, one `def … : Prop`; gate `sorry-data=0`. |
| R02 acceptance build | repaired | gate `build=0`; direct elaboration exits 0 with exactly three `declaration uses sorry` warnings (lines 60, 91, 132). |
| R03 cyclic-quotient computation owned | repaired | `README.md:577–600` owns `preprojective_cyclicQuotient_vanishes_iff` with Schedler 13.1.1 (bd20e33e… lines 2992–3020) and the index adapter to DGAInfinity's `HH^{n,2-n}` (`README.md:569–575`); the D₄ degree-4 test is the first Check at line 607. |
| R04 consume native strict algebras | partly repaired | Layers 1–5 natives are now listed (`README.md:199–216`) and consumed by the Lean; the native Layer 6 Ginzburg constructions and the Layer 8 braid complexes are still restated without citation (R03 below). |
| R05 headline theorems in `Suggested.lean` | partly repaired | affine recognition and the finite-tree formality theorem are stated; the statable Layer 4 Hilbert-series headline is neither stated nor named (R01 below). |
| R06 McKay boundaries | repaired | `README.md:126–157`: `C₂` and the trivial group excluded with the dimension controls 8 ≠ 6 and 4 ≠ 2, which I recomputed. |
| R07 spherical twists | repaired | `README.md:692–716`: enhancement, finite total Hom, `n > 0`, Seidel–Thomas 2.2/2.5/2.9/2.17/2.18 at the pages given. |
| R08 padding | repaired | the nine listed declarations are gone; no example or boundary theorem remains. |
| R09 locators | partly repaired | Couture, Etingof–Eu, Liu–Wang, Schedler, Seidel–Thomas, Etingof et al. now carry theorem and page locators; Layers 1–3, 6 and 8 still cite whole papers (R04 below). |
| R10 Checks, Needs, shape | partly repaired | 4 `*Needs:*` lines and 5 `**Checks.**` blocks were added (McKay convention, Layer 0 recognition, bad primes, deformations, twists); layer endings and the remaining targets are unchanged (R05 below). |
| R11 auxiliary file and docstrings | repaired | `AffineGraphClassificationTargets.lean` deleted; every declaration has a docstring; the process paragraph is gone; layer section comments present. |

## R01 (P2) — The statable Layer 4 Hilbert-series headline is absent from `Suggested.lean`

**Location:** `README.md:497–500` ("prove infinite-dimensionality, the matrix Hilbert series `h_Π(t) = (1 − C t + t²)⁻¹` … and Koszulity, over every field (Etingof--Eu, Theorem 3.4.2)"); `Suggested.lean:22–44` (the "Stated here" and "Not statable" lists). **Claim:** the acceptance file states every statable headline and names every unstatable one.

**Witness:** Etingof–Eu Theorem 3.4.2 (abfa7d32… line 329, p. 7) is the main theorem the Layer 4 bullet plans. At the pin only infinite-dimensionality is native: `TauCeti/RepresentationTheory/Quiver/Preprojective/InfiniteDimensional.lean` lists six results, all `not_module_finite_*`; no declaration mentions `finrank` of `preprojectiveGrade` and no Koszul predicate exists in Tau Ceti (a grep for `IsKoszul`, `KoszulAlgebra` returns nothing). The Hilbert-series identity is statable now: with `Π = TauCeti.preprojectiveAlgebra k (OrientedQuiver G o)` and `H_d(j,i) = finrank k (e_j · preprojectiveGrade k _ d · e_i)`, the identity `(1 − Ct + t²) H(t) = 1` is the recursion `H_0 = I`, `H_1 = C`, `H_{d+2} + H_d = C · H_{d+1}` on the native carriers. Negative control: for the one-edge graph `A₂` the recursion would force `H_3 = −C`, so the hypothesis "connected and not Dynkin" is essential. The docstring's "Not statable" list names neither this theorem nor the two Koszulity statements (Layer 4 Koszulity of `Π`, Layer 5 item 3 zigzag Koszul dichotomy), which are not statable without a Koszul or linear-resolution predicate.

**Repair:** add to `Suggested.lean` one definition of the corner piece `e_j Π_d e_i` as the image of `TauCeti.preprojectiveGrade k Q d` under `x ↦ e_j * x * e_i` (real body), and state the recursion above for a connected finite simple graph with no isomorphism to `TauCeti.diagramGraph t.cartanMatrix` for a valid simply-laced `t`, with `sorry`; name the two Koszulity statements in the module docstring as not statable, naming the missing Koszul predicate. Tested on the triangle: `H_1 = C`, `H_2 = C² − I` has diagonal `1` and off-diagonal `1`, `H_3 = C H_2 − C` has diagonal `2` and off-diagonal `2`, matching the row sums `1, 2, 3, 4, …` of the degree pieces; on `A₂` the recursion fails at `d = 3`, as it must.

## R02 (P3) — "RootSystems Layer 5" does not exist on main

**Location:** `README.md:352–353` ("Compare with RootSystems Layer5's independently supplied positive-definite finite Cartan matrices"). **Claim:** RootSystems has a Layer 5 supplying the positive-definite finite classification.

**Witness:** `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md` on main (c9a16a0) has exactly three layers: Layer 1 (line 248), Layer 2 (line 432), Layer 3 "classification and concrete Weyl groups" (line 504); the string "Layer 5" does not occur. The finite recognition the sentence needs is already pinned: `SimpleGraph.posDef_graphCartanMatrix_iff` at `TauCeti/LinearAlgebra/RootSystem/FiniteType/SimpleGraph.lean:143` (connected finite `G`: `2I − A` positive definite over ℚ iff `G ≃g diagramGraph t.cartanMatrix` for a valid simply-laced `t`).

**Repair:** replace the citation by that pinned declaration (and RootSystems Layer 3 §3.1 if a roadmap section is wanted). The mathematics of the sentence is right: for positive-definite `C` and `a ≠ 0`, `aᵀCa > 0` forces some `(Ca)_i > 0`; on finite `D₄` at `a = (2,1,1,1)` the centre has `(Ca)_0 = 1`.

## R03 (P3) — Native Layer 6 and Layer 8 constructions are restated without citation

**Location:** `README.md:526–533` (construct `Π₂(Q)`, prove `d² = 0`, Leibniz, `H⁰ ≅ Π_k(Q)`), `README.md:540–542` (length-adic completion and comparison map), `README.md:543–548` (3-dimensional Ginzburg algebra), `README.md:648–655` (Liu–Wang Example 4.7 operation), `README.md:678–683` (two-term bimodule complexes `B_i`, inverse coevaluation complex, internal degree 2). **Claim:** these are targets of this roadmap.

**Witness:** at the pin (Tau Ceti a91d3aa): `TauCeti/Algebra/Homology/Ginzburg/Basic.lean:288,375,393` (`ginzburgTwoDifferential`, `isDGAlgebra_ginzburgTwoDifferential`, `ginzburgTwoDifferential_sq_zero`), `ZerothCohomology.lean:202` (`preprojectiveEquivGinzburgTwoCohomologyZero`), `Completion.lean:148` (`ginzburgTwoToCompleted`, the Adams completion `Π̂₂(Q)` and its comparison), `ThreeDimensional.lean:227` (`ginzburgThreeDifferential`, arrows in degree 0, reverses −1, loops −2), `TauCeti/RepresentationTheory/Quiver/Zigzag/AInfinity/AffineD4.lean:134` (`liuWangAffineD4AInfinityAlgebra`), `TauCeti/RepresentationTheory/Quiver/Zigzag/Braid/Basic.lean:544,554,454` (`zigzagBraidComplex`, `zigzagBraidInverseComplex`, `isHomogeneous_zigzagBraidCoevaluation`: coevaluation of internal degree 2, complex `Z ⟶ (P_i ⊗ e_i Z){-2}`). The "Tau Ceti material to consume" list (`README.md:181–222`) names none of them, so the README claims ownership of objects the library already has.

**Repair:** add these declarations to the consumption list and rewrite the five passages as consumption ("Consume `TauCeti.zigzagBraidComplex` …; the braid relations below are the new targets"). The file `Braid/Basic.lean` itself says (line 44) it constructs the complexes and not the braid relations, so the `Suggested.lean` docstring's "not statable" entry for the relations stays correct; it should say the complexes exist and only their composition over `Z` is missing.

## R04 (P3) — Locators are still missing on the Layer 1–3, 6 and 8 claims

**Location:** `README.md:436–449` (basis, dimension, trace, center), `README.md:455–463` (graded Cartan formula), `README.md:534–539` (bimodule 2-Calabi–Yau theorem), `README.md:543–548` (3-Ginzburg equals deformed completion), `README.md:556–562` (derived Koszul duality), `README.md:684–691` (braid homotopy equivalences, type `A` faithfulness), `README.md:484–490` (preprojective relation and orientation independence). **Claim:** every target has a locator.

**Witness:** these claims cite no theorem or page, although the previous review's R09 asked for them and the texts are all in the cache. The locators that support each claim, checked this round: Huerfano–Khovanov Proposition 1, p. 4 (fa1f2fbb… line 187: graded symmetric algebra); Ehrig–Tubbenhauer Lemma 2.7, p. 4 (29429306… lines 218–226: entries `1 + q²`, `q`, `0`); Keller Theorem 4.8, p. 20 (ca9dc0ee… line 927: homologically smooth `A` gives smooth, `n`-Calabi–Yau `Π_n(A)`) and Theorem 6.3, p. 27 (line 1266: `Π_n(A,c) ≃ Γ_n(A,W)`); Etgü–Lekili Theorem 23, p. 37 (d9397140… line 1279: `RHom(k,k) ≃` the Ginzburg algebra with gradings matched); Huerfano–Khovanov Proposition 7, p. 9 (line 395: `Σ_aΣ_bΣ_a ≅ Σ_bΣ_aΣ_b` for adjacent, commuting otherwise); Khovanov–Seidel Corollary 1.2, p. 5 (34e74708… line 204: faithfulness for all `m ≥ 1`); Crawley-Boevey §1, printed p. 119.

**Repair:** attach these locators at the claims. No manifest is in the folder; the locators are the part the author can supply.

## R05 (P3) — Layer endings and per-target dependencies are still absent

**Location:** `README.md:243–725`. **Claim:** every layer ends with its examples and dependencies, every target lists what it needs.

**Witness:** the file has 4 `*Needs:*` lines (recognition, cyclic quotient, formality, twists), 5 `**Checks.**` blocks, one `**Dependencies.**` paragraph (Layer 7, line 669) and no `### Examples` or `### Dependencies` heading; Layers 0–6 and 8 end without dependencies, and the bullets of Layers 1–6 (for example the skew classification at lines 414–421, the Koszul dichotomy at lines 516–521, the Calabi–Yau identification at lines 534–539) have no `*Needs:*` line. The headings (`## Scope boundary`, `## Standing conventions`, `## Existing foundations and formalization boundary`, layers as `###` under `## The build, in layers`) are not the upstream shape (`## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k`).

**Repair:** end every layer with `### Examples` and `### Dependencies`, add `*Needs:*` to each target that is not a consumed native result (the native ones are consumption lines after R03), and rename the sections to the upstream headings. Content need not change.

## R06 (P3) — Mathlib pull-request links in the README

**Location:** `README.md:174–177` ("The open path/category-algebra work in [#22809](…), the homogeneous-quotient work in [#36501](…), and the graded `A∞`-quiver work beginning at [#40984](…) guide compatible interfaces but are not dependencies."). **Claim:** timeless prose.

**Witness:** three pull-request references and the process word "open" in a roadmap README; the house rules exclude pull-request references and process narrative. The gate's `prnum` scanner looks for this repository's numbers and does not see links to another repository.

**Repair:** delete the sentence; keep the following sentence ("If a needed interface is absent, Tau Ceti supplies the complete target …"), which carries the policy.

## Verified sound

**Scope and principles.** This pull request revises the on-main roadmap `ZigzagPreprojective` (main c9a16a0 has the folder with `README.md`, `Suggested.lean`, `STATUS.md`, `PROGRESS.md`, `metadata.toml`); it re-plans no other roadmap, and its new Layer 0 recognition target extends the existing graph owner. No route-specific shortcut, no computational algorithm, no copied passage, no sorry'd data, no `set_option`, no forbidden import. The diff outside the folder is empty. `STATUS.md` and `PROGRESS.md` are the generated files already on main (gate `stray-files=0`).

**Gate and elaboration.** The worker's gate at 237fc0b: every counter 0, `OK`. Direct elaboration of `TauCetiRoadmap/ZigzagPreprojective/Suggested.lean` (`lake env lean`): exit 0, three `declaration uses sorry` warnings and nothing else. Imports: `import Mathlib` and nine `TauCeti.*` modules, all present at the pin.

**Dependency check.** The required command printed exactly:

```text
depcheck: 232 roadmaps, 2133 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Every `*Needs:*` line cites Tau Ceti, Mathlib, an earlier layer or DGAInfinity (on main). The citation resolver found no unresolved citation or Lean name. The only forward mention, "McKaySkewGroup §4.1–4.2", is a scope deferral to a consumer; at its open head (#223) §4.1 "Full idempotents and the McKay quiver" (line 944) and §4.2 "Cyclic groups" (line 1008) exist and lines 1041–1044 keep the singleton and `C₂` cases there, as the README says.

**Signatures.** A scratch copy with `#check @name` for all six declarations elaborated; the printed types carry `[Fintype V]`, `[DecidableEq V]`, `[DecidableRel G.Adj]`, `G.Connected`, `[Field k]`, `G.IsTree`, `[Finite V]` exactly as the README states them; no section variable was dropped. The three one-tactic probes (`simp`, `rfl`, `infer_instance`) failed on all three sorried theorems; the three definitions have real bodies and are needed by the headlines; nothing is padding.

**Pinned declarations opened** (Tau Ceti a91d3aa, Mathlib 6b7abb3):

| File and line | What it says |
|---|---|
| `TauCeti/LinearAlgebra/RootSystem/AffineDynkinType/Basic.lean:114,154,177,226,368,500,519,533,542` | `AffineDynkinType` with `A n`, `D n`, `E6/E7/E8`; `Valid` is `1 ≤ n`, `4 ≤ n`, true; `IsGraphical` is `t ≠ A 1`; `graph (A n) = cycleGraph (n+1)`; `marks` (`E8 = ![6,3,4,2,5,4,3,2,1]`, `D n` has 2 on nodes `1 ≤ i ≤ n−3`, else 1); `affineNode` (`E8 = 8`, `D n = 0`); `marks_pos`; `marks_affineNode = 1`. Hence `Valid ∧ IsGraphical` is exactly cycles on ≥ 3 vertices, `D̃_n` (n ≥ 4), `Ẽ₆, Ẽ₇, Ẽ₈`. |
| `AffineDynkinType/Star.lean:1–60,315` | arm vectors `![2,2,2]`, `![1,3,3]`, `![1,2,5]` count vertices beyond the centre: the README's edge lengths and `T_{3,3,3}`, `T_{2,4,4}`, `T_{2,3,6}` agree. |
| `AffineDynkinType/PositiveSemidefinite.lean:214,228,253` | PSD, kernel spanned by the marks, kernel rank 1 for valid types. |
| `TauCeti/Combinatorics/SimpleGraph/AdditiveFunction.lean:85,142,232,267` | `graphCartanMatrix = 2•1 − adjMatrix`; the energy identity in the form `2 (δy)ᵀC(δy) = Σ_i Σ_{j∼i} δ_iδ_j (y_i − y_j)²` (the README's form with `x = δy`); `posSemidef_graphCartanMatrix` and `ker_mulVecLin_graphCartanMatrix` need a positive additive `δ` and preconnectedness. |
| `TauCeti/LinearAlgebra/RootSystem/FiniteType/SimpleGraph.lean:143` | `posDef_graphCartanMatrix_iff`, the finite recognition (R02). |
| `TauCeti/LinearAlgebra/RootSystem/DynkinType.lean:108,156,193,222` | constructors, `Valid`, `IsSimplyLaced` (`A, D, E` true; `B, C, F4, G2` false), `cartanMatrix`. `IsBadPrime` covers all nine constructors. |
| `FiniteType/Diagram.lean:81` | `diagramGraph A` has `i ~ j` iff `i ≠ j ∧ A i j ≠ 0 ∧ A j i ≠ 0`. |
| `TauCeti/RepresentationTheory/Quiver/Zigzag/Orientation.lean:64,118` | `Orientation`: a set of darts containing exactly one of each pair; `OrientedQuiver G o := V`. |
| `Preprojective/Basic.lean:597`, `Preprojective/Grading.lean:171` | `preprojectiveAlgebra` over a commutative ring; `preprojectiveGrade k Q n : Submodule k (preprojectiveAlgebra k Q)`, the image of the degree-`n` paths. |
| `Zigzag/Componentwise/Basic.lean:106`, `Grading.lean:234` | `zigzagAlgebra` is the product of component algebras (dual numbers on singletons); `zigzagAlgebraIntegerGrade` extends the path grading by zero. |
| `TauCeti/Algebra/Homology/AInfinity/Algebra.lean:65` | `AInfinityAlgebra`: `grading`, `m n` of degree `2 − n`, `m 0 = 0`, Stasheff law as `bar_square_zero`. |
| `AInfinity/Algebra/Minimal.lean:56,172`, `Unit.lean:44`, `Formal.lean:63` | `IsMinimal` is `differential = 0`; `StrictUnit e`: degree 0, two-sided unit for `m 2`, kills every `m n` with `n ≠ 2`; `IsFormal`: an `A∞` quasi-isomorphism to `cohomologyAInfinityAlgebra` (zero-differential DG algebra on cohomology); `AInfinityHom.isQuasiIso_iff_isIso` lives in `namespace AInfinityHom`, as the README names it. For a minimal deformation with `m 2` the product, cohomology is the strict algebra, so `IsFormal` is `A∞`-isomorphism with it. |
| `Zigzag/Braid/Basic.lean:44,544,554,454`, `Ginzburg/*.lean`, `Zigzag/AInfinity/AffineD4.lean:134` | the native constructions of R03. |
| `Mathlib/Combinatorics/SimpleGraph/CycleGraph.lean:29` | `cycleGraph`; `graph (A 1) = cycleGraph 2` is the single edge, which carries no positive additive function, so excluding `A 1` by `IsGraphical` loses nothing. |

**Supplier citations resolved.** DGAInfinity on main: Layer 1 (line 293), 2 (317), 3 (353), 5 (431), 8 (520; the criterion `HH^{n,2-n}(H,H)=0` for `n ≥ 3` at line 541), 9 (550; `Π_n(C)=T_C(C![n-1])` at line 565), 11 (629). GrothendieckEulerForms, QuiverRepresentations and StablePeriodicCurved exist on main (the last cites this roadmap as its supplier, line 33). RootSystems: see R02.

**Sources and sample.** The worker named no target identifiers ("none found by heading"); I chose fifteen targets covering every changed passage and the headline theorems. All texts were read from the sources cache (arXiv copies), none fetched anew; locators are printed pages of the arXiv versions named in the README.

| # | Target and locator | Result |
|---|---|---|
| S01 | Schedler Thm 13.1.1, arXiv v3 p. 62 (bd20e33e… lines 2992–3020) | `(Λ_{A_n})_+ = 0`; `D_n`: `ℤ/2` at `4 | m ≤ 2(n−2)`; `E₆`: `ℤ/2` (4), `ℤ/3` (6); `E₇`: `ℤ/2, ℤ/3, ℤ/2, ℤ/2` at 4, 6, 8, 16; `E₈`: `ℤ/5` at 10 among 4–28; split sequence with free `i₀Π_{Q̃}i₀`. Matches the README's prime lists. |
| S02 | Liu–Wang Thm 1.1, p. 1 (d2b6f798… line 19) | finite tree, any field, bad primes 2 (D), 2,3 (E₆,E₇), 2,3,5 (E₈). Matches `IsBadPrime`. |
| S03 | Liu–Wang Def 4.1, Thm 4.2, p. 5 (lines 211–218) | deformation: unital, `μ₁ = 0`, `μ₂ = μ`; equivalence is `A∞`-isomorphism; criterion `HH^{2,q} = 0` for `q > 0`. |
| S04 | Liu–Wang Prop 3.2, p. 3 (line 118) | `HH^{2,q}(B,B) ≅ (Λ_Q/[Λ_Q,Λ_Q])_{q+2}`, bidegrees arrows (0,1), loops (−1,2). |
| S05 | Liu–Wang Cor 3.4, p. 4 (line 198) | finite connected quiver; ADE and not bad characteristic iff `HH^{2,>0} = 0`; non-ADE via a surjection onto an extended-ADE subquiver's quotient. README's restriction to oriented simple graphs is narrower than the source and says so. |
| S06 | Liu–Wang Prop 4.4, §4.4, Ex 4.7, pp. 5–6 (lines 248, 261–277, 289–296) | bigraded Hochschild comparison for trees with source–sink orientation; necessity by deforming `d(t)`; the four `m₄` values as displayed in the README. |
| S07 | Etingof et al. Problem 5.3(c)–(g), pp. 79–80 (30325e11… lines 3405–3438) | (c) cycles, (d) degree ≥ 4 and two trivalent vertices, (e) the three `E`-stars, (g) affine = semidefinite = the forbidden diagrams. Page 78 holds only the heading and (a)–(b). |
| S08 | Couture Thm 4.8 p. 12, Thm 4.12 p. 15, Lemma 4.3 and Prop 4.4 pp. 9–10 (a9850ef7… lines 290, 346, 374, 547, 689) | field with square roots fixed at line 290; the lemma and proposition assume ≥ 3 vertices; `Σ/∼ ≅ H¹(Γ,k*)` vertex-fixing, `Σ/≅ ≅ H¹/Aut(Γ)`. |
| S09 | Etingof–Eu Thm 3.4.2 p. 7, §2.1 (abfa7d32… lines 329, 34) | connected non-Dynkin quiver, any field, `h = (1 − Ct + t²)⁻¹`, Koszul. Supports R01. |
| S10 | Seidel–Thomas Defs 2.2 (p. 12), 2.5 (p. 13), 2.9 (p. 15), Thms 2.17 (p. 18), 2.18 (p. 19) (819c173b… lines 510, 554, 609, 768, 781) | injective model; finiteness (K1)–(K2); `n > 0` spherical; braid relations for `A_m`-configurations; faithfulness for `n ≥ 2`. |
| S11 | Keller Thm 4.8 p. 20, Thm 6.3 p. 27 (ca9dc0ee… lines 927, 1266) | smooth hypothesis; deformed completion ≃ Ginzburg. Locators missing in the README (R04). |
| S12 | Etgü–Lekili Thm 23 p. 37 (d9397140… line 1279) | `RHom(k,k)` is the Ginzburg algebra with gradings matched (R04). |
| S13 | Huerfano–Khovanov Prop 1 p. 4, Prop 7 p. 9 (fa1f2fbb… lines 187, 395) | symmetric algebra; braid relations for arbitrary graphs (R04). |
| S14 | Ehrig–Tubbenhauer Lemma 2.7 p. 4 (29429306… lines 218–226) | graded Hom dimensions `1 + q²`, `q`, `0` (R04). |
| S15 | Khovanov–Seidel Cor 1.2 p. 5 (34e74708… line 204) | faithfulness for all `m ≥ 1` in type `A` (R04). |

**Adversarial values.** `C = 2I − A`; `a` a nonnegative integer vector; positions written centre first where a centre exists.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Coefficient reflection `(s_i a)_i = Σ_{j∼i} a_j − a_i`, `s_i² = id` | `A₂` at `(1,0)`; triangle at `(1,1,1)` | `(s_0 a)_0 = −1`, `(s_1 a)_1 = 1`; `s_0²(1,0) = (1,0)`; triangle: all reflected values `1` | integer codomain needed; involution holds (no loops) |
| Stuck iff `Ca ≥ 0`; precarious iff `(Ca)_i > 0` | `A₂ (1,0)`: `Ca = (2,−1)`; `D₄ (2,1,1,1)`: `Ca = (1,0,0,0)`; triangle: `Ca = 0` | not stuck / stuck with precarious centre / stuck, none precarious | matches the README's three Checks |
| Zero propagation needs connectedness | triangle ⊔ point, `a = (1,1,1,0)` | `Ca = 0`, `a ≠ 0`, `a_3 = 0` | hypothesis present and necessary |
| Primitive null vector, multiples `mδ` | `Ẽ₈`: `δ = (6,3,4,2,5,4,3,2,1)` | `gcd = 1`; centre `3+4+5 = 12 = 2·6`; arm checks `6 = 2·3`, `6+2 = 8`, `4 = 4`, `6+4 = 10`, `5+3 = 8`, `4+2 = 6`, `3+1 = 4`, `2 = 2`; `δ_8 = 1 = marks_affineNode` | agrees with native `marks E8` entrywise |
| `D̃₄` marks | `(2,1,1,1,1)` | `Ca = (4−4,0,0,0,0)`; native `marks (D 4)`: node 1 (centre) `2`, nodes 0,2,3,4 `1`, affine node 0 | agrees |
| Arm equation and its solutions | arms `(a,b,c)` | `Σ 1/(a+1) = 1`: `(2,2,2)`: `1/3·3`; `(1,3,3)`: `1/2+1/4+1/4`; `(1,2,5)`: `1/2+1/3+1/6`; `(1,2,4)`: `31/30 > 1`; `a ≥ 3` gives `≤ 3/4` | complete list; `E₈` finite control correct |
| Paths | path on `n` vertices | `a_j = j a_1`, endpoint forces `(n+1) a_1 = 0` | no positive additive function; `n = 1` reads `0 = 2a` |
| Proper extension | four-leaf star plus pendant at a leaf, `a ≥ 0`, `C_H a ≥ 0` | `Σ_{v ∈ D̃₄} δ_v (C_H a)_v = (C_G δ)·a − a_e = −a_e ≥ 0` so `a_e = 0`, then propagation | `a = 0`; a graph can contain an affine copy properly only without a stuck position |
| PSD converse via `|x|` | sign structure | `xᵀCx ≥ |x|ᵀC|x| ≥ 0` since off-diagonals `≤ 0`; PSD kernel is the null cone | positive null vector from a real one; rational generator clears denominators |
| `affine_graph_recognition` (both directions) | all labelled connected graphs on 1–6 vertices, exact rational nullspace | 27 476 graphs; nonzero nonnegative null vector exists for 0, 0, 1, 3, 17, 150 graphs at `n = 1..6`; the affine list (cycles, `D̃₄`, `D̃₅`) counts 0, 0, 1, 3, 17, 150; mismatches 0; kernel dimension ≥ 2 never occurred | iff holds on the sample; uniqueness of `t` by vertex count and tree/cycle shape |
| `Valid ∧ IsGraphical` list | `A 1`, `A 0`, `D 3` | `A 1` valid, not graphical (one edge, no null vector); `A 0`, `D 3` not valid | the Lean side names exactly the README's list |
| `IsBadPrime` | `(D 4, 2)`, `(A 2, 2)`, `(E6, 3)`, `(E6, 5)`, `(E8, 5)`, `(t, 0)` | true, false, true, false, true, false | matches Schedler's torsion primes |
| `preprojective_cyclicQuotient_vanishes_iff`, degree-`d` cyclic quotient `dim kQ̄_d − rank(I_d + [kQ̄,kQ̄]_d)` | computed over `𝔽₂, 𝔽₃, 𝔽₅` and a large prime | `D₄ d=4`: `1,0,0,0`; `D₅ d=4`: `1,0,0,0`, `d=6,8`: `0`; `E₆ d=4`: `1,0,0,0`, `d=6`: `0,1,0,0`, `d=8,10`: `0`; `A₂ d=2,3`: `0`; `A₄ d=4`: `0`; `D̃₄ d=4`: `3,2,2,2`, `d=6`: `1,1,1,1`; triangle `d=3`: `2`, `d=4`: `1` | reproduces Schedler's table and the README's three Checks (`0,0,1` for `D₄`; `E₆` over `𝔽₃` at 6 nonzero, over `𝔽₅` zero); non-Dynkin cases nonzero in degree ≥ 3 |
| Same theorem, hypotheses | `A₁ ⊔ A₁` | left side true (`Π = k × k`), right side false (no connected Dynkin graph) | connectedness necessary and present |
| Same theorem, `d ≥ 3` versus Schedler's `m ≥ 1` | `D₄`, `E₆`, `E₈` | torsion sits in degrees 4, 6, 10 ≥ 3; good characteristic kills all `m ≥ 1` | the two-degree offset of `HH^{2,q} ≅ (Π/[Π,Π])_{q+2}` is handled |
| Hochschild index adapter | arity `n` cochain, `p = 2` | internal degree `2 − n`, Adams `n − 2 = q`; `q > 0` iff `n ≥ 3` | agrees with DGAInfinity Layer 8, line 541 |
| `IsZigzagAInfinityDeformation` | `A₁`: `m_n(x,…,x)` | degree `2n + 2 − n = n + 2 ∉ {0,2}` for `n ≥ 3`; unit inputs killed by `StrictUnit.higher` | only the strict structure; `A₁` intrinsically formal, right side true for `A 1` |
| Same, wrong model | drop `StrictUnit` | `m₄(1,1,1,x)` has degree `0`, allowed | the strict-unit field excludes it, as the Check says |
| `IsIntrinsicallyFormal` versus `IsFormal` | minimal `𝒜` with `m 2` the product | cohomology algebra is the strict algebra; `isQuasiIso_iff_isIso` turns the quasi-isomorphism into an `A∞`-isomorphism | matches Liu–Wang's equivalence of deformations |
| `isIntrinsicallyFormal_zigzagAlgebra_iff` | `A₁`; `A₂`; `D₄` over `ℚ, 𝔽₂, 𝔽₃`; `E₈` over `𝔽₅, 𝔽₇` | right side: true; true; true, false, true; false, true; `D₄` degree-4 quotient `0,1,0` supplies the nonzero class exactly over `𝔽₂` | consistent with the source and the cyclic computation |
| McKay convention | `C₄`, `C₂`, trivial group | `4·4 = 16 = 2·4 + 2·4`; `4·2 = 8 ≠ 6 = 2·2 + 2·1`; `4 ≠ 2` | boundaries as the README states |
| Twist action on `K₀` | two `2`-spherical objects, `χ(E_i,E_i) = 2`, `χ(E₁,E₂) = −1` | `A = [[−1,1],[0,1]]`, `B = [[1,0],[1,−1]]`, `AB = [[0,−1],[1,−1]]`, `ABA = [[0,−1],[−1,0]] = BAB` | Check correct |
| Hilbert-series recursion (R01) | triangle; `A₂` | triangle: row sums `1,2,3,4`; `A₂`: `H_2 = 0`, `H_3 = −C` | statement needs "not Dynkin"; statable at the pin |
| Energy identity transport | `x = δy` | `2 xᵀCx = Σ δ_iδ_j (x_i/δ_i − x_j/δ_j)²` with each edge counted twice | matches `AdditiveFunction.lean:142` |

## Not verifiable

- The worker's seeded sample could not be reproduced (no identifiers or seed were given); the fifteen targets above are my selection and are disclosed as such.
- No `sources.toml` exists for this roadmap (none in the folder, none on the board), so the cited versions are the cache copies named by hash above; journal numbering was not inferred from arXiv numbering.
- Ownership against open pull requests was checked only in the sibling checkouts the brief lists; `rev/1196` (RootSystems) is not present on disk, so RootSystems was read on main only, which is the rule for a revision of an on-main roadmap.
- The claim that every homologically unital minimal `A∞` structure over a field is isomorphic to a strictly unital one (`README.md:623–625`) is a standard fact cited without locator; it justifies the strict-unit field and is not a target.

## Source issues

- **Error** in Ehrig–Tubbenhauer (arXiv 1807.11173v2) at Definition 2.2(c), printed p. 3: the source says the length-two return path equals the difference of the two degree-zero generators in every characteristic; it should use the volume element, one generator alone in characteristic two, as Remark 2.3 does; affects a stated result.
- **Misprint** in Liu–Wang (arXiv 2301.06757v3) at Remark 4.6, printed p. 6: the source says the graded algebra `Π₂(Γ)` is not intrinsically formal; it should say the zigzag algebra `Z(Γ)`, the object of the surrounding computation; affects nothing.
- **Gap** in Etingof et al. (arXiv 0901.0827v5) at Problem 5.3(g), printed p. 80: the source says the affine diagrams are exactly the forbidden diagrams of (c)–(e); with multiple edges allowed by the problem's setup, the two-vertex double edge is also semidefinite and singular and is not displayed; affects nothing here, since this roadmap treats simple graphs only.
