# Review of FiniteGroupExtensionSplitting (pull request #1774 at d6c35a0)

**Verdict:** accepted

Scope: the roadmap folder `TauCetiRoadmap/FiniteGroupExtensionSplitting/` (README.md, Suggested.lean, metadata.toml) at d6c35a0f. The pull request changes nothing outside this folder (`git diff --stat origin/main...HEAD` excluding the folder is empty). The worker's gate at this head passes every check (`build=0`, `depcheck=0`, `imports=0`, `readme-ids-missing=0`, `stray-files=0`, `outside-folder=0`). `lake env lean TauCetiRoadmap/FiniteGroupExtensionSplitting/Suggested.lean`: exit 0, five `declaration uses 'sorry'` warnings, nothing else. Dependency check: `depcheck: 205 roadmaps, 1651 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line; the roadmap is in the merge order (line 374) and its only suppliers are Mathlib and Tau Ceti. Pins: Mathlib f6090c70, Tau Ceti 358314d4 (lake-manifest and `.lake/packages` agree). This is a full review: the folder changed by 167 lines since b8324aa.

**Previous review (r3 at b8324aa), finding by finding.**

- R01 (P2, §2.1 applied §1.5 to an unnormalized crossed map): repaired. §2.1 now says "The kernels of `T_t c` and `T_{t'} c` are not in general conjugate by `a`: §1.5 is a statement about normalized crossed maps" (README.md lines 415–418), and §2.3 states the normalized form, "`(T_{t'} c) ^ e = (T_t c) ^ e * δ_{a ^ e}` … `ker ((T_{t'} c) ^ e) = a ^ e (ker ((T_t c) ^ e)) a ^ (−e)`" with the coprimality in force and the remark that `ker (T ^ e) = ker T` since `e` is prime to `|N|` (lines 470–477). I recomputed: `(c * δ_a) ^ e = c ^ e * δ_a ^ e` pointwise in abelian `N`, and `δ_a ^ e (g) = (g • a) ^ e * a ^ (−e) = δ_{a ^ e} (g)`; both powers are normalized (`n ^ (e [G:H]) = n`), so §1.5 applies; `x ^ e = 1 ⇒ x = 1` for `x ∈ N` because `gcd(e, |N|) = 1`. On the witness `S₃`, `H = A₃`, `t'(s̄) = (2 3)`, `a = (1 3 2)`, `e = 2`: `a ^ 2 = (1 2 3)`, `(1 2 3) ⟨(1 2)⟩ (1 2 3)⁻¹ = ⟨(2 3)⟩ = ker (T_{t'} c)`, as the new §2.1 and §2.3 Checks say (lines 439–445, 482–485).
- R02 (P3, permutation convention): repaired. Conventions line 57–59 fixes `(f * g) x = f (g x)` with `(1 2 3) * (1 2) = (1 3)` and `(1 2) * (1 2 3) = (2 3)` (both closed by `decide` on `Perm (Fin 3)` in my scratch file); line 205 now has `(1 3) = (1 2 3) * (1 2)` and line 318 `c_K ((1 3)) = (1 2 3)`.
- R03 (P3, the untwisted-sum Check): repaired. Line 436–438: "would send every element of `S₃` to `1` … so its kernel `S₃` is not a complement", with the three products `n * n² = 1`, `n² * n = 1`, `1 * 1` (recomputed below).
- R04 (P3, non-normal `S₃ ≤ S₄`): repaired, and the replacement is correct: lines 347–355 take `N = A₄ ⊴ S₄`, `K = ⟨(1 2)⟩`, observe that the dictionary of §1.3 does not use commutativity, and give the witness `g = (1 2 3)`, `h = (1 2 4)` for which the reversed order fails. I recomputed: `c_K (h h') = n₁ (k₁ • n₂) = (h • n₂) n₁` holds for any `N` since `h • n₂ = n₁ (k₁ • n₂) n₁⁻¹`; `g * h = (1 3)(2 4)`, `h * g = (1 4)(2 3)`, so `g h ≠ h g` and `c_K g * (g • c_K h) = g (g h g⁻¹) ≠ g h`.
- R05 (P3, three citation slips): repaired. `IsPGroup.exists_card_eq` (line 102 and 629; `Mathlib/GroupTheory/PGroup.lean` line 121, an alias of `iff_card`); `[G' : f(H)] = [G : H]` (line 106; `Subgroup.index_map_eq`, `Index.lean` line 335); the restriction of the action is now the pinned instance `MulDistribMulAction ↥H M` of `Mathlib/Algebra/Group/Subgroup/Actions.lean` (line 66) with `Subgroup.smul_def` (line 34, `rfl`), cited at lines 109–111 and 276–286 instead of being defined.
- R06 (P3, unused `[Finite G]`): repaired. Both `exists_complement_iff_crossedProjection` (Suggested.lean line 85) and `exists_complement_iff_cohomologyClass_eq_zero` (line 120) no longer carry `[Finite G]`; Conventions lines 51–54 say where finiteness is assumed (§§2.1–2.4, §2.7, Layer 3), and §1.3 and §2.6 say "any group `G`".
- R07 (P3, three Checks): repaired. §2.6's separating pair is now `D₈` versus `Q₈` over `C₄` with the inversion action and `H²(C₂, C₄) ≅ ℤ/2` (lines 564–571; I recomputed `C₄^{C₂} = {0, 2}`, `(1 + τ) C₄ = 0`); §3.2's dropped-stability Check now says the conclusion is false and names the two complements `⟨y⟩ × C₃`, `⟨x y⟩ × C₃` moved by `A` (lines 674–679); §0.2's `C₄` Check says "isomorphic to it after identifying …, this is not a `GroupExtension.Equiv`" (lines 241–247).

## R01 (P3) — one factorisation in the §2.1 transfer Check names the wrong factors

Location: README.md line 435, "Then `T_t c (s * n) = (s • n²) * 1 = n`".

Claim: the value `n` is right, but neither factor is `1`. For `γ = s * n`, the word at the coset `1̄` is `γ * t (γ⁻¹ • 1̄) = s n s = n²` and the word at `s̄` is `s⁻¹ * γ * t (γ⁻¹ • s̄) = n` (the same two words the next sentence uses for the untwisted product, `n² * n = 1`). Their translates are `1 • n² = n²` and `s • n = n²`.

Witness: `T_t c (s n) = n² * n² = n⁴ = n`, with `s • n = (1 2)(1 2 3)(1 2) = (1 3 2) = n²`.

Repair: "Then `T_t c (s * n) = n² * (s • n) = n² * n² = n`".

## R02 (P3) — `G : Type` is needed in §2.5–§2.7, not in §2.6 alone

Location: README.md line 525 ("This is the one place where `G : Type` is required") and Conventions lines 54–56 ("Every statement is universe-polymorphic except the cohomological comparison of §2.6").

Claim: the class of the quotient extension is defined in §2.5 and used in §2.6 and §2.7; §2.7's restriction formula and its Bézout argument live in `groupCohomology (Rep.ofMulDistribMulAction (G ⧸ N) N) 2`, and the Tau Ceti lemmas it cites are stated for `{k G : Type u}` with `k = ℤ` (`TauCeti/RepresentationTheory/Homological/GroupCohomology/Corestriction.lean` line 167, `Sylow.lean` line 44), so `G ⧸ N : Type`.

Witness: `TauCeti.FactorSet.cohomologyClass` has `variable {G M : Type}` (`TauCeti/GroupTheory/GroupExtension/Cohomology.lean` line 94); `Rep ℤ (G ⧸ N)` forces `G ⧸ N : Type`.

Repair: in Conventions, "except §§2.5–2.7, stated for `G : Type` because …"; in §2.5, "This, and its uses in §2.6 and §2.7, are the places where `G : Type` is required". The Lean file is unaffected (only §2.6 is stated there).

## R03 (P3) — two citation slips

- README.md lines 575–576 (§2.7): "`QuotientGroup.quotientMapSubgroupOfOfLe` is injective here". At the pin (`Mathlib/GroupTheory/QuotientGroup/Basic.lean` line 179) that map goes `A ⧸ A'.subgroupOf A →* B ⧸ B'.subgroupOf B` for subgroups `A ≤ B`, so with `B = ⊤` it lands in `⊤ ⧸ N.subgroupOf ⊤`, not in `G ⧸ N`. The map into `G ⧸ N` whose kernel is trivial because `N.subgroupOf H = N.comap H.subtype` is `QuotientGroup.map (N.subgroupOf H) N H.subtype (le_refl _)` (`QuotientGroup/Defs.lean` line 309). Cite that one (or compose with the isomorphism `⊤ ⧸ N.subgroupOf ⊤ ≃* G ⧸ N`).
- README.md line 93: "`Subgroup.IsComplement'.index_eq_card` … `[G : N] = |D|`". At the pin (`Complement.lean` line 642) `IsComplement'.index_eq_card (h : IsComplement' H K) : K.index = Nat.card H`, that is `[G : D] = |N|` for `N.IsComplement' D`, which is the form §3.2 uses ("Its index is `|N|`"); `[G : N] = |D|` is `h.symm.index_eq_card` (`IsComplement'.symm`, line 79). Write `[G : D] = |N|`, or cite the symmetric form.

## Verified sound

**Gate, build, form.** Gate at d6c35a0: every check passes. Elaboration of Suggested.lean: only the five sorry warnings. Imports: `import Mathlib` and `TauCeti.GroupTheory.GroupExtension.FactorSetOfSection`, `….Cohomology`, both at the pin; `module` header; no `set_option`, no `lemma`, no sorry'd data, no `#eval`; module docstring in the required form naming the five headlines and the `G : Type` restriction; `theorem` throughout; one `abbrev` with a tactic body (the descent proof), one `def` with a real body, one proved theorem. All nine Lean names occur in the README at their targets (`conjugationAction` §1.1, `quotientExtension` §0.2, `quotientConjugationAction` and `quotientExtension_inducesAction` §2.5, the five headlines at §1.3, §2.4, §2.6, §3.1, §3.2). Signatures: `#check @name` on a scratch copy for the four definitions/proved theorem matches the worker's `signatures.md`, and the five headline types in that file match the source; every hypothesis the README states is in the elaborated type (`[Finite G]` on §2.4, §3.1; `[Finite A] [Finite W]`, `p ≠ q`, `IsPGroup q A`, `IsPGroup p N`, `hstable` on §3.2; `N.Normal`, `IsMulCommutative N` everywhere; no `Finite` on §1.3, §2.6). Generality agrees with the README.

**Padding probe.** Each of the five sorried theorems tried with `first | simp [*] | infer_instance | rfl | exact?` on a scratch copy: all five fail (the §1.3 statement is left as an unsolved goal after `simp`, the other four report that `exact?` cannot close the goal). None restates a definition, mirrors a Check or computes a value.

**Convention witnesses (closed on the scratch copy).** `((g • n : N) : G) = g * n * g⁻¹` for `conjugationAction N` and `(((mk g : G ⧸ N) • n : N) : G) = g * n * g⁻¹` for `quotientConjugationAction N`, both by `rfl`; `(1 2 3) * (1 2) = (1 3)` and `(1 2) * (1 2 3) = (2 3)` on `Perm (Fin 3)` by `decide`. Mathlib's `IsMulCocycle₁ f` is `f (g * h) = g • f h * f g` (`LowDegree.lean` line 625) and `IsMulCoboundary₁ f` is `∃ x, ∀ g, g • x / x = f g` (line 677); Conventions lines 63–67 agree. Tau Ceti's `lWord U t u γ = (t u)⁻¹ * γ * t (γ⁻¹ • u)` (`TransversalWord.lean` line 71), `transversalDiff U t t' u = (t u)⁻¹ * t' u` (line 144), `cochainsCor1_changeTransversal`: `cor_{t'} f = cor_t f + d0 (∑ v, t v • f (transversalDiff v))` (`Corestriction/Basic.lean` line 366), `cochainsCor1_res`: `cor_t (c|_U) = U.index • c + d0 (∑ u, c (t u))` (line 385); README lines 72–74, 413–415, 425–426 agree.

**Adversarial table.**

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 local ↔ global, `H = ⊤` | `N` normal, `N ⊓ K = ⊥`, `N ⊔ K = ⊤` | `↑(K ⊔ N) = K * N` (`Subgroup.mul_normal`, Pointwise.lean 300); `isComplement'_of_disjoint_and_mul_eq_univ`; converse `.disjoint`, `.sup_eq_top` | true | none |
| §0.1 Check 1 | `S₃`, `(1 3)` | `(1 2 3) * (1 2) = (1 3)`, `(1 3 2) * (1 2) = (2 3)` (decide) | README right | none |
| §0.1 `|H| = |N| * |K|`, infinite case | `H` infinite | `Nat.card` of an infinite set is `0`; `N` or `K` infinite, product `0` | true | none |
| §0.1 restriction / failure | `A₄`, `D = ⟨(1 2 3)⟩`, `H = V₄` / `SL(2,3)`, `H = Q₈` | `D ⊓ V₄ = ⊥` / every order-4 subgroup of `Q₈` contains `−1` | as README | none |
| §0.2 splitting ↔ complement | `s : G ⧸ N →* G` | `N ⊓ range s = ⊥`, `g = (g (s (mk g))⁻¹) s (mk g)`; `mk'` bijective on `D` | bijection | none |
| §0.2 Check 1 | `C₄` over `C₂` | `GroupExtension.Equiv` fixes `N`, `G` (Defs.lean 155); transport along a group isomorphism | as README | none |
| §1.1 witness | `A₄`, `g = (1 2 3)`, `n = (1 2)(3 4)` | `g n g⁻¹ = (1 4)(2 3)`, `g⁻¹ n g = (1 3)(2 4)` | matches `rfl` witness | none |
| §1.1 restricted action | `h ∈ H` | `Subgroup.smul_def : h • m = (h : G) • m` (Actions.lean 34, `rfl`) | citation right | none |
| §1.2 crossed identity, any `N` | `h = n₁ k₁`, `h' = n₂ k₂` | `h h' = n₁ (k₁ • n₂) (k₁ k₂)`; `h • n₂ = n₁ (k₁ • n₂) n₁⁻¹`; `(h • n₂) n₁ = n₁ (k₁ • n₂)` | true without commutativity | none |
| §1.2 Check 1 | `S₃`, `K = ⟨(1 2)⟩` | `c_K (1 3) = (1 2 3)`; `(1 2)(1 2 3) = (2 3) = (1 3 2) (1 2)`, `(1 2) • (1 2 3) = (1 3 2)` | as README | none |
| §1.2 Check 2 | `A₄`, `K = ⟨(1 2 3)⟩` | `(1 2 3)(1 2)(3 4) = (1 3 4) = (1 4)(2 3) · (1 2 3)` | `c = (1 4)(2 3)` | none |
| §1.3 kernel is a complement | normalized `c` | `c 1 = 1`; `c h⁻¹ = (h⁻¹ • c h)⁻¹`; `c (n⁻¹ h) = (n⁻¹ • n) n⁻¹ = 1`, `n = c h` | true, no finiteness | none |
| §1.3 Check 1 | `S₃`, `c (1 3) = 1` | forces `c = c_{⟨(1 3)⟩}`, `c (1 2) = (1 2)(1 3) = (1 3 2) ≠ (1 2 3)` | not crossed | none |
| §1.3 Check 2 | `C₄`, generator `x` | `c (x²) = (c x)² = 1 ≠ x²` | none | none |
| §1.3 Check 4 | `S₄`, `N = A₄`, `g = (1 2 3)`, `h = (1 2 4)` | `g h = (1 3)(2 4)`, `h g = (1 4)(2 3)`; `c_K g (g • c_K h) = g² h g⁻¹ ≠ g h` | reversed order fails | none |
| §1.4 `c^g` | `x, y ∈ g H g⁻¹`, `n ∈ N` | `c^g (x y) = x • c^g y * c^g x`; `c^g n = g • (g⁻¹ n g) = n`; wrong formula gives `(1 3)(2 4) ≠ n` | crossed, normalized | none |
| §1.5 kernel formula | `d ∈ ker c`, `u = d • a` | `c (a d a⁻¹) = u⁻¹ a`, `δ_a (a d a⁻¹) = u a⁻¹`, product `1`; `δ_a n = 1` on `N` | true | none |
| §1.5 Check 1 | `S₃`, `a = (1 2 3)` | `a ⟨(1 2)⟩ a⁻¹ = ⟨(2 3)⟩` | as README | none |
| §2.1 Check 1 | `H = G`, `t 1 = 1` | `lWord = g`, `T_t c = c` | true | none |
| §2.1 Check 2, `s` and `n` | `S₃`, `H = A₃`, `c = id` | words for `s`: `1, 1`, `T s = 1`; words for `n`: `n, (1 3 2)`, translates `n, n`, `T n = n²` | as README | none |
| §2.1 Check 2, `s n` | same | words `s n s = n²` (coset `1̄`), `n` (coset `s̄`); translates `n²`, `s • n = n²`; `T (s n) = n⁴ = n` | value right, factors misdescribed | R01 |
| §2.1 Check 2, untwisted | same | `n · n² = 1`, `n² · n = 1`, `1 · 1 = 1` | kernel `S₃` | none |
| §2.1 Check 3, `t'` | `t' (s̄) = (2 3)` | words for `s`: `n, n²`, translates `n, (2 3) • n² = n`, `T' s = n²`; words for `s n`: `1, 1`, `T' (s n) = 1`; `T' (1 3) = n² · (2 3) • n = n⁴ = n`; `ker T' = ⟨(2 3)⟩`; `a = s • n = n²`; `a ⟨(1 2)⟩ a⁻¹ = ⟨(1 3)⟩` | as README | none |
| §2.2 value on `N` | `n ∈ N ≤ H`, `u = mk g` | `g⁻¹ n⁻¹ g ∈ N ≤ H` so `n⁻¹ • u = u`; `t u • ((t u)⁻¹ n t u) = n`; product `n ^ [G:H]` | true | none |
| §2.3 powers and normalization | `e [G:H] ≡ 1 (mod |N|)` | `(c δ_a)^e = c^e δ_{a^e}` in abelian `N`; `n ^ (e [G:H]) = n`; `x^e = 1 ⇒ x = 1` as `gcd(e, |N|) = 1` | true | none |
| §2.3, `|N| = 1` | `N = ⊥` | `e = 0`, `(T)^0 = 1`, kernel `G` complement of `⊥` | true | none |
| §2.3 Check 2 | `e = 2`, `a = (1 3 2)` | `a² = (1 2 3)`; `(1 2 3) ⟨(1 2)⟩ (1 2 3)⁻¹ = ⟨(2 3)⟩ = ker T'` | as README | none |
| §2.3 Checks 3–4 | `[G:H] = 3, |N| = 2` / `2, 3` / `2, 2` | `e = 1` / `e = 2` / none | as README | none |
| §2.4 Gaschütz, degenerate | `N = ⊥`; `H = ⊤`; `H = ⊥` | `Coprime _ 1`, `D = ⊤`; §0.1; `N ⊔ K = ⊥ ⇒ N = ⊥` | true | none |
| §2.4 negative controls | `C₄`, `H = C₂`; `C₄ × C₃`, `H = C₄`; `SL(2,3) ∗ C₄` | `gcd(2, 2) ≠ 1`; no local complement in `C₄` (a complement of order 6 meets `C₄` in one); `(i z)² = i² z² = 1`, `i z ∉ Q₈` gives the local complement, sambale2023 line 41 the absence of a global one | consistent | none |
| §2.5 descent | `n, m ∈ N` | `n m n⁻¹ = m`, `N ≤ ker conjNormal`; the `abbrev` elaborates | true | none |
| §2.5 Check 3 | `C₄` over `C₂`, section `0 ↦ 0, 1 ↦ 1` | `α (1, 1) = 1 + 1 − σ(0) = 2` | non-zero class | none |
| §2.6 comparison | any `G : Type` | `factorSetToGroupExtensionEquiv : α.groupExtension.Equiv S` (FactorSetOfSection.lean 320); `nonempty_splitting_iff_cohomologyClass_eq_zero` (Cohomology.lean 319); neither has a finiteness hypothesis | true | none |
| §2.6 Check 4 | `D₈`, `Q₈` over `C₄`, inversion | `C₄^{C₂} = {0, 2}`, `(1 + τ) C₄ = 0`, `H² ≅ ℤ/2`; reflection of order 2 outside `C₄` / `−1` the only involution of `Q₈` | separating | none |
| §2.7 Bézout step | `S₃`, `H = A₃` / `C₄`, `H = C₂` / `A₄`, `H = V₄` | `2x = 0, 3x = 0 ⇒ x = 0` / `2x = 0, 2x = 0`, nothing / `3x = 0, 4x = 0 ⇒ x = 0` | as README | none |
| §2.7 index step | `mk' N` | surjective, `ker = N ≤ H` ⇒ `(H.map (mk' N)).index = H.index` | true | none |
| §2.7 quotient identification | `H ⧸ N.subgroupOf H → G ⧸ N` | pinned `quotientMapSubgroupOfOfLe` lands in `B ⧸ B'.subgroupOf B`; `QuotientGroup.map (N.subgroupOf H) N H.subtype` lands in `G ⧸ N` | citation slip | R03 |
| §2.7 universe | `Rep ℤ (G ⧸ N)` | Tau Ceti `index_nsmul_eq_zero_of_map_eq_zero` has `{k G : Type u}`; `k = ℤ : Type` | `G : Type` in §2.7 too | R02 |
| §3.1 → | `D` complement, `P` Sylow | `N ≤ P` (`le_sylow_of_normal`); `D ⊓ P` local complement | true | none |
| §3.1 ← | `[G:P]` | `p ∤ [G:P]` (`not_dvd_index`, needs `FiniteIndex`, from `Finite G`); `|N| = p^j` (`exists_card_eq`) ⇒ coprime; §2.4 with `H = P` | true | none |
| §3.1, `p ∤ |G|` | `P = ⊥` | `N ≤ ⊥`, `D = ⊤`, `K = ⊥` | both sides true | none |
| §3.1 Checks | `A₄` / `SL(2,3)` / `S₃` / `N = ⊥` / `C₆` | `K = ⊥, D = C₃` / both false / `K = ⊥, D = ⟨(1 2)⟩` / `D = ⊤, K = P` / `N = ⊤ ≰ C₂`, `D = ⊥` | as README | none |
| §3.2 route | `W ⋊ A` | `|W ⋊ A| = |W| q^k`; `inl P` Sylow `p`; `inr a · inl n · (inr a)⁻¹ = inl (a • n)` with `a⁻¹ ∈ A` for the converse inclusion; `[W ⋊ A : D₀] = |N| = p^j` (`index_eq_card`); Sylow `q` of `D₀` is Sylow `q` of `W ⋊ A`; `inr A ≤ x Q x⁻¹ ≤ D₁`; `D = (D₁ ⊓ inl W).comap inl` | sound | none |
| §3.2, `A` infinite | not admitted (`[Finite A]`) | the route needs `W ⋊ A` finite | hypothesis used | none |
| §3.2 Check 2, `p = q` | `V₄`, `N = ⟨x⟩`, `A = C₂` | complements `⟨y⟩, ⟨x y⟩` swapped | hypothesis needed | none |
| §3.2 Check 3 | `S₃`, `A = ⟨(1 2)⟩` | `P = A₃`, `K = ⊥`, `D = ⟨(1 2)⟩` stable | true | none |
| §3.2 Check 5 | `V₄ × C₃`, `A = C₃` | order-6 subgroups not containing `x`: `⟨y⟩ × C₃`, `⟨x y⟩ × C₃`; `A` moves `⟨y⟩ ↦ ⟨x y⟩ ↦ ⟨x⟩`; `a • x = y ∉ N` | conclusion false, stability needed | none |
| §3.3 internal form | `S₄`, `W = A₄`, `N = V₄`, `A = ⟨(1 2 3)⟩` | action `normalizerMonoidHom ∘ inclusion` (Centralizer.lean 195), `a • w = a w a⁻¹`; `D = ⟨(1 2 3)⟩` | true | none |
| §3.3 Check 2 | `A = ⟨(1 2)⟩` | `(1 2)(1 2 3)(1 2) = (1 3 2)`, `⟨(1 2 3)⟩` stable | holds by accident, as README says | none |
| Conventions witness | `A₄`, `D = ⟨(1 2 3)⟩` | `(1 2 3)(1 2)(3 4) = (1 3 4) = (1 4)(2 3) (1 2 3)`; `(1 2 3) • (1 2)(3 4) = (1 4)(2 3)` | consistent | none |

**Library declarations opened at the pins** (Mathlib f6090c70, Tau Ceti 358314d4; file and line). Mathlib: `Subgroup.IsComplement'.sup_eq_top` (Complement.lean 636), `.disjoint` (639), `.index_eq_card` (642), `.card_mul` (alias 664), `.symm` (79), `isComplement'_of_disjoint_and_mul_eq_univ` (666), `isComplement'_iff_card_mul_and_disjoint` (678); `GroupExtension.Equiv` (GroupExtension/Defs.lean 155), `Section` (240), `Splitting` (270), `conjAct` (136), `inl_conjAct_comm` (147), `surjInvRightHom` (Basic.lean 39); `SemidirectProduct.mulEquivSubgroup` (SemidirectProduct.lean 238), `SemidirectProduct.card` (311); `IsPGroup.exists_card_eq` (PGroup.lean 121); `Sylow.not_dvd_index` (Sylow.lean 491), `Sylow.card_eq_multiplicity` (833); `Subgroup.index_map_eq` (Index.lean 335), `card_mul_index` (293), `finiteIndex_of_finite` (764); `exists_right_complement'_of_coprime` (SchurZassenhaus.lean 277); `IsMulCocycle₁` (LowDegree.lean 625), `IsMulCoboundary₁` (677), `IsMulCoboundary₂` (681); `Rep.ofMulDistribMulAction` (Rep/Basic.lean 379); `MulAut.conjNormal` (ConjAct.lean 247), `conjNormal_apply` (251); `MulDistribMulAction.compHom` (Algebra/Group/Action/Hom.lean); the subgroup instance `MulDistribMulAction S α` (Subgroup/Actions.lean 66) and `Subgroup.smul_def` (34); `Submonoid.mulDistribMulAction` (Submonoid/DistribMulAction.lean 39); `Subgroup.normalizerMonoidHom` (Subgroup/Centralizer.lean 195); `QuotientGroup.quotientMapSubgroupOfOfLe` (QuotientGroup/Basic.lean 179), `QuotientGroup.map` (Defs.lean 309), `ker_mk'` (142), `mk'_surjective` (100); `Subgroup.mul_normal` (Subgroup/Pointwise.lean 300); `ZMod.unitOfCoprime` (ZMod/Basic.lean 794); `pow_card_eq_one'` (OrderOfElement.lean 1217); `groupCohomology.map f φ n` with `φ : res f A ⟶ B` (GroupCohomology/Functoriality.lean 141); `disjoint_iff` (Order/Disjoint.lean 162); no `DistribMulAction _ (Additive _)` instance in `Algebra/Group/Action/TypeTags.lean` (grep), as §1.1 says. Tau Ceti: `cochainsCor1_changeTransversal` (ContCohomology/Corestriction/Basic.lean 366), `cochainsCor1_res` (385); `lWord` (TransversalWord.lean 71), `lWord_def` (73), `transversal_mul_lWord` (80), `lWord_of_mem_of_normal` (119, `[U.Normal]`), `lWord_mem` (134), `transversalDiff` (144); `transfer_eq_prod_lWord` (Transfer.lean 178), `transfer_eq_prod_of_bijective` (67), `transfer_comp` (116), `transfer_transfer` (146); `InducesAction` (FactorSetOfSection.lean 135), `conjActOfSection_apply` (194), `inducesAction_iff_conjActOfSection_eq` (211), `factorSet` (262), `factorSetToGroupExtensionEquiv` (320); `FactorSet.cohomologyClass` (GroupExtension/Cohomology.lean 120, `{G M : Type}` at 94), `nsmul_cohomologyClass_eq_zero_iff` (157), `nonempty_splitting_iff_cohomologyClass_eq_zero` (319), `cohomologyClass_factorSet_eq` (363); `map_subtype_id_comp_corestriction` (GroupCohomology/Corestriction.lean 153), `index_nsmul_eq_zero_of_map_eq_zero` (167); `eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero` (GroupCohomology/Sylow.lean 56, `[Finite G]`, `k G : Type u`); `isComplement'_alternatingGroup_stabilizer_perm_fin_three` (Perm/FinThree/Basic.lean 271); `isEmpty_splitting_zmodFourExtension` (GroupExtension/ZModFour.lean 93).

**Sources (seeded sample: §0.1, §0.2, §1.1–§1.4, §2.1–§2.6, §3.1–§3.3).** gaschutz1952 (GDZ, OCR of an image-only scan; printed page = file page + 91): the definitions of "zerspaltet" and "zerfällt" at lines 178–198 (printed p. 96); Satz 1 at lines 318–320 (printed p. 99, marker page 8): for an intermediate extension with index prime to the kernel's order, the group splits over the abelian kernel iff the intermediate group does (second sentence), and line 338 says the converse needs no coprimality; the 2. Reduktionssatz at lines 348–350 (printed p. 100): the group splits over the abelian `p`-group iff a Sylow `p`-subgroup does (second sentence). Both support §2.4 and §3.1 as written, with the kernel abelian and the group finite. sambale2023 (arXiv 2303.00254v2): Theorem 1 at lines 30–31 (abelian `N ⊴ G`, `N ≤ H ≤ G`, complement in `H`, `gcd(|N|, |G:H|) = 1` ⇒ complement in `G`), Baer's counterexample `SL(2,3) ∗ C₄`, `N = Q₈`, `H = Q₈ ∗ C₄` a Sylow 2-subgroup at lines 32–34 and 41, the Sylow consequence at lines 74–75 (for every Sylow subgroup `P/N` of `G/N` at once; the `p`-group case of §3.1 is its specialisation, the other primes being Schur–Zassenhaus). The targets without a mathematical locator (the dictionaries of §§0.1–1.5, the transfer computations of §§2.1–2.3, the comparison of §§2.5–2.6, the internal form §3.3) are the roadmap's own and were checked against the pinned declarations and the computations in the table. The README flags no locator as unverified.

**Duplication and ownership.** Gaschütz's theorem, the Sylow detection and the invariant-complement theorem are in neither pinned library (grep "Gasch": only the generator-lifting lemma, its profinite form and its module analogue). `roadmaps grep` over main and the 440 open pull requests (index of 2026-11-03): no roadmap other than this one states a complement-existence theorem for an abelian normal subgroup beyond Schur–Zassenhaus; "invariant complement" and "stable complement" match nothing else. LocalFiniteGroupTheory (open draft, read via `roadmaps show`) cites Schur–Zassenhaus and Burnside from Mathlib and plans normal `p`-complements, not Gaschütz; FiniteGroupInvariants cites Gaschütz only for the cyclicity criterion; ProfiniteProPGroups owns the profinite lifting lemma, a different theorem. OddOrderTheorem (open pull request by the same author) cites this roadmap's S0–S3 as the owner of the Gaschütz criterion: a consumer, and the README keeps the S0–S3 aliases at the layer headings. Ownership against open pull requests whose files the brief does not give was checked through `roadmaps grep` only.

**Declared gaps.** None declared; no `design/plan.json` is readable, and the README states no `gap:` contract. Nothing is cited as supplied that does not exist where cited.

## Not verifiable

- The two Axiom CFSG Lean files under References are formalisations given as provenance, not mathematical sources; not read.
- gaschutz1952 beyond lines 164–260 and 300–370 was not read in full; the displayed formulas of the OCR are garbled, so the definitions were read from the prose and the figure captions, not from the displays.

## Source issues

- none
