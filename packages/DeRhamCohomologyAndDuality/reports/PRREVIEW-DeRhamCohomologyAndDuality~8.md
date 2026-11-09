# Review of DeRhamCohomologyAndDuality (pull request #2085 at fa6b396)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/DeRhamCohomologyAndDuality/` at fa6b396. Against main, the README has 824 changed lines and `Suggested.lean` 117; nothing changes outside the folder. There are six findings, all P3, and none is blocking. The gate passes and the dependency check is clean. The four findings of the review at 420558d are resolved (see *Verified sound*).

## R01 (P3) — The quadrant Check calls a genuine collar "not a collar"

**Location.** `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:542–543`, a §2.2 Check: "A semiflow is not a collar: on the quadrant the flow of `(1, 1)` is not a product structure near the corner". Also `:970–971`, the bullet "A semiflow of a strictly inward field is a collar. Not for a general convex model".

**Claim.** The Check's own instance is a collar in the sense this roadmap uses: §4.2 works with Tau Ceti's topological collar. So the Check is false, and it does not tell the right object from the wrong one. The bullet under *Statements that must not enter the library* gives no instance that refutes the statement it forbids.

**Witness.** On `Q = [0,∞)²`, `c(p, s) = p + s(1,1)` on `∂Q × [0,1)` is a bijection onto the open set `{min(x,y) < 1}`. Its continuous inverse is `(x,y) ↦ ((x−m, y−m), m)` with `m = min(x,y)`. That is `TauCeti.IsCollar` (Tau Ceti `Geometry/Manifold/Boundary/Collar/Global.lean:46`: an open embedding equal to the inclusion at depth `0`).

**Repair.** Replace the Check with one that says what a semiflow actually fails to give. For example: "on the quadrant the flowout `{(a + s, s)}` of the single face `{y = 0}` along `(1, 1)` misses `(0, t)` for every `t > 0`, so it is not a collar of that face at the corner." Tested: `(0, t) = (a + s, s)` forces `s = t` and `a = −t < 0`. In *Statements that must not enter the library*, either state this face-wise version or delete the bullet. §2.2 keeps at least three Checks either way.

## R02 (P3) — §2.2 cites Lee for the half-space case that GeometricTopology §1.1 already plans

**Location.**

- `README.md:526–529`: "For the half-space model, the flowout of an inward-pointing field, the collar and the homotopy equivalence of a manifold with boundary with its interior are [Lee, Thms. 9.24–9.26, pp. 222–223]".
- Scope, `:71–73`: names GeometricTopology only for "collars, collar uniqueness, tubular neighbourhoods and gluing".

**Claim.** GeometricTopology on main plans the interior of a manifold with boundary as a boundaryless manifold whose inclusion is a homotopy equivalence (its §1.1). `exists_smooth_inward_deformation` implies that statement in the half-space case: `Φ(t, ·)` preserves `N = I.interior M`, so `Φ` restricted to `ℝ × N` joins `r|_N` to `id_N`. The rule is that what a roadmap on main already plans is cited, with one clause saying how the kept variant differs. The README cites the textbook in place of the owner.

**Witness.** `TauCetiRoadmap/GeometricTopology/README.md:809–810` (main, §1.1 Smooth collars): "The interior `M ∖ ∂M` is a smooth boundaryless manifold, and its inclusion is a homotopy equivalence (Lee, Theorem 9.26)." On `[0, ∞)`, `Φ(t, x) = x + (1 − t)²` preserves `(0, ∞)`.

**Repair.**

- At `:71–73`, add: "and, for manifolds with boundary, the smooth collar and the homotopy equivalence of the interior with the manifold (GeometricTopology §1.1)".
- At `:526–529`, write: "For the half-space model, the collar and the homotopy equivalence with the interior are GeometricTopology §1.1's [Lee, Thms. 9.24–9.26]. §2.2 differs in allowing every convex model with corners and in producing the explicit smooth deformation `Φ`."

## R03 (P3) — §4.1's dimension-zero step cites a lemma that needs the whole manifold finite

**Location.**

- `README.md:804–806`: "Dimension zero: … the integral is the signed sum `Σ_{x ∈ K} ε_o(x) α(x)` of `TauCeti.integralTopForm_ofFunction_finite_zeroDim`".
- The bullet this step serves (`:783`) is stated "for `N` compact or not". The contract at `:208` cites the same lemma.

**Claim.** The pinned lemma assumes `[Fintype M]`. A non-compact `0`-manifold is infinite, so the lemma does not give the step that the compact-support bullet uses.

**Witness.** Tau Ceti `Geometry/Manifold/DifferentialForm/Integration/ZeroDim.lean:67`: `theorem integralTopForm_ofFunction_finite_zeroDim [Fintype M]`. Take `N = ℤ` with the discrete topology (Hausdorff, σ-compact, boundaryless, dimension `0`) and `K = {0}`: there is no `Fintype ℤ`.

**Repair.**

- For finite `K` in an arbitrary `N`, cite `TauCeti.integralTopForm_ofFunction_zeroDim` (`ZeroDim.lean:34`: a function supported in a singleton integrates to the orientation sign times its value) once for each point of `K`.
- Sum the pieces with `TauCeti.integralTopForm_add` (`Integration/Regularity.lean:105`; it needs smooth forms with compact support, which every piece is in dimension `0`).
- Keep the finite lemma for compact `N`, and list both lemmas in the contract at `:208`. Both are stated over `𝓘(ℝ, E)` with `Subsingleton E`, so §4.1's passage from the model `I` applies to them.

Tested: on `N = ℤ`, `K = {0}` and the form `g·1_{0}`, the value is `ε_o(0)·g(0)`.

## R04 (P3) — §2.5 describes a route but states no theorem, and §5.3 uses an undefined `B`

**Location.**

- `README.md:622–636` (§2.5): "Source a Hausdorff σ-compact finite-dimensional manifold with corners … For the interval, the closed disc and the square, construct ambient fillings … the form with prescribed collar data is this roadmap's".
- `:933–939` (§5.3): "subordinate to `{B, M ∖ C}` in general. On compact sources: simultaneous transverse perturbations …".

**Claim.** §2.5's target, "the form with prescribed collar data", is never stated with hypotheses and conclusion.

- Its first sentence admits every manifold with corners as the source, while the construction covers three model domains.
- It never says what the output agrees with near `∂D`, in which norm it is close, or what the homotopy fixes.

§5.3 has the same problem:

- It uses `B` and `M`, which the README defines nowhere.
- It lists the compact-source perturbations, finite lists of maps and the straight-line homotopy as targets with no quantifiers.

§5.3's *Needs:* cites §2.5, yet no line of §2.5 states what §5.3 may use.

**Witness.** In the README, `B` as a set occurs only at `:285` (an unrelated compact `B ⊆ A`) and at `:935`. No sentence of `:620–636` has the form "for every … there is …".

**Repair.** Open §2.5 with one statement, for example:

> Let `D` be a compact manifold with corners (or one of `[0,1]`, the closed disc and the square, if that is the intended scope), `V` a finite-dimensional real normed space, `f : D → V` continuous, `e` smooth on an open neighbourhood of `∂D` with `e = f` on `∂D`, and `ε > 0`. Then there is a smooth `g : D → V` equal to `e` near `∂D` with `‖g − f‖ < ε` everywhere. The homotopy `(1 − s)f + sg` fixes `∂D` and stays within `ε` of `f`. If `f(D) ⊆ U` with `U` open, `ε` can be chosen so that `g(D) ⊆ U`.

This is true: blend `e` into `f` by a cutoff that is `1` near `∂D` and supported where `‖e − f‖ < ε/2`, then apply `Continuous.exists_contMDiff_approx_and_eqOn` on a closed collar. §2.5's second Check, the trace `θ ↦ (|sin θ|, 0)`, then fails the hypothesis, because no smooth `e` exists.

In §5.3:

- Replace `{B, M ∖ C}` by a named open cover.
- Give the source `M` its standing hypotheses.
- State the compact-source perturbation theorem with its quantifiers: for which `k`, and uniformly over which finite family of maps.

## R05 (P3) — Layer 1, §2.1 and §4.2 state results with neither a locator nor a provenance clause

**Location.** `README.md:335–479` (Layer 1), `:482–502` (§2.1) and `:838–851` (§4.2). None of these ranges contains `[Lee`, `[Bott–Tu` or "this roadmap's".

**Claim.** Every other target either carries a locator or says it is this roadmap's: §§2.2–2.5, 3.1–3.3, 4.1 and 5.2–5.3 all do. Four results have neither:

- the covering space and the monodromy integral of §1.2;
- the exactness theorem of §1.3;
- the strict inward cone and its gluing in §2.1;
- the boundary formula of §4.2.

**Witness.** Tau Ceti's file for the same covering-space route, `Geometry/Manifold/DifferentialForm/LocalPrimitive.lean:48–50`, cites Lee, 2nd ed., Ch. 11, *Conservative Covector Fields*, and Hatcher, *Algebraic Topology*, §1.3 (covering spaces and the lifting criterion).

**Repair.**

- In §§1.2–1.3, cite the closed-form case at its theorem number in [Lee, Ch. 11, *Conservative Covector Fields*].
- Cite the homotopy lifting property and the lifting criterion at [Hatcher, §1.3]. A legal copy is on the author's page; add the key to *References* and to `sources.toml`.
- Add one clause to §§1.2–1.3: "the generality of forms with local primitives is this roadmap's".
- In §2.1 and §4.2, add a locator or the clause "this roadmap's".

## R06 (P3) — The title and description contradict the head, and leave the order with ComplexKahlerGeometry's open revision unstated

**Location.** The pull request's title, "ComplexKahlerGeometry K6.1 is a supplier, not a consumer", and its description, "the README no longer names K6.1 as a consumer and cites ComplexKahlerGeometry only as a supplier". Compare `README.md:97–99` and `:980–989`.

**Claim.** The head says the opposite:

- it names K6.1 as the consumer of §§2.4, 3.1–3.3 and 4.1;
- it has no supplier contract for ComplexKahlerGeometry: the only `### From TauCetiRoadmap.*` sections, at `:302` and `:311`, are DifferentialGeometry and AlgebraicTopology.

The description also omits a live overlap. ComplexKahlerGeometry's open revision still claims ownership of the same boundaryless instances and names this roadmap as their consumer, and the description's merge-order block is empty.

This is P3 rather than P2 because this folder already records a single owner. That record agrees with K6.1 on main (`TauCetiRoadmap/ComplexKahlerGeometry/README.md:1382, 1396`), with DifferentialGeometry at the open head of #886 (`README.md:58–62`), and with AlgebraicTopology at #1652 head 946a78a (`README.md:100`). It also agrees with the owner choice of 2026-11-06 recorded in the review at 420558d. The remaining second claim is in another pull request's text.

**Witness.** ComplexKahlerGeometry at #1234 head ec3dc78, `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1979–1981`: "K6.1.RelativeIntegration owns these boundaryless open-pair statements; DeRhamCohomologyAndDuality §§2.4, 3.1–3.3 and 4.1 … consume these instances".

**Repair.**

- Rewrite the title and description to describe this head:
  - K6.1 is kept as a consumer;
  - Layer 1 is recast on `TauCeti.IsPrimitiveOn` and `TauCeti.PrimitiveSpace`;
  - §2.4 is stated in `Suggested.lean`;
  - the supplier contracts are moved to Tau Ceti's declarations.
- In the merge-order paragraph, state that ComplexKahlerGeometry's revision #1234, when it rebases, cites §§2.4, 3.1–3.3 and 4.1 in place of its K6.1.RelativeIntegration (i)–(iii). This is an order between pull requests, not a supplier of this roadmap.
- Nothing in the folder changes.

## Verified sound

**Gate, re-run on this head.**

```text
gate DeRhamCohomologyAndDuality: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate adds `build=0`.

**Dependency check (`--movable`, board order, main).**

```text
depcheck: 236 roadmaps, 2281 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The roadmap is at line 395 of 398 in the merge order. Its roadmap suppliers, DifferentialGeometry and AlgebraicTopology, are on main.

**Folder.**

- The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.DG"`).
- The diff outside the folder is empty.
- There are no process words, pull-request numbers or LaTeX delimiters.

**Lean.**

- `lake env lean` on `Suggested.lean` gives exactly five warnings, all `declaration uses sorry`, at lines 59, 79, 118, 154 and 167.
- I ran `#check @` on all 11 declarations in a scratch copy. The elaborated types are identical to the worker's signature listing and match the README's statements.
- The dropped-binder lead on `incidenceEquation` is benign: its body uses only subtraction in `V`, and both theorems that use it carry every `NormedSpace ℝ` and `FiniteDimensional` instance.
- `exists_isPrimitiveOn_univ_of_simplyConnectedSpace` carries `[IsManifold I 1 M] [SimplyConnectedSpace M]` and no finite-dimensionality, Hausdorff or completeness hypothesis, as §1.3 says.
- `IsPrimitiveOn` includes `IsOpen U` (Tau Ceti `LocalPrimitive.lean:70–73`), so the hypothesis `∃ g U, x ∈ U ∧ IsPrimitiveOn φ g U` cannot be met vacuously with `U = {x}`.
- The four imports are each used: `IsRegularParameter`, `IsPrimitiveOn`/`RoughForm`, `smoothSingularSubcomplex` and `smallSingularSubcomplex`.
- There is no `set_option`, `lemma` or sorry'd data, and the abbreviations of §2.4 have real bodies.

**Padding probe.** I replaced each `sorry` in a scratch copy by `first | rfl | simp | infer_instance | trivial | aesop`. All five theorems fail ("unsolved goals" or "aesop made no progress"). None of the five is padding.

**Headline theorems.**

- The Summary lists §§1.3, 2.2, 2.4, 3.3, 4.1, 4.2 and 5.3; §5.2 is also stated.
- Stated in `Suggested.lean`: §§1.3, 2.2, 2.4, 5.2 and 5.3.
- Named in the docstring as not statable:
  - §3.3: the pin has no de Rham cochain map. It has only `TauCeti.SmoothSimplex.integral` (`SmoothSingular/Integral.lean:86`); a grep of Tau Ceti for `deRhamHom`, `chainIntegral` and `integral_mextDeriv` is empty.
  - §4.1: needs that map and AlgebraicTopology 6.3's homological orientation of a tangent orientation. The pinned `TauCeti.localOrientationOfManifoldOrientation` is pointwise, inner-product, positive-dimension only.
  - §4.2: needs both of these and the relative class.
- These reasons are correct at the pin.

**Findings of the review at 420558d.** All four are resolved.

- R01: the K6.1 consumer record is restored at `:93–99` and `:980–989`.
- R02: Layer 1 is now on `TauCeti.IsPrimitiveOn` and `TauCeti.PrimitiveSpace`.
- R03: §2.4 is stated, with the docstring's reasons corrected.
- R04: the contracts cite Tau Ceti's names, and a grep for `smoothSingularChainComplex` and `smoothToSingular` is empty.

**Library declarations, checked at the pins.**

- 117 names cited by the README elaborate under `#check @` with no error: 71 from Tau Ceti and 46 from Mathlib.
- I read ten more in source, because their modules have no object file:
  - `Geometry/Manifold/DeRham/Period.lean:90, 104, 121, 148, 162, 197, 351, 405`: `pathClassIntegral`, which is junk `0` unless `φ` is a closed `C¹` form, and its lemmas;
  - `Algebra/Homology/HomotopyCategory/MappingCocone/Relative.lean:54–136`: the relative coordinates, `relativeCoordinates_d`, the cocycle and coboundary lemmas, and `relativeCoordinates_map`;
  - `Geometry/Manifold/Exhaustion.lean:71`;
  - `Geometry/Manifold/Topology.lean:36`: `ModelWithCorners.locallyPathConnectedSpace`;
  - `Geometry/Manifold/Boundary/Collar/Brown.lean:459`;
  - `Integration/Stokes.lean:37`: Stokes over `𝓡∂ (n+1)`, `C¹`, compact support;
  - `Integration/OpenSubset.lean:71`, `Integration/ZeroDim.lean:34, 67`, `Integration/ChangeOfVariables.lean:228`, `Integration/Path.lean:74`;
  - `DeRham/HomotopyInvariance.lean:105`, `DeRham/SimplyConnected.lean:69`, `DeRham/ExtendByZero.lean:75`.
- Each Mathlib file the contracts name contains the cited name: `Topology/Homotopy/Lifting.lean`, `Analysis/Complex/HasPrimitives.lean`, `Algebra/Homology/HomotopyCategory/ShortExact.lean`, `AlgebraicTopology/SimplicialSet/SSetPair.lean`, `…/Homology/Relative.lean`, both `HomotopyInvariance.lean`, `Topology/Homotopy/TopCat/ToSSet.lean` and `Geometry/Manifold/SmoothApprox.lean`.
- The hypotheses the contracts attribute are as stated:
  - `exists_contMDiffMap_one_nhds_of_subset_interior` carries `[NormalSpace M]`;
  - `exists_contMDiffSection_forall_mem_convex_of_local` carries `[FiniteDimensional ℝ E] [T2Space M] [SigmaCompactSpace M]`;
  - `TauCeti.contMDiffOn_flowOf` needs `[BoundarylessManifold I M]`;
  - `TauCeti.addHaar_image_criticalPoints_eq_zero` has the threshold `(dim E)² + 1`;
  - `TauCeti.localOrientationOfManifoldOrientation` takes `InnerProductSpace` and dimension `n + 1`;
  - `TauCeti.PrimitiveSpace.isCoveringMap_proj` (`LocalPrimitive.lean:280`) uses closedness only through `exists_contMDiff_isPrimitiveOn` (`:265`), as §1.2 says.

**Duplication by object, at the pins.**

- There is no Haar-null form of parametric transversality: the only one is the meagre `isMeagre_setOf_not_isRegularParameter` (`GlobalParametric.lean:83`).
- There are no inward fields or semiflows: a grep for "inward" under `Geometry/Manifold` and in Mathlib's manifolds is empty.
- There is no relative de Rham complex: `Geometry/Manifold/DeRham/` has no relative file.
- There is no absolute smoothing equivalence: only `SmoothSingular/Basic.lean` and `Integral.lean` exist.

**Cross-roadmap citations, resolved.**

- DifferentialGeometry (main):
  - 8.3 (`README.md:836–844`) states the smoothing equivalence under `[IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M] [FiniteDimensional ℝ E]` over any `I`.
  - 8.4 names `SmoothSimplex.integral_mextDeriv`, `chainIntegral` and `deRhamHom`. This resolves the unresolved-name lead at README `:307`.
  - 8.5 states `deRhamEquiv`.
  - 9.3 plans duality only.
- AlgebraicTopology 6.3 (main, `README.md:1285–1300, 1425–1440`) plans the tangent-to-homological comparison through a linear equivalence and `embeddingIntegralLocalMap`, and the oriented relative class of `(M, ∂M)`.
- ComplexKahlerGeometry (main): K6.1 at `README.md:1328, 1382, 1388, 1396` uses the open-pair cone, the relative chain comparison and the compact-support formula under DifferentialGeometry labels, as the README's *Downstream consumers* records. K5a's punctured-plane regression is at `:939`.
- HeegaardFloer F0.S is §2.1 (main, `README.md:1351`).
- GeometricTopology Layer 1 collars are at main `README.md:788–815`.
- TangentialBordism §2.1 (B1.6, #942 head 7022ba9, `README.md:506–514`) proves parametric transversality with a `TauCeti.IsNullSet` of bad parameters, as the README's adjacent paragraph says.

**Ownership against open pull requests.**

- The overlap file lists no dropped ids and no other pull request changing this roadmap.
- I read the closest heads:
  - DifferentialGeometry #886 names this roadmap the owner of relative de Rham theory, the inward cone, domination and relative transversality (`README.md:58–62, 77–80`). It does not consume Layer 1 (`:1816–1817`).
  - AlgebraicTopology #1652 says Layer 5 "states the analogue … by its own route and consumes nothing here" (`README.md:100`). Its 8.13 plans Lebesgue-null parametric transversality (`:3979–3995`). §5.2 is that theorem's flat instance with `Z` the diagonal of `V × V`. It exists only in an open revision, which cannot be cited. README `:78–87` states the instance relation (I checked it: `(D_xF u + a, Dj v + a) = (c₁, c₂)` is solvable iff `D_xF u − Dj v = c₁ − c₂` is) and the route.
  - ComplexKahlerGeometry #1234: see R06.

**Adversarial table.** One row per statement; each lists the instances tried and the values computed on each side.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 local primitives (`IsPrimitiveOn`, open `U`) | `dx` on ℂ; `x dy`; angular form on ℂ∖{0}; `d(|x|^{3/2})`; `d(x² sin(1/x))` on ℝ | `d Re = dx`. For `x dy`: `∂ᵧ∂ₓg = 0` but `∂ₓ∂ᵧg = 1`, so none. Angular: branches of `arg`, but the loop integral is `2π ≠ 0`. `φ = (3/2)sgn(x)|x|^{1/2}dx` is `C⁰`, not `C¹`, yet has a primitive. `x² sin(1/x)` has derivative `0` at `0` and `φ` is discontinuous there. | holds | none |
| §1.2 monodromy integral | unit-circle angular form once, twice and reversed; `dx` along `t + iW(t)`; `d(|x|^{3/2})` on two segments | `2π`, `4π`, `−2π`; `Re 1 − Re 0 = 1`. From `(0,0)` to `(1,0)`: `1`, against `pathClassIntegral`'s junk `0` (`Period.lean:91–95`). From `(−1,0)` to `(1,0)`: `1 − 1 = 0`. | holds; the agreement bullet keeps the closed `C¹` hypothesis | none |
| §1.2 subdivision independence | `[0,3]`, primitive `Re` on `[0,1]` and `Re + 7` on `[1,3]` | `(1 − 0) + (10 − 8) = 3 = Re 3 − Re 0` | holds | none |
| §1.3 `exists_isPrimitiveOn_univ_of_simplyConnectedSpace` | slit plane with the angular form; ℂ with `dx`; `S¹` with `dθ`; empty `M` | `g = arg`; `g = Re + c`; on `S¹` the hypothesis holds and the conclusion fails (period `2π`), so simple connectivity is needed; empty `M` is excluded because `SimplyConnectedSpace` implies nonempty | holds | none |
| §1.3 holomorphic Check | `1/z` on the slit plane and on ℂ∖{0} | the principal `log`; `∮ dz/z = 2πi ≠ 0`; `Complex.IsExactOn.differentiableOn` needs `CompleteSpace` and `IsOpen`, both stated | holds | none |
| §2.1 strict inward cone | `[0,∞)` at `0` with `v = 1, 0, −1`; quadrant at `0` with `(1,1)` and `(1,0)`; an interior point | `ball(t, t/2) ⊆ [0,∞)`. For `v = 0`, `−εt/2 ∈ ball(0, εt)` lies outside. `v = −1` is excluded. `(t, −εt/2) ∉ Q` excludes `(1,0)`, while `(1,1)` is in. At an interior point the cone is all of `E`. | holds | provenance: R05 |
| §2.2 `exists_smooth_inward_deformation` | `[0,∞)` with `r = x + 1` and `Φ = x + (1−t)²`; `[0,1]` with field `1/2 − x`; field `x(1−x)`; boundaryless; empty `M` | `Φ(0,x) = x + 1`, `Φ(1,x) = x`, `Φ > 0` on `(0,∞)`. `r(0) = 1/2 − 1/(2e) ≈ 0.316` and `r(1) ≈ 0.684`. For `x(1−x)`, `r(0) = 0 ∉ (0,1)`. Boundaryless: `r = id`. Empty: vacuous. | holds | none |
| §2.2 Check "a semiflow is not a collar" | `Q`, field `(1,1)` | `c(p,s) = p + s(1,1)` is a bijection onto `{min < 1}` with inverse through `m = min(x,y)`, an open embedding (`TauCeti.IsCollar`) | Check false | R01 |
| §2.2 against GeometricTopology §1.1 | `[0,∞)`, `N = (0,∞)` | `Φ` preserves `N` and joins `r|_N` to `id`, so §2.2 implies GeometricTopology's homotopy equivalence (`:809–810`) | duplicates a planned case | R02 |
| §2.3 transfer | `N = M`, `j = r = id`; `S¹` with `N` a point | gives `s` itself. For `S¹`, `j_* s r_* = 0` on `H₁ ≅ ℝ` while the inclusion is an isomorphism. `i j_* s r_* = j_* i s r_* ≃ (j∘r)_* ≃ id` and `j_* s r_* i = j_* s i r_* ≃ (j∘r)_* ≃ id` use no homotopy `r∘j ≃ id`. | holds | none |
| §2.4 `quasiIso_smoothPairToSingular` | `W = ∅`; `W = X`; `(ℝ, ℝ∖{0})`; `W` the graph of a nowhere-differentiable function (not open) | For `∅`: the small subcomplex is empty, giving DifferentialGeometry 8.3. For `W = X`: both relative complexes are `0`. For `(ℝ, ℝ∖{0})`: `H₁ = H̃₀(W) = ℝ` on both sides, from `t ↦ 2t − 1` with `∂ = [1] − [−1]`, and `H₀ = 0`. For the graph: smooth relative `H₁` contains an uncountable-dimensional reduced `H₀`, singular is `0`. `SSetPair.quasiIso_chainComplexMap` needs exactly the two absolute quasi-isomorphisms. | holds; `IsOpen W` is needed and present | none |
| §2.5 retractions | `r(2)`, `r(−1)`, `r(0.3)`, `r((3,4))` | `1`, `0`, `0.3`, `(0.6, 0.8)` | values hold; no theorem is stated | R04 |
| §3.1 coordinates and `δ` | Mathlib's coordinate `g = −β`; an extension `b̃` | `(dα, α|_W − dβ)` corresponds to `(dα, −α|_W − dg)`. `d(b̃,0) = (db̃, b)`, so `[(db̃,0)] = −[(0,b)]`. | holds | none |
| §3.1 sign witness | `(ℝ, ℝ∖{0})`, `b = 1` on `(0,∞)`, `c = [−1,1]` | Relative integral of `(0,b)`: `0 − (1 − 0) = −1`, so `δ[b]` evaluates to `+1`. Singular: `b̃(1) − b̃(−1) = 1`, since the cochain differential is `Hom(∂, −)` with no sign (Mathlib `CategoryTheory/Abelian/Ext.lean:56–59`). The opposite convention gives `−1`. | holds | none |
| §3.2 lift and evaluation formula | the `ψ dx` example; `K = ℝ²`, `L = ℝ` | `1 − (1 − 0) = 0`, the value of `d(Ψ,0)`. `((k₁,k₂),0) ↦ (0, k₂ + t·k₁)` is a chain map for every `t` (the kernel is `0` in degree `1`), each inducing the inverse of the lift on `H⁰`. | holds | none |
| §3.3 relative de Rham theorem | `(ℝ, ℝ∖{0})`; `(ℝ², ℝ²∖{0})` | `H¹ = ℝ`, with `δ[b] ↦ 1`. `H² ≅ H¹(ℝ²∖{0}) = ℝ`; `−[(0,dθ)]` on a disc is `−(0 − 2π) = 2π`. `H¹(X,W) = coker(H⁰(ℝ²) → H⁰(W)) = 0`. | holds | none |
| §4.1, compact case | `S¹` counterclockwise and clockwise; two points `(+, −)` | `±2π` on both sides; `f(a) − f(b)`, against `f(a) + f(b)` for a convention that ignores point orientations | holds | none |
| §4.1, compact support | ℝ with `K = [−1,1]` and `K′ = [−3,3]` | `t ↦ 4t − 2` has `∂ = [2] − [−2] ⊂ ℝ∖K` and pairing `1`; `t ↦ 8t − 4` gives `1`; `t ↦ 2t − 1` is not a relative cycle; the absolute `deRhamHom[η] = 0` | holds | none |
| §4.1, dimension `0` | `N = ℤ`, `K = {0}` | the cited lemma needs `[Fintype M]` and fails; `ZeroDim.lean:34` plus `integralTopForm_add` give `ε_o(0)g(0)` | wrong citation | R03 |
| §4.2 boundary formula | `D¹` with `α = 0` and `β = c±` near `±1`; `[0,1]` with `α = dx` and `β = x` | `−(c₊ − c₋)` (outward-first: `+` at `1`, `−` at `−1`); `1 − (1 − 0) = 0`, the value of the exact `d(x,0)` | holds | provenance: R05 |
| §5.1 incidence equation and regularity | `F = x + p`, `j = id` at `((1,2),3)`; `F = x² + p` with `j = 0` at `p = −1, 0, 1`; `j = id` | `2`. Regular (derivatives `±2`), not regular (`0`), regular (empty fibre). With `j = id`, `2xu − v` is onto, so every `p` is regular. | holds | none |
| §5.2 `addHaar_setOf_not_isRegularIncidenceParameter` | `x² + p`; `x²` with no `p`; `V = 0`; `P = 0` | Bad set `{0}`, `μ{0} = 0`. For `x²`, the full derivative at `(0,p)` is `0`, so the hypothesis excludes it. For `V = 0`, the bad set is empty. For `P = 0`, universal transversality equals slice transversality, so the set is empty although `μ{0} > 0`. | holds | none |
| §5.3 `exists_isRegularIncidenceParameter_relativeTranslate` | `f = 0`, `β = x²`, `p = 1`, `x = 2`; `β = 0`, `C = E`; `f = β = x²`, `j = 0` | `0 + 4·1 = 4`, and `C = {0}` is fixed. With `β = 0`, `p = 0` is regular iff `hgood`. With `f = β = x²`, `hgood` fails at `0` and every `x²(1+p)` has derivative `0` at its zero `0`. Where `β(x) = 0`, `Dβ(x) = 0` at the minimum, so the family's derivative is `Df(x)u − Dj(y)v`. | holds; `hgood` is needed | statement of the compact-source part: R04 |
| Face-data counterexample (*Statements that must not enter*) | 3-simplex, `Q = x²+y²+z²−2xy−2xz−2yz` | `Q|_{x=0} = (y−z)²` and cyclically. The Hessian has diagonal `2` and off-diagonal `−2`. `Q(t,t,t) = −3t² < 0`. | holds | none |

## Not verifiable

**[Lee]** (Introduction to Smooth Manifolds, 2nd ed.) and **[Bott–Tu]** are recorded in the package's `sources.toml` as `uncertified`: paywalled and cited by locator alone. I read neither text, so these locators are unverified:

- §2.2: [Lee, Prop. 2.28] and [Lee, Thms. 9.24–9.26, pp. 222–223];
- §5.2 and §5.3: [Lee, Thms. 6.35–6.36];
- §2.4 and §3.3: [Lee, Thm. 18.7] and [Lee, Thm. 18.14];
- §3.1: [Bott–Tu, Ch. I, §6];
- §4.1: [Bott–Tu, §5].

Other roadmaps cite the same statements at the same numbers, which is consistent but is not a check against the text:

- DifferentialGeometry on main: Lee 18.7 and 18.14;
- GeometricTopology on main: Lee 9.25 and 9.26;
- TangentialBordism and AlgebraicTopology #1652: Lee 6.35 and 6.36;
- ComplexKahlerGeometry #1234: Bott–Tu §6, p. 78, for the same relative complex `(dα, α|_U − dβ)`.

## Source issues

- none
