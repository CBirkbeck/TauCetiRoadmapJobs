Verdict: design
Name: ProetaleCohomologyOfPAdicCurvesAndTowers
Base: none
Owner: none

## Scope

This roadmap develops the p-adic (and, where the same methods give it, ℓ-adic) pro-étale and étale cohomology of smooth p-adic analytic curves, of Drinfeld half-spaces, and of the rank-two Drinfeld tower. All of it follows the programme of Colmez–Dospinescu–Nizioł. The library it builds has four parts.

1. **Curves.** Pro-étale cohomology of every smooth connected curve over a complete algebraically closed field C, described by "fundamental diagrams" built from the de Rham complex and Hyodo–Kato cohomology. This covers four kinds of curve:
   - affinoids, including non-overconvergent ones;
   - overconvergent affinoids;
   - curves without boundary (Stein curves);
   - proper curves.

   It also includes:
   - symbols, and the étale and syntomic regulators;
   - the description of the cohomology through curve patterns and triangulations;
   - the comparison of the Weil–Deligne actions on ℓ-adic and Hyodo–Kato cohomology;
   - the period isomorphism for the universal cover of the p-divisible group of a Jacobian.

2. **Semistable Stein spaces of any dimension.** The Fontaine–Messing period quasi-isomorphisms and the G_K-equivariant fundamental diagram for a Stein semistable weak formal scheme over O_K. The right-hand column uses the overconvergent Hyodo–Kato cohomology of the special fibre.

3. **Drinfeld half-spaces Ω^d, every d ≥ 1.** Over a finite extension K of ℚ_p, in every coefficient theory in which the answer is a generalized Steinberg representation:
   - de Rham and Hyodo–Kato;
   - ℓ-adic étale and pro-étale;
   - the compactly supported ℓ-adic complex as a complex of smooth representations;
   - rational and integral p-adic étale, and p-adic pro-étale.

   The generalized Steinberg representations Sp_r(A), for an arbitrary coefficient ring A, and their continuous variants are constructed here. Their comparison with the complex segment representations of SmoothRepresentationsOfLocalGroups is a Check.

4. **The Drinfeld tower in dimension one, over any finite extension F of ℚ_p.** The geometric and cohomological statements that do not involve the p-adic local Langlands correspondence:
   - equivariant semistable models;
   - the levelwise fundamental diagram;
   - Hyodo–Kato and de Rham multiplicities;
   - the multiplicity form of the fundamental diagram;
   - finite copresentation of mod p^k cohomology;
   - non-admissibility when F ≠ ℚ_p.

**Generality.** The filed wording ("p-adic curves and the Drinfeld tower") is made general in four directions:
- all smooth curves over C, with G_K-equivariance whenever the curve is defined over a finite K ⊂ C;
- the tower over every finite F/ℚ_p, not only F = ℚ_p;
- the base of the tower in every dimension (Ω^d) and every coefficient theory;
- the semistable Stein comparison in every dimension, which the Ω^d computation needs.

The special cases become Checks: Drinfeld's computation of H¹ of the half-plane, the open disc, annuli, affine space, and the F = ℚ_p diagram.

CDN-CURVES assumes v_p(C^×) = ℚ (CDN-CURVES line 92). Its footnote (CDN-CURVES line 124) says the restriction comes from using B_st, and that a B_cris formulation removes it. The design should state the curve targets for every complete algebraically closed C through that formulation, or keep the restriction as the source's and record it.

**Boundaries.** What other roadmaps own is imported by name and section, never planned again:
- **The tower spaces.** The Lubin–Tate and Drinfeld towers, period maps, infinite-level spaces, duality, central quotients, Weil descent, Stein covers and the ℓ-adic tower cohomology belong to EndoscopicTransferAndUnitaryTraceComparison §§12.3–12.8, 12.11–12.14 and 12.19–12.21.
- **The half-plane geometry.** The Drinfeld half-plane, its affinoid exhaustion, its standard formal model and Čerednik–Drinfeld uniformisation belong to HilbertModularVarietiesAndShimuraCurves §§R18.5.1–R18.5.3 and R18.5.15–R18.5.21.
- **Skeleta.** Skeleta, semistable vertex sets and triangulations of curves belong to TropicalAndBerkovichArithmetic §§2.14–2.20.
- **Hyodo–Kato cohomology.**
  - Hyodo–Kato cohomology of semistable Stein curves and of semistable curve towers, with its completed comparison with de Rham cohomology, belongs to LocallyAnalyticDistributions §0.CR.6.6.
  - Model-free rigid Hyodo–Kato cohomology belongs to CohomologyComparisons §4.9a.
  - Log rigid Hyodo–Kato complexes belong to CrystallineCohomology §CR.6.5.
- **Local syntomic comparison.** The Fontaine–Messing period maps and the comparison with p-adic nearby cycles on semistable charts belong to CohomologyComparisonsPartII §§4.1–4.5. The Bloch–Kato–Hyodo filtration and semistable formal schemes belong to ClassicalAdicEtaleCohomology §§4.6–4.7.
- **Proper and model-free comparisons.**
  - The proper rigid C_st comparison belongs to CohomologyComparisons §§4.10–4.12.
  - The model-free fundamental diagram for smooth dagger Stein spaces and dagger affinoids over C in every dimension belongs to CstConjectureForDaggerVarieties CS.1 (stein-affinoid-diagram, elementary-bicartesian-cases; CN-II Theorem 6.14).
  - Its model-free syntomic input (CN-I Theorems 1.1 and 1.3, Cst's contract G-ANALYTIC) is not planned here.
- **p-adic local Langlands.** Π(V), the Breuil–Strauch comparison, the Galois socle and the factorisation of arithmetic cohomology belong to PadicLocalLanglandsForGL2Qp §6.9 and to the board package PadicLocalLanglandsForGL2QpPartII. Scholze's functor and the mod p finite length of the tower for F = ℚ_p (CDN23 §§3–4, and the finite-group step of CDN23 Corollaire 2.12) belong to the board package ScholzeFunctorAndModpCohomologyOfTheLubinTateTower.
- **Representation theory.** Banach–Colmez spaces and the dimension of X_st^+(M) belong to VectorBundlesAndIsocrystals. Shotton's coherence and Emerton ordinary parts for GL₂(F) belong to ModpRepresentationsOfGL2OverLocalFields MP.0 and MP.2.

**Out of scope:**
- Dat's realisation of the local Langlands parameter of elliptic principal series (DAT06 Théorèmes 1.1–1.3), and Thorne's concentration of the Hecke-localized derived tensor (THO24 §5). These belong to their consumers.
- p-adic cohomology of higher-rank Drinfeld towers; CDN23 Remarque 2.3 is only an expectation.
- Locally analytic generalized Steinberg representations and the Orlik–Schraen theorem, which await a joint contract with LocallyAnalyticRepresentationsOfLocalGroups.
- **Proposed Part II:** Poincaré duality and compactly supported pro-étale cohomology of curves (CGN23 Theorem 1.1, stated in solid ℚ_p-vector spaces), together with the compactly supported de Rham comparison of the Lubin–Tate and Drinfeld towers (CDN20 Théorème 0.6). Its name would be ProetaleCohomologyOfPAdicCurvesAndTowersPartII. It needs the solid formalism of VStackSheavesAndLisseCategories VS2.1–VS2.2 and a compactly supported syntomic comparison, which this roadmap does not build.

## Final targets

**Notation.**
- p is a prime and C is a complete algebraically closed extension of ℚ_p. C̆ = W(k_C)[1/p], and K ⊂ C is a closed subfield finite over ℚ_p unless stated otherwise.
- B_cris^+, B_st^+ = B_cris^+[u] and θ: B_st^+ → C are Fontaine's, with Nφ = pφN.
- A curve is a smooth connected one-dimensional rigid analytic space over C.
- For a ℤ-module M, ℚ_p ⊗̂ M is ℚ_p ⊗_{ℤ_p} lim M/p^n M.
- O(Y)^{**} is the group of units f with f − 1 topologically nilpotent.

**T1. Affinoid curves.** Let Y be a smooth connected affinoid curve over C.
- (a) There is a functorial commutative diagram of Banach spaces. Its top row is exact: 0 → ℚ_p⊗̂O(Y)^{**} → H¹_proét(Y, ℚ_p(1)) → (B_st^+ ⊗_{C̆} H¹_HK(Y)^sep)^{N=0, φ=p} → 0. It maps, via the dlog map and θ⊗ι_HK, to the complex 0 → ℚ_p⊗̂O(Y)^{**} → Ω¹(Y) → H¹_dR(Y)^sep → 0, and every arrow has closed image.
  - H¹_HK(Y)^sep is a finite-dimensional C̆-space with φ and N.
  - ι_HK identifies C⊗H¹_HK(Y)^sep with the maximal Hausdorff quotient of H¹_dR(Y).
- (b) For every prime ℓ, including ℓ = p, the Kummer regulator from the symbol group Symb_ℓ(Y) to H¹_ét(Y, ℤ_ℓ(1)) is an isomorphism. For p > 2 the syntomic regulator Symb_p(Y) → H¹_syn(Y_S, 1) is an isomorphism for every fine enough semistable model Y_S.
- (c) The integral form of (a) holds as a p²-exact sequence.

Locators: CDN-CURVES Théorème 0.1 = Théorème 6.32, Remarques 0.2 and 0.19, Corollaire 5.5, Théorème 6.24, Théorème 6.30.

Checks:
- For the closed unit disc, H¹_HK(Y)^sep = 0, and exp(O(Y)) is dense in ℚ_p⊗̂O(Y)^{**} but not equal to it (CDN-CURVES line 160).
- An annulus gives a one-dimensional Hyodo–Kato term.

**T2. Overconvergent affinoids and curves without boundary.** Let Y be an overconvergent affinoid curve or a non-compact curve without boundary over C. There is a functorial diagram of LB-spaces (resp. Fréchet spaces) with exact rows and closed images:
- top row: 0 → O(Y)/C → H¹_proét(Y, ℚ_p(1)) → (B_st^+ ⊗̂ H¹_HK(Y))^{N=0, φ=p} → 0, where the first map is exp;
- bottom row: 0 → O(Y)/C → Ω¹(Y) → H¹_dR(Y) → 0, where the first map is d.

The kernel of H¹_proét → Ω¹ is t·H¹_HK(Y)^{φ=1}. When Y is defined over a finite K ⊂ C, the diagram is G_K-equivariant.

The geometric statement over C is the dimension-one, degree-one case of CstConjectureForDaggerVarieties CS.1 (stein-affinoid-diagram), which this roadmap imports by name. What is supplied here is the curve proof, by passage to the limit in T1. That proof does not depend on Cst's unowned G-ANALYTIC contract. Record it as "proof supplied here, statement kept there".

Locators: CDN-CURVES Théorème 0.5 = Théorème 7.6, Théorème 0.7 = Théorème 8.1, Remarque 0.8(ii); CN-II Theorem 6.14.

Check: the open disc and the open annulus.

**T3. Proper curves and Jacobians.**
- (a) For a smooth proper connected curve Y over C there is a commutative diagram with exact rows:
  - 0 → H¹_proét(Y, ℚ_p(1)) → (B_st^+ ⊗ H¹_HK(Y))^{N=0, φ=p} → H¹(Y, O) → 0;
  - 0 → Ω¹(Y) → H¹_dR(Y) → H¹(Y, O) → 0.

  It is derived from CohomologyComparisons §4.11. Here only the exact diagram is new, which CohomologyComparisons §4.12 leaves to another owner.
- (b) Let J be the Jacobian of X and Ĵ the universal cover of its p-divisible group: sequences (x_n) in J(C), indexed by n ∈ ℤ, with p·x_{n+1} = x_n and x_n → 0 as n → −∞. There is a natural isomorphism ι_st: Ĵ ≅ (B_st^+ ⊗ H¹_HK(X))^{N=0, φ=p}.
- (c) If X is defined over a finite K and C = ℂ_p, then ι_st equals log of the universal vector extension composed with the B_dR^+-valued map.

Locators: CDN-CURVES Théorème 0.4, Théorème 0.17 = Théorème 7.9, Remarque 0.18 and Théorème 7.12.

Check: removing an open disc from X gives 0 → ℚ_p⊗̂O(Y)^* → H¹_ét(Y, ℚ_p(1)) → Ĵ → 0 (CDN-CURVES line 436).

**T4. Patterns, triangulations and Weil–Deligne actions.**
- (a) Every curve pattern (a metric graph Γ, shorts and legs, gluing isomorphisms along ghost circles) is the pattern of a unique pair (Y, S): a quasi-compact curve Y with a triangulation S.
- (b) For a quasi-compact curve Y with a fine enough triangulation, H¹_ét(Y, ℚ_ℓ(1)) (ℓ ≠ p) and H¹_HK(Y)^sep each carry a natural three-step filtration. Its graded pieces are:
  - H¹ of the graph (for H¹_HK(Y)^sep, of the subgraph obtained by deleting the boundary vertices);
  - the product of the H¹ of the special-fibre components (for Hyodo–Kato: rigid cohomology, using only the slope-one part on boundary components);
  - the dual of H¹_c of the graph, twisted by (−1).
- (c) The same holds for overconvergent affinoids and curves without boundary, for H¹_proét(Y, ℚ_ℓ(1)) and H¹_HK(Y).
- (d) If Y is defined over a finite K ⊂ C, the WD_K-representations on H¹_proét(Y, ℚ_ℓ(1)) (ℓ ≠ p) and on H¹_HK(Y)(1) are similar.

Locators: CDN-CURVES Théorème 0.9 = Théorème 3.19, Théorème 0.13 (Théorèmes 6.3, 6.14), Théorème 0.15 = Théorème 8.9, Remarque 0.16(ii), Théorèmes 8.11–8.12.

The bijection between triangulations and semistable models is imported from TropicalAndBerkovichArithmetic §§2.14–2.17.

**T5. Semistable Stein spaces.** Let K be a complete discretely valued field of mixed characteristic (0, p) with perfect residue field k. Let X be a Stein semistable weak formal scheme over O_K, and r ≥ 0.
- (a) The Fontaine–Messing period maps are strict quasi-isomorphisms after truncation τ≤r:
  - from crystalline syntomic cohomology RΓ_syn(X_{O_C}, ℚ_p(r)) to RΓ_proét(X_C, ℚ_p(r));
  - from RΓ_syn(X_{O_C}, ℤ_p(r)), rationalised, to RΓ_ét(X_C, ℚ_p(r)).
- (b) There is a natural G_K-equivariant map of strictly exact sequences of Fréchet spaces, with closed images:
  - from 0 → Ω^{r−1}(X_C)/ker d → H^r_proét(X_C, ℚ_p(r)) → (H^r_HK(X_k) ⊗̂_F B_st^+)^{N=0, φ=p^r} → 0;
  - to 0 → Ω^{r−1}(X_C)/ker d → Ω^r(X_C)^{d=0} → H^r_dR(X_C) → 0.

  Its kernel is (H^r_HK ⊗̂ B_st^+)^{N=0, φ=p^{r−1}}, where H^r_HK is Grosse-Klönne's overconvergent Hyodo–Kato cohomology.

Over C, (b) is the semistable case of CstConjectureForDaggerVarieties CS.1. Here it is proved by the semistable route from CohomologyComparisonsPartII §§4.4–4.5, and it carries the G_K-action and the model-dependent Hyodo–Kato term.

Locators: CDN-STEIN Proposition 1.11, Theorem 1.8 = Theorem 4.12.

Checks:
- For affine space A^d_K, H^r_proét(A^d_C, ℚ_p(r)) ≅ Ω^{r−1}/ker d (CDN-STEIN Example 1.9).
- In dimension one, (b) agrees with T2.

**T6. Drinfeld half-spaces.** Let d ≥ 1, G = GL_{d+1}(K), and let H^d_K be the complement in P^d_K of the K-rational hyperplanes, with its standard semistable model. Sp_r(A) is the generalized Steinberg representation with coefficients in a ring A, and Sp_r^cont its continuous variant; the dual is the weak topological dual, with G_K acting trivially on the Steinberg side.
- (a) **De Rham.** H^r_dR(H^d_K) ≅ Sp_r(K)^*, and its G-bounded vectors are Sp_r^cont(K)^*.
- (b) **Hyodo–Kato.** For the special fibre Y of the standard model:
  - H^r_HK(Y) ≅ Sp_r(F)^*, and its φ = p^r part is Sp_r(ℚ_p)^*, compatibly with (a) under ι_HK;
  - the linearised Frobenius on H^r_HK(Y) is multiplication by q^r (q the residue cardinality), so N = 0;
  - the de Rham classes come from the Iovita–Spiess regulator description.
- (c) **ℓ-adic, ℓ ≠ p.** H^r_ét(H^d_C, ℚ_ℓ(r)) ≅ Sp_r(ℤ_ℓ)^* ⊗ ℚ_ℓ and H^r_proét(H^d_C, ℚ_ℓ(r)) ≅ Sp_r(ℚ_ℓ)^*, as G×G_K-modules.
- (d) **Compactly supported ℓ-adic.** Let Λ be a finitely generated local ℤ_ℓ-algebra, ℓ ≠ p.
  - The complex RΓ_c of Ω^d over the completed algebraic closure lies in D(Λ[PGL_{d+1}(K)]), carries a W_K-action, and is compatible with change of coefficients.
  - H^{d+i}_c ≅ π^Λ_{1,…,i}(−i) for 0 ≤ i ≤ d.
  - When Λ is strongly banal for GL_{d+1}(K), the complex splits as the sum of its shifted cohomology.
- (e) **p-adic.**
  - There is a strictly exact sequence of G×G_K Fréchet spaces 0 → Ω^{r−1}(H^d_C)/ker d → H^r_proét(H^d_C, ℚ_p(r)) → Sp_r(ℚ_p)^* → 0, mapping to the de Rham sequence by closed immersions.
  - H^r_ét(H^d_C, ℚ_p(r)) ≅ Sp_r^cont(ℚ_p)^* ≅ Sp_r(ℤ_p)^* ⊗ ℚ_p.
  - Étale cohomology is the space of G-bounded vectors in pro-étale cohomology.
  - Everything vanishes for r > d.
- (f) **Integral.** H^r_ét(H^d_C, ℤ_p(r)) ≅ Sp_r(ℤ_p)^* and H^r_ét(H^d_C, 𝔽_p(r)) ≅ Sp_r(𝔽_p)^*, compatibly with (e). The A_inf-cohomology computation is an intermediate target.

Locators:
- SS91 §§3–4 (uncertified), restated in CDN-STEIN Theorem 5.8 and Corollary 5.9;
- GK05 Theorem 6.3 and Corollary 6.6; CDN-STEIN Theorem 5.10, Lemma 5.11 and §5.5;
- DAT06 Théorème 3.1.1, §4.1.3 and Proposition 4.2.2, with d − 1 there equal to d here;
- CDN-STEIN Theorem 1.3 = Theorems 5.13 and 6.45;
- CDN-DUKE Theorems 1.1 and 1.3.

Checks:
- d = 1, r = 1 gives Drinfeld's H¹_ét(Ω, ℚ_p(1)) ≅ (St^cont)^* (CDN20 Proposition 0.1).
- r = 0 gives the constants.
- A non-banal Λ is excluded from the splitting in (d) (THO24 line 145).

**T7. The Drinfeld tower in dimension one.**

Setting:
- F/ℚ_p is finite, G = GL₂(F), Ǧ = D^× for the quaternion division algebra D over F, and G′ = G/ϖ^ℤ.
- M_n are the Drinfeld coverings (EndoscopicTransferAndUnitaryTraceComparison §12.4), and M^ϖ_n their quotients by ϖ^ℤ (§§12.14, 12.19).
- L is a finite coefficient field with ring of integers O_L and residue field k_L.

Targets:
- (a) **Semistable models.** M^ϖ_n has a G×Ǧ×G_F-equivariant semistable formal model over a finite extension of F. The irreducible components of its special fibre form finitely many G-orbits, and each is fixed by an open subgroup.
- (b) **Levelwise diagram and multiplicities.**
  - T2 holds for M^ϖ_{n,C} with its G×Ǧ×W_F-action.
  - For a supercuspidal rank-two L-(φ, N, G_F)-module M, the JL(M)-multiplicity of L⊗H¹_HK(M_∞) is M̆ ⊗̂ LL(M)^*, compatibly with ι_HK, φ and W_F. The de Rham multiplicity is C ⊗_F M_dR ⊗̂ LL(M)^*.
  - This is proved locally from T4(d) and EndoscopicTransferAndUnitaryTraceComparison §12.20 (CDN-CURVES Remarque 0.16(iii)), not by the global method of CDN20.
- (c) **Multiplicity diagram.** For every F, the multiplicity form of the fundamental diagram holds, with X_st^+(M) = (B_st^+ ⊗ M)^{N=0, φ=p}, together with its integral variant.
- (d) **Finite copresentation.** For K/F finite, k ≥ 1 and q ≥ 0, H^q_ét(M^ϖ_{n,K}, O_L/p^k) is the Pontryagin dual of a smooth finitely presented G′-representation; in particular it is a profinite O_L-module. This goes through the cohomologically profinite sheaves of finite copresentation (cpcf sheaves) and their two-out-of-three lemmas.
- (e) **Non-admissibility.** If F ≠ ℚ_p and n > 0, then H¹_ét(M^ϖ_{n,K}, k_L)^∨ is not admissible for K/F finite and large enough.

Locators:
- CDN20 Proposition A.1 and CDN23 Proposition 2.7;
- CDN20 Théorème 0.4 and CDN-CURVES Remarque 0.16(iii);
- CDN20 Théorème 0.8 and Remarque 0.10;
- CDN23 Théorème 0.5 = Théorème 2.1, §2.1.3, Lemmes 2.8–2.9 and Remarque 2.11;
- CDN23 Théorèmes 2.13–2.14.

Checks:
- For F = ℚ_p, (c) restricted to slope-1/2 types in the p-central sector is PadicLocalLanglandsForGL2QpPartII §4.1.
- At level n = 0 the components are copies of Ω, and (b) reduces to T6 with d = 1.

## Suppliers

All suppliers are on main or earlier in `merge-order/ORDER.txt`; positions are line numbers in that file. The last supplier is ModpRepresentationsOfGL2OverLocalFields (308), so the roadmap is inserted at 309, before ScholzeFunctorAndModpCohomologyOfTheLubinTateTower (311).

| Roadmap | What is imported |
| --- | --- |
| AdicEtaleGeometry (main) | §§A1.10–A1.12: pro-étale morphisms and the pro-étale site |
| AdicSpacesPartIII (main) | §R3.4: quasi-Stein spaces, Kiehl's Theorems A and B |
| AdicSpacesPartIV (main) | Layer F1, §§F1.5–F1.9: dagger algebras and spaces, the dagger–rigid comparison, overconvergent de Rham complexes |
| EnhancedDerivedSheaves (17) | derived limits and the countable-tower (Milnor) sequence |
| PadicPeriodRings (19) | B_cris^+, B_st^+, B_dR^+, θ, t |
| CrystallineCohomology (21) | §§CR.5–CR.6: log crystalline cohomology, Hyodo–Kato complexes, log rigid Hyodo–Kato cohomology (§CR.6.5) |
| SmoothRepresentationsOfLocalGroups (25) | smooth representations, parabolic induction, segment representations (comparison for Sp_r) |
| PadicLocalLanglandsForGL2Qp (32) | §6.9 `DivisionAlgebraTypes.jacquetLanglands` for JL(M) |
| ClassicalAdicEtaleCohomology (61) | étale cohomology of adic spaces, nearby cycles (§4.5a), semistable formal schemes (§4.6), Bloch–Kato–Hyodo filtration (§4.7) |
| AInfCohomology (62) | §§AI.3.1–AI.3.2: integral pro-étale period sheaves and AΩ, for T6(f) |
| LocallyAnalyticDistributions (76) | §§0.0, 0.2: locally convex limits, strict sequences, Mittag-Leffler limits; §0.CR.6.6: Hyodo–Kato of Stein curves and curve towers |
| GL2AutomorphicRepresentationsAndTransfer (100) | R16.3: rank-two local parameters, WD(M), LL(M) |
| PadicDifferentialEquationsAndRigidCohomology (134) | rigid cohomology of the special-fibre components, with slopes |
| PadicHodgeTheory (136) | period sheaves, filtered (φ, N, G_K)-modules, Weil–Deligne representations |
| VectorBundlesAndIsocrystals (139) | Dieudonné–Manin slopes; Banach–Colmez spaces (VB3) and the dimension of X_st^+(M) |
| EndoscopicTransferAndUnitaryTraceComparison (162) | §§12.3–12.8, 12.11, 12.14, 12.19 (towers, actions, descent); §12.20 (ℓ-adic supercuspidal cohomology); §12.21 (Stein covers, Mittag-Leffler) |
| HilbertModularVarietiesAndShimuraCurves (175) | §§R18.5.1–R18.5.3: half-plane, exhaustion, standard formal model |
| TropicalAndBerkovichArithmetic (202) | §§2.14–2.20: semistable vertex sets, skeleta, triangulations |
| CohomologyComparisons (205) | §4.9a: rigid Hyodo–Kato; §§4.10–4.12: proper C_st and the proper-curve interface |
| CstConjectureForDaggerVarieties (206) | CS.1 stein-affinoid-diagram and elementary-bicartesian-cases, statements imported for T2 and T5 |
| CohomologyComparisonsPartII (209) | §§4.1–4.5: Fontaine–Messing period maps and the p-adic nearby-cycle comparison |
| ModpRepresentationsOfGL2OverLocalFields (308) | MP.0 amalgam-coherence (Shotton), for T7(d); MP.2 ordinary parts and their approximation, for T7(e) |

## Consumers

- **ScholzeFunctorAndModpCohomologyOfTheLubinTateTower** (board, 311). Its gap `proetale-finite-presentation` names this roadmap for CDN23 Théorème 2.1, routed by the paper extraction as items 2-thm-2-1, 2-prop-semistable, 2-cpcf and 2-cpcf-lemmas. T7(a) and T7(d) supply it, and SZ.6 geometric-multiplicity uses T7(d) for general F. The Bloch–Kato–Hyodo item stays with ClassicalAdicEtaleCohomology §4.7.
- **PadicLocalLanglandsForGL2QpPartII** (board #392; it imports SZ nodes, so it follows 311). Its §4.1 plans the F = ℚ_p tower diagram by re-deriving, inline, the Stein-curve computation of T2. Its §4.2 plans the d = 1 de Rham and étale half-plane isomorphisms of T6(a), (e) and (f). Since that package comes after this roadmap, ownership should move here, with §4.1 importing T2, T7(b) and T7(c), and §4.2 importing T6 at d = 1. Its p-adic local Langlands content (Kirillov models, Π(π,0), Galois socle, factorisation) and the analytic Steinberg duality Ω¹(Ω) ≅ (St^an)′ stay there.
- **A Part II of CompletedCohomologyAndLocalGlobalCompatibility**, proposed by ModularityAndLanglandsExtensionsPartII (R4, gap G3) for Thorne's level raising. It imports T6(d) (THO24 Theorems 3.5–3.6 rest on DAT06). ModularityAndLanglandsExtensionsPartII itself sits at 258, so its SP.6 cannot consume this roadmap without moving; G3 stays a gap there until that chain is ordered.
- **Proposed ProetaleCohomologyOfPAdicCurvesAndTowersPartII**: duality and compact supports.
- **RationalAnalyticPrismatization** (open design) needs nothing from the present scope. A twistor-stack route to duality would belong to the Part II.

**Earlier roadmaps that cannot consume this one.**
- CohomologyComparisons §4.12 asks for the proper-curve exact sequence "supplied elsewhere". T3(a) provides it for later roadmaps only.
- CstConjectureForDaggerVarieties' G-ANALYTIC contract is model-free. T5 covers only its semistable case, and Cst cannot import it from here without being reordered.

## Sources

| Key | Work | Locators | Readable at |
| --- | --- | --- | --- |
| CDN-CURVES | Colmez–Dospinescu–Nizioł, *Cohomologie des courbes analytiques p-adiques*, arXiv:2101.06647v2 (no journal version found) | Théorèmes 0.1, 0.4, 0.5, 0.7, 0.9, 0.13, 0.15, 0.17; Remarques 0.16, 0.19; Corollaire 5.5; Théorèmes 3.19, 6.24, 6.30, 6.32, 7.6, 7.9, 8.1, 8.9, 8.11, 8.12 | arXiv (open repository) |
| CDN-STEIN | Colmez–Dospinescu–Nizioł, *Cohomology of p-adic Stein spaces*, Invent. Math. 219 (2020); arXiv:1801.06686v2 | Proposition 1.11; Example 1.9; Theorems 1.3, 4.12, 5.8, 5.10, 5.13, 6.45; Corollary 5.9; Lemma 5.11; §§5.2–5.5 | arXiv |
| CDN20 | Colmez–Dospinescu–Nizioł, *Cohomologie p-adique de la tour de Drinfeld : le cas de la dimension 1*, J. AMS 33 (2020); arXiv:1704.08928v2 (preprint numbering) | Proposition 0.1; Théorèmes 0.4, 0.6, 0.8; Remarque 0.10; Proposition A.1 | arXiv |
| CDN23 | Colmez–Dospinescu–Nizioł, *Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*, Forum Math. Pi 11 (2023); arXiv:2204.11214v2 | Théorème 2.1 (= 0.5); Proposition 2.7; §2.1.3; Lemmes 2.8–2.9; Corollaire 2.12; Théorèmes 2.13–2.14 | arXiv; open-access journal |
| CDN-DUKE | Colmez–Dospinescu–Nizioł, *Integral p-adic étale cohomology of Drinfeld symmetric spaces*, Duke Math. J. 170 (2021); arXiv:1905.11495v1 | Theorems 1.1, 1.3 | arXiv |
| DAT06 | Dat, *Espaces symétriques de Drinfeld et correspondance de Langlands locale*, Ann. Sci. ENS 39 (2006) | Théorème 3.1.1; §4.1.3; Théorème 4.1.5; Proposition 4.2.2 | Numdam |
| GK05 | Grosse-Klönne, *Frobenius and monodromy operators in rigid analysis, and Drinfel'd's symmetric space*, J. Algebraic Geom. 14 (2005); arXiv:1408.3346v1 | Theorem 3.4; Corollary 3.7; Theorem 6.3; Corollary 6.6 | arXiv |
| SS91 | Schneider–Stuhler, *The cohomology of p-adic symmetric spaces*, Invent. Math. 105 (1991) | §§3–4 | paywalled: `uncertified`, cited by locator; restated in CDN-STEIN Theorem 5.8 |
| CN-I | Colmez–Nizioł, *On the cohomology of p-adic analytic spaces, I*, arXiv:2104.13448v3 | Theorems 1.1, 1.3 (boundary only) | arXiv |
| CN-II | Colmez–Nizioł, *… II: the C_st-conjecture*, Duke Math. J. 174 (2025); arXiv:2108.12785v4 | Theorem 6.14 (boundary with Cst CS.1) | arXiv |
| CGN23 | Colmez–Gilles–Nizioł, *Arithmetic duality for p-adic pro-étale cohomology of analytic curves*, arXiv:2308.07712v2 | Theorem 1.1 (Part II scope) | arXiv |
| THO24 | Thorne, *A p-adic approach to the existence of level-raising congruences*, Proc. LMS 128 (2024); arXiv:2212.03591v2 | §3, Theorems 3.5–3.6; §5 (consumer boundary) | arXiv |

All entries are recorded in `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/sources.toml`. No text is missing, and `needs-references.toml` is not needed.

## Risks

- **Foundations (curves).**
  - CDN-CURVES glues curves from patterns in an "adoc" geometry: a modified notion of formal scheme (CDN-CURVES §3.1, Appendix A.4) that no roadmap owns. The design must either build it or rephrase T1 and T4(a) with standard formal models and tubes.
  - The topological statements (Banach, LB, Fréchet; strictness; closed images; completed tensors with non-Hausdorff H¹_HK) need the locally convex calculus of LocallyAnalyticDistributions §§0.0–0.2. A non-separated quotient H¹_HK(Y) with completed tensor (CDN-CURVES line 170) may need more than it provides.
- **Double planning.**
  - T2 and T5 overlap, over C, with CstConjectureForDaggerVarieties CS.1. The design must import CS.1's statement and add only the curve proof, the G_K-action and the model-dependent Hyodo–Kato term, never restate CS.1.
  - PadicLocalLanglandsForGL2QpPartII §§4.1–4.2 currently plans the F = ℚ_p tower diagram and the d = 1 half-plane isomorphisms. Until that package is retargeted, two designs plan these statements.
- **Order.**
  - The connected components of M_n with their G×Ǧ×W_F-action (Strauch), needed in T7(b)–(c), are planned only in ScholzeFunctorAndModpCohomologyOfTheLubinTateTower SZ.0, which comes after this roadmap. The design must take the Drinfeld-side component theorem over from SZ.0, or get it from EndoscopicTransferAndUnitaryTraceComparison Layer 12. Otherwise there is a cycle.
  - Only T7(d)–(e) need ModpRepresentationsOfGL2OverLocalFields (308). Everything else could sit right after CohomologyComparisonsPartII (209), but the whole roadmap is placed at 309.
  - Earlier consumers (CohomologyComparisons §4.12, Cst G-ANALYTIC, ModularityAndLanglandsExtensionsPartII G3) therefore cannot use it.
- **The local route to T7(b).** It needs the ℓ-adic cohomology of the tower for every JL type. EndoscopicTransferAndUnitaryTraceComparison §12.20 gives supercuspidal types only; the special and one-dimensional types must come from T6 and the components. If that fails, CDN20's global route needs Shimura-curve local–global compatibility (HilbertModularVarietiesAndShimuraCurves §R18.5.21, CompletedCohomologyAndLocalGlobalCompatibility) and CDN20 Théorème 0.6, which is in the Part II scope.
- **Sources.**
  - SS91 is paywalled, cited by locator, with CDN-STEIN §5.3 as the readable account.
  - CDN-CURVES has no journal version.
  - CDN-STEIN, CDN20, CDN-DUKE and CN-I are cited by their arXiv numbering, not collated with the journals.
  - CDN23 theorem numbers agree with the journal, but its pages do not.
- **Acceptance test.** The pinned Mathlib has the pro-étale site and ℓ-adic cohomology of schemes only (`Mathlib/AlgebraicGeometry/Sites/Proetale.lean`, `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean`). It has no rigid or dagger spaces, no Hyodo–Kato cohomology and no period rings beyond `BDeRhamPlus`. `Suggested.lean` can therefore state only elementary pieces, such as the generalized Steinberg representations as quotients of locally constant functions on flag varieties, and the graph-cohomology filtration. It must not hide missing carriers in axioms or opaque structures.
