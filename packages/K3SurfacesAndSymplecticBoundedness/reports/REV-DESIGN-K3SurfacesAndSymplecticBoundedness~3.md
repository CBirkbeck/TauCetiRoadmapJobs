<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/63#issuecomment-6308223295 -->
Review (codex) of bad2b1d

Verdict: needs_changes

1. **F01** (P1) The rank-20 quotient argument consumes later K3 results

   **Location:** `packages/K3SurfacesAndSymplecticBoundedness/design/README.md:643` and `packages/K3SurfacesAndSymplecticBoundedness/design/plan.json:1457`. Passage: “In rank20 the isotropic-root-complement/Jacobian-fibration argument of Lemma3.2 excludes square determinant.” The Needs list is at README line 645.

   **Claim:** §6.1 proves nonsquareness of the rank-20 exceptional determinant using only its listed earlier inputs.

   **Witness:** dolgachev-keum lines 465–470 use rank at least 21 ⇒ supersingularity and the p-elementary Picard discriminant; lines 497–505 use the Jacobian K3 discriminant p^(2σ), σ>0. These inputs are absent from §6.1's dependency closure.

   The design supplies the rank-21 exclusion only through §§6.7a–6.7c and the discriminant theorem in §6.7. The declared genus-one geometry gap supplies neither K3 height/rank nor the K3 discriminant theorem. Abstract IntegralLattices does not supply them either. The mechanically acyclic graph conceals these mathematical dependencies; §6.1a then uses the unsupported nonsquareness to eliminate orders 11 and 15.

   **Exact repair:** Move the independent targets presently in §§6.7, 6.7a, 6.7b and 6.7c before §6.1. Export the consequence that a geometric K3 of rank at least 21 has rank 22. Add these exact dependencies to the nonsquare-determinant assertion and its plan prerequisites. Spell out the Jacobian K3/rank comparison used in the cited proof. Keep §6.7d after the fixed-point table; it is not needed for this reordering. Update all identifiers, layer dependencies and gap consumer lists consistently.

2. **F02** (P2) Complete-intersection connectedness lacks hypotheses

   **Location:** `packages/K3SurfacesAndSymplecticBoundedness/design/README.md:58`; `packages/K3SurfacesAndSymplecticBoundedness/design/plan.json:3233`. Passage: “smooth complete intersections over all fields, including products of projective spaces”.

   **Claim:** The gap asks for connectedness for this entire class, without a dimension or positivity condition.

   **Witness:** Over ℂ, V(x₀x₁)⊂ℙ¹×ℙ² is a smooth Cartier complete intersection, the disjoint union of two copies of ℙ². Also V(x₀x₁)⊂ℙ¹ is a smooth disconnected zero-dimensional complete intersection.

   These examples concern the requested general theorem, not its two valid K3 applications.

   **Exact repair:** Separate the unrestricted regular-immersion conormal/Koszul interface from connectedness. Give the latter its precise sufficient hypotheses: for example a positive-dimensional complete intersection of ample effective Cartier divisors in a product of projective spaces, with the appropriate geometric version over arbitrary fields. State explicitly that the quartic and the (1,1),(2,2) example satisfy them. Add both counterexamples as negative controls and an exact source locator for the general connectedness theorem. Synchronize `needs` and `detail`.

3. **F03** (P2) The finite-field Brauer gap is already supplied

   **Location:** `packages/K3SurfacesAndSymplecticBoundedness/design/README.md:82`; `packages/K3SurfacesAndSymplecticBoundedness/design/plan.json:3320`. Passage: “the missing input is its cohomological comparison”.

   **Claim:** H²_fppf(Spec k,G_m)≅Br(k) for a finite field requires a new JacobianChallenge Part III contract.

   **Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3608` supplies `smoothGroup_fppf_etale_comparison`; line 3838 supplies `etale_galois_comparison`. At the Tau Ceti pin, `TauCeti/Algebra/CrossedProduct/Comparison.lean:267` defines `TauCeti.brauerCohomologyEquiv` for fields.

   Apply the first comparison to G_m, the second in degree two, and the inverse of the pinned Brauer equivalence. This gives the requested comparison over every field. The already correctly cited `TauCeti.subsingleton_brauerGroup_of_finite` then gives vanishing. SchemeAndStackFoundations §2.22 also explicitly imports these Brauer comparisons. The pinned equivalence was read at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, not inferred from a newer search result.

   **Exact repair:** Delete this gap from both declarations. Add SchemeAndStackFoundations §§2.10 and 2.15 and `TauCeti.brauerCohomologyEquiv` with its exact module to the supplier contracts. Point §§4.6 and 8.5 to their composite and the finite-field vanishing theorem. Preserve the independently derived continuity argument.

4. **F04** (P2) The Brauer descent gap requests an existing spectral sequence

   **Location:** `packages/K3SurfacesAndSymplecticBoundedness/design/README.md:120`; `packages/K3SurfacesAndSymplecticBoundedness/design/plan.json:3545`. Passage: “Supply the multiplicative Hochschild–Serre spectral sequence”.

   **Claim:** The finite-free-action spectral sequence with G_m coefficients is new general theory to be supplied by EtaleCohomologyFoundations Part II.

   **Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3846` states `hochschildSerre_galois_covering` for every abelian étale sheaf on a finite étale G-torsor. Its quadratic-cover Check explicitly uses G_m. G_m is an abelian sheaf in multiplicative notation.

   This existing owner is broader than the smooth-surface specialization. Scheme §2.23 alone would not justify G_m, since its main construction concerns O-modules; §2.15 is the correct supplier. The low-degree surface refinements and their compatibility may still require an additional contract.

   **Exact repair:** Import `SchemeAndStackFoundations §2.15 hochschildSerre_galois_covering`. Narrow `gap:equivariant-brauer-descent` to any genuinely additional, explicitly stated edge-sequence/Kummer/restriction compatibility, listing the existing spectral sequence as its input. Likewise explain precisely what remains beyond this theorem and the existing adic passage in `gap:finite-etale-quotient-invariants`; do not request construction of the finite-cover spectral sequence again. Retain units and differentials in the surface deduction.

5. **F05** (P2) Characteristic-zero adjoint vanishing has an earlier owner

   **Location:** `packages/K3SurfacesAndSymplecticBoundedness/design/README.md:92`; `packages/K3SurfacesAndSymplecticBoundedness/design/plan.json:3500`. Passage: “including characteristic-zero Kodaira–Ramanujam vanishing for nef and big line bundles”.

   **Claim:** This is part of new general theory requested from AlgebraicVectorBundles Part II.

   **Witness:** `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:10270`, §9.10, already states `algebraicAdjointVanishing` for smooth projective characteristic-zero varieties and nef big rational divisors with SNC fractional support. An integral divisor has empty fractional support.

   Read at that new-roadmap head `98fd03823a4797777f298cf65d50ff0cafb51c43`. The roadmap is an earlier permitted supplier and already supplies other inputs here. Its integral surface case is exactly the requested characteristic-zero vanishing.

   **Exact repair:** Import §9.10 `algebraicAdjointVanishing` for the characteristic-zero branch of §7.4. Remove that theorem from the new gap's `needs` and `detail`. Retain only the genuinely additional adjoint separation and positive-characteristic statements, with their full hypotheses and distinct ownership. Add the existing supplier to the plan and layer dependencies.

6. **F06** (P3) Several sampled general contracts lack supporting locators

   **Location:** `packages/K3SurfacesAndSymplecticBoundedness/design/README.md:152` and the sampled contracts at lines 58, 60, 62, 64, 68, 118, 122 and 148. Passage at line 152: “the rational degree-one crystalline comparison with the Dieudonné realization of the reduced Picard variety”.

   **Claim:** The listed citations certify the general supplier statements as written.

   **Witness:** deligne-lift line 27 restricts Proposition 1.1 to K3 surfaces; lines 29–57 compute K3 Hodge/crystalline ranks. They do not state the general Picard-variety comparison. Rizov lines 1075–1085 use K3 non-ruledness without proving general birational two-form invariance.

   The sample table below distinguishes a source application from a source for a general contract. Some contracts have no scholarly locator at all. The Kummer citation gives the K3 exact sequences, not the full general finite-H³-torsion formulation. The formal-Brauer citation verifies degeneration but not every requested general functoriality theorem. Also `plan.json` cites Liu Chapter 9.3 for surface projectivity, but the manifest lacks that work; the sources-service attempt failed and is recorded in the missing-reference list.

   **Exact repair:** Give a legal exact theorem/section/page locator for each still-needed general claim identified as partial or unlocated in the sample table, or identify an exact existing supplier theorem from which it is derived. Keep application locators as application locators. Add the missing cited work through the sources service; obtain a legal Liu text, a replacement, or a human waiver. Do not change existing author-recorded manifest entries or certify an unread theorem. For the Mathieu order calculation add Mukai §3, line 756 alongside (0.2), which only supplies the character table.

7. **F07** (P3) The ample-space contract omits its first consumer

   **Location:** `packages/K3SurfacesAndSymplecticBoundedness/design/README.md:977`; `packages/K3SurfacesAndSymplecticBoundedness/design/plan.json:2574`. Passage: “obtain a projective scheme by the ample-space criterion”.

   **Claim:** §7.3's `PolarizedK3Family.localRepresentative` follows from its listed dependencies.

   **Witness:** README line 981 has no `gap:ample-space-scheme`; its contract at line 72 and plan `neededBy` list only §§8.2 and 8.5. The stated localRepresentative construction already consumes it in §7.3.

   **Exact repair:** Add the declared ample-space criterion to §7.3's Needs, plan prerequisites, Layer 7 dependencies, and the gap's `neededBy`/Required by lists. Alternatively cite an exact earlier theorem supplying this same arbitrary-base criterion and remove any redundant gap scope. This is a missing edge to an owned contract, not a demand to implement a supplier here.

Seven findings: one P1, four P2 and two P3. The scope is repairable; rejection is not warranted. Declared supplier gaps are treated as contracts, not as missing implementations.

## Previous findings and repairs

The specified `packages/K3SurfacesAndSymplecticBoundedness/reports/REV-DESIGN-K3SurfacesAndSymplecticBoundedness~2.md` is absent. Consequently this comparison uses F01–F07 as recorded in `packages/K3SurfacesAndSymplecticBoundedness/reports/FIX-DESIGN-K3SurfacesAndSymplecticBoundedness~3.md`; it cannot certify that this is the complete original finding list. No item in that repair report is marked “not actionable in this package”. Quotations below are from the revised design, not from source texts.

| Previous item | Status | Repaired passage and independent check |
| --- | --- | --- |
| F01: Artin, pencil and Brauer inputs | Partly repaired | README §6.8a: “§6.7a rules out finite-height rank 21.” §§6.7a–6.7d now name the height, pencil and involution targets. Artin (0.1) retains projective lifting, and §6.7b retains quasi-elliptic fibres. However, the earlier §6.1 already needs the same rank/discriminant inputs: R01. The involution source proof limitation is recorded below. |
| F02: rational/Enriques algebraicity | Repaired | README §6.3: “In the free Enriques branch dim H²_et(X,ℚ_ℓ)^g=10”. The degree-two étale torsor, Chern projection, e=12 and H¹=H³=0 give b₂=10 without Picard-rank identification. The general unirational input is declared. |
| F03: Artin discriminant contract | Repaired | README line 156: “at discriminant length 22 require integrality and evenness of B/p including p=2”. The F_p-linear, not k-linear, Picard-mod-p clause is also present in the plan. See huybrechts line 14328 and dolgachev-keum line 744. |
| F04: rational versus ℓ-adic recognition | Repaired | README line 166: “the same conclusion for a compatible family of 24-dimensional Mathieu representations over every ℚ_ℓ with ℓ≠p”. The ℚ₂ quaternion obstruction is retained only when even group order makes p≠2. This matches dolgachev-keum lines 793–808. |
| F05: formal-Brauer and fibre index details | Repaired | README line 74: “finite-index identity d_M=a²d_R(φ)”. Line 148 explicitly includes pullback and trace. At a=2 the multiplier is 4, as required by dolgachev-keum line 443. Local group classification and ADE formulas have distinct contracts. |
| F06: finite-field Brauer and continuity | Partly repaired | README §4.6: “This proves continuity for the discrete Picard group.” Finite descent and finite generation do give an open kernel, and the algebraic Brauer vanishing theorem is correctly imported. The remaining cohomological comparison is also already supplied: R03. |
| F07: primary vector-field and unirational references | Repaired | README §2.1a: “rudakov-shafarevich-inseparable §2, Theorem 5 and Corollaries 1–2”. The 1976 and 1981 works are distinguished; shioda-unirational-primary lines 104–140 support the dominant-map argument. The rank calculation uses earlier surface inputs, avoiding the later K3 Betti calculation. |

## Verified sound

### Principles, shape and consistency

Read all 60 target subsections: 7 definitions, 6 constructions, 45 theorem targets and 2 mathematical examples, including their 82 API entries and 183 named Checks. All seven definitions and six constructions have at least three Checks and named APIs. All 60 target subsections have a locator and a Needs line. All eight layers end with Examples and Dependencies. The 60 plan target identifiers match the README order. The extra universal-functions sentence in plan §2.1 is explicitly present in the README's next paragraph, so it is not a discrepancy.

The 30 gap slugs match between README and plan; all have a named supplier and section. Every `needs` sentence occurs in the README, and every plan `neededBy` list matches the explicit plan prerequisites. This mechanical agreement does not detect the missing prose dependencies in R01 and R07. No explicit local target edge points forward. No existing K3 roadmap being replanned was found in the supplied main/board inventories. General surface, lattice and cohomology ownership is largely respected, with the duplicate contracts identified above.

Read the main roadmaps IntegralLattices, JacobianChallenge and GlobalQuadraticForms for form and ownership, and the relevant sections of SchemeAndStackFoundations, EtaleCohomologyFoundations, AlgebraicVectorBundles, StableReduction, ComplexKahlerGeometry, AlgebraicTopology, MorseNovikov, QuadraticFormInvariants and CFSGStatement. Read the relevant new-roadmap heads for CrystallineCohomology, ComplexComparisonPartII and AlgebraicModuliForArithmeticGeometry. ArithmeticDynamics and ErdosProgressionPowers' supplied package scopes have no overlapping K3 target or mathematical supplier role.

The design preserves arbitrary fields, inseparable extension, p=2 and p=3, wild finite-group boundedness, and all-prime finite-type moduli. The smoothness theorem alone is correctly restricted to ℤ[1/(2d)]. No computational algorithm, copied source passage, sorry'd data or `set_option` was found in the reviewed design. No design or content file was edited.

### Seeded source sample

All 15 requested contracts were examined. Four have their main mathematical assertion directly supported at the read locator (tame Lefschetz, Oda, cross-realization and the Mathieu character, with the supplementary order locator below). The Brauer field comparison is independently verified from existing suppliers. Ten have incomplete or absent source coverage for their full general scope; this is distinguished from a false theorem or an absent implementation.

| Contract | Locator read and hypotheses checked | Result |
| --- | --- | --- |
| hypersurface-cohomology | huybrechts lines 160–183, Chapter 1 Example 1.3(i), p.8, gives the quartic conormal calculation; lines 12221–12231 concern the Wehler application. | Neither supplies the unrestricted product connectedness assertion. R02; general locator needed. |
| surface-arithmetic-quotient | SchemeAndStackFoundations §5.10, lines 7130–7136, explicitly restricts its quotient to smooth projective surfaces over algebraically closed fields. | Extension is genuinely outside that supplier statement, but no exact source for the arbitrary-field extension is given. R06. |
| surface-quotient-resolutions | wild-cyclic lines 14–44 and keum lines 788–810 concern K3 cyclic quotients; no general source locator accompanies the contract. | K3 applications do not certify normal projective quotient/minimal resolution for every smooth projective surface and finite group in every characteristic. R06. |
| tame-quotient-singularities | dolgachev-keum Lemma 3.1, lines 399–402, pp.10–11, is group classification. Lines 450–463, pp.11–12, give formal quotient and ADE determinant use. | Local determinants and prime-to-p scope checked. The cited Lemma 3.1 is not a theorem proving discrepancy zero and R¹π_*O=0. Add the resolution locator. |
| ruled-surface-two-forms | rizov Theorem 4.3.3 Step 5, lines 1075–1085, p.25. | Correct application of non-ruledness, not a locator for general birational invariance/ruled vanishing. R06. |
| galois-brauer-descent | Scheme §§2.10,2.15 and pinned `brauerCohomologyEquiv`; finite-field algebraic vanishing in the pinned Trivial module. | Comparison and vanishing supported; this is duplicate scope, R03. |
| tame-lefschetz | keum Proposition 2.4, lines 336–341, p.8. | Smooth projective, algebraically closed positive characteristic, tame finite order and invertible ℓ match. Euler characteristic of the smooth fixed locus equals alternating trace; isolated points contribute 1. |
| surface-brauer-kummer | dolgachev-keum (4.3)–(4.4), lines 553–566, p.14, and lines 627–647, p.16. | Finite-level Kummer and K3 Tate-module sequences checked. Full general surface H³-torsion contribution and equivariant extension require a further locator. No canonical splitting or trivial group action was inferred. |
| equivariant-brauer-descent | dolgachev-keum (4.7), lines 599–615, p.15; Scheme §2.15. | The source's displayed specialized sequence is not the complete units/differentials contract. The general spectral sequence is already supplied; R04. |
| finite-etale-quotient-invariants | No scholarly locator in the contract. Scheme §2.15 gives finite-cover descent; rational averaging is legitimate even for ℓ dividing the group order. | Mathematical rational formula is sound; give the precise adic descent derivation and existing inputs, rather than citing F.2 base change alone. R04/R06. |
| oda-interface | oda Corollary 5.12, lines 2490–2502, p.131; lang-nygaard Theorem 1.1, lines 54–61, p.171. | Perfect positive-characteristic field, smooth proper scheme and Oda's rational point are retained. Injection into H¹_dR and indefinitely closed forms agree with the stated application. Dieudonné dual conventions still must be reconciled when implemented. |
| witt-formal-brauer | nygaard-closedness Corollary 2.7, lines 286–300, p.41; lang-nygaard lines 80–86; dolgachev-keum lines 652–661, p.16. | General p-divisible degeneration checked. Other passages give the K3 formal-group application, not exact general prorepresentability and trace theorem locators. Both-direction Hom vanishing follows from the nonzero finite-height p-series versus additive [p]=0. |
| crystalline-picard-degree-one | deligne-lift Proposition 1.1, lines 27–57, pp.59–60. | K3 ranks checked; the general rational Picard–Dieudonné comparison is not stated there. R06. |
| cross-realization | keum Proposition 2.1(1), lines 268–273, p.7; dolgachev-keum lines 758–760, p.19. | Integral characteristic polynomial and independence of ℓ/crystalline realization hold for arbitrary automorphisms in the stated projective domain. Identity action is deduced only after finite order, as required. |
| mathieu-permutation-model | mukai (0.2), lines 57–63, p.183; §3, line 756, p.201. | Retained 24-letter table checked; M₂₃ order 2⁷·3²·5·7·11·23=10200960, and index 24 gives M₂₄ order 244823040. The contract should cite the supplementary order locator. |

No explicit “unverified” locator flag occurs in README or plan. The three waived manifest sources remain settled; they were not reopened. Version metadata distinguishes the Huybrechts draft, arXiv versions and Nikulin Russian original.

### Adversarial mathematics pass

Each target row covers its statement, API entries, hypotheses, proof interfaces and Checks. “No defect found” means the listed substitutions did not reveal another defect; it does not claim a formal proof. Changes are recommendations only. Source/ownership issues in R03–R06 are additionally recorded in the contract tables.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: intersection, half-norm, determinant | Quartic H; rational curve C; zero | B(H,H)=4, Q(H)=2; B(C,C)=−2; signed rank-22 determinant negative | None |
| Conventions: pullback and contraction | id; f∘g; frame e₁,e₂; p=2 | Reverse pullback order; e₁↦e₂*, e₂↦−e₁*; alternating map remains invertible at 2 | None |
| Conventions: Tate twists and exponential | Point; quartic; t↦exp(2πit) | Trace 1; square 4; lifted increment +1 | None |
| 1.1 K3 predicate | Empty; ℙ²; E×E; smooth quartic | Nonemptiness, canonical line and H¹ separate examples | None |
| 1.2 transport | Identity; tower; purely inseparable extension | Faithfully flat coherent descent retains canonical triviality | None |
| 1.3 projectivity | Imperfect field; dimension 3 | Relative smooth surface hypothesis retained; no dimension-3 claim | None |
| 1.4 RR/contraction | O; H on quartic; p=2 | 2χ=4 and 8 in integers; contraction sign correct | None |
| 1.5 numerical kernel | O; torsion; effective (−2)-curve | Ample intersection and RR kill only trivial numerical class | None |
| 1.6 quartic | t=0,1,−1; Fermat over F₂ | χ=2,4,4; Fermat is nonreduced at 2 | Correct general supplier scope, R02 |
| 2.1 relative Picard | Field fibre; rank jump; zero/torsion | Unramified does not assert relative flatness; Brauer obstruction retained | None |
| 2.1a Witt kernel | x=0; infinite versus finite height; p=2 | Requires genuinely nonzero kernel; early rank proof uses general surfaces | None |
| 2.2 closedness | Zero form; Cartier iterates; p=2 | K3-specific proof does not assert general degeneration | None |
| 2.3 vector fields | E×E; p=2; characteristic zero | H¹(O) excludes abelian surface; characteristic-zero spreading valid | None |
| 2.4 Hodge/crystalline | Degrees 0–4 and >4; p=2 | Euler 24; derived reductions needed for integral freeness | Improve generic source locator, R06 |
| 2.5 deformation | Dual numbers; unmarked automorphisms | Dimension 20; marked functor is the stated object | None |
| 2.6 pair divisor | L=O; p divides 2d; characteristic zero | Trivial L excluded; flatness retained at bad primes | None |
| 2.7 lift | p=2; ramified trait | Finite ramified W(k)-extension allowed; not every chosen deformation lifts | None |
| 3.1 analytic predicate | Empty; torus; quartic | Compact connected nonempty surface and H¹ conditions discriminate | None |
| 3.2 GAGA | Projective embedding; nonprojective analytic K3 | Algebraic essential image restricted to projective analytic objects | None |
| 3.3 integral topology | Torsion candidate; quartic square; Euler sum | Exponential sequence plus Pic torsion-freeness kills H² torsion; duality handles H³ | None |
| 3.4 étale ranks | ℓ=p; ℓ=2≠p; trace of a point | Coefficient restriction and twists correct | None |
| 4.1 Picard descent | Identity; closed extension; nonzero Brauer obstruction | Rational and integral descent distinguished | None |
| 4.2 lattice | Gram [4]; zero; (−2)-curve | Even nonunimodular lattice; arbitrary-field positive class retained | None |
| 4.3 ranks | Closed field; rank 0; rank 22 at p>0 | Rank 0 impossible; h¹¹ is not Picard rank | None |
| 4.4 cycle map | Multiplication by ℓ on ℤ_ℓ; rank 22; char 0 | Saturation is essential beyond injectivity/equal rank | None |
| 4.5 congruence | n=0,1; ℓ=2,3; I+3E₁₂ | Dyadic −1 is a counterexample; odd-prime depth works | None |
| 4.6 bounded descent | Closed field; imperfect field; finite field; rational point | Finite basis gives open kernel; rank and full-group descent separated | Import existing Brauer comparison, R03 |
| 5.1 symplectic kernel | id; product; scaled volume; scalar −1 at p=2 | Kernel uses actual inverse-pullback representation | None |
| 5.2 stabilizer | id; scalar choice; Lⁿ | Scalar isomorphisms do not add automorphisms; torsion-free Pic gives equal stabilizers | None |
| 5.3 finite étale group | Nonclosed field; nontrivial involution; p=2 | Zero geometric tangent plus finite type gives finite étale; rational/geometric points differ | None |
| 5.4 Wehler example | S₁,S₂; their product | Gram determinant −12; S₂S₁ trace 14, determinant 1; volume scalar +1 | Correct supplier scope, R02 |
| 6.1 quotient | G=1; involution; root rank 20 | Empty determinant 1, eight A₁ determinant 256; rank-20 source needs later inputs | R01 |
| 6.1a cyclic arithmetic | n=2,4,11,15 | 24=8·3; 72=4·15+2·2·3; square candidates need exclusion | Repair prerequisite R01 |
| 6.2 fixed points | id; orders 2,7; wild element | id excluded; counts 8 and 3; tameness retained | Repair prerequisite R01 |
| 6.2a wild loci | Empty; κ=0,1; D²=2,d=1 | p=2 free branch retained; denominator N−d−1 can be zero | None |
| 6.3 quotient cohomology | Rational resolution; free C₂ action at p=2 | Algebraic invariant H² in rational branch; e=12,b₂=10 in free branch | None |
| 6.3a wild refinements | p=11,13; quasi-elliptic p=2,3 | Order-11 exceptional branch and small-characteristic pencils retained | None |
| 6.4 wild-prime bound | p=2,13; nonsymplectic finite group | Order-p element is symplectic; p=13 forces tameness | None |
| 6.4a Picard faithfulness | id; p=2; degree-two deck involution | Rank 22 and full Picard action essential | Waived primary source limitation below |
| 6.5 étale faithfulness | ℓ=p; free Enriques quotient; rational quotient | Coefficient exclusion and invariant-rank contradictions correct | Dependencies conditional on repaired §6.1 |
| 6.6 finite-group bound | G=1; char 3; wild G | Choose ℓ=5 at char 3; no averaging by group order | None |
| 6.7 discriminant | σ=0,11; p=2 | Signature excludes even unimodular lattice; rescaling evenness explicitly supplied | Move before §6.1, R01 |
| 6.7a height | h=1,10,11; infinite height | Bounds 20,2,0; h=11 contradicts positive rank; infinity not an integer input | Move before §6.1 |
| 6.7b pencil | Rank one; F versus 2F; p=2,3 | Primitive nef isotropic class needed; quasi-elliptic alternative retained | Move before §6.1 |
| 6.7c elliptic height/rank | No section; finite height; quasi-elliptic case | Artin's Jacobian comparison covers no-section case; quasi-elliptic uses unirationality | Move before §6.1 |
| 6.7d involution pencil | id; swap matrix modulo 2; p=2,3 | Source's integral involution assertion is false; design explicitly rejects it | Corrected rank argument not independently certified; see below |
| 6.8 Artin-one predicate | p=3, determinants −9,+9,−81; rank 20 | Only rank 22 with signed determinant −9 passes | None |
| 6.8a invariant dimension | G=1,C₇,C₇⋊C₃; exceptional pair | 24,6,6; no universal five-invariant assertion in exceptional case | New height dependencies present; R01 concerns earlier use |
| 6.9 character | n=1,2,7; wild element | Empty product 1; values 24,8,3; finite element order positive | None |
| 6.10 characteristic-zero groups | Trivial; involution; 23-cycle | Orbit counts 24,16,2; containment only, no converse realization | None |
| 6.11 tame groups | p=2; even group order; exceptional branch | p=2 tame order odd; ℚ₂ available when required; four-orbit branch retained | None |
| 7.1 primitivity | Zero; generator; twice generator; squarefree d | Zero/double fail; n² divides d for divisible ample class | None |
| 7.2 multiplication | n=0,3; char 3 | n=0 excluded; root locus closed without dividing by 3 | None |
| 7.3 polarized families | Constant family; d=0; obstructed representative | Picard-section and scalar-free arrows correct; missing ample-space edge | R07 |
| 7.4 vanishing | m=0,1,−1; d=2 | Positive powers only; section counts 4,10,20 | Existing char-zero owner, R05 |
| 7.5 cube embedding | d=1,2; p=2 | Dimensions 10,19; evenness rules out D²=1 in separation obstruction | None |
| 7.6 Hilbert locus | Smooth quartic; singular degeneration; rank-one nontrivial line | Actual canonical class equality required | None |
| 7.7 atlas | char 3; projective frames; no global root line | Picard root locus and local projective-frame descent retain all primes | None |
| 8.1 stack | Nontrivial stabilizer; p divides 2d | Correct DM groupoid, finite type over ℤ | None |
| 8.2 separation | Identity over trait; missing smooth family | Extends isomorphisms of given families, not arbitrary objects | None |
| 8.3 coarse space | Nontrivial inertia; distinct k-forms | Geometric-point statement does not identify rational forms | None |
| 8.4 smooth open | d=1; bad prime | ℤ[1/2] at d=1; no bad-prime smoothness | None |
| 8.5 finite-field forms | Fixed k,d; twists; representative obstruction | Frame cover counts actual k-forms after Brauer vanishing | R03 |

### Adversarial pass over the 30 supplier gaps

| Contract | Instances tried | Result | Change |
| --- | --- | --- | --- |
| surface-projectivity | Imperfect k; dimension 3 | Surface domain retained | Liu access/manifest issue, R06 |
| hypersurface-cohomology | Two fibres in ℙ¹×ℙ²; two points in ℙ¹ | Disconnected smooth complete intersections | R02 |
| oda-interface | Rational point after algebraic closure; p=2 | Source hypotheses retained | None |
| surface-arithmetic-quotient | Closed base versus imperfect base | No unconditional geometric/arithmetic equality asserted | Locator, R06 |
| tame-linear-groups | Trivial group; wild p-group | Prime-to-characteristic restriction needed | None |
| elliptic-surface-geometry | a=1,2; p=2,3; no section | Index multiplier 1,4; quasi-elliptic branch retained | None |
| artin-discriminant | σ=11; p=2; primitive/p-divisible class | Evenness and F_p-linearity explicitly required | None |
| ample-space-scheme | Local representative over nonfield base | Needed already in §7.3 | R07 |
| galois-brauer-descent | Finite field; arbitrary field comparison | Existing general comparison applies | R03 |
| witt-formal-brauer | Finite height h; additive formal group | Rank h and two Hom vanishings consistent | General locators, R06 |
| crystalline-gauss-bonnet | Point; surface c₂=24 | Rank Euler identity has correct degree | Deligne K3 citation alone is not general locator |
| crystalline-picard-degree-one | Pic⁰=0; positive-dimensional Pic⁰ | K3 specialization insufficient to source general comparison | R06 |
| crystalline-chern-derivative | L=O; nontrivial L | Zero obstruction for trivial class; derivative is the required extra input | None found |
| cross-realization | Identity; finite order; infinite order | Characteristic polynomial alone does not prove identity action in general | None |
| integral-topology | Unit circle; O(1) on ℙ¹ | Increment +1 and positive Chern degree | None |
| tame-lefschetz | Identity; isolated tame fixed point; wild action | Euler version handles identity; wild excluded | None |
| surface-quotient-resolutions | G=1; wild group | Identity quotient trivial; wild resolution cannot use averaging | General locator, R06 |
| tame-quotient-singularities | A₁; E₈; p dividing local order | Determinants 2 and 1; wild excluded | Precise resolution locator, R06 |
| quotient-transcendental-comparison | G=1; rational resolution; ℓ divides order | Rational averaging valid; no integral equality asserted | General source coverage remains partial |
| ruled-surface-two-forms | ℙ¹×C; birational blow-up | No global 2-form on ruled surface; K3 volume discriminates | General locator, R06 |
| mathieu-permutation-model | id; involution; 23-cycle | Fixed letters 24,8,1; 24-letter convention consistent | Supplement order locator |
| mukai-eleven-groups-recognition | G=1; Q₈; p=2 tame | Rational/ℓ-adic domains separated; dyadic obstruction retained | None |
| matsusaka-mumford | Generic identity; ruled special fibre | Non-ruled hypothesis essential; primary source waiver settled | None |
| adjoint-positivity | m=0; nef big mL; char 2 | Positive-characteristic restrictions retained; char-zero result already supplied | R05 |
| exceptional-mathieu-embeddings | Same-order different extensions | Contract retains actual group structures and embeddings | None |
| surface-brauer-localization | Points; exceptional rational trees; arbitrary divisor | Does not assert arbitrary-divisor invariance | None |
| surface-brauer-kummer | K3 H³=0; surface with finite H³ torsion | Finite contribution retained | General locator, R06 |
| equivariant-brauer-descent | G=1; C₂; nonzero units terms | Full spectral sequence needed; already supplied | R04 |
| rational-surface-cohomology | ℙ²; inseparable dominant map | Nonzero degree invertible in ℚ_ℓ; algebraicity descends | None |
| finite-etale-quotient-invariants | Free C₂ at p=2; ℓ divides order | Rational formula valid; integral version not asserted | Specify existing descent plus adic adapter, R04/R06 |

### Duplication and supplier-order evidence

Object searches covered native scheme morphism predicates, relative differentials, global line-bundle classes, integral lattice carriers, Brauer comparison/vanishing, congruence kernels and Mathieu presentations. Search results were used as discovery only; relevant files were then read at the pins. Confirmed native declarations include:

- Mathlib `SmoothOfRelativeDimension` in `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:127`, `IsProper` in `Morphisms/Proper.lean:41`, and `GeometricallyIntegral` in `Geometrically/Integral.lean:40`.
- Tau Ceti `Scheme.relativeDifferentials` and its universal property in `TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean:85`; `LineBundleClass` and its class-equality/tensor/triviality API in `TauCeti/AlgebraicGeometry/LineBundle/Class.lean:50`.
- The rational-ambient `TauCeti.IntegralLattice`, separate nondegeneracy mixin and `ofSubmodule` in `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean` agree with §4.2's intended specialization.
- Brauer finite-field vanishing and the additional comparison used in R03 were read at the Tau Ceti pin. The latter is an additive equivalence on the additive Brauer group, preserving the roadmap's additive Picard conventions.
- `Mathlib/NumberTheory/Padics/RingHoms.lean` already owns scalar reduction and its power-kernel API. No matching general matrix congruence torsion theorem was found by the object search. This is a bounded search result, not proof of absence throughout both repositories.
- `TauCeti/GroupTheory/SpecificGroups/CFSG/Sporadic/Mathieu/TwentyThree.lean:51` explicitly distinguishes presentation provenance from proved order/finiteness/identification results. It does not eliminate the requested permutation-model gap.

Main-roadmap and new-roadmap ownership checks found the duplicate field-Brauer, finite-cover spectral-sequence and characteristic-zero adjoint-vanishing scope in R03–R05. Existing Picard representability, Hasse–Minkowski §5.5 and local rank-five isotropy in QuadraticFormInvariants Layer 6D are correctly cited. CrystallineCohomology §CR.4.7 actually contains `Crystalline.wittCohomology_V_complete` (head `2c8b22a1737d1660f1baf397926b41e90139a80d`, line 6584). ComplexComparisonPartII §§C3.2d.2–C3.2d.5 contain the named Picard interfaces (head `c9ccfac82885efe9b0ba23cc8df12ddb5512af37`). AlgebraicModuliForArithmeticGeometry §§7.6.1–7.6.1a contain the stated class-sheaf and section-splitting interfaces. No direct upward supplier citation was found among the 60 Needs lines and the exact supplier contracts. No ownership move to a later supplier is proposed.

The exact gate invocation from the brief failed with exit status 1 because `packages/K3SurfacesAndSymplecticBoundedness/README.md` does not exist. Its diagnostic was `FileNotFoundError` for that repository-relative path; the machine-specific traceback is omitted. Re-running the same gate with the actual design README as candidate succeeded, exit status 0:

```text
candidate: K3SurfacesAndSymplecticBoundedness is not in the merge order yet; checked as if placed after JacobianChallengePartII (the intake inserts it when its design is accepted)
depcheck: 3 roadmaps, 20 edges, 0 problem(s)
```

No UPWARD or CYCLE line occurs. This gate sees only three available roadmap candidates; it does not certify source-level prerequisites such as R01. The merge-order file and tooling were not edited.

## Not verifiable

- **Previous review:** the named round-2 report is absent. The seven repair-report items were checked individually, as documented above.
- **Lean elaboration: not available.** There is no `Suggested.lean` in this design package, and the brief supplies no executable elaboration command. No Lean command was run. Thus neither signature elaboration nor a “sorry is the only warning” outcome is claimed. The package-stage requirement for easy headlines, explicit binders and proved examples remains untested here.
- **Liu Chapter 9.3:** cited in plan `surface-projectivity.detail`, absent from the manifest. The sources service tried the OUP DOI landing page and received HTTP 403; it recorded `liu` in `scratch/needs-references.toml`. No legal text was read and no contents are guessed. Huybrechts lines 147–153 independently state the surface projectivity assertion and point to this chapter. No existing manifest entry was rewritten. A legal copy, replacement citation or human waiver is needed to close this reference request.
- **Settled waived texts:** `rudakov-shafarevich` §8 Proposition 3, `nygaard-vectorfields` Lemma 3.3 and `matsusaka-mumford` Theorem 2 remain waived, not newly missing. Their uses were compared with the readable secondary application locators, not certified against unread primary text.
- **General supplier-source coverage:** the partial rows in the seeded sample identify exactly which full general statements lack a supporting locator. No request was made for an unspecified book or theorem whose identity the design does not give.
- **Involution rank proof:** the target at §6.7d agrees with the conclusion of dolgachev-keum Lemma 4.3 and explicitly rejects its false integral-matrix step. The swap matrix squares to I but is nonidentity modulo 2, contradicting the source argument at lines 643–647. The revised prose promises an argument retaining extension terms but does not display the replacement inequality. I have not independently certified that replacement proof. This is not reported as a counterexample to the K3 theorem.
- **Exhaustiveness of library absence:** GitHub object search plus pinned-file reads establish the positive duplication witnesses above. They do not constitute a complete offline grep of both pinned libraries, which are not installed in the content checkout.

All work independent of the missing Liu text was completed. The report and review JSON are the only repository deliverables written; the design README and plan remain unchanged.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "bad2b1d4d9b329739c1f5abf718e7e91b79c4660", "job": "REV-DESIGN-K3SurfacesAndSymplecticBoundedness~3", "model": "gpt-6-astra", "worker": "chris-3"} -->
