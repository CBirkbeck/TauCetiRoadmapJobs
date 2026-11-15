# Review of PotentialAutomorphyInfrastructure (pull request #1081 at eeb6a5b)

**Verdict:** accepted

Incremental re-review: the folder is unchanged since 0f3131e (0 lines); this round reads the pull request's title and description against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "`Suggested.lean` declares nothing: no headline theorem is statable against the pinned Mathlib and Tau Ceti, and its module docstring names the missing carriers layer by layer; every target is in the README."
- R02 — repaired: the description now reads "GPT-6 (Codex) for the port from the accepted explorer package and for the Lean module, and Claude for the review repairs; the author-side red-team repairs are part of this change."

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §0.6 bottom-alcove duality, closed bound `λ₁ − λₙ + n − 1 ≤ p` (description: "proved for their full range") | `GL₂`, `p=3`, `λ=(2,0)` (endpoint) and `λ=(3,0)` | endpoint: bound `3 ≤ 3`, `∏ a!(2−a)! = 2·1·2 = 4`, a 3-adic unit; `(3,0)`: bound `4 > 3`, `∏ a!(3−a)! = 144`, `v₃ = 2` | iso at the endpoint, fails beyond; holds |
| §0.6, same | `GL₂`, `p=2`, `λ=(1,0)` and `λ=(2,0)` | `(1,0)`: bound `2 ≤ 2`, determinant `1`; `(2,0)`: bound `3 > 2`, determinant `2·1·2 = 4`, `v₂ = 2` | holds at `p=2` |
| §5.23 (description: "neither lifting theorem assumes a polarization") | hypotheses (1)–(5) of §§5.22–5.23; `n=1` | no conjugate-self-duality hypothesis on `ρ` or `λ`; for `n=1` the forced relation is `λ_τ + λ_{τc}` constant, the weight of an algebraic Hecke character | description agrees with the statements |

The rows for all other statements stand as in the previous review, of `0f3131e`: the diff changes no statement.

- Description against the head, sentence by sentence: the folder is absent from main and added by this pull request (README, `Suggested.lean`, `metadata.toml`: the three files of the folder); `Suggested.lean` is `import Mathlib`, one module docstring and an empty namespace (0 declarations, no `sorry`); the docstring names missing carriers for Layers 0–5.
- Summary block against the README: the lifting theorems are §§5.22–5.23 under the names the block uses; soluble base change and rank-two tools are Layer 2; the three consumers are those of `## Downstream consumers`; the owned inputs listed are §§0.4–0.7, 1.9, 2.10, 2.18, 3.2, 5.3; "arbitrary compact open levels" is §0.1.
- Supplier sentence: every supplier roadmap of `### From the supplying roadmaps` is either on main (GeometricTopology, ReductiveGroups, ReductiveGroupsPartII, ClassFieldTheory, SmoothRepresentationsOfLocalGroups, IntegralHeckeAndGaloisDeterminants) or in the description's dependency list. Remark: the generated `depends-on` and `merge-order` blocks still list IntegralHeckeAndGaloisDeterminants as open; it is on main.
- Gate at eeb6a5b: every check 0 (`build=0`, `outside-folder=0`), `OK`. `lake env lean` on `TauCetiRoadmap/PotentialAutomorphyInfrastructure/Suggested.lean`: exit 0, no output. No file outside the folder differs from the merge base with main.
- Dependency check, verbatim: `depcheck: 243 roadmaps, 2272 edges, 0 problem(s)` (no UPWARD, CYCLE or `moved:` line).
- Library declarations opened: none; source locators checked: none (no passage of the folder changed, so the seeded sample falls in no changed passage; padding probe and `#check` comparison have no declaration to run on).
- Overlap check: read CrystallineLocalGlobalCompatibilityCM, PotentialAutomorphyInfrastructurePartII, IntegralHeckeAndGaloisDeterminants (scope, as listed in the overlap leads: no pull request changes this roadmap, no cited id dropped); nothing shared beyond what the previous review recorded.
- Source independence: 0 passages compared with 0 sources (changed passages only: the folder has none); largest share `acc`, unchanged; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- Nothing new. Carried from the previous reports, untouched: Khare–Thorne's repository copy, Jantzen II 5.5–5.6, Platonov–Rapinchuk, Harris–Taylor VII.2.6, Arthur–Clozel Ch. 3 and the works cited as ACC cites them; Boxer–Pilloni (ShimuraData's source for §§3.10–3.11).
- The description's attribution of AI assistance (which model did which part) is checked only against commit trailers, which name Codex and Claude.

## Source issues

- none

## For the human reviewers

- Licence: the README's References link Larsen's "Maximality of Galois actions for compatible systems" through a web.archive.org snapshot of the author's former page (README line 2347), as it does Geraghty's 2010 manuscript (line 2341); the host is an archive copy, not the author's live page or the publisher.
