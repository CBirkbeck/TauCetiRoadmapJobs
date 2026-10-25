## H01 (CBirkbeck) — applied differently

An index presented as the complete specification → an explicit navigation and ownership guide with no targets, with mathematical specifications and supply contracts belonging to the eight parts (`TauCetiRoadmap/ArithmeticStatistics/README.md:3`, `:7`, `:29`, `:31`). The integration evidence below identifies all eight companion pull requests and their ordering constraints; their absence from the reviewed tree is real, and the index now makes no claim to supply their specifications, while changes to pull-request descriptions and companion files remain outside this edit scope.

## H02 (CBirkbeck) — applied differently

The cutoff-only warning → a single imported Pell-family contract, pointwise agreement of adapters and explicit unit, cutoff and insolubility Checks (`TauCetiRoadmap/ArithmeticStatistics/README.md:9`, `:20`, `:21`, `:33`). Assigning the untruncated objects to Part I would duplicate ClassicalArithmeticCompletion on main, whose §4.39 already owns both sets and strict truncations; Parts I §0.15 and V §3.31 must consume that owner, and their companion contracts and Part V's independent definitions remain to be reconciled outside this edit scope.

## Integration evidence and remaining actions

Main is `198a2803`; all eight companion folders are absent there and absent from the reviewed index tree. The following companion READMEs were read at the listed GitHub heads, including their Exact supplier contracts; earlier-part requirements give this compatible series order, with each part's other suppliers inserted before that part rather than omitted.

| Part | Pull request | Head | Earlier arithmetic-statistics inputs in its supplier contract |
| --- | --- | --- | --- |
| I | #1171 | 3b1a24fa | None |
| II | #1173 | a7cc3be0 | I |
| III | #1174 | 6f16f6c6 | I, II |
| IV | #1172 | 92b9193b | I |
| V | #1175 | 7f06cfc7 | I, II, III, IV |
| VI | #1176 | 88461f24 | I, II, III, V |
| VII | #1178 | cbcd49ef | I, III, IV, V, VI |
| VIII | #1179 | b3b98cc3 | I, IV, V, VII |

HeightsRationalPointsAndObstructions #1017 §§3.18–3.18c is an additional supplier to Part VI. Its §§3.18a–b consume Parts I §0.22, II §1.12 and III §2.17; therefore insert #1017 after those three companions and before #1176. It is a consumer of those parts and a supplier to Part VI, with no return edge from Part VI to its inputs.

AnalyticNumberTheoryPartII #1167 at `ed5b7376` consumes AnalyticNumberTheoryPartI #1126 at `4ba2e21a`. Its Merge order explicitly requires #248 (LFunctions, roed-math), #253 (ZerosOfLFunctions, roed-math) and #889 (VonNeumannAlgebras, kim-em) before #1167. The index description's claim that no other author's open pull request is involved is therefore false as a transitive integration claim. This report supplies the correction for the reply; it does not silently claim to have changed that description or merged any prerequisite. The README uses timeless roadmap names and section locators, so it contains neither a pending label nor pull-request numbers. The files of those three other-author prerequisites were not supplied in the brief: ownership against those open pull requests was not checked; their ordering constraints here are evidence from AnalyticNumberTheoryPartII’s integration contract.

This is a partial integration order for the series and its named analytic suppliers, not a replacement for every companion’s external contracts or a claim to have merged any of them. The complete mathematical specification resides in the eight companion roadmaps, each integrated after its own prerequisites; publishing #1531 supplies only the navigation guide. The earlier repair incorrectly made all eight parts mathematical suppliers of an index with zero targets; that reverse edge has been deleted, while all part-to-part and external integration constraints remain stated. No mathematical object was moved into the index, and no later roadmap supplies a mathematical target here.

## Ownership and citation verification

ClassicalArithmeticCompletion was inspected on main, rather than at the head of its revising pull request. `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:8769` (§4.39, anchor `layer-4-topic-39`) specifies the positive squarefree prime-restricted family, its integral negative-Pell subset, both strict truncations, inclusion and the unit radicand. Thus the repair imports existing work instead of making either statistics part a second foundational owner. Part I retains its inclusive-height adapter; Part V retains its statistical applications and must use the supplied strict truncations.

Part V's actual head `7f06cfc7` confirms the duplicate real-bodied definitions at `TauCetiRoadmap/ArithmeticStatisticsPartV/Suggested.lean:447` and `:451`: the first cuts out positive squarefree natural radicands with the prime-factor restriction, and the second adds an integral solution. Its §3.31 proof asks for a direct definition and its Part I supplier list does not name §0.15. The index now requires pointwise identification with the existing main owner, but those companion files were not edited; this coordination point should remain open until they agree. The roadmap-index rendering of Part V differed from the GitHub head, so these conclusions use the files read at the stated head.

Ownership searches covered objects, rather than just the proposed names, in main, the board packages and the open-roadmap index. Other matches concern general Pell equations, quadratic presentations or unrelated radicands; the restricted family and its strict truncations have the explicit existing owner just cited. No construction, theorem or Lean declaration was added to the index. The open-work search therefore supplies ownership evidence, without purporting to review the mathematics of all eight companion roadmaps.

Every cross-roadmap locator in the index was resolved against main or its indexed head and the relevant supplying sections were read: the eight parts and their stated layers; AnalyticNumberTheoryPartII §§5.4–5.7, 5.21, 5.28–5.29; AnalyticNumberTheoryPartI §2.5 and Layer 3; completed ArithmeticDirichletSeries Layers 3, 6, 9; Part III's windowed cubic count and binary summed tail; the two downstream consumers; and the added ClassicalArithmeticCompletion §4.39 and Heights §§3.18–3.18c contracts. Resolution reports no missing cross-roadmap citation or Lean name. The initial resolver used its indexed main `20b02f6b`; ClassicalArithmeticCompletion §4.39 was separately reread on main `198a2803`, where that file has no changes from the indexed main. Each cached companion README was matched by its full Git blob hash to its exact reviewed GitHub head before relying on its text. The two cited papers remain settled waivers: as-ref-022, Theorem 1, author-manuscript p. 3; as-ref-056, Theorem 1.2. Their full texts were not recertified or requested again, and no new bibliographic work was introduced. Dependency-repair citation resolution against indexed main `7922565` and the 363 open heads again lists no missing roadmap citation or name; that resolver explicitly does not inspect pinned packages, so the pinned-source evidence below is separate.

Pinned source copies were checked at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. `Cubic.discr` is the coefficient polynomial at `Mathlib/Algebra/CubicDiscriminant.lean:461`, including zero leading coefficient; qualitative Hermite finiteness is `NumberField.finite_of_discr_bdd` at `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:494`. The analytic suppliers remain imports: `TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.lean:349` requires absolute ideal-indexed summability, `TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Formula.lean:130` (`TauCeti.truncatedPerron_LSeries`) requires x > 0, c > 0, T ≥ 0 and L-series summability, and `TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean:301` carries coefficient positivity, half-plane sums and a continuous boundary remainder. None was restated here.

## Adversarial mathematics pass

This pass covers the index's mathematical conventions and examples, including every added mathematical statement. It does not substitute for full reviews of the eight substantive parts. References to deep results in the parts table are ownership and source pointers, not additional theorem statements in this index.

| Statement | Instances tried | Computed values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Common untruncated D | d = 0, 1, 2, 3, 4, 5, 10 | Membership = false, true, true, false, false, true, true; 0 fails positivity, 3 has forbidden prime 3, 4 has square divisor 4 | Matches the existing supplier and both part descriptions | Explicit single-owner contract |
| Integral negative-Pell subset D⁻ | (d,x,y) = (1,0,1), (2,1,1), (5,2,1) | x² − dy² = −1, −1, −1, equal to the required −1 | Unit and genuine quadratic radicands retained | Added witnesses |
| D⁻ is a proper subset of D | d = 34 = 2·17 | Allowed primes 2 and 17 ≡ 1 mod 4; continued-fraction states (m,Q,a) = (5,9,1), (4,2,4), (4,9,1), (5,1,10), period length 4; integral negative-Pell solubility false | Excludes the wrong model D⁻ = D | Added negative control from main §4.39 |
| Integral versus rational solubility | d = 34, (x,y) = (3/5,1/5) | x² − 34y² = 9/25 − 34/25 = −1, whereas integral solubility is false | Rational solubility cannot define D⁻ | Added explicit rational negative control at README line 21 |
| Integral solutions imply the prime restriction | A prime p ≡ 3 mod 4 divides d | Reducing x² − dy² = −1 gives x² ≡ −1 mod p; at p = 3 the square residues are {0,1}, while −1 = 2 | The imported inclusion has mathematical content; integral solubility is not replaced by the prime condition | Named existing inclusion |
| Inclusive versus strict truncation | X = 0, 1, 2, 5 | Inclusive sets = ∅, {1}, {1,2}, {1,2,5}; strict sets = ∅, ∅, {1}, {1,2} | Equality of finite cutoff families is false at endpoints | Retained cutoff-five test; added zero/unit endpoints |
| Excluding 1 only for quadratic fields | d = 1, 2, 5 | ℚ(√1) has degree 1; ℚ(√2), ℚ(√5) have degree 2; Pell witnesses above all give −1 | Radicand membership and quadratic-field membership differ at 1 | Explicit adapter restriction |
| Field-count equivalence relation | Split cubic algebra, cyclic cubic field | Automorphism orders 6 and 3; reciprocal weights 1/6 and 1/3; one isomorphism class contributes unweighted 1 in either case | Weights cannot be replaced by automorphism orders or confused with unweighted counts | None |
| Signed cubic discriminant | (a,b,c,d) = (1,0,0,−1), (0,1,−1,0), (0,0,0,0) | P = −27, 1, 0; absolute values = 27, 1, 0 | Signed and absolute conventions differ on the first form | None |
| Additive Haar normalization | p = 2, 3 | 2·μ(2ℤ₂) = 2·(1/2) = 1; 3·μ(3ℤ₃) = 3·(1/3) = 1 | Matches the index decomposition of a mass-one compact group | None |
| Order of limits | a(X,M) = 1 when X ≤ M | For fixed M, eventual value as X grows = 0; for fixed X, eventual value as M grows = 1; iterated limits = 0 and 1 | No unsupported interchange | None |
| Distribution versus moment convergence | n = 1, 2, 10 | Tail probabilities at threshold 1/2 = 1, 1/2, 1/10; means = 1, 1, 1; limiting zero variable has mean 0 | Convergence in probability does not imply convergence of expectations of this unbounded observable | None |
| Empty denominator | Empty family | Count numerator = 0, denominator = 0; totalized 0/0 = 0, denominator positivity false | Does not meet average hypotheses | None |
| Simultaneous basis negation | f = x²y − xy² | Supplier ω² = ω and trace 1; adapter ω = (−1,0,0), ω² = (1,0,0) = −ω and trace −1 | Both conventions give the same algebra | None |
| Trace discriminant under the basis change | The two displayed 3×3 matrices | Determinants = 1 and 1; basis-change determinant = (−1)² = 1 | Discriminant unchanged although two linear traces change sign | None |
| Small residue characteristics | Same form over 𝔽₂ and 𝔽₃ | Traces modulo 2 = 1 and 1; modulo 3 = 1 and 2; determinants = 1 in both fields | Characteristic 2 alone cannot detect the sign convention; no division by 2 or 3 | None |
| Narrow versus ordinary square-subgroup statistic | C₄ versus C₂ | Squares in C₄ = {0,2}, with two 2-torsion elements; squares in C₂ = {0}, with one 2-torsion element | Values 2 and 1 agree with the stated discriminant-136 comparison | None |
| SL₂ local measure | Enumerate determinant-one matrices over 𝔽₂ and 𝔽₃ | Counts 6 and 24; 6/2³ = 3/4, 24/3³ = 8/9 | Matches the invariant-differential convention | None |
| Adelic quotient normalization | Rational base field | Local factor = 1 − p⁻²; ζ(2)·∏p(1 − p⁻²) = ζ(2)·ζ(2)⁻¹ = 1; replacing each factor by 1 gives ζ(2) | Preserves the supplied volume-one hypothesis | None |
| Even-degree admissible tail parameters | n = 4; (δ,η,ξ) = (1/2,1/100,0) | τ = max(1/100,1/50) = 1/50; 9τ = 9/50 < 5, and τ < 1 | Both cutoff inequalities hold | None |
| Even-degree excluded tail parameters | n = 4; (δ,η,ξ) = (1,3/5,0) | τ = 3/5 < 1; 9τ = 27/5 > 5 | First inequality alone is insufficient | None |
| Earlier-part supply direction | Parts I–VIII; index with zero targets | Eight part specifications, zero index constructions and zero index theorems; dependency graph has 51 vertices, 582 edges and 0 problems | Earlier-part and external prerequisites belong to the consuming part; no reverse supply edge into the index | Replaced the index’s eight supplier claims with navigation and part-specific contracts |

The real-quadratic class-group example was retained, not newly certified from its cited waived paper: the finite-group square/torsion calculation above checks the statistic once the stated class groups are supplied. The basis and measure witnesses were recomputed against the named supplier conventions; all added Pell conditions explicitly specify natural radicands and integral solutions, with no hidden coefficient, field or nonemptiness hypothesis.

## Lean signatures and validation

`TauCetiRoadmap/ArithmeticStatistics/Suggested.lean` has zero declarations: one import, one module docstring and an empty namespace. Mechanical declaration enumeration therefore gives an empty list of elaborated types to compare and no `#check @name` obligations; there are no implicit binders to drop and no signature changes. The build elaborated that unchanged module. It remains consistent with the README's ownership of zero headline theorems and zero definitions.

Dependency repair changes only `TauCetiRoadmap/ArithmeticStatistics/README.md` in the repository. Its summary and supplier prose distinguish navigation from mathematical supply; the Pell-family owner, pointwise adapter agreement, all numerical Checks, part-to-part ordering and external prerequisites are preserved. No push, companion edit, pull-request edit or merge-order edit was performed.

Build command: `lake build TauCetiRoadmap.ArithmeticStatistics.Suggested`.

Exact build outcome:

```text
Build completed successfully (8976 jobs).
```

Dependency check with `--movable` (exact output):

```text
depcheck: 51 roadmaps, 582 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line, and no relocation of the index is required. This repairs the index’s incorrect supply role without changing the shared merge order; it does not claim that the companion specifications have merged or that their separate ownership repairs are complete.

Commit: `7c344a84` — `ArithmeticStatistics: review repairs (separate index navigation from part supply contracts)`. The repository worktree is clean.

The prescribed full gate exits 0. Exact gate summary line:

```text
gate ArithmeticStatistics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
