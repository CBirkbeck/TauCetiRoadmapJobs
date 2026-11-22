# Review of HeckeIdealsAndTaylorWilesRelations (pull request #2893 at bab51e3)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/HeckeIdealsAndTaylorWilesRelations/`
**Verdict:** accepted

**Summary.** Accepted: this incremental re-review of the 9 lines changed since `57d7134` finds no finding. The three repairs to the README are correct: 9.9 (d₀′) now assumes hypothesis (ii), the descent form in the supplier contracts has a locator that resolves, and the reference names the first commit of the formal proof, at which all 48 cited files exist unchanged. There are two small corrections, both to the description, and no format note; none blocks. The human reviewers still decide on the targets whose only source is the unpublished formal proof, on its licence, and on the review policy the family index states.

## C01 — The family index this pull request carries is not identical to the one the other pull requests of the family carry

The description says "The family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, `Suggested.lean`, `metadata.toml`) is carried, with identical content, by every pull request of the family". At this head the index `README.md` differs from the copies at the heads of #2954, #2889 and #2892 in two sentences (lines 10–12 and 19): here "The family follows the formal Lean proof, by Levent Alpöge", there "The results that the family states are those of the formal Lean proof"; and their line 19 adds that the reference in each roadmap names the first commit. It differs from the copy at the head of #2890 as well, in line 19 and in one entry of the list (lines 150–152).

Copying the index of #2954 into this branch makes the sentence true again, and replaces "follows the formal Lean proof", which reads as the roadmaps following a source, by the wording about results. Otherwise drop "with identical content".

## C02 — The description does not say that the family's aggregate pull request also carries this folder

A reader of the description learns of the chain #2889 → #2890 → this pull request, and not that #2954 carries the whole family, this folder included, in one piece. The copy of this folder's `README.md` at the head of #2954 is identical to this head, so nothing conflicts today, but two open pull requests add the same folder and the description states no order between them. A sentence in the Dependencies paragraph would do, for example: "#2954 carries this folder as well, following the head of this pull request, and merges the family in one piece."

## Questions for the author

- 3.13a says that (1), (a)–(e) and (g) are statements of the formal proof "in the form given here", that is without `μ_l ⊄ L` (line 124). The bundles asserting the existence of `J` with these properties (`UpperTheory.V.W.HidaUAlt`, and `ModUAlt` in `PointTheoremBaseObject.lean`) assume that `L` has no primitive `l`-th root of unity. Is the same true of (b)–(e) and (g) through the declarations cited at lines 124–154? Not traced declaration by declaration. (Carried over; the change does not touch it.)
- `UpperTheory.V.Hi.level_of_is_j_unitary_hecke_data` takes the bundle `UpperTheory.V.Af.HypothesesH'` as its first argument. Are all its fields discharged in the formal proof, so that "(L) is a theorem of [FormalProof]" (line 360) holds without residual hypotheses? Only the statement was read. (Carried over.)

## Previous findings

The previous report, of `57d7134`, had no finding and four small corrections:

- C01 — repaired: "Let `ρ` be as in (d₀), with the flags and hypotheses (i) and (ii)" (line 509); the sentence after (d₀′) lists (ii) among the hypotheses of both statements, as before.
- C02 — repaired: the bullet for §3.5 (1) now ends with `…/CuspidalDescent/DescWeak.lean` (`UpperTheory.V.Z.Desc.DescWeak`), "proved as `UpperTheory.V.Z.Tf.SR.descWeak` in `…/TraceFormula/SplitRigidity/HasOfSplit.lean`" (lines 795–797); both resolve.
- C03 — repaired: "the file paths and declaration names cited here are those of its first commit 40e56bab…, the source as published, under its directory `src/`" (line 892), as the family index says.
- C04 — repaired: the description now says "4.2a states the level modules as (L) and derives the patching data from them, and 9.9 derives (d) from the statements (d₀) and (d₀′)", and names (L) and (d₀) as resting on the formal proof alone.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 9.9 (d₀′), with (ii) | `adjointLiftingTheorem_of_locPrints_of_core` and `adL_triv` in `AdLOf.lean` at the first commit; coboundary of `X` with `ρ(g)X ≠ Xρ(g)` | First condition: `adL_triv` uses field `irr` of `AutomorphicPointLocallyGeneric` (line 102), called at line 116; second: `bkOrd` with `H.flag` (line 142). Without (ii) a coboundary is a counterexample | holds as now stated; (iii) not used |
| Descent form, supplier contract §3.5 (1) | `UpperTheory.V.Z.Desc.DescWeak` (`DescWeak.lean`, line 10); `UpperTheory.V.Z.Tf.SR.descWeak` (`HasOfSplit.lean`, line 29) | Formal: CM `E` unramified at every finite place, prime `p`, finite split `S` containing places above `p`, `2 ≤ n ≤ 4`, regular algebraic, `DualIsConj`; unramified at non-split places; Satake parameters cofinitely. README the same | matches; names and namespaces as cited |
| Reference [FormalProof], first commit | all 48 `.lean` paths the README cites | Each exists under `src/` at `40e56bab`; each blob equals the one at `e50d098`, where the previous review read the declarations | resolves; locators unchanged in meaning |
| Description, headline bullets | README overview, lines 3–8 | Hecke ideal: odd `l`, `L/L⁺` unramified, `B → 𝕋` onto, `B/J` finite, torsion-free, reduced; patching: `μ_l ⊄ L`, exponent `n!`; adjoint: `n ∈ {2,3}`, `2 ≤ n ≤ 4`; kernels: same | agree |
| Description, family index "identical content" | index at this head against the heads of #2954, #2889, #2892, #2890 | Differs in lines 10–12 and 19 from the first three; in line 19 and lines 150–152 from #2890 | not identical: C01 |

The rows for the untouched statements stand as in the previous review, of `57d7134`.

- Formal proof (the operator's clone, read at the first commit `40e56bab`): 48 cited paths checked for existence and blob identity with `e50d098`; two declarations of the new locator opened; `adL_triv` and its use reopened.
- Seeded sample: of 3.13a, 4.2a, 9.9 and 10.1, the change touches 9.9 only ((d₀′)); checked as in the table. No locator is flagged as unverified.
- Cross-roadmap citations in the changed passages: PotentialAutomorphyInfrastructurePartII §3.5 (1), on main; unchanged and resolved in the previous review.
- Dependency check: `depcheck: 133 roadmaps, 1486 edges, 0 problem(s)`; no UPWARD or CYCLE line. Outside the folder the pull request changes only the family index; nothing outside the folder changed since `57d7134`.
- Automatic checks: all passed at this head. `lake env lean` on `Suggested.lean`: exit 0, no output; the file is unchanged and declares nothing (single `import Mathlib`, no `set_option`, no `sorry`), so the `#check @name` comparison and the one-tactic probe had nothing to act on. The four headlines remain not statable, as its docstring says.
- Overlap check: read UniformWildKernelBounds, BernoulliBoundsForClassGroupEigenspaces, BaseChangeAndGaloisRepresentationsForUnitaryGroups, ModularityAndLanglandsExtensionsPartII, CongruenceModulesOfThetaLifts, PotentialAutomorphyInfrastructurePartII, PotentialAutomorphyInfrastructure, GlobalGaloisDeformations (scope as in the previous review; the change adds no object); nothing shared. The copy of this folder in the family's aggregate pull request #2954 is identical to this head (C02).
- Source independence: changed passages only; 3 passages compared with 1 source (FormalProof, Lean statements against prose), none shared; largest share FormalProof, 47 of 59 in-text source citations; arrangement not compared again, since the diff adds, removes or reorders no layer.
- Research link: 9.9 (a)–(c) apply Newton and Thorne's vanishing of adjoint Bloch–Kato Selmer groups (NT23, 2023); 3.13a uses Chenevier's determinants (Che14, 2014) for Hida families at Eisenstein ideals; 3.13a, 4.2a and 9.9 (d) are statements of Alpöge's formal proof (announced 2026). Rests on the README, NT23, Che14 and the Announcement.

## Not verifiable

- That each formal statement compared is proved without residual hypotheses: `descWeak` reduces to `descWeakAll`, whose proof was not followed further; the bundles `HypothesesH'`, `LocPAlt` and `Loc.LocalPublishedTheorems` are as in the previous review.
- The condition under which the Weil–Deligne representation in (L) (iv) must equal `rec^T(π_j)`: the predicate behind it was not opened (unchanged).

## Source issues

- none

## For the human reviewers

- Scope: (L), the two maps at Iwahori level in 4.2a, and 9.9 (d₀) rest only on an unpublished, unrefereed Lean formalization; the announcement says a written account is still to come (Announcement lines 45–49). README lines 360–366, 384–390, 591–598.
- Licence: the family index reports that the formal proof was published without a licence and is mirrored for verification only (family `README.md`, lines 16–18). The README cites its file paths and declaration names only.
- Policy: the family index has a section "When a roadmap is wrong" (family `README.md`, lines 45–75) telling reviewers of later contributions not to block one that corrects a roadmap in agreement with the formal proof.
- Not tested: nothing; the formal proof, which has the largest share of the citations, was read at the declarations the change cites.
