# Review of AbelianSurfacesModularity (pull request #1746 at 223e025)

**Verdict:** needs changes

## R01 (P2) — Import the existing GSp₄-reasonableness contract

**Location:** `TauCetiRoadmap/AbelianSurfacesModularity/README.md:86`: “What ArithmeticGaloisRepresentations must provide (gap:near-adequacy-reasonableness)”.
**Claim:** The gap requests GSp₄ reasonableness and its adequacy comparison from a second owner, although an earlier supplier already provides the portion used in §§1.4 and 6.1.
**Witness:** PR #2268, `TauCetiRoadmap/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:586–592`, supplies eventual cyclotomic H⁰/detection, conditional H¹, and the adequacy implication in §5.2; its scope at line 12 explicitly owns GSp₄-reasonableness.
**Repair:** Import OrdinaryAutomorphicFormsAndModularityLiftingPartII §5.2 in the scope, supplier contracts and the Needs lines of §§1.4 and 6.1. Exclude that already-owned GSp₄ theory from the requested general reductive-group extension, identifying any genuinely additional contract separately.

## R02 (P2) — Use the supplied small-dimensional monodromy theorem

**Location:** `TauCetiRoadmap/AbelianSurfacesModularity/README.md:98`: “What FaltingsFinitenessAndIsogenyTheorems must provide (gap:surface-open-image)”.
**Claim:** This gap is not minimal: the roadmap already imports SatoTateGroups §9.10, which supplies the required conclusion without a principal-polarization restriction.
**Witness:** PR #1725, `TauCetiRoadmap/SatoTateGroups/README.md:2314–2325,2512–2535`: for dimension two, Gℓ¹=TL(A)⊗ℚℓ. If End⁰(Ā)=ℚ, TL(A)=Sp₄. Its §§9.2–9.3 supply finite-base-change and isogeny invariance.
**Repair:** Replace the gap with: “Consume SatoTateGroups §§9.1–9.4 and 9.10: scalar geometric endomorphisms give TL(A)=Sp₄, hence every rational ℓ-adic Zariski closure contains Sp₄; finite base change and isogeny preserve this conclusion.” Update the matching gap record and consuming Needs lines.

## R03 (P3) — Restrict the description’s cuspidal-transfer assertion

**Location:** Pull request #1746, `roadmap-summary` block: “Each modular surface has every finite Euler factor equal to that of a cuspidal GL₄ transfer”.
**Claim:** This contradicts the head’s isobaric definition of modularity and its product examples.
**Witness:** `TauCetiRoadmap/AbelianSurfacesModularity/README.md:222,232,239`: two non-isogenous modular elliptic curves give constituents of ranks 2+2; isobaric uniqueness excludes replacing their sum by a cuspidal rank-four witness.
**Repair:** Replace that sentence with: “The Layer 6 endpoints have cuspidal GL₄ transfers matching every finite Euler factor, entire continuation and Λ(s)=±Λ(2−s); the endomorphism-type complements also allow isobaric witnesses.”

## R04 (P3) — Correct the prose’s supplier classification

**Location:** Pull request #1746, Dependencies paragraph: “Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite.”
**Claim:** Several open suppliers are absent from the preceding prose list. The quoted sentence incorrectly classifies them as consumers, even though the generated dependency block recognizes them.
**Witness:** `TauCetiRoadmap/AbelianSurfacesModularity/README.md:128` consumes GSp4NonregularModularityLifting §§2.5–2.6 and 11.2–11.6, whose open addition is PR #1817; that roadmap is absent from the prose list.
**Repair:** Replace the quoted sentence with: “This new roadmap consumes the suppliers named in its Exact supplier contracts, including GSp4NonregularModularityLifting, PotentialAutomorphyInfrastructurePartII, HyperellipticCurves, CurvesOverFiniteFields, AbelianVarietiesOverFiniteFields and SatoTateGroups; the dependency block lists the open suppliers.”

## Verified sound

| Statement | Instances tried | Computed values | Required value / result | Change |
|---|---|---|---|---|
| Conventions: Frobenius and duality | Elliptic trace 1 over 𝔽₃; inverse Frobenius | Q=X²−X+3; L=1−T+3T²; inverse determinant=1/3 | Determinant 3, not 1/3; H¹ weights 0,1 | None |
| Conventions: signs and normalization | Alternating block; functional equation | J₂²=−I; 0↦2; 1↦1 | Alternating sign; centre 1 | None |
| §0.1 modularity, products and exterior powers | E₁×E₂; exterior degrees 0,…,5 | Constituent ranks 2+2; exterior ranks 1,4,6,4,1,0 | Isobaric witness; rank-four cusp not forced | R03 |
| §0.2 distinguishedness | Traces −1,2 at 3; E×E | Q=X⁴−X³+4X²−3X+9; Q mod 3=X²(X+1)²; E×E gives Q_E² | Four distinct characteristic-zero roots; residual repetition allowed; square fails | None |
| §0.2 quadratic twists | Ordinary Y×Y′ at 2 | Unit roots α,−α; difference 2α≠0; signs coincide mod 2 | Distinguished, despite equal residual signs | None |
| §0.3 all-place comparison and analytic endpoint | Ranks 4 and 2; surface Hodge numbers | Twists −3/2,−1/2; h¹⁰=h⁰¹=2; centre=1 | GL₄ exponent −3/2; Γℂ(s)²; product excluded by irreducibility | None |
| §1.1 outer class partition | Ten listed sizes; central quotient | Sum 25920; PGSp₄ order 51840; 2C square −I; 2D square I | Exactly half the projective group; lift signs agree | None |
| §1.1 separating actions | 4C/4D; 6G/6H | Forty-point lengths total 40; twenty-seven-point fixed counts 1/5 and 3/0 | Both actions distinguish the ambiguous pairs | None |
| §1.2 projective Frobenius | ±g lifts; scalar matrices | (−g)²=g²; ν(±I)=1; ν(Frob₂)=−1 | Lift independence; scalars cannot be outer Frobenius | None |
| §1.3 regular semisimplicity | Fifth-root quartic over 𝔽₃; repeated quadratic | gcd(X⁴+X³+X²+X+1,Q′)=1; a quadratic square has gcd degree ≥2 | First regular; square not regular | None |
| §1.4 permitted images | Full GSp₄(𝔽₃); excluded rows | Orders 103680 and 51840; 25−(4+3+3)=15 | Fifteen permitted classes; full image included | R01: supplier |
| §1.5 failure of GL₄ adequacy | Adjoint decomposition; square-zero coefficients | 16=10+6; (1−ζ₃)²=−3ζ₃; ε≠0 in 𝔽₃[ε]/ε² | Cohomological obstruction not erased by a reduced-only calculation | None |
| §2.1 explicit even-subset basis | (12), (12)(34)(56), (12345) | Orders 2,2,5; pairings e₁·e₄=e₂·e₃=1, e₁·e₂=0 | Native alternating pairing and specified permutation action | None |
| §2.1 distinguishing involutions | (12) and (12)(34)(56) | Matrices have rows 1001/0100/0010/0001 and 1010/0101/0010/0001 | Different involutions despite identical order | None |
| §2.2 rational Weierstrass points | Trivial image, S₅(b), S₅(a) | Fixed letters 6,1,0; nonzero 2-torsion points 15 | Marked point exactly for a fixed letter | None |
| §2.3 strong residual oddness | Four involution types | Ranks of g−I: 0,1,2,2; symmetric diagonals 0000,1000,1100,0000 | Nonzero diagonal distinguishes the two rank-two cases | None |
| §2.4 simple A₅ modules | Identity, 3-cycle, 5-cycle | Dimensions 1,2,2,4; V traces 4,1,−1; (U⊕Uσ)(3-cycle)=−2 | Four-dimensional simple differs from the reducible alternative | None |
| §2.5 near adequacy | Odd-order elements on the four-dimensional module | 45 matrices span dimension 16; dim(k⊕V)=5 | Full endomorphism span; socle dimension 5 | None |
| §2.5 adequacy obstruction | Perfect A₅; central scalar sequence | H¹(A₅,k)=0; H²(A₅,k) has dimension 1 | H¹(ad/k)≠0 despite H¹(ad)=0 | None |
| §2.6 CM restriction | A₅ and an index-at-most-two subgroup | A₅ order 60; a proper index-two subgroup would have order 30 | Perfectness forces unchanged A₅ image | None |
| §3.1 residual automorphy | Sign kernel; order-five character; symmetric cube | 120/2=60; χ³ still order 5; cube weights 0,1,2,3 | Sign-kernel A₅; weight change needed for 0,0,1,1 | None |
| §3.2 dyadic modularity | Polarization type (1,2); real involutions | Polarization degree 4; signs of double/single transpositions +1/−1 | Nonprincipal mod-2 pairing is not silently substituted; required real class even | None |
| §4.1 ordinary Weil predicate | X⁴−X²+4; (X²+2)²; zero polynomial | Middle coefficients −1,4; constant terms 4,4,0 | First ordinary, second nonordinary, zero excluded | None |
| §4.1 reciprocity and total division | Q=X⁴−X²+4; x=1,0 | Q(2)=16=4Q(1); uncancelled expression at 0 gives 0 versus 16 | Exclude x=0 in rational expression; polynomial identity retains constant 16 | None |
| §4.2 ordinary quartics at 2 | All integral coefficients satisfying root bounds | 16 quartics; grouped counts 3+1+4+2+2+4=16 | Six polynomial families have the asserted total | None |
| §4.3 three local Jacobians | C₁,C₂,C₃ over 𝔽₂ and 𝔽₄ | Point pairs (5,7),(3,7),(3,3); (a,b)=(2,3),(0,1),(0,−1) | Q(1)=14,6,4; all b odd | None |
| §4.4 dyadic equation loci | All 2¹¹ coefficient tuples, both projective charts | 2048 equations; 768 smooth; 384 ordinary and 384 nonordinary | Counts match; infinity smoothness is essential | None |
| §4.4 ordinary polynomial distribution | Smooth ordinary dyadic equations | Counts for ten quartics: 16,48,48,48,16,48,48,48,48,16 | Total 384; six of sixteen ordinary Weil quartics absent | None |
| §4.4 curves without rational sections | h=1+x²+x³, f=1+x⁵+x⁶ | Point counts over 𝔽₂,𝔽₄: 0,6 | Smooth curve may lack a residue-field point | None |
| §4.5 paired Weil restriction | F=((0,M),(I,0)), B=diag(J₂,2J₂) | FᵀBF=2B; rank(F²+I)=2; (F²+I)²=0 | Nonsemisimple; not class 2C | None |
| §4.5 twenty-seven-point action | Primitive exterior-square orthogonal frames | 45 q=1 lines; 27 frames; cycles 3⁵·6²; fixed frames 0 | Class 6H with the descended product polarization | None |
| §4.5 nonprincipal polarization control | u=4+π+V; (π+V)²=5 | Rosati values 4±√5>0; degree=(16−5)²=121; 121 mod 3=1 | Prime-to-3 polarization need not be principal | None |
| §4.6 toric conclusion | Good nonordinary Y; toric rank one | Y has b=2, Q(1)=7, toric rank 0; X²+1 takes 1,2,2 on 𝔽₃ | Bad-or-ordinary hypothesis excludes Y; rank-one residual line impossible | None |
| §4.7 product and twist seeds | Tate q=64; ordinary Y and its twist | v₂(q)=6; residual Tate 3-torsion μ₃⊕ℤ/3; Q_YQ_Y′=X⁴+3X²+4 | Unramified residual torsion; distinct unit roots ±α | None |
| §4.7 positive coupled periods | u²=u+1; t=u³; q=8000 | t²=8u+5; N(t)=−1; v₂(q)=6; valuation form=6(m²+n²) | Positive for nonzero lattice vectors; inverse periods fail positivity | None |
| §4.7 odd-theta pairing | Coupled and uncoupled Gram forms | Both have six odd refinements; fixed odd refinements 2 versus 0 | Coupled construction lands in S₅(b); product pairing does not | None |
| §4.8 marked rational moduli | Fine level 3; level-two cover; product locus | Dimensions 3 and 2; 720/120=6; subgroup degrees 120 and 1 | Dense Torelli open; six odd-theta choices; full subgroup gives identity cover | None |
| §4.9 semistable class-6G point | Stated bad-reduction example versus good Y | Toric rank 2 versus 0; roots i,−i distinct | Ordinary distinguished seed uses the bad-reduction point | None |
| §4.10 exact local realization | Ten outer classes | Four good possibilities; eight semistable possibilities; two excluded | {4C,12C} excluded; 2C and 6G retained semistably | None |
| §4.11 triadic equation loci | All 3⁷ coefficients with squarefree degree 5 or 6 | 2187 equations; 1296 smooth; 864 ordinary; 10 square quartics | Exactly 854 ordinary distinguished equations | None |
| §4.11 rational marking | Ordinary squarefree quintics; scalar Hasse–Witt matrices | 240 quintics; 10 scalar matrices; scalar/square disagreements 0 | No non-distinguished ordinary quintic | None |
| §4.12 scalar products | E₋₁×E₂ and E₁×E₋₂ | Q(1)=10,18; étale Frobenius scalars −1,+1; integer quartics nonsquare | Distinguished product special fibres; good curve reduction impossible | None |
| §4.13 all ordinary local modules | Six invertible quadratic polynomials over 𝔽₃ | Eight conjugacy classes: four distinct-root cases, two scalars, two Jordan blocks | Scalar and nonscalar repeated-root cases separately supplied | None |
| §4.13 scalar versus Jordan marking | F=±I and a nontrivial Jordan block | dim ker(F∓I)=2 versus 1; scalar products have mod-2 order 6 | Polynomial alone does not determine the ordinary module | None |
| §5.1 local switch condition | Classes 2D,4C,12C | 2D has a semistable seed but no good ordinary seed; excluded classes count 2 | Equivalence allows semistable reduction; no local-at-3 premise needed | None |
| §5.2 2–3 switch | Real quintic with one real root | Six branch points: two fixed, two conjugate pairs; real permutation sign +1 | Double transposition, not a single transposition | None |
| §5.2 approximation input | Nodal rational curve y²=x²(x−1) at the real origin | Origin isolated; smooth rational locus misses that open singleton | Supplied approximation requires smoothness; moduli threefold satisfies it | None |
| §5.3 infinite fixed-mod-3 realization | Fibre over a fixed genus-two curve | At most 6·103680=622080 marked framings; parameter dimension 3 | Finite fibres cannot exhaust the Hilbert points | None |
| §6.1 modularity transfer | p=3; identity residual image; ordinary weights | Weights 0,0,1,1; identity image has no regular rank-four element | Nonregular lifting required; trivial residual image excluded | R01: supplier |
| §6.2 fifteen-image modularity | Product of two non-isogenous elliptic curves | End⁰ contains ℚ×ℚ, dimension ≥2 rather than 1 | Product fails geometric End=ℤ hypothesis | None |
| §6.3 surjective-mod-3 modularity | Full image; forbidden quadratic square | Image order 103680; (X²+X+2)² mod 3=X⁴−X³−X²+X+1 | Full image passes §1.4; dyadic polynomial exclusion remains separate | None |
| §6.4 ordinary genus-two modularity | Dyadic curve classes; triadic exception locus | Five ordinary dyadic classes avoid 4C,12C; 10/864 triadic equations fail distinguishedness | Good ordinary reduction alone at 3 does not remove the extra premise | None |
| §6.5 quintic modularity | Squarefree quintic; repeated root; exceptional ordinary equations | 5+1=6 branch points; repeated-root discriminant 0; exceptional marked count 0 | Marking forces 3-distinguishedness only with good ordinary reduction | None |
| §6.6 bad-at-2 modularity | Forbidden roots over 𝔽₉; rank-two integral torus | Root order 8; finite GL₂(ℤ) orders 1,2,3,4,6; their sign twists still exclude 8 | Forbidden Frobenius cannot occur with positive toric rank | None |
| §7.1 potentially abelian decomposition | ab=4; reducible 1²⊕ε⁻¹² | (a,b)=(4,1),(2,2),(1,4); reducible control has two character orbits | Irreducibility forces one orbit; b=1 excluded | None |
| §7.1 exterior-square convention | C₂; trivial rank-two inducing representation | Exterior trace −2; determinant-induction trace 0; As⁺ trace +2; ηAs⁺ trace −2 | Quadratic-character twist is necessary | None |
| §7.1 cuspidal induction | ψ=ψ₀∘Norm; quartic totally real field | Quadratic induction splits as ψ₀⊕ψ₀η; totally real exponents all wt/2 | Irreducibility and non-finiteness exclude both controls | None |
| §7.2 endomorphism dictionary | ℝ×ℝ with trivial or swapping C₂-action | Fixed-algebra dimensions 2 and 1; six real algebra types | Action, not just underlying algebra, determines Galois type | None |
| §7.3 modularity by type | Rational type count; finite-up-to-twist control | 34−2=32; surface Hodge weights have two values, scalar-twisted finite systems one | Exceptions A and B[C₂] retained; surface system not finite up to twist | None |
| §8.1 coefficient-box density | Dyadic and triadic admissible loci | (768−144)/2048 × (864−10)/2187 = 5551/46656 | Positive lower density; thin-set proportion tends to 0 | None |
| §9.1 fixed-mod-2 family | Split branch algebra; θ=(0,1,2,3,4,5); θ=0 | Fifteen nonzero pairwise differences; dim Z⁺=7; χ₀=T⁶; discriminant 0 | Separable open includes first, excludes zero | None |
| §9.1 quadratic twists | Leading coefficients 1,2,0 over ℚ | Infinities rational for 1, conjugate over ℚ(√2) for 2; c=0 singular | Allow G_m factor; six-point action unchanged by nonzero twist | None |
| §9.2 trivial Frobenius obstruction | Six rational branch points; elliptic full 2-torsion at 3 | #ℙ¹(𝔽₃)=4<6; Hasse interval [1,7] has only multiple of four 4 | Trace 0, hence nonordinary elliptic product control | None |
| §9.3 ordinary realization | Legendre E/𝔽₉ with t²=−1 | #E=8; trace 2; restriction polynomial X⁴−2X²+9; Q(1)=8 | Ordinary distinguished seed; mod-2 type [2,2,2] has zero fixed letters | None |
| §9.3 dyadic Frobenius types | Ordinary dyadic equation locus | Cubic Frobenius orders 1,2,3 occur 16,144,224 times; total 384 | All three ordinary étale possibilities occur | None |
| §9.4 residual modularity | A₆,S₆ images; an element of order five | Group orders 360,720; ord₅(2)=4 | Order-five action cannot preserve an ordinary rank-two quotient | None |
| Surface-open-image contract | Geometric End⁰=ℚ; a nonprincipal rational polarization | C_Sp₄(ℚ)=Sp₄; dim Sp₄=10; TL(A)=Sp₄; Gℓ¹=Sp₄ | Already follows from SatoTateGroups §9.10 | R02 |
| Reasonableness contract | p=3; GSp₄ and its dual adjoint | dim 𝔰𝔭₄=dim 𝔰𝔭₄∨=10; H_n=H₁ when H¹(H₁,k)=0 | Same GSp₄ condition and comparison in supplier §5.2 | R01 |
| PR supplier classification | GSp4NonregularModularityLifting | One open supplier omitted from prose list; seven section inputs named in contract | Prerequisite count is not zero | R04 |

- Previous review: 1/1 finding repaired; README line 67 now says “Their specialization in this roadmap's §4.1”, resolving the former supplier-section ambiguity.
- Sources: all 15 seeded targets checked at their theorem/page locators in BCGP25, including Definitions 1.8.10/9.1.2, Lemmas 8.1.3–8.2.1, 9.1.3/9.1.6, 9.3.1/9.3.7, 9.4.2, Theorems 9.5.1–9.5.5 and A/B; 5 further wording samples compared across 5 readable works.
- Pins: 17 declarations opened, including `Mathlib/LinearAlgebra/SymplecticGroup.lean:58,101`, `Mathlib/RepresentationTheory/Basic.lean:48`, `Mathlib/Algebra/Polynomial/Roots.lean:479`, `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`, `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Purity.lean:98`, `TauCeti/RepresentationTheory/PGroupInvariants.lean:161`.
- Suppliers: 32 named supplier contracts inspected, with 135 numbered section lookups and the GT.3 numbering map resolved; 16/16 gap slugs occur in both README and plan, 2 duplicate supplied work; no second copy on main or dropped-id overlap reported.
- Dependency output: `depcheck: 222 roadmaps, 1972 edges, 0 problem(s)`; 0 UPWARD/CYCLE lines.
- Gate: all checks pass at 223e025, including targeted build, statement hygiene, source material and outside-folder scope; independent Lean elaboration exits 0 with 0 warnings; worktree unchanged.
- Headlines: §0.3, §§3.1–3.2, §4.10, §§5.2–5.3, §§6.1–6.6, §§7.1–7.3, §8.1 and §§9.3–9.4 are all covered by the module’s missing-carrier explanations; 0 Lean declarations, 0 signature-probe candidates, 0 padding candidates.

Overlap check: read OrdinaryAutomorphicFormsAndModularityLiftingPartII, GSp4NonregularModularityLifting, ModularityAndLanglandsExtensions, EllipticCurveModularityImaginaryQuadratic and PotentialAutomorphyInfrastructurePartII from the closest-roadmap lists, plus SatoTateGroups; reasonableness belongs to OrdinaryAutomorphicFormsAndModularityLiftingPartII §5.2, nonregular lifting to GSp4NonregularModularityLifting §§11.2–11.6, Artin/tensor transfers to ModularityAndLanglandsExtensions §§1.9/1.11/1.13, relaxed adequacy and polarized lifting to PotentialAutomorphyInfrastructurePartII PL.4, and small-dimensional monodromy to SatoTateGroups §9.10; no surface endpoint is shared with EllipticCurveModularityImaginaryQuadratic.

Source independence: 20 selected passages compared with 5 sources; no copied expression identified. Largest share BCGP25, 162 of 183 source-labelled locator groups outside References. Contents compared: independent; Layer 4 combines source §§9.1–9.3, Layer 7 takes §10.2 before Layer 8 takes §10.1, and Needs edges §4.13→§5.2→§6.2 and §2.6→§3.2→§6.2 force the central assembly order. Finite classifications are stated as mathematical facts with locators, not reproduced source figures or tables.

## Not verifiable

- KIS99 Theorem 5.1: settled uncertified publisher text; no readable cached copy supplied; cited by locator alone, without reopening the request.
- THORNE17 Definition 2.20: settled uncertified publisher text; the near-adequacy comparison was separately checked in BCGP25 Remark 8.2.3.
- FC90 II Theorem 6.2/Remark 6.3 and III Theorem 7.1/Corollaries 7.2–7.4: settled uncertified text; general algebraization checked as a supplier contract, not certified from the book.

## Source issues

- **Misprint** in BCGP25 at proof of Lemma 9.1.6(2), printed p.190, line 8754: the source says lift squares for 2C and 2D are I and −I; it should be −I and I respectively; affects the proof.
- **Error** in BCGP25 at Lemma 9.2.13, printed pp.196–197, line 9083: the source says its three residual hypotheses force purely toric reduction; it should be restricted to bad or ordinary reduction, excluding the good nonordinary curve of §9.2.16; affects a stated result.
- **Misprint** in BCGP25 at proof of Lemma 9.2.14, printed p.197, lines 9111–9130: the source says the Tate curve has trivial mod-3 representation and uses I⊗R; it should be μ₃⊕ℤ/3 and diag(−R,R), with multiplier −1; affects the proof.
- **Error** in BCGP25 at proof of Lemma 9.2.14, printed p.198, line 9169: the source says the product-polarized tensor seed has centralizer order 16 and fixes a Weierstrass point; it should be order 48 with zero fixed odd theta characteristics; a different polarized construction is needed; affects the proof.
- **Misprint** in BCGP25 at §9.2.16, printed p.198, line 9182: the source says the good genus-two curve has Weil polynomial X⁴+2X²+1; it should be X⁴+2X²+4; affects a stated result.
- **Error** in BCGP25 at proof of Lemma 9.3.7, printed p.203, lines 9413–9417: the source says E₋₁×E₂ realizes trivial étale Frobenius V; it should be scalar −1, with E₁×E₋₂ realizing scalar +1; affects the proof.
- **Misprint** in BCGP25 at proof of Lemma 9.3.7, printed p.203, lines 9424–9440: the source says its two displayed matrices represent (12)(345) and (125346) in the specified basis; it should be their inverses under the column-action convention; affects nothing.
- **Error** in BCGP25 at Lemma 9.4.1, printed p.204, lines 9470–9478: the source says every rational variety permits the asserted local approximation; it should be smooth, since y²=x²(x−1) has an isolated real singular point; affects a stated result.
- **Misprint** in BCGP25 at proof of Lemma 9.4.1, printed p.204, lines 9483–9486: the source says projective height counts have exponents n and n−1/2; it should be n+1 and n+1/2 for standard multiplicative height on ℙⁿ; affects the proof.
- **Error** in BCGP25 at proof of Theorem 9.5.5, printed p.209, line 9696: the source says the entire rational Tate representation factors through the finite torus-splitting quotient; it should be the toric character representation, or the corresponding unramified quotient; affects the proof.
- **Misprint** in ZARHIN00 at §5 opening, printed p.5, line 197: the source says A is the unique index-two subgroup of G, allowing G=A_n; it should be the unique index-two subgroup of S=S_n; affects nothing.

## For the human reviewers

- none
