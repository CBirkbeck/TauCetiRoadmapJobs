# Review of HabiroCohomologyFoundations (pull request #1428 at 4aebbac)

**Verdict:** needs changes

Incremental re-review: the folder is unchanged since the review of `4aebbac` (0 lines); this round reads the pull request's title and description against the head. One P3 finding, in the description only; no file of the folder needs a change.

## R01 (P3) — The description omits the seven declared supplier gaps and says nothing else is a prerequisite

**Location:** pull request description, the paragraph beginning "Dependencies": "The open pull requests that must merge first are in the merge order below. Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** The head contradicts this. The README names seven required supplier extensions that no roadmap on main or in the merge order states, and makes its affected targets conditional on them. A reader of the description cannot learn that.

**Witness:** `TauCetiRoadmap/HabiroCohomologyFoundations/README.md:237`: "The following are required extensions, not assertions that the base roadmaps already state these interfaces. … the affected targets below are conditional on these contracts." Lines 239–251 list seven `gap:` contracts.

**Repair:** Replace the quoted two sentences of the description with:

> The open pull requests that must merge first are in the merge order below. Roadmaps on main are cited by name. In addition, the README (Exact supplier contracts) declares seven supplier gaps: required extensions that their suppliers do not state yet, on which the targets that use them are conditional. They are CrystallineCohomology Part II (`gap:relative-witt-factorization`), a further extension of PrismaticCohomologyPartII (`gap:finite-projective-nygaard`), AInfCohomology Part II (`gap:finite-projective-filtered-decalage`) and EnhancedDerivedSheaves Part II (`gap:unbounded-derived-commutative`, `gap:filtered-graded-derived-commutative`, `gap:fully-faithful-pushout`, `gap:oplax-dual-fibration`). Everything else named in the README is a consumer, not a prerequisite.

## Previous findings

- none: the previous report, of `4aebbac`, accepted with no numbered finding; the folder has not changed since, so there is no repair to check.

## Verified sound

The diff changes no statement; the rows are for the statements the description's prose cites or relies on (the Lean it calls "statable against the pinned Mathlib and Tau Ceti").

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `cyclotomic_prime_decomposition` (§8.2; `Suggested.lean:91`) | p = 2, 3, 5; evaluation at q = 1 for general p | p=2: `q+1 = 2·1 + (q−1)`, u=1. p=3: `Φ₃ − (q−1)² = 3q`, u=q. p=5: `Φ₅ − (q−1)⁴ = 5(q³−q²+q)`, u(1)=1. General: `Φ_p(1)=p=p·u(1)+0` as p−1 ≥ 1 | True; u(1)=1 forced in ℤ | none |
| `torusScaleHom_action` (§1.23; `Suggested.lean:65`) | a=0; a+b on a monomial; d=0; zero ring | a=0: exponent sum 0, `q⁰=1`, identity. a+b: `q^⟨a+b,m⟩ = q^⟨a,m⟩·q^⟨b,m⟩` by `zpow_add` on units. d=0: empty sum, identity on B | True | none |
| `torusScale_exists_unique` (§1.23; `Suggested.lean:76`) | q=1; q=−1, d=1, a=1; d=0; zero ring | q=1: e=id. q=−1: `T ↦ −T`, inverse itself. Inverse in general is scaling by −a; monomials span, so e is determined. d=0: only id on B | True; unit q needed for negative m, and present (`q : Bˣ`) | none |
| Description: "`TauCeti.torusCharacter` [is] reused" | pinned Tau Ceti | `TauCeti/LinearAlgebra/Basis/DiagonalTorus/Basic.lean:102` `torusCharacter s μ = ∏ j, s j ^ μ j`; `_add` :132, `_neg` :153, `_zsmul` :163. At `s j = q^{a_j}` the value is `q^{Σ a_j μ_j}`, the exponent of `torusScaleHom` | Agrees with README lines 87–88, 147 | none |
| Description: consumers RefinedTraceMethods, HabiroCohomologyFoundationsPartII, HabiroRings, HabiroNumberFields | README "Downstream consumers" (line 2488 onwards); the four roadmaps' open heads | README names all four as consumers of §§0.3, 4.21, 4.28, 5.26 and Layer 5; HabiroRings line 14, RefinedTraceMethods line 70, PartII line 21 import these sections; none is cited as a supplier | Agrees | none |
| Description: "Over a Λ-ring torsion-free at every prime … perfectly covered base" | README lines 99–100, 556 | HQ.1–HQ.2 assume A torsion-free at every prime; HQ.3 onward assume A perfectly covered; `qΩ_{S/A}` defined as the stated pullback | Agrees | none |

The rows of the previous report for the remaining statements stand as in the previous review, of `4aebbac`.

- Pull request text: title and 5 prose paragraphs plus the summary block read against the head; 1 sentence contradicted (R01); the rest agree with README lines 3–20, 99–100, 147, 237–253, 556, 2488–2506 and the three files of the folder.
- The change against the base: the roadmap is not on main (confirmed: no such folder on main); 2 commits, 3 files, 0 paths outside the folder; nothing removed or renumbered, so nothing else for the description to state.
- Gate at this head, rerun: every scanner 0, `depcheck=0`, `outside-folder=0`, OK. Dependency check output: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/HabiroCohomologyFoundations/Suggested.lean` with `lake env lean`: three `declaration uses sorry` warnings (lines 65, 76, 91), nothing else. The four elaborated signatures were compared with README §§1.23 and 8.2: no binder lost.
- Library declarations opened at the pin: 4 (`torusCharacter` and its three laws, file and lines above). Name collisions: `torusScaleHom`, `torusScale_exists_unique`, `cyclotomic_prime_decomposition` occur in no other roadmap's Lean, open or on main.
- Declared gaps: the seven slugs of the README (lines 239–251) are the seven of this review's brief, each with a named supplier; none is raised.
- Remark, no change asked: the summary block's "The route follows Wagner's q-Hodge complexes over the Habiro ring" describes the mathematical route; the README does not say it follows a source and its layer order (0–8) is not QH's section order (§2, §3, §4, App. A, App. B).

Overlap check: read HabiroCohomologyFoundationsPartII, QWittVectors, PrismaticCohomologyPartII, RefinedTraceMethods, HabiroRings (open) and EnhancedDerivedSheaves (main); nothing shared. Owners as each side states them: Habiro-complete modules, finite cyclotomic descent and enhanced étale coefficient lifts — this roadmap, Layer 0 (HabiroRings line 14 agrees); ordinary marked étale deformations and ordinary presentations — HabiroRings; relative q-Witt and Λ-ring theory — QWittVectors; single-prime q-crystalline theory — PrismaticCohomologyPartII §5 (its line 1885 leaves the global gluing here); trace comparisons — RefinedTraceMethods and Part II.

Source independence: changed passages only — the folder's diff is empty, so 0 passages compared with 0 sources; largest share QH, about 146 of 211 locators (pattern count); contents not compared again, since no layer was added, removed or reordered.

## Not verifiable

- The description's "AI assistance" sentence (the count of review and red-team rounds): a statement about the job board's history, not about the head; not checked.
- The description's generated blocks (`depends-on`, `merge-order`, the metadata comment): outside this check.

## Source issues

No locator was opened in this round. The entries of the previous review, of `4aebbac`, are written again unchanged:

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
