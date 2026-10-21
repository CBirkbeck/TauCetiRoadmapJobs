# Package report: SelmerIwasawaCohomologyPartII

The package contains `packages/SelmerIwasawaCohomologyPartII/README.md`, `Suggested.lean`, `metadata.toml` and the updated `sources.toml`. The README preserves all 40 accepted targets, all 46 catalogue API statements, all 68 catalogue Checks, the eight layer examples and the convention controls. It adds an explicit finite-period interface and five controls covered by two Lean examples. All 20 supplier gaps remain explicit prerequisites, with their exact needs sentences under their owners.

The mathematical specification is complete on those supplier contracts. Lean elaboration is **not available** under the supplied brief; the file was **not compiled**. This is not a successful-build claim.

## Corrections and expansions

1. Applied the accepted nonblocking locator note: Construction 4.6.1(3) is on page 54, at ltxzz line 2509, not page 53. The package README and source manifest use page 54. The immutable target locator in `design/plan.json` was not changed: the brief permits edits only to that file's top-level gaps list.
2. Wrote all six incidence maps, both ∇₀ and ∇₁ formulas, the complete N=2 matrix, and all four terms of the resolved product map ∇. The zero link maps at N=2 prevent a negative hyperplane-class exponent. These expand the accepted constructions rather than introduce different maps (ltxzz line 3785; ltxzz line 3833; ltxzz line 4172; ltxzz line 4213; ltxzz line 5093).
3. Made the graph input to §2.6 explicit: it is the graph of the native addition-of-line map supplied by ShimuraVarieties, before the diagonal datum is bundled in Layer 4. Added `2.6` to the existing unitary-special-compatibility gap's neededBy list, and added the corresponding README dependency. This is the only change to `design/plan.json`; every other top-level value is identical. No gap slug, needs sentence or supplier changed.
4. Clarified that the degree-one p=3 place is a place of F⁺; its extension to F has residue cardinality 9. This avoids reading “degree-one place of F” as a contradictory residue-degree assertion.
5. Made the Haar normalization apply to a hyperspecial reference subgroup. At other levels the measure remains fixed and the idempotent is 1_K/vol(K), as in EndoscopicTransferAndUnitaryTraceComparison §13.7. Simultaneously assigning volume 1 to unequal nested levels would contradict the covering-degree normalization.
6. Made the factor exchange explicit when n is odd: the n,n+1 order and the even-first n₀,n₁ order are identified by symmetry. The period has two actual legs, so it evaluates f(sh(s),s) in even-first order when n is odd.
7. Expressed APIs and Checks whose native carriers are absent in mathematical prose. Every backticked declaration name in the README is actually declared in `Suggested.lean`; no catalogue of undefined Lean names or admitted data was introduced.
8. Reconciled the Layer 7 catalogue example with the accepted expanded design: diagonal evaluations exist on the scaled-inverse submodule. The primitive first-kernel vector supplies the second detection direction. A basis at positive loss is never asserted.

The requested format repairs affect only `packages/SelmerIwasawaCohomologyPartII/README.md`, `packages/SelmerIwasawaCohomologyPartII/Suggested.lean`, the first locator in `packages/SelmerIwasawaCohomologyPartII/sources.toml`, and this report. The 13 raw TeX subscript/superscript occurrences are expressed as prose or ordinary mathematical notation, retaining every index, fixed-vector condition and scalar factor. The nine residue hits were mathematical uses of “packet”; the references now use grammatical phrases about packets, retaining the supplier section numbers and the same representation-theoretic requirements. The two affected gap sentences are paraphrased without changing their requirements; `design/plan.json` is unchanged by this repair. Seven declaration-free Lean layer comments are omitted: those layers retain their full README targets, and the populated Layer 5 comment remains. Every Lean command is identical after comment removal. The first source locator is condensed from 1120 to 484 characters as a list of numbered references; all access records and README source-line locators are preserved. No definition, theorem, API statement, Check, worked example, hypothesis or supplier edge was added or deleted.

The accepted restrictions remain: all exceptional sets are finite; ramified coefficient extensions are allowed; the seven admissibility clauses are separate; both H(N) antecedents are retained where used; arbitrary exceptional levels require actual transfer witnesses; all-place purity and every nondetecting-place specialization remain explicit; and the uniform realised CM Frobenius-span premise is not inferred from Chebotarev alone. Rank one has total detection loss 2c.

## What cannot be supported without the named contracts

The package does not assert that any of the 20 supplier extensions is implemented. In particular it requires the native special-level and nonproper specialization theorems; integral equivariant nearby-cycle filtration; native rational concentration; integral arithmetic regulator and torsion crystalline membership; exact H(N) multiplicities; rigid R=T and the required oldform comparisons; actual congruence-image lifting and finite Hecke-support separation. Their full coefficient and geometric domains are written in the README rather than hidden in a private input structure.

The L6/L7-free rank-(2,3) refinement has no proof in the cited remark and is outside the endpoints (ltxzz line 196). A nonzero L-derivative does not supply a nonzero diagonal regulator: that implication is a conjecture in the source (ltxzz line 6748). The root-number implication of ltxzz line 6793 is outside the exported conclusions. Eventual admissibility for the two specified families supplies no uniform CM-span theorem. These are unchanged scope boundaries.

No notion was moved down from a later roadmap. PeriodsAndSpecialValues occurs only as a downstream consumer. The §2.6 graph clarification imports a missing usage of an existing earlier supplier contract, rather than a later roadmap's theory.

## Duplication sweep

Read the main-branch examples `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md`, `TauCetiRoadmap/LocalGaloisGroups/README.md` and `TauCetiRoadmap/ProfiniteCohomology/README.md` for shape, density and ownership. Main was inspected at 5700acda261d21bffc5fa87c1edf713ca8383fe5. The main EtaleCohomologyFoundations §F.4.6 and SchemeAndStackFoundations §2.15 were checked directly, including their continuous-action and profinite-cover domains. Revision branches of those main roadmaps are not dependencies.

Searches covered the mathematical objects, not only the proposed names: continuous cocycles, coefficient exponents, DVR torsion modules, reciprocal polynomials, Satake parameters, hermitian forms, moduli and incidence geometry, arithmetic Abel–Jacobi, local finite conditions, duality, congruence cohomology and Frobenius detection. No accepted native target duplicates a theorem on main or at the pins. Consequently **no one of the 40 accepted targets was deleted** during packaging.

The following are the complete exclusions from local ownership. They are explicitly assigned in Scope and ownership and the exact supplier contracts; their general definitions or theorems are not redeveloped here.

| Mathematical object excluded from this package's development | Exact owner consumed |
| --- | --- |
| Polynomial evaluation, derivative and coefficient reflection | Mathlib: Polynomial.eval and eval_X, `Mathlib/Algebra/Polynomial/Eval/Defs.lean`; Polynomial.derivative and derivative_X, `Mathlib/Algebra/Polynomial/Derivative.lean`; Polynomial.reflect and coeff_reflect, `Mathlib/Algebra/Polynomial/Reverse.lean`. |
| Finite prime-power torsion decomposition and finite torsion-free freeness | Mathlib: Module.torsion_by_prime_power_decomposition, `Mathlib/Algebra/Module/PID.lean`; Module.free_iff_isTorsionFree, `Mathlib/LinearAlgebra/FreeModule/PID.lean`, with PID/domain and finiteness contexts. |
| Continuous cohomology and compatible-pair functoriality | Mathlib: TopRep.homogeneousCochains, continuousCohomology n A, ContinuousCohomology.cochainsMap, map, map_id and map_comp in `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean` and `Functoriality.lean`. |
| Low-degree continuous H¹, coboundary, coefficient exponent and zero cases | Tau Ceti: TauCeti.ContCohomology.d0, H1, H1pi, subsingleton_H1_of_subsingleton, subsingleton_H1_of_subsingleton_coefficients and nsmul_H1_eq_zero in `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean`; ProfiniteCohomology Layers 1–3 and 5–10 supply arithmetic operations on their stated domains. |
| Rees algebra and affine blowup charts | Mathlib: reesAlgebra and mem_reesAlgebra_iff, `Mathlib/RingTheory/ReesAlgebra.lean`; Tau Ceti: TauCeti.AlgebraicGeometry.affineBlowupι, opensRange_affineBlowupι, iSup_opensRange_affineBlowupι and affineBlowupι_toSpecZero, `TauCeti/AlgebraicGeometry/Blowup/AffineCharts.lean`; StableReduction Layer 4 supplies general Cartier lifting. |
| Exponents, reducibility depth, saturation, realised Frobenius span, scaled inverse and primitive kernel | EulerSystemsAndKolyvaginSystems §§1.2–1.3, 1.6, 1.11, 1.15, 4.4. Section 7.2 here is their native unitary-prime realization, including Hecke contractions. |
| Weak semisimplicity, propagated Bloch–Kato conditions, crystalline extensions, global Selmer reductions and uniform bad-place killing | SelmerIwasawaCohomology §§0.12–0.13, 2.6–2.7, 4.8–4.11, 4.24–4.25. |
| Normalized Satake predicates and general unitary Hecke identities | SmoothRepresentationsOfLocalGroups §§SR.4.1, SR.4.4. |
| Minimal, Fontaine–Laffaille, raising and rigidity conditions and enlargement | LocalGaloisDeformationRings §§1.6, 2.3, 2.12, 2.20; GlobalGaloisDeformations §5.2 only in its rank-two scope. |
| CM types, reflexive closure, rank-one CM moduli, invariant cohomology and orbit trace | PELModuli §§M0.25–M0.26, M4.7–M4.9; the published intersection convention is used. |
| Generic PEL and Shimura models, hermitian classification, transfer, Galois realization and residual genericity | PELModuli §§M2.8, M2.12–M2.14, M4.3, M4.5–M4.9; ShimuraVarieties §§5.1, 6.7; AdelicAlgebraicGroups §4.1; EndoscopicTransferAndUnitaryTraceComparison §§9.1, 11.2–11.4, 12.12–12.15, 13.1, 13.5–13.9; AutomorphicGaloisRepresentationsPartII AG2.1b, AG2.2, AG2.5–AG2.7; IgusaVarietiesAndTorsionConcentration §IG.7.2. Stronger domains remain the declared gaps. |
| Generic étale operations, weight sequence, cycle theory and arithmetic duality | EtaleCohomologyFoundations §§0.9–0.11, F.2–F.7; LefschetzPencilsAndVanishingCycles §§7a.7–7a.9; SchemeAndStackFoundations §2.15 and Layer 5; MotivesAndAlgebraicCycles §§7.16–7.18; ArithmeticGaloisDuality §§R02.4.2–R02.4.3, D7.4, D7.7. |
| Hilbert modular supersingular level raising | HilbertModularVarietiesAndShimuraCurves, gap hilbert-precursor on Liu–Tian Assumption 4.1, Definition 4.5 and Theorem 4.7. Section 8.5 keeps the comparison of carriers and conventions. |

The finite period is a specialization of finite summation to the two legs of the native definite correspondence. Its signature does not rebuild finite functions, general pushforward, Chow groups or a Shimura-set stand-in. Its coefficient and fibre laws specify how the actual period is used.

The pinned files above were read after code search, at Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Search results at newer revisions were not accepted as evidence of availability at the pins. Additional near matches were read at the pins: IsDedekindDomain.selmerGroup in `Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean` is the multiplicative valuation Selmer group; weightedAbelJacobiQuotientClass in `TauCeti/AlgebraicGeometry/WeilDivisor/AbelJacobi/Quotient.lean` concerns Pic⁰ divisor classes; HeckeRing.GL2.Newform.satakeParameters in `TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean` uses rank-two classical newform arithmetic normalization. None supplies the native Rankin–Selberg objects here. The searched elliptic Selmer file returned 404 at the Tau Ceti pin and was excluded. A broad unitary search failed; the hermitian object search and the exact supplier/module reads supplied the relevant boundary checks instead.

The five specified new-roadmap heads were inspected for scope and mathematical overlap:

| Roadmap | Head inspected | Distinct ownership |
| --- | --- | --- |
| CohomologyComparisonsPartII | dd8d7e6fda7516b9ab6806d5d75f5202332851c7 | Classical syntomic producers and filtered relative comparison, rather than native unitary level raising. |
| ColemanIntegrationPartII | bd972d91ed7d5d8bd3dd2e7ee84b35853db32ba4 | Natural integration and curve index pairings, rather than the arithmetic étale diagonal regulator. |
| QWittVectors | 4605fbb0a2d9279b561f9467ab5cce09d7f2469e | Big/q-Witt and difference/Koszul algebra, rather than the source-specific incidence weight complex. |
| ErdosProgressionPowers | 72b615703f7fc5d175e519ddbb6e589d3d744c6c | Progression/Frey arithmetic and its general modular suppliers. |
| ArithmeticDynamics | 85e78c07dcc361ead6505c970a1181deee483819 | Dynamical heights, orbit and preimage Galois theory. The connector returned an empty body; the actual README was read from the local Git object at this exact head. |

No target was transferred to, duplicated from or made dependent on those five heads. Earlier supplier sections were checked on their own mathematical domains, especially the transfer restriction S_FL and small levels, residual genericity under every finite enlargement, rank-two versus arbitrary-rank cyclotomic irreducibility, and PEL orbit trace without division by the component-group order.

## Adversarial mathematics pass

Each target row covers its definition or theorem, its API statements and its Checks. Standing hypotheses are repeated where needed by the theorem; native geometric signatures remain prose. The six Lean theorem signatures have all their binders in the declaration itself.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Standing fields, coefficients, finite sets and universes | n=0,1,2; zero ring; equal characteristic; ramified Eλ; infinite excluded set | n≥2 and number-field coefficient completions exclude the first invalid domains. Coefficient ramification is allowed. Finite exclusions and unrestricted carrier universes are retained. | Clarified degree-one base place. |
| Frobenius, twists, cochains and measures | Inert p=3; sign action on ℤ; (I,−1)c; unequal nested compact levels | Tate actions 9 and 1/9; d0(1)=−2; square has GL component −I. Tensor twist is n. A fixed Haar measure cannot give all levels volume 1. | Specified reference-level volume and factor order. |
| Reflection, Hecke and equivariant trace controls | Degrees 1,2; q=3; free two-point orbit with 𝔽₂ coefficients | Reflection signs differ by parity. Hecke values 16, 9/2 and 105/2 agree with their formulas. Total trace 0 differs from orbit trace 1. | Retained distinct coefficient/unit domains. |
| 1.5 Special inert predicates and API | ℚ(i), p=2,3,5; inert local degree two; CM-preserving isomorphism | 3 satisfies the predicate with residue size 9; 2 and 5 fail; inertness alone does not imply local degree one. | Added explicit wrong-definition discriminants. |
| 1.6 Admissibility and API | n=2; ℓ=2,3,11; identity scalar; ξ=±1; basis change | Small primes fail L1; a permitted ℓ alone proves none of L2–L7. Identity scalar and ξ=±1 do not witness L5. | Retained all seven clauses and their image witness. |
| 2.1 Level data and API | m=0,1,2; empty raising set; nonneat level; residual root not lifting | Positive depth, full ideal contraction and separate P6 at the new level are essential. Empty raising set is valid. | No residual-only or localization substitute. |
| 2.2 Basic correspondence and API | N=2,3; empty base; residue extension | Fibre dimensions 0,1 and codimensions 1,1 agree; empty base has empty correspondence. Local closed immersion is not promoted to a global embedding. | Retained native isogeny and transport data. |
| 2.3 Strata and API | xy=p; p=3,N=3; generic fibre | Components have multiplicity one. Quartic link normals have degrees 16 and −16. Link is a special-fibre object. | Retained both normals and generic comparison. |
| 2.4 Link and excess intersection | Minimal relative position; ℓ dividing p+1; free two-point orbit | Index p+1 and projective fibre ℙ⁰. Degree-unit hypothesis is required only for the restriction isomorphism. | No division by group order. |
| 2.5 Six incidence maps, matrices, monodromy and API | N=2,3,4; basis vectors on two branches; p=3; Frobenius 4 on ℤ₃ | Restriction gives 1,−1; odd diagonal −16; even corner 4; identity link monodromy has target twist −1. Invariants 0 differ from coinvariants 𝔽₃. | Expanded all maps and the complete zero-link N=2 matrix. |
| 2.6 Product resolution and API | n=2; empty centre; exceptional geometric point | Dimension 3, graph codimension 2, exceptional degree-two class retained. Cartier condition is sufficient; unrestricted lifts need not be unique. | Bound the input graph to its earlier special-map supplier. |
| 3.1 Localized cohomology | Zero localization; constituent present only at target level | Zero localization is consistent. An unlocalized target-only constituent prevents intertwiner surjectivity. | Localization remains explicit. |
| 3.2 Odd Tate comparison | N=3; A6.1.4 alone versus adding A6.1.6 and H(N) | Concentration/freeness and the stronger Frobenius/coinvariant result have different hypotheses. | Retained all three domains separately. |
| 3.3 Even integral freeness | N=2; zero definite support; transferable level outside the supplier's small-level theorem | Nonzero support and R=T hypotheses are required. Finite covers of λ-divisible degree do not establish integral descent. | Kept old-form-dimension gap at full endpoint generality. |
| 3.4 Even Frobenius exclusion | a=p⁻¹; p²=1 in residue coefficients | Distinguished pair would yield 1 or p² and is excluded; standing P2 rules out collision. | Residual spectrum remains residual. |
| 3.5 Even singular comparison | m=1,2; localization versus quotient versus annihilator | Filtered inertia and singular groups compare after the actual congruence quotient. | No rational or eigen-submodule replacement. |
| 3.6 Galois realization | Multiplicity 0,1,2; homothetic lattices | Nonzero support forces μ≥1; μ=2 yields no distinguished summand. | Retained conjugation and existence of an isomorphism. |
| 3.7 Odd level change | Empty set; one special place; nonunit intertwiner | Empty change is identity; genericity and H(n₁) are needed for a one-place comparison. | Retained cohomological genericity and all-level domain. |
| 4.1 Diagonal datum and API | n=2,3; incompatible levels; source-only cover | Dimension and codimension agree in both orders. Source-only refinement is commutative but need not be Cartesian. | Made the parity exchange explicit. |
| 4.2 Graph cycle and API | Zero cycle; degree-two cover; point graph | Additivity, positive trace and multiplicity 2 agree. Source degree governs pushforward. | Corrected page 54. |
| 4.3 Projected AJ and API | Zero cycle; n=2; degree-one point on ℙ¹; nonproper reducible residual system | Correct coefficient degree is 3, twist 2. An arbitrary point class has no such edge without concentration. Rational and integral boundary domains differ. | Retained separate concentration, support and adic-edge gaps. |
| 4.4 Purity and finite membership | Ramified Eλ; ℓ ramified in F; bad w not dividing ℓ | Coefficient ramification is allowed. L1–L2 control smooth models above ℓ. Weight −1 and dual invariants control rational local H¹ away from ℓ. | No good-primes-only endpoint. |
| 4.5 Multiplicity realization | Multiplicity 0 or 2; reducible factor | H(N)'s irreducibility antecedent cannot be discharged by automorphic irreducibility alone. Nonzero tuple has a nonzero chosen coordinate. | Retained both Galois irreducibility hypotheses. |
| 4.6 Regulator naturality | Identity; source cover of degree 2; non-Cartesian square | Trace multiplies by source degree. Pullback gives a full fibre product unless the component/base-change condition holds. | No automatic Cartesianity. |
| 5.1 First datum and API | m=0,1,2; zero quotient; q=3 over 𝔽₁₁ | Factor evaluations are 0,10,9,10,1, while tensor root 3 is repeated. PI7 is independent. Empty support fails PI6. | Added finite-period specialization and multiplicity laws. |
| 5.2 First geometric law | Source fibre of degree 2; p=3 | All correspondence legs, fibre multiplicities and factor (p+1)²=16 remain. | Retained geometric rather than automorphic hypothesis domain. |
| 5.3 Product concentration | Tensor eigenvalue collision; torsion coefficients; three E₂ positions | PI7 excludes collision, and freeness is used before ordinary tensor Künneth. | No unsupported Tor cancellation. |
| 5.4 Potential map and API | O mapped by π²; reduction; unipotent 2×2 matrix over 𝔽₃; zero cycle | Boundary of π has exponent 1. Kernels need not reduce exactly. Invariant-to-coinvariant map can be zero between one-dimensional spaces. | Expanded the actual ∇ map on resolved strata. |
| 5.5 First explicit law | p=3; one graph pair; arbitrary integral Hecke values a₀,a₁ | Pairing is 4a₀a₁ with the period-one control. | Retained every scalar factor. |
| 5.6 Exponent equality | Unit factor; π factor in A₂; zero class | Unit multiplication preserves exponent; a nonunit can lower it. Zero exponent is 0. | Retained PI2, PI4 and PI5 for the unit argument. |
| 6.1 Second datum and API | Two source points with one image; m=0; extra first-law labels | Characteristic pushforward is 2; changing an unrequired rigidity label cannot affect the datum. | PII contains no PI5 or PI6. |
| 6.2 Second geometric law | n=2; exchange of correspondence legs | Degree 2r₀ and twist r₀ agree; exchanging legs without changing domains is invalid. | Retained T⋆ and both legs. |
| 6.3 Odd special-fibre coinvariants | N=3; zero localization; nearby versus special-fibre cohomology | Comparison uses special-fibre concentration, not just nearby concentration. | Retained A7.3.2 and H(n₁). |
| 6.4 Second exponent bound | A₂ mapping onto A₁; zero right-hand value | Image exponent can drop from 2 to 1, so only ≤ is general. | No equality or singular-regulator reinterpretation. |
| 7.1 Actual image lift | m=1,2; ξ=±1; tuple outside the congruence image | An arbitrary tuple is not an image lift; prime-to-ℓ powering must preserve cyclotomic control. | Retained actual-image and unit conditions. |
| 7.2 Auxiliary detection | Zero realised span; D=[[π,1],[0,π]], C=[[π,−1],[0,π]] over A₅; c=0,c≥k | DC=CD=π²I, but C is not a basis matrix. Primitive t=(−1,π) has first value 0 and second exponent 3. | Retained scaled-inverse submodule and primitive-kernel conclusions. |
| 7.3 Annihilator classes and API | Empty vertex; triangular control; perfect versus π-scaled pairing; nondetecting place above p₁; w above ℓ | Product exponent in A₅ is 2, falling to 1 after scaling the pairing. Both crystalline arguments and all nondetecting specializations are essential. Simple Satake pair at p=3 mod 11 gives {5,1}; repeated pair mod 19 fails. | Total two-place loss is 2c; no basis assumption. |
| 7.4 Eventual families | Non-CM nonisogenous curves; Steinberg/unramified pair; missing supercuspidal component; F⁺=ℚ | The two source families retain their respective hypotheses and F⁺≠ℚ. | No arbitrary-family extension. |
| 8.1 Rank-zero theorem | Zero Selmer group; positive c; ramified coefficients; F⁺=ℚ | Nonzero period has finite valuation; m>m₀+c+mper+mlat+mdif gives the reciprocity contradiction. | Uniform rank-one realised span remains a premise. |
| 8.2 Rank-one theorem | Zero AJ; multiplicity 2; primitive first-kernel vector; positive c | Nonzero chosen coordinate gives the lower bound. Upper bound uses m>m₀+mper+2c+mlat+mdif. | Retained uniform rank-two span, rigidity transport and both finite conditions at ℓ. |
| 8.3 H(N)-free domains | n=2 over ℚ; n=3 over ℚ or a larger totally real field | H(N) removal is only N≤3 or F⁺≠ℚ; eventual admissibility does not remove uniform span. | Domain unchanged. |
| 8.4 Rank-(2,3) specialization | n=2; F⁺=ℚ; failure of L6 or L7 | H(2),H(3) are discharged through the supplier contract, but admissibility clauses remain. | No unproved L6/L7-free endpoint. |
| 8.5 Hilbert precursor | g=1; odd g; failed LIInd or residual dimension equality | Its finite-field unramified target and congruence quotient remain distinct from the unitary singular theorem. | Exact Liu–Tian supplier gap retained. |
| definiteDiagonalPeriod definition | Empty, singleton, double fibre; two legs swapped; 𝔽₂ coefficients | Counts source points with no denominator. X and Y need not be finite. | Real body on finite sums. |
| definiteDiagonalPeriod_add | Empty source; zero coefficient monoid; torsion coefficients | Additive commutative monoid suffices. | All binders explicit. |
| definiteDiagonalPeriod_smul | Zero ring; noncommutative semiring; characteristic 2 | Left distributivity proves the scalar law; no field or nonzero-ring premise is needed. | All binders explicit. |
| definiteDiagonalPeriod_map | Zero homomorphism; reduction mod 2; coefficient extension | Every additive homomorphism preserves the finite sum. | No stronger ring hypotheses. |
| definiteDiagonalPeriod_reindex | Empty equivalence; permutation of two points; different universes | Bijection preserves the source sum and the transported legs. | Equivalence is an actual binder, not an arbitrary map. |
| definiteDiagonalPeriod_fiber | Empty source; noninjective pair of legs; positive-characteristic target | Finite fibres give cardinality weights, including 0. Finite X,Y are required only for the outer sum. | No unsupported division or injectivity. |
| definiteDiagonalPeriod_exists_ne_zero | Empty source; two nonzero opposite values; double fibre in 𝔽₂ | Nonzero sum implies a nonzero summand; the converse fails. | Cancellation is a provided Lean proof-body control. |
| Repaired product notation in §§2.4, 8.5 | N=2, j=0, p=3; g=1, p=3 | The link product has one factor 4; the precursor product has one factor 8. The prime-to-ℓ condition is identical. | Only the notation changed; the index bounds and factors remain. |
| Repaired blowup and fixed-vector notation in §§2.6, 3.1 | Empty blowup centre; nonzero K•-fixed space with zero K°-fixed space | The blowup remains the identity off its centre; a target-only constituent still obstructs surjectivity. | Replaced subscript braces and superscript braces by their precise verbal meanings. |
| Repaired period and span notation in §§5.5, 7.2 | Empty and singleton graph sources; coincident double fibre; trivial realised group and c<k | Sums give 0, one value and twice that value; zero realised span still fails the same nonzero containment. | Sum indexing is explicit; G(S,γ) denotes the same group and the target consists of Oλ-linear maps into the same fixed submodule. |
| Rephrased supplier multiplicity references | N≤3; F⁺=ℚ with N≥4; compact and nonproper concentration domains | The same H(N) hypotheses and removal domains remain; no stronger identification or concentration theorem is inferred. | Retained exact supplier section numbers and every gap requirement. |

The source versions and legal cache records were preserved. All five recorded texts were readable; no additional work or unresolved reference request was needed. Published reflexive closure and preprint theorem numbering are distinguished. Every mathematical sentence added to the package is a paraphrase or an elementary calculation; no source passage is copied into a deliverable.

## Lean file and elaboration outcome

`Suggested.lean` has one `import Mathlib`, one real-bodied definition, six theorem targets, two examples with proof bodies, no admitted example, no admitted data, no `set_option`, and no roadmap imports. It is below the 5000-line limit. The examples jointly cover singleton, coincident double fibre, empty source, signed cancellation and characteristic two. Their proof uses the pinned Fintype.sum_bool identity in `Mathlib/Data/Fintype/BigOperators.lean`.

The native unitary, cohomological, Galois and Selmer headlines cannot be expressed on the pinned carriers without developing their supplier constructions. They therefore stay exact README targets. Arithmetic controls of those constructions stay with those targets; no unrelated numerical example or artificial finite model is used to impersonate a geometric statement. The finite-period milestones are the easy signatures actually supplied.

All seven introduced declaration names occur in the README. Static backticked-identifier check: **0 missing**. All geometric API and Check names are prose, using the explicit exception in the identifier rule. The new finite-period definition has five discriminating controls, jointly tested by two examples. Nonzero summands, source finiteness, coefficient instances and source equivalences are bound explicitly in each appropriate theorem.

Elaboration command: **not available**. The brief supplies no executable Lean command and expressly limits which Lean commands may run. No Lean process or scratch `#check` elaboration was started. Exact compiler `sorry`-warning count: **not measured, because compilation was not run**. Static `sorry` count: **6**, one for each theorem target. Other compiler messages: **none observed; the compiler was not invoked**. Binder retention and the example proofs have been inspected as source but are not certified by elaboration.

## Dependency check

The prescribed dependency command completed with exit code 0. Its complete stdout was:

```text
depcheck: 6 roadmaps, 58 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The tool's six-roadmap inventory is smaller than the supplier list, so a separate check classified all 24 named suppliers against main and the merge order, and checked every target prerequisite. Its output summary was:

```text
Candidate merge-order position: 141
Supplier audit: 24 suppliers, 0 upward/absent
Target audit: 40 targets, 74 internal edges, 0 forward/missing
```

EtaleCohomologyFoundations, ProfiniteCohomology, Chebotarev, SchemeAndStackFoundations and StableReduction are on main; the other 19 suppliers are earlier in the order. The extra §2.6 usage goes to ShimuraVarieties, also earlier. Every gap resolves to one of those suppliers. No tooling, merge order, library checkout, top-level roadmap index or remote object was changed.

## Format-repair verification

The installed text scanners were run directly on the package README and Lean file, without a build or Git/remote mutation. Their complete summary was:

```text
gate SelmerIwasawaCohomologyPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 check-labels-missing=0 empty-sections=0 round-labels=0 long-fences=0 OK
manifest-text-problems: []
```

The dependency command was rerun after the repairs, returned exit code 0, and printed exactly:

```text
depcheck: 6 roadmaps, 58 edges, 0 problem(s)
```

No UPWARD or CYCLE line appeared. A preservation comparison confirms identical Lean commands after stripping comments, all 40 target headings, the complete plan, and every manifest field other than the first locator. The Lean file was not compiled; its six admitted theorem proofs and the unmeasured compiler-warning count remain as recorded above.
