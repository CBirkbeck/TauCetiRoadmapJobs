# Review of FiniteGroupExtensionSplitting (pull request #1774 at b8324aa)

**Verdict:** needs changes

Scope: the roadmap folder `TauCetiRoadmap/FiniteGroupExtensionSplitting/` (README.md, Suggested.lean, metadata.toml) at b8324aa8. The pull request changes nothing outside this folder (`git diff --stat origin/main...HEAD` excluding the folder is empty). The worker's gate at this head passes every check (`build=0`, `depcheck=0`, `readme-ids-missing=0`, `imports=0`). `lake env lean TauCetiRoadmap/FiniteGroupExtensionSplitting/Suggested.lean`: exit 0, five `declaration uses 'sorry'` warnings, nothing else. Dependency check: `depcheck: 205 roadmaps, 1652 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line; the roadmap is listed in the merge order (line 374) and its only suppliers are Mathlib and Tau Ceti. Pins of the worktree: Mathlib f6090c70, Tau Ceti 358314d4 (lake-manifest and `.lake/packages` agree).

**Previous review (r2 at ed4e3aa), finding by finding.**

- R01 (P1, non-existent Tau Ceti citations): repaired. Every Tau Ceti name in *Exact supplier contracts* now exists at the pin (file and line under *Verified sound*); the commit-pinned GitHub links to library files are gone; the quotient-level comparison is an owned target (§2.5, §2.6) built on `TauCeti.GroupExtension.factorSet` and `factorSetToGroupExtensionEquiv`.
- R02 (P2, promised interfaces without statements): repaired. Transport and restriction of local complements are stated in §0.1 (bullets "Restriction" and "Transport"), equivariance in §1.4 (`c^g x = g • c (g⁻¹ * x * g)` on `g H g⁻¹`, kernel `g (ker c) g⁻¹`, restriction to `N ≤ H' ≤ H`), the restriction formula in §2.7 (`groupCohomology.map (H.map (mk' N)).subtype (𝟙 _) 2`), the internal form in §3.3 with ambient group, `A ≤ W.normalizer`, `N ≤ W`, `P ≤ W` and the conclusion `a * d * a⁻¹ ∈ D`.
- R03 (P3, imports): repaired (`import Mathlib` plus two `TauCeti.GroupTheory.GroupExtension.*` modules that exist at the pin; gate `imports=0`).
- R04 (P3, README shape): repaired. Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–3 with `### k.n` prose targets, `*Needs:*` lines, API bullets, `**Checks.**` lists, `### Examples` and `### Dependencies` per layer, Downstream consumers, References with locators (gaschutz1952 Satz 1 p. 99; 2. Reduktionssatz p. 100; sambale2023 Theorem 1 and Section 1).
- R05 (P3, pull-request number and process language): repaired. No pull-request number, no process word (grep for "so far", "currently", "removed", "deferred", "optional", "pull request", `#NNNN`: nothing). The Axiom files remain only as provenance under References, as the repair allowed.
- R06 (P3, Lean form and README/Lean agreement): repaired. Module docstring in the required form, docstrings on every declaration, `/-! ## Layer k -/` comments, all nine Lean names occur in the README at their targets, the cohomological comparison is stated (for `G : Type`, said in the docstring and in Conventions).
- R07 (P3, additive conjugation module not a pinned instance): repaired. §1.1 defines `DistribMulAction G (Additive N)` as a target with its agreement with `Rep.ofMulDistribMulAction`; I confirmed at the pin that `Mathlib/Algebra/Group/Action/TypeTags.lean` has only `Additive.vadd` and `Additive.addAction` (acting side) and that no `DistribMulAction _ (Additive _)` instance exists in Mathlib.

## R01 (P2) — §2.1 applies §1.5 to a crossed map that is not normalized; the kernel formula fails

Location: README.md lines 383–386, "`T_{t'} c = T_t c * δ_a` with `a = ∏ v, t v • c (transversalDiff H t t' v)`, so by §1.5 the kernels of `T_t c` and `T_{t'} c` are conjugate by an element of `N`".

Claim: §1.5 (`ker (c * δ_a) = a (ker c) a⁻¹`) is stated and proved for a *normalized* crossed map, and its proof uses `c a⁻¹ = a⁻¹`. The crossed transfer `T_t c` is not normalized: by §2.2 its value on `n ∈ N` is `n ^ [G : H]`. Without normalization the computation of §1.5 gives `(c * δ_a)(a d a⁻¹) = (d • (a * (c a)⁻¹)) * (a * (c a)⁻¹)⁻¹` for `d ∈ ker c`, which is `1` only when `d` fixes `a * (c a)⁻¹`.

Witness (all products in Mathlib's `Equiv.Perm` convention `(f * g) x = f (g x)`, checked by `decide`): `G = S₃`, `H = N = A₃`, `c = id`, `n = (1 2 3)`, `s = (1 2)`, `t : 1 ↦ 1, s̄ ↦ s`, `t' : 1 ↦ 1, s̄ ↦ s * n = (2 3)`. Then `T_t c s = 1`, `T_t c n = n²`, `ker (T_t c) = ⟨(1 2)⟩` (the README's own Check). For `t'`: `lWord(1̄, s) = s * (s * n) = n`, `lWord(s̄, s) = (s * n)⁻¹ * s = n²`, so `T_{t'} c s = n * ((s * n) • n²) = n * n = n² ≠ 1`, and `T_{t'} c (s * n) = s • n² * n² = 1`: `ker (T_{t'} c) = ⟨(2 3)⟩`. The change-of-transversal element is `a = t s̄ • c (s⁻¹ * (s * n)) = s • n = n² = (1 3 2)`, and `a ⟨(1 2)⟩ a⁻¹ = ⟨(1 3)⟩ ≠ ⟨(2 3)⟩`. So `ker (T_{t'} c) ≠ a (ker T_t c) a⁻¹`.

Repair: make the claim after §2.3, for the normalized maps. Since `(T_{t'} c)^e = (T_t c)^e * δ_{a^e}` and both are normalized when `e * [G : H] ≡ 1 (mod |N|)`, §1.5 gives `ker ((T_{t'} c)^e) = a^e (ker ((T_t c)^e)) a^{-e}`; and `ker (T^e) = ker T` because `e` is prime to `|N|`. On the witness `e = 2`, `a^e = n`, and `n ⟨(1 2)⟩ n⁻¹ = ⟨(2 3)⟩ = ker (T_{t'} c)` (checked by `decide`). State it with the coprimality hypothesis, or delete the sentence (nothing in §2.4 uses it).

## R02 (P3) — two Checks multiply permutations in the opposite convention from the rest of the roadmap

Location: README.md line 193–194 ("the decomposition of `(1 3)` is `(1 3 2) * (1 2)`") and line 296 ("`c_K ((1 3)) = (1 3 2)`").

Claim: in Mathlib's `Equiv.Perm` convention, which the roadmap's other witnesses use, `(1 3 2) * (1 2) = (2 3)`, not `(1 3)`.

Witness: `decide` on `Perm (Fin 3)`: `swap 0 2 = c132 * swap 0 1` is false and `swap 0 2 = c123 * swap 0 1` is true. The §1.1 witness in `A₄` (`(1 2 3) • (1 2)(3 4) = (1 4)(2 3)`, `g⁻¹ * n * g = (1 3)(2 4)`), the §1.3 Check (a map with `c ((1 2)) = (1 2 3)`, `c ((1 3)) = 1` is not crossed: the crossed one has `c ((1 2)) = (1 3 2)`) and the §1.4/§1.5 Checks (`(1 2 3) ⟨(1 2)⟩ (1 2 3)⁻¹ = ⟨(2 3)⟩`) are all in Mathlib's convention, so the file disagrees with itself.

Repair: `(1 3) = (1 2 3) * (1 2)` and `c_K ((1 3)) = (1 2 3)` in both places, and one sentence under Conventions fixing `(f * g) x = f (g x)` for permutations.

## R03 (P3) — a §2.1 Check states wrong values for the wrong definition

Location: README.md lines 403–404, "A definition without the factor `t u •` would give `T_t c n = n * (1 3 2) = 1` and the kernel `A₃ ∪ ⟨s⟩`, not a subgroup."

Claim: on this instance the untwisted sum is the constant `1`, so its kernel is all of `S₃`.

Witness: with `c = id`, `t` as in the Check, the untwisted products are: for `n`, `n * (s⁻¹ * n * s) = n * n² = 1`; for `s`, `1 * 1 = 1`; for `s * n`, `lWord(1̄, s n) = s n s = n²` and `lWord(s̄, s n) = n`, product `1`; for `s * n²`, `n * n² = 1`. The kernel is `S₃`, a subgroup, and not a complement.

Repair: "would send every element of `S₃` to `1`, so its kernel `S₃` is not a complement".

## R04 (P3) — a §1.3 Check uses a non-normal subgroup

Location: README.md lines 324–325, "Dropping `IsMulCommutative`: in `S₃ ≤ S₄` with `N = S₃`, `H = S₄`".

Claim: `S₃` (a point stabilizer) is not normal in `S₄`, so the conjugation action `G → MulAut N` of §1.1 and the notion of crossed map are undefined on this instance.

Witness: `(1 4) (1 2) (1 4) = (2 4) ∉ S₃ = Stab(4)`.

Repair: take `N = A₄ ⊴ S₄` (or `N = Q₈` in `SL(2, 3) ∗ C₄`, the §2.4 instance) and say which step of §1.3 fails: `n⁻¹ • c h = c h` needs `c h` to commute with `n`.

## R05 (P3) — three citation slips

- README.md line 573 (§3.1 `*Needs:*`): `IsPGroup.card_eq_or_dvd` is cited for `|N| = p ^ j`. At the pin it states `Nat.card G = 1 ∨ p ∣ Nat.card G` (`Mathlib/GroupTheory/PGroup.lean` line 232); the statement needed is `IsPGroup.exists_card_eq : ∃ n, Nat.card G = p ^ n` (same file, line 121).
- README.md line 98: "`[f(H) : 1] = [G : H]` for `f` surjective with `ker f ≤ H`". `Subgroup.index_map_eq` (`Mathlib/GroupTheory/Index.lean` line 335) says `(H.map f).index = H.index`, that is `[G' : f(H)] = [G : H]`; `[f(H) : 1]` is the order of `f(H)`.
- README.md lines 260–262: "Prove that restricting the action to `H ≥ N` along `H.subtype` gives `MulDistribMulAction H N` with the same formula" is a definition the pin already has: `Submonoid.mulDistribMulAction` (`Mathlib/Algebra/Group/Submonoid/DistribMulAction.lean` line 39) restricts any `MulDistribMulAction G M` to a submonoid, hence to `↥H`. Cite it (and state the `smul` formula as an API bullet) instead of defining it.

## R06 (P3) — `[Finite G]` is unused in two headlines

Location: Suggested.lean line 85 (`exists_complement_iff_crossedProjection`) and line 120 (`exists_complement_iff_cohomologyClass_eq_zero`); README §1.3 and §2.6.

Claim: neither statement nor its route uses finiteness. The §1.3 dictionary (`ker c` is a subgroup, `N ⊓ ker c = ⊥`, `N ⊔ ker c = H`, `c_{ker c} = c`, `ker c_K = K`) is proved in the README with no counting; the §2.6 route uses `factorSetToGroupExtensionEquiv`, transport of splittings and `TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero`, none of which has a finiteness hypothesis at the pin (`TauCeti/GroupTheory/GroupExtension/Cohomology.lean` line 94: `{G M : Type} [Group G] [CommGroup M] [MulDistribMulAction G M]`).

Repair: drop `[Finite G]` from the two theorems (and from the README statements of §1.3 and §2.6), so that the dictionary and the comparison are stated at the generality the library supports. The roadmap's Conventions ("`G` is a finite group") then apply to Layers 2.1–2.4, 2.7 and 3 only; say so there.

## R07 (P3) — two Checks that do not discriminate, one misdescribed

- README.md lines 512–515 (§2.6 Check 4): "a comparison that forgot the quotient action (trivial action on `V₄`) would compute in `H²(C₃, V₄) = 0` for a different extension and could not distinguish the two". With `|C₃|` and `|V₄|` coprime, `H²(C₃, V₄) = 0` for every action, so the wrong-action computation returns the same answer (class zero, which is correct for `A₄`); the Check does not separate the wrong action from the right one. A separating pair with non-coprime orders: `D₈` over its `C₄` (inversion action; splits, complement a reflection) against `Q₈` over its `C₄` (same action; no complement, since `−1 ∈ C₄` is the only involution), both read in `H²(C₂, C₄)` for the inversion action.
- README.md lines 618–620 (§3.2 Check 5): "`N` is not `A`-stable and the conclusion is not even meaningful as stated". The conclusion `∃ D, N.IsComplement' D ∧ ∀ a d, d ∈ D → a • d ∈ D` is meaningful and false: the complements of `N = ⟨x⟩ × 1` in `V₄ × C₃` are `⟨y⟩ × C₃` and `⟨x y⟩ × C₃`, and the order-`3` automorphism of `V₄` permutes `⟨x⟩, ⟨y⟩, ⟨x y⟩` cyclically, so neither is `A`-stable. Say that, which makes it a genuine negative control for `A`-stability of `N`.
- README.md lines 229–231 (§0.2 Check 1): the quotient extension of `C₄` by `C₂` is "equivalent" to `zmodFourExtension` only after identifying kernel and quotient with `ZMod 2` and the middle group with `ZMod 4`; `GroupExtension.Equiv` at the pin fixes `N` and `G` (`Mathlib/GroupTheory/GroupExtension/Defs.lean` line 155). Say "isomorphic to it after these identifications".

## Verified sound

**Gate, build, form.** Gate at b8324aa: every check passes. Elaboration of Suggested.lean: only the five sorry warnings. Imports: `import Mathlib` and two `TauCeti.GroupTheory.GroupExtension.*` modules that exist at the pin; no `set_option`, no `lemma`, no sorry'd data, no `#eval`; module docstring in the required form; `theorem` throughout. All nine Lean names occur in the README (`conjugationAction` §1.1, `quotientConjugationAction` and `quotientExtension_inducesAction` §2.5, `quotientExtension` §0.2, the five theorems at §1.3, §2.4, §2.6, §3.1, §3.2). Signatures: `#check @name` on a scratch copy for all nine declarations agrees with the worker's file; `[Finite G]`, `N.Normal`, `IsMulCommutative N`, `[Finite A] [Finite W]`, `[Fact p.Prime] [Fact q.Prime]`, `p ≠ q`, `IsPGroup q A`, `IsPGroup p N` are all in the elaborated types; nothing lost. Generality agrees with the README (universe-polymorphic except §2.6 for `G : Type`, as the pinned `TauCeti.FactorSet.cohomologyClass` requires, `TauCeti/GroupTheory/GroupExtension/Cohomology.lean` line 94).

**Padding probe.** Each of the five sorried theorems tried with `first | simp [*] | infer_instance | rfl` on a scratch copy: all five fail to close. None restates a definition, mirrors a Check or computes a value. `quotientExtension_inducesAction` is proved in place, as the README says (§2.5 bullet).

**Convention witnesses (closed by `rfl` on the scratch copy).** `((g • n : N) : G) = g * n * g⁻¹` for `conjugationAction N`, and `(((mk g : G ⧸ N) • n : N) : G) = g * n * g⁻¹` for `quotientConjugationAction N`: both actions are left conjugation. Mathlib's `IsMulCocycle₁ f` is `f (g * h) = g • f h * f g` (`LowDegree.lean` line 625, context `[Mul G] [CommGroup M] [SMul G M]`) and `IsMulCoboundary₁ f` is `∃ x, ∀ g, g • x / x = f g` (line 677); Conventions lines 58–62 agree. Tau Ceti's `cochainsCor1` is `∑ u, t u • f (lWord U t u γ)` (Corestriction/Basic.lean line 256) with `lWord U t u γ = (t u)⁻¹ * γ * t (γ⁻¹ • u)` (TransversalWord.lean line 71); Conventions lines 67–69 agree. `d0 G M m g = g • m - m` (ContCohomology/LowDegree.lean line 185), so the additive correction terms of `cochainsCor1_changeTransversal` (line 366) and `cochainsCor1_res` (line 385) read multiplicatively as the README's `δ_a` with `a = ∏ v, t v • c (transversalDiff H t t' v)` and `a = ∏ u, c (t u)`.

**Adversarial table.**

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 local ↔ global for `H = ⊤` | `N` normal, `K` with `N ⊓ K = ⊥`, `N ⊔ K = ⊤` | `N ⊔ K = N * K` as sets (`Subgroup.mul_normal`); `isComplement'_of_disjoint_and_mul_eq_univ`; converse `IsComplement'.disjoint`, `.sup_eq_top` | true | none |
| §0.1 decomposition Check | `S₃`, `(1 3) = n * (1 2)` | Mathlib convention: `n = (1 3) * (1 2) = (1 2 3)`; `(1 3 2) * (1 2) = (2 3)` (decide) | README value wrong | R02 |
| §0.1 restriction `D ⊓ H` | `A₄`, `D = ⟨(1 2 3)⟩`, `H = V₄` | `D ⊓ V₄ = ⊥`, `V₄ ⊔ ⊥ = V₄` | local complement | none |
| §0.1 no local complement | `SL(2,3)`, `N = {±1}`, `H = Q₈` | order-4 subgroups of `Q₈`: `⟨i⟩, ⟨j⟩, ⟨k⟩`, each `∋ −1` | none | none |
| §0.2 splitting ↔ complement | `s : G ⧸ N →* G` section | `N ⊓ range s = ⊥` (`mk (s x) = x`), `g = (g * (s (mk g))⁻¹) * s (mk g)`; converse: `mk'` bijective on `D` | bijection | none |
| §0.2, `N = ⊤` | any `G` | `G ⧸ ⊤` trivial, one splitting, range `⊥` | true | none |
| §1.1 witness | `A₄`, `g = (1 2 3)`, `n = (1 2)(3 4)` | `g n g⁻¹ = (1 4)(2 3)` (relabel by `g`), `g⁻¹ n g = (1 3)(2 4)` | consistent with `rfl` witness | none |
| §1.1 additive instance absent at pin | grep | `TypeTags.lean` has `Additive.vadd`, `Additive.addAction` only; no `DistribMulAction _ (Additive _)` instance | README claim true | none |
| §1.1 restriction to `H` | — | `Submonoid.mulDistribMulAction` at the pin | duplicate | R05 |
| §1.2 crossed identity | `h = n₁ k₁`, `h' = n₂ k₂` | `h h' = n₁ (k₁ • n₂) (k₁ k₂)`; `h • n₂ = k₁ • n₂` (abelian); `c(h h') = c h * (h • c h') = (h • c h') * c h` | Mathlib convention | none |
| §1.2, `N` non-abelian | same | `h • n₂ = n₁ (k₁ • n₂) n₁⁻¹ ≠ k₁ • n₂` in general | `IsMulCommutative` in scope | none |
| §1.3 kernel is a complement | `c` normalized crossed | `c 1 = 1`; `c h⁻¹ = (h⁻¹ • c h)⁻¹`; `c (n⁻¹ h) = (n⁻¹ • n) n⁻¹ = 1` with `n = c h` | true | none |
| §1.3 without `[Finite G]` | any group | no counting used | hypothesis unused | R06 |
| §1.3 Check, `C₄` over `C₂` | generator `x` | `c (x²) = (x • c x) (c x) = (c x)² = 1 ≠ x²` | no crossed map | none |
| §1.3 Check 4 | `S₃ ≤ S₄` | `(1 4)(1 2)(1 4) = (2 4) ∉ S₃` | not normal | R04 |
| §1.4 `c^g` | `x, y ∈ g H g⁻¹` | `c^g (x y) = g • [(g⁻¹ x g) • c(g⁻¹ y g) * c(g⁻¹ x g)] = x • c^g y * c^g x`; `c^g n = g • (g⁻¹ n g) = n` | crossed, normalized | none |
| §1.4 wrong formula | `A₄`, `g = (1 2 3)`, `n = (1 2)(3 4)` | `g⁻¹ n g = (1 3)(2 4) ≠ n` | fails normalization | none |
| §1.5 kernel formula, normalized `c` | `d ∈ ker c`, `u = d • a` | `c(a d a⁻¹) = (a • u⁻¹) a = u⁻¹ a`; `δ_a(a d a⁻¹) = u a⁻¹`; product `1` | true | none |
| §1.5 formula, non-normalized `c` | `S₃`, `c = T_t id`, `a = (1 3 2)` | `(c δ_a)(a s a⁻¹) = (c δ_a)((2 3)) = n * n = n² ≠ 1` | fails | R01 |
| §2.1 `T_t c` crossed | — | `cochainsCor1_isCocycle₁` (line 309) on `Additive N` | true | none |
| §2.1 Check 2 | `S₃`, `H = A₃`, `c = id`, `t(s̄) = s` | `T s = 1`, `T n = n * (s • n²) = n²`, `T (s n) = (s • n²) * 1 = n`, `ker T = ⟨s⟩` | README values right | none |
| §2.1 Check 2, untwisted sum | same | `T₀ n = n * n² = 1`, `T₀ s = 1`, `T₀ (s n) = n² * n = 1`, `T₀ (s n²) = n * n² = 1` | kernel `S₃`, not `A₃ ∪ ⟨s⟩` | R03 |
| §2.1 change of transversal | `t'(s̄) = s n = (2 3)` | `T' s = n * ((s n) • n²) = n²`, `T' (s n) = 1`, `ker T' = ⟨(2 3)⟩`; `a = s • n = n²`; `a ⟨s⟩ a⁻¹ = ⟨(1 3)⟩` (decide) | kernels not conjugate by `a` | R01 |
| §2.1 repaired claim | same, `e = 2` | `a^e = n`, `n ⟨s⟩ n⁻¹ = ⟨(2 3)⟩ = ker T'` (decide) | true | R01 repair |
| §2.2 value on `N` | `n ∈ N ≤ H`, `u = mk g` | `n⁻¹ • u = u` since `g⁻¹ n⁻¹ g ∈ N ≤ H`; `t u • ((t u)⁻¹ n t u) = n`; product `n ^ [G:H]` | true; `lWord_of_mem_of_normal` needs `[U.Normal]` so new, as said | none |
| §2.3 inverse exponent | `[G:H] = 2`, `|N| = 3` / `|N| = 2` | `e = 2` (`4 ≡ 1 mod 3`) / none | as README | none |
| §2.4 Gaschütz | `N = ⊥`; `H = ⊤`; `S₃` | `Coprime _ 1`, `D = ⊤`; §0.1; `D = ⟨(1 2)⟩` | true | none |
| §2.4 negative controls | `C₄`, `H = C₂`; `C₄ × C₃`, `H = C₄`; `SL(2,3) ∗ C₄` | index 2 not coprime to 2; no local complement in `C₄`; sambale2023 lines 34–41 | consistent | none |
| §2.5 descent of conjugation | `n, m ∈ N` | `n m n⁻¹ = m` (abelian) ⇒ `N ≤ ker conjNormal`; Lean proof elaborates | true | none |
| §2.5 Check, `C₄` over `C₂` | section `0 ↦ 0, 1 ↦ 1` | `α(1,1) = 1 + 1 − 0 = 2 ∈ ZMod 4` | non-zero class | none |
| §2.6 comparison | `σ` normalized section | `factorSetToGroupExtensionEquiv σ hσ hact : α.groupExtension.Equiv (quotientExtension N)`; splittings transport along `Equiv` (`rightHom_map`); `nonempty_splitting_iff_cohomologyClass_eq_zero` (line 319) | true for any `G : Type` | R06 (`Finite` unused) |
| §2.6 Check 4 | `A₄` over `V₄` | `gcd(3, 4) = 1` ⇒ `H²(C₃, V₄) = 0` for every action | non-discriminating | R07 |
| §2.7 Bézout step | `S₃`, `H = A₃` / `C₄`, `H = C₂` / `A₄`, `H = V₄` | `2x = 0, 3x = 0` ⇒ `x = 0` / `2x = 0, 2x = 0`, nothing / `3x = 0, 4x = 0` ⇒ `x = 0` | as README | none |
| §2.7 index step | `mk' N` | surjective, `ker = N ≤ H` ⇒ `Subgroup.index_map_eq` applies; `[H.FiniteIndex]` from `Finite G` | true | none |
| §3.1 → | `D` complement, `P` Sylow | `N ≤ P` (`le_sylow_of_normal`); `x ∈ P`, `x = n d` ⇒ `d = n⁻¹ x ∈ D ⊓ P` | true | none |
| §3.1 ← | `[G:P]` | `p ∤ [G:P]` (`not_dvd_index`), `|N| = p^j` (`exists_card_eq`) ⇒ coprime; §2.4 with `H = P` | true | R05 (lemma name) |
| §3.1 Checks | `A₄`/`SL(2,3)`/`S₃`/`N = ⊥`/`C₆` | `K = ⊥, D = C₃` / both false (no order-12 subgroup; `−1` in every order-4 subgroup of `Q₈`) / `K = ⊥, D = ⟨(1 2)⟩` / `D = ⊤, K = P` / `N = ⊤ ≰ C₂`, right side empty, `D = ⊥` | all as README | none |
| §3.2 route | `W ⋊ A` | `|W ⋊ A| = |W| q^k`; `inl P` Sylow `p`; `inl N` normal (`inr a · inl n · (inr a)⁻¹ = inl (a • n)`); `[W ⋊ A : D₀] = p^j` ⇒ Sylow `q` of `D₀` is Sylow `q` of `W ⋊ A`; conjugate `D₀` to contain `inr A`; `D = (D₁ ⊓ inl W).comap inl` complement and `A`-stable | sound | none |
| §3.2, `p = q` | `V₄`, `N = ⟨x⟩`, `A = C₂: y ↦ x y` | complements `⟨y⟩, ⟨x y⟩`, swapped | hypothesis needed | none |
| §3.2, no coprimality | `S₃`, `N = A₃`, `A = ⟨(1 2)⟩` | `P = A₃`, `K = ⊥`, `D = ⟨(1 2)⟩` stable | true | none |
| §3.2 Check 5 | `V₄ × C₃`, `N = ⟨x⟩ × 1`, `A = C₃` | complements `⟨y⟩ × C₃`, `⟨x y⟩ × C₃`, permuted | conclusion false, not "meaningless" | R07 |
| §3.3 internal form | `S₄`, `W = A₄`, `N = V₄`, `A = ⟨(1 2 3)⟩` | action via `normalizerMonoidHom ∘ inclusion`; `D = ⟨(1 2 3)⟩` | true | none |
| §3.3, `p = q` instance | `A = ⟨(1 2)⟩` | `(1 2)(1 2 3)(1 2) = (1 3 2)`, `⟨(1 2 3)⟩` stable | holds by accident, as README says | none |

**Library declarations opened at the pins** (Mathlib f6090c70, Tau Ceti 358314d4; file and line). Mathlib: `Subgroup.IsComplement'` and `isComplement'_of_disjoint_and_mul_eq_univ` (Complement.lean 666), `IsComplement'.sup_eq_top` (636), `.disjoint` (639), `.index_eq_card` (642), `.card_mul` (alias, 664), `isComplement'_iff_card_mul_and_disjoint` (678); `GroupExtension` (GroupExtension/Defs.lean 73), `Equiv` (155), `Section` (240), `Splitting` (270), `conjAct` (136), `inl_conjAct_comm` (147); `surjInvRightHom` (GroupExtension/Basic.lean 39); `SemidirectProduct.mulEquivSubgroup` (SemidirectProduct.lean 238), `SemidirectProduct.card` (311); `IsPGroup.le_sylow_of_normal` (Sylow.lean 107), `Sylow.not_dvd_index` (491), `Sylow.card_eq_multiplicity` (833), `IsPGroup.exists_le_sylow` (196), `IsPretransitive G (Sylow p G)` (346); `Subgroup.index_map_eq` (Index.lean 335), `card_mul_index` (293), `finiteIndex_of_finite` (764); `exists_right_complement'_of_coprime` (SchurZassenhaus.lean 277); `IsMulCocycle₁` (LowDegree.lean 625), `IsMulCoboundary₁` (677), `IsMulCoboundary₂` (681); `Rep.ofMulDistribMulAction` (Rep/Basic.lean 379); `MulAut.conjNormal` (ConjAct.lean 247), `conjNormal_apply` (251); `MulDistribMulAction.compHom` (type checked: `(A) [Monoid M] [MulDistribMulAction M A] [Monoid N] (N →* M) : MulDistribMulAction N A`); `Subgroup.normalizerMonoidHom` (Subgroup/Centralizer.lean 195); `QuotientGroup.quotientMapSubgroupOfOfLe` (QuotientGroup/Basic.lean 179); `Subgroup.mul_normal` (Subgroup/Pointwise.lean 300); `ZMod.unitOfCoprime` (ZMod/Basic.lean 794); `pow_card_eq_one'` (OrderOfElement.lean 1217); `Normal.conj_mem` (Subgroup/Defs.lean 608); `IsPGroup.card_eq_or_dvd` (PGroup.lean 232) and `exists_card_eq` (121). Tau Ceti: `cochainsCor1` (ContCohomology/Corestriction/Basic.lean 256; `[AddCommGroup M] [DistribMulAction G M]`, `[U.FiniteIndex]`, transversal `t`, `ht`; no topology), `cochainsCor1_apply` (263), `cochainsCor1_isCocycle₁` (309), `cochainsCor1_d0` (318), `cochainsCor1_changeTransversal` (366), `cochainsCor1_res` (385); `lWord` (TransversalWord.lean 71), `lWord_def` (73), `transversal_mul_lWord` (80), `lWord_of_mem_of_normal` (119, `[U.Normal]`), `lWord_mem` (134), `transversalDiff` (144); `transfer_eq_prod_lWord` (Transfer.lean 178), `transfer_eq_prod_of_bijective` (67), `transfer_comp` (116), `transfer_transfer` (146); `InducesAction` (FactorSetOfSection.lean 135), `conjActOfSection_apply` (194), `inducesAction_iff_conjActOfSection_eq` (211), `factorSet` (262), `factorSetToGroupExtensionEquiv` (320); `FactorSet.cohomologyClass` (GroupExtension/Cohomology.lean 115, `G M : Type` at 94), `nsmul_cohomologyClass_eq_zero_iff` (157), `nonempty_splitting_iff_cohomologyClass_eq_zero` (319), `cohomologyClass_factorSet_eq` (363); `map_subtype_id_comp_corestriction` (GroupCohomology/Corestriction.lean 153), `index_nsmul_eq_zero_of_map_eq_zero` (167; `k G : Type u`, `[S.FiniteIndex]`); `eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero` (GroupCohomology/Sylow.lean 56; `[Finite G]`); `isComplement'_alternatingGroup_stabilizer_perm_fin_three` (Perm/FinThree/Basic.lean 271); `isEmpty_splitting_zmodFourExtension` (GroupExtension/ZModFour.lean 93). `MonoidHom.exists_comp_eq_and_closure_range_eq_top_of_surjective` is the generator-lifting lemma in `TauCeti/GroupTheory/Gaschutz.lean`, a different theorem, as Scope says.

**Sources.** gaschutz1952 (GDZ, OCR of an image-only scan): the definitions of "zerspaltet" (1.4) and "zerfällt" (1.5) at lines 178–198 (printed p. 96; "zerfällt" is the existence of a subgroup with `𝔊 = 𝔄𝔊₁`, `𝔄 ∩ 𝔊₁ = 1`, Hall's splitting); Satz 1 at line 318 (printed p. 99, marker page 8): for an intermediate extension `𝔘` with `(𝔊 : 𝔘, 𝔄 : 1) = 1`, `𝔊` zerfällt over `𝔄` iff `𝔘` does (second sentence), and line 338 notes that the converse needs no coprimality; the 2. Reduktionssatz at line 348 (printed p. 100): `𝔊` zerfällt over the abelian `p`-group `𝔄` iff a Sylow `p`-subgroup does (second sentence, line 350). Both support §2.4 and §3.1 as written. sambale2023 (arXiv 2303.00254v2): Theorem 1 at lines 30–31 (abelian `N ⊴ G`, `N ≤ H ≤ G`, complement in `H`, `gcd(|N|, |G:H|) = 1` ⇒ complement in `G`), Baer's counterexample `SL(2,3) ∗ C₄`, `N = Q₈`, `H = Q₈ ∗ C₄` a Sylow 2-subgroup, at lines 34–41, the Sylow consequence of Theorem 1 at lines 74–75 (stated there for all primes at once; the `p`-group case of §3.1 is its specialisation). Every seeded target (0.1, 0.2, 1.1–1.4, 2.1–2.7, 3.1, 3.3) was checked against these texts or, for the targets without a mathematical locator (the dictionaries and the transfer computations, which are the roadmap's own), against the pinned declarations and the computations in the table. The README flags no locator as unverified.

**Duplication and ownership.** Gaschütz's theorem, the Sylow detection and the invariant-complement theorem are in neither pinned library (grep "Gasch" in Mathlib and Tau Ceti: only the generator-lifting lemma, its profinite form and its module analogue). `roadmaps grep` over main and the 440 open pull requests: no roadmap other than this one states a complement-existence theorem for an abelian normal subgroup beyond Schur–Zassenhaus; LocalFiniteGroupTheory (open pull request, read via `roadmaps show`) cites Schur–Zassenhaus and Burnside from Mathlib and plans normal `p`-complements, not Gaschütz; FiniteGroupInvariants cites Gaschütz only for the cyclicity criterion in character theory; ProfiniteProPGroups owns the profinite Gaschütz lifting lemma (a different theorem). OddOrderTheorem (open pull request by the same author, not in the merge order) cites this roadmap's S0–S3 as the owner of the Gaschütz criterion: a consumer, and the README keeps the S0–S3 aliases at the layer headings. Ownership against open pull requests whose files the brief does not give was checked through `roadmaps grep` only.

**Declared gaps.** None declared; no `design/plan.json` is readable, and the README states no `gap:` contract. Nothing is cited as supplied that does not exist where cited.

## Not verifiable

- The two Axiom CFSG Lean files under References are formalisations given as provenance, not mathematical sources; not read.
- gaschutz1952 beyond lines 164–260 and 300–370 (definitions, Reduktionssätze, Satz 1, Satz 2) was not read in full; the text is OCR of an image-only scan and the displayed formulas are garbled, so the definition of "zerfällt" was read from the prose of lines 175–191 and the figure captions, not from the displays.

## Source issues

- none
