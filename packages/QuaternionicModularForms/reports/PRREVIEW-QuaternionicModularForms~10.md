# Review of QuaternionicModularForms (pull request #934 at e40ec42)

**Verdict:** accepted

This is an incremental re-review of the 41 lines changed since b22ec37. All 41 are in `TauCetiRoadmap/QuaternionicModularForms/README.md` (§2.2's independence paragraph, one new §2.2 Check, the §3.1 commutation sentence and the §3.2 independence bullet); `Suggested.lean` and `metadata.toml` are unchanged, and nothing outside the folder changed. The one finding of the review at b22ec37 is repaired, and the repair introduced no new problem. No finding remains.

## Previous findings

- R01 — repaired: §3.1 now reads "the map of §2.2 for every change of the coefficient splittings when `Δ=D_fˣ`, and in the `Σ₀(t)` variant for a change by `h_v∈F_vˣ·U₀(π_v^t)` at the levels `U₀(π_v^t)` and `U₁(π_v^t)` of §0.4" (`README.md:1071`–`1074`); §3.2 carries the same scope (`README.md:1111`–`1114`); §2.2 proves the monoids coincide and the double cosets agree (`README.md:690`–`698`); the `W_t` negative control is at `README.md:740`–`752`.

## Verified sound

**Gate, elaboration, dependency check.**

- I ran the push gate on this head (`--base origin/main`). Every check passes except `dropped=2`, which flags `Suggested.lean:46` `namespace TauCetiRoadmap.QuaternionicModularForms` and `:48` `end TauCetiRoadmap.QuaternionicModularForms`. As at b22ec37, this is the gate configuration's dropped-name list matching the roadmap's own namespace, which the Lean form rules require; it is not something the author can repair, and the worker's gate on this head records `dropped=0`, `build=0` and every check passing. I raise no finding for it.
- `lake env lean TauCetiRoadmap/QuaternionicModularForms/Suggested.lean`: exit 0, no output.
- `git diff --stat origin/main...HEAD` outside the folder: empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- The dependency check with `--movable` against the merge order and main:

```text
depcheck: 244 roadmaps, 2465 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The new `*Needs:*` entry (§0.4, for §2.2) points inside the roadmap and earlier in the build.

**Suggested.lean** is unchanged since f7ed2fe: one module docstring, one `import Mathlib`, an empty namespace, no declaration. Its headline list and the missing carrier for each were verified in the review at f7ed2fe; there is nothing to probe for padding and no signature to `#check`.

**Library declarations opened at the pin.**

- `TauCeti.skolemNoether` (`TauCeti/Algebra/CentralSimple/SkolemNoether.lean:107`): `[IsSimpleRing A] [FiniteDimensional K A] [Algebra.IsCentral K B] [IsSimpleRing B] (f g : B →ₐ[K] A)`, concluding `∃ u : Aˣ, ∀ x, g x = u * f x * u⁻¹`. §2.2's two applications (over `K` and over `F_v`) are unchanged and match.
- Tau Ceti `TauCeti/NumberTheory/HeckeRing/` exists at the pin as a directory (`Basic`, `Multiplication`, `Associativity`, `Commutativity`, `Degree`, …), as §3.1's `*Needs:*` line cites it.

**Cross-roadmap citations resolved.**

- AutomorphicFormsOnReductiveGroups §7.4 at its open head (`roadmaps show --pr 1037`, line 1226): the slash `(f|δ)(g)=f(gδ⁻¹)|δ`, `T_η f=Σ_t f|x_t` for `JηJ=⊔_t Jx_t`, preservation of level forms, representative independence and the opposite-ring composition law, with `inverseActionHeckeEquiv`. §3.1 cites exactly this, and the `W_t` computation below uses this form of the operator.
- AutomorphicGaloisRepresentations at its open head (line 327) consumes "change of splitting with or without nebentypus" and the §3.1 operators with their relations; §2.2 supplies the change of splitting under its stated hypotheses, and no consumer cites the §3.1 sentence replaced by this head. The overlaps report lists no dropped id, no conflicting head and no shared folder. Ownership is unchanged by the diff (the last full review's audit at f7ed2fe stands). Ownership against open pull requests whose files the brief does not give was not checked.

**Seeded sample in the changed passages.** Of this round's fifteen sampled targets, 3.1 and 3.2 fall in the diff; the other thirteen are unchanged since b22ec37 and were verified in the full reviews this report's predecessors carry.

| Target | Source, locator, cache lines | Verified |
| --- | --- | --- |
| 3.1 (operators, composition law) | AutomorphicFormsOnReductiveGroups §7.4 at its head, line 1226; Tau Ceti `HeckeRing/` at the pin | yes: slash, coset sum, opposite ring as cited |
| 3.1 (commutation with the change of splittings) | §2.2 of this README, lines 690–698, and the Check at 740–752; own computations below | yes |
| 3.2 (certificate formula) | `jacobs` lines 768–812 (Definition 1.32, p. 20: `(ϕ|u)(g)=ϕ(gu⁻¹)‖u`, `[UvU]ϕ=Σ_tϕ|v_t`) and 813–835 (p. 21: the matrix of `U_p` by evaluation at class representatives) | yes: the README's `(T_ηφ)(cᵢ)=∑_tφ(c_{σ(i,t)})|(u(i,t)x_t)` is Jacobs's construction over `ℚ`, generalised as stated |
| 3.2 (independence bullet) | §2.2 of this README | yes: scoped as §2.2 proves it |

**Computed adversarial pass.** The first block covers the statements the diff adds or changes. The second carries the review at b22ec37's rows for statements the diff leaves untouched, with the values computed there and at f7ed2fe.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §2.2: `h_vΣ₀(t)h_v⁻¹=Σ₀(t)` for `h_v∈U₀(π_v^t)` | `γ∈Σ₀(t)`, `t≥1` | modulo `π^t` the matrices `h`, `h⁻¹`, `γ` are upper triangular, so `c(hγh⁻¹)≡0` and `d(hγh⁻¹)≡d_h d_γ d_h⁻¹=d_γ`, a unit; entries integral, `det` preserved and nonzero; `h⁻¹∈U₀(π^t)` gives the reverse inclusion | Pass |
| §2.2: the two monoids `Δ` coincide | `x∈D_fˣ` | `ι′(x_v)∈Σ₀(t)` iff `ι(x_v)∈h⁻¹Σ₀(t)h=Σ₀(t)` | Pass |
| §2.2: `ι′_v(U_v)=ι_v(U_v)` at levels `U₀`, `U₁` | `h∈U₀(π^t)` | `U₀=Σ₀(t)∩GL₂(𝒪)` is normalised; `γ↦d mod π^t` is a homomorphism on `U₀` (lower-right entry multiplicative on upper triangular matrices mod `π^t`) with kernel `U₁`, so `U₁` is normal in `U₀` | Pass |
| §2.2: `U₀(π^t)=U₁(π^t)·diag(1,𝒪ˣ)` | `γ∈U₀`, `δ=d_γ` | `γ·diag(1,δ⁻¹)=((a,bδ⁻¹),(c,1))∈U₁`, so `γ=(γ·diag(1,δ⁻¹))·diag(1,δ)` | Pass |
| §2.2: `U_v` has the same double coset for `ι` and `ι′` | level `U₁`, `h=u₁·diag(1,δ)` | `diag(1,δ)·diag(π,1)=diag(π,δ)=diag(π,1)·diag(1,δ)`; `h⁻¹diag(π,1)h=(diag(1,δ⁻¹)u₁⁻¹diag(1,δ))·diag(π,1)·(diag(1,δ⁻¹)u₁diag(1,δ))∈U₁diag(π,1)U₁`; at level `U₀` directly `h^{±1}∈U₀` | Pass |
| §2.2: diamond double cosets agree | `diag(1,d)`, `d∈𝒪ˣ` | `diag(1,δ)` commutes with `diag(1,d)`; same factorisation through `U₁` | Pass |
| §2.2 Check: `W_t` conjugation formula | `W_t=((0,1),(π^t,0))`, `γ=((a,b),(c,d))` | `det W_t=−π^t`, `W_t⁻¹=((0,π^{−t}),(1,0))`, `W_tW_t⁻¹=I`; `W_tγ=((c,d),(π^ta,π^tb))`; `W_tγW_t⁻¹=((d,π^{−t}c),(π^tb,a))` | Pass |
| §2.2 Check: `W_t` normalises `U₀(π^t)`, `W_t²` central | `c∈π^t`, `a` unit | new `b=π^{−t}c∈𝒪`, new `c=π^tb∈π^t`, new `d=a` unit; `W_t²=((π^t,0),(0,π^t))` | Pass |
| §2.2 Check: `W_t·diag(π,1)·W_t⁻¹=diag(1,π)∉Σ₀(t)`, disjoint double cosets | `a=π`, `d=1` | formula gives `((1,0),(0,π))`; `d=π∉𝒪ˣ`; `U₀diag(π,1)U₀⊂Σ₀(t)` (monoid) while `diag(1,π)∉Σ₀(t)` | Pass |
| §2.2 Check: the `ι′`-`U_v` is `[Uη′U]` with `ι(η′)=diag(1,π)` | `ι′(η′)=diag(π,1)` | `ι(η′)=W_t⁻¹diag(π,1)W_t=π^{−t}W_tdiag(π,1)π^tW_t⁻¹=diag(1,π)` | Pass |
| §2.2 Check: right translation by `w_t` conjugates `U_v` to the `ι′`-`U_v` | `(T_ηφ)(g)=Σ_tφ(gx_t⁻¹)|ι(x_t)`, `x′_t=w_t⁻¹x_tw_t` | `(Rφ)(gu)=φ(gw_t·w_t⁻¹uw_t)=(Rφ)(g)|ι(w_t⁻¹uw_t)`, `ι(w_t⁻¹uw_t)=W_t⁻¹ι(u)W_t=W_tι(u)W_t⁻¹=ι′(u)`; `Uη′U=w_t⁻¹Uη_vUw_t=⊔U x′_t`; `ι′(x′_t)=ι(x_t)`; `x′_t⁻¹w_t=w_t⁻¹x_t⁻¹w_t²=w_tx_t⁻¹`; so `(T′(Rφ))(g)=Σφ(gw_tx_t⁻¹)|ι(x_t)=(R(T_ηφ))(g)` | Pass |
| §2.2 Check: `W_t∉F_vˣ·U₀(π^t)` | `λu₀` | `det u₀=ad−bc` unit with `bc∈π`, so `a(u₀)` unit; `a(λu₀)=λa(u₀)≠0`; `a(W_t)=0` | Pass |
| §3.1 sentence, `Δ=D_fˣ` | `ι′_{v,σ}=hιh⁻¹`, `h∈GL₂(K)`, levels and double cosets through Convention 1's `ι_v` | double cosets unchanged; `φ(gx_t⁻¹)|ι(x_t)|h⁻¹=φ(gx_t⁻¹)|h⁻¹|ι′(x_t)`, so `Φ` intertwines every `[UηU]`, including `S_v⁻¹` | Pass |
| §3.1 sentence, `Σ₀(t)` variant, `h_v∈F_vˣ·U₀(π^t)` | `T_w`, `S_w` (`w≠v`), `U_v`, diamonds | `v`-component of `diag(ϖ_w,1)` is `1∈Σ₀(t)`, so every operator is an `[UηU]` of the variant; `U_v` and diamonds have the same double coset (rows above) | Pass |
| §3.1 sentence, `W_t` excluded | level `U₀(π^t)`, no `ε` | `W_t∉F_vˣ·U₀`; `Φ` matches `[Uη_vU]` with the operator of `U₀diag(1,π)U₀` on the `ι′` side | Pass |
| §3.2 bullet: determinant independent of the splitting | `Φ` a `K`-linear isomorphism intertwining the operator | conjugate operators have the same determinant; scope equals §2.2's | Pass |
| §2.2 independence, `Δ=D_fˣ` (carried, b22ec37) | `ι′=hιh⁻¹`, `φ′=φ|h⁻¹` | `φ′(γgu)=φ(g)|(ι(u)h⁻¹)=φ(g)|(h⁻¹ι′(u))=φ′(g)|ι′(u)` | Pass |
| §2.2 the `Σ₀(t)` variant without `ε` (carried) | normalised action `c(det γ)`·algebraic | `c(det ι(u))=c(det ι′(u))`; `c=1` on level units | Pass |
| §2.2 nebentypus condition (carried) | `ε(d(ι′(u)))` against `ε(d(ι(u)))` | symmetric under `h↦h⁻¹`, so the map is onto | Pass |
| §2.2 `h_v∈F_vˣ·U₀(π_v^t)` meets both hypotheses (carried) | `h=λu₀` | lower-right entry of `u₀γu₀⁻¹` is `δd_γδ⁻¹=d_γ` mod `π^t` | Pass |
| §2.2 Check, `ι′=wιw⁻¹`, `u=diag(α,1)` (carried) | `w=((0,1),(−1,0))`, `ε(α)≠1` | `wγw⁻¹=((d,−c),(−b,a))`; factors `ε(1)=1` against `ε(α)` | Pass |
| §2.2 Check, no `ε` (carried) | `n=0`, `v=0` | both spaces the functions on `Cl(U)`; map the identity | Pass |
| §2.6 Check, the `{B}`-summand (carried) | `GL₂` over imaginary quadratic `F`, degree 1 | `H^*(𝔰𝔩₂(ℂ),SU(2);ℂ)=H^*(S³)` in degrees `0`, `3` only | Pass |
| Contract: ALS.5b.4 (carried) | open head, lines 4384–4458 | `FrankeInput` (a)–(c), `{G}`-part = cusp forms, `K` neat | Pass |
| §0.4 Jacobs locator (carried) | `jacobs` lines 714–732 | page 19 at line 714; Definition 1.27 at 719 | Pass |
| §0.3 fibre bijection (carried, f7ed2fe) | injectivity | `xu=γxu′w` ⇒ `x⁻¹γx=uw⁻¹u′⁻¹∈U∩Γ_x` | Pass |
| §0.3 Check `S₃` (carried) | `Γ=⟨(01)⟩`, `U′=⟨(12)⟩` | orbits `{U′,(01)U′}`, `{(02)U′}`: 2 | Pass |
| §0.2 indices (carried) | `p=3`, `t=1` | `[GL₂(ℤ₃):U₀(3)]=4`, `[GL₂(ℤ₃):U₁(3)]=8` | Pass |
| §1.3 right action is `det^v·Sym^n(γᵀ)` (carried) | basis images | columns `(a,b)`, `(c,d)` form `γᵀ` | Pass |
| §1.3 `γᵀ=det(γ)·wγ⁻¹w⁻¹` (carried) | `adj γ` | `w·adj γ·w⁻¹=((a,c),(b,d))` | Pass |
| §1.3 parallel weight via Dirichlet (carried) | `ℚ(√2)`, `(0,2)` | `σ₂(1+√2)²=3−2√2`, infinite order | Pass |
| §1.3 composition (carried) | `n=1`, `γ=((1,1),(0,1))`, `δ=((1,0),(1,1))` | `1|(γδ)=z+1`, `1|(δγ)=z+2` | Pass |
| §1.3 integral monoid with `ε` (carried) | `γ,δ∈Σ₀(t)` | `d_{γδ}≡d_γd_δ mod π^t` | Pass |
| §2.1 trace and central extension (carried) | `u↦uu′`; `uz=u′z′` | `tr∘res=[U:U′]`; `ψ(z′)ψ(z)⁻¹` consistent | Pass |
| §2.2 Check `(10,−5)` (carried) | `GL₂(ℤ)` | `Sym^{10}` has no `SL₂`-invariants; `S₁₂∋Δ` | Pass |
| §2.3 averaging (carried) | `averageMap` | `Σ_h slash(h⁻¹)=Σ_h slash(h)` | Pass |
| §3.1 inversion and Hecke relation (carried) | `η=diag(ϖ,1)`; `q=2` | `[Uη⁻¹U]=S_v⁻¹T_v`; `9=(4+2)+(2+1)` | Pass |
| §3.1 diamond commutes with `U_v` (carried) | `x_α` | `diag(1,d)x_α=x_{αd}diag(1,d)` | Pass |
| §4.3 log isometry threshold (carried) | `ℚ₃(√−3)` | `N>e/(p−1)=1`; `ζ₃` torsion | Pass |
| §4.4 exponent (carried) | `p=2,m=5,n=4` | `3=⌈5/2⌉` | Pass |
| §5.1 Bol (carried) | `F=z^{j+r}` | both sides `(ad−bc)^r(j+r)_rN^jL^{−(j+r+1)}` | Pass |
| §5.2 scalars (carried) | `U_p`, `T_ℓ`, `S_ℓ` over `ℚ` | `p^r`, `ℓ^r`, `ℓ^{2r}` | Pass |
| §5.3 determinant identity and cutoff (carried) | `|τ(π_v)|=p^{−1/e_v}` | `|μ/c_τ|>1` iff `v_p(μ)<r/e_v` | Pass |
| §5.3 Check `e_v=2` (carried) | `v_p(μ)=3/4` | `3/4<1` but `≥1/2`: not covered | Pass |
| §5.3 Example `k=0` over `ℚ` (carried) | one class | `H_κ=(1−pT)H_{κ′}(pT)`; slope `1=r` | Pass |

**Scope of the repaired sentences.** The restriction to the levels `U₀(π_v^t)` and `U₁(π_v^t)` is needed and honest: for a level component `V⊂U₀(π_v^t)` not normalised by `h_v`, the monoids still coincide and `Φ` intertwines every `[UηU]`, but the `ι′`-space's `U_v` is the double coset of `h_v⁻¹diag(π_v,1)h_v`, which `V` need not identify with that of `diag(π_v,1)`. §0.4's certificates are stated only for those two levels, so nothing in Layers 3–5 uses more.

**Policy in the diff.** No process word, pull-request number, LaTeX delimiter or machine path (gate `prnum=0 latex=0 tex=0 private-paths=0 round-labels=0`). The new Check is prose and names no Lean counterpart; the §2.2 paragraph keeps its `*Needs:*` line, now also citing §0.4, which precedes it. "Atkin–Lehner conjugate" is the literature's name for conjugation by `W_t`.

## Not verifiable

- **Gross, *Algebraic modular forms* (1999)** and **Harder (1987), §3**: paywalled, recorded as uncertified in earlier rounds, cited by locator only; unchanged by the diff.
- **Published numbering of Williams (2017):** the arXiv text in the cache was read; the published page numbers were not compared.
- **Ownership against open pull requests** whose files the brief does not give: not checked beyond the consumer probe for §2.2's change of splittings.

## Source issues

- none
