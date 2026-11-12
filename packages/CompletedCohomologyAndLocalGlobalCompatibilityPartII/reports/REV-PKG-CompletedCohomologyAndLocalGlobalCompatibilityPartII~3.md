<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13017#issuecomment-6781728488 -->
Review (codex) of 52ba43a

Verdict: needs_changes

1. **F01** (P3) Separate the page locator for tensor stability

   **Location:** packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md:50: “EP Proposition 3.1, Lemma 2.9 and Corollary 3.2, p. 351”.

   **Claim:** This grouped citation places all three results on printed page 351.

   **Witness:** EP line 317 marks printed page 344; Lemma 2.9 is at EP lines 333–345. Proposition 3.1 and Corollary 3.2 are at EP lines 612–621, on printed page 351.

   **Exact repair:** Replace the grouped theorem/page citation with “EP Lemma 2.9, p. 344; Proposition 3.1 and Corollary 3.2, p. 351”, retaining the existing extraction-line references. This was tested against both printed-page headers and all three numbered statements: the corrected pair assigns 344 to Lemma 2.9 and 351 to the other two. No mathematical change is needed.

   This is a different locator from either previous finding. Searching the remaining capture citations found that README:52 already separates pages 342–345 and 351 correctly.

One P3 locator correction; no P1 or P2 findings. The package's four input files were not edited. This verdict does not ask the package to discharge its thirteen declared supplier contracts.

## Verified sound

### Previous findings and repaired passages

Both previous findings are repaired. I checked the replacement passages against their underlying texts, rather than treating the repair report as evidence.

| Previous finding or additional repair | Repaired passage | Verification and status |
| --- | --- | --- |
| Round 2 R01: completed action's pinned line | README:41: “the adjacent `Module.lean`, line 322” | Opened the declaration and its surrounding binders at the Tau Ceti pin. The instance begins at 322; 340 is its scalar-tower instance. **Repaired.** |
| Round 2 R02: omitted simple-type dimension locator | README:294: “simple-type invariant spaces, dimensions and counts are Lemmas 3.20–3.21 and Proposition 3.25” | EP lines 844–850 give Lemmas 3.20–3.21; lines 899–916 give Proposition 3.25. The invariant and dimension statements are distinct. **Repaired.** |
| Additional locator repair | README:100: “Lemmas 3.20–3.24, pp. 356–357; Proposition 3.25, p. 358” | EP lines 783–916 and printed-page boundaries agree. **Repaired.** |
| Additional locator repair | README:538: “EP §3.4, pp. 354–358” | The stated minimal-stratum construction and capture end on printed page 358. **Repaired.** |
| Additional reference-range repair | README:576: “§§2–3, pp. 342–358” | The range includes capture and both smooth families, ending at Proposition 3.26. **Repaired.** |

The dimension citation was checked on the rendered legal PDF as well as the extraction: in EP Lemma 3.21, dim η is in the denominator. The apparent ambiguity of the text extraction is not an error in that lemma. The rank-two calculation below verifies the fraction.

I reread all 21 numbered targets, their API bullets, Checks, proof routes and Needs lines. For unchanged material I also used the previous review's rows with computed values; I did not treat its prose summaries as substitutes for calculations. All 15 seeded targets were freshly checked, as were the seven headline endpoints and every repaired passage.

### Seeded source verification

All twelve works in the manifest were readable from their legal cached texts. No cited work needed a new manifest entry. The manifest has one key per work and records version information where relevant. No author-flagged unverified locator remained. The following are checks of statement and hypotheses, not just matches of theorem numbers.

| Target | Text and locator opened | Result |
| --- | --- | --- |
| 1.1 Potentially semistable point sets | BIP Theorem 6.1 and its definitions, p. 46, lines 2286–2312; CEGGPS §1.8, lines 460–535; DPS §7, lines 1742–1765 | Fixed regular labelled weights, N=0 for the potentially crystalline sets, and the induced irreducible Weil condition are retained. The weight dual and reciprocity normalization agree with the stated convention. |
| 1.2 Potentially diagonalizable lift input | EG Theorem 1.2.2, p. 3, lines 193–200; Definition 6.4.2 and Theorem 6.4.4(1), pp. 168–169, lines 6946–6965 | Finite coefficient extension and regular crystalline potentially diagonalizable lift are the imported contract. No patching prime restriction is imposed on this local lift input. |
| 2.1 Patched deformation components | BIP §6, p. 47, lines 2339–2360; HP Appendix A.1–A.5, pp. 48–50, lines 2680–2759; CEGGPS Corollary A.2, p. 83, lines 3304–3324 | Coefficient extension precedes geometric component splitting. Reducedness, flatness and geometric integrality are separate inputs; flatness of an arbitrary factor is not inferred from a tensor-product conclusion. |
| 2.2 Roots of torsion-free characters | BIP Lemma 6.4, p. 47, lines 2364–2378 | Triviality on torsion and finite coefficient extension are present. No assumption that d is prime to p is silently added. |
| 3.1 Capture and scalar actions | EP Definition 2.1 and Lemmas 2.2–2.10, pp. 342–345, lines 266–354 | Continuous dual testing, torsion-freeness, projectivity where used, and W≠0 are retained. The mathematics is supported; R01 corrects a separate grouped page citation. |
| 3.2 Patched testing modules | BIP p. 48, lines 2413–2418; EP §2.2, p. 345, lines 369–377; the compact duality and finite-index induction supplier sections below | The testing module uses the torsion-free compact dual, not a Pontryagin dual substituted without hypotheses. Arithmetic reducedness is explicitly imported; compact projectivity alone is not claimed to imply it. |
| 3.3 Capture by smooth types | EP Proposition 2.23, pp. 349–350, lines 532–607; Propositions 3.7 and 3.11, pp. 353–354, lines 657–748; Lemmas 3.20–3.21 and Propositions 3.25–3.26, pp. 356–358, lines 783–928 | Uniform-power cofinality, distinct absolutely irreducible members, admissible minimal depths, memberwise finite coefficient models and nonzero algebraic tensor factors are specified. The repaired dimension reference is correct. |
| 4.1 Detection of local components | BIP Theorem 6.8 proof, p. 49, lines 2448–2461 | The package chooses a supported component through a suitable point. It does not copy the unjustified assertion that an entire algebraic testing support is in one component. |
| 4.2 Faithfulness of the local deformation action | BIP Theorem 6.8 and Remark 6.9, pp. 49–50, lines 2447–2461 and following remark | The conclusion concerns the unrestricted local framed ring acting on the actual patched module, with p∤2d. Local component detection and reducedness are used in the correct direction. |
| 5.1 Density from patched testing | EP §2.2, pp. 344–346, lines 320–399; BIP Theorem 6.1 proof, p. 50, lines 2462–2476 | Annihilator intersections first detect support; reducedness and O-flatness then justify the scheme-density conclusion. |
| 5.2 Density of crystalline points | BIPD Theorem 3.3, p. 8, lines 349–354; Theorem 4.2 proof, p. 10, lines 428–440; Lemma 5.1 and Corollary 5.2, p. 11, lines 442–465 | The local route applies at every prime and to arbitrary residual representations. Prescribed determinant lifts and local benign geometry are explicit contracts, not consequences of the restricted patching route. |
| 5.4 Density of supercuspidal points | BIP Theorem 6.1, pp. 46, 50, lines 2306–2312, 2480–2483; EP Proposition 3.19, p. 356, lines 824–843; Remark 5.2, p. 365, lines 1202–1209 | The inducing extension is unramified of degree d, the induced Weil representation is irreducible, and the fixed regular weight and p∤2d restriction are retained. |
| 6.3 Density for every prescribed inertial type | BIP Remark 6.2, p. 46, lines 2313–2314; CEGGPS Theorem 3.7, p. 41, lines 1651–1663; EP Corollary 3.2, p. 351, lines 618–621 | The K-type is nonzero and detects the N=0 inertial type. Algebraic weights vary; the statement does not assert density at a single weight and type. |
| 6.4 Minimal-stratum supercuspidal points | EP §3.4, pp. 354–356, lines 753–843; §5, lines 1116–1125, 1185–1190 | Minimality, degree, hereditary order, conductor depth and the distinction between the full set and the deep family are explicit. The extension must contain a minimal element. |
| 6.5 Density with a minimal-stratum inducing extension | EP Proposition 3.19 and Propositions 3.25–3.26, pp. 356–358, lines 824–843, 899–928; Remark 5.2, p. 365, lines 1202–1209; BIP Remark 6.2, p. 46, lines 2315–2316 | The tame induced-character recognition is used in its range. Since p∤d and [E:F]=d, the required tameness follows. Existence of a minimal element is not dropped. |

I also opened the supporting texts ST Lemma 2.1, Corollary 2.2 and Theorem 2.3 (lines 349–383, 443–447); NAK Lemma 4.2 (lines 1356–1418); IYE Definition 5.8 and Propositions 5.9–5.10 (lines 1012–1087); DEJ Lemma 7.1.9 (lines 2553–2560); CON Theorem 2.3.1 (lines 1053–1070); and DPS Corollaries 7.5–7.8 (lines 1930–1997). IYE's trivial-residual standing hypothesis is expressly distinguished from the general supplier contract; it is not silently removed.

### Computed adversarial pass

The entries below cover all 21 numbered targets, the conventions, every sampled target and all headline endpoints. “No change” means the stated hypotheses or existing negative-control Checks already handle the calculation. Calculations are tests of the precise statements and interfaces, not proposed proofs of the deep density theorems.

| Statement | Instances tried | Values computed on each side | Result and change |
| --- | --- | --- | --- |
| Weight convention; 1.1 | d=2, k=(2,0), and k=(1,0) | Highest weights before duality are (1,0) and (0,0); dual highest weights are (0,−1) and (0,0). Using k itself would instead give (2,0) and (1,0). | The shift and dual are discriminated. No change. |
| 1.1 point sets | d=1; rank-two Steinberg Weil–Deligne representation | Rank one has N=0 and induction degree 1, so the three fixed-weight sets coincide. Steinberg has N≠0 and lies in neither potentially crystalline subset. A finite injective coefficient extension changes a point's field but leaves its kernel ideal equal. | Both inclusions and exclusions agree. No change. |
| 1.2 lift input | Rank one; p=d=3 | A crystalline character is already a one-summand diagonal representation. For p=d=3, p divides 2d=6, excluding the patching route but not the all-prime crystalline-lift contract. | No prime-range shortcut. No change. |
| 2.1 components and tensor dimensions | A=O; A=O[[u,v]]/(uv); A=O[[x]]/(x²−ϖ) | Tensoring with O returns R. The nodal factor has two minimal components. The ramified quadratic DVR has one component before adjoining a²=ϖ and two factors x−a, x+a afterward, since 2a≠0 even in mixed characteristic 2. Formal power-series dimensions give (1+r)+(1+s)−1=1+r+s. | Geometric splitting is an actual hypothesis, not ordinary integrality. No change. |
| 2.2 character roots | d=1; d=p on a Z_p quotient; order-two torsion | d=1 gives η=ψ. Adjoining b with b^p=1+p gives η(γ)^p=ψ(γ)=1+p on a topological generator. On an element t of order 2, η(t)²=1 cannot equal ψ(t)=−1. | Torsion-triviality is necessary; p-divisibility alone is not an obstruction after extension. No change. |
| 2.3 determinant correction and reciprocity | F=Q_5, d=2, ψ=1, unit u=2 | With the package's geometric reciprocity, δ(u)=2; the compact-side multiplier is 1/2 and the Banach dual multiplier is 2. Reversing reciprocity gives 1/2 for δ. For d=1 the LLC normalization exponent (1−d)/2 is 0 and its factor is 1. | Directions and dual signs agree with suppliers. No change. |
| 3.1 capture | H=1, M=O; M=O/ϖ; empty family; W=0 | For M=O the identity test has kernel 0. Every map O/ϖ→L is zero, so the common kernel is O/ϖ. An empty family or zero tensor factor has common kernel M, not 0 unless M=0. | Torsion-freeness and W≠0 prevent vacuity. No change. |
| 3.1 scalar action | H=C_3, nontrivial character over characteristic-zero coefficients; M=Z/2 over Z/4 | The trivial representation has Hom into a nontrivial character equal to 0. Scalar 2 is nonzero in Z/4 but acts by 0 on M. | Capture and faithfulness are not confused with an arbitrary test or quotient action. No change. |
| 3.2 finite-index testing | H=K; S_3 with H=C_3; K=Z_5×, H=1+5Z_5 and χ(u)=u | The induction/Hom comparisons have dimensions r=r, 2=2, and 4=4 respectively. The last character is continuous and not smooth. Zero coefficient representation gives dimension 0 on both sides. | Finite-index continuous induction includes the nonsmooth case and a nonabelian example. No change. |
| 3.2 duality and reducedness | O/ϖ; B=O[[x]], M=B/(x²) | The O-double dual of O/ϖ is 0. M is O-free of rank 2, and its test recovers M; Ann_B(M)=(x²), while x≠0 and x²=0 in the faithful testing quotient. | Torsion-free biduality is scoped correctly. Compact projectivity does not supply reducedness. No change. |
| 3.3 principal-series growth | d=1 and d=2 | For d=1 the squared-dimension sum has growth q^n·1=q^n. For d=2 it has growth q^(2n)·(q^n)²=q^(4n), matching the subgroup-index exponent d²=4. | The family needs distinct members. No change. |
| 3.3 cofinality and minimal depths | H=Z_p² with subgroups p^nZ_p⊕p^(2n)Z_p; e=2 | The indices are p^(3n), while testing only the first coordinate gives p^(2n), not the required growth. This anisotropic basis does not contain the required uniform-power subsequence. At even depths e=2 gives gcd(2,n)=2 and no minimal stratum; odd depths have gaps 2. | Both the uniform-power condition and admissible-depth correction matter. No change. |
| Repaired 3.3 dimension locator | Rank one E=F, m=1,n=4; rank two unramified E/Q_5, m=1,n=4 | Rank one has dim η=1 and dim V=q/q=1; its U^5-invariants have dimension 1 and U^4-invariants dimension 0. In rank two, [U²:U³]=625, [U_E²:U_E³]=25, [J:H]=25, dim η=5; Lemma 3.21 gives dim V=625/(25·5)=5. Reading dim η in the numerator would incorrectly give 125. | Rendered PDF confirms the denominator. The previous locator repair is sound; no source error in Lemma 3.21. |
| 3.4 evaluation density | H=1, Π=L, T=L²; T=0 | Hom(T,L)⊗T has dimension 4, target dimension 1, and evaluation kernel dimension 3. For T=0 the image is 0. For Π=0 the target is 0. | Density is not general injectivity; nonzero T is retained. No change. |
| 3.5 algebraic representations | GL_2 highest weights (1,0), (0,−1); determinant powers | Central exponents are 1 and −1. det^m has exponent 2m, so determinant powers alone miss odd central exponents. For GL_1 each weight is its character exponent. | All rational highest weights, not only determinant powers, are needed. No change. |
| 4.1 component detection | Spec L[x,y]/(xy), points (1,0) and (0,0); two auxiliary components | (1,0) lies only on V(y), whereas (0,0) lies on both components. Choosing one supported auxiliary component for each local component covers every local component but can cover only half the patched components. | Correct conclusion is local component detection, not full patched support. No change. |
| 4.2 faithfulness | Reduced ring versus O[[x]]/(x²); zero module | The intersection of minimal primes of a reduced ring is 0. For the square-zero ring it is (x)≠0. Ann_Z(0)=Z, while Ann_Z(Z/2)=2Z. | Reducedness and actual nonzero patched support are essential and supplied. No change. |
| 5.1 density from testing | Square-zero thickening; O[[x]]/(ϖx); zero test; R=O | Every prime of the square-zero ring contains x although x≠0. In O[[x]]/(ϖx), x≠0 becomes 0 after inverting p. The zero test gives the unit annihilator and empty support. In Spec O the characteristic-zero prime (0) has closure all of Spec O. | Reducedness and O-flatness are independently needed. The zero quotient yields the empty statement, not faithfulness. No change. |
| 5.2 crystalline density | p=2,d=1,F=Q_2; d=2 regular and repeated weights | On μ_2={±1}, algebraic characters x^n take values (−1)^n, covering both determinant-torsion components as n varies. Weights (2,0) become Hodge–Tate weights (0,−2), which are distinct; (1,1) becomes (−1,−1), which is not regular. | Dyadic components and regularity are retained. No change. |
| 5.3 fixed-weight crystabelline density | Rank one, smooth characters of a Z_p quotient | Characters factoring through Z/p^n number p^n, with the algebraic weight fixed. By contrast, fixing the trivial inertial type and weight zero gives inertia value 1 throughout. | Varying the smooth part is different from fixing type and weight. No change. |
| 5.4 unramified supercuspidal density | E/F unramified quadratic, ψ versus ψ^c | If ψ≠ψ^c, the induced Weil representation is irreducible and its endomorphism space has dimension 1. If ψ=χ∘Norm, the induction splits as χ⊕χη and its endomorphism space has dimension 2. Rank one has induced dimension 1. | Irreducibility is not automatic from the inducing field. No change. |
| 6.1 benign density | Rank one; rank two eigenvalues 1,p; empty crystalline space | Rank one has zero eigenvalue-pair inequalities and benign=crystalline. The ratio p in rank two violates the benign exclusion. For an empty space, closure of the empty benign set is empty. | The benign predicate and its empty case do not assert existence in an empty component. No change. |
| 6.2 testing ideals | W=0; W nonzero trivial with all algebraic weights; rank-one torsion of order p^a | W=0 gives J=R and V(J)=∅. The nonzero full algebraic family gives J=0. Exponents modulo p^a give p^a distinct torsion restrictions; a=0 gives exactly one. | Nonzero type and weight variation are genuine conditions. No change. |
| 6.3 prescribed inertial type | Rank one with μ of order p^a; fixed versus varying weights | A fixed type and fixed algebraic weight give one torsion character. Allowing algebraic exponents modulo p^a gives all p^a characters, including 2 for p=2,a=1. | The statement varies regular weights and assumes a nonzero K-type. No change. |
| 6.4 minimality | Totally ramified uniformizer; e=6,f=2,q_F=5; wild cubic over Q_3 | Valuation 1 has gcd(e,1)=1 and residue degree 1 in the totally ramified example. In F_25× the sixth-power subgroup has order 24/6=4 and equals F_5×, so it cannot generate the degree-two residue extension. A cubic uniformizer over Q_3 is minimal but lies outside p∤2d. | Existence of a minimal element and the patching range are independent restrictions. No change. |
| 6.4 deep versus full set | F=Q_3,d=1, character nontrivial on U¹ and trivial on U² | The character has depth 1. With m=1 the deep family requires n>2, hence n≥3, and its specified restriction cannot recover this shallow character, already trivial on U³. | The full minimal-stratum set is strictly larger than the deep testing family. No change. |
| 6.5 inducing extension | p=5,d=2,E=F(√5); p=3,d=3; e=6,f=2,p=5 | The first extension has e=2,f=1 and is tame, with 5∤4. The second has 3 dividing 6 and is excluded. Degree 12 in the third example satisfies 5∤24 but the residue computation above gives no minimal element. | Both p∤2d and existence of a minimal element remain in the endpoint. No change. |

Additional source-error controls were recomputed: for an unramified residual character over Q_5 with uniformizer value 2, the algebraic-on-units construction with uniformizer value 1 gives 1≠2 until an unramified Teichmüller factor is inserted. EP's conductor count at d=1,q=5,n₀=2,n=4 is 125−25=100, whereas its displayed shifted count is 25−5=20. For R=O[ε]/(ε²), all generic points evaluate ε to 0 although ε≠0. These explain the source issues below; the package has already avoided them.

The standing field/coefficient hypotheses exclude rank zero, q=1, equal-characteristic coefficients, inseparable extensions of p-adic fields and noncompact substitutes for the compact groups. Zero modules and empty testing families were tested where their types allow them. No denominator used above vanishes: q>1, dimensions of the nonzero factors are positive, and coefficient scalars inverted in L are nonzero.

### Pinned library checks and acceptance file

The pins read from the manifest are Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5. Every library declaration cited in the README was opened at these pins.

| File at the pin | Opened declarations and relevant content |
| --- | --- |
| Mathlib/RingTheory/Ideal/Maps.lean:869 | Module.annihilator and Module.mem_annihilator (871); Module.comap_annihilator (895), with algebra and scalar tower; Module.annihilator_eq_bot (901), with ring and additive-group hypotheses. |
| Mathlib/Algebra/Module/Submodule/Ker.lean:59 | LinearMap.ker is comap of bottom; LinearMap.mem_ker (63) identifies membership with map value zero. |
| Mathlib/Algebra/Group/Action/Faithful.lean:47 | FaithfulSMul is injectivity of the scalar action as tested on every vector, not merely nonzero action. |
| Mathlib/Algebra/Module/Submodule/Lattice.lean:238 | Membership in an indexed infimum is membership in every member, supporting the intersection-of-testing-kernels formulation. |
| Mathlib/RingTheory/Spectrum/Prime/Basic.lean:137 | PrimeSpectrum.zeroLocus; vanishingIdeal (157) is an intersection of prime ideals; zeroLocus_eq_univ_iff (302) detects containment in the nilradical. It does not make a nonreduced ring reduced. |
| Mathlib/RingTheory/Spectrum/Prime/Topology.lean:159 | PrimeSpectrum.zeroLocus_vanishingIdeal_eq_closure supplies the topological closure comparison, independently of the arithmetic argument that the vanishing ideal is zero. |
| TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145 | TauCeti.completedGroupAlgebra supplies the completed group-algebra carrier. |
| TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean:322 | TauCeti.IsCompactModule.completedGroupAlgebraModule, with the compact-module witness and continuous action binders read at 83–85 and 195–197. Scalar tower is at 340 and continuity at 348. This does not supply compact projectivity or a patched module. |
| Mathlib/RingTheory/DividedPowers/Basic.lean:78 | The Berthelot-related near-match is a divided-power structure, not the Berthelot rigid generic-fibre functor needed here. |

Object searches covered framed deformation rings, actual patched modules, Weil–Deligne representations, potentially crystalline/semistable predicates, benign points and the rigid generic fibre, in both pinned libraries. Generic spectra, annihilators and completed group algebras are available and correctly imported as interfaces. None of the arithmetic carriers needed to state the endpoints was located; the opened near-matches do not provide them.

| Headline from the summary | README | Suggested.lean outcome |
| --- | --- | --- |
| Faithfulness of the unrestricted local deformation action | 4.2 | Explicitly listed in the module docstring; missing the universal framed ring and actual patched module. |
| All-prime regular crystalline density, scheme and rigid | 5.2 | Explicitly listed; missing the arithmetic point representations, crystalline predicate and rigid generic fibre. |
| Fixed-regular-weight potentially crystabelline density | 5.3 | Explicitly listed; missing the deformation carrier and potentially crystalline/abelian-inertia predicates. |
| Fixed-regular-weight unramified induced supercuspidal density | 5.4 | Explicitly listed; additionally needs the Weil–Deligne and irreducible induced-character conditions. |
| All-prime benign crystalline density | 6.1 | Explicitly listed; missing the benign Frobenius/refinement predicate on the actual crystalline points. |
| Density for each inertial type, varying regular weights | 6.3 | Explicitly listed; missing the arithmetic carrier and nonzero K-type/LLC interface. |
| Fixed-weight density with a prescribed minimal-stratum inducing field | 6.5 | Explicitly listed; missing simple strata, simple characters and their occurrence on the arithmetic points. |

Suggested.lean contains one import, one module docstring and the namespace; it has **zero declarations and zero sorried theorems**. Consequently the exhaustive one-tactic probe has zero targets, and there are zero declaration signatures for a scratch #check binder audit. There is no padding, stand-in predicate, sorry'd data, or silently dropped section hypothesis. No headline that can be stated using the pinned carriers and a few simple definitions was found omitted.

The required `lake env lean` elaboration was run from the pinned content checkout against the package's Suggested.lean: **exit 0, no output and no warnings**. No TauCeti import required a preliminary module build. No Lean process was left running.

### Supplier resolution and ownership

Each citation was resolved anew against main or the supplied open head. Locations below are repository-relative README locations, with the pull request identified for reproducibility. The declarations on main were not replaced by a later revision's numbering.

| Supplier | Locations opened and ownership resolved |
| --- | --- |
| CompletedCohomologyAndLocalGlobalCompatibility, PR #1270 | TauCetiRoadmap/CompletedCohomologyAndLocalGlobalCompatibility/README.md:1852 (§5.1), 1907 (§5.2), 1941 (§5.2a), 1966 (§5.3). The parent owns patching, typed quotients, its benign geometry and support as a union of components. This Part II adds local component detection, faithfulness and the stated density consequences. |
| LocalGaloisDeformationRings, PR #923 | TauCetiRoadmap/LocalGaloisDeformationRings/README.md:98 (§F.0.1), 1275 (§1.1), 1549 (§1.19), 2240 (§3.1), 2291 (§3.4), 2387 (§3.9). General deformation, determinant and Hodge-type interfaces resolve; the stronger unrestricted component theorem is explicitly a gap. |
| DeformationAndDerivedPatchingAlgebra, PR #1034 | TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:281 (§1.12), 943 (§4.4), 990 (§4.6), 1005 (§4.7). Tensor/dimension and point-detection interfaces resolve. The extra reducedness and geometric-splitting requirements are declared separately. |
| CompletedCohomologyPartII, PR #1035 | TauCetiRoadmap/CompletedCohomologyPartII/README.md:183 (§F.1), 201 (§F.2), 241 (§F.4), 786 (§3.2). Compact torsion-free duality, completed tensors and finite Iwasawa modules support the stated testing construction. |
| PadicLocalLanglandsForGL2Qp, PR #1312 | TauCetiRoadmap/PadicLocalLanglandsForGL2Qp/README.md:205 (§0.1), 1122 (§3.6a). Analytic density and the special GL₂/Q_p benign geometry are imported; the present arbitrary F,d endpoint is not a restatement of that special case. |
| SmoothRepresentationsOfLocalGroups, PR #1688 | TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:1916 (§SR.2.1), 2571 (§SR.3.1), 2710 (§SR.3.2), 3840 (§SR.5.2), 3886 (simple-type material). Smooth induction and background type theory are imported. The precise EP families and occurrence interfaces are stated as extensions of this owner. |
| EndoscopicTransferAndUnitaryTraceComparison, PR #999 | TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4013 (§10.21), 4125 (§10.26), 4208 (§10.30). The full Weil–Deligne datum includes N; geometric reciprocity and the LLC normalization agree after the explicit twist. |
| ModularityAndLanglandsExtensions, PR #1180 | TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:776 (§2.1). Potential diagonalizability criteria exist; universal crystalline lift existence and prescribed determinants are separately declared contracts. |
| ArithmeticGaloisRepresentations, PR #856 | TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:995 (§1.3). Finite-index continuous induction, duality and finite-coset topology support the nonsmooth compact induction comparison. |
| PadicHodgeTheory, PR #1062 | TauCetiRoadmap/PadicHodgeTheory/README.md:682 (§3.3), 705 (§3.4), 732 (§3.5), 754 (§3.6), including the unramified factor at 762–764. The character convention does not lose the uniformizer value. |
| ClassFieldTheory, main | TauCetiRoadmap/ClassFieldTheory/README.md:267 (former §2.6 mapping), 531 (C6), 1204 (Layer 7), 1576 (Layer 9). The old numbering has an explicit mapping. Arithmetic reciprocity on units is inverted for this package's geometric convention. |
| ReductiveGroups, main | TauCetiRoadmap/ReductiveGroups/README.md:1949 (Layer 6), 1977–1991 (characteristic-zero complete reducibility), 4143 (§10B). Rational highest weights and coefficient extension are the required objects. |
| PadicMeasuresIwasawaAlgebras, main | TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:909 (§1.7). The completed group algebra is the pinned carrier; the full projective-product decomposition, including fixed central character, remains an explicit contract. |
| AdicSpacesPartIII, main | TauCetiRoadmap/AdicSpacesPartIII/README.md:7714 (§R2.9), 7743 (generic fibre). The arithmetic point/completion and normalization-component assertions are explicitly added through the declared contract. |

The thirteen gap slugs agree between the README's “What … must provide” paragraphs and design/plan.json: framed-ring-components; crystalline-inertial-types; principal-series-types; minimal-stratum-types; projective-products; completed-tensor-reduced-equidimensional; geometric-component-splitting; pd-crystalline-lift; algebraic-capture; crystalline-lift-prescribed-determinant; crystalline-closure-components; local-benign-crystalline-points; berthelot-points-components. Each has a named supplier and a precise missing interface. No supplier is “none”. The checked supplier sections do not already provide those full contracts: in particular, a special rank-two or restricted patched benign theorem is not the all-prime local contract, and the tensor contract distinguishes imported dimension/flatness from the additional reducedness requirement.

The board package index was read before ownership searches. Searches by mathematical objects used the roadmap service across the indexed open heads and main, together with the board packages and both pinned libraries. I read the closest overlap candidates, rather than deciding ownership from search hits:

- PR #1745, TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:7 and 1044 (§5.3), owns its big quaternionic module and global genericity-dependent faithful flatness. It does not own this unrestricted local BIP component argument.
- PR #1829, TauCetiRoadmap/TriangulineVarietyAndItsLocalModel/README.md:7, 11 and 1001, owns local-model geometry and refinement accumulation. Its import of the parent's trianguline interface is consistent with this package's parent contracts; it does not duplicate density on the entire unrestricted framed ring.
- PR #2135, TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/README.md:15 and 23–34, owns polarized global automorphy infrastructure, not this local faithfulness theorem.
- PR #1071, TauCetiRoadmap/GL2ModularityLifting/README.md:1858 (§6.13), treats a different dyadic quadratic-twist module construction.
- PR #858, TauCetiRoadmap/ArithmeticGaloisDuality/README.md:4141 and 4238–4275, treats finite-order global character roots and Brauer obstructions, not continuous local characters trivial on the torsion subgroup.

The other two closest overlap candidates, PR #1270 and PR #1312, are resolved in the supplier table. No double ownership or mutual handoff was found. No fully qualified name can collide in Suggested.lean because it declares none. The overlap data reports no other head changing this roadmap, no dropped cited id, and no id supplied only by an unacknowledged open revision; checking the relevant cited sections found no contrary instance.

The dependency check was run with the requested movable/order/content arguments. Its complete result was:

```
depcheck: 236 roadmaps, 2144 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Every Needs line was also read manually; the mechanical pass was not used to excuse a missing mathematical input.

### Shape, generality and policy

The package is a continuation of the existing parent, not a re-plan. Its six layers are organized around local component geometry, testing, support and density. Their dependency lines force the relevant order; the README does not propose to follow a source's chapter arrangement. The patching results keep their actual p∤2d hypotheses, while the crystalline and benign endpoints at every prime have a separate local route. There is no “good primes only” replacement for those all-prime endpoints.

I compared the shape with the main ClassFieldTheory and PadicMeasuresIwasawaAlgebras roadmaps. All six layers have Examples and Dependencies. The definition/interface blocks retain their API and at least three Checks: §1.1 has five, §3.2 eight, §6.2 four and §6.4 five; the algebraic-family interface in §3.5 has three. The remaining targets have stated hypotheses, locators and Needs lines. I checked the Checks against the surrounding statements, including the negative nonreduced and shallow-depth examples.

Backticked identifiers were resolved as imported declarations or mathematical notation; none purports to be a missing declaration owned by this empty acceptance file. The header, scope, conventions, supplier contracts, build description, downstream consumers and references are present. No computational algorithm, copied source passage, process handoff, machine path, prohibited import, set_option or sorry'd data was found in the four package inputs. The metadata is consistent with the mathematical scope. The sole requested repair is R01.

## Not verifiable

- No cited text was inaccessible; there is no outstanding request for a legal source.
- The thirteen declared supplier gaps are future library contracts. Their presence, hypotheses, owners, matching plan slugs and nonduplication were checked; implementations of those future results cannot be verified here. This is the declared conditional foundation, not an additional finding.
- The acceptance file has no theorem bodies to test mathematically in Lean. Its successful elaboration verifies its permitted form and imports, not the truth of the README's deep theorems; the source and adversarial checks above provide the substantive review.

## Source issues

- **Error** in BIP at Lemma 6.5 proof, printed pp. 47–48: the source says its algebraic-on-units character matches the residual character; it should include an unramified Teichmüller factor to match the uniformizer value; affects the proof.
- **Gap** in BIP at Theorem 6.8 proof, printed p. 49: the source says an entire algebraic-test support lies in one supported component; it should choose a supported component through a characteristic-zero fixed-determinant point; affects the proof.
- **Misprint** in BIP at Theorem 6.8 proof, printed p. 49: the source says EP Theorem 6.12 supplies the scheme-support statement; it should cite EP Theorem 6.3, with 6.12 supplying the rigid argument; affects nothing.
- **Error** in EP at Lemmas 2.6 and 2.9 and Corollary 3.2, printed pp. 343–344, 351: the source says tensor capture permits every finite-dimensional factor; it should require a nonzero factor, since tensoring with zero captures only the zero module; affects a stated result.
- **Misprint** in EP at equation (15), printed p. 352: the source says conductor n−i+1 characters are counted using quotients at depths n−i+1 and n−i; it should use depths n−i+2 and n−i+1 under its stated conductor convention; affects a stated result.
- **Error** in EP at equation (21), printed p. 355: the source says the squared Heisenberg dimension equals the index of the two hereditary-order unit groups; it should retain the U_E factor and use the J/H index, which is one in rank one; affects a stated result.
- **Error** in EP at Proposition 3.25, printed p. 358: the source says the exact-depth class count has q_E^n growth at every depth; it should restrict to depths admitting minimal elements and use bounded-gap admissible depths for cumulative capture; affects a stated result.
- **Error** in DPS at Corollary 7.7, printed p. 42: the source says evaluation is injective for every finite-dimensional tensor factor; it should assert density for nonzero factors without general injectivity, as the trivial-group dimension calculation shows; affects a stated result.
- **Error** in BIPD at Lemma 5.1 proof, printed p. 11: the source says vanishing on a Zariski-dense point set forces a function to be zero for arbitrary R; it should pass to reduced spaces or conclude nilpotence, which suffices for density; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "52ba43aa372428b9340a792fec7d8f23d199358e", "job": "REV-PKG-CompletedCohomologyAndLocalGlobalCompatibilityPartII~3", "model": "gpt-6-astra", "worker": "chris-9"} -->
