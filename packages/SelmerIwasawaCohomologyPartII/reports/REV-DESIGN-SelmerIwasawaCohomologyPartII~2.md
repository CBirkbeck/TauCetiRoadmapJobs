<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/118#issuecomment-6311557041 -->
Review (codex) of 64af5c6

Verdict: needs_changes

1. **F01** (P1) Positive-loss detection does not supply a diagonalizing basis

   **Location:** `packages/SelmerIwasawaCohomologyPartII/design/README.md:658`, also lines 662, 674, 687 and 724; `packages/SelmerIwasawaCohomologyPartII/design/plan.json:1263`. Quote: “there exist distinct very special inert places and a basis s₁,…,sᵣ with loc_wᵢ(sⱼ)=0 for i≠j”.

   **Claim:** The proof obtains an abundant tuple from the span premise and then diagonalizes its evaluations by a change of basis of S. Section 7.3 uses that basis to give a primitive diagonal class a unit coordinate. This is precisely the positive-loss step that the supplier corrects.

   **Witness:** Over A=O/π⁵ take D=[[π,1],[0,π]]. Its image contains π²A², but DB cannot be diagonal for B∈GL₂(A): the two off-diagonal equations force both entries of B's second row into (π).

   The correction is explicit in `TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md:2758` and line 2774, §4.4, at the inspected supplier head. It supplies a scaled inverse C with DC=CD=π²I, not a basis. For this D, C=[[π,−1],[0,π]] has nonunit determinant. The design cites §§1.11 and 1.15 and ltxzz Proposition 2.6.7 (ltxzz lines 883–898), but omits this corrected §4.4. The source's “obvious” basis step is not valid. The design's diagonal-row Check does not detect it.

   **Exact repair:** Import EulerSystemsAndKolyvaginSystems §4.4, state the scaled-inverse/submodule conclusion for arbitrary loss, and reserve the basis conclusion for zero loss. Rewrite the two-place construction and §§8.2–8.4 using a justified primitive-kernel argument and track its bounded loss explicitly; do not replace the general theory by c=0. Include D and C above as a negative-control Check. In particular, deriving a unit coordinate of the diagonal class from the scaled-inverse columns is not allowed. Amend the corresponding plan statement, proof sketch, prerequisites and tests.

2. **F02** (P1) Compatible level refinement need not be Cartesian

   **Location:** `packages/SelmerIwasawaCohomologyPartII/design/README.md:427`; `packages/SelmerIwasawaCohomologyPartII/design/plan.json:660`. Quote: “Compatible refinement produces a cartesian level diagram with its actual finite covering degrees”.

   **Claim:** Mere compatibility of the two refined unitary levels makes the square of sh↑ maps a pullback.

   **Witness:** Keep K_(n+1) unchanged and strictly refine K_n to a neat subgroup giving a cover of degree d>1. Compatibility persists. The right vertical arrow is identity, so a Cartesian square would force the left cover to be an isomorphism.

   The source's level category only imposes the two inclusions: ltxzz lines 1149–1154, Definition 3.1.11(3), p. 26. It does not impose a pullback-level condition. The point and identity tests at lines 435–437 miss this case.

   **Exact repair:** Give `diagonalDatum_refine` a commutative square for general compatible refinement. State Cartesian base change only with the additional pullback condition (or on the actual pullback object), and specify the relevant component identification. Keep pushforward of the refined graph equal to its source covering degree times the downstairs graph; that does not require the false Cartesian assertion. Restrict graph pullback formulas in §4.6 to genuinely Cartesian diagrams. Add the unchanged-target/proper-source-refinement negative control to both design files.

3. **F03** (P1) The blowup API asserts a false converse

   **Location:** `packages/SelmerIwasawaCohomologyPartII/design/README.md:325`; `packages/SelmerIwasawaCohomologyPartII/design/plan.json:428`. Quote: “Maps to Q are maps to P on which the center ideal becomes invertible”.

   **Claim:** All maps into the blowup are characterized by invertibility of the image of the pulled-back center ideal.

   **Witness:** A geometric point of the exceptional ℙ¹ in §2.6 is a map Spec κ→Q. Its composite lands in the center of P, so the center's ideal has zero image in κ; that ideal is not invertible.

   This uses the design's own exceptional-fibre Check at line 334, supported by ltxzz lines 4755–4759. Distinct points of that ℙ¹ also give distinct lifts of the same map into P. Thus this is not merely a missing uniqueness proof.

   **Exact repair:** Consume the blowup universal property from the existing Rees-blowup owner (StableReduction Layer 4, as already used by EtaleCohomologyFoundations F.7). State unique lifting for maps whose inverse-image center is an effective Cartier divisor. Do not assert the converse for arbitrary maps into Q. If describing all maps, use the actual Proj/quotient-data formulation with its conditions. Add a point of the exceptional fibre as a negative control and synchronize the plan API.

4. **F04** (P2) The auxiliary torus-invariant cohomology carrier is lost

   **Location:** `packages/SelmerIwasawaCohomologyPartII/design/README.md:293`, also §§2.5–3.6, 5.3–5.5 and 6.3; `packages/SelmerIwasawaCohomologyPartII/design/plan.json:320`. Quote: “In even rank, Frobenius on Hᴺ⁻²(M†,L((N−2)/2)) is trivial”.

   **Claim:** The source comparisons are written using unqualified cohomology of the native CM auxiliary models. There is no convention declaring H(M), H(S) or H(Q) to mean H_𝔗. Section 6.2, by contrast, explicitly writes H_T. Merely listing `torusInvariantCohomology` in the supplier block does not identify these carriers.

   **Witness:** A free C₂-orbit of two geometric points has H⁰=L² and H⁰_𝔗={(a,a)}≃L. For L=𝔽₂ the total trace of (1,1) is 0, while its orbit trace is 1.

   Source definition: ltxzz lines 1637–1657. Lemma 5.6.2 (ltxzz lines 3349–3355), Theorem 6.3.5 and Lemma 7.3.3 explicitly use H_𝔗. PELModuli §M4.9, `TauCetiRoadmap/PELModuli/README.md:3422`, supplies exactly this invariant carrier and orbit trace, including the two-point Check. The ordinary cohomology at a fixed auxiliary CM level has additional factors and is not the source's carrier.

   **Exact repair:** Explicitly adopt the supplied finite torus groupoid action and H_𝔗/H_𝔗,c notation for all auxiliary-model cohomology, with its coefficient domain and free action on components for the trace. Propagate it through the weight complex, localization and potential-map targets. Distinguish it from geometric/absolute cohomology of the Shimura variety, and name the supplied comparison when passing between them. Add the two-point invariant/trace control. No new private cohomology definition or averaging by a possibly nonunit group order is needed.

5. **F05** (P2) The exceptional place sets lack their finiteness hypothesis

   **Location:** `packages/SelmerIwasawaCohomologyPartII/design/README.md:245`, also lines 217, 507 and 594; `packages/SelmerIwasawaCohomologyPartII/design/plan.json:153`. Quote: “sets Σ⁺min⊇Σ⁺Π, Σ⁺lr of inert places … and Σ⁺⊇Σ⁺min∪Σ⁺lr”.

   **Claim:** The data permit arbitrary sets. Conventions do not say these sets are finite, and the first- and second-law bundles repeat the omission. Later arguments require finite Hecke support, finite exceptional prime removal, and a maximum of local annihilation constants.

   **Witness:** ltxzz lines 5139–5142 explicitly require all three sets finite; lines 5839–5841 and 6195–6197 do so for both reciprocity laws. An infinite Σ⁺ may contain every auxiliary rational support, defeating the prime-existence step.

   The current genericity supplier also types its predicate over finite Σ⁺: `TauCetiRoadmap/IgusaVarietiesAndTorsionConcentration/README.md:2871`. The uniform-annihilation supplier takes a finite set and a finite maximum: `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:2307`.

   **Exact repair:** Put all exceptional/raising sets, including the standing Σ⁺min, in the finite-set domain explicitly in Conventions and the three datum signatures. State their enlargement, disjointness and excluded-support conditions on that domain in the plan as well. Add an infinite-exclusion negative control. This restores the source's hypotheses and does not remove any of its allowed finite bad-place configurations.

6. **F06** (P2) The special-level model has two owners

   **Location:** `packages/SelmerIwasawaCohomologyPartII/design/README.md:155` and line 277; `packages/SelmerIwasawaCohomologyPartII/design/plan.json:1727`. Quote from the gap: “require the native strictly semistable unitary special-level model”.

   **Claim:** Gap `native-shimura` asks ShimuraVarieties to supply the native model and strict semistability of ltxzz §5.2. Section 2.3 also constructs that model, asserts strict semistability, and gives its xy=p proof. This is an overlap between a supplier obligation and a retained target.

   **Witness:** README line 277: “M is strictly semistable of relative dimension N−1”; line 281 proves it by Hodge lifts giving xy=p. Both the gap and target cite ltxzz Theorem 5.2.5, line 2653.

   This is a minimality finding, not a complaint that the declared gap is absent from its supplier today. The strict semistability theorem cannot be a new obligation of both roadmaps.

   **Exact repair:** Choose one owner. The smallest change is to import the native strictly semistable model from `native-shimura` in §2.3, retain only the source-specific incidence/normal-bundle/stratum identifications as this target's new conclusions, and identify the local chart as a supplier output used by those calculations. Remove the second model/semistability proof obligation from the plan. Alternatively keep model construction here and narrow the supplier gap accordingly; in either case update Scope and the gap's exact residual needs together.

7. **F07** (P2) The oldform supplier has extra bad-place and level restrictions

   **Location:** `packages/SelmerIwasawaCohomologyPartII/design/README.md:95`, lines 167 and 369–373; `packages/SelmerIwasawaCohomologyPartII/design/plan.json:522`. Quote: “use §13.9 for the D.2.3 dimension formula”.

   **Claim:** The design uses the oldform dimension formula and transferable-level results for all data allowed by §2.1. Its exact hypotheses do not include the supplier's exceptional set S_FL or the required small levels there; the residual gap only requests the intertwiner comparison.

   **Witness:** `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4873` and line 4917 require Σ_min⊇S_FL, Σ_lr∩S_FL=∅, and sufficiently small levels at S_FL. None appears in the design's datum or even-theorem hypotheses.

   At line 4881 that supplier expressly limits hyperspecial transfer to places above its residue-characteristic bounds. Retaining `UnitaryClassificationInputs` does not remove the separately stated S_FL conditions. Data with a relevant place in S_FL outside Σ_min, or with transferable but insufficiently small level there, are not covered by the cited §13.9. This is supplier-domain drift, not a refutation of ltxzz's original theorem.

   **Exact repair:** Bind the exact domain of the supplied theorem. Preserve the roadmap's full generality by declaring the precise residual all-place transfer/oldform comparison on EndoscopicTransferAndUnitaryTraceComparison, or by supplying and citing a proven reduction from arbitrary allowed levels to the supplier's restricted domain with the required integral degree/error control. Do not silently add a “good primes only” restriction to the endpoints. Update the supplier contract, affected prerequisites and the residual gap consistently.

Seven findings: three P1 and four P2. The design is repairable within its Part II scope. No design or source-manifest entry was changed.

## Previous repair verification

The specified first review, `packages/SelmerIwasawaCohomologyPartII/reports/REV-DESIGN-SelmerIwasawaCohomologyPartII.md`, is absent. The following checks therefore use the 27 numbered accounts in `packages/SelmerIwasawaCohomologyPartII/reports/FIX-DESIGN-SelmerIwasawaCohomologyPartII~2.md`; they cannot certify that this account reproduces every original finding. Quoted passages below are from `packages/SelmerIwasawaCohomologyPartII/design/README.md`, with its line numbers.

| Repair | Status | Repaired passage and independent check |
| --- | --- | --- |
| F01 | repaired | Line 710: “whose finite diagonal sum ∑_s f(s,sh↑(s)) is nonzero.” The period witness replaces the L-value implication; compare ltxzz lines 6548–6576. |
| F02 | repaired | Line 740: “with all admissibility clauses L1–L7 retained.” No unsupported L6/L7-free refinement remains; the small-rank H(N) range agrees with ltxzz line 1273. |
| F03 | repaired | Line 75: “`IsWeaklySemisimple`, `invariantCoinvariantMap`, `weaklySemisimple_of_surjective` and `weaklySemisimple_integral_lift`.” The private definition is absent; the named general statements exist in the base §§0.12–0.13. |
| F04 | repaired | Line 79: “`TauCeti.ErrorTolerant.expAt`, `ordAt` and `reducibilityDepth`.” The private exponent API is absent and the supplier §1.3 owns these objects. |
| F05 | partly repaired | Line 658: “suppose the Oλ-span of θ_S(G_{S,γ}) contains λ^c Hom_Oλ(S,(R̄⁽ᵐ⁾)^{hγ}).” The span premise is explicit, but the following basis claim still uses the uncorrected Proposition 2.6.7; R01. |
| F06 | partly repaired | Line 712: “c is independent of m.” The uniform premise is retained throughout the rank exports. The positive-loss linear algebra still needs R01. |
| F07 | repaired | Line 660: “S is the actual reduced integral Selmer submodule.” The base §4.24 supplies this image, and the local-condition imports retain the coefficient domains. |
| F08 | repaired | Line 688: “pairing exponent max(0,a+b−m).” Direct valuation calculation gives the stated formula for a perfect rank-one pairing, including either zero argument. |
| F09 | repaired | Line 49: “applies to finite modules over a PID.” Both named declarations and their finiteness/domain hypotheses were read at the Mathlib pin; no coefficient-algebra gap remains. |
| F10 | partly repaired | Line 678: “`onePlaceAnnihilator`” and “`twoPlaceAnnihilator`.” Both are owned here with dual coefficients and local bounds. The two-place use of a detecting basis is still unsupported for positive loss; R01. |
| F11 | repaired | Line 83: “Normalized Satake, unitary-genericity, paired-unitary-parameter, actual double-coset operators.” The deleted §1.3–§1.4 objects exist in SmoothRepresentationsOfLocalGroups §SR.4.4. The separate transfer-domain defect is R07. |
| F12 | partly repaired | Line 167: “The packet oldform dimension formula is imported from §§13.6–13.9.” The residual intertwiner comparison is distinct, but the imported dimension theorem has additional finite-place/level restrictions not bound here; R07. |
| F13 | repaired | Line 91: “strong coefficient fields and stable polarized lattices.” AG2.6 really supplies strong coefficient fields and uniform realization. AG2.5 explicitly retains the H(N) conditional status. |
| F14 | repaired | Line 99: “every exceptional-set enlargement, standard indefinite space and compatible level.” IG.7.2 supplies this exact predicate and its `of_decomposedGeneric` API; AG2.7 supplies eventual local genericity. The F⁺≠ℚ restriction remains in §7.4. |
| F15 | partly repaired | Line 27: “the published reflexive closure, F joined with the intersection of all CM-type reflex fields.” This matches ltxzz-published lines 1542–1556 and PELModuli M0.26. Torus cohomology is named but not installed consistently (R04), and model ownership overlaps (R06). |
| F16 | repaired | Line 159: “This is the filtration induced from nearby cycles.” The parity conditions and residual integral scope distinguish the gap from the supplier's rational spectral sequence. |
| F17 | repaired | Line 308: “H²ʳ⁻¹(M•,L(r−1))^F.” This is the invariant term of ltxzz lines 4151–4152 and 4190–4195. The Frobenius-4 example correctly separates invariants from coinvariants. |
| F18 | repaired | Line 13: “The root-number consequence … is not exported.” No epsilon-sign target remains. |
| F19 | repaired | Line 541: “potentialSource(r)=(B_(2n−r),0)^F and potentialTarget(r)=(B^r_0)_F.” The direction and complementary indices agree with ltxzz lines 5097–5126. |
| F20 | repaired | Line 171: “the Oλ-coefficient arithmetic étale regulator on CHⁿ(X)^0.” The residual regulator is not supplied by the rational rank predicates in MotivesAndAlgebraicCycles §§7.16–7.18. |
| F21 | repaired | Line 173: “with only geometric row 2n−1, identify absolute H²ⁿ with H¹(F,H²ⁿ⁻¹).” The adic extension is explicitly a gap beyond SchemeAndStackFoundations §2.15. |
| F22 | repaired | Line 119: “In higher rank L6 and A7.2.2 retain the literal absolute irreducibility.” GlobalGaloisDeformations §5.2 is indeed rank two; the revised assignment does not apply that equivalence in higher rank. |
| F23 | repaired disposition; settled | Line 189: “no existing Liu–Tian section is claimed.” The repair report's reason for “not actionable in this package” is correct: the named supplier obligation is a permitted gap. It is not re-raised. |
| F24 | repaired | Line 33: “reflect 1 (T−1)=−(T−1)” and line 554: “the cokernel class of π has exponent 1.” Both computations are correct; the duplicate exponent definition is gone. |
| F25 | partly repaired | Line 151: “Each `gap:` names a residual theorem or construction on one supplier.” All 20 slugs and owners are present in both files. R06 identifies an ownership overlap and R07 a stronger supplier claim than the cited domain. |
| F26 | repaired | Line 357: “Under A6.1.4 alone … E₂ is supported only at (0,2r).” The stronger eigenvalue assertions separately retain A6.1.6 and H(N). Line 457 correctly separates rational cuspidal concentration from multiplicity realization. |
| F27 | repaired | Line 766: “PeriodsAndSpecialValues consumes … retaining the uniform realised Frobenius span hypotheses.” The nonexistent named consumer is absent, and the period-nonvanishing implication is not claimed as supplied here. |

No finding below re-raises the settled F23. The other repair entries did not use the “not actionable” disposition.

## Verified sound

### Scope, structure and mechanical checks

The entire 775-line design README and all structured target, API, Check and gap entries were read. There are 8 layers, 40 targets, 45 API entries and 53 target Checks, plus 7 convention Checks. All 13 definitions/constructions have an API and at least three listed Checks. Every target/API/Check name occurs in the README. Every target has a locator; no locator is flagged unverified in the design. All target prerequisites refer backwards; every gap reference resolves; every gap's `neededBy` list agrees with its direct consumers. JSON and TOML parse.

The parent is explicitly SelmerIwasawaCohomology; the continuation distinguishes the base's Selmer/local-cohomology ownership from unitary geometry and reciprocity. The repaired design no longer owns duplicate exponent, weak-semisimplicity, Satake-predicate or Hecke-scalar APIs. It keeps ramified coefficient fields, arbitrary CM extensions, nonproper support issues and both parity cases. No computational algorithm, copied source passage, instruction embedded in source text, or attempt to edit another roadmap was found. The ownership and supplier-domain exceptions are R06–R07, not a rejection of the Part II scope.

The README has Summary, Scope, Conventions, exact supplier contracts, build order, eight layers each ending in Examples and Dependencies, downstream consumers and References. ProfiniteCohomology and StableReduction on main were read for comparison. No `Suggested.lean` exists in this design package. Lean elaboration: **not available**; the brief supplies no executable elaboration command. No Lean command was run, and no assertion about an “only sorry” warning result is made. There are no Lean data stubs or `set_option` declarations to inspect in the reviewed files.

### Seeded source sample

All 15 requested sample targets were checked against the legally cached texts, including the surrounding hypotheses and page markers. The following is a statement-support audit, not a claim that a cited proof has been formalized. Source-dependent carrier/domain defects are identified in the result column.

| Target | Exact text checked | Result |
| --- | --- | --- |
| 1.6 rankinSelbergAdmissible | ltxzz lines 6368–6399, Definition 8.1.1/Remark 8.1.2, pp.131–132; ltxzz-published lines 7345–7386, pp.303–304 | L1–L7, twists, simple tensor fixed line, ξ and forbidden eigenvalues match. Published reflexive closure verified at ltxzz-published lines 1542–1556, p.147. |
| 2.4 unitaryLinkAndIntersection | ltxzz lines 3349–3359, 3518–3540, 3722–3743; Lemma 5.6.2 and Theorems 5.7.7–5.7.8, pp.71,75–78 | Counts, fibre dimension, excess bundle and p+1 unit restriction match. H_𝔗 is missing in the design notation: R04. |
| 2.5 unitaryIncidenceWeightComplex | ltxzz lines 4023–4055, 4110–4195, 4213 onward; §5.9, pp.83–87 | Three columns, signed maps, filtration, even matrix including N=2, invariant singular term match. Integral residual gap is distinguished from rational supplier; carrier correction R04 remains. |
| 3.1 localizedUnitaryCohomology | ltxzz lines 5204–5209, 5221–5258; Remark 6.1.5 and Lemmas 6.1.9–6.1.11, pp.107–109 | Correct irreducibility, intertwining and concentration distinctions. Ordinary/compact comparison is explicitly a supplier gap. Auxiliary carrier R04 applies. |
| 3.5 evenSingularComparison | ltxzz lines 5634–5657; Theorem 6.3.5(4), pp.115–116 | Full even hypotheses, nΠ quotient, filtered inertia and singular comparison match. Correct carrier and exact upstream proof domain still require R04/R07. |
| 3.7 oddSpecialLevelChange | ltxzz lines 6489–6543; Lemma 8.1.7, pp.133–134 | H(n₁), finite P, distinct rational supports, intertwining and cohomological genericity retained; every-degree statement matches. |
| 4.1 diagonalUnitaryDatum | ltxzz lines 6755–6788, p.139; Definition 3.1.11(3), lines 1149–1154, p.26 | Compatible levels and separate transferability match. Added Cartesian-refinement API does not: R02. |
| 5.1 firstReciprocityDatum | ltxzz lines 5833–5927; §7.2/Notation 7.2.1, pp.120–121 | PI1–PI7, nonzero quotient and separate tensor specialness match. Finiteness is omitted: R05. |
| 5.3 productCohomologyConcentration | ltxzz lines 5931–5954; Lemma 7.2.5, pp.121–122 | Three E₂ terms, twist −1 exclusion, weak semisimplicity, concentration and support comparison match on H_𝔗 and localized modules. R04. |
| 6.2 secondGeometricReciprocity | ltxzz lines 2488–2521, 2552–2584; Construction 4.6.1/Theorem 4.6.2, pp.53–55 | Operator T⋆, A's direction, both correspondence legs and degree 2r₀ are correct. The proof's product square uses different geometric inputs in the two parities; it does not assert Proposition 4.5.5 for odd n. |
| 6.3 oddSpecialFiberCoinvariants | ltxzz lines 6255–6265; Assumption 7.3.2/Lemma 7.3.3, p.128 | Assumptions, weak semisimplicity and coinvariant direction match; H_𝔗 notation needs R04. |
| 7.1 admissibleImageLift | ltxzz lines 918–936; Lemma 2.7.1, p.21 | Prime-to-ℓ order, all three rank-one kernels, P=T²−1 and residual exclusions retained. Published reflexive field is an allowed totally real Galois F′. |
| 7.3 rankinSelbergLevelRaisingSystem | ltxzz lines 6633–6638, 6838–6847, 6875–6892; equations (8.4)–(8.5), (8.11)–(8.14), pp.136,140–142 | Dual coefficients and singular/nonsingular conclusions match. Replacement of the source's faulty basis step is incomplete: R01. |
| 7.4 eventualAdmissibilityFamilies | ltxzz lines 6400–6460; Lemmas 8.1.3–8.1.5, pp.131–133; ltxzz-deformation lines 1761–1767, 1772–1785, 1880–1896 | Both families and F⁺≠ℚ retained. Supercuspidality and non-CM/nonisogeny assumptions are not generalized to arbitrary pairs. No eventual uniform-span result is claimed. |
| 8.5 hilbertPrecursorCompatibility | liu-tian lines 1407–1413, 1425–1432, 1477–1500; Assumption 4.1, Definition 4.5/Theorem 4.7, pp.30–32 | Odd degree, LIInd, residual dimension equality, p/ℓ exclusions, congruences, degree and twist agree. It is correctly a supplier obligation, not a second construction of the Hilbert theorem. |

The four manifest entries have legal origins and identify the versions read. In particular, the published intersection definition was not silently attributed to the preprint's compositum convention. Also checked: H(N)'s conjugation and its N≤3/F⁺≠ℚ domains (ltxzz lines 1259–1277); the period premise (lines 6548–6576); the absolute-cycle inequality direction (lines 6303–6330); and D0–D4 of rigid R=T (ltxzz-deformation lines 1444–1455). No new scholarly source was needed or fetched. The manifest was left unchanged.

### Adversarial mathematics pass

Each row covers the target's entire defining statement, its named APIs and its Checks, rather than only the headline. “No new defect” means the tested cases are consistent, subject to the explicitly named supplier contracts and the shared defects R01–R07. It is not a proof of the target. Cases outside the actual CM/number-field/coefficient domains (zero field, equal-characteristic Oλ, inseparable CM extensions, n<2) were rejected rather than silently inserted. General p-coprime geometric coefficients remain separate from Oλ.

| Statement | Instances tried | Result | Required change |
| --- | --- | --- | --- |
| Conventions and imported algebra | n=2; ℓ=2,3; ramified Oλ; degree-one and degree-two polynomials; sign action of C₂ | Rank 6, twist 2, weight −1; small ℓ fails L1; reflection sign −/+; coboundary −2; arithmetic/geometric twist factors 9 and 1/9 | Install H_𝔗 and finite-set conventions, R04–R05 |
| 1.5 specialInertPlace; four APIs | ℚ(i), p=3,5,2; inert residue degree two; identity transport | 3 passes with residue size 9; split, ramified/even and degree-two cases fail; published closure agrees | None |
| 1.6 rankinSelbergAdmissible; four APIs | n=2; ξ=±1; identity scalar; homothetic lattice and unit polarization; higher rank | L1 and L5 exclusions discriminate; tensor polarization has twist 1; no rank-two cyclotomic shortcut | Finite Σ⁺min, R05 |
| 2.1 unitaryLevelRaisingDatum; four APIs | m=0,1,2; empty raising set; infinite exceptional set; changed level | m=0 excluded; λ and λ² conditions differ; P6 must be rechecked after level change; infinite Σ is not covered by suppliers | R05, R07 |
| 2.2 unitaryBasicCorrespondence; three APIs | N=2,3; empty base; residue-field extension | Fibre dimensions 0,1; codimensions 1,1; empty base remains empty; tangent/normal directions agree with source | Clarify imported model ownership under R06 |
| 2.3 unitarySemistableStrata; three APIs | N=2 node; N=3,p=3; p inverted; component normals | xy=p has two reduced branches and smooth generic fibre; quartic normal degrees +16 and −16 | Separate imported semistability from owned stratum comparisons, R06 |
| 2.4 unitaryLinkAndIntersection | r−j=1; ℓ divides p+1; nontrivial CM orbit | Count p+1 and fibre ℙ⁰; restriction not exported when p+1 nonunit; ordinary cohomology differs from torus invariants | R04 |
| 2.5 unitaryIncidenceWeightComplex; three APIs | N=2 and N=4; p=3; Frobenius 4 on ℤ₃; two-component restriction | N=2 middle row/column zero; entries 4 and −16; invariant term 0 versus coinvariant ℤ/3; (1,0)↦1 and (0,1)↦−1 | R04; retain stated coefficient/unit hypotheses |
| 2.6 unitaryProductResolution; three APIs | n=2; empty center; outside center; point of exceptional ℙ¹ | Relative dimension 3; blowup identity away from center; exceptional point contradicts the claimed unrestricted universal property | R03; use component-specific cohomological decompositions |
| 3.1 localizedUnitaryCohomology | Zero localization; nonproper boundary; residual concentration | Zero module consistent; irreducibility and genericity have distinct roles; rational comparison alone would not imply integral freeness | R04 |
| 3.2 oddTateCycleComparison | A6.1.4 only; add A6.1.6/H(N); trivial and unipotent Frobenius | Hypothesis split matches source; unipotent block fails invariant/coinvariant isomorphism | R04 |
| 3.3 evenIntegralFreeness | Zero definite localization; cyclotomically reducible residual representation; S_FL place | First two excluded explicitly; supplier oldform domain is narrower than the target | R04, R07 |
| 3.4 evenFrobeniusExclusion | Residual eigenvalues 1 and p²; N=2; ramified coefficients | Both eigenvalues excluded; primitive-link comparison is a real residual contract | R04, R07 through §3.3 |
| 3.5 evenSingularComparison | Zero quotient; quotient versus annihilator; nonzero ground invariants | nΠ quotient is essential; ground term must vanish before filtered inertia equals singular cohomology | R04, R07 |
| 3.6 evenCongruenceGaloisRealization | Multiplicity 1,2; zero definite input; conjugate representation | μ retained; μ≥1 needs nonzero input; c and twist are correct; no canonical coordinate | R04, R07 |
| 3.7 oddSpecialLevelChange | P empty; one place; two disjoint rational supports | Empty change is identity; finite successive changes agree with source; genericity still required | None beyond standing finite sets |
| 4.1 diagonalUnitaryDatum; three APIs | n=2; incompatible levels; identity; refine source only | Dimensions 1,2,3 correct; incompatible levels fail; compatible source-only refinement is not Cartesian | R02 |
| 4.2 diagonalGraphCycle; three APIs | Δ−Δ; source cover of degree d; point graph | Class 0, pushforward dΔ, point class 1; no degree-free pushforward | Preserve distinction between pushforward and Cartesian pullback, R02 |
| 4.3 projectedDiagonalAbelJacobi; three APIs | n=2; zero cycle; point on ℙ¹; rational versus integral concentration | H¹(F,H³(2)/I) is correct; ℙ¹ point cannot use a nonexistent single-row edge; H(N) not needed for cuspidal vanishing | None |
| 4.4 rankinSelbergPurityAndSelmer | w∤ℓ and w∣ℓ; weight −1; bad finite place | Away-ℓ argument needs both dual invariant vanishings; above ℓ needs the regulator/smooth-model contract | None |
| 4.5 diagonalMultiplicityRealization | Multiplicity zero,1,2; nonzero tuple; conjugation | Nonzero AJ rules out zero multiplicity; a nonzero coordinate exists without a canonical choice | None |
| 4.6 diagonalRegulatorNaturality | Identity; degree-d source cover; non-Cartesian level square; scalar extension | Trace scaling is valid; graph pullback requires genuine Cartesian data | R02 |
| 5.1 firstReciprocityDatum; four APIs | 𝔽₁₁ with roots {2,6} and {1,4,3}; empty support; zero quotient; m reduction | Individual roots are simple but tensor root 2 repeats; PI7 necessary; PI6 excludes zero quotient; finite-module reduction preserves nonzeroness | R05, R07 |
| 5.2 firstGeometricReciprocity | One graph point; two preimages; zero test; component signs | Fibre multiplicities and all Hecke factors remain; ordinary total trace would change normalization | R04 |
| 5.3 productCohomologyConcentration | Free factors; nonfree tensor test; zero localization; bad product eigenvalue | Freeness removes Tor; PI7 needed; single-row concentration is not automatic before localization | R04, R07 |
| 5.4 diagonalCycleBoundaryComparison; three APIs | Zero cycle; O→O by π²; unipotent Frobenius; reduction modulo π | Class of π has exponent 1; zero class exponent 0; invariants→coinvariants may vanish; complementary indices are consistent | R04 |
| 5.5 firstExplicitReciprocity | p=3; singleton graph; zero function | Pairing is 4a₀a₁ times graph value; neither Hecke factor can be removed | R04, R07 |
| 5.6 firstReciprocityExponentEquality | Unit multiplication; zero function; nonunit scalar | Units preserve exponent; nonunits need not; PI2/PI4/PI5 supply the relevant units | R04, R07 |
| 6.1 secondReciprocityDatum; three APIs | m=0,1,2; two correspondence preimages; omitted PII5/PII6 | m positive; higher congruence stronger; multiplicity 2 retained; second-law domain is distinct | R05 |
| 6.2 secondGeometricReciprocity | Both n parities; identity specialization; zero class | T⋆ and A retained; source proof uses Proposition 4.5.5 for even n and Lemma 4.5.2 for odd n | Keep precise square, consistent carrier R04 |
| 6.3 oddSpecialFiberCoinvariants | Trivial Frobenius; residual unipotent block; auxiliary CM orbit | Trivial case agrees; integral lifting needs residual semisimplicity and rank inequality; carrier must be H_𝔗 | R04 |
| 6.4 secondExplicitReciprocity | O/π²→O/π; zero class; absolute versus singular class | Exponents 2→1 show strict inequality is possible; absolute localized cycle is correctly retained | R04 for comparison input |
| 7.1 admissibleImageLift | m=1; higher powers; ξ=±1; simultaneous powering | Residual witness gives base case; forbidden ξ fail; power must be simultaneous in actual image | None |
| 7.2 auxiliaryPlaceDetection | Zero realised span; rank-one π² row; rank-two D=[[π,1],[0,π]] | Zero-span control works; rank-one bound works; abundant positive-loss tuple need not diagonalize by a basis | R01 |
| 7.3 system; onePlaceAnnihilator; twoPlaceAnnihilator | Empty raising set; perfect/nonperfect pairings; positive-loss detecting pair | Pairing exponents correct; one-place construction distinct from two-place; source's unit-coordinate deduction is not justified by a scaled inverse | R01; downstream R07 |
| 7.4 eventualAdmissibilityFamilies | Families A/B; unrelated relevant pair; F⁺=ℚ; small residue characteristic | Restricted families and F⁺≠ℚ retained; no universal eventual span inference | Finite exceptional sets, R05 |
| 8.1 rank zero from period | Nonzero/zero period; saturated rank-one lattice; unbounded c | Nonzero period has finite valuation; uniform c necessary; rank-one detection itself avoids the basis obstruction | R04–R07 in the construction inputs |
| 8.2 rank one from AJ | AJ=0; nonzero multiplicity; saturated rank two; positive loss | Nonzero AJ gives lower bound; upper-bound proof still relies on the false detecting-basis step | R01 and construction inputs |
| 8.3 H(N)-free domains | n=2,F⁺=ℚ; n=3,F⁺=ℚ; F⁺≠ℚ | H(2),H(3) removable in first case; H(4) not discharged in second; eventual span remains extra | Carry corrected §8.2 through R01 |
| 8.4 rank-(2,3) specialization | ℓ=11 versus 2,3; F⁺=ℚ; missing L6/L7 | Small primes fail L1; all seven clauses retained; source does not justify removing L6/L7 | Carry corrected §8.2 through R01 |
| 8.5 Hilbert precursor | g=1,3; absent LIInd; failed residual dimension equality | Odd-degree statement retains both independent assumptions and the correct twist; no substitution for singular unitary theorem | None |

### Duplication and supplier audit

Pinned Mathlib is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; pinned Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, matching `lake-manifest.json`. Local library checkouts were verified at those exact commits. Searches were by polynomial reflection, derivative/evaluation, finite PID torsion decomposition, finite torsion-free modules, continuous cochains and low-degree cohomology, not just the candidate's names.

| Object | Existing owner checked | Disposition |
| --- | --- | --- |
| Polynomial evaluation, derivative and fixed-degree reversal | `Mathlib/Algebra/Polynomial/Eval/Defs.lean`; `Mathlib/Algebra/Polynomial/Derivative.lean`; `Mathlib/Algebra/Polynomial/Reverse.lean:88` | Imported. Reflection uses the specified degree; its sign controls compute correctly. |
| Prime-power decomposition and finite PID freeness | `Mathlib/Algebra/Module/PID.lean:168`; `Mathlib/LinearAlgebra/FreeModule/PID.lean:397` | Imported, with PID/domain/finite-module contexts. |
| Continuous cochains and compatible-pair functoriality | `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:113`; `Mathlib/RepresentationTheory/Homological/ContCohomology/Functoriality.lean:103` | Imported on TopRep, with the correct direction of group/coefficients. |
| Explicit d0, H1 and coefficient-exponent transfer | `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:172`, line 755 | Imported; no arithmetic local-condition theorem is falsely attributed to these objects. |
| Weak semisimplicity and integral lifting | SelmerIwasawaCohomology §§0.12–0.13 | Private copies deleted; general Noetherian and DVR versions exist. |
| Exponents, restriction injectivity and realised detection | EulerSystemsAndKolyvaginSystems §§1.3,1.6,1.11,1.15 and 4.4 | First four consumed; corrected §4.4 missing, R01. |
| Satake predicates and unitary scalar identities | SmoothRepresentationsOfLocalGroups SR.4.4 | Private copies deleted. q invertibility and degree/parity are retained. |
| Global finite Selmer images and bad-place killing | SelmerIwasawaCohomology §§4.24–4.25; ArithmeticGaloisDuality R02.4/D7 | Imported. Uniform annihilation requires a finite set and both H⁰ vanishings. |
| Strong fields and relevant Galois representations | AutomorphicGaloisRepresentationsPartII AG2.5–AG2.7 | Correct general-rank owner; H(N) removal remains a declared contract. |
| Genericity | IgusaVarietiesAndTorsionConcentration IG.7.2; AutomorphicGaloisRepresentationsPartII AG2.7 | Universal finite-enlargement predicate and eventual local-genericity interface exist. |
| PEL deformation, reflexive closure and torus invariants | PELModuli M0.25–M0.26, M2.12–M2.14, M4.7–M4.9 | Imported; failure to use invariant carrier consistently is R04. |
| Rees blowups and étale blowup formula | StableReduction Layer 4; EtaleCohomologyFoundations F.7 | Existing general theory; candidate universal-property converse needs R03. |
| Special-level strictly semistable model | Candidate §2.3 and its `native-shimura` gap | Two planned owners, R06. |
| Local unitary packets, transfers and oldform dimensions | EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4,12.12–12.15,13.6–13.9 | Packet/tower results do not supply primitive finite-field link cohomology. Dimension theorem's extra domain is R07. |
| Integral nearby filtration and cycle-boundary comparison | LefschetzPencilsAndVanishingCycles §§7a.7–7a.9 | Existing spectral sequence is rational with nearby-cohomology abutment; residual integral obligations are genuine. |
| General Chow theory versus integral arithmetic regulator | SchemeAndStackFoundations Layer 5; MotivesAndAlgebraicCycles §§7.16–7.18 | General objects imported; the integral regulator is a distinct contract. |
| Hilbert precursor | HilbertModularVarietiesAndShimuraCurves; liu-tian Theorem 4.7 | Declared supplier gap is allowed and settled. |

Read the supplier sections at main when present, otherwise at the available new-roadmap branch snapshots. Principal snapshots: SelmerIwasawaCohomology `17f6056`, EulerSystemsAndKolyvaginSystems `4fb7ae9`, SmoothRepresentationsOfLocalGroups `2880329`, ArithmeticGaloisDuality `5b7027c`, AutomorphicGaloisRepresentationsPartII `c4cc6a1`, EndoscopicTransferAndUnitaryTraceComparison `f8f8c2b`, PELModuli `2d82d07`, IgusaVarietiesAndTorsionConcentration `55adf55`, LefschetzPencilsAndVanishingCycles `1b8f741`, GlobalGaloisDeformations `29e415c`, MotivesAndAlgebraicCycles `c3dad31`. Supplier headings and required names exist; R07 concerns their scope rather than a nonexistent heading.

QWittVectors' open head `4605fbb0a2d9279b561f9467ab5cce09d7f2469e` was read through GitHub's read-only contents API. ArithmeticDynamics was inspected at local head `85e78c07dcc361ead6505c970a1181deee483819`; ErdosProgressionPowers at `72b615703f7fc5d175e519ddbb6e589d3d744c6c` (also verified as its open head). Their objects concern q-Witt/coefficient algebra, dynamics and progression powers, not the native unitary comparisons owned here. Available board designs were searched for overlapping arithmetic-level-raising ownership; the intake target for ArithmeticLevelRaisingAndBipartiteEulerSystems is not a second supplied implementation. No existing pinned native Rankin–Selberg level-raising or diagonal-regulator declaration was found.

All 20 declared gaps have a named owner, a section or explicit new obligation, and matching slugs in the README and plan. The common core is not reported as missing implementation. The native-model minimality exception is R06; R07 requires a more precise residual supply contract. The other gaps separate definitions, integral extensions, geometric identification, regulator, H(N), image and rigidity inputs from the earlier supplied interfaces. Their acceptance would remain conditional on fulfillment; this verdict is not an acceptance conditional on gaps.

Every `*Needs:*` line and supplier citation was read. Chebotarev and ProfiniteCohomology are on main; all other named suppliers are in the permitted earlier order. No upward edge or cycle was found. The design does not need a placement edit. No notion was moved to a later roadmap.

### Dependency command output

The exact command supplied in the brief failed with exit 1 because the candidate `packages/SelmerIwasawaCohomologyPartII/README.md` does not exist. Its diagnostic, with the machine path rendered repository-relative as required, was:

```text
FileNotFoundError: [Errno 2] No such file or directory: 'packages/SelmerIwasawaCohomologyPartII/README.md'
```

The same gate was then run with only the candidate changed to the existing `packages/SelmerIwasawaCohomologyPartII/design/README.md`. Exit 0; complete output:

```text
candidate: SelmerIwasawaCohomologyPartII is not in the merge order yet; checked as if placed after IgusaVarietiesAndTorsionConcentration (the intake inserts it when its design is accepted)
depcheck: 4 roadmaps, 42 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The order file and tooling were not edited. An independent plan scan found 0 forward target references and 0 dangling target/gap references; manual supplier reading supplied the semantic scope audit that this gate cannot perform.

## Not verifiable

- The original round-one review is absent. Its findings were checked through the repair report's F01–F27 accounts, with the limitation stated above.
- Lean elaboration is **not available**: there is no `Suggested.lean` in this design package and no usable elaboration command in the brief. No Lean process was started.
- Fulfillment of the declared supplier gaps is not certified. They are contracts, not missing-text or unowned-prerequisite findings. In particular, ltxzz Proposition 3.2.11 points to an unpublished higher-rank input (ltxzz lines 1273–1277); the design correctly leaves the relevant theorem as a named supplier obligation.
- The live ArithmeticDynamics pull-request head could not be confirmed: the read-only lookup by its supplied branch name returned no pull request. Its available checkout at the hash recorded above was inspected. No dependency of this design uses ArithmeticDynamics.
- No cited source text was unreadable. No `needs-references.toml` addition is required. PDF extraction loses some superscript/subscript typography; the potential-map direction was checked also against its factorization and the following coinvariant statement (ltxzz lines 5110–5126), rather than guessed from a flattened symbol.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "64af5c6794adf9f0cb1e00a52ee4b28311d4d2d4", "job": "REV-DESIGN-SelmerIwasawaCohomologyPartII~2", "model": "gpt-6-astra", "worker": "chris-3"} -->
