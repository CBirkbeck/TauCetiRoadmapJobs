# GATE-DGFloer~1: answers to the review of fbfbe3e

The review examined head fbfbe3e. Head d08d6f7 already carried the repairs of all eight points;
this round verified each of them against the sources and the roadmap's own conventions, ran the
adversarial pass on every Check that d08d6f7 added, and repaired three computed values in those
Checks together with two older occurrences of the same slip (head 1d67227d). Line numbers below
are those of `TauCetiRoadmap/DGFloer/README.md` at 1d67227d.

## H01 (CBirkbeck) — applied

10.2's third Check (`:2950–2955`) now states that the degree-`0` class of Proposition 5.11 fails Proposition 6.7's hypothesis, because `j_!` has degree `−n = −2` (bdho-cotangent lines 4429–4445: `H_*(Q; i^*𝓕) ≅ H_{*+n}(D*Q, S*Q; …)` composed with `j_!` into `H_{*−n}(𝓕 ⊗ |Q|)`), so `j_!(α) ∈ H_{−2} = 0`; a class of positive degree comes from the fibered 2-sphere families of the source's Example 6.16 (bdho-cotangent line 434), which are DGFloerPartII's, and this roadmap's `S²` statement is Theorem A through Propositions 5.9, 5.11 and 5.13. Worked example 5's second bullet is unchanged: it feeds 10.3 and worked example 8, both of which run through Proposition 5.11, not 6.7.

## H02 (CBirkbeck) — applied

6.1's sign Check (`:1621–1625`) reads: with `ω_can = dq ∧ dp` and `H = p²/2` the field in the `ι_X ω = dH` convention is `p ∂_q`, since `ι_{p ∂_q}(dq ∧ dp) = p dp = dH`; the source's `ω(X, ·) = −dH` at the same form gives `−p ∂_q`, which is also the `ν`-transport of the source's field `p ∂_q` for `(ω_src, p²/2)` of worked example 9 (`:3164–3166`, unchanged: it computes the field of `−p²/2` at `ω_can`). Old: "`−p ∂_q` … the source's convention gives `p ∂_q`".

## H03 (CBirkbeck) — applied

2.1's Check (`:1019–1020`): `((γ · δ) · ε)(1/2) = (γ · δ)(1) = δ(1)` and `(γ · (δ · ε))(1/2) = γ(1) = δ(0)`, the two values swapped relative to fbfbe3e; the conclusion (non-associativity when `δ(0) ≠ δ(1)`) is unchanged.

## H04 (CBirkbeck) — applied

4.2's Check (`:1311–1315`) now carries the computation: `D(α ⊗ x) = ∂α ⊗ x + (−1)^{|α|} α r ⊗ y` and `D²(α ⊗ x) = ((−1)^{|α|+1} ∂α·r + (−1)^{|α|} ∂α·r + α·∂r) ⊗ y = α·∂r ⊗ y`, which is `∂r ⊗ y` for `α = 1` (old: `(−1)^{|α|+1} α·∂r ⊗ y`). Recomputed this round from the Lean body of `twistedDifferential` (`Suggested.lean:131–135`: `D f y = dM (f y) + Σ_x op(m x y) • ε(f x)`) with the right-module Leibniz rule `∂(αr) = ∂α·r + (−1)^{|α|} α·∂r`: the two `∂α·r` terms cancel and `∂r` enters with `+`.

## H05 (CBirkbeck) — applied

The scope-table row (`:101`) reads "R1a.0–R1a.1 and R1a.3–R1a.4 are not consumed; R1a.2's identity component `Symp₀(M, ω)` with its `C^∞` topology is consumed by Layer 7.T item 9", and "From other roadmaps" has a HamiltonianReduction R1a.2 entry (`:412–416`). Checked on main this round: `TauCetiRoadmap/SymplecticGeometry/HamiltonianReduction/README.md:97–101` defines `Symp₀(M, ω)` as the identity path component in the compact-open `C^∞` topology and proves it is the set of endpoints of smooth symplectic paths from the identity, which is what the entry assumes. HamiltonianReduction precedes DGFloer in the merge order (dependency check below).

## H06 (CBirkbeck) — applied

2.2 (`:1037–1040`) cites BDHO §7.1 with the replacement attributed to the literature as cited there and the construction to Whitehead Chapter I; Proposition 7.1.1 moved to 3.2 (`:1176–1178`), where bdho-morse-dg lines 3086–3090 state exactly its content (canonical up to homotopy, module structure from a chosen lifting function; the replacement is cited to Dyer–Kahn at line 3053). 3.3 (`:1201–1202`) cites BDHO §5.1 "Local coefficients as DG local coefficients", §5.1.2: bdho-morse-dg lines 1298 and 1352 (the Morse DG paper, which the References define as "BDHO"; the cotangent paper has no such section, its classical-coefficient material being §2.2). 6.2 (`:1637–1640`) cites Seidel §2(a), equations (2.2)–(2.3): seidel-biased lines 89–97, with the collar coordinate `r = log ρ` for the radial coordinate `ρ ∈ [1, ∞)` used here. 6.4 (`:1676–1677`) cites Hofer–Zehnder Chapter 4 at the claim (uncertified, by locator).

## H07 (CBirkbeck) — applied

d08d6f7 added 24 `**Checks.**` blocks (57 → 81 in the README) to every 7.C and 7.T subsection that defines an object, with the instances the review named: `Γ` on `ℂPⁿ`, `T²ⁿ` and `S² × S²` with areas `(1, 2)` (7.C.1, `:1896–1908`); the torsor datum, the cap lines with `μ = −n` giving `+1`, the nodal correspondence reading `(−1)^n Id` before the family factor (7.C.1(i), 7.C.2a, 7.C.3b); the Laurent and completed models (7.C.6a, 7.C.6d, 7.C.6e, 7.C.6f); the degenerate statement (7.C.6h); `P_X`, `N_X`, `ψ = 2ψ_c`, `H`, `K` (7.T.1, 7.T.2); `τ_F`, `ζ_F`, `I_F` beside their definitions (7.T.4, 7.T.5, 7.T.8), with 7.T.9's Checks reduced to the monotone comparison. The twenty 7.C/7.T subsections still without a block (7.C.2b and its (0)–(vii), 7.C.3, 7.C.3c, 7.C.4, 7.C.5, 7.C.6, 7.C.6b, 7.C.6c, 7.C.7, 7.T, 7.T.0, 7.T.3) are construction and proof steps that define no object. This round's adversarial pass over the 24 blocks (table below) found three wrong values, repaired at 1d67227d: 7.C.5b's second Check called `S²` a `Γ = 0` target (`S_sph = H₂(S²) = ℤ`, so `Γ = ℤ`, `d_C = 4`; now the `ℤ/4`-graded cyclic formula for `S²` and the integer formula on `T²`, `:2256–2260`); 7.C.6d's first Check said `1 − t` is not a unit of `Λ_R` (it is, `1 − t = −t(1 − t⁻¹)` with inverse `−Σ_{k≥1} t^{−k}`; now the convergent expansion pins the direction, `:2309–2313`); 7.T.7's third Check expanded `(1 + b)^{+1}` with a `β²e^{2A}` term (`1 + b` is exact; now the first-order truncations multiply to `1 − β²e^{2A}`, `:2607–2611`). The same `S²`-as-aspherical slip was repaired in 7.4's first Check (`:1812–1815`, now `T²` with ranks `1, 2, 1`) and in the Layer 7 Examples (`:2664–2668`); 7.C.5b's third Check now says the tensor description holds over `ℤ` (`Λ_ℤ` torsion-free, hence flat) and that a general `R` needs the base-change hypothesis (`:2261–2264`).

## H08 (CBirkbeck) — applied

7.C.6h (`:2374`) states the degenerate critical-number comparison statement in prose, with no backticked name; the scope-table row is deleted and the out-of-scope bullet (`:123–125`) carries the virtual-comparison exclusion without merge-order wording. `Suggested.lean` is unchanged since fbfbe3e; the README names no undeclared identifier (gate `readme-ids-missing=0`).

## Build, signatures, gate and dependency check

Build at 1d67227d (the Lean file is identical to fbfbe3e), from the pull-request worktree:

```text
warning: TauCetiRoadmap/DGFloer/Suggested.lean:69:8: declaration uses `sorry`
warning: TauCetiRoadmap/DGFloer/Suggested.lean:145:8: declaration uses `sorry`
warning: TauCetiRoadmap/DGFloer/Suggested.lean:153:8: declaration uses `sorry`
warning: TauCetiRoadmap/DGFloer/Suggested.lean:167:8: declaration uses `sorry`
Build completed successfully (8970 jobs).
```

Signature check: a scratch file importing the module with `#check @name` for all eight declarations elaborated once with no error; the eight printed types equal the worker's `signatures.md` and the README statements (the torus criterion keeps `I₀`, `ChartedSpace`, `LieGroup`, `CompactSpace`, `ConnectedSpace`; the Layer 4 theorems keep `IsScalarTower`, `SMulCommClass`, `GradedSMul`, `Decomposition` and the `IsDGRightModule` hypothesis; `twistedDifferential` keeps `SMulCommClass`). Nothing changed in the Lean file.

```text
gate DGFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 223 roadmaps, 2099 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Ownership against open pull requests: the eight declarations are unchanged and were checked at the previous rounds; no new object is declared this round. The `S²` finiteness of `c°_HZ` is DGFloerPartII's (its head at rev/1799 owns the source's §6.3), as H01 records.

## Adversarial pass over the Checks added at d08d6f7 and changed at 1d67227d

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 7.C.0 reflected index `μ_{H∨} = −μ_H` | `S²` height, minimum | `μ_H = 0 − 1 = −1`; `ind_{−H} = 2`, `μ_{H∨} = 2 − 1 = 1` | holds | none |
| 7.C.0 `𝒜_H = −A_C` on the zero cap | constant orbit at `x` | `𝒜_H = 0 − H(x)`, `A_C = H(x) + 0` | holds, matches the convention paragraph (`:1858`) | none |
| 7.C.0 scalar model `∂_s + tanh s` | kernel, adjoint kernel | `sech s` (`L²`), `cosh s` (not); index `1`; `SF(tanh)` from `−1` to `1` is `+1` | holds | none |
| 7.C.1 `Γ` | `ℂPⁿ`; `T²ⁿ`; `S² × S²` areas `(1, 2)` | `ker ω ∩ ker c₁ = 0`, `Γ = ℤ`, `N_C = n+1`; `π₂ = 0`, `Γ = 0`; `ω(a,b) = a+2b`, `c₁ = 2a+2b`, joint kernel `0`, `(1,0): κ = 1/2`, `(0,1): κ = 1` | holds | none |
| 7.C.1 `π₁(𝓛₀T²ⁿ)` | split sequence `π₂ ⋊ π₁` | `0 ⋊ ℤ²ⁿ = ℤ²ⁿ` | holds | none |
| 7.C.1(i) `ν(t) = −κN_C` | `ℂPⁿ`, `ω(L) = 1` | `κ = 1/(n+1)`, `−κN_C = −1 = −ω(L)` | holds | none |
| 7.C.1(i) variational equation | `ℝ²`, `H = (q²+p²)/2` | `X_H = p∂_q − q∂_p`, flow `R_{−t}`, `d/dt(R_{−t}v) = −JR_{−t}v = DX_H(R_{−t}v)` | holds | none |
| 7.C.1a degrees `j − n + 2c₁` | `S²`; `ℂPⁿ` | `0−1, 2−1 = −1, 1`; residues `i+n ∈ {0,…,2n}` mod `2(n+1)` | holds | none |
| 7.C.2 seam transport | `w = φ^t_H ∘ v`, `H = 0` | `w_t − X_H = dφ^t v_t`, `J' = J` | holds | none |
| 7.C.2 `LJz = 2bz − 2aJz` | `S = diag(1,−1)`, `J∂_q = ∂_p` | `C_J = [[0,−2],[−2,0]]`, `z = (1,−1)`, `Jz = (1,1)`, `LJz = (−4,−4) = −2·2·Jz` | holds | none |
| 7.C.2a signs | `μ = −n, n, 1`; `(i,j) = (0,1)` | `(−1)^{μ+n} = 1, 1, (−1)^{n+1}`; `(−1)^{0+1+0} = −1` | holds | none |
| 7.C.2c tame non-compatible `J_ε` | `ℝ⁴`, `B = diag(1,−1)` | `C = BJ₀ − J₀B = [[0,−2],[−2,0]]`, `ω(v,J_εv) ≥ (1−\|ε\|)\|v\|²`, `ω(J_εe₃,J_εe₄) = 1 − 4ε²` | holds | none |
| 7.C.2c energy direction | `u_t − X_H = Ju_s` | `d/ds A_H = ∫ω(u_s, Ju_s) ≥ 0`, so `A_H(x̃₊) ≥ A_H(x̃₋)` | holds, agrees with "upward for `A_H`" | none |
| 7.C.3a dimensions | `ℂP¹`, `r = 1`, `c₁(B₁) = c₁(A_end) = 2` | `2(2−2) − 2 = −2`; `2c₁ = 4 > 2` | holds | none |
| 7.C.3b smoothing | `z₊z₋ = τ` | `s₊ − s₋ = (log τ)/2π → −∞` | holds | none |
| 7.C.5a gradient direction | `g_J(JX_H, w) = ω(JX_H, Jw) = ω(X_H, w) = dH(w)` | upward | holds | none |
| 7.C.5b cyclic formula | `ℂPⁿ`; `S²`; `T²` | residues even: `R`; **`S²` has `Γ = ℤ`, `d_C = 4`**, residues `±1`; `T²`: `R, R², R` in `−1, 0, 1` | **`S²` was called `Γ = 0`** | rewritten (`:2256–2260`), with 7.4 Check and Layer 7 Examples |
| 7.C.5b base change | `𝕜`; `ℤ` | `Λ_𝕜` a vector space; `Λ_ℤ` torsion-free hence flat, UCT applies | the old text implied an unmet hypothesis over `ℤ` | sharpened (`:2261–2264`) |
| 7.C.6a degree equation | `ℂPⁿ`; `S² × S²` areas `(1,1)` | `μ(y) + 2(n+1)k = μ(x) − 1`; `ker c₁ = ker ω = ℤ(1,−1)`, `Γ ≅ ℤ`, `deg t = 4` | holds | none |
| 7.C.6d units of `Λ_R` | `ℂPⁿ`, `ν(t) = −1` | `(1 − t⁻¹)⁻¹ = Σ t^{−k}`; **`1 − t = −t(1 − t⁻¹)` is a unit**, inverse `−Σ_{k≥1} t^{−k}` | **old text: `1 − t` not a unit** | rewritten (`:2309–2313`) |
| 7.C.6d filtration | `Γ = 0` | `F^a = M` for `a ≤ 0`, `0` for `a > 0` | holds | none |
| 7.C.6e period image | K3 with a Kähler form; `T²ⁿ` | `Γ = S_sph/ker ω ↪ ℝ`, rank up to 22; `Γ = 0` | holds | none |
| 7.C.6f `t ↦ 1` | `R[t,t⁻¹]`; completion | `1 − t ↦ 0`, not a unit there; `1 − t⁻¹` a unit of the completion | holds | none |
| 7.C.6g Arnold bound | `ℂPⁿ`; `T²`; `S² × S²` `(1,2)` | `n+1 = n+1`; `4 = 4`; `(2,−1)`: `ω = 0`, `c₁ = 2`, `ν = 0` | holds | none |
| 7.C.6h `c(M)` | `S²`; `T²`; full rotation of `S²` | `2`; `3 < 4`; `Fix = S²`, two equilibria | holds | none |
| 7.T.1 `I_ω` | `γ_s(t) = (t,s)` on `T²`; constant sections | sweep degree `1`, `I_ω = ∫ω`; circle, `0` | holds | none |
| 7.T.2 `P_X = −⟨[ω^f],A⟩ + ⟨[θ_X],∂_fA⟩` | `f = id`, `X = 0`, `T²`; `S²`; Enriques | `P_0 = −1`, `N_0 = 1`; `ψ = 2·2 = 4`; `H₁ ⊗ H₁(S¹) = ℤ/2` | holds | none |
| 7.T.2 metrics and reflection | `J_L = ∓J₀` | `ω(J₀v,v) = −\|v\|²`; `u_s − J₀u_t = 0` antiholomorphic, `v(−s,t)` holomorphic; Jacobians `+1`, `−1` | holds | none |
| 7.T.4 `τ_F` | point; `0 → F → F → 0` with map `a`; `K = ℤ ⊕ ℤ/2` | `0`; `a⁻¹` (as 7.T.7 `:2589`); `ℚ[ℤ/2] ≅ ℚ × ℚ`, `(a⁻¹, 0)` | holds | none |
| 7.T.5 `ζ_F` | signs `+1`; `(−1)^{m+1}`; weight `1` | `(1 − e^A)⁻¹`; `1 + e^A`; `exp(e^A/(1−e^A))` | holds | none |
| 7.T.5 reduced dimension `ψ(A) + p` | `[S²]` on `S² × S¹` | `4 + p > 0` | holds | none |
| 7.T.6 scalar crossing | `ν_L = c_ref − CZ_HF` | `ind₊ − ind₋ = −(−1) = +1` | holds | none |
| 7.T.6 fold model | `β = 1/(κs + c)` | `β^{(k)} ≍ (1+s)^{−k−1}`, `σ_u ≍ (1+s)²`, `σ_u^{1/2}u_s ≍ (1+s)⁻¹` | holds | none |
| 7.T.6 NEP covers | `div = 2`, `m = 3`; `m = 2`; `ν(A) = 4`, `m = 2` | `2 ≢ 0 (3)`; `2 ≡ 0 (2)`; image `0`, disconnected | holds | none |
| 7.T.7 death factors | odd `i`, `b = 0`; `b = βe^A` | `τ_− = τ_+`; `(1+b)^{(−1)^{i+1}}·(1+b)^{(−1)^i} = 1`; **`(1+b)^{+1}` has no `β²` term**, truncations multiply to `1 − β²e^{2A}` | **old expansion wrong for the `+1` power** | rewritten (`:2607–2611`) |
| 7.T.8 Hamiltonian-connected characters | `X = c∂_x` on `T²` | `θ_X = c dy`, `P_X = c` on the `y`-circle sweep, `P_0 = 0` | holds | none |
| 7.T.9 group-ring value | point; translation by `(c,0)` | `ℚ(ℤ[0]) = ℚ`, value `0`; non-Hamiltonian, `C` transported | holds | none |
| 2.1, 4.2, 6.1, 10.2 (H01–H04) | as in the sections above | recomputed | hold | none beyond d08d6f7 |
