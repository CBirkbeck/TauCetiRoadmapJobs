# Review of SpectralSubspacePerturbation (pull request #2622 at 828f752)
Folder: `TauCetiRoadmap/OperatorTheory/SpectralSubspacePerturbation/`
**Verdict:** accepted

**Summary.** Accepted. Every kept target was recomputed and no statement, Check or example is false: the thirteen sampled targets agree with their sources where those can be read, the five Lean statements elaborate and say what the README says, and none of them is in the pinned libraries or closes in one tactic. There are four small corrections (an uninformative lower bound for the best constant, a locator without its scope, a step of the §3.31 route that fails as written in infinite dimension, and a rank hypothesis in §3.28 that the statement does not need) and one format note, none blocking. For the humans: the licence question and three sources that could not be read.

## C01 — The lower bound `√3/2` for the best constant is below the trivial bound 1, so as written it tells the reader nothing

The Summary (lines 10–11) says Bhatia, Davis and McIntosh proved the pairwise bound "with a universal constant, the best one lying between `√3/2` and `2`", and §2.16 (line 248) repeats it. Read as `(√3)/2 ≈ 0.866`, the bound is weaker than what scalars give: `A = δ`, `B = 0` on `ℂ` has `X = C/δ`, so the best constant is at least 1, and the Check of §2.16 already gives 1.2168. The figure comes from AlbeverioMakarovMotovilov2003 lines 397–402 (Remark 2.8, formula (2.17)), where the text I could read shows a root sign, a 3 and a 2 and does not tell `(√3)/2` from `√(3/2) ≈ 1.2247`; the 1983 paper could not be read.

Either drop the lower bound from the Summary ("with a universal constant at most `2`"), or write it as the source prints it once that is settled, with parentheses that fix the reading.

## C02 — The §4.19 locator does not say that Yu, Wang and Samworth prove the bound only for real matrices and a run of consecutive indices

§4.17 qualifies its citation of Theorem 2 with "proved there for real matrices and a run of consecutive indices". §4.19 (lines 524–525) cites "Theorem 4, the remark after it, and steps (10)–(11) of its proof" without it, yet is stated over `𝕜`, for an arbitrary index set `s`, with left vectors indexed by `dim F`. YuWangSamworth2015 lines 193–197 assume real `p × q` matrices and indices `r ≤ … ≤ s ≤ rank(A)`. The bound is right at the README's generality: it is Tau Ceti's right-singular-vector theorem applied to the adjoints. The same qualifier as in §4.17 would say what the source proves.

## C03 — In §3.31 the two trivial intersections do not by themselves make `V` the graph of a bounded operator on a Hilbert space

The route (lines 402–405) says the bounds "give `V ∩ U⊥ = 0` and `V⊥ ∩ U = 0` …, so `V` is the graph of an angular operator `K` from `U` to `U⊥`". In infinite dimension two closed subspaces in this position are in general the graph of a closed, densely defined, possibly unbounded operator; Tau Ceti's `Submodule.IsAngularOperator` is a bounded one, so an implementer following the sentence is stuck there. The conclusion is true here, by a quantitative form of the same computation: for `z = u + w ∈ V` with `u ∈ U`, `w ∈ U⊥`, the bounds and the off-diagonal shape give `b‖z‖² ≤ ⟪(A+H)z, z⟫ ≤ ‖A‖‖u‖² + a‖w‖² + 2‖H‖‖u‖‖w‖`, hence `(b − a)‖w‖² ≤ (‖A‖ − b)‖u‖² + 2‖H‖‖u‖‖w‖` and `‖w‖ ≤ c‖u‖`; so `P_U` is bounded below on `V`, its image is closed, and `V⊥ ∩ U = 0` makes it all of `U`. One sentence to that effect (or a reference to the graph-subspace result behind KostrykinMakarovMotovilov2004 (1.4)) closes the step.

## C04 — The equal-rank hypothesis of §3.28 is not needed: §3.29 follows from §3.28 by a compression, so one statement without `hrank` covers both

§3.28 notes that the hypotheses force `dim Z ≤ dim U`, and §3.29 repeats the theorem for `dim Z < dim U` with the route "as for §3.28". The lower-rank case reduces to the equal-rank one. Put `U′ = P_U Z` and `E′ = U′ ⊕ U⊥`. Since `A` preserves `U` and `U⊥`, the compression `A′` of `A` to `E′` is `(P_{U′}A|U′) ⊕ A|U⊥`: `U′` is `A′`-invariant with complement `U⊥`, `dim U′ = dim Z` because `Z ∩ U⊥ = 0`, `Z ⊆ E′`, the compression of `A′` to `Z` is still `M`, the Ritz residual is `P_{E′}R`, and `P_{U⊥}` on `Z` (so every principal tangent) is unchanged. §3.28 for `(A′, U′, Z)` gives `δ N(tan Θ) ≤ N(P_{E′}R) ≤ N(R)`, the last step because the singular values of `P_{E′}R` are at most those of `R`.

So `directedProjectionGap_lt_one_and_mul_map_tanThetaMap_le` holds without `hrank`. If the split is kept because Davis and Kahan state two theorems, §3.29's route could name this reduction; otherwise dropping `hrank` from the Lean statement would make the headline cover §3.29 as well.

## N01 — Sz.-Nagy and McEachin are credited in §2.16 but their papers are not in References

§2.16 (lines 248–249) credits the value `π/2` to Sz.-Nagy and its sharpness to McEachin through Remark 2.8 of Albeverio–Makarov–Motovilov. Seelmann2014 lines 893 and 905 give the entries (McEachin, Proc. Amer. Math. Soc. 115 (1992); Sz.-Nagy, Math. Nachr. 9 (1953)).

## Questions for the author

- The family's progress report (`TauCetiRoadmap/OperatorTheory/PROGRESS.md`, line 46) says Tau Ceti has gained Rosenblum's theorem for unbounded operators and its bounded case after the pinned commit. Neither is at the pin (no Rosenblum file under `TauCeti/Analysis/InnerProductSpace/LinearPMap/` there), so §2.17 and §2.19 are targets today. Is a move of the pin planned? I could not read the newer library from here.

## Previous findings

The previous review read this same head and raised no finding. Its two small corrections and its format note are unchanged in the text: "the best one lying between `√3/2` and `2`" (C01 above), the §4.19 locator (C02 above), and the missing reference entries (N01 above). Not repaired; none blocks.

## Verified sound

| Statement | Instance | Left side (computed) | Right side (computed) | Result |
|---|---|---|---|---|
| §1.16 two-sided decay | `a = 1`, `s = 2`, `x = ±10`; `s = −5` | `e^{−10}/10² = 4.5·10⁻⁷` at both signs; `|x|⁵e^{−|x|} → 0` | `0` | holds; Mathlib has only `atTop` (Pow/Asymptotics.lean:338); Tau Ceti proves it inline for `s = −2` only |
| §2.5 Check 1 | `T = [[1,1],[−1,1]]` on `ℝ²` | `⟪Tx,x⟫ = x₁² + x₂²`; `T⁻¹ = ½[[1,−1],[1,1]]`, norm `0.7071` | `c⁻¹ = 1` | holds |
| §2.5 Check 2 | unilateral shift | `⟪Se₀,e₀⟫ = 0`, `‖Sx‖ = ‖x‖`, not onto | coercivity fails | Check true; separates form bound from norm bound |
| §2.12 route | scalar `α − β = x`, `|x| ≥ δ` | `∫ δk(δt)e^{itx}dt = ∫ k(s)e^{isx/δ}ds = δ/x` | `m_δ` entry `δ/(α−β)`; mass `π/2` | consistent; compact orbit + Carathéodory gives a finite combination |
| §2.12 Check 2 | `A = diag(0,2)`, `B = diag(1,−1)`, `C = H/√2` | gaps `−1, 1, 1, 3`; eigenvalues of `[[−1,1],[1,−1/3]]`: `(−2 ± √10)/3`; norm `1.2168` | `‖C‖ = 1`, `π/2 = 1.5708` | Check true |
| §2.16 headline | same pair, `δ = 1`; Seelmann Thm 3.1 with `B₀ = B`, `B₁ = A`, `Y = X`, `T = −C` | `δ‖X‖ = 1.2168` | `(π/2)‖C‖ = 1.5708` | holds; locator matches (Seelmann2014 lines 506–547) |
| §2.16 Check 2 | `aₙ = n`, `bₙ = n + 1/(n+2)`, `C_k = e_k ⊗ e_k` | `(a_k − b_k)X_kk = 1`, `X_kk = −(k+2)` | `‖C_k‖ = 1` | no bound at distance 0; spectra disjoint since `0 < 1/(n+2) ≤ ½` |
| §2.16 degenerate | `E = 0` | `X = 0`, left side `0` | `≥ 0` | holds; separation vacuous |
| §2.17 headline | spectral measures: `X P_B(J) = P_A(J) X`, `J = σ(B)` | `X = X P_B(σ(B))` | `P_A(σ(B)) X = 0` | holds at distance 0 too |
| §2.17 Lean | `B.Intertwines A X` at the pin (LinearPMap/Intertwining.lean:39) | `X` maps dom `B` to dom `A`, `X(By) = A(Xy)` | README sentence | same statement |
| §2.17 Check 1 | multiplication by `x` on `L²(0,1)`, `X = 1` | point spectra `∅`, `∅` | `X ≠ 0` | Check true: eigenvalues do not suffice |
| §2.17 locator | AMM Lemma 2.5: `XA − CX = Y`, `C` bounded on the target | AMM's `C` is README's `A` | "for bounded `A`" | orientation right (lines 337–354) |
| §2.19 | `A = diag(0,1)`, `B = diag(2,3)`; `f = 1` on `σ(B)`, `0` on `σ(A)` | `(aᵢ − bⱼ)Xᵢⱼ = 0`; `X = X f(B)` | `f(A) X = 0` | holds |
| §3.28 Check | `A = diag(0,1)`, `z = (cos φ, sin φ)`, `φ = π/4` | `M = ½`, `δ = ½`, `δ tan φ = 0.5` | `‖R‖ = sin φ cos φ = 0.5` | equality; constant sharp |
| §3.28 degenerate | `Z = U = 0`; `Z = U = E` | gap `0`; `tan Θ = 0` | `R = 0` | holds |
| §3.28 Lean | `tanThetaMap` at `tan(arcsin 1)` | junk value `0` when an angle is `π/2` | first conjunct forces gap `< 1` | statement meaningful; orientation `‖P_{U⊥}P_Z‖` (Projection/Gap.lean:78) |
| §3.29 | compression to `P_U Z ⊕ U⊥` | `A′ = P_{U′}A|U′ ⊕ A|U⊥`, same `M`, same tangents | `N(P_{E′}R) ≤ N(R)` | follows from §3.28 (C04) |
| §3.31 Check 1 | `A = diag(1,0)`, `H = [[0,h],[h,0]]` | `sin(½ arctan 2h)`: `0.6154` (`h = 2`), `0.7053` (`h = 100`) | `√2/2 = 0.7071` | strict, sharp; equals KMM (1.2) |
| §3.31 Check 2 | `H = diag(−1,1)`, `V = span e₂` | `‖P_U − P_V‖ = 1` | `0.7071` | off-diagonal hypothesis needed |
| §3.31 route | `z = u + w ∈ V` | `(b−a)‖w‖² ≤ (‖A‖−b)‖u‖² + 2‖H‖‖u‖‖w‖` | bounded graph | conclusion true; step as written incomplete (C03) |
| §4.15 Check | `A = 1`, `Â = −1` on `ℂ`, `Ω = (0,∞)` | lines `(1,1)`, `(1,−1)`; `δ‖sin‖ = 2·1` | `(π/2)·‖D(Â) − D(A)‖ = π` | holds; Seelmann Prop 2.4 matches (lines 233–236) |
| §4.17 headline | `d = 0`; `d = n`; `B = A` | `0`; `0` with `u = v`; `0` | `0`; `≥ 0`; `0` | holds; internal gap `> 0` forces the index gap |
| §4.17 Check | `u = (e₁,e₂)`, `v = (e₂,e₁)` | `√(2 + 2) = 2` | `0` | arbitrary bases fail, as claimed |
| §4.17 locator | YWS Thm 2 (3) | `2^{3/2} min(√d‖·‖, ‖·‖_F)/gap` | README bound | matches (lines 87–96); arbitrary index set is Tau Ceti's (YuWangSamworth/SinTheta.lean:59) |
| §4.18 Check | `A = diag(1,0)`, `B = [[1,⅔],[⅔,0]]`, `Δ = 1` | eigenvalues `4/3`, `−1/3`; `‖v − u‖ = 0.4595`; `‖−v − u‖ = 1.9465` | `2√2·(2/3) = 1.8856` | holds with phase, fails without |
| §4.18 from §4.17 | `d = 1` | bases `au`, `bv`, `‖(b/a)v − u‖` | `min(‖·‖, ‖·‖_F) = ‖·‖` | specialisation correct |
| §4.19 | right form at `A†`, `Â†` | right Gram of `A†` is `AA†`, index `dim F`; `‖A†x‖ ≤ a‖x‖` | `4|s|((a+â)ε)²` | holds; YWS (10)–(11) match (lines 288–294) |
| §4.19 Check | `A : ℂ → ℂ²`, `x ↦ (x,0)` | `AA† = diag(1,0)`, eigenbasis `(e₁,e₂)` | `σ⁻¹Av` gives `e₁` only | Check true |
| Layer 1 mass example | Tonelli | `2(1+e^{−πy})/((1−e^{−πy})(1+y²)) · tanh(πy/2)/2 = 1/(1+y²)` | `∫₀^∞ = π/2` | correct |
| Contract: telescoping integral | `w(y)y = (4/π)∑ y²/(y²+(2n+1)²)` | `(4/π)(π/2)∑(1/(2n+1+a) − 1/(2n+3+a))` | `2/(a+1)` | correct |
| Contract: kernel bound | `|r| ≤ min(½, π/(4t²))` | `≤ π/(2(1+t²))` for `|t| ≤ 1` and `|t| ≥ 1` | stated bound | consistent |
| Layer 3 example | `ε = 2/3` | `sin²θ = 1/5`, `(4/3)/√5 = 0.596` | `‖B − A‖ = 0.667` | correct |
| Layer 4 example | same pair, both gaps `4/3` | `sin θ = 0.447` | `(2/3)/(4/3) = 0.5`; one-sided `4/3` | correct |

- Source locators checked against the text: 11 (AlbeverioMakarovMotovilov2003 Lemma 2.5, Theorem 2.7 with (2.12), Remark 2.8; Seelmann2014 Proposition 2.4, Theorem 3.1; KostrykinMakarovMotovilov2004 (1.2), (1.4); YuWangSamworth2015 Theorem 2 (3), Corollary 3, Theorem 4 with the remark after it, (10)–(11)).
- Library declarations opened at the pin: 19 in Tau Ceti (`LinearPMap.Intertwines`, `LinearPMap.SylvesterEquation`, `LinearPMap.SpectralSetsSeparated`, `LinearPMap.spectrum`, `Submodule.tanThetaMap`, `Submodule.singularValues_tanThetaMap`, `Submodule.directedProjectionGap`, `Submodule.sinThetaEmbedding`, the five point-spectrum predicates, `CorrespondingEigenblocks`, `sinThetaFrobenius_orderedEigenframe_le`, the Procrustes bound, the right-singular-vector bound, the pairwise `π/2` `sin Θ` theorem, the three coercive lemmas) and 4 in Mathlib (`isLittleO_exp_neg_mul_rpow_atTop`, `Real.tsum_eq_tsum_fourier_of_rpow_decay`, `convexHull_eq_union`, `fuglede_putnam_rosenblum`).
- No kept target is at the pins: no Rosenblum theorem, no dilation pairwise bound, no left-singular basis, no aligned-basis theorem, no cocompact decay lemma for `e^{−a|x|}`, no named inverse bound for a coercive operator.
- Cross-roadmap citations resolved on main: SelfAdjointSpectralTheory SA-E01, E02, E05–E08, E31, E37, SA-C66, SA-D01, D24, D34 (README lines 958–1286 there); the consumers' labels `SSP-C16`, `SSP-C17`, `SSP-D06`, `SSP-D13` still map to §3.16, §3.17, §4.6, §4.13.
- Elaboration of `Suggested.lean`: five `declaration uses 'sorry'` warnings, nothing else. The five elaborated signatures were compared with the README: no binder lost. One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp_all`) on a copy: all five stay open.
- Automatic checks at this head: all passed. Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`. Nothing changes outside the folder.
- Pull request text against the head: 95 items, 15 Checks, 8 Tau Ceti imports, 21 declarations removed and 2 added, one roadmap supplier: all as described.

Overlap check: read OperatorTheory (family index, main and open), PrincipalAngles, SelfAdjointSpectralTheory (main and its open revision), Majorization, OperatorIdeals, SchrodingerOperatorsAndSpectralTypes; nothing shared. SelfAdjointSpectralTheory leaves the estimates and Rosenblum's theorem to this roadmap; PrincipalAngles owns the separation predicates other than the internal gap; the Rosenblum lemma of SchrodingerOperatorsAndSpectralTypes §1.8 is a different theorem.

Source independence: 12 passages compared with 4 sources, none shared beyond names and forced formulas; largest share AlbeverioMakarovMotovilov2003, 5 of 18 locators; contents compared with AlbeverioMakarovMotovilov2003 (seven sections, only its §2 meets Layer 2): independent. Davis–Kahan 1970, Rosenblum 1956 and Bhatia–Davis–McIntosh 1983 could not be read.

Research link: §2.16 is Theorem 3.1 of Seelmann (2014) and Theorem 2.7 of Albeverio–Makarov–Motovilov (2003); §3.31 is the Davis–Kahan `tan 2Θ` theorem that Kostrykin–Makarov–Motovilov (2004) generalise; Layer 4 is Yu–Wang–Samworth (2015), used in the statistics roadmaps the README names. Rests on these sources, read.

## Not verifiable

- Davis–Kahan 1970: no open copy; the names "`tan Θ` theorem", "generalized `tan Θ` theorem", "`tan 2Θ` theorem" of §3.28, §3.29, §3.31 and the one-sided hypothesis were checked only by computation and against KostrykinMakarovMotovilov2004.
- Rosenblum 1956: no open copy; §2.17 and §2.19 also cite AlbeverioMakarovMotovilov2003 Lemma 2.5, which was read.
- Bhatia–Davis–McIntosh 1983, Theorem 4.1: paywalled; corroborated only by Seelmann2014 line 545. Their bounds for the best constant are known only through AlbeverioMakarovMotovilov2003 Remark 2.8, whose lower bound could not be read unambiguously (C01).

## Source issues

- **Misprint** in AlbeverioMakarovMotovilov2003 at Theorem 2.7, formula (2.13), p. 9: the source says the kernel's Fourier integral equals `1/x` for `|x| ≥ 1/d`; it should be for `|x| ≥ d`, as in Seelmann2014 Theorem 3.1; affects nothing.
- **Misprint** in YuWangSamworth2015 at the sentence after Theorem 4, p. 7: the source says the theorem concerns the right singular vectors of `Σ` and `Σ̂`; it should be of `A` and `Â`; affects nothing.

## For the human reviewers

- Licence: `TauCetiRoadmap/OperatorTheory/SpectralSubspacePerturbation/Suggested.lean` line 2 reads "Copyright (c) 2026 Kitware, Inc."; README lines 572–579 name an Apache-2.0 implementation (AIQ DKPS, adapted from the Spectra Formalization Project). The five declarations were not compared with those repositories.
- Not tested: Davis–Kahan 1970 (called "the principal worked source" in References), Bhatia–Davis–McIntosh 1983 and Rosenblum 1956 could not be read legally; wording and arrangement were not compared with them.
