<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1396#issuecomment-6397641439 -->
Review (codex) of 73d32d0

Verdict: accepted
Conditional on the announced gaps: `polynomial-forms-de-rham`, `sullivan-minimal-models`, `sullivan-quasi-isomorphism-rigidity`, `sullivan-homotopy-lifting`, `sullivan-scalar-extension`, `compatible-good-cover-refinement`, `geometric-mixed-hodge-realization`, `arbitrary-base-weight-filtration`, `normal-h1-weights`, `normal-variety-unipotent-category`

1. **F01** (P3) Correct the DGAInfinity input locators

   **Location.** packages/EllAdicHomotopyTypesAndWeights/README.md:51: “Layer 1 supplies the DG category, tensor construction, quasi-isomorphisms and localization”; “Layer 8 supplies the formality predicate and its Massey consequences”. The localization attribution recurs at line 153.

   **Claim.** These inputs exist, but the cited layers do not locate them accurately. DGAInfinity Layer 3 defines its formality predicate; Layer 8 supplies its Massey theory and formality criteria. Generic categorical localization is already a pinned Mathlib construction, imported by DGAInfinity rather than constructed in its Layer 1.

   **Witness.** TauCetiRoadmap/DGAInfinity/README.md:229 imports localization; line 355 defines formality. Mathlib/CategoryTheory/Localization/Construction.lean:106 defines MorphismProperty.Localization, and line 111 defines its functor Q. Layer 1, lines 293–315, has no localization construction.

   **Exact repair.** Cite CategoryTheory.MorphismProperty.Localization and CategoryTheory.MorphismProperty.Q in the Mathlib contract, applied to the supplied DG-algebra category and its quasi-isomorphisms. Correct line 153 and §0.1’s Needs accordingly. Attribute the formality predicate to DGAInfinity Layer 3 and its Massey consequences to Layer 8, retaining both where §8.2 uses them. This needs no new supplier gap: the construction and predicate already have owners.

   **Test of repair.** The pinned signatures of Localization and Q elaborate for an arbitrary category and morphism property. The construction imposes both inverse relations for every selected arrow. For a↦2a on Λ(a₁) over ℚ, the selected quasi-isomorphism has inverse a↦a/2; both composites act by 1. No enriched or monoidal localization theorem is being inferred from the generic construction.

2. **F02** (P3) Remove the two remaining duplicate Checks

   **Location.** packages/EllAdicHomotopyTypesAndWeights/README.md:692: “For an even-sphere model with weight(x₂)=2 and dy=x², weight(y₃)=4”; line 739: “a filtration-lowering shear is identity on Gr^W but can be nonidentity on the filtered vector space.”

   **Claim.** These repeat the stronger Checks at lines 690 and 742 respectively. This is the remaining instance of previous finding F08, not a new mathematical failure.

   **Witness.** README:690 already computes sphere weights (2,4) and rejects (2,3). README:742 gives the shear explicitly: b↦b+a fixes both graded lines but changes [b] to [b]+[a].

   **Exact repair.** Delete the Check at line 692 and the Check at line 739; keep lines 690 and 742. No Lean declaration should be added.

   **Test of repair.** The retained sphere Check gives w(dy)=w(x²)=4 and rejects 3=4. The retained shear gives Gr(g)=identity but H¹(g)([b])=[b]+[a]≠[b]. Each affected definition retains four Checks, exceeding the required three.

Two P3 corrections; no P1 or P2 finding. Acceptance is conditional on the ten declared supplier contracts listed below. The inaccessible board heads and two settled uncertified texts are recorded under Not verifiable; no assertion of ownership clearance is made for those inaccessible files.

## Verified sound

The authored README, Suggested.lean, metadata, source manifest and design plan were read without modification. All 36 numbered targets, their 36 Needs lines, conventions, APIs, Checks and worked examples were reviewed. The nine layers each have Examples and Dependencies. The 15 definition/API blocks have respectively 4, 6, 3, 5, 5, 5, 4, 3, 3, 4, 3, 3, 5, 5 and 6 Checks in §§0.1, 1.1, 1.2, 1.3, 2.1, 3.1, 3.2, 3.4, 3.5, 4.1, 6.1, 6.3, 6.5, 7.1 and 8.3. R02 does not jeopardize the minimum. The README shape was compared with main’s TauCetiRoadmap/ComplexTori/README.md, TauCetiRoadmap/DerivedModuleAlgebra/README.md and Completed/HodgeStructures/README.md.

The previous review and repair report were read first. Their assertions were treated as claims to check. Earlier computed examples were recomputed for the changed passages and sample; no earlier uncomputed “sound” summary was treated as evidence. There is no settled “not actionable in this package” finding to re-raise.

### Previous findings, checked individually

All locations in this table are in packages/EllAdicHomotopyTypesAndWeights unless another repository path is given.

| Prior finding | Repaired passage and verification | Disposition |
| --- | --- | --- |
| F01: supplier-free G1–G8 | README:65: “What AlgebraicTopologyPartII must provide (gap:sullivan-minimal-models)”. All ten design/plan.json gap records now have slug, supplier, section and needs; each needs sentence matches its README contract. Coefficient resolution, limit exactness verification, finite blocks and compatible pro-lifting remain owned in §§2.2–2.4, 3.3–3.4, 6.2, 6.6 and 7.2. | Repaired. No supplier-free record remains. |
| F02: duplicate strict CDGA predicates | README:143: “use DerivedDeRhamCohomology §2.21’s strict graded-commutativity and odd-square-zero predicates”. Scope:9, contract:75 and Needs:155 agree. The earlier owner’s §2.21 was opened at head 83d00dd. | Repaired. The characteristic-two negative control still distinguishes the predicates. |
| F03: mixed-Hodge supplier cycle | README:107: “What MotivicEtaleKTheory must provide (gap:geometric-mixed-hodge-realization)”. Its §§3.2/3.4 own the smooth realization; README:115 obtains general proper compactifications separately from projective SNC compactifications. Needs:564 follows the new ownership. | Repaired. ComplexComparisonPartII is a predecessor of MotivicEtaleKTheory; no reverse edge is required. |
| F04: good-cover duplication and étale comparison overlap | README:522: “use the compatible analytic good-cover system supplied by ComplexComparisonPartII’s compatible-good-cover-refinement contract”. Scope:13 distinguishes the raw pro-nerve comparison on separated finite-type varieties from EtaleHomotopyTypes EH.6’s completed, quasi-projective comparison. | Repaired. Both compute H¹ of the complex multiplicative group with rank 1. |
| F05: compound Sullivan/weight gaps | README:63–71 has five separate Sullivan contracts; README:123 separately states “gap:normal-h1-weights”. The obsolete connected-sullivan-interface slug and supplier G3 citation are absent. | Repaired. Each contract asks for one construction or theorem and its structural laws. |
| F06: omitted realization headline and process wording | Suggested.lean:21: “The étale realization theorem for separated finite-type varieties lacks A_ℓ and the étale ℚ_ℓ cohomology ring of a variety.” The process sentence is gone. | Repaired. §4.1 is now among the 19 explicitly identified headlines. |
| F07: native/supplier locators | README:41 locates SSet.chainComplex and ChainComplex.linearYonedaObj in Mathlib; README:55 cites AlgebraicTopology Stage 4 item 7; README:87 cites AdicSpacesPartII R0.19.9; README:367 cites EH.0; README:143 cites the exterior factor in Weil II 5.1.6.3. | Repaired for every original item. R01 records a separate misplaced input attribution found by the repeated locator audit. |
| F08: repeated Checks | Many repeated point, completion, conjugacy and finite-group examples have been consolidated. However README:690/692 still give the same sphere computation, and README:739/742 the same shear computation. | Partly repaired; R02 gives the remaining exact deletions. |
| F09: coefficient spelling and integral exactness | README:470: “tγ_(ℓ−1)=ℓγ_ℓ”; README:355: “dx₁=d(x₁) is exact”. A_ℓ and ℓ are consistent through the completed construction. | Repaired. At ℓ=2, tγ₁=2γ₂; at ℓ=3, tγ₂=3γ₃. Neither scalar is an integral unit. |

### Source verification

All seven available legal cached works were read where used: weil-II, sullivan, morgan, morgan-correction, dgms, poids and hodge-III. No new source or manifest key was needed. No unverified locator is hidden behind a claim of having read Miller or SGA 5. Their settled uncertified status is preserved.

Each of the 15 seeded targets was compared with the source text, not only its table of contents. The numbers below are printed pages and the supplied extraction’s numbered lines.

| Seeded target | Locator opened | Support and hypothesis audit |
| --- | --- | --- |
| 1.3 Relative divided-power forms | weil-II line 3698, 5.1.6.1–3, p. 235; intrinsic construction at line 3710 | Γ(L) tensored with an alternating algebra, quotient by dt, and arbitrary coefficient extension are present. The finite nonempty vertex module has the required free diagonal quotient. No t=1 integral quotient is substituted. |
| 1.4 Pullback | weil-II line 3720, 5.1.6.4, p. 236 | Coordinates pull back by fibre sums. The formula applies to arbitrary vertex maps, including repeated and omitted vertices; divided powers of a sum require mixed terms. |
| 2.1 Compatible forms | weil-II line 3740, 5.1.8, p. 236 | Compatible maps into each simplicial coefficient object precede the direct sum over bidegrees. This matches uniform finite t-support and is not an arbitrary product totalization. |
| 2.3 Integral comparison | weil-II line 3682, 5.1.4.2–5, p. 235; line 3751, 5.1.9(b), pp. 236–237 | The triangular range p≤n and divided-power product normalization are present. Arbitrary rings remain allowed. The package corrects the excessive quotient assertion separately in §2.4. |
| 3.5 A_ℓ of a pro-simplicial set | weil-II line 3792, 5.2.1.6–8, p. 238 | Completion precedes rationalization and stabilization; finiteness (F) is retained. The normalization γₙ↦1/n! makes the cohomology comparison multiplicative. |
| 4.3 Nerve-to-étale map | weil-II line 3835, 5.2.4, p. 239 | The countable field-of-definition covering system and good analytic covers give the pro-map in the stated direction. The cover construction is an explicit supplier contract, not silently proved by Artin comparison. No compactness hypothesis is inserted. |
| 4.4 Complex minimal models | weil-II line 3844, Construction 5.2.5, p. 239 | The algebra comparison and scalar-extension zigzag are supported. The package asks for minimal models only on connected components, using the separately contracted Sullivan existence/rigidity results. |
| 6.1 Exhaustive finite-type filtrations | weil-II line 3867, 5.3.1, p. 240 | Finite-dimensional cohomology supports an exhaustive filtration by finitely generated subalgebras. This is not finite dimensionality of an entire model degree when degree-one generators occur. |
| 6.3 Generalized eigenvalue grading | weil-II line 3874, continuation of 5.3.1, p. 240 | Finite stable pieces permit generalized eigenspaces over an algebraic closure. Product indices multiply. Semisimplicity is not assumed. |
| 6.6 Common filtration | weil-II line 3934, Lemme 5.3.5, p. 241 | The statement concerns a finite set of actual automorphisms, not a finite group. Its proof is left to the reader. §6.6 explicitly owns the finite-block/orbit argument; the omitted proof is recorded below as a source gap. |
| 7.1 Weight extension | weil-II line 3919, proof of 5.3.4, p. 241; sullivan line 912, Theorem 6.1 and proof, pp. 289–294 | Filter-preserving automorphisms and pairs (g,λ) with graded action λ^w are the relevant algebraic groups. The package uses finite algebraic images and compatible restrictions, not unrestricted automorphism restriction maps. |
| 7.2 Splitting and conjugacy | weil-II line 3926, proof of 5.3.4, p. 241; sullivan line 1042, appendix, p. 295 | The source uses a unipotent extension and rational splitting/conjugacy. General characteristic-zero finite-stage Levi input is supplied by ReductiveGroups 6A. Compatible sections/conjugators in the pro-limit remain a theorem here, not an inference from unrelated finite-stage choices. |
| 7.3 Rational weight gradings | weil-II line 3916, Theorem 5.3.4, p. 241; preceding 5.3.3 at line 3897 | Rational existence and conjugacy on the associated graded of cohomology agree with the statement. The source permits general complex varieties; the geometric realization needed for singular ones is contracted explicitly. No canonical grading or homotopy-identity conjugator is claimed. |
| 8.1 Arbitrary algebraically closed base | weil-II line 3938, 5.3.6, p. 241 | The ℓ-adic weight splitting over arbitrary algebraically closed fields is stated. Independence of spreads is a named DeligneWeightsAndPurity contract; no rational complex model is asserted in positive characteristic. |
| 8.5 Normal-variety presentation | weil-II line 3956, 5.3.8, p. 242; poids line 152, §8.3, p. 82, and line 164, §10, p. 83; morgan line 2245, Theorem 9.4, pp. 198–199; morgan-correction line 29, p. 185 | Normality gives H¹ weights 1,2; dual generators have weights −1,−2 and relations −2,−3,−4. Morgan alone only supplies the smooth complex case. Poids/Weil II and the general normal Tannakian contract support the wider domain. The correction preserves Theorem 9.4. |

Additional changed proof inputs were read: Morgan Definition 5.3 and Theorems 5.6–5.7/Proposition 5.9, pp. 163–168 (morgan lines 1017–1184); DGMS Theorems 1.1–1.2 and 2.1, pp. 251–255 (dgms lines 270 and 448); Sullivan Theorem 7.1 and its polynomial-form example, pp. 296–299 (sullivan lines 1121–1161), and Theorem 8.1(ii), p. 301 (line 1289); Hodge III §§6.2.8, 8.1.19–8.2.4 and 8.2.10–11, pp. 20–21, 34–39 and 40 (hodge-III lines 582, 1071, 1194–1229 and 1279); Poids §§13–14, pp. 83–84 (poids lines 185–215); Weil II 5.3.7, p. 242 (weil-II line 3947).

These readings distinguish full connected-algebra existence from the simply connected spatial hypothesis in DGMS, the cohomological weight shift WₘHⁱ coming from complex Wₘ₋ᵢ, and proper smooth purity from projectivity. Sullivan’s finite-type spatial realization is not used as a theorem about every realizing space. The two coefficient errors and Morgan’s correction are not copied into the package.

### Computed adversarial pass

The table gives actual values, including failed alternative definitions. K is a characteristic-zero field; ℓ is prime; Λ denotes an exterior algebra or, where explicitly used as coefficients, a nonzero coefficient ring. γₙ is the divided-power basis. These examples test statements and conventions; they do not replace proofs of the general theorems. The ring, finiteness, normality, connectedness and invertibility hypotheses were checked separately in the prose.

| Statement | Instances tried | Values on the two sides / excluded model | Result; change |
| --- | --- | --- | --- |
| Conventions: signs, Frobenius, weights | Odd e over 𝔽₂; ℙ¹ at q=2; q=1; zero representation | Exterior e²=0, whereas 𝔽₂[e] has e²≠0 although −1=1. Geometric eigenvalues (1,2) have weights (0,2); inverses (1,1/2) give (0,−2). At q=1 every 1^(w/2)=1; zero spectrum is empty. | Strict odd squares and q>1 matter; no change. |
| Pro-map direction and size | Constant one/two-point small diagrams; identity refinement | Hom(*,*) has 1 element; Hom(*,{0,1}) has 2. Identity pullback fixes both (1,0),(0,1). Reindexing does not change these values. | Native small-diagram direction retained; no change. |
| §0.1 DG refinement and connectedness | Λ(a₁,b₁); zero algebra; odd polynomial algebra over 𝔽₂ | H⁰Λ(a,b)=K and [ab]≠0; zero algebra has H⁰=0≠K. Polynomial e²≠0 fails the supplied odd-square axiom. | Neither square-zero multiplication nor the zero algebra is admitted as the intended model; no change. |
| §1.1 Rank-one divided powers | n=0,1,2,3; ℚ, 𝔽₂, 𝔽₃; two maps to 𝔽₂[ε]/ε² | γ₀=1; γ₁²=2γ₂ and γ₁³=6γ₃, giving 0 in the respective characteristics although γ₂,γ₃ survive. Over ℚ, γ₂=t²/2. Maps can both send γ₁ to 0 but send γ₂ to 0 versus ε. | No factorial inversion integrally; checking γ₁ alone is insufficient. |
| §1.2 Bigrading and support | Integral edge; finite versus infinite support | Ω₀¹=0, Ω₁¹=R·dx₀; d(x₀) changes (0,1) to (1,1). γ₀+γ₂ has two supported t-degrees; Σₙγₙ has infinitely many and is excluded. | Correct differential and direct sum. |
| §1.3 Relative simplex forms | Point, edge, 𝔽₂; ramified and equal-characteristic DVRs | Point: x₀=t, dx₀=0, γ₂ survives. Edge: dx₀=−dx₁ and dγ₂(x₀)=x₀dx₀. Odd squares are 0 at 2. In ℤ₃[π]/(π²−3), tγ₂=π²γ₃, not πγ₃; in 𝔽₃[[π]], tγ₂=0. Setting t=1 over ℤ would force 2γ₂=1. | Quotient by dt and arbitrary base extension work; no DVR-uniformizer substitution. |
| §1.4 Pullback | Identity, omitted vertex, two/three-vertex collapse | Identity fixes γ₂. An omitted coordinate maps to 0. Both composite collapse maps give Σᵢγ₂(xᵢ)+Σᵢ<ⱼxᵢxⱼ; the coordinatewise-only formula omits nonzero mixed terms. | Contravariance and mixed terms verified. |
| §2.1 Compatible families | Point, empty set, adjacent edges | Point algebra is R{t}; empty algebra is 0 with 1=0. Values 0 and γ₁ at a common vertex disagree, while γ₁ and γ₁ glue. | Compatibility and empty input distinguished. |
| §2.2 Simplicial coefficient homotopy | (p,n,i)=(0,0,0),(0,1,0),(1,1,1); R=0 | Calculated groups are R,0,R. The basic normalized coefficient complex is R→R with differential identity and homology 0. Over the zero ring all three answers are 0. | Simplicial homotopy degree is not the form degree. |
| §2.3 Triangular integral cohomology | Circle; two-torus over 𝔽₂; empty set | H¹Ω₀=0; H¹Ωₙ=R for n≥1. (aγ₁)(bγ₁)=2abγ₂=0 at 2 although ab in ordinary torus H² is nonzero. Empty input has 0 on both sides. | Triangle and binomial coefficient both essential. |
| §2.4 Principal reduction and diagonal | Point mod 4→2; unit ideal; RP²; infinite ideal | 3γ₁↦γ₁. Quotient by (1) gives 0 on both sides. H¹(RP²,ℤ)=0 but H¹(RP²,𝔽₂)=𝔽₂, so diagonal reduction can fail. For R=ℚ[xᵢ], I=(xᵢ), (xᵢ) maps to 0 in ∏R/I but is nonzero in (∏R)/I∏R. | Principal/off-diagonal scope retained; no false all-ideal claim. |
| §2.5 Rational stabilization | Point, one edge, infinitely many disjoint edges | γₙ↦tⁿ/n!. Degree-0 image on an edge is K, omitting x₁. The family x₁ᴺ on edge N has no uniform finite degree bound. Its absence as a form does not contradict the cohomology isomorphism. | Injection/quasi-isomorphism is not degreewise surjectivity. |
| §3.1 Pro-colimit | Constant point; even cofinal subtower; reversed limits | Point piece remains (ℤ/ℓʳ)γₙ after reindexing. The sequence (ℓⁱ) has finite support modulo every ℓʳ but infinitely many nonzero ℤ_ℓ coordinates. | lim and colim cannot be exchanged. |
| §3.2 Finiteness (F) | Point, S¹, CP∞, countable wedge of circles | Finite-coefficient cohomology cardinalities: point (ℓ,1,…), S¹ (ℓ,ℓ,1,…); CP∞ has ℓ in every even degree and 1 in odd degrees. Wedge H¹=∏ℕ𝔽_ℓ is infinite. | Degreewise finiteness does not impose bounded cohomological degree. |
| §3.3 Universal coefficients | Complex ℤ_ℓ→ℤ_ℓ, differential ℓ in degrees 1,2 | Integral H¹=0 and H²=ℤ/ℓ. Reduced H¹=𝔽_ℓ; the tensor term is 0 and Tor₁(H²,𝔽_ℓ)=𝔽_ℓ. | Tor occurs in degree i+1; no flatness shortcut. |
| §3.4 Completed forms | Point; circle at (p,n)=(1,1), ℓ=2; infinite t-support | Point completion is ℤ_ℓγₙ in each piece. Circle reduced cokernel is ℤ/2, with 2 elements, not 0. Σγₙ remains excluded by the outer direct sum. | Completion is bidegreewise; ML checks cannot be dropped. |
| §3.5 A_ℓ and normalization | (n,m)=(0,0),(1,1),(1,2),(2,3); ℓ=2,3 | binom(n+m,n)/(n+m)! equals 1/(n!m!), giving 1,1,1/2,1/12 respectively. Transition gives 2/2!=1 and 3/3!=1/2. tγ_(ℓ−1)=ℓγ_ℓ has a nonunit coefficient over ℤ_ℓ. | Products/transitions agree after rationalization; F09 repaired. |
| §4.1 Étale realization | Point; two points; dual-number thickening; 𝔸¹ with ℓ=p | H⁰ ranks are 1,2,1; the thickened point has positive cohomology 0. At ℓ=p, Artin–Schreier classes tᵐ for p∤m give infinitely many independent H¹ classes. | Nonreduced schemes retained; ℓ invertible required. |
| §4.2 Finite-level actions | Point and a descended two-point orbit | Point 1↦1, stabilizer index 1. Frobenius interchanges (1,0),(0,1), stabilizer index 2. | Finite-level continuity does not assert a continuous chosen-model action. |
| §4.3 Supplied nerve map | 𝔾_m(ℂ); two arcs covering S¹ with disconnected intersection; two points | H¹ comparison ranks 1→1. Ordinary abstract two-arc nerve is an interval, H¹=0, versus circle H¹ rank 1. Componentwise ordered Čech graph has 2 vertices, 2 edges, boundary rank 1, hence H¹ rank 1. Singleton cover H⁰ rank 2→2. | Good-cover hypothesis and components detected. The full simplicial Čech nerve has four nondegenerate directed edges, with higher simplices imposing the same H¹. |
| §4.4 Complex models | 𝔾_m, elliptic curve, disconnected two points | Λ(a₁) has H¹ dimension 1; Λ(a₁,b₁) has H¹ dimension 2 and H² generated by ab≠0. Two points have H⁰ dimension 2≠1. | Algebra comparison general; connected model hypothesis necessary. |
| §5.1 Geometric filtrations | 𝔾_m, elliptic curve, proper nodal rational curve, thickened point | H¹ weights are 2,1,0 respectively. Thickened point has W₋₁H⁰=0, W₀H⁰=ℚ_ℓ. dlog is complex weight 1 but H¹ weight 2; two dlogs have complex weight 2 and H² weight 4. | Weight shift and singular/nonreduced scope agree. |
| §5.2 Frobenius–Hodge comparison | ℙ¹, q=3 | Eigenvalues 1,3; W₀ dimensions in degrees 0,2 are (1,0), W₂ dimensions (1,1). Inverting the second eigenvalue gives 1/3 and wrong weight −2. | Same Frobenius convention as supplier. |
| §6.1 Admissible filtrations | Λ(a,b); K[x₂]; algebra generated by y₃ with dy=x² | Constant Λ(a,b) filtration is exhaustive. Degree≤2 vector span in K[x] omits x² of degree 4 and is not a subalgebra. Algebra generated by y omits dy=x². | Multiplicative and differential closure separately tested. |
| §6.2 Stable representatives | Sphere model; three-punctured sphere; finite generator shears | Block {x₂,y₃} generates a DG subalgebra because dy=x². Three punctures have Betti numbers (1,2,0), but free Lie degree dimensions 2,1,2,3,… force infinitely many degree-one minimal generators. | Finite cohomology is not finite-dimensional whole M¹. |
| §6.3 Generalized spectral grading | J₂(1), eigenvalues 2 and 3, eigenvalue 0 | dim ker(J−1)=1 and dim ker(J−1)²=2. Product eigenvalue is 6, not 5. Invertibility makes the generalized 0-eigenspace zero. | Generalized spaces and multiplicative indexing essential. |
| §6.4 Eigenvalue products | dy=x², σx=ax; nonminimal du=v; unit | σy=a²y, degree sum 2+2=4≥3. The nonminimal acyclic pair du=v may have any eigenvalue β with no positive cohomology eigenvalues. Unit uses empty product 1 and degree sum 0. | Minimality and inequality necessary. |
| §6.5 Integer weights | Sphere; Jordan action σa=2a, σb=a+2b at q=2 | Sphere w(x)=2, w(y)=4 gives w(dy)=4; assigning y weight 3 fails. Jordan H¹ has eigenvalue 2 and weight 2, H² eigenvalue 4 and weight 4, although σ is not semisimple. | Weight≥degree does not imply semisimplicity; R02 deletes one repeated sphere Check. |
| §6.6 Common filtration | A=((1,1),(0,1)), B=((1,0),(1,1)); weights 1,2 | AB=((2,1),(1,1)) and BA=((1,1),(1,2)); both preserve span(a,b). Aⁿ=((1,n),(0,1)) has infinite order. diag(2,4)(a+b)=2a+4b is not in K(a+b); the whole two-space is graded. | No finite-group averaging or arbitrary-subspace assertion. |
| §7.1 Weight extension | Λ(a₁), w=1; λ=2 on weights 1,2; shear | G₂≅𝔾_m, U=1 for Λ(a). Scalar factors are 2,4, not 1/2,1/4. Shear b↦b+a has Gr(g)=identity but changes [b]. | Kernel means identity on associated graded; R02 removes the weaker repeated Check. |
| §7.2 Splitting/conjugacy | 𝔾_a⋊𝔾_m, s_c(λ)=(c(1−λ),λ) | s₁(2)s₁(3)=(-1,2)(-2,3)=(-5,6)=s₁(6). Conjugation by (c,1) sends (0,λ) to s_c(λ). c=0 gives the diagonal section. | Section and conjugator laws agree; compatible pro-lifting remains an explicit proof obligation. |
| §7.3 Rational gradings | 𝔾_m and elliptic curve | Multiplicative group: W₁H¹=0, W₂H¹=H¹ of dimension 1. Elliptic curve: W₀H¹=0, W₁H¹ has dimension 2; product ab has weight 2. | Cochain degree alone is not the grading. |
| §7.4 Conjugacy | g(a)=a, g(b)=b+a, weights 1,2 | Weight lines Ka,Kb map to Ka,K(b+a). Gr(g) is identity; H¹(g)[b]=[b]+[a]≠[b], so g is not homotopic to identity. | Correct weaker conjugacy statement. |
| §8.1 Arbitrary-base splitting | Three punctures over algebraic closure of 𝔽₂, ℓ=3; spread over 𝔽₄ | H¹=ℚ₃(−1)², eigenvalues 2,2 over 𝔽₂ and 4,4 over 𝔽₄. Both assign weights 2,2. | Positive characteristic and spread change retained. |
| §8.2 Proper smooth formality | Elliptic curve, ℙ¹, 𝔾_m | Elliptic minimal d=0. For ℙ¹, x↦[x], y↦0 sends dy=x² to [x]²=0 and gives H*=K[x]/(x²). The weight=degree projection kills 𝔾_m’s nonzero H¹ of weight 2. | Purity is needed for this projection; minimal differential need not be zero. |
| §8.3 Degree-one Lie tower | Λ(a); Λ(a,b); dc=ab; ℙ¹ | First two Lie algebras are abelian of dimensions 1,2. dc(A,B)=1=−c([A,B]) forces [A,B]=−C. Weights (2,2,4) dualize to (−2,−2,−4). ℙ¹’s 1-minimal H² map is 0→K, injective but not an isomorphism. | Bracket sign, dual weights and H² direction fixed. |
| §8.4 Unipotent étale comparison | Three punctures; C₂ and nonabelian S₃ | Free two-generator nilpotent quotients have dimensions 2 and 3 at depths 1,2. For finite-order unipotent u, m log(u)=0 in characteristic zero gives u=1. Thus both finite groups have trivial unipotent completion, unlike their orders 2 and 6. | Comparison is with unipotent completion, not the original group. |
| §8.5 Normal presentations | Three punctures, elliptic, genus g, nodal rational curve | Punctures: two weight −2 generators, R=0. Elliptic: two weight −1 generators, one bracket relation of weight −2. Genus g≥1: 2g generators and one symplectic relation; g=0: V=R=0. Nodal H¹ weight 0 is excluded by normality. Allowed relation weights [−4,0] intersecting weights≤−2 give {−4,−3,−2}. | Normality and lower-central completion/cutoff retained. |
| R01 localization repair | Λ(a₁), a↦2a over ℚ; identity | Inverse scalar 1/2 gives composite scalar 1 in both orders; Q(identity)=identity, and the two formal inverse relations are imposed in the native quotient category. | Existing pinned construction suffices; correct its attribution. |

The topological two-torus has Betti dimensions (1,2,1); the elliptic realization has weights (0,1,2) by degree, while 𝔾_m² has (0,2,4). These independently reconcile the triangular product example with the later geometric weights. The integral interval example is exact because dx₁=d(x₁), without division. Every factorial denominator used for rational normalization is nonzero in characteristic zero; no division by ℓ is used in the integral construction. Nonempty simplices, prime ℓ, positive coefficient exponent and small diagrams are retained rather than given invalid total-function junk values.

The repaired supplier patterns also have explicit negative controls: the quasi-isomorphism a↦2a of Λ(a) has inverse 1/2, whereas its augmentation has H¹ map K→0 and is not a quasi-isomorphism; maps e↦a and e↦2a induce distinct H¹ maps and cannot be polynomial-homotopic; scalar extension K→L changes H¹=K to L and preserves the 1-minimal H² injection 0→K as 0→L. The three-puncture model requires more than Λ(a,b), whose H² has dimension 1 rather than 0. A normal elliptic curve and 𝔾_m give weights 1 and 2; the nonnormal nodal curve gives weight 0. These exclude the plausible weakened suppliers.

### Pinned-library ownership and statability

The content snapshot is 86e155cac97365a2b24380c270383cd1d01628be. The manifest pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Searches and readings used those copies, not a newer library. The following definitions and laws were opened, including their surrounding hypotheses.

| Object | Pinned declaration and file | What it supplies, and what it does not supply |
| --- | --- | --- |
| Divided powers | DividedPowerAlgebra, dp, dp_mul, algHom_ext, lift, map; Mathlib/RingTheory/DividedPowerAlgebra/Init.lean:99, 127, 171, 235, 346, 418 | Universal divided powers, binomial multiplication, and maps determined by all divided powers. The lift requires an appropriate divided-power ideal. The directory has only Init.lean at this pin; it does not contain the homogeneous relative simplicial coefficient complex. |
| Alternating algebra | ExteriorAlgebra; Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean:60 | Defined using the Clifford algebra of the zero quadratic form, hence alternating over every commutative ring. It does not rely on 2 being invertible. |
| Simplicial sets and chains | SSet; Mathlib/AlgebraicTopology/SimplicialSet/Basic.lean:33; SSet.chainComplex; Mathlib/AlgebraicTopology/SimplicialSet/Homology/Basic.lean:75 | The native contravariant simplex functor and coproduct-based ordinary chains. No étale type or divided-power forms are included. |
| Ordinary cochains | ChainComplex.linearYonedaObj; Mathlib/CategoryTheory/Abelian/Ext.lean:56 | Hom cochains on the supplied chain complex in the required linear abelian category. It is a Mathlib declaration, not a Tau Ceti declaration. |
| Normalization | CategoryTheory.Abelian.DoldKan.equivalence; Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean:167 | Equivalence for abelian categories. It does not make arbitrary nonlinear functors preserve chain homotopies. |
| Mittag–Leffler predicate | CategoryTheory.Functor.IsMittagLeffler; Mathlib/CategoryTheory/CofilteredSystem.lean:137 | Stabilization of images for a set-valued diagram. Module-limit exactness is not a field of this predicate. |
| Localization | CategoryTheory.MorphismProperty.Localization and Q; Mathlib/CategoryTheory/Localization/Construction.lean:106, 111 | Any category and morphism property give a quotient localization and functor. This is the existing owner for R01, with no new geometric theorem needed. |
| DG algebra | TauCeti.IsDGAlgebra; TauCeti/Algebra/Homology/DG/Algebra/Defs.lean:182 | Degree +1 differential, square-zero and Leibniz law. Its internally ℤ-graded carrier does not require nonnegative support, graded commutativity or odd squares zero. |
| DG maps and cohomology | TauCeti.DGAlgHom; TauCeti/Algebra/Homology/DG/Algebra/Hom/Basic.lean:50; TauCeti.IsDGAlgebra.Cohomology and TauCeti.algEquivCohomologyOfZero; TauCeti/Algebra/Homology/DG/Algebra/Cohomology.lean:182, 257 | Maps commute with the differential; cohomology is cycles modulo boundaries; the zero-differential comparison includes multiplication. This does not construct a Sullivan model. |
| Singular realization | TopCat.singularCochainComplex and TopCat.singularCohomology; TauCeti/AlgebraicTopology/Cohomology/Basic.lean:60, 94; TopCat.singularCup; TauCeti/AlgebraicTopology/Cohomology/Cup.lean:203 | Ordinary topological cochains/cohomology and cup construction. The chain/linear-Yoneda composite agrees with the package’s intended ordinary simplicial cochains. It is not étale cohomology of schemes. |
| Mixed Hodge structure | TauCeti.Hodge.MixedHodgeStructure; TauCeti/Geometry/Hodge/Mixed/Basic.lean:72 | Bounded rational/complex filtrations, explicit base-change data and pure graded pieces. No finite-dimensionality or geometric realization is implicit. |
| Unipotent groups | TauCeti/Algebra/AlgebraicGroup/Unipotent/Basic.lean:1 | The documented carrier is a smooth finite-type commutative-Hopf-algebra group scheme with the geometric unipotence criterion. It does not construct the filtered minimal-model automorphism pro-scheme. |

Object searches included divided powers, relative forms, Sullivan/Hirsch minimal models, polynomial forms, pro-simplicial cohomology, mixed Hodge realization and unipotent towers. The existing abstract DG, Lie and cohomology carriers do not encode the geometric headline objects with a few simple definitions. A generic universal-coefficient statement on an arbitrary complex would not state §3.3’s theorem about the constructed pro-simplicial object. An arbitrary filtered algebra standing in for a Sullivan model would admit wrong models such as du=v in the table. No such stand-in is used.

### Cross-roadmap resolution and duplication audit

The roadmap index and the supplied board-package index were read before assessing ownership. The roadmaps list, grep and show tools were used by object, including narrower searches after broad searches reached their result limit. Main-roadmap revisions were checked against main, not consumed at an open revision head. New roadmaps were checked at the provided open heads. In the table, a source-file location means that roadmap’s README at the stated snapshot; board design paths are given explicitly.

| Supplier / related object | Resolved location | Scope and ownership result |
| --- | --- | --- |
| DGAInfinity, main | TauCetiRoadmap/DGAInfinity/README.md:229, 293, 353, 520 | DG and A∞ inputs are earlier owners. A∞ transfer is not Sullivan minimality. Correct the input locators in R01. |
| AlgebraicTopology, main | TauCetiRoadmap/AlgebraicTopology/README.md:817 (Stage 4 item 7), 849 (Stage 5), 946 (Stage 6) | CW realization, descent and ordinary cohomology are imported. Chain descent does not provide arbitrary good-cover refinements. |
| AlgebraicTopologyPartII, board main design | packages/AlgebraicTopologyPartII/design/README.md:505, AT2.4 | Spatial rational minimal models have a nilpotent finite-type domain. The five general connected-CDGA/polynomial-form contracts genuinely extend that domain. No local Sullivan construction is planned here. |
| DerivedDeRhamCohomology, 83d00dd | TauCetiRoadmap/DerivedDeRhamCohomology/README.md:3247, §2.21 | Strict graded commutativity and odd-square-zero predicates, including at 2, have one owner. §0.1 now consumes them. |
| DerivedModuleAlgebra, main | TauCetiRoadmap/DerivedModuleAlgebra/README.md:105, 239, 1171, 1208, 1237, 1268, 1403, 1573 | §§0.DP.2–0.DP.3, 0.14–0.17, 1.T.1 and 1.1 provide homogeneous powers/décalage and module-tower exactness. Applying them to the relative-form tower and verifying the hypotheses is owned here. |
| AdicSpacesPartII, main; DiamondsAndVStacks, open new roadmap | TauCetiRoadmap/AdicSpacesPartII/README.md:7793, R0.19.9; TauCetiRoadmap/DiamondsAndVStacks/README.md:1255, D0.13 | Native opposite-Ind pro-category, small presentations and Hom lim-colim formula are already owned by AdicSpacesPartII; Diamonds imports them and adds bounds. No second generic pro-category is planned. |
| EtaleHomotopyTypes, board main design | packages/EtaleHomotopyTypes/design/README.md:201 (EH.0), 768, 805, 842 (EH.3), 1374 (EH.6) | Pro-cohomology convention, rigid hypercovers/type and finite-coefficient comparison are imported. EH.6’s quasi-projective completed zigzag differs from §4.3’s raw nerve map for separated finite-type varieties. Scope names both. |
| EtaleCohomologyFoundations, main | TauCetiRoadmap/EtaleCohomologyFoundations/README.md:57, 105, 139 (G.1–G.3); 231 (F.0.3); 522 (F.2.2); 676 (F.3); 959–1089 (F.4.1–F.4.6); 907, 940, 1108 (F.10.1–F.10.2b) | Proper compactifications, geometric base extension, ordinary constructible finiteness and coherent adic realizations support their claimed uses. Arithmetic/geometric Frobenius and twist signs match q and q⁻¹. No compact-support cohomology is substituted for ordinary cohomology. |
| ComplexComparisonPartII, 2d50a88 | TauCetiRoadmap/ComplexComparisonPartII/README.md:2895, 3401, 3990, 4047, 4168, 4334; C5.3, C5.5, C6.0–C6.1, C6.3, C6.6 | Pure/logarithmic inputs and Artin comparisons exist, including singular/nonproper topology and coherent adic limits. Compatible good-cover refinements for finite diagrams are a separate declared contract. |
| MotivicEtaleKTheory, 83b84df | TauCetiRoadmap/MotivicEtaleKTheory/README.md:354, 375, 420; §§3.1, 3.2, 3.4 | Smooth logarithmic realization, shifted weights and refinement comparison exist. Singular proper-hyperresolution descent is the missing extension requested from this owner. No unshifted W-filtered blowup invariance is imported. |
| SchemeAndStackFoundations, main | TauCetiRoadmap/SchemeAndStackFoundations/README.md:848, 3265, 3309, 3896, 6075, 6372; §0.9, Layer 2, §§4.17, 4.19 | Spreading, sites/descent, SNC geometry and alterations retain their hypotheses. A curve-resolution example is not being used as arbitrary-dimensional resolution. |
| ResolutionOfSingularitiesCharacteristicZero, bf45c86 | TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:672, 718, 728, 758, 770, 786, 802; §§5.1–5.6, 6.1–6.4 | Resolution/principalization are general; the projective compactification clauses have their quasi-projective domain. A general separated stratum uses an independently supplied proper compactification. |
| DeligneWeightsAndPurity, 6c2402d | TauCetiRoadmap/DeligneWeightsAndPurity/README.md:752, 878, 916–994; 2618, 2678; 3115, 3233–3263 | §§0.1–0.3, 0.7–0.15 give finite-dimensional spectral/weight laws; §§7.12/7.15 give bounds and proper smooth purity; §§8.20–8.24 give spreads/SNC sequences. Arbitrary-base ordinary W and normal H¹ are separate gaps. |
| ReductiveGroups, main | TauCetiRoadmap/ReductiveGroups/README.md:443, 460, 466, 479; Layers 5, 5P, 6, 6A | Characteristic-zero unipotent/Lie, complete reducibility and finite-type Levi/torsor inputs exist. §7.2 owns compatibility in the inverse limit; no finite-type Levi result is silently applied to a pro-group. |
| AnabelianGeometryAndNonabelianChabauty, 63d51d5 | TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:3885, 3912, 4061, 4696; §§2.1–2.3, 2.11 | Neutral reconstruction and curve unipotent categories/towers are earlier owners. The general normal-variety extension is contracted; the full weighted presentation differs from the curve two-step cup-product presentation in §2.11. |
| Same roadmap’s crystalline comparison | TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:4509, §2.6 | Thom–Sullivan cochains occur in a good-reduction logarithmic crystalline/étale comparison over period rings, with Witt-vector and smooth-pair hypotheses. This is not the arbitrary-ring relative divided-power simplicial construction or the arbitrary algebraically closed base theorem here. |
| MixedHodgeModulesAndIrregularHodgeTheory, board main design | packages/MixedHodgeModulesAndIrregularHodgeTheory/design/README.md:683, 717; H.1 operations/weight bounds | The mixed-Hodge-module route on quasi-projective inputs is distinguished in Scope from the separated finite-type hyperresolution realization requested from MotivicEtaleKTheory. |

The citation resolver’s three roadmap-name leads were AlgebraicTopologyPartII, EtaleHomotopyTypes and MixedHodgeModulesAndIrregularHodgeTheory. The exact cited sections were opened in the board main designs listed above; the resolver does not index those designs. They were not reported as nonexistent roadmaps. No unavailable revised package text is inferred from a design.

The five accessible indexed board-package heads were also searched: packages/AnalyticNumberTheory/README.md at 310e834, packages/ArithmeticStatistics/README.md at 357e723, packages/AutomorphicCongruences/README.md at 08f531f, packages/KatoEulerSystems/README.md at a3ba9c5, and packages/LogicAndDefinabilityInNumberTheory/README.md at d36cfa5. The divided-power match in KatoEulerSystems:777 concerns the integral dual symmetric-power lattice, not differential forms. AutomorphicCongruences:1892 concerns modularity-lifting hypotheses, not Sullivan models. No duplicate owner was found in those files. The other fifteen indexed heads could not be read, as detailed below.

Thus the retained ownership is Weil II §5’s relative-form construction, its completion and comparison, and the passage from geometric cohomology weights to filtered minimal models and weighted unipotent presentations. Generic CDGA predicates, Sullivan theory, ordinary/étale types, geometric cohomology, weight filtrations and finite-type Levi theory are imported by their owners. There is no new fully qualified Lean name that could collide with another roadmap. Nothing was moved from a later supplier into this package during review.

### Supplier contracts and direction

The following ten slugs occur with identical needs sentences in design/plan.json and the README’s Exact supplier contracts. All name earlier suppliers and exact sections. Each is a single mathematical interface/theorem with its necessary naturality laws; none asks this package to prove a supplier’s construction or presupposes the consumer’s headline. They are acceptance conditions, not findings.

| Gap slug | Supplier section | Missing extension and minimality |
| --- | --- | --- |
| polynomial-forms-de-rham | AlgebraicTopologyPartII AT2.4 | Compatible-family polynomial forms for arbitrary simplicial sets and characteristic-zero fields, with multiplicative de Rham comparison. Native divided powers are not this object. |
| sullivan-minimal-models | AlgebraicTopologyPartII AT2.4 | Full and 1-minimal model maps for every connected nonnegative CDGA in characteristic zero, without a nilpotent realizing-space assumption. |
| sullivan-quasi-isomorphism-rigidity | AlgebraicTopologyPartII AT2.4 | Algebra isomorphism for quasi-isomorphisms between Sullivan minimal algebras. A∞ minimality is a different notion. |
| sullivan-homotopy-lifting | AlgebraicTopologyPartII AT2.4 | Bijection on polynomial-homotopy classes from every ordered positive Sullivan source along a CDGA quasi-isomorphism. |
| sullivan-scalar-extension | AlgebraicTopologyPartII AT2.4 | Preservation of full/1-minimal maps by characteristic-zero field extension. This does not assert that arbitrary products commute with scalar extension. |
| compatible-good-cover-refinement | ComplexComparisonPartII C6.0–C6.1 | Cofinal refinements compatible with finite diagrams of étale covers on every separated finite-type complex scheme, including singular/noncompact inputs. Individual smooth good-cover theorems do not supply this interface. |
| geometric-mixed-hodge-realization | MotivicEtaleKTheory 3.2, 3.4 | Proper smooth/SNC hyperresolution descent from the existing smooth realization to every separated finite-type complex scheme, with the shifted weight comparison and multiplicative naturality. |
| arbitrary-base-weight-filtration | DeligneWeightsAndPurity 8.20–8.24 | Spread-independent finite ordinary cohomology W over algebraically closed bases with ℓ invertible, compatible with products and extension. |
| normal-h1-weights | DeligneWeightsAndPurity 7.12, 8.20–8.24 | The separate normal-variety H¹ bound {1,2} for that filtration. General degree-one bounds allow weight 0 and do not imply it. |
| normal-variety-unipotent-category | AnabelianGeometryAndNonabelianChabauty 2.2–2.3 | Pointed unipotent étale category, quotient towers and H¹/H² interfaces for connected normal separated finite-type varieties over every algebraically closed base with ℓ invertible. The existing smooth characteristic-zero curve domain is narrower. |

Every Needs line and supplier subsection was inspected for direction and scope, including the input dependencies of the repaired mixed-Hodge contract. The required dependency command, with the supplied configuration, --name EllAdicHomotopyTypesAndWeights, --order merge-order/ORDER.txt and --movable, exited 0 and printed exactly:

    depcheck: 51 roadmaps, 594 edges, 0 problem(s)

There is no UPWARD, CYCLE or moved line. The merge order was not edited. This check is supplemented by the section-level ownership readings above; it does not by itself prove those contracts.

### Headline acceptance file, elaboration and padding

The README’s headline results map to the module docstring as follows. Each row names the absent construction; none is replaced by an arbitrary predicate, a weakened scalar identity or sorry’d data.

| README headline | Docstring coverage and missing carrier |
| --- | --- |
| §2.2 coefficient homotopy | Relative divided-power simplicial coefficient complex. |
| §2.3 triangular integral comparison | Global relative forms and their cohomology comparison. |
| §2.5 rational stabilized comparison | Relative forms, Sullivan polynomial forms and stabilization. |
| §3.3 pro-simplicial universal coefficients | Constructed pro-simplicial cohomology and coherent finite-coefficient system. |
| §3.4 completed triangular comparison | Bidegreewise completed relative-form complex. |
| §3.5 cohomology of A_ℓ | The constructed algebra and its comparison map. |
| §4.1 étale realization | A_ℓ and geometric étale cohomology ring. |
| §4.4 complex minimal-model comparison | Geometric algebra, polynomial forms and Sullivan models. |
| §5.2 Frobenius–Hodge identification | Geometric realizations and common filtered comparison. |
| §6.2 stable minimal representatives | Sullivan models, homotopies and admissible filtrations. |
| §6.4 eigenvalue product theorem | Sullivan carrier and ordered Hirsch filtration. |
| §6.6 common filtration | That carrier and admissible finite-type filtrations. |
| §7.2 splitting/conjugacy of weight extension | Minimal-model automorphism pro-scheme and algebraic image tower. |
| §7.3 rational weight splitting | Geometric rational Sullivan model and Hodge realization. |
| §7.4 rational grading conjugacy | Geometric model and weight extension. |
| §8.1 arbitrary-base weight splitting | Geometric ℓ-adic model and spread-independent W. |
| §8.2 proper smooth formality | Geometric ℓ-adic algebra and Sullivan model. |
| §8.4 1-minimal/Tannakian comparison | Sullivan Lie tower and geometric unipotent Tannaka group. |
| §8.5 normal-variety presentation | Geometric unipotent Lie algebra, H¹/H² comparison and weights. |

The file has one import Mathlib, one module docstring and the required namespace, with no declarations. The mandatory command lake env lean with the absolute package Suggested.lean argument, run from the supplied content checkout, completed with exit 0 and no errors or warnings. No TauCeti import required an object-file build. No Lean process was left running.

The mechanical declaration audit found zero definitions, instances, opaque declarations and theorems. Accordingly there are zero package declarations for a #check @name binder audit and zero sorried theorems for the one-tactic padding probe; neither test was represented as having tested nonexistent signatures. A separate permitted scratch elaboration checked @CategoryTheory.MorphismProperty.Localization, @CategoryTheory.MorphismProperty.Q, @ChainComplex.linearYonedaObj and @SSet.chainComplex against the pins and succeeded. There is no section-variable loss, sorry’d data, set_option, theorem/definition catalogue, admitted example or unused replacement headline. A small DP coordinate identity would be statable, but would be an API/Check statement rather than one of these geometric headline theorems.

No route-specific restriction to good primes, projective varieties, nilpotent realizing spaces or characteristic-zero geometric bases was substituted for the stated general library. The ℓ≠char(k), characteristic-zero coefficient-field, normality and proper smooth hypotheses are attached to their actual theorems. Statements are paraphrases with locators rather than copied source passages. No computational algorithm, instruction-bearing fetched text, credential use, external write or edit to a supplier was part of this review.

## Not verifiable

- **Miller, De Rham cohomology with arbitrary coefficients:** sources.toml key miller is settled uncertified. Its pp. 193–203 proof details for §§2.2–2.4 were not read. Weil II’s relevant statements and the package’s separately owned proof obligations were checked; no request to reopen this source was made.
- **SGA 5, Exposé V §5.3.1:** sources.toml key sga5 is settled uncertified. The original text supporting §3.3 was not read. Weil II 5.2.1 and the specified native/module-tower inputs were checked; this is not certification of the SGA proof.
- **Two glyph-level design errata:** sourceIssues E2 (bold versus regular X in Weil II 5.2.1.3) and E7 (m/n in 5.3.4) remain unconfirmed from the extraction. The relevant lines, weil-II lines 3770 and 3917, lose typography or garble the index. No rendered-page inspection was available. The package’s mathematical scope and index formula were checked directly; these glyph claims are not added to the errata list below.
- **Unavailable board-package heads:** the supplied index was read, then each indexed README was requested at its specified head. Fifteen returned HTTP 404. Ownership against these particular package versions was not checked, and no “exists nowhere” conclusion is drawn from those failures. The unavailable files/heads are listed in the following table. Main and the readable new-roadmap open heads were still searched independently.

| Unavailable indexed file | Head |
| --- | --- |
| packages/ArithmeticLocallySymmetricSpacesPartII/README.md | 84a41ac |
| packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md | 948c94c |
| packages/CrystallineCohomologyPartII/README.md | 84ea77e |
| packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md | 80a66cc |
| packages/HigherHidaAndColemanTheory/README.md | da88512 |
| packages/LawrenceVenkateshMethod/README.md | 9ee7ac3 |
| packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md | 7e88c38 |
| packages/PELModuliPartII/README.md | d4bb48d |
| packages/PadicHodgeTheoryPartII/README.md | 6502997 |
| packages/PadicLocalLanglandsForGL2QpPartII/README.md | 3e0777d |
| packages/RealSurfacePeriodIndex/README.md | 875bca4 |
| packages/SchemeAndStackFoundationsPartII/README.md | accb0a0 |
| packages/ShimuraVarietiesPartII/README.md | 57dc0a4 |
| packages/VStackSheavesAndLisseCategoriesPartII/README.md | 0987ba7 |
| packages/VectorBundlesAndIsocrystalsPartII/README.md | b58d862 |

The ten supplier gaps are precise declared contracts, not unavailable-text findings. Their future proofs are not claimed to be present today. In particular the common-filtration and compatible pro-splitting arguments are substantial package targets; successful Lean elaboration of an empty acceptance file does not establish them.

## Source issues

- **Misprint** in weil-II at §5.1.5, p. 235 (weil-II line 3690): the source says the homogenization map to the full polynomial-form extension is an isomorphism; it should be an injection with the specified bounded-degree image in each homogeneous degree; affects nothing.
- **Error** in weil-II at §5.1.5, last paragraph, p. 235 (weil-II line 3694): the source says arbitrary coefficient quotients commute with forms off the diagonal; it should be restricted to suitable finitely generated ideals, including the principal quotients used here; affects a stated result.
- **Gap** in weil-II at Lemme 5.3.5, p. 241 (weil-II line 3934): the source says finitely many automorphisms admit a common stable filtration, leaving verification to the reader; it should be justified by a finite-block construction before deriving unrestricted grading conjugacy; affects the proof.
- **Error** in morgan at Theorem 9.2 and its proof, p. 195 (morgan-correction line 29): the source says indecomposables are invariant under homotopic maps; it should be the associated graded of their canonical filtration, with the corrected conjugacy qualification; affects a stated result; corrected in print at morgan-correction, revised Theorem 9.2, p. 185.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "73d32d03db57818f64236a4545793fe77d8d6538", "job": "REV-PKG-EllAdicHomotopyTypesAndWeights~2", "model": "gpt-6-astra", "worker": "chris-7"} -->
