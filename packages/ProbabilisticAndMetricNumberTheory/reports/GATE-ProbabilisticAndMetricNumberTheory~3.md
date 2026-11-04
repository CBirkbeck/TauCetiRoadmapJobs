## H01 (CBirkbeck) — answered

ArithmeticDynamics §2.6 still assigns itself the same all-L¹ pointwise theorem at `TauCetiRoadmap/ArithmeticDynamics/README.md:2320` (supplied checkout head `8b597e6a`): it must consume `birkhoff_pointwise` and `birkhoff_pointwise_ergodic` from this roadmap §4.1, while §2.7 consumes the independent §5.2 finite Shannon API through partition labels and joins and retains measurable partitions, dynamical entropy, Shannon–McMillan–Breiman and ergodic decomposition. This roadmap precedes ArithmeticDynamics in the merge order (positions 265 and 268), and its own interface at `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:6804` already states that direction; the consumer is read-only in this job, so the duplicate ownership remains unresolved.

## H02 (CBirkbeck) — answered

The description's claim of transitive independence is false: AnalyticNumberTheoryPartI at `4ba2e21a` explicitly requires LFunctions, ZerosOfLFunctions and GlobalHolomorphicFunctions, and its supplier contracts at `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:63` and line 80 name their mathematical inputs. The PR description is outside the authorized edits, so its correction remains outstanding: remove the blanket independence sentence, label the target-level graph below as mathematical prerequisites rather than a complete whole-PR closure, and acknowledge these three known external merge prerequisites without claiming that they exhaust the closure.

## H03 (CBirkbeck) — applied

`TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:4137` changes extension “by continuity at infinity” to the existing `extendedGauge` formula and explicitly restricts comparisons to sufficiently small finite diameters; the new Check at line 4304 computes f(1)=1/2, f(2)=2/3 and lim f=1 for f(r)=r/(1+r), whereas its extension takes ∞ at ∞. The positive-radius ratio is antitone, so no unboundedness hypothesis is added and the Lean acceptance statements remain unchanged.

## Evidence, citations and ownership

BeresnevichVelani line 132 defines dimension functions using continuity, monotonicity and the zero-radius limit, without an unboundedness requirement; BeresnevichVelani line 142 restricts Hausdorff covers by their small radii, and BeresnevichVelani line 252 states mass transference with the ratio hypothesis. The finite- versus infinite-ratio cases are distinguished at BeresnevichVelani line 268. The bounded-gauge calculations below are direct evaluations of the roadmap's definitions, not an additional sourced theorem.

At the Mathlib pin, `Mathlib/MeasureTheory/Measure/Hausdorff.lean:422` defines `Measure.mkMetric` for an arbitrary extended gauge; it imposes no continuity at infinity. `Measure.mkMetric_apply` at line 464 restricts covering diameters by a positive cutoff, and `Measure.mkMetric_mono_smul` at line 447 and `Measure.mkMetric_mono` at line 459 require only comparison near zero. Cofinal finite cutoffs exclude infinite covering diameters, so changing only the value at infinity has no effect. These are supplied native results, with no replacement declaration added here.

The ownership decision for Birkhoff agrees with Sarig2023 line 1841 (integrable observables and the ergodic integral limit) and Sarig2023 line 2111 (invariant conditional expectation). At the Tau Ceti pin, `TauCeti/Probability/Ergodic/MeanErgodic.lean:91` is the mean-ergodic theorem, and `TauCeti/Probability/Ergodic/CondExpProjection.lean:169` requires membership in L² and concludes convergence of the L¹ error, rather than the general pointwise statement. Moving the general pointwise input to the later ArithmeticDynamics would reverse the supply direction; neither a local weakening nor an assertion that the consumer already imports it would fix the ownership conflict.

Ownership searches covered the indexed main and open-roadmap objects, local board packages, and the README/Lean files of the 32 supplied sibling checkouts. ArithmeticDynamics remains the demonstrated pointwise-theorem conflict; no new construction, declaration or ownership move is introduced. Ownership against open PR files not supplied in the brief was not independently checked beyond indexed matches and the explicitly read supplier contracts.

Cross-roadmap citations were resolved against main `eafdde4` and indexed open heads, with the pinned Lake packages supplied explicitly: no unresolved roadmap citations or Lean names. The supplier clauses inspected were ArithmeticDirichletSeries' main Export contract and Layer 6; AnalyticNumberTheoryPartI §§0.19, 0.21, 1.5, 3.12a, 3.18, 3.32, 3.33, 3.41; DiophantineApproximationAndTranscendence §§0.5–0.6; GeometryOfNumbersAndQuadraticArithmetic §§4.2.1–4.2.2, 4.5; AdelicAlgebraicGroups AA.2–AA.3; ArithmeticDynamics §§2.6–2.7; and main's FreeProbability shared-foundations contract for RandomMatrices Milestone 3. The checked Mathlib and Tau Ceti revisions equal the manifest pins `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No additional source or manifest edit is needed.

## Concrete dependency correction for the description

The arrows below describe mathematical supply between targets, not the transitive merge constraints of whole PRs.

| Supplier and exact contract | Consumer |
| --- | --- |
| Mathlib and Tau Ceti at the pins: native arithmetic functions, counting, empirical probabilities, weak convergence, Haar, conditional expectation and continued fractions | Layers 0–5 on the native carriers |
| ArithmeticDirichletSeries, Export contract and Layer 6: truncated Perron and arithmetic Perron | §5.1 finite Dirichlet-polynomial comparison |
| AnalyticNumberTheoryPartI §§0.19, 0.21; §1.5; §§3.18, 3.33 | Arithmetic normalization, prime blocks/products, mean squares and multiplicative means |
| AnalyticNumberTheoryPartI §§3.12a, 3.32, 3.41 | §1.6 restricted squarefree moments and window |
| DiophantineApproximationAndTranscendence §§0.5–0.6 | §4.10 bounded native partial denominators and bad approximation |
| AdelicAlgebraicGroups AA.2–AA.3; GeometryOfNumbersAndQuadraticArithmetic §§4.2.1–4.2.2, 4.5 | §4.10 modular homogeneous-space applications |
| This roadmap §4.1 pointwise theorems and independent §5.2 finite Shannon API | ArithmeticDynamics §§2.6–2.7 through partition labels and joins; consumer contract still needs correction |

The description must separately acknowledge that AnalyticNumberTheoryPartI declares LFunctions, ZerosOfLFunctions and GlobalHolomorphicFunctions as whole-PR prerequisites. The indexed open-roadmap entries identify them as new roadmaps by roed-math, roed-math and kim-em respectively; this contradicts the independence sentence without establishing a complete prerequisite closure. No PR description or consumer file was edited.

## Signature comparison

A fresh scratch elaboration ran `#check @name` for all 89 declarations, plus the two local homogeneous-space instances, against the pinned imports. Each declaration was compared with its README statement and with its supplied elaborated type; all 89 freshly elaborated types are unchanged, with zero errors and 59 admitted-theorem warnings. `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/Suggested.lean` therefore needs no edit.

The four flagged declarations do not lose necessary hypotheses. `torusPolynomial` sums over the finite degree range and operates pointwise in the coordinate type, so it needs no `Fintype d`; torus probability and frequency theorems retain that binder. `homogeneous_birkhoff` retains the diagonal matrix equality through `include ha`, and both orbit theorems retain the diagonal and unipotent equalities through `include ha hu`. The quotient topology and Borel structure also elaborate with their intended local instance types.

## Adversarial mathematics pass

The table records computed cases for every changed gauge assertion, its affected conventions and headline interface, and the ownership/signature leads. Finite examples discriminate definitions and hypotheses; they are not proofs of the unchanged asymptotic theorems.

| Statement | Instances tried | Computed values on the relevant sides | Result | Change |
| --- | --- | --- | --- | --- |
| Bounded gauge satisfies IsDimensionGauge | f(r)=r/(1+r), r=0,1/2,1,2; zero and positive constant alternatives | f values 0,1/3,1/2,2/3; derivative 1/(1+r)²>0; f(1/n)=1/(n+1)→0; zero has f(1)=0, constant 1 has f(0)=1 | Bounded gauge admissible; wrong alternatives excluded by positivity and zero value | Added bounded-gauge Check |
| Finite values of extendedGauge | Same f at 0,1/2,1,2 | Extension values 0,1/3,1/2,2/3 equal f at every finite argument | Agrees with Lean body | No definition change |
| No continuity at infinity | f(n)=n/(n+1); identity gauge as control | f(n)→1 but extendedGauge f ∞=∞; identity tends to ∞ and has extended value ∞ | Required continuity would exclude an admissible bounded gauge | Replaced continuity instruction |
| Positive-radius ratio and totalized zero | k=1; r=1/2,1,2 and r=0 | f(r)/r=2/3,1/2,1/3, decreasing; at r=0 the totalized quotient is 0 while 1/(1+0)=1 | Ratio identity needs r>0; both README Check and predicate retain that guard | No extra hypothesis |
| Radius versus diameter normalization | r=1/4; bounded gauge and square gauge | Bounded: f(2r)=1/3 versus f(r)=1/5; square: (2r)²=1/4 versus r²=1/16 | Diameter argument must remain explicit | Existing convention retained |
| Small-scale comparison ignores infinity | Two extended gauges with identical finite values and infinity values 0 and ∞; n equal subintervals of [0,1] | At diameter 1/n both cover costs are n f(1/n)=n/(n+1): 1/2,2/3,4/5,8/9 for n=1,2,4,8; both tend to 1; infinite diameter is excluded at finite cutoff | Same finite-scale cover costs and same limiting metric measure | Corrected proof-plan wording |
| Dimension and ratio generality in mass_transference | k=1,f(r)=r/(1+r); k=1,f(r)=r; k=2,f(r)=r²; k=0 | Expanded radius at r=1/2 is 1/3,1/2,1/2 respectively; first ratio tends to 1 at zero; k=0 would totalize 1/k=0 and is excluded | Bounded gauge uses the finite-ratio case; positive-dimension guard retained | Headline unchanged |
| General pointwise Birkhoff | Two equiprobable points, f=(−1,1), identity map | For N=2, averages=(−1,1)=invariant conditional expectation; integral=0 | Measure preservation alone cannot give the integral limit | Ownership kept here; consumer conflict recorded |
| Ergodic pointwise Birkhoff | Same space, swapping map | N=2 averages=(0,0); integral=0; averages tend to (0,0) | Ergodic specialization has the correct limit | No theorem edit |
| Finite entropy on partition labels | Constant label, fair bit, independent fair-bit pair; zero-mass atom | Entropies 0, log 2, 2log 2; zero-mass contribution 0 | Natural-log and zero-atom conventions agree | Independent supplier API retained |
| Partition join and mutual information | Independent versus identical fair labels | Independent: 2log 2−log 4=0; identical: 2log 2−log 2=log 2 | Label-pair join distinguishes independence from equality | No entropy-decrement dependency |
| torusPolynomial binder lead | Circle, α₀=1/4, α₁=1/3; s=0 or s=1,n=−1 | Constant value 1/4; linear value −1/12=11/12 mod 1 | Coordinate finiteness is unnecessary for this finite degree sum | No binder edit |
| homogeneous_birkhoff binder lead | t=0 and t=log 2; wrong constant flow | Prescribed matrices diag(1,1) and diag(2,1/2), both determinant 1; constant identity has first entry 1 rather than 2 at log 2 | Retained ha excludes wrong flow | No binder edit |
| bounded_digits_compact_orbit binder lead | u at x=0 and x=1/2; wrong constant unipotent; rational x=0 as negative control | u matrices I and [[1,1/2],[0,1]], determinants 1; constant I has upper-right entry 0 rather than 1/2; x=0 has all digits 0 but orbit vector (0,e^(−t))→0 | Retained hu distinguishes u; irrationality excludes bounded terminating digits with escaping orbit | No binder edit |
| typical_unbounded_semiorbit binder and action direction | t=log 2,x=1/2 | a_tu_x=[[2,1],[0,1/2]] versus u_xa_t=[[2,1/4],[0,1/2]], determinants 1 | Both matrix hypotheses are present and product order is fixed | No binder edit |

## Validation

Commit: `58cbb88` — `ProbabilisticAndMetricNumberTheory: review repairs (finite gauge extension)`. Only `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md` changed; the worktree is clean and nothing was pushed.

`lake build TauCetiRoadmap.ProbabilisticAndMetricNumberTheory.Suggested` exited 0, with 59 admitted-theorem warnings and no errors. Its exact final output is:

```text
Build completed successfully (8978 jobs).
```

The first gate exited 1 solely for the uncommitted authorized README repair (`dirty=1`). After committing, the required gate exited 0 with this exact summary:

```text
gate ProbabilisticAndMetricNumberTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The separate dependency check with the supplied merge order and `--movable` exited 0; its complete output is:

```text
depcheck: 33 roadmaps, 306 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. These checks certify the local files and supply direction; they do not resolve H01's consumer ownership conflict or H02's PR-description correction.
