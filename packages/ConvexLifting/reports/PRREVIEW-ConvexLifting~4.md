# Review of ConvexLifting (pull request #2292 at eb38f6a)

**Verdict:** needs changes

## R01 (P2) — Layer 3 still states only the all-monotone case of the comparison its source gives

**Location:** `TauCetiRoadmap/ConvexLifting/README.md` line 26: "TS05 §2, pp. 226–228, retains affine inner coordinates by equalities and needs monotonicity only in the other coordinates. The version allowing outer derivatives of either sign on affine coordinates is outside Layer 3."; `TauCetiRoadmap/ConvexLifting/Suggested.lean` line 243 `(hD : ∀ i, Monotone (Dh i))`.
**Claim:** Unchanged since `256500f`. No layer states the comparison at the generality the README attributes to its source; line 145 still records the uncovered instance ("does not assert a comparison for affine `g=id` under the nonmonotone outer square").
**Witness:** `X = ℝ`, `g = id`, `h(y) = y²`, anchor `−1`, `b = 1`: `Dh = −2·` fails `hD`; with inequality heights `fst(sharedOA) = ℝ ⊄ directOA = [−1,∞)`; with `y = x` imposed both are `[−1,∞) ⊇ S = [−1,1]`.
**Repair:** Add to §3.1–3.2 and to `Suggested.lean` (elaborated at this head on a scratch copy: 14 `sorry` warnings, nothing else; its second inclusion was proved there from `hD` alone; `J = ∅` is `analytic_comparison`; on the witness, `J = {0}`, `G(x) = x`, `H(y) = −2y−1`, both sets are `[−1,∞)`):

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

README line 26, last two sentences: "§3.2 states that version as `affine_coordinate_comparison`; `analytic_comparison` is its case with no affine coordinate." §3.2: "Prove `affine_coordinate_comparison`: for a set `J` of coordinates on which every component row equals the component on `D`, impose `y_j = G_i(x)_j` for `j ∈ J`, assume convexity only for `j ∉ J`, and assume `Dh i v ≥ 0` only for `v ≥ 0` vanishing on `J` (TS05 §2, Theorem 1, pp. 227–228)." Line 145, last sentence: "For affine `g=id` under the outer square, anchor `−1` and budget one, `affine_coordinate_comparison` with `J={0}` gives `[−1,∞)` for both sets."

## Previous findings

- R01 — not repaired: line 26 "The version allowing outer derivatives of either sign on affine coordinates is outside Layer 3"; the Layer 3 declarations of `Suggested.lean` are unchanged. R01 here.
- R02 — repaired: docstring lines 6–8 "It states the roadmap's headline theorems against the pinned APIs; every headline theorem is statable at the pins. These are suggested forms, not an exhaustive checklist. The markdown remains definitive."
- R03 — repaired: line 156 "Graph insertion adds no coordinates when `q=0`."; line 214 "With no anchors, `E=∅` and nonempty `D`, … With the anchor `(1,1)` and budget one … the shared projection is still empty".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.1 `directOA`, `sharedOA` against the Check of line 214 | `k=0`, `E=univ`; `k=0`, `E=∅`, `D≠∅`; `D=[−1,1]²`, `g=(x₁²,x₂²)`, sum, anchor `(1,1)`, `b=1`, `E=∅` | both `D`; shared `∅` (`z.2∈∅`), direct `D`; `C(x)=2x₁+2x₂−2≤1` gives `D∩{x₁+x₂≤3/2}`, shared `∅` | Check true; `MapsTo g D E` fails, so no conflict with `analytic_comparison` | none |
| 2.3 `separableLift` against the Check of line 156 | `q=0`, `l=1` | carrier `Point (n+0) m`; no nonlinear row (`Fin 0`); budget row is the empty sum `0≤0` | Check true | none |
| 3.2 `analytic_comparison` against R01's witness | `g=id`, `h=y²`, anchor `−1`, `b=1`, `D=E=ℝ` | `G(x)=x≤y`, `H(y)=−2y−1≤1`: projection `ℝ`; `C(x)=−2x−1≤1`: `[−1,∞)`; `Dh=−2·` not monotone | theorem not applicable; inclusion fails without `hD` | R01 |
| 3.2 `affine_coordinate_comparison` (repair of R01) | same data, `J={0}`; `J=∅`; `k=0` | `y=x` forced: shared projection `[−1,∞)`, direct `[−1,∞)`, `S=[−1,1]`; `J=∅`: `hD` is `Monotone (Dh i)`; `k=0`: `S⊆D⊆D` | true; second inclusion proved on the scratch copy | R01 |

- The diff changes no Lean statement; the rows for the untouched statements stand as in the previous review, of `256500f`.
- Source locators checked against the text: 0 new (the diff adds, changes and removes no locator); the seeded sample falls in no changed passage except the Checks of §2.3 and Layer 3, recomputed above.
- Library declarations opened: 0 new (the diff names none). Pins: Lean `v4.36.0-rc2`, Mathlib `1b1ccf4`, as the description states.
- Cross-roadmap citations resolved: the diff adds none; the 10 "found nowhere" leads are this file's `FiniteModel.*` declarations.
- Dependency check: `depcheck: 240 roadmaps, 2175 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder.
- Gate: every counter 0, build passes. `lake env lean` on `Suggested.lean`: 13 `sorry` warnings, nothing else. Only the module docstring changed, so the signature comparison and the one-tactic probe stand as in the review of `b2972af`.
- Pull request text against this head: 13 theorems, 17 definitions, one abbreviation, one structure counted in the file; "Only the module note changes in `Suggested.lean`" and "README examples … were updated" agree with the diff; no sentence contradicted.
- Overlap check: read FiniteAffineBoundTightening, ExactPenalties, BoundedConicHulls, ExponentialCone, OptimalTransport; nothing shared (ExponentialCone names ConvexLifting as owner of generic composition lifting and keeps its exponential-cone instance).
- Source independence: changed passages only; 3 passages (README lines 156 and 214, docstring lines 6–8) compared with 2 sources (LYBV16, LYBV), none shared; largest share TS05, 6 of 11 locators; contents of TS05 not compared (text not readable); the diff adds, removes and reorders no layer.

## Not verifiable

- TS05 §2, pp. 226–228, Proposition 1, Theorem 1, Proposition 5 (line 26 and R01's locator): paywalled, settled as uncertified.
- HBO13 pp. 1–2, §3 opening and §3.1, p. 4: no legal copy read.
- KLW18 §2 p. 573, §3 p. 574, equations (4)–(7), Proposition 1: settled as uncertified.
- LYBV16 proceedings pages 102–113: only arXiv:1511.06710v3 was read.

## Source issues

- none

## For the human reviewers

- **Licence.** README line 280 lists `github.com/bernalde/complete-retained-library` at 59c355e as "Reference software" with a copyright line and Apache-2.0 links (LICENSE, NOTICE); `Suggested.lean` may be adapted from it. The repository, its licence and its NOTICE were not read.
- **Not tested.** TS05 has the largest share of locators (6 of 11) and is paywalled: wording and arrangement were not compared with it. Layers 1, 3, 4 cite its Proposition 1, Theorem 1, Proposition 5 in that order.
- **Scope.** The readable sources give the Layer 1 identity as a remark (LYBV16 lines 385–392; LYBV lines 479–491), not a numbered theorem; the 13 stated headlines are order, finite-sum and first-order convexity set inclusions.
