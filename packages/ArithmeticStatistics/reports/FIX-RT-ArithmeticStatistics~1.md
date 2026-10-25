# ArithmeticStatistics repair

The finding identifiers are preserved from the two reviews: the P2 F01 is from r1a; the P1 F01 and F02–F05 are from r1b. The overlapping coverage findings share one repair, with separate dispositions below. Changes are confined to `packages/ArithmeticStatistics/README.md`, the module docstring of `packages/ArithmeticStatistics/Suggested.lean`, and this report.

## F01 (P2) — applied

Review r1a. Universal acceptance coverage → a pointer to each part's signatures and recorded limitations. The same assertion is deleted from the Lean docstring. Part V's quadratic-tower target includes m = 3, hence degree 8; its Lean file supplies neither that asymptotic nor its carrier explanation. Its degree-at-most-five asymptotics cannot cover degree 8.

## F01 (P1) — not actionable in this package: withdrawal and cross-package changes require a scope decision

Review r1b. The index has zero owned targets and zero declarations; that observation is correct. Withdrawal, merge-order deletion, consumer rewrites and Part V renumbering require a human scope decision and edits outside the authorized package. No mathematical prerequisite is missing here, so no supplier gap is appropriate. No substitute target or declaration was invented.

## F02 (P1) — applied differently

Review r1b. Unique ownership across the series → no ownership certification. Added a README Check: at X = 5 the inclusive family is {1, 2, 5}, the strict family {1, 2}. Part I §0.15, Part V §3.31 and main's ClassicalArithmeticCompletion §4.39 confirm the duplication. Reassigning their definitions is outside this package; no index prerequisite needs a gap.

## F03 (P2) — applied

Review r1b. Shared basis/sign conventions → explicit simultaneous negation of the supplier's two nonconstant basis vectors. Traces change from (3, b, −c) to (3, −b, c). Added three prose Checks for the split cubic, its trace-pairing determinant, and characteristics 2 and 3. Both supplier and statistical coordinate descriptions were searched; no other index occurrence needed correction.

## F04 (P3) — applied

Review r1b. This overlaps r1a F01. Complete headline coverage → each README is the mathematical specification, with a pointer to its signatures and recorded limitations. Part V's module docstring describes selected milestones and gives no missing-carrier inventory for its quadratic-tower asymptotic. The parallel universal assertion in this index's Lean docstring is also deleted.

## F05 (P3) — applied

Review r1b. Unqualified quadratic class groups → narrow class groups of quadratic fields in the Part V row. Added the discriminant-136 Check: narrow group ℤ/4, ordinary group ℤ/2, square-subgroup two-torsion sizes 2 and 1. Part V's target and pinned `NumberField.NarrowClassGroup` confirm the object. The settled Fouvry–Klüners key and Theorem 1 locator are retained.

## Evidence and boundaries

All part and analytic-supplier citations were resolved at the indexed heads: AnalyticNumberTheoryPartI `4ba2e21`, PartII `ed5b737`; ArithmeticStatistics Parts I–VIII respectively `3b1a24f`, `a7cc3be`, `6f16f6c`, `92b9193`, `7f06cfc`, `88461f2`, `cbcd49e`, `b3b98cc`. Main is `b41e47bc34e30def0db01d84cc92062ed72c6e68`, rather than the older main named by the reviews. ArithmeticDirichletSeries and ClassicalArithmeticCompletion were inspected on that main; the latter's revising open head was not substituted for main.

The specific witnesses are:

- Part V `README.md:1488`, “Quadratic tower counting constants”, includes m ≥ 1. Its complete Lean declaration inventory has no tower-counting asymptotic; `bhargavaShankarWang_numberFieldCount` and `allFields_degree_le_five` explicitly stop at degree 5. Its module docstring and final README-only catalogue do not explain a missing carrier for degree 8.
- Part I `README.md:1922`, Part V `README.md:2138`, and main's `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:8769` specify the same underlying Pell radicands. Their inequalities are respectively ≤, <, <. Neither part names ClassicalArithmeticCompletion as its supplier for these definitions. The proposed ownership repair therefore belongs in those packages, rather than being satisfied by an index edit.
- AnalyticNumberTheoryPartII §5.5 displays the supplier multiplication table, and §5.6 specifies traces (3, b, −c). Part I's “Cubic ring of a binary cubic form” and “Discriminant of the cubic ring of a form” specify simultaneous negation and traces (3, −b, c). The determinant-line construction and inverse automorphism weights are unaffected by this basis change.
- Part V §3.8, “Fouvry kluners moments of four ranks”, and its Lean theorem `FieldStatistics.fouvryKluners_fourRankMoments` use the narrow class group. In the pinned Tau Ceti, `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean:67,83` defines the positive-principal subgroup and its quotient; lines 159, 175 and 224 give the forgetful surjection, positive-generator criterion and square-killed principal classes. This quotient distinguishes positivity; it is not the ordinary class group.

The new discriminant-136 Check has the following independent arithmetic verification. The ring of integers is ℤ[√34]. The continued fraction of √34 has period (1, 4, 1, 10); its convergents 5/1, 6/1, 29/5, 35/6 have norms −9, 2, −9, 1. The even period excludes a unit of norm −1. The Minkowski bound is √34, between 5 and 6. The prime over 2 is principal, generated by 6+√34. Put P = (3, √34−1); then P² = (5+√34). No element has norm ±3, since 3 and −3 = 14 are nonsquares modulo 17. Finally 7+√34 has norm 15, tying the classes above 5 to those above 3. Thus every ordinary class is generated by the nonprincipal order-two class of P. Its narrow square is nontrivial because 5+√34 has mixed signs and every unit has positive norm; its narrow fourth power is trivial because (5+√34)² is totally positive. The sign quotient has order 2, so the narrow group is cyclic of order 4. This proves both group descriptions without relying on the review's reduced-form enumeration.

The two literary references remain settled `waived`: `as-ref-022`, Theorem 1, author manuscript p. 3; `as-ref-056`, Theorem 1.2, author DVI pagination. No source passage was copied, no new work was cited, and no settled text was requested again. Their literary locators were not independently recertified from source text in this repair. The narrow-group correction is also verified directly against the owning part and pinned carrier. There is no missing-reference request.

## Citation and ownership audit

Every README link was checked against its target, including the two new Pell-family anchors. The eight part roots, seven AnalyticNumberTheoryPartII anchors, AnalyticNumberTheoryPartI §2.5, and both Part III contract anchors resolve. The unlinked citations to AnalyticNumberTheoryPartI Layer 3 and completed ArithmeticDirichletSeries Layers 3, 6 and 9 match their headings and hypotheses. The cubic-coordinate citation names Part I's existing target; it adds no supplier edge from this index to a later part.

HeightsRationalPointsAndObstructions `82cf8af`, README:39, names Part I §0.22, Part II §1.12 and Part III §2.17; those sections occur at README lines 2531, 1821 and 1967 respectively. ModularityAndLanglandsExtensions `2d70821`, README:1387, names Part I §0.1, located at README:182. These remain descriptions of consumers of the parts.

Ownership searches used `roadmaps grep` by object over main and the indexed open heads, and direct searches of main, Completed, board packages and the supplied sibling checkouts. Terms included negative-Pell radicands, narrow class groups, four-rank moments, the negated cubic basis and quadratic-tower counting constants. The local search inspected 1048 active-main files, 198 completed files, 92 board README/Lean files and 309 supplied-sibling README/Lean files. No new construction or fully qualified Lean name is introduced here. The named carriers and adapters remain with their existing owners. This is not a certification that the parts have no ownership overlap: F02 demonstrates one.

The bare-index-name search confirms the review's ten main/open-head consumer lines. The cited sibling withdrawal report and the five board-design folders are absent from this working tree, so their reported decisions and the census of 97 design references were not independently verified. They are not needed to establish that withdrawal, renumbering and consumer edits fall outside this repair. No external file was changed.

The library HEADs match `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Native `Cubic` and `Cubic.discr` were inspected at `Mathlib/Algebra/CubicDiscriminant.lean:43,461`: the carrier imposes neither a nonzero leading coefficient nor separability. Perron's positive cutoff, positive abscissa and actual convergence hypotheses were inspected at `TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Ideal.lean:161`; the half-plane sums and separate continuous remainder of `TauCeti.LSeries.wienerIkehara` at `TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean:301`. These imported results are not redeclared here.

## Adversarial mathematics pass

There are no owned theorem statements or definitions. The ledger covers the index's mathematical conventions, imported comparisons and every new or changed assertion and Check. Finite witnesses test normalization and boundaries; they do not certify proofs of the parts' deep results.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Series scope and absence of index targets | Eight part headings; index declarations | 8 mathematical parts; 0 index definitions, theorems or instances | Ownership is in the parts; uniqueness is not asserted | Deleted universal ownership clause |
| Six-layer assignment | I–VIII layer headings | (0,1,2,3,3,4,5,5) in index and parts | Equal | Retained |
| Section-number disambiguation | IV/V and VII/VIII section sets | IV∩V = {3.2,…,3.9}, cardinality 8; VII∩VIII = ∅, cardinality 0 | Part qualification remains necessary | Retained; no renumbering |
| Field counts and equivalence relation | S₃ cubic, cyclic cubic, degree one | Embedded copies 3,1,1; automorphism orders 1,3,1; weighted sum per class 1,1,1 | Isomorphism and embedded counts differ as stated | Retained |
| Stabilizer weights | Trivial, C₃, S₃ stabilizers | Reciprocals 1,1/3,1/6 rather than 1,3,6 | Denominators positive | Retained |
| Signed discriminant versus height | ℚ(i), ℚ(√5) | Signed −4,+5; absolute 4,5 | Sign cannot be discarded from a signed family | Retained |
| Local Haar normalization | ℤ₂, ℤ₃, each of total mass 1 | Masses of 2ℤ₂ and 3ℤ₃ are 1/2,1/3; indices 2,3 | Includes the dyadic place | Retained |
| Pell cutoff convention | X=0,1,2,5 | Inclusive ∅,{1},{1,2},{1,2,5}; strict ∅,∅,{1},{1,2} | Distinct finite counts | Added README Check |
| Pell radicand versus field | d=1,2,5 and rejected d=3,4 | 0²−1·1²=−1; 1²−2·1²=−1; 2²−5·1²=−1; 3≡3 mod4; 4=2² | Unit retained in radicands, not a quadratic field | Boundary Check includes unit and exclusions |
| Order of limits | a(X,M)=1 for X≤M, else 0 | lim_M lim_X a=0; lim_X lim_M a=1 | Cannot interchange without an argument | Retained |
| Conjectures remain propositions | Index declaration inventory | 0 axioms; 0 conjectures asserted as theorems | No unstated assumption added | Retained |
| Positive limiting denominator | Empty family; numerator zero and denominator X | Empty normalized denominator 0; second normalized denominator 1 for X>0; both totalized ratios 0 | Ratio value alone proves no positivity | Retained |
| Distribution versus moments | P(Z_n=n²)=1/n, otherwise 0, n≥1 | P(Z_n≠0)=1/n→0; E(Z_n)=n→∞; E(0)=0 | Distribution convergence does not imply moment convergence | Retained |
| Cubic action and determinant-square discriminant | x³−y³, diag(2,1), scalar 2I | Discriminants −27,−108,−432; ratios 4 and 16 equal determinant squares | Row-variable twist retained | Retained |
| General projective cubic carrier | O=ℤ[√−5], I=(2,1+√−5); zero form | Norm I=2, but a²+5b²=2 has no integer solution; zero form gives zero products on the rank-two summand | Nonprincipal and degenerate objects are not discarded | Retained |
| Weighted cubic coefficients | Split algebra and zero form | Split discriminant 1, automorphism count 6, weight 1/6; zero-form discriminant 0, zero-index coefficient 0 | Étale coefficient restriction differs from general construction | Retained |
| Uniform small-degree bound | Base field ℚ, norm index 1; zero index | Identity extension count 1; D_ℚ=h₂(ℚ)=1, so bound requires C≥1; index 0 outside hypothesis | No identity extension lost | Retained |
| Cubic pole clearance | Simple residues r₁,r₅ at 1,5/6 | Cleared limits r₁/6 and −r₅/6 | Totalized zero at a pole would be wrong | Retained |
| Pole-aware convexity | σ=−1/2,3/2; t=0 | Discriminant exponents 9/2+ε,1/2+ε; height exponents 4n+ε,ε; 0 fails abs(t)≥1 | Cited supplier excludes poles | Retained |
| Quadratic large sieve | M=1,N=3, a₁=1,a₃=−1 or +1; m=n=3 | Squared sums 0 and 4; coefficient-square sum 2; Jacobi(3,3)=0 | Signs and coprimality zeros matter | Retained |
| General cubic linear traces | Supplied multiplication matrices, then their negatives | Tr(1)=3; Tr(ω)=b→−b; Tr(θ)=−c→c | Explicit basis adapter matches Part I | Replaced shared-convention assertion |
| Split cubic basis Check | (a,b,c,d)=(0,1,−1,0) | Supplier ω²=ω, trace 1; statistical ω²=−ω, trace −1; (−1,0,0)²=(1,0,0)=−(−1,0,0) | Wrong unnegated coordinates rejected | Added README Check |
| Trace-pairing determinant Check | Matrices in the new README Check | First determinant 3−1−1=1; conjugated determinant 3−1−1=1 | Both sign changes preserve discriminant | Added README Check |
| Small-characteristic sign Check | Same two matrices over 𝔽₂,𝔽₃; zero ring | ω traces 1,1 mod2 and 1,2 mod3; determinants 1,1 in either field; zero-ring identities 0=0 | 𝔽₂ alone misses the sign error; no division required | Added README Check |
| Dedekind residue convention | ℚ(i) | 2π·1/(4·2)=π/4 on the real side and continued side | Matches AnalyticNumberTheoryPartI §2.5 | Retained |
| Euler/Perron/Tauberian boundaries | Empty Euler product; x=c=T=1; zero coefficients and residue | Product 1; kernel arctan(1)/π=1/4, limiting value 1/2; zero normalized sum 0→0 | Boundary and convergence hypotheses retained | Retained |
| Windowed cubic counting contract | Two integral orbits with trivial stabilizers, selector 1 or 0 | Multiplicity denominator 2; weights 1/2+1/2=1 or 0+0=0 with denominator still 2 | No selector-dependent zero denominator | Retained |
| Volume and identity in the three-isogeny comparison | d=2, local mass ratio 1 | d⁻⁴=1/16=(1/8)(1/2); nonidentity mean 1 gives total mean 1+1=2 | Volume normalization and identity term retained | Retained |
| Even-tail inequalities | n=4, (δ,η,ξ)=(1/2,1/100,0),(1,3/5,0),(1/100,1/2,0) | τ=1/50,3/5,50; 9τ=9/50,27/5,450 versus threshold 5 | First accepted; second fails weighted bound; third fails both | Retained |
| Even-tail domain | δ=0; n=2 | Division has totalized value 0 if imported into Lean; n=2 below the even clause's threshold 4 | Positive δ and even n≥4 exclude these inputs | Retained |
| Narrow four-rank object | Cyclic groups of orders 1,2,4 | Square-subgroup two-torsion sizes 1,1,2; four-ranks 0,0,1 | Ordinary order-two group cannot replace narrow order-four group | Qualified Part V row |
| Discriminant-136 Check | ℚ(√34), P=(3,√34−1) | Norms of 6+√34,7+√34,5+√34 are 2,15,−9; ordinary P has order 2, narrow P order 4; statistic 1 versus 2 | Both groups independently verified above | Added README Check |
| Fouvry–Klüners moment normalization | k=0,1 | Subspace counts N(0,2)=1,N(1,2)=2,N(2,2)=5; negative moments 1,2; positive moments 1,3/2 | Part V's narrow statistic matches its stated normalization | Terminology corrected; waived locator retained |
| de Jong comparison attribution | Part VII's rational factors as q→∞; q=1 | C(q)→3, L(q)→1, 1+C/L→4; q=1 produces zero denominator factors | Owner uses sufficiently large prime powers, not q=1 | Retained; waived locator not recertified |
| Part V acceptance-coverage claim | Tower height m=3; low-degree signatures | 2³=8, 8>5; corresponding tower-asymptotic declarations 0 and specific carrier explanations 0 | Universal coverage assertion fails | Deleted in README and Lean docstring |
| Downstream pencil conventions | Scalar pencil sizes n=0,1,2,3 | Invariants 1, ax−by, −(ax−by)², −(ax−by)³ | Cited part and consumer agree | Retained |
| Downstream finite-congruence density | Allowed pairs (0 mod3,0 mod5),(1 mod3,1 mod5) | Actual density 2/15; product of marginals 4/15 | Exact CRT set is required | Retained |
| Module docstring and declaration agreement | Final Lean file and README | 1 import, 1 namespace, 0 declarations; 0 index headline signatures promised | No missing index binder, no stand-in | Docstring narrowed |

## Required checks and gate outcome

- **Elaboration:** `lake env lean` on `packages/ArithmeticStatistics/Suggested.lean`, run from the content checkout using the supplied absolute tool argument, exited **0**, with **no output**. No Tau Ceti import or module build was needed. The process has finished.
- **Elaborated-signature comparison:** mechanically inventoried every declaration: **0** definitions, theorems, structures, instances, examples or other declarations. Consequently the `#check @name` sweep has **0 entries** and there are **0 binders** to compare with the README. No hypothesis was lost and no declaration name changed. No meaningless replacement signature was added.
- **Supplied signature-harness diagnostic:** the scratch diagnostic reports a parse failure, not a failing signature of this package. There is no declaration in the index to produce that failure; direct package elaboration above succeeds. The harness is outside the permitted edits and was not changed. There were no other gate failures listed in the brief.
- **Dependency check:** the prescribed `gate --depcheck` with `--name ArithmeticStatistics`, the supplied order and `--movable` exited **0** and printed exactly:

```text
depcheck: 48 roadmaps, 529 edges, 0 problem(s)
```

There is **no UPWARD, CYCLE or moved line**. No merge-order file was edited.

- **Citation resolver:** main `b41e47b`, 351 indexed open heads, index timestamp 2026-10-25T02:24:40Z; no unresolved cross-roadmap citations and no unresolved own Lean names. Its warning that external Lean names were not checked through the resolver was addressed by direct pinned-file inspection above; it is not evidence of missing APIs.
- **Final text/diff audit:** no new declaration, source entry, supplier gap, mathematical target or algorithm; no machine path in the repaired README, Lean file or this report. `metadata.toml` and `sources.toml` are unchanged. There is no `design/plan.json` in this package to modify. No commit, external post or other package edit was made.

## Maintainer consequences

The P1 withdrawal request remains a human scope decision. This repair does not withdraw the index or change the parts, the merge order, consumer prose or other packages' designs. The negative-Pell ownership and cutoff discrepancy is now exposed rather than certified away; any common supplier import must be repaired in Parts I and V against main's ClassicalArithmeticCompletion §4.39. Renumbering Part V is likewise outside this package. No exported Lean name was added, removed or renamed, so no consumer needs a Lean-name migration from these edits. Fresh independent review remains required.
