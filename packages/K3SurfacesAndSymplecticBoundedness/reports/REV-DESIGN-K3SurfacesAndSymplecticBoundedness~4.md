<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/63#issuecomment-6308870434 -->
Review (codex) of a88c9bc

Verdict: needs_changes

1. **F01** (P2) Reconcile the conormal convention in the crystalline self-intersection source

   **Location:** design README:158; plan:3396, `crystalline-gauss-bonnet.detail`. Quoted claim: “Apply it to the diagonal, whose normal bundle is T_X”.

   **Claim:** Gros IV Theorem 2.1.1, transported by the stated Chern comparison, directly supplies the normal-bundle formula needed for Gauss–Bonnet in every dimension.

   **Witness:** `gros-chern line 2315` defines N as J/J²; `gros-chern line 2318` prints its top Chern class. For Δ⊂ℙ¹×ℙ¹, conormal Ω¹ has degree −2, while normal T has degree +2.

   I also inspected the original PDF's printed page 78: the conormal definition is not merely an extraction error. III §2.1, `gros-chern line 1950`, gives Chern-class comparison, but the design supplies no conversion of this printed self-intersection convention to its positive Gysin/diagonal convention. CrystallineCohomology CR.3:duality.1 uses the positive Euler trace. On ℙ¹ that trace is 2. In dimension two the sign disappears, so checking only the K3 application would miss the defect. The Gauss–Bonnet theorem itself is not being declared false.

   **Exact repair:** retain the all-dimensional smooth-proper contract. State the needed normal-bundle self-intersection identity as an explicit part of it, and reconcile Gros's printed conormal formula with the chosen Chern/Gysin conventions, or supply a verified independent derivation of that identity. Explain any source misprint rather than silently replacing N by its dual. Add the diagonal of ℙ¹ as a computed Check with result +2; a line in ℙ² has self-intersection +1 and provides a second sign control. Synchronize the plan detail. Do not narrow the general theorem to surfaces to hide the sign.

2. **F02** (P2) Separate the ample scheme criterion from global projectivity over arbitrary bases

   **Location:** design README:82; plan:3363–3371, `gap:ample-space-scheme`. Quoted claim: “a proper algebraic space over a scheme with a relatively ample invertible sheaf is a projective scheme over that base”.

   **Claim:** relative ampleness and properness provide global projectivity over an unrestricted scheme, and the scheme/descent step is new supplier work.

   **Witness:** `stacks-projective-morphisms line 4688` concludes locally projective; line 4764 requires a quasi-compact, quasi-separated base for global projectivity. `TauCetiRoadmap/StableReduction/README.md:394` already plans effective étale descent with a compatible relatively ample invertible sheaf.

   The contract does not specify a projectivity convention or a base hypothesis. Stacks distinguishes projective, H-projective and locally projective at `stacks-projective-morphisms line 4633`. Its arbitrary-base implication is the local one, not the stronger conclusion written here. The ample algebraic-space criterion is `stacks-relative-ample line 1253`; the effective étale descent argument is at line 1274 and the arbitrary-base locality statement at line 1306. Merely citing the first criterion would not prove the global projectivity conclusion. Moreover, the scheme descent component must use the already named StableReduction Layer 2 contract, rather than assign a second owner to polarized scheme descent.

   **Exact repair:** specify the inherited projectivity convention. Import polarized scheme descent from StableReduction Layer 2 and record the resulting scheme criterion. State projectivity locally on an arbitrary base; state the global implication with the verified quasi-compact and quasi-separated hypothesis (or supply a precise stronger theorem and its proof/locator). Retain all arbitrary-base K3 families by applying the criterion on affine base opens. Minimize or remove the gap after importing the existing descent result, and synchronize its consumers. Add a Check distinguishing local projectivity from the global embedding assertion; do not infer a single global embedding merely from affine-local ones. The two Stacks works have been added through the sources service without changing author-recorded entries.

3. **F03** (P2) The primitive-openness proof does not cover square-zero Picard sections

   **Location:** design README:977–979; plan:2574 and 2594. Quoted claim: “For a relative Picard section λ the locus of geometric primitivity is open.” The proof uses “only finitely many possible proper divisibilities n²|d”.

   **Claim:** the displayed degree argument proves openness for every relative Picard section, including nonample sections of square zero.

   **Witness:** On an elliptic K3 with a section, a fibre F is primitive and 2F is not, but F²=(2F)²=0. Every positive n satisfies n²∣0. Thus the asserted finite-divisor bound gives no finite union of root loci.

   The zero class is another square-zero instance. This is a missing case in the argument, not a counterexample to the openness theorem. Rizov's printed proof at `rizov line 505`–`rizov line 516` also only invokes divisors of d; copying that argument does not settle d=0. The cited range ending at line 503 does not even include this part of the proof.

   **Exact repair:** preserve the arbitrary-section theorem. Use an auxiliary relative ample H from the strongly projective family. Locally d=λ²/2 and m=λ·H are constant. For d≠0, possible divisibilities satisfy n²∣d. For d=0 and m≠0, they satisfy n∣m. If d=m=0, Hodge index and §1.5 imply λ is zero on every geometric fibre, so there are no primitive points on that piece. Add the Hodge-index dependency explicitly and Checks for F, 2F and 0. This completes the finite-union argument without replacing the theorem by its ample special case. Update the plan proof and the locator to include Rizov's part (ii).

4. **F04** (P3) Distinct frames need not give distinct Hilbert points

   **Location:** design README:1063; plan:2880–2883, `frames_not_classes`. Quoted Check: “Different projective frames give distinct Hilbert points but the same polarized object.”

   **Claim:** changing the projective frame always changes the embedded subscheme's Hilbert point.

   **Witness:** On the Fermat quartic over ℂ, interchange x₀ and x₁. This nontrivial polarized automorphism acts nontrivially on H⁰(O_X(3)), but preserves the cubic embedding's image. The resulting distinct projective frames have the same Hilbert point.

   The PGL action on the Hilbert locus has the polarized automorphism group as stabilizer. This does not invalidate the stated frame torsor after pullback over an object of the moduli stack: that pullback also retains the identification with the given family.

   **Exact repair:** replace the Check by this stabilizer example. Distinguish points of the frame torsor, or embeddings with an identification of their source, from the underlying Hilbert points. Say that a frame change outside the stabilizer changes the Hilbert point. Keep the stack-level torsor API; do not assert that PGL acts freely on the Hilbert locus.

5. **F05** (P3) Two sampled general contracts still have incomplete locators

   **Location:** design README:84 and 144; plan:3334–3345 and 3436–3444. Quoted clauses: “genus-one/Jacobian canonical-bundle and coherent Euler-characteristic comparisons”; “analytic exponential sheaf sequence with map z↦exp(2πiz)”.

   **Claim:** the cited passages support the whole general genus-one surface interface and the normalized, natural analytic Chern comparison.

   **Witness:** `dolgachev-keum line 424` starts with an elliptic surface; line 493 uses a K3 Jacobian. `huybrechts line 452` displays an unlabeled exponential sequence; lines 470–472 identify the pairing for complex K3 surfaces.

   These passages support the indicated elliptic lattice formula and K3 applications. They do not supply a locator for the full all-characteristic genus-one/Jacobian canonical and Euler comparisons, the general quasi-elliptic rational-base unirationality statement, or the explicitly normalized general analytic comparison. The additional Huybrechts quasi-elliptic passages identify the small-characteristic K3 branch, not all those general surface assertions. These are locator deficiencies, not findings that the contracted theorems are false or unowned.

   **Exact repair:** add exact theorem/section/page locators for those general subclaims, or an explicit derivation from named existing supplier statements. Retain the valid application locators and the full general domains. Pin exp(2πiz) and the positive Chern convention against that derivation and the existing winding-number Check. Fetch any newly cited work through the sources service; an inaccessible primary may be recorded as uncertified under the brief's rules. Do not certify the general statements solely from the K3 applications.

Five findings: three P2 and two P3; no P1. This is a repairable design, not a scope rejection. The general K3 programme, including small and wild characteristics, remains appropriate. Declared supplier gaps are treated as contracts, not as missing implementations.

The reviewed files are `packages/K3SurfacesAndSymplecticBoundedness/design/README.md`, `packages/K3SurfacesAndSymplecticBoundedness/design/plan.json` and `packages/K3SurfacesAndSymplecticBoundedness/sources.toml`. In this report, “design README” and “plan” refer to those files. Review date: 2026-10-21.

The round-3 review file named in the brief is absent. Consequently its original wording cannot be checked. The following reconciliation uses the seven finding identifiers and descriptions in `packages/K3SurfacesAndSymplecticBoundedness/reports/FIX-DESIGN-K3SurfacesAndSymplecticBoundedness~4.md`; it does not pretend that the missing review was read. No item there was marked not actionable.

| Previous finding | Repaired passage and independent check | Status |
| --- | --- | --- |
| F01: later K3 inputs in quotient argument | Design README:718 now requires “§6.0 `IsK3.supersingularDiscriminant`” and “§6.0c `IsK3.picardRank_ge21_iff_eq22` and `IsK3.genusOneJacobian_isK3`”. Both targets precede §6.1. The finite-height rank bound, infinite-height pencil alternative and Jacobian root-lattice comparison are explicit. | Repaired. The general genus-one source coverage is separately R05. |
| F02: complete-intersection connectedness | Design README:62 requires “positive-dimensional complete intersections cut out by an ordered regular sequence of ample effective Cartier divisors”. SGA 2 XII Corollary 3.5 applies iteratively to the Cohen–Macaulay intermediate cuts; both omitted-hypothesis counterexamples at lines 67–68 work. | Repaired. |
| F03: duplicate finite-field Brauer input | Design README:1137 consumes “SchemeAndStackFoundations §§2.10, 2.15 and `TauCeti.brauerCohomologyEquiv` with `TauCeti.subsingleton_brauerGroup_of_finite`”. The inverse direction of the pinned Brauer equivalence gives the needed vanishing. The deleted gap is absent from both files. | Repaired. |
| F04: duplicate Hochschild–Serre and quotient invariants | Design README:130 says “The spectral sequence itself is consumed from SchemeAndStackFoundations §2.15.” The remaining gap concerns Kummer/restriction compatibility, with units, d₂ and d₃ retained. Line 122 derives rational invariants using derived inverse limit before rationalization. | Repaired. |
| F05: duplicate characteristic-zero vanishing | Design README:94 consumes “§9.10 `algebraicAdjointVanishing`”. The actual supplier statement covers an integral nef big divisor as a rational divisor with empty fractional support. The positive-characteristic restrictions remain explicit. | Repaired. |
| F06: general sources replaced by application locators | Design README:160 now cites “Illusie … II Proposition 3.11 and Remark 3.11.2”; line 158 cites “Gros, IV Theorem 2.1.1”. Illusie's general comparison and several other replacements check out, but Gros needs a sign/dual reconciliation, and two sampled contracts still lack locators for all general subclaims. | Partly repaired: R01 and R05. |
| F07: missing first consumer of ample-space criterion | Design README:997 includes “`gap:ample-space-scheme`”; the plan prerequisite, layer dependencies and gap consumer list agree. | Repaired as an edge. The contract's content is independently R02. |

## Verified sound

The following are checks performed, not a claim to have supplied missing library proofs. There are 60 targets: 7 definitions, 6 constructions, 45 theorems and 2 example targets, with 84 named API entries and 187 target Checks. I read the entire design and applied the degeneracy, hypothesis, normalization, ownership and interface questions to every target and its API. The tables record the significant substitutions and their outcomes; “retain” means no defect found in that check.

All 28 gap slugs occur in both the plan and README. Each has a named supplier and proposed Part II section; needs and consumer lists agree between the files. None has supplier `none`. Their absence from a supplier today is not a finding. Apart from the specific issues above, the interfaces identify the missing mathematics rather than merely asking for a K3 conclusion. In particular the formal-Brauer, equivariant-Brauer and Mathieu interfaces retain the distinct coefficient domains and compatibility data needed by their consumers.

### Seeded source sample

Every one of the 15 requested contracts was inspected. Ten have supporting text or explicit derivations from inspected supplier statements at the claimed scope; four have the limitations recorded in R01, R02 or R05; Matsusaka–Mumford has a settled waiver. The counts do not certify an unread primary. Source references below refer to the cached line-numbered texts. Printed page numbers, theorem numbers and hypotheses were compared with those texts; Gros's problematic notation was additionally checked in the original PDF.

| Sampled contract | Text read and scope check | Result |
| --- | --- | --- |
| `hypersurface-cohomology` | SGA 2 XII Corollary 3.5, printed p.120, `sga2 line 4277`–4287. Regular ample cuts with depth at least two give the iterated connectedness assertion. Existing conormal/Koszul suppliers provide the separate cohomology input. | Verified with positive final dimension. The two disconnected controls are valid. |
| `surface-quotient-resolutions` | Stacks 0BGP, printed pp.41–42, `stacks-surface-resolution line 1880`–1908; 0C2N and 0C5P at lines 2274–2329. Normality follows from invariant subrings; the quotient is already imported. | Verified for excellent normal surface quotients, including wild actions. No wild rational-singularity vanishing is smuggled into the comparison maps. |
| `matsusaka-mumford` | `rizov line 1075`–1085 uses the non-ruled polarized extension theorem. The primary Theorem 2 is marked waived in the manifest. | Application checked; primary not certified or reopened. |
| `ample-space-scheme` | Newly fetched Stacks 0D32, 0D35–0D36, `stacks-relative-ample line 1253`–1327; 0B5N and 0BCL, `stacks-projective-morphisms line 4688` and 4764. | Scheme/local criterion verified; unrestricted global projectivity and duplicate descent ownership need R02. |
| `elliptic-surface-geometry` | DK equation (3.1), `dolgachev-keum line 424`–443; Jacobian application at 493–505; `huybrechts line 1127`–1132 and 1182–1183. | Index-square formula and the small-characteristic branch checked. General comparison coverage remains incomplete: R05. |
| `adjoint-positivity` | Terakawa Theorems 1.4–1.6 and 2.4, `terakawa line 148`–193 and 354–385. Checked the different general-type bounds at p=2 and p≥3 and the excluded quasi-elliptic Kodaira-dimension-one case. | Verified. Characteristic-zero vanishing comes from the existing adjoint supplier, not a new gap. |
| `tame-lefschetz` | Keum Proposition 2.4, `keum line 336`–341. Smooth projective variety, automorphism of finite order prime to p, and ℓ invertible. | Exact general statement verified. The identity requires Euler characteristic of the fixed locus, not a finite point count. |
| `equivariant-brauer-descent` | DK (4.7), `dolgachev-keum line 599`–615, and SchemeAndStackFoundations §2.15 `hochschildSerre_galois_covering`. | The source is an application; the general compatibility is explicitly derived by naturality. Units and entering differentials are retained. |
| `integral-topology` | Huybrechts Chapter 1 §3.2, `huybrechts line 452`–472. Checked the K3 Picard embedding, torsion argument and intersection comparison. | K3 application verified; normalization/general-natural-comparison locator needs R05. |
| `witt-formal-brauer` | Artin–Mazur I §1, `artin-mazur-formal line 391`–416; II (1.3)–(1.4), lines 658–685; II Proposition (2.13), lines 808–821; II Corollaries (4.1)–(4.4), pp.109–110, lines 902–938; Nygaard Corollary 2.7, `nygaard-closedness line 286`. | Representability/realization and the finite-height rank are supported in their characteristic-p/perfect-field domains. Norm and blowup arguments supply the specified functoriality. “Additive” is only asserted after algebraic closure in the one-dimensional infinite-height case. |
| `crystalline-gauss-bonnet` | Gros IV Theorem 2.1.1, printed p.78, `gros-chern line 2313`–2318; III §2.1, pp.65–66, lines 1950–1979; crystalline diagonal supplier. | General derivation has the sign/dual gap R01. Surface specialization alone is insufficient to verify it. |
| `artin-discriminant` | Huybrechts Chapter 17 Proposition 2.19, `huybrechts line 14317`–14342; DK de Rham class discussion, `dolgachev-keum line 737`–755. | The discriminant/index statement and the required 𝔽_p-linear, not k-linear, injection agree with the contract. The p=2 rescaling requirement is explicit. |
| `mathieu-permutation-model` | Mukai (0.2), `mukai line 53`–63, and §3, p.201, line 756. | Fixed-letter character and order checked: 2⁷·3²·5·7·11·23=10200960; index 24 gives 244823040. |
| `mukai-eleven-groups-recognition` | Mukai (0.6), §§3–8, especially `mukai line 1503`–1540; DK Theorem 4.7 proof, `dolgachev-keum line 793`–808. | Rational and compatible ℓ-adic versions distinguished. Q₈'s rational/dyadic obstruction and the Sylow-embedding hypothesis are retained; the K3 Sylow argument stays local to this roadmap. |
| `exceptional-mathieu-embeddings` | DK Theorem 5.2 list, `dolgachev-keum line 862`–897, and subgroup descriptions at 1566–1598. | Embeddings concern the specified extension and semidirect-product structures, not all groups of the same order. |

The remaining general-source repairs checked include Illusie II Proposition 3.11 and Remark 3.11.2 (`illusie-witt line 4202`–4223), with its covariant Picard convention; Liedtke v2 Definition 4.11 and Theorem 4.12 (`liedtke-mckay line 786`–815), with tame/linearly reductive hypotheses; and the point-blowup O-cohomology statement at `stacks-surface-resolution line 289`. These justify the specified general degree-one, tame ADE and formal-Brauer comparisons. The Shioda primary is expressly locator-only, not certified through Keum's use of it.

### Adversarial pass over the targets

Each row covers the named target's statement, API and Checks. It records mathematical substitutions, not Lean executions. The zero ring, empty schemes, ℓ=p, n=0 and nonproper/nonprojective examples were considered where their carriers make sense; field, smoothness, dimension and positivity hypotheses exclude them where necessary.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: intersection and half-norm | Quartic hyperplane H; rational curve C; zero class | H²=4, Q(H)=2; C²=−2; the determinant is that of the bilinear pairing. | Retain. |
| Conventions: contraction and action | Ordered basis e₁,e₂; p=2; two automorphisms | Contraction with e₁*∧e₂* sends e₁↦e₂*, e₂↦−e₁*; inverse pullback corrects contravariant composition. | Retain. |
| Conventions: twists and orientation | Point class; quartic H; exponential loop | Trace of point is 1; c₁(H)² has trace 4 with twist (2); exp(2πit) has lift increment +1. | R01 and R05 concern compatibility sources, not these numerical values. |
| §1.1 K3 predicate and API | Empty scheme; ℙ²; abelian surface; smooth quartic | Nonemptiness/dimension, canonical bundle and H¹ conditions distinguish these objects. | Retain. |
| §1.2 isomorphism/base change | Identity; tower; purely inseparable field extension | Faithfully flat field extension detects the stated vanishing and canonical triviality; geometric conditions remain geometric. | Retain. |
| §1.3 projectivity | Imperfect base field; smooth threefold | Regular proper surface criterion covers the surface; no dimension-three analogue asserted. | Retain. |
| §1.4 RR and contraction | O; quartic H; p=2 | χ(O)=2, χ(H)=4; alternating pairing remains nondegenerate in characteristic 2. | Retain. |
| §1.5 numerical kernel | Trivial, torsion and effective negative-square classes | Torsion is numerically trivial; an effective nonzero class has positive ample intersection and cannot enter the kernel. | Retain. |
| §1.6 quartics | t=0,1; Fermat polynomial at p=2; zero-dimensional ample cut | χ(tH)=2t²+2; inseparable/nonreduced quartic is excluded by smoothness; connectedness is not extended to two points. | Retain. |
| §2.1 relative Picard | Field fibre; rank jump; trivial class | Unramified does not imply flat over a family; geometric torsion-freeness is not asserted for an arbitrary surface. | Retain. |
| §2.1a infinite-height kernel | Zero candidate; characteristic 2; finite-height surface | The kernel witness is required to be nonzero; height alternatives are not conflated. | Retain subject to settled primary waivers. |
| §2.2 closed one-forms | Zero form; Cartier iteration; p=2 | Closedness does not by itself assert full degeneration for every surface. | Retain. |
| §2.3 no vector fields | Abelian surface; complex K3; p=2 | H¹(O)=0 excludes the abelian counterexample; Oda's perfectness and rational-point input are preserved after geometric base change. | Retain. |
| §2.4 Hodge/crystalline ranks | Degrees 0–4 and outside; p=2 | Rational ranks give Euler 24; derived-reduction and finite-generation inputs are still needed for integral freeness. | R01 for the general Euler input. |
| §2.5 formal deformations | Dual numbers; marked versus unmarked object | Tangent dimension 20 refers to the deformation problem with the specified identification, not a fine coarse moduli functor. | Retain. |
| §2.6 line deformation divisor | O; p dividing degree; degree invertible | Trivial line imposes zero obstruction; bad degree does not receive the good-degree smoothness conclusion. | Retain. |
| §2.7 lifting | p=2; ramified mixed-characteristic trait | Lift is allowed after suitable finite ramification; no universal unramified lift is asserted. | Retain. |
| §3.1 analytic predicate | Empty manifold; torus; quartic | Compactness, connectedness, dimension and H¹ distinguish the examples. | Retain. |
| §3.2 GAGA | Algebraic projective K3; nonprojective analytic K3 | Essential image is the projective analytic locus; it is not all analytic K3 surfaces. | Retain. |
| §3.3 integral topology | Potential H² torsion; quartic; loop convention | Picard injection and torsion-free target kill H² torsion; integral duality then kills H³ torsion. | R05 for general normalization locator. |
| §3.4 étale ranks | ℓ=p; ℓ=2≠p; point trace | ℓ=p is excluded; integral rank and Tate twists survive the allowed ℓ=2 case. | Retain. |
| §4.1 Picard base change | Identity; closed-field extension; obstructed rational class | Geometric invariance is separate from arithmetic descent and its Brauer obstruction. | Retain. |
| §4.2 Picard lattice | Gram [4]; zero class; negative curve; ℂ/ℝ | Even integral pairing; finite pushforward needs degree 2, while two pulled-back divisor intersections retain their degree. | Retain. |
| §4.3 ranks | Rank 0; rank 22; h¹¹=20 | Ample class excludes rank 0; Picard rank is not defined as a Hodge number in positive characteristic. | Retain. |
| §4.4 bounds/saturation | Same-rank sublattice of index ℓ; rank 22; characteristic zero | Rank equality is insufficient without saturation; characteristic-zero bound remains 20. | Retain. |
| §4.5 odd congruence | Dimension 0 and 1; ℓ=2,3; I+3E₁₂ | GL₀ is trivial; −1 is a dyadic torsion counterexample; (I+3E)ᵐ=I+3mE has no positive torsion order. | Retain odd-prime hypothesis. |
| §4.6 bounded descent | Closed field; imperfect field; finite field; nonzero obstruction | Finite basis descends to a finite extension; continuity is proved before using the finite quotient. Finite-field Brauer vanishing uses the correct comparison direction. | Retain repaired imports. |
| §5.1 symplectic predicate | Identity; composition; rescaled volume; p=2 | Kernel is invariant under volume scaling; −1=1 in characteristic 2 is respected. | Retain. |
| §5.2 polarized automorphisms | Scalar on L; L and Lⁿ; identity | The group concerns automorphisms of X preserving a class, not an extra G_m of line trivializations; torsion-free Picard compares powers. | Retain. |
| §5.3 finite étale group | Nontrivial involution; nonclosed field; p=2 | Finite étale neither means trivial nor means all geometric points are rational. | Retain. |
| §5.4 Wehler example | Two involutions and their product; nonample cut | Gram determinant −12; product matrix has determinant 1 and trace 14, so infinite order. Required ample regular cuts are explicit. | Retain. |
| §6.0 supersingular discriminant | σ=0,11; p=2 | Signed determinant is negative in signature (1,21); the supplied rescaling evenness permits the endpoint exclusion including p=2. | Retain earlier placement. |
| §6.0a height inequality | h=1,10,11; infinite height | Bounds on ρ are 20,2,0; the last contradicts an ample class. Infinite height is a separate alternative, not an integer substitution. | Retain. |
| §6.0b rank-five pencil | Rank 1; primitive F and 2F; p=2,3 | Rank-five isotropy and primitive nef reduction are essential; quasi-elliptic outcomes are allowed. | R05 only for general surface sources. |
| §6.0c height and Jacobian | Pencil without section; putative rank 21; quasi-elliptic pencil | Jacobian comparison supplies the missing section; finite and infinite-height branches exclude rank 21. | Retain ownership and ordering; R05. |
| §6.1 tame quotient | Trivial group; involution; exceptional root rank 20 | Empty discriminant is 1; eight A₁ factors give 2⁸; rank-20 exclusion now has the earlier K3 discriminant/Jacobian inputs. | Retain. |
| §6.1a cyclic arithmetic | Orders 2,4,11,15 | For n=2, 24=8·3; for n=4, 72=4·15+2·2·3. Candidate root determinants at 11 and 15 are 121 and 225, requiring the geometric exclusion. | Retain. |
| §6.2 tame fixed points | Identity; exact orders 2 and 7; wild element | Identity is outside the finite-point table; counts are 8 and 3; wild elements do not use it. | Retain. |
| §6.2a wild loci | Empty locus; κ=0,1; D²=2,d=1 | Free characteristic-two case retained. In the displayed bound, N=2 gives N−d−1=0; no division by this quantity is justified or used. | Retain. |
| §6.3 wild quotients | Rational surface; free characteristic-two involution | Rational H² is algebraic; free Enriques quotient has Euler 12 and b₂=10. No unjustified Picard rank follows from Euler alone. | Retain. |
| §6.3a refinements | p=11,13; quasi-elliptic p=2,3 | The exceptional p=11 branch and small-characteristic fibration alternatives remain visible. | Retain. |
| §6.4 prime bound | p=2,13; order-p element | A p-power scalar in kˣ is 1 in characteristic p, so order-p elements are symplectic; p=13 contradicts the wild bound. | Retain. |
| §6.4a Picard faithfulness | Identity; characteristic 2; deck involution | Full rank-22 Picard representation is used, not preservation of a single polarization. | Retain subject to settled primary waiver. |
| §6.5 cohomological faithfulness | ℓ=p; rational quotient; free Enriques case | Correct coefficient exclusion; invariant rank contradictions account for the free characteristic-two branch. | Retain. |
| §6.6 uniform bound | Trivial group; characteristic 3; wild finite group | Characteristic 3 uses ℓ=5; odd congruence requires no averaging by the possibly wild group order. | Retain. |
| §6.7d involution pencil | Identity; integral swap matrix; p=2,3 | Identity and p=2 excluded. Swap is nonidentity mod 2, so rational ± eigenspaces cannot justify integral splitting. At p=3 quasi-elliptic suffices. | Retain as a theorem target; no completed replacement proof of the source's integral step is claimed. |
| §6.8 Artin-invariant-one predicate | p=3, determinants −9,+9,−81; rank 20 | Only rank 22 with determinant −9 meets the condition. Half-norm determinant would be wrong. | Retain. |
| §6.8a invariant dimension | Trivial group; C₇; order-21 example; exceptional pair | Dimensions are 24, (24+6·3)/7=6 and (24+14·6+6·3)/21=6. Exceptional pair is kept outside the universal five-dimensional conclusion. | Retain. |
| §6.9 Mathieu character | Orders 1,2,7; wild order | Empty prime product gives 24 at identity; values 8 and 3 at 2 and 7; not imposed on wild elements. | Retain. |
| §6.10 sharp characteristic-zero bound | Trivial group; involution; 23-cycle | Orbit counts 24,16,2 distinguish the five-orbit requirement. Embedding/classification does not itself assert realization of every subgroup. | Retain. |
| §6.11 positive-characteristic classification | p=2; even tame group; exceptional group structure | Tame order is odd at p=2; Q₂ obstruction is invoked only when p≠2. Exceptional extension structures stay explicit. | Retain. |
| §7.1 primitivity | 0; lattice generator; twice generator; squarefree d | Zero and double fail; n²∣d is valid when λ=nµ and λ²=2d. | Retain definition and tests. |
| §7.2 primitive openness | n=0; n=3 at p=3; F,2F,0 with square zero | Multiplication by 0 is excluded; closed root loci do not alone turn an infinite union into a closed set. | R03. |
| §7.3 polarized families | Constant family; d=0; no global representative | Positive degree excludes d=0; Picard section need only have local representatives. General-base projectivity is a separate assertion. | R02. |
| §7.4 vanishing/Hilbert polynomial | m=0,1,−1; d=2; p=2 | Positive powers only; χ(Lᵐ)=dm²+2 gives 4,10,20 for d=2 and m=1,2,3. Characteristic-zero and Terakawa inputs have distinct hypotheses. | Retain. |
| §7.5 cubic embedding | d=1,2; p=2 | h⁰(L³)=9d+2 gives ℙ¹⁰ and ℙ¹⁹; even intersection form eliminates the odd-square obstruction in the separation argument. | Retain. |
| §7.6 K3 Hilbert locus | Smooth quartic; singular specialization; nontrivial canonical line | Smoothness and the canonical class condition cannot be replaced by rank-one cohomology data. | Retain. |
| §7.7 Hilbert atlas | Cube root at p=3; Fermat coordinate swap; absent global root line | Root is a Picard section. Nontrivial polarized stabilizer identifies different frames in the same Hilbert point. | R04. |
| §8.1 moduli stacks | Nontrivial stabilizer; p dividing 2d | Stack retains automorphisms; finite-type DM assertion is not restricted to good degree primes. | Retain. |
| §8.2 separation | Generic identity; ruled special fibre; missing smooth model | Extends isomorphisms of existing families; not existence of a smooth model. Non-ruledness is necessary. | Retain with waived primary and R02. |
| §8.3 coarse spaces | Stabilizer; different k-forms | Geometric coarse-point classification does not identify all rational forms. | Retain. |
| §8.4 smooth locus | d=1; prime dividing 2d | Only the stated localization receives relative smoothness; bad primes remain in the ambient finite-type moduli. | Retain. |
| §8.5 finite-field finiteness | Fixed k,d; twists; obstruction to a line representative | Brauer vanishing provides actual representatives, then frames in a finite-type parameter space count forms; no coarse-point shortcut. | Retain with R02. |

### Adversarial pass over the supplier interfaces

This table also checks every gap, including the 13 outside the seeded source sample. The gap's named supplier owns the general statement; the K3 consequences remain in the local targets.

| Contract | Instances tried | Result | Change |
| --- | --- | --- | --- |
| `surface-projectivity` | Smooth proper surface over an imperfect field; dimension 3 | Regular surface projectivity applies; no higher-dimensional analogue imported. | Retain. |
| `hypersurface-cohomology` | Quartic; (1,1),(2,2) intersection; two disjoint fibres; two points | Regular ample sequence and positive final dimension distinguish the positive and negative examples. | Retain repaired hypotheses. |
| `oda-interface` | Perfect field with a point; algebraic closure; p=2 | Point and perfectness are not dropped; geometric application has both. | Retain. |
| `surface-arithmetic-quotient` | Degree-two extension; geometric curve descending finitely | Pushforward factor [K:k] is necessary; pullback of two divisor classes preserves normalized degree. | Retain. |
| `tame-linear-groups` | Identity group; odd-order subgroup at p=2; wild p-group | Tame domain excludes wild classification; ADE and quaternion realization have separate owners. | Retain. |
| `elliptic-surface-geometry` | Index 1 and 2; no section; quasi-elliptic p=2,3 | Determinants scale by 1 and 4; Jacobian/small-characteristic interfaces are needed. | R05. |
| `artin-discriminant` | σ=11; p=2; primitive versus p-multiple ample class | Evenness of the rescaled lattice and 𝔽_p-linear injection, rather than k-linear injection, are essential. | Retain. |
| `ample-space-scheme` | Affine base; unrestricted non-quasi-compact base; étale local representatives | Scheme descent and local/global projectivity are different obligations. | R02. |
| `witt-formal-brauer` | Height h finite; additive group; inseparable finite flat map; point blowup | Rank is h over W(k); p-series forces both Hom vanishings; norm-pullback is degree even inseparably; blowup filtration comparison preserves H². | Retain. |
| `crystalline-gauss-bonnet` | Point; ℙ¹; K3 | Euler values 1,2,24; odd dimension detects conormal/normal sign. | R01. |
| `crystalline-picard-degree-one` | Pic⁰=0; elliptic curve | Rational rank 0 versus 2; covariant Picard convention matches Illusie. | Retain. |
| `crystalline-chern-derivative` | Trivial line; nonzero Chern class | Trivial class has zero derivative; extension obstruction needs filtered comparison, not just existence of a connection. | Retain named compatibility gap. |
| `cross-realization` | Identity; finite and infinite order | Equal characteristic polynomials do not imply an infinite-order operator is identity; semisimplicity is used only in the finite-order case. | Retain. |
| `integral-topology` | O(1); winding-one loop; holomorphic pullback | Chern degree and lift increment are +1; naturality is a general interface. | R05. |
| `tame-lefschetz` | Identity; isolated tame fixed point; wild element | Identity uses the entire fixed-locus Euler characteristic; isolated tame contribution is +1. | Retain. |
| `surface-quotient-resolutions` | Trivial and wild actions | Normal invariant rings and excellent resolution do not require averaging; comparison maps do not assert R¹π_*O=0 in wild cases. | Retain. |
| `tame-quotient-singularities` | A₁; E₈; characteristic dividing group order | Determinants 2 and 1; wild case excluded. Negative definiteness and adjunction kill discrepancy. | Retain. |
| `quotient-transcendental-comparison` | Identity; cyclic quotient; ℓ dividing group order | ℚ_ℓ coefficients permit the quotient correspondence; no integral averaging asserted. | Retain with locator-only primary status. |
| `ruled-surface-two-forms` | Point blowup; ℙ¹-bundle | Extension across codimension two gives birational invariance; restriction of Ω² to a fibre is O(−2). | Retain derivation. |
| `mathieu-permutation-model` | Identity; involution; 23-cycle | Fixed letters 24,8,1, with M₂₃ retaining the fixed 24th letter. | Retain. |
| `mukai-eleven-groups-recognition` | Q₈; p=2; even tame group | Rational two-dimensional quaternion realization excluded; dyadic obstruction used only when Q₂ is among the allowed coefficients. | Retain. |
| `matsusaka-mumford` | Generic identity; ruled special fibre | Non-ruledness is supplied by K3 two-forms, not assumed for all surfaces. | Retain waiver. |
| `adjoint-positivity` | m=0; integral nef big class; p=2 general type | Positive-power restrictions and distinct Terakawa bounds are necessary; zero-characteristic vanishing is already supplied. | Retain minimized contract. |
| `exceptional-mathieu-embeddings` | Equal-order but different extensions | Specifying group structure, not just order, is necessary for the embedding conclusion. | Retain. |
| `surface-brauer-localization` | Delete points; exceptional rational trees; arbitrary divisor | General divisor removal has a residue term; no automatic isomorphism asserted. | Retain. |
| `surface-brauer-kummer` | H³ torsion zero versus nonzero | Finite H³ torsion quotient remains; abstract divisible group decomposition is not an equivariant splitting. | Retain. |
| `equivariant-brauer-descent` | Trivial group; involution; nonzero units cohomology | Existing spectral sequence supplies the object; Kummer naturality must retain units and edge differentials. | Retain repaired ownership. |
| `rational-surface-cohomology` | ℙ²; inseparable dominant rational map | Nonzero inseparable degree is invertible in ℚ_ℓ; resolution and trace give algebraicity without a separability restriction. | Retain. |

### Duplication and supplier-order audit

I read main-branch IntegralLattices, JacobianChallenge and GlobalQuadraticForms as shape/ownership references, and the relevant supplier sections below. Main was checked at `0e8b058a97cc4f9401d2679313e0e937761c1024`. The ArithmeticDynamics and ErdosProgressionPowers head scopes were inspected; neither owns the K3 geometric predicates, quotient classification or polarized K3 moduli constructed here.

The library pins in the content manifest are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Object searches covered schemes and geometric integrality, differential/exterior data, Picard and line-bundle classes, integral lattices and discriminants, p-adic reduction/congruence, Brauer groups, automorphisms and Mathieu/K3 names. Search hits were used for discovery; the cited relevant library files were then read at the pins. No existing geometric K3 predicate or theorem replacing a retained target was found. This is a duplication search, not a claim that absence follows from declaration-name matching alone.

| Object | Inspected existing owner | Audit result |
| --- | --- | --- |
| Smooth/proper/geometrically integral schemes | `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:127`, `Proper.lean:41`, `Mathlib/AlgebraicGeometry/Geometrically/Integral.lean:40`, at the Mathlib pin | Used as native predicates, not rebuilt as K3-specific scheme structures. |
| Relative differentials and line classes | `TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean`; `TauCeti/AlgebraicGeometry/LineBundle/Class.lean`, at the Tau Ceti pin | Existing classes and tensor/trivial API are suppliers; heavy surface/analytic geometry remains in README targets. |
| Integral lattice carrier | `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean`, at the Tau Ceti pin; IntegralLattices Layers 1, 5, 6 | Abstract lattice machinery is not re-planned; geometric Picard realization is the local contribution. |
| Odd congruence argument | `Mathlib/NumberTheory/Padics/RingHoms.lean` and `PadicIntegers.lean`, at the Mathlib pin | Reduction, kernel and valuation APIs exist; no identical finite-torsion kernel theorem was found in the object search. The general odd-prime target is appropriate. |
| Finite-field Brauer obstruction | `TauCeti/Algebra/CrossedProduct/Comparison.lean:267`; `TauCeti/Algebra/BrauerGroup/Trivial.lean:247`, at the Tau Ceti pin; SchemeAndStackFoundations §§2.10, 2.15 | Correct imported composite; no duplicate finite-field Brauer gap remains. |
| Finite projective quotient | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2633`, `finiteGroupQuotient_projective` | Quotient existence, including wild case, is imported; the gap adds normality/resolution interfaces. |
| Spectral sequence and étale/Galois comparison | Same supplier, lines 3608, 3838 and 3846 | Existing G_m comparison and Hochschild–Serre are cited by name. Narrow Kummer compatibility is not a second construction of the spectral sequence. |
| Conormal/Koszul, projection and intersection | Same supplier, lines 4132, 6715, 6888 and 7079–7210 | Existing general intersection/cohomology machinery is imported. Arithmetic numerical comparison states its actual extension. |
| Picard functor and representatives | JacobianChallenge Layer D; AlgebraicModuliForArithmeticGeometry §§7.6.1–7.6.1a; ComplexComparisonPartII C3.2d.2–C3.2d.5 | No rational point is silently required of the original field; sections and representatives are obtained locally with universal-functions hypotheses. |
| Polarized descent | `TauCetiRoadmap/StableReduction/README.md:380`–399 | Existing projectivity and polarized étale descent must be distinguished from the proposed ample-space gap: R02. |
| Adjoint vanishing | AlgebraicModuliForArithmeticGeometry §9.10 `algebraicAdjointVanishing` | Characteristic-zero input imported. Positive-characteristic vanishing and adjoint separation remain the extension. |
| Rational adic quotient invariants | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:981`, 1023, 1043, 1091; SchemeAndStackFoundations §2.15 | Derived finite-level descent plus rational averaging supplies it, including ℓ dividing the group order. No duplicate quotient-invariants gap remains. |
| Crystalline operations and Euler trace | CrystallineCohomology CR.4.7 and CR.3:duality.1, including `crysDiagonal_action`, `crysDiagonal_triangles`, `test_crysDiagonal_euler` | Existing diagonal/trace input is present. The additional self-intersection comparison needs R01. |
| Analytic/topological comparison | ComplexKahlerGeometry K3–K6; AlgebraicTopology Stage 6; MorseNovikov N6; ComplexComparisonPartII C1.9, C5.1, C6.3, C6.6 | These names refer to the inspected sections. “K3” in the analytic supplier's layer numbering is not a duplicate K3-surface roadmap. |
| Sporadic groups | CFSGStatement S1; Completed AlgebraicCodingTheory scope | Abstract sporadic presentations do not supply the retained 24-letter Mathieu action or its subgroup recognition; the named gaps add those interfaces. |

The new-roadmap supplier heads inspected were CrystallineCohomology `2c8b22a1737d1660f1baf397926b41e90139a80d`, ComplexComparisonPartII `c9ccfac82885efe9b0ba23cc8df12ddb5512af37`, and AlgebraicModuliForArithmeticGeometry `98fd03823a4797777f298cf65d50ff0cafb51c43`. For the last, the large-file response omitted text; a readable cached copy had exactly the returned Git blob hash `7f17045b3a53caffd8d032ffed3701339cdc86b8`, and its cited Picard and adjoint sections were read. Thus its content was not inferred from a stale branch name. Existing-roadmap revisions were not used as suppliers.

All 60 target `Needs` lines, the supplier inventory and eight layer dependency sections were read. Target prerequisites refer to earlier local sections; the newly placed §§6.0–6.0c close the earlier quotient dependency issue. Proposed Part II sections are explicitly gaps rather than nonexistent supplied declarations. No upward or cyclic supply was found, and no ownership move to a later roadmap is needed. R02 is a minimization/convention problem in an existing gap, not an undeclared later supplier.

The exact requested gate invocation could not read `packages/K3SurfacesAndSymplecticBoundedness/README.md`: that file does not exist at design stage. It exited 1 with FileNotFoundError before dependency analysis. I then ran the same gate, configuration, roadmap filter and order file with `packages/K3SurfacesAndSymplecticBoundedness/design/README.md` as candidate. It exited 0:

```text
candidate: K3SurfacesAndSymplecticBoundedness is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 3 roadmaps, 19 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The limited three-roadmap mechanical scan is supplemented by the manual supplier checks above; it is not presented as a complete machine proof of all supplier contracts. No merge-order or tooling file was changed.

### Shape, principles and artifact checks

The design has the required roadmap title, summary, scope, conventions, exact contracts, reading guide, eight layers and downstream/reference sections. Each layer ends with Examples and Dependencies. All 60 target names, 84 API names and 187 Check names occur in the README. Each of the 13 definition/construction targets has at least three Checks; R04 identifies a false Check despite that numerical coverage. Mathematical text uses the intended Unicode/prose form. Source applications and proposed extensions are distinguished. The numerical group examples serve as witnesses, not computational algorithms.

No route-only good-prime assumption replaces an all-characteristic endpoint. In particular the tame classification is not substituted for wild faithfulness, the p=2 and p=3 branches remain present, and smoothness over the good-degree localization is separate from finite-type moduli over all primes. The design does not re-plan an existing K3 roadmap or use a circular supplier route. No copied source passage was found in the statements inspected; mathematical names and formulas are accompanied by locators. No suspicious instruction from source or repository text was acted on.

The source manifest had 25 author-recorded entries; all 25 are unchanged by this review. Two legal Stacks extractions were appended through the source service, giving 27 entries. JSON/TOML parsing, gap/name consistency and whitespace checks were performed. The README and plan were not edited. The only package changes made by the review are these two deliverables and the permitted manifest additions.

## Not verifiable

- The previous round-3 review file is absent. F01–F07 were reconstructed from the available round-4 repair report, with the limitation stated at the beginning.
- Lean elaboration: **not available**. This design package has no `Suggested.lean`, and the brief provides no executable Lean elaboration command. No build was run, no admitted data or `set_option` was introduced, and no “sorry is the only warning” result is claimed. The headline/carrier and proved-Check obligations must be checked against the actual Lean file at package stage; this review does not certify a nonexistent file.
- `rudakov-shafarevich`, §8 Proposition 3; `matsusaka-mumford`, Theorem 2; and `nygaard-vectorfields`, Lemma 3.3: their manifest status is waived. Accessible applications were checked where relevant, but these primary statements were not read. The waivers are settled and were not reopened.
- `shioda-transcendental`, Proposition 5 (1986): the manifest records a paywalled/uncertified primary locator. Keum and Dolgachev–Keum applications do not certify its full text. This settled locator-only status was preserved.
- R01 cannot be certified by the cited printed formula without resolving the normal/conormal convention. R02's global projectivity conclusion is stronger than the arbitrary-base statement in the legal text inspected. R05's specified general subclaims have no complete supporting locator in the passages supplied. These limitations are findings, not new requests for the already waived texts.
- No outstanding new missing-text request was created. All new texts fetched for this review were obtained legally through the sources service; no source extraction was copied into the repository. The proposed involution-pencil theorem in §6.7d remains a mathematical target, not an implemented correction of the source's invalid integral-involution inference.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a88c9bc10bcb1e9c3edf65486796ee60c63f7199", "job": "REV-DESIGN-K3SurfacesAndSymplecticBoundedness~4", "model": "gpt-6-astra", "worker": "chris-1"} -->
