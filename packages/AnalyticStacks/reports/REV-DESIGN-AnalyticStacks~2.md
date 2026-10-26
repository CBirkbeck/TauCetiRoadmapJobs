<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2123#issuecomment-6407739240 -->
Review (claude) of 83c6939

Verdict: accepted
Conditional on the announced gaps: `nuclear-hom-criterion`

1. **F01** (P3) 0.3: the vertices of Cpt_n are those with i ≤ j, not i ≥ j

   - **Location.** `packages/AnalyticStacks/design/README.md` line 147: "the sub-bisimplicial set Cpt_n of the (n, n)-bisimplex spanned by the vertices (i, j) with i ≥ j".
   - **Claim.** The source's Cpt_n is spanned by the vertices with i ≥ j.
   - **Witness.** LZ12b line 1054–1055 defines Cpt_n ⊆ Δ^{n,n} as the bisimplicial subset obtained from the vertices (i, j) with 0 ≤ i ≤ j ≤ n (the transpose of what is written; the two differ by swapping the simplicial directions).
   - **Repair.** Write "spanned by the vertices (i, j) with 0 ≤ i ≤ j ≤ n". Tested on n = 1: the source's Cpt₁ has the vertices (0,0), (0,1), (1,1) and omits (1,0), which is LZ12b's "forgetting the lower-left corner" (line 1891); the written version omits (0,1) instead.

2. **F02** (P3) 0.5, third Check: condition (b) already fails for the infinite-product formalism

   - **Location.** README line 196: "on the category of sets with I = P = all and D₀(X) = Fun(X, D(Λ)), conditions (a) and (b) hold with f_♮ the fibrewise sum and f_* the fibrewise product".
   - **Claim.** (a) and (b) hold, so the failure of (c) for j = p = (ℕ → ∗) shows that (c) is not automatic.
   - **Witness.** The projection formula in (b) for p: ℕ → ∗ is M ⊗ ∏_n N_n ≅ ∏_n (M ⊗ N_n). For M = ⊕_ℕ Λ and N_n = Λ the left side is ⊕_ℕ ∏_ℕ Λ and the right side ∏_ℕ ⊕_ℕ Λ; the identity matrix lies in the right side only. So (b) fails for infinite fibres, and the Check refutes a hypothesis that is not satisfied. The plan.json test `conditionCNeeded` repeats the claim.
   - **Repair.** Use the Cartesian formalism D₀(X) = Fun(X, Ani) (or Fun(X, Set)) on sets with I = P = all: there (a) holds with f_♮ the fibrewise coproduct (S × ⊔_n T_n ≅ ⊔_n (S × T_n)) and (b) with f_* the fibrewise product (S × ∏_n T_n ≅ ∏_n (S × T_n)), both with base change, while for j = p = (ℕ → ∗) the map j_♮ p′_* → p_* j′_♮ is ⊔_m ∏_n S_{mn} → ∏_n ⊔_m S_{mn}, which for S_{mn} = ∗ is ℕ → ∏_ℕ ℕ, not surjective. Tested on that instance: the left side is countable, the right side is not. Change the plan.json test accordingly.

3. **F03** (P3) 2.7(7) and 2.8(3): the empty colimit is not preserved

   - **Location.** README line 558, 2.7(7): "(−)_■: Ring → AnRing is fully faithful and preserves colimits"; line 572, 2.8(3): "(R, R⁺) ↦ (R, R⁺)_■ is fully faithful and colimit preserving".
   - **Claim.** Both functors preserve all small colimits into AnRing.
   - **Witness.** The initial objects ℤ of Ring and (ℤ, ℤ) of discrete Huber pairs go to ℤ_■, but the initial analytic ring is ℤ^cond (2.2: a map ℤ^cond → B is the unique ring map, the restriction condition being vacuous), and ℤ_■ → ℤ^cond is not a map of analytic rings since ℤ[ℕ ∪ {∞}] ∈ D(ℤ^cond) is not solid (Check 3 of 2.1). Man22 line 4946 (Proposition 2.9.6(ii)) states "all non-empty colimits"; RCSolid Propositions 5.4.11 (line 3132) and 5.5.6 (line 3284) say "colimits", a slip recorded under Source issues.
   - **Repair.** In both places write "preserves non-empty colimits (Man22 Proposition 2.9.6(ii)), that is, all colimits as a functor to analytic rings over ℤ_■". Tested on the instance: as functors to AnRing_{ℤ_■/} the initial object ℤ_■ is preserved, and pushouts are computed as in 2.3(3). The plan.json statement of 2.7 ("fully faithful and colimit-preserving") changes with it.

4. **F04** (P3) "How to read the build" omits Layer 7's use of 6.4

   - **Location.** README line 101: "Layers 4–7 depend on 3 and are mutually independent except that 6 uses 5 and 7 uses 4.1 and 1.4."
   - **Claim.** Layer 7 consumes nothing of Layer 6.
   - **Witness.** 7.5 *Needs:* (line 1074) lists "6.4 (suaveness of G_{a,■})", 7.7 *Needs:* (line 1102) lists 6.4, and the Layer 7 Dependencies (line 1116) list 6.4; 7.4–7.6 also use 1.5 and 3.8.
   - **Repair.** Write "except that 6 uses 5, and 7 uses 1.4–1.5, 3.8, 4.1 and 6.4". Tested against every *Needs:* line of Layer 7: no other cross-layer edge is missing.

5. **F05** (P3) 4.5, third Check: the witness does not show a failure of the sheaf property

   - **Location.** README line 837: "For a non-Fredholm C₀ the definition by pullbacks still makes sense, but the sheaf property can fail: a dualizable nonperfect module (CS22 Example 9.6) is !-locally dualizable without being locally perfect".
   - **Claim.** Without Fredholmness, A ↦ Perf^{[a,b]}(A) can fail to be a sheaf, with CS22 Example 9.6 as witness.
   - **Witness.** CS22 Example 9.6 (CS22 line 3612) exhibits a dualizable module over the liquid ℂ[T] that is not discrete, hence not perfect. That object is not perfect anywhere, so it is not a failure of descent for Perf; it shows only that the route of 4.5 (!-locally perfect ⇒ dualizable ⇒ perfect) breaks at its second step. The plan.json test `fredholmNeeded` repeats the claim.
   - **Repair.** Write "For a non-Fredholm C₀ the proof route breaks: dualizability is still !-local, but CS22 Example 9.6 (CS22 line 3612) gives a dualizable module over the liquid ℂ[T] that is not perfect, so !-local perfectness can no longer be detected through dualizability; the Fredholm hypothesis is what the route uses." Tested on that instance: the sequences of polynomial growth with T acting by (1, 2, 3, …) are dualizable and not discrete, as the Check of 4.4 already records. Change the plan.json test to the same wording.

Acceptance is conditional on the declared gap `gap:nuclear-hom-criterion` (supplier RefinedTraceMethods §4.3). Five P3 notes, no P1 or P2 finding. Every finding of round 1 is repaired; the repairs are checked finding by finding below, then the adversarial pass is run on the repaired passages, the seeded sample and the headline theorems.

## Repairs of round 1, checked

- **F01 (P2), repaired.** `packages/AnalyticStacks/design/README.md` line 695 now reads "A_■ (a-solid for every a ∈ A) can be strictly smaller: for A = ℤ[T] … for A = ℤ[1/p] … For A integral over ℤ, for instance 𝔽_p, ℤ/p^s, ℤ[i] or ℤ[ε]/ε², the two structures coincide by 2.7(4)". Recomputed: the base change of ℤ((T⁻¹)) along T ↦ n is ℤ[[q]]/(1 − nq) = 0 since 1 − nq has inverse Σ nᵏqᵏ in ℤ[[q]]; so RHom_{(ℤ[T],ℤ)_■}(ℤ((T⁻¹)), M) = RHom_{ℤ_■}(0, M) = 0 for every solid M with T acting by n. For A = ℤ[1/p], T⁻¹ ↦ p makes ℚ_p a ℤ((T⁻¹))-module, so Hom ≠ 0 and ℚ_p is not (1/p)-solid. The plan.json test `zSolidComparison` of 3.4 changed with it.
- **F02 (P3), repaired.** Lines 352 and 467 cite "RCSolid Remark 5.4.2, RCSolid line 2971"; RCSolid line 2971 is that remark.
- **F03 (P3), repaired.** Scope bullet (line 13), new contract "From TauCetiRoadmap.DerivedDeRhamCohomology" (line 69), 1.7 (line 438: "For V = D(A) with A a ℚ-algebra this t-structure is … the Beilinson t-structure of DerivedDeRhamCohomology §1.18 restricted to complete filtered objects, and its heart is the category Ch(A) of DerivedDeRhamCohomology §1.19; those statements are imported"), *Needs:* line 442 and Layer 1 Dependencies line 456. Resolved at the head 83d00dd of DerivedDeRhamCohomology (merge order line 20, before this roadmap): §1.18 "The Beilinson t-structure" with the coconnective half tested on gr^i for complete objects, §1.19 "The Beilinson heart is the category of complexes", cohomological grading as the contract says.
- **F04 (P3), repaired.** Line 807, clause (6): "proved there for condensed modules tested on extremally disconnected sets, And21 line 1574; the light statement is the target here"; the route at line 809 names And21 Lemmas 5.46–5.47, Theorem 5.50 and Lemma 5.51. Verified: And21 line 2673 is Lemma 5.46, 2681 Lemma 5.47, 2733 Theorem 5.50, 2779 Lemma 5.51, 2978 Corollary 5.51.1, 1574 the extremally-disconnected hypothesis.
- **F05 (P3), repaired.** Line 1084: "!-able R-modules M, N over S, a !-able R-module D(R) over S with a map exp: D(R) → 𝔾_m … whose pairing gives [R]_* ≅ [B(D(R))]_!" (RC26a line 2172).
- **F06 (P3), repaired differently, correctly.** `packages/AnalyticStacks/sources.toml` now has keys MW (arXiv 2410.23115, open-repository), HA and SAG (author-page), all `certified`, no local path. MW line 441 is Theorem 2.4 (closure, ω₁-generation, preservation by symmetric monoidal colimit-preserving functors); HA line 28032 is Theorem 4.8.4.6 and line 28528 Corollary 4.8.5.13 (weakly contractible K, as the route of 2.3(7) uses); SAG line 62445 is Proposition 25.2.4.1 and line 63043 Proposition 25.3.6.1, both for simplicial commutative rings, as the route of 5.2 now says.
- **F07 (P3), repaired.** Lines 200 and 209: "stable under disjoint unions when ∗ → ∗ ⊔ ∗ lies in E′, ∗ the final object of Shv(C)"; HM line 2329 states exactly this hypothesis.
- **F08 (P3), repaired.** Line 807, clauses (3) and (5): "whose ordinary tensor product π₀(M ⊗_A B) vanishes".
- **F09 (P3), repaired.** Line 1056: "invertible objects L of D(A) for which some !-cover A → B has B ⊗_A L ≅ B" (RC26a line 1461).

No finding of round 1 was marked not actionable; nothing is re-raised.

## Verified sound

**Principles.** Held on the whole README: general statements throughout (light analytic rings over arbitrary light condensed animated rings, AnStk(C₀) for every admissible C₀, Serre duality for every locally solid smooth map), no re-planned roadmap (ownership below), downward supply only (gate below), statements in the author's words (the fifteen sampled passages compared with their sources: no copied passage), no algorithm, no Lean file, no `set_option`, no LaTeX delimiters, no process words, no pull-request numbers, no local path, no `lemma` (grep over the README, by pattern, zero hits). 60 sections carry a `**Checks.**` list with at least three bullets (script count: 60 sections, none below three); eight layers each end with `### Examples` and `### Dependencies`; plan.json has 8 layers, 60 targets, 180 tests, 1 gap.

**Dependency check.** Output of the gate on the candidate README with the board's merge order:

    candidate: AnalyticStacks is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
    depcheck: 56 roadmaps, 647 edges, 0 problem(s)

No UPWARD or CYCLE line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. Every *Needs:* line of the sample was read; within layers the order is consistent (0.9 needs 0.5, 0.6, 0.8; 0.13 needs 0.6, 0.7, 0.12; 3.1 needs 2.3, 2.5; 6.4 needs 6.2, 6.3; 7.5 needs 7.3 and 6.4), and the only inconsistency is the prose summary of R04. Declared supplier gap: `gap:nuclear-hom-criterion` has the same slug in plan.json (`gaps[0]`, supplier RefinedTraceMethods, section §4.3, neededBy 4.3) and in the README contract (line 85); it is precise (both criteria stated with hypotheses), minimal (RefinedTraceMethods §4.3 at head 9dd2691, "Nuclear objects" at its line 1596, defines nuclearity by trace-class maps from compacts and states no Hom criterion), and owned.

**Suppliers resolved this round.** DerivedDeRhamCohomology at head 83d00dd (§§1.18–1.19, above). RefinedTraceMethods at head 9dd2691: §4.1 "Dualizable presentable categories", §4.2 "Trace-class morphisms and their preduals", §4.3 "Rigid categories and nuclear objects" with the closure theorem citing MW Theorem 2.4. SolidAnalyticRings at head 5d395ae: §1.5 light solid abelian groups, §2.3 the Hℤ-linear comparison (symmetric monoidal t-exact equivalence of δHℤ-modules in Sp_■ with D(SolidAb_light)), §7.1 uncompleted and completed spectral analytic structures (Hom-closure for arbitrary A-modules, as 2.6's route says), §7.3 summability structures with the coefficient structures (R, R⁺)_■, (R[T], π₀R)_■, R[T]_■ tested on ring generators, its Checks "(ℤ[T], ℤ)_■ for F = ∅" (line 780), topological ℚ_p with T = 1/p in D_∅ and not in D_{T} for p = 2, 3 (line 782), and εT over 𝔽₂[ε]/ε² (line 784), which are the comparisons the Checks of 2.6, 2.7 and 2.8 claim; §7.4 with gap:light-measure-site-comparison (line 78). The heads of SmoothRepresentationsOfLocalGroups (1383569), LocallyAnalyticDistributions (3a4526a) and VStackSheavesAndLisseCategories (0ca8db7) are unchanged since round 1, whose resolution of SR.0.1–SR.1.1, §1.1 and VS2.2 stands.

**Ownership by object** (`roadmaps grep -i --readme-only` over main and the 367 open heads, index of 2026-10-26T03:27:45Z): "suave", "smashing spectrum", "solid Huber", "kernel bicategory|category of kernels": no match anywhere. "Beilinson t-structure": DerivedDeRhamCohomology (cited), AInfCohomology, PrismaticCohomology and Parts II–III (consumers of filtered objects, no second construction). "six-functor formalism": two mentions on main, HabiroCohomologyFoundations and CompletedCohomologyPartII as mentions. "Fredholm": operator-theoretic Fredholm theory elsewhere (LocallyAnalyticDistributions, OperatorKTheory, …), not Fredholm analytic rings. "Cartier dual": the finite flat duality of FiniteFlatGroupsAndIntegralPadicHodgeTheory and its consumers, which 7.2 cites through Tau Ceti. "Betti stack|Betti realization": the Betti realization of motives (MotivesAndAlgebraicCycles, PeriodsAndSpecialValues). "analytic stack": mentions in VStackSheavesAndLisseCategories, SolidAnalyticRings, HabiroCohomologyFoundations, InverseGaloisAndArithmeticFundamentalGroups. The board packages (index of ten) contain no roadmap on these objects. This roadmap is the owner of everything it plans.

**Locator audit, seeded sample.** Each target read at every locator; theorem number, page, hypotheses and statement compared.

- 0.3: LZ12b line 110 (Theorem 0.1, hypotheses (1)–(3) as restated: E₁, E₂ ⊆ E₀, E₀ composition-stable, E₁, E₂ admissible, factorization, E_i stable under pullback by E₁), line 107 (admissibility), line 133 (opposites in L ⊆ {3, …, k}), line 1887 (Theorem 4.27); SixFF line 1071 (Theorem 4.8), 1097 (Theorem 4.10). One slip: R01.
- 0.5: HM line 1911 (Definition 3.3.2 (i)–(iv)), 1924–1948 (Proposition 3.3.3 (a)–(c), conclusion j_! left and f_! right adjoint), 1976 (Lemma 3.3.4 for M = f′*N ⊗ j′*N′), 2042 (Remark 3.3.6); Man22 line 12675 (Proposition A.5.10) with A.5.9 (a)–(d) at 12670–12674; SixFF line 901 (assumption (1)), 918 (Remark 4.2), 1016 (Theorem 4.6); HM line 293 (Remark 1.2.1). One Check defect: R02.
- 0.6: HM line 2057 (Definition 3.4.1), 2258–2271 (Theorem 3.4.11 (i)–(iv), minimal E′, hypersheaves for hyper-subcanonical C), 2329 (Lemma 3.4.13); RCSolid 3767 (Definition 6.1.6), 3912 (Definition 6.2.9), 3918 (Example 6.2.10(2): D-topology = !-topology), 3924 (Theorem 6.2.11); SixFF 1576 (Theorem 5.19), 1585–1596 (Man22 A.5.12 for disjoint unions, A.5.14 for !-local maps, as the route says; Man22 lines 12819, 12879).
- 0.7: HM 2836 (Definition 4.1.3), 2867 (Proposition 4.1.4), 2876–2885 (Proposition 4.1.5, Φ(f) = f′_!(1)), 2924 (Proposition 4.2.1(i)), 3073 (Theorem 4.2.4), 3193 (Proposition 4.3.1, 2-fully faithful into the limit over a sieve of universal ∗-descent, which gives the conservativity stated); RCSolid 3795 (Definition 6.2.1), 3823–3834 (Remark 6.2.3), 3841–3850 (Notation 6.2.4, [−]_* and [−]_! dual), 4117 (Lemma 6.3.6); RC26a 382 (Proposition 2.1.9, κ-presentable, Künneth over S); SixFF 1255–1281.
- 0.12: RCSolid 4146–4160 (Proposition 6.3.7 (a)–(e), C with finite limits, Künneth), 4237 (Definition 6.3.9), 4244 (Lemma 6.3.10, compact units); SixFF 1439 (Theorem 5.12); Mat16 948 (Proposition 3.20).
- 1.1: RCSolid 4457–4464 (E = P = all, I = iso, D → D^cond), 4465–4470 (Remark 6.4.1, D^cond = Fun_{D(ℤ)}(D_!, D(ℤ^cond))), 2971 (Remark 5.4.2); HA 28032 (Theorem 4.8.4.6).
- 1.3: RCSolid 4568 (Proposition 6.4.7) and its proof 4570–4592, which the route follows step by step (affine, quasi-compact separated by Zariski descent, qcqs, δ trivialized through the diagonal and HM Lemma 4.6.4).
- 1.5: RC26a 583–595 (Lemma 2.2.5: static A, R flat, counit of finite Tor amplitude, t-structure, comodules, D⁻ = left bounded derived category of the heart, left completion), 1486 (Lemma 3.1.2, descendability from the trivial representation being a summand).
- 2.8: RCSolid 3236 (Definition 5.5.1), 3240–3257 (Lemma 5.5.2 and mapping spaces R and R ×_{π₀R} R⁺), 3258 (Remark 5.5.3), 3265 (Definition 5.5.4), 3269 (Lemma 5.5.5), 3284 (Proposition 5.5.6), 3333 (Definition 5.6.1), 3377 (Proposition 5.6.4), 3407 (Proposition 5.6.6), 3422 (Lemma 5.6.7), 3426 (Theorem 5.6.8); SixFF 3222 (Theorem 9.8), 3256 (Theorem 9.10), 3259 (Warning 9.11), 3369 (Theorem 9.15 (i)–(iv)); Man22 4944 (Proposition 2.9.6). One slip: R03.
- 3.5: RCSolid 5180 (Definition 7.3.1, footnote 16 with κ-compact solid Huber rings), 5185–5199 (Definition 7.3.2 (1)–(3)), 5203–5249 (Example 7.3.4 (1)–(4), the non-open localization (ℤ[T], ℤ) → (ℤ[T^{±1}], ℤ) at 5248–5249); And21 1596 (Theorem 4.1).
- 4.2: HM 4386 (Proposition 5.1.12), 4479 (Definition 5.2.1), 4875 (Definition 5.3.17), 4882 (Example 5.3.18), 4885 (Proposition 5.3.19), 4900 (Lemma 5.3.20), 4911–4927 (Example 5.3.21, δ(g) = [gKg⁻¹ : K]), 4928–4947 (Example 5.3.22, ω = 1[cd] twisted by d_G = det(g)·|det(g)|_p), 4950 (closed subgroups fine).
- 6.4: RCSolid 4874–4905 (Proposition 7.1.11: f* = Hom_{ℤ_■}(ℤ[T]^∨, −), ℤ[T]^∨ = ∏_ℕ ℤ compact projective, f_♮, f_! = p_* j_!, fib(ℤ[T] → ℤ((T⁻¹))) ≅ ℤ[T]^∨[−1], f_! ≅ f_♮[−1], f^! ≅ f*[1]), 5827–5840 (Theorem 7.7.1 and its reduction to standard smooth maps); SixFF 3430–3435.
- 7.1: RC26a 675 (Definition 2.3.1), 678–700 (Theorem 2.3.2 (1)–(4)); Lur18a 1311 (Definition 3.3.1), 1757 (Proposition 3.8.1, with geometric realizations preserved by ⊗), 1811 (Remark 3.8.4), 1837 (Proposition 3.8.5), 1915 (Proposition 3.9.9).
- 7.4: RC26a 1461 (Lemma 3.0.3), 1482 (Lemma 3.1.1), 1486 (Lemma 3.1.2), 1495–1514 (Proposition 3.1.3 and the class (Tⁿ)), 1518–1526 (Theorem 3.1.4 (1)–(2)).
- 7.7: RJRC 2028 (Definition 4.4.1, sup |a_n| p^{−r|n|} < ∞ for some r, equivalent to the README's |a_n| r^{|n|} → 0 for some r), 2134 (Proposition 4.4.8, both equivalences, natural in base change), 2141–2153 (the route: f cohomologically smooth, f_♮ = f_!(− ⊗ f^!1), Barr–Beck–Lurie, f*f_♮1 = ℓ^temp).
- Repaired passages: RCSolid 2633 (Corollary 5.3.9), 5315–5338 (Lemma 7.4.5, Corollary 7.4.6, Proposition 7.4.7 with the 2n bound over ℚ); SAG 62445, 63043; HA 28032, 28528; MW 441; And21 1574, 2673, 2681, 2733, 2779, 2978; HM 2329; RC26a 1461, 2172; DerivedDeRhamCohomology §§1.18–1.19.

No author-flagged unverified locator exists in plan.json or the README.

**Library declarations at the pins.** Unchanged from round 1 (Mathlib 6b7abb3c, Tau Ceti a91d3aaf); the contract lists the same 23 Mathlib declarations and the one Tau Ceti declaration with the same files and lines, and the repairs added none.

**Headline theorems.** The summary names six: the extension theorem (0.6), the quasi-coherent formalism on AnStk(C₀) (3.3), the realization of algebraic stacks (3.8), the classifying-stack duality (4.2), solid Serre duality (6.6) and stacky Cartier duality (7.6). None is statable at the pins (no ∞-category of correspondences, no analytic ring, no kernel bicategory in Mathlib or Tau Ceti), so the package's module docstring will say so for each; no Suggested.lean exists at the design stage and elaboration is not available in this lane (this lane does not elaborate; say so in the report). Padding cannot be probed without a Lean file.

**Adversarial pass.** One row per statement checked this round, with the values computed.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 3.4 Check (F01) | A = 𝔽_p, ℤ/p^s; ℤ[1/p]; ℤ[T] | ℤ[[q]]/(1 − nq) = 0 (inverse Σ nᵏqᵏ), so solid ⇒ n-solid and (A, ℤ)_■ = A_■ for A integral over ℤ; ℚ_p with T⁻¹ = p is a ℤ((T⁻¹))-module, Hom ≠ 0, not (1/p)-solid; ℤ((T⁻¹)) killed by j* | repaired text true |
| 1.7 import (F03) | gr⁰ static; gr¹ static; V = D(ℚ) | DF^{≤0}: gr^i ∈ D^{≤i} ⟺ gr^i[i] connective ⟺ ⊕ M_n[n] connective with M_n = gr^n; weight-one static object in the heart as M₁[1] | matches DerivedDeRhamCohomology §1.18 and its weight-one Check |
| 4.4(3) nonderived (F08) | A = ℤ, M = ℤ/p, B = ℚ; B = ℤ × ℚ | π₀(ℤ/p ⊗ ℚ) = 0 with ℤ/p ≠ 0 (B not conservative, excluded); π₀(ℤ/p ⊗ (ℤ × ℚ)) = ℤ/p ≠ 0 | true as restated |
| 4.4(6) light form (F04) | (ℚ_p, ℤ_p) | dualizable objects of D(ℚ_{p,■}) = perfect ℚ_p-complexes; And21's inputs (resolutions by (A, A⁺)_■[S], trace-class factorisation, Lemma 5.51 on M[S]) listed in the route | consistent |
| 0.6 disjoint unions (F07) | two-point family; X ↪ X ⊔ Y | inclusion is the pullback of ∗ → ∗ ⊔ ∗ (HM 2337); D(⊔X_i) = ∏ D(X_i) by sheafiness | hypothesis correct |
| 7.6 !-ability (F05) | M = N = 𝔾_a over ℤ^cond | [N]_! defined only for !-able N (7.2); RC26a 2172 assumes M, N, D(R) !-able | hypotheses present |
| 7.4 B𝔾_m (F09) | L = ℤ[1]; L = ℤ | ℤ[1] invertible, no !-cover trivializes it (degree preserved by base change): excluded; ℤ: included | restatement correct |
| 0.3 (1) | X = point; X = Cpt₁ | δ*₂X = δ*₂∇X = Δ⁰; Cpt₁ has vertices (0,0), (0,1), (1,1) in the source, (0,0), (1,0), (1,1) as written | R01 |
| 0.3 (2) admissibility | surjections of finite sets | p: ∗⊔∗ → ∗ surjective, q: ∗ → ∗⊔∗ not, p∘q = id | Check 3 correct |
| 0.5 (a)–(c) | sets, I = P = all, D(Λ); Fun(X, Set) | M ⊗ ∏ Λ = ⊕_ℕ ∏_ℕ Λ → ∏_ℕ ⊕_ℕ Λ misses the identity matrix for M = ⊕_ℕ Λ: (b) fails; in sets S × ∏ T_n = ∏ (S × T_n) and S × ⊔ T_n = ⊔ (S × T_n): (a), (b) hold; ⊔_m ∏_n ∗ = ℕ → ∏_n ℕ not surjective: (c) fails | R02 |
| 0.5 Lemma 3.3.4 | j: 𝔾_m → 𝔸¹, p: ℙ¹ → ∗ | j mono, j*j_♮ = id (SixFF 919), so (c) holds for all objects | Check 2 correct |
| 0.6 constant formalism | empty cover of ∅ | sheaf condition forces D(∅) = lim over the empty diagram = ∗; constant has D(Λ) | not sheafy, correct |
| 0.7 convolution | finite sets {1,2}; 𝔸¹_k, M = N = O | matrix product with identity diag(Λ, Λ); N ⋆ M = π_!O = T⁻¹k[[T⁻¹]][−1] ≠ π_*O = k[T]; Ψ(N)Ψ(M)(k) = π_!O | ! is forced |
| 0.7 2-full faithfulness | S = ∗, C one object | Fun^L_{D(Λ)}(D(Λ), D(Λ)) = D(Λ) = D(∗ × ∗) | consistent with Lemma 6.3.6 |
| 0.12 (a)–(e) | ℤ → ℤ[1/p] × ℤ_p; ℤ → ℤ[1/p]; empty family | ℤ = fib(ℤ[1/p] ⊕ ℤ_p → ℚ_p) with ℚ_p = ℤ[1/p] ⊗ ℤ_p a B-module: descendable, index ≤ 2; 𝔽_p ⊗ ℤ[1/p] = 0: not conservative; D(X) = 0 iff empty cover | consistent |
| 0.12 finite subfamily | 1_X compact | hypothesis of RCSolid 6.3.10 is compactness of 1_X for all X (line 4244) | as stated |
| 1.1 suave vs smooth | ℤ[T]/T²; ℤ[x,y]/(x²,xy,y²); ℤ[T]; 0 | T·T^∨ = 1^∨ so ω = B·T^∨ ≅ B; ω/𝔪ω of rank 2 (x^∨, y^∨) so not invertible; ℤ[T] not perfect over ℤ; D(0) = 0 | Checks correct |
| 1.1 duality formula | R = ℤ[T] | Fun^L_{D(ℤ)}(Mod_{ℤ[T]}(D(ℤ)), D(ℤ^cond)) = Mod_{ℤ[T]}(D(ℤ^cond)) by HA 4.8.4.6 | consistent with Remark 6.4.1 |
| 1.3 | ℙ¹_ℤ; j: 𝔾_m → 𝔸¹ | f_*O = ℤ, δ ≅ 1 through the affine diagonal; j affine so j_! = j_* | consistent with the proof at RCSolid 4574–4592 |
| 1.5 comodules | 𝔾_m; trivial G; 𝔾_a over 𝔽_p | R = A[T^{±1}]: grading by the exponent; R = A; φ(T) ⊗ 1 + φ(1) ⊗ T = φ(T) ⊗ 1 forces φ(1) = 0, no retraction; R = 𝔽_p[T] countable flat, index ≤ 2 | Checks correct; hypotheses match RC26a 583–586 |
| 2.7(7), 2.8(3) colimits | empty colimit | ℤ ↦ ℤ_■, (ℤ, ℤ) ↦ ℤ_■; initial analytic ring ℤ^cond; ℤ[ℕ ∪ {∞}] not solid so ℤ_■ → ℤ^cond is no map | R03 |
| 2.8 Huber pairs | (ℤ[T], ℤ), (ℤ[T], ℤ[T]); 𝔽₂[ε]/ε² | mapping spaces R and R ×_{π₀R} R⁺ (RCSolid 3254–3256); (εT)² = 0 so εT integral, matching SolidAnalyticRings line 784 | Checks correct |
| 2.8 rational localization | (R, R⁺) → (R[1/g], R(f/g)⁺) | closed localization (R⁺ enlarged, more tests) followed by open localization (invert g) | matches RCSolid 5238–5240 |
| 3.5 solid spectrum | closed disc over ℚ_p; (ℤ[T], ℤ) ⊇ (ℤ[T^{±1}], ℤ); ∅ | ℚ_{p,■} ⊗_{ℤ_■} ℤ[T]_■ = (ℚ_p⟨T⟩, ℤ_p⟨T⟩)_■ (Example 7.1.10), Spec_■ = Spa by 2.10 (sheafy Tate); the classical localization is not an open immersion (RCSolid 5248); empty spectrum, D = 0 | Checks correct |
| 3.5 κ-compact subcategory | footnote 16 | the source itself proposes κ-compact solid Huber rings for uncountable regular κ | as stated |
| 4.2 modulus | g = diag(p, 1), K = B(ℤ_p); diag(1, p) | gKg⁻¹ has upper-right entries in pℤ_p, index p in K, so [gKg⁻¹ : K] = p⁻¹; the inverse matrix gives p; SmoothRepresentationsOfLocalGroups line 179 gives p⁻¹ | convention witness holds |
| 4.2 Poincaré | ℤ/p over 𝔽_p; free pro-p on infinite I; ℤ_p over 𝔽_p; GL₂(ℤ_p) over ℚ_p | cd = ∞, not fine; cd 1 with H¹ = 𝔽_p^{|I|}, not Poincaré (HM 4882); ω = 𝔽_p[1], det(Ad) = 1; cd 0, ω = 1 | consistent |
| 4.5 non-Fredholm | CS22 Example 9.6 | polynomial-growth sequences with T = (1, 2, 3, …): dualizable, not discrete, not perfect anywhere | R05 |
| 6.4 dualizing complex | ℤ[T][1]; f_!f^!1 | π₁ = ℤ[T], π₀ = 0; f_!(ℤ[T][1]) = T⁻¹ℤ[[T⁻¹]] in degree 0; T⁻¹ℤ[[T⁻¹]] ≅ ∏_ℕ ℤ ≅ ℤ[T]^∨ by the residue pairing; trace = coefficient of T⁻¹ (SixFF 3434) | consistent |
| 6.4 ⊗ with the zero section | ι^!f^! | ℤ[−1] ⊗_{ℤ[T]} ℤ[T][1] = ℤ | ι^!f^! = id |
| 3.3 (headline) | C₀ = spectra of ℤ_■ⁿ | ring maps ℤ^m → ℤⁿ = set maps n → m; AnStk(C₀) ≃ Ani, D(K) = Fun(K, D(ℤ_■)) | Check correct |
| 3.8 (headline) | Spec R; B𝔾_m × AnSpec ℤ_■ | Mod_R(D(ℤ^cond)); graded solid groups, t of weight −1 | consistent with ALRS 1866–1890 |
| 6.6 (headline) | 𝔸²_ℤ; ℙ¹_ℤ | det(O dT₁ ⊕ O dT₂) = O, f^!1 = O[2], L[2] = O²[2] not invertible; ω = O(−2)[1] pairs H⁰(O) = ℤ with H¹(O(−2)) = ℤ, while O[1] would pair with H¹(O) = 0 | determinant form is the theorem |
| 7.1 (2)–(4) | ℤ[ℤ/n]; A = 1; ℤ[T] | A^∨ = ℤ^{ℤ/n}, D(μ_n) = ℤ/n; D(∗) = ∗; characters 𝔾_a → 𝔾_m over ℤ: u ∈ {±1} with u(0) = 1 so u = 1, and f(X+Y) = f(X)f(Y) forces deg f = 0; ℤ[T]^∨ a nontrivial ring | dualizability needed |
| 7.4 convolution | ⋆_! on B𝔾_m; on ℤ^Betti | (M ⋆ N)_n = M_n ⊗ N_n (diagonal of the bigrading); (M ⋆ N)_n = ⊕_{i+j=n} M_i ⊗ N_j; class (Tⁿ)_{n∈ℤ} sends the n-th basis vector to Tⁿ | Check correct |
| 7.6 (headline) | St_n ⊗ St_n; rank 0; rank 1 | scalar λ acts by λ², not invariant; identity; 7.5(1) and 7.5(5) | hypotheses as RC26a 2172 |
| 7.7 ℓ^temp | (1)_n; (p^{−n²})_n; pointwise product; convolution | |1| r^{|n|} → 0 for r < 1; p^{n²} r^{|n|} → ∞ for every r; (rs)^{|n|} bound closes the product; 1 ∗ 1 diverges | matches RJRC Definition 4.4.1 |
| 2.3(7) via HA 4.8.5.13 | Δ^op; filtered poset; empty diagram | weakly contractible, covered; empty not covered, pushouts handled by localization in the route | citation fits |
| 5.2 connectivity (SAG) | M = ℤ[1], ℤ[2]; Sym(ℤ[1]) → ℤ | Sym^m(ℤ[1]) = ∧^m(ℤ)[m] = 0 for m ≥ 2, Sym^m(ℤ[2]) = ℤ[2m]: bounds m + n − 1 and n + 2m − 2 tight; fibre of ε first nonzero in π₄ for n = 1: (n + 3)-connective, tight | SAG 25.2.4.1, 25.3.6.1 restated correctly for simplicial rings |

## Not verifiable

- Lean elaboration: not available in this lane; no Suggested.lean exists at the design stage, so the one-tactic padding probe and the `#check` pass could not be run.
- The uniqueness clause of RCSolid Corollary 6.3.4 rests on CLL25, which the design does not cite and which is not a target (as in round 1).
- Ownership against open pull requests was checked through the project's grep over all 367 heads and the board-package index; sibling checkouts without files were not read separately.

## Source issues

- **Misprint** in RCSolid at Proposition 5.4.11, printed page 62: the source says the solidification functor from animated rings to analytic rings commutes with colimits; it should say non-empty colimits, since the initial ring goes to ℤ_■ while ℤ^cond is initial; affects nothing.
- **Misprint** in RCSolid at Proposition 5.5.6, printed page 65: the source says the functor from discrete Huber pairs to analytic rings is colimit preserving; it should say non-empty colimits, as Man22 Proposition 2.9.6(ii) does; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "83c693990026fb1d2033b7ae9c0a800c3157c8d7", "job": "REV-DESIGN-AnalyticStacks~2", "model": "fable", "worker": "chris-i"} -->
