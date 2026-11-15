# Review of EndoscopicTransferAndUnitaryTraceComparison (pull request #999 at f99f5d8)

**Verdict:** needs changes

Incremental re-review of 2 changed lines since 7205732, plus the check of the pull request's title and description against this head. The folder's change is sound; the one finding is in the description.

## R01 (P3) — The description says the Lean file states definitions and theorems; it declares none

**Location:** pull request description, second paragraph after the summary block: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti, every target is in the README."

**Claim:** A reader takes this to mean that `Suggested.lean` states some headline theorems. At this head it states none.

**Witness:** `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/Suggested.lean` lines 10 and 43–45: "No headline theorem of this roadmap is statable against the pinned libraries"; the namespace is empty (0 declarations in 44 lines).

**Repair:** Replace the sentence with: "This pull request adds the roadmap folder `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison` (README, `Suggested.lean`, `metadata.toml`). `Suggested.lean` declares nothing: no headline theorem is statable against the pinned Mathlib and Tau Ceti, and its module docstring names the missing carriers layer by layer. Every target is in the README."

## Previous findings

- The previous report (at 7205732) recorded no findings; nothing to account for.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| §10.19 auxiliary real quadratic field (reworded sentence, README line 3979) | `p` inert in `K`, `F₀,v₀=ℚ_p`, `R_p≅K_p=ℚ_{p²}` | `[F_v:F₀,v₀]=2`; over `F₀R` the completion is `ℚ_{p²}`, `ℚ_{p²}⊗K_p` has 2 factors: local degree 1 (split), completion `ℚ_{p²}=F_v`. | Pass; none. |
| §10.19, wrong model: quadratic field split at `p` | Same `v`, `R_p=ℚ_p×ℚ_p` | Completion of `F₀R` stays `ℚ_p`; local degree of `FR/F₀R` stays 2: not split. The three requirements exclude it. | Pass; none. |
| §10.19, existence at a ramified prime | `p=2`, `K=ℚ(i)` | `−7≡1 mod 8` is a 2-adic square, so `ℚ₂(i)=ℚ₂(√7)`; `R=ℚ(√7)` is real with `R₂≅K₂`. | Pass; none. |
| §10.19 against its source | Theorem 10.6 and its proof; Corollary 13.2 | Source: `R` real quadratic, disjoint from `F`, prime under `x` split, completions of `R`, `K` under `v` isomorphic; then place split, completion `F_v`. README: the same three conditions and two conclusions. | Pass; none. |

Rows for all other statements stand as in the previous review, of `7205732`.

- The diff since `7205732` is one sentence group of §10.19 reworded (1 insertion, 1 deletion in the README); no statement, locator, `*Needs:*` line, supplier or Lean declaration changed, and no file outside the folder changed (`git diff --stat origin/main...HEAD` outside the folder is empty).
- Source locators checked against the text: 2 (`scholze-llc-gln` lines 1305–1351, Theorems 10.5–10.7, printed pp. 27–28; lines 1619–1630, Corollary 13.2, p. 33). Both support §10.19 as written. No target of the seeded sample falls in the changed passage.
- Gate rerun on this head: every counter 0, `OK`. Dependency check: `depcheck: 247 roadmaps, 2262 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/Suggested.lean`: exit 0, no output. The file has no declaration, so there are no signatures or padding probes to run.
- Description read against the head, sentence by sentence: the summary block's claims (characteristic-zero local theory, finite-field curve, residue characteristics 2 and 3 at README lines 47 and 2002, large-characteristic weighted lemma outside a finite set at line 135, Jacquet–Langlands and `B(G)` imported, monodromy from segments, the five downstream uses at lines 5517–5523) agree with the README. Only R01 disagrees.
- Overlap facts: no other open pull request changes this roadmap, no cited id is dropped, no second copy on main. Overlap check: read IgusaVarietiesAndTorsionConcentration, AutomorphicSpectralTheory, SmoothRepresentationsOfLocalGroups (scope as cited in this README's Scope and Downstream sections); nothing shared; the change touches no owned object.
- Source independence: changed passages only; 1 passage compared with 1 source (`scholze-llc-gln` lines 1341–1351), longest shared run 4 words ("real quadratic field R"), which the mathematics forces; arrangement not compared again (the diff adds, removes or reorders no layer).

## Not verifiable

- The previous rounds' uncertified locator-only texts are untouched by this diff: `wald-weighted-twisted` Theorem 3.8; `arthur-classification` Theorems 1.5.1, 1.5.2, 2.2.1 and Chapters 6–8; `henniart09`; `jacquet-shalika90` §8 Theorem 1; `hiraga-saito12` Theorem 4.14.

## Source issues

- none

## For the human reviewers

- none
