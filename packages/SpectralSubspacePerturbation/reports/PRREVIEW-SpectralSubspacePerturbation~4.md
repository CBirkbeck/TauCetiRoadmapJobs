# Review of SpectralSubspacePerturbation (pull request #2622 at 185bed4)
Folder: `TauCetiRoadmap/OperatorTheory/SpectralSubspacePerturbation/`
**Verdict:** accepted

**Summary.** Accepted. Every item of the README on main is still there under its label (`SSP-S01`, `SSP-A01`–`A26`, `SSP-B01`–`B17`, `B19`, `SSP-C01`–`C31`, `SSP-D01`–`D19`) with a full statement, and each restated statement was recomputed and compared with the Tau Ceti declaration named on its line: no statement, Check or example is false, and the five Lean statements elaborate, say what the README says, and are not in the pinned libraries. There are two small corrections (a wrong theorem number in the locator of §D.16, and §D.3 reading as an open target) and one format note, none blocking. For the humans: the licence header, the narrowing of §B.12 to complex scalars, and the sources that could not be read.

## C01 — The locator of §D.16 points at Theorem 1 of Yu, Wang and Samworth, which is the classical Davis–Kahan theorem with a gap involving the perturbed eigenvalues; the population-gap bound is their Theorem 2, inequality (2)

§D.16 (lines 1136–1138) says "No gap is assumed in the spectrum of `B` (Yu, Wang and Samworth 2015, Theorem 1, proved there for real matrices and a run of consecutive indices)". A reader who opens the paper there finds the opposite hypothesis. YuWangSamworth2015 lines 45–50: Theorem 1 is headed as the Davis–Kahan `sin θ` theorem, its separation `δ` is taken between the population eigenvalues `[λ_s, λ_r]` and the sample eigenvalues outside the block, and its bound is `‖Σ̂ − Σ‖_F/δ` with no factor `2` and no `min`. The statement of §D.16, `2 min(√d ‖B − A‖, ‖B − A‖_F)/Δ` with the gap in `A` alone, is YuWangSamworth2015 line 94: Theorem 2, inequality (2). (§D.17 already cites "Theorem 2, inequality (3)", correctly.)

Replace "Theorem 1" by "Theorem 2, inequality (2)" in §D.16.

## C02 — §D.3 has no *In Tau Ceti:* line, so by the README's own reading rule it is an open target, but nothing in it is open

"How to read the build" says an item the pinned Tau Ceti proves ends with an *In Tau Ceti:* line. §D.3 (the population residual columns, lines 1011–1017) is the only item without that line that is neither a "Prove …" target nor listed as open in the pull request's description. At the pin the residual column has no named definition: the declarations of §D.8–§D.11 write `λ_j(A) v_j − A v_j` inline (for example `LinearMap.IsSymmetric.norm_smul_sub_apply_eigenvectorBasis_le`, `TauCeti/Analysis/InnerProductSpace/YuWangSamworth/Basic.lean:129`), and the eigenframe versions carry "frameResidual" only in their names.

One sentence in §D.3 would settle it, for instance: "Tau Ceti has no named definition; the declarations of §D.8–§D.11 write the expression inline."

## N01 — Sz.-Nagy, Strausz, McEachin and Haagerup–Zsidó are credited in the text but have no entry in References

§B.16 (lines 539–541) credits the value `π/2` to Sz.-Nagy and its sharpness to McEachin through Remark 2.8 of Albeverio–Makarov–Motovilov; that remark (AlbeverioMakarovMotovilov2003 lines 412–414) names Sz.-Nagy and Strausz. The entries are in Seelmann2014 lines 893 and 905. The README on main had a References line for Haagerup and Zsidó, after whom Part A's kernel is named; the head has none.

## Previous findings

The previous review (of `828f752`) raised no finding, four small corrections and one format note.

- The lower bound `√3/2` for the best constant: repaired. Lines 10–11 and 540 now read "`√(3/2)`", which is above the scalar bound 1 and above the 1.2168 of the Check of §B.16.
- The locator of the rectangular singular-vector item without its scope: repaired. §D.19 (lines 1193–1194) now says "proved there for real matrices and a run of consecutive indices".
- The graph step of the quarter-acute bound: repaired. §C.31 (lines 933–937) now derives `‖w‖ ≤ c‖u‖`, closed range and surjectivity before calling `V` the graph of a bounded angular operator.
- The equal-rank hypothesis of the `tan Θ` theorem: answered. §C.29 (lines 901–909) now gives the compression that reduces the lower-rank case to §C.28; the split and `hrank` are kept, which is the author's choice.
- References for Sz.-Nagy and McEachin: not repaired (N01 above).

## Verified sound

| Statement | Instance | Left side (computed) | Right side (computed) | Result |
|---|---|---|---|---|
| Milestone S1, §S.1 Check | `A = diag(0,1,3)`, `U = span e₃` | eigenvalue on `U`: 3; on `U⊥`: 0, 1; distances 3, 2 | gap 2; whole-spectrum variant gives 0 | Check true; `Module.End.PointInternalGap` (PointSpectrum.lean:749) |
| A1, §A.13 / Convention 7 | `t = 0` | `L(0) = ∫ tanh(πy/2) dy` diverges; library value 0; `r(0) = 0` | null set | harmless, as stated |
| A2, §A.15 | rate `a = 2πy` | `2a/(a² + (2πξ)²) = 4πy/(4π²(y² + ξ²))` | `y/(π(y² + ξ²))` | equal |
| A2, §A.17 | one period | `∫₀^π sin t e^{−yt} dt = (1 + e^{−πy})/(1 + y²)`; geometric sum `1/(1 − e^{−πy})`; times 2 | stated value | equal |
| A2, §A.18 | geometric series | `1 + 2e^{−2πy}/(1 − e^{−2πy})` | `(1 + e^{−2πy})/(1 − e^{−2πy})`; times `π/y` | equal |
| A2, §A.19–§A.20 | `c = 2n+1` | `∫₀^∞ y²/((y²+c²)(y²+a²)) dy = π/(2(a+c))`; sum telescopes to `(4/π)(π/2)/(a+1)` | `2/(a+1)` | equal; integrable at `a = 0` since `w(y)/y → π/2` |
| A2, §A.22 | `|t| ≥ 1`; `|t| ≤ 1` | `|r| ≤ π/(4t²)`; `|r| ≤ 1/2` | `π/(2(1+t²)) ≥ π/(4t²)`; `≥ π/4` | bound holds |
| A3, §A.23–§A.25 | `x = −2πξ` | `𝓕k(ξ) = ∫ k(t) e^{−2πitξ} dt = 1/x` | `−1/(2πξ)` | equal; mass example gives `1/(1+y²)`, integral `π/2` |
| A4, §A.26 | `C < 0`; `F` not measurable | hypothesis impossible; integral 0 | `(π/2)C ≥ 0` | no junk-value failure |
| B1, §B.3–§B.4 | rank-one `uᵢ ⊗ vⱼ` | `A(uᵢ⊗vⱼ) − (uᵢ⊗vⱼ)B = (αᵢ − βⱼ) uᵢ⊗vⱼ` | coefficient of `C` | solves; any-dimension form needs only `α` real |
| B1, §B.5 Checks | `T = [[1,1],[−1,1]]`; unilateral shift | `⟪Tx,x⟫ = x₁² + x₂²`, `‖T⁻¹‖ = 0.7071`; `⟪Se₀,e₀⟫ = 0` | `c⁻¹ = 1`; not coercive | both true |
| B2, §B.6 general form | shift `A − α + (α+β)/2`, `B − β + (α+β)/2` | same `AX + XB`, both forms `≥ (α+β)/2` | `(α+β)‖X‖ ≤ ‖AX+XB‖`; trivial if `α+β ≤ 0` | holds without sign condition (Sylvester.lean:128) |
| B2, §B.12 Checks | `A = ¼`, `B = 0`; `A = diag(0,2)`, `B = diag(1,−1)`, `C = H/√2` | `m_δ = 1`; eigenvalues `(−2 ± √10)/3`, norm `1.2168` | `4 > π/2`; `‖C‖ = 1` | both true |
| B2, §B.12 route | scalar `x = α − β`, `|x| ≥ δ` | `∫ δk(δt) e^{itx} dt = ∫ k(s) e^{isx/δ} ds` | `δ/x` | matches AMM (2.12) |
| B2, §B.14 | `δ = 0` | `0` | `C`, `−C` both in the orbit, so `0` in the hull | holds (Pairwise.lean:247 has `0 ≤ δ`) |
| B2, §B.16 headline | `aₙ = n`, `bₙ = n + 1/(n+2)`, `C_k = e_k⊗e_k` | `X_kk = 1/(a_k − b_k) = −(k+2)` | `‖C_k‖ = 1` | no bound at distance 0; route's kernel integral has norm `≤ (π/2)‖C‖/δ` |
| B3, §B.17 headline | multiplication by `x` on `L²(0,1)`; the diagonal pair above | `X = 1` intertwines, point spectra empty; `(aₘ − bₙ)Xₘₙ = 0` | spectra `[0,1]` equal; `X = 0` | Checks true; Lean `B.Intertwines A X` is `X(By) = A(Xy)` (Intertwining.lean:39) |
| B4, §B.19 | `f = 1` on `σ(B)`, `0` on `σ(A)` | `X = X f(B)` | `f(A) X = 0` | holds |
| C1, §C.3–§C.4 | isometry `X`, `P = XX†` | `AX − XM = (1−P)AX + X(X†AX − M)`, orthogonal pieces | Pythagoras; `N((1−P)Y) ≤ N(Y)` | holds |
| C1, §C.13–§C.14 | `T = P_U + X` | `T†T = P_U + X†X` (cross terms vanish) | `T(1+X†X)⁻¹T†` idempotent with range `graph` | holds; `X = 0` gives gap 0 |
| C2, §C.24 | block form of `P_U − P_V` | `P_{V⊥}DP_U − P_VDP_{U⊥} = ½(DS_U − S_VD)` with `D = B − A` | `N ≤ N(D)`; blocks have disjoint supports | holds with two independent intervals (Symmetric.lean:148) |
| C3, §C.27 | `B = ½·1`, `A = diag(1,0)`, `V` at `π/4` | `(b−a)·sin 2θ = 1` | `2‖B − A‖ = 1` | equality; no hypothesis on `B` needed |
| C3, §C.28 headline | `A = diag(0,1)`, `z = (cos φ, sin φ)` | `M = sin²φ`, `δ = cos²φ`, `δ tan φ = sin φ cos φ` | `‖R‖ = sin φ cos φ` | equality; statement agrees with the restatement in Nakatsukasa 2012, (1)–(2) |
| C3, §C.29 route | `E′ = P_UZ ⊕ U⊥` | compression of `A′` to `Z` is `M`; residual `P_{E′}R` | `N(P_{E′}R) ≤ N(R)` via `P_{E′} = (1+S)/2` | reduction valid |
| C3, §C.30 | `u = P_Ux`, `w = P_{U⊥}x`, `h = Re⟪Hw,u⟫` | `h(‖u‖² − ‖w‖²) ≥ (b−a)‖u‖²‖w‖²` | `|h| ≤ ε‖u‖‖w‖` | holds for non-unit `x`; example `2/5 = (3/5)(2/3)` |
| C3, §C.31 | `A = diag(1,0)`, `H = [[0,h],[h,0]]`; `H = diag(−1,1)` | `sin(½ arctan 2h)`: `0.6154` (`h=2`), `0.7053` (`h=100`); gap `1` | `0.7071` | Checks true; bound is KMM (1.2), (1.4) |
| D1, §D.7–§D.10 | `R_j = (λ_j(A) − λ_j(B))v_j + (B−A)v_j` | `‖λ_jw − Aw‖² = Σ_k (λ_j − λ_k)²|⟪u_k,w⟫|²` | `≥ Δ² Σ_{k∉s}`; `Σ‖R_j‖² ≤ 4dε²` | hold |
| D1, §D.14 | `Ω = {0}`; `Ω = {μ}`, `μ ≠ 0` | `ker D(A) = ker A ⊕ ker A†`; `(v, Av/μ)` | eigenspaces of `A†A`, `AA†` at `μ²` | holds; `σᵢ = 0`, `i < dim E`, gives eigenvector `(vᵢ, 0)` |
| D1, §D.15 Check | `A = 1`, `Â = −1`, `Ω = (0,∞)` | lines `(1,1)`, `(1,−1)`; `δ·‖sin‖ = 2·1` | `(π/2)·2 = π` | holds |
| D2, §D.16 | `ε = 2/3` example | `sin θ = 0.447` | `2‖B−A‖/Δ = 1.333` | holds; locator is Theorem 2 (2), not Theorem 1 (C01) |
| D2, §D.17 headline | `B = A`, `u = (e₁,e₂)`, `v = (e₂,e₁)`; `d = 0` | discrepancy `√(2+2) = 2`; `0` | `0`; `0` | bases must be chosen; internal gap `> 0` forces the index gap of §D.16 |
| D2, §D.18 headline | `ε = 2/3`, `Δ = 1` | `‖v − u‖ = 0.4595`; `‖−v − u‖ = 1.9465` | `2√2·(2/3) = 1.8856` | phase needed; follows from §D.17 at `d = 1` |
| D2, §D.19 | `A : ℂ → ℂ²`, `x ↦ (x,0)` | `AA† = diag(1,0)`; `σ⁻¹Av` gives `e₁` only | basis indexed by `dim F = 2` | Check true; left form is not at the pin |
| Owned elsewhere | SelfAdjointSpectralTheory on main | SA-C66, SA-D01–D02, D24, D34, SA-E01, E02, E05–E08, E31, E37 read | README's one-line descriptions | each matches its item |

- Source locators checked against the text: 14 (AlbeverioMakarovMotovilov2003 Lemma 2.5 with the paragraph before it, Theorem 2.7 with (2.12), Remark 2.8; Seelmann2014 Proposition 2.4, Theorem 3.1; KostrykinMakarovMotovilov2004 (1.1), (1.2), (1.4); YuWangSamworth2015 Theorem 1, Theorem 2 (2) and (3), Corollary 3, Theorem 4 with the remark after it, (10)–(11)). One is wrong (C01).
- Library declarations opened at the pin: the signature of every declaration on an *In Tau Ceti:* line (about 150, in `TauCeti/Analysis/Fourier/HaagerupZsido/`, `…/InnerProductSpace/Sylvester.lean`, `…/UnitarilyInvariantSeminorm/`, `…/Projection/`, `…/DoubleAngle/`, `…/YuWangSamworth/`, `…/HermitianDilation/`, `…/SingularSubspace/`), each compared with its item; plus `LinearPMap.Intertwines`, `LinearPMap.SylvesterEquation`, `LinearPMap.SpectralSetsSeparated`, `LinearPMap.spectrum`, `Submodule.tanThetaMap`, `Submodule.directedProjectionGap`, `LinearMap.IsSymmetric.CorrespondingEigenblocks`, `LinearMap.leftSingularVector`. All 211 dotted names in the README resolve at the pins.
- No open target is at the pins: no Rosenblum theorem for partial operators, no domain-aware `π/2` bound, no `tan Θ` theorem, no aligned-basis theorem, no left-singular-vector bound.
- Comparison with the README on main: 95 labels on main, 95 at the head, no label dropped or given another subject; the four Parts keep their letters and the fourteen milestones their item ranges. Labels cited by other roadmaps (`SSP-B09`, `SSP-C11`, `SSP-C14`–`C17`, `SSP-D06`, `SSP-D13`) all resolve.
- Elaboration of `Suggested.lean`: five `declaration uses 'sorry'` warnings, nothing else. `#check` of the five declarations on a copy: no binder lost. One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp_all`, `trivial`): all five stay open.
- Automatic checks at this head: all passed. Dependency check output: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`. Nothing changes outside the folder.
- Pull request text against the head: the list of open targets, the content changes (§B.12 over `ℂ`, §C.24, §C.31, §A.26, §B.6, §C.4, §C.17, §S.1), the notation change in Part D and the account of `Suggested.lean` all agree with the head; §D.3 is the one item it does not place (C02).

Overlap check: read OperatorTheory (family index, main and open), PrincipalAngles, SelfAdjointSpectralTheory (main and its open revision), EigenvalueIterations, Majorization, SchrodingerOperatorsAndSpectralTypes; nothing shared. SelfAdjointSpectralTheory leaves the estimates and Rosenblum's theorem to this roadmap; PrincipalAngles owns the separation predicates other than the internal gap; EigenvalueIterations cites this roadmap's graph-subspace items `SSP-C11`–`SSP-C14` (and, beside them, section numbers 3.11–3.14 of an earlier head of this pull request, which this head no longer uses); the Rosenblum lemma of SchrodingerOperatorsAndSpectralTypes §1.8 is a different theorem.

Source independence: 12 passages compared with 5 sources (the four of the manifest that can be read, and Nakatsukasa 2012 for the `tan Θ` statements), none shared beyond names and forced formulas; largest share Davis–Kahan 1970, 6 of about 24 locators, not readable; among the readable sources AlbeverioMakarovMotovilov2003, 5 locators, contents compared (seven sections, only its §2 meets Part B): independent.

Research link: §B.16 is Theorem 3.1 of Seelmann (2014) and Theorem 2.7 of Albeverio–Makarov–Motovilov (2003); §C.28–§C.31 are the Davis–Kahan `tan Θ` and `tan 2Θ` theorems that Nakatsukasa (2012) and Kostrykin–Makarov–Motovilov (2004) extend; Part D is Yu–Wang–Samworth (2015), used by the statistics roadmaps the README names. Rests on these sources, read.

## Not verifiable

- Davis–Kahan 1970: no open copy. The `sin Θ`, `sin 2Θ`, `tan Θ`, generalized `tan Θ` and `tan 2Θ` attributions of §C.17, §C.18, §C.27–§C.29, §C.31 were checked by computation and against restatements only (Nakatsukasa, *The tan θ theorem with relaxed conditions*, Linear Algebra Appl. 436 (2012), author's copy, for `tan Θ` and its generalized form; KostrykinMakarovMotovilov2004 for `tan 2Θ`).
- Rosenblum 1956, Davis 1963 (the `sin 2θ` theorem of §C.25), Bhatia's Theorem VII.2.3 (§B.7) and Bhatia–Davis–McIntosh 1983, Theorem 4.1: paywalled or without an open copy; the last is corroborated by Seelmann2014 line 545.
- The lower bound `√(3/2)` of §B.16: AlbeverioMakarovMotovilov2003 lines 399–401 (Remark 2.8, (2.17)) show a root sign, a 3 and a 2 whose grouping the extracted text does not fix. `√(3/2) ≈ 1.2247` is the only reading above the trivial bound 1.

## Source issues

- **Misprint** in AlbeverioMakarovMotovilov2003 at Theorem 2.7, formula (2.13), p. 9: the source says the kernel's Fourier integral equals `1/x` for `|x| ≥ 1/d`; it should be for `|x| ≥ d`, as in Seelmann2014 Theorem 3.1; affects nothing.
- **Misprint** in YuWangSamworth2015 at the sentence after Theorem 4, p. 7: the source says the theorem concerns the right singular vectors of `Σ` and `Σ̂`; it should be of `A` and `Â`; affects nothing.

## For the human reviewers

- Licence: `TauCetiRoadmap/OperatorTheory/SpectralSubspacePerturbation/Suggested.lean` line 2 reads "Copyright (c) 2026 Kitware, Inc."; README lines 1239–1244 name an Apache-2.0 implementation (AIQ DKPS, adapted from the Spectra Formalization Project). The five declarations were not compared with those repositories.
- Scope of an item: §B.12 on main was stated over `ℝ` or `ℂ`; the head states it over `ℂ` only and sends real scalars to §B.13 (the description says so). Whether the real statement is wanted as a target is yours to decide.
- Not tested: Davis–Kahan 1970, the source with the largest share of the locators and called "the principal worked source" in References, could not be read legally, nor could Bhatia–Davis–McIntosh 1983 and Rosenblum 1956; wording and arrangement were not compared with them.
