# Review of StochasticCalculus (pull request #1030 at d668a62)

**Verdict:** needs changes

This is an incremental re-review of the 135 lines changed since `ed75179`. Only `README.md` changed: `Suggested.lean` and `metadata.toml` are byte-identical to the previous head, and nothing outside the folder changed. The gate passes. The one previous finding is repaired. The repair adds a short proof sketch to §0.1, and one inequality in that sketch is false at the generality §0.1 states. That is the only finding (P3), and it does not block.

## R01 (P3) — §0.1's new proof sketch states `d(f,g)≤ε+P(|f−g|>ε)`, which is false on finite measures of mass above 1

**Location:** `TauCetiRoadmap/StochasticCalculus/README.md:399`: "On finite measure spaces give convergence in measure its bounded metric presentation `d(f,g)=∫|f−g|/(1+|f−g|)dP`". At `:404`–`:405` it then states: "`x/(1+x)≤min(x,1)`, hence `d(f,g)≤ε+P(|f−g|>ε)`, in the other". At `:413`: "finiteness is needed both for the bounded-integral metric axioms and for its equivalence".

**Claim:** The section is stated for finite measures, not probability measures (`:399`, `:413`). The bound that `x/(1+x)≤min(x,1)` actually gives is `ε·P(Ω)+P(|f−g|>ε)`. Without the factor `P(Ω)`, the displayed bound is false as soon as the total mass exceeds 1. The target itself, the equivalence with `MeasureTheory.TendstoInMeasure P`, stays true. Only the route's inequality is wrong.

**Witness:** Take `Ω={a}`, `P=3δ_a`, `f=½`, `g=0` and `ε=½`. Then `d(f,g)=3·(½)/(3/2)=1`, but `ε+P(|f−g|>ε)=½+0=½`.

**Repair:** Write `d(f,g)≤ε·P(Ω)+P(|f−g|>ε)`, from `x/(1+x)≤x≤ε` on `{|f−g|≤ε}` and `≤1` off it. On the witness this gives `3·½+0=3/2≥1`. For a probability measure it is the current bound, and the equivalence argument goes through unchanged: let `P(|f_n−g|>ε)→0`, then `ε→0`. Alternatively, restrict §0.1's metric to probability measures and drop "finite measure spaces" at `:399` and `:413`.

## Previous findings

- R01 — repaired. Each of the nine sections now has a locator or an explicit own-computation statement, and §8.1 now credits the singularity half to the proof of Theorem 4.44. The passages at this head:
  - §0.1 `:402`: "an elementary own proof, not taken from a source".
  - §1.4 `:976`, `:981`: Mörters–Peres Theorem 1.9, p. 13, and Corollary 1.11, p. 14; the bridge and Volterra computations are marked as own computations.
  - §3.1 `:1411`, `:1442`: Karatzas–Shreve §3.2.A.
  - §3.3 `:1538`–`:1547`: Karatzas–Shreve Proposition 3.2.10, and Revuz–Yor IV §2.
  - §5.5 `:1931`: Theorem 3.3.16, and Revuz–Yor IV Theorem 3.6.
  - §6.7 `:2518`: Arnold Appendix A, plus its own mixing argument.
  - §7.5: Karatzas–Shreve Theorem 3.5.1 and §3.5.C, Revuz–Yor VI §1, Mörters–Peres Corollary 1.11, and its own corollary.
  - §8.1 `:2725`: "statement is absolute continuity … singularity otherwise is shown inside its proof".
  - §8.2 `:2740`: Hairer Exercise 4.29, p. 27.
  - §9.2: Karatzas–Shreve Theorem 5.2.5, Protter V, and Khasminskii Theorem 3.5 via Lee Theorem 2.2.

  The repair introduced R01 above.

## Verified sound

**Gate, elaboration, dependency check (run on this head).**
- `gate … StochasticCalculus --base origin/main`: every scanner reports 0 (`dropped=0`, `readme-ids-missing=0`, `stray-files=0`, `outside-folder=0`, `statement-hygiene=0`, `depcheck=0`); the verdict is OK, exit 0. The worker's gate with the targeted build also reports `build=0`.
- `lake env lean` on `TauCetiRoadmap/StochasticCalculus/Suggested.lean`: exit 0. The output has exactly 40 warnings, all of them "declaration uses `sorry`", one for each of the 40 theorems. There are no errors and no other warnings.
- `git diff --stat ed751793 HEAD` touches only `README.md`. The 58 signatures in `scratch/signatures.md` are therefore unchanged. The one flagged binder is again `[MeasurableSpace Ω]` on `stochasticExponential`, whose body does not use it. The previous padding probe applies unchanged: on a scratch copy, all 40 theorems failed under `first | rfl | infer_instance | trivial | simp`. The one citation lead, `ElementaryIntegrand.toProcess`, is this roadmap's own `def` at `Suggested.lean:121`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/StochasticCalculus'` is empty.
- The dependency check prints

```text
depcheck: 238 roadmaps, 2322 edges, 0 problem(s)
```

  It prints no UPWARD, CYCLE or `moved:` line. StochasticCalculus is line 210 of the merge order. The diff adds no supplier citation.
- `roadmaps overlaps StochasticCalculus` (rerun): no other pull request changes this folder, and no ids are dropped or defined only by an open revision. `roadmaps grep` finds no other owner of the two newly cited objects:
  - "Wiener shift" or "metric dynamical system": only this README (`:2519`, `:3222`, `:3833`).
  - "Khasminskii" or "nonexplosion": only this README, plus PointProcesses' point-process nonexplosion (a different object, and a roadmap this one may not cite).

**Sources read at the new locators (cache line numbers).**
- `morters-peres` (the printed page is the running header):
  - line 803, Theorem 1.9 (time inversion), printed p. 13 (header at line 785);
  - lines 856–861, Corollary 1.11, printed p. 14 (header at line 840); its proof is exactly "`B_t/t=X(1/t)→X(0)=0`" via Theorem 1.9, as the README says;
  - lines 1491–1493, Theorem 1.38, printed p. 25 (header at line 1486): part (1) is singularity for `F∉D[0,1]`, part (2) equivalence for `F∈D[0,1]`, with `F(0)=0`. So "Theorem 1.38(1)" in §8.1 is exact.
- `hairer-spde`:
  - lines 1396–1402, Exercise 4.29, on page 27 (page-27 marker at line 1357, page-28 marker at line 1403): the Cameron–Martin space of Wiener measure on `C([0,1],ℝ)` is the absolutely continuous `h` with `h(0)=0` and `∫ḣ²<∞`.
  - lines 1555–1556, Theorem 4.44: the statement is absolute continuity iff `h∈H_µ`.
  - lines 1585–1591: the proof bounds TV distance below by `2−2exp(−n²/8)` for every `n`, hence singularity; this is all on page 31 (lines 1539–1592).
- `theodorakopoulos`:
  - line 288, Definition 4.1: a filtration "without the usual conditions", and a pointwise definition of predictable time.
  - line 304, Lemma 4.2: the `E*` paving.
  - lines 318–319, Theorem 4.4: for `P∈S(𝒫)` and `ε>0` there is a predictable `σ` with graph in `P` and `P*(π_Ω P)−P(σ<∞)≤ε`.

  This matches §0.5 `:728`–`:733`, including "without completing the probability space".
- `lee-explosion-survey`, lines 344–353, Theorem 2.2, attributed there to Khasminskii's Theorem 3.5 in the 2012 Springer book (bibliography line 790). Its hypotheses are locally Lipschitz coefficients and a positive C² `V` with `LV≤CV` and `inf_{|x|>R}V→∞`. Its conclusion is `P(τ_∞<∞)=0`. The README's restatement at `:2974` matches it.

**Adversarial table.** Rows marked (new) are computed in this review for the changed statements. Rows marked (r6) are carried forward unchanged from the previous report, `PRREVIEW-StochasticCalculus_r6`, for statements the diff leaves untouched; their values are recorded there.

| Statement | Instances tried | Computed sides | Result; change |
|---|---|---|---|
| (new) §0.1 Markov direction | `f−g≡2`, ε=1, P prob. | `P(\|f−g\|>1)=1 ≤ ((1+1)/1)·(2/3)=4/3` | correct; none |
| (new) §0.1 reverse bound | `f−g≡½`, ε=½; P prob. vs `P=3δ_a` | prob.: `1/3 ≤ ½`; mass 3: `d=1 > ½+0` | false off probability measures; R01 |
| (new) §0.1 triangle, completeness | φ(x)=x/(1+x), x=y=1; `f_n=1_[0,1/n]` on [0,1] | `φ(1)+φ(1)=1 ≥ φ(2)=2/3`; `d(f_n,0)=1/(2n)→0`, limit 0 | correct; none |
| (new) §0.5 predictable section | E=graph of τ≡1; E=∅ | T=1, `P(T<∞)=1=P*(πE)`; T=∞, `0 ≥ 0−ε` | matches Th. 4.4; none |
| (new) §1.4 time inversion, LLN | `X_t=tB_{1/t}`, s=1, t=2 | `Cov=2·min(1,½)=1=min(1,2)`; `B_t/t=X_{1/t}→X_0=0` | correct; none |
| (new) §1.4 bridge covariance | T=2, s=t=1; s=t=T | `Var(B_1−½B_2)=1−1+½=½=1−1·1/2`; `T−T²/T=0` | correct; none |
| (new) §1.4 Volterra covariance | K≡1, s=t | `t+t²+t³/3` (`∫∫min(u,v)=t³/3`) | correct; none |
| (new) §3.1 Brownian μ, rectangle | (1,3]×A, P(A)=½ | Leb⊗P: `2·½=1` = README Check value 1 | correct; none |
| (new) §3.1 `μ_M=E∫1_A d⟨M⟩` | M=2B, (1,3]×A, P(A)=½; Poisson α=2, (1,3]×Ω | `E[1_A(2B₃−2B₁)²]=4·2·½=4=E∫1_A d(4t)`; `E(M₃−M₁)²=4=α·2` | correct; none |
| (new) §3.3 `μ_Y=X²μ_M`, `⟨∫XdM⟩=∫X²d⟨M⟩` | X=2, M=B, T=3 | `E(2B₃)²=12=∫4 dt`; `⟨2B⟩_t=4t` | correct; none |
| (new) §5.5 Lévy (locator only) | M=2B; vector (W,W) | `[2B]_t=4t≠t`; `[M¹,M²]_t=t≠0` | both excluded; none |
| (new) §6.7 separated windows | A={B₁−B₀>0}, B the same, s=1 vs s=½ | s=1: `P=¼=P(A)P(B)`; s=½: correlation ½, `P=¼+arcsin(½)/2π=1/3≠¼` | separation needed, as stated; none |
| (new) §7.5 finite-horizon density | constant θ, horizon T | `E Z_T²=E e^{2θB_T−θ²T}=e^{θ²T}<∞` | correct; none |
| (new) §7.5 singularity at infinity | θ=1 | Q: `B_t/t→1`; P: `B_t/t→0`; disjoint tail events | correct; none |
| (new) §7.5 drifted harmonic representation | b≡c, `f=e^{−2cy}` (`½f″+cf′=2c²−2c²=0`), B from x | `e^{−cx−c²t/2}·E e^{−cB_t}=e^{−cx−c²t/2}·e^{−cx+c²t/2}=e^{−2cx}=f(x)` | sign of density pinned; none |
| (new) §7.5 generalized Itô route | f∈C¹, f′ loc. AC | f′ loc. BV ⇒ f a difference of convex functions; `∫₀ᵗ1_N(X_s)ds=∫1_N(a)L^a_t da=0` for Lebesgue-null N | correct; none |
| (new) §8.1 Hairer 4.44 | B=ℝ, µ=N(0,1); TV bound, h=2 | every translate equivalent (H_µ=ℝ); `2−2e^{−1/2}=0.787 ≤ 2(2Φ(1)−1)=1.365` | correct; none |
| (new) §8.2 identification, translate laws | h(t)=t on [0,1]; h≡1; h=2t, times 1,3 | norm² 1; `h(0)=1` excluded; mean (2,6), cov ((1,1),(1,3)) | correct; none |
| (new) §9.2 `LV` for `V=1+‖x‖²` | d=1, b(x)=x, σ=1, C=1 | `LV=2x²+1 ≤ 3(1+x²)` | correct; none |
| (new) §9.2 `V+1` reduction | global min x₀ of V; consumers `log(1+y²)`, `R²` | `L_tV(x₀)=½tr(σσᵀ∇²V(x₀))≥0` forces `V(x₀)≥−1` when `C_T>0`, so `V+1≥0` (all Lee's proof uses, line 374); consumers have V≥0 | correct for nonnegative Lyapunov V; none |
| (r6) §0.6 Poisson process, regularization, jump-time laws, waits | rate 2, t=3; α=0; boxes; k=0 | values in r6 | correct; none |
| (r6) §2.1, §2.3, §2.5, §3.5, §4.4 Poisson identities | α=2, s<t=3; one-jump path | values in r6 | correct; none |
| (r6) §2.2 class D/DL; §2.3 doubling, ruin | n=1,100; p≠q | values in r6 | correct; none |
| (r6) §6.1 Markov Check; §6.4 `IsBrownianVector`, `brownian_point_polar` | ∫B; (W,W); d=1,2 | values in r6 | correct; none |
| (r6) §6.5.3 `H^p`; §9.3 Checks; weak-solution headlines | 1/(1−z); b≡1; b=0 | values in r6 | correct; none |
| (r6) §10.2 generator, pseudoinverse; `feynmanKac_scalar` | BM x²; OU; diag(2,0); u=sin | values in r6 | correct; none |
| (r6) §5.3 Stratonovich, biased clock; §1.1 Chentsov; `exists_wienerMeasure` | h=x; μ_p; p=2m | values in r6 | correct; none |
| (r6) §3.4 domain; `IsItoIntegral`; QV predicate and uniqueness; BDG; Itô C² | H=2; t=0; A=2t; f=x² | values in r6 | correct; none |
| (r6) Lévy, reflection, hitting/exit, LIL/modulus, augmentation, local time | M=2B; x=a; t=a=1 | values in r6 | correct; none |
| (r6) §7.1 clocks; DDS; Novikov/Girsanov; Cameron–Martin headlines and Layer-8 Checks | min(t,1); M=2B; θ=2; h=2t, √t, h(0)=1 | values in r6 | correct; none |
| (r6) §8.3 finite grids; §9.1, §9.4, §9.4a; §4.2; §3.5 overshoot; §1.5 Donsker | D_n; b=tx; d=3 Bessel; uniform grid | values in r6 | correct; none |

**Library and cross-roadmap.** The diff names no new library declaration and no new cross-roadmap section. The declarations and citations resolved in the previous report are untouched.

**Remark on text outside this folder (no change requested).** The board manifest's `morters-peres` and `hairer-spde` locator fields do not list Theorem 1.9, Corollary 1.11, Theorem 1.38 or Exercise 4.29, all of which the README now cites.

## Not verifiable

- **Karatzas–Shreve** (settled as uncertified): §3.2.A, Proposition 3.2.10, Theorem 3.3.16, Theorem 3.5.1, §3.5.C, Theorem 5.2.5 and Lemma 2.9.4 are cited by locator only. A public library scan of the second edition's table of contents confirms these placements:
  - §3.2 starts at p. 129, and subsection A, "Simple processes and approximations", at p. 132;
  - 3.2.B (the integral's construction and properties) is at p. 137, and 3.3.B (the martingale characterization of Brownian motion) at p. 156;
  - 3.5.A (the basic result) is at p. 191, and 3.5.C (Brownian motion with drift) at p. 196;
  - 5.2.B (the Itô theory) is at p. 286.

  Whether μ_M is defined in subsection A or in the preamble on pp. 129–131 is not settled without the text; "§3.2" would be safe either way.
- **Revuz–Yor** (uncertified): IV §2, IV Theorem 3.6, VI §1 and VIII §1. A secondary citation places the Cameron–Martin theorem at pp. 333–335, but the section it falls in could not be determined from public tables of contents.
- **Protter** Chapter V (uncertified).
- **Arnold**, Appendix A (uncertified). A public listing gives "Measurable Dynamical Systems", A.1–A.4. Secondary citations place the two-sided Wiener process and its ergodic shift there (p. 547).
- **Khasminskii**, Theorem 3.5 (uncertified). This review relies only on Lee's attribution.
- **MATH5695**: waived.

## Source issues

- **Misprint** in hairer-spde at Theorem 4.44, proof, p. 31: the source says the image of the translated measure under the functional ℓ is the normal law with mean −ℓ(h); it should be mean +ℓ(h), since the translation is the pushforward under x↦x+h; affects nothing.
- **Misprint** in hairer-spde at Theorem 4.44, proof, p. 31: the source says the intermediate exponent carries −iC_µ(ℓ,h*); it should be +iC_µ(ℓ,h*), which is what the stated final expression exp(−½C_µ(ℓ,ℓ)+iℓ(h)) needs; affects nothing.
- **Error** in lee-explosion-survey at Theorem 2.2, proof, p. 7: the source says E[V(X_{τ_R})e^{−C(τ_R−t₀)}] is at most E[V(X_{τ_R})]e^{−C(t−t₀)}; it should be at least, because τ_R≤t, and the corrected chain gives the bound used next; affects the proof.
- **Misprint** in lee-explosion-survey at Theorem 2.2, proof, p. 6: the source says the Dynkin-formula integrand is LV·e^{−C(s−t₀)}; it should be (LV−CV)·e^{−C(s−t₀)}, the generator of the weighted function computed just above; affects the proof.
