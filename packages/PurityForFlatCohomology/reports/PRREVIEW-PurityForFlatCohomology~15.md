# Review of PurityForFlatCohomology (pull request #1840 at 160e354)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 160e354: the folder is unchanged, and this round reads the pull request's title and description as they stand now against the head. The previous finding is repaired; one sentence of the description is contradicted by the head.

## R01 (P3) — The description says the étale-depth bound needs no perfectoid input; the bound it names as a headline does

**Location:** pull request description, summary block, "Approach and generality": "the étale-depth bound and Zariski–Nagata purity need no perfectoid input."

**Claim:** True only for coefficients of order invertible in `R` (§1.6). The bound the description goes on to name, "Gabber's étale-depth bound for commutative finite étale coefficients" (`etaleDepth_ge_virtualDimension`, §6.3), is proved through §6.2, which uses perfectoid purity §5.10.

**Witness:** `TauCetiRoadmap/PurityForFlatCohomology/README.md` lines 2034–2036 ("ends at `G = ℤ/p` on a hypersurface … §6.2 applies"), line 2049 (`*Needs:* §§1.1, 1.6, 6.2`), line 2018 (§6.2 `*Needs:*` … 5.10); lines 1198–1200 restrict the perfectoid-free proof to invertible order.

**Repair:** Replace the clause by: "the étale-depth bound for coefficients of order invertible in `R` (§1.6) and Zariski–Nagata purity need no perfectoid input; the bound for every commutative finite étale group (§6.3) rests on purity for complete intersections (§6.2)."

## Previous findings

- R01 — repaired: the description now lists "Gabber's étale-depth bound for commutative finite étale coefficients, … the Picard groups of global complete intersections, purity for the torsion of `H²(−, 𝔾_m)`, Česnavičius's purity for the Brauer group … his purity for tori".

## Verified sound

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | §6.3 / `etaleDepth_ge_virtualDimension` (touched by R01) | `R = ℤ_p`, `G = ℤ/p` (order not invertible), `vdim = 1`; `R = 𝔽_p⟦x,y⟧`, `G = ℤ/p`, `vdim = 2` | `ℤ_p`: `i = 0`, `ℤ/p → ℤ/p` injective; `i = 1` unclaimed, `ℤ/p → (ℤ/p)²` (p odd) not surjective. `𝔽_p⟦x,y⟧`: `i = 1`, `R/(F−1) → H¹(U_R, ℤ/p)` injective by `Γ(U_R, 𝒪) = R` | statement holds; both lie outside §1.6 (`ℓ = p`), so the route is §6.2, as R01 says | none in the folder |
| 2 | `etaleCohomology_gm_purity_regular` (cited by the repaired sentence: "regular of dimension `≥ 2`") | `X = Spec ℤ_p`, `U = Spec ℚ_p` (closed point regular of dimension 1) | `H²(ℤ_p, 𝔾_m) = 0`, `H²(ℚ_p, 𝔾_m) = ℚ/ℤ`: restriction not surjective | excluded by `2 ≤ ringKrullDim`; the description keeps "dimension `≥ 2`" | none |

The rows of the previous reviews for untouched statements stand as in the previous review, of `160e354`.

- Description against the head, sentence by sentence: the title (the pull request adds the folder: 3 files, 4040 insertions, 0 deletions, nothing outside it); each of the fifteen theorems the second paragraph lists against `Suggested.lean` lines 161–455 and README lines 47–69 (hypotheses named there — locally Noetherian, strictly henselian, residue field of dimension at most one, quasi-compact inclusion omitted as a summary may — agree); `i < dim R`, `i ≤ dim R` for regular non-fields (§§6.2, 6.5); "over arbitrary rings" (§§0.4, 0.5); "no excellence or normality" (§1.8); the two consumers (lines 3467–3473); imports from PrismaticCohomologyPartII and PartIII; the docstring's list of unstated headlines (`Suggested.lean` lines 58–105). All agree except R01.
- Seeded sample: the folder's diff is empty, so none of the fifteen targets falls in a changed passage; the README flags no locator as unverified. Source locators checked this round: 0.
- Library declarations opened: none new; `git diff 160e354 HEAD` on the folder is empty, so the 25 elaborated signatures and the one-tactic probe stand as recorded.
- Gate rerun at 160e354: every counter 0, `OK`; the worker's `gate.md` shows `build=0`. Dependency check: `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 15 warnings, all ``declaration uses `sorry` ``, 0 errors.
- Outside-folder diff against `origin/main`: empty. Overlaps: no other open pull request changes the roadmap, no cited id dropped, none defined only by an open revision; cross-roadmap citations found nowhere: 0.
- Overlap check: read SchemeAndStackFoundationsPartII, LocalPurity, SchemeAndStackFoundations (scopes as in the previous reviews; no owned object added); nothing shared.
- Source independence: changed passages only; 0 passages compared with 0 sources, since the folder did not change; largest share CS24, unchanged; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- Nothing new. As before: SGA3 VIII–X (§§7.12a–7.12e), Aus62 Theorem 1.3 (§7.2), DF84 Remark 3 (§8.18), Avr77 Proposition 3.6 (§1.2) are uncertified and were read only through their uses in CS24 and C19.

## Source issues

- none

## For the human reviewers

- none
