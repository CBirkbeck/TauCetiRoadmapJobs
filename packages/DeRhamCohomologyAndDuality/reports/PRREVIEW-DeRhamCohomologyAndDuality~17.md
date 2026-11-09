# Review of DeRhamCohomologyAndDuality (pull request #2085 at e6b4a74)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/DeRhamCohomologyAndDuality/` (README 1260 lines, `Suggested.lean` 229 lines, `metadata.toml`). The head is the one the previous review read, so no text changed in between. Nothing outside the folder changes. The gate passes and `Suggested.lean` elaborates. There is one new blocking defect, in §4.1, and the previous R01 is still unrepaired.

## R01 (P1) — §4.1 names a local orientation of the wrong sign, and the formula is then false in dimension 1

**Location.** `TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:862–867`: "In positive dimension `m` its local orientation at `x` is the image under AlgebraicTopology 6.3's open-embedding local map of `TauCeti.localOrientationOfManifoldOrientation` of the pullback of `o` to its Euclidean rechart".

The same declaration is in §4.1's *Needs:* (`:921`) and in the supplier contract (`:328–330`).

**Claim.** The README fixes `o_h` through Tau Ceti's native chart generator. In dimension 1 that generator is the class of the *decreasing* path. With this `o_h`, the first bullet of §4.1 gives `⟨deRhamHom [dθ], [S¹]_ℝ⟩ = −2π` for the counterclockwise circle, while `∫ dθ = 2π`.

The README's own Checks assume the increasing convention and so contradict the identification:

- `S¹` at `:928`: `2π = ⟨deRhamHom [dθ], [S¹]_ℝ⟩`.
- `ℝ` at `:937–939`: `[ℝ]_K` is represented by `t ↦ 4t − 2`, giving pairing `1`.

The supplier uses the other convention too. AlgebraicTopology 6.3 on main does not use Tau Ceti's native generator:

- `AlgebraicTopology/README.md:1285–1286`: "select the local point generator as the signed image of the actual ordered-simplex identity class under the chart pair map".
- `:1436–1438`: "take C's Euclidean pointGenerator and push it … with embeddingIntegralLocalMap".
- `:1461`: "Verify ∂[D¹]=[+1]−[−1] for the positively oriented interval".
- `:1450–1475` computes the comparison signs (`aₙ`, `σₙ`) between its classes and the native sphere generators.

**Witness.** Tau Ceti fixes the zero-sphere generator as `[-b 0] - [b 0]` (`AlgebraicTopology/Singular/Sphere.lean:493–502`). `localOrientationOfOrientedChart` (`LocalHomology/Orientation/Chart.lean:169–175`) pulls this back through three maps:

1. the reduced connecting map of `(E, E ∖ {p})`, which is Mathlib's `ShortExact.δ` with `∂σ = σ(v₁) − σ(v₀)`;
2. radial projection `z ↦ (z − p)/‖z − p‖` (`Topology/Homotopy/PuncturedStarConvex.lean:253`);
3. excision (`LocalHomology/Basic.lean:170–177`).

For `E = ℝ` with `b 0 = 1`, step 1 forces `σ(v₁) = p − 1` and `σ(v₀) = p + 1`, so the class is the path from `p + 1` to `p − 1`. Tau Ceti's `IntervalGenerator.lean:14–20` records the same sign: its generator "is the **negative** of the relative class of the standard singular simplex `t ↦ t`".

**Computed values (dimension 1).**

| Instance | Native generator | AlgebraicTopology 6.3's generator |
|---|---|---|
| `S¹`, counterclockwise, `η = dθ` | right side `−2π`, left side `2π` | `2π` and `2π` |
| `ℝ`, `K = [−1, 1]`, `η = ψ dx`, `∫ψ = 1` | `−1` against `1` | `1` against `1` |

**Repair.**

1. Replace `README.md:862–867` with: "In positive dimension `m` its local orientation at `x` is AlgebraicTopology 6.3's point generator of the pullback of `o` to its Euclidean rechart, the signed class of the ordered affine simplex of an oriented chart, pushed forward by its open-embedding local map; it is independent of the linear equivalence `E ≃L[ℝ] EuclideanSpace ℝ (Fin m)`."
2. Drop `TauCeti.localOrientationOfManifoldOrientation` from §4.1's *Needs:* (`:921`).
3. In the supplier bullet (`:328–330`), add: "in dimension `1` it selects the class of the decreasing path, the negative of AlgebraicTopology 6.3's point generator, and §4.1 does not use it."
4. Add a negative-control Check to §4.1: "On `ℝ` with the standard orientation, `TauCeti.localOrientationOfManifoldOrientation` at `0` is the class of the simplex from `1` to `−1`: Tau Ceti's zero-sphere generator `[−1] − [1]` under the connecting map. A formula through it gives `−1` on `ψ dx` and `−2π` on `S¹`."
5. Optionally, in `Suggested.lean:33–36`, say that this declaration has the opposite sign in dimension 1.

Tested on the refuting instances with AlgebraicTopology 6.3's generator at `m = 1`:

- The local image of `t ↦ 4t − 2` at each `x ∈ K` is `+1`, and the pairing is `∫_{−2}^{2} ψ = 1 = ∫ψ dx`.
- `S¹` gives `2π = 2π`.
- The dimension-0 Checks (`f(a) − f(b)`, and `3 = 3` on `ℤ`) are unchanged, since AlgebraicTopology 6.3 at `:1349–1350` already uses `orientationSignAt o x • positivePointClass x` there.

## R02 (P3) — The pull-request title and description contradict this head and state no order with ComplexKahlerGeometry's revision

**Location.** The title is "ComplexKahlerGeometry K6.1 is a supplier, not a consumer". The description says "the README no longer names K6.1 as a consumer and cites ComplexKahlerGeometry only as a supplier".

At this head:

- `README.md:1229` reads "ComplexKahlerGeometry K6.1 (analytic cycles) consumes the boundaryless instances of §§2.4, 3.1–3.3 and 4.1".
- `README.md:114–120` makes this roadmap their single owner.
- ComplexKahlerGeometry appears only as an adjacent roadmap (K5a, `:110–112`), never as a supplier.

**Claim.** The folder keeps main's ownership: on main, this roadmap's `README.md:72–76` and `:695` already make it the owner and K6.1 the consumer. The pull request's text says the opposite.

ComplexKahlerGeometry's open revision (#1234 at a6ec295) claims the same boundaryless statements for itself and makes this roadmap their consumer. The two heads hand §§2.4, 3.1–3.3 and 4.1 to each other, and the description does not say which way it resolves.

**Witness.** ComplexKahlerGeometry at a6ec295, `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1979–1982`: "K6.1.RelativeIntegration owns these boundaryless open-pair statements; DeRhamCohomologyAndDuality §§2.4, 3.1–3.3 and 4.1 … consume these instances."

**Repair.** No change in the folder.

- Rewrite the title and description to describe this head:
  - K6.1 stays a consumer.
  - Layer 1 is rebuilt on `TauCeti.IsPrimitiveOn` and `TauCeti.PrimitiveSpace`.
  - §2.4 is stated in `Suggested.lean`.
  - `IsTransverseAt` and the manifold Haar-null theorem are new.
  - §4.2 assumes Hausdorff `M`.
- In the merge-order block, state that ComplexKahlerGeometry's revision, when rebased, cites §§2.4, 3.1–3.3 and 4.1 here. This roadmap already owns them on main, so the open revision cites it.

Tested: the rewritten text agrees with `README.md:1229` at this head and with `:695` on main.

## Previous findings

- **Previous R01 (title and description): not repaired.** The head and the pull-request text are the same as at the previous review (the change file reports 0 changed lines). ComplexKahlerGeometry a6ec295 `:1979–1982` still claims ownership. This is R02 above.

## Verified sound

### Gate, dependency check, Lean

**Gate.** Re-run at this head with `--base origin/main`. Every count is `0`, ending in `OK`; the worker's run also has `build=0`.

**Dependency check (`--movable`).** Output: `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.

- The roadmap is at line 397 of the 400-line merge order.
- It is on main, and its suppliers, DifferentialGeometry and AlgebraicTopology, are on main.
- TangentialBordism (order line 14, not on main) is named only as an adjacent roadmap, never as a supplier.

**Lean.** `lake env lean` on `Suggested.lean` exits 0 with exactly six `declaration uses 'sorry'` warnings, at lines 62, 82, 121, 157, 171 and 216.

- Imports: `Mathlib` plus four Tau Ceti modules, all built.
- No `set_option`, no `lemma`, no sorry'd data.

**Elaborated signatures.** A scratch copy with `#check @` for all 13 declarations elaborates (exit 0), and each type matches its README statement.

- The only dropped binders are the four `[NormedSpace ℝ _]` on `incidenceEquation`, which uses only subtraction. That is harmless, and nothing changed.

**Padding probe.** Each of the six `sorry`s was replaced by `first | rfl | infer_instance | (simp; done) | trivial`. All six fail (`Pad.lean` errors at 66, 88, 124, 165, 181 and 225).

- The 7 definitions are needed to state the headlines: the §2.4 pair abbrevs, `incidenceEquation`, `IsRegularIncidenceParameter`, `relativeTranslate` and `IsTransverseAt`.
- Nothing is padding.

### Headline theorems

The Summary lists 1.3, 2.2, 2.4, 3.3, 4.1, 4.2 and 5.3.

- **Stated:** 1.3, 2.2, 2.4, 5.2, and 5.3 in its flat and manifold forms.
- **Named as not statable:** 3.3, 4.1 and 4.2.
  - I confirmed that Tau Ceti has no Stokes theorem for smooth simplices and no de Rham cochain map at the pin. `SmoothSingular/` contains only `Basic.lean` and `Integral.lean`, and a grep for `deRhamHom`, `chainIntegral` and `integral_mextDeriv` there finds nothing.
  - There is also no `HomologicalOrientation` built from a `Manifold.Orientation`.

### Library names

All 154 non-roadmap backticked names in the README were checked at the pins.

- 128 elaborate with `#check`.
- The other 26 live in Tau Ceti modules without object files. Each was found declared at the cited file:
  - `MappingCocone/Relative.lean:54,76,103,113,136`
  - `Collar/Brown.lean:459`
  - `DeRham/Period.lean:90,104,121,148,162,197,313,351,405`
  - `Integration/Stokes.lean:37`, `OpenSubset.lean:71`, `ZeroDim.lean:34,67`, `ChangeOfVariables.lean:228`, `Path.lean:74`
  - `Exhaustion.lean:71`
  - `DeRham/SimplyConnected.lean:69`, `HomotopyInvariance.lean:105`, `ExtendByZero.lean` (namespace `compactlySupportedDeRhamComplex`)
  - `SmoothSingular/Integral.lean:86`
  - `Geometry/Manifold/Topology.lean:36`

### Hypotheses the README attributes to library declarations

Each was read from the elaborated type or the source:

- `Continuous.exists_contMDiff_approx_and_eqOn`: T2, σ-compact, finite-dimensional model, a target that is only a real normed space, `U ∈ 𝓝ˢ S`.
- `exists_contMDiffMap_one_nhds_of_subset_interior`: needs `[NormalSpace M]`, as the README says.
- `exists_contMDiff_zero_iff_one_iff_of_isClosed`: an exact zero set.
- `IsOpen.exists_contDiff_support_eq`: support equal to `s`, values in `[0, 1]`.
- `IsCoveringMap.existsUnique_continuousMap_lifts`: a simply connected, locally path-connected source.
- `exists_contMDiffSection_forall_mem_convex_of_local`.
- `TauCeti.IsPrimitiveOn` (`LocalPrimitive.lean:70`): carries `isOpen`, so §1.3's hypothesis cannot be met by a singleton `U`.
- `TauCeti.PrimitiveSpace`: defined for every `φ`, with no closedness.
- `isCoveringMap_proj`: assumes a finite-dimensional Hausdorff manifold, complete `F` and a closed `C^r` form.
- `pathClassIntegral`: junk value `0` off closed `C¹` forms (`Period.lean:90–96`).
- `TauCeti.IsRegularParameter` (`GlobalParametric.lean:63`): the full derivative composed with `inl`.

### Cross-roadmap citations resolved

**On main:**

- DifferentialGeometry 8.3: smoothing under `[IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M] [FiniteDimensional ℝ E]`, on a charted space.
- DifferentialGeometry 8.4 (`chainIntegral`, `deRhamHom`), 8.5 (`deRhamEquiv`), 9.3 (duality only), 10 and 11. All are at `DifferentialGeometry/README.md:816–906`.
- AlgebraicTopology 6.3:
  - `:1285–1350` gives the point generator and dimension-0 sign.
  - `:1360–1369` gives the smooth-boundary class for Hausdorff second-countable `M` over `𝓡∂ m`, `m > 0`, through Brown's collar.
- ComplexKahlerGeometry K6.1 cites DifferentialGeometry labels (`:1382`, `:1388`, `:1396`), as the README's *Downstream consumers* says.
- GeometricTopology and HeegaardFloer are on main.

**At open heads:**

- DifferentialGeometry dabafb8 states 8.3 on Tau Ceti's `smoothSingularSubcomplex` (`:2127–2137`) and lists this roadmap as a consumer only.
- TangentialBordism 4e86746 §2.1 (`:480–640`): parametric transversality to a closed embedded `Z` with an `IsNullSet` of bad parameters, on Hausdorff manifolds. This matches the README's comparison at `:84–108`.
- AlgebraicTopology db70d31 `:107` (8.13 is a different object, and it says this roadmap's Layer 5 "consumes nothing here") and `:4537`: supply only, no conflict.
- AlgebraicTopology #1797 `:96`, `:2275`: this roadmap consumes the classes and owns the integration comparison, which agrees.

**Dropped ids.** This pull request drops `HasLocalPotentials`, `exists_hasFDerivAt_of_simplyConnected` and the old headings "Local potentials" and "The cone of a surjection". `roadmaps grep` over main and the 457 open heads finds no citation of any of them. The overlap file lists no dropped or revision-only id.

### Ownership

Ownership against open pull requests was checked with `roadmaps grep` and the sibling checkouts named above. Searching the pinned Tau Ceti and Mathlib finds no existing:

- inward cone or field;
- relative de Rham complex;
- relative smooth chains;
- global primitive for forms with local primitives;
- Haar-null regular parameters;
- transversality against a map.

The only two-owner conflict is R02.

### Sources (seeded sample)

- **Hatcher**, `hatcher` line 2676 (Prop. 1.30, homotopy lifting), line 2723 (Prop. 1.33, the lifting criterion for path-connected, locally path-connected `Y`) and line 2758 (Prop. 1.34, uniqueness of lifts on connected `Y`). These support §§1.2–1.3 as written.
- **§§2.3, 2.5, 3.2 (cocone sign), 5.1 and 5.3's relative-translation forms** are claimed as this roadmap's own, and their routes are checked in the table.
- **Lee and Bott–Tu** are under *Not verifiable*.

### Adversarial pass

Values are computed on each side.

| # | Statement | Instances | Values computed | Result |
|---|---|---|---|---|
| 1 | §1.1 local primitives | `x dy` on `ℂ`; `d(x² sin(1/x))` on `ℝ`; `dx` | mixed partials `0` vs `1`, so none; `φ(0) = 0`, `φ(1/(2πn)) = −1`, discontinuous but with primitive; `g = Re` | holds; Checks discriminate |
| 2 | §1.2 integral | angular form once, twice, reversed; `dx` on `0 → 3` split at `1` | `2π`, `4π`, `−2π`; `(1 − 0) + (10 − 8) = 3` | holds |
| 3 | §1.2 vs `pathClassIntegral` | `d(\|x\|^(3/2))` on `(0,0) → (1,0)` | ours `1`; Tau Ceti junk `0` (`Period.lean:96`) | Check correct |
| 4 | §1.3 Lean | `S¹` with `dθ`; slit plane; `[0, 1]` with `d(\|x − ½\|^(3/2))`; singleton `U` | loop `2π ≠ 0` (excluded, not simply connected); `arg`; `\|x − ½\|^(3/2)`; `IsPrimitiveOn.isOpen` rules out `U = {x}` | holds |
| 5 | §1.3 holomorphic Check | `1/z` | principal `log`; `∮ dz/z = 2πi` on `ℂ ∖ 0` | holds |
| 6 | §2.1 cone, openness | half-line at `0`; parabola `C = {b ≥ a²}`, `x₀ = 0`, `v = (1, 0.001)` | `ball(t, εt) ⊆ C` iff `ε ≤ 1`; `v ∈ cone(a, a²)` iff `0.001 − 2a > 0`, i.e. `a < 0.0005`, a neighbourhood; `v ∈ cone(x)` iff `x + t₀v ∈ int C` | holds for every convex `C` |
| 7 | §2.1 local field | `ball(q, 2ε₀) ⊆ C`, `‖y − x‖ < ε₀` | `z = q + y − x` gives `ball(z, ε₀) ⊆ C` | holds |
| 8 | §2.2 Lean | `[0, ∞)`; `[0, 1]` with `½ − x`; boundaryless | `Φ(0, x) = x + 1`, `Φ(1, x) = x`; `r(0) = 0.316`, `r(1) = 0.684`; `r = id` | holds |
| 9 | §2.2 persistence | boundary `z`, `z + sX ∈ int C` | `dist(z − sX, C) ≥ εs`, so no interior trajectory hits `∂C` | holds |
| 10 | §2.2 quadrant Check | `ψ(s, p) = p + s(1, 1)` | `∂ₓm` is `1` and `0` across the diagonal; `(0, t) = (a + s, s)` forces `a = −t` | holds |
| 11 | §2.3 transfer | general triple; `S¹`, point | `i j_* s r_* ~ (jr)_* ~ id`; `j_* s r_* i ~ (jr)_* ~ id`; `H₁`: `0` vs `ℝ` | holds; hypothesis necessary |
| 12 | §2.4 Lean | `(ℝ, ℝ ∖ 0)`; `W = ∅`; `W = X`; graph `W` | relative `H₁ = ℝ`, `H₀ = 0`; absolute; `0`; smooth `H₁` is uncountable-dimensional vs singular `0` | holds; openness necessary |
| 13 | §2.5 route | general | `‖g − f‖ < ε/2 + ε/2`; `h = f` off `T ⊆ O′` | holds |
| 14 | §2.5 Checks | retractions; disc trace; `Q` | `r(2) = 1`, `r(3, 4) = (0.6, 0.8)`; `\|sin θ\|` not differentiable at `0`; `Q(t, t, t) = −3t²` | holds |
| 15 | §3.1 sign | `(ℝ, ℝ ∖ 0)`, `b = 1_{(0,∞)}` | `−(b(1) − b(−1)) = −1`, so `δ[b]` gives `1 = b(∂c)`; Mathlib/Tau Ceti cochain `d = ∘∂`, no sign | holds |
| 16 | §3.2 lift sign | `b`, `b̃` | `(db̃, 0) + (0, b) = d(b̃, 0)` | holds |
| 17 | §3.2 evaluation | `ψ dx`, `β = Ψ\|_W` | `1 − (1 − 0) = 0` | holds |
| 18 | §3.2 cocone to kernel | `ℝ² → ℝ` | `t = 0` and `t = 1` both give chain maps; `H⁰` cocycles `{((0, k₂), 0)}` | holds |
| 19 | §3.3 | `(ℝ, ℝ ∖ 0)`; `(ℝ², ℝ² ∖ 0)` | `ℝ²/ℝ = ℝ`; `−(0 − ∮dθ) = 2π`; `H¹ = 0` | holds |
| 20 | §4.1, R01 | `S¹`; `ℝ`, `K = [−1, 1]` | native: `−2π` vs `2π`, and `−1` vs `1`; AlgebraicTopology 6.3: `2π = 2π`, `1 = 1` | false as written; repair tested |
| 21 | §4.1 dim 0 | `ℤ`, `K = {0, 1}`, `η = 1, 2` | `1 + 2 = 3` both sides | holds |
| 22 | §4.2 | `D¹` with `c₊ = 2`, `c₋ = 5`; `[0, 1]` with `dx, x` | `3 = 3`; `1 − 1 = 0` | holds |
| 23 | §4.2 doubled origin | `[−1, 1] ∪ {0′}` | `H₁(M, ∂M) = ℝ²`; `a = b = a + b = s` forces `s = 0` | Hausdorff hypothesis necessary |
| 24 | §5.1 | `x + p` at `((1, 2), 3)`; `x² + p` | `2`; `p = −1` regular (`±2`), `0` not, `1` vacuous; with `j = id`, `2xu − v` onto | holds |
| 25 | §5.2 Lean | `x² + p`, `j = 0`; `x²`; `V = 0` | bad set `{0}`, measure `0`; derivative `(u, q) ↦ 0` at `(0, p)`, hypothesis fails; `∅` | holds |
| 26 | §5.3 flat Lean | `f = x`, `β = x²`, `j = 0`; `f = β = x²` | zeros `0` and `−1/p`, derivatives `1` and `−1`: every `p` regular; translates `x²(1 + p)` have derivative `0` at `0`, every `p` bad | holds; hypothesis necessary |
| 27 | §5.3 manifold Lean | `ℝ`, `x²`, `β = 1`; two origins; discrete `N = ℝ`; `M = ∅` | `{0}`; `{0}`; every `p` bad, measure `∞`; `∅` | holds; second countability necessary |
| 28 | `IsTransverseAt` | `g = 1, j = 0`; `g = 0, j = id`; `g = x²` at `0` | vacuous; `−v` onto; zero map | holds |
| 29 | `relativeTranslate` | `f = 0`, `β = x²`, `p = 1`, `x = 2` | `4`; fixes `C = {0}` | holds |
| 30 | §5.3 corners target | `C ⊆ O₀`, cutoff `β` | `‖g − f‖ < ‖p‖ + ε/2 < ε`; `g = e` on `int C ⊇ ∂D` | holds |

## Not verifiable

- **Lee, *Introduction to Smooth Manifolds*, 2nd ed. (`lee`).** It is recorded `uncertified` (paywalled) in the manifest and was not read. The cited locators are Prop. 2.28, Thms. 6.35, 6.36, 9.24–9.26 (pp. 222–223), 18.7 and 18.14, and Ch. 11 *Conservative Covector Fields*. They are cited at §§1.2, 1.3, 2.2, 2.4, 3.3, 5.2 and 5.3. None was checked against the text.
- **Bott–Tu, *Differential Forms in Algebraic Topology* (`bott-tu`).** It is recorded `uncertified` and was not read. Ch. I, §5 is cited at §4.1 and §6 (relative de Rham theory) at §3.1.

## Source issues

- none
