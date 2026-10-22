# Repair report: probabilistic and metric number theory

The first nineteen finding sections follow review r1a. The remaining five follow r1b; its F05 overlaps r1a F18 and is settled there. Repeated F-numbers retain the severity of their originating review. Verdicts concern the mathematical claims and the permitted package edits, not independent acceptance.

## F01 (P2) — applied

Old implementation revisions → Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Updated every native-source link and verified its path at the pins. Located empirical integrals, Gaussian moments, conditional-expectation triviality and reverse-martingale convergence in their actual pinned modules. `Suggested.lean` elaborates at these revisions.

## F02 (P1) — not actionable in this package: upstream uniform sieve estimate

Unowned “fundamental lemma” invocation → explicit `gap:kubilius-uniform-sieve`, recorded in both supplier contracts and `packages/ProbabilisticAndMetricNumberTheory/design/plan.json`. Its summed rough-number error is stated uniformly in N,y; smooth-part factorization identifies its atoms with the full valuation vector. Kubilius2021 lines 46–52 specify the comparison. Providing the missing sieve theorem requires the named supplier, outside these edit permissions.

## F03 (P1) — applied

Ordinary Erdős–Kac as the sole input → `restricted_squarefree_second_moment`, proved from AnalyticNumberTheoryPartI §§3.12a, 3.32's marked-prime analytic expansion. Differentiating twice gives the half-log-log center and variance O(log log N). Chebyshev gives exceptional fraction O(L⁻¹ᐟ³), stronger than L⁻¹ᐟ¹⁰⁰. Added its Lean signature and checks. KoymansPagano2022 lines 2832–2848 identify the family and window.

## F04 (P1) — applied

“Measurable T and real f” → measurable T and measurable real f. Added the identity transformation with a non-Borel indicator as a negative control: every positive-length average, and hence its limit, equals that indicator. Kept measurable representatives and orbit-conull transport separate for merely integrable observables.

## F05 (P1) — applied

Unnamed moment-convergence invocation → `gaussian_weak_convergence_of_moments`, with explicit absolute-moment finiteness and convergence of every raw moment. Assigned tightness, higher-moment uniform integrability and Gaussian determinacy to its proof; also gave the direct characteristic-function remainder. Added its Lean signature and the Rademacher fourth-moment control. TAO-CLT-2010 lines 274–290 support the Taylor argument, extended explicitly beyond uniform subgaussianity.

## F06 (P1) — applied

Nonexistent local entropy targets → finite `logarithmic_elliott_finite`, affine invariance, modulated short sums, finite entropy/mutual information, entropy decrement, decoupling, large spectrum and circle estimates. Quantifiers follow the source scale hierarchy; character periods and the entire height interval are retained. Added the finite Lean headline. Evidence: TaoLogChowla lines 209–221, 586–616, 644–650, 980–1001, 1113–1186, 1190–1313.

## F07 (P1) — applied

Nonexistent DT.0 bounded-digit export → the actual BadlyApproximable predicate from DiophantineApproximationAndTranscendence §0.6 and a local `bounded_partial_denominators_iff_badlyApproximable` target. Its proof uses convergent errors and Legendre; the semiorbit consumer now names it. Added irrational, rational-termination and unbounded-digit checks. Primary characterization: Smyth2020 lines 2534–2538, Exercise 2.20; supporting Theorems 25, 27, 29.

## F08 (P1) — disputed

The supplied merge order places this package at line 84 and ArithmeticDynamics at line 187. The review's assertion that ArithmeticDynamics is earlier is false. Its §2.6 does indeed state Birkhoff, but the binding direction rule moves this necessary foundation to the earlier package. Retained the general proof and both signatures; identified ArithmeticDynamics §2.6 solely as a downstream consumer.

## F09 (P1) — not actionable in this package: missing stronger analytic supplier contracts

Stale AN.2/AN.3/AN.5/ES.0 → verified AnalyticNumberTheoryPartI §§0.19, 0.21, 1.5, 3.18, 3.33 and the local finite-lag inequality. Stronger restricted means, Liouville twists, modulated sums and prime restriction are explicit gaps, not claimed exports. Exact available supplier sections were read at their roadmap heads. Adding the missing upstream statements requires their owners; dependency direction passes.

## F10 (P2) — not actionable in this package: upstream general multiplicative mean estimate

Prime-power-constant-only contract → the full uniform `0≤f≤τ_k` estimate as `gap:divisor-bounded-multiplicative-mean`, with k-dependent constant, positive-integer support and x≥1. Retained the elementary constant-one refinement separately. Added τ₂, constant-one and vanishing-prime checks. KM-2020 lines 1080–1092 give the full hypothesis and cite Koukoulopoulos2019 Theorem 14.2. The broader upstream export requires its supplier.

## F11 (P2) — applied

Leading-vector sufficiency alone → `polynomial_equidistribution_iff` and `polynomial_total_equidistribution_iff`, for finite tori and every positive degree. Retained the sufficiency corollary. The proposed frequency criterion is correct: if all detected coefficients are torsion, a common multiple of that frequency kills them. Source: TAO-HOFA-1.1 lines 487–495, Exercise 1.1.6. The irrational lower-degree example is covered.

## F12 (P3) — applied

Missing manifest → schema-v1 `sources.toml` with thirty unique works, bibliographic/version/locator fields and legal-access records. Mathlib and Tau Ceti bibliography labels share their respective single work entries. Sources were attempted through the service; the supplied Strauch cache was reused, and the seven operator-settled citations retain their lifetime keys and waived status. No unresolved source request remains.

## F13 (P3) — applied differently

Weak mirrors → proved additive/counterexample, prime-sum, Dirac, gauge, rational-digit, ordered-matrix, short-mean and random-model checks. Supremum boundaries, binary nonnormality, Gauss mass/cylinders, mixing counterexamples, transfer values and harmonic windows requiring undeveloped interfaces became named theorem targets in both files. The logarithmic Khinchin summand is proved nonzero and convergence is named. No admitted examples; at most two examples per kept definition.

## F14 (P3) — applied

Admitted probability instance → `theorem gaussMeasure_probability : IsProbabilityMeasure gaussMeasure`. Gauss probability bundles pass that proof explicitly. There is no admitted instance and no sorry-defined data. The proposition and normalization are unchanged.

## F15 (P3) — applied differently

Repeated shrinking-radius hypotheses → power-gauge expansion, identity-gauge and excluded-dimension-zero checks. Added `power_gauge_radius_convention`, which states admissibility of the actual positive power gauge and the radius inequalities. This is a named boundary target because the power-gauge API is not developed here; an unrelated theorem about real powers alone is not used as its example.

## F16 (P1) — applied

Secondary attribution and an unspecified divergence argument → the primary PollingtonVaughan1990 theorem/proof, pp.190–200, with separately stated coordinatewise overlap and zero–one contracts. Specified tail sums, k≥2, radius reduction, product overlaps and the positive-to-full measure step. The primary source retains operator-waived access status; no intermediate printed lemma number was invented. BeresnevichVelani lines 55–60 remain attribution only.

## F17 (P2) — applied

Liouville-only ordinary correlation bound → `real_multiplicative_two_point_nontrivial` for every real bounded completely multiplicative function with f(1)=1 and some negative positive-input value. Added the easy Lean signature and negative controls; Liouville is its specialization. Constants depend on both f and shift. MatomakiRadziwill lines 109–117 verify this generality and the complete-multiplicativity condition.

## F18 (P3) — applied

Merged r1a F18 and r1b F05. Removed the Lean footer catalogue and all four cited process notes. Koksma now has the named signed-measure/BV integration bound with actual jump conventions, native inputs and three checks. The decay exponent is stated mathematically. Finite-measure atom countability and integral-series interchange are stated directly, without acquisition or declaration-matching narrative.

## F19 (P2) — applied

Finite prime metadata → arbitrary prime sets. Quality has an explicit zero-edge-mass guard and a convergent infinite product otherwise; named convergence and finite-specialization targets justify positivity and cancellation. One edge forces nonzero exponents into the finite prime support of its endpoint product; the remaining logarithms are summable. Added the all-primes, unit-vertex witness. KM-2020 lines 877–892 verify the unrestricted carrier.

## F01 (P3) — applied

Review r1b. Replaced the admitted positive-input expansion of `primeDivisibilitySum` by `simp [primeDivisibilitySum, hn.ne']`. The API remains in the README, and the direct proof elaborates at the pins.

## F02 (P2) — applied differently

Review r1b. GN.4 → GeometryOfNumbersAndQuadraticArithmetic §§4.2.1–4.2.2, 4.5, plus AdelicAlgebraicGroups AA.2–AA.3 quotient integration and finite volume. Verified the actual howe_moore, moore_ergodicity and Reduction.arithmetic_finite_volume_iff contracts. Transpose remains local. Updated consumers and the mixing docstring; retained the distinction between flow ergodicity and time-one mixing. AA.2 is needed in addition to the suggested AA.3.

## F03 (P3) — applied

Review r1b. Nonexistent ArithmeticDirichletSeries AN.0 → the completed roadmap's actual Export contract, with its `../../Completed/ArithmeticDirichletSeries/README.md` link. Its existing arithmetic/Dirichlet-series foundation remains imported.

## F04 (P3) — applied

Review r1b. Dangling AdditiveCombinatorics:AC.5 ownership → a direct statement that nilsequence orthogonality is outside this roadmap. No nonexistent supplier is advertised and no extra theory is added.

## F06 (P3) — applied

Review r1b. Description of the printed overlap indicator “M≥gcd” → “the printed M>gcd”. KM-2020 line 613 verifies the strict source indicator. The package's corrected necessary condition remains 2M≥gcd; the q=2,r=3,ψ=3/10 witness retains overlap 1/6.

## Gate failures

- **Missing sources.toml:** added thirty unique work records, including the native-library aliases, exact version notes, locators and the settled waived citations. All required bibliographic fields are present; no machine path is recorded.
- **TeX outside code:** enclosed 406 formula tokens in code spans, preserving their mathematics. The gate reports `tex=0` and `latex=0`. No anchor tags were restored, and all internal links match heading slugs.
- **Sorry-defined data:** changed the Gauss probability instance into an explicit theorem; the gate reports `sorry-data=0`.
- **README identifiers:** retained the compact signatures and added mathematical API explanations to the relevant definition docstrings, where subordinate names are mentioned in context. Added actual signatures for the missing easy headlines. Removed the footer catalogue. The gate reports `readme-ids-missing=0`; every Lean declaration name occurs in the README.

## Checks

The required elaboration of `packages/ProbabilisticAndMetricNumberTheory/Suggested.lean` from the pinned content checkout exited **0**, with **73** expected `declaration uses sorry` warnings and no errors. The existing imported Tau Ceti object was present; no module build was necessary. There are 1,111 lines, 40 proved examples, no sorry examples, no data admissions and no option overrides.

A separate signature audit checked the elaborated types of both polynomial criteria, Gaussian moment convergence, the restricted second moment, both general Birkhoff theorems, the Gauss probability theorem, homogeneous consumers, finite Elliott and the general real correlation theorem. It exited **0**. Every required integrability, finiteness, coefficient, character/height, irrationality, diagonal-matrix and unipotent-matrix hypothesis remained in the elaborated type.

The required dependency check exited **0**, with exactly:

```text
depcheck: 10 roadmaps, 83 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The later ArithmeticDynamics reference is under Downstream consumers.

The package content gate reports zero for every listed failure and every other content category. Its repository-state check reports the intentionally uncommitted package edits; the worker performs the commit. A scratch layout supplies the gate's expected `TauCetiRoadmap` directory while checking the actual package files. `git diff --check` passes. The structural audit found zero broken internal heading links, zero Lean names missing from the README, and six matching supplier-gap entries.

## Adversarial mathematics pass

The table covers the definitions, theorem families, identities and conventions in README layer order. Elaborating admitted statements establishes their types, not their mathematical truth.

| Statement or convention | Instances tried | Result | Change |
|---|---|---|---|
| Additivity, strong additivity and prime-power representation | 0, 1, ω, Ω, the convolution unit; Ω(4)=2 and Ω(2)=1 | Positive-input guards and f(1)=0 distinguish the laws | Proved native positive and negative examples |
| Weighted divisibility sums and first/second moments | Empty primes, repeated index, 1, 12, signed weights; P={2,3}, a(p)=p, N=5,6 | At N=5 mean=7/5 and centered second moment=9/5; at N=6 mean=2 and moment=3 | Combined unit-weight, duplicate-index and unit-input examples |
| Divisibility counts and Boolean patterns | d=1, N<d, empty positive/negative prime sets, complete periods | Floors, diagonal lcm and signs retain their stated values; no N=0 probability is asserted | No mathematical alteration |
| Higher finite moments, pairing and cutoff removal | One prime p=3, exponents 0,2,3; repeated positions; zero variance; empty support | Local moments 2/9 and 2/27; odd local moments need not vanish; collision bounds do not divide by variance | No mathematical alteration |
| Residues and CRT statistics | Empty index, modulus 1, composite coprime moduli, N<Q; N=5,Q=6 | Joint TV error is 1/6 in the last case; complete periods are exact | No mathematical alteration |
| Ω−ω bounds and distribution sandwiches | n=1,4; moment order 0; nonpositive thresholds; atomic limit laws | Excess is 0 at 1 and 1 at 4; exponential/moment and continuity-point formulations retain boundary cases | No mathematical alteration |
| Concentration and Kolmogorov–Rogozin | δ≤0, positive-radius Dirac, fair atoms {0,1} at strict radius 1/2, zero dispersion denominator | Dirac gives 1 at positive radius; two atoms give 1/2, not 1; zero denominator needs the separate trivial bound | Proved positive Dirac example; named the two-atom boundary |
| Growing-prime valuation model | Empty cutoff, β exceeding log N/log 2, exponents ≥2 | Empty vectors agree; divisibility bits cannot replace valuations | Explicit smooth/rough atom identity and upstream sieve gap |
| Turán–Kubilius and normal order | N=2, zero additive function; prime powers | The source center at N=2 gives squared error f(2)²/2; positive hypotheses are retained | No mathematical alteration |
| Gaussian and restricted-family limits | Orders 0,1,2,4; fair ±1 law; D(14)={1,2,5,10,13} | Matching mean/variance alone fails; replacing the half center by L introduces order-L² bias | Added Gaussian bridge and conditional moment target |
| Equidistribution predicates and Haar normalization | Constant sequences, finite changes, positive progressions, empty torus, zero frequency | Constants have Dirac law; the empty torus has probability one; frequency zero is excluded | Added the general polynomial criteria |
| Linear/polynomial torus laws and rational decompositions | Rational rotations, n(n+1)/2, n²/2+n√2; rational torus cosets | Common frequency multiples detect torsion; irrational lower-degree coefficients can give total equidistribution | Retained full criterion and leading-term corollary |
| Discrepancy, BV and normal digits | Empty/singleton samples; singleton 0 and 1/2; both one-sided jumps; binary 0,1/2; empty block | Discrepancies 0,1,1/2; actual jump values require one-sided control; terminating tails are nonnormal | Named boundary targets and the signed BV bridge |
| Reduced/unrestricted approximation and dimension exponent | q=0,1, ψ=0, ψ=1/2; rational and irrational points; exponent 0 | Reduced zero-radius limsup differs from the unrestricted rational limsup; exponent-zero divergence does not assert positive-gauge MTP | No mathematical alteration |
| Overlaps and GCD graph carrier/quality | q=2,r=3,ψ=3/10; empty edges; zero weights; all-prime metadata and unit vertices | Overlap 1/6 contradicts the printed cutoff; nonzero graph exponents have finite support | Corrected source description; generalized metadata and product |
| GCD pruning, valuation restrictions and arithmetic anatomy | p=2,3; k=l=0; unequal valuations; τ₂; f(p)=0 | Exact valuations and positive-mass guards are needed; τ₂ is excluded by the old special case | Restored general mean contract; retained the elementary special case |
| Dimension gauges, coverings and mass transference | Zero, identity and square gauges; k=0; r<1 and 0<s<1 | Zero gauge fails positivity; r^s>r; identity gives unchanged balls; k=0 cannot form 1/k | Proved gauge examples; named the actual power-gauge convention |
| Higher-dimensional reduced approximation | k=2, q=2; coordinate numerator 0 versus joint primitivity; ψ=0 | Separate coprimality is essential; convergence and divergence require different inputs | Primary-source, overlap and zero–one targets |
| Pointwise averages, canonical limit and measurability | Identity, two-point swap, constant observables, successor divergence, non-Borel indicator | Identity limit equals f; default zero handles divergence; measurable T alone does not make f measurable | Added the missing observable hypothesis and negative control |
| Gauss map, digits and measure | 0, 1/2, 2/3; upper-half interval; rational termination | T(2/3)=1/2; digits are 1,2,0; upper-half mass is log(4/3)/log 2 | Proved digit conventions; explicit probability theorem and interval target |
| Cylinders, word matrices and orbit products | Empty word, zero digit, [1,2] versus [2,1]; N=0,1,2 | Reversal changes both map and matrix; empty orbit product equals q₀=1; determinant parity agrees | Proved empty/single/reversed matrix and branch checks |
| Exactness, mixing and logarithmic constants | Dirac identity, fair identity/swap; first two digit summands | Dirac identity satisfies both predicates; fair systems fail; a=2 contributes log(9/8)>0 | Named negative controls and summability; proved nonzero summand |
| Transfer operators and Gauss–Kuzmin | Inputs 0,1,id, invariant density; x=0,1; n=0 | L1(0)=π²/6; P1=1; P(id)(0)=π²/6−1; contraction coefficient 18913/21600<9/10 | Added distinct named normalization targets |
| Homogeneous consumers | q=0, x=0, transpose, source time s=2t; rational terminated digits | Positive-time column vector is (e^t(p+xq),e^(−t)q); rational bounded digits do not give bounded orbit | Local irrational digit characterization and corrected suppliers |
| Inclusive short means and multiplicative correlations | h=0,1; constant positive observations; coincident forms; x=w=2,4; f≡1 | Means are 0, f(x)+f(x+1), (h+1)/h; harmonic numerators are 1/2, −1/12; coincident forms give 13/12 | Proved constant-mean check; finite Elliott and general MR corollary |
| Entropy/Fourier proof contracts | Constant variable; independent and identical fair bits; empty prime product; bounded arbitrary prime phases | Entropies 0 and log 2, mutual information 0 or log 2; independence of arithmetic blocks is not assumed | Named all finite probabilistic and Fourier inputs; recorded analytic gaps |
| Rademacher/Steinhaus outcomes and moments | n=0,1,4,6,12; absent independence; diagonal/off-diagonal prime exponents | Squarefree signs kill 4; phases retain squared prime; both empty products give 1 | Proved one/six/zero-extension checks; no deterministic cancellation inferred |

## Maintainer notes

Six supplier gaps are explicit, with matching records in `packages/ProbabilisticAndMetricNumberTheory/design/plan.json`: two for SieveMethodsAndPrimePatterns and four for AnalyticNumberTheoryPartI. The sieve section descriptions identify requested interfaces; they do not claim a nonexistent exported theorem or fabricated section number. These are external ownership questions for the maintainer, not assertions that the suppliers already satisfy them.

ArithmeticDynamics §2.6 must consume the general pointwise theorem from this earlier package; this report does not edit that later roadmap. DiophantineApproximationAndTranscendence supplies its existing predicate, while the new bounded-native-digit characterization belongs here. No existing public Lean name was removed; `gaussMeasure_probability` changes declaration kind from instance to theorem, so downstream probability bundles must pass its proof explicitly. The root namespace, additive-law and Gauss headline names remain stable.

No commit, push, pull-request edit or source-text copy was made. Waived sources were not reopened. Source passages are cited by locator rather than reproduced.
