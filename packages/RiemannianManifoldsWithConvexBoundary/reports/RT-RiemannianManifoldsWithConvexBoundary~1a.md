<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18017#issuecomment-6909083489 -->
Red team round 1 pass a (claude) of d3b0e52

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) a roadmap on main is listed as a consumer of this roadmap, and it is not one

   - **Location.** `packages/RiemannianManifoldsWithConvexBoundary/README.md:1825-1827`, under
     `## Downstream consumers`: "**PositiveMass**, 5.1–5.2: the boundary mean curvature
     `H = tr_h II/n`, `n ≥ 1`, for the inward normal (1.5), identified with RiemannianGeometry R5a's
     `⟨B, ν_in⟩` by 3.6".
   - **Claim.** PositiveMass 5.1–5.2 consumes 1.5 and 3.6 of this roadmap.
   - **Witness.** `TauCetiRoadmap/PositiveMass/README.md:934-936` takes the mean curvature from
     "R5b's `A(X,Y) = ⟨B(X,Y),ν⟩`", and its `*Needs:*` (lines 938–939) names RiemannianGeometry R5b;
     `roadmaps grep RiemannianManifoldsWithConvexBoundary` finds no citation on main or at any open head.
     A roadmap on main cannot name an open roadmap as supplier.
   - **Repair.** Replace the bullet by:

     "- **PositiveMass**, 5.1–5.2, takes its boundary mean curvature from RiemannianGeometry R5b's
     `A(X, Y) = ⟨B(X, Y), ν⟩` and does not consume this roadmap. The conventions agree: its averaged
     `tr A/(dim M − 1)` for the inward normal is the `H = tr_h II/n`, `n ≥ 1`, of 1.5, by 3.6
     (`B = II ν_in`), with `H = 1` on the unit sphere and `H = −1` on the boundary of the exterior of
     the unit ball in both. A Part II of PositiveMass for boundaries given intrinsically may consume
     1.5 and 3.6."

     Tested on the witness: the new text names R5b as PositiveMass's supplier, as lines 934–939 do, and
     the two values `H = 1`, `H = −1` are those of `TauCetiRoadmap/PositiveMass/README.md:951-954`.

2. **F02** (P3) the route of 6.4 proves again what its supplier B6.0 states, and takes the uniformity from the part of B6.0 the scope does not consume

   - **Location.** `packages/RiemannianManifoldsWithConvexBoundary/README.md:1743-1752` (route of 6.4:
     "`Hess |z|²(∂_i, ∂_j) = 2δ_ij − 2 z_k Γ^k_ij = 2g_ij + O(|z|²)`, positive definite on a small
     ball … uniformity from SmoothBundlesConnections B6.0") and `README.md:121-124` (scope: "6.4
     consumes its uniform radii").
   - **Claim.** Positivity of `Hess d(p, ·)²` on a small ball is derived here from the normal-coordinate
     jets, and a radius uniform on compact sets of centres follows from B6.0's uniform normal radii.
   - **Witness.** `TauCetiRoadmap/SmoothBundlesConnections/README.md:1323-1328` proves "strict convexity
     of squared local radial distance along sufficiently short geodesics" with uniform strong-convexity
     radius bounds; by 4.2 that is `Hess d(p, ·)² > 0`. A uniform normal radius alone does not bound the
     `O(|z|²)` constant.
   - **Repair.** In 6.4 replace the route from "in normal coordinates `z` at `p`" to "positive definite
     on a small ball;" by:

     "in normal coordinates `z` at `p`, `d(p, ·) = |z|` on a normal ball (HopfRinow Layer 2), so
     `d(p, ·)²` is smooth there and its differential vanishes only at `p`; by SmoothBundlesConnections
     B6.0 there is `r_p > 0`, uniform on compact sets of centres, such that `t ↦ d(p, γ(t))²` is strictly
     convex along every nonconstant geodesic `γ` in `B(p, r_p)`, which by 4.2's identity
     `(f ∘ γ)'' = Hess f(γ', γ')` is `Hess d(p, ·)²(v, v) > 0` for every nonzero `v` at every point of
     `B(p, r_p)`;"

     delete the closing clause "; uniformity from SmoothBundlesConnections B6.0"; in the scope bullet
     write "6.4 consumes its uniform radii and its strict convexity of the squared radial distance";
     in 6.4's `*Needs:*` and in the Layer 6 Dependencies add 4.2 and remove
     `TauCeti.Manifold.normalCoordinateField`,
     `TauCeti.Manifold.IsNormalDomain.mfderiv_inner_normalCoordinateField_self` and
     `TauCeti.Manifold.IsNormalDomain.leviCivitaConnection_normalCoordinateField_self`; remove the
     same three names from the "From Tau Ceti" paragraph (`README.md:273-279`) and the scope bullet
     at `README.md:88-92`, which no other section uses (`TauCeti.Manifold.IsNormalDomain` stays: B6.0's
     contract at `README.md:366` names it). Tested on the flat-torus Check of 6.4: `d(p, ·)² = |z|²`,
     `(|z + tv|²)'' = 2|v|² > 0`, `Hess = 2g`, `II = 4h` at `R = 1/4`, unchanged.

3. **F03** (P3) three `### Dependencies` paragraphs disagree with the `*Needs:*` lines of their sections

   - **Location and witness.**
     1. `README.md:1273` "4.4 uses 1.4, 4.3 and Mathlib's partitions of unity"; the `*Needs:*` of 4.4
        (`README.md:1192`) also lists "GeometricTopology 1.1 (smooth collars)", used by its first item.
     2. `README.md:601` "1.4 uses 1.1–1.3, Mathlib's Levi-Civita connection and Tau Ceti's Hessian"; the
        `*Needs:*` of 1.4 (`README.md:530-533`) also lists DifferentialGeometry 12.3.
     3. `README.md:1598` "5.5 uses 2.1, 3.4–3.5, 4.2, 4.6 and 5.1–5.4"; the `*Needs:*` of 5.5
        (`README.md:1523`) lists 5.1, 5.2, 5.4 and not 5.3, and nothing in 5.5 uses the two calculus lemmas.
   - **Claim.** Each Dependencies paragraph is the section's `*Needs:*` line in prose.
   - **Repair.** Line 1273: "4.4 uses 1.4, 4.3, GeometricTopology 1.1 (smooth collars) and Mathlib's
     partitions of unity". Line 601: "1.4 uses 1.1–1.3, DifferentialGeometry 12.3, Mathlib's Levi-Civita
     connection and Tau Ceti's Hessian". Line 1598: "5.5 uses 2.1, 3.4–3.5, 4.2, 4.6, 5.1–5.2 and 5.4".

Three P3 findings (R01–R03). No P1 or P2 finding survived the computed pass below. Both files were
read in full (`packages/RiemannianManifoldsWithConvexBoundary/README.md`, 1861 lines;
`packages/RiemannianManifoldsWithConvexBoundary/Suggested.lean`, 377 lines).

## The computed pass

`n = dim M − 1` throughout. "disc" is the closed unit disc at `x = (0, −1)`; "interval" is
`M = [a, b]` (`n = 0`); "closed" is a nonempty compact manifold without boundary.

### `Suggested.lean` (22 declarations; context: `{n} {M : Type u}`, `ChartedSpace (EuclideanHalfSpace (n+1)) M`, `IsManifold (𝓡∂ (n+1)) ∞ M`; from line 80 `RiemannianBundle` and `IsContMDiffRiemannianBundle … 1 …`)

| Declaration (README §) | Instances tried, values on each side | Result |
|---|---|---|
| `boundaryTangentSpace` (1.1) | half-plane at 0: range of zero-insertion = span `e₁` = `ker dx⁰`; `n = 0`: source space is 0, range 0 | sound |
| `IsBoundaryDefiningFunctionOn` (1.3) | ball: `1−|x|²` passes; `(1−|x|²)²` fails `mfderiv_ne_zero` (`dρ = 0`); `|x|²−1` fails `pos`; `∂M = ∅`: constant 1 passes | sound; elaborated type drops `IsManifold`, which no field mentions |
| `secondFundamentalForm` (1.4) | slot 0 of `extChartAt` is the constrained coordinate (`EuclideanHalfSpace`), positive inside; ball `R`: `−(−2)/(2R)·h = h/R`; exterior: `−h`; half-space 0; `n = 0`: form on 0 | sound, sign as Conventions |
| `IsStrictlyConvexAt`, `IsStrictlyConvexBoundary` (2.1) | ball true; half-space false for `n ≥ 1`, true for `n = 0` (no nonzero `u`); `{y ≥ x³}`: `II = 6x/(1+9x⁴)^{3/2}`, true iff `x > 0` | sound |
| `isStrictlyConvexAt_iff_hessian_neg` (2.2) | `ρ = u x⁰`, `u(q) = dρ(∂₀) > 0`: `Hess ρ = u Hess x⁰ + du⊗dx⁰ + dx⁰⊗du` = `u Hess x⁰` on `ker dx⁰`; ball with `ρ' = (2+x₁)(1−|x|²)`: `−2(2+x₁)h < 0`; `−ρ` excluded by `pos` | true as typed |
| `IsStrictlyConcaveLevelSetAt` (3.2) | `x = |z|²`: true at `y ≠ 0`, false at 0 (`dx = 0`); affine `x`: false for `dim ≥ 2`, true for `dim 1`; `−|z|²` false for `dim ≥ 2` | sound |
| `exists_isSmoothEmbedding_regularDomain` (3.5) | interval → circle (double), `ρ` two regular zeros; half-line → `(−1, ∞)`; closed `M`: `N = M`, `ρ ≡ 1`; `M = ∅`: `N = ∅`, `ConnectedSpace M` false; `S¹ ⊔ [0,1]`: `N` = three circles, compact, `ρ = −1` on the second copy of `S¹`; codimension-0 immersion at a boundary point satisfies Mathlib's `ImmersionAtProp` (equality only on the half-space target of the source chart) | true as typed; `N : Type u` |
| `not_exists_isGeodesicCurveOnFrom_of_isStrictlyConvexAt` (4.2) | ball, unit `v ⊥ q`: `x⁰∘γ` would have value 0, derivative 0, second derivative `−|dx⁰| II(v,v) < 0`, negative for small `t > 0`, impossible in `M`; exterior and half-space: hypothesis fails, tangent line is a geodesic of `M`; `n = 0`: no nonzero `v` | true, no T2 needed |
| `mem_interior_of_isGeodesicCurveOn` (4.2) | interior touch gives a minimum of `x⁰∘γ`, tangent velocity, then previous row; constant curve at a boundary point excluded by `hnc`; `n = 0`: tangent means zero velocity, constant speed gives a constant curve | true |
| `exists_convexityFunction` (4.5) | disc: `x̃ = |z|²−1−ε|z−q|²`, `Hess = (2−2ε)g`, `dx̃_q = (0,−2) = −dρ_q`, `K_c ⊆ {ε|z−q|² ≤ c}`, `K_0 = {q}`; `x := −ρ` on a small ball is not a witness (`{0 ≤ ρ ≤ c} ∩ U` not compact); `dim E = 1`: `x̃ = −x−εx²`; `dim E = 0`: hypothesis false | true, not vacuous |
| `IsGlancing` (5.1) | disc: `(1,0)` yes, `(0,1)` no; zero vector at a boundary point yes; interior points no | sound |
| `exitTime`, `IsNonTrapping` (5.2) | `T ≤ 0` contributes `ofReal T = 0`; disc: `2 sin θ` / 0; outward vector: no `C¹` curve of `M`, value 0; zero vector: constant curve, `⊤`; interval: `b − x`; closed: `⊤`, trapped | sound |
| `geodesicEndpoint` (5.6) | `T < 0`: `0 ∉ Icc 0 T`, value `z`; `T = 0`: `{0}` not `UniqueDiffOn`, value `z`; disc `z = ((0,−1),(0,1))`: `T = 1` gives `((0,0),(0,1))`, `T = 3` gives `z` | sound; choice-independent under T2 |
| `scatteringRelation` (5.6) | disc outward `v = (0,−1)`: else-branch, endpoint of `−z` is `((0,1),(0,1))`, value `((0,1),(0,−1))` = `x − 2⟨x,v⟩v`; glancing unit `z`: both times 0, value `z`; zero vector: `⊤.toReal = 0`, value `z` | sound |
| `contMDiffOn_exitTime` (5.4) | disc: `2 sin θ` smooth for `θ ≠ 0, π`, continuous at them; interval: `(b−x)/v`, `(x−a)/|v|` smooth for `v ≠ 0`; outward non-glancing boundary vector: transversal root, value 0; closed: hypothesis false | true |
| `exists_contMDiff_eq_exitTime_sub_exitTime_neg` (5.4) | ball: `F = −2⟨x,v⟩`, `XF = −2|v|² = −2`; interval: `F = (a+b−2x)v`, `XF = v·(−2v) = −2`; `M = ∅`: `F = 0` | true |
| `exists_contMDiff_eq_exitTime_mul_exitTime_neg` (5.4) | ball: `1−|x|²`; interval: `(b−x)(x−a)`; `σ²+4T = (b−a)²`, root `b−x` | true |
| `isNonTrapping_tfae` (5.5) | ball: all true (`f = ⟨x,v⟩`, `Xf = 1`); closed: all false (`Xf = 0` at a maximum of `f`); `M = ∅`: all true; `S¹ ⊔ [0,1]`: all false; half-circle `n = 0`: all true | true |
| `scatteringRelation_involutive` (5.6) | ball: `α(x,v) = (x−2⟨x,v⟩v, v)`, `⟨x',v⟩ = −⟨x,v⟩`, `α∘α = id`, fixed iff `⟨x,v⟩ = 0`; interval: `α(a,+1) = (b,+1)`, `α(b,+1) = (a,+1)`, no fixed point, no glancing unit vector | true |
| `exists_contMDiffOn_eq_scatteringRelation` (5.6) | `F = α ∘ r`, `r(x⁰, x', v) = (0, x', v/|v|)` a smooth local retraction of `TM` onto `∂SM`; values in `TM`, as the target requires | true |

All 22 elaborated types in the worker's signature file were compared with the README statements
(I ran no Lean): binders, `T2Space`/`CompactSpace`/`SecondCountableTopology` and the smooth-metric
instance are present on every theorem that needs them; nothing changed.

### README targets and conventions

| Statement | Values computed | Result |
|---|---|---|
| 1.2 chart formula | `g = [[1,a],[a,1]]`: `grad x⁰ ∝ (1, −a)`, norm² `1−a²`; `a = 1/2`: `(2/√3, −1/√3)` | agrees |
| 1.3 comparison | `ρ' = (2+x₁)ρ`: `u = 2+x₁ ∈ [1,3]`; interval `x(1−x)`: `|dρ| = 1` at both ends | agrees |
| 1.4 three descriptions | sphere: `∇_X x = X`, `⟨∇_Xν_out,Y⟩ = h`; `Hess ρ = |dρ|⟨∇_Xν_in,Y⟩` on `T∂M` | agrees |
| 1.6 conformal law | `Hess_ĝρ = Hess ρ + |dρ| dφ(ν_in) g` on `T∂M`, `|dρ|_ĝ = e^{−φ}|dρ|`; disc `φ = −|x|²`: `e^{−1}(1−2)h`; `φ = log 2`: `2h` | agrees |
| 2.3 | epigraph of `√(1+x²)`: curvature `(1+2x²)^{−3/2}`, infimum 0; family: `e^{−s}(1−2s)h` | agrees |
| 3.1 Checks | `ρ' = (2+x₁)(1−|x|²)` at `(−3,0,…)`: `(−1)(−8) = 8`; on `x₁ = −2`: `dρ' = (1−|x|²)dx₁ ≠ 0` | agrees |
| 3.3 `ρ̃ = φ₀χ(t) + φ₁s` | `φ₁ = 0` near `∂M`, so `ρ̃ = t` there, `dρ̃ = dt`; sign of both terms is the side; interval: `2x`, `2(1−x)` | agrees; Tau Ceti's face chart puts `a − f` in slot 0, so `−ρ̃ ≤ 0` has `ρ̃` as normal coordinate |
| 3.6 Gauss equation | sphere: `0 + 1·1 − 0 = 1`; cylinder: `0 + 1·0 − 0 = 0`; exterior: `⟨B, +x⟩ = −h` | agrees with R5a's `B = −g·position` |
| 4.3 `ρ̂ = ψr + (1−ψ)s` | off `M ∪ W`: `−1`; on `W ∖ M` with `r < −δ`: convex combination of two numbers `< −δ` | agrees |
| 4.4 | ball: `h_r = (1−r/R)²h₀`, `−½∂_r = h₀/R`; cap: `−a_t(0) = cot φ₀`; strip: `d((0.8,0), ∂M) = 0.2 ≠ 0.8` | agrees with Surfaces 1.2 (`a_t(s,0) = −k_g`) |
| 4.6 | `(1−s)e^{−s}` has minimum `−e^{−2}` at `s = 2`; caps: `R + δ < π/2` | agrees |
| 5.2 annulus | `τ = 3/2 + √3` at `(−3/2,−1)`, `e₁`; limit `3/2` from `(−3/2,−1+δ)` | agrees |
| 5.3 | `h = y − t²`: `Q = r`, `a = y`; ball: `a = 4(⟨x,v⟩²+1−|x|²)`, `Q(√a) = τ` | agrees |
| 5.4 | disc: `μ/τ̃ = sin θ/(2 sin θ) = 1/2 = II/2` | agrees |
| 5.5 | ball bound `(1−(−1))/1 = 2`; torus ball `R = 1/4`: `1/2` | agrees |
| 6.1 | `τ(0, e₁/4) = (0+√(1/16))/(1/16) = 4`; ellipse vertex `a/b²` | agrees |
| 6.3 | cap: `|dρ| = sin R`, `Hess ρ = −cos R·g`, `cot R·h`; hyperbolic: `u(0,2) = 5/4`, `|du| = 3/4`, `Hess u_xx = u/y²`, `Hess u_xy = 0`; `p = 2e`: `1/√15` | agrees |
| 6.5 | `b' = e^{φ}(1+2r²φ')`, `b'/r = e^{φ}(1/r+2rφ')`; `φ = s²−2s`: `b' = e^{r⁴−2r²}(2r²−1)²`, `b'(1/√2) = 0` | agrees with 1.6 |

## Verified sound

- **Declarations read:** 22 of 22 (11 definitions, 11 theorems). No `sorry`'d data, no `set_option`,
  no `lemma`, one `import Mathlib` followed by six `TauCeti.*` modules, each of which supplies a name
  the file uses. Padding probe: no theorem follows from a definition or one library lemma; each of
  the 11 definitions occurs in a theorem statement.
- **Headline theorems.** The seven end theorems of the Summary (Hessian characterisation,
  realisation, tangent geodesics leave, convexity functions, regularity of `τ` with `σ` and `T`,
  the non-trapping criteria, the involution and fixed points of `α`) are all stated. The Layer 5
  statements are made on `TM` rather than on `SM`; each is equivalent to the `SM` statement
  (homogeneity of degree `−1` for `τ`; `(x, v) ↦ (x, v/|v|)` and a radial cutoff for extension from
  `SM`; the retraction above for `α`), so none is a weakened stand-in.
- **Targets read:** all 32 numbered sections with their Checks (122 Checks; every numerical
  value in them was recomputed, a selection is in the tables). Each definition has at least three
  discriminating Checks.
- **Locators verified:** every line locator into `paternain-salo-uhlmann2023` (lines 307–310,
  2443–2525, 2640–3127), `stefanov-uhlmann-vasy2021` (lines 8–30, 48–72, 86–101, 124–165, 196–222)
  and `uhlmann-vasy2016` (lines 15–70, 128–142, 496–524) was opened: 71 line locators, none wrong.
  The naming of Definition 2.5.1 (line 2449–2461) is read correctly in 2.1 and 6.2; the opposite
  `∂±SM` labels of `stefanov-uhlmann-vasy2021` line 151 are stated correctly.
- **Sibling citations checked (11):** RiemannianGeometry R5a (line 186–192), R5c items 1 and 3
  (lines 3862–3890, 3749–3753), R7.9 (lines 4469–4600), 2.2 (R1.4); RiemannianGeometry/Surfaces
  1.2–1.3; GeometricTopology 1.1 and 1.3 with the Layer 1 standing convention (line 785);
  DifferentialGeometry 12.5 with the variable context of `exists_halfSpaceOutwardUnitNormal`;
  ComplexKahlerGeometry K5a (line 1795–1797); SmoothBundlesConnections B6.0; AffineMorseLefschetz
  4.5; PositiveMass 5.1–5.2; HopfRinow under `Completed/`. All exist with the hypotheses the supplier
  contracts restate.
- **Pinned declarations checked at the pins:** `TauCeti.Manifold.IsGeodesicCurveOn` (requires
  `UniqueDiffOn`, `C²`), `IsGeodesicCurveOnFrom`, `curveVelocityWithin`, `geodesicSpray`,
  `TauCeti.IsOutwardPointing`, `TauCeti.Manifold.hessian`, `TauCeti.scalarRegularSublevelChartedSpace`
  with its boundary and interior theorems, `TauCeti.sphereBundleChartedSpace` (`[I.Boundaryless]`),
  `TauCeti.mfderiv_subtypeVal_boundary`, `TauCeti.boundaryChartedSpace`, Mathlib's
  `Manifold.IsSmoothEmbedding` and `ImmersionAtProp`.
- **Ownership.** `roadmaps grep` for scattering relation, exit time (geodesic), non-trapping,
  boundary defining function, strictly convex boundary, boundary normal coordinates, boundary second
  fundamental form and boundary mean curvature: no second owner on main or at the 245 open heads.
  The pinned libraries have none of these objects (`TauCeti/Analysis/Contour/ExitTime.lean` is an
  unrelated notion in another namespace). No declaration shares a fully qualified name with another
  roadmap. The worker's overlap and citation files list nothing, and I found nothing they miss.
- **Policy.** The pull request changes only the package folder; no pull-request numbers, process
  narrative or algorithms in the README or docstrings; no supplier gap is declared and none is hidden.
- **Dependency check** (command of the brief): `depcheck: 249 roadmaps, 2378 edges, 0 problem(s)`;
  no UPWARD or CYCLE line.

## Not verifiable

- `lee-riemannian2018`, `lee-smooth2012`, `sharafutdinov1994`: uncertified, text not read. Their
  locators are at chapter level (Ch. 5–6, 7–8, 8; Theorem 9.25; Ch. 4) and are the only source for
  1.5 and 3.6; the mathematics of those sections was checked independently, the locators were not.
- `paternain-salo-uhlmann2023` was read in the author-page copy; whether the theorem numbers of
  Sections 2.5 and 3.1–3.3 agree with the printed Cambridge edition was not checked.
- Elaboration: I ran no Lean. The comparison of signatures uses the worker's elaborated types.
- The exact wording of DifferentialGeometry 5.1 and 12.1–12.3 was not opened beyond the names the
  README quotes; ComplexKahlerGeometry K5a names the half-space Seeley extension as a step of a
  construction and does not display it as a statement, which the README says itself.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Lemma 3.2.11, printed page 64: the source says the product `T` has second factor the exit time at the single argument `x − v`; it should be the exit time at the pair `(x, −v)`; affects nothing.
- **Misprint** in paternain-salo-uhlmann2023 at Corollary 2.5.3(b), printed page 47: the source says the derivative of `b` is positive at `1`; it should be at the outer radius `r₁` of the annulus `r₀ < r ≤ r₁` fixed in that section; affects nothing.
- **Gap** in paternain-salo-uhlmann2023 at Lemma 3.2.3, printed pages 59–60: the source says the implicit function theorem at the transversal exit gives smoothness of the exit time; it should also show the root found is the exit time of nearby vectors, which needs the continuity left as Exercise 3.2.4; affects the proof.
- **Gap** in paternain-salo-uhlmann2023 at Lemma 3.2.11 and Exercise 3.2.12, printed page 64: the source says an even smooth function of one variable is a smooth function of its square; it should be the version with smooth parameters, which the lemma's proof uses; affects the proof.
- **Misprint** in uhlmann-vasy2016 at Section 3, printed page 11 (line 519): the source says the lower bound for the second Hamilton derivative of the new function holds over the cotangent space at `p`; it should be over the neighbourhood `U₀`, as the conclusion needs; affects nothing.

Source independence: 14 passages compared with 3 sources, none shared (longest common run is the hypothesis list of the fold lemma, which the mathematics forces); largest share paternain-salo-uhlmann2023, 47 of 84 source citations; contents compared with paternain-salo-uhlmann2023 Sections 2.5 and 3.1–3.3: independent (the material of its Section 3.1 is spread over Layers 1–5, and the order exit time, regularity, scattering relation inside Layer 5 is forced by the `*Needs:*` lines 5.2 → 5.4 → 5.5, 5.6); the texts of lee-riemannian2018, lee-smooth2012 and sharafutdinov1994 could not be read.

## For the human reviewers

- **Not tested.** `lee-riemannian2018` and `lee-smooth2012` are uncertified; the wording and arrangement of 1.5, 1.6, 3.6, 4.3, 4.4 and 6.4 were not compared with them (`packages/RiemannianManifoldsWithConvexBoundary/sources.toml`, lines 45–70).
- **Licence.** `paternain-salo-uhlmann2023` is recorded with `licence_class = "author-page"` (`sources.toml`, line 88); the README cites the 2023 Cambridge edition by the numbering of that copy.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d3b0e521cef5ab9ecbd1cf544ab7c3b150d92670", "job": "RT-RiemannianManifoldsWithConvexBoundary~1a", "model": "fable", "worker": "chris-x55"} -->
