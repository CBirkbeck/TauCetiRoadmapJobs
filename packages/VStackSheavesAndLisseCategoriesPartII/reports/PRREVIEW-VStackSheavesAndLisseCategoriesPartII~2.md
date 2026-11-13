# Review of VStackSheavesAndLisseCategoriesPartII (pull request #2288 at 8b71332)

**Verdict:** accepted

## Deferred findings

- D01 — stands

## Previous findings

- R01 — not repaired: deferred (D01).
- R02 — repaired: README line 473 identifies non-quasiseparatedness by the punctured-disc product and proves failure of quasi-pro-étale geometric points; line 670 now cites this Check.
- R03 — repaired: README line 323 distinguishes the origin's residue field C from the Gauss point's infinite residual transcendence degree, preserved in complete algebraically closed extensions.
- R04 — repaired: README line 224 closes the source parenthesis, separates the second sentence and names q; line 2014 uses Fix(c̃).
- R05 — repaired: README line 142 cites Stacks07LT, Tag 07LT, for the compact–perfect equivalence supplied by DGAInfinity Layer 5.
- R06 — repaired: the description states that Suggested.lean declares nothing, lists the six supplier requirements, and distinguishes the successful build's Mathlib module-system warning.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Supplier contract, line 142; VS8.4: compact iff perfect | R = 𝔽₃; M = 0, R², R^(ℕ), in degree zero | (compact, perfect) = (yes, yes), (yes, yes), (no, no); infinite identity has infinite rank, whereas finite-component maps have finite rank. | Both directions agree | Citation added |
| VS6.2, line 224; VS7.9: q is not smooth | p = 2, Λ = 𝔽₃; Uₙ = 2ⁿℤ₂, Vₙ = 2ⁿ + 2ⁿ⁺¹ℤ₂ | (δ₀, μ)(Uₙ) = (1, (−1)ⁿ); (δ₀, μ)(Vₙ) = (0, (−1)ⁿ⁺¹). Distribution stalk dimension ≥ 2; Haar line dimension 1. | Noninvertible after base change | Punctuation and q repaired |
| VS6.6, line 323; VS6.7(iv): infinite ball is not fine | Origin; Gauss point; any complete algebraically closed extension of its residue field | Origin: tr.c(C/C) = 0. Gauss: residue transcendence degree ≥ N for every N, also after extension; dim.trg = ∞. | Finite-dimension condition fails | False every-point claim replaced |
| VS6.11, line 473: diamond-base hypothesis matters | id on Spd ℤₚ; F = completed 𝔽ₚ((t^(1/p^∞))) | F ×_(Spd ℤₚ) F is a punctured disc: not quasicompact. Thus qs = false; (a, b, c) = (false, true, false). | Correct negative control | Spatiality claim removed |
| VS6.11, line 473; VS7.7, line 670: geometric-point obstruction | Characteristic-p geometric points C, C′; id on Spd ℤₚ | Absolute product has a point with residual transcendence degree ≥ 1 over C′; pro-étale fibres have degree 0. For id, c_id = id. | Point condition fails; comparison for identity still holds | Check reference corrected |
| VS11.13, line 2014; VS11.12: étale fixed locus | C₂ swaps X = {a,b} over a geometric point; A = 𝔽₃ | Fixed fibres at (1, σ) have cardinalities (2, 0); characteristic-class and local-term values both (1, 1) over 1, empty over σ. | Same Fix object and function | Capitalization corrected |
| VS11.13: necessity of étaleness | Affine action z ↦ az + b near a = b = 1 | Fixed equation near infinity: w(bw + a − 1) = 0; at a = b = 1 it is w² = 0; two branches meet. | Isolated points do not ensure étaleness | Existing stronger hypothesis retained |

Untouched statement rows stand as in the previous review of 1de1dfd.

- 6 changed passages checked; seeded targets VS6.11 and VS8.4 and affected VS7.9/VS11.12 checked within this incremental scope.
- 17 source locators read: Stacks07LT line 9463; FS21 line 4198; Sch17 lines 2109, 2118, 2282, 2974, 4118, 5013, 5047, 5383; GHW22 lines 133, 601, 964, 1158; HKW22 lines 1165, 1251, 2134.
- 3 supporting pinned declarations opened: Mathlib/LinearAlgebra/Dual/Lemmas.lean:262; TauCeti/LinearAlgebra/Trace/Projective.lean:72 and :118.
- 8 affected supplier sections resolved: DGAInfinity Layer 5; DiamondsAndVStacks D4.11, D5.1, D5.11; DiamondSixOperations S0.1, S0.2, S4.3; VStackSheavesAndLisseCategories VS0.2. Citation resolver: 0 unresolved cross-roadmap citations.
- 0 Lean declarations, hence 0 declaration-signature or padding probes; the empty namespace and headline list agree with the description.
- Gate: worker's build-inclusive gate and rerun pass, all reported checks zero; dependency output: `depcheck: 239 roadmaps, 2174 edges, 0 problem(s)`.
- Direct Lean elaboration: exit 0, no output. Targeted Lake build: exit 0; only Mathlib module-system warnings.
- PR text checked against the added folder: 0 removed headings or declarations, 0 supplier additions or removals in this update, 0 changed paths outside the folder; worktree remains clean.

Overlap check: read DiamondSixOperations, VStackSheavesAndLisseCategories, HeckeStacksAndLocalShtukas, AdicCoefficientsAndComparisons, GeometricSatakeAndFusion and EnhancedDerivedSheaves; representable exceptional operations belong to DiamondSixOperations, smooth-stack descent and ULA to VStackSheavesAndLisseCategories, scheme comparisons to AdicCoefficientsAndComparisons, generic enhancements to EnhancedDerivedSheaves; the fine-stack extension belongs here. No new ownership change in these passages; compact–perfect remains imported from DGAInfinity Layer 5.

Source independence: changed passages only; 6 passages compared with 5 sources, no copied expression or reused material. Sch17 has the largest share of explicit locators in those passages, 5 of 11. Overall dominant source HKW22 and the previous contents comparison stand; no layer was added, removed or reordered.

## Not verifiable

- none for the changed passages.

## Source issues

- **Gap** in HKW22 at Theorem 4.1.8, printed p. 24: the source says the cited theorem supplies the proper exceptional/ordinary pushforward comparison; it should be justified separately, since GHW22 Theorem 1.4 does not state it; affects the proof.
- **Error** in HKW22 at §4.6, closing remark, printed p. 44: the source says isolated fixed points imply étaleness of the restricted inertia; it should assume the fixed-locus projection is étale; affects a stated result.

## For the human reviewers

- GHW22, the source of Layers VS6–VS7 (87 mentions), is an arXiv preprint (2202.12467v1, 2022) with one public version; HKW22, the published article, cites a later numbering of it that is not public.
- The README carries a section `## Corrections to the sources` (lines 2045–2062, 14 items); no roadmap on main has a section of that name.
