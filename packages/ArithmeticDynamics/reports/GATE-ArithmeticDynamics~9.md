# ArithmeticDynamics: human-review replies

Commits: `5cc0cb2` and `38861a5` (final head).

## H01 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:2358` now defines the finite-place C¹ Dirichlet form by squared slopes, restricts its measure-energy identification to piecewise-C² tests on closed pieces, and supplies uniform value-and-slope approximation for the C¹ inequality used at lines 6360 and 6374. The new Checks at lines 2376–2379 compute energies 1 and 4/3, retain the endpoint atoms, and exhibit finite slope energy with infinite derivative variation, matching `favre-rivera-letelier-2006 line 1669` and `favre-rivera-letelier-2006 line 1685`.

## H02 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:183` imports the general analytification/line, graph-Laplacian, continuous-potential energy, finite-place metric/measure and hybrid-topology contracts from TropicalAndBerkovichArithmetic §§0.21–0.23, 1.1–1.3, 3.3 and 6.1–6.5; §§2.2–2.5, 4.1–4.1a and 6.1 replace duplicate constructions with the dynamical, archimedean and global-height comparisons. The operator is explicitly Δ_AD=ddᶜ_TBA=−Δ_graph, and line 8241 compares escape potentials and equilibrium measures under scalar restriction from the completed algebraic closure to ℂ((T)); Favre's model-function/curvature comparisons and §§6.12, 6.42's dynamical convergence remain here because the supplier's §0.23 asserts topology and evaluation comparisons, not these measure limits (`favre-2017-v2 line 734`, `favre-2017-v2 line 1261`).

## H03 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:8323` changes the unconditional critical-point claim to “If f is PCF, every critical point of f is preperiodic.” The existing negative control gives 0→1→2→5→26→677 for z²+1; no PCF implication occurs in `TauCetiRoadmap/ArithmeticDynamics/Suggested.lean`, so no additional acceptance-test declaration is needed.

## H04 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:3809` changes the root condition z^(nd)=a to z^(d^n)=a. The added d=2,n=3,a=1 Check gives 8/8=1 instead of 6/8=3/4, consistently with the full multiplicity-counted preimage theorem (`baker-rumely-2006 line 160`).

### Ownership and citation evidence

The supplied TropicalAndBerkovichArithmetic checkout is head `3dafc4fc724da78644f413d6ae5f598ea6be71a9`; its scope and downstream contract agree on the direction TropicalAndBerkovichArithmetic → ArithmeticDynamics. Its §§0.21–0.22 supply analytic realizations and scalar extension, §0.23 supplies hybrid topology, §§1.1–1.3 supply line geometry, §3.3 includes the BDV/closed-piece-C² domain, §§6.1–6.4 include arbitrary-base model-function density and semipositive-measure limits, and §6.5 includes the general complete algebraically closed-field energy theorem. The categorical owners remain ComplexComparisonPartII §C−1.1 and AlgebraicModuliForArithmeticGeometry §7.10.2; the adelic intersection owner remains HeightsRationalPointsAndObstructions §§5.17a–f.

Ownership searches covered main at `b41e47b`, board packages, the open-roadmap index, and the supplied open checkouts, by Hsia kernels, hybrid topology, line Laplacians, model measures and the analytic carriers. No further owner was found for the retained rational-map local-degree/pullback comparisons, classical-atom energy corrections, C¹ test approximation or Favre's hybrid model-potential/curvature comparison. The new dependency is earlier in the order, at position 202 versus ArithmeticDynamics at 268; no ownership moved to a later roadmap and no merge-order change is needed.

The cross-roadmap citation resolution reports no missing roadmap citations or Lean names. The eleven initial leads were checked against the supplier statements: the three complex analytification comparisons occur in ComplexComparisonPartII §C−1.1, the four Berkovich methods in AlgebraicModuliForArithmeticGeometry §7.10.2, and the four bounded-height declarations in EffectiveDiophantineMethods §0.11; they are planned supplier declarations, not claims that those declarations exist in the pinned libraries.

The sources read for the changed interfaces were legal arXiv copies under the existing README keys: `favre-rivera-letelier-2006 line 1078` (potential Laplacian), `favre-rivera-letelier-2006 line 1669` (C¹ tests and slope form), `favre-rivera-letelier-2006 line 1685` (the C² measure identity); `demarco-krieger-ye-2020 line 306` (sign and continuous-potential convention); `chambert-loir-2006 line 193` (model weights and total mass), `chambert-loir-2006 line 256` (semipositive limits); `favre-2017-v2 line 331` (central field), `favre-2017-v2 line 417` (regular admissible data), `favre-2017-v2 line 689` (model extension), `favre-2017-v2 line 734` (degree-balanced density), `favre-2017-v2 line 1243` (uniform approximation domain), `favre-2017-v2 line 1261` (hybrid curvature convergence) and `favre-2017-v2 line 1450` (dynamical homogeneous polynomials and escape estimates). The waived Forster citation is retained by locator; no settled source was requested again.

### Computed adversarial pass

The rows cover the changed mathematical interfaces and Checks, including the imported interfaces as used here, and every declaration retained in `Suggested.lean`. Segment coordinates 0 and 1 below label nonclassical endpoints; Dirac masses there have continuous potentials. General metric/energy claims retain the supplier's complete, algebraically closed, nontrivially valued hypotheses; the analytic carrier and rational-map degree adapters retain general complete nonarchimedean fields.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Δ_AD=ddᶜ_TBA=−Δ_graph, curvature sign | Retracted s on a length-1 segment | Δ_AD=δ₀−δ₁; Δ_graph=δ₁−δ₀; −∫s dΔ_AD=1=∫1²ds | Pass | Explicit sign adapter in conventions and contract |
| Analytic line/carrier identification preserves evaluations | Gauss, evaluation at 0, radius 3/4 over ℚ₂ | T-values 1↔1, 0↔0, 3/4↔3/4; classical-disc supremum instead 1/2 | Pass | Import the carrier; retain its rational-map comparison |
| Classical-point density requires nontrivial valuation | Trivially valued algebraically closed K, radius 2 | Gauss-radius point has T-value 2; classical points have 0 or 1; classical intersection of 3/2<T<5/2 is empty | Pass | Preserve the density hypothesis and negative control |
| Rational-map evaluation action and composition | Identity, inversion, z², 0 and ∞ | id(2)=2; inversion(2)=1/2; inversion²(2)=2; inversion(0)=∞, inversion(∞)=0; z²(2)=4 | Pass | Specialize supplied analytification, no second carrier |
| Rational-map finiteness, openness and integral Gauss action | z² and identity; characteristic 2; integral units | Degrees 2 and 1; z²(G)=G with local degree 2, also in characteristic 2; a unit multiple of T has Gauss value 1 | Pass | Retain local-degree adapter |
| Function/measure transport and inverse transports | Inversion h, μ=δ₂, u(z)=Re(z)/(1+norm(z)²), continuously extended by 0 at ∞ | h_*δ₂=δ_(1/2); transported u has value u(2)=2/5 at 1/2; ∫1=1 on both carriers; inverse transport returns δ₂ | Pass | Require Borel homeomorphisms and integral preservation |
| Type-II images, tangent/residue comparison and PGL₂ transitivity | z² at Gauss, and T↦aT | Gauss maps to Gauss; residue map is t², including inseparable degree 2 in residue characteristic 2; radius 1 maps to radius norm(a) | Pass | Keep rational-map geometry; import point classification |
| Local-degree sums, composition, measure pullback/pushforward and support | z² at 0; composition z²∘z²; inversion | Pullback δ₀=2δ₀, pushforward=2δ₀; composition degree 4=2·2; supports {0} and inversion image {∞} | Pass | Keep full inseparable multiplicities |
| BDV pullback/Poincaré–Lelong including singular potentials | h=log norm(T); φ=T²; g=T²; g=1; g=0 | Δlog norm(T²)=2δ₀−2δ∞=φ*(δ₀−δ∞); Δlog1=0; zero rational function has no divisor identity | Pass | Keep nonzero guard and distinguish singular from continuous potentials |
| GL₂ coordinate-change direction | A=diag(a,1), norm(a)>1 | Δ of log max(norm(a)[T],1)−log max([T],1) is δ at radius norm(a)⁻¹ minus δ_G; the forward Gauss image has radius norm(a) | Pass | Add inverse-image Check |
| Normalized homogeneous-iterate curvature | F=(X²,Y²); n=0,1,2; also degree-1 identity | Potentials are identically 0; normalized pullbacks of δ_G are δ_G with masses 1, 2/2, 4/4; degree-1 identity mass 1 | Pass | Explicit d≥1 guard on finite normalized formula |
| Subharmonic maxima and harmonic constants | 0, log norm(T), max(0,log norm(T)) | Affine Laplacians 0, δ₀, δ_G, all positive; constants 0 and 1 both have Laplacian 0 | Pass | Retain affine/singular domain and uniqueness modulo constants |
| Uniform BDV convergence with bounded variation; exclusion without it | Constants 1/n; φ_k=sin(kπs)/(kπ) on [0,1] | First Laplacians 0→0; second sup norm≤1/(kπ)→0 but total variation 2k+2→∞ | Pass | Keep variation/positivity condition |
| Finite-place continuous-potential kernel and self-energy transport | Nested radius-1 and radius-2 disc points | Kernel logarithms 0, log2, log2; E(δ₁−δ₂)=−(0+log2−2log2)=log2=d_hyp | Pass | Import Hsia theory and retain nonclassical diagonal |
| Bilinearity, positivity domain and zero energy | ρ=δ₁−δ₂, −ρ, 0 | E(ρ,ρ)=log2; E(ρ,−ρ)=−log2; E(0,0)=0 | Pass | Positivity restricted to self-energy of the continuous-potential mass-zero class |
| Diagonal-excluded atomic energy and coordinate correction | Complex δ₀−δ₁, dilation z↦2z | Before: −2(−log1)=0; after: −2(−log2)=2log2; correction 1²log2+(−1)²log2=2log2 | Pass | Retain this ArithmeticDynamics extension |
| Finite-place C¹ Dirichlet definition; independence of orientation/subdivision/support | φ=s on length 1; split at 1/2; reverse orientation | Integrals 1, 1/2+1/2=1, and (−1)²·1=1; adding constant branches contributes 0 | Pass | Define by slopes, without Δφ |
| Piecewise-C² measure-energy identity and endpoint terms | φ=s² on [0,1] | Δφ=2ds−2δ₁ has mass 2−2=0; −∫φΔφ=−2/3+2=4/3=∫4s²ds; missing atom gives mass 2 and energy −2/3 | Pass | Restrict the asserted identity to a valid measure domain |
| C¹ counterexample outside the finite-measure Laplacian domain | g(s)=s sin(1/s²), φ=∫g; alternating s_n | D(φ)≤∫s²ds=1/3; slopes start 0.79788456, −0.46065887; partial variations for N=10,100,10000 are 5.47375218,21.03060672,224.18975182 and bounded below by 2(N−1)s_(N−1)→∞ | Pass | Add negative-control Check |
| C¹ value-and-slope approximation and Dirichlet continuity | φ_m=s²+s(1−s)/m, m=1,2,10 | Endpoint values 0,1 stay fixed; sup value/slope errors≤1/(4m),1/m; energies 1,13/12,127/100→4/3 | Pass | Add approximation target without assuming measure convergence of Δφ_m |
| Squared Cauchy–Schwarz and its C¹ limiting form | φ=s, ν=δ₁−δ₀; φ=s²; φ=constant | Squared integrals 1,1,0; D(φ)E(ν)=1,4/3,0 respectively | Pass | Preserve constants and quadratic homogeneity |
| Local weak-convergence consumer §4.31 | Uniform roots of unity; constant singleton at a finite place | Energies −log(n)/n→0 and 0 respectively; roots converge to angular probability; singleton stays δ₀≠δ_G | Pass | Retain cardinality→∞; use C¹ slope estimate, no Δ on arbitrary test |
| Quantitative consumer §4.32 | Test scaling by 0 and by 2; radius for κ=1,N=8 | D becomes 0 or 4D, hence square-root term 0 or twice old value; radius=1/8 | Pass | Use the C¹ approximation in the proof interface |
| Projective carrier and multiplicity-weighted transport §4.1 | Point, P¹, nonproper A¹; z² and inversion | Point Dirac mass 1; pullback δ₀=2δ₀ on either presentation; inversion pushes δ₀ to δ∞; A¹ has unbounded coordinate values | Pass | Import general analytification, retain dynamical comparison |
| Finite-place model metrics and model-measure normalization | Good-reduction O(1), O(2), trivial bundle | Measures δ_G,2δ_G,0; masses 1,2,0; probability division gives δ_G for the first two and is excluded for degree 0 | Pass | Import §§6.1–6.4 instead of reconstructing |
| Tensor denominators, component multiplicities and residue degrees | Model of L² with component degree 6; multiplicity 2, degree 3; residue extension degree 2 | Weights 6/2=3,2·3=6,2·1=2 | Pass | Carry exact rank-one model contract |
| Model-function operations, refinements and density | Trivial frame; squared frame; constant c at a point | Log norm 0; tensor square doubles a log norm a to 2a; a common refinement keeps a; rational valuation multiples approach each real constant | Pass | Import general finite-place density and refinement invariance |
| Uniform semipositive curvature limits and global adelic comparison §4.1a | Standard O(2); constant metric twist; dimension-0 point | Raw mass 2→2 through transport; division by degree gives 1; constant twist has Δ=0 and leaves mass 2; dimension-0 measure mass 1 | Pass | Keep local/global comparison and archimedean construction |
| Hybrid topology/evaluation/fibre parameter | T,T²; r=e⁻¹; constant P¹ family | Rescaled evaluations e⁻¹,e⁻² equal central values; complex fibres are spheres, central fibre is the seminorm line | Pass | Import §0.23 rather than construct topology |
| Regular hybrid datum and tensor normalization | Sections X,Y at [1:1]; sections X²,XY,Y²; nonregular X²,XY at [0:1] | Model values −log2/2,−log2; normalized second value −log2/2; nonregular value −∞ | Pass | Define regularity and include missing generating/degree conditions |
| Balanced differences and dense model tests | Datum F and its tensor square F′; q=1,q′=1/2; scalar T on F | q deg F=q′ deg F′=1; qΦ_F−q′Φ_F′=0; scalar T adds central constant log r | Pass | Use Favre's degree-balanced difference class |
| Hybrid curvature limit for uniform admissible potentials | Constant quadratic family and signed oscillatory functions | For z² the complex curvature uses the unrescaled potential and has angular mass 1, while central curvature has Gauss mass 1; test 1 integral 1 throughout; oscillatory Laplacian variations 2k+2 | Pass | Retain positivity, fixed class and uniform model approximation |
| Central scalar restriction on escape potentials and measures | F=(X²,Y²); Gauss over C₀ and k₀ | Normalized potentials 0=0∘π; π_*δ_G=δ_G; ∫1=1 on both sides | Pass | State base-change comparison, without identifying the two spaces |
| Scalar restriction need not be a homeomorphism | ±√T over C₀ | Two distinct points; both give norm(z)=r^(1/2) and identical norms on k₀[z] by the conjugate T-adic embeddings | Pass | Add noninjectivity Check |
| Lift rescaling in hybrid potential and curvature adapters | Degree-2 lift multiplied by T; r=e⁻¹ | Shift log r/(2−1)=−1 on both sides of scalar restriction; Δ(−1)=0, curvature mass remains 1 | Pass | Preserve potential normalization and all family consumers |
| PCF implication §6.5 | z²−2, z²+1, z²; identity outside d≥2 | Critical 0-orbits: 0,−2,2,2; 0,1,2,5,26,677; 0,0. ∞ is fixed; z²−2 has PC={−2,2,∞}; z²+1 fails PCF | Pass | Restore explicit PCF premise; no Lean PCF stand-in |
| Power-map iterate endpoint §2.92 | d=2,n=0,1,2,3,a=1 | Degrees 1,2,4,8; masses 1/1,2/2,4/4,8/8=1; wrong nd exponent at n=3 gives 6/8=3/4 | Pass | Correct d^n and add mass Check |

### Elaborated signatures and native carriers

All fifteen explicit `#check @name` commands were elaborated together after the targeted build, with exit status 0. Each type was compared with its README statement: all four definitions and eleven theorems agree; no binder was lost and no Lean declaration changed. In particular the two `IsElliptic` instances, the characteristic-zero field instances, positive-iterate premises, EssFiniteType hypothesis and separate finiteness conjuncts remain in the elaborated statements.

| Declaration | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| forwardOrbit | Identity; z²−1 at 1; successor at 0 | {x}; {1,0,−1}; all ℕ including index 0 | Pass | None |
| noRationalFourCycle | c=0, x=0 and x=2 | Minimal periods 1 and 0, both ≠4 | Pass | None |
| noRationalFiveCycle | c=0, x=0 and x=2 | Minimal periods 1 and 0, both ≠5 | Pass | None |
| atMostOneRationalThreeCycle | c=−29/16, x=5/4; each y in its cycle | 5/4→−1/4→−7/4→5/4; each of the three conclusion disjuncts has its corresponding witness | Pass | None |
| stoll_integer_family_card_gal | a=1,n=0,1,2; excluded a=0,n=2 | Galois orders 1,2,8 equal 2^(2^n−1); a=0 instead gives 1≠8 and fails the family premise | Pass | None |
| IsFiniteUnionAP | Empty union, singleton {7}, even naturals | ∅, range(0k+7)={7}, range(2k)={0,2,4,…} | Pass | None |
| rittCommonIterate | F=−X³,G=X³,n=2; F=−X²,G=X²,n=2; n=0 | First iterates both X⁹, γ=−1 has γ²=γ⁴=1; second pair gives −X⁴≠X⁴ and γ³=−1; n=0 gives identities and is excluded | Pass | None |
| ellipticStandardProjection | Identity matrix; coordinate swap; affine x=2 and zero point | 2 and ∞; swapped values 1/2 and 0; at affine x=0 swap gives ∞ | Pass | None |
| legendreTorsionImages | t=2 and t=3, two-torsion and zero point | Coefficients (0,−3,0,2,0), (0,−4,0,3,0); discriminants 64,576; projected branches {0,1,2,∞},{0,1,3,∞} | Pass | None |
| polynomialOrbits_meetingLine | F=G=X²,x=y=2,a=1,b=0 | (2,2),(4,4),(16,16),… on diagonal; n=1 conclusion z²=z² | Pass | None |
| lechIntegralAssembly | L=ℚ,s={0,1/2},N=3; p=5 | Identity embedding has norms 0 and 1, both ≤1; 5>3 | Pass | None |
| legendreTorsionSpecializations_infinite | a=2,t=2 and t=4 | At t=2, (2,0) is two-torsion; at t=4, points (2,±2i) double to x=0 since (2²−4)²=0 and denominator=−16 | Pass | None |
| polynomialLine_returnTimes | Constant-zero F,G,x=1,y=2,line x+y=0; identity diagonal | Return sets {1,2,3,…}=range(k+1), and ℕ respectively; n=0 sum is 3 in the constant example | Pass | None |
| uniformLegendreCommonTorsion | Distinct t=2,3; equal t=2 excluded | Common branch images {0,1,∞} give lower bound 3; equal fibres have infinite torsion intersection and violate t₁≠t₂ | Pass | None |
| uniformThreeBranchCommonTorsion | Smooth t=2,3, identity projections; equal t=2 | Branch intersection cardinal 3 qualifies; equal fibres have cardinal 4 and infinite torsion intersection, so fail premise | Pass | None |

Native checks were made at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, matching the manifest. `Mathlib/Dynamics/PeriodicPts/Defs.lean:245` defines minimalPeriod to be 0 for a nonperiodic point; `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:887` defines xRep as [1,0] at zero and [x,1] at an affine point, with its nonzero theorem requiring a nontrivial base ring. `Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean:365` tests weak convergence against bounded continuous real functions; compactness of the analytic carriers gives the required boundedness. Searches for Berkovich, Hsia, hybrid and model-measure carriers at both pins produced no competing declarations; existing projective, measure and Weierstrass notions remain native.

### Build and gate outcomes

`lake build TauCetiRoadmap.ArithmeticDynamics.Suggested` exited 0, with the eleven expected admitted-theorem warnings:

```text
Build completed successfully (8976 jobs).
```

The final full gate exited 0 on clean head `38861a5`:

```text
gate ArithmeticDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The requested movable dependency check exited 0, with this complete output:

```text
depcheck: 47 roadmaps, 528 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. `git diff --check` passed; the worktree is clean. Only `TauCetiRoadmap/ArithmeticDynamics/README.md` changed; `TauCetiRoadmap/ArithmeticDynamics/Suggested.lean` retains the fifteen signatures checked above. No push or external reply was made.
