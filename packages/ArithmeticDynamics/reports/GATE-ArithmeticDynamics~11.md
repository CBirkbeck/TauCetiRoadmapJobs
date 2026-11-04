## H01 (CBirkbeck) — applied differently

The duplicate Birkhoff target now consumes ProbabilisticAndMetricNumberTheory §§4.1–4.3, and finite partition labels and their pair-label joins compare its §5.2 Shannon API with GeometryOfNumbersAndQuadraticArithmetic §4.2's partition, conditional-label and dynamical entropy constructions, which the ownership search also found already assigned there (`TauCetiRoadmap/ArithmeticDynamics/README.md:71`, `:268`, `:280`, `:2466`). Scope, exact supplier contracts, the §2.90 Birkhoff consumer and Layer 2 dependencies now name those suppliers; importing the existing partition constructions repairs the broader duplication that retaining a second partition carrier would leave.

## H02 (CBirkbeck) — applied

Correction 9 replaces the invalid k=0 predecessor with x_k=F_k(0)=f^[p^k](0) and x_(k+1)=(F_k)^[p](0), both for k≥0 (`TauCetiRoadmap/ArithmeticDynamics/README.md:10487`); for p=2 and f(z)=z²+z−2 the initial value is −2 while the old expression gives 0 (hutz-2009 line 665; line 679). The same paragraph now distinguishes the origin from x₀, records the previously missed equality of the two exponents at p=2,k=2, and writes the recursion range as k+1<e to avoid truncated subtraction.

## H03 (CBirkbeck) — applied

The unqualified entropy interface now separates arbitrary measurable probability spaces, nonempty standard Borel spaces for fibre kernels and endomorphism decomposition, and nonempty compact metric Borel spaces with continuous measure-preserving maps for the topological comparison (`TauCetiRoadmap/ArithmeticDynamics/README.md:2511`, `:2542`, `:2571`, `:2595`). It uses the native graph conditional kernel, its equivalence with `ProbabilityTheory.condDistrib id T μ`, almost-everywhere fibre concentration, the explicit conditional-entropy lower bound and nonnegative entropy integral, and explains why the complex sphere satisfies the hypotheses; §§2.67, 2.85 and 2.90 consume these interfaces.

**Ownership and source evidence.**

- ProbabilisticAndMetricNumberTheory was read at the supplied head 58cbb883362fd4da03e36ee6de5de039d7a73449: its scope, §§4.1–4.3, §5.2 and Downstream consumers agree with the imported statements. Its mentions of ArithmeticDynamics are ownership/downstream declarations, not reverse inputs.
- The object search across main, the open-roadmap index and the board packages found GeometryOfNumbersAndQuadraticArithmetic §4.2, **Entropy and Haar measure on leaves**, at head 465728d: its README lines 1965–1969 assigns the partition labels, joins, entropy rates, measure entropy and general conditional-label entropy. Its component-kernel construction concerns group actions; the noninvertible endomorphism extension and entropy integration remain here. No declaration was added to Suggested.lean or assigned another roadmap's qualified name.
- The consulted main checkout is bfaaff10c2db6fea1ff2d1500673df510534799f. The citation resolver found no unresolved cross-roadmap citation; its eleven library-name leads are planned supplier APIs, verified in AlgebraicModuliForArithmeticGeometry §7.10.2, ComplexComparisonPartII §C−1.1 and EffectiveDiophantineMethods §0.11, rather than claims that those declarations already exist at the pins.
- Mathlib was checked at 6b7abb3c7686292736be2955bd3eb9ebf63b456a, and Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. `Mathlib/Probability/Kernel/Disintegration/Basic.lean:57` gives IsCondKernel only its reconstruction field; `Mathlib/Probability/Kernel/Disintegration/StandardBorel.lean:82` supplies the nonempty standard Borel assumptions, `:361` defines the finite-measure conditional kernel, and `:381` supplies its Markov instance. `Mathlib/Probability/Kernel/CondDistrib.lean:64`, `:82` and `:314` give the joint-law definition, reconstruction and conditional-expectation comparison. The entropy cardinal and liminf/limsup interfaces were checked in `Mathlib/Dynamics/TopologicalEntropy/CoverEntropy.lean:206`, `:338`, `:428` and `:435`.
- The existing Tau Ceti mean theorem in `TauCeti/Probability/Ergodic/MeanErgodic.lean:91` acts on L² elements and does not supply the pointwise L¹ theorem being imported.
- hutz-2009 line 664 through line 679 supplies the conflicting initialization, iterate notation and proof recursion. Lyubich1983 line 554 through line 586 supplies the conditional-fibre entropy application; line 1010 through line 1052 gives the positive-measure covering argument, whose written proof assumes finite covering dimension; line 1130 through line 1180 supplies the maximizing-measure reduction and frequency argument. The README preserves that dimension-dependent route and adds the general compact metric route through small-diameter partitions with null boundaries.
- Sarig2023 line 2271 supplies standard Borel endomorphism decomposition; line 5051 and line 5066 fix the source's base-two entropy convention; line 5068 through line 5086 gives conditional entropy; line 5108, line 5173 and line 5262 give its chain rule, monotonicity and entropy-rate formula; line 5349 through line 5420 gives the information theorem and its martingale route. The nonergodic information statement extends that argument using the imported invariant conditional-expectation Birkhoff limit, rather than claiming that the source's ergodic theorem already states it. The finite-label approximation and increasing-generator inputs are Sarig2023 line 6429 through line 6449.
- All three consulted texts were read from legal copies: arXiv, the publisher's open PDF and the author's institutional page. Their fetched metadata, including the new Sarig2023 reference, is recorded in the job's source record; `packages/ArithmeticDynamics/sources.toml` was outside the editable files and was not changed. No missing source remains, and no waived source was reopened.
- The review's historical reference to an external target-issue filing instruction was treated as data; it caused no external action.

**Elaborated signature comparison.**

A scratch copy containing `#check @name` for all fifteen declarations was elaborated once through the specified target build, then the original Suggested.lean was restored byte for byte and rebuilt. Every elaborated type was compared with its README statement; no binder was lost and no Lean change was necessary. The entropy constructions remain README targets because their supplied carriers are absent at the pins, as the existing module docstring explains.

| Declaration | README comparison with elaborated signature | Change |
|---|---|---|
| forwardOrbit | Arbitrary carrier; all nonnegative iterates, including n=0. | None. |
| noRationalFourCycle | All c,x∈ℚ; minimal period differs from 4. | None. |
| noRationalFiveCycle | All c,x∈ℚ; minimal period differs from 5. | None. |
| atMostOneRationalThreeCycle | Both exact-period-three premises retained; the three orbit representatives match. | None. |
| stoll_integer_family_card_gal | Integer sign, congruence and nonsquare alternatives retained; all n≥0 and order 2^(2^n−1). | None. |
| IsFiniteUnionAP | Finite union over natural pairs; zero step gives a singleton. | None. |
| rittCommonIterate | Complex polynomials, degree greater than one, positive n, nonzero γ and both root-of-unity equations retained; s=0 allowed. | None. |
| ellipticStandardProjection | Native nonsingular-point carrier, invertible matrix, OnePoint target and denominator-zero branch; ellipticity is not silently assumed. | None. |
| legendreTorsionImages | Native coefficient tuple and finite-additive-order points, including infinity. | None. |
| polynomialOrbits_meetingLine | Field and characteristic zero, nonzero slope, equal nonlinear degrees and infinite product-orbit intersection retained. | None. |
| lechIntegralAssembly | Field, ℚ-algebra and essential finite type retained; arbitrary finite marks and arbitrarily large prime, with integral images. | None. |
| legendreTorsionSpecializations_infinite | Algebraicity and exclusions a,t≠0,1 retained, with infinitely many distinct parameters. | None. |
| polynomialLine_returnTimes | Characteristic-zero field and genuine line premise retained; constant polynomials allowed. | None. |
| uniformLegendreCommonTorsion | One uniform bound; distinct smooth parameters, finiteness and natural cardinality bound retained separately. | None. |
| uniformThreeBranchCommonTorsion | Both ellipticity instances, arbitrary invertible projection matrices and exactly three common branch values retained. | None. |

**Computed adversarial pass.**

This table records the changed mathematical statements and their altered consumers. Write L=log 2=0.693147180560; the finite probability computations used exact rational masses before evaluating natural logarithms. It does not recertify the unchanged mathematical targets of the entire roadmap.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Supplied pointwise Birkhoff limit | Identity on two fair points, f=(0,2). | Every positive average and E[f\|invariants] equal (0,2); the integral is 1. | Ergodicity cannot be dropped from the constant-limit version. | Import the invariant-limit theorem. |
| Ergodic specialization | Two-point flip, f=(0,2), lengths 1,2,3. | Averages (0,2), (1,1), (2/3,4/3); limit (1,1), integral 1. | Agrees. | Import the ergodic theorem. |
| Finite partition/Shannon comparison | Constant label with an empty atom; fair bit. | Masses (1,0): H=0 on both definitions; (1/2,1/2): H=L on both. | Agrees; log alphabet size alone fails the constant case. | Add label comparison and zero-mass witness. |
| Join by pair labels | Independent fair bits versus the same bit twice. | Joint masses (1/4,1/4,1/4,1/4) give 2L; (1/2,0,0,1/2) give L. | Pair labels give the correct distinct joins. | Reuse the finite joint-law API. |
| Relabeling and a.e. invariance | Swap probabilities 1/4 and 3/4; add a null atom. | H(1/4,3/4,0)=H(3/4,1/4)=0.562335144619. | Agrees. | Require bijective relabeling or a.e. equality. |
| Empty and positive itineraries | Fair binary shift, n=0,1,2,3. | Alphabet masses 1; 1/2; 1/4; 1/8 give H=0,L,2L,3L. | Empty tuple has entropy zero. | State the n=0 convention explicitly. |
| Entropy-rate normalization | Two-point identity versus fair binary shift. | Identity: H(Pⁿ)/n=L/n→0; shift: nL/n=L. | Distinguishes rate from single-partition entropy. | Retain positive-length limits. |
| Finite-label approximation of countable entropy | Independent symbols of masses 2^−(k+1), truncated after m symbols. | H=2L; m=1,2,3 truncations give L,3L/2,7L/4; omitted conditional entropy L,L/2,L/4→0. | Rate approximation has vanishing conditional error. | State the truncation inequality. |
| Conditional entropy definition | One atom and a fair bit, conditioning on the trivial σ-algebra. | −1 log 1=0; −2(1/2)log(1/2)=L. | Correct sign and logarithm base. | Define the finite real integral. |
| Representative independence | Conditional probabilities (1/2,1/2), changed at a null point. | Integrals before and after the change both equal L. | No pointwise representative choice affects entropy. | State representative independence. |
| Conditional entropy bounds | Fair bit; trivial versus full conditioning. | 0≤L≤L and 0≤0≤L. | Both endpoints attained. | State the bounds. |
| Monotonicity in conditioning | Fair bit, trivial σ-algebra included in its own σ-algebra. | Conditional entropies L≥0. | Reversing the inequality fails. | State the direction and witness. |
| Agreement with finite conditioning labels | Independent fair P,Q; then P=Q. | H(P\|Q)=2L−L=L; H(P\|P)=L−L=0. | Matches the supplied finite conditional formula. | Add the comparison. |
| Conditional chain rule | Independent fair P,Q, conditioning on σ(P); then P=Q. | L=0+L; for P=Q, 0=0+0. | Agrees, including repeated labels. | State the exact conditional chain rule. |
| Rate as entropy conditional on the future | Identity and one-sided Bernoulli first-symbol partition. | Identity: H(P\|future)=0=h(T,P); Bernoulli: L=h(T,P). | Correct refinement direction. | Add the conditional-limit input. |
| Graph marginal and coordinate order | Fair identity and fair flip. | Identity graph has 1/2 at (0,0),(1,1); flip at (1,0),(0,1); first marginal is (1/2,1/2) in each case. | Conditioning is on Tx, observing x. | Use condDistrib id T μ. |
| Native graph reconstruction | Fair identity with K(y)=δ_y versus K(y)=μ. | Correct reconstructed diagonal masses 1/2; constant kernel gives off-diagonal mass 1/4 where the graph has 0. | Reconstruction excludes the wrong constant kernel. | Reuse the native disintegration identity. |
| Conditional-kernel probability and nonemptiness | Finite measure 2δ_(0,0), and the zero measure. | Conditional probability has mass 1 and reconstructs total mass 2; zero measure has total mass 0, not 1. | Finite-measure disintegration is distinct from the probability entropy contract. | Separate the imported finite-measure and local probability assumptions. |
| Fibre concentration | Fair flip. | K(0)=δ₁ and K(1)=δ₀; each gives its corresponding T-fibre mass 1. | Orientation and source/target agree. | Consume conditional-label atom evaluation. |
| A.e. concentration and uniqueness | T=0 and μ=δ₀ on {0,1}. | K(0)=δ₀; either δ₀ or δ₁ at y=1 reconstructs the same graph; T⁻¹{1}=∅ has mass 0 under both. | Concentration at every y would be false. | Require only μ-a.e. concentration and uniqueness. |
| Fibre entropy/conditional entropy identity | Fair identity; one-sided fair binary shift. | Identity: integral 0=H(P\|T⁻¹𝔅); shift first symbol: integral L=H(P\|T⁻¹𝔅). | Agrees. | State the integral bridge. |
| Conditional entropy lower bound | Identity partition and Bernoulli coordinate partition. | Identity: 0≤0≤0; Bernoulli: L≤L≤L. | Correct inequality direction. | State H(P\|T⁻¹𝔅)≤h(T,P)≤h(T). |
| Uniform d-point fibre consequence | d=1,2,3; empty fibre as negative control. | Entropies 0,L,log 3=1.098612288668 equal log d; the empty sum has mass 0. | Empty fibre cannot carry a probability. | Keep d≥1 and a.e. hypotheses. |
| Ergodic partition information | Fair binary cylinders, n=1,2,3; singleton. | −log(2⁻ⁿ)/n=L for all three lengths; singleton gives −log 1/n=0. | Correct positive-length normalization. | State SMB with null atoms excluded. |
| Nonergodic partition information | Half fixed point, half fair binary shift, with the component recorded by the label. | Fixed cylinder mass 1/2 gives L/n→0; shift cylinder mass 2^−(n+1) gives (n+1)L/n→L; integral of the limits is L/2. | Limit need not be constant; its integral is the rate. | State the invariant-limit version. |
| Measure/topological entropy comparison | Singleton; two-point identity; compact fair binary shift. | 0≤0; 0≤0; L≤L, respectively. | Nonempty compact metric hypotheses give the intended comparison. | Name the native EReal-valued interface. |
| Positive-measure covering bound | Full fair binary shift; nonergodic half-fixed-point mixture with Y the fixed component. | Shift covering growth tends to L; mixture has h=L/2 but Y has covering growth 0. | Dropping ergodicity gives the false L/2≤0. | Require ergodicity for the subset bound. |
| Native cover cardinal conventions | Singleton at n=0 and n≥1; empty set. | Nonempty singleton covering cardinal is 1 and log growth 0; empty-set cardinal is 0 and is excluded by μ(Y)>0. | No log-zero covering term in the subset theorem. | Reuse coverMincard; use positive averaging lengths. |
| Small-diameter null-boundary partitions | Two-point discrete metric, ε<1; a singleton carrying a Dirac mass. | Singleton atoms have diameter 0<ε and boundary mass 0; the one-atom singleton partition has the same values. | Positive atoms need not lie on partition boundaries. | Add the partition input for the compact metric route. |
| Component-kernel conditional identity | Two-point identity, u=(0,2), and the constant-kernel wrong model. | Correct component integrals are (0,2)=E[u\|invariants]; constant μ gives (1,1). | Barycenter alone would not fix the components. | Require the conditional-expectation identity. |
| Component reconstruction | Two-point identity, μ_x=δ_x. | Integrating δ_x gives singleton masses (1/2,1/2)=μ. | Agrees. | State reconstruction for every measurable set. |
| Invariance, ergodicity and constant components | Identity versus fair flip. | Identity components δ₀,δ₁ are invariant ergodic; flip has the constant component μ, and the integral of u=(0,2) is 1 at each point. | Components are system-dependent. | Include the endomorphism and ergodic-case contracts. |
| Entropy integration, including boundary weights | Fixed point and fair shift mixed with shift weight t=0,1/2,1. | ∫h_component equals 0,L/2,L; these are the mixture entropies. | Agrees; a real integral must not totalize an infinite entropy to zero. | Use the nonnegative extended integral, retaining +∞. |
| Infinite measure entropy and its component integral | Shift of independent symbols in a countable product of fair binary alphabets; observe the first m bits of each symbol. | The finite-label rates for m=1,2,3 are L,2L,3L; their supremum is +∞. The ergodic component kernel is constant μ, so ∫⁻(+∞)dμ=+∞=hμ(T). | Retaining the extended value is essential even on this compact metric system. | Keep the extended nonnegative entropy and integral. |
| Sphere specialization | z↦z² on the complex sphere, angular measure and fixed-point Dirac measure. | Angular predecessor weights (1/2,1/2) give L; the fixed-point probability has entropy 0; sphere topological entropy is L. | Borel/compact metric hypotheses fit both measures. | State the specialization and update §§2.67, 2.85. |
| Maximal-entropy consumer | Half angular probability, half fixed-point Dirac for z². | Entropy integral L/2<L; a component of entropy 0 with positive weight cannot maximize. | Integration has the required implication. | Update §2.90 to the imported Birkhoff and precise decomposition interfaces. |
| Definition F_k and initialization | Translation z↦z+1, p=2 and p=3. | x₀=f^[1](0)=1 for both primes, not 0; subsequent values are 2,4,8 and 3,9,27. | Index starts with f(0). | Replace the predecessor initialization. |
| Successor identity | Same translations, k=0,1,2. | p=2: F_k^[2](0)=2,4,8=x_(k+1); p=3: F_k^[3](0)=3,9,27=x_(k+1). | Agrees without negative indices. | State the successor formula. |
| Invalid predecessor at k=0 | f=z²+z−2, p=2. | x₀=−2; F₀^[2](0)=0. | Old identity is false. | Remove it and retain the negative-control Check. |
| Incorrect recurrence and coincident exponents | Translation, p=2, k=2 and k=3. | Exponents p+p^(k−1) and p^k are 4=4, then 6≠8. | A blanket inequality for all k≥2 was also false. | Replace it with the precise generally-wrong-exponent statement. |
| Recursion range and terminal valuation | Period-two polynomial, e=1; then range e=2. | For e=1, {k≥0:k+1<e}=∅ and min(ord(−2),∞)=1=ord(2); e=2 permits k=0 only. | No truncated-subtraction predecessor or spurious recursion index. | Write k+1<e and retain the terminal-index distinction. |

**Commit and validation.**

Committed d7b0a198, `ArithmeticDynamics: review repairs (entropy suppliers, entropy hypotheses, and iterate indexing)`. Only `TauCetiRoadmap/ArithmeticDynamics/README.md` changed; Suggested.lean is unchanged, the worktree is clean and nothing was pushed. No pull-request text or merge-order file was edited.

`lake build TauCetiRoadmap.ArithmeticDynamics.Suggested` exited 0, with the eleven expected admitted-headline warnings and the exact outcome:

```text
Build completed successfully (8976 jobs).
```

The prescribed dependency-direction check exited 0; it produced no UPWARD or CYCLE line and required no move:

```text
depcheck: 48 roadmaps, 554 edges, 0 problem(s)
```

The prescribed gate against origin/main exited 0 after the commit:

```text
gate ArithmeticDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
