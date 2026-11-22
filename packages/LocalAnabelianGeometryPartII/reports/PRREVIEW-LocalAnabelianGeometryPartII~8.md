# Review of LocalAnabelianGeometryPartII (pull request #2867 at 7f99720)

**Verdict:** needs changes

**Summary.** Changes are needed, for two findings (both P2). Two coefficient-vanishing targets of Layers 3–4 (Props. 5.6 and 3.3 of [Abrashkin 2010]) are stated without the range `0 ≤ m < N` and are false as written (the identity violates them at `m = N`), and the criterion of 2.4 drops the hypothesis `r* < v₀`; in 11.2 the relation defining `b_K` is written the wrong way round, so the exact sequence it introduces does not hold. There are four small corrections and three format notes, none blocking. Layers 7–11 rest on [Abrashkin 2000], [Abrashkin 1998] and [Deligne 1984], which could not be read legally; that, and the roadmap's own deduction of the absolute form for `p = 2`, are left to the human reviewers.

## R01 (P2) — Props. 5.6 and 3.3 are false without the range `0 ≤ m < N`, and the criterion of 2.4 drops `r* < v₀`

An implementer who takes these three targets as written is asked to prove two false statements and one that its source does not prove.

*Prop. 5.6, in 3.3 (line 527).* The target reads "`α_{a, b, −m}(f) = 0` whenever `b/p^m < a`", with no range for `m`, and the second index is read modulo `N₀` (conventions, lines 112–113). Take `m = N₀` and `a = b = 1`: `1/p^{N₀} < 1`, and `α_{1, 1, −N₀}(f) = α_{110}(f)`, which the same sentence assumes nonzero. The source has `0 ≤ m < N₀` (Abrashkin2010 lines 1469–1470), and 3.1 (line 481) states the corresponding range for admissibility.

*Prop. 3.3, in 4.2 (lines 586–587).* "`α_{a, b, −m mod N_s}(f_{KK's}) = 0` whenever `a, b < v_s` and `b/p^m < a`". For the analytic system of `η = id` (`K = K'`), `α_{aa0} = 1` for every `a`; with `m = N_s` and `a = b` the condition would force `α_{aa0} = 0`, so no `v_s ≥ 2` exists and the "iff" declares the identity system not special admissible, against 4.3 (analytic systems are special admissible). Here the printed statement has the same slip, "`m ≥ 0`" (Abrashkin2010 line 668); the proof of Prop. 3.1 uses `0 ≤ m < N_s` (Abrashkin2010 line 570), and the "only if" half of the proof of Prop. 3.3 is valid only in that range, since `α_{a,b,−m mod N_s}(f_s)` is the sum of the `α^∞_{a,b,−m'}` over `m' ≡ m`.

*Prop. 4.5, in 2.4 (lines 421–423).* The criterion is stated for the auxiliary field with no condition on `r*`. The source assumes `r* = v(K₁/K) < v₀` (Abrashkin2010 line 1083) and its proof uses it twice: `max{r*, v} < v₀` in one direction and `φ_{K₁/K}(v) < v` for `v ≥ v₀ > r*` in the other.

The smallest repair is to add "`0 ≤ m < N₀`" in Prop. 5.6, "`0 ≤ m < N_s`" in Prop. 3.3 (with a source-correction note, as the README does elsewhere), and "for `r* < v₀`" in the criterion.

## R02 (P2) — In 11.2, `b_K` is defined by `φ_{K_M/K}(b_K) = w_K`; the exact sequence needs `φ_{K_M/K}(w_K) = b_K`

With `b_K` as written (line 1096), the sequence `1 → 𝒢_𝒦(p)/𝒢_𝒦(p)^{(w_K)} → Γ_K(p)/Γ_K(p)^{(b_K)} → ℤ/p^M → 0` is not exact and is not a quotient of the sequence (1) of 11.1, so the classes `cl(τ₀)`, `cl(τ_P)` of the next bullet have no home.

The README's own conventions fix the direction: `G_K(u) ∩ G_{K_M} = G_{K_M}(ψ_{K_M/K}(u))`, and Lemma 1 of §6.2 in 11.1 is `G_K(a_K) = G_{K_M}(v_K)` with `ψ_{K_M/K}(a_K) = v_K`, which the second Check of Layer 11 computes. For the kernel to be `𝒢_𝒦(p)/𝒢_𝒦(p)^{(w_K)}` one needs `ψ_{K_M/K}(b_K) = w_K`, that is `b_K = φ_{K_M/K}(w_K)`. The upper jumps of `K_M/K` are `e_K(p/(p−1) + i)`, `0 ≤ i < M`, with lower values `e_K p^{i+1}/(p−1)`, so `φ_{K_M/K}(w_K) = e_K(M + 1)`, which lies above the last jump and below `a_K`. In the first Check's example (`p = 3`, `M = 2`, `e_K = 6`): `φ(54) = 15 + (54 − 27)/9 = 18 < a_K = 21`, whereas the relation as written gives `b_K = ψ(54) = 27 + 9·(54 − 15) = 378 > a_K`, and `Γ_K(p)/Γ_K(p)^{(378)}` is not a quotient of `Γ_K(p)/Γ_K(p)^{(21)}`.

Write "`b_K = φ_{K_M/K}(w_K) = e_K(M + 1)`". [Abrashkin 2000] could not be read here; if the relation is transcribed from §6.3, it is one more source correction to record.

## C01 — Prop. 5.7 in 3.3 displays the shift by `−δ(p)` and then says the statement is the shift by `+δ(p)`

Lines 531–533 give `α_{b, b+r, 0}(f) = α_{b−δ(p), b+r−δ(p), 0}(f)` under `b + r + δ(p) < p^{N₀−2}`, followed by "The proof proves the shift by `+δ(p)`, and that is the statement". For `b < δ(p)` the index `b − δ(p)` is not in `ℤ(p)`, and the hypothesis bounds `b + r + δ(p)`, which only the `+` form uses (Abrashkin2010 lines 1503–1504 for the statement, line 1527 for what the proof gives). Display `α_{b, b+r, 0}(f) = α_{b+δ(p), b+r+δ(p), 0}(f)`.

## C02 — The module of all formal sums `Σ c_{an} D^∞_{an}` (4.1) is not a submodule of `ℳ̄_{K ur}`, so 4.2's "`f_ur(ℳ_{K∞}) ⊆ ℳ_{K'∞}`" has no literal meaning

This answers the first open question of the description. The sum `Σ_{n ∈ ℤ} D^∞_{an}` has no image at level `s`: the coefficient of `D^{(s)}_{a, m}` would be an infinite sum of `1`s in the discrete field `k(p)`. So with the convention pinned in 4.1 (lines 559–563), `f_ur`, which is defined on `ℳ̄_{K ur}`, is not defined on `ℳ_{K∞}`, and the definition of "special admissible" in 4.2 (line 585) does not determine a condition. What Layers 4–5 use is the Remark after Prop. 3.3: `f_ur(D^∞_{a0}) = Σ_{b, m ≥ 0} α_{a,b,−m} D'^∞_{b,−m}` with `α_{a,b,−m} = 0` for `b/p^m < a`; such a sum does lie in `ℳ̄_{K' ur}`, because for each `b` only finitely many `m` occur. Either define special admissibility by that expansion (commuting with `σ`), or take for `ℳ_{K∞}` the formal sums whose projections to every level are finite.

## C03 — The description's sentence on the Corollary of §0 no longer describes 11.5

"The §0 Corollary is stated for `K, K' ∈ 𝒜_M`, with a source-correction note." At this head 11.5 assumes `K ∈ 𝒜_M` only and concludes `K' ≅ K`, "in particular `K' ∈ 𝒜_M`", and carries no source-correction note. Text that would be right: "The §0 Corollary is stated for `K ∈ 𝒜_M` and any `K'` satisfying the hypothesis of Theorem B."

## C04 — 0.2 cites [Lazard 1965] without a locator, for a statement Lazard makes in finite rank

The isomorphism of the completed group algebra with the Magnus algebra is Lazard's Chap. II, (3.1.3)–(3.1.4), for finitely many letters `X_1, …, X_r`. 0.2 states it for an arbitrary index set with a basis converging to `1`; the scope section says that the infinite case is new here, but 0.2's citation line qualifies only Serre's book. Add the locator and "for finite `I`; the general case by passage to the limit over finite `S ⊆ I`".

## N01 — `classTwoMul` and `classTwoMul_assoc` serve no headline stated in `Suggested.lean`, and the second closes by one `simp`; it is marked as a check, and could instead stand as a Check of 0.3.

## N02 — Two page pointers are off by one: Remark a) (conventions, line 150, "the Remark after it") precedes Theorem B on p. 26, Theorem B being on p. 27; the proof of Theorem B′ (2.4, line 415) begins with §4.3 on p. 28, not p. 27.

## N03 — In 2.2 (line 398), `E(w, t^a)^{p^s} = E(σ^s w, t^{ap^s})` holds in `k[[t]]`, not in `W(k)[[t]]`, where `E(w, X)^p = exp(pwX)·E(σw, X^p)`; since 1.3 defines `E` over `W(k)`, say "in `K`".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 0.1 profinite Magnus algebra | degree-1 part; `e` of 1.4; rank one | `𝒥/𝒥² = ∏_I R`, arbitrary coefficients; `Σ t^{−a}D_{a0}` allowed; `ℤ_p[[X]]`; Abrashkin2010 lines 135–145 | sound |
| 0.2 Lazard, recognition | rank 1, rank 2; `ψ(x_i) = 1 + b_i` | `θ(x⁻¹y⁻¹xy) ≡ 1 + X₁X₂ − X₂X₁`; `X_i ↦ b_i` bijective on `𝒥/𝒥²`; Lazard II (3.1.4) finite rank | sound; C04 |
| 0.3 class-two law | associativity; `x∘y∘(−½[x,y])`; `p = 2` | both sides `x+y+z+½([x,y]+[x,z]+[y,z])`; `= x + y`; `½ ∉ ℤ_2` | sound |
| 1.0 coordinates | Abrashkin2010 lines 118–119 | `t` a `p`-basis of finite `L/K` in `K^sep` | sound |
| 1.3 decomposition, reciprocity | `x ∈ tW(k)[[t]]`; `p = 3`, `k = 𝔽₉`; Schmid–Witt | `(σ−1)(−Σσ^m x) = x`; Teichmüller traces `0, ±2, ±√−2`, never `1`; `Res = a·cw` | sound |
| 1.6 Magnus embedding | homomorphism; anti-homomorphism variant; sign for `k = 𝔽_p` | `ψ(τ₁τ₂) = ψ(τ₁)ψ(τ₂)` with `τ⁻¹`; without, reversed; `ψ(τ₀) ≡ 1 − D₀` | sound |
| 2.1 `F_γ` | `γ = 1`; `2` (`p` odd, `p = 2`); `1 + 1/p` | `D_{10}`; `2D_{20} − D_{10}²`, `2D_{11} − D_{10}²`; `−[D_{10}, D_{1,−1}]`; `n₂ = v_p(γ)` forced | sound |
| 2.2 abelian level | length-`M` class `p^j u t^{−a}` | `≡ V^j(u t^{−a})`, jump `a p^{M−1−j}`; matches FunctionFieldArithmetic 4.4's conductor | sound; N03 |
| 2.4 Theorem B′ | criterion with `r* ≥ v₀` | source assumes `r* < v₀` (line 1083); `E_0(b,T) = bT + …` confirms the correction of property (2) | R01 |
| 2.5 Theorem B | `v = 0`; `inf S` versus `inf{w : [w,∞) ⊆ S}` | `𝒜(0) ∋ D₀` is the augmentation ideal, `𝒜^{(0)}` is not; second infimum gives B′'s hypothesis | sound |
| 3.3 Props. 5.1–5.9 | Prop. 5.6 at `m = N₀`, `a = b = 1`; Prop. 5.9's `η` | `α_{1,1,−N₀} = α_{110} ≠ 0`; `η(t) = αt` gives `α^a`, so `α⁻¹t` is right | R01, C01 |
| 4.1 modules, `π_{K∞}` | `k = 𝔽_p`; `Σ_n D^∞_{an}` at level `s` | `π_{K0}(D_{a0}) = −Σ t^{ap^i}dt/t`; coefficient an infinite sum of `1`s | sign sound; C02 |
| 4.2 Prop. 3.3 | identity system, `m = N_s`, `a = b` | condition forces `α_{aa0} = 0`, actual value `1` | R01 |
| 5.5 uniqueness | kernel of `K^× → K̂^×`; `ν` on `U^{(1)}` | `μ_{q−1}` in both characteristics; `ν(u)/u ∈ U^{(1)} ∩ μ_{q−1} = 1` | sound |
| 6.4 Theorem A, characteristic `0` | hypothesis of FieldOfNorms 4.3 for `F·E_∞` | `Gal(E_F/F·E_m) ≅ ℤ_p`, normal, totally ramified for large `m` | sound |
| 6.5 absolute form | `μ' = ḡ(τ)⁻¹μ_Fτ` | `μ'xμ'⁻¹ = g_F(x)`, `μ'(F) = F'`, so `μ' = μ_F` and `μ_F(E) = E'` | sound |
| Lean Theorem A | elaborated type; `v = 0`; mixed characteristics | both `CharP` binders present; hypothesis for `0 ≤ v`; no filtered `g` exists across characteristics | matches 5.4, 6.4 |
| Lean absolute form | residue characteristics `p ≠ ℓ` | no `CharP` binder; nontrivial pro-`p` `G_K(v)` cannot map onto a pro-`ℓ` group | true, as docstring says |
| Lean Witt theorem | `K` finite, `K` separably closed | `Γ_K(p) ≅ ℤ_p`, `cd = 1`; trivial group, `cd = 0`; not in Tau Ceti (only the `p`-invertible case) | sound |
| 7.1 special bases | [Abrashkin 2000] unreadable | `F_{1+1/p², −1} ≡ 0`, `F_{1+1/p², −2} ≡ −[D_{10}, D_{1,−2}]` recomputed from the displayed formula | not verifiable |
| 7.4 admissible submodules | [Abrashkin 2000] unreadable | `ℱ^{(v)}_v = −2[Δ_{20}, Δ_{1,−1}]` at `v = 2 + 1/p` from 7.3's definition | not verifiable |
| 10.2 bounded ramification | `ℚ_p(ζ_{p²})/ℚ_p` | upper jumps `0, 1`, lower `0, p − 1`; in `(ext ℚ_p)^f` iff `f > 1` | Check sound; source not verifiable |
| 11.1 Lemma 1 of §6.2 | general `M`; `p = 3`, `M = 2`, `e_K = 6` | `ψ_{K_M/K}(a_K) = e_K p^{M+1}/(p−1) = v_K`; `81`, `21`, `54`, `f_K = 12` | sound |
| 11.2 `b_K` | `p = 3`, `M = 2`, `e_K = 6` | needed `φ(54) = 18 < 21`; as written `ψ(54) = 378 > 21` | R02 |

- Source locators checked against the text: 46 in [Abrashkin 2010] (statements of Thm. A, Props. 1.1–1.3, 2.1–2.7, 3.1–3.6, 4.1–4.5, Lemmas 4.4–4.9, Thms. B, B′, Props. 5.1–5.9, 6.1–6.2, §7), with the printed page numbers checked on the journal's open copy (Numdam); 1 in [Lazard 1965].
- Library declarations opened at the pin: 18 in Tau Ceti (among them `absoluteGaloisGroupProP` and its quotient map, `RamificationIndexDomain = Set.Ici (−1)`, `cohomologicalDimensionAt : ℕ∞`, `freeProCPointed`, `completedGroupAlgebra`, the pointed Serre theorem, `isTopologicallyFinitelyGenerated_absoluteGaloisGroupProP [NeZero (p : K)]`, `cohomologicalDimensionAt_absoluteGaloisGroupProP_le_one_of_not_mu`).
- Cross-roadmap citations resolved: FilteredLocalGaloisGroups 1.2–1.5, 2.1, 2.2, 2.4 and FieldOfNorms 0.6, 1.4, 3.3, 4.3, 4.4 at their open heads; FunctionFieldArithmetic 3.1, 3.2, 4.3, 4.4 with all ten cited names; GeometricTopology §4.12.1, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3, ClassFieldTheory Layer 7 (three names), RamificationOfCompleteDiscretelyValuedFields §§4a.1–4a.2, PadicExtensionFamilies 2.1–2.2 on main.
- Dependency check: `depcheck: 168 roadmaps, 1962 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: three `sorry` warnings (lines 101, 127, 173), nothing else. One-tactic probe (`simp`, `rfl`, `infer_instance`, `aesop`) closes none of the three sorried theorems. Elaborated types compared with the README for all six declarations; nothing changed.
- No change outside the roadmap folder; the folder holds the README, `Suggested.lean` and a one-line topic file.
- Automatic checks: all pass except the scan for TeX syntax (set aside below).

Overlap check: read FieldOfNorms, FilteredLocalGaloisGroups, LocalAnabelianGeometry, HigherLocalClassFieldTheory, FunctionFieldArithmetic, RamificationOfCompleteDiscretelyValuedFields, ProfiniteProPGroups, PadicPeriodRings; the absolute upper filtration is ClassFieldTheory Layer 7's (copied under this namespace only to state the headlines); the finite Magnus levels are GeometricTopology §4.12.1's; the Kummer field of norms is FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3's; lifting of isomorphisms and cofinal systems are FieldOfNorms 4.3–4.4's; Deligne's triples, the profinite Magnus algebra and Lazard's isomorphism are stated by no other roadmap; nothing else shared.

Source independence: 17 passages compared with 2 sources (Abrashkin 2010, Lazard 1965), none shared beyond formulas and forced lists of hypotheses; largest share Abrashkin 2010, 50 of about 105 locators; contents compared with Abrashkin 2010: independent at the level of layers (Layer 1 ↔ §1, Layer 2 ↔ §4, Layer 3 ↔ §§2 and 5, Layer 4 ↔ §3, Layer 5 ↔ §6, Layer 6 ↔ §7; not in order, §§2 and 5 merged, the order of Layers 2–3 forced by Theorem B). [Abrashkin 2000], [Abrashkin 1998] and [Deligne 1984] could not be read.

Research link: the headline targets are Theorem A of Abrashkin (2010) and Theorems A′ and B of Abrashkin (2000), the local analogue of the Grothendieck conjecture, with Deligne's (1984) truncated equivalence as input; they extend Mochizuki (1997). Rests on Abrashkin 2010, printed pp. 1–3, and the README.

## Not verifiable

- [Abrashkin 2000] (sampled targets 7.1 and 7.4; all of Layers 7–9 and 11; the formula for `F_{γ, −N}`; the README's source corrections to it): the publisher's page refuses access and no open copy was found.
- [Deligne 1984] (sampled target 10.2; all of Layer 10; A.6.3 in 11.5): no open copy found. The filtration statement of 10.4 is the README's own argument.
- [Abrashkin 1998] (the proof targets of 7.3): no readable text.
- [Koch 1970], Serre's two books, [Berthelot–Messing 1990] (0.2, 1.1, 1.2): not opened; the statements cited are standard.

Automatic checks set aside as false positives: the scan for TeX syntax flagged the displayed formula for `F_γ` in 2.1, which is inside a fenced block indented under a list item, and code spans that wrap across a line break (the Check on the sign of `π` in Layer 4, the Check on `𝒪_F/p` in Layer 10). The scan for dropped binders flagged `[Invertible (2 : R)]`, which is present in both elaborated types. The scan for unknown names flagged `GroupFiltration.herbrandPsi`, which is FilteredLocalGaloisGroups 1.4's name at its open head.

## Source issues

- **Misprint** in Abrashkin2010 at Prop. 3.3, printed p. 18: the source says the coefficients vanish for all `m ≥ 0` with `b/p^m < a`; it should be `0 ≤ m < N_s`, as in the proof of Prop. 3.1; affects a stated result.
- **Misprint** in Abrashkin2010 at Prop. 5.7, printed p. 40: the source says the coefficient equals the one with both indices lowered by `δ(p)`; it should be raised by `δ(p)`, as the proof shows and the hypothesis bounds; affects a stated result.
- **Error** in Abrashkin2010 at Theorem B, Prop. 4.2 and Remark a) of §4.2, printed pp. 26–27: the source says the two filtrations agree modulo `𝒥³` for all `v ≥ 0`, with `F₀ = D₀`; it should be for `v > 0`, since the ideal at `0` is then the whole augmentation ideal; affects a stated result.
- **Gap** in Abrashkin2010 at the deduction of Theorem B from Theorem B′, printed p. 27: the source takes `v₀ = inf S` and applies B′, which needs every `v > v₀` in `S`; it should take the infimum of the `w` with `[w, ∞) ⊆ S`; affects the proof.
- **Misprint** in Abrashkin2010 at Prop. 4.3 a), printed p. 26: the source's sentence defines no ideal; it should be that modulo `𝒥³` the ideal of level `v₀` is the smallest closed `σ`-invariant ideal containing the truncated elements; affects a stated result.
- **Misprint** in Abrashkin2010 at §4.5, property (2), printed p. 32: the source says the series is `p^r T` plus higher terms; it should be `p^r bT` plus higher terms, as its case `r = 0` shows; affects the proof.
- **Misprint** in Abrashkin2010 at §4.5, printed p. 32: the source takes the ideal `𝔪₁` with coefficients of length `M`; it should be length `M + 1`, the length of the lifting it sits in; affects nothing.
- **Misprint** in Abrashkin2010 at §5.1, printed p. 36: the source sums the products in `ℱ_γ(v)`, `γ = ap^m`, over all `n ≥ 0`; it should be `0 ≤ n < m`, the terms with `n = m` being inside `Δ_{am}`; affects a stated result.
- **Misprint** in Abrashkin2010 at the definition of locally analytic systems, §3.6, printed p. 20: the source takes `η_s` in `Iso⁰(K, K')`; it should be `Iso⁰(K_s, K'_s)`, as the proof of Prop. 3.4 speaks of conjugates of `η_s` over `K`; affects a stated result.
- **Misprint** in Abrashkin2010 at the proof of Prop. 5.9, printed p. 41: the source normalizes by `η` with `η(t) = α_{110}(f)t`; it should be `η(t) = α_{110}(f)⁻¹t`, by formula (2.2) of the proof of Prop. 2.7; affects the proof.
- **Misprint** in Abrashkin2010 at the proof of Lemma 4.4, printed pp. 28–29: the source's first congruence has exponent `qp^M` on `t₁`; it should be `q`, the case `s = 0` of the next display; affects nothing.
- **Misprint** in Abrashkin2010 before Prop. 6.1, printed p. 45: the source defines `μ_{LL'}` with the Frobenius of `t_{K'}`; it should be that of `t_{L'}`, as in the preceding paragraph; affects nothing.
- **Misprint** in Abrashkin2010 at reference [3], printed p. 49: the source gives the pages of the 2000 paper as 3–43 of volume 11; it should be 133–175; affects nothing.

## For the human reviewers

- **Not tested.** [Abrashkin 2000] (40 of about 105 locators; Layers 7–9 and 11), [Deligne 1984] (Layer 10) and [Abrashkin 1998] could not be read legally: their locators, wording and arrangement were not checked.
- **Licence / sources.** The README corrects printed statements of [Abrashkin 2000] (special basis by the factors `a`, and the dependence of `F_{γ, −N}` on `N`, conventions lines 125–148; a sign on p. 152, Layer 7 Checks). These could not be checked against the text.
- **Scope.** The absolute form for `p = 2` (6.5) is the README's own deduction from Theorem A and 5.5; [Abrashkin 2010, p. 2] asserts it without proof and no refereed source read here proves it.
- **Scope.** The README declines Wintenberger's 1980 full faithfulness on `p`-adic Lie extensions as "not in print" (scope section, lines 1216–1218) and routes Layer 6 through FieldOfNorms 4.3 instead.
- **Arrangement inside layers.** Layers differ from the sources' sections, but 4.1–4.4 run through Abrashkin 2010 §§3.1–3.7 in order, 8.2 lists Abrashkin 2000 §§4.2–4.12 one by one, 10.1–10.4 run through Deligne §§1–3, and 7.3 (line 852) says its route "is that of [Abrashkin 1998, §§1–4]".
