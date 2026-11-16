# FIX-DESIGN-RiemannianManifoldsWithConvexBoundary~17

REV-DESIGN-RiemannianManifoldsWithConvexBoundary~16 raised one finding (P3). It was verified and
applied as asked. The same omission was then searched across every *Needs:* line and every plan
prerequisite list, and the other occurrences were repaired (listed below). The review's "For the
human reviewers" section (the licence of the author's-page copy of paternain-salo-uhlmann2023)
lists no finding, so nothing was changed for it.

## F01 (P3) — applied

Verified. 6.3 states that `C_R` is non-trapping and that `τ(θ, ±1) = R ∓ θ` for `n = 0`. Both `τ`
and non-trapping are defined in 5.2, and the value comes from 5.2's realisation formula. Siblings
6.1 and 6.2 list 5.2.

Old → new: README 6.3 *Needs:* "1.4, 2.1, 3.1, 3.2, 5.5; …" → "1.4, 2.1, 3.1, 3.2, 3.6, 5.2, 5.5;
RiemannianGeometry R5a (…); …". Layer 6 Dependencies now include 3.6, 5.2 and R5a for 6.3. Plan:
6.3.1 gains `target:5.2`, `target:3.6` and `roadmap:RiemannianGeometry §R5a`; 6.3.2 gains
`target:5.2`.

Why 3.6 and R5a were added as well: 6.3 also says `∂C_R` is "totally geodesic at `R = π/2`". Total
geodesicity is RiemannianGeometry R5a's notion ("B=0 is equivalent to total geodesicity",
`TauCetiRoadmap/RiemannianGeometry/README.md` line 3260 on main at 623d55d). The step from `II = 0`
to `B = 0` is 3.6. 6.5, which makes the same claim, already lists both.

Repair test, recomputed: `n = 0`, `R = 3π/4`. The geodesic `θ + t` stays in `{|θ| ≤ R}` exactly
for `t ≤ 3π/4 − θ`, and `R < π`, so the arc does not close up. That gives `τ(θ, +1) = 3π/4 − θ`,
and likewise `τ(θ, −1) = 3π/4 + θ`. 5.2 comes before 6.3, so there is no cycle.

## Pattern repair: the same omission in other *Needs:* lines and plan prerequisites

Rule used, mirroring the finding: a *Needs:* line, and a plan target's prerequisites, must name
every earlier section of this roadmap whose defined notion or result its statement, hypotheses
or route names. Two things are not repeated in every line:

- the Conventions' vocabulary (`T_q∂M`, inward/outward, `ν_out`/`ν_in`);
- a layer's standing setting (the Layer 4 and 5 preambles: `M` a regular domain, 3.1).

The README and plan were scanned by script for every defined notion (`II`, principal curvatures,
`H`, defining function, the convexity predicates, regular domain, level-set concavity, `ρ̂`,
`M_δ`, `SM` and its strata, `μ`, `X`, `τ`, non-trapping, `τ̃`, `σ`, `α`, total geodesicity, geodesic
of `M`) and for explicit section numbers. Each hit was then read by hand. Occurrences repaired
(README *Needs:* line, the layer's Dependencies paragraph, and the plan):

| Section | What its text names | Added (README) | Added (plan) |
|---|---|---|---|
| 2.3 | "every principal curvature is at least `c`" | 1.5 | 2.3.2: `target:1.5` (and the clause added to 2.3.2's statement, as in the README) |
| 3.2 | "with defining function `c − x`" | 1.3 | 3.2: `target:1.3`; 3.4.2 ("regular domain"): `target:3.1` |
| 4.6 | strictly convex (hypothesis, conclusion); "the defining function `ρ̂ + δ`"; `II_{M_δ}`, `II_{∂M}` in the route | 1.3, 1.4, 2.1 | 4.6: `target:1.3`, `target:1.4`, `target:2.1`; 4.2.3 (hypothesis "∂M strictly convex"): `target:2.1` |
| 5.2 | "`τ = 0` on `∂₀S_qM` if `∂M` is strictly convex at `q`" | 2.1 | 5.2: `target:2.1` |
| 5.4 | (README already complete) | none | 5.4.4: `target:1.4`, `target:2.1`; 5.4.1, 5.4.5: `target:2.1`; 5.4.2: `target:2.1`, `target:5.1`; 5.4.3: `target:2.1`, `target:5.1`, `target:5.2` |
| 5.5 | "with strictly convex boundary" | 2.1 | 5.5.2: `target:2.1`, `target:5.1`, `target:5.2` |
| 5.6 | "`∂M` strictly convex"; "with `γ_z` the geodesic of `M`" (4.1's correspondence) | 2.1, 4.1 | 5.6.1: `target:2.1`, `target:4.1`; 5.6.2 (`ℓ := τ ∘ …`): `target:2.1`, `target:5.2` |
| 6.1 | `τ̃`, `α` "on `∂SM`"; `(x, v) ∈ SD` | 5.1 | 6.1.1, 6.1.2: `target:5.1` |
| 6.2 | "`τ = ∞` on `∂₀SM`" | 5.1 | 6.2: `target:5.1` |
| 6.4 | "with defining function `R² − d(p, ·)²`; its boundary is strictly convex and it is non-trapping" | 1.3, 2.1, 5.2 | 6.4: `target:1.3`, `target:2.1`, `target:5.2` |
| 6.5 | `II^ĝ = (b′(r)/r) h_eucl` | 1.4 | 6.5: `target:1.4` |
| 3.1 | (README "1.1–1.4" already complete; the plan lacked two) | none | 3.1: `target:1.1`, `target:1.2` |

Further related edits:

- 1.6 used 2.1's later notion: "so strict convexity is preserved" became "so the sign of
  `II_q(u, u)` is preserved for every `q ∈ ∂M` and `u ∈ T_q∂M`". 2.1's API bullet already gives the
  convexity reading.
- 6.3 and 6.5 consume R5a's "`B = 0` iff totally geodesic", which the R5a supplier contract did not
  list. The README contract and the plan's RiemannianGeometry supplier entry now name it.

After the edits, the README-versus-plan comparison by section (internal prerequisites) shows no
difference in any of the 32 sections. Before this round 3.1 and 5.4 differed. Every
`target:` prerequisite of the 49 plan targets exists and precedes its user, there are no duplicate
entries, and `gaps` stays `[]`. All added edges point to earlier sections, so the build order is
unchanged and no cycle arises.

Scan hits left unrepaired, by the rule above:

- Conventions vocabulary (`T_q∂M` in 1.5, 2.1–2.3, 4.4; inward/outward in 4.1, 4.2, 5.2; `ν_in` or
  `ν_out` in 1.5, 2.1, 3.6, 4.2, 4.3, 6.1).
- 5.5's "3.4 for the regular domain `SM`": `SM` being a regular domain is 5.1's result, and 5.1 is
  listed; 3.1 is the Layer 5 setting.
- 5.3's function named `H`, which is not the mean curvature.
- Forward pointers: 1.3 to 4.3, 4.3 to 4.4 and 4.6, 3.6's "in particular a realisation from 3.5".

## Adversarial pass on the changed statements

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 6.3, `n = 0` exit time (F01) | `R = 3π/4`, `θ = 0`; `θ = π/2`, direction `−1` | `τ(0, ±1) = 3π/4`; `τ(π/2, −1) = 3π/4 + π/2 = 5π/4 ≤ 3π/2`; exit at `θ = −3π/4` | matches `R ∓ θ` and the Check bound `3π/2` | 5.2 listed |
| 6.3, hemisphere totally geodesic | `R = π/2`, `n = 1` | `II = cot(π/2) h = 0`; 3.6: `B = II ν_in = 0`; R5a: `B = 0` iff totally geodesic; `\|dρ\| = sin(π/2) = 1 ≠ 0`, so `0` is a regular value and 3.6 applies in the second-countable `S²` | holds | 3.6, R5a listed |
| 6.3, cap `II` (recomputed) | `R = π/4`; `R = 2π/3` | `cot = 1`, `II = h`; `cot(2π/3) = −1/√3`, strictly concave, as stated for `R > π/2` | holds | none |
| 1.6 rephrased bullet | `φ = (\|x\|² − 1)²`; `φ ≡ log 2`; `φ = −\|x\|²` (hypothesis fails); `n = 0` | `II^ĝ = h = II`, sign `+` both; `2h` vs `h`, sign `+` both; `dφ(ν_in) = 2 ≠ 0`, `II^ĝ = −e^{−1}h` vs `h`: sign flips, so the hypothesis is needed; zero form on the zero space | holds | wording only |
| 2.3.2 added clause | unit ball; ball of radius 2; `n = 0` | `S = id`, `II(u, u) = h(u, u)`, best `c = 1` = least eigenvalue; `S = ½ id`, `c = ½`; no principal curvatures, both sides vacuous | equivalence holds (`S` is `h`-self-adjoint, so `II ≥ c h` iff `S − c` is positive semidefinite) | clause added to plan |
| R5a contract clause | RiemannianGeometry README on main 623d55d, lines 3260 and 3392 | "B=0 is equivalent to total geodesicity"; "Prove total geodesicity iff B=0" | cited content exists | contract names it |
| 6.4 added needs | flat torus, `R = 1/4` (its Check) | `ρ = 1/16 − \|z\|²` is a defining function (1.3); `II = 4h > 0`, strictly convex (2.1); `τ ≤ 1/2 < ∞`, non-trapping (5.2) | each notion named in the statement is now listed | 1.3, 2.1, 5.2 |
| 6.5 added need | `φ ≡ 0`; `φ(s) = −s` | `II^ĝ = h`; `II^ĝ = −e^{−1}h` (1.4's `II`, through 1.6) | holds | 1.4 |
| 5.6 added needs | `[a, b]`, `z = (b, +1) ∈ ∂₋SM` | `τ̃ = −(b − a)`; `γ_z(t) = b + t` on `[−(b − a), 0]` is an `N`-geodesic in `M`, hence a geodesic of `M` by 4.1; `α(z) = (a, +1)` | holds | 2.1, 4.1 |
| 4.6 added needs | unit ball, `ε₁ = 1/4`, `δ = 1/8` | `ρ̂ + δ` with `\|d(ρ̂ + δ)\| = 1` (1.3); `II_{M_δ} = h/(9/8) > 0` (1.4, 2.1) | holds | 1.3, 1.4, 2.1 |

No other statement changed. The other additions are dependency entries whose notion appears
verbatim in the quoted text (table above).

## Checks

- **Dependency check**, exact output:

  ```text
  candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
  depcheck: 237 roadmaps, 2240 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or `moved:` line. The only new cross-roadmap edge is 6.3's reference to
  RiemannianGeometry R5a. RiemannianGeometry is on main and already a supplier, cited in the
  supplier contracts and the plan's `suppliers`.
- **Citation resolver** on the README: no cross-roadmap citation and no Lean name found nowhere
  (checked against main 623d55d and 448 open heads).
- **House style**: no LaTeX delimiter, machine path or pull-request number (pattern search). The
  edited lines fit the existing line width.
- **Lean**: there is no `Suggested.lean` at the design stage, so there was nothing to elaborate
  and no `#check` binder audit to run. No Lean command was run.
- **Sources**: no new source cited; `sources.toml` unchanged; no `needs-references.toml` written.
- **Ownership and overlaps**: no new construction or target was stated. The overlap report lists
  no other pull request changing this roadmap, no dropped id and no second copy. The added R5a
  citation was resolved on main.

## Notes for the maintainer

- No id, heading, target or Lean name changed, so no other roadmap's citation is affected. Only
  prerequisite lists, the Dependencies paragraphs, one API bullet's wording (1.6), one plan
  statement clause (2.3.2) and the R5a supplier description changed.
- Files edited: `packages/RiemannianManifoldsWithConvexBoundary/design/README.md` and
  `packages/RiemannianManifoldsWithConvexBoundary/design/plan.json`. `sources.toml` was not edited.
- No suspicious instruction was found in the review text.
