# FIX-RT-RefinedTraceMethodsPartII~1: repair report

Reviews settled: `RT-RefinedTraceMethodsPartII~1a` (six findings) and `RT-RefinedTraceMethodsPartII~1b` (three findings). The two P1 findings are the same defect and are settled once. Every finding was verified against the cached sources, the pins and the sibling heads, and every one holds. All are applied. Files changed: `packages/RefinedTraceMethodsPartII/README.md`, `packages/RefinedTraceMethodsPartII/Suggested.lean` (module docstring only) and `packages/RefinedTraceMethodsPartII/sources.toml` (locators and `cited_for`). `metadata.toml` and `design/plan.json` are unchanged, and no gap was added.

## RT-RefinedTraceMethodsPartII~1a/F01, RT-RefinedTraceMethodsPartII~1b/F01 (P1) — applied

Verified: `TC_1(k[t];ℤ_p) = 0`. The weights `THH(k) ⊗ (T/C_m)_+` all have connectivity 0, so §2.3's product decomposition does not apply.

Layer 3 Examples: old "kernel … `W(k) ≠ 0` … nonzero in degree 1" → new: the product reading gives a spurious `W(k)`. The true value `TC_1(k[t],(t)) = 0` comes from the motivic filtration (PrismaticCohomologyPartIII §§6.16, 6.24, 7.0). The degree −1 witness `[t] ∈ coker(1 − F | W(k[t]))` uses RefinedTraceMethods §§2.13, 2.16. Dependencies line updated.

Pattern: §3.5 now states that the product decomposition needs growing connectivity. The other product decompositions were checked and all have connectivity that grows with the weight: §2.6 (cusp, shift `2ℓ(a,b,m)`), §5.1 (axes, `S^{λ_i}`) and §7.1 (`2⌊(n−1)/e⌋+1`). I chose the TR route for degree −1 over 1b's `gr^0` route. It gives `TC_{−1}` exactly, with no control of `F^1` needed.

## RT-RefinedTraceMethodsPartII~1a/F02 (P2) — applied

Verified against akn-delta Definition 9.2 (line 1846), which requires `(A′,R)` to be pre-prismatic. That is Definition 2.2 (line 307), and the README never defined it.

§8.1: old "admits a pre-prismatic factorization … surjective … [1,1]" → new: pre-prismatic is defined, the condition `(A′,R)` pre-prismatic via `I ⊆ A′` is added, and the prism `A′[δ(I)^{−1}]^∧_{(p,I)}` is noted (Remark 2.3, line 311; line 1851). Relatively quasisyntomic now says "bounded" (Definition 9.1). New Check: `(ℤ_p,𝔽_p)` qrsp, `(ℤ_p,ℤ/p²)` not.

## RT-RefinedTraceMethodsPartII~1a/F03 (P3) — applied

Verified: no target states the T(1)-vanishing. §9.6 is nilpotence on `⊕_i 𝔽_p(i)(R)` only, and akn24 Corollary 6.4 (line 2356) needs further inputs.

Scope (What is left out): old "appears only as a consequence of the v₁-nilpotence theorem (§9.6)" → new: "This roadmap does not state `L_{T(1)}K(ℤ/p^n) = 0`". The new text also says what §9.6 gives and what akn24 Corollary 6.4 adds. I took the reviewer's first option and added no new target.

## RT-RefinedTraceMethodsPartII~1a/F04 (P3) — applied

Verified: Layer 9 fixes `j = ⌈n/e⌉` and then uses j as the F-weight in §§9.2–9.3.

Old `gr^j`, `{j,n}`, `ε(i,j)`, `Σ_j` → new `gr^{j′}`, `{j′,n}`, `ε(i,j′)`, `Σ_{j′}`. Layer 9's opening line now says that F-weights are written j′, as in §1.5. Same pattern repaired in the §8.6 Check ("F-weights 1 ≤ j′ ≤ in − 1") and in §9.4 Descent (`N^{≥j}` → `N^{≥i′}`, a Nygaard level).

## RT-RefinedTraceMethodsPartII~1a/F05 (P3) — applied

Verified: akn24 Corollary 2.13(iii) (line 391) gives `gr^0_Fℤ_p(i)(R) ≃ 0` for i ≥ 1, and Corollary 2.14 (line 398) gives `F^{[0,in−1]} ≃ F^{[1,in−1]}`. The old control could not tell the two windows apart.

§9.2 Check: old "A window [0, in − 1] would include `gr^0` … nonzero in weight 0" → new: the upper end is sharp, since for ℤ/4 and i = 1 the window `[1,0]` gives 0 instead of ℤ/2. The lower end may be 0 or 1 (Corollaries 2.13(iii) and 2.14).

## RT-RefinedTraceMethodsPartII~1a/F06 (P3) — applied

Verified at the pinned Tau Ceti: `def K0` (TauCeti/CategoryTheory/GrothendieckGroup/IsoClassModel.lean:199), `hochschildCohomology` (TauCeti/RingTheory/HochschildCohomology/Complex.lean:166) and the folder TauCeti/RingTheory/CyclicCohomology. A grep finds no Hochschild or cyclic homology, no higher K-groups, no big Witt vectors and no δ-rings.

README supplier paragraph: old "no … algebraic K-theory, cyclic homology" → new "no … higher or relative algebraic K-groups, cyclic homology, mixed complexes", naming what Tau Ceti has. `Suggested.lean` docstring corrected the same way, including its bullets. No statement changed.

## RT-RefinedTraceMethodsPartII~1b/F02 (P3) — applied

Verified: Milnor's sequence has no K₂ term on the left, so it gives only the image `k^×`. hesselholt-axes line 31 concerns `K_2(A,I)` alone.

Layer 4 Examples: old "Milnor … gives `K_1(A_d) = k^×`, so `K_1(A_d,I_d) = 0`" → new: Milnor gives `K_0 = 0` and the diagonal image only; `K_1 = 0` is cited to hesselholt-axes Theorem A and Geller–Reid–Weibel (d = 2) and §§5.3–5.4 (d ≥ 2). Also changed: §4.1 Check, §5.2 Check q = 1, §5.3 witness.

The new §5.3 witness: for d ≥ 3 the printed formula is an infinite product (`cyc_d(m′) > 0`), which contradicts speirs-axes line 69 and Proposition 28 (line 982). Same pattern also fixed in the §4.3 Check: `K_0(A_d) = ℤ` also needs `K_1(k) ⊕ K_1(B_d) → K_1(k^d)` to be onto, which is now stated.

## RT-RefinedTraceMethodsPartII~1b/F03 (P3) — applied

Verified: `frobeniusNumber_pair` (Mathlib/NumberTheory/FrobeniusNumber.lean:59) states `Coprime m n → 1 < m → 1 < n → FrobeniusNumber (m * n - m - n) {m, n}`. Confirmed by `#check` at the pin.

§1.1 Conductor: old "the least c … is `(a−1)(b−1)`" (as a target) → new: the Frobenius number `ab − a − b` is Mathlib's `frobeniusNumber_pair`, and `(a−1)(b−1)` is one more than it. Added to "From Mathlib", to the *Needs* of §1.1 and §4.2, and to the Layer 1 Dependencies.

## Adversarial pass on the changed and added statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Layer 3 Ex., degree 1 | k = 𝔽_p, 𝔽_2, `𝔽̄_p` | product reading: `lim_R W_{v+1}(k) = W(k)` (ℤ_p for 𝔽_p); motivic: i=0 `H^{−1}=0`; i=1 `(k^×)^∧_p` = `(ℤ/(p−1))^∧_p = 0`, for `𝔽̄_p` divisible prime-to-p torsion, 0; i ≥ 2 `WΩ^i_{k[t]} = 0` (curve) | `TC_1 = 0` ≠ `W(k)`; new text true | R01 |
| Layer 3 Ex., degree −1 | 𝔽_p, 𝔽_2, `𝔽̄_p` | `K_{−1}`: `K_0(k[t]) = ℤ → ℤ` iso, so 0; TC: `[t] ↦ t ∈ k[t]/{f^p − f}`, `deg(f^p − f) ∈ {0} ∪ pℕ`, 1 ∉; for `𝔽̄_p` constants are all `a^p − a` but t still not; p = 2: degrees 0 or even | nonzero vs 0 | R01 |
| §3.5 application clause | truncated e = 2; cusp (2,3); k[t] | connectivity `2⌊(n−1)/2⌋+1 → ∞`; `2ℓ(2,3,m) → ∞`; 0 for all m | clause separates them | R01 pattern |
| §8.1 pre-prismatic / rel. qrsp | `(ℤ_p,𝔽_p)` p = 2, 3; `(ℤ_p,ℤ/4)` m = 2, 3; `(W(k)⟦z⟧, O_K)` | δ(2) = −1 unit; δ(3) = −8 ≡ 1 mod 3; δ(4) = −6 ≡ 2, δ(8) = −28 ≡ 0 mod 4, non-units; δ(E)(0) = δ(pu) ≡ φ(u) mod p, unit | qrsp; not qrsp; BK pair qrsp with A′ = A, matching `Δ = W(k)⟦z⟧` of §8.3 Checks | R02 |
| §8.1 rel. quasisyntomic needs "bounded" | `(ℤ_p,ℚ_p)`; `(ℤ_p, ℤ_p ⊕ ⊕ℤ/p^n)` | bounded, not derived p-complete; unbounded | existing Checks still hold | R02 |
| Scope, T(1) | §9.6 statement vs akn24 Cor. 6.4 | §9.6: v₁ nilpotent on graded only; Cor. 6.4 adds the finite filtration of Cor. 2.16 and `L_{T(1)}K ≃ L_{T(1)}TC` | no target claims the vanishing | R03 |
| §§9.2–9.3 with j′ | ℤ/4, i = 1; ℤ/8, i = 1; `𝔽_2[z]/z³`, i = 3 | Σε = 1 = 1·1; window [1,2], `|H¹| = |(ℤ/8)^×| = 4 = 2^{1·2}`; Σε over j′ ∈ [1,8] with 3 ∤ j′: 6 = 3·2 | agree with §1.5 and §9.3 | R04 |
| §9.2 window Check | ℤ/4, i = 1; ℤ/8, i = 1 | [1,0] empty gives 0 ≠ ℤ/2; [1,1] drops `gr^2` of ℤ/8; [0,1] = [1,1] since `gr^0 = 0` | discriminates the upper end | R05 |
| Library sentence (README, Lean doc) | pinned Tau Ceti greps | K0 at IsoClassModel.lean:199; `hochschildCohomology` Complex.lean:166; CyclicCohomology/; no HH_*, HC_*, K₁, BigWitt, δ-ring | true as restated | R06 |
| Layer 4 Ex. Milnor image | d = 2, k = 𝔽_3; d = 3 | kernel of `(a,(b_i)) ↦ (a/b_i)` = diagonal `𝔽_3^×`; same for d = 3 | image `k^×` only | R07 |
| `K_1(A_d,I_d) = 0` attributions | d = 2 char p and char 0; d = 3 p odd, p = 2; char 0 | Thm A q = 1: `⊕_{m≥1} W_mΩ^{1−2m} = 0`; GRW `⊕Ω^{1−2m} = 0`; §5.3 r = 0: m′ = 1, `cyc_d(1) = 0`, `W_0 = 0`; p = 2: `k^{cyc_d(1)} = 0`; §5.4 empty sum | 0 everywhere | R07 |
| §4.3 Check, K_0(A_d) | d = 2, 3 | `K_1(k) ⊕ K_1(B_d) → K_1(k^d)` onto (a = 1, `b_i = c_i^{−1}`); `ℤ ⊕ ℤ^d → ℤ^d` kernel ℤ | `K_0(A_d) = ℤ` | R07 pattern |
| §5.3 printed p = 2 witness | d = 3, r = 0: m′ = 3, 5, 9; d = 2 | `k²`, `k⁶`, `k^{0+2+56}` (`cyc_3(9) = (510−6)/9 = 56`); d = 2: `cyc_2(odd) = 0`, finite | infinite for d ≥ 3, hence "d ≥ 3" | R07 |
| §4.1 Check K₂ | k = 𝔽_p, ℚ | Thm A q = 2: `W_1Ω⁰ = k`; GRW: `Ω⁰ = k` | k | R07 |
| §5.2 Check q = 1 unit part | k = 𝔽_p[s] | `A^× = A ∩ (k[x]^× × k[y]^×) = k^×` (k reduced) | trivial relative units | R07 |
| §1.1 conductor | (2,3), (2,5), (3,4) | Frobenius numbers 1, 3, 5; `(a−1)(b−1)` = 2, 4, 6; 2 = 2, 4 = 2·2, 6 = 3+3 | true | R08 |

## Checks run

**Elaboration.** `lake env lean packages/RefinedTraceMethodsPartII/Suggested.lean`, run from the content checkout: three warnings `declaration uses 'sorry'` (lines 62, 70, 78) and nothing else. No `TauCeti.*` import, so nothing had to be built.

**Signatures.** A scratch file holding the whole `Suggested.lean` plus `#check @name` for all six declarations and for `frobeniusNumber_pair` elaborated as follows.

```text
cuspCount : ℕ → ℕ → ℕ → ℕ
cuspTruncationSet : ℕ → ℕ → ℕ → Set ℕ
cuspCoprimeSet : ℕ → ℕ → ℕ → Set ℕ
@ncard_cuspTruncationSet : ∀ {a b : ℕ}, 2 ≤ a → 2 ≤ b → a.Coprime b → ∀ (r : ℕ), 2 * (cuspTruncationSet a b r).ncard + 2 = (a + 1) * (b + 1) + 2 * r * a * b
@ncard_cuspCoprimeSet : ∀ {a b : ℕ}, 2 ≤ a → 2 ≤ b → a.Coprime b → ∀ (r : ℕ), 2 * (cuspCoprimeSet a b r).ncard = (2 * r + 1) * (a - 1) * (b - 1)
card_noCyclicRepetition : ∀ (d : ℕ) {m : ℕ}, 1 ≤ m → ↑{w | ∀ (i : Fin m), w i ≠ w ((finRotate m) i)}.card = (↑d - 1) ^ m + (-1) ^ m * (↑d - 1)
@frobeniusNumber_pair : ∀ {m n : ℕ}, m.Coprime n → 1 < m → 1 < n → FrobeniusNumber (m * n - m - n) {m, n}
```

Each type agrees with its README statement (§§1.1, 1.4). No binder was lost and no declaration changed; only the module docstring did.

**Dependency check.**

```text
depcheck: 246 roadmaps, 2253 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The new supplier citations are RefinedTraceMethods §§2.13, 2.16, PrismaticCohomologyPartIII §§6.16, 6.24 and SchemeKTheoryOperations §5.2. All three roadmaps were already suppliers, and all are earlier in the merge order.

**Citation resolver.** `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name found nowhere.

**Cited sections checked at their heads.** RefinedTraceMethods §2.13 states `π_0TR(A;p) ≅ W(A)` compatibly with F, and genuine TC as `Eq(id, F)` on TR. §2.16 is the genuine–Nikolaus–Scholze comparison. PrismaticCohomologyPartIII §6.16 states `ℤ_p(i) ≃ WΩ^i_log[−i]` for smooth algebras over a perfect field. §6.24 states weight 0 is `RΓ_ét(−;ℤ_p)` for p-complete rings and weight 1 is `RΓ_ét(G_m)^∧[−1]` for quasisyntomic rings. §7.0 states `gr^nTC ≃ ℤ_p(n)[2n]`.

**Ownership.** No new object is introduced; the repairs cite existing owners. The sections above were read at the heads of the open pull requests of RefinedTraceMethods and PrismaticCohomologyPartIII.

## Gate failures

None were listed for this round.

## For the maintainer

- No declaration name, section number or target id changed. Other roadmaps' citations of this roadmap are unaffected.
- New supplier contract items:
  - RefinedTraceMethods §2.13: TR of a commutative ring with `π_0 = W(A)`, and genuine TC as `Eq(id, F)`.
  - PrismaticCohomologyPartIII §§6.16 and 6.24.
  - Both roadmaps keep those sections with those statements at their current heads.
- `sources.toml` gained locators only:
  - akn24 Corollary 6.4, cited for Scope and ownership.
  - akn-delta Remark 2.3.
  - the hesselholt-axes introduction (Dennis–Krusemeyer and Geller–Reid–Weibel values), cited for the Layer 4 Examples.
- No source text was requested, and `needs-references.toml` was not written.
