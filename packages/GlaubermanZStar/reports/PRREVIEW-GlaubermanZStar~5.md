# Review of GlaubermanZStar (pull request #1778 at 1fd7422)

**Verdict:** needs changes

Incremental re-review of the 14 lines changed since d20ee28: the three places that cite OddOrderTheorem F2 (the Scope bullet, the `From TauCetiRoadmap.OddOrderTheorem` contract, and the `*Needs:*` line of §2.4) now name the sections of F2 they consume, §2.3 for the general Dade isometry and §2.4 for its comparison with ordinary induction when every complement is trivial. Both resolve at the head of OddOrderTheorem's pull request and say what that roadmap states there; the repair introduced no new problem. The one finding of the previous report lies in §2.5, which the diff does not touch, and it is still open, so the verdict is unchanged from what the rules require for a carried finding.

## R01 (P3) — §2.5 step 2 picks an integer `a` prime to `|G|` with two congruences without saying why such an `a` exists

**Location.** `TauCetiRoadmap/GlaubermanZStar/README.md` lines 656–657: "for `v ∈ O(C)` and `a` prime to `|G|` with `a ≡ 1 (mod 4)` and `a ≡ −1 (mod |O(C)|)`". Not repaired since d20ee28: the passage is unchanged.

**Claim.** An integer `a` prime to `|G|` with `a ≡ 1 (mod 4)` and `a ≡ −1 (mod |O(C)|)` exists, and step 1 then gives `ψᵢ((u v)^a) = ψᵢ(u v)`.

**Witness.** The two congruences fix `a` only modulo `4 |O(C)|`, and `|G|` may have odd prime divisors outside `|O(C)|`: in `SL(2, 3)` with `C = ⟨i⟩`, `O(C) = 1`, the solution `a = 9` satisfies both congruences and `gcd(9, 24) = 3`, so step 1 (stated for `a` prime to `|G|`) does not apply to it. The claim is true, but by an input the route does not name: the Chinese remainder theorem over the pairwise coprime moduli `4`, `|O(C)|` and the product of the remaining primes dividing `|G|`.

**Repair.** Write the choice as "`a ≡ 1 (mod 4)`, `a ≡ −1 (mod |O(C)|)` and `a ≡ 1` modulo every other prime dividing `|G|`, which exists by the Chinese remainder theorem" and add Mathlib `Nat.chineseRemainder` (`Mathlib/Data/Nat/ModEq.lean` line 472 at the pin) to the `*Needs:*` line of §2.5; or state the conclusion of step 1 as "`ψᵢ(g^a) = ψᵢ(g)` for every `a` prime to `orderOf g`" (an integer-valued character is fixed by the Galois automorphism `ζ ↦ ζ^a` of `ℚ(ζ_{orderOf g})`) and take `a` prime to `4 |O(C)|`, which `orderOf (u v)` divides. Tested on `SL(2, 3)`: with the congruence modulo `3` added, `a ≡ 1 (mod 12)` works, and `a = 13` is prime to `24`.

## Previous findings

- R01 — not repaired: "for `v ∈ O(C)` and `a` prime to `|G|` with `a ≡ 1 (mod 4)` and `a ≡ −1 (mod |O(C)|)`" (lines 656–657), the same text as at d20ee28; the diff touches only the OddOrderTheorem citations.

## Verified sound

**The changed passages.** Three passages changed, all citations of OddOrderTheorem F2; nothing else in the folder changed, `Suggested.lean` is byte-identical to the file the previous review read, and nothing outside the folder changed (`git diff --stat origin/main...HEAD` outside the folder: empty).

- Scope lines 61–64: "OddOrderTheorem F2 owns the general Dade isometry (its §2.3) and its comparison with ordinary induction when every complement `H_a` is trivial, on `TauCeti.IsTISet` data (its §2.4)". Resolved at the head of OddOrderTheorem's pull request (967729b5): `## Layer 2: Dade isometries and coherent families (F2)` (its README line 377), `### 2.3 The Dade isometry` (line 456: `IsDadeExtension`, `exists_dadeExtension`, uniqueness, Dade reciprocity, restriction, the expansion as inductions) and `### 2.4 Trivial complements and ordinary induction` (line 487: trivial complements ⇔ `TauCeti.IsTISet A L` with `N_G(A) = L`; `isDadeExtension_eq_indClassFunction`; induction an isometry on `CF(L, A)` and `(Ind f) a = f a`). Its `## Downstream consumers` (lines 1117–1119) names this roadmap's Brauer–Suzuki case as the consumer of §2.4 and says Layers 0–1 and 3–6 are not consumed, which is what the Scope bullet says.
- Contract lines 173–177: "F2, Layer 2 §2.4: for a subgroup `L ≤ G`, an `L`-invariant subset `A ⊆ L ∖ {1}` whose `G`-fusion is controlled by `L`, with every complement `H_a` trivial (`C_G(a) ≤ L` for `a ∈ A`), the Dade map … equals ordinary induction, and induction is then an isometry". Checked clause by clause against OddOrderTheorem §2.2 (line 416: `DadeDatum L A H` = `A ⊆ L \ {1}` `L`-invariant, `L` controls `G`-fusion in `A`, `H a ⊴ C_G(a)` with `(H a) · C_L(a) = C_G(a)` and `H a ⊓ C_L(a) = ⊥`, coprimality) and §2.4. The paraphrase "every `H_a` trivial" ⇔ "`C_G(a) ≤ L`": with `H a = ⊥` the product clause reads `C_L(a) = C_G(a)`, that is `C_G(a) ≤ L`; conversely `C_G(a) ≤ L` forces `C_L(a) = C_G(a)`, and §2.2's uniqueness of the complement makes `H a = ⊥` the only choice; the coprimality clause is vacuous for `H a = ⊥`. Instance with nontrivial complement for contrast: `G = C₃ × S₃`, `L = S₃`, `a = (1 2)`: `C_G(a) = C₃ × ⟨(1 2)⟩ ⊄ L` and `H a = C₃ ≠ ⊥`, as §2.2's third Check says.
- §2.4 `*Needs:*` line 571: "OddOrderTheorem F2 §2.4" resolves as above; the other items are unchanged (InductionRestriction Layer 2 and CharacterTheory §4.4 on main, ModularCharactersAndBlocks M8 at its head, as the previous review resolved them; `TauCeti.ClassFunction.characterPairing` opened at the pin below).
- The data §2.3 feeds into that contract (lines 495–520, unchanged but depended on): `A = K = {k ∈ C | 4 ∣ orderOf k}`, `L = H = N_G(U)`. `K ⊆ H ∖ {1}` (`K ⊆ C ≤ H`, `4 ∤ 1`); `K` is `H`-invariant (`C ⊴ H`, conjugation preserves orders); `C_G(k) ≤ C_G(k₂) ≤ C_G(U) = C ≤ H` (`k₂` a power of `k`, `U ≤ ⟨k₂⟩` since `⟨k₂⟩` lies in a Sylow `2`-subgroup `X^c` of `C` with `c ∈ C` centralising `U`, whose unique subgroup of order four is `U^c = U`); fusion control from the trivial-intersection property (`k' = g k g⁻¹ ∈ K ∩ g K g⁻¹` forces `g ∈ H`); `N_G(K) = H`; `K ≠ ∅` (`u ∈ K`). So "the Dade data of OddOrderTheorem F2 hold with `L = H`, `A = K` and every `H_a = 1`" (line 520) is exactly §2.2's datum with `H a = ⊥`, and §2.4's two consequences used in this roadmap's §2.4 bullets (lines 559–563: induction an isometry; induced functions agree with the inflated functions on `K`) are the two §2.4 of OddOrderTheorem states.

**Gate and build.** The gate at this head: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (the worker's run adds `build=0`). The merge order now lists GlaubermanZStar (line 378), after ModularCharactersAndBlocks (line 89); OddOrderTheorem and LocalFiniteGroupTheory are open pull requests adding new folders, consumed as such. The movable dependency check: `depcheck: 234 roadmaps, 2161 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. `lake env lean` on `TauCetiRoadmap/GlaubermanZStar/Suggested.lean` from the worktree: four `declaration uses sorry` warnings (lines 38, 48, 59, 82), nothing else. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` only. No `set_option`, no `lemma`, no sorried data (`InPrincipalTwoBlock` has a real body), no LaTeX, no pull-request number, no process word in the changed lines.

**Signatures.** `#check @name` for the five declarations on a scratch copy of the file, elaborated once: `glauberman_zStar`, `glauberman_zStar_sylow`, `brauer_suzuki` and `principalBlock_involution_section_constancy` carry `[Finite G]`, and their elaborated types match Conventions lines 79–92, §2.5 lines 694–697, §3.1 lines 746–748 and §3.2 lines 779–781 of the README; `InPrincipalTwoBlock` elaborates to `{G : Type u} → [Group G] → Ideal (integralClosure ℤ ℂ) → (G → ℂ) → Prop`, without `[Finite G]`, which its type does not mention and the constancy theorem carries. Nothing changed; the file is unchanged since the previous review.

**One-tactic probes** on the same scratch copy: `simp` on `glauberman_zStar`, `glauberman_zStar_sylow`, `brauer_suzuki`: "simp made no progress" each; `simp [InPrincipalTwoBlock] at *` on the constancy theorem: unsolved goal `χ (s * ↑↑v) = χ s`. No padding; `rfl` and `infer_instance` cannot apply to an existential or an equation of character values.

**Headline theorems.** The README names four (lines 11–13): Z* in isolated form, Z* in Sylow form, Brauer–Suzuki, principal-block section constancy; all four are in `Suggested.lean`, and the docstring says none is missing. Unchanged.

**Library declarations opened at the pins** (Mathlib `358314d`, Tau Ceti `f6090c7`): `TauCeti.ClassFunction.characterPairing` (`TauCeti/RepresentationTheory/CharacterTable/Pairing.lean` line 58: a `LinearMap.BilinForm k (ClassFunction k G)` under `[Fintype G]`, the normalized pairing the contract's "normalized pairing" means); `TauCeti.irreducibleCharacters` (`CharacterTable/Table.lean` line 119, the module `Suggested.lean` imports); `TauCeti.IsTISet` (`TauCeti/GroupTheory/TrivialIntersection.lean` line 194: `subset`, `conj_mem`, `disjoint_conj`); `TauCeti.characterPairing_ind_ind_of_isTISet` (`RepresentationTheory/Induction/TrivialIntersection.lean` line 144, hypotheses `[Fintype G]`, `IsUnit (Nat.card G : k)`, `IsTISubgroup`, as OddOrderTheorem §2.4 says when it explains why it proves the comparison without that hypothesis); `Subgroup.indClassFunction` (`Induction/ClassFunction.lean` line 456, needs `[S.FiniteIndex]`); `Nat.chineseRemainder` (`Mathlib/Data/Nat/ModEq.lean` line 472, type `n.Coprime m → (a b : ℕ) → {k // k ≡ a [MOD n] ∧ k ≡ b [MOD m]}`, the input R01's repair names). The previous review's list of pinned declarations is unchanged at the same pins.

**Ownership.** The change adds no object; the previous review's search (`roadmaps grep` over main and the open heads for "isolated involution", `glauberman_zStar`, `InPrincipalTwoBlock`, `Z*(G)`, `brauer_suzuki`: no hit outside this folder) stands, and the worker's citation check over main `c9a16a0` and the 454 open heads finds no cross-roadmap citation of this README nowhere; its three "Lean names found nowhere" are the `TauCetiRoadmap.RepresentationTheory.*` sub-roadmap folder names used as contract headings, not declarations.

**Adversarial table.** New rows first, with the values computed this round; the rows for statements the diff leaves untouched are carried from the r4 report and marked "(r4)".

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| OddOrderTheorem F2 §2.4 contract: trivial complements ⇔ `C_G(a) ≤ L` | `C₃ × S₃`, `L = S₃`, `a = (1 2)`; `S₃`, `L = ⟨(1 2)⟩` | `C_G(a) = C₃ × ⟨(1 2)⟩ ⊄ L`, `H a = C₃`; `C_G((1 2)) = L`, `H a = ⊥` | paraphrase correct both ways |
| §2.3 data are a Dade datum with `H_a = ⊥` | `SL(2, 3)`, `U = ⟨i⟩`, `H = Q₈`, `K = {i, −i}` | class of `i` has `24/4 = 6` elements so `C_G(i) = ⟨i⟩ ≤ Q₈`; `j i j⁻¹ = −i ∈ K`; `N_G(K) = N_G(⟨i⟩)` of order `24/3 = 8` = `Q₈`; `u = i ∈ K ≠ ∅` | every §2.2 clause holds |
| `(Ind f) a = f a` and the isometry (contract's two consequences) | `SL(2, 3)`, `f = 1 + ε_X − ε₂ − ε₃` on `Q₈`, `Ind f = 1 + λ + λ̄ − ψ₃` | `(Ind f)(i) = 1 + 1 + 1 − (−1) = 4 = f(i)`; `‖Ind f‖² = 1 + 1 + 1 + 1 = 4 = ‖f‖²`; `(Ind f)(−1) = 1 + 1 + 1 − 3 = 0 = f(−1)` | holds |
| negative control: fusion not controlled by `L` | `S₃`, `L = A₃`, `A = A₃^#`, `f = ω − ω²` | `‖f‖² = (3 + 3)/3 = 2`; `Ind ω = Ind ω² = ρ` so `Ind f = 0`, norm `0` | induction not an isometry; the contract's fusion clause excludes it |
| Scope bullet: F2 §2.3 is the general Dade isometry, §2.4 the comparison | OddOrderTheorem head 967729b5 | headings at its lines 456, 487; consumer line 1117 names §2.4 | citations resolve |
| `orderOf t = 2 ↔ t ≠ 1 ∧ t² = 1` (§0.1) | pin | `orderOf_eq_prime_iff`: `x ^ p = 1 ∧ x ≠ 1` | holds (r4) |
| isolation (§0.1) | `S₃` `(12)`; `A₅` `(12)(34)`; `D₈` `s`; `S₄` `(12)(34)` | `(13)`, `(23)` do not commute; `(234)` gives `(13)(24)` commuting; `r s r⁻¹ = s r²`; `(13)(24)` commutes | holds; wrong model excluded (r4) |
| dihedral formula (§0.3) | `r = ab` | `r^(-j) a r^j = a r^(2j)`; `D₈`, `j = 1`: `s r²` | holds (r4) |
| `k` even ⇒ not isolated | `D₈`, `k = 2` | `a r² = s r²` commutes with `s`, conjugate via `j = 1` | holds (r4) |
| `k` odd, `b ∼ a` ⇒ not isolated | `GL(2,3)`, `a = diag(1,−1)`, `r` of order `6`, `k = 3` | `b = (−1 −1; 0 1)`, `b² = 1`, `det b = −1`; `a r³ = diag(−1,1)` commutes, conjugate to `a` | holds (r4) |
| | `D₁₂` alone | `a r³` in the class of `b = a r` | conjugate to `b`, not to `a` (r4) |
| Lemma 3.1 (3), (5) | `m` odd / `2k`, `k` even / `k` odd | conjugate; `k` even bullet; `k` odd bullet | odd for `w ∼ t`; `2·odd` for `w ≁ t` (r4) |
| fusion in overgroups (§0.2) | `S₄`, `t = (12)`, `H = ⟨(12),(34)⟩` | `(34) ∈ H` not `H`-conjugate | negative control holds (r4) |
| descent (§0.2) | `M = ⟨x,t⟩N`, `M/N` of order `≤ 4` | `M = SN`, `n⁻¹xn ∈ S`, weak closure | holds (r4) |
| lifting through odd `N` | `x = t^g`, `[x,t] = 1`, `x̄ = t̄` | `xt ∈ N` of order `≤ 2` in odd order | `x = t` (r4) |
| product conjugacy | `S₃ × C₂` / `S₄` | `((23),1)` conjugates; `(12)(34)` vs `1` | holds / fails without isolation (r4) |
| §0.4 (i) ⇔ (ii) | `S₄`, `(12)(34)`; `S₃`, `(12)` | `(14)(23) ∈ S`; `t^G ∩ S = {t}` | neither / both (r4) |
| §1.1 (a)–(d) | `F₂₀`, `t = c²`; `D₈` | `O = C₅`, `G/O ≅ C₄`; `O = 1`, `⁅r,s⁆ = r²` | `t ∈ Z* ∖ Z`; `s ∉ Z*` (r4) |
| (c) ⇒ (d) / (d) ⇒ (c) | `g = n c` / `O(G)⟨t⟩` | `⁅n c, t⁆ = ⁅n, t⁆ ∈ O(G)`; Sylow of order `2` conjugate by `n ∈ O(G)` | holds (r4) |
| §1.2 lifting / last bullet | `D₈`, `N = ⟨r²⟩`; `S₄`, `H = V₄`; `S₃ × C₂`, `H = G` | `s̄` central in `V₄`, `s ∉ Z*`; `t ∈ Z*(V₄)`, `t ∉ Z*(S₄)`; conjugates of `t̄` in `Z(H̄)` | odd order and isolation needed (r4) |
| §1.3 reductions 1–5 | Waldecker 4.4 (1)–(2), 4.2 (1)–(2) | `O(G) = 1`, `G = ⟨t^G⟩`, `X = ⟨w⟩ × O(X)`, `O(X) ≤ O(G) = 1` | matches `waldecker2013` lines 963–985 (r4) |
| §2.1 | `QuaternionGroup (2^(n−2))` | order `2^n`; `a 1` of order `2^(n−1)`; `xa i` of order `4`; `(xa 0)⁻¹(a 1)(xa 0) = (a 1)⁻¹` | holds; `n = 2` cyclic, excluded (r4) |
| §2.2 | `F₂₀`, `C₆`, `A₅` | complements `C₅`, `C₃`; `A₅` Sylow `V₄` | holds (r4) |
| §2.3 `C_G(k) ≤ H`, `K` T.I. | `k ∈ K ∩ gKg⁻¹` | `U, gUg⁻¹ ≤ ⟨k₂⟩` cyclic | `g ∈ H` (r4) |
| §2.3 products of involutions | `x ≠ y`, `xy` of order `2k` | `⟨x,(xy)^k⟩ ≅ V₄` in a quaternion `2`-group | impossible; `𝔽₃² ⋊ Q₈`: `(v,−1)(w,−1) = (v−w,1)` (r4) |
| §2.3 Checks | `Q₈`, `SL(2,3)`, `𝔽₃² ⋊ Q₈`, `K' = C ∖ {1}` | `K = {i,−i}`, `O(C) = 1`; `{i,−1,−i} ∩ {j,−1,−j} = {−1}` | holds; wrong model excluded (r4) |
| §2.4 characters of `S` | `m = n − 1` | `4 + 4(2^(m−1) − 1) = 2^n`; `χ_j(z) = 2(−1)^j` | holds (r4) |
| `β₂` on `Q₁₆`, `f` on `Q₈` | values at `1, z, xa i, a 1` / `1, −1, i, j, k` | `0, 0, 0, 2`, norm `3`; `0, 0, 4, 0, 0`, norm `4`; `β₁(z) = 4` | holds (r4) |
| `‖Ind 1_H‖²` | `H = Q₈ ⊴ SL(2,3)` | `3` double cosets `≠ 1` | wrong model excluded (r4) |
| structure-constant formula (§2.5) | `S₃`, transpositions, `g = (123)` | `(9/6)(1 + 1 + 0) = 3` pairs | holds (r4) |
| `Φ` vanishing | `Q₈` | `Φ(1) = 8`, `Φ(z) = 4 − 4 = 0`, `Φ(i) = 0` | holds (r4) |
| three relations | `eᵢ²/dᵢ = dᵢ − 2fᵢ + fᵢ²/dᵢ` | `∑εᵢfᵢ²/dᵢ = 0` | holds (r4) |
| `4 ∣ fᵢ` | `u ∼ u⁻¹` in `S` | `dim E_{−1}(z) = 2 dim E_i(u)` | holds (r4) |
| `fᵢ > 0` needs simplicity | `SL(2,7)`, Sylow `Q₁₆` | relations satisfiable with `z ∈ ker ψᵢ` (`1 + 7 − 8 = 0`) | hypothesis needed, as the Check says (r4) |
| case `n ≥ 4` | `ε₁f₁ + ε₂f₂ = 0`, `fᵢ > 0` | `ε₂ = −ε₁`, `f₁ = f₂`, `d₁ = d₂`, `1 = 0` | contradiction holds (r4) |
| case `n = 3` step 1 | `σψ₁ = ψ₂` | `f₃ = 2f₁`, `ε₃ = −ε₁`, `d₃ = 2d₁`, `1 = 0` | holds (r4) |
| step 2 sums | `|H| = 8|O(C)|`, `f = 4` on `K` | `∑_K ψᵢ = 2|O(C)|εᵢ`; `a₁` odd; `∑(aᵥ − εᵢ)² = (m − 1)|O(C)|` | holds (r4) |
| step 2 bound | `m ≥ 3` | `|G|(m + 1)/4 + dᵢ² + εᵢdᵢ > |G|` | `m = 1`, `ψᵢ(u) = εᵢ` (r4) |
| step 2 choice of `a` | `SL(2,3)`, `O(C) = 1`, `a = 9`; `a = 13` | `9 ≡ 1 (4)`, `gcd(9, 24) = 3`; `13 ≡ 1 (12)`, `gcd(13, 24) = 1` | third congruence needed (R01, recomputed) |
| step 3 transfer | orbit sizes `1, 2, 4` on `G/S` | sizes `2, 4` give `z, 1 ∈ [S,S]`; odd count of size `1`; `u^{odd}[S,S] ≠ 1` | all six elements of order four conjugate (r4) |
| step 4 | `S = Q₈` | `(dᵢ + eᵢ + 6εᵢ)/8 ∈ ℤ`, `dᵢ ≡ εᵢ + 2cᵢ (mod 4)` | holds (r4) |
| step 5 | `∑εᵢwᵢ = 0`, `gcd = 1` | one `wᵢ` even; `ε₂d₂ + ε₃d₃ ≡ 0` vs `≡ −2 (mod 4)` | contradiction holds (r4) |
| negative control | `PSL(2,7)`: `(3,6,8)`, `(−1,2,0)`, `(−,−,+)` | `1−3−6+8 = 0`, `1+1−2+0 = 0`, `1−1/3−2/3+0 = 0`; `d₃ = 8 ≢ 1`; `χ₈(4A) = 0 ≠ ε₃` | three relations alone insufficient (r4) |
| `InPrincipalTwoBlock` | trivial; `C₂` sign; `S₃` degree `2`; `S₃` sign; `3 ∈ m`; `m = ⊤` | `z = |Cl g|`; `−2 ∈ m`; `−3 ∉ m`; `−6 ∈ m`; `−3 ∈ m`; everything | `IsMaximal`, `2 ∈ m` needed (r4) |
| constancy (§3.2) | `P = ⟨s⟩`, `H = C_G(s)` | `b^G = B₀ ⇒ b = B₀(H)`; `φ(v) = φ(1)`; `χ(sv) = χ(s)` | holds; `C₆`, `S₃ × C₂` Checks `−1 = −1`, `−2 ≠ 1` (r4) |
| §4.1 package | `d = th`, order `2k`, `k` odd | `(th)² ∈ N`, `v = (th)^(k+1) ∈ N`, `μ = tw`, `μh = (th)^(1−k) ∈ N` | holds (r4) |
| §4.2 identity | `S₃` `3`-cycles; `S₄` `χ₃` | `C² = 2 + C`, `ω = −1`; `−3 ≠ 1` | holds; fails without isolation (r4) |
| §4.3 alternative | `S₃ × C₂`, `sgn ⊗ 1` | `χ(t) = χ(1) = 1`, `⟨t^G⟩ ≠ G` | `⟨t^G⟩ = G` needed (r4) |
| §4.4 contradiction | `(s,t)`, `(s,1)`; `S₃ × C₂` | nontrivial terms `0`, trivial `2`; `1 − 1 − 1 + 1 = 0` | holds (r4) |
| `glauberman_zStar` / `brauer_suzuki` | `C₂, S₃, Q₈, V₄, A₅` / `Q₈, SL(2,3), SL(2,5), 𝔽₃² ⋊ Q₈` | `N = ⊥, A₃, ⊥, ⊥`; `A₅` fails both; `N = ⊥, ⊥, ⊥, 𝔽₃²` | holds; negative control (r4) |
| §5.2 | `S₃`, `sgn` | `χ(t) = −1 = −χ(1)` | holds (r4) |

**Hypothesis audit.** Unchanged from the previous report: `hm`, `h2` needed; `hn : 3 ≤ n` needed (`QuaternionGroup 1` is cyclic); `hs : orderOf s = 2` not needed for the truth of the constancy theorem but used by every consumer; no change.

**Sources at their locators.** The diff cites no source; the previous review's checks of `waldecker2013` (Chapter 1 lines 60–95; Theorem 2.19–2.20 lines 506–512; Lemma 3.1 lines 652–683; Hypothesis 4.1 lines 902–911; Lemmas 4.2 and 4.4 lines 916–985), `guralnick_tongviet_tracey2024` (Theorem 5.1 lines 789–834) and `axiommath_cfsg_example3` (stage lemmas at lines 743, 2207, 2280, 2510, 3392, 4106, main theorem 6695) stand, the cache files being unchanged.

## Not verifiable

- `brauer_suzuki1959`: the cached text (9 lines) is still the PMC "Preparing to download" placeholder while the board's manifest records it `certified`. Refetch attempts today into a scratch copy of the manifest: the DOI landing page (pnas.org) answers HTTP 403; the PMC article page is on a host the service places in no licence class. The theorem on p. 1757 (the paper's first page) is checked against Waldecker Theorem 2.20 (`waldecker2013` lines 510–512) and Chapter 1 (lines 79–82). The worker should refetch the PMC PDF when it answers, or record the entry `uncertified`; this is a manifest matter, not a README finding.
- Glauberman 1966 and Suzuki, *Group Theory II*, Example 3: settled `uncertified`; cited by locator, checked by computation and against the Apache-2.0 formalization's stage lemmas.
- Ownership against open pull requests: checked by the previous review's `roadmaps grep` over the open heads and the board's package index; the change adds no object.

## Source issues

- none
