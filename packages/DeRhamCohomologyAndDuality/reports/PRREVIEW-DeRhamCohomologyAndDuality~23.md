# Review of DeRhamCohomologyAndDuality (pull request #2085 at f2f197b)

**Verdict:** needs changes

This is a full review of the folder at f2f197b. The previous review read the same head, and the folder has not changed since (the change set is empty). Both of its findings still hold and are carried below. Re-checking the whole roadmap this round found no new defect in the folder. The checks were: the gate, the dependency check, elaboration, the binder and padding probes, the seeded source sample, 37 adversarial rows and the cross-roadmap citations at their current heads.

## R01 (P2) — DifferentialGeometry's open revision also builds §2.3's smooth prism lemma, and only DifferentialGeometry can own it

**Location.** `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:641–643` (§2.3): "prove that this simplicial homotopy preserves smooth simplices, because the simplices of `Δ[1]` act through affine maps of the simplex into `ℝ` and `Φ` is jointly smooth on `ℝ × M`".

**Claim.** §2.3 plans to build the smooth prism lemma. The lemma says: for a jointly smooth `Φ`, the simplicial homotopy induced by `TopCat.Homotopy.toSSet` preserves `TauCeti.smoothSingularSubcomplex`. DifferentialGeometry's open revision builds the same lemma inside 8.3 and says it does not consume it. If both merge, the lemma has two owners.

The supply direction settles which owner it must be:

- DifferentialGeometry supplies this roadmap: 8.3 for §§2.4 and 3.3, 8.4–8.5 for Layers 3–4.
- So DifferentialGeometry cannot cite §2.3. That would be a cycle.
- DifferentialGeometry cannot drop the lemma either. Its route over corners needs it, because the Whitney route fails there, as this README's own `3`-simplex in `[0, ∞)` shows (`README.md:1243–1250`).
- So DifferentialGeometry 8.3 is the only owner that keeps the supply one-way.

The current state of the three places involved:

- Main §2.3 (`README.md:361–362` on main) used the smooth prism operator without owning it.
- Main DifferentialGeometry 8.3 (`README.md:836–844`) uses the Whitney route and has no prism lemma.
- Tau Ceti's `Geometry/Manifold/SmoothSingular/` (`Basic.lean`, `Integral.lean`) has no homotopy lemma for smooth simplices either.

**Witness.** DifferentialGeometry at cd5e804 (unchanged since the previous review), `TauCetiRoadmap/DifferentialGeometry/README.md:2517–2524`: "smooth singular homology is invariant under jointly smooth homotopies (the prism operator of such a homotopy preserves smooth chains) … the smooth prism operator is built here, not consumed."

**Repair.**

1. In §2.3, replace the quoted clause with "this simplicial homotopy preserves smooth simplices by DifferentialGeometry 8.3's smooth prism operator". Keep the rest of §2.3 unchanged: the two inverse identities, the independence of the inverse, the use of §2.2, and the sentence "The transfer lemma is this roadmap's".
2. Add "DifferentialGeometry 8.3 (the smooth prism operator of a jointly smooth homotopy)" to §2.3's *Needs:* line (`README.md:648–650`).
3. Extend the 8.3 bullet of *Exact supplier contracts* (`README.md:362–364`) with what is assumed: for a jointly smooth `Φ : ℝ × M → M`, `TopCat.Homotopy.toSSet` of its restriction to `[0, 1] × M` maps `TauCeti.smoothSingularSubcomplex I M` into itself. If 8.3 gives this only under its smoothing hypotheses (`[IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M] [FiniteDimensional ℝ E]`), §2.3 carries those hypotheses on `M`.
4. In *How to read the build* (`README.md:389–391`), say that the transfer lemma consumes DifferentialGeometry 8.3's smooth prism operator.
5. After `README.md:125–127` ("DifferentialGeometry supplies this roadmap and consumes none of it …"), add that 8.3 also supplies the smooth prism operator §2.3 uses.
6. The lemma exists only at the head of DifferentialGeometry's revision. Name that revision first in this pull request's merge-order paragraph. The overlap check does not list this edge, because 8.3 exists on main.

**Fallback.** If an open revision may not be a dependency of this one:

- Make the smooth-chain homotopy from `(j ∘ r)_*` to the identity a hypothesis of the transfer lemma, as the inverse `s` for `N` already is. The lemma is then pure homological algebra.
- Delete the quoted clause.
- No target here consumes §2.3 (§2.4 uses 8.3 directly; `README.md:391–392`), so nothing downstream breaks.

**Tested.** On §2.3's own Check: `M = [0, ∞)`, `N = (0, ∞)`, `r(x) = x + 1`, `Φ(t, x) = x + (1 − t)²`.

- `Φ` is jointly smooth on `ℝ × [0, ∞)`, and `M` is Hausdorff and σ-compact over a one-dimensional model, so either hypothesis set of step 3 holds.
- For smooth `σ` and an affine `|α| : Δⁿ → ℝ`, `x ↦ Φ(|α|(x), σ(x))` extends locally to a smooth map, as both READMEs say.
- The Check's values are unchanged: `[0] ↦ [1]`; a smooth `0`-chain of total coefficient `1`; homologous to `[0]` through `t ↦ t` with `∂ = [1] − [0]`.
- After the repair, "built here" for the smooth prism operator appears in one README only.

## R02 (P3) — The pull-request title and description contradict the head, and the merge-order block states no order

**Location.** The pull-request text, not a file in the folder:

- the title: "ComplexKahlerGeometry K6.1 is a supplier, not a consumer";
- the description: "the README no longer names K6.1 as a consumer and cites ComplexKahlerGeometry only as a supplier";
- the merge-order block: "No open pull request must merge before this one".

**Claim.** The head says the opposite:

- `README.md:114–120` makes this roadmap the single owner of §§2.4, 3.1–3.3 and 4.1.
- `README.md:1267–1274` names K6.1 as their consumer.
- ComplexKahlerGeometry appears in no *Needs:* line and in no supplier contract. Its only mentions are as an adjacent roadmap (K5a, `:110`, `:543`) and as a consumer (`:119`, `:1267`).

ComplexKahlerGeometry's own revision also consumes this roadmap. At 2b571fb (unchanged) it has a section "From TauCetiRoadmap.DeRhamCohomologyAndDuality" (`README.md:284`) and cites §§2.4, 3.1–3.3 and 4.1 at `:93` and `:2685`. The block also omits the order that R01 needs.

**Witness.** `README.md:1267–1268`: "ComplexKahlerGeometry K6.1 (analytic cycles) consumes the boundaryless instances of §§2.4, 3.1–3.3 and 4.1".

**Repair.** No change in the folder. Rewrite the title and description to describe this head against main:

- Layer 1 is rebuilt on `TauCeti.IsPrimitiveOn` and `TauCeti.PrimitiveSpace`, for `C¹` manifolds over any model, with the headline `exists_isPrimitiveOn_univ_of_simplyConnectedSpace`.
- §2.4 is stated in `Suggested.lean` as `quasiIso_smoothPairToSingular`, and so is the manifold Haar-null theorem with `IsTransverseAt`.
- §4.1 uses AlgebraicTopology 6.3's point generator.
- §4.2 assumes Hausdorff `M`.
- K6.1 stays a consumer.

In the merge-order block, put DifferentialGeometry's revision first (R01). ComplexKahlerGeometry's revision needs no order with this one: the ids it cites exist on main under those numbers.

**Tested.** The rewritten text agrees with:

- `README.md:114–120` and `:1267–1274`;
- ComplexKahlerGeometry 2b571fb `:93` and `:284–291`;
- the main README's single-owner paragraph.

## Previous findings (review of the same head, f2f197b)

- **R01 (smooth prism operator owned twice) — not repaired.**
  - §2.3 is unchanged (`README.md:639–643`, "prove that this simplicial homotopy preserves smooth simplices").
  - DifferentialGeometry's revision is still at cd5e804 and still builds the operator (`:2517–2524`).
  - Carried as R01, with a fallback added for the case where an open revision may not be a dependency.
- **R02 (pull-request text) — not repaired.** The title, description and merge-order block are word for word what the previous review quoted. Carried as R02.

There is no repair report marking either finding as not actionable.

## Verified sound

### Gate, dependency check, Lean

**Gate.** Re-run at f2f197b with `--base origin/main`. It prints `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exits 0. The worker's run on this head also has `build=0`.

**Dependency check** (`--movable`). Output, in full: `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.

- The roadmap is at line 397 of the merge order.
- Its suppliers, DifferentialGeometry and AlgebraicTopology, are on main.
- TangentialBordism (merge-order line 14, not on main) is named only as an adjacent roadmap and is never consumed (`README.md:84–108`).

**Diff outside the folder.** Empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0. The only messages are six `declaration uses 'sorry'` warnings, at lines 63, 83, 122, 158, 172 and 217.

**Binder check.** I `#check @`-ed all 13 declarations in one scratch file and elaborated it once. Every type matches its README statement:

- §1.3: `[IsManifold I 1 M] [SimplyConnectedSpace M]`. No `T2Space`, `FiniteDimensional` or `CompleteSpace` binder.
- §2.2: `[FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]`, with `Φ : ℝ × M → M` over `𝓘(ℝ, ℝ).prod I`.
- §2.4: `X : Type`, the same four binders on `X`, and `IsOpen W`.
- §5.2: four `FiniteDimensional` binders, `BorelSpace P` and a Haar `μ`.
- §5.3 flat: three `FiniteDimensional` binders. The cutoff satisfies `0 ≤ β` and `β x = 0 ↔ x ∈ C`; `hgood` holds only on `C`.
- §5.3 manifold: `BoundarylessManifold` and `SecondCountableTopology` on both `M` and `N`, and no `T2Space`.
- The signature report's lead on `incidenceEquation` is not a defect. Its body `F (x, p) − j y` needs only `[NormedAddCommGroup V]`, and every theorem using it carries the normed-space binders. Nothing changed.

**Padding probe.** On a scratch copy, each of the six theorems got `first | rfl | (simp; done) | infer_instance | (aesop; done) | exact?`. All six fail with "`exact?` could not close the goal". Each of the seven definitions occurs in a stated headline.

**Form.**

- `import Mathlib` plus four Tau Ceti modules, each of them used: `GlobalParametric`, `LocalPrimitive`, `SmoothSingular.Basic` and `Subdivision.Small.Chains`.
- No `set_option`, no `lemma`, no `#eval` and no sorry'd data.
- One module docstring names the three headlines that cannot be stated at the pins and what each lacks.
- A process-word scan of both files finds nothing; every "lemma" hit is mathematical prose.

### Library declarations opened at the pins this round

**Tau Ceti, Layer 1.**

- `TauCeti.IsPrimitiveOn` (`Geometry/Manifold/DifferentialForm/LocalPrimitive.lean:70`) has the fields `isOpen`, `mdifferentiableOn` and `mextDeriv_eq`.
- `isOpen_setOf_eq` (`:132`) and `eventuallyEq_add_const` (`:156`) assume only `[IsManifold I 1 M]`.
- `PrimitiveSpace` (`:169`) is `M × F`, with the topology generated by graphs of primitives on open sets (`:185`). So the sheet argument of §1.2 needs local primitives and nothing else.
- `isCoveringMap_proj` (`:280`) sits under `[FiniteDimensional ℝ E] [T2Space M] [IsManifold I ∞ M] [CompleteSpace F]` (`:262`). This is exactly the generality Layer 1 removes.

**Tau Ceti, path integrals.**

- `TauCeti.pathClassIntegral` (`Geometry/Manifold/DeRham/Period.lean:90–94`) returns `0` unless `IsSmoothForm I 1 φ ∧ mextDeriv φ = 0`. This is the junk value the `d(|x|^(3/2))` Check uses.
- `TauCeti.pathIntegral` (`Integration/Path.lean:74`) is a plain interval integral of `φ` on `curveVelocity`. That is why §1.2's agreement bullet asks for continuous `φ`, complete `F` and `C¹` curves.

**Tau Ceti, Layer 5.** `TauCeti.IsRegularParameter` (`Analysis/Fredholm/LevelSet/GlobalParametric.lean:63–65`) asks that `fderiv f (x, l) ∘ inl` be onto at every solution. So the slice derivative of `IsRegularIncidenceParameter` is `(u, v) ↦ D_xF u − Dj v`.

**Sign of the singular coboundary.** `TopCat.singularCochainComplex` (`AlgebraicTopology/Cohomology/Basic.lean:94`) is Mathlib's `ChainComplex.linearYonedaObj` (`CategoryTheory/Abelian/Ext.lean:56`), which is precomposition with no sign. So `(δb)(c) = b(∂c)`, as §§3.1–3.2 assume.

**The cocone (Layer 3).**

- `CochainComplex.mappingCocone.relativeCoordinates` (`MappingCocone/Relative.lean:54`) and `relativeCoordinates_d` (`:76`) give the differential `(a, b) ↦ (da, f a − db)`.
- `quasiIso_lift_of_shortExact` (`MappingCocone/Basic.lean:221`) and `acyclic_mappingCocone_id` (`:147`) are as cited.
- Nothing at the pin compares connecting maps for the cocone. I checked `MappingCocone/{Basic,Homotopy,Relative}.lean` and also Tau Ceti's `Algebra/Homology/HomotopyCategory/ShortExact.lean`, whose `shiftMap_mappingConeCompTriangle_mor₃` (`:41`) is about cones of monomorphisms. So §3.2's comparison is correctly claimed as this roadmap's.

**Interval generator.** `AlgebraicTopology/Singular/IntervalGenerator.lean` (header) says the generator is the simplex running from `1` to `0`. This confirms §4.1's negative-control Check.

**Smooth singular simplices.** `TauCeti.smoothSingularSubcomplex` (`SmoothSingular/Basic.lean:77`) and `smoothSingularSubcomplexMap` (`:205`, for `ContMDiff I J ∞ φ`) are as cited. There is no homotopy or prism lemma in `SmoothSingular/` (R01).

**Mathlib.**

- `Continuous.exists_contMDiff_approx_and_eqOn` (`Geometry/Manifold/SmoothApprox.lean:79`, variables `:71–75`): finite-dimensional `E`, `[IsManifold I ∞ M] [SigmaCompactSpace M] [T2Space M]`, any real normed `F`, map smooth on `U ∈ 𝓝ˢ S`. This matches §2.5.
- `ChartedSpace.locallyPathConnectedSpace` is in Mathlib (`Geometry/Manifold/ChartedSpace.lean:270`). `ModelWithCorners.locallyPathConnectedSpace` is in Tau Ceti (`Geometry/Manifold/Topology.lean:36`), as the contracts say.
- `SSetPair` (`AlgebraicTopology/SimplicialSet/SSetPair.lean:27`) and `SSetPair.chainComplexMap` (`Homology/Relative.lean:207`).
- `SSet.Homotopy.chainComplexMap` (`Homology/HomotopyInvariance.lean:88`) and `TopCat.Homotopy.singularChainComplexFunctorObjMap` (`SingularHomology/HomotopyInvariance.lean:49`).
- `mappingCone.homologySequenceδ_triangleh` (`HomotopyCategory/ShortExact.lean:85`).
- `IsCoveringMap.liftPath_apply_one_eq_of_homotopicRel` (`Topology/Homotopy/Lifting.lean:379`) and `IsCoveringMap.existsUnique_continuousMap_lifts` (`:489`, simply connected and locally path-connected source).

**Tau Ceti, relative chains.** `SSetPair.quasiIso_chainComplexMap` (`AlgebraicTopology/SimplicialSet/Homology/Relative/Basic.lean:145`).

**Duplication by object.**

- Neither Tau Ceti nor Mathlib has a predicate for a map transverse to a map. The only hit is `IsTransverseAlong`, which is for vector fields (`Geometry/Manifold/VectorField/Transverse.lean:71`).
- Nothing at the pin gives an inward deformation into `I.interior M`.
- Nothing at the pin gives a relative smooth chain comparison.

### Cross-roadmap citations, resolved at their current heads

**DifferentialGeometry, on main.**

- 8.3 is at `README.md:836`, 8.4 at `:845`, 8.5 at `:852`, and 9.3 at `:872` (duality only).
- In `Suggested.lean`, `smoothing` (`:2583`), `deRhamHom` (`:2651`) and `deRhamEquiv` (`:2669`) are all stated for arbitrary `I`. So the contract "over any real model with corners" holds.
- Main 8.3 allows smooth chains to be implemented as a sub-simplicial set of `TopCat.toSSet.obj M` (`:842–844`). That is what Tau Ceti's carrier is.

**DifferentialGeometry #886 at cd5e804.**

- `:98–120` assigns this roadmap its Layers 1–5.
- `:142` names §4.1 as the owner of the fundamental-class comparison.
- `:220` names §§2.1–2.2.
- The only overlap is R01.

**AlgebraicTopology, on main.**

- Stage 6.3's generator is `v₀ = −Σ eᵢ`, `vᵢ = eᵢ` (`:1262–1264`), which in dimension 1 is the path from `−1` to `1`.
- `:78–85` names DifferentialGeometry 9.3 as the owner of the integration comparison. That is the stale assignment the Scope paragraph (`README.md:79–82`) describes.

**AlgebraicTopology #1652 at c204943.** It renames Stage to Layer with an old → new table (`:853–880`, "Stage 6 items 0–5 are §§6.0–6.5"), so "Stage 6.3" stays a valid citation. `:108–109` says this roadmap's Layer 5 consumes nothing there.

**ComplexKahlerGeometry, on main.** K5a is at `:570`, the punctured-plane computation at `:939`, and K6.1 at `:1274`. K6.1 does not cite this roadmap, as *Downstream consumers* (`README.md:1273–1274`) records.

**ComplexKahlerGeometry #1234 at 2b571fb.** It consumes §§2.4, 3.1–3.3 and 4.1 (`:93`, `:284`, `:2561`, `:2626`, `:2685`). All of these ids exist at this head.

**TangentialBordism #942 at 3324fdd** (moved since the previous review). The adjacency paragraph `README.md:84–108` still matches:

- §2.1 is at `:535` and is stated on Hausdorff manifolds (`:538`).
- The parametric theorem (`:665–687`) is against a closed embedded `Z`, with a `TauCeti.IsNullSet` of bad parameters, a boundaryless `S` and a non-compact `N`.
- Relative smoothing and relative transversality are into a compact boundaryless `P`, and from a compact source into a boundaryless Hausdorff second-countable `N` (`:688–745`).

**GeometricTopology §1.1, on main.** `:788`.

**HeegaardFloer F0.S, on main.** §2.1 (`:71`).

**Overlaps.** `roadmaps resolve` finds nothing unresolved. The overlap report lists no dropped ids, and a `roadmaps grep` of the README citations of this roadmap confirms it.

**Ownership by object.** `roadmaps grep` checks, against main and the open heads:

- "prism operator": the smooth prism appears only in #886 (R01). The GeometricTopology hits (main `:6887`, #1797) concern the prism of homotopies to smoothings.
- "inward domination|strictly inward": RicciFlow and IntegrableSystems use the words for invariant cones, a different object.
- "relative de Rham": DifferentialGeometry #886 defers it here and ComplexKahlerGeometry #1234 consumes it here. The crystalline hits are a different theory.
- "parametric transversality": TangentialBordism, and AlgebraicTopology #1652 Layer 8.13, which is against submanifolds and says Layer 5 here consumes nothing.
- "IsTransverseAt", "relativeTranslate", "incidenceEquation": only this roadmap. The SchubertGeometry and TangentialBordism hits are algebraic incidence equations.

### Sources: the seeded sample

- **Hatcher** (`hatcher`, certified), each read at its locator:
  - Prop. 1.30, homotopy lifting with a unique lifted homotopy: `hatcher` line 2676, page marker 69.
  - Prop. 1.33, the lifting criterion for a path-connected, locally path-connected source: line 2723, marker 70.
  - Prop. 1.34, two lifts agreeing at one point of a connected source agree everywhere: line 2758, marker 71.

  The definition of a covering space (line 2525) assumes no separation axiom. Together these support §1.2 (homotopy invariance, independence of the lift by uniqueness) and §1.3 (for a simply connected source the `π₁` condition holds trivially) as written, including the README's claim that no Hausdorff property is used.
- **Sample targets with no external locator:** §§1.1, 2.1, 2.3, 2.5, 3.1 (sign), 3.2, 4.2 and 5.1. Each says which part is this roadmap's own, and its route rests on the pinned declarations above.
- **Lee and Bott–Tu** are uncertified; see *Not verifiable*.
- **The README flags no unverified locator.**

### Headline theorems

From the Summary:

- **1.3, 2.2, 2.4:** stated (`Suggested.lean:63`, `:83`, `:122`).
- **5.3:** stated in flat form (`:172`) and on manifolds (`:217`).
- **5.2:** also stated (`:158`).
- **3.3, 4.1, 4.2:** named in the module docstring as not statable. Each lacks the cochain map `deRhamHom`. 4.1 also lacks the homological orientation of a tangent orientation, and 4.2 also lacks the oriented relative class.
  - At the pin, `TauCeti.SmoothSimplex.integral` exists with no Stokes lemma.
  - From a `TauCeti.Manifold.Orientation`, the pin gives only `TauCeti.localOrientationOfManifoldOrientation` at a single point.
  - A cochain-map stand-in would need sorry'd data.

No headline is forced through a stand-in, and none of the six theorems is padding.

### Adversarial table

Every value below was computed this round.

| # | Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|---|
| 1 | §1.1 has local primitives | `x dy` on a disc; `dx` | a primitive is `C^∞` with `∂ₓ∂_y g = 1`, `∂_y∂ₓ g = 0`; `g = Re` works for `dx` | `x dy` fails, `dx` passes: always-true and `φ = 0` predicates excluded |
| 2 | §1.1 regularity | `d(x² sin(1/x))` at `x = 1/(2πn)`, `1/((2n+1)π)`, `0`; `d(|x|^(3/2))` | `φ = −1`, `+1`, `0`; difference quotient of `(3/2)|x|^(1/2) sgn x` at `0` is `(3/2)h^(−1/2) → ∞` | continuity not necessary; not `C¹` yet covered |
| 3 | §1.2 covering without `T2` | sheets `graph(g + c)(U)` | fibre ∩ sheet is the single point `(y, g y + c)`; `graph(g+c) ∩ graph(g+c′) = ∅` for `c ≠ c′`; the topology is generated by these graphs (`LocalPrimitive.lean:185`) | no `T2`, finite dimension or completeness enters |
| 4 | §1.2 integral | angular form: loop, double loop, reversal | `2π`, `4π`, `−2π`; integrating the norm gives `+2π` on the reversal | holds |
| 5 | §1.2 subdivision | `dx` from `0` to `3`, split at `1`, primitives `Re` and `Re + 7` | `(1 − 0) + (10 − 8) = 3` | independent of choices |
| 6 | §1.2 agreement bullet | `d(|x|^(3/2))` from `(0,0)` to `(1,0)` | ours `1`; `pathClassIntegral` takes its else-branch `0` (`Period.lean:94`) | needs closed `C¹`, as stated |
| 7 | §1.3 Lean, non-Hausdorff | branching line (two copies of `ℝ` glued along `(−∞, 0)`), `φ = dx` | van Kampen over two copies of `ℝ` meeting in a contractible set gives `π₁ = 1`; global primitive `x` on each branch, equal on the overlap | holds without `T2`, as stated |
| 8 | §1.3 Lean, degenerate | `E = 0`, `M` a point | the only `1`-form is `0`; `g` constant; fibre `{x₀} × F` nonempty | holds |
| 9 | §1.3 holomorphic Check | slit plane with `1/z`; `ℂ∖{0}` | principal `log`; `∮ dz/z = 2πi ≠ 0` | simple connectivity needed |
| 10 | §2.1 cone, examples | `[0,∞)` at `0` with `v = 1, 0`; quadrant with `v = (1,0)` | `ball(t, t/2) ⊆ [0,∞)`; `−εt/2 ∉ C`; `(t, −εt/2) ∉ C` | cone `(0,∞)`; open quadrant |
| 11 | §2.1 openness, uniform in `x` | `q = x + t₀v` with `ball(q, εt₀) ⊆ C`, `t₀ = δ/2`; `x′ ∈ C` with `‖x′ − x‖ < εt₀/2` | `x′ + tv = (1 − t/t₀)x′ + (t/t₀)(x′ + t₀v)`, ball radius `(t/t₀)(εt₀/2) = (ε/2)t` | uniform `(ε/2, δ/2)` near `x`: holds |
| 12 | §2.1 interior anchor | `ball(q, 2ε₀) ⊆ C`, `‖y − x‖ < ε₀` | `y + t(q − x) = (1−t)y + t(y + q − x)`, with `‖(y+q−x) − q‖ < ε₀`, radius `ε₀t` | local strictly inward section exists |
| 13 | §2.2 Lean | `[0,∞)`, `Φ(t,x) = x + (1−t)²` at `t = 0, 1, 3` | `Φ(0,0) = 1 = r(0)`, `Φ(1,x) = x`, `Φ(3,0) = 4 > 0` | every clause, all `t ∈ ℝ` |
| 14 | §2.2 semiflow Check | `[0,1]`, field `1/2 − x`; field `x(1−x)` | `r(0) = 1/2 − 1/(2e) = 0.316`, `r(1) = 0.684`; `r(0) = 0` | vanishing field fails the interior clause |
| 15 | §2.2 non-degeneracy | any nonempty `M` with boundary | interior of `range I` meets every neighbourhood in `range I` (convex, nonempty interior), so `r` with values in `I.interior M` is forced to move boundary points | no trivial witness (`r = id` fails) |
| 16 | §2.2 corner Check | quadrant, `ψ(s,p) = p + s(1,1)` at `(0.3, 0.7)` | inverse `((0, 0.4), 0.3)`; `∂ₓ min` is `1` for `x < y`, `0` for `x > y`; `(0,t) = (a+s, s) ⇒ a = −t` | topological collar only |
| 17 | §2.3 identities | `i ∘ j_* s r_* = j_* i s r_* ~ (j∘r)_* ~ id`; `j_* s r_* i = j_* s i r^∞_* ~ (j∘r)^∞_* ~ id` | the second `~` on smooth chains is the smooth prism | both identities hold; the prism is the only geometric input (R01) |
| 18 | §2.3 Checks | `[0,∞) ⊇ (0,∞)`; `S¹` with `r` constant | `[0] ↦ [1]`, `∂(t ↦ t) = [1] − [0]`; on `H₁(S¹) = ℝ` the composite is `0` | the homotopy hypothesis is needed |
| 19 | §2.4 Lean, degenerate | `W = ∅`; `W = X` | `Δⁿ ≠ ∅`, so both subcomplexes are empty: the absolute case; `smooth ⊓ ⊤ = smooth`, relative complexes `0` | holds |
| 20 | §2.4 with boundary | `X = [0,∞)`, `W = (0,∞)` | `W ↪ X` is a homotopy equivalence, so all relative groups are `0` on both sides | holds over corners |
| 21 | §2.4 `(ℝ, ℝ∖{0})` | long exact sequence | `H₁ = ker(ℝ² → ℝ) = ℝ`, `H₀ = 0`; `∂(t ↦ 2t−1) = [1] − [−1]` | holds |
| 22 | §2.4 openness Check | `W` the graph of a nowhere-differentiable `h` | smooth simplices in `W` are constant; smooth relative `H₁ ≅ H̃₀(W_disc)` of dimension `𝔠` against singular `0` | `hW` needed |
| 23 | §2.5 route | `h = f + ρ(e − f)` | `‖h − f‖ = ρ‖e − f‖ < ε/2` on `T`, `0` off `T`; `‖g − f‖ < ε/2 + ε/2`; `g = h = e` near `A` | holds |
| 24 | §2.5 Checks | `r(2)`, `r(−1)`, `r(0.3)`, `r((3,4))`; `Q(t,t,t)`; trace `|sin θ|` | `1`, `0`, `0.3`, `(0.6, 0.8)`; `3t² − 6t² = −3t² = −0.03` at `t = 0.1`; one-sided derivatives `±1` | holds; target with boundary fails |
| 25 | Must-not-enter `3`-simplex | Hessian `[[2,−2,−2],[−2,2,−2],[−2,−2,2]]` on `(1,1,1)` | `½t²(6 − 12) = −3t²` | face-fixing smoothing into `[0,∞)` false |
| 26 | §3.1 `d² = 0`, Mathlib coordinates | `(α, β)`; `(α, g) = (α, −β)` | `d(dα, α|_W − dβ) = (0, 0)`; `g′ = −α|_W + dβ = −α|_W − dg` | holds |
| 27 | §3.1 sign of `δ` | `(ℝ, ℝ∖{0})`, `b = 1_{x>0}`, `c = [−1,1]` | `0 − (b(1) − b(−1)) = −1`, so `δ[b] = −[(0,b)]` gives `1`; singular `b(∂c) = 1` (`linearYonedaObj` has no sign); opposite convention `−1` | holds |
| 28 | §3.2 comparison sign | `b`, lift `b̃`, `d(b̃, 0) = (db̃, g b̃) = (db̃, b)` | `[(db̃, 0)] = −[(0,b)]` | holds |
| 29 | §3.2 no canonical inverse | `ℝ² → ℝ`, maps with `t = 0` and `t = 5` | `d((k₁,k₂),0) = (0, k₁)`; `H⁰ = {((0,k₂),0)}`; both maps send it to `(0, k₂)` | not canonical, as claimed |
| 30 | §3.2 evaluation formula | `(∫α, ∫β) − d(e,0)` with `e|_W = ∫β`; `ψ dx` Check | `(∫α − de, 0)`, value `∫_c α − ∫_{∂c} β`; `1 − (1 − 0) = 0` | holds |
| 31 | §3.3 isomorphism | `(ℝ, ℝ∖{0})`; `(ℝ², ℝ²∖{0})`; `(S¹, S¹∖{pt})` | `H¹ = ℝ²/ℝ = ℝ`; `H² ≅ H¹(ℝ²∖0) = ℝ` with `−(0 − ∫_{∂D} dθ) = 2π`, `H¹ = 0`; `H¹(S¹, S¹∖pt) ≅ ℝ` since `H⁰(S¹) → H⁰(arc)` is onto and `H¹(arc) = 0` | holds |
| 32 | §4.1 formulas | `ℝ`, `ψ dx`, `K = [−1,1]`, `K′ = [−3,3]`; `S¹`, `dθ/2π`; discrete `ℤ` | `t ↦ 4t − 2`: `1`; `t ↦ 8t − 4`: `1`; `t ↦ 2t − 1` has ends `±1 ∈ K`; `1 = ⟨deRhamHom[dθ/2π], [S¹]⟩ = 1`; `1 + 2 = 3` | holds |
| 33 | §4.1 generator (negative control) | Tau Ceti's chart generator against AlgebraicTopology 6.3's | `[γ(1)] − [γ(0)] = [−1] − [1]` gives the path `1 → −1` (`IntervalGenerator.lean` header); 6.3: `−1 → 1`; the former gives `1 = −1` | 6.3's generator is the right one |
| 34 | §4.2 boundary formula | `D¹`, `c₊ = 3`, `c₋ = 1`; `[0,1]` with `(dx, x)`; `[0,1]` with `(2x dx, x²)` | `−(3 − 1) = −2`; `1 − (1 − 0) = 0`; `1 − (1 − 0) = 0`, with `(2x dx, x²) = d(x², 0)` | holds |
| 35 | §4.2 route, Hausdorff | `γ = ρβ`; doubled origin in `[−1,1]` | `(α,β) − d(γ,0) = (α − dγ, (1−ρ)β)`, enlarge to `{ρ = 1}`; `H₁(M) = ℝ`, `H₁(M,∂M) = ℝ²`, `a = b = a + b = s ⇒ s = 0` | holds; `T2` needed |
| 36 | §5.1–5.2 | `x + p` against `id` at `((1,2),3)`; `x² + p` against `0` and against `id`; `x²`; `P = 0` | `1 + 3 − 2 = 2`; `p = −1, 0, 1`: regular, not regular, regular (empty); against `id` always regular; bad set `ℝ` without universal transversality; with `htotal`, `P = 0` has bad set `∅` | as stated |
| 37 | §5.3 flat and manifold, `IsTransverseAt` | `f = 0, β = x², p = 1, x = 2`; `M = S¹`, `f = cos θ`, `β = 1`, `j = 0`; discrete `ℝ` as `N`; `g = x³` against `j = x³` | `0 + 4·1 = 4`; bad set `{−1, 1}`, null; bad set `ℝ`, measure `∞` (second countability needed); at `x = y = 0`, `(u,v) ↦ 0` is not onto | holds |

## Not verifiable

- **Lee, *Introduction to Smooth Manifolds*, 2nd ed. (`lee`).** Recorded uncertified, so not read. It is cited at:
  - §§1.2–1.3: Ch. 11, *Conservative Covector Fields*;
  - §2.2: Prop. 2.28 and Thms. 9.24–9.26, pp. 222–223;
  - §2.4: Thm. 18.7;
  - §3.3: Thm. 18.14;
  - §5.2: Thm. 6.35;
  - §5.3: Thms. 6.35–6.36.
- **Bott–Tu, *Differential Forms in Algebraic Topology* (`bott-tu`).** Recorded uncertified, so not read. It is cited at §3.1 (Ch. I, §6) and §4.1 (§5).
- **Open pull requests without a checkout.** For #1187, #1797, #1807, #1808 and #1854 (multi-roadmap pull requests), ownership was checked only by `roadmaps grep` for the objects listed above. None claims the smooth prism operator, inward domination, the relative de Rham theory or Layer 5's transversality. #1797's AlgebraicTopology names §4.1 as the owner of the integration comparison, which is consistent with this head.

## Source issues

- none
