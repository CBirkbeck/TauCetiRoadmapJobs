# Review of SmoothBundlesConnections (pull request #2127 at 06c60b8)

**Verdict:** needs changes

## R01 (P2) — Soft/fine-sheaf acyclicity has two owners: B6.1 here and ComplexKahlerGeometry 2.5

**Location:** `TauCetiRoadmap/SmoothBundlesConnections/README.md` lines 44–46: "the softness of smooth functions and of sheaves of modules over them (the fine-sheaf acyclicity that ComplexKahlerGeometry 2.5 consumes)"; lines 2277–2278 repeat it under Downstream consumers.

**Claim:** B6.1 owns the vanishing of `Sheaf.H` for soft sheaves and its module form, and ComplexKahlerGeometry 2.5 consumes it.

**Witness:** `TauCetiRoadmap/ComplexKahlerGeometry/README.md` on main, lines 744 and 748: "prove the latter fine/acyclic using partitions of unity", "Prove fine-implies-acyclic on the paracompact Hausdorff manifolds here"; the head of #1807 keeps both sentences. It proves the theorem; it does not consume B6.1.

**Repair:** Keep B6.1 as the owner (the headline `subsingleton_H_smoothSheafAddCommGroup` needs it and ComplexKahlerGeometry is a consumer, so the owner must be the earlier roadmap). In the open revision of ComplexKahlerGeometry (#1807), replace the two sentences of its 2.5 by "Consume SmoothBundlesConnections B6.1: soft sheaves on paracompact Hausdorff spaces have no higher `Sheaf.H`, and sheaves of modules over smooth functions are soft; prove here only the softness of the continuous-function sheaves `C⁰_ℂ` used in 4.5", repoint its four later mentions of "K2's fine-implies-acyclic theorem" to B6.1, and name that pull request in this description's merge-order paragraph. Until that revision exists, lines 44–46 and 2277–2278 state a consumption that neither main nor an open head makes.

## R02 (P3) — "Raw refinement maps and homotopies" plans what Tau Ceti has at the pin

**Location:** `TauCetiRoadmap/SmoothBundlesConnections/README.md` lines 1813–1841: "construct the raw refinement cochain map on the native complexes … build the explicit native refinement cochain homotopy", with `*Needs:*` Mathlib only.

**Claim:** The refinement cochain map, its identity, composition and naturality laws, the homotopy between two refinements, the independence of the map on cohomology, and the change of coefficient category are targets of this roadmap.

**Witness:** Pinned Tau Ceti, `CategoryTheory/Sites/SheafCohomology/Cech/Basic.lean`: `cechComplexMap` (278), `cechComplexMap_id` (293), `cechComplexMap_comp` (300), `cechComplexMap_naturality` (311), `cechComplexMapHomotopy` (377), `cechComplexHomologyMap_eq` (419); `Cech/Coefficients.lean`: `cechComplexFunctorMapIso` (139). Same universes: `HasProducts.{w} A`, `ι κ : Type w`.

**Repair:** Replace the constructions of lines 1813–1829 by: "Refinement maps are Tau Ceti's. A refinement function `r : κ → ι` with `V_a ⊆ U_(r a)` is a morphism of formal coproducts `FormalCoproduct.mk _ V ⟶ FormalCoproduct.mk _ U`; `TauCeti.CategoryTheory.cechComplexMap` is its cochain map, with factors given by `cechComplexMap_f_π`, identity, composition and naturality by `cechComplexMap_id`, `cechComplexMap_comp`, `cechComplexMap_naturality`; two refinements are homotopic by `cechComplexMapHomotopy` and agree on cohomology by `cechComplexHomologyMap_eq`; a change of coefficients along an additive product-preserving functor is `cechComplexFunctorMapIso`. Consume them." Keep as targets only the restriction of the diagram to good covers and its cofinality. Keep the insertion formula and `T_s − T_r = δh + hδ` as a Check on the two-copy cover (value 3), not as a construction. Add the seven names to the Tau Ceti row of the supplier table and to this paragraph's `*Needs:*`.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Sheaves and exactness (B6.1) | constant sheaf ℝ on `S¹`, `S={1,−1}`; smooth sheaf; dimension shift `0→F→I→Q→0` | section 0/1 on two arcs: no global extension; `H¹(S¹;ℝ)=ℝ`; `H¹(F)=coker(Γ(I)→Γ(Q))=0` for soft F | sound; ownership clash | R01 |
| Native fixed-cover complex and coordinates | tuples `(a,b)`, `(a,b,c)`, `(a,a)`; empty and disconnected intersections | `δc(a,b)=c(b)−c(a)`; `c(b,c)−c(a,c)+c(a,b)`; `δc(a,a)=0`; `ℝ→0` not injective; `ℝ→ℝ²` not surjective | sound | none |
| Augmentation is conditional | three-arc cover of `S¹`, constant ℝ; pinned `quasiIsoAt_cechAugmentation_zero_iff` (`Cech/Basic.lean` 633) | Čech `H¹=ℝ` against 0 for the degree-zero complex; pinned right side is `IsSheafFor` for every `E` | sound | none |
| Raw refinement maps and homotopies | `U=(X,X)`, `V=(X)`, cochain `(2,5)`; two-point space with `P(∅)=ℤ` | `hδ(2,5)=5−2=3=T_s−T_r`; `ker d¹={(a,−a)}`, `H¹=ℤ`; constant presheaf: ranks 1 and 3, `H¹=0` | sound; at the pin | R02 |
| Coefficient maps and connecting morphism | `z↦z` on `S¹`; `S²` | log differences `0,0,−1`, so `δ_sm=−e`; `∫df=1`, `[δf]=−[df]`; `H¹((ℝ/ℤ)_const)=0→ℤ` | sound | none |
| `exists_freeProperQuotient_isSubmersion` | ℤ on ℝ; empty M with `dim G=1`; irrational flow on `T²` | `1−0=1`; `0−1=0`, vacuous; flow not proper, excluded by `ProperSMul` | sound | none |
| `exists_principalBundle_orbitFiber` | `S₃`, `g=(12)`, `h=(23)`; Mathlib scalar action on `S³`; empty M | `op g • x = g⁻¹ • x`; without inverse `(132)` against `(123)`; scalar action converts to `λ̄z`, `ω(X)=−1`; `λ⁻¹z` gives `+1` | sound | none |
| `exists_contMDiffFiberBundle_of_isProperMap` | `ℝ²∖{0}→ℝ`; base `ℝ⊔ℝ`; one-point base | fibres `ℝ∖{0}` and ℝ (not proper); fibres 1 and 2 points (not connected); model fibre P | sound | none |
| `exists_smoothGoodCover_refining`, finite form | ℝⁿ one member; two-arc `S¹`; empty M; compact M | `ρ(t)x` stays in a ball, `tx` leaves it; overlap disconnected; empty index; compact chart cover gives second countability | sound | none |
| `cechTupleConstantSection_bijective_iff` | nonempty good intersection; empty intersection | connected, so sections are constants: bijective; `ℝ→0`: not injective | both directions hold | none |
| `subsingleton_H_smoothSheafAddCommGroup` | `n=0`; model with boundary; Mathlib `exists_contMDiff_zero_iff_one_iff_of_isClosed` (`PartitionOfUnity.lean` 797) | `H⁰=C∞(M)≠0`, so `0<n` is used; lemma needs closed disjoint `s,t` only, no boundaryless hypothesis | sound | none |
| Hopf normalization (B6.2) | section `(1,z)/√(1+\|z\|²)`; frame at `(1,0)` | `s*dω=2du∧dv/(1+\|z\|²)²`, integral `2π`; permutation `(x₁,x₂,y₂,y₁)` even; `g₀₁=z̄/\|z\|` | sound | none |
| Classification and rank-one Chern–Weil (B6.2–B6.3) | `S²`, `T²`, dual and standard character | `c·dvol` curvature iff `c∈½ℤ`; `T²` period `4π²c`; dual line `+1`, standard `−1` | sound | none |
| Flat-bundle dictionary (B5.2, B6.4) | `a dθ` on `S¹`; two-arc cocycle `exp(2πia)` | holonomy `exp(−2πia)`, `h=−a`; class `[φ/2π]` evaluates to `a=−h`, dual class to `h` | sound | none |
| Ambrose–Singer (B5.2) | Hopf connection; flat connection; dense cyclic holonomy in `T²` | `Lie(H⁰)=ℝ`; `0`; `H⁰=1`, H immersed and not closed | sound | none |
| Reconstruction from transport (B5.1) | constant potential A | `P=exp(−tA)`, `−∂_tP\|₀=A`; `d/dt P⁻¹σ=w+Aσ₀` | sound | none |
| Cocycle convention against the pin (B1.3) | `hc` of `Topology/FiberBundle/GroupCocycle.lean` | `c j k * c i j = c i k` is `g_ki=g_kj g_ji` for `c i j=g_ji`; cohomologous `h_j⁻¹g_ji h_i` | agrees | none |
| Converse presentation theorem (B1.1) | discrete ℝ on `ℝ²`; `x³`; dimension count | `Φ` has rank 1<2; `dπ(0)=0`; Baire excludes `dim G<dim P−dim M` | sound | none |

- Source locators checked against the text: 18 (demailly-agbook lines 10196–10272: (4.9), (4.10), (4.12), (4.14), (4.15), (4.18), (4.19); Stacks Tags 01ED, 01EG, 01ET, 09UY; Nicolaescu 7.5.28, 7.5.31, 7.5.32, Remark 8.2.2; Meinrenken 1.21, Example 3.16, 3.17); pages agree.
- Library declarations: 208 backticked identifiers of the README looked up at the pins, all found or attributed to DifferentialGeometry; 18 opened at file and line (those cited in the table and R02, `TauCeti.PrincipalBundle` `Topology/FiberBundle/Principal.lean` 156, `TauCeti.ContMDiffFiberBundle` `Geometry/Manifold/FiberBundle/Basic.lean` 122, `TauCeti.ComplexProjectiveSpace` `Topology/ComplexProjectiveSpace/Basic.lean` 58).
- Cross-roadmap citations resolved on main: DifferentialGeometry 3.5, 4.3, 5.5, 8.3–8.5, 12.1, 12.4; LieGroups Layers 0–2, 4; AlgebraicTopology 3.2, 4, 6.1, 6.3; ComplexKahlerGeometry 5.1 anchor; HopfRinow and UniversalCovers under `Completed/`.
- Gate rerun result as supplied: every counter 0, build OK. Dependency check: `depcheck: 263 roadmaps, 2546 edges, 0 problem(s)`.
- Elaboration: `Suggested.lean` elaborates with seven `sorry` warnings and nothing else; the 14 elaborated signatures agree with the README statements, no binder lost.
- Padding probe: 35 attempts (`simp`, `rfl`, `infer_instance`, `trivial`, `exact?` on each of the seven theorems), none closes.
- Pull request text read against the head and the change from main: no sentence contradicted; no other file outside the folder changed.
- Overlap check: read ComplexKahlerGeometry, CharacteristicClasses, TopologicalKTheory, ManifoldOptimization, RiemannianManifoldsWithConvexBoundary, DifferentialGeometry, LieGroupoidsPoisson; soft/fine-sheaf acyclicity is shared with ComplexKahlerGeometry 2.5 (R01, owner B6.1); continuous principal bundles are TopologicalKTheory's and smooth ones this roadmap's; the circle class and B6.0's convex neighbourhoods are this roadmap's and are cited by the others.
- Source independence: 23 passages compared with 4 sources, none shared; largest share Kolář–Michor–Slovák, 26 of 78 locators; contents compared with it (Ch. III §§9–11 against B1–B5): independent, since §10 precedes §9 here and §11 is split over B3, B4 and B5; its body text could not be searched, so the wording was not compared with it.

## Not verifiable

- Kolář–Michor–Slovák, Lemmas 9.2 and 10.3 and the other section locators: the fetched extraction gives the contents page but its body text does not match text search; not in the seeded sample.
- Kobayashi–Nomizu I and both books of Lee: no legal copy read; cited by locator only.
- Freed and Schreiber–Waldorf locators: not in the seeded sample, not opened.

## Source issues

- **Misprint** in stacks-cohomology at §15, Tag 09UY, p. 24: the source says the refinement maps for `c` and `c′` satisfy `γ − γ′ = d∘h + h∘d` for its displayed insertion homotopy; it should be `γ′ − γ = d∘h + h∘d`, since in degree 0 `h(ds)_i = s_(c′ i) − s_(c i)`; affects nothing.

## For the human reviewers

- **Not tested.** The most-cited source is Kolář–Michor–Slovák (26 of 78 locators). Its contents page was read; its body text was not searchable in the fetched extraction, so wording was not compared with it.
- **Scope of R01.** Which roadmap owns soft-sheaf acyclicity is settled by the merge order in favour of B6.1; the change it needs is in ComplexKahlerGeometry 2.5, a folder this pull request does not carry.
