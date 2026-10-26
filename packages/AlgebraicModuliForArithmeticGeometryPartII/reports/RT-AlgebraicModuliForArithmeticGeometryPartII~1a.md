<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1082#issuecomment-6428082792 -->
Red team round 1 pass a (codex) of a7c1e22

Verdict: needs_changes

1. **F01** (P2) The fibre-graph and rationality headlines are statable but absent

   **Location:** `packages/AlgebraicModuliForArithmeticGeometryPartII/Suggested.lean:19–20`; README §§4.8–4.9, lines 860 and 874. Claim: “fibre-graph … descent and rationality … lack that pairing and the proper Hilbert algebraic space.”

   **Claim:** Missing proof infrastructure is given as the reason to omit two end theorems whose statements need neither intersections nor Hilbert spaces.

   **Witness:** `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:59`, `Fiber.lean:37–46`, and `Mathlib/AlgebraicGeometry/ResidueField.lean:123` (`Scheme.Hom.residueFieldMap`); the file already defines `IsContraction`, `HasTrivialNumericalGaloisAction` and `componentGraph`.

   **Exact repair:** “Add admitted headline theorems for §§4.8 and 4.9 on native schemes: a smooth proper pure two-dimensional k-scheme with canonical k→Γ(S,O) an isomorphism, constant numerical Galois action, a proper k-target and a contraction to it. For every geometric point of the target whose fibre has dimension one, state a component-graph isomorphism with the closure-of-projection-image marking. If that geometric fibre is reducible, state that its image is closed and its residue-field map from k is bijective. Remove these two theorems from the unstatable list; add their names to the README.”

   **Repair test:** Blowing up a rational point of a smooth fibre gives two vertices and one edge on both sides; the residue-field map is k→k. A smooth fibre over a degree-two closed point has one geometric component, so the rationality implication has false antecedent. A nonsplit real conic-bundle fibre has two vertices over one, but fails constancy.

2. **F02** (P2) Projective contraction descent is also statable on native Proj

   **Location:** `packages/AlgebraicModuliForArithmeticGeometryPartII/Suggested.lean:13–15`; README §3.7, line 698. Claim: projective contraction descent lacks “relative global generation, the section algebra and relative Proj.”

   **Claim:** Those objects belong to the proof of §3.7, not its statement. Absolute projectivity over a field is a short predicate on existing carriers.

   **Witness:** `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Scheme.lean:854` defines Proj; `ProjectiveSpectrum/Basic.lean:151` defines `Proj.toSpecZero`; `Mathlib/RingTheory/MvPolynomial/Homogeneous.lean:87,613` supplies the polynomial grading. Closed immersions and both needed package predicates already exist.

   **Exact repair:** “Define projectivity over a field by the existence of a closed immersion, over that field, into Proj of the standard graded polynomial ring in n+1 variables, for some n. State §3.7 with `sorry`: under constant numerical Galois action, every projective-target contraction over an algebraic closure descends to a projective-target contraction over k, with a cartesian target square and the prescribed source equation. Use the native Proj construction and its structure map. Remove only projective contraction descent from the unstatable list; keep the section-ring dictionary there.”

   **Repair test:** For P¹×P¹ and its first projection, the descended target is P¹, embedded into itself. For P¹_ℂ viewed over ℝ, collapsing only one geometric component cannot descend, and the numerical-action hypothesis fails (swap on ℤ²). No relative section algebra is needed to express either instance.

3. **F03** (P2) A declared gap asks for an intersection identity already supplied

   **Location:** `packages/AlgebraicModuliForArithmeticGeometryPartII/README.md:59`; `design/plan.json`, gap `proper-bigness-birational-comparison`. Claim includes “prove ((π*L)^n·V′) = (L^n·V)”.

   **Claim:** The gap combines the missing section-growth estimate with an already owned consequence of proper cycle pushforward and the first-Chern projection formula.

   **Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:6655–6658,6708–6712`: proper pushforward has function-field degree weights and preserves degree; `proper_pushforward` commutes with c₁. Birationality gives π_*[V′]=[V].

   **Exact repair:** “Delete the top-intersection clause from the gap's `needs` in both README and plan.json. Retain its section-dimension inequalities. In §1.6 cite SchemeAndStackFoundations §§5.2–5.3 for ((π*L)^n·V′)=(L^n·V), obtained by iterating `proper_pushforward` and taking degree.”

   **Repair test:** For π:Bl_p(P²)→P² and L=O(1), both top intersections are 1. For n=0, a birational map of integral proper zero-dimensional schemes is an isomorphism, and both degrees are the same field degree. The retained section estimate is still a declared supplier contract.

## Verified sound

Read all 1,094 README lines and all 247 Suggested.lean lines. The inventory is **14 Lean declarations (7 definitions, 7 admitted theorems), 51 numbered mathematical target sections, 166 Check bullets, 70 distinct explicit source starting-line anchors across 14 works, and 10 cross-roadmap supplier-contract groups**. All 51 target locator bundles were resolved; the source table below also records chapter-qualified and theorem-number locators. The bold Summary and Checks labels introduce prose and tests, rather than additional named targets. Bibliographic bold labels are not mathematical targets.

Compared all 14 supplied elaborated signatures with their definitions and README statements. No required binder disappeared. No Lean command or build was run: the supplied signature extraction is the elaboration evidence. No admitted example, sorry'd data, free proposition standing for missing geometry, extra import, `set_option`, or theorem-level padding was found. The three missing end theorems in R01–R02 are distinct from this binder check.

The calculations below distinguish full scheme-theoretic pullbacks from reduced geometric components, actual Picard classes from numerical classes, and the integral quotient from its rational or real extension. In particular, the geometric index is not the usual gcd of closed-point degrees: a pointless real conic has geometric index 1 but Picard-degree image 2ℤ. No denominator in a kept target is zero: field degrees and geometric indices are positive, tensor exponents are positive, and Cartier multiples have positive index. Field hypotheses exclude the zero ring; proper field schemes include the empty scheme. Properness supplies quasi-separatedness; no statement silently extends a proper theorem to a non-quasi-separated scheme. Nonabelian groups do not enter the abelian Picard quotient equivalence; the S₃ negative control below checks this boundary.

### Declaration and context table

Here `P(k,X,x)` means `[Field k]`, `X : Scheme.{u}`, `x : X ⟶ Spec k`, `[IsProper x]`. `A(k,K)` means fields k,K, `[Algebra k K]`, `[IsAlgClosure k K]`. These abbreviations describe this audit only. Each declaration's actual signature was inspected. All scheme and field carriers in these signatures use the same universe u; no `ULift` or hidden change of scheme universe occurs.

| Declaration; Lean line; README section | Variables and instances actually retained | Instances and computed values | Result / change |
|---|---|---|---|
| `NumericallyTrivial`; 41; §0.4 | P(k,X,x), invertible L; quantifies integral closed C of dimension 1; C's k-map is i≫x | P¹: O(−1),O,O(1) give −1,0,1, so false,true,false. Empty or finite X: no test curves, true. Double P¹: O(1) has reduced-test degree 1, despite full degree 2. | Definition detects the intended kernel. |
| `RelNumericallyTrivial`; 52; §0.4 | X,S,f,[IsProper f],L; every s:S, native fibre over κ(s); proper fibre instance explicit | id_S: every fibre is a point, all degrees 0. First projection P¹×P¹: O(1,0) gives 0; O(0,1) gives 1. | No Noetherian assumption needed to define it. |
| `numericallyTrivialClasses`; 65; §1.1 | P(k,X,x); subgroup closure of represented numerical classes | P¹ kernel {0} in Pic≅ℤ; elliptic curve kernel E(k̄)×{0}; Enriques canonical class of order 2 maps to 0. | Closure does not introduce additional classes once §0.4 proves subgroup laws. |
| `relNumericallyTrivialClasses`; 74; §1.1 | X,S,f,[IsProper f] | id_S kernel all Pic(S), quotient 0; projection kernel ℤ×{0}, quotient ℤ. | Real body, correct context. |
| `numericalClassGroup_free_finite`; 83; §1.2 | P(k,X,x); Additive of multiplicative quotient; free and finite over ℤ | P⁰: free rank 0; P¹,P²: free rank 1; double P¹: rank 1; E×E: ranks 3,4,6 as End ranks 1,2,4. | Deep acceptance theorem; no one-tactic proof at pins. |
| `relNumericalClassGroup_free_finite`; 94; §1.3 | X,S,f,[IsProper f],[IsNoetherian S] | Identity rank 0; P¹×P¹ projection rank 1; structure map rank 2. Non-Noetherian product-field base gives independent degree functions δ_n, hence infinite rank. | Essential finite-base context retained; conditional on declared finite-fibre reduction. |
| `HasTrivialNumericalGaloisAction`; 108; §2.7 | A(k,K), P(k,X,x); actual semilinear g constrained by both projections | P¹: σ fixes m∈ℤ. P¹_ℂ/ℝ: σ(1,0)=(0,1)≠(1,0). Finite X: action on 0. | Pullback universal property guarantees g exists uniquely; quantification is not vacuous. |
| `constantNumericalClasses_iff_positivePowerDescent`; 130; §2.10 | A(k,K), P(k,X,x); ∃d>0 precedes ∀L∃M | P¹ d=1; pointless real conic d=2, d=1 fails on class 1; P¹_ℂ/ℝ: (d,0) never diagonal for d>0; empty X d=1. | Both directions and uniformity tested; d=0 is excluded. |
| `numericallyTrivial_torsion_of_algebraic_finiteField`; 153; §2.12 | p,[Fact p.Prime], field k algebraic over ZMod p; P(k,X,x), L, numerical hypothesis | E/𝔽₂ example: group order 3; E/𝔽₃ example: order 4; finite X: identity, exponent 1. Infinite-order degree-zero class over ℚ̄ lies outside coefficient hypothesis. | Includes p=2,3, nilpotents and disconnected proper schemes. |
| `IsContraction`; 167; §3.1 | Arbitrary schemes X,Y and f; properness and section-map isomorphism on every open | Identity: id. P¹×P¹→P¹: O→O. Cusp normalization: k[t²,t³]→k[t] not onto. P¹_ℂ→Spec ℝ: ℝ→ℂ not iso. | Canonical map, not existence of an unrelated sheaf isomorphism. |
| `contraction_descends_purelyInseparable`; 175; §3.6 | Fields k,K, algebra, pure inseparability, proper X/k and Y′/K, contraction f′, over-base equation | Identity extension: v=id, f=f′; both squares commute. Inseparable degree p=2 or 3: underlying base-change map universal homeomorphism. Separable ℂ/ℝ one-component collapse fails to descend. | Both target cartesian square and marked source equation are present. |
| `componentGraph`; 196; §4.1 | Any Scheme X; vertices are its irreducible components; no Noetherian instance | Empty: 0 vertices; irreducible: 1 vertex,0 edges; xy=0: 2 vertices,1 edge; nonreduced double line: 1,0. | Wider domain is harmless; Noetherian finiteness is a theorem, not required by definition. |
| `constantNumericalClasses_iff_componentGraphDescent`; 213; §4.2 | A(k,K), P(k,X,x); every irreducible component has dimension 1; marked graph isomorphism | Two split lines: ℤ² trivial action and 2 vertices/1 edge on both sides. P¹_ℂ/ℝ: nonconstant and 2→1 vertices. P¹_ℝ⊔Spec ℂ: constancy but 3→2 vertices, excluded by purity. Empty: 0=0. | Purity, nonreduced tests and marking all necessary and present. |
| `lineBundle_lifts_completeDVR_of_h2_zero`; 232; §5.3 | R commutative domain, DVR, maximal-ideal adic completeness; proper flat x; actual special-fibre H² subsingleton; actual L | P¹_R: H²=0 and O(d) restricts to O(d), d=−1,0,1. Complete smooth elliptic model: H²=0. Abelian/K3 surface: h²=1, excluded. | Concludes an isomorphism of invertible modules, not merely equality of numerical classes. |

### Sampled adversarial computations

Representative rows from the completed target and Check audit follow. “Retain” means no additional defect was witnessed, not a formal proof.

| Target (README section and starting line) | Instances; values of the two sides / conditions | Result / change |
|---|---|---|
| §0.1, 97: curve pairing and component law | P¹: χ(O(m))−χ(O)=m+1−1=m. Tensor O(a+b): a+b; dual: −a. Double line: χ(O(1))−χ(O)=3−1=2×1. P¹_ℂ/ℝ: 2=1+1 after base change. Finite maps of degree n: deg pullback O(1)=n=n·1. | Retain residue-field and generic-length factors. |
| §0.2, 124: d_C divisibility | Geometrically integral C: d=1. P¹_ℂ/ℝ: r=2,m=1,d=2, degree 2=2·1. P¹ over degree-p purely inseparable constants: r=1,m=p,d=p, degree p=p·1, including p=2,3. | Retain; not the ordinary index. |
| §0.4, 153: relative kernel | id: all classes have degree 0; projection: kernel b=0 in (a,b); absolute product: a=b=0. E: O(p−q) has degree 0 but nonzero Picard class. | Retain subgroup/quotient distinction. |
| §1.3, 264: finite free relative lattice | Product absolute/relative ranks 2/1; identity 0. Infinite product-field base yields bounded integer sequences containing independent δ_n. Two disjoint lines with degrees p,−p: Euler polynomial (n+p+1)+(n−p+1)=2n+2 but degrees nonzero. | Retain Noetherian hypothesis and declared component-reduction gap. |
| §1.6, 331: proper bigness and nef criterion | Pⁿ O(1): h⁰=binom(m+n,n), top=1. Dimension 0: h⁰(O)=field degree>0, m⁰=1. Positive-dimensional O: constant h⁰, top=0. Product O(1,0): h⁰=m+1, top=0 in dimension 2. | Mathematical claim retained; remove redundant gap clause by R03. |
| §2.4, 417: actual Picard versus sheaf points | Pointless real conic: image 2ℤ⊂ℤ, obstruction 1 mod 2; twice class lifts. P¹_ℂ/ℝ: constants ℂ, Br=0, image all ℤ. | Retain Br(X^aff), not unconditional Br(k). |
| §2.6, 445: numerical local system | P¹ lattice ℤ, trivial; P¹_ℂ/ℝ lattice ℤ², swap; finite scheme lattice 0. Conic sheaf points ℤ but actual image 2ℤ. S₃ products (12)(23)=(123)≠(132)=(23)(12). | Continuous finite-image action correct; nonabelian S₃ excluded. |
| §2.10, 533: uniform power iff | P¹ d=1; conic d=2; nonconstant ℤ² swap has image diagonal and (d,0) outside for every d>0. Empty basis: product exponent 1 and quotient 0. | Retain and already stated in Lean. |
| §3.6, 685: inseparable descent | Identity extension: f=f′. Degree 2 or 3 pure inseparability changes multiplicities, not topological fibres. Separable swap example cannot descend collapse of just one component. | Retain no constancy/projectivity hypothesis. |
| §3.7, 698: projective contraction descent | P¹×P¹ first projection descends to P¹. Conjugation-swapped components with only one collapsed fail both constancy and descent. | R02: add missing headline on native Proj. |
| §4.2, 760: curve graph iff | Split crossing lines: trivial action on ℤ², graph 2/1 on both sides. Mixed-dimensional P¹_ℝ⊔Spec ℂ: constancy true, graph 3→2, excluded. Double P¹: graph 1/0, reduced degree 1/full degree 2. | Both directions, purity and source marking correct. |
| §4.6, 830: Zariski fibre matrix | I₂: q(a,b)=−2(a−b)², radical (a,a); singleton [−2] negative definite. One component [0], no negative diagonal conclusion. | Connectedness, positive multiplicity kernel and proper-subset clause correct. |
| §4.8, 860: fibre graphs | Rational blow-up fibre: 2 vertices,1 edge over both fields, matrix [[−1,1],[1,−1]]. Nonsplit conic fibre: 2→1 vertices and nonconstant action. | R01: theorem is statable at pins. |
| §4.9, 874: reducible image rationality | Rational blow-up fibre: κ(a)=k, degree 1. Smooth fibre over degree-two point: one geometric component, antecedent false. Negative descended component D has H⁰(D,O)=k, so κ(a) embeds in k over k. | Stronger conclusion than SCH23 follows from declared Hilbert contract; R01 for acceptance statement. |
| §5.2, 934: numerical versus actual restriction | Elliptic 11a1: rational group order 5, special order 10. Outside-image degree-zero class has numerical value 0, so O lifts that value; exact class does not lift; tenth power is trivial. | Correctly does not claim failure of every positive power. |
| §5.3, 947: complete-DVR lifts | P¹_R O(d),d=−1,0,1: restrictions have same d; H²=0. Abelian/K3 surface h²=1 violates hypothesis. Special degree-positive lift remains ample by local-base openness. | Actual lift stated; ampleness carrier properly deferred. |
| §5.5, 972: nef-big special→generic | O(1): top 1 on both fibres. Three-point blow-up: H²=4−1−1−1=1 on both, special H·ℓ=2−1−1−1=−1; generic nef. | Direction correct; flatness and integral fibre hypotheses retained. |
| §5.9, 1033: AHK and relative extension | P²: 1=2−1 on blow-up; point 0; quadric surface cone: 2−1=1; projective threefold quadric cone: 2−0=2 despite Cartier rank 1. Surface slicing n=e+2 needs 0 extra cuts. | Retain characteristic-zero resolution supply and conditional relative degree witnesses; integer subtraction. |

### Headline coverage and the one-tactic probe

| Headline | Acceptance-test disposition |
|---|---|
| Absolute and relative numerical Néron–Severi finiteness, §§1.2–1.3 | Both stated on actual Picard quotients. |
| Arbitrary proper Picard representability and finite-type τ, §§2.1,2.5 | Named in module docstring; fppf Picard/group-scheme carriers absent. |
| Affinization-valued Brauer obstruction, §§2.2–2.4 | Named; required fppf units/Leray interface absent. |
| Uniform positive-power criterion, §2.10 | Stated with exponent before the line-bundle quantifier. |
| Locally finite-field numerical torsion, §2.12 | Stated on actual invertible sheaves. |
| Semiample contraction dictionary and numerical uniqueness, §§3.3–3.4 | Named; section algebra/global-generation constructions absent. |
| Purely inseparable contraction descent, §3.6 | Stated with both marked squares. |
| Projective contraction descent, §3.7 | Missing despite simple native statement: R02. |
| Algebraic-space ampleness locus, §3.8 | Named; algebraic-space and relative ampleness interfaces absent. |
| Geometric exceptional negativity and Zariski lemma, §§4.5–4.6 | Named; surface intersection pairing absent. Supplied matrix theorems would be padding, and were not restated. |
| Curve numerical-constancy/graph criterion, §4.2 | Stated on actual irreducible-component graph. |
| Negative-curve descent, §4.7 | Named; the negative self-intersection predicate is absent. |
| Surface fibre-graph descent and rational reducible images, §§4.8–4.9 | Both missing despite native statements: R01. |
| Intersection-label descent, §4.10 | Named; intersection labels lack their geometric pairing. |
| Complete-DVR actual lifting, §5.3 | Stated. Additional ampleness assertion named as unstatable. |
| DVR cone comparison, §§5.1–5.4 | Named; real curve-class cones and geometric restriction interface absent. |
| Nef-and-big specialization, §5.5 | Named; nef, big and relative projectivity interfaces absent. |
| Semiample and vertical numerical descent, §§5.6–5.7 | Named; required positivity/Cartier-pullback predicates absent. |
| AHK independence and transformation, §5.9 | Named; exceptional-divisor data and resolution comparison absent. |

For each of the seven admitted theorems, the conclusion requires geometric descent, finiteness or cohomological existence not provided by one library lemma. The seven definitions have real native-carrier bodies and are used in those theorems. The file does not repeat the easy degree-zero, quotient-universal-property, graph-looplessness, zero-rank or matrix calculations from the README. In particular, the proofs of `componentGraph`'s structure fields do not constitute separate admitted padding declarations.

### Supplier, ownership and direction ledger

The library pins checked were Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, matching the supplied manifest. The ten supplier groups are Mathlib; Tau Ceti; SchemeAndStackFoundations; AlgebraicModuliForArithmeticGeometry; ComplexComparisonPartII; the combined JacobianChallenge/StableReduction contract; AlgebraicVectorBundles; AbundanceStatement; EtaleCohomologyFoundations; and ResolutionOfSingularitiesCharacteristicZero. Named sections and declarations were resolved at the available main copies or current supplier heads, not inferred from the names. The resolver's apparent missing `Num.free_finiteRank` is not a finding: it is explicitly planned at `TauCetiRoadmap/SchemeAndStackFoundations/README.md:7206,7220` on main.

| Supplier / object | Verified owner and boundary |
|---|---|
| Native schemes, section maps, properness, fibres | `Mathlib/AlgebraicGeometry/Scheme.lean`; `Morphisms/Proper.lean:41,82`; `Fiber.lean:37–46`. Proper means separated, universally closed and locally finite type; it does not mean flat, nonempty or geometrically connected. |
| Flatness, Noetherianity, rank | `Mathlib/AlgebraicGeometry/Morphisms/Flat.lean:42`, `Noetherian.lean:277`, `Morphisms/FlatRank.lean:88`; the rank-local-constancy use retains finite, flat and locally finitely presented assumptions. |
| Semilocal Picard and closure/field tower | `Mathlib/RingTheory/PicardGroup.lean:545` is the finite-MaximalSpectrum triviality instance. Pure inseparability and separable-closure declarations exist at the pin; the Galois intermediate extension requires normality, as stated in the README. |
| Generic quotient and graph carriers | Native `Subgroup.closure`, `Additive`, `Module.Free`, `Module.Finite`, `QuotientAddGroup.lift`, `CategoryTheory.Limits.cokernel.desc`, `SimpleGraph`, `irreducibleComponents`. The new graph changes adjacency, not the graph carrier. |
| Invertible sheaves, class quotient, pullback and Euler degree | `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean`, `Class.lean`, `Pullback.lean`, `Degree.lean:70–72,126–128`. Euler degree is truncated H⁰−H¹, not unrestricted geometric degree; the package applies proper curve finiteness/vanishing. |
| Integral-curve divisor comparison and additivity | `TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/EulerCharacteristic.lean:303,343`: `InvertibleSheaf.eulerDegree_eq_relativeDegree`, `LineBundleClass.eulerDegree_mul`, with local-DVR and cohomological finiteness hypotheses. Singular-curve additivity is supplied separately, not attributed to these more restrictive declarations. |
| Matrix inequalities | `TauCeti/LinearAlgebra/Matrix/NegSemidef.lean:91,104` and `TauCeti/AlgebraicGeometry/Curves/StableReduction/NumericalType/IntersectionForm.lean:163`. For [[−1,1],[1,−1]], positive kernel (1,1), q(1,0)=−1 and q(1,1)=0 agree with the package sign. |
| SchemeAndStackFoundations field limits/descent | §§0.9,0.11,0.23 and Layer 1; finite-presentation descent and unramified criteria at README 848–970. The Hilbert-space existence/tangent extension is declared separately. |
| Cohomology/topologies/norms | SchemeAndStackFoundations §§2.1–2.2,2.6,2.10–2.11,2.15,2.22,3.5. `finite_pushforward_exact` at README 3674–3680 is for small étale abelian sheaves, exactly the contract used here; no general finite fppf exactness is consumed. |
| Stein/formal existence/Chow | SchemeAndStackFoundations §§4.9–4.12, README 5448–5650. The proper complete-DVR lifting application supplies flatness and H² vanishing itself. |
| Intersection ownership | SchemeAndStackFoundations §§5.2–5.3,5.9–5.10. Surface Num is restricted to the supplied smooth projective algebraically closed setting; proper all-field Num here is an extension. R03 identifies the single redundant gap clause. |
| Parent moduli roadmap | AlgebraicModuliForArithmeticGeometry §§1.4–1.6,2.1,Layer 3,7.3,7.6.1–7.6.1a,7.9. `bigLineBundle` is projective geometrically integral; `picard_infinitesimal_lifting` specifies proper flat small Artinian thickenings and framed lifts. Parent Hilbert schemes do not supply the nonprojective proper Hilbert algebraic space. |
| Relative Picard owner | ComplexComparisonPartII C3.2d.2,d.4,e,f.1,f.2: representability requires universal functions; τ component requires projective flat geometrically integral fibres over a locally Noetherian base. The package keeps those scopes and owns the arbitrary proper-field extension. |
| Curve degree and regular models | JacobianChallenge Layers A–D; StableReduction Layers 1,2 (J-A2),4. The χ(L)−χ(O), sign, field-degree and nodal normalization conventions agree. The general component graph here is a simple graph, not the existing nodal dual multigraph. |
| Relative Spec / vector-bundle operations | AlgebraicVectorBundles L0A–L0C,L1A–L1B, README 215–306. Affinization here is an application retaining nonreduced constants, not a duplicate relative Spec construction. |
| Characteristic-zero projective positivity | AbundanceStatement Layers 4A–4D and 5; the section ordering separates global generation from Kleiman's criterion. Arbitrary-field proper/relative positivity here exceeds that domain. |
| Étale finiteness | EtaleCohomologyFoundations F.3, README 691–704: proper finite-type schemes over separably closed fields, finite coefficients with invertible annihilator; bounded finite cohomology. This supplies H²(μ_ℓ) without a surface-only restriction. |
| Resolutions | ResolutionOfSingularitiesCharacteristicZero §7.8: characteristic-zero field specialization. A common smooth domination is obtained by resolving the graph closure. The positive-characteristic relative claim explicitly assumes regular resolutions and common dominations. |

Ownership searches used the roadmap index by object and then the actual files. Direct searches also covered active and completed main roadmaps, board packages, and all 55 supplied sibling checkouts. No other fully qualified declaration matching any of the 14 package declarations was found. A separate indexed Lean search for the numerical-class, graph, contraction and complete-DVR theorem names returned “no match on main or in any open roadmap pull request”; the board package itself is the declaration site being reviewed.

The nearest open-work overlap is a **consumer request**, not a second construction: `TauCetiRoadmap/EnriquesSurfacesAndIntegralNonexistence/README.md:81` asks SchemeAndStackFoundations for `gap:numerical-contraction-descent`; its uses at lines 697,705,947,957 are still conditional requests. This package supplies the proper-field part of that mathematical need earlier in the order. It does not claim the consumer's additional relative-family representability. K3SurfacesAndSymplecticBoundedness requests arbitrary-field numerical inputs, rather than supplying a premise to this package. Neither later consumer is introduced as a supplier here. AbelianSchemesAndArithmeticModuliPartII consumes the existing Picard/abelian-scheme geometry and does not own this arbitrary proper numerical extension. No ownership relocation or new upward edge is required for these applications.

### Declared-gap audit

All six slugs occur both in README supplier subsections and in the top-level `design/plan.json` gaps list, with named suppliers. Absence of their future implementations is not a finding. No supplier is `none`.

| Gap | Contract precision / minimality and test |
|---|---|
| `relative-numerical-component-reduction` | Proper f, Noetherian S, finitely many points independent of L; tests each integral component. On two disjoint lines, (1,−1) fails despite zero total degree. No circular reference to this package's numerical quotient. |
| `proper-bigness-birational-comparison` | Section estimate is precise: difference ≤Cm^(n−1), n≥1, m≥1. Top-intersection identity already follows from the supplier projection formula: R03. Blow-up hyperplane gives 1=1. |
| `proper-picard-nonflat-descent` | Field/proper/surjective domain and quasi-affine finite-type pullback are specified, with Kleiman 4.18.3 for the representability step. Nilpotent reductions are included; Spec k→Spec k[ε]/ε² tests nilpotent reduction, with both Picard sheaves zero and a nontrivial constants algebra on the thickening. |
| `proper-hilbert-space-tangent` | Proper flat finitely presented subschemes in separated finitely presented ambient scheme; tangent Hom(I,O). A negative Cartier curve has tangent H⁰(O_C(C))=0, the exact rigidity input. |
| `relative-exceptional-degree-witnesses` | Projective birational regular→normal, all fields, every nonzero rational exceptional combination, compatible with field extension. Rational blow-up E has degree −1 on E; nonreal centre degree −2, becoming sum of two −1 witnesses. |
| `projective-nef-big-criterion` | Integral projective scheme, arbitrary field, nonnegative all curve degrees; positive top intersection iff positive m^n growth along multiples of a>0. O(1) on P² gives top 1/growth 1/2; O(1,0) on P¹×P¹ gives top 0/quadratic coefficient 0. |

The exact dependency-check command specified in the brief was run without changing README or the order file. Its complete diagnostic output was:

```text
depcheck: 56 roadmaps, 645 edges, 0 problem(s)
```

Exit status 0; no UPWARD, CYCLE or moved line. This checks direction, not whether a cited theorem has the required hypotheses; the latter was checked separately above. `git diff --stat origin/main...HEAD` showed nine changed files, all inside `packages/AlgebraicModuliForArithmeticGeometryPartII/`, with 2,708 insertions and 51 deletions. There is no package-scope violation. No previous report marked any finding examined here “not actionable in this package”; none of R01–R03 is a re-raised settled finding.

### Source locator ledger

Numbers in this table are extraction-line locators, not copied source passages. STACKS entries identify the chapter because the cached work has several chapter files. The tally of 70 counts the distinct explicit source starting-line anchors in the README, not repeated occurrences; supplementary theorem/tag lookups below are additional.

| Source | Locations personally read and support checked |
|---|---|
| SCH23 | Lines 167–231: proper Picard, numerical local system, positive-power argument and obstruction; 232–311: graph criterion and contraction descent; 313–410: finite-algebra Brauer proof and surface fibre theorem; 526–554: Enriques τ classifications; 697–715: Picard exact sequence for doubling. |
| KLE05 | Lines 980–1040: Picard/Leray comparison; 1600–1750: 4.18.1–4.18.5 and proper-field representability; 2219–2255: 5.19 lifting; 2480–2580: numerical definition/6.3; 2700–2890: 6.14,6.16,6.19 and reducible-fibre warning. The manifest explicitly selects preprint numbering. |
| BMP23 | Lines 805–845: curve pairing and numerical quotient finiteness; 1122–1130: geometric degree factor; 1170–1186 and 4789–4810: dlt numerical descent has stronger hypotheses than §5.6; 1222–1230: application of CT; 5250–5298: normalized extremal degree. |
| HW23 | Lines 80–120: numerical surjectivity hypotheses and failure of automatic surjectivity; 542: use of AHK rank; 1406 onward: complete-DVR lifting; 1490–1560: nef-big specialization and cone comparison. The roadmap does not import the surrounding MMP theorem's stronger application as a general lemma. |
| WIT22 | Lines 319–344: definitions and finite-pullback lemma; 1513 onward: Proposition 5.3; 1793–1830: Proposition 6.6 and CT application. EWM construction is explicitly outside this package. |
| DW22 | Lines 423–435: geometric index; 507–534: curve-degree comparison. The extracted fraction's typography is noted below; the numerical factor was independently checked on separable and inseparable examples. |
| CT20 | Lines 630–702: all four hypotheses of Lemma 2.17 and the vertical-divisor proof, including the use of a curve through a section zero. |
| AHK07 | Line 63: complex ground-field convention; lines 135–154: independence, exceptional-divisor argument and dimension slicing. Projective small resolution and zero-dimensional controls separate AHK rank from Cartier rank. |
| LIP69 | Lines 1110–1195: local intersection normalization and §14, especially line 1167, Lemma 14.1. The residue-degree factor is retained. |
| EGA-IV3 | Lines 980–1015: 8.8.2 finite-presentation limit descent; 1350–1388: 8.10.5 properties at finite stage. |
| STACKS | Varieties lines 4474–4505 (0AYW),4676 onward (0BEL),4790–4818 (0BET),1320–1342 (0BDG); Algebra lines 13506–13515 (00PH); Semistable Reduction lines 2970–3038 (0C66); Divisors on Algebraic Spaces lines 1388–1420 (0D3A); Descent on Spaces lines 1003–1030 (0D3D); Quot and Hilbert Spaces lines 969–992 (0CZV),1165–1200 (0D01). |
| KEE99 | Lines 46–65: nef-big criterion in the projective setting; 373–390: Lemma 1.7; 677–686: numerical torsion over an algebraic closure of a finite field. The package uses proper finite-type Pic^τ to repair the proof issue listed below. |
| LMFDB11 | Lines 88–112,160–171: equation, conductor 11, rank zero and rational torsion order 5. The 𝔽₇ count was recomputed by substituting all seven x-values. |
| PS12 | Lines 98–112,421–452: abelian effective/nef cones and the symmetric-matrix description; determinant and irrational-ray calculations are independent arithmetic. Preprint v1 locators are the manifest's stated version. |

## Not verifiable

- No fresh Lean elaboration was performed because this job forbids running Lean builds. The provided 14 elaborated signatures were compared with the text; implementation/proof success, including the new signatures requested by R01–R02, remains future work.
- All six declared supplier extensions are contracts, not completed proofs at the pins. Conditional proof-route acceptance is subject to their delivery; R03 concerns only a clause already supplied elsewhere.
- The cached DW22 text extraction collapses a displayed fraction in Lemma 3.6/4.1. Its intended degree ratio is recoverable mathematically, and the roadmap's multiplicity formula passes the explicit examples, but a claimed typographical error in the printed fraction would require visual inspection. No source erratum is asserted for that extraction artifact.
- Published versions or corrigenda beyond the legally cached, version-identified texts were not compared. No undocumented published correction is claimed. All cited works needed for this pass were available in the supplied cache; no missing-reference request was necessary.
- Ownership checks against open work are limited to the supplied sibling checkouts and the index results used to locate named suppliers. Unprovided open-head files were not independently audited. Search absence is not a proof of absence of semantically equivalent work under unrelated vocabulary.

## Source issues

- **Misprint** in SCH23 at Lemma 1.1, printed p. 5, SCH23 line 192: the source says the uniform exponent may be zero; it should be strictly positive, since zero makes descent automatic for nonconstant numerical local systems; affects a stated result.
- **Misprint** in SCH23 at proof of Lemma 1.1, printed p. 5, SCH23 line 205: the source says P′ is the full Picard scheme after extension; it should be the base-changed numerical torsion component for the displayed norm into P; affects the proof.
- **Gap** in SCH23 at proof of Lemma 1.1, printed p. 5, SCH23 lines 216–217: the source says the higher direct image for P′ vanishes by the later multiplicative-group argument; it should be replaced by the five-term injection, which proves the torsor step without that unsupported extension; affects the proof.
- **Error** in SCH23 at component-graph paragraph, printed p. 6, SCH23 lines 234–238: the source says component-preserving flat maps send edges to edges; it should be allowed to collapse adjacent vertices, as complexification of real conjugate axes does; affects a stated result.
- **Error** in SCH23 at Proposition 1.2, printed p. 6, SCH23 line 239: the source says dimension one suffices for numerical constancy to detect every graph vertex; it should be pure dimension one, excluding finite components invisible to numerical classes; affects a stated result.
- **Misprint** in SCH23 at proof of Proposition 1.2, printed p. 6, SCH23 line 254: the source says to choose the initial Cartier divisor on X along a selected geometric component; it should be chosen on the geometric base change before applying positive-power descent; affects the proof.
- **Misprint** in SCH23 at proof of Lemma 1.4, printed p. 8, SCH23 line 325: the source says the Leray edge goes from total-space H² to base H²; it should be the natural edge from base H² of the direct image to total-space H²; affects the proof.
- **Error** in SCH23 at surface-contraction cases, printed p. 8, SCH23 lines 343–345: the source says every contraction has a surface or curve target; it should be allowed to have target Spec k, including the structure contraction of P²; affects a stated result.
- **Misprint** in KLE05 at Example 6.23, printed p. 60, KLE05 line 2887: the source says two disjoint lines contribute constant term one to the Euler polynomial; it should be two, giving a+b+2n+2; affects a stated result.
- **Misprint** in CT20 at Lemma 2.17, printed p. 17, CT20 line 640: the source says the descended divisor lies on Y, which is not defined; it should be on the base S of f; affects a stated result.
- **Misprint** in AHK07 at proof of Lemma 1.6, printed p. 4, AHK07 line 147: the source says to take n−e+2 additional hyperplane cuts; it should be n−e−2, leaving dimension two after e target cuts; affects the proof.
- **Error** in AHK07 at Lemma 1.6(2), printed p. 4, AHK07 lines 143–144: the source says the birational numerical rank is always positive; it should be positive for positive-dimensional projective varieties, with value zero for a point; affects a stated result.
- **Error** in KEE99 at proof of Lemma 2.16, printed p. 270, KEE99 lines 680–684: the source says a fixed-Hilbert-polynomial Picard parameter space is proper and finite type for arbitrary projective schemes; it should use finite-type Pic^τ; nodal Pic⁰=G_m is nonproper, and reducible fixed-polynomial loci can be infinite type; affects the proof.
- **Error** in WIT22 at Lemma 2.1, printed pp. 7–8, WIT22 lines 333–341: the source says finite pullback detects bigness without surjectivity; it should require surjectivity, since a point in P¹×P¹ makes O(1,0) big after pullback but not before; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a7c1e22db88827b0c161366c06df97a830abbc8f", "job": "RT-AlgebraicModuliForArithmeticGeometryPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
