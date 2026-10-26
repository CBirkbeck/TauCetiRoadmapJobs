# Human review response: RefinedTraceMethods

The review makes two numbered findings, recorded as H01 and H02. Line references are to `TauCetiRoadmap/RefinedTraceMethods/README.md` at the new head `080175a`.

## H01 (CBirkbeck) — applied

§8.6 used to call the Adams operations "functorial coherent E∞ cyclotomic Adams operations on THH(A;Z_p)", that is, endomorphisms for a fixed circle action. It now defines restriction `ρ_γ^*` along the automorphism `ρ_γ` of `T_p=K(Z_p,1)`, with `(ρ_γ^*X)^{tC_p}≃ρ_γ^*(X^{tC_p})`, and states the operations as natural E∞ cyclotomic maps `ψ_γ:THH(A;Z_p)→ρ_γ^*THH(A;Z_p)` with `ψ_1=id`, `ρ_γ^*(ψ_δ)∘ψ_γ≃ψ_{γδ}` and Frobenius compatibility (equivalently, an action of `T_p⋊Z_p^×`). It says explicitly that these are not endomorphisms in CycSp (§2.8) or `CycSp_T,p` (§3.1), and that `ψ_γ∘B=γ·(B∘ψ_γ)` (line 3792). Reindexing gives the ordinary actions on `THH_{hT}`, TC⁻, TP and TC, compatible with can, `φ^{hT}` and the TC fibre sequence (line 3792, API bullets at lines 3800–3802). On underlying filtered spectra the action is ordinary. The trivial action on `C_A` and the `γ^i` action on graded pieces are unchanged.

- **Norm.** Compatibility with the norm `ΣX_{hT}→X^{hT}` holds only when `ρ_γ` acts with degree γ on the adjoint sphere of T. A new Check computes this for X=Hℤ_p with trivial action (line 3814): reindexing gives `γ^k` on `π_{2k}X^{tT}` but `γ^{k−1}` on `π_{2k−2}X_{hT}`, which the norm sequence identifies with it for k≥1. So stating the norm compatibility without the twist, as in the suggested fix, would be false.
- **Frobenius compatibility.** The proof route now derives it (line 3796). Both composites into `ρ_γ^*(THH^{tC_p})` are circle-equivariant E∞ maps out of `A⊗T_p`, so each is determined by its restriction to A. Those restrictions agree because the Tate diagonal, reindexed along γ∈Aut(C_p), is again a lax symmetric monoidal transformation, and such a transformation is determined by its value on the sphere (AInfCohomology §AI.7.2, Spectral Tate diagonal; added to *Needs*).
- **Negative-control Check.** The reviewer's example is now a Check (line 3813). For p=3, A=𝔽₃[x], γ=2: `ψ₂(Bx)=2dx=−dx` but `B(ψ₂x)=dx`.

Sources: bms line 3659–3664 (Construction 9.13), line 3668–3671 (Proposition 9.14) and line 3682–3684 (inverse action on `H²(T,Z_p)`). These agree with the γ^i weights and with the existing `gr^(−1)TP` Check. `Suggested.lean` declares nothing for §8.6, because its docstring lists the THH/TC carriers as absent at the pins (lines 13, 20 and 22). So the Lean interface needs no change, and the repair is in the README API list. A sweep for the same pattern turned up only one other circle-and-`Z_p^×` statement: Devalapurkar's comparison in §6.8. There `Z_p^×` acts through Adams operations on ku, not through the circle, and the source states an `S¹ × Z_p^×`-equivariant equivalence (w line 110–111). It is unchanged.

## H02 (CBirkbeck) — applied

At line 2565 the Check "`Null_R ≃ ∏_ℕ R` for nonzero discrete R" becomes the case R=𝕊. There `Null_𝕊=N^■≃∏_ℕ𝕊` has dual `⊕_ℕ𝕊` (w line 472–475, w line 482). On π₀ at the point, the classifier comparison `⊕_n∏_m𝕊→∏_m⊕_n𝕊` misses the identity matrix, so `Null_𝕊` is not dualizable. A new Check at line 2566 states `Null_R=R⊗^■N^■` and computes `π₀Null_{Hℚ}(*)=(∏_ℕℤ)⊗ℚ`, which misses `(1/(n+1)!)_n`. This uses `Hℤ⊗^■N^■≃∏_ℕHℤ` (SolidAnalyticRings §2.4, head 5d395ae). The cross-reference at line 2568 now names `Null_𝕊`.

Wagner defines `Null_R` as `R⊗^■Null^■` and states the product form and the dual only for R=𝕊 (w line 472–482, w line 732). The dual `Hom_R(Null_R,R)≃⊕_ℕR` for discrete R (w line 744) is a different claim, and it holds. So the `H(M₂(ℤ))` Check at line 2690 and the definition at line 2724 stay. No other line of the README identifies `Null_R` with a product.

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `ψ_γ∘B=γ·(B∘ψ_γ)` | p=3, A=𝔽₃[x], γ=2; γ=1 | γ=2: `ψ₂(Bx)=2dx`, `2·B(ψ₂x)=2dx`, untwisted `B(ψ₂x)=dx≠2dx`; γ=1: both sides dx | Twisted law holds; untwisted fails | Stated, with Check |
| Same law at p=2 | A=𝔽₂[x]; A=ℤ₂[x], γ=3 | Over 𝔽₂ every γ is odd, so `γdx=dx`: the defect is invisible. Over ℤ₂[x], `ψ₃(dx)=3dx≠dx` | The odd-p example is needed for an 𝔽_p-algebra; the twist is real at p=2 | None; p=3 kept in the Check |
| `ρ_γ^*(ψ_δ)∘ψ_γ≃ψ_{γδ}` | π₁THH(𝔽₃[x]), γ=δ=2 | `ψ₂ψ₂(dx)=4dx=dx=ψ₄(dx)`; `Z_p^×` is abelian, so both orders give `ρ_{γδ}^*` | Consistent | Stated |
| Frobenius compatibility | A=𝕊; weight i | A=𝕊: THH=𝕊, `ψ_γ=id`, both composites are the canonical `𝕊→𝕊^{tC_p}`; weight i: φ maps `gr^i` to `gr^i`, both sides scaled by `γ^i` | Consistent | Proof route made explicit |
| Ordinary actions on TC⁻, TP | X=Hℤ_p, trivial action | `t^j∈π_{−2j}X^{hT}` scaled by `γ^{−j}`; `t^{−k}∈π_{2k}X^{tT}` scaled by `γ^k`; agrees with the `gr^(−1)TP: γ^(−1)` and `gr¹TP: γ` Checks | Consistent | Stated |
| Norm compatibility | Same X; k=1, 2; γ=2, p=3 | k=1: `π₂X^{tT}` has `γ`, `π₀X_{hT}` has `γ⁰`, and the twist supplies γ; k=2: `γ²` against `γ·γ`; untwisted: 2≢1 mod 3 | Untwisted claim false; twisted claim holds | Adjoint twist stated, with Check |
| Degenerate cases | γ=1; A=0 | `ρ_1=id`, `ψ_1=id`; THH(0)=0, all maps zero | Consistent | None |
| `Null_𝕊` not dualizable | ℕ-indexed; finite index N | Identity `δ_{mn}` is row-finite (in `∏_m⊕_nℤ`) with infinitely many nonzero columns (not in `⊕_n∏_mℤ`); for finite N the two sides coincide | Non-dualizability comes from the infinite index | Check restated over 𝕊 |
| `Null_R` against `∏_ℕR` | R=Hℚ, Hℤ, 0 | Hℚ: `(∏ℤ)⊗ℚ`, missing `(1/(n+1)!)_n`; Hℤ: `∏_ℕℤ`; R=0: both 0 | Product form fails for Hℚ | Negative-control Check added |
| Dual over discrete R | R=H(M₂(ℤ)) (line 2690) | `Hom(N^■,R)≃⊕_ℕR` (w line 744), independent of `Null_R≃∏R` | Holds | None |

`Suggested.lean` declares nothing inside its namespace, so there is no `#check` comparison to make, and the file is unchanged. Ownership: by object, the search covered main, the board packages, the open-roadmap index and the sibling folders given. Neither repair introduces a construction owned elsewhere. No roadmap other than this one states the trace Adams operations, and the reindexing uses this roadmap's §2.1 restriction functor. No new source is cited.

## Build, gate and dependency outcome

Committed as `080175a`: `RefinedTraceMethods: review repairs (Adams operations as semilinear circle maps; solid generator Check over the sphere)`. Only `TauCetiRoadmap/RefinedTraceMethods/README.md` changed, and nothing was pushed.

The movable dependency check returned exit 0, with no UPWARD, CYCLE or moved line:

```text
depcheck: 55 roadmaps, 638 edges, 0 problem(s)
```

`lake build TauCetiRoadmap.RefinedTraceMethods.Suggested` returned exit 0 with 0 warnings:

```text
✔ [8976/8976] Built TauCetiRoadmap.RefinedTraceMethods.Suggested
Build completed successfully (8976 jobs).
```

The gate against origin/main returned exit 0:

```text
gate RefinedTraceMethods: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
