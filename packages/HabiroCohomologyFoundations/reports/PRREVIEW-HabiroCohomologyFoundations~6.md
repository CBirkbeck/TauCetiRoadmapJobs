# Review of HabiroCohomologyFoundations (pull request #1428 at 410d536)

**Verdict:** accepted

Incremental re-review of 4 changed lines since `4aebbac` (the two pin hashes in `TauCetiRoadmap/HabiroCohomologyFoundations/README.md:55–56`), plus the pull request's title and description read against this head. No finding.

## Previous findings

- R01 — repaired: the description's "Dependencies" paragraph now reads "In addition, the README's Exact supplier contracts declare seven supplier gaps: required extensions that their suppliers do not state yet, on which the targets that use them are conditional", and names all seven slugs.

## Verified sound

The diff changes no statement; the rows are for the statements that depend on the changed passage (the pins and the library declarations the passage names) and for the description's repaired sentences.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| README lines 54–56: "Mathlib at `1b1ccf4b…`, with Tau Ceti at `2fd255d9…`" | `lake-manifest.json`; the checked-out packages | manifest: mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, TauCeti `2fd255d997f47c0b5d834ee416c7015d55444ce5`; both package checkouts are at these commits; old hashes occur nowhere in the folder | Agrees | none |
| `cyclotomic_prime_decomposition` (§8.2; `Suggested.lean:91`), which rests on `Polynomial.cyclotomic_prime` named in the changed passage | p = 2, 3; general p at q = 1 | p=2: `q+1 = 2·1 + (q−1)`, u=1. p=3: `Φ₃ − (q−1)² = 3q`, u=q, u(1)=1. General: `Φ_p ≡ (q−1)^(p−1)` mod p; at 1, `p = p·u(1) + 0` since p−1 ≥ 1 | True at the new pin; elaborates | none |
| README lines 81–85: `TauCeti.torusCharacter` and its three laws "at the pin" | new Tau Ceti pin | `TauCeti/LinearAlgebra/Basis/DiagonalTorus/Basic.lean:102` `torusCharacter s μ = ∏ j, s j ^ μ j`; `_add` :132, `_neg` :153, `_zsmul` :163. At `s j = q^{a_j}`: `q^{Σ a_j μ_j}` | Agrees | none |
| README lines 61–78: Mathlib names of the passage | new Mathlib pin | `cyclotomic_prime` Cyclotomic/Basic.lean:364 (`[Fact p.Prime]`), `cyclotomic_prime_mul_X_sub_one` :372, `eval_one_cyclotomic_prime` Cyclotomic/Eval.lean:32, `geom_sum_mul` Algebra/Ring/GeomSum.lean:233, `geom_sum_succ` :36, `one_geom_sum` :60, `DividedPowerAlgebra.dp_mul` DividedPowerAlgebra/Init.lean:172, `fontaineTheta_teichmuller` Perfectoid/FontaineTheta.lean:183, `IsAdicComplete` AdicCompletion/Basic.lean:57 | All present | none |
| Description: seven gaps "extend CrystallineCohomology CR.4 …, PrismaticCohomologyPartII §§3.13–3.16 …, AInfCohomology AI.1 … and EnhancedDerivedSheaves E0 and E5" | README lines 237–251; EnhancedDerivedSheaves on main | README: 7 `gap:` contracts with the same slugs and suppliers (1 + 1 + 1 + 4); extensions of CR.4, §§3.13–3.16, AI.1, E0.4–E0.5, E5:abstract, E5:animation.4; main has E0.4 (line 211), E0.5 (242), E5:animation.4 (1994) | Agrees | none |
| Description: "the open CrystallineCohomologyPartII treats Witt vector cohomology of singular varieties, not this factorization" | that roadmap's open head | title "Part II: Witt vector cohomology of singular varieties"; 0 occurrences of "restriction-free" or `qW_` in its README | Agrees | none |
| Description: "adds" a roadmap of three files; "the outside-folder diff has 0 path(s)"; three `sorry` declarations | head against `origin/main` | folder absent on main; 3 files, 2625 insertions, 0 deletions; three-dot diff outside the folder: 0 paths; `sorry` warnings at `Suggested.lean` lines 65, 76, 91 | Agrees | none |

The rows of the earlier reports for the remaining statements stand as in the previous review, of `4aebbac`.

- Pull request text: title, summary block and 5 prose paragraphs read against the head; 0 sentences contradicted; no section, headline, declaration or supplier removed or renumbered that the text would have to state (0 headings removed, 0 declarations removed).
- Library declarations opened at the new pins: 13 (files and lines above), plus `AddMonoidAlgebra.lift` (`Mathlib/Algebra/MonoidAlgebra/Basic.lean:594`), `Algebra.Etale` (`Mathlib/RingTheory/Etale/Basic.lean:205`), `Algebra.Smooth` (`Mathlib/RingTheory/Smooth/Basic.lean:539`); every `Mathlib/…` and `TauCeti/…` file path the README names exists at the pins.
- Gate at this head, rerun: every scanner 0, `depcheck=0`, `stray-files=0`, `outside-folder=0`, OK. Dependency check output: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD or CYCLE line. Merge order: this roadmap follows QWittVectors, its last supplier.
- Elaboration of `TauCetiRoadmap/HabiroCohomologyFoundations/Suggested.lean` with `lake env lean` at the new pins: three `declaration uses sorry` warnings (lines 65, 76, 91), nothing else. The four elaborated signatures agree with README §§1.23 and 8.2; no binder lost.
- Cross-roadmap citations: the citation check lists none unresolved; overlaps list no dropped id, no second copy and no other pull request changing this folder.
- Declared gaps: the seven slugs of README lines 239–251 are the seven declared for this roadmap, each with a named supplier; none is raised. Acceptance is conditional on them.
- Seeded sample: none of its targets falls in the changed passage (README lines 55–56); not re-read.
- Remark, no change asked: the summary block's "The route follows Wagner's q-Hodge complexes over the Habiro ring" describes the mathematical route; the README does not say it follows a source, and its layer order is not QH's section order.

Overlap check: read HabiroCohomologyFoundationsPartII, QWittVectors, PrismaticCohomologyPartII, RefinedTraceMethods, HabiroRings (open) and EnhancedDerivedSheaves (main); nothing shared. The change touches no ownership statement; owners stand as in the review of `4aebbac`.

Source independence: changed passages only — 1 passage compared (two commit hashes, no prose from any source) with 0 sources, none shared; largest share QH, about 146 of 211 locators (pattern count); contents not compared again, since no layer was added, removed or reordered.

## Not verifiable

- The description's "AI assistance" sentence (the counts of review and red-team rounds): a statement about the job board's history, not about the head.
- The description's "the toolchain's advice to adopt the module system" among the build warnings: the gate's build passes, but its warning text was not shown to this review; direct elaboration shows the three `sorry` warnings only.
- The description's generated blocks (`depends-on`, `merge-order`, the metadata comment): outside this check.

## Source issues

No locator was opened in this round. The entries of the earlier reviews are written again unchanged:

- **Misprint** in QH at Convention 3.1, printed p.20: the source says the filtered quotient for general m is base change to A; it should be base change to A[q]/(q^m−1), agreeing with its displayed cofiber formula; affects a stated result.
- **Misprint** in QH at Corollary 3.25, printed p.34: the source says the exponent may be zero while using the preceding prime-power index; it should require exponent at least one; affects a stated result.
- **Misprint** in QH at Lemma 4.2(a), printed p.54: the source says truncation retaining degrees through n is left adjoint to zero extension; it should be right adjoint; affects a stated result.
- **Misprint** in QH at Paragraph 3.14, printed p.29: the source says the local prismatic input is untwisted completed S with ζ_p adjoined; it should use the Adams-Frobenius twist, as in Theorem A.1(b); affects the proof.
- **Error** in QH at Paragraph 4.12, printed p.58: the source says the admissible edges define a sub-infinity-operad; it should use partial admissible simplicial data or a composition-closed replacement; affects a stated result.
- **Error** in TC at Paragraph 3.5 and Lemma 3.7, printed pp.31–32: the source says global uncompleted derived q-de Rham has zero rationalization and is already p-complete; it should retain the constant rational corner ℚ[[q−1]] and arithmetic gluing; affects a stated result.

## For the human reviewers

- **Scope.** About 146 of 211 README locators cite QH, a 2025 arXiv preprint (2510.04782v2) by one author; QW, TC and KU are 2024–2025 arXiv preprints by the same author (TC with a coauthor). Refereed publication was not checked.
- **Scope.** Layer 6 states an open analytic comparison problem; its only source, Sch25, is a 2025 lecture course in an institutional archive (README References, last entry), which the README says neither defines nor proves the analytic inputs.
- **Licence.** DAG VIII is cited from the author's page (README References) and is not a published text; Sch25 is an unpublished lecture-course record.
- **Conditional acceptance.** Groups of targets are conditional on seven declared supplier gaps (README lines 237–253) whose Part II suppliers do not exist yet.
