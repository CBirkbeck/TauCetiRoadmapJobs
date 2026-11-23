# Review of SpectralSubspacePerturbation (pull request #2622 at 30549d4)
Folder: `TauCetiRoadmap/OperatorTheory/SpectralSubspacePerturbation/`
**Verdict:** accepted

**Summary.** Accepted. This is an incremental re-review of the six lines changed since `185bed4`: the locator of §D.16 now points at Theorem 2, inequality (2) of Yu, Wang and Samworth, which is the statement of §D.16, and the sentence added to §D.3 is true at the pinned Tau Ceti. The pull request's description was read against this head and nothing in it is contradicted. There is no finding and no small correction; one format note is carried over (credited authors without a References entry). The three questions for the humans stand as before.

## N01 — Sz.-Nagy, Strausz, McEachin and Haagerup–Zsidó are credited in the text but have no entry in References

§B.16 (lines 540–541) credits the value `π/2` to Sz.-Nagy and its sharpness to McEachin, and Part A's kernel is named after Haagerup and Zsidó, for whom the README on main had a References line; the head's References has none of them. The entries for Sz.-Nagy and McEachin are in Seelmann2014 lines 893 and 905.

## Previous findings

The previous review (of `185bed4`) raised no finding, two small corrections and one format note.

- C01 (the locator of §D.16) — repaired: lines 1139–1140 read "Yu, Wang and Samworth 2015, Theorem 2, inequality (2), proved there for real matrices and a run of consecutive indices". YuWangSamworth2015 line 94 is that inequality.
- C02 (§D.3 reading as an open target) — repaired: lines 1018–1019 read "Tau Ceti has no named definition of the residual columns; the declarations of §D.8–§D.11 write them inline." True at the pin.
- N01 (References for Sz.-Nagy, Strausz, McEachin, Haagerup–Zsidó) — not repaired: carried as N01 above.

## Verified sound

| Statement | Instance | Left side (computed) | Right side (computed) | Result |
|---|---|---|---|---|
| Milestone D2, §D.16 and its new locator | `A = diag(1,0)`, `B = [[1,2/3],[2/3,0]]`, top eigenvector, `d = 1`, `Δ = 1` | `tan 2θ = 4/3`, `sin θ = 0.4472` | `2 min(0.6667, 0.9428)/1 = 1.3333`; source's gap `min(∞, 1) = 1` | holds; agrees with Theorem 2 (2) (line 94) |
| §D.16 against Theorem 1 of the source (the old locator) | same pair; eigenvalues of `B`: `4/3`, `−1/3` | Theorem 1's `δ = |1 − (−1/3)| = 4/3`, a gap in `B` | its bound `0.9428/(4/3) = 0.7071`, no factor 2, no `min` | a different statement; the change of locator is right |
| Milestone D1, §D.3 (sentence added), with §D.8, §D.9, §D.11 | same pair, `v = (0.8944, 0.4472)`, `λ(B) = 4/3` | `R = λ₁(A)v − Av = (0, 0.4472)`; `(1 − 4/3)v + (B − A)v = (0, 0.4472)` | `‖R‖² = 0.2`; §D.8: `Δ²·|⟪u₂,v⟫|² = 0.2`; §D.9: `4‖B−A‖_F² = 3.556`; §D.11: `1/3 + 2/3 = 1` | consistent; `R = 0` iff `v` is an eigenvector of `A` for `λ₁(A)` |

The rows for the untouched statements stand as in the previous review, of `185bed4`.

- Source locators checked against the text: 2 (YuWangSamworth2015 Theorem 1, lines 45–50; Theorem 2 with inequalities (2) and (3), lines 88–96). The seeded sample falls in the changed passages only at Milestones D1 and D2, checked above.
- Library declarations opened at the pin: 5. `LinearMap.IsSymmetric.norm_smul_sub_apply_eigenvectorBasis_le` (`TauCeti/Analysis/InnerProductSpace/YuWangSamworth/Basic.lean:129`), `…sum_norm_smul_sub_apply_eigenvectorBasis_sq_le_four_mul_frobenius_sq` (`Basic.lean:139`), `…sum_norm_smul_sub_apply_eigenvectorBasis_sq_le_four_mul_card_mul_sq` (`Basic.lean:169`), `…sum_sq_norm_frameResidual_le` and `…_of_opNorm` (`YuWangSamworth/FrameResidual.lean:58`, `:114`): each writes `(λ : 𝕜) • v − T v` in its statement. A search of the pinned Tau Ceti for a definition named after the residual finds only theorem names (`frameResidual_eq` and the two above), no `def`.
- Items without an *In Tau Ceti:* line at this head: §A.16, §B.5, §B.12, §B.16, §B.17, §B.19, §C.28, §C.29, §C.31, §D.15, §D.17, §D.18 and §D.3; the first twelve, with the left half of §D.19, are the description's list of open targets, and §D.3 now says why it has none.
- The pull request's description against the head: the section order (overview with four headline theorems, How to read the build, Conventions, the separation object, Parts A–D, Downstream consumers, Provenance, Scope and ownership, supplier contracts from Mathlib, Tau Ceti and SelfAdjointSpectralTheory, References), the absence of §B.18, the five declarations of `Suggested.lean` and the removal of the statements the library proves, and the equality example of §C.30 (line 966) all agree. No sentence is contradicted and no removed layer, item or supplier is left unstated.
- Record against main: the merge base has four Parts; the head keeps all four letters and subjects (only the dash in each heading became a colon). The change since `185bed4` adds, removes or renumbers no layer or item.
- Elaboration of `Suggested.lean`: five `declaration uses 'sorry'` warnings, nothing else. The file did not change since `185bed4`.
- Automatic checks at this head, run again: all passed. Dependency check output: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`. Nothing changes outside the folder, the family index included.

Overlap check: read OperatorTheory (family index), PrincipalAngles, SelfAdjointSpectralTheory, EigenvalueIterations, Majorization, SchrodingerOperatorsAndSpectralTypes as in the previous review; nothing shared, and the change touches no ownership statement. No open pull request changes this roadmap, and no id it cites or defines is dropped.

Source independence: changed passages only: 2 passages compared with 1 source (YuWangSamworth2015), none shared (the added text is a locator and a sentence about the library); largest share Davis–Kahan 1970, 6 of about 24 locators, not readable; the change adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: §B.16 is Theorem 3.1 of Seelmann (2014) and Theorem 2.7 of Albeverio–Makarov–Motovilov (2003); §C.28–§C.31 are the Davis–Kahan `tan Θ` and `tan 2Θ` theorems that Nakatsukasa (2012) and Kostrykin–Makarov–Motovilov (2004) extend; Part D is Yu–Wang–Samworth (2015), used by the statistics roadmaps the README names. Rests on these sources, read.

## Not verifiable

- Davis–Kahan 1970: no open copy. The attributions of §C.17, §C.18, §C.27–§C.29, §C.31 were checked by computation and against restatements only, as in the previous review.
- Rosenblum 1956, Davis 1963, Bhatia's Theorem VII.2.3 and Bhatia–Davis–McIntosh 1983, Theorem 4.1: paywalled or without an open copy.
- The lower bound `√(3/2)` of §B.16: the extracted text of AlbeverioMakarovMotovilov2003 lines 399–401 does not fix the grouping under the root; `√(3/2)` is the only reading above the trivial bound 1.

## Source issues

- **Misprint** in AlbeverioMakarovMotovilov2003 at Theorem 2.7, formula (2.13), p. 9: the source says the kernel's Fourier integral equals `1/x` for `|x| ≥ 1/d`; it should be for `|x| ≥ d`, as in Seelmann2014 Theorem 3.1; affects nothing.
- **Misprint** in YuWangSamworth2015 at the sentence after Theorem 4, p. 7: the source says the theorem concerns the right singular vectors of `Σ` and `Σ̂`; it should be of `A` and `Â`; affects nothing.

## For the human reviewers

- Licence: `TauCetiRoadmap/OperatorTheory/SpectralSubspacePerturbation/Suggested.lean` line 2 reads "Copyright (c) 2026 Kitware, Inc."; README lines 1239–1246 name an Apache-2.0 implementation (AIQ DKPS, adapted from the Spectra Formalization Project). The five declarations were not compared with those repositories.
- Scope of an item: §B.12 on main was stated over `ℝ` or `ℂ`; the head states it over `ℂ` only and sends real scalars to §B.13 (the description says so). Whether the real statement is wanted as a target is yours to decide.
- Not tested: Davis–Kahan 1970, the source with the largest share of the locators and called "the principal worked source" in References (README line 1376), could not be read legally, nor could Bhatia–Davis–McIntosh 1983 and Rosenblum 1956; wording and arrangement were not compared with them.
