# Review of CohomologyOfGroups (pull request #2338 at 6447a96)

**Verdict:** accepted

Incremental re-review of 4 changed lines since `f8d096c`. No finding.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/CohomologyOfGroups/README.md:1823–1825` now reads “Loh19 Outlook 3.2.26, p. 138, mentions a group-cohomology Künneth theorem under a finiteness assumption; the statement here follows from 5.1 and 5.2”.

## Verified sound

| Statement | Instances tried | Computed left side | Computed right side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 5.3 cohomological cross product (the statement the changed citation is attached to) | G = C₃, H = ℤ; k = 𝔽₃; n = 2 | ⊕ Hᵖ(C₃)⊗H^q(ℤ): 1·0 + 1·1 + 1·1 = 2 | H²(C₃×ℤ) = dual of H₂ = H₂(C₃)⊗H₀(ℤ) ⊕ H₁(C₃)⊗H₁(ℤ): 1 + 1 = 2 | Agree; infinite H admitted | — |
| 5.3, same statement | C₂ × C₂; 𝔽₂; n = 2 | 1 + 1 + 1 = 3 | dim H²(C₂×C₂, 𝔽₂) = 3 | Agree | — |
| 5.3 “follows from 5.1 and 5.2” | Field k; H_q(H,k) finite-dimensional for q ≤ n | 5.2: Hⁿ = Hom(Hₙ, k); 5.1: Hₙ(G×H) = ⊕ H_p⊗H_q | V^*⊗W^* → (V⊗W)^* bijective for dim W finite; fails for V = W = ℚ^(ℕ) | Derivation holds exactly under the stated hypothesis | — |
| 5.3 citation against the source | Loh19 lines 5985–5994 (Outlook 3.2.26, p. 138) | README: “mentions … under a finiteness assumption” | Source: third bullet names a Künneth theorem for group cohomology under a finiteness assumption, by reference, no formula | Citation now claims what the source has | — |

The rows for the untouched statements stand as in the previous review, of `f8d096c`.

- Source locators checked against the text: 1 (Loh19 Outlook 3.2.26, p. 138, lines 5985–5994); no seeded-sample target falls in the changed passage; the second citation of the same Outlook (`README.md:1754`, §5.2) also matches the source's first bullet.
- Diff since `f8d096c`: 2 insertions, 2 deletions, all in `README.md:1824–1825`; no Lean statement, heading, section number, supplier citation or `*Needs:*` line changed; 0 files changed outside the folder.
- Gate rerun at this head: every scanner count 0, `OK`; the worker's gate records `build=0`.
- Dependency check: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/CohomologyOfGroups/Suggested.lean` gives 14 `sorry` warnings and nothing else; the file is unchanged since `f8d096c`.
- Pull-request text against the head: adds a roadmap (3 files, 3368 lines, 74 headings, 23 declarations, none removed); the eight listed layers match Layers 1–8; the Tau Ceti operations named are those of `README.md:36–60`; the summary block's consumers match `README.md:2851–2859`; of the 14 supplier roadmaps, 6 are on main and the 8 others are the ones the description lists as open; 0 sentences contradicted, 0 unstated changes.
- Overlaps: no other open pull request changes this roadmap; 0 cited ids dropped; 0 ids defined only by an open revision; 0 unresolved citations or Lean names.
- Source issues recorded in the previous review stand; none was found in the passage read this round.

Overlap check: the diff changes no owned object, so the scopes read in the previous review (SpectralSequencesAndConvergencePartII, K3BlochGroups, ArithmeticGaloisDuality, InductionRestrictionPartII, ProfiniteCohomology, DerivedModuleAlgebra, InductionRestriction) stand with the owners named there; FinitenessAndDualityOfGroups is named in `README.md:2855–2858` as a consumer; nothing shared.

Source independence: changed passages only; 1 passage compared with 1 source (Loh19 lines 5985–5994), at most 3 consecutive words shared (a standard phrase); largest share HS53, as in the previous review; the diff adds, removes or reorders no layer, so the arrangement was not compared again.

## Not verifiable

- Brown82, CE56 (settled uncertified) and SwanPPeriod60 (settled waived): unchanged from the previous review; no changed passage cites them.
- The work Loh19 Outlook 3.2.26 refers to for the group-cohomology Künneth theorem was not read; the README does not cite it and derives the statement from 5.1 and 5.2.

## Source issues

- none

## For the human reviewers

- none
