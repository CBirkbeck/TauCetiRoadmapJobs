# Review of RelativeJacobiansAndIntegralCurveModels (pull request #1232 at f6d3602)

**Verdict:** needs changes

Incremental re-review of 2 changed lines since 3b336e5 (the proof-case paragraph of README §3.1), plus the pull request's title and description. The changed paragraph is sound; the three findings are a gate failure and two stale sentences of the description.

## R01 (P3) — gate fails: `letI` in the signature of `globalFunctions_constants`

**Location:** `TauCetiRoadmap/RelativeJacobiansAndIntegralCurveModels/Suggested.lean:73`: "`letI : Algebra R X.functionField := ((Scheme.ΓSpecIso (.of R)).inv ≫ f.appTop ≫ g).hom.toAlgebra`"

**Claim:** The push gate fails on this head with `statement-hygiene=1`: a theorem signature may not carry `letI`/`haveI`. No acceptance while the gate fails.

**Witness:** Gate line: "statement-hygiene: line 73: P3 `letI` in the signature of theorem `globalFunctions_constants`; repair: use an instance binder or a named instance in the signature".

**Repair:** Replace lines 73–75 by the instance-free form:

```lean
    ∀ a : X.functionField, a ∈ g.hom.range ↔
      ((Scheme.ΓSpecIso (.of R)).inv ≫ f.appTop ≫ g).hom.IsIntegralElem a := by
```

Tested on a scratch copy: it elaborates with `sorry` as the only warning, and `Iff.rfl` proves it equivalent to the present `IsIntegral R a` under the present `letI` (`RingHom.IsIntegralElem`, `Mathlib/RingTheory/IntegralClosure/IsIntegral/Defs.lean:39`, `:54`). The README sentence at line 164 stays true.

## R02 (P3) — the description says the roadmap follows a source

**Location:** pull request description, block `<!-- roadmap-summary -->`, "Approach and generality": "The roadmap follows Bosch–Lütkebohmert–Raynaud."

**Claim:** The head contradicts it: the README never says it follows a source; it presents Layers 0–5 as its own order, each with its `*Needs:*` lines, and Layer 0 is sourced to the Stacks project and Tau Ceti, not to that book.

**Witness:** `README.md` "How to read the build" and the layer table (lines 8–14); `grep -i follow README.md` finds no sentence about a source's order. BLR is cited by locator only (40 locators).

**Repair:** Replace the sentence by: "The main Picard and Néron inputs are cited to Bosch–Lütkebohmert–Raynaud by exact locators; the layer order is the roadmap's own, forced by its dependencies."

## R03 (P3) — the description announces red-team passes that the branch already contains

**Location:** pull request description, last prose paragraph: "with author-side red-team passes to follow."

**Claim:** Written for the first head. The branch now holds two red-team repair commits, the headline rewrite of `Suggested.lean` and three review-repair commits, none of which the description states.

**Witness:** `git log origin/main..HEAD`: `2331ae99` and `6910a2a9` (red-team repairs), `25f1d2db` (headline theorems), `e32750ad`, `3b336e52`, `f6d36023` (review repairs).

**Repair:** Replace the clause by: "followed by two author-side red-team repair passes and three rounds of review repairs; `Suggested.lean` states seven headline theorems and two definitions."

## Previous findings

- none: the review of `3b336e5` listed no finding.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| §3.1 proof-case paragraph, README line 592 (reworded) against the text at `3b336e5` | Obligations of the old paragraph, one by one | Old: 3 cases; `H` flat subgroup; forgetful kernel ⊂ `H`; `G/H` separated; algebraic space by §1.8; `G/H ≅ P/E`; scheme structure; independence of `Y`; finite type in §3.3 = 9. New: 9 of 9, none added. | Same mathematics; only the order of the cases changed. |
| §3.1 case numbering against its Check "fails to cover the third proof case" (line 607) | Which case is non-representable | New text: "The third proof case is the general one"; "The first two cases assume `Pic` representable". Check: third case is the one lost by assuming representability. | Agree. |
| §3.1 general case, `G = (P,Y)`, `H` = closure of `ker(G_K → P_K)` | `X = P¹_R`, `Y` = two disjoint sections; smooth elliptic family with `Y` = zero section | `P¹`: `P_K = 0`, kernel = `G_K`, `H = G` (flat, torus of dimension 1 on both fibres), `G/H = 0 = Q`. Elliptic: kernel trivial, `H` = unit section, `G/H = G = P = Q`. | Both agree with the Checks at lines 602–603. |
| §3.1 first case, "the generic-unit closure is then étale" | Blow-up of `P¹_R` at a rational special point | `E_K` = 1 point; `E_k = Z·[O(C₁)]`, a discrete group: fibre dimensions 0 and 0, `E` flat, unramified, not closed in `P`; `Q = P/E = 0`. | Étale and non-separated, as stated. |
| §3.1 citations in the changed sentences | §1.8, §3.3 | §1.8 (line 446) has both theorems used: the flat-subgroup quotient and the scheme structure of a separated smooth locally finite-type group space. §3.3's source line (688) carries finiteness, BLR §9.5 Lemmas 7–11. | Resolve. |
| `globalFunctions_constants` (R01), original against repair | `X = P¹_Z`, `a = t`, `a = 1/2`, `a = 3` | Range of `g` = `Z`: `t`, `1/2` not in range and not integral (no monic integer polynomial); `3` in range and a root of `T − 3`. Same values under `IsIntegralElem`. | Repair is definitionally the same statement (`Iff.rfl`). |

All other rows stand as in the previous review, of `3b336e5`.

- Gate, rerun on this head: every counter 0 except `statement-hygiene=1`: FAIL (R01). Targeted build passed (`build=0` in the worker's gate).
- Elaboration of `Suggested.lean` with `lake env lean`: seven `sorry` warnings, nothing else. The scratch copy with the R01 repair: the same seven, plus the proved `Iff.rfl` probe.
- Dependency check: `depcheck: 245 roadmaps, 2217 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- The diff changes one README paragraph: no statement of `Suggested.lean`, no heading, no `*Needs:*` line, no supplier, no locator. Files changed outside the folder: none.
- Library declarations opened at the pin: 2 (`RingHom.IsIntegralElem`, `IsIntegral`, same file, lines 39 and 54). Cross-roadmap citations in the changed paragraph: 0; internal section citations resolved: 2.
- Description checked sentence by sentence against the head: 3 paragraphs of the summary block and 4 of prose; 2 sentences wrong (R02, R03). The rest agree: it adds the roadmap (README, `Suggested.lean`, `metadata.toml`), names no removed section or declaration (0 removed), and its validation sentence holds.
- Overlap check: the three closest-roadmap lists were not re-read this round; the diff adds no object, section or supplier, and the overlap listing shows no shared roadmap, dropped id, second copy or conflicting head.
- Source independence: changed passages only; 1 passage, 0 compared, because its only source (BLR §9.5, pp. 265–267) could not be read; largest share BLR, 40 locators against 13 Stacks tags; contents not compared again (the diff adds, removes and reorders no layer).

## Not verifiable

- BLR §9.5, Proposition 3, pp. 265–267 (the locator of the reworded §3.1 paragraph, and the seeded target 3.1): the sources service resolves the book only to a paywalled publisher page (`uncertified`); neither the three proof cases nor the new wording could be set beside the text.
- The other seeded targets lie outside the changed passage and were not reopened.

## Source issues

- none

## For the human reviewers

- **Not tested.** BLR (*Néron Models*, Springer 1990) carries the largest share of the README's source locators (40, against 13 Stacks tags) and is not legally readable here. The paragraph at README line 592, reworded "into the roadmap's own words", was not compared with BLR pp. 265–267.
