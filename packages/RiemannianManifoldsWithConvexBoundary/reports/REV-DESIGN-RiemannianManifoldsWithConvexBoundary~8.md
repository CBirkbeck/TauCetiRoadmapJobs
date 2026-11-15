<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13810#issuecomment-6897406337 -->
Review (claude) of 325829b

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) 6.4 calls the small ball a regular domain without an ambient manifold on which its defining function is smooth

   **Location.** `packages/RiemannianManifoldsWithConvexBoundary/design/README.md`, 6.4, lines
   1494–1496: "the closed ball `B̄(p, R) = {d(p, ·)² ≤ R²}` is a compact regular domain with strictly
   convex boundary which is non-trapping".

   **Claim.** `B̄(p, R)` is a regular domain in the sense of 3.1, which asks for a smooth `ρ` on the
   whole ambient manifold with `0` a regular value.

   **Witness.** The section's own Check (lines 1517–1518): on the flat torus `ℝ²/ℤ²`, `d(p, ·)²` is
   smooth on `B(p, 1/2)` "and not beyond", so `R² − d(p, ·)²` is not a smooth function on `N`. 3.2
   (line 692) writes "a regular domain of the open submanifold `U`" for the same situation.

   **Exact repair.** Replace "is a compact regular domain" by "is a compact regular domain of the
   open submanifold `B(p, r_p)`, with defining function `R² − d(p, ·)²`" (that submanifold is
   Hausdorff, second countable and boundaryless, so Layer 5 applies to it).

   **Repair test.** Flat torus, `r_p = 1/2`, `R = 1/4`: on `B(p, 1/2)`, `ρ = 1/16 − |z|²` is smooth,
   `dρ = −2z ≠ 0` on `|z| = 1/4`, `Hess |z|² = 2g`, `II = 2h/(2·(1/4)) = 4h = h/R`, and the bound of
   5.5 with `u = |z|²/2` gives `τ ≤ 2R = 1/2`.

2. **F02** (P3) 6.2's locator supports the computation but with the opposite name for the circle

   **Location.** README, 6.2, lines 1439–1442: the closed exterior "is strictly concave … the tangent
   line `q + tv` enters `int M` to second order … (Paternain–Salo–Uhlmann, Definition 2.5.1 and Lemma
   2.5.2, lines 2449–2473)".

   **Claim.** The cited definition and lemma support the strict concavity of the exterior's boundary.

   **Witness.** paternain-salo-uhlmann2023 lines 2449–2451, 2456–2458 and 2463: a circle is called
   strictly convex, as seen from the outer radius, when `b′ > 0`. For the Euclidean metric `b(r) = r`,
   `b′ = 1 > 0`: the source's word for this circle is "strictly convex", in dimension two.

   **Exact repair.** After the locator add: "in dimension two; the source names the circle from the
   side of the larger radii, so its strictly convex circle `{r = R}` (`b(r) = r`, `b′ = 1 > 0`,
   tangential geodesics move to larger `r`) is the strictly convex boundary of the ball `{r ≤ R}` and
   the strictly concave boundary of the exterior `{r ≥ R}`".

   **Repair test.** Unit circle, `q = (1, 0)`, `v = (0, 1)`: `|q + tv|² = 1 + t²`, so `r̈(0) = 1 > 0`
   (source: strictly convex seen from outside); `ρ = |x|² − 1 = t² ≥ 0` in the exterior, `II = −h`
   (strictly concave boundary of the exterior); `ρ = 1 − |x|² = −t²` for the ball, `II = h`.

3. **F03** (P3) the GeometricTopology 1.1 contract states a clause that section does not spell out

   **Location.** README, supplier contracts, lines 292–294 ("the interior `M ∖ ∂M` is a smooth
   boundaryless manifold, with the structure for which its inclusion into `M` is a smooth open
   embedding") and 3.3, lines 718–719.

   **Claim.** GeometricTopology 1.1 states which smooth structure the interior carries.

   **Witness.** Main, `TauCetiRoadmap/GeometricTopology/README.md` lines 809–810: the interior is a
   smooth boundaryless manifold and its inclusion is a homotopy equivalence; the structure is not
   named. 1.3 (line 855) has the interiors embedding openly in the glued manifold.

   **Exact repair.** In the contract, move the clause to the assumptions: "Assumed: the structure of
   `M ∖ ∂M` is the open-submanifold one (charts of `M` restricted to the interior), for which the
   inclusion into `M` is a smooth open embedding; 1.3's open embeddings of the interiors use it."
   Keep 3.3's wording, citing the contract.

   **Repair test.** `M = [0, 1]`: the interior `(0, 1)` with the restricted charts `x` and `1 − x`
   (values in `x⁰ > 0`); the inclusion is the identity in these charts, and 3.3's atlas comparison at
   interior points reads the same charts on both sides.

Three findings, all P3 and none blocking; each carries a repair, so a fix round applies them. Both round-7 findings are repaired.
No false, vacuous or unowned statement was found; every Check and formula recomputed this round
agrees with its statement. This review changed no design file, plan or manifest entry.

## Previous findings and repairs

| Round-7 finding | Repaired passage | Assessment |
|---|---|---|
| F01 (P2), compact case of 3.5 is RiemannianGeometry R5c's | Scope lines 102–110 ("the presentation of a compact Riemannian manifold with boundary as the closure of a relatively compact smooth domain … RiemannianGeometry R5c (scalar principal eigenfunction, items 1 and 3); this roadmap adds the non-compact case …"); contract lines 279–288; 3.5 lines 818–826 and Check 832–842; Needs 851–852; Dependencies 888–889; plan supplier sections `§R5c` and prerequisite of 3.5 | **Repaired.** Read against main (1a19c9f), RiemannianGeometry: heading R5c at 3715, `m ≥ 1` at 3727, domain convention 3749–3754 (open, compact closure, chart with `x_m > 0`), item 1 at 3870–3874 (collar, gluing, Seeley extension, positive definite near `D̄`), item 3 at 3886–3889 (`D = {ρ < 0}`, regular value `0`, `{ρ ≤ 0}` compact, closed case `ρ = −1`), Needs 3938–3941. |
| F02 (P3), HopfRinow Layer 4 consumed nowhere | Scope lines 81–84 ("HopfRinow Layers 1 and 2"; completeness "already in Tau Ceti as `TauCeti.Manifold.isGeodesicallyCompleteAt_of_compactSpace`"); contract 258–262 | **Repaired.** No "Layer 4" of HopfRinow remains in the README (12 lines name HopfRinow, all for Layers 1–2); the plan's entry lists `§Layer 1`, `§Layer 2`. Pin: `TauCeti/Geometry/Manifold/Riemannian/Geodesic/Compact.lean:75`. |

The repair also added DifferentialGeometry 12.2 to 1.2's Needs (main line 2848, the gradient as
`TauCeti.Manifold.mgradient`): correct, 1.2's chart formula uses the gradient. The repaired pattern
(an object stated on main and listed here as owned) was sought again by object (searches below);
no further instance. Maintainer notes: none were supplied.

## Verified sound

**Coverage.** All 1,610 lines of the README; the plan (6 layers, 49 targets, 6 suppliers,
`gaps: []`; by script, every `target:` prerequisite resolves, every supplier section is used by a
prerequisite and every prerequisite section is listed); the six manifest entries. Every layer ends
with Examples and Dependencies; the definitions 1.3, 1.4, 1.5, 2.1, 3.1, 3.2, 5.1, 5.2, 5.6 have
3, 4, 4, 3, 5, 4, 4, 3, 3 Checks. No LaTeX delimiters, pull-request numbers, machine paths or
process words (searched); eight lines exceed 102 characters, as before.

**Dependency check, exact output:**

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2234 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. No supplier is on the never-cite list. No gap is declared and
none is needed.

**Supplier citations resolved on main (1a19c9f).** DifferentialGeometry 5.1 (:1648), 12.1 (:2801),
12.2 (:2848), 12.3 (:2871), 12.5 (:2936; `exists_halfSpaceOutwardUnitNormal` with the three laws
and pointwise uniqueness at :2949–2951); HopfRinow, completed, Layer 1 (:264), Layer 2 (:427);
RiemannianGeometry 2.2 (R1.4) (:1576), R5a (:3205), R5c (:3715, passages above), R7.9 (:4469;
inclusion and outward criterion :4586–4591, outward normals :4592–4596); GeometricTopology 1.1
(:788; collar for second-countable `M` :797–799; interval collar `t/2`, `1 − t/2`; interior
:809–810), 1.3 (:851; bicollar `∂M × (−1, 1)`, closed images, compactness, connectedness :864–866,
double :870–871), standing convention Hausdorff and second countable (:785); ComplexKahlerGeometry
K5a (:1440; Seeley step :1795–1796); SmoothBundlesConnections B6.0 (:1306; uniform normal radii
with `IsNormalDomain` :1327–1328); PositiveMass 5.1–5.2 (:921, :957); PositiveScalarCurvature and
Yamabe exist on main (consumers). The overlap report lists no dropped or revision-only id and no
other pull request changing this roadmap.

**Pinned declarations.** The 93 distinct backticked identifiers of the README were matched by
script against the pinned Mathlib and Tau Ceti; the 19 unmatched were opened by hand: 17 are
mathematical symbols (`II_q`, `h_r`, …), `Bundle.RiemannianBundle` is at
`Mathlib/Topology/VectorBundle/Riemannian.lean:420`, and `exists_halfSpaceOutwardUnitNormal` is
DifferentialGeometry 12.5's, as the README says. Opened this round:
`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Compact.lean:75`,
`TauCeti/Geometry/Manifold/RegularValue/Scalar/Sublevel.lean:473`,
`TauCeti/Geometry/Manifold/TubularNeighborhood/Riemannian/Noncompact.lean:58`.

**Seeded source sample** (read in the cached texts this round).

| Target | Locator read | Result |
|---|---|---|
| 1.1 | paternain-salo-uhlmann2023 lines 2684–2696 | inward and outward unit vectors, `∂₀SM = S(∂M)`; as cited |
| 1.2 | same, lines 2687–2689 | inward unit normal; as cited (Lee Ch. 8 uncertified) |
| 1.3 | uhlmann-vasy2016 lines 25–26, 134–136; book Lemma 3.1.10 at 2766–2773 | positive inside, zero and nondegenerate on the boundary; the normalised function is the book's; as cited |
| 1.4 | book lines 2728–2737, 2781–2784; stefanov-uhlmann-vasy2021 line 53 | `Π = −⟨∇ν, ·⟩` with inward `ν`, `−Π = Hess ρ` on glancing vectors; as cited |
| 1.5 | lee-riemannian2018 Ch. 8 | not read (uncertified); values fixed by the computed sphere, cylinder, exterior |
| 1.6 | book Lemma 2.5.2, lines 2462–2473 | sign of `b′`; the general law is the design's own derivation, recomputed below |
| 2.2 | book lines 2838–2841; uhlmann-vasy2016 lines 499–503 | as cited |
| 3.4 | book lines 2755–2762 | the source extends the metric in the Euclidean case and leaves the general case as an exercise; the route is the design's own |
| 3.5 | book Lemma 3.1.8, lines 2749–2762; stefanov-uhlmann-vasy2021 lines 96–97 | closed connected extension for compact `M`; non-compact `M` in a boundaryless manifold; as cited |
| 4.4 | stefanov-uhlmann-vasy2021 lines 20–22, 220–221 | normal gauge and boundary normal coordinates named there; statements rest on Lee Ch. 5–6 (uncertified) and the computed ball, exterior, strip |
| 5.1 | book lines 2646–2648, 2682–2696, 2931, 3063–3079; article line 151, 153 | as cited; opposite labels reported correctly |
| 5.3 | book Lemma 3.2.10, lines 2970–2982, proof 2985–3026; Exercise 3.2.12, 3044–3045, use at 3039–3041 | hypotheses and conclusion as restated; `a(y) = h(g(y), y) ≥ h(0, y)` |
| 5.5 | book Proposition 3.3.1, lines 3081–3106 | three equivalent conditions for compact `M` with strictly convex boundary; as restated |
| 6.2 | book lines 2449–2473 | supports the computation; naming is from the other side (R02) |
| 6.5 | article lines 66–72; book lines 2462–2481 | `(r/c)′ > 0`; Lemma 2.5.2 and Corollary 2.5.3 |

No author-flagged unverified locator exists in the README or the manifest.

**Adversarial table** (values computed this round; sampled targets, headlines, changed passages
and the targets the notes touch).

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.1 trichotomy | `[0, 1]` at `0`; `n = 0` | `c(t) = t`: derivative of `x⁰` is `1 > 0`, inward; `c(t) = t²`: `0`, tangent; `T_q∂M = 0` | holds | none |
| 1.2 chart formula | `g = [[1, a], [a, 1]]`, `a = 1/2` | `g(e₀ − a e₁, e₁) = a − a = 0`, norm² `1 − a² = 3/4`, `ν_in = (2/√3, −1/√3)` | holds | none |
| 1.3 global existence, comparison | glued `Σ φ_i x⁰_i + φ₀`; ball `ρ′ = (2 + x₁)ρ` | positive inside, `0` on `∂M`, `d = Σ φ_i dx⁰_i` positive on inward vectors; `u = 2 + x₁ ∈ [1, 3]` | holds | none |
| 1.4 | ball radius `R`; exterior; half-space | `−(−2g)/(2R) = h/R`; `−(2g)/2 = −h`; `0` | holds | none |
| 1.5 | sphere; cylinder; exterior | `H = 1`; `(1 + 0)/2 = 1/2`; `−1` | holds | none |
| 1.6 conformal law | from `∇̂_u w = ∇_u w + dφ(u)w + dφ(w)u − g(u, w) grad φ`; `φ = log 2`; `φ = −|x|²` | `e^{2φ} g(·, e^{−φ}ν_in) = e^φ(II − dφ(ν_in) h)`; `2h` and `4h/2 = 2h`; `e⁻¹(1 − 2)h`, `Ĥ = e(1 − 2) = −e` | holds | none |
| 2.2 Hessian iff (headline) | ball, `ρ` and `(2 + x₁)ρ`; `{y ≥ x³}` | `−2h`, `−2(2 + x₁)h`; `6x/(1 + 9x⁴)^{3/2}` changes sign at `0` | holds | none |
| 2.3 | `g_s = e^{−2s|x|²} g`; hyperbola | `dφ(ν_in) = 2s`, `II = e^{−s}(1 − 2s)h`, zero at `s = 1/2`; `(1 + 2x²)^{−3/2} → 0` | holds | none |
| 3.1 | `ρ′ = (2 + x₁)(1 − |x|²)` at `x₁ = −3`; independence of `ρ` | `(−1)(−8) = 8`, `{ρ′ ≥ 0}` = ball ∪ `{x₁ ≤ −2}`; a zero of `ρ ≥ 0` on an open set is a minimum, so regular zeros are frontier points and both boundaries are the frontier | holds | none |
| 3.3 `ρ̃` | `[0, 1]` with `t/2`, `1 − t/2`; `∂M = ∅` | `M̃ = (−1/2, 3/2)`, `ρ̃ = 2x` on `|x| < 1/4`, `|dρ̃/dx| = 2`; `ρ̃ ≡ 1` | regular value `0` | none |
| 3.4 metric extension | `(x + 1/100) dx²` on `[0, 1] ⊆ ℝ` | positive only for `x > −1/100`; `χ g_ext + (1 − χ) g_N` positive where `supp χ` lies in the positivity set | holds | none |
| 3.5 realisation (headline) and R5c comparison (repaired) | disc, `c(q, t) = (1 − t/2)q`; closed `M`; `[0, ∞)`; `M` compact with a closed component | `M̃ = {|x| < 3/2}`, `int M = {t > 0}`, `−ρ̃ = 2(|x| − 1) < 0` on `3/4 < |x| < 1`; `−ρ̃ ≡ −1`, R5c's `ρ = −1`; `M̃ ≅ (−1, ∞)`, not compact, outside R5c; double has two copies of the closed component, first copy `{ρ_D ≥ 0}` | holds; compact collar case cited to R5c | none |
| 3.6 Gauss sign | sphere; cylinder | `0 + 1·1 − 0 = 1`; `0 + 1·0 − 0 = 0` | holds | none |
| 4.2 second-order contact (headline) | ball; exterior; `{y ≥ x⁴}` | `−t²`, `−|dρ| II = −2`; `+t²`; `−t⁴` with `II = 0` | holds | none |
| 4.3 `ρ̂` | `{ρ̂ ≥ −ε} ∖ M`, `0 < ε < 1` | off `M ∪ W`: `−1 < −ε`; on `W ∖ M`: `ρ̂ ≤ max(r, −1)`, so `r ≥ −ε` | holds | none |
| 4.4 | ball radius `R`; strip `[0, 1] × ℝ` | `h_r = (1 − r/R)² h₀`, `−½ ∂_r = h₀/R`; normal coordinate `0.8` against distance `0.2` | holds | none |
| 4.5 convexity function (headline) | disc at `(0, −1)`; exterior | `Hess x̃ = (2 − 2ε)g`, `dx̃_q = 2q = −dρ_q`, `K_c ⊆ {ε|z − q|² ≤ c}`; `−(2 + 2ε)g` | holds | none |
| 5.1 strata | disc; `[a, b]` | torus, two circles, closed annulus; four points, `μ = ±1`, `∂₀SM = ∅` | holds | none |
| 5.2 flow identities | annulus `1 ≤ |x| ≤ 2` | `|(−3/2, −1)|² = 13/4 ≤ 4`, `τ = 3/2 + √3`; from height `−1 + δ`: `3/2 − √(2δ − δ²)` | holds | none |
| 5.3 fold form | `y − t²`; `y − t⁴` | `Q = r`, `a = y`, roots `±√y`; roots `±y^{1/4}`, not of the form | holds | none |
| 5.4 regularity (headline) | ball; disc at `(0, −1)`; `z ∈ ∂₋SM ∖ ∂₀SM` | `τ(x, v)τ(x, −v) = (−b + √(b² + c))(b + √(b² + c)) = c = 1 − |x|²`, `a = 4(b² + c)`, `Q(±√a) = (−2b ± √a)/2`; `μ/τ̃ = 1/2 = II/2`; `∂_t h = |dρ| μ < 0`, implicit root is `τ` nearby | holds | none |
| 5.5 criteria (headline) | ball `f = ⟨x, v⟩`; closed `M ≠ ∅`; `M = ∅`; half-circle | bound `(1 − (−1))/1 = 2`; (F, F, F); (T, T, T); `τ(θ, ±1) = π/2 ∓ θ`, (T, T, T) | holds | none |
| 5.6 scattering (headline) | ball; `[a, b]`; disc | `⟨x − 2⟨x, v⟩v, v⟩ = −⟨x, v⟩`; `α(b, +1) = φ_{−(b − a)}(b, +1) = (a, +1)`; `ℓ = 2μ = 2√(1 − |w|²)` | holds | none |
| 6.1 | general speed; ellipse vertex | `|v|²t² + 2bt − (R² − |x − c|²) = 0`, at `x = c`, `v = e₁/4`: `4`; `(2/b²)/(2/a) = a/b²` | holds | none |
| 6.2 | unit circle, `q = (1, 0)`, `v = (0, 1)` | `ρ = t²`, `II = −h`; source `r̈(0) = 1 > 0` | holds; naming differs | R02 |
| 6.3 | cap; hyperbolic plane | `−cos R/ sin R` gives `II = cot R h`; `Hess u_xx = 1/(2y) + (x² + 1)/(2y³) = u/y²`, `Hess u_xy = −x/y² + x/y² = 0`, `|du|² = u² − 1`, `II = coth R h`; `coth 1 ≈ 1.313`, `cot 1 ≈ 0.642` | holds | none |
| 6.4 | flat torus, `R = 1/4` | `ρ = 1/16 − |z|²` smooth on `B(p, 1/2)` only; `II = 4h` | holds on `B(p, r_p)` | R01 |
| 6.5 | `b = r e^{φ(r²)}`; `φ = s² − 2s`; `φ = −s t` | `b′ = e^φ(1 + 2r²φ′)`, `II = e^φ(1/r + 2rφ′)h = (b′/r)h`; `1 + 2r²(2r² − 2) = (2r² − 1)²`, `b′(1) = e⁻¹`, `b′(1/√2) = 0`; `b_s″ = −2sr e^{−sr²}(3 − 2sr²) ≤ 0` for `0 ≤ s < 1/2` | holds | none |

**Duplication and ownership.** Roadmap search (open heads and main) for scattering relation, exit
time, non-trapping, boundary defining function, strictly convex boundary, convex boundary, boundary
normal coordinates, lens data and rigidity, mean-convex, Seeley, second fundamental form. Only this
design states the first nine; "exit time" on main is the stochastic one; Seeley is
ComplexKahlerGeometry K5a (cited); second fundamental forms on main are R5a's immersion form
(cited), MinimalSurfaces, AffineMorseLefschetz and CalibratedGeometry (consumers of R5a's form), and
in LorentzianGeometry and ManifoldOptimization (open) the semi-Riemannian and boundaryless ones.
MathematicalBilliards (the roadmap this one is placed after) owns planar tables given by curves in
`ℂ`, with exit points of rays in convex plane sets; it states no manifold with boundary and no
`II`. Second owners on main: RiemannianGeometry R7.9 and R5c, both cited. The board's package
index lists no other geometric package.

Overlap check: read ManifoldOptimization, LorentzianGeometry, SmoothBundlesConnections (open), RiemannianGeometry with Surfaces, HopfRinow (main) and MathematicalBilliards; the sublevel inclusion, outward criterion, normal collar and defining function of a compact separating hypersurface: owner RiemannianGeometry R7.9, cited; the compact case of the realisation and the defining function of a relatively compact domain: owner RiemannianGeometry R5c, cited; nothing else shared.

**Shape.** Layers are named by their mathematics and ordered by their dependency lines (Layer 2
needs 1.4–1.6; Layer 3 needs Layer 1; Layer 4 needs 3.1, 3.5; Layer 5 needs 4.1–4.3, 4.6; Layer 6
needs all). The README does not say it follows a source.

**Headline theorems and padding.** Seven end theorems in the Summary: 2.2, 3.5, 4.2, 4.5, 5.4, 5.5,
5.6. There is no `Suggested.lean` at the design stage, so the one-tactic probe, the binder audit
and the import check have nothing to inspect. Elaboration: not available (this lane does not
elaborate). No Lean command was run.

**Copyright and arrangement.** Fifteen passages were set beside the sources: 1.1, 1.2, 1.3, 1.4,
2.1, 2.2, 3.5, 4.2, 4.5, 5.2, 5.3 (statement and route against Lemma 3.2.10 and its proof), 5.4,
5.5 (against Proposition 3.3.1 and its proof), 5.6, 6.5. Shared material is formulas, standard
names and theorem statements whose hypotheses can be written one way; no run of consecutive source
words beyond a formula. Contents of paternain-salo-uhlmann2023 (§2.5, §3.1–3.3) against the layers:
§3.1 is spread over Layers 1–5 (1.1, 1.4, 2.1, 3.5, 4.2, 4.3, 5.1, 5.2), §3.2 ↔ 5.3–5.4,
§3.3 ↔ 5.1, 5.5, 5.6, §2.5 ↔ 6.5; the order inside Layer 5 is forced (5.2 needs 5.1; 5.4 needs
5.1–5.3; 5.5 and 5.6 need 5.4), and Layers 1–4 and 6 map onto no run of sections. No table, figure
or exercise list is reused.

Source independence: 15 passages compared with 3 sources, none shared; largest share paternain-salo-uhlmann2023, 47 of 87 source mentions; contents compared with paternain-salo-uhlmann2023: independent.

## Not verifiable

- lee-riemannian2018 (Ch. 5–8), lee-smooth2012 (Theorem 9.25), sharafutdinov1994 (Ch. 4): settled
  as uncertified; not read. 1.5, 3.6, 4.4 and the general statement of 6.4 have no certified
  locator besides them; their signs and normalisations are fixed by the computed values above.
- The arXiv texts were read at the recorded versions (uhlmann-vasy2016 v1,
  stefanov-uhlmann-vasy2021 v3), not against the journal typesetting.
- No elaboration: there is no Lean file and this lane does not elaborate.
- The hypotheses of the pinned Tau Ceti declarations were matched by name and location; the
  variable blocks of the three opened this round were not re-read line by line beyond what the
  round-7 and repair reports record.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Corollary 2.5.3(b), printed p. 47: the source says the derivative of `b` is positive at radius 1; it should be at the outer radius `r₁`; affects a stated result.
- **Misprint** in paternain-salo-uhlmann2023 at Lemma 3.2.11, printed p. 64: the source says the second factor of `T` is the exit time at the point "x minus v"; it should be the exit time of the reversed vector `(x, −v)`; affects a stated result.

## For the human reviewers

- **Licence.** paternain-salo-uhlmann2023 was read from an author's page copy carrying the publisher's personal-use notice (`packages/RiemannianManifoldsWithConvexBoundary/sources.toml`, `licence_class = "author-page"`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "325829bbd9b82fd33b309e56c650633e4c27b7ec", "job": "REV-DESIGN-RiemannianManifoldsWithConvexBoundary~8", "model": "fable", "worker": "chris-x29"} -->
