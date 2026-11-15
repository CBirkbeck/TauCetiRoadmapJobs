# FIX-PKG-RealSurfacePeriodIndex~7

Repair of the three findings of `REV-PKG-RealSurfacePeriodIndex~6`. Only `packages/RealSurfacePeriodIndex/README.md` changed; `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged (no gap was added or changed).

## F01 (P1) — applied

Changed: §7.6 hypothesis "U is quasi-projective (Nagata …, Zariski's projectivity …)" → "not assumed quasi-projective: the proof passes to a nonempty affine open". Step 1 replaces U by an affine open U′ (Mathlib `AlgebraicGeometry.Scheme.isBasis_affineOpens`), closed in 𝔸ⁿ ⊂ ℙⁿ, then compactifies U′; step 2 reads U′. Two Checks added; Mathlib contract and Layer 7 Dependencies name the lemma.

Evidence: ResolutionOfSingularitiesCharacteristicZero §6.2 on main (its README line 895) compactifies a smooth *quasi-projective* variety, and no target or supplier owned the quasi-projectivity claim. U connected and smooth is integral, so U′ is integral, smooth, of finite type, with ℝ(U′) = ℝ(U), and a presentation of its coordinate ring gives the immersion into ℙⁿ that the supplier's §§6.1–6.2 require. (S ∖ U′)(ℝ) has dimension ≤ 1, so it has empty interior in each nonempty component of the 2-manifold S(ℝ). Hence U′(ℝ) is dense in the open U_α(ℝ), the locally constant evaluation vanishes there, and Θ(α) = ∅.

Pattern: no other target compactifies an arbitrary open. I searched for "§6.2", "compactif", "quasi-projective" and "Nagata". §1.1, §7.4 step 2 and §7.6 step 4 use field resolution, which needs no quasi-projectivity. The same sentence remains in `packages/RealSurfacePeriodIndex/design/README.md`, which this job may not edit.

## F02 (P3) — applied

Changed: contract "§3.4 (… `cartierClass_picard_equiv`, hence surjectivity …)" → `classGroup_picard_locallyFactorial` and `picard_excision_sequence`, each with its hypotheses, the dense-open surjectivity being derived in §1.9. §1.9 step 1 now gets local factoriality from Tau Ceti `TauCeti.AlgebraicGeometry.IsRegular.uniqueFactorizationMonoid_stalk` and removes codimension-two points separately. The step also gained the two Checks listed below.

Evidence: SchemeAndStackFoundations §3.4 on main (README lines 5967–6021) has no `cartierClass_picard_equiv`. Excision removes one integral codimension-one D and needs X locally factorial. A smooth surface is regular (SchemeAndStackFoundations §4.13, `IsRegular.of_smooth`) with all points of coheight ≤ 2, so the pinned stalk lemma applies.

Pattern: §5.6 step 4 and §8.7 step 1, which took "Pic(S) → Pic(V) onto" straight from §3.4, now cite §1.9; §5.6 *Needs:* gains §1.9. The new Checks in §1.9 are ℙ² ⊃ 𝔸², where ℤ → Cl(ℙ²) = ℤ → 0 → 0 is onto, and a negative control. On the quadric cone xy = z², Pic = 0 but Cl = ℤ/2, so Pic(X) → Pic(X ∖ vertex) = ℤ/2 is not onto. The Tau Ceti contract and the Layer 1 Dependencies were updated.

## F03 (P3) — applied differently

Changed: new Mathlib contract bullet "Cone orders" (`LinearOrder.ofAddSubmonoid`, `IsOrderedRing.ofSubsemiring`, `Subsemiring.IsPointed.nonneg`, `Subsemiring.IsSpanning.nonneg`, `Subsemiring.IsOrdering.of_isPrime_supportIdeal`, `Subsemiring.IsPreordering.isPointed`, `IsOrderedRing.toIsStrictOrderedRing`). The Tau Ceti orderings bullet gains `strictMono_comap` and `strictMono_iff_nonneg_iff_mem_comap`. These names are cited in §0.1 (last API bullet), §0.3 (definition, step 1) and §0.4 (F_P, step 2), and in the *Needs:* lines and Layer 0 Dependencies.

Why differently: the finding's wording overstates two pinned lemmas. `IsOrderedRing.ofSubsemiring` orders the *partial* cone order, so the linear order needs `LinearOrder.ofAddSubmonoid` and strictness needs `IsOrderedRing.toIsStrictOrderedRing`. `Subsemiring.IsSpanning.nonneg` gives only spanning, so the converse also needs pointedness, prime support {0} and `Subsemiring.IsOrdering.of_isPrime_supportIdeal`. All locators were opened at the pins (Mathlib `Algebra/Order/Ring/Cone.lean:25, 28, 33`, `Algebra/Order/Group/Cone.lean:63`, `Algebra/Order/Ring/Ordering/Defs.lean:54`, `Algebra/Order/Ring/Ordering/Basic.lean:88`, `Algebra/Order/Ring/Defs.lean:107`; Tau Ceti `Algebra/Order/Ring/Ordering/Map.lean:85, 105`).

## Checks run

- `lake env lean packages/RealSurfacePeriodIndex/Suggested.lean` from the content checkout: exit 0; eight `declaration uses sorry` warnings (lines 80, 89, 101, 112, 123, 133, 141, 154), nothing else. The three imported Tau Ceti object files were present.
- `#check @name` scratch file (a copy of `Suggested.lean` with `#check @name` for all nine declarations, elaborated once): each elaborated type keeps every binder of its README statement (`[IsAlgClosed k] [CharZero k]`, `[IsRealClosed R]`, `[Algebra.EssFiniteType _ K]`, the `trdeg` and `¬ IsSemireal K` hypotheses, `[Invertible 2]`, `[FiniteDimensional K V]`); nothing changed, as `Suggested.lean` was not edited.
- Every library name added to the README was elaborated at the pins: `LinearOrder.ofAddSubmonoid`, `IsOrderedRing.ofSubsemiring`, `IsOrderedRing.toIsStrictOrderedRing`, `Subsemiring.IsPointed.nonneg`, `Subsemiring.IsSpanning.nonneg`, `Subsemiring.IsOrdering.of_isPrime_supportIdeal`, `Subsemiring.IsPreordering.isPointed`, `AlgebraicGeometry.Scheme.isBasis_affineOpens` (with `import Mathlib`), and `Subsemiring.IsOrdering.strictMono_comap`, `Subsemiring.IsOrdering.strictMono_iff_nonneg_iff_mem_comap`, `TauCeti.AlgebraicGeometry.IsRegular.uniqueFactorizationMonoid_stalk`, `TauCeti.AlgebraicGeometry.IsRegular.of_smooth` (with their Tau Ceti modules; `TauCeti.Algebra.Order.Ring.Ordering.Map` was first built with `lake build`, unpacked from cache). All resolved; the stalk lemma needs `Order.coheight x ≤ 2`, which every point of a surface satisfies.
- Dependency check, whole output:

      depcheck: 245 roadmaps, 2243 edges, 0 problem(s)

  No UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- No LaTeX delimiters, paths, pull-request numbers or process words were introduced.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §7.6 step 1: pass to an affine open U′ | U = ℙ²_ℝ, U′ = 𝔸²; U = 𝔸² ∖ {0} (not affine), U′ = {x ≠ 0}; U = 𝔸²_ℂ viewed over ℝ | ℝ(U′) = ℝ(x, y) in the first two; U′ closed in 𝔸ⁿ; third: U(ℝ) = ∅, ℝ(U) = ℂ(x, y) nonreal, S = ℙ²_ℂ over ℝ, integral but not geometrically connected; §6.2 needs only an integral variety | holds | none |
| §7.6 step 2: density of U′(ℝ) | S ∖ U′ a real line; the pair of conjugate lines x² + y² = 0 | ℝℙ² ∖ ℝℙ¹ = ℝ², dense; (S ∖ U′)(ℝ) = {[0:0:1]}, a point, empty interior | holds | none |
| §7.6 new Check 2 | ℙ² ⊃ 𝔸², α = Hamilton class, α = 0 | Br(ℙ²_ℝ) = Br(ℝ) = ℤ/2; Hamilton class evaluates to 1 everywhere, so is excluded on U′ and U alike; α = 0 has Θ = ∅ | holds | Check added |
| §7.6 new Check 3 | complement of x² + y² = z² | ℝℙ² minus an oval = open disc ⊔ open Möbius band, dense; complement affine (ample divisor) | holds | Check added |
| §1.9 step 1 (local factoriality) | S = ℙ²; V = 𝔸² ∖ {0} ⊂ ℙ²; quadric cone | Pic = Cl = ℤ on ℙ²; Pic(𝔸² ∖ 0) = Cl(𝔸²) = 0, onto; cone: Pic 0, Cl ℤ/2 (div x = 2L), V = cone ∖ vertex has Pic = ℤ/2, not onto | holds for smooth S; fails without | step 1 cites the factoriality lemma; negative control added |
| Contract §3.4, `picard_excision_sequence` | ℙ² ⊃ 𝔸², D the line | ℤ → ℤ → 0 → 0, 1 ↦ [line], exact | holds | — |
| §0.1 cone-order bullet | ℝ, ℂ, ℚ(√2) with √2 < 0, ℤ (not a field) | ℝ: one order; ℂ: no order (i² = −1 ≥ 0 impossible), X_ℂ = ∅; ℚ(√2): √2 ≤ 0 as 0 − √2 ∈ P; support {0} prime in a field (and in ℤ too, but the statement is for fields) | holds | — |
| §0.3 "ordering inside an ordering is equal" | P ⊂ P′ orderings of a field | a ∈ P′ ∖ P ⇒ −a ∈ P ⊂ P′ ⇒ a ∈ P′ ∩ −P′ = {0} ⊂ P, contradiction | holds | — |
| §0.3 real closure, strict monotonicity | ℚ(√2) at √2 < 0, R = real algebraic numbers, ι(√2) = −√2; wrong embedding ι(√2) = √2 | ι(−√2) = √2 a square ✓; ι(√2) = −√2 < 0 ✓; wrong embedding sends −√2 ∈ P to −√2, not a square, so excluded | holds | — |
| §0.4 step 2 via `strictMono_comap` | ℝ ⊂ ℝ(t), Q any ordering; ⟨1, 1⟩ | ι⁻¹(Q) = ℝ≥0; signature 2 on both sides | holds | — |

## Ownership and overlaps

No construction was added: the repairs cite pinned declarations and SchemeAndStackFoundations §§3.4, 4.13 on main. No supplier gap is needed, and `design/plan.json` is unchanged. `scratch/overlaps.md` lists no conflicting head or dropped id; no id of this roadmap changed.

## For the maintainer

- `packages/RealSurfacePeriodIndex/design/README.md` still has the old §7.6 hypothesis sentence (Nagata compactification, Zariski projectivity); the package README no longer depends on it.
- No name declared in `Suggested.lean` changed; no other roadmap is affected.
- The review's "For the human reviewers" items (ownership of Tsen–Lang against QuadraticFormInvariantsPartII; the licence classes) are not findings and were not acted on.
