# FIX-PKG-RiemannianManifoldsWithConvexBoundary~2

Findings of `REV-PKG-RiemannianManifoldsWithConvexBoundary` (review of 16982df). Both were
verified and both are applied. No statement of `Suggested.lean` changed: only docstrings changed,
and the 21 elaborated types are byte-identical to the ones recorded before the round.

## F01 (P2) — applied

**Changed** (README §5.6, Lean docstrings): "`α(z) = geodesicEndpoint z τ(z)` when `τ(z) > 0`" →
"when `0 < τ(z) < ∞`, else via `T′ = τ(x, −v)` if finite, `0` if infinite". The endpoint bullet
now says `φ_T(z)` only for `T > 0` and `z` for `T ≤ 0`. Two Checks added: `T = −1` and the zero
vector. `scatteringRelation` docstring: "positive finite exit time".

**Evidence.** At the pin, `TauCeti.Manifold.IsGeodesicCurveOnFrom`
(`TauCeti/Geometry/Manifold/Riemannian/Geodesic/Basic.lean`, lines 134–141) has the field
`zero_mem : 0 ∈ s`, and `IsGeodesicCurveOn` (lines 102–110) has `uniqueDiffOn`. So
`geodesicEndpoint z T = z` for `T < 0` (`Icc 0 T = ∅`) and for `T = 0` (`{0}` is not
`UniqueDiffOn`). On the disc, `z = ((0, −1), (0, 1))` gives `φ_{−1}(z) = ((0, −2), (0, 1)) ≠ z`, so
claim (a) was false. `scatteringRelation` tests `0 < (exitTime z).toReal`, and
`ENNReal.toReal ⊤ = 0`, so claim (b) misdescribed `τ = ∞`.

**Details.**
- The API bullet now also requires `φ_t z` to be defined on `[0, T]`.
- The new zero-vector Check computes `T′ = 0` and `geodesicEndpoint (x, 0) 0 = (x, 0)`, so
  `α(z) = z`. At a boundary point this agrees with the zero vector being glancing.
- The `scatteringRelation` docstring also says the backward branch is taken at the exit time of
  `−z`, and at time `0` (giving `−z`) when that is infinite.
- The `geodesicEndpoint` docstring adds "as for every `T ≤ 0`".
- No binder or statement changed.

**Pattern.** I searched the README and Lean for `geodesicEndpoint`, `toReal`, "`τ(z) > 0`",
"`[0, T]`" and "endpoint". Three other places were checked and need no change:
- §5.2 `exitTime` (a supremum over `T > 0`): it agrees with the Lean `⨆`, since no geodesic exists
  for `T ≤ 0`.
- §5.2 realisation formula (a supremum over `T ≥ 0`): `T = 0` does not change the supremum.
- §5.4 route ("`τ(z) > 0`" on `int SM`): it concerns unit vectors of a non-trapping `M`, where `τ` is
  finite.

The two headline theorems on `α` quantify over unit vectors of a non-trapping `M`, so neither is
affected.

## F02 (P3) — applied

**Changed:**
- Manifest locator of `stefanov-uhlmann-vasy2021`: "Theorem 1.1, Section 1.3" → "Abstract;
  Section 1 (condition (1.1), Theorems 1.1-1.4)".
- README References: "Section 1, lines 15–230" → "abstract and Section 1 (condition (1.1),
  Theorems 1.1–1.4), lines 8–230".
- The same defect in two other entries: `uhlmann-vasy2016` "Section 1" → "Sections 1 and 3";
  `paternain-salo-uhlmann2023` "Sections 2.5 and 3.1-3.3" → "Preface; Sections 2.5 and 3.1-3.3",
  and in the README "Chapter 2.5" → "Preface (lines 307–310), Section 2.5".

**Evidence.**
- `stefanov-uhlmann-vasy2021`:
  - The abstract is lines 8–23. The review said 15–23, which is why the README range now starts at
    line 8.
  - Section 1 starts at line 24 and has no subsections. Section 2 starts at line 265 and §2.1 at
    line 278.
  - Condition (1.1) is at line 67. Theorems 1.1–1.4 are at lines 89, 99, 198 and 210.
  - Every line the README cites from this source (20–22 up to 220–221) lies in lines 8–230.
- `uhlmann-vasy2016`: Section 1 starts at line 15, Section 2 at line 259 and Section 3 at line 498.
  The cited lines 499–524 are in Section 3.
- `paternain-salo-uhlmann2023`: lines 307–310, cited in 6.1, are in the Preface (heading at
  line 130, running head "xii Preface" at line 326). 2.5 is a section (line 2443).

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result / change |
|---|---|---|---|
| `geodesicEndpoint z T`, `T > 0` clause | disc, `z = ((0,−1),(0,1))`, `T = 1`; `T = 3` | `T = 1`: `((0,0),(0,1)) = φ_1 z`. `T = 3`: `φ_t z` leaves `M` at `t = 2`, so the clause does not apply; value `z` | holds |
| `geodesicEndpoint z T`, `T ≤ 0` clause | `T = −1`; `T = 0`; zero vector at `x`, `T = 0` | `Icc 0 (−1) = ∅`, `zero_mem` fails, value `z`, while `φ_{−1}z = ((0,−2),(0,1))`. `{0}` has tangent cone `{0}`, not `UniqueDiffOn`, value `z = φ_0 z`. `(x,0)` gives `(x,0)` | new clause holds; old "for every `T`" form refuted at `T = −1` |
| `α` definition, branch `0 < τ < ∞` | inward `(0,−1),(0,1)` on the disc | `τ = 2`, `α = ((0,1),(0,1))`; ball formula `x − 2⟨x,v⟩v = (0,−1) + 2(0,1) = (0,1)` | agrees |
| `α` definition, backward branch, `T′` finite | outward `((0,−1),(0,−1))`; glancing `((0,−1),(1,0))` | outward: `τ = 0`, `T′ = τ((0,−1),(0,1)) = 2`, endpoint `((0,1),(0,1))`, flipped `((0,1),(0,−1))` = ball formula. Glancing: `τ = 0`, `T′ = 0`, `geodesicEndpoint(−z, 0) = −z`, flipped `z` | agrees; glancing is fixed |
| `α` definition, `T′ = 0` because `τ = ∞` | zero vector `(x,0)`, `x` interior and boundary | `τ = ∞` (constant curve); `toReal = 0`; `T′ = 0`; `(x,−0) = (x,0)`; `α = (x,0)` | `α(z) = z`; the old "`τ(z) > 0`" form would ask for an endpoint at time `∞` |
| `α` docstring (Lean), infinite-exit backward branch | the same zero vector | `geodesicEndpoint (x,0) 0 = (x,0) = −z`, flipped `z` | agrees with the body |
| `scatteringRelation_involutive` and `exists_contMDiffOn_eq_scatteringRelation` (unchanged) | unit `z` on non-trapping `M` | `τ(z) < ∞` by `IsNonTrapping`, so `toReal τ = τ` and the first branch is `0 < τ` | statements unaffected |
| SUV locator | lines 8, 24, 67, 89, 99, 198, 210, 265 | abstract / §1 / (1.1) / Thm 1.1 / 1.2 / 1.3 / 1.4 / §2 | new locator matches |
| UV locator | lines 15, 259, 498 | §1 / §2 / §3; cited 25–140 and 499–524 | "Sections 1 and 3" matches |
| PSU locator | lines 130, 326, 2443, 2640, 3128 | Preface / Preface / §2.5 / §3.1 / §3.4 | "Preface; Sections 2.5 and 3.1-3.3" matches |

## Checks

- **Elaboration.** `lake env lean packages/RiemannianManifoldsWithConvexBoundary/Suggested.lean`,
  run from the content checkout: exit 0. It gives 10 warnings, all `declaration uses 'sorry'`
  (lines 113, 150, 179, 190, 213, 278, 293, 310, 331, 349). The line numbers moved by 2 after line 247
  because the docstrings grew. There are no errors.
- **Signatures.** I put `#check @name` for all 21 declarations in one scratch copy, elaborated it
  once (exit 0), and compared the output after whitespace normalisation with the elaborated types
  recorded before the round. They are identical. The flagged
  `[IsManifold (𝓡∂ (n + 1)) ∞ M]` on `IsBoundaryDefiningFunctionOn` is still absent and not needed:
  `ContMDiffOn` and `mfderiv` need only the charted space, as the review also found. Nothing changed.
- **Dependency direction.** Output: `depcheck: 244 roadmaps, 2271 edges, 0 problem(s)`. There is no
  UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README reports "Lean names found nowhere: None."

## Gate failures

None were listed for this round.

## For the maintainer

- No Lean name was added, removed or renamed, so other roadmaps that cite this one are unaffected.
- No supplier gap was added: `design/plan.json` is unchanged, with `gaps = []`.
- No new construction was introduced, so ownership against other roadmaps is unchanged from the
  review's audit.
- No source passage was copied; locators only.
- No untrusted text contained instructions.
