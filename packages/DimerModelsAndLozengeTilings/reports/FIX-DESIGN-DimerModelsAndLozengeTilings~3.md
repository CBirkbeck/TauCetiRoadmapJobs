# Repair of DimerModelsAndLozengeTilings (design, round 3)

Findings resolved: the eleven findings R01–R11 of
`packages/DimerModelsAndLozengeTilings/reports/REV-DESIGN-DimerModelsAndLozengeTilings~2.md`
(verdict `needs_changes` in `packages/DimerModelsAndLozengeTilings/design/review.json`). Every
finding was checked against the cited source lines, the pinned libraries and the roadmap's own
definitions. All eleven are correct, and all are applied. Files edited:
`packages/DimerModelsAndLozengeTilings/design/README.md` and
`packages/DimerModelsAndLozengeTilings/design/plan.json`. `sources.toml` is unchanged: no new work
is cited.

## R01 (P1) — applied

Verified: `γ_{{0}}(C|ω)=1_C(ω)` depends on `ω(0)`. 4.5: measurability is now for the trace of `𝓕_{Λᶜ}` on `X`; the positive Check moves to `X₀={0̄,1̄}`; a negative control for the full product is added. Also updated: the 4.6 Check, the Layer 4 Examples, plan 4.5 (statement, `identity_spec_constants`, new `identity_full_product`) and plan 4.6 (`identity_face_constants`).

## R02 (P1) — applied

Verified with `F=∅` on `ℤ`. 5.1 API: "depends only on ω on F and adjacent edges" → the restriction set `{ω'|_F}` is described explicitly, depends only on `ω` on the edges outside `F` that meet `F`, and is glued to `ω|_{Fᶜ}`. The `F=∅` example is added to the Check; 5.2 derives quasilocality from this. Plan 5.1 and 5.2 updated.

## R03 (P2) — applied

Verified by brute force (table). Conventions: torus lozenges are typed `L`-orbits with signed weights, and an entry is the sum of those weights. 8.1: "three nonzero entries" → "three edge contributions, added". 8.4: `∏κ_{ab}(ℓ_i)`, with `c_{ab}=0` when a face repeats. All `n₁,n₂≥1` kept. Same pattern: 8.2 "term"; 9.1 "at most three nonzero terms"; plan 8.1 and 8.4.

## R04 (P1) — applied

Verified at the pins: `ergodicSMul_iff_forall_smul_invariant` (`CountableAction.lean:68`, needs `SMulInvariantMeasure`); the `…_of_…` name occurs nowhere. Now cited with its reverse implication, and added to the *Needs* lines of 4.3, 5.3 and 9.4. README hashes removed; plan `baseline` set to the actual pins. `arrayTail` path → `Process/Array/Tail/Basic.lean:43`; Bernoulli-shift name fully qualified.

## R05 (P1) — applied

Plan only (the README already had the conditions): 9.1 `angles` and 9.6 `kernel_values` get `m≠0`, with the diagonal value at `m=0`; the 9.7 row determinant uses `S_s(0)=s` and `S_s(m)=sin(πsm)/(πm)` for `m≠0`; 2.5 `frozen_heights` uses the signed sum (`−1` at `x=−1` for `ε≡1`). The README has no unqualified copy.

## R06 (P3) — applied

Verified: no `{c x_k}` is a perfect matching; the star has none. The 5.1 Check now uses the double-hub graph `c,d,x_n,y_n`, with `M_k={c x_k,d y_k}∪{x_n y_n:n≠k}` converging to `{x_n y_n}`, which leaves `c,d` uncovered. It is labelled a graph statement without a group action. Plan 5.1 `infinite_degree` updated.

## R07 (P2) — applied

10.1 is now defined for arbitrary regions, with `μ_N` concentrated on the closed set `𝔈(R_N)`; finiteness is kept in 10.2(d). The plane Check names the infinite region; the wrong-sign Check explains why `|v_N|→∞` is needed. Plan 10.1: statement and the `constant` and `wrong_sign` tests. The 10.3 reference for uniform measures is corrected (10.1 → 10.2).

## R08 (P3) — applied

6.3 Check: "`Φ₂ ∩ slope⁻¹(1,0) = {M₁}`" → "the invariant probability measures concentrated on `Φ₂` with slope `(1,0)` form `{δ_{M₁}}`". The mixture `(δ_{M₁}+δ_{M₃})/2` is given as the excluded case (slope `(1/2,0)`). The density-1 sequence statement is kept. Plan 6.3 `corner_case` updated. No other place applies `slope` to a tiling.

## R09 (P3) — applied

Checked against aggarwal2023 lines 370–375: the vertices at `A=B=C=1` are `(0,0),(1,0),(0,1),(1,2),(2,2),(2,1)`, centred at `(1,1)`. The 10.3 Check now says that this hexagon is `R₆ + (1,1)`, with two tilings that are the translates of `T_a` and `T_b`. Plan 10.3 `unit_hexagon_case` updated.

## R10 (P3) — applied

Deleted the sentence "The board's constructive field theory design … shares only the vocabulary" from Downstream consumers. No other process wording found (searched for: board, round, removed, so far, PR numbers, paths).

## R11 (P2) — applied

Plan 3.1: the Boltzmann probability exists only for a positive partition function (for positive weights, exactly when the region is tileable); the matrix and the partition function stay defined for every finite region. `single_face` now includes the empty region. Plan 5.2 `C6_boltzmann`: "with unit weights" restored, with the `8/9, 1/9` counterexample. The README already had both.

## Checks

**Dependency gate** (command of the brief), output:

```text
candidate: DimerModelsAndLozengeTilings is not in the merge order yet; checked as if placed after QuasiregularMaps (the intake inserts it when its design is accepted)
depcheck: 234 roadmaps, 2109 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Not being in the merge order is expected at the design stage.

**Citations** (`roadmaps resolve` on the edited README): no cross-roadmap citation and no Lean name is found nowhere. The four leads listed before this round are settled:
- `ergodicSMul_of_…` is renamed (R04);
- the three `Matrix.compound*` / `higherAdjugate` names resolve to PadicMeasuresIwasawaAlgebras on main, `Suggested.lean` lines 1031, 1036, 1041 and 1048.

In that contract I also stated the index types: compound matrices take linearly ordered index types, and the higher adjugate is for `Fin m`.

**Suggested.lean.** No `Suggested.lean` exists at the design stage, and this job may not create one. So no Lean elaboration and no `#check @name` comparison was run. No Lean name of the roadmap changed. The plan's target names are unchanged; only test names changed (below).

**Sources.** No new citation was added and nothing was fetched. `needs-references.toml` was not written. `thurston1990` and `georgii2011` stay settled as uncertified.

**Ownership.** The repairs introduce no new construction (no new carrier, comparison or foundational theorem), so the ownership position of the reviewed design is unchanged. Ownership against the files of open pull requests was not re-checked this round beyond `roadmaps resolve`, which checks the citations at the open heads. `scratch/overlaps.md` lists no pull request that changes this roadmap and no dropped or revision-only id.

## Adversarial pass on changed statements

Values computed exactly (fractions) by brute-force enumeration of torus tilings, or by hand where shown.

| Statement | Instances tried | Values on both sides | Result / change |
|---|---|---|---|
| 4.5 identity spec on `X₀={0̄,1̄}` | `Λ={0}`, `i=1∉Λ` | trace of `𝓕_{Λᶜ}` contains `{0̄}=X₀∩{ω(1)=0}`; `μγ_Λ(C)=Σμ(ω)1_C(ω)=μ(C)` for `μ=(δ_{0̄}+δ_{1̄})/2`, `C={1̄}`: `1/2=1/2` | positive Check sound |
| 4.5 identity on full product | `Λ={0}`, `C={ω(0)=1}`, `ω,ω'` differ at 0 | kernel `1` vs `0` on one exterior fibre; condExp under Bern(1/2): `1/2` | negative control added |
| 4.6 face on `X₀` | `pδ_{0̄}+(1−p)δ_{1̄}`, `p=0,1/2,1` | invariant event `{1̄}` masses `1, 1/2, 0`; ergodic exactly at `p∈{0,1}` = extreme points | Check sound |
| 5.1 restriction sets | `ℤ`, `F=∅`; isolated `C₆`, `F` all edges | restriction sets `{∅}`, `{∅}`; completions `{even}≠{odd}`. `C₆`: 2 restrictions (the two matchings), independent of other components | sound |
| 5.2 quasilocality | cylinder on `E`, `F` | `γ_F(C|ω)` depends on `ω` on `(E∖F)` ∪ edges outside `F` meeting `F`; denominator `≥ w(ω|_F) > 0` | sound |
| 5.1 double-hub graph | `M_k`, `k=1,2,…` | degrees in `M_k`: all 1; limit degrees `c,d`: 0, `x_n,y_n`: 1 | sound |
| 8.1 entries, small tori | `1×1` unit; `1×1` weights `(1,1,2)`; `1×2` unit | `1×1`: `K_{00..11}=3,1,1,−1`; at `(1,1,2)`: `4,2,2,0` (`K₁₁=0`); `1×2`: `K=[[1+(−1)^a,(−1)^b],[1,1+(−1)^a]]`, dets `3,5,−1,1`, `Z=(3+5+1+1)/2=5` | agrees with 8.1/8.3 Checks |
| 8.4 repaired formula | all single lozenges and pairs on tori `1×1,1×2,2×1,2×2,1×3,2×3`, unit and random periodic edge weights | 0 mismatches out of 6, 21, 21, 78, 45, 171 events per weight choice; `Σε det = 2Z` for each torus | sound for all `n₁,n₂≥1` |
| 8.4 negative controls | `1×1`: aggregated entry; types 1 and 3 without convention | aggregated: `(3+1+1+1)/6=1` vs true `1/3`; no-convention pair: `w₁w₃(1−1+1+1)/(2Z)=1/3` vs true `0` | both added as Checks |
| 8.4 inverse-minor equality with convention | repeated white face; repeated black face | `[K⁻¹(v_i,u_j)]` has two equal columns or rows, det `0` = `c_{ab}=0` | holds |
| 9.1 "at most three nonzero terms" | uniform weights, `u−v=(3,0)` | term `w₁G((3,−1)) = (−1)³sin(π)/(3π) = 0` | "three nonzero" was false; corrected |
| 9.1/9.6/9.7 plan row formulas | `s=1/3`, `m=0,1` | `S_s(0)=1/3`, one-site det `1/3`; totalised quotient `0`; `m=1`: `√3/(2π)` both | `m≠0` added |
| 2.5 plan signed height | `ε≡1`, `x=−1`; alternating, `x=−3,3` | `−1` vs old `0`; `−(1+0+1)=−2=⌊−3/2⌋`, `0+1+0=1=⌊3/2⌋` | corrected |
| 6.3 corner Check | `δ_{M₁}`; `(δ_{M₁}+δ_{M₃})/2` | slopes `(1,0)`, `(1/2,0)` | singleton `{δ_{M₁}}` |
| 10.1 arbitrary regions | `R_N` all faces, `μ=δ_{M₃}`; `R₆+v_N` with `−v_N`, `+v_N`, `v_N=0` | type-3 edge probabilities `1`; `1/2,1/2` on `T_a,T_b`; `+v_N`, `|v_N|→∞`: all `0`; `v_N=0`: hexagon law both ways | sound |
| 10.1 closedness of `𝔈(R)` | face and edge conditions | each depends on ≤3 coordinates (clopen); countable intersection is closed | sound |
| 10.3 Aggarwal hexagon | source vertices minus `(1,1)` | `(−1,−1),(0,−1),(−1,0),(0,1),(1,1),(1,0)` = six neighbours of 0 | `R₆+(1,1)` |
| 3.1/5.2 plan Boltzmann | `{W(0)}`; empty region; `C₆` alternating 2,1 | `Z=0` (no law); `Z=1` (point mass); masses `8/9,1/9` vs unit `1/2,1/2` | conditions restored |

## For the maintainer

- No README target, section number or Lean name changed. Plan test names changed: 4.5 `trivial_spec` → `identity_spec_constants` (new test `identity_full_product`), 4.6 `trivial_face` → `identity_face_constants`, 8.4 `shared_white` → `shared_faces`. No other roadmap cites these.
- 8.4 gains the prerequisite `target:8.1`; 4.3, 5.3 and 9.4 gain `tauceti:TauCeti.MeasureTheory.ergodicSMul_iff_forall_smul_invariant`. The plan's `baseline` now records the actual pins.
- No suspicious instructions were found in the review or in the sources read.
