# Review of AbelianSurfacesModularity (pull request #1746 at b20dcf8)

**Verdict:** accepted

Incremental re-review: the folder is unchanged since the review of `b20dcf8` (0 changed lines); this round reads the pull request's title and description against the head. No findings.

## Previous findings

- none: the previous review of `b20dcf8` accepted with no finding; its four repaired items (R01–R04 of the round before) stand, the folder being byte-identical.

## Verified sound

Rows are for the statements the pull request's description cites.

| Statement | Instances tried | Computed values | Required value / result | Change |
|---|---|---|---|---|
| Description "lower density of 5551/46656" vs README §8.1 | Local proportions at 2 and 3 | (768−144)/2¹¹=624/2048=39/128; (864−10)/3⁷=854/2187; product 33306/279936=5551/46656; 46656=6⁶ | Equal to the description's and the README's value | none |
| Description "Λ(s)=±Λ(2−s)" vs §0.3 | Centre of symmetry; unshifted control | L(s,Π⊗\|det\|^(−3/2))=L(s−1/2,Π⊗\|det\|⁻¹); unitary centre 1/2 gives s=1; 2−s fixes 1 | Weight-one centre s=1; unshifted variable would centre at 1/2 | none |
| Description "isobaric definition … includes elliptic products" vs §0.1 | E₁×E₂ with modular factors; cuspidal GL₄ witness | Ranks 2+2=4, exponents (1−2)/2=−1/2 each; GL₄ exponent (1−4)/2=−3/2, r=1 | r=2 witness admitted; uniqueness of the isobaric sum excludes r=1 and r=2 together | none |
| Description "Layer 6 endpoints have cuspidal GL₄ transfers" vs §§6.1–6.6 | §§6.1–6.3 conclusions; §§6.4–6.6 routes; product negative control | §§6.1–6.3 state Π with L(s,H¹(A))=L(s,Π⊗\|det\|^(−3/2)); §§6.4–6.6 reduce to §6.2; product has ≥2 idempotents, End≠ℤ | Every Layer 6 endpoint passes through §6.2's cuspidal witness; products excluded by hypothesis | none |
| Description "32 Galois endomorphism types" vs §7.3 | Types over ℚ minus exclusions | 34−2=32 (A and B[C₂] excluded) | Matches heading "32 of the 34" and SatoTateGroups §§9.7–9.8 count over ℚ | none |
| Description "seeds for A₆ and S₆ images" vs §9.4 | Orders of the images inside Sp₄(𝔽₂)≅S₆ | \|A₆\|=360, \|S₆\|=720=\|Sp₄(𝔽₂)\|=2⁴(2²−1)(2⁴−1) | Both images lie in the stated range; local hypotheses retained in the statement | none |

The adversarial rows for all other statements stand as in the previous review, of `b20dcf8`.

- Pull request text: title and 3 summary paragraphs plus 3 prose paragraphs read against the head; every sentence agrees. It says the pull request adds the roadmap (not on main: 1297 insertions, 0 deletions, 0 Lean declarations), that `Suggested.lean` has no declarations, and that `metadata.toml` is `math.NT`; all three hold at the head.
- Suppliers named in the description: 6 of 6 have a `### From TauCetiRoadmap.<X>` subsection (README lines 65, 69, 73, 77, 114, 120); the 3 supplier subsections absent from the generated dependency block (AlgebraicCurves, EllipticCurves, PolynomialGaloisGroups) are on main.
- Cross-roadmap citations re-resolved at the open heads: OrdinaryAutomorphicFormsAndModularityLiftingPartII §5.2 (its README line 583) and SatoTateGroups §§8.7, 9.1–9.4, 9.7–9.8, 9.10 (its README lines 2131–2520); 0 citations and 0 Lean names found nowhere.
- Declared gaps: 14 slugs, unchanged since the previous review.
- Dependency output: `depcheck: 234 roadmaps, 2233 edges, 0 problem(s)`; 0 UPWARD or CYCLE lines.
- Gate: rerun at b20dcf8, every check 0, `OK`. Elaboration of `TauCetiRoadmap/AbelianSurfacesModularity/Suggested.lean`: exit 0, 0 warnings; 0 declarations, so no signature or one-tactic probe applies.
- Outside the folder: 0 files changed against origin/main; worktree unchanged.

Overlap check: read OrdinaryAutomorphicFormsAndModularityLiftingPartII, GSp4NonregularModularityLifting, ModularityAndLanglandsExtensions, EllipticCurveModularityImaginaryQuadratic, PotentialAutomorphyInfrastructurePartII (the other two lists are empty); owners as in the previous review (reasonableness: OrdinaryAutomorphicFormsAndModularityLiftingPartII §5.2; nonregular lifting: GSp4NonregularModularityLifting; relaxed adequacy: PotentialAutomorphyInfrastructurePartII PL.4); nothing else shared.

Source independence: changed passages only; 0 passages changed in the folder, so 0 compared; largest share BCGP25, 90 of 99 citation groups, as in the previous review; no layer added, removed or reordered, so the contents comparison of the earlier review stands.

## Not verifiable

- KIS99 Theorem 5.1: settled uncertified; no text in the cache.
- THORNE17 Definition 2.20: settled uncertified; no text in the cache.
- FC90 II Theorem 6.2/Remark 6.3 and III Theorem 7.1/Corollaries 7.2–7.4: settled uncertified; no text in the cache.

## Source issues

- none

## For the human reviewers

- none
