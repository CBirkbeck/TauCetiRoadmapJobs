# Review of K3BlochGroups (pull request #1430 at 12c408e)

**Verdict:** needs changes

## R01 (P2) — Reconcile the two supplier gaps with local ownership

**Location:** `TauCetiRoadmap/K3BlochGroups/README.md:23`, :409, :1980; `packages/K3BlochGroups/design/plan.json:4`, :10. The README says “The normalized positive-characteristic integral K₃-torsion comparison is a consequence proved in §2.2” and “§5.8 owns the first-order real-closed-field transfer theorem”.

**Claim:** The plan still requests both results from external suppliers, but the head README constructs them locally and has neither corresponding `gap:` contract. These are redundant requests with contradictory ownership, not missing mathematical inputs.

**Witness:** The plan has two gap entries; the README has zero `gap:` occurrences. README :409 constructs the characteristic-p torsion equivalence; :1980 proves real-closed quantifier elimination, completeness and model completeness.

**Exact repair:** Retain the local constructions and retire the two superseded entries from the plan's `gaps` list. Alternatively, restore each matching `What <Supplier> must provide (gap:<slug>): ...` contract and consume it instead of reconstructing it here. Each result must have one owner, consistently recorded in both places.

**Repair controls:** Retiring the requests changes the count from two external requests plus two local constructions to zero requests plus two constructions. It preserves the mathematics: for Ω=𝔽̄₂, m=5, the normalized Bockstein identifies C₅ with C₅ and Frobenius acts by 4; the real algebraic numbers and ℝ both satisfy ∃x, x²=2 and both refute ∃x, x²+1=0. No theorem needs weakening.

This is the previous review's R01, still unresolved. It does not re-raise the settled missing-input objection FIX-RT-K3BlochGroups~2 F06: the integral injection and coefficient square now give a local construction. The remaining problem is the conflicting ownership record. The older package README's contracts do not insert contracts into the reviewed head README.

## Previous findings

I checked these before the full review. The recorded head is unchanged from the previous review; the supplied change record is empty.

- **R01: not repaired.** The quoted local-ownership passages above remain, and both external requests remain in the plan. Neither slug appears under Exact supplier contracts.
- **Historical R02: repaired.** README :407 cites “Corollary VI.1.3.1(i), printed p.465” and “Theorem VI.1.6(i), printed p.467”; :409 cites “Proposition VI.1.7.1 and its proof, printed p.468”. These reach the divisibility and weight-two statements. README :415 distinguishes printed and chapter pagination. The previous review already marked this repaired; reopening the cited text confirms that status.

## Verified sound

This is a fresh review of the whole six-layer README and all 13 Lean declarations, including unchanged passages. It does not inherit an unchanged-pass verdict from the prior incremental report. There is one blocking finding, concerning the ownership record; the computations below found no additional mathematical counterexample to the roadmap's stated hypotheses.

The requested head was checked. The supplied gate passes every scanner, dependency check and targeted build, including `build=0 OK`. The outside-folder diff is empty. No pull-request file, manifest, supplier or merge-order file was changed. I read the repository writing/contribution rules and used main's AlgebraicTopology and completed UniversalCovers as shape references.

### Gate, signatures and headlines

The worker's gate output is:

```text
gate K3BlochGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

Fresh direct `lake env lean` elaboration returned exit 0 with exactly eight `sorry` warnings. A separate scratch copy with `#check @name` for **all 13 declarations** also elaborated. Comparing every expanded signature with the README found **zero dropped binders or generality mismatches**. In particular, the three homology-map statements retain the identity coefficient-map hypothesis; finite SL₂ coefficients are universe-lifted; finite Bloch order retains q≥4; and the cyclic statement retains m≠0 and j≥1.

The README's eight statable headlines are all present in `TauCetiRoadmap/K3BlochGroups/Suggested.lean`:

| Headline | Declaration and line | Scope retained |
| --- | --- | --- |
| Integral diagonal exactness, §3.1 | `antisymSquare_diagonal_exact`, :40 | Every abelian group; kernel A/2A, including diagonal torsion. |
| General linear homological stability, §4.8 | `generalLinear_homology_stable`, :95 | Every infinite field, i≤n, actual block inclusion. |
| Cyclic power action, §4.15 | `cyclicHomology_power_map`, :108 | H₂ⱼ₋₁(Cₘ), m≠0, j≥1; power a acts by aʲ. |
| Symmetric stability, §4.15 | `symmetricGroup_homology_stable`, :120 | Standard inclusion, 2i≤n. |
| Localized finite SL₂ homology, §5.2 | `finite_sl2_localized_homology`, :133 | Every finite field, including q=2,3. |
| Integral finite SL₂ homology, §5.2 | `finite_sl2_integral_homology`, :145 | All seven characteristic-primary exceptions retained. |
| Finite Bloch order, §5.5 | `finiteBloch_order`, :157 | q≥4; the boundary is determined on generators. |
| Formally real order six, §5.8 | `blochC_order_six`, :170 | Every formally real field, not just ℝ. |

The remaining headline families are the canonical homological K₃ comparison and Hopf kernel; Milnor injectivity and the motivic edge; the normalized algebraically closed torsion comparison; the natural Suslin sequence and finite-to-infinite compatibility; transcendental rigidity; arithmetic quotient applications; the Rogers detector; and genuine finite-coefficient Chern comparison. The module docstring names them and the absent Quillen, Milnor/motivic, enhanced-Tor, configuration, Rogers and Chern carriers. It gives no surrogate theorem in their place. The five supporting definitions have real bodies on native carriers.

I tried `simp`, `rfl` and `infer_instance` against each of the **eight** admitted theorems in a scratch copy. None closed its goal. Object searches found no single pinned theorem supplying one of those full conclusions. Thus there is no padding finding. The examples and elementary witness identities remain in the README. The generic fibre API is explicitly tied to the actual Suslin map before its existence and ambiguity claims are applied.

### Seeded source checks

All **15 requested targets** were reopened. No additional locator is explicitly flagged unverified in the head README. Text was read from the supplied legal cache. The published CGZ version was fetched through the sources service under the existing `cgz2021` key, from its author-hosted copy; no manifest was edited. Published and preprint conventions were checked separately.

| Seeded target | Locator and text actually checked | Outcome |
| --- | --- | --- |
| 1.1 Steinberg plus space | weibel line 15948, Exercise IV.1.9, chapter pp.14–15, PDF p.282 | Stable universal central extension and the two-connected-cover comparison support n≥3, not n=2. |
| 1.2 Canonical third-homology comparison | weibel line 15948, same exercise; the named Hurewicz, plus and covering supplier maps | Supports the comparison; the roadmap specifies the inverses and their order instead of claiming an arbitrary isomorphism is canonical. |
| 2.2 Injectivity and motivic edge | weibel line 29189, VI.4.3.1–2, printed p.482; line 28137, VI.1.3.1, p.465; line 28266, VI.1.6, p.467; line 28322, VI.1.7.1, p.468 | Exact low-degree sequence, full-field injectivity and algebraically closed divisibility/weight agree. The local proof obtains K₄ divisibility before using integral torsion, so its normalization is not circular. |
| 2.3 Real places | weibel line 14160, III.7.2(c,d), chapter pp.61–62; line 29617, VI.5.3, printed p.488 | Number-field Milnor K₃ has one C₂ coordinate per real place. The quotient retains the nonsplit real contribution. |
| 2.5 Rational information loss | weibel line 29617, VI.5.3, printed p.488 | Rational dimension r₂, with integral real-sign and root torsion lost. No arbitrary-field rational vanishing of Milnor K₃ is inferred. |
| 3.3 Admissible five-term relations | weibel line 29553, Definition VI.5.1, printed p.487 | The five arguments, signs and exclusions x,y≠0,1 and x≠y agree; the unreduced presentation kills [1]. |
| 3.7 Small fields | weibel line 29568, VI.5.1.1, p.487; line 30484, Exercise VI.5.3, p.500 | The q=2,3 exceptions agree. Independent integral relation calculations confirm q=4,5,7 and the roadmap's correction c=2[4] at q=7. |
| 3.14 Published negative-unit quotient | cgz2021 line 453, **published** Definition 2.1, p.391; line 459, Lemma 2.2 and proof | Published target kills u⊗(−u), not all diagonal tensors. The roadmap separates its valid all-field tensor definition from the ≥4 presentation comparison. |
| 4.5 Connecting maps and ordered symbols | hutchinson2013 line 367, Theorem 2.9 and proof, arXiv v2 pp.9–10; line 357, action formula | The infinite-field symplectic-symbol relations and conjugation action support the local SL₂ step. The ordered connecting-symbol steps citing suslin-1984 remain waived, not independently text-certified. |
| 4.8 Stability induction | suslin-1984, Theorem 3.4, pp.196–198, waived | Primary text not certified. The statement keeps the infinite-field hypothesis and i≤n range; the induced map and boundary cases were checked separately below. |
| 4.12 Rank-two Bloch map | weibel line 29768, VI.5.7–5.8.1, printed pp.490–491 | The roadmap retains infinite F and repairs the source's finite-field overclaim, centre, spectral-sequence pages and integral splitting. Its explicit preceding chain computation was checked at a=2,3,−1. |
| 4.18 Ordinary Tor in an algebraic closure | weibel line 30389, Lemma VI.5.19, printed p.499; suslin-1991, Lemma 5.7, p.236, waived | The accessible proof supports the torsion detector and weight-two action. The roadmap restricts the e-invariant to torsion and separately states the Moore-product restrictions. |
| 5.2 Unstable SL₂ homology | hutchinson2013 line 704, Corollaries 3.6–3.7, pp.14–15; line 722, Lemma 3.8; line 861, Lemma 3.14, pp.17–18 | Localized order q²−1, subgroup injectivity, trivial conjugation and precisely the seven integral exceptions agree. |
| 5.7 Number-field quotient applications | weibel line 14160, III.7.2(c,d); line 29617, VI.5.3, p.488 | Real and totally imaginary branches agree with the imported ambient groups and the actual Milnor image. |
| 6.1 Five-term equality witnesses | weibel line 29553, VI.5.1; cgz2021 line 459, published Lemma 2.2 proof, p.391 | Quotient equality is membership in a subgroup generated by relations, hence existence of a finite integer sum; no algorithm or natural choice follows or is promised. |

Additional checks include Kerz Theorems 1–2 (kerz lines 22 and 82), and Marker Theorem 3.5, Corollary 3.6 and Proposition 4.1 (marker lines 398, 429 and 444). These support finite injective-word exactness, symmetric stability, and transfer for all real closed ordered fields. Source defects encountered while checking these passages are recorded below; they are not copied into the roadmap as theorem statements.

### Ownership and supplier order

I searched by objects using `roadmaps grep`, read supplier sections using `roadmaps show`, checked main/completed copies and the supplied open-head checkouts, and searched the board packages. For HomotopySpheres the supplied head's §9.1 was read directly rather than using the older result returned by the index. Generic Quillen K-theory, stable GL/E/St, Milnor symbols, finite-field K-theory, interval polylogarithms, coverings and finite-wedge homotopy are imported. The local constructions refine these objects in degree three or add the stated convention adapters. Searches for the acceptance declarations found them only in this roadmap, not a second owner of their fully qualified names.

The following resolved contracts account for the supplier citations. Lines below are in the supplier README, without the tool's provenance header.

| Supplier and resolved file | Sections and line witnesses | Contract checked |
| --- | --- | --- |
| `TauCetiRoadmap/AlgebraicTopology/README.md` | Stages 2–5,8 at :326, :471, :499, :849, :1602 | Singular/relative chains, CW pairs, coefficient-sensitive Künneth, relative Hurewicz and Whitehead. Its topological spectral sequences do not already supply the local group-module configuration calculation. |
| `Completed/UniversalCovers/README.md` | Stages 2–3, :98 onward | Based lifting and higher homotopy for actual covers; no unsupported strict naturality of chosen spaces. |
| `TauCetiRoadmap/AlgebraicKTheory/README.md` | A1 §§1.1–1.3, :213, :229, :245; A5 §5.1, :507 | Arbitrary associative unital rings, native finite matrices, block inclusions, stable Whitehead theorem and universal Steinberg extension. |
| `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md` | §1.8 :226; §§3.2–3.4 :418–474; §§3.12,3.14 :615, :645; §7.4 :1478; §§13.8a–c :2993, :3010, :3027 | Plus/Q comparisons in positive degrees, external products for noncommutative rings, finite-field computation and continuity. |
| `TauCetiRoadmap/StableHomotopyKTheory/README.md` | §§1.17,1.30,1.32 :305, :462, :491; §§3.26–3.29 :1304–1334; §§3.31,3.33 :1373, :1389; §4.14 :1647; §§5.19,6.3 :2232, :2314; §§7.1,7.27 :2340, :2694 | Filtered homology, classifying spaces, plus/cover/fibre comparisons and superperfectness; block H-space, self-braiding, Barratt–Priddy, η and AHSS. The local sphere-module and unit-splitting refinements are identified as additions. |
| `TauCetiRoadmap/K2SymbolsBrauer/README.md` | Layers 2,4; §§5.4,5.6,5.12–5.14 :508, :573, :696, :712, :725; §7.2 :1221; §§8.1–8.4 :1276–1347; §10.5 :1819; §10.32 :2390; §11.3 :2531 | Milnor presentation, finite vanishing, algebraically closed divisibility for n≥2, Matsumoto, product-normalized comparison, parameter-last residues and number-field signatures. Degree-three injection/cokernel remain local. |
| `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md` | §§1.5,1.8 :267, :316; §§3.0,3.0a :486, :512; §5.17 :1204; §§6.5a,6.10 :1360, :1484 | Restriction/transfer/Frobenius; finite Chern additivity and its degree-two exception; full finite motivic comparison; characteristic-p torsion freeness; Bott coefficients; signed factorial Chern composite. |
| `TauCetiRoadmap/SchemeKTheoryOperations/README.md` | §3.6 :1112; §4.7 :1632; §§5.2,5.5,6.4 :1812, :1895, :2399 | Integral K injection for algebraically closed base and nonzero algebra, rational-function localization, regular-Noetherian homotopy invariance, projective bundles and higher operations. |
| `TauCetiRoadmap/ArithmeticKTheory/README.md` | §§3.2–3.4 :950, :1138, :1190; §§4.1–4.4 :1402, :1454, :1486, :1547; §§5.1–5.4 :1578, :1634, :1795, :1819; §8.10 :4773 | Number-field finiteness, ranks, w₂, ambient groups, ℚ/ℚ(i); normalized separably closed **characteristic-zero** torsion comparison. No local positive-characteristic proof is silently attributed to it. |
| `TauCetiRoadmap/FourManifolds/README.md` | F2 §2.2 :741; §7.1 :2870–2881 | Hopf invariant +1, product-oriented Whitehead coordinate, inverse finite-wedge decomposition; η³=12ν. |
| `TauCetiRoadmap/HomotopySpheres/README.md` | §9.1 :2459–2472 at the supplied head | Normalized third stem C₂₄{ν}, imported there from StringOrientation S2.3. |
| `TauCetiRoadmap/AlgebraicCurves/README.md` | Layer 12A :1583–1596 | Proper integral curves, regular closed-point DVR and order. The nonproper smooth local adapter uses the pin directly. |
| `Completed/GlobalNumberFields/README.md` | Layer 1 :259–278 | Mixed weak approximation and independent real signs for elements of Fˣ, not necessarily units of its integers. |
| `TauCetiRoadmap/PolylogarithmFunctions/README.md` | §§5.8,6.1,6.3–6.5 :840, :905, :939, :952, :973 | Field-general cross-ratio and reciprocal adapter; interval Rogers endpoints, reflection, pentagon and midpoint. |
| `Completed/RealAlgebraicGeometry/README.md` | Layers 1,6 :128, :437 | Real closures; elimination target explicitly over ℝ. The local general elementary-transfer theorem is additional, subject to R01's ownership reconciliation. |
| `TauCetiRoadmap/Polylogarithms/README.md`, `TauCetiRoadmap/ColemanIntegration/README.md` | Polylogarithms :108, Layers 2,4; ColemanIntegration :114, :1470–1489 | Downstream use of this integral presentation, respectively opposite boundary order and p-adic evaluation. These are consumers, not proof inputs. |

Every `Needs` line was inspected. The local build separates K₃-ind rigidity from the later finite-to-infinite Bloch comparison, so the reference back from §6.6 to §4.21 does not assume the finite Bloch conclusion that §6.6 subsequently proves. Characteristic-p torsion in §2.2 uses early coefficient theory and the integral injection, not the later unstable SL₂ calculation. No ownership move to a later supplier is needed.

Fresh mechanical dependency output:

```text
depcheck: 204 roadmaps, 1626 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The two declared gaps are precise individually; their defect is redundancy and disagreement with the head's ownership, as R01 states. No new supplier gap is required by the checks performed here.

### Pinned declarations and object distinctions

Pins checked: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following **21 groups of declarations** were opened, rather than accepting name resolution alone. Paths denote library files at those pins.

| Declarations | File and line | Meaning and limitation checked |
| --- | --- | --- |
| `groupHomology.inhomogeneousChains`, `cycles`, `cyclesMk`, `iCycles`, `toCycles`, `π` | `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:154`, :193–233 | Actual unnormalised finite-support chains, cycles and homology quotient; identity entries survive in chains. |
| `groupHomology.chainsMap`, `map` | `Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean:58` onward | Both group homomorphism and representation morphism are inputs; an arbitrary coefficient map would not imply the stability headlines. |
| `Rep.FiniteCyclicGroup.groupHomologyIsoEven`, `groupHomologyIsoOdd` | `Mathlib/RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean:85`, :122 | Finite cyclic representations and norm-complex homology; positive-even restriction explicit. This is not already the power-map action theorem. |
| `HSpace` | `Mathlib/Topology/Homotopy/HSpaces.lean:65` | Continuous multiplication, unit and relative unit homotopies. It does not include associativity or commutativity. |
| `IsCoveringMap.existsUnique_continuousMap_lifts` and lifting interfaces | `Mathlib/Topology/Homotopy/Lifting.lean:308`, :477, :499 | Actual covering, simple/path connectivity, local path connectivity and based lifting data. |
| `Scheme.functionField`, stalk fraction-ring instance | `Mathlib/AlgebraicGeometry/FunctionField.lean:37`, :163 | Generic stalk definition; field/fraction-ring use requires integrality, not just a scheme. |
| `Scheme.residueField`, `residue`, `descResidueField` | `Mathlib/AlgebraicGeometry/ResidueField.lean:45`, :54, :80 | Residue field of the stalk, with local-hom input to descent; no automatic identification with the ground field. |
| `TauCeti.crossRatio_comp_eq_of_sub_eq_div` | `TauCeti/Algebra/Field/LinearFractional.lean:51` | Nonzero common factor and denominators on the specified set; the affine formula has the reciprocal convention to the local normalization. |
| `TauCeti.antisymmetricTensors` | `TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean:126` | A negative eigenspace, not the cokernel of 1+flip. |
| `TauCeti.antisymmetricTensorsEquivExteriorPower` | `TauCeti/LinearAlgebra/TensorSquare.lean:653` | Requires two invertible. It does not erase the new integral A/2A kernel or duplicate its theorem. |
| `TauCeti.groupHomology.indIso_inv` | `TauCeti/RepresentationTheory/Homological/GroupHomology/Shapiro.lean:98` | The inverse Shapiro map is induced by the induction unit, with actual representations. |
| `transfer`, `map_comp_transfer`, `transfer_comp_map_subtype_id` | `TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean:65`, :89, :107 | Finite-index subgroup; coefficient naturality; inclusion after transfer equals the index. |
| `transfer_trans` | `TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Trans.lean:86` | Tower and subgroup identification retained. |
| `δ_naturality` | `TauCeti/RepresentationTheory/Homological/GroupHomology/LongExactSequence.lean:106` | Short exact representations and successive degrees, not arbitrary bare maps. |
| `eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero` | `TauCeti/RepresentationTheory/Homological/GroupCohomology/Sylow.lean:56` | Finite group, prime and p-power-annihilated class. Degree-zero stable elements are handled separately locally. |
| `corestriction_mackey` | `TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction/Mackey/AllDegrees.lean:279` | Profinite group, open/closed subgroups and discrete coefficients; the finite-discrete cochain adapter is an explicit local target. |
| `RealClosure.exists_realClosure`, `RingPreordering.exists_linearOrder` | `TauCeti/FieldTheory/RealClosure/Basic.lean:120`; `TauCeti/Algebra/Order/Ring/Ordering/Extension.lean:158` | Ordered algebraic closure in the same universe and extension of a preordering; no embedding into ℝ is supplied. |
| `IsFormallyReal` | `Mathlib/Algebra/Ring/IsFormallyReal.lean:104` | Excludes zero sums of nonzero squares. The field hypothesis supplies nontriviality in the headline. |
| `FirstOrder.Language.ElementaryEmbedding`, `Theory.IsComplete` | `Mathlib/ModelTheory/ElementaryMaps.lean:44`; `Mathlib/ModelTheory/Satisfiability.lean:385` | All finite-parameter formulas; completeness includes satisfiability. No free predicate stands in for these laws. |
| `isRegularLocalRing_stalk_of_smooth`, `smoothOfRelativeDimension_iff_ringKrullDim_stalk_eq` | `TauCeti/AlgebraicGeometry/Morphisms/Smooth/Regular.lean:39`; `TauCeti/AlgebraicGeometry/Morphisms/Smooth/RelativeDimension.lean:83` | Smoothness plus locally Noetherian regular base; over a field, dimension at **closed** points. |
| `IsRegularLocalRing.isDiscreteValuationRing_iff_ringKrullDim_eq_one` | `TauCeti/RingTheory/RegularLocalRing/Basic.lean:171` | Regular local ring and dimension one; properness is absent. |

Object searches found exact-category K₀ and tensor/exterior infrastructure, but no shared Quillen K₃, Milnor K₃, enhanced Tor or Rogers descent carrier that would make an omitted headline statable without a substantial construction. The cokernel, pre-Bloch group and matrix adapter are the small native definitions used by the eight actual acceptance statements.

### Adversarial mathematics

Cₙ means ℤ/n; C₁=0. Values below are fresh calculations, not a claim that examples prove the general theorems. Where an ambient K-group or homology group is supplied by a theorem, that theorem is an input and the displayed map, kernel, sign or quotient is what is computed. The full pass recorded 186 rows. This condensed table retains **95 rows**, including every seeded target, all eight acceptance theorems, the remaining headline families, and R01; routine per-target rows are omitted for comment length. “Matches; none” means the stated law matches the displayed positive/negative controls and no change is proposed; it does not claim a proof from those controls.

For the small-field presentation rows I enumerated every admissible pair and reduced its integer relation matrix by unimodular row/column operations. The invariant factors, including unit factors, were: q=2: []; q=3: [0]; q=4: [1,5]; q=5: [1,1,6]; q=7: [1,1,1,1,8]; q=11: eight 1s followed by 12. The symbol coordinates below were transported through those same column operations. I also computed the injective-word boundary ranks and expanded the rank-two bar chains using exact rational arithmetic.

| Statement / defining law | Instances tried | Values computed on both sides; excluded model | Result / change |
| --- | --- | --- | --- |
| Conventions: nontrivial fields versus zero rings | A=0; proposed field q=1 | Stable GL/St over 0 are 1; positive K groups are 0. A field has 0≠1, so q=1 is excluded. | Matches; none. |
| Conventions: tensor antisymmetry is not alternation | U=ℤ, generator 1 | Qₛ=C₂, 1∧1=1; Λ²ℤ=0; 2(1∧1)=0. | Matches; none. |
| Conventions: negative multiplicative unit | F₅ˣ=C₄, generator g | −g=g³, g⊗(−g)=3 mod 4; g⊗g=1; g⊗g⁻¹=3 but this coincidence is not a general definition. | Matches; none. |
| Conventions: boundary order | [3] over ℚ, pairing (v₂,v₃) | 3∧(−2) gives −1; (−2)∧3 gives +1. | Matches; none. |
| Conventions: weight two | C₇ roots, ζ↦ζ² | Tor/H₃ coordinate 1↦4; ordinary root coordinate 1↦2. | Matches; none. |
| Conventions: tensor of divisible roots versus Tor | μ=ℚ/ℤ | μ⊗μ=0; Tor(μ,μ)[5]=C₅. | Matches; none. |
| Conventions: quotient versus torsion | M=ℤ and C₄, n=2 | ℤ/2=C₂ while ℤ[2]=0; C₄/2=C₂ and C₄[2]={0,2}. | Matches; none. |
| §1.1 plus space and connectivity | A=0,ℤ | At 0 all positive homotopy/homology=0. At ℤ, π₂(BSt⁺)=0 versus π₂(BE⁺)=C₂; π₁(BSt⁺)=1 versus St(ℤ) before plus. | Matches; none. |
| §1.1 q comparison and degree bound | A=ℤ, n=2,3 | q₂ is 0→C₂, not an isomorphism; q₃ identifies C₄₈ with C₄₈. | Matches; none. |
| §1.1 first Hurewicz | Contractible X; K(ℤ,3) | π₃→H₃ is 0→0 and ℤ→ℤ with 1↦1. | Matches; none. |
| §1.2 canonical composite and inverse | Four maps on C₅, q=×2, others id | c(1)=3; c⁻¹(3)=1; unreversed q gives 2. | Matches; none. |
| §1.2 additivity and zero detection | Same C₅ model | c(1+2)=4=c(1)+c(2)=3+1; c(x)=0 only x=0. Zero map sends 1↦0. | Matches; none. |
| §1.5 lifted covering multiplication | Identity covering; zero-ring cover | Lifted product equals original product; zero-ring cover has one value and one unit. | Matches; none. |
| §1.5 finite-wedge decomposition | Index sizes 0,1,2 | π₃ ranks 0,1,3, from n+n(n−1)/2; omitting pair term gives 0,1,2. | Matches; none. |
| §1.5 reindexing and finite-subwedge maps | (1,2,3) on two spheres | Swap gives (2,1,3); twice gives (1,2,3). Inclusion into three spheres gives (1,2,0,3,0,0). | Matches; none. |
| §1.5 arbitrary-index extension | Countable wedge, η₁+2[ι₂,ι₃] | Finite coordinates (1,0,0,0,0,2), zero elsewhere; infinitely many 1s have no finite support. | Matches; none. |
| §1.5 Hopf composition formula | Pinch then fold | Pinch coordinates (1,1,1) fold to 1+1+2=4; degree-two Hopf invariant is 2²=4. Omitting Whitehead term gives 2. | Matches; none. |
| §1.5 Hopf–Hurewicz exactness | K(ℤ,2), K(ℤ,3) | First: ℤ→0→0; second: 0→ℤ→ℤ with final map id. | Matches; none. |
| §1.5 sphere unit and minus-one product | Transposition matrix over ℤ and F₂ | det=−1 over ℤ, +1 over F₂; unit class has order 2, respectively 0. | Matches; none. |
| §1.5 elementary homology quotient | A=ℤ | C₄₈→C₂₄, kernel {0,24}; possible lift of 1 has odd representative and cannot have order dividing 24. | Matches; none. |
| §2.2 signed Chern composite | {t₁,t₂,t₃}, ℚ(t₁,t₂,t₃) | Iterated last-parameter residue of symbol=1; of composite=2; reversing first entries gives −2; zero composite gives 0. | Matches; none. |
| §2.2 characteristic-two injectivity route | F₂(t₁,t₂,t₃); Prüfer C₂∞ control | Symbol and twice symbol have residues 1 and 2 in ℤ. In C₂∞, 2·(1/2)=0 despite divisibility. | Matches; none. |
| §2.2 motivic edge quotient | ℚ | Kernel C₂={0,24}; C₄₈/C₂=C₂₄ is the H¹ edge target. | Matches; none. |
| §2.2 degree-zero mod-two comparison | Algebraically closed Ω, char≠2 | H⁰(Ω,ℤ(2))/2=0; its image in μ₂⊗²=C₂ is 0; multiplication by two on the divisible source is onto. | Matches; none. |
| §2.2 all-prime K₄ divisibility | Ω=𝔽̄₂, r=2,5; Ω=ℂ,r=2 | K₄(𝔽̄₂)=0, so both quotients 0; K₄(ℂ)/2=0 by cited positive-even theorem; K₀/2=C₂ instead. | Matches; none. |
| §2.2 normalized positive-characteristic torsion | 𝔽̄₂, m=3,5,2 | Prime-to-2 Bockstein Cₘ→Cₘ sends normalized 1↦1, kernel 0. At m=2 both positive-degree groups are 0. | Matches; none. |
| §2.2 embedding/automorphism compatibility | Frobenius on 𝔽̄₂, m=3,5 | Both Bott-square and torsion coordinates multiply by 4: residues 1 and 4; untwisted root action gives 2 and 2. | Matches; none. |
| §2.3 real signature basis | ℚ; ℚ(√2) | ℚ has one negative triple coordinate 1. For √2 and −√2, cube symbols have signatures (0,1) and (1,0); {−1}³ gives (1,1). | Matches; none. |
| §2.3 decomposable order | r₁=0,1,2 | Milnor image orders 1,2,4; tensoring these groups with ℚ gives 0 in each case. | Matches; none. |
| §2.5 rationalization | ℚ; ℚ(i) | K₃⊗ℚ=0 and ℚ; both equal ℚ^r₂, while their integral torsion orders are 48 and 24. | Matches; none. |
| §3.1 cokernel definition/universal lift | A=ℤ, bilinear ab mod2 versus ab in ℤ | First has f(a,b)+f(b,a)=2ab=0 mod2 and descends; second gives 2 at (1,1) and does not. | Matches; none. |
| §3.1 diagonal headline and exterior projection | A=0,ℤ,C₂,C₃ | Qₛ=0,C₂,C₂,0; exterior squares all 0; A/2A has exactly those values. | Matches; none. |
| §3.1 mixed term and diagonal iff | A=ℤ² | Qₛ=C₂²⊕ℤ; diag(1,0)=(1,0,0), diag(3,0)=(1,0,0), diag(2,0)=0; mixed e₁∧e₂=(0,0,1). | Matches; none. |
| §3.1 direct sum/functor/eigenspace | ℤ⊕ℤ; ℚ²; zero module | Rank/free-plus-torsion 1+2 diagonal factors; ×2 kills diagonal and multiplies mixed term by 4. Over ℚ², half-antisymmetrizer of e₁⊗e₂ is (e₁⊗e₂−e₂⊗e₁)/2. | Matches; none. |
| §3.1 cyclic formula, including n=0 | C₀=ℤ,C₁,C₂,C₃,C₄ | C_gcd(2,n)=C₂,0,C₂,0,C₂, respectively. | Matches; none. |
| §3.3 admissible relation | x=2,y=3 over ℚ | Terms [2]−[3]+[3/2]−[3/4]+[1/2]; all five arguments avoid 0,1. | Matches; none. |
| §3.3 inadmissible inputs | x=y=2; x=0 | Equal inputs give raw [1], not free zero; x=0 requires inverse/division at zero. | Matches; none. |
| §3.3 finite relation witness | Single relation R(2,3), coefficient 1; empty list | Evaluated free sums are R(2,3) and 0; augmentation of R is 1, but quotient class is 0. | Matches; none. |
| §3.7 small-field orders | q=2,3,4,5,7 | P=0,ℤ,C₅,C₆,C₈; B=0,2ℤ,C₅,C₃,C₄. F₃: 2h(−1)=4[−1]≠0. | Matches; none. |
| §3.7 F₇ source correction | Generator h=[3] | [−1]=2h, [4]=6h, c=4h=2[4]; c≠[4]. | Matches; none. |
| §3.14 negative-unit tensor quotient | Unit orders m=2,4,6,10 | gcd(m,{k(k+m/2)})=2,1,2,2; Qneg=C₂,0,C₂,C₂; exterior of each cyclic group=0. | Matches; none. |
| §3.14 kernel ∂H and B+H | F₅ | Qₛ=C₂→Qneg=0 has kernel C₂; h(2)=3g has boundary1. B+H=2C₆+3C₆=C₆. | Matches; none. |
| §4.5 δ normalization | F=ℚ,n=1,a=2 | δ₁[2]=⟨2⟩, retraction2; inverse convention gives1/2. Stabilized H₁(GL₀)=0. | Matches; none. |
| §4.5 ordered Milnor retraction | ℝ, {−1,−1,−1}; {2,−1,b} | First retracts to nonzero1∈C₂; doubled normalization gives0. Second is Steinberg {2,1−2,b}=0. | Matches; none. |
| §4.5 symplectic-symbol coinvariants | s(a,bc)−s(a,c); a=2,b=1 over ℚ | In coinvariants equals s(a,b); s(2,−1)=0 from relation with 1−a. Unit symbols vanish0. | Matches; none. |
| §4.5 θ₂ ordered torus square | Rational-function symbol {t₁,t₂} | Ordered double residue gives1; reversing factors gives−1. For {a,1−a}, value0. | Matches; none. |
| §4.8 block inclusion real body | n=0; g=(2) over ℚ | Empty matrix↦(1); (2)↦diag(2,1), inverse diag(1/2,1); products give diag(6,1) from2·3. | Matches; none. |
| §4.8 stability headline | n=i=0; n=i=1 over ℚ | H₀ map ℤ→ℤ is1↦1; H₁(GL₁)→H₁(GL₂) is determinant coordinate a↦a. n=0,i=1 would be0→ℚˣ, not iso. | Matches; none. |
| §4.8 field-size exclusion | F₂,n=i=1 | GL₁=1, GL₂=S₃, H₁ map0→C₂ fails. | Matches; none. |
| §4.8 spectral-sequence parity | q=1,2,3 | Alternating face coefficient sums1,0,1 give stabilization,zero,stabilization. | Matches; none. |
| §4.11 stabilizers and d¹ | a=2 over ℚ | Triple stabilizer diag(2,2); (2,1) under1−swap gives(2,1/2); centre is fixed. | Matches; none. |
| §4.11 face matrices | a=2,3,−1 | (det A,det B,det C)=(−1,−2,2),(−2,−6,3),(2,−2,−1). At0 or1 some determinant0. | Matches; none. |
| §4.11 explicit eight-term lift | a=2,3,−1 over ℚ | Expanding d_bar(u) and the displayed six-term d_config(y) gives residual0 in every right-diagonal tuple orbit. | Matches; none. |
| §4.11 seven-term Shapiro reduction | Same three inputs | Shapiro(uw−u) minus seven commutator cycles equals **−d₃** of the displayed triple in all three cases. | Matches; none. |
| §4.11 boundary splitting | a=3, valuation pairing | Raw signed coordinates(1,−1) map to(0,−1); inverse returns(1,−1). SL torus(2,−2) maps to(0,−2). | Matches; none. |
| §4.11 integral Künneth | T=C₂×C₂ | H₂=C₂; H₃=C₂³, while tensor-only degree-three sum=C₂². | Matches; none. |
| §4.12 rank-two exactness/range | Infinite F; F₂,F₄ negative controls | At F₂ H₁(GL₂)=C₂≠F₂ˣ=0; at F₄ H₂(GL₂)=C₂ but Λ²C₃⊕K₂=0. | Matches; none. |
| §4.15 cyclic-power headline | m=7,a=2,j=1,2,3; a=0; m=1 | Multipliers2,4,1 mod7; at a=0 all positive odd maps0; at m=1 both groups0. | Matches; none. |
| §4.15 cyclic inclusion/transition | C₂→C₄, C₃→C₁₅ | H₃ maps1↦2 and1↦5; both injective. Squaring the index would give0 mod4 in first case. | Matches; none. |
| §4.15 symmetric stability headline | (n,i)=(0,0),(2,1); outside(1,1) | H₀ ℤ→ℤ=id; H₁(S₂)→H₁(S₃) sends transposition1↦1 inC₂. Outside range0→C₂ fails. | Matches; none. |
| §4.15 permutation/monomial classes | Transposition; F₂ monomial group | Sign of transposition−1, square1; F₂ˣ=1 so monomial group reduces to permutations. | Matches; none. |
| §4.18 detector headline | F=ℚ, μ=C₂; Ω=𝔽̄₂,m=5 | Detected nonzero order2 class versus doubled Tor projection0; at m5 normalized coordinate1 maps nonzero and Frobenius multiplies4. | Matches; none. |
| §4.18 product-rule range | Orders2,4,8 and odd3 | At modulus8, elements4 and2 have orders2 and4; all such two-primary orders occur in allowed moduli. Odd3 is directly allowed. | Matches; none. |
| §4.18 torsion-only e-invariant | Divisible torsion μ; free ℤ control | μ⊗μ=0 while Tor contains C₅; ℤ has no nonzero torsion element for this construction. | Matches; none. |
| §4.20 infinite Suslin headline | ℚ | 0→C₄→C₂₄→C₆→0 has4·6=24; ordinary Tor would give2·6=12. | Matches; none. |
| §4.20 rational comparison | ℚ; ℚ(i) | Torsion kernel tensors to0; rational source/target dimensions0 and1. | Matches; none. |
| §4.21 K₃-ind rational-function rigidity | F₂,F₃ | K₃ind constants C₃,C₈ persist over F(t); the small Bloch groups0,ℤ do not determine this assertion. | Matches; none. |
| §4.21 residue compatibility | {2,t,π}; degree2 {2,5} | Degree3 Milnor residue{2,t}, next right Quillen boundary1/2; wrong sign gives2. Degree2 tame value2 mod5 becomes inverse3. | Matches; none. |
| §4.21 rational specialization | R(tx,ty) at t=0 | Arguments0,0,y/x,y/x,1; sum[1]. For a collision, surviving[r]+[r⁻¹]=h(r), torsion rationally0. | Matches; none. |
| §4.21 rational-curve presentation | s=1/(1−t), cycle[s]+[1−s] | sp₁−sp₀=2[∞]−[1]−[0]; thus[1]=0 after killing[0],[∞]. | Matches; none. |
| §5.2 localized/integral SL₂ headlines | q=2,3,4,5,7,8,9,27 | Integral orders6,24,30,120,48,126,240,2184; localized3,8,15,24,48,63,80,728. | Matches; none. |
| §5.2 stable elements | G=S₃, r=3; C₃ normalizer inversion | On H²(C₃) inversion is−1, fixed subgroup0; on H⁴ inversion is(+1), fixed subgroupC₃. Index2 is unit mod3. | Matches; none. |
| §5.2 homology duality | G=C₂, d=1; d=0 control | H²=C₂=Hom(H₁=C₂,ℚ/ℤ); H¹=0 but Hom(H₀=ℤ,ℚ/ℤ)=ℚ/ℤ. | Matches; none. |
| §5.2 quaternion periodicity | Q₈ | H₁=C₂², H₂=0,H₃=C₈,H₄=0; abelianization model would give H₃(C₂²)=C₂³. | Matches; none. |
| §5.2 normalizer period | Cyclic C₅, normalizer power2; torus inversion | Power2 acts on H⁴ by4, fixed subgroup0; inversion acts by1, producing period4. | Matches; none. |
| §5.2 subgroup and extension injection | C₃≤SL₂(F₄), localized H₃=C₁₅ | Generator maps to element of order3, coordinate5 up to a unit; inclusion to a larger field keeps order3. | Matches; none. |
| §5.2 GL conjugation descent | diag(a,1) over Fq², a=b² | diag(a,1)=bI·diag(b,b⁻¹); conjugation equals inner SL₂ conjugation; induced homology action=id. | Matches; none. |
| §5.5 finite Bloch headline/exact sequence | q=4,5,7,11 | (T̃,K₃,B) orders(3,15,5),(8,24,3),(12,48,4),(20,120,6); first×last=middle. | Matches; none. |
| §5.5 finite left-arrow image versus arrow | C₈→C₂₄ via×3 and×15 | Both images{0,3,6,9,12,15,18,21}; images of1 are3 and15. | Matches; none. |
| §5.5 extra two-primary kernel | q=5 and7 | Split torus orders4,6; total kernels8,12, exactly twice those. | Matches; none. |
| §5.7 Milnor image equals minus-one product | ℚ; ℚ(i) | Product image{0,24}⊂C₄₈; overℚ(i) image0 and quotient ℤ⊕C₂₄ unchanged. | Matches; none. |
| §5.7 nonsplit arithmetic quotient | C₄₈→C₂₄ | Lifts of1 are1,25; their24-fold multiples are24,24, not0. | Matches; none. |
| §5.8 Rogers piecewise normalization | 1/2,2,−1, values in π² units | ρ=−1/12,+1/12,−1/4; sumρ[2]+ρ[−1]=−1/6. | Matches; none. |
| §5.8 RCF completeness/model completeness | Real algebraic numbers,ℝ; controlsℚ,ℂ | x²=2: true,true,false,true. x²+1=0: false,false,false,true. Parameter a: a+1>a on both sides. | Matches; none. |
| §5.8 finite equality-pattern transfer | Empty list,k=0,1; ξ=[2]−[3] | k[1]=0 iff k=0; ξ has coefficients(1,−1) at distinct arguments and is nonzero despite augmentation0. | Matches; none. |
| §5.8 formally-real headline | c,2c,3c,6c in real detector | Residues modπ² are5/6,2/3,1/2,0. Only6c vanishes among these; periodπ²/2 would give order3. | Matches; none. |
| §6.1 equality witness transport | R(2,3), empty certificate, field embedding | Relation class0 and empty sum0; rational arguments2,3,3/2,3/4,1/2 preserved by every field embedding. | Matches; none. |
| §6.6 finite-to-infinite compatibility | F₄→F₄(t)→F₄(t)(s) | [ω] goes to[ω] on both paths, order5; [ω²]=4[ω]. Reciprocal convention would give4[ω] instead of[ω]. | Matches; none. |
| §6.6 combined integral/rational sequence | ℚ andF₅ | Integral0→C₄→C₂₄→C₆→0 and0→C₈→C₂₄→C₃→0; rationally all groups0. | Matches; none. |
| §6.6 multiplication snake sequence | C₄→C₂₄→C₆,n=2 | B[2] generator3 lifts to3∈C₂₄; doubling gives6, a generator of T=C₄. Connecting map C₂→T/2=C₂ is nonzero. | Matches; none. |
| §6.6 odd root hypothesis | F₇,n=3; ℚ,n=5 | F₇: T/3=C₃ and K₃ind/3=C₃ but B/3=0. ℚ: T/5=0 and both ordinary quotients0. | Matches; none. |
| §6.7 genuine finite coefficients | ℚ,n=5 | K₃/5=0. Tame residue of{2,−31} is2 mod31; powers2,4,8,16,1 show order5; fivefold symbol{32,−31}=0. | Matches; none. |
| §6.7 indecomposable domain and n=1 | Number-field MilnorC₂, mod5 versusmod2 | C₂/5=0 but C₂/2=C₂; atn=1 all quotient/coefficient groups0. | Matches; none. |
| §6.7 Chern additivity exception | ℝ,m=2,β∈K₂(;C₂)=C₄ | c₂(2β)=1∈C₂; 2c₂(β)=0. | Matches; none. |
| R01 ownership agreement | Plan versus head contracts/local targets | Gap entries2; matching README slugs0; local constructions2. Proposed local-ownership repair gives0,0,2. | Fails; reconcile ownership record. |

The shape review found the required scope, conventions, supplier contracts, layer order, APIs, Checks, examples, dependencies, consumers and references. Definitions are accompanied by discriminating examples rather than acceptance-file API padding. The finite witness constructions are mathematical existence and transport statements, not computational algorithms. Small finite fields, characteristic two, even coefficient complications, nonproper smooth curves and arbitrary associative unital rings are handled explicitly instead of being excluded to simplify a particular application.

## Not verifiable

- **suslin-1984:** primary text remains human-waived. In particular the frame algebra, ordered torus comparison and stability proof at §§1–3 / Theorem 3.4, pp.189–198, are not certified against that primary text here. I checked their stated hypotheses, local dependency order, map conventions and computed controls, and used the accessible Hutchinson text for the symplectic-symbol step. I did not request the waived work again.
- **suslin-1991:** primary text remains human-waived. The primary locators for the Rogers descent, monomial comparison and Lemmas 5.7–5.8 are not text-certified. The accessible Weibel and Hutchinson passages and the explicit local chain calculation were checked; this is not a claim to have read the waived primary paper.
- **bloch:** the waived Lecture 6 is used only to name the full-tensor convention. The README supplies the actual kernel definition and proves its comparisons algebraically; no unread lecture theorem was assumed.
- Goncharov's all-smooth-curve equality is explicitly conditional in §3.12. It is not counted as a proved unconditional end theorem; the unconditional P¹ comparison in §4.21 is a different statement. The F₃ calculation shows why the all-field version cannot be substituted.

No newly required unavailable source was identified, and no waived citation was reopened. This verdict requires an ownership-record repair, not acquisition of a missing text.

## Source issues

- **Misprint** in weibel at VI.4.3, printed p.481 (weibel line 29180): the source says the degree-three Chern composite has coefficient −2; it should be +2 under its signed-factorial convention at V.11.13 (weibel line 27747); affects a stated result.
- **Error** in weibel at VI.1.7 introduction, printed pp.467–468 (weibel lines 28301–28314): the source says the characteristic-p cyclotomic action surjects onto every root-group automorphism; it should be the Frobenius-generated subgroup, e.g. {1,2,4} modulo 7 for p=2; affects a stated result.
- **Misprint** in weibel at proof of VI.5.3, printed p.488 (weibel line 29644): the source says K₃ind(F) is C_w; it should say its torsion subgroup is C_w, retaining the free rank r₂; affects the proof.
- **Error** in weibel at VI.5.4(c), printed p.488 (weibel line 29666): the source says inversion symbols define a homomorphism into B(F); it should target P(F), since h(2) over F₅ has nonzero boundary; affects a stated result.
- **Error** in weibel at proof of VI.5.6, printed p.490 (weibel lines 29747–29748): the source says configuration modules are free over ℤ[GL₂]; it should use permutation modules induced from the scalar stabilizer, or pass to PGL₂; affects the proof.
- **Error** in weibel at VI.5.6.1, printed p.490 (weibel line 29764): the source says P¹(F₂) has seven points and concludes the stated low-degree acyclicity; it should have three points, with nonzero top injective-word homology; affects the proof.
- **Error** in weibel at VI.5.7, printed p.490 (weibel line 29768): the source says the displayed GL₂ homology formulas hold for every field; it should restrict this argument to infinite fields, with separate finite statements; affects a stated result.
- **Misprint** in weibel at proof of VI.5.7, printed p.490 (weibel line 29783): the source says P(F) occupies E¹₃,₀; it should be E²₃,₀ after taking coinvariant-row homology; affects the proof.
- **Misprint** in weibel at proof of VI.5.7, printed p.490 (weibel line 29790): the source says the triple stabilizer consists of diag(a,a⁻¹); it should be diag(a,a), the scalar centre; affects the proof.
- **Error** in weibel at proof of VI.5.7, printed p.491 (weibel line 29823): the source says integral Künneth has only tensor summands in every degree; it should retain Tor, e.g. H₃(C₂×C₂)=C₂³; affects the proof.
- **Misprint** in weibel at proof of VI.5.7, printed p.491 (weibel lines 29829–29830): the source says the kernel/cokernel after d³ are E³ terms; it should use E⁴, subsequently identified with E∞ in these positions; affects the proof.
- **Misprint** in weibel at Exercise VI.5.3, printed p.500 (weibel line 30485): the source says c=[4] over F₇; it should say c=2[4]=2[−1], with [4] of order four; affects a stated result.
- **Error** in cgz2021 at arXiv v3 Definition 1.1, p.2, and Lemma 2.2, p.9 (cgz2021 lines 78 and 389): the source says all extended relations lie in the exterior-boundary kernel; it should use the negative-unit tensor target, since ξ₂,₁ over ℚ has nonzero exterior boundary; affects a stated result; corrected in print at Definition 2.1, p.391.
- **Error** in cgz2021 at published Lemma 2.2, p.391 (cgz2021 line 459): the source says the comparison is onto with two-torsion kernel for every field; it should require at least four elements: F₂ has target C₃ and F₃ has infinite kernel; affects a stated result.
- **Error** in cgz2021 at published Lemma 2.2 proof, p.391 (cgz2021 line 481): the source says all inversion symbols are two-torsion elements of B(F); it should place them in P(F) and intersect with B(F) for the kernel; affects the proof.
- **Misprint** in hutchinson2013 at Corollary 3.3 proof, arXiv v2 p.12 (hutchinson2013 line 518): the source says the nonzero degrees are 3 modulo 3; it should say 3 modulo 4, as in the corollary's statement; affects the proof.
- **Misprint** in hutchinson2013 at Corollary 3.13 proof, arXiv v2 p.17 (hutchinson2013 line 856): the source says a nonzero fixed vector exists iff 1 is not an eigenvalue; it should say iff 1 is an eigenvalue; affects the proof.
- **Gap** in marker at Theorem 3.5 proof, printed p.25 (marker line 428): the source says the midpoint supplies a witness for every interval, allowing infinite endpoints; it should choose a finite endpoint offset for a ray and zero for the whole line; affects the proof.
