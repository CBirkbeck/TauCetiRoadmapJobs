<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/521#issuecomment-6311935982 -->
Review (codex) of cefa34d

Verdict: needs_changes

1. **F01** (P1) The connected induction reductions have no supplier

   **Location:** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/plan.json:2634`, `"supplier": "none"`; `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:105` and §4.8 at line 469.

   **Claim:** The four-case selection reduction consumes the SO version of the orthogonal induction comparison and the skew-unitary Fourier–Jacobi comparison through `gap:connected-reductions`. Calling them locally owned proof obligations does not give either a target.

   **Witness:** Plan line 2634 assigns no supplier. Sections 3.3–3.4 supply O/U Bessel and symplectic Fourier–Jacobi comparisons, respectively. The different cases used by §4.8 occur at ggp line 2661 and ggp line 2699.

   **Exact repair:** Replace this gap with two named theorem targets owned here, before §4.8: the connected SO Bessel induction comparison and the skew-unitary Fourier–Jacobi induction comparison. State their groups, representations, Bernstein exclusions, induction normalization and splitting/character identifications explicitly. Give their proof routes, source locators and negative-control Checks. Replace every use of this gap with the appropriate target, including the plan and layer dependencies. Do not infer the SO result merely by replacing O with its identity component.

2. **F02** (P1) A nonzero split-algebra functional need not define a Heisenberg quotient

   **Location:** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:207`: “along a nonzero functional X → A”; matching plan target 2.2.

   **Claim:** For every such functional the construction is a central quotient onto `Heis(W,b0)`, suitable for the oscillator pullback.

   **Witness:** Let A = F × F, X = A and ℓ(x) = (1,0)x. Then ℓ ≠ 0, but its image is proper. Moreover ℓ(x)·conjugate(ℓ(y)) = 0, so the stated central map is zero.

   This example satisfies the present field, étale-algebra and freeness conditions. Take nonzero free skew-Hermitian W and V = X ⊕ W ⊕ X∨. The vector image is (1,0)W, not W; the center is killed. Thus the map is not the claimed quotient. The field argument in ggp line 1683 and ggp line 1723 cannot be extended by retaining only “nonzero.”

   **Exact repair:** Require an A-linear surjection X → A, equivalently a unimodular functional, with the compatible flag. For split A require both component functionals to be nonzero. Prove surjectivity of the vector and central maps and use those results in §2.3. Add the idempotent functional above as a rejected-input Check and a surjective split functional as a positive Check. Keep the separate X = 0 branch and the full split-algebra scope.

3. **F03** (P2) Split Bessel data can produce a degenerate character

   **Location:** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:191`: “choose e ∈ L nonzero” and “all additive characters used are continuous unitary and nontrivial”; line 195 claims conjugacy. Matching plan target 2.1.

   **Claim:** These hypotheses give the generic Bessel character and its change-of-data conjugacy, including the split GL comparison.

   **Witness:** For A = F × F, take e = (1,0)e₀ in a free residual line. Alternatively take ψ(x,y) = ψF(x). In the W = 0, rank-A V = 3 split model, one simple-root character vanishes.

   A character of the upper unipotent subgroup of GL₃ that is trivial on one simple-root subgroup is not conjugate as a subgroup-character pair to a generic character nontrivial on both. Nonzero elements of an A-line need not generate it; nontrivial characters of A need not see both factors. The split construction explicitly requires both residual components at ggp line 1944–1945, followed by generic flag data at ggp line 1952.

   **Exact repair:** Require e to generate the residual A-line, with its unit norm consequence, and require ψA to be nontrivial on each simple factor. Equivalently specify ψA(x) = ψF(Tr(c x)) with c ∈ Aˣ and ψF nontrivial. State the resulting nonvanishing of every simple-root coordinate before proving conjugacy or §1.4's character comparison. Add separate rejected-input Checks for the idempotent vector and the projection character, and a GL₃ positive control with both coordinates nonzero.

4. **F04** (P2) Supplier gaps bundle independent contracts and omit hypotheses from `needs`

   **Location:** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:71`–101; the nine named-supplier entries in `packages/GanGrossPrasadConjecturesForClassicalGroups/design/plan.json:2443` onward. For example line 2622 requests “smooth transfer … dense archimedean transfer … unramified fundamental lemma and spherical base-change homomorphisms.”

   **Claim:** Each of these entries is an exact, minimal contract suitable for intake as one missing prerequisite.

   **Witness:** `gap:trace-transfer` combines distributions, transfer, a fundamental lemma and base change; its `needs` omits the relative-character constants required in `detail` at plan line 2621 and README line 81. Comparable independent bundles occur in all nine named gaps.

   Absence of the named suppliers is not the finding. The defect is the compound contract and the mismatch between the one-sentence announced `needs` and the actual proof inputs. In particular the parameter laws, convergence domains and normalization conditions cannot be replaced by subject names.

   **Exact repair:** Split these into independently checkable contracts, retaining the assigned earlier suppliers, and put the exact inputs, hypotheses and output in each `needs`. Mirror every new slug in README, plan and consuming prerequisites. The following separations identify the minimum distinctions to preserve; they are not new mathematical targets for this roadmap.

   | Existing gap | Independent outputs to separate and make precise |
   |---|---|
   | classical-forms | Hermitian form operations/Witt comparison; classical group schemes and points; flag/parabolic comparison; marked pure-inner-form classification. Reuse the pinned quadratic specialization. Include R05's missing SO interface. |
   | local-categories | Smooth categories and functors; Casselman–Wallach/tensor topology; normalized and unnormalized induction/Jacquet reciprocity; Bernstein exclusions; distribution descent/Gelfand–Kazhdan inputs. The latter inputs are currently outside `needs`. |
   | parameters | Weil/L-group carriers; local enhanced classification with its normalization and change laws; global base change and discrete Arthur multiplicity. Explicitly include STAB, TRANS and WHITT with their domains. |
   | local-factors | Local factor laws and character changes; local tempered regularity/nonvanishing; global completed factors/adjoint nonvanishing and Asai identification. Reuse the pinned Hilbert symbol. |
   | weil-theta | Heisenberg/Stone–von Neumann; covers, splittings and oscillator models; global theta realization/convergence; Howe/seesaw and precise P1/P2 formulas; generic standard-module criterion. Resolve R06's duplicate ownership. |
   | adelic-measures | Group adelic points/rational diagonals; quotient integration with finite-volume hypotheses; differential measures and exact global/local Tamagawa normalization, over the stated global fields. |
   | automorphic-realizations | Ordinary/genuine cuspidal realizations and tensor factorization; Petersson pairings; growth estimates sufficient for the specific Bessel and theta integrals, including center conventions. |
   | spectral-isolation | Local tempered estimates; convolution/trace and basis-sum convergence; Eisenstein/regularized-period interfaces; endoscopic cuspidal isolation without the split-supercuspidal restriction. |
   | trace-transfer | Actual trace distributions; finite-place transfer including dyadic places; dense continuous archimedean transfer; spherical transfer/base change; normalized local relative-character comparison and the product-one law. |

5. **F05** (P1) The cited orthogonal supplier does not supply the consumed general interface

   **Location:** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:59`: “Arbitrary quadratic-form SO, its local topological points and adelic points”; §1.2 at line 136 consumes flag parabolics and their radicals. The classical-form gap at line 71 explicitly names symplectic and unitary group schemes.

   **Claim:** OrthogonalSpinGroups Layers 0, 2–3 supply the orthogonal group interface at this design's arbitrary-field, all-local-field and algebraic-group generality.

   **Witness:** `TauCetiRoadmap/OrthogonalSpinGroups/README.md:597` restricts Layer 2 to ℝ or ℚ_p. Lines 753–758 explicitly leave the SO group-scheme/point comparison outside that roadmap; Layer 3 constructs point groups only.

   A finite extension of ℚ₂ different from ℚ₂ is already outside that Layer 2 scope. The present roadmap also needs the scheme whose flag stabilizer and unipotent radical yield its relative subgroup. Generic affine-group infrastructure is not an identification of the arbitrary-form SO point group with that scheme.

   **Exact repair:** Narrow the citation to the point-group declarations actually supplied. Declare a precise extension contract for arbitrary nondegenerate quadratic-form SO group schemes, their identification with the existing point groups, and the required local topology/base changes. Assign it to an earlier named owner, for example ReductiveGroupsPartII as an explicit extension of the existing point-group theory, and record the ownership allocation. Put this gap in §1.2 and all other consumers. Do not silently import the unbuilt successor mentioned by OrthogonalSpinGroups or restrict GGP to ℝ and ℚ_p.

6. **F06** (P2) P1 has two owners

   **Location:** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:89` assigns enhanced theta “P1/P2 formulas” to MetaplecticAutomorphicForms; line 524 makes P1 an output of `GGP.unitaryThetaBesselJacobiBridge`, and line 526 says “recover P1.” Matching plan target 5.4 and `gap:weil-theta`.

   **Claim:** The general enhanced equal-rank theta formula is both supplied and proved here.

   **Witness:** README line 89 imports P1, while lines 524–526 prove P1 from B and P2. Gan–Ichino Proposition 1.2 has both outputs, but importing that proof pattern does not resolve the two-owner design.

   **Exact repair:** Keep general enhanced theta formulas with MetaplecticAutomorphicForms. Restate the local bridge here as the relative Fourier–Jacobi selection implication using the precise supplied theta formulas and seesaw comparison. Remove P1 as a newly owned conclusion/proof obligation from the README and plan. If the supplier proof needs Bessel selection, split its upstream theta input from that downstream consequence and explicitly place ownership after the Bessel theorem; do not introduce a supplier cycle. No change to the full generic Fourier–Jacobi endpoint is needed.

7. **F07** (P2) Local relative distributions use a normalized form outside its stated domain

   **Location:** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:797`: “identify their local analogues `J_v`(fv) = `sum_e` `alpha_v`(`sigma_v`(fv)e,e).” The hypotheses require actual cuspidality but not local temperedness or the domain of §7.5. Matching plan target 8.1.

   **Claim:** All the displayed local sums are defined and continuous under the global hypotheses of §8.1.

   **Witness:** Section 7.5, README line 726, defines alpha only with absolute convergence and a finite nonzero normalizing quotient. At bpcz line 4866 and lines 4883–4884 the local trace construction explicitly uses everywhere temperedness.

   Actual global cuspidality is not an available theorem of local temperedness. As a local negative control, trivial representations on a split noncompact diagonal give a constant matrix coefficient whose integral over Fˣ diverges; smoothness or unitarity alone cannot discharge the missing condition.

   **Exact repair:** Separate the globally defined cuspidal distributions from their normalized local counterparts. Give the local branch explicit temperedness and the normalization domain, citing §7.6 for convergence, trace estimates and nonvanishing. Alternatively state each necessary analytic hypothesis explicitly. Retain the broader global branch needed for §8.4. Carry the domain into the local rank-one API and add a rejected divergent-input Check.

8. **F08** (P2) Relative-character factorization omits the ambient convolution measure

   **Location:** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:853`: “Tamagawa global measures and local measures factoring the diagonal Tamagawa measure”; the same issue enters the local convolution in §8.1. Matching plan targets 8.1 and 8.5.

   **Claim:** The displayed identity with precisely §7.8's scalar holds for every decomposable Schwartz function under the given measure conditions.

   **Witness:** Keep all H-measures fixed and multiply one G(Fv) convolution Haar measure by 2. Then sigma_v(fv), hence a nonzero J_v(fv), doubles. J_sigma and the stated scalar are unchanged; the listed H-factorization still holds.

   The measure used to integrate a test function into an operator is on G, distinct from the H-measure in alpha. The source fixes both: bpcz line 679–700 gives the global/local normalization, line 4879–4883 specifies the convolution, and line 4891 includes compensating test-function factors. Merely citing the H spherical volumes does not determine this normalization.

   **Exact repair:** Define local and global convolution measures explicitly and require a compatible factorization of the ambient G Tamagawa measure as well as the H measure. With product-normalized G measures, state the factorization in that convention and show its conversion from the cited source. If retaining source differential measures, include their exact global convergence/leading-value correction in the test tensor or identity. Add the single-place G-rescaling negative control and the compensated two-place positive control. Propagate the convention to §8.1's rank-one extraction.

9. **F09** (P3) Tempered Bessel selection needs its primary theorem locator

   **Location:** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:487` cites Gan–Ichino's recollection; line 489 acknowledges that the full trace proof is elsewhere. Matching plan target 5.1.

   **Claim:** The supplied citation is enough to locate the primary proof of the full epsilon-labelled tempered selection theorem.

   **Witness:** gan-ichino line 78 and line 2494 recall Beuzart-Plessis. The primary epsilon-labelled result is bp-refined line 2891, Theorem 8.5.1, printed p. 71; its packet normalization is specified at lines 2891–2901.

   **Exact repair:** Cite the legally fetched version `bp-refined`, Theorem 8.5.1, printed p. 71 (extraction page 72), with its setup on printed p. 70 and §§7.2, 7.7, 8.3. Explicitly bind its classification/normalization inputs to the parameter contracts. The unlabelled uniqueness precursor is `bp-unitary-tempered`, Theorem 18.4.1, line 5429; it alone does not identify the epsilon label. Retain Gan–Ichino for the generic reduction. Add the primary citation to References and the target locator. Both primary works were fetched through the sources service and appended to the manifest without changing original entries.

10. **F10** (P3) Ordering reservations are presented as mathematical scope

   **Location:** `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md:11`: “SelmerIwasawaCohomology is an ordering reservation, not a mathematical period input.” The preceding sentence discusses an unverified contract by roadmap name.

   **Claim:** These process reservations belong in a timeless mathematical README.

   **Witness:** The dependency gate places the candidate after AutomorphicGaloisRepresentationsPartII, although line 11 explicitly supplies no mathematical contract from that roadmap. The sentences describe scheduling and certification rather than a consumed object.

   **Exact repair:** Delete the two reservation sentences from mathematical scope. Keep genuine downstream consumers in their designated section and genuine supplier contracts by object. Record any scheduling reservation outside the README, in the worker's review/intake metadata. Rerun the dependency gate after the edit; no earlier supplier should be added merely to force a position.

Independent reviewer: `independent-review-REV-DESIGN-GanGrossPrasadConjecturesForClassicalGroups`. Date: 2026-10-21. Ten findings: three P1, five P2 and two P3; eight blocking. There is no previous review to reconcile. The design is repairable within its stated scope; it does not require rejection or a replacement roadmap.

## Verified sound

The review covered all 48 numbered targets, their 78 named API statements, 129 Checks, 48 target-level `Needs` lines, eight layer dependency lists, and ten declared gap records. All 24 definitions/constructions have named API entries and at least three Checks. All plan target/API/Check names occur in the README. The internal prerequisite identifiers resolve and point to earlier targets. These counts establish coverage, not proofs of the proposed mathematical theorems. The adversarial results below include the defects and qualifications above.

The scope is a general relative classical-group library. It includes split algebras, arbitrary permitted codimensions, dyadic places and ramification, and distinguishes characteristic two from residual characteristic two. No “good primes only” shortcut, computational algorithm, copied source passage, or attempt to turn a conjecture into an unconditional theorem was found in the inspected design. Mathematical use of “packet” is necessary here and is not treated as process language. There is no existing main-branch GGP roadmap being re-planned. R06 concerns a specific duplicate output, not the whole roadmap.

The conventions correctly compute unhalved polarization B(1,1) = 2, alternating orientation (1,−1), Hermitian dual scaling by conjugate(a) inverse, cancellation of two genuine signs, the mu inverse twist, squared-norm scaling by 4 for scalar 2i, and component factors 1/4 and 1/8. Positive-characteristic local fields are not silently included in the characteristic-zero uniqueness theorems. The field assumptions exclude the zero ring, inseparable quadratic algebras, q = 1, and characteristic two; none is used as an artificial counterexample. Rank zero is retained where meaningful, while n ≥ 1 is explicit at the proved unitary global endpoints.

### Seeded source verification

All ten originally recorded source texts were legally available and read at the requested locators. No target was marked with an unresolved locator verification flag. The reference to unverified *published pagination* for Ichino–Ikeda is resolved by explicitly using the recorded author revision; it is not a claim to have checked the journal pagination. The table records all 15 seeded targets, with page numbers in the recorded version and extraction-line witnesses. Two additional primary works were fetched add-only for §5.1.

| Target | Text checked at its locator | Hypotheses and outcome |
|---|---|---|
| 1.4 Split quadratic-algebra comparison | ggp §2 p. 6, line 203; §13 pp. 53–56, line 1893 and line 1944 | Perfect pairing gives the inverse-dual GL factor; rank is not doubled. Group comparison is supported. The proposed relative character/quotient comparison inherits R02–R03's missing split-data hypotheses. |
| 2.3 Oscillator restriction and auxiliary data | ggp §12 pp. 49–52, line 1761, line 1796, line 1823 | The flag character, diagonal pullback, genuine sign and unitary splitting character are present. Codimension zero retains the oscillator representation. The generalization depends on correcting §2.2, not on replacing the oscillator by a trivial representation. |
| 3.1 Nonarchimedean basic uniqueness | ggp Theorem 14.1, pp. 58–59, line 2068; waldspurger Theorem 1 p. 1, line 10; sun Theorem B pp. 1–2, line 31, and Theorem C p. 3, line 102 | Characteristic-zero nonarchimedean hypotheses, including residual characteristic two, agree. Waldspurger supplies SO; Sun supplies the later full Fourier–Jacobi result. The older qualification in GGP is not incorrectly used as the only support. |
| 3.2 Archimedean basic uniqueness | sun-zhu Theorems B–C, pp. 2–3, line 55 and line 80 | The real/complex group lists, Casselman–Wallach category and continuous functionals agree. Low-rank and genuine-cover cases were checked against those lists. |
| 3.5 General multiplicity assertion | ggp §14, unnumbered multiplicity conjecture, p. 58, line 2064 | This is a proposition specifying the conjecture, not its proof. The broad field range is not attributed to the characteristic-zero theorems. |
| 4.6 Local selection propositions | ggp Conjectures 17.1 and 17.3, pp. 68–70, line 2386 and line 2479 | Actual generic enhanced packets, relevant inner forms, uniqueness and the explicit character are required. Neither existence nor the enhancement is assumed in the input. |
| 5.1 Tempered unitary Bessel selection | gan-ichino §1.3 p. 2, line 78; §3.2 pp. 10–11, line 437; §9.3 p. 50, line 2494; additionally bp-refined Theorem 8.5.1, printed pp. 70–71, line 2877 and line 2891 | The recalled theorem has the claimed nonarchimedean characteristic-zero, all-residual-characteristic range. R09 supplies the primary locator; its precise parameter/normalization assumptions must be contracted under R04. |
| 5.5 Generic unitary Fourier–Jacobi parameters | gan-ichino Theorem 1.3 p. 3, line 119; Corollary 1.4 p. 4, line 141; Proposition 9.2 p. 50, line 2476 | Generic rather than just tempered parameters, compatible psi/mu and the higher-codimension reduction agree. The reduction still needs R01's actual skew-unitary target and R06's ownership repair. |
| 6.3 Central L-value representation | ggp Lemmas 3.4–3.5 p. 12, line 424 and line 434; §23 p. 86, line 3019; §24 pp. 89–90, line 3151 and line 3184 | Tensor signs and induction preserve the asserted symplectic type. The global symplectic expression does not append the local metaplectic trivial line. The split unitary expression pairs dual factors, giving the asserted squared absolute value. |
| 6.4 Classical global nonvanishing proposition | ggp Conjecture 24.1 p. 90, line 3175 | Everywhere tempered/multiplicity-one setup and the local/global nonvanishing clauses match. The analytic regularity is an explicit hypothesis, and the assertion remains a conjecture proposition. |
| 7.1 Orthogonal factors | ichino-ikeda §1 p. 4, line 138 and line 145; continuation at line 209 | Odd/even dimension and discriminant factors agree. The design's meromorphic s-family is an explicit extension of the displayed constants, not a claimed verbatim theorem. The split binary pole is retained instead of evaluating a singular quotient in a field. |
| 7.7 Vector, pairing and measure invariance | bpcz §1.1.6 pp. 4–5, line 160 and line 179 | Direct calculation gives 4 for both squared quantities under 2i; local pairing scaling cancels in alpha/norm. Finite reciprocal H-measure rescaling preserves the product. This does not fix the distinct ambient G-measure issue R08. |
| 7.8 Global constant | bpcz §1.1.2 p. 3, line 93; §1.1.6 pp. 4–5, line 148 and line 179 | The endoscopic factor counts r_n + r_(n+1), all completed factors are retained, and the two Asai signs are distinguished. The denominator has an explicit regular nonzero contract; a zero central numerator is allowed. |
| 8.5 Factorization | bpcz §§10.3.1–10.3.5 pp. 90–92, line 4866, line 4889, line 4917, line 4931 and line 4939 | Temperedness, strong base change, zero local-model branch, uniqueness across inner forms and product-one comparison constants are present. R08 is necessary to convert the source's precisely normalized test tensors to the displayed unrestricted tensor identity. |
| 8.7 Stable specialization | bplzz Definition 1.5 p. 3, line 127; Theorem 1.8 p. 4, line 157; Theorem 1.10 p. 4, line 185 | n > 1 and the stable cuspidal/base-change hypotheses are retained. The source's opposite-sign Asai regularity is not confused with the Hermitian pole-sign condition. No endoscopic-only term is lost in the specialization. |

Additional source checks covered the non-sampled induction reductions and determinant characters (ggp line 720, line 780, line 2158, line 2293 and line 2655), the standard-module comparison (gan-ichino line 2502), all-place tempered inner-form uniqueness (bp-arch line 11119–11205, Theorem 12.4.1), orthogonal local/refinement domains (ichino-ikeda line 234, line 252 and line 395), unitary convergence and spherical bad sets (harris line 170, line 250 and line 1289), the five isolated-transfer conditions (bpcz line 4712–4767), and the endoscopic endpoint (bpcz line 124 and line 179). The general multiplicity and orthogonal refined conjectures remain assertions; the global endoscopic and refined unitary theorems keep their different hypotheses.

### Adversarial mathematics pass

Each row covers the named target, its attached API and its Checks. “No additional defect” means the stated domain survived the indicated paper calculations and source comparison; it is not a Lean proof or certification of the absent supplier developments. R04's precise-contract repair applies throughout. Incompatible examples such as a zero ring, inseparable quadratic extension or characteristic-two field are rejected by the common hypotheses. All conventions were also checked against the opening scope, not just individual target sentences.

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| 1.1 RelevantPair and four API laws | Zero symmetric/skew modules; anisotropic real line; positive real plane; definite skew-Hermitian plane; hyperbolic complex dual scaling | Parity and isotropy distinguish the intended cases; identity/isometry transport and witness independence have the stated domain. | No additional defect. |
| 1.2 Relative subgroup and embedding | Complement rank 0/1; n = 1 unipotent; product of two semidirect-product elements | Diagonal boundary and (n i(g),g) orientation agree; general SO scheme comparison is missing. | R05. |
| 1.3 Relevant inner forms | Identical marked twist; same dimensions but different complement; rank-zero W | Complement markings prevent the false dimension-only identification. | No additional defect. |
| 1.4 Split comparison | Split line acted on by a and a⁻¹; rank zero; split rank-three Bessel case | Group comparison works; degenerate auxiliary data break the claimed relative comparison. | R02–R03. |
| 2.1 Bessel character and conjugacy | r = 0; two coordinates 1 and −1; projection character and idempotent residual vector | Empty character and sum sign are correct; nonzero data need not be generic over F × F. | R03. |
| 2.2 Heisenberg quotient and commutator | X = 0; W = 0; alternating plane with B(e,f) = 1; ℓ = multiplication by (1,0) | Commutator factor 2 is correct over F; split ℓ has zero central map and proper vector image. | R02. |
| 2.3 Oscillator restriction | V = W; central involution on genuine/nongenuine tensor; splitting-character twist | Zero-codimension branch and sign product (−1)(−1) work; underlying quotient requires repair. | R02; preserve these controls. |
| 2.4 Model and six API laws | Trivial group; zero representation; infinite-dimensional smooth input; genuine Mp₀ sign | Cardinal dimension avoids false finite-dimensionality; continuous and algebraic duals are separated. | No additional defect. |
| 3.1 Finite-place basic uniqueness | ℚ₂ and ramified extensions; zero smaller rank; characteristic-p input | Dyadic fields included; characteristic-p is outside the theorem, not smuggled into the proof. | No additional defect. |
| 3.2 Infinite-place basic uniqueness | ℝ, ℂ; p or q = 0; trivial small group; genuine cover | Continuous Casselman–Wallach Hom is the relevant carrier; supported group list retained. | No additional defect. |
| 3.3 Bessel induction reduction | Empty inducing blocks; Bernstein collision; O versus SO | Exclusion is necessary and O cannot silently become SO. | Supply separate SO target, R01. |
| 3.4 Fourier–Jacobi induction reduction | Genuine central sign; empty flag; support collision; skew-unitary substitution | Symplectic reduction is scoped correctly; skew-unitary analogue is not supplied by substitution. | R01. |
| 3.5 Multiplicity assertion | Zero model; trivial rank-zero skew model; hypothetical multiplicity ≥ 2 | Proposition expresses the intended bound without assuming it. | No additional defect. |
| 3.6 Higher-codimension uniqueness | Basic codimension; larger Hermitian Bessel and symplectic Jacobi; orthogonal substitution | Proved range remains the supported Hermitian/symplectic range; no unrestricted orthogonal theorem asserted. | No additional defect. |
| 4.1 Sign domains and centralizers | Zero parameter; one same-type constituent; opposite-type and dual-paired constituents | Only the appropriate orthogonal multiplicity factors contribute component signs; representative independence is the intended API. | No additional defect. |
| 4.2 Conjugate root character | Zero minus-eigenspace; two direct summands; equal/opposite duality signs; additive-character rescaling | Trivial character in the same-sign case and multiplicative epsilon recipe agree with Theorem 6.1. | No additional defect. |
| 4.3 Selfdual corrected character | Even zero rank; two real one-dimensional constituents; determinant-one versus unrestricted signs | Determinant parity and real correction are essential and retained; no odd-dimensional extension asserted. | No additional defect. |
| 4.4 Case-specific distinguished character | Split component group; orthogonal parity; symplectic N versus N ⊕ 1; mu value u | Case distinction and z/u twist are explicit; metaplectic augmentation is local only. | No additional defect. |
| 4.5 Change of normalization | Identity change; two consecutive character changes; square/norm rescaling | Changes are constrained by the supplied comparison laws, not claimed invariant for arbitrary independent choices. | Exact comparison hypotheses belong in R04. |
| 4.6 Selection proposition | Empty relevant set; two distinguished members; correct/wrong enhancement | Both existence and uniqueness are tested, and an incorrect label fails. | No additional defect. |
| 4.7 Split local selection | Rank-zero factor; basic rank difference; larger difference at an infinite place | Arbitrary higher codimension is restricted to the proved finite-place range. | Underlying split data: R02–R03. |
| 4.8 Basic-case reduction | r = 0; SO instead of O; skew-unitary instead of symplectic | Identity boundary works; two required induction variants have no target. | R01. |
| 5.1 Tempered Bessel selection | Ramified quadratic extension of ℚ₂; smallest odd codimension; larger odd codimension | Range agrees with the recalled theorem and primary result, subject to normalized packet inputs. | R09 and R04. |
| 5.2 Standard-module reduction | Empty blocks; rank crossing of remainders; unordered exponents; reducible standard induction | Normalized induction and ordered nonnegative exponents are retained; no unnecessary irreducibility premise added. | No additional defect. |
| 5.3 Generic Bessel selection | Tempered specialization; generic non-tempered standard module; inner form lacking a Whittaker model | Genericity is a parameter condition, not genericity of every packet member. | R01's reduction and R04's precise irreducibility input. |
| 5.4 Theta bridge | Zero theta lift; nonzero lift in one tower; already supplied P1 | Seesaw argument must use the correct lift; P1 has duplicate ownership. | R06. |
| 5.5 Generic Jacobi selection | n = r = 0; equal-rank nonzero case; higher codimension; wrong mu restriction | Domain and splitting data agree; the higher-codimension bridge depends on the missing reduction. | R01, R06. |
| 5.6 Tempered inner-form uniqueness | Real definite/indefinite forms; nonarchimedean field; ℂ excluded; wrong Whittaker labeling | Quasi-split reference, H¹ indexing and STAB/TRANS/WHITT are explicitly distinguished from fixed-form multiplicity one. | Preserve their exact hypotheses under R04. |
| 6.1 Global Bessel period | Rank-one complement; trivial character; split GL center; split orthogonal plane | Center convention prevents false full-GL finite volume; exceptional orthogonal plane is identified in the period domain. | Convergence remains a precise supplier obligation under R04. |
| 6.2 Global Jacobi period | Zero-rank oscillator; rational additive element; genuine sign cancellation | Theta factor is retained and rational descent uses the global additive-character condition. | R02 propagates to split local inputs. |
| 6.3 L-representation | Zero summand; mu inverse on a line; local augmentation versus global tensor; split dual pair | Tensor/induction sign and squared absolute-value comparison agree. | No additional defect. |
| 6.4 Global assertion | Vanishing local model; central L-value zero; non-tempered input | Local obstruction and global existence are separate; non-tempered input is excluded from this conjecture formulation. | No additional defect. |
| 6.5 Unitary datum | n = 1; n = 0 rejection; isometric Hermitian transport; arbitrary representation without realization | Norm-line inclusion and actual automorphic realization prevent arbitrary-data vacuity. | No additional defect. |
| 7.1 Orthogonal Delta | Dimensions 2, 3, 4; split versus nonsplit binary form; meromorphic pole | Parity products and the empty product are meaningful; singular values are not interpreted by 0/0 division. | No additional defect. |
| 7.2 Orthogonal local period | Zero vector; phase 2i; convergent compact case; singular local quotient | Conjugation and linear-first pairing agree; normalization is restricted to its domain. | No additional defect. |
| 7.3 Orthogonal local normalization | Tempered ramified/dyadic input; spherical good input; failure of an unramified hypothesis | Convergence and spherical identity have distinct hypotheses; unramified conditions are not used to discard places. | No additional defect. |
| 7.4 Orthogonal refinement assertions | Zero/nonzero vectors; ALG versus tempered; two different Arthur centralizer sizes | Nonzero norm domain, integer exponent, C₀ and full centralizers are retained; formula remains conjectural. | No additional defect. |
| 7.5 Normalized unitary form | q = 2 and s = 1 gives local trivial L-factor 2; zero vector; pairing scaling; a pole | Regular nonzero quotient and convergence required; q = 1 and ordinary evaluation at a pole rejected. | No additional defect. |
| 7.6 Local convergence/spherical theorem | Ramified place; residue characteristic 2; real/complex place; spherical volume not 1 | All-place convergence is separate from almost-everywhere spherical calculation; exceptional places remain in the product. | No additional defect. |
| 7.7 Normalization invariance | Vector 2i; pairing multiplied by positive c; two H-measures scaled c,c⁻¹ | Ratios and finite product invariant; one uncompensated H-measure rescaling is not asserted invariant. | No additional defect; distinct G issue in R08. |
| 7.8 Global scalar | Total constituent counts 2 and 3; zero central value; zero adjoint denominator; Asai degrees 1 and 2 | Factors 1/4 and 1/8; zero numerator allowed; zero denominator explicitly forbidden. | Make adjoint nonvanishing contract exact under R04. |
| 8.1 Relative distributions and rank-one API | Basis vector replaced by i e; empty subset; zero period; divergent non-tempered local coefficient; ambient measure scaling | Global phase and empty-set tests work; local analytic domain and G measure omitted. | R07–R08. |
| 8.2 Linear spectral contribution | Irrelevant datum; nontrivial split-center dimension; coefficient with missing factor 2 | Irrelevant contribution is zero; precise ∗-generic setup and coefficient 2^(−dim aP) retained. | No additional defect. |
| 8.3 Isolated transfer | Finite S; matching family with wrong inner form; one of five transfer/isolation conditions omitted | All five source conditions are kept; delta and spherical factors cannot be suppressed. | No additional defect. |
| 8.4 Endoscopic nonvanishing | Stable parameter; multiple distinct constituents; zero central value; non-tempered cuspidal realization | Full discrete generic Arthur setting retained; no tempered restriction improperly added to this theorem. | No additional defect. |
| 8.5 Relative-character factorization | One local Hom zero; two constants k,k⁻¹; a single ambient G measure doubled | Zero branch/product-one law correct; H normalization does not fix convolution normalization. | R08. |
| 8.6 Refined unitary identity | Nonzero pure tensor; phase scaling; zero central numerator; endoscopic Pi; all infinite factors | Formula/domain agree with the endpoint source; central value never inverted and Pi need not be cuspidal. | Repair its proof input §8.5 via R08; retain full scope. |
| 8.7 Stable specialization | n = 2; n = 1 outside the cited stable theorem; regular versus pole Asai signs | Stated specialization agrees without narrowing the main endoscopic theorem. | No additional defect. |

### Duplication audit at the pinned libraries and roadmap heads

The library references were checked at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, the commits in the content manifest. Discovery used GitHub search, followed by reading the files at those commits; read-only object searches in available pinned Git objects supplemented that inspection. Searches included the defining operators and hypotheses: intertwining equations, continuous linear maps, invariant sesquilinear forms, polarization, unitary matrix equations, Witt decomposition/cancellation, the norm-equation symbol, and Heisenberg multiplication. The audit did not rely merely on proposed `GGP.*` names.

| Existing object | Pinned declaration/file inspected | Disposition |
|---|---|---|
| Algebraic equivariant linear maps | `Representation.IntertwiningMap`, `isIntertwining`, `ext`, module structure; `Mathlib/RepresentationTheory/Intertwining.lean:36` | Correctly imported; §2.4 is a relative tensor-functional specialization. |
| Continuous operators/intertwiners | `ContRepresentation`, `ContIntertwiningMap`, forgetful map and trivial action; `Mathlib/RepresentationTheory/Continuous/Basic.lean:54` | The design correctly observes that individual continuity supplies neither joint smoothness nor Casselman–Wallach hypotheses. |
| Algebraic/continuous comparison | `ContRepresentation.intertwiningMapEquiv`; `TauCeti/RepresentationTheory/Continuous/Intertwining.lean:66` | Finite-dimensional Hausdorff source and complete nontrivially normed scalar hypotheses are retained in the contract. |
| Invariant star-first forms | `Representation.IsInvariantSesqForm`, `apply`; `TauCeti/RepresentationTheory/InvariantForm/Hermitian.lean:95` | Imported with the explicit argument-reversal convention, not redefined as a general form theory. |
| Polarization and form predicates | `QuadraticMap.polar`, `polarBilin`, `polar_self`; `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:311`; `LinearMap.IsSymm`, `IsAlt` in `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean` | Unhalved factor 2 is correct; relative relevance adds a new condition. |
| Standard unitary matrices | `Matrix.mem_unitaryGroup_iff`; `Mathlib/LinearAlgebra/UnitaryGroup.lean:70`; `Matrix.UnitaryGroup.toLinearEquiv_apply`, `TauCeti/LinearAlgebra/Matrix/UnitaryGroup.lean:29`; `TauCeti.Matrix.isCompact_unitaryGroup`, `TauCeti/Topology/Algebra/UnitaryGroup.lean:100` | The compact standard RCLike group is not substituted for indefinite or finite-place groups. |
| Quadratic Witt decomposition | `QuadraticForm.exists_equivalent_hyperbolicPresentation_prod`; `TauCeti/LinearAlgebra/QuadraticForm/Witt/Decomposition.lean:413` | Explicitly reused in the trivial-involution specialization. |
| Quadratic cancellation | `TauCeti.equivalent_of_equivalent_prod`; `TauCeti/LinearAlgebra/QuadraticForm/Witt/Cancellation.lean:196` | Common summand's finite dimension and nondegeneracy are required; the remaining summands need not be nondegenerate. Contract accurately records this. |
| Hilbert symbol from a norm equation | `TauCeti.hilbertSymbol`, square-class descent; `TauCeti/NumberTheory/HilbertSymbol/Basic.lean:46` and line 179 | Explicitly reused; epsilon-factor compatibility is an additional theorem, not a second symbol definition. |
| Three-coordinate Heisenberg group | `HeisenbergGroup` and multiplication/commutator; `TauCeti/GroupTheory/SpecificGroups/Heisenberg.lean:55`, line 92 and line 113 | Existing split rank-one group has central coordinate z + z′ + xy′. It is a useful comparison, not the entire arbitrary symplectic half-commutator/oscillator interface. No duplicate general construction was identified here. |

Object searches found no existing general GGP restriction model, enhanced epsilon-selection theorem, Casselman–Wallach theory, Jacquet–Rallis comparison or global refined period theorem at these pins. Dirichlet L-function root numbers and unrelated occurrences of Bessel inequalities or Witt vectors are different objects. Existing orthogonal point-group developments do not supply the SO scheme/topology extension of R05.

The main-branch shape comparison used `TauCetiRoadmap/ReductiveGroups/README.md`, `TauCetiRoadmap/OrthogonalSpinGroups/README.md` and `Completed/RestrictedProducts/README.md`; the scalar-global contract was also checked in `TauCetiRoadmap/GlobalNumberFields/README.md`. ReductiveGroups Layers 0, 3, 5 and 7 contain the stated general group infrastructure. RestrictedProducts Layers 1–3 contain the generic maps, away-S packaging and diagonal interfaces, not measures. GlobalNumberFields Layers 0, 4–5 and 8–9 contain the named number-field scalar inputs; their range is not silently promoted to all global fields. OrthogonalSpinGroups has the drift in R05.

The three permitted open roadmap heads were inspected by scope and object searches:

| Roadmap | Head inspected | Result |
|---|---|---|
| QWittVectors | `4605fbb0a2d9279b561f9467ab5cce09d7f2469e` | Witt-vector algebra, not quadratic Witt theory or relative classical representations. No duplicate target found. |
| ErdosProgressionPowers | `72b615703f7fc5d175e519ddbb6e589d3d744c6c` | Arithmetic-progression/power problems. No duplicate GGP object found. |
| ArithmeticDynamics | `85e78c07dcc361ead6505c970a1181deee483819` | Dynamical arithmetic. Its large README was read through the head blob; no overlapping GGP, Fourier–Jacobi, Jacquet–Rallis or Casselman–Wallach target found. |

The board and main-roadmap searches found no existing roadmap of this name to extend as a Part II. The existing finite Weil direction in MetaplecticAutomorphicFormsPartII does not identify the local analytic oscillator theory needed here. The substantive two-owner issue within the design's contracts is R06. No downstream arithmetic consumer is used as a proof input. No target was moved or edited by this reviewer; R05 describes the ownership allocation required for repair.

### Supplier-order and gap audit

All 48 `Needs` lines, the exact supplier subsections and eight aggregate layer lists were inspected. The plan's internal graph is forward: no missing internal identifier and no internal cycle was found. All ten gap slugs appear in both plan and README. Nine have a named supplier; `connected-reductions` has none (R01). Named supplier sections that are explicitly declared missing were treated as contracts, not as supplier drift. Their precision/minimality issues are recorded in R04, and the actual false supplied citation is R05. Pinned quadratic Witt theory and the Hilbert symbol are explicitly excluded from reconstruction, a sound minimality choice.

The exact requested gate invocation could not read its candidate because the package-stage file `packages/GanGrossPrasadConjecturesForClassicalGroups/README.md` does not exist at design stage. Its failure was `FileNotFoundError` for that relative candidate. No placeholder package README was created. The same gate was then run with the actual design candidate `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md`, the supplied configuration/order and the same `--only` value. It exited successfully with this output:

```text
candidate: GanGrossPrasadConjecturesForClassicalGroups is not in the merge order yet; checked as if placed after AutomorphicGaloisRepresentationsPartII (the intake inserts it when its design is accepted)
depcheck: 4 roadmaps, 31 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Absence from the merge order is not a finding. The placement is inflated by the prose reservation noted in R10; that is not an upward edge. The gate does not establish the existence or mathematical sufficiency of a named gap's future outputs. No tooling, order file, supplier file or content-repository file was changed.

### Shape, policy and elaboration

The README has the requested title/summary, scope, conventions, exact supplier contracts, build explanation, eight ordered layers, examples and dependencies at every layer, downstream consumers and references. Each target has a locator and its own `Needs` line; definitions have named APIs and at least three Checks. Mathematical Unicode and inline code conventions are used; there is no computational implementation or target-number table. R10 records the process-language defect rather than mistaking required gap declarations or mathematical packets for process language.

There is no `Suggested.lean` in this design package. The brief supplies no usable Lean elaboration command: **not available**. Accordingly no Lean command was run, no claim of successful elaboration or “sorry only” warnings is made, and absence of a package-stage Lean file is not a finding against this design. Real-bodied definitions, explicit binders, proved examples, the single import and prohibition of sorry'd data/set_option must be checked when that file exists. The report does not infer truth from an admitted build.

The README and plan were not edited. The sources service appended `bp-unitary-tempered` and `bp-refined` to `packages/GanGrossPrasadConjecturesForClassicalGroups/sources.toml`; all ten original entries remain unchanged. No source text was copied into the repository. The only other deliverables are this report and `packages/GanGrossPrasadConjecturesForClassicalGroups/design/review.json`.

## Not verifiable

- **Lean elaboration and example coverage:** not available. There is no design-stage `Suggested.lean` and no executable elaboration command authorized by the brief. Signatures, binder retention and proved Lean mirrors are therefore not certified.
- **Undelivered named supplier contracts:** actual implementations and full theorem signatures for the nine named gaps cannot be read where no supplier section exists. Their declared status is respected; only R04's contract defects, R06's conflicting ownership and the separate R05 drift are findings. Conditional acceptance is not issued because blocking findings remain.
- **Published pagination/version identity beyond the recorded versions:** the review verifies the exact cached arXiv/HAL/author versions, not unavailable publisher revisions. Ichino–Ikeda is deliberately cited by the available author revision. This creates no missing-text request.
- **Proofs of the planned targets:** the review checks statements, witnesses, source hypotheses and dependencies. It does not claim to have constructed the harmonic analysis, parameter classification or all-place analytic proofs. In particular R09's primary theorem is conditional on its stated parameter laws, which must be supplied, not assumed from a bare packet carrier.

No cited original source was unreadable, waived or left with an unresolved access request. The two additional primary sources were obtained legally through the sources service. No missing-reference request is needed for this review.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "cefa34d45d9a762022606b78a27c036b08fed044", "job": "REV-DESIGN-GanGrossPrasadConjecturesForClassicalGroups", "model": "gpt-6-astra", "worker": "chris-3"} -->
