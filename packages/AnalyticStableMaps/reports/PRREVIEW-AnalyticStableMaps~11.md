# Review of AnalyticStableMaps (pull request #2529 at 1da2f12)

**Verdict:** accepted

**Summary.** Accepted. This head repairs all three findings of the previous round. §0.6–§0.8 now cite only declarations that exist in the pinned Tau Ceti. §0.7 identifies its operator with HeegaardFloer F2.6e and cites F2.6e as a supplier. The finite-rank holomorphic frames are taken from ComplexKahlerGeometry §4.1–§4.2 instead of being stated again. The repaired passages contain no mathematical error: the real-frame pullback of §0.8 is now well defined, and the F2.6e index matches §0.7's. There are no small corrections or format notes, and nothing is left for a human to decide.

## Previous findings

- R01 — repaired: "`IsSubbundleFrameOn`, `subbundleTopology` and `IsSubbundleFrameOn.trivialization` (TauCeti/Topology/VectorBundle/Subbundle.lean) and `IsSubbundleFrameOn.contMDiffOn_coordChangeL`"; every operator is now "a smooth real Cauchy–Riemann operator … in the sense of PseudoholomorphicCurveAnalysis PH6.2". All of these exist at the pin, and no unpinned name remains.
- R02 — repaired: "Prove that for an embedded sphere in a four-manifold (`m = 2`, `Z(du) = 0`), `N_u` is HeegaardFloer F2.6e's normal line … and `D_u^N` is F2.6e's quotient real Cauchy–Riemann operator up to the constant factor". F2.6e is now in §0.7's *Needs* and in the contract. The Downstream consumers list now says F2.6e "is supplied to §0.7".
- R03 — repaired: "ComplexKahlerGeometry §4.2's Koszul–Malgrange theorem, with the holomorphic sections and frames of its §4.1, applies to it and is consumed here". The Cauchy–Green contraction route was removed, and §4.1–§4.2 were added to *Needs* and the contract.
- C01 — repaired: the text now has "Wendl 2010, Theorem 3, Corollary 3.13 …", "§3.2 (Lemma 3.8, the tangential identity)" and "Wendl 2023, §3.2 and Example 3.9", with the arXiv versions named in the References.
- C02 — repaired: "in local real frames `e_1, …, e_{2r}` of E, r its complex rank, with real coefficients `f_i`, the Leibniz convention of §0.2".
- C03 — repaired: the description now reads "HeegaardFloer F2.6e supplies this roadmap and keeps its embedded-sphere operator, which §0.7 identifies with its own."
- N01 — repaired: "It is super-rigid for every J for which it is J-holomorphic", and the Layer 2 Examples have the same qualifier.
- N02 — repaired: "whose derivative in the coordinate t is `(2t, 3t²) = 2t·(1, (3/2)t)`".

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §0.6 holomorphic frames through ComplexKahlerGeometry §4.2 | rank r over a Riemann surface; D complex-linear | `Λ^{0,2}` of a complex line is 0, so D is integrable. Real Leibniz plus J-linearity gives `D((a+ib)ξ) = (∂̄a)ξ + aDξ + (∂̄b)Jξ + bJDξ`, the complex Leibniz rule | CKG main line 917 gives frames at every finite rank; transition formulas are in §4.1 | none |
| §0.6 antilinear part, now cited to PH6.2 | `D = D^ℂ + A` | `D(Jξ) − JDξ = −2JAξ`; PH6.2 (PH main line 1090) states the decomposition | holds | none |
| §0.6 `T_u` from pinned frames | `{F, JF}` near a critical point; `{du∂_s, du∂_t}` elsewhere | `ι = Fin 2`, `𝕜 = ℝ`, U open. `contMDiffOn_coordChangeL` (Subbundle.lean:82) needs `ContMDiffVectorBundle`, supplied for `u*TX` by Mathlib Pullback.lean:39 | hypotheses met | none |
| §0.6 cuspidal-cubic Check (reworded) | `t ↦ (t², t³)`; `s ↦ (s, s³)` at `t = ∞` | derivative `(2t, 3t²) = 2t(1, 3t/2)`, so ord 1 and `T_u(0) = ℂ×0`. `(1, 3s²) ≠ 0`. Z = 1, `c₁ = 2 + 1 = 3` | holds | none |
| §0.7 identification with F2.6e | embedded sphere A in a 4-manifold | §0.7: `D(u) − 0 = −2 + 2c₁(A)`, with `c₁(A) = 2 + A·A` (adjunction). F2.6e: `deg N = A·A`, index `2 + 2A·A`. Both `2 + 2A·A` | agree | none |
| §0.7 normalization factor | HF F1.2 `∂̄ = (∂s+i∂t)/2` (HF line 2138); F2.4 variation `Y∘du∘j` (line 2709), unhalved | factor 1 or 2 depending on HF convention; a nonzero constant leaves kernel and cokernel unchanged | the hedge is correct | none |
| §0.7 chart comparison | `−2J∂̄_J u = −J du + du∘j`; `u = (z, 0)`, `ξ = (0, η)` | linearization at a zero is `−2J D_u`; J preserves `T_u` so it descends; both sides `dη∘j − i dη` | holds | none |
| §0.7 J-invariant metric complement | `w ⊥ T`, `v ∈ T` | `g(v, Jw) = −g(Jv, w) = 0` since `Jv ∈ T` | complement is J-invariant | none |
| §0.8 pullback in real frames (sample) | frame change `e′_k = Σ a_ik e_i`, a real | `∂̄(a∘φ) = (∂̄a)(φ)∘dφ` for holomorphic φ, so both expressions equal `Σ ∂̄f_i φ*e_i + f_i De_i(φ)∘dφ`; in a complex frame the discrepancy was `−2bJAe` | well defined | none |
| §0.8 locators (sample) | wendl23 | §3.2 starts line 1169 (p. 24); pullback relation at line 1186; Example 3.9 at line 1189 (p. 25), giving `N_u = φ*N_v` and `D_u^N = φ*D_v^N` | match | none |
| §2.24 locators | wendl10 | §3.2 at line 960 with Lemma 3.8 at line 1175; §3.4 at line 1387 with Theorem 3 at line 1451 and Cor. 3.13 at line 1462 | match | none |
| §2.24 super-rigid Check | exceptional sphere, cover of degree d | `d_0 = (2−3)·2 + 2·1 = 0`; `deg φ*N = −d < 0`, so the kernel is 0 | holds, with qualifier | none |
| Supply direction (R02) | F2.6e and §0.6–§0.8 | no roadmap on main or open cites §0.6–§0.8 back; HF #2477 keeps §4.6e at its line 3114 | no cycle | none |

Rows for statements this diff did not touch stand as in the previous review, of 19aa153.

- Source locators checked against the text this round: 6. In wendl10: §3.2, Lemma 3.8, §3.4, Theorem 3 and Cor. 3.13. In wendl23: §3.2 with Example 3.9, and §2 at lines 437–444.
- Library declarations opened at the pins: Tau Ceti `Topology/VectorBundle/Subbundle.lean` 93 and 134 (`subbundleTopology`, `IsSubbundleFrameOn`) and 363 (`trivialization`); `Geometry/Manifold/VectorBundle/Subbundle.lean` 82; `QuotientRange.lean` 48 and 122; `Distribution/VectorBundle.lean` 191. That last file only assembles tangent distributions, so §0.6's own assembly of `T_u` is needed. Also Mathlib `Geometry/Manifold/VectorBundle/Pullback.lean` 39. No removed or unpinned name remains in the README.
- Cross-roadmap citations resolved on main: HeegaardFloer F2.6e (§4.6e, line 3029), F2.2a (line 2742) and F1.2 (line 2094). ComplexKahlerGeometry §4.1 (line 854) and §4.2 (line 910), whose headings are unchanged in the open revision #2536. PseudoholomorphicCurveAnalysis PH6.2 (line 1084).
- Automatic checks at this head all passed. The dependency check printed `depcheck: 200 roadmaps, 2191 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- `lake env lean` on `TauCetiRoadmap/AnalyticStableMaps/Suggested.lean` exited 0 with three `sorry` warnings (lines 105, 128, 161). The file is unchanged since 19aa153, so its `#check @` comparison stands as before.
- The diff outside the roadmap folder is empty. The PR title and description match this head.
- Overlap check: read HeegaardFloer (main and open #2477), ComplexKahlerGeometry (main and open #2536), PseudoholomorphicCurveAnalysis and TaubesGromov (main), DGFloer, AlgebraicGromovWittenTheory, TeichmullerGeometry and MotivicStructuresInModuliOfCurves (open), and GromovWittenTheory and ComplexCurveModuli (main). Two objects are shared. The embedded-sphere normal operator is owned by HeegaardFloer F2.6e, and §0.7 cites it. Finite-rank holomorphic frames are owned by ComplexKahlerGeometry §4.2, and §0.6 cites it. No other roadmap states a generalized normal bundle, a normal Cauchy–Riemann operator or super-rigidity.
- Source independence: changed passages only. 6 passages were compared with 2 sources (wendl23 §3.2 lines 1174–1191, wendl10 Lemma 3.8 and Theorem 3); nothing is shared beyond the forced formula `(φ*D)(η∘φ) = φ*(Dη)`. The largest share of locators is pardon13, about 28 of roughly 70, and the diff does not change it. No layer was added, removed or reordered, so the comparison of contents with pardon13 stands as in the previous review: independent.
- Research link: §0.6–§0.8 and §2.24 are the generalized normal bundle, normal operator and regularity criterion of Wendl (2010, Theorem 3, Cor. 3.13). They also give the super-rigidity of Wendl (2023, Def. 2.3), which underlies his generic transversality of multiple covers. Layers 5–9 are Pardon's (2013) implicit atlas. This line rests on the README's References and the texts read.

## Not verifiable

- Ivashkovich–Shevchishin, Invent. Math. 136 (1999), §1 (§0.6, by locator): the publisher's page is paywalled and no arXiv copy was found. The manifest settles it as uncertified, and wendl10 line 1303 attributes the same observation to it.
- McDuff–Salamon and Robbin–Ruan–Salamon: paywalled and cited by locator only, as before; this round's changes do not touch them.

## Source issues

- none

## For the human reviewers

- none
