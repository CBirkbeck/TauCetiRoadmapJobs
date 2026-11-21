# Review of HigherLocalClassFieldTheory (pull request #1813 at 7d2ecd9)

**Verdict:** needs changes

**Summary.** Changes are needed: one finding. In mixed characteristic with `p = 2` the roadmap states reciprocity, existence and injectivity but, by its own account, has no route to them, because the bases of `K_n^top(F)/p` (2.7), the torsion statement of 2.9 and 5.4 rest on an explicit pairing that no layer and no supplier owns; part of that gap closes with material already in the text and its sources. The five findings of the previous review are repaired. There are four small corrections and two format notes, none blocking, two questions for the author, and two points for the human reviewers.

## R01 (P1) — At `p = 2` in mixed characteristic the headline theorems have no route: the input they need is owned by no layer and no supplier

The scope section says: "Everything after 2.9 in mixed characteristic (the norms of 2.10, Layers 3–4, 5.4–5.6) rests on them, so at `p = 2` it is stated but not routed" (Scope and ownership, lines 1087–1092). An implementer who reaches `ℚ_2{{t}}` therefore has targets (2.7, 2.9, 3.2(b) for `ℓ = 2`, 5.4, and through them 4.4, 5.5 and 5.6) and nothing to prove them from: the missing "2-adic explicit pairing of Vostokov type" is named as needed and is not a target. A roadmap plans the general case; a prerequisite with no owner is a hole in the plan, however honestly it is recorded. 5.4 adds to it: it cites a whole paper, with no section, and its `*Needs:*` line (2.4, 2.7, 4.5) gives no route.

The gap is narrower than the text says, and part of it closes with what the roadmap already has. I checked three things. (1) The first step of 2.9, `Λ_m(F) ⊆ pVK_m(F)`, uses only the graded quotients of 2.8, as in Fesenko 2000a, §6.6, proof of Theorem 3, case `r = 1` (its text, lines 321–328); Bloch and Kato's (5.1)–(5.3) hold for every `p` (they note that the hypothesis `p ≠ 2` of their reference is unnecessary, p. 126). So this step is routed at `p = 2` as written. (2) For the induction on `r`, Fesenko 2001, §4.7, "Remark to the proof" (author's copy, lines 576–582) gives a second route that does not use Vostokov's map: Kurihara's exponential map with Bloch and Kato's description of the graded pieces modulo `p^r`, "in the same way as in the case `r = 1`". (3) What then remains without an owner at `p = 2` is: the bases of 2.7, which the torsion part of 2.9 and 3.2(b) use; the identification `K_{n+1}(L)/p^r ≅ μ_{p^r}`; and 5.4.

The smallest repair gives each of these an owner. Either add the 2-adic pairing as a target of Layer 2 with a source that states it, or route them without a pairing: for 2.7, the first step of 2.9 gives `VK_n(F)/p = VK_n^top(F)/p` (Fesenko 2001, §4.7, line 495), and 2.8 then describes its graded pieces for every `p`, so the bases at `p = 2` would be a target "from 2.8" with its own `*Needs:*` line; for the induction, cite the Remark's route and add Kurihara's exponential map as a target or a supplier contract. Give 5.4 its section in Fesenko 1991a and its inputs, or derive it in 5.5 from what precedes. Then replace the "Known gap" paragraph by the route.

## C01 — In 3.1 and 4.1 the reason given covers `VK_n^top` only, and by 2.3 the kernel of `v_F` is larger

3.1 says "Every element of `VK_n^top(F)` is a norm from `VK_n^top(F_d)`, so the norm group is the preimage of `dℤ` under `v_F`" (line 708), and 4.1 gives the same inclusion as the reason that `Υ_{L/F}(σ)` does not depend on `Π_Σ` (line 800). Two prime elements differ by an element of `ker v_Σ`, and 2.3 says this kernel is `VK_n^top ⊕ (ℤ/(q − 1))^n`; for `q > 2` the symbol `{θ, t_2, …, t_n}` is in it and not in `VK_n^top`. The conclusions are true: `θ ∈ μ_{q−1}` is the norm of some `θ' ∈ μ_{q^d−1}`, and `{θ, t_J} = N_{F_d/F}{θ', t_J}` by the projection formula. Add that sentence in both places. The slip is the source's (see Source issues).

## C02 — 3.2(b) cites Fesenko 2001, §4.8 for every cyclic extension, and that section states the exactness for prime degree only

"For every cyclic `L/F`, (A4a) … is exact [§6.8.3, Corollary; Fesenko 2001, §4.8]" (lines 732–735). The Invitation's Corollary is for every cyclic `L/F` (its text, line 472); Fesenko 2001 says "for every cyclic extension `L/F` of prime degree" (author's copy, lines 657–661). Cite the second for prime degree only. The first question below is about the composite case.

## C03 — 2.9 points to "the third bullet of 2.3" for the inclusion `⋂ lK_m(F) ⊆ Λ_m(F)`; it is the fourth

The third bullet of 2.3 is "Away from `p`"; the inclusion is the bullet "Divisible elements are in `Λ`" (line 408). Name the bullet by its title.

## C04 — In 2.7 the mixed-characteristic basis does not say whether `{t_1, …, t_n}` belongs to it

For characteristic `p` the text adds "together with `{t_1, …, t_n}`"; for mixed characteristic it says "the same symbols with `0 < 𝐢 < p𝐞/(p − 1)` … together with the symbols `ω_*(j)`" (lines 522–523), which can be read either way. All the listed symbols lie in `VK_n^top(F)`, and `v_F : K_n^top(F)/p → ℤ/p` is onto, so `{t_1, …, t_n}` is needed there too (the source omits it in both cases). Say so explicitly.

## N01 — The `*Needs:*` line of 2.6 omits 2.3

Nondegeneracy of `V(·,·)_r` on the side of `K_n^top(F)/p^r` is proved on the topological generators of 2.3.

## N02 — 5.4 cites [Fesenko 1991a] with no section or theorem number

A reader cannot find the statement; every other target has a locator inside its source.

## Questions for the author

- 3.2(b), and (A3c) for `F_d` with `d` composite: how does exactness of `K_n^top(L) →(1−σ) K_n^top(L) →(N) K_n^top(F)` for a cyclic extension of composite degree follow "along a tower of prime-degree steps"? For a tower `F ⊂ M ⊂ L`, `N_{L/F}x = 0` gives `N_{L/M}x = (1 − σ)y` with `y ∈ K_n^top(M)`, and I do not see why `y` is a norm from `L` without a descent statement of type (A3b), which fails in mixed characteristic. The Invitation states the Corollary without proof, so I could not check it.
- 5.4: which statement of Fesenko 1991a gives that every open subgroup of index `2` is an annihilator under `(·,·)_2`, and for which `n`? The paper is behind a paywall.

## Verified sound

Earlier findings (previous review at ec903fa). R01, the cycle in mixed characteristic: repaired, "defined by the residue formula" in 2.5 and 2.6, 2.9 before 2.10, and 3.2 "*Needs:* 0.3, 2.3, 2.7, 2.9–2.10, 3.1"; the `p = 2` case is R01 above. R02: repaired, "the value at length `r` is computed on these lifts and not through ghost components in `F`". R03: repaired, "the open subgroups of finite index of `K_n^top(F)` containing `p^rK_n^top(F)`", with the negative control as a Check. R04: repaired, "it is a subfield exactly when `char F = p`". R05: repaired, 0.5 now cites Serre II §2, Proposition 3 and `spectralNorm_unique` and the supplier is dropped. C01–C07: repaired (the description matches the head; "principal units `α_i ∈ V_F`"; "For every cyclic `L/F`", see C02; "for every finite abelian `L/F`"; "For `ℓ ≠ p`"; `exists_openSubgroup_artinMap_mem_iff`; the sign `ε` is now determined by the target). N01: partly, see N02. N02: repaired, "target signatures".

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| 0.2 `K{{t}}`, `K((X))` | `∑ p^i t^{−i}`; `∑ t^{−i}`; `ℚ_p{{t}}` | `v(a_{−i}) = i → ∞`: in `ℚ_p{{t}}`, not `ℚ_p((t))`; `v = 0`: in neither; residue field `𝔽_p((t̄))`; zhukov2000 40–52 | agrees |
| 0.4 classification | `ℚ_p{{t}}`; `X_1 ↦ X_1 + X_2` | standard with `m = 1`; residue of `X_1 + X_2` in `K_1` is `X_1`, so again parameters; zhukov2000 64–89, 205–256 | agrees |
| 0.5 finite extensions | `𝔽_p((t₁))(t₁^{1/ℓ})((t₂))`, `ℓ = p` too | `e_1 = ℓ`, `e_2 = f = 1`, product `ℓ = [L:F]`; inseparable for `ℓ = p`; zhukov2000 138–161 | agrees; Serre not read |
| 0.6 purely unramified | `ℓ ∣ q−1`; `ℓ ∤ q` | degree `1`; order of `q` mod `ℓ`; `Frob ↦ 1 ∈ Ẑ`; fesenko2000explicit 20–25 | agrees |
| 1.1 higher topology | `t_1^k` on `𝔽_p((t₁))((t₂))`; `ℚ_p((X))` with derivation `D` | coefficientwise `→ 0`, `v(t_1^k) = 0`; `e_k = σ(e_k) − σ(De_k)X − …`, `X`-coefficient `−D(e_k) ↛ 0`; zhukov2000 181–200, 278–295 | agrees |
| 2.1 definition | `n = 1`, `m = 3`; map to discrete group | `K_3` uniquely divisible, `K_3^top = 0` since `3 ≥ n+2`; coset topology of kernel satisfies both conditions, so kernel `λ_m`-open | agrees (§6 text 124–149) |
| 2.3 structure | `n = m = 2`, `ℓ ∣ q−1`; `ℓ ∤ q(q−1)`; `m = n+2` | `a = 1`, `b = 2`: `(ℤ/ℓ)^3`; `d = 1`: `ℤ/ℓ`; `a = b = 0`, no `(m−1)`-subsets: `0` | agrees |
| 2.4 separation | `n = 1`; `ℓ^rK_n^top`, `ℓ ≠ p` | open finite-index subgroups of `Fˣ` meet in `1`; contains `VK_n^top`, so cannot separate it | agrees (§6 text 263–278; Fesenko 2001 405–444) |
| 2.5 Parshin's pairing | `(t_1^{−1},{1−t_1,t_2})`; `(t_1^{−1}t_2^{−1},{t_1,t_2})`; triangular value; `V[a]` | `det = −1`, residue `−1`; coefficient of `t_1^{−2}t_2^{−2}`: `0`; `(−1)^{l−1}Tr θ_0`; `Tr(p[a]) = p·Tr a ≠ 0` in `ℤ/p²` | agrees; source drops the sign |
| 2.6 Vostokov's map | `V({t_1..t_n}, t_i)`; hypotheses | symbol is `±{…,−1,…}`, 2-torsion, `p` odd: `1`; `p > 2`, `ζ_{p^r} ∈ F`, basis and `θ'` as vostokov2000 181–253 | agrees |
| 2.7 bases of `K_n^top/p` | `{1−t_1,t_2}`; `v_F` mod `p` | `P_1 = −1 ≠ 0`; listed symbols all in `VK`, `v_F` onto `ℤ/p`: `{t_1..t_n}` needed | C04; `p = 2`: R01 |
| 2.8 graded quotients | `n=1,q=1`; `ℚ_p{{t}}`, `m=1`; `ℚ_p(μ_{p²}){{t}}`, `m=p` | `gr^m ≅ k` or `0`; `1+aC` kernel ≤ `p`; `e' = p/(p−1) ∉ ℤ`, `Ω^1 = k·dt`; `e' = p²`, `k/k^p ≠ 0` | agrees with (4.3), (4.7), (5.1)–(5.3), pp. 122–126 |
| 2.9 Fesenko's theorem | `n = 1`; `p^r`-torsion from prime case; `p = 2` | `Λ_1 = 1`, torsion `μ_{p^r}`; `p^{r−1}(x − {ζ_{p^r}}y) = 0`, induct; first step uses 2.8 only | agrees for `p > 2`; R01 |
| 2.10 norms | `F_d/F`; `K_0` level | `v_F∘N = d·v`; norm on `K_0 = ℤ` is multiplication by `f`; three cases as §6 text 412–433 | agrees |
| 3.1 purely unramified | `{t_1..t_n}`; `{θ,t_2..t_n}`; `k{{t}}`, `ω` primary | generates `ℤ/d`; in `ker v`, not in `VK`, norm of `{θ',…}`; `{ω,π} ∉ pK_2^top(F)`, dies in `F(ω^{1/p})` | statements agree; C01 |
| 3.2 cyclic prime degree | `y^p − y = t_1^{−1}`; `f = 1`, `ℓ ≠ p` | `{1−t_1,t_2}` pairs to `−1`, `{t_1,t_2}` to `0`; forces `ℓ ∣ q−1`, generator `{θ_*,…}` | agrees; C02 |
| 3.4 prime-to-`p` axioms | `K'_n/ℓ`, `K'_n/p` | `K'_n = ℤ ⊕ (ℤ/(q−1))^n`: `/ℓ = K_n^top/ℓ`, `/p = ℤ/p`; `⋂ lK' = 0`; fesenko2000explicit 81–85 | agrees |
| 4.1 Neukirch–Fesenko map | `σ̃ = Frob`; `σ̃ = Frob^{1+d}` | `Σ = F`: `{t}`; `Σ = F_{1+d}`: `(1+d){t} ≡ {t}` mod `v^{−1}(dℤ)` | agrees; C01 |
| 4.4 finite level | `F(μ_3, t_1^{1/3})`, `q ≡ 2 mod 3`; Sylow step | `p ≠ 3`, group `S_3`, abelianization `ℤ/2`, index `2`; `N∘i = [L_ℓ:F]` prime to `ℓ` | agrees |
| 4.5 absolute map | image in `Gal(F^pur/F)` | `Frob^{v(α)}`, `v(α) ∈ ℤ`: misses `Ẑ ∖ ℤ`; dense image, fesenko2000explicit 161–163 | agrees |
| 4.6 normalization | `{t_1..t_n}`; `{t_2,t_1}` | `Frob`; `v = −1`: `Frob^{−1}`; fixes `F_d` iff `d ∣ 1`; Theorem 3, fesenko2000explicit 170–176 | agrees |
| 4.7 dimension one | `r(π)` on `LF_d`, `[L:F] ∣ d` | order `lcm = d`; `M ∩ F_d = F`; `[MF_d:M] = d` so `MF_d = LF_d`; `r'(π)` trivial on `M`, `Frob` on `F_d` | sound |
| 5.1 tame pairing | `(u,{t,p})`; `(t,{t,p})`; `(u,π)` | `∂∂{u,t,p} = ū`, power `(p−1)/ℓ = Frob(u^{1/ℓ})/u^{1/ℓ}`; `{t,t,p} = {−1,t,p}`: `(−1)^{(p−1)/ℓ}` both ways; `ū^{(q−1)/ℓ}` | agrees |
| 5.2 Parshin's formula | `a ∈ 𝔽_q`; `t_1^kt_2^{−1}` on `{1+t_2t_1^{−k'},t_2}` | `v(α)Tr a = Frob^v(y) − y`; `−k t_1^{k−k'−1}t_2^{−1}(1−…)`: `−k` if `k = k'`, else `0` | agrees |
| 5.4 index two, `p = 2` | `n = 1` | nondegeneracy of the quadratic Hilbert symbol; for `n ≥ 2` equivalent to existence at index `2` | not verified; R01, N02 |
| 5.5 existence | `ℓ ∤ q(q−1)`; `ℓ ∣ q−1`; `μ_p ⊄ F` | one subgroup of index `ℓ`; both sides of order `ℓ^{n+1}`; `N_{F'/F}` onto `ℤ/p` since `[F':F]` prime to `p` | agrees for `p > 2` |
| 5.6 injectivity | kernel chain | `ker Ψ = ⋂` norm groups `= ⋂` open of finite index `= 0` by 2.4 | agrees |
| `IsHigherLocalField`, `existsUnique_residue_valuativeRel` | `n = 0`; trivial relation on `ℚ_p`; `n ≥ 1` | finite field: one valuative relation; `IsNontrivial` fails; two rank-one henselian valuations force separably closed, but `F_2 ≠ F` | sound |
| `isHigherLocalField_one_iff` | `ℚ_p`, `𝔽_p⸨X⸩` | discrete, nontrivial, rank one, complete, finite residue field ⇔ valuative topology, locally compact, nontrivial (the three fields of the class) | sound |
| `isHigherLocalField_laurentField` | `K = 𝔽_q`; `K = ℚ_p` | `X`-adic relation discrete, rank one, complete, residue field `K`: dimensions `1`, `2` | sound |
| Headlines (reciprocity, Frobenius, dimension one, existence, injectivity, `Λ = ⋂ lK`) | statable at the pins? | each mentions `K_n^top(F)`; no Milnor K-theory in pinned Mathlib or Tau Ceti; the module docstring names each | correctly not stated |

- Source locators checked against the text: 75, in seven texts (zhukov2000, Fesenko 2000a, fesenko2000parshin, vostokov2000, fesenko2000explicit, Fesenko 2001 from its author's page, Bloch–Kato 1986 from Numdam).
- Library declarations opened at the pins: 15 (`IsNonarchimedeanLocalField`, `Mathlib/NumberTheory/LocalField/Basic.lean:46`; `Valued.mk'`, `ValuationTopology.lean:134`; `spectralNorm_unique`, `SpectralNorm.lean:699`; `Field.absoluteGaloisGroupAbelianization`, `AbsoluteGaloisGroup.lean:101`; `LaurentSeries.derivative`, `LaurentSeries.lean:177`; `artinMap`, `Local/ArtinMap.lean:114`; `denseRange_artinMap`, `:188`; `exists_openSubgroup_artinMap_mem_iff`, `:221`; `continuous_artinMap`, `:248`; `classField`, `ClassField.lean:84`; `isArithFrobeniusLift_of_mk_eq_artinMap_uniformizer`, `Local/Unramified.lean:464`; `localAbelianExistence`, `LocalExistence/Existence.lean:159`; `injective_artinMap`, `LocalExistence/ArtinMap.lean:113`; `zHat`, `ZHat/Basic.lean:66`; `kummerMap`, `GaloisCohomology/Kummer.lean:250`).
- Cross-roadmap citations resolved: 18 (K2SymbolsBrauer §§5.4, 9.11, 9.16, 9.17, 10.24, 10.26; KTheoryFiniteLocalFields §§3.0, 3.0a; ProfiniteCohomology Layers 10, 12; ClassFieldTheory Layers 7, 8 and C.6; FormalLaurentPuiseux L2, L3, all on main; FunctionFieldArithmetic §§3.1, 4.2, 4.3 at its open head, with the convention `[℘y, b) = Art(b)(y) − y`).
- Dependency check: `depcheck: 172 roadmaps, 2002 edges, 0 problem(s)`; no UPWARD or CYCLE line. FunctionFieldArithmetic, the one supplier not on main, is a new roadmap one place earlier in the merge order.
- Automatic checks: all passed on this head. No change outside the roadmap folder.
- Elaboration of `Suggested.lean` under the defaults: three `sorry` warnings and nothing else. The five elaborated types were compared with the README: none lost a binder, nothing changed.
- One-tactic probe on the three sorried theorems (`simp`, `rfl`, `infer_instance`, `simp [IsHigherLocalField]`, `exact?`): none closes. No padding.
- Overlap check: read FunctionFieldArithmetic, KTheoryFiniteLocalFields, ClassFieldTheory, LocalAnabelianGeometryPartII, LocalFieldsRamificationPartII (main has no LocalFieldsRamification folder); nothing shared. LocalAnabelianGeometryPartII excludes higher-dimensional local fields; KTheoryFiniteLocalFields cites the Invitation's §§6.0–6.1 only, for the algebraic groups; Milnor K-theory stays with K2SymbolsBrauer and the one-dimensional Schmid–Witt symbol with FunctionFieldArithmetic §4.3. No declaration of `Suggested.lean` shares its name with one in another roadmap or in the pinned libraries.

Source independence: 14 passages compared with 6 sources, none shared beyond what the mathematics forces (longest common run about 8 words, the definition of an Artin–Schreier tree, fesenko2000explicit line 109); largest share Fesenko 2000a, about 23 of 105 citations; contents compared with it: independent (its subsections 6.2–6.8 are spread over 1.3, 2.1–2.7, 2.9, 2.10, 3.2 and 5.1 in another order, with Bloch–Kato between them).

Research link: Layers 3–5 are the explicit higher local class field theory of Fesenko (1991, 2000, 2001) for the reciprocity map of Parshin (1984) and Kato (1979–82), with Vostokov's (1985) formula and Bloch–Kato (1986); it rests on the README's references and on the seven texts read.

## Not verifiable

- Fesenko 1991a and 1991b (3.1–3.3, 5.4): behind a paywall; checked only where the Invitation quotes them (Propositions 4.1 and 3.1, Theorem 3.3, pp. 1118–1119). 5.4, a sampled target, has no locator inside the paper and could not be checked.
- Parshin 1984, Vostokov 1985, Kato 1980 §1 Theorem 2: not read; the first two through the Invitation and Fesenko 2001, the third through Bloch and Kato's citation of it.
- Serre, *Local Fields*, II §2 Proposition 3 and XIV (0.5, Conventions): not read; no open copy.
- The base at `1` for `n = 2` in the Check of 1.2: the extraction does not distinguish the rank-one and rank-two rings in zhukov2000 line 437; either reading gives a base.

## Source issues

- **Error** in zhukov2000 at §1.1, printed page 6 (lines 62–63): the source says the Teichmüller representatives form a field isomorphic to `K_0` whenever the first residue field has characteristic `p`; it should be a field only when `char K = p`, a multiplicative set otherwise; affects a stated result.
- **Misprint** in zhukov2000 at §1.4.2, Property (3), printed page 15 (lines 480–484): the source says the multiplicative group is not a topological group when `m ≥ 3`; it should be `n ≥ 3`, as its proof and Remark 1 use; affects nothing.
- **Gap** in Fesenko 2000a (Invitation, Part I, section 6) at §6.4.3, printed page 66 (line 203 of its text): the source says the length-`r` value is given by ghost components computed in characteristic `p`; it should be computed on lifts to characteristic zero; affects a stated result; corrected in print at Fesenko 2001, §3.1.
- **Misprint** in Fesenko 2000a at §6.4.3, property (3), printed page 66 (lines 213–215): the source says the pairing of the `l`-th generator with its dual monomial is `1`; it should be `(−1)^{l−1}`, from moving `dt_l/t_l` into place; affects nothing.
- **Error** in Fesenko 2000a at §6.7.2, printed page 71 (lines 383–407): the source says the listed symbols are a topological basis of `K_n^top(F)/p`; it should add `{t_1, …, t_n}`, the listed symbols spanning only `VK_n^top(F)/p`; affects a stated result.
- **Error** in fesenko2000explicit at §10.1, printed page 96 (line 37): the source says the kernel of the valuation map is `VK_n^top(F)`; it should be `VK_n^top(F) ⊕ (ℤ/(q − 1))^n`, by §6.5 and §7.1; affects the proof.
- **Misprint** in fesenko2000explicit at §10.3.2, printed page 97 (lines 87–88): the source says all axioms hold when `μ_p ⊂ F` and (A3b) fails otherwise; it should be the reverse, as the example that follows shows; affects nothing.
- **Misprint** in fesenko2000explicit at §10.4.1, Definition, printed page 98 (line 113): the source says `E = M(α)` with `α^p − α ∈ M`; it should be `M = E(α)` with `α^p − α ∈ E`; affects nothing.
- **Misprint** in fesenko2000explicit at §10.5, Corollary 1, printed page 100 (line 197): the source says the injective map has target `Gal(L/F)`; it should be `Gal(F^ab/F)`; affects nothing.

## For the human reviewers

- Name: K2SymbolsBrauer (README line 3403) and CrystallineCohomology (line 11538) on main name a consumer `HigherLocalFieldsAndHigherClassFieldTheory`; this folder is `HigherLocalClassFieldTheory`. Whether the names are aligned is yours to decide.
- Sources: the README cites thirteen works and four are recorded for it (Invitation sections 1, 7, 8, 10). Section 6 (cited most), Fesenko 2001 (author's page) and Bloch–Kato 1986 (Numdam) were read and are unrecorded; Fesenko 1991a, 1991b and Serre were not read.
