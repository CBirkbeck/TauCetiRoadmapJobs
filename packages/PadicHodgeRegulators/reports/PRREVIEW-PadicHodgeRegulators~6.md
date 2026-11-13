# Review of PadicHodgeRegulators (pull request #1498 at a63b5f6)

**Verdict:** needs changes

## R01 (P3) — Update the direct-supplier list

**Location:** Pull request #1498 description, dependency paragraph: “the other open pull requests in the merge-order block below are their transitive prerequisites.”
**Claim:** The prose omits direct suppliers and consequently describes them as merely transitive prerequisites.
**Witness:** `TauCetiRoadmap/PadicHodgeRegulators/README.md:945` directly consumes PadicDifferentialEquationsAndRigidCohomology §RD.4.40 (#1002); line 1061 directly consumes Polylogarithms §§2.1,2.3 (#1424). Neither appears in the prose's direct-supplier list.
**Repair:** Add “#1002 (PadicDifferentialEquationsAndRigidCohomology, §RD.4.40) and #1424 (Polylogarithms, §§2.1,2.3)” to that list. State that §4.1 now consumes the rigid Gysin isomorphism to establish the syntomic divisor condition.

## R02 (P3) — Correct the summary's reversed supply direction

**Location:** Pull request #1498 description, `roadmap-summary` block: “Polylogarithms takes the Suslin–Bloch–Wigner evaluation and κ₂”.
**Claim:** This describes Polylogarithms as a consumer of an evaluation that it supplies to this roadmap.
**Witness:** `TauCetiRoadmap/PadicHodgeRegulators/README.md:2754` explicitly identifies Polylogarithms as a supplier; `TauCetiRoadmap/Polylogarithms/README.md:191` at #1424 owns the calibrated evaluation. Section 4.7 here imports it.
**Repair:** Replace that sentence's Polylogarithms clause with “Polylogarithms supplies the calibrated Suslin–Bloch–Wigner evaluation used here to compare de Jeu's classes with Suslin's classes.” Keep the GrossZagierAndArithmeticHeights clause.

## Previous findings

- None outstanding: the review of aada6bb accepted the folder and raised no findings; its R01–R07 entries recorded repairs to an earlier review.

## Verified sound

| Statement | Instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| Supplier indexing, lines 61,70; §4.2 | Weight 2; K-degrees 3 and 1 | (2,3) here → (2,1) there, target H¹; (2,1) here → (2,3) there, target H³ | Consistent |
| Soulé contract: inverse limit | F=ℚ₅, weight 1; F=ℚ₂, weight 1 | ℚ₅: H⁰(μ₅ᵛ)=0. ℚ₂: eventual transition on {±1} is squaring, with image {1}. Both lim¹=0 | Finite-tower argument applies |
| Chern transfer, lines 61,243 | Weight 2 at p=5 and p=2; possible discrepancy δ | 2δ=0 forces δ=0 over ℤ₅; δ=1 in ℤ/2 satisfies 2δ=0 and becomes 0 over ℚ₂ | Qualification retained |
| Weight-one transfer | ℚ₂₅/ℚ₅, u=6 | N(6)=36; log(36)≡110; Tr(log(6))≡2·55=110 mod 125 | Kummer norm/trace agrees |
| Completed K₃ contract, line 374 | p=2, discrepancy of order 2; identity extension | 2δ=0; δ⊗1=0 over ℚ₂. Identity extension: difference 0 | No integral cancellation of 2 asserted |
| Rigid Gysin contract, line 271 | D={0}⊂𝔸¹ over 𝔽₅ | Supported H²=ℚ₅(−1); H⁰(D)(−1)=ℚ₅(−1); Frobenius eigenvalue 5 on both | Shift 2 and twist −1 agree |
| §4.1 projective bundle, nonpositive weights | ℙ¹ over ℤ₅, weight 0 | H⁰…H³ dimensions (1,1,0,0); base weight 0 plus shifted weight −1 gives (1,1,0,0) | Negative-weight fibre is acyclic |
| §4.1 projective bundle, positive weights | ℙ¹ over ℤ₅, weight 1 | H⁰…H³ dimensions (0,1,1,1); base weight 1 plus shifted weight 0 gives (0,1,1,1) | Weight-zero summand retained |
| §4.1 divisor condition | Point divisor in ℙ¹, a=ξ | ι^*ξ=0; ξ·c₁(O(D))=ξ²=0; ι_*1=ξ with Frobenius 5ξ | Gysin sign agrees |
| §4.1 universal classes | O(1)⊕O(1) on ℙ² | (1+ξt)² has c₂=ξ², coefficient 1; each line has c₂=0 | Excludes additive c₂ on K₀ |
| Chern character, line 70 and §4.1 | Weights 1,2,3; unit products | Multipliers 1,−1,1/2; c₂({f,g}) has coefficient −1, ch₂ coefficient +1; c₃ coefficient 2, ch₃ coefficient 1 | Newton normalization agrees |
| §4.2 theory morphism | O(1) on ℙ¹; two coordinate units on 𝔾ₘ² | First-class generator maps 1→1; second Chern symbol coefficient −1 maps to −1; character coefficient +1→+1 | Matches NN2016 Proposition 5.7 |
| §5.7 transfer; affected seeded §6.3 | Quadratic extension, pulled-back regulator value a; identity extension | Tr(a)=2a=D(N res ξ); identity gives a=a; 2-primary discrepancy rationalizes to 0=0 | New integral qualification preserves rational statements |
| §7.7 compatibility | Rational weight-two K₂ class; torsion class of order 2 | Both étale and syntomic ordinary classes are −1 times their characters; torsion maps to 0 on both sides | Rational compatibility preserved |

Rows for untouched statements stand as in the previous review of aada6bb.

- 9 source locators checked: WeibelChern Proposition 4.4, p.22 (line 979); Besser2000 Proposition 7.4, (7.4), Theorem 7.5, pp.22–23 (lines 802,839,846); NN2016 Proposition 5.2, Remark B.5, Proposition B.4(1), Propositions 5.6–5.7, pp.55–58,63 (lines 2875,3301,3283,3003,3027).
- 1 affected seeded locator reread: §6.3, GSWZ2024 after (174), p.38 (line 1968); its transfer input remains §5.7 and the rationalized Chern contract.
- 4 changed supplier contracts resolved: SchemeKTheoryOperations §7.3a T1–T3,T5,T7–T8; KTheoryFiniteLocalFields §1.8; PadicDifferentialEquationsAndRigidCohomology §RD.4.40; CohomologyComparisonsPartII §§2.1–2.3, at their open heads.
- 1 pinned near-match opened: `TauCeti/RingTheory/Syntomic/StandardSyntomic.lean:81`, `IsStandardSyntomicOfRelativeDimension`, concerns flat algebra presentations, not syntomic cohomology or Chern classes; object searches found no replacement for the changed construction.
- 7 declarations checked with `#check @name` on a scratch copy: no lost binders or changed signatures; all match the README. The unchanged three headline statements and their previous one-tactic probes stand.
- Gate: all scanners pass; targeted build and absolute-path Lean elaboration both exit 0, with only three `sorry` warnings. Dependency output: `depcheck: 222 roadmaps, 1973 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Scope: 35 README lines changed, 0 Lean declarations changed, 0 outside-folder paths; worktree remains clean. The PR adds the folder; no headings or Lean declarations are removed against its base.

Overlap check: read CohomologyComparisonsPartII (classical syntomic carriers), ColemanIntegration (modified syntomic character and integration), PhiGammaModulesAndIwasawaCohomology (Herr/Wach carriers), KatoEulerSystems (Kato-specific regulators), PadicHodgeTheory (period comparisons); their ownership remains separate from the changed regulator comparisons. SchemeKTheoryOperations owns the general Chern construction, KTheoryFiniteLocalFields its étale instances, and this roadmap its rigid syntomic instance. No conflicting head or dropped citation is listed.

Source independence: changed passages only; 7 passages compared with 3 sources, no copied expression or reused source material found. LLZ2011 has the largest overall source-citation share (43 of 297 keyed mentions before References). No layer was added, removed or reordered, so the arrangement comparison was not reopened.

## Not verifiable

- No changed passage remains unverifiable. The previous review's extraction limitations for Nakamura2014 Theorem 3.10(2) and RJ2018 Théorème I.10 remain outside this diff.

## Source issues

- none

## For the human reviewers

- none
