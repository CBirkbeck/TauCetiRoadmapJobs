## H01 (CBirkbeck) — answered

ArithmeticDynamics still assigns itself the same all-L¹ Birkhoff theorem at `TauCetiRoadmap/ArithmeticDynamics/README.md:2316` (supplied head `591665b4`): §2.6 must consume this roadmap's two §4.1 pointwise targets, and §2.7 must consume its independent §5.2 finite Shannon API while retaining partition, dynamical-entropy, Shannon–McMillan–Breiman and decomposition ownership. This roadmap precedes ArithmeticDynamics in the supplied order (positions 265 and 268), so ownership stays here; changing the read-only consumer is outside the authorized files, and this shared-ownership finding remains unresolved.

## H02 (CBirkbeck) — applied

The downstream locator for `birkhoff_pointwise_ergodic` changes from §4.3 to §4.1 at `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:6803`, matching its statement at line 4548. Both downstream Birkhoff references now point to their owning statement section.

## H03 (CBirkbeck) — applied

The two arbitrary-gauge Needs clauses change from `MeasureTheory.Measure.le_hausdorffMeasure` to `MeasureTheory.Measure.le_mkMetric` at `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:4233` and line 4347; line 43 distinguishes the pinned general theorem from its real-power specialization (`Mathlib/MeasureTheory/Measure/Hausdorff.lean:490` and line 541). Lines 4331–4344 give the precise application to (η/Cₖ)μ, convert the small-ball bound to an all-small-set diameter bound including diameter zero, and compute non-power-gauge, scaling and atom negative controls; the acceptance theorem's hypotheses and conclusion are unchanged.

## H04 (CBirkbeck) — answered

The blanket whole-PR independence claim is false: AnalyticNumberTheoryPartI's description at head `4ba2e21a` explicitly requires LFunctions, ZerosOfLFunctions and GlobalHolomorphicFunctions, whose open heads are respectively `affb2d0e`, `cce2e041` and `ffb25b53`; its README supplier clauses name their actual contracts. The PR description is outside the authorized edits, so its correction remains outstanding: replace the purported exhaustive whole-PR list and independence sentence with the explicit target-level graph below, distinguish that graph from suppliers' declared PR merge constraints, and acknowledge these three external prerequisites of the analytic supplier rather than claiming that appending them certifies the entire transitive closure.

## Evidence and ownership

The Birkhoff statements agree with Sarig2023 line 1841 (all integrable observables and the ergodic integral limit) and Sarig2023 line 2111 (invariant conditional expectation). At the Tau Ceti pin, `TauCeti/Probability/Ergodic/CondExpProjection.lean:169` requires `MemLp f 2 μ` and concludes convergence of the L¹ error; it does not discharge this all-L¹ pointwise target. Thus surrendering ownership to the later ArithmeticDynamics would reverse the supply direction, while the consumer's proposed reuse is mathematically appropriate.

The mass-distribution application agrees with BeresnevichVelani line 170, with the Cantor probability construction and η-independent bound at line 423, and with the general theorem at line 252. Mathlib's `MeasureTheory.Measure.le_mkMetric` requires a positive diameter cutoff and the bound for every sufficiently small set, including sets that are not measurable; it requires neither a power gauge nor a new foundational theorem. The enclosure argument gives that bound for arbitrary sets, and continuity at zero excludes atoms. No new source or source-manifest entry is needed.

Ownership searches by object covered main at `bec24db`, the local board packages and their supplied index, all 64 README/Lean files in the 32 supplied open-roadmap checkouts, and the indexed open-roadmap search. ArithmeticDynamics is the remaining duplicate; the general gauge domination theorem belongs to pinned Mathlib and is consumed here without a replacement declaration. Ownership against open PR files not supplied in the brief was not independently checked beyond indexed matches and the named supplier contracts. No ownership moves or declarations were added.

Cross-roadmap citations were resolved again against main and indexed open heads, with the pinned Lake packages supplied explicitly: there were no unresolved roadmap citations or Lean names. The actual supplier clauses checked were ArithmeticDirichletSeries' Export contract and Layer 6; AnalyticNumberTheoryPartI §§0.19, 0.21, 1.5, 3.12a, 3.18, 3.32, 3.33, 3.41; DiophantineApproximationAndTranscendence §§0.5–0.6; GeometryOfNumbersAndQuadraticArithmetic §§4.2.1–4.2.2, 4.5; AdelicAlgebraicGroups AA.2–AA.3; ArithmeticDynamics §§2.6–2.7; and main's FreeProbability shared-foundations contract for RandomMatrices Milestone 3. Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` match the manifest and installed checkouts.

## Target-level dependency graph for the metadata reply

An arrow runs from the supplier in the left column to the local consumer in the right column. These are the mathematical contracts of `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:37`–79; they do not purport to enumerate whole supplier PRs' prerequisites.

| Supplier and exact contract | Local consumer |
| --- | --- |
| Mathlib and Tau Ceti pinned native counting, arithmetic functions, empirical probabilities, weak convergence, Haar, conditional expectation and continued fractions | The finite laws and named targets in Layers 0–5 |
| ArithmeticDirichletSeries, Export contract and Layer 6: truncated Perron kernel and arithmetic Perron | §5.1 finite Dirichlet-polynomial short-interval comparison |
| AnalyticNumberTheoryPartI §§0.19, 0.21: reciprocal-prime estimates; §1.5: Dirichlet-polynomial mean square; §§3.18, 3.33: distance and Halász | Arithmetic normalization, prime blocks/products and the specified §5.1–5.2 analytic arguments |
| AnalyticNumberTheoryPartI §§3.12a, 3.32, 3.41: uniform marked-prime expansion and restricted squarefree counts | §1.6 restricted-family moments and window |
| DiophantineApproximationAndTranscendence §§0.5–0.6: convergent errors and BadlyApproximable | §4.10 bounded native partial denominators |
| AdelicAlgebraicGroups AA.2–AA.3: quotient/Haar and finite volume; GeometryOfNumbersAndQuadraticArithmetic §§4.2.1–4.2.2, 4.5: Howe–Moore, Moore and Mahler | §4.10 modular homogeneous applications |
| This roadmap §4.1: both pointwise theorems; independent §5.2 finite Shannon API | ArithmeticDynamics §§2.6–2.7, through partition labels and joins; no multiplicative-correlation input |

On the challenged analytic branch, LFunctions consumes ArithmeticDirichletSeries, GlobalNumberFields and ThetaSeries; ZerosOfLFunctions consumes LFunctions, ArithmeticDirichletSeries and Chebotarev; GlobalHolomorphicFunctions names DifferentialGeometry and ConformalMapping, with AlgebraicTopology beneath DifferentialGeometry. All of those next-level suppliers except LFunctions are already on main (ArithmeticDirichletSeries under Completed); under the binding main-first policy their open revision PRs are not new supplier dependencies. LFunctions, ZerosOfLFunctions and GlobalHolomorphicFunctions themselves are absent from main, so the three challenged open prerequisites cannot be dismissed as progress PRs.

A metadata scan of all 33 entries in the existing list found that the missing external prerequisites are not limited to those three (for example StableHomotopyKTheory names TangentialBordism and AlgebraicKTheory, and ResolutionOfSingularitiesCharacteristicZero names GroebnerGeometry). Moreover, GeometryOfNumbersAndQuadraticArithmetic and QuaternionicModularForms explicitly distinguish staged target dependencies from whole-PR ordering; the latter describes foundational input from AdelicAlgebraicGroups and an application supplied back to it. Consequently an exhaustive acyclic whole-PR merge chain is not established by these descriptions; the target-level replacement above avoids asserting one and leaves the supplier-side scheduling decisions visible.

## Signature comparison

A single scratch module containing the unchanged Suggested.lean plus `#check @name` for all 89 declarations was elaborated once and compared with the supplied elaborated types and the corresponding README statements: all 89 types match modulo whitespace, and no necessary binder was lost. The three homogeneous declarations retain the diagonal-matrix equality, and the two semiorbit declarations also retain the unipotent-matrix equality, as anonymous arrow hypotheses despite the flagged names; `torusPolynomial` needs no `Fintype d` because its finite sum is over the degree index, exactly as README line 3014 specifies. The Haar and Fourier headline statements retain `Fintype d`. Suggested.lean therefore needs no change.

## Adversarial mathematics pass

The following rows cover each mathematical statement introduced or affected by the repair, the reused Birkhoff/entropy interface, and the four binder leads. Values are exact unless a decimal approximation is displayed; these computations test conventions and necessary hypotheses, not proofs of the admitted headline theorems.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| General-gauge native domination contract | Lebesgue measure restricted to [0,1], gauge r, set [0,1/2] | μ(set)=1/2; f(diam)=1/2; native H¹([0,1])=1 and μ([0,1])=1 | Equality fits the contract | Use le_mkMetric |
| Power-gauge specialization | f(r)=r², diameter 1/2 | f(1/2)=1/4=(1/2)² | Same bound in both formulations | Retain le_hausdorffMeasure only as specialization |
| Dimension-gauge hypotheses in the new non-power Check | f(r)=r+r²; zero and radii 1/4,1/2 | f(0)=0; f(1/4)=5/16>0; f(1/2)=3/4>5/16; polynomial is continuous | Admissible gauge | New Check |
| Near-zero ratio for that Check | k=1, radii 1/4,1/2 | f(r)/r=5/4,3/2 respectively | Monotone direction allowed | No restriction to power gauges |
| Radius versus diameter comparison | Interval [0,1/2], enclosing centered ball of radius 1/4 | diam=1/2; f(diam)=3/4; f(radius)=5/16 | Distinguishes the conventions | New negative control |
| Enclosure of an arbitrary small nonempty set | Set {0,1/2}, center 0 | diam=1/2; enclosing ball radius=1/2; f(diam)=f(radius)=3/4 | No unproved doubling of an arbitrary gauge | Explicit enclosure argument |
| Empty-set case in native hypothesis | Empty set | μ(∅)=0; f(diam ∅)=f(0)=0 | Required inequality is 0≤0 | Explicit case |
| Diameter-zero case | Singleton; comparison with a Dirac probability | Allowed mass tends to 0 as f(r)→0; Dirac mass=1 at every positive centered radius, contradicting limit bound 0 | Atom excluded | Explicit case and negative control |
| Cantor probability normalization | Two equal children; weights 1:3; three equal children | Masses 1/2+1/2=1; 1/4+3/4=1; 1/3+1/3+1/3=1 | Denominators positive and mass preserved | Definition unchanged, supplier corrected |
| Scaling the ball bound | η=8, Cₖ=2, f(r)=r+r², radii 1/2,1/4 | μ-ball bounds 3/16,5/64; multiplied by 4 they become 3/4,5/16=f(r) | Correct scale is η/Cₖ | Explicit scale |
| Mass-distribution lower bound on the support | μ(Kη)=1, η=8, Cₖ=2 | Scaled mass(Kη)=4; H^f(Kη)≥4; inverse scaling only gives ≥1/4 | Correct inequality and scaling direction | Explicit lower bound and Check |
| Arbitrarily large η yields infinite measure | Cₖ=2, η=2,8,32 | Lower bounds 1,4,16; as η→∞ the bounds are unbounded | Cₖ must be independent of η | Hypothesis retained explicitly |
| General mass-transference conclusion | k=1,f(r)=r; k=2,f(r)=r²; k=0 | Expanded radii r and sqrt(r²)=r for r>0; k=0 would totalize reciprocal exponent to 0 and is excluded | Identity cases agree; zero dimension guarded | Headline unchanged |
| General Birkhoff versus ergodic Birkhoff | Two equiprobable points, f=(-1,1), T=identity | At N=2 averages=(-1,1)=conditional expectation; integral=0 | Identity lacks ergodicity and refutes an integral-only general limit | Ownership retained, locator corrected |
| Ergodic integral limit | Same space, T swaps the points | N=2 averages=(0,0); integral=0; averages tend to 0 | Correct ergodic specialization | No theorem edit |
| Partition labels and finite Shannon entropy | Constant label; fair bit; pair of independent fair bits | Entropies 0, log 2≈0.693147181, 2log 2≈1.386294361; zero atom contributes 0 | Natural-log and zero-mass conventions agree | Adapter unchanged |
| Join and finite mutual information | Independent fair labels versus identical fair labels | Independent: 2log 2−log 4=0; identical: 2log 2−log 2=log 2 | Join adapter distinguishes dependence | Independent API retained |
| torusPolynomial binder lead | s=0; s=1, α₀=1/4, α₁=1/3, n=−1 in the circle | Constant=1/4; linear value=1/4−1/3=−1/12=11/12 mod 1 | Sum is finite in degree, independently of coordinate cardinality | No Fintype binder needed |
| homogeneous_birkhoff binder lead | t=0 and t=log 2 | Required matrices diag(1,1) and diag(2,1/2), both determinant 1; constant choice I fails at log 2 | Diagonal equality is present and excludes the wrong flow | No binder edit |
| bounded_digits_compact_orbit binder lead | u at x=0 and x=1/2 | Required matrices I and [[1,1/2],[0,1]], both determinant 1; constant u=I fails at 1/2 | Both matrix equalities retained; rational 1/2 is excluded by the irrationality guard | No binder edit |
| typical_unbounded_semiorbit binder lead | x=1/2 as a convention witness, positive time t=log 2 | a_tu_x=[[2,1],[0,1/2]], determinant 1; u_xa_t=[[2,1/4],[0,1/2]] | Product order and the two matrix hypotheses distinguish the prescribed flow | No binder edit |

## Validation

Commit: `0bf93c5` — `ProbabilisticAndMetricNumberTheory: review repairs (general gauge supplier and Birkhoff locator)`. Only `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md` changed; the worktree is clean and nothing was pushed.

`lake build TauCetiRoadmap.ProbabilisticAndMetricNumberTheory.Suggested` exited 0, with admitted-theorem warnings only. Exact final output:

```text
Build completed successfully (8978 jobs).
```

The first gate exited 1 solely because the authorized README edit was uncommitted (`dirty=1`); after committing, the same gate exited 0. Its exact final summary is:

```text
gate ProbabilisticAndMetricNumberTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The separate dependency-direction check with the supplied merge order and `--movable` exited 0. Its entire output is:

```text
depcheck: 33 roadmaps, 301 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The local dependency check does not resolve the external consumer ownership or certify the PR description's transitive whole-PR claims.
