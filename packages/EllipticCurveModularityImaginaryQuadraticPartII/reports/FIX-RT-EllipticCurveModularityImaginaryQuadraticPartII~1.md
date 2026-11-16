# FIX-RT-EllipticCurveModularityImaginaryQuadraticPartII~1

Repair of red-team round 1 (passes a and b): six findings, all applied (three differently from the
suggested text). Only `packages/EllipticCurveModularityImaginaryQuadraticPartII/README.md` changed.

## RT-EllipticCurveModularityImaginaryQuadraticPartII~1a/F01 (P3) — applied

Verified: §3.1's `H⁰ = 0` does not exclude a stable subspace. Changed: §4.2 "`ad⁰` is absolutely
irreducible" → the argument via ArithmeticGaloisRepresentations §7.2 (`ad⁰ ≅ (Sym² V)^∨`) and §7.8
(`Sym²` irreducible, `a = 2 ≤ 4`). Also: §4.2 *Needs:*, Layer 4 Dependencies, a §7.8 contract bullet,
a Borel non-example Check, and §7.8 (`a = 1`) cited in §6.2's second Check.

## RT-EllipticCurveModularityImaginaryQuadraticPartII~1a/F02 (P3) — applied

Verified: the CM-image fact had no owner; the parent's §7.4 output 3 gives non-CM. Changed: §8.1 "non-CM
because its mod-five image … has no abelian subgroup of index at most two" → "non-CM by the last clause
of (S2), `t` being a switch parameter (the parent's §7.4(3))". The parent's §7.4 is added to §8.1
*Needs:* and to the Layer 8 Dependencies. The §7.5 Check stays.

## RT-EllipticCurveModularityImaginaryQuadraticPartII~1b/F01 (P2) — applied differently

Changed: Conventions "a `t` produced by the parent's §7.4" → a new bullet defining a switch parameter by
(S1) the §6.5 open property (not one fixed choice of opens), (S2) the §7.4 residual and non-CM
conclusions, and (S3) the `G_D` image. It adds an existence paragraph and four Checks in my own wording.
§§2.1, 2.2, 7.5 and 8.1 now cite the clauses.

## RT-EllipticCurveModularityImaginaryQuadraticPartII~1b/F02 (P2) — applied differently

Verified at the parent's head: `solvable_preparation` constrains nothing at `Σ`. Changed: §7.4 → (a) the
preparation with `Σ` split, proved from GL2ModularityLifting §1.7 over `F⁺`, and (b) the switch, proved
from the named §0.2–0.3 statements and ShimuraVarieties §5.6. The suggested GlobalNumberFields is not in
the merge order, so it is not cited. PotentialAutomorphyInfrastructure §2.5 is dropped from §7.4. Four
Checks were added.

## RT-EllipticCurveModularityImaginaryQuadraticPartII~1b/F03 (P3) — applied

Verified: "width" (CaptainSude26 lines 502, 519) is undefined in the README. Changed: "width-three
(multiplicative) degeneration" → "(multiplicative) degeneration of type `I₃`" in Scope, Sources, How to
read the build and the §7.1 heading ("7.1 The multiplicative degeneration of type I₃"). The plan summary
in `design/plan.json` keeps "width-three": this job may not edit that field.

## RT-EllipticCurveModularityImaginaryQuadraticPartII~1b/F04 (P2) — applied differently

Verified: the old (b)–(c) followed CaptainSude26 lines 513–516 step by step, with no verbatim run.
Changed: (b)–(c) are rewritten in my own words around the quotient's special fibre: the components `E'`
and `Z`, the node orbits `1 + 2`, the dual graph with thicknesses two and one, and the blow-up to a
triangle. A genus-zero argument (four fixed points) is added. The reviewer's text is not used.

## Checks run

- `lake env lean` on `packages/EllipticCurveModularityImaginaryQuadraticPartII/Suggested.lean` (from
  the content checkout): exit 0, no output. The file declares nothing, so the `#check @name` comparison
  has no subject; there are no `TauCeti.*` imports to build.
- Dependency check, after the last edit: `depcheck: 250 roadmaps, 2381 edges, 0 problem(s)`. There is no
  UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` reports the source keys LeHung26, OpenAI26 and CaptainSude26 as "no roadmap". These
  are sources, not roadmaps, so the lines are false positives, as before. It reports no Lean name found
  nowhere.
- No gate failures were listed for this job.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Switch parameter (S1)–(S3) | imaginary quadratic `K`; `A_t` CM; `t` near `R_*` at a place above 3; extra opens above `q` | parent §8.2 picks `t` by §7.4 inside §6.5 opens; `[[1,3],[0,1]]·[[1,0],[3,1]] = [[0,3],[3,1]]`, reverse product `[[1,3],[3,0]]` over `𝔽₅`; order-five elements lie in every subgroup of index ≤ 2; `v₀(1/j(A_t)) = 3v₀(s) + O(1) > 0` | (S2)–(S3) do not imply (S1); CM fails (S2) and (S3) | definition, existence, 4 Checks |
| §4.2 spanning step | Borel `B ⊂ SL₂(𝔽₅)`; `SL₂(𝔽₅)` | `ker(Ad U − 1) = k e`; `diag(2,3)` scales `e` by `4`; `Ad(Uᵀ)e = e − h − f`, `Ad(Uᵀ)²e = e − 2h − 4f`, determinant with `e` equal to `2 ≠ 0`; `a = 2 ≤ p − 1 = 4` | `H⁰ = 0` is not enough; irreducibility of `Sym²` is | owner cited, Check added |
| §6.2 Check 2 (centralizer) | standard representation | `a = 1 ≤ 4` | true | §7.8 cited |
| §7.1(b)–(c) | one or three fixed nodes; quotient fibre | two genus-zero curves meeting in 2 points: `p_a = 1`; three fixed nodes: `p_a = 2`; Riemann–Hurwitz for `E' → E'/w` with 4 fixed points: `0 = 2(2g' − 2) + 4`, `g' = 0`; thicknesses `2 + 1` become `1 + 1 + 1` | type `I₃` | rewritten, same content |
| §7.4(a) | `Σ = ∅`; `u` split or inert in `F`; a place below `Σ` above `q₀` | split: `L_{w'} = F⁺_u = F_w`; inert: `L⁺_{u'} = F⁺_u`, `L_{w'} = F_w`; trivial and trivial prescriptions agree; `y² = x³ − x` over `𝔽₅`: 8 points, trace `−2`, `Δ = 64`; `y² = x³ + 1`: 6 points, trace `0`, `Δ = −432` | true | stated with its own route |
| §7.4(b) | Tate place above two | `v(j) < 0`, against potential good reduction of a CM curve | non-CM | ShimuraVarieties §5.6 cited |
| §7.4, second Check | a place above 11 in `Σ`, ramification index five | residual inertia `U⁵ = 1` | protection lost without (a) | Check added |
| §8.1 non-CM | `t` from §7.5 | last clause of (S2) | true | citation changed |

## For the maintainer

- New supplier edges: ArithmeticGaloisRepresentations §7.8 and ShimuraVarieties §5.6, at merge-order
  lines 63 and 114 (this roadmap is at 206).
- No exported name changed. §7.4 now has parts (a) and (b), and the §7.1 heading changed. The overlap
  tool shows no roadmap citing either.
- Ownership of §7.4(a) was checked by object on main and in the open pull requests:
  - GL2ModularityLifting §1.7 and ClassicalSerreModularity I.0 own general prescribed completions.
  - The parent owns the preparation without the split set.
  - This Part II owns the strengthening.
- No untrusted text contained instructions.
