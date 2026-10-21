<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/625#issuecomment-6329248753 -->
Review (codex) of 0089673

Verdict: needs_changes

1. **F01** (P1) The real theta reduction incorrectly preserves nonvanishing unconditionally

   **Location:** `packages/GanGrossPrasadUnitaryGroups/README.md:689`, with the construction instruction at line 693 and its use at line 713. The claim is: “gives a lower pair for which a+b decreases by 2, preserves the equivalence m=1”.

   **Claim:** For every adjacent tempered real pair with a+b>1, §3.8 asserts existence of the nonzero consecutive lifts and a lower pair preserving m=1. Together with its unconditional a+b=1 base case, iteration would imply m=1 for every adjacent tempered real pair. The enhancement condition does not restrict the quantified inputs in this statement.

   **Witness:** On V=⟨−1,−1⟩, W=⟨−1⟩, standard U(2) tensor U(1) weight 1 has weights 2,1, hence m=0; (a,b)=(2,1). Xue retains nonzero-lift conjuncts: xue-real line 984 and line 1025.

   Both representations are tempered because the groups are compact. The complementary negative line has Xue's source-compatible sign for n=1. The two characters of the U(2) parameter and the single character of the U(1) parameter have the appropriate conjugate-self-dual signs, giving the displayed counts. One claimed reduction reaches a+b=1 and therefore contradicts m=0. The package itself gives this failed-interlacing example in §3.9 at line 719.

   **Exact repair:** Replace the unconditional reduction by the conditional seesaw identities of Xue Lemmas 3.8–3.9, published pp. 1022–1024: nonvanishing of the original form is equivalent to nonvanishing of the specified companion small lift **and** the subsequent relative form. Name the intermediate relative forms and their precise theta/signature hypotheses; a zero companion lift must give the vanishing branch. State the induction as preservation of the full assertion “m=1 iff the enhancements are the epsilon characters”, carrying the corresponding signature/enhancement conditions through both branches. Update the proof of §3.9 accordingly, without narrowing its true endpoint. Add the compact pair above as a negative Check of §3.8.

2. **F02** (P2) The local Rankin–Selberg gap requests theory its supplier already owns

   **Location:** `packages/GanGrossPrasadUnitaryGroups/README.md:173`; matching `gap:local-rankin-selberg` in `packages/GanGrossPrasadUnitaryGroups/design/plan.json`. The requested work includes “entire continuation of λ(s,W)/L_K(s+1/2,π_(n+1)×π_n), and existence at each s₀ of a smooth Whittaker tensor with normalized value 1”.

   **Claim:** The gap's main sentence treats generic local continuation, entire normalization and test-vector nonvanishing as missing. Its subsequent clauses also request tempered convergence and archimedean continuity. These are already explicit targets in AutomorphicLFunctionsAndLocalFactors §AL.3; declaring a gap does not make this repeated request minimal.

   **Witness:** `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:2048` supplies entire normalization; line 2055 gives `AL3.RsLocalFactor.nonvanishing`; line 2306 supplies the adjacent normalized period, continuity and the tempered half-plane; line 2314 supplies its spherical normalization.

   The inspected supplier revision is `691b4b3310d3`. Its `rs-local-convergence`, `rs-local-factor` and `normalized-rs-period` targets include finite and archimedean fields, generic irreducible inputs, opposite Whittaker characters and the argument shift s+1/2. A nonzero normalized test value becomes 1 by scalar multiplication. There is no omitted dyadic exclusion to repair by restating these targets.

   **Exact repair:** Import those three §AL.3 targets and `AL3.RsLocalFactor.normalize`, `.nonvanishing`, `AL3.NormalizedRsPeriod.entire`, `.invariant`, `.unramified` by name. Identify the package integral with the supplier's adjacent integral, or with Ψ₀(s+1/2). Restrict the gap, in both the README and its matching plan entry, to a genuinely missing comparison with the precise unnormalized differential and quotient Haar measures used here. State the conversion factors explicitly; do not request continuation, generic test-vector existence, tempered convergence or continuous realization a second time. Repoint §§3.11, 5.1a, 5.3 and 6.1 to the existing targets plus that residual comparison.

3. **F03** (P3) The split-line definition has only two discriminating Checks

   **Location:** `packages/GanGrossPrasadUnitaryGroups/README.md:227`: “The theorem `splitLineFrame_iff_norm_ne_zero` includes a zero coordinate over every field”.

   **Claim:** This third bullet restates the theorem and repeats the preceding zero-coordinate non-example. It supplies no third independently discriminating instance for `splitLineFrame`.

   **Witness:** README lines 225–227 only accept (1,1) and reject (1,0). The incorrect predicate e₁e₂=1 passes both. `packages/GanGrossPrasadUnitaryGroups/Suggested.lean:30` and line 35 test exactly those two cases.

   **Exact repair:** Replace the third bullet by the rational split-line frame e=(2,1): it is a frame and has norm 2, so a norm-one restriction fails. Prove this additional assertion within one of the two existing examples, preserving the limit of two examples per kept definition. Keep the all-field scope of the theorem.

4. **F04** (P3) The two-generator character Check lacks its Lean test

   **Location:** `packages/GanGrossPrasadUnitaryGroups/README.md:543`: “a character taking both generators to the nontrivial sign takes their sum to the trivial sign”.

   **Claim:** This is an easy Check on the actual retained carrier, but the file does not prove it. The admitted general character theorem is not a proved Check.

   **Witness:** `packages/GanGrossPrasadUnitaryGroups/Suggested.lean:127` tests multiplicity two; line 137 tests coordinates and the empty parameter. Neither evaluates an additive character on the two-generator central element.

   **Exact repair:** Extend the second existing `componentCentralElement` example with χ(x)=x(0)+x(1) on `Fin 2 → ZMod 2`. Prove χ(e₀)=χ(e₁)=1 and χ(`componentCentralElement` of the constant-one multiplicity)=0 directly. Do not use the admitted theorem, and retain at most two examples for this definition.

Four findings: one P1, one P2 and two P3. The scope is repairable and does not warrant rejection. No previous review was supplied. The authored README, Lean file, metadata, source manifest and design were left unchanged.

## Verified sound

The review covered all 1,379 README lines, all 189 Lean lines, metadata and all 17 manifest entries. It considered all 40 numbered targets, their subordinate API assertions, six retained Lean definitions, five theorem signatures and twelve proved examples. The tables below record mathematical checks, not proofs of the planned analytic library. No other false statement was identified in this pass. Findings R01–R04 delimit that conclusion.

### Principles and shape

The package develops a general relative unitary library. It retains arbitrary relevant odd codimension, ramified and split local algebras, all characteristic-zero local places and residue characteristic 2. General higher-codimension global predictions and the remaining split prediction are explicitly propositions; the established adjacent global theorem is not advertised as proving them. The restriction to characteristic zero in the analytic theory is explicit. The elementary split-line definition has its separately stated all-field scope.

The main-branch shape comparison used `TauCetiRoadmap/ReductiveGroups/README.md`, `TauCetiRoadmap/GlobalNumberFields/README.md` and `TauCetiRoadmap/Completed/RestrictedProducts/README.md`. The package has the required summary, scope, conventions, supplier contracts, build explanation, numbered layers, layer examples/dependencies, consumers and references. Definitions have API descriptions and Check lists; R03 concerns discrimination, and R04 concerns the missing statable mirror. No computational algorithm, copied source passage, process-dependent mathematical target, sorry-defined data, `set_option`, `lemma` declaration, forced analytic stand-in or circular hypothesis was found.

### Seeded source sample

All 15 requested targets were compared with the cached texts at the stated locators. Fourteen have no statement/source mismatch identified; §3.8 fails as R01. For §5.3 the all-residue continuation is explicitly new work, rather than a claim that Harris proves the dyadic case. The scope of that certification is recorded below. Source line references are to the supplied extractions; page references below are printed pages.

| Target | Text and locator checked | Result |
| --- | --- | --- |
| 1.2 `besselDatum` | ggp §12, pp. 44–46; ggp line 1567, line 1593, line 1603, line 1624–1639 | The flag, semidirect subgroup, additive character coordinates and r=0 specialization agree. The split character must remain nontrivial on both field factors, as stated. |
| 2.3 `besselMultiplicity_adjacent_le_one` | agrs Theorem 1′, p. 2, agrs line 44–65; sun-zhu Theorem B, p. 2, sun-zhu line 55–68; ggp Theorem 14.1(ii), p. 58, ggp line 2068–2072 | Correct finite-place and continuous archimedean categories, all forms and split case; no temperedness premise is needed. |
| 2.6 `besselMultiplicity_le_one` | ggp Corollary 15.2, p. 63, ggp line 2229–2235; jsz-bessel Theorem A, pp. 1–2, jsz-bessel line 11–47 | Correct all-codimension bound. The real line-sign restriction in the source is transported by simultaneous negation, rather than discarded. |
| 2.7 `adjacentTemperedIntegral_converges` | harris Proposition 2.1 and proof, pp. 5–8, harris line 230–367; bpcz §1.1.6, p. 4, bpcz line 148–167 | The strict chamber estimates absorb fixed logarithmic powers. The passage from K-finite estimates to smooth vectors is assigned to the seminorm contracts. Temperedness and positive invariant pairings are explicit. |
| 3.1 `ggpEpsilonCharacter` | ggp Theorem 6.1, pp. 20–21, ggp line 720–758; §17, p. 69, ggp line 2425–2439 | Correct generator versus central-element multiplicities, character law, parity and additive-character convention. R04 concerns a missing test, not the formula's truth. |
| 3.3 `temperedBesselForm` | bp-arch Theorem 7.2.1, p. 181, bp-arch line 6780–6833; Proposition 7.4.1, p. 192, bp-arch line 7140–7166; xue-real line 238–255 | Correct regularization for r>0, ordinary integral for r=0, finite-length tempered input and normalized-induction comparison. Rank at most one is restricted to irreducible input. |
| 3.8 `besselRealThetaReduction` | xue-real §2.4 and §§3–4, pp. 1002–1029; xue-real line 267–307, line 983–1025, line 1172–1206 | Fails: the nonzero companion-lift conditions in Lemmas 3.8–3.9 have been turned into unconditional existence. R01. |
| 3.9 `besselTemperedPacket_real` | xue-real Theorem 2.2, p. 1000, xue-real line 213–216; Propositions 2.3–2.4 and Corollary 2.5, pp. 1001–1002, xue-real line 238–266; sign transport at line 179–183 | The endpoint, all relevant codimensions and transported line signs agree. Its proposed proof must use the repaired §3.8. |
| 3.10 `splitTemperedBesselPrediction` | ggp Conjecture 17.1 and Theorem 17.2, p. 68, ggp line 2386–2405 | Correct distinction between the full prediction and the cited proven ranges. Ordinary unipotent coinvariants are not confused with the nondegenerate Whittaker quotient. |
| 4.1 `globalBesselPeriod` | ggp §23, pp. 86–88, ggp line 3036–3047 and line 3077–3093 | Correct rational quotient and cuspidal period. The package's inverse character in the integrand gives its declared right-translation covariance; the source convention is translated. |
| 5.1a `splitAdjacentWhittakerPeriod` | zhang-period Proposition 4.10, pp. 31–33, zhang-period line 1543–1568; Lemma 4.9, line 1523–1542; pairings at line 656–678 and local integrals at line 962–986 | Correct product of Whittaker pairings, opposite characters, raw Haar normalization and rescaling factors. The local L-value is nonzero under the separate tempered regularity contract. |
| 5.2 `normalizedLocalBesselPeriod` | bpcz §1.1.6, p. 4, bpcz line 159–169; harris pp. 2–3, harris line 75–111 | Correct inverse normalizer, pairing slots and restriction x≠0 for the ratio. No positivity is silently assumed from continuity. |
| 5.3 `normalizedLocalBesselPeriod_spherical` | harris §2, pp. 4–5, harris line 170–181; Theorem 2.12, p. 23, harris line 1289–1294; zhang-period line 675–678, line 982–986 and line 1543–1551 | Harris's odd-residue restriction is explicitly acknowledged. The split identity agrees with Zhang. The proposed nonsplit dyadic extension is owned here using all-residue supplier input; it is not directly certified by Harris. The retained factor is vol(K), not an automatic 1. |
| 5.5 `allPlaceBesselProduct` | bpcz equation (1.1.6.1) and Theorem 1.1.6.1, pp. 4–5, bpcz line 168–193; measures §2.3.2–3, p. 15, bpcz line 679–702 | Correct finite modification of a nonzero volume tail, with the measure comparison assigned to a declared contract. Finite zero factors are retained. No central Euler product is used to define this product. |
| 7.4 `ggp8UnitaryPeriodIdentity` | bpcz Theorem 1.1.6.1, pp. 4–5, bpcz line 179–193; component group at line 93–107; §10.3 proof, pp. 90–92, bpcz line 4865–4946 | Correct all-place tempered cuspidal hypothesis, full constituent sign group and reciprocal coefficient. Two total constituents give 1/4; three give 1/8. The package does not reproduce the reversed sign in the printed component-order sentence at bpcz line 4945. |

Additional spot checks included bp-refined Theorem 8.5.1 and its Fourier identity (bp-refined line 2855–2908), the full-H discriminant formula (bp-arch line 10204–10208), the small-residue fundamental lemma (bp-fundamental line 99–119), and finite-place versus dense archimedean transfer in bp-plancherel Theorem 5.3.1 (bp-plancherel line 4480–4491). The package retains the required enhanced-correspondence contract in the first comparison and the density qualification in the last.

### Adversarial statement table

Each numbered row includes the target's definition/convention, displayed identities and subordinate API assertions in that subsection. The API column makes this grouping explicit. The separate final six rows cover every retained Lean definition and all five admitted signatures. “Pass” means the listed adversarial instances and the stated hypotheses expose no additional defect; it does not certify an unformalized proof. “None” means no repair proposed, not an edit performed.

| Statement and associated API | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: fields, forms, translations, duals, measures | Zero ring and inseparable extension excluded by field/étale assumptions; analytic positive characteristic excluded explicitly; split algebra retained; q≥2; B(i,1)=i, B(1,i)=−i; upper-GL₂ modulus at diag(a,1) is abs(a) | Pass; algebraic all-field specialization distinguished from Hermitian characteristic ≠2 | None |
| 1.1 `RelevantHermitianPair`: mk, rank, isometryCongr, baseChange, frame_ext | W=0 with a line; r=1 gives rank difference 3; definite rank-three complement cannot be a hyperbolic plane plus line; split idempotent is nonzero but not a basis; identity/composite isometries | Pass; frame equality keeps every chosen datum, scalar extension keeps nondegeneracy | None apart from separate R03 |
| 1.2 `besselDatum`: embed, linearForm_mul, character_mul, r_zero, coordinate uniqueness | r=0 yields diagonal U(W), ν=1; r=2 includes both simple terms; split GL₃ coordinates retain both field factors; multiply two unipotents | Pass; additivity is on the simple-root quotient, not every matrix coordinate | None |
| 1.3 `besselTransport`: refl, trans, character, neg_real | Identity; two consecutive frame changes; simultaneous negative forms; changed additive character transported with the datum | Pass; fixed representations and an independently changed character are not falsely identified | None |
| 2.1 `besselModel`, multiplicity: mk, ext, congr, curry, eq_finrank | Trivial subgroup/scalar tensor; compact U(1) weights 1 and −1 versus 1 and 1; algebraic versus completed tensor; cardinal before finite rank | Pass; dual goes on the second representation; continuity/density are required at infinity | None |
| 2.2 `adjacentInvariantDistribution_symmetry`: square and subgroup | Rank-one commutative group; split GL₂ transpose; product of two noncommuting matrices reverses order | Pass; the identity map is not substituted for an anti-involution in the noncommutative case | None |
| 2.3 adjacent multiplicity bound | W=0 and U(1) character; ramified dyadic field; split real GL₂ restriction | Pass; admissible/Casselman–Wallach and irreducible hypotheses present | None |
| 2.4 nonarchimedean reduction: openOrbit, naturality | r=1 auxiliary GL₂; nonmaximal isotropic flag when W itself is isotropic; excluded support; normalized versus unnormalized induction | Pass; auxiliary support avoidance is an owned contract; the open orbit uses the inverse character with its stated adjunction | None |
| 2.5 archimedean injection: equivariant, injective | S=0, S one-dimensional and two-dimensional; common parameter for a finite basis; singular induction parameter excluded; opposite line sign | Pass; no unjustified common half-plane for the entire Hom space | None |
| 2.6 general multiplicity bound | W=0 Whittaker case; compact weight-1 negative control; r=0 and r>0; residue 2 and 3 | Pass; a hypothetical two-dimensional subspace contradicts the adjacent bound | None |
| 2.7 tempered integrability | Compact subgroup of mass a; split noncompact subgroup; trivial non-tempered representations would diverge; arbitrary fixed logarithmic power | Pass; temperedness prevents the noncompact counterexample | None |
| 3.1 epsilon character: generator, mul, ext, central | Empty smaller parameter gives epsilon 1; two generator values 1 and −1 multiply to −1; repeated constituent of multiplicity two has central coordinate zero but still has one generator | Pass; generator and multiplicity conventions agree | R04 test only |
| 3.2 enhancement transport | t a norm; t a nonnorm; applying the same sign change twice; even/odd rank determinant restrictions | Pass; Whittaker labels and represented pair are transported together | None |
| 3.3 tempered form: equivariant, congr, rank, adjacent, induction | H=1; compact incompatible weights give zero; r>0 needs regularization; full normalized induction versus choosing an arbitrary constituent | Pass; irreducibility is used only where rank-one is asserted | None |
| 3.4 geometric multiplicity: linear, delta, descent, induction | x=1 gives empty determinant 1; x=−1 on a line gives norm 4; zero quasi-character gives zero; no regular nilpotent orbit gives coefficient zero; nontrivial N in H | Pass; D_H includes N, so Δ=D_G D_H⁻² agrees with the determinant formula | None |
| 3.5 local trace formula and Lie version | W=0; real noncompact quotient; strongly cuspidal Schwartz test; a Levi GL factor contributes its germ coefficient | Pass; no unrestricted test space or unregularized r>0 integral is asserted | None |
| 3.6 packet Fourier identity | Order-two component group; μ=epsilon and μ≠epsilon; evaluate at identity | Pass; character orthogonality gives 1 and 0 with the correct reciprocal order | None |
| 3.7 nonarchimedean enhanced theorem | W=0; wrong enhancement; ramified dyadic case | Pass under the declared actual enhanced LLC; no freely chosen labeling stands in for it | None |
| 3.8 real theta reduction | V=⟨−1,−1⟩, W=⟨−1⟩, standard representation and weight 1; count (2,1) | Fail: m=0, but asserted reduction reaches its m=1 base | R01 |
| 3.9 real enhanced theorem | Compact interlacing weight −1 versus weight 1; simultaneous negative forms; W=0 | Endpoint passes; supplied source proves the statement, while the proposed §3.8 proof is defective | R01 proof repair |
| 3.10 split prediction: unfold, congr, singleton packets | Smaller rank zero; adjacent ranks; finite GL₃ distinct unitary characters give ordinary Jacquet dimension 6 and Whittaker dimension 1; higher real codimension | Pass; conjecture status and proven ranges remain distinct | None |
| 3.11 split generic nonvanishing | Adjacent generic pair at every place; nonarchimedean r=1; non-tempered generic pair using normalized continuation | Pass; no assertion that ordinary unipotent coinvariants are one-dimensional | R02 supplier imports |
| 4.1 global period: add, rightTranslate, r_zero, transport | r=0; ν(h)=i yields P(R(h)f)=iP(f); character nontrivial on rational points would not descend; rational isometry | Pass; rational triviality and cuspidal estimates are explicit | None |
| 4.2 local obstruction | One local model zero; two nonzero reference contractions scale by 2 and 3; nonzero global functional on dense pure tensors | Pass; nonzero global period forces every local model, not the converse alone | None |
| 4.3 tensor L-representation: restrict, isometry, local | Smaller degree zero gives L=1; degrees 2 and 1 give induced dimension 4; split local place gives the two conjugate tensor pieces | Pass; induction/restriction and local-to-global factors agree | None |
| 4.4 global conjecture: unfold, transport, localFailure | Central value zero with local models present; a local obstruction; arbitrary relevant r; fixed Hermitian form | Pass; the conjunction is not replaced by central nonvanishing alone | None |
| 5.1 normalizer: local, nonzero_local, central_zero, baseChange | n=1 gives L(1,η)ζ(2); split local η=1 has finite local factors for q>1; globally zero central value | Pass; local nonzero factor and possibly zero global numerator distinguished; central value never inverted | None |
| 5.1a split integral: nonzero, rescale | GL₂×GL₁; λ-kernel vector; Haar multiplied by 2; pairing multiplied by 3; normalized local test value 1 | Pass; raw diagonal factor is 6 times the original under combined rescaling | R02 supplier imports |
| 5.2 normalized local form: sesq, ext, nonzero_iff, source | Zero vector excluded from q; vector scaling cancels; both-slot tensor density; discontinuous algebraic functionals at infinity excluded | Pass; C_v and B(x,x) have nonvanishing justifications | None |
| 5.3 spherical identity and almost-everywhere corollary | Split Q₂, GL₂ Satake (1,−1) against trivial GL₁: C=3 and unit-hyperspecial raw integral 3; unramified nonsplit compact U(1) case; Haar scale 2; nonspherical representation excluded | Pass on tested instances; dyadic nonsplit general proof remains a new target | R02 supplier imports |
| 5.4 rescaling | Pairing scale 2 cancels in q; local H Haar scales 2 and 1/2 preserve product; global H scale 2 multiplies squared period by 4 | Pass; global G Petersson scale and global H measure are not conflated | None |
| 5.5 all-place product: finiteModification, enlarge, localZero, pairing | One finite zero; moving a good place of volume 2 into S; all reference volumes 1; arbitrary local pairing rescaling | Pass; no division by a zero local period | None |
| 6.1 Whittaker periods: lambda, beta, norm, eta, enlarge | n=1 gives the two opposite Asai signs; zero test vector; zero central value forces λ=0 while distinction β can remain nonzero; enlarge S by one good place | Pass; leading terms have the actual constituent pole orders and s=0 means L-argument 1/2 | R02 supplier imports |
| 6.2 relative characters: basis, positive, local, congr | Rank-one smoothing operator; P=0; rescale orthogonal basis; convolution square; local integral equals C_v times normalized form | Pass; trace-class/smoothing and continuous-period pairing are explicit contracts | None |
| 6.3 spectral contribution and star-generic predicate | Constituent counts (1,1) and (2,1); repeated constituents excluded; irrelevant star-generic datum contributes zero; full split centre retained | Pass; coefficients 1/4 and 1/8, no diagonal-sign quotient | None |
| 6.4 isolated comparison: measure, enlarge, detection | Inner-form family with zero transfer off the relevant form; no auxiliary supercuspidal place; enlarge S; detect a nonzero continuous distribution with dense archimedean matching tests | Pass; comparison is for the base-change class sum before isolation of a constituent | None |
| 6.5 relative-character Euler identity | One zero local character; nonzero local comparison constants with global product 1; change finite S | Pass; partial Δ factors and inverse sign-group order agree with source | None |
| 7.1 adjacent global nonvanishing | n=1; endoscopic constituents; central value zero; existence of a form versus every form | Pass; no temperedness or auxiliary-place hypothesis inserted; existential form retained | None |
| 7.2 stable global corollary | One constituent per degree; n>1 source range; n=1 handled by 7.1 | Pass; source-range corollary does not narrow the general theorem | None |
| 7.3 refined proposition: unfold, polarize, rescale | Nonzero pure tensors; zero local factor; clear positive norms before polarization; finitely many tensor factors changed | Pass; mixed identity uses compatible local pairings, not independently normalized mixed ratios | None |
| 7.4 period theorem: harris, stable, export | Central value zero; total counts 2 and 3; local measure/pairing rescalings; all infinite factors | Pass; the defined conjecture is the conclusion, not a hypothesis | None |
| Lean `splitLineFrame` and `splitLineFrame_iff_norm_ne_zero` | Any field, including characteristic 2; (1,1), (1,0), (0,0), and rational (2,1) | Signature true; existing tests miss norm different from 0 and 1 | R03 |
| Lean `linearFirstPairing` and its native API | Scalars i and 1 in both orders; arbitrary scalar c; zero arguments; incomplete inner-product space | Pass; no completeness is needed or silently dropped | None |
| Lean `algebraicBesselModel` and `_equivariant` | Arbitrary group, trivial action, multiplication intertwiner; fixed tensor with target action −1 | Pass; no topological claim is made, and all module/group binders are explicit | None |
| Lean `componentCentralElement` and `_character` | Empty index; singleton multiplicity 2; two multiplicities 1; sum character | Signature true; test of the sum character absent | R04 |
| Lean `unitaryConstituentSigns` and `_card` | Finite counts (1,1), (2,1), (0,0) give 4,8,1 | Pass; required finite hypotheses explicit, empty type allowed | None |
| Lean `unitaryConstituentCoefficient` and `_eq` | Same counts give 1/4,1/8,1; group always has identity | Pass; denominator nonzero, no 0/0 and no quotient by the diagonal centre | None |

### Duplication by object

The pinned-library search used forms and complements, units in products, tensor representations and intertwiners, inner products, component functions, finite cardinalities, Bessel models/periods, relative characters and unitary period formulas. Native APIs are imported or specialized, rather than reconstructed as general infrastructure. In particular:

| Object | Pinned owner inspected | Assessment |
| --- | --- | --- |
| Nondegenerate forms and orthogonal complements | `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:595`, `LinearMap.Nondegenerate`; `Mathlib/LinearAlgebra/SesquilinearForm/Orthogonal.lean:48` and line 54 | The package does not replace these. Arbitrary-form representable unitary groups and Witt comparisons are assigned to their supplier. |
| Standard unitary matrix group | `Mathlib/LinearAlgebra/UnitaryGroup.lean` | The standard Gram-matrix carrier is not claimed to supply every Hermitian inner form. |
| Tensor representations, duals and intertwining maps | `Mathlib/RepresentationTheory/Basic.lean:618`, line 626 and line 670; `Mathlib/RepresentationTheory/Intertwining.lean:36`, line 53 and line 87 | The algebraic Bessel abbreviation uses these exact objects. Its covariance target specializes the API to the roadmap's character convention. |
| Product units | `Mathlib/Algebra/Group/Prod.lean:615`, `Prod.isUnit_iff` | `splitLineFrame` is an explicit light specialization; its test concerns the split-line basis condition. |
| Finite function/sum cardinalities | `Mathlib/SetTheory/Cardinal/Finite.lean:217` and line 242, `Nat.card_sum` and `Nat.card_fun` | Sign-group cardinality is a permitted short specialization; no general cardinality library is replanned. |
| Algebraic-group points and their functoriality | `TauCeti/Algebra/AlgebraicGroup/PointsFunctor.lean:150` and surrounding `TauCeti.HopfAlgebra.pointsFunctor` API | Cited points construction exists; the package adds its relative subgroup, not a second points functor. |
| General local Rankin–Selberg normalization and nonvanishing | AutomorphicLFunctionsAndLocalFactors §AL.3, targets `rs-local-factor`, `normalized-rs-period` | Repeated in the gap: R02. |

Searches of the main and completed roadmap trees and board packages found no existing owner of this entire roadmap and no second ownership of its GGP endpoints. ClassicalGroups' finite branching targets are different objects. The neighboring TwistedAutomorphicDescents design assigns Bessel models and the present periods to this roadmap; the relevant ModularityAndLanglandsExtensionsPartII and quantitative-orbit material does not already state these endpoints. The existing AutomorphicSpectralTheoryPartII design was also checked for its multiplier/isolation scope; the package requests its precise transfer-compatible interface rather than developing another general multiplier library.

README and Lean object searches were also performed at each of the seven requested open heads, not just their board copies:

| Roadmap | Head inspected | Relevant duplicate |
| --- | --- | --- |
| QSeriesPartitionsAndMockModularForms | `8fe91e0905291e2ed941f90e1d4bcaaceb3ce96e` | None found |
| K3SurfacesAndSymplecticBoundedness | `b82cbb70e85924d052746bdfe84156c20d8e201f` | None found |
| CohomologyComparisonsPartII | `dd8d7e6fda7516b9ab6806d5d75f5202332851c7` | None found |
| ColemanIntegrationPartII | `bd972d91ed7d5d8bd3dd2e7ee84b35853db32ba4` | None found |
| QWittVectors | `4605fbb0a2d9279b561f9467ab5cce09d7f2469e` | None found |
| ErdosProgressionPowers | `72b615703f7fc5d175e519ddbb6e589d3d744c6c` | None found |
| ArithmeticDynamics | `85e78c07dcc361ead6505c970a1181deee483819` | None found; README's local blob equals the remote head blob `3e4384e92a463308a56d1d38dd9c0ba4e5b94339` |

### Supplier direction and declared gaps

The prescribed dependency command completed successfully with exactly:

```text
depcheck: 8 roadmaps, 57 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Every `*Needs:*` line and supplier citation was read. Internal target references point to existing earlier targets. The mechanical check is supplemented by the following manual gap audit, since it does not by itself expand all prose contracts.

All 36 gap slugs agree between the README and the plan's top-level gaps. All have a named owner; none has supplier `none`. Every named owner is earlier than this roadmap, which occupies position 149. The one ordinary-endoscopy wording difference between the plan and README is synonymous, not a changed contract. These contracts are treated as prerequisites awaiting supply, not as falsely implemented theorems. Apart from R02, no additional vague, unowned or already-provided gap was established.

| Supplier and order position | Gap slugs checked | Section/ownership result |
| --- | --- | --- |
| ReductiveGroupsPartII, 20 | `hermitian-unitary` | RG2.4 exists; arbitrary-form Hermitian continuation is explicitly a supplement, not falsely attributed to its existing decomposition material. |
| SmoothRepresentationsOfLocalGroups, 21 | `local-categories`, `local-bernstein`, `local-mirabolic`, `gl-tempered-genericity`, `local-jacquet-filtration`, `local-spherical` | SR.0.4, SR.2.1–2.3, SR.3.1–3.3, SR.4.1–4.2 and SR.5 exist. Restriction/duality, support avoidance, mirabolic, all-place genericity, exact Jacquet comparison and all-residue Haar normalizations are expressly specified supplements. |
| AdelicAlgebraicGroups, 29 | `adelic-measures` | §§0.3, 1.2–1.5 and 2.2–2.5 exist. Their quotient/Tamagawa infrastructure is consumed; the BPCZ convergence-factor comparison is the additional contract. |
| AutomorphicFormsOnReductiveGroups, 59 | `archimedean-globalization`, `archimedean-generic-induction`, `archimedean-seminorms`, `automorphic-realization` | §§0.1–0.5, 2.3, 2.7, 3.4–3.5 and 4.2 exist. Nuclear globalization, smooth factorization and cuspidal carriers are distinguished from the requested relative tensor/dual, parameter-family and restriction estimates. |
| AutomorphicLFunctionsAndLocalFactors, 73 | `factor-epsilon-identities`, `tempered-local-regularity`, `hermitian-global-values`, `local-rankin-selberg`, `whittaker-pairing-fourier`, `global-mirabolic-norms` | AL.0–AL.5 exist. Unit-specific signs, factors and leading coefficients are explicit; the local Rankin–Selberg request is not minimal: R02. |
| AutomorphicSpectralTheory, 75 | `distribution-gk`, `local-schwartz-germs`, `local-tempered-bounds`, `local-plancherel`, `local-fourier-extension`, `local-smoothing-trace`, `automorphic-spectrum`, `spectral-isolation` | Base Layers 0–4 and 6 and the requested Part II direction are identified. Local distribution/analytic extensions are not misrepresented as present base sections. SM.0–SM.5 are present in the Part II design; exact placement/import and transfer-compatible isolation remain the declared contract. |
| EndoscopicTransferAndUnitaryTraceComparison, 111 | `ordinary-endoscopy`, `relative-geometric-comparison`, `relative-finite-transfer`, `relative-archimedean-transfer`, `relative-fundamental-lemma`, `relative-character-comparison` | Base Layers 2–5 and §§11.2–11.4 exist; their conditional classification does not substitute for ordinary geometric transfer or the explicitly requested relative Part II continuation. |
| MetaplecticAutomorphicForms, 112 | `real-oscillator-model`, `real-small-theta` | §§0.18, 3.3–3.6 identify the existing oscillator/theta direction. The real signature/enhancement and overlap-estimate supplements are owned. Their signature conditions do not justify the unconditional lifts of R01. |
| ModularityAndLanglandsExtensions, 148 | `enhanced-packets`, `global-parameters` | §§3.13, 3.15, 3.20, 5.1 and 5.4 exist. Their conditional or different-group classifications are distinguished from the requested actual unitary correspondences and base change. |

No ownership move to a later roadmap is required by the findings. The repair to R02 imports an earlier owner's existing targets. Gap announcements are outside this read-only review.

### Lean elaboration and signature inspection

The requested `lake env lean` invocation on `packages/GanGrossPrasadUnitaryGroups/Suggested.lean`, run from the content checkout, exited 0. Its only diagnostics were five `declaration uses sorry` warnings, at lines 25, 72, 119, 150 and 173. There were no other warnings or errors. No Tau Ceti module is imported, so no object-file build was needed; no Lean process remains running.

The file has a single `import Mathlib`, the required namespace/module documentation, six real-bodied definitions/abbreviations, five admitted theorems and twelve proved examples, with two examples per definition. All required field, group, module, finite-type and inner-product binders occur explicitly in the relevant signatures; there is no ambient `variable`/`include` hypothesis-loss problem. No admitted example, opaque data placeholder, empty proposition field, `True` surrogate, `#eval`, `#synth` or `#print axioms` occurs. All Lean declaration names are represented in the README. Heavy analytic endpoints correctly remain README targets on carriers that the contracts must supply. R03–R04 concern the content and coverage of proved examples, not elaboration.

The manifest pins agree with the inspected libraries: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Metadata is the single topic `math.NT`.

## Not verifiable

- `xue-bessel` is recorded as **waived** in `packages/GanGrossPrasadUnitaryGroups/sources.toml:31`, with its introduction locator marked unverified at line 29. It is a settled waiver and supports no active theorem in the package. Its contents were not guessed, fetched again or added to a missing-reference request. No other active author-marked unverified locator was found.
- The general nonsplit dyadic spherical calculation in §5.3 is a proposed extension, not a theorem proved in Harris's odd-residue text. Its stated ownership, dependencies and low-rank controls were checked; a complete proof of that extension cannot be certified by this locator sample. This is not a finding that the explicit extension must be removed or narrowed.
- Xue's OCR extraction has damaged symbols in some dense intermediate formulas. The sampled theorem statements, the nonzero-lift conditions in Lemmas 3.8–3.9 and the proof's case structure are readable. This review does not certify every oscillator-coordinate formula in that article.
- Declared supplier contracts remain contracts: this review does not claim their future implementations exist or are proved. Their present absence is not counted as a finding. All 16 certified source texts listed in the brief were available; no additional missing text or source fetch was required.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "008967367b232cf08eb4e766dd25aa7f1bd515c2", "job": "REV-PKG-GanGrossPrasadUnitaryGroups", "model": "gpt-6-astra", "worker": "chris-3"} -->
