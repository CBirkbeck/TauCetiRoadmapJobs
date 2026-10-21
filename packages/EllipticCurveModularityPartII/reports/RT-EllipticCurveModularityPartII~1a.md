<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/134#issuecomment-6328720985 -->
Red team round 1 pass a (codex) of fd8fb19

Verdict: needs_changes

1. **F01** (P1) The central supplier is unowned

   **Location:** packages/EllipticCurveModularityPartII/README.md:5: “All definitions and theorems below are imports from that roadmap or consequences of the specified imports.”

   **Claim:** EllipticModularityEffectiveComparisons supplies EC.0–EC.5 and all the target identifiers in the supplier table and prerequisite lists.

   **Witness:** No EllipticModularityEffectiveComparisons folder exists in the supplied active, completed, sibling-head or package trees; merge-order/ORDER.txt contains no such supplier. There is no packages/EllipticCurveModularityPartII/design/plan.json declaring these missing contracts.

   **Exact repair text:** Replace the ownership paragraph with: “This Part II develops effective residual comparisons beyond EllipticCurveModularity's modularity theorem. EC.1–EC.6 below own the new comparison results. Existing arithmetic and geometric prerequisites are imported by exact declaration or roadmap target.” Replace every fictitious EC.0–EC.5 import by an earlier local target, a verified existing supplier target, or a precise declared supplier gap. Do not create a second roadmap covering this package verbatim.

2. **F02** (P1) Forced headlines depend on admitted data

   **Location:** packages/EllipticCurveModularityPartII/Suggested.lean:72, 149, 288, 632, 797: “def localTerms … := by sorry”; “def windingQuotient … := by sorry”.

   **Claim:** The file presents native headline signatures by admitting the prerequisite arithmetic, representation, scheme, quotient and model constructions.

   **Witness:** localTerms, martinValue, krausG, integralCoefficient, rho, conductor, x0, jacobian, windingQuotient, analyticTopology, canonicalModel and completedStalkMap have admitted bodies. The geometric headline types depend on these bodies transitively.

   **Exact repair text:** “packages/EllipticCurveModularityPartII/Suggested.lean contains only light definitions with real bodies and headline statements on pinned carriers or those definitions. The geometric comparisons and constructions whose carriers are unavailable are specified in packages/EllipticCurveModularityPartII/README.md.” Implement the finite tables, formulas and finite sets with real bodies; remove the admitted Native construction block. Restate easy elliptic headlines directly on the pinned torsion action and real-bodied isogeny/CM predicates; leave the modular-curve, winding-quotient and integral-model headlines in packages/EllipticCurveModularityPartII/README.md until their carriers exist.

3. **F03** (P3) All 29 advertised examples are admitted

   **Location:** packages/EllipticCurveModularityPartII/Suggested.lean:92–256: “example : localTerms 0 0 = ![1, 1, 1, 1, 1] := by sorry”.

   **Claim:** packages/EllipticCurveModularityPartII/README.md:45 and :397 advertise 29 examples as checks of the eight imported definitions.

   **Witness:** Every one of the 29 example declarations between lines 93 and 256 ends in sorry. Each advertised definition has three or four Lean examples, exceeding the two-example cap.

   **Exact repair text:** After replacing admitted definitions with real bodies, keep at most two proved discriminating examples per definition. Turn every further statable boundary Check into a named theorem target, list its exact Lean name and locator in packages/EllipticCurveModularityPartII/README.md, and use sorry only for that theorem. Retain at least three discriminating README Checks per definition.

4. **F04** (P1) Two imports do not exist at the pin

   **Location:** packages/EllipticCurveModularityPartII/Suggested.lean:21,41: “import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.BaseChange”.

   **Claim:** Both imported root module paths name available pinned modules.

   **Witness:** The pinned tree has Isogeny/BaseChange/Basic.lean and QuadraticTwist/Basic.lean, but neither Isogeny/BaseChange.lean nor QuadraticTwist.lean. These imports fail before declaration elaboration.

   **Exact repair text:** Use `import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.BaseChange.Basic` and `import TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist.Basic` if the retained signatures need them; otherwise remove them. Select imports only after the admitted-data pruning in R02.

5. **F05** (P1) Existing sibling ownership and threshold conventions are ignored

   **Location:** packages/EllipticCurveModularityPartII/README.md:92,117,209,264,274,397: the effective comparisons are assigned to EllipticModularityEffectiveComparisons.

   **Claim:** Martin's bound, removed-prime bounds, Kraus realization and uniform two-torsion irreducibility require a new supplying development.

   **Witness:** TauCetiRoadmap/ErdosProgressionPowers/README.md:568–588, current supplied head, already owns removedPrimeBound, Martin's inequality, krausRealization and both irreducibility targets. Its krausF/G are explicitly larger numerical majorants (lines 575–590).

   **Exact repair text:** “Import ErdosProgressionPowers §1.1 `removedPrimeBound`, its Martin inequality, `fullTwoTorsion_irreducible` and `rationalTwoTorsion_irreducible`. Its Kraus thresholds are numerical majorants; the square-root thresholds here are sharper and must have distinct names and a comparison theorem. Import its existing realization theorem at those majorants; state only the genuinely stronger realization as new work.” Remove duplicate owned targets, preserve Martin's additional equality characterization as an extension, and give separate names plus the N=11 comparison H_sharp=13+4√3 < H_majorant=169.

6. **F06** (P1) Unavailable supplier sections are asserted as existing contracts

   **Location:** packages/EllipticCurveModularityPartII/README.md:9,15,154,264,313,333,353: “EllipticCurveModularity:R29.6/modularity-theorem”; “RankZeroOneBSD:BSD.4”.

   **Claim:** Named R01/R12/R14/R19/R20/R29 and BSD sections supply the required exact statements; higher-dimensional winding and Cartan extensions are prerequisites.

   **Witness:** These supplier folders/sections are absent from the supplied main and sibling trees. TauCetiRoadmap/ErdosProgressionPowers/README.md:273–282 explicitly records the modularity, lowering and newform prerequisites as gaps with unavailable locators. This package declares none.

   **Exact repair text:** Replace unverifiable section imports by precise contracts under `## Exact supplier contracts`, with matching `gap:<slug>` entries in packages/EllipticCurveModularityPartII/design/plan.json. Use the already named earlier suppliers for modularity, optimized lifts, conductor/oddness, modular Jacobians, Chen's isogeny, integral winding/cotangent theory and higher-dimensional rank zero. Split each contract into a single statement with its hypotheses. Do not cite RankZeroOneBSD as a supplier unless its availability and supply direction are established; assign the higher-dimensional rank-zero result to an allowed owner. Keep genuinely available main-roadmap imports with their actual headings.

7. **F07** (P1) Pinned objects are reconstructed instead of imported

   **Location:** packages/EllipticCurveModularityPartII/Suggested.lean:288–323,401–411,1023–1058,1110–1118.

   **Claim:** Torsion action, representation scalar extension, coefficient fields, ramification groups and finite flat group schemes need local preview constructions.

   **Witness:** Pinned declarations include WeierstrassCurve.torsionGaloisAction, Representation.baseChange, TauCeti.CoefficientField, TauCeti.numberField_CoefficientField, Ideal.ramificationGroup and TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat. The package redeclares these objects, partly with admitted bodies.

   **Exact repair text:** Import the existing APIs: TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:64; TauCeti/RepresentationTheory/BaseChange.lean:100; TauCeti/NumberTheory/ModularForms/Newforms/Fields.lean:48; TauCeti/NumberTheory/ModularForms/Newforms/NumberField.lean:152,157; TauCeti/RingTheory/Ideal/RamificationGroup.lean:60; TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:131. Use Mathlib's Representation.IsIrreducible from Mathlib/RepresentationTheory/Irreducible.lean:29. Any necessary linear/additive or index adapter must have a real body and an explicit comparison, not a second admitted definition. State the elliptic surjectivity headline directly on the pinned torsion action, without an admitted basis or rho.

8. **F08** (P1) Chen's factorization silently asserts old-part vanishing at every level

   **Location:** packages/EllipticCurveModularityPartII/Suggested.lean:1149–1156: “pNewProjection r p ≫ chenNewMap r p = chenMap r p”.

   **Claim:** The correspondence factors through the p-new quotient for every natural r and prime p, without the genus-zero hypothesis used in the README.

   **Witness:** Take r=11,p=17. J₀(11) is nonzero; pull-push sends its old pullback to a positive multiple of its pullback on the nonsplit curve. Lemos line 335 uses genus zero to kill precisely this image.

   **Exact repair text:** Require `r ∈ {1,2,3,5,7,13}` and p prime outside that set for this factorization into the full nonsplit Jacobian. In the general positive-level coprime theory, factor into the nonsplit p-new quotient instead. The README target and supplier contract must state these hypotheses explicitly. Remove the unqualified `chenNewMap_factor` preview under R02.

9. **F09** (P2) Atkin–Lehner constructions omit the exact-divisor hypothesis

   **Location:** packages/EllipticCurveModularityPartII/Suggested.lean:762–770,1192–1195: “The p-local Atkin–Lehner involution, with r-level retained.”

   **Claim:** w_(p²) is defined on X₀(rp²) and its newspace for every r and prime p.

   **Witness:** At r=p=5, p²=25 is not an exact divisor of rp²=125: gcd(25,125/25)=5. The indicated Atkin–Lehner involution does not exist with that label.

   **Exact repair text:** Add `Nat.Coprime r p` to the w_(p²), quotient and newspace-involution contracts, and propagate it to every construction using them. State “r>0, p prime, gcd(r,p)=1” in their README specifications. The five-level application supplies these assumptions from its displayed ranges.

10. **F10** (P2) The general Cartan integrality result is narrowed to the application range

   **Location:** packages/EllipticCurveModularityPartII/README.md:317,327,337; packages/EllipticCurveModularityPartII/Suggested.lean:1244–1275: “a prime p > 37”.

   **Claim:** The roadmap supplies formal immersion and denominator exclusion only for p>37, and integral j only for a non-CM proper image at that range.

   **Witness:** Lemos lines 107–110 and 136–139 state denominator exclusion and integrality for every prime p outside {2,3,5,7,13}, under nonsplit-normalizer containment, without non-CM. Thus p=11 and p=17 are omitted.

   **Exact repair text:** “For r∈{2,3,5,7,13}, prime p outside that set, and E/ℚ admitting a rational cyclic r-isogeny with mod-p image contained in a nonsplit Cartan normalizer, j(E)∈ℤ[1/p], and in fact j(E)∈ℤ.” Develop the formal-immersion input in that same range (q≡±1 mod p gives q≥2p−1>13). Retain the non-CM proper-image statement for p>37 as a corollary, with its additional subgroup-classification input.

11. **F11** (P2) The full-two-torsion theorem unnecessarily drops ell=5

   **Location:** packages/EllipticCurveModularityPartII/README.md:240,260; packages/EllipticCurveModularityPartII/Suggested.lean:556–571: “ell ≥ 7”.

   **Claim:** Cyclic 4ell-isogenies and reducible full-two-torsion representations are excluded only for primes ell≥7.

   **Witness:** packages/EllipticCurveModularityPartII/README.md:225 already observes that no 4ell with ell≥5 lies in the stated complete cyclic-degree list. At ell=5 the kernel transport would give the equally forbidden degree 20.

   **Exact repair text:** Replace the lower bound 7 by 5 in the cyclic-four-prime exclusion and full-rational-two-torsion irreducibility targets, including their absolute upgrades. Import the existing ell≥7 theorem by name and state ell=5 as the extension needed for the complete range. Add a named ell=5 boundary target/Check rather than silently leaving it outside the library statement.

12. **F12** (P1) The two-isogeny proof imports the theorem it is meant to establish

   **Location:** packages/EllipticCurveModularityPartII/README.md:199,209–211: “EC.3/kraus-full-two-realization”.

   **Claim:** The two-isogeny repair consumes full-two realization, while full-two realization is proved by applying the isogeny repair.

   **Witness:** Line 199 lists kraus-full-two-realization among repair prerequisites; line 211 uses the repair to prove that same realization. This is a target-level dependency cycle hidden by the single supplier name.

   **Exact repair text:** Remove `kraus-full-two-realization` from the repair's prerequisites. Its inputs are Chebotarev on C[4], the rational-two-point and matrix/quotient-selection results, prime-to-degree torsion invariance, and conductor invariance. The realization theorem may then depend on repair, never conversely.

13. **F13** (P3) Source provenance and the composite-degree locator are missing

   **Location:** packages/EllipticCurveModularityPartII/README.md:242,246,591–600; package file inventory.

   **Claim:** The complete Mazur–Kenku cyclic-degree classification is an available cited input, and the six references have recorded editions/provenance.

   **Witness:** No packages/EllipticCurveModularityPartII/sources.toml exists. The composite-degree target cites BS applications and a nonexistent supplier; Mazur lines 83–100 explicitly leave several composite levels unsettled. No primary Kenku work or exact classification locator is given.

   **Exact repair text:** Add packages/EllipticCurveModularityPartII/sources.toml in schema `tauceti-roadmap-sources/v1` with all six cited editions, exact locators, cited-for targets and source-service provenance. Add the precise primary composite-isogeny reference to the actual owner's contract, or import that owner's verified classification target. Do not use Mazur's prime-degree theorem or BS's two irreducibility applications as a locator for the complete composite classification.

14. **F14** (P3) The Lean file violates the prescribed interface format

   **Location:** packages/EllipticCurveModularityPartII/Suggested.lean:1–42,44–62,69,74,1321.

   **Claim:** This is a compliant representative-signature file for EllipticCurveModularityPartII.

   **Witness:** There are 29 Mathlib submodule imports, 79 lemma declarations, and no TauCetiRoadmap.EllipticCurveModularityPartII namespace. Numerous declarations lack docstrings and README names; examples include newDimension, CyclicPair and largeLevelJ.

   **Exact repair text:** Replace all Mathlib submodule imports by the single line `import Mathlib`, followed only by used existing TauCeti modules. Use `namespace TauCetiRoadmap.EllipticCurveModularityPartII`, `theorem` throughout, the required module title “EllipticCurveModularityPartII: representative target signatures”, and README-ordered `Layer k` section comments. Give every retained declaration a mathematical docstring and exact README name/locator. Remove supplier-preview/process commentary rather than presenting it as mathematical specification.

15. **F15** (P3) The proved acceptance block does not test the roadmap definitions

   **Location:** packages/EllipticCurveModularityPartII/Suggested.lean:1348–1518; packages/EllipticCurveModularityPartII/README.md:583–589.

   **Claim:** The proved arithmetic block supplies acceptance checks for the new thresholds and comparison definitions.

   **Witness:** The level-11 inequalities mention only square roots, never krausF/G/H. The sole proved example tests X+1 at 1/2. The remaining block develops private mod-four lemmas; all actual definition examples remain admitted.

   **Exact repair text:** Replace the detached square-root examples by proved tests of the retained real-bodied krausF/G/H definitions. Keep the polynomial-integrality and mod-four subgroup statements as named milestone theorem signatures with README locators, without developing their proofs in packages/EllipticCurveModularityPartII/Suggested.lean. For any retained new predicate, supply three discriminating README Checks, with at most two proved Lean examples and any additional statable boundary case named as a theorem target. Include a satisfying and a failing example, and explicitly test the selected sign/map conventions.

16. **F16** (P2) The period comparison leaves the factor 2πi unspecified

   **Location:** packages/EllipticCurveModularityPartII/Suggested.lean:1182–1205: “Integration of the descended holomorphic differential”; “= windingPeriod f”.

   **Claim:** The imported Jacobian/modular-form period pairing of the winding class equals the raw integral defined by windingPeriod.

   **Witness:** windingPeriod is i∫₀∞f(it)dt, the integral of f(z)dz. DarmonMerel line 612 defines the descended differential as 2πi f(z)dz. No API specifies a compensating normalization for periodPairing.

   **Exact repair text:** In the README supplier contract specify “ω_f=2πi f(z)dz, the pairing integrates ω_f, and the winding path is oriented from 0 to i∞.” With that convention replace the comparison's right-hand side by `(2 * Real.pi * Complex.I) * windingPeriod f`. Alternatively explicitly define an unnormalized pairing and state its scalar comparison with the supplier's normalized one. Add a discriminating orientation/scalar Check; keep this geometric comparison in packages/EllipticCurveModularityPartII/README.md while its carriers are unavailable.

## Verified sound

Read every line of packages/EllipticCurveModularityPartII/README.md (600) and packages/EllipticCurveModularityPartII/Suggested.lean (1,522). The inventory contains **336 declarations**: 118 definitions, 41 abbreviations, 17 instances, four structures, 79 lemmas, 47 theorems and 30 examples. No standing `variable` or `include` block hides a required instance. There are **103 admitted data/instance declarations** and 29 admitted examples; these are not certified as constructions or tests.

Read **31 prose theorem targets, eight definition families and their 27 API targets**, and checked all **29 advertised arithmetic Checks** against their displayed formulas. All 29 arithmetic values agree. Additional checks covered the norm estimate over ℚ, zero/unit-ideal exclusions, the degree-one rational-polynomial negative control, strict maximum inequalities, and the mod-four scalar identities by exhaustive finite arithmetic. This verifies the arithmetic, not the admitted Lean examples.

Checked **39 README source-locator blocks** against the six stated editions, obtained legally through the source service. The theorem/section/page locations were found; composite-classification and certificate support limits are recorded in R13 and below. Also checked the primary split-Cartan theorem in Bilu–Parent–Rebolledo. No source passages were copied into the report or repository.

Searched all **seven supplied sibling heads**. The package contains no direct citations of these seven siblings; the substantive ownership overlap is ErdosProgressionPowers §1.1 (R05). Audited **78 distinct formal roadmap-target citations**, including 67 assigned to the nonexistent central supplier. Checked the main-roadmap scope references for EllipticCurves, ModularForms, ModularCurves, StableReduction and JacobianChallenge against their current files. Pinned Mathlib norm-product and embedding-count declarations have the required finite/separable hypotheses; NumberField supplies them here.

The source statements support the square-root thresholds, the lcm(N,4) convention, Martin's exceptional equality level35, the removed-prime estimate, Kraus's weight/conductor hypotheses, the rational two-isogeny repair, the displayed prime-isogeny lists, and Lemos's final theorem. The standalone integral-polynomial and mod-four subgroup arguments have no mathematical counterexample in the tested boundary cases. The Hom identity in NonCM is the identity endomorphism; the multiplicative `1` in the abelian-variety morphism APIs is the zero group homomorphism, so these different uses are consistent.

The original diff changes only the package folder (packages/EllipticCurveModularityPartII/README.md, packages/EllipticCurveModularityPartII/Suggested.lean, packages/EllipticCurveModularityPartII/metadata.toml and packages/EllipticCurveModularityPartII/review.json). There is no set_option, True placeholder, #eval, #synth or #print axioms in packages/EllipticCurveModularityPartII/Suggested.lean. No Lean build or elaboration was run.

Dependency-check output (unchanged README):

```text
NOT IN ORDER: EllipticCurveModularityPartII (insert it after its last supplier)
depcheck: 8 roadmaps, 50 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. The not-in-order message is not itself a finding. The check does not establish the missing supplier contracts or detect the target-level cycle in R12. No ownership was moved or package source edited during this read-only pass.

The mathematical pass is recorded below. Full per-declaration signatures, variable/instance contexts, per-API rows and source provenance are retained in scratch notes. A source-backed mathematical statement in this table remains subject to the ownership and admitted-carrier findings.

| Statement (README line) | Instances tried | Result | Change |
|---|---|---|---|
| F (56) | N=1,11,35; dimension zero | Formula and positive-level restriction agree; Kraus line 240 | R01,R02,R05 |
| G (66) | N=1,2,4,11; lcm versus 4N | G(4)=4; wrong 4N gives 9; Kraus line 270 | R01,R02,R05 |
| H (76) | N=1,4,11; strict inequality | H(11)=G(11)>F(11); max iff correct; Kraus line 279 | R01,R02,R05 |
| Martin bound and equality (86) | N=1,2,3,11,30,35; arithmetic expression N≤300 | Correct equality exceptions; dimension identification is a distinct obligation; Martin line 113; line 747; line 836 | R01,R05 |
| Integral norm bound (101) | K=Q,x=ell,B=ell; zero x; unit ideal; B<0 | Equality in rational example; invalid cases excluded; d>0 follows; BS line 201; pinned norm product/count | R01 |
| Removed-prime bound (111) | p=2,ell=3; p=ell; p=1; both trace signs | Positive trace gap for prime p; excluded p=ell explicit; BS line 195 | R01,R02,R05 |
| Rationality from small primes (126) | N=1 empty newspace; q dividing N; constant coefficient | Bad-prime coefficients 0 or ±1; normalized/primitive/trivial character retained; Kraus line 295 | R01,R02,R07 |
| Small-prime integrality (136) | q=ell; q dividing N; nonrational coefficient | Dimension≥1 forces tested q<ell; norm difference nonzero; Kraus line 307 | R01,R02 |
| Rational newform realization (146) | N=1; reducible residual negative control; exact versus imprimitive level | Empty level-one case harmless; irreducibility/exact level retained; Kraus line 232 | R01,R02,R06 |
| Kraus rational comparison (156) | N=1; ell=5,7; strict threshold; additive at ell | Weight and prime-to-ell conductor explicitly present; Kraus line 249 | R01,R02,R06 |
| Finite mod-four recognition (173) | Odd good primes; primes dividing 2N; N=1 | Source corollary supports finite/all-prime equivalence; Kraus line 1095 | R01,R02 |
| Point-count transfer (183) | Removed multiplicative q; q=ell; good q | Hasse/strict threshold exclude bad small q; equality only at tested primes; Kraus line 392 | R01,R02 |
| Two-isogeny repair (193) | C:y²=x³−x; C:y²=x³−x²+x | Identity handles full two; second quotient y²=x³+2x²−3x has full two; Kraus line 435 | R01,R02,R12 |
| Full-two realization (203) | H versus F at N=11; ell odd | Both strict thresholds are required and supplied by max; Kraus line 284 | R01,R02,R05 |
| Deletion/conductor adapter (213) | Good ell; multiplicative ell with ell dividing valuation; additive ell | Additive ell explains failure of unconditional equality; weight is separate; BS line 169; Kraus line 210 | R01,R02,R06 |
| Prime-isogeny classification (228) | r=2,19,43,67,163; CM versus non-CM | Displayed prime lists agree with introduction and CM cases; Mazur line 26; line 35; line 993 | R01,R02,R06 |
| Composite exclusions (238) | ell=5 gives20; ell=7 gives14/28; ell=11 gives22 | 14 exists; 20 omitted unnecessarily; composite source missing; BS line 294; line 334 (applications only) | R01,R02,R11,R13 |
| Coprime-kernel transport (248) | ell=3,5; distinct versus equal two-kernels | Distinct kernels make cyclic degree4; identity [2] would not; BS line 294; line 334 (derived argument) | R01,R02,R06 |
| Full-two irreducibility (258) | ell=2 negative control; ell=5,7; CM curves | Oddness upgrades absolute irreducibility; ell=5 should be included; BS line 294 | R01,R02,R05,R11 |
| One-two irreducibility (268) | ell=7 cyclic14 counterexample; ell=11; CM curves | Cutoff11 and absolute upgrade valid; BS line 334 | R01,R02,R05 |
| Nonsplit potential good reduction (285) | p=5; q=p; q≡±1; p=2,3 | Local cyclotomic-square contradiction uses p≥5 exactly; Lemos line 141; line 177 | R01,R02 |
| Chen correspondence (295) | r=2,p=17; r=11,p=17; r=p=5 | Restricted README statement supported; unrestricted native factorization fails; Lemos line 331; line 349 | R01,R02,R08,R09 |
| Finite winding quotient (305) | r=1 excluded; r=2,3 versus5,7,13; rank-zero dimension0 | Nonzero and optimal are conclusions; higher-dimensional rank-zero prerequisite unowned; Lemos line 355; DarmonMerel line 590 | R01,R02,R06 |
| Cusp immersion/point torsion (315) | p=11,q=23; q=2,3; arbitrary rank-zero quotient | Smaller p range works; specified quotient and q conditions matter; DarmonMerel line 725; line 758; Lemos line 377 | R01,R02,R06,R10 |
| Denominator exclusion (325) | p=11,17; denominator q=p versus q≠p | Source covers omitted smaller primes; Lemos line 107 | R01,R02,R10 |
| Integral j (335) | p=11,17 with nonsplit containment; CM and non-CM | Source requires neither non-CM nor p>37 under containment; Lemos line 136 | R01,R02,R10 |
| Genus-zero j values (345) | Both signs of all constant-term divisors; t=0; rational t=1/2 | Arithmetic sets agree; t=0 excluded; coordinate comparison essential; Lemos line 231; line 249 | R01,R02,R06 |
| Proper-image classification (355) | p=37 excluded; p=41; CM negative control | Correct p>37 and geometric non-CM hypotheses; Lemos line 223; BiluParentRebolledo line 104 | R01,R02,R06 |
| Quadratic-twist surjectivity (365) | Trivial twist; independent quadratic character; p=2,3 | For p≥5 SL2 perfectness and determinant characters preserve surjectivity; Lemos line 204 (use); derived group argument | R01,R02 |
| Finite image certificates (375) | Every p>37; omitted CM j=−2^15; twisting | Correct list; source uses database computations, certificates not reproduced; Lemos line 197; line 212; line 261 | R01,R02,R06 |
| Lemos theorem (385) | Degree1 excluded; composite cyclic degree; CM excluded; p=37 excluded | Prime-degree reduction and p>37 conclusion match source; Lemos line 44 | R01,R02,R06 |
| localTerms definition/API/4 Checks (399) | p=0,1,2,3,4,5; e=0,1,2,3,4 | All four displayed values agree; nonprime junk convention explicit; Martin line 77 | R01,R02,R03 |
| martinValue definition/API/4 Checks (420) | N=0,1,11,30,35; empty prime product | Values0,0,1,1,3 agree; N=0 isolated convention; Martin line 69 | R01,R02,R03,R05 |
| krausF definition/API/3 Checks (441) | N=1,11,35; zero dimension | Values and lower bound1 agree; Kraus line 240 | R01,R03,R05 |
| krausG definition/API/3 Checks (461) | N=1,4,11; 4 dividing N | All three displayed values agree; Kraus line 270 | R01,R02,R03,R05 |
| krausH definition/API/3 Checks (481) | N=1,4,11; ell=H equality boundary | Strict iff and all three values agree; Kraus line 279 | R01,R02,R03,R05 |
| Local filters definition/API/4 Checks (502) | p=2,3; e=0,1,2; a=−1; zero ring; reduction mod2 | Six branches and four Checks agree; constant/map identities hold; Kraus line 1148 | R01,R02,R03 |
| Five numerators definition/API/4 Checks (524) | r=2,3,5,7,13 and r=0,11; degree/constant | Monicity,degrees,constants and four Checks agree; Lemos line 236 | R01,R02,R03 |
| Finite integral sets definition/API/4 Checks (546) | Every signed divisor for all five r; r=11 | Cards25,13,8,6,4 and exact level13 set agree; Lemos line 253 | R01,R02,R03 |

## Not verifiable

- Lean elaboration and the final elaborated types were not run, as required by the read-only brief. Static inspection already identifies the two absent imports in R04. An earlier acceptance record's build claim is not evidence about these current pins.
- The unavailable supplier sections and all 67 EllipticModularityEffectiveComparisons target identifiers cannot be checked at owning heads. No matching declared-gap manifest exists. R01 and R06 identify the repairs.
- The complete Mazur–Kenku composite-degree theorem has no primary locator in the package. The source service located Kenku's work only behind a paywall and recorded it as uncertified; its contents were not guessed and no access request remains pending.
- The finite all-primes image certificates, explicit models and exceptional-prime bounds are not contained in this package. Lemos line 206 and line 261 describe database checks; the universal certification obligation at packages/EllipticCurveModularityPartII/README.md:383 has no reproduced certificates or independently verified primary criterion here. This is part of the unowned supply chain in R01/R06, not a claim that Lemos's theorem is false.
- No independent reconstruction of Chen's theorem, higher-dimensional rank-zero theory, the five-level winding nonvanishing argument, or the integral cotangent comparison was attempted. Their named prerequisites are absent and the admitted Native objects do not supply them.
- Period normalization cannot be certified from an admitted periodPairing with no differential-specification API. packages/EllipticCurveModularityPartII/Suggested.lean:1182 computes the raw integral of f(z)dz; DarmonMerel line 612 uses 2πi f(z)dz. A retained README comparison must state which differential its pairing uses and the corresponding scalar. R16 records the missing normalization contract; R02/R15 require removing the surrogate and testing the eventual convention.
- All six explicitly cited source works and the additional Bilu–Parent–Rebolledo source were obtained legally. There are no unresolved open-text requests; the source-service classification failures were resolved. No source file was placed in the package.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "fd8fb194fa3085df6a23706092eaa178c3973b16", "job": "RT-EllipticCurveModularityPartII~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
