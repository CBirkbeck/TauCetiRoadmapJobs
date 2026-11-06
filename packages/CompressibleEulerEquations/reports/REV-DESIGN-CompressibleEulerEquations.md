<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/6960#issuecomment-6676486017 -->
Review (claude) of c9e56ec

Verdict: needs_changes

1. **F01** (P2) The "singular iff" of the Euler symbol fails for `n = 1`, barotropic

   Location: `design/README.md` line 382 ("and singular if and only if `ζ₀ + v·ζ′ = 0` or
   `|ζ₀ + v·ζ′| = c|ζ′|`"); repeated at line 440 ("singular iff `ζ` is `g_U⁻¹`-null or
   `ζ₀ + v·ζ′ = 0`") and in `plan.json` targets 2.2.3 and 3.1.1.

   Claim: for every state of either Euler system and every `ζ`, `σ(U; ζ)` is singular iff
   `ζ₀ + v·ζ′ = 0` or `|ζ₀ + v·ζ′| = c|ζ′|`.

   Witness: the same section gives the root `ζ₀ + v·ζ′` multiplicity `n − 1`, which is `0` for the
   barotropic system with `n = 1`. Take `n = 1`, `ρ = 1`, `c = 2`, `v = 3` (the README's own
   instance, `A⁰ = diag(4, 1)`, `A¹ = [[12, 4], [4, 3]]`) and `ζ = (−3, 1)`: `ζ₀ + vζ₁ = 0`, yet
   `σ = −3A⁰ + A¹ = [[0, 4], [4, 0]]` with `det σ = −16 ≠ 0`, and `g⁻¹(ζ, ζ) = −c⁻²·0 + 1 = 1`, so `ζ`
   is not null either. The "if" direction is false; both §2.2 and §3.1.1 inherit it.

   Repair (tested on the witness: with the clause below the instance is correctly "nonsingular"):
   state "singular iff `|ζ₀ + v·ζ′| = c|ζ′|`, or `ζ₀ + v·ζ′ = 0` when that root has positive
   multiplicity (barotropic with `n ≥ 2`; full system for every `n`)", in §2.2, §3.1 (identification
   bullet), §3.1.1 and the two plan.json statements; add the instance as a negative-control Check of
   §2.2 ("`n = 1`, barotropic, `ζ = (−3, 1)` at `(ρ, v) = (1, 3)`, `c = 2`: `det σ = −16`").

2. **F02** (P2) §5.4 drops the time regularity of `A⁰` that its route and sources use

   Location: `design/README.md` lines 822–824 ("for coefficients `A^μ(t, x)`, `B(t, x)` with
   `A^μ − Ā^μ, B ∈ C([0, T]; Hᵏ_Λ)` … obeying the estimate of §5.3"); `plan.json` target 5.4
   hypotheses.

   Claim: existence, uniqueness and the §5.3 estimate for `LW = f` under coefficients that are
   merely continuous in time with values in `Ā + Hᵏ_Λ`.

   Witness: the §5.1 identity (line 736) contains `∫⟨∂_tA⁰ W, W⟩`, the §5.3 bound (line 799)
   contains `‖∂_tU‖_∞`, and the §5.4 route takes "the bounds of §5.3 … uniformly in `ε`"; with
   `A⁰ ∈ C([0, T]; Ā⁰ + Hᵏ_Λ)` only, `∂_tA⁰` need not exist and the constant of the estimate is
   undefined. Kato1975 Theorem I and Majda1984 Ch. 2 (the cited sources) assume `A⁰` Lipschitz in
   `t`; §7.1's iteration supplies `A⁰(U^m)` with `U^m ∈ C¹([0, T]; Hᵏ⁻¹_Λ)`, so the hypothesis costs
   the consumer nothing.

   Repair: add to §5.4 and plan.json 5.4 the hypothesis `A⁰ − Ā⁰ ∈ C¹([0, T]; Hᵏ⁻¹_Λ)` (hence
   `∂_tA⁰` bounded, as `2(k − 1) > n`), and state the estimate's constant as depending on
   `‖∂_tA⁰‖_∞`, `λ₀`, `sup_t ‖A^μ − Ā^μ‖_{Hᵏ_Λ}` and `sup ‖B‖_{Hᵏ_Λ}`; in §7.1's route note that
   `U^m ∈ C¹([0, T]; Hᵏ⁻¹_Λ)` provides it.

3. **F03** (P2) §4.4's loss bound needs `k ≥ 1`

   Location: `design/README.md` line 696 ("`‖J_εu − u‖_{Hᵏ⁻¹_Λ} ≤ Cε‖u‖_{Hᵏ_Λ}`"); `plan.json`
   4.4 API `gain_loss`.

   Claim: the bound for every `k ∈ ℕ`.

   Witness: with natural-number subtraction `k = 0` reads `‖J_εu − u‖_{L²_Λ} ≤ Cε‖u‖_{L²_Λ}`. Take
   `n = 1`, `Λ = 2πℤ`, `u = cos(mx)`: by the section's own Check `J_εu = φ̂(εm) cos(mx)`, so
   `‖J_εu − u‖₂ = |1 − φ̂(εm)|·‖u‖₂ → ‖u‖₂` as `m → ∞` (Riemann–Lebesgue), which exceeds
   `Cε‖u‖₂` once `Cε < 1`.

   Repair: write "for `k ≥ 1`" on that bound (tested: for `k = 1` the bound
   `‖J_εu − u‖_{L²} ≤ Cε‖u‖_{H¹}` holds, `|1 − φ̂(εm)| ≤ C εm ≤ Cε(1 + m²)^{1/2}`).

4. **F04** (P2) The moving-cone lens is not a lens function when `Λ ≠ 0`

   Location: `design/README.md` lines 874–876 ("**Moving cones.** … the function
   `φ = R − |x − x₀ − (t − t₁)w| − M(t − t₁)` is a lens function"); `plan.json` 6.1 API
   `movingCone`; used by the routes of §6.2 (line 909) and §8.4 (b) (line 1174).

   Claim: that `φ` is a lens function in the sense of the same section, which requires a
   Λ-periodic `φ` (line 857), for the fixed period group of the Conventions.

   Witness: `n = 1`, `Λ = 2πℤ`, `t = t₁`: `φ(t₁, x₀) = R` while `φ(t₁, x₀ + 2π) = R − 2π ≠ R`; `φ` is
   not Λ-periodic, so neither §5.2 (which integrates `χ⟨A⁰W, W⟩` over a fundamental domain and
   needs `χ` Λ-periodic, line 760) nor §6.1.1 applies to it, and §6.2's sweep and §8.4 (b)'s added
   lens are stated for Λ-periodic solutions.

   Repair: define the moving cone as the Λ-periodisation
   `φ(t, x) = sup_{λ∈Λ} (R − |x − λ − x₀ − (t − t₁)w| − M(t − t₁))`, which is Lipschitz, Λ-periodic,
   equals the single cone when `Λ = 0`, and for `2R` below the least distance between distinct
   points of `Λ` has pairwise disjoint positive parts, so it is spacelike for `U₁` iff each
   translate is (tested on the witness: the periodised `φ` takes the value `R` at both `x₀` and
   `x₀ + 2π`). Say in §6.2 and §8.4 (b) that the lenses used are these.

5. **F05** (P2) "Equal norms" with Tau Ceti's `Wkp` is false for `k ≥ 2`

   Location: `design/README.md` lines 593–597 ("`u ∈ Hᵏ_Λ` iff each coordinate of `u` is the value
   of an element of `TauCeti.Wkp volume ⊤ 2 k` … with equal norms in the first case", line 596);
   `plan.json` 4.1 API `eq_wkp`.

   Claim: the `ℓ²`-over-multi-indices norm of §4.1 equals the `Wkp` norm at the pin.

   Witness: at the pin the `Wkp` norm is the `WithLp 2` product of the lower-order norm and the
   `L²` norm of the highest iterated gradient (`TauCeti/Analysis/Sobolev/GraphStep/Basic.lean:75`),
   whose pointwise norm is the operator norm on `IteratedGradient E j = E →L[ℝ] …`
   (`TauCeti/Analysis/Calculus/IteratedGradient.lean:70–76`). For `u = e^{−|x|²}` on `ℝ²` the
   Hessian at `0` is `−2I`: operator norm `2`, while `Σ_{|α|=2} |∂^αu|² = 4 + 4 = 8`, root `2√2`; the
   pointwise inequality is strict on an open set, so the integrated norms differ. At `k ≤ 1` the two
   agree (the dual of a Euclidean space carries the Euclidean norm).

   Repair: "with equivalent norms (equal for `k ≤ 1`)".

6. **F06** (P3) Pinned Tau Ceti objects of Layer 4 to cite, not restate

   Location: `design/README.md` §4.1 (lines 581–620), §4.3 *Needs:* (lines 687–689), §4.4 (lines
   690–699 and *Needs:* lines 713–714); "From Tau Ceti" (lines 173–195).

   Claim (implicit): the whole-space mollifier bounds, the Leibniz rule and the periodic
   one-dimensional space are new here.

   Witness, at the Tau Ceti pin: `TauCeti.Wkp.normedBumpL` with `norm_normedBumpL_le_one`,
   `iteratedGradient_normedBumpL` and `tendsto_normedBumpL`
   (`TauCeti/Analysis/Sobolev/Wkp/ApproximateIdentity.lean:52,67,118,132`) are the `Λ = 0`
   contraction, commutation with the iterated gradient and convergence of §4.4 (and
   `TauCeti.W1p.normedBumpL`, `TauCeti/Analysis/Sobolev/W1p/Mollification.lean`, the order-one
   case); `TauCeti.HasWeakLineDerivOn.contDiffOn_smul` and `lipschitzOnWith_smul`
   (`TauCeti/Analysis/Sobolev/Leibniz.lean:112`) are the Leibniz rule §4.3 names only
   generically; `TauCeti.CircleSobolev s E` (`TauCeti/Analysis/Sobolev/Circle/Basic.lean:197`), the
   Fourier-weighted Sobolev space of `AddCircle T` with weight `(1 + |n|)^s`, is `Hᵏ_Λ` for `n = 1`
   and `Λ = Tℤ` up to norm equivalence (for `cos x`, `T = 2π`: the circle norm squared with its
   normalisation and weight `(1 + 1)^1` versus `2π` here).

   Repair: in "From Tau Ceti" and the *Needs:* lines, name these declarations; in §4.4 say that for
   `Λ = 0` the contraction, commutation and convergence are `TauCeti.Wkp.normedBumpL`'s and that
   only the Λ-periodic transfer, the `ε⁻¹`/`ε` bounds and Friedrichs' lemma are proved here; in
   Scope, record `TauCeti.CircleSobolev` beside IncompressibleFlows as the `n = 1` full-rank case
   with a norm-comparison Check.

7. **F07** (P3) The §3.3 theorems carry only definition locators

   Location: `design/README.md` lines 524–545 (the "Prove:" bullets of §3.3); `plan.json` 3.3.1
   (locator "Minguzzi2019 line 1917, §2.11"), 3.3.2 ("MinguzziCone2019 lines 1737–1740, Definition
   2.17 and §2.9"), 3.3.3 ("BarGinouxPfaffle2007 line 1006, Definition 1.3.5").

   Claim: locators for compact pasts, openness, idempotence and the slab description.

   Witness: MinguzziCone2019 line 1737 is a definition for closed achronal `S`; BarGinouxPfaffle2007
   line 1006 is a definition; neither states an openness or slab result for open `S`. The nearest
   classical statements are Minguzzi2019 line 3718, eq. (3.1) (`Int D⁺(S) = I⁺(S) ∩ I⁻(D⁺(S))` for
   closed `S`) and §2.11 (line 1917) for the limit-curve input to compactness.

   Repair: cite Minguzzi2019 line 3718 for openness and line 1917 for compact pasts as the
   classical analogues, keep the definitions as locators of the notions, and say in the section
   that the open-`S` statements are proved here along the routes given (as the design report
   already explains).

Files reviewed: `packages/CompressibleEulerEquations/design/README.md` (1284 lines, 8 layers),
`packages/CompressibleEulerEquations/design/plan.json` (53 targets, no gaps),
`packages/CompressibleEulerEquations/sources.toml` (21 entries). Previous review: none. Seven
findings, five blocking (P2), two P3. No P1: nothing is false as a whole, vacuous or unowned.

## Headline theorems (design stage)

From the README (lines 208–213): local well-posedness of compressible Euler (§7.2); local
uniqueness on lens-shaped domains (§6.1); maximal common development, existence of maximal
developments and the uniqueness criterion (§8.2); existence of developments (§8.3); nullity of
the regular boundary (§8.4 (b)). No `Suggested.lean` exists at the design stage. For the package:
§7.2 with `Λ = 0` is statable on `TauCeti.Wkp volume ⊤ 2 k`; general `Λ` needs `Hᵏ_Λ` with a real
body (Λ-periodic `L²_loc` with `TauCeti.HasWeakFDerivOn` derivatives); §6.1, §8.2–§8.4 need the
quasilinear-system structure, causal curves and `D⁺` as real-bodied definitions on native
carriers, all of which the design's definitions admit. Elaboration: not available (this lane
does not elaborate).

## Adversarial table

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | Conventions, signature witness | `n=1,c=1,v=0`; `(1,1/2),(1,1),(1,2)` | `g = −3/4, 0, 3`; `g((1,0),(1,1/2)) = −1`; `g⁻¹(dt,dt) = −1/4` at `c=2` | consistent | — |
| 2 | Luk–Speck normalisation | `c=2,v=0,X=(1,0)` | LukSpeck line 2001: `−dt² + c⁻²Σ(dx−vdt)²`; theirs `−1`, ours `−4` | conformal factor `c⁻²` confirmed | — |
| 3 | Dominance sign | transport `a=3`, cone `(1,0)`, `ζ=(1,−1)` | cone `1 ≥ 1`, symbol `−2` | not dominating | — |
| 4 | 1.1 sound speed | `p=ρ²/2` at `4`; `p=ρ²` at `1/2`; Chaplygin; `p=−ρ²` | `c=2` (not `4`); `c=1`; `p′=A/ρ²>0`; `p′=−2ρ<0` | definition discriminates | — |
| 5 | 1.2 expanding flow | `n=1,t=1` | `∂_tρ=−ρ₀/4=−∂_x(ρv)`; `∂_tv+v∂_xv=−x/4+x/4=0`; general `n`: `−nρ₀(1+t)^{−n−1}` both sides | solution | — |
| 6 | 1.2.2 boost | `w=1`, `t=1` | correct `ṽ=(y−t)/(1+t)+1`: `−(1+y)/(1+t)²+(1+y)/(1+t)²=0`; wrong rule residual `−1/(1+t)=−1/2` | `+w` needed | — |
| 7 | 1.3 entropy wave | `P=e^sρ²,s=x,ρ=e^{−x/2}` | `P(ρ,s)=1`; dropped term `e^{x/2}·2e^{x/2}·(−e^{−x/2}/2)=−e^{x/2}` | non-barotropic stationary solution | — |
| 8 | 2.1 monotonicity | `(c,w)`→`(c′,w′)`, `c′≥c+|w′−w|` | `ζ₀+w·ζ′ ≥ c′|ζ′|−|w−w′||ζ′| ≥ c|ζ′|` | holds | — |
| 9 | 2.1 cone map | `κ(U)=(1+λ(U),0)` | `λ=max_{ω,x}⟨Σω_iAⁱx,x⟩/⟨A⁰x,x⟩ ≥ 0` (ω↦−ω), continuous; `σ ≥ (ζ₀−λ|ζ′|)A⁰ ≥ |ζ′|A⁰` | dominating, continuous | — |
| 10 | 2.1 wave system | `ζ=(1/2,e₁)` | eigenvalues of `e₀ζ′ᵀ+ζ′e₀ᵀ`: `±|ζ′|,0`; symbol `1/2−1=−1/2` | `(1/2,0)` fails | — |
| 11 | 2.2 barotropic symmetriser | `n=1,ρ=1,c=2,v=3` | `A¹=[[12,4],[4,3]]`; `det(A¹−λA⁰)=4λ²−24λ+20=4(λ−1)(λ−5)`; `A⁰=I` gives `[[3,1],[4,3]]` | speeds `v∓c`; asymmetric wrong weight | — |
| 12 | 2.2.1 full symmetriser | `P=e^sρ²` at `(1,0)` | `SM` symmetric for any `d` (`(ρ,s)`: `bv` both; `(v,s)`: `P_s=bρ`); `ad−b²=P_ρ/ρ`; minors `2,2,2`; `d=1/2` gives `0` | positive definite exactly with `d=1+P_s²/(ρP_ρ)` | — |
| 13 | 2.2.3 singular iff | `n=1`, barotropic, `ζ=(−3,1)` at `(1,3)`, `c=2` | `σ=[[0,4],[4,0]]`, `det=−16`; `g⁻¹(ζ,ζ)=1` | **false** at multiplicity `0` | R01 |
| 14 | 2.2.3 dominance iff | `(2,3)`, `(2,0)`, `(5,0)`; converse `e=(w−v)/|w−v|`, `ζ₀=c′−w·e` | `2−3−2=−3`; `5=2+3`; `ζ₀+v·e=c′−|w−v|<c` | sharp both ways | — |
| 15 | 3.1 Gram/inverse | `n=2,c=2,v=(1,0)` | Gram `[[−3,−1,0],[−1,1,0],[0,0,1]]`, `det −4`; product with `[[−1/4,−1/4,0],[−1/4,3/4,0],[0,0,1]]` is `I` | inverse formula right | — |
| 16 | 3.1 covectors | `ζ=(−3,1,0)` | `ζ₀+v·ζ′=−2=−c|ζ′|`; `ζ((1,3,0))=0` | null, past; kernel contains the null vector | — |
| 17 | 3.1 future-causal covector | `X=(τ,ξ)`, `|ξ−τv|≤cτ` | `ζ(X)=τ(ζ₀+v·ζ′)+ζ′·(ξ−τv) ≥ τ(ζ₀+v·ζ′−c|ζ′|)` | iff holds | — |
| 18 | 3.2 causal curves | Cantor `10f`; `eᵗ`,`e^{3t}` for `(1,x)` | `10>1`; `|ẋ−v|=0`, `2e^{3t}>1` | Lipschitz condition needed | — |
| 19 | 3.3 closed vs open domain | `D={|x|≤1+t}`, `S=[−1,1]`; open version | from `(1,1.9)`: `x≡1.9` hits `|x|=1+s` at `s=0.9`; closed: continue along `x=1+s` to `(0,1)∈S`, `D⁺=D`; open: inextendible on `(0.9,1]`, `D⁺={|x|<1−t}` | closed formulation blind | — |
| 20 | 3.3 unbounded field | `(1,x²)`, `x(s)=1/(1/4−s)` | `x(1/2)=−4`, `ẋ=x²`, `x→−∞` as `s↓1/4` | `(1/2,−4)∉D⁺(Σ₀)` | — |
| 21 | 3.3 expanding flow | `p=ρ²/2,ρ₀=1,S=(−1,1)` | `c=(1+t)^{−1/2}`, `y=x/(1+t)`, `ẏ=−(1+t)^{−3/2}`, `y=2(1+t)^{−1/2}−1`, boundary `2√(1+t)−(1+t)`; closes `t=3`; `0.828` at `t=1` | exact | — |
| 22 | 3.3 compact pasts | `p∈D⁺_D(S)`, `q_m∈J⁻(p)` unbounded or `→q∉D` | limit curve on `(s,t_p]` inextendible by equi-Lipschitz near `(s,x(s))`, misses `S` | contradiction, so compact | — |
| 23 | 4.1 norms | `1` on `(2πℤ)ⁿ`, `Λ_cyl`; `e^{−(x¹)²}cos x²`; `cos x` | `(2π)ⁿ`, `∞`; `√(π/2)·π`; `π+π=2π` vs `(1+4π²)/2` (IncompressibleFlows weight `(1+4π²|k|²)^{s/2}`, #237 line 170–171) | values right | — |
| 24 | 4.1 equal norms with `Wkp` | `u=e^{−|x|²}`, `n=2`, `k=2` | Hessian `−2I` at `0`: operator norm `2`, multi-index `ℓ²` `2√2` | **overclaim** | R05 |
| 25 | 4.2 Gaussian | `e^{−x²}` | `‖u‖²=‖u′‖²=√(π/2)`, `‖u″‖²=(3−4+4)√(π/2)=3√(π/2)`; `2√(π/2)≈2.507 ≤ √5·√(π/2)≈2.80`; `1 ≤ 1.2533` | holds | — |
| 26 | 4.2 wrong exponents | `u(λx)` | `λ^{1/2}` vs `λ^{1/6}` | refuted | — |
| 27 | 4.3 GN | `u=e^{−x²}`, `k=2,i=1`; scaling | `‖u′‖₄⁴=3√π/8`, `‖u′‖₄≈0.903 ≤ (5√(π/2))^{1/4}≈1.582`; both sides `λ^{i−ni/(2k)}` | holds | — |
| 28 | 4.3 algebra | `|x|^{−n/3}` | `∫u²<∞` iff `2n/3<n`; `∫u⁴=∞` iff `4n/3≥n` | `L^∞` factor needed | — |
| 29 | 4.4 Fourier side | `cos(mx)`, even `φ` | `J_ε cos(mx)=φ̂(εm)cos(mx)`; `k=0`: `|1−φ̂(εm)|→1` | **`k≥1` needed** | R03 |
| 30 | 4.4 Friedrichs, `a=x` | `ψ(z)=−zφ_ε(z)` | `‖ψ′‖₁=∫|φ(w)+wφ′(w)|dw` (substitute `z=εw`) | `ε`-independent | — |
| 31 | 5.1 identity signs | `B=bI`; Jordan `A¹=[[0,1],[0,0]]` | `E=e^{−2bt}E₀`; `W=(g−tf′,f)`, growth `t‖f′‖₂` | signs right; symmetry needed | — |
| 32 | 5.2 weight | transport `a=1`, `χ=(1−|x|−t/2)₊`, `f` on `(−2,−1)` | defect `1/2` for `x<0`; support `(−1.1,−0.1)` meets `{|x|<0.55}` at `t=0.9` | hypothesis necessary | — |
| 33 | 5.2 Euler cones | constant state; static `v₀=3,c₀=1` | `(e·v₀−c₀)−v₀·e+c₀=0`; `−M−3·sign x+1≤0` iff `M≥4`; moving `M≥1` | sharp | — |
| 34 | 5.3 Burgers | `W=u` | `d/dt‖u‖²=−(2/3)∫∂_x(u³)=0`; `d/dt‖u_x‖²=−2∫u_x³+∫u_x³=−∫u_x³` | tame form | — |
| 35 | 5.4 coefficients | `A⁰∈C([0,T];Ā⁰+Hᵏ_Λ)` only | identity needs `∫⟨∂_tA⁰W,W⟩`; §5.3 constant has `‖∂_tU‖_∞` | **missing hypothesis** | R02 |
| 36 | 6.1 moving cone, `Λ≠0` | `Λ=2πℤ`, `t=t₁` | `φ(t₁,x₀)=R`, `φ(t₁,x₀+2π)=R−2π` | **not Λ-periodic** | R04 |
| 37 | 7.1 `F(Ū)=0`; Burgers | `F≡1`; `u₀=−e^{−x²}` | `u₀+t∉L²(ℝⁿ)`; `min u₀′=−√2e^{−1/2}`, `T*=e^{1/2}/√2≈1.1658` | needed; criterion realised | — |
| 38 | 7.2 simple wave | `p=ρ³/3` | `c=ρ`, invariants `v±ρ`; `v−ρ≡−1`, `w=v+ρ=2ρ−1` solves `w_t+ww_x=0`; `w₀=1+e^{−x²}`, `T*=e^{1/2}/√2`, `ρ∈[1,3/2]`; `n=3`: `6>5`, `4<5` | gradient blow-up, no vacuum | — |
| 39 | 8.1 developments | `{|x|<1−t/2}`, `c=1`, from `(1,0.4)` | `x=1.4−s` meets `1−s/2` at `s=0.8`: inextendible on `(0.8,1]` misses `S` | not a development | — |
| 40 | 8.1 past-closed below | `(D,U)≤(D′,U′)`, curve of `U′` leaving `D` at `a` | `a=t₀` impossible (`D′∩Σ_{t₀}={t₀}×S⊆D`); `a>t₀` gives an inextendible curve in `D` missing `S` | holds | — |
| 41 | 8.2 counter-flow | `p=ρ²`, `ρ=1/2`, `v=±2` | `c²=2ρ=1`; `T_L={x<−1+t}` (`v−c=1`), `T_R={x>1−t}` (`v+c=−1`); overlap `t>1`; `D₁∩Σ₁={x<0}`, `D₂∩Σ₁={x>0}`; `W₁₂=D₁∩D₂∩{t<1}` | two incompatible developments | — |
| 42 | 8.2 `W₁₂=W₂₁` | `p∈W₁₂`, `U₂`-curve to `p` | `a′=inf{s: piece in J⁻_{D₁}(p)}`; `q=(a′,x(a′))∈W₁₂`; `J⁻_{D₁}(·)` upper semicontinuous (3.3.2) so `W₁₂` contains a neighbourhood of `q`, fields agree there, piece extends: `a′=t₀` | holds; route uses 3.3.2 | — |
| 43 | 8.2.3 uniqueness criterion | data on disconnected `S` | §6.2 with `O=H_{t₀}`: `U=U_*` on `D`; `D⊆D⁺_H(S)` by first exit; needs no connectedness (ERS Cor. 4.69 assumes it) | holds here | — |
| 44 | 8.4 (a) | `φ=t−T`; `{|x|<1−t/2}` | `1>0`; `1/2<1` | spacelike allowed; timelike excluded | — |
| 45 | 8.4 (a) route | `∂_tφ+v·∇φ<c|∇φ|` | `X=(−1,−v−λe)`, `|ξ−τv|=λ<c`, `dφ(X)=−(∂_tφ+v·∇φ+λ|∇φ|)>0` for `λ↑c` | past timelike exit vector exists | — |
| 46 | 8.4 (b) expanding flow | `t=1`, `x=2√2−2` | `∂_tφ=1−1/√2`, `v=√2−1`, sum `1/√2=c` | null | — |
| 47 | 8.4 (b) added lens | `ψ=ε−|x−x_q−(t−t_q)ṽ(q)|−M(t−t_q)`, `M>c̃+|ṽ−ṽ(q)|` | backward relative speed `≤c̃+|ṽ−ṽ(q)|<M`: curves stay in `{ψ>0}`; `dφ` future timelike: `φ` decreases along past causal curves | strictly larger development, contradiction | R04 for `Λ≠0` |

## Verified sound

- Principles: no route-specific shortcut; no re-planned roadmap (PDE on main is scalar
  elliptic/parabolic, confirmed at `TauCetiRoadmap/PDE/README.md` lines 117, 183, 1833; its
  §1.3 plans `W^{k,2} = H^{k,2}` from the order-one pinned lemma, while the general-`k` statement
  `MeasureTheory.Lp.memSobolev_natCast_iff_exists_wkp_value_eq` is at the Tau Ceti pin,
  `TauCeti/Analysis/Sobolev/BesselPotential/Basic.lean:133`, so citing Tau Ceti directly is
  right); no supplier roadmap, no gap; no algorithm; no process residue, no LaTeX delimiters,
  no backticked own names (resolve: none); baseline hashes in plan.json equal the lake-manifest
  pins.
- Gate output: `candidate: CompressibleEulerEquations is not in the merge order yet; checked as
  if placed after GlaubermanZStar …` / `depcheck: 242 roadmaps, 2362 edges, 0 problem(s)`. No
  UPWARD or CYCLE line. Every `*Needs:*` line and every plan.json prerequisite points to a pinned
  declaration or an earlier target (3.1 → 2.2.3, 6.1 → 2.1/3.1/5.2, 7.1 → 6.2.1, 8.4 → 3.2.2 all
  downward).
- Mathlib at the pin, opened: `Matrix.PosDef` (PosDef.lean:176), `Matrix.PosSemidef` (:62),
  `Matrix.IsHermitian` (Hermitian.lean:45), `QuadraticForm.equivalent_signType_weighted_sum_squared`
  (Real.lean:78), `LipschitzOnWith.ae_differentiableWithinAt_of_mem` (Rademacher.lean:362),
  `LipschitzOnWith.absolutelyContinuousOnInterval` (AbsolutelyContinuous.lean:310),
  `AbsolutelyContinuousOnInterval.integral_deriv_eq_sub` (AbsolutelyContinuousFun.lean:227),
  `BoundedContinuousFunction.arzela_ascoli` (ArzelaAscoli.lean:113), `zorn_le_nonempty₀`
  (Zorn.lean:126), `IsPicardLindelof` (PicardLindelof.lean:80),
  `IsPicardLindelof.exists_eq_forall_mem_Icc_hasDerivWithinAt` (ExistUnique.lean:57),
  `ODE_solution_unique_of_mem_Icc` (ExistUnique.lean:252), `TemperedDistribution.MemSobolev`
  (Sobolev.lean:153), `LocallyLipschitzOn` (EMetricSpace/Lipschitz.lean:72), `convolution`
  (Convolution.lean:401), `ContDiffBump` (BumpFunction/Basic.lean:70), `uniqueDiffOn_convex`
  (TangentCone/Real.lean:80), Plancherel (Fourier/LpSpace.lean). All 18 present with the stated
  hypotheses (Rademacher for finite-dimensional real spaces; the FTC scalar-valued, as the README
  says).
- Tau Ceti at the pin, opened: `TauCeti.Wkp` (Wkp/Basic.lean:145), `TauCeti.HasWeakFDerivOn`
  (WeakDeriv/Basic.lean:251), `memSobolev_natCast_iff_exists_wkp_value_eq` (BesselPotential/
  Basic.lean:133, `1 < p < ∞`), `MemSobolev.exists_zeroAtInftyContinuousMap_ae_eq`
  (Embedding.lean:81, `finrank < 2s`), `Wkp.toZeroAtInfty` (Embedding.lean:194),
  `Wkp.dense_contDiff_representatives` (SmoothDensity.lean:92, `p ≠ ∞`),
  `le_mul_exp_of_le_add_mul_integral` (ODE/Gronwall.lean:59, continuous `φ`, `K ≥ 0`),
  `exists_norm_le_hasWeakLineDerivOn_of_frequently_eLpNorm_inv_mul_sub_le`
  (DifferenceQuotient.lean:152). All 8 present as described.
- Sampled source locators, all resolving: ChristodoulouMiao2014 lines 481/488 (1.2)/(1.4), 529
  (1.10), 606 (1.24), 672–676 (1.39)–(1.40), 685 (`√−det g = η`), 818–822 (Galilean), 833–838
  (2.1)–(2.3), 864–880 (developments), 880–886 (generators on the boundary);
  AbbresciaSpeck2022 lines 79–83, 149–152, 158–164, 165–170, 172–179, 408–414; LuoYu2023a 84, 88
  (`γ ∈ (1,3)`, as the README notes), 95; LuoYu2023b 417–419, 910; Christodoulou2019 124–126,
  131–138; Minguzzi2019 1359 (Thm 2.12), 1364 (Rem 2.13), 1917 (§2.11), 3576 (Def 3.1), 3581
  (Rem 3.2); MinguzziCone2019 1737 (Def 2.17); Chrusciel2011 534, 1169, 1352, 1843;
  BarGinouxPfaffle2007 1006 (Def 1.3.5), 3664 (Thm 3.2.11); LukNotes 679, 724, 1158, 1210, 1239,
  1612, 1616, 1620; Nirenberg1959 318 (Theorem, p. 125); EperonReallSbierski2019 767, 1010,
  1129–1144, 1178, 1195–1210, 1232–1240, 1338, 1342, 1603; LukSpeck2018 1999–2008. The
  AbbresciaSpeck2022 exclusion of the Chaplygin gas (line 166) concerns their shock analysis,
  not well-posedness, so the README's Chaplygin Check does not conflict with the citation.
- Ownership: IncompressibleFlows at #237 plans `W^{k,p}(UnitAddTorus d)` and `H^s` with weight
  `(1 + 4π²|k|²)^{s/2}` (README lines 166–171), as Scope says; RelativisticQuantumFieldTheory at
  #1772 RQFT1 (line 130–135) is flat Klein–Gordon finite propagation on Minkowski space, neither
  consumed nor restated; LorentzianGeometry is a board target (`packages/LorentzianGeometry/
  target.md`, no design), whose scope leaves Lipschitz causal curves and domains of dependence
  to a Part II and names this roadmap as the owner of the acoustical theory; a `roadmaps grep`
  for symmetric hyperbolic, acoustical, domain of dependence, maximal development, Moser,
  Gagliardo–Nirenberg, Friedrichs mollifiers and compressible Euler over main and the 460 open
  pull requests returns only IncompressibleFlows (incompressible), PositiveMass (a tangential
  mollification step) and DGFloer (unrelated). This roadmap is the owner of §§2–3 and §§5–8.
  Ownership of Layer 4 objects against the Tau Ceti pin is R06.
- Shape: summary, scope, conventions, supplier contracts, how-to-read, eight layers each ending
  in Examples and Dependencies, downstream consumers, worked examples, references. Thirteen
  definitions each with an API list and 3–5 Checks (1.1: 5, 1.2: 3, 1.3: 3, 2.1: 4, 2.2: 4, 3.1: 3,
  3.2: 3, 3.3: 4, 4.1: 4, 4.4: 3, 5.1: 3, 6.1: 3, 8.1: 3); every theorem with hypotheses in the
  sentence and a locator (the §3.3 locator weakness is R07). Vocabulary standard throughout
  ("characteristic-monotone" and "lens function" are defined where they first appear).
- The non-uniqueness counterexample of §8.2 is correct (row 41) and the worked extension to full
  Cauchy data via §7.3 is sound (the towers are past-closed for their own fields; uniqueness on
  the slab identifies the solution with the constant states inside them).
- Declared gaps: none; nothing that should have been a gap is written as supplied.

## Not verifiable

- Majda1984 "Theorem 2.1", "§§2.1–2.3", Kato1975 "Theorem I", Dafermos2016 "Theorem 5.1.1":
  uncertified (paywalled), cited by locator; the author flagged them as unverified and so are
  they here. Each statement citing them also cites an open text (LukNotes, Nirenberg1959,
  EperonReallSbierski2019) or gives its route, which I checked instead.
- Friedrichs1954, HawkingEllis1973, ONeill1983, Christodoulou2007: waived; cited by locator only.
- Elaboration: not available in this lane; no `Suggested.lean` exists at the design stage.

## Source issues

- **Error** in ChristodoulouMiao2014 at §2.1.2, printed page 24–25 (lines 872–880): the source
  says any two developments of one data set agree on the intersection of their domains, so the
  union of all developments is the unique maximal development; it should be that they agree on
  the maximal common development only, and uniqueness needs a further hypothesis
  (EperonReallSbierski2019 Theorem 3.45, Corollary 4.68); affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c9e56ecb1a458b848ddd0d3c82c5334206dbde3a", "job": "REV-DESIGN-CompressibleEulerEquations", "model": "fable", "worker": "chris-x9"} -->
