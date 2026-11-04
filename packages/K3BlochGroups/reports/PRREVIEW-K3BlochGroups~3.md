# Review of K3BlochGroups (pull request #1430 at b628a17)

**Verdict:** needs changes

## R01 (P2) — Reconcile the two supplier gaps with their local owners

**Location:** `TauCetiRoadmap/K3BlochGroups/README.md:23`, :409 and :1980; `packages/K3BlochGroups/design/plan.json:4` and :10. The ownership paragraph says: “The normalized positive-characteristic integral K₃-torsion comparison is a consequence proved in §2.2” and assigns first-order real-closed-field transfer to §5.8.

**Claim:** The plan still requests these same results from KTheoryFiniteLocalFields and RealAlgebraicGeometry. Neither gap slug appears in the README's Exact supplier contracts. The plan and README therefore assign conflicting ownership; these are redundant requests for work that this roadmap itself plans, rather than unresolved mathematical prerequisites.

**Witness:** The two plan entries name `algebraically-closed-charp-k3-torsion` and `real-closed-elementary-transfer`. README :409 constructs the normalized integral comparison; :1980 explicitly proves quantifier elimination, completeness and model completeness. Searching that README for `gap:` gives no matches.

**Exact repair:** Reconcile the gap record with the chosen ownership. With the present local constructions, retire the superseded gap requests and record that §§2.2 and 5.8 discharge them. Preserve both mathematical targets. If external ownership is retained, instead put the matching `What <Supplier> must provide (gap:<slug>): ...` contracts in the README and consume the supplied results without reconstructing them here.

**Repair controls:** For Ω=𝔽̄₂ and m=5, the normalized Bockstein comparison is C₅→C₅ and Frobenius acts by 4 on both sides. In the real algebraic numbers and ℝ, the sentences asserting roots of x²−2 and x²+1 respectively have values true and false. Either consistent ownership choice preserves these controls.

This is the previous review's R01, still unresolved at the identical head. It does not re-raise the settled missing-input objection in FIX-RT-K3BlochGroups~2 F06: the local construction now supplies that mathematical input. The finding concerns the contradictory retained gap requests, not a demand for another supplier theorem.

## R02 (P3) — Correct the K-book extraction-line references

**Location:** `TauCetiRoadmap/K3BlochGroups/README.md:407` and :409, quoting “weibel line 91” and “weibel line 215”.

**Claim:** Both extraction-line references point into the K-book introduction, not the algebraically closed K₄ and torsion results. The accompanying theorem numbers are usable, but the promised direct witnesses are wrong.

**Witness:** weibel line 91 discusses Waldhausen categories; line 215 describes the history of norm residue. Corollary VI.1.3.1 is at line 28137, Theorem VI.1.6 at 28266, and Proposition VI.1.7.1 at 28322.

**Exact repair:** Replace the two stale line references with those locations, retaining the theorem numbers and distinguishing chapter pagination from printed pp.465–468. Opening the replacements gives positive-even unique divisibility and the weight-two torsion comparison, including Ω=F̄₂ and the Frobenius multiplier 4 at modulus five. No mathematical statement needs changing.

## Previous findings

The change record reports no change since the previous review. I checked its findings first, then reviewed the whole folder.

- **R01: not repaired.** The quoted ownership sentence above and “Prove quantifier elimination for the first-order theory of real closed ordered fields” at README :1980 remain alongside the two external gap entries.
- **R02: repaired, as recorded previously.** README :83 cites “§3.33's fibration for a universal central extension”; :69 cites GeneralAlgebraicKTheory “Sections 3.2, 3.12 and 3.14”; :113 and :119 use HomotopySpheres §9.1 and FourManifolds §7.1. I resolved those sections again. They supply the required comparisons and the normalization η³=12ν. No citation finding is re-raised.

## Verified sound

This is a full review of the README and all 13 Lean declarations at the requested head, not an incremental review. The earlier adversarial ledger was used as a checklist, with the controls below recomputed algebraically or in scratch calculations. Finite calculations test statements and conventions; they are not proofs of the general theorems. Source certification and the three waived texts are distinguished below.

I read the repository's writing and contribution rules and the main-branch AlgebraicTopology and completed UniversalCovers roadmaps as shape references. The worktree is at the requested head, its status is clean, and the diff outside this roadmap folder against origin/main is empty. No pull-request file was changed. The document retains the general integral theory, characteristic-two cases, finite-field exceptions and actual comparison maps; I found no route-specific replacement of those results. Its finite certificates are mathematical existence statements with actual free-chain evaluations, not algorithms or bounded searches.

### Gate and Lean acceptance test

The supplied push gate is passing, including the targeted build:

```text
gate K3BlochGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

Fresh `lake env lean` elaboration succeeded. A separate scratch copy with `#check @name` for all 13 declarations also succeeded, with only eight expected `sorry` warnings. Its signatures agree with the README: arbitrary abelian A for diagonal exactness; infinite F and i≤n for GL stability; m≥1 and j≥1 for cyclic powers; 2i≤n for symmetric stability; prime characteristic and finite fields for SL₂; q≥4 for finite Bloch order; and `IsFormallyReal F` for order six. The identity coefficient morphism is explicitly required in each homology-map theorem. The universe lifts preserve the coefficient rings. No binder was lost and no signature repair was needed.

The eight statable headline theorems are:

| README headline | Acceptance declaration and line |
| --- | --- |
| §3.1 integral diagonal exactness | `antisymSquare_diagonal_exact`, `Suggested.lean:40` |
| §4.8 infinite-field GL stability | `generalLinear_homology_stable`, :95 |
| §4.15 cyclic power action | `cyclicHomology_power_map`, :108 |
| §4.15 symmetric-group stability | `symmetricGroup_homology_stable`, :120 |
| §5.2 characteristic-localized finite SL₂ H₃ | `finite_sl2_localized_homology`, :133 |
| §5.2 integral finite SL₂ H₃, including exceptional q | `finite_sl2_integral_homology`, :145 |
| §5.5 finite Bloch order | `finiteBloch_order`, :157 |
| §5.8 universal c has order six over every formally real field | `blochC_order_six`, :170 |

Here the line references are in `TauCetiRoadmap/K3BlochGroups/Suggested.lean`. The other headline families are the homological Quillen K₃ comparison and Hopf kernel (§§1.1–1.5), Milnor injectivity and motivic edge (§2.2), normalized algebraically closed torsion (§2.2), infinite and finite Suslin sequences (§§4.20,5.5), transcendental rigidity (§4.21), arithmetic quotients (§§2.3–2.5,5.7), the Rogers detector (§5.8), mixed-field/coefficient comparisons (§6.6), and genuine finite-coefficient Chern equivalence (§6.7). The module docstring names these and the missing Quillen, shared Milnor/motivic, enhanced-Tor, configuration, Chern and Rogers carriers. It does not replace them with arbitrary predicates or sorry-defined maps. Five simple definitions support the eight statements.

Each admitted theorem was probed on a scratch copy with `simp`, `rfl` and `infer_instance`, requiring the tactic to close the goal. All eight failed to close. Object searches and inspection of the existing cyclic norm-complex and tensor APIs found no single library theorem that supplies these conclusions. None is a definition restatement, small-value calculation or boundary-case substitute; no padding finding arose.

### Dependency and ownership audit

The prescribed dependency command was rerun and returned:

```text
depcheck: 204 roadmaps, 1615 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. I read the Needs lines and supplier contracts and followed their object-level inputs. The citation resolver found no cross-roadmap citation or roadmap Lean name missing everywhere; its warning that it did not inspect native pins was addressed by direct library inspection. The local order is not circular: frame stability precedes the infinite-field Suslin map; root-cycle detection precedes finite stabilization; the algebraic-closure SL₂ comparison is an output of finite stabilization, not its input. The conditional all-curve relation kernel is retained rather than set to zero.

The following supplier sections were opened at main or the available new-roadmap heads. Line numbers exclude the `roadmaps show` provenance header. Several sections in one row are one resolved supplier contract, not claims that all their mathematics is already formalized.

| Supplier contract resolved | File and anchor lines | Boundary checked |
| --- | --- | --- |
| GeneralAlgebraicKTheory §§1.8,3.2–3.4,3.12–3.14,7.4,13.8a–c | `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md:226`, :418, :448, :615, :645, :1478, :2993 | Positive plus/Q comparison, external products over noncommutative rings, finite-field groups and continuity; inverse transpose alone is not the unit normalization. |
| AlgebraicKTheory A1,A5 | `TauCetiRoadmap/AlgebraicKTheory/README.md:209`, :227, :243, :503 | Stable block inclusions, perfect elementary group and Steinberg universal central extension; zero ring retained. |
| K2SymbolsBrauer Layers 2,4; §§5.4,5.6,5.12–5.14,7.2,8.1–8.4,10.5,10.32,11.3 | `TauCetiRoadmap/K2SymbolsBrauer/README.md:137`, :283, :508, :573, :696, :1221, :1276, :1347, :1819, :2390, :2531 | Shared Milnor carriers and products; injectivity/cokernel explicitly belong downstream here. Parameter-last residue gives sign + in degree three; unique divisibility excludes degrees zero and one. |
| StableHomotopyKTheory §§1.17,1.30,1.32,3.26–3.29,3.31,3.33,4.14,5.19,6.3,7.1,7.27 | `TauCetiRoadmap/StableHomotopyKTheory/README.md:305`, :462, :491, :1304, :1334, :1373, :1389, :1647, :2232, :2314, :2340, :2694 | Classifying homology, plus and UCE fibre, H-space, braiding, Barratt–Priddy, low stems and spectrum AHSS. Group-module hyperhomology and the extra AHSS module structure remain local targets. |
| AlgebraicTopology Stages 2–5,8 | `TauCetiRoadmap/AlgebraicTopology/README.md:326`, :471, :499, :849, :1684 | Actual homology, CW and relative constructions, coefficient-sensitive Künneth, Hurewicz and Whitehead; no natural splitting of Künneth is assumed. |
| UniversalCovers Stages 2–3 | `Completed/UniversalCovers/README.md:98`, :126 | Based lifting and higher homotopy of actual covers, with connectedness/basepoint conditions. |
| KTheoryFiniteLocalFields §§1.5,1.8,3.0,3.0a,5.17,6.5a,6.10 | `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:267`, :316, :486, :514, :1204, :1360, :1488 | Finite-field maps, finite Chern operations, characteristic-p Milnor torsion, motivic tower, defining-characteristic comparison, Bott coefficients and diagonal Chern factor. Its §6.5a does not itself state the normalized integral gap result. |
| SchemeKTheoryOperations §§3.6,4.7,5.2,5.5,6.4 | `TauCetiRoadmap/SchemeKTheoryOperations/README.md:1112`, :1632, :1812, :1895, :2399 | Algebraically closed base injection, DVR localization, regular homotopy invariance, projective bundle and operations. Injection requires a nonzero algebra; it is not a claim for the zero ring. |
| ArithmeticKTheory §§3.2–3.4,4.1–4.4,5.1–5.4,8.10 | `TauCetiRoadmap/ArithmeticKTheory/README.md:950`, :1402, :1578, :1634, :1795, :1819, :4773 | Number-field rank and torsion; characteristic-zero normalized torsion comparison; ℚ and ℚ(i). These arithmetic inputs do not depend on this Bloch comparison. |
| HomotopySpheres §9.1; StringOrientation S2.3 | `TauCetiRoadmap/HomotopySpheres/README.md:2463`; `TauCetiRoadmap/StringOrientation/README.md:580` | Normalized quaternionic Hopf generator of C₂₄, imported rather than recomputed. |
| FourManifolds F2,§7.1 | `TauCetiRoadmap/FourManifolds/README.md:741`, :2870 | Finite-wedge Hopf/Whitehead coordinates and η³=12ν; arbitrary-index extension is local. |
| AlgebraicCurves Layer 12A | `TauCetiRoadmap/AlgebraicCurves/README.md:1583` | Proper integral curves and regular closed-point order; §3.12's nonproper smooth adapter is wider and uses native stalk inputs. |
| GlobalNumberFields Layer 1 | `Completed/GlobalNumberFields/README.md:259` | Weak approximation gives independent real signs on field units, not necessarily integral units. |
| PolylogarithmFunctions §§5.8,6.1,6.3–6.5 | `TauCetiRoadmap/PolylogarithmFunctions/README.md:840`, :905, :939, :952, :973 | Field-general cross-ratio with reciprocal convention; interval Rogers function, reflection, pentagon and midpoint. Real pre-Bloch descent is constructed here. |
| RealAlgebraicGeometry Layers 1,6 | `Completed/RealAlgebraicGeometry/README.md:130`, :437 | Ordered real closures; its elimination claim is over ℝ. General real-closed transfer is the local extension, subject to R01's bookkeeping repair. |

Object searches used both `roadmaps grep`/`roadmaps show` and the board packages, alongside direct searches of the pinned libraries. Polylogarithms `README.md:12`, :108 and :608 imports these Bloch carriers, reverses the boundary explicitly and consumes rational-curve rigidity; it does not construct a rival carrier. HabiroNahmSeries `README.md:80`, HabiroNumberFields `README.md:41` and PadicHodgeRegulators `README.md:61` likewise consume the relevant objects. The ColemanIntegration object-search matches defer its algebraic carriers to this roadmap, while keeping analytic evaluation. The later GeneralAlgebraicKTheoryPartII and StableHomotopyKTheoryPartII objects were included in the open-work search; no second owner of a kept acceptance declaration was found. No `Suggested.lean` declaration here has a fully qualified name belonging to another readable roadmap. The two conflicting plan gap entries are the ownership exception reported as R01.

### Pinned declarations opened

The pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These are direct file inspections, not conclusions from the citation resolver.

| Native declaration / object | File and line | Checked meaning |
| --- | --- | --- |
| `groupHomology.cycles`, `cyclesMk`, `iCycles`, `toCycles`, `groupHomology`, `π` | `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:194`, :202, :208, :218, :228, :233 | Actual cycles, inclusion and quotient projection of the inhomogeneous complex, with shared ring/group universe. |
| `Rep.FiniteCyclicGroup.groupHomologyIsoEven`, `groupHomologyIsoOdd` | `Mathlib/RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean:85`, :122 | Arbitrary cyclic representation norm-complex comparison; positive even degree is required. These do not state the power-map formula. |
| `HSpace` | `Mathlib/Topology/Homotopy/HSpaces.lean:65` | Continuous multiplication, based unit and relative unit homotopies; no associativity or commutativity field. |
| `TauCeti.antisymmetricTensors` | `TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean:126` | Negative eigenspace, not the cokernel used here; over ℤ the two values are 0 and C₂. |
| `TauCeti.crossRatio_comp_eq_of_sub_eq_div` | `TauCeti/Algebra/Field/LinearFractional.lean:51` | Affine difference-quotient hypothesis and nonvanishing denominator assumptions; projective adapter is additional work. |
| `TauCeti.groupHomology.indIso_inv` | `TauCeti/RepresentationTheory/Homological/GroupHomology/Shapiro.lean:98` | Inverse Shapiro is change of group applied to the induction unit. |
| `transfer`, `map_comp_transfer`, `transfer_comp_map_subtype_id` | `TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean:65`, :89, :107 | Finite-index hypothesis; coefficient naturality; corestriction after transfer is multiplication by the index. |
| `transfer_trans` | `TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Trans.lean:86` | Nested subgroup maps and finite index retained. |
| `δ_naturality` | `TauCeti/RepresentationTheory/Homological/GroupHomology/LongExactSequence.lean:106` | Naturality of the actual connecting map for short exact sequences. |
| `eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero` | `TauCeti/RepresentationTheory/Homological/GroupCohomology/Sylow.lean:56` | Finite group, prime p, a p-power-annihilated element and zero Sylow restriction. |
| `corestriction_mackey` | `TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction/Mackey/AllDegrees.lean:279` | Compact totally disconnected topological group, discrete continuous module, open U and closed V. The README explicitly owns the finite-discrete cochain adapter. |
| `TauCeti.RealClosure.exists_realClosure` | `TauCeti/FieldTheory/RealClosure/Basic.lean:120` | Ordered algebraic real closure in the original universe; no embedding into ℝ. |
| `RingPreordering.exists_linearOrder` | `TauCeti/Algebra/Order/Ring/Ordering/Extension.lean:158` | Compatible order extending the given field preordering. |
| `isRegularLocalRing_stalk_of_smooth` | `TauCeti/AlgebraicGeometry/Morphisms/Smooth/Regular.lean:39` | Locally Noetherian regular base and smooth morphism. |
| `smoothOfRelativeDimension_iff_ringKrullDim_stalk_eq` | `TauCeti/AlgebraicGeometry/Morphisms/Smooth/RelativeDimension.lean:83` | Smooth scheme over a field, dimensions at closed points. |
| `isDiscreteValuationRing_iff_ringKrullDim_eq_one` | `TauCeti/RingTheory/RegularLocalRing/Basic.lean:171` | Regular local ring plus dimension one gives the DVR; field stalks have dimension zero. |
| `Scheme.functionField` stalk fraction-ring instance | `Mathlib/AlgebraicGeometry/FunctionField.lean:164` | Requires `IsIntegral X`. |
| `Scheme.residueField`, `residue`, `descResidueField` | `Mathlib/AlgebraicGeometry/ResidueField.lean:45`, :54, :78 | Residue field of the actual stalk; the induced map needs a local homomorphism. It alone does not identify the residue field with the base. |

Native free abelian, tensor, exterior, matrix, projective, first-order and quotient carriers were searched by object. No shared Quillen K₃, Milnor K₃, pre-Bloch/Bloch, enhanced-Tor comparison or interval Rogers carrier was found at these pins. Generic homology, tensor and transfer constructions remain imported rather than replanned. The acceptance file's block inclusion is the small native-matrix adapter explicitly allowed by its supplier contract.

### Seeded source verification

All **15 seeded targets** were followed to their cited text or their settled waiver. No additional README locator is marked unverified. The source cache includes both versions of CGZ under the same manifest key; the published negative-unit target and the older exterior target were read separately. Printed pages and PDF page offsets were checked, rather than interchanged. The table distinguishes a source theorem from an extra consequence proved in the roadmap.

| Target | Text read and locator | Verification |
| --- | --- | --- |
| §2.2 injectivity and motivic edge | weibel line 29189, VI.4.3.1–4.3.2, printed pp.481–482; line 27746, V.11.13, p.458; lines 28137,28266,28322, VI.1.3.1,1.6,1.7.1, pp.465,467–468 | Degree-three diagonal factor is +2; injectivity uses separate 2-torsion arguments. Algebraically closed divisibility and weight-two torsion are supported. The normalized char-p comparison is locally derived from the integral injection and coefficient square. |
| §3.2 projective cross-ratio | weibel line 29738, VI.5.6 and its proof, printed p.490 / PDF p.498 | Ordered deletion faces give the displayed five-term relation; the roadmap corrects the central stabilizer. Supplier cross-ratio is reciprocal in these coordinates. |
| §3.5 boundary/Matsumoto exactness | weibel line 29553, VI.5.1–5.2, printed pp.486–487 | Antisymmetric quotient retains diagonal 2-torsion. The q=2,3 exceptions are stated separately, not extrapolated from large-field torsion identities. |
| §3.10 obstruction to lifting | weibel lines 29553–29616 and 29663–29705, VI.5.1–5.4, pp.486–489 | These supply the target presentation and torsion identities. The E/L exact obstruction and sixfold lift are local algebraic consequences, not a theorem quoted verbatim from the source. Applying λ to γ and μ to γ gives 0 and 6β, respectively. Bloch's convention itself remains waived. |
| §3.11 generic configuration | goncharov lines 263,675,1833,1868,1881; §1.1 (1.6)–(1.8), p.203; §1.8, p.218; Definition 2.4 and Lemma 2.8, pp.253–254 | Generic distinct projective configurations, not the all-curve quotient. Boundary order is (1−x) then x; the roadmap records its negative relative to ∂. No integral exterior-square identification is inferred. |
| §3.12 rational smooth-curve specialization | goncharov lines 754–925, §1.9 and Definition 1.25(a), pp.221–225 | Smooth-curve relations are rationalized. Corollary 1.19 concerns the complex analytic setting; Conjecture 1.20 does not prove all-field relation equality. The README owns a local specialization lemma and retains K_curv and conditional vanishing. Native stalk inputs justify the nonproper smooth domain. |
| §3.14 negative-unit tensor target | cgz2021 published lines 446–465, Definition 2.1 and Lemma 2.2, printed p.391 | Actual quotient kills u⊗(−u), with field multiplication by −1. Neither ordinary exterior square nor u⊗u can replace it integrally. |
| §3.15 published projective presentation | cgz2021 published lines 453–481, same page | Extended admissibility excludes indeterminate fractions, not all degenerations. The local q≥4 comparison qualification repairs the source's unrestricted-field assertion. |
| §3.16 exact convention maps | cgz2021 published lines 459–481, p.391; arXiv v3 lines 378–410, pp.8–9 | The new map is surjective with 2-primary kernel for q≥4. The old exterior comparison has a different cokernel; the F₁₁ calculations distinguish them. Coprime coefficient exports preserve the specified maps. |
| §4.3 scalar acyclicity | suslin-1984, Corollary 1.8 and Theorem 1.9, p.191 | Primary text waived; not source-certified. The positive-degree and infinite-field hypotheses are explicit. Scalar 2 over ℚ and the j=0 negative control are computed below. |
| §4.16 monomial indecomposables | weibel lines 30300–30353, VI.5.16.1–5.17 and proof, pp.497–498; lines 30521–30537, Exercise VI.5.9, p.501 | Quotient by products, sphere summand modulo η³ and AHSS route match. Ordinary Tor has the weight-two action; abstract root models are not asserted natural. Suslin's primary §5 remains waived. |
| §5.1 finite-field K₃ and transfer | weibel lines 14140–14180, III.7.2, pp.245–246; lines 15630–15662, IV.1.12–1.13, pp.268–269; cgz2021 published lines 1192–1233, §4.2, p.406 | Finite Milnor vanishing and Quillen K₃ give the indecomposable equality. The restriction/transfer formulas are supplied map-level inputs. The Cartan is the multiplication subgroup; it is not the field automorphism group. |
| §5.3 actual finite stabilization | hutchinson2013 lines 703–745, arXiv v2 Corollaries 3.6–3.9, pp.14–15 | Characteristic-localized comparison includes F₂ and F₃. The source uses an algebraically closed unstable comparison; the README explicitly replaces that input by §4.18's detector and equal images of injective subgroup maps. Equal group orders alone are not its injectivity argument. |
| §5.8 real detector and transfer | zagier lines 1023–1065, Part II §1.A, pp.23–24; marker lines 398–449, Theorem 3.5, Corollary 3.6, Proposition 4.1, pp.24–25; weibel lines 29610–29616, VI.5.2.1, p.487 | Interval values and full real-closed transfer are supported. Zagier's projective period π²/2 alone does not supply the finer π² detector; the shifted Suslin descent has its own target and waived primary locator. The finite-certificate transfer gives the non-Archimedean lower bound. |
| §6.1 five-term equality transport | cgz2021 published lines 453–481, Definition 2.1/Lemma 2.2, p.391; Layer 3's actual free quotient | A finite relation expression maps to zero, and quotient equality means membership in the generated subgroup. Modulus zero is the integral quotient. No algorithm or bound is claimed. |

Additional proof-sensitive locators reopened include Kerz Theorems 1–2 (kerz line 22 onward, pp.1–3), the finite SL₂ exceptional-characteristic computation in Hutchinson, the rank-two finite chain computation in Mirzaii Lemma 4.1, Weibel's rank-three cone and permutation calculation, and the degree-two Chern warning in weibel-chern lines 25–54. Hutchinson 2024 Theorem 2.10 (hutchinson2024 line 170, p.4) is about **indecomposable finite-coefficient K-theory**, not ordinary K₃/n; §6.7 preserves the K₂[n] term. The old report's source assertions were not treated as substitutes for opening these texts.

### Adversarial computations

Cₙ means ℤ/n. “Retain” means the tested equality holds at the listed instances and the indicated wrong model is excluded, not that finite testing proves the general theorem. Where homotopy or K-group orders enter, the values use the named supplier calculation; the quotient, map, sign or boundary is then evaluated explicitly. The **144-row** table includes all numbered target sections, the acceptance definitions and eight headlines, every seeded target and the objects involved in R01.

The scratch calculations used exact rational matrix arithmetic, integer row-lattice reduction for finite presentations, and injective-word boundary matrices. Word ranks were obtained modulo a prime; adjacent rank sums attain the characteristic-zero upper bounds from d²=0, certifying the displayed rational ranks. These computations are review witnesses, not additions of algorithms to the roadmap.

| Statement or defining law | Instances | Computed values on the two sides / excluded model | Result; change |
| --- | --- | --- | --- |
| 1.1 Steinberg plus and connectivity | A=0,ℤ | A=0: K₃=H₃(1)=0. A=ℤ: π₂(BSt⁺)=0; π₂(BE⁺)=C₂. | Retain; wrong plus space excluded. |
| 1.1 covering comparison | A=ℚ | π₁(BSt⁺)=0; π₁(BGL⁺)=ℚˣ, containing −1≠1. | Retain. |
| 1.2 canonical composite and inverse | C₅, q=×2, others id | c(1)=3; q(c(1))=6=1; unreversed q gives 2. | Retain. |
| 1.2 additivity/naturality | Same C₅ model | c(1+1)=1=3+3; c(0)=0; inverse composite sends 2 to 2. | Retain. |
| 1.3 unnormalized differential | Identity entries | d₄[1,1,1,1]=[1,1,1]; d₃[g,1,1]=[1,1]−[g,1]. | Retain; normalized and unnormalized models differ. |
| 1.3 noncommutative bar order | S₃, g=(01),h=(12) | gh(2)=0; hg(2)=1. Middle term is −[gh], not −[hg]. | Retain pinned order. |
| 1.3 cycle evaluation and witnesses | z=d₄[1,1,1,1] | z≠0 as a free chain; d₃z=0 and ev(z)=0. | Retain; zero class need not be zero chain. |
| 1.4 identity/composition | A→A→A, identity | A support coefficient 7 remains 7; every tuple and its boundary are unchanged. A=0 gives class 0 on both routes. | Retain. |
| 1.4 filtered stages without injectivity | C₂→1 and trivial coefficient homology | Nonzero H₃(C₂)=C₂ class becomes 0 at the next stage; a later boundary witnesses equality. | Retain; no uniform/injective-stage assumption. |
| 1.5 wedge decomposition | 0,1,2,3 sphere summands | Ranks r+r(r−1)/2 are 0,1,3,6; Hopf and unordered-pair coordinates give those same ranks. | Retain. |
| 1.5 swap, pinch and fold | Two S² summands | Pair swap has sign (−1)⁴=+1; pinch Hopf coordinates (1,1,1); fold gives η+η+2η=4η. | Retain. |
| 1.5 finite-subwedge compatibility | Include first two of three spheres | (a,b,c)↦(a,b,0,c,0,0); restriction returns (a,b,c). | Retain; no extra pair coordinate. |
| 1.5 Hopf–Hurewicz kernel | ℤ; characteristic two field | ℤ: C₄₈/⟨24⟩=C₂₄. In characteristic two, [−1]=[1]=0. | Retain. |
| 1.5 sphere-unit normalization | η³ in C₂₄ | 12 has order 2; −12=12; quotient order 12. | Retain; supplier locators resolved. |
| 2.1 Milnor image/cokernel | ℚ | Image={0,24} in C₄₈; cokernel C₂₄. Quotient by all torsion would be 0. | Retain. |
| 2.1 quotient uniqueness | C₄₈→C₂₄ | 1 and 25 both map to 1; their difference 24 lies in the specified image. | Retain. |
| 2.2 signed Chern composite | {t₁,t₂,t₃} over ℚ(t₁,t₂,t₃) | Ordered residues give 1; composite residues give +2; swap first entries gives −2; zero map gives 0. | Retain. |
| 2.2 characteristic-p branch | 𝔽₂(t₁,t₂,t₃); Prüfer C₂∞ control | Symbol residues 1 and 2 are unequal in ℤ; in C₂∞, 2·(1/2)=0 despite divisibility. | Retain torsion-freeness input. |
| 2.2 motivic edge quotient | ℚ | K₃=C₄₈, Milnor image C₂, H¹(ℚ,ℤ(2))=C₂₄; edge kernel C₂. | Retain. |
| 2.2 K₄ divisibility and coefficient boundary | Ω=𝔽̄₂, r=2,5 | K₄=0, so K₄/r=0; mod 5 boundary C₅→C₅ is bijective; mod 2 both positive-degree groups 0. | Retain proof route. |
| 2.2 degree-zero exception | Ω=𝔽̄₂ | K₀(;ℤ/2)=C₂; positive-degree defining-characteristic coefficient groups 0. | Retain. |
| 2.2 normalized torsion naturality | Ω=𝔽̄₂, m=3,5 | Frobenius multipliers 2²≡1 mod 3 and 4 mod 5; untwisted multipliers 2,2 disagree. | Retain theorem; R01 ownership record. |
| 2.3 signature image | r₁=0,1,2 | Image orders 1,2,4; all-negative triple has coordinates (1) or (1,1); sign-isolating symbols give (1,0),(0,1). | Retain. |
| 2.4 imaginary quotient | ℚ(i) | r₁=0; Milnor image 0; K₃=K₃ind=ℤ⊕C₂₄. | Retain. |
| 2.4 stable-SL quotient | ℚ | H₃(SL∞)=C₂₄ and K₃ind=C₂₄; K₃ itself is C₄₈. | Retain. |
| 2.5 rational rank | ℚ and ℚ(i) | Rational dimensions 0 and 1, equal r₂; C₄₈⊗ℚ=C₂₄⊗ℚ=0. | Retain. |
| 3.1 tensor cokernel headline | A=0,ℤ,C₃,C₂ | Qₛ=0,C₂,0,C₂; Λ²=0 in all four; kernels equal A/2A=0,C₂,0,C₂. | Retain. |
| 3.1 mixed coordinates | A=ℤ² | Qₛ=C₂²⊕ℤ, Λ²=ℤ; diagonal kernel C₂². For (1,1), diagonal is e₁²+e₂². | Retain. |
| 3.1 exact diagonal relations | A=C₄, a=1,b=3 or 0 | 1²=3² in Qₛ and 1−3=2·1; 1²≠0² and 1∉2C₄. | Retain both directions. |
| 3.1 eigenspace distinction | A=ℤ | Flip-negative subgroup is 0; cokernel is C₂. After tensoring ℚ both are 0. | Retain distinct ownership. |
| 3.2 cross-ratio and permutation | (0,∞,1,3) | cr=3; first-two swap gives 1/3; supplier reciprocal is 1/3. | Retain adapter. |
| 3.2 deletion faces | (0,∞,1,2,3) | Face values (1/2,3/4,3/2,3,2); alternating sum is R(2,3). | Retain. |
| 3.3 admissibility and junk values | (x,y)=(2,3), (1,3),(2,2) | Valid arguments 2,3,3/2,3/4,1/2. x=1 gives a zero denominator/numerator; x=y is excluded, not an added relation. | Retain. |
| 3.3 free equality certificate | Coefficients 0 and 1 at R(2,3) | 0 evaluates to the zero chain; coefficient 1 evaluates to the displayed five-term chain, zero only after quotienting. | Retain. |
| Raw/quotient symbol definitions | x=0,1 over any field | Raw(0)=0; raw(1) is one free basis vector; quotient symbol(0)=symbol(1)=0. | Retain; real bodies match. |
| 3.4 presentation, small fields | 𝔽₂,𝔽₃ | Reduced generator ranks 0,1; no admissible pairs; P=0,ℤ. | Retain. |
| 3.4 reduced/unreduced equivalence | 𝔽₃ | Unreduced has [1],[2]; killing [1] leaves ℤ[2], same as reduced. | Retain. |
| 3.5 boundary and signs | ℚ, x=3 and 1/3 | (v₂,v₃)-alternating values −1 and +1; reversing tensor order reverses these values. | Retain. |
| 3.5 kernel and K₂ cokernel | 𝔽₅ | P=C₆; ∂[3]=1 in C₂; kernel C₃; cokernel 0=K₂(𝔽₅). | Retain. |
| 3.6 reflection/inversion | 𝔽₅, generator g=[3] | [2]=2g,[4]=0; c=2g; h(2)=3g; 2h=6g=0; ∂h=1≠0. | Retain h in P, not B. |
| 3.6 3c and sixth-root cases | 𝔽₇, g=[3] | [−1]=2g, c=4g; 3c=4g=h(−1), 6c=0; c≠0. | Retain. |
| 3.7 finite presentation orders | 𝔽₅,𝔽₇,𝔽₁₁,𝔽₁₃ | Integer relation-lattice indices 6,8,12,14; c orders 3,2,6,1. | Retain. |
| 3.8 exterior comparison | 𝔽₅ | Λ²(C₄)=0; exterior kernel is all P=C₆; Suslin B=C₃, index 2. | Retain. |
| 3.9 raw full tensor | 𝔽₃ and 𝔽₅ | 𝔽₃: λ:ℤ→C₂, ker=2ℤ. 𝔽₅: R(2,3)=[4], λ[4]=2 mod 4≠0. | Retain. |
| 3.9 μ kernel and image | 𝔽₅ | 2[4]≠0 in the free group, λ=0, μ=0; 4[3] maps to 4g, of order 3. | Retain. |
| 3.9 rational noninjectivity | ℚ | 4[−1] has free coefficient 4 and infinite order; λ=0 and μ=0. It remains nonzero after tensoring ℚ. | Retain. |
| 3.10 obstruction and sixfold lift | 𝔽₃; 𝔽₅, α=2[3] | 𝔽₃: E=L=0, 2ℤ→2ℤ identity. 𝔽₅: σα=α, γ=4[4], λγ=0 and μγ=0=6·2g. | Retain. |
| 3.11 generic projective symbols | 𝔽₃ | Quadruple (0,∞,1,2) gives [2]; no 5-tuples; H₃ coinvariants=P=ℤ. | Retain. |
| 3.12 local specialization | DVR F[t]_(t) | t↦0, t⁻¹↦∞, 1+t↦1; stalk dimension 1. A field stalk has dimension 0 and is not this closed-point DVR. | Retain. |
| 3.12 singular/thickened negative controls | Cusp and square-zero thickening | Cusp cotangent dimension 2 versus ring dimension 1; thickening has ε≠0, ε²=0. Neither native stalk is a DVR. | Retain smoothness. |
| 3.12 all-curve quotient | 𝔽₃, rationalized | P⊗ℚ=ℚ; exterior target 0; projective inversion gives 2[2]=0 and therefore kills [2] rationally, so the comparison kernel is ℚ, not torsion. | Retain conditional relation equality. |
| 3.13 old relation defect | ℚ, ξ(2,1) | Boundary 2∧(−1) has nonzero value 1 under v₂⊗sign modulo 2; proposed denominator is not contained in the kernel. | Retain intersection repair. |
| 3.13 old comparison | 𝔽₁₁ | B=C₆, B_old=C₆; map image C₃, kernel C₂, cokernel C₂. Same orders do not give an isomorphism. | Retain. |
| 3.14 negative-unit target | 𝔽₃ and 𝔽₅ | Q₋=C₂ and 0, respectively; ordinary exterior target is 0 in both. | Retain. |
| 3.15 projective reduced quotient | 𝔽₂,𝔽₃,𝔽₁₁ | B_new orders 3,1,3 versus Suslin B orders 1,infinite,6. | Retain size hypotheses. |
| 3.16 convention maps | 𝔽₁₁, mod 3 and mod 2 | C₆→C₃ induces C₃≅C₃ modulo 3; modulo 2 gives C₂→0. | Retain odd/invert-two qualifications. |
| 4.0 finite words and augmentation | Sets of sizes 0,1,2 | Empty augmented degree 0 is ℤ; size 1 differential [x]↦1 gives zero homology; size 2 top cycle (a,b)+(b,a) has boundary 0. | Retain top term. |
| 4.0 exactness range | Five letters | Chain ranks 1,5,20,60,120,120; boundary ranks 1,4,16,44,76; top homology rank 44. | Retain finite/infinite distinction. |
| 4.1 total differential | Bidegree (1,1) | Cross terms have signs +1 and −1, sum 0; using + in both positions gives 2. | Retain. |
| 4.1 hyperhomology identity | Trivial G, complex ℤ in degree 0 | E²₀,₀=ℤ; all other entries 0; abutment H₀=ℤ,Hᵢ>₀=0. | Retain actual module construction. |
| 4.2 independent frames | n=1, F=𝔽₂ versus ℚ | 𝔽₂: one nonzero vector, augmented boundary is id ℤ. ℚ: reduced degree-one group consists of finite sums with coefficient sum 0. | Retain indexing. |
| 4.3 scalar coinvariants | F=ℚ,V=ℚ,j=1,k=ℚ | Scalar 2 gives (2−1)V=V, so H₀=0; with V=0 all groups 0; at j=0 H₀=ℚ≠0. | Retain j>0; source waiver noted. |
| 4.3 affine stabilizer | Upper triangular GL₂(ℚ), M=ℚ | Scalar on first block sends u↦2u; on second sends u↦u/2; differences ×1 and ×(−1/2) are invertible. | Retain either-block hypothesis. |
| 4.4 frame coinvariants | F=ℚ | S₀=ℤ; S₁=ℚˣ; the extra S₂ generator is (0,1), not zero in K₂ᴹ⊕ℤ. | Retain. |
| 4.5 ordered Milnor symbols | {t₁,t₂} | Successive parameter-last residues give 1; reversed symbol gives −1. Unadjusted inverse comparison changes the sign. | Retain supplier normalization. |
| 4.6 splitting | S₂=K₂ᴹ⊕ℤ | (x,7) projects to x and 7; inclusion-sum reconstructs (x,7); (0,1) survives. | Retain simultaneous induction. |
| 4.7 monomial subgroup | 𝔽₂ and 𝔽₃, rank 2 | Orders 2 and 2·2²=8; GL₂(𝔽₃) has order (9−1)(9−3)=48. | Retain distinct carrier. |
| GL block inclusion definition | n=0,1; g=2 over ℚ | 0×0 unit maps to (1); g maps to diag(2,1), inverse diag(1/2,1), product I₂. | Retain. |
| 4.8 GL stability headline | n=i=0; n=1,i=1 | H₀ map ℤ→ℤ sends 1↦1; H₁(ℚˣ)→H₁(GL₂ℚ) is determinant identity. n=0,i=1 would be 0→ℚˣ, not onto. | Retain i≤n. |
| 4.10 projective coinvariants | 𝔽₂,𝔽₃ | Degree-three homology 0 and ℤ, equal P; in the latter no degree-four distinct tuples exist. | Retain all-field claim. |
| 4.11 matrix faces/determinants | a=2,3 | det(A,B,C)=(−1,−2,2),(−2,−6,3); At=(∞,1,a). a=0 or 1 makes a determinant 0. | Retain. |
| 4.11 eight-term chain identity | a=2,3,−1,4 over ℚ | Expanded d(u) minus six claimed terms has zero coefficient on every right-diagonal orbit in all four cases. | Retain. |
| 4.11 Shapiro seven-commutator reduction | a=2,3,−1,4 over ℚ | Shapiro(uw−u) minus the seven commutators equals exactly the negative boundary of the specified bar 3-chain; remaining coefficient vector 0. | Retain. |
| 4.11 differential and shear | a=3, alternating valuation | Raw signed pair (1,−1) maps to (0,−1); inverse shear restores (1,−1). | Retain; raw splitting would be wrong. |
| 4.11 determinant-one torus | Ordered pair with wedge value 1 | Raw (2,−2) maps to (0,−2); coefficient +2 would reverse the second entry. | Retain. |
| 4.12 infinite-field restriction | 𝔽₄ negative control | H₂(GL₂𝔽₄)=C₂; Λ²𝔽₄ˣ⊕K₂(𝔽₄)=0. | Retain infinite hypothesis. |
| 4.13 rotations and norm | Degrees 0,1,4 | N₀=1; N₁=1−t; N₄=1+t+t²+t³+t⁴. At fixed generators these evaluate 1,0,5. | Retain signs. |
| 4.13 cone differential | x=0, nonzero y | d(0,y)=(−Ny,−dy); two applications have first component −dNy+Ndy=0. | Retain. |
| 4.14 rank-three projection | [3;2] over ℚ | Projection gives [3], boundary valuation −1; swapped first two gives [1/3], value +1. | Retain. |
| 4.14 cyclic norm and P sign | All admissible pairs over 5,7,11,13 | Respectively 6/6,20/20,72/72,110/110 sums equal 2c. At 11, 2c has order 3; +2c on P would leave 4c≠0. | Retain −2c. |
| 4.15 corrected identity | All x≠0,1,−1 over 5,7,11,13 | Corrected equality: 2/2,4/4,8/8,10/10. Printed formula: 0/2,1/4,2/8,1/10. | Retain correction. |
| 4.15 permutation conjugation | P₁₂,P₃₄,P₁₃P₂₄ | det Γ=1; lower-right blocks diag(−1,1),diag(1,−1),swap; lower-left blocks all 0. Upper-right entries match (2,3)=1 and (1,4),(2,4)=1,−1. | Retain, including char 2. |
| 4.15 cyclic power-map headline | m=1,2,7; a=2,j=2 | H₃=0,C₂,C₇; multipliers 0,0,4. For m=7,j=1 multiplier is 2, not 4. | Retain positive-degree scope. |
| 4.15 different-order inclusion | C₂→C₄ | Odd H map sends 1↦2, order 2; erroneously squaring the index would send 1↦0 in degree three. | Retain. |
| 4.15 symmetric stability headline | (n,i)=(0,0),(2,1),(1,1) | First map ℤ≅ℤ; second C₂≅C₂; excluded third map 0→C₂ is not onto. | Retain 2i≤n. |
| 4.15 prime contributions | C₅ power 2; C₃ inversion | H₃ multipliers 4 and 1; 4−1=3 is a unit mod 5, so fixed part 0; 3-primary contribution can survive. | Retain. |
| 4.16 monomial indecomposables | 𝔽₂,𝔽₄ | π₃ind models C₁₂ and C₃⊕C₁₂; latter has exponent 12 and order 36, not C₃₆. | Retain nonsplit possibility. |
| 4.16 bottom unit and η³ | Sphere summand | Stable third stem C₂₄ maps after η³ quotient to C₁₂; element 12 is killed, element 1 survives. | Retain; supplier locators resolved. |
| 4.17 doubling | μ=C₂,C₅ | γδ sends 1↦0 and 1↦2; not an injection at 2. | Retain distinction from detector. |
| 4.17 Chern sign | Weights +1,−1; m=5,2 | (1+u)(1−u)=1−u²; coefficients −1=4 mod 5 and 1 mod 2. | Retain. |
| 4.18 closure detector | μ₅ in 𝔽̄₂ | Domain C₅, target Tor=C₅, normalized generator 1↦1; Frobenius both sides ×4. Ordinary μ⊗μ=0. | Retain. |
| 4.18 two-primary modulus | Torsion order 2 in modulus 8 | 2 divides 8; Chern coefficient −1=7 is a unit; no product at modulus 4 is required. | Retain. |
| 4.19 enhanced Tor model | μ=C₂,C₃ | Enhanced group C₄ in char 0 versus ordinary C₂; char 2 gives C₃ versus C₃. | Retain characteristic split. |
| 4.19 naturality versus abstract roots | C₅, automorphism a=2 | Tor acts ×4; unmarked root model acts ×2. | Retain warning on nonnatural identifications. |
| 4.20 Suslin exactness | ℚ | 0→C₄→C₂₄→C₆→0, injection 1↦6, kernel {0,6,12,18}. | Retain. |
| 4.20 splitting exclusion | Same sequence | Every lift of 1 is 1+6k; sixfold multiples are 6 or 18, never 0. | Retain nonsplit assertion. |
| 4.21 rational-function rigidity | 𝔽₄ and 𝔽₄(t) | μ=C₃ in both; K₃ind=C₁₅ in both; B=C₅ after the mixed comparison. | Retain proof order. |
| 4.21 residue compatibility | {u,v,t} | Parameter-last residue is {u,v}; degree-three comparison sign (−1)²=+1. | Retain. |
| 5.1 restriction/transfer | 𝔽₂⊂𝔽₄ | K₃ orders 3,15; restriction ×5, transfer reduction mod 3; tr∘res=×2 and res∘tr=×5. | Retain. |
| 5.1 norm-one multiplication | 𝔽₄/𝔽₂, ω²+ω+1=0 | Matrix [[0,1],[1,1]] has determinant 1 and trace 1=ω+ω⁻¹. | Retain. |
| 5.2 localized-SL₂ headline | q=2,3,4,5,7 | H₃ orders after inverting characteristic: 3,8,15,24,48 = q²−1. | Retain. |
| 5.2 integral-SL₂ headline | q=2,3,4,5,7,8,9,27 | Orders 6,24,30,120,48,126,240,2184; extra p exactly on listed exceptional q. | Retain. |
| 5.2 nonabelian stable elements | S₃, p=3, Sylow C₃ | Normalizer inversion acts ×1 on H₃(C₃)=C₃; stable H₃ part C₃. H⁰ restriction sends 1↦1. | Retain separate degree zero. |
| 5.2 quaternion periodicity | Q₈ | H₁=C₂², H₃=C₈; replacing by abelianization homology would lose the order-eight class. | Retain. |
| 5.3 stabilization | 𝔽₅ | Integral H₃ C₁₂₀→K₃ C₂₄ has kernel C₅; localization gives C₂₄≅C₂₄. | Retain. |
| 5.3 extension comparisons | 𝔽₂⊂𝔽₄; 𝔽₃⊂𝔽₉ | Localized target orders 15,80; subgroup images have orders 3,8, respectively. | Retain. |
| 5.4 refined boundary | 𝔽₅, nonsquare ε | λ₁[2]=0; λ₁[3]=(ε−1)²=2(1−ε)≠0; augmented R(2,3)=[4]=0. | Retain. |
| 5.4 refined cross-ratio | (0,∞,a,b) | Value ⟨a⟩[b/a]; at a=1 equals [b]; at nonsquare a the coefficient is ε, not 1. | Retain. |
| 5.4 finite comparison range | q=4, P¹ has 5 points | Augmented top degree 5; ordinary homology vanishes in degrees 1,2,3. Transitive C₅ orbit has 5 points, so complement is empty. | Retain general comparison, not βx,y in this case. |
| 5.4 d² and torus comparison | Square class a over 𝔽₅ | Four multiplicative coordinates product a⁻¹, same square class as a; determinant-one tensor coefficient −2. | Retain. |
| 5.4 refined coinvariants | Odd q, G_F=C₂ | I=ℤ(ε−1), I²=2I,I³=4I; I²/I³=C₂ and H₁(C₂,I²_sign)=0. | Retain. |
| 5.5 finite Bloch headline | q=4,5,7,11 | B orders 5,3,4,6; enhanced kernel orders 3,8,12,20; products 15,24,48,120 equal q²−1. | Retain. |
| 5.5 integral/localized kernels | q=4,5 | Integral kernels 30/5=6,120/3=40; localized kernels 15/5=3,24/3=8. | Retain. |
| 5.5 small exclusions | q=2,3 | Actual Suslin B=0,ℤ; extrapolated order formula would give 3,2. | Retain q≥4. |
| 5.6 odd Cartan quotient | (q,n)=(4,5),(5,3),(7,3) | First five groups C₅; second five C₃; excluded third has K₃/n=C₃ but B/n=0. | Retain gcd condition. |
| 5.6 basis independence | Change basis e↦eg | Multiplication matrices M↦g⁻¹Mg; trace u+u⁻¹ and determinant 1 unchanged. At u=1 and −1: I and −I. | Retain. |
| 5.7 arithmetic quotient | ℚ,ℚ(i) | C₄₈/C₂=C₂₄; (ℤ⊕C₂₄)/0=ℤ⊕C₂₄. | Retain. |
| 5.8 Rogers detector | 1/2,2,−1 | Values −π²/12,+π²/12,−π²/4; c value −π²/6. Sixfold value −π²=0 modulo π², twofold and threefold nonzero. | Retain. |
| 5.8 general RCF transfer | ℚ_alg∩ℝ,ℝ,ℚ | ∃x x²=2 gives true,true,false; ∃x x²+1=0 gives false,false,false, but true in ℂ. | Retain theorem; R01 ownership. |
| 5.8 parameter embeddings | Any ordered RCF extension, parameter a | x=a+1 gives x−a=1>0 in both fields; x²=t solvable iff t≥0. | Retain full parameters. |
| 5.8 certificate encoding | Empty pairs, k=0; ξ=[2]−[3] | Augmentation of ξ=0 but its two coefficients are +1,−1, so free-group equality is false in both RCFs. | Retain equality-pattern requirement. |
| 5.8 formally-real headline | ℚ and a non-Archimedean RCF | 6c=0; ρ or transferred finite-certificate obstruction excludes 2c=0 and 3c=0; order 6 in both. | Retain; no embedding into ℝ assumed. |
| 6.1 witness transport | R(2,3) under identity/embedding | Five coefficients remain (1,−1,1,−1,1); their argument equalities and zero quotient are preserved. | Retain. |
| 6.2 tensor coordinates | C₄⊕ℤ² | Torsion diagonal modulus 2, torsion/free modulus 4, free diagonals modulus 2, mixed free coordinate ℤ. | Retain integral bookkeeping. |
| 6.2 boundary certificate | ℚ, [2] and [2]+[−1] | Mixed v₂/sign coordinate 1 and 1+1=0 mod 2, respectively. | Retain accepts cycle, rejects symbol. |
| 6.3 root multiple | Primitive sixth root ζ | 1−ζ=ζ⁻¹; ∂[ζ]=−ζ⊗ζ is nonzero C₂ diagonal; ∂(2[ζ])=0. | Retain. |
| 6.3 dependence on −1 square | ℚ(√−3),ℂ | (−1)∧(−1) nonzero in the former, zero in the latter since −1=i². | Retain exact condition. |
| 6.4 invertible denominators | Mod 5, m=2 or 4 | 2⁻¹=3 and 4⁻¹=4; (4·symbol)/4= symbol, (2·symbol)/2=symbol. | Retain unit hypothesis. |
| 6.4 nonflat scalar change | 2ℤ↪ℤ, tensor C₂ | Source becomes C₂, target C₂, induced map ×2=0; injectivity is lost. | Retain no flatness shortcut. |
| 6.5 fibres | C₂₄→C₆ over 1 | Fibre {1,7,13,19}; C₄ action adds 6 transitively/freely; multiplying lifts by 6 gives 6,18,6,18. | Retain no canonical additive section. |
| 6.5 bar witness boundary | Trivial group, z=[1,1,1] | z=d₄[1,1,1,1], ev(z)=0; zero witness works for z−z=0. | Retain actual chains. |
| 6.6 mixed field square | 𝔽₄→𝔽₄(t)→𝔽₄(t)(s) | Both routes send [ω]↦[ω] and [ω²]↦4[ω] in C₅. Reciprocal sends 1↦4, unequal. | Retain map-sensitive comparison. |
| 6.6 snake sequence | C₄→C₂₄→C₆, n=2 | T[2]=C₂→K[2]=C₂ is iso; K[2]→B[2] is 0; B[2]→T/2 is iso; K/2→B/2 is iso. | Retain full six-term sequence. |
| 6.6 rationalization | ℚ,ℚ(i) | T̃⊗ℚ=0; K₃ind⊗ℚ and B⊗ℚ have dimensions 0,1. | Retain. |
| 6.6 odd/root hypothesis | 𝔽₇,n=3; ℚ,n=5 | First: T̃/3=C₃, K₃/3=C₃, B/3=0. Second: all ordinary quotients 0. | Retain hypothesis. |
| 6.7 true coefficients | ℚ,n=5 | K₃/5=0; 5{2,−31}={32,−31}=0; residue 2 has powers 2,4,8,16,1 mod 31, hence exact order 5. | Retain nonzero K₂[5] extension. |
| 6.7 degree-two correction | ℝ,n=2 | K₂(;C₂)=C₄; c₂(2β)=1 in C₂ but 2c₂(β)=0. | Retain degree distinction. |
| 6.7 coefficient boundaries | n=1; characteristic p with n=p | n=1 gives 0 on both sides; n=p is excluded by invertibility, not silently evaluated as étale μ_p. | Retain. |

| 4.13 distinct versus normalized tuples | X={a,b} | Injective C₂=0; normalized all-tuple degree two has basis (a,b,a),(b,a,b), rank 2. | Retain precyclic formulation; source error not copied. |
| 4.13 omitted-last-face finite control | |X|=3,4 | dᵃ preserves the last entry; each summand is an augmented word complex on 2 or 3 letters. Top ranks are 3·1=3 and 4·2=8. | Retain infinity hypothesis. |
| R01 ownership agreement | Two plan slugs versus README contracts | Plan count 2; matching README gap slugs 0; locally constructed results 2. | Repair bookkeeping; mathematical controls above unchanged. |
| R02 locator agreement | weibel lines 91,215 versus 28137,28266,28322 | Old references hit 0 of 2 claimed results; corrected references hit both results (K₄ divisibility and weight-two torsion). | Replace the two line references. |
| Source cyclotomic-image control | Ω=F̄₂, μ₇ | Frobenius powers are 1,2,4 modulo 7; full units are 1,2,3,4,5,6. Inversion 6 is absent from the image. | Roadmap uses actual automorphisms, not the source's surjectivity assertion. |
| Source order control | p=3,m=2,n=9,q=17 | q+1=18; primitive-root class has order 9, not 3; q≡−1 mod 9. | Roadmap keeps actual homology and root order. |

### Shape and definition checks

The six layers have Examples and Dependencies endings. Definitions of symbols, tensor targets, kernels, projective configurations, comparison maps, root multiples and fibres retain API statements and at least three discriminating controls in their sections; the table records the nontrivial controls rather than merely counting bullets. Definitions on general fields exclude division by zero through admissibility; the finite/real theorems carry their separate hypotheses. Source passages are paraphrased, and the acceptance file has one `import Mathlib`, one module docstring, the prescribed namespace and layer order, theorem docstrings, no option override and no sorry-defined data. The two bad extraction-line references are R02; their theorem-number locators still point to the right mathematics.

## Not verifiable

- **suslin-1984** is waived. In particular, Corollary 1.8 and Theorem 1.9, p.191, and Theorem 3.4, pp.196–198, were not certified against unavailable primary text. The displayed hypotheses, finite controls, suppliers and dependent proof order were reviewed.
- **suslin-1991** is waived. This includes the primary Rogers descent, rank-three and monomial arguments, and root detector. Available K-book, Mirzaii and Hutchinson text was read, with direct computations of the displayed chain and sign identities; this is not a claim to have inspected the waived paper.
- **bloch**, Lecture 6, is waived. Its full-tensor convention is retained by its locator; the roadmap's explicitly defined raw kernel and comparison were tested independently.
- No new unreadable source was needed. The supplied legal source cache and the existing manifest's certified/waived entries were used; the manifest was not edited and no renewed request was made for a settled text. Ownership was checked against main, board packages and the available open-head material, not against hypothetical unpublished work.

## Source issues

These are defects in the consulted sources, not additional findings against the roadmap where it already corrects them. Source line numbers identify the cached text; printed-page locators are retained for the errata register.

- **Error** in weibel at Example III.7.2(b), printed p.245: the source says algebraically closed-field Milnor K-groups are uniquely divisible without a degree restriction; it should restrict to degrees at least two, since K₀ is ℤ and K₁ has root torsion; affects a stated result.
- **Error** in weibel at the preamble to Definition VI.1.7, printed p.468 (weibel line 28314): the source says algebraic-closure automorphisms in characteristic p surject onto all automorphisms of the root group; it should use the cyclotomic image generated topologically by Frobenius, which for p=2 acts modulo seven through {1,2,4}; affects a stated result.
- **Error** in weibel at VI.5.4(c), printed p.488: the source says inversion symbols define a homomorphism into B(F); it should be into P(F), with boundary x∧(−x) possibly nonzero; affects a stated result.
- **Misprint** in weibel at Corollary VI.5.4.1, printed p.489: the source says adjoining a cube root of −1 forces 2c=0; it should specify a root of t²−t+1, excluding the ever-present root −1; affects a stated result.
- **Error** in weibel at Lemma VI.5.6's proof, printed p.490, and the rank-three presentation, p.493 (weibel lines 29747 and 29947): the source says the generic configuration modules are free over the integral GL group ring; it should use permutation modules induced from the scalar stabilizer, or the corresponding projective group; affects the proof.
- **Error** in weibel at Remark VI.5.6.1, printed p.490 (weibel line 29764): the source says P¹(F₂) has seven points and gives finite-field acyclicity through degree three without a size restriction; it should give three points and require q≥4 for vanishing of ordinary homology in degrees one through three; affects the proof.
- **Error** in weibel at Theorem VI.5.7, printed p.490: the source says the H₂(GL₂) formula holds for all fields; it should require an infinite field for this statement, since F₄ gives C₂ versus 0; affects a stated result.
- **Misprint** in weibel at the paragraph after Theorem VI.5.7, printed p.490 (weibel line 29783): the source says the pre-Bloch homology is the first-page term E¹₃,₀; it should be E²₃,₀, after taking the homology of the coinvariant row; affects the proof.
- **Misprint** in weibel at the rank-two spectral-sequence stabilizers, printed p.490 (weibel line 29790): the source says the triple stabilizer is diag(a,a⁻¹); it should be diag(a,a), since diag(2,1/2) sends the coordinate 1 to 1/4; affects the proof.
- **Misprint** in weibel at the definition preceding Lemma VI.5.10, printed p.493: the source says ψ′([a;x]) is the field element a; it should be the pre-Bloch symbol [a]; affects a stated result.
- **Error** in weibel at the definition preceding Lemma VI.5.10, printed p.493: the source says ψ′(P)=2c with the displayed cone differential; it should be −2c, since the five rotations sum to 2c; affects a stated result.
- **Error** in weibel at Exercise VI.5.5, printed p.500: the source says the second identity uses [−x²] and [1/x²]; it should use [−x⁻¹] and [(1−x)⁻²], respectively; affects a stated result.
- **Error** in weibel at Exercise VI.5.6(a), printed p.500 (weibel lines 30491–30498): the source says normalizing the simplicial group on all tuples gives the pairwise-distinct-tuple complex; it should distinguish normalization, which retains (a,b,a), from injective configurations, which only form a precyclic object here; affects a stated result.
- **Error** in weibel at the proof of Lemma VI.5.18, printed p.498: the source says inversion coinvariants of H₃(μ) are μ/{±1}; it should retain H₃(μ), since inversion acts by (−1)²=1; affects the proof.
- **Misprint** in weibel at the proof of Corollary VI.5.20, printed p.499 (weibel lines 30428 and 30434): the source says the claimed injection and root-plus-C₁₂ isomorphism concern π₃(BM⁺); it should use its indecomposable quotient, as in the proposition and corollary being proved; affects the proof.
- **Error** in cgz2021 at arXiv v3 Definition 1.1, printed p.2: the source says all permitted projective relations lie in the ordinary exterior-boundary kernel; it should intersect with the kernel or change the tensor target; affects a stated result; corrected in print at Definition 2.1, p.391.
- **Error** in cgz2021 at arXiv v3 Lemma 2.2, printed p.9: the source says inversion symbols themselves generate the Bloch-kernel subgroup; it should intersect their subgroup with the relevant boundary kernel; affects a stated result.
- **Error** in cgz2021 at published Lemma 2.2, printed p.391: the source says the comparison is surjective with 2-torsion kernel for an unrestricted field; it should exclude F₂ and F₃: their comparison has respectively nonzero cokernel and infinite kernel; affects a stated result.
- **Error** in cgz2021 at published §4.2, printed p.406: the source says integral H₃(SL₂(Fq)) has order q²−1; it should use characteristic-localized homology, since q=5 has integral order 120; affects a stated result.
- **Error** in cgz2021 at published §4.2, printed p.406: the source says C¹ canonically identifies with its third integral homology; it should retain the homology carrier or a marking, since inversion acts by −1 on C₃ but +1 on H₃(C₃); affects a stated result.
- **Misprint** in cgz2021 at published §4.2, printed p.406 (cgz2021 published line 1209): the source says the nonsplit Cartan equals Aut_Fq(Fq²); it should be the subgroup of linear automorphisms given by multiplication by nonzero elements, not the field automorphism group; affects a stated result.
- **Misprint** in cgz2021 at published §4.2, printed p.406 (cgz2021 published line 1217): the source says a primitive n-th root supplies a class of order p when n=p^m; it should say order n; for p=3,m=2,q=17 the class has order nine; affects a stated result.
- **Misprint** in hutchinson2013 at the proof of Corollary 3.13, printed p.17: the source says a nonzero fixed vector exists precisely when 1 is not an eigenvalue; it should say when 1 is an eigenvalue; affects the proof.
- **Gap** in marker at the end of Theorem 3.5's proof, printed p.25: the source says to take the midpoint after allowing infinite interval endpoints; it should separately choose a finite interior point in each unbounded case; affects the proof.
