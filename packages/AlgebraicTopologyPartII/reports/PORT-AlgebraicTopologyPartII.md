# PORT-AlgebraicTopologyPartII

Branch: `roadmap/algebraic-topology-part-ii`.
Head: `1b3853b358d4ed7778a8cb8635cd77fba05c8105`.
Commit message: `AlgebraicTopologyPartII: roadmap (README, Suggested.lean, metadata)`.

The clean starting revision was `f52d972`. The commit adds only `TauCetiRoadmap/AlgebraicTopologyPartII/README.md`, `TauCetiRoadmap/AlgebraicTopologyPartII/Suggested.lean` and `TauCetiRoadmap/AlgebraicTopologyPartII/metadata.toml`. The source package and its accepted decisions were retained. The worktree is clean. Nothing was pushed and no GitHub write was performed.

## Validation

The prescribed module build exited 0. Exact outcome line:

```text
Build completed successfully (8960 jobs).
```

Warning count: **7**, all `declaration uses sorry`, at Suggested.lean lines 69, 108, 165, 174, 189, 215 and 231. There are no other warnings. The first build exposed an additional module-system import warning; adopting the pinned module header, public imports and exposed public section eliminated it. Import modules remain exactly Mathlib, TauCeti.Topology.WedgeSum, TauCeti.AlgebraicTopology.Cohomology.Basic and TauCeti.GroupTheory.Perm.Partition.

Exact final push-gate summary:

```text
gate AlgebraicTopologyPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Every content check passed before committing; the gate's clean-worktree check required the commit. The complete gate then exited 0 on that commit. `git diff --check` passed. Citation resolution reported no missing cross-roadmap citation or roadmap Lean name; its library-name disclaimer was addressed by direct searches of the pinned source trees.

Exact dependency-check output:

```text
depcheck: 160 roadmaps, 1116 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was emitted. Neither the tooling nor the merge order was edited.

## Draft pull request body

Extend AlgebraicTopology with configuration-space cohomology and arithmetic traces, stable configuration diagonals, rational homotopy and double-loop Betti formulas for sphere bouquets, and equivariant topology of real loci and ramified covers. The library connects configuration and mapping-space calculations with canonical support splittings, corrected localization duality, affine restriction, and the integral trace-lifting and circle-obstruction results used in real cycle-class and surface period-index applications.

AI-assisted port and mathematical verification by Codex (GPT-6).

## Dependencies still in pull requests

- StableHomotopyKTheory: §§3.36–3.37 and §4.6.
- MotivesAndAlgebraicCycles: §§7.6a–7.6b.
- EtaleDualityAndPerverseSheaves: §§3.5–3.7 and §4.7.
- ComplexComparisonPartII: §C−1.1.
- InverseGaloisAndArithmeticFundamentalGroups: §§IG.0.T2–IG.0.T4 and §IG.5.1.
- SmoothBundlesConnections: §B1 item 5.
- TangentialBordism: §B4 item 3.

QWittVectors §1.4a is an additional open-roadmap ownership citation: its big Witt coordinates are distinguished from this roadmap's integer Euler exponents; its theory is not an input to their construction. CharacteristicClasses and the other named active or completed suppliers were checked on main, rather than using pull requests that revise those roadmaps.

## Accepted notes and final mathematical fixes

1. The accepted filtered-colimit note is satisfied by SchemeAndStackFoundations §2.5 / cohomology_filtered_colimits, checked at its finite-cover, finite Čech-product and terminal-object hypotheses. The package already contained that correction in its contract, §§11.1 and 11.5 and Layer 11 Dependencies. Scope and ownership now states the generic owner explicitly, and §11.1 presents the finite-cover statement as an application. Equivariant and pair comparisons retain the finite-rank resolution and extension-by-zero arguments. The circle colimit gives ℚ₂/ℤ₂; the fixed-point sign colimit is 0.
2. The package already used the upper compact-support bound in §3.5. The port makes the equivalence explicit: m(n−1)−j>2m iff m(n−3)>j. At (n,m,j)=(4,2,1), the compact degree is 5>4 even though the lower bound 3≤5 holds; the term is zero. The non-strict truncation hypothesis remains unchanged.
3. Deleted the stale clause referring to a nonexistent local Layer 0. The named scheme suppliers remain.
4. In §4.2, distinguished z from z^k with k≥2: the derivative of z is 1 and its critical-value set is empty, whereas z² has critical-value set {0}. Fibre cardinalities and Milnor numbers are unchanged.
5. In §5.3, restricted the deduction from the tame-fibre theorem to n≥1. At n=0 the actual Fermat fibre is empty, and the tame theorem's natural sphere index cannot describe it. The all-n Pham retraction remains intact.
6. In §14.3, made the cone shift explicit: the local sign object is Cone(ℤ —2→ ℤ)[−1], with H¹=ℤ/2. The unshifted cone has H⁰=ℤ/2 and would give the wrong degree.
7. In §4.6, made the connected, nilpotent, finite-rational-type CW models of the bouquet loop spaces explicit proof targets; §5.1 now names both those hypotheses and §4.5's rational ranks in Needs. The tame-polynomial alternative in §5.3 also names §4.2.
8. Corrected trace ownership: EtaleDualityAndPerverseSheaves §6.5 explicitly imports the arithmetically descended finite/rational trace formula from InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T4. The contracts and Layer 2 now cite that actual owner. Restricted the Betti comparison citation to §§3.5–3.7; §3.8 concerns nonarchimedean analytic smooth traces.
9. Expanded the inverse-coordinate action's API and Checks, and the supplier Checks for fixed-locus coordinates, Gysin normalization, finite Borel approximation, Ext stalks and Steenrod-conjugated pushforward. These distinguish inverse action from trivial action, descended sign coefficients from constants, and real from complex degree shifts.

The full README was read again after porting. The numerical endpoints, coefficient/parity restrictions, empty loci, zero rings, one-variable fibres, negative-degree windows and nontrivial cover actions were compared with the signatures and Checks. All 16 layers retain Examples and Dependencies; 55 local numbered subsections remain after the three supplier consolidations below.

## Lean retention and elaborated signatures

Nothing moved from Lean to README: the package's seven headline theorems and fourteen necessary definitions/abbreviations were retained. No API lemma, admitted example, sorry-valued data or set_option was added. The only Lean changes are the module-system header and visibility/import qualifiers required to obtain only sorry warnings at the pins.

A scratch file containing #check @name for **all 21 declarations** was elaborated and each printed type compared with its README statement. After the module-header change, the probe was elaborated again: the entire printed signature output is byte-for-byte identical. No hypothesis, binder, universe restriction or statement changed. The finite-field theorem retains Field and Fintype; the tame theorem retains n≥1 and tameness; the rational/Betti theorems retain actual homotopy equivalences and arbitrary chosen base points; the factor retains n≥4 and r>0; the Pham theorem retains every positive exponent; the simple-connectivity theorem retains n≥5. No standing section binder silently disappeared.

All 21 Lean names occur in the README. The source package has seven sorry theorems, not the four mentioned by an older report; the port follows the actual accepted package files. Compact-support representation formulas, finite joins, full Hilton maps, general graded H-space algebra, semialgebraic supports/operations and smooth transport remain honestly identified as not statable on their required carriers.

## Supplier replacements and duplication removals

The following consolidation changes are recorded in README Scope and ownership. Full statements, hypotheses, locators and Checks remain in Exact supplier contracts, without local target stubs.

- Finite Borel approximation: consumed from MotivesAndAlgebraicCycles §7.6b, rather than repeated as local §8.5.
- All-degree Steenrod-conjugated real pushforward: consumed from MotivesAndAlgebraicCycles §7.6b, rather than repeated as local §12.2.
- Finite-group internal Ext-stalk comparison: SchemeAndStackFoundations §2.23, with semialgebraic specialization in MotivesAndAlgebraicCycles §7.6a, rather than repeated as local §14.4. The periodic comparison and regular-module calculation remain in its supplier contract; the circle target cites that contract.
- Generic coefficient-colimit cohomology: SchemeAndStackFoundations §2.5. Only its semialgebraic/equivariant/pair application is retained here.
- Descended Frobenius traces: InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T4 replaces the indirect EtaleDualityAndPerverseSheaves §6.5 citation.

The package's native replacements are preserved: full root-factor cycle types use TauCeti.FiniteField.fullCycleType_eq_map_natDegree_normalizedFactors and Equiv.Perm.fullCycleType; character tensor/averaging use Representation.char_tensor and Representation.card_inv_mul_sum_char_eq_finrank; loop shifts, wedges, cohomology, periodic cyclic complexes and Artinian decomposition use the pinned carriers. No duplicate of these is declared in Suggested.lean.

Object searches covered every indexed main/open roadmap through roadmaps grep, the worktree's active/completed folders, the board packages and the supplied sibling checkouts. Searches included configurations/discriminant torsors, arrangement purity, basic Whitehead products/Hilton, rational spheres/bouquets, double loops, Euler/Witt transforms, Pham/Fermat, semialgebraic sites/duality, finite Borel approximation, Ext stalks, support splittings, Steenrod/Wu, trace quotients and transport. The final resolver used main f52d972 and the index of 384 open heads. Supplier sections were read, not inferred from search hits. No additional open pull requests were sought outside the supplied roadmap service and checkouts.

This roadmap owns the new rational bouquet/loop calculations, the Pham retraction, the additional support/self-intersection formulas, and the integral cover chases because the searched ordinary, stable, motivic and geometric owners do not state them. Generic Whitehead-product maps used in the Hilton construction are built here as part of §4.3, rather than importing a later homotopy-sphere development. The singular-affine and real-closed extension in §11.1 exceeds AffineMorseLefschetz's smooth real-field CW theorem; triangulation and generic semialgebraic cohomology retain their earlier owners. No fully qualified declaration name of another readable roadmap is reused.

## Pinned-source evidence

Pins: Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2; Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a. Both checked-out package HEADs equal the manifest. No pin file was edited.

| Source id and repository-relative source | Evidence read |
|---|---|
| MATHLIB-HOMOTOPY — Mathlib/Topology/Homotopy/HomotopyGroup.lean | MATHLIB-HOMOTOPY line 97: GenLoop is `{p | ∀ y ∈ Cube.boundary N, p y = x}` on continuous cubical maps. It asserts no CW or separation hypothesis. |
| MATHLIB-SIMPLY — Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean | MATHLIB-SIMPLY line 44: equiv_unit is Nonempty of a groupoid equivalence; the following theorem includes Nonempty X and uniqueness of path homotopy classes. |
| TC-WEDGE — TauCeti/Topology/WedgeSum.lean | TC-WEDGE line 72: `Quotient (Setoid.ker (wedgeNormalize x))`; the extra Unit summand supplies the empty wedge point; base and quotient topology follow. |
| TC-COH — TauCeti/AlgebraicTopology/Cohomology/Basic.lean | TC-COH lines 94 and 101: cohomology is homology of the native cochain complex; the induced map reverses the continuous map. |
| TC-REL — TauCeti/AlgebraicTopology/Cohomology/Relative.lean | TC-REL line 114: native pair cohomology; the module supplies its connecting morphism and three exactness statements. |
| TC-CYCLES — TauCeti/GroupTheory/Perm/Partition.lean | TC-CYCLES line 96: fullCycleType adds a part 1 for each fixed point. |
| TC-ROOTS — TauCeti/FieldTheory/GaloisGroups/FrobeniusOrbits.lean | TC-ROOTS line 106: squarefree polynomial, splitting/algebraic extension and q-power permutation give normalized-factor degrees. |
| TC-SEMIALG — TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean | TC-SEMIALG lines 63–72: independent CommRing and LinearOrder assumptions; generated Boolean algebra of zero and positivity sets. No topology, real-closedness or dimension condition. |
| TC-LOOPS — TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean | TC-LOOPS lines 210, 264 and 321: component and loop-shift equivalences, with constant-loop base points. |
| MATHLIB-CHAR — Mathlib/RepresentationTheory/Character.lean | MATHLIB-CHAR lines 68 and 113: tensor characters and invariant averaging; finite dimensionality and invertible group order retained. |
| MATHLIB-MOEBIUS — Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean | MATHLIB-MOEBIUS line 206: divisor inversion is restricted to positive indices. |
| MATHLIB-BINOMIAL — Mathlib/RingTheory/PowerSeries/Binomial.lean | MATHLIB-BINOMIAL line 47: binomialSeries expands (1+X)^r; the chosen substitution gives precisely 1−(−t)^a. |
| MATHLIB-EIGEN — Mathlib/LinearAlgebra/Eigenspace/Basic.lean | MATHLIB-EIGEN line 556: maximal generalized eigenspace is the union of kernels of powers, retaining nilpotents. |
| MATHLIB-ARTIN-MODULE — Mathlib/RingTheory/Artinian/Module.lean | MATHLIB-ARTIN-MODULE line 616: quotients by sufficiently high nilradical powers give the local-factor product. |
| MATHLIB-ARTIN-RING — Mathlib/RingTheory/Artinian/Ring.lean | MATHLIB-ARTIN-RING line 63: nilpotence of the nilradical under CommRing and IsArtinianRing. |
| MATHLIB-CYCLIC — Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean | MATHLIB-CYCLIC lines 58, 80 and 113: native periodic model, positive even and odd cohomology, with generator/generation hypotheses. |
| MATHLIB-LMUL — Mathlib/Algebra/Algebra/Bilinear.lean | MATHLIB-LMUL line 143: multiplication is the algebra map to linear endomorphisms used for the critical-value operator. |
| MATHLIB-SHEAF — Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean | MATHLIB-SHEAF line 56: CategoryTheory.Sheaf.H is the actual site-cohomology carrier. |

Missing-carrier searches distinguished abstract simplicial joins from topological finite joins, and quadratic-form Stiefel–Whitney classes from tangent-bundle classes. Mathlib's native submersion predicate does not provide the supplier's regular-level manifold and smooth fibre-trivialization package. No missing headline was forced through a Prop field or arbitrary scalar surrogate.

## Source and remaining contract limitations

The package's 14 explicit supplier-contract gaps are retained without asserting that the suppliers already state their precise extensions: configuration-carrier-generality, configuration-cover-comparison, finite-group-borel-approximation, finite-group-ext-stalk, rational-commutative-hspace-hopf, real-closed-semialgebraic-geometry, semialgebraic-duality-coefficients, semialgebraic-equivariant-sites, semialgebraic-ext-stalk, semialgebraic-fixed-point-trace, semialgebraic-free-quotient-geometry, semialgebraic-support-dimension, steenrod-conjugated-real-pushforward and supported-steenrod-comparison. They are implementation contracts at earlier owners, not unresolved port edits. The existing uncertified HILTON, DIMCA, BRUMFIEL, SCHEIDERER and BCR locators and waived KRASNOV locator remain explicit.

Source passages for BS's rank/product proof, BW's near-top proof, B19's lift/circle proof and EP's exceptional adjunction were opened. PHAM's legal text was read at the simplex/retraction construction. The new degree and critical-point corrections are direct calculations. GM's author PDF could not be reopened in this run (HTTP 403 / browser size limit), and the downloaded BROUGHTON scan had no usable theorem text in its extraction; their accepted source certification and locators were retained rather than reclassified. A broad Mathlib/Zulip web search did not identify an applicable competing API; this is not claimed as an exhaustive search of those services.

Untrusted-text handling: generic repository examples instructing `lake exe cache get` and bare `lake build`, and guidance to “register and claim it” through issues, were outside this job's allowed commands or GitHub-write scope and were not followed. No source text was treated as an instruction, no credentials were read, no fetched code was run, and no external message was sent.

## Adversarial mathematics pass

Each row records a statement or definition and explicit values. The rows cover the numbered targets, every acceptance definition, supplier specializations, conventions and additional proof inputs. API naturality, inverse and zero laws were evaluated on the same displayed objects. These checks test statements; they are not proofs of the admitted theorems.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Universe and finite indexing convention | Fin 0 and Fin 1 | Empty functions into ℂ: 1; permutations: 1; 0!=1. Single-coordinate configurations: ℂ | Compatible small carriers | None |
| Left permutation convention | σ=(123),τ=(12), distinct a,b,c | σ(τx)=(c,b,a)=(στ)x; τ(σx)=(a,c,b) | Multiplication order distinguished | Added separate API and three Checks |
| Parity ε_n,s_n | n=0,1,2,3 | ε=(1,0,1,0), s=(−1,1,−1,1); period two | No truncated subtraction in parity | None |
| Integer cohomological degrees | m=2,n=4,j=1 | Compact degree 5; ordinary dual degree −1; both groups zero | Natural subtraction must not produce H⁰ | Existing guarded Lean summand retained |
| Geometric Frobenius convention | 𝔾_m/𝔽₂ | Ordinary weights 1,2; compact weights 1,2; alternating trace −1+2=1=2−1; arithmetic weight on ℚ₂(−1) would be 1/2 | Direction fixed | None |
| Pair versus supported cohomology | Spec R and Spec C/R | Fixed point: pair=0, supported H²=𝔽₂; free orbit: pair H⁰=ℤ, real cohomology=0 | Distinct constructions | None |
| Orientation and Gysin shifts | Conjugation on ℂ,ℂ²; pt→ℙ¹ | Real determinants −1,+1; complex shift 2, real shift 1; complex source twist −1 | Same convention in suppliers and consumers | None |
| Cyclic differential convention | q=0,1,2,3 | Comparison scalars 1,−1,−1,1; (−1)(σ−1)=1−σ at q=0 | Chain directions agree | None |
| Coefficient twists and contragredient | Sign lattice; double sign; dual of sign lattice | σ(1)=−1; double twist +1; dual action h↦−h; complex line orientation −1 | Tensor and dual actions agree | None |
| Formal local finiteness | n=4,r=1,2; degree j=2 | First possible factor degrees 1,3; r=2 contributes 0 to degree 2 | Finite products represent infinite coefficients | None |
| Native GenLoop and simply connected convention | X=pt and X=S³ | Ω²pt has one component, π₁=0; Ω²S³ has one component, π₁=ℤ | Nonemptiness/path-connectedness retained; latter is not simply connected | None |
| Native semialgebraic predicate | Polynomial x with usual/reversed orders on ℤ | Strict positivity set x>0 / x<0; zero set remains {0} | Native predicate alone does not assert ordered-ring compatibility | None |
| Configuration carriers and orderedConfiguration | m=0,1,2; empty X; tuples (0,1),(0,0) | Empty tuple: 1; PConf₁(ℂ)=ℂ; (0,1) accepted and (0,0) rejected; PConf₂(pt)=∅ | Injectivity and unit differences separated | None |
| configurationPermutation | Empty tuple and swap on two coordinates | Unique tuple fixed; (0,1)↦(1,0)↦(0,1); inverse composite=id | Actual continuous maps | API/Checks expanded |
| Algebraic configuration functor | ℤ,𝔽₂,zero ring | Difference of (0,2) nonunit; difference of (0,1) unit; zero ring has one coefficient tuple since 0=1 | Ring-valued points differ from injective underlying tuples | None |
| Configuration torsor | m=0,1,2; q=2 | Degrees 1,1,2; T²+T has roots 0,1 although 2!=0 | All-characteristic torsor | None |
| Plane/interior-disc map | z=0,1; boundary w=1 | Forward values 0,1/2; inverse 0,1; at boundary inverse denominator 0 | Open disc essential | None |
| Arrangement purity §2.1 | Empty arrangement in A¹; PConf₂ | Ordinary ranks (1,0,…)/(1,1,0,…); compact PConf₂ ranks 1 at degrees 3,4; weights q,q² on those compact degrees | Degree and weight ranges agree | None |
| Full Frobenius cycle supplier | T²+T, T²+T+1,1,T² over 𝔽₂ | Full partitions (1,1),(2),empty; repeated T² has one geometric root versus two multiplicity factors | Squarefree hypothesis essential | Supplied theorem retained without restatement |
| Tensor-character suppliers | C₂ regular representation, tensor square | Characters (2,0),(4,0); averages 1,2 equal invariant dimensions | Native averaging suffices | None |
| Signed tensor character §2.3 | N=2; identity,transposition,3-cycle; m=N=0 | Traces 4,2s_n at m=2; at m=3 identity 8 and 3-cycle 2; empty tensor 0⁰=1 | Full cycle count and sign fixed | None |
| configurationTraceFormula / §2.4 | q=2,3,5; class indicators m≤3 | q=2 counts 1,2,2,4; at q=3,m=3 classes 111,21,3 give 1,9,8, sum 18; RHS character averages give these same values | 21 class-indicator equalities passed | None |
| Trace formula sign character | m=2, any q | Split and irreducible counts both (q²−q)/2; difference 0; ordinary H⁰,H¹ sign multiplicities both 0 | Works for nontrivial class functions | None |
| Integral Euler factorization §3.1 | N=0,1; both parities | N=0: all exponents 0, product 1; even n,N=1: e₁=−1 gives 1−T; odd n,N=1: e₁=1,e₂=−1 gives (1−T²)/(1−T)=1+T | Unique coefficient recursion distinguishes signs | None |
| eulerExponent and Möbius formula §3.2 | N=2,r=1,2,3; r=0 | Even numerators −2,−2,−6 / divisors 1,2,3 give −2,−1,−2; odd numerators 2,−6,6 give 2,−3,2; total r=0 gives 0/0=0 | Divisibility asserted only at positive r | None |
| Weighted squarefree product §3.3 | q=2,c=1,−1,0 | c=1 coefficients through degree 3: 1,2,2,4; c=−1: 1,−2,0,0; c=0: 1,0,0,0 on both products | Constant polynomial retains weight 0⁰=1 | None |
| Twisted multiplicities §3.4 | m=1; m=2,N=2 | m=1 compact H² multiplicity N=s_n·s_nN; m=2 compact H³,H⁴ characters trivial, exterior dimensions 1,1 for even n and symmetric dimensions 3,3 for odd n | Signed extraction gives nonnegative dimensions | None |
| Stable diagonal §3.5 / stableConfigurationDiagonal | (n,N,j,d)=(4,1,1,1),(5,1,2,1),(4,2,2,2) | Both sides 1,1,1; last average (4−2)/2=1; opposite sign gives 3 | 60 low-degree diagonal equalities passed | None |
| Diagonal truncation boundary | n=4,m=2,j=1; n=4,N=1,j=1,d=0 | Compact degree 5>4 gives 0; lower bound 3≤5 does not exclude it. With d=0, diagonal 0 versus coefficient 1 | Upper support bound required; d(n−3)≥j sharp in this example | Made the exact inequality equivalence explicit |
| doubleLoopFactor | n=4,N=2,r=1,2,3; n=5,N=1 | Factors (1+t)²,1+t³,(1+t⁵)²; at n=5 first factors (1−t²)⁻¹,1+t⁵ | Binomial substitution sign matches 1−(−t)^a | None |
| Tameness §4.1 / IsTame | f=z; f=x²y−x; constant in n≥1 | Linear gradient norm 1; along (t,1/(2t)) second gradient norm t²→0; constant critical locus ℂⁿ noncompact | Linear tame; latter two not tame | None |
| Leading homogeneous gradient bound | f=∑z_i² and f=x² in two variables | First gradient norm 2‖z‖; second gradient zero along (0,t) | Projective smoothness/isolated leading gradient matters | None |
| jacobianAlgebra | f=x³+y³−1; f=x | Bases 1,x,y,xy give dimension 4; derivative 1 gives zero quotient dimension 0 | Local algebra retains multiplicities | None |
| milnorNumber | Same two f; constant polynomial in two variables | μ=4,0; infinite-dimensional constant Jacobian has native finrank 0 | Finrank zero alone cannot express finiteness | Explicit finite-dimensional conclusion retained |
| fiberMilnorNumber | f=x³+y³−1; ℂ[t]/t³ with multiplier t² | Multiplication by f=−1: μ⁻¹=4,μ⁰=0; generalized zero-eigenspace of t² has dimension 3, kernel/quotient dimension 2 | Generalized rather than ordinary eigenspace essential | None |
| polynomialFiber | f=x in n variables; shift f−a | Both equations x=a and (x−a)=0 give ℂⁿ⁻¹ | Evaluation and translated level agree | None |
| Tame bouquet §4.2 / tameFibreBouquet | f=x³−3x+y²; f=z³; linear f | Cubic plane μ=2, critical μᵃ=1, regular μ⁰=0: bouquet counts 1,2. One-variable z³: μ=2, regular fibre 3 points=∨₂S⁰; critical fibre pt=∨₀S⁰. Linear fibre pt for n=1 | Includes singular fibres and n=1 | None |
| Tame zero-variable exclusion | n=0,f=c,a≠c | Ambient pt; tame; J=ℂ,μ=1,μᵃ=0; actual fibre ∅ versus truncated-index bouquet S⁰ with 2 points | n≥1 is necessary | Made the Fermat deduction's n≥1 explicit |
| sphereBouquet / §4.3 carrier | N=0,1,2 | Point; original sphere; two S² give H² rank 2 versus rank 0 for their smash S⁴ | Wedge point and carrier fixed | None |
| Hilton decomposition §4.3 | N=2,n=3,weights 1,2,3 | Basic-word counts 2,1,2; dimensions 2,3,4; rational π₃ rank 2 sphere Hopf classes +1 bracket=3 | Basic words differ from a smash model | None |
| unitSphere / §4.4 carrier | s=0,1 | Radius-one sphere in ℝ has points −1,+1; in ℝ² (1,0) accepted,(0,0) rejected | Ambient dimension s+1 and sphere, not ball | None |
| Rational spheres §4.4 | S²,S³,S⁴ | Ranks 1 at (2,3), at 3, and at (4,7), respectively; other rational degrees 0 | Even-sphere extra class retained | None |
| rationalBouquetRanks / §4.5 | n=3..8,N=0..4,i=2..22 | N=2,n=3 first ranks 2,3,2; N=0 all 0; N=1 gives sphere ranks | 630 Hilton/Euler equalities passed | None |
| Double-loop H-space model §4.6 | X=pt,S²,S³,S⁴ | Positive generators none / disconnected ℤ components / degree 1 exterior / degrees 2 polynomial and 5 exterior | Connectedness and finite type needed | Added explicit bouquet loop-model prerequisite target |
| Bouquet loop finite type | N=0; S³,S⁴ | Ω²pt has H⁰ rank 1; Ω²S³ ranks 1,1,0; Ω²S⁴ ranks 1,0,1,0,1,1,1 | Inputs of H-space theorem hold in displayed cases | Added proof route and §4.5 to §5.1 Needs |
| doubleLoopBetti / §5.1 | n=4,N=2 and n=5,N=1 | Degrees 0..10: 1,2,1,1,2,3,4,5,8,13,18; single S⁴ degrees 0..6: 1,0,1,0,1,1,1 | 375 free-algebra/product coefficient comparisons passed | None |
| Finite join §5.2 | Sizes (2,2),(2,3),(2,2,2),(1,3) | Graph b₁=4−4+1=1 and 6−5+1=2; three-colour reduced b₂=1; singleton gives 0 spheres and contractible join | Product ∏(k_i−1)=1,2,1,0 agrees | None |
| fermatFiber | n=0; n=1,k=3; n=2,k=(1,3) | Empty sum 0≠1: ∅; one coordinate: 3 roots; exponent-one graph: ℂ and N=0 | Zero/exponent-one cases distinguished | None |
| phamSkeleton | k=(2,2); (1,0),(√2,i),(0,0) | Power sums 1,1,0; skeleton membership yes,no,no since second tuple has a negative power | Nonnegative powers define a proper skeleton | None |
| phamInclusion | Same first two tuples | (1,0) maps to itself; (√2,i) has no skeleton preimage under inclusion | Genuine inclusion with specified source | None |
| phamStrongRetraction / §5.3 | n=0,1; k=(2,3) at n=2 | Empty-to-empty homotopy; μ₃ retracts identically; K₂,₃ has 2 circle bouquet; (1,0) and (−1,0) must each remain fixed | Strong relative and equivariant conditions exclude constant map | None |
| Fermat positive scaling | k=(2,3),t=8,z=(0,2) | Indexed scaling gives (0,1), power sum 1; common square root gives cubic 1/(2√2)≠1 | Positive t fixes roots and denominators | None |
| Fermat double-loop simple connectivity §5.4 | n=5,k_i=2; n=4,k_i=2; exponent-one factor | Fibre S⁴: π₂=π₃=0; fibre S³: π₃=ℤ so π₁Ω²=ℤ; contractible factor gives both zero | n≥5 boundary sharp | None |
| Fundamental ω §7.2 | Fixed point,free orbit,trivial/sign coefficients | Sign H¹=𝔽₂ with ω=1; trivial H¹=0; free-orbit H¹=0; mod-two powers all nonzero at point | Nonzero universal class need not remain nonzero everywhere | None |
| Integral cyclic groups §7.3 | j even/odd at point, q=0,1,2 | Even: ℤ,0,𝔽₂; odd: 0,𝔽₂,0 | Degree zero is not parity-periodic | None |
| Rank-one fixed coordinates §7.5 | Point i=j=0 and i=j=1; circle sign monodromy | Point ℤ and 𝔽₂; nontrivial circle L has H⁰=0,H¹=ℤ/2 | Integral q=0 term and local system kept | None |
| Twisted Bockstein §7.6 | Trivial/nontrivial L on S¹; equivariant point k=1,2 | β_L1=0/a; point reductions ω²/0 from kω^(k+1) | Monodromy term differs from cyclic term | None |
| Finite Borel approximation supplier | V=pt,s=1,2; Z=∅ | At s=1,H⁰=ℤ on both sides but H¹=ℤ versus 0; at s=2 sign H¹=𝔽₂ on both sides; empty support both 0 | Strict range and descent essential | Consolidated into supplier contract |
| Semialgebraic loci supplier | A¹_R; x²+1; nilpotent thickening | Complex locus R², fixed R; equation x²+1 has 2 complex points,0 real; ε²=0 forces ε=0 on both fields | Field-valued loci ignore nilpotents | None |
| Triangulation/dimension supplier | Point in R²,open/closed intervals,marked midpoint | Dimensions 0,1,1; open edge excludes endpoints; midpoint forces two edges | Ambient dimension and compactness not substituted | None |
| Equivariant sites,free descent,regular coefficients | Fixed point versus free orbit; regular stalk | Trivial fixed H²=𝔽₂ versus free H²=0; regular H⁰=ℤ,H^q>0=0 | Free-action and induced coefficients necessary | None |
| Support-dimension bound supplier | V=R,Z={0}; dim 1 | H_Z¹(R,ℤ)=ℤ; H_Z²=0; empty support all 0 | Bound >d rather than ≥d | None |
| Semialgebraic orientation supplier | R→pt; RP²; complex line | Relative orientation shift 1; RP² orientation nonconstant, mod-two constant; conjugation sign −1 | Rank-one integral orientation retained | None |
| Exceptional inverse-image supplier | Identity,open immersion,closed pt→R | id!=id; open !=restriction; point !ℤ_R=ℤ[−1], not ℤ[0] | Supported rather than ordinary pullback at closed point | None |
| Finite duality supplier | Point A=ℤ/4; A=⊕ℕ𝔽₂ | Pair (1,1)↦1/4 modℤ, both kernels 0; dual of ⊕ is ∏ and bidual strictly larger | Finite stalks essential | None |
| Gysin and trace supplier | pt→S¹,S¹→pt,id | Generator maps 1→a, a→1; shifts +1,−1,0; H⁰(S¹) integrates to degree −1=0 | Normalization excludes a factor 2 | Expanded separate Checks |
| Steenrod supplier | 1,a∈H¹(RP²),b∈H¹(S¹) | Sq⁰1=1; positive Sq1=0; Sq¹a=a²,Sq²a=0; Sq¹b=b²=0 | Instability and unit fixed | None |
| Mod-two fixed-coordinate supplier | pt,S¹,two points,empty | Degree i>0 ranks 1,2,2,0; first-point restriction of indicators gives 1,0; a²=0 on circle | Coordinates not summed by point restriction | Expanded three Checks |
| Real norm and pushforward §9.1 | Fixed point; pt→RP¹ | Forget degree 0=id; norm 2=0 mod2; real Gysin 1↦a, cup ω preserves ordinary degree | Shift c, not 2c | None |
| Self-intersection γ §9.2 | Point,empty,RP² | γ=1; zero ring 0=1; RP² γ=1+a+a², inverse 1+a, product 1 mod a³ | Unique supported-class normalization excludes γ=1 on RP² | None |
| Mod-two support splitting §9.3 | Fixed point,free orbit; RP² d=2,i=3 | Retractions id,0; RP² γ·γ⁻¹=1 gives input ω back, raw truncation gives ω+a | γ inverse essential | None |
| Component separators §9.3 | Two fixed components | Restrictions (1,0),(0,1); sum (1,1) | Component classes distinct | None |
| Integral support splitting §9.4 | A¹,i=2,j=0; wrong j=i=1 | Allowed support=ambient=𝔽₂,complement=0; wrong support ℤ→ambient 𝔽₂ has kernel 2ℤ | Parity essential | None |
| Low-coordinate surjectivity §9.5 | i≤d; d=2,i=4,j=1 | Zero target in first case; second retains p=1 and excludes p=2 | Strict cutoff | None |
| Barred γ formula §9.5 | RP²,γ̄=1+a²,x=1,a | β_or1=a,β_ora=0; γ̄+β_orγ̄=1+a+a²; formula on 1 gives (1+a²)+a²=1; on a gives a | Formula only on specified parity objects | None |
| Relative/complement duality §10.1 | Real-empty conic,𝔽₂ | Quotient RP² ranks 1,1,1; 1·a² and a·a integrate to 1 | Pairing nondegenerate | None |
| Profinite integral duality §10.2 | X=Spec C/R,d=0,M=ℤ | Pair H⁰=ℤ, completion ℤ̂; dual Hom(ℚ/ℤ,ℚ/ℤ)=ℤ̂ | Completion cannot be replaced by ℤ | None |
| Corrected localization §10.3 | d=1; d=i=2; empty real locus | Windows H^(i−1),H^i; H⁰⊕H¹,H¹⊕H²; empty windows=0,v iso | Shifted windows distinct | None |
| Boundary trace §10.4 | ℙ¹,z=1,a; ℙ²,z=a | Values 0,1; RP² deg(a(1+a))=1 while deg a=0 | γ inverse required | None |
| Self-duality §10.5 | RP²,d=i=2,x=1,y=a | Corrected pairing deg(a+a²)=1; raw pairing 0; inverse cancellation γγ⁻¹=1 | Corrections detected by nonzero pairing | None |
| Affine ordinary bound and restriction §11.1 | 𝔾_m,d=1; Spec C/R,d=0; node xy=0 | Ordinary H¹(ℂ*)=ℤ,H²=0; degree-0 restriction ℤ→0 not iso,positive 0→0; node contracts so positive groups 0 | Strict i>d | None |
| Singular attachment estimate §11.1 | Node xy=0,d=1,strata dimensions 1,0 | Tangential/normal bounds (1,0),(0,1); total ≤1; complex link at node 2 points | Ambient real dimension 2 is wrong bound | Explicit existing local proof targets retained |
| Uniform affine-family triviality §11.1 | z²=t,t=0,−1,+1 | Fibre sizes 1,2,2; anchors 0,−1,+1; rank H⁰ 1,2,2 after every real closed extension | Partition cannot cross dimension/cardinality change | None |
| Coefficient colimits §11.1 | Circle with ℤ/2ʳ transition ×2; sign fixed point | Circle H¹ colimit ℚ₂/ℤ₂ equals coefficient H¹; sign H¹ stage 𝔽₂ maps 0, colimit 0=M/2M | Transition maps essential | Generic theorem attributed to SchemeAndStackFoundations §2.5 |
| Equivariant coefficient colimits §11.1 | Trivial fixed-point M=ℚ₂/ℤ₂ | Odd groups M[2]=𝔽₂,even positive M/2M=0; finite-stage odd transitions id,even transitions 0 | Native finite-rank resolution supports colimit passage | None |
| Pair coefficient colimits §11.1 | Pair pt/pt; finite two-point site; infinite discrete site | Pair both 0; finite site colim M²=(colim M)²; infinite sequence (e_j) lies in product of colimits but no bounded coordinate stage | Finite-cover hypotheses essential | None |
| Nilpotent affine Check §11.1 | Spec R[x,ε]/ε² | Loci same as A¹,H⁰=M,all positive ordinary groups 0 | No smoothness added to general affine theorem | None |
| Real-empty Lefschetz §11.2 | Real-empty conic,d=1,degree-two divisor | At i=2,j=0 source ℤ→target ℤ/2 onto with kernel 2ℤ; above 2 relevant targets 0 | Boundary only surjective | None |
| Lefschetz image criterion §11.3 | ℙ¹ with real-point/real-empty divisor | Real H⁰→H¹ sends 1→1 versus 0→𝔽₂; matching positive-coordinate obstruction 0 versus 𝔽₂ | Surjectivity hypothesis distinguishes cases | None |
| Injective Lefschetz §11.4 | Real-empty conic,i=3; boundary i=2 | Above boundary both relevant groups 0,map injective; at boundary ℤ→ℤ/2 kernel 2ℤ | Strict i>d+1 cannot be weakened | None |
| Affine relative torsion §11.5 | A¹; 𝔾_m,𝔽₂ | Line pair contracts; for torus restriction matrix [[1,0],[1,1]],det 1,cokernel 0,relative H²=0 | First vanishing needs degree-d cokernel | None |
| Steenrod-conjugated pushforward supplier | id; pt→ℙ¹; empty source | id; 1↦a with Sq a=a; empty map 0 | Shift and finite windows retained | Consolidated into supplier contract |
| γ=w §12.3 | ℙ²/ℝ,ℙ¹/ℝ,empty | Tangent totals 1+a+a²,1,0 equal γ | Complex normal identified with real tangent | None |
| Surface orientation and Euler parity §12.3 | RP²,torus,Klein bottle,disk | w₁² degrees 1,0,0,0; χ mod2 1,0,0,1; disk excluded by boundary | w₁²=0 does not imply orientability | None |
| Wu/characteristic-form supplier application | Matrices (1),[[0,1],[1,0]],diag(1,1) | Characteristic vectors 1,0,(1,1); squares 1,0,0 equal dimensions mod2 | Nonorientable route verified | None |
| Surface loops §12.4 | Torus class (1,1),zero class,disconnected surface | Diagonal circle has class (1,1); empty union gives 0; two occupied components require two representatives | Finite union, not forced connected | None |
| Admissible complement §13.1 | ℙ²,ℙ³,(ℙ¹)⁴ | Low windows ∅,{0},{1}; support groups 0,𝔽₂,𝔽₂⁴; corresponding admissible indices 1,2,16 | Point tests insufficient at d=4 | None |
| Cup-ω near top §13.2 | d=0 Spec R; ℙ¹; ℙ² | d=0 groups 0→0; ℙ¹ ℤ→𝔽₂ kernel 2ℤ,next 𝔽₂→𝔽₂ identities; ℙ² penultimate ordinary group 0 of odd order 1 | Boundary and odd-order zero group included | None |
| Quartic rank §13.3 | ∑x_i⁴=0 | (3⁵−3)/4=60; even traces 1−1+1−1=0; middle trace 0; (60+0)/2=30; quotient χ=(4−60)/2=−28 | Rank only, no integral torsion conclusion | None |
| Real-closed fixed-point trace supplier | Antipodal S² | H⁰ trace 1,H² trace −1; alternating total 0 | Fixed-point-free model | None |
| Double-cover sign system §14.1 | Split cover,connected circle cover,exchanged fixed sheets | Monodromy +1,−1; exchanged sheets act −1 on [(1,0)],sign twist gives +1 | Stabilizer and monodromy distinguished | None |
| Double-cover extension and β §14.2 | Split/connected circle,x=1 | e=0/a; β_L1=0/a; ordinary β_ℤ1=0 | Extension fixes correction term | None |
| Ramified triangle §14.3 | z²=t,branch point and punctured disk | Branch trace ×2; sign puncture H⁰=0,H¹=ℤ/2; cone(×2)[−1] gives same | Derived branch contribution retained | Specified the cone shift [−1] |
| Equivariant Ext-stalk supplier | Trivial,sign,regular integral stalk | (H¹,H²)=(0,𝔽₂),(𝔽₂,0),(0,0) | Freeness as abelian group insufficient | Consolidated into supplier contract |
| Permutation quotient §15.1 | n=1,2,3; diagonal shift b | Q ranks 0,1,2; at n=2 swap sends generator to −generator; sum changes by nb,φ unchanged | Diagonal quotient fixed | None |
| Mixed trace/quotient exactness §15.1 | n=2,vector (a,b)=(1,0) | (Tr,π)=(1,[(1,0)]); (1−φ)=1−1=0 mod2; lift condition Tr mod2=φ | Sign in last arrow fixed | None |
| Trace-zero ψ §15.2 | n=1,2,3,4 | ψ=0,(−1,1),(−2,1,1),(−3,1,1,1); traces all 0,reductions all diagonal 1 | Opposite sign fails at n=3 | None |
| ψ diagonal invariance §15.2 | n=3,add (b,b,b) | Each numerator changes by 3b−3b=0; trace remains 0 | Map descends from Q | None |
| Trace-quotient criterion §15.3 | Two fixed sheets/two exchanged sheets at point;n=1 | Fixed sheets: obstruction (1,1) in 𝔽₂²,nonzero a does not lift; exchanged: obstruction 0,ζ=1 maps to a=1;n=1 all zero | Both obstruction directions tested | None |
| Corrected lift §15.4 | n=4,η=0,ζ=[(1,0,0,0)] | a=3; −ψζ=(3,−1,−1,−1) mod4=(3,3,3,3); +ψ mod4=(1,1,1,1); both traces 0 | Minus sign necessary | None |
| Adjacent cyclic reductions §15.5 | n=2,4,6,0 | H¹ reductions 1,1,1; H² reductions 1,0,1; n=0 sign H²=0 | Positive even n and mod-four distinction retained | None |
| Circle extension E §15.6 | n=2 one regular block;n=4 two regular blocks | E stalk ℤ/4 versus 𝔽₂²; both kernel and quotient ℤ/2 | Extension need not be 𝔽₂-linear | None |
| Circle obstruction versus splitting §15.6 | Constant ℤ/4 extension | Quotient unit lifts to 1 so δ(1)=0; no additive section since every order-two lift maps to 0 | Section lift differs from sheaf splitting | None |
| Equivariant Ehresmann §16.1 | Product (b,z)↦(−b,τz) | Radial transport id on z; fixed-base fibre action τ commutes; arbitrary moving divisor not preserved | Smooth equivariance does not assert pair preservation | None |
| Stratified pair transport §16.2 | Constant pair; xy=t at t=0 | Product keeps strata; node stratum derivative rank 0 versus required base rank 1 | Submersion hypothesis excludes changing node | None |
| Finite-index image §16.3 | pt,trivial S²; lattice 2ℤ⊂ℤ | Target 0 index 1; ℤ→ℤ onto,index 1; 2ℤ has index 2 but rational image ℚ | Rational result not integral surjectivity | None |
| Tensor injectivity route §16.4 | C₂,S₃ regular basis-pair actions; sign squared | 2 orbits of size 2 / 6 of size 6; regular tensor ≅2 or 6 regular copies; sign²=+1 | Coinduction and exact equivalence supply preservation | None |
| Double-cover common-lift chase §16.4 | Split fixed-sheet cover; γ=δ=ζ=0 | g=0,sign norm=0,κ injective gives ζ=0; η₀=0 and both sides 0 in degree 4 | Correct target and correction-image degree | None |
| Nonzero common-lift correction §16.4 | Real-complex cover of ℙ¹_R×A¹_R,L=ℤ(1),γ=ζ=0,η=c₁O(1),δ=ηω | Ordinary δ=0; g=∪ω; gδ=ηω²=g(ηω),restriction aω³≠0 in degree 4 | Correction term cannot be omitted | None |
| Euler uniqueness and truncation API | N=2,even n,through degree 2 | e₁=−2 gives (1−T)²=1−2T+T²; e₂=−1 cancels T²; changing e₂ by 1 changes coefficient T² by 1 | First-difference uniqueness and truncation tested | None |
| Tame constant-translation API | f=x³−3x+y²,f−2 | Same gradient (3x²−3,2y); same μ=2; critical values −2,2 become −4,0 with multiplicities 1,1 | Constant shift preserves tameness and total dimension | None |
| Jacobian/fibre-number sum API | Same cubic plane polynomial | Local factors at x=−1,+1 each dimension 1; μ⁻²+μ²=1+1=2=μ; regular μ⁰=0 | Bounds and sum tested | None |
| Bouquet pointed-map API | N=1,identity and antipodal map on S² with transported base | Identity followed by antipodal sends v↦−v; inverse followed by map sends v↦v; N=0 unique map of point | Composition and inverse fixed | None |
| Sphere isometry API | s=1,reflection (x,y)↦(x,−y) | (0,1)↦(0,−1),norms both 1; reflection squared (0,1) | Norm-one subtype respected | None |
| Pham root-action and endpoint API | k=(2,3),u=(−1,1),z=(1,0) | Powers stay (1,0); H_t(z)=z,H_t(uz)=uz=(−1,0); endpoint inclusion/retraction also z,uz | Fixed-skeleton and equivariance commute | None |
| Finite sheaf spectral-sequence API | pt with sign lattice; free two-point orbit | At pt only ordinary q=0 survives,so total H¹=H¹(C₂,ℤ(1))=𝔽₂; regular orbit gives total H¹=0 | Correct edge and derived invariants | None |
| Restriction and zero-map API | Two-point fixed space and empty support | Restriction (a,b)↦a; identity composite same (a,b); zero coefficient map sends (a,b)↦(0,0); support ∅ gives 0 | Functoriality/zero laws tested | None |
| Regular coefficient exact sequences | F=ℤ,trivial action | Diagonal 1↦(1,1),quotient (a,b)↦a−b; trace (a,b)↦a+b,kernel generator (1,−1); both composites 0 | Exact kernels and action signs | None |
| Orientation composition API | R²→R→pt | Relative ranks 1+1=2; oriented chart generators multiply to orientation of R²; identity relative line ℤ | Dimension and tensor transitivity agree | None |
| Adjunction identity and uniqueness API | f=id at point,Λ=ℤ | Both adjoints identity; unit/counit on 1 are 1; both triangle composites 1↦1 | Unit/trace rescaling excluded | None |
| Gysin composition normalization | pt→S¹→pt with relative orientations | Embedding sends 1↦a,integration a↦1,composite 1↦1; pullback of base scalar 2 gives both sides 2a | Composition and projection hold | None |
| Steenrod Cartan/Adem API | a∈H¹(RP²),unit | Sq(a)=a+a²; Sq(a²)=(a+a²)²=a² modulo a³; Sq¹Sq¹a=Sq¹a²=0; Sq¹1=0 | Cartan and first Adem relation agree | None |
| Self-intersection inverse API | γ=1+a+a² in 𝔽₂[a]/a³ | Inverse coefficients 1,a,0; γ(1+a)=1; zero class 0 fails zeroth-coordinate 1 on nonempty locus | Recursive inverse and uniqueness | None |
| Corrected-sequence consecutive composites | Empty real locus,real-empty conic | Real windows 0; v=id on quotient cohomology,u=w=0; vu=wv=uw=0 | Exactness at both ends and middle | None |
| Sign-system cokernel and sheet swap API | Two-sheet stalk,vector (2,1) | Difference 1; adding diagonal (3,3) gives difference 1; swap gives −1; universal factor h(a,b)=a−b kills (c,c) | Cokernel rather than unidentified kernel | None |
| Trace-quotient and ψ naturality API | n=3,swap first two sheets | ψ[(1,0,0)]=(−2,1,1); swapping gives (1,−2,1)=ψ[(0,1,0)]; trace 0 in both | Equivariance and restriction laws | None |
| Circle-cokernel universal property API | n=2,E=(𝔽₂⊕ℤ)/⟨(1,2)⟩ | Map (a,b)↦2a+b mod4 kills (1,2),since 2+2=0; kernel inclusion 1↦2,quotient 1↦1 mod2 | Kernel/quotient maps fixed | None |
| One-variable critical-value Check §4.2 | f=z versus f=z² | Derivatives 1 and 2z; critical loci ∅ and {0}; critical values ∅ and {0}; Jacobian dimensions 0 and 1 | Linear endpoint has no critical value | Corrected the former assertion of one critical value for every k≥1 |


Pull request: #1694 (roadmap/algebraic-topology-part-ii at 1b3853b)
