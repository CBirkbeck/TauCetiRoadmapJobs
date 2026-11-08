# Review of AlgebraicTopology (pull request #1652 at 9cac1ae)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/AlgebraicTopology/` at 9cac1ae (1199 changed lines since 4e825d6). Every passage of `README.md` (3587 lines) and `Suggested.lean` (304 lines) was read. Two Tau Ceti revisions are in play and both were checked: the branch pin `358314d4` (`lake-manifest.json`, which the gate built against) and `2fd255d9`, the revision the README declares at `README.md:239`–`:241` and which main pins. No finding is blocking: the mathematics stated is sound, and the repairs below are citations, locators, prose and the pull request's own text.

## R01 (P3) — The branch pin was not bumped; after the merge the docstring's library claims are false and two Hurewicz headlines are statable

**Location.** `lake-manifest.json` (Tau Ceti `358314d4`, Mathlib `f6090c70`); `Suggested.lean:32`–`:39` ("The statements below use only declarations present in the Tau Ceti this file is built against … relative Hurewicz … and the universe-general absolute Hurewicz theorem need based pairs, relative homotopy groups and the Hurewicz map, which the Tau Ceti this file is built against lacks"); `README.md:239`–`:241`.

**Claim.** The Lean file is built against a Tau Ceti that lacks based pairs and Hurewicz maps, so those headlines cannot be stated.

**Witness.** `git diff a0ad405e HEAD -- lake-manifest.json` is empty: the branch does not touch the manifest, so the merge takes main's pin `2fd255d9`, and the file is then built there. At `2fd255d9`: `TauCeti.RelHomotopyGroup.hurewicz` (`TauCeti/AlgebraicTopology/Homotopy/Relative/Hurewicz.lean:324`), `HomotopyGroup.hurewicz` for `X : Type w` (`AlgebraicTopology/Homotopy/Hurewicz/Basic.lean:100`, `:201`), `TauCeti.BasedTopPair`, `TauCeti.CWType` (`Topology/CWComplex/Classical/CWType.lean:38`). The native theorems are universe 0 only (`Hurewicz/Absolute.lean:157` `variable {X : Type}`; `Hurewicz/Relative.lean:282`), so the universe-general and simply-connected-subspace forms are this roadmap's and statable. The elaboration here was at `358314d4`; nobody has elaborated the file at the pin it will merge into.

**Repair.** Merge `origin/main` (step 1 of the previous review's R01, still outstanding; the modify/delete conflicts on the seven deleted Lean files are resolved by keeping the deletions) and re-run the gate. Then state, in Layer 8, `relativeHurewicz_of_simplyConnected` (n ≥ 2, A nonempty and simply connected, π_i(X,A,a₀) = 0 for 1 ≤ i < n, in every universe: `TauCeti.RelHomotopyGroup.hurewicz (ModuleCat.of ℤ (ULift ℤ))` evaluated at 1 is bijective) and the absolute theorem for `X : Type u` on `HomotopyGroup.hurewicz`, and delete `:37`–`:39`. Whether the three CW-type headlines then switch to `TauCeti.CWType` or keep the explicit model is a style choice; the Conventions (`:182`–`:184`) already say the two are the same condition.

## R02 (P3) — The ClassifyingSpaces results this roadmap consumes are native at `2fd255d9` and are cited only as roadmap sections

**Location.** `README.md:109`–`:116` ("ClassifyingSpaces owns Milnor and presentation models, their pointed CW-type uniqueness and the cellular/bar projective-resolution comparisons"); `:518`–`:522` ("### From TauCetiRoadmap.ClassifyingSpaces … Stage 3 items 11–15 … Stage 4 items 16–18 …, consumed only by 8.8b"); §8.8 `:2987`–`:3016` ("Compare this bar model pointedly with ClassifyingSpaces' Milnor and presentation models …"; "identify `H*(Bπ;A)` with Mathlib's `groupCohomology A n` for every `A : Rep ℤ π` …").

**Claim.** Milnor's model, its K(G,1) property, uniqueness of CW-type K(G,1)s, functoriality and the group-(co)homology identifications are supplied by the ClassifyingSpaces roadmap.

**Witness.** At `2fd255d9` they are Tau Ceti's, in `TauCeti/AlgebraicTopology/ClassifyingSpace/`: `TauCeti.classifyingSpace`, `TauCeti.classifyingSpaceBasepoint` (`Basic.lean`); `TauCeti.isEilenbergMacLaneSpaceOne_classifyingSpace` and `TauCeti.exists_isEilenbergMacLaneSpaceOne` (`EilenbergMacLane.lean:120`, every group, no hypothesis); `TauCeti.IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv` for `[CWType X] [CWType Y]` and `TauCeti.IsAspherical.exists_homotopyEquiv` (`Uniqueness.lean:94`); `MonoidHom.classifyingSpaceMap` with the functor laws (`Functoriality.lean`); `TauCeti.classifyingSpaceHomotopyFunctor` and `fundamentalGroupFunctor_map_bijective_cellularClassifyingSpace` (`HomotopyFunctor.lean`); `TauCeti.classifyingSpaceSingularCohomologyIsoGroupCohomology` with naturality and Bockstein compatibility (`Cohomology.lean`), `TauCeti.classifyingSpaceSingularHomologyIsoGroupHomology` (`Homology.lean`), the local-coefficient version through `TauCeti.classifyingSpaceLocalSystem` (`LocalCoefficients.lean`); `TauCeti.universalGSpaceResolution` (`Resolution.lean`); `TauCeti.cellularClassifyingSpace` and `TauCeti.cellularClassifyingSpaceHomotopyEquiv` (`Cellular.lean`, `Comparison.lean`); `TauCeti.PresentationComplex` (`PresentationComplex.lean`). The nerve model itself is not native (no `nerve` in either directory).

**Repair.** Name these declarations and files in "From Mathlib and Tau Ceti", as the section already does for Brouwer, transfer and Euler characteristic. Rewrite 8.8b: the comparison of the nerve model with Milnor's model is `TauCeti.IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv` applied to `groupClassifyingSpace_isEMOne` and the 4.7 CW structure, normalized by κ; `[X,Bπ]_* ≃ Hom(π₁X,π)` and `H*(Bπ;A) ≅ groupCohomology A` for the nerve model are transports of the native identifications along that equivalence. Keep as targets only what is nerve-specific: the K(G,1) property of the realized nerve, the edge-label convention, the chain-level formula ψ(g₁,…,g_k) = φ(g₁⁻¹,…,g_k⁻¹) against `inhomogeneousCochains`, the cup comparison and the all-degree discrete comparison. Reduce the ClassifyingSpaces contract to whatever remains, or delete it.

## R03 (P3) — Five sampled targets carry no locator for their own statement

**Location.** §2.1 `:682`–`:689`, §2.3 `:690`–`:696`, §4.6 `:1246`–`:1280`, §8.2 `:2628`–`:2668`, §8.8 `:2970`–`:3030`.

**Witness.** None of these paragraphs gives a theorem and page; the layer paragraphs cite "Eilenberg–Steenrod Chapters I–III and Hatcher Sections 2.1–2.2 and 3.H" (`:797`), "Hatcher Chapter 0 … Section 2.2" (`:1334`) and "May, Chapters 3 and 12" (`:3390`) as wholes.

**Repair** (each checked in the text):
- §2.1: "(Hatcher, §2.1, p.115: C_n(X,A) = C_n(X)/C_n(A) with the induced boundary)" (hatcher lines 5024–5027).
- §2.3: "(Hatcher, §2.1, p.117 for the pair sequence and p.118 for the triple)" (hatcher lines 5145–5147, 5186–5189).
- §4.6: "(Hatcher, Example 2.42, p.144: d_k = 1 + (−1)^k, so 2 in positive even degree and 0 in odd degree)" (hatcher lines 6223–6231).
- §8.2: cite May, *Simplicial Objects*, by number: Theorem 17.1 for "every simplicial group is Kan", §17 for the Moore complex N_n = ⋂_{i≥1} ker d_i with d₀ and π_n(G) ≅ H_n(NG), §3 for homotopy groups of Kan complexes. No open copy was available here; record the locators as uncertified.
- §8.8: "(Hatcher, Example 1B.7, p.89, for the Δ-complex BG as a K(G,1); Proposition 1B.9, p.90, for maps from a connected CW complex)" (hatcher lines 3844, 3905).

## R04 (P3) — Prose defects and unmapped dropped names

**Location and repair.**
- §8.7 Check `:2966`–`:2968` ("for `n=0` a simply connected space with the homology of `S^0` would be contractible while `S^0` has two points"). A path-connected space never has H₀ = ℤ², so no space satisfies that description. What the hypotheses of `nonempty_homotopyEquiv_sphere_of_homologySphere` say at n = 0 is H_k = 0 for k ≠ 0 and H₀ ≅ ℤ, the homology of a point; such a simply connected space of CW type is contractible by the homological Whitehead theorem, and the conclusion X ≃ S⁰ fails. Write that.
- Downstream consumers `:3406`–`:3446`. Roadmaps on main cite Lean names of the old `Suggested.lean` that this head deletes, and the bullets map most of them by object but none by name: `ordinaryPairQuotient`, `ordinaryPairQuotientComparison`, `ordinaryPairQuotientCohomologyComparison`, `diskBoundarySubset` (GeneralizedCohomology `:33`, `:1031`: "`ordinaryPairQuotient (TopCat.disk 4) (diskBoundarySubset 4)`"), `ordinaryEMRepresentability`, `ordinaryEMUniversalClass` (GeneralizedCohomology `:35`, `:237`), `compactReducedSuspensionCarrierComparison`, `reducedSuspensionSphereHomeomorph` (DGFloer, RiemannianGeometry), `relativeCWPushout` (CharacteristicClasses, MorseTheory), `supBallEuclideanDiskHomeomorph`, `diskQuotientSphereHomeomorph` (GeneralizedCohomology, CharacteristicClasses). Add one line per name, old name → section (`ordinaryPairQuotient*` → §4.5's pair-quotient comparisons, which the GeneralizedCohomology bullets at `:3423` and `:3441` do not mention). `LSCategoricalCover`, `lsCategoryCount`, `normalizedLSCategory`, `finiteCWEulerCharacteristic`, `BasedTopPair` and `brouwerFixedPoint_compactConvex_finiteSpan` are already mapped at `:3426`–`:3440`.

## R05 (P3) — The pull-request description is stale and states no merge order

**Location.** The title ("compact Cech pairs and relative cup modules") and description ("This amendment changes only README mathematics; existing Lean modules are unchanged").

**Witness.** `git diff --stat origin/main...HEAD` deletes seven Lean files of the folder and changes `Suggested.lean` by 3049 lines; `README.md:160` puts compact closed-pair Čech theory outside scope. The worker's overlap report lists conflicting heads #1663, #1797, #1807, #1808, #1854 and #1187. DerivedModuleAlgebra on main (`TauCetiRoadmap/DerivedModuleAlgebra/README.md:1420`–`:1421`: "The cofinal-shift and specified-homotopy-square comparisons are owned by §1.1 here"; its `:1658` Check is 6.0's ℤ₃/ℤ example) still owns what `README.md:152`–`:153` and `:3434` say it consumes from 6.0; #1701 (DerivedModuleAlgebra, head 69e20e7, `:64`–`:69`) makes AlgebraicTopology Stage 6 item 0 the sole owner.

**Repair.** Retitle and rewrite the description to what the head does (README in the standard shape, `Suggested.lean` reduced to its headlines, seven auxiliary files deleted, compact Čech pairs out of scope), and state: that #1701 merges before this pull request, so that the 6.0 consumer sentences hold on main; which of #1652 and #1663 is rebased onto the other; and that #1797, #1807, #1808, #1854 and #1187 are rebased onto whichever lands. Carried from the previous review's R08 (and its predecessors' R01–R02); the description is byte-identical.

## Previous findings

- R01 (pin and re-planned natives): **partly repaired.** Steps 2–4 done: `brouwerFixedPoint_compactConvex`, `LSCategoricalCover`, `lsCategoryCount`, `ordinaryWhitehead`, `ordinaryWhitehead_cwType`, `CWTypeModel` are gone; the cup-length bound is stated per categorical cover (`:98`–`:104`) with the native-count form explained at `:94`–`:97`; the three CW-type headlines carry the explicit model C ⊆ K; every row of the previous table is named with its file in "From Mathlib and Tau Ceti" (`:331`–`:478`); §§2.7, 6.2, 8.1, 8.3, 8.5 are cut to what the files lack; the docstring is rewritten (`:26`–`:35`). Step 1 (merge main) was not done: now R01.
- R02 (Euler carriers): **repaired.** `finiteCWEulerCharacteristic`, its invariance and `FiniteCWTypeModel` are deleted; `compactManifoldFiniteCWType` and `compactManifoldWithBoundaryFiniteCWType` conclude `TauCeti.FiniteCWType M` (`:200`–`:213`); §7.1–7.4 consume `TauCeti.cwEulerChar`, `TauCeti.eulerChar`, `eulerChar_eq_cwEulerChar`, `ContinuousMap.HomotopyEquiv.eulerChar_eq`, the product, covering, Mayer–Vietoris and standard-value theorems by name (`:2483`–`:2575`); the FuchsianOrbifolds bullet gives the replacement names (`:3436`–`:3440`).
- R03 (fundamental-class duality): **repaired.** `IsFundamentalClass` (`:109`–`:114`) and `poincareDuality_of_isFundamentalClass` (`:120`–`:130`) are added with the two tested instances as Checks (`:2403`–`:2408`); the docstring names only the twisted, boundary and compact-triad forms as unstated (`:39`–`:42`).
- R04 (seven unlocated targets): **repaired**, each locator re-verified in the text: §3.3 `:854` (Thm 2.20, p.119; §3.H, p.333), §3.4 `:862` (§2.2, p.149; §3.H, p.333), §4.3 `:922`–`:923` (Thm 2.35, p.139; §3.H, p.333), §5.2 `:1446`–`:1448` (Example 2.48, p.151, id − g_*), §5.5 `:1529`–`:1532` (SSAT Thm 1.3, p.8; local coefficients, p.17: ssat lines 433, 984), §6.2 `:1833`–`:1836` and `:1917`–`:1919`, §8.10 `:3123`–`:3124` (Thm 4.57, p.393).
- R05 (two wrong locators): **repaired.** `:648` cites §3.C, Exercise 5, p.291 (hatcher line 12736); `:664`–`:666` cites Brown §6.7 Exercise 6, p.250, and Theorem 6.7.2, p.240.
- R06 (unlocated and unlisted sources): **repaired.** Milnor, *Morse Theory*, 1963, Lemmas 3.6–3.7 (`:1115`); Strøm 1968, Theorem 6, p.135 (`:1119`–`:1120`; strom1972 line 181 under the running head 135); Dugundji §7 p.363, Theorem 4.1 p.357, Corollary 4.2 p.358, Theorem 7.1 p.363 (`:3207`–`:3214`; dugundji1951 lines 155, 201, 342–349, 357); FTW, VBKT, Freedman–Quinn, Milnor 1963 and Strøm are in References (`:3570`–`:3582`).
- R07 (four prose defects): **repaired.** The Euler sentence is gone from §4.4; §1.3 states the based theorem with its hypotheses and kernel (`:606`–`:614`); `:3185` reads "no input from 8.10 or 8.11b"; the loop-space application (`:3231`) now precedes the three Checks blocks.
- R08 (description and order): **not repaired**; now R05.

## Verified sound

**Gate, dependency check, build.**
- The worker's gate at 9cac1ae prints every counter zero (`… sorry-data=0 … imports=0 … readme-ids-missing=0 … depcheck=0 … stray-files=0 … outside-folder=0 … build=0 OK`). `git diff --stat origin/main...HEAD` outside the folder is empty.
- The dependency check re-run here prints `depcheck: 237 roadmaps, 2342 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Every supplier roadmap named (UniversalCovers in `Completed/`; GeometricTopology, DifferentialGeometry, DGFloer, ClassifyingSpaces, GeneralizedCohomology, TopologicalKTheory, CharacteristicClasses, ComplexKahlerGeometry) is on main.
- `lake env lean …/Suggested.lean` at `358314d4`: 11.3 s, exactly 12 "declaration uses `sorry`" warnings (lines 98, 120, 138, 156, 170, 185, 200, 209, 221, 242, 264, 287) and nothing else.
- The six `TauCeti.*` imports exist at both revisions; `TopCat.singularCup`, `TopCat.singularCap`, `TopPair.singularHomologyπ`, `TauCeti.FiniteCWType`, `TauCeti.eulerChar` and `TauCeti.IsEilenbergMacLaneSpaceOne` exist at `2fd255d9` (`Cohomology/Cup.lean:203`, `Cohomology/Cap/Basic.lean:101`, `Singular/Relative.lean`, `Topology/CWComplex/Classical/FiniteCWType.lean:74`, `Cellular/EulerCharacteristic/FiniteCWType.lean:123`, `EilenbergMacLane/Basic.lean:123`), as do the Mathlib names `SSet.const`, `nerveEquiv`, `SSet.toTopSimplex`; elaboration at that pin was not run (R01).

**Signatures and padding.**
- One scratch copy with `#check @name` for all 20 declarations elaborates; the file has no section `variable`, so no binder can be lost. Each elaborated type matches its README statement: cup length and bound `:1862`–`:1870`; `IsFundamentalClass` and both dualities `:2327`–`:2337`; bundle formula `:2517`–`:2526`; homological Whitehead `:2764`–`:2770`; CW type and recognition `:2921`–`:2929`; mapping space `:3162`–`:3166`; K(G,1) `:2970`–`:2972`; proper HEP and SDR `:2738`–`:2745`.
- One-tactic probe: each of the 12 `sorry`s replaced by `first | rfl | simp | infer_instance | decide | trivial | exact ⟨_, rfl⟩`; all 12 fail. Nothing restates a definition, mirrors a Check or computes a value; the eight definitions are the ones the headlines need.

**Headline theorems.** The README names: the cup-length bound; Poincaré duality by a fundamental class with its twisted, boundary and compact-triad forms; the bundle Euler formula; homological Whitehead; finite CW type of compact smooth manifolds and the homology-sphere corollary; mapping-space CW type; the nerve K(G,1); proper SDR rectification; absolute Hurewicz in every universe and relative Hurewicz for simply connected A; proper Whitehead; Künneth, Wang, Cartan–Leray and Serre sequences; tower comparisons; representability with the EM loop comparison; relative obstruction theory. `Suggested.lean` states 12; the docstring names the rest as lacking carriers at the branch pin, which I confirmed at `358314d4` (no `BasedTopPair`, `RelHomotopyGroup`, `CWType`, Serre-fibration, tower or supported-cohomology API there). The two Hurewicz exceptions at `2fd255d9` are R01.

**Seeded sample** (Hatcher printed page = marker − 9; Milnor, Strøm, Dugundji, Brown by running head):

| Target | Locator, hypotheses, support | Result |
| --- | --- | --- |
| 1.3 Based presentations | Hatcher Thm 1.20 (line 1956, p.43): path-connected opens containing x₀, pairwise intersections path-connected ⇒ surjective; triple intersections ⇒ kernel generated by i_αβ(ω)i_βα(ω)⁻¹. README `:605`–`:614` matches | Correct |
| 2.1 Relative chain quotients | No own locator; Hatcher p.115 (lines 5024–5027) | R03 |
| 2.3 Pair and triple sequences | No own locator; p.117 (5145), p.118 (5186–5189) | R03 |
| 3.4 Local Mayer–Vietoris | §2.2 p.149 (line 6503) and §3.H p.333 (14565–14571: pair sequence and excision for local coefficients) | Correct |
| 4.6 Projective spaces | No own locator; Example 2.42 p.144 (6223–6231): d_k = 1 + (−1)^k, matching "±2 in positive even degree, 0 in odd" | R03 |
| 5.3 Finite covers and transfer | §3.G p.321 (lines 14019–14031): τ sums the n lifts, π_♯τ = n; Prop 3G.1 (14042) is the field-coefficient invariants corollary | Correct |
| 5.5 Serre applications | SSAT Thm 1.3 p.8 (ssat 433: path-connected B, trivial π₁ action, E² = H_p(B;H_q(F;G)), filtration); "Local Coefficients" supplement p.17 (ssat 984–992) | Correct |
| 6.4 Poincaré–Lefschetz | Thm 3.30 p.241 (10453: closed R-orientable, cap with [M] iso in all k); fundamental class p.236 (10245); 2 = 0 ⇔ unit of order 2, p.235 (10227–10229); Thm 3.26 (10237); Thm 3.43 p.254 (10976: ∂M = A ∪ B, common boundary, cap iso H^k(M,A) → H_{n−k}(M,B)); Prop 3.29 p.239 (10370) | Correct |
| 7.1 Finite CW models | `TauCeti.eulerChar_eq_finsum_finrank_singularHomology (k) [DivisionRing k]` (`Cellular/EulerCharacteristic/FiniteCWType.lean:102`), `finsum_finrank_singularHomology_of_finite_cwComplex` (`Singular.lean:141`) at both revisions | Correct |
| 7.2 Homotopy, product and bundle | Thm 2.44 p.146 (6380); Exercises 20–22 p.157 (6854–6857); Tau Ceti product/covering/Mayer–Vietoris names present at `2fd255d9` | Correct |
| 8.2 Kan and cubical comparison | No locator | R03 |
| 8.4 Relative Hurewicz | Thm 4.32 p.366 (15961–15963): the relative statement with A simply connected and nonempty is part of 4.32; README `:2709`–`:2721` matches; Thm 4.37 (16124) is the π₁-action version | Correct |
| 8.6 Sphere normalization | §4.1 p.340 (14820–14827): (Iⁿ,∂Iⁿ) → (X,x₀), ∂I⁰ = ∅ | Correct |
| 8.8 Nonabelian classifying spaces | No locator; Example 1B.7 p.89 (3844), Prop 1B.9 p.90 (3905) | R03 |
| 8.9 Relative obstruction theory | VBKT §3.3: hypotheses (1)–(3) p.99, Lemma 3.18 p.100 (vbkt 3881), Prop 3.19 p.101 (3908); README `:3043`–`:3049` states the untwisted hypotheses correctly | Correct |

Also re-verified: Milnor Thm 2 p.273 (milnor1959 line 103, head 273 at line 67), Thm 3 and Cor 3 p.276 (209, 218, head at 190); Strøm Thm 6 p.135 (strom1972 181); Dugundji 4.1/4.2/§7/7.1 (155, 201, 342–349, 357); FTW Thm 4.2 (ftw1973 600), Lemma 4.3 (610), Cor 4.9 (752: finite-dimensional locally finite CW, simply connected and simply connected at infinity, proper homotopy equivalence iff H_* and H_c^* isomorphisms); Brown 6.7.2 (brown 9424), Exercise 6 (9768), 3.6.4 (3995); Hatcher Cor 4.33 (16001), Thm 4.5 (15109), Thm 4.8 (15205), Cor 4.12 (15308), Thm 4.57 (17069), §3.C Exercise 5 (12736), Thm 3.2 (8476), §3.E (13238), Thm 3.5 (8799), Lemma 3.6 (8935), Thm 3.11 (9099), Ex 3.16 (9388), Prop 3B.1 (11612), Thm 3B.6 (11898), Props A.1, A.3, A.6, A.11, A.14, A.16 (lines 5988 ref., 22617, 22693, 22877, 23034, 23081).

**Adversarial table.** Values computed here; the table covers the sampled targets, every headline of `Suggested.lean` and every target a finding touches.

| Statement | Instances tried | Values on each side | Result; change |
| --- | --- | --- | --- |
| 1.3 based theorem | S¹ by two arcs through x₀ | U₁∩U₂ has 2 components; free product of two trivial groups → ℤ not onto; groupoid colimit over both components gives ℤ | Holds; hypothesis needed |
| 1.6 topological groups | U(1): zᵐ·zⁿ; squaring; SO(3) | class m+n; 2m+2n both ways vs 2m+n for a one-factor model; π₁ = ℤ/2, nontrivial class squares to 1 | Holds |
| 2.1 quotient chains | X = pt, A = ∅; A = X | C_n(pt)/0 = ℤ, H_n(pt,∅) = H_n(pt); 0 | Holds; R03 locator |
| 2.3 pair and triple | (D¹,S⁰); (D¹,S⁰,pt) | H₁(D¹,S⁰) = ker(ℤ² → ℤ, (a,b) ↦ a+b) = ℤ; H₁(D¹,S⁰) → H₀(S⁰,pt) = ℤ iso | Holds; R03 |
| 2.5 shuffle class, n = 2 | T₁ = [(0,0),(1,0),(1,1)], T₂ = [(0,0),(0,1),(1,1)] | ∂(T₁ − T₂) = right + bottom − top − left; swap gives −1; unsigned sum leaves 2·diagonal | Holds |
| 2.5 S⁰ class | [q] − [−q] vs [q] + [−q] | local images (+1,−1) for both at q; augmentation 0 vs 2 | Holds |
| 3.1 Sd, T on [v₀,v₁] | Hatcher formulas | Sd σ = [b,v₁] − [b,v₀]; ∂Tσ + T∂σ = σ − Sd σ; T[v] = [v,v], ∂ = 0 | Holds |
| 3.3 local excision, sign system ε on S¹ | p ∈ S¹, arc U ∋ p | H₁(S¹,S¹∖{p};ε) ≅ H₁(U,U∖{p};ℤ) = ℤ while H₁(S¹;ε) = 0 | Holds |
| 3.4/3.5 two-arc S¹ | H₀(U∩V) = ℤ² | (a,b) ↦ (a+b, −a−b), kernel ℤ(1,−1) = H₁(S¹) | Holds |
| 4.3 RP² cellular | d₁ = 0, d₂ = 2 | H₁ = ℤ/2, H₂ = 0; d₂ = 0 would give H₂ = ℤ | Holds |
| 4.4 quotients | X/∅, X/X, (D⁰,∅), (I,∂I) | X₊ with H̃ = H; point; [−p] − [p]; winding +1 and −1 | Holds |
| 4.5 pushouts | S⁰ → pt; degree m on S¹; (∅,∅) | χ = 1 − 1 = 0 vs 3 − 1, 2 − 1 for wrong models; d₂ = m (S¹∨S², RP²); identity | Holds |
| 4.6 RPⁿ and sign system | n = 2 constant/ε; RP¹ Möbius; S² frames | d₂,d₁ = 2,0 vs 0,2: H = (ℤ,ℤ/2,0) vs (ℤ/2,0,ℤ); d₁ = 2, H₁(RP¹;ε) = 0, H₀ = ℤ/2; det(−A) = −det A in ℝ³, +det A in ℝ² | Holds; R03 locator |
| 4.7 cell homeomorphism | n = 1, z = ±1; n = 2, z = (1,0) | e₁, e₀; weights (0, 2/3, 1/3) on the face opposite e₀ | Holds |
| 4.8 Sierpiński | opens ∅,{1},{0,1} | k-topology identical, not T2 | Holds |
| 5.1 Künneth | RP²×RP² over 𝔽₂ and ℤ | H₂ = 𝔽₂³ (three tensor terms) vs ℤ/2 = Tor(ℤ/2,ℤ/2) | Holds; Tor term needed |
| 5.2 Wang | Klein bottle, monodromy r on S¹ | id − r_* = 2 on H₁(S¹); H₁(K) = ℤ ⊕ ℤ/2 | Holds |
| 5.3 transfer | identity cover; two sheets over a point, ℤ and 𝔽₂; ∅ → B | id; 1 ↦ (1,1) ↦ 2, and (1,1) ≠ 0 while 2 = 0 in 𝔽₂; zero map | Holds |
| 5.4 torus | T², T³; 2×2 matrix on H₁ | Betti 1,2,1 and 1,3,3,1; Λ² acts by det | Holds |
| 5.5 Serre Checks | S¹×S² → S² vs Hopf; ∅ → B; {1} → S¹ | E² = ℤ at (0,0),(0,1),(2,0),(2,1); d² = 0 vs iso; E² = 0; no lift of the loop, E²₍₁,₀₎ = ℤ vs H₁ = 0 | Holds |
| 5.6 Čech differential | three opens, c on U₀₁₂; (1,1) term | δδc has U₂-component c − c = 0 vs 2c; D² = 0 vs 2δ∂c | Holds |
| 5.7 point cover | 0 → R → R² → R → 0 | c ↦ (−c,c), (a,b) ↦ a+b exact; H₀ = R | Holds |
| 6.0 towers | (3,1,0,…); ×2 tower; ×3 tower | δ gives (2,1,0,…); 3x₀ + 1 ≡ 0 mod 4ᵏ impossible; Σ3ⁿ = −1/2 ∉ ℤ | Holds |
| 6.0 homotopy-square maps | fₙ = n·id on R → R; g = f | squares fail by id, correction −xₙ₊₁ cancelled; composite fails by 2n+1 = (n+1) + n | Holds |
| 6.1 transport | rank one, u = 2 over ℤ/5 | u⁻¹ − 1 = 2 vs u − 1 = 1 | Holds |
| 6.2 `lsCupLength_add_one_le_of_categoricalCover` | point; S¹; CP^∞ over ℤ; zero ring; ∅; n = 0 | 0+1 ≤ 1; 1+1 ≤ 2 (two positive classes cup into H² = 0); length ⊤ so no finite categorical cover, true since ℤ[x] has nonzero products of every length; sSup ∅ = 0 and 1 ≤ n; excluded by `[Nonempty X]`; `Fin 0` cover forces X = ∅ | Holds |
| 6.3 local generator | m = 1,2; reflection; m = 0 | det(I+J) = 1+m > 0; −1; empty determinant +1 | Holds |
| 6.4 `IsFundamentalClass` | S¹/ℤ: identity class and twice it; RP²/ℤ/4: the class 2; two points/ℤ: (u₁,u₂), (1,0); zero ring | local image generator, caps ℤ → ℤ iso; image 2 excluded; H₂ = ker(2) = {0,2}, image 2 ∈ ℤ/4 not a generator, excluded (else H⁰ = ℤ/4 ≅ H₂ = ℤ/2 would be claimed); (a,b) ↦ (u₁a,u₂b) bijective, (1,0) fails at the second point; every class fundamental, both sides 0 | Holds |
| 6.4 `poincareDuality_twoTorsionCoefficients` | S¹/𝔽₂; RP²/𝔽₂; RP²/ℤ/4; n = 0 | caps 𝔽₂ → 𝔽₂ bijective; Betti 1,1,1; 2 ≠ 0 excludes it; μ = 1 | Holds |
| 6.4 Lefschetz D² | k = 0,1,2 | R ↔ R, 0 ↔ 0, R ↔ R; absolute version fails at k = 0 (H₂(D²) = 0) | Holds |
| 6.5 linking | RP³; L(5,1), L(5,2); (5,2); 3-manifolds | 1/2; {1/5,4/5} vs {2/5,3/5}, closed under negation; exponent 9 skew; exponent (i+1)(n−i) even | Holds |
| 7.1 Euler and local systems | point; circle (1 or 2 cells); S²; Möbius system over ℚ, 𝔽₂ | 1; 0 = 0; 2; d₁ = 2 invertible so 0 = 1·0; trivial system, 𝔽₂,𝔽₂, sum 0 | Holds |
| 7.2 `finsum_finrank_singularHomology_fiberBundle` | S³ → S²; Klein bottle over ℚ and 𝔽₂; S²×S²; empty base or fibre; finiteness | 0 = 2·0 with d² ≠ 0; E² over ℚ with twisted H₁: (ℚ,ℚ;0,0), Betti 1,1,0, sum 0 = 0·0; 𝔽₂ Betti 1,2,1; 4 = 2·2; 0 = 0; E² bounded and finite-dimensional since B, F have finite CW type, so the finsum is a finite sum and no finrank junk value occurs | Holds |
| 8.1 relative groups | (D²,S¹); RP² rel RP¹ | π₂ ≅ π₁(S¹) = ℤ; π₁(RP²,RP¹) = 0, ℤ → ℤ/2 onto not injective | Holds |
| 8.2 nerve of S₃; Moore complex | g = (12), h = (23); ℤ[Δ¹/∂Δ¹] | d₁(g,h) = hg sends 1 ↦ 3, gh sends 1 ↦ 2; N₁ = ℤ(e − s₀v), N₂ = 0, unnormalized ranks 1,2,3 | Holds |
| 8.3 absolute Hurewicz | S¹ loops; S¹∨S¹; S² | k[S¹]; a^m b^n ↦ (m,n), commutator ↦ 0; identity ↦ +[S²], antipodal ↦ −[S²] | Holds |
| 8.4 relative Hurewicz | (D²,S¹∨S¹); (Dⁿ,Sⁿ⁻¹), n ≥ 3; (ℝ,(0,1)) | π₂ = F₂, H₂ = ℤ², abelianization; ℤ → ℤ, +1; 0 → 0 | Holds |
| 8.5 `homologicalWhitehead` | point; Poincaré sphere → S³; degree ±1, 2 on S² | identity; homology iso but π₁ of order 120, excluded by `SimplyConnectedSpace`; ±1 equivalence, ×2 not | Holds |
| 8.5 `properStrongDeformationRetract_of_inverse` | A = X; I with A = {0}; ℝ with A = {0}; A = ∅ | r = id, preimages I×K; H(t,x) = (1−t)x proper; constant inverse has preimage ℝ, so `hg` fails; g : C(X,∅) forces X = ∅ | Holds |
| 8.5 ends | ℝ, ℝ², ℝ³ | ends 2,1,1; SC at infinity true, false, true; stable π₁ 0, ℤ, 0 | Holds |
| 8.6 normalization | n = 1 | t ↦ t goes to winding +1, reflection to −1 | Holds |
| 8.7 CW type and recognition | n = 0; I; D²; Sⁿ; Poincaré sphere; n = 1; n = 0 in the Lean statement | finite discrete; 2+1 cells; point; identity; excluded; H₁ = 0 ≠ ℤ contradictory; hypotheses are a point's homology, conclusion X ≃ S⁰ false, excluded by `2 ≤ n` | Holds; Check wording R04 |
| 8.8 `groupClassifyingSpace_isEMOne` | trivial group; ℤ; S₃ | point; S¹, generator edge +1; six elements, (12)(23) ≠ (23)(12), allowed since the native predicate is `IsAspherical ∧ Nonempty (π₁ ≃* G)` (`EilenbergMacLane/Basic.lean:123`) | Holds |
| 8.9 obstruction | D², f₁ of degree k, attaching degree m | c(f₀) = m, c(f₁) = km, δd = m(k−1) | Holds |
| 8.10 representability | X = ∅; S¹⊔S¹, A = ℤ, n = 1; n = 0 | one element vs 0; ℤ×ℤ; functions π₀X → A | Holds |
| 8.11 metric realization, ANR, domination | Δ¹; wedge x_j; Cantor set; S¹ → * → S¹ | d = 2|t−s|; 2/j → 0 only in K_m; no retraction (connectedness); 0 ≠ 1 on H₁ | Holds |
| 8.11 `finiteSourceMappingCWType` | X = ∅; Y = ∅, X ≠ ∅; Y Sierpiński | C(∅,Y) a point; C(X,∅) = ∅ with the empty complex `RelCWComplex.mkFinite C ∅` (Mathlib `Classical/Finite.lean:275`); contractible, K a point | Holds |
| 8.12 EM comparisons | RP¹, CP¹ | π₁ = ℤ ≠ ℤ/2; π₃ = ℤ ≠ 0 | Holds |

**Library declarations opened** (file:line at the pin named).
- `358314d4`: `TopPair.singularHomologyπ` (`Singular/Relative.lean:304`: ambient homology → relative homology), `TopCat.singularCap` (`Cohomology/Cap/Basic.lean:101`: `u : T ⟶ R ⊗ S`, `μ : M ⊗ S ⟶ P`, `H^p(X;R,M) →ₗ[k] (H_n(X;T) ⟶ H_q(X;P))`; the file instantiates both with the unitor), `TauCeti.IsEilenbergMacLaneSpaceOne` and `IsAspherical` (`EilenbergMacLane/Basic.lean:59`, `:123`), `TauCeti.FiniteCWType` (`Topology/CWComplex/Classical/FiniteCWType.lean:73`), `TauCeti.eulerChar` (`Cellular/EulerCharacteristic/FiniteCWType.lean:92`), `eulerChar_eq_finsum_finrank_singularHomology` (`:102`, `[DivisionRing k]`).
- `2fd255d9`: `TauCeti.CWType` (`CWType.lean:38`); `HomotopyGroup.bijective_hurewicz` (`Hurewicz/Absolute.lean:161`, `X : Type`); `TauCeti.RelHomotopyGroup.surjective_hurewicz`, `bijective_hurewicz_of_subsingleton_homotopyGroup` (`Hurewicz/Relative.lean:199`, `:282`: both B and Y (n+1)-connected); `ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv`, `_toFun` (`Homotopy/Whitehead.lean:243`, `:263`); `TauCeti.IsTriangulable.finiteCWType` (`Topology/Triangulable/FiniteCWType.lean:41`, `[CompactSpace X]`); `TauCeti.HomologicalOrientation.fundamentalClass` (`Singular/LocalHomology/FundamentalClass.lean:204`); `TauCeti.TopCat.mem_serreFibrations_proj` (`SerreFibration/FiberBundle.lean:395`, no paracompactness); `TauCeti.lsCategoryCount` (`LusternikSchnirelmann.lean:264`); `TauCeti.IsSmoothTriangulation` (`Geometry/Manifold/SmoothTriangulation/Basic.lean`: definitions and secant approximation only, no existence theorem, so 8.7 stands); the ClassifyingSpace files of R02.
- Every backticked Lean name of the README (254) was grepped at `2fd255d9`; all resolve except this roadmap's own three (`IsFundamentalClass`, `LSPositiveCupProduct`, `HasProperHomotopyExtensionProperty`, declared in `Suggested.lean`) and the module names `Singular.BrouwerFixedPoint`, `DiscretePair`, whose files exist (`TauCeti/AlgebraicTopology/Singular/BrouwerFixedPoint.lean`, `DiscretePair.lean`).

**Cross-roadmap citations resolved** (on main): DGFloer Layer 1 items 1–4 (`DGFloer/README.md:462`, `:470`, `:621`, `:659`; item 2 owns `arbitraryBaseSerreSpectralSequence` and the cohomological sequences at `:542`–`:560`; the K(A,n) family is inside item 4 at `:673`–`:699`) and Layer 2 item 3 (`:891`); GeometricTopology's smoothing-and-triangulation comparison item 1 (`:930`–`:939`); DifferentialGeometry 2.2, 5.1, 9.3, 10.5 (`:352`, `:507`, `:872`, `:890`) and its sibling paragraph (`:1034`–`:1037`: it consumes this roadmap's Stage 6 duality and supplies orientation and degree); ClassifyingSpaces Stage 3 items 11–15 and Stage 4 items 16–18 (`:179`–`:243`); GeneralizedCohomology `realizationProductKelleyComparison` (`:234`); TopologicalKTheory T1.6, T7.0 (`:26`, `:1519`); CharacteristicClasses C1.2a S0–S5 (`:514`–`:524`), C1.2b, C1.5, C2.0; ComplexKahlerGeometry K7; UniversalCovers in `Completed/`; TopologicalSheafCohomology §§1.1–1.2; AffineMorseLefschetz A4; MorseTheory M2/M4/M5 (M4 at `:481`, citing the AT Stage 6 anchor); RiemannianGeometry R3 and R4 item 7 (`:607`, item 7 at `:717`); BanachAlgebras A8 (`:154`); HeegaardFloer (`:684`, a prose name, not a dropped declaration); FuchsianOrbifolds (`:81`–`:82`).

**Overlaps.** The four dropped anchors `stage-{2,4,6,8}-…` cited by GeneralAlgebraicKTheory, PlanarTopology, SurfaceTopology, DerivedModuleAlgebra, MorseTheory and GeneralizedCohomology are mapped at `:563`–`:578` (Stage k = Layer k, same title). No cited id is dropped or revision-only. The six conflicting heads are R05. Ownership against the open heads: the cup-length bound is consumed by MorseTheory #1682 and DGFloer #963 from here; IntegrableSystems #1651 states Conley-index cup-length results of its own, a different object; homological Whitehead is consumed by HomotopySpheres #1287 and FourManifolds #936 from here; no second owner of `IsFundamentalClass`, the proper SDR or the nerve K(G,1) was found (`roadmaps grep`).

## Not verifiable

- Conway–Friedl–Herrmann (6.5, Prop 1.2, Lemmas 2.5–2.6): not in the manifest; not fetched.
- Eilenberg–Steenrod, G. W. Whitehead, Dold, May (R03's §8.2 locators), Serre 1951, McCleary, K. Brown *Cohomology of Groups*: no open copy recorded; none of their locators is in the sample except May's absence.
- Uncertified by the manifest: Freedman–Quinn §7.7, Milnor 1963 Lemmas 3.6–3.7, Weibel; cited by locator only.
- Elaboration of `Suggested.lean` at `2fd255d9`: not run (the only Lean commands permitted run in the branch worktree, pinned at `358314d4`); names checked by grep (R01).

## Source issues

- **Misprint** in milnor1959 at the proof of Theorem 2, p.276: the source closes the argument as the proof of Theorem 3, before Theorem 3 is stated; it should read Theorem 2; affects nothing.
- **Misprint** in milnor1959 at the proof of Corollary 3, p.276: the source invokes a Theorem 4 for the CW type of the triad; the paper has no Theorem 4 and Theorem 3 is meant; affects nothing.
