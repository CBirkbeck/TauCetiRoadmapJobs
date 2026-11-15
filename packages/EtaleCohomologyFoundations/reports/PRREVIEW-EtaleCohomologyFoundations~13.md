# Review of EtaleCohomologyFoundations (pull request #1891 at 0cefadf)

**Verdict:** accepted

## Previous findings

- R01 — repaired: “Affine Artin vanishing permits arbitrary torsion, including residue-characteristic torsion”; the description separately restricts the prime-to-characteristic dimension and ℓ-adic bounds, matching `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:1102` and `Suggested.lean:156`.
- R02 — repaired: the `roadmap-summary` block reports 39 declarations removed, seven added, eight retained, and explicitly lists the removed finite-field Frobenius, fixed-field cardinality and fixed-point equivalence signatures.
- R03 — repaired: “Supplier changes” names GrothendieckEulerForms Layers 2 and 5, drops AdicSpacesPartIII for pinned finite-projective trace, and drops JacobianChallenge for §0.11’s diagonal construction over a qcqs base.

## Verified sound

| Statement cited by revised PR text | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Affine Artin vanishing (§F.3) | `X=𝔸¹_𝔽̄₃`, `F=ℤ/3`, degree 2 | `dim X=1`; `2>1`; Artin–Schreier gives `H²=0`. In `H¹`, `[t]≠0`: nonconstant `g³−g` has degree divisible by 3. | Residue-characteristic torsion satisfies the bound. | Description repaired. |
| Extension-count/fixed-point comparison (§F.10.1) | `X=Spec 𝔽₉` over `𝔽₃`, extension degrees 1, 2 | Field-embedding counts: `0,2`; Frobenius swaps the two geometric points, so fixed-point counts are `0,2`. | Both sides agree. | Signature removal disclosed. |
| Gauss–Bonnet and Euler characteristic (§F.6) | `X=ℙ²_𝔽̄₃`, `ℓ=2` | `deg c₂(T_X)=3`; cohomology ranks `(1,0,1,0,1)` give `χ=1+1+1=3`. | Both sides agree. | Euler-characteristic supplier disclosed. |
| Finite-projective trace (§F.10.3) | `diag(2,3)` on `ℚ²` | Matrix trace `2+3=5`; dual-tensor contraction `2e₁*(e₁)+3e₂*(e₂)=5`. | Both constructions agree. | Pinned supplier disclosed. |

Untouched statements’ adversarial rows stand as in the previous review of `0cefadf`.

- Incremental scope: 0 changed folder lines, 0 outside-folder changes; title, prose and `roadmap-summary` checked against the base-to-head diff, including retained section labels and signature removals.
- Source sample: 0 seeded targets in changed folder passages; 1 locator reopened for the corrected prose: Stacks Proposition 59.95.6, p. 197 (`stacks-0F0V line 9332`).
- Pinned declarations opened: `TauCeti/AlgebraicGeometry/RationalPoint/FixedField.lean:212`, `:256`, and `TauCeti/LinearAlgebra/Trace/Projective.lean:72`.
- Revised-prose citations: GrothendieckEulerForms §§2.4–2.5 and §5.2 resolved; WeilConjectures’ `extensionPointCount` and DeligneWeightsAndPurity’s `finiteFieldPointCount` remain at the supplied open heads.
- Signatures: 8 worker-elaborated types inspected; corrected coefficient prose agrees with the explicit binders. No Lean statement changed; prior one-tactic probes stand.
- Gate: every scanner and dependency check returned zero, `OK`, exit 0; supplied worker gate also reports `build=0`.
- Dependency-check output: `depcheck: 245 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Targeted build and direct Lean elaboration: both exit 0; only 6 expected `sorry` warnings each. Worktree remains clean.

Overlap check: read ClassicalAdicEtaleCohomology, EtaleDualityAndPerverseSheaves, AdicCoefficientsAndComparisons, LefschetzPencilsAndVanishingCycles, InverseGaloisAndArithmeticFundamentalGroups, SchemeAndStackFoundations, AdicEtaleGeometry and AbhyankarLemma; scheme coefficient, support, trace and basic duality inputs remain with EtaleCohomologyFoundations; scheme-site foundations with SchemeAndStackFoundations; analytic sites with AdicEtaleGeometry; analytic cohomology, extended perverse theory, v-sheaf comparisons, nearby cycles, arithmetic specialization and tame-cover extension with their respective named roadmaps. Overlap data reports 0 conflicting heads or dropped-id entries; no ownership change in this increment.

Source independence: changed passages only; 0 changed roadmap passages, 0 changed source locators or layers. Wording, reuse and source-arrangement comparisons stand from the previous review; the corrected PR prose was checked against the retained theorem and one reopened source locator.

## Not verifiable

- No new item; previously settled uncertified sources remain unchanged and were not requested again.

## Source issues

- none

## For the human reviewers

- none
