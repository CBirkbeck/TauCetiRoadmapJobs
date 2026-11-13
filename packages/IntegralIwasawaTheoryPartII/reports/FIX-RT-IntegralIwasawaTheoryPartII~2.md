# FIX-RT-IntegralIwasawaTheoryPartII~2: repair report

Five findings from two reviews. RT~2a/F01 and RT~2b/F01 report the same gap and are settled together below. Files changed: `packages/IntegralIwasawaTheoryPartII/README.md`, `packages/IntegralIwasawaTheoryPartII/sources.toml` (DDP11 locator `(73), p. 468` added), `packages/IntegralIwasawaTheoryPartII/design/plan.json` (the `needs` of the existing gap `p-ramified-hilbert-coefficient-families` gains "finite freeness of M° and M′°", matching its README line). `Suggested.lean` is unchanged.

## RT-IntegralIwasawaTheoryPartII~2a/F01, RT-IntegralIwasawaTheoryPartII~2b/F01 (P2) — applied

**Change.** New second item in 2.5a: `e f = 0` implies `c_λ(0, f|A) = 0`, hence `c_λ(0, (e f)|A) = c_λ(0, f|A)`. Its route: `ker e` is spanned by translates whose first character has modulus divisible by some `𝔮 | p`. The route ending now reads the projected product's `A`-constants through this item. Witness added as a Check.

**Evidence.** Both findings hold. The old route took `A`-constants from the unprojected product, and no item covered its non-ordinary components. DDP11 states the vanishing for every pair (lines 1020–1023; the case `𝔭 ∤ 𝔟`, lines 1047–1052) and uses the eigenbasis (73) (line 1261). For the new item: `ker e = Σ_𝔮 ker e_𝔮`, and by the `U_𝔮`-item of 2.2a, `ker e_𝔮` is spanned by the `E_k(η′, φ)|B_𝔱` with `η′` of modulus `lcm(𝔣_η, 𝔮)`. A contributing lattice vector has `η′`-argument of `𝔮`-valuation at least `v_𝔮(𝔠_p) − v_𝔮(𝔣_φ) − v_𝔮(𝔱) ≥ 1`. I recomputed the witness myself (table below).

The statement is review a's. Review b's version is not used: it asserts a basis of imprimitive series indexed by moduli whose product is `𝔫_S`. That is DDP (73)'s basis, valid when each prime above `p` divides the level once. At a dyadic level exponent of 3 or more, with a first character of conductor exponent 1 at `𝔮`, the moduli `(2,1)` and `(1,2)` give the same series `(1 − φ(𝔮)N𝔮^{k−1}B_𝔮)E` (2.2a: they depend on the moduli only through sets of primes). The kernel form needs no basis.

## RT-IntegralIwasawaTheoryPartII~2a/F02 (P3) — applied

**Change.** "§§0.1, 0.4" → "§0.1" at README lines 35, 89 and 332; "Conventions and §0.4" → "Conventions and §0.1" in 2.1; "§§0.4, 9.3" → "§§0.1, 9.3" in the Layer 2 dependencies. Line 89 now names `kappaFull_spec` and `teichmullerFull`.

**Evidence.** At its open head, IntegralIwasawaTheory §0.4 is "Arithmetic completed actions and finite-layer quotients". The full character, `κ_Γ`, `u` and the dyadic sign are in its Conventions and §0.1, where both declarations are defined. A grep finds no remaining IntegralIwasawaTheory §0.4 citation.

## RT-IntegralIwasawaTheoryPartII~2b/F02 (P2) — applied differently

**Change.** In 2.3: deleted the Lemma 3 alternative and the `W_𝔮` step. Defined `Λ_r` and small-disc families, and proved (i) `e` exists on them, (ii) an ordinary one lies in `M° ⊗ Frac(Λ_r)`, (iii) one with weight-zero value `1` gives `𝒢′ ∈ M°(1, ω⁻¹)_(0)`. Added two API bullets, a disc Check, and *Needs* entries (finite freeness, ordinary control, Mathlib Weierstrass).

**Evidence.** The finding holds. The binomial family is classical only at the weights `wj` of a smaller disc, so it is not in `M°(1, ω⁻¹)`. Ventullo asserts the comparison without proof (V15 lines 596–610). The auxiliary-level variant needed `W_𝔮` on families, which no supplier states; `hilbertHasseLift` already gives level one, so that variant is unnecessary.

Departures from the suggested repair:
- **Basis of `M°`, not `M′°`.** Constants in `M′°` can have poles at weight zero: `E(1, ω⁻¹)` has constant `2^{−[F:ℚ]}ζ_{F,p}(1 − k)`. First-order approximation `x_j − y_j ∈ 𝔪` then fails to control the constants of `∑ y_j h_j`. In `M°` the constants lie in `Λ`, and membership in `M°_(0)` follows from `Λ_(0) ∩ g_0^{−a}Λ = Λ`.
- **Normalization factor.** The binomial expansion interpolates unnormalized coefficients. The factor `N(t_λ)^{−k/2}` is interpolated by `⟨N t_λ⟩^{−k/2}` at weights divisible by `2(p − 1)` (by `4` at `p = 2`). The adversarial pass on the new text found this.
- **Disc.** The disc is parametrized exactly.

## RT-IntegralIwasawaTheoryPartII~2b/F03 (P3) — applied

**Change.** The 2.3 route now ends with Hecke operators `t_η = d_η⁻¹(T_λ − η(λ) − η⁻¹ω⁻¹ε(λ))`, the common constant `a ∈ Λ_(0)` with `ν_0(a) = 1`, and `𝒢 = a⁻¹t𝒢′`. *Needs* gains 2.2a and OrdinaryAutomorphicFormsAndModularityLifting §2.12(a). Added a Check (`a = T + 2 − u⁻¹`) and a Corrections line for Ventullo §4.1.

**Evidence.** The finding holds. A weight-zero value of `1` does not make the constants identically `1`, though V15 line 594 asserts it. With `a·𝒢` in place of `𝒢`, Case 1 of 2.5 would leave `F̃` with standard constants `−2^{−[F:ℚ]}u⁻¹Tℒ_χ`. 2.2a at level `∏_{𝔮|p}𝔮` is what makes the constants of `t𝒢′` independent of the component.

## Checks run

- **`lake env lean packages/IntegralIwasawaTheoryPartII/Suggested.lean`** (from the content checkout): one warning, `Suggested.lean:62:8: declaration uses 'sorry'`. No errors. No `TauCeti.*` import.
- **`#check` scratch:** I ran `#check @…isIso_coinfNatTrans_app_of_isZero_groupHomology_res` together with `#check` of `PowerSeries.exists_isWeierstrassDivision` and `PowerSeries.exists_isWeierstrassFactorization`. The theorem's elaborated type keeps every binder (`{k G : Type u_1} [CommRing k] [Group G] (S) [S.Normal] (A : Rep k G)`, the vanishing hypothesis for `0 < q`, `IsIso ((groupHomology.coinfNatTrans k S n).app A)`) and matches README 0.7; nothing changed. Both Weierstrass declarations exist at the pin over a complete local ring, assuming a nonzero residue image, which is how the README now states them.
- **Dependency check:**

```text
depcheck: 207 roadmaps, 1904 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line.
- **`roadmaps resolve`:** no cross-roadmap citation and no Lean name found nowhere.

## Adversarial pass (values computed)

| Statement | Instance | Values | Result |
|---|---|---|---|
| 2.5a, new item | `ℚ`, `N=4`, `p=5`, `k=5` (`ω^{−4}=1`) | `E∣A` and `E∣B_5∣A` both reduce to `E∣γ`, `γ=[[1,0],[1,1]]`, so both constants are `c`; `g=E−χ_4(5)E∣B_5`: `0`; ordinary `E−625E∣B_5`: `−624c` | item holds |
| 2.5a, items 1–2 agree | same | `−624c = κ⟨4⟩^{−4}2^{−1}(1−625)L(−4,χ_4)` gives `c = 5κ/1024` (`L(−4,χ_4)=5/2`, `⟨4⟩=−4`) | consistent |
| 2.5a, `η` ramified at `p` | `ℚ`, `N=4`, `p=5`, `k=3` | pairs `(χ_4,(·/5))`: eigenvalue 1; `((·/5),χ_4)` and `(χ_4(·/5),1)`: eigenvalue 25, constant 0; `(1,χ_4(·/5))`: ordinary, constant 0 because `η≠χ` | exactly one nonzero |
| `ker e_𝔮` spanning | `m=1`, `m=2` | `U(1−αB)E = β(1−αB)E`; `U(1−αB)E∣B^j = (1−αB)E∣B^{j−1}`; characteristic polynomial `(X−β)X^{m−1}`, dimension `m` | spans |
| kernel valuation | level exponent `e`, translate `j` | `v(a) ≥ e − v(𝔣_φ) − j ≥ v(lcm(𝔣_η,𝔮)) ≥ 1` | `η′`-value 0 |
| 2.6 constants under `e` | `U_𝔮` on standard constants | permutes components; on the Eisenstein series `E_k(η,ψ)` it gives eigenvalue `η(𝔮)` and a shift by `𝔮` | vanishing kept |
| 2.3 (i) interpolation | points `0, 5` in `𝒪[[X]]`, `p=5` | `P = g(0) + (g(5)−g(0))X/5`, so `g ∈ (5,X)^2` when `g(0), g(5) ∈ 5^3` | holds |
| 2.3 (iii) uniformizer | `g_0 = T−u⁻¹+1` | image `u⁻¹p^rX`; `ν_0(g_0)=0`; `ν_2(g_0)=u−u⁻¹≠0` | holds |
| 2.3 normalizing factor | `p=5`, `Nt=2`; `p=2`, `Nt=3` | `ω(2)^{−k/2}=1` iff `8∣k`; `ω(3)^{−k/2}=1` iff `4∣k` | `2(p−1)`; `4` |
| 2.3 `t_η` at weight 0 | constant tuple | `(1+q⁻¹)−η−η⁻¹q⁻¹ = (1−η)(1−η⁻¹q⁻¹)`; `η=−1`: `2(1+q⁻¹)` | acts by 1 |
| 2.3 `t_η` at weight `k` | `E_k(η,(η⁻¹ω^{−k})_S)` | `ν_k(η⁻¹ω⁻¹ε(λ)) = η⁻¹ω⁻¹(λ)⟨Nλ⟩^{k−1} = η⁻¹ω^{−k}(λ)Nλ^{k−1}` | kills it |
| 2.3 disc Check | `p=5`, `u=6`, `r=2`, `f=E_4^5` | `v_5(6^k−1)=1+v_5(k)`; disc is `25ℤ_5`; `k/20 ∈ ℤ_5[[X]]` (`v(25^n/n) ≥ 2 = v(20 log 6)`); classical weights `20j` with `10∣j` | holds |
| 2.3 normalization Check | `a=T+2−u⁻¹`, `u=6` | `ν_0(a)=1`; `ν_1(a)=11/6`; `a^♭=1+T/u`; `F̃` constants `−2^{−n}u⁻¹Tℒ_χ` | division needed |
| `M′°` against `M°` | `E(1,ω⁻¹) ∈ M′°` | constant `2^{−n}ζ_{F,p}(1−k)`, pole at `k=0` | first order insufficient for `M′°` |
| 2a/F02 citation | IntegralIwasawaTheory at its head | §0.1 has `kappaFull_spec` and `teichmullerFull`; §0.4 has completed actions | repaired |

**Pattern search.**
- F01: 2.6 also reads the standard constants of `e·F̃` from `F̃`. That step is true because `U_𝔮` permutes standard constants, and I added that clause to 2.6. No other place reads constants at a non-standard cusp.
- F02 (review a): all five occurrences are fixed.
- F03: no other family is normalized by its weight-zero value alone.

**Ownership.** `roadmaps grep` for small-disc or Ventullo families over main and the open heads found no other owner. PadicFamilies has affinoid Coleman families, a different carrier. Small-disc families are owned here, inside 2.3. No `Suggested.lean` name changed.

## For the maintainer

- No Lean name changed; no name that other roadmaps cite changed.
- The supplier gap `p-ramified-hilbert-coefficient-families` (NoncommutativeAndEquivariantIwasawa §F.5) now names finite freeness of `M°` and `M′°` explicitly. §F.5 proves both for odd `p` and conductor prime to `p`, so the gap only extends them.
- Ownership against open pull requests was checked through `roadmaps grep` over every open head and main.
- No source was missing; nothing was added to `needs-references.toml`. No suspicious instruction was found in the reviews.
