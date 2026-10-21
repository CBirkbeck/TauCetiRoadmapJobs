<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/127#issuecomment-6315088524 -->
Red team round 1 pass a (codex) of a6cca4e

Verdict: needs_changes

1. **F01** (P1) Three essential suppliers are outside the permitted supply graph

   Location: packages/ArithmeticKTheory/README.md:209–223, “BorelRegulators R.1 supplies” and “MotivicEtaleKTheory M.1 supplies”.

   Claim: BorelRegulators R.1/R.3, MotivicEtaleKTheory M.1/M.7 and RefinedTraceMethods RT.4 supply essential building, rank, descent and real comparison theorems.

   Witness: None of these three names occurs in merge-order/ORDER.txt or has a roadmap folder in the supplied main/Completed trees or five permitted sibling heads. No gap declaration exists.

   Exact repair text: “This roadmap owns the required projective-lattice Steinberg finiteness, rational rank theorem, twist/descent interfaces and real KO comparison unless an eligible earlier supplier is identified by an existing section and target. State these prerequisites before their first use, with their full hypotheses and proof dependencies.” Replace all unsupported supplier assertions accordingly; do not point upward to the excluded owners.

2. **F02** (P1) Additional Iwasawa exports are requests without declared gaps

   Location: packages/ArithmeticKTheory/README.md:2421–2428, “The exact additional IntegralIwasawaTheory exports requested here”.

   Claim: Three unprovided exports may be consumed as supplier proofs by §§7.2–7.5.

   Witness: README:245–248 explicitly admits the exports are absent; no readable design/plan.json or matching gap entries exists. Describing proofs here does not create a supplier contract.

   Exact repair text: “What IntegralIwasawaTheory must provide (gap:cyclotomic-kummer-congruence): for odd prime p and even n,n′≥2, with n≡n′ modulo p−1 and p−1∤n, B_n/n and B_n′/n′ are p-integral and congruent modulo p.” Declare corresponding separate, equally precise gaps for the finite Herbrand–Ribet equivalence and the displayed character-reflection inequalities, with the direct Artin action, in the supplier subsection and matching plan entries; consume these contracts instead of replanning the supplier proofs here.

3. **F03** (P1) Prime enlargement Check holds parameters fixed that arithmetic changes

   Location: packages/ArithmeticKTheory/README.md:1417, “Adding one allowed finite prime increases every even branch by one”.

   Claim: Enlarging the inverted prime set adds one to every positive even two-rank.

   Witness: README:1322–1324 gives F=ℚ(√7): adding 7 changes s from 1 to 2 and j from 1 to 0, with t=0. The degree-four rank stays 1.

   Exact repair text: “Holding r,t,j fixed, replacing the numerical parameter s by s+1 increases every even branch by one when s≥1. Arithmetic enlargement can change t and j: for ℚ(√7), adjoining the prime above 7 leaves the degree-four two-rank unchanged.”

4. **F04** (P3) Forbidden declaration catalogue and missing declaration docstrings

   Location: packages/ArithmeticKTheory/Suggested.lean:201–222, “The README additionally specifies”.

   Claim: The final comment lists numerous unrepresented declarations; several kept declarations have no mathematical docstring.

   Witness: Suggested.lean:65,78,82,134 lack docstrings, as do all twelve examples. Lines 201–222 are a catalogue of names, expressly excluded by the signature-file contract.

   Exact repair text: Delete lines 201–223. Add a mathematical docstring immediately before each undocumented theorem and example; preserve the introductory statement that README.md is definitive and the signatures are not exhaustive.

5. **F05** (P1) Wreath-product valuation identity lacks maximality

   Location: packages/ArithmeticKTheory/README.md:1138–1148, “μ_m(k) of exact order m=ℓ^a”.

   Claim: This hypothesis gives v_ℓ(|GL_r(k)|)=ra+v_ℓ(r!), hence an index prime to ℓ.

   Witness: Take k=𝔽₁₉, ℓ=3, a=1, r=1. Its μ₃ has order 3, but |GL₁(k)|=18 has 3-adic valuation 2, and the subgroup index is 6.

   Exact repair text: “Take k=𝔽_q and m=ℓ^a=|k×{ℓ}|, so a=v_ℓ(q−1), with ℓ odd or ℓ=2 and a≥2.” Add the q=19,m=3 failure as a negative Check distinguishing a root subgroup from the full primary root group.

6. **F06** (P1) The full integer order formulas have no owner

   Location: packages/ArithmeticKTheory/README.md:2634–2637, “the special-value order formulas of K-book VI.10.1”.

   Claim: The conditional integral table can consume full orders while special-value proofs are outside scope and SpecialValuesBirchTate is downstream.

   Witness: kbook lines 32194–32210 derive the order formula from VI.8.8 and VI.9.12. README:54 excludes special-value proofs; README:3466–3468 makes their roadmap a consumer. No earlier target supplies the formula.

   Exact repair text: “Before §7.5, prove the integer special-value order theorem: for a≥0, |K_(8a+2)(ℤ)|=2c_(2a+1) and |K_(8a+6)(ℤ)|=c_(2a+2), where c_j=|num(B_(2j)/(4j))|. Its special-value comparison prerequisites are owned here with named targets and proof plans.” Adjust scope accordingly and remove downstream ownership of this consumed prerequisite; alternatively identify an eligible earlier owner and an exact declared contract. Retain the corrected index c_(2a+2), rather than the source's printed c_(2a+1).

7. **F07** (P1) Chebotarev is attributed to a roadmap that excludes it

   Location: packages/ArithmeticKTheory/README.md:1944–1945, “GlobalNumberFields' Chebotarev”.

   Claim: GlobalNumberFields supplies the simultaneous Frobenius prescription.

   Witness: TauCetiRoadmap/GlobalNumberFields/README.md:55 excludes Chebotarev. TauCetiRoadmap/Chebotarev/README.md:410–423 supplies density and infinitude of every Frobenius class, including finite exclusions.

   Exact repair text: “This specializes ClassFieldTheory's reciprocity and Chebotarev, Layer 10 (`hasDirichletDensity_frobeniusPrimeSet` and its infinitude/finite-exclusion corollaries), using arithmetic Frobenius on the compatible fiber product.” Add that exact supplier to the relevant Needs line.

8. **F08** (P2) General Bott descent is restricted to two application rings

   Location: packages/ArithmeticKTheory/README.md:2207–2208, “X either Spec ℤ[1/p] or Spec ℤ[ζ_q,1/p]”.

   Claim: The roadmap develops the even/odd edge and dualization splitting only for those bases.

   Witness: fgv lines 516–523 formulate the descent spectral sequence for schemes over ℤ[1/p]; lines 598–606 use only cohomological dimension two and odd coefficients for collapse and splitting.

   Exact repair text: “For every number field F, finite S containing all primes above the odd prime p, q=p^r with r≥1, and X=Spec O_(F,S), construct `bottEvenExact`, `bottEvenEdgeEquiv` and `bottOddEdgeEquiv` in every integer degree, with the stated dualization signs and naturality. The two displayed rational and cyclotomic bases are specializations.” Keep §6.16's stronger degree-zero ordinary comparison separately scoped and proved.

9. **F09** (P2) Golden-field geometry replaces the general congruence-lattice theory

   Location: packages/ArithmeticKTheory/README.md:2942–2945, “For s=2 or 3 … define GoldenCongruenceLattice”.

   Claim: The only constructed congruence lattices and small-fraction sections are the ones needed for ℚ(√5).

   Witness: groenewegen lines 226–232,333–354,470–479 develop the number-field congruence-lattice and fraction comparison used here; README:2958 explicitly specializes them to degree two.

   Exact repair text: “First construct the congruence lattice over every number field and every finite tuple length s≥2, with covolume, Minkowski small-tuple bounds, coordinate nonvanishing and old-unit criteria under explicit discriminant/norm bounds. Construct the corresponding fraction comparison and residue section in that generality. Define the golden-field objects by specialization and derive the numerical cutoff 33.” Reuse existing lattice and number-field carriers, and locate each added general target in the cited source.

10. **F10** (P2) The easy certificate milestone is missing from Suggested.lean

   Location: packages/ArithmeticKTheory/README.md:2116–2124 and packages/ArithmeticKTheory/Suggested.lean:206, “OrderCertificate”.

   Claim: The certificate carrier and its soundness are excluded with the heavy arithmetic carriers.

   Witness: At Mathlib 6b7abb3, Mathlib/Algebra/Module/Presentation/Basic.lean:53,68,125,266–282 already provides Relations, Quotient, Solution, surjectivity and IsPresentation. Finite-group carriers and cardinalities also exist.

   Exact repair text: Add a real-bodied `OrderCertificate A` bundling the stated finite presentation, spanning solution, finite quotient and surjection with equal finite orders. Add the headline `OrderCertificate.isPresentation : cert.solution.IsPresentation := by sorry`, with all required group/module/finite binders explicit. Give at most two proved examples contrasting a matching certificate and the unmatched ℤ/4↠ℤ/2 upper bound. Do not encode higher K-groups to state this generic milestone.

11. **F11** (P3) Statable definition Checks have no proved Lean mirrors

   Location: packages/ArithmeticKTheory/README.md:295–297,1479–1484,2196,2323–2326.

   Claim: The README requires discriminating Checks on the seven kept light definitions, but the file tests only a subset.

   Witness: Suggested.lean has no example for empty/full S denominators, div(ℚ⊕ℤ/4), div(ℚ/ℤ), the j=1 Bott slot, or bernoulliTop at 5 and 6. These use existing carriers.

   Exact repair text: Extend the existing example conjunctions, preserving at most two examples per definition, to prove these Checks: denominators at empty/full S; divisibility for ℚ×ZMod 4 and ℚ⧸ℤ using the existing quotient carrier; the j=1 positive slot; and the Bernoulli values 5/66 and 691/2730 with the divided value B₁₀/5=1/66. Keep the examples tied to the roadmap's definitions. If a proof requires unavailable theory, name its boundary theorem in both files instead of leaving an unmirrored statable Check.

12. **F12** (P2) A mathematical certificate cannot certify proof provenance

   Location: packages/ArithmeticKTheory/README.md:2730–2733, “CertifiedExample.no_circularity”.

   Claim: The listed numerical equalities, presentation and finite quotient imply that their proofs do not depend on Birch–Tate.

   Witness: The same equality field can be proved using Birch–Tate or independently without changing its type or the mathematical record. The listed fields contain no proof-dependency representation.

   Exact repair text: “For a Birch–Tate test, separately audit that the proofs of both bounds use only the named independent generation and sign targets. This is a dependency requirement on the development, not a theorem field of `CertifiedExample`.” Delete `CertifiedExample.no_circularity` and the proof-provenance tag from the mathematical interface.

13. **F13** (P3) The tame-boundary locator points to norm-residue theory

   Location: packages/ArithmeticKTheory/README.md:426, “III.6.2.3–6.2.4, pp. 232–233”.

   Claim: These locators support the tame-boundary convention and its inverse comparison.

   Witness: kbook lines 13406–13436 contain norm-residue symbols and the local Moore theorem. The tame-symbol formula starts at line 13461, III.6.3, printed p. 234.

   Exact repair text: Replace the locator with “K-book, III.6.3, p. 234, and V.6.6–6.6.1, p. 409”; explain that β agrees with III.6.3 and that Tate's t is its inverse, using the explicit uniformizer/unit test.

14. **F14** (P3) No source manifest accompanies the cited works

   Location: packages/ArithmeticKTheory/README.md:3480–3606, References; packages/ArithmeticKTheory/sources.toml is absent.

   Claim: Twenty-two cited works and their version-sensitive locators have no package source records.

   Witness: The PR changes README.md, Suggested.lean, metadata.toml and review.json only. The package contains no sources.toml recording the required legal origin, version, locator and certification status.

   Exact repair text: Add `sources.toml` with schema `tauceti-roadmap-sources/v1` and one entry per cited work, recording authors, title, year, exact version/locator, cited_for and the source-service metadata. Record unread paywalled material as uncertified; use no local paths. Preserve Groenewegen's actual version when choosing pagination.

15. **F15** (P3) The claimed pin limitation is contradicted by the pinned library

   Location: packages/ArithmeticKTheory/README.md:174–175, “not available as imports at the older pins used by Suggested.lean”.

   Claim: The specified Sqrt5 arithmetic modules are unavailable at the content manifest's Tau Ceti pin.

   Witness: Tau Ceti a91d3aa contains TauCeti/NumberTheory/NumberField/WorkedExamples/Sqrt5/Invariants.lean:76–163, including index_eq_one, classNumber_eq_one and the stated dyadic invariants, with the polynomial/adjoin hypotheses.

   Exact repair text: “These inputs are available at the pinned Tau Ceti commit and are consumed after transporting the chosen field model.” Cite the pinned modules; import an individual module only when a kept Lean declaration actually uses it.

16. **F16** (P2) Closed points are not the height-one indexing set at full S

   Location: packages/ArithmeticKTheory/README.md:390–402, “identify its closed points with finite primes of F outside S”.

   Claim: This identification is used also for expressly permitted arbitrary S.

   Witness: At S=all finite primes, O=F. Spec F has one closed point, (0), while the family v∉S is empty. The localization support category is nevertheless zero.

   Exact repair text: “Identify the nonzero prime ideals (height-one points) of O with the finite primes of F outside S, using `integerHeightOneSpectrumEquiv`. When O is not a field these are its closed points; when O=F the height-one family is empty and localization is the identity.”

17. **F17** (P1) The hermitian table supplier is not named

   Location: packages/ArithmeticKTheory/README.md:236–237, “Use Part II DA.0's integral injection and DA.1/DA.3's symmetric/quadratic tables”.

   Claim: An unspecified Part II supplies the integral quadratic/symmetric inputs to §3.5.

   Witness: There is no roadmap name for DA.0/DA.1/DA.3, no such named supplier contract or gap, and no eligible GeometryOfNumbersAndQuadraticArithmeticPartII entry in merge-order/ORDER.txt.

   Exact repair text: Replace this sentence with the exact existing eligible roadmap name, section and theorem, with the Dedekind/characteristic-zero hypotheses. If none supplies it, add here the integral Witt injection and symmetric/quadratic L-table prerequisites as named targets before §3.5; use hermitian Corollary 2.3.16 and its referenced tables as proof locators, not as a fictitious roadmap owner.

18. **F18** (P1) The unconditional K₄(ℤ) calculation lacks its homological inputs

   Location: packages/ArithmeticKTheory/README.md:2766 and 2784, “Record the unconditional K₄(ℤ)=0”.

   Claim: K₄(ℤ)=0 can be used to determine K₄(ℤ[1/p]) from localization.

   Witness: kbook lines 32284–32299 require homological calculations and the separate two-primary result. The roadmap records K₄(ℤ)=0 but owns none of those homology calculations and names no supplier for them.

   Exact repair text: “Prove `k4_int_eq_zero` unconditionally, with the Soulé–Rognes homological calculation and its required homology and comparison targets explicitly owned before this result (K-book, VI.10.1.3). Then use it in the one-prime localization example.” Alternatively consume an exact eligible supplier contract for that theorem. Do not leave it as an unproved table lookup.

19. **F19** (P3) Regularity API requests a computational algorithm

   Location: packages/ArithmeticKTheory/README.md:2437–2438, “IsRegularPrime.decidable uses a proved computation of the class number”.

   Claim: The roadmap includes a class-number computation as the basis for decidable regularity at arbitrary primes.

   Witness: The required executable decision procedure is neither a mathematical regularity characterization nor a finite worked example; it requests the computational algorithm excluded by the planning contract.

   Exact repair text: Delete `IsRegularPrime.decidable` and its class-number-computation requirement. Retain the class-number definition, the mathematical Kummer equivalence and the named finite regular/irregular examples. If classical decidability is needed locally, use Lean's existing classical instance rather than planning an algorithm.

20. **F20** (P2) The finite Kummer criterion is ordered before its proof inputs

   Location: packages/ArithmeticKTheory/README.md:2381–2383, “Together with §7.3's Herbrand–Ribet equivalence”.

   Claim: §7.2 proves the finite criterion using §7.3, while §7.3's proof also uses the ordinary Kummer congruence developed in §7.2.

   Witness: README:2381 uses §7.3; README:2482–2483 uses Kummer congruence from README:2392–2406. The criterion, independent congruence input and its regularity corollary share one unsplit dependency block.

   Exact repair text: “Order the inputs as follows: integral divided Kummer congruences and character reflection; finite Herbrand–Ribet; the finite regularity criterion; its all-index divided-numerator corollary and tower equivalence.” Give each target its own Needs line, and consume the three declared supplier contracts from R02 rather than introducing a section-level forward reference.

21. **F21** (P2) The conditional raw-kernel headline assumes its conclusion

   Location: packages/ArithmeticKTheory/README.md:2033–2037, “assume … restriction … is zero on symbolWildKernel”.

   Claim: `rawWildKernel_eq_symbol_of_localRestriction_eq_zero` supplies a higher-degree kernel comparison, with vanishing left as an open sub-target.

   Witness: By the definition of rawWildKernel, the premise is exactly WK^sym⊆WK^raw. The opposite inclusion is already asserted at line 2027, so the premise is equivalent to the conclusion.

   Exact repair text: “The established targets are WK^raw⊆WK^sym and equality in degree two by Moore's theorem. Higher-degree equality is not asserted without an independently sourced global-to-local vanishing theorem with explicit hypotheses.” Delete the tautological conditional headline and the unsourced open vanishing sub-target; add a substantive comparison only when its precise theorem and proof inputs can be supplied.

## Verified sound

Coverage: all 3,606 README lines and all 225 Suggested.lean lines were read. The inventories contain 32 Lean declarations (7 definitions, 13 theorems, 12 proved examples), 52 numbered target sections, all 88 bold spans, and 301 Check bullets. Every declaration's section and instance context was reviewed. The adversarial table below records boundaries tried across all 52 sections; the 301 Check bullets were reviewed, not all formally proved. Separately, 207 exact arithmetic tests passed: 173 golden-field factorizations, 23 signed determinants and 11 residue surjections, with every determinant gcd equal to q−1.

Sixty source anchors were checked against readable text: 58 matched the relevant claims or proof inputs; the two mismatched tame-symbol locators are R13. This counts the anchors below, not every citation in the README. Twenty-one of the 22 cited works were readable, including the supplied Groenewegen journal text; the original Harris–Segal text and the Groenewegen preprint pagination remain unverified. Parenthesized numbers in the table are source line numbers.

| Source | Checked anchors | Count |
| --- | --- | --- |
| kbook | III.6.2.3 (13406), III.6.2.4 (13434), III.6.3 (13461), V.6.6 (24532), V.6.6.1 (24557), VI.2.2 (28465), VI.2.2.1 (28482), VI.2.3 (28494), VI.2.4 (28557), VI.2.4.1 (28561), VI.9.9 (31898), VI.10.1 (32187), VI.10.1.3 (32284) | 13 |
| kahn | 4.1 (643), 4.2.4 (674), 4.2.6 (698), 4.3.2 (719), 4.3.3 (722) | 5 |
| hermitian | 2.3.16 (2217), 2.3.18 (2250), 2.3.19 (2263) | 3 |
| rognes-weibel | 6.7 (1650), 6.9 (1741) | 2 |
| fgv | (2.6) (516), 2.11 (586), 2.14 (649) | 3 |
| groenewegen | Lemma 6 (226), Lemma 9 (333), Proposition 10 (348), Lemma 12 (470), Proposition 13 (484), Theorem 14 (513), Theorem 15 (519) | 7 |
| caputo | Proposition 3 (348), Remark 5 (367) | 2 |
| cgz | Lemma 3.5 (901) | 1 |
| sharifi | 4.4.2 (3500), 4.4.4 (3545), 4.4.5 (3547), 5.2.5 (4230) | 4 |
| yokoyama | Theorem 4 (215) | 1 |
| serre | III.1 Proposition 1 (1738) | 1 |
| mitchell | Theorem 3.4 proof (927) | 1 |
| hutchinson | Definition 2.3 (139), Remark 2.4 (143), Lemma 5.1 (718), Remark 5.4 (809), Theorem 5.6 (829), Corollary 5.7 (858) | 6 |
| wildkernel | Theorem A (26), Definition 0.2 (51), Lemma 0.3 (58), Corollary 0.4 (71), Theorem B (100), Proposition 8.1 (602), (8.2) (618), Proposition 8.4 (624), Lemma 8.5 (637), (8.6) (646), Theorem 8.7 (655) | 11 |

The Lean statements survived the stated mathematical boundary tests. In particular, `evenTwoRank_add_prime` explicitly retains s≥1 and is a numerical identity; R03 concerns its arithmetic interpretation. The finite-subgroup intersection theorem does not mistake the subgroup exponent for the stabilization index. Oddness/primality remain explicit in Kummer's criterion. No admitted data, admitted examples, `set_option`, extra Mathlib import or forced higher-K Lean headline was found. The zero-ring case is excluded by the fraction-field context.

Pinned API inspection used Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The S-integer carrier, height-one spectrum, class-group quotient, unit maps, relative norm, ExactK0, Module.Relations, Bernoulli conventions and Sqrt5 arithmetic APIs were read at those pins. Object searches did not identify an existing pinned implementation of the seven proposed light definitions; this is not a repository-wide nonexistence proof.

Supplier coverage: all five supplied sibling heads were searched by object and supplier names; the package makes zero direct citations to those five siblings, so zero such section citations required matching. Five relevant main-roadmap contracts were inspected: GlobalNumberFields, Chebotarev, ClassFieldTheory, IntegralLattices and NumberFieldArithmetic. R07 records the ownership error. Eligible but unavailable supplier contracts are listed below rather than silently certified.

The PR diff contains only README.md, Suggested.lean, metadata.toml and review.json inside packages/ArithmeticKTheory. The read-only dependency check returned exit status 1 with exactly:

```text
NOT IN ORDER: ArithmeticKTheory (insert it after its last supplier)
depcheck: 6 roadmaps, 46 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. The insertion notice is not a finding under the supplied design-stage rule. This parser output does not validate missing supplier names or section exports; R01, R02 and R17 are separate contract checks.

The declaration-context table follows. Generic `Type*` parameters retain their independent universes; no theorem was found to rely on a section instance silently discarded from its type. Lines refer to packages/ArithmeticKTheory/Suggested.lean.

| Line | Kind / name | Section and context |
| --- | --- | --- |
| 32 | `def sUnitSubmonoid ` | Layer 1: S-integers and arithmetic functoriality; R : Type*, CommRing R, IsDedekindDomain R; S : Set (HeightOneSpectrum R); F : Type*, Field F, Algebra R F, IsFractionRing R F |
| 36 | `theorem integer_isLocalization_iff (M ` | Layer 1: S-integers and arithmetic functoriality; R : Type*, CommRing R, IsDedekindDomain R; S : Set (HeightOneSpectrum R); F : Type*, Field F, Algebra R F, IsFractionRing R F |
| 41 | `example ` | Layer 1: S-integers and arithmetic functoriality; R : Type*, CommRing R, IsDedekindDomain R; S : Set (HeightOneSpectrum R); F : Type*, Field F, Algebra R F, IsFractionRing R F |
| 48 | `theorem integer_isLocalization_of_torsion_classGroup` | Layer 1: S-integers and arithmetic functoriality; R : Type*, CommRing R, IsDedekindDomain R; S : Set (HeightOneSpectrum R); F : Type*, Field F, Algebra R F, IsFractionRing R F |
| 58 | `def borelRank (r₁ r₂ n ` | Layer 3: finite generation and ranks; Only explicitly bound parameters |
| 61 | `example ` | Layer 3: finite generation and ranks; Only explicitly bound parameters |
| 63 | `example ` | Layer 3: finite generation and ranks; Only explicitly bound parameters |
| 65 | `theorem borelRank_even (r₁ r₂ k ` | Layer 3: finite generation and ranks; Only explicitly bound parameters |
| 75 | `def divisibleSubgroup ` | Layer 6: even groups, divisibility and Bott degrees; A : Type*, AddCommGroup A; explicit Finite A or Finite T where present |
| 78 | `theorem mem_divisibleSubgroup_iff {x ` | Layer 6: even groups, divisibility and Bott degrees; A : Type*, AddCommGroup A; explicit Finite A or Finite T where present |
| 82 | `theorem divisibleSubgroup_eq_bot_of_finite [Finite A] ` | Layer 6: even groups, divisibility and Bott degrees; A : Type*, AddCommGroup A; explicit Finite A or Finite T where present |
| 88 | `theorem inter_mul_eventually_eq_divisibleSubgroup (T ` | Layer 6: even groups, divisibility and Bott degrees; A : Type*, AddCommGroup A; explicit Finite A or Finite T where present |
| 94 | `example ` | Layer 6: even groups, divisibility and Bott degrees; A : Type*, AddCommGroup A; explicit Finite A or Finite T where present |
| 103 | `example ` | Layer 6: even groups, divisibility and Bott degrees; A : Type*, AddCommGroup A; explicit Finite A or Finite T where present |
| 124 | `theorem divisibleSubgroup_int ` | Layer 6: even groups, divisibility and Bott degrees; A : Type*, AddCommGroup A; explicit Finite A or Finite T where present |
| 131 | `def bottCohomologySlot (j ` | Layer 6: even groups, divisibility and Bott degrees; Only explicitly bound parameters |
| 134 | `theorem bottCohomologySlot_totalDegree (j ` | Layer 6: even groups, divisibility and Bott degrees; Only explicitly bound parameters |
| 139 | `example ` | Layer 6: even groups, divisibility and Bott degrees; Only explicitly bound parameters |
| 142 | `example ` | Layer 6: even groups, divisibility and Bott degrees; Only explicitly bound parameters |
| 147 | `def evenTwoRank (r s t j n ` | Layer 6: even groups, divisibility and Bott degrees; Only explicitly bound parameters |
| 153 | `theorem evenTwoRank_add_prime (r s t j n ` | Layer 6: even groups, divisibility and Bott degrees; Only explicitly bound parameters |
| 157 | `example ` | Layer 6: even groups, divisibility and Bott degrees; Only explicitly bound parameters |
| 160 | `example ` | Layer 6: even groups, divisibility and Bott degrees; Only explicitly bound parameters |
| 167 | `def bernoulliTop (k ` | Layer 7: Bernoulli numbers and regular primes; Only explicitly bound parameters |
| 169 | `example ` | Layer 7: Bernoulli numbers and regular primes; Only explicitly bound parameters |
| 172 | `example ` | Layer 7: Bernoulli numbers and regular primes; Only explicitly bound parameters |
| 176 | `def IsRegularPrime (p ` | Layer 7: Bernoulli numbers and regular primes; Only explicitly bound parameters |
| 179 | `example ` | Layer 7: Bernoulli numbers and regular primes; Only explicitly bound parameters |
| 183 | `theorem kummer_criterion (p ` | Layer 7: Bernoulli numbers and regular primes; Only explicitly bound parameters |
| 189 | `theorem isRegularPrime_three ` | Layer 7: Bernoulli numbers and regular primes; Only explicitly bound parameters |
| 193 | `theorem isRegularPrime_of_lt_37 (p ` | Layer 7: Bernoulli numbers and regular primes; Only explicitly bound parameters |
| 198 | `theorem not_isRegularPrime_37 ` | Layer 7: Bernoulli numbers and regular primes; Only explicitly bound parameters |


The section-by-section adversarial pass follows. “No counterexample” records tested boundaries, not a completed proof of a planned theorem.

A mathematical match below does not certify unavailable supplier contracts or Lean elaboration. All references in this table are to packages/ArithmeticKTheory/README.md.

| Statement / section | Instances and boundaries tried | Result / required change |
| --- | --- | --- |
| §1.1 denominator criterion | Empty/full S; field; ℤ; nonprincipal prime of ℤ[√−5]; infinite S; zero ring cannot satisfy fraction-field context | Criterion and torsion-class-group sufficiency survive; discriminating Lean mirrors missing. (R11). |
| §1.2 extension and transfer | Identity; ℚ⊂ℚ(i); prime 2 ramified; invert only an extra upper prime | Exact-above-S hypothesis is necessary and retained; no counterexample. |
| §1.3 K₀/K₁ | Rank zero/one; degree one/two; nontrivial Steinitz class; ℤ[1/p] | Steinitz correction and norm directions retained; imported identifications require supplier verification. |
| §2.1 localization support | All/empty S; field; DVR; relative singleton; infinitely supported tuple | Closed-point identification fails at full S; displayed direct sum is correct. (R16). |
| §2.2 bottom rows | β{5,2}=2 and β{2,5}=3 modulo 5; inverse ideal class | Sign conventions match; wrong source locator. (R13). |
| §2.3 ramification | e=1,2; residue units 2↦4; two upper primes; e=2 then 3 | Multiplicity is e, not residue degree; tower factor 6; no counterexample. |
| §2.4 even injection | n=2; residue K_even=0; degree one | Injection follows; degree-one units do not inherit later odd surjectivity. |
| §3.1 Q filtration / LayerPoset | R a field/non-PID; V=0,1,𝔽₂²; reverse order; add forbidden (0,V) | Zero stage contractible; rank-one layers two points; 11 layers over 𝔽₂²; no counterexample. |
| §3.2 relative homology / finiteness | m=1,i=1; m=2,i=2; i<m; infinite Pic; π₁(BQ)=K₀ | Integer degree shift and stability bounds correct; missing R.1 supplier. (R01). |
| §3.3 rational localization | Empty S; composites; ramified quadratic; n=1; multiply chosen map by 2 | n≥2 and actual-map characterization necessary and retained. |
| §3.4 Borel rank / finiteness | Signatures (1,0),(0,1); n=0,1,2,3,5; K₂(ℚ) | Numerical convention correct; ring/field finiteness separated; R.3 unavailable. (R01). |
| §3.5 hermitian finiteness | m=0,1; negative L-degrees; classical degrees 0–3; ℤ; characteristic two | Comparison ranges cover integers; no inappropriate inversion of 2; anonymous tables unowned. (R17). |
| §4.1 fixed twists | 𝔽₃ weights 1,2; ℚ weights 0,1,−2; quadratic transfer; ordinary tensor square ℚ/ℤ | Orders 2,8,24 and infinite weight zero distinguished; M.1 unavailable. (R01). |
| §4.2 exponent formula | ℓ=3 over ℚ at weights 1,2,6; ℓ=2; i=0 | Orders 1,3,9; odd-primary restriction and finite root level retained. |
| §4.3 exceptional / dyadic | ℚ,ℚ(i),ℚ(√−7),ℚ(√−2),ℝ; characteristic p; nonzero negative weight | Number-field equivalences separated from general definition; four dyadic cases agree with source. |
| §4.4 rational orders | i=2,4,6,10 and odd i | 24,240,504,264; source's weight-ten extra factor 5 correctly rejected. |
| §5.1 Soulé | i=1 versus i≥2; coefficients 2,3; finite supports | Correct degree exclusion and coefficient precautions; comparison inputs unavailable. (R01). |
| §5.2 e / early edge | Finite/separably closed fields; ℚ at i=2 and 3; exceptional imaginary field | Bockstein direction, ℤ/48→ℤ/24 and degree-five real defect retained. |
| §5.3 imaginary/odd-primary table | ℚ(i); ℚ(√−7); r₂=1; i=1 excluded | Torsion W_i and free rank consistent with Handbook 73. |
| §5.4 real extension | w=24,r=1; w=2,r=2; r=0; degrees 3,5 | Diagonal extension gives ℤ/48 and retains real correction; no counterexample. |
| §5.5 detected summand | q=7,ℓ=3,r=2; q=3,ℓ=2; q=19,m=3; actions 3 and 7 on ℤ/8 | Wreath index needs maximal primary roots; original Harris–Segal text unread. (R05). |
| §6.1 even comparison | s=1,t=0; ℚ at odd ℓ; ℚ(i) at 2; excluded real pair K₆(ℤ) | Cohomological-dimension and twist restrictions are essential and retained. |
| §6.2 signature defect | ℚ; imaginary fields; ℚ(√7),ℚ(√34); dyadic enlargement | Selmer signs, rather than unit signs alone, matter; prime enlargement changes j. |
| §6.3 real dyadic table | r₁=1; ℚ(√2),ℚ(√7); n=0,1 excluded | Hidden degree-four ℤ/2 retained; source comparison supports it. |
| §6.4 coefficient/two-rank table | All four even residues; s=0,1; n=0; ℚ(√7) add prime 7 | Numerical theorem true with s≥1; arithmetic Check false. (R03). |
| §6.5 order ratio | ℚ,i=2 and 4; i=0/odd; imaginary field; zero group | Ratios 1/12 and 1/120; zero group has order one. |
| §6.6 infinite height / stabilization | ℚ,ℤ,ℤ/4,ℚ⊕ℤ/4,ℚ/ℤ; T=2(ℤ/4); unbounded 2-power roots; Caputo sextic | Finite T argument works; exponent alone fails; arithmetic certificate is explicitly a target; mirrors missing. (R11). |
| §6.7 three wild kernels | i=1,2; ℚ; ℚ(i); real sign; local divisible quotient | Positive domain and raw/symbol distinction preserved; no automatic higher equality asserted. |
| §6.8 Moore sequence | i=1 over ℚ; odd ℓ; real i=2; add v with ℓ∣q_v^i−1 | Sign and hidden subgroup not discarded; local weight is i. |
| §6.9 cohomological kernels | Real even/odd twists; missing dyadic prime; hidden degree-four class | Ordinary real H² and hidden K-kernel distinguished. |
| §6.10 special fields / norm | ℚ,ℚ(i),ℚ(√−14),ℚ(√−17); actions 3 mod 4/8; nonunit 2 mod 4 | Special versus very special and norm-surjectivity tests discriminate. |
| §6.11 Picard descent | E=F; C₂ on ℤ/4; H∩L=F / L⊆H; incompatible prime norm; full versus twist field | H₁ defect and compatibility condition correct; Chebotarev owner wrong. (R07). |
| §6.12 divisibility obstruction | Nonspecial ℚ; special imaginary field; real degree-four class | Unconditional distinctions survive, but the conditional equality assumes the missing inclusion; remove that headline (R21). |
| §6.13 twisted Picard injection | p=2 excluded; ramified odd p; χ⁻¹ at p=5; unit versus p-unit | Twist/corestriction route agrees with Caputo; unramified-p hypothesis not imposed generally. |
| §6.14 presentation certificate | Empty presentation; ℤ/4↠ℤ/2; order-two sign bound; empty prime product | Matched full orders needed; easy generic Lean milestone missing. (R10). |
| §6.15 Bott slots / descent | j=−1,0,1; odd p including 3; p=2; arbitrary number field | Slots/signs correct; general descent artificially restricted; missing mirror. (R08, R11). |
| §6.16 ordinary comparison | Degree 0/1; ℤ versus ℤ[1/p]; negative Bott degree | Ordinary comparison range and K₁ localization correction retained. |
| §7.1 Bernoulli / w | k=0,1,2,5,6; B₁ versus B′₁; divided B₁₀/5 | Sign/reindexing and cancellation correct; mirrors missing. (R11). |
| §7.2 regularity | p=0,1,2,3,37; k divisible by p; p−1∣2k | Finite criterion and divided all-index argument sound conditional on missing contracts; delete computational decision target and reorder inputs (R02, R19, R20). |
| §7.3 character projectors | ℓ=3; ℓ=37,k=16; C₄ over 𝔽₅; direct versus inverse Artin | Exponent 5, projector normalization and twist χ⁻¹ correct; supplier exports missing. (R02). |
| §7.4 regular-prime K-groups | ℓ=2,3,5; zero degree; Bott shift 4 at ℓ=3 | Generator counts and prime restrictions consistent; no mod-3 associativity claimed. |
| §7.5 Vandiver / integer table | a=0; K₁ exception; finite versus global Vandiver; degree 22 | Conditional labels retained; full order theorem unowned. (R06). |
| §8.1 certificate data | Wrong degree; relations only; empty Gaussian presentation; two real signs | Proof provenance is not implied by certificate fields. (R12). |
| §8.2 rational / inverted prime | p=2,3; degree 1/3; finite versus infinite residue support | K₂ at p=3 is (ℤ/2)²; support and order conventions correct; K₄ needs its homological proof inputs (R18). |
| §8.3 Tate filtration | Step zero; Gaussian 1+i; rational prime 5; presentation versus actual subgroup | α symbol direction and ordinary-unit base stage correct. |
| §8.4 unit criterion / descent | q=2; a=b; norm exactly q²; tied norms; cutoff zero | Strict inequality and no zero division retained; source Appendix Proposition 1 matches. |
| §8.5 Gaussian certificate | Norm 2 and 5; eight representatives; symbol {−1,−1} | Separate small prime and Euclidean inequalities valid; zero ring K₂ does not imply zero field K₂. |
| §8.6 golden lattices | s=2,3; determinant-one stretch; norm-four boundary; norm ε=−1 | Numeric covolumes/bounds match source; develop general number-field theory first. (R09). |
| §8.7 golden fraction/cutoff | Fraction 1; inverse residue; stretch; zero difference; q>33; tied primes | Algebra and strict cutoff survive; general-theory ownership required. (R09). |
| §8.8 finite certificates | Every one of 173 factorizations, 23 signed determinants, 11 residue surjections | All exact checks passed; all gcds equal q−1. |
| §8.9 golden tame kernel | Two embeddings; ε/conjugate; g/h signs; only one lower sign | Independent sign vectors give lower order four; finite/geometric upper bound avoids zeta values. |
| §8.10 K₃ examples | ℚ versus ℚ(i), same w₂=24 | ℤ/48 versus ℤ⊕ℤ/24 agrees with real extension and imaginary table. |

## Not verifiable

- Harris–Segal, original §3, article pp. 20–33: the sources service found bibliographic records but no readable legal article. Mitchell's proof sketch and the K-book supply secondary checks, not certification of the original locator. Recorded as `harris-segal` in the consolidated missing-reference scratch record.
- Groenewegen author preprint pp. 1–16: the source-service request timed out. The supplied journal extraction supports the numbered mathematics, but does not certify the README's explicitly chosen preprint pagination. Recorded as `groenewegen-preprint`; switching to the read journal version resolves this version-specific limitation.
- Exact current exports of these allowed suppliers could not be inspected from the provided main/Completed trees or sibling heads: StableHomotopyKTheory, GeneralAlgebraicKTheory, SchemeKTheoryOperations, KTheoryLowDegrees, K2SymbolsBrauer, KTheoryFiniteLocalFields, ArithmeticGaloisDuality, SelmerIwasawaCohomology, GeometryOfNumbersAndQuadraticArithmetic, HermitianKTheoryOfPoincareCategories and IntegralIwasawaTheory. Their permitted merge-order position is not itself a finding; the explicitly admitted missing exports are R02.
- Lean elaboration and proof-script execution were not run, as required by the read-only/no-build brief. Declaration truth and instance retention were checked from the source; successful elaboration is not claimed.
- Source locators beyond the sixty anchors listed above are not all certified. Readable extractions contain occasional OCR damage, especially in wildkernel. No missing formula was reconstructed and presented as a verified source statement. The complete cited-work fetch record and the two consolidated missing-reference entries remain in scratch; no source text was copied into the package.
- The 207 finite calculations verify the displayed arithmetic data, not the unimplemented geometric cutoff, generation theorem or K-theory comparison. Those remain roadmap targets with the dependency defects identified above.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a6cca4e21289eb3a74b5471ee530db138164393d", "job": "RT-ArithmeticKTheory~1a", "model": "gpt-6-astra", "worker": "chris-2"} -->
