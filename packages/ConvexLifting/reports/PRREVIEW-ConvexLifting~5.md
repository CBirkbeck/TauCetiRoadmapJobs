# Review of ConvexLifting (pull request #2292 at 1ae5fd1)

**Verdict:** accepted

No finding. Incremental re-review of the 73 lines changed since `eb38f6a`.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 235–243 `sharedOAOn`, lines 270–283 `affine_coordinate_comparison`; README line 26 "exact height rows on a selected set `J` of coordinates"; §3.2 lists the eight premises; line 145 points to §3.2.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.2 `affine_coordinate_comparison`, second inclusion | general `J`, `D`, `E`, `k`, `p`; `v = y − G_i(x)` | `v ≥ 0`, `v_j = 0` on `J`; `C_i(x) = H_i(y) − Dh_i(v) ≤ H_i(y) ≤ b`; proved in Lean on a scratch copy from `hD` alone | true | none |
| 3.2 `affine_coordinate_comparison`, first inclusion | `y = g(x)`; `J = univ`; `k = 0`; `p = 0` | rows on `J` equal by `haff`, tangent support off `J`, `H_i(g x) ≤ h(g x) ≤ b`; `k=0`: `S ⊆ D ⊆ D`; `p=0`: rows give `h(0) ≤ b` | true; all eight premises used | none |
| 3.2 case `J = ∅` | `analytic_comparison` derived from `affine_coordinate_comparison ∅` | `sharedOAOn ∅ = sharedOA` by `simp`; `Monotone (Dh i)` gives `0 ≤ Dh i v` for `v ≥ 0`; derivation elaborates on the scratch copy | README claim true | none |
| 3.1 `sharedOAOn` | `J = ∅`; `J' ⊆ J`; `k = 0`; `E = ∅` | equals `sharedOA`; more equalities, smaller set; `D × E`; `∅` | API bullets true | none |
| 3.1 tangent-support lemma | boundary anchor: `A = [0,1]`, `f = x²`, `a = 0`, `x = 1`; `x = a` | `q(t) = t²` convex on `[0,1]`, `q'(0) = 0 ≤ slope = 1`: `0 ≤ 1`; `x = a`: `f a ≤ f a` | true without interior hypothesis | none |
| 3.1 linear-functional equivalence | `L = (−2, 1)`, `J = {0}`; `J = ∅`; `J = univ` | `L(0,t) = t ≥ 0`, `L(e₁) = 1 ≥ 0`; `J=∅`: all coefficients `≥ 0` iff monotone; `J=univ`: only `v = 0` | true | none |
| Check, line 242 (`g = id`, `h = y²`, anchor `−1`, `b = 1`) | inequality heights; `J = {0}` | `G = x`, `H = −2y−1`, `C = −2x−1`; `y ≥ max(x,−1)` projects to `ℝ`; direct `[−1,∞)`; `y = x`: `[−1,∞)`; `S = [−1,1]` | Check true | none |
| Check, line 243 (`g = (x, x²)`, `h = u²+v`, anchor `−1`, `b = 2`) | `J = {first}` | `G = (x, −2x−1)`, `H = −2y₁+y₂−1`, `C = −4x−2`; shared: `−2x−1 ≤ y₂ ≤ 2x+3` iff `x ≥ −1`; direct `x ≥ −1`; `S = [−1,1]` | Check true | none |
| Check, line 244 | `k = 0`; `p = 0`, `k ≥ 1`; `E = ∅`, `D ≠ ∅` | `D × E` and `D`; `H_i = h(0) + Dh_i(0) = h(0)`; `MapsTo g D ∅` false | Check true | none |

- The rows for the untouched statements stand as in the previous review, of `eb38f6a`.
- Source locators checked against the text: 0 new readable ones; the changed passages cite only TS05 §2, Theorem 1, pp. 227–228 (see Not verifiable). The seeded sample falls in the changed text only at §3.1 and §3.2, recomputed above.
- Library declarations opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`): `HasFDerivAt.comp`, `Mathlib/Analysis/Calculus/FDeriv/Comp.lean` line 103; `ConvexOn.le_slope_of_hasDerivAt`, `Mathlib/Analysis/Convex/Deriv.lean` line 596 (scalar variable, as line 35 says).
- Duplication: `sharedOAOn`, `affine_coordinate_comparison` and the tangent-support lemma occur in no other roadmap, open or on main. Remark: `TauCeti.mem_subdifferential_of_hasFDerivAt` (`TauCeti/Analysis/Convex/Differentiability.lean` line 144) is the same segment argument for `EReal`-valued functions with convex epigraph; it does not give the `ConvexOn ℝ A f` form at a boundary anchor, so §3.1's target is not a restatement.
- Dependency check: `depcheck: 240 roadmaps, 2175 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder. Cross-roadmap citations: the diff adds none.
- Gate: every counter 0, OK. `lake env lean` on `Suggested.lean`: 14 `sorry` warnings, nothing else. `#check @sharedOAOn` and `#check @affine_coordinate_comparison` agree with §3.1 and the eight premises of §3.2; no binder lost. One-tactic probe of `affine_coordinate_comparison` (`rfl`, `simp`, `simp_all` with the definitions, `aesop`, `exact?`): none closes it.
- Pull request text against this head: 14 theorems, 18 definitions, one abbreviation, one structure counted in the file; the 13 earlier theorems are untouched by the diff; the description names `sharedOAOn`, `affine_coordinate_comparison` and the tangent-support API; no sentence contradicted.
- Overlap check: read FiniteAffineBoundTightening, ExactPenalties, BoundedConicHulls, ExponentialCone, OptimalTransport; nothing shared.
- Source independence: changed passages only; 6 passages (README lines 26, 35, 172, 176, 216–218, `Suggested.lean` docstrings at lines 235 and 270) compared with 2 sources (LYBV16, LYBV), none shared; largest share TS05, 6 of 11 locators (the diff adds one and removes one); contents of TS05 not compared (text not readable); the diff adds, removes and reorders no layer.

## Not verifiable

- TS05 §2, pp. 226–228, Theorem 1 (README lines 26, 172, 218: affine inner coordinates kept as equalities, monotonicity required only in the other coordinates, epigraph pairs `(γ,x)`): paywalled, settled as uncertified.
- HBO13, KLW18 and the proceedings pagination of LYBV16: as in the previous review; the diff does not touch their locators.

## Source issues

- none

## For the human reviewers

- **Licence.** README line 307 lists `github.com/bernalde/complete-retained-library` at 59c355e as "Reference software" with a copyright line and Apache-2.0 links (LICENSE, NOTICE); `Suggested.lean` may be adapted from it. The repository, its licence and its NOTICE were not read.
- **Not tested.** TS05 has the largest share of locators and is paywalled: wording and arrangement were not compared with it. Layers 1, 3, 4 cite its Proposition 1, Theorem 1, Proposition 5 in that order.
- **Scope.** README line 218 says `affine_coordinate_comparison` adapts TS05 Theorem 1 and does not prove the source's epigraph statement as written; the 14 stated headlines are order, finite-sum and first-order convexity set inclusions. The Layer 1 identity appears in the readable sources as a remark (LYBV16 lines 385–392).
