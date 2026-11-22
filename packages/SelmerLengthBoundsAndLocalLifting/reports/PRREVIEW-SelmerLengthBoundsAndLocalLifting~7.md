# Review of SelmerLengthBoundsAndLocalLifting (pull request #2901 at 6c8cd88)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/SelmerLengthBoundsAndLocalLifting/`
**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 21 lines changed since `3dce36e`: the three passages added to 4.10c (3) and 4.10e (3) name declarations of the formal proof that exist at the cited commit and say what the README says (the exponent `2e_W + e_U`, the constant `23`, the range `C ≥ 160`, the count of twenty-nine statements). There are two small corrections, both about the pull request's description, and two format notes; none blocks. The questions left to the human reviewers are unchanged, with one more about the family index.

## C01 — The description's dependency sentence is out of date for both suppliers

The description says "Sub-roadmaps of the family and other roadmaps that are still in open pull requests, among them PadicHodgeRegulators, merge first." PadicHodgeRegulators is on main now (`TauCetiRoadmap/PadicHodgeRegulators/`), and the pull request that carried WachLatticesOverTheCyclotomicTower, #2899, was closed on 22 November 2026 in favour of #2954, which carries the whole family. A reader who follows the description looks for the Wach roadmap in a closed pull request.

The citations themselves are sound: WachLatticesOverTheCyclotomicTower §§6.4 and 6.10 are at the head of #2954, and its §6.10 defines `e_W` and `e_U` as 4.10c uses them. The text that would be right: "PadicHodgeRegulators is on main; WachLatticesOverTheCyclotomicTower is carried by the family's pull request #2954 and merges first."

## C02 — The family's pull request #2954 carries this folder with an earlier 4.10e, and neither description states an order

At its head `abeed69`, #2954 has this folder's README without the two additions this head makes to 4.10e (3): the clause "(every `C ≥ 160` in [FormalProof])" (line 1594) and the sentence naming the assembly declarations (lines 1679–1688). Everything else in the file, and the family index, is identical. Both pull requests add the same file, so they cannot both merge as they stand, and if #2954 merges first as it is these two additions are lost.

Say in the description which of the two carries the folder from now on: either #2954 takes this head's README (and this pull request closes, as #2899 did), or this one merges first and #2954 is rebased on it.

## N01 — Some declarations of the formal proof are still cited by name only, without the file

Carried from the previous review: about fifteen declarations (for example `GlobalTheory.T.wachModule_uniqueness_characterisation` at line 1567) have no path, while the others, including all those added at this head, give it.

## N02 — Two commits are named for the same source

The References entry and the description give commit `8c90877ceaa694974526e0aab9aaaf6ea0f5099e`; the family index, revised in this pull request, says the files "are to be looked up at that first commit" (`40e56bab`). The 46 files of the formal proof that the README names are byte-identical at the two commits, so nothing is wrong; naming one commit in both places would spare a reader the comparison.

## Previous findings

The previous review, of `3dce36e`, had no finding (no R-numbered remark). Its other remarks:

- C01 (4.10c (3) names no declaration) — repaired: line 1080 now gives `LiftingTheory.lean` (`coreLiftA`, with `LiftTheoremCaseA`) for the inclusion and `FrobeniusPowUniformizerFactorisation.lean` (`coreLiftO_holds`) for the bound.
- N01 (declarations cited without their file) — not repaired: written again as N01.
- The question about the commit — settled by reading: the README's paths exist at `8c90877`, with the same content as at the first commit (N02).

## Verified sound

| Statement | Instances tried | Values computed (README / source) | Result | Change |
|---|---|---|---|---|
| 4.10c (3), inclusion | against `coreLiftA`, `ePA`, `eWA`, `eUA`, `aA`; supplier §6.10 | `e = 2e_W + e_U` / `ePA = 2·eWA + eUA`; `e_W = ⌊Hp/(p−1)² + 3 + log_p(H+1)⌋` both; `a_A = ⌊M/(p−1)⌋ + 1` both | holds | none |
| 4.10c (3), bound | against `coreLiftO_holds` (`CA = 23`); `p = 3`, `H = 1`, `M = 0` | `23(2 + H/p + log_p(H+1))` / `23(1 + H/p + (1 + log_p(H+1)))`; `e_W = 4`, `e_U = 1`, `e = 9 ≤ 68.2` | holds | none |
| 4.10e (3), constant | against `thmA_of_claim`, `boundA`; `n = e_K = r = 1`, `h = 1`, `S = η = m = 0`, `p = 3` | `160 ≤ C` in source; generators `≤ 2(ne_K+1)r`, `Y ≤ 80B`, so `160`; `E′ ≤ 18h ≤ C(h+1)`; bound `C·8/3 = 426.7`, chain gives `4·80·4/3 = 426.7` | holds | none |
| 4.10e (3), assembly | against `local_form_of_three_inputs`, `genA`, `liftA`, `killA`, `local_theorem_of_leaf_lemmas`, `integrality_from_metric_of_large_constant`, `localLifting_of_blochKato_tateDuality_eulerChar` | hypotheses counted: `29`, of which `27` enter the third input (12 direct, 15 through the universal part); final statement: `l ≠ 2`, `Good K 1 LL`, `160 ≤ C`, `thmA` | holds | none |
| Headline (4) | against 4.10c (3) at this head | `23(2 + H/p + log_p(H+1))` in both | consistent; not statable | none |

The rows for the untouched statements stand as in the previous review, of `3dce36e`.

- Source locators checked against the text: the 8 declarations and 6 files the diff adds, each opened and its statement read at commit `8c90877`; all 46 paths of the README exist there and equal the first commit's files.
- Library declarations opened at the pins: none new (the diff changes no library citation).
- Cross-roadmap citations resolved: WachLatticesOverTheCyclotomicTower §6.10 (2) and (4) at the head of #2954 (README lines 642–653); PadicHodgeRegulators found on main.
- Dependency check: `depcheck: 136 roadmaps, 1523 edges, 0 problem(s)`.
- Automatic checks: all passed on this head. Elaboration of `Suggested.lean`: no output, exit code 0; it declares nothing, so there is no signature to compare and no one-tactic probe to run.
- The family index, changed outside the folder: its new paragraph on the source and its new section "When a roadmap is wrong" were read; they state no mathematics, and the entry for this roadmap is unchanged.
- The description: checked against this head; C01 and C02.

Overlap check: read WachLatticesOverTheCyclotomicTower, CongruenceModulesOfThetaLifts, LengthBoundsInPadicFamilies, GluedTargetAndDivisionInequality and LocalGainOfThetaChains (open), and PadicHodgeTheory, EulerSystemsAndKolyvaginSystems and PhiGammaModulesAndIwasawaCohomology (main), as in the previous review; nothing shared, and the diff adds no object. The folder itself is also carried by #2954 (C02).

Source independence: changed passages only; 3 passages compared with 1 source ([FormalProof], Lean code), none shared (the additions are file paths, declaration names and counts); largest share [FormalProof], 81 of 85 locators; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: Layer 4 gives explicit lifting exponents for Bloch–Kato finite classes (Bloch–Kato 1990) through Wach lattices (Wach 1996, Berger 2004), the Herr complex (Herr 1998) and prismatic `F`-crystals (Bhatt–Scholze, arXiv:2106.14735); Layers 3 and 4 are steps of Alpöge's formal proof (2026). Rests on the README and on [FormalProof].

## Not verifiable

- Bloch–Kato §3 and Corollary 3.8.4, and BS23-FCRYS Theorem 1.2: not opened this round (untouched by the change).
- The proofs behind the declarations added at this head were not read, only their statements and the chain of names from `local_form_of_three_inputs` to `localLifting_of_blochKato_tateDuality_eulerChar`.

## Source issues

- none

## For the human reviewers

- Scope: 81 of the 85 source locators point to [FormalProof], a Lean formalisation announced on 20 November 2026; no written proof or refereed source states the theorems of Layer 3 or the lifting theorems of 4.10c–4.10g.
- Scope: some cited declarations take published theorems as hypotheses: `GlobalTheory.TheoremTClosing.main` (4.10f), and `GlobalTheory.T.localLifting_of_blochKato_tateDuality_eulerChar`, newly cited in 4.10e (3), which assumes `BlochKatoLocal`, `LocalTateDualityK` and `LocalEulerCharK`.
- Licence: the family index now states that the formal proof "was published without a license" and is mirrored for verification only; the README cites file paths and declaration names, and `Suggested.lean` declares nothing.
- The family index says "The family follows the formal Lean proof"; this folder's own layers are organised by subject.
- The family index gains a section "When a roadmap is wrong" (index lines 45–75) that tells reviewers of implementing pull requests what not to block; whether a roadmap index may set review policy is yours to decide.
