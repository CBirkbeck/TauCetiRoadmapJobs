Verdict: design
Name: MotivicEtaleKTheory
Base: none
Owner: none

## Scope

Construct the missing universal comparison and archimedean realization of the shared higher-cycle theory: integral cubical–simplicial comparison through the mixed complex, the rational higher motivic Chern character, and the real Deligne–Beilinson regulator. Include the general logarithmic Deligne model, its product and compactification independence, and the supported cycle classes and semipurity needed to construct that regulator. These are unconditional library results for all varieties in the stated hypotheses.

The algebraic comparisons apply over arbitrary fields wherever the cited theorems do. For the regulator fix any field embedding σ:k→ℂ and any smooth quasi-projective finite-type k-scheme X. Evaluate Deligne cohomology on X_σ. This includes every smooth projective X and every open complement X∖Z for arbitrary closed Z, including singular Z. Treat disconnected schemes componentwise; neither geometric integrality nor an arithmetic choice of varieties is required. Characteristic zero enters the complex realization and its compactifications, not the integral algebraic model comparison.

Preserve existing ownership. `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md`, §3.0a, owns the shared simplicial Bloch/HigherChow complexes, coefficients, moving, localization, products, transfers and motivic-to-K tower. `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md`, §§4.1–4.18, owns the motive categories and their higher-Chow comparisons, relative cycles and specialization. `TauCetiRoadmap/SchemeKTheoryOperations/README.md`, §§7.1–7.3, owns K-theory operations, the rational γ-filtration and the degree-zero Chow character. Import them; the new higher Chern comparison must extend the existing degree-zero map on the same carriers.

Polylogarithms retains its explicit Wang/Goncharov forms, current normalization dictionary, concrete support-cone adapters, mixed regulator homotopy, Green objects and their comparison with the universal map. The present roadmap supplies the underlying restriction-natural map and logarithmic/support theorems independently of those explicit formulas. Its supported auxiliary construction for defining the universal regulator does not transfer ownership of Polylogarithms §5.2's concrete current/cone models. BorelRegulators retains number-field embedding spaces, Borel comparison, lattices and special values. The folder name does not expand this target into finite-coefficient étale descent, norm-residue theorems, p-adic regulators, arithmetic K-group computations or trace methods.

This is a new supplier direction, rather than a Part II of the local-field, motive-category or K-operation programs. Their existing plans explicitly separate the higher regulator/comparison applications. Consumer references to prospective MotivicEtaleKTheory Layer 4 and §§9.1, 12.2 are requests, not existing numbered sections.

## Final targets

Use the supplier's convention H_M^a(X,R(p))=CH^p(X,2p−a;R), with derived coefficients and the supplied localization maps. Write ℝ(p)=(2πi)^pℝ. The following are mathematical endpoints, not a layer or API plan.

1. **Integral cycle-model comparison.** For every field k, equidimensional quasi-projective k-scheme X and p≥0, form normalized cubical cycles on X×(ℙ¹∖{1})^n and mixed cycles on X×(ℙ¹∖{1})^n×Δ^m, meeting every iterated face properly. The two axis inclusions from the cubical and supplied simplicial complexes into the mixed total complex are integral quasi-isomorphisms. They identify all CH^p(X,n), n≥0, naturally for open restriction, proper pushforward and flat pullback where defined. Their restriction squares also give quasi-isomorphisms on homotopy fibers for every closed support. Derived coefficient change preserves these comparisons. On smooth schemes the comparisons respect the supplied products and derived pullbacks. Fix the cubical boundary and totalization signs explicitly; replacing a boundary by its negative uses the degree-n map (−1)^n, including on supported fibers. Locators: Levine94 Theorem 4.7, p.296, Levine94 line 1767; Corollary 4.9 and Theorem 5.2, pp.297,313, Levine94 line 1794 and Levine94 line 2226; BFT Proposition 6.12, p.20, BFT line 948 and BFT line 961. The last reference explicitly supplies the two axis maps.

2. **Rational higher Chern comparison with supports.** For every smooth quasi-projective X over a field and n≥0, construct the natural character

   ch_n:K_n(X)⊗ℚ ≃ ⨁_(p≥0) H_M^(2p−n)(X,ℚ(p)).

   Its weight-p component identifies the Adams weight-p part with CH^p(X,n)⊗ℚ. Require product compatibility, ch_pψ^a=a^p ch_p for positive a, and agreement at n=0 with SchemeKTheoryOperations §7.2, including rank, line bundles and the leading structure-sheaf cycle. For every closed Z⊂X the supported character identifies K_n^Z(X)⊗ℚ with the corresponding sum of motivic fiber groups and commutes with all maps and boundaries of the closed-open sequences, with the declared boundary conventions. Import the K-theory tower and Adams theory rather than reconstruct them. Locators: Levine94 Theorem 3.1, p.276, Levine94 line 1210; Theorem 3.4, pp.283–284, Levine94 line 1399 and Levine94 line 1405; Theorem 5.2, Levine94 line 2226; BF Theorem 3.5 and its Chern normalization, p.20, BF line 905. The additional obligation is identifying these read comparisons with the existing suppliers' maps.

3. **General logarithmic real Deligne theory.** For every smooth quasi-projective complex X, every integer p and any smooth proper SNC compactification j:X→X̄ with boundary D, construct a real logarithmic Dolbeault model D_log(X,p) computing

   Cone(RΓ(X,ℝ(p)) ⊕ RΓ(X̄,F^pΩ^•_(X̄)(log D)) → RΓ(X,ℂ))[−1],

   where the arrow is filtered de Rham comparison minus the real inclusion. Prove that every change of compactification inducing the identity on X gives a filtered quasi-isomorphism, compatible with products, and that the common-refinement comparisons compose. Thus the resulting Deligne complex in the derived category, its cohomology and its pullbacks do not depend on a compactification; no canonical compactification is asserted. Locators: Burgos94 Theorem 1.1, p.63, Burgos94 line 102; Theorem 2.1/Corollary 2.2, p.67, Burgos94 line 181 and Burgos94 line 190; BKK Proposition 5.12, pp.112–113, BKK line 4035 and BKK line 4060; Theorem 5.22 through Corollary 5.31, pp.117–119, BKK line 4239, BKK line 4263 and BKK line 4315.

4. **Support semipurity and the universal supported cycle input.** For every smooth equidimensional complex X, p≥0 and closed Z of codimension at least p, put D_log,Z(X,p)=Cone(D_log(X,p)→D_log(X∖Z,p))[−1]. Prove H_D,Z^a(X,ℝ(p))=0 for a<2p and canonically identify H_D,Z^(2p)(X,ℝ(p)) with the direct sum of ℝ on the codimension-p irreducible components of Z, via their multiplicity-bearing fundamental classes. Require restriction and enlargement-of-support compatibility; Z need not be smooth. For face-admissible supports in X×□^n, these classes identify normalized real cycle complexes with the degree-2p supported cohomology complex; the truncated supported logarithmic total complex maps quasi-isomorphically to it. These are the general semipurity and cycle-class inputs consumed by both the universal regulator and downstream support cones. Locators: BF §1.9, equation (1.30), p.11, BF line 517 and BF line 530; Lemma 2.11/Proposition 2.13, pp.16–17, BF line 753 and BF line 766; BFT Proposition 4.3, p.7, BFT line 266. The logarithmic cycle-class criterion is BKK §5.6 and Proposition 5.58, pp.132–133, BKK line 4795 and BKK line 4841.

5. **Universal regulator and Beilinson identification.** For every σ:k→ℂ, smooth quasi-projective X/k and p,n≥0, construct a derived morphism from the shared motivic complex to the logarithmic Deligne complex, inducing

   r_D:CH^p(X,n)→H_D^(2p−n)(X_σ,ℝ(p)).

   It is natural for morphisms of smooth varieties on cohomology and has restriction-compatible representatives, including the naturality homotopies needed to take fibers. The same morphism is obtained through the cubical, simplicial and mixed comparisons. Its composite with ch_n is the real Beilinson regulator on the actual K_n(X), after rationalization and base change by σ. In degree zero it is the Deligne cycle class; on line-bundle Chern classes it has the ordinary Deligne normalization. Restriction to any open complement, base change along compatible embeddings and forgetting auxiliary compactifications commute with this map. Locators: BF §§3.1–3.2, Proposition 3.3 and Theorem 3.5, pp.19–20, BF line 862, BF line 877 and BF line 905; BFT Theorem 4.7, p.7, BFT line 296. Equality of the three models here follows by transport of this universal derived morphism; the explicit current comparison remains Polylogarithms' theorem.

6. **Logarithmic product and normalization.** For smooth quasi-projective X,Y over the embedded field, α∈CH^p(X,n) and β∈CH^q(Y,m), prove r_D(α×β)=r_D(α)×r_D(β); diagonal pullback gives the internal cup-product formula. The logarithmic Deligne product satisfies the graded Leibniz identity and graded commutativity, with a specified natural associativity homotopy. In its Dolbeault model, for x of Deligne degree 2p−1 and y of degree 2q−1, require

   x•y=−∂x∧y+∂̄x∧y+x∧∂y−x∧∂̄y.

   Fix the unit normalization by the Deligne exponential class: at a complex point the unit u maps to log|u| under ℂ/ℝ(1)≃ℝ. Distinguish this from the principal-divisor Green representative −log|f| in the supported model. Prove the corresponding logarithmic addition and product identities after the declared orientation/model transport; no arbitrary regulator scalar is allowed. Locators: BKK Definition 5.14/Proposition 5.15 and the following special-degree formula, pp.113–115, BKK line 4129, BKK line 4142 and BKK line 4176; BF Proposition 1.26, p.10, BF line 506; §§5.1–5.2, Proposition 5.13/Corollary 5.14, pp.31–35, BF line 1539 and BF line 1619; BF principal-divisor normalization, p.11, BF line 550. KLM §5.2's degree-one logarithm is KLM line 553; it is a normalization check, not a dependency on the consumer's explicit construction.

Checks should include the point in weights zero and one, a line bundle on ℙ¹, two units on a smooth curve, an open complement with singular closed support, empty/full support, mixed-dimensional disjoint unions and two SNC compactifications of the same open variety. The originally requested projective case is a Check of this general library.

## Suppliers

| Supplier | Existing ownership to import |
| --- | --- |
| Pinned Mathlib and Tau Ceti | Mathlib's homological complexes, derived categories, sheaves and `Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean`; Tau Ceti's graded complexes and `TauCeti/Geometry/Hodge/Structure.lean`, `Morphism.lean`, `Tate/Basic.lean`. These provide carriers and linear Hodge theory, not geometric Deligne cohomology or higher regulators. |
| GeneralAlgebraicKTheory | `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md`, §3.12, Layers 4–6 and §§7.4–7.7: actual K-theory spaces/groups, localization, products and transfers. |
| SchemeKTheoryOperations | `TauCetiRoadmap/SchemeKTheoryOperations/README.md`, §4.5, Layer 6 and §§7.1–7.3: coniveau, Adams/γ operations, rational weight decomposition and the existing degree-zero character. |
| KTheoryFiniteLocalFields | `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md`, §3.0a, specifically `motivicCycles` and `motivicToK`: shared integral complexes, all their maps, and the existing tower. Finite étale Chern maps in §1.8 are distinct from the new rational motivic character. |
| MotivesAndAlgebraicCycles | `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md`, §§4.7–4.8, 4.8a, 4.14–4.18: the shared-carrier adapters, relative cycles and motive/higher-Chow comparisons when expressing the realization motivically. No motive category is rebuilt. |
| SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md`, §§5.1–5.8: ordinary cycles, intersection, Chern classes and degree-zero normalization. |
| ResolutionOfSingularitiesCharacteristicZero | `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md`, §§6.1–6.4 and its resolution/principalization targets: SNC compactifications preserving the prescribed open and common refinements. |
| ComplexComparisonPartII | `TauCetiRoadmap/ComplexComparisonPartII/README.md`, C−1.1/C−1.4, C5.1 and C5.3–C5.7: analytification, SNC charts, geometric de Rham–Betti and logarithmic comparison, and cycle normalization. These are inputs to, rather than the construction of, the Deligne cone. |
| EnhancedDerivedSheaves and DifferentialGeometry | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`, E0–E2: enhanced derived sheaves, hypercohomology and descent; `TauCetiRoadmap/DifferentialGeometry/README.md`, form/pullback/wedge/integration foundations. Use the native models supplied there. |

Place MotivicEtaleKTheory after its last actual supplier, provisionally immediately after MotivesAndAlgebraicCycles in `merge-order/ORDER.txt`, and before BorelRegulators and Polylogarithms wherever their comparison with this universal map is consumed. The order already puts GeneralAlgebraicKTheory, resolution, SchemeKTheoryOperations, ComplexComparisonPartII and KTheoryFiniteLocalFields before MotivesAndAlgebraicCycles. BorelRegulators is a pending design, not an input. No dependence on Polylogarithms, PeriodsAndSpecialValues, p-adic regulators or arithmetic special-value theorems is permitted in this universal construction. This triage changes no merge-order entry.

## Consumers

- `TauCetiRoadmap/Polylogarithms/README.md`, `gap:universal-deligne-contract`, §§5.2 and 5.9–5.10: the universal map, support input, Chern character and model comparisons used to prove its explicit formulas. Replace its prospective supplier locators during design integration.
- `packages/BorelRegulators/target.md`: the comparison of its preserved number-field regulator with universal realization. Its arithmetic lattice and covolume proofs remain independent of this construction.
- `packages/PeriodsAndSpecialValues/README.md`, PS.3.1–PS.3.2a and PS.9: motivic regulators and period applications, downstream of the preserved arithmetic regulator block identified by BorelRegulators.
- `packages/KatoEulerSystems/README.md`, §3.4: identification of the unit-symbol archimedean regulator with the Deligne regulator on smooth projective curves. Its explicit modular-unit and special-value theorem remains there.
- EllipticRegulators is a likely later consumer through the class output described in `packages/EllipticKTheory/README.md`, Layer 7 and Consumers. This is not evidence of an already designed universal-regulator owner.

## Sources

Every work has one lifetime key in `packages/MotivicEtaleKTheory/sources.toml`. Locators below refer to the versions actually fetched through the sources service; source texts stay in its cache.

| Key | Work, legal access and locators |
| --- | --- |
| Levine94 | Marc Levine, *Bloch's higher Chow groups revisited*, Astérisque 226 (1994), pp.235–320. Numdam open repository. Theorems 3.1, 3.4, 4.7 and 5.2: Levine94 line 1210, Levine94 line 1405, Levine94 line 1767 and Levine94 line 2226. |
| BF | Burgos Gil–Feliu, *Higher arithmetic Chow groups*, arXiv:0907.5169v1 (2009); published CMH 87 (2012). Open repository. Use preprint Proposition 1.26, equation (1.30), Lemma 2.11, Proposition 2.13, Theorem 3.5 and Proposition 5.13/Corollary 5.14 at the lines above. |
| BFT | Burgos Gil–Feliu–Takeda, *On Goncharov's regulator and higher arithmetic Chow groups*, arXiv:0909.5296v1 (2009); published IMRN 2011. Open repository. Preprint §§3–4, Proposition 4.3/Theorem 4.7, pp.4–7, and Proposition 6.12, p.20: BFT line 180, BFT line 266, BFT line 296 and BFT line 961. The filed arXiv number 0909.5667 is not this work. |
| Burgos94 | José Ignacio Burgos, *A C∞ logarithmic Dolbeault complex*, Compositio 92 (1994), pp.61–86. Numdam open repository. Theorem 1.1, p.63, and Theorem 2.1/Corollary 2.2, p.67: Burgos94 line 102, Burgos94 line 181 and Burgos94 line 190. |
| BKK | Burgos Gil–Kramer–Kühn, *Cohomological arithmetic Chow rings*, arXiv:math/0404122v2 (2005); published 2007. Open repository. Read preprint §§5.2–5.3 and 5.6, printed pp.112–119,132–133: BKK line 4035, BKK line 4129, BKK line 4239, BKK line 4315 and BKK line 4841. Its numbering must not be replaced by the published article's numbering. |
| KLM | Kerr–Lewis–Müller-Stach, *The Abel-Jacobi map for higher Chow groups*, arXiv:math/0409116v1 (2004); published Compositio 2006. Open repository. Preprint §2, pp.3–6, KLM line 98 and KLM line 127; degree-one formula, KLM line 553; Theorem 7.1, pp.24–25, KLM line 1104. Abel–Jacobi/current background and normalization check; its explicit comparisons remain downstream. |
| Bloch86 | Spencer Bloch, *Algebraic cycles and higher K-theory*, Advances in Mathematics 61 (1986), pp.267–304, DOI 10.1016/0001-8708(86)90081-2. Settled as uncertified: bibliographic locator only, no text read. The endpoint proofs above use the read Levine94 replacement. |
| Beilinson85 | A. A. Beilinson, *Higher regulators and values of L-functions*, J. Soviet Math. 30 (1985), §§1–2, pp.2036–2070, DOI 10.1007/BF02105861. Settled as uncertified, cited by locator alone. The checked realization comparison uses BF Theorem 3.5. |
| Levine98 | Marc Levine, *Mixed Motives* (1998), Part I, Chapter II, §§2–3; Chapter III, §1; Chapter V, §2. Settled as waived under this exact key; chapter-level citation only. Do not reopen the request. All endpoints have independently read sources above. |

## Risks

- The pins lack higher Chow, motivic Chern and geometric Deligne-regulator declarations. The supplier roadmaps are substantial prerequisites. Abstract Hodge structures, a proposed function between groups or an arbitrary equivalence cannot stand in for these geometric constructions.
- A second simplicial localization/moving theory, a second K-theory tower, or a new proof of the degree-zero Chow character would duplicate existing work. The design must compare maps on the shared carriers, not just assert that independently named groups are isomorphic.
- Cubical orientation, homological/cohomological shifts, the Deligne top differential, Tate twists and support-cone signs affect every comparison. Literal chain-level naturality is stronger than cohomological naturality; supply actual derived naturality and the homotopies required by consumers. Associativity of the chosen logarithmic product is up to homotopy.
- Semipurity here has twist p and codimension bound p. It does not assert vanishing in every twist, purity for singular ambient schemes, or smoothness of the support. SNC compactification is only an auxiliary characteristic-zero choice; independence is a theorem.
- BFT's explicit regulator comparison uses projective complex varieties. Use BF for the universal quasi-projective construction, and prove its agreement with the suppliers' localization/model maps. Do not extrapolate the explicit projective current formula to all opens without that comparison.
- Bloch86 and Beilinson85 are settled uncertified references; Levine98 is waived. No outstanding legal-text request remains. Unread sources certify no additional theorem or finer locator.
- The later `Suggested.lean` must be an acceptance test: headline theorems with `sorry`, only their necessary simple definitions, one `import Mathlib`, no sorry'd data and no `set_option`, against the pins and actual supplier carriers. This triage writes no Lean and supplies no computational algorithm.
