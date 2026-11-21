# Review of HigherLocalClassFieldTheory (pull request #1813 at ec903fa)

**Verdict:** needs changes

**Summary.** Changes are needed: five findings, all P2. The build order has a cycle in mixed characteristic (Layers 2–3 use the `p`-torsion of `K_n^top`, `Λ = ⋂ lK` and the explicit pairings, which the text places behind the reciprocity map); two sentences of 5.2 are false as written (the length-`r` formula through ghost components, and the annihilator statement without "finite index"); 0.3 calls the Teichmüller representatives a field in mixed characteristic; and 0.5 cites a supplier section that treats Galois extensions only. There are seven small corrections and two format notes, none blocking. All twelve findings of the previous review are repaired, one of them partly; two questions and two points for the human reviewers are at the end.

## R01 (P2) — In mixed characteristic Layers 2 and 3 use results that the text builds only after the reciprocity map, so the `*Needs:*` lines hide a cycle

An implementer who reaches 3.2(b) for `ℓ = p` in mixed characteristic cannot prove it from "*Needs:* 0.3, 2.4–2.5" (line 588). The integral exactness `K_n^top(L) →(1−σ) K_n^top(L) →(N) K_n^top(F)` is the Corollary of §6.8.3, which the source derives from Theorem 4 "together with the description of the torsion" of §6.6 (Fesenko 2000a text, line 471). I checked the step: if `Nx = 0`, Theorem 4 gives `x = i(a) + (1−σ)y + ℓz`, hence `ℓ(a + Nz) = 0`, and one needs that the `ℓ`-torsion of `K_n^top(F)` is `{ζ_ℓ}·K_{n−1}^top(F)` to conclude. For `ℓ = p` in mixed characteristic that statement is 5.4a. But 5.4a needs 5.3, the `*Needs:*` line of 5.3 has 4.5, and 4.5 ← 4.4 ← 4.3 ← 3.1–3.2. The same happens twice more. Theorem 4 is proved from the bases of `K_n^top(F)/p` of §6.7.2, which the source obtains from the Artin–Schreier pairing in characteristic `p` and from Vostokov's symbol in characteristic `0` (same text, lines 383 and 389); 2.4 states these bases with "*Needs:* 2.1–2.3, 0.3; K2SymbolsBrauer §9.17". And 2.5 asserts that Kato's norm "maps `Λ_n(L)` into `Λ_n(F)`" with no route; the one-line route through `Λ = ⋂ lK` is 5.4a in mixed characteristic, and its closed/open statement is Corollary 2 of §6.8.2, proved from the Proposition that 3.2(c) states and from 2.6 (line 463).

The pairings themselves do not need the reciprocity map: Parshin's and Vostokov's are defined by residue formulas (vostokov2000 line 193 says so explicitly). The smallest repair is to split 5.2 and 5.3 each into two targets: the map defined by the formula, with well-definedness, the symbol property, sequential continuity and its values on the generators (needing Layers 0–1, 2.1 and the suppliers, not 4.5), and its identification with the pairing of the Conventions (needing 4.5). Then 2.4, 2.5, 3.2 and 5.4a name the first halves in their `*Needs:*` lines, 3.2 names the torsion statement of 5.4a, and the first halves and 5.4a stand before their first use. If another route is meant for any of the three places, name its inputs there.

## R02 (P2) — The length-`r` form of Parshin's formula in 5.2 does not determine the value: in characteristic `p` a Witt vector is not determined by its ghost components

In 5.2 (line 807): "At length `r` the ghost components are given by the same residue of `w^{(i)} dlog b_1 ∧ ⋯ ∧ dlog b_n`". In characteristic `p` the `i`-th ghost component of `(w_0, …, w_{r−1})` is `w_0^{p^i}`, so the recipe sees only `w_0`: for `w = V(w')` every ghost component is `0`, while `[Vw', α)_r = V[w', α)_{r−1}` is not zero in general (property (1) of §6.4.3). The source has the same shortcut (see Source issues). The correct statement computes on lifts to characteristic zero, as FunctionFieldArithmetic §4.3 does for `n = 1`: `[x, y) = Tr_{W(k)/ℤ_p} Res(x̃ · dlog ỹ)` with `x̃`, `ỹ` lifts with Teichmüller coefficients in the `p`-adic completion of `W(k)((T))`. State the `n`-variable formula the same way: lift `w` and the `b_i` to the iterated Laurent ring over `W(𝔽_q)`, take the iterated residue of `w̃ · dlog b̃_1 ∧ ⋯ ∧ dlog b̃_n` in `W_r(𝔽_q)`, then the trace to `ℤ/p^r`; the partial derivatives and the iterated residue of the two bullets are then needed over `W_r(𝔽_q)` and not only over `𝔽_q`.

## R03 (P2) — The annihilator statement of 5.2 is false for `n ≥ 2` without "of finite index"

In 5.2 (lines 821–823): "the annihilators of finite subgroups of `W_r(F)/℘` are exactly the open subgroups of `K_n^top(F)` containing `p^rK_n^top(F)`". An annihilator of a finite subgroup has finite index, so the sentence implies that every open subgroup containing `p^rK_n^top(F)` has finite index. On `F = 𝔽_p((t₁))((t₂))` let `H` be the annihilator under `[·,·)_1` of all `t_1^k t_2^{−1}`, `k ≥ 1`. It contains `pK_2^top(F)`. It is open: if `a_j → a` and `b_j → b` in `Fˣ`, then `{a_j, b_j} − {a, b} = {a_j/a, b_j} + {a, b_j/b}` and both `dlog` forms tend to `0`, so the `t_2^0`-coefficients of their densities lie in `𝔽_p[[t_1]]` for large `j` and all the residues against `t_1^k t_2^{−1}` vanish at once; so the symbol map is sequentially continuous for the topology of cosets of `H`. It has infinite index: the value of `t_1^k t_2^{−1}` on `{1 + t_2 t_1^{−k'}, t_2}`, a member of the basis of 2.4 for `p ∤ k'`, is `−k` if `k = k'` and `0` otherwise, so the functionals with `p ∤ k` are independent. The Check of 2.4 already says `K_n^top(F)/p` is not finitely generated. 5.3 has the right form ("Every open subgroup of finite index of `K_n^top(F)` containing `p^rK_n^top(F)`"), and 5.5 uses only that form. Insert "of finite index" in 5.2.

## R04 (P2) — In mixed characteristic the Teichmüller representatives are not a field

In 0.3 (line 165): "When `char K_{n−1} = p` the Teichmüller representatives form a field `R ≅ K_0` inside `𝒪_F`". For `F = ℚ_p`, `R = {0} ∪ μ_{p−1}` and `1 + 1 = 2 ∉ R`. The sentence follows a slip of the source (zhukov2000 line 63); the same chapter later calls `W(K_0)` "the subring generated by the set `R`" in characteristic `0` (line 434–435). An implementer who builds `R` as a subfield of `F` has nothing to build when `char F = 0`. The text only ever uses `R` as a set of representatives and `Rˣ` as a group, so the repair is one sentence: `R` is the set of multiplicative representatives of `K_0`, closed under multiplication, with `Rˣ = μ_{q−1}(F) ≅ K_0ˣ`; it is a subfield exactly when `char F = p`.

## R05 (P2) — 0.5 cites RamificationOfCompleteDiscretelyValuedFields §3a.1 for every finite extension, and that section treats finite Galois extensions

0.5 and the supplier contract (lines 221, 1006–1008) take from §3a.1 that "for a finite extension `L` of a complete discretely valued field `K`, the integral closure of the valuation ring is a complete discrete valuation ring, free of finite rank, and the valuation of `K` prolongs uniquely". The supplier's Conventions fix "`L/K` is a finite Galois extension with group `G`" (its README line 83), and the proof in §3a.1 says `B` is "finite over `A` because `L/K` is separable" (line 214). 0.5 needs inseparable extensions: `𝔽_p((t₁))(t₁^{1/p})((t₂))` is the case `ℓ = p` of its own Check, and the residue extensions in the induction can be inseparable. A separable non-Galois extension follows from §3a.1 through a Galois closure; the inseparable case has no owner. Either state the general finite case as a target of 0.5 (uniqueness of the prolongation over a complete field is Mathlib's `spectralNorm_unique`, `Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:699`; finiteness of the integral closure over a complete discrete valuation ring is then the part to prove), or narrow the contract to what §3a.1 states and add the inseparable case here.

## C01 — The pull request's description describes an earlier head

Five statements no longer hold. "`K_n^top(F)` is defined as `K_n(F)/⋂ l K_n(F)` … Fesenko's sequential definition is the theorem `sequentialKernel_eq`": the head defines `K_m^top(F) = K_m(F)/Λ_m(F)` in 2.1 and proves the identification in 2.2 and 5.4a; no such declaration exists. "`Suggested.lean` restates its §5.4 `MilnorK` carrier verbatim … and states Kato's norm as a `sorry`": the head's file has five declarations, all of Layer 0, and no Milnor K-theory. The "Dependencies" list omits three suppliers the head has (RamificationOfCompleteDiscretelyValuedFields §3a.1, KTheoryFiniteLocalFields §§3.0 and 3.0a, ProfiniteCohomology Layers 10 and 12) and names K2SymbolsBrauer by a pull-request number although it is on main. "Layer 3: the class field axiom. Hilbert 90 and norm images" leaves out (A4), 3.3 and 3.4, and the Layer 4 line leaves out the Artin–Schreier trees of 4.3. "Statements I could not check against sources … cited at paper or chapter level" is out of date for the Invitation, now cited by subsection. The text that would be right lists the layers as the head's summary does, the eight suppliers of the head's contracts, and says that `Suggested.lean` states Layer 0 only and why.

## C02 — Property (3) of 1.3 holds for principal units, not for "every sequence of units"

In 1.3 (line 318): "`α_i^{p^i} → 1` for every sequence of units". For the constant sequence `α_i = θ`, a generator of `Rˣ` with `q > 2`, `θ^{p^i}` never equals `1` and `Rˣ` is discrete. The source applies the property to `V_F` (Fesenko 2000a text, lines 112 and 253–256). Write "of principal units (elements of `V_F`)".

## C03 — (A3c) for `F_d` with `d` composite is not a case of 3.2(b) as 3.2 is stated

3.1 (line 547) says "(A3c) is the case `L = F_d` of 3.2(b)", but 3.2 opens with "Let `L/F` be cyclic of prime degree `ℓ`". The source's Corollary in §6.8.3 is for every cyclic `L/F` (Fesenko 2000a text, line 472). State the integral sequence of 3.2(b) for every cyclic extension, as the source does, or say in 3.1 how composite `d` follows.

## C04 — 4.5 does not say which `L` and which lifts it quantifies over

"for a lift `σ` of `Ψ_F(α)`, `α ∈ N_{L/F}K_n^top(L)` exactly when `σ` is trivial on `L`" (line 724) is true for finite abelian `L`. For the `S_3`-extension of the Check of 4.4, an `α` in the norm group has lifts that act on `L` by any element of `A_3`. Say "for every finite abelian `L/F`", or "some lift" for Galois `L`.

## C05 — The first Check of 5.5 needs `ℓ ≠ p`

"`ℓ^rK_n^top(F)` is the norm group of the maximal abelian extension of exponent `ℓ^r`" (line 929): in 5.5 `ℓ` may be `p`, and then `p^rK_n^top(F)` has infinite index (Check of 2.4) and that extension is infinite, outside the bijection the section states. Add "for `ℓ ≠ p`".

## C06 — 4.7 cites `exists_artinMap_mem_iff` for a statement that declaration does not make

4.7 uses, for a given finite abelian `L`, that `artinMap F x` is trivial on `L` exactly when `x` is a norm from `L`. At the pin `exists_artinMap_mem_iff` (`TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:205`) starts from an open subgroup `U` of `G_F^ab` and produces some open normal `V`. The statement that starts from the extension is `exists_openSubgroup_artinMap_mem_iff` (same file, line 221), whose `U` the docstring identifies as the kernel of `G_F^ab → Gal(classField/F)^ab`. Cite that one, and say that the uniqueness argument needs `U` to be this kernel.

## C07 — "depending only on `n`" in 5.3 is not in the cited Remark, and the sign is still not computed

5.3 (line 847) attributes to [Vostokov 2000, §8.3, Remark] a sign "`ε ∈ {±1}` depending only on `n`". The Remark says only that the two symbols agree up to a sign (vostokov2000 lines 261–263). Drop "depending only on `n`" or make it part of the target. A two-term witness would pin it, as 5.1 and 5.2 do: `V({t_1, …, t_n}, ω)_r = ζ_{p^r}` against `Frob_F(ω^{1/p^r})/ω^{1/p^r}`.

## N01 — "cited to [Fesenko 2001, Theorem 4.7] at paper level" (5.4a, line 893) is a remark about the state of the text, and four results carry a citation of a whole paper

4.2 and 4.4 ([Fesenko 1991a], [Fesenko 1991b]), 5.4 ([Fesenko 1991a]) and the `p = 2` step of 5.4a have no section or theorem number, so a reader cannot find the statement. Give the section, and drop "at paper level".

## N02 — The module docstring of `Suggested.lean` is titled "suggested signatures" and calls the file "suggested forms, not an exhaustive checklist"

The house form is "<title>: target signatures", with the sentence that the roadmap is `README.md` and the file states its headline theorems against the pinned libraries. The list of headlines that are not statable is there and is right.

## Questions for the author

- 5.4a at `p = 2`: which explicit pairing replaces Vostokov's (defined for `p > 2` only, Fesenko 2000a text line 217) in the induction step, and is it a target of this roadmap? The torsion statement at `p = 2` is used by 3.2(b). I could not read Fesenko 2001: no legal copy was found.
- 5.4: which statement of Fesenko 1991a gives that every open subgroup of index `2` is an annihilator under `(·,·)_2`, and does it hold for every `n`? The paper is behind a paywall.
- 2.5: is `N_{L/F}Λ_n(L) ⊆ Λ_n(F)` meant to be proved before 5.4a in mixed characteristic, and how? I found no route other than `Λ = ⋂ lK`.

## Verified sound

Earlier findings (previous review at 4da4065): R01 sorried definitions: repaired, the file has two definitions with bodies and three sorried theorems. R02 route to reciprocity: repaired ("this layer proves (A3) and (A4)", 3.3, 3.4, 4.3), with the new ordering point R01 above. R03 restated Milnor K-theory: repaired. R04 canonicity: repaired ("From here on `F` satisfies the class field hypothesis", negative control in 1.1). R05: repaired ("For `n ≥ 2` and `char K_{n−1} = p`"). R06: partly, 5.3 is "for `p > 2`" and 5.4 covers index two; the sign is not computed (C07). R07 locators: repaired (sections 1, 6, 7, 8, 10). R08 pull-request numbers: repaired in the files; the description keeps them (C01). R09–R12: repaired ("the rank-`n` unit filtration (0.3)").

| Statement | Instances | Values computed on each side | Result |
|---|---|---|---|
| 0.2 `K{{t}}`, `K((X))` | `∑ p^i t^{−i}`; `∑ t^{−i}`; residue field of `ℚ_p{{t}}` | first: `v = i → ∞`, in `ℚ_p{{t}}`, infinitely many negative powers; second `v = 0`; residue `𝔽_p((t̄))`; zhukov2000 40–52 | agrees |
| 0.3 parameters, rank-`n` valuation | `t_2' = t_1t_2`; `1 + t_1`, `1 + t_1^2`; `ℚ_p` | `𝐯(t_2') = (1,1)`, so `𝐯(t_2) = (−1,1)` in new parameters; steps `(1,0)`, `(2,0)`; `R = {0} ∪ μ_{p−1}`, `2 ∉ R` | R04; rest agrees (zhukov2000 53–63, 90–97) |
| 0.5 finite extensions | `𝔽_p((t₁))(t₁^{1/ℓ})((t₂))`, `ℓ = p` | `e_1 = ℓ`, `e_2 = f = 1`, product `ℓ`; purely inseparable for `ℓ = p`; supplier §3a.1 Galois only | R05; formula agrees (zhukov2000 138–161) |
| 0.6 purely unramified | `F(μ_ℓ)`, `ℓ ∣ q−1`; `ℓ ∤ q` | degree `1`; degree = order of `q` mod `ℓ`; `F^pur = ⋃ F(μ_l)`, `Frob ↦ 1` (fesenko2000explicit 20–25) | agrees |
| 1.2 topology on `Fˣ` | `n = 2` base; `n = 3` mixed | base as zhukov2000 437; non-continuity: `U_1U_2 = k` needs `dim k = n−1 ≥ 2`, holds for `n = 3` in both characteristics | agrees; source prints `m ≥ 3` |
| 2.1 definition | `n = 1`, `m = 3`; `char K_{n−1} = 0` | `K_3(F)` uniquely divisible, `K_3^top = 0` (`b(3) = 0`); `1 + 𝓂 ⊂ Λ_1` | agrees (Fesenko 2000a text 124–149, 246) |
| 2.2 first inclusion, characteristic `p`, first step | `n = 1`; `{θ, t_2, …}` | `Λ_1 = 1`; order `q−1`; `x` divisible in `K/D` ⇒ `x ∈ ⋂ lK = D`; `Λ ⊆` open subgroups `⊇ pVK` | agrees (text 247–256, 302–328; fesenko2000parshin 62) |
| 2.2a graded quotients | `n=1,q=1`; `ℚ_p{{t}}`, `m=1`; `ℚ_p(μ_{p²}){{t}}`, `m=p` | `gr^m ≅ k` or `0`; `e' = p/(p−1) ∉ ℤ`, `Ω^1 = k·dt`; `e' = p²`, `k/k^p ≠ 0` | agrees with Bloch–Kato (4.3), (4.7), (5.1)–(5.3), pp. 122–125 |
| 2.3 degree map | `{t_1,…,t_n}`; `{t_2,t_1}`; `{θ,t_2,…}`; `{1+t_1,t_2}` | `1`; `−1`; `0`; `∂ = 1 + t̄_1`, valuation `0` | agrees (text 173–178) |
| 2.4 structure | `ℓ ∣ q−1`, `n = m = 2`; `ℓ ∤ q(q−1)` | `a(2) = 1`, `b(2) = 2`: `(ℤ/ℓ)^3`; `ℤ/ℓ`; order of `K_n^top/ℓ^r` is `ℓ^{r(n+1)}` | agrees (text 225–246, 374–407); inputs: R01 |
| 3.2 cyclic prime degree | `y^p − y = t_1^{−1}`; exactness step | `[t_1^{−1},{1−t_1,t_2}) = −1 ≠ 0`, `[t_1^{−1},{t_1,t_2}) = 0`; `ℓ(a+Nz) = 0` needs torsion | statements agree (text 412–474); R01, C03 |
| 4.1 Neukirch–Fesenko map | `σ̃ = Frob`; `σ̃ = Frob^{1+d}` | `Σ = F`, value `{t}`; `Σ = F_{1+d}`, value `(1+d){t} ≡ {t}` mod `v^{−1}(dℤ)` | agrees (fesenko2000explicit 40–47) |
| 4.4 finite level | `F(μ_3, t_1^{1/3})`, `q ≡ 2 mod 3` | `p ≠ 3`, degree `6`, group `S_3`, abelianization `ℤ/2`, index `2 = [F_2:F]` | agrees |
| 4.6 normalization | `{t_1,…,t_n}`; `{t_2,t_1}` | `Frob`; `Frob^{−1}`; `∂{t_1,…,t_n}` is prime in `K_{n−1}^top(K_{n−1})` | agrees (fesenko2000explicit 170–176) |
| 4.7 dimension one | `r(π)` on `LF_d`, `[L:F] ∣ d` | order `lcm = d`; `[LF_d:M] = d`; `M ∩ F_d = F`; `[MF_d:M] = d`, so `MF_d = LF_d` | argument sound; C06 |
| 5.1 tame pairing | `(u,{t,p})_ℓ`; `(t,{t,p})_ℓ`; `(u,π)`, `(π,u)` in dimension one | `∂∂{u,t,p} = ū`, power `(p−1)/ℓ`, equals `Frob(u^{1/ℓ})/u^{1/ℓ}`; `{t̄,−1} ↦ −1`; `ū^{(q−1)/ℓ}` and its inverse | agrees; sign `+` fixed by `(θ,{t_1..t_n})` |
| 5.2 Parshin's formula | `[a,α)`, `a ∈ 𝔽_q`; `[t_1^{−1},{1−t_1,t_2})`; `w = V(w')`; `H = Ann{t_1^kt_2^{−1}}` | `v_F(α)Tr a = Frob^{v}(y) − y`; `det = −1`, coefficient `−1`; ghost components all `0`; `H` open of infinite index | length one agrees; R02, R03 |
| 5.5 existence | `ℓ ∤ q(q−1)`; `μ_p ⊄ F`; general `N` | one subgroup of index `ℓ`; `N_{F'/F}` induces iso on `ℤ/p` as `[F':F]` prime to `p`; preimage index `[K:N]/ℓ` | agrees (fesenko2000explicit 177–189); C05 |
| 5.6 injectivity | kernel chain | `ker Ψ = ⋂` abelian norm groups `= ⋂` open finite index `= 0` by 2.6 | agrees (fesenko2000explicit 197–198; text 278) |
| `IsHigherLocalField`, `existsUnique_residue_valuativeRel` | `n = 0`; trivial relation on `ℚ_p`; `n ≥ 1` | finite field: one valuative relation; `IsNontrivial` false; two rank-one henselian valuations force separably closed, `F_2 ≠ F` | sound |
| `isHigherLocalField_one_iff` | `ℚ_p`, `𝔽_p((X))` | both sides: discrete, nontrivial, rank one, complete, finite residue field ⇔ locally compact valuative topology | sound |
| `isHigherLocalField_laurentField` | `K = 𝔽_q`; `K = ℚ_p` | `X`-adic relation discrete of rank one, complete, residue field `K`; dimensions `1` and `2`; independent of the relation of `K` above | sound |
| Headlines (reciprocity, Frobenius, dimension one, existence, injectivity, `Λ = ⋂ lK`) | statable at the pins? | all mention `K_n^top(F)`; no Milnor K-theory in pinned Mathlib or Tau Ceti; docstring names each | correctly not stated |

- Source locators checked against the text: 61, in six texts (zhukov2000, the Invitation §6 chapter, fesenko2000parshin, vostokov2000, fesenko2000explicit, Bloch–Kato 1986 from Numdam).
- Library declarations opened at the pins: 9 (`IsNonarchimedeanLocalField`, `Mathlib/NumberTheory/LocalField/Basic.lean:46`; `spectralNorm_unique`, `SpectralNorm.lean:699`; `artinMap`, `ArtinMap.lean:114`; `denseRange_artinMap`, `:187`; `exists_artinMap_mem_iff`, `:205`; `exists_openSubgroup_artinMap_mem_iff`, `:221`; `isArithFrobeniusLift_of_mk_eq_artinMap_uniformizer`, `Local/Unramified.lean:464`; `zHat`, `ZHat/Basic.lean:66`; `kummerMap`, `GaloisCohomology/Kummer.lean`).
- Cross-roadmap citations resolved: 18 (K2SymbolsBrauer §§5.4, 9.11, 9.16, 9.17, 10.24, 10.26 on main; RamificationOfCompleteDiscretelyValuedFields §3a.1 (R05); KTheoryFiniteLocalFields §§3.0, 3.0a; ProfiniteCohomology Layers 10, 12; FunctionFieldArithmetic §§3.1, 4.2, 4.3 at its open head; ClassFieldTheory Layers 7, 8 and C.6; FormalLaurentPuiseux L2–L3).
- Dependency check: `depcheck: 170 roadmaps, 1973 edges, 0 problem(s)`; no UPWARD or CYCLE line. FunctionFieldArithmetic, the one supplier not on main, is a new roadmap one place earlier in the merge order.
- Automatic checks: all passed on this head. No change outside the roadmap folder.
- Elaboration of `Suggested.lean` under the defaults: three `sorry` warnings and nothing else. The five elaborated types were compared with the README: none lost a binder.
- One-tactic probe on the three sorried theorems with `simp`, `rfl`, `infer_instance` and `simp [IsHigherLocalField]`: none closes. No padding.
- Overlap check: read FunctionFieldArithmetic, KTheoryFiniteLocalFields, ClassFieldTheory, K2SymbolsBrauer, QuadraticFormInvariantsPartII (FilteredLocalGaloisGroups and FieldOfNorms were searched by keyword only); nothing shared. Higher local fields, `K_n^top` and the higher reciprocity map have no other owner on main or at the open heads searched; the one-dimensional Schmid–Witt symbol stays with FunctionFieldArithmetic §4.3 and Milnor K-theory with K2SymbolsBrauer.

Source independence: 14 passages compared with 6 sources, none shared beyond what a definition forces (longest common run 8 words, the definition of an Artin–Schreier tree, fesenko2000explicit line 109); largest share Fesenko 2000a (Invitation §6), about 19 of 76 citations; contents compared with it: independent (its subsections 6.2–6.8 are spread over 1.3, 2.1–2.6, 3.2, 5.1–5.4a in another order; the order of 4.1–4.3 is that of §10.1–10.4 and is forced by 4.1 → 4.2 → 4.3).

Research link: Layers 3–5 are the explicit higher local class field theory of Fesenko (1991, 2000) for the reciprocity map of Parshin (1984) and Kato (1979–82), with Vostokov's (1985) formula; it rests on the README's references and on the Invitation chapters read.

## Not verifiable

- Fesenko 2001 (Theorems 4.5–4.7, Lemma 4.7; cited in 2.2, 2.6, 5.4a): no legal copy found; the statements were checked through §6.6 of the Invitation, which quotes them.
- Fesenko 1991a and 1991b (3.1–3.3, 4.2, 4.4, 5.4): behind a paywall; checked only where the Invitation quotes them (Propositions 4.1 and 3.1, Theorem 3.3, pp. 1118–1119).
- Parshin 1984, Vostokov 1985, Kato 1980 §1 Theorem 2, Serre XIV: not read; the first two through the Invitation, Kato's theorem through Bloch and Kato's citation of it (their reference [11]).
- The base at `1` for `n = 2` in the Check of 1.2: the extraction does not distinguish the rank-one and rank-two rings in zhukov2000 line 437.

## Source issues

- **Error** in zhukov2000 at §1.1, printed page 6 (lines 62–63): the source says the Teichmüller representatives form a field isomorphic to `K_0` whenever the first residue field has characteristic `p`; it should be a field only when `char K = p`, and a multiplicative system of representatives in mixed characteristic; affects a stated result.
- **Misprint** in zhukov2000 at §1.4.2, Property (3), printed page 15 (lines 480–481): the source says the multiplicative group is not a topological group when `m ≥ 3`; it should be `n ≥ 3`, as its proof and Remark 1 use; affects nothing.
- **Gap** in Fesenko 2000a (Invitation Part I §6) at §6.4.3, printed page 66 (line 203 of its text): the source says the value of the length-`r` pairing is given by ghost components computed in characteristic `p`; it should be computed on lifts to characteristic zero, where ghost components determine a Witt vector; affects a stated result.
- **Misprint** in fesenko2000explicit at §10.3.2, printed page 97 (lines 87–88): the source says all axioms hold when `μ_p ⊂ F` and (A3b) fails otherwise; it should be the reverse, since the example that follows has `μ_p ⊂ F` and violates (A3b); affects nothing.
- **Misprint** in fesenko2000explicit at §10.4.1, Definition, printed page 98 (line 113): the source says `E = M(α)` with `α^p − α ∈ M`; it should be `M = E(α)` with `α^p − α ∈ E`; affects nothing.

## For the human reviewers

- Name: K2SymbolsBrauer (README line 3403) and CrystallineCohomology (line 11538) on main name a consumer `HigherLocalFieldsAndHigherClassFieldTheory`; this folder is `HigherLocalClassFieldTheory`. Whether the names are aligned is yours to decide.
- Sources: the README cites thirteen works; four are recorded for it (Invitation sections 1, 7, 8, 10). The Invitation §6 chapter, cited most, and Bloch–Kato 1986 are open (publisher, Numdam) and unrecorded; Fesenko 1991a, 1991b and 2001 could not be read.
