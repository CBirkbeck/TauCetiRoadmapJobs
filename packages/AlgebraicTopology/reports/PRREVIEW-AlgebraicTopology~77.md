# Review of AlgebraicTopology (pull request #1652 at 1f5b3f6)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/AlgebraicTopology/` at 1f5b3f6 (180 changed lines since 9cac1ae, the head the previous review read). Every passage of `README.md` (3659 lines) and `Suggested.lean` (308 lines) was read. Two Tau Ceti revisions are still in play and both were checked: the branch pin `358314d4` (`lake-manifest.json`, which the gate and my elaboration built against) and `2fd255d9`, the revision the README declares at `README.md:241`–`:243` and which main pins. No finding is blocking: the mathematics is sound, and the four repairs are a pin, a supplier citation, locators and the pull request's own text.

## R01 (P3) — The branch pin is still not bumped; the docstring now narrates two revisions, and the two Hurewicz headlines stay absent

**Location.** `lake-manifest.json` (Tau Ceti `358314d4`, Mathlib `f6090c70`); `Suggested.lean:37`–`:43` ("which the Tau Ceti revision this file is built against lacks (it has no `TauCeti.AlgebraicTopology.Homotopy` modules); at the revision the README's supplier contracts are read at they exist, and both theorems are statable on them"); `README.md:241`–`:243`.

**Claim.** The file states every headline statable at the pins; relative Hurewicz for a simply connected subspace and the universe-general absolute theorem cannot be stated.

**Witness.** `git diff origin/main HEAD -- lake-manifest.json` shows the branch still carries the old manifest, and the branch package directory `TauCeti/AlgebraicTopology/` has no `Homotopy` subdirectory. At `2fd255d9`, which the README's supplier contracts (`:241`–`:243`, `:379`–`:395`) declare as the revision every named declaration is read at, `TauCeti.RelHomotopyGroup.hurewicz` is at `AlgebraicTopology/Homotopy/Relative/Hurewicz.lean:324` and `HomotopyGroup.bijective_hurewicz` at `Homotopy/Hurewicz/Absolute.lean:161` (universe 0 only, so the universe-general and simply-connected-subspace forms are this roadmap's). The repaired docstring describes the two revisions instead of stating the theorems: that is process narrative in a docstring, and after the merge of main its sentence "lacks … modules" is false.

**Repair.** Carried from the previous review's R01 (and its predecessor's F01): merge `origin/main` (keep the deletions of the seven auxiliary Lean files at the modify/delete conflicts) and re-run the gate, so that the file is built at the revision the README reads its suppliers at. Then state, in Layer 8, relative Hurewicz for n ≥ 2, A nonempty and simply connected, π_i(X,A,a₀) = 0 for 1 ≤ i < n, in every universe (bijectivity of `TauCeti.RelHomotopyGroup.hurewicz (ModuleCat.of ℤ (ULift ℤ))` evaluated at 1) and the absolute theorem for `X : Type u` on `HomotopyGroup.hurewicz`; replace `:37`–`:43` by the one sentence that the twisted, boundary and compact-triad dualities are not stated and why. Whether the three CW-type headlines then switch to `TauCeti.CWType` is a style choice.

## R02 (P3) — §8.8b's "second way" to `groupCohomology A n` cites natives that give trivial-coefficient and `Hom(A,N)`-twisted cohomology, not `groupCohomology A n`

**Location.** `README.md:3042`–`:3049` ("Identify `H*(Bπ;A)` with Mathlib's `groupCohomology A n` for every `A : Rep ℤ π` in two ways and prove them equal: as the transport of Tau Ceti's … `classifyingSpaceTwistedCohomologyIsoGroupCohomology` along `c_G` …, and directly through the nerve's own covering Eπ→Bπ by `IsQuotientCoveringMap.singularCohomologyIsoGroupCohomology`, whose only hypothesis is the contractible total space"); the supplier bullet `:369`–`:376`.

**Claim.** Both cited natives identify `H*(Bπ;A)` with `groupCohomology A n` for every representation `A`.

**Witness.** At `2fd255d9`, `Cohomology/GroupCohomology.lean:248` is `B.singularCohomology (of k k) k (of k M) n ≅ groupCohomology (Rep.trivial k G M) n`: the trivial representation only (section variables `:25`, `[ContractibleSpace E]` the only extra hypothesis, as the bullet says). `ClassifyingSpace/LocalCoefficients.lean:150` is `(classifyingSpaceLocalSystem k A).twistedCohomology k (of k N) n ≅ groupCohomology ((Rep.ihom A).obj (Rep.trivial k G N)) n`: the dual-system cochains that `README.md:6.1` itself describes. Instance: G = ℤ/2, A = ℤ/2 with trivial action, k = N = ℤ. Then Hom_ℤ(ℤ/2, ℤ) = 0, so the native twisted cohomology is H^n(ℤ/2; 0) = 0 in every degree, while `groupCohomology (ℤ/2) n` = ℤ/2 for every n, which is what 6.1's direct A-valued cochains on Bπ compute. Neither native yields the claimed identification for this A, so the "two ways" are not both available and nothing proves them equal.

**Repair.** Rewrite `:3042`–`:3049`: the identification `H^n(Bπ;A) ≅ groupCohomology A n` for every `A : Rep ℤ π` is 6.1's direct-cochain construction on the nerve's covering Eπ→Bπ, compared with `inhomogeneousCochains` through the nerve's cellular resolution and `TauCeti.universalGSpaceResolution`; Tau Ceti's `IsQuotientCoveringMap.singularCohomologyIsoGroupCohomology` is its trivial-coefficient case, and `TauCeti.classifyingSpaceTwistedCohomologyIsoGroupCohomology` transported along `c_G` is the dual-system case, identifying `H^n(Bπ;A,N)` with `groupCohomology (Hom(A,N))`; the direct and dual identifications agree exactly when A is fibrewise reflexive (free of finite rank), as 6.1 records. Add the instance above as a Check. In the supplier bullet (`:369`–`:376`) say which module each native lands in (`Rep.trivial k G M`; `(Rep.ihom A).obj (Rep.trivial k G N)`).

## R03 (P3) — §4.7's realization CW structure and paracompactness, and §2.6, carry no locator

**Location.** `README.md:1315`–`:1335` ("Own the realization CW structure for every native simplicial set K … one cell per `K.nonDegenerate n` … Prove Hausdorffness, closure finiteness and the weak topology"; "Prove the general paracompactness of Hausdorff CW complexes"); `README.md:801`–`:816` (§2.6: pair/triple sequences and homotopy invariance with local coefficients).

**Witness.** The layer's locators (`:1358`–`:1364`) are Hatcher Chapter 0, §2.2 and Theorem 4.8; the Appendix section "Simplicial CW Structures" (hatcher lines 23204–23270, pp.533–536) treats Δ-complexes without degeneracies and never realizes a simplicial set, and Hatcher mentions paracompactness of CW complexes only in a bracketed remark pointing to VBKT (line 19836). §2.6 names no theorem or page; the layer spine (`:817`) cites Hatcher §§2.1–2.2 and 3.H as wholes, the standard the previous review applied to §§2.1 and 2.3.

**Repair** (checked in the texts). §4.7: "(May, *Simplicial Objects in Algebraic Topology*, §14, Theorem 14.1: |K| is a CW complex with one n-cell for each nondegenerate n-simplex; Milnor, *The geometric realization of a semi-simplicial complex*, Ann. of Math. 65 (1957), Theorem 1)", recorded as uncertified locators since no open copy is in the manifest; and for paracompactness "(Hatcher, *Vector Bundles and K-Theory*, Appendix to Chapter 1, Proposition 1.20, p.36)" (vbkt line 1445: every CW complex is paracompact), adding the proposition to the VBKT reference entry. §2.6: "(Hatcher, §3.H, p.333: the pair sequence, excision and additivity with local coefficients, and homotopy invariance through the pullback of the coefficient bundle)" (hatcher lines 14562–14575).

## R04 (P3) — The pull-request description is stale and states no merge order

**Location.** The title ("compact Cech pairs and relative cup modules") and description ("This amendment changes only README mathematics; existing Lean modules are unchanged"), byte-identical to the previous round.

**Witness.** `git diff --stat origin/main...HEAD` deletes seven Lean files of the folder and changes `Suggested.lean` by 3055 lines; `README.md:161`–`:162` puts compact closed-pair Čech theory outside scope. The worker's overlap report lists conflicting heads #1663 (same author, same two files), #1797, #1807, #1808, #1854 and #1187; DerivedModuleAlgebra on main still owns what `README.md:152`–`:153` and `:3462` say it consumes from 6.0, and #1701 makes Stage 6 item 0 the owner.

**Repair.** Carried from the previous review's R05. Retitle and rewrite the description to what the head does (README in the standard shape, `Suggested.lean` reduced to its headlines, seven auxiliary files deleted, compact Čech pairs out of scope), and state that #1701 merges before this pull request, which of #1652 and #1663 is rebased onto the other, and that #1797, #1807, #1808, #1854 and #1187 are rebased onto whichever lands.

## Previous findings

- R01 (pin; two Hurewicz headlines): **not repaired.** The manifest is unchanged; `Suggested.lean:37`–`:43` now names the missing carriers and says they exist at the README's revision, but states nothing. Now R01.
- R02 (ClassifyingSpaces natives): **repaired.** The supplier bullet `:355`–`:377` names the declarations and files, all present at `2fd255d9` (listed under Verified sound); `:109`–`:119` and `:3005` say nothing of ClassifyingSpaces is consumed; the `From TauCetiRoadmap.ClassifyingSpaces` subsection is deleted; §8.8b (`:3020`–`:3030`) takes `c_G` from `TauCeti.IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv` and its normalization from `TauCeti.IsAspherical.exists_homotopyEquiv`, which is what those theorems say (`Uniqueness.lean:73`, `:94`); the dependency table row (`:3534`) follows. One sentence of the rewrite cites a native for more than it gives: R02.
- R03 (five locators): **repaired**, each verified: §2.1 p.115 (hatcher 5024–5027); §2.3 p.117 for the boundary map as the class of ∂ of a relative cycle (5142–5146) and p.118 for the triple sequence from `0 → C_n(A,B) → C_n(X,B) → C_n(X,A) → 0` (5186–5191); §4.6 Example 2.42 p.144, degree `1 + (−1)^k` (6223–6231); §8.2 May §3 and §17 (no open copy; by locator), Moore exposé 18 Théorème 3 at 18-04 (moore1955 line 139, a group complex satisfies the extension condition), Théorème 4 at 18-06 (188), Définition 4 and Théorème 5 at 18-07 to 18-08 (239, 244–263) with the faces indexed from the last one as the README says, Stacks Lemma 14.31.6, Tag 08NZ (stacks-simplicial 2740); §8.8 Example 1B.7 p.89 (3844) and Proposition 1B.9 p.90 (3905).
- R04 (n = 0 Check; former names): **repaired.** `:2992`–`:2997` now reads the n = 0 hypotheses as a point's homology and derives contractibility by 8.5; `:3486`–`:3509` map every former name that main cites (checked against main 13665dd: `reducedSuspensionSphereHomeomorph`, `compactReducedSuspensionCarrierComparison`, `diskQuotientSphereHomeomorph`, `supBallEuclideanDiskHomeomorph`, `relativeCWPushout`, the `ordinaryPairQuotient*`/`diskBoundarySubset` and `ordinaryEM*` names of GeneralizedCohomology; `BasedTopPair`, `LSCategoricalCover`, `lsCategoryCount`, `normalizedLSCategory`, `finiteCWEulerCharacteristic` and `brouwerFixedPoint_compactConvex_finiteSpan` were already mapped at `:3448`–`:3470`; EnhancedDerivedSheaves' `towerDifference` is its own name).
- R05 (description and order): **not repaired**; now R04.

## Verified sound

**Gate, dependency check, build.**
- The worker's gate at 1f5b3f6 prints every counter zero (`… sorry-data=0 … imports=0 … dropped=0 … depcheck=0 … stray-files=0 … outside-folder=0 … build=0 OK`). `git diff --stat origin/main...HEAD` outside the folder is empty.
- The dependency check re-run here prints `depcheck: 238 roadmaps, 2354 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Every supplier named (UniversalCovers in `Completed/`; GeometricTopology, DifferentialGeometry, DGFloer, GeneralizedCohomology, TopologicalKTheory, CharacteristicClasses, ComplexKahlerGeometry) is on main and earlier in the order.
- `lake env lean TauCetiRoadmap/AlgebraicTopology/Suggested.lean` at `358314d4`: 24 s, exactly 12 "declaration uses `sorry`" warnings (lines 102, 124, 142, 160, 174, 189, 204, 213, 225, 246, 268, 291) and nothing else.

**Signatures and padding.**
- A scratch copy with `#check @name` for all 20 declarations (placed inside the namespace) elaborates; the file has no section `variable`, so no binder can be lost. Each elaborated type matches its README statement: cup length and bound `:1890`–`:1898`; `IsFundamentalClass` and both dualities `:2355`–`:2365`; bundle formula `:2545`–`:2554`; homological Whitehead `:2792`–`:2798`; CW type and recognition `:2949`–`:2957`; mapping space `:3190`–`:3194`; K(G,1) `:2999`–`:3001`; proper HEP and SDR `:2766`–`:2773`.
- One-tactic probe: each `sorry` replaced by `first | rfl | simp | infer_instance | decide | trivial | exact ⟨_, rfl⟩ | (simp_all; done) | sorry`; 10 declarations fall through to `sorry` and 2 (`finiteSourceMappingCWType`, `properStrongDeformationRetract_of_inverse`) end with `simp` leaving an unsolved goal. Nothing closes; nothing restates a definition, mirrors a Check or computes a value; the eight definitions are the ones the headlines need.

**Headline theorems.** The README names: the cup-length bound; Poincaré duality by a fundamental class with its twisted, boundary and compact-triad forms; the bundle Euler formula; homological Whitehead; finite CW type of compact smooth manifolds and the homology-sphere corollary; mapping-space CW type; the nerve K(G,1); proper SDR rectification; absolute Hurewicz in every universe and relative Hurewicz for simply connected A; proper Whitehead; Künneth, Wang, Cartan–Leray and Serre sequences; tower comparisons; representability with the EM loop comparison; relative obstruction theory. `Suggested.lean` states 12; the docstring names the rest as lacking carriers at the branch pin, which holds there (no `BasedTopPair`, `RelHomotopyGroup`, `CWType`, Serre-fibration, tower or supported-cohomology API at `358314d4`); the two Hurewicz exceptions at `2fd255d9` are R01.

**Seeded sample** (Hatcher printed page = marker − 9; others by running head):

| Target | Locator, hypotheses, support | Result |
| --- | --- | --- |
| 1.6 Topological groups | Hatcher §3.C Exercise 5, p.291 (line 12736: π₁ of an H-space is abelian, comparing concatenation with the pointwise product); `FundamentalGroup.cast_map_prod_mul` (`FundamentalGroup/TopologicalMonoid.lean:110`) and `instCommGroup` (`:120`) at `2fd255d9` | Correct |
| 2.1 Relative chain quotients | §2.1 p.115 (5024–5027: C_n(X,A) = C_n(X)/C_n(A), induced boundary) | Correct |
| 2.4 Homology axioms | Thm 2.10 p.111 (4863), Cor 2.25 p.126 (5521), §2.3 pp.160–162 (6977–7056: axioms for reduced theories on CW complexes, the Mayer–Vietoris consequence at p.162) | Correct |
| 2.6 Local systems | No own locator (R03); the pin's convention matches: `Singular/Twisted/Basic.lean:262` transports along the first edge for the zeroth face only | R03 |
| 3.2 Small chains | Prop 2.21 pp.119–120 (5222: the inclusion of U-small chains is a chain homotopy equivalence) | Correct |
| 4.2 Cellular differentials | Cellular boundary formula p.140 (6086), Lemma 2.34 p.137 (5963) | Correct |
| 4.7 Simplicial realizations | Orientation homeomorphism recomputed (table below); CW structure and paracompactness without locator (R03); VBKT Prop 1.20 p.36 (vbkt 1445) available | R03 |
| 5.3 Finite covers and transfer | §3.G p.321 (14023–14031: τ sums the n lifts, π_♯τ = n); Prop 3G.1 (14042–14045: over a field of characteristic 0 or prime to n, π^* injective with image the Γ-invariants, as the README says) | Correct |
| 5.5 Serre applications | SSAT Thm 1.3 p.8 (ssat 433–437: path-connected B, trivial π₁ action, filtration of H_n(X;G)); local coefficients p.17 (984–988); `mem_serreFibrations_proj` at `2fd255d9` without paracompactness (`SerreFibration/FiberBundle.lean:395`) | Correct |
| 6.3 Orientation and fundamental classes | Lemma 3.27 p.236 (10255–10259: unique class with prescribed local images over compact A, H_i = 0 for i > n); Prop 3.29 p.239 (10370–10376; the README uses its route for the weaker i > m vanishing) | Correct |
| 7.1 Finite CW models | `TauCeti.eulerChar_eq_finsum_finrank_singularHomology` over a division ring, `eulerChar_eq_cwEulerChar` (used at `EulerCharacteristic/Product.lean:84`) at `2fd255d9` | Correct |
| 7.4 Standard Euler values | `eulerChar_sphere` (`EulerCharacteristic/Sphere.lean:62`: unit sphere of E with finrank E = n+1, value 1 + (−1)^n), `eulerChar_torus` (`Torus.lean:50`: finite nonempty index, value 0), `eulerChar_complexProjectiveSpace` (`ComplexProjective.lean:68`: n + 1) | Correct |
| 8.1 Relative homotopy | §4.1 p.343 (14938–14952), Thm 4.3 p.344 (15007), Thm 4.8 p.349 (15205), Cor 4.12 p.351 (15308); `HomotopyGroup.prodEquiv` (`Topology/Homotopy/HomotopyGroup/Product.lean:176`), `prodMulEquiv` (`:200`) | Correct |
| 8.5 Whitehead and proper homotopy | Thm 4.5 p.346 (15109), Cor 4.33 p.367 (16001); FTW Thm 4.2 (ftw 600), Lemma 4.3 (610), Cor 4.9 (752–756); `TauCeti.SimplyConnectedAtInfinity` (`SimplyConnectedAtInfinity.lean:71`) and `ContinuousMap.HasProperHomotopyInverse` (`Proper.lean:41`) say what `:2735`–`:2744` and `:2846`–`:2848` say | Correct |
| 8.11 Mapping spaces and EM loops | Milnor Thm 3 p.276 (milnor1959 209–212), Cor 3 (218); Hatcher A.11 p.528 (22877), A.14 p.530 (23034–23037), A.16 p.531 (23081); Dugundji 4.1 p.357 (155), 4.2 p.358 (201), §7 p.363 (342–349), 7.1 p.363 (357) | Correct |

Also re-verified: Thm 4.32 p.366 (15961–15963: the relative statement needs A simply connected and nonempty), Moore and Stacks as under Previous findings, Example 2.42, Example 1B.7, Prop 1B.9.

**Adversarial table.** Values computed here; the table covers the sampled targets, every headline of `Suggested.lean` and every passage a finding or the change set touches.

| Statement | Instances tried | Values on each side | Result; change |
| --- | --- | --- | --- |
| 1.3 based theorem | S¹ by two arcs through x₀ | U₁∩U₂ has 2 components; free product of trivial groups → ℤ not onto; groupoid colimit gives ℤ | Holds |
| 1.6 topological groups | U(1): zᵐ·zⁿ; squaring; SO(3) | class m+n; 2m+2n both ways, 2m+n for a one-factor model; π₁ = ℤ/2, nontrivial class squares to 1 | Holds |
| 2.1 quotient chains | X = pt, A = ∅; A = X | C_n(pt)/0 = ℤ, H_n(pt,∅) = H_n(pt); 0 | Holds |
| 2.3 pair and triple | (D¹,S⁰); (D¹,S⁰,pt) | H₁(D¹,S⁰) = ker(ℤ² → ℤ, (a,b) ↦ a+b) = ℤ; triple map H₁(D¹,S⁰) → H₀(S⁰,pt) = ℤ iso | Holds |
| 2.5 shuffle class, n = 2 | T₁ − T₂ | ∂ = right + bottom − top − left; swap gives −1; unsigned sum leaves 2·diagonal | Holds |
| 2.5 S⁰ class | [q] − [−q] vs [q] + [−q] | local images (+1,−1) vs (+1,+1); augmentation 0 vs 2 | Holds |
| 2.6 transport convention | rank-one system on S¹, monodromy u | zeroth face transported: δ⁰(a) = u⁻¹a − a; forward model ua − a; u = 2 over ℤ/5 gives 2a vs a | Holds |
| 3.1 Sd, T on [v₀,v₁] | Hatcher formulas | Sd σ = [b,v₁] − [b,v₀]; ∂T + T∂ = σ − Sd σ; T[v] = [v,v] | Holds |
| 3.2 small chains | two-arc cover of S¹, a simplex through both arcs | after one subdivision each half lies in an arc; the inclusion of small chains induces H₁ = ℤ on both sides | Holds |
| 3.3 excision with ε on S¹ | p ∈ S¹, arc U ∋ p | H₁(S¹,S¹∖{p};ε) ≅ H₁(U,U∖{p};ℤ) = ℤ while H₁(S¹;ε) = 0 | Holds |
| 3.4 two-arc S¹ | H₀(U∩V) = ℤ² | (a,b) ↦ (a+b, −a−b), kernel ℤ(1,−1) = H₁(S¹) | Holds |
| 4.2 degree formula | RP², RP³ | d₁ = 0, d₂ = 2, d₃ = 0: H(RP³) = (ℤ, ℤ/2, 0, ℤ); 1 + (−1)^k is 0, 2, 0 | Holds |
| 4.3 RP² cellular | d₁ = 0, d₂ = 2 | H₁ = ℤ/2, H₂ = 0; d₂ = 0 would give H₂ = ℤ | Holds |
| 4.4 quotients | X/∅, X/X, (D⁰,∅), (I,∂I) | X₊; point; [−p] − [p]; winding +1 and −1 | Holds |
| 4.5 pushouts | S⁰ → pt; degree m on S¹; (∅,∅) | χ = 1 − 1 = 0 vs 3 − 1, 2 − 1; d₂ = m (S¹∨S², RP²); identity | Holds |
| 4.6 RPⁿ and sign system | n = 2 constant/ε; RP¹; S² frames | (ℤ,ℤ/2,0) vs (ℤ/2,0,ℤ); d₁ = 2, H₁(RP¹;ε) = 0, H₀ = ℤ/2; det(−A) = −det A in ℝ³, +det A in ℝ² | Holds |
| 4.7 cell homeomorphism | n = 1, z = ±1; n = 2, z = (1,0) | z = 1 ↦ e₁, z = −1 ↦ e₀; w = (−1,1,0), m = 1, weights (0, 2/3, 1/3) on the face opposite e₀ | Holds; R03 locator |
| 4.7 Δ[1], ∂Δ[2] | nondegenerate simplices | 2 + 1 cells, χ = 1; 3 + 3 cells, χ = 0, H₁ = ℤ; counting degenerate simplices gives infinitely many cells | Holds |
| 4.8 Sierpiński | opens ∅,{1},{0,1} | k-topology identical, not T2 | Holds |
| 5.1 Künneth | RP²×RP² over 𝔽₂ and ℤ | H₂ = 𝔽₂³ vs ℤ/2 = Tor(ℤ/2,ℤ/2) | Holds |
| 5.2 Wang | Klein bottle, reflection r | id − r_* = 2 on H₁(S¹); H₁(K) = ℤ ⊕ ℤ/2 | Holds |
| 5.3 transfer | identity; two sheets over a point, ℤ and 𝔽₂; ∅ → B; deck invariants | id; 1 ↦ (1,1) ↦ 2, (1,1) ≠ 0 while 2 = 0 in 𝔽₂; zero map; S² → RP² over 𝔽₃: π^* injective onto the ℤ/2-invariants H^0 = 𝔽₃, H² = 0 = invariants of 𝔽₃ under −1 | Holds |
| 5.4 torus | T², T³; 2×2 matrix on H₁ | Betti 1,2,1 and 1,3,3,1; Λ² acts by det | Holds |
| 5.5 Serre Checks | S¹×S² → S² vs Hopf; ∅ → B; {1} → S¹ | E² = ℤ at (0,0),(0,1),(2,0),(2,1); d² = 0 vs iso; E² = 0; no lift of the loop, E²₍₁,₀₎ = ℤ vs H₁ = 0 | Holds |
| 5.6 Čech differential | three opens; (1,1) term | δδc has U₂-component c − c = 0 vs 2c; D² = 0 vs 2δ∂c | Holds |
| 5.7 point cover | 0 → R → R² → R → 0 | c ↦ (−c,c), (a,b) ↦ a+b exact; H₀ = R | Holds |
| 6.0 towers | (3,1,0,…); ×2; ×3 | δ gives (2,1,0,…); 3x₀ + 1 ≡ 0 mod 4ᵏ impossible; Σ3ⁿ = −1/2 ∉ ℤ | Holds |
| 6.0 homotopy-square maps | fₙ = n·id on R → R; g = f | squares fail by id, correction −xₙ₊₁ cancelled; composite fails by 2n+1 = (n+1) + n | Holds |
| 6.1 transport | rank one, u = 2 over ℤ/5; fibre ℤ/2 over ℤ on a point | u⁻¹ − 1 = 2 vs u − 1 = 1; direct cochains ℤ/2, dual-system cochains 0 | Holds |
| 6.2 `lsCupLength_add_one_le_of_categoricalCover` | point; S¹; CP^∞ over ℤ; zero ring; ∅; n = 0 | 0+1 ≤ 1; 1+1 ≤ 2; length ⊤, no finite categorical cover, true since ℤ[x] has nonzero products of every length; sSup ∅ = 0 and 1 ≤ n; excluded by `[Nonempty X]`; `Fin 0` cover forces X = ∅ | Holds |
| 6.3 local generator | m = 1,2; reflection; m = 0 | det(I+J) = 1+m > 0; −1; empty determinant +1 | Holds |
| 6.4 `IsFundamentalClass` | S¹/ℤ: identity class and twice it; RP²/ℤ/4: the class 2; two points/ℤ; zero ring | generator, caps ℤ → ℤ iso; image 2 ∈ ℤ/4 not a generator, excluded (else H⁰ = ℤ/4 ≅ H₂ = ℤ/2 would be claimed); (u₁,u₂) bijective, (1,0) fails; every class fundamental, both sides 0 | Holds |
| 6.4 `poincareDuality_twoTorsionCoefficients` | S¹/𝔽₂; RP²/𝔽₂; RP²/ℤ/4; n = 0 | caps 𝔽₂ → 𝔽₂ bijective; Betti 1,1,1; 2 ≠ 0 excludes it; μ = 1 | Holds |
| 6.4 Lefschetz D² | k = 0,1,2 | R ↔ R, 0 ↔ 0, R ↔ R; absolute version fails at k = 0 | Holds |
| 6.5 linking | RP³; L(5,1), L(5,2); (5,2); 3-manifolds | 1/2; {1/5,4/5} vs {2/5,3/5}; exponent 9 skew; exponent (i+1)(n−i) even | Holds |
| 7.1 Euler and local systems | point; circle (1 or 2 cells); S²; Möbius system over ℚ, 𝔽₂ | 1; 0 = 0; 2; d₁ = 2 invertible so 0 = 1·0; trivial system, sum 0 | Holds |
| 7.2 `finsum_finrank_singularHomology_fiberBundle` | S³ → S²; Klein bottle over ℚ and 𝔽₂; S²×S²; empty base or fibre | 0 = 2·0 with d² ≠ 0; Betti 1,1,0 and 1,2,1, sum 0 = 0·0; 4 = 2·2; 0 = 0; E² bounded and finite-dimensional since B, F have finite CW type, so the finsum is finite | Holds |
| 7.4 standard values | S⁰, S¹, S²; T¹; CP⁰ | 2, 0, 2 = 1 + (−1)ⁿ; 0; 1 = 0 + 1 | Holds |
| 8.1 relative groups | (D²,S¹); RP² rel RP¹; k(S¹×S¹) | π₂ ≅ π₁(S¹) = ℤ; π₁(RP²,RP¹) = 0, ℤ → ℤ/2 onto not injective; diagonal loop ↦ (1,1) not (1,0) | Holds |
| 8.2 nerve of S₃; Moore complex | g = (12), h = (23); ℤ[Δ¹/∂Δ¹]; constant S₃ | d₁(g,h) = hg sends 1 ↦ 3, gh sends 1 ↦ 2; N₁ = ℤ(e − s₀v), N₂ = 0, unnormalized ranks 1,2,3; π₀ = S₃ nonabelian, π_n = 0, as Moore's Théorème 5 allows (abelian only for q ≥ 1) | Holds |
| 8.3 absolute Hurewicz | S¹ loops; S¹∨S¹; S² | k[S¹]; a^m b^n ↦ (m,n), commutator ↦ 0; identity ↦ +[S²], antipodal ↦ −[S²] | Holds |
| 8.4 relative Hurewicz | (D²,S¹∨S¹); (Dⁿ,Sⁿ⁻¹), n ≥ 3; (ℝ,(0,1)) | π₂ = F₂, H₂ = ℤ², abelianization; ℤ → ℤ, +1; 0 → 0 | Holds |
| 8.5 `homologicalWhitehead` | point; Poincaré sphere → S³; degree ±1, 2 on S² | identity; homology iso but π₁ of order 120, excluded by `SimplyConnectedSpace`; ±1 equivalence, ×2 not | Holds |
| 8.5 `properStrongDeformationRetract_of_inverse` | A = X; I with A = {0}; ℝ with A = {0}; A = ∅ | r = id, preimages I×K; H(t,x) = (1−t)x proper; constant inverse has preimage ℝ, so `hg` fails; g : C(X,∅) forces X = ∅ | Holds |
| 8.5 ends | ℝ, ℝ², ℝ³ | ends 2,1,1; SC at infinity true, false, true; stable π₁ 0, ℤ, 0 | Holds |
| 8.6 normalization | n = 1 | t ↦ t to winding +1, reflection to −1 | Holds |
| 8.7 CW type and recognition | n = 0; I; D²; Sⁿ; Poincaré sphere; n = 1; n = 0 in the Lean statement | finite discrete; 2+1 cells; point; identity; excluded; H₁ = 0 ≠ ℤ contradictory; hypotheses are a point's homology (`hvanish` for k ≠ 0, `htop` H₀ ≅ ℤ), X ≃ pt by Whitehead, X ≃ S⁰ false, excluded by `2 ≤ n` — the rewritten Check says exactly this | Holds |
| 8.8 `groupClassifyingSpace_isEMOne` | trivial group; ℤ; S₃ | point; S¹, generator edge +1; six elements, (12)(23) ≠ (23)(12), allowed since the native predicate is `IsAspherical ∧ Nonempty (π₁ ≃* G)` | Holds |
| 8.8b comparison `c_G` | G = ℤ: nerve ≃ S¹, Milnor model ≃ S¹ | two equivalence classes, degrees ±1; `exists_homotopyEquiv` with φ = κ_model⁻¹κ_bar selects degree +1 after the path change, the degree −1 model is excluded; CW type of Milnor's model is `instCWComplexClassifyingSpace` + `instT2SpaceClassifyingSpace` (`ClassifyingSpace/CWComplex.lean:358`, `:365`) through `CWType.of_cwComplex_univ` | Holds |
| 8.8b group cohomology | G = ℤ/2, A = ℤ/2 trivial, N = ℤ | native twisted H^n = H^n(G; Hom(ℤ/2,ℤ)) = 0; `groupCohomology (ℤ/2) n` = ℤ/2; direct cochains ℤ/2 | Fails for the cited route; R02 |
| 8.9 obstruction | D², f₁ of degree k, attaching degree m | c(f₀) = m, c(f₁) = km, δd = m(k−1) | Holds |
| 8.10 representability | X = ∅; S¹⊔S¹, A = ℤ, n = 1; n = 0 | one element vs 0; ℤ×ℤ; functions π₀X → A | Holds |
| 8.11 metric realization, ANR, domination | Δ¹; wedge x_j; Cantor set; S¹ → * → S¹ | d = 2|t−s|; 2/j → 0 only in K_m; no retraction; 0 ≠ 1 on H₁ | Holds |
| 8.11 `finiteSourceMappingCWType` | X = ∅; Y = ∅, X ≠ ∅; Y Sierpiński | C(∅,Y) a point; C(X,∅) = ∅ with the empty complex; contractible, K a point | Holds |
| 8.12 EM comparisons | RP¹, CP¹ | π₁ = ℤ ≠ ℤ/2; π₃ = ℤ ≠ 0 | Holds |

**Library declarations opened** (file:line at the pin named).
- `2fd255d9` (the README's declared revision), `TauCeti/AlgebraicTopology/ClassifyingSpace/`: `classifyingSpace` (`Basic.lean:73`), `classifyingSpaceBasepoint` (`:86`); `isEilenbergMacLaneSpaceOne_classifyingSpace` (`EilenbergMacLane.lean:104`), `exists_isEilenbergMacLaneSpaceOne` (`:120`, every group, no hypothesis); `IsAspherical.exists_homotopyEquiv` (`Uniqueness.lean:73`: `[CWType X] [CWType Y]`, an equivalence e and a path γ with the induced map followed by basepoint change along γ equal to φ) and `IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv` (`:94`, `G : Type v`, spaces in one `Type u`); `MonoidHom.classifyingSpaceMap` (`Functoriality.lean:60`); `classifyingSpaceHomotopyFunctor` (`HomotopyFunctor.lean:107`) and `fundamentalGroupFunctor_map_bijective_cellularClassifyingSpace` (`:209`, target with `Subsingleton (π_(n+2))` at every point); `classifyingSpaceSingularCohomologyIsoGroupCohomology` (`Cohomology.lean:89`), `classifyingSpaceSingularHomologyIsoGroupHomology` (`Homology.lean:69`), `classifyingSpaceLocalSystem` (`LocalCoefficients.lean:126`), `classifyingSpaceTwistedHomologyIsoGroupHomology` (`:136`), `classifyingSpaceTwistedCohomologyIsoGroupCohomology` (`:150`, target `groupCohomology ((Rep.ihom A).obj (Rep.trivial k G N))`); `universalGSpaceResolution` (`Resolution.lean:218`); `cellularClassifyingSpace` (`Cellular.lean:113`), `cellularClassifyingSpaceHomotopyEquiv` (`Comparison.lean:130`), `PresentationComplex` (`PresentationComplex.lean`); `IsQuotientCoveringMap.singularCohomologyIsoGroupCohomology` (`Cohomology/GroupCohomology.lean:248`, `[ContractibleSpace E]`, trivial representation); `CWType` and `CWType.of_cwComplex_univ` (`Topology/CWComplex/Classical/CWType.lean:38`, `:72`).
- `2fd255d9`, other: `FundamentalGroup.cast_map_prod_mul`, `instCommGroup` (`FundamentalGroup/TopologicalMonoid.lean:110`, `:120`); `Singular/Twisted/Basic.lean:262`; `HomotopyGroup.prodEquiv`, `prodMulEquiv` (`Topology/Homotopy/HomotopyGroup/Product.lean:176`, `:200`); `SimplyConnectedAtInfinity` (`:71`); `ContinuousMap.HasProperHomotopyInverse` (`Topology/Homotopy/Proper.lean:41`); `eulerChar_sphere`, `eulerChar_torus`, `eulerChar_complexProjectiveSpace` (above); `IsTriangulable.finiteCWType` (`Topology/Triangulable/FiniteCWType.lean:41`, `[CompactSpace X]`); `RelHomotopyGroup.hurewicz` (`Homotopy/Relative/Hurewicz.lean:324`), `HomotopyGroup.bijective_hurewicz` (`Homotopy/Hurewicz/Absolute.lean:161`), `bijective_hurewicz_of_subsingleton_homotopyGroup` (`Homotopy/Hurewicz/Relative.lean:282`); the module files `Singular/BrouwerFixedPoint.lean` and `Singular/DiscretePair.lean` exist (the worker's lead on `Singular.BrouwerFixedPoint` is a module name, not a declaration).
- `358314d4` (branch pin): the six imported modules, `TopCat.singularCup`, `TopCat.singularCap`, `TopPair.singularHomologyπ`, `TauCeti.FiniteCWType`, `TauCeti.eulerChar`, `TauCeti.IsEilenbergMacLaneSpaceOne` (the file elaborates); no `AlgebraicTopology/Homotopy` directory (R01).

**Cross-roadmap citations resolved** (main 13665dd): DGFloer Layer 1 items 1–4 and Layer 2 item 3; GeometricTopology's smoothing-and-triangulation item 1; DifferentialGeometry Layers 2, 5.1, 9.3, 10; GeneralizedCohomology G2.1; TopologicalKTheory T1.6, T7.0; CharacteristicClasses C1.2a S0–S5, C1.2b, C1.5, C2.0; ComplexKahlerGeometry K7; UniversalCovers in `Completed/`; TopologicalSheafCohomology §§1.1–1.2; AffineMorseLefschetz A4; MorseTheory M2/M4/M5; RiemannianGeometry R3, R4.7; BanachAlgebras A8; HeegaardFloer; FuchsianOrbifolds. ClassifyingSpaces on main (Stage 3 items 11–15, Stage 4 items 16–18 at its `:177`–`:245`) is no longer cited; its item 11 classifies maps out of a cellular K(G,1) into a K(H,1), a narrower statement than 8.8's `[X,Bπ]_* ≃ Hom(π₁X,π)` for every connected CW X (Hatcher 1B.9), so there is no second owner; the natives both now consume are Tau Ceti's.

**Overlaps and ownership.** The four dropped anchors `stage-{2,4,6,8}-…` cited by GeneralAlgebraicKTheory, PlanarTopology, SurfaceTopology, DerivedModuleAlgebra, MorseTheory and GeneralizedCohomology are mapped at `:581`–`:596` (Stage k = Layer k, same title). No cited id is dropped or revision-only. The six conflicting heads are R04. Ownership against the open heads: the cup-length bound is consumed by MorseTheory #1682 and DGFloer #963 from here; homological Whitehead by HomotopySpheres #1287 and FourManifolds #936; no second owner of `IsFundamentalClass`, the proper SDR, the nerve K(G,1) or the bundle Euler formula was found (`roadmaps grep`).

## Not verifiable

- May, *Simplicial Objects* (§§3, 14, 17), Milnor 1957, Eilenberg–Steenrod, G. W. Whitehead, Dold, Serre 1951, McCleary, K. Brown *Cohomology of Groups*, Conway–Friedl–Herrmann: no open copy in the manifest; cited by locator.
- Uncertified by the manifest: Freedman–Quinn §7.7, Milnor 1963 Lemmas 3.6–3.7, Weibel, Lee, tom Dieck.
- Elaboration of `Suggested.lean` at `2fd255d9`: not run (the permitted Lean commands run in the branch worktree, pinned at `358314d4`); the declarations named by the README were checked by reading the files at that revision.

## Source issues

- **Misprint** in moore1955 at Théorème 3, p.18-04: the text refers to conditions (i) and (iii) of "définition 4", but the conditions of the extension-and-replacement definition are those of Définition 3 and Définition 4 has no clauses (read from a scan; the digit may be an OCR error); it should be Définition 3; affects nothing.
- **Misprint** in milnor1959 at the proof of Corollary 3, p.276: the source invokes a Theorem 4 for the CW type of the triad; the paper has no Theorem 4 and Theorem 3 is meant; affects nothing.
