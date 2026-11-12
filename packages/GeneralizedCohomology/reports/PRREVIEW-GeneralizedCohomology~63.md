# Review of GeneralizedCohomology (pull request #1807 at a02e7ef)

**Verdict:** needs changes

This is an incremental re-review of the 57 lines changed in `TauCetiRoadmap/GeneralizedCohomology/README.md` since 8d98b44. The change renumbers this README's AlgebraicTopology citations to that roadmap's layer numbering at this head. `Suggested.lean`, `lake-manifest.json` and `lean-toolchain` are byte-identical to 8d98b44.

## R01 (P3) — Conventions plan to prove AlgebraicTopology 4.5's Kelley product theorem a second time

**Location:** `TauCetiRoadmap/GeneralizedCohomology/README.md:130–132`: “Its products are CW products in the compactly generated category of AlgebraicTopology Stage 4.8, with k the coreflection: prove the weak product CW structure agrees with k(X×Y).”

**Claim:** This README plans to prove that the product-cell CW topology equals k(X×Y). That theorem already has an owner: AlgebraicTopology §4.5's Kelley product CW structure. This README's own contract at line 374 lists that structure as consumed. The change moved this sentence's citation from the old Stage 4.5, which held the product theorem, to Stage 4.8, which states only the coreflection. Now no supplier is cited for the theorem, and the sentence assigns it to this roadmap.

**Witness:** `TauCetiRoadmap/AlgebraicTopology/README.md:1744`, “Own the Kelley product CW structure … on k(X×Y)”, and line 1758, “Prove its weak topology is the compactly generated product topology (Hatcher, Theorem A.6, p.524)”. HatcherAT line 22693 (Theorem A.6) states exactly this.

**Repair:** Replace the sentence with: “Its products are CW products in the compactly generated category of AlgebraicTopology Stage 4.8, with k the coreflection; the weak product CW structure agrees with k(X×Y) by AlgebraicTopology Stage 4.5's Kelley product CW structure (Hatcher, *Algebraic Topology*, Theorem A.6, p. 524).” The sentence then cites the owner at AlgebraicTopology line 1758 and agrees with the contract at line 374.

## Previous findings

- none: the report of 8d98b44 raised no finding.

## Verified sound

| Statement / convention | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| G2.1 consumes AT 4.9: \|K×L\| ≅ k(\|K\|×\|L\|) | K=L=Δ[1]; K=∅ | Δ[1]×Δ[1] has 4 vertices, 5 edges and 2 triangles, so χ=1=χ(I×I). For K=∅ both sides are ∅. | Pass; AT 4.9 (line 2022) owns it. |
| G2.1's pointed adapter \|X∧Y\| ≃ k(\|X\|∧\|Y\|) | X=Y=Δ[1]/∂Δ[1]; X=S⁰ | Product: 1 vertex, 3 edges, 2 triangles, χ=0=χ(T²). Smash: 1 vertex, 1 edge, 2 triangles, χ=2=χ(S²). S⁰∧X≅X on both sides. | Pass. |
| G2.5 now takes the suspension–loop adjunction from AT 4.8, not 8.11b | f:S⁰∧S¹→S¹ of degree +1; X=S¹ | The adjoint x↦(t↦f([x,t])) has winding +1; reflection gives −1. Left suspension = (−1)^i·τ_*·right suspension: ±1 on π₁S¹→π₂S², both isomorphisms. | Pass; Freudenthal ranges are sign-blind. |
| G1.3 and G1.5 take compact generation from AT 4.8 | k(*×I), k(I×I); Sierpiński space; (ℝ×ℝ)⁺; U=∅ | I and I²; k keeps Sierpiński's three opens and it stays non-Hausdorff; (ℝ²)⁺=S²=S¹∧S¹; (∅×V)⁺=*=*∧V⁺. | Pass; G1.5 keeps its separation hypotheses. |
| G2.9 convenient-product bar realization (AT 4.5, 4.8) | G=H=ℤ discrete | B(ℤ×ℤ)≃T²; k(S¹×S¹)=S¹×S¹ because it is compact; π₁=ℤ² on both sides. | Pass. |
| Contract: AT 8.11a interval-product comparison | Y=*, Y=S⁰ | k(*×I)=I=*×I; k(S⁰×I) is two intervals = k(S⁰)×I. | Pass; 8.11a states it (line 4771). |
| G5.6 reduction by AT 4.10 CW approximation | Warsaw circle W; two points; S² with k=2 | W is approximated by a point, so π_j=0 and H_j(W;ℚ)=0, 0→0. Two points fail the j=0 hypothesis. S²: ℤ⊗ℚ→H₂=ℚ is an isomorphism. | Pass. |
| `sSetTopAdj_unit_weakEquivalence` (route through C1.2b and AT 4.10) | Δ[0]; ∂Δ[1]; Δ[1]/∂Δ[1] | Sing(*) has one simplex in each degree, so the unit is an isomorphism; π₀ 2→2; π₁ ℤ→ℤ identity. | Pass. |
| `kanQuillen_modelCategory` and the G2.1 Checks (Needs line changed) | Δ[1]→Δ[0]; ∂Δ[2]→Δ[2]; Λ²₀→Δ[1] with vertices 0,1,0 | Weak equivalence, but Δ[1] is not Kan: the filler needs edge 1→0. Cofibration with π₁ ℤ vs 0, so not a weak equivalence. | Pass. |
| R01: product CW topology versus k(X×Y) | X=Y=S¹; Hatcher A.6 | Product cells 1,2,1 give χ=0=χ(T²). Locally compact, so (X×Y)_c=X×Y. Both statements belong to AT 4.5, not to this roadmap. | Duplicate owner → R01. |

The computed rows of the report of 8d98b44 for the untouched statements stand as in that review.

- **Gate.** The worker's gate passes every check. My run with `--build`: every count is 0 and `build=0`, except `outside-folder=24`. Those 24 paths are the README.md and Suggested.lean of the 12 sibling folders this pull request owns. `git diff --stat origin/main...HEAD` excluding the 13 folders is empty. The many files the change summary lists outside the folder come from merging main, not from this pull request.
- **Dependency check:** `depcheck: 237 roadmaps, 2166 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- **Elaboration.** `lake env lean` on Suggested.lean exits 0 with exactly seven `sorry` warnings (lines 80, 96, 134, 155, 173, 189, 204). `#check @` of all 10 declarations gives the same types as before, with no lost binder.
- **AlgebraicTopology citations.** I checked all 40 README lines citing AT 4.5, 4.7, 4.8, 4.9, 4.10, 8.11a or 8.11b against the AT README at this head:
  - 4.5: Kelley product CW (line 1744) and pair-quotient comparisons (1766);
  - 4.8: coreflection, counit and suspension–loop adjunction (1951);
  - 4.9 (2022) and 4.10 (2057);
  - 8.11a and 8.11b (4679–4911).

  AT's consumer lists (lines 5330–5333 and 5362–5372) agree. AT 5.5 takes CW approximation from §4.10 (lines 2464–2516), as G5.6 says.
- **Pinned declarations opened:**
  - `TopologicalSpace.compactlyGenerated` (Mathlib/Topology/Compactness/CompactlyGeneratedSpace.lean:68);
  - `CompactlyGenerated.compactlyGeneratedToTop` (Mathlib/Topology/Category/CompactlyGenerated.lean:78);
  - `GeneratedByTopCat.adj` (used at Mathlib/Topology/Convenient/Localization.lean:51);
  - `curryEquiv` (Mathlib/Topology/Convenient/HomSpace.lean:96).
- **Cross-roadmap citations, resolved at this head (most of these suppliers changed through the merge of main):**
  - CC C1.1b, C1.2/C1.2b, C1.5, C1.5a, C2.1, C2.4, C2.5, C3.2. CC line 3360 itself calls the counit “C1.2's”.
  - TopK T1, T1.5, T1.5a, T1.6a–d, T5, T7, T7.0, T7.1.
  - CKG K1, K7.1; SpinGeometry G1.3, G4.1; GT 1.1, 1.5, 11.3; HilbertModules H1–H6; CStarAlgebras C5.

  `roadmaps resolve` reports nothing unresolved.
- **Overlaps and the pull-request text.**
  - No cited id is dropped by an open pull request.
  - The heads of #1808 and #1854 still use the old AT numbering (Stage 4.8 = CW approximation). The description orders them after this pull request, and each rebases onto it.
  - The former-numbering table (lines 484–490) still maps the three dropped layer anchors.
  - The description's “realization of a product of simplicial sets (§4.9) … CW approximation (§4.10)” matches this head, and no sentence of the title or description is contradicted.
- **Sources read:** HatcherAT line 15375 (Proposition 4.13, printed p. 353, CW approximation of every space) and line 22693 (Theorem A.6, printed p. 524). Remark on untouched text: the Layer 5 dependency paragraph (line 4927) omits AT Stage 4.10 for G5.6 and Stage 4.5 for G5.0, which their *Needs:* lines list.

## Not verifiable

- QuillenHA Ch. II §3 (G2.1, the only sampled section in a changed passage). It is settled as uncertified (paywalled) and is cited by its locator. I did not request it again.

## Source issues

- none
