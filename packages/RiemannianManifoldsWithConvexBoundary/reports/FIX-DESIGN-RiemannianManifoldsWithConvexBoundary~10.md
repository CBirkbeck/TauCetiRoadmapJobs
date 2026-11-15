# Repair report: RiemannianManifoldsWithConvexBoundary design, round 10

This round settles the two findings (both P3) of `REV-DESIGN-RiemannianManifoldsWithConvexBoundary~9`.
It changes `packages/RiemannianManifoldsWithConvexBoundary/design/README.md` and
`packages/RiemannianManifoldsWithConvexBoundary/design/plan.json`. `sources.toml` is unchanged
because no new source is cited and no locator changed. Nothing was added to `needs-references.toml`.
The review's section for the human reviewers (the licence of paternain-salo-uhlmann2023) lists no
finding, so nothing was changed because of it.

## F01 (P3) — applied differently

Old: the Scope did not mention the normal strips of RiemannianGeometry/Surfaces. New: a Scope
deferral to RiemannianGeometry/Surfaces 1.2–1.3, saying how 4.3–4.4 differ and how they agree for
`n = 1`; a 4.4 Check (disc, cap, outward negative control); plan test `surface_case`. Not applied:
the `*Needs:*` entry.

Verified on main (`TauCetiRoadmap/RiemannianGeometry/Surfaces/README.md`):
- 1.2 states `F*g = dt² + a² ds²`, `a_tt + (K ∘ F)a = 0`, `a(s, 0) = 1` and `a_t(s, 0) = −k_g`.
  It includes a boundary arc of a domain with the inward normal and `t ≥ 0`.
- 1.3 identifies `t` with the distance to a compact subarc on a small tube, when the nearest point
  is interior.
- Surfaces' conventions take `k_g` with respect to the inward conormal, so the unit circle has
  `k_g = 1`.

The two objects differ in generality, as the review says. The Scope entry records this, and the
Check computes the agreement.

Why the `*Needs:*` line is unchanged: a `*Needs:*` line lists what the statement and its route
need. Neither the statement of 4.4 nor its route uses Surfaces 1.2. Surfaces 1.2 is
two-dimensional and local, and is itself proved from the normal exponential. Listing it would make
4.4, which holds in every dimension, wait for a result about surfaces that it does not use. The
Check compares values computed from elementary formulas, so it needs no supplier.

This differs from 4.3's citation of R7.9. There the statement itself identifies the tube with
R7.9's collar, which is why R7.9 is in 4.3's `*Needs:*`. The Layer 4 Dependencies paragraph is
unchanged for the same reason.

Pattern: I searched the roadmaps (open heads, then main) for "Fermi coordinates", "normal strip",
"boundary normal coordinates", "geodesic curvature k_g" and "dr² + h". The only hits stating our
objects are Surfaces 1.2–1.3. The other "normal strip" hit, in `TauCetiRoadmap/RiemannianGeometry/README.md`,
belongs to a curve-shortening construction on the sphere and is unrelated. No other omission from
the Scope was found.

## F02 (P3) — applied

Old: in 5.4 the fold-form bullet came fifth, and the continuity bullet cited "the fold form below".
The plan listed 5.4.1 before its prerequisite 5.4.4. New: the fold form comes first and has a route
showing that it does not use continuity of `τ`; the continuity bullet says "above"; the plan lists
5.4.4 first and adds prerequisite 5.1. All ids are kept.

The finding is correct. The fold form needs only local analysis at `t = 0`. I checked this against
paternain-salo-uhlmann2023 lines 2955–2969: Lemma 3.2.9 is proved by applying Lemma 3.2.10 to
`h(t, x, v) = ρ(γ_{x,v}(t))`, with no appeal to Lemma 3.2.3 or Exercise 3.2.4.

The route now written in the bullet:
- `∂_t² h < 0` near `(0, z₀)` makes `h(·, y)` concave near `0`.
- Because `h(0, y) ≥ 0`, the two roots `Q(±√a)` enclose `0`, `h ≥ 0` between them and `h < 0` just
  past the larger root.
- So 5.2's realisation formula gives `τ(y) = Q(√a(y), y)`, and reversing the geodesic gives the
  other root.

The plan's 5.4.4 statement carries the same route. `target:5.1` is added to its prerequisites,
because the statement uses `SM` and `∂₀SM` and the route uses the smooth flow of 5.1. The README's
5.4 `*Needs:*` line already lists 5.1.

Pattern: I ran a script over the plan for any prerequisite listed after the target that uses it.
5.4.1 → 5.4.4 was the only one, and none remains.

I also scanned the README for references from one section to a later one. Those in statement or
route text are not proof steps:
- 1.3 notes that the normalised function is 4.3's `ρ̂` (a remark);
- 4.3 names 4.4's strip as an example;
- 4.3 notes what 4.6 uses (a consumer).

The Checks that cite later sections (in 4.1, 4.4, 4.6, 5.1, 5.2, 5.4 and 5.5) compare against
later computations; they are not proof steps. No other repair was needed.

## Checks run

Dependency check, exact output (after all edits):

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2242 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line.

Citation resolver (`roadmaps resolve` on the README) reports: "Cross-roadmap citations found
nowhere: None. Lean names found nowhere: None." The new citation `RiemannianGeometry/Surfaces 1.2–1.3`
uses the form PositiveMass uses for the same sub-roadmap.

`plan.json` parses. Before editing, a load-and-dump check showed that the file round-trips byte
for byte. The plan has 49 targets in an order with no forward prerequisite. The test kind
`convention` was already used in the plan.

Style: the added lines are at most 100 characters. They contain no LaTeX delimiters, machine paths,
pull-request numbers or process words.

Lean: the design stage has no `Suggested.lean`, so there was nothing for a `#check` scratch file
to elaborate. No Lean command was run.

## Adversarial pass on the changed statements

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| Scope, `n = 1`: `h_r = a² ds²`, `II = k_g ds²` | general arc of `∂M`, unit speed, `ν_Σ = grad ρ/|grad ρ| = ν_in` | `E(σ(s), r) = F(s, r)`, so `−½ ∂_r(a²)|₀ = −a(s,0) a_t(s,0) = −1·(−k_g) = k_g`; directly `II(σ′, σ′) = ⟨∇_{σ′}σ′, ν_in⟩ = ⟨D_s σ′, n⟩ = k_g` | the two derivations agree | Scope entry added |
| 4.4 Check, disc | `R = 2`, `r = 1/2` | `a = 1 − 1/4 = 3/4`, `h_r = 9/16 ds²`; `−½ ∂_r(1 − r/2)²|₀ = 1/2`; Surfaces `k_g = 1/2` | holds | Check added |
| 4.4 Check, cap | `φ₀ = π/3`, `π/2`, `2π/3` | `a_t(s, 0) = −cot φ₀ = −0.577, 0, +0.577`; `II = 0.577, 0, −0.577` times `ds²`; 6.3 `cot R` at `R = φ₀`: same three values; Surfaces' equator `a = cos t`, `k_g = 0` | holds; the sign change at `π/2` matches 6.3's classification | Check added |
| 4.4 Check, outward normal | disc of radius `R` | `a = 1 + r/R`, `−½ ∂_r(1 + r/R)²|₀ = −1/R`; 4.4's exterior Check at `R = 1`: `II = −h_0` | the wrong normal gives the exterior's value | negative control added |
| 4.4 Check, degenerate | `n = 0`; `n ≥ 2` | `∂M` discrete, no arc, so the comparison is empty; Surfaces is two-dimensional | the comparison is stated for `n = 1` only | none |
| 5.4 fold-form route | closed unit disc, `z₀ = ((0, −1), (1, 0))` | `h(t, y) = 1 − |x|² − 2t⟨x, v⟩ − t²`, `∂_t² h = −2 = −|dρ| II = −2·1`; roots `(−2⟨x, v⟩ ± √a)/2` with `a = 4(⟨x, v⟩² + 1 − |x|²)`; `h(0, y) = 1 − |x|² ≥ 0` on `SM`, so `0` lies between the roots | larger root `= τ(x, v)` (6.1); smaller root `= −τ(x, −v)` | route added |
| 5.4 fold-form route, double root | `y ∈ ∂₀SM` near `z₀` | `a(y) = 0`, `h(·, y) ≤ 0` with equality only at `0`, `τ(y) = 0 = Q(0, y)` | holds | none |
| 5.4 fold-form route, convexity needed | annulus `1 ≤ |x| ≤ 2`, glancing at `(0, −1)` on the inner circle | `h = |x + tv|² − 1`, `∂_t² h = +2 > 0`; `h(·, y)` is convex and `0` is not between roots | the route uses strict convexity at the base point; 5.2's annulus Check shows `τ` jumping there | none |
| 5.4 order | plan graph | 5.4.4 needs 5.3.1, 4.2.1, 5.1, 5.2, all earlier; 5.4.1 needs 5.4.4, now earlier | acyclic in listed order | order changed |

## Ownership and overlap

No new object or target was introduced. F01 adds a deferral to a roadmap on main, and F02 reorders
items.

Ownership against open pull requests was checked:
- `roadmaps grep` found the normal-strip and Fermi-coordinate statements only in Surfaces on main;
- `roadmaps list` shows no open pull request revising RiemannianGeometry or its Surfaces
  sub-roadmap, so the cited ids 1.2–1.3 are as on main.

`gaps` stays empty.

## For the maintainer

- No id or name that other roadmaps cite changed. The targets 5.4.1–5.4.5 keep their ids; only the
  order of 5.4.4 and 5.4.1 in the plan changed.
- 4.4 now names RiemannianGeometry/Surfaces 1.2 in a Check and in the Scope only. It is not a
  supplier, so the supplier contracts and the plan's supplier list are unchanged.
- No suspicious instructions were found in the review text.
