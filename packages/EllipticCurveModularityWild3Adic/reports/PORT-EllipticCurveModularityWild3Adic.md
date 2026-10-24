# Port: EllipticCurveModularityWild3Adic

- Branch: `roadmap/elliptic-curve-modularity-wild3-adic`.
- Head commit: f6083a512327894cbed018d96835569752b75da0.
- Base verified before changes: `82e5289`; initial status was empty.
- Changed repository files: `TauCetiRoadmap/EllipticCurveModularityWild3Adic/README.md`, `TauCetiRoadmap/EllipticCurveModularityWild3Adic/Suggested.lean`, and `TauCetiRoadmap/EllipticCurveModularityWild3Adic/metadata.toml`.
- Build exit status: 0. Exact outcome: `Build completed successfully (9096 jobs).` Warning count: 10, all `declaration uses` followed by backticked `sorry`; no other warnings or errors.
- Push gate: `gate EllipticCurveModularityWild3Adic: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`.

## Draft pull request body

Develop the wild 3-adic local theory used in the Breuil–Conrad–Diamond–Taylor proof of elliptic modularity: explicit ramified fields and types, Breuil modules with corrected wild descent, finite-flat deformation conditions, and the tangent calculations proving weak acceptability. Combine these with paired level-five modular curves and 3–5 switching to prove modularity of cyclotomic mod-five representations and give a second proof of modularity for every elliptic curve over ℚ.

AI-assisted port and mathematical self-review with GPT-6.

## Preservation and changes

The full seven-layer development, exact hypotheses and literature locators, definition APIs, worked examples, and definition Checks are retained, apart from supplier-owned material identified below. There are 75 owned numbered topics, compared with 76 in the package: the shared residual-classification/admittance topic is imported rather than repeated. The package's already corrected mathematical decisions, including characteristic-three tangent Ext, the shifted negative-field uniformizer, the full extended-type Frobenius datum, arbitrary-field twist construction, exceptional CM branch, and actual finite modular-map targets, remain in force. The non-blocking API-prose note was applied to remaining fragmentary API bullets.

`Suggested.lean` is unchanged from the accepted package: one Mathlib import, the actually used pinned Newform import, six real-bodied definitions/abbreviations and ten admitted headline theorems. Nothing moved from Lean to README during this port. No admitted data, API padding, examples or option overrides were added. The conductor/parametrization and other unavailable-carrier headlines retain the precise explanations in its module docstring. Metadata matches the single-key main-branch format: `topic = "math.NT"`.

The complete README was reread for mathematical scope, statement context, proof-route inputs and consistency with its Checks. Repairs made during this port:

1. In §6.7, twisting characters are explicitly continuous, including the characteristic-zero branch; a finite abstract image alone does not imply continuity. The supplied ordinary/newform theory concerns continuous Galois characters.
2. In §5.5, rank one belongs to each of the two graded pieces, while the whole residual model has scalar rank two. Added the coefficient-field witness `𝔽₉⊗𝔽₉ ≅ 𝔽₉×𝔽₉`.
3. In §5.9, reductions have `1≤M≤N`, and the displayed short exact sequence has `1≤M<N`. This avoids an undefined `M₀` at `M=N`; added the explicit `(N,M)=(2,1)` length/rank witness.
4. In §6.4, the prescribed très ramifié local 3-torsion conclusion applies to cases 2–6; the tame first case has no such condition.
5. In §6.1, continuity of the residual representation is explicit, as required by the twist and finite étale realization.
6. The conventions and §1.13 now identify the inverse of the supplier's covariant crystalline Frobenius with arithmetic Weil Frobenius. For `y²=x³−x`, `a₃=0`, `a₉=−6`; the two eigenvalues at residue degree two are `−1/3` and `−3`, respectively. The special-fibre contravariant Dieudonné operator is not silently identified with covariant crystalline Frobenius.
7. The opening summary now restricts the prescribed très ramifié shape to the five wild forms and includes the zero-ring branch of weak acceptability. The local field count is described as five families (seven individual fields), rather than five fields. The prime convention permits explicit prime quantifiers such as `ℓ≠3` in §1.13.
8. The exact supplier contract for AutomorphicGaloisRepresentations §§1.5, 7.3 now names the newform realization and compatible family used by §6.7.

A suspected issue in §1.12 was rejected after computation and source reading: the Frobenius lift in the mod-five splitting field has order 24, and the normalizer has order 48, so its fixed field really has degree two. It is not the order-two Frobenius generator of the different, degree-24 type field.

## Supplier replacements and ownership

The duplication sweep used the roadmap service for main and every indexed open head, plus object searches in the pinned sources, board packages and the supplied sibling checkouts. The main-branch models read were LocalFieldsRamification, LocalGaloisGroups, ProfiniteArithmetic and Completed/EffectiveBounds. Progress/revision-only changes to existing roadmaps were not used as suppliers.

- PadicLocalLanglandsForGL2Qp §§2.8 and 5.13 already specify exactly the residual irreducible representations and every BCDT admittance/simple-admittance rule formerly repeated in §0.2. That topic was deleted, all its consumers now name those supplier sections, and the ownership boundary is recorded in README Scope and ownership. Its §0.3 supplies the shared fundamental characters and total unit-Kummer condition, including the split class. Section 1.1 retains the new explicit basis, pairing and Galois restriction calculation over ℚ₃.
- PadicLocalLanglandsForGL2Qp §4.4 supplies the underlying Henniart K-type and its general occurrence theorem. Section 0.1 now uses this object in its first two cases and asks for the explicit inducing-model comparisons; its additional Iwahori/normalizer realization and extended-type occurrence statements have different acting groups. Their explicit formulas and Checks are retained.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.34 supplies the underlying truncated-polynomial Breuil triple. Section 2.1 consumes it; its remaining target is the arbitrary-ramification contravariant classification, exactness, monodromy and Dieudonné comparison. Section 2.3 adds the wild correction calculus, beyond the supplier's tame descent setting and opposite monodromy sign.
- General BCDT lifting remains imported from GL2ModularityLifting §§5.14–5.15; no second global patching proof is planned.
- EllipticCurveModularity retains the modularity interfaces, exact conductor and parametrization, and its existence proof. This roadmap's end theorem is explicitly the independent wild-type proof using only the supplier's conditional comparisons.
- ModularCurves §5C and ModularCurvesPartII §5.14 start with paired data over ℚ. The latter's base-change clause does not provide a twist for an arbitrary local Galois module. The arbitrary-characteristic-zero-field construction remains owned in §1.15, on the supplied finite étale, quotient and fine-moduli foundations.
- Matrix and special-linear Hilbert 90 and the equivariant icosahedral lift remain here. Pinned scalar Hilbert 90, SchemeAndStackFoundations §1.24's affine-algebra descent, and FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.4's characteristic-p étale-φ equivalence do not state these general-field matrix and determinant-one assertions. No readable supplier gives the equivariant level-five lift. Its generality and explicit native carriers are retained.
- No dependency on a later roadmap and no ownership move to a later roadmap was introduced. No declaration has another readable roadmap's fully qualified name.

The original `BarsottiTate.extend_genericFibre` citation lead resolves to the actual target of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.22. It is a roadmap supplier, not a claim of an implemented pinned declaration.

### Suppliers that are still new-roadmap pull requests

PadicLocalLanglandsForGL2Qp; LocalGaloisDeformationRings; FiniteFlatGroupsAndIntegralPadicHodgeTheory; GL2AutomorphicRepresentationsAndTransfer; GL2ModularityLifting; ClassicalSerreModularity; OrdinaryAutomorphicFormsAndModularityLifting; ModularCurvesPartII; InverseGaloisAndArithmeticFundamentalGroups; ArithmeticGaloisRepresentations; AlgebraicModularFormsAndSerreWeights; AutomorphicGaloisRepresentations; EllipticCurveModularity; PadicHodgeTheory; ComplexMultiplicationAndExplicitReciprocity.

### Resolved source and supplier evidence

Literature source IDs are those of `packages/EllipticCurveModularityWild3Adic/sources.toml`. Line locators below refer to the readable author-copy text extractions; published section/page locators remain attached to the corresponding README statements. Roadmap source IDs identify their main or indexed-head README; pinned-source IDs identify the displayed repository-relative dependency file.

| Source ID | Locator and verified contract |
|---|---|
| BCDT | line 832: cyclotomic mod-five theorem; line 951: elliptic modularity; line 1464: characteristic-three rings; line 1726: contravariant classification; line 2179: corrected wild descent; line 2469: cubic extensions; line 2525: reversed cubic extensions; line 2719: degree-twelve rank-one descent; line 2766: unique quadratic model; line 3040: four extended families. |
| SBT | line 154 of the readable web PDF: Lemma 1.1; line 164: special-linear Hilbert 90; line 183: the lift and perfectness; line 201: realization; line 213: one-entry sign quotient of degree 24. |
| CDT | line 1588: exceptional-image classification; line 1691: switch at five; line 2035: comparison for arbitrary potentially good abelian varieties with number-field action, not just elliptic curves. |
| Manoharmayum | line 856: degree-twelve splitting-field comparison; line 864: generator relations; line 906: discriminant quadratic field; line 965: 3-torsion realization families. |
| Elkies | line 4492 of the readable web PDF: equation (150), the level-75 quotient curve; equations (151)–(153) on author pp.54–55 give the double cover and branch analysis. |
| Roadmap-PadicLocalLanglandsForGL2Qp | line 878: §2.8 residual classification; line 1512: §4.4 K-types; line 2124: §5.13 exact admittance rules. |
| Roadmap-LocalGaloisDeformationRings | line 1358: §1.4 tangent/obstruction; line 1486: §1.12 coefficient change; line 2562: §3.12 point-kernel type quotients; line 4067: §8.6 category conditions, with middle object killed by the residue uniformizer for tangent Ext. |
| Roadmap-FiniteFlatGroupsAndIntegralPadicHodgeTheory | line 1798: §R07.1.22 generic-fibre full faithfulness; line 3094: Dieudonné ring; line 3162: contravariant Dieudonné module; line 3215: semilinear descent; line 3252: classification; line 6107: Breuil S-modules; line 6656: Weil–Deligne types; line 6775: p-divisible descent; line 7042: underlying Breuil triple and tame descent. |
| Roadmap-GL2AutomorphicRepresentationsAndTransfer | line 725: R16.2.9 unicity; line 755: R16.2.11 vexing type; line 956: R16.3.9 inertial comparison. R17.5 supplies the octahedral mod-three application, not the wild tangent computations. |
| Roadmap-GL2ModularityLifting | line 1405: §5.11 Kisin over ℚ; line 1458: §5.14 BCDT type lifting; line 1475: §5.15 extended-type lifting; the two preceding targets supply corrected residual support and global comparison. |
| Roadmap-ClassicalSerreModularity; Roadmap-OrdinaryAutomorphicFormsAndModularityLifting | line 245 (§I.1) and line 2150 (§5.7): full ordinary lifting owner and its stated comparison scope, including the imaginary-quadratic branch. |
| Roadmap-ModularCurvesPartII | line 1644: §4.10 fixed-pairing connectedness; line 2018: §5.13 compactification; line 2052: §5.14 rational-base twists; line 2084: §5.15 level maps; line 2352: §6.5 irreducibility. |
| Roadmap-InverseGaloisAndArithmeticFundamentalGroups | line 2253: §IG.2.7, requiring weak approximation at every finite set before auxiliary places are added. The parameter line satisfies this requirement. |
| Roadmap-ArithmeticGaloisRepresentations | line 1085: §1.8 characteristic-polynomial Brauer–Nesbitt; lines 2800, 2833, 2869, 2966: §§4.1–4.3, 4.6 oddness, Cartans, Sylow and bad dihedral images; lines 3102, 3148, 3172: §§5.1, 5.3–5.4 density and recognition; lines 3586, 3780, 3823: §§6.1–6.3 Tate modules, pairing/determinant, reduction and Euler factors. |
| Roadmap-AlgebraicModularFormsAndSerreWeights | line 698: R15.3 weight operations; line 1340: R15.5 eigenvalue lifting; line 1690: R15.6 residual modularity. |
| Roadmap-AutomorphicGaloisRepresentations | line 1096: §1.5 arithmetic rank-two newform realization; line 2927: §7.3 compatible family. |
| Roadmap-EllipticCurveModularity | line 1007: R29.3 attachment; line 1250: R29.4 Tate modules/conductor; line 1465: R29.5 modular quotient; line 1599: R29.6 conditional converse and modularity. |
| Roadmap-PadicHodgeTheory | line 1432: §8.3 covariant crystalline convention and reciprocal Frobenius polynomial; line 1504: §9.3 compatible p-divisible extension and good reduction. |
| Roadmap-ComplexMultiplicationAndExplicitReciprocity | line 771: CM induction and compatible-system comparison. |
| Main-SchemeAndStackFoundations | line 3068: §1.24 concerns continuous semilinear coordinate-algebra descent, not an already named matrix Hilbert 90 theorem. |
| Pinned-Newform | `.lake/packages/TauCeti/TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean`, line 84: nonzero eigenform; line 91: eigenvalues only at coprime positive indices; line 104: native Newform. |
| Pinned-Mathlib | `.lake/packages/mathlib/Mathlib/NumberTheory/Padics/PadicNumbers.lean`, line 1220: additive valuation; `RepresentationTheory/Continuous/Basic.lean`, line 54: continuous linear operators without a bundled joint group-variable continuity requirement; `AlgebraicGeometry/EllipticCurve/Affine/Point.lean`, line 477: infinity and nonsingular affine points. |
| Pinned-Kummer | `.lake/packages/TauCeti/TauCeti/NumberTheory/ClassFieldTheory/MuNRep.lean`, line 270: Kummer equivalence with the invertibility hypothesis; `Local/Duality/FiniteModule.lean`, line 260: local duality; `Local/Reciprocity.lean`, line 116: local Artin map; `Local/Unramified.lean`, line 440: arithmetic Frobenius normalization; `LocalExistence/AbelianLayer.lean`, line 114: abelian-layer reciprocity. |
| Pinned-Cohomology | `.lake/packages/TauCeti/TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean`, line 717: H1pi; `Functoriality.lean`, lines 161 and 222: coefficient map and restriction. |

Main ClassFieldTheory Layers 5, 7, 8, 11–12, LocalGaloisGroups Layer 1, LocalFieldsRamification Layers 0, 2, 3, EllipticCurves Layers 2, 4, ModularCurves Layers 0D–0E, 2F, 5B–5C, ModularForms Layers 4, 9, Chebotarev and RepresentationTheory/InductionRestriction Layer 7 were read/grepped at main. Their native supplier declarations exist there or at the pins. Searches of Mathlib pull-request and Zulip material did not identify another replacement that can be used at the pins; no unverified claim about all open Mathlib work is made.

## Elaborated signatures

A scratch file containing the acceptance text and `#check @name` for all 16 declarations was elaborated once through the permitted targeted module build. The transient checks were then removed and the final module rebuilt. Each elaborated type was compared with its README statement. No section binder disappeared and no binder repair was necessary. In particular continuity uses the discrete matrix-group topology and Krull source topology; all root equations, `n≥1`, cocycle laws, faithfulness/equivariance, characteristic zero, rational-fibre ellipticity, positive level, primality, coprimality and nondivisibility of the model discriminant survive.

| Declaration | Instances tried | Computed values | Result / change |
|---|---|---|---|
| Q3 | 0,1,3 | characteristic 0, `v₃(3)=1` | Native abbreviation retained. |
| Q3bar | square root j of −1 | `j²=−1`; −1 reduces to nonsquare 2 over 𝔽₃ | Native closure retained. |
| cubeClass_coordinates | 1,3,4,12,27,64,1/3; excluded zero | coordinates `(0,0),(1,0),(0,1),(1,1),(0,0),(0,0),(2,0)`; zero would allow nine pairs | Nonzero hypothesis present. |
| cyclicCubicField | zero; root of prescribed polynomial | field ranks 1;3 | Definition unrestricted; theorem carries root equation. |
| nonabelianCubicSplittingField | zero generators; prescribed roots | field ranks 1;6 | Both roots bound explicitly. |
| degreeTwelveSplittingField | zero generators; prescribed roots | field ranks 1;24 | All four equations are theorem hypotheses. |
| cyclicCubic_galois | explicit conjugate, third iterate | polynomial remainder 0; third iterate minus π remainder 0; discriminant 81 | Exact quotient-ring computation. |
| nonabelianCubic_finrank | j-dependent conjugate | root remainder 0, ratio remainder 0, third iterate remainder 0; discriminant −324 | Degree 3/6 and nonnormality consistent. |
| positiveQuadratic_finrank | α/β | valuations `1/3−1/4=1/12`; `e·f=12·2=24` | Every root equation retained. |
| negativeQuadratic_finrank | (α−1)/β versus α/β | valuations `1/12` versus `−1/4`; norm `81/(−27)=−3` | Shifted README uniformizer retained. |
| extendedTypeField_finrank | i=0,1,2 | cube values 3,12,21; twelfth powers −3,−768,−7203 | Fin 3 excludes invalid indices. |
| levelFiveConjugate | t=1,2; upper unipotent; centre | upper-right entries 1,2; inverse convention gives 3 at t=2; −I fixed; determinant 1 | Real body retained. |
| matrixHilbert90 | trivial group; scalar i; noncommuting B | cocycle values I;−1; `(-1,-2i;0,-1)`; product with conjugate I | Coboundary order and continuity retained. |
| specialLinearHilbert90 | n=1; B=diag(i,−i) | SL₁ has one element; det B=1; cocycle −I; determinant correction gives `d⁻¹d=1` | Invertibility supplies nonzero denominator. |
| equivariantIcosahedralLift | identity; centre; diagonal conjugation | b(1)=I; b(−I)=−I, projective value 1; t=2 scales upper-right by 2 | No weakening or substitute carrier. |
| ellipticCurve_modular | y²=x³−x; singular model | Δ=64; point counts 4 and 8 at 3 and 5; eigenvalues 0 and −2; Δ=0 excluded | Native Newform and ellipticity hypotheses retained. |

## Computed adversarial mathematics pass

These are discriminating instances and exact algebraic consistency checks, not proofs of the admitted classification/existence theorems. The proof routes remain the stated sources and suppliers. Polynomial work used exact rational quotient rings or truncated rings over 𝔽₃; finite matrix groups were enumerated directly. No downloaded code was executed. Inapplicable inputs (zero rings as DVRs, ℓ=2 for the odd-prime Breuil classification, equal-characteristic fields in a mixed-characteristic theorem, singular rational models) fail the stated hypotheses rather than being silently passed to a total invariant.

| Statement | Instances tried | Values computed on defining laws / both sides | Result | Change |
|---|---|---|---|---|
| Prime/field convention | ℓ=2,3; unit/zero | odd-prime truth values 0,1; `v₃(1)=0`, `v₃(3)=1`; `3≠0` | Domains discriminate | None |
| Reciprocity/cyclotomic convention | uniformizer 3, unit 4 | normalized unramified character values 1,0; ω²=1 | Arithmetic convention | None |
| Peu/très convention | 0,[4],[3] | unit membership 1,1,0; très 0,0,1 | Split included | Supplier ownership |
| Matrix convention | diagonal and lower-left elementary matrices | trace diag(1,−1)=0; lower-left E₂₁=1 | Subobject/quotient directions fixed | None |
| Group convention | UT₃(𝔽₃) | order 27; `(1+A)³=1`; commutator `1+E₁₃≠1` | Excluded as noncommutative | None |
| Monodromy convention | ue; constant generator | N(ue)=ue≠0; N(e)=0 | Zero operator fails | None |
| Dieudonné convention | j∈𝔽₉, μ₃ | V(j)=j³=−j; F=0; FV=VF=0=3 | Semilinearity visible | None |
| Crystalline convention | good CM curve at residue degree 2 | a₉=−6; arithmetic eigenvalue −3, covariant eigenvalue −1/3 | Inversion required | New witness |
| Weak acceptability convention | 0,O,O[[X,Y]] | zero branch; tangent dimensions 0 and 2; one-variable quotient ≤1 | Two-variable ring rejected | None |
| 0.1 explicit compact models | ℓ=3; scalar, conductor 1, conductor 2 | dimensions 3,4,12; unramified principal-series finite invariants 1⊕St | Distinct inducing models | K-type imported |
| 0.1 Iwahori/extended occurrence | matching and different Weil types | Hom dimensions 1,0; central w²=−3 | Full normalizer datum retained | General K-occurrence imported |
| Shared residual classification/admittance | ℓ=3; n=0,1,2; peu/très | dimensions 1,2,3; très twist selects (2,1), peu also (0,1) | Exact supplier object | Duplicate topic deleted |
| 0.3 cubic definitions | 4 and 1+3j | character values (ζ,1) versus (1,ζ); ζ³=1≠ζ | Types distinguish | None |
| 0.4 quadratic definitions | −1,1+3√−3 | values −1;1 for negative quadratic, ζ for extended | Wrong extended character rejected | None |
| 0.5 extended definition | indices 0,1,2; opposite sign | values 1,ζ,ζ²; `(ζ−ζ⁻¹)²=−3`; negative has opposite uniformizer value | Inertia alone insufficient | None |
| 0.6 cubic simple admittance | très and peu twist | admitting constituent counts 1 and 2; très constituent multiplicity 1 | Très hypothesis needed | Supplier citation |
| 0.7 quadratic simple admittance | two equal-character constituents | dimensions 1+1=2; only m=0 is simple for given très shape | Correct acting group | Supplier citation |
| 0.8 extended simple admittance | quotient Frobenius 1 and −1 | required a=−1 and +1 respectively | Whole-group condition needed | Supplier citation |
| 1.1 basis/dimensions | seven rational classes | nine coordinates, two-dimensional space; unit line 3 classes | Basis not zero | None |
| 1.1 duality/annihilators | unramified character on [3],[4],[27] | 1,0,0; kernel has three cube classes | Exact unit annihilator | None |
| 1.1 restriction | Q₃(∛3), degree 3 non-Galois | [3] restricts to 0 while ω stays nontrivial | Galois hypothesis necessary | None |
| 1.2 G and c | cubic G=u²−1 | −φ(G)=1−u⁶; constants −1,1 | Negative sign required | None |
| 1.2 H,t,f | invariant uniformizer; wild extended case | (1,0,0); t constant 2 and u⁶ coefficient 2 mod3 | Wild corrections nonzero | None |
| 1.3 cyclic field | two conjugates and iterate | root remainders 0; third iterate difference 0; discriminant 81 | Degree/order compatible | None |
| 1.4 nonabelian field | prescribed γ₃ and H | root and πH−γ₃π remainders 0; discriminant −324 | Nonabelian quadratic resolvent | None |
| 1.5 positive field | α/β; γ₄² | valuation 1/12; β↦−β; 12·2=24 | Uniformizer and central order 2 | None |
| 1.6 negative field | shifted/unshifted α | valuations 1/12,−1/4; norm −3 | Printed unshifted candidate fails | None |
| 1.7 extended fields | i=0,1,2 | α³=3,12,21; π¹²=−3,−768,−7203; c=1 | Integer lifts matter | None |
| 1.7 correction identities | γ₃ and inverse | t mod u¹² is 2+2u⁶ and 2+u⁶; coefficient-ring calculation mod9 | Correct signs | None |
| 1.8 normalizer | ζ in GL₂(𝔽₅) | Cartan order24; normalizer48; determinant-one normalizer12; ζ order3 | Normal subgroup route consistent | None |
| 1.8 determinant-three elements | trace-zero Cartan elements | exactly `(1,3;2,4)` and `(4,2;3,1)`; square2I and determinant3 | Exactly ±(ζ−ζ⁻¹) | None |
| 1.8 index-two statement | GL₂(𝔽₃), SL₂, Borel | orders48,24,12; Borel has surjective determinant | Bound24 needed | None |
| 1.9 six tags | good curve; quadratic/extended unit | wild order1; unit values1 versus ζ; scalar induction dimension2 versus4 | Distinguishes tags and coefficients | None |
| 1.10 exhaustion | tame/wild alternatives | wild image orders1 or3; normalizer48; Frobenius determinant3 | Group-theoretic split | None |
| 1.11 local cubic curves | b=4,2 | b²−1=15,3; Δ=−25920,−5184; both v₃Δ=4 | Abelian/nonabelian examples consistent | None |
| 1.12 degree-twelve curves | x³+3x+2; x³+3x+6; x³+9x−3 | Δ=−3456,−17280,−50544; valuations3,3,5; −1/2≡4 mod9 | Representative table retained | None |
| 1.12 Frobenius fixed field | σ=(2,−1;1,1) mod5 | order24; [normalizer:〈σ〉]=48/24=2 | Suspected defect rejected | None |
| 1.13 common module | zero variety; E×E | ranks0,4; polynomials1,(X²−a₃X+3)² | General abelian scope retained | None |
| 1.13 elliptic comparison | good E; Tate curve | arithmetic polynomial X²+3 at 3; Tate monodromy rank1 | Potentially good hypothesis | Frobenius bridge |
| 1.14 extended sign | reduced Y²=X³−X−1 | x³−x−1=2 for all three x; no affine points; count1, trace3 | Opposite sign gives trace−3 | None |
| 1.14 norm congruence | B=−3,−12,6; A=9 | unit factors1,7,4 in 1+3ℤ₃; all character values1 | Extra unit harmless | None |
| 1.15 matrix Hilbert90 | B=(i,1;0,−i) | det1; B⁻¹B̄ upper-right −2i; reverse +2i; c c̄=I | Order distinguished | None |
| 1.15 special-linear Hilbert90 | n=1; determinant d | SL₁ order1; det(diag(d⁻¹,1)B)=1 | Nonzero d from invertibility | None |
| 1.15 diagonal automorphism | t=1,2; −I | unipotent entry1,2; centre−I fixed | Inverse/constant candidates fail | None |
| 1.15 lift | identity, central involution | b(1)=I; b(−I)=−I; both project to1 | Faithful lift not quotient lift | None |
| 1.15 arbitrary-field twist | frames, pairing values, V=E₀[5] | 480 frames; four primitive pairing values; paired quotient one component; fibre E₀ | Pairing/free frame action necessary | None |
| 1.15 rationality | E₀-marked point; cusps | genus0 plus degree-one point gives P¹; cusp has no elliptic fibre | Open locus retained | None |
| 1.16 local companions | cases2–6; paired identification | inertia orders3,3,12,12,12; three très lines, two not type-split; sign+1 | Full G₃ datum in case6 | None |
| 2.1 classification | orders1,3,9 | Breuil ranks0,1,2; contravariance reverses arrows | Generic triple reused | Supplier ownership |
| 2.1 exactness/monodromy | rank-one extreme weights | F=0 at r=0; F(e)=e mod u at r=e; N(ue)=ue | Étale/multiplicative not reversed | None |
| 2.2(1–3) rank-one normal forms/maps | e=3; r=1→3 and1→2 | map exponent3; first congruence0 mod2, second1 mod2 | First allowed, second rejected | None |
| 2.2(4) model chain | constant order3 | weights1 and3; nonzero map u³, u³≠0 mod u⁹ | Ordered models differ | None |
| 2.2(5) monodromy | e and ue | N(e)=0; N(ue)=ue | Leibniz rule needed | None |
| 2.2(6–8) extremes/duality | r=0,e,1; e=3 | multiplicative weight0, étale3; dual weight1↔2 | Directions compatible | None |
| 2.2(9–10) gauge/coefficient | h=1,s=1,r=2; ratio−1 | gauge u−δu²; −1 nonsquare in F₃, square j² in F₉ | Base field affects isomorphism | None |
| 2.3 corrected descent | invariant π; extended H | t=0 versus t=2+2u⁶ mod u¹²; H=1−u⁶ | Ordinary commuting action insufficient | None |
| 2.3 rank-one descent | unramified involution; wild r=0 | H=1 yet γ(e)=−e for involution; wild weight0 action1 | Wild-inertia hypothesis needed | None |
| 2.4 ideal/filtration definition | zero, two constant pieces, μ₃ | filtration lengths0,2; generic characters1 versusω; γ₄²+1 on μ₃ equals2 | Ideal and filtration independent | None |
| 2.4 closure/uniqueness/weak-to-strong | two cubic constant models | weights1,3; equal generic order3; singleton products have two pieces | Uniqueness needs stated hypotheses | None |
| 2.5 cubic category/tangent | zero; 1⊕ω; dual numbers; E[9] | lengths0; no residual filtration for split rank2; 3=0 on dual numbers, 3E[9]=E[3]≠0 | Tangent Ext restricted to S[3] | None |
| 2.6 quadratic ideal | nonzero F₉²; wrong involution | γ₄²=−1; F+V=0; wrong +1 yields2; F²=−3 | Nonvacuous ideal | None |
| 2.7 extended ideal | unipotent γ₃ and F(x,y)=(-y³,0) | over81 vectors all displayed group/ideal relations have0 failures; at(0,1) F=(2,0), negative=(1,0) | Sign distinguished | None |
| 2.8 comparison maps | E₂₁,diag(1,−1),E₁₂ | entry triples(1,0,0),(0,−1,1),(0,0,0); diagonal sum0 | Maps not three zero maps | None |
| 2.9 tangent kernel | très[3], peu[4] | unramified pairing1,0; quotient dimension2−1=1; 2⁻¹=2 inF₃ | Très and odd characteristic used | None |
| 2.10 cubic factorization | lattice levels3,9; zero quotient | orders9,81; zero ring has0 characteristic-zero points | All torsion levels needed | None |
| 2.11 quadratic factorization | V=−F | F²=−3 and FV=3; positive square gives−3 instead | Integral sign consistent | None |
| 3.1 cubic models | extremes and local-local weights | constant3/1, multiplicative0/2; map1→3 is u³; dual1↔2 | Both δ signs retained | None |
| 3.2 peu models | c=0,1; negative scalar field | N(eω)=0,u⁶e₁; γ₂(j)=−j | Split peu and nonzero monodromy | None |
| 3.3 auxiliary cubic | cyclic group order3 acting on line | hom to F₃× order2 has image1; split generic group order9 | Degree-six argument not substituted | None |
| 3.4 très models | (c,c′)=(0,1),(1,0),(0,0) | peu,très,split; F mod u=0,nonzero,0; nine parameter pairs | Constant detects très | None |
| 3.5 diagonal cubic | first parameter0,1 | unramified versus ramified; both constants −H′(0) at parameter1 | Equal signs | None |
| 3.6 rank-three splitting | c=1,0; b=1 | divisibility constant bc=1,0 | c=1 forces b=0 | None |
| 3.7 diagonal vanishing | a,b∈F₃; H′(0)=−j | equation−a+b=b gives a=0; −j≠0 | Only inertia class killed | None |
| 3.8 tangent bound | common kernel | dimension2−1=1; subspace dimension≤1 | Upper bound only | None |
| 3.9 weak acceptability | O,O[[X]]/(X²),0 | tangent dimensions0,1; zero separate | Smoothness not inferred | None |
| 4.1 rank-one descent | r=0,2,4,6,10,12 | involution values1,−1,1,−1,−1,1; constant r12 eigenvalue1 | Weights2,6,10 selected | None |
| 4.2 adapted bases | two weight2 summands | γ₄ eigenvalues j,−j; γ₂(je)=−je; averaging 2⁻¹=2 | F₉ needed for eigenvalues | None |
| 4.3 unique residual model | très and peu; Iδ nonzero-F example | very-ramified pair(2,10); F(0,1)=(2,0) in compatible ideal test; reversed split F=0 | Nonzero-F input essential | None |
| 4.4 pushout/pullback | reversed constant c=0,1 | c=0 split; c=1 forces F=0 versus required F≠0 | Contradiction uses actual Frobenius | None |
| 4.5 diagonal unramifiedness | a³−a=1 inF₉ | image{0,j,−j}; roots of equation empty; residue degree3 splits it | Unramified, not type-field splitting | None |
| 4.6 tangent bound | common kernel | dimension1; permitted subspace dimensions0,1 | No equality assertion | None |
| 4.7 weak acceptability | zero; one-variable quotient | zero allowed; relative tangent≤1 | Inertial condition sufficient | None |
| 5.1 first three families | all nine parameters, both γ₃ signs | 27 models; corrected Frobenius/monodromy residuals0; t begins2±u⁶ | All three families consistent | None |
| 5.1 exceptional family | all nine(c,c′); (1,0),(0,1) | corrected residuals0; unit cross term1; N(e′)=u³⁰ at c′=1 | Wrong diagonal polynomial fails | None |
| 5.2 generic Ext/classification | nine parameter pairs | type-split line{(0,0),(1,2),(2,1)}; peu line{(0,0),(0,1),(0,2)}; only origin globally split | Lines distinct | None |
| 5.2 parameter comparison | (c,c′)=(1,0) | (c+c′,c)=(1,1) | Très class stays très | None |
| 5.3 reversed extensions | three extreme pairs; exceptional origin | dimensions0,0,0 versus2; zero parameters split | Exception retained | None |
| 5.4 diagonal extensions | weights2,6,10; all nine weight6 parameters | image dimensions1,2,1; nine weight6 models have corrected equation residuals0; c=1 gives N=−u²⁴ | Weight6 ramification possible | None |
| 5.5 coefficient actions | k=F₃,F₉ | graded ranks1+1=2; F₉⊗F₉ is product of2 fields | Whole model rank2 | Clarified ranks |
| 5.6 filtered conditions | zero,residual,split characters,E[9] | lengths0,1; split characters have0 residual filtrations; 3E[9]=E[3]≠0 | Higher torsion not tangent | None |
| 5.7 comparison vanishing | c=1,a₂=0,1 | coefficient of u² in a₂c u² is0,1; second not divisible by u⁶ | Forces a₂=0 | None |
| 5.8 tangent bounds | four pairs | at least one diagonal comparison0; common fixed-determinant kernel dimension1 | All bounds≤1 | None |
| 5.9 Artin deformations | N=1,2; T | at1 T=0; at2 T≠0,T²=T³=0; coefficient φ(T)=T | Absolute cube map rejected | Index ranges |
| 5.9 exact sequence | (N,M)=(2,1) | coefficient lengths1→2→1; Breuil ranks2→4→2 | M=N would invoke undefined M₀ | Added Check |
| 5.10 characteristic-three ring | D=(Z/9)²,F(x,y)=(-3y,x) | F²=−3; F(3,0)=(0,3)≠0, so F does not kill D[3] | Necessary hypothesis discriminates | None |
| 5.10 torsion argument | 9x=0,F killsD[3] | 3Fx=0; F²x=0=−3x | D[9]=D[3] | None |
| 5.11 exceptional type point | nonexceptional ring versus char0 field | source3=0,target3≠0; unital-map count0 | Only(6,6) possible | None |
| 5.12 extended acceptability | all3 indices | exceptional tangent≤1; normalized sign+1; opposite quotient Frobenius−1 outside hypothesis | Full G₃ shape retained | None |
| 6.1 local constancy | x=x₀; distinct cubic fibres | distance0 gives same torsion; peu/très coordinates(0,1),(1,0) differ | Neighborhood not whole curve | Explicit continuity |
| 6.2 cover | ordered bases; one-entry/both-entry sign | 48/2=24; pairing flips ζ↔ζ⁻¹ for one entry, stays fixed for both | One component versus2 | None |
| 6.3 global companion | determinant and SL image | card(SL₂(F₃))=24; determinant image2; product48 | Full GL₂ image | None |
| 6.4 six local cases | tame; wild cases2–6 | wild inertia orders1;3,3,12,12,12 | Tame has no prescribed très torsion | Case range |
| 6.5 lifting input | ℓ=3,5; split/nonsplit centralizers | quadratic parameters−3,5; split centralizer dimension2, nonsplit distinct-character dimension1 | Local hypothesis necessary | Imported theorem |
| 6.6 mod-three modularity | companion; reducible representation | image48; complex-conjugation determinant−1; weights1+1=2 versus1+2=3 | Correct weight-two step | None |
| 6.7 twist comparisons | quadratic χ at good p | trace χ(p)a_p; determinant multiplierχ(p)²=1 | Finite order alone not continuity | Continuity made explicit |
| 6.8 wild lifting | surjective residual image | quadratic restriction contains order24 SL; local endomorphism dimension1 | All lifting inputs match | None |
| 6.9 tame modularity | good/Tate branch | monodromy ranks0,1; conductor exponent≤2 | Ordinary/PBT cases distinct | None |
| 6.10 mod-five theorem | surjective image; rational5-torsion | invariant-line counts0,≥1; det conjugation−1 | Reducible input excluded | None |
| 6.11 exceptional classes | two mixed image cases | residual image orders8,16; both reducible allows Borel80 | Mixed j=0 branch not discarded | None |
| 6.11 fixed models | E50,E338 | (c₄,Δ,j)=(145,−800,−121945/32),(−143,−17576,1331/8) | Negative sign correct | None |
| 6.11 modular maps | constant versus nonconstant map | constant degree0; required degree>0; cusp image0 | Equation alone not enough | None |
| 6.11 smooth double cover | (2,−4),(1,−1),other finite points | branch value0; pole leading−44; other values17,8,−15,5/4,185/4 nonsquare | Poles treated on smooth model | None |
| 6.12 switch | Borel and exceptional2-group | orders80,16; both prime to3; wild3-image1 | Tame conductor branch | None |
| 6.13 elliptic modularity | y²=x³−x; singular rational model | Δ64; counts4,8; traces0,−2; singularΔ0 excluded | No semistable/non-CM restriction | None |

## Validation and dependency direction

The two actual dependency check outputs before and after the ownership repairs were, respectively, `depcheck: 34 roadmaps, 324 edges, 0 problem(s)` and:

```text
depcheck: 34 roadmaps, 326 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The merge-order file and repository-level list/configuration files were not changed. Final citation resolution finds no missing cross-roadmap citations or Lean names; because the service reported that it could not inspect pinned Lake sources, the library checks above were made directly in the actual pinned checkouts. Mathlib is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

## Unresolved items and limits

No unresolved port defect. The ten `sorry` warnings are the required headline acceptance signatures, not completed proofs. The computed tables test statements and conventions; they do not prove the general classification or modularity theorems. BBM remains a locator-only restricted-access secondary input and Serre's local-symbol source retains the package's waived access status; their uses are also covered by the directly readable BCDT classification and pairing arguments. No claim of having read restricted text is made. All requested open-head ownership checks were performed. No push, pull-request/issue write, comment or external message was made. Fetched text was treated as data; no instruction from it was executed.


Pull request: #1484 (roadmap/elliptic-curve-modularity-wild3-adic at f6083a5)
