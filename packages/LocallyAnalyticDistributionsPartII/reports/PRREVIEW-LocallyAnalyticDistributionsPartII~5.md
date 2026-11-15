# Review of LocallyAnalyticDistributionsPartII (pull request #2283 at d658fa3)

**Verdict:** accepted

Incremental re-review of 0 changed lines since `d658fa3`; this round reads the pull request's title and description against the head. No finding.

## Deferred findings

- D01 — stands
- D02 — stands

## Previous findings

- The previous report (of `d658fa3`) raised no finding; nothing to account for.

## Verified sound

The diff changes no statement; the rows are for the statements the pull request's description cites.

| Statement | Instances tried | Computed value | Comparison value | Result / change |
| --- | --- | --- | --- | --- |
| Description: Peter–Weyl `K[[G]]/Ann(W_k) ≅ End_K(W_k)`, K/ℚ_p finite (§5.2 (iii), `exists_surjective_algHom_end_symPower`) | m = 0; m = 1, k = 1 | m = 0: K → End_K(K), dim 1. k = 1: I, pE₁₂, pE₂₁, diag(p, −p/(1+p)) are independent, span M₂(K) | (Π(k_i+1))² = 1; 4 | Surjective in both; description, README and Lean agree (p odd, K finite) |
| Description: Fu's theorem for every λ ∈ ℤ_p^m, "covering integral characters that are not induced over ℚ_p" (§§4.12, 4.14) | p = 3, λ = 1; λ = 0 | 1 + 2λ = 3, v₃ = 1 odd, no square root in ℚ₃: K = ℚ₃(√3), e = 2, a = −1 + √3, a(a+2)/2 = (3 − 1)/2 = 1. λ = 0: a = 0 | induced iff √(1+2λ) ∈ ℤ_p; c = 0 gives ½c² + c = 0 | λ = 1 not induced, reached by descent from K; λ = 0 induced. Description accurate |
| Description: semisimplicity of finite-dimensional rational Iwasawa modules for congruence kernels (§3.8, `isSemisimpleModule_of_finiteDimensional`) | m = 0; p = 2 | m = 0: algebra ℚ_p ⊗ ℤ_p[[1]] = ℚ_p, every module semisimple. p = 2: −1 ∈ G₁, torsion, not uniform | Lean carries `p ≠ 2`; README Layer 0 excludes p = 2 | Agrees; description's "for odd p" covers the Lean hypothesis |
| Description: §2.5 for every finite-dimensional Lie algebra over finite E/ℚ_p with a bracket-stable lattice; germ and congruence-subgroup comparisons under the algebraic-group hypothesis | g = E·x abelian | `U(g)_{r_j}` = Tate algebra of radius `\|π_E\|^{−j}`, envelope = entire series; no group used | `README.md:310` ("any finite-dimensional E-Lie algebra"), `:314`, `:316` ("linear algebraic group 𝔾") | Description matches the head |
| Description: §1.4 over any complete nontrivially valued nonarchimedean field; §1.5 identifies the ordered-coordinate stages with those of §0.1 | Convention 1; Scope bullet 2 | `README.md:32` "§1.4 alone works over any field complete for a nontrivial nonarchimedean absolute value"; `README.md:12`, `:57` | description's ownership paragraph | Agrees |

Rows for untouched statements stand as in the previous review, of `d658fa3`.

- Pull-request text against the head: title and every prose sentence of the description read, with the summary block; 0 contradicted, 0 unstated changes (new folder, 911 insertions, 67 headings, 4 Lean declarations, no section or declaration removed, no file outside the folder).
- The description's supplier list resolved, 9 roadmaps: open heads PadicLocalLanglandsForGL2Qp §0.1, NoncommutativeAndEquivariantIwasawa Layer 0 and §F.1, LocallyAnalyticDistributions §§0.0, 0.2, 0.3, DeformationAndDerivedPatchingAlgebra §1.10; on main PadicFunctionalAnalysis §§4.4, 4.7, PadicMeasuresIwasawaAlgebras Layer 0, §§1.2, 1.7, LieHighestWeight §9.2 and Worked examples, ReductiveGroups §9B.1 and Layer 9D, ReductiveGroupsPartII RG2.0.2. Each heading exists where cited; the README names no further supplier roadmap.
- Source locators checked this round: 0 (no passage changed; no locator is flagged unverified; the seeded sample falls in no changed passage).
- Library declarations: none changed; `Suggested.lean` elaborated with `lake env lean`: 2 `sorry` warnings (lines 79, 99), nothing else. The 4 elaborated signatures agree with README §§0.2, 3.8, 5.2; no binder lost.
- Gate at `d658fa3`: every check 0, `OK`, targeted build included.
- Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Deferred D01/D02 re-read: RelativeFarguesFontainePartII §8.4 at its open head (`README.md:1762`) still constructs the general Fréchet–Stein and coadmissible-system interface.
- Remark: the description's "AI assistance" sentence concerns the pull request's draft state, which the head neither confirms nor contradicts.

Overlap check: read LocallyAnalyticRepresentationsOfLocalGroups, LieHighestWeight, LocallyAnalyticDistributions, CompletedCohomologyPartII, NoncommutativeAndEquivariantIwasawa (the folder is unchanged, so their ownership stands as in the previous review); nothing newly shared. The general Fréchet–Stein interface remains recorded as D01/D02. No second copy, conflicting head, dropped cited id or id defined only by an open revision.

Source independence: changed passages only: 0 passages changed, so 0 compared; largest share FU24, unchanged from the previous review; no layer added, removed or reordered, so contents not compared again: independent.

## Not verifiable

- SCH11: settled uncertified; no changed passage cites it.
- DDMS99, FROM03, MR01, DG70: settled waived; no changed passage cites them.

## Source issues

- none

## For the human reviewers

- BCGP25 is an arXiv preprint (`TauCetiRoadmap/LocallyAnalyticDistributionsPartII/README.md:794`); FROM03 is an unpublished, waived primary text. The envelope and Frommer assertions also cite refereed SCHM13, ST02 and KOH07.
- The legal-text exceptions SCH11, DDMS99, FROM03, MR01 and DG70 retain their settled uncertified/waived status; their original wording and printed locators were not independently certified.
