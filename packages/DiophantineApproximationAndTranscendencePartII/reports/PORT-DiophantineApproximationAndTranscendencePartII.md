# Port report

- Branch: `roadmap/diophantine-approximation-and-transcendence-part-ii`.
- Head: `24c0576776dc4a07a775b22d302e00e5dcf4c0a4`.
- Commit: `DiophantineApproximationAndTranscendencePartII: roadmap (README, Suggested.lean, metadata)`.
- Initial checkout and local `origin/main`: `4d14cbd`; initial and final working trees clean.
- Committed files: `TauCetiRoadmap/DiophantineApproximationAndTranscendencePartII/README.md`, `TauCetiRoadmap/DiophantineApproximationAndTranscendencePartII/Suggested.lean`, and `TauCetiRoadmap/DiophantineApproximationAndTranscendencePartII/metadata.toml`.
- Pinned sources read directly: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Both dependency checkout heads equal the manifest revisions.

No push, pull-request write, issue write, comment or helper agent was used. The report is outside the content checkout and is not part of the commit. Source package files, its design, its source manifest, repository infrastructure and the top-level roadmap list were not edited.

## Validation

The requested module build exited 0. Exact outcome line:

```text
Build completed successfully (8954 jobs).
```

Warning count: **2**, both `declaration uses sorry`, for `mean_rank_bound` and `arithmetic_algebraicity` at lines 54 and 74 of `TauCetiRoadmap/DiophantineApproximationAndTranscendencePartII/Suggested.lean`. No other warnings remain. The first build also emitted the pinned Lean compiler's legacy-import warning. Using the module-system header, one `public import Mathlib`, and `public section` removes that warning while keeping all six declarations publicly checkable. There are no Tau Ceti imports because none of its declarations occurs in the acceptance-test statements.

The final push gate exited 0 after the commit. Its exact summary is:

```text
gate DiophantineApproximationAndTranscendencePartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The separately requested dependency-direction check exited 0. Its complete output is:

```text
depcheck: 159 roadmaps, 1107 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The merge-order file was not edited. The preliminary gate's only failure was the uncommitted new directory; every content counter was already zero. The final gate checks the committed diff against the requested local base.

A single scratch file imported the finished module and elaborated `#check @name` for every declaration, with exit 0 and no warnings. I compared all six elaborated types with README §§0.1–0.2,2.1–2.2 and with the supplied six-type signature record. No mathematical signature changed and no binder was lost. In particular the two theorems retain nonconstant p, the equality fixing pSeries as p's Laurent image, χ₀=0, χ₁=1, integral pullbacks, closed-disc neighbourhood analyticity, φ(0)=0, strict derivative expansion, and the actual uniformization relations; the rank theorem retains independence over the actual generated field ℚ(p). Algebraicity retains both scalar-field conclusions.

`git diff --check` and the staged whitespace check passed. The README has 35 numbered mathematical subsections in six layers, all six Examples and Dependencies endings, all 40 API bullets, and the full worked examples and references. The Lean file has 89 lines, four real-bodied definitions and two admitted headline theorems. All six names occur in the README; no API-only theorem, computational example, sorry-valued data or option override was added. Metadata is `topic = "math.NT"`, matching the main-branch number-theory folders.

## Draft pull request body

This roadmap develops arithmetic coefficient lattices, simultaneous analytic germs and multivariable auxiliary functions to prove an integrated arithmetic rank bound and its algebraicity criterion. It extends DiophantineApproximationAndTranscendence's D-finite theory to integral holonomic germs with full meromorphic local solution bases, bounds their scalar spans, and derives finite-dimensional fields after rational pole clearing. Three analytic arguments reach the same circle-mean bound; centred capacity formulas and explicit counterexamples distinguish the valid scalar fields and sampling geometry.

AI assistance: Codex. The mathematics pass recorded here is the port author's self-review.

## Supplier and ownership audit

The roadmap inputs still in new-roadmap pull requests are **ConformalMappingPartII** and **ProbabilisticAndMetricNumberTheory**. All other cited roadmap inputs below are read from main, including roadmaps with open revisions. No revision of an existing roadmap was used as a supplier.

| Supplier | Exact material consumed and verified |
|---|---|
| DiophantineApproximationAndTranscendence | Main §5.1: nonzero polynomial differential annihilators, finite derivative spans, sum/product closure, ordinary complex initial jets and analytic initial-value theory. Scope citations §§0.2–0.3,2.8,5.2–5.3 also exist. Rational-coefficient annihilator descent remains owned here, not attributed to Part I. |
| ConformalMappingPartII | Supplied head §§0.1–0.6: scalar equations, germ comparison, continuation, global solutions, full meromorphic bases and rational simultaneous pole clearing; §§1.3–1.4: pointed radius and extremality; §§3.5–3.7: reconstruction phase, smoothing and quotient representation. |
| ProbabilisticAndMetricNumberTheory | Supplied head §2.7: strict-cut discrepancy, guarded empty sample, pointwise-jump Koksma and Erdős–Turán with constant 3. |
| SuccessiveMinima | Main §0.1, targets 0.1.1 and 0.1.2: orthonormal-coordinate and Hermitian Gram–Hadamard bounds, including empty/dependent families. |
| ClassicalArithmeticCompletion | Main §§6.18–6.19,6.40: finite Fekete diameters, monic Chebyshev norms, common limit, affine transport and disc/interval/finite-set values. The energy/equilibrium extension is a conditional contract, separately recorded below. |

Object searches used the roadmap list/grep/show tools over the indexed open heads and main, direct reads of the supplied relevant heads, main and Completed, and the board packages. Searches covered coefficient lattices, formal inverse denominators, algebraic-series denominators, analytic germs, full meromorphic bases, rational-series annihilator descent, auxiliary coefficient arguments, multiplier and mean rank bounds, circle and interval discrepancy, Fekete/Vandermonde extrema, weak-measure limits and logarithmic energy. The index advanced during the session: citation resolution reported main `f52d972` and 384 open heads, whereas the requested content checkout and its local base remained `4d14cbd`. Every cited main-branch section and library declaration was also read directly in the requested checkout or its pinned dependencies; the resolver's broader result was not substituted for those checks. The resolver reported no unresolved roadmap citations or Lean names and explicitly did not inspect pinned libraries.

RandomMatrices Layer 9 was read at its supplied head: its weighted energy is on ℝ with a confining potential and does not supply the arbitrary-compact ℂ contract. ArithmeticDynamics' dynamical equilibrium measures and the board's Betti-equilibrium measures concern different objects. No additional owner for the arithmetic algebraization targets was located in the supplied searchable material. Ownership against open pull requests whose files were not supplied was not checked beyond the index search. No declaration takes another roadmap's fully qualified name.

The retained arithmetic targets are the owner's extension of Part I §5.1: the arithmetic pullback lattice, mean-rank argument, rational annihilator coefficient descent, meromorphic-basis ring closure, W/V comparison and centred arithmetic specialization are not the generic differential-equation, discrepancy, determinant or capacity constructions owned by the named suppliers.

## Supplier replacements, duplication removals and Lean allocation

The accepted variation note is applied explicitly: Scope and ownership names `TauCeti.eVariationOn_eq_lintegral_enorm_derivWithin` in `TauCeti/Analysis/Calculus/MetricVariation.lean`, line 276. Its complete-target hypothesis is in scope from line 122. Section 3.5 requests only bounded variation of the positive logarithmic norm and explains specialization of that native identity to the real angular pullback on [0,1], replacement of the within derivative off null endpoints, and conversion of the finite nonnegative integral to ℝ. The generic C¹ identity is no longer phrased as a new theorem there. Sections 3.3 and 3.5 retain the supplier in Needs. No acceptance declaration was added for this specialization.

No mathematics moved from Lean to the README during this port: the accepted six-declaration allocation already meets the acceptance-test rule. The multiplier estimates (§§1.4–1.5), Eisenstein theorem (§0.4), open-disc consequence (§2.3), circular discrepancy (§3.1), Fekete equality (§3.6) and discrepancy gap (§3.8) remain fully specified in prose, as the accepted review requires. The missing differential-equation/holonomic-ring carrier remains identified in the module docstring for the holonomic W bound, scalar-span comparison, integral-coordinate finiteness and centred holonomic capacity theorem.

The duplication sweep retains the package's scope allocations: native series rescale/substitution/inversion, Laurent embedding, rational-function degree, Siegel bound, finite-domain field structure, scalar Cauchy/Jensen, empirical measures and polydisc Cauchy are inputs; generic Hadamard goes to SuccessiveMinima; scalar equations/meromorphic bases/pole clearing/quotients go to ConformalMappingPartII; interval inequalities go to ProbabilisticAndMetricNumberTheory; finite and limiting capacity values go to ClassicalArithmeticCompletion. Apart from removing the generic C¹ identity's target phrasing, there were no additional duplicate targets to delete. All removals and ownership boundaries are recorded in Scope and ownership; no removed-target stubs were introduced.

## Final upstream mathematics read and fixes

I reread the whole final README as a reviewer and made these repairs beyond the accepted package:

1. Corrected the row-inner-product ratio in §3.6 from z_i/z_j to z_j/z_i. At the pin, `PiLp.inner_apply` in `Mathlib/Analysis/InnerProductSpace/PiL2.lean`, line 101, sums coordinate inner products; `RCLike.inner_apply` in `Mathlib/Analysis/InnerProductSpace/Basic.lean`, line 923, gives y·conj(x). Rows (1,1),(1,i) therefore have inner product 1+i in that order and 1−i in the other. The new Check pins this convention; the determinant bound and polygon equality statement are unchanged.
2. Made the accepted native C¹ variation replacement explicit in scope and in §3.5's target wording. Added the computed positive-log witness h=1−z: angular variation 2 log 2 and value 0 at z=1. The Re z witness still gives 4 on both sides of the imported identity, and constants give 0.
3. Added tangent-lattice Checks with χ=t+t² at scale 1 and χ=t/2 at every normalized scale, separating integrality from the required linear coefficient 1. Existing scale-2 and scale-4 calculations remain.
4. Replaced package gap slugs and G1 process identifiers in the published prose with timeless mathematical scope and contract descriptions. The full general energy contract and the translated-disc obstruction remain; this does not settle either unresolved design obligation below.
5. Adapted the Lean module header to the pinned module system, preserving the theorem statements and their public names. This is an import-compatibility repair, not a mathematical narrowing.

No other false theorem, vacuous condition, mismatched quantifier or unsourced new mathematical claim was found in this pass. The computed checks are finite consistency and counterexample tests, not proofs of the admitted theorems.

## Source and pin evidence

The legal cached texts matching the three source-manifest hashes were read, and the author offprint/arXiv versions were also opened online. No source passage was copied into a deliverable and no source manifest was changed.

| Target family | Verified exact source locations |
|---|---|
| Integral overconvergence, open-disc criterion and boundary benchmarks | CDT25 line 145; CDT25 line 169; CDT25 line 242 |
| Mean rank and arithmetic algebraicity | CDT25 line 440; CDT25 line 706 |
| Holonomic definition, local bases, scalar spans and rational pole clearing | CDT25 line 467; CDT25 line 479; CDT25 line 489; CDT25 line 502 |
| Uniform denominators and auxiliary functions | CDT25 line 546; CDT25 line 574; CDT25 line 576; CDT25 line 597; CDT25 line 604 |
| Integral jets, multiplier extrapolation and quotient input | CDT25 line 519; CDT25 line 614; CDT25 line 620; CDT25 line 632; CDT25 line 711 |
| Lexicographic coefficient and averaging | CDT25 line 936; CDT25 line 973; CDT25 line 1001 |
| Circle extrema, discrepancy, variation and Fourier comparison | CDT25 line 1063; CDT25 line 1082; CDT25 line 1096; CDT25 line 1110 |
| Energy-gap proof and Vandermonde damping | CDT25 line 1134; CDT25 line 1190; CDT25 line 1235; CDT25 line 1327 |
| Compact-set formula and explicit obstruction | CDT25 line 1364; the counterexample is the roadmap's own calculation |
| Eisenstein theorem, elementary tail argument and coefficient field | BB11 line 26; BB11 line 543; BB11 line 764 |
| Energy, lower semicontinuity, existence and positive-capacity uniqueness | Saff10 line 272; Saff10 line 297; Saff10 line 310; Saff10 line 315 |
| Energy/diameter identification and disc equilibrium | Saff10 line 326; Saff10 line 387 |

All library declaration names in the supplier contracts were located at the pins and their hypotheses read. The README gives their relative files and lines. Additional native-definition checks include `PowerSeries.HasSubst` at `Mathlib/RingTheory/PowerSeries/Substitution.lean`, line 39 (nilpotent constant coefficient; no analytic convergence), `IntermediateField.adjoin` at `Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean`, line 34 (field closure of scalars and the specified elements; no finiteness claim), and `eVariationOn` at `Mathlib/Topology/EMetricSpace/BoundedVariation.lean`, line 60 (monotone partition sums; no continuity built in). All own declarations have explicit binders, and all imported topological/analytic hypotheses are specialized to the compact metric circle or the stated complete target. Targeted web searches for Mathlib/Zulip prior work did not identify an additional relevant API to adopt; unrelated modular Eisenstein-series search matches were not treated as evidence about algebraic-series denominators.

## Unresolved accepted conditions

The acceptance in `packages/DiophantineApproximationAndTranscendencePartII/review.json` is conditional on **complex-logarithmic-equilibrium**. Main ClassicalArithmeticCompletion §§6.18–6.19,6.40 supplies capacity normalization but does not state the full general extended-energy/existence/positive-capacity-uniqueness contract. That contract remains explicit, for every nonempty compact subset of ℂ, rather than being replaced by a circle-only shortcut or falsely attributed to an existing theorem. The damping route and the equilibrium wording of Layer 5 retain this conditional input. The quotient and Jensen routes to the two Lean headlines do not use it. Passing the mechanical gate does not discharge this condition.

The accepted design's **G1 arbitrary-compact replacement obligation** also remains unresolved: the translated-disc calculation refutes the printed unrestricted formula, and neither a correct general base-point-sensitive rank theorem nor a maintainer scope decision is supplied by this port. The centred theorem and obstruction are preserved without inventing general hypotheses or an empty acceptance predicate. The older frozen-plan supplier strings mentioned in the accepted reports were not edited; the published cross-roadmap citations resolve to the actual named owners. These are carried acceptance conditions, not new supplier claims or dependency cycles.

There are no unresolved Lean elaboration errors, missing reference texts, new source requests or uncommitted content changes. No suspicious instruction from fetched material was acted on.

## Computed adversarial mathematics pass

This is the port author's pass, not an independent review. API numbers denote the bullets in their README order. Exact algebraic values below are the evidence; decimals are only approximations to those displayed expressions. Arithmetic carriers are ℚ, ℤ, ℂ and their stated series fields: characteristic-p rings, inseparable extensions and nonabelian groups are not admitted inputs to the arithmetic targets. The native substitution contract does admit nonreduced rings, tested separately below. Every constructed scalar span is in ℚ((x)), so zero rings cannot enter its field argument. The conditional energy input is tested mathematically without claiming that its supplier implements it.

| Statement | Instances tried | Computed values on both sides | Result | Change |
|---|---|---|---|---|
| Characteristic-zero and Puiseux conventions | y=1+u/2, u=x^(1/2) | y(2u)=1+u; root denominator N=2>0, N=0 excluded | Scaling in the new variable agrees | None |
| Formal substitution direction | f=x², χ=t/2 | f(χ)=t²/4; reversed substitution gives t²/2 | Inner-first convention distinguished | None |
| Taylor normalization | F=x², n=0,1,2 | Derivatives (0,0,2), coefficients (0,0,1); 2/2!=1 | Factorial required | None |
| Circle normalization and cutoff | g=2,1/2,0 | J=(log 2,0,0); arclength at 2 gives 2π log 2 | Mass one and log⁺ fixed | None |
| Vandermonde parity | d=1; tuple (1,−1) | Products 1,2; native determinants 1,−2; norms 1,2 | Sign factor (−1)^(d(d−1)/2) agrees | None |
| Limit order and positive denominators | d=1,2; λ=1,2 | d/(d!)^(1/d)=1,√2; log λ=0,log 2 | d=0 and λ=1 excluded where dividing | None |
| Integral lattice definition | Σ(x/2)^n at M=1,2; zero | Scaled linear coefficients 1/2,1; zero gives 0 in every degree | Membership and nonmembership separated | None |
| Tangent lattice definition | χ=t+t²/4 at M=2,4 | Ordinary scale-2 coefficient 1; tangent coefficients 1/2,1 | Ordinary lattice is insufficient | Added scale-one positive and wrong-linear-term Checks |
| IntegralSeries definition | 0,1,1+x/2 | Coefficients 0; (1,0,…); offending coefficient 1/2 | True,true,false | None |
| §0.1 API 1: coefficient criterion | f=1+x/2,M=2 | M⁰a₀=1,Ma₁=1, higher coefficients 0 | Both membership descriptions agree | None |
| §0.1 API 2: native rescale | f=1+x/2,M=2 | f(2x)=1+x; integer coefficients (1,1) | Image equals lattice | None |
| §0.1 API 3: subring | f=x/2,h=1+x/2,M=2 | Sum at 2x is 1+2x; product is x+x²; negative is −x | Ring operations preserve membership | None |
| §0.1 API 4: divisible scales | M=2,N=4,a_n=2^(−n) | M^na_n=1; N^na_n=2^n | Inclusion direction correct | None |
| §0.1 API 5: constants | c=2,1/2 at M=1,4 | M⁰c=2,1/2 at both scales | Variable scaling cannot repair constants | None |
| §0.1 API 6: tangent equivalence | χ=t+t²/4,M=4; χ=t/2 | χ(4t)/4=t+t²; 4^(2−1)/4=1; wrong χ always gives t/2 | Both directions and linear normalization tested | Added negative Check |
| Uniformizes definition | φ=2z,f=x,g=2z or 3z | F∘φ=2z; difference from 3z is −z, a nonzero germ | Genuine germ identity required | None |
| positiveLogMean definition | g=2z,1/2,0 | Boundary positive logs log 2,0,0 | Zero is nonsingular | None |
| rationalFunctionField definition | p=x,x²,2 | Fields ℚ(x),ℚ(x²),ℚ; extension degrees 1,2,∞ | Field closure differs from scalar span | None |
| §0.2 API 1: initial coefficient | f=1 and x² | g(0)=1=a₀; second Taylor coefficient 2/2=1 | Includes degree zero | None |
| §0.2 API 2: uniqueness | F=x or −x,φ=2z | Pullbacks 2z and −2z; linear difference 4z | Opposite branch excluded | None |
| §0.2 API 3: ring operations | f=x,h=x²,φ=2z | Sum 2z+4z²; product 8z³=(2z)(4z²); unit 1 | Compatible with formal operations | None |
| §0.2 API 4: shrinking | φ=2z,r=3/4,1/4 | New derivative moduli 3/2,1/2 | Relation survives; expansion may not | None |
| §0.2 API 5: Taylor substitution | f=x²,φ=2z+z² | Pullback 4z²+4z³+z⁴ | Coefficients agree with substitution | None |
| §0.2 API 6: common radius | f=(1−x)⁻¹,(1−2x)⁻¹ | Radii 1,1/2; common radius 1/4>0 | Finite family admits common neighbourhood | None |
| §0.2 API 7: constant means | c=0,1/2,2 | log(max(1,abs c))=0,0,log 2 | Cutoff excludes negative raw mean | None |
| §0.2 API 8: generated field | p=x² | x² and x⁻² belong; x does not, degree 2 | Inversion included, extra square root excluded | None |
| §0.2 API 9: nonconstant boundary | p=0,2,x | Base fields ℚ,ℚ,ℚ(x); native finranks 0,0,1 | Native zero finrank is not finite degree zero | None |
| §0.2 API 10: affine covariance | p=x²,a=2,b=3; a=0 | x²=((2x²+3)−3)/2; slope 0 instead generates ℚ | Nonzero-slope iff correct | None |
| §0.2 API 11: finite rotation-invariant mean | g=2z,g(iz)=2iz | Both means log 2≥0 | Normalization retained | None |
| §0.2 branch and pole Checks | sqrt branch at 0; (1−x)⁻¹,φ=2z | Wrong branch has −1≠a₀=1; rational pullback pole at z=1/2 | Wrong realizations excluded | None |
| §0.3 overconvergent integral series | 1+x² at R=2; Σx^n at R=1 | Coefficients n≥3 are 0; radius-one series has every coefficient 1 | Strict radius needed | None |
| §0.4 Eisenstein denominators | 1/2; sqrt(1−4u); zero | c=2,M=1 gives (1,0,…); sqrt coefficients (1,−2,−2,−4); zero gives 0 | Scalar handles the constant | None |
| §0.4 absorbing scalar with integral a₀ | n=1,2,0 | (cM)a₁=cMa₁; (cM)²a₂=c(cM²a₂); degree zero remains a₀ | Nonnegative exponents used only for n≥1 | None |
| §0.4 tail recurrence and coefficient field | f=sqrt(1−4x),N=1 | s=0,2N=2>N+s=1; Q(x,Y)=4+2Y+xY², Q(0,Y)=4+2Y | Linear tail constant and rational recurrence agree | None |
| §0.5 inverse denominators | p=x,x² with χ=t | M=1; inverse t; p′(0)=1,0 respectively | Ramification allowed | None |
| §0.5 integral normalized inverse | χ=t+t²/4,M=4 | Rescaled χ=t+t²; inverse t−t²+2t³−5t⁴+… | Same tangent lattice | None |
| §0.5 inverse scale witness | p=x+x⁴/32 | χ₄=−1/32,χ₇=1/256; normalized M=4 gives −2,16 | Scale independent of f | None |
| §1.1 separate-variable independence | p=x,f=1,D=2,d=1,2 | Coefficient matrices I₂,I₄ have determinants 1; wrong family 1,p has p·1−p=0 | ℚ(p)-independence essential | None |
| §1.2 auxiliary constraints | d=2,α=3 | Degrees below 3: 1,x,y,x²,xy,y²; 6=binomial(4,2), not 9 | Total-degree count correct | None |
| §1.2 surplus and cofinal uniformity | d=1,m=1,κ=1/2; general κ | D/α→3; rows/(columns−rows)→1/2; d≥log(1+1/κ) gives factor≤e | Order and uniformity quantifiers correct | None |
| §1.3 lowest jet | F=x₁−x₂,φ=2z+z²; χ=2t,F=x/2 | Lowest coefficients (1,−1) become (2,−2); wrong χ makes x/2 pull back to t | Lower bound λ^1=2; tangent premise needed | None |
| §1.4 multiplier bound definition | (h,g)=(1,1),(1+z,0),(1−2z,2z) | Boundary maxima 1,2,6; A=0,log 2,log 6 | Supremum requires its logarithm | None |
| §1.4 API 1: larger boundary supremum | h=1+z,g=0 | Sup norms 2 and 0; maximum 2 | hg alone insufficient | None |
| §1.4 API 2: positivity | h=1,h=1−2z | Sup norms 1,3; A≥0 | Central value 1 excludes zero multiplier | None |
| §1.4 API 3: exponential threshold | h=1,g=2z,a=log 2 or 0 | A=log 2; exp a=2 admits norm 2; exp 0=1 rejects it | Both directions of iff tested | None |
| §1.4 extrapolation inequality | m=1,φ=g=2z,h=1 | Limiting inequality log 2≤e log 2 | Same scale on both sides | None |
| §1.5 multiplier rank bound | p=x,χ=t,φ=2z,h=1 or 1−2z | Bounds 1≤e and 1≤e log 6/log 2≈7.027 | Interior zero of h allowed | None |
| §2.1 mean_rank_bound | m=0 and family {1},p=x,φ=2z | 0≤e; 1≤e; J=log 2,log λ=log 2 | Empty and nonempty cases agree | None |
| §2.1 field and strictness guards | p=x²,φ=2z; λ=1 | J=log 4; bound 2e on possible independent family size; λ=1 has denominator 0 | Smaller scalar field retained | None |
| §2.2 arithmetic_algebraicity | f=sqrt(1−4x),0,1 | Annihilators Y²−1+4x,Y,Y−1; first has degree 2 and is nonrational | Conclusion is algebraicity | None |
| §2.3 open-disc criterion | sqrt example,φ=(1−exp(8z))/4,r=3/4 | Derivative −2 becomes −3/2; realization exp(4z) becomes exp(3z) | Closed-disc theorem applies | None |
| §2.3 binomial integrality | m=2,3 | First coefficients (1,−2,−2,−4) and (1,−3,−9,−45) | Integral nonrational examples | None |
| §2.3 strict threshold | lacunary series,φ=z | Derivative 1; at a dyadic root all sufficiently high radial terms tend to 1, giving unbounded tails | Dense singularities exclude algebraicity | None |
| §2.4 logarithmic lexicographic coefficient | 3z₁²z₂; 1−z; z₂^100+z₁ | log 3=mean log 3; 0=mean log(abs(1−z)); least vector (0,100), total order 1 | Null zeros and lex order distinguished | None |
| §2.5 logarithmic averaging route | least vector (0,100),φ=2z; p=x,f=1 | Coefficient multiplier 2^100; final 1≤e | β is degree of selected monomial | None |
| Circular discrepancy definition | singleton; antipodes; cubic roots | Discrepancies 1,1/2,1/3 | Probability normalization correct | None |
| §3.1 API 1: arc supremum | antipodes, half-circle and tiny arc | Half-circle error 1/2−1/2=0; tiny arc error→1/2 | Supremum 1/2 | None |
| §3.1 API 2: rotated star | singleton angle 1/2 | Fixed-cut star 1/2; cut at its location gives supremum 1 | Circle adapter adds cuts | None |
| §3.1 API 3: bounds | regular d-gon d=1,2,3 | D=1,1/2,1/3=1/d≤1 | Lower bound attained | None |
| §3.1 API 4: permutation | (1,1,−1),(−1,1,1) | Same weights (2/3,1/3), same discrepancy 2/3 | Multiplicity retained | None |
| §3.1 API 5: rotation | (1,−1),(i,−i) | D=1/2 in each case | Rotation invariant | None |
| §3.1 API 6: repetition | (1,−1),(1,1,−1,−1) | Weights 1/2 each, discrepancy 1/2 in both | Repetition does not improve it | None |
| §3.1 API 7: empirical agreement | tuple (1,1,−1) | Tiny arc mass near 1 tends to error 2/3 in tuple and measure formulas | Same object | None |
| §3.1 API 8: zero iff Haar | Haar; point mass | Arc masses ℓ give D=0; point mass gives D=1 | Wrong law excluded | None |
| §3.1 empty guard | d=0 | Guard 0; raw totalized count 0/d=0 gives sup ℓ=1 | Guard needed; inequalities require d≥1 | None |
| §3.2 weak continuity | half masses exp(±i/n); regular d-gon | D=1−1/(πn)→1=D(δ₁); polygon D=1/d→0 | Atoms do not refute scalar continuity | None |
| §3.3 circle Koksma | Re z,singleton 1; constant c; indicator of {1} | Errors 1,0,1; variations 4,0,2; D=1 | Bounds 1≤4,0≤0,1≤2 retain sampled jumps | None |
| §3.4 circular Erdős–Turán | d-gon,K=d−1; singleton,K=1 | Means 0 give 1/d≤3/d; singleton gives 1≤9/2 | Constant 3 survives all cuts | None |
| §3.5 positive-log variation | h=0,z,2z,1−z | Variations 0,0,0,2 log 2; h=1−z gives value 0 at z=1 | Cutoff nonsingular | Added exact variation 2 log 2 |
| §3.5 C¹ identity specialization | Re z; constant | ∫₀¹2π abs(sin(2πt))dt=4=variation; 0=0 for constant | Native theorem with null endpoints | Made supplier attribution explicit in scope |
| §3.6 row-inner-product convention | Rows (1,1),(1,i) | Native inner product 1+i; reversed 1−i; sums of z_j/z_i and z_i/z_j differ | First-argument conjugation requires z_j/z_i | Corrected ratio and added negative-control Check |
| §3.6 circle Fekete and equality | d=1;(1,−1);(1,1);(1,i);cubic roots | 1=1;2=2;0<2;√2<2;3√3=3^(3/2) | Both directions of polygon equality tested | None |
| §3.7 Haar energy | Haar; point mass; antipodal probability | Energies 0,+∞,+∞; off-diagonal antipodal part −log 2/2 | Infinite diagonal retained | Conditional supplier retained |
| §3.8 discrepancy gap | collision; regular d-gon; singleton | 0<exp(−cd²); polygon has D=1/d, abs V=d^(d/2)>1; singleton 1>exp(−c) | Large-d threshold indispensable | None |
| §3.8 truncated energy identity | antipodes,cutoff A>0 | Integral A/2−log 2/2; off-diagonal term −log 2/2; difference A/2=A/d | Diagonal removed only after d-limit | None |
| §3.9 damping | d=2,F=x₁−x₂,φ=2z,M=1 | H=2(z₁−z₂)²; coefficients (2,−4,2); selected coefficient 2=λ^1 | Derivative exponent is β, not new total degree 2 | None |
| §3.9 ceiling and zero convention | SD/(cd)=1/2;S=0 | Ceiling 1 cancels growth; floor 0 does not; S=0 gives M=0 and V⁰=1 | Rounding and zero factors safe | None |
| §3.10 four successive limits | κ=1/2,d=2,10,100 | 3^(1/d)→1; log d/d≈.3466,.2303,.0461→0 | Remainder survives at fixed d | None |
| Holonomic ring definition | 1;exp x;exp(x/(1−x)),χ=L/(1+L),L=−log(1−t) | Pullbacks 1; exp has coefficient 1/2; last pullback exp L=(1−t)⁻¹ integral but essential singularity at 1 | Arithmetic and meromorphic conditions independent | None |
| §4.1 API 1: exact membership | 1; exp x with χ=t | D(1)=0,basis {1}; exp coefficient 1/2 fails integrality | Not every D-finite series belongs | None |
| §4.1 API 2: zero and one | 0,1 | Integral pullbacks 0,1; derivative annihilates both | Ring contains a nonzero unit | None |
| §4.1 API 3: closure | f=g=(1−x)⁻¹ | Sum coefficients 2; negative coefficients −1; product coefficients n+1 | Integral operations agree with §4.2 | None |
| §4.1 API 4: restricting U | f=(1−x)⁻¹,U=ℂ,U′=D(0,1/2) | Singular set {1} intersects U in {1},U′ in ∅ | Restriction weakens condition | None |
| §4.1 API 5: arithmetic multipliers | χ=t,p=x; constant 1/2 | Pullbacks t integral; 1/2 nonintegral | Multiplier premise needed | None |
| §4.1 API 6: rational descent | f=exp x; sqrt 2 times ((1−x)D−1) on (1−x)⁻¹ | Kernel of [1,1] spanned by (−1,1) over both fields; nonzero basis component is ((1−x)D−1), residual 0 | Same order and degree | None |
| §4.1 descent boundary | f=0,L=1; exp(sqrt 2 x) | Residual 0 at order 0; rational order-one relation would give p₀+sqrt 2 p₁=0, forcing both zero | Rational-coefficient hypothesis essential | None |
| §4.1 meromorphic basis versus monodromy | x² under D³; exp(1/x) | Jet (0,0,2); exp(1/x) has monodromy 1 and infinitely many negative Laurent powers | Correct stronger local condition | None |
| §4.2 ring and rational multiplier closure | f=g=(1−x)⁻¹; p=(1−x)⁻¹ | Sum 2/(1−x) solves ((1−x)D−1)y=0; product solves ((1−x)D−2)y=0; p·1 has pole 1 but integral pullback | Poles allowed for multiplier | None |
| §4.2 cyclic presentation and order drop | f=1,g=−1;f=g=x | Sum 0 has order 0 though pair module has order 1; product x² satisfies (xD−2)x²=0 | Subquotients and singular jets handled | None |
| W definition and §4.3 API 1 | finite sums with coefficients in ℚ(p) | (1/p)·p=1; scalar (1/p)·1 belongs to W | Unital scalar span | None |
| V definition and §4.3 API 2 | x⁻¹·1 | Laurent valuation −1, so x⁻¹∈V but not ℚ[[x]] | Laurent ambient essential | None |
| §4.3 API 3: algebra structure | scalar multiples a·1,b·1 | Product ab·1,unit 1; 1≠0 | Unital subalgebras | None |
| §4.3 API 4: scalar extension | p=x²; finite presentations | Σ a_i(x)h_i is unchanged as a V-sum; coefficients in ℚ(p) remain in ℚ(x) | Both inclusions W⊆V=ℚ(x)W | None |
| §4.3 API 5: integral coordinate | χ=t,p=x² | x∈H; W field then contains x⁻¹; [ℚ(x):ℚ(x²)]=2 | W=V does not equate scalar fields | None |
| §4.3 API 6: source comparison | χ=t | Both V definitions are span over ℚ(x) of H(U,t,ℤ) in ℚ((x)) | Carrier, generators and scalars identical | None |
| §4.4 rational simultaneous clearing | f=(1−x)⁻¹,q=1−t;f=(1−2x²)⁻¹,q=1−2t² | q(p)f=1 in both; q=i(1−t) would give i∉ℚ | Rational integrality survives extra conjugate zeros | None |
| §4.4 injectivity of clearing | q≠0,p=x² | q(p)=q(x²) has nonzero leading coefficient and degree 2 deg q; multiplication has zero kernel | Nonconstancy prevents zero factor | None |
| §4.5 W rank | U=ℂ,p=x,χ=t,φ=2z | 1≤dim W≤e, hence dim W≤2; λ=1 gives log 1=0 | Bound concerns W and positive denominator | None |
| §4.6 field structures and degree factors | p=x²,χ=t; degree-four p | Scalar degree 2,W=V; degree-four V has rank≥4 while safe bound is 4B | Scalar-extension factor preserved | None |
| §4.6 domain and rank-zero exclusion | rank-one field subalgebra | dim=1, unit Laurent coefficient 1; zero ring would require 1=0 | Native field-of-finite-dimensional assumptions hold | None |
| §4.7 large open-disc maps | U=ℂ,𝔻,ℂ∖{1} | 2z gives derivative 2; Schwarz gives ≤1; 1−exp(2z) gives derivative −2 and omits 1 | Nonhyperbolic domains use explicit map | None |
| §4.8 inverse identities | p=x+x⁴/32,χ=t−t⁴/32+t⁷/256+… | Coefficients 4,7 in either composition: −1/32+1/32=0,1/256−4/1024=0 | Correct inverse and nonintegrality | None |
| §4.8 scalar-span counterexample | same p,φ=2z | Degree 4; abs p(2z)≤5/2; B≤e log(5/2)/log 2≈3.5934<4; 125/8<16 | Refutes unrestricted V bound | None |
| §5.1 centred capacity rank | r=1/2,φ=4z or 2z | cap=1/2; first numerator/denominator log 2/log 2 gives e; second denominator 0 | Strict product condition needed | None |
| §5.2 translated compact obstruction | centre 1/2,radius 1/4,φ=8z exp(−20z) | abs φ≤6exp(−5)≈.04043<1; numerator 0; denominator log 8+log(1/4)=log 2>0; rank≥1 | Proposed bound would be 1≤0 | Preserve counterexample and unresolved generalization |
| Worked modular benchmark | F=1+4x+36x²+…,φ=q−8q²+… | q coefficient 4; q² coefficient −32+36=4; theta square has (1,4,4) | Factor 16 and square agree | None |
| Worked nonrational uniformization | f=(1−4x)^(1/2),φ=(1−exp(8z))/4 | f∘φ=exp(4z); abs φ′(0)=2 | Analytic continuation exceeds original radius 1/4 | None |
| Native substitution supplier on nonreduced rings | constant 1 over ℚ; constant ε in ℚ[ε]/(ε²) | 1^n=1≠0; ε²=0 | HasSubst means nilpotence, not convergence | None |
| Native inverse supplier boundary | P=X+X² over ℤ;2X over ℤ and ℚ;zero ring | Inverse X−X²+2X³−5X⁴; equation 2b₁=1 has no integer solution, b₁=1/2 over ℚ; zero ring gives 0=X | Unit hypothesis and junk carrier covered | None |
| Native Siegel supplier | A=[1,1],one row,two columns;zero rows | Kernel vector (1,−1),norm 1≤2; no-row case coordinate vector norm 1 | Positive-row theorem separated from empty system | None |
| Native Cauchy/Jensen suppliers | F=x²,R=2,C=4;1−z | Derivative 2≤2!·4/2²=2; log central value 0≤circle mean 0 | Factorials and boundary zeros correct | None |
| Native empirical supplier | antipodes;double repetition;singleton | Weights 1/2,1/2; same repeated weights; singleton weight 1 | Multiplicity/nonempty premise correct | None |
| Native polydisc Cauchy supplier | G=z₁z₂;dimension zero | (1,1) coefficient 1 after division by (2πi)²; empty factor (2πi)^0=1 | Normalization matches scalar Cauchy | None |
| Native metric-variation supplier | cos(2πt);constant | Native variation=derivative norm integral=4;constant 0=0 | Complete real target, endpoints null | Scope attribution explicit |
| Part I differential supplier | exp x;(1−x)⁻¹;x² | Df−f=0;(1−x)Df−f=0;D³x²=0 and jet (0,0,2) | Ordinary derivatives and closure agree | None |
| ConformalMappingPartII local supplier | xy′+y=0;x²y′+y=0 | Basis x⁻¹,cleared by x; exp(1/x) essential despite monodromy 1 | Full meromorphic basis needed | None |
| ConformalMappingPartII radius/phase supplier | D(0,2);constant i;g=h=1 | Radius 2,inverse-map derivative 1/2;phase i,modulus 1,J=0;A=0 | Reciprocal direction and phase fixed | None |
| Metric-number-theory supplier | singleton angle 1/2;rotation by a | Star 1/2,circular 1;Fourier factor exp(−2πika) has norm 1 | All-cut constant unchanged | None |
| SuccessiveMinima Hadamard supplier | columns (2,0),(0,3);(1,0),(1,1);empty | Determinants/products 6=6,1<√2,1=1 | General bound imported | None |
| ClassicalArithmeticCompletion diameter supplier | radius-2 disc;{0,2};[0,1] | δ₂=4,capacity 2;δ₂=2,δ₃=0,capacity 0;interval capacity 1/4 | Finite and limiting diameters distinct | None |
| Conditional general equilibrium contract | radius-2 circle;{0,1};affine scale 2 | Minimum −log 2,capacity 2;every atomic probability has +∞,capacity 0;energy shifts by −log 2 under scale 2 | Uniqueness only at positive capacity; input remains conditional | Contract retained without claiming it exists |


Pull request: #1693 (roadmap/diophantine-approximation-and-transcendence-part-ii at 24c0576)
