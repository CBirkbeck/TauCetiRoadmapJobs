# Review of QuaternionicModularForms (pull request #934 at b22ec37)

**Verdict:** needs changes

This is an incremental re-review of the 49 lines changed since f7ed2fe. All 49 are in `TauCetiRoadmap/QuaternionicModularForms/README.md`; `Suggested.lean` and `metadata.toml` are unchanged, and nothing outside the folder changed. The three findings of the review at f7ed2fe are repaired. The R01 repair is correct in §2.2, but the summaries it added to §3.1 and §3.2 claim more than §2.2 proves. That is this report's one finding.

## R01 (P2) — §3.1 and §3.2 claim the change of splittings commutes with `U_v` under hypotheses that also admit an Atkin–Lehner conjugator

**Location:** `README.md:1050`–`1051` (§3.1): "Level maps, the coefficient extension and, under §2.2's hypotheses on the conjugating element, the change of splittings commute with these operators." Also `README.md:1086`–`1087` (§3.2): "independent of the certificate, the representatives and, under §2.2's hypotheses on the conjugating element, the chosen splitting."

**Claim:** for every conjugating element `h_v` that meets §2.2's hypotheses, the transport `φ↦φ|h⁻¹` intertwines the operators of §3.1, including `U_v` and the diamond operators at the selected place, and the operator on forms does not depend on the splitting. Without a nebentypus, §2.2's only hypothesis is `ι′_v(U_v)⊂Σ₀(t)`. §2.2 itself proves Hecke compatibility only for `[UηU]` with both `ι_v(η)` and `ι′_v(η)` in `Σ₀(t)` (`README.md:683`–`684`). That restriction is a condition on `η`, not on `h_v`, and the summaries drop it.

**Witness:** `h_v=W_t=((0,1),(π_v^t,0))` sends `((a,b),(c,d))` to `((d,c/π_v^t),(π_v^tb,a))`. So it normalises `U₀(π_v^t)⊂Σ₀(t)`, which is §2.2's only hypothesis without `ε`. Yet it sends `diag(π_v,1)` to `diag(1,π_v)`, whose `d`-entry `π_v` is not a unit, so `diag(1,π_v)∉Σ₀(t)`.

Take the level component `U₀(π_v^t)` (a level of §0.4) and no nebentypus. Then `η_v`, with `ι_v(η_v)=diag(π_v,1)`, does not lie in the monoid formed with `ι′`, and §2.2's compatibility does not reach `U_v`. The `U_v` of the space formed with `ι′` is `[Uη′U]` with `ι′_v(η′)=diag(π_v,1)`. Since `W_t²=π_v^tI`, this means `ι_v(η′)=diag(1,π_v)`. Carried back by the transport, it is the Atkin–Lehner conjugate of `U_v`, not `U_v`; on `p`-old forms the Atkin–Lehner involution exchanges the two `U_p`-stabilisations. §3.2's "independent of … the chosen splitting" fails for the same element.

**Repair:**
- In §3.1, replace "under §2.2's hypotheses on the conjugating element, the change of splittings" with "the change of splittings by `h_v∈F_vˣ·U₀(π_v^t)` (§2.2)".
- In §3.2, replace "under §2.2's hypotheses on the conjugating element, the chosen splitting" with "for `h_v∈F_vˣ·U₀(π_v^t)`, the chosen splitting".
- In §2.2, after "Both hypotheses hold for `h_v∈F_vˣ·U₀(π_v^t)` …", add: "For such `h_v`, `ι′_v(η)∈Σ₀(t)` whenever `ι_v(η)∈Σ₀(t)`. At the levels `U₀(π_v^t)` and `U₁(π_v^t)` of §0.4, `U_v` and the diamond operators are given by the same double cosets for `ι` and `ι′`: scalars conjugate trivially, `U₀(π_v^t)=U₁(π_v^t)·diag(1,𝒪_vˣ)`, and `diag(1,𝒪_vˣ)` normalises `U₁(π_v^t)` and commutes with `diag(π_v,1)`."
- Add the Check: "`W_t=((0,1),(π_v^t,0))` normalises `U₀(π_v^t)`, so without `ε` the space formed with `ι′=W_tιW_t⁻¹` exists. But `W_t·diag(π_v,1)·W_t⁻¹=diag(1,π_v)∉Σ₀(t)`, so the `U_v` formed with `ι′` is the Atkin–Lehner conjugate of the one formed with `ι`."

**Repair tested on the refuting instance:** every matrix of `U₀(π_v^t)` has a unit `a`-entry, because `a=0` would force `det=−bc∈π_v^t`. `W_t` has `a=0`, so `W_t∉F_vˣ·U₀(π_v^t)`, and the repaired sentences no longer cover it. For `h_v=u` with `u` in the level component, `Uι_v⁻¹(u⁻¹diag(π_v,1)u)U=Uη_vU`. For `h_v=u₁·diag(1,δ)` at level `U₁(π_v^t)`, conjugating by `diag(1,δ)` fixes both `U₁(π_v^t)` and `diag(π_v,1)`.

## Previous findings

- R01 — repaired: "For `Δ=D_fˣ`, two choices are conjugate … assume `ι′_v(U_v)⊂Σ₀(t)` … assume in addition `d(h_vγh_v⁻¹)≡d(γ) mod π_v^t` … Both hypotheses hold for `h_v∈F_vˣ·U₀(π_v^t)`" (`README.md:675`–`691`), with the requested negative control at `README.md:723`–`731`. The §3.1/§3.2 summaries this repair added are this report's R01.
- R02 — repaired: "ALS.5b.4 the decomposition of cohomology by associate classes of parabolics, under its Franke hypothesis, and its Eisenstein (`{B}`) summand" (`README.md:207`–`209`). The Check at `README.md:992`–`994` now cites the `{B}`-summand.
- R03 — repaired: "Jacobs's `Σ_α` is our `Σ₀(α)` (Jacobs, Definition 1.27, p. 19)" (`README.md:389`).

## Verified sound

**Gate, elaboration, dependency check.**

- I ran the push gate on this head (`--base origin/main`, without `--build`). Every check passes except `dropped=2`, which flags `Suggested.lean:46` `namespace TauCetiRoadmap.QuaternionicModularForms` and `:48` `end TauCetiRoadmap.QuaternionicModularForms`.
- The cause is the gate configuration's list of dropped roadmap names, the names the project's roadmaps must never cite as suppliers. That list contains `QuaternionicModularForms` itself, so the check matches the namespace that the Lean form rules require of this folder.
- This is a false positive of the check on the roadmap's own folder, not something the author can repair, and I raise no finding for it. The worker's gate on this head records `dropped=0` and `build=0` with every check passing.
- The worker should note that list entry before any later acceptance: my run of the gate fails `dropped` while the entry stands.
- `lake env lean TauCetiRoadmap/QuaternionicModularForms/Suggested.lean`: exit 0, no output.
- `git diff --stat origin/main...HEAD` outside the folder: empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- The dependency check with `--movable` against the merge order and main:

```text
depcheck: 243 roadmaps, 2456 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The pins are Tau Ceti `a91d3aa` and Mathlib `6b7abb3c`.

**Suggested.lean** is unchanged since f7ed2fe: one module docstring, one `import Mathlib`, an empty namespace, no declaration. Its headline list and the missing carrier for each were verified in the review at f7ed2fe. There is nothing to probe for padding, and with no declarations there are no signatures to `#check` (`signatures.md` records none).

**Library declaration opened at the pin.** `TauCeti.skolemNoether` (`TauCeti/Algebra/CentralSimple/SkolemNoether.lean:107`) takes `[IsSimpleRing A] [FiniteDimensional K A] [Algebra.IsCentral K B] [IsSimpleRing B] (f g : B →ₐ[K] A)` and concludes `∃ u : Aˣ, ∀ x, g x = u * f x * u⁻¹`. The repaired §2.2 applies it twice, and both match:

- with `B=D_v⊗_{F_v,σ}K` (central simple over `K`, dimension 4) and `A=M₂(K)`;
- "over `F_v`" with `B=D_v` and `A=M₂(F_v)`.

In both cases `ι′=hιh⁻¹` with `h=u`.

**Cross-roadmap citations resolved** (ArithmeticLocallySymmetricSpaces at its open head `360d0bc`, which `roadmaps show` printed):

- ALS.5b.4 (line 4384) defines `FrankeInput(G,K,V)`: (a) Franke's comparison; (b) the decomposition over associate classes `{P}` of rational parabolics, with the `{G}`-part the cusp forms; (c) the eigensystems of the proper summands. Under it, ALS.5b.4 proves the decomposition of `H^*(X_K,V)` for neat `K`, and its Check (lines 4449–4452) says that for `GL_{2,ℚ}` the `{B}`-summand of `H¹` is spanned by Eisenstein classes. The new contract line and the §2.6 Check say exactly this.
- ALS.5b.5 (line 4460) identifies its image with the `{G}`-summand under `FrankeInput`.
- ALS.F.6 (line 995) defines `LocallySymmetric.AutomorphicForm` (lines 997, 1034). This is the citation resolver's one lead: a planned name, not a missing one.
- ALS.F.5 (957), F.7 (1066), 0.4 (1309), 1.1 (1763), 1.3 (1900), 3.1 (2691) and 5b.1 (4258) are unmoved.

**Consumers.** AutomorphicGaloisRepresentations (line 310 at its head) consumes "change of splitting with or without nebentypus" and Hecke "compatibility with level and coefficient changes". Both agree with §2.2 at this head; it does not consume the §3.1 sentence of R01. The overlaps report lists no dropped id, no conflicting head and no shared folder. Ownership is unchanged by the diff (the last full review's audit at f7ed2fe stands). Ownership against open pull requests whose files the brief does not give was not checked.

**Seeded sample in the changed passages.**

| Target | Source, locator, cache lines | Verified |
| --- | --- | --- |
| 0.4 | `jacobs` Definition 1.27, lines 719–732; page 19 begins at line 714 | the monoid of integral matrices with `p^α` dividing `c`, `d` prime to `p` and nonzero determinant: the README's `Σ₀(α)` over `ℤ_p`; page now correct |
| 2.2 (independence of splittings) | Tau Ceti `TauCeti.skolemNoether` at the pin; own computations below | yes |
| 3.1 (commutation sentence) | §2.2 of this README | no: R01 |

The other twelve sampled targets (1.1, 1.2, 1.3, 1.4, 2.4, 2.5, 3.3, 4.1, 4.2, 4.3, 5.1, 5.3) are unchanged since f7ed2fe. Their locators were verified in the review at f7ed2fe (its seeded-sample table) or in earlier reviews it carried.

**Computed adversarial pass.** The first block covers the statements the diff adds or changes. The second carries the review at f7ed2fe's rows for statements the diff leaves untouched, with the values computed there.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §2.2 independence, `Δ=D_fˣ` | `ι′=hιh⁻¹`, `φ′=φ|h⁻¹`, `u∈U`, `γ∈Dˣ` | `φ′(γgu)=(φ(g)|ι(u))|h⁻¹=φ(g)|(ι(u)h⁻¹)=φ(g)|(h⁻¹ι′(u))=φ′(g)|ι′(u)`; the same identity on each `x_t` of `UηU` gives `T_η` | Pass |
| §2.2 the `Σ₀(t)` variant without `ε` | normalised action = `c(det γ)`·algebraic, over the field `K` | `c(det ι(u))=c(det ι′(u))` since `det(hγh⁻¹)=det γ`; `c=1` on level units; `ι′(x_t)=ι′(u₁)ι′(η)ι′(u₂)∈Σ₀(t)` when `ι′(η)∈Σ₀(t)` | Pass for `[UηU]` with `ι(η)` and `ι′(η)` in `Σ₀(t)` |
| §2.2 nebentypus condition | `ε(d(ι′(u)))` against `ε(d(ι(u)))` | the hypothesis gives `d(ι′(u))≡d(ι(u))`; symmetric under `h↦h⁻¹` (put `γ=h⁻¹γ′h`), so the map is onto | Pass |
| §2.2 `h_v∈F_vˣ·U₀(π_v^t)` meets both hypotheses | `h=λu₀` | `ι(U_v)⊂GL₂(𝒪_v)∩Σ₀(t)=U₀(π_v^t)`, which `u₀` normalises; modulo `π_v^t` the matrices `u₀`, `u₀⁻¹`, `γ` are upper triangular and the lower-right entry of `u₀γu₀⁻¹` is `δ·d_γ·δ⁻¹=d_γ` | Pass |
| §2.2 Check, `ι′=wιw⁻¹`, `u=diag(α,1)` | `w=((0,1),(−1,0))`, `ε(α)≠1` | `wγw⁻¹=((d,−c),(−b,a))` (checked on random rational matrices); `ι′(u)=diag(1,α)`, so the factors are `ε(1)=1` against `ε(α)`; `ι′(U_v)=ι(U_v)` since `b,c∈π_v^t` are swapped; `w∉F_vˣ·U₀(π_v^t)` because a matrix of `U₀(π_v^t)` with `a=0` has `det=−bc∈π_v^t` | Pass |
| §2.2 Check, no `ε` | `n=0`, `v=0` | trivial action, so both spaces are the functions on `Cl(U)` and the slash by `w⁻¹` is the identity | Pass |
| §3.1, §3.2: change of splittings commutes with `U_v` under §2.2's hypotheses | `h=W_t=((0,1),(π_v^t,0))`, level `U₀(π_v^t)`, no `ε` | `W_tγW_t⁻¹=((d,c/π_v^t),(π_v^tb,a))`, so `W_tU₀(π_v^t)W_t⁻¹=U₀(π_v^t)`; `W_t·diag(π_v,1)·W_t⁻¹=diag(1,π_v)` with `d=π_v∉𝒪_vˣ`; `W_t²=π_v^tI` | Fail (R01) |
| §3.1/§3.2 repaired with `h_v∈F_vˣ·U₀(π_v^t)` | levels `U₀`, `U₁` | `u₀diag(π_v,1)u₀⁻¹∈Σ₀(t)` (monoid); `diag(1,δ)` commutes with `diag(π_v,1)` (checked) and normalises `U₁(π_v^t)` | Pass |
| §2.6 Check, the `{B}`-summand | `GL₂` over imaginary quadratic `F`, `V=ℂ`, degree 1 | the associate classes of `F`-parabolics are `{G}` and `{B}`; the residual characters `χ∘det` contribute through `H^*(𝔰𝔩₂(ℂ),SU(2);ℂ)=H^*(S³)`, in degrees `0` and `3` only, so the degree-1 `{B}`-summand consists of Eisenstein classes | Pass |
| Contract: ALS.5b.4 | open head, lines 4384–4458 | `FrankeInput` (a)–(c), decomposition over associate classes `{P}`, `{G}`-part = cusp forms, `K` neat | Pass |
| §0.4 Jacobs locator | `jacobs` lines 714–732 | page 19 starts at line 714; Definition 1.27 at line 719 | Pass |
| §0.3 fibre bijection (carried, f7ed2fe) | injectivity | `xu=γxu′w` ⇒ `x⁻¹γx=uw⁻¹u′⁻¹∈U∩Γ_x` | Pass |
| §0.3 Check `S₃` (carried) | `Γ=⟨(01)⟩`, `U′=⟨(12)⟩` | `(01)(02)U′=(02)U′`; orbits `{U′,(01)U′}`, `{(02)U′}`: 2 | Pass |
| §0.2 indices (carried) | `p=3`, `t=1` | `[GL₂(ℤ₃):U₀(3)]=4`, `[GL₂(ℤ₃):U₁(3)]=8` | Pass |
| §1.3 right action is `det^v·Sym^n(γᵀ)` (carried) | basis images | the matrix with columns `(a,b)`, `(c,d)` is `γᵀ` | Pass |
| §1.3 `γᵀ=det(γ)·wγ⁻¹w⁻¹` (carried) | `adj γ` | `w·adj γ·w⁻¹=((a,c),(b,d))` | Pass |
| §1.3 parallel weight via Dirichlet (carried) | `ℚ(√2)`, `(0,2)` | `σ₂(1+√2)²=3−2√2`, of infinite order | Pass |
| §1.3 composition (carried) | `n=1`, `γ=((1,1),(0,1))`, `δ=((1,0),(1,1))` | `1|(γδ)=z+1`, `1|(δγ)=z+2` | Pass |
| §1.3 integral monoid with `ε` (carried) | `γ,δ∈Σ₀(t)` | `d_{γδ}=c_γb_δ+d_γd_δ≡d_γd_δ mod π^t` | Pass |
| §2.1 trace and central extension (carried) | `u↦uu′`; `uz=u′z′` | representative-independent; `tr∘res=[U:U′]`; `ψ(z′)ψ(z)⁻¹` consistent | Pass |
| §2.2 Check `(10,−5)` (carried) | `GL₂(ℤ)` | `−I` acts by `1`; `Sym^{10}` has no `SL₂`-invariants; `S₁₂∋Δ` | Pass |
| §2.3 averaging (carried) | `averageMap` | `Σ_h slash(h⁻¹)=Σ_h slash(h)` | Pass |
| §3.1 inversion and Hecke relation (carried) | `η=diag(ϖ,1)`; `q=2` | `[Uη⁻¹U]=S_v⁻¹T_v`; `9=(4+2)+(2+1)` | Pass |
| §3.1 diamond commutes with `U_v` (carried) | `x_α` | `diag(1,d)x_α=x_{αd}diag(1,d)` | Pass |
| §4.3 log isometry threshold (carried) | `ℚ₃(√−3)` | `N>e/(p−1)=1`; `ζ₃∈1+π𝒪` is torsion | Pass |
| §4.4 exponent (carried) | `p=2,m=5,n=4` | `3=⌈5/2⌉` | Pass |
| §5.1 Bol (carried) | `F=z^{j+r}` | both sides `(ad−bc)^r(j+r)_rN^jL^{−(j+r+1)}` | Pass |
| §5.2 scalars (carried) | `U_p`, `T_ℓ`, `S_ℓ` over `ℚ` | `p^r`, `ℓ^r`, `ℓ^{2r}` | Pass |
| §5.3 determinant identity and cutoff (carried) | `|τ(π_v)|=p^{−1/e_v}` | `|μ/c_τ|>1` iff `v_p(μ)<r/e_v`; Neumann series | Pass |
| §5.3 Check `e_v=2` (carried) | `v_p(μ)=3/4` | `3/4<1` but `≥1/2`: not covered | Pass |
| §5.3 Example `k=0` over `ℚ` (carried) | one class | `H_κ=(1−pT)H_{κ′}(pT)`; slope `1=r` at the boundary | Pass |

**Policy in the diff.** The diff adds no process word, pull-request number, LaTeX delimiter or machine path (gate `prnum=0 latex=0 tex=0 private-paths=0 round-labels=0`). The new Check is in prose and names no Lean counterpart, and the §2.2 paragraph keeps its `*Needs:*` line.

## Not verifiable

- **Gross, *Algebraic modular forms* (1999)** and **Harder (1987), §3**: paywalled, recorded as uncertified in earlier rounds, cited by locator only; unchanged by the diff.
- **Published numbering of Williams (2017):** the arXiv text in the cache was read; the published page numbers were not compared.
- **Ownership against open pull requests** whose files the brief does not give: not checked beyond the `roadmaps grep` probe for consumers of §2.2's change of splittings.

## Source issues

- none
