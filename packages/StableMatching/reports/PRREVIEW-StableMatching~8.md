# Review of StableMatching (pull request #2346 at c017fba)

**Verdict:** needs changes

## R01 (P3) — LeanPool's NOTICE does not name the authors of the code

**Location:** `TauCetiRoadmap/StableMatching/README.md:321–322`: "adaptation is agreed first with the authors of the code (named in each file's header and in LeanPool's NOTICE)".

**Claim:** The NOTICE gives each project's upstream repository and licence. It names no author for `ClassicalGraphColouring`. LeanPool keeps the authors in the file headers and in its project registry.

**Witness:** lean-pool at `f8b9b72`, `NOTICE:69` gives only `github.com/jtraverso/galvin-dinitz`. `NOTICE:9–13` says the authors are recorded "in the per-file headers and in the project registry". `LeanPool/projects/classical-graph-colouring.yaml:18–19` names the author.

**Repair:** Replace the parenthesis so that the clause reads: "adaptation is agreed first with the authors of the code (named in each file's header and in the project's entry in LeanPool's registry, `LeanPool/projects/`)". For `ClassicalGraphColouring` both places name the same author.

## Previous findings

- R01 — repaired: "`LeanPool/ClassicalGraphColouring/Galvin/GaleShapley.lean` proves, by strong induction on the number of acceptable pairs, that stable matchings exist on finite markets whose acceptable pairs form one relation for both sides" (`README.md:324–326`).
- R02 — repaired: the description's Provenance now reads "proves the existence of stable matchings (1.2), by strong induction on the number of acceptable pairs, as a step of Galvin's theorem."

## Verified sound

| Statement | Instances | Values computed (roadmap side / other side) | Result |
|---|---|---|---|
| "named … in LeanPool's NOTICE" (`README.md:322`) | `ClassicalGraphColouring` at `f8b9b72` | `NOTICE:69` gives the repository URL and no name. `classical-graph-colouring.yaml:18–19` gives Juan Pablo Traverso Gianini | false (R01) |
| "named in each file's header" (`:321–322`) | the 4 files of `Galvin/` | Lines 2–4 of `GaleShapley`, `Galvin`, `Kernel` and `Orientation` each give the same author and copyright holder | holds |
| "strong induction on the number of acceptable pairs" (`:324–325`) | 2 × 2 market: both men rank `w₁ < w₂ < none`; `w₁` ranks `m₂ < m₁`, `w₂` ranks `m₁ < m₂` | `GaleShapley.lean:67,70,78–79`: both men favour `w₁`, so `(m₁,w₁)` is deleted. Pairs 4 → 3, men 2 → 2. Result `(m₁,w₂),(m₂,w₁)`, which is also the DA outcome | holds |
| "one relation for both sides", "the content of 1.2" (`:325–327`) | 1 × 1: `m₁` ranks `w₁ ↦ 0, none ↦ 1`; `w₁` ranks `none ↦ 0, m₁ ↦ 1` | `E m₁ w₁ = (0<1 ∧ 1<0) = false`, so LeanPool gives `μ = ∅`. Roadmap: `⊥` is stable (1≤1, 0≤0; a block needs 1<0); `{(m₁,w₁)}` is not IR (1≤0 fails) | holds |
| 1.2 `exists_isStable` (`Suggested.lean:135`), cited by the changed text | `W` empty, any finite `M` | `⊥ : M ≃. W`: each man has `rankM m none ≤ rankM m none`, and with no woman there is no blocking pair | holds |

The rows for the untouched statements stand as in the previous review, of `9784d8d`. The diff changes no Lean statement.

- Gate rerun at this head: every check is 0, `OK`. The worker's gate at this head reports `build=0`. Dependency check: `depcheck: 259 roadmaps, 2454 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Elaboration: `lake env lean` on `Suggested.lean` gives 10 `sorry` warnings (lines 130–193) and nothing else. Between `9784d8d` and `c017fba` only `README.md` changed, so the signatures, the `#check` comparison and the one-tactic probe stand.
- External text read at lean-pool `f8b9b72`: `NOTICE` (lines 1–45, 69; 599 lines), `LeanPool/projects/classical-graph-colouring.yaml` (lines 1–60), the headers of the 4 `Galvin/` files, and `GaleShapley.lean:26–85`.
- Cross-roadmap: `roadmaps grep -i NOTICE --readme-only` finds no roadmap that cites LeanPool's NOTICE as its record of authors. `citations.md` lists no unresolved citation or Lean name.
- The description was checked sentence by sentence against this head. The Provenance sentence now matches `README.md:324–327`, and nothing else it describes changed.

Overlap check: the three closest-roadmap lists in `overlaps.md` are empty, so no scope was read; nothing shared. Mathlib owns `PEquiv`, and this roadmap owns markets, stability and deferred acceptance. LeanPool is not a supplier.

Source independence: changed passages only. 2 passages compared with 1 source, lean-pool: `README.md:320–322` against `NOTICE:9–13`, and `:324–327` against `GaleShapley.lean:11–19` and `classical-graph-colouring.yaml:6–7`. The longest shared run is 3 words ("the number of"). Largest share: `Roth2008`, 20 of 34 locators; the diff adds no locator. No layer was added, removed or reordered, so the arrangement stands as compared at `efeb540`: independent.

## Not verifiable

- Gale–Shapley 1962, Dubins–Freedman 1981, McVitie–Wilson 1970, Sotomayor 1996, Knuth 1976 and the published pagination of Roth 2008 cannot be read legally, as at `efeb540`. No changed passage cites them.

## Source issues

- none

## For the human reviewers

- Scope: the main source is a survey (Roth 2008), and the headline results date from 1962–1982 (Amer. Math. Monthly, BIT, Math. Oper. Res.). `metadata.toml` gives `math.CO`, and `README.md:304` names no downstream consumer.
- Licence: `Roth2008` was read from the NBER working-paper PDF (licence class `institutional`; its first page carries the author's © 2007 notice) and from the revised copy on the author's Stanford page. `Roth1982` was read from the author's university page.
- Licence: lean-pool `Galvin/GaleShapley.lean` at `f8b9b72` is Apache-2.0, and its project card says `provenance: AI` (`classical-graph-colouring.yaml:41`). It declares `Galvin.IsStable` and `Galvin.exists_isStable`, the same short names as `Suggested.lean:70, 135`. The binders and statements differ.
- Licence: the Archive of Formal Proofs entry (`README.md:312, 335`) and the other GitHub Lean developments of Gale–Shapley were not opened, so `Suggested.lean` was not compared with them.
