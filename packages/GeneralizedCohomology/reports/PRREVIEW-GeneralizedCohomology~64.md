# Review of GeneralizedCohomology (pull request #1807 at ed37e7d)

**Verdict:** accepted

Incremental re-review of the 13 lines of `TauCetiRoadmap/GeneralizedCohomology/README.md` changed since a02e7ef. `Suggested.lean`, `lake-manifest.json` and `lean-toolchain` are byte-identical to a02e7ef. No findings.

## Previous findings

- R01 — repaired: “for Hausdorff CW X and Y, the products of their characteristic maps are the characteristic maps of a CW structure on k(X×Y), AlgebraicTopology Stage 4.5's Kelley product CW structure (Hatcher, *Algebraic Topology*, Theorem A.6, p. 524).” (README lines 131–134)

## Verified sound

| Statement / convention | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| Conventions: product cells give a CW structure on k(X×Y) (AT 4.5, Hatcher A.6) | X=Y=S¹; X=*; Dowker's pair (Hatcher pp. 524–525) | S¹×S¹ has cells 1,2,1, so χ=0=χ(T²). It is locally compact, so k(X×Y)=X×Y. k(*×Y)=Y with Y's cells. Dowker: product topology ≠ CW topology, but k(X×Y) = CW topology. | Pass. The owner is AT line 1768. Contract line 377 agrees. |
| The Hausdorff qualifier: CompHaus-test k (AT 4.8) against Hatcher's (X×Y)_c | Hausdorff X×Y; image g(S) of a test map g | g(S) is compact Hausdorff and S→g(S) is a quotient, so the closed sets agree and k(X×Y)=(X×Y)_c. Without T2 no CW claim is made. | Pass. The sentence states it at A.6's generality. |
| G3.1 via AT 8.11a (based loops of CW have CW type) | Ẽ=H̃⁰(−;ℤ), K₁=S¹; Ẽ=H̃¹, K₂=CP∞ | [S⁰,ΩS¹]_*=π₁S¹=ℤ=H̃⁰(S⁰). [S¹,ΩS¹]_*=π₂S¹=0=H̃⁰(S¹). [S¹,ΩCP∞]_*=π₂CP∞=ℤ=H̃¹(S¹). | Pass. Matches the *Needs:* at line 2307 and AT line 4728. |
| G5.0 via AT 4.5: shear (x,y)↦(x,μ(x,y)) on the k-CW product | X=S¹ group; wrong model (x,y)↦(μ,μ) | On π₁(T²)=ℤ²: (a,b)↦(a,a+b), det 1, inverse (a,c)↦(a,c−a). The wrong model gives (a+b,a+b), det 0. | Pass. Matches the *Needs:* at line 3656. |
| `rationalHurewicz` (G5.6 via AT 4.10 CW approximation) | X=S², k=2, n+1=1,2,3; Warsaw circle W | π₁=0→0. π₂=ℤ→H₂=ℚ, kernel 0. π₃=ℤ→H₃=0 is onto, with infinite-order kernel, and injectivity is not claimed at 2k−1. W has π_*=0 and H_{>0}(W;ℚ)=0. | Pass. Matches the *Needs:* at line 4581. |

The computed rows of the review of a02e7ef for untouched statements stand.

- **Gate.** The worker's gate passes (`build=0 OK`). My run gives 0 on every content check. Its `outside-folder=24` hits are the README.md and Suggested.lean of the 12 sibling folders the brief names as this pull request's own. `git diff --stat origin/main...HEAD` outside the 13 folders is empty.
- **Dependency check.** Output: `depcheck: 206 roadmaps, 1915 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- **Elaboration.** `lake env lean` on Suggested.lean exits 0 with exactly seven `sorry` warnings (lines 80, 96, 134, 155, 173, 189, 204). The file is unchanged, and `signatures.md` shows 0 lost binders.
- **Sources read.**
  - HatcherAT line 22693: Theorem A.6, printed p. 524 (PDF page 533). It covers CW structure on (X×Y)_c, with the locally compact and countable-cell cases.
  - Lines 19285 and 19338: Theorems 4E.1 and 4E.2, printed pp. 448 and 449.
- **AlgebraicTopology citations, resolved at this head.** §4.5 (line 1768: Kelley product on k(X×Y) for arbitrary Hausdorff CW; Theorem A.6 at line 1783), §4.8 (1975), §4.10 (2081), §5.5 (2366), §8.8d (4438), 8.11a (4728) and §2.5 (1171). AT's deletion of §2.3 breaks nothing: this README cites no AT §2.3.
- **Other cited sections at this head.** CC C1.1b, C1.2, C1.5, C2.4 and C2.5 (lines 472–1648), CKG K7.1 (2711), and TopK items T1.5, T1.6a–d, T7.0 and T7.1. None of these suppliers changed a heading since a02e7ef.
- **Dependency paragraphs against *Needs:* lines.** Layer 3 now agrees with G3.1, and Layer 5 with G5.0 and G5.6. This also clears the remark the previous review made on the Layer 5 paragraph.
- **Overlaps and the pull-request text.**
  - No open pull request drops a cited id.
  - The former-numbering table (lines 487–493) still maps the three dropped layer anchors.
  - The description orders #1808 and #1854 after this pull request.
  - The change adds no supplier, since AT already was one. No sentence of the title or description is contradicted at this head.

## Not verifiable

- none: the one source locator in the changed lines (HatcherAT, Theorem A.6) was read.

## Source issues

- none
