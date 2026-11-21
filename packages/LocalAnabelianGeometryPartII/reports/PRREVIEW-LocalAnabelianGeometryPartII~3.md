# Review of LocalAnabelianGeometryPartII (pull request #2867 at 1a52af2)

**Verdict:** needs changes

**Summary.** Changes are needed: three findings, all P2. The absolute theorem for `G_K` holds for every `p`, `p = 2` included, by the README's own 5.4–5.5 and the conjugation argument 6.3 already uses, so Theorem A′ with `p ≠ 2` and the scope paragraph that sets `p = 2` aside narrow a headline below what the roadmap proves; and two sentences of commentary assert false mathematics (`F_{γ, −N}` modulo `C₃` does depend on `N`; the bracket sum of `F_γ` is finite, not infinite). The four findings of the previous review are repaired. There are five small corrections and three format notes, none blocking. Layers 7–11 rest on [Abrashkin 2000] and [Deligne 1984], which could not be read legally; that is left to the human reviewers.

## R01 (P2) — The absolute statement for `G_E ≅ G_{E'}` follows for every `p` from 5.4, 5.5 and the argument of 6.3, so restricting Theorem A′ to `p ≠ 2` and declining `p = 2` as "a new argument" narrows the headline

The scope section (line 1048) says the passage from Theorem A to `G_E`, `G_{E'}` "needs a compatibility of the `μ_F` for `F₁ ⊆ F₂` that the source does not supply", and 9.3 and `exists_ringEquiv_conj_of_filtered_absoluteGaloisGroup` carry `p ≠ 2`. An implementer is left with a "good primes only" headline although the roadmap's own targets give the general one, and [Abrashkin 2010, p. 2] asserts it.

The compatibility is the uniqueness of 5.5, used exactly as in the fourth step of 6.3. Let `G : G_E ≃ₜ* G_{E'}` be filtered and `F/E` finite Galois, with `G(G_F) = G_{F'}`. By FilteredLocalGaloisGroups 1.5 and 2.2, `G` restricts to a filtered `G_F ≅ G_{F'}`, and by 1.3 it induces a filtered `g_F : Γ_F(p) ≅ Γ_{F'}(p)`; `F(p)/E` is Galois and `G` induces `ḡ : Gal(F(p)/E) ≅ Gal(F'(p)/E')` extending `g_F` (`map_proPKernel_eq`). Theorem A gives `μ_F : F(p) → F'(p)` with `μ_F(F) = F'` and `μ_F^* = g_F`. For `τ ∈ Gal(F(p)/E)` put `μ' = ḡ(τ)⁻¹ ∘ μ_F ∘ τ`. Then `μ'(F) = F'`, and for `x ∈ Γ_F(p)`: `μ' x μ'⁻¹ = ḡ(τ)⁻¹ g_F(τxτ⁻¹) ḡ(τ) = g_F(x)`. By 5.5, `μ' = μ_F`, that is `μ_F τ μ_F⁻¹ = ḡ(τ)` on all of `Gal(F(p)/E)`; so `μ_F(E) = E'`. For `F₁ ⊆ F₂`, `F₁(p) ⊆ F₂(p)` is the fixed field of a subgroup that `ḡ₂` carries to the corresponding one, so `μ_{F₂}` restricts to an isomorphism `F₁(p) → F₁'(p)` inducing `ḡ₁`, and 5.5 again gives `μ_{F₂}|_{F₁(p)} = μ_{F₁}`. The colimit over `F` is an isomorphism `E^sep → E'^sep` inducing `G`. Nothing here uses `p ≠ 2`.

The smallest repair: add this as a target after 6.4 ("the absolute form, every `p`", *Needs:* 5.0, 5.4, 5.5, 6.4, FilteredLocalGaloisGroups 1.3, 1.5, 2.2), replace the scope bullet on `p = 2` by a pointer to it, and drop `hp : p ≠ 2` from the Lean statement (9.3 then cites the new target for `p = 2`; whether 9.2 stays as the Lie-algebra route for `p ≠ 2` is the author's choice, and Layers 7–8 are needed for Layer 11 in any case). Add the negative control that the argument needs uniqueness: without 5.5 the `μ_F` are defined only up to the centralizer.

## R02 (P2) — With the README's definition, `F_{γ, −N}` modulo `C₃` does depend on `N` for integral `γ`

The conventions (line 133) define `F_{a0}` as `F_{γ, −N}` at `γ = a`, `N = 0` and add "modulo `C₃` it does not depend on `N` for integral `γ` (§3.3)". An implementer who relies on this proves a false identity. In the displayed sum the `a_i` range over `ℤ⁰(p)`, so for `γ = a ∈ ℤ(p)` and `N ≥ 1` the indices `s = 2`, `a_1 = a`, `n_1 = 0`, `a_2 = 0`, `−N ≤ n_2 ≤ −1` satisfy `p^{n_1}a_1 + p^{n_2}a_2 = a`, with `η(0, n_2) = 1`. They contribute `−a[D_{a0}, D_{0, n_2}] = −a σ^{n_2}(α₀)[D_{a0}, D₀]`, so

`F_{a, −N} = F_{a, 0} − a·(Σ_{−N ≤ n < 0} σⁿ(α₀))·[D_{a0}, D₀] mod C₃`.

At `N = N₀` the coefficient is `Tr(α₀) = 1`, and `[D_{a0}, D₀] ≠ 0` in the free Lie algebra modulo `C₃`; for `k = 𝔽_p` already `F_{a, −1} = F_{a, 0} − a[D_{a0}, D₀]`.

What is independent of `N` is the ideal: a `σ`-invariant ideal containing `ap^mΔ_{am} + (brackets)` contains its bracket with `D₀`, which is `ap^m[D_{am}, D₀]` modulo `C₃`, so the ideals of 7.3 are the same for every `N`. Replace the clause by that statement (the elements differ by the displayed multiple of `[D_{a0}, D₀]`; the ideals `L^{(v)}_W` of 7.3 do not depend on `N`), and add the rank-one computation as a Check. [Abrashkin 2000] could not be read, so whether §3.3 says the sentence as written is not checked; the computation is from the README's own formula.

## R03 (P2) — The bracket sum in `F_γ` (2.1) is finite for every `γ`, not "infinite and convergent because `a₂ → ∞`"

Line 333 says of the third sum of `F_γ`: "The last sum is infinite and converges in `𝒜_k`, because `a₂ → ∞`." It is a finite sum, so the sentence sends an implementer to a convergence argument that does not exist and misdescribes the element. In `p^{n₁}a₁ + p^{n₂}a₂ = γ` with `n₂ < n₁` and `p ∤ a₂`, the left side is `p^{n₂}(p^{n₁−n₂}a₁ + a₂)` with the bracket prime to `p`, so `n₂ = v_p(γ)` is forced; all terms are positive, so `p^{n₁}a₁ < γ` leaves finitely many `(n₁, a₁)` with `n₁ ≥ 0`, and `a₂` is then determined. Examples: `γ = 1 + 1/p` gives the single term of the README's own Check; `γ = 5`, `p = 3` gives only `(n₁, a₁, n₂, a₂) = (1, 1, 0, 2)`. The source (Abrashkin2010 line 1047) makes no convergence claim. Replace the sentence by "The last sum is finite: `n₂ = v_p(γ)` is forced and `p^{n₁}a₁ < γ`."

## C01 — The description's paragraph on `Suggested.lean`, its dependency list and its remark on GeometricTopology describe an earlier head

"`Suggested.lean` states: the index set `ℤ(p)`; the truncated Magnus algebra … as a `RingQuot`; … the ring and module of Deligne's `Tr_e(F)`": the head declares none of these. It declares `localAbsoluteUpperRamificationGroup`, Theorem A, Theorem A′, `classTwoMul` with its associativity (proved, as a check) and Witt's `cd_p ≤ 1`. "Every filtered statement need[s] the absolute upper filtration and `GroupFiltration`, which have no declarations at the pins": the head states the two filtered headline theorems. "GeometricTopology §4.12.1 … does not serve Layer 0": the head cites it as the supplier of 0.1's finite levels, and the dependency list should name it (and FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3, cited in 11.1).

## C02 — Prop. 5.4 is quoted with `N₀ ≥ 3` for `p ≠ 2`; the source has `N₀ ≥ 2`

In 3.3 (line 460): "for `a < p^{N₀−1}` when `p ≠ 2` and `N₀ ≥ 3`". The printed statement (Abrashkin2010 line 1549, p. 38) has `N₀ ≥ 2` for `p ≠ 2` and `N₀ ≥ 3` only for `p = 2`. The narrower form is true and suffices for 5.3, but it is not the proposition cited; write `N₀ ≥ 2`.

## C03 — The Summary attributes uniqueness of `μ` to [Abrashkin 2010, Thm. A]

"Abrashkin's theorem [Abrashkin 2010, Thm. A] says that … is conjugation by a unique field isomorphism" (line 7). Theorem A (Abrashkin2010 line 76) asserts existence only; uniqueness is the README's 5.5, as 5.5 itself says. Say "is conjugation by a field isomorphism …, which is unique (5.5)".

## C04 — The dependency lines of Layers 7 and 9 omit items their routes use

Layer 7's `*Needs:*` and the dependency paragraph give "Layer 0, 1.1–1.2 and FunctionFieldArithmetic 4.4", but 7.2 uses 1.3 (the Witt–Artin–Schreier isomorphism), 1.5 (the induction for `σf = f ∘ e`) and the sign of 1.6 (b), and 7.3 uses 2.2's route. Layer 9 is given "Layer 8, 5.1 and FieldOfNorms", but 9.1 uses FilteredLocalGaloisGroups 1.4, 1.5, 2.2 and ClassFieldTheory Layer 7, and 9.2 uses FunctionFieldArithmetic 3.1. No order changes; list them.

## C05 — In 5.3 the clause on "the at most two `s` with `N_s < 3`" refers to an empty set

5.3 takes `K` with `N₀(K) ≥ 3` (line 567), so `N_s = N₀p^s ≥ 3` for every `s ≥ 0` and the sentence "For the at most two `s` with `N_s < 3`, `n_s` is defined from a larger level" (line 572) has no instance. Drop it, or drop the restriction `N₀(K) ≥ 3` and keep the sentence.

## N01 — The targets are bold list items (`- **1.3 …**`), not `### k.n` subsections, so tools that count and sample targets find none; the sample of this review was chosen by hand.

## N02 — The pointed Serre theorem is `TauCeti.IsProP.exists_convergesToOne_continuousMulEquiv_presentation_of_cohomologicalDimensionAt_le_one`; 1.1 and the supplier contracts omit the namespace `IsProP`. "From Mathlib" still lists `RingQuot`, which nothing in the head uses.

## N03 — The decomposition of `O(K)/(σ − id)O(K)` cited as "proof of Prop. 1.2 b), p. 6" is displayed on p. 7 (the proof begins on p. 6).

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Thm A, 5.4/6.4 vs Abrashkin2010 line 76 | hypotheses; `p = 2`; uniqueness | both fields finite residue field, `v ≥ 0`, `μ̄(E) = E'`, `g = μ̄^*`; no uniqueness in source | agrees; C03 |
| Lean Theorem A | `K = K'`, `g = id`; mixed characteristics | `e = id`, `τ' = τ` works; hypothesis impossible by 5.1, vacuous | sound |
| Lean Theorem A′; absolute form | `F₁ ⊆ F₂`; `τ ∈ Gal(F(p)/E)` | `μ' = ḡ(τ)⁻¹μ_Fτ` has `μ'^* = g_F`; 5.5 gives `μ' = μ_F`; no `½` used | R01 |
| 5.5 uniqueness | `ν` centralizing `Γ_K(p)` | kernel of `K^× → K̂^×` is `μ_{q−1}`; `ν(1 + πx) = 1 + πx` gives `ν(π) = π`, `ν = id` | sound |
| 5.0 | `N ⊆ G_L` | `(G_E(v)N ∩ G_L)/N = (G_E(v) ∩ G_L)N/N` by the modular law | sound |
| Conventions, `v ∈ [0, 1]` | totally ramified `p`-group | `G_0 = G_1`, `φ(x) = x` on `[0, 1]`, so `G^v = G_0` | true |
| 1.3 decomposition vs Abrashkin2010 line 283 | `x ∈ tW(k)[[t]]`; `ct^{−ap}` | `(σ − 1)(−Σσ^m x) = x`; `σ(σ⁻¹(c)t^{−a}) = ct^{−ap}` | agrees |
| 1.3 remark, `p = 3`, `k = 𝔽₉` | Teichmüller units | traces `2, −2, 0, 0, ±√−2`; none is `1` | true |
| 1.3 reciprocity vs FunctionFieldArithmetic 4.3 | `[α_s t^{−a}, E(β_r, t^a)^{1/a})` | `Res(c t^{−a}·a w t^a dt/t) = acw`; pairing `Tr(α_sβ_r) = δ` | consistent |
| 1.6 homomorphism, 7.2 | `τ ↦ (τ⁻¹f)f⁻¹`; `(τ⁻¹f) ∘ (−f)` | `ψ(τ₁τ₂) = τ₂⁻¹(ψ(τ₁))·ψ(τ₂) = ψ(τ₁)ψ(τ₂)`; `σ`-invariant since `e ∘ (−e) = 0` | sound |
| 1.6 (b) sign (previous R02) | `k = 𝔽_p`, `α₀ = 1` | `τ₀f₀ = f₀ + 1`, `τ₀⁻¹f₀ − f₀ = −1`, `ψ_f(τ₀) ≡ 1 − D₀` | repaired |
| 2.1 `F_γ` vs Abrashkin2010 line 1042 | `γ = 1, 2, 1 + 1/p`; `γ = 5`, `p = 3` | `D_{10}`; `2D_{20} − D_{10}²`; `−[D_{10}, D_{1,−1}]`; one bracket term `(1,1,0,2)` | Checks true |
| 2.1 third sum | general `γ` | `n₂ = v_p(γ)` forced, `p^{n₁}a₁ < γ`: finitely many terms | R03 |
| 2.2 route, step three (previous R01) | `v = 1`, `y = t^{−1}`; `y = α₀` | `s(1,1) = 0`, need `c_1 ∈ p^M W_M = 0`: does not kill; `α₀` kills | repaired |
| 2.2 vs FunctionFieldArithmetic 4.4 | `a p^{M−1−v(c_a)} < v` | iff `M − 1 − v(c_a) < s(a, v)` iff `c_a ∈ p^{M−s}W_M(k)`; dual `p^{s}ℤ_p` | consistent |
| 2.5 induction vs Abrashkin2010 line 1098 | `S` not an up-set | `inf S` gives no hypothesis of B′; `inf{w : [w, ∞) ⊆ S}` does, then left continuity contradicts | README correct |
| 3.1 admissibility vs line 433; Check | `Fr(t)^*`, `N₀ = 1, 2` | `α_{1,1,−1} = 1`: not admissible for `N₀ ≥ 2`; `Fr(t) = id` for `N₀ = 1` | Check true |
| 3.2 Prop. 2.1 vs line 366; Check | `η(t) = αt` | `η⁻¹(t)^{−a} = α^a t^{−a}`, `α_{aa0}(η^*) = α^a` | Check true |
| 3.3 Prop. 5.9 vs line 1660 | first step | need `α_{aa0}(η^*) = α^{−a}`: `η(t) = α⁻¹t`; source prints `αt` | README correct |
| 3.3 `ℱ_γ(v)` vs line 1431 | `γ = ap^m` | `F_{ap^m} = p^mσ^mF_a − Σ_{n<m}`; terms `n = m` and all brackets inside `Δ_{am}` | `n < m` right |
| 3.3 Prop. 5.4 vs line 1549 | hypothesis on `N₀` | source `N₀ ≥ 2` (`p ≠ 2`), `N₀ ≥ 3` (`p = 2`); README `N₀ ≥ 3` | C02 |
| 4.1 formal sums vs Prop. 3.2 (line 670) | `π_{K∞}` on `n ≥ 0` | each `t^{m−1}dt`, `m = ap^n`, hit once: onto `Ω̂¹`, kernel `n < 0` | consistent |
| 4 Check, Cartier | `c t^{ap^n}dt/t` | `σ⁻¹(c)t^{ap^{n−1}}dt/t`; `t^a dt/t = d(t^a)/a` exact | true |
| 5.3 vs Abrashkin2010 lines 1780–1826 | compositions | `g⁰ = Fr^{n_s*} ∘ g`, `h_s = ξ_s^* ∘ g⁰`, `μ = Fr(t_{K'})^{−n̄} ∘ η`; `N_s ≥ 3` always | agrees; C05 |
| 6 Check, `E = ℚ_p` | `p` odd | rank 2, `I = ⟨⟨y⟩⟩` since `F/⟨⟨y⟩⟩ ≅ ℤ_p ≅ F/I`; the swap sends `I` to `⟨⟨x⟩⟩ ≠ I` | true |
| Conventions `F_{γ, −N}` | `γ = a`, `N = 0, 1, N₀` | extra term `−aσ^{n₂}(α₀)[D_{a0}, D₀]`; at `N₀`: `−a[D_{a0}, D₀] ≠ 0` | R02 |
| 7.3 `ℱ^{(v)}_γ`; Checks | `v = 1`; `v = 2 + 1/p` | no bracket with `p^{n₁}a₁ < 1`; only `(a₁, n₂, a₂) = (2, −1, 1)`: `−2[Δ_{20}, Δ_{1,−1}]` | Checks true |
| 0.3 class-two law | commutator, sum, kernel | `x∘y∘(−x)∘(−y) = [x, y]`; `x∘y∘(−½[x, y]) = x + y`; `θ'⁻¹(1 + 𝒥³) = C₃` | sound |
| 0.1 finite level (previous R04) | GeometricTopology §4.12.1 | same quotient of `FreeAlgebra R I`, `d = n − 1`; basis, deletion, universal property there | repaired |
| Witt (1.1) in Lean | `K` algebraically closed; `K = 𝔽_p`; library | `cd = 0`; `cd ℤ_p = 1`; library has only the case `p` invertible, no `μ_p` | true, not duplicated |
| 10 Checks | `e = 1`; `ℚ_p(ζ_p)`; `ℚ_p(ζ_{p²})` | `ε = 0`; `𝒪/p = 𝒪/𝔪^{p−1}`; upper jumps `0, 1`, lower `0, p − 1` | true |
| 11 numerics | Kummer tower; `p = 3`, `M = 1, 2` | `ψ(a_K) = e_Kp^M/(p−1) + p^Me_K = v_K`; `(6, 81, 21, 54, 12)`; `(2, 9, 8)` | consistent |
| 11.2 level | `r(K_M)` in FieldOfNorms 1.4 | `⌈(p−1)/p · e_{K_M}p/(p−1)⌉ = e_{K_M} = w_K` | consistent |
| 11.5 threshold | `L = ℚ_p(ζ_M)` | `v_L(p^{1/(p−1)}) = p^{M−1}`; `v + 1 + ε ≤ p^{M−1}` iff `v < p^{M−1} − 1` | consistent |
| One-tactic probes | `simp`, `rfl`, `infer_instance` on the three `sorry`s | none closes | no padding |

- Source locators checked against the text: 31 targets, all in Abrashkin2010 (journal version, printed page = file page − 1): Thm A; §§1.1–1.2; Props. 1.1–1.3; §1.4; Prop. 2.1; the definitions of `ℳ^{(v)}`, `Aut_adm`, `f_an`; Prop. 2.2, Cor. 2.3, Props. 2.4, 2.7; Props. 3.1–3.4, the definitions of admissible and locally analytic systems, §3.5, Prop. 3.6; Props. 4.1–4.3, `F_γ`, Thms. B, B′ and the deduction, Lemma 4.4; §5.1, Props. 5.2, 5.4, 5.6, 5.7, Lemma 5.8, Prop. 5.9; §6 with Props. 6.1–6.2; §7.
- Library declarations opened at the pin: 16 (among them `cohomologicalDimensionAt` `ContCohomology/CohomologicalDimension/Basic.lean` 146, `absoluteGaloisGroupProP` `AbsoluteGaloisGroup/ProP.lean` 28, `upperRamificationGroup` `Herbrand/Basic.lean` 421, `RamificationIndexDomain` `RamificationGroup.lean` 86, `artinMap_congr` `Local/ArtinMap.lean` 397, the pointed Serre theorem `Free/Pointed/Serre.lean` 98, `map_proPKernel_eq` `MaximalProP.lean` 206, `isTopologicallyFinitelyGenerated_absoluteGaloisGroupProP` `ProP/Rank.lean` 51, `cohomologicalDimensionAt_absoluteGaloisGroupProP_le_one_of_not_mu` `ProP/Free.lean` 100, `FinitePadicExtension` `AbsoluteRamificationIndex.lean` 64).
- Cross-roadmap citations resolved at main or at the open heads: FilteredLocalGaloisGroups 1.2–1.5, 2.1, 2.2, 2.4; FieldOfNorms 0.2, 0.6, 1.4, 2.2, 2.3, 3.3, 4.3, 4.4, worked examples; FunctionFieldArithmetic 3.1, 3.2, 4.3, 4.4; ClassFieldTheory Layer 7; RamificationOfCompleteDiscretelyValuedFields §§4a.1–4a.2; PadicExtensionFamilies 2.1–2.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3; GeometricTopology §4.12.1. All exist where cited.
- Dependency check: `depcheck: 171 roadmaps, 1991 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: three `sorry` warnings, nothing else. Elaborated types of the six declarations compared with the README: `[CharP 𝓀[K] p]`, `[CharP 𝓀[K'] p]` and `[Invertible (2 : R)]` are present; no binder lost; nothing changed.
- No change outside the roadmap folder. The roadmap is new (not on main), so there is no earlier README to compare layer by layer.
- Previous findings: R01 (annihilator criterion of 2.2) repaired at lines 347–354; R02 (sign of 1.6 (b)) repaired at lines 116–121, 291–292, 310–312, 677; R03 (Theorems A, A′ in Lean) repaired; R04 (finite Magnus levels) repaired at lines 148–152, 165, 1016–1019, 1072–1074. Previous C01–C05 and N02 are addressed; N01 stands.
- Wording: 14 passages set beside Abrashkin2010 (1.2, 1.4, 1.5, 1.6, 2.1, 2.5, 3.1, Prop. 2.7, 4.2, 4.3, 5.3, 6.3, the conventions on composition, the Lean docstring of Theorem A).

Overlap check: read FieldOfNorms, FilteredLocalGaloisGroups, LocalAnabelianGeometry, HigherLocalClassFieldTheory, FunctionFieldArithmetic, RamificationOfCompleteDiscretelyValuedFields, PadicExtensionFamilies, ProfiniteProPGroups; the finite Magnus levels are GeometricTopology §4.12.1's and are cited; the absolute upper filtration is ClassFieldTheory Layer 7's, copied in `Suggested.lean` under this roadmap's namespace only to state the headlines; cofinal systems inside `E(p)` are FieldOfNorms 4.4's and the variant in `K^sep` (9.2) is this roadmap's; nothing else shared.

Source independence: 14 passages compared with 1 source (Abrashkin2010), none shared beyond formulas and forced statements; largest share Abrashkin 2010, 45 of about 105 locators; contents compared with Abrashkin2010: independent at the level of layers (Layer 1 ↔ §1, 2 ↔ §4, 3 ↔ §§2 and 5, 4 ↔ §3, 5 ↔ §6, 6 ↔ §7: reordered and merged, 3.3 needing Theorem B). [Abrashkin 2000] (36 locators) and [Deligne 1984] could not be read.

Research link: the headline targets are Theorem A of Abrashkin (2010) and Theorems A′, B of Abrashkin (2000), the local analogue of the Grothendieck conjecture, with Deligne's (1984) truncated equivalence as input; they extend Mochizuki (1997). Rests on Abrashkin2010 pp. 2–3 and the README.

## Not verifiable

- [Abrashkin 2000] (Layers 7–9 and 11, the Summary's Theorem B, the formula for `F_{γ, −N}`, the source corrections on the special basis, on p. 152 and on the Corollary of §0): the publisher's page refuses access and no open copy was found.
- [Deligne 1984] (Layer 10, and Remark A.6.3 in 11.5): no open copy found. The filtration statement of 10.4 is the README's own argument from Deligne's 1.5.1, 1.5.4, 2.8 and 3.5 and was not checked against them.
- [Abrashkin 1998] (the proof targets of 7.3): the journal's page offers no readable text.
- [Lazard 1965], [Koch 1970], Serre's two books (0.2, 1.1): not opened; the statements cited are standard.

Automatic checks set aside as false positives: the scan for TeX syntax flagged two code spans that wrap across a line break (the Check on `𝒪_F/p` in Layer 10 and the transport formula in 11.3); both are inside backticks. The scan for dropped binders flagged `[Invertible (2 : R)]`, which is present in both elaborated types. The scan for unknown names flagged `GroupFiltration.herbrandPsi`, which is FilteredLocalGaloisGroups 1.4's proposed name, cited as such.

## Source issues

- **Error** in Abrashkin2010 at Theorem B and Remark a) of §4.2, printed pp. 26–27: the source says the two filtrations agree modulo `𝒥³` for all `v ≥ 0`, with `F₀ = D₀`; it should be for `v > 0`, since at `v = 0` Prop. 4.2 excludes `D₀`; affects a stated result.
- **Gap** in Abrashkin2010 at the deduction of Theorem B from Theorem B′, printed p. 27: the source takes `v₀ = inf S` and applies B′, which needs every `v > v₀` in `S`; it should take the infimum of the `w` with `[w, ∞) ⊆ S`; affects the proof.
- **Misprint** in Abrashkin2010 at §5.1, printed p. 36: the source sums the products in `ℱ_γ(v)`, `γ = ap^m`, over all `n ≥ 0`; it should be `0 ≤ n < m`, the terms with `n = m` being inside `Δ_{am}`; affects a stated result.
- **Misprint** in Abrashkin2010 at the definition of locally analytic systems, §3.6, printed p. 20: the source takes `η_s` in `Iso⁰(K, K')`; it should be `Iso⁰(K_s, K'_s)`, as the proof of Prop. 3.4 speaks of conjugates of `η_s` over `K`; affects a stated result.
- **Misprint** in Abrashkin2010 at the proof of Prop. 5.9, printed p. 41: the source normalizes by `η` with `η(t) = α_{110}(f)t`; it should be `η(t) = α_{110}(f)⁻¹t`, since Prop. 2.1 gives `α_{aa0}(η^*) = α^a` for `η(t) = αt`; affects the proof.
- **Misprint** in Abrashkin2010 at the proof of Lemma 4.4, printed pp. 28–29: the source's first congruence has exponent `qp^M` on `t₁`; it should be `q`, the case `s = 0` of the next display; affects nothing.
- **Misprint** in Abrashkin2010 before Prop. 6.1, printed p. 45: the source defines `μ_{LL'}` with the Frobenius of `t_{K'}`; it should be that of `t_{L'}`, as in the proof; affects nothing.

## For the human reviewers

- **Not tested.** [Abrashkin 2000] (36 of about 105 locators, Layers 7–9 and 11), [Deligne 1984] (Layer 10) and [Abrashkin 1998] could not be read legally: their locators, the wording and the arrangement against their contents were not checked.
- **Licence / sources.** The README corrects printed statements of [Abrashkin 2000] (special basis by the factors `a`, conventions line 122; the Corollary of §0 stated for `K, K' ∈ 𝒜_M`, 11.5; a sign on p. 152). These could not be checked against the text.
- **Scope.** The README declines Wintenberger's 1980 full faithfulness on `p`-adic Lie extensions as "not in print" (scope section, line 1030) and routes Layers 6 and 9 through FieldOfNorms 4.3 instead.
- **Arrangement inside layers.** Layer-level organisation differs from the sources', but 3.2, 3.3, 4.1–4.4 and 8.2 list the propositions of Abrashkin 2010 §§2, 5, 3 and Abrashkin 2000 §§4.2–4.12 one by one in the printed order.
