<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13810#issuecomment-6900480490 -->
Review (claude) of 033558a

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) four `*Needs:*` lines disagree with the plan's prerequisites

   **Location.** `packages/RiemannianManifoldsWithConvexBoundary/design/README.md`: 4.3 "*Needs:* 1.3,
   3.1, 4.1; …"; 5.4 "*Needs:* 2.1, 2.3, 4.2, 4.3, 5.1, 5.2, 5.3; …"; 5.5 "*Needs:* 3.4, 4.6, 5.1, 5.2,
   5.4."; 6.1 "*Needs:* 1.4, 1.5, 2.1, 3.1, 3.2, 4.3, …"; and `design/plan.json`, targets 4.3.1–4.3.3,
   5.4.1–5.4.5, 5.5.1, 6.1.1–6.1.2.

   **Claim.** A `*Needs:*` line lists what the statement and its route need, item by item, and the plan
   records the same edges.

   **Witness.** Script over both files. Plan 5.5.1 has `target:4.2.1` (the route's `Xf = Hess u(v, v)`
   is 4.2's identity) and 5.4.3 has `target:1.4`; the README lines omit them. README 4.3 lists 4.1, 5.4
   lists 2.3 and 4.3, 6.1 lists 3.2; no plan target of those sections has them, even transitively.

   **Exact repair.** Make the README agree with the plan, whose edges are the ones the routes use:
   - 4.3: "*Needs:* 1.3, 3.1; HopfRinow Layers 1–2; …" and, in Layer 4's Dependencies, "4.3 uses 1.3,
     3.1, HopfRinow Layers 1–2, …" (the route uses `exp` of `N` and the lengths of 3.1, not 4.1; 4.1
     would put 4.3 behind 3.5).
   - 5.4: "*Needs:* 1.4, 2.1, 4.2, 5.1, 5.2, 5.3; …" and "5.4 uses 1.4, 2.1, 4.2 and 5.1–5.3" (the route
     uses any `ρ` of the regular domain, not `ρ̂`, and no uniform bound).
   - 5.5: "*Needs:* 3.4, 4.2, 4.6, 5.1, 5.2, 5.4." and "5.5 uses 3.4, 4.2, 4.6 and 5.1–5.4".
   - 6.1: "*Needs:* 1.4, 1.5, 2.1, 3.1, 4.3, 5.2, 5.4, 5.5, 5.6."

   **Repair test.** With these four lines, the same script reports, for every section 1.1–6.5, no
   README item outside the closure of the plan's prerequisites and no direct plan prerequisite absent
   from the README line. On the unit ball, 5.4's values use only `ρ = 1 − |x|²`: `μ/τ̃ = 1/2 = II/2`.

One finding, P3 (no P1, no P2): four README `*Needs:*` lines disagree with the plan's prerequisites.
It changes no statement, but it carries a repair, so the verdict asks for changes: a fix round
applies R01. Both round-11 findings are repaired. No false, vacuous or unowned statement was found;
every Check and formula recomputed this round agrees with its statement. No gap is declared. This
review changed no design file, plan or manifest entry.

## Previous findings and repairs

| Round-11 finding | Repaired passage | Assessment |
|---|---|---|
| F01 (P3): 6.1 states the signed distance of 4.3 without listing 4.3 | README 6.1: "*Needs:* 1.4, 1.5, 2.1, 3.1, 3.2, 4.3, 5.2, 5.4, 5.5, 5.6."; plan 6.1.1 `prerequisites` now contain `target:4.3.1`, `target:4.3.2` | **Repaired.** Script over the plan: the closure of 6.1.1 contains 4.3.1 and 4.3.2, both earlier in the plan's order. |
| F02 (P3): `ε` used for the tube radius and for the enlargement parameter | README 4.3: "for `0 < δ < 1` every point of `{ρ̂ ≥ −δ} ∖ M` lies in `W` with `r_{∂M} ≥ −δ`"; 4.6: "there is `δ₀` with `0 < δ₀ < min(ε₁, 1)` such that for `0 < δ ≤ δ₀`: `M_δ := {ρ̂ ≥ −δ}`"; 5.5: "`Xf > 0` on `SM_δ` … `τ_δ` the exit time of `M_δ`"; plan 4.3.3, its `sandwich` test, 4.6 and three of its tests | **Repaired.** Script over the plan: no target still contains `ε₀`, `M_ε` or `τ_ε`. The diff of the plan against the previous head is these statements and the two prerequisites only. |

Adversarial pass on what the repairs changed: rows "4.3 sandwich", "4.6" and "5.5 route" below.
The repaired patterns were sought in the rest of the design. A letter with two meanings in one
statement: none (the remaining `ε`, `δ` are bound in their own sentences: 1.1, 4.1, 4.2, 4.5, 5.1,
5.2, R7.9's collar width). A `*Needs:*` line that differs from the plan's prerequisites: four
sections (R01). Maintainer notes: none were supplied.

## Verified sound

**Coverage.** All 1,658 lines of the README were read in full this round; the plan (6 layers, 49
targets: 30 theorems, 10 definitions, 2 constructions, 7 examples; `gaps: []`); the six manifest
entries. By script: every `target:` prerequisite resolves and precedes its user; every definition
and construction has at least three tests; 31 `**Checks.**` blocks; each of the six layers ends with
Examples and Dependencies. Searched and found none: LaTeX delimiters, pull-request numbers, machine
paths, HTML anchors, `set_option`, the words "optional", "deferred", "for later", "so far",
"checkpoint", "handoff", round labels.

**Dependency check, exact output:**

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2242 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. No supplier is on the never-cite list. No gap is declared and
none is needed: every cited section and declaration exists where it is cited.

**Supplier citations resolved** on main (1a19c9f) this round, by heading and statement:
DifferentialGeometry 5.1 (line 1648), 12.1 (2801), 12.2 (2848), 12.3 (2871), 12.5 (2936;
`exists_halfSpaceOutwardUnitNormal` at 2949–2951 with "these three laws determine N at each point",
declared in its `Suggested.lean`, line 1020); HopfRinow (`Completed/HopfRinow/README.md`);
RiemannianGeometry 2.2 (R1.4) (1576), R5a (3205), R5c (3715), R7.9 (4469);
RiemannianGeometry/Surfaces 1.2 (296), 1.3 (340); GeometricTopology Layer 1 (783), 1.1 (788), 1.3
(851); ComplexKahlerGeometry K5a (5.1 at 1440; the half-space Seeley step at 1796);
SmoothBundlesConnections B6.0 (1306, 1327); consumers PositiveMass 5.1 (921), 5.2 (957),
AffineMorseLefschetz 4.5 (819), and the folders PositiveScalarCurvature and Yamabe. The citation
resolver, re-run, lists no cross-roadmap citation and no Lean name found nowhere. The overlap report
lists no dropped id, no revision-only id, no other pull request changing this roadmap and no second
copy (no folder of this name on main).

**Pinned declarations.** All 75 library names the README backticks were located by declaration at
the pins of `lake-manifest.json` (script over both libraries; the ambiguous last components opened
by hand). Opened this round, among them:
`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:360, 409` (context
`IsManifold I 2 M` at 153, no boundaryless hypothesis);
`Mathlib/Analysis/Calculus/ImplicitContDiff.lean:55` (namespace `ContDiffAt` at 50);
`Mathlib/Geometry/Manifold/IsManifold/InteriorBoundary.lean:103, 112, 330`;
`Mathlib/Geometry/Manifold/Instances/Real.lean:60, 200`;
`Mathlib/Geometry/Manifold/PartitionOfUnity.lean:123, 593, 797`;
`TauCeti/Geometry/Manifold/RegularValue/Scalar/Sublevel.lean:473, 639, 652, 675` (the sublevel
`{f ≤ a}` over `EuclideanHalfSpace (n + 1)`, boundary `f = a`, interior `f < a`: the README's use
for `−ρ ≤ 0` is right); `TauCeti/Geometry/Manifold/Riemannian/Geodesic/Basic.lean:102` (variables
at 85–92: any `ModelWithCorners`, as the README says);
`TauCeti/Geometry/Manifold/TubularNeighborhood/Riemannian/Noncompact.lean:58` (`[I.Boundaryless]
[J.Boundaryless] [T2Space N] [SecondCountableTopology N]` at 50, a smooth radius below any
continuous positive `ε`, closed embedding of the closed discs: as 4.3 uses it);
`TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Sphere.lean:143, 161` (boundaryless base, model
of dimension `finrank (E × F) − 1 = 2n + 1`); `…/Riemannian/Pullback/Basic.lean:158`;
`…/VectorBundle/Riemannian/Conformal.lean:87`; `…/Riemannian/Hessian/Conformal.lean:81`;
`…/Riemannian/Boundary.lean:115`; `…/Boundary/Orientation.lean:46, 63`;
`…/Boundary/Charts.lean:107, 321, 374`; `TauCeti/Analysis/Calculus/Hadamard.lean:115, 131`;
`TauCeti/Analysis/Calculus/ParametricIntegral.lean:211`. No name is missing at the pins.
`exists_halfSpaceOutwardUnitNormal` is DifferentialGeometry's and is attributed to it.

**Seeded source sample** (read in the cached texts this round; "book" is
paternain-salo-uhlmann2023, "article" is stefanov-uhlmann-vasy2021).

| Target | Locator read | Result |
|---|---|---|
| 1.1, 1.2 | book lines 2681–2696 | `∂±SM` by the sign of `⟨v, ν⟩` with `ν` the inward unit normal, `∂₀SM = S(∂M)`; as cited |
| 1.6 | book lines 2462–2473 | Lemma 2.5.2: sign of `b′(r̄)` decides convexity of the circle, `b′ = 0` gives a geodesic circle; as cited for the rotationally symmetric case |
| 3.2 | article lines 128–129, 198–205; uhlmann-vasy2016 lines 137–140, 507–509 | level sets strictly concave from the superlevel sets; the distance-minus-supremum example; `x̃(p) = 0`, `dx̃(p) = −dρ(p)`; as cited |
| 3.3, 3.4, 3.5 | book lines 2749–2762; article lines 96–97 | Lemma 3.1.8 (closed connected extension of a compact `M`), proved for subsets of `ℝⁿ`, the double left as Exercise 3.1.9; `M` not necessarily compact inside a boundaryless `M̃`; the README claims more and proves it itself |
| 4.3 | article lines 99–100, 220–221; book lines 2766–2773 | signed distance from a hypersurface, defined near it; Lemma 3.1.10: `ρ = d(·, ∂M)` near `∂M`, the three sign sets, `∇ρ = ν`; as cited |
| 5.1 | book lines 2646–2648, 2682–2696, 2931, 3063–3079; article lines 151–153 | `SM`, the strata, `μ`, the flow and `X`; the article's `∂₊` points outside and its `L` maps `∂₋` to `∂₊`; as cited |
| 5.3 | book lines 2970–3026, 3039–3045 | Lemma 3.2.10 with `a = h(g(y), y)`, `Q = g + S`, `∂_r S(0, y₀) > 0` (3020–3021); Exercise 3.2.12 has no parameters and line 3039 uses them: the README says so |
| 5.5 | book lines 3081–3106 | Proposition 3.3.1, compact `M` with strictly convex boundary, (i)–(iii); the proof's `M₁`, `τ₁`, `u = −∫₀^{τ₁} h ∘ φ_t`; as cited |
| 5.6 | book lines 3114–3127; article lines 150–163 | Definition 3.3.4, Lemma 3.3.5, Exercise 3.3.6; `L`, `ℓ` on `B∂M`; as cited |
| 6.1 | book lines 2849–2864, 307–310, 2677–2680 | the disc's `τ` and odd extension; strictly convex Euclidean domains; compact Euclidean subdomains non-trapping; as cited |
| 6.2 | book lines 2449–2473 | Definition 2.5.1: `r̈(0) > 0` is "strictly convex", viewed from `{r = r₁}`; the README's reading of the side is right (row 6.2 below) |
| 6.4 | book lines 2677–2678 | small spherical caps non-trapping; the general statement rests on lee-riemannian2018 (uncertified) and the route |

No author-flagged unverified locator exists. Also read: book lines 2499–2521 (6.3), 2659–2676 (5.2),
2865–2866, 2928–2931, 3027–3043 (5.4), 3110–3113; uhlmann-vasy2016 lines 505–506 (4.5).

**Adversarial table** (values computed this round: the sampled targets, the headlines, and the
targets the repairs and R01 touch).

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 1.1 trichotomy | half-plane, `v = (a, b)` | `dx⁰(v) = a`: outward `a < 0`, tangent `a = 0`, inward `a > 0`; a curve through `q` on `(−ε, ε)` has `x⁰ ∘ c ≥ 0` with minimum at `0`, so `a = 0` | holds | none |
| 1.2 normal, chart formula | `g = [[1, a], [a, 1]]`; `a = 1/2`; `[0, 1]` | `grad x⁰ = (1, −a)/(1 − a²)`; `g(e₀ − a e₁, e₀ − a e₁) = 1 − 2a² + a² = 1 − a²`; `(2/√3, −1/√3)`; `ν_out(0) = −∂_x`, `ν_out(1) = +∂_x` | holds; chart direction `e₀` excluded for `a ≠ 0` | none |
| 1.6 conformal law | derivation; `φ = log 2`; disc `φ = −ǀxǀ²`; constant `c` | `−(Hess ρ + ǀdρǀ dφ(ν_in) g)/(e^{−φ}ǀdρǀ) = e^{φ}(II − dφ(ν_in) h)`; `2h`; `dφ(−x) = 2`, `e^{−1}(1 − 2)h`, `Ĥ = e(1 − 2) = −e`; `c II` | holds; wrong sign gives `3e^{−1}h` | none |
| 2.2 Hessian iff (headline) | ball, `ρ` and `(2 + x₁)ρ`; exterior | on `T∂M`: `−2h`, `−2(2 + x₁)h`, factor in `[1, 3]`; `+2h` | both directions hold | none |
| 3.2 level sets | `x = ǀzǀ²`; affine `x`; `n = 0`; `ǀz − z₀ǀ` | `II{x ≤ c} = 2h/(2√c) = h/√c`, `II{x ≥ c} = −h/√c`; `Hess = 0`; `ker dx = 0`, vacuous; `Hess = (g − dx ⊗ dx)/ǀz − z₀ǀ`, eigenvalue `1/ǀz − z₀ǀ` on `ker dx` | holds | none |
| 3.3 `ρ̃ = φ₀ χ(t) + φ₁ s` | `t > 0`; `t < 0`; `ǀtǀ ≤ 1/2`, `∂M` compact; `[0, 1]`; `∂M = ∅` | sum of two terms `≥ 0`, not both `0`; both `≤ 0`; `φ₁ = 0`, `ρ̃ = t`; `M̃ = (−1/2, 3/2)`, `ρ̃ = 2x`, `ǀdρ̃/dxǀ = 2`; `ρ̃ ≡ 1` | regular value `0`, `M = {ρ̃ ≥ 0}` | none |
| 3.4 extension | `√x`; `(x + 1/100) dx²`; empty boundary | not `C¹` at `0`; coefficient `< 0` for `x < −1/100`, so the cutoff gluing is needed; no Seeley step | holds | none |
| 3.5 realisation (headline) | disc; `[0, 1]`, `(1 + x)² dx²`; closed `M`; `[0, ∞)`; compact `M` with a closed component; doubled point | `ℝ²` or `S²`; length `3/2` in every realisation; `ρ̃ ≡ 1`; `(−1, ∞)`; the double has the component twice, `ρ_D = ±1`; not Hausdorff, no realisation | holds | none |
| 4.2 second-order contact (headline) | ball; exterior; `{y ≥ x⁴}`; `n = 0` | `ρ(q + tv) = −t²`, `−ǀdρǀ II = −2`; `+t²`; `−t⁴` with `II = 0`; no nonzero tangent vector | iff holds; leaving does not give strict convexity | none |
| 4.3 tube and sign | any tube; sphere; strip | `E` injective and `Σ = E(Σ × 0)` give `f ≠ 0` off `r = 0`, sign constant on `{q} × (0, ε(q))`; `E = (1 − r)q`, `r_Σ = 1 − ǀxǀ` on `0 < ǀxǀ < 2`; `ρ(E(q, r)) = r(1 − r)` | holds | none |
| 4.3 sandwich (repaired) | `W ∖ (M ∪ W₁)`; off `M ∪ W`; `δ = 1`; unit ball, `ǀxǀ = 1.4` | `ρ̂ = ψ r − (1 − ψ)`, `r ≤ −ε₁`: if `r < −δ` both ends are `< −δ`; `ρ̂ = −1 < −δ`; `{ρ̂ ≥ −1} = N`; `r = −0.4`, `ρ̂ ∈ [−1, −0.4]` | holds; `δ < 1` needed | R01 (Needs) |
| 4.5 convexity function (headline) | disc at `q = (0, −1)`; exterior; `c = 0`; `[0, 1]` | `Hess x̃ = (2 − 2ε)g`, `dx̃_q = 2q = (0, −2) = −dρ_q`, `K_c ⊆ {εǀz − qǀ² ≤ c}`; `−(2 + 2ε)g`; `K₀ = {q}`; `{x + εx² ≤ c}` | holds | none |
| 4.6 enlargement (repaired) | ball, `ε₁ = 1/4`, `δ = 0.2`; cap `R = 1.4`; `(1 − r²)e^{−r²}` | radius `1.2`, `II = h/1.2`; convex iff `δ < π/2 − 1.4 = 0.171`; radial derivative `−2r(2 − r²)e^{−r²}`: `−2/e` at `1`, `0` at `√2`, minimum `−e^{−2} = −0.135` | holds; `δ₀` depends on the domain | none |
| 5.1 strata | disc; `[a, b]`; `μ` on a fibre, `n ≥ 1`; glancing point | torus, two circles, closed annulus; four points, `μ = ±1`; `dμ = ⟨·, ν_in⟩ ≠ 0` at `v ⊥ ν`; `σ̃(φ_t z) = −2⟨(t, −1), (1, 0)⟩ = −2t` | holds | none |
| 5.2 exit time | annulus at `(−3/2, −1)`; speed `λ` | `ǀxǀ² = 13/4 ≤ 4`; exit at `x = √3`: `3/2 + √3`; against `3/2 − √(2δ − δ²)`; `τ(x, λv) = τ(x, v)/λ` | discontinuous without convexity | none |
| 5.3 fold form, even functions | `y − t²`; `y − t⁴`; `cos r`; `ǀrǀ` | `g = 0`, `F = 1`, `Q = r`, `a = y`, `∂_r Q = 1`; `∂_t² h = 0`, roots `±y^{1/4}`; `H(s) = Σ(−s)^k/(2k)!`; not smooth | holds | none |
| 5.4 regularity (headline) | ball, `b = ⟨x, v⟩`, `c = 1 − ǀxǀ²`; radius `R`; `[a, b]` | roots `−b ± √(b² + c)`, `σ = −2b`, `T = c`, `(σ + √(σ² + 4T))/2 = −b + √(b² + c)`; `μ/τ̃ = (−b/R)/(−2b) = 1/(2R) = II/2`; `σ = a + b − 2x`, `Xσ = −2` | holds; uses no `ρ̂` and no uniform bound | R01 (Needs) |
| 5.5 criteria (headline) | ball, `f = ⟨x, v⟩`; closed `M ≠ ∅`; `M = ∅`; half-circle; `u = −∫₀^{τ_δ} h ∘ φ_t` | `(1 − (−1))/1 = 2`; (F, F, F); (T, T, T); `τ(θ, ±1) = π/2 ∓ θ`; `u(φ_s z) = −∫_s^{τ_δ(z)} h(φ_t z) dt`, derivative `+h(z)`; `Xf = Hess u(v, v)` is 4.2's identity | equivalence holds on each | R01 (Needs) |
| 5.6 scattering (headline) | ball; disc; `[a, b]`; `z ∈ ∂₊SM` | `⟨x − 2bv, v⟩ = −b`, `α² = id`, fixed points `b = 0`; `τ = 2μ`, `μ = √(1 − ǀwǀ²)`, `ℓ = 2√(1 − ǀwǀ²)`; `α(a, +1) = (b, +1)`; `τ̃(αz) = −τ(z)`, `α(αz) = φ_{−τ}φ_τ z = z` | holds | none |
| 6.1 ball and convex domains | speed `1/4`; ellipse vertex; graph form; signed distance | `(0 + √(1/16))/(1/16) = 4 ≤ 2/(1/4) = 8`; `(2/b²)/(2/a) = a/b²`; `ρ = x₀ − w`, `Hess ρ = −D²w`, `ǀdρǀ = 1`; `ǀE − cǀ = R − r` | holds | R01 (Needs) |
| 6.2 half-space, exterior | exterior, `ρ = ǀx − cǀ² − R²`; the source's name | `−2g/(2R) = −h/R`, `ρ(q + tv) = t²ǀvǀ²`; `ǀq + tvǀ² = 1 + t²`, `r̈(0) = 1 > 0`: "strictly convex" for the ball `{r ≤ 1}`, concave for `{r ≥ 1}` | holds | none |
| 6.3 caps, hyperbolic | cap; `R < π/2`; hyperbolic ball | `−(−cos R · g)/sin R = cot R · h`; `Hess(−⟨x, p⟩) = ⟨x, p⟩ g ≥ cos R · g > 0`; `u = cosh d`, `ǀduǀ = sinh R`, `II = cosh R · h/sinh R` | holds | none |
| 6.4 small balls | normal coordinates; torus `R = 1/4`; `S¹` | `2δ_ij − 2z_k Γ^k_ij = 2g_ij + O(ǀzǀ²)`; `II = 2h/(2 · 1/4) = 4h`, `τ ≤ (1/4 + 1/4)/1 = 1/2`; `θ²` smooth on `B(p, π)` | holds | none |
| 6.5 conformal ball | general `φ`; `φ = s² − 2s`; `φ = −s` | `II = e^{φ}(1/r + 2rφ′)h = (b′/r)h`; `1 + 2r²(2r² − 2) = (2r² − 1)²`, zero at `1/√2`; `b′(1) = −e^{−1}` | holds | none |

Sections 1.3–1.5, 2.1, 2.3, 3.1, 3.6, 4.1 and 4.4 were re-read and their Checks recomputed with the
values of round 11's rows (for instance `(−1)(−8) = 8` and `dρ′ = (1 − ǀxǀ²) dx₁` on `x₁ = −2`;
`(1 + 2x²)^{−3/2} → 0`; `0 + 1·1 − 0 = 1`; `a = sin(φ₀ − r)/sin φ₀`, `−a_r(0) = cot φ₀`; strip point
`(0.8, 0)`: normal coordinate `0.8`, distance `0.2`).

**Duplication and ownership.** Roadmap search this round (open heads, then main), README text, for:
scattering relation, non-trapping, boundary defining function, strictly convex boundary, boundary
normal coordinates, lens rigidity or lens data, mean-convex: no match outside this roadmap. "Exit
time" matches on main only (stochastic and flow-box senses). MathematicalBilliards (open, last in
the merge order) owns planar convex tables as closed curves in `ℂ` and their billiard map: no
manifold with boundary, no `II`, no shared object. LorentzianGeometry (open) defines `k` for a
nondegenerate hypersurface of a boundaryless manifold with a chosen unit normal: another carrier.
ManifoldOptimization cites R5a for `B`. Ownership against the open pull requests was checked through
the roadmap tools at their heads; the board's package index lists AnalyticNumberTheory and
LawrenceVenkateshMethod only.

Overlap check: read ManifoldOptimization, LorentzianGeometry, SmoothBundlesConnections, TeichmullerGeometry, RealSemisimpleLieGroups (open), RiemannianGeometry, Surfaces, HopfRinow (main); the sublevel inclusion, outward criterion, normal collar and defining function of a compact separating hypersurface: owner RiemannianGeometry R7.9, cited; the compact case of the realisation: owner RiemannianGeometry R5c, cited; the normal strip of an arc in a surface: owner Surfaces 1.2–1.3, named in the Scope; uniform normal radii: owner SmoothBundlesConnections B6.0, cited; nothing else shared. The third list (results and headings) is empty.

**Shape.** Layers are named by their mathematics and the README does not say it follows a source.
The order is forced by the dependency lines: Layer 2 needs 1.4–1.6; Layer 3 needs Layer 1; Layer 4
needs 3.1 and 3.5; Layer 5 needs 4.1–4.2 and 4.6; Layer 6 needs all. Every definition (1.3, 1.4,
1.5, 2.1, 3.1, 3.2, 5.1, 5.2, 5.4's `τ̃`, 5.6) has its API bullets and at least three Checks; every
theorem has its hypotheses in the sentence and a locator.

**Headline theorems and padding.** Seven end theorems in the Summary: 2.2, 3.5, 4.2, 4.5, 5.4, 5.5,
5.6. There is no `Suggested.lean` at the design stage, so the one-tactic probe, the binder audit and
the import check have nothing to inspect; the README attributes no backticked Lean name to this
roadmap. Elaboration: not available (this lane does not elaborate). No Lean command was run.

**Copyright and arrangement.** Twenty passages were set beside the sources: the sampled sections
above and 2.1 (Definition 2.5.1), 5.2 (Definitions 3.1.1, 3.1.3), 5.4 (Lemma 3.2.11), 4.5
(uhlmann-vasy2016 lines 505–509) and 6.3 (Examples 2.5.4–2.5.5). What is shared is formulas, standard
names and the hypotheses of Lemma 3.2.10, which can be written one way (longest run: seven tokens of
"smooth near `(0, y₀)` in `ℝ × ℝ^K`"). Contents of the book against the layers: §3.1 is spread over
1.1, 1.4, 2.1, 3.5, 4.1, 4.2, 4.3, 5.1, 5.2; §3.2 ↔ 5.3–5.4; §3.3 ↔ 5.5–5.6; §2.5 ↔ 1.6, 6.2, 6.5.
The order inside Layer 5 is forced (5.2 needs 5.1; 5.4 needs 5.1–5.3; 5.5 and 5.6 need 5.4), and 5.3
is placed before its use, unlike the source. Layers 1–4 and 6 map onto no run of sections. No table,
figure or exercise list is reused.

Source independence: 20 passages compared with 3 sources, none shared; largest share paternain-salo-uhlmann2023, 38 of 65 named source mentions in the layers; contents compared with paternain-salo-uhlmann2023: independent.

## Not verifiable

- lee-riemannian2018 (Ch. 5–8), lee-smooth2012 (Theorem 9.25), sharafutdinov1994 (Ch. 4): settled
  as uncertified; not read. 1.5, 3.6, the form `dr² + h_r` of 4.4 and the general statement of 6.4
  have no certified locator besides them; their signs and normalisations are fixed by the computed
  values above.
- The arXiv texts were read at the recorded versions (uhlmann-vasy2016 v1,
  stefanov-uhlmann-vasy2021 v3), not against the journal typesetting.
- No elaboration: there is no Lean file and this lane does not elaborate.
- The citation resolver reported that Lean names outside the roadmaps were not checked by it; they
  were checked by hand at the pins, as listed above.

## Source issues

- **Misprint** in paternain-salo-uhlmann2023 at Corollary 2.5.3(b), printed p. 47: the source says the derivative of `b` is positive at radius 1; it should be at the outer radius `r₁`; affects a stated result.
- **Misprint** in paternain-salo-uhlmann2023 at Lemma 3.2.11, printed p. 64: the source says the second factor of `T` is the exit time at the point "x minus v"; it should be the exit time of the reversed vector `(x, −v)`; affects a stated result.

## For the human reviewers

- **Licence.** paternain-salo-uhlmann2023 was read from an author's page copy carrying the publisher's personal-use notice (`packages/RiemannianManifoldsWithConvexBoundary/sources.toml`, `licence_class = "author-page"`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "033558ab966d3f08d5308ebad3ec1b9c68568ad2", "job": "REV-DESIGN-RiemannianManifoldsWithConvexBoundary~12", "model": "fable", "worker": "chris-x79"} -->
