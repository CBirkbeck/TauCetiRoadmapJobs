# Review of DeRhamCohomologyAndDuality (pull request #2085 at 5d70ccb)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/DeRhamCohomologyAndDuality/` (README.md, Suggested.lean, metadata.toml). The roadmap is on main, and this pull request revises it. Nothing outside the folder changes. I found four findings, all P3, and none blocking. The gate passes, the dependency check reports no problem, the file elaborates with `sorry` as its only warning, and every computed row of the adversarial pass holds except the two noted at R02 and R03.

## R01 (P3) — The title and description contradict the head, and the conflicting ownership claim of ComplexKahlerGeometry's open revision is not recorded

**Location.**

- The title reads "ComplexKahlerGeometry K6.1 is a supplier, not a consumer".
- The description reads "the README no longer names K6.1 as a consumer and cites ComplexKahlerGeometry only as a supplier".
- Against these, `README.md:1215` reads "ComplexKahlerGeometry K6.1 (analytic cycles) consumes the boundaryless instances of §§2.4, 3.1–3.3 and 4.1", and `README.md:114–116` makes this roadmap the "single owner".

**Claim.**

- The folder's position agrees with main. On main, ComplexKahlerGeometry K6.1 uses the open-pair cone and the compact-support formula under DifferentialGeometry labels (`ComplexKahlerGeometry/README.md:1382, 1396`). It owns neither.
- The folder's position also follows the rule that a revision is never a supplier.
- The description says the reverse, and it names none of the changes this head makes.
- ComplexKahlerGeometry's open revision (head a6ec295) claims the same boundaryless statements for its K6.1.RelativeIntegration, and makes this roadmap their consumer.
- If both merge as they stand, each roadmap hands §§2.4, 3.1–3.3 and 4.1 to the other.

**Witness.** ComplexKahlerGeometry at a6ec295, `README.md:1979–1981`: "K6.1.RelativeIntegration owns these boundaryless open-pair statements; DeRhamCohomologyAndDuality §§2.4, 3.1–3.3 and 4.1, which extend them to models with corners, consume these instances."

**Repair.** The README does not change.

- Rewrite the title and description to describe this head:
  - K6.1 stays a consumer;
  - Layer 1 is built on `TauCeti.IsPrimitiveOn` and `TauCeti.PrimitiveSpace`;
  - §2.5 takes a real normed target;
  - §5.2 has a local form;
  - `IsTransverseAt` and the Haar-null theorem for boundaryless second-countable manifold sources are new.
- In the merge-order paragraph, state that ComplexKahlerGeometry's revision, when rebased, cites §§2.4, 3.1–3.3 and 4.1 here instead of owning the boundaryless instances.

After this repair the description agrees with `README.md:1215`, and the overlap has a single owner on record.

## R02 (P3) — A §1.1 Check calls continuity "strictly stronger" than having local primitives

**Location.** `README.md:416–419`: "…has one although `φ` is not continuous at `0`: a closed `C^r` form, the hypothesis of `TauCeti.exists_contMDiff_isPrimitiveOn`, is strictly stronger, and so is continuity."

**Claim.** Continuity does not imply local primitives, so it is not stronger. The two conditions are incomparable, and the roadmap's own Checks show it in both directions.

**Witness.**

- `README.md:411`: "`φ = x dy` has none". This form is smooth, hence continuous, and has no local primitive: the mixed partials of a primitive would be `0` and `1`.
- `README.md:1208`: "Continuity alone gives no primitives".

**Repair.** Replace "and so is continuity" with: "; continuity is neither necessary (this form) nor sufficient (`x dy` above)."

Tested on both instances:

- `d(x² sin(1/x))` has the primitive `x² sin(1/x)`, extended by `0`. The form is `0` at `0` and `−1` at `1/(2πn)`, so it is discontinuous at `0`.
- `x dy` is continuous and has no primitive.

## R03 (P3) — §3.3 promises compatibility "with compactly supported relative classes", which no target defines

**Location.** `README.md:828–829`: "compatible with both long exact sequences including the sign of `δ`; compatible with enlargement of `W` and with compactly supported relative classes."

**Claim.** No target defines a "compactly supported relative class", and none defines a map such a class would be compatible with. The phrase occurs only on this line.

The only compact-support use is §4.1's pairs `(N, N ∖ K)`. Their maps `(N, N ∖ K′) → (N, N ∖ K)` for compact `K ⊆ K′` enlarge `W` from `N ∖ K′` to `N ∖ K`, which the preceding clause already covers. §4.1 also takes this naturality from §3.2, not from §3.3 (`README.md:879–882`: "§3.2's naturality for smooth maps of open pairs").

So the clause promises an interface that has no target.

**Witness.** A search of the README for "compactly supported relative" finds only `README.md:829`.

**Repair.** Delete ", and with compactly supported relative classes". If the special case is wanted, write instead: "in particular for the pairs `(X, X ∖ K)`, `K` compact, under the maps `(X, X ∖ K′) → (X, X ∖ K)` for `K ⊆ K′`".

Tested on §4.1's Check (`README.md:932–934`): on `(ℝ, ℝ ∖ [−3, 3]) → (ℝ, ℝ ∖ [−1, 1])` both groups `H¹` are `ℝ`, and the class of `ψ dx` evaluates to `1` on both sides.

## R04 (P3) — The DifferentialGeometry 8.4 contract cites a declaration name that DifferentialGeometry's open revision drops

**Location.** `README.md:348`: "8.4: `chainIntegral`, Stokes for smooth simplices and chains (`SmoothSimplex.integral_mextDeriv`), and `deRhamHom` …"

**Claim.**

- The name resolves on main: `DifferentialGeometry/README.md:848`.
- DifferentialGeometry's open revision (head 473c4df) states Stokes for a smooth simplex at 8.4 without this name. It keeps "cited as" aliases for `chainIntegral`, `simplexFace`, `deRhamHom` and `deRhamEquiv`, but not for this one.
- The citation resolver already lists this as the one name of the README found nowhere.

After that revision merges, the parenthesis points at nothing. The section id 8.4 itself survives.

**Witness.** DifferentialGeometry at 473c4df, `README.md:2103`: "Stokes for a smooth simplex, `∫_σ dω = ∫_{∂σ} ω` for a `C¹` form `ω`". No declaration name is given.

**Repair.** Drop the parenthesis: "8.4: `chainIntegral`, Stokes for smooth simplices and chains, and `deRhamHom` into real singular cohomology with its naturality." This resolves both on main and at the revision's head.

## Verified sound

**Gate, re-run on this head.**

```text
gate DeRhamCohomologyAndDuality: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate also records `build=0`.

**Dependency check (`--movable`).**

```text
depcheck: 235 roadmaps, 2261 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The roadmap is on main, and its suppliers are DifferentialGeometry and AlgebraicTopology, both on main. TangentialBordism, which is not on main, is named only as an adjacent roadmap, never as a supplier.

**Lean.**

- `lake env lean` on `Suggested.lean` exits 0, with six `sorry` warnings (lines 62, 82, 121, 157, 171, 216) and nothing else.
- Imports are `Mathlib` plus four Tau Ceti modules, each of which is used: `GlobalParametric`, `LocalPrimitive`, `SmoothSingular.Basic` and `Subdivision.Small.Chains`.
- The file has no `set_option`, no `lemma` and no sorry'd data. `module` on the first line matches main's version of this file and 26 other files on main.
- Signature check: I put `#check @name` for all 13 declarations in one scratch file and elaborated it once. Every elaborated type matches its README statement.
  - `incidenceEquation` elaborates without the `NormedSpace` binders. Its body uses only subtraction in `V`, so this is not a defect.
  - `TauCeti.IsRegularParameter` elaborates without the `CompleteSpace` section binders of its file, so `IsRegularIncidenceParameter` needs none.
- One-tactic padding probe: on a scratch copy, `first | (simp; done) | rfl | infer_instance | trivial` fails on all six theorems. None is padding.
- Headline coverage: 1.3, 2.2, 2.4, 5.2 and 5.3 (flat and manifold) are stated.
  - 3.3, 4.1 and 4.2 are named as not statable, and the reasons check out at the pin. Tau Ceti's `SmoothSingular/` has `TauCeti.SmoothSimplex.integral` (`Integral.lean:86`) but no Stokes for smooth simplices, so there is no cochain map without sorry'd proof data.
  - `TauCeti.localOrientationOfManifoldOrientation` (`Orientation/Chart.lean:202`) takes only `𝓘(ℝ, E′)` for an inner-product space `E′` of positive dimension, so the README's general-model statement needs AlgebraicTopology 6.3.

**Library declarations opened at the pins (file:line).**

- Tau Ceti:
  - `IsPrimitiveOn` (`Geometry/Manifold/DifferentialForm/LocalPrimitive.lean:70`). It has an `isOpen` field, so the Layer 1 hypothesis cannot be met with `U = {x}`.
  - `IsPrimitiveOn.isOpen_setOf_eq` (:132, needs only `[IsManifold I 1 M]`), `exists_contMDiff_isPrimitiveOn` (:265), `PrimitiveSpace.isCoveringMap_proj` (:280).
  - `pathClassIntegral` (`DeRham/Period.lean:90`; junk value `0` at :97; standing variables at :76–80, which are the contract's hypotheses).
  - `exists_mextDeriv_eq_of_simplyConnectedSpace` (`DeRham/SimplyConnected.lean:69`).
  - `IsRegularParameter` (`Analysis/Fredholm/LevelSet/GlobalParametric.lean:63`), `isMeagre_setOf_not_isRegularParameter` (:83), `levelSetChart` (`LevelSet/Basic.lean:118`, needs strict differentiability at its centre only).
  - `addHaar_image_criticalPoints_eq_zero` (`Analysis/Calculus/Sard/OutermostStratum.lean:347`: `ContDiffAt` on a set that need not be open, threshold `(dim)² + 1`).
  - `CochainComplex.mappingCocone.relativeCoordinates` (`Algebra/Homology/HomotopyCategory/MappingCocone/Relative.lean:54`), with `relativeCoordinates_d` (:76) giving `(d a, f a − d b)`, and its cycle, boundary and map lemmas (:103, :113, :136).
  - `quasiIso_lift_of_shortExact` (`MappingCocone/Basic.lean:221`), `acyclic_mappingCocone_id` (:147).
  - `smoothSingularSubcomplex` (`Geometry/Manifold/SmoothSingular/Basic.lean:77`).
  - `SSetPair.quasiIso_chainComplexMap` (`AlgebraicTopology/SimplicialSet/Homology/Relative/Basic.lean:145`).
  - `HomologicalOrientation` (`AlgebraicTopology/Singular/LocalHomology/Orientation/Homological.lean:75`), `fundamentalClassOn`, `realFundamentalClass` and `intToRealCoeff` (`LocalHomology/FundamentalClass.lean:139, 248, 83`).
  - `integralTopForm` and `integralTopForm_sum` (`Integration/TopForm.lean:518, 656`), `integralTopForm_ofFunction_zeroDim` and its finite form (`Integration/ZeroDim.lean:34, 67`; `[Subsingleton E]`, `[Fintype M]`).
  - `integralTopForm_mextDeriv` (`Integration/Stokes.lean:37`; `𝓡∂ (n+1)`, T2, σ-compact, `C¹` and compact support).
  - `IsLocallyCollared.isCollared` (`Boundary/Collar/Brown.lean:459`; compact `N`), `exists_contMDiffMap_isProperMap_nonneg` (`Geometry/Manifold/Exhaustion.lean:71`; boundary allowed).
  - `ModelWithCorners.locallyPathConnectedSpace` (`Geometry/Manifold/Topology.lean:36`), `IsNullSet` (`Geometry/Manifold/Measure.lean:36`).
- Mathlib:
  - `Continuous.exists_contMDiff_approx_and_eqOn` (`Geometry/Manifold/SmoothApprox.lean:79`). The target is any real normed space (:73). It gives `EqOn` on `S` only (:83), so §2.5's closed-neighbourhood step is needed.
  - `exists_contMDiffMap_one_nhds_of_subset_interior` (`Geometry/Manifold/PartitionOfUnity.lean:527`, with `[NormalSpace M]`), `exists_contMDiffSection_forall_mem_convex_of_local` (:593), `exists_contMDiff_zero_iff_one_iff_of_isClosed` (:797).
  - `CochainComplex.mappingCocone` (`Algebra/Homology/HomotopyCategory/MappingCocone.lean:33`), `mappingCone.homologySequenceδ_triangleh` (`ShortExact.lean:85`).
  - `SSetPair` and `SSetPair.of` (`AlgebraicTopology/SimplicialSet/SSetPair.lean:27, 34`), `SSetPair.chainComplex` and `chainComplexMap` (`SimplicialSet/Homology/Relative.lean:201, 207`).
  - Checked by `#check`: `IsCoveringMap.existsUnique_continuousMap_lifts` (simply connected and locally path-connected source), `liftPath`, `liftPath_apply_one_eq_of_homotopicRel`.
  - Also by `#check`: `ModelWithCorners.convex_range`, `isClosed_range`, `nonempty_interior`, `isOpen_interior`, `secondCountableTopology` and `locallyCompactSpace`.
  - Also by `#check`: `ChartedSpace.secondCountable_of_sigmaCompact`, `locallyCompactSpace` and `locallyPathConnectedSpace`, plus `sigmaCompactSpace_of_locallyCompact_secondCountable`, `paracompact_of_locallyCompact_sigmaCompact` and `NormalSpace.of_paracompactSpace_r1Space`.
  - Also by `#check`: `IsOpen.exists_contDiff_support_eq`, `mfderiv_eq_fderiv`, and `Complex.IsExactOn`, `IsConservativeOn`, `IsConservativeOn.isExactOn_ball`, `DifferentiableOn.isExactOn_ball` and `IsExactOn.differentiableOn` (all for complete targets).
  - Also by `#check`: `HomologicalComplex.extend`, `ComplexShape.embeddingUpNat`, `ChainComplex.linearYonedaObj`, `SSet.Subcomplex.pair`, `SSetPair.homMk`, `SSet.Homotopy.chainComplexMap`, `TopCat.Homotopy.toSSet`, `TopCat.Homotopy.singularChainComplexFunctorObjMap`, `curveIntegral`, `modelWithCornersEuclideanQuadrant`, `Measure.IsAddHaarMeasure`, `Metric.infDist` and `ContinuousMap.HomotopyRel`.
- Every other name in the *From Tau Ceti* contract was located at its declaration line in the pinned sources. This covers the 107 backticked names under `TauCeti.`, `TopCat.`, `TopPair.`, `SSetPair.`, `CochainComplex.mappingCocone.` and `StarConvex.`, each found either at a declaration line or by `#check`.

**Cross-roadmap citations resolved.**

- On main:
  - DifferentialGeometry 8.3, 8.4 and 8.5 (`README.md:836, 845, 852`; 8.3 is over any model with corners), 9.3 (:872, duality only), layers 10 and 11.
  - AlgebraicTopology Stage 6.3 (`README.md:1180`; summary at :76–89, which names DG9.3 as owner of the integration comparison while DG9.3 plans duality only, as the README says).
  - GeometricTopology §1.1 (`README.md:788`; smooth collars, uniqueness, and the interior homotopy equivalence via Lee 9.26).
  - HeegaardFloer §2.1 F0.S (`README.md:20, 71`).
  - ComplexKahlerGeometry K5a (`README.md:570`, punctured plane at :939) and K6.1 (:1274).
- Open heads:
  - TangentialBordism §2.1 at f212a45 (`README.md:457`). Hausdorff standing hypothesis; parametric theorem with `TauCeti.IsNullSet`; relative theorem for compact targets and, for compact sources, for non-compact second-countable targets. This matches `README.md:84–108` here. This roadmap is on main and earlier, so TangentialBordism is the one that cites.
  - DifferentialGeometry at 473c4df: 8.3–8.5 kept, with R04 as the exception. ComplexKahlerGeometry at a6ec295: see R01. AlgebraicTopology at its head (971f80a, `README.md:99–103`) plans parametric transversality in 8.13 for embedded submanifolds and compact targets, which is a different statement from §5.2–5.3.

**Ownership and duplication.**

- I ran `roadmaps grep` over main and the 458 open heads for:
  - `IsPrimitiveOn` and `PrimitiveSpace` (only this roadmap; MorseNovikov uses Tau Ceti's API for another purpose);
  - "strictly inward" and "inward domination" (only here; DifferentialGeometry's revision defers to this roadmap; RicciFlow and IntegrableSystems mean different notions);
  - "relative de Rham" (algebraic relative de Rham in the p-adic roadmaps, which is a different object; for ComplexKahlerGeometry see R01);
  - `incidenceEquation`, `relativeTranslate`, `IsTransverseAt` and `smoothPairIn` (only here).
- No Lean `def` of a transversality predicate on manifolds exists in any roadmap, Mathlib or Tau Ceti at the pins; the only roadmap one is SchemeAndStackFoundations' `SNCData.IsTransverse`, a different object. `IsTransverseAt` is owned here.
- The overlap report lists no dropped ids. No fully qualified name in `Suggested.lean` occurs in another roadmap.

**Sources (seeded sample).**

- `hatcher` line 2676: Prop. 1.30, homotopy lifting, p. 60. `hatcher` line 2723: Prop. 1.33, the lifting criterion, which assumes a path-connected and locally path-connected source, p. 61. `hatcher` line 2758: Prop. 1.34, uniqueness of lifts, connected source, p. 62.
- These support §1.2 and §1.3 as written.
- The other sampled targets carry no external locator (2.1, 2.3, 2.5, 3.2 and 4.2 are attributed to this roadmap), or cite Lee or Bott–Tu (see Not verifiable).

**Adversarial pass.** One row per statement; values are computed on each side.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 "has local primitives" (`IsPrimitiveOn`) | `dx`; `x dy`; wrong model without openness | `d Re = dx` ✓; for `x dy`, `∂y∂x g = 0` but `∂x∂y g = 1`, so no primitive; with `U = {x}` every form would qualify, but the pinned `isOpen` field (`LocalPrimitive.lean:71`) excludes it | holds | none |
| §1.1 Check `:416–419` | `d(x² sin(1/x))`, `x dy` | the first is discontinuous at `0` (`0` vs `−1` at `1/(2πn)`) yet has a primitive; `x dy` is continuous with none | wording false | R02 |
| §1.2 monodromy integral | angular form; `dx` with split primitives; `d(|x|^{3/2})` | loop `2π`, twice `4π`, reversed `−2π` (a norm model gives `+2π`); `(1−0)+((3+7)−(1+7)) = 3`; `[0,1]` gives `1`, `[−1,1]` gives `1−1 = 0`; `pathClassIntegral = 0` (`Period.lean:95`) | holds | none |
| §1.3 `exists_isPrimitiveOn_univ_of_simplyConnectedSpace` | ℝ² with `d(|x|^{3/2})`; slit plane; `ℂ∖{0}`; a point; context | global `|x|^{3/2}`; `arg`; no global primitive since the loop gives `2π ≠ 0`, and `ℂ∖{0}` is not simply connected; `g` constant; needs exactly `IsManifold I 1`, `SimplyConnectedSpace`, and the Tau Ceti local path-connectedness | holds | none |
| §2.1 strict inward cone | `[0,∞)` at `0`; quadrant; anchor bullet | `v = 1`: `ball(t, εt) ⊆ [0,∞)` for `ε < 1`; `v = 0, −1` fail, while the closed tangent cone admits `0`; `(1,0)`: `(t, −εt/2) ∉ Q`; `ball(y+q−x, ε₀) ⊆ C`, so convexity gives `ball(y+t(q−x), tε₀) ⊆ C` | holds | none |
| §2.2 `exists_smooth_inward_deformation` | `[0,∞)`; `[0,1]`; boundaryless; empty | `Φ(0,x) = x+1`, `Φ(1,x) = x`, `Φ(2,x) = x+1 > 0`; `r(0) = ½−½e⁻¹ ≈ 0.316` and `r(1) ≈ 0.684`; the field `x(1−x)` gives `r(0) = 0`, and it is not strictly inward; `r = id`; vacuous | holds | none |
| §2.2 quadrant Check | `ψ(s,p) = p + s(1,1)` | inverse `(x−m, y−m, m)`; `∂x m` is `1` for `x<y` and `0` for `x>y`; `(0,t) = (a+s, s)` forces `a = −t < 0` | holds | none |
| §2.3 transfer lemma | `j = r = id`; `[0,∞)`; `S¹` with a point | gives `s`; `[0] ↦ [1]`, and `∂(t↦t) = [1]−[0]`; `j_*sr_* = 0` on `H₁ ≅ ℝ` while the inclusion is an isomorphism; both identities go `~ (j∘r)_* ~ id` | holds | none |
| §2.4 `quasiIso_smoothPairToSingular` | `W = ∅`; `W = X`; `(ℝ, ℝ∖0)`; non-open `W` | absolute comparison; `0 → 0`; `H₁ = ℝ` via `t ↦ 2t−1` and `H₀ = 0`; the nowhere-differentiable graph gives smooth relative `H₁` = reduced `H₀` of a discrete set against singular `0`, and the Lean carries `IsOpen W` | holds | none |
| §2.5 relative approximation | retractions; disc trace; octant | `r(2) = 1`, `r(−1) = 0`, `r(0.3) = 0.3`, `r((3,4)) = (0.6, 0.8)`; `|sin θ|` is not differentiable at `0`; `Q(t,t,t) = 3t²−6t² = −3t²` | holds | none |
| §3.1 sign of `δ` | `(ℝ, ℝ∖0)`, `c = [−1,1]` | `(0,b)` integrates to `0−(1−0) = −1`, so `δ[b]` gives `+1`, the same as singular `b(∂c) = 1`; the opposite convention gives `−1`; Mathlib coordinates give `(dα, −α|_W − dg)` | holds | none |
| §3.2 cocone and relative integration | kernel maps for `t = 0, 1`; `ψ dx`; lift sign | `((1,0),0)` maps to `(0,0)` and to `(0,1)`, both inverse on `H⁰`; `1 − 1 = 0 = d(Ψ,0)`; `(b̃∘∂,0) + (0,b) = d(b̃,0)` | holds | none |
| §3.3 relative isomorphism | `(ℝ, ℝ∖0)`; `(ℝ², ℝ²∖0)`; compact-support clause | `H¹ = ℝ`, with `δ[b]` giving `1`; `−(0 − ∮dθ) = 2π`, and `H¹ = H̃⁰(ℝ²∖0) = 0`; the clause names no object | clause vague | R03 |
| §4.1 integration comparison | `S¹`; two points; `ℤ` discrete; `ℝ` with `ψ dx` | `2π` on both sides, `−2π` reversed; `f(a)−f(b)` vs `f(a)+f(b)`; `1+2 = 3`, and `[Fintype ℤ]` is unavailable; `∫_{−2}^{2} ψ = 1` via `t↦4t−2` and also via `t↦8t−4`; `t↦2t−1` is no relative cycle; `deRhamHom[η] = 0` | holds | none |
| §4.2 boundary formula | `D¹`; `[0,1]` with `(dx, x)` | `0 − (c₊ − c₋)`; `1 − (1−0) = 0`, and `(dx, x) = d(x,0)` | holds | none |
| §5.1 definitions | `((1,2),3)`; `x²+p` for `p = −1, 0, 1`; `j = id`; universal | `1+3−2 = 2` (a sign-flipped model gives `−2`); `±2`, `0` and vacuous; `2xu − v` is onto; `(u,q) ↦ 2xu+q` is onto at `(0,0)`, while `x²` gives `0` | holds | none |
| §5.2 `addHaar_setOf_not_isRegularIncidenceParameter` | `x²+p`; `x²`; `V = 0`; `P = 0`; local form on `(1,2)×ℝ` | bad set `{0}`, null; hypothesis fails at `(0,p)`; bad set `∅`; for `P = 0` universal transversality is slice transversality, so the bad set is `∅` and the Dirac Haar mass is not charged; zeros `√(−p)` with derivative in `(2,4)`, so `∅` | holds | none |
| §5.3 flat `exists_isRegularIncidenceParameter_relativeTranslate` | `f=0, β=x², p=1`; `β≡0`; `f=β=x²` | value `4` at `2` and `0` at `0` (the model `f+p` gives `1` at `0`); regular iff `f` is transverse, and `p=0` works; `x²(1+p)` has derivative `0` at `0` for every `p`, and `hgood` fails | holds | none |
| `IsTransverseAt` | `g=1, j=0`; `g=0, j=id`; `g=x²`; `p = −1, 0` | vacuously true (a "`Dg` onto" model rejects it); `(u,v) ↦ −v` is onto; not onto at `0`, vacuous elsewhere; `±2`, then fails at `0` | holds | none |
| §5.3 manifold `addHaar_setOf_not_forall_isTransverseAt_relativeTranslate` | `ℝ` with `x²`; line with two origins; discrete `ℝ` as `N`; zeros of `β` | bad set `{0}` in both of the first two; translate `p = j(p)` with `0 → ℝ` not onto, so the bad set is `ℝ` of measure `∞`, and the Lean carries `SecondCountableTopology N`; `mfderiv β = 0` at a minimum, so every `p` is good there | holds | none |
| §5.3 compact sources with corners | estimate | `‖g−f‖ ≤ ‖p‖ + ‖g₀−f‖ < ε/2 + ε/2`, with `β ≤ 1` | holds | none |
| Statements that must not enter (face data) | Hessian | `[[2,−2,−2],[−2,2,−2],[−2,−2,2]]`, entries summing to `−6`, giving `½(−6)t² = −3t²` | holds | none |
| Ownership of §§2.4, 3.1–3.3, 4.1 | this head vs ComplexKahlerGeometry a6ec295 | "single owner, this roadmap" (:116) vs "K6.1.RelativeIntegration owns" (:1979) | conflict | R01 |
| DifferentialGeometry 8.4 name | main vs 473c4df | `SmoothSimplex.integral_mextDeriv` at main :848; absent at :2103 | dropped | R04 |

## Not verifiable

- [Lee] *Introduction to Smooth Manifolds*, 2nd ed. The manifest settles it as uncertified (paywalled), so it is cited by locator only and was not read. The affected locators are:
  - Prop. 2.28 (§2.2);
  - Thms. 9.24–9.26, pp. 222–223 (§2.2);
  - Thm. 6.35 (§§5.2–5.3);
  - Thm. 6.36 (§5.3). The gloss "its cutoff argument extending Thm. 6.36" could not be compared with the text;
  - Ch. 11, *Conservative Covector Fields* (§§1.2–1.3);
  - Thms. 18.7 and 18.14 (§§2.4, 3.3).
- [Bott–Tu] *Differential Forms in Algebraic Topology*: Ch. I, §5 (§4.1) and §6 (§3.1). The manifest settles it as uncertified, so it was not read. ComplexKahlerGeometry's revision cites the same complex at §6, p. 78.

## Source issues

- none
