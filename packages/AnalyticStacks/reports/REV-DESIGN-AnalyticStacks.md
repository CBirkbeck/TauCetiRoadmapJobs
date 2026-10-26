<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2123#issuecomment-6407272866 -->
Review (claude) of a33e98f

Verdict: needs_changes

1. **F01** (P2) 3.4 Check: A_■ is not smaller than (A, ℤ)_■ for A integral over ℤ

   - **Location.** `packages/AnalyticStacks/design/README.md` line 691, third Check of 3.4: "A_■ is strictly smaller for A ≠ ℤ of finite type (it adds a-solidity for a ∈ A)".
   - **Claim.** For every finitely generated ℤ-algebra A ≠ ℤ, the complete modules of A_■ form a strictly smaller category than those of the induced structure (A, ℤ)_■.
   - **Witness.** A = 𝔽_p. Every solid module is n-solid for every integer n: the base change of ℤ((T⁻¹)) along T ↦ n is ℤ[[q]]/(1 − nq) = 0, since 1 − nq is a unit of ℤ[[q]] (the same computation the design uses in 2.11 for x ∈ ℤ_p). So every (𝔽_p, ℤ)_■-complete module is a-solid for every a ∈ 𝔽_p and (𝔽_p)_■ = (𝔽_p, ℤ)_■. The design's own 2.7(4) says so: RCSolid Corollary 5.3.9 (RCSolid line 2633) gives A_{R_■/} = A_■ for every integral map R → A of finitely generated algebras, hence for ℤ → 𝔽_p, ℤ → ℤ/p^s, ℤ → ℤ[ε]/ε², ℤ → ℤ[i]. The Check is false for exactly the coefficient rings ℤ/p^s that the previous Check of 3.4 and the consumer HigherHidaAndColemanTheory use.
   - **Repair.** Replace the clause by: "A_■ is strictly smaller than (A, ℤ)_■ exactly when some element of A is not solid for the induced structure, for instance A = ℤ[T] (T is not solid, 2.9) or A = ℤ[1/p] (the solid ℤ[1/p]-module ℚ_p is not (1/p)-solid, since Σ pⁿ·(1/p)ⁿ diverges, as in the second Check of 2.7); for A integral over ℤ, in particular ℤ/p^s and ℤ[ε]/ε², the two structures coincide by 2.7(4)". Tested on the refuting instance A = 𝔽_p (coincide, by RCSolid Corollary 5.3.9) and on A = ℤ[1/p] (differ, by the divergent series).

2. **F02** (P3) Locator: RCSolid Remark 5.4.2 is at line 2971, not 4471/4473

   - **Location.** README line 348 (1.1 API, "RCSolid Remark 5.4.2, RCSolid line 4473") and line 463 (2.1 API, "RCSolid Remark 5.4.2, RCSolid line 4471").
   - **Claim.** The remark identifying D(R^cond) with D(R) ⊗_{D(ℤ)} D(ℤ^cond) and D(R) with the discrete R^cond-modules is at those lines.
   - **Witness.** RCSolid line 2971 is "Remark 5.4.2" and states exactly this; RCSolid lines 4471 to 4474 are the clause of Remark 6.4.1 on D_A for an analytic ring A.
   - **Repair.** Cite "RCSolid Remark 5.4.2, RCSolid line 2971" at both places.

3. **F03** (P3) 1.7 restates the Beilinson t-structure owned by DerivedDeRhamCohomology §§1.18–1.19

   - **Location.** README line 434 (1.7): "that the Beilinson t-structure (M connective iff ⊕ M_n[n] connective) is a t-structure; and that its heart is the symmetric monoidal category of chain complexes in V♡".
   - **Claim.** Existence of the Beilinson t-structure on complete filtered objects and the identification of its heart with chain complexes are planned here.
   - **Witness.** DerivedDeRhamCohomology (merge order line 20, before this roadmap) §1.18 "The Beilinson t-structure" defines it on DF(A), notes that on complete filtered objects the coconnective half is tested on graded pieces, and §1.19 "The Beilinson heart is the category of complexes" proves the heart is Ch(A). The design's Scope names no owner for this object and 1.7's *Needs:* line does not cite it.
   - **Repair.** Add DerivedDeRhamCohomology §§1.18–1.19 to the Scope bullet "Algebra, schemes and stacks", to 1.7's *Needs:* line and to the Layer 1 Dependencies; state 1.7's clause as the transport of that t-structure along the equivalence of 1.6 to a general QCoh(ℚ)-linear V, with DerivedDeRhamCohomology §1.19 as the case V = D(A), A a ℚ-algebra.

4. **F04** (P3) 4.4(6) does not say that And21 works with κ-condensed modules

   - **Location.** README line 803, clause (6): "for a sheafy analytic complete Huber pair (A, A⁺) ..., (A, A⁺)_■ is Fredholm (And21 Theorem 5.50 and Corollary 5.51.1)".
   - **Claim.** The source proves the statement at the generality used (light solid Huber rings).
   - **Witness.** And21 is written for condensed modules on extremally disconnected sets (And21 line 1574, "for every extremally disconnected set S"); the design's analytic rings are light (Conventions). For HM the design says the light statement is a target here (README line 779, "follow HM §§5.1–5.3 verbatim with light profinite sets in place of κ-small ones"); for And21 it does not.
   - **Repair.** Add to 4.4 the sentence "And21 proves (6) for κ-condensed modules; the light statement is a target here, by the same approximation argument (And21 §5.3), which uses only that the compact projective generators of D((A, A⁺)_■) are the (A, A⁺)_■[S] and the trace-class factorisation of nuclear maps".

5. **F05** (P3) 7.6: M, N and D(R) must be !-able

   - **Location.** README line 1080: "For a !-able ring stack R/S with a Cartier dual D(R) and exponential, R-modules M, N with an R-linear Ψ: M ⊗_R N → D(R) inducing [BM]_* ≅ [N]_!".
   - **Claim.** RC26a Proposition 3.3.3 holds for arbitrary R-modules M, N.
   - **Witness.** RC26a line 2172: "let M, N/S be !-able R-modules on AnStk_{/S}. Suppose that there is a !-able R-module D(R)"; the coalgebra [N]_! is only defined for N !-able over S (7.2).
   - **Repair.** Write "!-able R-modules M, N over S and a !-able Cartier dual D(R)".

6. **F06** (P3) Sources cited in the README but absent from the manifest

   - **Location.** README line 81 ("MW Theorem 2.4"), line 340 ("Lurie's HA Theorem 4.8.4.6"), line 498 ("HA Corollary 4.8.5.14"), line 868 ("Lurie, SAG Propositions 25.2.4.1 and 25.3.6.1").
   - **Claim.** Every cited work is recorded in `packages/AnalyticStacks/sources.toml`.
   - **Witness.** The manifest has 24 entries and no key for MW (Meyer–Wagner, *q-Hodge complexes and refined TC⁻*, arXiv:2410.23115, the key RefinedTraceMethods uses), for Higher Algebra or for Spectral Algebraic Geometry; both Lurie texts are on his author page (licence class author-page).
   - **Repair.** Either record HA, SAG and Meyer–Wagner through the sources service with those locators, or drop the theorem numbers and cite the supplier sections that carry those facts (RefinedTraceMethods §4.3 for the closure theorem; EnhancedDerivedSheaves E5:presentability.2 and E5:cotangent-export.1 for the HA and SAG facts).

7. **F07** (P3) 0.6: the disjoint-union hypothesis is misstated

   - **Location.** README line 196: "stable under disjoint unions when the inclusions X → X ⊔ Y lie in E".
   - **Claim.** The hypothesis of HM Lemma 3.4.13 is a condition on E.
   - **Witness.** HM line 2329: the hypothesis is that ∗ → ∗ ⊔ ∗ lies in E′ in X = Shv(C); C need not have coproducts, so "lie in E" has no meaning there (0.13, line 314, states it correctly for C with finite coproducts).
   - **Repair.** Write "stable under disjoint unions when ∗ → ∗ ⊔ ∗ lies in E′ (HM Lemma 3.4.13)".

8. **F08** (P3) 4.4(3) and (5): the tensor product is the non-derived one

   - **Location.** README line 803, clause (3) "a finitely generated static A▷(∗)-module M with M ⊗_A B = 0 vanishes" and clause (5) "every finitely presented static A-module M with M ⊗_A Ā = 0 vanishes".
   - **Claim.** With the Conventions ("every tensor product ... is the derived one") the hypothesis is M ⊗^L_A B = 0.
   - **Witness.** Sch24 line 1721 and line 1756 assume the vanishing of the non-derived tensor product π₀(M ⊗^L_A B); the proof of Corollary VI.1.3 (Sch24 line 1731) applies the proposition to the rightmost quotient, for which only π₀ of the derived tensor is known to vanish, so the derived form of (3) is too weak for clause (4) and for the API bullet on π₀A.
   - **Repair.** Write "π₀(M ⊗_A B) = 0, the ordinary tensor product" in (3) and (5).

9. **F09** (P3) 7.4: the functor represented by B𝔾_m

   - **Location.** README line 1052: "B𝔾_m represents A ↦ the anima of invertible objects of D(A) of the form of line bundles".
   - **Claim.** Vague: which invertible objects.
   - **Witness.** RC26a line 1461 (Lemma 3.0.3): the invertible L ∈ D(A) for which there is a !-cover A → B with B ⊗_A L ≅ B.
   - **Repair.** Write "the anima of invertible objects of D(A) that become isomorphic to the unit after a !-cover A → B".

One P2 finding (a false Check in 3.4 that contradicts 2.7(4)) and eight P3 notes. The design is otherwise sound: the principles hold, the dependency check is clean, every sampled locator resolves, every supplier section exists where it is cited, and the single declared gap is precise and minimal. No previous review exists for this design.

## Verified sound

**Principles.** The design plans a general library: light analytic rings over arbitrary light condensed animated rings (2.2), AnStk(C₀) for every admissible C₀ (3.3), Serre duality for every locally solid smooth map of solid Huber rings (6.6); the ℚ_p statements are instances or Checks. Nothing on main or in an open pull request is re-planned (ownership below). Supply is downward only (gate below). Statements are in the author's words; I compared the sampled passages with the sources and found no copied passage. No algorithm, no Lean file, no `set_option`, no process words, no LaTeX delimiters, no local paths (grep over the README).

**Dependency check.** Output of the gate run on the candidate README with the board's merge order:

    candidate: AnalyticStacks is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
    depcheck: 56 roadmaps, 646 edges, 0 problem(s)

No UPWARD or CYCLE line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.

**Library declarations at the pins** (Mathlib 6b7abb3c, Tau Ceti a91d3aaf, the pins of `lake-manifest.json`). All 23 Mathlib declarations of the supplier contract are at the stated file and line: `SSet.Quasicategory` (Basic.lean:41), `CategoryTheory.Bicategory` (Basic.lean:61), `Bicategory.Adjunction` (Adjunction/Basic.lean:89), `Bicategory.Equivalence` (:242), `Pseudofunctor` (Pseudofunctor.lean:57), `Span.SpanBicat` (Span/Basic.lean:151, instance :364), `MorphismProperty.IsStableUnderBaseChange` (Limits.lean:107), `.diagonal` (:796), `.IsMultiplicative` (Composition.lean:202), `LightProfinite` (Basic.lean:42, `EssentiallySmall` :403), `LightCondensed` (Basic.lean:28), `LightCondMod`/`LightCondAb` (Module.lean:42, 85), `Locale` (Locale.lean:25), `SpectralSpace` (Spectral/Basic.lean:38), `KaehlerDifferential` (Kaehler/Basic.lean:148), `AlgebraicGeometry.Smooth` (:59), `SmoothOfRelativeDimension` (:127), `IsProper` (Proper.lean:41), `IsSeparated` (Separated.lean:43), `AbstractMeasure.amiceTransformEquiv` (AmiceTransform.lean:157). `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality` is at FiniteLocallyFree.lean:271, an anti-equivalence over an arbitrary commutative ring, as the Check of 7.2 says. Mathlib at the pin has `PriestleySpace` (Topology/Order/Priestley.lean:41, three separation lemmas) and the category `BddDistLat`, but no duality theorem between spectral spaces and bounded distributive lattices, and `CondensedMod.IsSolid` only for the non-light site: the design's claims about what Mathlib lacks are correct.

**Suppliers resolved** (every cited section opened). On main: EnhancedDerivedSheaves E0.3–E0.8, 0.1–0.3, E1.3, E1.8, E2.6–E2.7, E3.1–E3.4, E4.1, E5:abstract.1–5, E5:presentability.1–4 (E5:presentability.2 has `presentableTensor` and `categoricalModuleBaseChange`, so Lurie's tensor product and module base change are supplied as claimed), E5:descent, E5:animation.1 and .4 (θ), E5:cotangent-export.1–2; DerivedModuleAlgebra §§0.4 (`Algebra.CotangentComplex.*`), 0.6, 0.12, 0.13, 0.14, 0.K.1, 1.E.0 (perfect complexes); SchemeAndStackFoundations §§1.15, 1.18–1.22, 2.18; AdicSpaces §§2.1, 2.2, 3.1; AdicSpacesPartII §R0.16, §R1.1. At open heads: SolidAnalyticRings (5d395ae) §§1.5, 2.1–2.4, 7.1–7.4 with gap:light-measure-site-comparison, and its §7.3 Checks on ℚ_p with f = p⁻¹ (line 814) and on 𝔽₂[ε]/ε² (line 784) that 2.7 and 2.8 claim agreement with; RefinedTraceMethods (9dd2691) §§4.1–4.3 ("Nuclear objects" at line 1596 defines nuclearity by trace-class maps from compacts, cites MW Theorem 2.4, and states no Hom criterion); SmoothRepresentationsOfLocalGroups (1383569) SR.0.1, SR.0.2, SR.0d.1, SR.0d.2, SR.1.1 and Conventions "Measures and modulus" with δ_B(diag(p, 1)) = p⁻¹ (line 179); LocallyAnalyticDistributions (3a4526a) §1.1 and Conventions item 5, δ_a ↦ (1 + T)^a (line 64); VStackSheavesAndLisseCategories (0ca8db7) VS2.2 with `SolidECoefficients` (line 749) and `ZSolidAnalytification` (line 757), VS1.1 `KernelCategory` (line 274, an étale instance, not an abstract formalism).

**Declared gap.** gap:nuclear-hom-criterion is in `plan.json` (gaps[0], supplier RefinedTraceMethods, section §4.3, neededBy 4.3) and in the README under the RefinedTraceMethods contract with the same slug and a one-sentence `needs`. It is precise (the two criteria are stated with their hypotheses), minimal (RefinedTraceMethods §4.3 at its head states only the trace-class criterion; the equivalence is CS22 Definition 8.5 plus the lemma before it, which no roadmap states), and owned by the roadmap that owns nuclear objects. Acceptance of the repaired design should be conditional on it.

**Ownership by object** (`roadmaps grep` over main and the 367 open heads, index 2026-10-26, and the board packages). No match anywhere for "suave", "smashing spectrum", "cotangent complex of analytic"; "six-functor formalism" occurs on main only as a mention in AdicSpacesPartIV (line 4895) and PerfectoidSpaces (line 13411); "Liu–Zheng" in EnhancedDerivedSheaves refers to *Enhanced six operations* §§2–3 (coefficient diagrams), not to the gluing theorems of LZ12b; "Stone duality/distributive lattice" on main only in GraphConnectivityAndFlows (a finite lattice); "analytic ring" in PadicDifferentialEquationsAndRigidCohomology means Kedlaya's rings Γ_an, in ComplexComparisonPartII and FormalConnectionsOpers an analytic ringed space; "Betti" in MotivesAndAlgebraicCycles and PeriodsAndSpecialValues is the Betti realization of motives; "Cartier dual" in FiniteFlatGroupsAndIntegralPadicHodgeTheory and siblings is the classical finite flat duality that 7.2 cites through Tau Ceti; "analytic stack" occurs only as mentions (VStackSheavesAndLisseCategories, SolidAnalyticRings, HabiroCohomologyFoundations, InverseGaloisAndArithmeticFundamentalGroups); "Beilinson t-structure" is owned by DerivedDeRhamCohomology §§1.18–1.19 (R03). The consumer packages RationalAnalyticPrismatization, HigherHidaAndColemanTheory, MotivesAndAlgebraicCyclesPartII and AutomorphicBundlesPartII exist under `packages/` on the board. So this roadmap is the owner of everything it plans except the Beilinson t-structure clause.

**Locator audit.** A script compared every "(Source Label n.m.k, Source line N)" pair of the README with the cached extractions: 323 labels found within five lines of the cited line (HM's "n.m.k. Deﬁnition" style included); the residual mismatches are ranges whose line points at the first label, item numbers of examples, and one real error (R02). The seeded sample was read at its locators and the statements compared with the sources:

- 0.13: RCSolid lines 4283 (Hypothesis 6.3.11), 4295 (Definition 6.3.13), 4299, 4330, 4338, 4358, 4364, 4370, 4381, footnote 14 at 4311 (the ℵ₁-compact map convention of the README matches it word for word); ABFJ22 line 85 (Theorem 4.3.3, for a set Σ of maps); ABLB lines 2109, 2162, 2175, 2235–2252.
- 1.1: RCSolid 4457–4474; Remark 5.4.2 at 2971 (R02).
- 1.3: RCSolid 4568 (Proposition 6.4.7, qcqs maps !-able, prim, δ ≅ 1).
- 1.4: RCSolid 4641, 4647, 4650, 4687, 4695, 4702, 4736; Mat16 1174 (Proposition 3.34). The direction j_* fully faithful with image the derived complete modules is the proof's (RCSolid 4731).
- 1.7: ALRS 1893–1899 (over ℚ_{p,■}), 1900 (Remark 2.9.2), 1907–1910 (linear variants); BZSV 5593 (§6.3).
- 2.4: RCSolid 1898 (Theorem 4.4.1, conditions (1)–(4) as restated), 1912, 1961, 1968, 2004; CSAnal 3304.
- 2.6: SolidAnalyticRings §§2.3, 7.1–7.3 at the head (above).
- 2.11: RCSolid 1309 (ℤ_p idempotent), 1336 (Example 3.5.4), 4860 (Example 7.1.10); CSCond 1685 (Examples 7.3(ii)).
- 4.4: Sch24 1720, 1727, 1733, 1743, 1753, 1755, 1765; CS22 3157, 3168, 3577, 3588, 3612, 3639, 3650, 3666, 3716–3730; And21 69 (standing hypothesis: sheafy analytic complete Huber pair), 2733, 2978.
- 5.1 and 5.2: RCSolid 5257, 5266, 5276, 5295–5313, 5315, 5324, 5329, 5339, 5347; ALRS 9427, 9435–9440.
- 6.6: RCSolid 6208 (Theorem 7.7.21), 6255 (Corollary 7.7.23), 6270 (Remark 7.7.24); CSCond 2706, 2853, 2865; ALRS 8825.
- 7.2: RC26a 721, 764, 817, 835, 854, 861; HM 3193.
- 7.4: RC26a 1461, 1482, 1486, 1495, 1518.
- 7.6: RC26a 2025, 2028, 2053, 2078, 2085–2109, 2171.

Beyond the sample I read HM 1911, 1924, 2057, 2258, 2329 (0.5, 0.6), HM 4386, 4479, 4875–4945 (4.2), HM 2691 (4.1), SixFF 1016, 1071, 1097, 1439, 1576–1602, 3208, 3222, 3259, 3369, 3425–3450 (0.3, 0.5, 0.6, 0.12, 2.7, 3.4), LZ12b 110 and 1887 (0.3), RCSolid 1392, 1431, 1522, 1664, 1861–1891, 2040, 2091, 2268, 2292, 2419–2436, 2633, 3157–3215, 3979, 4025–4047, 4101–4122, 4146–4160, 4237–4246, 4418, 4435, 4508–4524, 4562, 4614, 4779–4820, 5082, 5458, 5498, 5589, 5605, 5619–5647, 5741, 5766, 5827–5840, 5849–5905, 6162–6177 (2.1–2.3, 2.5, 2.7, 2.9, 2.10, 3.1–3.4, 6.1–6.5), ABLB 6767–6862 and Bos23 3601 (4.3), RC26a 675, 678, 897, 928–948, 1023, 1030, 1081, 1085, 1215, 1225, 1318–1340, 1620–1624, 1941 (7.1, 7.3, 7.5), RJRC 57 and 2028–2031 (7.7: ℓ^temp is the pointwise-product algebra of sequences with sup |a_n| p^{−r|n|} < ∞ for some r, equivalent to the README's |a_n| r^{|n|} → 0 for some r; K a complete nonarchimedean extension of a finite extension of ℚ_p), Lur18a 1311, 1757, 1837, 1915 (7.1), Man22 4944, 12675, Mou 26, 168, Mat16 948, 1134, BHL17 134. All support the statements as written, with the qualifications in R04, R05, R07, R08 and R09.

**Shape and Checks.** `plan.json` has 8 layers, 60 targets, each with 3 tests (180); the README has three Checks per definition, exact hypotheses on each theorem, a locator on each claim, `### Examples` and `### Dependencies` on each layer, the upstream headings, Unicode mathematics and ASCII in code spans. No Suggested.lean exists at the design stage; the Lean lane is not available (this lane does not elaborate), and nothing was elaborated. Headline theorems named in the summary: the extension theorem (0.6), the quasi-coherent formalism on AnStk(C₀) (3.3), the realization of algebraic stacks (3.8), the classifying-stack duality (4.2), solid Serre duality (6.6) and stacky Cartier duality (7.6). None is statable at the pins: Mathlib and Tau Ceti have no ∞-category of correspondences, no analytic ring and no kernel bicategory, so the package's module docstring will have to say so for each; the only pinned carriers it can use are those listed in the supplier contract.

**Adversarial pass.** One row per statement checked, with the values computed.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Conventions, kernels | finite sets {1,2} over a point | kernels are 2×2 matrices; M ⋆ N = π₁₃!(π₁₂*M ⊗ π₂₃*N) is the matrix product with ⊕, ⊗; Δ!1 = diag(Λ, Λ) | consistent with 0.7 and RC26a 822–832 |
| Conventions, signs (1) | zero section ι of 𝔸¹; 𝔸¹ → pt | RHom_{ℤ[T]}(ℤ, ℤ[T]) via Koszul ℤ[T] →T ℤ[T]: H¹ = ℤ, so ℤ[−1]; f_!1 = fib(ℤ[T] → ℤ((T⁻¹))) = T⁻¹ℤ[[T⁻¹]][−1]; ι^!f^!1 = ℤ[−1] ⊗ ℤ[T][1]⊗ℤ = ℤ | consistent across 1.4, 6.3, 6.4, 6.6 |
| Conventions, signs (2) | ι₀: B𝔾_m → 𝔸¹/𝔾_m | Koszul generator e of weight −1 (that of t); e^∨ has weight +1; H¹ = ℤ·e^∨: t^{−1}ℤ[−1], weight one, degree −1 | matches RCSolid 5902 and 6.5 Check 1 |
| Conventions, modulus (4) | B ⊂ GL₂(ℚ_p), g = diag(p, 1), K = B(ℤ_p) | gN(ℤ_p)g⁻¹ = N(pℤ_p), [K : gKg⁻¹] = p, so [gKg⁻¹ : K] = p⁻¹; diag(1, p) gives p; SmoothRepresentations line 179 gives p⁻¹ | same character on the torus |
| Conventions, exp and Amice (5) | (Xⁿ)^∨; δ₀, δ₁ | (Xⁿ)^∨ ↦ Tⁿ/n! (RC26a 1624); δ₁ ↦ 1 + T, δ₀ ↦ 1 | matches LocallyAnalyticDistributions line 64 |
| 0.1 geometric setup | (Sets, surjections); smooth maps; open immersions | Δ: {a,b} → {a,b}² misses (a,b); Δ of 𝔸¹ → Spec ℤ is a closed immersion; open immersions have invertible diagonal | axioms discriminate; no change |
| 0.2 Corr | {1} ← {1,2} → {1} composed with itself; E = equivalences | apex {1,2} ×_{1} {1,2} has 4 points; Corr(C, iso) ≃ C^op | consistent |
| 0.3 Liu–Zheng | point; surjections of finite sets | δ*₂ of a point is Δ⁰; p: ∗⊔∗ → ∗, q: ∗ → ∗⊔∗, p∘q = id with q not surjective | admissibility needed; hypotheses as LZ12b 110–118 |
| 0.4 formalisms | finite sets; constant functor; f_! := f_* on (0,1) ⊂ [0,1] | f_!(M₁, M₂) = M₁ ⊕ M₂; i*j_*ℤ = ℤ (stalk at 0 over (0, ε)) while j′_*i′*ℤ = 0 (empty fibre) | base change fails; no change |
| 0.5 construction principle | sets, I = P = all, j = p = (ℕ → ∗) | ⊕_m ∏_n Λ → ∏_n ⊕_m Λ: the identity matrix has finitely supported columns but infinitely many nonzero rows | (c) is not automatic |
| 0.6 extension | constant formalism; HM 3.4.13 hypothesis | empty cover forces D(∅) = ∗, constant has D(Λ); hypothesis is ∗ → ∗⊔∗ ∈ E′ (HM 2329) | R07 |
| 0.7 kernels | 𝔸¹_k over k, M = N = O | N ⋆ M = π_!O = T⁻¹k[[T⁻¹]][−1] ≠ π_*O = k[T] | ! is forced |
| 0.8 suave objects | finite sets, f: {1,2} → ∗, row (Λ, 0) | N ⋆ M = diag(Λ, 0) with unit the projection from diag(Λ, Λ); M ⋆ N = Λ with counit id; zigzags identities; Λ^{⊕ℕ} has no dual | consistent with HM Example 4.4.3 |
| 0.9 suave maps | ∗/ℤ_p over 𝔽_p and ℚ | HM 4937: ω = 1[cd] = 𝔽_p[1]; check: RΓ(ℤ_p, 𝔽_p)^∨ = 𝔽_p ⊕ 𝔽_p[1] = RΓ(ℤ_p, 𝔽_p)[1]; over ℚ cd = 0, ω = ℚ | shift sign confirmed |
| 0.10 étale/proper | Spec ℤ[1/p] → Spec ℤ in 1.1 | (∏_n ℤ/pⁿ)[1/p] ∋ image of (1,1,…) ≠ 0 while ∏_n (ℤ/pⁿ)[1/p] = 0, so j* has no left adjoint; j prim and mono, so closed | Zariski opens are closed maps there |
| 0.11 descent | A → A × A; ℤ → ℚ | index 1 (retract); 𝔽_p ⊗ ℚ = 0 with 𝔽_p ≠ 0 | consistent |
| 0.12 Künneth !-descent | ℤ → ℤ[1/p] × ℤ_p; empty family | fracture fibre sequence ℤ → ℤ[1/p] ⊕ ℤ_p → ℚ_p, ℚ_p a module over both factors; D(X) = 0 iff empty covers | matches RCSolid 6.3.7 (a)–(e) at 4149–4159 |
| 0.13 !-equivalences | Spec(ℤ×ℤ) → Spec ℤ; ℵ₁-compactness | image is all of Spec ℤ, family descendable of index 1; footnote 14 = README "Sizes" | consistent |
| 1.1 affine formalism | ℤ[T]/(T²); ℤ[x,y]/(x²,xy,y²); ℤ[T]; 0 | T·T^∨ = 1^∨ so ω ≅ B; socle (x, y) needs two generators; ℤ[T] not perfect over ℤ; D(0) = 0 | suave ≠ smooth |
| 1.2 AlgStk | ω₁-compact flat; k → l; empty | Q = cofib flat countably presented, Q⊗Q of projective dimension ≤ 1 so Q⊗Q[−2] → A null, index ≤ 2 (RCSolid 4510); l free over k, index 1 | consistent with Mat16 3.31 (countability on A there) |
| 1.3 schemes prim | ℙ¹_ℤ → Spec ℤ | f_*O = ℤ, δ ≅ 1; ℙ¹ not suave algebraically (O_{ℙ¹} not perfect over ℤ as a module) | consistent |
| 1.4 formal completions | Z = V(p) ⊂ Spec ℤ; 𝔸̂¹ | ℚ_p has derived p-completion 0; ι^!ℤ = ℤ[−1], f^!ℤ = O[1], ι^!f^! = id | signs consistent |
| 1.5 classifying stacks | 𝔾_a over 𝔽_p; 𝔾_m | comodule map φ: R → 𝔽_p forces φ(T)⊗1 + φ(1)⊗T = φ(T)⊗1, so φ(1) = 0; R = 𝔽_p[T] countable flat, index ≤ 2 by 1.2(1); hypotheses match RC26a 656 | consistent |
| 1.6 graded/filtered | O of 𝔸¹/𝔾_m; constant filtration | Rees of (Fil⁰ = R, Fil¹ = 0) is ⊕_{n≤0} R t^{−n} = R[t], t weight −1; lim Fil^n = ℤ ≠ 0 | convention pinned |
| 1.7 formal line | ℤ ⊗^L_{ℤ[T]} ℤ; Beilinson heart | Koszul ℤ[T] →T ℤ[T] ⊗ ℤ = (ℤ →0 ℤ): π₀ = π₁ = ℤ, π₂ = 0; zero section is a !-epi by Cor 6.4.14 (static quotient by (T)) | R03 for ownership |
| 2.1 Cond(C) | ∅; {1,2}; ℕ ∪ {∞} | T(∅) final; ℤ[{1,2}] = ℤ²; ⊕_{ℕ∪{∞}} ℤ lacks the all-one vector, ℤ × ∏_ℕ ℤ has it | consistent with RCSolid 1392–1407 |
| 2.2 analytic rings | {0}; perfect modules; discrete objects | {0} analytic iff A▷ = 0; perfect not closed under ⊕_ℕ; discrete not closed under ∏_ℕ ℤ | Definition 4.1.1 (1)–(3) as restated |
| 2.3 colimits, Frobenius | (ℤ[T], ℤ)_■[S]; ℤ_■ ⊔ ℤ_■; Theorem 4.3.2 | (∏ℤ)[T] ≠ ∏ℤ[T]; ℤ_■ ⊗ ℤ_■ = ℤ_■; φ: A▷ → A▷/p is the source's statement (RCSolid 1889) | consistent |
| 2.4 invariance | ℤ[ε]/ε² → ℤ; torsion groups | modules with IM, M/IM solid are the solid ones; ∏_n ℤ/n not torsion | consistent |
| 2.5 idempotents | ℤ[1/2] ∪ ℤ[1/3] in D(ℤ); R[T] | (a, b) ↦ a − b onto ℤ[1/6] (1/6 = 1/2 − 1/3), kernel ℤ[1/2] ∩ ℤ[1/3] = ℤ, so the union is the unit; R[T] ⊗ R[T] = R[T, T′] | cover, matches 2.7(10) |
| 2.7 solid discrete rings | ℚ_p with T = p⁻¹ and T = p; A_■ vs (A, ℤ)_■ | Σ pⁿ T^n = Σ 1 diverges; with T = p converges; for A integral over ℤ the structures agree (Cor 5.3.9) | R01 |
| 2.7 free module | ℤ[T]_■[S], S infinite | lim_n ℤ[S_n][T] = power series Σ c_k T^k with c_k → 0 in ∏_I ℤ = RHom(∏_ℕ ℤ, ∏_I ℤ) = ∏_I ⊕_ℕ ℤ, as 6.4's f* = Hom(ℤ[T]^∨, −) requires | consistent |
| 2.8 Huber pairs | 𝔽₂[ε]/ε² | (εT)² = 0 so εT integral over 𝔽₂; matches SolidAnalyticRings line 784 | consistent |
| 2.9 solid Huber rings | ℤ_■; (ℤ_p, ℤ_p)_■; (ℤ[T], ℤ)_■ | A°° = 0 (Σ aⁿ converges in discrete ℤ only for a = 0), pℤ_p; A⁺ = ℤ (T not solid, solid elements form a subring) | consistent |
| 2.10 solid spectrum | discrete field k; ℤ_■; M₃ | g = 0 gives 0, g ≠ 0 gives k_■, a point; ℤ_■ → ℤ[1/n]_■ rational, image onto Spec ℤ; M₃ not distributive | consistent |
| 2.11 ℚ_{p,■} | x ∈ ℤ_p; S infinite | ℤ[[q]]/(1 − xq) = 0 (unit); (∏_ℕ ℤ_p)[1/p] = bounded denominators; RC26a 1944 also writes ℚ_{p,■} = (ℚ_p, ℤ)_■ | induced = (ℚ_p, ℤ_p)_■ |
| 3.1 !-able class | ℤ_■ → ℤ_{p,■} → ℚ_{p,■}; (ℤ[T], ℤ)_■ → ℤ[T]_■ | closed immersion then induced, both in P; ℤ((T⁻¹)) complete for the source, killed by the target | matches Definition 6.3.2 |
| 3.2 affinoid formalism | ℤ^cond → ℤ[T]/(T²)^cond; ℤ[T]^cond | rank 2 free, ω ≅ B; ℤ[T] not dualizable | consistent with Lemma 6.3.5 |
| 3.3 analytic stacks | C₀ = spectra of ℤ_■ⁿ | ring maps ℤ^m → ℤⁿ = set maps n → m; coproduct covers; AnStk(C₀) ≃ Ani, D(K) = Fun(K, D(ℤ_■)) | consistent |
| 3.4 solid schemes | 𝔸¹_ℤ; A = 𝔽_p | π₋₁ f_!1 = T⁻¹ℤ[[T⁻¹]] a product, not discrete; (𝔽_p)_■ = (𝔽_p, ℤ)_■ | R01 |
| 3.6 ℚ_{p,■}-stacks | S light profinite | C(S, ℤ) ⊗ ℚ_p = locally constant functions (finitely many values) | consistent |
| 3.8 realization | Spec R; B𝔾_m × AnSpec ℤ_■ | Mod_R(D(ℤ^cond)); graded solid groups with t of weight −1 | consistent with ALRS 1866–1890 |
| 4.1 Betti | ℕ ∪ {∞} | C(S, ℤ) = eventually constant sequences, free countable; (pⁿ) not locally constant | consistent |
| 4.2 classifying stacks | ℤ/p over 𝔽_p; free pro-p on an infinite set; Λ = ℚ_p | cd = ∞, not fine; cd 1 with H¹ = 𝔽_p^{|I|}, not Poincaré (HM 4882); D(X^Betti × ℚ_{p,■}) = D(X, ℚ_p) ⊗_{D(ℚ_p)} D(ℚ_{p,■}) by Künneth for fine X | consistent |
| 4.3 nuclear modules | ℚ_{p,■}[S]; I empty | compact, not dualizable (not finite-dimensional), hence not nuclear (CS22 9.3); ∅ → AnSpec A !-equivalence only for A = 0 | consistent; gap used |
| 4.4 Fredholm | A → π₀A; filtered colimits; tensor products | static M has M ⊗_A π₀A = M non-derived, so (5) applies; duality data of a compact object (finitely many maps between compacts) descend to a stage; non-derived tensor needed | R04, R08 |
| 5.1 cotangent complex | ℤ_■ → 𝔽_p; ℤ[T]_■/ℤ_■ | (p)/(p²)[1] = 𝔽_p[1]; L = ℤ[T]·dT | consistent |
| 5.2 connectivity | M = ℤ[1], ℤ[2]; A = Sym(ℤ[1]) → ℤ | Sym^m(ℤ[1]) = ∧^m(ℤ)[m] = 0, Sym^m(ℤ[2]) = ℤ[2m]: bounds m+n−1 and n+2m−2 tight; fib(f) = ℤ[1] (n = 1), B ⊗ cofib(f) = ⊕_m ℤ[2m], L = ℤ[2], fibre first nonzero in π₄: (n+3)-connective, tight; for k[x,y] → k, fibre has π₂ = ∧²(I/I²) ≠ 0: 2-connective, tight | RCSolid 7.4.5–7.4.7 confirmed |
| 5.3 descent of ∧^m | ℤ → ℚ | Tot of the Čech conerve is ℚ ≠ ℤ | descendability needed |
| 6.1 finite presentation | ℤ_■ → ℤ_{p,■} | L = 0 (idempotent) but π₀ of a quotient of ℤ[T]_■ is discrete, ℤ_p is not | consistent |
| 6.2 solid smooth | ℤ[T]_■/^L(T²) | L = [B →2T B dT], kernel {bT} = Tℤ ≠ 0 | not projective |
| 6.3 regular immersions | ℤ[x,y]/(x², xy) | 0 → ℤ → B → ℤ[x,y]/(x) → 0 with ℤ = R/(x,y): Ext¹(B, R) = R/(x) ≠ 0 and Ext²(B, R) = ℤ ≠ 0 | suave, not smooth |
| 6.4 solid line | f_!f^!1 | f_!(ℤ[T][1]) = T⁻¹ℤ[[T⁻¹]] in degree 0, trace = coefficient of T⁻¹ (SixFF 3434) | consistent |
| 6.5 normal cone | n = 1; ℤ[x] → ℤ[x]/(x²) | ι₀^!1[1] = line bundle of weight 1 so δ = id (RCSolid 5902); I/I² = (x²)/(x⁴) ≅ B, gr = B[u] | consistent |
| 6.6 Serre duality | 𝔸²; ℙ¹ | det(O dT₁ ⊕ O dT₂) = O, f^!1 = O[2], L[2] = O²[2] not invertible; H⁰(O) ↔ H¹(O(−2)) = ℤ; ALRS 6.5.6 uses d = 1 only (lines 8844–8848) | determinant form is the theorem |
| 7.1 bialgebra duality | ℤ[ℤ/n]; ℤ[T] | A^∨ = ℤ^{ℤ/n}, D(μ_n) = ℤ/n; ℤ[T]^× = {±1} so the only character is 1 while ℤ[T]^∨ is a nontrivial ring | dualizability needed |
| 7.2 kernel duality | FM_h unit and convolution | F_h ∈ D(Y ×_S X) = Fun_S(Y, X); e_! ↦ f* (RC26a 847–853) | consistent |
| 7.3 1-suave | Spec ℤ[T] → Spec ℤ | restriction has right adjoint ∏_ℕ(−), not colimit-preserving: 0-prim, not 0-suave | matches 1.1 |
| 7.4 lattices and tori | ⋆_! on B𝔾_m; pairing class | m*(⊕M_n) sits in bidegrees (n, n), m_* = m_! extracts the diagonal: (M ⋆ N)_n = M_n ⊗ N_n; on ℤ^Betti (M ⋆ N)_n = ⊕_{i+j=n} M_i ⊗ N_j; class (Tⁿ)_{n∈ℤ} | Check correct; R09 wording |
| 7.5 additive dualities | v_p(n!) | v_p(n!) = (n − s_p(n))/(p − 1), so D^{♯,≤r} = D^{≤ r p^{−1/(p−1)}} (RC26a 1945); (Xⁿ)^∨ ↦ Tⁿ/n! ∉ ℤ[T] for n ≥ 2 | consistent |
| 7.6 stacky duality | St_n ⊗ St_n; hypotheses | scalar λ acts by λ², not invariant; M, N must be !-able (RC26a 2172) | R05 |
| 7.7 𝔾_m^an | (1)_n; (p^{−n²})_n | sup |1|p^{−r|n|} < ∞ for every r; p^{n²}p^{−r|n|} unbounded for every r; pointwise product closed, convolution of (1) with (1) diverges | matches RJRC Definition 4.4.1 |

## Not verifiable

- Lurie, HA Theorem 4.8.4.6, HA Corollary 4.8.5.14, SAG Propositions 25.2.4.1 and 25.3.6.1 (proof routes of 1.1, 2.3, 5.2): not in the manifest, not opened (R06). RCSolid's own restatement of the SAG estimates was checked by the examples in the table instead.
- The uniqueness clause of RCSolid Corollary 6.3.4 rests on CLL25, which the design does not cite and which is not a target.
- Lean elaboration: not available in this lane; no Suggested.lean exists at the design stage.
- Ownership against open pull requests was checked through the project's grep over all 367 heads; sibling checkouts without files were not read separately.

## Source issues

- **Misprint** in RCSolid at Lemma 6.4.13, printed page 96: the source says the kernel of π₀(A) → π₀(A); it should be the kernel of π₀(A) → π₀(B); affects nothing.
- **Misprint** in RCSolid at Lemma 6.4.15, printed page 96: the source says the fully faithful functor j_* lands in D(Z); it should be D(X), as the proof (line 4731) computes; affects nothing.
- **Gap** in RCSolid at Lemma 5.4.13(2), printed page 63: the source leaves the proof that ℤ[T]_{ℤ_■/} → ℤ[T^{±1}]_{ℤ[T⁻¹]_■/} is an open immersion with complement ℤ[[T]] to the reader; it should give the resolution of ℤ[[T]] by 1 − T⁻¹q on ℤ[[q]][T^{±1}]; affects the proof (the design's 2.7(8) supplies it).
- **Misprint** in RCSolid at Corollary 7.7.23, printed page 128: the source says "schemes adic spaces" in (1) and ω_d in (2); it should say "schemes or discrete adic spaces" and ω_f; affects nothing.
- **Misprint** in RCSolid at Lemma 6.3.21, printed page 89: the proof says the functor C₁ → C₂ and Shv(C₁) → Shv(C₂); it should be C and Shv(C), as in the statement; affects nothing.
- **Misprint** in RC26a at Lemma 3.1.1 and the proof of Proposition 3.1.3, printed pages 30–31: the source indexes g_♯1 = ⊕ ℤ and the pairing class (Tⁿ) by n ∈ ℕ; it should be n ∈ ℤ, as in the displayed isomorphism onto ℤ[T^{±1}]; affects nothing.
- **Error** in ALRS at Remark 6.5.6, printed page 163: the source says a map represented in smooth rigid spaces of pure dimension d has ω_g ≅ L_g[d]; it should be det(L_g)[d], since for 𝔸² over a point L[2] = O²[2] is not invertible; affects nothing (every use in that remark has d = 1).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a33e98f35c13546d1a8eb1be5177bda38ffe1756", "job": "REV-DESIGN-AnalyticStacks", "model": "fable", "worker": "chris-i"} -->
