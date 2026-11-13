# Review of ConvexLifting (pull request #2292 at 256500f)

**Verdict:** needs changes

## R01 (P2) — Layer 3 still states only the all-monotone case of the comparison its source gives

**Location:** `TauCetiRoadmap/ConvexLifting/README.md` line 26: "TS05 §2, pp. 226–228, retains affine inner coordinates by equalities and needs monotonicity only in the other coordinates. The version allowing outer derivatives of either sign on affine coordinates is outside Layer 3."; `Suggested.lean` line 245 `(hD : ∀ i, Monotone (Dh i))` (unchanged).
**Claim:** The rewording names the narrowing and keeps it. No layer states the comparison at the generality the README attributes to its source; line 145 now records the uncovered instance ("does not assert a comparison for affine `g=id` under the nonmonotone outer square").
**Witness:** `X = ℝ`, `g = id`, `h(y) = y²`, anchor `−1`, `b = 1`: `Dh = −2·` fails `hD`; with inequality heights `fst(sharedOA) = ℝ ⊄ directOA = [−1,∞)`; with `y = x` imposed both are `[−1,∞) ⊇ S = [−1,1]`.
**Repair:** Add to §3.1–3.2 and to `Suggested.lean` (elaborated at this head on a scratch copy: 14 `sorry` warnings, nothing else; `J = ∅` is `analytic_comparison`; on the witness, `J = {0}`, `G(x) = x`, `H(y) = −2y−1`, both sets are `[−1,∞)`):

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

## R02 (P3) — The module docstring still describes the file's production

**Location:** `TauCetiRoadmap/ConvexLifting/Suggested.lean` lines 6–10: "These are suggested forms, not an exhaustive checklist. The theorem targets are intentionally admitted with `sorry`; … Compiling this file checks interfaces, not proofs of its admitted targets."
**Claim:** The README half of the previous R03 is repaired; the docstring is unchanged and does not say that the file states the roadmap's headline theorems against the pinned APIs.
**Witness:** `git diff b2972af 256500f --stat`: `README.md` only; `Suggested.lean` lines 3–11 are those the previous report quoted.
**Repair:** Replace lines 6–10 by: "The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline theorems against the pinned APIs; every headline theorem is statable at the pins."

## R03 (P3) — Two of the new Checks: one repeats its neighbour, one drops its premise

**Location:** `TauCetiRoadmap/ConvexLifting/README.md` line 156: "With no coordinates the objective is zero, and graph insertion adds no coordinates when `q=0`."; line 214: "With `E=∅` and nonempty `D`, the shared projection is empty while the direct set is `D`".
**Claim:** Line 156 repeats line 153 ("with no coordinates the objective is zero"). Line 214's second sentence is true only with no anchors, which it does not restate.
**Witness:** Line 213's own data (`D=[−1,1]²`, anchor `(1,1)`, budget one) with `E=∅`: the direct set is `D ∩ {x₁+x₂≤3/2} ≠ D`.
**Repair:** Line 156: "Graph insertion adds no coordinates when `q=0`. Finite bounds …". Line 214: "With no anchors, `E=∅` and nonempty `D`, the shared projection is empty while the direct set is `D`; with the anchor `(1,1)` of the previous Check the direct set is `D ∩ {x₁+x₂≤3/2}` and the shared projection is still empty."

## Previous findings

- R01 — not repaired: line 26 "The version allowing outer derivatives of either sign on affine coordinates is outside Layer 3"; `Suggested.lean` unchanged. R01 here.
- R02 — repaired: `**Checks.**` lists at lines 104, 122, 139, 181 and headed Check lists at 75, 151, 209, 256; every quoted instruction is replaced by computed values (recomputed below). Two wording defects: R03 here.
- R03 — partly repaired: line 40 starts at "Layer 1 establishes exact order lifting."; lines 22, 26, 275 reworded; the narrative paragraph is replaced by an attribution entry (line 280, for the human reviewers); the docstring is unchanged: R02 here.
- R04 — repaired: the description opens "Add the new roadmap folder `TauCetiRoadmap/ConvexLifting/` … It consumes Mathlib and has no supplier roadmap" and names `256500f`; its counts (13 theorems, 17 definitions, one abbreviation, one structure) match the file.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.1 Checks (lines 106–108) | `n=q=1`, `m=0`, `(3,7)`; `a=b=(1)`, offset `2`, `(−1,0)`; `c1=2`, `c2=−3`; `(0,1/2)` | `castAdd` gives `3`, `natAdd` gives `7`; `−1+0+2=1`, without offset `−1`; objective `−2`; `1/4≤1`, `1/2∉ℤ`, objective `1/2` | agree with `project`, `height`, `affineArgument`, `objective`, `feasibleOn` | none |
| 2.2 `normalizedLift` Checks (124–125) | offset `0` at `(−1,0,−1)`; offset `2` at `(−1,0,1)` | Lean rows `−a·x−b·z+u ≤ o`, `a·x+b·z−u ≤ −o`: values `0,0`; `2 ≤ 2`, `−2 ≤ −2`; residual `0`, objective `−1` | agree with lines 129–133 of the Lean | none |
| 2.3 `separableLift` Checks (141–145) | weight `−1`; `q=0`, `l=1`; `u=1/2`; `g(u)=u²−1`, `h=id` at `−1` | `(−1,0)`: `−1≤0`, `0≤0`, `d.g=1>0`; empty sum `0`, row `0≤0`; `−3/4≤v=−3/4≤0`, `v+1=1/4`; derivatives `−2`, `1` | true; `hw` needed | none |
| 3.1 row Checks (183–184) | `g=(x₁²,x₂²)`, sum, `a=(1,1)`; `x=a`, `x=0` | `G=(2x₁−1,2x₂−1)`, `H=y₁+y₂`, `C=2x₁+2x₂−2`; `C(a)=2`, `C(0)=−2`; without `−a`: `6` at `a` | agree with `componentRow`, `outerRow`, `directRow` | none |
| 3.2 `analytic_comparison` against Checks 213–217 | anchor `(1,1)`, `b=1`; affine `g`; `g=x²`, anchors `0` and `1`, `b=1/4`; `exp`, anchor `0`, `b=2`, `D=E=ℝ` and `[0,∞)` | both `x₁+x₂≤3/2`; both `x₁+x₂≤1`; `ℝ` against `x≤5/8`, `S=[−1/2,1/2]`; `(−∞,1] ⊇ (−∞,log 2]`; `[0,1] ⊇ [0,log 2]`, `(0,0)`: `0≤0`, `1≤2` | consistent with the theorem; line 214 see R03 | R03 |
| 3.2 `affine_coordinate_comparison` (repair of R01) | `g=id`, `h=y²`, anchor `−1`, `b=1`, `J={0}`; `J=∅` | `G(x)=x`, `H(y)=−2y−1≤1`: shared projection `[−1,∞)`, direct `1−2(x+1)≤1`: `[−1,∞)`, `S=[−1,1]`; `J=∅`: `hD` is `Monotone (Dh i)` | true; second inclusion from `C_i=H_i(G_i)`, `Dh_i(y−G_i x)≥0` | R01 |
| 4.1 `sharedRows` Checks (259, 262) | `p=1`, empty support, `D=[0,1]`, `b=−3`; constant row `1`, `b=1`, heights in `{0}` | membership `x∈D ∧ y≤−3`: minimum of `x` is `0` at `(0,−3)`; `1≤y≤1` gives `y=1`, projection `D`; `1≤0` fails: empty | true; outside `hne` as line 259 says | none |

- The diff changes no Lean statement; the rows for the untouched statements stand as in the previous review, of `b2972af`.
- Source locators checked against the text: 2 (LYBV16 lines 385–392, §4, p. 9; LYBV lines 479–491, §4, p. 12, equations (8)–(10)); both support line 50 and the reference entries, which the diff leaves as they were.
- Library declarations: the diff adds no library name; those of lines 32–36 stand as opened in the previous review (Mathlib 1b1ccf4).
- Cross-roadmap citations resolved: the diff adds none; the 10 "found nowhere" leads are this file's `FiniteModel.*` declarations. `../../LICENSE` (line 280) exists at the repository root.
- Dependency check: `depcheck: 240 roadmaps, 2175 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder.
- Gate: every counter 0, build passes. `lake env lean` on `Suggested.lean`: 13 `sorry` warnings, nothing else; the file is byte-identical to `b2972af`, so the signature comparison and the one-tactic probe of the previous review stand.
- Overlap check: read FiniteAffineBoundTightening, ExactPenalties, BoundedConicHulls, ExponentialCone, OptimalTransport; ExponentialCone (README line 392) names ConvexLifting as owner of generic composition lifting and keeps its exponential-cone instance; no shared declaration name; nothing else shared.
- Source independence: changed passages only; 6 passages compared with 2 sources (LYBV16, LYBV), none shared (the new exponential Check uses `g=id`, not the source's example); largest share TS05, 6 of 11 locators; contents of TS05 not compared (text not readable); the diff adds, removes and reorders no layer.

## Not verifiable

- TS05 §2, pp. 226–228 (changed line 26), Proposition 1, Theorem 1, Proposition 5: paywalled, settled as uncertified.
- HBO13 pp. 1–2, §3 opening and §3.1, p. 4 (lines 22, 275; sampled 2.1–2.3): no legal copy read.
- KLW18 §2 p. 573, §3 p. 574, equations (4)–(7), Proposition 1 (sampled 4.1): settled as uncertified.
- LYBV16 proceedings pages 102–113: only arXiv:1511.06710v3 was read.

## Source issues

- none

## For the human reviewers

- **Licence.** README line 280 lists `github.com/bernalde/complete-retained-library` at 59c355e as "Reference software" with a copyright line and Apache-2.0 links (LICENSE, NOTICE); `Suggested.lean` may be adapted from it. The repository, its licence and its NOTICE were not read.
- **Not tested.** TS05 has the largest share of locators (6 of 11) and is paywalled: wording and arrangement were not compared with it. Layers 1, 3, 4 cite its Proposition 1, Theorem 1, Proposition 5 in that order.
- **Scope.** The readable sources give the Layer 1 identity as a remark (LYBV16 lines 385–392; LYBV lines 479–491), not a numbered theorem; the 13 stated headlines are order, finite-sum and first-order convexity set inclusions.
