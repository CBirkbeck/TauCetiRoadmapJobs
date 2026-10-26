<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1113#issuecomment-6425886049 -->
Red team round 2 pass a (codex) of d5a1b2f

Verdict: needs_changes

1. **F01** (P1) The lattice-bound supplier citation no longer exists

   **Location:** `packages/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:134`, :1196, :1200 and :1245: “GeometryOfNumbersAndQuadraticArithmetic §§1.2, 1.5”.

   **Claim:** These sections supply the successive-minima and bounded-basis input for §13.2 and the reduction contracts.

   **Witness:** `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:358–444` at head f1c97f8 has only §§1.1–1.2 in Layer 1. Its :27 transfers minima to SuccessiveMinima; §1.2 now compares squared minima. There is no §1.5.

   **Exact repair text:** “Consume SuccessiveMinima Layer 1 for real successive minima and attainment, IntegralLattices milestone 2F for the positive-definite trace-lattice Minkowski product bound, and HeightsAndUnits §2.1 for an integral basis bounded in terms of the minima. GeometryOfNumbersAndQuadraticArithmetic §§0.1–0.3, 1.2 and 2.7–2.9 supply covolumes, the squared/real minimum comparison and hermitian-lattice interfaces.” Replace the stale §§1.2, 1.5 references in the contract, §13.2 Needs and Layer 13 Dependencies. Retarget the section field of the two existing quantitative gaps to the actual hermitian/reduction owner section §2.7; keep their quantitative obligations unchanged. Use these roadmap targets, not an assertion that their newer native APIs exist at this pin: the pin lacks the MinkowskiSecond and GaugeBasis modules named by SuccessiveMinima. IntegralLattices 2F at `TauCetiRoadmap/IntegralLattices/README.md:801` explicitly supplies the product inequality for β(x,x)=Tr_E/ℚ(x̄x).

   **Repair test:** On the rank-two lattice with orthogonal basis lengths 1 and 2, the real minima are (1,2), while the current §1.2 supplies squared values (1,4). HeightsAndUnits §2.1 supplies an integral basis with lengths at most (1,2), the input actually needed in §13.2. For I⊂O_E this trace form is positive definite and integral, with determinant D_E[O_E:I]²; the squared-minimum product bound therefore gives the required polynomial dependence. No new mathematical target is duplicated.

2. **F02** (P2) Nearby-height labels are not attached to their endpoints

   **Location:** `packages/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:788`: “their symmetric difference is {τ₁,τ₂}, with τ₂=cτ₁”.

   **Claim:** These conditions define h_near by h(Φ₁,τ₁) and h(Φ₂,τ₂). Section 5.1 defines h(Φ,τ) only for τ∈Φ.

   **Witness:** E=ℚ(i), Φ₁={i↦i}, Φ₂={i↦−i}, τ₁=(i↦−i), τ₂=(i↦i) satisfies the displayed conditions, but both component-height arguments are outside their stated domains. Y lines 674–677 attach τ_i to Φ_i.

   **Exact repair text:** “Two types Φ₁,Φ₂ are nearby if each difference Φ_i\Φ_(3−i) is a singleton. Let τ_i be its unique member, so τ_i∈Φ_i and τ₂=cτ₁. Define the unordered-edge height by (h(Φ₁,τ₁)+h(Φ₂,τ₂))/2.” Add the swapped Gaussian labels as a negative-control Check.

   **Repair test:** In the Gaussian example the new definition forces τ₁=(i↦i), τ₂=(i↦−i); the two height terms are defined. Swapping the endpoints also swaps the labels and leaves (a+b)/2=(b+a)/2.

3. **F03** (P3) The graph definition has fewer than three discriminating Checks

   **Location:** `packages/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:849`: “rejected unless it equals the required graph”; :850 repeats the prescribed projection images without specifying a lattice or evaluating either image.

   **Claim:** These are two of the three Checks of the different-graph definition.

   **Witness:** “Rejected unless it equals the required graph” accepts exactly the definition by assumption. The following projection statement repeats its API. Only the unit-ideal Check computes a particular datum; neither tests which graph is specified.

   **Exact repair text:** Keep the unit-ideal Check and replace the other two bullets with: “For E=ℚ(√−3), the different has norm 3. Over a field splitting the torsion, identify both different-torsion groups with C₃. The identity graph has three elements; their product has nine and is not a graph.” And: “With those identifications, the graphs of 1 and −1 have the same projection images C₃ but differ: (1,1) belongs only to the first and (1,2) only to the second. Projection images alone do not determine the specified graph.”

   **Repair test:** The two subsets are {(0,0),(1,1),(2,2)} and {(0,0),(1,2),(2,1)}. Each projects bijectively to C₃; they intersect only in (0,0). The replacement distinguishes the graph from both the full product and a different graph.

Three new findings remain: one P1 supplier defect, one P2 definition defect and one P3 Check defect. All eight round-one findings are repaired.

## Verification of round-one findings

All locations below are in `packages/ComplexMultiplicationAndExplicitReciprocityPartII/README.md`, unless another file is named. No finding in the repair report was marked not actionable.

| Earlier finding | Current passage (short quotation) | Status and computed witness |
| --- | --- | --- |
| r1a F01, uniformizer order | :300, “Its square maps to 0 in the valuation quotient”; :362 and :1269 make the same distinction. | Repaired. With π=√3(1+√3), π²=12+6√3 is outside ℚ₃, whereas π²/3=4+2√3 is a unit. Valuation classes are 1 and 0 modulo 2. |
| r1a F02, quadratic period locator | :746, “the quadratic period identity and height conversion in §0.6, pp. 632–633”; :748 excludes the log-2 ambiguity. | Repaired. C lines 339–370 provide the quadratic formula; Theorem 0.3(ii) at C line 297 fixes the conversion. The existing manifest key includes §0.6. For ℚ(i), substituting ℓ(0)=−log4+2log RΓ gives −log RΓ−logπ/2. |
| r1a F03, auxiliary inert primes | :74, “unramified inert primes have Dirichlet density 1/2”; :906, :914 and :964 cite Chebotarev Layer 9. | Repaired. Chebotarev Layer 9 at `TauCetiRoadmap/Chebotarev/README.md:370` supplies the quadratic density 1/2. X²+1 has no root modulo 3 or 7; g=1 with two such primes gives odd ramification cardinality 3. |
| r1a F04, hermitian bound | :138, “setting D=max(2,\|disc R\|,N,det Gram_L(q))”; :1208 supplies N and the determinant identity. | Repaired as a precise separate contract. The application carries N and the Gram determinant, and PT lines 362–385 supply the independent-vector argument. For h=m x̄y on ℤ[i], det Gram(Tr h)=4m²; v=1 has entry m and index 1. The new slug occurs in the plan. |
| r1a F05, repeated height Check | :934, “numerator 12 log 2 and denominator 6, again 2 log 2”. | Repaired. 6log2/3=12log2/6=2log2, whereas 6log2/6=log2. The text explicitly labels this a normalization calculation. |
| r1b F01, Artin conversion | :21, “convert every supplied geometric reciprocity formula by s↦s⁻¹”; also :104 and :309. | Repaired. ShimuraVarieties §4.1 is geometric; LubinTateFormalModulesAndQuasiCanonicalLifts §2.1 is arithmetic. In (ℤ/5ℤ)×, 2⁻¹=3; geometric action 2 becomes arithmetic action 3 after inversion. |
| r1b F02, omitted contract sections | :104 includes “6.1–6.2”; :156 includes “Layers 4–7”. | Repaired. ShimuraVarieties §§6.1–6.2 state the canonical-model input; MetaplecticAutomorphicForms Layers 4–7 state the cover, Weil representation, theta and Whittaker inputs consumed in :649, :669, :687 and :706. |
| r1b F03, missing section number | :976, “### 8.2 Height of the quaternionic CM point”; :1004 and :1012 use §8.2. | Repaired. Layer 8 now has consecutive 8.1, 8.2; negating ℓ+½log(d_rel/d_B) gives −ℓ+½log(d_B/d_rel). |

## Verified sound

Read all 1,305 README lines, all 86 Lean lines, both earlier reviews and the repair report. The inventory has 68 numbered mathematical targets, 2 Lean declarations, 0 Lean definitions or instances, 9 source keys, 9 declared supplier gaps and 75 explicit Check bullets. Of those bullets, 73 have a usable mathematical instance; the two failures are S03. The sampled rows below retain computations across all layers, including Checks and additional negative controls. A specialization of a deep theorem tests its statement and normalization; it is not a proof of that theorem.

The eight earlier findings are repaired at this head. Their changed passages and witnesses are recorded above. S01 concerns current supplier drift, S02 the endpoint labels, and S03 the Check requirement; none reverses the substantive round-one repairs.

### Context and excluded degeneracies

The global convention requires characteristic zero, separability, full lattices and positive CM degree. A zero ring is not a field, the zero module is not a full CM lattice, an inseparable positive-characteristic extension is not a number field, and g=0 fails g≥1. Thus these inputs cannot instantiate the CM-field targets. Empty products are not silently CM fields; the separate empty-height convention gives 0. Local targets retain complete DVRs, perfect residue fields and finite separable fraction algebras; equal-characteristic p DVRs fail the stated characteristic-zero hypothesis. Residue characteristics 2 and 3 remain admitted. Partition subsets and orthogonal complements can be empty or rank zero, and are tested below. No formula uses q=1 as a residue-field cardinality. There are no natural-subtraction, polynomial-zero-degree or out-of-range-index expressions in the two Lean signatures.

### Sampled adversarial computations

Locations refer to `packages/ComplexMultiplicationAndExplicitReciprocityPartII/README.md`. These 17 rows retain the computed witnesses across all layers, including S01–S03. “Retain” means no defect was witnessed by the computation; outstanding supplier contracts remain conditional.

| Target and location | Instances and values on both sides; excluded wrong model | Result / change |
| --- | --- | --- |
| 0.1, :172 | Quadratic overlap (1,0)=(1+χ)/2; product overlap (2,0). On C₂×S₃ the three transposition overlaps are (6,2,2), conjugate averages 10/3 and 8/3, sum 6. Nontrivial even sign character gives complementary sums 2 and −2. Constant 1 gives sum 2 but value 1 at c versus 0 for H_CM. C₆ example has complementary sums 0 and inverse values 1,−1. | Retain; nonabelian averaging and strict domain distinction survive. |
| 1.2, :281 | Ramified ℚ₃(√3): v_E(F×)=2ℤ, so the valuation quotient is ℤ/2. For π=√3(1+√3), π²=12+6√3∉ℚ₃ and π²/3 is a unit. At unramified quadratic 2, v(1)=0, v(2)=1. | Retain; prior order-two error repaired. |
| 2.8, :454 | Gaussian split 5: slopes (0,1), not supersingular; inert 3: (1/2,1/2), supersingular. On the standard local norm line, Frobenius-fixed span is full in the nonsplit case, not in the split case. Zero realization would vacuously pass, and is excluded by nonzero faithfulness. | Retain both directions at the specified distinguished prime. |
| 3.3, :523 | Odd ramified quadratic: half discriminant valuation 2/2=1, within-part sums 0, length 1. Dyadic ℚ₂(√2): half discriminant valuation 6/2=3, length v(2√2)=3. Extension of C of ramification e multiplies both lengths by e. | Retain positive resultant sign and relative discriminant. |
| 4.6, :744 | Gaussian RΓ=2.958675119…, ℓ(0)=0.7831887854; −ℓ/2−log4/4−log(2π)/2=−1.6571065162=−log RΓ−logπ/2. | Retain exact quadratic locator and normalization. |
| 5.3, :786 | Cubes g=1,2,3 have (vertices,edges)=(2,1),(4,4),(8,12); opposite square vertices differ in four embeddings. Swapped Gaussian τ-labels satisfy the stated symmetric-difference test but miss the component-height domains. | S02. |
| 6.1, :830 | Unit ideal: torsion and graph order 1 (zero groups). For norm-three different, identity graph has size 3 versus product size 9; graphs of ±1 are distinct and share projection images. | Definition retained; S03 replaces two ineffective Checks. |
| 6.4, :874 | Endpoint heights a,b give product τ-height a+b; self-dual cancellation is l−l=0, so h_near=(a+b)/2=h(A,τ)/2. At a ramified opposite-eigenvalue quotient, discarded raw torsion would have lengths 1 (odd quadratic) or 3 (dyadic), not 0. | Retain relative-determinant gap; use repaired labels. |
| 7.2, :916 | 6log2/3=12log2/6=2log2; fixed numerator over denominator 6 instead gives log2. Base F of degree 2 doubles the absolute denominator. At z=i and 1+i, 2Im z=2. | Retain relative normalization and repaired Check. |
| 8.2, :976 | Negating the previous RHS gives h_L=−ℓ+½log(21/4). Thus i₀/e+h_L=0. Replacing the relative height denominator by its absolute version over degree-2 F would divide h_L by 2 and break the identity. | Retain adjunction sign and restored numbering. |
| 9.1, :996 | d_relD_F=D_E/D_F. Gaussian unscaled mean −1.6571065162 becomes YZ mean −0.7381679830 after adding ½log(2π). Both routes give −ℓ/2−log4/4 in YZ convention. | Retain all-types average; individual conjecture unused. |
| 10.2, :1026 | Gaussian ideal (1+i) gives degree 2=Norm(1+i), [2] gives 4, id gives 1. With class number 1, B=A meets lower sides 1 and 0.964678630. ε=1/4 gives power D⁰=1; ε>1/4 gives ≤1. | Retain fixed-A and all-isogenies quantifiers; no padding. |
| 11.1, :1062 | g=1 bounds are 162 and 26244. u=(1+√2)^8=577+408√2≡1 mod3 but uū=u²≠1, excluding unpolarized rigidity. f=[2],g₀=id gives g₀f=[2]. | Retain polarized descent and quotient polarization. |
| 12.3, :1142 | Maximal Gaussian elliptic case J=I=1,P=4 gives 1≤4^d. Nonmaximal conductor 2 has J=2, so setting J=I without proof would be invalid. At p=2, exp(2) does not converge: v₂(2ⁿ/n!)=s₂(n)=1 for n=2^k; exp(4) terms tend to 0. | Retain deep dyadic filtration and discriminant factor. |
| 13.2, :1192 | ℤ[i] covolume 1=½√4. R=I=ℤ+2ℤi: J=O_E, e_R=2, 2J⊂I⊂J, [J:I]=2≤2²=4; basis (1,2i) has lengths 1,2. | S01 supplier repair; mathematical bound survives. |
| 13.3, :1202 | h=m x̄y on ℤ[i]: Gram diag(2m,2m), det4m², index1. L=2ℤ[i]: Gram diag(8,8),det64; v=2 has h=4,index1. In ℤ[i], v=2 gives index4. ψ=Im(x̄y),ζ=i gives q=Re(x̄y),det1; −i makes it negative. M+i maps to i by translation of size M; i/M maps to iM by a matrix of size1. | Retain repaired quantitative contract and determinant budget. |
| 13.5, :1229 | Coarse degree≤N gives D≤CN^b and lift height≤C′(CN^b)^a. For fixed coordinate degree d and g² complex coordinates, each scalar Northcott set is finite and its g²-fold product finite. Repeating one CM point N times still has only one distinct image. | Retain finiteness of distinct points, not parameter multiplicities. |

### Every Lean declaration and its elaborated context

The supplied elaborated signatures were compared with the entire source file and README §§10.1–10.2. I did not run Lean: the read-only review prohibition takes precedence over the generic instruction to re-elaborate. No declaration was changed, and neither supplied type loses a binder.

| Declaration in `packages/ComplexMultiplicationAndExplicitReciprocityPartII/Suggested.lean` | Section, variables, instances and quantifier order | Computed test / comparison |
| --- | --- | --- |
| `relative_class_number_growth`, :49 | Namespace `TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocityPartII`; universe u; Layer 10. Explicit g:ℕ, 0<g, ε:ℝ, 0<ε. ∃C>0 precedes E:Type u and `[Field E] [NumberField E] [NumberField.IsCMField E]`; finrank ℚ E=2g. Quotient and exponent are real, not natural division. | Gaussian/Eisenstein tests give 1≤1 and 0.964678630≤1. The denominator is a positive class number. ε=1/4 gives exponent 0. g=0 cannot enter. Real regulator ratio is imported, not replaced by 1. Matches README. |
| `distant_cm_isogenies`, :71 | Same field/universe context. ∃c>0 precedes E,A,ι. A is an actual `AbelianVariety ℂ`; A.dim=(g:WithBot ℕ∞); ι:O_E≃+*End(A). ∃B,κ and an intertwining actual isogeny; then ∀actual isogenies A→B, degree bound. Rank is evaluated at B.zeroPoint, a point of the target. | id has rank1, [2] rank4, (1+i) rank2. End(A₀²)=M₂(O_E), so its nontrivial idempotents exclude a field-order isomorphism. A threefold with quadratic multiplication is excluded by dimA=g. All isogenies differ from one intertwiner by an element of commutative End⁰(A)=E. Matches README. |

The pin defines `NumberField.IsCMField` without finite-dimensionality; the explicit `NumberField E` is retained in both signatures. `Scheme.Hom.finrank` is a pointwise rank for general morphisms, not an isogeny degree by definition. Here `IsIsogeny` is finite and surjective, and the characteristic-zero abelian varieties are smooth; the finite-flat comparison is part of the cited abelian-variety supplier. No arbitrary-map degree is asserted.

The headline inventory is: CM height linearity (§0.2); integral CM families, representations and tensor realizations (§§1–2); total-reflex determinant and height (§3.8); big-CM intersections and elimination (§§4.2b–4.5); the quadratic average (§4.6); component decomposition and corrected different-graph comparison (§§5–6); quaternionic bridge and height (§§7–8); averaged Colmez (§9.1); relative class growth, distant isogenies and individual height growth (§§10.1–10.3); primitive and arbitrary-center CM orbits (§§11.3,12.5); polynomial lift height and bounded-moduli-degree finiteness (§§13.4–13.5).

Both presently statable native-carrier headlines are included. The module docstring names the others and the missing geometric/height carriers. Searches of both pins found no CM-type/CM-height, total-reflex family, GSpin special-divisor or Siegel CM-moduli implementation supplying those missing statements. Existing class numbers, CM fields and abstract abelian varieties do not supply these additional structures. Neither retained theorem is a one-lemma consequence, a boundary-case assertion or a disguised numerical implication. There are no substitute predicates, admitted data, examples, `set_option`, `lemma`, extra Mathlib imports or roadmap imports. Both Lean names occur in the README.

### Pinned declaration audit

Mathlib pin: `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Tau Ceti pin: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These are the manifest pins, not the newest upstream APIs.

| Native location | Verified content and boundary |
| --- | --- |
| `Mathlib/NumberTheory/NumberField/CMField.lean:69`, :141, :163 | CM field class, extra integrality needed for conjugation, involution. Characteristic zero and NumberField assumptions in the kept signatures supply the prerequisites. |
| Same file :372, :438 | Unit index 1 or 2, regulator ratio 2^rank/Q. For degree six the resulting values are 4 and 2. |
| `Mathlib/NumberTheory/NumberField/ClassNumber.lean:64`, :69, :77 | Maximal-order class number, positivity, nonzero ideal representative and norm bound. No near-linear ideal-count theorem is inferred from them. |
| `Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean:88`, :201, :231 | Rank at a target point; finite-flat surjectivity criterion; local constancy with finite-presentation hypothesis. No flatness of arbitrary isogenies is claimed to be proved in this file. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`, :118, :171 | Proper geometrically integral group scheme, Krull dimension, identity point. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean:83`, :92; `Hom/Basic.lean:133`; `Isogeny.lean:61` | Actual endomorphism carrier and categorical-to-scheme morphism; finite-and-surjective isogeny predicate. |
| `TauCeti/NumberTheory/EffectiveBounds/IdealCount/Basic.lean:399`; `Discriminant/Basic.lean:61` | Coarse X² ideal count, and field discriminant bounded by an integral basis trace discriminant. Neither supplies the stronger near-linear count or the finite-product order identity. |

### Declared supplier-gap audit

All nine slugs occur in both `packages/ComplexMultiplicationAndExplicitReciprocityPartII/design/plan.json` and the corresponding README supplier subsection. Every supplier is named; none is `none`. The obligations have concrete hypotheses and outputs. Searches found no already supplied theorem with their full stated generality. Their absence from current supplier implementations is not a finding. S01 concerns an additional claimed existing lattice input and stale section references, not the existence of these contracts.

| Slug | Boundary tested and missing part identified |
| --- | --- |
| `ramified-component-determinants` | Raw opposite-eigenvalue quotient has length1 at ℚ₃(√3), length3 at ℚ₂(√2); torsion-free quotient0. Current §4.7 requires local freeness. The gap expressly asks for relative/image cancellation and metric identification. |
| `quantitative-cm-torus-orbit` | Unit compact index I=1 still leaves a reciprocity-image factor; B^(#S) is retained, e.g. B=1/2,#S=2 gives 1/4. Current reciprocity alone gives no uniform quantitative lower bound. |
| `narrow-cm-norm-different` | Finite-ramified norm image has index1; finite-unramified image index2 and different signs −1 at g=2,+1 at g=4. Hilbert/narrow class fields alone do not state the required different-character evaluation. |
| `etale-order-discriminant` | For R={(a,b)∈ℤ²:a≡b mod2}, index2 in ℤ², trace Gram on (1,1),(0,2) has determinant4=2²·1. R does not split as a product. The field-order target alone does not cover it. |
| `quantitative-siegel-hermitian-reduction` | Z=M+i requires translation entry M; Z=i/M uses inversion of size1 with h₀=M. Exact positive constants and dimension dependence are specified. |
| `quantitative-hermitian-lattice-balancing` | h_m on ℤ[i] gives determinant4m² and vector norm m; L=2ℤ[i] gives determinant64. The contract carries both scale and generated-lattice index. It is distinct from mere reduction existence. |
| `ramified-quaternionic-bridge` | Supplier §§R18.2.17–18 explicitly assume unramified F_v/ℚ_p; §R18.2.14's ramified Kodaira–Spencer line does not remove that assumption. The contract keeps finite-local descent and the different twist. |
| `embedded-quaternion-orders` | The division/unramified case gives zero different kernel; the split/dyadic case can have order8. Embedded integral orders, including residue field 𝔽₂, are required, not just compact subgroups. |
| `absolute-hodge-padic-comparison` | Tensor unit comparison1↦1 is insufficient to identify arbitrary absolute-Hodge de Rham and p-adic realizations. AutomorphicBundles §B2.7 explicitly stops before B_dR/B_cris; the gap states both comparison settings and base-change compatibility. |

### Supplier and ownership resolution

The 23 cross-roadmap supplier subsections were re-resolved against main or the current new-roadmap head, with the two design-only suppliers read in their board design folders. The exact contracts, their stated hypotheses and the relevant conventions were compared. This includes the repaired section ranges and reveals S01.

Ownership searches used `roadmaps list`, `roadmaps grep` and `roadmaps show`, then direct object searches across main, Completed, board packages and all 55 supplied sibling folders. Searches included total reflex families, different-torsion graphs, CM/component heights, order discriminants, Hermitian lattices, Borcherds divisors, orbit bounds and period lifts. No conflicting fully qualified name for either Lean theorem was found. AbelianSchemesAndArithmeticModuliPartII F5.7/F6.6 concerns Hermitian mass/counting with varying rank over fixed class-number-one fields; it does not supply this package's fixed-dimension, varying-order balancing bound. Gross–Zagier's CM lifts are local deformation/intersection objects; the present period-coordinate lifts are different objects. The generic heights, duality, moduli and reciprocity constructions remain assigned to their named owners; the retained total-reflex arithmetic comparison, orthogonal CM intersections and quantitative CM consequences are this Part II's extensions. No later-roadmap target was moved into this package during this read-only review.

`roadmaps resolve` found no unresolved roadmap/declaration names, but that check does not validate section contents; S01 demonstrates the distinction. The tool's library-host warning was addressed by reading the supplied pins directly.

Dependency output, unchanged README:

```text
moved: ComplexMultiplicationAndExplicitReciprocityPartII moved in the merge order from #229 to #230, right after its last supplier AutomorphicBundles; checked as moved (the worker moves it there when it submits)
depcheck: 56 roadmaps, 661 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The move is permitted by the brief and is not a finding. Internal Needs run from the earlier CM constructions to the two average proofs and then to quantitative consequences; the individual Colmez predicate supplies no theorem.

### Source locator verification

All nine manifest works are legally cached and marked certified. The 68 target locator groups resolve to the stated numbered results or explicitly identified proof passages. The package distinguishes author/preprint pagination from published pagination. Source errors are listed separately below; none licenses copying the faulty source assertion into a target.

The package change set contains nine files, all inside `packages/ComplexMultiplicationAndExplicitReciprocityPartII/`. The plan diff changes only its top-level `gaps` value. The README and Lean file contain no pull-request numbers, review instructions, computational algorithms or prohibited Lean options. Source-correction prose describes mathematical conventions, not the review process. No suspicious instruction embedded in consulted material was acted on.

## Not verifiable

- No Lean command or build was run. The two supplied elaborations were inspected, including all explicit instances and quantifier order; this report does not claim an independent build.
- The nine supplier gaps remain contracts, not implemented or independently proved results. Acceptance of the mathematical development remains conditional on them. In particular, the ramified determinant and quaternionic bridge comparisons require more than generic-fiber algebra.
- The 11-page author YE revision and the specified PT/T12 preprints were checked. Their journal versions were not independently collated; the manifest explicitly cites the versions read. C is an OCR extraction; its theorem/section and page locators were checked, but typography lost by OCR is not certified from the extraction alone.
- The long foundational proofs cited inside A, Y and C were not re-proved. This review verifies the located statements, the proof-route contracts and the displayed boundary computations, not completed formalizations of those sources.
- No unavailable legal text was required beyond the nine supplied manifest works. No new source request is outstanding. Ownership searches covered the 55 supplied sibling folders and the tool's available main/open-roadmap index; no claim is made about unprovided work outside that index.

## Source issues

- **Error** in A at §3.1, printed p.415 (A line 1015): the source says diagonal scalars embed in the quotient torus; it should be the norm-identified kernel torus, while the diagonal map has kernel μ_d; affects a stated result.
- **Error** in A at §3.2, printed pp.416–417 (A line 1079): the source says its integral-unit level is maximal compact; it should be the compact subgroup over the unit image, which can have index two in a ramified norm-one factor; affects a stated result.
- **Error** in A at (3.2.2), printed p.417 (A line 1094): the source says the cohomology obstruction is a sum of separate local norm quotients; it should be the quotient by the norm from the product F⊗ℚ_p; affects the proof.
- **Misprint** in A at Proposition3.5.2, printed p.422 (A line 1311): the source says an undefined Λ-lattice gives the crystalline representation; it should be the specified N_p lattice and its fiber; affects nothing.
- **Misprint** in A at Proposition3.6.1, printed p.430 (A line 1606): the source says a place of F is nonsplit in F; it should be nonsplit in E/F; affects nothing.
- **Misprint** in A at the paragraph after (8.3.1), printed p.508 (A line 4987): the source says odd error support uses p² not dividing the original lattice discriminant; it should be possible square divisibility in the enlarged lattice discriminant, consistently with Theorem4.8.1; affects the proof.
- **Error** in A at Theorem9.1.5, printed p.510 (A line 5073): the source says total heights determine a unique linear functional on all CM⁰; it should be uniqueness on the overlap span, or additional component-period values determining the full functional; affects a stated result.
- **Error** in A at the metric preceding (9.4.1), printed p.514 (A line 5218): the source says minus the standard positive-plane bilinear value is a squared norm; it should be the positive absolute bilinear value, giving 4 rather than −4 on z=(1,i); affects the proof.
- **Error** in A at Lemma9.4.3, printed p.516 (A line 5317): the source says an arbitrary integral top-cohomology generator has a fixed inverse-power period; it should be trace-one period magnitude (2π)^r, with an archimedean unit factor for other generators; affects the proof.
- **Error** in A at Lemma9.4.4, printed pp.517–518 (A line 5358): the source says within-part differences minus half the discriminant give the partition length; it should be half the discriminant minus within-part sums, giving positive quadratic length; affects the proof.
- **Error** in A at (9.4.6), printed p.517 (A line 5378): the source says the evaluated kernel-image cokernel has only the indicated within-part valuation sum; it should be computed with the cross-part resultant contribution, already nonzero for a ramified quadratic singleton; affects the proof.
- **Error** in A at the conductor functional, printed p.518 (A line 5411): the source says finite-image characters form an algebraic basis of all continuous class functions; it should be locally constant class functions, with no automatic bounded measure on all continuous functions; affects a stated result.
- **Error** in A at Proposition9.4.5, printed p.519 (A line 5446): the source says the conductor sum has negative prefactor −e_P/2; it should be +e_P/2, yielding length1 for ℚ₃(√3); affects the proof.
- **Error** in A at (9.4.13), printed p.522 (A line 5613): the source says the reflex partition length is a negative conductor value; it should be the positive conductor expression consistent with its ensuing positive different valuation; affects the proof.
- **Misprint** in A at (9.5.1), printed p.523 (A line 5652): the source says unnormalized degrees differ by the scalar log D_F; it should be degrees divided by the matching weighted complex degree; affects the proof.
- **Error** in A at (9.5.3), printed p.523 (A line 5670): the source says the whole auxiliary lattice equals ξ times the inverse-different standard lattice; it should be a justified comparison of filtered Hodge-line indices, retaining actual lattices and their different factors; affects the proof.
- **Misprint** in A at Proposition9.5.2's proof, printed p.524 (A line 5696): the source says to trace the F-valued norm expression from E; it should be traced from F, avoiding an extra factor two; affects the proof.
- **Error** in Y at Theorem2.2's proof, printed p.546 (Y line 551): the source says a single local Galois element conjugates E under every p-adic embedding; it should be a reindexing of paired embeddings in the full sum, including split places; affects the proof.
- **Error** in Y at Theorem2.3's proof, printed p.547 (Y line 610): the source says O_E⊗ℤ_p always has one integral algebra generator; it should be treated factorwise after unramified decomposition, since 𝔽₂⁴ has no generator over 𝔽₂; affects the proof.
- **Error** in Y at Theorem2.7, printed pp.549–551 (compared with YE line 34): the source says an arbitrary O_E-isogenous variety has the stated nearby-component height identity; it should be the different-torsion graph case, with its integral determinant comparison; affects a stated result.
- **Gap** in Y at Proposition5.4's preceding quotient sequences, printed p.575 (Y line 1751): the source says taking embedding quotients preserves the required locally free exact sequences; it should be justified on relative/image lattices at ramified coefficient primes; affects the proof.
- **Error** in Y at the deformation-Hom identification, printed p.575 (Y line 1763): the source says the O_E-linear tangent Hom equals the O_B-linear tangent Hom; it should be the constrained quaternionic deformation Hom, of rank one rather than the unconstrained rank two; affects the proof.
- **Misprint** in Y at the paragraph after Lemma9.4, printed p.633 (Y line 4666): the source says the level projection is étale despite horizontal multiplicity e; it should be a ramification-aware section and multiplicity argument, with e allowed greater than one; affects the proof.
- **Misprint** in YE at Proposition4, author pp.6–7 (YE line 244): the source says semilinear Frobenius keeps the displayed coefficient-embedding label; it should be the Frobenius-permuted source embedding, or an explicitly relabeled linearization; affects the proof.
- **Error** in YE at Proposition4's contraction step, author p.7 (YE line 253): the source says n≥e_v guarantees the displayed divisibility; it should be strengthened at least to n≥max(2,e_v), excluding the ramified-quadratic e_v=1 first-power failure; affects the proof.
- **Gap** in YE at Proposition6, author pp.9–10 (YE line 365): the source says raw embedding quotients preserve an exact locally free determinant sequence; it should be a relative/image determinant proof retaining ramified torsion, such as length3 for O/(2√2); affects the proof.
- **Misprint** in YE at the graph-extension Hom display, author p.11 (YE line 402): the source says the second torsion factor is π-torsion; it should be δ_π-torsion, as in the specified graph on both sides; affects the proof.
- **Misprint** in T at §2.2, printed p.382 (T line 133): the source says the CM and maximal-real regulators are equal; it should be R_E/R_F=2^(g−1)/Q_E with Q_E=1 or2; affects nothing.
- **Error** in T at Corollary3.3's proof, printed p.384 (T line 213): the source says the uniform lower Faltings-height constant is positive; it should be a real lower constant, allowing negative CM elliptic heights; affects a stated result.
- **Gap** in T at Corollary3.3's proof, printed p.384 (T line 231): the source says Cauchy estimates apply to a general Artin function on a fixed small circle; it should be justified through regularized Hecke factors or the quadratic Hecke average, without assuming Artin holomorphy; affects the proof.
- **Gap** in T at Lemma4.1, printed p.384 (T line 245): the source says a full level-three basis rigidifies an unpolarized CM variety; it should be polarized rigidification, since nontrivial units congruent to1 modulo3 remain unpolarized automorphisms; affects the proof.
- **Misprint** in T at §5's stabilizer calculation, printed p.386 (T line 309): the source says an ideal of the reflex field has a norm indexed by the CM field; it should be the reflex-field ideal norm, with positive units in the maximal real subfield; affects the proof.
- **Gap** in T at §5's orbit comparison, printed p.386 (T line 311): the source says absolute unmarked moduli degree equals relative marked class-group orbit size; it should be bounded-factor comparisons retaining reflex degree, markings and polarization; affects the proof.
- **Gap** in T at §6.2, printed p.387 (T line 327): the source says the CM-coordinate counting setup uses degree2g; it should be justified by a uniform splitting-field degree bound and the real/imaginary coordinate extension; affects the proof.
- **Misprint** in T12 at §7.1, preprint p.15 (T12 line 638): the source says the primitive-type stabilizer in Gal(L/ℚ) is Gal(K/ℚ); it should be Gal(L/K), using the lifted type in the normal closure; affects nothing.
- **Error** in T12 at §7.2, preprint p.18 (T12 line 731): the source says the order discriminant is compact-index squared times field discriminants; it should be order-index squared, with a separate compact-index inequality; affects a stated result.
- **Error** in T12 at the exponential identity before Lemma7.4, preprint p.19 (T12 line 776): the source says exp(pα) is available for integral α at every p; it should be restricted to its convergence domain, using a sufficiently deep dyadic power; affects the proof.
- **Error** in T12 at Lemma7.4's discriminant calculation, preprint p.19 (T12 line 781): the source says the difference-product valuation directly gives the suborder index; it should be half the difference between suborder and maximal-order discriminant valuations, with normalized valuations; affects the proof.
- **Misprint** in PT at Lemma3.2's proof, preprint p.4 (PT line 137): the source says the final index bound uses the unscaled ideal J; it should be a bound retaining the scaled ideal νJ; affects the proof.
- **Misprint** in PT at Lemma3.3, preprint p.4 (PT line 146): the source says the complex covolume equals discriminant times lattice index; it should be 2^(−g)√D_E times the index in ordinary Lebesgue measure; affects the proof.
- **Misprint** in PT at Lemma3.4's proof, preprint p.7 (PT line 268): the source says the general-genus reduction matrix belongs to Sp₄; it should be Sp₂g; affects nothing.
- **Misprint** in PT at the isotypic decomposition, preprint p.8 (PT line 296): the source says the matrix-algebra size is the simple factor's dimension; it should be the isotypic multiplicity n_i; affects the proof.
- **Gap** in PT at Lemma3.6, preprint p.8 (PT line 327): the source says the decomposition-isogeny bound depends only on the maximal-algebra discriminant; it should be a bound retaining the order index e_R and hence disc R; affects the proof.
- **Gap** in PT14 at Lemma7.4, printed p.675 (PT14 line 756): the source says the CM scalar coordinates have degree at most2g without establishing it; it should be a proved splitting-field bound, adjoining i for real/imaginary coordinates; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "d5a1b2ff2ae4b2d06cc44015244e7a0948478ee2", "job": "RT-ComplexMultiplicationAndExplicitReciprocityPartII~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
