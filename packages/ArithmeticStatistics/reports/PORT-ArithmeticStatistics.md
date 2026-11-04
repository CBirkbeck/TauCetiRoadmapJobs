# ArithmeticStatistics port report

Branch: `roadmap/arithmetic-statistics`.
Head commit: `2b44da5b3d1e2281d6024cd054d70607dea05bc0`.
Base: `e9512ca`; the initial working tree was clean.

The commit contains exactly `TauCetiRoadmap/ArithmeticStatistics/README.md`, `TauCetiRoadmap/ArithmeticStatistics/Suggested.lean` and `TauCetiRoadmap/ArithmeticStatistics/metadata.toml`. The final working tree is clean. Nothing was pushed and no pull request, issue or comment was written.

## Validation

The prescribed module build exited 0. Its exact outcome lines were:

```text
✔ [8976/8976] Built TauCetiRoadmap.ArithmeticStatistics.Suggested (3.3s)
Build completed successfully (8976 jobs).
```

Warning count: **0**, including **0 sorry warnings**. The accepted index contains no declarations requiring admission. The Lean file is byte-for-byte identical to the accepted package, with one `import Mathlib`, one module docstring and an empty namespace.

The prescribed push gate exited 0. Its exact summary was:

```text
gate ArithmeticStatistics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Before committing, the gate reported only `dirty=1` for the untracked new folder; every content check passed. The clean-tree gate above passed after the commit. No tool or gate policy was changed.

The prescribed dependency-direction check exited 0 and printed exactly:

```text
depcheck: 51 roadmaps, 582 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Citation resolution against main `e9512ca`, all 362 indexed open heads and the worktree's actual pinned Lake packages found no unresolved cross-roadmap citation or Lean name. All 20 relative Markdown links resolve at their specified heads, including all 12 explicit anchors.

The mechanical declaration inventory returned **0 names**. A scratch signature file was generated from the submitted module with the corresponding empty `#check @name` list. There are **0 elaborated declaration types and 0 binders to compare**; no standing hypothesis changed. The module itself elaborated in the successful build above. No separate invocation was needed for an empty signature sweep. No Lean command other than the prescribed module build was run, and nothing remains running.

## Draft pull request body

This roadmap organizes the eight-part arithmetic-statistics library, from finite-height families and integral orbit dictionaries through uniform counts and sieves to field densities, class-group moments, Selmer averages and probability comparisons. The shared supplier contracts and numerical convention checks keep these applications tied to the same objects, measures, weights and height orderings.

The index preserves the parts' ownership and introduces no additional mathematical target. It records the cubic basis comparison, narrow class-group convention, conditional windowed cubic count and even-degree sieve hypotheses; its acceptance module therefore contains no theorem or definition.

AI assistance: Codex (GPT-6) performed the port, source and supplier checks, numerical mathematics pass and validation recorded in this report.

## Scope, changes and review disposition

The accepted `review.json` records acceptance with zero findings and zero blocking findings. The accepted independent review supplies no remaining non-blocking repair. Its index-only scope is preserved: this folder owns navigation, shared contracts and comparisons of conventions, while the eight parts own all definitions and headline theorems. Adding a mathematical layer here would duplicate those owners. Per-definition API lists, three Checks per definition and layer examples/dependencies have zero applicable entries in this index; none was lost from an owned mathematical specification.

The port retains the Summary, all supplier contracts, both source keys and locators, all eight part descriptions, all downstream references and all five accepted Checks. Six additional prose Checks pin conventions already present in the package. The README now has **11 Checks**, no owned target and no definition.

The final upstream-reader pass made these concrete repairs and clarifications:

1. Replaced the ambiguous group “volume-one normalization” with Tamagawa volume one for the quotient `SL2(F)\SL2(A_F)`. Part III's windowed cubic counting contract, item 7, states this quotient, not a volume-one assertion about a noncompact local group. Added the standard-integral-differential witness: local volumes 3/4 and 8/9 at 2 and 3, with the global quotient product equal to 1. Specifying the differential matters because rescaling it changes individual local volumes.
2. Made the source domain **even n ≥ 4** explicit in the even-degree sieve paragraph. Added admissible and inadmissible parameter computations showing why the weighted inequality cannot be discarded.
3. Added a reciprocal-weight and signed-discriminant Check, additive Haar subgroup masses, a separating iterated-limit example, and the distribution-versus-moment and empty-denominator controls. These expose the conventions' mathematical consequences without adding acceptance-test padding.

No statement, definition, API lemma, example or Check moved from Lean to README: the accepted Lean file already has no declarations. No headline theorem belongs to this index and none is omitted for lack of a carrier. Metadata matches the one-key form on main: `topic = "math.NT"`.

No new supplier replacement or duplication removal was needed. The accepted package already cites AnalyticNumberTheoryPartII for cubic objects and ArithmeticDirichletSeries for summation and Tauberian methods, with no restatement in Lean. No object moved from a later roadmap into this index. No removal is recorded outside Scope and ownership because there was no removal.

## Suppliers, ownership and citations

Dependencies that remain new-roadmap pull requests: **AnalyticNumberTheoryPartI** and **AnalyticNumberTheoryPartII**. **ArithmeticDirichletSeries** is consumed from `Completed/` on main, rather than from an open revision. The eight ArithmeticStatistics parts are navigation and ownership destinations, not suppliers of an index theorem; their links do not introduce upward supply edges. HeightsRationalPointsAndObstructions and ModularityAndLanglandsExtensions are downstream consumers, not suppliers.

The head index used was dated 2026-10-25T13:04:46Z. All supplier and owner passages below were reopened at these heads. Line numbers refer to the roadmap file itself, excluding the display envelope added by the roadmap service.

| Roadmap and revision | Resolved material |
| --- | --- |
| AnalyticNumberTheoryPartII, `ed5b737` | `TauCetiRoadmap/AnalyticNumberTheoryPartII/README.md` line 763: §5.4 action and discriminant; line 782: §5.5 projective equivalence, stabilizers and basis table; line 807: §5.6 finite weighted coefficients and traces; line 827: §5.7 uniform small-degree bound; line 1193: §5.21 cleared poles/residues; line 1553: §5.28 pole-excluding convexity; line 1581: §5.29 quadratic large sieve. |
| AnalyticNumberTheoryPartI, `4ba2e21` | `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md` line 1117: §2.5 continuation/right-hand residue comparison; line 2028: Layer 3 multiplicative sums and moments. |
| ArithmeticDirichletSeries, main `e9512ca` | `Completed/ArithmeticDirichletSeries/README.md` line 190: Layer 3; line 256: Layer 6; line 337: Layer 9. Convergence, endpoint, coefficient-positivity and separate boundary-remainder hypotheses are preserved. |
| ArithmeticStatisticsPartI, `3b1a24f` | `TauCetiRoadmap/ArithmeticStatisticsPartI/README.md` line 178: Layer 0; line 182: §0.1; line 126: cubic ring and negated basis; line 160: linear traces; line 1922: inclusive Pell cutoff and unit radicand; line 2531: §0.22 signed pencil. Its Conventions specify additive Haar normalization. |
| ArithmeticStatisticsPartII, `a7cc3be` | `TauCetiRoadmap/ArithmeticStatisticsPartII/README.md` line 62: Layer 1; line 1821: §1.12 pencil/orbit/Jacobian dictionaries. |
| ArithmeticStatisticsPartIII, `6f16f6c` | `TauCetiRoadmap/ArithmeticStatisticsPartIII/README.md` line 78: Layer 2; line 1919: binary summed tail, even n ≥ 4 and quantitative hypotheses; line 1967: §2.17 congruence count; line 2272: seven-item C(F,φ,Σ); line 2380: invariant-differential quotient-volume theorem; line 2382: discriminant/covolume factors. |
| ArithmeticStatisticsPartIV, `92b9193` | `TauCetiRoadmap/ArithmeticStatisticsPartIV/README.md` line 61: Layer 3; line 53 expressly excludes both analytic parts as inputs. |
| ArithmeticStatisticsPartV, `7f06cfc` | `TauCetiRoadmap/ArithmeticStatisticsPartV/README.md` line 79: Layer 3; line 977: narrow four-rank moments; line 2138: strict Pell cutoff; line 2461 and subsequent even-degree applications retain the tail assumptions. |
| ArithmeticStatisticsPartVI, `88461f2` | `TauCetiRoadmap/ArithmeticStatisticsPartVI/README.md` line 69: Layer 4; line 53: cubic supplier contract. |
| ArithmeticStatisticsPartVII, `cbcd49e` | `TauCetiRoadmap/ArithmeticStatisticsPartVII/README.md` line 63: Layer 5; line 41: analytic inputs; line 49: full windowed contract; line 1150: exact-height function-field three-Selmer bound; line 1158: its source locator. |
| ArithmeticStatisticsPartVIII, `b3b98cc` | `TauCetiRoadmap/ArithmeticStatisticsPartVIII/README.md` line 188: Layer 5; sections 5.12–5.22, with no direct analytic-part or ArithmeticDirichletSeries contract. |
| HeightsRationalPointsAndObstructions, `82cf8af` | `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md` line 39 consumes Part I §0.22, Part II §1.12 and Part III §2.17; §3.18b uses the actual CRT residue density. |
| ModularityAndLanglandsExtensions, `2d70821` | `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md` line 1387 consumes Part I §0.1 relative density with its height ordering. |

The part contracts give the stated consumer sets: cubic sections to I, II, III, V and VI; quadratic large sieve to I, III, V and VII; AnalyticNumberTheoryPartI to I, III, V and VII; completed ArithmeticDirichletSeries Layers 3/6/9 to III and V, and Layers 6/9 to I. Parts IV and VIII have zero direct shared analytic contracts.

The required object-based search covered main and all 362 indexed open heads, including the supplied sibling checkouts. The uncapped final sweep returned 579 matching lines for cubic actions/algebras, Pell radicands, four-rank moments, windowed counts, Davenport–Heilbronn, Cohen–Lenstra and Selmer averages. The available board packages and both pinned libraries were also searched. Relevant owner passages were opened rather than inferring ownership from names. The exact namespace search found no foreign `TauCetiRoadmap.ArithmeticStatistics` namespace. This module defines zero names, so no fully qualified declaration can collide.

The existing overlap between the Pell families in Parts I/V and ClassicalArithmeticCompletion §4.39 remains outside this index. `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md` line 8769 on main specifies the strict family. The index compares the two cutoff conventions and makes no unique-ownership claim about those external definitions. No such construction is replanned here.

## Pinned library verification

The checked package HEADs match `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The index imports no Tau Ceti module and names no library declaration as a new local target.

| Native object at the pin | Exact source and scope verified |
| --- | --- |
| Mathlib cubic coefficients/discriminant | `Mathlib/Algebra/CubicDiscriminant.lean` line 43: `Cubic` has unrestricted fields a,b,c,d, with no nonzero-leading-coefficient or étaleness condition. Line 461 defines `Cubic.discr`; its body is `b^2*c^2 - 4*a*c^3 - 4*b^3*d - 27*a^2*d^2 + 18*a*b*c*d`. The root formula at line 465 adds a ≠ 0. |
| Dedekind residue | `Mathlib/NumberTheory/NumberField/DedekindZeta.lean` line 56 defines `NumberField.dedekindZeta_residue`; line 77 gives `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`. This is a real right-hand limit, not global complex continuation. |
| Ideal Euler product | `TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Data.lean` line 56: `EulerProductData` stores `toIdealArithmeticFunction` and its `isMultiplicative` proof. It stores no analytic convergence or finite bad set. `TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.lean` line 349: `hasProd_eulerFactor` requires ideal-indexed absolute summability. |
| Perron endpoint and arithmetic formula | `TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Basic.lean` line 203: `truncatedPerronKernel_one` requires c ≠ 0 and returns arctan(T/c)/π. `TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Ideal.lean` line 161: `perronFormula` requires x,c > 0 and `LSeriesSummable`, with endpoint half-weight. |
| Wiener–Ikehara | `TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean` line 301: `TauCeti.LSeries.wienerIkehara` requires nonnegative coefficients, actual `LSeriesHasSum` throughout Re(s) > 1 and a separately continuous boundary function satisfying the residue identity. |
| Narrow class group | `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean` line 67 maps totally positive units to principal ideals; line 83 defines `(FractionalIdeal (𝓞 K)⁰ K)ˣ ⧸ narrowPrincipalSubgroup K`. The quotient retains real positivity, unlike the ordinary class group; line 159 supplies the forgetful surjection. |

These inspections check the native objects used to verify the index's contracts. No additional import, restated library lemma or new carrier was required.

## Literary sources

- **as-ref-022 line 11** distinguishes ordinary and narrow class groups; **as-ref-022 line 132** states Theorem 1 on author-manuscript p. 3. The author-hosted PDF was readable and the stated locator and narrow-group attribution agree. The definitions of the moments on pp. 1–3 also support the small moment computations below. The settled manifest status remains waived and the source package was not edited. Source equation (2), p. 2, displays a positive-discriminant denominator for a negative numerator; the index cites Theorem 1 and is unaffected.
- **as-ref-056:** the author DVI reader returned `Unsupported content-type: application/x-dvi`. Theorem 1.2 and the author-DVI pp. 1–2 locator resolve in the owning Part VII, but the source text, constants and pagination remain independently uncertified. The accepted waiver is preserved; no new source key or source request was created.

No mathematical passage was copied from either paper. These source checks concern the index's two attributions, not certification of every reference or target in the eight parts.

## Adversarial mathematics pass

There are zero index-owned theorems, definitions, constructed maps or existential operations. The rows below exhaust the index's mathematical claims, conventions and imported interfaces, with extra controls for the cited contracts. Exact arithmetic was recomputed, including the five accepted Checks; finite computations also cover all six added Checks. Testing an imported asymptotic's normalization on finite inputs does not prove that asymptotic.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Summary and layer assignment | Eight part layer headings; index inventory | Both give (0,1,2,3,3,4,5,5); owned targets = 0, Lean declarations = 0 | Index and owners agree | None |
| Section-number convention | IV/V and VII/VIII section sets | IV∩V = {3.2,…,3.9}, size 8; VII∩VIII = ∅, size 0 | Naming the part is necessary | None |
| Field isomorphism classes | Identity, non-Galois cubic, cyclic cubic | Embedded counts 1,3,1; automorphism orders 1,1,3; embedded count times #Aut divided by degree = 1,1,1 | Embedded and class counts differ | None |
| Reciprocal stabilizer weights | Trivial, cyclic cubic C₃ and split cubic S₃ | Correct weights 1,1/3,1/6; order weights 1,3,6 | Nonabelian and cyclic controls separate conventions | Added README witness |
| Signed discriminants | x³−y³, xy(x−y), zero form; ℚ(i) and ℚ(√5) | Cubic values −27,1,0; number-field values −4,5 versus absolute values 4,5 | Sign cannot be dropped | Added README witness |
| Finite height cutoffs | Nonsingular minimal short pairs at X = 1,4,5,28 | Strict counts 0,0,2,8; inclusive count at 4 is 2 versus strict 0 | Boundary matters | Retained cutoff Check |
| Positive limiting denominators | Empty family versus zero numerator/denominator X > 0 | Empty ratio totalizes to 0; second ratio = 0, but normalized denominators are 0 and 1 | Zero ratio does not establish positivity | Added empty-family control |
| Additive Haar normalization | ℤ₂,ℤ₃ and their prime-multiple subgroups | Parent masses 1,1; subgroup masses 1/2,1/3; indices 2,3 | Incorrect unit subgroup mass fails | Added README witness |
| Order of limits | Indicator a(X,M) of X ≤ M | X-limit then M-limit = 0; reverse = 1; a(2,1)=0, a(1,2)=1 | Limits cannot be freely interchanged | Added README witness |
| Arithmetic conjectures stay propositions | Whole index inventory | New axioms = 0; conjecture theorems = 0; free Prop fields = 0 | No hidden unconditional conjecture | None |
| Distribution versus moments | P(Zₙ=n)=1/n, else 0, n=2,10 | Nonzero probabilities 1/2,1/10 tend to 0; means 1,1 versus limit mean 0 | Distribution alone is insufficient | Added README witness |
| Pell family membership | d=1,2,3,4,5 | Included 1,2,5; excluded 3 by residue and 4 by square factor. Negative-Pell witnesses: 0²−1=−1, 1²−2=−1, 2²−5=−1 | Unit retained; two rejection tests work | None |
| Pell cutoff comparison | X=0,1,2,5 | Inclusive ∅,{1},{1,2},{1,2,5}; strict ∅,∅,{1},{1,2} | Original finite counts correct | None |
| Twisted row cubic action | x³−y³ under diag(2,1), 2I, upper unipotent | Discriminants −108,−432,−27 versus det² times −27 = −108,−432,−27; untwisted diag gives −1728 | Twist and direction pinned | None |
| Cubic carrier degeneracies | Same form over 𝔽₂,𝔽₃ and zero ring | Discriminants 1,0,0; over 𝔽₃ form = (x−y)³ | Zero leading coefficient and inseparability are not silently excluded | None |
| General projective equivalence | O=ℤ[√−5], I=(2,1+√−5), V=O⊕I; zero form | Norm I=2; a²+5b²=2 has no integer solution; det(C/O) has class I⁻¹≠1. Zero form: square-zero rank-two summand, discriminant 0 | Free-only or étale-only construction would lose objects | None |
| Weighted cubic coefficient family | Split order and zero form/index | Split discriminant 1, #Aut=6, weight 1/6; zero form discriminant 0 and coefficient at n=0 is 0 | Correspondence and coefficient domains are distinct | None |
| Uniform small-degree count | F=ℚ, E=F, norm n=1; n=0 | Identity contribution 1, D_F=h₂(F)=1, RHS=C; C≥1 accommodates it. Zero excluded by n≥1 | Uniform quantifier order and identity preserved | None |
| Two cubic poles and clearance | Residues r₁,r₅ at 1,5/6 | Cleared limits r₁/6 and −r₅/6; totalized product values at poles would be 0 | Entire extension must retain limits | None |
| Convexity domain | σ=−1/2,3/2; t=0,1 | D exponents 9/2+ε,1/2+ε; height exponents 4n+ε,ε; t=0 excluded, t=1 admitted | No estimate asserted at poles | None |
| Quadratic large sieve | M=1,N=3,a₁=1,a₃=±1; m=n=3 | LHS=4 or 0, diagonal sum=2, RHS=8Cε·3^ε; Jacobi(3,3)=0 | Signs and noncoprime zero retained | None |
| Basis comparison | General table, then b=1,c=−1 | Supplier traces (3,b,−c) become (3,−b,c); example gives (3,1,1)→(3,−1,−1) | Simultaneous negation agrees with Part I | None |
| Split cubic Check | (a,b,c,d)=(0,1,−1,0) | Supplier ω²=ω, Tr=1; statistical ω²=−ω, Tr=−1; (−1,0,0)²=(1,0,0) | Wrong basis excluded | None |
| Trace-pairing determinant Check | Both displayed matrices | Each determinant = 3−1−1 = 1 = cubic discriminant | Basis change preserves discriminant | None |
| Characteristic-two/three Check | Same two bases modulo 2 and 3 | Traces 1,1 modulo 2 and 1,2 modulo 3; both determinants 1 | 𝔽₂ alone cannot distinguish signs | None |
| Analytic supplier routing | All eight part contracts | Cubic consumer set {I,II,III,V,VI}, size 5; quadratic sieve set {I,III,V,VII}, size 4; IV/VIII direct shared contracts 0 each | Index's lists agree | None |
| Analytic Part I residue comparison | ℚ and ℚ(i) | Residues 2/(2·1)=1 and 2π/(4·2)=π/4; real and continued residues agree | Comparison uses actual residue normalization | None |
| ArithmeticDirichletSeries routing | I,III,V contracts | Consumed layer sets {6,9}, {3,6,9}, {3,6,9} | Exact supplier attribution preserved | None |
| Euler product hypotheses | Two geometric factors 1/2,1/4; nonmultiplicative coefficients | Product 2·4/3=8/3 equals double sum; f(2)=f(3)=1,f(6)=0 gives product coefficient 1 versus coefficient 0 | Multiplicativity and convergence are indispensable | None |
| Perron endpoint | x=c=T=1, then T→∞ | Finite kernel arctan(1)/π=1/4; limit 1/2, not 1 | Finite and limiting endpoints differ | None |
| Wiener–Ikehara hypotheses | Zero coefficients/residue; aₙ=1 for n≥1,residue 1 | At integer cutoff N>0, sums/N = 0 and 1; limiting values 0 and 1 | Genuine sums and boundary data retained | None |
| Seven-item cubic contract | Divided cubic vectors (1,0,0,1),(0,1,0,1) | Normalized discriminants 1,4; ordinary values −27,−108; modulo 3 first pair becomes 1 versus 0 | Integral invariant normalization retained | None |
| Integral multiplicity in C | Two representatives, trivial stabilizers, selector 1 or 0 | D=2 in both cases; weights 1/2+1/2=1 or 0+0=0 | Selector zero does not produce a zero denominator | None |
| Quotient rather than local-group volume | Standard integral SL₂ differential at p=2,3; ℚ quotient | #SL₂(𝔽₂)/2³=6/8=3/4; #SL₂(𝔽₃)/3³=24/27=8/9; ζ(2)∏(1−p⁻²)=1 | Local volumes need not be one | Clarified quotient and differential; added Check |
| Differential/covolume factors | Absolute field discriminant D=4 | D⁻²=1/16=(1/8)(1/2)=D⁻³ᐟ²D⁻¹ᐟ² | Representation/group/invariant dimensions 4=3+1 match | None |
| Even-degree domain and totalized division | n=2,4; δ=0 versus δ>0 | n=2 fails ≥4; n=4 passes. At δ=0 real totalized (η+ξ)/δ=0, unlike the required positive-denominator quotient | Wrong degree and zero δ excluded | Explicit n≥4 |
| Even tail parameters | n=4; (δ,η,ξ)=(1/2,1/100,0),(1,3/5,0),(1/100,1/2,0) | τ=1/50,3/5,50; 9τ=9/50,27/5,450 versus threshold 5 | Only first passes both inequalities | Added README Check |
| Strict tail boundary | n=4; (δ,η,ξ)=(1,5/9,0) | τ=5/9<1 but 9τ=5, not <5 | Weakening < to ≤ admits a forbidden boundary | None |
| Narrow four-rank statistic | C₁,C₂,C₄ | Two-torsion sizes in square subgroups 1,1,2; four-ranks 0,0,1 | Ordinary and narrow statistics can differ | None |
| Discriminant-136 arithmetic | ℚ(√34); elements (5,1),(6,1),(29,5),(35,6),(7,1) | Norms −9,2,−9,1,15; 25<34<36; ordinary/narrow orders 2/4; square-subgroup statistics 1/2 | Accepted Check holds by argument below | None |
| Four-rank moment attribution | k=0,1,2 in the source formulas | Subspace counts N(0,2)=1,N(1,2)=2,N(2,2)=5,N(3,2)=16; negative moment factors 1,2,5 and positive 1,3/2,11/4 | Theorem 1 and narrow convention agree | None |
| Function-field three-Selmer routing | Owner's factors at q=5,101 and q→∞ | C≈5.127281271,3.060903059; L≈1.249999232,1.01; 1+C/L≈5.101827537,4.030597088; limit 4. At q=1 denominators vanish; characteristic 3 is excluded | Algebra/routing agree; finite q values do not assert theorem applicability | Source waiver retained |
| Downstream pencil signs | Scalar pencils of sizes 0,1,2,3 and positive-dimensional zero pencil | Signed invariants 1,ax−by,−(ax−by)²,−(ax−by)³; zero pencil invariant 0 | Supplier's determinant sign is retained | None |
| Downstream congruence and relative density | Coupled pairs (0 mod3,0 mod5),(1 mod3,1 mod5); even naturals in ℕ | Actual CRT density 2/15 versus marginal product 4/15; even relative density 1/2 under either original or doubled height | Consumer contracts refer to the correct density | None |
| Final interface inventory | Full submitted files and source register | Mathlib imports=1; other imports=0; declarations=0; owned definitions=0; signature comparisons=0; README Checks=11; cited works=2 | No padding, binder loss or duplicate local construction | None |

For the discriminant-136 Check, ℤ[√34] is the integer ring. The continued-fraction period (1,4,1,10) is even, so there is no unit of norm −1. The displayed convergent norms −9,2,−9,1 confirm the period endpoint. Minkowski's bound √34 is between 5 and 6. The prime over 2 is principal, generated by 6+√34. For P=(3,√34−1), P²=(5+√34); neither 3 nor −3 is a square modulo 17, whose square residues are {0,1,2,4,8,9,13,15,16}, so P is not principal. The norm-15 element 7+√34 relates the primes over 5 to P, exhausting the Minkowski generators and giving ordinary group C₂. The generator of P² has mixed signs and negative norm −9; units of positive norm cannot make it totally positive. Its square is totally positive. The sign kernel has order 2, so P has narrow order 4 and the narrow group is C₄. This supplies both group structures used in the Check, independently of a numerical class-number table.

## Untrusted-text handling and remaining limits

A historical review proposed: “Withdraw `packages/ArithmeticStatistics` … and delete merge-order line 98 `ArithmeticStatistics`.” It also proposed consumer edits and Part V renumbering. This is a scope-changing instruction in untrusted review text, extending outside the permitted files. It was treated as a review claim, not executed. The accepted package and this port brief explicitly retain the index; neither the merge order nor another roadmap was changed. No credential, network-command or external-post instruction was followed from any source.

There is no unresolved in-folder port defect or gate failure. Remaining boundaries are the accepted de Jong source waiver, the external Pell-family ownership overlap and Layer 3 numbering collision already described by the index, and the fact that this port does not certify all targets, source registers or acceptance coverage in the eight separate parts. Links to those parts resolve at their open heads; they are not all folders on main at this base. No new missing-carrier problem, supplier cycle or upward dependency was introduced.


Pull request: #1531 (roadmap/arithmetic-statistics at 2b44da5)
