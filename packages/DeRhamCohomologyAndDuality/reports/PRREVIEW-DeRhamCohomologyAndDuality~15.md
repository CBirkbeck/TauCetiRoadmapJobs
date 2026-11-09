# Review of DeRhamCohomologyAndDuality (pull request #2085 at 41e3a4c)

**Verdict:** needs changes

## R01 (P2) — §4.2 states the boundary formula without the Hausdorff hypothesis that its objects and route need

**Location.** `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:943–944`: "For compact oriented `M` over `𝓡∂ m`, `m > 0`, let `U` be the image of a topological collar `∂M × [0, 1) → M` (Tau Ceti's Brown collar)".

**Claim.** This roadmap takes no standing Hausdorff assumption:

- Conventions (`README.md:137–139`) write `[T2Space M]` "exactly where used".
- §5.3 says "not necessarily Hausdorff" where the property is not needed.

§4.2 omits the hypothesis, yet every object in its formula and every step of its route requires it:

- Brown's collar theorem at the pin is `TauCeti.IsLocallyCollared.isCollared [CompactSpace N] [T2Space M]` (`TauCeti/Geometry/Manifold/Boundary/Collar/Brown.lean:459`).
- Stokes, `TauCeti.integralTopForm_mextDeriv`, sits under `[T2Space M] [SigmaCompactSpace M]` (`TauCeti/Geometry/Manifold/DifferentialForm/Integration/Stokes.lean:29, :37`).
- AlgebraicTopology 6.3 builds the relative class `[M, ∂M]` for "Hausdorff and second-countable M" (`TauCetiRoadmap/AlgebraicTopology/README.md:1360–1362` on main).
- §3.3 is stated for Layer 2's Hausdorff `X`, and §4.1 for Hausdorff `N`.

Without the hypothesis, the class `[M, U]_ℝ` in the formula need not exist.

**Witness.** Take the compact interval with a doubled origin, `[−1, 1] ∪ {0′}`, over `𝓡∂ 1`, oriented by the coordinate.

- Mayer–Vietoris gives `H₁(M) = ℝ`, and the pair sequence gives `H₁(M, ∂M; ℝ) ≅ ℝ²`, spanned by the arcs `c` through `0` and `c′` through `0′`.
- The class `a·c + b·c′` has local image `a` at `0`, `b` at `0′` and `a + b` at every other interior point.
- So no class has the generator as its local image everywhere, and `[M, U]_ℝ` does not exist.

**Repair.** Write "For compact Hausdorff oriented `M` over `𝓡∂ m`, `m > 0`". Second countability then follows from compactness, so this is exactly AlgebraicTopology 6.3's hypothesis.

Tested on both sides:

- The witness is excluded.
- The two Checks still hold: on `D¹` the pairing is `0 − (c₊ − c₋)`, and on `[0, 1]` it is `1 − (1 − 0) = 0`.

## R02 (P3) — The transfer lemma of §2.3 is made to depend on §2.2, and it is offered as a route to DifferentialGeometry 8.3, which supplies this roadmap

**Location.**

- `README.md:626`: "*Needs:* §2.2; Tau Ceti `TauCeti.smoothSingularSubcomplex`, …".
- `README.md:368`: "the transfer lemma (§2.3) consumes §2.2".
- `README.md:125–127`: "the transfer lemma of §2.3 applied to inward domination (§2.2) is a route to the statement that does not use it. The choice of route is DifferentialGeometry's."

**Claim.**

- The lemma is stated for any smooth `j`, `r` and `Φ`, and a given homotopy inverse `s`. Its proof uses pushforward naturality and the singular and smooth prism homotopies of `Φ`.
  - Neither the statement nor the proof uses inward domination.
  - §2.2 supplies one instance (`N = I.interior M`), and nothing here consumes that instance: §2.4 imports DifferentialGeometry 8.3 directly (`README.md:653–657`).
  - So the *Needs:* line blocks the lemma behind the whole semiflow construction.
- DifferentialGeometry supplies this roadmap: 8.3–8.5 feed §§2.4, 3.2 and 3.3. Its 8.3 cannot take a route through §§2.2–2.3 without a supply cycle.
  - DifferentialGeometry's open revision proves 8.3 over corners by its own route.
  - That revision lists §§2.1–2.2 among the results that are "neither a target nor an input here".

**Witness.** DifferentialGeometry at dabafb8:

- `TauCetiRoadmap/DifferentialGeometry/README.md:2145–2148`: "Over a model with corners that inductive step is unavailable … and the route is through 7.4".
- The same file, `:72–76`: "neither a target nor an input here … inward domination … are DeRhamCohomologyAndDuality's".

**Repair.**

- In §2.3, change the *Needs:* line to: "*Needs:* Tau Ceti `TauCeti.smoothSingularSubcomplex`, `TauCeti.smoothSingularSubcomplexMap`; Mathlib `TopCat.Homotopy.singularChainComplexFunctorObjMap`, `TopCat.Homotopy.toSSet`, `SSet.Homotopy.chainComplexMap`". Keep "Inward domination (§2.2) supplies such a triple" as prose.
- In *How to read the build*, write: "the transfer lemma (§2.3) consumes Tau Ceti's smooth singular simplices, and §2.2 supplies its instance `N = I.interior M`".
- Replace the last two sentences at `README.md:125–127` with: "§§2.4 and 3.3 import 8.3 as stated, whatever its route; DifferentialGeometry supplies this roadmap and does not consume §§2.2–2.3."

Tested: the three Checks of §2.3 use none of §2.2's theorems.

- The identity triple needs nothing from §2.2.
- The `[0, ∞)` triple `r(x) = x + 1`, `Φ(t, x) = x + (1 − t)²` is written out explicitly.
- The `S¹` negative control has a constant `r`.

## R03 (P3) — The title and description contradict the head, and they do not record the opposite ownership claim of ComplexKahlerGeometry's open revision

**Location.**

- The title reads "ComplexKahlerGeometry K6.1 is a supplier, not a consumer".
- The description reads "the README no longer names K6.1 as a consumer and cites ComplexKahlerGeometry only as a supplier".
- Against these, `README.md:1217` reads "ComplexKahlerGeometry K6.1 (analytic cycles) consumes the boundaryless instances of §§2.4, 3.1–3.3 and 4.1". `README.md:114–116` makes this roadmap the "single owner".

**Claim.**

- The README's position is the one main already has: this roadmap's `README.md:72, :695` on main, and ComplexKahlerGeometry's K6.1 on main, which consumes these statements under DifferentialGeometry labels (`TauCetiRoadmap/ComplexKahlerGeometry/README.md:1382, :1396`). The description says the reverse.
- ComplexKahlerGeometry's open revision claims the boundaryless statements for itself and makes this roadmap their consumer. If both pull requests merge as they stand, each roadmap hands §§2.4, 3.1–3.3 and 4.1 to the other.
- The roadmap on main keeps the object, so this README needs no change. The record of the order belongs in the description.
- This finding was raised before and is not repaired at this head.

**Witness.** ComplexKahlerGeometry at a6ec295, `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1979–1981`: "K6.1.RelativeIntegration owns these boundaryless open-pair statements; DeRhamCohomologyAndDuality §§2.4, 3.1–3.3 and 4.1, which extend them to models with corners, consume these instances."

**Repair.** Nothing in the folder changes. Rewrite the title and description to describe this head. They should list:

- K6.1 stays a consumer.
- Layer 1 is rebuilt on `TauCeti.IsPrimitiveOn` and `TauCeti.PrimitiveSpace` for forms with local primitives on `C¹` manifolds.
- §2.4 is now stated in `Suggested.lean`.
- §2.5 takes a real normed target.
- §5.2 has a local form.
- `IsTransverseAt` and the Haar-null theorem on boundaryless second-countable manifold sources are new.
- The comparison with TangentialBordism §2.1 is added.

In the merge-order paragraph, state that ComplexKahlerGeometry's revision, when rebased, cites §§2.4, 3.1–3.3 and 4.1 here instead of owning their boundaryless instances.

## Verified sound

**Scope of the review.** I reviewed the whole folder at 41e3a4c (README.md 1248 lines, Suggested.lean 229 lines, metadata.toml). Nothing outside the folder changes: `git diff --stat origin/main...HEAD` outside the folder is empty. The roadmap is on main, so its suppliers may only be Mathlib, Tau Ceti and roadmaps on main. Its suppliers are Mathlib, Tau Ceti, DifferentialGeometry and AlgebraicTopology, all on main. TangentialBordism, which is not on main, is cited only as adjacent.

**Gate and dependency check.**

- The gate, re-run at this head: every count is 0 and it reports `OK`; the worker's run has `build=0`.
- The dependency check (`--movable`) reports `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.

**Lean.**

- `lake env lean` on `Suggested.lean` exits 0 with six `declaration uses 'sorry'` warnings, at lines 62, 82, 121, 157, 171 and 216.
- I ran `#check @` on all 13 declarations in one scratch file. All 13 elaborated types are identical to the worker's listing and match the README statements: generality, `[T2Space]`, `[SigmaCompactSpace]`, `[FiniteDimensional]`, `X : Type`, `IsOpen W`, Haar measure binders, and no `T2Space` on the manifold Haar-null theorem.
- The flagged `incidenceEquation`, which keeps only `[NormedAddCommGroup V]`, is a plain function with a real body, and its consumers carry every instance, so no hypothesis is lost.
- The one-tactic probe (`first | simp | rfl | infer_instance | trivial | aesop`) fails on all six theorems, so none is padding.
- There is no `set_option`, no sorry'd data, and no `lemma`. The imports are `Mathlib` and four Tau Ceti modules, each used.

**Headline theorems** (Summary, `README.md:18–21`).

- Stated in Lean: 1.3 `exists_isPrimitiveOn_univ_of_simplyConnectedSpace`, 2.2 `exists_smooth_inward_deformation`, 2.4 `quasiIso_smoothPairToSingular`, and three for 5.2–5.3 (`addHaar_setOf_not_isRegularIncidenceParameter`, `exists_isRegularIncidenceParameter_relativeTranslate`, `addHaar_setOf_not_forall_isTransverseAt_relativeTranslate`).
- Named in the docstring as not statable: 3.3, 4.1 and 4.2. The reasons hold at the pin:
  - `TauCeti/Geometry/Manifold/SmoothSingular/Integral.lean` has `SmoothSimplex.integral` (`:86`) and no Stokes for simplices or cochain map.
  - `TauCeti.localOrientationOfManifoldOrientation` takes only orientations over `𝓘(ℝ, E)` with `InnerProductSpace ℝ E` and `Fin (n + 1)`.

**Seeded sample, against the source.** Hatcher, read in the cached author's edition:

- Prop. 1.30 (homotopy lifting) is at hatcher line 2676, p. 60.
- Prop. 1.33 (lifting criterion: `Y` path-connected and locally path-connected) is at hatcher line 2723, p. 61.
- Prop. 1.34 (unique lifting, `Y` connected) is at hatcher line 2758, p. 62.
- These support §1.2's homotopy-invariance and lift-independence steps and §1.3's lift of the identity, for a simply connected, hence path-connected, locally path-connected `M`.

**Library declarations opened at the pins.** Of 154 `#check` lines in one scratch file, 122 elaborated. The other 32 are in Tau Ceti modules without object files, and each was located in source. Those read in source, with file and line:

- `IsPrimitiveOn` (`LocalPrimitive.lean:70`, with an `isOpen` field, so the Lean hypothesis of §1.3 asks for open `U`).
- `PrimitiveSpace` (`:169`, defined with no extra hypotheses, topology generated by graphs of primitives); `isCoveringMap_proj` (`:280`, under `[FiniteDimensional ℝ E] [T2Space M] [IsManifold I ∞ M] [CompleteSpace F]`, `:262`).
- `exists_mextDeriv_eq_of_simplyConnectedSpace` (`DeRham/SimplyConnected.lean:69`, same route as §1.3).
- `pathClassIntegral` (`DeRham/Period.lean:90`, junk `0` unless the form is closed and `C¹`, which pins the §1.2 Check); `_mk_eq_sub` `:104`, `value_monodromy` `:121`, `_trans` `:148`, `_symm` `:162`, `_mk_eq_pathIntegral` `:197`, `periodHom` `:313`, `_mpullback` `:351`, `mem_exactForms_one_iff_periodHom_eq_zero` `:405`.
- `ModelWithCorners.locallyPathConnectedSpace` (`Geometry/Manifold/Topology.lean:36`).
- `relativeCoordinates` and its lemmas (`MappingCocone/Relative.lean:54, 76, 103, 113, 136`): the differential is `(a, b) ↦ (da, f a − db)`, as §3.1 says, and the Mathlib-coordinate form `(dα, −α|_W − dg)` recomputes.
- `IsRegularParameter` (`Analysis/Fredholm/LevelSet/GlobalParametric.lean:63`: surjectivity of `fderiv f (x, l) ∘ inl` at every solution, no completeness).
- `smallSingularSubcomplex` (`AlgebraicTopology/Singular/Subdivision/Small/Chains.lean:60`: image in some member).
- `singularCochainComplex` (`AlgebraicTopology/Cohomology/Basic.lean:94`, via Mathlib's `ChainComplex.linearYonedaObj`, `CategoryTheory/Abelian/Ext.lean:56`, which is precomposition with no sign, so `(δb)(c) = b(∂c)`); `singularCohomologyδ` (`Cohomology/Relative.lean:273`).
- `exists_contMDiffMap_isProperMap_nonneg` (`Geometry/Manifold/Exhaustion.lean:71`, `T2Space` at `:41`, any model).
- `IsCollar` (`Collar/Global.lean:46`); `IsLocallyCollared.isCollared` (`Collar/Brown.lean:459`).
- `integralTopForm_mextDeriv` (`Integration/Stokes.lean:37`); `integralTopForm_mextDeriv_eq_zero` (`BoundarylessStokes.lean:122`).
- `integralTopForm_mpullback_subtypeVal` (`Integration/OpenSubset.lean:71`); `integralTopForm_mpullback_of_isOrientationPreservingAt` (`ChangeOfVariables.lean:228`).
- `integralTopForm_ofFunction_zeroDim` (`ZeroDim.lean:34`, sign `signBasis (o.orientationAt x) b`, the same notion as AlgebraicTopology 6.3's `orientationSignAt`) and `_finite_zeroDim` `:67`.
- `IsSmoothForm.integrableTopForm` (`Integration/Regularity.lean:42`, compact `tsupport`, any regularity); `integralTopForm_add` `:105`; `integralTopForm_sum` (`TopForm.lean:656`).
- `IsOrientationPreservingAt` (`Orientation/Preserving.lean:63`, namespace `TauCeti.Manifold.Orientation`); `boundaryOrientation` (`Boundary/InducedOrientation.lean:108`).
- `deRhamCohomology.map_eq_of_homotopy` (`DeRham/HomotopyInvariance.lean:105`); `compactlySupportedDeRhamComplex.extendByZero` (`DeRham/ExtendByZero.lean:201–205`); `pathIntegral` (`Integration/Path.lean:74`).

Elaborated, with the hypotheses the README states:

- `contMDiffOn_flowOf` (`T2Space`, `BoundarylessManifold`, finite-dimensional).
- `addHaar_image_criticalPoints_eq_zero` (threshold `finrank² + 1`).
- `fundamentalClassOn` and `realFundamentalClass` (`T2Space`, `ChartedSpace E M`, `CompactSpace` for the latter).
- `exists_contMDiffMap_one_nhds_of_subset_interior` (`[NormalSpace M]`).
- `exists_contMDiff_zero_iff_one_iff_of_isClosed` (`x ∈ s ↔ f x = 0`).
- `Continuous.exists_contMDiff_approx_and_eqOn` (target any real normed space).
- `IsOpen.exists_contDiff_support_eq` (range in `[0, 1]`).
- `SSetPair.quasiIso_chainComplexMap` (instances on both members).
- `CochainComplex.mappingCocone.quasiIso_lift_of_shortExact`.

Mathlib, read in source:

- `IsCoveringMap.existsUnique_continuousMap_lifts` (`Topology/Homotopy/Lifting.lean:489`, simply connected and locally path-connected source).
- `liftPath_apply_one_eq_of_homotopicRel` (`:379`).
- `Complex.IsExactOn` (`Analysis/Complex/HasPrimitives.lean:117`, a global `g` with `HasDerivAt` on `U`), `IsExactOn.differentiableOn` (`:139`), `IsConservativeOn.isExactOn_ball` (`:276`).
- `homologySequenceδ_triangleh` (`Algebra/Homology/HomotopyCategory/ShortExact.lean:85`).
- The cited file paths `SmoothApprox.lean`, `PartitionOfUnity.lean`, `SSetPair.lean`, `Homology/Relative.lean` and `TopCat/ToSSet.lean` all exist at the pin.

**Cross-roadmap citations resolved.** On main:

- DifferentialGeometry 8.3 (any model with corners, under `T2`, `σ`-compact and finite-dimensional; its sketch names relative Whitney approximation), 8.4 (`chainIntegral`, Stokes for simplices, `deRhamHom`), 8.5 (`deRhamEquiv`), and 9.3 (duality only).
- AlgebraicTopology Stage 6.3 (`README.md:1180–1460`): the tangent-to-homological orientation comparison, the oriented integral relative class "through the orientation-induced trivialization", and DG9.3 named as consumer and comparison owner.
- GeometricTopology §1.1 (`README.md:788–821`: collars, and the homotopy equivalence of the interior with `M`, Lee 9.26).
- HeegaardFloer §2.1 (F0.S, sharp finite-order Sard).
- ComplexKahlerGeometry K5a (the punctured-plane computation at `README.md:939`, inside K5a, `:570–1167`) and K6.1 (`:1274ff`).

At open heads:

- TangentialBordism at 4e86746, §2.1 (`README.md:480`ff): Hausdorff standing hypothesis, `TauCeti.IsNullSet`, the parametric theorem with parameter manifolds and non-compact targets, and relative smoothing into compact targets. This matches `README.md:84–108`.
- DifferentialGeometry at dabafb8 (`:72–76`, `:194`): §§2.1–2.2 are this roadmap's, and nothing there consumes them.
- AlgebraicTopology's revisions (`README.md:96`, `:2275`, `:2474` of one of them): §4.1 consumes AlgebraicTopology 6.3's classes and the dimension-zero sign. This is consistent with §4.1, which builds no class.
- ComplexKahlerGeometry at a6ec295: see R03.

**Overlaps and duplication.**

- The overlap file lists no dropped id, no other pull request changing this roadmap, and no id defined only by an open revision.
- No roadmap on main cites this roadmap, so dropping main's `HasLocalPotentials` and `exists_hasFDerivAt_of_simplyConnected` breaks nothing.
- No `Suggested.lean` name collides with a declaration in a roadmap I can read.
- Layer 1 generalizes Tau Ceti's `PrimitiveSpace`, `pathClassIntegral` and `exists_mextDeriv_eq_of_simplyConnectedSpace` and cites them.
- §5.2–5.3 against TangentialBordism §2.1 is recorded as an instance comparison: the slice is transverse to the diagonal iff `D_xF u − Dj v` is onto, and that roadmap is not on main.
- Ownership against open pull requests was checked with `roadmaps grep` over the 458 open heads: no second owner apart from R03.

**Adversarial pass.** 34 rows, with the values computed on each side.

| # | Statement | Instance | Values computed | Result |
|---|---|---|---|---|
| 1 | §1.1 predicate | `dx`; `x dy` on `ℂ` | `d(Re) = dx`; `x dy` would need `∂ᵧ∂ₓg = 0` and `∂ₓ∂ᵧg = 1` | holds; discriminates |
| 2 | §1.1 continuity bullet | `d(x² sin(1/x))`; `x dy` | form is `0` at `0` and `−1` at `1/(2πn)`, with a primitive; `x dy` is continuous with no primitive | "neither necessary nor sufficient" holds |
| 3 | §1.2 choice of primitives | `dx`, `0 → 3` split at `1`, primitives `Re`, `Re + 7` | `(1 − 0) + ((3 + 7) − (1 + 7)) = 3` | holds |
| 4 | §1.2 angular form | circle, twice, reversed | `2π`, `4π`, `−2π`; a norm integral gives `2π` on the reversal | holds |
| 5 | §1.2 vs `pathClassIntegral` | `d(\|x\|^(3/2))`, `(0,0) → (1,0)` | ours `1`; Tau Ceti gives `0` (the `dite` at `Period.lean:90`, the form not `C¹`); on `(−1,0) → (1,0)`: `1 − 1 = 0` | holds |
| 6 | §1.3 Lean headline | `S¹`, `dθ`; slit plane; one point | loop `2π ≠ 0` (hypothesis necessary); `arg`; `φ = 0`, `g` constant | holds |
| 7 | §1.3 holomorphic Check | `1/z` | slit plane: principal `log`; `ℂ ∖ {0}`: `∮dz/z = 2πi` | holds |
| 8 | §2.1 cone | `[0, ∞)` at `0`, `v = 1`, `0`, `−1` | `ball(t, εt) ⊆ C` iff `ε ≤ 1`; `ball(0, εt) ∋ −εt/2` | cone `(0, ∞)`, holds |
| 9 | §2.1 local field | `‖y − x‖ < ε₀`, `ball(q, 2ε₀) ⊆ C` | `z = (1 − t)y + t(q + (y − x) + w/t)` with `‖(y − x) + w/t‖ < 2ε₀` | convexity gives `z ∈ C`; holds |
| 10 | §2.2 Lean headline | `[0, ∞)`; `[0, 1]` with `1/2 − x`; `x(1 − x)` | `Φ(0,x) = x + 1`, `Φ(1,x) = x`; `r(0) = 0.316`, `r(1) = 0.684`; `r(0) = 0` | holds; negative control fails as stated |
| 11 | §2.2 quadrant | `ψ(s, p) = p + s(1, 1)` | inverse `((x − m, y − m), m)`; `∂ₓm` is `1` and `0` on the two sides of the diagonal; `(0, t) = (a + s, s)` forces `a = −t` | holds |
| 12 | §2.3 transfer | general triple | `i j_* s r_* = j_* i s r_* ~ j_* r_* ~ id`; `j_* s r_* i = j_* s i r_* ~ id` | holds with no `r ∘ j ~ id`; §2.2 unused (R02) |
| 13 | §2.3 negative control | `M = S¹`, `N` a point | `H₁`: `0` against `ℝ` | holds |
| 14 | §2.4 Lean headline | `(ℝ, ℝ ∖ {0})`; `W = ∅`; `W = X` | `H₁ = ker(ℝ² → ℝ) = ℝ`, `H₀ = 0` on both sides; absolute; `0` | holds |
| 15 | §2.4 openness | `W` the graph of a nowhere-differentiable `h` | smooth simplices in `W` are constant; smooth `H₁(X, W)` is the reduced `H₀` of discrete `W` (uncountable dimension), singular `H₁(X, W) = 0` | `IsOpen W` is necessary; holds |
| 16 | §2.5 retractions | interval and disc | `r(2) = 1`, `r(−1) = 0`, `r(0.3) = 0.3`, `r(3, 4) = (0.6, 0.8)` | holds |
| 17 | §2.5 target with boundary | `Q` | `Q(t, t, t) = 3t² − 6t² = −3t²`; `Q` at `x = 0` is `(y − z)²` | holds |
| 18 | §3.1 sign | `b = 1` on `(0, ∞)`, `c = [−1, 1]` | `0 − (b(1) − b(−1)) = −1`, so `δ[b] = −[(0, b)]` gives `1` = `b(∂c)`; opposite convention gives `−1` | holds |
| 19 | §3.1 coordinates | Tau Ceti `relativeCoordinates_d` | `(da, fa − db)`; with `g = −b`: `(da, −fa − dg)` | holds |
| 20 | §3.2 cocone to kernel | `K = ℝ²`, `L = ℝ` | `φ_t((k₁, k₂), 0) = (0, k₂ + t·k₁)` is a chain map for every `t`, homotopic through `h(ℓ) = (0, tℓ)` | holds at chain level |
| 21 | §3.2 evaluation | `ψ dx`, `β = Ψ\|_W` | `1 − (1 − 0) = 0`; `(α, β) = d(Ψ, 0)` | holds |
| 22 | §3.3 | `(ℝ², ℝ² ∖ 0)` | `H¹(W) = ℝ → H²(X, W)` iso; `H¹(X, W) = 0`; `δ[dθ](D) = ∫_{∂D} dθ = 2π` | holds |
| 23 | §4.1 dimension `0` | `ℤ` discrete, `K = {0, 1}` | `1 + 2 = 3` on both sides; sign `signBasis` = `orientationSignAt` | holds |
| 24 | §4.1 on `ℝ` | `t ↦ 4t − 2`, `t ↦ 8t − 4` | boundary `[2] − [−2]` outside `K`; pairing `1`, and again `1`; `deRhamHom[η] = 0` | holds |
| 25 | §4.2 Checks | `D¹`; `[0, 1]` | `−(c₊ − c₋)`; `1 − (1 − 0) = 0` | holds |
| 26 | §4.2 Hausdorff | interval with two origins | `H₁(M, ∂M; ℝ) = ℝ²`; local images `a`, `b`, `a + b` | no class exists: R01 |
| 27 | §5.1 Checks | `x + p`; `x² + p` | `4 − 2 = 2`; `p = −1`: zeros `±1`, derivatives `±2`; `p = 0`: derivative `0`; `p = 1`: no zeros; `j = id`: `2xu − v` onto | holds |
| 28 | §5.2 Lean headline | `x² + p`; `x²`; `V = 0`; `P = 0` | bad set `{0}`; universal transversality fails at `(0, p)` and every `p` is bad; bad set `∅`; `μ{0} > 0`, where `htotal` is the slice condition, so `0` is regular | holds; hypothesis necessary |
| 29 | §5.2 local form | `O = (1, 2) × ℝ`; `O = (−1, 1) × ℝ` | zeros `√(−p)` for `p ∈ (−4, −1)` with derivative in `(2, 4)`, bad set `∅`; bad set `{0}` | holds |
| 30 | §5.3 universal transversality | `β(x) > 0`; `β(x) = 0` | `q ↦ β(x)q` onto; `Dβ(x) = 0` at a minimum, derivative `Df u − Dj v` | holds |
| 31 | §5.3 flat Lean | `f = β = x²`, `j = 0`; `β = 0` | `x²(1 + p)`: zero at `0` with derivative `0` for every `p`; `p = 0` works | hypothesis on `C` necessary; holds |
| 32 | §5.3 manifold Lean | `M = ℝ` with `f = x²`, `β = 1`; line with two origins; `N = ℝ` discrete; `M = ∅` | bad set `{0}`; bad set `{0}`; every `p` bad, `μ(ℝ) = ∞`; bad set `∅` | Hausdorff not needed; second countability needed; holds |
| 33 | `IsTransverseAt` Checks | `g = 1, j = 0`; `g = 0, j = id`; `g = x², j = 0` | vacuous; `(u, v) ↦ −v` onto; zero map at `0` | holds |
| 34 | TangentialBordism comparison and `C^k` bound | diagonal of `V × V`; `‖βp‖_{C^k}` | `(D_xF u + a, Dj v + a) = (c₁, c₂)` iff `D_xF u − Dj v = c₁ − c₂`; `m ↦ m·p` is an isometry, so `‖βp‖ = ‖β‖‖p‖` | holds |

## Not verifiable

- **Lee, *Introduction to Smooth Manifolds*, 2nd ed.** It is recorded `uncertified` (paywalled) in the manifest, and I did not read it. The locators below are consistent with that edition's numbering as I know it, but none was checked against the text:
  - Prop. 2.28 (§2.2);
  - Thms. 9.24–9.26, pp. 222–223 (§2.2);
  - Thms. 6.35 and 6.36 (§§5.2–5.3);
  - Ch. 11, *Conservative Covector Fields* (§§1.2–1.3);
  - Thm. 18.7 (§2.4);
  - Thm. 18.14 (§3.3).
- **Bott–Tu, *Differential Forms in Algebraic Topology*.** It is recorded `uncertified` (paywalled), and I did not read it. Ch. I §6, relative de Rham theory (§3.1), and §5, Poincaré duality (§4.1), were not checked against the text. ComplexKahlerGeometry's revision cites the same relative complex at "§6, p. 78".

## Source issues

- none
