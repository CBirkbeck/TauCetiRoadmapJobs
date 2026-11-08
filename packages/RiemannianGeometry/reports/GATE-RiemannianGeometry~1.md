# GATE-RiemannianGeometry~1: answers to review of 164b354 (repairs at 2f670bb)

## H01 (CBirkbeck) — applied

At `99947c3` the companion file was gone, but its contents had been folded into `TauCetiRoadmap/RiemannianGeometry/Suggested.lean` as `section ParaboloidTargets` (old lines 431–502: `timeIntegrand`, `angleIntegrand`, `timeIntegral`, `angleIntegral`, `integral_estimates`, `integral_monotonicity_and_limits`, `point`, `geodesic_crossings`), so the finding still held. That section is now deleted, and the module docstring no longer lists "the paraboloid coordinate integrands, integrals and `Paraboloid.point`" or "with their real-coordinate integral and crossing targets". R5a.3 is still stated natively by `paraboloid_geodesic_crossings` and `paraboloid_vertex_pole`. The README already carries the integrals `T_a`, `A_a`, their lower bounds, the symmetry and the crossing construction as R5a.3 targets and Checks (`README.md` R5a.3, "On the outgoing branch prove …" and its Checks), and it never named the eight deleted declarations, so the README is unchanged here.

## H02 (CBirkbeck) — applied

Nicolaescu's Theorem 5.2.26 concludes conjugate points on geodesics of length `≥ πr`, `diam ≤ πr` and compactness, and says nothing about `π₁` (`nicolaescu-lectures line 9923–9931`, printed pp. 220–221). The universal-cover step is Example 6.2.29 (`nicolaescu-lectures line 10851–10857`, PDF page 255 = printed p. 243, the same offset of 12 as page 233 = printed 221). In R4.5 the locator now reads "Theorem 5.2.26, p. 220, with λ=(n−1)/r², for the diameter bound and compactness; Example 6.2.29, p. 243, for compactness of the Riemannian universal cover, from which R4.3's fibre finiteness gives finite `π₁`". The Nicolaescu entry in the References now adds "Example 6.2.29, p. 243 (compactness of the universal cover under a positive Ricci lower bound)" and restricts Theorem 5.2.26 to "diameter bound and compactness". R4.3 does export the conditional step: a compact universal cover has a finite fibre, hence finite `π₁` (`README.md` R4.3, "Export the conditional conclusion …").

## Adversarial pass on changed statements

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| R4.5 Myers locator, diameter part | `λ=(n−1)/r²` against Nicolaescu's hypothesis `Ric ≥ (n−1)/r²` | `π√((n−1)/λ) = π√(r²) = πr`, which equals the source's `diam ≤ πr`; unit `S³`: `λ=2`, `n=3`, bound `π` = diameter `π` | agrees | none |
| R4.5 universal-cover part | unit `S³` and `RP³` (`Ric = 2g`) | the cover of `RP³` is `S³`, compact, fibre of 2 points, `π₁ = ℤ/2` finite; flat `T³` has `λ = 0`, so it is excluded and its cover `ℝ³` is non-compact | Example 6.2.29 + R4.3 give the claim | locator split |
| Deleted coordinate lemmas | n/a (removed) | the README Checks keep `a=1`: `r″(0)=1/5`; at `R=a` both integrals and both bounds are 0 | Checks unaffected | section deleted |

None of the kept declarations changed. The elaborated types in the signature transcript (38 entries, including the false entry `is`, which is a word in a docstring) still apply to the 29 remaining declarations (38 = 29 kept + 8 deleted + `is`). The only flagged binder is `IsJacobiFieldOn` without `[I.Boundaryless]`, which is intended: the predicate's body does not use it, and every theorem about the predicate keeps it. No new `#check` run was needed, because no remaining declaration changed. No citation was added except the new locator inside the existing Nicolaescu source. The edits add no ownership claim and no new supplier. Ownership against open pull requests outside the brief's list was not checked.

## Build

`lake build TauCetiRoadmap.RiemannianGeometry.Suggested`: Build completed successfully (9065 jobs), with 23 `declaration uses 'sorry'` warnings and no errors.

## Gate

`gate RiemannianGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck (`--movable`): `depcheck: 235 roadmaps, 2063 edges, 0 problem(s)`. No UPWARD or CYCLE line.
