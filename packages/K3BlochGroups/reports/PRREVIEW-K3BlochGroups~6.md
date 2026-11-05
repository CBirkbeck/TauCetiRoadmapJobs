# Review of K3BlochGroups (pull request #1430 at 12c408e)

**Verdict:** accepted

No findings. The roadmap is ready for human final approval; this review does not approve or merge the pull request.

The preceding review's sole finding, R01 (P2), is **repaired**. It said: “The plan still requests both results from external suppliers, but the head README constructs them locally”. `packages/K3BlochGroups/design/plan.json:2` now says `"gaps": []`. The corresponding ownership is explicit in `TauCetiRoadmap/K3BlochGroups/README.md:23`: “The normalized positive-characteristic integral K₃-torsion comparison is a consequence proved in §2.2”; §5.8 at line 1980 says “Prove quantifier elimination for the first-order theory of real closed ordered fields”. These are local targets, with the earlier coefficient/injection and real-closure inputs resolved below. There is no outstanding supplier-gap condition. **Historical R02 remains repaired.** The algebraically-closed-field locator correction is correct: weibel line 28137, line 28266 and line 28322 distinguish divisibility, characteristic-zero torsion and positive-characteristic torsion. The prior review read the same Git head, so the repair here is the package's gap metadata, not an unreported source edit.

## Verified sound

I read the whole README and acceptance file, including unchanged passages, and compared the shape with `TauCetiRoadmap/AlgebraicTopology/README.md` and `Completed/UniversalCovers/README.md`. The folder develops shared integral constructions rather than a special-prime route. The finite-field exceptions and all-curve conditional statement are explicit. Finite witnesses are mathematical existence statements, not algorithms or complexity claims. I found no copied source passage, sorry'd data, option override, upward supply or edit outside this folder.

The supplied push gate passes all scanners, metadata, dependency, cleanliness, scope and targeted-build checks. Independent elaboration of `Suggested.lean` also passed, with exactly eight `sorry` warnings. All 13 expanded declaration signatures were checked with `#check @name` on a scratch copy: no field, infinitude, characteristic, finite-cardinality, identity-coefficient or formally-real hypothesis disappeared. No source file was changed. The outside-folder diff is empty.

Fresh dependency output:

```text
depcheck: 204 roadmaps, 1642 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was emitted. Every `Needs` line and supplier citation was inspected. In particular §2.2 establishes positive-characteristic torsion using early coefficient theory, without the later SL₂ computation; §4.21 proves K₃-ind rigidity first, leaving its finite-field Bloch consequence to §6.6. The reference back from §6.6 does not assume that consequence.

### Seeded source checks

All 15 requested targets were examined. The table distinguishes readable evidence from the human-waived primary texts. No additional unverified locator was flagged in the README. Page numbers below distinguish combined-book PDF pages from chapter or printed pages; statements were checked with their hypotheses and conventions, not just their theorem numbers.

| Target | Locator and evidence read | Outcome |
| --- | --- | --- |
| §2.3 | Weibel III.7.2(c–d), chapter pp.61–62, weibel line 14144; VI.4.3.2, chapter p.18 | Real signatures and the ordered degree-three product support the local decomposable subgroup calculation. |
| §3.2 | Proof of VI.5.6, PDF p.498, weibel line 29728 onward | Tuple normalization and five deletion faces agree after the explicitly stated reciprocal/column adapter. |
| §3.3 | VI.5.1, PDF p.495, weibel line 29549 onward | Same five-term order and signs; x,y≠0,1 and x≠y; [1] is killed explicitly. |
| §3.9 | VI.5.1–5.2.1, chapter pp.23–24, weibel line 29549 onward | The raw full-tensor kernel is a separate definition; the F₅ relation is not a raw cycle. Bloch Lecture 6 supplies a name only, not an imported theorem. |
| §3.14 | Published CGZ Definition 2.1 and Lemma 2.2, p.391, cgz2021 line 453 and line 459 (published extraction) | The target really is the negative-unit tensor quotient. The roadmap retains small-field exceptions and repairs the proof's inversion-class issue. |
| §4.2 | Suslin 1984 §2, Lemmas 2.1–2.2, pp.191–192 | Primary text is human-waived. Frame domains, differential and low-rank controls checked directly; locator not certified from the primary text. |
| §4.6 | Suslin 1984 2.7.4 and 3.3.1–3.3.5, pp.196–198 | Primary text is human-waived. The degree shift and S₀,S₁,S₂ controls agree; primary numbering not certified. |
| §4.11 | Weibel (5.8), VI.5.8.1, PDF pp.498–499, weibel line 29768 onward; Mirzaii Lemma 4.1, arXiv v2 pp.8–10, mirzaii line 355 onward | Read the chain calculation, not the stronger torus-image claim. Independently expanded the eight-chain boundary at three parameters. The central diagonal and the coordinate correction are retained. |
| §4.12 | VI.5.7 and proof, PDF pp.498–499, weibel line 29768 onward | Infinite-field surjectivity onto the Bloch kernel and the monomial kernel use the corrected spectral sequence, not a finite-field acyclicity assertion. |
| §4.13 | VI.5.9, Example 5.9.1 and (5.9.1), PDF p.500, weibel line 29852 onward | The roadmap uses distinct-tuples/precyclic data and the degree-dependent cyclic norm, correcting the printed shortcuts listed below. |
| §4.21 | V.6.7.1, PDF p.419, weibel line 24664; VI Exercise 5.8, chapter p.35, weibel line 30518; Goncharov §1.9, proof of Proposition 1.22(a), printed p.225, goncharov line 888 onward | Split localization and Milnor residues prove the cokernel rigidity. Goncharov's conditional all-curve argument is not promoted to an unconditional theorem; the P¹ variant uses the locally proved rigidity. |
| §5.1 | III.7.2(a), chapter p.61, weibel line 14140; IV.1.13, chapter p.10, weibel line 15636 | K₃ has order q²−1, restriction is injective and transfer surjective, including q=2,3. Norm-one matrix construction uses native norm/basis data. |
| §5.8 | Suslin 1991 Lemma 1.6 and Proposition 1.1, pp.219–220 (waived); Zagier §1.A, pp.23–24, zagier line 1020 onward; Marker 3.5, 3.6 and 4.1, pp.24–25, marker line 398, line 429, line 444 | Readable Rogers and elementary-transfer ingredients checked. Suslin's precise primary normalization remains waived. The local formulas give c↦−π²/6 modulo π² and apply to every formally real field through real closure and fixed finite certificates. |
| §6.1 | VI.5.1, weibel line 29549 onward; published CGZ Lemma 2.2, p.391, cgz2021 line 459 | Equality is membership in the integer relation span; transport preserves it. No algorithm or false converse about arbitrary chains is promised. |
| §6.3 | VI.5.1 tensor boundary; CGZ arXiv v3 §6 final circular-unit paragraph, p.33, cgz2021 line 1520 | m[ζ] is a cycle by bilinearity. The roadmap correctly retains the diagonal obstruction for a single primitive sixth-root symbol. |

The published CGZ text was obtained through the sources service under the existing `cgz2021` key. Its line numbers above refer to the published extraction; the circular-unit reference explicitly refers to the cached arXiv v3 extraction. No source manifest was edited.

### Headline coverage and padding

The README's headline families are: canonical K₃–Steinberg homology and Hopf kernel; integral Milnor injection/motivic edge and algebraically closed torsion; antisymmetric diagonal exactness; general-linear and symmetric-group stability and cyclic power action; the Suslin sequence and transcendental/rational-curve rigidity; finite SL₂ homology and finite Bloch order; arithmetic indecomposables; the real detector/order-six result; finite-to-infinite compatibility; and the finite Chern isomorphism.

Eight are stated on native carriers: `antisymSquare_diagonal_exact`, `generalLinear_homology_stable`, `cyclicHomology_power_map`, `symmetricGroup_homology_stable`, `finite_sl2_localized_homology`, `finite_sl2_integral_homology`, `finiteBloch_order`, and `blochC_order_six`. The five real-bodied definitions are the cokernel, raw symbol, pre-Bloch quotient, quotient symbol and block inclusion required by those signatures. The module docstring names the other headline families and their missing shared K-group, motivic, plus, enhanced-Tor, boundary, Chern or Rogers carriers. No statable headline was found missing or replaced by a free-predicate stand-in.

On a copy, each of the eight admitted theorems was tried with single-tactic `simp`, `rfl` and `infer_instance` alternatives; all eight remained unproved. Reading the native definitions and the pinned cyclic, tensor and homology APIs found no single existing lemma that supplies any of these full conclusions. Small-field computations, generic kernel-fibre algebra and certificate interfaces remain in the README, not as admitted padding.

### Supplier and ownership audit

The following resolved locations are repository-relative, at main for existing roadmaps and at the supplied/current new-roadmap heads. The citations concern actual mathematical objects; the shared names were not treated as evidence by themselves.

| Owner and file | Resolved sections / lines | Consumed contract and boundary |
| --- | --- | --- |
| `TauCetiRoadmap/AlgebraicKTheory/README.md` | A1/A5; finite block/Whitehead/Steinberg refinements at lines 227,243,505 | Stable GL,E,St and universal central extension. Local block inclusion is a native finite-field adapter, not a second stable group. |
| `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md` | §§1.8,3.2–3.4,3.12,3.14,7.4,13.8a–c; lines 226,418,448,474,615,645,1478,2993–3040 | Plus/Q comparison, external products for associative rings, Brauer fibre and finite-field computation. |
| `TauCetiRoadmap/K2SymbolsBrauer/README.md` | Layers 2,4; §§5.4,5.6,5.12–5.14,7.2,8.1–8.4,10.5,10.32,11.3; lines 508,573,696,712,725,1221,1276–1358,1819,2390,2531 | Shared Milnor symbols, finite/divisible cases, comparison, signatures and residues. Degree-three injectivity is explicitly assigned to this consumer at line 1349. Raw degree-two comparison has the opposite sign from the product-normalized one. |
| `TauCetiRoadmap/StableHomotopyKTheory/README.md` | §§1.17,1.30,1.32,3.26–3.29,3.31,3.33,4.14,5.19,6.3,7.1,7.27; lines 305,462,491,1304–1395,1647,2232,2314,2340,2694 | Group/classifying homology, plus and cover/fibre, H-space, self-braiding, sphere comparison and spectrum AHSS. Group-module hyperhomology and the additional sphere-module/splitting structure are explicit local targets. |
| `TauCetiRoadmap/AlgebraicTopology/README.md` | Stages 2–5 and 8; Stage 8 at line 1602 | CW/homology/relative-homotopy, coefficient-sensitive Künneth, Hurewicz and Whitehead. No natural splitting of integral Künneth is assumed. |
| `Completed/UniversalCovers/README.md` | Stages 2–3, lines 98,126 | Based lifts and higher homotopy for actual coverings. |
| `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md` | §§1.5,1.8,3.0,3.0a,5.17,6.5a,6.10; lines 267,316,486,512,1204,1360,1484 | Actual finite-field maps, coefficients and Chern operations, integral motivic tower, characteristic-p torsion, separably closed coefficient comparison and diagonal Chern factor. No blanket degree-two additivity at even modulus. |
| `TauCetiRoadmap/SchemeKTheoryOperations/README.md` | §§3.6,4.7,5.2,5.5,6.4; lines 1017–1114,1581–1638,1812,1895,2399 | Supported/affine boundary, algebraically closed base-field injection, appropriate DVR splitting, homotopy invariance, projective bundles and operations. The injection at line 1112 requires a nonzero algebra. |
| `TauCetiRoadmap/ArithmeticKTheory/README.md` | §§3.2–3.4,4.1–4.4,5.1–5.4,8.10; lines 950,1138,1190,1402–1562,1578–1911,4773 | Finite generation, ranks, w₂, normalized characteristic-zero torsion, real diagonal extension and ℚ/ℚ(i) examples. These do not depend on the Bloch comparison. |
| `TauCetiRoadmap/FourManifolds/README.md` | F2 at §2.2 line 741; §7.1 line 2870 | Finite-wedge inverse coordinates, Hopf sign +1, product-oriented Whitehead coordinate and η³=12ν. Local work adds reindexing/subwedge compatibility and arbitrary-index extension. |
| `TauCetiRoadmap/HomotopySpheres/README.md` | §9.1 line 2459, supplied head | Third-stem normalization from StringOrientation S2.3, with its generator comparisons. |
| `TauCetiRoadmap/AlgebraicCurves/README.md` | Layer 12A line 1583 | Proper integral curve dictionary. Local smooth nonproper specialization is built from pinned stalk facts and agrees on the overlap. |
| `Completed/GlobalNumberFields/README.md` | Layer 1 line 259 | Mixed weak approximation and independent signs for field units. |
| `TauCetiRoadmap/PolylogarithmFunctions/README.md` | §§5.8,6.1,6.3–6.5; lines 840,905,939,952,973 | Cross-ratio and interval Rogers inputs. The reciprocal adapter and integral algebraic groups belong here. |
| `Completed/RealAlgebraicGeometry/README.md` | Layers 1,6; lines 128,437–477 | Real closures and real-number CAD/elimination. General first-order real-closed-field transfer is an additional local target, not that ℝ-only elimination theorem. |

Object searches covered the pins, main, board packages and available open-roadmap files, using `roadmaps grep` as well as direct reads. `Polylogarithms/README.md:12,138,353,608` imports these integral objects and negates the boundary for its convention. `HabiroNahmSeries/README.md:80` and `PadicHodgeRegulators/README.md:61` consume them; they are not suppliers here. The pre-Bloch and antisymmetric-cokernel searches found no competing owner. Searches for the retained headline names found no duplicate fully qualified declaration outside this roadmap.

The other generic-hyperhomology lead in `packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/design/README.md:872` is an internally graded noncommutative derived-tensor contract. `TauCetiRoadmap/DerivedModuleAlgebra/README.md:2316` owns the cohomological first-quadrant double-complex theorem. Neither states the local bounded-below group-module construction, its group-change maps and configuration augmentation. Section 4.1 owns that specialization and its resolution comparison; it does not claim ownership of every spectral sequence. No ownership move or additional declared gap was required by the resolved contracts.

### Pinned library declarations

Pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I opened the following 21 groups of declarations and checked the relevant binders or bodies. The paths denote those library pins.

| Declaration(s) | File and line | Checked content |
| --- | --- | --- |
| `inhomogeneousChains`, `cycles`, `cyclesMk`, `iCycles`, `toCycles`, `π` | `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:154`, :193–234 | Finite-support unnormalised chains; cycle proof and actual homology projection. |
| `chainsMap`, `map` | `Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean:58`, :157 | Group and representation maps are separate; the Lean headlines retain identity-coefficient hypotheses. |
| `groupHomologyIsoEven`, `groupHomologyIsoOdd` | `Mathlib/RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean:85`, :122 | Norm-complex homology, not its power-map action; positive-even degree restriction. |
| `HSpace` | `Mathlib/Topology/Homotopy/HSpaces.lean:65` | Continuous multiplication, unit and relative unit homotopies; no associative or commutative law is a field. |
| `liftHomotopy`, `existsUnique_continuousMap_lifts` | `Mathlib/Topology/Homotopy/Lifting.lean:308`, :477 | Actual covering; based lift and simply connected, locally path-connected domain. |
| `Scheme.functionField`, fraction-ring instance | `Mathlib/AlgebraicGeometry/FunctionField.lean:37`, :163 | Generic stalk; fraction field requires integrality. |
| `Scheme.residueField`, `residue`, `descResidueField` | `Mathlib/AlgebraicGeometry/ResidueField.lean:45`, :54, :78 | Stalk residue and local-hom descent; no automatic residue/base-field identification. |
| `crossRatio_comp_eq_of_sub_eq_div` | `TauCeti/Algebra/Field/LinearFractional.lean:51` | Factorized-difference formula, nonzero common factor and denominators. |
| `antisymmetricTensors` | `TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean:126` | Negative eigenspace of the flip, not the integral cokernel. |
| `antisymmetricTensorsEquivExteriorPower` | `TauCeti/LinearAlgebra/TensorSquare.lean:653` | Two-invertible comparison; does not supply the integral A/2A diagonal theorem. |
| `indIso_inv` | `TauCeti/RepresentationTheory/Homological/GroupHomology/Shapiro.lean:98` | Inverse Shapiro is induced by the actual induction unit. |
| `transfer`, `map_comp_transfer`, `transfer_comp_map_subtype_id` | `TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean:65`, :89, :107 | Finite-index and representation hypotheses, naturality and index multiplier. |
| `transfer_trans` | `TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Trans.lean:86` | Tower of finite-index subgroups with subgroup-of identification. |
| `δ_naturality` | `TauCeti/RepresentationTheory/Homological/GroupHomology/LongExactSequence.lean:106` | Short exact representations, change-of-group map and adjacent degrees. |
| `eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero` | `TauCeti/RepresentationTheory/Homological/GroupCohomology/Sylow.lean:56` | Finite group, prime and p-power-annihilated class, not arbitrary degree-zero cohomology. |
| `corestriction_mackey` | `TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction/Mackey/AllDegrees.lean:279` | Profinite/open/closed/discrete hypotheses; local §5.2 supplies the finite-discrete cochain adapter. |
| `RealClosure.exists_realClosure`, `RingPreordering.exists_linearOrder` | `TauCeti/FieldTheory/RealClosure/Basic.lean:120`; `TauCeti/Algebra/Order/Ring/Ordering/Extension.lean:158` | Same-universe ordered algebraic closure and an order extending a specified preordering. |
| `IsFormallyReal` | `Mathlib/Algebra/Ring/IsFormallyReal.lean:104` | No zero sum of nonzero squares; combined with Field, excludes −1 being a sum of squares. |
| `ElementaryEmbedding`, `Theory.IsComplete` | `Mathlib/ModelTheory/ElementaryMaps.lean:44`; `Mathlib/ModelTheory/Satisfiability.lean:385` | Formula realization with parameters; completeness includes satisfiability. |
| `isRegularLocalRing_stalk_of_smooth`, `smoothOfRelativeDimension_iff_ringKrullDim_stalk_eq` | `TauCeti/AlgebraicGeometry/Morphisms/Smooth/Regular.lean:39`; `RelativeDimension.lean:83` | Locally Noetherian regular base; over a field the dimension statement concerns closed points. |
| `isDiscreteValuationRing_iff_ringKrullDim_eq_one` | `TauCeti/RingTheory/RegularLocalRing/Basic.lean:171` | Regular local ring and dimension one; no properness premise. |

### Adversarial computations

Cₙ denotes ℤ/n, with C₁=0. The table has 114 rows, covering the seeded targets, all eight Lean headlines, the other headline families and the local constructions. These finite tests do not prove the general theorems: the source and supplier checks above are additional evidence. Ambient K-group values used as inputs are distinguished from the computed map, quotient or sign.

For finite presentations I enumerated all admissible pairs and used integer unimodular row/column reduction. The reduced relation matrices gave: F₃ free rank 1; F₄ diagonal (1,5); F₅ (1,1,6); F₇ (1,1,1,1,8); F₁₁ seven unit entries and (3,4), hence cyclic order 12. I computed the orders of c, 2c, 3c and 6c by adjoining each as an extra relation and comparing quotient orders. I separately computed injective-word boundary ranks, expanded the eight-chain identity over exact rationals, and multiplied the three conjugation matrices. All 72 admissible F₁₁ rank-three rotation sums were also reduced against the relation matrix and equalled 2c; the truncated-face top homology ranks were computed separately. Other rows use the displayed elementary group and valuation arithmetic.

| Statement / defining law | Instances tried | Computed values and excluded model | Result / change |
| --- | --- | --- | --- |
| Conventions: rings and fields | Zero ring; proposed field of order 1 | GLₙ(0)=St(0)=1; positive K-groups=0. A field has 0≠1, excluding q=1. | Matches; no change. |
| Conventions: antisymmetry versus alternation | A=ℤ, element 1 | Qₛ(A)=C₂ with diagonal 1; Λ²A=0; twice the diagonal=0. | Matches; no change. |
| Conventions: negative unit | F₃; F₅ with primitive unit g | In F₃, (−1)⊗(−(−1))=0; in F₅, g⊗(−g)=3 mod 4. Inverse-unit and diagonal quotients are not interchangeable. | Matches; no change. |
| Conventions: boundary orientation | [3] over ℚ, valuations v₂,v₃ | v₂(3)v₃(−2)−v₃(3)v₂(−2)=−1; reversed boundary gives +1. | Matches; no change. |
| §1.1 plus space and cover | A=0,ℤ,ℚ | At 0 all positive groups vanish. At ℤ, π₂(BSt⁺)=0 versus π₂(BE⁺)=C₂. At ℚ, π₁(BSt⁺)=0 versus π₁(BGL⁺)=ℚ×. | Matches; no change. |
| §1.2 canonical comparison | All carriers C₅; q multiplication by 2; other maps identity | c(1)=3 and c⁻¹(3)=1; using q forward gives 2. | Matches; no change. |
| §1.3 actual bar cycles | Trivial group; g≠1 in St(ℤ) | d₄[1,1,1,1]=[1,1,1]; d₃[1,1,1]=0; d₃[g,1,1]=[1,1]−[g,1]≠0. | Matches; no change. |
| §1.3 evaluation and equality witnesses | z=[1,1,1], z′=0 | Underlying chains differ by a nonzero basis vector, but both evaluations are 0; the four-identity chain has precisely their difference as boundary. | Matches; no change. |
| §1.4 transport and finite stages | Identity map; zero ring; two finite supports | Identity preserves each tuple and coefficient; zero-ring homology classes=0; supports of sizes r,s have union size at most r+s and descend to a common stage, not a fixed rank. | Matches; no change. |
| §1.5 finite-wedge coordinates | Ranks 0,1,3 | Ranks of π₃ are 0,1,6, from r+r(r−1)/2; omitting pair terms gives 0,1,3. | Matches; no change. |
| §1.5 signs and folds | Two summands, coordinate (1,1,1) | Swap preserves the pair coordinate; fold gives η+η+[ι,ι]=4η, using [ι,ι]=2η. | Matches; no change. |
| §1.5 H-space Hopf kernel | A=ℤ; real line self-swap | C₂→C₄₈ has image {0,24}; quotient C₂₄. The line swap has determinant −1, not +1; the quotient has no additive section. | Matches; no change. |
| §2.1 indecomposable quotient | ℚ; ℚ(i) | C₄₈/C₂=C₂₄; (ℤ⊕C₂₄)/0=ℤ⊕C₂₄. Quotienting by all torsion would instead give 0 and ℤ. | Matches; no change. |
| §2.2 integral Milnor injection | ℚ; finite fields | At ℚ, 1∈C₂ maps to 24∈C₄₈, with kernel 0. At finite fields, K₃ᴹ=0, so the kernel is again 0. | Matches; no change. |
| §2.2 diagonal Chern coefficient | n=1,2,3; ordered rational-function symbols | (−1)ⁿ⁻¹(n−1)! gives 1,−1,2. Iterated residues of x and 2x give 1 and 2; reversing one pair changes 2 to −2. | Matches; no change. |
| §2.2 characteristic and coefficients | Algebraically closed characteristic 2; coefficient 2 | Positive-degree defining-characteristic coefficient groups=0, while K₀/2=C₂. Milnor 2-torsion=0; the argument does not divide by 2 in an arbitrary group. | Matches; no change. |
| §2.2 normalized positive-characteristic torsion | Frobenius of F̄₂, moduli 3 and 5 | Weight two acts by 2²=4, hence 1 mod 3 and 4 mod 5; ordinary roots would give 2 in both. Bott Bockstein identifies the same cyclic coordinates. | Matches; no change. |
| §2.3 signature basis | ℚ(√2), ordered embeddings √2↦±√2 | The cube symbols of √2 and −√2 have signatures (0,1) and (1,0); {−1}³ has (1,1). | Matches; no change. |
| §2.3 decomposable subgroup | r₁=0,1,2; restriction ℚ→ℚ(√2) | Orders are 1,2,4. Restriction sends the nonzero rational signature to (1,1), not to one selected coordinate. | Matches; no change. |
| §2.4 stable SL homology | ℚ; F₅ | Stable H₃(SL) is C₂₄ in both cases; unstable H₃(SL₂(F₅)) is C₁₂₀ and P(F₅)=C₆. These cannot be substituted for stable SL. | Matches; no change. |
| §2.5 rational quotient and rank | ℚ; ℚ(i) | Both K₃⊗ℚ and K₃ⁱⁿᵈ⊗ℚ are 0 for ℚ and ℚ for ℚ(i), agreeing with r₂=0,1. | Matches; no change. |
| §3.1 cokernel and exact diagonal headline | A=0,ℤ,C₂,C₃ | Qₛ is 0,C₂,C₂,0; Λ² is 0 in each case; kernels equal A/2A=0,C₂,C₂,0. | Matches; no change. |
| §3.1 projection on a mixed module | A=ℤ², basis e,f | Qₛ=C₂{e²}⊕C₂{f²}⊕ℤ{e∧f}; exterior projection is the last coordinate. Diagonals of e+f and e−f agree; their difference is 2f. | Matches; no change. |
| §3.2 normalized projective cross-ratio | (0,∞,1,2,3) over ℚ | Deletion cross-ratios are (1/2,3/4,3/2,3,2); alternating sum is the stated R(2,3). Swapping the first two entries replaces 2 by 1/2. | Matches; no change. |
| §3.2 orbit/stabilizer adapter | Triple (0,∞,1); F₃ | A diagonal matrix fixes 1 iff its two entries coincide. Thus diag(2,2) fixes the triple; diag(2,1) does not. Distinct quadruples over F₃ normalize to −1. | Matches; no change. |
| §3.3 raw symbols and admissibility | x=0,1; x=2,y=3 over ℚ | Raw 0=0 but raw 1 is a free basis vector. The three quotient arguments are 3/2,3/4,1/2, all admissible; x=y would create 1 and is excluded. | Matches; no change. |
| §3.3 five-term signs | x=2,y=3 | R=[2]−[3]+[3/2]−[3/4]+[1/2]; its boundary is 0. Replacing the fourth minus by plus leaves twice ∂[3/4], whose valuation pairing is nonzero. | Matches; no change. |
| §3.3 finite certificates | Coefficient 1 at (2,3), k=0; empty support,k=1 | Evaluations are R(2,3) and raw [1], respectively; both classes are 0 in P. Empty support,k=0 evaluates to 0, not raw [1]. | Matches; no change. |
| §3.4 pre-Bloch presentation | F₂,F₃,F₄,F₅,F₇,F₁₁ | Reduced presentations give 0,ℤ,C₅,C₆,C₈,C₁₂. F₃ has no admissible pair; imposing an extra torsion relation would change ℤ. | Matches; no change. |
| §3.4 symbol-preserving reduction | F₅ with generator [3] of C₆ | [2]=2[3], [4]=0, [1]=0. Killing [1] is explicit; deleting nondegenerate symbols would change the group. | Matches; no change. |
| §3.5 Suslin boundary | F₅, primitive unit 2 | ∂[2]=0 and ∂[3]=1∈C₂, so ker(C₆→C₂)=C₃. Boundary reversed over ℚ is detected by the −1 versus +1 valuation witness. | Matches; no change. |
| §3.5 finite kernel | F₇ | P=C₈, boundary onto C₂, kernel C₄ generated by [−1]=2[3]. Replacing the target by the exterior square gives kernel C₈. | Matches; no change. |
| §3.6 universal c and inversion classes | F₄,F₅,F₇,F₁₁ | Orders of c are 1,3,2,6. Hence 6c=0 in all four; 2c and 3c both remain nonzero in F₁₁. | Matches; no change. |
| §3.6 h takes values in P | F₅, u=2 | h(2)=[2]+[3]=3[3] has order 2 and boundary 1∈C₂. Thus h is not a map into B. | Matches; no change. |
| §3.6 finite-field torsion controls | F₇, q≡1 mod 6 | c has order 2; [4] and [4]−c have order 4. Thus c=2[4]≠[4] and q≡1 mod 6 alone does not force c=0. | Matches corrected roadmap; no change. |
| §3.7 small-field exceptions | F₂,F₃ | P and B are 0,0 for F₂; P=ℤ and B=2ℤ for F₃. The formula (q+1)/2 would give C₂ at q=3, which is excluded. | Matches; no change. |
| §3.8 exterior boundary and diagonal obstruction | F₅; F₃ | Exterior kernels are C₆ and ℤ; Suslin kernels are C₃ and 2ℤ. Their quotients are C₂, matching the unit square classes since K₂=0. | Matches; no change. |
| §3.8 nontrivial infinite-field diagonal | h(2) over ℚ | The sign-by-v₂ pairing of its boundary is 1 mod 2, while its exterior boundary is 0. | Matches; no change. |
| §3.9 full-tensor lecture kernel | F₃ | λ[−1]=1∈C₂, so raw kernel=2ℤ; raw 4[−1] has infinite order, unlike the rational Bloch torsion class. | Matches; no change. |
| §3.9 relations need not be raw cycles | F₅, x=2,y=3 | The reduced five-term relation is [4]; λ[4]=2∈C₄, nonzero. λ(2[4])=0 although 2[4] is a nonzero free chain. | Matches; no change. |
| §3.9 raw-to-Suslin map | F₅, 4[3] | λ[3]=1∈C₄, so λ(4[3])=0; 4[3] has order 3 in P and lies nontrivially in B. The raw kernel is not killed by 6. | Matches; no change. |
| §3.10 obstruction and sixfold lift | F₃; F₅ | At F₃, raw 2ℤ maps identically to B=2ℤ and obstruction=0. At F₅ the image contains 4[3], generating B=C₃; 2[4] remains a nonzero element of the map kernel. | Matches; no change. |
| §3.11 generic configuration presentation | F₃; F₅ | Coinvariant degree-three groups are ℤ and C₆; the F₅ boundary kernel is C₃. Negating the boundary changes its value, not its kernel. | Matches; no change. |
| §3.12 local curve specialization | A¹ at 0: t,t⁻¹,1+t | Orders are 1,−1,0; projective specializations are 0,∞,1. For t²+1 over ℝ the closed-point residue field is ℂ, not ℝ. | Matches; no change. |
| §3.12 regularity controls | Cusp at origin; dual-number thickening | Cusp local dimension=1 but cotangent dimension=2, so it is not a DVR. Dual numbers have a nonzero nilpotent and are not integral/smooth; both are outside the adapter. | Matches; no change. |
| §3.12 all-curve conditional comparison | F₃ | P(F₃)⊗ℚ=ℚ while the all-curve quotient can be 0; the roadmap retains its rigidity hypothesis and does not assert unconditional equality. | Matches; no change. |
| §3.13 old CGZ quotient | F₂; F₁₁ | Extended small-field quotient at F₂ is C₃. At F₁₁ both B and B_old have order 6 but the convention map has kernel C₂ and cokernel C₂, so abstract orders do not establish an isomorphism. | Matches; no change. |
| §3.14 published negative-unit target | F₃; F₅ | Q₋(F₃)=C₂ versus Λ²F₃×=0. Q₋(F₅)=0 versus Qₛ(F₅)=C₂. The negative-unit relation differs from alternation. | Matches; no change. |
| §3.15 extended cycle quotient | F₂,F₃,F₁₁ | B_new=C₃,0,C₃, respectively. At F₁₁ the ordinary B=C₆ loses exactly an order-two subgroup. | Matches; no change. |
| §3.16 comparison maps | F₇ | B=C₄→B_new=C₂ is reduction; B_new→B_old=C₄ has image {0,2}. Both defects are killed by 2; tensoring with ℚ removes them. | Matches; no change. |
| §4.0 injective words | Sets of sizes 2,3,5 | Augmented boundary ranks are (1,1), (1,2,4), (1,4,16,44,76). Top homology ranks are 1,2,44; the degree-three homology for size 5 is 0. | Matches; no change. |
| §4.0 finite versus infinite exactness | Two letters x,y | d(x,y)=y−x and d(y,x)=x−y, so their sum generates H₁=ℤ. Allowing repeated letters would destroy this finite-set control. | Matches; no change. |
| §4.1 signed total complex | One element in bidegree (p,q) | The two mixed terms of D² have coefficients (−1)ᵖ and (−1)ᵖ⁻¹, summing to 0. Without the degree sign they sum to 2. | Matches; no change. |
| §4.1 hyperhomology augmentation | G=1,C=0; G=1,X={x,y} | Zero complex gives 0; the two-letter complex gives H₁=ℤ and identity to coinvariants, versus H₁(1,ℤ)=0. The infinite-set assumption cannot be dropped. | Matches; no change. |
| §4.2 independent frames | Rank 0,rank 1; vectors e₁,2e₁ | Rank-zero augmented term is ℤ. In rank one both nonzero vectors have augmentation 1, so their difference has boundary 0; the pair (e₁,2e₁) is dependent, unlike distinct-point configurations. | Matches; no change. |
| §4.2 action convention | Lower shear on column (1,0) | [[1,0],[1,1]](1,0)=(1,1), not (1,0); this distinguishes the column action from the opposite parabolic convention. | Matches; no change. |
| §4.3 scalar acyclicity/affine comparison | Trivial unipotent part; n=m=1 | When the unipotent part is 0 the inclusion is identity and all homology maps are identities. Positive homology of the scalar-acyclic term vanishes; H₀ is ℤ, not 0. | Matches; no change. |
| §4.4 frame algebra | Degrees 0,1,2 | S₀=ℤ, S₁=F×, S₂=K₂ᴹ⊕ℤ; e maps to (0,1), not (1,0). | Matches; no change. |
| §4.5 connecting maps and ordered symbols | F=ℝ; unit entries −1,1 | The all-negative triple has Milnor signature 1 mod 2; a symbol containing 1 is 0. Ordered torus normalization has coefficient +1. | Matches; no change. |
| §4.6 frame splitting | n=0,1,2 | The splitting yields ℤ,F×,K₂ᴹ⊕ℤ; the e-summand at n=2 is nonzero even when K₂ᴹ(F)=0. This checks the shift by two. | Matches; no change. |
| §4.7 monomial groups | F₂,F₃; rank 2 | Orders are 2 and 8; GL₂(F₃) has order 48. Taking the full linear group would change the second control by a factor 6. | Matches; no change. |
| §4.8 general-linear stability headline | n=0,i=0; n=0,i=1 over ℚ; scalar 2 | H₀ map is ℤ→ℤ, identity. H₁(1)→H₁(ℚ×) is 0→ℚ× and is excluded. Stabilization sends 2 to diag(2,1), with inverse diag(1/2,1). | Matches; no change. |
| §4.10 coinvariant homology | P¹(F₂),P¹(F₃) | Degree-zero=ℤ and degrees one/two=0; degree-three groups are P(F₂)=0 and P(F₃)=ℤ. Small-field values are retained. | Matches; no change. |
| §4.11 triple stabilizer | a=3 over ℚ | Scalar diag(3,3) fixes (0,∞,1); diag(3,1/3) sends 1 to 1/9 and is not the stabilizer. | Matches; no change. |
| §4.11 eight-chain boundary | a=2,3,−1 over ℚ | Exact expansion modulo simultaneous right diagonal has six terms in each case and equals the displayed six-term boundary; difference is the zero chain. | Matches; no change. |
| §4.11 flip and final differential | Torus coordinates at a=3 | Mixed flip contributes −1. The coordinate change sends (1,−1) to (0,−1); determinant-one torus gives (2,−2)→(0,−2), detecting the missing factor 2 model. | Matches; no change. |
| §4.12 rank-two Bloch map | ℚ; symbol [2] | B(ℚ)=C₆ and c is nonzero of order 6, so a zero map cannot be onto. ∂[2] has nonzero diagonal sign-v₂ coordinate, so [2] is not an admissible Bloch output. | Matches; no change. |
| §4.13 general-position tuples | p₁,p₂,p₃,q over F₂ | Each three-column determinant is 1 in F₂, so the four-tuple is in general position; there is no general-position five-tuple in P²(F₂). | Matches; no change. |
| §4.13 projection cross-ratio | (p₁,p₂,q,(1:a:x)) viewed from p₃ | Images are (0,∞,1,a) and cr=a; interchanging p₁,p₂ gives a⁻¹. At a=2 these are 2 and 1/2. | Matches; no change. |
| §4.13 rotations and norm | Degree 2, a triple of distinct points | N=1+t+t² and (1−t)N=1−t³=0; the alternating 1−t+t² instead gives 2(t²−t), nonzero on that orbit. | Matches; no change. |
| §4.13 cone and truncated acyclicity | Three/four-letter sets | Top Cᵃ-homology ranks are 3 and 8; D₀=Cᵃ₁. For the displayed differential (dᵃa−Nb,−db), the mixed contribution −Ndb+Ndb=0. | Matches; no change. |
| §4.14 rank-three normalization | Normalized P; F₁₁ universal class | ψ′(P)=−2c; since c has order 6, this is 4c whereas +2c=2c. Their difference 2c is nonzero. | Matches; no change. |
| §4.14 rotation relation | Five rotations of a general-position tuple | The relation sums to 2c; in F₁₁ this has order 3, so a claimed zero relation would fail. | Matches; no change. |
| §4.15 two symbol identities | F₅, x=2, g=[3]∈C₆ | [x²]=0=2(2g+g). The corrected second expression is 4g=2c; the printed expression is 0, differing by an element of order 3. | Matches corrected roadmap; no change. |
| §4.15 conjugation lift | Specified Γ, permutations (12),(34),(13)(24) | Γ⁻¹P₁₂Γ has rows (1,0,0,0),(0,1,1,0),(0,0,−1,0),(0,0,0,1); Γ⁻¹P₃₄Γ has rows (1,0,0,1),(0,1,0,−1),(0,0,1,0),(0,0,0,−1), matching the displayed blocks. | Matches; no change. |
| §4.15 third permutation lift | (13)(24) | Γ⁻¹PΓ has rows (1,1,0,0),(0,−1,0,0),(0,0,0,1),(0,0,1,0); determinant is +1, from two transpositions. | Matches; no change. |
| §4.15 cyclic power-map headline | C₇,a=2,j=1,2; C₁; a=0 | Multipliers are 2 and 4; the trivial cyclic group has zero positive homology; the zero-power map has multiplier 0 for j≥1. j=0 is excluded before natural subtraction. | Matches; no change. |
| §4.15 cyclic inclusion and symmetric stability headline | C₂→C₄; Σ₁→Σ₂; Σ₂→Σ₃ | H₃ inclusion sends 1 to 2∈C₄ and is injective. H₁ maps are 0→C₂ (outside range) and C₂→C₂ identity (2i≤n). H₀ at n=0 is identity ℤ. | Matches; no change. |
| §4.16 stable monomial indecomposables | F₂,F₄,ℚ | Groups are C₁₂, C₃⊕C₁₂, C₄⊕C₁₂; respective orders 12,36,48 and exponents 12,12,12. η³=12ν has order 2 in C₂₄. | Matches; no change. |
| §4.17 diagonal Tor and Chern sign | C₇, generator 1; weights u,−u | Composite through the Tor quotient sends 1 to 2. c₂ of the two lines is u(−u)=−u², not +u². | Matches; no change. |
| §4.18 torsion detector and twist | μ₇, automorphism exponent 2 | H₃/weight-two action is multiplication by 4; a root action alone would give 2. The product of divisible torsion μ with itself is 0, while Tor₁(μ,μ) contains C₇. | Matches; no change. |
| §4.18 Bockstein range | Modulus 2 via modulus 8 | C₈→C₂ reduction sends 1 to 1. This supplies the small-modulus comparison without assuming an unrestricted mod-two product. | Matches; no change. |
| §4.19 enhanced Tor | ℚ,F₅,F₄ | Enhanced groups have orders 4,8,3; ordinary root groups have orders 2,4,3. In characteristic 2 the enhancement adds no C₂. | Matches; no change. |
| §4.20 infinite-field Suslin headline | ℚ | 0→C₄→C₂₄→C₆→0 has kernel {0,6,12,18}; quotient cardinality 6. Replacing enhanced C₄ by μ(ℚ)=C₂ would give quotient order 12. | Matches; no change. |
| §4.21 K₃-ind rigidity and residue signs | F(t), symbol {2,t,π} | Last-parameter degree-three residue is {2,t}; right Quillen degree-two boundary of this ordered product gives 1/2. The degree-three comparison has positive sign; a uniform negative convention fails. | Matches; no change. |
| §4.21 rational specialization | R(tx,ty), t=0, with x=2,y=3 | Arguments specialize to (0,0,3/2,3/2,1), so the free specialization is [1], not 0; it vanishes only in the reduced quotient. | Matches; no change. |
| §4.21 rational-curve relation for [1] | s=1/(1−t), cycle [s]+[1−s] | sp₁−sp₀=2[∞]−[1]−[0]; after killing [0],[∞], this gives −[1]. The constant-cycle difference is 0. | Matches; no change. |
| §5.1 finite K₃-ind and transfer | F₂⊂F₄, degree 2 | Groups C₃→C₁₅; restriction sends a compatible generator to 5, transfer sends 1 to 1 mod 3. Transfer after restriction multiplies by 2; 1+Frob₂ acts by 1+4=5 mod 15. | Matches; no change. |
| §5.1 norm-one matrices | F₄/F₂, ω²+ω+1=0 | Multiplication by ω is [[0,1],[1,1]], determinant 1 and trace 1; its cube is I. Multiplication by 0 has determinant 0 and is excluded. | Matches; no change. |
| §5.2 finite SL₂ headlines | q=2,3,4,5,7 | Integral H₃ orders are 6,24,30,120,48; after inverting the characteristic they are 3,8,15,24,48, exactly q²−1. | Matches; no change. |
| §5.2 remaining exceptional fields | q=8,9,27 | Integral orders are 126,240,2184; characteristic factors 2,3,3 disappear after localization, leaving 63,80,728. | Matches; no change. |
| §5.2 periods, duality and stable elements | Q₈; trivial group; degree zero | H₁(Q₈)=C₂², H₃(Q₈)=C₈, distinguishing period-four from a cyclic period-two model. Positive homology of 1 is 0; H⁰(1,ℤ)=ℤ, not torsion. | Matches; no change. |
| §5.3 actual stabilization | F₂⊂F₄; F₃⊂F₉ | The compatible stable images have orders 3 in C₁₅ and 8 in C₈₀; arbitrary abstract cyclic isomorphisms need not preserve those maps. | Matches; no change. |
| §5.4 refined boundary | F₅, square-class ε | λ₁[2]=0, λ₁[3]=2(1−ε); R(2,3)=(1−ε)[2]+ε[4]. With ε=1 this recovers the ordinary relation [4]=0. | Matches; no change. |
| §5.4 small-field configuration range | P¹(F₄), transitive C₅ | There are five points and H₁,H₂,H₃ of the augmented configuration complex vanish; top H₄ has rank 44. A transitive orbit leaves zero outside points, so a fixed fresh-point argument would fail. | Matches; no change. |
| §5.5 finite Bloch order headline | q=4,5,7,11 | B orders 5,3,4,6; enhanced kernels 3,8,12,20 multiply to q²−1=15,24,48,120. At q=5 the integral SL₂ kernel has order 40, not 8. | Matches; no change. |
| §5.6 coefficient quotient | F₇,n=3; F₄,n=5 | For F₇, K₃/3=C₃ but B/3=0, and gcd(3,q−1)=3 violates the hypothesis. For F₄, both quotients are C₅ and gcd(5,3)=1. | Matches; no change. |
| §5.7 arithmetic quotient headline | ℚ; ℚ(i) | C₄₈/C₂=C₂₄ with no splitting; the Gaussian Milnor image is 0 and K₃ⁱⁿᵈ=ℤ⊕C₂₄. Both have w₂=24 but different ambient torsion orders. | Matches; no change. |
| §5.8 Rogers normalization | x=1/2,2,−1 | ρ values are −π²/12,π²/12,−π²/4 modulo π². Hence ρ(c)=−π²/6, of exact order 6; using period π²/2 would lose the order-two part. | Matches; no change. |
| §5.8 formally-real order-six headline | ℚ; real closure of arbitrary formally real F | ρ(2c)=−π²/3≠0 and ρ(3c)=−π²/2≠0 modulo π², while ρ(6c)=0. Finite-certificate transfer preserves these nonvanishings; no embedding F→ℝ is presumed. | Matches; no change. |
| §5.8 first-order transfer | Ordered real closed fields; rational parameters | The sentence x²+1=0 has zero solutions in each; x²=2 has two. A fixed coefficient certificate is a finite disjunction of equality patterns, unlike an unbounded existential quantifier over all integer lists. | Matches; no change. |
| §6.1 certificate transport | R(2,3); n=0,2,3 | Its integral quotient class is 0, hence its images mod 0,2,3 are 0. The certificate for raw [1] also has image 0; raw [0] is not a nonzero-generator certificate. | Matches; no change. |
| §6.2 boundary coordinates | ℚ: [2]+[−1]; F₅: [3] | Mixed coordinates of c cancel and diagonal signs sum to 0 mod 2; ∂[3] over F₅ is 1 mod 2. Omitting diagonals would incorrectly certify [3]. | Matches; no change. |
| §6.3 integral root multiple | Primitive sixth root ω in F₇ | 1−ω=ω⁻¹; boundary equals the nonzero diagonal of −1 in C₂. Thus [ω] is not a cycle but 2[ω] and 6[ω] are. | Matches; no change. |
| §6.3 square criterion | Primitive sixth root in F₁₃ | −1=5², so its diagonal vanishes; [ω] is a cycle. The F₇ and F₁₃ cases distinguish the square condition. | Matches; no change. |
| §6.3 generic kernel element | δ:ℤ→C₂, x=1, m=2; m=1 | δ(2)=0 gives the kernel element 2; δ(1)=1 prevents the same constructor at m=1. A vanishing proof cannot be omitted. | Matches; no change. |
| §6.4 division after coefficients | δ:ℤ→C₂, ker=2ℤ; coefficient C₅ | Dividing the kernel element 2 by 2 gives coordinate 3 on generator 2; dividing 4 by 4 gives 2·4⁻¹=3. Both map to 1 in ℤ⊗C₅. | Matches; no change. |
| §6.4 non-flat coefficient control | Same δ; coefficient C₂ | 2 is not invertible, and the map (2ℤ)⊗C₂→ℤ⊗C₂ is zero. The unit-order hypothesis, not flatness, is the stated requirement. | Matches; no change. |
| §6.5 lifting fibre | C₂₄→C₆, fibre over 1 | Fibre={1,7,13,19}; sixfold multiples are 6,18,6,18, none 0. It is a C₄-torsor with no additive section. | Matches; no change. |
| §6.5 bar lift witnesses | Trivial G; β=0 versus β≠0 | [1,1,1] and 0 are distinct chain representatives of the same zero class, differing by d₄[1,1,1,1]. No witness exists for a nonzero β when H₃(G)=0. | Matches; no change. |
| §6.6 finite-to-infinite compatibility | F₄, generator ω | The natural field inclusion sends ω to the same root; replacing it by ω² changes the order-five Bloch coordinate by 4, not 1. Compatibility is a map assertion, not an order comparison. | Matches; no change. |
| §6.6 coefficient snake sequence | 0→C₄→C₂₄→C₆→0, n=2 | B[2]=C₂→C₄/2=C₂ is nonzero: lift 3 has twice-lift 6, the generator of the kernel. Thus left exactness after quotient cannot be assumed. | Matches; no change. |
| §6.7 finite Chern headline and distinct coefficients | ℚ,n=5 | K₃(ℚ)/5=0 but K₂(ℚ)[5] contains {2,−31}: tame residue 2 has successive powers 2,4,8,16,1 mod 31; fivefold symbol is {32,−31}=0. | Matches; no change. |
| §6.7 even-coefficient Chern correction | Real field,m=2, Bott class β of order 4 | c₂(2β)=1 while 2c₂(β)=0 in C₂. The correction applies in degree two; the degree-three operation retains additivity. | Matches; no change. |

## Not verifiable

- `suslin-1984`: the primary text is human-waived. In particular the precise §2 and §3 locators sampled in §§4.2 and 4.6 were not independently read. I checked the definitions, low-rank consequences, the stated dependency route and readable secondary material; this is not primary-source certification.
- `suslin-1991`: the primary text is human-waived. The Rogers-normalization locator and other Suslin primary proof steps retain that limitation. The readable K-book, Mirzaii chain calculation, Hutchinson texts and the explicit local controls were checked where cited; they do not make the unavailable primary pages readable.
- `bloch`: Lecture 6 is human-waived. Section 3.9 explicitly uses it only to name a convention; its kernel and comparison obligations are specified and tested directly.

I checked the supplied legal cache and source-manifest statuses. These settled waivers were not reopened and no additional source request was made. No manifest or source text was copied into the repository. Ownership searches apply to main and the available open-roadmap corpus; they make no assertion about unavailable work.

## Source issues

These concern the source texts, not new defects in the roadmap. Locators and descriptions are paraphrases.

- **Error** in weibel at proof of VI.5.3, printed p.488 (weibel line 29644): the source says number-field K₃-ind is just the finite group ℤ/w; it should retain its rank-r₂ free summand, or restrict that equality to torsion; affects the proof.
- **Error** in weibel at VI.5.4(b), printed p.489 (weibel line 29666): the source says inversion classes define a homomorphism into B(F); it should be a homomorphism into P(F), since h(2) over F₅ has nonzero boundary; affects a stated result.
- **Error** in weibel at proof of VI.5.6, printed p.490 (weibel line 29747): the source says the relevant projective configuration modules are free GL₂-modules; it should be induced modules with scalar stabilizer; affects the proof.
- **Error** in weibel at VI.5.6.1, printed p.490 (weibel line 29764): the source says P¹(F₂) has seven points and the associated distinct-tuple complex is acyclic; it should be three points with nonzero top reduced homology; affects a stated result.
- **Error** in weibel at VI.5.7, printed p.490 (weibel line 29768): the source says the displayed rank-two homology formula holds over every field; it should retain the infinite-field hypothesis for this proof and handle finite-field exceptions separately; affects a stated result.
- **Misprint** in weibel at (5.8), printed p.490 (weibel line 29783): the source says the pre-Bloch term lies on the first page; it should lie on the second page after taking the configuration differential; affects nothing.
- **Error** in weibel at the stabilizer following (5.8), printed p.490 (weibel line 29790): the source says the triple stabilizer is the determinant-one diagonal; it should be the central diagonal a↦diag(a,a); affects the proof.
- **Error** in weibel at proof of VI.5.8.1, printed p.491 (weibel line 29823): the source says product homology has a tensor-only decomposition in all degrees; it should include the Künneth Tor terms, which contribute in degree three for C₂×C₂; affects the proof.
- **Misprint** in weibel at proof of VI.5.8.1, printed p.491 (weibel line 29829): the source says the result after the third differential is on the third page; it should be on the fourth page; affects nothing.
- **Error** in weibel at VI.5.9 and Exercise VI.5.6(a), printed pp.492,500 (weibel line 29861 and line 30494): the source says the all-tuples simplicial model is the denormalization of distinct-tuples chains; it should use the distinct-tuple precyclic face complex separately, since nonadjacent repetitions survive simplicial normalization; affects the proof.
- **Misprint** in weibel at (5.9.1), printed p.492 (weibel line 29879): the source says the cyclic norm has alternating signs independent of chain degree; it should use coefficients (−1)^(ni) in degree n; affects the proof.
- **Error** in weibel at the rank-three configuration discussion, printed p.493 (weibel line 29947): the source says the general-position configuration modules are free GL₃-modules; it should retain their nontrivial scalar stabilizers; affects the proof.
- **Error** in weibel at the normalization after VI.5.10, printed p.493 (weibel line 29988): the source says the chosen configuration P maps to +2c; it should map to −2c with the displayed face and symbol conventions; affects the proof.
- **Error** in weibel at Exercise VI.5.3, printed p.500 (weibel line 30485): the source says c=[4] over F₇; it should be c=2[4], with orders two and four respectively; affects a stated result.
- **Error** in weibel at Exercise VI.5.4(c), printed p.500 (weibel line 30488): the source says q congruent to one modulo six forces c=0 in characteristic above three; it should additionally impose the square-root-of-minus-one condition, as F₇ has c of order two; affects a stated result.
- **Error** in weibel at Exercise VI.5.5, printed p.500 (weibel line 30490): the source says the second identity uses 2[−x²] and −[1/x²]; it should use 2[−x⁻¹] and −[(1−x)⁻²]; affects a stated result.
- **Error** in weibel at the cyclotomic automorphism argument in VI.1.7, printed pp.467–468 (weibel line 28301): the source says every unit exponent is induced by a field automorphism on roots; it should restrict to the actual cyclotomic image, which for F̄₂ on μ₇ is {1,2,4}; affects the proof.
- **Error** in cgz2021 at Lemma 2.2, printed p.391 (published extraction, cgz2021 line 459): the source says the natural surjection with two-torsion kernel holds without a field-size restriction; it should impose at least four elements for the stated Suslin comparison and handle F₂,F₃ separately; affects a stated result.
- **Gap** in cgz2021 at proof of Lemma 2.2, printed p.391 (published extraction, cgz2021 line 481): the source says the inversion relations give the kernel inside B(F); it should intersect their span in P(F) with B(F), since individual inversion classes need not be cycles; affects the proof.
- **Misprint** in hutchinson2013 at proof of Corollary 3.13, arXiv v2 p.17 (hutchinson2013 line 856): the source says a nonzero fixed vector exists exactly when one is not an eigenvalue; it should say exactly when one is an eigenvalue; affects the proof.
- **Gap** in marker at proof of Theorem 3.5, printed p.25 (marker line 428): the source says to choose a midpoint between successive roots without separating unbounded intervals; it should treat the two unbounded intervals separately; affects the proof.
