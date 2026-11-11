# Review of LorentzianGeometry (design, round 6)

**Verdict:** needs changes

Three findings: one P2 (two API bullets, and three `plan.json` API statements, that are false without the Lorentzian hypothesis their neighbours carry) and two P3 (a source locator cited for statements the passage does not make; a junk dimension `n − 1` in the double null metric). All three are wording repairs of a few words; no construction, layer or supplier changes. Both repairs of round 5 are verified.

Files reviewed, read-only: `packages/LorentzianGeometry/design/README.md` (691 lines), `packages/LorentzianGeometry/design/plan.json` (5 layers, 34 targets, 98 tests, 0 gaps, baselines equal to `lake-manifest.json`), `packages/LorentzianGeometry/sources.toml` (17 entries, unchanged by this review). This is a design: there is no `Suggested.lean`, so elaboration, the `#check` comparison and the one-tactic padding probe do not apply, and this lane does not elaborate. No maintainer notes were left. No text read this round contained instructions. No source was fetched and no `needs-references.toml` was written.

## R01 (P2) — two API facts are stated without the Lorentzian hypothesis and are false for a general form

Location: `packages/LorentzianGeometry/design/README.md` line 106 (§1.1), "The restriction of `b` to a subspace `W` is Lorentzian iff it is nondegenerate and `W` contains a timelike vector."; line 143 (§1.3), "Null vectors exist iff `dim V ≥ 2`."; `plan.json` 1.1 API `IsLorentzian.restrict_iff` and `IsLorentzian.not_isOrtho_of_isTimelike`, 1.3 API `IsLorentzian.exists_isNull_iff`.

Claim: both hold for the `b` of their section. In §1.1 the list is about an arbitrary `b : LinearMap.BilinForm ℝ V` (bullets 1, 3 and 4 characterise when `b` is Lorentzian; bullets 2 and 5 say "If `b` is Lorentzian", "of a Lorentzian form"); in §1.3 the predicates are defined "for any `b`" and the two bullets before line 143 say "For Lorentzian `b`".

Witness: `b = diag(−1, −1, 1)` on `ℝ³`, `W = ℝ³`: the restriction is nondegenerate and `b(e₀, e₀) = −1 < 0`, but `sigNeg = 2`, not Lorentzian (the README's own §1.1 Check 3). Euclidean `b` on `ℝ²`: `dim V = 2`, `b(v, v) = |v|² > 0` for `v ≠ 0`, no null vector. For the `plan.json` text of `not_isOrtho_of_isTimelike` ("An orthogonal family of timelike vectors has at most one member"): `e₀ ⊥ e₁` for `diag(−1, −1, 1)`, both timelike.

Repair: line 106: "For Lorentzian `b`, the restriction of `b` to a subspace `W` is Lorentzian iff it is nondegenerate and `W` contains a timelike vector." Line 143: "For Lorentzian `b`, null vectors exist iff `dim V ≥ 2`." In `plan.json`, prefix the three API statements with "For Lorentzian b,". Tested on the refuting instances: `diag(−1, −1, 1)` and the Euclidean form are not Lorentzian, so both are excluded; for Lorentzian `b`, `sigNeg(b|_W) ≤ sigNeg(b) = 1` and a timelike vector gives `≥ 1`; in dimension 1 every nonzero vector is timelike, in dimension `≥ 2` `e₀ + e₁` is null in a diagonalising basis.

## R02 (P3) — `chrusciel2011` (2.2.1)–(2.2.3) is cited for statements it does not make

Location: README line 365 (§3.1, definition of a Levi-Civita connection), line 383 (§3.2, "`oneill1983` Ch. 3, the fundamental theorem; `chrusciel2011` §2.2, (2.2.1)–(2.2.3), lines 186–193, p. 5"), line 406 (§3.4, "`oneill1983` Ch. 3, curvature; `chrusciel2011` §2.2, (2.2.2)–(2.2.3), lines 186–193, p. 5").

Claim: the passage supports the definition of a Levi-Civita connection, its existence and uniqueness, and the definitions of the curvature, Ricci and scalar tensors.

Witness: `chrusciel2011` lines 186–193 are the geodesic equation (2.2.1), the coordinate formula for the Christoffel symbols (2.2.2) and the components of the metric and of its inverse (2.2.3). No torsion, compatibility, uniqueness or curvature appears; the first occurrence of "Riemann tensor" in the text is line 354, in another context. The only source for the three statements is the uncertified `oneill1983` Ch. 3.

Repair: at lines 365 and 383 write "`oneill1983` Ch. 3, the fundamental theorem; for the Christoffel symbols of that connection in coordinates, `chrusciel2011` §2.2, (2.2.2)–(2.2.3), lines 188–193, p. 5"; at line 406 write "`oneill1983` Ch. 3, curvature; for the Christoffel symbols entering the chart formula, `chrusciel2011` §2.2, (2.2.2)–(2.2.3), lines 188–193, p. 5". The same locator in §3.3 and §3.5 (Christoffel formula, geodesic equation) is correct and stays. The `sources.toml` entry keeps 3.1, 3.2 and 3.4 in `cited_for` (the passage is still cited there, for the Christoffel symbols).

## R03 (P3) — the double null metric uses `ℝ^{n−1}` with no lower bound on `n`

Location: README line 320 (§2.5), "on an open set of `ℝ_u × ℝ_v × ℝ^{n−1}`".

Claim: the construction is stated in the standing dimension `dim = n + 1` of Conventions, which imposes no lower bound ("No lower bound is imposed", line 22).

Witness: `n = 0`: `n − 1` is `0` in `ℕ`, giving a 2-dimensional space in a 1-dimensional setting; a 1-dimensional manifold carries no pair `u, v` with independent differentials.

Repair: "for `n ≥ 1`, … on an open set of `ℝ_u × ℝ_v × ℝ^{n−1}`" (or index the transverse factor by `m` with `dim = m + 2`). Tested: `n = 1` gives the two-dimensional Check (`−2(du ⊗ dv + dv ⊗ du) = 4(−dt² + dx²)`), with empty `γ`.

## Repairs of round 5, finding by finding

| Id | Status | Repaired passage and check |
|---|---|---|
| F01 (P2) RiemannianGeometry section name | repaired | Line 85: "Section "Conventions", which fixes the curvature convention `R(X,Y)Z = ∇_X∇_Y Z − ∇_Y∇_X Z − ∇_[X,Y] Z`, and R1, "Intrinsic curvature calculus and normal-coordinate jets", with its positive-definite curvature identities". On main (`c9dea9d`): `TauCetiRoadmap/RiemannianGeometry/README.md:127` `## Conventions`, `:140` the formula, verbatim; `:863` `### R1. Intrinsic curvature calculus and normal-coordinate jets`; `:865–880` "1.1 Curvature identities" (first Bianchi, metric skew symmetry, pair interchange). `plan.json` supplier `sections: ["Conventions", "R1"]`. |
| F02 (P3) `IsCoveringMap.inducedChartedSpace` | repaired | Lines 15, 44, 60, 73, 512, 517, 553 now cite Tau Ceti's `IsLocalHomeomorph.chartedSpaceComap` family and Mathlib's `IsCoveringMap.isLocalHomeomorph`; "inducedChartedSpace" occurs nowhere in the README or `plan.json`. At the pin, `TauCeti/Geometry/Manifold/Instances/Comap.lean`: `:71` `noncomputable def chartedSpaceComap` (`@[instance_reducible]`, a `def`), `:101` `isManifold_chartedSpaceComap [IsManifold I n B]`, `:124`, `:139`, `:147`, `:155` the four lift criteria (`ContMDiff I' I n f ↔ Continuous f ∧ ContMDiff I' I n (p ∘ f)`), `:173` `isLocalDiffeomorph_chartedSpaceComap`, `:194` `compatible_chartedSpaceComap [IsManifold I n B] [c : ChartedSpace H M] [IsManifold I n M] (hpc : IsLocalDiffeomorph I I n p)`; `Mathlib/Topology/Covering/Basic.lean:339` `protected theorem isLocalHomeomorph` in `namespace IsCoveringMap` (`:308`). DifferentialGeometry on main: `:1149` "2.3 Smooth structures on covers", naming these declarations (`:1153–1164`). `plan.json` 4.4 lists the five library prerequisites and `roadmap:DifferentialGeometry Layer 2.3`. |

Adversarial re-check of the changed passages: rows marked "r6" below. The repaired patterns were searched for in the rest of the design: every other supplier heading and id re-resolved on main (list below); no other backticked name of a supplier roadmap that the pinned libraries do not declare (the script below found all 102 cited library names).

## Verified sound

**Principles.** No route-specific shortcut: statements hold in every dimension (dimension 1 and the empty manifold are Checks) and Layer 3 in every signature. No re-planned roadmap: the smooth nondegenerate Levi-Civita theory is consumed from HopfRinow Layer 1 (`Completed/HopfRinow/README.md:265`) as the pinned Tau Ceti implements it. One direction of supply (gate below). No copied passage in the sampled sections (each compared with its source lines). No algorithm, no sorry'd data, no `set_option`. No LaTeX delimiters, pull-request numbers, dates, round labels or machine paths in the README (grep: zero hits; "removed", "optional", "deferred", "for later" do not occur).

**Gate.** Output:

```
candidate: LorentzianGeometry is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 230 roadmaps, 2065 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Suppliers: HopfRinow (completed, on main), DifferentialGeometry, PDE, RiemannianGeometry (on main), PseudodifferentialOperators and LocalVariationalFieldTheory (on main and earlier in the merge order); none is on the never-cite list.

**Supplier citations resolved on main (`c9dea9d`).** HopfRinow `Completed/HopfRinow/README.md:265` ("Nondegenerate Levi-Civita supplier"); DifferentialGeometry `:203` ("Boundary and corners"), `:1149` (2.3), `:2848` (12.2, `TauCeti.Manifold.mgradient`), `:2871` (12.3, divergence, Hessian, Laplacian); PDE `:996` (§1.7; `C^{k,α}_loc(Ω)` defined there with its compact-exhaustion topology, and the pinned `TauCeti.HolderSpace`, `TauCeti.C1HolderSpace` named); PseudodifferentialOperators `:164` (P1.0), `:432` (`σ_geom(P)(df) = (1/m!)[…[P,f],…,f]`), `:446` (`σ_F(∇*∇) = |ξ|²`, `σ_geom = −|ξ|²`, so the Fourier symbol is `i²σ_geom`), `:1337` (§5.4); RiemannianGeometry `:127`, `:140`, `:863`; LocalVariationalFieldTheory `:601` (§3.8), `:612` (`η=diag(+1,−1,−1,−1)`), `:150` (LVF1–LVF6).

**Overlaps.** `scratch/overlaps.md`: no other open pull request changes this roadmap, drops an id it cites, or defines an id only in a revision. Closest roadmaps (RicciFlow, ManifoldOptimization, PositiveMass, RelativisticQuantumFieldTheory, NoncompactQuantumSymmetry): Riemannian or fixed Minkowski space. `scratch/citations.md`: 13 Lean names found nowhere, all this roadmap's own targets (design stage); no cross-roadmap citation found nowhere.

**Ownership by object** (`roadmaps grep -i`, main and the open heads): `IsLorentzian`, `LocallyHolder`, `TimeOrientation`, `IsHypersurface`, "causal curve", "optical function": no match anywhere; "Lorentzian metric": only HopfRinow `:299` (a consumer note); "time orient": NoncompactQuantumSymmetry (orbit dictionary on a fixed quadratic space) and LocalVariationalFieldTheory `:1037` (a chosen time orientation as data of LVF6); "null hypersurface": one unrelated hit. No second owner. `IsLeviCivitaFor` and "acoustical": no match anywhere. Board index: three packages (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory), none Lorentzian. `CompressibleEulerEquations` is on no branch read; `target.md` lines 230–235 name it as a planned target, and the README uses it only as a consumer.

**Pinned declarations.** A script checked every declaration of the two contracts against its cited file and line at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, the checkouts' `HEAD`s): 102 names, 102 found at the cited line (within three lines for attributes), including the two paracompactness instances at `Paracompact.lean:285, 298`. Read in full this round: `Comap.lean:60–205`; `Covering/Basic.lean:300–345`; `realCliffordWeight` (`RealForm/Basic.lean:107`: `1` for `i < p`, else `−1`) and `realCliffordForm` (`:113`, on `Fin (p + q) → ℝ`); `ContDiffPointwiseHolderAt` (`Pointwise.lean:55`: `α : I`, the unit interval, `ContDiffAt ℝ k f a` and a big-O bound on `iteratedFDeriv`; it does not include a neighbourhood bound, which is the README's distinction); `laplaceBeltrami` (`Laplacian.lean:238`, "sign convention `Δ = div ∘ grad`", `[IsManifold I 2 M]`, `RiemannianBundle`); `CkHolderSpace` (`Iterated.lean:98`).

**Sources, the seeded sample** (cached line-numbered texts; printed pages from the page markers and running heads). All fifteen targets:

- §1.4, §1.5: `chrusciel2011` 84–98, printed p. 3 (two components, stability under addition, (2.1.1) at 97) ✓; `minguzzi2019` 308–314, p. 7 ✓; `minguzzi2019cone` 236–244 (two convex sharp cones; connected time-oriented = spacetime) ✓.
- §1.6: `minguzzi2019` Theorem 1.2 at 336–348, p. 8; Theorem 1.3 at 349–368, pp. 8–9; Corollary 1.4 at 371, p. 9 ✓. The source states both for nonzero causal vectors and remarks (334–335) that they extend to zero; the README's "linearly dependent" on the closed cone is that extension.
- §1.7, §5.2: `galloway2004` 174–182, p. 5 (degenerate pullback, one-dimensional null space, `K_p^⊥ = T_pS`, non-parallel tangent vectors spacelike, `K` unique up to positive scale; smooth, `n ≥ 2`) ✓.
- §1.9: `minguzzi2019` 296–300 ✓; `luoyu2023` 95 (acoustical metric) ✓; `luoyu2023b` 211–214 (`L = ∂_t + (v ± c)∂_x` null) ✓.
- §2.1: `chrusciel2011` footnote 2, 234–236, p. 6 ✓.
- §2.5: `sbierski2018` Remark 2.3, 281–284, p. 7 ✓; Definition 2.15, 475–478, p. 11 ✓; `chrusciel2011` Proposition 2.1.3, 163–171, p. 5 ✓; `rodnianskishlapentokhrothman2023` 263 ✓.
- §3.2, §3.4: `chrusciel2011` 186–193 is correctly located but does not contain the cited statements: R02.
- §3.3: `chrusciel2011` (2.2.2)–(2.2.3) at 188–193, p. 5, and 201–203, p. 6 (`C^{1,1}` gives Lipschitz Christoffel symbols) ✓.
- §3.6: `chrusciel2011` 201–207, p. 6 ✓; footnote 2, 232–233 ✓; §2.5.1, 1305–1306: the passage is on the 35th sheet, running head offset 4, so printed p. 31 ✓; `minguzzi2019cone` 81–83 ✓; `minguzzi2019` 1025–1027, p. 25 ✓.
- §4.4: `chrusciel2011` Remark 2.1.2, 121–131, p. 4 ✓; `minguzzi2019` 456–465, p. 11 ✓; `sbierski2018` Remark 2.16, 485–489, p. 11 ✓.
- §4.5: `sbierski2018` 475–481, p. 11 (smooth `g`, isometric embedding into a proper subset, same dimension, `C^k` metric), 255, p. 6, footnote 6 at 494, 109–119, p. 3 ✓; `minguzzi2019` 378–379, p. 9 ✓; `dafermosluk2017` 370–372 ✓.
- §5.5: `luoyu2023` 422–424 (characteristic hypersurfaces are the null hypersurfaces of the acoustical metric) ✓; `luoyu2023b` 418 (the boundary of a domain of dependence is a null hypersurface) ✓; also 331–332.
- No locator is flagged as unverified by the author. The manifest records every cited work (11 certified, 6 uncertified by locator only) and no local path.

**Adversarial table** (the sampled targets, the headline theorems, the repaired passages and the targets the findings touch; values recomputed this round). For §2.3, §2.4, §2.6, §3.1, §3.5, §4.2, §4.3, §5.1, §5.3, §5.4 the round-5 rows carry computed values and no repair touched them; §1.1, §1.3, §2.2 and §4.1 had no row there and were reviewed in full.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 restriction bullet | `diag(−1, −1, 1)`, `W = V`; Lorentzian `η₃`, `W = ⟨e₀, e₁⟩`, `W = ⟨e₀ + e₁, e₂⟩` | first: nondegenerate, `b(e₀, e₀) = −1`, `sigNeg = 2`; second: `sigNeg = 1`, Lorentzian; third: `e₀ + e₁` in the radical, degenerate, no timelike vector | false without "Lorentzian `b`" | R01 |
| §1.1 other bullets | `c = 4`; `−η` in dimension 2 and 3; dimension 1 `−xy`; zero space | `sigNeg(4η) = 1`; `sigNeg(−η₂) = 1`, `sigNeg(−η₃) = 2`; `sigNeg = 1`, `sigPos = 0 = dim − 1`; `sigNeg = 0` | hold | none |
| §1.1 Clifford Check | `realCliffordForm 3 1`, `e₃`; `e₀, e₃` | weights `1, 1, 1, −1`; `Q(e₃) = −1`; `½(Q(e₀ + e₃) − Q(e₀) − Q(e₃)) = ½(0 − 1 + 1) = 0`; polar gives `−2` at `(e₃, e₃)` | holds | none |
| §1.3 null-existence bullet | Euclidean `ℝ²`; `η` on `ℝ²`; `−xy` on `ℝ` | `|v|² > 0`, none; `e₀ + e₁`; none | false without "Lorentzian `b`" | R01 |
| §1.3 orthogonality | `e₀ ± e₁`; `e₀ + e₁`, `2e₀ + 2e₁`; timelike `e₀`, `w ⊥ e₀` | `η = −2`; `0`; `w ∈ ⟨e₁, …⟩`, `η(w, w) ≥ 0` | hold for Lorentzian `b` | none |
| §1.4 time cone | `v = e₀`: `(2, 1)`, `(−1, ½)`; `v = e₁`: `(1, −½)`, `(−1, −½)`, midpoint; closure in dimension 1 | `(−3, −2)`; `(−¾, +1)`; `−¾, −¾, +¼`; `{a > 0}` has closure `{a ≥ 0} = {−a² ≤ 0 ∧ −a ≤ 0}` | holds; timelike `v` needed | none |
| §1.5 timecone theorem (headline) | `w = av + w_⊥`, `b(v, v) = −1`; dimension 1 | `b(w, w) = −a² + ‖w_⊥‖²`, `b(v, w) = −a`; cone `{a > ‖w_⊥‖}`; `sign b(w, w') = −sign(aa')`; dimension 1: `ℝ ∖ {0}`, two half-lines | two components, closures meet in `0` | none |
| §1.6 reverse Cauchy–Schwarz and triangle | `(2, 1), (1, 0)`; `(1, 1), (1, −1)`; `(1, 1), (2, 2)`; `u = 0`; `u, −u`; dimension 1, `u = 2`, `w = 3` | `2 ≥ √3 = 1.732`; `2 > 0`; `0 = 0`; `0 = 0`, dependent; `b(u, u) < 0`; `6 = 2·3`, `F(5) = 5 = 2 + 3` | holds on one closed cone, equality iff dependent | none |
| §1.7 null hyperplanes | `n = e₀ + e₁` in `ℝ³` | `n^⊥ = ⟨n, e₂⟩`; `(n^⊥)^⊥ = ℝn`; `η(αn + βe₂) = β²` | holds | none |
| §1.8 hyperplane classification (headline) | `dt`, `dx`, `dt − dx` on `ℝ²`; dimension 1, `ξ = dt` | `b⁻¹ = −1, 1, 0`; `ker = ℝe₁, ℝe₀, ℝ(e₀ + e₁)`; dimension 1: `W = 0`, `b⁻¹ = −1`, positive definite vacuously, neither Lorentzian nor degenerate | three exclusive cases | none |
| §1.9 acoustical form | `c = 2`, `v = (1, 0)`; `c = 0`; `1 + 1` | Gram `[[−3, −1, 0], [−1, 1, 0], [0, 0, 1]]`; product with `[[−¼, −¼, 0], [−¼, ¾, 0], [0, 0, 1]]`: rows `(¾ + ¼, ¾ − ¾, 0)`, `(¼ − ¼, ¼ + ¾, 0)`, identity; `a(1, (3, 0)) = −4 + 4 = 0`, unshifted `5`, opposite shift `12`; `a(B, ·) = 0`; `−c² + (±c)² = 0` | holds; `c > 0` needed | none |
| §2.1 local Hölder class | `|x|^α`; `x|x|`; `x² sin(1/x²)` at `x_m = (2πm)^{−½}`; open `Ω`, compact `K ⊆ Ω` | seminorm `1`; `f' = 2|x|`; `f'(x_m) = −2/x_m = −5.01, −15.85` (`m = 1, 10`); local bounds give a bound on `K` (Lebesgue number `δ`: far pairs bounded by `2 sup/δ^α`) | Checks discriminate; agreement with PDE §1.7 on open sets | none |
| §2.2 definition and Checks | `diag(−1, x²)`; `diag(−1, sign x)`; smooth comparison, two components | `sigNeg = 1`, degenerate at `x = 0`; discontinuous; `sigNeg` locally constant, so one point per component suffices | holds | none |
| §2.5 operations | `φ = log 2`; `φ(s, y) = (2s, y)`; `h = dt² + dx²`, `X = 2∂_t`, `X = ∂_t + ∂_x`; `u = t − x`, `v = t + x`; `θ¹ = t dx` | `−4, 0, −¼` (with `e^φ`: `−2, −½`); `−4` vs `−¼`; `−dt² + dx²` (no division: `−7dt² + dx²`), `g(X, X) = 2 − 4 = −2`; `−2·2(dt² − dx²) = 4η`, `g⁻¹(du, dv) = ¼(−1 − 1) = −½`; degenerate at `t = 0` | holds | R03 (`n ≥ 1`) |
| §3.2 existence and uniqueness (headline) | `b = 0`; `b = η`; `b = (1 + |t|)η` | no `b♯`, Koszul `0 = 0` with torsion `e₀`; `∇ = D`; pairing `−(1 + |t|)` not differentiable, no Levi-Civita connection | nondegeneracy and differentiability needed and stated | R02 (locator) |
| §3.3 Christoffel symbols (headline) | `x = z²`; `C^{k,α}`, `k ≥ 1` | `Γ̃ = (2z)⁻¹·2 = 1/z`; geodesic `z = √(a + bt)`: `z'' = −b²/(4z³) = −z'²/z`; wrong direction `−1/(2x)`; `k − 1 ≥ 0`, no junk subtraction; `∇Y ∈ C^{min(j, k−1)}` from `DY ∈ C^j`, `Γ ∈ C^{k−1}` | holds | none |
| §3.4 curvature | `−dt² + a²dx²`: `a = cosh t`, `a = t`, `a = sin θ` (sphere, `+dθ²`); `e^{2√t}η`; `cg` | `R(∂_t, ∂_x)∂_x = (aa')' − a'² = aa''`, `R(∂_x, ∂_t)∂_t = −(a''/a)∂_x`; `Ric_tt = −1`, `Ric_xx = cosh²t`, `Scal = 1 + 1 = 2`; `0`; sphere `2`; `φ'' = −¼t^{−3/2}`, `Scal = −½e^{−2√t}t^{−3/2}` (`−0.3438` at `t = ½`); `Scal/c` | holds; convention equals RiemannianGeometry `:140` (r6) | R02 (locator) |
| §3.6 `C^{1,1}` uniqueness (headline) | Lipschitz `Γ`; equaliser in `J`; boundary points | `(u, w)' = (w, −Γ_u(w, w))` locally Lipschitz on the relatively open chart target; equaliser open (`ODE_solution_unique_of_mem_Ioo`, Lipschitz on a set containing both solutions) and closed (`T2`); existence only at interior points (Picard–Lindelöf) | holds | none |
| §4.1 time orientations | `∂_t`, `−∂_t`, `∂_t + ½∂_x`; `M = ∅`; two copies | `g = +1`; `g = −1`; one class; `2² = 4` classes | holds; involution fixed-point-free iff `M ≠ ∅` | none |
| §4.3 two orientations (headline) | `g(T, T')` on connected `M` | continuous, nonvanishing, constant sign; `[T] ≠ [−T]` as `M ≠ ∅` | `Nat.card = 2` | none |
| §4.4 double cover, pulled-back charts (r6) | Minkowski `ℝ²`; flat Möbius band; `M = ∅`; chart `x ↦ x³` on a sheet | `ℝ² ⊔ ℝ²`; `ℝ × ℝ/2ℤ`, deck `(t, y) ↦ (−t, y + 1)`; second lift `(t, x) ↦ (−t, x + 1)` composes with the quotient to `[(t, x)]` and carries the cone of `dπ(−∂_t)`; `∅`, one section; `p` reads `y ↦ y^{1/3}`, not a local diffeomorphism, excluded by `compatible_chartedSpaceComap` | holds | none |
| §4.4 section criterion | section `s`; component `C` | `s(M)` open with open complement `(−s)(M)`, no `T2` used; `p|_C` open and closed (finite cover), onto connected `M` | holds; connectedness needed (two Möbius bands) | none |
| §4.5 extensions (headline) | identity; `{t > 0}`; cylinder cover on `(0, 1) × ℝ`; glued planes; component `M̃'` | not proper; extendible; not injective; non-Hausdorff; `p(M̃') = M̃` (open, and closed since `p` is a finite cover), `p(ι̂(M)) = ι(M) ≠ M̃`, so `ι̂(M) ≠ M̃'` | holds; `T2` and σ-compact target in the definition | none |
| §5.2 null hypersurfaces (headline) | `t`, `x¹`, `t − x¹` in `ℝ³`; `{t = x²/2}` at `x = ½, 1, 2`; dimension 1 | `−1, 1, 0`; `−¾, 0, 3` against tangent values `¾, 0, −3`; `T_pH = 0`, spacelike, all three equivalent conditions false | holds | none |
| §5.5 wave operator, characteristic iff null (headline) | Minkowski; `c`, `v` constant; Leibniz | `□(t²) = −2`, `□(|x|²) = 2n`, `□(t² − |x|²) = −2 − 2n`; `B(dx − (v + c)dt) = −c`, `σ = −c⁻²c² + 1 = 0`; `[[□, f], f]u = 2g⁻¹(df, df)u` from `[□, f]u = u□f + 2g⁻¹(df, du)` | holds | none |
| RiemannianGeometry convention (r6) | de Sitter; unit sphere | `Scal = 2` both, the README's Conventions witness and `:140` agree | holds | none |

**Context.** `[T2Space M]` and `[SigmaCompactSpace M]` appear exactly where the partitions of unity, global uniqueness and the canonical time orientation use them (§3.4 smooth comparison, §3.6, §4.2, §4.4, §4.5, §5.4); `[ConnectedSpace M]` in §4.3, §4.4 (last criterion), §4.5; boundaryless models in §4.5, §5.1 (regular levels), §5.3, §5.4.

**Shape.** Summary; Scope and ownership; Conventions (each with a computed witness); Exact supplier contracts (Mathlib, Tau Ceti, six roadmaps); How to read the build; five layers named by their mathematics, with the stated dependency order (Layers 3 and 4 independent, Layer 5 on 1–4) and no layer named after a source; every numbered subsection has a `*Needs:*` line; every definition has at least three Checks; `### Examples` and `### Dependencies` close each layer; Downstream consumers, Worked examples, References. `plan.json` agrees with the README on the repaired targets (4.4 prerequisites, RiemannianGeometry sections) and on the sampled ones, except as R01 says.

**Headline theorems for the package stage** (from the Summary): the timecone theorem (§1.5), the hyperplane classification (§1.8), chart independence (§2.3), existence, uniqueness and regularity of the Levi-Civita connection (§3.2, §3.3), `C^{1,1}` geodesic uniqueness (§3.6), the two-orientation theorem (§4.3), the time-oriented extension theorem (§4.5), the null-hypersurface equivalences (§5.2), `∇_L L = κL` (§5.4), characteristic iff null (§5.5). A remark for that stage, needing no change now: with the definitions as written, "characteristic iff null" is the first equivalence of §5.2 read through the definition of a characteristic covector, so in `Suggested.lean` it will be exposed to the one-tactic probe once §5.2's theorem is stated.

## Not verifiable

- `oneill1983` Ch. 2, 3, 5; `beemehrlicheasley1996` Ch. 3; `hawkingellis1973` Ch. 2, §6.1; `wald1984` §8.1; `kupeli1987`; `christodoulou2007` Ch. 1–2: settled as uncertified, cited by locator only. The statements that rest on them alone (the Levi-Civita definition and theorem, the curvature definitions) were recomputed on the examples of the table; see R02.
- `chrusciel2011` line 168: the extraction prints (2.1.2) without its division sign; the README's formula was checked by the §2.5 Check (`−dt² + dx²`).
- `sbierski2018` line 119: the extraction garbles the scalar-curvature formula; the README's value was recomputed by the conformal formula.
- Elaboration, `#check` comparison, padding probe: not applicable at the design stage; the lane does not elaborate.

## Source issues

- **Error** in chrusciel2011 at §2.1, printed p. 4 (lines 114–116): the source says a time-orientable manifold has precisely two time orientations, with no connectedness assumed (lines 76–82, Definition 2.1.1); it should assume the manifold connected, since two disjoint copies of Minkowski space have four; affects a stated result.
