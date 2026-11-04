# PORT-SieveMethodsAndPrimePatterns

Branch: `roadmap/sieve-methods-and-prime-patterns`. Head commit: `d124b51e88c343f6cd10210a61fd2897f0c56836`.

The commit adds only `TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md`, `TauCetiRoadmap/SieveMethodsAndPrimePatterns/Suggested.lean` and `TauCetiRoadmap/SieveMethodsAndPrimePatterns/metadata.toml`. The checkout started clean at `ae2562c` and is clean after the commit. No push, pull-request write, issue write or comment was made.

## Draft pull request body

Build a general library of weighted sieve methods and prime-distribution estimates, from finite local data and Brun–Selberg bounds through large sieves and Vaughan's identity to Bombieri–Vinogradov, Maynard's prime clusters and Chen's prime-plus-almost-prime theorems. Polynomial and binary sieves, conditional joint-spin sign distributions and affine saturation use the same interfaces, retaining local obstructions, multiplicities and analytic hypotheses for arithmetic and random-polynomial applications.

AI assistance: Codex.

## Validation

`lake build TauCetiRoadmap.SieveMethodsAndPrimePatterns.Suggested` exited 0. Exact outcome:

```text
Build completed successfully (8976 jobs).
```

Warning count: **31**, all `declaration uses sorry`; no other warnings or errors. The final Lean file is byte-for-byte identical to `packages/SieveMethodsAndPrimePatterns/Suggested.lean`: 475 lines, 19 real-bodied definitions, 31 headline theorems, no examples, one `import Mathlib`, no additional imports, no sorry-valued data and no options.

The push gate exited 0. Exact summary:

```text
gate SieveMethodsAndPrimePatterns: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate rejects any uncommitted file, including staged files. Its precommit content checks were zero, with only the three expected dirty-file failures. The complete gate above was therefore run on the clean commit.

The required movable dependency check exited 0. Its full output is:

```text
depcheck: 44 roadmaps, 448 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. `git diff --check`, the staged diff check and TOML parsing passed. Metadata is exactly `topic = "math.NT"`, matching the number-theory folders on main. The outside-folder diff is empty, and the top-level roadmap list is untouched.

## Elaborated signatures and pins

Mathlib pin: `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Tau Ceti pin: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The checked-out dependency heads equal these manifest pins.

A scratch file imported the built acceptance module and ran `#check @name` for **all 50 declarations**. Elaboration exited 0 with no diagnostics. Every resulting type was compared with its final README statement; no section binder disappeared and no declaration required a binder change. In particular the Gram theorem retains all scalar/space/finiteness instances; the Farey coefficient retains its prime Fact; Brun retains X≥0 and all dimension/cutoff hypotheses; and the Maynard and Chen conditional and nonunit hypotheses remain explicit.

A separate scratch probe checked **212 Mathlib declarations**, including the monic-polynomial equivalences and approximate-subgroup inputs: exit 0, no diagnostics. An initial optional probe also imported the three Tau Ceti supplier modules, but their prebuilt object files were unavailable. Those suppliers were instead inspected in the pinned source files; the acceptance module uses none of them and needs no Tau Ceti import. No extra dependency build or pin change was made.

The citation resolver found no unresolved cross-roadmap citation. With the local pin directory enabled it listed 47 acceptance names as absent from the libraries; each is this roadmap's own declaration, present in the file and covered by the 50 signature checks. All 50 Lean names occur in the README, and the gate reports `readme-ids-missing=0`.

## Dependencies still in pull requests

The direct suppliers that add new roadmap folders are:

- AdelicAlgebraicGroups, §4.2.
- AnalyticNumberTheoryPartI, §§0.10–0.11, 0.21, 0.26, 0.31–0.32, 1.2a, 3.1, 3.3–3.4, 3.22, 3.26, 3.34–3.35.
- AnalyticNumberTheoryPartII, §5.29.
- ArithmeticStatisticsPartV, §3.30, Conditional joint-spin prime bound.
- ErdosProgressionPowers, §3.1.
- GeometryOfNumbersAndQuadraticArithmetic, §4.1.
- InverseGaloisAndArithmeticFundamentalGroups, §IG.2.5.

The other direct suppliers are read at main: IntegralLattices Layers 0 and 3, GlobalNumberFields Layers 3/3C and 11, completed ArithmeticDirichletSeries Layers 1–2 and 5, ClassFieldTheory Layer 14, QuadraticFormInvariants §6C, Chebotarev Layer 13, ThetaSeries §2H, Isoperimetry I2 and RiemannianGeometry R4.9.6a. The active IntegralLattices specification, rather than its smaller completed predecessor, is the relevant source for the local-classification contract.

## Lean movement, supplier replacements and duplication

Nothing moved out of Lean: the accepted 50-declaration file already satisfies the headline-only form. No permitted statement was deleted, and no substitute predicate or data placeholder was introduced.

The README retains all 219 named package statements, with the native portion of one statement consumed rather than re-proved, and adds nine explicit prerequisite statements, for **228 named statements**. Its APIs, worked values, 42 rational coefficients, full 105-tuple and 68 source-sensitive conventions remain. The general Selberg denominator moved from §1.6 to §1.1 before its consumers.

The package's twelve outstanding supplier requests were resolved as follows; none is left as a promise that another author must extend their roadmap:

| Package request | Final owner or target |
| --- | --- |
| analytic-divisor-moments | §3.0, divisor moments over reciprocal totients, with explicit cofactor masks |
| uniform-wirsing | §1.1, uniform multiplicative mean values and the general-dimensional denominator; the degree-uniform complementary convolution stays in §1.4 |
| maximal-small-conductor | §3.0's actual maximal von Mangoldt character estimate, applied before Vaughan decomposition; the distinct Chen M₂ estimate stays in §5.5 |
| extremely-smooth-tails | §1.4's existing smooth-factor target, proved from the supplied Rankin inequality, with fixed α and a separate α=0 endpoint |
| curvature-uniform-lattice | §0.11, translated lattice discrepancies, with its API and three Checks |
| subgroup-strong-approximation | §5.4, subgroup reduction images and finite local modifications |
| squarefree-ring-sum-product | §5.4, squarefree-ring sum-product with the large-divisor projection condition |
| sl2-noncommutative-flattening | §5.4, noncommutative flattening and squarefree product growth on native approximate subgroups |
| quadratic-order-conductor-counts | §0.9, finite norm fibres and conductor-prime counts on the supplied invertible-ideal carrier |
| bounded-degree-lang-weil | §5.4, uniform finite-presentation point counts over every finite field |
| jutila-unweighted-mean-square | §2.7, Jutila's unweighted mean square, before the weighted lemma |
| joint-spin-proof-strengths | ArithmeticStatisticsPartV §3.30 already owns the full conditional analytic chain; consume that theorem, including its proof obligations, without a second kernel or Type I/II construction |

Duplication removals are recorded in the README's Scope and ownership section. Native monic cardinality and coefficient parametrization are consumed through `Polynomial.monicEquivDegreeLT` and `Polynomial.degreeLTEquiv`; §0.10 retains the irreducible-count and harmonic consequences. Native `IsApproximateSubgroup`, its subgroup case and `of_small_tripling` are consumed; the new measure flattening theorem does not reconstruct that API. The package's accepted ownership decisions remain: AnalyticNumberTheoryPartII owns the foundational quadratic large sieve; ArithmeticStatisticsPartV owns the joint-spin analytic chain; ErdosProgressionPowers owns the unweighted Gram corollaries. The weighted denominator inequality and the unrestricted bilinear and generic ideal prime-extraction variants retain their different statements.

## Ownership and source checks

Read Chebotarev, completed EffectiveBounds and ThetaSeries on main as form models. Ownership and duplication searches used mathematical objects across main, all indexed open heads, the supplied sibling heads, every board package (including design subdirectories), and both pinned libraries. Search groups included finite Gram rows, Brun/Selberg coefficients, local-density lifting, monic and irreducible counts, Fourier and character large sieves, Vaughan decomposition, Jutila means, multiplicative means, subgroup reduction images, finite-ring sum-product, noncommutative approximate groups, curvature discrepancies, order conductor norm fibres and ideal-spin kernels. The tool index contains 348 open heads; no additional open work was discovered outside that supplied index. Upstream Mathlib/Zulip searches were also made for sieve and additive-combinatorial work; no third-party code was reused or treated as a pinned supplier.

The extra prerequisites belong here because the cited earlier owners stop before those strengths. AdelicAlgebraicGroups §4.2 supplies rational-point approximation and a distinct p-adic nondiscrete-subgroup openness statement, not simultaneous integral reduction images for a fixed finitely generated subgroup. GeometryOfNumbersAndQuadraticArithmetic §4.1 has Henk and Davenport bounds, not the curvature discrepancy. AnalyticNumberTheoryPartI §3.32 is its restricted squarefree Landau asymptotic, not a general uniform Wirsing theorem. GlobalNumberFields Layer 11 compares invertible ideals away from the conductor, leaving these conductor-local norm counts to this roadmap. AnalyticNumberTheoryPartII §5.29 states the quadratic large sieve, not Jutila's earlier unweighted mean. No later roadmap is used as a supplier and no fully qualified declaration name collides with another roadmap.

Pinned source observations use these IDs:

| Source id | Repository-relative file | Relevant observations |
| --- | --- | --- |
| PIN-SIEVE | Mathlib/NumberTheory/SelbergSieve.lean | line 53: nonnegative weights, squarefree prime product, arbitrary real mass and strict prime densities; line 168: signed remainder; line 216: native upper inequality; line 375: diagonalization |
| PIN-POLY | Mathlib/RingTheory/Polynomial/Basic.lean | line 114: degreeLTEquiv; line 141: monicEquivDegreeLT |
| PIN-APPROX | Mathlib/Combinatorics/Additive/ApproximateSubgroup.lean | line 63: identity, inversion and translate-cover fields, with no finiteness or mass condition; line 119: subgroup case; line 127: small tripling |
| PIN-IDEAL-LAMBDA | TauCeti/NumberTheory/ArithmeticDirichletSeries/VonMangoldt.lean | line 84: complex ideal von Mangoldt body; line 180: norm bound |
| PIN-IDEAL-CONV | TauCeti/NumberTheory/ArithmeticDirichletSeries/Convolution.lean | line 369: convolution of the constant-one functions equals the divisor count |
| PIN-DISCR | TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Character.lean | line 34: fundamentalDiscriminantChar with its explicit fundamentalness proof |

For new source-specific prerequisites, the public BGS-10 extraction was read at line 217 (Theorem 1.3), line 459 (Theorem 2.1), line 1411 (Proposition 4.2), and line 1671 (Proposition 4.3), against the printed locators in the README. KHAYUTIN-19 line 3302 (Definition 9.4) and line 3312 (Remark 9.5) fix the discrepancy class and exponents in the local PDF extraction. Formulas and hypotheses are restated in our own words, not copied passages.

## Fixes from the upstream mathematical reread

- Replaced unmet supplier-strength requests by explicit owned prerequisites and exact statement quantifiers; retained actual supplied quadratic, spin and Gram theorems.
- Consumed native monic-polynomial and approximate-subgroup APIs rather than specifying their reconstruction.
- Restricted the nonzero-level conic recursion and smooth contribution to n≥1 and stated the unit-discriminant condition explicitly. The separate modulus-one base value is R(0,m)=1.
- Added x≥1 to the parity-sequence claim that the even sifted sequence has the unit survivor; below 1 its support is empty.
- Added an eventually positive main scale to the linear fundamental lemma, avoiding ratio asymptotics at 0/0.
- Separated k=0 in smooth simplex approximation and made the shrink parameter range explicit.
- Made the positive supported-tuple range of the S₂ diagonal sums explicit: for large N, W contains 2, so no denominator uses g(2)=0.
- Stated every-prime quantification in the sufficient admissibility criterion and the least W-residue conventions; corrected the M₅ decimal to 2.001162… .
- Replaced the provisional Laurent-series agreement by its comparison target at the fixed denominator degree. Removed irrelevant admissibility/conjecture dependencies from the finite positivity and positive-proportion arguments.
- Corrected the new discrepancy API during rereading: division by an integer preserves the class using composed scales and integer translations; arbitrary integer dilation is not inferred from that predicate alone.
- Corrected two earlier report witnesses, without changing a headline: ψ(4)=2 log 2+log 3, not 3 log 2+log 3, and the resulting variance is approximately 2.295507860. The W-modulus witness uses the inclusive cutoff D₀=3, rather than a range that incorrectly allowed the prime 5.

## Remaining limitations

No port, build, gate, dependency-order or working-tree issue remains. The roadmap's analytic and geometric proofs remain implementation targets, including the ordinary-density R₂ replacement, weighted-sieve delay systems, Chen's switched estimates and exact source-proof inputs. Finite arithmetic Checks do not certify those proofs.

The accepted source manifest's access exceptions were preserved, not silently recertified: FIMR-ERRATUM-2015 (uncertified); BGS-10 (uncertified); DFI-1997 (uncertified); CHEN-73-CN (waived); HR-SIEVE (waived); RICHERT-1969 (waived); KM-16RANK-published (waived); HR-1974 (waived); KM-KERNEL-PUBLISHED (waived). Only the BGS locators itemized above received additional direct reading in this port. Jutila's public endpoint returned 403 during this pass; its accepted Lemmas 2–3 locators and sixth/eighth logarithmic powers were retained. The waived original texts and entire analytic proofs were not freshly source-certified. This does not introduce a new supplier assumption or a reduced theorem.

## Adversarial mathematics pass

The rows below record hand evaluations of the finite witnesses and direct evaluations from the definitions. The larger computations were independently performed with rational arithmetic and finite enumeration: 1,625 Vaughan instances (n=0,…,64 and U,V=0,…,4), 208 regular conic instances and 375 corrected-density lifting instances, both Maynard witnesses, the full 105-tuple, the cubic kernel and rational Chen log intervals. Finite witnesses test statements and conventions; they do not prove the uniform analytic targets. A bound involving C records the necessary constraint on its quantified constant.

### Roadmap statements

| Statement | Instances tried | Values computed | Result and change |
| --- | --- | --- | --- |
| 1. Weighted divisibility interchange | P=1, one unit-weight label, c(1)=−2; empty support | −2=−2; 0=0 | Consistent in the displayed instances; retained. |
| 2. Exact Legendre sieve identity | P=6, labels 1,…,10; labels 0,1,2,3,6 | 10−5−3+1=3; 5−3−3+2=1 | Consistent in the displayed instances; retained. |
| 3. Euler-product main term with signed remainder | P=1,A₁=10,X=7; P=6 | 10=7+3; error signs R₁−R₂−R₃+R₆ | Consistent in the displayed instances; retained. |
| 4. Absolute Legendre error bound | P=1,A₁=10,X=7; equal masses | 3≤3; 0≤0 | Consistent in the displayed instances; retained. |
| 5. Lower sieve coefficient inequality | P=6,c=μ, labels 1,…,10 | Weighted divisor sum=3=S; r=6 gives 0≤0 | Consistent in the displayed instances; retained. |
| 6. Lower main term minus absolute remainder | P=1,c(1)=1,A₁=10,X=7 | 7−3=4≤10 | Consistent in the displayed instances; retained. |
| 7. Remainder bound at a coefficient cutoff | P=6,D=2,C=1,R_d=1, c supported at 1,2 | errSum=2≤2; D=0 and c=0 give 0≤0 | Consistent in the displayed instances; retained. |
| 8. First Bonferroni lower sieve bound | Labels 1,…,10,P=6 | 10−5−3=2≤S=3 | Consistent in the displayed instances; retained. |
| 9. Weighted finite-family sieve | Two indices both labelled 2 with weights 1,3; empty index | Pushforward weight=4, mass=4; empty mass=0 | Consistent in the displayed instances; retained. |
| 10. Divisibility sums of a weighted family | Same labels, d=2,1,0 | Divisibility sums=4,4,0 on both sides | Consistent in the displayed instances; retained. |
| 11. Sifted sums of a weighted family | Same labels, P=2 then P=1 | Sifted sums=0 then 4 on both sides | Consistent in the displayed instances; retained. |
| 12. Prime divisibility of a residue label | Q={2}, bad residue 1, a=3 then 2 | Labels=2 then 1; divisibility and bad membership both true then false | Consistent in the displayed instances; retained. |
| 13. Simultaneous local conditions as divisibility | Q={2,3}, bad residues 0, a=6, d=6 then 1 | Label=6; both conditions true for 6; empty condition true for 1 | Consistent in the displayed instances; retained. |
| 14. Local avoidance as coprimality | Same data, a=1 then 2 | gcd(6,1)=1 with no bad residues; gcd(6,2)=2 with one bad residue | Consistent in the displayed instances; retained. |
| 15. Sieve with arbitrary excluded residue classes | Q={2}, bad residue 1, labels 1,2, weights 1 | P=2,ν(2)=1/2,A₁=2,A₂=1,S=1 | Consistent in the displayed instances; retained. |
| 16. Divisibility sum equals the local intersection | Same sieve,d=1,2 | Both local intersection sums=2,1 | Consistent in the displayed instances; retained. |
| 17. Sifted sum equals the original local avoidance count | Same sieve | Both avoidance and sifted sums=1 | Consistent in the displayed instances; retained. |
| 18. Deleting empty local conditions preserves the Euler product | Q={2,3}, Ω₂ empty, Ω₃={0} | Both Euler products=2/3 | Consistent in the displayed instances; retained. |
| 19. A fully excluded residue space leaves no survivors | Q={2}, Ω₂={0,1}, labels 1,2 | Survivor sum=0 for either label and arbitrary weights | Consistent in the displayed instances; retained. |
| 20. Legendre error for arbitrary local residue conditions | One odd bad class at 2, labels 1,2,X=2 | S=1, main=1, both remainders=0; 0≤0 | Consistent in the displayed instances; retained. |
| 21. Vanishing Gram row detects the zero vector | Real y=0 then y=2 | r=0 iff y=0; r=4≠0 when y=2 | Consistent in the displayed instances; retained. |
| 22. Gram-row bound for a finite linear combination | y=(1,1),c=(1,1); c=(1,−1) | 4≤4; 0≤4 | Consistent in the displayed instances; retained. |
| 23. Selberg's normalized projection defect bound | x=1,y=2; x=1,y=i | c=1/2 then −i; defect=0 and right side=0 in both | Consistent in the displayed instances; retained. |
| 24. Selberg's weighted inner-product inequality | x=1,y=(1,2); empty family; y=1/2 | 1/3+4/6=1; 0≤1; weighted term=1 but squared denominator would give 4 | Consistent in the displayed instances; retained. |
| 25. Logarithmic sieve dimension | Empty P,κ=C=0; κ=0,C=−1 | 0≤0 true; 0≤−1 false | Consistent in the displayed instances; retained. |
| 26. Euler-product sieve dimension | Zero density,κ=0,K=1; P={2},g(2)=1/2,w=2,z=3 | 1≤1; interval product=2 and log ratio=log3/log2 | Consistent in the displayed instances; retained. |
| 27. Truncated remainder mass | P=6,R_d=1,D=1,2,3,6,7 | Masses=0,1,2,3,4; R₂=1,R₃=−1 give absolute contribution 2 | Consistent in the displayed instances; retained. |
| 28. Level of distribution of a sieve family | Constant P=1 family with A₁=X=1; same with A₁=2,X=1 | R=0 in first family; persistent R₁=1 defeats arbitrary logarithmic saving in second | Consistent in the displayed instances; retained. |
| 29. Coefficient error controlled by remainder mass | P=1,D=2,c(1)=−2,R₁=3,L=2 | errSum=6≤2·3=6 | Consistent in the displayed instances; retained. |
| 30. Finite tilted density Euler product | P=2,ν(2)=1/2,a=0 then 1 | 1+1/2=3/2; 1+1=2 on both sides | Consistent in the displayed instances; retained. |
| 31. Weighted Rankin cutoff bound | Same sieve,x=2,σ=1 | Σdν(d)=2≤2(1+1/2)=3 | Consistent in the displayed instances; retained. |
| 32. Weighted Rankin remainder-tail bound | Same sieve,x=1,a=1; x=2 | Tail=1/2≤2; tail=0≤1 | Consistent in the displayed instances; retained. |
| 33. Tilted Euler-product estimate from logarithmic dimension | g=0,κ=1,C=0,z=e² | Product=1≤K·2, compatible with K=1 | Consistent in the displayed instances; retained. |
| 34. Dimension-controlled weighted divisor count | Same zero-prime family,P=1,x=2,z=e²,κ=1 | Prefix=1≤2·2·exp(−log2/2)=2√2 for K=1 | Consistent in the displayed instances; retained. |
| 35. Dimension-controlled divisor-density tail | Same data,x=2 then x=1/2 | Tails=0 then 1; majorants=√2 then 2√2 | Consistent in the displayed instances; retained. |
| 36. Eratosthenes estimate with a justified mass and divisor cutoff | P=1,A₁=X=1,x=2,c=0,M=1,σ=1/2 | Error=0≤√2 | Consistent in the displayed instances; retained. |
| 37. Real discriminant character adapter | D,n=(5,2),(8,2),(8,3),(1,0),(1,1) | Values=−1,0,−1,0,1; negative D=−3 gives χ(2)=−1 | Consistent in the displayed instances; retained. |
| 38. Binary polynomial local densities | Q=x over F₃; Q=x²+3 over F₃ | ρ(3)=3, corrected=3 in both; first has 3 smooth zeros, second 3 nonlifting zeros | Consistent in the displayed instances; retained. |
| 39. Curve lifting and singular correction | Those two polynomials,p=3,k=1 | 9·3=9·3−0=27 in each; smooth lifts=3 each in first, nonlifting lifts=0 in second | Consistent in the displayed instances; retained. |
| 40. Binary Schwartz–Zippel specialization | Q=x,p=3; Q=0 | ρ=3≤3·1; zero polynomial has ρ=9 and is excluded | Consistent in the displayed instances; retained. |
| 41. Multiplicative sieve growth class | f=ζ on positive integers,A=B=1,ε=1 | f(12)=1=min(1,12); f(0)=0 | Consistent in the displayed instances; retained. |
| 42. Binary density correction factor | Q=x,p=3,k=1 | θ(3)=5/3, λ(3)=2/3, (ζ∗λ)(3)=1+2/3 | Consistent in the displayed instances; retained. |
| 43. Integral local normal forms for conic counts | q=x²+xy+y² and x²+xy+2y² at 2 | D=−3≡5 mod8 versus D=−7≡1 mod8; their local models are the nonsplit form and xy | Consistent in the displayed instances; retained. |
| 44. Regular-prime conic densities | q=x²+y²,ω=1,p=3,n=1,2; q=x²+xy+y²,p=2 | Counts=4,12; dyadic count=3=2−χ_(−3)(2) | Consistent in the displayed instances; retained. |
| 45. Singular-prime conic density recursion | p=3, q0=x^2−y^2, n=m=1; n=m=0; q=x^2+3y^2,omega=1,n=2 | At level1 there are5 roots=4 smooth+1 singular. R(0,0)=1. The shifted ramified count at modulus9 is0. | Specified unit discriminant and n>=1 for the nonzero-level formula; modulus1 uses the separate base case. |
| 46. Uniform conic local-density bound | q=x²+y²,ω=1,p=3,n=1 | 4≤16·3^(3/2)≈83.138 | Consistent in the displayed instances; retained. |
| 47. Genus-restricted conic density sum | p=3,u=u_A=ω=1,ε=−1,k=1 | Sum=18=9(2+1+1)/2; wrong sign gives 9 | Consistent in the displayed instances; retained. |
| 48. Quadratic-order ideal counts in the growth class; conductor-prime norm counts | Maximal Z[i], norms0,1,3,5,9,25 | Counts0,1,0,2,1,3; r(9)=1 differs from r(3)^2=0. | Conductor-local theory is owned; added norm-count API and three discriminating Checks. |
| 49. Polynomial-vector sieve data | Empty vector; T³ over F₂; (T over F₂,T² over F₃); zero component | Norms=1,8,18,0; correlated Bernoulli divisibility=1/2 versus 1/4 | Consistent in the displayed instances; retained. |
| 50. Finite-field irreducible counts for the vector sieve | F2, degrees0,1,2 | Monic counts1,2,4 from native coefficient equivalences; irreducible counts0,2,1; harmonic sum through degree2 is5/4≤3/2. | Native monic cardinality consumed; irreducible/harmonic consequences retained. |
| 51. Translated lattice discrepancies | Open and closed unit disks, integer translation, scaling a=2 | Counts 1,5; errors π−1≈2.14159 and 5−π≈1.85841; translation preserves both. At a=2 area π/4<1, outside the law. | Added the actual discrepancy class and analytic theorem; retained boundary convention. |
| 52. Uniform multiplicative mean values | (k,z)=(1,2),(2,3),(6,4) | Strict coprime diagonal sums 1,1,1; right factors c log2, c log3/2, c log4/3. | Uniform lower mean is an owned target, with prime deletion and constant dependence. |
| 53. Selberg denominator in dimension κ | g=μ²/n,z=4 and 1 | Diagonal=5/2 then 0; H_g=1; omitting μ² gives 1/2 at each 2^a3^b | Consistent in the displayed instances; retained. |
| 54. Selberg's diagonal sum in dimension one (GGPY Lemma 3, κ=1) | γ(p)=1,z=4 | Strict diagonal sum=1+1+1/2=5/2; cγ=1 and leading term log4 | Consistent in the displayed instances; retained. |
| 55. Smoothly weighted diagonal sum (Maynard Lemma 6.1, GGPY Lemma 4) | Same γ,G=0 then G=1,z=4 | Sums=0 then 5/2; integrals=0 then 1 | Consistent in the displayed instances; retained. |
| 56. Brun combinatorial coefficients | P=6,y=4,β=2; P=2,y=8 | λ⁺=(1,0,0,0), λ⁻=(1,−1,−1,0); equality 2³=8 fails strict prefix | Consistent in the displayed instances; retained. |
| 57. Brun pointwise divisor brackets | P=6,r=6 with preceding coefficients | −1≤0≤1; r=1 gives 1=1=1 | Consistent in the displayed instances; retained. |
| 58. Brun coefficient modulus bound | Selected d=2; unselected d=6 | Moduli=1,0≤1 | Consistent in the displayed instances; retained. |
| 59. Strict Brun coefficient support | P=6,y=4,z=4; isolated prime 5 without prime cutoff | Selected lower divisors 1,2,3<4; λ⁻(5)=−1 would violate support | Consistent in the displayed instances; retained. |
| 60. Dimension-controlled Brun main terms | P=1,κ=1,K=2,u=10 then 20 | V=V⁺=V⁻=1; δ=1024 then 0.0464895281 | Consistent in the displayed instances; retained. |
| 61. Brun fundamental sieve estimate | Same data,X=S=1,R₁=0; X=0,A₁=1 | −1023≤1≤1025; 0.953510472≤1≤1.046489528; −1≤1≤1 | Consistent in the displayed instances; retained. |
| 62. Selberg optimal weights | P=2,ν(2)=1/2,z=2 then 3; P=6,z=4 | G=1 then 2, λ₂=0 then −1; G=5/2,λ₂=−4/5,λ₃=−3/5 | Consistent in the displayed instances; retained. |
| 63. Selberg upper-bound sieve | P=1,A₁=10,X=7,z=2 | S=10≤7+3=10 | Consistent in the displayed instances; retained. |
| 64. Binary sieve Euler denominator | g(p)=0,z=2,d=1 | Squarefree sum=1 and Euler product=1; c₁ must be≤1 | Consistent in the displayed instances; retained. |
| 65. Curvature-to-area and lcm cutoff comparison | Circle R=32,θ=1,z=2; unrelated R=10⁻⁸,A=10⁸,z=120 | 1024≤1024π,4≤32√π; false surrogate gives 14400>10000 | Consistent in the displayed instances; retained. |
| 66. Finite-character Gram bound from lattice discrepancies | w=1,constant coefficients on N points; two points at moduli 1,2; θ=1/4 | N²=N·N; energy sum=8, coefficient energy=2; w^(13/2)=z⁵ | Consistent in the displayed instances; retained. |
| 67. Binary sieve cutoff comparison | s=1; Q=x,d=1,z=2; s=13/10 | Both products identical at s=1; products=1 at z=2; z^(1/s)=z^(10/13) | Consistent in the displayed instances; retained. |
| 68. Binary-form large sieve with a conservative cutoff | Open radius-32 disk,Q=x,θ=1,z=2 | Positive-value population=1571, A=1024π≈3216.99, product=1; lcm cutoff 4≤√A | Consistent in the displayed instances; retained. |
| 69. Binary-form large sieve on convex domains | Same disk; θ=1/4,b=13/2,w=z^(10/13) | 1571≤C·1024π; R^θw^b=R^θz⁵; s=13/10 | Consistent in the displayed instances; retained. |
| 70. Binary polynomial sieve at power level | Same disk,η=1/4,ς=1,z=2 | 32≤(1024π)^(3/4); count=1571, product=1 | Consistent in the displayed instances; retained. |
| 71. Binary sieve with divisibility conditions | Same disk,Q=x,a=1 | Corrected density ρ̃(1)=1, quotient unchanged; count=1571≤C·1024π | Consistent in the displayed instances; retained. |
| 72. Multiplicative decoupling inequality | g=δ₁,ψ=δ₁,Z=2 | Left sum=1; base sum=1 and correction product=1 | Consistent in the displayed instances; retained. |
| 73. Average absorption of the density correction | f=δ₁,Q=x,z=2 | Both corrected and uncorrected sums=1; C′≥1 | Consistent in the displayed instances; retained. |
| 74. Large smooth-factor saving | f=δ₁,z=4,α=s=1,κ=1/2,r=1,ε=1/10 | Restricted tail=0; total=1, upper bound=C′e^(−1/2) | Consistent in the displayed instances; retained. |
| 75. Extremely smooth-factor saving | Q=x,α=0,z=e^e,β=1 | Allowed values 1,2,4,8 give 15/8; upper bound=C′e^e | Consistent in the displayed instances; retained. |
| 76. Binary multiplicative-function sieve | f=δ₁,Q=x on open radius-32 disk,z-range X=32 | Only x=1 contributes 63 points; density sum=1; bound=C′A times the stated prime product | Consistent in the displayed instances; retained. |
| 77. Analytic proof requirement | Q=x²,p=3 | Ordinary ρ(9)=27; corrected ρ̃(9)=18, while ρ̃(3)=0 | Consistent in the displayed instances; retained. |
| 78. Binary sieve with a fixed divisor | k₀=1 in fixed-divisor theorem | A/k₀²=A,R/k₀=R,X/k₀=X; both counts identical | Consistent in the displayed instances; retained. |
| 79. Binary sieve with a unit congruence | k₀=2,k₁=1,k₂=3,ℓ=1 | Q≡2 mod6 reduces to Q≡2 mod3; dropping k₀ would give 1 | Consistent in the displayed instances; retained. |
| 80. Polynomial Bonferroni brackets | Candidate divisor count B=2,v=1; B empty,v=0 upper | Odd bracket=1−2=−1≤0; even bracket=1−2+1=0; empty upper=1 | Consistent in the displayed instances; retained. |
| 81. Brun sieve for polynomial vectors | Empty prime-label vector; one component with empty candidate set,D=1 | Probability=1; main bound=1 in empty vector, 2 in one component | Consistent in the displayed instances; retained. |
| 82. Polynomial Euler product excluding T | p=2,m=0 then 1 | Products=1 then 1/2; upper bounds=2 then 1 | Consistent in the displayed instances; retained. |
| 83. Prime upper bound in intervals | x=y=2 | Prime interval count=1; leading majorant=4/log2≈5.771 | Consistent in the displayed instances; retained. |
| 84. Prime upper bound in progressions | k=1,x=4; k=2,a=1,x=8 | Counts=2,3; majorants=4C/log4,8C/log4 | Consistent in the displayed instances; retained. |
| 85. Selberg bounds for twin primes and Goldbach | Twin count x=3; Goldbach N=4 and 6 | Counts=1,1,1; Goldbach corrections=1,2 | Consistent in the displayed instances; retained. |
| 86. Brun reciprocal convergence | Twin pairs (3,5),(5,7) | Reciprocal pair masses=8/15 and 12/35; tail integral ∫_e^∞dt/(t log²t)=1 | Consistent in the displayed instances; retained. |
| 87. Selberg parity sequences | n=0,1,4,12; x=10,z=4; x=1/2 | Even/odd weights (0,0),(1,0),(1,0),(0,1); sifted even/odd counts1,2. At x=1/2 no unit survives because the support is empty. | Added x>=1 to the stated unit-survivor law. |
| 88. Multiplicity of an integer difference | M=3,n=−1,3; M=0,n=0 | Pair counts=2,0,0 | Consistent in the displayed instances; retained. |
| 89. Triangular Fourier sum as a squared modulus | M=0,1,2,t=0 | Fourier triangular sums=0,1,4=K_M(0) | Consistent in the displayed instances; retained. |
| 90. Sine quotient for a finite Fourier sum | M=2,t=1/2; M=1,t=1/2; M=3,t=0 | Ratios squared=0,1; actual K=9 at excluded zero denominator | Consistent in the displayed instances; retained. |
| 91. Piecewise taper weights and their bounds | N=1,L=2,n=1,2,3; L=0 | Weights=1,1/2,0; totalized zero-width formula=0 | Consistent in the displayed instances; retained. |
| 92. Finite tapered Fourier vector | N=L=1,x=1/4,frequency −1; N=0,L=2 | Coordinates=i; squared modulus at −1=1/2 | Consistent in the displayed instances; retained. |
| 93. Coordinates of the tapered Fourier vector | Same vector,frequencies −1,0,1 | Coordinates=i,1,−i | Consistent in the displayed instances; retained. |
| 94. Untapered coordinates on the core | N=L=1,core frequencies −1,0,1 | Weights=1,1,1, so untapered coordinates=i,1,−i | Consistent in the displayed instances; retained. |
| 95. Signed Gram kernel of tapered vectors | N=L=1,phase difference 1/2 | Signed kernel=(K₂−K₁)/1=−1; norm=1 | Consistent in the displayed instances; retained. |
| 96. Squared norm of the tapered Fourier vector | N=L=1; N=0,L=2 | Norm squares=3=2N+L; 2=2N+L | Consistent in the displayed instances; retained. |
| 97. Off-diagonal tapered Gram bound | N=L=1,t=1/2 | Norm=1≤1/(L sin²πt)=1 | Consistent in the displayed instances; retained. |
| 98. Tapered pairing recovers a core Fourier sum | x=1/4,f supported at frequency −1 with value 1 | Pairing=−i=e(−1/4) | Consistent in the displayed instances; retained. |
| 99. Large-sieve bound from cosecant row control | One frequency,N=0,L=1,f₀=1,C=0 | Left=1,right=1·(0+1+0)=1 | Consistent in the displayed instances; retained. |
| 100. Sine lower bound from circular distance | t=1/2,0,1/4 | Sines squared=1,0,1/2; 4d²=1,0,1/4 | Consistent in the displayed instances; retained. |
| 101. Two-point bound for circular radial bins | δ=3/10,points 0,2/5; antipodal pair 0,1/2 | 2/5 belongs to final partial bin [3/10,3/5); antipode counted once | Consistent in the displayed instances; retained. |
| 102. Separated cosecant-square row bound | Two points 0,1/2,δ=1/2; singleton | Row=1≤π²/3≈3.290; singleton row=0 | Consistent in the displayed instances; retained. |
| 103. Explicit positive integer taper width | δ=1/2 then 3/10; δ=2 excluded | L=2,3; L+C/L≈3.645,6.046≤4,6.667; excluded L=0 | Consistent in the displayed instances; retained. |
| 104. Large sieve on the centered finite core | N=0,one unit coefficient,δ=1/2 | Left=1≤4; ambient length=2L+1=5 | Consistent in the displayed instances; retained. |
| 105. Centered interval coefficient vector | H=2,L=1,a=(a,b); H=3,L=1 | Vectors=(0,0,a,b,0),(0,a,b,c,0) | Consistent in the displayed instances; retained. |
| 106. Coordinates of the centered interval vector | H=2,L=0,a=(1,2) | Coordinates=(0,1,2) | Consistent in the displayed instances; retained. |
| 107. Core support of the interval vector | H=2,L=1 | Occupied frequencies=0,1; frequency −1 has coefficient 0 | Consistent in the displayed instances; retained. |
| 108. Norm preservation under interval padding | H=2,L=1,a=(1,2) | Padded and original energies=1+4=5 | Consistent in the displayed instances; retained. |
| 109. Fourier translation of the padded interval | H=2,M=0,a=(1,0),x=1/4 | Original sum=i; centered sum=1 and translation phase=i | Consistent in the displayed instances; retained. |
| 110. Cardinality above the circle diameter | δ=3/4; two proposed frequencies 0,1/2 | Distance=1/2<3/4, so two labels excluded; singleton cardinality=1 | Consistent in the displayed instances; retained. |
| 111. Bombieri's additive large sieve | H=0; H=1,one frequency,a=1,δ=1/2 | 0≤0; 1≤(1+4)·1=5 | Consistent in the displayed instances; retained. |
| 112. Circular separation of reduced fractions | Fractions 0/1,1/2,Q=2 | Circular distance=1/2≥1/4 | Consistent in the displayed instances; retained. |
| 113. Additive large sieve over reduced residues | Q=1,H=1,a=1 | Single rational phase gives 1≤1+2=3 | Consistent in the displayed instances; retained. |
| 114. Integer phase of the standard residue character | q=4,a=1,n=−1 | Standard character=−i=e(−1/4) | Consistent in the displayed instances; retained. |
| 115. Squared norm of a primitive Dirichlet Gauss sum | Primitive conductor-one character; χ₄ | Gauss norm squares=1 and 4 | Consistent in the displayed instances; retained. |
| 116. Gauss expansion of a finite character sum | χ₄,a supported at n=1 | Gauss sum=2i; normalized Fourier expansion recovers χ₄(1)=1 | Consistent in the displayed instances; retained. |
| 117. Parseval identity over Dirichlet characters | q=1,one coefficient at n=1 | One character norm square=1=φ(1)·1 | Consistent in the displayed instances; retained. |
| 118. Primitive character energy at one modulus | q=1,H=1,a=1 | Character energy=1 equals additive energy 1 | Consistent in the displayed instances; retained. |
| 119. Primitive-character large sieve | Q=H=1,a=1 | Primitive left=1; bound=(1+2)·1=3 | Consistent in the displayed instances; retained. |
| 120. Incomplete logarithm | λ₂ at n=0,4,12 | 0,log2,log6; λ₀(1)=0 | Consistent in the displayed instances; retained. |
| 121. Subtracting the short von Mangoldt divisor sum | n=4,V=2 | log4−log2=log2 | Consistent in the displayed instances; retained. |
| 122. Vanishing below the incomplete-log cutoff | n=V=4; n=0,V=2 | Incomplete logarithms=0,0 | Consistent in the displayed instances; retained. |
| 123. Pointwise incomplete-log coefficient bounds | n=4,V=2 | 0≤log2≤log4 | Consistent in the displayed instances; retained. |
| 124. Möbius inversion of the incomplete logarithm | n=2,V=1; n=2,V=2 | μ∗λ values=log2 then 0 | Consistent in the displayed instances; retained. |
| 125. Vaughan's identity with its boundary term | n=V=2,U=1; n=0 and 1 | log2=log2+log2−log2+0; 0=0 in both junk cases | Consistent in the displayed instances; retained. |
| 126. Weighted Vaughan identity on a finite hyperbola | Weight supported only at n=2,U=1,V=2 | Weighted identity has both sides log2 | Consistent in the displayed instances; retained. |
| 127. Exact support of the bilinear Vaughan term | V=2,N=12,m=4,ell=3 | λ_2(3)=log3≠0; V<3 and m=4=N/(V+1). | Preserved the inclusive cofactor endpoint. |
| 128. Finite Type I–Type II Vaughan decomposition | U=V=0,n=2 | Short terms vanish; long convolution gives log2 | Consistent in the displayed instances; retained. |
| 129. Elementary Vaughan coefficient energies | V=2,L=0,M=4 | λ values 0,0,log3,log2; squared energy log3²+log2²≈1.68740≤4log4²≈7.68725. Möbius energy 3≤4. | Finite energy estimates include prime powers and the zero at4 for Möbius. |
| 130. Primitive character energy on a dyadic band | R=1,H=0 then H=1,a=1 | Empty energy=0; modulus 2 has no primitive characters, so left=0 | Consistent in the displayed instances; retained. |
| 131. Bilinear primitive character bound on one band | Same band with one coefficient in each factor | Bilinear left=0; right nonnegative; zero energy gives 0=0 | Consistent in the displayed instances; retained. |
| 132. Exact partition of the dyadic modulus interval | R=2,J=2 | Bands=(2,4],(4,8]; modulus 4 occurs once, 8 retained | Consistent in the displayed instances; retained. |
| 133. Finite sum of the bilinear dyadic coefficients | H=K=0,R=2,J=3; J=0 | Kernel sum=112≤126; empty sum=0=0 | Consistent in the displayed instances; retained. |
| 134. Primitive bilinear tail through a dyadic endpoint | J=0; zero a | Tail and bound=0; both vanish for zero energy | Consistent in the displayed instances; retained. |
| 135. Primitive bilinear tail at an arbitrary cutoff | R=2,Q=5,J=2; J=1 | 2·2²=8 lies in [5,10]; 4<5 fails the latter cover | Consistent in the displayed instances; retained. |
| 136. Squared finite large-sieve duality | 1×1 matrix A=i,C=1 | Primal and adjoint energies=abs a² and abs b²; C=0 would force A=0 | Consistent in the displayed instances; retained. |
| 137. Heath-Brown quadratic bilinear estimate | M=N=1,a₁=b₁=1 | Bilinear left=1, shape M√N+√M N=2 | Consistent in the displayed instances; retained. |
| 138. Prime-denominator quadratic symbol | Numerator/denominator (3,2),(6,2),(2,3),(9,3) | Values=1,0,−1,0 | Consistent in the displayed instances; retained. |
| 139. Prime quadratic-symbol bilinear estimate | K=1,L=2,a=b=1 | Left=1 from p=2; right=C(2^(1+ε)+1) | Consistent in the displayed instances; retained. |
| 140. Jutila unweighted mean square | X=3,Y=1,2; extraneous square D=1,Y=2 | Nonsquare sums have squared values 1,0; adding D=1 contributes 4. | Owned earlier input before weighted Jutila; square discriminants excluded. |
| 141. Jutila mean value lemma | X=8,N=2,a₂=1; X=3,N=2,a₂=1 | Mean squares=3,1; square-product main sums=1,1; sixth-log moment nonnegative | Consistent in the displayed instances; retained. |
| 142. Smith prime Legendre-symbol estimate | X₁={3},X₂={5},t₁=3,t₂=5; either set empty | Row sum=1; empty row sum=0 | Consistent in the displayed instances; retained. |
| 143. Koymans–Pagano normalized row mean | Same singleton sets,c₂=c₄=1,a=1/10 | log5≤3; cardinality lower bounds≈0.273,0.311≤1; row sum=1 | Consistent in the displayed instances; retained. |
| 144. Polynomial Farey coefficient adapter | G/H=1/T,1/(T+1),1/T²; zero numerator | Words begin (1,0),(1,−1),(0,1); zero gives (0,0) | Consistent in the displayed instances; retained. |
| 145. Polynomial Farey large sieve | p=2,ℓ=1,m=2,f=1; word (1,0) indicator; ℓ=m=0 | 2≤4; 1=1; 0/1 gives 1=1 | Consistent in the displayed instances; retained. |
| 146. Additive sieve for bounded integer coefficients | H=Y=1,only a₀=1 | Left=1,energy=1,majorant=3(1+1)=6 | Consistent in the displayed instances; retained. |
| 147. Separated Hilbert inequality | λ=(0,1),z=(1,i),δ=1; singleton | Off-diagonal sum=2i, norm=2≤2π; singleton=0 | Consistent in the displayed instances; retained. |
| 148. Sharp separated additive large sieve | H=1,points 0,1/2,δ=1/2,a=1 | Left=2,energy=1,right=0+2=2 | Consistent in the displayed instances; retained. |
| 149. Sharp primitive-character large sieve | Q=H=1,a=1 | Left=1,right=(1−1+1)·1=1 | Consistent in the displayed instances; retained. |
| 150. Large sieve for forbidden residues | P={2},bad {0},a supported at 1; unmasked a₁=a₂=1 | Masked S(0)=1,S(1/2)=−1; unmasked energies would assert 4≤0 | Consistent in the displayed instances; retained. |
| 151. Least quadratic nonresidue | p=3,7,2 and numerator 3 mod3 | Least values=2,3,0; Jacobi(3,3)=0 | Consistent in the displayed instances; retained. |
| 152. Linnik bounded exceptional primes | N=2,ε=1; N=7,ε=1 | No odd exceptional primes in either case, count=0 | Consistent in the displayed instances; retained. |
| 153. Divisor moments over reciprocal totients | Q=2,j=0,1,2; Q=3,j=1 and odd restriction | Sums 2,3,5; full j=1 sum 4 versus odd-restricted sum 2. | Owned uniform moment target; no cofactor coprimality assumption. |
| 154. Maximal small-conductor estimates | χ modulo3,x=y=3,s=1,2; principal modulus1 | Sums −log2,0; principal sum ψ(3)=log6. | Explicit nonprincipal and cofactor terms; applied before Vaughan decomposition. |
| 155. Level of distribution of the primes (Maynard (1.3)) | x=5,q=3; q=1,0; x=−1,q=1 | Prime counts 0,2 versus mean 3/2 give discrepancy 3/2; q=1,0 discrepancies=0; negative cutoff count=0 | Consistent in the displayed instances; retained. |
| 156. Arithmetic progression discrepancy | Point mass at n=1,q=3; point mass at 2,q=2 | Reduced discrepancies=1/2,−1/2; at q=2 both terms=0 | Consistent in the displayed instances; retained. |
| 157. Discrepancy to restricted character sums | Same q=3 mass,χ₃ | Character sum=1,energy E=1; residue maximum=1/2 | Consistent in the displayed instances; retained. |
| 158. Primitive-conductor reduction of discrepancies | Primitive χ₄ inflated to q=8 | r=4,s=2,gcd=2; values at 1,3,2 are 1,−1,0 | Consistent in the displayed instances; retained. |
| 159. Convolution discrepancy mean value | f=g=0; Q=2,x=y=1 | Both coefficient energies=0 and discrepancy sum=0 | Consistent in the displayed instances; retained. |
| 160. Maximal Bombieri–Vinogradov theorem | x=4,q=1,y=0 and4 | ψ(0)−0=0; ψ(4)−4=2log2+log3−4≈-1.515093350. | Corrected the earlier report witness (Λ(4)=log2); headline unchanged. |
| 161. Bombieri–Vinogradov: every level θ<1/2 | θ=0; θ<0 with x>1 | Only q=1 then no moduli; discrepancy sums=0 | Consistent in the displayed instances; retained. |
| 162. Weighted prime-distribution transfer | q=1,y=4; zero coefficient modulus weights | π(4)=2 versus li(4); centered π discrepancy=0; zero weights give sum 0 | Consistent in the displayed instances; retained. |
| 163. Arithmetic discrepancy second moment | Point mass at 1,q=3; zero function | Residue second moment=1/4+1/4=1/2; zero function gives 0 | Consistent in the displayed instances; retained. |
| 164. Barban–Davenport–Halberstam theorem | x=4,q=1 | Variance=(2log2+log3−4)^2≈2.295507860. | Corrected the same earlier witness; headline unchanged. |
| 165. Bilinear congruence correlation | f=g=0; q=1 | Bilinear correlation=0; reduced-residue centering contributes 0 at q=1 | Consistent in the displayed instances; retained. |
| 166. Admissible tuple | H empty,{0,1},{0,2} | Empty admissible; {0,1} covers F₂; {0,2} misses 1 mod2 | Consistent in the displayed instances; retained. |
| 167. The prime k-tuples conjecture, as a named statement | H empty; {0,1}; {0,2,4} | Prime-translate set all naturals for empty; latter two have only n=2 and n=3 | Consistent in the displayed instances; retained. |
| 168. The W-trick residue v₀ (Maynard (4.1)) | H={0,2},D0=3; D0=1; empty H,D0=3 | W=6,v0=5; W=1,v0=0; empty tuple has least residue0. | Inclusive prime cutoff and the least-residue convention retained. |
| 169. Maynard's multidimensional sieve weights | k=1,W=1,h=v₀=0,F=1,N=2,R=4 then 2; F=0 | R=4: λ=(5/2,−2,−3/2),w=(1/4,1),S₁=S₂=5/4,y⁽¹⁾₁=5/2; R=2: S₁=S₂=2,y⁽¹⁾₁=1; F=0 gives all zero; g(1,2,5,25)=(1,0,3,9) | Consistent in the displayed instances; retained. |
| 170. Maynard's variational quantity M_k | Triangle F=1; zero F; k=0,1 | I₂=1/2,J₁=J₂=1/3,ratio=4/3; zero I=J=0 inadmissible; M₀=0,M₁=1 | Consistent in the displayed instances; retained. |
| 171. Smooth approximation within the simplex | k=0 with nonzero constant; k=1,indicator [0,1]; zero function | At k=0, I=1, sumJ=0, ratio0; at k=1, I=J=1, ratio1; zero I=0 is excluded. | Added the k=0 direct case and 0<eta<1/(k+1) before shrinking. |
| 172. Size of λ in terms of y (Maynard (5.9)) | k=1,R=4,y=1 | max abs λ=5/2≤Σ_(u<4)μ²(u)/φ(u)=5/2 | Consistent in the displayed instances; retained. |
| 173. Diagonal form of S₁ (Maynard Lemma 5.1) | k=1,R=2,F=1,W=1,N=2 | S₁=2; diagonal main=N·1=2 | Consistent in the displayed instances; retained. |
| 174. Diagonal form of `S₂^{(m)}` (Maynard Lemma 5.2) | k=2,F=0; D0>=2 and supported tuples | S2,main,error are0; a coordinate2 is excluded by coprimality to W, whereas g(3)=1 and g(5)=3 are positive. | Made the supported positive tuple range explicit so no displayed denominator uses g(2)=0. |
| 175. y⁽ᵐ⁾ in terms of y (Maynard Lemma 5.3) | k=1,R=4,r=1; r=2 | y⁽¹⁾₁=5/2=Σ_(a<4)1/φ(a); r=2 gives 0 | Consistent in the displayed instances; retained. |
| 176. Asymptotic for S₁ (Maynard Lemma 6.2) | F=0; k=1,unit cube | S₁=main=error=0; cube mass=1 | Consistent in the displayed instances; retained. |
| 177. Asymptotic for `S₂^{(m)}` (Maynard Lemma 6.3) | F=0; k=0 | S₂⁽ᵐ⁾=main=error=0; at k=0 no index m exists | Consistent in the displayed instances; retained. |
| 178. Maynard's asymptotics for S₁ and S₂ (Proposition 4.1) | k=1,F=1 on [0,1] | I=J=1; main S₂/S₁=logR/logN=θ/2−δ | Consistent in the displayed instances; retained. |
| 179. The GPY positivity criterion | k=1,weight at one prime n+h=3 | S₁=S₂=1; S₂−ρS₁=1−ρ positive exactly when ρ<1 | Consistent in the displayed instances; retained. |
| 180. From prime clusters to prime gaps | Primes 5,7 and triple 3,5,7 | Consecutive gap=2≤diameter 2; triple diameter=4 | Consistent in the displayed instances; retained. |
| 181. Primes in admissible tuples (Maynard Proposition 4.2) | k=0; k=1,M₁=1,θ=1/2 | Required counts ceil0=0 and ceil(1/4)=1 | Consistent in the displayed instances; retained. |
| 182. Lower bound for M_k when k is large (Maynard Proposition 4.3(3)) | k=e⁸ formally in the real comparison; integer k=2981 | log k−2loglog k−2≈1.84<k | Consistent in the displayed instances; retained. |
| 183. Moments on the simplex (Maynard Lemma 8.1, corrected) | k=5,a=2,b=0; k=2,a=b=c=0 | Integrals=1/2520 and 1/2; G_(0,2)=1 | Consistent in the displayed instances; retained. |
| 184. I_k and J_k as quadratic forms (Maynard Lemma 8.2) | Triangle F=∂x∂y[x²y²(1−x−y)²] | I=1/3150,J₁=J₂=0; F(1/4,1/4)=1/128 | Consistent in the displayed instances; retained. |
| 185. M₅ > 2 (Maynard Proposition 4.3(1)) | Four displayed rational coefficients | I=29509/1222452000; sumJ=40493/838252800; ratio=1417255/708216=2.0011620748472216. | Exact rational recomputation; corrected the rounded decimal. |
| 186. M₁₀₅ > 4 (Maynard Proposition 4.3(2)) | All42 displayed rational coefficients | Ratio=4.000543795842186; ratio−4=0.0005437958421860858; both displayed I and sumJ match exact factorial formulas. | Exact rational recomputation; retained all coefficients. |
| 187. Engelsma's admissible 105-tuple of diameter 600 | Displayed 105-tuple | Cardinality=105,minimum=0,maximum=600; each of 27 primes≤105 misses a residue | Consistent in the displayed instances; retained. |
| 188. The first k primes above k are admissible | k=0 and 5 | Empty tuple; first five primes above 5 are 7,11,13,17,19, missing 0 modulo 5 | Consistent in the displayed instances; retained. |
| 189. Bounded gaps between primes (Maynard Theorem 1.3) | Consecutive primes 3,5 then 5,7 | Gaps=2,2≤600 | Consistent in the displayed instances; retained. |
| 190. Gaps under Elliott–Halberstam (Maynard Theorem 1.4) | Primes 3,5,7 under the explicit EH hypothesis | Gap=2≤12 and three-prime diameter=4≤600 | Consistent in the displayed instances; retained. |
| 191. m + 1 primes in bounded intervals (Maynard Theorem 1.1) | m=1 and prime pair 3,5 | Diameter=2; main scale m³e^(4m)=e⁴ | Consistent in the displayed instances; retained. |
| 192. A positive proportion of admissible m-tuples are prime (Maynard Theorem 1.2) | m=1,A empty below threshold; A={0} | Choose(0,1)=0; singleton shift has infinitely many prime translates, count=1 | Consistent in the displayed instances; retained. |
| 193. Bouniakowsky and Schinzel hypotheses | X+1; X²+X+2; pair X,X+1; empty tuple | First has no fixed prime divisor; second always even; pair covers both classes mod2; empty simultaneous set=all naturals | Consistent in the displayed instances; retained. |
| 194. From roughness to an almost-prime bound | n=1,8,12 and roughness at z=2 | Ω=0,3,3; 8 has ω=1; at strict z=2 no sieving prime | Consistent in the displayed instances; retained. |
| 195. Linear sieve functions | s=1,2,3,4 | F(1)=2e^γ,F(2)=e^γ,F(3)=2e^γ/3; f(2)=0,f(3)=2e^γlog2/3,f(4)=e^γlog3/2 | Consistent in the displayed instances; retained. |
| 196. Rosser sieve weights | D=8,d=2; d=D=2; d=4,D=100 | Upper=0,lower=−1; boundary lower=0; nonsquarefree weights=0 | Consistent in the displayed instances; retained. |
| 197. Rosser–Iwaniec linear sieve | s=2 and 3,zero population | Upper/lower sieve values=0; lower f(2)=0, f(3)>0 | Consistent in the displayed instances; retained. |
| 198. Beta sieve in general dimension | κ=1 and 1/2 | β=2,A=2e^γ,B=0; β=1,A=2√(e^γ/π),B=0 | Consistent in the displayed instances; retained. |
| 199. Positive lower sieve above 9t | t=1,s=9.5; elementary u=10,K=2 | 9.5>9 but <10; elementary δ=1024 gives negative lower bracket | Consistent in the displayed instances; retained. |
| 200. Fundamental lemma for the linear sieve | Exact remainder; positive main scale; X=0 excluded | Relative remainder0 with XV>0; both main multipliers tend1. At X=0 the ratio S/(XV) would be 0/0. | Added eventually positive X and XV before ratio asymptotics. |
| 201. Richert logarithmic weights | N=8,α=1/4,β=1,r=1,n=8 | w₂=1−1/3=2/3; point weight=1/3,Ω(8)=3 | Consistent in the displayed instances; retained. |
| 202. Richert weighted sieve | A_N=multiples of 30; g(p)=1/p family | g(2,3,5)=1,1,1 violates margin; second has g(2)=1/2≤1−1/2 | Consistent in the displayed instances; retained. |
| 203. Richert explicit level threshold | r=2,3 | Λ₂≈1.834,Λ₃≈2.771; thresholds≈0.545,0.361 | Consistent in the displayed instances; retained. |
| 204. Short character input for joint spins | χ₃,intervals (0,2],(1,3]; q=15,k=3 then 15 | Sums=0,−1; reduced conductors=5,1; subset t=2,abs T=1 gives saving δ/2 | Consistent in the displayed instances; retained. |
| 205. Subgroup reduction images | Full SL2 at moduli2,3,6; congruence subgroup modulo2; d=1 | Image sizes 6,24,144; congruence subgroup has image size1 at2; d=1 factor has size1. | Owned subgroup version with fixed bad modulus; no loss of bad-prime primitivity. |
| 206. Uniform algebraic point counts | Affine line over F2; xy=0 over F3; distinct versus coincident lines over F3 | Counts 2=2^1; 5=3+3−1; intersections have 1 versus3 points. | Owned degree-uniform finite-field theorem; separate reducible upper bound. |
| 207. Squarefree-ring sum-product | A={0}; full Z/6Z; A={0,1} in F7,δ1=δ2=1/4 | Sizes of sumset+product set 2,12,5; latter projection has size2>7^(1/4)≈1.62658 and |A|=2<7^(3/4)≈4.3035. | Owned ring theorem; first two controls fail its projection/size hypotheses. |
| 208. Noncommutative flattening | Point mass; uniform S3; uniform A3 inside S3 | Squared counting-L2 norms before/after convolution 1,1/6,1/3; H^2=H and covering set has size1 for these subgroups. | Owned noncommutative input; subgroup concentration prevents unqualified decay. |
| 209. Primitive affine sieve pair | O=Z,f=X; f=2X+2; values {2,3}; empty O | Witness 1 avoids every q; second fails q=2; third fails q=6; empty fails q=2 | Consistent in the displayed instances; retained. |
| 210. Affine almost-prime locus and saturation | Singleton values 6,1,0; value −6; value 8 | Least dense indices=2,0,none (default 0); −6∈O₂; 8∉O₂; empty subset not dense in singleton | Consistent in the displayed instances; retained. |
| 211. Affine walk sieve data | Length-zero word ball; two words with equal value | Population mass=1; repeated value has pushforward mass=2 | Consistent in the displayed instances; retained. |
| 212. Local densities for affine orbits | One forbidden residue modulo p=3; full and empty sets | Densities=1/3,1,0; full obstruction cannot enter strict native sieve | Consistent in the displayed instances; retained. |
| 213. Affine sieve level from expansion | Zero remainder sequence; total mass X=1,δ positive | R_d=0 and remainder sum=0≤C·1^(1−ε) | Consistent in the displayed instances; retained. |
| 214. Escape from proper algebraic subvarieties | Polynomial f=1 then f=0 | Zero loci have populations 0 then X; latter violates nonzero-polynomial hypothesis | Consistent in the displayed instances; retained. |
| 215. Affine sieve saturation with expansion | Singleton unit value versus primitive orbit f=X on Z | Unit has saturation 0; integer orbit r=1 contains infinitely many primes | Consistent in the displayed instances; retained. |
| 216. Explicit affine almost-prime bound | Strict threshold parameters s>9t and δ<(1−τ)/dim G | At t=1,s=10,dim G=3,τ=1/2,δ=1/7: 10>9 and 1/7<1/6 | Consistent in the displayed instances; retained. |
| 217. Squarefree congruence expansion for SL₂ | Squarefree modulus q=1 then 6 | Quotient sizes=1 and abs SL₂(Z/6Z)=6·24=144 | Consistent in the displayed instances; retained. |
| 218. Chen switching weight | N=1000,values 11,2·11·13,3,27 | Switching weights=1,0,1/2,1/2 | Consistent in the displayed instances; retained. |
| 219. Goldbach local factor | N=6,10,18,0 | C_N/C₂=2,4/3,2,0 | Consistent in the displayed instances; retained. |
| 220. Chen switched triple upper bound | Chen constants | 8·0.49246325640747≈3.9397060513<3.9404 | Consistent in the displayed instances; retained. |
| 221. Chen primes with an almost-prime shift | h=2,p=3,5,7 | Translated Ω(5),Ω(7),Ω(9)=1,1,2; all are nonunit P₂ values | Consistent in the displayed instances; retained. |
| 222. Chen original-family lower estimate | Original-family constant versus switched half | 2.6408−3.9404/2=0.6706 | Consistent in the displayed instances; retained. |
| 223. Chen’s Goldbach theorem | N=10 | p=2,3,5,7 give complementary 8,7,5,3; exactly 3 have 1≤Ω≤2 | Consistent in the displayed instances; retained. |
| 224. Quadratic ideal residue symbol adapter | K=Q,denominators O,(5),numerators 0,2,4,15 | Values=1,−1,1,0; degree-two rational ideal denominator gives (2/(5O_K))=1 | Consistent in the displayed instances; retained. |
| 225. Ideal-symbol reciprocity adapter | K=Q,α=3,β=7; α=β=−1 | Products=−1,1; dyadic/real factors=(−1,1),(−1,−1) | Consistent in the displayed instances; retained. |
| 226. Ideal divisor and logarithmic coefficient bounds | K=Q,unit,(4); j=0,k=2,X=4 | τ=1,3; Λ=0,log2≤log4; moment=1+4+4+9=18 | Consistent in the displayed instances; retained. |
| 227. FIMR sieve conversion to prime ideals | Zero ideal sequence; ϑ=δ/(54nabs S²),θ=1/(6n),n=3,abs S=δ=1 | All sums=0; saving ϑθ/(2+θ)=1/5994 | Consistent in the displayed instances; retained. |
| 228. Equidistribution of joint spin signs | One sign variable,zero nonempty Fourier moments; two variables | Sign densities=(1/2,1/2); joint densities=1/4 each | Consistent in the displayed instances; retained. |

### Source-sensitive conventions

| Statement | Instances tried | Values computed | Result and change |
| --- | --- | --- | --- |
| 1. HB-SIEVES, arXiv v1 p.1, introductory question (i); not collated with the published proceedings. | n=2 then 4 | No two primes sum to 2; 4=2+2 | Consistent in these instances; convention retained. |
| 2. HB-SIEVES, arXiv v1 p.2, Example 1; related divisor-count equality on p.4; not collated with the published proceedings. | x=10,z=5 | Survivors 1,5,7: count 3; π(10)−π(5)=1; prime product 6 has 4 divisors | Consistent in these instances; convention retained. |
| 3. HB-SIEVES, arXiv v1 pp.2-3, Example 2 image set and the next page's first counting equality; not collated with the published proceedings. | 2N=10,parameters 2,…,8 | Image {16,21,24,25}: 4 values versus 7 labels | Consistent in these instances; convention retained. |
| 4. HB-SIEVES, arXiv v1 p.2, Example 2 displayed prime-pair count; distinct from the image-multiplicity convention above. | 2N=10,p=7 | Product 21 has factor 3<√10 and is removed; 25 survives | Consistent in these instances; convention retained. |
| 5. HB-SIEVES, arXiv v1 p.2, Example 3 primitive sum-of-two-squares interpretation; not collated with the published proceedings. | n=4 and 9 | All representations of 4 have gcd2; 9 is a nonprimitive square but has forbidden factor3 | Consistent in these instances; convention retained. |
| 6. HB-SIEVES, arXiv v1 p.4, Corollary 1.2 and its immediately preceding asymptotic argument; not collated with the published proceedings. | Fixed z=5/2 | Actual density=1/2; e^(−γ)/log(5/2)≈0.6127≠1/2 | Consistent in these instances; convention retained. |
| 7. KED-ANT-11, §11.5, proof of Theorem 11.11 invoking Theorem 11.9. | x=n=33,z=11,d=1155 | 33·35=1155, all primes≤11; d>x | Consistent in these instances; convention retained. |
| 8. KED-ANT-11, §11.5, proof of Theorem 11.11 between (11.5.1) and the asserted sieve estimate. | Unspecified O(log z) model 3log z, at z=e¹⁰ then e¹⁰⁰ | Values 30 versus 2log z=20, then 300 versus 200; excesses 10,100 cannot have a uniform additive bound | Consistent in these instances; convention retained. |
| 9. BOMBIERI-1971, Published Acta Arithmetica 18 (1971), p.402, coefficient choice immediately after equation (4). | f=1,φ=2 | Correct coefficient=1/2,defect=0; squared-denominator coefficient=1/8,defect=9/16 | Consistent in these instances; convention retained. |
| 10. BOMBIERI-1971, Published Acta Arithmetica 18 (1971), p.403, display immediately after the definition of K_M. | N=L=1,t=1/2 | K₂=0,K₁=1; signed difference=−1,modulus=1 | Consistent in these instances; convention retained. |
| 11. BOMBIERI-1971, Published Acta Arithmetica 18 (1971), p.404, opening definition of I_m and the immediately following assertion that the bins cover all points. | δ=3/10,d=2/5; d=1/2 | Final bin [3/10,3/5) contains both distances; upper-endpoint cutoff wrongly omits it | Consistent in these instances; convention retained. |
| 12. KED-ANT-16, §16.1, display (16.1.2), and §16.3, proof of Theorem 16.7. | q=4,m=1,n=−1; smooth count at fixed cutoff | Integer character phase=−i; asymptotic variable N has infinitely many values while constant c is fixed | Consistent in these instances; convention retained. |
| 13. KED-ANT-16, §16.3, Definition 16.3, Theorem 16.4 and Lemma 16.5. | P={2},bad {0},a₁=a₂=1 | Unmasked S(0)=2,S(1/2)=0 gives false 4≤0; masking leaves 1 and −1 | Consistent in these instances; convention retained. |
| 14. KED-ANT-16, §16.3, proof of Theorem 16.4. | Same masked coefficients | Additive reduced energy at modulus2=1; primitive multiplicative family at modulus2 is empty with energy0 | Consistent in these instances; convention retained. |
| 15. KED-ANT-16, §16.3, proof of Lemma 16.5, Chinese-remainder display. | q₁=2,q₂=3,a₁=a₂=1 | Correct phase=5/6; printed nesting=3/7 | Consistent in these instances; convention retained. |
| 16. KED-ANT-16, §16.3, proof of Theorem 16.7, the density of the sieved classes. | p=3,large p limit | (p−1)/(p+1)=1/2 at3 and tends to1; difference from1 is −2/(p+1) | Consistent in these instances; convention retained. |
| 17. KED-ANT-16, §16.3, proof of Theorem 16.7, final lower bound for smooth integers. | Smooth integer6 with factors2 and3 | Ordered pairs (2,3),(3,2) give2 labels for1 integer; representation multiplicity is not1. | Consistent in these instances; convention retained. |
| 18. KED-ANT-16, §16.3, Definition 16.6. | F₂ | 0=0²,1=1²; no nonresidue, outside-domain q(2)=0 | Consistent in these instances; convention retained. |
| 19. KED-ANT-18, §18.1, Theorem 18.3 proof, small-r bound after (18.1.2). | x=4,y=1,unit energies | Product of square-root factors includes √(xy)=2 rather than1 | Consistent in these instances; convention retained. |
| 20. KED-ANT-18, §18.1, Theorem 18.3 proof, summation of the dyadic large-r estimates. | R=1,Q=t=4,x=t⁴,y=1 | Two bands each≥2t²=32,total≥64; candidate aggregate=t+2t²+1=37 | Consistent in these instances; convention retained. |
| 21. KED-ANT-18, §18.2, boundary explanation following (18.2.2). | x=32,n=2 | Incomplete convolution at cutoff2=0; Λ(2)=log2 | Consistent in these instances; convention retained. |
| 22. KED-ANT-18, §18.2, multiplicative partition parameter after (18.2.3). | x=16,Δ=1/4 | δ=√Δ=1/2≤1; printed lower bound>1 is incompatible | Consistent in these instances; convention retained. |
| 23. KED-ANT-18, §18.2, multiplicative partition and rectangles after (18.2.3). | x=16,δ=1,LM=16 | Four doubling intervals reach16; L<M-style boxes with ℓ>L,m>M have ℓm>16 | Consistent in these instances; convention retained. |
| 24. KED-ANT-18, §18.2, display defining D(L,M;N,m). | λ=μ=point mass at1,q=3,a=1 | Bilinear coefficient at1=1; reduced average=1/2; discrepancy=1/2 | Consistent in these instances; convention retained. |
| 25. KED-ANT-18, §18.2, last aggregate bound and substitution δ=Δ^(1/2). | x=4,Δ=1/4,δ=1/2 | Printed factor (δ⁻¹x+δ⁻²Δ)x=36; claimed Δ^(1/2)x=2 | Consistent in these instances; convention retained. |
| 26. KED-ANT-18, §18.3, Theorem 18.5 display. | Point mass at1 modulo3 | Residue variances=1/4+1/4=1/2 | Consistent in these instances; convention retained. |
| 27. MAYNARD-2015, Proof of Proposition 4.2, display (4.4), p. 389 (arXiv v3 p. 6) | k=2,triangle indicator | J₁=J₂=1/3; correctly bound sum=2/3 | Consistent in these instances; convention retained. |
| 28. MAYNARD-2015, Proof of Lemma 5.1, display (5.8), p. 393 (arXiv v3 p. 9) | d=2 | μ(2)·2=−2; no independently indexed μ_i exists | Consistent in these instances; convention retained. |
| 29. MAYNARD-2015, Proof of Theorem 1.1, p. 391 (arXiv v3 p. 7) | k=5,first primes above5 | 7,11,13,17,19 all avoid0 mod5 | Consistent in these instances; convention retained. |
| 30. MAYNARD-2015, §7, sentence before (7.10), p. 407 (arXiv v3 p. 19) | k=3 | Remaining variables are u₂,u₃, two coordinates; u₁ is absent | Consistent in these instances; convention retained. |
| 31. MAYNARD-2015, Lemma 8.1, definition of G_{b,j}, p. 409 (arXiv v3 p. 21); also (8.6) | k=5,a=2,b=0; displayed k=5 witness | Integral=1/2520; corrected ratio=1417255/708216>2; empty-sum convention would give 0 for the first integral | Consistent in these instances; convention retained. |
| 32. MAYNARD-2015, Proof of Lemma 8.2, display (8.10), p. 411 (arXiv v3 p. 23) | b=0,c′=1,k=3 | Denominator factorial=(3+0+2−1)!=4!=24; G_(1,2)(2)=4, quotient=1/6 | Consistent in these instances; convention retained. |
| 33. KED-ANT-12, §12.4, Theorem 12.2, second inequality. | P=1,κ=1,K=2,u=20 | V⁻=1; wrong lower multiplier 1+δ=1.046489528>1; corrected 1−δ=0.953510472 | Consistent in these instances; convention retained. |
| 34. KED-ANT-12, §12.1, paragraph beginning with the all-prime specialization, and the prime-indicator example before §12.2 | x=25,z=5,prime indicator | Sifted primes 7,11,13,17,19,23 give6; primes≤25 give9; twin starts give4 | Consistent in these instances; convention retained. |
| 35. KED-ANT-12, §12.1 inclusive P(z) definition versus Lemma 12.1 V(p_n) and p₁<z, and Exercise 12.6.1 hint | P={2},g(2)=1/2,z=3 | Correct V=1/2; inclusive failure product gives1−1/4=3/4; strict left limit gives1−1/2=1/2 | Consistent in these instances; convention retained. |
| 36. KHAYUTIN-19, Published Lemma 9.9, pp.224–225, lcm discrepancy step | R=32,θ=1,z=2; θ=1/4 | z⁵R=1024≤A=1024π; z²=4≤√A; w^(13/2)=z⁵ | Consistent in these instances; convention retained. |
| 37. KHAYUTIN-19, Published Lemma 9.11, pp.225–226 | z=1,s→0,degree d>0 | Both products=1; C_d s^d→0 | Consistent in these instances; convention retained. |
| 38. KHAYUTIN-19, Published Theorem 9.7 proof, equation (47), p.233 | Q=x²,p=3,n=2 | Ordinary count27; corrected count18 | Consistent in these instances; convention retained. |
| 39. KHAYUTIN-19, Published Proposition 9.25, pp.235–236, scaled-domain hypothesis | A=10⁶,k₀=10,η=1/10 | Rescaled area=10⁴; required power=(10⁴)^0.7≈630.96 versus coarse10⁴ | Consistent in these instances; convention retained. |
| 40. KHAYUTIN-19, Published Proposition 9.26, pp.236–237, local factor and first proof congruence | k₀=2,k₁=1,k₂=3,ℓ=1 | Original Q≡2 mod6 gives2 mod3, not1 | Consistent in these instances; convention retained. |
| 41. KHAYUTIN-19, Published Lemma B.4, pp.266–267, m≥1 smooth term and closed formula | p=3,q₀=x²−y²,m=n=1 | 5 zeros=4 smooth+1 singular; printed count1 fails | Consistent in these instances; convention retained. |
| 42. KHAYUTIN-19, Published Proposition B.5, equation (68) and odd-valuation branch, pp.268–269 | p=3,q=x²+3y²,ω=1,n=2 | Correct shifted equation has0 solutions; opposite sign yields18 | Consistent in these instances; convention retained. |
| 43. KHAYUTIN-19, Published Proposition B.5, p.268, second displayed branch | p=3,ℓ=1,n=2 | Count is over modulus9, with 81 residue pairs, not modulus3 with9 pairs | Consistent in these instances; convention retained. |
| 44. KHAYUTIN-19, Published Corollary B.7, p.269, n≤ℓ branch and n=ℓ formula | Same conic,n=ℓ=1 | Three roots modulo3, no lifts modulo9, corrected density3 | Consistent in these instances; convention retained. |
| 45. KHAYUTIN-19, Published Proposition B.8, equations (69)–(72), pp.270–271 | p=3,u=u_A=ω=1,ε=−1,k=1 | 9(2+1+1)/2=18; printed expression9 | Consistent in these instances; convention retained. |
| 46. HB-SIEVES, arXiv math/0209360v1, Theorem 5.1, p.35 | s=2, remainder0, X=1 | f(2)=0 and lower main coefficient0; lower sieve count is nonnegative, so 0≤S. | Consistent in these instances; convention retained. |
| 47. HB-SIEVES, arXiv math/0209360v1, Example 1 after Corollary 5.1, p.36 | x=e⁴ | Correct y=e⁴/16; summed O(1) errors have size y, not x | Consistent in these instances; convention retained. |
| 48. HB-SIEVES, arXiv math/0209360v1, Example 4, p.38 | θ=9/20 | 1/θ=20/9>2 and 2/θ=40/9<5, hence at most4 rough factors; θ=1/2 loses positive lower sieve | Consistent in these instances; convention retained. |
| 49. HB-SIEVES, arXiv math/0209360v1, fundamental lemma at end of §5, p.38 | XV=x/logx and remainder=x/logx | Remainder/XV=1 although remainder/X=1/logx→0 | Consistent in these instances; convention retained. |
| 50. HB-SIEVES, arXiv math/0209360v1, partial summation after (6.3), p.44 | N=16,β=1/2 | Upper prime/integral endpoint=N^β=4 | Consistent in these instances; convention retained. |
| 51. HB-SIEVES, arXiv math/0209360v1, Chen theorem local constant, p.46 | N=6 | Universal odd-prime product C₂, finite correction2; doubled Chen normalization=4C₂ | Consistent in these instances; convention retained. |
| 52. KM-21, arXiv:1809.09597v1, definition (2.4), pp.5–6 | ψ=0; ideal divisible by a prime of F | Coefficient0 in both cases; ψ is undefined off units before zero extension | Consistent in these instances; convention retained. |
| 53. KM-21, arXiv:1809.09597v1, Lemma 4.1 domain, p.20 | α=1,β=1 then β=3 | Element products and norms=1 then3^[K:Q]; these are not operations on a mixed ideal/element pair | Consistent in these instances; convention retained. |
| 54. KM-21, arXiv:1809.09597v1, Lemma 4.1(P3), p.20 | K=Q,β=3 | Rational norm modulus=3; in degree3 with rational β=3 it is27O_K versus principal ideal3O_K | Consistent in these instances; convention retained. |
| 55. KM-21, arXiv:1809.09597v1, Theorem 1, p.2, implied-constant dependence | ψ→2ψ; ψ=0 | All coefficients and sums scale by2; zero gives0 | Consistent in these instances; convention retained. |
| 56. HB-SIEVES, arXiv math/0209360v1, p.24, definition of E_c and the Liouville summatory bound; p.25 second-moment calculation | x=2,Liouville prefix | λ(1)+λ(2)=0; next prefix at3=−1, so eventually vanishing integer sums impossible | Consistent in these instances; convention retained. |
| 57. HB-SIEVES, arXiv math/0209360v1, p.25, cutoff choice following (4.2) | x=e⁴,c=1 | Correct y=e²>1,z=e>1; expression lacking x gives e^(−2)<1 | Consistent in these instances; convention retained. |
| 58. HB-SIEVES, arXiv math/0209360v1, p.33, (5.3) and the immediately following normalized main-sum display | P={2},ν(2)=1/2,upper weight only1,X=2 | Full main=1,upper main=2,tail=1; 1=2−1 and normalized1/2=1−1/2 | Consistent in these instances; convention retained. |
| 59. HB-SIEVES, arXiv math/0209360v1, p.28, Theorem 4.1 induction, before (4.5) | s=4,p=x^(1/4) then p=x | Reciprocal logarithmic arguments=4 then1; shifted arguments=3 then0 | Consistent in these instances; convention retained. |
| 60. MAYNARD-2015, Published Ann. Math. 181 (2015), p.404, (6.18) | k=2,m=1 | After fibre integration the remaining product has only coordinate2, one factor | Consistent in these instances; convention retained. |
| 61. MAYNARD-2015, Published Ann. Math. 181 (2015), p.411, matrix-positivity assertion after Lemma 8.2 | F=∂x∂y[x²y²(1−x−y)²] | I=1/3150>0,J₁=J₂=0 | Consistent in these instances; convention retained. |
| 62. KHAYUTIN-19, Published Ann. Math. 189 (2019), pp.230–231, Lemma 9.21, (43)–(44) and final prime-sum estimate | Coarse reciprocal-prime bound, primes through7 | 1/2+1/3+1/5+1/7=247/210≈1.17619; each additional prime adds a positive term, and the reciprocal-prime sum diverges. | Consistent in these instances; convention retained. |
| 63. KHAYUTIN-19, Published Ann. Math. 189 (2019), p.231, Lemma 9.23, the two-case proof | alpha=0 then1/2 | The endpoint has no real-log limit; at alpha=1/2, log alpha=−log2≈−0.693147, while z^(−r alpha+beta) at r=1,beta=1 is sqrt z. | Consistent in these instances; convention retained. |
| 64. FIMR-13, Public author manuscript, §5, Proposition 5.1 proof, pp.21–24, dyadic block sizes | x=16,y=z=4,last block begins just above4 | Next dyadic endpoint8=2z,not z; MN≤2x remains possible | Consistent in these instances; convention retained. |
| 65. FIMR-13, Published Invent. Math. 193 (2013), pp.723,727–730 and §9 progression reduction, as corrected by the published 2015 erratum, pp.923–925 | q=15,k=3 then15 | Reduced conductors5 then1; q∤k true then false | Consistent in these instances; convention retained. |
| 66. BGS-10, Published Invent. Math. 179 (2010), p.577, (3.23) and (3.28) | Connected two-vertex,2k-parallel-edge bipartite graph | Adjacency eigenvalues=2k,−2k; alternating mode has modulus2k | Consistent in these instances; convention retained. |
| 67. BGS-10, Published Invent. Math. 179 (2010), p.581, (3.47), compared with Theorem 3.1 and (3.33) | t=1,s=10,dimG=3,τ=1/2,δ=1/7 | s>9 and δ<1/6; endpoint choices s=9,δ=1/6 remove both margins | Consistent in these instances; convention retained. |
| 68. CHEN-73-CN, Chinese original, p.127, (27) | Chen logarithmic expression V | −0.016472627076<V<−0.016472627074; corrected lower constant>2.6408077 | Consistent in these instances; convention retained. |

### Standing conventions and bundled acceptance definitions

| Statement | Instances tried | Values computed | Result and change |
| --- | --- | --- | --- |
| Native sieve mass and weights | P=1,A₁=10,X=7; zero label | R₁=3; zero survives P=1 and fails P=2 | Consistent in these instances; convention retained. |
| Positive divisors, indexed multiplicity and local obstruction | Divisors of 0; two equal labels; full F₂ bad set | Divisor finset empty; pushed mass 2; survivor count 0 | Consistent in these instances; convention retained. |
| Factor counts and units | 1,8,12,0 | Ω=0,3,3,0; ω(8)=1; zero excluded from almost-prime locus | Consistent in these instances; convention retained. |
| Fourier and inner-product direction | x=1/4,frequency −1; x=1,y=i | Vector coordinate i; projection coefficient −i, projected vector1 | Consistent in these instances; convention retained. |
| Cutoffs, empty sums, total division and suprema | d=D=2; empty prime set; q=0; K₃(0) | Strict remainder excludes2; empty product1; discrepancy0; actual kernel9 versus totalized sine quotient0 | Consistent in these instances; convention retained. |
| Prime indexing and discrepancy centers | First primes; x=5,q=3; x=4,q=1 | p0=2,p1=3; at x=5,q=3, all-prime center3/2 versus coprime center1; ψ(4)=2log2+log3≈2.484906650. | Corrected the earlier report’s prime-power witness; README centers agree. |
| Binary discriminant and dyadic symbol | q=x²+xy+y²; p=2 | D=1−4=−3; χ_D(2)=−1; prime-denominator symbol₂(3,2)=1 | Consistent in these instances; convention retained. |
| Constant quantifiers and fixed cutoffs | θ=1/2,δ=1/8; α=0 | θ/2−δ=1/8>0; log α undefined at endpoint | Consistent in these instances; convention retained. |
| SieveBrun.HasProductDimension | Native sieve P=1; interval w=z=2 | Product1≤K, and log ratio1 | Consistent in these instances; convention retained. |
| SieveBrun.remainderMass | D=1,2 and P=1,R₁=3 | Mass0 then3 | Consistent in these instances; convention retained. |
| SieveRealCharacters.discriminantValue | n=0,1,2,3 with D=8 | 0,1,0,−1 | Consistent in these instances; convention retained. |
| SieveSelberg.diagonalMass | P=2,ν₂=1/2,z=2,3 | G=1,2 | Consistent in these instances; convention retained. |
| SievePolynomialFarey.coefficient | ℓ=0,H=1,G=0; ℓ=2,H=T²,G=1 | All0; c₀=0,c₁=1 | Consistent in these instances; convention retained. |
| SieveApplications.leastNonresidue | p=0,1,2,3,7 | 0,0,0,2,3 | Consistent in these instances; convention retained. |
| SieveQuadratic.primeDenominatorSymbol | Numerators3,6 at2; 9 at3 | 1,0,0 | Consistent in these instances; convention retained. |
| SieveDistribution.primeCountAP | x=5,q=0,a=5; x=4; x=5,q=1,a=0 | 1,0,3 | Consistent in these instances; convention retained. |
| SieveDistribution.discrepancy | x=5,q=3,1,0 | 3/2,0,0 | Consistent in these instances; convention retained. |
| SieveDistribution.PrimesHaveLevel | θ=0,−1 and x>1 | Only q=1 gives0; negative level gives empty sum0 | Consistent in these instances; convention retained. |
| SieveDistribution.ElliottHalberstam | Levels1/2,3/4,1 | First two included, last excluded | Consistent in these instances; convention retained. |
| SieveMaynard.IsAdmissible | Empty set; {0,1}; {0,2} at2 | Vacuous true; residue image size2; residue image size1 | Consistent in these instances; convention retained. |
| SieveMaynard.primeTranslates | H empty; H={0,1} | All naturals; singleton {2} | Consistent in these instances; convention retained. |
| SieveMaynard.maynardSimplex | k=0; k=1 with t=0,1,2 | Singleton empty tuple; first two allowed,2 excluded | Consistent in these instances; convention retained. |
| SieveMaynard.maynardI | k=0,F=1; k=1,F=indicator[0,1]; zero F | 1,1,0 | Consistent in these instances; convention retained. |
| SieveMaynard.maynardJ | k=1,indicator; k=2,triangle indicator | 1; 1/3 in each coordinate | Consistent in these instances; convention retained. |
| SieveMaynard.IsMaynardAdmissible | Zero F; triangle indicator; constant1 on square | False at I=0; true with I=1/2,J=1/3; false outside simplex | Consistent in these instances; convention retained. |
| SieveMaynard.maynardRatio | Triangle; zero function | (1/3+1/3)/(1/2)=4/3; 0/0=0 by total division | Consistent in these instances; convention retained. |
| SieveMaynard.maynardM | k=0,1 | Supremum of {0}=0; Cauchy–Schwarz bound1 attained by interval indicator | Consistent in these instances; convention retained. |

### Supplier conventions

| Statement | Instances tried | Values computed | Result and change |
| --- | --- | --- | --- |
| Quadratic large sieve, AnalyticNumberTheoryPartII §5.29 | M=1,N=3,a1=1,a3=−1 then1 | Squared sums0 then4; coefficient energy2 in both cases. | Consumed with signs and both cutoffs uniform. |
| Finite Gram row, ErdosProgressionPowers §3.1 | x=1,y=(1,2); repeated unit vectors; empty family | Unweighted sum5≤row maximum6; repeated vectors give2=2; empty gives0≤B for B≥0. | Weighted denominator theorem remains distinct. |
| Joint-spin prime saving, ArithmeticStatisticsPartV §3.30 | n=3,cardS=1,delta=1; psi=0 | Saving1/(54·3·37)=1/5994; zero weight gives0. | No duplicate analytic chain. |
| Cubic spin signs and kernel reciprocity | alpha=1+8t,beta=1+16sigma(t) in t^3+t^2−2t−1=0 | Norms377 and3569; finite kernel products1 and−1; infinite exchange factor−1, dyadic factor1; 1=(−1)(−1). | Keeps the infinite factors; no residue-only sign claim. |
| Small-conductor source PNT, AnalyticNumberTheoryPartI §0.32 | principal modulus1 versus nonprincipal modulus3 at x=3 | psi(3)=log6, nonprincipal Mangoldt sum−log2. | Principal main term separated before cancellation. |
| Order and half-norm convention, IntegralLattices Layers0,3 | matrix [[2,1],[1,2]] at vector(1,1) | B(v,v)=6, half-norm3; x^2+xy+y^2=3 and D=−3. | Integral GL2 changes retained. |


Pull request: #1495 (roadmap/sieve-methods-and-prime-patterns at d124b51)
