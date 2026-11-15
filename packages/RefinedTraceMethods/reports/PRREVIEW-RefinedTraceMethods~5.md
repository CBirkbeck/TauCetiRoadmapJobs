# Review of RefinedTraceMethods (pull request #1493 at 8bad9df)

**Verdict:** needs changes

Incremental re-review of 2 changed lines since b0ad346 (one reworded proof route in `TauCetiRoadmap/RefinedTraceMethods/README.md`), plus the first check of the pull request's title and description against the head. The folder's files raise no finding; both findings are about the description.

## R01 (P3) — Description names a use ChromaticHomotopyTheory does not make

**Location** Pull request description, summary block: "ChromaticHomotopyTheory the parametrized Tate constructions and K(1)-local sphere".

**Claim** The head contradicts this sentence: the README's Downstream consumers paragraph was corrected at b0ad346 and the description was not.

**Witness** `TauCetiRoadmap/RefinedTraceMethods/README.md:4141` lists §6.8 and §§2.6, 2.9, 2.10, 4.9, 4.11. ChromaticHomotopyTheory (open, README lines 23, 25, 345) cites §§2.6, 2.9–2.10, 4.9, 4.11, 4.17, 6.8; never §2.4; "parametrized Tate" occurs 0 times.

**Repair** Replace the clause by: "ChromaticHomotopyTheory the K(1)-localization formula of §6.8 and the THH, TC, K-theory and trace carriers of §§2.6, 2.9, 2.10, 4.9 and 4.11 (with the Dundas–Goodwillie–McCarthy theorem of §4.17)".

## R02 (P3) — Description does not say that `Suggested.lean` states nothing

**Location** Pull request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim** A reader infers an acceptance test with statements. The file declares nothing, so there is no `sorry` either; the description leaves this unstated.

**Witness** `TauCetiRoadmap/RefinedTraceMethods/Suggested.lean:8` ("None of the following headline theorems is statable at these pins"); lines 31–33 are an empty namespace. `lake env lean` on it: exit 0, no output, no warning.

**Repair** Write: "`Suggested.lean` declares nothing: no headline theorem is statable at the pinned Mathlib and Tau Ceti, and its module docstring names each headline with the carriers it lacks; every target is in the README." and "Validation: the targeted Lake build succeeds with no warning (the file has no declaration); …".

## Previous findings

- none: the previous report (at b0ad346) raised no finding.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result/change |
|---|---|---|---|
| §6.10 framed comparison, reworded proof route (README:3195): the two edges of the bicomplex | S = A[x], d = 1, n = 0; d = 0 | (0,j) term `fil^{i−j}q-D̂^0 ⊗_P Ω^j_{P/A}` with `q-D^0` = S[[h]]: j=0 gives `h^{max(i,0)}A[x][[h]]`, j=1 gives `h^{max(i−1,0)}A[x][[h]]dx`; equals `fil^i_{q-Hdg,□}` and the first Check. d=0: only j=0, both sides S[[h]]. | Pass; edge n=0 is the coordinate filtration, edge j=0 is `fil^⋆q-D̂^•`. |
| Same route: acyclicity in form degree j=1 | d = 1, n = 0, 1; Stacks pattern | Ω¹ of `P^n` over A is free on `dx^{(r)}`, r=1..n+1: rank 1, 2. Stacks module `M_n = ⊕_{i=0..n} A_n e_i`: rank 1, 2, same cosimplicial maps on indices. | Pass; stacks lines 1728–1735 give identity homotopic to 0. |
| Same route: filtration shift under `∇_q` | δ⁽²⁾ = (x−y)(x−qy)/(1+q) | `∇_{q,x}δ⁽²⁾` = x−y = δ⁽¹⁾, filtration 2 → 1; `∇_{q,y}δ⁽²⁾` = −(x−qy), filtration 1. So `fil^⋆ → fil^{⋆−1}⊗Ω¹`, as indexed. | Pass. |
| Same route: form-direction comparison in Čech degree 1 | S = A[x], modulo h | PD envelope D of (x₁−x₂) in A[x₁,x₂]: D → D dx₁⊕D dx₂ → D dx₁dx₂ against A[x] → A[x]dx; divided-power Poincaré lemma in x₁−x₂, γ_e ↦ γ_{e−1}. | Pass; agrees with w lines 3867–3869. |
| Logical shape of the rewording against the previous text and the source | rows j>0 acyclic; columns ≃ column 0 | Old text: "column n=0 quasi-isomorphic to totalisation of row j=0". New: "totalisation of the edge j=0 ≃ the edge n=0". Source w lines 3867–3872: same two facts, same conclusion. | Pass; no step added or dropped. |

The rows for untouched statements stand as in the previous review, of b0ad346.

- Source locators checked against the text: 4 (w lines 3852–3872, proof of Theorem 6.10; w lines 1123–1125, Proposition 3.11; stacks lines 1728–1735, Example 60.19.1, Tag 07L7; bs line 4378, Theorem 16.22).
- Cross-roadmap citations resolved: HabiroCohomologyFoundations §1.17 and §1.14 at its open head (README lines 624, 588); the passage's own references to §6.4 (README:2736), §6.7 (README:2895) and the two §6.10 targets (README:3140, 3166) exist with the cited titles.
- Seeded sample: none of the 15 targets falls in the changed passage (§6.10); no locator in it is flagged unverified.
- Gate rerun on 8bad9df: every counter 0, `OK`, including the targeted build. Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/RefinedTraceMethods/Suggested.lean`, exit 0, no output. The file is unchanged and has no declaration, so there is no binder comparison or one-tactic probe to run.
- No file changed outside the folder (the outside-folder diff against origin/main is empty). Overlap report: no other pull request changes this roadmap, no dropped or revision-only id.
- Description otherwise checked against the head: the three-file folder, the end comparisons of the summary (framed comparison in every relative dimension and at 2, Habiro–Hodge from cyclonic KU, associative and henselian Beilinson squares), and the GeneralAlgebraicKTheoryPartII and HabiroCohomologyFoundationsPartII consumer clauses agree with README lines 3, 7, 4141–4143.
- Remark (no change asked): HabiroCohomologyFoundations §1.17, cited for the Poincaré lemma, states it as the totalisation of PD envelopes of a Čech nerve; the citation is carried unchanged from the text reviewed at b0ad346.

Overlap check: read HabiroCohomologyFoundationsPartII, HabiroCohomologyFoundations, GeneralAlgebraicKTheoryPartII (ownership as established at b0ad346; the change touches no owned object); nothing shared.

Source independence: changed passages only; 1 passage compared with 3 sources (w, stacks, bs), none shared (longest common run with w lines 3852–3872 is 5 words, a standard name); largest share w, 66 of 318 locators; contents not compared again, the diff adds, removes or reorders no layer.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- **Scope/Licence.** The source with the largest share of locators, `w` (66 of 318), is an arXiv preprint (v1, 2025), and the framed comparison of §6.10 rests on its Theorem 6.10; `d-thesis` is a 2025 Ph.D. thesis.
