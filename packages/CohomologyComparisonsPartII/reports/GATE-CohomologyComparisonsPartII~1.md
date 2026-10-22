# Human review response: CohomologyComparisonsPartII

Commit: `ad62fb06` — `CohomologyComparisonsPartII: review repairs (headline acceptance and prose API)`.

## H01 (CBirkbeck) — applied

The coordinate-only acceptance statements have been replaced by an inventory of the actual headline theorems and their missing carriers in `TauCetiRoadmap/CohomologyComparisonsPartII/Suggested.lean:3`, with the same headlines identified in `TauCetiRoadmap/CohomologyComparisonsPartII/README.md:178`. None of these geometric headlines is expressible at the pins with only simple definitions, so the module contains no substitute declarations.

## H02 (CBirkbeck) — applied

The blanket omission of Layers 2, 3, 6 and 7 has become eleven explicit headline groups, in README order, each identifying the unavailable realization, site or coefficient carrier in `TauCetiRoadmap/CohomologyComparisonsPartII/Suggested.lean:9`. Pinned isocrystals only bundle a Witt-fraction-field module and semilinear Frobenius equivalence (MathlibPin line 117), standard syntomic algebras only bundle flatness, presentation and fibre dimension (TauCetiSyntomic line 85), and the pinned Ext construction requires an abelian category (MathlibExt line 53; TauCetiExtReview line 54); none supplies the required geometric objects.

## H03 (CBirkbeck) — applied

Five coordinate definitions, four admitted API identities and all six proved value examples have been removed from `TauCetiRoadmap/CohomologyComparisonsPartII/Suggested.lean`; no definition is needed by a statable headline. Their formulas, linearity requirements, lattice inclusions, differential identities and computed witnesses remain in the prose API and Checks of `TauCetiRoadmap/CohomologyComparisonsPartII/README.md:243`, `:477` and `:609` (AM line 255; EN line 306; NN line 1366).

## H04 (CBirkbeck) — applied

Prospective declaration names throughout the README, including API names that never appeared among the original nine declarations, have become mathematical prose requirements and unlabeled Checks; the claim that the finite-lattice example is proved in Lean is also replaced by its coordinate calculation in `TauCetiRoadmap/CohomologyComparisonsPartII/README.md:48`. All 116 Checks remain, and the README makes no claim to an undeclared name of this roadmap.

### Pin and source evidence

The content main revision is `0ed44854ba705f0561f1c53fd46a84208d9a91a5`. The actual dependency checkouts agree with the manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Question | Evidence at the pins or in the legal cached text |
| --- | --- |
| Does an isocrystal state the HK comparison? | `Mathlib/RingTheory/WittVector/Isocrystal.lean:113` has a module and semilinear equivalence; no scheme, cohomology realization, filtration, connection, monodromy or finiteness field. MathlibPin line 117. |
| Does standard syntomic algebra supply cohomology? | `TauCeti/RingTheory/Syntomic/StandardSyntomic.lean:81` has flatness, a finite presentation and fibre dimension, not a cohomology complex or site. TauCetiSyntomic line 85. |
| Do ordinary cones make a geometric headline statable? | `Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57` supplies the abstract cone; the rigid/log/crystalline realization functors and coefficient maps needed to instantiate it are absent. MathlibCone line 61; AM line 249; NN line 1366. |
| Can pinned abelian Ext replace exact-category Yoneda Ext? | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:49` and `TauCeti/Algebra/Homology/Ext/Basic.lean:50` require `[Abelian C]`; `TauCeti/CategoryTheory/Exact/ExactStructure.lean:241` supplies the exact structure but no general Yoneda groups. MathlibExt line 53; TauCetiExtReview line 54; TauCetiExactReview line 245. |
| Are the removed fibre formulas still correct? | AM Definition 2.4 and its coordinate differential, AM line 249 and AM line 255; the positive connecting representative is retained. |
| Are the EN and CN coordinate lattices being conflated? | EN line 306 and NN line 2324 specify the factorial lattice; CN line 968 specifies its printed coordinate convention. At p=2,r=2 the generators are 1/8 and 1/4, and the inclusion has coordinate 2; at p=3,r=4 the coordinate 2 is a unit. |
| Is the semistable differential a headline comparison? | NN line 1366 supplies the actual HK/de Rham square; NN Proposition 3.8, NN line 1387, is the geometric comparison. Square-zero algebra on arbitrary linear maps does not state that theorem. |
| Which source supports injectivity and absolute comparison? | AM Lemma 2.5, AM line 283, uses F⁰H=0; AM Lemma 3.10, AM line 1302, and its realization and period diagrams, AM line 1314 and AM line 1327, support the horizontal-log/rigid endpoint. |
| Are the all-prime qualifications retained? | EN Theorem 2.2, EN line 318, retains 0≤r≤p−2; CN Theorem 1.1, CN line 78, retains n-uniform error and dimension dependence at p=2. The README hypotheses were not narrowed. |

The retained library declarations were located in their pinned files, including the cone component maps, the p-adic algebra/reduction maps, singleton-span coordinates, linear product maps and the exact/monoidal/opposite/conflation-exact interfaces. Object searches in both pins for syntomic cohomology, rigid and log-crystalline realizations, overconvergent coefficients and FilFMIC found no carriers for the headline statements; syntomic hits in Tau Ceti concern ring and scheme morphisms. All cited works already have settled entries in `packages/CohomologyComparisonsPartII/sources.toml`; the needed texts are cached, BesserII remains uncertified, and no new source or missing-text request is required.

### Ownership and citations

The ownership search covered main, the board packages, the twelve supplied open-roadmap checkouts, and the named supplier roadmaps through their indexed heads. The same objects retain the same owners: CohomologyComparisons §§1.11,3.7,4.2–4.5,4.8,6.3 for the base comparisons; CrystallineCohomology §§CR.5–CR.6 for log geometry and HK realizations; PadicDifferentialEquationsAndRigidCohomology §§RD.3–RD.5 for rigid coefficients and realizations; ColemanIntegration §§L3.Fb.1–L3.Fb.2 for modified syntomic theory; and QWittVectors §1.7 for the commuting-endomorphism Koszul carrier. This Part II remains the owner of the classical producers and their relative filtered extension/residue/evaluation interfaces; no new construction, ownership move or dependency was added.

Cross-roadmap citations were resolved against main and the indexed open heads. The remaining resolver line is exactly `535: TsujiNearby §4: no roadmap TsujiNearby on main or in an open pull request`: this is a false positive for a literature citation, verified in the cached TsujiNearby text, not a supplier. It reports no unresolved Lean names; its external-library pass was unavailable, so the library declarations were checked directly at the specified pins.

### Signature comparison

All nine supplied elaborated types were compared with their README coordinate statements: the original four-module fibre map, the prime-indexed lattice spans and identities, and the rational semistable differentials and transport identities retained their needed explicit binders. Their removal leaves zero declarations and therefore an empty final `#check @name` inventory; no section hypothesis can disappear from a surviving declaration, and no weaker or ad hoc encoding replaces a headline.


### Adversarial mathematics record

The mathematical hypotheses, conclusions, source locators and 116 README Checks are retained. The changes to the mathematical prose remove prospective declaration labels and reflow API requirements; the coordinate constructions are expressed using the same formulas. These probes test the statements, not proofs of the geometric comparison theorems. All section references below are to `TauCetiRoadmap/CohomologyComparisonsPartII/README.md`.

For the coordinate probes write F(a,b)=(a,3a−2b), φ(x,y)=(x,2y), N(x,y)=(y,0), ι=id, p=2, and e0=(1,0), e1=(0,1). E_a denotes the point extension by O(1) with Φh=h/2, Φe=e+a h and F⁰ generated by e; its representative is (0,−a h). A scalar diagram is identified explicitly as a model when the geometric theorem has no pinned carrier.

| Statement | Instances tried | Values on the two sides / negative control | Result | Change |
| --- | --- | --- | --- | --- |
| Former fibre-coordinate definition; §1.4 component formula | d_A=0,d_B=id,f=2; then F | (1,0)↦(0,2); (0,1)↦(0,−1); F(2,5)=(2,−4); wrong shift gives +1 | Signs agree | README only |
| §1.4 coordinate additivity | F, x=(2,5), y=(1,1) | F(x+y)=(3,−3)=F(x)+F(y)=(2,−4)+(1,1) | Equal | README only |
| §1.4 coordinate scalar law | F, scalar −2, x=(2,5) | F(−4,−10)=(−4,8)=−2(2,−4) | Equal | README only |
| §1.4 coordinate zero law | F; zero modules | F(0,0)=(0,0); unique map 0→0 has value 0 | Equal | README only |
| Former EN lattice definition | (p,r)=(2,0),(2,2),(3,4) | a=0,2,2; denominators 1,8,18; generators 1,1/8,1/18 | Nonzero denominators | README only |
| Former CN coordinate lattice definition | (p,a)=(2,0),(2,1),(2,2),(3,2) | Generators 1,1/2,1/4,1/9 | Matches spans | README only |
| Former floor-lattice inclusion; §4.1 floor inclusion | (2,2),(3,4) | 1/4=2·1/8; 1/9=2·1/18; first strict, second equality since v₃(2)=0 | Inclusion, not automatic equality | README only |
| Former factorial-generator identity; §4.1 factorial coordinate | (2,0),(2,2),(3,4) | 1=1·1; 1/4=2·1/8; 1/9=2·1/18 | Equal | README only |
| §4.1 weight-zero coordinate API | p=2,3, r=0 | a=0; p⁰0!=1; both spans ℤ_p | Equal | README only |
| §4.1 reduced coordinate inclusion | p=2,r=2,n=1; also exponents 0→1 | Both source and target quotients are 𝔽₂; 1↦2 mod 2=0; 1≠0 | Noninjectivity retained | README only |
| Former first semistable differential; §5.2 D0 formula | x=e1, r=0,1,2 | D0=(-e1,e1,e0),(0,e1,e0),(e1/2,e1,e0) | Integer exponents retained | README only |
| Former second semistable differential; §5.2 D1 formula | r=0 on (e1,0,0),(0,0,e0); r=1 on (0,0,e1) | D1=e0,e0,e1 respectively; b contributes 0 | Sign and both terms detected | README only |
| Former square-zero theorem; §5.2 coordinate complex | r=0,1,2; x=e1; D=E=0 | D1D0=(−1+1)e0=0; 0−0=0; (1/2−1/2)e0=0; zero-module value 0 | Equal to zero | README only |
| Former base-convention differential squares | e=1,2,0; p=2,r=0,x=e1; independent y=(e1,0,0) | D0 third coordinates −e0,−e0/2,0 on both paths; D1_b(Ty)=−e0,−e0/2,0=(−1/e)D1_c(y) | Both squares commute | README only |
| §5.2 coordinate additivity | r=0; x=e0+e1; y=(e1,0,e0) | D0(x)=(−e1,e0+e1,e0)=D0(e0)+D0(e1); D1(y)=2e0=e0+e0 | Equal | README only |
| §5.2 coordinate scalar law | r=0, scalar −2 | D0(−2e1)=(2e1,−2e1,−2e0)=−2D0(e1); D1(−2e1,0,0)=−2e0 | Equal | README only |
| §5.2 coordinate zero law | r=0,1; D,E arbitrary | D0(0)=(0,0,0); D1(0,0,0)=0 | Equal | README only |
| §1.1 coefficient-object construction | Zero, unit, Φ(e)=te on G_m | Ranks 0,1; Φ(1)=1; ∇(te)=dt⊗e≠0 whereas Φ∇e=0 | Wrong model excluded | Labels to prose |
| §1.1 morphism extensionality | Unit at a point; scalar maps 2 and 3 | Both components of map 2 are 2; 2≠3 separates unequal morphisms | Components determine map | Labels to prose |
| §1.1 fibre-product description | Rank-one unit, zero coefficient | Realizations (K,K,c=id), (0,0,c=id₀); reconstructed ranks 1,0 | Matches objects | Labels to prose |
| §1.1 realization functors and faithfulness | Unit; generic-only Spec(K) | id on unit gives (1,1); generic-only datum has (id_K,0), so de Rham 1≠0 and rigid 0=0 | Only de Rham faithfulness asserted | Labels to prose |
| §1.2 tensor/dual construction and Tate tensor law | p=2, a=1,b=−1; rank zero | Frobenius factors (1/2)·2=1; filtration jump −1+1=0; zero tensor rank 0 | Matches O(0) | Labels to prose |
| §1.2 pullback composition | Identity twice, constant rank one | 1·1=1 on both modules, comparison and Frobenius | Identity agrees | Labels to prose |
| §1.2 Frobenius-change cocycle | σ=σ′=σ″ on point | Each transport is 1; composite 1·1=1; δ=0 on both | Identity case agrees | Labels to prose |
| §1.2 dual evaluation triangles | Rank one, basis h and dual h* | h*(h)=1; h↦h⊗h*⊗h↦h; wrong scalar 2 gives 2h≠h | Normalization detected | Labels to prose |
| §1.3 exact-structure construction / conflation iff | Split sequence; filtered identity B→A of §1.3 | Split filtered ranks 1→2→1; B F⁰=0, A F⁰=K, so 0→K is not an isomorphism | Strictness necessary | Labels to prose |
| §1.3 monoidal exactness | Split sequence tensor O(1) | At F⁻¹: ranks 1→2→1; maps x↦(x,0), (x,y)↦y; image=kernel={(x,0)} | Exact | Labels to prose |
| §1.3 functorial Ext maps | Point E_3; coefficient scalar 2 | Class coordinate 3↦6; sums 2(1+2)=2+4=6 | Additivity agrees | Labels to prose |
| §1.3 Ext⁰ and split Ext¹ | Unit; split E_0 | Hom coordinate 1↦1; representative of E_0 is (0,0) | Matches degrees 0,1 | Labels to prose |
| §1.3 small-model independence | One-dimensional object and isomorphic tagged copy | Representative E_3 returns coordinate 3; 1 maps to 1 on Hom | No scalar change | Labels to prose |
| §1.3 extension cup | Degree-zero scalars 2,3; degree-one cohomology on two torus factors | 2·3=6; dlog t∧dlog u has coefficient 1, reversed order −1 | Unit/sign agree | Labels to prose |
| §1.4 coefficient-complex construction | Point O(0),O(1),zero | Cohomology (H⁰,H¹)=(ℚ_p,ℚ_p),(0,ℚ_p),(0,0) | Filtration retained | Labels to prose |
| §1.4 fibre triangle / coordinate sign | Fib(2:ℚ[0]→ℚ[0]) | d(1)=2; H⁰=0,H¹=0; connecting representative of 1 is +1 | Positive fibre sign | Labels to prose |
| §1.4 d²=0 | Compatible two-term complexes A=B=[ℚ→id ℚ], f=id | d(a,0)=(a,a); next d gives a−a=0 | Equal to zero | Labels to prose |
| §1.4 functoriality | Scalar 3 on Fib(2) | d(3·1)=6=3d(1) | Chain square agrees | Labels to prose |
| §1.4 exactness on conflations | Point split O⊕O | In both degrees ranks 1→2→1, image {(x,0)} equals kernel of projection | Degreewise exact | Labels to prose |
| §1.4 cohomological cup | Point O(0) unit; torus degree-one forms | 1·1=1; dlog t∧dlog u=−dlog u∧dlog t | Unit and graded sign agree | Labels to prose |
| §1.5 evaluation construction / representative | Point extension by O(0), Φe=e−h; E_3 by O(1) | (1−Φ)e=h; E_3 gives −3h; split gives 0 | Sign agrees | Labels to prose |
| §1.5 evaluation naturality | E_3, coefficient map 2; identity pullback | u(2_*E_3)=−6h=2(−3h); identity gives −3h | Both paths agree | Labels to prose |
| §1.5 de Rham projection | Point E_3; degree-zero unit map 2 | ∇e=0 on point, both projections 0; evaluation of map 2 is 2 | Agrees in degrees 0,1 | Labels to prose |
| §1.5 cup compatibility | Degree-zero unit endomorphisms 2,3 | u₀(2·3)=6=u₀(2)u₀(3) | Equal | Labels to prose |
| §1.6 injectivity / zero representative iff splitting | E_0,E_3 | u₁(E_a)=−a h; −a=0 iff a=0; E_0 splits, E_3 has value −3≠0 | Both directions tested | Labels to prose |
| §1.6 filtered-lift uniqueness | E_3; split extension by O(0) | F⁰E_3=K e gives unique coefficient 1; O(0) admits e and e+h | F⁰H=0 necessary for coordinates | Labels to prose |
| §1.6 delta projection | Point E_3 | δ=∇e=0 in Ω¹=0 | Correct target | Labels to prose |
| §1.6 remainder / cocycle | Point E_3 | R=−3h; dR=0=(1−Φ)δ | Equal | Labels to prose |
| §2.1 specialization diagram | Spec(V), empty scheme, generic-only Spec(K) | Degree-zero sp=1_K,0, K→0; last map sends 1 to 0 | No general equivalence | Labels to prose |
| §2.1 naturality | Identity on point; empty pullback | 1·1=1·1=1; zero composites 0 | Equal | Labels to prose |
| §2.1 filtration compatibility | Point, r=0→1 | F¹=0→F⁰=K; both maps from F¹ have value 0 | Correct direction | Labels to prose |
| §2.1 products | Point, r=s=0, a=2,b=3 | sp(6)=6=2·3 | Equal | Labels to prose |
| §2.2 rigid-fibre construction / cohomology | V=ℤ₂, r=0,1; generic-only | f₀(a,b)=(0,a−b), H⁰=H¹=ℚ₂; f₁(a)=(a/2,a), H⁰=0,H¹=ℚ₂; generic-only fibre F^rDR | Both target components retained | Labels to prose |
| §2.2 fibre projections and null-homotopy | Point r=0, diagonal (1,1) | f₀(1,1)=(0,0); two source projections both 1 | Fibre square agrees | Labels to prose |
| §2.2 pullback composition | Point, identity twice | (a,b)↦(a,b); first and second projections a,b unchanged | Equal | Labels to prose |
| §2.2 presentation independence | Point, identity common refinement | Both f₀ matrices [[0,0],[1,−1]], induced diagonal scalar 1 | No extra isomorphism chosen | Labels to prose |
| §2.3 exact sequence | Point r=0 | Kernel of (a,b)↦(0,a−b) is {(a,a)}; image is {(0,c)}; cokernel ℚ₂ | Kernel/image dimensions 1 | Labels to prose |
| §2.3 cup/Koszul law | i=j=1 on G_m² | Coefficient 1 in dlog t∧dlog u; reversed coefficient −1; (−1)^(1·1)=−1 | Correct sign | Labels to prose |
| §2.3 Čech descent | Point covered by itself; empty scheme | Normalized identity Čech complex has K in degree 0 and 0 above; empty gives 0 | Identity cases agree | Labels to prose |
| §2.3 unramified fibre | Point r=0,1; G_m r=1 | Eliminate a=b: operator 0 at r=0; F¹point=0 yields H¹=ℚ₂; (1−φ/2)dlog t=0 | Same groups/operators | Labels to prose |
| §3.1 divisible-PD construction and level independence | r=0, point; local divided-power z with φz=z² at p=2 | φ₀(1)=1 at every higher level; φ₁(z)=γ₂(z), 2γ₂(z)=z² | Division made before reduction | Labels to prose |
| §3.1 reduction | r=0, p=2, levels 2→1 | φ₀(3 mod 4)=3 mod 4; reduction gives 1=φ₀(1 mod 2) | Equal | Labels to prose |
| §3.1 small-weight equality | p=2,r=1; PD element z | Divisibility φz=z²=2γ₂(z); divided and ordinary domains admit z | Endpoint included | Labels to prose |
| §3.1 divided-image law and ambiguity | Same z; scalar equation in 𝔽₂ | 2γ₂(z)=z²; 2·0=0=2·1 in 𝔽₂ although 0≠1 | Finite-level equation insufficient | Labels to prose |
| §3.2 divided fibre triangle | Horizontal-log point r=0,p=2,n=1 | Operator 1−φ=0 on 𝔽₂; H⁰=𝔽₂,H¹=𝔽₂ | Fibre retains degree one | Labels to prose |
| §3.2 undivided fibre triangle | Same point r=0 | p⁰−φ=1−1=0; same two groups | Equals divided case | Labels to prose |
| §3.2 crystalline realization | Horizontal-log point r=0 | Both coefficient realization fibres [𝔽₂→0 𝔽₂] | Same two terms | Labels to prose |
| §3.2 transition maps | Horizontal-log point r=0, levels 2→1 | Both coordinates 3 mod 4↦1 mod 2; differentials 0↦0 | Chain square commutes | Labels to prose |
| §3.3 ω/τ composites | r=0; scalar model p=2,r=1 with ω=2,τ=1 | At r=0 both 1; model τω=ωτ=2 | Required p^r factor | Labels to prose |
| §3.3 error bound | ×2 on ℤ/4 | Kernel {0,2}, cokernel ℤ/2; 2·2=0 and 2·[1]=0; map not invertible | Killed error distinguished from iso | Labels to prose |
| §3.3 multiplicativity of ω | Scalar coefficient-square model, p=2,r=s=1 | ω₂(1·1)=4=ω₁(1)ω₁(1)=2·2 | Weight addition agrees | Labels to prose |
| §3.3 cup reduction | Weight zero, p=2, 3·3 mod 4 | 9 mod 4=1 reduces to 1; (3 mod 2)²=1 | Equal | Labels to prose |
| §3.4 local PD realization | Horizontal-log point r=0 | Local and global fibres [ℤ/2ⁿ→0 ℤ/2ⁿ]; H⁰=H¹=ℤ/2ⁿ | Matches realization | Labels to prose |
| §3.4 refinement cocycle | Same point, identity presentations | Every transition 1; 1·1=1, both commute with φ=1 | Equal | Labels to prose |
| §3.4 completion and derived reduction | Surjective point tower; tail-sum negative control | Rlim point=[ℤ₂→0 ℤ₂], mod 2=[𝔽₂→0 𝔽₂]; tail tower lim=0 but lim¹ contains nonzero [(1,1,…)] | Derived limit required | Labels to prose |
| §3.4 rational quotient fibre | r=0; point r=1 | DR/F⁰=0; at r=1 DR/F¹=K and quotient 1↦1 | Quotient, not filtered piece | Labels to prose |
| §4.1 lattice construction and Euclidean convention | (p,r)=(2,0),(2,2),(3,4),(3,2) | (a,b)=(0,0),(2,0),(2,0),(1,0); EN denominators 1,8,18,3 | Floor endpoint retained | Labels to prose |
| §4.1 ordinary-generator coordinate | p=2,r=2 | 1=8·(1/8), coordinate 8 rather than 1 | Correct | Labels to prose |
| §4.1 lattice products | p=2,r=s=1; p=3,r=s=1 | CN: (1/2)²=1/4; EN: (1/2)²=2·(1/8); p=3 EN: 1·1=3·(1/3) | Integral coordinates 1,2,3 | Labels to prose |
| §4.1 bad-exponent product | p=2, exponents 1,1→1 | 1/4 divided by target generator 1/2 gives 1/2∉ℤ₂ | Wrong exponent excluded | Labels to prose |
| §4.1 error composition | Lattice maps ×2 then ×2 | Composite ×4 has cokernel ℤ₂/4; 4 kills it; mod 2 both ×2 maps are 0 on nonzero 𝔽₂ | Exponents add | Labels to prose |
| §4.2 period construction and reduction | Weight-zero geometric closed stalk; levels 2→1 | Unit 1 mod 4↦1 mod 4 then 1 mod 2; opposite path 1 mod 2 | Unit/reduction agree | Labels to prose |
| §4.2 ω compatibility | r=0 | ω₀=1; α′(1)=α̃(ω₀1)=1 | Equal | Labels to prose |
| §4.2 period products | Weight-zero units | α(1·1)=1=α(1)α(1) | Equal | Labels to prose |
| §4.2 nearby-cycle target | Trivial-log point versus vertical-log point | X_tr=X but U=Spec ℚ_p in first; X_tr=U in second; p unit on U, p nonunit on X | Generic restriction necessary | Labels to prose |
| §4.3 exact divided comparison | (p,r)=(2,0),(3,1) | Ranges r≤0,r≤1; unit 1↦1 at r=0; on G_m p=3 Kummer generator t has nonzero class of order 3 | Prime endpoints retained | Labels to prose |
| §4.3 truncation | p=2,r=0, geometric closed stalk | H⁰=𝔽₂ and H^q=0 for q>0; τ≤0 retains 𝔽₂ | Source range agrees | Labels to prose |
| §4.3 naturality/products in range | Weight-zero identities and units | Reduction sends 1 to 1, product 1·1=1 | Equal | Labels to prose |
| §4.4 bounded comparison / uniform quantifiers | Error model ×2 on ℤ/2ⁿ, n=1,2,3 | Kernel/cokernel killed by 2 for all three levels; errors nonzero at n=1; one exponent A=1 works in model | No n-dependent choice introduced | Labels to prose |
| §4.4 roots bound qualification | r=0,1; p=2 versus p=3 | Exponents c_p and N+c_p; for p=2 c₂(d) retains d; no assertion c_p=0 | Source qualifications retained | Labels to prose |
| §4.5 gluing restrictions | Empty closed part; identity open immersion | Closed piece 0, glued E=Rj′_*Λ; with j′=id it is Λ | Correct nonzero open object | Labels to prose |
| §4.5 triangle and uniqueness with attachment | Closed-only scalar model S=𝔽₂, open 0 | Localization triangle 0→i_*𝔽₂→id i_*𝔽₂; two attached copies identify by 1 | Attachment retained | Labels to prose |
| §4.5 period restrictions | Weight-zero glued unit | Closed image 1; open image 1; both restrictions of same unit | Equal | Labels to prose |
| §4.5 exactness and no doubled bound | Error sheaf i_*𝔽₂, open restriction 0 | 2·i_*1=0; exponent 1 suffices globally and on closed part | Same annihilator | Labels to prose |
| §5.1 actual HK isocrystal carrier | Good-reduction point; rank-two witness; HK bad Cartier chart p=2,m=3 | φpoint=1,N=0; Nφe1=2e0=2φNe1; bad chart φ(t²)=t⁴=0 while t²≠0 | Bijectivity tied to geometry | Labels to prose |
| §5.1 transported maps | Identity pullback on rank-two witness | φ(e1)=2e1 both before/after; id(φe1)=φ(id e1)=2e1 | Same Frobenius, not arbitrary | Labels to prose |
| §5.2 commutative square | Rank-two datum, r=0,1,2 | N(1−φ/2^r)e1=−e0,0,e0/2; lower map on Ne1 gives −e0,0,e0/2 | Equal | Labels to prose |
| §5.2 total/iterated fibre | Point r=1, φ=1,N=0,E=ℚ₂ | D0(x)=(x/2,x,0), D1=0; H⁰=0,H¹=ℚ₂²,H²=ℚ₂ | Retains both fibres | Labels to prose |
| §5.2 geometric comparison uses deformation | Same point r=1 | Three-term C_st ranks 1,3,1 and differential ranks 1,0; replacing by horizontal single fibre gives H¹ dimension 1 instead of 2 | Domains kept distinct | Labels to prose |
| §5.2 uniformizer change | N²=0; log(u)=c; e=2 | exp(cN)e1=e1+c e0; exp(−2c(−N/2))e1=e1+c e0 | Positive Taylor sign agrees | Labels to prose |
| §5.2 base adapter equivalence domain | e=2,1,0 | Third/last scalars −1/2,−1,0; first two invertible, last kills e0≠0 | e≥1 retained | Labels to prose |
| §5.3 classical/h adapter | Identity arithmetic pair; p=2,r=0 | Identity realization sends unit 1↦1; τ≤0 retains H⁰ and discards degree-one component | Truncation retained | Labels to prose |
| §5.3 product and projections | Identity pair; two unit classes | 1·1=1; source projections unchanged 1,0 | Equal | Labels to prose |
| §5.3 arithmetic period agreement | Weight-zero unit | Transported and base periods both send 1 to 1 | Equal | Labels to prose |
| §5.3 geometric/Galois agreement | Weight-zero unit after algebraic closure | g(1)=1; both periods 1 | Equal | Labels to prose |
| §6.1 relative datum construction | Identity family, P¹ family, empty family | Ranks (1,0,…),(1,0,1),(0,0,…); φ on P¹ H² is p=2, not 1/2 | Twist agrees | Labels to prose |
| §6.1 comparison map | Identity family | c(b⊗z)=bz; c(1⊗2)=2 | Scalar extension explicit | Labels to prose |
| §6.1 frame identification | Constant G_m family | Both frames give H¹ basis dlog t, coefficient 1 | Same class | Labels to prose |
| §6.1 family naturality | t↦t² on constant G_m | Pullback dlog t=2dlog t; φ then pullback 2·2=4, opposite 2·2=4 | Equal | Labels to prose |
| §6.2 admissibility construction | Identity; zero datum; c=0 on rank one; generic-divisor family | Ranks 1,0; bad c(1)=0≠1; generic-divisor poles (pt−1)^−m have unbounded m though rigid rank is 1 | Independent algebraic conditions retained | Labels to prose |
| §6.2 forgetting promotion | Identity family | Realizations B_K,B†_K, c(1)=1, ∇1=0, Φ1=1 before/after | Same data | Labels to prose |
| §6.2 filtered base change | Constant G_m, identity base map | dlog t↦dlog t; F⁰H¹=H¹,F²H¹=0; φ coefficient 2 on both | Filtration and φ agree | Labels to prose |
| §6.2 uniqueness | Constant G_m coefficient | A false φ′=4 gives φ′dlog t=4dlog t≠2dlog t | Actual datum fixes structure | Labels to prose |
| §6.3 compactification definition / data witness | A¹×G_m⊂P¹×P¹; colliding 0,t sections | Horizontal points 0,∞ distinct; over t=0 colliding pair has 1 geometric point instead of 2 | Relative condition discriminates | Labels to prose |
| §6.3 isomorphic witnesses | Identity diagram | T={∞}, horizontal D={0,∞}, interior A¹×G_m unchanged | Same interior | Labels to prose |
| §6.3 intrinsic-object independence | Two identical constant G_m presentations | Both H¹ rank 1, basis dlog t, φ=2 | Same intrinsic maps | Labels to prose |
| §6.3 vertical boundary restriction | Constant G_m example | f⁻¹(∞)∩f⁻¹(A¹)=∅; horizontal boundary remains {0,∞}×A¹ | Correct restriction | Labels to prose |
| §6.4 projective geometric theorem | Constant genus-g curves, g=0,1 | Cohomology ranks (1,0,1),(1,2,1) | Zero and positive genus included | Labels to prose |
| §6.4 good-compactification theorem | Constant G_m, p=2,3 | H⁰ rank1,H¹ rank1; φ(dlog t)=2dlog t,3dlog t | All-prime scope retained | Labels to prose |
| §6.4 horizontal comparison | Constant G_m | ∇dlog t=0 on base; cφ(dlog t)=2dlog t=φc(dlog t) | Equal | Labels to prose |
| §6.5 continuous-form comparison | Affine line, G_m, ramified ℤ₂[π]/(π²−2) affine line | (H⁰,H¹)=(K,0),(K,K dlog t),(B†_K,0); no AM Frobenius on ramified base | Domain separation retained | Labels to prose |
| §6.5 coherent corollary / affine restriction | Affine constant G_m versus proper elliptic E | Base higher coherent cohomology 0; proper E has H¹(O)=K≠0 | No improper affine reduction | Labels to prose |
| §6.6 residue-sequence theorem / strict exactness | P¹−{0,∞}; empty boundary on P¹ | 1↦(1,−1)↦0, ranks 1→2→1; empty boundary leaves H²=K≠0 | Affineness retained | Labels to prose |
| §6.6 local residue law | t at 0; s=1/t at ∞ | dt/t=−ds/s; residues +1,−1 | Correct orientation | Labels to prose |
| §6.6 Frobenius and nonsplit boundary | p=2, split G_m; quadratic unramified boundary | Res φ(dlog t)=(2,−2)=φ_−1(1,−1); trace-zero line has eigenvalue −2 | Extra p factor retained | Labels to prose |
| §6.6 residue on Ext | Split extension; coefficient map twice the residue coordinate at 0 | Split 0↦0; class a=3 gives remainder −3↦−6, same as residue pushout | Evaluation naturality agrees | Labels to prose |
| §6.7 geometric projections / delta | Split family; point E_3 | δ=0,R=0 for split; δ(E_3)=0 | Unique lift used | Labels to prose |
| §6.7 remainder and twist | G_m n=1,r=2; point E_3 | H¹(G_m)(2)=O(1), φ=1/2; R(E_3)=−3h | Twist and sign retained | Labels to prose |
| §6.7 residue compatibility | Split extension, m=2 | Residue target twist 2−1=1; δ=R=0 before/after | Shift included | Labels to prose |
| §6.7 Frobenius-lift change | σ=σ′; general common lift e | R′−R=0=(Φ−Φ)e; δ′=δ | Identity witness agrees | Labels to prose |
| §7.1 Frobenius-point construction / reduction | σ(t)=t^p, a=0,1; σ(t)=t^p+p, a=0 | Lifts 0,1; shifted lift z satisfies z=z^p+p, hence z≡p mod p² and z mod p=0 | Lift distinguished | Labels to prose |
| §7.1 commutation | p=2, σ(t)=t², lifts 0,1; wrong t=2 | 0²=0,1²=1; 2²=4≠2, difference 2≠0 mod4 | Wrong lift excluded | Labels to prose |
| §7.1 uniqueness | p=2, σ(t)=t², z≡0 mod2 | z²=z implies z(z−1)=0; z−1 unit gives z=0; at residue1 gives z=1 | Both residue classes | Labels to prose |
| §7.1 point naturality | t↦t² between standard Frobenius affine lines | [a]²=[a²]; a=0,1 gives 0,1 both paths | Equal | Labels to prose |
| §7.2 detection theorem | Zero module; constant1; finite-residue counterexample | 0 evaluates0, 1 evaluates1; at p=2 t²−t vanishes at lifts0,1 but polynomial coefficient of t²=1 | Algebraic closedness retained | Labels to prose |
| §7.2 equality detection | Equal constants 3,3; unequal constants 3,4 | Difference0 evaluates0; difference−1 evaluates−1≠0 | Both outcomes discriminate | Labels to prose |
| §7.2 zero-rank API | Rank0 | Only section0; every evaluation0; conclusion0=0 | Included | Labels to prose |
| §7.2 arbitrary lift choices | Constant1 at arbitrary lifts; nonzero primitive reduction f | Every lift evaluates1; choose residue a with f(a)≠0 so value mod p is f(a)≠0 | Frobenius not needed | Labels to prose |
| §7.3 specialization evaluation | Constant E_3 at standard lift0,1; split | R specializes to −3h=R(E_3 fibre); split gives0 | Same actual extension | Labels to prose |
| §7.3 Ext/evaluation square | E_3 and identity point map | u(E_3)=−3h both paths; degree0 unit1↦1 | Equal | Labels to prose |
| §7.3 filtered lift | E_3 at any compatible constant point | e has quotient coordinate1 before/after, H F⁰=0 | Same unique lift | Labels to prose |
| §7.3 Frobenius remainder | E_3, p=2; wrong point t=2 | (1−Φ)e=−3h before/after; wrong point 4≠2 fails base equation | Compatibility essential | Labels to prose |
| §7.4 horizontal log/rigid comparison | Point r=0,1; G_m r=1 | Point horizontal H¹=K at both weights; vertical r=1 H¹=K²; φdlog t=p dlog t both realizations | Distinct log structures retained | Labels to prose |
| §7.4 fibre identification | Horizontal point r=0 | Both fibres [K→0 K], basis1↦1 | Same map | Labels to prose |
| §7.4 cup compatibility | Weight-zero units; G_m² logarithmic classes | 1·1=1; ordered wedge coefficient1 on both | Equal | Labels to prose |
| §7.4 period square | Weight-zero unit | Both periods send1 to1 | Equal | Labels to prose |
| §7.5 absolute extension value | Good compactified curve n=1,r=2; split; point n=0 | F²Ω•curve=0, connecting H¹rig≅H²rsyn; split value0; point E_3 gives −3h | Same sign and hypotheses | Labels to prose |
| §7.5 connecting sign | b=1 in Fib(0→K[0]) | Connecting representative (0,1), not (0,−1) | Positive sign | Labels to prose |
| §7.5 specialization/base change | Point E_3; coefficient scalar2 | Value−3h specializes to−3h; scalar2 gives−6h on both paths | Equal | Labels to prose |
| §7.5 period compatibility | Split absolute extension | Log and rigid period images both0 | Equal | Labels to prose |
| Mixed-characteristic and AM Frobenius convention | π²=p, p=2,3 | v_π(Fπ)=1, v_π(π^p)=p; difference valuation1<2=v_π(p) | Ramified classical cases retained; AM lift excluded | Unchanged |
| Cochain shift / connecting convention | Fib(×2:ℚ→ℚ); two-term identity complexes | d1=2; next component a−a=0; connecting b=1 represented +1 | Signs agree across §§1.4,7.5 | Unchanged |
| Tate normalization | p=2,O(1),H¹G_m | φO(1)=1/2,F⁰=0; φH¹=2; tensor (1/2)·2=1 | Inverse exponent fixed | Unchanged |
| Monodromy / uniformizer convention | N²=0, Ne1=e0, e=2 | Nφe1=2e0; exp(cN)e1=e1+c e0; −e·N_b=N_c | Same witness in §§5.1,5.2 | Unchanged |
| Residue convention | G_m at0,∞ | Res(dlog t)=(1,−1); sum0 | Same twist/sign in §6.6 | Unchanged |
| Finite coefficients / denominator convention | p=2,r=2,n=1 | 1/8≠0 in ℚ₂; generator class1≠0 in its quotient, inclusion coordinate2 gives0 | Quotients are of lattices | Unchanged |
| Universe and zero-object conventions | Empty schemes, zero modules, identity maps | Realizations0, products0, unique zero map0; id on rank-one object1 | No nonemptiness introduced | Unchanged |


### Validation

`lake build TauCetiRoadmap.CohomologyComparisonsPartII.Suggested` exited 0, with the exact output:

```text
✔ [8976/8976] Built TauCetiRoadmap.CohomologyComparisonsPartII.Suggested (3.2s)
Build completed successfully (8976 jobs).
```

The dependency-direction command exited 0, with its complete output:

```text
depcheck: 13 roadmaps, 99 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The full gate was rerun after commit `ad62fb06`, exited 0, and produced this exact summary:

```text
gate CohomologyComparisonsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Only the two authorized roadmap files were committed. The worktree is clean; nothing was pushed.
