<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1073#issuecomment-6398287647 -->
Review (codex) of a8a4623

Verdict: accepted
Conditional on the announced gaps: `finite-group-borel-approximation`, `finite-group-ext-stalk`, `real-closed-semialgebraic-geometry`, `configuration-cover-comparison`, `configuration-carrier-generality`, `semialgebraic-free-quotient-geometry`, `semialgebraic-equivariant-sites`, `semialgebraic-support-dimension`, `semialgebraic-fixed-point-trace`, `semialgebraic-duality-coefficients`, `supported-steenrod-comparison`, `rational-commutative-hspace-hopf`

1. **F01** (P3) Repoint the filtered-colimit input to its actual owner

   **Location.** `packages/AlgebraicTopologyPartII/README.md:1048`: “exact filtered-colimit comparison from MotivesAndAlgebraicCycles §7.6a”. The same passage-to-arbitrary-coefficients input occurs at line 1102; the supplier contract and Layer 11 dependency list omit its actual owner.

   **Claim.** MotivesAndAlgebraicCycles §7.6a supplies the filtered-colimit cohomology theorem used to pass from finitely generated coefficients to arbitrary coefficients.

   **Witness.** `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:1383` does not state this comparison. On main, `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3402` explicitly owns `cohomology_filtered_colimits`, including its finite-cover and finite Čech-product hypotheses.

   **Exact repair.** Cite SchemeAndStackFoundations §2.5 / `cohomology_filtered_colimits` in the supplier contract, §§11.1 and 11.5, their *Needs* lines and Layer 11 Dependencies. Explain the application: use semialgebraic opens and finite admissible covers, whose finite intersections remain in the site, including its terminal object. For equivariant cohomology, combine this with the finite-group resolution/derived-invariant comparison; for pair cohomology, also retain extension by zero and localization. Remove the attribution of this particular comparison to §7.6a. Do not add a gap or re-plan the generic theorem: it already has an earlier owner.

   **Repair test.** On the ordinary circle, `colim_r H¹(S¹,ℤ/2ʳ)=colim_r ℤ/2ʳ=ℚ₂/ℤ₂=H¹(S¹,ℚ₂/ℤ₂)`, with transition multiplication by two. At a fixed point with sign coefficients, each `H¹(C₂,ℤ/2ʳ)=𝔽₂`, but its transition is zero, so the colimit is zero, agreeing with `(ℚ₂/ℤ₂)/2(ℚ₂/ℤ₂)=0`. The named theorem supplies precisely the comparison, including these transition maps. This is a citation/dependency-list correction, not an unowned prerequisite.

2. **F02** (P3) The diagonal truncation uses the upper support bound

   **Location.** `packages/AlgebraicTopologyPartII/README.md:509`: “The support lower bound excludes m(n−3)>j”.

   **Claim.** The lower compact-support degree bound proves the required vanishing.

   **Witness.** At `n=4,m=2,j=1`, the selected degree is `mn−m−j=5`. It satisfies the lower bound `m+1=3`, but exceeds the upper bound `2m=4`.

   **Exact repair.** Replace “support lower bound” by “upper compact-support bound 2m”, and state `mn−m−j>2m` exactly when `m(n−3)>j`. Keep the theorem and its non-strict hypothesis `d(n−3)≥j`.

   **Repair test.** The displayed instance now vanishes because `H_c⁵(PConf₂)=0`. At the included boundary `n=4,N=1,j=d=1`, the diagonal and product coefficient both equal 1. Thus the correction preserves the valid boundary improvement over BS Corollary 7.5.

3. **F03** (P3) Remove a stale reference to local Layer 0

   **Location.** `packages/AlgebraicTopologyPartII/README.md:74`: “the scheme topology and morphism properties retained in Layer 0”.

   **Claim.** This roadmap contains a Layer 0 retaining those objects.

   **Witness.** Its sixteen layer headings run from Layer 1 at `packages/AlgebraicTopologyPartII/README.md:366` to Layer 16 at line 1425; there is no Layer 0.

   **Exact repair.** Delete the quoted clause and its adjoining comma. Retain the actual named SchemeAndStackFoundations contracts for dimensions, relative spectra, supports and equivariant sheaves. Do not create a new layer.

   **Repair test.** After that textual deletion, the sentence refers only to existing supplier sections, with no assertion about a nonexistent local layer; its mathematical imports remain the same.

Three P3 findings; no P1 or P2 findings. Acceptance is conditional on the twelve declared supplier contracts listed below. The README, Suggested.lean, metadata and author-recorded sources were not changed.

## Verified sound

### Previous findings, checked first

The preceding review's F01–F07 and all corresponding repair explanations were read. None was marked “not actionable in this package”; none is re-raised here.

| Previous finding | Repaired passage, quoted briefly | Status and independent check |
|---|---|---|
| F01: extra Lean statements | `Suggested.lean:134`: “Hilton and Serre give all rational ranks of a finite bouquet”; line 156: “The full double-loop Betti product” | **Repaired.** Only four sorried theorems remain. The four specified special-case/route theorems and their two private Fermat carriers are absent; the corresponding README mathematics remains. |
| F02: affine ownership and singular route | README:1046: “For smooth U over ℝ consume the affine CW dimension bound and cohomological vanishing of AffineMorseLefschetz A2–A3.” | **Repaired.** The singular extension is distinguished; the local tangential/normal attachment estimates are explicitly owned at line 1048. GM line 5428 and line 5587 support that route. R01 concerns a different input in this new passage. |
| F03: geometry gap owner | README:90: “What AffineMorseLefschetz must provide (gap:real-closed-semialgebraic-geometry)” | **Repaired.** A4.1 owns the real triangulation/dimension theorem; the gap is its real-closed extension. Chart gluing is consumed at line 165; the free quotient has its separate contract at line 167. |
| F04: three Borel owners | README:849: “Consume this as the finite Borel approximation specialization of MotivesAndAlgebraicCycles §7.6b” | **Repaired.** There is one owner and a matching gap. The descended sheaf, supports, antipodal sphere, and strict degree range are explicit. No reverse supply from §8.5 to purity remains. |
| F05: unnecessary tensor gap | README:78: “use §2.23’s `forget_injective` and `coind_injective`” | **Repaired.** The tensor gap is absent. At line 1472 the regular tensor uses coinduction and the sign tensor uses an involutive exact equivalence. C₂ and S₃ orbit calculations validate the identification. |
| F06: Wu ownership | README:1138: “the new result is γ_X=w(TX(ℝ)); the surface identities apply the supplied Wu, orientation and Euler theorems” | **Repaired.** TangentialBordism B4 item 3 and CharacteristicClasses C2.3/C3.2 are cited in scope, contracts and dependencies. The added nonorientable pairing argument gives the correct RP²/Klein-bottle values. |
| F07: six locator/API corrections | README:934: “its proof is a target here”; line 1153: “the stated finite-family relative form and its proof are owned here” | **Repaired.** BS Definition 7.3 points to line 2211; the embedded-loop assertion points to B19 lines 1640–1643; Layer 2 includes the Frobenius declaration; native semialgebraicity has independent CommRing/LinearOrder hypotheses; the rational-sphere coefficient is ℚ. |

### Scope, principles and shape

Read all **58 numbered targets**, all **58 *Needs* lines**, the **16 layer dependency lists**, all supplier contracts, conventions, examples, and all four package files. The scratch worklist and computed ledger were saved as the review proceeded. Untouched mathematics was not accepted merely from the previous repair report: every target has a computed instance in this review's ledger. The table below presents the sampled targets, headlines and findings, as required for the comment-size limit.

The roadmap extends the eight-stage AlgebraicTopology roadmap. Its ordinary chain, CW, cover, duality and Whitehead foundations are imports. The configuration, rational bouquet, fixed-locus and cover formulas are additional results. No route-specific prime restriction, computational algorithm, copied source passage, upward dependency, new generic derived category, sorry'd data or `set_option` was found. Proofs by coefficient cancellation and small explicit calculations are mathematical proof routes and Checks. The four headline signatures name the actual configuration, polynomial, bouquet and loop objects.

The eleven Lean definitions/abbreviations have real bodies on pinned carriers. Their README API blocks and discriminating examples distinguish injective tuples, inverse-coordinate action, the signed Euler transform, unit spheres, empty wedges, tameness, generalized critical-value eigenspaces, polynomial fibres and formal Betti factors. In particular the infinite-dimensional Jacobian finrank-zero convention is not substituted for finite dimensionality; the theorem includes finite dimensionality. The sphere ambient dimension and every necessary factor-domain binder are retained. No padding remains in Suggested.lean.

### Elaboration and full signatures

Pins read from `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The content main revision inspected was `e9512ca8df2763cf4a2c2be435e96f55a7742d11`.

The prescribed `lake env lean` invocation on `packages/AlgebraicTopologyPartII/Suggested.lean`, run from the content checkout, exited **0**. Its only output was four `declaration uses sorry` warnings, at lines **63, 127, 136, 159**. All three individually used Tau Ceti imports already had object files; no build was necessary.

A separate scratch copy with `#check @name` for **all 15 declarations** also exited 0. I read each expanded type and compared it with the README:

| Declarations | Signature comparison |
|---|---|
| `orderedConfiguration`, `configurationPermutation` | Injective Fin m→ℂ subtype; continuous inverse-coordinate permutation map. |
| `configurationTraceFormula` | Every finite field, every m and rational cycle-type function; all-degree finite dimensionality; ordinary singular trace; finite support and nonzero rational m! denominator. |
| `eulerExponent` | Natural n,N,r, integral quotient; total r=0 gives zero, while the divisor formula is asserted only for r>0. |
| `unitSphere`, `sphereBouquet` | Radius one in real dimension s+1; N indexed copies with an actual common point; native empty wedge is a point. |
| `IsTame`, `jacobianAlgebra`, `milnorNumber`, `fiberMilnorNumber`, `polynomialFiber` | Actual polynomial and derivative data; compact critical neighbourhood; full generalized eigenspace; actual level subtype. |
| `tameFibreBouquet` | n≥2, tameness, arbitrary value a and model point; finite-dimensional Jacobian algebra and actual homotopy equivalence. |
| `rationalBouquetRanks` | Arbitrary small space with a supplied bouquet homotopy equivalence and chosen point; sphere dimension s+2, homotopy degree k+2; correct divisibility/sign formula. |
| `doubleLoopFactor`, `doubleLoopBetti` | Explicit n≥4 and r>0 factor binders; theorem n=s+4, actual double loops, finite dimensionality, degree j coefficient of precisely the first j factors. |

No section binder was lost and no signature was changed. A scratch copy tested each of the four theorems with `simp`, `rfl` and `infer_instance`, requiring each tactic to close the whole goal. **All twelve closure attempts failed**, as expected; the probe file then elaborated with only its four intended sorry warnings. Object searches and the opened library statements supplied no single-lemma proof of any headline. There are no boundary-case, Check-only or definitional theorems left to delete.

### Headline coverage

| Headline from the README | Acceptance-file treatment |
|---|---|
| Arithmetic configuration trace, §2.4 | `configurationTraceFormula`, line 63; compact-support version separately named as not statable. |
| Stable configuration diagonal, §3.5 | Module docstring names the missing compact-support representation and coefficient comparison. |
| Tame fibre bouquet, §4.2 | `tameFibreBouquet`, line 127. |
| Full rational bouquet ranks, §4.5 | `rationalBouquetRanks`, line 136. |
| Double-loop Betti identity, §5.1 | `doubleLoopBetti`, line 159. |
| Full Hilton maps and finite-join/Fermat-join comparisons | Docstring identifies the missing Whitehead indexing/maps and topological join carrier. The existing simplicial join is a different construction. |
| General rational double-loop algebra | Docstring identifies the missing graded algebra/H-space comparison, while retaining the statable numerical theorem. |
| Support splittings, corrected localization/self-duality, affine/Lefschetz and near-top results | Docstring identifies the missing arbitrary-real-closed semialgebraic/equivariant support, purity and trace carriers. |
| Wu/self-intersection, quartic rank, trace lift, circle obstruction, common-lift chase and transport | Each is named in the docstring with its missing geometric carrier or comparison map. |

No statable headline was found missing or replaced by a stand-in.

### Computed adversarial table

Values were independently evaluated, not inferred from successful elaboration. A small scratch calculation also compared **80** squarefree-polynomial/Euler-product cases over 𝔽₂ and 𝔽₃, **280** Hilton/signed-Möbius ranks and **208** stable-diagonal/product coefficients: **568 equalities passed**. These finite checks supplement the source and proof-route audit.

| Statement | Instances | Computed values on both sides | Result / change |
|---|---|---|---|
| §3.1 signed Euler exponents | N=2, both parities; N=0,1; r=0 | Even first six e: −2,−1,−2,−3,−6,−9, giving 1−2T. Odd N=1: (1−T)⁻¹(1−T²)=1+T. N=0 product1. Total e₀=0. | Sound. |
| §3.4 twisted multiplicities | m=2,N=2; m=0 | H_c³,H_c⁴ carry trivial S₂ characters. Even n gives exterior invariant dimensions 1,1; odd n symmetric dimensions 3,3. Signed product gives the same pairs. m=0 gives1 only at i=0. | Sound; tests both signs beyond m=1. |
| §3.5 stable diagonal | (n,N,j,d)=(4,1,1,1),(5,1,2,1),(4,1,0,0) | Diagonal/product coefficients 1=1,1=1,1=1. With n=4,m=2,j=1, selected degree5>4, so term0; lower bound3 is satisfied. | Sound theorem; R02 fixes route wording. |
| §5.2 finite joins | Sizes (2,2),(2,3),(2,2,2),(1,3) | Graph b₁=4−4+1=1 and 6−5+1=2; three-factor χ=6−12+8=2 and reduced b₂=1. Products (k_i−1):1,2,1,0. Singleton case contractible. | Sound. |
| §5.3 Fermat skeleton/retraction | n=k=2; n=2,k=3 | (1,0): power sum1, in skeleton. (√2,i): powers2,−1, sum1, outside skeleton. k=3 join has4 circles=(3−1)². Scaling power sum r by r⁻¹ gives1. | Sound; excludes wrong skeleton/root choice. |
| §7.2 ω | Fixed point, free orbit, trivial versus sign lattice | Sign H¹=ℤ/2 with ω=1; untwisted H¹=0; free-orbit H¹=0. Mod-two powers give the nonzero basis in every degree. | Sound. |
| §8.5 Borel approximation | V=pt,s=1 | H⁰(RP¹,ℤ)=ℤ=H⁰(C₂,ℤ); at degree1, ℤ≠0. Sign H⁰ is0 on both sides. | Sound strict bound. |
| §9.2 γ and inverse | Point, empty locus, RP² | γ=1; zero ring has0=1; RP² gives (1+a+a²)(1+a)=1 mod a³. Dropping γ's positive terms changes its degree-one value from a to0. | Sound. |
| §9.3 mod-two splitting | X=A¹,d=1,i=0,1 | i0: support0, ambient𝔽₂, complement𝔽₂, quotient identity. i1: support𝔽₂, ambient𝔽₂, complement0, retraction identity. Two real points have indicators(1,0),(0,1). | Sound. |
| §9.4 integral splitting | A¹, correct and wrong parity | j0,i2: support𝔽₂→ambient𝔽₂ is identity. Wrong j1,i1: ℤ→𝔽₂ has kernel2ℤ. | Sound; parity essential. |
| §11.2 real-empty Lefschetz | Real-empty conic, smooth degree-two divisor, i=2 | j0: Gysin ℤ→ℤ/2 is onto, not injective. j1: ℤ→ℤ. Above degree2 the relevant targets vanish. | Sound boundary distinction. |
| §12.3 γ=w and surface parity | RP², torus, Klein bottle, disk | RP² w=1+a+a²=γ, deg w₁²=1=χ mod2. Torus:0=0. Klein pairing diag(1,1), characteristic vector(1,1), square0=χ mod2. Disk:0≠1, excluded by boundary hypothesis. | Sound. |
| §13.3 quartic rank | ∑x_i⁴=0 over a real closed field | b₃=(243−3)/4=60; even traces1−1+1−1=0; middle trace0; invariant rank(60+0)/2=30. Quotient χ=−56/2=−28=1+1−30. | Sound; says rank, not torsion-freeness. |
| §15.3 lifting | p:(z,w)↦(z³,w) on P¹×A¹; a=c₁O(1) mod3 | p*a=0 so Bockstein0. Choose η=c₁O(1),ζ=0: η mod3−φζ=a. At n=1 all mod-n classes are0. | Sound. |
| §16.4 common-lift chase | Real-complex double cover of S=P¹_R×A¹_R | L=ℤ(1), g=∪ω. Take γ=ζ=0, η=c₁O(1), δ=ηω. Ordinary δ=0. Both sides equal nonzero ηω², restricting to aω³=1 in H_G⁴(RP¹,ℤ(1))=𝔽₂. | Sound; detects the necessary correction term, not only a zero case. |
| `configurationTraceFormula` | q=2,m=0..3; S₃ at q=3; sign at m=2 | Counts1,2,2,4 equal1,q,q²−q,q³−q². S₃ class counts1,9,8 sum18. Sign sum0=0. | Sound headline. |
| `tameFibreBouquet` | Fermat n=2,k=3; x³−3x+y²; linear polynomial | Fermat μ4, μ⁻¹4, μ⁰0: critical point-type0 spheres, regular4. Cubic μ2, critical μᵃ1:1 sphere; regular2. Linear J=0,μ0, fibre contractible. | Sound headline. |
| Critical-value definition | ℂ[t]/t³, multiplication by t² | Generalized zero-eigenspace dimension3; kernel and quotient dimension2. | Correct definition excludes the tempting Tjurina/kernel substitutes. |
| `rationalBouquetRanks` | n=3,N=2; N=0,1 | π₂,π₃,π₄ ranks2,3,2 equal signed e. Empty bouquet ranks0. Single S² ranks1 in degrees2,3; S³ only degree3. | Sound headline. |
| `doubleLoopBetti` | n=4,N=2,j=0..10; n=5,N=1 | Free algebra/product coefficients both 1,2,1,1,2,3,4,5,8,13,18. Single S⁴ gives (1+t⁵)/(1−t²). n=3 has infinitely many components and is excluded. | Sound headline. |
| §10.5 corrected self-duality | RP²,d=i=2,x=1,y=a | Corrected degree deg(a+a²)=1; raw degree deg(a)=0. γγ⁻¹=1. | Sound headline. |
| §§15.4–15.6 lift/circle endpoints | n=4; sign degrees n=2,4,6; regular stalk | −ψ(1,0,0,0)=(3,−1,−1,−1) reduces to all3; +ψ reduces to all1. H² reduction maps1,0,1. E stalks at n2,n4 are ℤ/4,𝔽₂²; constant ℤ/4 has δ(1)=0 but no additive splitting. | Sound endpoints and conventions. |
| §§11.1,11.5 coefficient passage, R01 | Circle and fixed point; ℤ/2ʳ→ℤ/2ʳ⁺¹ by ×2 | Ordinary H¹ colimit ℚ₂/ℤ₂ equals H¹ with that coefficient. Sign group H¹ transitions are zero, colimit0 equals M/2M=0. | Repoint to §2.5 with its hypotheses. |
| R03 local-layer reference | Layer heading set | Present layers {1,…,16}; number of Layer 0 headings0. | Delete stale clause. |

Other tested cases in the full ledger include the nonabelian permutation action, zero ring, empty configuration/wedge, nilpotent thickening of the affine line, the non-tame polynomial x²y−x, monodromy versus stabilizer sign, the nonorientable orientation sheaf, closed versus open interval models, finite-stalk versus finite-exponent duality, and the changing-node failure of stratified submersivity. All README Checks were compared against their section's formulas; none refutes a theorem after interpreting the stated hypotheses.

### Seeded sources and changed proof passages

All fifteen requested targets were inspected at their locators. Statements below distinguish direct text support from a deduction owned by this roadmap.

| Target | Text read and locator result |
|---|---|
| 3.1 | BS line 2211, Definition 7.3, printed p.941; formula/inversion at lines 2218 and 2242, pp.941–942. The n=0 parity extension and N=0 boundary agree with the defining series. |
| 3.4 | BS line 2250, Lemma 7.4, pp.942–943; matches degree m+i, external sign and tensor sign. |
| 3.5 | BS line 2322, Corollary 7.5, pp.943–944. Source states d(n−3)>j; the package's valid equality boundary follows from the support argument, corrected by R02. Equation (7.3) must be read after diagonal extraction. |
| 5.2 | PHAM line 175 through line 207, Part I §2, pp.337–338. The simplex model and deformation lemma support the join calculation; arbitrary nonempty finite cardinalities and the singleton-cone case are the stated CW deduction. |
| 5.3 | PHAM line 207, deformation-retraction lemma, p.338; coordinate-hyperplane compatibility and continuous root lifting at lines 209–221. Positive scaling directly gives the additional product homeomorphism. |
| 7.2 | BW line 363 through line 371, v3 p.10; nonzero sign class, its powers and boundary cup product. |
| 8.5 | BW line 456 through line 474, v3 pp.12–13, equation (1.17); strict i<s and descended, potentially nonconstant coefficients are retained. |
| 9.2 | BW line 663, Definition 1.4 and Lemma 1.5, pp.17–18; line 699 identifies the Stiefel–Whitney comparison. |
| 9.3 | BW line 653, Proposition 1.3, p.17; retraction at lines 691–698, p.18; component indicators at lines 701–708. |
| 9.4 | BW line 721, Proposition 1.7, p.19; odd support twist and reduction retraction at lines 727–746. Pure-dimensional disconnected X is handled componentwise. |
| 11.2 | BW line 951, Proposition 1.14, p.24; i>d+1 isomorphism versus boundary surjection matches exactly. The package uses an independently owned topological affine route. |
| 12.3 | MILNOR-STASHEFF line 3155, Corollary 11.12, p.130, and line 3211, Theorem 11.14, pp.132–133. KRASNOV Theorem 2.1 remains waived; BW lines 699–700 corroborate that attribution. |
| 13.3 | BW line 2471, Lemma 5.9, v3 p.62; arbitrary-real-closed trace and b₃=60 at lines 2472–2478. |
| 15.3 | B19 line 1422, Lemma 7.2/proof, p.98. The lifting obstruction is the pulled-back integral Bockstein; the paper's Brauer assumption only supplies its vanishing. |
| 16.4 | B19 lines 773–816, diagrams (4.3)–(4.5), pp.82–83. Injective tensor models, common ordinary lift and the correction image are all present. |

For the changed passages, additionally read GM lines 5428–5457 (p.148), 5587–5598 (p.152), and 6483–6488 (p.177); BW lines 798–802 for the unproved Remark 1.9; and B19 lines 1640–1643 for embedded surface representatives. The GM singular Morse dimension estimates support the added route, including the node example; parameter-uniform real-closed comparison is explicitly this section's target, not a theorem falsely attributed to GM.

Also checked the headline sources CEF lines 964–976, BROUGHTON lines 115–117 and its critical-value definitions, and BS lines 2354–2401. EP lines 2127–2144 support the bounded-below exceptional adjunction; MATHER lines 969–976 support the nonequivariant isotopy lemma, while the package owns the invariant-control-data refinement. No new source fetch was needed. All seventeen manifest entries have unique keys; the unused SULLIVAN entry was preserved. No settled inaccessible source was requested again.

### Library and ownership evidence

The main roadmaps AlgebraicTopology, AffineMorseLefschetz and RealAnalyticGeometry were read for shape and scope. Object searches used `roadmaps grep` over indexed open heads and main, direct board-package searches, and both pinned libraries. Open revisions of existing roadmaps were not substituted for main. Searches covered configurations, tensor characters, Frobenius factors, Euler/Witt transforms, Milnor/tame fibres, Hilton products, rational H-spaces, joins, semialgebraic triangulation/cohomology, Wu classes, affine dimension, Borel approximation, trace quotients, and equivariant transport.

The following pinned declarations were opened, not just name-matched:

| Pinned file and line | Declaration/evidence used |
|---|---|
| `Mathlib/Topology/Homotopy/HomotopyGroup.lean:97` | `GenLoop` has body `{p | ∀ y ∈ Cube.boundary N, p y = x}`; no Hausdorffness or CW axiom. |
| `TauCeti/Topology/WedgeSum.lean:72` | `WedgeSum`, quotient via `wedgeNormalize`; empty family has its added base point. |
| `TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean:210` | `zerothHomotopyEquiv`; `loopSpaceEquiv` at 264 and `piLoopSpaceMulEquiv` at 321 retain the constant-loop base point. |
| `TauCeti/AlgebraicTopology/Cohomology/Basic.lean:94` | `TopCat.singularCohomology`; contravariant `singularCohomologyMap` at 100. |
| `TauCeti/AlgebraicTopology/Cohomology/Relative.lean:114` | Pair cohomology; connecting map at 205 has degree n→n+1. |
| `TauCeti/GroupTheory/Perm/Partition.lean:96` | `fullCycleType` adds one part per fixed point to native nontrivial cycle type. |
| `TauCeti/FieldTheory/GaloisGroups/FrobeniusOrbits.lean:106` | Squarefree root Frobenius/full-factor-degree equality; no new root-factor theorem is planned here. |
| `TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean:63` | Independent `[CommRing R] [LinearOrder R]`; definition at 68 adds no topology, finiteness or real-closedness. |
| `Mathlib/RepresentationTheory/Character.lean:68` | `Representation.char_tensor`; invariant average at 113 requires invertibility of group order. |
| `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean:206` | `sum_eq_iff_sum_smul_moebius_eq` explicitly quantifies over positive indices. |
| `Mathlib/RingTheory/PowerSeries/Binomial.lean:47` | `binomialSeries` expands (1+X)^r, explaining the substitution sign in `doubleLoopFactor`. |
| `Mathlib/Algebra/Algebra/Bilinear.lean:143` | `Algebra.lmul`, actual multiplication operator. |
| `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:556` | `maxGenEigenspace`, union of generalized kernels, not just the ordinary kernel. |
| `Mathlib/RingTheory/Artinian/Module.lean:616` | `quotNilradicalPowEquivPi`; paired with `IsArtinianRing.isNilpotent_nilradical` in `Mathlib/RingTheory/Artinian/Ring.lean:63`. |
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean:58` | `homResolutionIso`; even/odd cohomology at 80/113, with nonzero even degree required. |
| `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56` | `CategoryTheory.Sheaf.H` is the generic Ext-based carrier; it is not a semialgebraic realization. |
| `TauCeti/AlgebraicTopology/SimplicialComplex/Join.lean:51` | Existing combinatorial join, also at 121 for abstract complexes; not a topological finite-join carrier. |

All cross-roadmap citations were resolved against these main sections or new-folder open heads:

| Supplier | Sections actually inspected; ownership conclusion |
|---|---|
| AlgebraicTopology, main | Stages 2–8; Stage 5 item 5 at README:910 consumes the Serre interfaces, including multiplicative/local-coefficient forms. Part II does not rebuild them. |
| SchemeAndStackFoundations, main | §§0.1,0.2,0.7,2.7,2.19,2.23; equivariant injectivity at README:4570. Additionally §2.5 at 3402 identifies the R01 repair. §2.19 is coherent upper shriek, not the tensor-preservation argument. |
| AffineMorseLefschetz, main | A2 at README:180 and A3:199 are smooth affine CW/vanishing; A4.1:355 owns real triangulation and dimension. The singular affine extension here has a distinct scope. |
| RealAnalyticGeometry, main | R2.1 at README:429, bounded finite-family triangulation with analytic simplex maps. |
| RealAlgebraicGeometry, main | Layers 3 and 6, README:298 and 437; polynomial descriptions/projection, not topological triangulation. |
| DifferentialGeometry; GeometricTopology, main | Orientation and flow Layers 2–3, Sard Layer 10; GeometricTopology Layer 1 manifold/tangent bridge. |
| MorseNovikov, main | N6, README:494–501: fixed-point/trace formula for closed connected fibres, explicitly including nonorientable manifolds. |
| MotivesAndAlgebraicCycles, open head | §§7.6a–7.6b, README:1383 and 1394: independent semialgebraic/equivariant foundations; field extensions, orientation, purity and real coordinates. R01 isolates what is not stated there. |
| StableHomotopyKTheory, open head | §§3.36–3.37, README:1352 and 1360: Serre-class and primitive-image rational Hurewicz theorems. The stated commutative Hopf-algebra extension remains a genuine contract. |
| EtaleDualityAndPerverseSheaves, open head | §§3.5–3.8,4.7,6.5; ordinary quartic Betti input at README:4651; compact-support trace paragraph at 7122 explicitly imports descended coefficients and extends to Weil data. |
| ComplexComparisonPartII, open head | C−1.1, README:699, scheme analytification and its chart construction. |
| InverseGaloisAndArithmeticFundamentalGroups, open head | IG.5.1, README:5220: configuration carriers, unit differences, all-characteristic torsor and complex comparison. |
| QWittVectors, open head | §1.4a, README:203: factors (1−a_dt^d)⁻¹, distinct from this roadmap's signed integer Euler exponents. |
| SmoothBundlesConnections, open head | B1 item 5, README:171: ordinary proper-submersion transport; finite-involution refinement is owned here. |
| CharacteristicClasses; TangentialBordism, open heads | C2 item 3 at README:658, C3 item 2 at 826; B4 item 3 at README:583. Euler/orientation/Wu foundations are imports. |

Roadmap-service output adds one header line; the open-head line numbers above remove that header. The current index contained 362 open pull requests. ArithmeticKTheory §3.4 was also opened at its head: it consumes the rational H-space comparison for arithmetic plus spaces, and does not own the bouquet calculation. WeilConjectures' integer Euler exponent in its functional equation is an Euler characteristic, not the §3.1 transform. No fully qualified acceptance declaration was found duplicated in another readable roadmap. No target needed moving downward in this round.

The board-packages index was read before ownership conclusions. The board checkout was searched, but its files do not certify other board heads. The relevant RealSurfacePeriodIndex head could not be fetched; that limitation is recorded below rather than converted into a missing-owner claim.

### Supplier contracts and order

All **12/12** gap slugs, suppliers, sections and needs sentences match the top-level `design/plan.json` gaps and README contracts. Each has a named earlier owner. Their additional generality or missing comparison is explicit; none asks this roadmap to re-plan the generic objects, and none duplicates a complete interface supplied at the inspected section. The configuration comparison, equivariant site operations, duality and supported Steenrod requests retain the compatibility maps needed for their respective single interfaces.

Acceptance is conditional on:

- `finite-group-borel-approximation`
- `finite-group-ext-stalk`
- `real-closed-semialgebraic-geometry`
- `configuration-cover-comparison`
- `configuration-carrier-generality`
- `semialgebraic-free-quotient-geometry`
- `semialgebraic-equivariant-sites`
- `semialgebraic-support-dimension`
- `semialgebraic-fixed-point-trace`
- `semialgebraic-duality-coefficients`
- `supported-steenrod-comparison`
- `rational-commutative-hspace-hopf`

The prescribed dependency check exited 0 and printed exactly:

```text
depcheck: 51 roadmaps, 586 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The additional §2.5 citation in R01 uses the same already-earlier SchemeAndStackFoundations supplier, so it adds no supplier-order edge. `roadmaps resolve` reported no unresolved cross-roadmap citations or roadmap Lean names; its library-name check was unavailable, so the library checks above were performed directly at the pins.

## Not verifiable

- **HILTON**, Theorem A pp.154–155 and Corollary 4.10 p.162: settled uncertified publisher text. No request was repeated. BS lines 2369–2380 corroborate the use but do not certify the original.
- **DIMCA**, Lemma 4: settled uncertified. The source's exact full hypotheses could not be checked; B19 line 1257 records its use, and the package gives an independent invariant-metric/horizontal-lift route with explicit hypotheses.
- **BRUMFIEL**, pp.163–169: settled uncertified. BW lines 2472–2473 corroborate the arbitrary-real-closed fixed-point-free application; the precise theorem remains a declared supplier contract.
- **SCHEIDERER**, Corollary 18.11: settled uncertified. BW lines 1012–1014 corroborate the affine relative torsion statement; the original locator was not certified.
- **KRASNOV**, Theorem 2.1: waived access. The γ/Stiefel–Whitney attribution was checked against BW lines 699–700, and the surface identities against MILNOR-STASHEFF, but Krasnov's original text was not read.
- **RealSurfacePeriodIndex board package**, supplied head `875bca4`: the requested README read returned HTTP 404. Its ownership at that head was not checked. This is not evidence that the package is absent. Other indexed board heads not present in this checkout were not certified by the local-package search.

No new missing-source request was created. These access limitations do not reopen settled citations.

## Source issues

- **Error** in BS at Lemma 7.6, printed p.944: the source says n>2 suffices for the full double-loop Betti formula; it should be n>3, since a nonempty bouquet of 2-spheres has infinitely many double-loop components; affects a stated result.
- **Misprint** in BS at proof of Lemma 7.4, printed p.942: the source pairs compact cohomology with ordinary weights and has a wrong intermediate compact degree; it should start with ordinary H^i and dualize to compact degree m+i; affects the proof.
- **Misprint** in BS at proof of Lemma 7.4, printed p.943: the source's final Euler product omits the factor exponents; it should retain exponent −e_k on each factor; affects the proof.
- **Misprint** in BS at equation (7.3), printed p.943: the source equates the full bivariate product with a single weighted diagonal; it should first project to that diagonal before writing this expansion; affects the proof.
- **Misprint** in BS at proof of Lemma 7.6, printed p.944: the source uses the smash symbol for the sphere bouquet; it should use the wedge of N spheres; affects nothing.
- **Error** in BW at equation (1.16), v3 p.12: the source states perfect duality for arbitrary finite-exponent locally constant sheaves; it should require finite stalks for both algebraic adjoint maps to be isomorphisms; affects a stated result.
- **Misprint** in B19 at Lemma 7.3, printed p.98: the source uses p*η+ψζ although the preceding lift has a=η−φζ; it should use p*η−ψζ with its stated ψ convention; affects a stated result.
- **Gap** in B19 at proof of diagram (7.4), printed p.99: the source uses injectivity of restriction on Q to extend equality of maps out of Q; it should use injectivity of restriction on their common target p*(ℤ/n); affects the proof.
- **Error** in B19 at diagram (7.8), printed p.100: the displayed degree-two reduction is treated as the unit map for all even n; it should multiply by n/2 modulo two, vanishing when four divides n; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a8a46238676a77a7dc43287c9481158afb300720", "job": "REV-PKG-AlgebraicTopologyPartII~3", "model": "gpt-6-astra", "worker": "chris-13"} -->
