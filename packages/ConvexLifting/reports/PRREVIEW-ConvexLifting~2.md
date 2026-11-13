# Review of ConvexLifting (pull request #2292 at b2972af)

**Verdict:** needs changes

## R01 (P2) — The comparison is narrowed below the source: affine coordinates are forced through monotone inequalities

**Location:** `TauCetiRoadmap/ConvexLifting/README.md` line 26: "TS05 §2 instead retains affine inner coordinates by equalities and requires monotonicity only in the other coordinates. The general mixed-sign affine-coordinate theorem is outside the selected comparison"; `Suggested.lean` line 245 `(hD : ∀ i, Monotone (Dh i))`.
**Claim:** Layer 3 states only the special case the README itself says the source generalises. It does not cover an affine argument under a non-monotone outer function, which is Layer 2's own example `(x+z)² ≤ 1` (line 131).
**Witness:** `X = ℝ`, `g = id`, `h(y) = y²`, anchor `−1`, `b = 1`: `Dh = −2·` fails `hD`; with inequality heights `fst(sharedOA) = ℝ ⊄ directOA = [−1,∞)`; with `y = x` imposed both are `[−1,∞) ⊇ S = [−1,1]`.
**Repair:** Replace line 26's last two sentences and add to §3.1–3.2 (elaborates on a scratch copy, `sorry` the only warning; `J = ∅` is `analytic_comparison`; on the witness, `J = {0}`, both sets are `[−1,∞)`):

```lean
def sharedOAOn (J : Set (Fin p)) (D : Set X) (E : Set (Fin p → ℝ)) (g : X → Fin p → ℝ)
    (h : (Fin p → ℝ) → ℝ) (a : Fin k → X)
    (Dg : Fin k → X →L[ℝ] (Fin p → ℝ)) (Dh : Fin k → (Fin p → ℝ) →L[ℝ] ℝ)
    (b : ℝ) : Set (X × (Fin p → ℝ)) :=
  {z | z.1 ∈ D ∧ z.2 ∈ E ∧ ∀ i,
    componentRow g (a i) (Dg i) z.1 ≤ z.2 ∧
    (∀ j ∈ J, z.2 j = componentRow g (a i) (Dg i) z.1 j) ∧
    outerRow g h (a i) (Dh i) z.2 ≤ b}

theorem affine_coordinate_comparison (J : Set (Fin p)) (D : Set X) (E : Set (Fin p → ℝ))
    (g : X → Fin p → ℝ) (h : (Fin p → ℝ) → ℝ) (a : Fin k → X)
    (Dg : Fin k → X →L[ℝ] (Fin p → ℝ)) (Dh : Fin k → (Fin p → ℝ) →L[ℝ] ℝ)
    (b : ℝ) (hgE : MapsTo g D E)
    (haff : ∀ i, ∀ x ∈ D, ∀ j ∈ J, componentRow g (a i) (Dg i) x j = g x j)
    (hc : ∀ j ∉ J, ConvexOn ℝ D (fun x => g x j)) (hhc : ConvexOn ℝ E h)
    (ha : ∀ i, a i ∈ D) (hg : ∀ i, HasFDerivAt g (Dg i) (a i))
    (hh : ∀ i, HasFDerivAt h (Dh i) (g (a i)))
    (hD : ∀ i v, 0 ≤ v → (∀ j ∈ J, v j = 0) → 0 ≤ Dh i v) :
    originalSet D g h b ⊆ Prod.fst '' sharedOAOn J D E g h a Dg Dh b ∧
      Prod.fst '' sharedOAOn J D E g h a Dg Dh b ⊆ directOA D g h a Dg Dh b := by
  sorry
```

README text: "Prove `affine_coordinate_comparison`: for a set `J` of coordinates on which every component row equals the component on `D`, impose `y_j = G_i(x)_j` for `j ∈ J`, assume convexity only for `j ∉ J`, and assume `Dh i v ≥ 0` only for `v ≥ 0` vanishing on `J` (TS05 §2, Theorem 1, pp. 227–228)."

## R02 (P3) — Definitions have no `**Checks.**` lists; several layer examples are instructions without values

**Location:** `TauCetiRoadmap/ConvexLifting/README.md` lines 181, 183, 184, 133: "Give equality examples with one anchor…"; "Give an example where both approximations contain the original set but use different anchor families…"; "Include a nonzero exponential outer derivative…"; "Check both signs…".
**Claim:** No definition carries a `**Checks.**` bullet list (three discriminating computed Checks each); `project`, `height`, `affineArgument`, `componentRow`, `outerRow`, `directRow`, `separableLift` have no computed value of their own, and the quoted bullets compute nothing.
**Witness:** `grep -c 'Checks' README.md` = 0. Line 183 names an example and gives none.
**Repair:** Under each definition add `**Checks.**` with computed bullets (keep `### Examples` for the layer-level ones), for instance:
- `project`, `height`: `n = q = 1`, `m = 0`, `z.1 = (3,7)`: `project z = (3)`, `height z = (7)`; exchanging `castAdd` and `natAdd` gives `7` and `3`.
- `affineArgument`: `a = (1)`, `b = (1)`, offset `2` at `(x,z) = (−1,0)` gives `1`; dropping the offset gives `−1`.
- `separableLift`: weight `−1`, component `x`, `d.g = −x`, `D = ℝ`: the lift `x ≤ y`, `−y ≤ 0` contains `(−1,0)` while `d.g(−1) = 1 > 0`; nonnegative weights are needed. With `q = 0`, `l = 1`: `d.g = 0`, no nonlinear row, budget row `0 ≤ 0`.
- `componentRow`, `outerRow`, `directRow`: `g = (x₁²,x₂²)`, `h` the sum, `a = (1,1)`: `G(x) = (2x₁−1, 2x₂−1)`, `H(y) = y₁+y₂`, `C(x) = 2x₁+2x₂−2 = H(G(x))`; at `x = a` the values are `(1,1)`, `2`, `2`; a row without `− a` gives `2x₁+2x₂+2`.
- Line 183: `g = x²`, `h = id`, `b = 1/4`: shared heights at anchor `0` project to `ℝ`; the direct row at anchor `1` gives `x ≤ 5/8`; both contain `S = [−1/2,1/2]`, and `1` lies in the first only.
- Line 184: `g = id`, `h = exp`, anchor `0`, `b = 2`: `Dh = 1`, shared and direct sets are both `(−∞,1] ⊇ S = (−∞, log 2]`; with `D = E = [0,∞)` both are `[0,1]`.

## R03 (P3) — Text about the file's production and an external implementation

**Location:** `TauCetiRoadmap/ConvexLifting/README.md` line 40: "The README specifies the full mathematical API. … gives suggested target signatures, with actual definition bodies and admitted theorem targets; it is not an exhaustive checklist."; line 247 (whole paragraph); `Suggested.lean` lines 6–10.
**Claim:** These sentences describe how the files were produced and a third-party repository's "proof constructions and controls", not mathematics; "adopted" (lines 22, 247), "selected comparison" (26) and "chosen version" (240) record editorial decisions.
**Witness:** Line 247: "This is a secondary source, rather than a required module layout or private API to preserve. … no novelty or solver-performance claim follows from the formalization."
**Repair:** Line 40: start at "Layer 1 establishes exact order lifting." Delete the section "Secondary formalization reference". `Suggested.lean` docstring: keep "The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline theorems against the pinned APIs; every headline theorem is statable at the pins." Write "unweighted sums of HBO13" (line 22), "this comparison" (26), "the Articles in Advance version" (240).

## R04 (P3) — The description is written for the earlier head and does not say that it adds a roadmap

**Location:** Pull request #2292 description: "Local validation at `16d406fa5bfe3f65250622aac00d0949b45f7d9c`: the interface file elaborates … The current topic checker and its six existing unit tests pass."
**Claim:** The head is `b2972af`; the description names neither it nor the fact that the pull request adds the new folder `ConvexLifting` with no supplier roadmap, nor `analytic_comparison`, added since `16d406f`.
**Witness:** Folder change against main: 546 insertions, 0 deletions, three new files; `depcheck: 240 roadmaps, 2174 edges, 0 problem(s)`.
**Repair:** Replace the validation paragraph by: "This pull request adds the new roadmap folder `TauCetiRoadmap/ConvexLifting/` (README, `Suggested.lean`, `metadata.toml`); it consumes Mathlib only and no other roadmap. At `b2972af` `Suggested.lean` elaborates against the pinned Mathlib with 13 `sorry` theorems, among them the restricted comparison `analytic_comparison`."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `projection_eq` | `g = x²`, `h = 1−y`, `b = 0`; `g = abs`, `h = id`, `b = 0`; `D = ∅` | Non-monotone: `(0,1) ∈ L`, `h(g 0) = 1 > 0`; `S = {0}`, `(0,0) ∈ L`; `∅ = ∅` | true; `hm` needed | none |
| 1.2 `feasible_minimum_iff`, `attainment_iff` | `D = [−1,1]`, `g = x²`, `b = 1`, `f = −x`; `y ≤ 1/4`; `D = (0,1)`, `g = h = 0`, `f = x` | min `−1` at `(1,1)`; with bound `x ≤ 1/2`, min `−1/2`; open case inf `0` unattained on both sides | true; lines 77–78 agree | none |
| 2.1 `feasibleOn`, `relaxationOn`, `objective`, `affineArgument` | `(x+z)² ≤ 1`, `z ∈ {0,1}`, `−1 ≤ x ≤ 1`, objective `x+z`; `m = 0` | `z=0`: min `−1` at `(−1,0)`; `z=1`: `x ∈ [−1,0]`, min `0`; `(0,1/2)` relaxed only; `m=0`: sets equal | consistent | R02 |
| 2.2 `normalizedLift`, three theorems | added rows `j`, `q+j` | `−a·x−b·z+u_j ≤ o_j`, `a·x+b·z−u_j ≤ −o_j`: `u_j = affineArgument`; `g_i = Σ w φ_j(u_j)`; objective `= d.objective (project z)` | true, no sign condition | none |
| 2.3 `separableLift`, three theorems | weight `−1`, component `x`; `q = 0` | Negative weight: `(−1,0)` in lift, `d.g(−1) = 1`; `q = 0`: `d.g = 0`, row `0 ≤ 0`; forward `d.g ≤ Σ w·height ≤ 0` | true; `hw` needed | R02 |
| 3.1 rows, `directOA`, `sharedOA` | `g = (x₁²,x₂²)`, sum, anchors `±(1,1)`, `b = 1/2`; `k = 0` | `C = ±2(x₁+x₂)−2`; direct `abs(x₁+x₂) ≤ 5/4`; shared `y_j ≥ 2abs(x_j)−1`, `abs x₁ + abs x₂ ≤ 5/4`; `k=0`: `D` | line 182 agrees | R02 |
| 3.2 `analytic_comparison` | previous witness `g = −x²` (now excluded by `hc`); `g = id`, `h = y²`, anchor `−1`; objective `−x₁+x₂` on the 3.1 example | First: `y = g x`, `G_i ≤ g`, `H_i(g x) ≤ h(g x)`; second: `C_i = H_i(G_i) ≤ H_i(y)`; minima `−2`, `−5/4`, `−1` | true as stated; too narrow | R01 |
| 3.2 `fullspace_analytic_comparison` | `Dh i v = lim (h(y+tv)−h(y))/t`, `v ≥ 0` | quotient `≥ 0` by `Monotone h`, so `Monotone (Dh i)`; `MapsTo g D univ` trivial | true | none |
| 4.1 `shared_rows_projection` | `p = 0`; rows `{1,3}`, `{2}`; `h` = sum in `sharedOA` | `p=0`: `x ∈ D ∧ 0 ≤ b` on all sides; max-sum `5`, choices `3`, `5`; `H_i(y) = Σ y_j` | true | none |
| 4.2 `independent_rows_projection` | `k = 0`; `p = 0`; 3.1 example | `x ∈ D`; `0 ≤ b a`; `2(x₁+x₂)−2 ≤ 1/2` and its mirror: `abs(x₁+x₂) ≤ 5/4` | true; line 226 agrees | none |

- Previous review: R01 (line 162 lists component convexity and anchors), R02 (`analytic_comparison`), R03 (gate), R04, R05, R08, R09 repaired; R06 partly (API bullets added, no Checks: R02 here); R07 partly (R03 here); R10 not (R04 here).
- Source locators checked against the text: 2 (LYBV16 lines 355, 385–392: §4, p. 9; LYBV lines 428, 479–491: §4, p. 12, equations (8)–(10)); both support the statement of line 50.
- Library declarations opened at the pin (Mathlib 1b1ccf4): `isMinOn_iff`, `IsMinOn.comp_of_mapsTo` (`Order/Filter/Extr.lean:129, 409`), `ConvexOn.convex_epigraph`, `convexOn_iff_convex_epigraph` (`Analysis/Convex/Function.lean:289, 301`), `ConvexOn.le_slope_of_hasDerivAt` (`Analysis/Convex/Deriv.lean:596`), `Finset.sup'_le_iff`, `le_sup'`, `exists_mem_eq_sup'` (`Data/Finset/Lattice/Fold.lean:555, 561, 758`). Tau Ceti `mem_subdifferential_of_hasFDerivAt` (`TauCeti/Analysis/Convex/Differentiability.lean:144`) is the `EReal` full-space form; nothing here restates it.
- Cross-roadmap citations resolved: 3 on main (OptimalTransport, VariationalMethods, GeometricTopology, named as non-suppliers). The 10 "found nowhere" names are this file's `FiniteModel.*` declarations.
- Dependency check: `depcheck: 240 roadmaps, 2174 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: every counter 0, build passes. `lake env lean` on `Suggested.lean`: 13 `sorry` warnings, nothing else. Elaborated types compared with the README for all 32 declarations: the five "dropped binder" leads are harmless (`hg`, `hm` are in all three Layer 1 theorems; the instance binders are not used by the definitions concerned).
- One-tactic probe on a scratch copy (`simp`, `simp_all` with the definitions unfolded, `rfl`, `aesop`): none of the 13 theorems closes.
- Overlap check: read FiniteAffineBoundTightening, ExactPenalties, BoundedConicHulls, ExponentialCone, OptimalTransport; nonnegative-weight sum lifting is owned here (§2.3, Layer 4), ExponentialCone Layer 3 states its exponential-cone instance and names ConvexLifting as owner of generic lifting; no shared declaration name; nothing else shared.
- Source independence: 6 passages compared with 2 sources, none shared; largest share TS05, 5 of 10 locators; contents of TS05 not compared (text not readable).

## Not verifiable

- TS05 §2, Proposition 1 (pp. 226–227), Theorem 1 (pp. 227–228), Proposition 5 (p. 231), and what line 26 says of it: the DOI is paywalled; no open copy found by the sources service.
- HBO13 pp. 1–2, §3 opening and §3.1, p. 4 (sampled 2.1–2.3): the landing page returned HTTP 403; no legal copy found.
- KLW18 §2 p. 573, §3 p. 574, equations (4)–(7), Proposition 1 (sampled 4.1): the sources service classes the publisher's host as paywalled and did not fetch it.
- LYBV16 proceedings pages 102–113: only arXiv:1511.06710v3 was read.

## Source issues

- none

## For the human reviewers

- **Licence.** README line 247 cites `github.com/bernalde/complete-retained-library` at commit 59c355e as containing related proof constructions, under Apache-2.0 by the README's account; `Suggested.lean` may be adapted from it. The repository and its licence were not read.
- **Not tested.** TS05 has the largest share of locators (5 of 10) and is paywalled: wording and arrangement were not compared with it. Layers 1, 3, 4 cite its Proposition 1, Theorem 1, Proposition 5 in that order.
- **Scope.** The readable sources give the Layer 1 identity as a remark (LYBV16 lines 385–392; LYBV lines 479–491), not a numbered theorem; the 13 stated headlines are order, finite-sum and first-order convexity set inclusions.
