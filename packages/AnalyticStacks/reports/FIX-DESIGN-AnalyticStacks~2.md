# FIX-DESIGN-AnalyticStacks~2

Nine findings, all verified against the cached sources and the cited supplier. Eight applied as asked, one applied in a different way (F06: the sources were fetched and recorded, and one HA number was corrected). Files edited: `packages/AnalyticStacks/design/README.md`, `packages/AnalyticStacks/design/plan.json`, `packages/AnalyticStacks/sources.toml`. This is the design stage, so there is no `Suggested.lean`, nothing was elaborated and no `#check` pass applies.

## F01 (P2) — applied

Verified. RCSolid Corollary 5.3.9 (RCSolid line 2633) gives A_{R_■/} = A_■ for every integral map of finitely generated algebras, so (A, ℤ)_■ = A_■ for 𝔽_p, ℤ/p^s, ℤ[i], ℤ[ε]/ε². The old Check of 3.4 said the opposite. Old: "A_■ is strictly smaller for A ≠ ℤ of finite type". New: strictly smaller for ℤ[T] (ℤ((T⁻¹)), from 2.7(1)) and for ℤ[1/p] (ℚ_p with T ↦ p⁻¹, the second Check of 2.7). Equal for A integral over ℤ, by 2.7(4), with the computation ℤ[[q]]/(1 − nq) = 0. The matching test in plan.json 3.4 changes with it. Pattern search: no other place claims that the two structures differ for finite ℤ-algebras.

## F02 (P3) — applied

Verified: RCSolid line 2971 is Remark 5.4.2, and lines 4471–4474 belong to Remark 6.4.1. Both places in 1.1 and 2.1 now cite "RCSolid Remark 5.4.2, RCSolid line 2971", replacing lines 4473 and 4471. The other citation of line 4471 (3.3, "RCSolid Remark 6.4.1, RCSolid line 4471 to RCSolid line 4474") is correct and is unchanged.

## F03 (P3) — applied

Verified at the head of DerivedDeRhamCohomology, which comes earlier in the merge order. §1.18 is the Beilinson t-structure on DF(A), and §1.19 says its heart is Ch(A). Changes:
- The Scope bullet now names those sections.
- There is a new contract, "From TauCetiRoadmap.DerivedDeRhamCohomology".
- 1.7 now says that the case V = D(A), A a ℚ-algebra, is imported from §§1.18–1.19 through 1.6, and that 1.7 proves the extension to a general ℚ-linear V.
- 1.7's *Needs:* line, the Layer 1 Dependencies, and the plan.json 1.7 prerequisites and suppliers list all cite these sections.

## F04 (P3) — applied

Verified: And21 line 1574 works with extremally disconnected sets. Changes:
- 4.4(6) now says that And21 proves it for κ-condensed modules and that the light statement is the target here.
- The proof route now cites the exact steps: And21 Lemmas 5.46–5.47 (line 2673, line 2681), Theorem 5.50 (line 2733) and Lemma 5.51 (line 2779). The old "§5.3" was wrong: Theorem 5.50 and Lemma 5.51 are in §5.4.
- The route names what it uses: resolutions by (A, A⁺)_■[S], the factorisation of maps into a nuclear object through trace-class maps, and trace-class endomorphisms of (A, A⁺)_■[S].
- The plan.json locator and the References entry are updated.

## F05 (P3) — applied

Verified at RC26a lines 2171–2179. Old: "R-modules M, N … with a Cartier dual D(R) and exponential". New: "!-able R-modules M, N over S, a !-able R-module D(R) over S with exp: D(R) → 𝔾_m whose pairing gives [R]_* ≅ [B(D(R))]_!, an R-linear Ψ whose composite with exp gives [BM]_* ≅ [N]_!". The same hypothesis is added to plan.json 7.6.

## F06 (P3) — applied differently

Rather than dropping the theorem numbers, I fetched and recorded all three works through the sources service:
- MW is arXiv:2410.23115v4, open repository. Theorem 2.4 is at MW line 441.
- HA is the author version of 18 September 2017. Theorem 4.8.4.6 is at HA line 28032.
- SAG is the author version of 3 February 2018. Propositions 25.2.4.1 and 25.3.6.1 are at SAG line 62445 and SAG line 63043.

One citation the reviewer listed was itself wrong. HA 4.8.5.14 is a Notation. The statement 2.3(7) uses (A ↦ Mod_A preserves colimits over weakly contractible, hence sifted, diagrams) is Corollary 4.8.5.13 (HA line 28528); it is cited instead. SAG states its propositions for simplicial commutative rings, not "in any ∞-topos". The 5.2 route now passes to condensed rings by t-exact sheafification. I added References entries for MW, HA and SAG, with authors, titles, years and version notes in sources.toml.

## F07 (P3) — applied

Verified at HM line 2329. Old: "when the inclusions X → X ⊔ Y lie in E". New: "when ∗ → ∗ ⊔ ∗ lies in E′, ∗ the final object of Shv(C)". The same pattern also appeared in the second Check of 0.6, which claimed stability under disjoint unions with no hypothesis. That Check now carries the hypothesis (HM Lemma 3.4.13(ii)), and so do the plan.json 0.6 statement and test. 0.13 (∗ → ∗ ⊔ ∗ in E) was already correct.

## F08 (P3) — applied

Verified at Sch24 lines 1721–1722 and 1756–1757, where the tensor product is nonderived. In 4.4(3) and (5), "M ⊗_A B = 0" and "M ⊗_A Ā = 0" become "the ordinary tensor product π₀(M ⊗_A B)" and "π₀(M ⊗_A Ā)" vanish. The plan.json 4.4 statement changes with them. No other Nakayama-type clause in the README uses the derived form.

## F09 (P3) — applied

Verified at RC26a lines 1461–1463. Old: "invertible objects of D(A) of the form of line bundles". New: "invertible objects L of D(A) for which some !-cover A → B has B ⊗_A L ≅ B". The plan.json 7.4 statement changes with it.

## Checks run

Dependency gate (`gate --candidate packages/AnalyticStacks/design/README.md --only AnalyticStacks`):

    candidate: AnalyticStacks is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
    depcheck: 56 roadmaps, 647 edges, 0 problem(s)

There is no UPWARD or CYCLE line. The new edge is to DerivedDeRhamCohomology, which is earlier in the order.

`roadmaps resolve`: no cross-roadmap citation and no Lean name was found missing.

There were no gate failures to fix. Nothing was added to `needs-references.toml`: all three new texts were readable legally.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 3.4 Check, A_■ vs (A, ℤ)_■ | A = 𝔽_p; A = ℤ[1/p]; A = ℤ[T] | 1 − nq is a unit in ℤ[[q]], so ℤ[[q]]/(1 − nq) = 0 and every solid group is n-solid, so the structures are equal for 𝔽_p. For ℤ[1/p], ℚ_p with T ↦ p⁻¹ is a ℤ((T⁻¹))-module, so Hom ≠ 0 and it is not (1/p)-solid. For ℤ[T], ℤ((T⁻¹)) ≠ 0 is killed by j* | true as restated |
| 1.7, imported Beilinson case | V = D(ℚ); weight 0 and weight 1 static objects | gr⁰ = M₀ static means H⁰ only, which is the heart. gr¹ = M₁ needs M₁[1] in the shear, cohomological degree 1 in DerivedDeRhamCohomology's convention. This matches its Check `test_beilinson_weight_one` | consistent |
| 4.4(3) nonderived | A = ℤ, M = ℤ/p; B = ℚ (not conservative) and B = ℤ × ℚ (conservative) | for B = ℚ, π₀(ℤ/p ⊗ ℚ) = 0 with ℤ/p ≠ 0, so conservativity is needed. For B = ℤ × ℚ, π₀(ℤ/p ⊗ B) = ℤ/p ≠ 0. For M = A/I the π₀ hypothesis gives 1 = 0 in M ⊗ B, so the derived tensor vanishes (Sch24 line 1725) | true as restated |
| 4.4(6) light form | A = ℚ_p, A⁺ = ℤ_p | the dualizable objects are the perfect ℚ_p-complexes (ABLB line 3624), the same as in the κ-statement | consistent with the Check |
| 0.6 disjoint unions | C = finite sets with trivial topology; two-point family | ⊔ X_i is a presheaf coproduct and D(⊔X_i) = ∏ D(X_i). Membership in E′ needs ∗ → ∗ ⊔ ∗ ∈ E′ (HM Remark 3.4.12: not known in general) | hypothesis added |
| 7.6 !-ability | R = 𝔾_a over ℤ^cond, M = N = 𝔾_a | [N]_! is defined only for !-able N (7.2). RC26a line 2172 assumes M, N, D(R) !-able | hypotheses added |
| 7.4 B𝔾_m | A = ℤ, L = ℤ[1] | ℤ[1] is invertible but no !-cover makes it ≅ B (it has the wrong degree after any base change), so it is excluded, as RC26a 3.0.3 requires | restatement excludes the shifted line |
| 2.3(7) via HA 4.8.5.13 | Δ^op; a filtered poset; the empty diagram | Δ^op and filtered posets are weakly contractible, so they are covered. The empty diagram is not; 2.3(7) uses HA 4.8.5.13 only for sifted colimits and treats pushouts by localization | citation fits |

## For the maintainer

- There is a new supplier edge: AnalyticStacks consumes DerivedDeRhamCohomology §§1.18–1.19. That roadmap is still an open pull request, and it is earlier in the merge order.
- No name that other roadmaps cite changed. There is no `Suggested.lean` at this stage.
- Ownership against open pull requests was checked through `roadmaps grep` (main and the 367 open heads). The only new owner found is the one F03 points to.
- No fetched text contained instructions.
