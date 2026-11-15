# Review of DiamondSixOperations (pull request #927 at 5c71e4e)

**Verdict:** needs changes

## R01 (P3) — The description says the Lean file states definitions and theorems; it states none

**Location:** pull request description, prose after the summary block: “the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti, every target is in the README.”

**Claim:** `Suggested.lean` carries definitions and theorems, and the description tells a reader what the acceptance test contains.

**Witness:** `TauCetiRoadmap/DiamondSixOperations/Suggested.lean` at this head, lines 10 and 29–31: “No headline theorem can be stated at these pins”, followed by an empty namespace. The worker's count for the folder: 0 Lean declarations added. The description nowhere says so, nor that the folder is new.

**Repair:** Replace the sentence by: “This pull request adds the roadmap folder `TauCetiRoadmap/DiamondSixOperations` (README, `Suggested.lean`, `metadata.toml`). `Suggested.lean` declares nothing: no headline theorem is statable at the pinned Mathlib and Tau Ceti, which lack perfectoid spaces with the v-topology, small v-stacks, locally spatial diamonds and `D_ét(Y, Λ)`; its module docstring names each headline and the missing carrier. Every target is in the README.”

## Previous findings

- R01 — repaired: README line 316 now reads “by the empty-source clause of `DiamondEtaleCohomology §C8.16` the empty diamond has `dim.trg = ⊥ = −∞ ≤ 0`”; the supplier's §C8.16 has the API bullet “Empty source gives bottom”.
- R02 — repaired: README line 358 opens the proof route with base change along a strictly totally disconnected cover (C3), then `DiamondEtaleCohomology §C0.19` and `§C8.21`, and says §C8.22 is stated for locally spatial diamonds only; both sections added to the Needs line 366.
- R03 — repaired: README lines 94 and 1301 cite “Huber 1996, Proposition 5.5.8” with no page; no other “p. 304” remains.
- R04 — repaired: the [LZ14] entry is deleted from the References; the string `LZ14` occurs nowhere in the README.

No repair introduced a new problem.

## Verified sound

Incremental re-review of 27 changed lines since `f893965`. `P = Spa(C, O_C)`, `B` the perfectoid closed unit ball, `1`/`0` for a predicate true/false.

| Statement (README line) | Instances tried | Computed left side | Computed right side / control | Result; change |
| --- | --- | --- | --- | --- |
| Exactness of `j_*` for `j : Y′ → (Y′)‾^{/Y}` (356, 358) | `η ⊂ Spa(C, C⁺)` of rank 2; `id`; ball over `P` | stalks of `j_*F`: `(F_η, F_η)`, `R¹j_*` stalk at `s` is `H¹(η, F) = 0`; `id`; pulled back to a cover `X`, `Rⁱj_*F` is the sheafification of `V ↦ Hⁱ(U ∩ V, F)` | `U ∩ V` quasicompact open in strictly totally disconnected `X`: `Hⁱ = 0` for `i > 0` by §C0.19 | Retain; the reduction uses only qcqs base change and a v-cover, no local spatiality. |
| `3·dim.trg` bound (356) | ball over `P`, `A = j_!Λ`, `Λ ≠ 0`; `id` nonempty; `∅` | top nonzero degree 2 (`Λ(−1)`); 0; none | bounds 3; 0; `3·⊥`, vacuous | Retain; ECD lines 5356–5367 and 5399–5407 give the same hypotheses and the `2d + d` count. |
| Classification Check, `T = ∅` (316) | `T = ∅`; `T = *` over `P` | source `∅`, `dim.trg = ⊥`; identity, `dim.trg = 0` | `⊥ ≤ 0`: 1; `0 ≤ 0`: 1; wrong convention `dim.trg ∅ = 0` would not separate the two | Retain. |
| `2·dim.trg` bound, Needs (354) | ball, `Λ ≠ 0`; `Λ = ℤ/1` | top degree 2; none | bound `2·1 = 2`, sharp; vacuous | Retain; the added §C8.16 is the section defining `dim.trg` and exists at the supplier's head. |
| Direct-sum criterion (756) | ball over strictly totally disconnected `X`; `ℤ₂ × X → X`, `X ≠ ∅`; `Y = ∅` | constructibility of all `Rⁱf_!F`: 1; 0 (fibre of `R⁰q_!𝔽_ℓ` is `C⁰(ℤ₂, 𝔽_ℓ)`, infinite-dimensional); 1 | `Rf^!` preserves sums: 1; 0 (distributions on `ℤ₂`: `∏` versus `⊕`); 1 (zero functor) | Both directions retain; the rewording keeps ECD 23.7's hypotheses (ECD lines 6024–6029). |
| Quotients by non-free actions (1056) | `K` trivial; `K = ℤ/2` acting trivially, `Λ = 𝔽₅`; `K = ℤ/ℓ`, `Λ = 𝔽_ℓ` | `q = id`, `f/K = f`; image of `K × Y′` is the diagonal, `Y′/K = Y′`, `∫ 1 dμ = 1`; order `ℓ = 0` in `Λ` | `Rf^! = Rf^!`; `Rf^! = id^* Rf^!` with scalar 1 (unnormalised measure would give 2); excluded by the pro-order hypothesis | Retain; hypotheses and conclusion agree with ECD lines 6457–6468 plus the stated `ℓ`-power-torsion hypothesis. |
| Huber bound contract (94) | `n = 0`, smooth curve over `Spa(C, C⁺)`; `n = 0`, `dim.tr f = 0` | `n + 2 dim.tr f = 2`; 0 | `H²_c` of the disc is `Λ(−1) ≠ 0`, `H³_c = 0`; finite map exact | Retain; only the page number changed. |

The rows for the statements the diff does not touch stand as in the previous review, of `f893965`.

- Source locators checked against the text: 5 (ECD Theorem 22.5 and proof, lines 5356–5407, printed pp. 130–131; Remark 21.14, line 5158; Lemma 21.13, line 5156; Proposition 23.7, line 6024, p. 144; Proposition 24.3, line 6457, p. 155). The seeded target “The `3·dim.trg` bound” is the one that falls in the changed text; it matches.
- Cross-roadmap citations resolved at the supplier's open head: `DiamondEtaleCohomology` §C0.19 (line 581: vanishing of `Hⁱ(U_ét, F)` for quasicompact open `U`), §C8.16 (line 2370), §C8.21 (line 2440), §C8.22 (line 2448, locally spatial diamonds); `ClassicalAdicEtaleCohomology` §8.4 (line 4389, citing Proposition 5.5.8).
- Links: all seven anchors of the table in “How to read the build” resolve to headings at this head, including the two renamed layers S4 and S5; the old heading texts occur nowhere else in the README, and the overlap check lists no roadmap citing them.
- Pull request text: the title, the three paragraphs of the summary block and the first prose paragraph were each read against the README (Summary, Scope, Conventions, line 482 on quasiseparated bases, Downstream consumers); only R01 differs from the head.
- Gate, re-run at this head: every scanner and the dependency check pass (`set_option=0 … source-material=0 OK`). Dependency check: `depcheck: 245 roadmaps, 2215 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. No file changed outside the roadmap folder.
- Lean: `Suggested.lean` and the manifest are unchanged since `f893965` (empty diff), where the file elaborated with exit 0; it has one `import Mathlib`, a module docstring and an empty namespace, so the `#check` comparison and the one-tactic probe have nothing to act on. The build at this head could not be run here: see Not verifiable.
- Remark (untouched text, no change asked): README line 3 says the roadmap is written “following” ECD §§22–25, and the Scope section says it “owns the material of ECD §§22–25”.
- Overlap check: read DiamondEtaleCohomology this round (the only closest roadmap the changed text cites; it owns `dim.trg`, §C0.19 and §C8.21–C8.22, cited here and not restated); the other closest roadmaps were not reread, since the diff adds no object and the overlap facts list no pull request changing this roadmap and no dropped id; nothing shared.
- Source independence: changed passages only; 4 passages compared with 1 source (ECD lines 5158–5161, 5365, 6024–6029, 6457–6468), none shared beyond forced terms (longest common run 4 words, “strictly totally disconnected” and “0-truncated and qcqs”); largest share ECD, 118 of 144 locators; contents not compared again, the diff renames two layers and adds, removes or reorders none.

## Not verifiable

- The targeted build and the direct elaboration of `Suggested.lean` at this head: on this worker the worktree's package directory link points to a cache that no longer exists, so `lake` stops with “already exists (error code: 17)” before reading any Lean file. This is the worker's environment, not the pull request; the two lines of the worker's gate report under `build` are this same error.
- **Hub96**, Proposition 5.5.8: paywalled, as in the previous review; the page number is now omitted and the statement is read from `ClassicalAdicEtaleCohomology` §8.4.

## Source issues

- **Gap** in ECD at the proof of Theorem 22.5, printed p. 130: the source says `j_*` is exact by Remark 21.14, which follows a lemma on locally spatial diamonds, while the compactification is not known to be locally spatial; it should add the base change to a strictly totally disconnected cover; affects the proof.

## For the human reviewers

- **Licence.** The source with the largest share of the locators (ECD, 118 of 144) is cited from arXiv:1709.07343v4, described in the References as “to appear in Astérisque”; [KW] is cited as an arXiv preprint only.
- **Not tested.** The build of `TauCetiRoadmap.DiamondSixOperations.Suggested` did not run on this worker at this head (missing package cache); the file is byte-identical to the one that built at `f893965`.
