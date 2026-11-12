# Review of VonNeumannAlgebras (pull request #2242 at a494e8e)

**Verdict:** accepted

This is an incremental re-review of the 73 lines changed since 2f485b4. It has no findings.

## Previous findings

- R01 — repaired: README `:3166–3168` now reads "for every x'∈M' and every λ with `Re λ>0` there is x∈M with `TJx'JT=λ(2−R)xR+conj(λ)Rx(2−R)`. Then solve this relation for x by the scalar matrix-coefficient integral …".
- R02 — repaired: `Suggested.lean:546` states `exists_conj_commutant_eq_of_isCyclic_of_isSeparating` as proposed. The Layer 10 bullet of the module docstring and README `:3175–3177` now name it.
- R03 — repaired: `Suggested.lean` now has "Exercises 7.3.2 and 7.3.8, p. 47", "Definition 16.1.1, p. 113", "Theorems 16.3.1 and 16.3.2, pp. 114–115" and "§16.2, pp. 113–114".
- R04 — repaired: README `:3018–3023` adds the Check with ξ=η=(e₁₂+e₂₁)h^(1/2): "`f(t−i)=(2/3)2^(it)+(1/3)2^(−it)=⟨U_tξ,η⟩` … For the group `U_(−t)` … `f(t−i)=(1/6)2^(−it)+(4/3)2^(it)`". The block now has three Checks.
- R05 — repaired: From Mathlib (`:257–263`) now consumes `Continuous.fourierInv_fourier_eq` and `IsCoercive.continuousLinearEquivOfBilin` with their pinned hypotheses, and the Layer 11 Dependencies (`:4385`) list Lax–Milgram.
- R06 — repaired: the description now says "every Jones locator in README.md and Suggested.lean refers to that version", states the ℝ-and-ℂ PolarDecomposition contract, and lists the added declaration. Every sentence agrees with the head.

## Verified sound

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `exists_conj_commutant_eq_of_isCyclic_of_isSeparating` | Hilbert–Schmidt `M₂`, `h=diag(2/3,1/3)`, `Ω=h^(1/2)`, J the adjoint | `Im⟨xh^(1/2),h^(1/2)y⟩=Im Tr(h^(1/2)xh^(1/2)y)=0` (numerically −1e−16); `Re⟨ξ,Jξ⟩=Tr((h^(1/4)xh^(1/4))²)=4.10`; `JL_XJ=R_(X*)` (residual 0) | holds | none |
| same, degenerate and abelian | H=0; ℂ² diagonal, `Ω=(a,b)`, ab≠0 | H=0: Ω=0, J=0, M=M′={0}. ℂ²: `K=K.symplComp={(ra,sb)}`, `J(z)=(a/ā·z̄₁,b/b̄·z̄₂)`, `J diag(c,d) J=diag(c̄,d̄)` ∈ M′, onto | holds | none |
| same, each hypothesis dropped | B(ℂ²), e₁ (not separating); ℂ1 on ℂ², e₁ (not cyclic) | K=ℝ×ℂ (dim 3) vs `K.symplComp`=ℝ×0 (dim 1); K=ℝe₁ (dim 1) vs ℝe₁⊕ℂe₂ (dim 3): no bijective J, so the conclusion fails | both hypotheses needed | none |
| same, wrong J | −J; iJ on K=ℝ⊂ℂ | −J maps K onto `K.symplComp` with `Re⟨ξ,−Jξ⟩=−4.10<0`; `iJ(ℝ)=iℝ≠ℝ` | both excluded by the stated laws | none |
| V10.StandardRealSubspaces: J unique | K=ℝ⊂ℂ | antiunitary involutions are `z↦e^(iα)z̄`; ℝ→ℝ forces `e^(iα)=±1`; `Re⟨1,−1⟩=−1` leaves conjugation | holds; agrees with the new part of Check 1 | none |
| sign condition on iK follows from K | antilinear J, ξ∈K | `Re⟨J(iξ),iξ⟩=Re⟨−iJξ,iξ⟩=−Re⟨Jξ,ξ⟩≤0`, which is Prop 2.3(2) on L=iK (rieffel-van-daele-1977 lines 171–172, 192–195) | holds | none |
| Lemma 4.5 with the existential | M₂ model, `x'=R_a`, λ=1+i, random a; x′=1 | `x_ik=√(h_ih_k)(a*)_ik/(λh_i+λ̄h_k)`, residual 2e−16, x depends on λ; x′=1: `x=(2Re λ)⁻¹`, residual 0 | holds | none |
| new Check (R04) | M₂, `ξ=η=3^(−1/2)e₁₂+(2/3)^(1/2)e₂₁`, t=0.37 | `f(t)−⟨η,U_tξ⟩=1e−16`; `f(t−i/2)=0.91197=(2√2/3)cos(t log 2)`; `U_(−t)`: `f(t−i)=1.4509+0.2959i` vs `⟨U_(−t)ξ,η⟩=0.9673−0.0846i` | holds as written | none |
| contracts: Fourier inversion, Lax–Milgram | pin `Fourier/Inversion.lean:175`, `InnerProductSpace/LaxMilgram.lean:105` | V a finite-dimensional real inner product space, E complete over ℂ, f continuous with f and 𝓕f integrable; V complete real, B coercive, no symmetry | matches README `:257–263` | none |
| Jones 2015 pages (R03) | jones-vna 2015 text | Ex. 7.3.2/7.3.8 lines 1518/1538, p. 47; Def. 16.1.1 line 3714, p. 113; §16.2 line 3730, pp. 113–114; Thm 16.3.1 line 3745, p. 114; Thm 16.3.2 line 3817, p. 115 | match; the 2009 text gives 46, 107, 108, 109 | none |

Rows for the statements this diff leaves untouched stand as in the previous review, of 2f485b4. That covers the seeded sample 13.1 and 13.2, which are unchanged.

- Gate: this run at a494e8e has every counter 0 and prints `OK`; the worker's run also has `build=0`. The dependency check prints `depcheck: 206 roadmaps, 1900 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `git diff --stat` outside the folder is empty.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 33 `sorry` warnings and nothing else. The one-tactic probe (`simp | rfl | infer_instance | aesop`) on the new theorem leaves the goal unsolved. `#check @` on the six changed declarations keeps `[CompleteSpace H]` and every hypothesis.
- Source locators read against the text: rieffel-van-daele-1977, 6 (Prop. 2.3 lines 168–191, pp. 190–191; the remark after it at 192–198; Thm 4.2 line 575, p. 201; Lemma 4.5 lines 623–625; Lemmas 4.6–4.7 lines 658–692). Jones 2015, 10 (the four repaired; Thm 8.1.15, p. 53; EP10, p. 23; Def. 9.1.7 and Prop. 9.1.8, p. 57; Ex. 13.0.4, p. 93; Ex. 13.3.1, p. 98; Lemma 8.2.1, p. 54). Sample spot checks: hiai-lectures Thm 6.5 line 2666, pp. 55–56; anantharaman-popa Thm 11.2.2 line 8294, p. 186.
- Library declarations opened at the pins: Mathlib `StandardSubspace.lean:72` (scoped real inner product), `:97` and `:102` (`symplComp`, meaning `Im⟪y,x⟫=0`), `ClosedSubmodule.lean:188` (`Submodule.closure`). Mathlib `StandardSubspace.lean:42` lists Tomita's theorem as future work, and Tau Ceti `KMS/Separating.lean:24` is only a docstring, so neither pin proves the new target.
- Ownership: `roadmaps grep` for `exists_conj_commutant|JMJ=M'|symplComp` finds only this roadmap, so no fully qualified name clashes. OperatorAlgebraDynamics (main, `:566–576`) and Subfactors (main, `:229–240`) consume V10.ModularTheory and V10.KMS content that this head keeps. The BanachSpaceTheory anchors that the SelfAdjointSpectralTheory revision drops are mapped at its head under Scope and ownership.
- Overlap check: read QuantumFoundations, NoncompactQuantumSymmetry, CompactQuantumMetricSpaces, AnalyticNumberTheoryPartII and SelfAdjointSpectralTheory (open), and FactorRigidity, OperatorAlgebraDynamics and CStarAlgebras (main); the results-and-headings list is empty. Nothing is shared: none owns standard subspaces, the modular conjugation or Tomita's theorem, and the ones that use them consume this roadmap's V10.
- Remark: the docstring's "Both hypotheses are needed" gives a witness only for `hs`. ℂ1 on ℂ² with e₁ is the witness for `hc` (row 3).

## Not verifiable

- The `jones-vna` manifest entry records the 2009 PDF. I read the 13 November 2015 notes, which README `:5453` cites, from the cached copy of the Vanderbilt PDF.
- The items settled or not cached in the previous review are unchanged: Tomiyama 1957; Arveson 1969; Haagerup 1985 and 1987; Connes–Størmer 1978; Takesaki I–III; Reed–Simon; Rudin.

## Source issues

- **Misprint** in jones-vna (2015 notes) at Theorem 16.3.2, p. 115: the source states the result for vN(F_n) with "n≥" and no bound; it should say n≥2; affects nothing.
