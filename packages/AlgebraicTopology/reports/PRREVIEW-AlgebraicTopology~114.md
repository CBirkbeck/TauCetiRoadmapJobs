# Review of AlgebraicTopology (pull request #1652 at 946a78a)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/AlgebraicTopology/` at 946a78a. The folder changed by 567 lines since 456e2cb, the head the previous review read.

The previous review's five mathematical findings are repaired; its R06 (title, description, merge order) is not. Six findings remain, one of them blocking:
- **R01 (P2):** §4.8 and DGFloerPartII 1.0 both own the compact-generation coreflection and the convenient pointed category, and Mathlib already has the coreflection.
- **R02 (P3):** a second batch of targets (§§1.3, 2.5, 4.1, 4.2, 4.4, 4.5, 4.6, 4.8, 8.2, 8.5) restate Mathlib or Tau Ceti declarations that the supplier contracts never name.
- **R03 (P3):** fifteen former Lean names of this roadmap that roadmaps on main cite, and six more cited at open heads, are dropped with no entry in the former-names list.
- **R04 (P3):** the title and description are stale, and no order is stated against the six open pull requests that conflict with or overlap this folder.
- **R05 (P3):** locators and one Check expression.
- **R06 (P3):** `cupProduct` has no Checks.

## Previous findings (review of 456e2cb)

- **R01 (P2, Hurewicz headlines absent, stale docstring): repaired.**
  - `Suggested.lean:204`–`:224` adds `hurewicz_bijective` and `relativeHurewicz_bijective` in the proposed form.
  - `homologicalWhitehead` (`:230`), `nonempty_homotopyEquiv_sphere_of_homologySphere` (`:263`) and `finiteSourceMappingCWType` (`:284`) now take `[TauCeti.CWType _]`.
  - The LS bound is stated with the native count (`:108`–`:110`).
  - The docstring (`:32`–`:62`) moves the Wang sequence, CW type and the Hurewicz carriers to the list of what Tau Ceti proves, and lists only missing carriers.
- **R02 (P2, path components in 8.4): repaired.** `README.md:3103`–`:3105` reads "every path component of X meets A … (Hatcher, §4.1, p.346 …)". The sine-curve Check is added at `:3130`–`:3137`.
- **R03 (P3, a dozen natives): repaired for every item listed.**
  - New supplier bullets: `:476`–`:540`.
  - §§2.6, 3.1–3.2, 5.2, 5.4, 5.6, 5.7, 6.1 and 6.2 now read "consume X; add Y", each with new Checks.
  - §6.5 points at `TopCat.singularCohomologyBockstein` (`:2730`–`:2731`).
  - Further instances of the same class remain (R02 below).
- **R04 (P3, locators): repaired.**
  - §3.2: `:1042`–`:1046`.
  - §5.1: Stacks Lemma 15.65.4, Tag 0H7Z (`:1660`–`:1661`), checked at stacks-more-algebra line 7399.
  - §8.12: Hatcher Example 1B.3, p.88, and Example 4.50, p.380 (`:3859`–`:3861`).
- **R05 (P3, process words): repaired.** The text now reads "Consume §2.5's two-case normalization" (`:2576`) and "consumes the native arbitrary-pole generator" (`:2586`). "Previously owned" became "§6.2's countability of cells" (`:3296`).
- **R06 (P3, title, description, order): not repaired.** Carried as R04.

## R01 (P2) — §4.8 and DGFloerPartII 1.0 both own the compact-generation coreflection and convenient pointed category; Mathlib already has the coreflection

**Location.**
- `README.md:154`–`:156`: "Layer 4.8 is the single owner of the compact-generation coreflection, convenient products, exponentials, CW comparisons and the foundational pointed suspension–loop adjunction."
- `:1573`–`:1576`: "Define the compact-generation functor k … Bundle it as the right adjoint to the native fully faithful inclusion".
- `:1589`–`:1599`: the triangle identities, the counit, the pointed exponential law and the raw-quotient comparisons.

**Claim.**
- The same objects have a second owner in an open roadmap.
- The coreflection itself is already in Mathlib, which the supplier contracts (`:262`–`:271`) do not name.

**Witness.**
- DGFloerPartII at the head of #1799 owns these objects in `README.md:468`–`:560` (§1.0): the coreflection, the convenient products, the exponential law, the smash product, the suspension–loop adjunction and the comparison with the raw quotients. Its `Suggested.lean:94` and `:103` declare `compactlyGeneratedToTop_isLeftAdjoint` and `compactlyGeneratedSpace_prod`.
- Mathlib at the pin, `Mathlib/Topology/Convenient/Category.lean`, has:
  - `GeneratedByTopCat.adj` (`:297`), with the inclusion as left adjoint;
  - `Coreflective` (`:322`), `CreatesColimits` (`:326`) and `HasLimits` (`:329`).

**Repair.** This roadmap is on main and cannot consume DGFloerPartII, which consumes this roadmap's §4.4 (#1799 `README.md:427`–`:429`). So §4.8 keeps the objects:
1. Rewrite `:1573`–`:1576` and the first bullet at `:1589`–`:1590` to consume Mathlib's `GeneratedByTopCat.adj`, `Coreflective`, `CreatesColimits` and `HasLimits` for the family of `CompHaus` spaces. Add them to the Mathlib supplier bullet at `:262`–`:271`.
2. Own only the identification of that subcategory with `CompactlyGenerated` (both topologies are coinduced by all maps from compact Hausdorff spaces) and the transported adjunction.
3. In the pull request's merge-order paragraph, state that DGFloerPartII 1.0's coreflection, product, exponential, pointed and raw-quotient items become citations of §4.8 when this pull request merges.

Instance that pins the identification: the Sierpiński space S. Both `k S` and the `GeneratedByTopCat` coreflection of S have the opens ∅, {1}, {0,1} (path t↦[t>0]), so the two right adjoints agree there.

## R02 (P3) — A second batch of targets restates Mathlib and Tau Ceti declarations the supplier contracts never name

**Location.** `README.md:81`–`:82`: "The supplier contracts name each declaration and file; the layers below build only what those files lack." The table below lists the targets that contradict this sentence.

**Witness.** Each README passage says "Own", "Construct", "Derive" or "Prove" for an object that exists at the pins (Tau Ceti 2fd255d9 unless marked Mathlib). None of these names appears in the README.

| README | Native at the pin |
| --- | --- |
| §1.3 `:768`–`:773`: based presentation, kernel the normal closure of the i_ij(ω)i_ji(ω)⁻¹ | `TauCeti.ker_vanKampenLift`, `TauCeti.vanKampenQuotientEquiv` (`FundamentalGroup/VanKampen/Presentation/Basic.lean:104`, `:140`); `TauCeti.ker_vanKampenWideLift_of_isPathConnected_triple`, `TauCeti.vanKampenCoverQuotientEquiv` (`Presentation/Cover.lean:138`, `:163`; Hatcher Thm 1.20) |
| §2.5 `:881`–`:885`: cube-to-sup-ball t↦(2t_j−1)_j and sup-ball-to-disk x↦(‖x‖∞/‖x‖₂)x | `TauCeti.cubeHomeomorphClosedBall` (`Analysis/Normed/Module/Ball/Homeomorph.lean:195`); `TauCeti.diskHomeomorphClosedBall` (`AlgebraicTopology/Disk.lean:197`, the radial `ContinuousLinearEquiv.unitBallHomeomorph` of `EuclideanSpace.equiv`); composite `TauCeti.diskHomeomorphCube` (`Disk.lean:336`) |
| §4.1 `:1124`–`:1128`: lifted CW structure on a cover | `TauCeti.cwComplexPreimage`, `TauCeti.cellPreimageEquiv` (`Topology/CWComplex/Classical/Covering.lean:398`, `:411`) |
| §4.2 `:1134`–`:1136`: incidences as degrees of attaching maps | `TauCeti.singularHomologyπ_cellAttachingMap_eq_cellularIncidence_smul` (`Cellular/LocalDegree.lean:626`, the local-degree form) |
| §4.4 `:1180`–`:1181`: cube quotient Iⁿ/∂Iⁿ≅Sⁿ | `TauCeti.cubeQuotientHomeomorphSphere` (`Sphere/CubeQuotient.lean:361`, pole e_last), `HomotopyGroup.sphereEquiv` (`:453`) |
| §4.5 `:1298`, `:1315`–`:1316`, `:1366`–`:1367`, `:1380`–`:1383`, `:1419`: NDR data; the closed embedding Z→Z∪_aY and Hausdorffness; finite-stage factorization; normality of the union; the product CW structure | `TauCeti.NDRPair`, `TauCeti.nonempty_ndrPair_iff` (`Topology/Homotopy/Extension/NDRPair.lean:86`, `:556`); `TauCeti.TopCat.isClosedEmbedding_of_isPushout` (`Topology/Category/TopCat/ClosedEmbedding.lean:93`); `TopCat.RelativeCWComplex.t2Space` (`Topology/CWComplex/Abstract/Hausdorff.lean:135`); `TauCeti.TopCat.exists_subset_range_ι_of_isCompact`, `exists_lift_of_compactSpace` (`TopCat/Compact.lean:88`, `:133`, for T1 stages and injective bonds); `TauCeti.TopCat.normalSpace_of_isPushout`, `t1Space_of_isColimit`, `normalSpace_of_isColimit` (`TopCat/Normal.lean:71`, `:144`, `:154`); `TauCeti.cwComplexProd` (`Classical/Product.lean:194`, finite factors only) |
| §4.6 `:1475`–`:1484`, `:1499`–`:1501`: the quotient topology on `Projectivization 𝕜 V`; the RPⁿ cells and differential; the degree-m two-cell complex | Mathlib `Projectivization.instTopologicalSpace`, `isQuotientMap_mk'`, `continuous_iff` (`Mathlib/Topology/Algebra/Projectivization.lean:44`, `:47`, `:56`); `TauCeti.RealProjectiveSpace` (`UniversalCover/RealProjective/Basic.lean:60`) with `.cwComplex` (`Topology/CWComplex/Classical/RealProjective.lean:427`) and `cellularIncidence_cwComplex_eq_two_or_eq_neg_two_of_odd` (`Cellular/RealProjective/Basic.lean:372`); `TauCeti.exists_cellularDifferential_sphereMappingCone_eq_smul` (`Cellular/SphereMappingCone/Basic.lean:354`) |
| §4.8 `:1591`: counit a homeomorphism on Hausdorff CW complexes | `TauCeti.instDeltaGeneratedSpaceCWComplex` (`Classical/DeltaGenerated.lean:61`), then Mathlib's delta-generated ⇒ sequential (`DeltaGeneratedSpace.lean:58`) ⇒ `UCompactlyGeneratedSpace` (`CompactlyGeneratedSpace.lean:211`) |
| §8.2 `:3013`–`:3016`, `:3027`–`:3032`: Kan homotopy groups; `TopCat.toSSet.obj X` Kan; natural cubical comparison; simplicial groups Kan; π_n(G)≃H_n(NG) for abelian G, degree 0 included | `SSet.KanComplex.π` with its `group` instance and `π.map` (`SimplicialSet/KanComplex/HomotopyGroup.lean:55`, `:194`); `TopCat.kanComplex_toSSet_obj` (`SimplicialSet/KanComplex.lean:48`); `TopCat.toSSetPiEquivHomotopyGroup`, `_map`, `toSSetPiMulEquivHomotopyGroupMulOpposite` (`Homotopy/SingularSet.lean:164`, `:208`, `:265`); `SSet.kanComplex_of_group`, `CategoryTheory.SimplicialObject.kanComplex_comp_forget_grpCat` (`KanComplex/SimplicialGroup.lean:186`, `:226`); `CategoryTheory.SimplicialObject.piAddEquivNormalizedMooreComplexHomology`, `piZeroEquivNormalizedMooreComplexHomology` (`KanComplex/MooreComplex.lean:509`, `:539`) |
| §8.5 `:3212`–`:3216`: the set of ends and its inverse-limit description | `TauCeti.EndComponents`, `TauCeti.endComponentsEquivSections` (`Topology/Connected/Ends.lean:228`, `:376`) |

The ownership is visible in the computed values:
- The native RP² incidences are 1+(−1)^(i+1) times a unit: d₁=0 and d₂=±2, as §4.6 claims.
- The ends of ℝ are two (`TauCeti.natCard_endComponents_real`), as the §8.5 Check claims.
- The native cubical comparison is a group isomorphism onto the *opposite* of Mathlib's π_n (`SingularSet.lean:265`), a convention §8.2 must state, not re-derive.

**Repair.**
1. Add one supplier bullet naming these declarations and files.
2. Delete "own", "construct" and "prove" for each row and keep only what the pins lack:
   - §1.3: naturality under refinement;
   - §2.5: the reference classes and their boundary and sign pins;
   - §4.4: the comparison of the native e_last pole with this roadmap's first-coordinate pole p, or adopt e_last;
   - §4.5: the general relative CW pushout and the infinite Kelley product;
   - §4.6: the homeomorphism `TauCeti.RealProjectiveSpace n ≃ₜ Projectivization ℝ (Fin (n+1) → ℝ)` and the sign system;
   - §8.2: the nonabelian formula ker(d₀|N_n)/d₀(N_(n+1)), the realization-unit theorem and the orientation pin;
   - §8.5: the finite-component neighbourhoods and the stable π₁ at an end.
3. Tau Ceti's smooth atlas `Projectivization.instChartedSpace` (`Geometry/Manifold/Instances/Projectivization.lean:54`) sits on Tau Ceti's own copy of the projective topology. A scratch file importing it with `Suggested.lean` fails ("environment already contains 'Projectivization.instTopologicalSpace._aux_1' from Mathlib.Topology.Algebra.Projectivization"). Cite it, and own only its transfer to Mathlib's topology.
4. Map ComplexKahlerGeometry K7's consumption (`:1477`) to Mathlib's instance.

## R03 (P3) — Dropped Lean names that other roadmaps cite are missing from the former-names list

**Location.** `README.md:4262`–`:4294`, "Consumers also cite former Lean names of this roadmap … each former name maps to the section that carries its object". The list has 12 bullets (20 names).

**Witness.** Main's `AlgebraicTopology/README.md` backticks these names (and main's `Suggested.lean:423` declares `RelativeTwistedClassDatum`). This head mentions none of them. The overlaps tool reports only the four `stage-k` anchors, which `:714`–`:742` map.

| Former name | Cited by | Carried at this head |
| --- | --- | --- |
| `RelativeTwistedClassDatum` | DeRhamCohomologyAndDuality (main `README.md:52`, `:183`, `:523`) | §6.3 relative twisted class datum |
| `basedLoopCWType` | RiemannianGeometry (main `:529`; #1683), Poincare3D (main `:950`), GeneralAlgebraicKTheoryPartII (#1742 `:190`) | §8.11a based loop space |
| `cofibrationTowerHomotopyEquivalence`, `homotopyPushoutGluingComparison`, `cwSubcomplexTowerUnion` | MorseTheory (main `:431`–`:432`), CharacteristicClasses (main `:782`), DGFloerPartII (#1799 `:430`) | §4.5 |
| `diskBoundaryRelCW` | MorseTheory (main `:445`) | §4.4 relative CW structure of the disk |
| `compactTriadPoincareLefschetz` | AffineMorseLefschetz (main `:881`), HeegaardFloer (main `:663`, `:684`), K3SurfacesAndSymplecticBoundedness (#1375 `:196`) | §6.4 |
| `cwProductKelley`, `cwSubcomplexNeighborhoods` | TopologicalKTheory (main `:1531`), ComplexKahlerGeometry (main `:1372`; #1234) | §4.5 |
| `homotopyGroupKelleyProduct`, `relativeCWConnectivityOfCellDimension` | TopologicalKTheory (main `:1532`), GeneralAlgebraicKTheoryPartII (#1742 `:190`) | §8.1 (the second is Tau Ceti's `TauCeti.subsingleton_relHomotopyGroup_of_isEmpty_cell`) |
| `basedHomotopyInverseOfEquivalence` | TopologicalKTheory (main `:1540`) | Tau Ceti `TauCeti.HasHomotopyExtensionProperty.exists_basedInverse_homotopicRel` (§4.5) |
| `simplicialRealizationCW` | GeneralizedCohomology (main `:229`), ComplexKahlerGeometry (main `:1352`), CharacteristicClasses (main `:603`) | §4.7 |
| `simplicialGroupKan`, `simplicialGroupMooreHomotopyIso`, `kanRealizationUnitHomotopyIso` | GeneralizedCohomology (main `:229`–`:230`) | §8.2 (the first two are Tau Ceti's after R02) |
| `endComponents`, `stableFundamentalGroupAtEnd`, `properWhiteheadSimplyConnectedCW` | FourManifolds (#936 `:1233`–`:1234`, `:1314`) | §8.5 |

**Repair.** Add one bullet per name to `:4265`–`:4294` in the existing form "`name` (consumer): §k.m, the object", with the Tau Ceti declaration where R02 makes it native. The section-level prose of `:4226`–`:4260` does not let a reader resolve a backticked name.

## R04 (P3) — The title and description are stale, and no order is stated against the open pull requests that touch this folder

**Location.** The pull request title "compact Cech pairs and relative cup modules". The description: "Add a compact-metric Čech construction … This amendment changes only README mathematics; existing Lean modules are unchanged."

**Witness.**
- `README.md:179`–`:180` puts "Compact closed-pair Čech theory, continuity and cube-module extensions" outside this roadmap.
- `git diff --stat origin/main...HEAD` deletes seven Lean modules of the folder (5612 deletions in total).
- The overlaps list reports that #1187, #1797, #1807, #1808 and #1854 conflict in this folder's files.
- DGFloerPartII (#1799) is the second owner of R01.

**Repair.**
1. Retitle the pull request and rewrite the description to say what the head does: the Layer form at Tau Ceti 2fd255d9, the deleted modules, §§6.6 and 8.13–8.16, the two Hurewicz headlines.
2. State for each of #1187, #1797, #1807, #1808 and #1854 which is rebased onto which.
3. State the DGFloerPartII order of R01.

If the previous repair report marked this not actionable in the package because the worker edits the description, the order statement is still required before acceptance.

## R05 (P3) — Locators missing at the claim or without a page, and one Check expression with the wrong sign

**Location and witness.**
- **§1.4** (`:781`–`:783`): no locator at the claim. Brown 6.7.2 (brown line 9424, p.240) is cited only in the closing paragraph `:831`.
- **Pages missing:**
  - "Hatcher Theorem 3.43's five-lemma route" (`:2678`): hatcher line 10976, p.254.
  - "Hatcher Proposition A.3" (`:1380`): line 22617, p.522.
  - "(Hatcher, Proposition 0.19)" (`:1415`): line 867, p.16.
  - "(Hatcher Appendix A.6)" (`:1433`): Theorem A.6, line 22693, p.524.
- **§5.6 Check** (`:1853`): "D²c=−∂δc+δ∂c=0". With D=δ+(−1)^p∂ on (1,1): Dc=δc−∂c, D(δc)=∂δc, D(−∂c)=−δ∂c, so D²c=∂δc−δ∂c. The value 0 is right; the displayed expression has the opposite sign.

**Repair.**
- §1.4: add "(Brown, 6.7.2, p.240; Hatcher, Theorem 1.20, p.43)" at the claim.
- Add p.254, p.522, p.16 and "Theorem A.6, p.524" at the four places.
- Replace the expression at `:1853` with "D²c=∂δc−δ∂c=0".

## R06 (P3) — `cupProduct` has no Checks

**Location.** `Suggested.lean:83` (`cupProduct`) and `README.md:2141`–`:2142`, its only README mention.

**Witness.** The only **Checks** in §6.2 (`:2160`–`:2169`) test the LS bound. None tests the product itself, for example its sign or unit.

**Repair.** Add three Checks under §6.2:
- On T² over ℤ, with a, b the duals of the two circles, a∪b generates H² and b∪a=−a∪b; a model with the factors swapped without the sign fails here.
- 1∪a=a for the unit 1∈H⁰.
- On RP² over 𝔽₂ the nonzero class w satisfies w∪w≠0 while a∪a=0 on S¹. This separates the product from the zero pairing.

## Verified sound

**Gate, dependencies, build.**
- My run of the gate on 946a78a printed every counter at 0 and "OK" (set_option, sorry-data, imports, statement-hygiene, outside-folder, stray-files, depcheck and the rest).
- The dependency check printed `depcheck: 235 roadmaps, 2259 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `lake env lean TauCetiRoadmap/AlgebraicTopology/Suggested.lean` printed exactly 16 "declaration uses `sorry`" warnings (53 s) and nothing else.
- `git merge-tree --write-tree origin/main HEAD` is clean, and nothing outside the folder changed. The branch and main pins agree (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b).

**Lean statements.**
- One scratch file imported the built module and ran `#check @` on all 24 declarations. Each elaborated type equals its README statement, and nothing was changed. The file has no `variable` block, so no binder can drop out.
- The README statements compared are at `:2145`–`:2152`, `:2621`–`:2631`, `:2778`–`:2786`, `:2896`–`:2900`, `:3080`–`:3082`, `:3109`–`:3113`, `:3186`–`:3190`, `:3345`–`:3352`, `:3407`–`:3409`, `:3141`–`:3149`, `:3276`–`:3282`, `:3622`–`:3625`, `:4063`–`:4066` and `:4152`–`:4156`.
- The worker's 25th entry, "`μ`", is a docstring backtick.
- Index conventions, checked at the pin:
  - `HomotopyGroup.hurewicz R n` maps π_(n+1) to H_(n+1) (`Homotopy/Hurewicz/Basic.lean:201`).
  - `RelHomotopyGroup.hurewicz R n` maps `RelHomotopyGroup (Fin n)`, which is π_(n+1)(X,A), to H_(n+1) (`Homotopy/Relative/Hurewicz.lean:324`).
  - So both new headlines are stated in degree n+2 under (n+1)-connectivity, which is Hatcher 4.32 with N=n+2.
- The native Hurewicz theorems are for `X : Type` and `TopCat.{0}` (`Hurewicz/Absolute.lean:157`, `Relative.lean:157`, `:234`), so the universe-general headlines are not restatements.
- One-tactic probe: each of the 16 theorems was tried with `first | rfl | infer_instance | (simp; done) | trivial | decide | (exact ⟨⟩) | aesop`. All 16 failed, so none is padding by this test.

**Sampled locators** (Hatcher printed page = PDF page − 9; Brown = PDF − 25).

| Target | Locator | Source line, printed page | Result |
| --- | --- | --- | --- |
| 1.4 | Brown 6.7.2 p.240; Hatcher 1.20 p.43 (closing paragraph) | brown 9424 p.240 (groupoid pushout, A representative in X₀,X₁,X₂); hatcher 1956 p.43 | sound; no locator at the claim (R05) |
| 1.6 | Hatcher §3.C Ex. 5 p.291 | hatcher 12736 p.291: π₁ of an H-space is abelian, compare fg with µ(f(t),g(t)) | sound |
| 3.2 | Prop. 2.21 p.119; §3.H p.333 | hatcher 5222 p.119; 14569–14570 p.333 (local-coefficient excision by iterated subdivision) | sound |
| 3.3 | Thm 2.20 p.119; §3.H p.333 | hatcher 5200 p.119 (closure of Z in interior of A) | sound |
| 4.5 | Thm 4.8 p.349; Strøm Thm 6 p.135; Prop. A.3; Prop. 0.19; A.6 | hatcher 15205 p.349; 22617 p.522; 867 p.16; 22693 p.524 | sound; three pages missing (R05) |
| 4.7 | VBKT 1.20 p.36; Hatcher 0.16, 0.19 pp.15–16; 2.34 p.137; 2.35 p.139; 4.8 p.349 | hatcher 818, 867, 5963, 6051, 15205 | sound; May 14.1 not verifiable |
| 5.5 | SSAT Thm 1.3 p.8; p.17 | hatcher-ssat 433 (p.8: trivial π₁ action, E²=H_p(B;H_q(F;G)), filtration); 984 (p.17, "Local Coefficients") | sound |
| 6.1 | §3.H pp.328–329, 330–331, 333–334; Thm 3.5 p.203 | hatcher 14326 p.328; 14433–14470 pp.330–331 (bundles of groups, lifts); 14576–14589 pp.333–334; 8799 p.203 | sound |
| 6.4 | p.236; Thm 3.30 p.241; p.235; Thm 3.26 p.236; Thm 3.43 | hatcher 10245 p.236 (definition of a fundamental class); 10453 p.241; 10227–10229 p.235 (R-orientable iff 2=0 for nonorientable M); 10237 p.236; 10976 p.254 | sound; 3.43 page missing (R05) |
| 6.6 | Thm 3B.6 and relative form pp.275–276 | hatcher 11898 p.275; 11937 p.276 (relative Künneth for CW pairs) | sound |
| 7.4 | `TauCeti.eulerChar_sphere`, `_torus`, `_complexProjectiveSpace` | `EulerCharacteristic/Sphere.lean:62` (finrank E=n+1 ⇒ 1+(−1)ⁿ), `Torus.lean:50` (nonempty index ⇒ 0), `ComplexProjective.lean:68` (n+1) | sound |
| 8.1 | §4.1 pp.343–345; Cor. 4.12 p.351; Thm 4.8 p.349 | hatcher 14939–15077 pp.343–345 (relative groups, LES, basepoint change); 15308 p.351 | sound |
| 8.4 | §4.1 p.346; Thm 4.32 p.366 | hatcher 15100–15101 p.346 (each path component of X meets A); 15961 p.366 | sound |
| 8.9 | VBKT §3.3, Lemma 3.18 p.100, Prop. 3.19 p.101 | hatcher-vbkt 3881 (PDF 104 = p.100), 3908 (p.101) | sound |
| 8.11 | Milnor Thm 3 p.276; Hatcher 2C.5 p.182, A.11 p.528, A.14–A.16 pp.530–531 | milnor1959 209; hatcher 7923, 22877, 23034 p.530, 23063, 23081 p.531 | sound; Dugundji locators as in the previous review |

Also checked:
- Hatcher Ex. 2.48 (6588, p.151), which holds for arbitrary f, g with good pairs (6615), so the new §5.2 generality is supported.
- Ex. 2.46 (6570, p.150).
- Ex. 1B.3 (3816, p.88) and Ex. 4.50 (16490, p.380).
- §2.2 Ex. 20–22 (6854–6857, p.157).
- §4.2 Ex. 13, 16, 17 (p.390), 26, 28 (p.391) and 34 (p.392) at 16895–17022.
- Stacks 15.65.4, Tag 0H7Z (stacks-more-algebra 7399: Db(R), Tor_(−p), bounded).

**Adversarial table** (sampled targets, headlines, and every target a finding touches).

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 1.3 based presentation | S¹ by two arcs through x₀; S¹∨S¹ | intersection has 2 components, π₁(U_i)=1, so the free product 1 ↛ ℤ; native Cover.lean needs path-connected triple intersections, which excludes it; wedge: ℤ*ℤ | holds; native (R02) |
| 1.6 π₁ of topological groups | U(1), z↦zᵐ, zⁿ, squaring; SO(3) | product m+n; squaring gives 2m+2n on both routes (one-factor model 2m+n); π₁(SO(3))=ℤ/2 | holds |
| 2.5 cube/disk maps | n=1; n=2, x=(1,1) | t=0,1 ↦ −1,1; (‖x‖∞/‖x‖₂)x=(1/√2)(1,1), norm 1 | holds; native (R02) |
| 2.6 twisted triple Checks | S¹, sign system u=−1, (S¹,{p},∅) | ∂(cσ)=(u−1)c=−2c ⇒ H₀(S¹;ε)=ℤ/2; ignoring transport gives 0, H₀=ℤ | holds |
| 3.1 relative descent | (I,{0}), σ constant at 0 | Sd σ, Tσ constant at 0, both in C(A); coning from 1 leaves A | holds |
| 3.2 twisted small chains | [0,1] cover [0,.3),(.2,.8),(.7,1]; loop with u=−1 | after one subdivision [0,1/2] lies in no member; after two, all four pieces lie in members; boundary c′[b,v₁]−c′[b,v₀] gives (u−1)c=−2c; backward transport gives +2c | holds |
| 3.3 excision | (X,A,Z) with cl Z ⊄ int A: S¹, A an arc, Z its complement | Thm 2.20 hypothesis fails; claim not made | holds |
| 4.1 lifted CW | z↦z² on the one-vertex circle | native cells: pairs (cell, preimage of the centre): 2 vertices, 2 edges, χ=0=2·0 | holds; native (R02) |
| 4.5 pushout Checks | S⁰→*, degree m=0,2 | S¹: χ=1−1=0 (3−1=2 and 2−1=1 for the wrong models); S¹∨S², RP²: H₁=ℤ/2, H₂=0 | holds |
| 4.6 RPⁿ | RP², RP¹ with ε | native incidences d₁=0, d₂=±2; ε: d₂=0, d₁=±2 ⇒ H₂=ℤ, H₁=0, H₀=ℤ/2; RP¹: H₁(ε)=0 | holds; native (R02) |
| 4.7 cell homeomorphism | n=1, z=±1; n=2, z=(1,0) | w=(∓1,±1), m=1 ⇒ e₁, e₀; w=(−1,1,0) ⇒ (0,2/3,1/3) | holds |
| 4.8 coreflection | Sierpiński S; point; ∅×I | k S=S (opens ∅,{1},{0,1}); k(*)=*; k(∅×I)=∅ | holds; Mathlib `GeneratedByTopCat.adj` (R01) |
| 5.2 continuous Wang | reflection; z²; constant; f=g=id | id−g_*: (0,2)⇒H₁=ℤ/2⊕ℤ; (0,−1)⇒H₁=ℤ, H₂=0 (id+g_* gives ℤ/3); (0,1)⇒H₁=ℤ; 0⇒H_n(Y)⊕H_(n−1)(X) | holds |
| 5.4 matrix form | diag(2,1); swap; 0 | det 2 = perm 2; det −1 vs perm +1; constant: 0 on H_k, k≥1 | holds |
| 5.5 Serre Checks | ∅→B; {1}→S¹; S¹×S² vs Hopf | E²=0; E²₁,₀=ℤ but H₁(pt)=0; d²:E²₂,₀→E²₀,₁ is 0 vs iso | holds |
| 5.6 Čech signs | U₀₁₂; c at (1,1) | δc=(c,−c,c), δδc=c−c=0; D²c=∂δc−δ∂c=0, unsigned 2δ∂c | holds; expression sign (R05) |
| 6.0 tower Checks | ×2 tower; ℤ vs ×3 tower with rₙ=1 | 3x₀+1 divisible by every 4ᵏ ⇒ 3x₀=−1, impossible; Σ3ⁿ=−1/2 ∉ ℤ, nonzero in ℤ₃/ℤ | holds |
| 6.1 direct cochains | u=−1 over ℤ; u=2 over ℤ/5; RP² ε | δ⁰=u⁻¹a−a: −2a both models; 3a−a=2a vs a; H⁰,H¹,H²=0,ℤ/2,ℤ | holds |
| 6.2 `lsCupLength_add_one_le_categoryCount` | point; S¹; ∅; zero ring | 0+1≤1; 1+1≤2; 1≤0 false, so `[Nonempty X]` is needed; 0+1≤n | holds |
| 6.2 `cupProduct` | T² over ℤ | b∪a=−a∪b (native `singularCup_gradedComm`) | holds; no Checks (R06) |
| 6.4 `poincareDuality_of_isFundamentalClass` | two points/ℤ; RP²/ℤ/4; ∅ | (a,b)↦(u₁a,u₂b); local image of 2·e² is 2∈ℤ/4, so no class (H⁰=ℤ/4 vs H₂=ℤ/2); 0→0 | holds |
| 6.4 `poincareDuality_twoTorsionCoefficients` | RP²/𝔽₂; zero ring | Betti 1,1,1 on both sides; all 0 | holds |
| 6.6 `productBallImages_intersect` | p=0; constants f=(a,0), g=(0,b) | g₂ fixes S_q and misses z ⇒ radial retraction, excluded by `noRetraction_diskBoundary`; d_f=d_g=0, disjoint; H_t norm ≥ 1−(1−t)=t on S_p×D_q | holds |
| 7.2 `finsum_finrank_singularHomology_fiberBundle` | Hopf S³→S²; Klein bottle; empty fibre | 0=2·0; 𝔽₂ 1−2+1=0, ℚ 1−1+0=0; 0=χ(B)·0 | holds |
| 7.3 stratification | S² by point ⊂ equator ⊂ S² | 1−1+2=2; dropping the middle gives 3 | holds |
| 7.4 standard values | S⁰, S², T¹, CP¹ | 1+1=2, 1+1=2, 0, 2 (native statements) | holds |
| 8.1 connectivity | (RP²,RP¹), (D²,S¹) | π₁(RP²,RP¹)=0, ℤ↠ℤ/2 not injective; π₂(D²,S¹)=ℤ, π₁ a point | holds |
| 8.2 Kan/Moore | nerve S₃, g=(12), h=(23); free simplicial ab. group on Δ¹/∂Δ¹ | d₁=hg=(132), 1↦3 vs gh 1↦2; N₁=ℤ(e−s₀v), d₀=0, N₂=0 ⇒ π₀=π₁=ℤ | holds; native (R02) |
| 8.3 `hurewicz_bijective` | n=0, X=S² in universe 1; RP² | π₂=H₂=ℤ, identity ↦ +[S²], antipode ↦ −1; π₁(RP²)≠1, hypothesis fails | holds |
| 8.4 `relativeHurewicz_bijective` | (D³,S²), n=1; (D²,S¹∨S¹); sine curve | π₃(D³,S²)≅π₂(S²)=ℤ=H₃; F₂→ℤ² is abelianization (A not simply connected); `h₀` fails on the graph component | holds |
| 8.5 `homologicalWhitehead` | P→S³; degree 2 on S² | homology iso but |π₁P|=120, excluded; ×2 on H₂ | holds |
| 8.5 `properStrongDeformationRetract_of_inverse`, `HasProperHomotopyExtensionProperty` | A=X; (ℝ,{0}); (I,{0,1/n}); (I,{0}) | r=id; constant g has preimage ℝ, not compact; no retraction of I×I onto Y; K piecewise, each piece compact→Hausdorff then f or H, proper for every Y | holds |
| 8.5 ends | ℝ, ℝ², ℝ³ | 2 ends (native count), 1 with group ℤ, 1 with group 0 | holds; native (R02) |
| 8.7 CW-type headlines | ℕ discrete; [0,1]; n=0 recognition | H₀ of infinite rank ⇒ none; 2−1=1; contractible vs two-point S⁰, hence `2 ≤ n` | holds |
| 8.8 `groupClassifyingSpace_isEMOne` | trivial group; S₃ | `IsAspherical` ∧ π₁≃*G: point; six-element nonabelian π₁ | holds |
| 8.9 obstruction | D², f=id on S¹, Y=S¹; f₁ of degree k | c=1≠0; δd(e²)=k−1=c(f₁)−c(f₀); degree-m attaching gives m(k−1) | holds |
| 8.11 `finiteSourceMappingCWType` | X=∅; X=βℕ, Y=S⁰; S¹⊂ℝ² | point; 2^ℵ₀ discrete points; π₀C(S¹,S¹)=ℤ vs contractible C(S¹,ℝ²) | holds |
| 8.13 `exists_transverse_circle_classifying_map` | M=∅; dim M=0; M=S¹, f=id | empty f; H¹=0 and constant −1 avoids 1; 1 is a regular value | holds |
| 8.15 `elementaryAbelianPair_sphere_action_has_stabilizer` | n=0; n=1; n>1 | p²>2 points; free action on S¹ makes G cyclic; dim H^(n+1)(B(C_p²);𝔽_p)=n+2>1 | holds |
| Former names (R03) | `compactTriadPoincareLefschetz` | cited by AffineMorseLefschetz `:881` and HeegaardFloer `:663`; absent at this head | unmapped (R03) |

**Library declarations opened at the pins.**
- Tau Ceti:
  - Hurewicz and relative homotopy: `Homotopy/Hurewicz/Basic.lean:201`, `Absolute.lean:157`–`:163`, `Relative.lean:199`, `:282`; `Homotopy/Relative/Basic.lean:302`, `Relative/Hurewicz.lean:324`.
  - `EilenbergMacLane/Basic.lean:123`.
  - The R02 table (27 declarations; the built ones also elaborated by `#check`).
  - `Cellular/EulerCharacteristic/Sphere.lean:62`, `Torus.lean:50`, `ComplexProjective.lean:68`.
  - `Topology/CWComplex/Classical/CompactSupport.lean` and `Topology/Sheaves/SupportedCohomology/` confirm the docstring's claim that the pins have no compactly supported singular cohomology.
  - `Cohomology/Cap/Basic.lean:101` (absolute cap only), which confirms the docstring's claim that the boundary duality form is unstatable.
- Mathlib: `Topology/Convenient/Category.lean:297`–`:330`; `Topology/Algebra/Projectivization.lean:44`–`:83`; `Compactness/CompactlyGeneratedSpace.lean:211`; `Compactness/DeltaGeneratedSpace.lean:58`.

**Cross-roadmap citations and ownership.**
- Supplier sections resolved on main:
  - DGFloer Layer 1 items 1–4 (`:462`–`:621`);
  - GeneralizedCohomology G2.1 (`:234`) and G2.10 (`:651`);
  - TopologicalKTheory T1.6;
  - CharacteristicClasses C1.2a S0–S5 (`:512`–`:520`), C1.5 and C2;
  - ComplexKahlerGeometry K7.1 (`:1407`);
  - GeometricTopology smoothing-and-triangulation item 1 (mapped to 11.3, `:776`–`:778`), Layer 1 and Layer 11;
  - DifferentialGeometry Layers 2, 5.1, 9.3 and 10.
- All are on main, so §5–§8 add no upward edge.
- ClassifyingSpaces (main `:72`–`:80`) assigns van Kampen, CW and Hurewicz/Whitehead to this roadmap, and its Suggested states no 1B.9.
- HomotopySpheres (#1287 `:156`–`:159`) and FourManifolds (#936 `:197`–`:202`) consume §4.8 and §8.11a.
- MorseTheory (#1682 `:1064`–`:1101`) consumes the LS bound with the same values (S¹: 2≥2≥1+1; T²: 4≥3≥3).
- AlgebraicTopologyPartII (#1694), DeRhamCohomologyAndDuality (#2085), EtaleHomotopyTypes, ChromaticHomotopyTheory and StableHomotopyKTheoryPartII own none of this roadmap's objects.
- The four `stage-k` anchors are mapped by `:714`–`:742`, and the titles match the layer headings.

## Not verifiable

- **May, *Simplicial Objects*** (4.7 Thm 14.1; 8.2 §§3, 17): the manifest's copy is image-only and OCR is unavailable on this worker.
- **Conway–Friedl–Herrmann** (6.5): there is no manifest entry and no cached copy. The lens-space values were recomputed without the text (−1/5 vs −2/5; 3 and 2 are non-squares mod 5).
- **Uncertified in the manifest, cited by locator:** Lee 6.26–6.36, Thom 1954 Ch. II, Milnor 1963 Lemmas 3.6–3.7, Weibel, Freedman–Quinn §7.7, tom Dieck, Serre 1953, Dowker 1952.
- **No manifest copy:** Eilenberg–Steenrod, G. W. Whitehead, Dold, Serre 1951, McCleary and K. Brown, *Cohomology of Groups*. These are chapter-level citations.
- **Moore 1955:** only the numbering and pages of Théorèmes 3–5 are legible.
- **Ownership against #1187, #1797, #1807, #1808 and #1854:** their files were not given, so ownership against them was not checked beyond the conflict facts of the overlaps list.

## Source issues

- none
