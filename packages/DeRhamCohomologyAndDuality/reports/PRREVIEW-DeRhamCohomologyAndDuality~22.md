# Review of DeRhamCohomologyAndDuality (pull request #2085 at f2f197b)

**Verdict:** needs changes

This is a full review of the folder at f2f197b, the head the previous review also read. Both of its findings still hold.

- **R01:** the smooth prism operator of §2.3 is owned twice. The witness has been re-read at DifferentialGeometry's current head, cd5e804.
- **R02:** the pull-request title and description contradict the head. ComplexKahlerGeometry's revision has moved to 2b571fb and now consumes this roadmap, so the title is contradicted by both READMEs.

Re-checking the whole roadmap, including the 156 library names it cites, found no new defect in the folder.

## R01 (P2) — DifferentialGeometry's open revision also builds §2.3's smooth prism lemma, and only DifferentialGeometry can own it

**Location.** `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:641–643` (§2.3): "prove that this simplicial homotopy preserves smooth simplices, because the simplices of `Δ[1]` act through affine maps of the simplex into `ℝ` and `Φ` is jointly smooth on `ℝ × M`".

**Claim.** §2.3 plans to build this lemma: the simplicial homotopy that `TopCat.Homotopy.toSSet` induces from a jointly smooth homotopy preserves `TauCeti.smoothSingularSubcomplex`, so it is a chain homotopy on smooth chains. DifferentialGeometry's open revision plans to build the same lemma as a step of 8.3 and says it does not consume it. If both merge, the lemma has two owners.

The supply direction decides the owner:

- On main, neither roadmap owns the lemma.
  - Main §2.3 names the smooth prism operator only as an input (main `README.md:361–362`). Its *Needs:* line is DifferentialGeometry 8.3's carriers and AlgebraicTopology Stage 2.
  - Main DifferentialGeometry 8.3 (`README.md:836–844`) reaches smoothing by relative Whitney approximation and states no smooth homotopy invariance.
  - Tau Ceti's `Geometry/Manifold/SmoothSingular/` (`Basic.lean`, `Integral.lean`) has no such lemma either.
- DifferentialGeometry supplies this roadmap: §§2.4 and 3.3 import 8.3, and Layers 3–4 import 8.4–8.5. If DifferentialGeometry 8.3 cited §2.3, the two roadmaps would form a cycle.
- DifferentialGeometry cannot drop the lemma either. Its corner route needs it, because the Whitney route fails over corners: this roadmap's own `3`-simplex in `[0, ∞)` shows it (`README.md:1243–1250`).
- So the owner has to be DifferentialGeometry 8.3, and §2.3 cites it.

**Witness.** DifferentialGeometry at cd5e804, `TauCetiRoadmap/DifferentialGeometry/README.md:2517–2524` (8.3 starts at `:2494`): "smooth singular homology is invariant under jointly smooth homotopies (the prism operator of such a homotopy preserves smooth chains) … the smooth prism operator is built here, not consumed."

**Repair.**

1. In §2.3, replace the quoted clause with "this simplicial homotopy preserves smooth simplices by DifferentialGeometry 8.3's smooth prism operator". Keep the two inverse identities, the independence of the inverse, the use of §2.2 and the sentence "The transfer lemma is this roadmap's".
2. Add "DifferentialGeometry 8.3 (the smooth prism operator of a jointly smooth homotopy)" to §2.3's *Needs:* line (`README.md:648–650`).
3. Extend the 8.3 bullet of *Exact supplier contracts* (`README.md:362–364`) with what is assumed: for `Φ : ℝ × M → M` jointly smooth, `TopCat.Homotopy.toSSet` of its restriction to `[0, 1] × M` maps `TauCeti.smoothSingularSubcomplex I M` into itself. If 8.3 states this only under its smoothing hypotheses (`[IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M] [FiniteDimensional ℝ E]`), §2.3 carries those hypotheses on `M` as well.
4. In *How to read the build* (`README.md:389–391`), add that the transfer lemma consumes DifferentialGeometry 8.3's smooth prism operator.
5. After the sentence at `README.md:125–127` ("DifferentialGeometry supplies this roadmap and consumes none of it …"), add that 8.3 also supplies the smooth prism operator that §2.3 uses. The existing sentence stays true.
6. In the pull request's merge-order block, put DifferentialGeometry's revision first. Section 8.3 exists on main, so the overlap check does not list this edge. The lemma itself exists only at that revision's head.

**Tested.** On §2.3's own Check: `M = [0, ∞)`, `N = (0, ∞)`, `r(x) = x + 1`, `Φ(t, x) = x + (1 − t)²`.

- `Φ` is jointly smooth on `ℝ × [0, ∞)`, and `M` is Hausdorff and σ-compact over a one-dimensional model. So the cited lemma applies under either hypothesis set.
- For a smooth `σ` and an affine `|α| : Δⁿ → [0, 1]`, the simplex `x ↦ Φ(|α|(x), σ(x))` is smooth, as both READMEs say.
- The Check's values do not change: `[0] ↦ [1]`, then a smooth `0`-chain of total coefficient `1`, homologous to `[0]` through `t ↦ t` with boundary `[1] − [0]`.
- After the repair, "built here" for the smooth prism operator appears in one README only.

## R02 (P3) — The pull-request title and description say the opposite of the head, and the merge-order block states no order

**Location.** This is the pull-request text, not a file in the folder.

- The title reads "ComplexKahlerGeometry K6.1 is a supplier, not a consumer".
- The description says "the README no longer names K6.1 as a consumer and cites ComplexKahlerGeometry only as a supplier".
- The merge-order block reads "No open pull request must merge before this one".

**Claim.** The head says the reverse:

- `README.md:114–120` makes this roadmap the single owner of §§2.4, 3.1–3.3 and 4.1.
- `README.md:1267–1274` names K6.1 as their consumer.
- ComplexKahlerGeometry appears in no *Needs:* line and in no supplier contract. The branch commit "restore K6.1 consumer" undid the change the description describes.

ComplexKahlerGeometry's revision now agrees with the head:

- At 2b571fb it has a supplier section "From TauCetiRoadmap.DeRhamCohomologyAndDuality" (`README.md:284–291`).
- K6.1's *Needs:* line cites §§2.4, 3.1–3.3 and 4.1 (`README.md:2654–2656`).

So the description is contradicted by both READMEs. It also omits the order that R01 needs.

**Witness.** ComplexKahlerGeometry at 2b571fb, `TauCetiRoadmap/ComplexKahlerGeometry/README.md:2644–2645`: "The relative de Rham theory used above is DeRhamCohomologyAndDuality's and is consumed in its boundaryless instances".

**Repair.** No change in the folder. Rewrite the title and description to describe this head against main:

- Layer 1 is rebuilt on `TauCeti.IsPrimitiveOn` and `TauCeti.PrimitiveSpace` for `C¹` manifolds over any model. The headline is `exists_isPrimitiveOn_univ_of_simplyConnectedSpace`.
- §2.4 is stated in `Suggested.lean` (`quasiIso_smoothPairToSingular`), and so is the manifold Haar-null theorem with `IsTransverseAt`.
- §4.1 uses AlgebraicTopology 6.3's point generator.
- §4.2 assumes Hausdorff `M`.
- K6.1 stays a consumer.

In the merge-order block, put DifferentialGeometry's revision first (R01). ComplexKahlerGeometry's revision needs no order with this one: it cites §§2.4, 3.1–3.3 and 4.1, which exist on main under those numbers.

**Tested.** The rewritten text agrees with:

- `README.md:114–120` and `:1267–1274`;
- main `README.md:70–76` (the same single-owner paragraph);
- ComplexKahlerGeometry at 2b571fb, `README.md:93–96` and `:284–291`.

## Previous findings (review of the same head, f2f197b)

- **R01 (smooth prism operator owned twice) — not repaired.** §2.3 is unchanged (`README.md:639–643`). DifferentialGeometry's revision moved from c6bc13d to cd5e804 and still builds the operator (`:2517–2524`). The finding is carried as R01 above, with the witness lines updated.
- **R02 (pull-request text) — not repaired.** The title, description and merge-order block are unchanged. ComplexKahlerGeometry's revision moved from 28004ec to 2b571fb and now cites this roadmap, so the previous request that it be rebased to cite §§2.4, 3.1–3.3 and 4.1 is done on its side. The rest of the finding is carried as R02 above.

No repair report marks either finding as not actionable.

## Verified sound

### Gate, dependency check, Lean

**Gate.** I re-ran it at f2f197b with `--base origin/main`. Every check prints `0` (`set_option=0 … outside-folder=0 source-material=0`) and the run ends in `OK`. The worker's run also has `build=0`.

**Dependency check** (`--movable`). Output, in full: `depcheck: 235 roadmaps, 2265 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The roadmap is at line 397 of the merge order. Its suppliers, DifferentialGeometry and AlgebraicTopology, are on main.

**Diff outside the folder.** Empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 50 s. The only warnings are six `declaration uses 'sorry'`, at lines 63, 83, 122, 158, 172 and 217.

**Binder check.** I put `#check @` of all 13 declarations in one scratch file and elaborated it. Every type matches its README statement:

- §1.3 carries `[IsManifold I 1 M] [SimplyConnectedSpace M]` and no separation or completeness binder.
- §2.2 carries `[FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]`.
- §2.4 carries `X : Type`, the same four binders on `X`, and `IsOpen W`.
- §5.2 carries four `FiniteDimensional` binders, `BorelSpace P` and a Haar `μ`.
- §5.3 (flat) carries three `FiniteDimensional` binders. The cutoff is `0 ≤ β` with zero set exactly `C`, and transversality is assumed at the points of `C`.
- §5.3 (manifold) carries `BoundarylessManifold` and `SecondCountableTopology` on `M` and on `N`, and no `T2Space`.

The signature report's lead on `incidenceEquation` is not a defect. Its body `F (x, p) − j y` needs only `[NormedAddCommGroup V]`, and every theorem that uses it carries the normed-space binders. Nothing changed.

**Padding probe.** On a scratch copy, each of the six theorems was given `first | rfl | (simp; done) | infer_instance | (aesop; done) | exact?`. All six fail with "`exact?` could not close the goal". Each of the seven definitions occurs in a stated headline.

**Form.**

- `import Mathlib` plus four Tau Ceti modules, each of them used:
  - `GlobalParametric` for `TauCeti.IsRegularParameter`;
  - `LocalPrimitive` for `TauCeti.IsPrimitiveOn`;
  - `SmoothSingular.Basic` for `TauCeti.smoothSingularSubcomplex`;
  - `Subdivision.Small.Chains` for `TopCat.smallSingularSubcomplex`.
- No `set_option`, no `lemma`, no `#eval` and no sorry'd data.
- One module docstring names the three headlines that cannot be stated at the pins and what each lacks.
- The process-word scan finds nothing; every "lemma" hit is mathematical prose.

### Library declarations at the pins

**Names cited by the README.** I `#check`ed all 156 backticked library names in one scratch file importing Mathlib and 97 Tau Ceti modules. 155 resolve directly. `TauCeti.SmoothSimplex.integral` resolves once `Geometry/Manifold/SmoothSingular/Integral` is imported. None is missing. Excluded: this roadmap's own names and DifferentialGeometry's `chainIntegral`, `deRhamHom` and `deRhamEquiv`.

Declarations read for what they assume:

- **Layer 1.**
  - `TauCeti.IsPrimitiveOn` has the fields `isOpen`, `mdifferentiableOn` and `mextDeriv_eq`.
  - `IsPrimitiveOn.isOpen_setOf_eq` (`LocalPrimitive.lean:132`) and `eventuallyEq_add_const` (`:156`) need only `[IsManifold I 1 M]`.
  - `exists_contMDiff_isPrimitiveOn` (`:265`) and `PrimitiveSpace.isCoveringMap_proj` (`:280`) sit under `[FiniteDimensional ℝ E] [T2Space M] [IsManifold I ∞ M] [CompleteSpace F]` (`:262`). This is the split Layer 1 claims.
- **§1.3.**
  - `exists_mextDeriv_eq_of_simplyConnectedSpace` (`DeRham/SimplyConnected.lean:69–74`) takes its base point from `SimplyConnectedSpace`, so §1.3 needs no `Nonempty` hypothesis.
  - `IsCoveringMap.existsUnique_continuousMap_lifts` needs only `[SimplyConnectedSpace A] [LocallyPathConnectedSpace A]`.
  - `ModelWithCorners.locallyPathConnectedSpace` is at `Geometry/Manifold/Topology.lean:36`.
- **§1.2.**
  - `TauCeti.pathClassIntegral` (`DeRham/Period.lean:90–94`) returns `0` unless `IsSmoothForm I 1 φ ∧ mextDeriv φ = 0`. This is the junk value the `d(|x|^(3/2))` Check uses.
  - `pathClassIntegral_mk_eq_pathIntegral` (`:197`) is stated for `ContMDiff … 1` curves.
- **Layer 5.**
  - `TauCeti.IsRegularParameter` (`GlobalParametric.lean:63–65`) asks that `fderiv f (x, l) ∘ inl` be surjective at every solution. So `IsRegularIncidenceParameter`'s slice derivative is `(u, v) ↦ D_xF u − Dj v`, as §5.1 says.
- **Approximation and cutoffs.**
  - `Continuous.exists_contMDiff_approx_and_eqOn` (`SmoothApprox.lean:79`) accepts any real normed target. It needs the map smooth on some `U ∈ 𝓝ˢ S` and fixes the closed `S`.
  - `exists_contMDiffMap_one_nhds_of_subset_interior` carries `[NormalSpace M]`.
  - `exists_contMDiff_zero_iff_one_iff_of_isClosed` gives `0` exactly on `s` and `1` exactly on `t`.
  - `IsOpen.exists_contDiff_support_eq` gives support exactly `s` and values in `[0, 1]`.
- **Integration.**
  - `TauCeti.integralTopForm_ofFunction_zeroDim` assumes `Subsingleton E` and has value `signBasis · g x`.
  - `TauCeti.integralTopForm_mextDeriv` is over `𝓡∂ (n+1)`, with `T2Space`, `SigmaCompactSpace` and a compactly supported `C¹` form.
- **Topology.**
  - `TauCeti.IsLocallyCollared.isCollared` needs `CompactSpace N`, `T2Space M` and injectivity.
  - `TopPair.isIso_singularHomologyMap_excisionMap_of_isClosed_subset` needs an open `U` and a closed `K ⊆ U`.
- **§4.1's negative control.** `AlgebraicTopology/Singular/IntervalGenerator.lean:18–20` says the generator of `H₁(I¹, ∂I¹)` is the simplex running from `1` to `0`. That confirms the decreasing-path control.
- **The holomorphic Check of §1.3.** `Complex.IsExactOn` (`Analysis/Complex/HasPrimitives.lean:117`) asks for `HasDerivAt` only at points of the set.
- **The docstring's reasons for the headlines that cannot be stated.**
  - Tau Ceti's `SmoothSingular/Integral.lean` has `integral` with zero, add, smul, naturality and `ofFunction` lemmas, and no Stokes lemma.
  - There is no `deRhamHom` in Tau Ceti.

### Cross-roadmap citations

**DifferentialGeometry, on main.**

- 8.3 (`README.md:836–844`) states the smoothing theorem.
- `Suggested.lean:2583` states `smoothing` under `[IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M] [FiniteDimensional ℝ E]` for an arbitrary `I`, and `:2591` and `:2597` give both homotopies.
- Main states it on its own `SmoothSimplex` carrier and allows a sub-simplicial-set implementation (`README.md:842–844`). The revision names Tau Ceti's `smoothSingularSubcomplex` as 8.3's carrier (cd5e804 `:2494–2506`). So the contract's "on Tau Ceti's carriers" holds.
- 8.4 is at `:845` and 8.5 at `:852`. 9.3 is duality only (`:872`).

**DifferentialGeometry's revision, cd5e804.**

- `:98–102` and `:109–120` assign the inward cone, inward domination, the relative de Rham theory and relative transversality here.
- `:142` assigns §4.1 here.
- 8.4 (`:2538`) and 8.5 (`:2567`) keep their numbers.
- The only overlap is R01.

**AlgebraicTopology Stage 6.3, on main.**

- The generator is the simplex `v₀ = −Σ eᵢ`, `vᵢ = eᵢ`, with positive edge determinant (`:1262–1264`). In dimension 1 that is the path from `−1` to `1`.
- `:1285–1286` gives the comparison with `Manifold.Orientation`.
- The relative class is built over `𝓡∂ m`, `m > 0`, for Hausdorff and second-countable `M`, through Brown's collar (`:1360–1368`).
- `:1423` checks `∂[D¹] = [+1] − [−1]`.
- `:83–85` assigns the integration comparison to DifferentialGeometry 9.3, the main text that the Scope sentence at `README.md:79–82` describes.

**AlgebraicTopology's revision, c204943.** `:108` says this roadmap's Layer 5 consumes nothing there. `:125–126` is unchanged from main.

**GeometricTopology §1.1, on main.** It is at `:788`, and the bullet on the interior's homotopy equivalence is at `:809`.

**HeegaardFloer, on main.** F0.S is §2.1 (`:71`).

**ComplexKahlerGeometry, on main.**

- K5a is at `:570`, and the punctured-plane computation is at `:939`.
- K6.1 is at `:1274`. It names DifferentialGeometry 9.3, 8.4 and 8.3 at `:1328`, `:1382`, `:1388` and `:1396`, which *Downstream consumers* (`README.md:1273–1274`) records.

**ComplexKahlerGeometry's revision, 2b571fb.** It consumes §§2.4, 3.1–3.3 and 4.1 at `:93–96`, `:284–291`, `:2561`, `:2617`, `:2626`, `:2634` and `:2644–2656`. The two sides now agree on the owner.

**TangentialBordism, d2fece9.** §2.1 is at `:505`. Its transversality bullet (`:619–656`) gives a null set (`TauCeti.IsNullSet`) of bad parameters, on Hausdorff manifolds, with a boundaryless parameter manifold and a non-compact target. This matches the adjacency paragraph `README.md:84–108`.

**`roadmaps resolve`.** Nothing unresolved.

**Overlaps.** None listed. A `roadmaps grep` for the objects confirms it:

- "prism operator": only DifferentialGeometry's revision has the smooth one. The other hits are singular prisms.
- "inward domination": only DifferentialGeometry's revision, which defers it here.
- "relative de Rham": ComplexKahlerGeometry's revision, which consumes it here.

### Sources: the seeded sample

- **Hatcher** (`hatcher`, certified).
  - Prop. 1.30 (homotopy lifting, a unique lifted homotopy): `hatcher` line 2676, page marker 69.
  - Prop. 1.33 (lifting criterion; path-connected, locally path-connected source): line 2723, marker 70.
  - Prop. 1.34 (lifts agreeing at one point of a connected source agree everywhere): line 2758, marker 71.

  None assumes a separation axiom of the base or the cover. They support §1.2 (lifting and uniqueness) and §1.3 (a simply connected source satisfies the `π₁` condition) as written.
- **Lee** and **Bott–Tu** are recorded as uncertified; they are listed under *Not verifiable*.
- **Sample targets with no external locator:** §§1.1, 2.1, 2.3, 2.5, 3.2, 4.2 and 5.1. Each states which part is this roadmap's own, and its route rests on the pinned declarations above.
- **The README flags no unverified locator.**

### Headline theorems

From the Summary:

- **1.3, 2.2, 2.4:** stated (`Suggested.lean:63`, `:83`, `:122`).
- **3.3, 4.1, 4.2:** named in the module docstring as not statable. Each lacks the cochain map `deRhamHom`; 4.1 and 4.2 also lack the homological orientation of a tangent orientation, and 4.2 also lacks the oriented relative class. The pins were checked for all three.
- **5.3:** stated in flat form (`:172`) and on manifolds (`:217`).
- **5.2:** also stated (`:158`).

No headline is forced through a stand-in.

### Adversarial table

Every value below was computed for this round.

| # | Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|---|
| 1 | §1.1 local primitives | `x dy` on a disc | `∂ₓg = 0` forces `g = h(y)`, then `h′(y) = x` at `x = 0` and `x = 1` gives `0 = 1` | no primitive; the always-true predicate is excluded |
| 2 | §1.1 discontinuous form | `d(x² sin(1/x))` at `1/(2πn)`, `1/((2n+1)π)`, `0` | `φ = −1`, `+1`, `0`; primitive `x² sin(1/x)` | continuity is not necessary |
| 3 | §1.1 not `C¹` | `d(|x|^(3/2))` | `φ = (3/2)|x|^(1/2) sgn x`; the difference quotient of `φ` at `0` is `(3/2)h^(−1/2) → ∞` | outside the closed `C^r` theory, inside §1.1 |
| 4 | §1.2 integral | angular form: loop, double loop, reversal | `2π`, `4π`, `−2π`; integrating the norm gives `+2π` on the reversal | holds |
| 5 | §1.2 choice of primitives | `dx`, `0 → 3`, split at `1`, `Re` / `Re + 7` | `(1 − 0) + (10 − 8) = 3` | holds |
| 6 | §1.2 agreement bullet | `d(|x|^(3/2))` on `(0,0)→(1,0)` and `(−1,0)→(1,0)` | `1` and `1 − 1 = 0`; `pathClassIntegral` takes its else-branch `0` (`Period.lean:94`) | needs closed `C¹`, as stated |
| 7 | §1.2 covering map | sheets over `U` | fibre ∩ `graph(g+c)(U)` is the single point `(y, g y + c)`; `graph(g+c) ∩ graph(g+c′) = ∅` for `c ≠ c′` | no `T2`, finite dimension or completeness used |
| 8 | §1.3 Lean, degenerate | `E = 0`, `M` a point | `φ = 0` (the only `1`-form), `g` constant; the fibre `{x₀} × F` is nonempty, so the lift exists | holds |
| 9 | §1.3 holomorphic case | slit plane with `1/z`; `ℂ∖{0}` | principal `log`; `∮ dz/z = 2πi ≠ 0` | simple connectivity needed |
| 10 | §2.1 strict inward cone | `[0,∞)` at `0`: `v = 1, 0`; quadrant, `v = (1,0)` | `ball(t, t/2) = (t/2, 3t/2) ⊆ C`; `−εt/2 ∉ C`; `(t, −εt/2) ∉ C` | cone `(0, ∞)`; open quadrant |
| 11 | §2.1 convexity, interior anchor | `λv + (1−λ)w`; `ball(q, 2ε₀) ⊆ C`, `‖y − x‖ < ε₀` | `x + t(λv+(1−λ)w) = λ(x+tv) + (1−λ)(x+tw)` with radius `min(ε_v, ε_w)t`; `y + t(q−x) = (1−t)y + t(y+q−x)`, `‖(y+q−x) − q‖ < ε₀` | convex; `q − x` lies in the cone |
| 12 | §2.2 Lean | `[0,∞)`, `Φ(t,x) = x + (1−t)²` at `t = 0, 1, 2` | `Φ(0,0) = 1 = r(0)`, `Φ(1,x) = x`, `Φ(2,0) = 1`; `x > 0 ⇒ Φ > 0` | all clauses hold, for all `t ∈ ℝ` |
| 13 | §2.2 semiflow Check | `[0,1]`, field `1/2 − x`; field `x(1−x)` | `r(0) = 1/2 − 1/(2e) = 0.316`, `r(1) = 0.684`; `r(0) = 0` | the vanishing field fails |
| 14 | §2.2 corner | quadrant, field `(1,1)`, point `(0.3, 0.7)` | base `(0, 0.4)`, depth `0.3`; `∂ₓ min` is `1` (`x < y`) and `0` (`x > y`); `(0,t) = (a+s, s) ⇒ a = −t` | topological collar only |
| 15 | §2.2 degenerate | `E = 0` (`range I = E`); `M = ∅` | the interior is all of `M`: `r = id`, `Φ = pr₂`; the empty case is vacuous | holds |
| 16 | §2.3 transfer | `[0,∞) ⊇ (0,∞)`, `r = x + 1`; `S¹` with constant `r` | `[0] ↦ [1]`, coefficient sum `1`, `∂(t ↦ t) = [1] − [0]`; on `H₁(S¹) = ℝ` the composite is `0` against an isomorphism | identities hold; the homotopy is needed |
| 17 | §2.3 prism step (R01) | `α : [n] → [1]`, affine `|α|`, smooth `σ` | `x ↦ Φ(|α|(x), σ(x))` is smooth near every point; DifferentialGeometry cd5e804 `:2517–2524` builds the same | double owner |
| 18 | §2.4 Lean | `W = ∅`; `W = X` | `Δⁿ ≠ ∅`, so both subcomplexes are empty: the absolute case; `smooth ⊓ ⊤ = smooth`, relative complexes `0` | holds |
| 19 | §2.4 `(ℝ, ℝ∖{0})` | long exact sequence of the pair | `H₁ = ker(ℝ² → ℝ) = ℝ`, `H₀ = 0`; generator `t ↦ 2t−1`, `∂ = [1] − [−1] ⊆ W` | holds |
| 20 | §2.4 openness needed | `W` = graph of a nowhere-differentiable `h` | smooth simplices into `W` are constant; smooth relative `H₁ ↠ H̃₀(W_disc)` (dimension `𝔠`) against singular `0` | `hW` needed |
| 21 | §2.5 retractions | `r(2)`, `r(−1)`, `r(0.3)`, `r((3,4))` | `1`, `0`, `0.3`, `(3,4)/5 = (0.6, 0.8)` | holds |
| 22 | §2.5 route | `h = f + ρ(e − f)`, then `g` | `‖h − f‖ = ρ‖e − f‖ < ε/2` on `T` and `0` off `T`; `‖g − f‖ < ε/2 + ε/2`; `g = h = e` on a closed neighbourhood of `A` | holds |
| 23 | §2.5 target with boundary | `Q(0,y,z)`, `Q(t,t,t)` | `(y−z)² ≥ 0`; `3t² − 6t² = −3t² = −0.03` at `t = 0.1` | no `[0,∞)`-valued `g` |
| 24 | §2.5 trace needs `e` | disc, `f = (|y|, 0)` | trace `|sin θ|`, one-sided derivatives `±1` at `θ = 0` | no smooth `g = f` on `∂D` |
| 25 | Must-not-enter, `3`-simplex | Hessian `[[2,−2,−2],[−2,2,−2],[−2,−2,2]]` along `(1,1,1)` | `½t²·(6 − 12) = −3t²` | a face-fixing smoothing into `[0,∞)` is false |
| 26 | §3.1 `d² = 0` and `δ` | `(α, β)`; `b` extending to `b̃` | `d(dα, α|_W − dβ) = (0, dα|_W − dα|_W) = 0`; `d(b̃, 0) = (db̃, b)` gives `[(db̃, 0)] = −[(0, b)]` | holds |
| 27 | §3.1 sign of `δ` | `(ℝ, ℝ∖{0})`, `b = 1_{x>0}`, `c = [−1,1]` | `∫_c 0 − (b(1) − b(−1)) = −1`, so `δ[b] = −[(0,b)]` gives `1`; singular `b(∂c) = 1`; the opposite convention gives `−1` | holds |
| 28 | §3.1 degenerate pairs, coordinates | `H⁰(ℝ, ℝ∖{0})`; `W = ∅`; `W = X`; `g = −β` | constants vanishing on `W` = `0`; `Ω^(q−1)(∅) = 0`; the cocone of the identity is acyclic; `−(α|_W − dβ) = −α|_W − dg` | as stated |
| 29 | §3.2 cocone against kernel | `ℝ² → ℝ`; maps with `t = 0` and `t = 5` | `d((k₁,k₂),0) = (0, k₁)`; `H⁰ = {((0,k₂),0)}`; both maps send it to `(0, k₂)` | not canonical, as claimed |
| 30 | §3.2 evaluation formula | `(∫α, ∫β) − d(e, 0)` with `e|_W = ∫β` | `= (∫α − de, 0)`, so the value is `∫_c α − ∫_{∂c} β`; the `ψ dx` Check gives `1 − (1 − 0) = 0` | holds |
| 31 | §3.3 isomorphism | `(ℝ, ℝ∖{0})`; `(ℝ², ℝ²∖{0})` | `H¹ = ℝ²/ℝ = ℝ`; `H² ≅ H¹(ℝ²∖0) = ℝ` with `−(0 − ∫_{∂D} dθ) = 2π`; `H¹ = 0` because `H⁰(ℝ²) → H⁰(ℝ²∖0)` is an isomorphism | holds |
| 32 | §4.1 compact support | `ℝ`, `ψ dx`, `K = [−1,1]`, `K′ = [−3,3]` | `t ↦ 4t−2`: `∫_{−2}^{2} ψ = 1`; `t ↦ 8t−4`: `1`; `t ↦ 2t−1` has ends `±1 ∈ K`; `deRhamHom [η] = 0` | holds |
| 33 | §4.1 generator (negative control) | Tau Ceti's chart generator against AlgebraicTopology 6.3's | `[−1] − [1] = [γ(1)] − [γ(0)]` gives the path `1 → −1` (as `IntervalGenerator.lean:18–20` says); 6.3's `v₀ = −1`, `v₁ = 1` gives `−1 → 1`; with the former the formula reads `1 = −1` and `2π = −2π` | the 6.3 generator is the right one |
| 34 | §4.1 dimension 0 | `ℤ` discrete, `K = {0,1}`, `η = 1, 2`; two points with signs `+` and `−` | `1 + 2 = 3` on both sides; `f(a) − f(b)` against a wrong `f(a) + f(b)` | holds |
| 35 | §4.2 boundary formula | `D¹`, `c₊ = 3`, `c₋ = 1`; `[0,1]`, `dx`, `x` | `0 − (3 − 1) = −2`; `1 − (1 − 0) = 0`, with `(dx, x) = d(x, 0)` | holds |
| 36 | §4.2 route | `γ = ρβ` | `(α,β) − d(γ,0) = (α − dγ, (1−ρ)β)`; on `{ρ = 1}`, `α − dγ = α − dβ = 0`; `∫_M dγ = ∫_{∂M} j*β` | holds |
| 37 | §4.2 Hausdorff needed | `[−1,1]` with a doubled `0` | Mayer–Vietoris: `H₁(M) = ker((a,b) ↦ (a+b, a+b)) = ℝ`; `H₁(M,∂M) = ℝ²`; local images `a = b = a + b = s ⇒ s = 0` | no relative class |
| 38 | §5.1 incidence and regularity | `F = x + p`, `j = id` at `((1,2),3)`; `x² + p` against a point | `4 − 2 = 2`; `p = −1`: derivatives `±2`; `p = 0`: `0`; `p = 1`: no zeros | holds |
| 39 | §5.1 `Dj` counts, universal transversality | `x² + p` against `j = id`; `x²` against a point | `(u,v) ↦ 2xu − v` is onto; `(u,q) ↦ 2xu` vanishes at `(0, p)` | as stated |
| 40 | §5.2 Lean, degenerate | `P = 0`; `V = 0`; `F = x²` | `htotal` reduces to slice surjectivity, so the bad set is `∅`; bad set `∅`; `htotal` fails and the bad set is `ℝ` | the hypothesis is needed and suffices |
| 41 | §5.2 local form | `O = (1,2) × ℝ`; `O = (−1,1) × ℝ` | zeros `√(−p)` for `p ∈ (−4,−1)` with derivative in `(2,4)`: bad set `∅`; bad set `{0}` | holds |
| 42 | §5.3 flat theorem, Lean | full derivative `(u,q,v) ↦ Df u + (Dβ u)p + β(x)q − Dj v`; `f = 0`, `β = x²`, `p = 1`, `x = 2`; `V = 0` | `β(x) = 0` at a minimum gives `Dβ(x) = 0`, which reduces to `hgood`; `0 + 4·1 = 4`; `p = 0` with `‖0‖ < r` | holds |
| 43 | §5.3 hypothesis needed | `f = β = x²`, `j = 0` | `(1+p)x²` has derivative `0` at `0` for every `p` | no regular `p` |
| 44 | §5.3 manifold theorem, Lean | line with two origins; discrete `ℝ` as `N` with `j = id`; `M = ∅`; `EM = 0` with countable `M` | bad set `{0}`; bad set `ℝ` with `μ = ∞`; `∅`; contained in `⋃ₓ (j(Crit j) − f(x))/β(x)`, which is null | second countability needed, Hausdorff not |
| 45 | `IsTransverseAt` Checks | `g = 1, j = 0`; `g = 0, j = id`; `g = x², j = 0` | vacuous; `(u,v) ↦ −v` is onto; the zero map at `0` | three wrong models excluded |
| 46 | `IsTransverseAt` dimension bullet | `dim M + dim N < dim V` | the image of `EM × EN` has dimension `< dim V`, so the map is never onto: transverse iff `g x ∉ j(N)` | holds |
| 47 | §5.3 compact, finite order | `‖βp‖_{C^k}` | `= ‖β‖_{C^k}‖p‖`; `‖p‖ < ε/(1+‖β‖)` gives `< ε‖β‖/(1+‖β‖) < ε` | holds |
| 48 | §5.3 corner corollary | `g = g₀ + βp`, `β ≤ 1` | `‖g − f‖ ≤ ‖p‖ + ‖g₀ − f‖ < ε/2 + ε/2`; `g = e` on `C ⊇ ∂D` | holds |
| 49 | Scope `:114–120`, consumer `:1267` (R02) | main `:70–76`; ComplexKahlerGeometry 2b571fb `:2644–2656` | the head and main name this roadmap as owner; the revision consumes it | the folder is sound; the pull-request text is wrong |

## Not verifiable

- **Lee, *Introduction to Smooth Manifolds*, 2nd ed. (`lee`).** Recorded uncertified, so not read. It is cited at:
  - §1.2 and §1.3: Ch. 11, *Conservative Covector Fields*;
  - §2.2: Prop. 2.28 and Thms. 9.24–9.26;
  - §2.4: Thm. 18.7;
  - §3.3: Thm. 18.14;
  - §5.2: Thm. 6.35;
  - §5.3: Thms. 6.35 and 6.36.
- **Bott–Tu, *Differential Forms in Algebraic Topology* (`bott-tu`).** Recorded uncertified, so not read. It is cited at §3.1 (Ch. I, §6) and §4.1 (§5).
- **Open pull requests that the brief gives no checkout for.** DifferentialGeometry #334 (draft), the multi-roadmap #1187, #1797, #1807, #1808 and #1854: ownership against them was not checked beyond `roadmaps grep` for the smooth prism operator, inward domination and relative de Rham theory.
  - None of them claims those objects.
  - #1797's AlgebraicTopology names §4.1 as the owner of the integration comparison, consistent with this head.

## Source issues

- none
