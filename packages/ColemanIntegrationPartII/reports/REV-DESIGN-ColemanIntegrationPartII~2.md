<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/37#issuecomment-6304634313 -->
Review (codex) of c11fda8

Verdict: needs_changes

1. **F01** (P1) The rational-form Albanese reduction fails over nonsplit fields

   **Location.** `packages/ColemanIntegrationPartII/design/README.md:454`, hypotheses at line 456; `packages/ColemanIntegrationPartII/design/plan.json:1212`. Passage: “the induced isomorphism from the Albanese to X on closed rational one-forms modulo the span of df and dlog f.”

   **Claim.** Over an arbitrary characteristic-zero field k, every closed rational form is `a_X*η + df₀ + Σ c_i dlog(f_i)` with functions and scalars over k. In particular, this is asserted over finite p-adic fields, before finite-extension compatibility is constructed.

   **Witness.** Take k=ℚ₃, X=ℙ¹, α²=2, and ω=dt/(t²−2). Alb(X)=0. The geometric residues are ±1/(2α), outside k. Exact rational forms have zero residue; k-linear logarithmic derivatives of k-rational functions have residues in k.

   This satisfies the stated hypotheses, with a=0 away from the poles. More explicitly, at the closed point t²−2, every `dlog(f_i)` has residue the integer order of `f_i`, embedded in κ(x); no k-linear combination gives 1/(2α). Thus `albaneseReduction_rationalForms` is false, and the proposed proof of §4.0c cannot use it over K. The source's algebraic background is extended to algebraically closed characteristic-zero fields at colmez1998 line 602; its p-adic descent is separately explained at colmez1998 line 246. The displayed decomposition occurs at colmez1998 line 3396. Those passages do not justify the stronger rational decomposition over every k.

   **Exact repair.** Keep the final all-prime, arbitrary-reduction theorem. State and prove the geometric decomposition over an algebraically closed field, and add a named descent result before §4.0c. For the algebraic statement over arbitrary characteristic-zero k, replace the logarithmic subspace by its descended version, allowing traces of scalar logarithmic derivatives over finite separable extensions, and prove the corresponding quotient comparison. For this witness the missing term is `Tr_{k(α)/k}((1/(2α)) dlog(t−α))`. State the rationality and finite-extension independence of the resulting primitive before using it to construct natural integration; do not invoke §7.3, whose proof already uses §4.0c. Update the §4.0a rational-logarithmic rigidification wherever it uses the same nonsplit assertion. Add this quadratic-pole negative control alongside the split A¹ and G_m Checks. Keep the generality of the exported theorem rather than assuming all poles rational.

2. **F02** (P2) Linear Frobenius needs the residue-field hypothesis in the target

   **Location.** `packages/ColemanIntegrationPartII/design/README.md:299` and line 301; `packages/ColemanIntegrationPartII/design/plan.json:696`. Passage: “q is a positive power of p, q≥2; the operators are the constructed comparison operators”.

   **Claim.** The target constructs a K-linear q-Frobenius for finite K/ℚ_p under that hypothesis. Its supplier contract at README line 63 is more restrictive: the q-power residue-field action must be the identity when the coefficient lift is the identity.

   **Witness.** Let K/ℚ₂ be unramified quadratic, with residue field 𝔽₄, and q=2. A K-linear lift fixes coefficient residues, whereas a 2-power Frobenius sends α∈𝔽₄−𝔽₂ to α²≠α. Both requirements cannot hold.

   The directly checked supplier `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:12256`, at `c01dad49213cd0dd3c7b72b6023a0ce912a5e315`, explicitly uses residue field 𝔽_q and σ_K=id. Its base-change law at line 12269 replaces F by Fʳ when the residue field is enlarged. A correct supplier paragraph does not fill the missing explicit hypothesis in the target's constructor and planned Lean signature.

   **Exact repair.** Set `q=(#κ_K)^r` with r≥1 for the K-linear construction, or explicitly require a compatible q-power residue action and coefficient lift and retain semilinearity where appropriate. Propagate that condition to §§3.5 and 6.3 and their iterate APIs. In the operator base-change API specify when the operator is merely scalar-extended and when the Frobenius associated with the enlarged residue field is an iterate. Add the unramified quadratic example: q=2 is not an identity-coefficient lift, while q=4 is. This retains every finite coefficient field and every prime.

3. **F03** (P2) Supply direction remains uncertified because the roadmap is absent from the order

   **Location.** `merge-order/ORDER.txt:1` through its end at line 144; `packages/ColemanIntegrationPartII/design/README.md:33` and its eight roadmap supplier contracts. Passage from the gate: “NOT IN ORDER: ColemanIntegrationPartII (insert it after its last supplier)”.

   **Claim.** The design is ready to consume those suppliers in a single registered merge direction. The repair report acknowledges the gap, but the required registration has not happened.

   **Witness.** The exact prescribed package-root command exits 1 because `packages/ColemanIntegrationPartII/README.md` does not exist. Running the same dependency gate on `packages/ColemanIntegrationPartII/design/README.md` also exits 1 and reports the missing order entry.

   **Exact repair.** The merge-order owner must register this Part II after all its suppliers, including AnabelianGeometryAndNonabelianChabauty, then rerun the dependency check on the delivered design README. At packaging, also run the prescribed check on the actual package-root README. Do not change the tool or infer a successful order audit from the absence of UPWARD/CYCLE lines when the roadmap is not registered. The fix worker should coordinate this external registration; this review changes neither the order nor the design.

4. **F04** (P3) Give natural reciprocity its primary, version-correct locator

   **Location.** `packages/ColemanIntegrationPartII/design/README.md:490` and line 496; corresponding §4.0d locator in `packages/ColemanIntegrationPartII/design/plan.json`. Passage: “natural reciprocity identity used there”.

   **Claim.** The secondary invocation in besser-zerbes2017 supplies the source and proof route for the independently constructed natural reciprocity theorem.

   **Witness.** besser-zerbes2017 line 161 invokes Bes05 Proposition 3.6. In the legally fetched arXiv v1 of that primary work, reciprocity is Proposition 3.4 at besser2005 line 355; line 365 is Lemma 3.6, a degree formula.

   **Exact repair.** Cite *p-adic Arakelov theory*, arXiv math/0301029v1, Proposition 3.4 and Lemmas 3.5–3.7, pp. 8–9; retain the 2017 paper as the application. Its proof reduces along the finite map defined by f using the projection formula and then the residue theorem on ℙ¹ (besser2005 line 369 and line 376). Describe those intermediate finite-map statements explicitly in §4.0d's API/proof dependencies. The source service added `besser2005` during this review, retaining the requested published locator “Proposition 3.6” at `packages/ColemanIntegrationPartII/sources.toml:97`; this is a reviewer-added entry, not an author error. Correct that new entry to the actual arXiv-v1 locator when applying this finding. No pre-existing manifest entry was rewritten. The mathematical reciprocity conclusion itself passed this source check.

5. **F05** (P3) The branch Check must say valuation-ring unit

   **Location.** `packages/ColemanIntegrationPartII/design/README.md:841`; §7.1 test `SingleIntegral.branchTransport_2` in `packages/ColemanIntegrationPartII/design/plan.json`. Passage: “for a unit u the logarithm change is zero”.

   **Claim.** The Check makes branch invariance follow from being a unit, although the surrounding domain is K×.

   **Witness.** p is a unit of K. With λ=0 and λ′=2, its logarithm changes by 2, as the immediately preceding Check at README line 840 correctly computes.

   **Exact repair.** Say `u∈O_K×`, equivalently `v_p(u)=0`, in both files. Retain p as the field-unit negative control and a residue unit such as 1 as the positive control. No change to the branch-transport formula is needed.

Independent reviewer: `independent-review-REV-DESIGN-ColemanIntegrationPartII~2`. Date: 2026-10-21. Five findings: one P1, two P2 and two P3. The scope is a repairable Part II extension, not a reason to reject the roadmap.

## Verified sound

### Previous findings and repair verification

The requested prior report `packages/ColemanIntegrationPartII/reports/REV-DESIGN-ColemanIntegrationPartII.md` is absent. Accordingly these are checks of F01–F08 as identified in `packages/ColemanIntegrationPartII/reports/FIX-DESIGN-ColemanIntegrationPartII~2.md`, not a claim to have inspected the missing original findings. Each quoted passage below is from the revised design. Five repairs are repaired, two partly repaired and one not repaired.

| Prior item | Repaired passage and location | Result and independent evidence |
| --- | --- | --- |
| F01: nonexistent base natural-integration import | README:7: “whose L0 supplies analytic Laurent/logarithmic functions and whose L1 constructs good-reduction Coleman integration” | **Partly repaired.** The nonexistent §7.7 import is gone; §§4.0a–4.0c own the extension. The actual base L0/L1 boundary was read at its head. The new decomposition has R01. |
| F02: unbound producer contracts | README:87: “Layer 3 constructs component/full-coefficient/cohomology comparisons and wide-open reciprocity before the corrected pairing.” | **Partly repaired.** §§2.0, 3.0a–3.0c, 3.1a, 4.0d–4.0e, 6.0 and 7.0 now name producers. The order is acyclic. R01–R02 remain in the new construction; R04 improves the reciprocity source/proof route. |
| F03: duplicate analytic logarithms | README:181: “the analytic polynomial ring, its derivation, changeParam, primitive existence and constant kernel are imported” | **Repaired.** Read ColemanIntegration L0.20–L0.23, including coefficient and unit/small-perturbation hypotheses. The formal extension and broader coefficient theorem differ from that imported scope. |
| F04: disconnected graph API | README:97: “the identity on C⁰ and the negative of this equivalence on C¹ is a chain comparison” | **Repaired.** Pinned coboundary is head/source multiplicatively, hence head−tail additively. On 2→5 the signs are −3 versus +3. Quotient ranges agree; existing map/relabel/lift APIs are imported. |
| F05: whole-component comparison | README:544: “on residue domains of smooth special-fibre points agree, modulo one common constant” | **Repaired.** This matches besser-zerbes2017 Theorem 1.1. Annular values are separate in §4.3. At Tate valuations 1/3 and 2/3 the corrections are −1/3 and −2/3, disproving whole-annulus constant comparison. |
| F06: dependency certification | Repair report:25: “ColemanIntegrationPartII remains absent from the order.” | **Not repaired.** Reporting the failure is honest, but it remains the same external blocking condition. See R03 and the outputs below. |
| F07: ArithmeticDynamics locator | README:963: “§3.58, ‘No rational 5-cycles’, target `noRationalFiveCycle`” | **Repaired.** Head README:4899–4909 has exactly that theorem and ED.3/ED.4 inputs. §3.60 is the Möbius-product result. Rank 1<2 is retained. |
| F08: graph-definition pages | README:93: “Definitions 4.1–4.3, printed pp. 11–12” | **Repaired.** besser2017 line 528 begins Definition 4.1 before the page-12 marker at line 533; Theorem 4.4 is at line 553 on p. 12. Plan and original manifest agree. |

### Principles, completeness and source coverage

Read all 973 README lines and compared every main statement and proof sketch against the JSON. All 44 targets, 121 attached API entries and 142 Checks are accounted for. All 12 definition targets have an API and at least three Checks. All seven layers have Examples and Dependencies; all 44 targets have a locator and a Needs line. All main target statements and proof sketches occur verbatim in the README as the author's own design text; every API name is present. This comparison is between the two design artifacts, not copied source prose.

The roadmap is an extension of ColemanIntegration with an explicit boundary. No route-specific prime restriction, new computational algorithm, duplicate regulator ownership, copied source passage, process identifier, sorry'd data or `set_option` was found in the reviewed design. General graph lengths, loops, parallel edges, all genera, p=2 and p=3, ramification, nonsplit closed points, and arbitrary reduction are retained. Mathematical normalization and small examples are not executable algorithm targets. The final theorem's generality is appropriate; R01 concerns the proposed intermediate algebraic statement.

The shape comparison used main-branch `TauCetiRoadmap/StableReduction/README.md`, `TauCetiRoadmap/RigidAnalyticGeometry/README.md` and `TauCetiRoadmap/JacobianChallenge/README.md`. The requested sections, prose targets, Unicode mathematics, API names and discriminating Checks are present. No target-number catalogue or forbidden Hypotheses/API/Tests field-list layout occurs in the README. The plan's metadata phrase “proof lemma” is not a Lean declaration.

There were zero author-flagged unverified locators in the supplied design and manifest. The seeded string **PadicHodgeRegulators** occurs only as an intended downstream consumer (README:963; plan:2858); it is not a theorem target or a source locator. Its precise consumer interface cannot be certified: no package/main folder or matching open roadmap was found. This sample was not silently replaced or counted as verified. The producer statements offered to that consumer were nevertheless checked against the following text:

| Source/version and exact loci read | Statements checked and outcome |
| --- | --- |
| besser-dejeu2012 Definition 7.1, Proposition 7.3, Lemma 7.4, pp. 355–357; line 2232, line 2243, line 2251, line 2277, line 2299 | Formal characteristic-zero logarithmic algebra, double index, labelled triple data and both negative constant-shift signs agree. Auxiliary dependence is retained. |
| besser-dejeu2012 Definition 7.7 and Proposition 7.8, pp. 359–360; line 2413, line 2430 | The simple-pole formula and parameter-dependent constant term match, including both correction terms. |
| besser-dejeu2012 Lemmas 8.1–8.3 and Proposition 8.4, pp. 361–362; line 2529, line 2533, line 2546, line 2576, line 2591 | Pullback of all auxiliary entries, global rather than local choice cancellation, constants in slots two/three, and two q-eigenclass hypotheses match. The roadmap correctly replaces the split-boundary spectrum by qζ when needed. |
| besser-dejeu2012 Lemma 9.1 and Proposition 9.2, p. 364; line 2769, line 2776, line 2784 | Actual-form symbol map, kernel containment and Coleman one-form pairing are the stated results, not a free-symbol substitute. |
| besser2017 Definitions 3.1–3.4, pp. 9–10; line 402, line 421, line 428, line 435 | Local carriers, residue orientation, double-index order and point sums match. Formal germs are distinguished from infinite-negative-tail annular families. |
| besser2017 Definitions 4.1–4.3 and Theorem 4.4, pp. 11–12; line 528, line 545, line 553 | Differential sign and characteristic-zero decomposition match. Positive rational lengths are identified as an extension, with the rank argument provided. |
| besser2017 (4.2)–(4.7), pp. 13–14; line 609, line 611, line 627, line 646, line 654; Definition 4.11 and Proposition 4.12, pp. 15–16; line 738, line 747 | Čech signs, graph injection/retraction, correction order, proper cup and operator identities match. R02 records the coefficient/Frobenius hypothesis gap. |
| besser-zerbes2017 Theorem 1.1 and Corollary 1.2, pp. 2–3; line 74, line 88, line 95, line 108 | Smooth-residue comparison and positive valuation correction match. The text explicitly excludes an entire-annulus constant comparison. |
| besser-zerbes2017 §2, pp. 3–5; line 130, line 142, line 151, line 161; §3, pp. 5–6; line 245, line 265 | Divisor comparison, reciprocity invocation and Tate jump −log(q)/n match. The new compact subgroup argument fills the locally-constant-homomorphism step. The n=1,2 extension uses flagged refinements, not the source's n≥3 illustration alone. |
| colmez1998 introduction Theorem 1/Remark 2, pp. 1–3; line 189, line 229, line 246; II.1.2–II.1.4, pp. 73–74; line 2982, line 2986, line 2996 | All-prime natural single integration, affine universal values, good-reduction agreement and Galois descent are supported. R01 prevents treating the proposed nonsplit decomposition as already proved. |
| colmez1998 II.1.13, II.1.16–II.1.18, pp. 78–79; line 3147, line 3169, line 3193, line 3213; II.1.26–II.1.27, pp. 83–85; line 3376, line 3396, line 3399 | Abelian rigidification, logarithms and apparent-pole extension are located. The field-generality extrapolation in §4.0b fails the quadratic-residue witness. |
| vologodsky2001 arXiv v1 §1.1, p. 2; line 51; Theorem B(4), p. 5; line 195; Proposition 52, §17.2, p. 42; line 1806 | p>2 is explicit. Finite-extension compatibility and identification with Colmez are used only with that restriction; the all-prime theorem is not attributed to this preprint. |
| besser2005 arXiv math/0301029v1 Proposition 3.4, pp. 8–9; line 355; Lemmas 3.5–3.7 at line 358, line 365, line 369 | Newly fetched primary reciprocity source supports the result, including the finite-map proof. Its numbering differs from the published locator invoked by the 2017 paper; see R04. |

All six texts were read through legal source-cache extractions. Only the last work was fetched, through the required add-only source service. No source text was copied into repository files. No missing-reference table was needed. General-field extensions, rational metric extensions and descent consequences were checked as mathematical consequences, not attributed verbatim to a source's narrower theorem.

### Adversarial mathematics pass

Each row covers the named target and **all its attached API statements** in the plan; the API names are listed so the coverage of 121 entries is explicit. “Pass” records the stated finite/degenerate/sign tests and hypothesis check, not a formal proof. All defining conventions are additionally tested in the last row. Characteristic-p, zero-ring and q=1 tests are negative controls where the field/CharZero/q≥2 hypotheses exclude them. No claimed result is certified by a sorry build.

| Statement and attached API | Instances tried | Result | Change |
| --- | --- | --- | --- |
| §1.1 `Graph.LengthCochains`; `LengthCochains.mk`; `LengthCochains.ext`; `LengthCochains.div_d_adjoint`; `LengthCochains.map`; `LengthCochains.simple_laplacian`; `LengthCochains.simpleCochainsEquiv` | Empty graph; isolated vertices; loop; one edge 2→5; length 1/2; reversal | Pass: d=−3, pinned coboundary=+3; loop divergence 0; weighted product 12. V denotes actual vertices, not unused ambient elements. | None. |
| §1.2 `Graph.harmonic_exact_decomposition`; `harmonicProjection`; `harmonicProjection_changePotential`; `rationalLaplacian_rank`; `harmonicProjection_simpleCohomologyEquiv` | Tree; two components; triangle (3,0,0); characteristic 3; ℚ₃ | Pass: harmonic (1,1,1), exact (2,−1,−1); characteristic 3 fails uniqueness; two components need two constants. | None. |
| §1.3 `Graph.harmonic_subdivision`; `harmonic_subdivision_comp`; `harmonic_subdivision_residue` | Jump 6 split into lengths 1/3,2/3; m=1; attached tree; two successive subdivisions | Pass: jumps 2,4 preserve sum, energy and residue pairing; refinements compose. | None. |
| §2.0 `Annulus.residueTransport`; `residueTransport_degree`; `residueTransport_germ` | z=t²; z=t⁻¹; identity; quadratic point; infinite negative tail | Pass: residues 2,−1,1; trace of 1 is 2; general analytic families are not bounded-below formal germs. | None. |
| §2.1 `Annulus.LogarithmicFunctions`; `LogarithmicFunctions.mk`; `LogarithmicFunctions.ext`; `LogarithmicFunctions.residue_zero_iff`; `LogarithmicFunctions.changeParameter` | 2+3L; scalar; L²; formal u=az(1+h); characteristic p | Pass: residue 3; constants killed; L² outside the specified subspace; characteristic p excluded. | None. |
| §2.1a `AnnulusLogRing.generalCoefficients`; `generalCoefficients_primitive`; `generalCoefficients_base` | ℚ₂ and ℚ₃; coefficients trivial on ℚ; open versus closed radii | Pass: halves and thirds exist; inverse-integer growth is absorbed on interior radii; no closed-boundary assertion. | None. |
| §2.2 `Annulus.doubleIndex`; `doubleIndex_ext`; `doubleIndex_add_left`; `doubleIndex_reverse`; `doubleIndex_add_constants` | (1,L), (L,1), (z,z⁻¹), (L,L); two scalar shifts | Pass: 1,−1,−1,0; change A Res(dG)−B Res(dF); alternation and uniqueness agree. | None. |
| §2.3 `Annulus.doubleIndex_pullback`; `doubleIndex_scalarExtension`; `doubleIndex_shrink` | Identity; degree two; inversion; constant map; coefficient tower | Pass: factors 1,2,−1 with orientation; degree-zero map excluded; extension and restriction commute. | None. |
| §3.0a `Semistable.colemanCover`; `colemanCover_restrict`; `colemanCover_refinement` | Smooth model; xy=π; self-node after subdivision | Pass: paired residues +1,−1; self-node uses distinct refined domains; no natural-primitive restriction assumed. | None. |
| §3.0b `ColemanWideOpen.fullAnalyticExtension`; `fullAnalyticExtension_ker`; `fullAnalyticExtension_integrate`; `fullAnalyticExtension_map` | Transcendental α in (1−αz)⁻¹; scalar; log z; unrelated end constants | Pass on specified scope: full coefficients differ from finite algebraic tensor sums; global constant kernel and compatible end restrictions are owned targets. | None. |
| §3.0c `Curve.semistableDeRhamComparison`; `semistableDeRhamComparison_exact`; `semistableDeRhamComparison_cup`; `semistableDeRhamComparison_operators` | Good reduction in positive genus; total coboundary; diag(1,q); K residue 𝔽₄,q=2 | Čech and monodromy tests pass; claimed linear Frobenius lacks its explicit coefficient condition. | R02. |
| §3.1 `ColemanWideOpen.doublePairing`; `doublePairing_eq_sum`; `doublePairing_constant_independent`; `doublePairing_restrict`; `wideOpen_residue_sum_zero` | Zero differential; rational core; second-kind classes with cup 1; added regular disc | Pass: values 0,0,1; global constants cancel by total residues; added regular disc contributes 0. | None. |
| §3.1a `ColemanWideOpen.doublePairing_reciprocity`; `doublePairing_analyticExact`; `doublePairing_logUnit`; `doublePairing_qRadical` | Rational compactification; cup 1; log unit; nonsplit quadratic boundary | Pass: projection cup formula, radical and −q boundary eigenvalue; no 1/q eigenvalue. | Carry R02 convention. |
| §3.2 `Semistable.HarmonicPrimitiveData`; `HarmonicPrimitiveData.mk`; `HarmonicPrimitiveData.ext_mod_constant`; `HarmonicPrimitiveData.linear`; `HarmonicPrimitiveData.jump_change`; `HarmonicPrimitiveData.jump_class` | Bridge jump 2; triangle cycle; one component; self-node refinement | Pass: subtract 2 at head; cyclic cochain survives; normalized families form one constant torsor. | None. |
| §3.3 `Semistable.auxiliaryDoubleIndex_formula`; `auxiliaryDoubleIndex_edgeReverse`; `auxiliaryDoubleIndex_changeConstants` | (c,d,rη,rω)=(2,3,5,7); simultaneous reversal; component constant | Pass: correction −11; reversal preserves it; arbitrary component constants need not preserve either side. | None. |
| §3.4 `Semistable.correctedDoublePairing`; `correctedDoublePairing_eq_aux`; `correctedDoublePairing_cup`; `correctedDoublePairing_refinement`; `correctedDoublePairing_ext` | ℙ¹; Z empty; proper cup 1; exact representative; rational tail | Pass: genus-zero pairing 0; proper classes use Čech data; harmonic graph correction and second-kind cup order agree. | None. |
| §3.5 `Semistable.correctedDoublePairing_phi_N`; `correctedDoublePairing_phi_iterate` | N=0; φ=diag(1,q), N(e₂)=e₁; arbitrary identity φ | Pass for actual compatible operators: scale q and cancellation 1−1=0. Identity φ fails for q≥2. | R02. |
| §4.0a `NaturalIntegration.abelianPrimitive`; `abelianPrimitive_differenceSplitting`; `abelianPrimitive_square`; `abelianPrimitive_invariant` | Dimension 0; invariant ω; df; locally constant perturbation; n=1,2 differences | Rigidification and constant ambiguity pass geometrically. Nonsplit rational-logarithmic exactness must not be inherited from the false §4.0b version. | R01 construction audit. |
| §4.0b `NaturalIntegration.albaneseReduction`; `albaneseReduction_rationalForms`; `albaneseReduction_removeApparentPoles`; `albaneseReduction_functorial` | A¹,dt; G_m,dt/t; point; proper curve; ℙ¹/ℚ₃,dt/(t²−2) | Split tests pass; nonsplit residues ±1/(2√2) refute the general rational decomposition. | R01. |
| §4.0c `SingleIntegral.naturalIntegration`; `singleIntegral_universalAffine`; `singleIntegral_baseChange`; `singleIntegral_goodReduction`; `singleIntegral_exact_log` | A¹:0→1; G_m:1→p; equal endpoints; p=2; pullback identity | Expected values 1,T,0 and natural-theory uniqueness pass; producer proof is blocked by R01. | Repair preceding descent. |
| §4.0d `Curve.naturalIndexReciprocity`; `naturalIndexReciprocity_principal`; `naturalIndexReciprocity_constants` | Nonzero constant f; ℙ¹ with dt and (t−a)/(t−b); f=0; finite map | Reciprocity passes: a−b cancels b−a; f=0 excluded. Primary proof uses finite-map projection. | R04. |
| §4.0e `Curve.jacobianIntegrationBridge`; `jacobianIntegrationBridge_natural`; `jacobianIntegrationBridge_compact`; `jacobianIntegrationBridge_moving` | ℙ¹; split multiplicative elliptic curve; noncompact K× valuation | Pass: compact J(K), open compact H, finite image of locally constant homomorphism; valuation is a noncompact counterexample. | None. |
| §4.1 `Semistable.dlog_residue_is_exact`; `dlog_residue_orthogonal_harmonic` | xy=π,f=x; nonzero constant; f=0; rational df,dlog f | Pass: Res=ord_head−ord_tail=1; residue cochain exact; global primitives have zero jump. | None. |
| §4.2 `Semistable.harmonicPrimitive_eq_singleIntegral`; `harmonicPrimitive_divisor_eq`; `harmonicPrimitive_goodReduction` | Tree; cycle; df,dlog f; Tate valuations 1/3,2/3 | Pass on smooth residue domains; annular differences −1/3,−2/3 exclude whole-component equality. | Underlying existence awaits R01. |
| §4.3 `Semistable.singleIntegral_on_annulus`; `singleIntegral_annulus_reverse`; `singleIntegral_annulus_baseChange` | F_tail=2,c=6,t=1/3; reversal; ramification 2; c=0 | Pass: value 4 in both orientations; refined jumps 3,3; relative metric coordinate required. | None. |
| §4.4 `Semistable.globalDoublePairing_eq_pointSum`; `globalDoublePairing_exact`; `globalDoublePairing_constants` | Z empty; second-kind cup 1; exact form; global constant | Pass: empty sum only concerns global regular forms; proper classes use second-kind representatives; constants cancel. | None. |
| §5.1 `Annulus.TripleIndexData`; `TripleIndexData.mk`; `TripleIndexData.ext`; `TripleIndexData.changeConstant`; `TripleIndexData.pullback`; `TripleIndexData.linearCombination` | All L with half-squares; all zero; pair constants (1,−1) and (1,0); permutations | Pass: half-squares valid at p=2; opposite shifts preserve products; mismatched shifts fail; labels retained. | None. |
| §5.2 `Annulus.tripleIndex`; `tripleIndex_unique`; `tripleIndex_symm`; `tripleIndex_threeTerm`; `tripleIndex_meromorphic` | (1,1;L); (z,z;z⁻²); (z,z⁻¹;L); all L | Pass: 1,−2,1,0 for the specified auxiliaries; three-term and symmetry laws use permuted common data. | None. |
| §5.3 `Annulus.tripleIndex_changeConstant`; `tripleIndex_changeBoth` | (L,0;L); auxiliary shift 1 or 2; shift only F,G pair | Pass: changes −1 or −2; unused pair does not affect T; zero function slot alone does not force 0. | None. |
| §5.4 `Annulus.tripleIndex_simplePoles`; `tripleIndex_simplePoles_zeroConstantPrimitives` | (2+L,3;L); all half-squares; u=az; higher pole excluded | Pass: value 6; all-L value 0; constant term changes by −δ while transported index is invariant. | None. |
| §5.5 `Annulus.tripleIndex_pullback`; `tripleIndex_pullback_comp` | Degrees 1,2; reversal; composition; change one auxiliary after pullback | Pass: 1,2,−1 degree/orientation factors; changed auxiliary breaks claimed transport as expected. | None. |
| §6.0 `ColemanWideOpen.formSymbolRelations`; `formSymbolRelations_kernel`; `formSymbolRelations_restrict` | Analytic gη; G dC; nonzero [dG]⊗η; equal actual presentations | Pass: analytic/zero forms have zero symbol; nonzero symbol prevents zero form; source supplies actual relation theorem. | None. |
| §6.1 `ColemanWideOpen.tripleIndex`; `tripleIndex_eq_endSum`; `tripleIndex_globalChoices`; `tripleIndex_congr` | Zero triple; rational wide open; positive-genus B_U(F,H)=1 with G=1 | Pass: 0,0,1; global construction cannot factor through [dG]. | None. |
| §6.2 `ColemanWideOpen.tripleIndex_laws`; `tripleIndex_add_const_second`; `tripleIndex_const_third`; `tripleIndex_restrict` | Add 2 to G; global auxiliary shift; shift at only one end with residue 1 | Pass: changes 2,0,−1; singular arbitrary excisions are excluded. | None. |
| §6.3 `ColemanWideOpen.tripleIndex_frobenius_vanishing`; `tripleIndex_frobenius_iterate` | q=2; zero eigenclass; G=1 with F outside q-eigenspace; iterate | Vanishing argument and reciprocal 1/2 pass under compatible Frobenius; dropping F hypothesis gives T=1. | R02 convention. |
| §6.4 `ColemanWideOpen.colemanFormPairing`; `colemanFormPairing_unique`; `colemanFormPairing_relation`; `colemanFormPairing_restrict` | 1 dH; G dC; two presentations of d(GH) | Pass: B_U,0 and equal pairing on actual form relations; generator uniqueness justified. | None. |
| §7.0 `TateCurve.uniformizationDifferential`; `uniformizationDifferential_pullback`; `uniformizationDifferential_charts` | q=p³; final q-gluing; n=1,2; q=1; p=2 | Pass: differential preserved, logarithm shifts; loops/refinement required; n=0 excluded. | None. |
| §7.1 `SingleIntegral.branchTransport`; `branchTransport_comp`; `branchTransport_exact` | λ=λ′; u=p; ramified uniformizer e=2; exact form; valuation unit | Formula passes: 0,Δλ,Δλ/2,0; ambiguous unit Check does not distinguish K× from O_K×. | R05. |
| §7.2 `SingleIntegral.properHolomorphic_branchIndependent`; `properHolomorphic_universalCoefficient_zero` | ℙ¹; multiplicative elliptic reduction; nonproper G_m; no rational basepoint | Pass: 0, canonical abelian logarithm, branch-dependent λ counterexample; temporary basepoint removed after extension. | None. |
| §7.3 `SingleIntegral.coefficientTrace`; `coefficientTrace_tower`; `singleIntegral_galois`; `primitive_galois_average` | L=K; quadratic ramification at 2; α²=π; finite tower; equal endpoints | Pass: trace multiplies K-values by degree, not 1; Tr α=0 but Tr α²=2π; averaging divides a nonzero integer. | None. |
| §7.4 `Curve.divisorSingleIntegral`; `divisorSingleIntegral_split`; `divisorSingleIntegral_ext`; `divisorSingleIntegral_add`; `divisorSingleIntegral_baseChange` | D=[t²−π]−2[0],ω=t dt; D=0; one quadratic point minus one rational point | Pass: integral π; zero without K-point; last divisor has degree 1 and fails basepoint independence. | None. |
| §7.5 `Curve.tracedLocalIndexSum`; `tracedLocalIndexSum_split`; `tracedLocalIndexSum_tower`; `tracedLocalIndexSum_congr`; `tracedLocalIndexSum_bilinear`; `tracedEndIndexSum` | Quadratic closed point with B=1; infinity; rational point; empty set | Pass: trace 2 and infinity −2 cancel; traces of entire index used; local triple auxiliary dependence retained. | None. |
| §7.6 `Curve.integrationRealization_descent`; `integrationRealization_commonExtension`; `integrationRealization_divisor`; `wideOpenIndex_galoisDescent` | Good reduction; further ramified splitting; two models; quadratic constant field | Pass conditional on producers: common extension identifies intrinsic values; scalar 1 traces to 2; no invented global bad-reduction triple pairing. | R01 propagates to construction. |
| §7.7 `TateCurve.singleIntegral_normalization`; `TateCurve.singleIntegral_q_periodic`; `TateCurve.singleIntegral_branch` | q=p³,log(p)=1; z↦qz; n=1,2; branch shift; p=2 | Pass: jumps −1, primitive log(z)−ν_p(z); q-period and branch terms cancel; q=1 excluded. | None. |
| Standing conventions (§Conventions) | Field versus zero ring; characteristic p versus ℚ₂/ℚ₃; empty graph, two flags per loop; nodal reversal; q=1; trace of quadratic scalar | CharZero excludes zero denominators and characteristic-p kernels. Actual vertices must be used with the native graph. The computations −3, 4, −11, −1 and trace 2 pin the differential, annular, pairing, triple-choice and trace signs. No Lean mirrors are delivered at this design stage. | R02 and R05; Lean verification unavailable. |

### Duplication and supplier audit

Searches were by objects as well as names: graph cochains/coboundaries/cohomology, Laplacians, Laurent differentiation, logarithmic annular functions, Albanese/Picard, field trace, double/triple indices, harmonic cochains and natural/Vologodsky integration. Default-branch code search was used only to locate files; the declarations below were read at the manifest pins. Main-branch roadmap text and both specified open consumer heads were also searched. No second owner for the new integration/index targets was found in the inspected material. This is a scoped object audit, not a claim that search proves universal nonexistence.

| Existing object at its pin | Evidence inspected | Design disposition |
| --- | --- | --- |
| Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`: native multigraph | `Mathlib/Combinatorics/Graph/Basic.lean:90`: separate vertexSet, edgeSet and incidence; loops retained | Imported; the finite flag/metric cochain theory is the addition. Interpret V as the actual vertex subtype. |
| Same Mathlib pin: Laplacian | `Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean:80`, `:125`: lapMatrix and neighbor-difference action | Imported through §1.1 comparison; rational lengths and multigraphs are the kept variant. |
| Same Mathlib pin: formal Laurent derivative | `Mathlib/RingTheory/LaurentSeries.lean:132`, `:176`, `:184`: hasseDeriv_coeff, derivative, derivative_map | Existing carrier and derivative imported; no analytic infinite-tail identification. |
| Same Mathlib pin: traces | `Mathlib/RingTheory/Trace/Defs.lean:110`, `:137`; `Mathlib/RingTheory/Trace/Basic.lean:249` | Free/finite tower and separable embedding hypotheses retained; trace identities are imported, not recreated as general algebra targets. |
| Same Mathlib pin: p-adic norm/completion | `Mathlib/NumberTheory/Padics/PadicNumbers.lean:798`, `:1024` | Native coefficient foundation only. |
| Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`: graph cohomology | `TauCeti/Combinatorics/SimpleGraph/Cohomology/Basic.lean:54`, `:79`, `:99`; `TauCeti/Combinatorics/SimpleGraph/Cohomology/Map.lean:97`, `:169`; `TauCeti/Combinatorics/SimpleGraph/Cohomology/Relabel.lean:123`, `:130` | Repaired signed chain bridge and value-preserving quotient comparison reuse existing lift/map/relabel APIs. |
| Same Tau Ceti pin: Albanese universal property | `TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean:84`, `:109`, `:173` | Imported IsAlbanese, homEquiv and uniqueUpToIso; higher-dimensional existence is an additional target. R01 concerns rational forms, not this carrier. |
| Same Tau Ceti pin: restricted-series norm and completeness | `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean:88`, `:151` | Imported norm_eq_gaussNorm and CompleteSpace with positive radii/complete coefficients. |

All eight roadmap supplier contracts and all 44 Needs lines were read. Four suppliers are on main: RigidAnalyticGeometry §§1.3, 2.3, 6.2, 8.1; StableReduction Layers 0–2, 4–5, 7, 9; JacobianChallenge D–F; EllipticCurves Layer 4. Their cited sections exist. In particular StableReduction:550–572 includes genus 0 and 1, :615 separates marked sections; EllipticCurves:885 supplies point-level Tate uniformization for nonzero q; RigidAnalyticGeometry:479 retains quasi-separatedness in global field extension. JacobianChallenge:449–468 owns the curve Albanese map; it does not supply the higher-dimensional rational-form comparison claimed here.

The four open supplier heads inspected were:

| Supplier | Head and exact boundary checked |
| --- | --- |
| ColemanIntegration | `acaaf506f3822fc5c8211345cb48f6b1cb00656c`: L0.A1/A2, L0.11–L0.23, L1.2–L1.3, L1.17–L1.19 including L1.17a, L1.43. L0.22 is the analytic polynomial-log primitive theorem; L1.17a is algebraic coefficient extension, not equality with the full analytic ℂ_p algebra. |
| AnabelianGeometryAndNonabelianChabauty | `59d989dd138cd28b4a4643ab233c04ad6d62aa34`: §5.8 at README:6829, arbitrary-reduction abelian logarithm and its ℂ_p-point extension. |
| ResolutionOfSingularitiesCharacteristicZero | `7f4bd21732080caa7af07328917421939f6c7cd9`: §6.2 at README:770, smooth quasi-projective input and smooth projective compactification preserving it. |
| PadicDifferentialEquationsAndRigidCohomology | `c01dad49213cd0dd3c7b72b6023a0ce912a5e315`: RD.4.31–RD.4.33, RD.5.76, RD.6.1, RD.6.86, RD.6.88, RD.6.92. The supplier includes the needed coefficient condition for linear Frobenius; R02 asks the consumer target to retain it. |

No inspected supplier refers back to ColemanIntegrationPartII. All eight suppliers are permitted by the brief. There is no observed reverse edge; placement itself remains uncertified by R03. The four open supplier folders are absent on the supplied main checkout, so they are new roadmap dependencies rather than revisions of existing main roadmaps. No new ownership move from a later roadmap is needed for the repairs proposed here.

ArithmeticDynamics was read at `1921611a7a96ac19fb15c2b1291b35958c3ef0cb`, and ErdosProgressionPowers at `e101259371172a32b3dd13e926676ae33b6af5cd`. They own their dynamical and progression conclusions, not integration indices. The former consumes ED.3/ED.4 at §3.58; the latter consumes fixed-exponent rational-point finiteness. Neither is used as a supplier here. PadicHodgeRegulators and EllipticRegulators remain intended consumer descriptions with unavailable precise interfaces.

Mechanically, all **110** internal `target:` prerequisite edges refer to an existing earlier target; there are no internal cycles or forward edges. This does not certify every prose proof premise: R01 and R04 identify work needed in the natural-integration proof route.

The exact prescribed package-root gate exited 1. Its terminal error, with the machine-specific prefix omitted, was:

```text
FileNotFoundError: [Errno 2] No such file or directory: 'packages/ColemanIntegrationPartII/README.md'
```

The same gate and order applied to the actual design README exited 1 with this complete diagnostic output:

```text
NOT IN ORDER: ColemanIntegrationPartII (insert it after its last supplier)
depcheck: 3 roadmaps, 10 edges, 1 problem(s)
```

Neither run emitted an UPWARD or CYCLE diagnostic, but neither was successful. The tool's three-roadmap coverage is not the independent eight-supplier audit above. This is not claimed as a false positive.

## Not verifiable

- **Prior original review:** `packages/ColemanIntegrationPartII/reports/REV-DESIGN-ColemanIntegrationPartII.md` is absent. Only the eight repair-report descriptions could be rechecked; unrecorded details of the original review cannot be certified.
- **Seeded PadicHodgeRegulators consumer:** no main folder, package or matching open roadmap was found. README:963 and plan:2858 provide no consuming section or mathematical locator. Its intended use is not a verified downstream contract. EllipticRegulators has the same limitation.
- **Lean elaboration: not available.** No `Suggested.lean` is delivered in this package/design, and the brief gives the elaboration command as “not available”. No Lean command was run, no type was elaborated and no claim that sorry is the only warning is possible. Headline signatures, explicit-binder retention, per-definition example counts and Lean mirrors of the convention Checks must be checked when that artifact is supplied. This is reported as a design-stage limitation, not fabricated build success.
- **Published reciprocity numbering:** the published Bes05 Proposition 3.6 was not read. The legally available arXiv-v1 text was read; its Proposition 3.4 is the verified statement. The service's new entry retains the initial published locator and needs the version correction in R04.
- **Successful external dependency certification:** unavailable until the order owner registers the roadmap and the gate is rerun. The internal target graph was checked separately.

No mathematical text still needed for these findings was inaccessible. The source service appended one entry; all original source entries and all design text were left unchanged. The review writes only this report and `packages/ColemanIntegrationPartII/design/review.json`, apart from that allowed source-service append and scratch work.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c11fda86d44ec979d2f41b5ff33314045abcd657", "job": "REV-DESIGN-ColemanIntegrationPartII~2", "model": "gpt-6-astra", "worker": "chris-3"} -->
