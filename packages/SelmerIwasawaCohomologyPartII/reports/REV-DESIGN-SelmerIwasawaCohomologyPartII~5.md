<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/118#issuecomment-6314793965 -->
Review (codex) of 395eb14

Verdict: needs_changes

1. **F01** (P2) The multiplicity comparison omits the antecedent of H(N)

   **Location.** `packages/SelmerIwasawaCohomologyPartII/design/README.md:515`, §4.5: “Under H(n),H(n+1), realize Wλ as a finite direct sum of copies of Vλ^c”. The corresponding statement is at `packages/SelmerIwasawaCohomologyPartII/design/plan.json:891`; its `hypotheses` array is empty at line 892.

   **Claim.** H(n) and H(n+1), with the standing relevant automorphic representations, suffice for the asserted Galois multiplicity decomposition. They do not: the roadmap correctly defines H(N) in Conventions as an implication whose antecedent is irreducibility of the associated representation over the algebraic closure of the coefficient field. Section 4.5 does not assume that antecedent. Its prerequisites §§4.3–4.4 do not provide it either. Irreducibility of the automorphic representation is a different assertion.

   **Witness.** ltxzz line 1263 requires Galois irreducibility in Hypothesis 3.2.10; line 1208 supplies only semisimplicity in Proposition 3.2.4. The application at line 6805 follows the admissibility assumption at line 6794.

   This is a missing-hypothesis finding, not an assertion that a reducible Galois representation attached to one of these relevant cuspidal representations is known to exist. The source and the declared contracts do not establish the stronger assertion. L4 already supplies the needed absolute irreducibility for the rank-one endpoint, so that endpoint need not change.

   **Exact repair.** Add to §4.5 absolute irreducibility of both attached Galois representations after extension to ℚℓbar, or an explicitly sufficient existing hypothesis such as the two residual absolute-irreducibility conditions. State in the proof that these discharge the two antecedents of H(N). Synchronize the plan statement, hypotheses and proof. Add a negative-control Check recording that H(N), as a conditional assertion, supplies no multiplicity identification for a reducible attached representation. Preserve the more general rational regulator and Selmer-membership statements in §§4.3–4.4; they do not need this added restriction. Do not strengthen H(N) or its supplier gap to conceal the missing antecedent.

2. **F02** (P2) The rigidity gap requests an existing supplier definition

   **Location.** `packages/SelmerIwasawaCohomologyPartII/design/README.md:164`: “From LocalGaloisDeformationRings, new obligation: ltxzz Definition 6.3.4.” Also `packages/SelmerIwasawaCohomologyPartII/design/plan.json:1802` and the `rigidity` gap at line 1857.

   **Claim.** The normalized rigidity predicate and its local deformation conditions are new obligations on LocalGaloisDeformationRings. They are already explicitly planned there.

   **Witness.** `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:2114` states §2.20; lines 2120–2125 give `IsRigidFor`, its four clauses and `IsRigidFor.mono`. Line 2136 identifies the same arXiv Definition 6.3.4.

   The witness is at supplier head `e18984688bc762ca5115bbabd7696f50a29e7cf6`, independently confirmed as its open head. Its §1.6, line 1397, supplies the coefficient Fontaine–Laffaille condition; §2.3, line 1781, supplies minimally ramified lifts; §2.12, line 1977, supplies the polarized mixed/unramified/ramified conditions with the exact pair q^(−N), q^(−N+2). The supplier's numerical conditions are met on the admissible domain here. This is the explicit duplicate-gap defect allowed by the brief, not a complaint that a legitimate gap remains unimplemented.

   **Exact repair.** Remove `rigidity` from the top-level gap list and the README gap inventory. Replace its uses in §§1.6 and 7.3, the layer dependencies and the supplier inventory with LocalGaloisDeformationRings §§1.6, 2.3, 2.12 and 2.20, naming `IsRigidFor` and its required API. Retain their fixed-similitude, Fontaine–Laffaille and eigenpair hypotheses. In `rigid_of_levelRaisingSpecial`, import the generic rigidity-extension API and retain this roadmap's Satake-to-arithmetic-Frobenius specialization and its two numerical Checks. Do not re-plan the general rigidity definition.

Two new P2 findings. All three findings from round 4 are repaired at the design level. The mathematical scope remains a Part II extension and does not require replanning.

## Verified sound

### Previous findings, checked before the new review

The round-4 report was absent from the designated checkout. A read-only copy of the same report was located in another supplied worker checkout and read, together with `packages/SelmerIwasawaCohomologyPartII/reports/FIX-DESIGN-SelmerIwasawaCohomologyPartII~5.md`. The three findings were checked against the design and the sources, rather than accepted on the repair report's authority.

| Previous finding | Repaired passage and evidence | Status |
| --- | --- | --- |
| F01, missing finite condition at coefficient places | README line 709 now says “Both constructions also satisfy loc_w(c_i)∈H¹_ns(F_w,R̄⁽ᵐ⁾,c) at every w\|ℓ”. Lines 717–721 give the integral graph-regulator origin, quotient/lattice-map compatibility, both finite arguments and the inverse-different bound. The plan and `purity-crystalline-regulator` gap include §7.3. | Repaired at design level. |
| F02, nonexistent AG2.5 subsection | README line 723 cites “Unramifiedness and the good-prime polynomial; Published RACSDC comparison specializations”. These headings exist at supplier lines 1816 and 2017 at `c4cc6a16ac58b17b7da0ce4b7b9707d0fafda39f`; the corresponding statements were read. | Repaired. |
| F03, basic-correspondence page range | README line 283 now gives “pp. 39–41”; the plan and manifest agree. ltxzz line 1782 starts page 39 before Definition 4.3.1 at line 1788; Theorem 4.3.5 begins at line 1871 on page 41. | Repaired. |

For F01, the negative control is substantive: over ℚ₁₁, a nonzero unramified ℤ/11 character pairs with the Kummer class of the uniformizer to an element of order 11. The latter is outside the finite unit condition. An unramified coefficient field has unit different, so the claimed finite–finite bound would instead force zero. The repaired statement avoids that counterexample. The tensor Hodge–Tate interval is [−n,n−1], of width 2n−1; L1 gives the half-width bound used in ltxzz Lemma 2.2.7, line 620. The stronger base-supplier annihilation statement is unnecessary.

The repair report's statement that implementation of the expanded integral-regulator contract is “not actionable in this package” is respected. Its named, declared supplier obligation is sufficient at this stage. Neither new finding re-raises that settled implementation issue.

### Principles, inventory and shape

Read the complete 822-line design README, the plan and the manifest. The plan has eight layers and 40 targets: six definitions, seven constructions, 26 theorems and one example. Its 46 API entries and 66 target Checks are represented in the README, which also has eight convention Checks. Every definition/construction has at least three Checks. Every target has a locator; all eight layers end with Examples and Dependencies. Target dependencies refer backwards, and target/gap identifiers resolve.

The scope builds on SelmerIwasawaCohomology's local conditions and integral reduction, EulerSystemsAndKolyvaginSystems' generic detection, and the named geometry suppliers. It retains arbitrary CM extensions and ramified coefficient fields on the stated domains. It does not silently impose the endoscopic supplier's good-residue-characteristic or small-level restrictions on the endpoints: the missing extension is explicitly contracted. The uniform realised Frobenius span is an explicit mathematical premise; it is not inferred from admissibility. No unsupported nonzero-L-derivative-to-cycle implication or L6/L7-free rank-(2,3) theorem is claimed.

No computational algorithm, copied source passage, route-specific replacement for the native geometry, upward local target reference, sorry'd data or `set_option` was found. Generic theory is generally imported by object; R02 records the exception. The headings and prose follow the requested shape, compared with the main-branch LocalGaloisGroups and ComplexTori roadmaps. The occurrence of “packet” for an automorphic packet is mathematical terminology, not process narration.

### Seeded source verification

All five manifest texts were legally available in the supplied source cache. Their provenance and versions were checked; no new source fetch or manifest edit was needed. There were no author-flagged unverified locators in the design or plan. All 15 seeded targets were read at their locators. Fourteen support the scoped statement; §4.5 needs R01. Line references below identify the supplied extractions. Page numbers are the cited text's printed pages, except where the journal and PDF numbering are distinguished.

| Seeded target | Text and locator read | Result of hypothesis and statement comparison |
| --- | --- | --- |
| 1.5 `specialInertPlace` | ltxzz-published line 1533 through line 1556, Definitions 3.3.2–3.3.3, journal p.147 / PDF p.41 | Published reflexive closure uses the intersection of CM-type reflex fields. Oddness, inertness, unramifiedness and degree-one conditions are retained; the differing preprint compositum is not used. |
| 2.5 `unitaryIncidenceWeightComplex` | ltxzz line 4020 through line 4255, Constructions 5.9.1 and 5.9.4 and Lemmas 5.9.2–5.9.3, pp.84–87; incidence maps in §5.8 | Checked the signed restriction/Gysin maps, odd and even matrices, N=2 corner case, twists and three-step filtration. Integral filtration is conditional on the explicit parity and nearby-cycle contract. |
| 3.2 `oddTateCycleComparison` | ltxzz line 5295 and line 5304, Lemma 6.2.2 and Theorem 6.2.3, p.109 | Surjectivity, A6.1.4 concentration/freeness, and the stronger A6.1.6 plus H(N) eigenvalue/coinvariant assertions remain separate. |
| 3.4 `evenFrobeniusExclusion` | ltxzz line 5634 through line 5657, Theorem 6.3.5, pp.115–116 | Even rank, residual hypotheses, rigidity, coefficient bounds, genericity and nonzero support are present. The permitted Frobenius eigenvalues exclude 1 and p² as claimed. |
| 3.7 `oddSpecialLevelChange` | ltxzz line 6489 through line 6535, Lemma 8.1.7, pp.133–134 | Finite strongly disjoint supports, H(n₁), intertwining genericity and cohomological genericity are retained. This is an all-degree comparison and does not acquire the even rigidity assumption. |
| 4.5 `diagonalMultiplicityRealization` | ltxzz line 1259 through line 1277, Hypothesis 3.2.10 and Proposition 3.2.11, p.28; line 745, Lemma 2.4.5, p.17; line 6794 through line 6821, §8.3, pp.139–140 | Conjugation and finite multiplicity are supported, but the source application has irreducibility/admissibility. The standalone statement omits it: R01. |
| 5.1 `firstReciprocityDatum` | ltxzz line 5833 through line 5927, §7.2, pp.120–121 | Checked PI1–PI7 and their finite-support, congruence, nonzero and tensor conditions. Factor genericity is not substituted for the separate tensor condition. |
| 5.4 `diagonalCycleBoundaryComparison` | ltxzz line 5097 through line 5126, §5.12, pp.104–105; line 6024 through line 6033, §7.2, pp.123–124 | The potential map has the stated invariant source and coinvariant target, not two interchangeable spaces. Read the rendered p.105 formula as well as extraction. Ordinary/compact support and semistable regulator hypotheses remain explicit. |
| 6.2 `secondGeometricReciprocity` | ltxzz line 2488 through line 2572, Construction 4.6.1 and Theorem 4.6.2, pp.53–55 | Both correspondence legs, the operator T⋆, the cycle degree/twist and fibre multiplicities agree. |
| 6.4 `secondExplicitReciprocity` | ltxzz line 6255 through line 6348, §7.3 and Theorem 7.3.4, pp.128–130 | The comparison uses the absolute cycle and the special-fibre coinvariant interface. The exponent conclusion is an inequality; no unwarranted equality is inferred from a quotient map. |
| 7.1 `admissibleImageLift` | ltxzz line 908 through line 936, Lemma 2.7.1, p.21 | Simultaneous polarized/cyclotomic lifting, prime-to-ℓ powering, the totally real Galois auxiliary extension and the fixed-line conditions are retained. |
| 7.2 `auxiliaryPlaceDetection` | ltxzz line 634 through line 690, §2.3, pp.14–15, and line 830 through line 905, §§2.5–2.6, pp.19–20; EulerSystemsAndKolyvaginSystems §§1.15 and 4.4 | The original positive-loss basis argument is not copied. The target explicitly consumes the corrected realised-span premise and scaled inverse, and proves the rank-two primitive-kernel version. |
| 7.3 `rankinSelbergLevelRaisingSystem` | ltxzz line 6633 through line 6701 and line 6879 through line 6915, rank proofs, pp.136–142; line 591 through line 623, finite conditions; line 5623, rigidity | Read both local-finiteness arguments and the actual lattice map. The design now carries their integral condition at ℓ, fixed losses and added-place rigidity. R02 concerns ownership of the rigidity definition, not this source calculation. |
| 8.4 `rankTwoThreeRankTheorems` | ltxzz line 1273, Proposition 3.2.11; line 6568, Theorem 8.2.2; line 6773 through line 6792, Theorem 8.3.2 | H(2),H(3) may be discharged. The target correctly retains all seven admissibility clauses, the period/regulator witness and the explicit uniform span premise. |
| 8.5 `hilbertPrecursorCompatibility` | liu-tian line 1384 through line 1500, Assumption 4.1, Definition 4.5 and Theorem 4.7, pp.30–32 | Odd degree, level domain, coefficient bound, LIInd, residual dimension and admissible-prime assumptions are retained. The conclusion is the native mod-m unramified level-raising surjectivity; it does not substitute for the higher-rank unitary theorem. |

Also read ltxzz-deformation Theorem 3.6.3 at line 1444, Corollary 4.1.2 at line 1761 and Theorem 4.2.6 at line 1880. These support the exact D0–D4 and eventual-family domains of the corresponding contracts, not universal eventual rigidity. Read stacks-blowup Tag 0806, Lemma 33.5, at line 3750: the inverse-image center must be an effective Cartier divisor for the stated universal property. No converse for arbitrary maps into the blowup was inferred.

### Adversarial mathematics pass

The following table covers all 40 targets, including their subsidiary API and Checks, and the standing conventions. “No change” means no additional defect found under the named hypotheses and supplier contracts; it is not a proof of the future geometric library. Small characteristics, zero objects and degenerate levels are either evaluated or explicitly rejected by the actual domain. No Lean truth claim is based on an admitted build.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: dimensions, twists and duals | n=2,3; zero module | n=2 gives ranks 2,3, tensor rank 6, total twist 2 and weight −1; generally r₀+r₁=n. Zero coefficients give zero cohomology. | No change. |
| Conventions: Frobenius and coboundary | Inert p=3; γ=(I,−1)c; C₂ sign action on ℤ | Tate actions are 9 and 1/9; GL component of γ² is −I; d0(1) at the nonidentity element is −2. | No change. |
| Conventions: trace and coefficient domains | Free two-point C₂-orbit over 𝔽₂ coefficients; ramified Eλ; zero ring; equal-characteristic DVR | Orbit trace of (1,1) is 1, total trace 0; averaging unavailable. Ideal powers retain ramification. Zero/equal-characteristic coefficient rings are outside the number-field integer-ring domain. | No change. |
| Conventions: Satake and Hecke normalization | Degrees 1,2; r=1,q=3,a=3 or 2; q=1 | Reflection signs are −,+. Even I°=16 and (q+1)R°−I°=0; odd T°=9/2, I°=105/2. q=1 is not a residue cardinality here. | No change. |
| 1.5 `specialInertPlace` | ℚ(i) at 3,5,2; local degree 2; identity transport | 3 has residue cardinality 9; split 5 and ramified/even 2 fail; wrong local degree fails. Identity transport preserves the predicate. | No change. |
| 1.6 `rankinSelbergAdmissible` | n=0,1,2; ℓ=2,3,11; scalar 1; ξ=±1; conjugate bases | n<2 and small ℓ are excluded. Scalar 1 and ξ=±1 do not meet the required witnesses. Conjugation preserves the conditions. ℓ=11 tests only the numerical bound, not all admissibility. | Import existing rigidity API, R02. |
| 2.1 `unitaryLevelRaisingDatum` | m=0,1,2; empty raising set; infinite exclusion; nonneat level | m=0 is excluded; a residual root need not lift mod λ². Empty raising set is permitted; infinite exclusion is not. P6 must be checked after a level change. | No change. |
| 2.2 `unitaryBasicCorrespondence` | N=2,3; empty base; residue-field extension | Fibre dimensions 0,1 and codimension 1. Empty base gives empty source. Locally closed immersion is not promoted to a global embedding. | No change. |
| 2.3 `unitarySemistableStrata` | Node xy=p; N=3,p=3; invert p | Reduced branches have multiplicity one; normal degrees are +16 and −16 in the quartic-link control. Generic fibre is smooth. | No change. |
| 2.4 `unitaryLinkAndIntersection` | Minimal link fibre; ℓ dividing p+1; two-point orbit | Finite index count p+1 and projective fibre ℙ⁰ are retained. Geometric counts do not require inversion; the stated cohomological restriction comparison does. | No change. |
| 2.5 `unitaryIncidenceWeightComplex` | Node; N=2; p=3; Frobenius 4 on ℤ₃ | Restriction is a−b; matrix scalars include −16 and 4. Monodromy carries twist −1. Invariants are 0 while coinvariants are ℤ/3, so they cannot be interchanged. | No change. |
| 2.6 `unitaryProductResolution` | n=2; empty center; exceptional point; identity away from center | Product dimension 3, center codimension 2; exceptional ℙ¹ class has degree 2. Empty center gives identity. A point of the exceptional divisor need not pull the center back to a Cartier divisor. | No change. |
| 3.1 `localizedUnitaryCohomology` | Zero localization; nonproper variety; nonunit intertwiner | Zero gives a consistent zero comparison. Nonproper ordinary/compact equality needs the boundary contract; a nonunit cannot furnish the asserted integral intertwiner isomorphism. | No change. |
| 3.2 `oddTateCycleComparison` | A6.1.4 alone; zero localization; eigenvalue-one Jordan block | Concentration does not by itself give the eigenvalue/coinvariant comparison. A nontrivial Jordan block shows why weak semisimplicity matters. | No change. |
| 3.3 `evenIntegralFreeness` | N=2; zero definite module; exceptional transfer place | Nonzero support is assumed. Transfer beyond the supplier's restricted domain consumes the explicit old-form gap. | No change. |
| 3.4 `evenFrobeniusExclusion` | N=2; potential eigenvalue 1 from a=p^(−1); p²=1 modulo λ | The forbidden root or coefficient congruence is excluded by the actual genericity/unit hypotheses; no universal eigenvalue exclusion is claimed. | No change. |
| 3.5 `evenSingularComparison` | m=1,2; zero module; quotient versus annihilator | Congruence quotient and annihilator submodule are distinct; the statement keeps the correct quotient. Zero case is consistent. | No change. |
| 3.6 `evenCongruenceGaloisRealization` | Multiplicity 0,1,2; choice of coordinates | Nonzero support gives positive multiplicity. Conjugation remains; an isomorphism does not select a canonical summand. | No change. |
| 3.7 `oddSpecialLevelChange` | Empty P; one place; two disjoint rational supports | Empty change is identity; each successive comparison needs its own unit intertwiner. No even rigidity condition is inserted. | No change. |
| 4.1 `diagonalUnitaryDatum` | n=2; incompatible levels; source-only degree-2 refinement | Dimensions are 1,2,3. Incompatible levels do not define the map. A commuting refinement square need not be Cartesian. | No change. |
| 4.2 `diagonalGraphCycle` | Zero cycle; point graph; degree-2 cover | Zero class stays zero, point trace is +1, and refined graph pushes forward to 2Δ. | No change. |
| 4.3 `projectedDiagonalAbelJacobi` | n=2; arbitrary degree-one point on ℙ¹; nonproper residual system | Coefficient degree is 3 with twist 2. An arbitrary non-homologically-trivial point cannot enter the proposed edge. Rational cuspidal concentration and residual integral boundary exclusion are distinct. | No change. |
| 4.4 `rankinSelbergPurityAndSelmer` | Ramified ℓ in F; ramified Eλ; bad places away from ℓ; H(N) absent | L1 excludes ramification of ℓ in F, not ramification of Eλ. Bad-place purity and integral-regulator conclusions are supplied on their explicit domains; H(N) is not required here. | No change. |
| 4.5 `diagonalMultiplicityRealization` | Multiplicity 0,1,2; reducible attached representation in the logical domain of H(N) | Chosen nonzero tuple has a nonzero coordinate. But H(N) is vacuous on a reducible representation and cannot yield the asserted identification there. | Add the irreducibility antecedents, R01. |
| 4.6 `diagonalRegulatorNaturality` | Identity; degree 2; non-Cartesian source-only refinement | Proper trace has source degree. Pullback keeps all components unless the graph square is Cartesian or the specified component is selected. | No change. |
| 5.1 `firstReciprocityDatum` | Singleton graph; double fibre; roots {2,6} and {1,4,3} over 𝔽₁₁ | Trace counts 1 or 2. Tensor eigenvalue 2 occurs twice in the displayed root products, showing that the tensor clause must be checked independently. Zero support fails PI6. | No change. |
| 5.2 `firstGeometricReciprocity` | Singleton and p+1-point fibres; p=3 | Both Hecke directions and the (p+1)²=16 factor survive. | No change. |
| 5.3 `productCohomologyConcentration` | Tensor collision; absent freeness; nonproper supports | PI7 excludes the collision; freeness is needed to remove Künneth Tor terms; support comparison remains an input. | No change. |
| 5.4 `diagonalCycleBoundaryComparison` | Differential π² and class π; zero class; reduction; Jordan block over 𝔽₃ | Cokernel class has exponent 1. For a size-two unipotent block, invariant line maps to zero in the one-dimensional coinvariant quotient. The actual potential map is required. | No change. |
| 5.5 `firstExplicitReciprocity` | p=3; one graph point; multiplicity two | Value 4a₀a₁ for one point, doubled for multiplicity two. No degree factor is suppressed. | No change. |
| 5.6 `firstReciprocityExponentEquality` | Zero class; π-torsion; nonunit p+1 | Unit multiplication preserves exponent; a nonunit can lower it, so all stated unit hypotheses are needed. | No change. |
| 6.1 `secondReciprocityDatum` | m=0; m=1,2; two points over one pair; changed extra labels | Positive m is essential; finite function has value 2 on a double fibre. Unused rigidity/intertwining labels do not alter this datum. | No change. |
| 6.2 `secondGeometricReciprocity` | Singleton graph; double fibre; zero cycle | Both legs and T⋆ are retained; additivity counts multiplicity. | No change. |
| 6.3 `oddSpecialFiberCoinvariants` | n₁=3; zero localization; unipotent Jordan block | Weak semisimplicity is indispensable. Special-fibre concentration is not inferred merely from a nearby-fibre assertion. | No change. |
| 6.4 `secondExplicitReciprocity` | O/π²→O/π; zero function | Generator exponent falls from 2 to 1, so the stated inequality can be strict. | No change. |
| 7.1 `admissibleImageLift` | m=1,2; ξ=±1; identity component; small ℓ | The conjugate-component, unit and prime-to-ℓ conditions are indispensable; admissibility excludes the small coefficient characteristics. | No change. |
| 7.2 `auxiliaryPlaceDetection` | D=[[π,1],[0,π]], C=[[π,−1],[0,π]] over A₅; losses 0,2,≥k; zero span | DC=CD=π²I. Positive loss does not give a basis. For v=e₂, t=(−1,π), the first row kills t and the second gives π², exponent 3. If c≥k the scaled columns may vanish. | No change. |
| 7.3 annihilators and finite-condition API | n=2,ℓ=11; ramified coefficient field; Kummer uniformizer; perfect versus scaled pairing | Width 3≤9/2; finite–finite pairing has the fixed inverse-different bound. Over A₅, primitive perfect pairing of π and π² has exponent 2; scaling the pairing by π lowers it to 1, showing why perfectness matters. | Prior F01 repaired. |
| 7.3 `rigid_of_levelRaisingSpecial` | N=2,p=3 modulo 11; N=4 doubled pair modulo 19 | Simple Satake pair gives Frobenius pair {5,1}; doubled reciprocal pair gives {4,17} twice and fails both derivative and rigidity clauses. | Import generic rigidity API, R02; keep this specialization. |
| 7.4 `eventualAdmissibilityFamilies` | CM or geometrically isogenous curves; missing supercuspidal place; F⁺=ℚ | These are outside the stated respective family domains. Eventual admissibility is not admissibility at every prime. | No change. |
| 8.1 `rankinSelbergSelmerRankZeroOfPeriod` | c=0 or positive; different valuation 0 or positive; m at threshold | Contradiction needs strict m>m₀+c+mper+mlat+mdif; both arguments at ℓ are finite by the repaired construction and integral reduction. | No change. |
| 8.2 `rankinSelbergSelmerRankOne` | Zero regulator; multiplicity two; positive loss; primitive kernel | Zero regulator gives no lower bound. Nonzero chosen coordinate does; the upper bound uses loss 2c, zero first-place term and two finite arguments at ℓ. Admissibility supplies R01's missing antecedent for this application. | No endpoint restriction needed. |
| 8.3 `rankTheoremsTotallyRealBase` | n=2,F⁺=ℚ; n≥3,F⁺≠ℚ; missing uniform span | H(N) discharge is exactly on the stated domain; it does not discharge uniform span. | No change. |
| 8.4 `rankTwoThreeRankTheorems` | n=2,ℓ=11; ℓ=2,3; omit L6 or L7 | H(2),H(3) discharge does not delete L1–L7. Small primes fail the numerical condition. | No change. |
| 8.5 `hilbertPrecursorCompatibility` | g=1,3; even g; zero localized module | Twist is integral for odd g; even g is outside this theorem. Surjectivity onto zero is consistent but gives no replacement for the unitary theorem. | No change. |

The inseparable-extension and arbitrary non-Hausdorff/noncompact-group challenges do not produce new instances of the native number-field and profinite carriers. Generic geometric base changes are used only on their supplied domains. The finite/adic distinction and the continuous scalar-action hypotheses remain explicit in the pinned cohomology contracts.

### Duplication by object and pinned libraries

The content manifest pins were matched against the local library commits: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. A GitHub code search located the continuous-cohomology files; the actual definitions were then read at the pins. Object searches also covered polynomial reflection, PID torsion/free modules, cocycles/coboundaries, blowup charts, Abel–Jacobi, unitary level raising, Rankin–Selberg and potential maps. Generic curve Abel–Jacobi and modular-form oldform hits were distinguished from the proposed native higher-dimensional unitary objects.

| Object | Existing owner checked | Audit result |
| --- | --- | --- |
| Polynomial evaluation, derivative and degree reflection | `Mathlib/Algebra/Polynomial/Eval/Defs.lean`; `Derivative.lean`; `Reverse.lean:88`, `coeff_reflect` at line 95 | Cited carriers, not redefined. Reciprocal sign is correct. |
| Finite PID torsion decomposition and freeness | `Mathlib/Algebra/Module/PID.lean:168`, `Module.torsion_by_prime_power_decomposition`; `Mathlib/LinearAlgebra/FreeModule/PID.lean:397`, `Module.free_iff_isTorsionFree` | Finite/PID hypotheses are retained; no arbitrary-ring claim. |
| Continuous cohomology and functoriality | `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:113`, `TopRep.homogeneousCochains`; line 131, `continuousCohomology`; `Functoriality.lean:103`, `cochainsMap`, and line 148, `map` | Compatible restriction/coefficient-map direction is correct; the topology context was read. |
| Explicit degree-one cocycles and quotient | `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:172`, `d0`; section starting line 689, `H1`, `H1pi`; line 755, `nsmul_H1_eq_zero` | Continuous action is retained. The bare pointwise quotient is not silently treated as the discrete or adic comparison carrier. |
| Rees blowups and affine charts | `Mathlib/RingTheory/ReesAlgebra.lean:65`, `mem_reesAlgebra_iff`; `TauCeti/AlgebraicGeometry/Blowup/AffineCharts.lean:61`, `affineBlowupι`, and its range/cover/base-map API | General chart theory is imported; §2.6 keeps only the native product resolution. StableReduction Layer 4 supplies the general universal property. |
| Weak semisimplicity and integral local Selmer conditions | `TauCetiRoadmap/SelmerIwasawaCohomology/README.md`, §§0.12–0.13, 4.8–4.11, 4.24–4.25 | Imported. Both H⁰ vanishings in local uniform annihilation and coefficient pushout for torsion crystalline extensions were checked. |
| Exponents, realised Frobenius span and positive-loss matrices | `TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md:1297`, §1.15; line 2756, §4.4 | Imported. The Rankin–Selberg realization adds actual image/Hecke compatibility and does not redevelop the generic linear algebra. |
| Satake predicates and low-rank Hecke formulas | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md`, §SR.4.4, lines 3434–3568 | Imported with the same reciprocal, unit and normalized-operator conventions. |
| Rigid polarized residual representations | `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:2114`, §2.20 | Existing definition is incorrectly requested as a new gap: R02. |
| Rational concentration versus multiplicity | `TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:1159`, AG2.1b; line 2017, AG2.5 | Compact ST/END concentration does not supply the full native nonproper concentration gap; conditional RACSDC comparison does not remove R01. |
| Native models, finite CM torsor and trace | `TauCetiRoadmap/PELModuli/README.md`, §§M2.8, M4.3, M4.7–M4.9; ShimuraVarieties §6.7 | Existing generic/smooth/torsor APIs are separated from the special-level and nonproper native comparisons. No division by the finite group order. |
| Transfer and oldform dimensions | `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4852`, §§13.6–13.9 | Actual S_FL, residue-characteristic and level restrictions were read. Their removal is an explicit residual contract, not an alleged supplied theorem. |

The main-branch roadmap and Completed trees were searched by these objects. The four additional open roadmap heads were also read by scope and searched: ColemanIntegrationPartII `bd972d91ed7d5d8bd3dd2e7ee84b35853db32ba4`, QWittVectors `4605fbb0a2d9279b561f9467ab5cce09d7f2469e`, ErdosProgressionPowers `72b615703f7fc5d175e519ddbb6e589d3d744c6c`, and ArithmeticDynamics `85e78c07dcc361ead6505c970a1181deee483819`. Their integration, Witt, progression-power and dynamical objects do not duplicate the native unitary targets. Coleman curve integration is not the integral codimension-n regulator required here. No supplier ownership needs moving down the merge order.

### Supplier order, citation existence and gap audit

Read every `*Needs:*` line and the supplier inventory. There are 24 named roadmap suppliers: five present on main and 19 checked against their available roadmap heads. The supplied README snapshots for those 19 were compared with the files at their recorded Git commits. Section/header existence was checked independently of the gate. The named suppliers precede the candidate's computed insertion point; the internal target graph is acyclic. No missing supplied section, upward citation or additional unowned prerequisite was found. R02 is a nonminimal declared gap, not supplier drift.

All 21 gap slugs occur in both the plan and README; their `neededBy` lists match the target references, and every gap names an owner. The needs sentences were read with their adjacent explicit domain and source locator. Their linked compatibilities form one consumed interface in each case. The following table records the residual content checked; an outstanding contracted theorem is not counted as an unowned prerequisite.

| Gap | Supplier boundary checked | Result |
| --- | --- | --- |
| `rigidity` | LocalGaloisDeformationRings §§1.6, 2.3, 2.12, 2.20 | Already supplied; remove the duplicate gap, R02. |
| `native-shimura` | PELModuli smooth algebraic-space/model domain and ShimuraVarieties §6.7 | Residual native semistable, link, nonproper specialization and other-places-over-p models are explicitly distinguished. |
| `unitary-incidence` | ReductiveGroupsPartII hermitian/group targets | Appendix A Frobenius incidence geometry is a distinct new obligation, not a fictitious existing section. |
| `nearby-weight` | LefschetzPencilsAndVanishingCycles §§7a.7–7a.9 | Existing rational weight machinery does not supply the stated torsion/adic filtered inertia quotient; stratum parity hypotheses are specified. |
| `automorphic-multiplicity` | AG2.1b and AG2.5 | Exact H(N), conjugation and removal domains remain residual; its antecedent must still be added in §4.5. |
| `diagonal-concentration` | AG2.1b compact ST/END concentration | Native rational nonproper cuspidal specialization is residual and remains independent of H(N) and residual absolute irreducibility. |
| `boundary-cohomology` | ShimuraCompactifications boundary geometry | The native integral Hecke-localized boundary vanishing under residual irreducibility is a separate obligation. |
| `rigid-r-equals-t` | GlobalGaloisDeformations §§3.3–3.8 | The exact polarized D0–D4 theorem, full coefficient domain and mixed-to-congruence maps are not supplied by the generic patching interface alone. |
| `old-form-dimension` | EndoscopicTransferAndUnitaryTraceComparison §§13.7–13.9 | Residual all-place and transferable-level extension is explicitly beyond the supplied restricted theorem; normalization and classification inputs remain. |
| `local-unitary-representations` | Local packet and tower interfaces, §§11–13 | Primitive finite-field link cohomology is not identified with local tower cohomology without its additional comparison. |
| `chow-abel-jacobi` | MotivesAndAlgebraicCycles §§7.16–7.18 | Existing homological-triviality/rank/height targets do not supply the integral arithmetic étale regulator with these support and coefficient compatibilities. |
| `hochshild-serre-adic` | SchemeAndStackFoundations §2.15; EtaleCohomologyFoundations §F.4.6 | Adic single-row edge and reduction/rationalization comparisons are distinct from the supplied finite-cover statement. Slug spelling is synchronized. |
| `purity-crystalline-regulator` | ArithmeticGaloisDuality and base Selmer finite-condition API | Integral geometric finite membership, including the projected nonproper domain, is additional to a predicate and its pushout API. Prior F01 repair is declared here. |
| `unitary-special-compatibility` | ShimuraVarieties native map domain | Addition-of-line, uniformization and isogeny scaling diagrams are a separate named obligation. |
| `semistable-boundary` | LefschetzPencilsAndVanishingCycles nearby cycles | General potential-map/Abel–Jacobi comparison with support assumptions is not the rational weight sequence alone. |
| `polarized-image-lifting` | ArithmeticGaloisRepresentations polarized categories | Simultaneous finite-congruence lifting and cyclotomic compatibility are distinguished from the category itself. |
| `hecke-finite-support` | IntegralHeckeAndGaloisDeterminants | Native Hecke-support contraction and simultaneous Frobenius separation require the stated residual theorem; Chebotarev alone is not used as that theorem. |
| `eventual-images` | ArithmeticGaloisRepresentations image and symmetric-power APIs | The two specified family criteria are more specific than generic symmetric-power/image constructions. |
| `eventual-rigidity` | GlobalGaloisDeformations; ltxzz-deformation Corollary 4.1.2 and Theorem 4.2.6 | Exact non-CM and supercuspidal families are retained; no universal eventual-rigidity claim. |
| `hilbert-precursor` | HilbertModularVarietiesAndShimuraCurves | Native Liu–Tian Theorem 4.7 is not claimed as an existing section; its Assumption 4.1/Definition 4.5 domain is explicit. |
| `hermitian-local-global` | AdelicAlgebraicGroups §4.1 | Simply connected torsor Hasse statements alone do not provide full hermitian classification/existence with prescribed determinant and finite local invariants. |

The prescribed gate invocation using `packages/SelmerIwasawaCohomologyPartII/README.md` exited 1 because that package-stage file is absent. It produced no dependency result. Repeating the same check with `--candidate packages/SelmerIwasawaCohomologyPartII/design/README.md`, the same roadmap selector and `merge-order/ORDER.txt`, exited 0 with this output:

```text
candidate: SelmerIwasawaCohomologyPartII is not in the merge order yet; checked as if placed after IgusaVarietiesAndTorsionConcentration (the intake inserts it when its design is accepted)
depcheck: 5 roadmaps, 48 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. This mechanical result is reported at its actual scope and supplemented by the citation/gap checks above. Neither the tooling nor the merge order was edited.

## Not verifiable

- **Lean elaboration: not available.** This is a design-only package with no `Suggested.lean`, and the brief supplies no executable Lean elaboration command. No Lean command was run, and no type-checking or proof result is claimed. Package-stage signatures, binder retention, proved mirrors and the single-import policy must be checked when that file exists. The README's heavy native objects were not forced onto substitute carriers.
- **Future supplier implementations.** The residual contracts other than the duplicate rigidity request remain contracts. Their implementation is not certified by this review and is not a new defect. In particular, the newly expanded integral crystalline regulator theorem is not proved merely by the existing local-condition predicate.
- **Original gate candidate.** The package-stage README named in the prescribed command is absent; the successful design-candidate result is recorded above. Absence from the merge order is not a finding.
- **Round-4 report placement.** The expected copy was absent in the designated checkout; the recovered read-only copy and the current repair report permitted all three prior findings to be checked.
- **Missing source texts: none.** All five cited works and all 15 sampled passages were readable. No missing-reference request, waiver, paywall bypass or source-manifest change was needed.

Artifact validation passed: JSON and TOML parse, finding counts agree, the adversarial table covers every target ID, and no machine path occurs in either deliverable. Git status shows only the two requested review files as new; the reviewed design files and sources manifest are unchanged. No Lean process, network write or other background task remains running.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "395eb14bd021ecbb910da110d9908d5678e27184", "job": "REV-DESIGN-SelmerIwasawaCohomologyPartII~5", "model": "gpt-6-astra", "worker": "chris-4"} -->
