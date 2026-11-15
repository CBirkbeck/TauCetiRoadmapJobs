# Review of HabiroRings (pull request #1425 at 40eb896)

**Verdict:** needs changes

## R01 (P3) — Gate failure `statement-hygiene`: a theorem concluding `Nonempty (… ≃ₗ …)` is not named `nonempty_*`

**Location:** `TauCetiRoadmap/HabiroRings/Suggested.lean:165`–`169`: “theorem completedRegulatorTriviality … : Nonempty (P ≃ₗ[PowerSeries R] PowerSeries R)”; the same name is backticked at `TauCetiRoadmap/HabiroRings/README.md:1214`.

**Claim:** The push gate fails at this head on its `statement-hygiene` rule (one hit, P3). The statement is sound (table below); only its name breaks the rule. No canonical map exists to state instead: §6.4 shows the generator depends on a choice (1 versus 1+X).

**Witness:** Gate at `40eb896`: `statement-hygiene=1 … FAIL`, “line 169: P3 theorem `completedRegulatorTriviality` concludes `Nonempty (P ≃ₗ[PowerSeries R] PowerSeries R)`”.

**Repair:** Rename the theorem to `nonempty_linearEquiv_powerSeries_of_fiber` in `Suggested.lean:165` and in the API bullet at `README.md:1214`; change nothing else. Tested on a scratch copy: it elaborates with the same seven `sorry` warnings and `#check` returns the identical type (`Nonempty ((P ⧸ Ideal.span {PowerSeries.X} • ⊤) ≃ₗ[PowerSeries R] R) → Nonempty (P ≃ₗ[PowerSeries R] PowerSeries R)`).

## Previous findings

- R01 — repaired: `README.md:619` now ends “SolidAnalyticRings §§3.1–3.4 (product tensor, sphere-split towers and balanced relative base change)”; `:643` adds “SolidAnalyticRings §§5.1–5.4 (…)”; `:697` adds `[§2.9][r38]`, `[§2.10]`, `[§2.11]`. No new problem introduced.

## Verified sound

Incremental re-review of the 6 changed lines since `bde6585` (three `*Needs:*` lines of §§2.9, 2.10, 2.12), of what they cite, and of the pull request's title and description.

| Statement | Instances tried | Left / constructed value | Right / required value | Result / change |
|---|---|---|---|---|
| §2.9 solid idempotence (sampled; `Needs` changed) | n=1,2,3; n=2 in independent q₁,q₂ | sphere ranks deg P_n = 1, 3, 6; independent 3·3=9 | SolidAnalyticRings §3.1 product over I×J: 3·3=9; §3.4 balancing q₁=q₂ returns 3 | Pass; added §§3.1–3.4 supply exactly these steps |
| §2.10 completed sums (`Needs` changed) | singleton blocks, f=id, r=1; all-one family | P_n-weighted family: nonzero mod P₁ only at n=0 (P₀=1); all-one: nonzero at every n | SolidAnalyticRings §5.3 retains blocks with f(j)<r: only j=0 | Pass; added §§5.1–5.4 is the owner of the formula |
| §2.12 bounded-below closure (`Needs` changed) | M=N=S_H; local dependency order | tensor S_H by §2.9; edges 2.12→{2.5, 2.8, 2.9, 2.10, 2.11}, 2.11→{2.10, 2.9}, 2.10→{2.9, 2.8, 2.7}, 2.9→{2.7, 2.8} | completed tensor S_H; no edge returns to 2.12 (§§2.5, 2.7, 2.8 `Needs` at `:511`, `:559`, `:593`) | Pass; acyclic |
| §6.5 `completedRegulatorTriviality` (R01) | R=ℤ, P=ℤ[[X]]; P=R with X acting by 0, R≠0; R=0 | P/XP=ℤ, P free of rank 1; second: P/XP=R but P killed by X | conclusion true; second is not invertible (not faithful), so excluded by hypothesis; zero ring trivial | Pass; rename only (R01) |

Rows for the untouched statements stand as in the previous review, of `bde6585`.

- Gate rerun at `40eb896`: every counter 0 except `statement-hygiene=1` (R01); result FAIL. The worker's targeted build: `build=0`.
- Dependency check rerun with `--movable`: `depcheck: 244 roadmaps, 2233 edges, 0 problem(s)`; no UPWARD or CYCLE line. SolidAnalyticRings is at line 133 of the merge order, HabiroRings at line 337.
- Elaboration of `Suggested.lean` with `lake env lean`: seven `sorry` warnings, nothing else. No Lean statement changed since `bde6585`; the 15 elaborated signatures are as the previous review compared them.
- Cross-roadmap citations resolved for the changed lines: 8 section ids at the open head of SolidAnalyticRings (`afa637a`): §3.1 `README.md:345`, §3.2 `:361`, §3.3 `:387`, §3.4 `:403`, §5.1 `:471`, §5.2 `:499`, §5.3 `:539`, §5.4 `:555`; their content matches the three parentheticals. Local anchors `#210-completed-sums-of-countable-products` and `#211-tensor-products-of-completed-countable-sums` match the headings at `README.md:633` and `:668`; `[r38]` resolves at `:1386`.
- Source locators checked for the sampled target in the changed passages (§2.9): 2. Q line 3672–3687 (proof of B.8, printed pp.79–80: finite sphere stages, product tensor, identification of q₁ and q₂); T line 3832 (numbered 5.3, printed p.86, PDF p.90: Null_R). Both support the text as written.
- Pull request text against the head: title and description prose read sentence by sentence. It adds a new roadmap (three files, 1582 insertions, nothing removed or renumbered; 15 declarations, as the description's “only real-bodied definitions and theorems” says: 8 definitions, 7 theorems). “no Noetherian or finiteness assumptions” is said of deformations and holds for §§0.1–0.2 (`README.md:200`; the completed-map interface of §§0.4–0.5 assumes I finitely generated, as the scope paragraph states). “inverts only the discriminant” agrees with §5.8 (`README.md:1050`, `:1333`). The Validation counts (identifiers missing 0, `set_option` 0, sorry'd data 0, dependency problems 0, outside-folder paths 0) agree with the gate rerun. The six-line change alters no heading, declaration or supplier set (SolidAnalyticRings was already a supplier), so it makes no sentence wrong. No finding.
- Files changed outside the folder: none (`git diff --stat origin/main...HEAD` excluding the folder is empty).
- Overlap facts: no other open pull request changes this roadmap; no cited id is dropped or defined only by an open revision; no second copy on main.

Overlap check: read HabiroCohomologyFoundationsPartII, HabiroCohomologyFoundations, SolidAnalyticRings, QWittVectors, RefinedTraceMethods, EnhancedDerivedSheaves; nothing shared (SolidAnalyticRings `README.md:13` assigns the Habiro algebra, its factorial filtration and §§2.6–2.12 to HabiroRings and keeps the general split-tower, profile and null-family theorems; the others cite HabiroRings sections as a consumer or supplier without restating them).

Source independence: changed passages only; 3 passages compared with 2 sources (Q, T), none shared (the added text is three dependency clauses naming supplier sections); largest share Q, as in the previous review; no layer added, removed or reordered, so the contents were not compared again.

## Not verifiable

- The description's sentence on AI assistance (“0 independent review rounds and 2 red-team rounds on the job board”) describes the job board's history, which this review cannot read from the head; not checked.
- As in the previous review: the enhanced, relative Habiro, solid spectral and K₃-indexed-line headlines are not statable at the pins, and the supplier contracts are roadmap targets, not completed proofs.

## Source issues

- none

## For the human reviewers

- none
