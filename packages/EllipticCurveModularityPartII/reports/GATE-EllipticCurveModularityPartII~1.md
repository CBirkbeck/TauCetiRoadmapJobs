# Human review response

Commit: `9e70075`. The four numbered findings are separated into eleven distinct points; H02–H09 separate the independent prerequisite obligations in finding 2.

## H01 (CBirkbeck) — applied

The unqualified residual comparison is now C[ℓ]^ss≅ρ̄_f,ℓ in `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:103`, and `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:336` explicitly uses irreducibility to obtain C[ℓ]≅E[ℓ], consistently with AutomorphicGaloisRepresentations §6.2. The conventions distinguish actual torsion from semisimple reduction, and the two-division example computes fixed-space dimensions 1 and 2 before and after semisimplification.

## H02 (CBirkbeck) — applied differently

The prime, non-CM prime and composite cyclic-degree assertions have moved from unscheduled supplier extensions to owned targets in `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:488` and `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:516`, with all three headline statements in `TauCetiRoadmap/EllipticCurveModularityPartII/Suggested.lean:146`. EisensteinIdealAndRationalTorsion §§7.8–7.9 and 8.9 supplies its existing torsion/formal-immersion input; Mazur1978 line 35 supports the prime theorem and Kenku1982 pp. 199–201 remains the settled uncertified composite locator.

## H03 (CBirkbeck) — applied differently

The supplied split-level identification is now distinguished from the owned pull-push correspondence, Hecke equivariance and p-new isogeny theorem in `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:740`; the proof plan identifies the rational permutation-module identity and the separate nonzero action on p-new constituents. Lemos2017 line 325 and Lemos2017 line 349 support the five-level specialization, while the general coprime-level construction retains the supplier’s monomial convention at p=2, where the character identity reads 3+1=1+3.

## H04 (CBirkbeck) — applied differently

The Bilu–Parent–Rebolledo theorem is an owned target in `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:666`, with the modular-unit/height argument, finite-range Gross-vector exclusion and degeneracy reduction identified separately from curve construction. Its range remains every prime p≥11 except 13 and every m>1, exactly as in BPR2013 line 55; no point-search procedure is added.

## H05 (CBirkbeck) — applied differently

The five normalized coordinates are constructed in `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:601`, including their cusp poles and exact j maps, and §6.15 now consumes that target instead of an absent supplier extension. Lemos2017 line 237 supplies the displayed formulas; the rescaling check computes 1728 at t=8 but 2048 from the wrongly unchanged formula after u=2t.

## H06 (CBirkbeck) — applied differently

The exhaustive rational j images at 11, 17 and 37 are owned targets in `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:613`, retaining the level-11 CM entry and requiring a rational-point theorem at genus-two level 37 without assuming its Jacobian has rank zero. The exact lists are those of Lemos2017 line 197, and the new controls distinguish cardinalities 3,2,2 and the nonintegral level-17 entries.

## H07 (CBirkbeck) — applied differently

`TauCetiRoadmap/EllipticCurveModularityPartII/README.md:637` now defines the winding annihilator and specifies its connected-kernel quotient and saturated integral cotangent lattice, using ModularCurvesPartII §16.2’s existing quotient-for-an-ideal construction and NeronModelsAndSemistableAbelianVarieties §6.4d’s exact cotangents. The full-new quotient, composite map from J, semistability and strict e_K<q−1 hypothesis are explicit; rational Drinfeld–Manin splitting is not asserted to split integrally (DarmonMerel2001 line 628).

## H08 (CBirkbeck) — applied differently

Geometric cuspidal-divisor torsion at arbitrary congruence level is an owned target in `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:625`, with the full-level period comparison and pullback/norm descent as its route. It extends the rational splitting actually supplied by ModularSymbolsPadicLFunctions §0.8 and is the precise Manin–Drinfeld input used in DarmonMerel2001 line 762; it asserts neither rational generators nor a uniform torsion order.

## H09 (CBirkbeck) — applied differently

`TauCetiRoadmap/EllipticCurveModularityPartII/README.md:652` owns unconditional rank zero for trivial-character weight-two factors in every coefficient-field degree, with arithmetic class construction, central-value reciprocity, finite-index singular localization and auxiliary-prime hypothesis verification all made targets. The conditional inputs are EulerSystemsAndKolyvaginSystems §§4.3, 4.17(c) and 4.20, rather than its rank-one CM-point applications, and no reverse dependency on HeegnerPointEulerSystems is introduced (DarmonMerel2001 line 638).

## H10 (CBirkbeck) — applied differently

The three direct prerequisites are explicitly identified in `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:57`, `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:61` and `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:65`; their consumed mathematics is now separated from the additional targets owned here. The worker should list ModularSymbolsPadicLFunctions, EulerSystemsAndKolyvaginSystems and EisensteinIdealAndRationalTorsion as direct prerequisites in the PR dependency/merge paragraph, which is outside the authorized edits; all three already precede this roadmap in the checked merge order.

## H11 (CBirkbeck) — applied differently

`TauCetiRoadmap/EllipticCurveModularityPartII/README.md:923` now specifies a model for every non-CM j, the normalizer-character ramification theorem, exceptional-prime divisibility by a positive integer B_j, and the exact additional Frobenius identities excluding its remaining prime divisors. This replaces the unspecified bound by mathematical targets covering p=q and primes dividing the model discriminant, with a complete j=576 example giving B_j=12; no image algorithm or database certificate is made a roadmap target.

---

**Ownership, sources and direction.**

The comparison was against main `ae2562c`, the indexed open heads, the supplied sibling checkouts and the board’s packages, by object as well as name. The board’s EllipticModularityEffectiveComparisons design EC.4–EC.5 describes this same comparison package; it is not an independent supplier of the missing arithmetic. ModularCurvesPartIII’s board design is the GeometricFreyMazur import index and supplies none of these winding or arithmetic results. The inspected HeegnerPointEulerSystems §7.12 and GrossZagierAndArithmeticHeights §8.11 are conditional descent/height applications, not the unrestricted rank-zero theorem required here. No later application is imported. The local weight-two converse, exceptional-image exclusion and full Néron torsion specialization follow the same repair pattern and now have owned targets at §§4.7a, 6.0g and 6.0h. No target is moved into a supplier roadmap; generic curves, ideal quotients, symbols, cotangents and descent retain their existing owners.

All cross-roadmap locators were resolved against main or the indexed heads and the cited sections were read. In particular ModularCurvesPartII §9.5 states the p=2 monomial exception, §16.2 already supplies modularQuotientForIdeal, ModularSymbolsPadicLFunctions §0.8 explicitly supplies only a rational splitting, and EulerSystemsAndKolyvaginSystems §4.17(c) supplies the singular-local passage from strict to usual Selmer groups. The citation resolution has no missing cross-roadmap citation or own Lean name. Open-work ownership was checked, including all supplied sibling folders; no unprovided PR files were requested.

The existing seven readable source entries were retained and checked at their cached editions; Kenku1982 remains uncertified by its published locator, with no renewed request. Additional source anchors for the repairs are Kraus1997 line 210 (weight two at ℓ≥11), Mazur1978 line 62 (exceptional-image exclusion), Lemos2017 line 208 and Lemos2017 line 262 (finite-j image step), Lemos2017 line 355 (five-level quotient), DarmonMerel2001 line 635 (annihilator quotient), DarmonMerel2001 line 729 (cotangents), and BPR2013 line 647 (finite-range endpoint). The general Chen permutation identity and exceptional-prime divisibility argument are derived targets; their mathematical inputs are stated in the README, without attributing their full generality to a restricted source proof. No additional source entry or missing-reference request was needed.

**Pinned interfaces and elaborated signatures.**

Pins were confirmed as Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, agreeing with the content manifest. Native bodies read at those pins include:

| Native declaration and locator | Definition used; limits retained |
| --- | --- |
| Mathlib/RepresentationTheory/Irreducible.lean:30 | `IsIrreducible := IsSimpleOrder (Subrepresentation ρ)`; requires a nonzero space, not a nontrivial group action, continuity or dimension two. |
| Mathlib/Algebra/Module/Torsion/Basic.lean:972 | torsionBy is the underlying additive subgroup of the ℤ-submodule killed by n; no finiteness or rank-two assertion is included. |
| Mathlib/Algebra/Module/Torsion/Basic.lean:1010 | torsionBy.zmodModule supplies the ZMod n module on this subgroup. |
| Mathlib/Algebra/Module/ZMod.lean:81 | toZModLinearMap preserves the additive map; no basis or finite-dimensionality is required. |
| TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:64 | torsionGaloisAction restricts point-coordinate automorphisms to killed-by-n points; it asserts no surjectivity. |
| TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104 | Newform bundles the native good eigenform, newness and a₁=1; the all-Hecke property is a theorem input. |
| TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean:202 | cuspFormsNew is the Γ₁ newspace; newDimension also intersects the trivial character space. |
| TauCeti/NumberTheory/ModularForms/DiamondOperators.lean:279 | cuspFormCharSpace is the character eigenspace; the corresponding modFormCharSpace is at line 315. |
| Mathlib/RingTheory/Norm/Transitivity.lean:261 | norm_eq_prod_embeddings carries the finite separable extension and algebraically closed target hypotheses. |
| Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:804 | SL2.commutator_eq_top requires a≠0 and a²≠1; the twist route retains p≥5. |

A scratch file containing `#check @name` for all 24 declarations was elaborated successfully and each type compared with its README statement. The original 21 types are unchanged; the three new classification headlines retain E.IsElliptic, primality where required, the actual cyclic-isogeny hypothesis, and geometric NonCM in the refinement. No binder was lost and no binder repair was needed; NonCM and HasCyclicIsogeny moved before their first headline use. The other new deep targets lacking their native carriers are identified in the module docstring, rather than represented by admitted data or empty predicates.

| Declaration | README statement and retained scope |
| --- | --- |
| localTerms | §1.1; all natural p,e, rational five-vector; nonprime convention explicit. |
| martinValue | §1.2; ℕ→ℚ, total zero convention. |
| newDimension | §1.3; N and NeZero N, actual trivial-character newspace. |
| dimension_comparison | §1.3; N and NeZero N, equality in ℚ. |
| martin_bound | §1.4; N and NeZero N, inequality and both directions of equality criterion. |
| norm_bound | §2.1; Field K, NumberField K, prime ℓ, nonzero prime ideal above ℓ, nonzero member and all-embedding bound. |
| rationality_of_small_prime_coefficients | §3.1; N≠0, actual weight-two newform, trivial character and all small prime coefficients. |
| integral_sturm_congruence | §4.2; N≠0, every k∈ℕ, character, number field, embedding, arbitrary ideal and coefficient sequence tied to the actual expansion. |
| NonCM | §5.0a; E.IsElliptic and all geometric endomorphisms, not only rational endomorphisms. |
| HasCyclicIsogeny | §5.0a; E.IsElliptic, elliptic target, actual degree and cyclic geometric kernel. |
| prime_isogeny_degrees | §5.0a; E.IsElliptic, p.Prime and HasCyclicIsogeny E p; all twelve prime degrees. |
| noncm_prime_isogeny_degrees | §5.0a; same scope plus NonCM E; exactly the eight-degree necessary list. |
| cyclic_isogeny_degrees | §5.0b; E.IsElliptic, actual cyclic n-isogeny; Icc 1 19 union the seven larger allowed degrees. |
| GeometricTorsion | §5.1; E.IsElliptic and all n∈ℕ on the fixed algebraic closure. |
| torsionModule | §5.1; E.IsElliptic, n, native ZMod n module. |
| torsionRepresentation | §5.1; E.IsElliptic, n, native Galois action read linearly. |
| FullRationalTwo | §5.1; E.IsElliptic, cardinality four of rational killed-by-two points. |
| RationalTwo | §5.1; E.IsElliptic, a nonidentity rational point killed by two. |
| full_two_irreducible | §5.4; E.IsElliptic, Fact ℓ.Prime, ℓ≥5 and full rational two-torsion; both ordinary and absolute irreducibility. |
| rational_two_irreducible | §5.5; E.IsElliptic, Fact ℓ.Prime, ℓ≥11 and a rational two-point; both irreducibility conclusions. |
| ImageInNonsplitCartanNormalizer | §6.1; E.IsElliptic, Fact p.Prime, a field subring of cardinality p² normalized by the actual torsion operators. |
| nonsplit_of_not_surjective | §6.10; E.IsElliptic, NonCM E, Fact p.Prime, p>37 and failure of actual torsion surjectivity. |
| lemos_integral_j | §6.11; E.IsElliptic, the five-degree membership, actual cyclic isogeny, p prime outside that set and nonsplit containment; no NonCM assumption. |
| lemos_surjectivity | §6.18; E.IsElliptic, NonCM E, n>1 and actual cyclic isogeny, p prime and p>37. |

**Adversarial mathematics pass.**

Each row records values or explicit countermodels, not merely successful elaboration. The controls test definitions, normalizations and necessity of hypotheses; the global source theorems remain roadmap targets with admitted headline proofs.

| Statement | Instances tried | Computed values on both sides / countermodel | Result | Change |
| --- | --- | --- | --- | --- |
| Actual torsion versus residual semisimplification | C:y²+xy+y=x³+4x−6, ℓ=2 | Two-division cubic (x−1)(4x²+5x+23); discriminant −343; fixed points 2 versus 4 after ss | Actual modules differ | Added ss and negative control |
| Irreducible transport from ss | One simple factor of dimension 2; reducible unipotent C₂-module | Composition length 1 gives dimension 2 with no proper factor; unipotent control has length 2 and fixed dimension 1 versus 2 | Upgrade needs irreducibility | Explicit transport in §3.3 |
| Arithmetic Frobenius convention | y²=x³−x over 𝔽₅ | #E=8; a₅=6−8=−2; T²+2T+5 and det(1−FT)=1+2T+5T² | Conventions agree | Retained |
| Index convention | N=1,4,11 | μ=1,6,12; at lcm(11,4)=44, μ=72 | Exact index, not level or radical | Retained |
| Deletion level versus prime-to-ℓ conductor | Multiplicative exponent ℓ; additive coefficient prime | Deleted exponent 1→0; additive coefficient-prime exponent remains >0 in M₀ but is 0 in N(E[ℓ]) | Distinct levels required | Local alternative made target |
| Cyclic kernel convention | Identity; multiplication by 2 | Degrees 1,4; kernels 0 and (ℤ/2)²; latter is not cyclic | Degree alone fails | Retained |
| Geometric CM convention | j=1728 and j=0 | Extra automorphism orders 4 and 3, versus integer units ±1 of orders ≤2 | Rational endomorphisms alone insufficient | Retained |
| Split plus convention at p=2 | GL₂(𝔽₂)≃S₃ | Monomial subgroup order 2, literal split normalizer order 6; curve degrees 3 versus 1 | Literal normalizer gives wrong curve | Added convention |
| Nonsplit normalizer index | p=11 | Field units 120; normalizer 240; index 2 | Index/sign character fixed | Retained |
| Exact-divisor convention | r=5,p=11; r=p=5 | 605=5·121, gcd(5,121)=1; gcd(5,25)=5 at level 125 | Full-level involution differs | Retained |
| Winding direction and differential | exp(2πiz) | W=i/(2π), normalized upward period −1; reversed +1 | Sign determined | Recomputed in new winding target |
| Two-term winding normalization | exp(2πiz)±2exp(4πiz) | W=i/π or 0; normalized periods −2 or 0 | Frequency division and cancellation both matter | Recomputed |
| Cusp-width differential | f=t+2t², p=11, q=23 | ω=(11+22t)dt, cusp value 11dt≠0; df=(1+4t)dt | Width and derivative distinguished | Recomputed |
| localTerms exponent-zero/nonprime definitions | (0,0),(0,1),(1,2) | (1,1,1,1,1), zero vector, zero vector | Junk values defined before division | Retained |
| localTerms prime-power table | (2,2),(3,2),(2,3),(5,4) | (1/4,0,−1,1,0); (5/9,1,1,−1,0); (3/8,0,1,0,0); (96/125,16,0,0,0) | Exceptional primes/parity retained | Retained |
| martinValue arithmetic definition | N=0,1,2,3,4,11,30,35 | Values 0,0,0,0,0,1,1,3 | Empty products and zero convention agree | Retained |
| newDimension and dimension_comparison | N=1,11 | Actual trivial-character dimensions 0,1; arithmetic values 0,1 | Γ₁ whole space is not substituted | Retained |
| martin_bound inequality | N=1,30,35 | 0≤2; 12≤31; 36≤36 | Strict and equality cases distinguished | Retained |
| martin_bound equality iff | N=11,35,30,1 | 12=12 and 36=36, RHS true; 12≠31 and 0≠2, RHS false | Both directions tested | Retained |
| sharpF definition and positivity | N=1,4,11 | F=1,1,3+2√2≈5.828 | Dimension-zero exponent gives 1 | Retained |
| sharpG definition and lcm | N=1,4,11 | G=4,4,13+4√3≈19.928; wrong 4N at N=4 gives 9 | lcm essential | Retained |
| sharpH maximum and strict iff | N=1,11; ℓ=19,23 | H=4 or 19.928; at 19: H<19=false and (F<19∧G<19)=false; at 23 both sides=true | Maximum, not minimum | Retained |
| Numerical majorant comparison | N=1,11 | F♯=F_K=1 at N=1; at 11, 5.828<9 and 19.928<169 | Small μ<6 branch cannot use √x≤x | Retained |
| norm_bound lower/upper bounds | K=ℚ, I=(5), x=5, B=5; x=0 | 5≤5≤5; excluded zero would demand 5≤0 | Nonzero member and prime contraction essential | Retained |
| Removed-prime nonvanishing | p=2 | p+1−2√p=3−2√2≈0.171573>0 | Norm element cannot be zero | Retained |
| Removed-prime exponent bound | M₀=11,p=2 | Exponent 2; upper bound (1+√2)²≈5.828; 7>5.828 | Excludes ℓ≥7 only under deletion hypotheses | Retained |
| Small-prime coefficient rationality | Level 11 | Coefficients a₁,a₂,a₃,a₄=1,−2,−1,2; tested prime bound μ/6=2 | Recurrences and algebraic integrality retained | Retained |
| Small-prime norm contradiction | N=11, nonzero newform | g⁺=1, μ/6=2<F♯≈5.828; ℓ>F♯ implies tested q≠ℓ | Good-prime comparison in range | Retained |
| Exact-conductor realization | N=1 and N=11 | g⁺=0 prevents a lift at 1; at 11 F♯≈5.828<7 | No fabricated level-one elliptic quotient | Added actual/ss transport |
| krausLocalFilters definition, p=2 branches | (p,e,a)=(2,0,3),(2,2,0) | (1−3X+2X²,1); (1,1), all constant coefficients 1 | Quadratic term acts by R₄ | Retained |
| krausLocalFilters odd branches and functoriality | (3,1,−1),(3,2,0), map ℤ→ℤ/4 | (1,1−5X),(1,1−4X+3X²); reductions (1,1−X),(1,1+3X²) | Sign and coefficient map agree | Retained |
| integral_sturm_congruence coefficient zero | k=0,N=1,J=(2) | Bound 0; constants 1 and 0 differ at a₀=1 versus 0 | Zero coefficient mandatory | Retained |
| integral_sturm_congruence general ideal | k=12,N=1; J=(6),(1),(0) | Bound 1; a₁(Δ)=1; membership means divisibility by 6, always true, equality respectively | No prime-ideal restriction | Retained |
| Mod-four finite recognition | q odd, a_q=±1 | (q+1)(a_q−1)=0 or −2(q+1)≡0 mod4; at q=3,a_q=−1 gives −8 | Bad-prime condition automatic only as stated | Retained |
| Transfer of point counts | N=11,q=7 | μ(44)/6=12; trace gap ≤4√7≈10.583<G♯≈19.928 | Congruent traces forced equal in tested range | Retained |
| Mod-four matrix selection | U=[[1,1],[0,1]], V=[[1,0],[2,1]] | det(1−U)=det(1−V)=0; det(1−UV)=2 mod4 | Group closure excludes the false individual-element argument | Retained |
| Chebotarev nonabelian control | S₃ | Transposition density 3/6; 3-cycle density 2/6, both >0 | All conjugacy classes tested | Retained |
| Two-isogeny repair | Degrees 1,2; ℓ=3 versus 2 | gcd(1,3)=gcd(2,3)=1; gcd(2,2)=2 | Actual odd torsion transports, two-torsion need not | Retained |
| Full-two Kraus realization | N=11,ℓ=23 | F♯≈5.828<23 and G♯≈19.928<23; H♯=G♯ | Both independent bounds retained | Retained |
| Weight-two reduction alternative | ℓ=11, v_ℓ(Δ)=0,11,1 | Residues 0,0,1 mod11; third multiplicative branch fails | No additive/bad-exponent shortcut | New owned target §4.7a |
| Deletion-to-conductor adapter | Good reduction; multiplicative exponent ℓ; additive reduction | Coefficient-prime exponents in M₀: 0,0,>0; in prime-to-ℓ conductor always 0 | Last case cannot be identified | Retained hypotheses |
| NonCM definition | j=1728,0 and nonintegral j=−2¹²·31³/11⁵ | Orders 4,3 exclude integer-scalar model; denominator 11⁵ excludes CM integrality | Geometric condition preserved | Moved before first headline |
| HasCyclicIsogeny definition | Identity; rational 2-quotient; [2] | Kernel cardinalities 1,2,4; cyclicity true,true,false for these maps | Geometric kernel, not generator, determines object | Moved before first headline |
| prime_isogeny_degrees | p=19,37,41 | Membership true,true,false in twelve-degree list | CM degrees retained | New native headline |
| noncm_prime_isogeny_degrees | p=19,37,43 | Membership false,true,false in eight-degree list; CM controls at 19,43 violate NonCM | Refinement distinct from prime theorem | New native headline |
| cyclic_isogeny_degrees | n=0,1,14,20,22,163 | Membership false,true,true,false,false,true | Total n=0 excluded by actual nonzero isogeny; identity included | New native headline |
| Stable line versus fixed vector | C₂ acts by −1 on 𝔽₁₉ | Stable lines 1; nonzero fixed vectors 0 | Prime-torsion theorem is insufficient | Explicit classification ownership |
| GeometricTorsion | n=0,1,2 | 0 kills every point; 1 kills only O; geometric 2-torsion has 4 points | No prime/rank claim at junk n | Retained |
| torsionModule | n=1,2 | ZMod 1 module on zero subgroup; 𝔽₂ module on four points | Native killed-by-n module matches carrier | Retained |
| torsionRepresentation | σ=1; σ,σ⁻¹ | 1(P)=P; σσ⁻¹(P)=P, with no change to coordinates | Additive-to-linear reading preserves action | Retained |
| FullRationalTwo | y²=x³−x; y²=x³−2x | Rational two-torsion cardinalities 4 and 2; predicate true and false | Four rational points required | Retained |
| RationalTwo | y²=x³−2x; y²=x³+x+1 | Nonidentity rational two-points 1 and 0; predicate true and false | Identity cannot witness condition | Retained |
| Cyclic 2ℓ/4ℓ exclusions | ℓ=7,11 for 2ℓ; ℓ=3,5 for 4ℓ | 14 allowed,22 absent;12 allowed,20 absent | Sharp cutoff controls | Owned composite theorem supplies proof |
| Coprime-kernel construction | ℓ=5 with kernels of order 2 and 5 | Product cyclic order 10; dual-pair composite order4 then product order20 | Degree-4 construction occurs on an isogenous curve | Retained |
| full_two_irreducible | ℓ=5,7; excluded ℓ=3 | Forbidden degrees20,28; degree12 allowed at3 | Lower bound cannot be discarded by this route | Retained |
| rational_two_irreducible | ℓ=11; excluded ℓ=7 | Degree22 forbidden; degree14 allowed | Rational two-point cutoff preserved | Retained |
| Absolute irreducibility from oddness | ℓ=5, conjugation diag(1,−1); ℓ=2 | Eigenvalues1,4 distinct at5;1,1 at2 | Arbitrary finite-field irreducibility alone insufficient | Retained oddness supplier |
| Five normalized coordinate maps | r=2,t=8,−16; r=13,t=−1 | j=1728,0,576; pole orders at r=13 are1,13, total14 | Literal j formula fixes scalar | New owned target |
| Coordinate rescaling exclusion | u=2t at t=8 | Correct j=1728; wrongly unchanged formula at u=16 gives2048 | Generic genus-zero coordinate insufficient | New control |
| Rational j-table at 11 | Three entries | Cardinality3; CM entry −32768 retained; non-CM subtable cardinality2 | Exhaustive set distinguished from non-CM subset | New owned target |
| Rational j-table at 17 | Two entries | Denominators2 and131072; both entries negative and nonintegral | Integral-j shortcut would delete both | New owned target |
| Rational j-table at 37 | Two entries; rank-control curve y²+y=x³−x | Cardinality2; control point counts5,7 imply rational torsion0 and (0,0) nontorsion | Rational-point theorem not replaced by rank-zero assertion | New owned target |
| Geometric cuspidal torsion | X₀(1), X₀(11) | Cusp-difference orders1 and5 | Torsion is not zero, order not uniform | New owned theorem |
| Cuspidal torsion descent | m=5,h=7 | hm=35 kills the image; no finite bound on all A(K) claimed | Rational finiteness used at correct field | New explicit check |
| Winding-annihilator definition | e=0; nonzero rank-one module with faithful scalar algebra | Ann(0)=whole algebra; Ann(1)=0 | Zero class is not assigned nonzero quotient | New definition |
| Winding ideal quotient | I=(1),I=(0) | Quotients0 andJ_new respectively | Uses supplied connected-subvariety quotient | New winding specialization |
| Saturated cotangent comparison | Identity versus [q] on elliptic curve | O/O=0; O/qO has length1 and residue map0 | Finite-kernel isogeny cannot replace optimal quotient | New integral theorem |
| Saturation and ramification | q=23,e=1; q=2,e=1 | 1<22 true;1<1 false | Strict ramification retained | New control |
| Conjugate nonvanishing | Nonzero algebraic modular-symbol value a and embedding σ | For a=2 in ℚ, σ(a)=2≠0; for a=0, σ(a)=0 | Algebraicity plus nonzero periods is needed | Explicit rank-zero input target |
| Arithmetic Euler-class input | Nonzero versus zero bottom class in O | c₁=1 has index0; c₁=0 has infinite divisibility | A carrier alone supplies no arithmetic family | New construction obligation |
| Singular reciprocity/localization | Singular module O, localized class π² versus0 | Quotient O/π² has length2 and finite index; zero has infinite index | Nonzero global class is not enough | Explicit finite-index input target |
| Auxiliary representation hypotheses | Zero versus nonzero scalar error u−1 | u=1 gives0 and no bounded inverse; u=1+π gives valuation1 | DVR structure alone cannot verify image hypotheses | Explicit verification target |
| Modular abelian rank zero | d=2; finite groups of orders5,7 | Rank0 over both coefficient summands gives rational rank0; product order35 | Arbitrary coefficient degree retained | New arithmetic application |
| Mordell–Weil finiteness step | ℤ/5 versus ℚ/ℤ | Both rational rank0; cardinalities5 and infinite | Finite generation essential | Explicit input |
| BPR rational-point exclusion | p=41,m=2; p=13; p=7,m=2 | 41≥11 and41≠13;13 excluded; X₀⁺(49) genus0 with #ℙ¹(𝔽₂)=3 and infinitely many ℚ-points | Full stated range, with negative controls | New owned target |
| BPR exponent reduction | m=4,5 | Degeneracy steps4→2 and5→3 | Both parity endpoints needed | Explicit route |
| Exceptional projective-image exclusion | p=19 versus17; A₄,S₄,A₅ | 19>17,17≯17; maximum element orders3,4,5; group orders12,24,60 | Oddness of order2 alone excludes none | New owned target |
| Full Néron torsion specialization | q=23,e=1; dyadic good curve with Δ225 | 1<22; at2, P=(−1/4,1/8) has 2y+x=0, equation sides−1/64, and reduces to O | Boundary fails even with good reduction | New theorem and genuine negative control |
| Formal-group boundary | −1∈1+2ℤ₂ | (−1)²=1, reduction1; nontrivial order2 in kernel | e=q−1 cannot be included | New control |
| ImageInNonsplitCartanNormalizer | p=11, field versus split algebra | Cardinalities121 in both; split idempotents multiply to0, field has120 units | Cardinality alone insufficient | Retained |
| Cartan basis invariance and full-image exclusion | p=11 | Normalizer order240; GL₂ order13200; split normalizer order200 does not divide240 | Wrong field/scalar/split models excluded | Retained |
| Potential good reduction | p=11, q=5 versus q=23 | q² mod11=3≠1 versus1; 23≡1 mod11 | Cyclotomic-square obstruction has correct direction | Retained |
| Exact-divisor differential comparison | r=5,p=11; weight2 | Level605; exact divisor121; normalization factor11⁰=1 | No full-level involution substituted | Supplier locator corrected |
| Chen permutation identity | Every matrix in GL₂(𝔽₅), 480 matrices | Fixed-count differences all0; identity15+1=10+6; split diag(1,2):1+1=0+2 | General finite-group identity independently tested | Explicit new proof input |
| Chen identity, nonsemisimple element | [[1,1],[0,1]] over𝔽₅ | Split-pair fixed0, nonsplit-pair fixed0, line fixed1;0+1=0+1 | Not just dimension count | Explicit control |
| Chen identity, nonsplit involution | [[0,2],[1,0]] over𝔽₅ | Fixed counts3,4,0;3+1=4+0 | Both torus types tested | Explicit control |
| Chen identity at p=2 | G=S₃, monomial order2 | 3+1=1+3=4; replacing monomial by literal normalizer gives2≠4 | Small prime retained correctly | Added convention and control |
| Chen p-old image and p-new isogeny | r=1 versus11; zero equivariant map | Base genera0 versus1; zero map on positive dimension has infinite kernel | Equivariance/old-to-old not enough for isogeny | Separate theorem targets |
| Five-level winding nonvanishing | r=2,p=11; excluded p=3 | Transferred divisor order11 versus1; upward endpoint−D=10D at11 | Nonzero winding quotient needs a theorem | Retained |
| Winding quotient rank zero | A=0 versus specified nonzero quotient | dim0 gives zero cotangent; rank0 group orders may still be5 or35 | Rank zero does not imply suitable formal immersion | Explicit lattice construction supplies missing input |
| Characteristic-q coefficient support | Level r genus0, differential supported on multiples of p | Descended weight-two space dimension0, so all descended coefficients0 | Needs actual level/degeneracy condition, not arbitrary power series | Retained |
| Cotangent formal immersion | p=11,q=23, cusp t | Source differential evaluates11dt≠0; zero quotient gives0dt | Map to one-dimensional cotangent is onto | Retained |
| Point image torsion over cusp field | m=5,h=7 | 5u(P) rational;35u(P)=0 | No assertion A(K) finite | Retained |
| Away-from-p denominator exclusion | p=11,q≡±1 | First prime q=23; e=1<22; q∤11r for all five r | Smooth model and full torsion injection both apply | New specialization target supplies input |
| Proper image classification | p=41 | Cyclotomic determinant size40; containing SL₂ gives41·40²·42=2755200=GL₂ order | Proper image must use another Dickson branch | Retained |
| lemos_integral_j with CM allowed | y²=x³−x,r=2,p=11 | j=1728 integer;11 inert in ℚ(i) | NonCM assumption would unnecessarily narrow theorem | Retained |
| lemos_integral_j negative control | Level-11 rational curve with cyclic5-isogeny | j=−122023936/161051, denominator11⁵>1 | Containment hypothesis cannot be dropped | Retained |
| lemosNumerator definition and basic API | r=2,3,5,7,13,11 | Degrees3,4,6,8,14; constants4096,729,125,49,13; outside-set polynomial0 | Wrong factor cubing changes coefficients/constants | Retained |
| Integral-parameter theorem, both directions | f=(T+16)³,t=8,−16,3 | Quotients1728,0,6859/3; first two divide4096, third does not | Necessity and sufficiency distinguished | Retained |
| Integral-parameter degenerate cases | f=T+1,t=1/2; t=0 | Quotient3 although t nonintegral at degree1; t=0 has no modular value | Degree≥2 and nonzero parameter essential | Retained |
| lemosIntegralJ definition and cardinalities | r=2,3,5,7,13,11 | Signed-divisor counts26,14,8,6,4; distinct-j counts25,13,8,6,4; empty at11 | Duplicates and both signs handled | Retained |
| Integral-j coordinate characterization | r=2,t=8; r=13,t=±1 | j=1728; j=2101248 and576 at13 | Actual normalized coordinate connects arithmetic to modular points | New construction supplies missing input |
| Quadratic-twist invariance | p=5, twist twice | GL₂ order480; determinant multiplierχ²=1; double twistχ²ρ=ρ | Both directions, CM same-j issue excluded | Retained |
| Canonical finite-j model | j=576,0,1728 | k=1/2 gives A=3/2,B=1, Δ=−648; j=0 givesΔ0; j=1728 denominator0 | Singular/undefined values excluded | New model |
| Integral scaling isomorphism | j=576,u=2 | A=24,B=64; Δ=−648·2¹²=−2654208; j=576 | Source, target and scaling fixed | Explicit map |
| Quadratic character set | S consisting of2,3 | Seven nontrivial square classes −1,2,−2,3,−3,6,−6; χ_−1 conductor4 | Sign and wild dyadic possibilities retained | New finite set |
| Normalizer quotient character | Complex conjugation at odd p; scalar−1 | Conjugation eigenvalues1,−1, nonscalar; scalar−1 has determinant1 and is in Cartan | Character nontrivial, not silently trivial | New ramification target |
| Ramification at coefficient prime | Good ordinary versus supersingular p>37 | Ordinary projective inertia order p−1>2; normalizer non-Cartan coset elements have projective order2 | Ordinary impossible; supersingular inertia stays in Cartan | New local target |
| Non-Cartan trace identity | Over𝔽₅, a=b=1, √2 nonsquare | [[1,3],[1,4]] has trace0 and determinant1; multiplication alone trace2 | Correct coset required | New numerical witness |
| Exceptional-prime divisibility and p=q | q=5,a_q=−2 | q·a_q=−10, so a possible p=q=5 divides10 even though5∤−2 | q factor prevents omitted exceptional case | New theorem |
| Positive gcd bound | q traces−2,−4,−3 at5,7,11 | Products10,28,33 give gcd1; zero singleton would give0 | Nonempty nonzero input necessary | Explicit hypotheses |
| j=576 geometric non-CM control | Ordinary reduction at7 and11 | a₇=−4,a₁₁=−3; Frobenius discriminants−12 and−35 give distinct quadratic fields ℚ(√−3),ℚ(√−35) | A geometric CM field cannot equal both ordinary endomorphism fields | Confirms the example is non-CM |
| Complete j=576 character witnesses | Seven character classes, listed Q_d | gcds1,1,2,1,1,1,1; product2; S product6; B=12 | No prime>37 divides B | Added complete small example |
| Remaining candidate exclusion | Polynomial T²−2T+2 modulo41 | Discriminant37=18²; roots10,33, trace2≠0 and determinant2 | Split distinct nonzero-trace Frobenius cannot be in nonsplit normalizer | Explicit final finite-identity target |
| Final finite-j image theorem | Non-CM candidate versus j=1728 CM control | Model argument gives B>0; CM control at43 has normalizer image rather than GL₂ | NonCM applies to entire union | New all-prime route |
| lemos_surjectivity | n=1 versus2; p=37 versus41 | 1>1 false,2>1 true;37>37 false,41>37 true; GL₂(𝔽₄₁) order2755200 | Both strict endpoint exclusions retained | Retained headline |

**Validation.**

`lake build TauCetiRoadmap.EllipticCurveModularityPartII.Suggested`: exit 0, thirteen expected admitted-theorem warnings, no errors. Exact outcome: `Build completed successfully (9233 jobs).`

The final all-declaration signature elaboration exited 0. No processes were left running. Only the authorized README and Suggested.lean were committed; the worktree is clean and nothing was pushed.

Exact dependency-check output:

```text
depcheck: 44 roadmaps, 457 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line and no merge-order edit.

Exact final gate summary, exit 0:

```text
gate EllipticCurveModularityPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
