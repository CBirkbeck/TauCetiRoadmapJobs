<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/618#issuecomment-6327066936 -->
Review (codex) of eef1635

Verdict: needs_changes

1. **F01** (P2) A split Hermitian line needs a generator, not merely a nonzero vector

   **Location.** `packages/GanGrossPrasadUnitaryGroups/design/README.md:155`, also `packages/GanGrossPrasadUnitaryGroups/design/plan.json:19`: “a hyperbolic basis and a nonzero vector of L”. This frame is consumed by §1.2.

   **Claim.** The frame condition is insufficient over the explicitly included split quadratic algebra. Nondegeneracy of the rank-one form does not make every nonzero vector a generator or give it nonzero norm. The Bessel construction can consequently lose a simple-root character.

   **Witness.** Take E=F×F, L=E, h(x,y)=x c(y), e=(1,0). Then e≠0, h(e,e)=0 and Ee≠L. For r=1, b(u)=h(ue,v₁*) has zero second component. Compare ggp line 1567–1569.

   **Exact repair.** Require the chosen line vector to be an E-basis vector: the map E→L sending a to ae must be an isomorphism. Equivalently in this rank-one setting require h(e,e)∈F×. Carry this condition through the frame constructor, extensionality, transport and §1.2 character construction, and synchronize the plan. Add a split negative control computing the above idempotent vector's zero norm and missing character coordinate, alongside the valid generator (1,1). Keep all split fields and residue characteristics.

2. **F02** (P2) Extensionality on a completed tensor needs continuity

   **Location.** `packages/GanGrossPrasadUnitaryGroups/design/README.md:895`, and `packages/GanGrossPrasadUnitaryGroups/design/plan.json:1491`: “A sesquilinear form agreeing on pure tensors agrees everywhere on the completed smooth tensor carrier.”

   **Claim.** The constructed α is continuous, but the comparison form in this API is not required to be continuous. Algebraic tensor spanning proves the finite-place assertion; density alone does not prove the archimedean assertion for an arbitrary sesquilinear form.

   **Witness.** Take infinite-dimensional split GL₃(R)×GL₂(R) principal series. A=V⊗W is proper dense in X=V⊗̂W. An algebraic functional ℓ vanishing on A can satisfy ℓ(x)=1. Then ℓ(u)conj(ℓ(v)) vanishes on pure tensors but equals 1 at (x,x).

   **Exact repair.** State extensionality for two continuous sesquilinear forms on the completed carrier, agreeing on every pair of pure tensors. Alternatively explicitly quantify the comparison form in the continuous-form carrier. Keep the unrestricted algebraic version at finite places. Add the discontinuous-form negative control and record the continuous density argument, as already done for the continuous model in §2.1. Relevant source topology: bp-arch line 6797–6801 and line 6820–6825.

3. **F03** (P2) The remaining L-factor gap is compound and its intake sentence is not precise

   **Location.** `packages/GanGrossPrasadUnitaryGroups/design/plan.json:2555`, repeated at `packages/GanGrossPrasadUnitaryGroups/design/README.md:145`: “general Rankin–Selberg and mirabolic distinction theory, and the stated regularity/nonvanishing theorems”.

   **Claim.** `gap:l-factors` combines independently dischargeable factor identities, local regularity, global values, local Whittaker Fourier analysis, and global mirabolic/norm periods. Its `needs` sentence has neither the field/representation hypotheses nor the actual regularity statements. Details elsewhere do not turn this intake sentence into the precise, minimal single contract required by the brief.

   **Witness.** §3.1 consumes epsilon-factor characters, §5.1a consumes Zhang's Whittaker pairing/Fourier identity, and §6.1 consumes global mirabolic distinction and norm residues. These are different inputs; zhang-period line 656–675 and bpcz line 4132–4154 distinguish the latter constructions.

   **Exact repair.** Split this request into named contracts for factor/epsilon identities, tempered local factor regularity, global Hermitian central regularity and opposite-parity adjoint nonvanishing, local Rankin–Selberg continuation and nonzero test vectors, Whittaker pairing/Fourier identities, and global mirabolic distinction/norm leading coefficients. Keep AutomorphicLFunctionsAndLocalFactors as owner. In each `needs` sentence state the field, representation class, arguments and exact conclusion already specified in the detailed paragraph; retain all infinite, split and dyadic cases. Update consumer prerequisites, `neededBy`, supplier summaries, layer dependencies and matching README slugs. Leave C_v and the relative split integral identity owned here.

4. **F04** (P2) The local relative-character API has no dependency on its integrability theorem

   **Location.** `packages/GanGrossPrasadUnitaryGroups/design/README.md:1039`: “For tempered σ_v the local relative character is J_(σ_v)(f_v)=∫_(H_v)Tr(σ_v(t)σ_v(f_v))dt.” The `*Needs:*` line is at 1043; the plan target is §6.2.

   **Claim.** This API needs the local tempered integral and a passage from matrix coefficients to a smoothing trace. The declared prerequisites of §6.2 supply only global periods, Whittaker periods and general automorphic spectral kernels. They do not reach §2.7 or §5.2.

   **Witness.** The complete target-prerequisite closure of §6.2 is {1.1,1.2,1.3,4.1,6.1}. In contrast, bpcz line 4873–4884 defines this integral and explicitly invokes tempered matrix-coefficient convergence. §2.7 is its owner in this design.

   **Exact repair.** Add §2.7 and the continuous local form of §5.2 to §6.2's prerequisites in both files. State the local test-function space, group and H Haar measures, and the smoothing-trace convergence bridge used to pass the integral through the basis sum. Reuse the declared general smoothing/nuclear input for that bridge, identifying the consumed clause; if it does not supply the local assertion, register that exact missing clause as a named supplier gap. Cite bpcz §10.3.1, pp. 90–91, line 4873–4888 at this API. This adds only downward edges.

5. **F05** (P3) Several locators identify the wrong part of the cited text

   **Location.** `packages/GanGrossPrasadUnitaryGroups/design/README.md:89`, 291, 523 and 859. At line 89: “jsz-bessel §3.2, equation (10), pp. 5–6”.

   **Claim.** The substantive assertions are supported after the corrections below, but their exact locators are incomplete or misplaced.

   **Witness.** jsz-bessel line 175 is a subgroup decomposition; its inducing-family formula is at line 207–216. agrs line 39–40 is the split theorem. bp-arch line 10204–10208 is the discriminant identity. zhang-period line 1437 is the measure change.

   **Exact repair.** Cite JSZ §3.2's unnumbered transformation formula and Proposition 3.1, p. 6, rather than equation (10). Add AGRS Theorem 2, p. 2, for the split part of §2.2. Add bp-arch §11.1, pp. 259–260, line 10054–10078 for the Γ measure and equation (11.2.1), p. 263, line 10204–10208 for Δ. In §5.1a replace the measure-change page 26 by p. 29 and line 1437–1440, retaining the introductory warning on p. 9. Synchronize plan locators. Do not rewrite the author's existing manifest entries; their recorded versions remain the source versions reviewed here.

6. **F06** (P3) Some Checks still do not test the constructed object

   **Location.** `packages/GanGrossPrasadUnitaryGroups/design/README.md:465`: “A character with generator values -1 and +1 has value -1 on their sum”; line 697: “has no proof exported by this target”.

   **Claim.** The first is a calculation for an arbitrary character, without any parameter producing it through `ggpEpsilonCharacter`. It would survive replacing that construction by the constant character. The second is proof-status prose rather than a mathematical Check. Fixing the earlier F09 Check did not eliminate these separate cases.

   **Witness.** The `epsilon_two_generators` sentence never supplies φ_V, φ_W or ψ_E. The `split_large_gap_infinite` sentence computes no representation, model or subgroup. Neither distinguishes the intended construction from a wrong one.

   **Exact repair.** For the epsilon Check take E/F=C/R, φ_V=χ₁⊕χ₋₁, φ_W=1, with χ_j(z)=(z/|z|)^j and fixed ψ_E trivial on R. Compute χ_W(z_(φ_V))=−1 from the epsilon duality formula, ggp line 598–601. For multiplicity two use φ_V=χ₁⊕χ₁ and choose the additive-character sign giving ε(χ₁,ψ_E)=−1; compute generator value −1 but central value +1. This gives three tests of the actual definition together with the empty-parameter Check. Move the split proof-status sentence into scope prose and replace it with the explicit r=1 split GL₄/GL₁ subgroup/character calculation, including both nonzero simple-coordinate contributions. Keep the conjectural range unchanged.

7. **F07** (P3) Remove workflow narration from the mathematical README

   **Location.** `packages/GanGrossPrasadUnitaryGroups/design/README.md:109`: “The board design AutomorphicSpectralTheoryPartII owns this theory; it is not an eligible primary-section import here.”

   **Claim.** This is workflow-dependent narration in the README, contrary to the timeless house style. The underlying ownership and placement gap is legitimate.

   **Witness.** The phrase identifies an object's board/design eligibility rather than its mathematical interface. The same mathematical ownership is expressible as the AutomorphicSpectralTheory Part II multiplier continuation and its required preceding placement.

   **Exact repair.** Replace that sentence with a timeless ownership statement naming the multiplier continuation and §§SM.0–SM.5. Retain `gap:spectral-isolation`, the earlier named supplier, its required placement and the exact multiplier contract. Keep workflow eligibility explanations in reports.

8. **F08** (P2) The spherical target still stops at good primes

   **Location.** `packages/GanGrossPrasadUnitaryGroups/design/README.md:915`: “outside a finite set containing dyadic places”; line 929: “This evaluation is not asserted at a ramified or dyadic place”. The same restriction occurs in plan target §5.3.

   **Claim.** This is a good-prime-only library target, expressly excluded by the brief's generality principle. The convergence theorem and final global identity at dyadic places do not supply the omitted spherical evaluation. An arbitrary unramified dyadic local pair is omitted even when every actual spherical hypothesis holds. The target also carries global automorphic hypotheses despite saying that only local hypotheses are used.

   **Witness.** Take F=Q₂, E=F×F, n=1 and unramified unitary tempered GL₂(F)×GL₁(F) data. §5.3 excludes it solely by residue characteristic. Zhang's unramified Rankin–Selberg evaluation has no such exclusion: zhang-period line 982–986.

   **Exact repair.** State a local theorem for every characteristic-zero nonarchimedean F and unramified or split E/F, with the actual compatible hyperspecial, tempered spherical, vector and measure hypotheses, including residue characteristic 2. Obtain the global almost-everywhere assertion as its corollary. Keep Harris's odd-residue theorem as the accurately cited intermediate result; give the general theorem its own proof dependencies and exact locators rather than attributing the extension to Harris. The split case can use §5.1a and the spherical Whittaker calculation; explicitly account for the nonsplit dyadic calculation as well. Replace the status-only Check by a dyadic spherical evaluation and a genuinely ramified nonspherical negative control. Do not request a spherical value for data without the spherical hypotheses.

Eight findings: five P2 findings and three P3 findings. The design has the right scope and can be repaired. No existing roadmap is re-planned, no computational algorithm is proposed, and the dependency gate reports no UPWARD or CYCLE. The missing supplier implementations are declared contracts, not findings merely because they are missing.

## Previous findings, checked first

The previous review, `packages/GanGrossPrasadUnitaryGroups/reports/REV-DESIGN-GanGrossPrasadUnitaryGroups.md`, is absent. The following audit therefore uses the nine findings described in `packages/GanGrossPrasadUnitaryGroups/reports/FIX-DESIGN-GanGrossPrasadUnitaryGroups~2.md`. None is marked “not actionable in this package.” These are checks of the described repairs, not a claim to have read the unavailable original review.

| Prior finding | Status | Repaired passage and verification |
| --- | --- | --- |
| F01, unassigned distribution theory | Repaired | `packages/GanGrossPrasadUnitaryGroups/design/README.md:97`: “What AutomorphicSpectralTheory must provide (`gap:distribution-gk`)”. Its normal-space descent and separate finite/archimedean homogeneity hypotheses match ag-descent line 406, line 583 and line 596. The criterion is the multiplicity product, not multiplicity one without contragredient transport. |
| F02, maximal isotropic auxiliary space | Repaired | `packages/GanGrossPrasadUnitaryGroups/design/README.md:337`: “the chosen totally isotropic Y=X⊕E(e+f) of rank r+1”. The residual hyperbolic-plane Check at line 361 correctly gives rank(Y)=2 but Witt index 3; ggp line 2140–2151 supports it. |
| F03, parabolic supplier section | Repaired | `packages/GanGrossPrasadUnitaryGroups/design/README.md:205`: “ReductiveGroups §Layer 7”. `TauCetiRoadmap/ReductiveGroups/README.md:632` supplies parabolic subgroup schemes and Levi decompositions. Plan and layer dependency lists agree. |
| F04, empty germ average | Repaired | `packages/GanGrossPrasadUnitaryGroups/design/README.md:523`: “put c_θ(x)=0 if the regular-nilpotent orbit set in g_x is empty”. The compact U(2)×U(1) example is valid; bp-arch line 3999–4000 and line 10292 support this convention. |
| F05, split integral nonvanishing | Repaired | `packages/GanGrossPrasadUnitaryGroups/design/README.md:859`: “the left side is ab λ(W)conj(λ(W′))”. Zhang's actual integral identity, not only abstract Hom nonvanishing, supplies the missing step: zhang-period line 1437, line 1505–1512 and line 1543–1551. |
| F06, compound local-analysis/transfer/theta requests | Repaired in the described scope | `packages/GanGrossPrasadUnitaryGroups/design/README.md:127`: “construct dense subspaces of the Schwartz spaces”; line 137: “exact signature selection and parameter formulas”. Category, Bernstein, mirabolic, genericity, spherical, harmonic, transfer and theta requests now have separate slugs. The remaining distinct `l-factors` problem is R03 below. |
| F07, normalizer and packet ownership | Repaired | `packages/GanGrossPrasadUnitaryGroups/design/README.md:145`: “The quotient C_v and its regular nonvanishing are constructed and derived solely in §5.1.” Line 121 gives actual packet character identities to the enhanced-classification owner alone. No second construction is retained. |
| F08, internal references | Repaired | `packages/GanGrossPrasadUnitaryGroups/design/README.md:885`: “C_v of 5.1”; line 1173: “local product of 5.5”; line 687: “Combine nonzero with 2.6.” The matching plan fields agree. |
| F09, proof-status Check | Repaired | `packages/GanGrossPrasadUnitaryGroups/design/README.md:677`: “Replacing it by 1 gives Hom_N(π,1) of dimension 6”. Bernstein–Zelevinsky line 329–338 gives six one-dimensional Weyl filtration pieces; the generic model has dimension one by ggp line 2398–2405. |

## Verified sound

### Coverage and principles

Read all 40 targets, their 81 named API entries, 124 named Checks, seven layer dependency lists, every `*Needs:*` line and all 30 supplier-gap paragraphs. There are 17 definitions/constructions; each has an API and at least three listed Checks. R06 concerns discrimination, not the raw count. The README and plan name sets agree. Six sentence-level differences concern the spelling of Langlands packets and equivalent wording, with no changed hypotheses.

The algebraic characteristic restriction excludes zero rings and inseparable quadratic algebras; analytic fields are explicitly characteristic zero. Residue characteristics 2 and 3 remain in local multiplicity and global period theorems. The spherical calculation accurately retains Harris's good-place hypotheses, but has no general dyadic spherical continuation: R08. Bad-place integrals and the final product remain defined. The split nonzero-vector defect is R01; it must be repaired without deleting split algebras. No substitute for local models, classification, transfer, or automorphic realizations is used; the remaining good-prime-only target is R08.

The general odd-codimension global assertion and higher-codimension archimedean split prediction remain propositions with no exported proof. Rank-zero smaller spaces, both real complement signs, arbitrary inner forms, endoscopic constituent counts and vanishing central values are retained. No copied source passage or computational algorithm was detected in the statements and source comparisons. No Lean file, admitted data or `set_option` is present in this design package.

### Seeded source audit

All 15 requested sample targets were checked against the supplied legal cached versions, including theorem/section numbers, printed pages, hypotheses and normalizations. “Supported” below concerns the cited mathematical assertion; the listed findings still apply to its definition, API or dependency contract.

| Sample target | Source witness and result |
| --- | --- |
| 1.1 `RelevantHermitianPair` | ggp §2, p. 7, line 229–257 gives the nondegenerate embedding and fixed split odd complement. Its frame requires a nonisotropic line vector at line 1567–1569; the split extension exposes R01. |
| 1.2 `besselDatum` | ggp §12, pp. 44–46, line 1593–1639 gives the semidirect product, simple coordinates and choice conjugacy. The character formula is supported for valid frames; R01 prevents accepting the stated frame domain. |
| 2.2 `adjacentInvariantDistribution_symmetry` | agrs Theorem 2′, p. 3, line 66–83 supports conjugate-inverse symmetry; its Theorem 2, p. 2, line 35–40 supplies split GL. sun-zhu Theorem A, p. 2, line 49–54 supplies real/complex generalized functions. R05 adds the missing split locator. |
| 2.5 `besselHom_archimedean_injection` | jsz-bessel Proposition 3.1, p. 6, line 207–216; Propositions 3.3–3.4 and their application, p. 8, line 260–283. The finite-dimensional S, componentwise half-plane, and generic choice of parameter are retained. |
| 3.4 `besselGeometricMultiplicity` | bp-arch §11.1, pp. 259–260, line 10054–10078; equation (11.2.1), p. 263, line 10204–10208; Proposition 11.2.1, pp. 265–266, line 10248–10296; Lemma 11.3.1, p. 272, line 10525–10539. The empty-germ convention agrees with §4.5, p. 106, line 3999–4000. R05 improves locators. D_H is for the full Bessel H, including N, not just U(W). |
| 3.10 `splitTemperedBesselPrediction` | ggp Conjecture 17.1 and Theorem 17.2, p. 68, line 2386–2405. The proven finite-place/general and all-place/adjacent ranges are correctly separated from the remaining proposition. Bernstein–Zelevinsky §2.12, p. 448, line 329–338 supports the new six-dimensional trivial-character control. |
| 4.3 `unitaryTensorLRepresentation` | ggp §22 table, p. 86, line 3026–3028; §24, pp. 89–90, line 3151–3188. Index-two induction is on the finite-Galois L-group; dimension 2ab and the split two-factor specialization are correct. Strong-base-change factor comparison is an explicit supplier input. |
| 4.4 `globalBesselConjecture` | ggp Conjecture 24.1, p. 90, line 3175–3182. Everywhere tempered, multiplicity one, fixed pair, all local models and central nonvanishing are preserved; this remains a conjecture definition. |
| 5.1a `splitAdjacentWhittakerPeriod` | zhang-period §4.5, Proposition 4.10, p. 31 and following proof, line 1505–1568; §3.3, p. 19, line 962–981. The raw pairing, opposite Whittaker characters, temperedness, nonzero test vectors and positive Haar/pairing scales agree. R05 corrects the measure-change locator. |
| 5.3 `normalizedLocalBesselPeriod_spherical` | harris §2, p. 4, line 170–183 and Theorem 2.12, p. 23, line 1289–1294; bpcz equation (1.1.6.1), p. 4, line 168–169. Hyperspecial compatibility, unit vector/measure normalization and the finite exceptional set are retained, then rescaled correctly. This verifies the restricted source statement; R08 requires a general local continuation. |
| 5.4 `unitaryPeriod_rescaling` | bpcz §1.1.6, pp. 4–5, line 160–188 and §2.3.2, p. 15, line 679–699. Direct substitution gives pairing cancellation, local Haar factor a, global squared-period factor a² and product-one invariance. |
| 5.5 `allPlaceBesselProduct` | bpcz equation (1.1.6.1) and Theorem 1.1.6.1, pp. 4–5, line 168–193; §2.3.2, p. 15, line 685–699. The product is a finite modification of the volume product, not a central-point Euler product. Zero local factors are allowed. |
| 6.1 `globalWhittakerRelativePeriods` | bpcz §8.1.2, pp. 76–77, line 4122–4154 and §10.2.1, p. 90, line 4835–4845. Central argument s=0, both signed Asai factors, leading coefficients, Whittaker/Petersson norm and nonvanishing equivalences agree. |
| 6.3 `starGenericRelativeContribution` | bpcz Theorem 5.2.1.1, p. 59, line 3066–3083; Theorem 8.1.4.1, p. 78, line 4243–4254; equation (10.1.5.2), p. 88, line 4749. Full split-center dimension gives 2^(-r_total); irrelevant star-generic contributions vanish. |
| 6.5 `temperedRelativeCharacterEulerIdentity` | bpcz §10.3, pp. 90–92, line 4889–4946, especially equations (10.3.2.1), (10.3.3.2), (10.3.5.4). Partial measure factors, vanishing-model branch, local κ constants and their product agree. The design correctly uses inverse group order despite the sign typo in the source's last sentence at line 4945. |

The only author-marked unverified citation is `xue-bessel`; the manifest marks it waived and the design infers no theorem from it. It was not reopened. All 16 certified source texts are readable. Additional repair checks read ag-descent, bp-fundamental and bp-plancherel at the cited passages. The OCR-sensitive theta formulas on published Xue p. 1010 were also inspected in the cached PDF: the inverse splitting character, conjugated additive character and exponent n(n+1)/2−q agree with the contract. No source fetch or manifest change was needed.

### Adversarial mathematics pass

Each target row covers its statement, named API and Checks. The common field, category and measure conventions were checked first; impossible cases such as residue cardinality one are rejected by those hypotheses. “Pass” means no further defect found by the listed instances, not a formal proof.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Standing fields/forms | Zero ring; inseparable quadratic algebra; characteristic 2; split E; ranks 0,1,2; dyadic residue fields | Excluded cases are explicit; split constant rank is E-rank; zero smaller space retained | R01 for the chosen line vector |
| Pairing/character/induction conventions | B(i,1); ν(h)=i; upper GL₂ diagonal (a,1); identity and reversed products | Linear-first value i, right-translation factor i, δ=abs(a); unnormalized/normalized induction distinguished | None |
| Parameters/measures/universes | Degrees 2,1; multiplicity two; constituent counts (1,1),(2,1); Haar factors 2,1/2 | Signs, central parity, coefficients 1/4,1/8 and product-one scaling agree; no algebraic representation is assumed complete | R06 strengthens epsilon Checks |
| 1.1 RelevantHermitianPair | W=0, line; H plus line; definite real rank 3; split e=(1,0) | Rank formula/base change and real non-example pass; frame admits non-generator | R01 |
| 1.2 besselDatum | r=0; r=2 coordinates (x,z); split GL₃; idempotent line vector | Diagonal and addition laws pass for a basis frame; idempotent loses a split component | R01 |
| 1.3 besselTransport | Identity/composition; h and −h; change of character; split nonunit | Transport laws pass on actual frames; nonunit cannot be a change of basis | R01 |
| 2.1 besselModel | H=1; U(1) weights (1,−1),(1,1); finite versus completed tensors | Dimensions 1,1,0; dual and continuity are specified; cardinal/finrank distinction retained | None |
| 2.2 adjacent symmetry | Norm-one scalar; split unipotent and transpose; noncommuting product | Rank-one map is identity; transpose reverses products; identity map fails in rank 2 | R05 locator |
| 2.3 adjacent multiplicity | U(0)⊂U(1); ramified Q₂; GL₂(R)↓GL₁(R) | Bound includes 0 and 1 without compactness or temperedness | None |
| 2.4 finite reduction | W=H,r=1; excluded Bernstein block; δ_B on GL₂ | Y rank 2 versus Witt index 3; exclusion and unnormalized induction required | None |
| 2.5 archimedean injection | Two-dimensional S; split two-component s; exceptional parameter | Common componentwise half-plane and generic irreducibility suffice; no arbitrary-s assertion | R05 supplier locator |
| 2.6 all multiplicities | W=0; two real line signs; compact noninterlacing weights | Uniqueness allows dimension zero; finite-dimensionality follows from excluding a two-dimensional subspace | None |
| 2.7 tempered integral | Compact U(1); noncompact split pair; trivial GL₂×GL₁ representations | Haar mass retained; trivial non-tempered example diverges; polynomial log factors allowed by decay | None |
| 3.1 epsilon character | Empty parameter; distinct summands; repeated summand; central element | Lift independence and multiplicity parity agree; abstract sign Check does not test constructor | R06 |
| 3.2 enhancement transport | Nonnorm and norm t; degrees (2,1); t=−1 over R | Even-side one-dimensional generator flips; norm change trivial; two flips cancel | None |
| 3.3 tempered form | H=1 of mass a; compact opposite weights; higher r; induced representation | Value aB and compact projection correct; regularization required; induction statement concerns whole induced representation | None |
| 3.4 geometric multiplicity | x=1; x=−1 on a line; θ=0; compact U(2)×U(1); r>0 | Δ=1,4 respectively; empty regular germs contribute zero; full H discriminant cancels the unipotent contribution | R05 locators |
| 3.5 local trace | W=0; proper Levi; noncompact real form | Whittaker germ, GL germ coefficient and Schwartz regularization are preserved | None |
| 3.6 Fourier identity | με=−1,+1; order-two Fourier values (1,−1) | Total masses 0,1; inversion selects nontrivial character in the latter test | None |
| 3.7 finite local theorem | W=0; ramified dyadic extension; wrong enhancement | No extra zero-space inner form; enhancement selects exactly one pair | None |
| 3.8 real theta reduction | Counts (2,1)→(0,1); equal/adjacent ranks; splitting character present/absent | Odd induction count drops by two; one/two target signatures match Xue; no big-lift irreducibility premise | None |
| 3.9 real local theorem | Compact U(2) weights (1,0), smaller −1 versus 1; negated forms; W=0 | Multiplicities 1 versus 0; labels must be transported with line sign | None |
| 3.10 split prediction | GL₁×GL₀; adjacent pair; regular GL₃ principal series | Dimensions 1; generic versus trivial N-character dimensions 1 versus 6 | None beyond inherited R01 |
| 3.11 split nonvanishing | Adjacent real pair; higher finite pair; higher real pair | Proven range agrees with source; higher real proof not inferred | R06 replaces status Check |
| 4.1 global period | Empty flag; ν(h)=i; character nontrivial on rational points | Diagonal integral, translation sign and rational descent condition correct | None |
| 4.2 local obstruction | One zero model; reference values 2 and 3; reference rescaling a | Period zero; product factor 6; local functional scales by a⁻¹ | None |
| 4.3 tensor L-representation | b=0; ranks (2,1); split place; finite-Galois versus Weil group | Dimensions 0 and 4; split product has both conjugate-dual factors | None |
| 4.4 fixed-pair conjecture | W=0; local models plus zero central value; wrong prescribed inner form | L=1 in zero rank; central condition and fixed-form quantifier retained | None |
| 5.1 normalizer | n=1; split finite place; archimedean factors; global central zero | Δ₂=L(1,η)L(2,1); local quotient nonzero; global quotient may be zero | R03 separates its supplier clauses |
| 5.1a split integral | n=1; Haar doubling; pairing rescaling; λ-kernel vector | Raw form equals ab λλ̄; nonzero test exists; kernel diagonal can vanish | R05 locator |
| 5.2 normalized form | Zero vector; compact weights; vector rescaling; discontinuous form on completion | q excludes zero; scaling correct; unrestricted completed extensionality fails | R02 |
| 5.3 spherical evaluation | Unit vector/unit Haar; Haar doubling; ramified place; split unramified Q₂ | Formula and rescaling pass in the stated range; Q₂ omitted despite spherical hypotheses | R08 |
| 5.4 rescaling | B→2B; Haar factors 2,1/2; global H measure doubled | q pairing-independent; product fixed; squared period multiplies by 4 | None |
| 5.5 product | Enlarge exceptional set; zero exceptional factor; central Euler product | Coherence follows from volumes; zero allowed; central Euler convergence not assumed | None |
| 6.1 Whittaker periods | n=1 signs; zero vector; vanishing central value; two constituent blocks | Signs +,−; λ and β linear; λ vanishes exactly with central value; leading coefficients retained | R03 supplier precision |
| 6.2 relative characters | Orthogonal-basis rescaling; convolution square; zero period; local tempered trace | Basis cancellation/positivity correct; local trace API lacks its analytic dependency | R04 |
| 6.3 star-generic contribution | Two and three constituents; irrelevant datum; omission of split center | Coefficients 1/4,1/8; irrelevant contribution zero; quotienting the center would be wrong | None |
| 6.4 isolated comparison | No auxiliary supercuspidal; transfer on one form; three constituents | All realizations with the base change are retained; archimedean density is enough | None |
| 6.5 Euler identity | Missing local model; κ and reciprocal κ; counts (2,1) | Both sides zero without division; product κ=1; coefficient 1/8 | None |
| 7.1 global nonvanishing | n=1; endoscopic parameter; prescribed form without model | Existence over inner forms retained; no temperedness assumption introduced | None |
| 7.2 stable specialization | n=1 boundary; opposite Asai signs; no supercuspidal place | n>1 is source range; n=1 already covered by 7.1 | None |
| 7.3 refined proposition | Counts (1,1),(2,1); zero vector; zero mixed pairing | Coefficients 1/4,1/8; no division by zero; factorwise polarization is denominator-cleared | None |
| 7.4 GGP.8 | Vector/pairing scaling; product-one Haar change; zero central value; endoscopy | All-place identity agrees with BPCZ; conjecture truth is not an assumption | None |

### Duplication and supplier audit

Object searches covered both pinned libraries, main and completed roadmaps, the seven supplied open-roadmap copies, and relevant neighboring board designs. Pinned revisions agree with the manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Object | Verified existing owner or boundary |
| --- | --- |
| Sesquilinear nondegeneracy and orthogonality | Mathlib `LinearMap.Nondegenerate`, `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:595`; `Submodule.orthogonalBilin`, `Mathlib/LinearAlgebra/SesquilinearForm/Orthogonal.lean:48`, membership at line 54. The roadmap cites these and respects the actual argument order. |
| Algebraic tensor, dual and intertwiners | `Representation.tprod`, `tprod_apply`, `dual`, `Mathlib/RepresentationTheory/Basic.lean:618`, 626, 670; `Representation.IntertwiningMap`, `ext`, `isIntertwining`, `Mathlib/RepresentationTheory/Intertwining.lean:36`, 53, 87. These are consumed, not rebuilt as generic structures. |
| Identity-form unitary group | `Matrix.unitaryGroup`, `Mathlib/LinearAlgebra/UnitaryGroup.lean:58`; this does not supply arbitrary Hermitian forms and local inner-form comparison. |
| Hopf points | `TauCeti.HopfAlgebra.pointsFunctor`, `TauCeti/Algebra/AlgebraicGroup/PointsFunctor.lean:150`, gives convolution on algebra maps. Its group-valued functor is correctly distinguished from group-like elements. |
| General algebraic-group geometry | `TauCetiRoadmap/ReductiveGroups/README.md:129`, 234, 443, 627 supplies the cited Layers 0,3,5,7. Layer 7's parabolic theorem is valid over every field, so the algebraic targets do not require an implicit perfect-field restriction. |
| Arithmetic adeles | `TauCetiRoadmap/GlobalNumberFields/README.md:412`, 423, 433, 470 supplies Layers 4–6,8. Group Tamagawa measures are explicitly outside its scope. |
| Restricted products | `Completed/RestrictedProducts/README.md:248`, 268, 305, 361 supplies Layers 0–3; this includes reference changes and eventually integral diagonals, not the Tamagawa volume product. |
| Finite-dimensional branching | `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md:310` is GL finite-dimensional branching; it does not duplicate admissible unitary restriction. |
| Smooth, spectral and theta continuations | `packages/SmoothRepresentationsOfLocalGroupsPartII/design/README.md:3` develops Hilbert/Fell/unitary-dual theory. `packages/AutomorphicSpectralTheoryPartII/design/README.md:861` owns general Schwartz relative-character pairings and its multiplier continuation owns spectral isolation. These remain supplier inputs. `packages/MetaplecticAutomorphicFormsPartII/design/README.md:3` is finite Weil theory, not the real Bessel seesaw. |
| Doubling and symmetric-power continuations | `packages/AutomorphicLFunctionsAndLocalFactorsPartII/design/README.md:3` and `packages/ModularityAndLanglandsExtensionsPartII/design/README.md:3` do not supply the unitary Bessel endpoints here. Generic factor, classification and norm inputs remain assigned to their owners, subject to R03. |
| Seven supplied open-roadmap copies | QSeriesPartitionsAndMockModularForms, K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics were searched by object and their scope passages read. Their theta, Hermitian or automorphic mentions do not duplicate local Bessel models, unitary GGP classification selection or this period identity. |

The three main/completed examples also supplied the shape comparison. All seven layers have Examples and Dependencies; all targets have locators. No target numbering table, LaTeX delimiter, `set_option`, sorry'd data, or algorithmic implementation occurs in this design. R07 records the remaining workflow-style issue.

All 30 gap slugs occur in both plan and README; every `neededBy` set equals its actual declared consumers. None has supplier `none`. All suppliers precede the virtual candidate position. Unavailable primary sections are explicitly gaps, never purported existing imports. There is no reason to move ownership from a later roadmap in this review.

| Gap | Contract audit |
| --- | --- |
| hermitian-unitary | Arbitrary forms, constant E-rank, split coefficients, Witt and reductive comparisons are distinct from identity-matrix U; named earlier owner. R01 is a consumer frame defect. |
| local-categories | Smooth admissible category, smooth dual, induction normalization and Jacquet adjunctions have explicit characteristic-zero field domain. |
| local-bernstein | Fixed endpoint support exclusion and auxiliary irreducibility are named; block selection must be made before using unramified twisting within the selected inertial class. No endpoint supercuspidality is imposed. |
| local-mirabolic | Generic supercuspidal restriction to last-row mirabolic is separate from the relative open-orbit calculation. |
| gl-tempered-genericity | All characteristic-zero fields, each nondegenerate unitary character and continuous archimedean functional are specified. |
| local-jacquet-filtration | Minimal-parabolic filtration, Weyl permutations and normalized versus ordinary torus action are distinguished. |
| local-spherical | Hyperspecial, Satake and Whittaker normalization supplied generally; relative integral evaluation remains §5.3. |
| archimedean-globalization | CW hypotheses, smooth dual, nuclear completed tensor and continuous currying specified. |
| archimedean-generic-induction | Componentwise parameter family and measure-zero exceptional locus specified; R05 corrects its equation locator. |
| archimedean-seminorms | Quantifiers on seminorms, exponent and N; finite S uniformity; actual Haar Cartan formula specified. |
| distribution-gk | Conditional semisimple descent and field-dependent null-cone homogeneity; multiplicity-product criterion, with separate relative symmetry. |
| local-schwartz-germs | Quasi-character space, Fourier measures, centralizers and empty regular germs specified. |
| local-tempered-bounds | Actual smooth vectors, Ξ/log bounds, all signatures and finite fixed-vector stages specified; relative integrability remains here. |
| local-plancherel | Actual tempered dual, Plancherel measure and induction disintegration specified, with no relative trace conclusion assumed. |
| local-fourier-extension | Unimodularity, λ, scaling cocharacter, derivative/weight estimates and self-dual measures specified. |
| enhanced-packets | Actual classification and central/Whittaker restrictions, not an arbitrary bijection or GGP assumption. |
| ordinary-endoscopy | Geometric/quasi-character transfer precedes classification; actual packet character identities have only the classification owner. |
| real-oscillator-model | Real dual pairs, splittings, mixed-model decay and integrated pairings specified. |
| real-small-theta | Equal/adjacent rank, actual enhancements, one/two signatures and determinant twist specified; checked against Xue including PDF formulas. |
| adelic-measures | Convergence-factor Tamagawa measure and rational quotient mass are not supplied by arithmetic adeles or generic restricted products. |
| automorphic-realization | Actual cusp/Schwartz representations, rapid decay and restricted smooth factorization; no period nonvanishing assumed. |
| global-parameters | Distinct Hermitian constituents, signed Asai condition, actual global multiplicity and strong/weak base change specified. |
| l-factors | R03: compound intake contract; individual detailed hypotheses are useful but need separate precise requests. |
| automorphic-spectrum | Actual kernels and cuspidal-support contribution specified; star-generic calculation remains here. R04 requires the separate local trace bridge to be identified. |
| spectral-isolation | Named multiplier continuation and preceding-placement condition; not a duplicate construction. R07 concerns narration only. |
| relative-geometric-comparison | Actual regularized geometric distributions, matching and partial measure factors; excludes isolated spectral identity. |
| relative-finite-transfer | Both directions, arbitrary forms, dyadic and ramified places; support on one prescribed form allowed. |
| relative-archimedean-transfer | Dense subspaces in the actual Schwartz topologies, not unjustified surjectivity for every test. |
| relative-fundamental-lemma | Unit test for nonsplit unramified places; split spherical transfer; small residue characteristic retained by bp-fundamental line 99–119. |
| relative-character-comparison | Distinguished tempered representation, actual base change, nonzero explicit κ with global product one; source's dual/Whittaker conventions explicitly transported. |

### Dependency command and structural checks

The exact invocation in the brief exited 1 because `packages/GanGrossPrasadUnitaryGroups/README.md` does not exist. Its substantive diagnostic, with the path expressed repository-relatively, is:

```text
FileNotFoundError: [Errno 2] No such file or directory: 'packages/GanGrossPrasadUnitaryGroups/README.md'
```

Running the same check with candidate `packages/GanGrossPrasadUnitaryGroups/design/README.md` exited 0 and produced:

```text
candidate: GanGrossPrasadUnitaryGroups is not in the merge order yet; checked as if placed after ModularityAndLanglandsExtensions (the intake inserts it when its design is accepted)
depcheck: 8 roadmaps, 57 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The internal target graph has no forward prerequisite or cycle. R04 is a missing declared edge, not an order reversal. All 12 supplier records were checked against their README contracts. JSON and TOML parse; target/API/Check names resolve; the 17 source entries comprise 16 certified texts and one settled waiver. No missing-reference request was created.

## Not verifiable

- The original round-one review is absent. F01–F09 were verified against the available repair report's descriptions, with quotations and independent source checks above.
- Elaboration: **not available (this lane does not elaborate)**. There is no `Suggested.lean` in this design package and no authorized elaboration command in the brief. No Lean command was run; no assertion that `sorry` was the only warning is made. Heavy local/automorphic carriers remain supplier work, so this is not a missing-forced-headline finding.
- `xue-bessel` is unread and already waived. No claim relies on it, and no missing-source request reopens it.
- The nine gap-owning primary supplier folders are not available in the supplied main/package trees. Their absence is explicitly declared; the detailed requested contracts, pins, available continuations and order were audited instead. This review does not certify that those supplier gaps have been implemented.
- The supplied open-roadmap copies were audited read-only. Their remote head identities were not independently refreshed; no GitHub write or credential access occurred.

Only the two requested review deliverables were added. The design, source manifest, merge order, pinned libraries and other roadmap files were left unchanged.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "eef1635e22970dcd6930347032132115333977c6", "job": "REV-DESIGN-GanGrossPrasadUnitaryGroups~2", "model": "gpt-6-astra", "worker": "chris-4"} -->
