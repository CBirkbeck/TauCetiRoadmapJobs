# Review of BaseChangeAndGaloisRepresentationsForUnitaryGroups (pull request #2890 at fd447f4)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BaseChangeAndGaloisRepresentationsForUnitaryGroups/`
**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 2 lines changed since `02705f8`, and no finding remains. The changed sentence of 6.3a now says that the trivial character is a splitting character when `κ` is even and every `m_v = 0`, which is correct and agrees with the Check and the Examples of Layer 6. There is one small correction, on the family index (the file paths the roadmaps give sit under `src/` at the commit it points to), and no format note. The two questions for the human reviewers (scope, licence) stand.

## C01 — The family index sends the reader to the first commit of the repository, where the paths the roadmaps give do not resolve as written

The new sentence of `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md` (line 18) reads "The files the roadmaps of this family name are files of the source as published, so they are to be looked up at that first commit." At that commit the repository's top level holds only `src/` and the Lake files, and the Lean tree is inside `src/`. The path 6.3a gives, `Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/ThetaParseval/IdeleNormCharacters/AbsFactsAlt.lean`, returns "not found" at that commit as written and opens with `src/` in front (it declares `ChrEx` in `UpperTheory.Gal.TP.Chr`, as the README says). A reader who follows the index literally finds nothing.

It would be enough to add to that sentence that the paths are relative to the directory `src/` of that commit.

## Previous findings

- The previous report, of `02705f8`, has no finding, small correction or format note; there is nothing to account for.

## Verified sound

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| 6.3a, "for `κ` even and every `m_v = 0` the trivial character is one of them" | `κ = 0`, all `m_v = 0`, `χ = 1` | restriction `1 = η⁰`; component `(z/|z|)⁰ = 1`; unramified everywhere | `χ = 1` satisfies all three bullets |
| same, the case the old sentence got wrong | `κ = 2`, some `m_v = 2`, `χ = 1` | required component `(z/|z|)²` is `−1` at `z = i`; `χ_v(i) = 1` | trivial character is not one; the new condition excludes it |
| same, `κ` odd | `κ = 1`, `χ = 1` | restriction `1`, required `η ≠ 1` | excluded, as the Check says |
| same, no real place of `F` complex in `E` | `F` imaginary quadratic, `κ` even | condition on `m_v` empty; `χ = 1` restricts to `η^κ = 1` | holds vacuously in `m_v` |
| 6.3a against its Check and the Examples | Check 2 (line 85), Examples (line 90) | both: "`κ` even allows `χ = 1` with every `m_v = 0`" | the statement, the Check and the Examples now agree |
| parity sentence of 6.3a | `x = −1 ∈ ℝ^×` | `(x/|x|)^{m_v} = (−1)^{m_v}`, `sgn^κ(−1) = (−1)^κ` | `m_v ≡ κ (mod 2)` necessary; consistent with `m_v = 0`, `κ` even |

The rows for untouched statements stand as in the previous review, of `02705f8`.

- Source locators checked against the text: 1 in the changed passage's target (the file of `ChrEx`, opened at the first commit of the formal proof's repository under `src/`; it exists and declares `ChrEx` in `UpperTheory.Gal.TP.Chr`). The changed sentence itself is this roadmap's own statement (`κ` even) and carries no locator.
- Family index (changed outside the folder, the pull request's own): its new sentences on the repository were checked against the repository's front page: it says the submission belongs to its author, was published without a licence, is mirrored for verification only, and is unmodified at commit `40e56bab`; all as the index states. The index's entry for this roadmap is unchanged.
- Library declarations opened at the pin: none needed; `Suggested.lean` is unchanged and declares nothing.
- Cross-roadmap citations resolved: none in the changed sentence; the citations of 6.3a (EndoscopicTransferAndUnitaryTraceComparison §6.3, GlobalNumberFields Layers 8–10, VonNeumannAlgebras Layer 11, ClassFieldTheory Layer 11) are untouched.
- Seeded sample: of its targets only 6.3a falls in the changed passage; checked above. The others are untouched.
- Dependency check: `depcheck: 139 roadmaps, 1559 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output; single `import Mathlib`, no declaration, no `sorry`, no `set_option`. No signature to compare and no one-tactic probe to run. The automatic checks all passed.
- Pull request text: read against this head; no sentence is contradicted and the change (one clause of 6.3a, the index's paragraph on the repository) alters nothing the title or description states. Nothing outside the folder and the family index changed.

Overlap check: read RowTowerAndRallisIdentities, IgusaVarietiesAndTorsionConcentrationPartII, ModularityAndLanglandsExtensionsPartII (open) and AutomorphicGaloisRepresentationsPartII, EndoscopicTransferAndUnitaryTraceComparison, PotentialAutomorphyInfrastructurePartII (main) as scoped in the earlier reviews; the change moves no ownership. Shared objects and owners as before: the properties of the trace-defined correspondence, EndoscopicTransferAndUnitaryTraceComparison §§10.20–10.30; the away-prime and coefficient-prime comparisons, AutomorphicGaloisRepresentationsPartII AG2.5–AG2.7; Galois representations on the group of PotentialAutomorphyInfrastructurePartII §3.1, its §3.6; splitting characters for a general quadratic extension, this roadmap (6.3a), with the imaginary quadratic case at EndoscopicTransferAndUnitaryTraceComparison §6.3.

Source independence: changed passages only: 2 passages (the clause of 6.3a; the index's paragraph on the repository) compared with 1 source, the front page of the formal proof's repository: the clause is the roadmap's own mathematics, the paragraph reports the repository's notice in its own words, none shared; largest share [FormalProof], as in the previous report; the arrangement was not compared again (no layer added, removed or reordered). Kudla 1994, Harris–Kudla–Sweet 1996 and Labesse 2011 could not be read.

Research link: Layer 10 is the explicit depth-zero local Langlands correspondence (Henniart 1992; Bushnell–Henniart 2005) with Kottwitz's 1986 matching extended to functions from the residue field; Layers 14–16 apply Caraiani's and Labesse's (2011) results to definite unitary groups. Rests on the README; the family index says the family follows an unpublished formal proof.

## Not verifiable

- Kudla 1994 §1 (6.3a): paywalled; the citation resolves to the publisher only.
- Harris–Kudla–Sweet 1996 §1 (6.3a): the publisher's host is not one the sources service reads.
- The hypotheses of the formal `ChrEx` were read only through a summary of the file, not line by line; nothing in this report rests on them.
- The items of the previous report outside the changed passage (Labesse 2011, the published numbering of Caraiani–Scholze, the six steps of 13.8a not given, the host record) stand as they were.

## Source issues

- none

## For the human reviewers

- Scope: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`) says the family follows a formal Lean proof of the Riemann hypothesis announced on 20 November 2026; I found no refereed source for it. Targets 10.33c, 10.33d, 13.8a and 15.1 cite no literature besides it.
- Licence: the README cites file paths and declaration names of that proof's public repository, which says it was published without a licence (the family index now states this); the README reproduces no code, only names and prose descriptions of statements.
