# Review of BordismFormalGroups (pull request #1807 at 8cb420c)

**Verdict:** accepted

No findings. `TauCetiRoadmap/BordismFormalGroups/` is byte-identical to `3af9fd1`. The seven commits since then change only sibling folders of this pull request. Every statement this roadmap consumes from them still resolves and still says what this roadmap uses.

## Previous findings

- None: the review of `3af9fd1` raised no finding.

## Verified sound

The table covers the sibling statements that this roadmap consumes and that sit in files changed since `3af9fd1`.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| GeneralizedCohomology G2.1 CW products, changed (README 131–136). Consumed through G2's pointed CW category and F6.2's J_j(Y) ⊂ image of Y^j | X=Y=S²; X=Y=ℝP∞; `hatcher-at` line 22693 | S²×S²: cells in dims 0,2,2,4, compact, so k(X×Y)=X×Y. ℝP∞×ℝP∞: countably many cells, so (X×Y)_c=X×Y | Theorem A.6 at printed p. 524 says exactly this, for CW (Hausdorff) X, Y | — |
| AlgebraicTopology §8.10 product comparison sentence, changed (README 4605–4607). Consumed via §§8.8c–8.10 | A•=Γ(ℤ/2[1]), \|A•\|=ℝP∞ | \|A•×A•\| ≅ k(ℝP∞×ℝP∞) = ℝP∞×ℝP∞. H¹(−;𝔽₂) has rank 2 on both sides. Addition pulls x back to x⊗1+1⊗x | holds; §4.9 (line 2032) is in Layer 4 as stated | — |
| TopologicalKTheory T2.5 item 5, ψᵏβ_n=kⁿβ_n (README 1144, 1216). Consumed by F6.3 | n=0, 1, 2 | ψᵏ(1)=1=k⁰. ψᵏ(1+β)=(1+β)ᵏ=1+kβ, since β²=0. ψᵏ(β⊠β)=kβ⊠kβ=k²β₂ | holds; T2.5 is untouched by the diff | — |
| TopologicalKTheory Conventions β=[L]−1 with L≅O(−1) (README 283). Consumed by F2.1 (line 761) | CP¹=S² | the rank of [L]−1 is 0, so β ∈ K̃(S²); [L]²=1+2β (the T4 Check that the diff added agrees) | consistent with line 761 | — |
| CharacteristicClasses Conventions c₁(O(−1))=−h (README 148). Consumed by F6.6 (line 3583) | CP¹ | ∫h=1, so ⟨c₁(O(−1)),[CP¹]⟩=−1. F6.6 gives the image of λ_i=O(−1) as −h_i | agrees | — |

The rows for this roadmap's own statements stand as in the review of `3af9fd1`: the three headline theorems, the seeded sample, M1–M14 and the rows carried from `c8821a4`.

- **Folder.** `git diff 3af9fd1..HEAD -- TauCetiRoadmap/BordismFormalGroups` is empty.
- **Gate.** The worker's gate at `8cb420c` passes every check (`build=0`). In my rerun every check is 0 except `outside-folder=24`. Those 24 files are the README and `Suggested.lean` of the 12 sibling folders that the brief names as this pull request's own. `git diff --stat origin/main...HEAD` with all 13 folders excluded is empty.
- **Dependency check.** Output: `depcheck: 207 roadmaps, 1926 edges, 0 problem(s)`. No UPWARD or CYCLE line.
- **Elaboration.** `lake env lean` on `Suggested.lean` reports three `sorry` warnings (lines 75, 90 and 116) and nothing else. I ran `#check @name` on the four declarations from a scratch copy. Each elaborated type equals the one in `signatures.md` and in the previous review, and no binder is lost.
- **Cross-roadmap citations, resolved at this head.**
  - AlgebraicTopology §§5.5, 8.3, 8.7, 8.8, 8.8c and 8.10 are at lines 2352, 3879, 4172, 4237, 4327 and 4584.
  - AlgebraicTopology §2.3 was deleted, and this roadmap cites it nowhere. Its consumer line (5357) still names this roadmap.
  - All 24 GeneralizedCohomology ids cited here (G2–G5.7) have headings.
  - TopologicalKTheory T2.5 and its Conventions, and CharacteristicClasses C3 (1758–2153) and its Conventions, resolve.
  - None of the seven commits adds or removes a mention of BordismFormalGroups.
- **Overlap.**
  - The dropped anchor `#f65-local-group-actions-and-completion-comparisons` occurs in no file at this head. Main's link to it is pinned to a blob.
  - #1808 and #1854 are ordered after this pull request in its merge-order block.
- **Pull request text.**
  - I checked the BordismFormalGroups paragraph and the summary sentence against the head.
  - No TangentialBordism, HomotopySpheres or EllipticCohomology supplier is cited.
  - F2.2, F2.4, F4.1 and F6.2 (the James construction, line 2161) are owned here.
  - F1.5 carries Cartier's theorem and Hazewinkel's and Araki's generators (548–561). F3.1 cites G3.4 and G3.9 (1184, 1210–1211).
  - `Suggested.lean` states the three named headlines.
- **Sources.** I checked one locator against its text: Hatcher Theorem A.6 (`hatcher-at` line 22693, printed p. 524), for the changed G2.1 sentence.

## Not verifiable

- Unchanged since the review of `3af9fd1`: the uncertified sources stay cited by locator only, and no changed text cites them.

## Source issues

- none
