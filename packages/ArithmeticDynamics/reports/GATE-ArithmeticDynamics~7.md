# ArithmeticDynamics human-review response

## H01 (CBirkbeck) — applied

Independent general analytic carriers → the shared ComplexComparisonPartII §C−1.1 and AlgebraicModuliForArithmeticGeometry §§7.10.2, 7.4 contracts in `TauCetiRoadmap/ArithmeticDynamics/README.md:22` and `:161`; §§2.2, 4.1 and 4.1a now require natural line homeomorphisms, preservation of seminorms and classical points, and transport of functions, measures, curvature and multiplicity-weighted pullbacks. The projective Berkovich realization retains its compactness, density and functoriality work on the supplied substrate, while the rigid comparison stays separate; the disc-point definition at `:2274` uses the weighted Gauss formula, since over ℚ₂ at radius 3/4 it gives 3/4 whereas a supremum over rational points gives 1/2.

## H02 (CBirkbeck) — applied

The missing elliptic input → EllipticCurves Layer 4's j-integrality criterion, finite-extension good minimal model and discriminant comparison, explicitly contracted in `TauCetiRoadmap/ArithmeticDynamics/README.md:171` and required in §6.83 at `:9638`, together with the existing §6.3 doubling-Lattès adapter including residue characteristic 2. The coordinate calculation now records Δ(E′)=u⁻¹²Δ(E_t) and pushforward by x′↦u²x′+r; the added Checks distinguish diameter 1/2 at t=−1, diameter 1/4 at t=16, and the excluded singular parameters.

## H03 (CBirkbeck) — answered

The historical direction about “filing a target issue in another repository” is discussion data, without authorization to act outside this job. No roadmap edit or external filing follows from that observation.

**Ownership, citations and native interfaces.**

The supplier comparisons were read at ComplexComparisonPartII head 2d50a887 and AlgebraicModuliForArithmeticGeometry head 0b849541; EllipticCurves Layer 4 was read on main 82e5289. The complex supplier explicitly supplies the topological carrier by forgetting its own analytic ring sheaf, and its category has no global Hausdorff axiom. The Berkovich supplier supplies seminorm spectra and affinoid-domain gluing; its rigid equivalence has the strictness, paracompactness and covering restrictions retained in the new contract. Object searches covered main, the board packages, the indexed open roadmap heads and the supplied sibling checkouts. The explicit line/projective realizations and dynamical comparisons remain here because the suppliers own the general substrate, rather than these arithmetic-dynamical presentations and their measure adapters. No supplier declaration is redeclared in Suggested.lean, and no dependency was moved from a later roadmap.

The cross-roadmap resolver reports no missing citations. Its native-library stage was unavailable, so the newly consumed native inputs were inspected directly at Mathlib 6b7abb3c and Tau Ceti a91d3aaf. The four original ED0 leads are planned outputs of EffectiveDiophantineMethods §0.11, confirmed in that roadmap's API; they were not claims that those names exist at the pins.

At the pin, `Homeomorph` extends an equivalence by continuity of both directions (`Mathlib/Topology/Homeomorph/Defs.lean:42`); it supplies no separate arbitrary measurable structure. The new comparisons explicitly use Borel spaces. `Measure.map` has an almost-everywhere-measurability branch and a fallback for nonmeasurable maps (`Mathlib/MeasureTheory/Measure/Map.lean:99`); the Borel homeomorphisms satisfy the needed hypotheses. Composition, Dirac transport and integration use the existing `map_map` at `:208`, `Mathlib/MeasureTheory/Measure/Dirac/Basic.lean:35`, and `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean:1076`. The README supplier contract names these native laws rather than assigning their generic theory here.

The elliptic coordinate identity is the pinned `WeierstrassCurve.variableChange_Δ` (`Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean:218`). Native `HasGoodReduction` extends `IsMinimal` (`Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean:323`), so the finite-extension step explicitly minimizes the new equation. The reduction criterion comes from EllipticCurves Layer 4, not from the expression for j alone.

Legal source checks: baker-rumely-2006 line 170 and line 186 describe the Tate-algebra seminorm discs and their projective gluing; line 192 and line 198 give the classical inclusion and compact Hausdorff topology. chambert-loir-2006 line 193 and line 196 supply the model-measure formula, positivity and mass. yuan2008 line 1510 and line 1541 identify the Berkovich carrier and the compact strictly analytic model-function setting. demarco-krieger-ye-2020 line 693 through line 711 give all three dyadic intervals and the potentially good range. Forster's existing waiver and locators were retained. No missing text is requested.

**Elaborated signatures.**

All 15 declarations were re-elaborated together in one scratch file using `#check @name` and compared with their README statements and the supplied baseline. All 15 types are identical to that baseline; in particular the field/characteristic-zero, essentially-finite-type and ellipticity hypotheses remain present. Six native input signatures also elaborated. Suggested.lean needs no edit: the repairs concern analytic carriers absent at the pins and supplier contracts, and introduce no newly statable headline.

**Adversarial mathematics pass.**

The rows below record the changed constructions and comparison laws, their boundary controls, and every retained Lean declaration. Fields exclude the zero ring; compactness and density statements retain their respective projective and algebraically-closed/nontrivial-valuation hypotheses.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| Complex shared carrier and topology | A complex point; the dual-number point | Both have 1 topological point; their local algebras have dimensions 1 and 2 respectively | Forgetting the sheaf is appropriate only for the topological consumer | Consume the supplier's actual analytic space |
| Berkovich shared affinoid carrier | M(K); M(K⟨T⟩), Gauss and evaluation at 0 | M(K) has 1 point; values of T are 1 and 0 in both unit-disc presentations | Classical points alone omit Gauss | Consume seminorm spectra and gluing |
| Two-disc gluing and reciprocal transition | Radii 1 and 1/4 | At radius 1, T and S both have value 1 on the overlap; radius 1/4 in T has reciprocal value 4 in the S chart | Transition is inversion, with the correct domain | Explicit gluing/comparison target |
| Weighted Gauss definition | Constants 0,1; T−a at radii 0,1,2 | Values 0,1; then 0,1,2 respectively, in both formulas | Zero polynomial and radius zero are well-defined | Replace rational-disc supremum by weighted Gauss formula |
| Weighted radius versus rational-point supremum | K=ℚ₂, a=0, radius 3/4 | Weighted value of T is 3/4; rational-disc supremum is 1/2 | A supremum over K-points is the wrong general definition | Negative-control Check |
| Density hypothesis | Algebraically closed trivially valued K | Classical T-values are 0 or 1; the radius-2 seminorm gives 2; the interval (3/2,5/2) contains none of the former | Trivial valuation refutes unconditional density | Explicit nontriviality and Check |
| Nonarchimedean h_K preserves evaluations | Over ℚ₂, polynomial T²+2 at Gauss and at 0 | Both presentations give max(1,1/2)=1 at Gauss and 1/2 at 0 | Preserves more than the point labels | Evaluation-preserving homeomorphism |
| Complex h_ℂ and atlas comparison | z=2; 0 and ∞ | Coordinates [2:1] and reciprocal 1/2; inversion gives ∞ and 0; [1:2] has affine value 1/2 instead of 2 | Opposite coordinate convention is excluded | Canonical chart comparison |
| Rational-map naturality and composition | Squaring, cubing and identity at z=2 | Both routes give 4 for squaring, 64 for squaring after cubing, and 2 for identity | Diagram includes the identity and composition | Naturality required in §2.2 |
| PGL₂ direction and integral Gauss action | Translation z+1 and inversion; scaling 2z over ℚ₂ | Translation/inversion in opposite orders send 0 to ∞ and 1; integral translation gives Gauss(T+1)=1; scaling sends radius 1 to 1/2 | Noncommuting maps and a nonunit scaling distinguish the conventions | Preserve the stated action and evaluations |
| Function transport and its inverse | h=inversion, u(z)=abs(z)/(1+abs(z)), u(∞)=1 | u(0),u(∞)=0,1; transported values are 1,0; transporting back gives 0,1 | u∘h⁻¹ has the correct direction | Explicit inverse function transports |
| Integral-preserving measure transport | Same h,u; μ=δ₀+2δ∞ | Original integral 0+2=2; transported measure δ∞+2δ₀ against transported function gives 0+2=2; mass is 3 on both sides | Neither the inverse function nor the weights may be omitted | Explicit integral comparison using native laws |
| Transport commutes with function pullback | Squaring, inversion, u as above, z=2 | u(2²)=4/5; in reciprocal coordinates the transported function at (1/2)² is also 4/5 | Correct source and target order | Pullback comparison |
| Transport commutes with measure pushforward | Squaring and inversion; μ=δ₂ | Both composite transports give δ_(1/4); identity transport returns δ₂ | Pushforward composition is consistent | Use native map_map |
| Full local-degree pullback | z² in characteristic 2; z³ in characteristic 3, fibre at 0 | Pullbacks are 2δ₀ and 3δ₀; distinct inverse-point counts would be 1 in each case | Inseparable multiplicity survives transport | Restrict pullback comparison to its finite-map domain |
| Projective realization and embedding independence | P¹ point [2:1] over ℚ₂; its degree-two Veronese image | Dominant-coordinate ratios have norms 1/2 in P¹ and 1/4,1/2 in [4:2:1]; both recover the same point | Embedding changes the presentation, not the carrier | Common-refinement comparison |
| Dimension-zero and empty affinoid controls | X=Spec C_v; the zero affinoid algebra | Point counts 1 and 0; the zero algebra cannot satisfy seminorm(1)=1 and seminorm(0)=0 | No invented point for the empty spectrum | Preserve the supplied carrier |
| Projective compactness boundary | Affine points 2⁻ⁿ over ℚ₂, n=0,1,2; complex points 2ⁿ | Absolute values 1,2,4 on both affine examples; the sequences are unbounded | A¹ is not a compact replacement for projective X | Projectivity retained |
| Curvature mass and semipositivity | Standard O(1), O(2), O on P¹; O(−1) | Masses/degrees 1,2,0,−1; the last cannot be the mass of a positive curvature measure | No probability division at degree zero | General local target retained; supplier comparison uses ample L |
| Curvature transport | Standard O(2), at finite and complex places | h_*(2δ_G)=2δ_(h(G)); h_*(2ω)=2h_*ω; total masses 2=2 | Transport does not itself normalize | Explicit curvature comparison and Check |
| Agreement with cycleProbabilityMeasure | Same O(2); a point in dimension 0 | Dividing mass 2 by degree 2 gives 1; at a point mass 1 divided by degree 1 gives 1; degree-zero normalization has denominator 0 | Matches the supplier's ample, positive-degree contract | Identify carriers before comparing probabilities |
| Model-function refinement and continuity | Constant metric function log 2 and its pullback to a dominating model | Values before and after refinement are log 2; its integral against the O(2) measure is 2 log 2 | Refinement does not rescale test functions | Transport uses the same metric |
| Uniform metric limit under presentation change | Constant potentials (log 2)/n on standard O(1), n=1,2 | Sup distances log 2,(log 2)/2 are unchanged by a homeomorphism; curvatures remain δ_G of mass 1 | Uniformity and measure normalization are preserved | Existing uniform convergence hypothesis retained |
| Elliptic j-integrality criterion | Legendre t=−1,16,1/16 over ℚ₂ | j=1728,241³/225,241³/225; ord₂(j)=6,0,0, all nonnegative | All lie in the potentially good range | Name the actual elliptic supplier |
| Discriminant variable-change direction | Good E′: y²+y=x³; E: y²+8y=x³; u=2 | Δ(E)=−27·2¹²=−110592; u⁻¹²Δ(E)=−27=Δ(E′) | The inverse exponent is fixed | State the pinned variable-change identity |
| Elliptic-to-Lattès adapter at residue characteristic 2 | E′ above, and its u=2 scaling | Good-model resultant 729 is odd; scaled resultant is 729·2²⁴; modulo 2 the good lift is (X⁴,Z⁴), degree 4 | The adapter includes inseparable good reduction | Import §6.3 rather than require odd residue characteristic |
| Good-model Lattès conjugacy | Same curves; χ(x′)=4x′; x′=1 | f_E(4)=−256/320=−4/5; χ(f_E′(1))=4(−1/5)=−4/5 | χ goes from good coordinates to the original coordinates | Explicit map and pushforward direction |
| Diameter of transported Gauss point | t=−1 | abs(Δ)=2⁻⁶; abs(u)=2^(−1/2); abs(u)²=1/2=abs(Δ)^(1/6); inverse change gives 2 | Correct diameter and direction | New Check |
| Potentially good boundary | t=16 and t=1/16 | ord₂(Δ)=12,−12; predicted diameters 1/4,4; j-norms both 1 | Equality cases belong to the point-mass range | New boundary Check |
| Three dyadic interval cases | t=64,1/64,65 | Radii (1/16,1/4), (4,16), and (1/16,1/4) centered at 1 respectively; all log lengths are 2 log 2; ord₂(j)=−4 in each case | Positive-length intervals are not the potentially good point masses | Retain the interval target |
| Singular Legendre exclusions | t=0,1 | Δ=0 in both cases; the displayed j quotient has denominator 0 | Totalized division cannot certify good elliptic reduction | New negative-control Check |
| forwardOrbit | Identity; successor at 0, indices 0,1,2 | Identity orbit {x}; successor gives 0,1,2, including its starting point | Zeroth iterate retained | No Lean change |
| noRationalFourCycle | c=0,−1,1 and x=0 | Orbits 0→0, 0→−1→0, 0→1→2→5 give minimal periods 1,2,0, all different from 4 | Fixed, periodic and wandering controls agree | No Lean change |
| noRationalFiveCycle | Same three inputs | Minimal periods 1,2,0, all different from 5 | No period-zero false positive | No Lean change |
| atMostOneRationalThreeCycle | c=−29/16, x=−1/4 | Iterates −1/4,−7/4,5/4,−1/4 are exactly the three possible disjunct values | Nonvacuous cycle test | No Lean change |
| stoll_integer_family_card_gal | a=1,2,−8 at n=0,1; excluded a=0 | At n=0 polynomial X has Galois order 1=2^(1−1); at n=1 the three irreducible quadratics have order 2=2^(2−1); a=0 gives 1 instead of 2 and fails the hypotheses | Depth zero and family guard agree | No Lean change |
| IsFiniteUnionAP | Empty union; pairs (0,7) and (2,1) | Sets ∅, {7}, and {1,3,5,…} respectively | Finite and empty sets are included | No Lean change |
| rittCommonIterate | F=−X³,G=X³,n=2; F=−X²,G=X²,n=2; n=1 | Cubic second iterates both X⁹, with (−1)^4=1; quadratic second iterates evaluate at 2 to −16 and 16, with (−1)^3=−1; n=1 forces γ=1 | Both directions and the monomial support case are distinguished | No Lean change |
| ellipticStandardProjection | Legendre t=2, P=O,(0,0); identity and coordinate swap | Identity gives ∞,0 from (1,0),(0,1); swapping gives 0,∞ | Denominator-zero branch is infinity | No Lean change |
| legendreTorsionImages | t=2; singular t=0,1 | Branch images {0,1,2,∞}; discriminants 64,0,0 respectively | Definition admits singular models but smooth headlines exclude them | No Lean change |
| polynomialOrbits_meetingLine | F=X²,G=X²/2,x=2,y=4,a=2,b=0 | Orbit pairs (2,4),(4,8),(16,32); G(2z)=2z²=2F(z) | The positive-iterate conclusion is attained at n=1 | No Lean change |
| lechIntegralAssembly | L=ℚ,s={0,1/6},N=3 | At p=5 norms are 0,1; at p=2,3 norm(1/6) is 2,3 | Integral marks exclude the denominator primes | No Lean change |
| legendreTorsionSpecializations_infinite | Constant a=2; parameters t=2,4 | At t=2 the mark is 2-torsion; at t=4 the orbit is 2→0→∞, so the elliptic mark has order 4 | Smooth algebraic torsion specializations occur beyond the branch example | No Lean change |
| polynomialLine_returnTimes | Constant pairs (F,G)=(0,1),(0,0), starting at (0,0), diagonal; line X=1 in the second case | Return sets {0}, ℕ, ∅; AP representatives (0,0), (1,0), empty union | Constants and zeroth iterate fit the conclusion | No Lean change |
| uniformLegendreCommonTorsion | t₁=2,t₂=3; equal parameters as negative control | Their branch intersection {0,1,∞} has size 3; equal parameters share infinitely many projected torsion points | Distinctness excludes the immediate infinite case | No Lean change |
| uniformThreeBranchCommonTorsion | Legendre t=2,3 with identity projections; the same curve twice | Projected two-torsion intersection sizes are 3 and 4 | Exactly-three hypothesis includes the intended example and excludes identical projections | No Lean change |

**Build and gates.**

The targeted build exited 0, with the eleven expected theorem-target `sorry` warnings:

```text
Build completed successfully (8976 jobs).
```

The committed gate exited 0:

```text
gate ArithmeticDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The requested dependency check exited 0:

```text
depcheck: 33 roadmaps, 310 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Commit: `e35531a` — `ArithmeticDynamics: review repairs (shared analytic carriers and elliptic reduction contracts)`. Only `TauCetiRoadmap/ArithmeticDynamics/README.md` changed; the worktree is clean, and nothing was pushed.
