<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13130#issuecomment-6785499063 -->
Review (codex) of 3489b8d

Verdict: accepted
Conditional on the announced gaps: `reductive-salvetti-homotopy-type`, `algtop-semisimplicial-realization`, `algtop-borel-construction`, `algtop-join-connectivity`, `geomtop-arc-isotopy-extension`, `geomtop-marked-disc-diffeomorphisms`, `geomtop-boundary-pointwise-disc-smale`, `dga-graded-tor-spectral-sequences`

No new findings. Acceptance is conditional on the eight declared supplier contracts listed below. The four authored package files and the design were not changed. Source errata below are observations about the sources, not requests to change this package.

In this report, `README.md` and `Suggested.lean` refer to `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/`. Library paths are relative to their pinned repositories. Roadmap paths are relative to the content repository.

## Previous findings, checked individually

| Previous finding | Status | Repaired passage and independently checked witness |
| --- | --- | --- |
| Round 3 F01: duplicate block inclusion | Repaired | README.md:483–488 now says “`TauCeti.BraidGroup.natAdd m` for `n ≥ 1` and as the trivial homomorphism out of `B_0 = 1`”. Suggested.lean:187–189 implements precisely that adapter. The supplier attribution appears in scope at :89, in the contract at :201 and in the coset construction at :1122. At native index 0, `shiftHom 1 2` sends σ₀ to σ₁, whereas `strandIncl` sends it to σ₀. For every positive input length the adapter is definitionally `natAdd`; at length zero its value is 1. |
| Round 3 F02: positive-face negative control | Repaired | README.md:1282–1285 says the inverse “gives `((23); (13), x)`” whereas the positive move “gives `((13); (12), x)`”. Direct multiplication gives (12)(23)(12)=(13) and (23)(12)(23)=(13), with different retained entries. The added general positive-braid formula at :1285–1288 also agrees with composition from right to left; the actual face remains the inverse braid. |
| Round 3 F03: cover versus permutation fibre | Repaired | README.md:1398 introduces “let `F` be the fibre of `X` over the base configuration”; :1401–1404 uses `k[F]_G = k[F/G]` and `H_p(B_n; k[F/G]) ≅ H_p(B_n; k[F])_G`. For G=1,n=1 both intended H₀ groups have rank 1. For S₃ transpositions,n=2 the marked rank is 5 and both quotient ranks are 2. The total-space point basis would instead have uncountable rank in the first example. |

Pattern searches covered all occurrences of block/shifted inclusion, `shiftHom`, `natAdd`, positive/inverse face braids, `s_(q,i)`, `k[X]`, `k[F]`, `X/G` and quotient homology. The remaining `k[X]` in §0.5 explicitly uses a braid **set** X. Neither the old presentation construction nor the two incorrect formulas survives. The source-level attribution and the generator formula remain compatible with every Lean consumer.

The earlier ownership dispute with ArithmeticStatisticsPartVIII §5.16 remains settled as not actionable in this package, as recorded in the supplied previous review and repair. It is not re-raised here. Its continued overlap is recorded under the ownership audit; acceptance does not assert that the overlap has disappeared.

## Verified sound

### Coverage and principles

Read all 46 numbered targets in the six layers, their API bullets and Checks, all conventions, supplier contracts, dependencies, examples and references, and the complete 533-line acceptance file. Re-read the two changed proof/docstring regions and all added repair prose. Read main's ReductiveGroups, AlgebraicTopology and GeometricTopology for shape as well as supplier resolution.

The preceding round's adversarial table has computed rows for all 46 numbered targets. For unchanged material outside this round's sample, I retained only those explicit computed rows, not its general assertions of correctness. Those retained rows include the degree-zero/zero-module and shift cases of §§1.1–1.3, the dual-number resolution of §1.5, the torsion shift in §1.6, Laurent-module Nakayama negative control in §1.8, and the polynomial-ring K-homology calculations in §§1.10–1.12 and §§1.14–1.19. The sampled targets, both headline theorems, the omitted geometric headlines and every changed passage were checked afresh as recorded below.

The organization is mathematical: components supply the graded estimates; the independent arc-topology input meets those estimates in the arc spectral sequence; induction gives stability; finite cells then give the uniform bounds. Layer dependencies force that order, except the explicitly independent Layers 1 and 2. There is no assertion of following a source's organization and no layer named for a source chapter.

This extends the parent's stated stopping point. The parent still owns the braid action/orbit monoid, spaces, moduli and fixed-degree comparisons. The real-bodied acceptance implementation of its action is explicitly attributed and is used to state the actual headlines. Native positive-length block inclusion is now reused. No executable mathematical algorithm, route-specific restriction, copied exposition, sorry'd data, empty predicate stand-in, forbidden supplier, `lemma` declaration or `set_option` was found. Field restrictions are those required by averaging and component stability, with a computed bad-characteristic obstruction below. The arithmetic prime restriction is the exact fixed-degree comparison contract, not a substitute for missing ramification theory.

Each definition/construction block has an API and at least three Checks; theorem blocks state their hypotheses and source locators. Every layer ends with Examples and Dependencies. The single `import Mathlib` is followed only by the used braid module. There are no process dates, job/PR references, local machine paths or HTML anchors in the authored roadmap/Lean text. Metadata is `topic = "math.NT"`. All six cited works have one manifest key each.

### Adversarial table

Here P=k[t], deg(t)=1; when U=t, the package constants may be A1=1,A2=2,A0=7. The table contains the 15 sampled targets, headline results and repair targets. An equality of matrices or chains was checked over integers before reduction where stated.

| Statement | Instances tried | Computed values on each side | Result / change |
| --- | --- | --- | --- |
| §0.2 involutions | S₃,C₆,S₄ | In order 6=2·3 the Sylow-2 order is 2; S₃ has one class of 3 involutions and generated subgroup order 6. In C₆ the unique involution generates order 2≠6. S₄ has two involution classes, sizes 6 and 3, and 24/2=12 is even. | Correct; generation remains an extra hypothesis. |
| §0.3 action | All 216 triples in S₃; pair ((12),(23)) | The two braid-relation words agree on all 216 triples. Positive move=((13),(12)); inverse=((23),(13)); input and positive output products both (123), while the plain swap has product (132). | Correct action and orientation; plain swap excluded. |
| §0.3 fibres and quotient | S₃ transpositions,n=0,1,2; G=1,n=0 | Marked fibre sizes 1,3,9. At n=2 full fibre size 6; braid orbits have sizes 1,1,1,3,3; simultaneous-conjugation orbits have sizes 3,6. Unmarked fibre sizes 1,1,2. Full fibre at n=0 has size 0 for S₃ and 1 for G=1. | Conditions determine the intended objects; no product-one constraint or forced point. |
| §0.4 and `shiftHom` repair | n=0; m=1,n=2; arbitrary m,n+1 | Empty-group braid maps to 1; σ₀ maps to σ₁ in B₃; `shiftHom m (n+1) = natAdd m` by definitional equality. Empty prefix leaves the tuple unchanged. | Native adapter and all-n extension correct. |
| §0.4 equivariance | Prefix (g), tail (a,b), positive generator | Both sides give (g,aba⁻¹,a); boundary product is g·a·b on both sides. A prefix-free shift would act on g and fail this equation. | Correct. |
| §0.8 component stability | S₃ transpositions,n=0,…,6; U₁,n=0,…,4 | Orbit counts 1,3,5,6,6,6,6. U matrices have shapes 5×1,6×3,6×5,6×6,6×6. Ranks over F₅:1,3,5,6,6; over F₃:1,3,3,3,3. Exact C₂ diagonal coefficient=1; full S₃ coefficient=3. | Correct eventual statement and field restriction; it does not promise small-n isomorphisms. |
| §1.4 balanced estimate | N=k[2],M=k[3] over P; N=0 | Tensor=k[5]; degree bound 5≤2+3=5. For N=0 the tensor is zero with support −∞. The relation identifies (na)⊗m with n⊗am, with sign +1. | Correct without flatness or commutativity. |
| §1.7 higher quotient Tor | P,U=t²,M=k; M=0 | Tor₀=k, Tor₁=k[2], higher Tor=0; δ=2,A1=2, giving 0≤2 and 2≤4. P₁=P[2] makes t² a degree-zero map; unshifted input would have degree +2. For zero M every term is zero. | Shifted splice and enlarged slope correct. |
| §1.9 low augmentation Tor | P,U=t,M=k or P | For k: δ=1, RHS=max(0,1)+4=5. For P: δ=0, RHS=max(0,−∞)+4=4. | Correct bounds. |
| §1.13 generator homotopy | S₃ and an A₄ 3-cycle class; chain degrees 0,1,2, coefficient words of length 0 or 1 | dS+Sd minus right multiplication has every coefficient 0 in 156 S₃ and 420 A₄ instances. At q=0,s=r_h both sides give r_h r_g via prefix hgh⁻¹. For P, d₁=t,d₂=0, giving dS+Sd=t in degrees 0 and 1. | Correct nonabelian conjugation; constant-prefix wrong model excluded. |
| §1.16 universal coefficients | M=P; M=k,q=3 | For P higher Tor=0 and the diagonal is H_jK(P). For k, H₃K(k)=k[3], so 3≤1+3+4+2=10. Source's A1=0,A2=1 would give 3≤2. | Package's positive slope repairs the source. |
| §1.19 low-K stabilization headline | P,M=P,b=0; M=k,b=1 | Multiplication t on P_n has matrix [1] already for n=0; advertised n≥7 is sufficient. For k, n≥8 has zero source and target, hence a bijection. A(M)≤b+5< b+7 in the chosen constants. | Correct source-degree range; missing K carrier is documented in Lean. |
| §2.3 truncated cosets | n=0,1,2; n=3,q=0 | A(0) has 0 simplices. A(1)₀ has 1 point and A(1)₁ has 0. A(2)₀=A(2)₁=ℤ. L_(3,0)=⟨σ₂⟩, matching native index shift 0→1. Top-degree tail B₀ has one element. | Correct truncation and repaired inclusion attribution. |
| §2.4 semisimplicial faces | q=1; q=2,i=0,j=1 | Edge b has ordered faces bσ₁,b. Composites give bσ₂σ₁L₀ and bσ₁σ₂σ₁L₀=bσ₂σ₁σ₂L₀=bσ₂σ₁L₀. | Braid relation and σ₂∈L₀ give equality; handedness correct. |
| §2.5 stabilizers | n=2,q=1; n=3,q=0 | Edge stabilizer has order 1; vertex stabilizer is ⟨σ₂⟩≅B₂. In n=2, edge b has integer vertices b+1,b. | Correct left action and right-multiplication faces. |
| §2.6 connectivity headline | n=0,1,2; S⁰*S⁰ | Realizations are empty, point, and the line with edges [b,b+1]. Required connectivity is respectively unasserted, ≥−1, ≥0. Join S⁰*S⁰=S¹ has connectivity 0=−1−1+2. | Correct small-n and join conventions. |
| §3.2 Borel arc resolution | n=0,1,2 | At n=0 augmentation is empty→point, H₀ ranks 0→1. At n=1 fibre is a point; at n=2 fibre is ℝ, so both have reduced homology 0. For q≥n chain groups are 0. | Stated comparison range and boundary exclusions correct. |
| §3.3 repaired face Check | q=1,i=0,S₃; q=2 symbolic | Inverse gives ((23);(13)); positive gives ((13);(12)). For q=2,i=0 the positive braid gives (g₀g₁g₂(g₀g₁)⁻¹,g₀;g₁), while the inverse gives (g₁,g₂;g₀^(g₁g₂)). | Both retained-entry and conjugation distinctions now correct. |
| §3.5 low-K edge sequence | G=1,p=0,n=0,1 | At n=0: 0→0→0→k→k→0. At n=1: 0→0→k→k→0→0. In the second case E²₀₀=k but H₁K(P)=0. | Exact; the zeroth column must be the cokernel, not H₁K. |
| §§4.2–4.3 stability headline | G=1,p=0,1; S₃,H=C₂ | For n≥1 the trivial-group H₀ stabilization is [1]. H₁(B₁;k)=0 but H₁(B₂;k)=k, so a threshold is necessary. Constants A=21,B=11 imply n≥2+21p+7. In the S₃ exact-C₂ stratum one summand remains with coefficient 1, not 3. | Correct uniform constants and subgroup filtration; full flag is preserved. |
| §4.4 repaired quotient comparison | G=1,n=1; S₃,n=2; C₂ | Singleton fibre yields rank 1=1, versus uncountable total-space basis. S₃ marked H₀ rank 5 descends to coinvariant rank 2=unmarked rank 2. C₂ conjugation quotient is identity, with stabilizer order 2. | Correct nonfree quotient comparison. |
| §§4.4–4.5 unmarked headline | C₂ antipodal S² over F₂; S₃ permitted fields | Bad-characteristic control gives dim H₁(RP²;F₂)=1 versus dim H₁(S²;F₂)_C₂=0. In characteristic prime to 6, S₃ averaging uses nonzero 6, and the component quotient has ranks 5→2. | Exact coinvariants justify the general-G extension; centrelessness is not needed topologically. |
| §5.1 cells | n=0,1,2,3; S₃ full n=0,2 | Base cell totals 1,1,2,4; n=3 cells by degree (1,2,1). Full S₃,n=0 has 0 cells. At n=2, 6 sheets lift the 2 base cells to 12≤12²=144. | Correct truncations, Weyl type and sheet factor. |
| §5.1 plane/disc transport | z=0,1,2 | Images 0,1/√2,2/√5; inverse at 1/√2 is 1. Radial derivative (1+r²)^(−3/2)>0. The two coordinates of the supplier half twist at t=1/2 are 1/2−i/2,1/2+i/2. | Injective, onto the disc, orientation preserving and permutation equivariant. |
| §5.2 uniform Betti headline | S₃,i=0; arbitrary i and reduced degree m | Sampled component ranks ≤6. Exponent difference (A+B+a+1)(i+1)−(Ai+B+a)=(B+a+1)i+A+1>0. Reduction stops with m≤Ai+B+a in the same residue class. | C is chosen before field,i,n; cardinal rank prevents an infinite-finrank false positive. |
| §5.3 étale headline | G=1,n=0,1; S₃,q=5,n=2,ℓ=7 | Trivial-group scheme dimensions are 1 at (i,n)=(0,0), otherwise 0. For S₃,7>max(6,5,2)=6; full unmarked H₀ rank=1. Rational/mod-2 degree-one dimensions of RP² are 0 and 1. | Exact-branch identity case treated separately; comparison and rank inequality support both coefficient versions. |

The hypotheses were also read against the formulas: internal grading is nonnegative; zero support is −∞; finite G makes the conjugacy sums and subgroup filtration finite; fields exclude the zero ring; all stabilizing blocks have positive length divisible by d. `n−q` is explicitly zero below the shift threshold, rather than silently using natural subtraction. Group actions and full-monodromy predicates have actual tuple carriers. No arbitrary map/complex is used as a stand-in for the constructed object. The total-degree diagonals of both spectral sequences are finite, with convergence supplied by named contracts. Polynomial identities are integral, and the sampled group computations distinguish commuting and noncommuting inputs.

### Seeded source verification

All 15 seeded targets were checked at their locators in the supplied legal text extractions. EVW pages are explicitly the arXiv v4 pages; CD95 pages are the author's manuscript pages. The source hypotheses and proof steps were checked, including the corrections already incorporated by the package.

| Target | Text and locator opened | Support for the stated target |
| --- | --- | --- |
| 0.2 | EVW16 line 544, Lemma 3.2, p.12 | Odd half-order and the separate generation hypothesis match. |
| 0.3 | EVW16 lines 399–428, Definition 2.2, pp.9–10; §2.4, p.11; positive convention at EVW16 line 102 | Four fibres, conjugation, commuting braid action and Borel interpretation match; the known reversed fibre list is corrected. |
| 0.8 | EVW16 lines 574–685, Proposition 3.4, p.13, and Lemma 3.5, pp.14–15 | Eventually bijective finite-set maps, common permutation exponent, exact-image filtration and invertible class sizes give the asserted field-uniform statement. Positive multiples and simultaneous subgroup choices follow from that finite family. |
| 1.4 | EVW16 lines 785–799, Lemma 4.4, p.17 | Bounded right-module filtration, shifts and augmentation coinvariants; no flatness or commutativity hypothesis added or dropped. |
| 1.7 | EVW16 lines 866–898, Lemma 4.7, p.19 | Same hyperhomology proof, with P₁=R[a] and Q-terms shifted by a; A1≥a absorbs the extra degree. |
| 1.9 | EVW16 lines 909–927, Lemma 4.9, p.20 | Low change-of-rings exact segment and Nakayama yield the displayed maximum plus 4A1. |
| 1.13 | EVW16 lines 953–958, proof of Lemma 4.11, p.21 | Prefix conjugated by inverse total boundary in exponent notation; same k-linear, not right-R-linear, null-homotopy. Degree-zero extension checked explicitly. |
| 1.16 | EVW16 lines 979–988, Proposition 4.13, p.21 | Universal coefficients and diagonal estimate match after the package's necessary A1≥1 enlargement. |
| 2.3 | EVW16 lines 1062–1069, §5.2, p.23 | Tail subgroup and right-coset-face formula match. Package correctly makes q≥n empty. |
| 2.4 | EVW16 lines 1070–1095, Proposition 5.3, pp.23–24 | Well-definedness, semisimplicial identity and the ordered vertex formula match. |
| 2.5 | EVW16 lines 1160–1251, Proposition 5.6 and (5.6.1), pp.25–27 | Transitivity, simultaneous arc fixing, cut-disc stabilizer and face compatibility match. Relative isotopy extension is a declared supplier contract. |
| 3.2 | EVW16 lines 1099–1111, §5.3, p.24 | Borel resolution, fibre connectivity and homology range t<n−2 match. |
| 3.5 | EVW16 lines 1279–1306, proof of Theorem 6.1, p.28 | Source identifies the coker-to-M edge. The package's five-term exact sequence is its kernel/cokernel chain-algebra expansion, valid even outside the convergence comparison range. |
| 5.1 | EVW16 lines 501–505, Proposition 2.5, p.11; CD95 line 181, Theorem 1.4.1, p.5, and lines 324–335, Lemma 2.2.1/Corollary 2.2.3, pp.8–9 | Reflection-complement homotopy model and one cell for each finite parabolic subset; all subsets qualify for finite S_n. The other two Hurwitz variants are subcovers/quotient fibres, so the same sheet bound applies. |
| 5.3 | EVW16 lines 1578–1608, Proposition 7.8, pp.34–35, (7.8.1)–(7.8.3), Remark 7.9 | Centreless rational nonsplitting generating class, coefficient-prime range, mod-ℓ proof and rational-rank inequality match. Package avoids the source's erroneous stabilization step by comparing only at fixed n. |

Also opened HW10 lines 1625–1667 (Lemma 7.1 and Proposition 7.2, pp.34–35), SMA59 lines 15–17 and 124–129 (Theorem B and Theorem 4, printed pp.621,624), and the EVW16 passages supporting the source errata below. No author-flagged readable/unverified locator remained outside these checks; PAL60 and ALEX23 are the settled uncertified exceptions. No source fetch or manifest addition was necessary.

### Pinned declarations and duplication by object

Pins read from `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

The following declarations and their surrounding signatures were opened at those pins. This is also the resolution of the library names in the supplier contracts; proof-only names used in Lean were checked by successful elaboration.

| Pinned file and lines | Declarations/actual contract checked |
| --- | --- |
| `Mathlib/Algebra/Group/Conj.lean`:32,133,151,278,286 | `IsConj`, `ConjClasses`, `mk_eq_mk_iff_isConj`, `carrier`, `mem_carrier_iff_mk_eq`. The native conjugacy relation uses a unit conjugator; for groups it is the intended ordinary conjugacy. It does not contain nonsplitting or generation. |
| `Mathlib/Algebra/Group/Subgroup/Lattice.lean`:329; `Map.lean`:262,582 | `Subgroup.closure`, `map_top_of_surjective`, `MonoidHom.map_closure`; needed generation/image conditions are retained. |
| `Mathlib/GroupTheory/Sylow.lean`:200,347,842 | `IsPGroup.exists_le_sylow`, `Sylow.isPretransitive_of_finite`, `Sylow.card_eq_multiplicity`; finite G and prime 2 discharge their hypotheses. |
| `Mathlib/Algebra/MonoidAlgebra/Defs.lean`:222; `Module.lean`:78,250; `Basic.lean`:737; `Grading.lean`:49,156 | `single`, `mapDomainLinearMap`, `lhom_ext'`, `toAdditiveAlgEquiv`, `AddMonoidAlgebra.gradeBy` and its grading. Finitely supported coefficient modules need no multiplication on the fibre set. |
| `Mathlib/RepresentationTheory/Basic.lean`:395; `Rep/Basic.lean`:92,333; `Rep/Res.lean`:43 | `Representation.ofMulAction`, `Rep.ofHom`, `Rep.ofMulAction`, `Rep.res`; restriction has the direction used by the stabilization morphisms. |
| `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean`:222–227; `Functoriality.lean`:154–159 | `groupHomology` is inhomogeneous-chain homology in a common universe; `map` takes f:G→H and A→Res(f)B. The package uses that direction and universe. |
| `Mathlib/CategoryTheory/GradedObject.lean`:43; `CategoryTheory/Abelian/LeftDerived.lean`:105,109; `Algebra/Homology/SpectralSequence/Basic.lean`:36 | `GradedObject` is a family, not a graded module. `Functor.leftDerived` and `ProjectiveResolution.isoLeftDerivedObj` provide the derived-functor carrier. `SpectralSequence` has pages and next-page isomorphisms, no abutment/convergence field. |
| `Mathlib/Topology/Covering/Basic.lean`:287; `GroupTheory/FreeGroup/Basic.lean`:459; `LinearAlgebra/Dimension/Basic.lean`:68 | `IsCoveringMap` requires evenly covered points, not surjectivity/nonempty fibres. `FreeGroup` is the reduced-word quotient. `Module.rank` is cardinal dimension. Empty full fibres and potentially infinite dimensions are therefore treated correctly. |
| `Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean`:76; `Analysis/Normed/Module/Ball/Homeomorph.lean`:46,98 | Scheme `EllAdicCohomology` uses the integral pro-étale sheaf; it supplies no Hurwitz scheme. `Homeomorph.unitBall` has the stated radial map and inverse. |
| `TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean`:99,106,120,125,168,181,206,217,222,225,358,380,494,499,504 | Braid carrier, generators, relations, induction, `lift`, trivial small braid groups, strand indices, `permHom`, `strandIncl`, `natAdd`, `natAdd_sigma`, `pureSubgroup`. The distinct inclusion conventions are preserved. Native `natAdd` supplies construction and generator values, not its injectivity/image theorem. |
| `TauCeti/Geometry/Diffeomorphism/Disc.lean`:63; `FixingSubgroup/Basic.lean`:149; `FixingSubgroup/Topology.lean`:41; `Topology/Homotopy/SerreFibration/Basic.lean`:107 | `DiscDiff`, `RelativeDiff`, `Diffeomorph.isClosed_fixingSubgroup`, `TopCat.serreFibrations`. `DiscDiff` fixes the boundary pointwise. Compactness/Hausdorff hypotheses for closed fixing subgroups hold for the disc. The fibration predicate itself is a disk-lifting property, not a homotopy LES. |
| `TauCeti/Algebra/Category/GradedModuleCat/Basic.lean`:62,292; `Abelian.lean`:290; `Free.lean`:225 | Scalar-compatible internally graded modules, `shiftFunctor`, abelian instance and `enoughProjectives`; no positivity or finite-dimensionality is built into the carrier. The maximum-universe condition for projectives is satisfied by the intended small algebra/module carriers. |
| `TauCeti/Algebra/Module/GradedModule/Internal.lean`:93,118; `Opposite.lean`:65; `Trivial.lean`:45 | `InternalGrading`, `ofDecomposition`, `opposite`, `trivialGrading`. Direct-sum decomposition and degree-zero base are real data; the opposite grading changes the module action, not the internal degree. |
| `TauCeti/LinearAlgebra/TensorProduct/Balanced/Basic.lean`:43,55,134,184; `Grading/Basic.lean`:100; `Unit.lean`:48,122; `Finsupp.lean`:69 | Unsigned balanced relation, `BalancedTensorProduct`, `balance`, `liftEquiv`, `grading`, `lid`, `rid`, `finsuppScalarRight`. The last concerns a free left module in the second slot; the §1.12 free-right evaluation can be constructed from the cited universal property by (δ_w r)⊗m↦δ_w(rm), inverse δ_w m↦δ_w(1)⊗m. No commutative flip is required. |
| `TauCeti/Algebra/Category/GradedModuleCat/BimoduleTensor/Basic.lean`:382 | `bimoduleModuleTensor` takes a module over the graded enveloping algebra A⊗Bᵐᵒᵖ and a left B-module, yielding a graded A-module. A=k gives the intended functor for derived Tor. |

Object searches covered nonsplitting/generation, braid tuple actions, block inclusions, component algebra, graded tensor/Tor, arc/Borel constructions, stability and uniform Betti bounds in the pinned libraries, main roadmaps, board packages and indexed open heads. Hurwitz transposition-length inequalities and Hurwitz zeta functions are different objects. No pinned headline stability or uniform Betti theorem was found. The native tensor/category carriers are consumed, not rebuilt. Borel models in main's GeneralizedCohomology around :2461 and SymplecticGeometry/ConvexityToric around :462 concern torus actions and do not supply the discrete-group semisimplicial/induced-space contract. Foams §0.10's commutative graded-base tensor/coherence likewise does not supply the internally graded noncommutative Tor spectral sequences.

### Supplier order, current citations and open ownership

Read the board-package index before searching. Ran the required `roadmaps grep` and `roadmaps show` searches. Read the supplied overlap report: no competing head changes this package, no cited id is dropped, and no cited numbering exists only in an open revision. Current resolver reports no unresolved cross-roadmap or own Lean name. Its warning that it could not itself check external library names was handled by the independent pinned-file audit above. The earlier `HurwitzFibre.smul_tuple` lead is resolved by Suggested.lean:309 and the successful explicit `#check`.

| Supplier | Resolved location and use |
| --- | --- |
| Parent, new-roadmap PR #850 | `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md`:2710,2753,2783,2874 resolve §IG.3.2; :5426,5462 resolve §IG.5.1; :5532,5568 resolve §IG.5.2; :5656,5741 resolve §IG.5.3; :6020,6065 resolve §IG.5.5. Read the action/generation conditions, all four fibres, centralizers, exact branch locus, rational class and fixed-degree coefficient range. The parent's configuration theorem explicitly excludes the mapping-class comparison, so §2.1 here is an extension, not a second owner. |
| ReductiveGroups, main | `TauCetiRoadmap/ReductiveGroups/README.md`:4396–4482 Layer 11A; :4484–4521 Layer 11B. Half twists, crystallographic scope and the allowed two-skeleton comparison match; the full comparison/cell count is separately contracted. |
| ClassifyingSpaces, main | `TauCetiRoadmap/ClassifyingSpaces/README.md`:224–242, Stage 4 items 16–17. Lifted cellular free resolution and local-coefficient/group-homology comparison, including naturality. Deck/opposite conventions are resolved through the left fibre action. |
| AlgebraicTopology, main | `TauCetiRoadmap/AlgebraicTopology/README.md`:851–884 maps old Stages/items to Layers/sections; :1739 realizes simplicial sets; :1888 supplies Künneth; :1945 covers transfer/Cartan–Leray; :2027 applies the Serre package; :3219 supplies relative homotopy interfaces; :4645 maps `simplicialRealizationCW` to §4.7. Stage 5.5 expressly consumes DGFloer's generic Serre sequence, so this package's citation is its bundle application, not a new generic construction. |
| GeometricTopology, main | `TauCetiRoadmap/GeometricTopology/README.md`:788 collars; :980 tubes; :1439 diffeomorphism topology; :1504 isotopy extension; :1551–1578 disc/sphere Smale. The boundary-pointwise and marked-arc refinements are honestly declared gaps. |
| DGAInfinity, main | `TauCetiRoadmap/DGAInfinity/README.md`:431–462, Layer 5, derived modules/tensor and semi-free resolutions. The internally graded, unsigned two-variable Tor/convergence API is precisely the separate contract, not inferred from cochain shift signs. |

Open-head comparisons were made against PR #1179 ArithmeticStatisticsPartVIII, #850 the parent, #1169 TeichmullerGeometry, #1694 AlgebraicTopologyPartII and #1797 GeometricTopology. The saved `roadmaps show` output adds a header; the repository line numbers above exclude that header.

The settled #1179 overlap still appears at `TauCetiRoadmap/ArithmeticStatisticsPartVIII/README.md`:29 and §5.16:845–1046, with §5.19 consuming it. README.md:97–104 accurately acknowledges it; no upward dependency is introduced here. The present review adds no new ownership decision. TeichmullerGeometry's scope at :8–17 develops the general surface-category and closed-surface Teichmüller machinery, not this punctured-disc coset resolution or the Hurwitz K-complex. AlgebraicTopologyPartII's scope at :6–33 owns configuration cohomology and real-locus extensions, not the Hurwitz stability argument. GeometricTopology's open revision preserves §3.4; the supplier remains main. No same fully qualified acceptance declaration was found elsewhere.

The required mechanical direction check returned:

```text
depcheck: 236 roadmaps, 2135 edges, 0 problem(s)
```

There were no UPWARD, CYCLE or moved lines. Every Needs line was read; internal edges proceed to earlier results or named supplier contracts. The §2.1 reference to §5.1's radial formula consumes the already pinned homeomorphism, not the later finite-cell theorem, so it does not create a Layer 2/5 cycle.

All eight gap slugs agree between README.md and the top-level `gaps` array of `design/plan.json`, have named earlier suppliers and state hypotheses and the missing construction/API. The requests exclude the graded modules, shifts, balanced tensor and derived-functor carrier already provided at the pins. They are:

- `reductive-salvetti-homotopy-type` — ReductiveGroups Layer 11B; README.md:280.
- `algtop-semisimplicial-realization` — AlgebraicTopology Stage 4; README.md:305.
- `algtop-borel-construction` — AlgebraicTopology Stage 5; README.md:310. The induced-space formula uses a Γ-space Y and its restricted Λ-action, as in the actual application Y=cⁿ.
- `algtop-join-connectivity` — AlgebraicTopology Stage 8; README.md:316.
- `geomtop-boundary-pointwise-disc-smale` — GeometricTopology §3.4; README.md:332.
- `geomtop-arc-isotopy-extension` — GeometricTopology Layer 1; README.md:340.
- `geomtop-marked-disc-diffeomorphisms` — GeometricTopology Layer 3; README.md:344.
- `dga-graded-tor-spectral-sequences` — DGAInfinity Layer 5; README.md:359.

### Headline coverage, elaboration and padding

| README headline | Acceptance coverage |
| --- | --- |
| Marked/full-monodromy/unmarked stability, §§4.2–4.5 | `hurwitz_homological_stability`, Suggested.lean:506, states all four variants on actual braid groups and permutation fibres, with m,A,B before the field,full,p,n quantifiers. |
| Uniform field Betti bound, §5.2 | `uniform_betti_bound`, Suggested.lean:523, states cardinal rank bounds for all four variants, with C independent of field,i,n. |
| Uniform étale Betti bound, §5.3 | Explicitly named as not statable in the module docstring: the Hurwitz scheme carrier is missing. No replacement predicate is used. |
| Stabilization from low K-homology, §1.19 | Explicitly named as not statable: the graded component algebra, K differential and K-homology constructions are missing. Native graded modules alone do not supply them. |
| Arc connectivity, §2.6 | Explicitly named as not statable: isotopy classes of embedded marked-disc arcs are missing. |

Ran `lake env lean` on the original Suggested.lean using its absolute tool path from the pinned content checkout: exit 0, with exactly the two expected `declaration uses 'sorry'` warnings at :506 and :523. The braid object file was present; no build was needed.

A scratch copy appended `#check @name` for all **40 actual declarations** and elaborated successfully. The automated 41-entry list includes the docstring phrase “class c”, not another declaration. Compared all elaborated signatures with the README: no required binder was lost. In particular the stabilizers retain Fintype G and Field k, the headline retains IsNonsplitting and invertibility of the group order, and the full-monodromy condition is the actual generated-subgroup equality. Every own backticked API identifier resolves, including structure projections and both action instances. No authored file was changed.

Ran the one-tactic probe on **both** admitted theorems, each with `simp`, `rfl` and `infer_instance`, using `fail_if_success solve` on a scratch copy. It elaborated with only the same two sorry warnings, certifying that none of those probes closed either target. Opened the suggested exact-lemma candidates: `HomotopyEquiv.toHomologyIso` at `Mathlib/Algebra/Homology/Homotopy.lean`:946 requires an already supplied homotopy equivalence; `groupHomology.indIso` at `Mathlib/RepresentationTheory/Homological/GroupHomology/Shapiro.lean`:65 compares induction with subgroup homology. Neither constructs a stabilizing block or a uniform bound, and neither has a conclusion matching either existential headline. `Rep.ofMulAction` and its singleton specialization likewise supply no such theorem. No admitted padding was found. The proved supporting action/equivariance declarations are used by the real-bodied data constructions.

Additional scratch examples test the repaired adapter by `rfl` at positive input lengths and at B₀, and by its generator theorem at m=1,n=2. No toolchain, pin, supplier checkout or package source file was edited, and no Lean process was left running.

## Not verifiable

- PAL60, Theorem A and §3, printed pp.305–312: manifest status `uncertified`; no legally readable text supplied. Its exact source wording/locator cannot be certified. The local-cross-section bundle argument was checked mathematically. No repeat request was made.
- ALEX23, printed pp.406–407: settled `uncertified`; the coning isotopy was checked mathematically, but the original text was unavailable. No repeat request was made.
- EVW16 published-version agreement: the supplied arXiv v4 was read, not the published PDF. The tested locators are valid in the explicitly cited version; the manifest's blanket assertion of agreement of all numbering was not independently certified.
- The underlying board decision about the old ArithmeticStatisticsPartVIII ownership dispute was not supplied. Its settled status is honored from the review/repair record; it is not inferred from the dependency check.

## Source issues

- **Misprint** in EVW16 at §1.11, p.8, EVW16 line 346: the source says absence of a maximal supported degree gives infinite degree; it should be −∞ for the zero module and +∞ for unbounded support; affects a stated result.
- **Misprint** in EVW16 at Definition 2.2, p.9, EVW16 lines 395–413: the source says generating fibres in reversed class order and includes unrestricted surjections in the class locus; it should match each fibre with its class restriction; affects nothing.
- **Misprint** in EVW16 at proof of Lemma 4.6, p.18, EVW16 line 852: the source says the left module precedes right central torsion in the balanced tensor; it should place R[U] first, as in (4.6.3); affects nothing.
- **Gap** in EVW16 at proof of Lemma 4.6, p.19, EVW16 line 863: the source says torsion degree is bounded by δ plus regular torsion degree alone; it should retain max(δ−deg U, δ+deg R[U]) before enlarging constants; affects the proof.
- **Gap** in EVW16 at proof of Lemma 4.7, p.19, EVW16 line 883: the source says the spliced complex has two unshifted regular terms; it should use P₁=R[deg U], shift subsequent terms and allow slope at least deg U; affects the proof.
- **Error** in EVW16 at Proposition 4.13, p.21, EVW16 lines 979–988: the source says its support estimate allows A1=0; it should require A1≥1, since P=k[t],U=t,M=k gives support H₃=3 above the claimed bound 2; affects a stated result.
- **Misprint** in EVW16 at §5.2, p.23, EVW16 line 1064: the source says the coset formula applies in every simplicial degree; it should use the formula only for q<n and make higher degrees empty; affects nothing.
- **Misprint** in EVW16 at proof of Proposition 5.6, p.26, EVW16 lines 1191–1195: the source says compose the second retraction with the inverse first retraction; it should compose the inverse second retraction with the first, since both send their arc systems to the same system; affects the proof.
- **Misprint** in EVW16 at proof of Proposition 5.6, p.26, EVW16 line 1214: the source says the generators exchanging adjacent punctures are Dehn twists; it should call them half twists, whose squares are the corresponding Dehn twists; affects nothing.
- **Error** in EVW16 at (6.1.6), p.29, EVW16 line 1325: the source says the exact-image diagonal contains an extra class-size ratio; it should be U_Q, with each surviving summand once; affects nothing.
- **Misprint** in EVW16 at (7.8.3), p.35, EVW16 line 1599: the source says stabilization changes n by D; it should change n by Dd=deg U, with the comparison prime above that endpoint; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "3489b8da102563021f9af4714033705152ebd81a", "job": "REV-PKG-InverseGaloisAndArithmeticFundamentalGroupsPartII~4", "model": "gpt-6-astra", "worker": "chris-33"} -->
