# Review of AlgebraicTopology (pull request #1797 at c62aafd)

**Verdict:** needs changes

Seventeen findings: eight P2 and nine P3. Every Lean statement in `Suggested.lean` survived the adversarial pass. The P2 findings concern ownership: one two-owner conflict with DGFloer, one inside this pull request with GeometricTopology, five clusters of targets that the pinned Tau Ceti already proves, and three headlines stated below the generality of their sources.

## R01 (P2) — The Serre, Eilenberg–MacLane and CW-approximation targets have two owners: this roadmap and DGFloer

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md:112-152`: "Stage 5.5 owns the fibration homotopy long exact sequence … the homological and cohomological Serre spectral sequences … Stage 8.8c owns the single functorial abelian K(A,n) family … owns Hurewicz modulo a class". The same objects appear in `Suggested.lean:377` (`exists_cwApproximation`) and `:690` (`hurewicz_isoModSerre`).

**Claim.** This roadmap owns:
- Stage 4.8: CW approximation of spaces that are not path-connected, and the k-connected comparison;
- Stage 5.0: the homological regrading and complete convergence;
- Stage 5.5: the fibration homotopy sequence and the Serre spectral sequences;
- Stage 8.8c: the functorial `K(A,n)` family;
- Stage 8.8d: Hurewicz modulo a Serre class.

It also says "A citation of DGFloer Layer 1 for one of these ordinary targets resolves here".

**Witness.**
- DGFloer at the head of #1798, `TauCetiRoadmap/DGFloer/README.md:57-70`, lists exactly these objects under "In particular it owns" (Layer 1 items 1–4).
- On main, `DGFloer/README.md:139-142` says Layer 1 item 2 "owns the fibration homotopy exact sequence and ordinary homology Serre spectral sequence consumed by AT5.5".
- AlgebraicTopologyPartII (#1694), README line 12, and StableHomotopyKTheory §3.36's *Needs:* line (#1227) also name DGFloer as the owner.

**Repair.** Keep one owner. DGFloer consumes this roadmap's Stages 2–8, so ownership here is the only choice without a cycle. Two things are needed:
- The pull request's merge-order paragraph says that DGFloer (#1798, or a follow-up revision merged with this one) drops these objects from its "Owned here" list and from Layer 1 items 1–4, keeps its cubical transports, and cites Stages 4.8, 5.0, 5.5, 8.8c and 8.8d.
- The same paragraph lists AlgebraicTopologyPartII's scope line and StableHomotopyKTheory §§3.36–3.37 as citations to repoint.

Until DGFloer's text agrees, README lines 136–152 describe a transfer of ownership that DGFloer does not grant.

## R02 (P2) — Finite CW type of compact smooth manifolds is owned twice inside this pull request

**Location.** `README.md:2826-2829` ("The compact case has finite CW type, `compactManifoldFiniteCWType` … proved through the native `TauCeti.IsTriangulable.finiteCWType`") and `Suggested.lean:624`.

**Claim.** Stage 8.7 owns the theorem and consumes only the smooth triangulation of GeometricTopology 12.1.

**Witness.** `TauCetiRoadmap/GeometricTopology/README.md:3139` lists as a 12.1 target "Compact smooth manifolds have finite CW type (`TauCeti.FiniteCWType`), through 11.2". Its line 3235 says AlgebraicTopology consumes "12.1 (compact smooth manifolds have finite CW type)".

**Repair.** Keep `compactManifoldFiniteCWType` here, since it is this roadmap's headline. In GeometricTopology 12.1, delete the third bullet and the parenthesis at line 3235, so that 12.1 supplies only the smooth triangulation and Stage 8.7 feeds it to `TauCeti.IsTriangulable.finiteCWType`. The alternative is to delete the Stage 8.7 target and its Lean statement and cite GeometricTopology 12.1.

## R03 (P2) — Stage 7 plans Euler-characteristic theorems that the pinned Tau Ceti already proves

**Location.** `README.md:2547-2556`: "Prove product multiplicativity … Prove finite-cover multiplicativity from transfer and additivity for finite excisive decompositions from Mayer–Vietoris … Establish the standard checks `chi(S^n)=1+(-1)^n`, `chi(T^n)=0` … `chi(CP^n)=n+1`."

**Witness.** In Tau Ceti `AlgebraicTopology/Cellular/EulerCharacteristic/`:
- `TauCeti.eulerChar_prod` (`Product.lean:80`);
- `TauCeti.eulerChar_eq_mul_of_isCoveringMap` (`Covering.lean:140`, χ(E)=d·χ(B));
- `TauCeti.eulerChar_add_eulerChar_inter_of_union_eq_univ` (`MayerVietoris.lean:55`);
- `TauCeti.eulerChar_sphere` (`Sphere.lean:62`), `TauCeti.eulerChar_torus` (`Torus.lean:50`) and `TauCeti.eulerChar_complexProjectiveSpace` (`ComplexProjective.lean:68`).

**Repair.** List these in the Tau Ceti supplier contracts, with names and files. Stage 7 then consumes them and owns only:
- bundle multiplicativity from Stage 5.5;
- whatever cellular-stratification additivity `Subcomplex.lean` (`TauCeti.cwEulerChar_eq_add_finsum_card_compl`) does not already give.

The three standard values become Checks that cite the native theorems.

## R04 (P2) — Stage 4.6 rebuilds real projective space, its CW structure and its cellular differential, all native

**Location.** `README.md:1263-1265`: "Construct its finite CW structure, with one cell in each dimension 0,…,n, and show the cellular differential is ±2 in positive even degree and 0 in odd degree". Also `:1243-1248` and `:1277-1278`.

**Witness.** Tau Ceti already has:
- `TauCeti.RealProjectiveSpace`, the antipodal quotient with its double cover `isQuotientCoveringMap_mk` (`AlgebraicTopology/UniversalCover/RealProjective/Basic.lean`);
- its CW structure `TauCeti.RealProjectiveSpace.cwComplex` (`Topology/CWComplex/Classical/RealProjective.lean`);
- the cellular incidences `cellularIncidence_cwComplex_eq_two_or_eq_neg_two_of_odd` (`AlgebraicTopology/Cellular/RealProjective/Basic.lean`) and the homology (`…/Homology.lean`).

**Repair.**
- Treat RPⁿ as README:1248-1259 already treats CPⁿ. Consume the native carrier with its CW structure, incidences and homology. Own only the homeomorphism `TauCeti.RealProjectiveSpace n ≃ₜ Projectivization ℝ (Fin (n+1) → ℝ)` and the transport of the cells.
- Add `Projectivization.instChartedSpace` and `instIsManifold` (`Geometry/Manifold/Instances/Projectivization.lean:54,82`) to the Tau Ceti proofs listed at README:268-273 for transfer to Mathlib's topology. They sit on the clashing Tau Ceti topology.
- Build the sign system as `IsQuotientCoveringMap.associatedLocalSystem` (`LocalCoefficient/QuotientCovering/Basic.lean:171`) of the antipodal cover with the sign representation, or say why not.

## R05 (P2) — Stages 5.3 and 5.4 plan covering-space and torus results that are native

**Location.** `README.md:1488-1495`: "For finite G prove `transfer p_* = sum_(g in G) g_*` and identify the quotient chain complex `C_*(E;M)_G` naturally with `C_*(B;M)` … Build the deck chain complex in native `Rep R G`". Also `:1506-1507` (coinvariants when |G| is invertible) and `:1516-1518` (the torus as exterior powers).

**Witness.**
- `IsQuotientCoveringMap.chainComplexMap_comp_singularTransfer` (`Singular/Transfer/Basic.lean:272`).
- `IsQuotientCoveringMap.isColimitMapCoconeSingularChainComplex` and `isColimitMapCoconeSingularHomology` (`Singular/Coinvariants.lean:120,128`, with legs `p_*`).
- `TauCeti.singularChainsRep` (`Singular/ModuleChains/Resolution.lean:131`).
- `TauCeti.torusExteriorPowerEquiv` (`Singular/Torus/Exterior.lean:343`).

**Repair.**
- Cite these in the supplier contracts.
- Use native `IsQuotientCoveringMap p G` as the regular-cover datum and delete the parallel surjectivity-plus-simply-transitive datum.
- Stage 5.3 owns only the Cartan–Leray spectral sequence, the cohomological deck action and the comparison with the permutation system.
- Stage 5.4 owns only the naturality of `torusExteriorPowerEquiv` under integer matrices.

## R06 (P2) — Stages 1.6, 2.5, 2.6, 5.5 and 6.0 plan further native results

**Location and witness.**
- **1.6** (`README.md:650-666`). The README constructs the pointwise product on π₁ of a topological monoid and proves commutativity. Native: `FundamentalGroup.cast_map_prod_mul` and `FundamentalGroup.instCommGroup` (`AlgebraicTopology/FundamentalGroup/TopologicalMonoid.lean:110,120`).
- **2.5** (`:704-708`). The README owns the cube-to-sup-ball homeomorphism `t↦2t−1` and the radial sup-ball-to-disk homeomorphism. Native: `TauCeti.cubeHomeomorphClosedBall` and `ContinuousLinearEquiv.unitBallHomeomorph` (`Analysis/Normed/Module/Ball/Homeomorph.lean:195,81`).
- **2.6** (`:745-748`). The README constructs the twisted pair and triple sequences and their homotopy invariance. Native:
  - `TopPair.twistedHomology_exact_subspace`, `_exact_space` and `_exact_relative` (`Singular/Twisted/Relative.lean:484-495`);
  - `TauCeti.TopTriple.twistedHomologyδ` (`Twisted/Triple.lean:228`);
  - `ContinuousMap.HomotopyEquiv.isIso_twistedHomologyMap` and `TopPair.Homotopy.twistedHomologyMap_eq_comp` (`Twisted/HomotopyInvariance/Basic.lean:355`, `Relative.lean:137`).
- **5.5** (`:1571`). The README contracts the based path space. Native: the `ContractibleSpace` instance for `MappingPathSpace (ContinuousMap.const Unit k)` (`Topology/Homotopy/MappingPath/Fiber.lean:214`).
- **6.0** (`:1745`). The README says "Own the shift/cofinal-subsequence comparison and its naturality". Native: `TauCeti.ModuleTower.limOneSubsequenceEquiv` and `_naturality` (`Algebra/Category/ModuleCat/Tower/Subsequence/LimOne.lean:280,304`).

**Repair.** Delete "own", "construct" and "prove" for each item above and cite the declarations in the supplier contracts. Keep only what they lack: the boundary and orientation pins of 2.5, and the derived-limit cone of 6.0.

## R07 (P2) — Stage 8 plans native relative-homotopy, simplicial-group and end constructions

**Location and witness.**
- **8.1** (`README.md:2586-2593`). The README says "Extend them with basepoint change and the module-valued carrier in degrees at least three", together with the abelianization of π₂. Native:
  - `TauCeti.RelHomotopyGroup.transport` and `mulEquivOfPath` (`Homotopy/Relative/BasepointChange.lean:620,816`);
  - `moduleFunctor [Nontrivial N]` and `abelianizationFunctor` (`Relative/Functor.lean:238,124`).
- **8.2** (`:2638-2647`). The README owns the Kan property of simplicial groups and the Moore comparison π_n(G)≃H_n(NG), degree zero included. Native:
  - `SSet.kanComplex_of_group` and `CategoryTheory.SimplicialObject.kanComplex_comp_forget_grpCat` (`SimplicialSet/KanComplex/SimplicialGroup.lean:186,226`);
  - `CategoryTheory.SimplicialObject.piAddEquivNormalizedMooreComplexHomology` and `piZeroEquivNormalizedMooreComplexHomology` (`KanComplex/MooreComplex.lean`).
- **8.5** (`:2710-2714`). The README defines ends by complementary components modulo cofinal containment and proves the inverse-limit description. Native: `TauCeti.EndComponents` and `TauCeti.endComponentsEquivSections` (`Topology/Connected/Ends.lean:228,376`).

**Repair.** Cite these declarations. Own only what is missing:
- the nonabelian formula `ker(d₀|N_n)/d₀(N_(n+1))`;
- the realization-unit comparison;
- the finite-component neighbourhoods;
- the stable π₁ at an end.

## R08 (P2) — Three headlines are stated below the generality of their source or of the README

**Location.** `Suggested.lean:772` (`finiteSourceMappingCWType`), `:308` and `:316` (the pair-quotient comparisons), `:781` (`basedLoopCWType`).

**Claim.**
- The mapping-space theorem needs a finite CW source.
- The pair-quotient comparisons need a Hausdorff relative CW pair.
- The loop-space theorem needs the basepoint to be a 0-cell.

**Witness.**
- Milnor 1959 Theorem 3 (milnor1959 line 209) takes any compact `C`. Its proof (lines 252–253) uses only that `K^C` is metrizable. Instance: `K` the Cantor set and `X = S⁰` give a countable discrete space, which is covered by the theorem but not by the Lean statement.
- README:1224-1230 owns the closed cofibered form, which is implied by native `TauCeti.hasHomotopyExtensionProperty_base`. Instance: the Hilbert cube relative to a point.
- For `x` in the open 1-cell of the one-vertex `S¹`, `Ω_xS¹ ≃ Ω_{e₀}S¹ ≃ ℤ`.

**Repair.**
- State `finiteSourceMappingCWType` for `[CompactSpace K] [T2Space K]`. The finite CW case becomes a Check.
- State both pair comparisons for `(hB : IsClosed B) (hHEP : TauCeti.HasHomotopyExtensionProperty B)`, with no `T2Space` or CW instance.
- Drop `hx`, since every path component of a CW complex contains a 0-cell.
- Update README:3149-3153 to match.

## R09 (P3) — Citations that resolve only at the heads of #1807, #1808 and #1854

**Location.**
- `README.md:170-176` and `:588`: CharacteristicClasses C1.5a.
- `:177-182`: "CharacteristicClasses C1.2a consumes the compactly supported local-coefficient cochains … no stage here consumes that excision or that triangle".
- `:102-108`: ClassifyingSpaces Stage 3 owns the comparison with the nerve/bar model.

**Witness.**
- Main's CharacteristicClasses has no C1.5a, and its line 67 says "The separate AT supported-cellular supplement consumes C1.2a S0–S4".
- Main's ClassifyingSpaces never mentions a nerve model.
- All three appear only at the heads of #1807, #1808 and #1854, and the pull request description names none of them.

**Repair.** Name the revision this one merges after (for example #1854) in the merge-order paragraph, or cite CharacteristicClasses C1.5 and ClassifyingSpaces Stage 3 as they stand on main.

## R10 (P3) — Open revisions of this roadmap conflict with this head and no order is stated

**Witness.** the worker's overlap report:
- #1652 (another author: "compact Čech pairs and relative cup modules") conflicts in `README.md` and `Suggested.lean`.
- #1807, #1808 and #1854 conflict in the same files.
- #1187 (the pin bump) conflicts in `Suggested.lean`.

The description states no order.

**Repair.** State which revision is rebased on which, for example that #1652 and #1854 rebase onto this pull request. Do not restate what #1652 changes; its README:169-174 hands the Čech comparisons to TopologicalSheafCohomology and CharacteristicClasses C1.2b.

## R11 (P3) — Two Checks argue from a false step

**Location and witness.**
- `README.md:2047-2049`: "the contraction (t,x)↦(1−t)x of ℝ is proper on every slice". At `t=1` the slice is `x↦0`, and its fibre over 0 is all of ℝ, which is not compact.
- `:2149-2152`: "restriction to each point is an isomorphism". This fails when the component of `B` through 0 is unbounded: for `B=ℝ`, `H_1(ℝ,∅)=0`, while `H_1(ℝ,ℝ∖{y})=ℤ`.

**Repair.**
- Use `H(t,x)=(1−t)x+tx²`. Every slice is proper. `H(t,−(1−t)/t)=0` for `t∈(0,1]`, so `H` is not jointly proper. Its ends act on `H_c^1(ℝ;ℤ)=ℤ` by 1 and 0.
- In the second Check, first shrink `B` to a bounded interval around 0; the definition allows such refinement.

## R12 (P3) — Three definitions of `Suggested.lean` have no Checks

**Location.** `cupProduct` (`Suggested.lean:407`), `twistedSupportLocalMap` (`:431`) and `continuousHomotopyClasses` (`:730`). Each occurs once in the README, with no **Checks** list.

**Witness.** README lines 905, 1041, 1436, 1866, 1960, 2144, 2770, 2844, 3021, 3125 and 3135 hold all the Checks lists in the README. None covers these three names.

**Repair.** Add three discriminating Checks to each:
- **`cupProduct`.** On `T²` over ℤ, `a⌣b` generates `H²` and `b⌣a=−a⌣b`; `1⌣a=a`; and `a⌣a=0` on `S¹`. Swapped factors fail the second Check.
- **`twistedSupportLocalMap`.** It is the identity for `B={x}`. It is compatible with shrinking `B′⊆B`. It is an isomorphism for a bounded ball in `ℝ^m` and zero for `B=ℝ^m`.
- **`continuousHomotopyClasses`.** `[X,pt]` is a singleton; `[pt,Y]≃π₀(Y)`; and `[S¹,S¹]≃ℤ` by degree.

## R13 (P3) — README and Lean state the proper strong-deformation-retract theorem differently

**Location.** `README.md:2754-2758` states `properStrongDeformationRetract_of_inverse` "for a closed strongly locally finite CW subcomplex A⊂X", with no extension hypothesis. README:2762 states the cylinder corollary with no hypotheses.

**Witness.**
- `Suggested.lean:606` takes any `A` in a Hausdorff, locally compact `X` with `HasProperHomotopyExtensionProperty A`, and no CW structure.
- `:593` adds `T2Space`, `LocallyCompactSpace` and `IsClosed A`.

**Repair.** Make the README state the Lean hypotheses, and add that strongly locally finite CW pairs satisfy them by the proper HEP theorem of Stage 8.5.

## R14 (P3) — `Suggested.lean` states three intermediate lemmas as headlines

**Location.**
- `relativeCWPushout_t2Space` (`Suggested.lean:339`), with `relativeCWPushoutInclusion` and `relativeCWPushoutCarrier`;
- `HasProperHomotopyExtensionProperty.cylinderBoundary` (`:593`);
- `homotopyInversePairExtension_left` (`:351`).

**Witness.** The headline list in the README Summary (lines 9-14) contains none of them, but the module docstring (lines 78-89) lists them. They are the Hausdorffness of an adjunction space, a product-pair corollary, and an extension step of Brown 7.4.2.

**Repair.** Delete them from `Suggested.lean`; the README keeps each statement, unbackticked. Alternatively, add them to the README's headline list.

## R15 (P3) — Three imports are unused

**Location.** `Suggested.lean:12` (`…Singular.DiskSphere`), `:38` (`…HomotopyGroup.Map`) and `:40` (`…Extension.CWComplex`).

**Witness.** No declaration of these three modules occurs in the file. With the three lines removed, the scratch copy elaborates with the same 21 `sorry` warnings and no error.

**Repair.** Delete the three lines.

## R16 (P3) — Targets without locators, although the manifest holds the sources

**Location.** `README.md:3157` (Dowker's `K_w≃K_m`), `:3161-3167` (the Wojdysławski embedding, Dugundji extension, ANR⇔ANE), `:1306-1310` (local contraction of CW complexes) and `:1304-1305` (CW paracompactness).

**Witness.**
- dugundji1951 lines 155, 201 and 357: Theorem 4.1, Corollary 4.2 and Theorem 7.1. Section 7 (line 342) covers the Wojdysławski embedding.
- milnor1959 lines 119–121 quote Dowker's comparison.
- Hatcher Proposition A.4 covers local contraction, and hatcher-vbkt Proposition 1.20 covers CW paracompactness.
- FTW 1973 and VBKT appear only as inline links.

**Repair.**
- Add the locators at the claims.
- Add Dugundji 1951, Dowker 1952, Farrell–Taylor–Wagoner 1973 and Hatcher's *Vector Bundles and K-Theory* to the References.
- Give Arens–Eells a source or drop the name.

## R17 (P3) — Typography and one process word

**Location.** About forty number tokens are run into the preceding word, for example:
- "Stage6.5" (`README.md:95`) and "of6.2" (`:1897`);
- "value0 at0" (`:782`) and "radius1" (`:801`);
- "Lemma3.27" (`:2142`), "Theorem4.2" (`:2781`) and "Compositio27" (`:2806`);
- "ordinary6.1–6.2" (`:1980`, `:2530`).

Line 2413 says "Stage 2, item 5's corrected two-case normalization".

**Repair.** Insert the missing spaces, and write "two-case normalization" in place of "corrected two-case normalization".

## Verified sound

**Gate, build and dependencies.**
- The push gate passed every check, `build=0` included (the worker's gate report). No file outside the pull request's own folders changed.
- `lake env lean Suggested.lean` gave 0 errors and 21 warnings, every one `declaration uses sorry`, in 11 s.
- All 90 `#check` lines elaborate, so every native name pinned there exists at the pin.
- The dependency check gave `depcheck: 239 roadmaps, 2315 edges, 0 problem(s)`, with no UPWARD or CYCLE line.

**Padding probe.** On a scratch copy, each of the 21 sorried theorems was tried with `first | rfl | infer_instance | simp | decide | trivial`, and separately with `exact?` (1 min 20 s). None closed.

**Signatures.** I compared all 52 elaborated types in the worker's signature report with the README.
- The two flagged definitions, `relativeCWPushoutInclusion` and `relativeCWPushoutCarrier`, are constructions that need no `T2Space`.
- The theorem about them, `relativeCWPushout_t2Space`, carries `[T2Space Y] [T2Space Z]`.
- `ordinaryCofiberSupport` and `ordinaryCofiberSetoid` carry an unused universe parameter on `PUnit`, which `ordinaryPairQuotient` pins to `TopCat.{u}`. This is harmless.

**Native declarations opened at the pin (Tau Ceti unless marked).**
- `TopCat.singularCap` (`Cohomology/Cap/Basic.lean:101`). It is Hatcher's front-face/back-face cap, `σ⌢φ=φ(σ|[0..p])σ|[p..n]`, with boundary formula `∂(σ⌢φ)=(−1)^p(∂σ⌢φ−σ⌢δφ)`; this matches README:225-229.
- `HomotopyGroup.hurewiczHom` (`Hurewicz/Basic.lean:652`): it sends π_{n+1} to `R ⟶ H_{n+1}`.
- `RelHomotopyGroup.hurewicz` (`Relative/Hurewicz.lean:324`): it sends `RelHomotopyGroup (Fin n)` to `H_{n+1}`. Its docstring at `Hurewicz/Relative.lean:36-39` says the n≥3 case with only `A` simply connected is not covered, which agrees with Stage 8.4.
- `HasProperHomotopyInverse` (`Topology/Homotopy/Proper.lean:41`, which includes `IsProperMap f`), `CWType` (`Classical/CWType.lean:38`), `HasHomotopyExtensionProperty` (`Extension/Basic.lean:97`), `IsEilenbergMacLaneSpaceOne` (`EilenbergMacLane/Basic.lean:123`), `HomologicalOrientation` (`Orientation/Homological.lean:75`), `HomologicalOrientation.fundamentalClass` (`FundamentalClass.lean:204`) and `TopCat.singularKronecker` (`Cohomology/Kronecker.lean:65`).
- The 17 further names that the README cites, spot-checked by grep, all exist. Examples: `Orientation.localOrientation_neg`, `TauCeti.pi1MulEquivFundamentalGroup_smul`, `IsLocallyCollared.isCollared` and `TopCat.singularHomologyKunnethShortComplex`.
- Tau Ceti's `Projectivization.instTopologicalSpace` (`Topology/Algebra/Projectivization.lean:90`) re-declares Mathlib's name (Mathlib `Topology/Algebra/Projectivization.lean:44`). README:268-273 says so correctly.

**Cross-roadmap citations resolved.**
- On main: UniversalCovers (Completed); DifferentialGeometry Layer 2, 2.4 (line 362), 5.1 (line 507) and Layer 10 (line 877); ClassifyingSpaces Stage 3 (line 177); CharacteristicClasses C1.5 and C1.2a.
- In this pull request: GeometricTopology 12.1 (line 3122) and Layer 11 (line 2908).
- DeRhamCohomologyAndDuality §4.1 at #1768 (line 512); CharacteristicClasses C1.5a and ClassifyingSpaces at #1854; DGFloer at #1798.
- No other roadmap's `Suggested.lean` declares a name in `TauCetiRoadmap.AlgebraicTopology`; only revisions of this roadmap do. HomotopySpheres and FuchsianOrbifolds `#check` `homologicalWhitehead` and `compactManifoldFiniteCWType`, and both names are kept.
- No id this README cites is dropped by an open pull request, and this pull request drops no id that other roadmaps cite.

**Sources: the sample.** No target was found by heading, so I chose 18 locators across the cached texts and checked each at its locator.
- Hatcher:
  - Theorem 4.37 (p. 371);
  - Theorem 4.32 (p. 366);
  - Corollary 4.33;
  - Proposition 4.13 and Example 4.14;
  - Theorem 4.57 (p. 393; stated there for basepoint-preserving classes, as README:3090 says);
  - Lemma 3.27(a)(b);
  - Theorem 3.30;
  - Theorem 3.43 (the triad form);
  - Proposition 2.22 with Proposition A.5;
  - Proposition 0.17 (p. 15);
  - the mapping-cone isomorphism (p. 125);
  - the comb pair `(I,{0,1,1/2,…})` just before Example 0.15 (pp. 14–15);
  - Example 0.6;
  - Propositions A.3 and A.4 and Theorem A.6;
  - Theorem 2A.1, Lemma 4.31 and Proposition 4.30.
- Brown, *Topology and Groupoids*:
  - 6.7.2 (p. 240);
  - 7.4.2 and Addendum (pp. 285–286). Brown's `H0/K0` are the README's `K₀/H₀`, and the track sum agrees after renaming;
  - 8.4.1 and 9.1.2.
- Vogt, Proposition and Lemma 1 (p. 627). Lemma 1 with `R=Q=H₀` gives `g₀f₀H₀ ≃ H₀(g₀f₀×1)` rel ends, as README:1081-1084 uses.
- Strøm, Theorem 6 (p. 135).
- Milnor 1959, Theorem 3 and Corollary 3 (p. 276). The README's note on the "Theorem 4" misprint is correct.
- FTW, Theorem 4.2, Lemma 4.3 and Corollary 4.9.
- Hatcher's *Vector Bundles and K-Theory*, Section 3.3 (p. 98).

**Adversarial pass.** One row per statement, with the values computed on each side.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `ordinaryPairQuotient` (README Checks) | B=∅; B=X; (D¹,S⁰) | X/∅=X₊, H̃₀=H₀(X); X/X=pt, H̃=0=H(X,X); D¹/S⁰≅S¹, H̃₁=ℤ=H₁(D¹,S⁰) | sound |
| `ordinaryPairQuotientComparison` / `…Cohomology…` | B=∅; B=X; Hilbert cube rel point | H_n(X)=H̃_n(X₊); 0=0; 0=H̃_n(Q) but no CW structure | true; narrow (R08) |
| `relativeCWPushout_t2Space` | B=∅; (D¹,S⁰) to a point; to two points by a bijection | Z⊔Y is T2; S¹ is T2; an interval is T2 | true; lemma (R14) |
| `homotopyInversePairExtension_left` | A=∅; A=X, A′=X′ | reduces to a homotopy inverse; g=g₀, H=H₀ | true |
| `exists_cwApproximation` | X=∅; two points; Warsaw circle | Z=∅; Z=2 points; Z=pt (π_*=0) | true |
| `compactSupportTopClass_exists/_unique` | K=∅; m=0; ℝ, L=ℤ, K=[0,1] | H_m(M,M)=0; ⊕_{x∈K}L_x; H₁(ℝ,ℝ∖[0,1])=ℤ injects into the local images | true |
| `poincareDuality_zmodTwo` | RP²; M=∅; three points, n=0 | (ℤ/2)↔(ℤ/2) in degrees 0,1,2; 0↔0; (ℤ/2)³↔(ℤ/2)³; c is forced to be the fundamental class | true |
| `poincareDuality_int` | S¹ with p=0,1; RP² | ℤ↔ℤ twice; RP² has no `HomologicalOrientation`, since H⁰=ℤ but H₂=0 | true |
| `capProduct` (Checks) | [v₀,v₁,v₂] with φ dual to [v₀,v₁]; p=0; p>q | gives [v₁,v₂]; σ⌢1=σ; q−p truncates, which `hpq` excludes | sound |
| `lsCupLength_add_one_le_categoryCount` | pt; Sⁿ; T²; ∅; k points | 0+1≤1; 1+1≤2; 2+1≤3; 0+1≤0 is false, so `Nonempty` is needed; 0+1≤k | true |
| `relHurewicz_bijective_of_simplyConnected_subspace` | (D³,S²), n=0; Y=D³⊔S³ | π₃(D³,S²)=ℤ=H₃; H₃(Y,B)=ℤ² against π₃=ℤ, so `PathConnectedSpace` is needed | true |
| `homologicalWhitehead` | S²→CP²; an acyclic non-simply-connected space mapped to pt | H₄ differs, so the hypothesis fails; excluded by `SimplyConnectedSpace` | true |
| `HasProperHomotopyExtensionProperty` (Checks) | A=∅; A=X; comb pair | stationary K is proper; K=H; no retraction (Hatcher pp. 14–15) | sound |
| `…cylinderBoundary` | A=∅ | (I,∂I)×X with proper retraction | plausible; lemma (R14) |
| `properStrongDeformationRetract_of_inverse` | A=X; X=[0,∞), A={0} | r=id; constant g is not proper, so no hypothesis holds and no SDR exists | true; README mismatch (R13) |
| `compactManifoldFiniteCWType`, `…WithBoundary…` | Sⁿ; n=0; Dⁿ | finite CW; finite discrete; finite CW. Second countability is implied by compactness | true; two owners (R02) |
| `groupClassifyingSpace_isEMOne` | 1; ℤ; ℤ/2 | pt; ≃S¹; RP^∞ with H₁=ℤ/2, H₂=0 | true |
| `SatisfiesSerreAxioms` (Checks) | zero class; torsion; finite; d^m-bounded | 0⊗0=0, B1 contractible; closure holds; |G| kills H_*(BG); ℤ/d^m→ℤ/d^{2m}→ℤ/d^m leaves the class | sound |
| `hurewicz_isoModSerre` | C=0, X=S², n=0; C=torsion, X=S³, n=1 | H₁=0, h₂:ℤ≅ℤ, h₃:ℤ→0 onto; H₁=H₂=0, h₃ iso, h₄:ℤ/2→0 onto | true (the n+3 clause is uncertified; see Not verifiable) |
| `OrdinaryEMModel` (Checks) | S¹ for (ℤ,1); S² for (ℤ,2); pt; two points | π_{≥2}=0; π₃(S²)=ℤ fails `vanishing`; model; not path-connected | sound |
| `ordinaryEMRepresentability` | K=S¹ with X=∅, 2 pts, S¹; −ι | {*}↔0; {*}↔0; ℤ↔ℤ by degree; −ι gives −1, which the normalization excludes | true |
| `ordinaryEMPullback` (Checks) | id_K; constant map; degree-d self-map of S¹ | ι; 0 for n≥1; d·gen | sound |
| `finiteSourceMappingCWType` | K=pt; K=∅; Cantor set to S⁰ | C(pt,X)≅X; pt; countable discrete, covered by Milnor | true; narrow (R08) |
| `basedLoopCWType` | S¹ at its 0-cell; at an interior point of its 1-cell | ΩS¹≃ℤ; same, but `hx` fails | true; extra hypothesis (R08) |
| `LocallyRepresentedTopSection` (Checks) | ℝ^m translated generator; ±gen on ℝ; m=0; B=ℝ | represented; not represented; every family represented; H₁(ℝ,∅)=0 ≠ ℤ | conclusions true; one step false (R11) |
| 5.0 filtered spectral sequence (Checks) | ℤ→ℤ by 2; ⊕(x_k→y_k); constant filtration | E²=ℤ/2 at (0,0)=H₀; d^{k+1} from (k+1,−k) hits (0,0), E∞=0=H₀; E¹=0 while H₀=ℤ | sound |
| 4.5 compact generation (Check) | uncountable cocountable X | compact sets finite, kX discrete ≠ X | sound |
| 4.6/6.1 RP² sign system | sign: d₂=0, d₁=±2; constant: d₂=±2, d₁=0 | H⁰(ε)=0, H¹(ε)=ℤ/2, H²(ε)=ℤ; H₁(RP²;ℤ)=ℤ/2; matches native incidence 1+(−1)^{i+1} | sound; native (R04) |
| 6.3 ρₙ and boundary signs | n=1,2; D¹, D² | det ρₙ=(−1)ⁿ; at p=eₙ chart frame = (−1)ⁿ·outward-first; [−∂r]×o_∂=(−1)^m(o_∂×[r↑]); ∂[D¹]=[+1]−[−1] | sound |
| 6.5 linking symmetry | n=3, 5, 7 at i=k | sign (−1)^{(k+1)²}: +, −, + (symmetric, skew, symmetric) | sound |
| 6.2 compact supports (Checks) | x+1, x³, x² on H_c¹(ℝ); (1−t)x | degrees 1, 1, 0; slice t=1 is not proper | three sound; one false (R11) |
| 8.8c colimit of S¹ under ×2 | colim ≅ ℝ/ℤ[1/2] | indiscrete, hence contractible, so not K(ℤ[1/2],1) | sound |
| Stage 7 values | S², T², CP² | 2, 0, 3, by the native theorems | true; native (R03) |

## Not verifiable

- **may1967** (May, *Simplicial Objects*, Chapters 3 and 12). The cached file is an image-only scan, OCR is unavailable on this worker, and it is listed among the missing references.
- **serre1953** (Chapter III, Théorème 1; axioms II_A and III) is uncertified because it is paywalled. I could not confirm the clause of `hurewicz_isoModSerre` that makes the degree-(n+3) Hurewicz map an epimorphism modulo C. Hatcher's spectral sequences chapter, Theorem 1.8 (hatcher-ssat line 849), states only the isomorphism, for abelian spaces.
- Also uncertified, cited by locator only: tomdieck2008 Theorem 9.5.1, fq1990 §7.7, weibel 5.5.1(2) and 5.5.10, milnor1963 Lemmas 3.6–3.7.
- Eilenberg–Steenrod, G. W. Whitehead, Dold, McCleary, K. Brown and Serre 1951 are cited at chapter level only and are not in the cache.

## Source issues

- **Misprint** in milnor1959 at the proof of Corollary 3, p. 276: the proof invokes "Theorem 4", but the paper has none. It should say Theorem 3. Affects nothing.
- **Misprint** in milnor1959 at the end of the proof that (c) implies (d) in Theorem 2, p. 276: it says this completes the proof of Theorem 3. It should say Theorem 2. Affects nothing.
- **Gap** in ftw1973 at Corollary 4.9, p. 21: the derivation of the corollary from Theorem 4.1 is left to the reader. It should be proved, including the proper Hurewicz/Whitehead realization at infinity. Affects the proof, which README Stage 8.5 owns.
