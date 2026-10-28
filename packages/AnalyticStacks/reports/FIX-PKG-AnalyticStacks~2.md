# FIX-PKG-AnalyticStacks~2

Review addressed: REV-PKG-AnalyticStacks (seven findings: F01–F07). Files edited: `packages/AnalyticStacks/README.md`, `packages/AnalyticStacks/sources.toml`. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged.

## F01 (P2) — applied

Verified: LZ12b Theorem 5.4 is at LZ12b line 2057; condition (2), LZ12b line 2067, asks that every morphism of E₁ ∩ E₂ be n-truncated; Remark 5.5 (line 2076) gets only (4)–(6) from pullbacks plus admissibility; SixFF line 902 makes the same assumption.
0.3(2): hypothesis "every morphism of E₁ ∩ E₂ is n-truncated for some n ≥ −2" added. Citation → "LZ12b Theorem 5.4, line 2057; Remark 5.5, line 2076; Theorem 0.1, line 110 = ordinary-category case; SixFF Theorem 4.10 under SixFF line 902". The k = 2 Check now says why the hypothesis holds for nerves. Remark 5.5 added to the References and to the LZ12b locator in `sources.toml`. Pattern: 0.5 already carries the hypothesis on I ∩ P (= E₁ ∩ E₂ for E₁ = P, E₂ = I). The `Suggested.lean` docstring lists 0.3(2) as not statable, so it needs no change.

## F02 (P3) — applied

Verified on main: SchemeAndStackFoundations §2.19 (`upperShriek_proper`, `upperShriek_smooth`: f^!K ≅ f*K ⊗ Ω^d[d]) and §2.20 (`RelativeDualizingComplex`, `.baseChange`, `.upperShriek`) cover coherent duality for proper smooth schemes.
6.6: target (3) "coherent duality" deleted. The old (4) is now (3). The proof-route clause for it is gone, and `AlgebraicGeometry.IsProper` is dropped from 6.6's *Needs:* (3.4 still uses it). New Check "Agreement with coherent duality", citing §§2.19–2.20 and RCSolid Remark 7.7.24. §§2.19–2.20 added to the Scope bullet, the SchemeAndStackFoundations contract and the Layer 6 Dependencies. The HigherHidaAndColemanTheory consumer line now cites 6.6(3).

## F03 (P3) — applied

Recomputed: L_(B/A)[−1] = k ⊕ k[1], so Sym_k = k[u] ⊗ Λ(v) with v in degree 1. That gives π₀ = k[u] and π₁ = k[u]·v; Sym^m(k[1]) = 0 for m ≥ 2. Check text "π₁ = k·v ≠ 0" → "π₁ = k[u]·v ≠ 0, free of rank one over k[u] with weight-one part k·v". The point of the Check is unchanged.

## F04 (P3) — applied

3.6 now cites ABLB Definition 4.2.1 (ABLB line 2109: analytic stacks over a small subcategory stable under pushouts and finite products). It also cites ALRS line 1893, the passage that works over ℚ_(p,■). Both ids already have cited_for "3".

## F05 (P3) — applied

Verified: RC26a Lemma 3.1.2 (RC26a lines 1486–1492) is about 𝔾_m and proves descendability from the summand property only.
1.5: the ω₁-compact clause now has its own route. e is an effective epimorphism of AlgStk and its affine base changes are G-torsors, so e is !-able. Its self-base-change Spec R → Spec A is ω₁-compact faithfully flat (it has the counit as a retraction), hence descendable of index ≤ 2 by 1.2(1) and RCSolid Proposition 6.4.5. Locality on the target comes from HM Theorem 3.4.11(iii). The Lemma 3.1.2 citation is now scoped to the summand case. The 𝔾_a Check now says the index bound is for 𝔽_p → 𝔽_p[T], not for e. 0.6 added to *Needs:*; HM cited_for gains "1".

## F06 (P3) — applied

Verified: MotivesAndAlgebraicCyclesPartII's design names `AnalyticStacks:AS.0` (3 times) and `AnalyticStacks:AS.1` (6 times). LocallyAnalyticRepresentationsOfLocalGroups' design takes E_■ and affinoid analytic rings from SolidAnalyticRings SA.1, SA.2 and SA.4, and its design README never names AnalyticStacks.
Changes: ":0"/":1" → "AS.0"/"AS.1". The LocallyAnalyticRepresentationsOfLocalGroups bullet is deleted (the reviewer's second option), because that roadmap does not consume this one.

## F07 (P3) — applied

Verified at RC26a Construction 3.2.35 (RC26a lines 2053–2056): the functor is defined on the opposite of the category of finitely generated polynomial ℤ-algebras.
7.6: "functor from polynomial ℤ-algebras" → "functor from the opposite of the category of polynomial ℤ-algebras in finitely many variables (affine spaces 𝔸ⁿ_ℤ) … R(ℤ[T]) the underlying stack, R(ℤ[T, T′]) = R × R (RC26a Construction 3.2.35, line 2053)". Pattern: no other occurrence; the `Suggested.lean` docstring mentions ring stacks only as a missing carrier.

## Checks

- `lake env lean packages/AnalyticStacks/Suggested.lean` from the content checkout: exit 0 in 5.2 s. The only message is `Suggested.lean:102:8: warning: declaration uses 'sorry'`. There are no `TauCeti.*` imports, so nothing needed building.
- `#check @` audit: I elaborated a scratch copy with `#check @` for all five declarations. The types are unchanged: `bisimplex`, `compactificationBisimplex : SimplexCategory ⥤ (SimplexCategoryᵒᵖ × SimplexCategoryᵒᵖ ⥤ Type u)`; `restrictedDiagonal : (… ⥤ Type u) → SSet`; `restrictedDiagonalMap X : bisimplex.op ⋙ yoneda.obj X ⟶ restrictedDiagonal X`; `restrictedDiagonalMap_isEquivalence_hoFunctor : ∀ X (Q : SSet) [Q.Quasicategory], (SSet.hoFunctor.map ((MonoidalClosed.pre (restrictedDiagonalMap X)).app Q)).toFunctor.IsEquivalence`. They match README 0.3(1), no binder is lost, and nothing changed.
- Dependency gate (`gate --depcheck … --name AnalyticStacks --order … --movable`): output `depcheck: 56 roadmaps, 647 edges, 0 problem(s)`, exit 0. There is no UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. The newly cited SchemeAndStackFoundations §§2.19–2.20 and its `upperShriek_proper`, `upperShriek_smooth`, `RelativeDualizingComplex.baseChange` were read on main (SchemeAndStackFoundations README lines 4094, 4123–4128, 4275–4290).
- Gate failures listed in the brief: none.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.3(2) with the truncatedness hypothesis | C = N(ordinary category); 0.5's E₁ = P, E₂ = I; k = 2 schemes Check | nerve: mapping spaces are sets, so every morphism is 0-truncated and LZ12b Theorem 0.1 is recovered; E₁ ∩ E₂ = I ∩ P, n-truncated by 0.5's hypothesis; proper ∩ open immersions = open-and-closed immersions, 0-truncated (monomorphisms are even (−1)-truncated) | hypotheses now those of LZ12b 5.4 with Remark 5.5 | F01 |
| 6.6 coherent-duality Check | ℙ¹_ℤ → Spec ℤ, n = 1; 𝔸⁰ (n = 0, identity) | f^!1 = det Ω¹[1] = O(−2)[1] = §2.19's f*⊗Ω¹[1]; H⁰(O) = ℤ ↔ H¹(O(−2)) = ℤ; n = 0: f^! = id on both sides | agreement holds; a wrong twist O[1] gives H¹(O) = 0 ≠ ℤ | F02 |
| 6.6(3) (former (4)) | A = 𝔽_p (s = 1), d = 0 and d = 1 | d = 0: q étale, q^!A = O in degree 0; d = 1: Ω¹[1] in cohomological degree −1 (Layer 6 Examples) | unchanged content, renumbered | F02 |
| 6.5 Check 4 | A = k[ε]/ε² → k | L_(B/A)[−1] = k ⊕ k[1]; Sym = k[u] ⊗ (k ⊕ k·v[1]) since Sym^m(k[1]) = ∧^m(k)[m] = 0 for m ≥ 2; π₀ = k[u], π₁ = k[u]·v, π₂ = 0 | corrected value | F03 |
| 1.5 ω₁-compact route | G = 𝔾_m over ℤ; G trivial; G = 𝔾_a over 𝔽_p | 𝔾_m: ℤ → ℤ[T^±1] faithfully flat, countable, so index ≤ 2; trivial G: e = id, a cover trivially; 𝔾_a: 𝔽_p → 𝔽_p[T] index ≤ 2 while e has no comodule retraction (φ(1) = 0) | route applies in all three; only the summand case uses RC26a 3.1.2 | F05 |
| 7.6 ring stack variance | R = 𝔾_a; R(ℤ[T, T′]) | covariant on 𝔸ⁿ = Spec: 𝔸² ↦ R × R, addition 𝔸² → 𝔸¹ ↔ ℤ[T] → ℤ[T, T′], T ↦ T + T′ in the opposite direction | the opposite of polynomial algebras is the correct source | F07 |
| 3.6 locator | C₀ = finite products of ℚ_(p,■) | stable under pushouts (⊗ of products of ℚ_(p,■) is again such a product) and finite products, as ABLB Definition 4.2.1 requires | fits the cited definition | F04 |

## For the maintainer

- The name 6.6(4) changed to 6.6(3). The board package HigherHidaAndColemanTheory and `design/plan.json` (gap mapping, line 2978; outside my edit rights) still say "6.6(4)". The README's Downstream consumers line has been updated. A grep of the board packages found no other external citation of 6.6(4).
- The Downstream consumers list no longer names LocallyAnalyticRepresentationsOfLocalGroups: that roadmap takes its solid inputs from SolidAnalyticRings SA.1, SA.2 and SA.4.
- Ownership: the only new cross-roadmap object is coherent duality, now imported from SchemeAndStackFoundations §§2.19–2.20 (on main). Ownership against the open pull requests was checked through the `roadmaps grep`/`resolve` index tools only for the cited names.
- No suspicious instructions were found in the review text. No source is missing, so `needs-references.toml` was not written.
