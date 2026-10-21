<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/118#issuecomment-6316597960 -->
Review (claude) of 723cb09

Verdict: needs_changes

1. **F01** (P2) 3.1 asserts the intertwiner isomorphism without localization

   **Location.** `packages/SelmerIwasawaCohomologyPartII/design/README.md:371`, §3.1: “Under intertwining genericity the two special-maximal-level intertwiners on definite functions are isomorphisms.” The same sentence is the plan statement at `packages/SelmerIwasawaCohomologyPartII/design/plan.json:500`.

   **Claim.** Intertwining genericity (P5) alone makes T•°_N,p and T°•_N,p isomorphisms between the full definite function modules. The source proves this only for the localizations at mΠ; the unlocalized modules are free of ranks |Sh(V°,K°)| and |Sh(V°,K•)|, and an automorphic π whose p-component is the constituent with (π_p)^{K•}≠0 but (π_p)^{K°}=0 lies in the cokernel. P5 excludes such π only after localization, since Π-congruence forces their Satake parameters to avoid the bad pair modulo λ.

   **Witness.** ltxzz line 5221 through line 5227: Lemma 6.1.9 is stated for OE[Sh(V°,K°)]_m→OE[Sh(V°,K•)]_m, and its proof reduces to “the free Oλ-modules OE[Sh]_m and OE[Sh]_m have the same rank” using Π-congruent pairs (line 5239). The other two clauses of §3.1 say “localized”; this one does not.

   **Exact repair.** In the README and plan statement write “the two special-maximal-level intertwiners on definite functions localized at mΠ are isomorphisms”, and in the proof chain say that the rank comparison uses Π-congruent standard pairs after localization. Add a negative-control Check: without localization, a π with (π_p)^{K•}≠0=(π_p)^{K°} (possible when the Satake parameter contains {−1,−1} in even rank or {−p,−p⁻¹} in odd rank) contributes only to the target, so the unlocalized map is not an isomorphism; P5 removes it only on the mΠ-localization. Keep §3.7's “a unit after localization” wording as the model.

2. **F02** (P3) a Check instance uses an even residue cardinality

   **Location.** `packages/SelmerIwasawaCohomologyPartII/design/README.md:553`, Check `first_tensor_not_factors`: “Over 𝔽₁₁, q=2, even roots {2,6} and odd roots {1,4,3} …”; also `packages/SelmerIwasawaCohomologyPartII/design/plan.json:995`.

   **Claim.** The instance is arithmetically correct as a polynomial test, but q=2 is the residue cardinality of F⁺_v=ℚ_p with p=2, which special inertness excludes.

   **Witness.** ltxzz-published line 1552: a special inert place has odd underlying rational prime. The design's §1.5 states the same.

   **Exact repair.** Replace the instance by q=3 over 𝔽₁₁ with even roots {3,4} and odd roots {1,9,5}: P₀(3)=0, P₀′(3)=10, P₀(−1)=9, P₁′(1)=10, P₁(−3)=1 are all as required, while the tensor eigenvalue multiset {3,5,4,4,3,9} contains q=3 twice, so the tensor polynomial has a double root at q and PI7 fails. Record the computations in the Check.

3. **F03** (P3) five theorem targets have empty plan hypotheses arrays

   **Location.** `packages/SelmerIwasawaCohomologyPartII/design/plan.json:654` (3.7), `:923` (4.6), `:1336` (7.1), `:1499` (7.4), `:1612` (8.4): `"hypotheses": []`.

   **Claim.** The README sentences carry the hypotheses (H(n₁), intertwining and cohomological genericity for 3.7; compatible finite level covers for 4.6; L5-2 data for 7.1; F⁺≠ℚ and the two family conditions for 7.4; n=2 with L1–L7 and the span premises for 8.4), but the plan, which is frozen after design acceptance, does not mirror them.

   **Witness.** `packages/SelmerIwasawaCohomologyPartII/design/README.md:433`, `:525`, `:686`, `:740`, `:788` state the hypotheses in prose; the plan arrays at the lines above are empty.

   **Exact repair.** Copy the README hypotheses into the five plan `hypotheses` arrays, one sentence each, so the plan matches the README.

4. **F04** (P3) IG.7.5 and IG.7.7 are cited for statements about standard indefinite varieties

   **Location.** `packages/SelmerIwasawaCohomologyPartII/design/README.md:108` through `:110`: “§IG.7.2, §IG.7.5, §IG.7.7: `IsCohomologicallyGeneric` …; compact concentration under its F⁺≠ℚ and genericity hypotheses”; also the `*Needs:*` lines of §§1.6, 3.1 and 7.4 and `packages/SelmerIwasawaCohomologyPartII/design/plan.json:88`, `:512`, `:1507`.

   **Claim.** IG.7.5 and IG.7.7 concern the quasi-split unitary group of signature (n,n) at every archimedean place over a CM field containing an imaginary quadratic field, with the Borel–Serre boundary. The design's varieties are the standard indefinite ones of signature (N−1,1). Only IG.7.2 (the cohomological-genericity predicate for standard indefinite spaces, with its decomposed-generic criterion) is used by §§1.6, 3.1 and 7.4.

   **Witness.** `TauCetiRoadmap/IgusaVarietiesAndTorsionConcentration/README.md:2920` (IG.7.5: “G⁰ the quasi-split unitary group of signature (n,n) at each archimedean place”); `:2944` (IG.7.7, same setting). IG.7.2 at `:2871` uses standard indefinite spaces.

   **Exact repair.** Cite IgusaVarietiesAndTorsionConcentration §IG.7.2 alone in the supplier contract and the three `*Needs:*` lines, or state in the contract that IG.7.5 and IG.7.7 enter only as the inputs of IG.7.2's `of_decomposedGeneric` criterion and are not applied to the standard indefinite varieties here. Drop the phrase “compact concentration under its F⁺≠ℚ and genericity hypotheses”.

One P2 and three P3 findings. Both round-5 findings are repaired. The design remains a Part II extension of SelmerIwasawaCohomology with a single downward direction of supply; no principle is violated.

## Previous findings, checked before the new review

The round-5 report was absent from the reports folder of this checkout; it was recovered from the board history (commit `6c4faa0`) and read together with `packages/SelmerIwasawaCohomologyPartII/reports/FIX-DESIGN-SelmerIwasawaCohomologyPartII~6.md`. Each finding was checked against the design and the sources.

| Previous finding | Repaired passage and evidence | Status |
| --- | --- | --- |
| F01 (P2), H(N) antecedent missing in 4.5 | README line 513 now reads “Under H(n),H(n+1), and assuming both ρΠ₀,λ and ρΠ₁,λ are absolutely irreducible after scalar extension to ℚℓbar, realize Wλ as a finite direct sum of copies of Vλ^c”. Line 515 discharges the antecedents and derives both hypotheses from L4 by the saturated-sublattice argument, which is correct: a proper invariant subspace meets a stable lattice in a saturated sublattice whose reduction injects as a proper nonzero subrepresentation of the irreducible residual representation. The plan statement and hypotheses agree; Check `multiplicity_irreducibility_antecedent` (line 521) is the requested negative control. §8.2 (line 772) now says “L4 supplies the two absolute-irreducibility hypotheses of 4.5”. Sections 4.3–4.4 are unchanged. | Repaired. |
| F02 (P2), duplicate rigidity gap | The `rigidity` gap is gone from `plan.json` (20 gaps remain) and from the README inventory. Lines 136–138 cite LocalGaloisDeformationRings §§1.6, 2.3, 2.12, 2.20 with `IsRigidFor`, its four projections and `IsRigidFor.mono`; §7.3 (line 713) keeps `rigid_of_levelRaisingSpecial` as the Satake-to-Frobenius specialization applying `IsRigidFor.mono`. The supplier text at its open head (`TauCetiRoadmap/LocalGaloisDeformationRings/README.md:2114`–`2136`) states exactly these declarations, with the pair {‖v‖^{−N},‖v‖^{−N+2}} and the q²−1 condition. | Repaired. |

The settled items of rounds 3 and 4 (F07 of round 3 on the all-place transfer extension; F01 and F04 of round 4 on the native-model and rational-concentration extensions) remain declared contracts and are not re-raised.

## Verified sound

### Principles

Read the complete design README (824 lines), `plan.json` (8 layers, 40 targets: 6 definitions, 7 constructions, 26 theorems, 1 example; 46 API entries; 67 Checks; 20 gaps) and the manifest (5 certified entries). No route-specific shortcut: the native semistable models, link charts and nonproper specialization comparisons are contracted, not replaced by finite-set stand-ins (README line 455: “No substitute finite-set model is permitted”). No re-planning: weak semisimplicity, exponents, finite/singular conditions, Satake predicates, rigidity, PEL models and transfer are imported by section and declaration; the Scope section lists each deferral. Supply is downward only (gate below). No copied passage, no computational algorithm, no process words, no LaTeX delimiters, no `lemma`, no pull-request number, no machine path (grep clean). The design has no Lean file, so no sorry'd data or `set_option` can occur.

### Sources: the seeded sample

All five manifest texts were legally readable from the cache; no fetch, manifest edit or missing-reference request was needed. There were no author-flagged unverified locators. All fifteen seeded targets were read at their locators; fourteen support the statement as written and one (3.1) needs R01. Sixty single-line locators cited elsewhere in the README were also spot-checked and each lands on the named object.

| Seeded target | Text and locator read | Result |
| --- | --- | --- |
| 1.6 `rankinSelbergAdmissible` | ltxzz line 6368 through line 6399 (Definition 8.1.1, Remark 8.1.2, pp. 131–132); line 678 through line 682 (Lemma 2.3.5); ltxzz-published line 7345 through line 7386 | L1–L7 and L5-1/L5-2 match clause by clause, including the dimension bound min((ℓ+1)/2,ℓ−3) and the five conditions (a)–(e). |
| 2.2 `unitaryBasicCorrespondence` | ltxzz line 1788 (Definition 4.3.1, p. 39); line 1871 through line 1890 (Theorem 4.3.5, p. 41) | Tangent and normal bundles, the DL(V_s,{,}_s,⌈(N+1)/2⌉) fibre, dimension ⌊(N−1)/2⌋ and codimension ⌊N/2⌋ agree. |
| 3.1 `localizedUnitaryCohomology` | ltxzz line 5206 (Remark 6.1.5), line 5221 through line 5246 (Lemma 6.1.9), line 5255 through line 5277 (Lemma 6.1.11), pp. 107–109 | Boundary comparison and concentration clauses agree; the intertwiner clause drops the localization: R01. |
| 3.3 `evenIntegralFreeness` | ltxzz line 5634 through line 5644 (Theorem 6.3.5(1)–(2), pp. 115–116) | Hypotheses (a)–(d), A6.1.4, A6.1.6 and H(N) are all present; the three E₂ positions agree. |
| 4.4 `rankinSelbergPurityAndSelmer` | ltxzz line 6484 through line 6488 (Lemma 8.1.6, p. 133); line 6794 through line 6800 (proof of Theorem 8.3.2, pp. 139–140) | Weight −1 purity at w∤ℓ via temperedness; Selmer membership from Lemma 8.1.6 and (L2). The design adds L1, which admissibility supplies anyway. |
| 4.6 `diagonalRegulatorNaturality` | ltxzz line 2488 through line 2514 (Construction 4.6.1, pp. 53–54); line 6764 through line 6772 (§8.3) | Graph construction and absolute cycle class agree; the degree factor and the Cartesian caveat are correct additions. |
| 5.1 `firstReciprocityDatum` | ltxzz line 5835 through line 5927 (§7.2 and Notation 7.2.1, pp. 120–121) | ℓ>2(n₀+1), strong disjointness, nonsplit even spaces, transferable and special maximal levels and PI1–PI7 agree; PI6 is read as a quotient, as the source's fraction notation indicates. |
| 5.4 `diagonalCycleBoundaryComparison` | ltxzz line 5097 through line 5120 (equation (5.28), pp. 104–105); line 6018 through line 6034 (Proposition 7.2.7, pp. 123–124) | Source invariants and target coinvariants, the tautological map and the value on Q_sp agree. |
| 5.6 `firstReciprocityExponentEquality` | ltxzz line 6150 through line 6167 (Corollary 7.2.9, p. 126); line 6189 through line 6191 (unit factors) | Equality of exponents with the pushed-forward characteristic function; the three unit proofs are those of the source. |
| 6.1 `secondReciprocityDatum` | ltxzz line 6192 through line 6240 (§7.3, pp. 127–128); line 6250 through line 6256 (Notation 7.3.1, Assumption 7.3.2) | No ℓ>2(n₀+1) or unramifiedness condition, no PII5/PII6; PII1–PII4 and PII7 agree. |
| 6.2 `secondGeometricReciprocity` | ltxzz line 2517 through line 2521 (Theorem 4.6.2, p. 54) | The identity with T⋆_n₁,p, both legs and the target H²ʳ⁰_𝔗(M_n₀×S_n₁,L(r₀)) agrees. |
| 7.4 `eventualAdmissibilityFamilies` | ltxzz line 6400 through line 6417 (Lemma 8.1.3), line 6418 through line 6447 (Lemma 8.1.4), line 6459 through line 6463 (Lemma 8.1.5), pp. 131–133 | Both families and their hypotheses agree; the characteristic bound 2n(n+1)−1 is that of Lemma 8.1.5. |
| 8.2 `rankinSelbergSelmerRankOne` | ltxzz line 6773 through line 6792 (Theorem 8.3.2, p. 139); line 6805 through line 6829; line 6879 through line 6915 | Transferable even levels, admissibility and H(n),H(n+1); the proof's exponent bookkeeping with loss c replacing 4r_R is consistent. |
| 8.4 `rankTwoThreeRankTheorems` | ltxzz line 1273 through line 1277 (Proposition 3.2.11, p. 28); line 6568 (Theorem 8.2.2); line 6773 | H(2),H(3) hold for every F⁺; all admissibility clauses are retained. |
| 8.5 `hilbertPrecursorCompatibility` | liu-tian line 1407 through line 1413 (Assumption 4.1), line 1477 through line 1481 (Definition 4.5), line 1496 through line 1500 (Theorem 4.7), pp. 30–32 | Odd degree, the four assumptions, the three level-raising conditions and surjectivity of (4.1.5) agree. |

Also read: ltxzz-published line 1533 through line 1556 (reflexive closure and special inertness, p. 147); ltxzz line 1044 through line 1058 (Definition 3.1.5, Remark 3.1.6); line 1204 through line 1217 (Proposition 3.2.4); line 1259 through line 1272 (Hypothesis 3.2.10); line 5623 through line 5632 (Definition 6.3.4); line 5741 through line 5748 (Lemma 6.4.2); line 591 through line 623 (Definitions 2.2.4–2.2.5, Lemma 2.2.7); line 908 through line 936 (Lemma 2.7.1); line 846 through line 905 (Lemma 2.6.4, Propositions 2.6.6–2.6.7); line 3349 through line 3359 (Lemma 5.6.2); line 3518 through line 3545 and line 3722 through line 3743 (Theorems 5.7.7–5.7.8); line 2823 through line 2831 and line 2901 through line 2912 (Theorem 5.3.4, Corollary 5.3.5); line 4055 through line 4222 (Lemmas 5.9.2–5.9.3, Construction 5.9.4); line 4710 through line 4773 (Notation 5.11.1, Lemmas 5.11.2–5.11.3); line 4899 through line 4925 (Theorem 5.11.5); line 5295 through line 5313 (Lemma 6.2.2, Theorem 6.2.3); line 5931 through line 5954 (Lemma 7.2.5); line 6037 through line 6050 (Theorem 7.2.8); line 6257 through line 6261 and line 6303 through line 6310 (Lemma 7.3.3, Theorem 7.3.4); line 6489 through line 6507 (Lemma 8.1.7); line 6546 through line 6576 (Lemma 8.2.1, Theorem 8.2.2); line 6630 through line 6701 ((8.4)–(8.8)); ltxzz-deformation line 1444 through line 1456, line 1761 through line 1767, line 1880 through line 1892; stacks-blowup line 3750 through line 3760. All support the design's statements. The source itself writes the Hodge–Tate interval as [−n,n−1] at line 6646 and as [1−n,n] at line 6907; the design uses the former, and only the width 2n−1 and a<0≤b matter for Lemma 2.2.7.

### Adversarial mathematics pass

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: ranks, twists, weights | n=2,3; zero module | r₀+r₁=n in both parities; n=2 gives tensor rank 6, twist 2, weight (2−1)+(3−1)−4=−1; general (n₀−1)+(n₁−1)−2n=−1. | None. |
| Conventions: Frobenius, polarization, coboundary | inert p=3; γ=(I,−1)c; sign action on ℤ | Arithmetic Frobenius on Eλ(1) at residue field 𝔽₉ is 9; (g,μ)j(g,μ)j=(gμᵗg⁻¹,μ²) gives GL component −I; d0(1)(g)=−2. | None. |
| Conventions: torus trace, coefficients | free C₂-orbit over 𝔽₂; ramified Eλ; zero ring | Total trace of (1,1) is 0, orbit trace 1, no division by 2; ramified Eλ handled by the inverse different in SelmerIwasawaCohomology §4.11; zero/equal-characteristic rings outside the domain. | None. |
| Conventions: Satake and Hecke normalization | degrees 1,2; r=1, q=3, a=3 and a=2; q=1 | reflect 1 (T−1)=−(T−1), reflect 2 (T²−3T+1)=T²−3T+1; S(I)=3·16/3=16, S((q+1)R−I)=0; S(T)=9·1/2=9/2, S(I)=9·35/6=105/2 against the supplier formulas; q=1 is not a residue cardinality. | None. |
| 1.5 `specialInertPlace` | ℚ(i) at 3,5,2; local degree 2 | 3 inert, odd, unramified, degree one, F Galois so F⁺rflx=ℚ: very special; 5 split, 2 ramified; degree-two F⁺_v fails. Galois closure makes “one place of degree one” equal to “split completely”. | None. |
| 1.6 `rankinSelbergAdmissible` | n=0,1,2; ℓ=2,3,11; scalar 1; ξ=±1 | n<2 excluded by the standing n≥2; ℓ≤4n fails L1; identity scalar fails Lemma 2.3.5(a), ξ=±1 fails ξ²≠1; ℓ=11 satisfies L1 for n=2. | None. |
| 2.1 `unitaryLevelRaisingDatum` | m=0,1,2; Σ⁺lr=∅; p=2 | m≥1 required; empty raising set allowed (source “possibly empty”); P4 reads mod λᵐ in even rank and mod λ in odd rank as at ltxzz line 5170; p must be odd. | None. |
| 2.2 `unitaryBasicCorrespondence` | N=2,3; empty base | fibre dimensions 0,1 and codimension 1; empty base gives empty B. | None. |
| 2.3 `unitarySemistableStrata` | node xy=p; N=3, p=3 | balloon normal O(p+1) and ground normal O(−(p+1)) as in Corollary 5.3.5 (N>2); quartic in ℙ² has degree 4·4=16 for O(4). | None. |
| 2.4 `unitaryLinkAndIntersection` | ⌊N/2⌋−j=1; ℓ∣p+1 | index ∏_{i=1}^{1}(p+1)=p+1 and ℙ⁰ fibres; restriction isomorphism needs p+1 invertible (Lemma 5.6.2(1)) and is not asserted otherwise. | None. |
| 2.5 `unitaryIncidenceWeightComplex` | node; N=2; p=3; Frobenius 4 on ℤ₃ | odd matrix entry −(p+1)²=−16 and even entry p+1=4 agree with Lemmas 5.9.2(2), 5.9.3(7); N=2 variant has the displayed zero row and column; invariants 0 and coinvariants ℤ₃/3. | None. |
| 2.6 `unitaryProductResolution` | n=2; empty centre; exceptional point | dimension 3, four Q(0) components, columns −2..2 (Lemma 5.11.3); H(Q^{?,?})=σ*H(P)⊕exceptional H^{i−2}(P^{†,†})(−1) as in 5.11.3(4); empty centre gives identity; Cartier lifting is only sufficient. | None. |
| 3.1 `localizedUnitaryCohomology` | unlocalized modules; zero localization | unlocalized definite modules have different ranks in general and the intertwiner need not be an isomorphism; the source localizes. | R01. |
| 3.2 `oddTateCycleComparison` | A6.1.4 alone; unipotent block | E₂ concentration from Lemma 6.2.2 needs only A6.1.4; eigenvalue and coinvariant clauses need A6.1.6 and H(N) as stated. | None. |
| 3.3 `evenIntegralFreeness` | zero definite module; S_FL place outside Σ⁺min | (d) nontrivial module required; §13.9 domain restriction routed to gap old-form-dimension. | None. |
| 3.4 `evenFrobeniusExclusion` | a=p⁻¹ root; p²≡1 | eigenvalue set {pa_i^{±1}}∖{1,p²} as at ltxzz line 5649; P2 excludes p²≡1. | None. |
| 3.5 `evenSingularComparison` | quotient versus annihilator | quotient by nΠ as in Theorem 6.3.5(4). | None. |
| 3.6 `evenCongruenceGaloisRealization` | μ=0 | positive μ as in 6.3.5(5); no canonical summand asserted. | None. |
| 3.7 `oddSpecialLevelChange` | P=∅; one place | identity for empty P; one-factor-at-a-time as in the proof of Lemma 8.1.7; localization stated. | None. |
| 4.1 `diagonalUnitaryDatum` | n=2; incompatible levels; source-only refinement | dimensions (1,2,3); K_n⊆K_{n+1} needed; non-Cartesian square. | None. |
| 4.2 `diagonalGraphCycle` | zero cycle; degree-2 cover; point | pushforward d[Δ] uses only commutativity, since Graph(sh′↑)≅Sh′_n→Sh_n is a. | None. |
| 4.3 `projectedDiagonalAbelJacobi` | n=2; ℙ¹ point | H¹(F,H³(X̄,Eλ(2))/I); no edge map without concentration. | None. |
| 4.4 `rankinSelbergPurityAndSelmer` | ℓ ramified in F; ramified Eλ | L1 fails for ramified ℓ; ramified Eλ allowed. | None. |
| 4.5 `diagonalMultiplicityRealization` | reducible attached representation; L4 | antecedent now explicit; L4 implies it by the saturated-lattice argument (checked). | None (F01 repaired). |
| 4.6 `diagonalRegulatorNaturality` | d=1,2; non-Cartesian square | trace formula with source degree; pullback retains all components of Z. | None. |
| 5.1 `firstReciprocityDatum` | q=2 instance; q=3 instance | the q=2 instance is correct arithmetic but outside the odd-p domain; the q=3 instance {3,4},{1,9,5} over 𝔽₁₁ fails PI7 while satisfying PI4, PI5. | R02. |
| 5.2 `firstGeometricReciprocity` | singleton; p=3 | (p+1)²=16 factor and both Hecke directions as in Theorem 5.11.5(3). | None. |
| 5.3 `productCohomologyConcentration` | tensor collision; nonproper strata | PI7 excludes collisions; 7.2.5(6) supplies the support comparison under the stated hypotheses. | None. |
| 5.4 `diagonalCycleBoundaryComparison` | differential π²; Jordan block over 𝔽₃ | cokernel class of π has exponent 1; invariants→coinvariants is zero for [[1,1],[0,1]]. | None. |
| 5.5 `firstExplicitReciprocity` | p=3; one point | value 4φΠ₀(I°)φΠ₁(T°) as in Theorem 7.2.8(3). | None. |
| 5.6 `firstReciprocityExponentEquality` | zero class; nonunit scalar | all three unit proofs used; a nonunit scalar can lower exponents. | None. |
| 6.1 `secondReciprocityDatum` | m=0; double fibre | m≥1; pushforward counts 2. | None. |
| 6.2 `secondGeometricReciprocity` | zero cycle; double fibre | both legs and T⋆ retained. | None. |
| 6.3 `oddSpecialFiberCoinvariants` | unipotent block | weak semisimplicity from H(n₁) and PII4 as in Lemma 7.3.3. | None. |
| 6.4 `secondExplicitReciprocity` | O/π²→O/π | inequality can be strict; matches Theorem 7.3.4. | None. |
| 7.1 `admissibleImageLift` | m=1,2; ξ=±1 | (a)–(e) of Lemma 2.7.1 with [F:F⁺]=2. | None. |
| 7.2 `auxiliaryPlaceDetection` | D=[[π,1],[0,π]], C=[[π,−1],[0,π]] over A₅ | DC=CD=π²I; v=e₂, t=(−1,π): D₁t=0, D₂t=π² of exponent 3; det(e₁,t)=π; matches EulerSystems §4.4's corrected statement. | None. |
| 7.3 `rankinSelbergLevelRaisingSystem` and `rigid_of_levelRaisingSpecial` | N=2, p=3 mod 11; N=4, p=3 mod 19; exponent bookkeeping | pairs {5,1} once and {4,17} twice as claimed; p^{1−N}α⁻¹ sends {p,p⁻¹} to {p^{−N},p^{−N+2}}, matching Definition 6.3.4(2); loss c bookkeeping gives p₂ exponent max(0,m−m₀−mper−2c−mlat); width 2n−1≤(ℓ−2)/2 from ℓ>4n. | None. |
| 7.4 `eventualAdmissibilityFamilies` | isogenous curves; F⁺=ℚ | outside the stated families. | None. |
| 8.1 `rankinSelbergSelmerRankZeroOfPeriod` | c=0; mdif=0; threshold m | strict inequality m>m₀+c+mper+mlat+mdif needed; both arguments finite at w∣ℓ. | None. |
| 8.2 `rankinSelbergSelmerRankOne` | AJ=0; multiplicity 2 | zero regulator gives no bound; L4 discharges 4.5's antecedents. | None. |
| 8.3 `rankTheoremsTotallyRealBase` | n=2, F⁺=ℚ; n≥3, F⁺=ℚ | H(N) discharged exactly on the domain of Proposition 3.2.11; families need F⁺≠ℚ. | None. |
| 8.4 `rankTwoThreeRankTheorems` | ℓ=2,3,11 | small primes fail L1; L6, L7 retained. | None. |
| 8.5 `hilbertPrecursorCompatibility` | g=1,3; even g | (g+1)/2 integral only for odd g. | None. |

### Duplication by object and pinned libraries

The content manifest pins (Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`) match the local library checkouts. Every declaration named in the supplier contracts exists at the pins: `Polynomial.reflect` and `coeff_reflect` (`Mathlib/Algebra/Polynomial/Reverse.lean:88`, `:95`), `Module.torsion_by_prime_power_decomposition` (`Mathlib/Algebra/Module/PID.lean:168`), `Module.free_iff_isTorsionFree` (`Mathlib/LinearAlgebra/FreeModule/PID.lean:397`, finite module), `TopRep.homogeneousCochains` and `continuousCohomology` (`Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:113`, `:131`), `cochainsMap`, `map`, `map_id`, `map_comp` (`Functoriality.lean:103`, `:148`, `:158`, `:163`), `reesAlgebra` and `mem_reesAlgebra_iff` (`Mathlib/RingTheory/ReesAlgebra.lean:40`, `:65`), `TauCeti.ContCohomology.d0`, `H1`, `H1pi`, `subsingleton_H1_of_subsingleton`, `subsingleton_H1_of_subsingleton_coefficients`, `nsmul_H1_eq_zero` (`TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:172`, `:712`, `:717`, `:836`, `:856`, `:755`), and the four `affineBlowupι` declarations (`TauCeti/AlgebraicGeometry/Blowup/AffineCharts.lean:61`, `:70`, `:76`, `:87`). None is redefined.

| Object | Owner checked | Result |
| --- | --- | --- |
| Integral étale Abel–Jacobi regulator on CHⁿ(X)⁰ | MotivesAndAlgebraicCycles §§7.16–7.18 (lines 1520–1600), WeightsInEtaleCohomology, DeligneWeightsAndPurity, SchemeAndStackFoundations, HeightsRationalPointsAndObstructions | Only curve Abel–Jacobi, Bloch's torsion map and rank predicates exist; gap chow-abel-jacobi is minimal. |
| Adic arithmetic Hochschild–Serre edge over a number field | ArithmeticGaloisDuality §R02.2.1 (group cohomology), EtaleDualityAndPerverseSheaves `adicFiniteFieldHochschildSerre` (finite-field base), LefschetzPencilsAndVanishingCycles §7b.2 (inertia Wang sequence), SchemeAndStackFoundations §2.15 (finite Galois coverings) | None states the number-field adic spectral sequence with its single-row edge; gap hochshild-serre-adic is minimal. |
| Hermitian local-global classification | GeometryOfNumbersAndQuadraticArithmetic §§2.7, 2.9 (local hermitian lattices and local Witt groups), AdelicAlgebraicGroups §4.1 | Only local invariants exist; the global Hasse classification is a new obligation. |
| Boundary vanishing for Witt-index-one unitary varieties | IgusaVarietiesAndTorsionConcentration IG.7.7 | IG.7.7 concerns the quasi-split signature-(n,n) varieties with the Borel–Serre boundary; the toroidal statement for standard indefinite varieties is a distinct obligation, correctly placed on ShimuraCompactifications. |
| Hermitian Frobenius incidence varieties | ReductiveGroupsPartII (Deligne–Lusztig hits are bibliographic only), ShimuraVarieties, PELModuli | Not present; new obligation. |
| Weak semisimplicity, integral finite conditions, inverse-different bound | SelmerIwasawaCohomology §§0.12–0.13 (line 285), 4.8 (line 1883), 4.11 (line 1954), 4.24–4.25 (line 2293) | Imported; §4.11's half-width bound b−a≤(p−2)/2 is exactly what §§7.3, 8.1, 8.2 use. |
| Exponents, reducibility depth, corrected span, scaled inverse | EulerSystemsAndKolyvaginSystems §1.3 (line 739), §1.15 (line 1297), §4.4 (line 2756) | Imported; the design's primitive-kernel calculation is the supplier's corrected statement. |
| Satake predicates and Hecke formulas | SmoothRepresentationsOfLocalGroups SR.4.4 (lines 3434–3568) | Imported; both numerical Checks recomputed against the displayed formulas. |
| Rigidity predicate and generic enlargement | LocalGaloisDeformationRings §§1.6, 2.3, 2.12, 2.20 | Imported after F02; §7.3 keeps only the Satake specialization. |
| Transfer and oldform dimension | EndoscopicTransferAndUnitaryTraceComparison §§13.7–13.9 (lines 4869–4935), §6.14 (line 2251) | The S_FL, Σ_lr∩S_FL=∅ and small-level restrictions are those the design records; the residual extension is gap old-form-dimension. |

The five named open pull requests (CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers, ArithmeticDynamics) add roadmaps whose scope is p-adic comparison, Coleman integration, Witt vectors, progression powers and dynamics; none states a unitary level-raising, diagonal-cycle or Rankin–Selberg Selmer object.

### Supplier order, citation existence and gaps

Read every `*Needs:*` line, the supplier inventory and all twenty gap entries. Twenty-four roadmap suppliers are cited: five on the main branch (SchemeAndStackFoundations §2.15 at line 3867 with `hochschildSerre_galois_covering` at line 3880; EtaleCohomologyFoundations §§F.0.3, F.2.1–F.2.3, F.2.6, F.2.7, F.3a, F.4.0–F.4.6, 0.9–0.11, F.6, F.7, all present as headings; StableReduction Layer 4 at line 468 with the blowup universal property; ProfiniteCohomology Layers 1–3, 5–8, 10; Chebotarev Layers 1–2, 10) and nineteen in open pull requests read at the heads recorded by the board. Every cited section heading and every named declaration was found (including the AG2.1b, AG2.5 and AG2.7 subsection titles, with backticks around `π` and `λ` in the supplier). All suppliers precede the candidate's insertion point; all internal target prerequisites point backward; every `gap:` slug in a prerequisite resolves to the plan's `gaps` list, every gap names a supplier other than `none`, and each gap's `neededBy` equals the set of targets citing it. Each gap appears in the README inventory with its `needs` sentence. The gate:

```text
candidate: SelmerIwasawaCohomologyPartII is not in the merge order yet; checked as if placed after IgusaVarietiesAndTorsionConcentration (the intake inserts it when its design is accepted)
depcheck: 6 roadmaps, 58 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The brief's command names `packages/SelmerIwasawaCohomologyPartII/README.md`, which does not exist at the design stage; the result above is for `packages/SelmerIwasawaCohomologyPartII/design/README.md` with the same selector and order file. Neither the tooling nor the merge order was edited.

The `native-shimura` and `purity-crystalline-regulator` needs sentences each bundle several deliverables; I judged each a single interface (the native integral models with their specialization comparisons; the rational and integral forms of one regulator theorem) and did not raise them.

### Shape and completeness

Every definition and construction has at least three Checks (plan check); every target has a locator; every layer ends with Examples and Dependencies; the README has the required headings in order and Unicode mathematics. Layer 1 begins at §1.5 because §§1.1–1.4 were deferred to suppliers in earlier rounds and are listed under Scope; the numbering is retained so that plan identifiers stay stable.

## Not verifiable

- **Lean elaboration: not available.** The design stage has no `Suggested.lean`, and the brief authorises no Lean command for this job. No elaboration result is claimed; binder retention, the single `import Mathlib`, proved mirrors and the absence of `set_option` must be checked at the package stage.
- **Round-5 report placement.** `packages/SelmerIwasawaCohomologyPartII/reports/REV-DESIGN-SelmerIwasawaCohomologyPartII~5.md` is absent from this checkout; the copy recorded in board commit `6c4faa0` was read instead.
- **Supplier implementations.** The twenty declared gaps remain contracts; their future proofs are not certified here and their absence today is not a finding.
- **Rendered formulas.** The OCR of ltxzz Lemma 5.9.3(6) does not distinguish invariants from coinvariants in the third term; the design's reading (invariants) agrees with the surrounding proof at line 4190 through line 4195 and was not independently rendered.
- **Missing source texts: none.** All five cited works and every sampled passage were readable from the cache; no missing-reference request was written.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "723cb092971fad1202b0f38a7c4c91e062cb2e85", "job": "REV-DESIGN-SelmerIwasawaCohomologyPartII~6", "model": "fable", "worker": "chris-f"} -->
