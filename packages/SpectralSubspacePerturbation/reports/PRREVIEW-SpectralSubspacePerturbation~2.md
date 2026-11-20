# Review of SpectralSubspacePerturbation (pull request #2622 at 828f752)
Folder: `TauCetiRoadmap/OperatorTheory/SpectralSubspacePerturbation/`
**Verdict:** accepted

**Summary.** Accepted. Both findings of the previous round are repaired. The sharp `π/2` of §2.16 is now credited to Seelmann (Theorem 3.1) and Albeverio–Makarov–Motovilov (Theorem 2.7), with Bhatia–Davis–McIntosh credited only with a universal constant. Every new locator says what the cited text says at that place. The three changes to `Suggested.lean` elaborate and match the Tau Ceti definitions they now use. There are two small corrections and one format note, none blocking. For the humans: the licence question and the three sources nobody could read are unchanged from the previous round.

## C01 — The lower bound `√3/2` for the best constant is weaker than the trivial bound 1, so it gives the reader no information

The Summary (lines 10–11) says that Bhatia, Davis and McIntosh proved the pairwise bound "with a universal constant, the best one lying between `√3/2` and `2`". §2.16 (line 248) says the same. A reader is left thinking the best constant could be below 1, but scalars already rule that out. Take `A = δ` and `B = 0` on `ℂ`: then `X = C/δ`, so `δ‖X‖ = ‖C‖` and the best constant is at least 1. The Check of §2.16 already gives 1.2168. The figure is a faithful copy of AlbeverioMakarovMotovilov2003 lines 397–402 (Remark 2.8), which reports Bhatia–Davis–McIntosh; the 1983 paper itself could not be read.

One repair would be to drop the lower bound from the Summary ("with a universal constant at most `2`"). In §2.16 you could keep the attributed report and add that the scalar case already gives `c ≥ 1`.

## C02 — The §4.19 locator does not say that Yu, Wang and Samworth prove the bound only for real matrices and a run of indices

§4.17 qualifies its citation of Theorem 2 with "proved there for real matrices and a run of consecutive indices". §4.19 (lines 524–525) cites "Theorem 4, the remark after it, and steps (10)–(11) of its proof" with no such qualifier. Yet §4.19 is stated for an arbitrary index set `s`, over `𝕜`, with the gap `Γ` taken across `s`. YuWangSamworth2015 lines 193–197 assume real `p × q` matrices and consecutive indices `r ≤ … ≤ s ≤ rank(A)`. The bound itself is right at the README's generality: (10) together with the first inequality of (11), lines 291–294, gives `Γ² ‖sin Θ‖_F² ≤ 4|s|((a + â)ε)²`. Adding the same qualifier as in §4.17 would say exactly what the source proves.

## N01 — Sz.-Nagy and McEachin are named in §2.16 but their papers are not in References

§2.16 (lines 248–249) credits the value `π/2` to Sz.-Nagy and its sharpness to McEachin, through AlbeverioMakarovMotovilov2003 Remark 2.8. A reader who wants the primary texts has to go through that paper. Seelmann2014 lines 893 and 905 give the entries: McEachin, Proc. Amer. Math. Soc. 115 (1992), and Sz.-Nagy, Math. Nachr. 9 (1953).

## Questions for the author

- The family's progress report (`TauCetiRoadmap/OperatorTheory/PROGRESS.md`, line 46) says that Tau Ceti has gained, after the pinned commit, Rosenblum's theorem for unbounded operators (`LinearPMap.Intertwines.eq_zero_of_disjoint_spectrum`), its bounded case and the dilation pairwise-gap bound. None of them is at the pin (no `Rosenblum.lean` or `HermitianDilation/SinTheta.lean` there), so keeping §2.17, §2.19 and §4.15 as targets is right today. Is a move of the pin planned? When it moves, these targets become restatements of library theorems.

## Previous findings

- R01 — repaired: §2.16 now reads "(Seelmann 2014, Theorem 3.1; for weak solutions, Albeverio, Makarov and Motovilov 2003, Theorem 2.7). Bhatia, Davis and McIntosh proved the bound with a universal constant". The Summary, §2.12, §4.15 and the docstring of `mul_norm_le_pi_div_two_mul_norm_of_sylvesterEquation` were corrected the same way.
- R02 — repaired: every target resting on the literature now has a theorem, formula or named theorem. The Haagerup–Zsidó entry is gone, and the kernel is "which Tau Ceti calls the Haagerup–Zsidó kernel". Davis–Kahan 1970 and Rosenblum 1956, which have no open copy, are cited by theorem name or next to AMM Lemma 2.5.
- C01 — repaired: the docstring of `yuWangSamworth_eigenvector_le` reads "It is the case `d = 1` of `yuWangSamworth_alignedBasis_le` … kept as a check that the hypotheses of that theorem specialise to a single eigenvector."
- C02 — repaired: `hBv` and `μ` are dropped; "That `v` is an eigenvector of `B` is part of `hcorr`."
- C03 — repaired: the description's paragraph on suppliers names PrincipalAngles, Majorization and PolarDecomposition as no longer suppliers, and SelfAdjointSpectralTheory as the only roadmap supplier.
- N01 — repaired: Provenance reads "That implementation adapted its Sylvester and `sin Θ` material from the Spectra Formalization Project (upstream revision …); its kernel material is not adapted from it."
- N02 — repaired: Convention 3 reads "`X` solves it with `C = 0` exactly when `XB ⊆ AX`, which is Tau Ceti's `LinearPMap.Intertwines B A X`", and §2.17 in Lean takes `(hint : B.Intertwines A X)`.

## Verified sound

| Statement | Instance | Left side (computed) | Right side (computed) | Result |
|---|---|---|---|---|
| §1.16 two-sided decay | `a = 1`, `s = 2`, `x = ±10`; `s = −5` | `e^{−10}/100 = 4.54·10⁻⁷` at both signs; `|x|⁵e^{−|x|} → 0` | tends to 0 along cocompact | holds; text change removes attribution only |
| §2.12 locator | AMM (2.12) against README route | `∫ δk(δt)e^{it(α−β)}dt = δ/(α−β)` for `|α−β| ≥ δ` | `m_δ(C)ᵢⱼ = δCᵢⱼ/(αᵢ−βⱼ)` | consistent (AlbeverioMakarovMotovilov2003 lines 374–388) |
| §2.12 Check | `A = diag(0,2)`, `B = diag(1,−1)`, `C = H/√2` | eigenvalues of `[[−1,1],[1,−1/3]]` are `(−2 ± √10)/3`; `‖m_δ(C)‖ = 1.21676` | `‖C‖ = 1`, `π/2 = 1.5708` | Check correct |
| §2.16 headline | same pair, `δ = 1`; Seelmann Thm 3.1 with `B₀ = B`, `B₁ = A`, `Y = X`, `T = −C` | `δ‖X‖ = 1.2168` | `(π/2)‖C‖ = 1.5708`; Seelmann's `d ≥ δ` | holds; locator matches (Seelmann2014 lines 516–543) |
| §2.16 attribution | AMM Remark 2.8; Seelmann proof | BDM: `√3/2 ≤ c ≤ 2`; Seelmann cites BDM Theorem 4.1 | scalar case forces `c ≥ 1` | wording faithful; C01 |
| §2.17 Lean | `B.Intertwines A X` unfolded at the pin | `X` maps dom `B` into dom `A`, `X(By) = A(Xy)` | the old `hmaps`, `hint`; the reversed order does not typecheck (`X : F → E`) | same statement |
| §2.17 degenerate | `E = 0`; `A = 0`, `B = 1` on `ℂ` | `A.spectrum = ∅`, `X : F → 0` is 0; `X·1 = 0·X` gives `X = 0` | `X = 0` | holds |
| §2.17 locator | AMM Lemma 2.5: bounded `C` on the target of `X` | AMM's `C` is README's `A` (target), AMM's `A` is README's `B` | "for bounded `A`" | orientation correct (lines 337–354) |
| §2.19 | `A = diag(0,1)`, `B = diag(2,3)` | `(aᵢ − bⱼ)Xᵢⱼ = 0` | `X = 0`; AMM credits Krein first (line 337) | holds |
| §3.28 Check | `A = diag(0,1)`, `φ = π/4` | `δ tan φ = 0.5` | `‖R‖ = 0.5`; `δ sin φ = 0.3536` | equality; "the `tan Θ` theorem" name not checkable |
| §3.29 | name "generalized `tan Θ` theorem" | a search result for Nakatsukasa (LAA, 2012) names a generalized `tan θ` theorem with unequal dimensions | Davis–Kahan 1970 unread | under Not verifiable |
| §3.31 Check | `A = diag(1,0)`, `H = [[0,h],[h,0]]` | `‖P_U − P_V‖ = 0.61541` (`h = 2`), `0.70534` (`h = 100`) | KMM (1.2): `sin(½ arctan 2h)`, `< √2/2 = 0.70711` | equality with (1.2); (1.4) gives the route's `tan(½ arctan(·)) < 1` |
| §4.15 | `A = 1`, `Â = −1` on `ℂ`, `Ω = (0,∞)`; Seelmann Prop 2.4 with sets `σ(D(A)) ∩ Ω`, `σ(D(Â)) ∖ Ω` | `δ‖P P‖ = 2` | `(π/2)·2 = π` | holds; locator matches (Seelmann2014 lines 233–236) |
| §4.17 | YWS sharpness example, `d = 3`, `ε = 0.1` | `‖V̂Ô − V‖_F = √6 = 2.449` | `2√2·√3·1.1/2 = 2.694` | constant sharp as `ε → 0`; Theorem 2 (3) matches (lines 87–96) |
| §4.18 Lean | `A = diag(1,0)`, `B = [[1,2/3],[2/3,0]]`, `Δ = 1`, `n = 2` | `‖v − u‖ = 0.45951`; `‖−v − u‖ = 1.94650` | `2√2·(2/3) = 1.88562`; eigenvalues of `B` `4/3`, `−1/3` | holds; phase needed; `hcorr` gives `Bv = (4/3)v` |
| §4.18 degenerate | `n = 1` | `u⊥ = 0`, `hgap` vacuous for every `Δ` | `c v = u` for some `|c| = 1`, left side 0 | holds |
| §4.19 locator | YWS (10) and the first inequality of (11) | `Γ²‖sin Θ‖_F² ≤ 4d‖Â†Â − A†A‖²` | `‖Â†Â − A†A‖ ≤ (a + â)ε` | matches; source scope narrower (C02) |
| Convention 3 | `C = 0` in `SylvesterEquation A B X C` | dom `B` ↦ dom `A`, `AXy = XBy` | `Intertwines B A X` (Topology/Algebra/Module/LinearPMap/Intertwining.lean:39) | equivalent |
| Summary `π/2` | Tau Ceti kernel at the pin | `∫‖k‖ = π/2` (Mass.lean:134) | `∫ e^{itx}k(t)dt = 1/x` for `|x| ≥ 1` (Fourier.lean:140) | "least `L¹` norm … attaining it" correct |

The rows for statements this change does not touch (§2.5 and the Layer 1, 3 and 4 examples) stand as in the previous review, of `1875d20`.

- Source locators checked against the text: AlbeverioMakarovMotovilov2003 Lemma 2.5, Theorem 2.7, (2.12), Remark 2.8 (lines 337–414). Seelmann2014 Proposition 2.4 and Theorem 3.1 with its proof (lines 233–236, 516–547). KostrykinMakarovMotovilov2004 (1.2) and (1.4) (lines 31–67). YuWangSamworth2015 Theorem 2 (3), Corollary 3, Theorem 4 and the remark after it, and (10)–(11) (lines 87–96, 146–153, 193–204, 288–294). The arXiv versions cited in References (v3, v1, v1, v1) are the versions read.
- Library declarations opened at the pin, Tau Ceti: `LinearPMap.Intertwines` (Topology/Algebra/Module/LinearPMap/Intertwining.lean:39), `CorrespondingEigenblocks` (Analysis/InnerProductSpace/Spectral/Eigenframe.lean:161), `IsEigenfamily` (same file, line 41), `integral_exp_mul_I_mul_reciprocalKernel` (Fourier/HaagerupZsido/Fourier.lean:140), `integral_norm_reciprocalKernel` (Fourier/HaagerupZsido/Mass.lean:134). No Rosenblum theorem or dilation pairwise-gap theorem at the pin.
- Elaboration of `Suggested.lean`: five `declaration uses 'sorry'` warnings and nothing else. Elaborated signatures (`#check @`) of all five were compared with the README: no binder lost, no change needed. A one-tactic probe (`simp`, `rfl`) on the two changed statements leaves the goals `X x = 0` and the existential open.
- Automatic checks at this head: all passed. Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`. No change outside the folder.
- Cross-roadmap citations: unchanged by the diff; none dropped by an open pull request.

Overlap check: read OperatorTheory (family index), PrincipalAngles, SelfAdjointSpectralTheory (main and its open revision), Majorization, OperatorIdeals and SchrodingerOperatorsAndSpectralTypes, as before; nothing shared. The change adds no object. Searching the open heads again for Rosenblum, Sylvester equations and the `tan Θ` theorems finds three things, none of them shared. SchrodingerOperatorsAndSpectralTypes §1.8 is Rosenblum's 1957 trace-class lemma, a different theorem. QuantumOptimization and LinearSystemsAndControl use Sylvester equations in their own settings, and the latter draws its boundary with the operator-theory roadmaps.

Source independence: changed passages only. 12 passages compared (the new locator sentences of the Summary, §2.12, §2.16, §2.17, §2.19, §3.31, §4.15, §4.17, §4.18 and §4.19, and two docstrings of `Suggested.lean`) with 4 sources; no wording is shared beyond names and forced phrases. The largest share is AlbeverioMakarovMotovilov2003, 5 of 18 locators. The arrangement was not compared again, because no layer was added, removed or reordered.

Research link: §2.16 is Theorem 2.7 of Albeverio–Makarov–Motovilov (2003) and Theorem 3.1 of Seelmann (2014), the input to the off-diagonal subspace-perturbation results of Kostrykin–Makarov–Motovilov. §3.31 is the Davis–Kahan `tan 2Θ` theorem as Kostrykin–Makarov–Motovilov (2004) generalise it. Layer 4 is Yu–Wang–Samworth (2015), used for high-dimensional principal components (README, Downstream consumers). This rests on these sources, read.

## Not verifiable

- Davis–Kahan 1970 (doi 10.1137/0707001): no open copy. The names "`tan Θ` theorem", "generalized `tan Θ` theorem" and "`tan 2Θ` theorem" (§3.28, §3.29, §3.31) could not be checked against it.
- Rosenblum 1956 (doi 10.1215/S0012-7094-56-02324-9): no open copy. §2.17 and §2.19 also cite AMM Lemma 2.5, which was checked.
- Bhatia–Davis–McIntosh 1983, Theorem 4.1 (§2.16): paywalled. It is corroborated only by Seelmann2014 line 545, which cites that theorem number. The bounds `√3/2 ≤ c ≤ 2` are known only through AlbeverioMakarovMotovilov2003 Remark 2.8.

## Source issues

- **Misprint** in AlbeverioMakarovMotovilov2003 at Remark 2.8, p. 9: the source says Bhatia, Davis and McIntosh bounded the best constant in (2.14) below by `√3/2`; it should be a lower bound of at least 1, which scalar `A` and `C` already attain (the 1983 paper could not be read to give its value); affects nothing.

## For the human reviewers

- Licence: `Suggested.lean` line 2 reads "Copyright (c) 2026 Kitware, Inc.". The README's Provenance section (lines 572–579) says that an Apache-2.0 implementation of all four layers exists in the AIQ DKPS formalization, which adapted material from the Spectra Formalization Project. I did not compare the five declarations with those repositories.
- Not tested: Davis–Kahan 1970 (which References calls "the principal worked source"), Bhatia–Davis–McIntosh 1983 and Rosenblum 1956 could not be read legally, so the wording was not checked against them.
