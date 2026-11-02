# Review of AlgebraicTopology (pull request #1652 at e56dd0a)

**Verdict:** needs changes

## R01 (P1) — The Serre-fibration prerequisite has no pinned supplier

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:915–919`: “Consume native `TauCeti.TopCat.serreFibrations`”.

**Claim:** The fibration carrier, its locally trivial bundle theorem and its cube lifting theorem are available inputs to Stage 5.5.

**Witness:** Neither pinned library contains `serreFibrations`, `mem_serreFibrations_of_exists_trivialization`, `mem_serreFibrations_proj` or `hasHomotopyLiftingProperty_proj_cube`. DGFloer Layer 1 item 2 assumes the same missing native carrier; it does not supply it.

**Repair:** Give the carrier, pullback closure and bundle lifting theorem an earlier owner, with exact targets, or own them here before their consumers. If using a supplier gap, declare its precise contract in both the plan and README. Recheck the trivial projection point×point→point: its cube lifts must be constructed by that owner. Referring to a library change outside the pins does not repair this contract.

## R02 (P1) — Break the supplier cycle instead of scheduling portions of it

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:120–127,2256–2271`.

**Claim:** HomotopySpheres supplies compact generation and the suspension–loop adjunction, while consuming this roadmap's CW and homotopy theory.

**Witness:** HomotopySpheres §3A.2, `TauCetiRoadmap/HomotopySpheres/README.md:680`, needs AlgebraicTopology Stages 4.5 and 8. AlgebraicTopology 8.11b consumes that same §3A.2. The dependency checker reports both UPWARD and CYCLE.

**Repair:** Move the required foundational compact-generation/pointed-adjunction targets into an earlier common owner, or into this roadmap, and make HomotopySpheres a consumer. Remove the reverse supplier edge. Splitting the prose into “early” and “late” portions does not give the roadmap a single supply direction. The repaired graph must order the owner before both users; rerun the checker without changing the order file.

## R03 (P2) — Reuse the existing Čech refinement and colimit owner

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:1099–1122`: “also owns the finite-cover refinement colimit”.

**Claim:** This supplement constructs its own general refinement-independent Čech colimit.

**Witness:** On main, `TauCetiRoadmap/TopologicalSheafCohomology/README.md:107–155`, TS1.1–TS1.2 already owns raw refinements, their homotopies, ordered complexes, finite-cover cofinality and the refinement-preorder cohomology colimit, for arbitrary presheaves and spaces.

**Repair:** Import TS1.1–TS1.2 by section. Identify the finite nerve complex with its ordered complex for the presheaf assigning R to nonempty opens and zero to the empty open. Own only the closed-pair adapter, relative comparisons, continuity and product-module extensions. Resolve the relationship with ImplicitAtlases §0.7 and CharacteristicClasses C1.2b explicitly. On the repeated two-member point cover, both constructions have differential `(a,b)↦b−a`, H⁰=R and H¹=0; the comparison must identify these maps, not merely the resulting module.

## R04 (P2) — Replace admitted constructions with genuine headline signatures

**Location:** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean:160–166,180–183,575–580,1054–1115,1351–1352,1800–1803` and the other gate-listed data declarations.

**Claim:** The file is an acceptance test against existing carriers.

**Witness:** The gate counts 69 admitted data definitions. They include the transfer, orientation system, relative homotopy groups, spectral sequence and EM family. For example, `finiteCoverTransfer` is a data-valued `def` with body `sorry`.

**Repair:** Delete admitted data and signatures depending on it. Keep only a few simple definitions with real bodies on pinned carriers; express a headline existentially on those carriers where possible. Name each genuinely unstatable theorem and missing carrier in the module docstring. Apply the same rule to the auxiliary files. The two-sheet trivial cover is the discriminator: a zero chain map has the transfer's bare type but sends a point generator to 0 instead of the required sum of two lifts. An admitted construction is not a definition of that sum.

## R05 (P2) — State the ordinary Whitehead headline

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:1860–1862`; `TauCetiRoadmap/AlgebraicTopology/Suggested.lean:26–32,1213–1223`.

**Claim:** The completed roadmap proves ordinary Whitehead and homological Whitehead, including CW-type transport.

**Witness:** Only `homologicalWhitehead` is stated. A scratch signature for ordinary Whitehead elaborates using native CW structures, `ZerothHomotopy.lift`, `HomotopyGroup.map` and `ContinuousMap.HomotopyEquiv`, with no new data construction.

**Repair:** State ordinary Whitehead for the actual map, with a bijection on components and all positive homotopy groups at every basepoint, and retain the CW-type form with actual CW models. Inventory the other missing headlines in the docstring; it currently names none as unstatable. Test identity maps on ∅, a point, S¹ and S². The component premise must reject ∅→point; the positive-degree premise must reject the degree-two map S¹→S¹.

## R06 (P2) — Keep the obstruction constructions' connectivity binder

**Location:** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean:1787–1803,1823–1832`; README Stage 8.9.

**Claim:** The constant-coefficient obstruction and difference cochains use canonical transport to a fixed point of a simply connected target.

**Witness:** Both elaborated definitions lack `[SimplyConnectedSpace Y]`. For Y=S²⊔point based in the isolated component, π₂(Y,y)=0, but a degree-one sphere in the other component represents 1∈ℤ and has no transport to y.

**Repair:** In the intended signatures bind simple connectivity explicitly on each construction, or provide the complete component/transport data of the general local-system construction. The target example is then excluded by the explicit premise. Do not “repair” this by narrowing the README's separate n-simple/local-system target. The associated admitted theorems do retain simple connectivity; this finding concerns the definitions, not a claim that their theorem binders disappeared. R04 still requires removing these heavy admitted definitions from the acceptance file.

## R07 (P2) — Put the new theory in an extension roadmap

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:52–54,1087–1238`.

**Claim:** The base roadmap acquires a new end theory of compact metric closed pairs.

**Witness:** Against `origin/main`, the change adds 161 README lines and a ninth completion criterion. The existing base already has its own completion criteria; the new Čech theory is an extension, not a correction to an existing target.

**Repair:** Preserve the base scope and place the genuinely new closed-pair/continuity/cube-module work in an appropriately coordinated Part II roadmap, whose introduction identifies the base's stopping point. Import the existing Čech owners from R03. This keeps the circle product-block calculation as a new result while leaving the base's singular-cohomology completion criterion unchanged. 

## R08 (P3) — Remove all option overrides

**Location:** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean:909`; `OrientationComparison.lean:14–15`; `CompactOrientationLaws.lean:14–15`; `BoundaryInteriorComparison.lean:15–16` in the same folder.

**Claim:** Target signatures elaborate under defaults.

**Witness:** These are seven `set_option` commands, including local `maxHeartbeats 800000` and file-level heartbeat/synthesis overrides. The worker reports `set_option=1` because its displayed scan covers Suggested.lean.

**Repair:** Delete the overrides; simplify any retained statement or its few supporting definitions until it elaborates under defaults. Removing the admitted construction catalogue in R04 should precede that check. Do not disable the linters to clear R14.

## R09 (P3) — Apply the import rule to the auxiliary files too

**Location:** `TauCetiRoadmap/AlgebraicTopology/OrientationComparison.lean:1–2`, `GeneralModelOrientation.lean:1–3`, and the first lines of the five remaining auxiliary files.

**Claim:** The folder's Lean files depend only on the pinned libraries.

**Witness:** Six auxiliary files import roadmap modules; two import DifferentialGeometry.Suggested. TopologicalGroupFundamentalGroup imports four Mathlib submodules. None of the seven starts with the required single `import Mathlib`.

**Repair:** Retain only legal target signatures with `import Mathlib` and used individual TauCeti modules. Remove re-export-only and implementation-helper files, or turn their mathematics into README targets. For an unavailable orientation carrier, document the unavailable headline instead of importing another roadmap. Check every listed file, not only the Suggested module.

## R10 (P3) — Delete API and boundary-case padding

**Location:** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean:108–111,1968–1970,1990–1994,2017–2021,2100–2106,2274–2276,2470–2474,2789–2791`.

**Claim:** These declarations belong in a headline acceptance test.

**Witness:** `relativeChainShortComplex_shortExact` applies `shortExact_singularChainComplexShortComplex` (`TauCeti/AlgebraicTopology/Singular/Relative.lean:212`). `coordinateCubeDiskHomeomorph_boundary` follows by composing the two preceding boundary equivalences. The degree-zero coefficient, sphere and radial statements are explicit boundary-case Checks.

**Repair:** Delete them from `Suggested.lean`; retain their content in README APIs/Checks. Audit the remaining chart, coefficient, basepoint and normalization catalogue similarly. On I, the composed boundary equivalence says `t∈{0,1}` on both sides; at dimension zero both boundaries are empty. Neither calculation is an end theorem. This is deletion, not a request to prove the padding in place.

## R11 (P3) — Supply exact sources and correct Milnor's numbering

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:1087–1238,2114,2236–2241,2362`.

**Claim:** The compact Čech targets and mapping-space theorem have verifiable locators.

**Witness:** The new Čech section cites a discussion and a library pull request, with no mathematical theorem/page locator. Milnor's printed p.276 contains Theorem 3 and Corollary 3; there is no Theorem 4 in that paper.

**Repair:** Add legal primary/textbook locators for each closed-pair, continuity, ENR and cube-module claim. Cite Milnor Theorem 3 and Corollary 3, p.276, and distinguish his Theorem 2 n-ad comparison from the countable theorem. Record the cited works in `sources.toml`. Also correct the Hurewicz locator: Hatcher Theorem 4.32 is in §4.2, p.366, not §4.1. The point-source mapping space and based interval-source loop space are supported by the corrected Milnor locators. The source's own numbering slips are recorded below.

## R12 (P3) — Remove the unsupported own-API name

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:383`.

**Claim:** `coordinateCubeReferenceChain_eq_shuffle` names a declaration of this roadmap.

**Witness:** It is absent from Suggested.lean and the other reviewed Lean files. The gate reports `readme-ids-missing=2`; its second name is actually a pinned Mathlib theorem, as explained below.

**Repair:** State the shuffle comparison in prose as an API requirement, without promising an acceptance-file declaration. Keep the square check: the two ordered triangles have cancelling diagonal and boundary right−left−top+bottom. Do not add an API theorem solely to satisfy the scanner.

## R13 (P3) — Clear the two README syntax failures

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:1085,1336`.

**Claim:** README markup follows the roadmap form.

**Witness:** The gate flags the literal HTML anchor and the unquoted TeX-style expression `C_c^{cell,n}(X,A;ℤ)`.

**Repair:** Use the heading's generated anchor and update any links; write the compactly supported cellular cochain expression in Unicode or a code span. This changes no mathematics: for a countably infinite discrete set, the supported group remains ⊕ℤ and the ordinary cochain group remains ∏ℤ.

## R14 (P3) — Clear the 16 non-sorry build warnings

**Location:** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean:476–500,560–567,644,738,1757`.

**Claim:** `sorry` is the only warning.

**Witness:** Direct elaboration exits successfully, but reproduces the gate's 16 other warnings: overlapping manifold instances, class-definition reducibility, `letI`/`haveI` style, and unused binders. This is not an elaboration failure.

**Repair:** After deleting the prohibited scaffolding, remove duplicate instances, use the recommended proof-local `let`/`have`, and fix remaining reducibility/binder warnings without options. Rerun the targeted build and direct elaboration. The endpoint is zero non-sorry warnings, not merely exit status zero.

## R15 (P3) — Restore the layer, supplier and definition-Check structure

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:1–21,294–355,959–1016,1103–1122,2245–2275`.

**Claim:** Implementers can locate each definition's API, discriminating Checks and exact inputs.

**Witness:** There are no per-target `*Needs:*` lines; broad stage paragraphs and a dependency table substitute for them. The cover-nerve/colimit definition has no three-item Checks block. The prescribed Summary, exact supplier contracts and Layer/Examples/Dependencies structure is absent.

**Repair:** Reshape the prose into the required layers, preserving its mathematical detail. Put existing-library deferrals in scope/contracts, and give each new definition an API and at least three discriminating Checks. For the Čech index use the empty space (0), repeated point cover (H⁰=R, H¹=0), and two-point singleton cover (H⁰=R²); these distinguish omitted empty covers and incorrect refinement identifications. Attach item-specific dependencies and locators. Remove timelessness violations such as pull-request numbers and “current” API discussion while doing so.

## Verified sound

Read all nine requested files. The PR changes only this README; the outside-folder diff is empty and the worktree remains unchanged. This full review includes inherited defects.

The pinned revisions are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Direct `lake env lean` elaboration of Suggested.lean succeeded. A separate scratch copy appended `#check @name` for all **355 actual named declarations**, preserving the original source and scopes; it also elaborated successfully. The worker's count of 362 includes scanner artifacts such as words inside comments, and its signature transcript has errors not reproduced by this independent run. The ten suspected binder losses were inspected: the rechart topology/homeomorphism adapters do not need a manifold structure merely to be those maps; the obstruction definitions have the material loss in R06. The constant obstruction complex itself is meaningful for any based Y and does not require that extra premise.

Probes tried `rfl`, `simp` and `infer_instance`, with fallback admission, on all **143 directly sorried theorem bodies**; none closed. Native applications and an elaborated proof of the composed cube/disk boundary equivalence establish R10. Ordinary Whitehead prototypes, including the component premise and all positive homotopy groups, also elaborated (R05). This proves statability, not the admitted deep theorems.

The headline inventory is:

| README headline | Acceptance status at these pins |
| --- | --- |
| Groupoid van Kampen; ordinary pair sequences, excision, Mayer–Vietoris | Native suppliers exist; cite them instead of wrapper targets. Local-system extensions remain separate targets. |
| Cellular/singular comparison | Native finite-dimensional comparison exists; arbitrary-dimension and local-system extensions must be distinguished. |
| Transfer and Cartan–Leray; Wang; Künneth | Transfer and Cartan–Leray are written through admitted data; Wang/Künneth are not headline signatures here. Native maps/complexes permit existential formulations of substantial parts. |
| Local orientation, compact-support class factory; Poincaré–Lefschetz | The file uses admitted orientation and duality maps. Constant-coefficient cap already has a native carrier; twisted/boundary statements must identify their missing construction precisely. |
| Euler characteristic | Finite-CW invariance is stated; product, cover and bundle multiplicativity need their own headline inventory. Cell-count/singular Euler equality is native. |
| Relative Hurewicz | Written through admitted relative-group data; the missing carrier must be named. |
| Ordinary and homological Whitehead | Homological version stated; ordinary version demonstrably statable and missing (R05). CW-type transport is not captured by assuming a CW structure on the original space. |
| lim/lim¹, Mittag–Leffler and Milnor | Difference/cokernel and surjective-tower theorem stated; six-term, Mittag–Leffler and integer-graded Milnor headlines are absent from the inventory. |
| Bar K(G,1), ordinary EM representability, relative obstructions, EM loops | Bar realization carrier is native; other statements use admitted constructions or are absent. The docstring gives no missing-carrier account. |
| Brouwer, proper homotopy extension/SDR, LS cup-length bound | Substantial signatures present; intermediate/zero-dimensional Checks must be removed from Lean. Proper Whitehead's supported-cohomology carrier is not available through the displayed imports. |
| Compact Čech closed-pair excision, continuity and cube-module isomorphism | No Čech carrier/signature or missing-carrier entry in the module docstring. Use the existing ownership contracts before deciding what is statable. |

The mechanical dependency check was run with the requested `--depcheck`, `--movable`, name, order and main-content inputs. Its complete diagnostic output was:

```text
UPWARD: AlgebraicTopology (on main) -> HomotopySpheres (#63) at README lines [2256, 2269, 2270, 2271]
CYCLE among: AlgebraicTopology, HilbertModules, HomotopySpheres, IndexTheory, OperatorKTheory, StringOrientation, TangentialBordism
depcheck: 205 roadmaps, 1549 edges, 2 problem(s)
```

The worker gate is **FAIL**: `set_option=1`, `tex=1`, `sorry-data=69`, `residue=1`, `readme-ids-missing=2`, `depcheck=2`, `build=16`. The remaining displayed counters are zero. R01–R15 account for the material defects and every failing rule. The `build=16` count is warnings, not sixteen build errors. One scanner result is a confirmed false positive: `isQuotientCoveringMap_iff_isCoveringMap_and` exists at `Mathlib/Topology/Covering/Quotient.lean:336`, with surjectivity, continuous action, cancellation and orbit-fiber equality. Keep it as a supplier citation; do not create a duplicate. `Units.continuousConstSMul_nonZero`, another citation lead, is explicitly proposed as work in README:276, not falsely claimed as a supplied theorem.

Ownership searches used the roadmap tools, main, board packages and supplied sibling heads, by object: Čech covers, compact cohomology, CW realization, EM families, orientations, relative/support chains and Serre lifting. No cross-roadmap fully qualified name collision was found in the inspected material. Existing suppliers were read on main; their revised open copies were not substituted. The generic Čech colimit already has an owner (R03).

The following contracts were resolved by opening their text:

| Supplier / locator | Resolved content and limit |
| --- | --- |
| `Completed/UniversalCovers/README.md`, Stages 1–3 | Cover/deck/basepoint/homotopy-map ownership; consumed, not reconstructed. |
| `TauCetiRoadmap/ClassifyingSpaces/README.md:179,185,224` | Stage 3 items 11–15 pointed maps, CW-type uniqueness and model comparison; Stage 4 resolution comparison. Native nerve model is a stated variant, not another Milnor model. |
| `TauCetiRoadmap/DGFloer/README.md`, Layer 1 items 2–4 | Named Serre sequences and EM family are planned there. Its native Serre premise is missing at the pins (R01). |
| `TauCetiRoadmap/DifferentialGeometry/README.md:345,507,862,877` | Tangent orientation, outward-first boundary, integration comparison and smooth degree; reciprocal supply does not excuse roadmap-module imports. |
| `TauCetiRoadmap/GeometricTopology/README.md:937` | Smooth triangulation comparison item 1 exists; countability, pair and marked-point refinements still need the named interfaces in the consuming target. |
| `TauCetiRoadmap/CharacteristicClasses/README.md:331–350,419–465` | S0–S4 compact-relative support diagrams/proper pullbacks; S5 is a separate support-excision condition. C1.2b consumes TS1.1–TS1.2 for Čech/singular comparison. |
| `TauCetiRoadmap/GeneralizedCohomology/README.md:228–241` | G2.1 realization-product adapter exists, with AT4/8.2 as inputs. This is not the later represented-theory package. |
| `TauCetiRoadmap/TopologicalKTheory/README.md:328–398` | T1.6 carrier/classification portion and pointed real/complex models; does not supply AT's ordinary EM identification. |
| `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1407,1459–1465` | K7.1 projective carrier; K7.2 one cell in each even dimension and normalized hyperplane class. |
| `TauCetiRoadmap/HomotopySpheres/README.md:663,680,347` at its supplied head | §3A.1 and §3A.2 are real targets, but reverse dependency is real too (R02). |
| `TauCetiRoadmap/TopologicalSheafCohomology/README.md:107–155` on main | Existing arbitrary-space refinement/colimit owner (R03). |
| `TauCetiRoadmap/ImplicitAtlases/README.md:189–209` at its supplied head | Compact Hausdorff sheaf/K-presheaf Čech theory; relevant ownership overlap, not an excuse to identify singular and Čech cohomology on arbitrary compacta. |
| `TauCetiRoadmap/AlgebraicTopologyPartII/README.md`, introduction and supplier contracts | Extension in the real/semialgebraic direction; consumes the base's ordinary theory. Its existence requires coordination, not silently folding a new end theory into the base. |

Pinned declarations opened include the following **14 declaration groups**. These are positive evidence, with the following limits:

| Pinned file and line | What was checked |
| --- | --- |
| `Mathlib/Topology/CWComplex/Classical/Basic.lean:99,135` | Relative/absolute characteristic maps, weak topology and closure-finiteness; neither class includes Hausdorffness. |
| `Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:40,43` | Simple connectivity includes nonemptiness and unique path-homotopy classes. |
| `Mathlib/Topology/Connected/PathConnected.lean:125,158` | Component quotient and lift needed for the Whitehead prototype. |
| `Mathlib/Topology/Covering/Quotient.lean:336` | Exact quotient-cover iff, including surjectivity; resolves the scanner false positive. |
| `TauCeti/AlgebraicTopology/FundamentalGroupoid/Cech/Diagram.lean:44,66` | Native diagram/cocone. |
| `TauCeti/AlgebraicTopology/FundamentalGroupoid/Cech/Colimit.lean:141` | Colimit for an actual open-cover witness. |
| `TauCeti/AlgebraicTopology/FundamentalGroupoid/Cech/Map.lean:47`; `Refinement.lean:47` | Space-map and refinement natural transformations. |
| `TauCeti/AlgebraicTopology/Singular/Excision.lean:189,207` | Native pair inclusion, closure/interior hypothesis and homology isomorphism; no good-cover assumption. |
| `TauCeti/AlgebraicTopology/Singular/Subdivision/Basic.lean:172,205,227`; `Small/Basic.lean:198`; `Small/Homotopy.lean:153` | Actual subdivision, eventual subordination and small-chain prism; local-system extensions must use these as the constant case. |
| `TauCeti/AlgebraicTopology/Cellular/EulerCharacteristic/Singular.lean:76,125,141` | Finite generation and Euler formula with explicit coefficient rank, Noetherian/division-ring and CW hypotheses. |
| `TauCeti/Topology/Homotopy/HomotopyGroup/Map.lean:119,222` | Native induced function and positive-degree homomorphism, on the actual map. |
| `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:123` | Asphericity plus a fundamental-group equivalence; no CW-type conclusion follows from this predicate alone. |
| `TauCeti/AlgebraicTopology/Cohomology/Cap/Basic.lean:101` | Native cap map keeps `p+q=n`, preventing natural-subtraction errors. |
| `TauCeti/Geometry/Manifold/Boundary/Collar/Brown.lean:458` | Compact domain, Hausdorff ambient space and injectivity accompany the local-to-global collar theorem. The README's native citation resolves. |

### Source sample and locator audit

No worker sample identifiers were supplied or recoverable. The replacement **15-target sample** uses Python `random.Random(int("e56dd0a94385145f9",16)).sample(...,15)` on numbered target paragraphs in README lines 290–2240, then sorts by line. No README locator is explicitly marked unverified. Unread sources are not certified.

| Sample / README locator | Text actually inspected; hypotheses and support |
| --- | --- |
| S01, 1.1:298, cover groupoid diagram | Native `Cech/Diagram.lean:44,66` and `Colimit.lean:141` resolve the precise construction. Brown Chapters 6–7 could not be read; no textbook-number certification. |
| S02, 1.4:306, van Kampen | Hatcher Theorem 1.20, printed p.43, `hatcher line 1956`: the based statement has path-connected overlaps and common basepoint. It does not replace the groupoid statement for disconnected overlaps. |
| S03, 3.1:486, subdivision | Hatcher Proposition 2.21 and its proof, printed pp.119–121, `hatcher line 5222`, subdivision construction at line 5242. Supports small-chain equivalence with finite subdivision depending on the chain. Native chain homotopy opened too. |
| S04, 3.3:492, excision | Hatcher Theorem 2.20, printed p.119, `hatcher line 5200`: closure of the removed set lies in the interior of the relative subspace. Constant-coefficient/native case supported; the full local-system extension remains this roadmap's work. |
| S05, 3.5:497, sphere MV checks | Hatcher §2.2, printed pp.149–150, `hatcher line 6507`, sign at line 6536 and Example 2.46 at line 6570. The interiors cover; the two inclusion maps carry opposite signs. |
| S06, 5.7:941, finite-cover totalization | Small-chain equivalence is supported by Proposition 2.21. It is an input, not a source for the entire multicomplex augmentation theorem. McCleary/Weibel texts unavailable; no exact locator for the totalization claim was certified. |
| S07, 7.4:1751, Euler examples | Hatcher Theorem 2.44, printed p.146, `hatcher line 6380`: finite CW Euler–Poincaré. Spheres and tori follow by their cell counts; projective cells are supplied by ComplexKahlerGeometry K7.2. Arbitrary infinite sums are not covered. |
| S08, 8.1:1769, relative groups/connectivity | Hatcher §4.1, printed pp.344–346, `hatcher line 15092`: relative groups use a point in A, and degree zero means every component meets A. Supports the based/empty-subspace distinction. The proposed module carrier starting at degree three is separate from nonabelian π₂. |
| S09, 8.2:1814, Kan/cubical realization | May's legal author DjVu was retrieved but could not be text-extracted. No theorem-number or proof-generality certification; the native cubical map carrier was inspected separately. |
| S10, 8.3:1844, Hurewicz | Hatcher Theorem 4.32, §4.2, printed p.366, `hatcher line 15961`: n≥2 and (n−1)-connected for the absolute isomorphism; n=1 is abelianization, not an isomorphism for arbitrary π₁. The README reference to §4.1 needs correction (R11). |
| S11, 8.6:1959, pointed quotient normalization | Hatcher's relative/sphere calculations support the abstract groups. They do not certify this Lean model's north-pole marking or shuffle sign. Those must be fixed by the explicit interval/square calculations below; the general CW-product topology is supported by Theorem A.6, printed p.524, `hatcher line 22693`. |
| S12, 8.7:1971, smooth CW type/homology spheres | The named GeometricTopology supplier resolves. Milnor, Morse Theory, Theorem 3.5, printed p.20, `milnor-morse line 946`, requires a Morse function with compact sublevels; Lemmas 3.6–3.7, pp.20–21, lines 955 and 936, cover attaching-map homotopy and transport. This is not by itself a proof of arbitrary topological-manifold CW type. |
| S13, 8.8:1979, nonabelian BG | Native nerve/classifying-space carrier and ClassifyingSpaces comparison targets resolve. May/Whitehead source proofs were unavailable. The nonabelian generator convention was tested with a 3-cycle, not just an involution. |
| S14, 8.10:2071, ordinary representability | Hatcher Theorem 4.57, printed p.393, `hatcher line 17069`, covers CW complexes and abelian coefficients, with the identity-normalized universal class (line 17078). Degree zero is handled separately (line 17088). No finite-dimensional restriction is needed. |
| S15, 8.11:2108, mapping CW type and loops | Milnor Theorem 3 and Corollary 3, printed p.276, `milnor-cw line 209` and line 218, cover compact source n-ads and based loops. General W differs from countable W₀. Hatcher Proposition 4.66, printed p.408, `hatcher line 17667`, initially gives a weak equivalence; upgrading it uses CW type and Whitehead. R11 corrects the nonexistent Theorem 4. |

Additional text checks: compact-set local fundamental classes use Hatcher Lemma 3.27, printed p.236 (`hatcher line 10255`); boundary-triad duality uses Theorem 3.43, printed p.254 (line 10976), with its orientability hypotheses. The full twisted variant is a separate extension. Hatcher's Vector Bundles §3.3, printed pp.98–101 (`hatcher-vb line 3790`), Lemma 3.18 (line 3881) and Proposition 3.19 (line 3908), distinguish a zero obstruction cochain from a zero cohomology class and state their simplicity/transport assumptions. The source leaves one difference sign as ± in the proof; the roadmap must supply its chosen oriented-cell sign.

Farrell–Taylor–Wagoner Corollary 4.9, printed p.21 (`ftw line 752`), has finite-dimensional locally finite CW spaces, simple connectivity and simple connectivity at infinity, and tests both ordinary homology and compact-support cohomology. It does not add a one-ended premise. Its controlled-filling input is Lemma 4.3 (`ftw line 610`), in the finite-dimensional countably based locally finite chain setting of Theorem 4.2, not an arbitrary chain-complex theorem. Strøm Theorem 2, printed p.12 (`strom line 82`), assumes A closed and uses a neighborhood deformation plus a zero-locus function; the cylinder SDR lemma is on p.13 (line 118). Serre's original homology spectral-sequence discussion was read (`serre line 974`, Chapter II §6); it does not supply any of the missing pinned Lean declarations in R01.

### Computed adversarial instances (142 rows)

“Pass” records agreement on the displayed instance, not a general proof. Coefficients are ℤ unless specified; zero rings are tested separately. These tests concern the mathematical objects shared by README and Lean. Admitted helper definitions remain uncertified.

| Statement / target | Instances and computed left/right values | Result; repair or constraint |
| --- | --- | --- |
| 1.1 cover diagram (S01) | Point covered twice: both objects and overlap are terminal groupoids; colimit has one object up to equivalence and automorphism group 1, as does Π₁(point). | Pass; import native colimit. |
| 1.2 path subdivision | Interval path 0→1 split at 1/2: endpoints compose 0→1; constant path splits into two identity arrows, composite identity. | Pass; unchanged. |
| 1.3 cocone universal property | Point duplicate cover: compatible functors choose one object y and one identity overlap; induced functor also chooses y. Empty space gives the initial empty groupoid on both sides. | Pass; empty index is retained. |
| 1.4 disconnected-overlap VK (S02) | Circle covered by two contractible arcs, overlap two components: groupoid pushout π₁=ℤ. Replacing overlap by one based trivial group gives 1 instead of ℤ. | Negative control rules out based shortcut. |
| 1.5 explicit circle generator | Positively oriented loop has winding 1; reversed loop −1. | Pass; unchanged. |
| 1.6 continuous unital multiplication | Discrete S₃: π₁ at 1 is trivial, although S₃ is noncommutative. Circle loops of winding 2,3: pointwise product and concatenation both have winding 5. | Pass; unchanged. |
| 2.1 quotient relative chains | (point,point): Cₙ/Cₙ=0. (point,∅): Cₙ/0=Cₙ, H₀=ℤ and Hₙ=0 for n>0. | Pass; actual quotient map retained. |
| 2.2 coefficient functor | Point with coefficient module M gives H₀=M; M=0 gives 0 in all degrees. Two discrete points give M⊕M. | Pass; no hidden nonzero-module premise. |
| 2.3 pair connecting map | (I,∂I): relative generator [0,1] has boundary [1]−[0], vector (−1,1), whose augmentation is 0. | Pass; unchanged. |
| 2.4 homotopy/dimension/additivity | Contractible I has H₀=ℤ,H₁=0; two points H₀=ℤ²; ∅ gives 0. | Pass; unchanged. |
| 2.5 disk pair in degrees 0,1,2 | (D⁰,∅) has H₀=ℤ; (I,∂I) has H₁=ℤ; (D²,S¹) has H₂=ℤ. Other nonnegative degrees are 0. | Pass; unchanged. |
| 2.5 ordered square shuffle | ∂([00,10,11]−[00,01,11]) = bottom+right−top−left; diagonal coefficients −1+1=0. | Pass; R12 keeps this in prose. |
| 2.6 local coefficient system | Circle transport +1: d₁=0, H₀=H₁=ℤ. Transport −1: d₁=−2, H₀=ℤ/2,H₁=0. | Pass; unchanged. |
| 2.7 no retraction | Boundary S⁰→I: H̃₀(S⁰)=ℤ→H̃₀(I)=0; a retract would make 0=identity on ℤ. Dimension 0 has no point→∅ map. | Pass; unchanged. |
| 2.7 Brouwer | Constant f:I→I, f(x)=1/2 has fixed point 1/2; f(x)=1−x also fixes 1/2. Translation x↦x+1 on ℝ has none. | Pass; unchanged. |
| 3.1 subdivision (S03) | Subdividing [0,1] gives [0,1/2]+[1/2,1]; boundary [1/2]−[0]+[1]−[1/2]=[1]−[0]. Point simplex unchanged. | Pass; unchanged. |
| 3.2 eventual smallness | For an interval mesh <1/4, repeated bisection has diameter 2⁻ᵏ<1/4 when k≥3; k=0 diameter 1 fails. | Pass; unchanged. |
| 3.3 excision (S04) | Removing {1} from (I,{0,1}) changes H₁ from ℤ to 0; closure{1} is not inside interior{0,1}. Removing a collar inside the relative subspace preserves the disk-pair ℤ. | Pass with hypothesis; negative control excludes endpoint removal. |
| 3.4 MV maps | Circle two-arc H₀ overlap map is (a,b)↦(a+b,−a−b). Kernel is ℤ(1,−1), image ℤ(1,−1) in the target, cokernel ℤ. | Pass; unchanged. |
| 3.5 sphere MV (S05) | Reduced Hₙ(Sⁿ)=ℤ matches H̃ₙ₋₁(Sⁿ⁻¹)=ℤ for n=1,2; S⁰ has H̃₀=ℤ. | Pass; unchanged. |
| 4.1 cellular chain group | S²: C₂=ℤ,C₁=0,C₀=ℤ. Infinite discrete set: C₀=⊕ℤ, not ∏ℤ. | Pass; unchanged. |
| 4.2 cellular differential | RP²: d₂=2,d₁=0; d₁d₂=0. Degree-m two-cell attachment: d₂(1)=m. | Pass; unchanged. |
| 4.3 cellular/singular comparison | RP² both yield (H₀,H₁,H₂)=(ℤ,ℤ/2,0); sphere both yield ℤ in dimensions 0,n. | Pass; unchanged. |
| 4.4 Euler finite generation | Point χ=1, S⁰ χ=2, S¹ χ=0, S² χ=2. Infinite discrete set has infinite-rank H₀ and no finite alternating cell count. | Pass; finite-CW hypotheses essential. |
| 4.4 suspension/smash orientation | For two degree-one interval generators, swapping factors changes orientation by −1; if either dimension is 0 the factor is +1. | Pass; unchanged. |
| 4.4 cube/disk boundary | I endpoints map to the two boundary points; cube⁰ and disk⁰ have empty boundaries. The two boundary equivalences compose to exactly these sets. | Pass; composed API theorem is padding (R10). |
| 4.4 radial normalization | x=(1,1) in sup-ball boundary maps to (1/√2,1/√2), Euclidean norm 1; x=0 maps to 0 with norm 0. | Pass; unchanged. |
| 4.4 reference simplex sign | Edge matrix for vertices −1,…,−1 and eᵢ is I+J; determinant is 1,2,3 in dimensions 0,1,2. A vertex transposition changes its sign. | Pass; unchanged. |
| 4.5 HEP/cofibration | Endpoint inclusion {0}→I is an NDR pair; (I×{0})∪({0}×I) is an L-shape retract of the square. Both are contractible (H₀=ℤ,H₁=0). | Pass; unchanged. |
| 4.5 finite gluing | Two intervals glued at an endpoint: χ=1+1−1=1, matching one interval. Gluing both endpoint pairs yields circle χ=1+1−2=0. | Pass; cofibration/excision conditions retained. |
| 4.5 product topology | Point×X=X. S¹×S¹ ordinary product is a CW torus, cells (1,2,1). For arbitrary CW products, native product topology is not automatically the weak CW topology. | Pass on instances; retain k-product restriction from Hatcher A.6. |
| 4.6 RP² sign module | Nontrivial deck generator acts −1: d₂=1+(−1)=0,d₁=(−1)−1=−2. Twisted homology (ℤ/2,0,ℤ). | Pass; unchanged. |
| 4.6 twisted RP² cochains | δ⁰=−2,δ¹=0, hence H⁰=0,H¹=ℤ/2,H²=ℤ; reducing mod 2 gives zero differentials. | Pass; unchanged. |
| 4.7 simplicial realization CW | Δ[0] has one 0-cell; Δ[1] has two vertices and one nondegenerate edge. Degenerate edges contribute 0 new cells. | Pass; unchanged. |
| 5.1 EZ/Künneth | Torus ranks: (1,1)⊗(1,1) gives (1,2,1). RP²×RP² has Tor contribution H₃=ℤ/2 although degree-three tensor terms vanish. | Pass; unchanged. |
| 5.2 Wang | Monodromy id on S¹: 1−f*=0, mapping torus H₁=ℤ². Reflection: 1−f*=2 on H₁, H₁ of mapping torus ℤ⊕ℤ/2. | Pass; unchanged. |
| 5.3 finite transfer | Two-sheet cover of a point: transfer(a)=(a,a), pushforward(b,c)=b+c, composite 2a. Zero sheets: 0→0, composite 0. | Pass; zero arbitrary map fails two-sheet normalization (R04). |
| 5.3 deck sum | Trivial two-sheet regular cover: on (a,b), transfer∘push=(a+b,a+b)=id(a,b)+swap(a,b). | Pass; requires the actual orbit/fiber identification. |
| 5.3 coinvariants/Cartan–Leray | C₂ with F₂ coefficients has positive group homology F₂, whereas averaging by 1/2 is unavailable. With ℚ, higher group homology vanishes. | Pass; unchanged. |
| 5.4 torus naturality | Matrix diag(2,3) acts by 2,3 on H₁ and 6 on H₂; swapping coordinates has determinant −1 on H₂. T⁰ has H₀=ℤ only. | Pass; unchanged. |
| 5.5 Serre input (R01) | Trivial point bundle has unique cube lift, constant point. Its existence must come from an actual fibration definition, which the named supplier lacks. | P1 ownership failure, despite sound mathematical instance. |
| 5.5 Serre differential | Hopf S¹→S³→S²: d₂:ℤ→ℤ is a unit, killing prospective H₁,H₂. Product S¹×S²: d₂=0, H₁=H₂=ℤ. | Pass; unchanged. |
| 5.6 finite-cover bicomplex | Point duplicated: Čech differential (a,b)↦b−a, kernel diagonal ℤ, cokernel 0. In a mixed square total signs are +1 and −1, sum 0. | Pass; unchanged. |
| 5.7 augmentation (S06) | Same duplicated point cover has total H₀=ℤ,Hᵢ=0 (i>0), equal to point chains. Empty space has zero augmentation and zero homology. | Pass on instances; source certification limited above. |
| 6.0 tower difference | Identity tower ℤ: Δ(x)ₙ=xₙ−xₙ₊₁. Constant sequence has Δ=0; xₙ=−n maps to constant 1. Kernel diagonal ℤ, cokernel 0. | Pass; unchanged. |
| 6.0 non-ML tower | Multiplication-by-2 tower ℤ: inverse limit 0, lim¹=ℤ₂/ℤ, nonzero; alternating binary digits give a nonintegral 2-adic class. | Pass; unchanged. |
| 6.0 six-term and cofinal shift | Identity tower: lim=ℤ,lim¹=0 before and after dropping first term; zero tower all six groups 0. | Pass; unchanged. |
| 6.0 cone/Milnor | Constant complex ℤ[0] with identity transitions: derived-limit cone has H⁰=ℤ, other H=0; lim H⁰=ℤ and lim¹ H⁻¹=0. | Pass; unchanged. |
| 6.1 cochains | Infinite discrete set: ordinary C⁰=∏ℤ while compactly supported C⁰=⊕ℤ. For module ℤ/2, Hom(ℤ/2,ℤ)=0, so arbitrary double dual is not identity. | Pass; unchanged. |
| 6.1 UCT | RP²: H¹(−;ℤ)=0; H²=Ext¹(ℤ/2,ℤ)=ℤ/2. The Hom(H₂,ℤ) term alone is 0. | Pass; unchanged. |
| 6.1 tower-based cohomology | Circle with constant coefficients gives H⁰=H¹=ℤ; zero coefficient ring gives both 0. | Pass; unchanged. |
| 6.2 cup/cross orientation | On T², a∪b evaluates 1, b∪a evaluates −1. Over F₂ both evaluate 1; over zero ring both 0. | Pass; unchanged. |
| 6.2 cap degree bound | On circle, H²=0 but H₀=ℤ. If n−p were truncated at n=1,p=2, claimed duality would equate 0 and ℤ. With p≤n or p+q=n, this instance is excluded. | Pass; retain complementary-degree premise. |
| 6.2 relative product | For I covered by its two closed half-intervals, each relative pair has zero H*, and the product lands in H*(I,I)=0. For T² the nonzero a∪b prevents such a two-set vanishing cover. | Pass; unchanged. |
| 6.2 cup length/category | Point: normalized cuplength 0, nonempty-category 1. Circle: 1 and 2. Torus: cuplength 2 and category at least 3. ∅: both defined 0. | Pass; unchanged. |
| 6.2 support/proper pullback | Constant map ℝ→point pulls compact {point} to noncompact ℝ. Identity ℝ→ℝ pulls [−1,1] to itself. | Pass; unchanged. |
| 6.2 joint proper homotopy | H(t,x)=x−tx² has each slice proper, but H(1/n,n)=0; preimage of {0} is unbounded. A proper homotopy must exclude it. | Pass; unchanged. |
| 6.2 simple connectivity at infinity | Outside large compacta: ℝ has two rays, each π₁=0; ℝ² has circle generator 1 that cannot be killed farther out; ℝ³ has sphere π₁=0. | Pass; no extra one-end hypothesis. |
| 6.2 proper Whitehead | id:ℝ→ℝ has H₀=ℤ and Hc¹=ℤ, identity on both; ℝ→point fails properness and would send Hc¹ target 0 to ℤ. | Pass; both theories and properness retained. |
| 6.3 local orientation | ℝⁿ local top homology ℤ; reflect one coordinate acts −1. Boundary point of half-space has ordinary top local relative group 0, unlike an interior point. | Pass; interior/boundary models must not be conflated. |
| 6.3 orientation tensor square | For RP² loop transport −1, tensor-square transport is (−1)(−1)=+1; choosing local generator −g gives (−g)⊗(−g)=g⊗g. | Pass; unchanged. |
| 6.3 compact local classes | In ℝ with K=[−1,1], H₁(ℝ,ℝ∖K)=ℤ and restrictions at all x∈K take the oriented class to +1. K=∅ gives zero relative group. | Pass; unchanged. |
| 6.3 orientation coefficient change | ℤ→F₂ sends local +1 and −1 to 1; ℤ→0 sends both to 0. | Pass; orientation and nonzero-generator predicates must distinguish zero ring. |
| 6.3 boundary orientation | Standard oriented I: outgoing right endpoint +1, left endpoint −1, boundary total [1]−[0]. Standard square: bottom rightward, right upward, top leftward, left downward. | Pass; unchanged. |
| 6.3 collar input | Endpoint collar of I is t↦t/2, injective, compact domain point, Hausdorff ambient I. Locally collared constant map from two points is noninjective and cannot be a collar. | Pass; unchanged. |
| 6.3 compact orientation uniqueness | S¹: two choices ±[S¹] give local values ±1 everywhere; fixing local +1 selects exactly one. Empty manifold has class 0 and no pointwise tests. | Pass; unchanged. |
| 6.4 duality | S¹: H⁰=ℤ maps to H₁=ℤ, H¹=ℤ to H₀=ℤ, each generator to generator. I: H⁰(I)=ℤ maps to H₁(I,∂I)=ℤ. | Pass; unchanged. |
| 6.4 triad duality | (I; A=∂I,B=∅): H¹(I,∂I)=ℤ maps to H₀(I)=ℤ. (I; A={0},B={1}): both relevant relative groups vanish. | Pass; unchanged. |
| 6.4 nonorientable duality | RP²: H⁰(or)=0 matches H₂(ℤ)=0; H²(or)=ℤ matches H₀(ℤ)=ℤ. Constant H²=ℤ/2 cannot replace twisted H². | Pass; unchanged. |
| 6.4 torsion linking | Oriented L(p,1), suitable oriented generator: λ(1,1)=1/p mod ℤ. For n=3,i=1 symmetry factor (−1)⁴=+1; for n=5,i=2 factor (−1)⁹=−1. | Pass; unit changes/generator choices must be tracked. |
| 6.5 degree | Circle degree-2 map sends [S¹]↦2[S¹]; reflection sends it to −[S¹], identity to +[S¹]. Constant map in positive dimension has degree 0. | Pass; unchanged. |
| 7.1 Euler–Poincaré | RP² cells 1−1+1=1; rational Betti ranks 1−0+0=1. Integral torsion contributes 0 to rank. | Pass; native result imported. |
| 7.2 Euler product/bundle | S²×S² χ=2·2=4; S¹×S² χ=0·2=0; Hopf total S³ χ=0=χ(S¹)χ(S²). | Pass; unchanged. |
| 7.3 covers/additivity | d-fold circle cover: 0=d·0. Two copies of point over point: χ=2=2·1. Empty degree-zero cover: 0=0·χ(base). | Pass; unchanged. |
| 7.4 standard values (S07) | χ(S⁰,S¹,S²)=(2,0,2); χ(T⁰,T¹,T²)=(1,0,0); χ(CP²)=1+1+1=3. | Pass; unchanged. |
| 8.1 based pair (S08) | (I,{0},0) is a valid based pair; (I,∅) has no point in its subspace and cannot instantiate it. | Pass; unchanged. |
| 8.1 relative low degrees | For (cone K(S₃,1),K(S₃,1)), π₂(pair)=S₃, nonabelian. For (D³,S²), π₃(pair)=ℤ. | Pass; unchanged. |
| 8.1 relative connectivity endpoint | Inclusion S¹→S¹∨S² has π₁ map id:ℤ→ℤ, but π₂ map 0→π₂(S¹∨S²) is not onto. | Pass; unchanged. |
| 8.2 cubical/Kan comparison (S09) | Circle: π₁=ℤ, higher groups 0; point all positive groups 0. Cubical and simplicial comparison must send winding 1 to winding 1. | Instance consistent; source unavailable, no generic certification. |
| 8.3 absolute Hurewicz (S10) | S²: π₂=ℤ→H₂=ℤ sends 1→1. K(S₃,1): π₁=S₃→H₁=ℤ/2 is abelianization, not injective. | Pass; unchanged. |
| 8.4 relative Hurewicz | (D³,S²): π₃=ℤ→H₃(pair)=ℤ sends orientation 1→1. Cone K(S₃,1) example is excluded by the simply-connected-A premise. | Pass; unchanged. |
| 8.5 ordinary Whitehead (R05) | id on ∅,point,S¹,S²: components and every πₙ map identity, inverse identity. ∅→point fails components; z↦z² on S¹ has π₁ map ×2, not onto. | Pass; missing signature is statable. |
| 8.5 homological Whitehead | Identity S² induces identities on H₀,H₂ and is an equivalence. A Poincaré homology sphere has sphere homology but nontrivial binary-icosahedral π₁. | Pass; unchanged. |
| 8.6 pointed quotient (S11) | D¹/∂D¹ has H̃₁=ℤ with [0,1] positive. D⁰ with disjoint basepoint is S⁰ with H̃₀=ℤ generated [cell]−[basepoint]. | Pass; unchanged. |
| 8.7 manifold CW type (S12) | ℝ has point CW type; S¹ has one 0- and one 1-cell. Homology 3-sphere without simple connectivity is not forced to have S³ homotopy type. | Pass; supplier/proof hypotheses retained. |
| 8.8 BG (S13) | For G=S₃, π₁(BG)=S₃ but H₁(BG)=S₃ᵃᵇ=ℤ/2; for G=1 both are trivial. | Pass; unchanged. |
| 8.8 marked edge convention | Edge for g=(123) represents g; reverse represents (132). In C₂ the generator equals its inverse, so that example alone cannot test the convention. | Pass; unchanged. |
| 8.9 obstruction cochain | Degree-1 S² map on the boundary of a 3-cell gives obstruction 1∈π₂(S²)=ℤ; constant map gives 0 and extends. | Pass; unchanged. |
| 8.9 cochain versus class | CW disk built by degree-1 attachment to S²: δ:C²→C³ is ×1. Obstruction cochain 1 is a coboundary, class 0, but the fixed degree-1 boundary map does not extend. Changing it by −1 gives zero obstruction. | Pass; unchanged. |
| 8.9 dropped binder (R06) | Y=S²⊔point, basepoint in point: coefficient π₂=0. Degree-1 map to S² has intrinsic obstruction 1 and no path to basepoint. | Bad unqualified construction; bind connectivity/transport. |
| 8.9 difference sign | Changing a degree-d sphere map to degree-d+1 changes its class by +1; reverse order changes it by −1. Over F₂ both are 1. | Pass; oriented doubled disk must use this order. |
| 8.10 representability (S14) | [Sⁿ,K(A,n)]*=A for n>0 and universal pullback sends identity to id_A. A=0 gives one homotopy class and zero cohomology. | Pass; unchanged. |
| 8.10 degree zero | X two points, A=ℤ/2: H⁰(X;A)=A² has four elements, matching functions X→A. H₀(A;ℤ)=ℤ² is not the coefficient A. | Pass; unchanged. |
| 8.10 disconnected/infinite CW | Countably many points have H⁰=∏A, not ⊕A; representable maps are arbitrary component functions. | Pass; unchanged. |
| 8.11 mapping CW type (S15) | Map(point,Y)=Y. Based ΩS¹ has components ℤ, each contractible. Map(ℕ discrete,{0,1}) is Cantor space, not CW type. | Pass; compact/finite source premise is material. |
| 8.11 pointed adjunction (R02) | Based maps S¹→Y correspond to paths I→Y with both endpoints at y; for Y=S¹ components on each side are ℤ, winding preserved. | Mathematics consistent; cyclic ownership still blocks. |
| 8.11 EM loop normalization | ΩK(A,n+1) has πₙ=A; the required comparison sends a↦a, whereas negative normalization sends a↦−a. For A=ℤ,a=1 these are 1 and −1. | Pass; unchanged. |
| 8.12 classical EM comparison | RP∞ has π₁=ℤ/2 and higher π=0; CP∞ has π₂=ℤ and other positive π=0. CP² is not a substitute for CP∞ in all degrees. | Pass; unchanged. |

The new compact Čech supplement was checked separately, because singular cohomology cannot be substituted on arbitrary compacta:

| Statement / README location | Instances and computed left/right values | Result; repair or constraint |
| --- | --- | --- |
| Cover index, :1103 | Empty space admits the 0-member cover and gives cochain group 0; point with one nonempty member gives C⁰=R. | Pass; retain m=0. R15 requires explicit Checks. |
| Nerve/relative subcomplex, :1105 | Point covered twice: nerve an edge. With A=point, relative complex 0; with A=∅, H⁰=R,H¹=0. | Pass; unchanged. |
| Finite realization comparison, :1110 | Two isolated cover members on two points: simplicial and realized H⁰=R², higher 0. | Pass on model; cite general owner/comparison. |
| Refinement direction, :1113 | Duplicated point cover refines singleton cover; pullback R→R² is a↦(a,a), giving identity R→R on H⁰. | Pass; unchanged. |
| Choice independence, :1116 | Two refinement choices send the single vertex into either end of a duplicate edge. Their H⁰ pullbacks both take (a,a)↦a; vertices differ by boundary of the edge. | Pass; unchanged. |
| Directed colimit, :1118–1122 (R03) | Repeated point covers all have H⁰=R and refinement maps id; colimit R. Empty covers give colimit 0. | Pass; import TS1.1–TS1.2 instead of second owner. |
| Coefficient change, :1122 | Point ℤ→F₂ sends 2↦0,1↦1 on H⁰; ℤ→0 sends every class to 0. | Pass; unchanged. |
| Pair pullback, :1124–1128 | Identity on (I,∂I) acts +1 on H¹=R; reflection acts −1; composing reflection twice acts +1. | Pass; map must preserve relative subsets. |
| Restricted-cover cofinality, :1129 | X={0,1}, A={0}: extend A's singleton cover and adjoin X∖A={1}; restricted extra member is empty. H⁰(A)=R. | Pass; unchanged. |
| Pair LES, :1130 | (I,∂I): H⁰(I)=R→R² is diagonal, connecting map R²→H¹(I,∂I)=R takes (a,b)↦b−a. Kernel/cokernel agree. | Pass; unchanged. |
| Triple LES, :1132 | A={0}⊂B=∂I⊂I: H⁰(B,A)=R→H¹(I,B)=R is +1, while H*(I,A)=0. | Pass; unchanged. |
| Closed excision, :1135 | Circle as union of closed arcs F,G with intersection two endpoints: H¹(S¹,G)=R=H¹(F,F∩G); degree-zero relative groups 0. | Pass; no good-cover requirement. Add source (R11). |
| Closed MV, :1136 | Two arcs: H⁰(F)⊕H⁰(G)=R²→H⁰(F∩G)=R² has diagonal-difference image rank 1; cokernel R=H¹(S¹). | Pass; unchanged. |
| Homotopy invariance, :1139 | Projection Z×I→Z and t=0 inclusion compose to identity; for Z=point, H⁰=R on each side, higher 0. | Pass; unchanged. |
| Relative cup union, :1143 | At a cover, a simplex meets A∪B iff it meets A or B: for A={0},B={1}, endpoint simplex membership is (1,0) or (0,1). | Pass; unchanged. |
| Product order, :1146–1152 | T² generators a,b give a∪b=+1 orientation, b∪a=−1; changing to F₂ gives 1=1. | Pass; unchanged. |
| Vanishing-cover consequence, :1152 | A circle degree-one class restricts to 0 on each closed arc; square of it is 0 in H²(S¹)=0. | Pass; unchanged. |
| Decreasing continuity, :1157 | Xⱼ=[0,1/(j+1)], Aⱼ=∅: colimit H⁰=R and intersection point H⁰=R, all higher 0. | Pass; unchanged. |
| Relative continuity, :1157 | Xⱼ=Aⱼ=[0,1/(j+1)]: every relative group and intersection relative group is 0. | Pass; shrinking A independently still requires Aⱼ⊂Xⱼ. |
| Empty intersection, :1165 | Nested compact sets in a compact ambient space with empty intersection have some empty stage. Example X₀=point,Xⱼ=∅ for j≥1: colimit 0=H*(∅). | Pass; unchanged. |
| Cofinal real times, :1168 | For [0,1/(t+1)], integer restrictions and all t≥0 both give H⁰=R, limit point. | Pass; unchanged. |
| No arbitrary inclusion iso, :1170 | Point→S¹ gives H¹(S¹)=R→H¹(point)=0, not an isomorphism when R≠0. | Pass; unchanged. |
| Partition/relative nerve map, :1173 | Point cover duplicated with partition (t,1−t): image runs along its edge, maps on H⁰ all id_R. If A=X, image is wholly in N_A. | Pass; unchanged. |
| ENR comparison, :1176 | Circle and (I,∂I): Čech and singular groups are respectively (R,R) and R in degree 1. Cantor set: Čech H⁰ is locally constant functions, singular H⁰ all functions on points. | Pass; ENR hypothesis prevents the false Cantor identification. |
| ENR negative control, :1180 | Indicator of one Cantor point is singular H⁰ but not locally constant; it is absent from Čech H⁰. | Pass; unchanged. |
| Cube orientation, :1184 | K=0: H⁰(Q⁰,∅)=R,u₀=1. K=1: u₁ evaluates 1 on [0,1]. K=2: u₂ evaluates 1 on the two-triangle oriented square. | Pass; unchanged. |
| Cube vanishing, :1188 | For K=1, relative H⁰=0,H¹=R,H²=0; for K=0, H⁰=R and Hⁿ=0 for n≠0. Zero ring yields 0 in every degree. | Pass; unchanged. |
| Contract passive factor, :1196 | Z=point,a=1,K=1: (I²,I×∂I) has H¹=R, all other cohomology 0, matching (I,∂I). | Pass; unchanged. |
| Product-nerve EZ, :1200 | Two duplicate point covers produce product cover with four vertices; its full simplex has H⁰=R, matching tensor of two contractible edge complexes. | Pass; unchanged. |
| Cube-module isomorphism, :1211 | Z=S¹,K=1: source H⁰=R,H¹=R becomes relative H¹=R,H²=R; generators u and u∪e. Z=∅ gives 0→0. | Pass; unchanged. |
| Right-module law, :1218 | Φ(1∪e)=u∪e=Φ(1)·e; Φ(e∪e)=0=(u∪e)·e. | Pass; unchanged. |
| Order sign, :1220 | K=r=1: u∪e=−e∪u; K=0 or r=0: + sign. Over F₂ both degree-one orders agree. | Pass; unchanged. |
| K=0 module, :1222 | B⁻=∅, Φ(v)=1∪α*v=α*v; contraction gives identity H*(Z)≃H*(Z). | Pass; unchanged. |
| Circle ring, :1224 | H*(S¹;R)=R⊕Re, e²=0. R=ℤ,F₂ gives two nonzero module generators; R=0 gives neither nonzero. | Pass; unchanged. |
| Compact cuplength, :1230 | Point normalized 0, circle 1, torus 2; injective cohomology pullback preserves products 1·e=e≠0. Noninjective point inclusion kills e. | Pass; injectivity premise essential. |
| Unnormalized convention, :1234 | Nonempty point gives 1, circle 2, empty space 0. With zero coefficients normalized value is 0, nonempty unnormalized value 1 by convention. | Pass; unchanged. |

Auxiliary-file objects and comparison maps were also tested against the same sign witnesses:

| File / object | Computed values | Result; change |
| --- | --- | --- |
| `TopologicalGroupFundamentalGroup.lean`, pointwise path product and interchange | Circle winding (1,2) gives 3 in either product; two constant paths give 0; discrete S₃ gives π₁=1. | Consistent. Keep mathematics, repair imports/form (R09). |
| `ChartSimplexLocalImage.lean`, ordered local simplex image | In dimension 1 the edge length is 2 with positive orientation; in dimension 2 determinant is 3; swapped vertices determinant −3. | Consistent; normalization cannot be arbitrary sign. |
| `OrientationComparison.lean`, chart/local versus tangent orientation | Identity chart gives +1 in tangent and local homology; reflection gives −1 in both. Two reflections give +1. | Consistent; legal inputs/options still need repair. |
| `GeneralModelOrientation.lean`, rechart through a model equivalence | For e:ℝ≃ℝ, e(x)=−x, inverse coordinate change derivative is −1; the untransported positive tangent basis would give +1. | Correct transport is required; simple topology/homeomorphism defs need no manifold binder. |
| `CompactOrientationLaws.lean`, compact-class restriction | Positive class on interval relative endpoints has local value +1 at 1/2; reversed class gives −1. Empty compact support gives 0. | Consistent; uniqueness laws discriminate the two classes. |
| `BoundaryCarrierOrientation.lean`, outward-first orientation | I left endpoint −1, right +1. Square bottom/right/top/left signs +,+,−,− in coordinate direction. | Consistent with relative boundary. |
| `BoundaryInteriorComparison.lean`, interior chart/tangent comparison | Interior point x=1/2 of I: local H₁=ℤ. Endpoint 0: ordinary local H₁(I,I∖{0})=0. | Keep genuine interior hypotheses; boundary carrier uses its own model. |
| `BoundaryInteriorComparison.lean`, fresh rechart | Reflection multiplies both orientation identifications by −1; their comparison square gives (−1)·(+1)=(+1)·(−1). | Consistent; not proof that every admitted comparison construction is defined. |


## Not verifiable

Seven works were readable: Hatcher, Hatcher’s Vector Bundles, Milnor’s CW paper and Morse Theory, Farrell–Taylor–Wagoner, Strøm and Serre. Missing requests are consolidated; no roadmap manifest was edited. Limits:

- **brown-groupoids**, Chapters 6–7: bibliographic source-service lookup did not find a readable legal text. Native groupoid statements were checked, but the textbook locators were not certified.
- **eilenberg-steenrod**, Chapters I–III: the service reached the publisher DOI landing page (10.1515/9781400877492), not readable open text. No exactness/excision passage was inferred from that page.
- **whitehead**, Chapters II–VII: bibliographic lookup supplied no readable legal copy. General relative-homotopy/Kan/comparison locators remain uncertified except where the report identifies a different source actually read.
- **may**: the author's [book page](https://www.math.uchicago.edu/~may/BOOKS/) supplied a legal DjVu, but the source service has no DjVu text extractor and no local decoder was available. Its simplicial-realization and bar-construction theorem locators remain unverified.
- **mccleary**, Chapters 1–2: publisher DOI landing page 10.1017/CBO9780511626289, no readable open text; spectral-sequence and finite-cover totalization locators not certified.
- **weibel**, Chapters 3 and 5: publisher DOI landing page 10.1017/CBO9781139644136, no readable open text; general-ring derived-functor, lim¹ and spectral-sequence locators not certified.
- **brown-cohomology**, Chapter VII: bibliographic lookup found no readable legal copy. Cartan–Leray/transfer source locators remain unverified.
- **freedman-quinn**, Appendix: bibliographic lookup found no readable legal text. The proper-CW claims were checked against the separate Farrell–Taylor–Wagoner text where applicable, not attributed to an unread appendix.
- **dold**, Chapters VII–VIII: the source service classified the publisher work as uncertified/paywalled. That classification is respected; no renewed missing-text request was made.
- An additional attempt to read Brown's collar paper from an institutional Glasgow URL timed out. This is not a missing supplier finding: the actual compact-domain collar theorem was opened at the Tau Ceti pin and its hypotheses verified above.
- The new compact Čech subsection provides no textbook/paper locator for its end theorems. Its computations above are mathematical checks, not certification of a nonexistent reference (R11).
- The 69 admitted data constructions and unread source arguments remain uncertified. The 142 instance rows and elaboration do not prove every general target. The unspecified worker sample could not be reproduced.

## Source issues

- **Misprint** in milnor-cw at the end of the proof of Theorem 2, printed p.276 (line 206): the source says the argument completes Theorem 3; it should be Theorem 2; affects the proof.
- **Misprint** in milnor-cw at the proof of Corollary 3, printed p.276 (line 221): the source says apply Theorem 4; it should be Theorem 3; affects the proof.
