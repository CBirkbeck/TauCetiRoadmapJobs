# Review of StableMatching (pull request #2346 at d461ad2)

**Verdict:** accepted

## Previous findings

- R01 — repaired: "adaptation is agreed first with the authors of the code (named in each file's header and in the project's entry in LeanPool's registry, `LeanPool/projects/`), and adapted code keeps its license notices" (`README.md:321–323`).

## Verified sound

| Statement | Instances | Values computed (roadmap side / other side) | Result |
|---|---|---|---|
| "named in … the project's entry in LeanPool's registry, `LeanPool/projects/`" (`README.md:322`) | `ClassicalGraphColouring`, lean-pool `f8b9b72` | `LeanPool/projects/` holds 343 entries, each with an `authors:` field. `classical-graph-colouring.yaml:18–19` names Juan Pablo Traverso Gianini | holds |
| "named in each file's header" (`:321–322`) | the 4 files of `Galvin/` at `f8b9b72` | Lines 2–4 of `GaleShapley`, `Galvin`, `Kernel` and `Orientation` give the same author as the registry entry | holds |
| The registry is LeanPool's record of authors | `NOTICE` at `f8b9b72` | `NOTICE:9–13` says authors are recorded in the per-file headers and the project registry. `NOTICE:69` gives only the upstream URL | holds |
| 1.2 `exists_isStable` (`Suggested.lean:135`), cited by the changed section (`:327`) | 1 × 1: `m₁` ranks `w₁ ↦ 0, none ↦ 1`; `w₁` ranks `m₁ ↦ 0, none ↦ 1` | `⊥` is blocked (0<1, 0<1). `{(m₁,w₁)}` is IR (0≤1 on both sides) and has no block (0<0 false). So there is exactly one stable matching. LeanPool `E m₁ w₁` = true | holds |
| 1.1 `exists_isStable_man_eq_deferredAcceptance` (`:130`), same market | 2 rounds from `R = ∅` | `proposal m₁ ∅ = some w₁` and `held … w₁ = some m₁`, so `R` stays `∅` and DA gives `m₁ ↦ w₁`. This is the unique stable matching | holds |

The rows for the untouched statements stand as in the previous review, of `c017fba`. The diff changes no Lean statement, and the seeded sample falls outside the changed lines.

- Gate rerun at this head: every check is 0, `OK`. The worker's gate reports `build=0`. Dependency check: `depcheck: 261 roadmaps, 2511 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Elaboration: `lake env lean` on `Suggested.lean` gives 10 `sorry` warnings (lines 130–193) and nothing else. The file was last changed at `efeb540`, so the signatures, the `#check` comparison and the one-tactic probe stand.
- External text read at lean-pool `f8b9b72`:
  - `NOTICE` (lines 1–15 and 69).
  - `LeanPool/projects/`: all 343 entries scanned for `authors:`, and `classical-graph-colouring.yaml` read at lines 1–45.
  - The headers of the 4 `Galvin/` files.
- Cross-roadmap: `citations.md` lists no unresolved citation or Lean name. `roadmaps grep` for stable matching, deferred acceptance, Gale–Shapley and blocking pair finds one other hit, `EndoscopicTransferAndUnitaryTraceComparison/README.md:3306`, where "stable matching conditions" means something unrelated.
- Pull request text: the title and description were checked against this head. The diff changes only the parenthesis on the authors' record, which the description does not mention. Its Provenance sentence still matches `README.md:325–328`, and `Suggested.lean` is unchanged since `efeb540`, as the description says.

Overlap check: the three closest-roadmap lists in `overlaps.md` are empty, so no scope was read; nothing shared. Mathlib owns `PEquiv`, and this roadmap owns markets, stability and deferred acceptance. LeanPool is not a supplier.

Source independence: changed passages only. 1 passage compared with 1 source, lean-pool: `README.md:321–323` against `NOTICE:9–13`. The longest shared run is 3 words ("and in the"). Largest share: `Roth2008`, 20 of 34 locators; the diff adds no locator. No layer was added, removed or reordered, so the arrangement stands as compared at `efeb540`: independent.

## Not verifiable

- Gale–Shapley 1962, Dubins–Freedman 1981, McVitie–Wilson 1970, Sotomayor 1996, Knuth 1976 and the published pagination of Roth 2008 cannot be read legally, as at `efeb540`. No changed passage cites them.

## Source issues

- none

## For the human reviewers

- Scope: the main source is a survey (Roth 2008), and the headline results date from 1962–1982 (Amer. Math. Monthly, BIT, Math. Oper. Res.). `metadata.toml` gives `math.CO`, and `README.md:304` names no downstream consumer.
- Licence: `Roth2008` was read from the NBER working-paper PDF (licence class `institutional`; its first page carries the author's © 2007 notice) and from the revised copy on the author's Stanford page. `Roth1982` was read from the author's university page.
- Licence: lean-pool `Galvin/GaleShapley.lean` at `f8b9b72` is Apache-2.0, and its project entry says `provenance: AI` (`classical-graph-colouring.yaml:41`). It declares `Galvin.IsStable` and `Galvin.exists_isStable`, the same short names as `Suggested.lean:70, 135`. The binders and statements differ.
- Licence: the Archive of Formal Proofs entry (`README.md:312, 336`) and the other GitHub Lean developments of Gale–Shapley were not opened, so `Suggested.lean` was not compared with them.
