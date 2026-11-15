# FIX-DESIGN-RiemannianManifoldsWithConvexBoundary~16

Findings of REV-DESIGN-RiemannianManifoldsWithConvexBoundary~15 (two, both P3). Both were verified
and applied. The review's "For the human reviewers" section (the licence of the author's-page copy
of paternain-salo-uhlmann2023) lists no finding, so nothing was changed for it.

## F01 (P3) — applied

Verified. RiemannianGeometry's Conventions (`TauCetiRoadmap/RiemannianGeometry/README.md`, line 156
on main) fix finite-dimensional, Hausdorff, second-countable, boundaryless manifolds as the standing
setting. R5a (line 3205) adds no setting of its own, so R5a's `B`, `S_η` and mean curvature vector
exist only there. 3.1 admits every Hausdorff `N`, and an uncountable disjoint union of planes is
outside R5a.

Changes (old → new):

- README 3.6: "regular domain … of `(N, g)`" → "of a second-countable `(N, g)` as in 3.1
  (RiemannianGeometry's standing setting, in which R5a is stated; …), … both Hausdorff and second
  countable (`∂M` carries the subspace topology of `N`, by 3.1)".
- Supplier contract: "R5a (for an isometric immersion of boundaryless manifolds" → "R5a (in
  RiemannianGeometry's standing setting, Hausdorff, second-countable, boundaryless: for an
  isometric immersion of such manifolds".
- Plan 3.6: the statement now says "second-countable (N, g)", and a new hypothesis "N second
  countable (the standing setting of RiemannianGeometry R5a) …" was added. The RiemannianGeometry
  supplier entry's R5a clause gained the same setting.

Pattern: the Conventions paragraph on `II` cites "R5a's `B` of `∂M` in an extension". It now reads
"in a second-countable extension (3.6)". The other users of R5a already satisfy the hypothesis:

- 6.5 works in `(ℝⁿ⁺¹, e^{2φ} g)`.
- PositiveMass 5.1–5.2 (Downstream consumers) uses the realisations of 3.5, which are second
  countable by 3.5's statement.
- 1.5 cites R5a only for the averaged convention.

The three Checks of 3.6 (sphere, cylinder, exterior, all in `ℝⁿ⁺¹`) are unchanged.

## F02 (P3) — applied

Verified. In 6.3 the centre `p` was used but never introduced, and `|dρ| = sin R` needs `|p| = 1`.
For `p = 2e` and `R = π/3` the set is the cap of radius `arccos(1/4)`, with `II = h/√15`.

Changes (old → new):

- README 6.3: "for the cap `C_R = {⟨x, p⟩ ≥ cos R}`" → "for `p ∈ S^{n+1}` (a unit vector of
  `ℝⁿ⁺²`) and the cap … of geodesic radius `R` about `p`".
- The cap Check now shows where `|p| = 1` enters: `grad ρ = p − ⟨x, p⟩x` and
  `|dρ|² = |p|² − ⟨x, p⟩²`.
- A negative-control Check was added for `p = 2e`.
- Plan 6.3.1: the statement was revised to match, and a new hypothesis "p ∈ S^{n+1} …" was added.
  Test `cap_values` was revised and a new test `unit_centre` (non-example) was added.

Pattern: the centre `c` of the ball in 6.1 and of the exterior in 6.2 was also used without being
introduced. It needs no constraint, but README 6.1 and 6.2 now say "`c ∈ ℝⁿ⁺¹`", and the plan
hypotheses of 6.1.1 and 6.2 say "c ∈ ℝⁿ⁺¹ and R > 0". The other caps already name their centre or
radius:

- 4.4's cap `{φ ≤ φ₀}` uses the polar angle from the pole.
- 4.6's cap is given by its radius.
- 6.4 refers back to 6.3's caps.

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 3.6, second-countable `N` | unit ball in `ℝⁿ⁺¹`; exterior; solid cylinder in `ℝ³`; uncountable union of planes with `ρ = 1 − ǀxǀ²`; `n = 0` | `⟨B, ν_in⟩ = ⟨−⟨X,Y⟩x, −x⟩ = h = II`; `⟨B, +x⟩ = −h = II`; `K = 0 + 1·0 − 0 = 0`; union: not second countable, now excluded; `n = 0`: `T∂M = 0`, `B = 0 = II`, `H` not used | holds; the bad witness is excluded | hypothesis added |
| `∂M` in R5a's setting | `∂M = {ρ = 0} ⊆ N` | `j` is a closed embedding with the subspace topology (3.1), so `∂M` is a subspace of a Hausdorff, second-countable space; Tau Ceti's boundary manifold is boundaryless | both manifolds of the embedding meet R5a's setting | stated in 3.6 |
| Consumers of 3.6 | 6.5 with `φ(s) = −s`; PositiveMass realisation of the closed disc | `ℝⁿ⁺¹` is second countable, `II^ĝ = −e^{−1}h`; 3.5's `M̃` is second countable | unaffected | none |
| 6.3 cap, unit `p` | `R = π/4`; `R = π/2`; `R = 2π/3`; `p = 2e`, `R = π/3`; `n = 0` | `ǀdρǀ = sin R`, `II = cot R · h`: `1·h`, `0`, `−h/√3`; `p = 2e`: `ǀdρǀ = 2·√15/4 = √15/2 ≠ √3/2`, `II = (1/2)/(√15/2) h = h/√15 ≈ 0.258h ≠ 0.577h`; `S¹`: arc `ǀθǀ ≤ R` about `p`, `τ(θ, ±1) = R ∓ θ` | holds for unit `p`; the non-unit witness is excluded | hypothesis and Check added |
| 6.3 non-trapping route | `R = π/3`; `R = π/2` | `u = −⟨x, p⟩`, `Hess u = ⟨x, p⟩ g ≥ cos(π/3) g = g/2 > 0` on `C_R`; great sphere `{⟨x, p⟩ = 0}`: `0 ≥ cos(π/2) = 0`, so it lies in `C_R` | holds | none |
| 6.1/6.2, `c ∈ ℝⁿ⁺¹` | `c = 0`, `R = 1`; `c = 5e₁`, `R = 2`; exterior with `q = c + Re₁`, `v = e₂` | `II = h`; translation is an isometry, so `II = h/2`; `ρ(q + tv) = ǀRe₁ + te₂ǀ² − R² = t²` | holds for every `c`; no hypothesis was missing, only the quantifier | quantifier added |

## Checks

Dependency check, exact output (after the final edit):

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 239 roadmaps, 2253 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The plan parses as JSON. No LaTeX delimiter was
introduced.

There is no `Suggested.lean` at the design stage, so no elaboration or `#check` audit was run and no
Lean command was run. No gate failures were listed for this round.

## Notes for the maintainer

- No Lean names changed, and no ids this roadmap defines were renumbered or deleted.
- RiemannianGeometry R5a was cited on main as it is now (Conventions line 156 and the R5a section,
  line 3205).
- No supplier was added. `sources.toml` is unchanged.
- No ownership question arose: the changes add hypotheses and quantifiers only.
