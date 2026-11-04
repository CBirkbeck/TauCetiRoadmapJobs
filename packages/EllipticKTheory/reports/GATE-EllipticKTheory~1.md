## H01 (CBirkbeck) — applied

TauCetiRoadmap/EllipticKTheory/README.md:1864 changes the canonical global model category from a separate bundle to the proper/regular full subcategory of RelativeJacobiansAndIntegralCurveModels §0.1; the retained native bundle is explicitly an acceptance adapter, with regularProperModelEquivalence at line 1882 preserving total schemes, structure maps, generic markings, morphisms, localisation and outgoing minimality. Section 6.2 transports the supplier's §5.1 existence theorem through this equivalence at line 1951, §6.3 uses the supplier's morphisms and uniqueness, and TauCetiRoadmap/EllipticKTheory/Suggested.lean:24 documents the adapter and why its equivalence cannot be stated at the pins.

## H02 (CBirkbeck) — applied

TauCetiRoadmap/EllipticKTheory/README.md:2541 changes “three rational points” to “three distinct rational points”, matching ddz line 348 and Proposition 4.3(1) at ddz line 365. The added Check at line 2544 computes the repeated-point normalizer as 0 and the normalizers for the distinct triple O, (0,0), (1,0) as 1, −1, 1.

## H03 (CBirkbeck) — applied

TauCetiRoadmap/EllipticKTheory/README.md:338 imports SchemeKTheoryOperations §2.7's qcqs scheme continuity, replacing the ring-continuity citation in the geometric-curve limit at line 1674 and the S-integer exhaustion at line 2118, with affine-transition and qcqs hypotheses made explicit. Line 1650 specifies compatibility with restriction, coefficient connecting maps and Galois pullback while retaining GeneralAlgebraicKTheory §3.2 for fields, and the same scheme-continuity input is added to the dense-open limit in §6.10 at line 2220 and to the layer dependencies.

## H04 (CBirkbeck) — applied differently

TauCetiRoadmap/EllipticKTheory/README.md:77 records the verified declarations at Tau Ceti revision 271e1af4dd54c50b9192cf3e213b7686843a0b3a as reuse inputs, distinguishes them from the acceptance pin a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, and retains the chart, H¹, order/residue and compatibility work. The geometric-integrality acceptance theorem remains because it is statable and absent at that pin; dimension one for singular cubics also remains because the cited newer topologicalKrullDim_projModel requires W.IsElliptic (TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/Smooth.lean:224), whereas Stacks 53.9.2–53.9.3 cover the general cubic (stacks line 211644 and stacks line 211655).

## H05 (CBirkbeck) — applied

TauCetiRoadmap/EllipticKTheory/README.md:34 and line 369 assign finite generation of the Milnor tame-residue kernels, the p-rank and characteristic-prime divisibility inputs to K2SymbolsBrauer §10.32c; tameKernel_finite at line 1584 becomes the scheme-K₂ corollary via Matsumoto and the tame-boundary comparison. Its argument uses the supplier's finite generation and divisibility with absence of p-torsion (weibel line 13711), while curveFiniteGeneration remains the independent higher-degree input to Harder's theorem.

---

Build command: `lake build TauCetiRoadmap.EllipticKTheory.Suggested`.
Build outcome: exit 0; `Build completed successfully (9059 jobs).` Seven expected warnings report the seven admitted headline theorems.

Final gate outcome: exit 0.

```text
gate EllipticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency-direction output (exit 0):

```text
depcheck: 43 roadmaps, 440 edges, 0 problem(s)
```

No UPWARD or CYCLE line was emitted; no move of ownership to a later supplier was needed. Commit: `7d208ea` (`EllipticKTheory: review repairs (model ownership, continuity, symbol hypotheses and upstream reuse)`); worktree clean; no push.

**Elaborated signatures.** All 15 declarations were put through `#check @name` in one scratch file and elaborated successfully, then compared with their README statements and the supplied baseline signatures. All 15 elaborated types are unchanged, with zero lost section binders: the seven headline theorems keep their required field, finite-field, ellipticity, finite-S, marking, annihilator and support hypotheses; only the adapter documentation changed in Lean.

**Ownership and citation evidence.** The ownership search covered main ae2562c, the open-roadmap index and supplied sibling checkouts, and the board's packages, by the objects “marked regular proper model”, “DedekindModel”, scheme continuity and function-field tame kernels. The relevant owners were read at their indexed heads: RelativeJacobiansAndIntegralCurveModels 25f1d2d §0.1 and §5.1 (TauCetiRoadmap/RelativeJacobiansAndIntegralCurveModels/README.md:93 and line 767), SchemeKTheoryOperations 88dbd5a §2.7 (TauCetiRoadmap/SchemeKTheoryOperations/README.md:627), K2SymbolsBrauer c844a11 §10.32c (TauCetiRoadmap/K2SymbolsBrauer/README.md:2487), and K2SymbolsBrauerPartII a63a852 §5.0c (TauCetiRoadmap/K2SymbolsBrauerPartII/README.md:681). The adapter equivalence belongs here because it identifies this acceptance presentation with the existing carrier, rather than introducing another global model theory; no Lean declaration was added or renamed.

The cross-roadmap resolver found no unresolved roadmap citations after editing. Its four initial name leads are accounted for: KGroup.ofRing_colimit is a planned GeneralAlgebraicKTheory §3.2 API, Scheme.K.pushforward_affine and Scheme.cartan_isEquiv_of_regular are planned SchemeKTheoryOperations §§2.3 and 2.6 APIs, and RegularProperModel.genericFibreInclusion is declared in TauCetiRoadmap/EllipticKTheory/Suggested.lean:122; none is an attempted import from another roadmap. The resolver did not check pinned external-library names, so the pin claims were checked directly: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 match both manifests; the later geometry declarations are absent at that Tau Ceti pin, whose Scheme/Integral.lean:60 supplies only total-space integrality and whose Scheme/Smooth.lean ends at line 187. The finite-presentation conversion is the pinned Mathlib/AlgebraicGeometry/Noetherian.lean:271, and the local marked-model carrier and morphisms are in TauCeti/AlgebraicGeometry/Curves/StableReduction/Model/Basic.lean.

**Source coverage.** The five findings were resolved using the supplied legal texts, roadmap contracts and locally held Tau Ceti revisions; no missing-reference request remains. Four ancillary citations already in the README but absent from the supplied source manifest were fetched legally and their source records retained separately because sources.toml is outside the permitted edits: barwick-polynomial line 61 (arXiv:2102.00936v2), kock-zanchetta line 1086 and line 1098 (arXiv:2110.06599v2; the README now explicitly cites that version), kahn-levine line 2220 (author preprint, Proposition 4.8.1), and quillen line 230 (institutional Oberwolfach report, p. 7). Bloch and Young retain their settled waived status, and Geisser–Levine and Grayson retain their settled uncertified status; no text was guessed or requested again.

**Adversarial mathematics pass.** The rows give explicit instances and values, including negative controls; they test statements, not the truth of their admitted proofs. Section references are to TauCetiRoadmap/EllipticKTheory/README.md. Abelian K-groups and elliptic point groups are the specified carriers, so nonabelian groups are outside these statements; q=1 is not a finite-field cardinality, and the zero ring is not a field.

| Statement | Instances tried | Values on the two sides or competing models | Result | Change |
| --- | --- | --- | --- | --- |
| Curve convention | ℙ¹ over a field; Spec F; doubled affine line | Dimensions 1, 0, 1; the doubled line fails separatedness | Domain distinguished | None |
| Elliptic scheme and origin convention | y²=x³−x over 𝔽₅; origin | Seven affine points plus O = eight; O=[0:1:0] has Z=0 and Y=1 | Origin retained | None |
| K versus G convention | A=F[ε]/ε²; regular field | Cartan on K₀(A)→G₀(A) is 1↦2; on a field 1↦1 | Regularity essential | None |
| Tame-boundary sign convention | ord(t)=1, residue(u)=2 | ∂{u,t}=2, ∂{t,u}=1/2; inverse convention interchanges these | Orientation fixed | None |
| Residue-unit convention | t²+1 over ℚ | Residue of t is i, outside ℚ; norm i=1 | Norm is not the value | None |
| Arithmetic Frobenius convention | y²=x³−x over 𝔽₃ | #E=4, a=0, determinant on Tate module 3; arithmetic H¹ determinant 1/3 | Dual action distinguished | None |
| Tate-twist convention | Same E, twist j=2 | Arithmetic H¹ determinant 3⁴/3=27; point twist i=1 multiplies Frobenius by 3 | Extra twist fixed | None |
| S-integer convention | F=ℚ, S=∅ and {2} | O=ℤ and ℤ[1/2]; 1/2 appears only in the latter | Finite-set direction fixed | None |
| Universe convention | Field, model and base in Type u | Native total scheme is Scheme.{u}; bundle lies in Type (u+1) in elaboration | No universe enlargement hidden | None |
| Coefficient convention | K₂(𝔽₃), mod 2 | Integral group 0; coefficient group K₂(𝔽₃;ℤ/2)=ℤ/2 | Coefficients distinguished | None |
| Weibel page convention | Printed pp. 146, 503 | PDF pp. 154, 511 respectively: difference eight in each case | Locator convention consistent | None |
| §1.1 charts | G at Y=Z=0; O | G=−X³ forces X=0; O lies in Y-chart and outside Z-chart | Two charts necessary | None |
| §1.1 cover | y²=x³−x over 𝔽₅ | Affine Z-chart seven points, union with Y-chart eight | Missing-origin model rejected | None |
| §1.1 zero-section chart | [0:1:0] | Y=1, Z=0, residue degree 1 | Correct chart and degree | None |
| EllipticScheme.geometricallyIntegral | Cuspidal y²=x³ over 𝔽₅ | Cubic remains irreducible over extensions; at (0,0) both partials vanish | Integrality survives lack of smoothness | Keep pin acceptance theorem |
| §1.2 dimension | Smooth and cuspidal plane cubics | Both dimension 1; cited newer dimension theorem requires ellipticity | Singular case still required | Clarify reuse boundary |
| §1.2 global functions | Projective cubic over F; zero base ring | Γ=F; over zero ring both global-section rings are zero | Constants comparison includes zero base | Record newer general-ring supplier |
| §1.2 H¹ and Euler characteristic | Plane cubic | Arithmetic genus (3−1)(3−2)/2=1; χ=1−1=0 | H¹ target retained | Clarify reuse boundary |
| §1.3 regularity | Smooth cubic; cusp at (0,0) | Smooth closed-point stalk: dimension 1, embedding dimension 1; cusp: dimension 1, embedding dimension 2 | Ellipticity needed | Reuse dimension/DVR results |
| §1.4 closed point/place | x²+2x+4=0, y=3 on y²=x³+1 | Discriminant −12; residue field ℚ(√−3), degree 2 on both sides | All closed points retained | Record newer point/place supplier |
| §1.4 valuation-ring comparison | Uniformiser t and t⁻¹ | Orders 1 and −1; t is in the stalk/valuation ring, t⁻¹ is in neither | Both directions tested | Retain order/residue compatibility |
| §1.4 origin place | O on a Weierstrass cubic | ord_O(x)=−2, ord_O(y)=−3, degree O=1 | Infinity convention preserved | None |
| §1.5 points/divisor diagram | P=(2,1) over 𝔽₅ on y²=x³−x | 2P=(0,0), −P=(2,4); P−O has coordinate P rather than −P | Sign distinguished | None |
| §1.5 ellipticity condition | y²=x³ over 𝔽₅ | Projective points six; nonsingular point group five | Singular model cannot use points equivalence | None |
| §1.6 isogeny degree diagram | Identity and [3] over ℚ | Degrees 1 and 9 on scheme and field sides | Degree normalisation agrees | None |
| §1.6 separability diagram | Identity and q-Frobenius | Differential 1 and 0; separable degree 1 in either degree-one identity or purely inseparable Frobenius | Differential criterion discriminates | None |
| §1.6 kernel diagram | [2] in characteristic ≠2 | Geometric kernel four points, generic rank 4 | Scheme/point ranks agree | None |
| §1.6 divisor-pullback diagram | t=s² at zero | Pullback [t=0]=2[s=0]; e f=2·1=2 | Ramification retained | None |
| §1.6 zero morphism | Constant map to O and to P≠O | Both trivialize pulled-back lines; values on O are O and P | Specified origin excludes wrong constant | None |
| §1.6 zero-map composition | Zero followed by [3] | [3](O)=O; identity sends generic point to itself | Composition and point law fix map | None |
| §2.1 rank/determinant | O and skyscraper at quadratic point on ℙ¹_ℚ | Coordinates (1,0), (0,2); generic ranks 1,0 | Rank/degree distinguished | None |
| §2.1 pullback naturality | t=s² and divisor [0] | Degree 1 downstairs becomes degree 2; pullback O(1)=O(2) | Determinant square agrees | None |
| §2.2 Euler characteristic definition | O(n) on ℙ¹, n=−2,−1,0 | H⁰−H¹=−1,0,1; n+1=−1,0,1 | Signs and negatives agree | None |
| §2.2 additivity | 0→O(−1)→O→O_x→0 at rational x | 0+1=1 | Additivity witness | None |
| §2.2 structure pushforward | O_E and O_E(O) on elliptic E | Euler values 0,1; pushforward values 0,1 | Elliptic genus used | None |
| §2.2 Riemann–Roch constants | ℙ¹_𝔽₄ regarded over 𝔽₂ | χ(O)=2, degree=0, genus=0; degree+χ(O)=2 while degree+1−g=1 | Exact-constant-field hypothesis retained | None |
| §2.3 divisor/Pic sign | O(x) on ℙ¹, x degree 2 | Divisor degree 2; line degree +2 rather than −2 | Positive sign fixed | None |
| §2.3 open restriction | ℙ¹ and 𝔸¹ | [∞] generates ℤ on ℙ¹ and disappears on 𝔸¹ with Pic=0 | Open square required | None |
| §2.4 Picard splitting | P and O on elliptic E | Coordinates of O(P), O(O): (1,P), (1,O) | Origin splitting fixed | Record newer Pic⁰ supplier |
| §2.4 degree-map generality | Real anisotropic conic | Degree image 2ℤ; degree-one invariant complex class has no real preimage | Rational-point condition needed | None |
| §2.5 injective descent | Nonzero real 2-torsion class on y²=x³−x | Class has order 2 before and after complexification | Injection does not collapse class | None |
| §2.5 surjective pointed descent | Same curve and real conic | Real torsion class descends; conic degree-one class does not | Pointed hypothesis separates cases | None |
| §2.6 square-zero product | (0,1,O) and itself | Product (0,0,O); coordinatewise degree product would be 1 | Correct ring retained | None |
| §2.7 K₀ compatibility | y²=x³−x over 𝔽₅ | Point count 8, group ℤ/4⊕ℤ/2; K₀=ℤ²⊕ℤ/4⊕ℤ/2 | Point coordinate agrees | None |
| §3.1 localization over all points | div(t²+1) on ℙ¹_ℚ | [quadratic point]−2[∞], weighted degree 2−2=0 | Rational-only sum fails | None |
| §3.1 localization rank tail | O on ℙ¹ | Rank 1, determinant degree 0 | Generic rank is not degree | None |
| §3.2 tame comparison | {t,t²+1} at quadratic point | Value i, swapped value −i; norms both 1 | Boundary sign and residue field agree | None |
| §3.3 divisor boundary | Uniformiser t | ord(t)=1; length R/tR=1 | Boundary coefficient +1 | None |
| §3.3 point transfer | Degree-two skyscraper | Rank 0, determinant degree 2 | Correct transfer class | None |
| §3.3 generic-rank surjectivity | Trivial bundle | Rank=1; skyscrapers have rank=0 | Rank tail exact in example | None |
| §3.4 open naturality | ℙ¹→𝔸¹→𝔾_m restrictions | [0]−[∞]→[0]→0 | Projection direction agrees | None |
| §3.5 finite-pullback naturality | t=s², u=2 | ∂{2,t}=2; pulled-back ∂{2,s²}=4=2² | e factor necessary | None |
| §3.6 finite-transfer naturality | ℚ(i)/ℚ, unit i | Norm(i)=1; restriction/transfer on 2 gives 4=2² | Norm differs from inclusion | None |
| §3.7 rational injectivity | ℙ¹_ℚ, infinity-supported {−1,−1} | Integral class nonzero of order 2, generic value 0; rational source class 0 | Integral strengthening rejected | None |
| §3.8 integral finite-field injectivity | ℙ¹_𝔽₂, quadratic residue point | K₂(ℙ¹)=0; {t,t²+t+1} residue θ of order 3, norm θ³=1 | Nonrational residue indispensable | None |
| §4.0a Adams construction | z=1−O(−1) on ℙ¹ | ψ²(z)=2z; ψ²ψ³(z)=6z=ψ⁶(z) | Identity operation excluded | None |
| §4.0a singular pullback | 1+ε over ℚ[ε]/ε²→ℚ | ψ²(1+ε)=1+2ε; both restricted values 1 | Singular input included | None |
| §4.0a product and rank | Spec ℚ, [2] in K₁ and rank 2 in K₀ | ψ²[2]=[4]; ψ²(2)=2 rather than 4 | Degree-dependent weights | None |
| §4.0b weight-one adapter | F=ℚ, unit 2 | H¹→ℚ× sends 2 to 2 with v₂=1; H⁰=H²=0 | Shift and zero-map control | None |
| §4.0b field continuity | 𝔽₂(s,t) and its own finite stage | {s,t} maps to ds/s∧dt/t≠0 at both stages; n=0 gives ℤ/2^ν | Diagonal and coefficients retained | None |
| §4.0b inseparable norm | 𝔽₂(t)/𝔽₂(t²) | Norm(t)=t²; dt/t≠0 in source | Inseparable transfers included | None |
| §4.0c tower Adams comparison | Rank class and z on ℙ¹ | ψ² rank=rank; ψ²z=2z; cycle degree +1 | Distinct weights fixed | None |
| §4.0c coefficient edge | Spec 𝔽₃, m=2 and m=1 | K₂(;ℤ/2)=ℤ/2, integral K₂/2=0; all m=1 groups 0 | Bockstein contribution retained | None |
| §4.1 image in function-field K₁ | Proper ℙ¹ and affine 𝔾_m | Proper image F×; affine image F××t^ℤ | Properness changes image | None |
| §4.1 SK₁ definition | ℙ¹_F, 𝔸¹_F | SK₁=F× and 0 respectively | Proper kernel nonzero | None |
| §4.1 SK₁ image-of-points | ℙ¹_𝔽₃, infinity unit −1 | Point pushforward generates ℤ/2=SK₁ | Point subgroup identified | None |
| §4.1 tame cokernel | Same ℙ¹_𝔽₃ | Cokernel F₃×=ℤ/2; norm of infinity unit −1 is −1 | Cokernel map fixed | None |
| §4.1 constant splitting | ℙ¹_𝔽₃ | K₁=(ℤ/2)²; pullback constant and infinity-supported −1 are separate factors | Split summands distinct | None |
| §4.1 norm law | Quadratic point with value i | π_*i_*(i)=N(i)=1 | Norm is not scalar value | None |
| §4.1 affine stable SK₁ | F[t], F[t,t⁻¹] | Determinant kernels both 0; latter K₁ has infinite t^ℤ part | Kernel is not full K₁ | None |
| §4.2 base-point pushforward | Rational infinity on ℙ¹ | π_*∞_*(−1)=−1 over 𝔽₃ | Retraction is identity | None |
| §4.2 V and splitting | ℙ¹_𝔽₃ | V=0; K₁=(ℤ/2)² | No third summand in example | None |
| §4.2 self-intersection | Point conormal line | λ₋₁=1−1=0, hence P^*P_*=0 | Sign fixed | None |
| §4.3 coniveau page | Spec F; dimension-one curve | Nonzero possible columns {0} and {0,1}; d₂ targets column ≥2=0 | Collapse bound correct | None |
| §4.3 filtration exact sequence | K₃ of ℙ¹_ℚ | Kernel and quotient each ℤ/48; total (ℤ/48)² | Extension term cannot disappear | None |
| §4.4 K₃ extension | Origin on 37a1 over ℚ | Origin-supported subgroup ℤ/48, plus base subgroup ℤ/48 | Generic map not injective | None |
| §4.5 rational weight comparison | K₀ of ℙ¹ | Rank weight 0, degree weight 1; two rational pieces | Weight indexing consistent | None |
| §4.5 regular-curve tower definition | ((y−x)²−t) over 𝔽₂(t) | Regular before extension; after √t ring is L[x,ε]/ε² with ε²=0 | Arbitrary regular field case retained | None |
| §4.5 tower layers | Rank and point class on ℙ¹ | Codimension 0 and 1, cycle coefficients 1 and +1 | Shared cycle normalisation | None |
| §4.5 convergence | ℙ¹, K₀ | Only weights 0,1 survive and yield ℤ² | Filtration accounts for whole group | None |
| §4.5 tower Adams law | Hyperplane class z | ψ²z=2z, ψ³z=3z | Weight-one multiplier | None |
| §4.5 smooth-tower comparison | ℙ¹ over 𝔽₂ | Both models have K₂=0, K₃=(ℤ/3)² | Same abutment on smooth input | None |
| §4.5 weight-filtration comparison | K₁(ℙ¹), k=2 | Constant-unit multiplier 2, infinity-unit multiplier 4 | Gysin adds one weight | None |
| §4.5 finite generalized weights | ℤ/25 with operation ×12 | Endpoints ×2; 12−2=10≠0, 10²=0 mod25 | Ordinary-eigenspace substitute fails | None |
| §4.5 rational denominators | K₀(ℙ²), z³=0 | Weight-one vector z+z²/2; integral eigenlattice index 2 | Integral splitting not asserted | None |
| §4.6 indecomposable K₃ | ℚ and number field with r₂=1 | Rational weight-two dimensions 0 and 1; residue Gysin shifts weights 2,3 to 3,4 | Curve/field pieces distinct | None |
| §5.1 transfer comparison | Finite field extension degree 2 | Pullback/transfer sends unit 2 to 2²=4 where defined; K₀ rank 1 to 2 | Restriction of scalars fixed | None |
| §5.1 finite-flat isogeny | Identity; [3] over ℚ | Locally free ranks 1,9; constant map has positive-dimensional fibre | Zero map excluded | None |
| §5.2 isogeny projection formula | [3]; separable degree-two isogeny | f_*f^*(1)=(9,0,O); (2,0,P_f), P_f≠O | Degree-only formula false in second case | None |
| §5.3 structure sheaf determinant | Degree-two étale cover | h⁰(O⊕L)=1, h⁰(L)=0, L²=O, L≠O | Nontrivial determinant retained | None |
| §5.3 rank/determinant action | y=(r,e,P) | (d,0,P_f)y=(dr,de,dP+rP_f); at y=1 gives (d,0,P_f) | Formula and unit agree | None |
| §5.3 separable rational case | Determinant of order 2 | 2P_f=O; P_f⊗ℚ=0 | Rational degree law justified | None |
| §5.3 odd multiplication | m=1,3 | Determinant killed by gcd(2,m)=1; ranks 1,9 | Integral law valid | None |
| §5.4 projective bundle | O, O(−1), O_∞ | Bundle coordinates (1,0),(0,1),(1,−1); rank/degree (1,0),(1,−1),(0,1) | Both coordinate maps agree | None |
| §5.4 finite-field projective line | ℙ¹_𝔽₂, i=1,2 | K₁=0, K₂=0, K₃=(ℤ/3)² | Even elliptic formula cannot transfer | None |
| §5.4 elliptic generation iff | 37a1 and y²+y=x³+x+1 over 𝔽₂ | Point groups order 5 and 1; extra K₀ torsion present only in first | Both directions distinguished | None |
| §5.5 coprime closed-point degrees | ℙ¹_𝔽₂, degrees 2 and 3 | Closed-point counts 1 and 2; gcd(2,3)=1 | Coprime degrees exist explicitly | None |
| §5.5 degree-one zero-cycle | [x₃]−[x₂]; zero cycle | Degrees 3−2=1 and 0 | Negative coefficient necessary | None |
| §5.5 zero-cycle splitting | Same degrees 3,2 | Weighted res/norm composite 3−2=1; a single degree-two point gives 2 | Correct retraction | None |
| §5.5 BMS | 𝔽₂[t], 𝔽₂[t,t⁻¹] | Stable SK₁=0 in both; K₁=0 and ℤ | Stable kernel separated from group | None |
| §5.5 Steinberg homology | Rank 1 over 𝔽₂[t], 𝔽₃[t], 𝔽₂[t,t⁻¹] | H₀=ℤ throughout; H₁=0,ℤ/2,ℤ respectively | Finite generation, not uniform finiteness | None |
| §5.5 curve finite generation | 𝔽₂[t,t⁻¹], n=1 | K₁=ℤ, generated by t but infinite | Independent higher-degree input kept | Keep ownership here |
| §5.5 exact reciprocity | ℙ¹_𝔽₂; ℙ¹_𝔽₃ | Norm targets 1 and {±1}; infinity unit −1 maps onto −1 | Surjectivity independent of zero composite | None |
| §5.5 Milnor-kernel ownership | 𝔽₂(t), projective model ℙ¹ | Scheme K₂=0 and all-place Milnor kernel=0; finite order 1 prime to 2 | Scheme corollary matches supplier | Use K2SymbolsBrauer §10.32c |
| §5.5 p-divisibility of kernel | ×3 on ℤ/2 and on free ℤ | On ℤ/2 it is identity; on ℤ cokernel ℤ/3 | Finite generation plus bijectivity forces rank 0 | Source inputs imported |
| §5.5 p-rank input | 𝔽₂(t); perfect closure | [F:F²]=2 versus 1; Ω²=0 in first | Global function-field hypotheses matter | Source input imported |
| §5.6 constant-field reduction | ℙ¹_𝔽₄ regarded over 𝔽₂ | Exact field 𝔽₄; K₁=(ℤ/3)² of order 9, not 1 | Base field must be corrected | None |
| §5.6 Harder | ℙ¹_𝔽₂; affine 𝔾_m | Positive K₃=(ℤ/3)² finite prime to 2; affine K₁=ℤ infinite | Properness essential | None |
| §5.6 disconnected case | ℙ¹_𝔽₂⊔ℙ¹_𝔽₄ | K₁=0×(ℤ/3)² of order 9 | Componentwise statement | None |
| §5.7 odd invariant | ℙ¹_𝔽₃, i=1, constant −1 | Retraction sends −1 to −1 rather than 1 | Zero map excluded | Continuity source corrected |
| §5.7 coefficient edge | ℙ¹_𝔽̄₃, ℓ=2, element of order 4 | Edge after section returns x; Frobenius sends x↦3x=−x on both paths | Section and Galois square fixed | Scheme continuity/naturality specified |
| §5.7 restriction/norm naturality | 𝔽₃→𝔽₉, unit −1 | Restriction −1; norm back (−1)⁴=1=(−1)² | Both constant summands agree | Retain ring continuity for fields |
| §5.7 inverse-limit hypotheses | ℙ¹_𝔽₂ through finite constant extensions | Transition degree ν'/ν is finite, hence affine; limit base is union of 𝔽_(2^ν) | Nonaffine curves satisfy scheme contract | Use SchemeKTheoryOperations §2.7 |
| §5.7 geometric G-modules | Geometric ℙ¹ | J=0 gives even integral group 0; odd integral group D(i)² | Geometric/projective-line cases agree | Scheme continuity source corrected |
| §5.7 integral/coefficient twists | Geometric elliptic curve, i=1 | Integral K₂ twist 1; coefficient K₁ twist 0 | No extra/missing Tate twist | None |
| §5.8 cohomology descent | ℙ¹ and elliptic E over 𝔽₃, j=2 | H¹ geometric ranks 0 and 2; rational Frobenius determinants 27 on elliptic H¹ | Weight argument covers both | None |
| §5.8 coefficient admissibility | μ₂ and μ₃ on ℙ¹_𝔽̄₂ | Étale H²(μ₂)=0; H²(μ₃)=ℤ/3 | Invertibility essential | None |
| §5.8 procyclic topology | Trivial action on ℤ/3, compact ℤ_ℓ, discrete ℤ | H¹=ℤ/3, ℤ_ℓ, 0; coinvariants in last case ℤ | Discrete free group excluded | None |
| §5.8 twist endpoint | j=0 on Spec 𝔽_q | Arithmetic H¹(ℚ_ℓ)=ℚ_ℓ; geometric H¹=0 | j≥2 not dropped | None |
| §5.9 positive descent | n=1 over 𝔽₂ and 𝔽₃ | Invariants of D(1)² have orders 1 and 4, matching K₁ | Base-change map tested | None |
| twistedFrobeniusKernel definition | Zero; rational 2-torsion over 𝔽₃ | Zero killed by m=1; 2-torsion satisfies 3P=P and gcd(2,3)=1 | Real subgroup body matches README | None |
| §5.10 addition and negation | Annihilator orders 2 and 3 prime to p=5 | Product annihilator 6 prime to 5; −P retains annihilator | Closure conditions valid | None |
| §5.10 characteristic torsion exclusion | (0,1) on y²+xy=x³+1 over 𝔽₂ | 2P=0, P≠0, πP=P; no odd annihilator | Untwisted p-torsion excluded | None |
| §5.10 i=0 boundary | Same ordinary curve with #E=4 | Prime-to-2 B₀ order 1; polynomial D₀=#E=4 | i≥1 needed for cardinality | None |
| card_twistedFrobeniusKernel | (q,a)=(2,−2),(2,2),(3,0), i=1 | 1+4+8=13; 1−4+8=5; 1+27=28 | Degree formula gives stated orders | None |
| §5.11 odd groups | q=2, i=1,2 | Orders (2−1)²=1 and (4−1)²=9 | K₁=0, K₃=(ℤ/3)² | None |
| §5.11 even-kernel/cokernel comparison | Lattice operator ×3 on ℤ₃ | Cokernel ℤ/3; kernel ×3 on ℚ₃/ℤ₃ has order 3; lattice kernel 0 | Lattice kernel is not substitute for torsion kernel | None |
| §5.11 even orders | (q,a)=(2,−2),(2,2), i=2 | 1+8+32=41; 1−8+32=25 | Order need not determine invariant factors | None |
| §5.11 prime-to-p assertion | D₁=13,5,28 for p=2,2,3 | Remainders 1,1,1 respectively | Characteristic excluded numerically | None |
| §6.1 marked adapter definition | 37a1 over ℤ and its field fibre | Generic marking equation is id over ℚ; at 37 total-space test F(5,18)=222=6·37≠0 mod37² | Singular fibre allowed | Identify canonical supplier category |
| §6.1 canonical proper/regular subcategory | Proper elliptic model versus deletion of a special-fibre point | Proper object retained; punctured object fails valuative extension of missing point | Properness not implicit in DedekindModel | Full subcategory specified |
| §6.1 finite-presentation conversion | Model over ℤ and field base | Proper ⇒ finite type; noetherian base ⇒ finite presentation; same generic curve in both directions | Adapter has required supplier field | Pin exact Mathlib equivalence |
| regularProperModelEquivalence | Smooth 37a1 over ℤ[1/37] | Each round trip has total scheme X, base map f, marking ι; unit/counit total map id_X | No unmarked replacement | Named equivalence added |
| Equivalence on hom sets | Identity and blow-down b | Underlying maps id and b on both sides; composition id∘b=b=b∘id | Underlying-map preservation fixes functors | Added API |
| Equivalence marking preservation | Identity versus elliptic involution | Generic (0,0) maps to (0,0) versus (0,−1) | Twisted marking cannot use identity hom | Added negative Check |
| Equivalence localisation | Blow-up at fibre-2 point, localise at 2 or 3 | At 2 exceptional ℙ¹_𝔽₂ remains; at 3 exceptional set empty | Local comparison detects vertical geometry | Added Check/API |
| Equivalence minimality iff | Minimal M; its point blow-up B | Outgoing maps from M are isomorphisms in either category; B→M has fibre ℙ¹ and is not iso in either | Both directions reflect same predicate | Added target |
| §6.1 nonregular Weierstrass control | 11a1 at (11,5,5) | F=0; derivatives divisible by 11; F∈m² | Proper flat equation is insufficient | None |
| §6.1 good-curve nonminimal equation | y²=x³−81x at (3,x,y) | Equation lies in m²; generic curve isomorphic to y²=x³−x with good reduction at 3 | Total-space regularity distinguished | None |
| §6.2 abstract model transport | Smooth model over ℤ[1/37] | Supplier total X and marking ι unchanged by inverse adapter; generic fibre E | Existence lands on acceptance carrier | Transport explicitly required |
| §6.2 excellent surface resolution | Spec ℤ[t]; xy=z² in char 0 | First identity; second vertex dimension 2 and embedding dimension 3 | Regular locus, not normal locus, preserved | None |
| §6.2 specified Weierstrass resolution | 37a1; 11a1 | 37a1 test 222/37=6 is unit; 11a1 test F=0 lies in m² | First identity, second changes bad point | None |
| RegularProperModel.genericFibreInclusion | Field base O=F, identity marking | i=ι⁻¹ followed by pullback projection; with ι=id, i=id | Direction correct | Adapter documentation |
| RegularProperModel.Hom | Identity and involution with fixed marking | id sends (0,0) to itself; involution sends it to (0,−1) | Second fails generic equation | Supplier ownership specified |
| §6.3 Hom uniqueness | Field base and fixed marking | Each hom-set has the one map ι_N⁻¹ι_M; endomorphism is id | Marking essential | Use supplier density theorem |
| RegularProperModel.IsMinimal | Smooth model and its blow-up at 2 | Smooth model minimal; blow-up has outgoing noniso with ℙ¹ exceptional fibre | Outgoing direction correct | Equivalence preservation specified |
| §6.3 local model bridge | Localise 37a1 at 2 | Same smooth total scheme over ℤ_(2), generic fibre E over ℚ | Native local carrier retained | Link supplier localisation |
| §6.4 common resolution | M and B=Bl_x M | Common X=B; maps b and id; generic maps both id_E | Markings survive factorisation | None |
| §6.5 locally minimal existence | Smooth model; one point blow-up | Zero contractions and one contraction respectively | Regularity not minimality | None |
| §6.5 global contraction | Blow-up of Spec ℤ[t] at (2,t) | Exceptional normal degree −1; smooth fibre normal degree 0 | Only exceptional curve contracts | None |
| §6.6 global blow-down factorisation | Blow-down b followed by id_M | Exceptional ℙ¹ maps to one point; factor is id_M | Required point condition present | None |
| locallyMinimal_terminal | X=M and X=Bl_x M | Unique maps id_M and b; each respects generic identity | Terminal arrow X→M correct | Adapter category identification |
| §6.6 local criterion | Nodal minimal 37a1 and point blow-up | Nodal irreducible fibre has no exceptional component; blow-up has one ℙ¹ with normal degree −1 | All three minimality criteria agree | None |
| exists_minimalRegularProperModel | F=ℚ, S=∅ and {37}, 37a1 | Nodal model and smooth model; same generic E and minimality true | Both finite S cases included | Supplier transport recorded |
| minimal_unique | M=N and marking-preserving comparisons | Unique endomorphism id; involution has generic value (0,−1) at (0,0), so excluded | Marked uniqueness correct | Adapter documentation |
| §6.7 inversion of primes | S=∅→{37}→{2,37} | Composite localises to ℤ[1/74]; S=S gives identity | Localisation direction/composition fixed | None |
| §6.8 integralPart definitions | Zero class; S=∅ | Zero lies in image; integralPartS(∅)=integralPart | Initial term correct | None |
| §6.8 finite-S exhaustion | Class from 𝓔[1/6], zero class | Stages {2,3},∅ respectively; union of finite localisations of ℤ is ℚ | Descent needs no infinite S object | Scheme continuity source corrected |
| §6.8 qcqs/affine hypotheses | 𝓔_{S'}→𝓔_S | Base is localisation; transition affine; each 𝓔_S proper over noetherian affine base hence qcqs | Nonaffine total schemes permitted | Explicit hypotheses added |
| §6.8 image monotonicity | ∅⊆{2}⊆{2,3} | Restriction composites give same class in K₂(E); zero maps to zero at each stage | Inclusion direction correct | None |
| §6.8 horizontal unramified image | Constant symbol {−1,3} | At horizontal places both orders 0, hence tame value 1 | Integral image is horizontally unramified | None |
| §6.8 model independence | b:B→M a point blow-up | On generic fibre b=id_E, so j^*b_*a=j'^*a; supported exceptional class has generic value 0 | G pushforward and regular Cartan give both inclusions | None |
| §6.9 good-prime equality | 37a1 at 2; good fibre over 𝔽₃ | Obstruction K₁ order (2−1)²=1 and (3−1)²=4; rational obstructions both 0 | Rational equality uniform; integral surjectivity at 2 | None |
| §6.10 fibre G₁ rank | Split I₁; nonsplit I₁ | Loop H₁=ℚ; Frobenius +1 or −1 gives invariant dimensions 1 or 0 | Branch orientation matters | None |
| §6.10 incidence graph | Type IV with three components through point | Four vertices, three edges, b₁=3−4+1=0; pairwise triangle gives 1 | Correct graph excludes false cycle | None |
| §6.10 vertical-residue iff | {−1,3} at multiplicity m; u=1/3 class | Values (−1)^m of order ≤2 versus 1/w of infinite order with divisor [∞]−[0] | Rational criterion distinguishes torsion | Scheme continuity cited for dense-open colimit |
| tameValue definition | f=t^a u, g=t^b w | Order of quotient ab−ba=0; for (a,b)=(1,0), residue w⁻¹ | Residue unit always well typed | None |
| §7.1 leading-unit formula | a=b=1, residues u=2,w=3 | (−1)·2/3=−2/3; replacing uniformiser by 5t cancels scale 5^(−1+1)=1 | Uniformiser independence tested | None |
| §7.1 unit-unit formula | Residues 2,3, a=b=0 | 2⁰/3⁰=1 | Both units required | None |
| §7.1 multiplicativity | {2·3,t} | 6=2·3 in residue field | Product law correct | None |
| §7.1 swap | {t,2} and {2,t} | 1/2 and 2, product 1 | Inverse orientation correct | None |
| §7.1 Steinberg | {t,1−t} at 0 and 1 | Residues 1 and 1 | f≠0,1 keeps entries units of field | None |
| §7.1 sign | {t,t}, residue characteristic 0 and 2 | −1 and 1 respectively | Sign cannot be suppressed generally | None |
| SymbolCandidate definition | Singleton Steinberg pair; zero sum | Formal coefficient 1 versus 0; K₂ image 0 in either | Formal carrier differs from quotient | None |
| SymbolCandidate.tame | α=[(2,t)]−[(3,t)] | Tame value 2/3; α−α gives 1 | Integer coefficients and negation handled | None |
| §7.2 SymbolCertificate definition | Empty candidate; singleton {2,t} | Empty candidate tame 1 everywhere; singleton residue 2≠1 | Empty support cannot certify nonunit residue | None |
| §7.2 existence iff | {x,y}+{−1,x} on 11a3; {x−1,−1} on 36a1 | First tame tuple (1,1,1,1); second value −1 at quadratic point, norm 1 | Both directions and wrong norm model tested | None |
| §7.2 soundness | Same 11a3 candidate | Each value (−1)² or 1²=1; field class is in kernel, hence curve image | Horizontal exactness used | None |
| §7.3 IntegralCertificate definition | Constants c,d∈O×; u=1/3 | Vertical values 1 versus ±1/w | Vertical data cannot be omitted | None |
| §7.3 soundness | 11a3, S'={11} | ord_D x=ord_D y=0 on each irreducible fibre, tame=1 | Model class integral rationally | None |
| tame_last_point | Last rational place; last quadratic place | Rational norm is identity; quadratic value −1 has norm 1 but value ≠1 | Degree-one hypothesis necessary | None |
| §7.4 inseparable reciprocity | {s,t²−s} over 𝔽₂(s) | Normed product s²·s⁻²=1; unweighted product s·s⁻²=s⁻¹≠1 | Inseparable multiplicity essential | None |
| §7.5 blochRho definition | C=1 and C=2 on y²=x³−x | Divisor 0 for constant; for 1/y divisor 3O−P₀−P₁−P₋₁, degree 0 | Aggregate has correct coefficients | None |
| §7.5 rational torsion principal functions | P=(0,0), C=2 | div(x)=2P−2O; P−O is not principal since P≠O | Annihilator factor necessary | None |
| §7.5 characteristic exclusion | Ordinary E/𝔽₂, C=2 | Two geometric points, nonzero point sum P≠O; prime-to-char full E[2] would have four points summing 0 | C coprime to characteristic needed | None |
| blochCorrection | C=3, raw residue 2 | Raw cubed value 8; correction 1/8; product 1; reversed correction gives 64 | Sign/order fixed | None |
| §7.6 zero/trivial subgroup | T={O}, S=∅, constants f,g, C=1 | Candidate constant symbol, every order 0, every tame value 1 | Degenerate subgroup included | None |
| §7.7 blochClassLift | C=3, formal A=3[s]+[t] | A/C has coefficients 1,1/3; C(A/C)=A | Divide after correction | None |
| §7.7 canonical quotient class | Constant change {s,t} over ℚ(s,t) | At t=0 residue s of infinite order; constant for elliptic base, killed only by constant quotient | Quotient not actual lift | None |
| §7.7 correction independence | div h=nD, ζ^n=1 | n{h,ζ}={h,ζ^n}={h,1}=0 | Tor contribution is actual torsion | None |
| §7.7 Bloch ICM comparison | Same C=3 formal A | ICM coefficients 3,1; divided class 1,1/3; multiplying divided class by 3 returns 3,1 | Factor C retained | None |
| §7.7 C=2 obstruction | {1/y,x} on y²=x³−x | Tame tuple (−1,1,−1,1); doubling tuple (1,1,1,1) | Undoubled integral correction not asserted | None |
| §7.7 not-twice point control | Quartic z⁴−4z³+2z²+4z+1 at z=±1 | Both values 4≠0 | Rational-root obstruction valid | None |
| §7.7 three-point hypothesis | P₁=P₂=O, P₃=(0,0) | Torsion differences orders 1,2,2; f₁=1/x has ord_O=2 and value 0 | Old condition permits zero denominator | Add distinctness and negative Check |
| §7.7 distinct three-point construction | O,(0,0),(1,0) | f₁=x/(x−1), f₂=x−1, f₃=1/x; normalizers 1,−1,1 | Every normalizer nonzero | Add positive Check |
| §7.7 rank-at-most-one relation | Same distinct triple | m₁=m₂=m₃=2, lcm/m_i=1 for each; S₁=S₂=S₃ modulo torsion | Span rank ≤1 | Add exact source locator |
| §7.7 C=1 class domain | E[1]={O} | Nonzero indexing set empty; no division by 0 since C=1 | Empty family valid | None |
| §7.8 norm-residue transfer | ℚ(√2), E:y²=x³−2x, β={x−√2,y} | At quadratic point norms multiply (1/4)(2x₀)=x₀/2=1/x₀ | Conjugation direction correct | None |
| §7.8 transfer/restriction | Same degree-two extension | res(Nβ)=β+σβ={x²−2,y}; N(res2)=4 | Degree and entry norms agree | None |
| §7.9 rational Galois descent | Group order 2, invariant β | res(Nβ/2)=(β+β)/2=β | Inverse has nonzero denominator | None |
| §7.9 quotient descent | Two lifts differing by constants | Difference killed in Q_E; averaging difference remains constant; [L:k]=1 gives identity | Independence on lifts holds | None |
| §8.1 family definition | u=0,1,−1,1/3 | Discriminants 0,0,0,1024/6561 | Family domain excludes exactly test singularities | None |
| §8.1 rational-function identities | u=4, (x,y)=(4,20) and (4,−20) | v=1 and −1; w=0 and pole; h=5 and 0 | Functions not constant | None |
| §8.1 divisors | v,w,h on E₄ | Coefficient sums 1−1−1+1=0, 1+1−1−1=0, 1+1−1−1=0 | All degree-zero identities agree | None |
| §8.1 certificate | Eight listed places of E₄ | Both residue tuples (−1,1,−1,1,1,−1,1,−1); product tuple all 1 | Certificate holds | None |
| §8.1 nonconstant K-class | Specializations at (0,0),(−16,0) | Values 0 and {−1,5}; tame at 5 of latter −1≠1 | Constant K-class excluded | None |
| §8.2 degree-two residue | {y−3,x} on 36a1 | Values 1/2,1/x₀,−2,−4,1; norm(1/x₀)=1/4 | Nonrational place kept | None |
| §8.2 reciprocity product | Same five places | Normed product (1/2)(1/4)(−2)(−4)=1; unnormed product 4/x₀=−1−√−3 | Norm-only certificate would fail | None |
| §8.3 regular integral example | 11a3 | At node (8,5), F=−418=−38·11 has valuation 1; horizontal tame tuple all 1, vertical orders of x,y zero | Integral certificate holds | None |
| §8.3 nonintegral example | u=1/3, component v=0 at 3 | ord v=1, ord w=0, tame=1/w times ±1; divisor m([∞]−[0]) nonzero for m≠0 | No nonzero multiple integral | None |
| §8.3 integral multiple control | u=4 | 4u=16∈ℤ; 2α has integral class, unlike denominator case 4/3 | Source's denominator condition retained | None |
