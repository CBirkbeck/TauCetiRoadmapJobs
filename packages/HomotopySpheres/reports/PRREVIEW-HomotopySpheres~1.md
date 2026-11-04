# Review of HomotopySpheres (pull request #284 at fb7c47e)

**Verdict:** needs changes

The push gate fails on this head (`sorry-data=88`, `imports=1`, `build=18`, see the gate record), so no acceptance is possible before the Lean file is reshaped. The three P1 findings are the gate failures and one unowned prerequisite; the P2 findings are ownership and headline-statement defects; the P3 findings are repairs the author can take or leave but which the gate or the house style will otherwise keep raising.

## R01 (P1) — 88 sorry'd data declarations carry every headline

Location: `TauCetiRoadmap/HomotopySpheres/Suggested.lean` lines 47–76, 113–157, 206–226, 371, 437–441, 582–601, 666–673 and 68 more (the gate's `sorry-data` list).

Claim: the file states headline theorems against real carriers.

Witness: `OrientationLift.setoid` (line 113) has `iseqv := by sorry`; every `Orientation`, hence `smoothPoincareSix_oriented` (line 2170), mentions it. `pullbackBoundaryOrientation` (line 970) is `sorry`; `BoundaryIdentification`, `GeometricHCobordismWitness`, `HomotopySphereClass` and `Theta 6` are built on it, so `thetaSix_subsingleton` (line 2154) is about an unspecified relation. `stableSOHomotopyDiagram` (line 70) is `sorry`, so `stableSOHomotopy_five_subsingleton` (line 79) asserts triviality of an unspecified colimit.

Repair: delete every `def`, `abbrev`, `instance` and `opaque` whose body is `sorry` and every declaration mentioning one. Keep only definitions with real bodies on native carriers (the `SmoothAtlasCode` family, `EvenWallForm`, `OddWallFormation`, `WallSurgeryDatum.StablyEquivalent` and its quotient qualify once `hyperbolicWallForm`, `orthogonalSum`, `hyperbolicSum`, `hyperbolicWallFormation` get real bodies). Heavy carriers (collared cobordisms, framings, Thom spaces, the stable stem) become README targets with their intended signatures. The two `Internal.*Mirror` namespaces go: the brief's form has no mirrors.

## R02 (P1) — the file imports another roadmap's module, and the README mandates it

Location: `TauCetiRoadmap/HomotopySpheres/Suggested.lean` line 3 (`import TauCetiRoadmap.AlgebraicTopology.Suggested`) and lines 34–37 (`#check` of four AlgebraicTopology declarations); `TauCetiRoadmap/HomotopySpheres/README.md` lines 69–70 and 297–300 ("The consumer modules import the algebraic-topology modules … and literally `#check` them").

Claim: an import of the supplier's `Suggested.lean` is the integration gate.

Witness: gate line `imports (1)`; the allowed header is `import Mathlib` followed only by `TauCeti.*` modules. Sixteen of the eighteen build warnings come from compiling the imported module.

Repair: delete line 3 and lines 32–37. In the README, replace the import/`#check` mandate by a supplier contract naming the four declarations (`relativeHurewicz`, `homologicalWhitehead`, `poincareDualityMap_isIso`, `compactManifoldFiniteCWType`, all present in `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` on main at lines 1111, 1213, 962, 1154).

## R03 (P1) — GeometricTopology is cited as supplying carriers it does not plan

Location: `TauCetiRoadmap/HomotopySpheres/README.md` lines 72–77 ("owns … the collared oriented-cobordism carrier") and 128–132 ("the GeometricTopology supplier providing `CollaredOrientedManifold`, `SmoothEmbeddedClosedDisk`, `CollarOpen`, and `CollarSource`"); `Suggested.lean` lines 17–20.

Claim: the collared oriented-cobordism carrier, the embedded closed disc with exterior collar, and the collar domain are GeometricTopology's.

Witness: none of the four names occurs in `TauCetiRoadmap/GeometricTopology/README.md` or `Suggested.lean` on main, nor at the open revision head of GeometricTopology, which instead lists HomotopySpheres as a supplier of "Stage 1.7 simply connected h-cobordism; 4B stable O; 6C/9 low stems". GeometricTopology on main owns the collar theorem (README line 205), gluing, handle attachment (213), tubular neighbourhoods (218) and framed surgery (546), but no oriented collared cobordism carrier and no exterior-collared disc.

Repair: either own the carrier here (a target in a Layer 1 subsection, since no other roadmap plans it) or declare `gap:collared-oriented-cobordism` with supplier GeometricTopology, its collar section, and a one-sentence `needs` giving the exact fields (compact oriented manifold with corners-free boundary, collar diffeomorphism from `[0,1) × ∂M`, outward-normal-first boundary orientation), both in `plan.json` and under `## Exact supplier contracts`. The same for the embedded disc.

## R04 (P2) — two open pull requests build this roadmap

Location: `TauCetiRoadmap/HomotopySpheres/README.md` line 99 ("The same split is specified in the public HomotopySpheres follow-up #1287").

Claim: this pull request is the roadmap HomotopySpheres.

Witness: the open pull request #1287 (another author) also adds `TauCetiRoadmap/HomotopySpheres/` with a 1576-line README containing this README's text plus two further sections, and its `Suggested.lean` declares `TauCetiRoadmap.HomotopySpheres.smoothPoincareSix_oriented`, the fully qualified name this file declares at line 2170. Two open pull requests each build the object, and two `Suggested.lean` files declare the same name.

Repair: one owner. Either this pull request supersedes the other and says so in its description (not in the README), or it closes in favour of the other. Whichever remains cites nothing by pull-request number.

## R05 (P2) — TangentialBordism is cited for a statement it does not make, and plans framed Pontryagin–Thom itself

Location: `TauCetiRoadmap/HomotopySpheres/README.md` lines 846–848 ("TangentialBordism's later PT theory consumes this roadmap and is not an input to this calculation") and Stage 5 items 4–7 (lines 525–567).

Claim: TangentialBordism consumes this roadmap's Pontryagin–Thom theory.

Witness: at its open head, `TauCetiRoadmap/TangentialBordism/README.md` never names HomotopySpheres, homotopy spheres or Kervaire. Its section B5 item 2 (line 803 onward) owns "the finite-rank framed interface": framed submanifolds of a marked sphere modulo collared framed bordism, both inverse witnesses, pinch addition, "proved from the general ξ construction … not derived from the stable PT theorem", and says it compares with the stable PT map afterwards. That is the content of Stage 5 items 4–6 here. B3.2's `finiteQuadraticArf` does exist (`TauCetiRoadmap/TangentialBordism/Suggested.lean` line 66), so that citation resolves.

Repair: delete the false consumption claim. State the split in `## Scope and ownership`: either cite TangentialBordism B5.2 for the finite-rank framed bijection and own only the stable passage, the framed-bordism group and the change-of-framing formula, or record in both roadmaps that this roadmap owns framed PT and TangentialBordism consumes it (then TangentialBordism must cite this roadmap, and the merge order must place it later).

## R06 (P2) — headline theorems statable at the pins are absent, or forced through stand-ins

Location: `TauCetiRoadmap/HomotopySpheres/Suggested.lean` lines 5–22 (module docstring), 70–82, 2154–2180.

Claim: the file states the roadmap's headline theorems.

Witness, headline by headline:
- Unoriented smooth recognition in dimension six: statable with Mathlib carriers only (`Metric.sphere`, `IsManifold`, `Diffeomorph`, `ContinuousMap.HomotopyEquiv`), demanded by the README at line 954, absent.
- `π₅(SO) = π₆(SO) = 0`: statable at the pins as `Subsingleton (π_ 5 (SO(7)) 1)` with Mathlib's `HomotopyGroup` (`Mathlib/Topology/Homotopy/HomotopyGroup.lean` line 441) and `Matrix.specialOrthogonalGroup`; instead forced through the sorry'd colimit `stableSOHomotopy` (lines 70–82).
- `π₆ˢ ≅ ℤ/2`: statable as `π_ 14 (S⁸)` in the stable range (`CommGroup (π_(n+2) X x)`, HomotopyGroup.lean line 603); absent.
- Real Bott periodicity in the stable range (`π_(i+8)(SO(N)) ≃* π_i(SO(n))`): statable; absent.
- `L₀(ℤ) ≅ ℤ` by signature/8, `L₂(ℤ) ≅ ℤ/2` by Arf, `L_odd(ℤ) = 0`: statable once `hyperbolicWallForm` and `orthogonalSum` have bodies (README lines 835–846); absent although `WallSurgeryClass` is defined (line 2126).
- The h-cobordism theorem, Pontryagin–Thom, Freudenthal: not statable at the pins (no collared cobordism, no suspension on `Metric.sphere`); the docstring does not say so.

Repair: state the five statable headlines on Mathlib carriers; name the three unstatable ones in the docstring with the missing carrier; delete the stand-ins.

## R07 (P2) — exactness range differs between README and Lean

Location: `TauCetiRoadmap/HomotopySpheres/README.md` line 763 ("Prove, map by map for `n>=6`, exactness"); `Suggested.lean` lines 1667–1673 (`kervaireMilnor_exact_at_theta`, `kervaireMilnor_exact_at_almostFramed` with `[Fact (5 ≤ n)]`).

Claim: both state the Kervaire–Milnor exact segment at `Θ_n` and `A_n`.

Witness: README range `n ≥ 6`, Lean range `n ≥ 5`; at `n = 5` the Lean asserts exactness the README does not claim. `[Fact (5 ≤ n + 1)]` (line 1667) is implied by `[Fact (5 ≤ n)]` and is unused.

Repair: one range, with the Kervaire–Milnor theorem number that proves it, in both files; drop the redundant instance.

## R08 (P2) — the normal-slot convention is sorry'd data with no evaluation law

Location: `TauCetiRoadmap/HomotopySpheres/Suggested.lean` line 761 (`boundaryStableTargetEquiv`), line 1074 (`restrictStableFramingAlongCodimOne`), line 601 (`reverseNormalLine`).

Claim: "the fixed permutation puts the normal first", incoming comparisons reverse that line.

Witness: `boundaryStableTargetEquiv n : ModelSpace (n−1) × ModelSpace 1 ≃L[ℝ] ModelSpace n` is `sorry` with no theorem fixing which block it puts first; `restrictStableFramingAlongCodimOne` is `sorry` with no theorem saying the normal lands in coordinate 0 of the added `ModelSpace (r+1)`, yet `FramedBordismWitness.incomingAgrees` (line 1172) and `StableFillingBordismWitness.incomingFramingAgrees` (line 1606) apply `reverseNormalLine`, which flips coordinate `⟨0, hr⟩` (line 612). A wrong slot makes the incoming sign condition compare unrelated coordinates.

Repair: give `boundaryStableTargetEquiv` its real body (the block permutation) and state the evaluation law of the restriction at the normal vector `(0, 1)` as a theorem; recompute the two-term witness (`boundaryFrameOfHonest_apply`, line 768, and `standardSphereBoundaryFrame_apply`, line 1041, which agree on `a ↦ −a·ν`).

## R09 (P3) — `oddElementary` adds a relation the README and the source exclude

Location: `TauCetiRoadmap/HomotopySpheres/Suggested.lean` lines 2072–2085 (`OddWallFormation.ElementaryModification`), 2110 (`StablyEquivalent.oddElementary`); README lines 809–815.

Claim: stable equivalence of formations is generated by isometries, hyperbolic summands and elementary-zero formations.

Witness: README line 815 says "Elementary transvections alone do not supply these zero relations" and lists no transvection relation; Ranicki (arXiv math/0111315, §2, printed pp. 6–7, text lines 285–292) defines stability by the two trivial formations only. The Lean constructor relates `F` to `G` through `x ↦ x + c·λ(x,v)·v`. For `q` odd this is an isometry (`λ(Tx,Ty) − λ(x,y) = c·λ(x,v)·λ(y,v)·(1 + (−1)^q) = 0`). For `q = 2`, on `H(ℤ)` with `λ(e,f) = 1`, `v = e`, `c = 1`: `λ(Tf,Tf) = λ(e+f,e+f) = 2 ≠ 0 = λ(f,f)`, so `T` is not an isometry and `T(⟨f⟩)` is not a Lagrangian. Over `ℤ` the odd groups vanish, so the computed `WallSurgeryClass (2q+1)` is unchanged, but the definition is not the stated object.

Repair: delete `ElementaryModification` and `oddElementary`.

## R10 (P3) — README shape and policy

Location: `TauCetiRoadmap/HomotopySpheres/README.md` lines 88, 99, 106, 110, 842 (pull-request numbers and GitHub pull-request URLs), 281–289 (four Mathlib pull requests by number), whole file.

Claim: the README is in TauCetiRoadmap form.

Witness: headings are `## Stage k` with numbered items; there is no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k` / `### k.n`, no `*Needs:*` line anywhere, no API bullets, no `**Checks.**` lists, no `### Examples` / `### Dependencies`, no `## Downstream consumers`. No target carries a theorem or page locator: every source is cited by chapter range once per stage (e.g. line 334, 463, 852). "Acceptance checks" (line 975 onward) is a process section. Pull-request numbers appear five times with URLs; Mathlib pull requests four times.

Repair: restructure to the shape in the brief; cite suppliers by roadmap and section only; give every theorem its locator and every definition its API bullets and three Checks.

## R11 (P3) — README backticked names not declared in the Lean file

Location: `TauCetiRoadmap/HomotopySpheres/README.md` lines 219 (`ParallelizableFilling`), 308 (`IsHCobordism`), 944 (`homotopySphereClassOf`).

Witness: none of the three occurs in `Suggested.lean` (zero occurrences).

Repair: drop the backticks (prose names) or declare them.

## R12 (P3) — padding in `Suggested.lean`

Location: `TauCetiRoadmap/HomotopySpheres/Suggested.lean` lines 62, 66, 210, 365–371, 480–521, 693–705, 782, 812–886, 1041–1065, 1108, 1203, 1419–1458, 1778, 1928–1979, 2130–2149, 2161; README line 989 ("`Suggested.lean` exposes the geometric h-cobordism witness relation, …").

Claim: these declarations are acceptance-test statements.

Witness by class: API restatements of library or structure fields (`stableStemι`, `stableStemIsColimit`, `zero_mem_collarSource` closed by `simp`, `IsProductOnCollar.width_pos/width_lt_one`, `.restrict`, `normalCoordinates_over_base` closed by one `rw`, `properCollarTime_lt_one`); README Checks encoded as declarations (`standardClosedDiskInSphere`, `emptyChartCode`, `singleChartCode`, `standardSevenDiskFilling*`, `radialHemisphericalCycle*`, `sphereOutwardNormalLine*`, `standardSphereBoundaryFrame*`, `positivePoint*`); one-tactic consequences of sorried lemmas proved in place (`boundaryFrameOfHonest_rescaleNormal`, `standardSevenDiskFilling_normalization_width`, `radialHemisphericalCycle_widthOne`, `hyperbolicWallFormation_isElementaryZero`, `diagonalWallFormation_isElementaryZero`, the `example` at 2145, the three `*_refl_fromCylinder`); `thetaSixIsoZero` (2161) follows from `thetaSix_subsingleton` by `AddEquiv.addEquivOfUnique`. The README's acceptance check at line 989 asks for an API catalogue.

Repair: delete them from `Suggested.lean`; the README keeps each as a target or Check. Rewrite line 989 as a statement about headline theorems.

## R13 (P3) — `Θ_n` group law narrowed below the source

Location: `TauCetiRoadmap/HomotopySpheres/Suggested.lean` line 1128 (`homotopySphereClassAddCommGroup (n) [Fact (5 ≤ n)]`); README lines 213–216, 354.

Witness: Kervaire–Milnor, *Groups of Homotopy Spheres I*, Theorem 1.1, states that h-cobordism classes of homotopy n-spheres form an abelian group under connected sum, for every n; the inverse argument (Σ # (−Σ) bounds a contractible manifold) uses no dimension bound. Only the identification with oriented diffeomorphism classes needs `n ≥ 5` (Smale).

Repair: state the group for every `n` and keep `n ≥ 5` on the diffeomorphism identification; add the `n = 3, 4` cases as Checks.

## R14 (P3) — library claims checked at the pin

Location: `TauCetiRoadmap/HomotopySpheres/README.md` lines 291–295, 268–272, 287–288.

Witness: `ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere` (`Mathlib/Geometry/Manifold/PoincareConjecture.lean` line 41) carries `[T2Space M]`; it lacks compactness and second countability only, not "the separation" hypothesis. `TopologicalSpace.compactlyGenerated` (`Mathlib/Topology/Compactness/CompactlyGeneratedSpace.lean` line 67) is the k-ification topology at the pin and should be the cited base of the coreflector target. No sphere `SimplyConnectedSpace` instance exists at the pin (grep of the pinned Mathlib), so the mathlib4#28246 reference describes nothing available; cite the statement as a target or an AlgebraicTopology/UniversalCovers supplier instead of a pull request.

Repair: correct the three sentences.

## R15 (P3) — chapter locators that miss the cited result

Location: `TauCetiRoadmap/HomotopySpheres/README.md` lines 334 (Milnor, h-cobordism, "Chapters 2–8"), 852 and 1078 (Wall, "Chapters 2–6"), 463 (Steenrod, "Chapters 5–7 and 12").

Witness (from the books' tables of contents; the texts were not readable here, see `## Not verifiable`): Milnor's §9 is "The h-cobordism theorem and some applications", outside 2–8; Wall's surgery below the middle dimension is Chapter 1 and the computation of `L_n(ℤ)` is §13A, both outside 2–6; Steenrod's book is divided into numbered sections (§1–§41) in three Parts, not chapters.

Repair: cite the sections that contain each claim, at the claim.

## R16 (P3) — non-sorry build warnings

Location: `TauCetiRoadmap/HomotopySpheres/Suggested.lean` line 519 (`change IsClosed {p | False}` does nothing), line 1016 (unused variable `x`).

Witness: `lake env lean` on the file: exit 0, 137 `sorry` warnings and these two.

Repair: delete the `change`; rename `x` to `_x`.

## Verified sound

**Gate and dependency check.** Gate at this head: `set_option=0 latex=0 prnum=0 sorry-data=88 imports=1 build=18 FAIL`. Dependency check output: `depcheck: 155 roadmaps, 1060 edges, 0 problem(s)` (no UPWARD or CYCLE line; HomotopySpheres is line 353 of the merge order, after every supplier it names). Elaboration of `Suggested.lean` with `lake env lean`: exit 0, 137 `sorry` warnings plus the two of R16. The elaborated-signature check could not run (the worker's `#check` file failed to find the `TauCetiRoadmap` module prefix); I compared signatures by reading.

**Adversarial table** (statement; instances; values on each side; result).

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| `WallQuadraticValue q` | q = 0, 1, 2 | `ZMod 0 = ℤ`, `ZMod 2`, `ℤ` | matches ℤ-valued even forms / ℤ/2 refinements |
| `EvenWallForm.diagonal` | q even; q odd | `λ(x,x) = 2q(x)`; `λ(x,x) = q(x) − q(x) = 0` in ℤ/2, and skew gives `λ(x,x) = 0` | consistent |
| `EvenWallForm` rank 0 | zero module | dual is zero, `pairing` bijective | zero element exists, no vacuity |
| `ElementaryModification` transvection | q = 1; q = 2 on H(ℤ), v = e, c = 1 | `λ(Tx,Ty) − λ(x,y) = c·λ(x,v)λ(y,v)(1 + (−1)^q)` = 0; `λ(Tf,Tf) = 2 ≠ 0` | R09 |
| `IsElementaryZero` | `(H;F,F*)`, `(H;F,F)` | `IsCompl F F*`; common complement `F*` | matches Ranicki §2 (text lines 291–292) |
| `positivePoint_framedCollapse` | n = 0, k = 1 | normal quotient ℝ/0 ≅ ℝ; `normalDerivative` forces the tube to be orientation-preserving at 0, so `V → ℝ` is an increasing homeomorphism and the collapse has degree +1 | sound; the degree −1 reflection Check (README line 556) is not in Lean |
| `outwardNormalAtWidth_eq` | reparametrization `s ↦ εs` | `d/ds c(εs,b)|₀ = ε·∂_s c`, `ν_ε = εν` | sound |
| `boundaryFrameOfHonest_rescaleNormal` | slot `εa` | `f(dι v − (εa)ν) = f(dι v − a(εν))` | one-step consequence (R12) |
| Boundary orientation of `M × [0,1]` | t = 0, t = 1 | outward `−∂_t`: `(−∂_t, TM) = −(∂_t, TM)`; outward `+∂_t` | incoming `−X`, outgoing `+X`, as `BoundaryIdentification` requires |
| `reverseNormalLine` | r = 0; r = 1 | excluded by `0 < r`; flips the single slot | sound, but the slot it flips is unpinned (R08) |
| `CollaredOrientedManifold 0` | n = 0 | collar from a 1-manifold onto an open set of a 0-manifold forces `B = ∅` | no junk value |
| `SmoothAtlasCode` | `emptyChartCode`; `singleChartCode U` | realization empty; `identified ↔ equal values`, transition `ofSet U` | sound; `identified_refl/symm/trans` are derivable from `identified_iff` and the groupoid laws (redundant fields) |
| `HomotopySphereCycle n` | empty code | no `≃ₕ Sphere n` since `Sphere n ≠ ∅` | excluded as intended |
| `homotopySphereClassAddCommGroup` | n = 3, 4 | KM Theorem 1.1 holds; Lean requires `5 ≤ n` | R13 |
| `smoothPoincareSix_oriented` | all four choices of `(oM, oS)` | `S⁶` connected, two orientations; compose with a reflection | statement correct for every choice |
| `stableSOHomotopy_five/six` | Bott table `π_i(O), i = 0..7` | `ℤ/2, ℤ/2, 0, ℤ, 0, 0, 0, ℤ`; README 4B.8 table agrees | values right, carrier sorry'd (R01, R06) |
| Stage 9 chain | n = 6 | `π₆ˢ = ℤ/2{ν²}`, `π₆(SO) = 0 ⇒ coker J₆ = ℤ/2`, `KI(ν²) = 1`, `bP₇ = im P₇ = 0 ⇒ Θ₆ = 0` | consistent with `thetaSix_subsingleton` |
| Freudenthal range (3A.4, 9.3) | k = 6 | iso for `q ≤ 2n−2` ⇒ `π_(n+k)(Sⁿ)` stable for `n ≥ k+2 = 8` | consistent |
| Exactness range | n = 5 | README `n ≥ 6`, Lean `5 ≤ n` | R07 |
| Stage 2.3 inverse cobordism | Σ × I minus a tube | contractible, boundary `Σ # (−Σ)`; removing a disc gives an h-cobordism from `Sⁿ` | sound |
| Stage 7C ranges | k = 1 | `P₄` excluded (k ≥ 2), `P₆ = ℤ/2` (k ≥ 1), odd `P_n = 0` | correct |
| Stage 8.3 | n = 6 | needs `π₅(SO) = 0` | correct |
| `FramedNormalLine.dimension`, `sphereOutwardNormalLine` | `Sⁿ ⊂ ℝⁿ⁺¹` | `n + 1 = n + 1`; splitting `(v,a) ↦ dι v + a·x` with `x` the outward unit normal | sound |
| `standardSphereBoundaryFrame_apply` vs `boundaryFrameOfHonest_apply` | disc `Dⁿ⁺¹`, `ν = x` | both send slot `a` to `−a·ν` | mutually consistent |
| `NonemptyDiffeomorphSphere` at the pin | hypotheses | has `[T2Space M]`, lacks compact and second countable | R14 |

**Library declarations opened at the pins** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`): `CompactlyGenerated.compactlyGeneratedToTop` and `fullyFaithfulCompactlyGeneratedToTop` (`Mathlib/Topology/Category/CompactlyGenerated.lean` 77, 81; no adjunction or coreflector there); `TopologicalSpace.compactlyGenerated` (`Mathlib/Topology/Compactness/CompactlyGeneratedSpace.lean` 67); `ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere` (`Mathlib/Geometry/Manifold/PoincareConjecture.lean` 41); `HomotopyGroup` and its `commGroup` instance (`Mathlib/Topology/Homotopy/HomotopyGroup.lean` 441, 603); `IsSmoothEmbedding` (`Mathlib/Geometry/Manifold/SmoothEmbedding.lean` 72); `PartialDiffeomorph` and `Diffeomorph.mfderivToContinuousLinearEquiv` (`Mathlib/Geometry/Manifold/LocalDiffeomorph.lean` 81, header); `EuclideanSpace.instIsManifoldSphere` (`Mathlib/Geometry/Manifold/Instances/Sphere.lean` 385); `exists_embedding_euclidean_of_compact` (`Mathlib/Geometry/Manifold/WhitneyEmbedding.lean`). Tau Ceti `Geometry/Manifold/Orientation.lean` has `OrientationPreservingOn` (99), `orientationPreservingGroupoid` (178), `Orientable` (345) and no `Manifold.Orientation`; Mathlib has no `OrientationLift` or `Manifold.Orientation` and no sphere `SimplyConnectedSpace` instance at the pin, as the README assumes.

**Cross-roadmap citations resolved** (on main unless stated): AlgebraicTopology `relativeHurewicz`, `homologicalWhitehead`, `poincareDualityMap_isIso`, `compactManifoldFiniteCWType` (`Suggested.lean` 1111, 1213, 962, 1154); DifferentialGeometry Layer 2.1 orientations (README 345) with `OrientationLift`, `orientationAt`, `IsOrientationPreservingAt` (`Suggested.lean` 893, 940, 978) and Layer 10 degree (README 877); GeometricTopology collars (205), handle attachment (213), tubular neighbourhoods (218), framed surgery (546), with the four named carriers absent (R03); HeegaardFloer Lane M (142) and F0 (161); Completed UniversalCovers; TopologicalKTheory T1.5 (299), T1.6a–d (328–577), T7 (1148); CharacteristicClasses C1.1a (245); RiemannianGeometry R1 (179), R2 (300), R3 (347); MorseTheory M5 (611); RepresentationTheory's SpinRepresentations sub-roadmap; TangentialBordism B3.2 `finiteQuadraticArf` at its open head (`Suggested.lean` 66) and B5 (746, R05). TopologicalKTheory on main describes HomotopySpheres §4A/§4B as the owner of `ΩBSO ≃ SO` and the real Bott chain and orders T1.6 → §4A–§4B → T7 exactly as this README does (lines 93–96); the dependency check accepts that section-level split. ChromaticHomotopyTheory and FourManifolds, at their open heads, consume HomotopySpheres §3A, §3B, §3C, §4B, §6C and §9 by those section names, and ChromaticHomotopyTheory addresses the contract `gap:stable-james-splitting` to §3B; the restructured README should keep those section identities reachable.

**Sources read at their locators.** Snaith, arXiv 1001.4751 (text `snaith2010`): Definition 3.1 at line 253 (printed p. 7, compact boundaryless source), §3.1 at lines 285–301 (printed p. 8: framing as the homeomorphism `T(ν) ≅ Σ^r(M₊)`, collapse onto the disc bundle, augmentation `Σ^r(M₊) → S^r` collapsing `M` to the non-basepoint) supports README lines 575–576 and 579–585 as written; Example 8.3 at lines 1153–1155 (printed p. 31) states framings of `S³ × S³` of Arf invariant one, as README line 1083 cites. Ranicki, arXiv math/0111315 (text `ranicki2001`): §2 lines 285–292 (printed pp. 6–7) defines `L_(2i+1)` by stable isomorphism of formations with respect to the two trivial formations, as README lines 809–814 state.

**Ownership against open pull requests** was checked by object for h-cobordism, Kervaire–Milnor, framed Pontryagin–Thom, stable stems, James/EHP, Bott periodicity, surgery obstruction groups and compactly generated spaces across main and all 371 open heads: the only other owners found are #1287 (R04) and TangentialBordism B5 (R05); TopologicalKTheory T4 owns complex Bott periodicity (disjoint); SpinGeometry's algebraic Clifford periodicity is explicitly distinguished from the topological theorem (its README line 22–23), matching this README's split.

## Not verifiable

- Thom 1954 (DOI 10.1007/BF02566923): resolves only to a paywalled page; recorded `uncertified`.
- Steenrod 1967, Kervaire–Milnor 1963, Bott 1959: the sources service hit network trouble and the DOI landing pages (Project Euclid without a PDF link, JSTOR) are not in a licence class; not read. The seeded sample of 15 locators therefore verified four (Snaith ×3, Ranicki ×1) and could not read eleven: Milnor *h-Cobordism* §§2–9, Smale 1961, KM §§1–2 / 3–6 / 5–8, James 1955 §§1–6, Whitehead Ch. VII–XI, Toda Ch. I–V, Bott 1959 §§2–8, Milnor *Morse Theory* §24, Pontryagin Ch. II §§1–4, Wall Ch. 2–6, Browder §§1–3. R15 rests on tables of contents, not on the texts.
- The oriented six-dimensional theorem's dependence on the exact Kervaire–Milnor range (R07) could not be settled against KM's text.

## Source issues

- none
