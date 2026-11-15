# FIX-DESIGN-Varifolds~14: repair of the Varifolds design

The review REV-DESIGN-Varifolds~13 has one finding, F01 (P3). It is correct, and I applied it with
the suggested wording plus one added clause that names the inclusion of balls the bound uses.

Files edited:

- `packages/Varifolds/design/README.md` (route paragraph of 7.3 only).

Unchanged:

- `packages/Varifolds/design/plan.json`: the 7.3 entry has no route text. Its statement,
  hypotheses, prerequisites (`target:6.1` and `target:7.2` are already listed) and tests are
  unaffected.
- `packages/Varifolds/sources.toml`: no new source is cited.

## F01 (P3) — applied

**Verified.** The weight's form in 7.2 is ‖C‖(B_ρ(0)) = Θ(x)ω_kρ^k. By itself it bounds a ball
about y ≠ 0 only through B_ρ(y) ⊆ B_{ρ+|y|}(0), which gives
‖C‖(B_ρ(y)) ≤ Θ(x)ω_k(ρ + |y|)^k. That is weaker than Θ(x)ω_kρ^k, and the identity 6.1 at y needs
the sharper bound to force the integrand to vanish.

The sharper bound needs the monotonicity of ρ^{−k}‖C‖(B_ρ(y)), which holds because C is stationary
in all of T_xM. Simon1983 obtains it this way: line 7811–7816 bounds the balls about any y "using
(1) and the monotonicity formula 40.2".

Witness: C is two lines at 45° crossing at 0 (Θ = 2, ω_1 = 2) and y = (1, 0). The weight's form
alone gives 4(ρ + 1). The true value is 2ρ for ρ ≤ 1/√2 and 2ρ + 2√(ρ² − ½) for larger ρ, which is
at most 4ρ.

**Change (README 7.3, route).**

- Old: "with ‖C‖(B_ρ(y)) ≤ Θ(x)ω_kρ^k from the weight's form,".
- New: "since ρ^{−k}‖C‖(B_ρ(y)) is non-decreasing in ρ (6.1, C stationary in all of T_xM) and,
  because B_ρ(y) ⊆ B_{ρ+|y|}(0), at most Θ(x)ω_k(1 + |y|/ρ)^k, which tends to Θ(x)ω_k as ρ → ∞
  (the weight's form, 7.2), ‖C‖(B_ρ(y)) ≤ Θ(x)ω_kρ^k for every ρ > 0; with this,".

This is the reviewer's text, with the ball inclusion and "in all of T_xM" made explicit (the
latter is what allows every ρ in 6.1). The *Needs:* line of 7.3 already lists Layer 6.1 and
Layer 7.2.

**Pattern.** I searched the README for other places that bound balls about a point other than the
centre of a known mass ratio (grep for "weight's form", "Θ(x)ω", "ω_kρ^k" and "B_ρ(y)"):

- 7.2's route works at 0 itself, where the ball masses are exact. Correct as written.
- 8.1's route uses P_{S^⊥}(y) = 0 at 0, which comes from 7.2. Correct.
- 7.5's route derives ‖V‖(B_ρ(y)) ≤ CΛρ^k at points off R from "the ratio bound and the
  monotonicity of 6.1–6.2". It already invokes monotonicity. Correct.

No other occurrence needed a change.

## Adversarial pass on the changed statement

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| ρ^{−k}‖C‖(B_ρ(y)) non-decreasing for stationary C in E (6.1) | crossing lines at 45°, y = (1, 0), k = 1 | ratio 2 on (0, 1/√2]; (2ρ + 2√(ρ² − ½))/ρ beyond, increasing to 4 | holds | none |
| weight-form bound Θ(x)ω_k(1 + \|y\|/ρ)^k | same; ρ = 1 | weight-form bound 8; true ratio 2 + √2 ≈ 3.41 | holds, not sharp | none |
| limit ρ → ∞ gives ‖C‖(B_ρ(y)) ≤ Θ(x)ω_kρ^k | same | limit 4 = Θω_1; bound 4ρ ≥ 2ρ + 2√(ρ² − ½) for all ρ | holds | wording |
| same | triple junction (Θ = 3/2, Θω_1 = 3), y = (1, 0) on a ray | ratio 2 for ρ ≤ 1 (the other rays are at distance 1); 1 + √(4 − 3/ρ²) for ρ > 1, increasing to 3 | holds | none |
| degenerate y = 0 | any C of 7.2 | (1 + 0)^k = 1: the bound is the weight's form itself, with equality | holds | none |
| why stationarity in all of T_xM matters | 6.1 asks 0 < σ < ρ < ρ_0 ≤ dist(y, E ∖ W) | W = T_xM gives E ∖ W = ∅, so every ρ is admitted | needed for ρ → ∞ | "in all of T_xM" added |
| consequence at y (6.1 stationary companion) | triple junction, y = (1, 0) | ∫ r^{−k−2}\|P_{S^⊥}(z − y)\|² dC = 3 − ω_1Θ(‖C‖, y) = 3 − 2 = 1 > 0 | consistent: here Θ(‖C‖, y) = 1 < 3/2 = Θ(0), so this C fails the route's hypothesis Θ(‖C‖, ·) ≥ Θ(x) and the integrand need not vanish | none |
| consequence at y, route case | C = Θ(x)v(T, 1), y ∈ T | ratio Θ(x)ω_k for every ρ; Θ(‖C‖, y) = Θ(x); integral 0, and P_{S^⊥}(z − y) = 0 on T | holds | none |

The 7.3 Checks (Lebesgue measure with a constant line, the triple junction and v(L, ½), and the
vertical lift) do not use the changed sentence. I recomputed them and none changes:

- Θ¹ = 0 everywhere, so the hypothesis fails.
- θ = Θ is 1 off the junction, and ½ respectively.
- The first variation is unbounded.

## Checks

Dependency check (run after the final edit):

    candidate: Varifolds is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
    depcheck: 240 roadmaps, 2254 edges, 0 problem(s)

There is no UPWARD or CYCLE line. The repair adds only internal references (6.1 and 7.2, both
already in 7.3's *Needs:* line), so no supplier was added.

Other checks:

- The changed text has no LaTeX delimiters, backticked names, machine paths or process words.
- There is no `Suggested.lean` at the design stage, so the `#check` elaboration comparison does
  not apply and was not run.
- Ownership: the repair introduces no new object, so no ownership question arises. Ownership
  against the open pull requests was not re-checked this round.

## For the maintainer

- No name or id that another roadmap could cite has changed. No roadmap cites this one.
- The review's "Source issues" (Simon1983 41.1 connectedness) and its "For the human reviewers"
  items (licences of Simon1983 and of the arXiv preprint) are not findings. I changed nothing for
  them.
- No source was fetched and no `needs-references.toml` was written.
