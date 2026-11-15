# Review of PurityOfBranchLocus (pull request #1807 at 89357f3)

**Verdict:** accepted

Incremental re-review of the 51 lines changed since d1900d4. The change is two files, `TauCetiRoadmap/PurityOfBranchLocus/PROGRESS.md` (14 lines) and `TauCetiRoadmap/PurityOfBranchLocus/STATUS.md` (37 lines), brought in by merging main; both are byte-identical to main's (blobs `b11c634c`, `550380cf`). `README.md`, `Suggested.lean`, `metadata.toml` and the pins are unchanged. No finding.

## Previous findings

The previous review (of d1900d4) was an acceptance with no finding; nothing to account for.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §2.2 `etale_of_etaleAt_codimOne` (`Suggested.lean` 92), named in `STATUS.md` as the frontier's global corollary | `Spec ℤ[i] → Spec ℤ`; `(x, y) ↦ (x², y)` on `𝔸²_k`, `2 ≠ 0`; `𝟙_Y`; `Spec 𝔽_p(t^{1/p}) → Spec 𝔽_p(t)` | `ℤ[i]`: not étale; at `(1+i)`, `e = 2`, not formally unramified: false ⇔ false. Squaring: not étale; ramified at `η_{V(x)}`: false ⇔ false. Identity: true ⇔ true. Inseparable: `hgen` false, excluded | sound | none |
| `STATUS.md`: "dominant, locally finite type morphism of integral schemes onto a normal locally Noetherian scheme" has ramification locus = non-étale locus; same sentence as README §2.3 | closed point `Spec k → 𝔸¹_k`; the squaring map | Closed point: `∅ ≠ {pt}`, not dominant, excluded. Squaring: both `V(x)`. Pinned hypotheses: `IsLocallyNoetherian Y`, both integral, `IsDominant`, `LocallyOfFiniteType`, `IsNormalScheme Y` | sound | none |
| `STATUS.md` frontier names against `Suggested.lean` | the six declarations | `exists_etale_of_formallyUnramified_stalk_codimOne`, `etaleAt_of_unramifiedAt_codimOne`, `Algebra.isEtaleAt_of_purity`, `etale_of_etaleAt_codimOne`, both `ringKrullDim_stalk_eq_one_of_maximal_*`: 6 named, 6 declared | sound | none |

The rows for the untouched statements stand as in the previous review, of d1900d4.

- Gate: the worker's gate at 89357f3 passes every check (`build=0`, `stray-files=0`). My run with `--base origin/main` gives 0 everywhere except `outside-folder=24`, all in the folders the pull request owns; `git diff --stat origin/main...HEAD` with the 13 folders excluded is empty.
- Dependency check: `depcheck: 244 roadmaps, 2236 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. No gap is declared.
- Elaboration: `lake env lean TauCetiRoadmap/PurityOfBranchLocus/Suggested.lean` exits 0 with six `declaration uses sorry` warnings (lines 40, 58, 75, 92, 106, 119) and nothing else. No statement changed, so the signature comparison and the padding probe of the previous review stand.
- Library declarations opened at the pin (Tau Ceti `2fd255d99`, unchanged since d1900d4): 1, `Scheme.Hom.ramificationLocus_eq_nonEtaleLocus` (`TauCeti/AlgebraicGeometry/Morphisms/RamificationLocus.lean` 197–199).
- Source locators checked (the seeded sample; statements untouched): 2. §2.1 against `stacks-0BMB` lines 2524–2533 (Lemma 21.4 of the chapter, five hypotheses, conclusion étale at `x`); §2.2 and §2.3 against `sga1` lines 8355–8364 (printed p. 212, Théorème 3.1: quasi-finite dominant, integral, `X` normal, `Y` regular locally Noetherian, `Z ≠ X`). The README flags no locator as unverified.
- Cross-roadmap citations resolved: 1 re-read, LocalPurity §2.1 `Algebra.etale_of_finiteNormal_of_isRegularLocalRing` (`TauCetiRoadmap/LocalPurity/README.md` 695–698 at this head). `citations.md` lists the same ten names as before; `overlaps.md` reports no dropped id in either direction. #1808 changes this folder too and the description's merge-order block places this pull request first.

Overlap check: read LocalPurity, AbhyankarLemma, SchemeAndStackFoundations, PurityForFlatCohomology, DirectSummandsAndBigCohenMacaulay, AdicCoefficientsAndComparisonsPartII; nothing shared. Purity for regular local rings (0BMA) is LocalPurity §2.1's and is cited here (and by PurityForFlatCohomology, whose §1.8 is purity on punctured spectra in virtual dimension `≥ 3`, a different statement); tame ramification is AbhyankarLemma's; AdicCoefficientsAndComparisonsPartII cites the former §0.3 (`IsRegularLocalRing.free_of_isCohenMacaulay`), which the table at README 90–106 resolves to Tau Ceti; DirectSummandsAndBigCohenMacaulay names no object of this roadmap. The branch-locus theorems of §§2.1–2.3 have this roadmap as their only owner.

- The pull request's text against this head: the PurityOfBranchLocus sentences hold. Only Layer 2 with §§2.1–2.3 remains (README 283–418); SchemeAndStackFoundations, DerivedModuleAlgebra and ModularCurves are named nowhere in the README; the two mapping tables are at README 82 and 93; 20 declarations removed and `etale_of_etaleAt_codimOne` added. The two new files are main's and are no change against the base, so the description owes them nothing.
- Remark, no change asked: `STATUS.md` is generated from main's README (its coverage block lists Layers 0 and 1, which this head maps to the pins in the tables at README 82 and 93). It is rewritten whole by the tools on the next update.
- Source independence: changed passages only; 0 passages compared, since the diff adds no roadmap prose and no source locator (the two files are tool-generated and identical to main's); no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- O. Zariski (1958) and M. Nagata (1959) are cited only as the theorem's origin, with no locator-bearing claim; not opened.
- The provenance repository was not re-read; the diff does not touch the Provenance section.
- The claims of `PROGRESS.md` and `STATUS.md` about Tau Ceti at `d2083f0` were not checked against that commit; they are generated on main and are not this pull request's text.

## Source issues

- **Gap** in stacks-0BMB at Lemma 58.21.4, proof, pp. 54–55: the source applies the induction hypothesis at every point other than `x`, including the generic point, where the dimension is 0 and hypothesis (4) fails; it should handle the generic point by openness of the unramified locus at a codimension-one specialization; affects the proof.
- **Misprint** in sga1 at Exposé X, remark after Théorème 3.1, printed p. 212: the source says `Z ≠ X` means the extension `R(Z)/R(X)` is separable; it should be the function-field extension `R(X)/R(Y)`; affects nothing.

## For the human reviewers

- **Licence.** README 536–548 (Provenance) maps §2.1 to declarations of the public repository `tdupu/pcfawd-formalization`, stated there as Apache-2.0; the `Suggested.lean` names differ from that repository's, and its files were not re-read this round.
