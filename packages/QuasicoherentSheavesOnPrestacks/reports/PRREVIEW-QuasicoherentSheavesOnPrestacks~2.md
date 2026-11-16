# Review of QuasicoherentSheavesOnPrestacks (pull request #2450 at 6e816c2)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: "Prove that `QCoh(X/Γ) ≃ QCoh(X)^{hΓ}`, … (`QCoh` is the right Kan extension along the Yoneda embedding and so carries colimits of prestacks to limits: GR-I Chapter I.3, §1.1.3, p. 144; SAG Lemma 6.2.1.12, p. 488); … `QCoh([X/Γ]) ≃ QCoh(X/Γ)` (GR-I Chapter I.3, Corollary 1.3.8, p. 147)." 7.2 gains the same locator.
- R02 — repaired: the summary block now reads "Descent holds along flat hypercovers … proved by truncation and comonadicity, and agrees with the descendable descent of EnhancedDerivedSheaves on descendable faithfully flat maps of ordinary rings". This matches README lines 477 and 481.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| 7.2 `QCoh(\|G^{×_S •} ×_S X\|) ≃ lim_Δ QCoh(G^{×_S n} ×_S X)` | `G = 1`; `X = ∅`; constant `ℤ/2` over `𝔽₂`, `X = S`; `S₃` acting trivially over `𝔽₃` | constant diagram, so `QCoh(X)` on both sides; `0 = lim 0`; `π₀Map(O,O[1]) = H¹(ℤ/2;𝔽₂) = 𝔽₂` on both sides, 0 for the orbit-set model; `H¹ = H² = 0`, `H³ = 𝔽₃` on both sides | holds. GR-I line 7354 (p. 144) gives the right Kan extension. SAG line 17758 (p. 488) gives limit preservation, applied to `QCoh` at line 17894 | none |
| 7.3 `QCoh(X/Γ) ≃ QCoh(X)^{hΓ}` | `Γ = 1`; `ℤ` acting trivially on `Spec C`; `ℤ/2` acting by conjugation on `Spec ℚ(i)` | `QCoh(X)` on both sides; `H¹(ℤ;C) = C` on both sides, 0 for the coarse quotient; `End(O) = ℚ(i)^{ℤ/2} = ℚ` and `Ext¹ = H¹(ℤ/2;ℚ(i)) = 0` (normal basis), so `D∞(ℚ)` on both sides | holds; same two locators as 7.2 | none |
| 7.3 `QCoh([X/Γ]) ≃ QCoh(X/Γ)` | `X = ∅`, `Γ = 1`; `ℤ/2` acting on `Spec ℚ(i)` | `[∅/1] = Spec 0`, so `QCoh = 0` on both sides; the hypersheafification is `Spec ℚ` (a Galois torsor), so `D∞(ℚ)` on both sides | holds; GR-I line 7463 (Corollary 1.3.8, p. 147) | none |

The rows for statements the change does not touch stand as in the previous review of `6130027`.

- Source locators checked against the cached texts, number and page:
  - GR-I §1.1.3, line 7354, p. 144 (PDF page 181, offset 37);
  - GR-I Corollary 1.3.8, line 7463, p. 147;
  - SAG Lemma 6.2.1.12, line 17758, p. 488.
- Cross-roadmap citations in the two changed paragraphs resolved:
  - EnhancedDerivedSheaves `homotopyFixedPoints` (E5:presentability.3, for finite G, on main);
  - HabiroCohomologyFoundations §§1.27–1.28 at its open head;
  - LanglandsParameterStacks §1.8.
- Gate at `6e816c2`: every check is 0 and the result is OK. My depcheck printed `depcheck: 257 roadmaps, 2447 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The diff outside the folder is empty.
- Elaboration: `lake env lean` on `TauCetiRoadmap/QuasicoherentSheavesOnPrestacks/Suggested.lean` exits 0. The only warning is `sorry` at line 79. The file is unchanged since `6130027`, so the previous `#check` comparison with README 8.6 and the one-tactic probes still hold.
- Pull-request text, checked against this head:
  - the summary block and the prose match it: Layer 8 headlines, the exclusions at README lines 48–49, AnalyticStacks at line 946, the single Lean declaration and the validation counts;
  - the description does not need to mention the locator-only change.
- Overlap check: the previous review read EnhancedDerivedSheaves (main and its two open revisions), SchemeAndStackFoundations, SchemeKTheoryOperations, HypercompletenessAndCoherence, InfinityCategoryTheory and AnalyticStacks, and that reading stands.
  - Shared objects in the changed passages: `homotopyFixedPoints` for finite G is owned by EnhancedDerivedSheaves and cited. `QCoh` of realizations and of discrete quotients is owned here.
  - Searching main and every open head for `QCoh(X/Γ) ≃ …` finds only this roadmap. The overlap tool lists no dropped ids, no second copy and no other pull request changing this roadmap.
- Source independence: changed passages only.
  - 3 passages were compared with 2 sources (GR-I line 7354, SAG line 17758). They share only the standard name "right Kan extension".
  - The largest share is SAG, 70 of 219 locators: the change adds two SAG and two GR-I locators.
  - No layer was added, removed or reordered, so the comparison of contents was not repeated. The previous result was independent of SAG and GR-I.
- Remark, untouched pairing: GR-I Corollary 1.3.8 (7.3) and SAG Proposition 6.2.3.1 (7.2) state invariance under fpqc sheafification. The hypersheafification `[X/G]` is SAG Remark 6.2.3.3 (line 17901, p. 492), which 3.3 already cites.

## Not verifiable

- None for the changed passages. The Stacks tags listed in the previous review are outside the change and were not fetched.

## Source issues

- none

## For the human reviewers

- SAG has the largest share of locators (70 of 219) and HA has 37. Both are author-posted PDFs of unpublished books, and SAG's title page reads "Under Construction" (February 2018). The other main sources (GR-I, BZFN, HR-perf, HTT) are published.
