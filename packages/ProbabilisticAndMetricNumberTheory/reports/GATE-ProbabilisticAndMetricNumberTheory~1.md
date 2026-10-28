## H01 (CBirkbeck) — applied differently

The untwisted character-prime citation in `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:6452`–6482 is replaced by owned high-height prime-phase and compact-height Euler-comparison targets: MatomakiRadziwill line 520 (Lemma 2 proof, physical p.12) supplies the former's exact range, and raising the character to order 2r gives the uniform lower bound `(log log x)/(16r²)−C_(χ,A)` throughout `1/r≤|t|≤Ax`.
The compact-height comparison handles `|t|≤1/r`, with the native inputs and their hypotheses specified at README line 47, so the deduction covers the whole height interval required by TaoLogChowla line 230 and line 270 without requiring the suggested growing-height reciprocal-L estimate.

## H02 (CBirkbeck) — applied differently

The assertion of an established ArithmeticDynamics consumption agreement is replaced by an explicit offered interface in `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:15` and line 6795; line 6571 identifies finite Shannon entropy as independent of the correlation arguments, and the partition-label formula explains its use for finite partition entropy and joins.
The supplied ArithmeticDynamics head `6db9f1f` still duplicates all-L¹ Birkhoff at `TauCetiRoadmap/ArithmeticDynamics/README.md:2307`: its §2.6 must consume the two named pointwise interfaces, and §2.7 must consume the finite Shannon interface, before the consumer-side conflict is resolved; editing that read-only roadmap is outside this job's authorization.

## H03 (CBirkbeck) — applied

The zero-separation checks now specify the principal character modulo 1 in `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:6478`, line 6567 and line 6610.
Line 6479 adds the modulus-2 witness at x=3,t=0: the Liouville sum is 7/6 and the constant-one replacement is 1/2, with the general replacement equal to the bounded sum of 1/p over primes dividing the modulus.

## H04 (CBirkbeck) — applied

The broad ownership claim for probability bridges is replaced by the Gaussian specialization's direct characteristic-function proof in `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:2125`, while line 9 leaves the general moment-to-weak theorem and reusable tightness/uniform-integrability machinery with RandomMatrices Milestone 3, as recorded in main's `TauCetiRoadmap/FreeProbability/README.md:114`.
`TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/Suggested.lean:161` now describes that specialized proof; its theorem retains all absolute-moment integrability hypotheses, and comparing the two Taylor remainders gives the explicit bound `2|t|^(2k)/(2^k k!)` (TAO-CLT-2010 line 284).

## Verification

The repaired analytic statements use the existing MatomakiRadziwill and TaoLogChowla source keys and the existing analytic suppliers; no source request or new source key is needed. The high-prime phase estimate is the complex prime sum inside the proof at MatomakiRadziwill line 520, with its bound at line 526, applied with the source's phase parameter u/2; its source range 1≤|u/2|≤x^B contains the required range 2≤|u|≤x^B. The finite-order argument applies to every character, including imprimitive characters, and retains all primes dividing its modulus as an explicitly bounded correction. No character-uniform constant or fixed-t substitute is asserted.

At the pinned Mathlib revision `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, the declarations used by the compact-height comparison are `DirichletCharacter.LSeries_eulerProduct_exp_log` (`Mathlib/NumberTheory/EulerProduct/DirichletLSeries.lean:139`), `LFunction_eq_LSeries` and `differentiableAt_LFunction` (`Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:74` and line 91), `LFunctionTrivChar_eq_mul_riemannZeta` (the same file, line 173), and `LFunction_ne_zero_of_one_le_re` (`Mathlib/NumberTheory/LSeries/Nonvanishing.lean:397`). Their Re s>1, off-pole and nonvanishing hypotheses are retained. These existing declarations are consumed; the finite-cutoff uniform-error estimate is the new comparison target.

At the pinned Tau Ceti revision `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, `tendsto_integral_abs_birkhoffAverage_sub_condExp` (`TauCeti/Probability/Ergodic/CondExpProjection.lean:169`) requires `MemLp f 2 μ` and concludes mean convergence. Thus it does not supply the all-L¹ almost-everywhere theorem here. Finite Shannon formulas and their chain rule agree with TaoLogChowla line 870 and line 880; no dynamical entropy is constructed here.

Ownership searches covered main, the board packages and the supplied open-roadmap folders, using objects as well as declaration names. No other owner of the new growing-height prime-phase estimate was found; AnalyticNumberTheoryPartI §0.18 supplies an untwisted estimate and §3.18 supplies the distance API. The specified stronger analytic input therefore remains in §5.2. The standing order puts this roadmap before ArithmeticDynamics, so moving Birkhoff into that consumer would reverse supply; the remaining consumer edit is recorded in H02. The supplied open ArithmeticDynamics checkout was inspected at its actual head, rather than assuming the review's older cited head. Full ownership against the unsupplied RandomMatrices open-pull-request files was not checked; the boundary is supported independently by main's FreeProbability shared-foundations contract. Other unsupplied open-pull-request files were not inspected.

The named cross-roadmap contracts were resolved against main or their indexed open heads, including AnalyticNumberTheoryPartI §§0.19, 0.21, 1.5, 3.12a, 3.18, 3.32, 3.33, 3.41; ArithmeticDirichletSeries Export contract and Layer 6; DiophantineApproximationAndTranscendence §§0.5–0.6; GeometryOfNumbersAndQuadraticArithmetic §§4.2.1–4.2.2, 4.5; and AdelicAlgebraicGroups AA.2–AA.3. The resolver reported no unresolved cross-roadmap citation or roadmap declaration name; newly cited library declarations were checked directly at the pin.

A scratch copy with `#check @name` for all 89 declarations was elaborated once after the edit and compared with the README: no declaration signature changed and no necessary hypothesis was missing. The three flagged homogeneous declarations already include ha (and hu for the two semiorbit statements); the finite-degree `torusPolynomial` definition needs no `Fintype d`, because it sums over degree rather than coordinates, while the Haar and Fourier theorems retain finite-coordinate hypotheses. No binder repair was necessary.

The following adversarial pass records the changed statements, their intermediate identities and their interface conventions. Finite phase-sum values test the sign, cutoff and inequality deductions; the uniform asymptotic estimate is the explicit source-supported analytic target.

| Statement | Instances tried | Computed values | Result | Change |
| --- | --- | --- | --- | --- |
| Gaussian moment-to-weak statement | Constant standard Gaussian; point mass at 0; fair signs | Moments (0,1,2,4): Gaussian=(1,0,1,3), point mass=(1,0,0,0), fair signs=(1,0,1,1); the last two fail a required moment | Pass | Retain full Gaussian specialization |
| Gaussian Taylor bound, order 1 | t=1 and constant Gaussian sequence | Characteristic-function difference=0; bound=1 | Pass | Two remainders give the factor 2 |
| Gaussian Taylor bound, order 3 | t=1 and constant Gaussian sequence | Characteristic-function difference=0; bound=1/4 | Pass | Two remainders give the factor 2 |
| Gaussian Taylor bound, order 5 | t=1 and constant Gaussian sequence | Characteristic-function difference=0; bound=1/24 | Pass | Two remainders give the factor 2 |
| Gaussian Taylor bound at t=0 | Any probability; k=1 | Characteristic functions at 0=1=1; error=0; bound=0 | Pass | None |
| Moment integrability without subgaussianity | Mixture (1-1/(n+2))Gaussian+1/(n+2)lognormal; fourth moment | n=0: (3+exp(8))/2=1491.978993521; limit=3; all moments finite and each lognormal component has no positive Gaussian exponential moment | Pass | No uniform subgaussian hypothesis introduced |
| High-prime cutoff and reciprocal-prime mass | epsilon=1/12; log x=64 | 2/3+epsilon=3/4; log y=22.627416998; log log x-log log y=1.039720771=(log 64)/4 | Pass | Positive coefficient 1/4 |
| High-height phase estimate: finite diagnostics | x=10000, epsilon=1/12, u=2 and -2 | y=197.743147; phase sum(u=2)=0.055479942+0.086265642i; sum(u=-2) is its conjugate; abs=0.102566003 | Pass | Analytic uniform bound is the source-backed target, not inferred from this sample |
| Separation from the high-prime estimate | Same x and u=2 | Full separation=2.755825306; tail mass=0.539050998; tail-mass minus abs phase sum=0.436484995; full separation >= that value | Pass | Use nonnegativity when discarding low primes |
| Lower height guard | u=0; x=10000 | Phase sum=0.539050998=tail mass; asymptotic main term=(log log x)/4 diverges | Pass | Exclude u=0 |
| Real-part convention | u log p=0 and pi | 1-cos(0)=0; 1-cos(pi)=2; division gives 0 and 2/p; either exponential sign gives these values | Pass | None |
| Euler logarithm sign | Principal character modulo 1, sigma down to 1, t=0 | Prime harmonic sum=log log x+O(1); log zeta(1+1/log x)=+log log x+O(1) | Pass | Positive log L term |
| Deleted Euler factor at modulus 2 | sigma=3/2,t=0; sigma down to 1 | log(1-2^(-3/2))=-0.436264668; boundary value=-log 2=-0.693147181 | Pass | Principal imprimitive character included |
| Compact-height reciprocal and pole convention | Principal character, sigma down to 1, t=0 | L behaves as 1/(sigma-1); reciprocal tends to 0; log abs L tends to +infinity | Pass | Bound reciprocal after extending it at the pole; no junk L value |
| Prime-power remainder in Euler comparison | p=2; sigma>=1; z=1/2 | sum over k>=2 z^k/k=-log(1-z)-z=log 2-1/2=0.193147181; finite | Pass | Absolute control uses norm chi<=1 |
| Principal-character check modulo 1 | x=5, t=0 | Liouville sum=31/15; replacement by 1=0 | Pass | Primes dividing the modulus contribute 1/p in both sums |
| Principal-character check modulo 2 | x=5, t=0 | Liouville sum=47/30; replacement by 1=1/2 | Pass | Primes dividing the modulus contribute 1/p in both sums |
| Principal-character check modulo 6 | x=5, t=0 | Liouville sum=37/30; replacement by 1=5/6 | Pass | Primes dividing the modulus contribute 1/p in both sums |
| Exact reviewer witness | q=2,x=3,t=0 | Liouville=1/2+2/3=7/6; replacement=1/2+0=1/2 | Pass | Add modulus-2 negative control |
| Finite-order powering identity | Quartic character modulo 5: chi(2)=i, r=4,t=0 | z_2=(-1)*conj(i)=i; z_2^8=1=2^0; at p=5, chi(5)=0 and z_5=0 | Pass | Power only on units; retain nonunit corrections |
| Powering inequality at r=1 | z=exp(i*pi/3) | LHS=1.500000000; RHS=2.000000000; coefficient of log log x=1/16 | Pass | Positive fixed r required |
| Powering inequality at r=2 | z=exp(i*pi/3) | LHS=1.500000000; RHS=8.000000000; coefficient of log log x=1/64 | Pass | Positive fixed r required |
| Powering inequality at r=4 | z=exp(i*pi/3) | LHS=1.500000000; RHS=32.000000000; coefficient of log log x=1/256 | Pass | Positive fixed r required |
| Removed nonunit-prime cost | q=6, primes 2 and 3 | Each phase-separation summand <=2/p; total loss <=2(1/2+1/3)=5/3 | Pass | No lost primes in the final Liouville sum |
| Linear height transport, r=1,A=1 | x=2rA; t=1/r and t=Ax | Lower abs u=2; upper abs u=2rAx=4=x^2=4 | Pass | Threshold may depend on character and A |
| Linear height transport, r=2,A=3 | x=2rA; t=1/r and t=Ax | Lower abs u=2; upper abs u=2rAx=144=x^2=144 | Pass | Threshold may depend on character and A |
| Linear height transport, r=4,A=1 | x=2rA; t=1/r and t=Ax | Lower abs u=2; upper abs u=2rAx=64=x^2=64 | Pass | Threshold may depend on character and A |
| Full-height divergence coefficient | epsilon=1/12; r=1,2,4 | High-height coefficients=1/16,1/64,1/256; compact-height coefficient=1; each remains positive | Pass | Uniform constants in each of the two t ranges |
| Pointwise Birkhoff conditional-expectation boundary | Identity on fair two-point space; f=(0,2) | All nonempty averages=(0,2); invariant conditional expectation=(0,2); integral=1; map is not ergodic | Pass | Retain arbitrary L1 and separate ergodic specialization |
| Pointwise Birkhoff ergodic boundary | One-point probability; f=2 | A_0=0; A_N=2 for N>=1; integral=2 | Pass | N=0 does not affect the limit |
| L1 versus L2 supplier boundary | f(x)=x^(-3/4) on (0,1) | Integral f=4; integral f^2=infinity | Pass | Mean theorem with an L2 hypothesis does not replace all-L1 pointwise convergence |
| Finite Shannon entropy definition and normalization | One atom; fair two atoms; an added zero atom | H(1)=0; H(1/2,1/2)=0.693147181=log 2; H(1/2,1/2,0)=0.693147181 | Pass | Finite probability prerequisite independent of correlations |
| Finite Shannon chain rule | Two independent fair bits; identical fair bits | Independent: H(X,Y)=1.386294361=2log 2, H(X conditional on Y)=log 2; identical: H(X,Y)=0.693147181=log 2, H(X conditional on Y)=0 | Pass | Joint label represents partition join |
| Finite mutual information | Independent and identical fair bits | Independent: 2log 2-log 4=0; identical: 2log 2-log 2=0.693147181 | Pass | Do not confuse finite entropy with dynamical entropy |
| Partition-label mass comparison | Fair four-point space; split into two pairs, then two independent such partitions | Single label masses=(1/2,1/2), entropy=log 2; joint masses=(1/4,1/4,1/4,1/4), entropy=log 4 | Pass | ArithmeticDynamics owns the partition carrier and joins |
| Homogeneous matrix hypothesis retention | t=log 2,x=1 | a_t u_x=[[2,2],[0,1/2]]; u_x a_t=[[2,1/2],[0,1/2]]; a_t determinant=1 | Pass | The elaborated ha and hu hypotheses are already present |
| Finite-degree torus polynomial and coordinate type | s=0 and s=1; n=0 | s=0 evaluates alpha_0; s=1 at n=0 also alpha_0 (0^0=1); the sum is over monomial degree, not coordinates | Pass | Fintype d is unnecessary for this definition; Haar theorems retain it |

Commit: `3fed15240e0c9d1c63847237b4279b5ffc017f6d` — `ProbabilisticAndMetricNumberTheory: review repairs (uniform twists and ownership boundaries)`. Only the two authorized roadmap files changed; nothing was pushed. The worktree is clean.

Build command: `lake build TauCetiRoadmap.ProbabilisticAndMetricNumberTheory.Suggested`.
Exit status: 0; expected admitted-target warnings; exact outcome:

```text
Build completed successfully (8978 jobs).
```

The dependency check produced no UPWARD or CYCLE line:

```text
depcheck: 28 roadmaps, 253 edges, 0 problem(s)
```

Gate exit status: 0; exact summary:

```text
gate ProbabilisticAndMetricNumberTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
