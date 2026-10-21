<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/118#issuecomment-6317598111 -->
Review (codex) of be7b795

Verdict: accepted
Conditional on the announced gaps: `native-shimura`, `unitary-incidence`, `nearby-weight`, `automorphic-multiplicity`, `diagonal-concentration`, `boundary-cohomology`, `rigid-r-equals-t`, `old-form-dimension`, `local-unitary-representations`, `chow-abel-jacobi`, `hochshild-serre-adic`, `purity-crystalline-regulator`, `unitary-special-compatibility`, `semistable-boundary`, `polarized-image-lifting`, `hecke-finite-support`, `eventual-images`, `eventual-rigidity`, `hilbert-precursor`, `hermitian-local-global`

1. **F01** (P3) Graph construction page is off by one

   **Location:** `packages/SelmerIwasawaCohomologyPartII/design/README.md:472` and `packages/SelmerIwasawaCohomologyPartII/design/plan.json:751`: “Construction 4.6.1(3) and §8.3, pp. 53, 139”.

   **Claim:** Part (3) of Construction 4.6.1 is located on page 53.

   **Witness:** ltxzz line 2499 marks page 54; part (3), defining the graph and its absolute cycle class, is at ltxzz line 2509 through line 2512. The construction begins earlier, but the cited part is on page 54.

   **Exact repair:** In these two target-4.2 locators, replace “pp. 53, 139” with “pp. 54, 139”. Keep the construction number, §8.3 and source-line locators. The mathematical statement needs no change.

Acceptance is conditional on the 20 declared supplier gaps listed below. There is one nonblocking locator correction, R01, and no P1 or P2 finding. This is acceptance of the design and its explicit contracts, not certification that those contracts have been implemented.

## Previous findings checked first

`packages/SelmerIwasawaCohomologyPartII/reports/REV-DESIGN-SelmerIwasawaCohomologyPartII~6.md` is absent. The four findings below are reconstructed from `packages/SelmerIwasawaCohomologyPartII/reports/FIX-DESIGN-SelmerIwasawaCohomologyPartII~7.md`. I checked the repaired text and witnesses independently. That repair report marks no finding “not actionable in this package.”

All design line references below are to `packages/SelmerIwasawaCohomologyPartII/design/README.md` unless another file is named.

| Repair-report finding | Repaired passage | Independent check | Status |
| --- | --- | --- | --- |
| F01: localization of intertwiners | Line 371: “the two special-maximal-level intertwiners on definite functions localized at mΠ are isomorphisms” | The proof at line 373 restricts the support comparison to Π-congruent pairs. The negative control at line 379 detects a target-only constituent. Compare ltxzz line 5221, line 5239 and line 5242. The plan agrees. | Repaired. |
| F02: odd-prime polynomial control | Line 557: “Over 𝔽₁₁, q=3, let P₀ have even roots {3,4} and P₁ odd roots {1,9,5}.” | Direct multiplication gives factor values 0,10,9,10,1 and tensor eigenvalues 3,5,4,4,3,9. Reciprocal pairs multiply to 1. The double root at 3 violates PI7, while 3 is an allowed odd prime; compare ltxzz-published line 1552. | Repaired. |
| F03: five empty hypothesis arrays | Line 744: “For F⁺≠ℚ, admissibility holds outside finitely many λ for each of two source families.” Line 792: “with all admissibility clauses L1–L7 retained.” | In `design/plan.json`, the hypothesis arrays at lines 660, 931, 1346, 1511 and 1626 are populated. They retain, respectively, H(n₁)/genericity; compatible covers, concentration and Cartesian/component conditions; actual L5-2 image data and m≥1; the two stated families; and all admissibility, witness and span premises. Checked against README §§3.7, 4.6, 7.1, 7.4 and 8.4 and their sources. | Repaired. |
| F04: Igusa supplier drift | Line 110: “§IG.7.2: IsCohomologicallyGeneric with every exceptional-set enlargement, standard indefinite space and compatible level” | `TauCetiRoadmap/IgusaVarietiesAndTorsionConcentration/README.md`, lines 2867–2884 at `55adf550b90cc3a1981b197fd48b3a35217665cc`, supplies this predicate for signature (N−1,1), and the criterion retains F⁺≠ℚ. IG.7.5 concerns a different signature. No IG.7.5/IG.7.7 citation remains in either design file. | Repaired. |

## Verified sound

### Extent and principles

I read the whole design README and plan: 8 layers, 40 targets, 46 named API entries, 68 target Checks and 8 convention Checks. The API entries were assessed with their parent target in the adversarial table below. All six definitions have named APIs and at least three Checks: §§1.5, 1.6, 2.1, 4.1, 5.1 and 6.1 have respectively 3, 5, 4, 4, 3 and 3 target Checks. Constructions also retain their stated APIs and boundary controls. All 60 `*Needs:*` lines, the 24 plan supplier records, and the 20 gap records were read.

The scope extends SelmerIwasawaCohomology through native unitary level raising, diagonal regulators and reciprocity to rank conclusions. Generic Selmer conditions, exponent algebra, scaled inverses, local duality, cohomology and Satake predicates remain imported. In particular, the actual-Frobenius span premise is not silently deduced from residual irreducibility. The span correction is retained in both rank conclusions and their specializations.

The design does not restrict its transfer endpoints to the supplier's good-prime range: the residual all-place and arbitrary-transferable-level obligation is explicitly owned by `gap:old-form-dimension`. Integral, ramified coefficient lattices, nonproper support comparisons, other places above a detecting rational prime, and places above ℓ are addressed rather than bypassed. H(N) and its removal are separate hypotheses/contracts. No computational algorithm, source transcription, route-only substitute, upward citation or cyclic target dependency was found. I found no suspicious instructions in the material read.

The README was compared with main's `TauCetiRoadmap/ComplexTori/README.md` and `TauCetiRoadmap/LocalGaloisGroups/README.md`. It has the required opening, ownership, conventions, supplier contracts, build explanation, eight layers with Examples and Dependencies, downstream section and references. The forbidden-syntax scan found no `set_option`, admitted data, LaTeX delimiters, bare `lemma` declaration or review/job narrative in the design. Mathematical uses of “packet” are representation-theoretic, not process instructions.

### Seeded source sample

All five manifest sources are recorded as certified and were legally available in the supplied cache. No author-marked unverified locator was found. I checked every one of the 15 requested targets against the source text, including theorem identifiers, printed pages, hypotheses and the direction of the conclusion. R01 is the only correction from this sample. The table distinguishes additional supplier premises from what the paper itself proves.

| Target | Text checked | Outcome |
| --- | --- | --- |
| 2.1 `unitaryLevelRaisingDatum` | ltxzz line 5136 through line 5188, pp. 106–107; congruence kernels at line 5195 | P1–P6, positive m, finite supports, level transfer and the disjointness conditions agree. Reduction modulo λ is not substituted for the λᵐ condition. |
| 2.3 `unitarySemistableStrata` | ltxzz Theorem 5.2.5, line 2653, p. 57; Theorem 5.3.4, line 2823, p. 61; Corollary 5.3.5, line 2901, p. 62; Theorem 5.4.4, line 2985, pp. 64–65; Theorem 5.5.3, line 3271, p. 69 | Native two-component geometry, incidence strata, projective fibres and the dual normal bundles match. Models and equivariant comparisons are explicitly contracted, not inferred from abstract semistability. |
| 3.1 `localizedUnitaryCohomology` | ltxzz Assumption 6.1.4 and Lemma 6.1.5, line 5204, p. 107; localized intertwiners at line 5221; Lemma 6.1.11, line 5255, pp. 108–109 | Derived reduction under cohomological genericity, localization of both intertwiners, and residual-irreducibility requirements for compact/ordinary comparison are retained. F01 is repaired. |
| 3.4 `evenFrobeniusExclusion` | ltxzz Theorem 6.3.5, line 5634 through line 5657, pp. 115–116 | Even-rank hypotheses remain in scope. Residual Frobenius eigenvalues exclude the specified 1 and p² contributions; the assertion is not promoted to an unsupported rational statement. |
| 4.2 `diagonalGraphCycle` | ltxzz Construction 4.6.1(3), line 2509, p. 54; §8.3, line 6764, p. 139 | Graph, codimension n, absolute degree 2n and twist n agree. Multiplicities and source-cover pushforward are retained. Page correction R01. |
| 4.5 `diagonalMultiplicityRealization` | ltxzz Hypothesis 3.2.10, line 1259, p. 28; line 6805 through line 6817, p. 140; conjugation at line 745, p. 17 | The irreducibility antecedent and c-conjugation in H(N) are retained. Projection to a nonzero multiplicity coordinate is a choice, not a canonical projection. |
| 5.1 `firstReciprocityDatum` | ltxzz Assumption 7.2.2, line 5833 through line 5898, pp. 120–121 | PI1–PI7 and nonzero quotients remain explicit. Tensor specialness is independent of factor specialness; the repaired 𝔽₁₁ Check verifies that distinction. |
| 5.3 `productCohomologyConcentration` | ltxzz Lemma 7.2.5, line 5931 through line 5954, pp. 121–122; proof at line 5985 through line 6007, pp. 122–123 | Freeness supports ordinary tensor Künneth. The three E₂ positions, twisted Frobenius exclusion, weak semisimplicity and support comparison match. No unproved disappearance of Tor is used. |
| 5.4 `diagonalCycleBoundaryComparison` | ltxzz Construction 5.11.7, Equation (5.28), line 5097 through line 5123, pp. 104–105; line 6024 through line 6033, pp. 123–124 | Kernel/cokernel potential modules and the invariant-source/coinvariant-target distinction agree. The cycle value uses the semistable-boundary contract with its support hypothesis. |
| 6.2 `secondGeometricReciprocity` | ltxzz Construction 4.6.1 and its diagrams, line 2488 through line 2521, pp. 53–54 | The specialization, pullback/pushforward legs, remaining Hecke operator, degree 2r₀ and twist r₀ have the stated direction. Graph multiplicities are not replaced by an unweighted image. |
| 6.4 `secondExplicitReciprocity` | ltxzz Theorem 7.3.4, line 6299 through line 6318, p. 129 | The exponent relation has direction ≤. The source's Assumptions 7.1.1 and 7.3.2 and H(n), H(n+1) remain. Additional first-law hypotheses are not imposed. |
| 7.4 `eventualAdmissibilityFamilies` | ltxzz Lemmas 8.1.3–8.1.5, line 6400 through line 6459, pp. 131–133; ltxzz-deformation Corollary 4.1.2, line 1761; Theorem 4.2.6, line 1880 | Both families retain F⁺≠ℚ. The elliptic family retains geometric nonisogeny and endomorphism ring ℤ; the other retains Steinberg, the specified odd unramified eigenvalue and a supercuspidal component of each factor. Eventual rigidity is a named supplier obligation. |
| 8.3 `rankTheoremsTotallyRealBase` | ltxzz Proposition 3.2.11, line 1273, p. 28; rank conclusions and Corollary 8.2.5, line 6737, p. 138 | H(N) removal is restricted to N≤3 or F⁺≠ℚ and remains contracted. Eventual admissibility does not discharge the uniform span premise or assert the arbitrary-family case. |
| 8.4 `rankTwoThreeRankTheorems` | ltxzz Proposition 3.2.11, line 1273, p. 28; Theorem 8.2.2, line 6568, p. 135; Theorem 8.3.2, line 6773, p. 139 | n=2 removes H(2), H(3), including over F⁺=ℚ. It does not remove L1–L7, the geometric witness or the appropriate uniform span premise. |
| 8.5 `hilbertPrecursorCompatibility` | liu-tian §4.1 and Assumption 4.1, line 1384 through line 1415, p. 30; Definition 4.5, line 1477, p. 32; Theorem 4.7, line 1496, p. 32 | Odd degree, quaternionic/level domain, LIInd, residual dimension equality and prime conditions remain. The comparison preserves the congruence quotient and surjectivity conclusion rather than replacing them with localization. |

Additional checks included the published intersection definition of reflexive closure at ltxzz-published line 1533 through line 1558, the integral weight-complex formulas at ltxzz line 4023 through line 4176, the product resolution at ltxzz line 4710 through line 4787, and the one-way blowup lifting implication at stacks-blowup line 3750 through line 3765. The manifest distinguishes the preprint and published versions. No missing-reference request was needed, and no source entry was rewritten.

### Adversarial mathematics pass

“Retain” means no design change is requested. Entries cover the named target, its API and its proof dependencies; they are mathematical checks, not Lean elaboration claims. Impossible degenerate inputs are recorded as excluded rather than used as examples inside a false domain.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Coefficient, rank and finiteness conventions | Ramified Eλ; zero ring; equal characteristic; infinite exceptional set; n=0,1,2,3 | Finite extensions of ℚℓ allow ramified coefficients but exclude zero/equal-characteristic rings. Sets are finite and n≥2. For n=2, tensor rank is 6, twist 2, degree 3 and weight −1. | Retain. |
| Frobenius, shifts, polarization and cochains | Inert p=3; γ=(I,−1)c; sign action of C₂ | Arithmetic/geometric actions on Eλ(1) are 9 and 1/9; the square has GL component −I; d0(1) at the nontrivial element is −2. A codimension-n cycle has degree 2n and its regulator uses degree 2n−1. | Retain. |
| Reciprocal polynomial, Hecke and trace conventions | Degrees 1 and 2; q=3; a free two-point orbit over 𝔽₂; q=1 | Reflection has sign − in degree 1 and + in degree 2. Rank-two I°=16; the recorded rank-three values are 9/2 and 105/2. Orbit trace of (1,1) is 1 while total trace is 0. No division by the group order; q=1 is outside residue cardinalities. | Retain. |
| 1.5 `specialInertPlace` | ℚ(i), p=2,3,5; local degree two; CM-preserving isomorphism | 3 gives the unramified quadratic local field with residue size 9. The ramified/even and split cases fail. Inertness alone does not force local degree one. | Retain. |
| 1.6 `rankinSelbergAdmissible` | n=2; ℓ=2,3,11; ξ=±1; identity scalar; change of basis | ℓ≤8 fails L1; ℓ=11 alone establishes no other clause. Identity scalar fails the nonidentity-scalar branch. ξ=±1 fails L5-2. Conjugation and lattice homothety preserve the data. | Retain repaired supplier. |
| 2.1 `unitaryLevelRaisingDatum` | m=0,1,2; empty raising set; incompatible level | Positive m is essential. A residual root need not lift modulo λ². An empty raising set is permitted; it does not imply P6 after arbitrary level change. Quotient, localization and annihilator remain distinct. | Retain. |
| 2.2 `unitaryBasicCorrespondence` | N=2,3; empty indexing base | Projective-fibre dimensions 0,1 and the indicated codimensions agree. Empty base gives an empty correspondence. Uniformization retains the native isogeny data. | Retain. |
| 2.3 `unitarySemistableStrata` | xy=p; N=2,3; p=3; generic fibre | The two components have multiplicity one. A quartic in ℙ² gives normal degree 16 and dual degree −16. The link disappears after inverting p. | Retain. |
| 2.4 `unitaryLinkAndIntersection` | Minimal projective fibre; ℓ dividing p+1; two-point orbit | The minimal fibre is ℙ⁰ and index p+1. A restriction isomorphism needs p+1 invertible; orbit trace does not need the group order invertible. | Retain. |
| 2.5 `unitaryIncidenceWeightComplex` | Two branches; N=2; p=3; Frobenius 4 on ℤ₃ | Restriction signs are 1,−1; the odd diagonal is −16 and even corner 4. The exceptional N=2 row/column remains. Invariants are 0 but coinvariants are 𝔽₃, so they cannot be identified. | Retain. |
| 2.6 `unitaryProductResolution` | n=2; empty centre; point of exceptional ℙ¹ | Product dimension is 3 and the exceptional degree-two class remains. Empty-centre blowup is identity. A map from an exceptional point can lift without an invertible inverse-image ideal: only the sufficient Cartier lifting criterion is asserted. | Retain. |
| 3.1 `localizedUnitaryCohomology` | Zero localization; constituent only in the target | Zero localization is harmless for the conditional comparison. A target-only constituent obstructs an unlocalized intertwiner isomorphism. The repaired assertion restricts precisely to Π-congruent support. | Retain repaired localization. |
| 3.2 `oddTateCycleComparison` | Odd rank 3; absence of extra eigenvalue conditions | Genericity/concentration hypotheses and the additional hypotheses for the stronger Tate comparison remain distinct. | Retain. |
| 3.3 `evenIntegralFreeness` | Zero definite quotient; transfer outside S_FL bounds | Nonzero quotients are required where used. Transfer beyond the supplied restricted theorem consumes the all-place gap, not an unsupported enlargement of that theorem. | Retain. |
| 3.4 `evenFrobeniusExclusion` | a=p⁻¹; p²=1 in residue coefficients | The distinguished product produces 1 and belongs to the excluded contribution. p²=1 is ruled out by the standing specialness conditions. Residual spectra remain residual. | Retain. |
| 3.5 `evenSingularComparison` | m=1,2; quotient versus annihilator | Coefficient depth and Hecke operation are kept in the carrier. A congruence quotient is not replaced with a torsion annihilator submodule. | Retain. |
| 3.6 `evenCongruenceGaloisRealization` | Multiplicity 0 or 2 | Nonzero realization excludes multiplicity 0. Multiplicity 2 gives a multiplicity module, not a distinguished canonical coordinate. | Retain. |
| 3.7 `oddSpecialLevelChange` | Empty raising set; one raising place | Empty change is identity; the one-place argument retains H(n₁), cohomological genericity and the intertwining unit condition. | Retain repaired plan hypotheses. |
| 4.1 `diagonalUnitaryDatum` | n=2; incompatible levels; source-only cover | Dimension/codimension agree. Incompatible levels give no graph morphism. Refining only the source does not make an arbitrary square Cartesian. | Retain. |
| 4.2 `diagonalGraphCycle` | Zero cycle; source cover of degree 2; graph orientation | Pushforward counts degree 2 and preserves positive graph multiplicity; absolute class has twist n. No target-cover degree is inserted. | Correct page, R01. |
| 4.3 `projectedDiagonalAbelJacobi` | Zero cycle; n=2; nonzero point class on ℙ¹ without concentration | Zero maps to zero; n=2 uses H³ with twist 2. The point control shows why homological triviality cannot be inferred without the concentration hypothesis. | Retain. |
| 4.4 `rankinSelbergPurityAndSelmer` | Ramified coefficient field; ℓ ramified in F; n=2 | Coefficient ramification is allowed; the latter ramification violates L1 where admissibility is used. Tensor weight is −1. The rational cohomology realization does not silently assume H(N). | Retain. |
| 4.5 `diagonalMultiplicityRealization` | Multiplicity 0 or 2; reducible representation | A nonzero AJ value requires a nonzero coordinate. H(N)'s irreducibility antecedent remains. The c-conjugate constituent is not replaced by an un-conjugated one. | Retain. |
| 4.6 `diagonalRegulatorNaturality` | Degree-two trace; full fibre product versus chosen graph; coefficient extension | Trace multiplies by 2 on pullback classes. Pullback of a graph is the full fibre product unless the stated Cartesian/component premise applies. Coefficient maps retain the actual realization spaces. | Retain repaired plan hypotheses. |
| 5.1 `firstReciprocityDatum` | q=3 over 𝔽₁₁; zero quotient; sum versus average | Factor evaluations are 0,10,9,10,1 but tensor root 3 has multiplicity 2. PI7 is independent. Zero quotient violates PI6. Counting two points gives 2, not an average of 1. | Retain repaired Check. |
| 5.2 `firstGeometricReciprocity` | Degree-two source fibre; p=3 | Pushforward retains fibre multiplicity. The two (p+1) factors give 16, with the stated correspondence directions. | Retain. |
| 5.3 `productCohomologyConcentration` | Tensor eigenvalue collision; three surviving positions; torsion coefficients | PI7 prevents the unwanted eigenvalue 1 after twisting. Freeness is used before ordinary tensor Künneth; no unsupported Tor cancellation. | Retain. |
| 5.4 `diagonalCycleBoundaryComparison` | O mapped by π²; nontrivial unipotent 2×2 action over 𝔽₃ | Reduction of a kernel need not be exact. For the unipotent action, the natural invariant-to-coinvariant map is zero, so the two modules cannot simply be identified. Potential kernels/cokernels and support assumptions remain. | Retain. |
| 5.5 `firstExplicitReciprocity` | p=3 and integral period values a₀,a₁ | The factor is 4a₀a₁ with the source normalization. No averaging changes its valuation. | Retain. |
| 5.6 `firstReciprocityExponentEquality` | Unit factor; π factor; zero element | A unit preserves exponent; multiplying a length-two element by π reduces exponent to 1. Equality needs the declared unit, and exp(0)=0. | Retain. |
| 6.1 `secondReciprocityDatum` | Two source points with one image; m=0; omitted first-law clauses | Image multiplicity is 2, not 1. Positive m is retained. PII does not acquire unrelated PI clauses. | Retain. |
| 6.2 `secondGeometricReciprocity` | One pullback/pushforward correspondence; n=2 | Degree 2r₀, twist r₀ and the remaining Hecke operator agree; exchanging the legs would not have the same domain. | Retain. |
| 6.3 `oddSpecialFiberCoinvariants` | Odd rank 3; zero localization | Special-fibre concentration is distinguished from nearby cohomology. Coinvariants are taken on the specified carrier; zero localization is consistent. | Retain. |
| 6.4 `secondExplicitReciprocity` | A₂ onto A₁; zero right-hand value | Quotient can strictly reduce exponent, so ≤ is the correct general direction. A zero bound forces the left value to have exponent 0. | Retain. |
| 7.1 `admissibleImageLift` | m=1,2; ξ=±1; artificial tuple outside the image | Residual existence does not replace an actual congruence-image lift. The witness belongs to the specified image over F⁺rflx and ξ²≠1. | Retain repaired plan hypotheses. |
| 7.2 `auxiliaryPlaceDetection` | D=[[π,1],[0,π]], C=[[π,−1],[0,π]]; zero loss; c≥k | DC=π²I, although C is not a basis matrix. The primitive vector (−1,π) kills the first row and gives −π² in the second, of exponent 3 in A₅. At zero loss one has a basis; for c≥k the lower bound may be zero. Actual Frobenius span remains a premise. | Retain. |
| 7.3 `rankinSelbergLevelRaisingSystem` | Perfect versus π-scaled pairing on A₅; simple Satake pair over 𝔽₁₁; repeated pair; nondetecting places and w above ℓ | Pairing π with π² gives exponent 2, versus 1 after scaling by π. The simple pair yields the required Frobenius pair {5,1}; repetition fails simplicity. Other-place specialization and both torsion crystalline inputs remain explicit. Uniform constants retain lattice and inverse-different losses. | Retain. |
| 7.4 `eventualAdmissibilityFamilies` | CM or geometrically isogenous elliptic curves; missing supercuspidal factor; F⁺=ℚ | These fail the respective family premises. “Outside finitely many” is not “every λ” and supplies no uniform-span conclusion. | Retain repaired domain and supplier. |
| 8.1 `rankinSelbergSelmerRankZeroOfPeriod` | Zero Selmer group; zero period; m tending to infinity | A zero period gives no finite valuation witness. The contradiction uses m larger than the fixed losses; their independence of m and the span premise are stated. | Retain. |
| 8.2 `rankinSelbergSelmerRankOne` | AJ=0; multiplicity 2; positive detector loss | Nonzero AJ is needed for the lower bound. One may choose a nonzero coordinate; the upper bound retains primitive-kernel arguments and total loss 2c rather than an unavailable basis. | Retain. |
| 8.3 `rankTheoremsTotallyRealBase` | n=2 over ℚ; larger n over a nontrivial totally real base | Exactly the small-rank or F⁺≠ℚ alternatives remove H(N). Neither removes admissibility, the geometric witness or uniform span. | Retain. |
| 8.4 `rankTwoThreeRankTheorems` | n=2, ℓ=2,3,11; F⁺=ℚ | H(2),H(3) removal is valid, but ℓ=2,3 still fail L1. ℓ=11 alone does not imply the other six clauses. | Retain repaired plan hypotheses. |
| 8.5 `hilbertPrecursorCompatibility` | g=1,3; even g; absent LIInd or residual dimension equality | Twist (g+1)/2 is integral in the stated odd-degree domain. The missing hypotheses are not inferred from parity. The Hilbert result is a supplier comparison, not a replacement for the unitary singular theorem. | Retain. |

### Duplication and supplier-domain audit

The library audit used object searches followed by reads at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Thirteen pinned files were successfully read: the ten files supplying the design's polynomial, PID, cohomology and blowup anchors, plus three related-object files below. These searches are evidence for the interfaces inspected, not a claim that name search proves absence throughout either library.

| Object | Existing owner and witness | Design boundary checked |
| --- | --- | --- |
| Polynomial evaluation, derivative and reflection | `Mathlib/Algebra/Polynomial/Eval/Defs.lean`, `Polynomial.eval`; `Mathlib/Algebra/Polynomial/Derivative.lean`, `Polynomial.derivative`; `Mathlib/Algebra/Polynomial/Reverse.lean`, `Polynomial.reflect` | Imported directly. No replacement polynomial algebra target. |
| Finite PID modules | `Mathlib/Algebra/Module/PID.lean`, `Module.torsion_by_prime_power_decomposition`; `Mathlib/LinearAlgebra/FreeModule/PID.lean`, `Module.free_iff_isTorsionFree` | Finite-generation, PID and domain contexts are retained. Error-tolerant exponent algebra belongs to EulerSystemsAndKolyvaginSystems §§1.2–1.3, 4.4. |
| Continuous cochains and H¹ | `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean` and `Functoriality.lean`; `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean`, `d0`, `H1`, `H1pi` | Direction of the compatible-pair map is correct. Discrete exactness is not promoted to adic exactness. No new general cochain carrier is planned. |
| Rees algebra and blowup charts | `Mathlib/RingTheory/ReesAlgebra.lean`, `reesAlgebra`; `TauCeti/AlgebraicGeometry/Blowup/AffineCharts.lean`, `affineBlowupι`, `iSup_opensRange_affineBlowupι`; StableReduction Layer 4 | §2.6 adds the native product resolution and cycle comparison; generic charts and universal properties remain imported. |
| Hecke rings | `Mathlib/NumberTheory/HeckeRing/Defs.lean`, `IsHeckeTriple`, `HeckeCosetModule`, `HeckeRing`; SmoothRepresentationsOfLocalGroups §SR.4.4 | Abstract double-coset objects do not supply the native congruence quotient, unitary intertwining theorem or Frobenius separation. The latter are explicitly assigned. |
| Selmer and Abel–Jacobi objects | `Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean`, `IsDedekindDomain.selmerGroup`; `TauCeti/AlgebraicGeometry/WeilDivisor/AbelJacobi/Quotient.lean`, `weightedAbelJacobiQuotientClass` | K(S,n) and formal Pic⁰ divisor sums are different from the Bloch–Kato finite condition and integral arithmetic étale regulator. Existing SelmerIwasawaCohomology §§4.8–4.11, 4.24–4.25 remain imported. |
| Detection and span | `TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md`, §1.15, lines 1297–1323; §4.4, lines 2756–2776, at `4fb7ae990e3d133c8551d329a68c4a12fe2cff48` | §7.2 adds actual CM/unitary Frobenius and Satake constraints. It imports scaled inverse and realized-span algebra and does not re-prove a false basis conclusion at positive loss. |
| Concentration and multiplicity | AutomorphicGaloisRepresentationsPartII AG2.1b, AG2.5–AG2.7; IgusaVarietiesAndTorsionConcentration IG.7.2 | Native rational concentration and H(N) removal are gaps. Compact ST/END hypotheses and the distinction between genericity and one fixed module's vanishing remain visible. |
| Transferable levels | `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md`, §§13.7–13.9, lines 4869–4925, at `f8f8c2b` | The two transfer-witness clauses are distinguished from the theorem's S_FL and small-level restrictions. The design requests the missing general domain instead of asserting it is supplied. |
| Rigidity and local conditions | LocalGaloisDeformationRings §§1.6, 2.3, 2.12, 2.20; GlobalGaloisDeformations §5.2; ArithmeticGaloisDuality R02.4.2–R02.4.3, D7.4, D7.7 | Fixed multipliers, simple Frobenius pairs, unramified Fontaine–Laffaille domain and rank-two scope are retained. Higher-rank restriction irreducibility is written literally. |
| Models, descent and integral weights | PELModuli M0.26, M4.7–M4.9; ShimuraVarieties §§5.1, 6.7; SchemeAndStackFoundations §2.15; EtaleCohomologyFoundations F.4.4–F.4.6; LefschetzPencilsAndVanishingCycles §§7a.7–7a.9 | Published reflexive closure, orbit trace and continuous action domains agree. Ordinary/compact nonproper comparison, adic Hochschild–Serre and residual integral filtration remain explicit gaps. |

I also checked the ownership introductions of the five specified open new-roadmap heads: CohomologyComparisonsPartII at `dd8d7e6fda7516b9ab6806d5d75f5202332851c7`, ColemanIntegrationPartII at `bd972d91ed7d5d8bd3dd2e7ee84b35853db32ba4`, QWittVectors at `4605fbb0a2d9279b561f9467ab5cce09d7f2469e`, ArithmeticDynamics at `85e78c07dcc361ead6505c970a1181deee483819`, and ErdosProgressionPowers at `72b615703f7fc5d175e519ddbb6e589d3d744c6c`. Their comparison, integration, Witt, dynamics and progression-power objects do not duplicate these native unitary targets. No new dependency on those roadmaps was introduced. Main-roadmap checks used content main `e033b6cbac578e7cd2bbebdce83e9fa529e065a1`.

### Gaps and direction of supply

All 20 gap slugs occur in both the plan and README, with matching needs sentences and named suppliers. None has supplier `none`. Reading each sentence together with its detailed contract and target hypotheses makes the requested extension specific. I found no gap asking this supplier to replace an already supplied generic object. The gaps below remain conditions of acceptance, not red-team findings.

| Gap slug | Supplier | Residual obligation/domain checked |
| --- | --- | --- |
| native-shimura | ShimuraVarieties | Native special-level and hyperspecial models, equivariant specialization, nonproper supports, and other places above p. |
| unitary-incidence | ReductiveGroupsPartII | Appendix A hermitian incidence geometry and its cohomology; no nonexistent existing section is asserted. |
| nearby-weight | LefschetzPencilsAndVanishingCycles | Torsion/adic two-component filtration with the explicit stratum parity vanishings. |
| automorphic-multiplicity | AutomorphicGaloisRepresentationsPartII | Exact H(N), irreducibility antecedent, conjugation and the stated removal domains. |
| diagonal-concentration | AutomorphicGaloisRepresentationsPartII | Native rational middle-degree concentration, including the rational cuspidal boundary case, independently of H(N). |
| boundary-cohomology | ShimuraCompactifications | Native ordinary/compact comparison after localization with its residual hypotheses. |
| rigid-r-equals-t | GlobalGaloisDeformations | Polarized rigid R=T, freeness and mixed-to-congruence maps in the stated coefficient domain. |
| old-form-dimension | EndoscopicTransferAndUnitaryTraceComparison | Transfer and dimension identity beyond the supplied residue-characteristic, S_FL and small-level restrictions. |
| local-unitary-representations | EndoscopicTransferAndUnitaryTraceComparison | Primitive link constituents and Frobenius comparison beyond the supplied local interfaces. |
| chow-abel-jacobi | MotivesAndAlgebraicCycles | Integral arithmetic étale regulator on homologically trivial Chow classes and functoriality. |
| hochshild-serre-adic | SchemeAndStackFoundations | Adic spectral sequence and single-row edge, with continuous actions from EtaleCohomologyFoundations. |
| purity-crystalline-regulator | ArithmeticGaloisDuality | All-place finite regulator, integral lattice realization and torsion crystalline good-reduction membership. |
| unitary-special-compatibility | ShimuraVarieties | Addition-of-line/uniformization diagrams including isogeny scaling. |
| semistable-boundary | LefschetzPencilsAndVanishingCycles | Potential-map and cycle-boundary comparison with the nonproper support condition. |
| polarized-image-lifting | ArithmeticGaloisRepresentations | Actual congruence-image lifts with polarization and cyclotomic compatibility. |
| hecke-finite-support | IntegralHeckeAndGaloisDeterminants | Finite-support/Frobenius separation for the specified congruence quotient comparisons. |
| eventual-images | ArithmeticGaloisRepresentations | Image and tensor-irreducibility inputs for the two stated families. |
| eventual-rigidity | GlobalGaloisDeformations | Eventual rigidity and cyclotomic residual irreducibility on those families. |
| hilbert-precursor | HilbertModularVarietiesAndShimuraCurves | Liu–Tian Theorem 4.7 on Assumption 4.1 and Definition 4.5's domain. |
| hermitian-local-global | AdelicAlgebraicGroups | Global hermitian existence/classification with compatible prescribed local invariants. |

Every internal target prerequisite resolves, with no forward target edge or cycle. Named external suppliers are on main or earlier in the supplied merge order. No ownership move is required. New-obligation-only contracts were not mistaken for supplied declarations.

The literal prescribed gate command could not open `packages/SelmerIwasawaCohomologyPartII/README.md`: that package-stage file is absent. It exited 1 with FileNotFoundError before checking dependencies. I reran the same gate with its candidate set to the actual reviewed file, `packages/SelmerIwasawaCohomologyPartII/design/README.md`. It exited 0 and printed:

```text
candidate: SelmerIwasawaCohomologyPartII is not in the merge order yet; checked as if placed after IgusaVarietiesAndTorsionConcentration (the intake inserts it when its design is accepted)
depcheck: 6 roadmaps, 58 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The tool reports a six-roadmap inventory; the separate supplier and target audit above is therefore material. Neither tooling nor merge order was changed.

## Not verifiable

- The round-6 review file is absent. The four repair-report findings were all rechecked, but I cannot certify that the absent review contained no additional finding.
- Lean elaboration: **not available**. There is no `Suggested.lean` in this design package, and the brief supplies no available elaboration command. No Lean process was started. Consequently no claim is made about elaborated binder retention, proved Lean mirrors, compiler warnings or a successful build. Those package-stage checks remain necessary; the report does not count a nonexistent build as passing with only `sorry` warnings.
- A GitHub object search returned `TauCeti/AlgebraicGeometry/EllipticCurve/GaloisCohomology/Selmer/Basic.lean` on another revision, but fetching it at the Tau Ceti pin returned 404. It was excluded from the pinned evidence and is not treated as an available supplier.
- The declared supplier extensions are not implementation proofs. Acceptance depends on their exact contracts, including the multiplicity-removal result whose source invokes further input. No legal source text needed for this review was unreadable, waived or missing, and no additional source request is outstanding.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "be7b795ed97d29e9bd467e0e696a77abb4c3a3fd", "job": "REV-DESIGN-SelmerIwasawaCohomologyPartII~7", "model": "gpt-6-astra", "worker": "chris-3"} -->
