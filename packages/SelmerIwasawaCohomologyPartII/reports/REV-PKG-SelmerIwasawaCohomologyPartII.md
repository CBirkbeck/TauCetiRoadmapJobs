<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/589#issuecomment-6319420180 -->
Review (codex) of 7adb8b8

Verdict: needs_changes

1. **F01** (P1) The exceptional projective-line bundle is not globally trivial

   **Location:** packages/SelmerIwasawaCohomologyPartII/README.md:398: “Q††→P†† is a trivial ℙ¹-bundle.”

   **Claim:** The exceptional intersection in the product resolution is globally a product with ℙ¹.

   **Witness:** At n=2, p=3, restrict to one rank-two link point and the rank-three quartic C. The exceptional bundle is ℙ(O_C⊕O_C(4)); its negative section has self-intersection −16. A trivial C×ℙ¹ has no negative section.

   The calculation uses this package's own normal-bundle statement and numerical Check, README:341 and README:356. On the corresponding balloon component ℙ¹×ℙ², the centre is {point}×C and its normal bundle is O_C⊕O_C(4), with deg O_C(4)=16. The exceptional divisor of its blowup is the projectivization of that bundle. One of its two natural sections has normal bundle O_C(−4). In a product C×ℙ¹ every section is the graph of a morphism f:C→ℙ¹, with normal bundle f*Tℙ¹ of degree 2 deg f≥0. This proves nontriviality over the geometric base, so descent or torus invariants cannot make the asserted geometric trivialization true.

   The adjective is also present in ltxzz line 4759, Lemma 5.11.3(2), p. 98, and ltxzz-published line 5418. Agreement with that printed assertion does not resolve the counterexample.

   **Exact repair:** Describe Q†† as the projectivization of the sum of the two pulled-back link normal lines in P°°. Assert a Zariski locally trivial ℙ¹-bundle, not a globally trivial bundle. Specify the tautological class or a section class used in the projective-bundle decomposition. Keep the blowup cohomology decomposition, which does not require global triviality, and check subsequent restriction/Gysin products with the actual Chern classes. Add the quartic negative-section calculation as a negative-control Check; do not export a global product identification from the cited source.

2. **F02** (P2) The two incidence edge maps need different parity domains

   **Location:** packages/SelmerIwasawaCohomologyPartII/README.md:375, :377 and :383: “Define ∇₁ on E₂⁰,²ʳ and ∇₀ on ker d₁⁰,²ʳ”; “∇₁ kills boundaries and factors through Frobenius coinvariants.”

   **Claim:** Both displayed maps and the descent assertion are introduced without separate rank hypotheses. The preceding even-rank filtration sentence does not supply the odd-rank hypothesis needed by ∇₁.

   **Witness:** ltxzz line 4214 restricts Construction 5.9.4(1), ∇₁, to N=2r+1; ltxzz line 4219 restricts part (2), ∇₀, to N=2r. The boundary cancellation for ∇₁ invokes the odd-rank Lemma 5.9.2(3).

   This matters at N=2: the package correctly makes the link incidence pair zero, but that convention does not extend the odd-rank boundary cancellation. The odd formula then retains only its ground contribution. The matrices in README:381 themselves distinguish the two parities. Sections 3.2 and 3.5 use the correct parities; the earlier definitions must do so too.

   **Exact repair:** In both the defining prose and displayed formulas, introduce ∇₁ only for odd N=2r+1 and ∇₀ only for even N=2r. Scope ∇₁'s boundary and Frobenius-coinvariant factorization to odd rank. Scope the three-step filtration and its singular sequence to the even-rank domain of Lemma 5.9.3. Add a Check distinguishing the rank-two zero-link formula for ∇₀ from the rank-three descended map ∇₁.

3. **F03** (P2) Specify the component transforms independently of strict transform of the centre

   **Location:** packages/SelmerIwasawaCohomologyPartII/README.md:398 and :406: “its blowup Q along P°°, with its strict transforms”; “Identify the component strict transforms”.

   **Claim:** The four components of Q, including the component above P°°, are described using the supplied strict-transform construction, without a different convention for the component which is the blowup centre.

   **Witness:** stacks-blowup line 3912 (Tag 080D) and line 3919 (Tag 080E): the strict transform of the centre Z is Bl_Z(Z)=∅. It cannot be the asserted nonempty blowup of P°° along P††.

   Concretely, the image of the centre ideal on Z is zero, so its Rees algebra has no positive-degree part and its Proj is empty. The source's terminology at ltxzz line 4715 uses “strict transform” even for strata contained in the centre; importing it without a convention does not agree with the general construction cited by this package. This is separate from R01: replacing “trivial” alone still leaves the component undefined under the imported convention.

   **Exact repair:** Define the four resolved components as closures in Q of their inverse images over the locus where σ is an isomorphism, using the complement of P†† on each component; define their intersection strata scheme-theoretically. Prove the equal-component blowup identifications from the local charts. Reserve the supplied strict-transform operation for the graph QΔ and other subschemes on its correct domain, or explicitly name and define this different component-transform operation. Add the Check that the ordinary strict transform of the centre is empty whereas the resolved balloon component is not.

4. **F04** (P3) Correct the pinned Rees-algebra file locator

   **Location:** packages/SelmerIwasawaCohomologyPartII/README.md:69: “Mathlib/RingTheory/reesAlgebra.lean”.

   **Claim:** This is the file containing the two cited pinned declarations.

   **Witness:** At Mathlib commit 6b7abb3c7686292736be2955bd3eb9ebf63b456a, Mathlib/RingTheory/ReesAlgebra.lean:40 defines reesAlgebra and :65 states mem_reesAlgebra_iff. The lower-case filename returns 404.

   **Exact repair:** Change the file locator to Mathlib/RingTheory/ReesAlgebra.lean. The declarations and their commutative-ring domain are correct; no new prerequisite or gap is needed.

Independent reviewer: independent-review-REV-PKG-SelmerIwasawaCohomologyPartII. Date: 2026-10-21. Four findings: one P1, two P2, one P3. Three are blocking. The scope is a repairable continuation of SelmerIwasawaCohomology, not a replacement roadmap. There is no previous package review. No authored package file was changed.

## Verified sound

### Coverage and principles

Read all 939 README lines, all 95 Lean lines, metadata.toml, sources.toml and the design gap list. Reviewed all 40 numbered subsections, all 40 Needs lines, all eight layer dependency summaries, the conventions and the named API bullets. The 14 subsections with explicit construction/API blocks each have at least three Checks; §5.1 also gives five controls for the separate finite-period definition. Compared the house shape with TauCetiRoadmap/StableReduction/README.md, TauCetiRoadmap/Chebotarev/README.md and TauCetiRoadmap/ProfiniteCohomology/README.md on main.

The continuation preserves the base roadmap's local conditions, weak semisimplicity and Selmer reduction rather than planning those again. The native unitary objects are retained, including nonproper comparisons and ramified coefficient rings. No computational algorithm, admitted data, set_option, placeholder condition, or forced geometric headline on finite stand-ins occurs in Suggested.lean. No copied source prose was identified in the passages compared. Source formulas are mathematical statements with locators. No suspicious instruction in fetched material was followed.

The extra uniform realised-Frobenius span premise is visible in the summary, §7.2 and every rank deduction. It is not asserted to follow from a rank-one fixed line or from eventual admissibility alone. The positive-loss matrix example correctly rules out a diagonalizing basis. The finite-support Hecke comparisons, crystalline local conditions and nonproper specialization inputs have named owners.

### Seeded source verification

All five works in sources.toml were readable in the supplied legal cache. There were no author-flagged unverified locators. Every one of the 15 seeded targets was checked against its stated theorem/section, page, hypotheses and formulas. Fourteen had no independent source-domain defect; §2.6 reproduces the problematic geometry described in R01 and R03. The further parity defect R02 was found outside the seeded selection.

| Target | Text and locator checked | Result |
| --- | --- | --- |
| 1.5 Special and very special inert places | ltxzz-published line 1533, line 1542, line 1549; Definitions 3.3.1–3.3.4, p. 147 | Correct odd, unramified, degree-one inert domain and published **intersection** of reflex fields. The different preprint definition is explicitly distinguished. |
| 2.4 Link cohomology and excess intersections | ltxzz line 3349; line 3518; line 3722; Lemma 5.6.2 and Theorems 5.7.7–5.7.8, pp. 71, 75–78 | Freeness, unit p+1, exceptional degrees, cardinal product, vector-space versus projective dimension, and excess bundle agree. |
| 2.6 Semistable product resolution | ltxzz line 4710, line 4725, line 4731, line 4755; Notation 5.11.1, Lemmas 5.11.2–5.11.3, pp. 97–99 | Model, blowup and cohomological decomposition match; global triviality and centre-transform terminology require R01/R03. Nonproper specialization is an explicit supplier contract. |
| 3.3 Even-rank integral freeness | ltxzz line 5623, line 5634; Definition 6.3.4, Theorem 6.3.5(1)–(2), pp. 115–116 | Retains H(N), A6.1.4/A6.1.6, rigidity, cyclotomic irreducibility, genericity, nonzero support and coefficient bounds. |
| 3.5 Even singular comparison | ltxzz line 5650; Theorem 6.3.5(4), p. 116 | Actual congruence quotient and filtered inertia map, not an eigenspace substitution. |
| 3.7 Changing odd special maximal levels | ltxzz line 6489; Lemma 8.1.7, pp. 133–134 | Odd rank, distinct rational supports, H(n₁), localized intertwining and cohomological genericity retained. |
| 4.4 Purity and Selmer membership | ltxzz line 6484, line 6796; Lemma 8.1.6 and proof of Theorem 8.3.2, pp. 133, 139–140 | Weight −1 and finite membership route agree. The all-place integral/nonproper regulator strengthening is explicitly contracted; it is not inferred from rationalization. |
| 5.2 First geometric reciprocity | ltxzz line 4899; Theorem 5.11.5, pp. 101–102 | Checked all three identities, operator directions and the p+1 factors. |
| 5.4 Potential map and boundary | ltxzz line 5097, line 5121, line 6024; equation (5.28), Construction 5.11.7, Proposition 7.2.7, pp. 104–105, 123–124 | Kernel/cokernel indices and source invariants versus target coinvariants agree; full first-law hypotheses are stated. |
| 5.5 First explicit reciprocity | ltxzz line 6037; Theorem 7.2.8(1)–(3), p. 124 | Quotient order, actual cycle-boundary target and factor (p+1)φΠ₀(I°)φΠ₁(T°) agree. |
| 6.2 Second geometric reciprocity | ltxzz line 2488, line 2517; Construction 4.6.1, Theorem 4.6.2, pp. 53–54 | Two legs, T⋆, degree 2r₀ and twist r₀ retained. |
| 6.3 Odd special-fibre coinvariants | ltxzz line 6255; Lemma 7.3.3, pp. 128–129 | A7.1.1, A7.3.2, H(n₁), weak semisimplicity and the coinvariant map agree. |
| 7.2 Actual auxiliary Frobenius detection | ltxzz line 846, line 870, line 883, line 6613, line 6848; §2.6 and the two prime-realization arguments | The source's stronger basis/span claims are not blindly repeated. The package imports the corrected conditional span and scaled-inverse results, keeps loss c, and separately owns native Hecke realization. |
| 7.4 Eventual admissibility | ltxzz line 6400, line 6418, line 6459; Lemmas 8.1.3–8.1.5, pp. 131–133; ltxzz-deformation line 1761, line 1880 | Both families retain F⁺≠ℚ and their separate elliptic-image or Steinberg/supercuspidal hypotheses. No arbitrary-family assertion. |
| 8.3 Removing H(N) | ltxzz line 1259, line 1273, line 6743; Hypothesis 3.2.10, Proposition 3.2.11, Corollary 8.2.5, pp. 28, 138 | N≤3 or F⁺≠ℚ domain retained. Neither L6/L7 nor uniform span is discarded. The multiplicity theorem remains a declared supplier obligation. |

Additional source controls included ltxzz Construction 5.8.3 and Lemmas 5.9.2–5.9.3 for incidence powers/signs, ltxzz-deformation line 1444 for the R=T contract, liu-tian line 1407, line 1477 and line 1496 for §8.5, and stacks-blowup line 3750 for the one-way Cartier lifting property. The preprint and published numbering were distinguished where the package switches versions.

### Adversarial mathematics table

Each subsection row includes its defining data, displayed identities, named API and Checks; the final rows separately cover every Lean declaration. “No change” means no additional defect was found under the stated hypotheses and declared supplier contracts, not that an unimplemented theorem was formally proved. Downstream uses of §2.6 remain conditional on repairing R01/R03.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Standing ranks, twists and polarization | n=0,1 excluded; n=2 and n=3; γ=(I,−1)c | Tensor rank 6 and twist 2 at n=2; weight −1; square has GL component −I | No change |
| Frobenius, coboundary and cohomological shifts | p=3 inert; C₂ sign action on ℤ; m=1 | Arithmetic/geometric scalars 9 and 1/9; d⁰(1)=−2; cycle degree 2n, coefficient degree 2n−1 | No change |
| Coefficients, trace and normalization | Ramified DVR; zero ring; free C₂-orbit with 𝔽₂ coefficients; q=1 | Geometry has p-coprime domain; A_m has m≥1; orbit trace is 1, total trace 0; q²−1 exclusions reject q=1 where needed | No change |
| Imported Satake conventions | Degrees 1,2; r=1,q=3 | Reciprocal signs −/+; even I°=16; odd T°=9/2 and I°=105/2 | No change |
| 1.5 Predicates; implication, reflexive case, residue and transport API | ℚ(i), primes 2,3,5; identity field isomorphism | 3 accepted, residue 9; 2 excluded; 5 split; transport preserves CM data | No change |
| 1.6 Admissibility; clauses, basis, tensor and small-prime API | n=2; ℓ=2,3; ξ=±1; scalar identity; lattice homothety | Small primes and false image witnesses excluded; conjugation and homothety preserve all clauses | No change |
| 2.1 Level datum; contraction, reduction and level changes | m=0,1,2; empty/infinite raising set; polynomial only zero modulo λ | Positive exponent and finite sets required; residual condition cannot certify depth 2; P6 must be rechecked at a changed level | No change |
| 2.2 Basic correspondence and its three APIs | N=2,3; empty index; residue extension | Fibre dimensions 0,1 and codimensions 1,1; empty source stays empty; geometric assertions retain perfect-field/domain hypotheses | No change |
| 2.3 Strata and local/base-change/generic-fibre APIs | Node xy=p; p=3 quartic; invert p | Reduced branches; normal degrees ±16; smooth generic fibre | No change |
| 2.4 Link and excess intersection | r−j=1; ℓ divides p+1; 𝔽₂ orbit trace | ℙ⁰ and p+1 points; restriction isomorphism requires a unit; no averaging by group order | No change |
| 2.5 Incidence definitions, matrices, filtration and descent | N=2,3,4; p=3; (1,0),(0,1); Frobenius 4 on ℤ₃ | Sign and exceptional rank-two matrix correct; both edge maps lack separate parity guards; invariants 0 versus coinvariants ℤ/3 distinguished | R02 |
| 2.6 Resolution, component/graph, lifting and coefficient APIs | n=2,p=3; centre itself; Cartier inverse image; geometric point of exceptional divisor | Nontrivial ruled surface; centre's strict transform empty; one-way lifting statement is correct | R01, R03 |
| 3.1 Localization and concentration | Bad special-maximal constituent before localization; torsion in adjacent degree | P5 excludes bad pairs only on localized support; derived reduction needed for freeness | No change |
| 3.2 Odd Tate comparison | N=3; absence of H(N); nonsemisimple unipotent Frobenius | Surjectivity, concentration and coinvariant comparison have distinct stated assumptions | No change |
| 3.3 Even integral freeness | N=2,4; zero localized support; place outside S_FL theorem domain | Zero support is excluded where needed; supplier extension handles the broader transferable-level domain | No change |
| 3.4 Ground Frobenius exclusion | Residual candidates 1,p²; level-raising pair | The two prohibited characters are removed under the stated even hypotheses | No change |
| 3.5 Singular comparison | N=2; torsion congruence quotient versus annihilator | Correct quotient and inertia filtration; no interchangeable eigenspace | No change |
| 3.6 Congruence realization | μ=1 and μ=2; basis change in multiplicity space | Existence of an isomorphism, no selected canonical coordinate | No change |
| 3.7 Odd level changes | Empty P; one place; repeated rational support | Empty change is identity; successive changes retain genericity; repeated support outside theorem domain | No change |
| 4.1 Diagonal datum and ext/refine/product API | n=2; incompatible levels; source-only degree-d refinement | Dimensions 1,2,3; missing inclusion rejects map; commuting square need not be Cartesian | No change |
| 4.2 Graph cycle and support/pushforward/class API | Δ−Δ; degree-two cover; Spec k identity graph | Zero class, pushforward 2Δ, positive class 1 | No change |
| 4.3 Projected AJ and add/edge/reduce API | Zero cycle; n=2; ℙ¹ point; reducible residual boundary | Correct H¹(F,H³(2)) target; no arbitrary-cycle edge without concentration; rational and integral boundary domains separated | No change |
| 4.4 Purity and membership | n=2; ℓ ramified in F; ramified coefficient field | Weight −1; L1/L2 enforce the geometric good-reduction domain, without excluding coefficient ramification | No change |
| 4.5 Multiplicity and conjugation | Reducible Galois factor; zero/nonnull tuple; changed coordinate basis | H(N)'s irreducibility antecedent retained; a nonzero tuple gives some coordinate, not a canonical one | No change |
| 4.6 Regulator naturality | Identity cover; degree 2; non-Cartesian square | Trace uses source degree; pullback retains full fibre product and component multiplicities | No change |
| 5.1 First datum, test pairing and reduction | Empty support; depth 1 versus 2; stated roots over 𝔽₁₁ | PI6 excludes zero module; tensor roots have q=3 twice despite good factor conditions; PI7 is independent | No change |
| 5.1 Finite two-leg period | Empty/singleton/double source; infinite target allowed; cancellation; characteristic 2 | Values 0,1,2; double fibre becomes 0 in 𝔽₂; no converse to nonzero-summand implication | No change |
| 5.2 Geometric first law | p=3; graph multiplicity 1; zero cycle | Factors p+1=4 and (p+1)²=16 retained; linearity gives zero on zero | No change, subject to R01/R03 geometry |
| 5.3 Product concentration | Ranks 2,3; non-middle cohomology; missing integral freeness | Künneth/concentration use both actual factors and explicit integral assumptions | No change |
| 5.4 Potential map and boundary APIs | Differential π²; class π; reduction modulo π; unipotent 2×2 Frobenius over 𝔽₃ | Exponent 1; reduction not left exact on kernels; invariant-to-coinvariant map can be zero | No change |
| 5.5 Explicit first law | p=3; localized versus further congruence quotient; one graph point | Factor 4φ(I°)φ(T°), correct order of quotients and test pairing | No change, subject to R01/R03 geometry |
| 5.6 First-law exponent equality | Unit/nonunit scalar; zero period | Equality uses the stated unit factor; nonunit multiplication can lower exponent | No change |
| 6.1 Second datum and graph-function/reduction APIs | Double fibre; m=0; no intertwining or rigidity labels | Counting rather than image indicator; positive depth; no invented PII5/PII6 | No change |
| 6.2 Geometric second law | n=2; zero cycle; two correspondence legs | Correct degree 2r₀, twist r₀ and retained T⋆ | No change |
| 6.3 Odd special-fibre coinvariants | N=3; nonsemisimple Frobenius; zero module | Weak semisimplicity is proved under the concentration/multiplicity hypotheses, not assumed for arbitrary action | No change |
| 6.4 Second-law bound | O/π²→O/π and class 1 | Exponents 2→1 permit strict inequality; absolute cycle not silently a singular AJ class | No change |
| 7.1 Image lifting | m=1; prime-to-ℓ versus ℓ-primary order; ξ²=1 | Residual base case and simple fixed-line lifting; forbidden cyclotomic values excluded | No change |
| 7.2 Detection and scaled inverse | Zero realised span; D=[[π,1],[0,π]] over A₅; c=0,c≥k; primitive v,t | DC=CD=π²I; no basis for positive loss; primitive kernel gives second exponent 3 | No change |
| 7.3 Annihilators and rigidity specialization | Perfect versus π-scaled rank-one pairing; n=2; w dividing ℓ; other w above p₁; double Satake root | Exponent max(0,a+b−m); both crystalline arguments needed; all nondetecting places covered; simple pair gives correct arithmetic eigenvalues | No change |
| 7.4 Two eventual families | Isogenous/CM elliptic curves; F⁺=ℚ; absence of supercuspidal place | These failures fall outside the relevant family hypothesis; no general eventual admissibility inferred | No change |
| 8.1 Rank zero | Zero period; positive uniform c; m larger than all fixed losses | Nonzero witness required; contradiction exponent grows with m | No change |
| 8.2 Rank one | Zero AJ; multiplicity >1; primitive pair not a basis; positive c | Lower bound uses a nonzero coordinate; upper bound loses 2c and needs no basis | No change |
| 8.3 H(N)-free domains | n=2,F⁺=ℚ; n=3,F⁺=ℚ; n=3,F⁺≠ℚ | Only the first and third qualify; uniform span remains independent of eventual admissibility | No change |
| 8.4 Rank-(2,3) specialization | ℓ=3; deleting L6/L7 | L1 rejects ℓ=3; all seven clauses remain, so no unsupported small-rank shortcut | No change |
| 8.5 Hilbert precursor | g=1; even g; ℓ divides the stated product | Odd degree and exact LIInd/dimension/prime conditions retained; not substituted for unitary singular comparison | No change |
| Lean definiteDiagonalPeriod | Empty, singleton and double S; zero coefficient monoid | Real finite sum with valid carriers; no hidden nonemptiness or division | No change |
| Lean definiteDiagonalPeriod_add | Zero functions; cancellation; torsion monoid | Finite-sum additivity at stated generality | No change |
| Lean definiteDiagonalPeriod_smul | Scalars 0,1; positive characteristic; noncommutative semiring | Left regular action distributes over sum; commutativity of multiplication unnecessary | No change |
| Lean definiteDiagonalPeriod_map | Zero homomorphism; ℤ→ZMod 2; identity | Additive map commutes with sum | No change |
| Lean definiteDiagonalPeriod_reindex | Empty equivalence; Bool swap; identity | Composition directions correct | No change |
| Lean definiteDiagonalPeriod_fiber | Empty targets where legs exist; double fibre; missing fibre | Counts are finite Nat.card values, with natural-number scalar action | No change |
| Lean definiteDiagonalPeriod_exists_ne_zero | Empty S; zero monoid; signed cancellation | Forward implication correct; converse deliberately absent | No change |
| Both Lean example declarations | Three integer controls and two cancellation/torsion controls | Five stated numerical outcomes correct; proof scripts inspected but not elaborated | Elaboration unavailable |

### Duplication, ownership and supplier order

The pins read from lake-manifest.json were Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Code search was followed by reading files at those commits, rather than treating search results from a moving branch as pinned evidence.

| Object | Existing owner checked | Package treatment |
| --- | --- | --- |
| Evaluation, derivative, coefficient reflection | Polynomial.eval / eval_X in Mathlib/Algebra/Polynomial/Eval/Defs.lean:249, :294; derivative / derivative_X in Mathlib/Algebra/Polynomial/Derivative.lean:46, :117; reflect / coeff_reflect in Mathlib/Algebra/Polynomial/Reverse.lean | Imported carriers and conventions; no second polynomial theory |
| PID torsion and torsion-free finite modules | Module.torsion_by_prime_power_decomposition in Mathlib/Algebra/Module/PID.lean; Module.free_iff_isTorsionFree in Mathlib/LinearAlgebra/FreeModule/PID.lean:397 | Correct PID/finite domain retained |
| Continuous cochains and contravariant group map | Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:113, :131; ContinuousCohomology.cochainsMap in Functoriality.lean:103 and its map laws | Imported; finite discrete versus adic comparison separated |
| Low-degree continuous H¹ | TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean, d0:172, H1/H1pi, trivial-group/zero-coefficient instances, nsmul_H1_eq_zero:755 | Imported with continuous action; no claim of an arithmetic local condition from these alone |
| Rees blowup and affine charts | Mathlib/RingTheory/ReesAlgebra.lean:40, :65; TauCeti/AlgebraicGeometry/Blowup/AffineCharts.lean:61, :70, :76, :87; StableReduction Layer 4 | General construction imported; native product calculation remains here; R03 fixes the interface convention |
| Finite sums and fibre multiplicity | Mathlib finite-sum APIs and Fintype.sum_bool, generated by to_additive in Mathlib/Data/Fintype/BigOperators.lean:43 | One light named period wrapper, with its own two-leg data and five direct controls; no replacement geometry |
| Weak semisimplicity and Selmer reduction | TauCetiRoadmap/SelmerIwasawaCohomology/README.md:285–334, :1883–1976, :2293–2322 | Base theory imported; native odd/even comparisons are the extension |
| Actual Frobenius span and loss | TauCetiRoadmap/EulerSystemsAndKolyvaginSystems/README.md:1297–1323, :2756–2776 | General detector, scaled inverse and primitive kernel imported; native CM/Hecke realization kept |
| Unitary Satake and Hecke formulas | TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md, SR.4.4 | Existing formulas imported; incidence realization kept |
| Reflex closure and auxiliary torus descent | TauCetiRoadmap/PELModuli/README.md:1438–1459, :3405–3458 | Published closure and orbit-trace domain imported, including the characteristic-two test |
| Transferable levels and oldforms | TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4852–4940 | Existing S_FL/small-level restrictions expressly retained for supplier theorem; larger native domain has a gap |
| Residual rigidity and enlargement | TauCetiRoadmap/LocalGaloisDeformationRings/README.md:2114–2136 | IsRigidFor and mono imported; §7.3 owns the Satake/arithmetic-Frobenius conversion |
| Cohomological genericity | TauCetiRoadmap/IgusaVarietiesAndTorsionConcentration/README.md:2867–2884 | Quantification over every exceptional enlargement retained |
| Weight sequence and rational concentration | TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:3737–3865; TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:1159–1177, :2017–2025 | Rational/ST–END domain distinguished from integral/native extension gaps |

Read the relevant contracts in all 24 named roadmap suppliers. Main was inspected at 83f4d7775a926bd371212b5efe358a1b9ddc8cfa. The five main-branch suppliers are EtaleCohomologyFoundations, StableReduction, ProfiniteCohomology, Chebotarev and SchemeAndStackFoundations. The other supplier folders were checked at these open heads; each is a new-roadmap supplier, not a revision used in place of main:

| Supplier | Inspected head |
| --- | --- |
| SelmerIwasawaCohomology | 17f60560d7f66aeca01e445f995e3172473fbf0f |
| EulerSystemsAndKolyvaginSystems | 4fb7ae990e3d133c8551d329a68c4a12fe2cff48 |
| PELModuli | 2d82d078308ce615a612ad359f23208a95cd4359 |
| EndoscopicTransferAndUnitaryTraceComparison | f8f8c2b09070d68ef4a7d35f53b9f34afa32abc7 |
| AutomorphicGaloisRepresentationsPartII | c4cc6a16ac58b17b7da0ce4b7b9707d0fafda39f |
| LocalGaloisDeformationRings | e18984688bc762ca5115bbabd7696f50a29e7cf6 |
| IgusaVarietiesAndTorsionConcentration | 55adf550b90cc3a1981b197fd48b3a35217665cc |
| LefschetzPencilsAndVanishingCycles | 1b8f741b92693436a0dd0984a2c0c6ce7033a629 |
| ArithmeticGaloisDuality | 5b7027c11722984edb77acf2dc885be67aa4998a |
| IntegralHeckeAndGaloisDeterminants | 0d37c3f452ad9769ad7bfc257b5f283091814d85 |
| SmoothRepresentationsOfLocalGroups | 0d37c3f452ad9769ad7bfc257b5f283091814d85 |
| ReductiveGroupsPartII | 0d37c3f452ad9769ad7bfc257b5f283091814d85 |
| ShimuraVarieties | ce108212b4c3943e82fbbb3cf246ff5fd98ac835 |
| GlobalGaloisDeformations | 29e415cbfb93a10cff4f4686155133983c005cc1 |
| MotivesAndAlgebraicCycles | c3dad319dd28b8dec9dca85265421575049bd5dc |
| ArithmeticGaloisRepresentations | 81f6496983d9028bdfe5905c3aa8270c6c14ba99 |
| ShimuraCompactifications | b5675ac208c9deb521a784a27908f77e09b19c73 |
| HilbertModularVarietiesAndShimuraCurves | 5db7b73b405791d16da682c5f9e7c52c6b864fbf |
| AdelicAlgebraicGroups | 7b84aae1803e4a145ea251a57f526061764a0ab2 |

The contracts of the remaining owners concern their actual scope: GlobalGaloisDeformations §5.2 is rank two; MotivesAndAlgebraicCycles §§7.16–7.18 supply the Chow/rank context rather than the integral arithmetic regulator; ShimuraVarieties §6.7 supplies canonical models rather than the requested special-level semistable models; AdelicAlgebraicGroups §4.1 is not misrepresented as an existing hermitian classification theorem. The extra obligations are declared gaps.

Object searches across main, completed roadmaps and board packages, followed by the relevant supplier passages, found no second owner for the native reciprocity and annihilator constructions. Also checked the scope of the specified open heads CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics; no duplicate native unitary target was identified. These were comparison context, not new dependencies. No object needs moving to break an upward dependency.

The prescribed dependency check completed with exit code 0 and exactly this output:

`depcheck: 6 roadmaps, 58 edges, 0 problem(s)`

There was no UPWARD or CYCLE line. The command's local six-roadmap inventory was supplemented by reading every supplier citation, comparing suppliers with merge-order/ORDER.txt, and checking the fetched supplier texts for a dependency back on SelmerIwasawaCohomologyPartII. No reverse citation was found. Internal Needs references point to existing earlier constructions; the duplicated same-layer entries in layer summaries introduce no extra reverse dependency.

### Declared gap audit

All 20 slugs occur both in design/plan.json and in the README's supplier contracts. Every supplier is named, and each contract has its missing content and domain explained immediately around the needs sentence. None was counted as a defect merely because its theorem is not yet supplied. Compared with the owners' actual domains, no redundant or unowned gap was identified.

| Gap | Supplier and boundary checked |
| --- | --- |
| native-shimura | ShimuraVarieties: native special/hyperspecial models and nonproper specialization beyond canonical models |
| unitary-incidence | ReductiveGroupsPartII: Appendix A hermitian incidence obligation, not an invented existing section |
| nearby-weight | LefschetzPencilsAndVanishingCycles: residual integral/torsion filtration under stated parity vanishings |
| automorphic-multiplicity | AutomorphicGaloisRepresentationsPartII: exact H(N), c-conjugation and its removal domain |
| diagonal-concentration | AutomorphicGaloisRepresentationsPartII: native rational quotient and nonproper boundary beyond compact ST/END |
| boundary-cohomology | ShimuraCompactifications: localized ordinary/compact comparison under residual irreducibility |
| rigid-r-equals-t | GlobalGaloisDeformations: polarized source problem and mixed/congruence maps with explicit D0–D4 context |
| old-form-dimension | EndoscopicTransferAndUnitaryTraceComparison: all allowed transfer places and arbitrary transferable endpoints beyond S_FL theorem |
| local-unitary-representations | EndoscopicTransferAndUnitaryTraceComparison: primitive finite-field link comparison beyond tower cohomology |
| chow-abel-jacobi | MotivesAndAlgebraicCycles: integral arithmetic regulator and naturality beyond Chow/rank predicates |
| hochshild-serre-adic | SchemeAndStackFoundations: adic single-row edge beyond its Galois-cover theorem; slug spelling matches in both files |
| purity-crystalline-regulator | ArithmeticGaloisDuality: rational finite membership and integral torsion crystalline image on the actual smooth/support domain |
| unitary-special-compatibility | ShimuraVarieties: native line-addition/uniformization diagrams and scaling |
| semistable-boundary | LefschetzPencilsAndVanishingCycles: potential-map and cycle-value comparison with nonproper support |
| polarized-image-lifting | ArithmeticGaloisRepresentations: simultaneous congruence/polarized/cyclotomic lifting |
| hecke-finite-support | IntegralHeckeAndGaloisDeterminants: actual finite support and ideal-contraction comparison beyond Chebotarev |
| eventual-images | ArithmeticGaloisRepresentations: exactly the two §7.4 image families |
| eventual-rigidity | GlobalGaloisDeformations: exactly the deformation results used by those families |
| hilbert-precursor | HilbertModularVarietiesAndShimuraCurves: Liu–Tian Assumption 4.1, Definition 4.5 and Theorem 4.7 |
| hermitian-local-global | AdelicAlgebraicGroups: prescribed-invariant Hasse existence beyond §4.1 |

### Lean form and consistency

Suggested.lean has one import Mathlib, one real-bodied definition, six theorem targets proved by sorry, and two example declarations containing five discriminating assertions. There are no additional imports, section-variable omissions, sorry'd data, admitted examples or set_option commands. All seven declaration names occur in the README. The finite-source, arbitrary-target, additive-monoid generality agrees with §5.1; scalar multiplication specializes to the left regular semiring action; the fibre theorem additionally requires finite targets. The elementary period is stated on existing carriers, and the geometric headlines remain with their native README carriers.

## Not verifiable

- **Lean elaboration: not available.** The brief supplies no executable elaboration command and expressly identifies it as unavailable. No Lean build was run. The six sorry tokens are the only admissions visible by inspection; compiler warnings and successful execution of the two norm_num examples are not certified.
- **Supplier implementation:** The 20 declared contracts are obligations, not completed formal proofs. This review checks ownership, domain and nonduplication, not their future implementations. They remain requirements after the blocking findings are repaired.
- **Source access:** Nothing remained unread for lack of legal access among the five cited works or the seeded sample. No missing-reference request or manifest alteration was necessary. Reading the printed claim about triviality did not certify it; R01 records the independent counterexample.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "7adb8b87e981fc1425955b2ede8fc0320cfcd7f8", "job": "REV-PKG-SelmerIwasawaCohomologyPartII", "model": "gpt-6-astra", "worker": "chris-3"} -->
