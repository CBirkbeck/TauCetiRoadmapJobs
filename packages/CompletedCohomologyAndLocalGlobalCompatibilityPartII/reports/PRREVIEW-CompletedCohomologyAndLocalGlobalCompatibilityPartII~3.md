# Review of CompletedCohomologyAndLocalGlobalCompatibilityPartII (pull request #2262 at 14beba2)

**Verdict:** accepted

Incremental re-review: the folder is unchanged since `14beba2` (0 lines); this round reads the pull request's title and description against the head. No finding.

## Previous findings

- none: the previous report, of `14beba2`, raised no finding of its own (it accounted for R01–R05 of the review before it, all repaired; the folder has not changed since).

## Verified sound

| Statement | Instances tried | Values computed on both sides | Result | Change |
|---|---|---|---|---|
| §4.2 local faithfulness (README line 390), cited by the description | R=O[[x]]/(x(x−ϖ)), M=R/(x)⊕R/(x−ϖ) or M=R/(x); R=O[[x]]/(x²) | Ann=(x)∩(x−ϖ)=0; Ann=(x)≠0 when one component is missed; nonreduced: ∩ of minimal primes=(x)≠0 | Every component and reducedness both needed, as stated; BIP Theorem 6.8 at BIP lines 2447–2461 | none |
| §5.4 supercuspidal density (README line 462), cited by the description | d=1, F=ℚ₇, E=F; hypotheses against BIP lines 2306–2312 | Ind from W_F of a character is the character, irreducible; 7∤2; source: p∤2d, E unramified of degree d, WD irreducible | Hypotheses equal the source's | none |
| Description: "17 supplier gaps … 6, 3, 2, 2, and one each" | Count of `What … must provide (gap:…)` lines per supplier subsection of the README | 6 (§§5.1, 5.2, 5.2a, 5.3) + 3 (§SR.5.2) + 2 (§4.6) + 2 (§2.1) + 1+1+1+1 = 17; README has 17 such lines | Agrees | none |
| Description: "none of the seven headline theorems … is statable" | `Suggested.lean` module docstring; README line 588 | Docstring lists §4.2 and §§5.2, 5.3, 5.4, 6.1, 6.3, 6.5 = 1+6 = 7; 0 declarations | Agrees | none |
| Description: prime ranges | README lines 390, 431, 447, 462, 488, 527, 565 | Every prime: §§5.2, 6.1; p∤2d: §§4.2, 5.3, 5.4, 6.3, 6.5; description says the same | Agrees | none |

The adversarial rows for untouched statements stand as in the previous review, of `14beba2`.

- Pull request text: title and description read sentence by sentence against the head; 0 sentences contradicted, 0 unstated changes (the pull request adds the folder: 54 headings added, 0 removed; 0 Lean declarations; 0 files outside the folder). The summary block's claims on scheme-spectrum density with the special fibre, finite coefficient extensions and the local route at all primes match README Conventions and §§5.2, 6.1, 6.5.
- Source locators reread: 2 (BIP Theorem 6.8, BIP lines 2447–2461; BIP Theorem 6.1 and the definition of the supercuspidal set, BIP lines 2306–2312); both match.
- Cross-roadmap citations: the five suppliers absent from the description's open-supplier list (ClassFieldTheory, ReductiveGroups, PadicFunctionalAnalysis, PadicMeasuresIwasawaAlgebras, AdicSpacesPartIII) are on main; PadicMeasuresIwasawaAlgebras §1.7 and AdicSpacesPartIII §R2.9 exist there. All 17 gap slugs in the README equal the declared ones.
- Gate: every scanner 0, `OK`. Dependency check: `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibilityPartII/Suggested.lean`: exit 0, no warning; 0 declarations, so no signature comparison and no one-tactic probe apply.
- Overlap check: read CompletedCohomologyAndLocalGlobalCompatibility, PadicLocalLanglandsForGL2Qp, HilbertModularVarietiesAndShimuraCurvesPartII, PotentialAutomorphyInfrastructurePartII, CompletedCohomologyPartII as listed (no roadmap on main is close); the overlap facts are unchanged since the previous review: the patched module, capture and benign loci are the parent's, rank-two benign density is PadicLocalLanglandsForGL2Qp §3.6a, general local density is owned here; nothing else shared.
- Source independence: changed passages only; the diff changes none; 2 passages (README lines 390–392, 462) compared with 1 source (BIP), none shared; largest share EP as in the previous review; no layer added, removed or reordered, so the contents comparison stands.

## Not verifiable

- The extraction ambiguity at EP lines 883 and 899 (strict versus non-strict depth inequality) noted by the previous review was not re-examined; the contract keeps the stricter range n>2m.

## Source issues

- none

## For the human reviewers

- The five departures from published sources recorded in the earlier reviews remain at `TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md` lines 57, 59, 121, 375 and 592; a specialist may wish to confirm those corrections.
