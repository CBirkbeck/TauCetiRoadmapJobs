## H01 (CBirkbeck) — answered

The shared foundations are still independently specified at EffectiveDiophantineMethods head `5499fdb`: §§0.1–0.3, 1.7–1.8, 3.2–3.4 and 3.17–3.18 contain the five overlaps and its README has zero occurrences of `ComputationalNumberTheory`, whereas `TauCetiRoadmap/ComputationalNumberTheory/README.md:116–128` and `:2667–2689` already assign ownership and specify the restricted comparisons. The remaining repair is a downstream supplier/adaptor contract retaining proof-bearing enclosures, labelled squarefree/disc data, local-square coordinates and witnesses, height/index data and LDL/tail witnesses; neither authorized source file needs changing, and the cross-roadmap coordination condition remains unresolved until that downstream repair is made.

### Ownership evidence

| Shared object | ComputationalNumberTheory owner | Independently specified by EffectiveDiophantineMethods at `5499fdb` |
| --- | --- | --- |
| Canonical rational-centred p-adic record and normalization | README §§0.14, 4.10–4.13 | README §0.1, lines 501–541: the same zero tuple and normalized nonzero residue, with its own construction and proof plan |
| Selected rectangular root, arithmetic, equality and isolation | README §§0.8–0.13, 4.19; Suggested.lean lines 41, 50, 511 | README §§0.2–0.3, lines 565–603: its richer record independently supplies the common arithmetic, equality and isolation proofs |
| Local-image subgroup, cardinality completeness and good-odd-prime comparison | README §§3.18–3.21; Suggested.lean lines 420–470 | README §§3.2–3.4, lines 3243–3371: the same subgroup and comparisons, with additional factorwise coordinates |
| Generic p-saturation and joint reduction | README §§3.22–3.25; Suggested.lean line 473 | README §§3.17–3.18, lines 3853–3921: the same defining implication, torsion/intersection equivalence, finite-index characterization and reduction argument |
| Affine integer-ellipsoid set and boundary membership | README §§4.26–4.27 | README §§1.7–1.8, lines 1293–1348: the same positive-definite sublevel set and membership theorem, with additional LDL/tail witnesses |

These are five instances of the single coordination finding. ComputationalNumberTheory remains the supplier of the shared presentation mathematics; EffectiveDiophantineMethods retains the richer data and Diophantine applications. Positive-definite bounded-norm finiteness itself belongs to `TauCetiRoadmap/IntegralLattices/README.md:772`, milestone 2A, on main, and is consumed rather than allocated again. No ownership is moved and no dependency is reversed.

The comparison used main `eafdde47e47e067afa9c64faddc70703a69c7c56`, the indexed EffectiveDiophantineMethods head `5499fdb5ffcea9211677c56627c1dcce56db8005`, the supplied sibling heads and the board package index. Object searches across main and the indexed open roadmaps, and across all 32 supplied sibling folders, confirm the reported overlap; the ring-map divisibility condition in HabiroNahmSeries §6.1 has different hypotheses and is explicitly distinguished from the additive-subgroup condition. Main-roadmap contracts were read from main, including IntegralLattices 2A and RealAlgebraicGeometry Layers 1–4, rather than from open revisions of existing roadmaps.

### Sources and native carriers

The canonical normalization is corroborated by CarusoPublished line 922, its precision convention by CarusoPublished line 941, and the arithmetic laws by CarusoPublished line 955 and line 987. Siksek line 813 and line 823 supply the divisibility/reduction setting; Siksek line 854 explicitly permits general p-primary reduction groups. FPS line 642 is the dimension-two local-index argument, not an elliptic theorem; the dimension-one specialization uses HeightsRationalPointsAndObstructions §1.17 and the native two-torsion formula. The affine bounded-distance setting appears at deWeger line 2357 and line 2376; the rational-coordinate scaling argument is the roadmap's own comparison. Mattuck remains the settled waived citation, Theorem 7, p.114; no missing source is requested.

The pins were confirmed as Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. At these pins:

- `Mathlib/Order/Interval/Basic.lean:35` defines `NonemptyInterval` by endpoints and `fst_le_snd : fst ≤ snd`; it imposes neither positive width nor root uniqueness. `Mathlib/FieldTheory/AlgebraicClosure.lean:39` and `:54` give the native relative algebraic closure and its algebraicity criterion.
- `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/XSubT.lean:505` defines the square-class carrier as `W.Aˣ ⧸ (powMonoidHom 2 : W.Aˣ →* W.Aˣ).range`; it does not supply the selected generating list or its completeness. `TwoTorsion.lean:57` gives the two-torsion cardinality as the root count plus one.
- `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/BadPrimes.lean:114` includes the coefficient supports as well as the valuations of 2 and the discriminant. Thus the empty-bad-primes hypothesis in Suggested.lean line 469 retains integrality; it does not merely assert nonsingularity over the field.

Cross-roadmap resolution returned no unresolved cross-roadmap citation. The five original name leads are resolved: four are explicit planned interfaces in ClassicalArithmeticCompletion §§3.3, 3.5, 3.25 and 5.3 on main, and `PrattTree.validList` is declared at Suggested.lean line 93. None is evidence of a missing pinned declaration that this roadmap silently assumes.

### Elaborated signatures

A scratch file containing fully qualified `#check @name` commands for all 69 declarations elaborated successfully once against the built module. Comparing the resulting types with the README found no lost standing hypothesis or generality mismatch, including the complete-DVR hypotheses, full-order hypotheses, arbitrary local-field abscissae versus rational existence witnesses, integral good-model condition, and quotient-generation and ambient-torsion conditions in the saturation criterion; no declaration changed. The incomplete supplied signature transcript had lost name qualification after a mutual block; the fully qualified checks also resolve `PrattTree.sound`, `PrattTree.complete` and every subsequent declaration.

### Adversarial mathematics record

The rows below cover the definitions, comparisons and laws at issue in H01, including their README-only forms. No mathematical statement was added or changed. Numerical and finite-group witnesses test the contracts; they do not constitute proofs of the admitted headline theorems or a reproduction of the unrelated large modular/zero computations.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| §0.8 isolated root | X and X², singleton zero rectangle; X²−1 on [−2,2]×{0} | Root sets {0}, {0}, {−1,1}; distinct-root counts 1, 1, 2 | Repeated roots allowed; two distinct roots rejected | None |
| §0.9 rational presentation | r=0, 1/2 | (X−r)(r)=0; displayed value r in each singleton rectangle | Decode agrees with rational cast | None |
| §0.9a existence | z=0 with X²; z=i with X²+1 and box [−1/4,1/4]×[3/4,5/4] | Selected root counts 1 and 1; the other root −i has imaginary coordinate −1 | Both isolate the intended value | None |
| §0.10 addition | 0+0; 1/2+1/3 | 0=0; 5/6=5/6 | Native sum preserved | None |
| §0.11 multiplication | 0·1/3; (1/2)(1/3) | 0=0; 1/6=1/6 | Native product preserved | None |
| §0.12 nonzero inverse | 1/2; zero input | (1/2)⁻¹=2 and (1/2)·2=1; zero violates the input hypothesis | Inverse domain retained | None |
| §0.13 equality | 1/2 versus 2/4; 1/2 versus 1/3 with overlapping isolating intervals | Difference 0 versus 1/6; both chosen roots can lie in [0,1] | Overlap alone cannot decide equality | None |
| §0.14 normalized ball | p=3, (0,−1,1); zero record at N=5 | Centre 1/3, radius 1, norm 3>1 excludes zero; (5,5,0) has radius 1/243 and contains zero | Distinguishes ball from exact zero | None |
| §4.10 normalization | p=3, c=5,N=1; c=9,N=2; c=0,N=5; c=1,N=−1 | Tuples (1,0,2), (2,2,0), (5,5,0), (−1,−1,0); centre differences 3,9,0,1 have valuations 1,2,∞,0, all at least N | Entire balls preserved, including negative precision | None |
| §4.11 addition | p=3: (1+O(9))+(2+O(27)); O(9)+(1+O(81)) | Centre/precision (3,2) normalizes to (2,1,1); (1,2) normalizes to (2,0,1) | Minimum input precision is necessary | None |
| §4.12 multiplication | p=3: O(9)O(81); (3+O(81))(1/3+O(9)) | Precision min(2+4,2+4)=6, tuple (6,6,0); min(1+2,4−1)=3, tuple (3,0,1) | Zero-ball valuation and precision gain retained | None |
| §4.13 inverse | p=3: 3+O(81); 1+O(81); O(9) | Output centre 1/3 and precision 4−2=2; unit precision 4; zero belongs to O(9) | Reciprocal enclosure succeeds exactly off zero-containing balls | None |
| Rational-completion adapter | p=2, c=1/2,N=1; unramified quadratic extension | Rational tuple (1,−1,1) has centre 1/2 and radius 1/2; extension has norm of 2 equal to 1/4 rather than 1/2 | General-completion records cannot be identified with rational ℚ₂ records | None |
| Disc/rectangle adapter | Unit disc centred at 0, selected root 1 of X−1 | Distance 1 equals disc radius 1, so 1 is outside its interior; new box [3/4,5/4]×[−1/4,1/4] isolates 1 | Interior restriction and fresh boundary-root isolation are necessary | None |
| §4.19 complete isolation | f=1, X², X²−1; excluded f=0 | Distinct root lists [], [0], [−1,1]; zero polynomial has every complex number as a root | Nonzero-polynomial hypothesis and distinct-root convention retained | None |
| §3.18 local-image span | Empty list; y²=x³−x over ℝ, x=−1/2 and 2 | Empty closure has order 1; f values 3/8 and 6, sign classes (+,−,−) and (+,+,+), generated order 2 | Span uses actual square-valued abscissae | None |
| §3.19 real completeness | y²=x³−x; y²=x³+1 | Root counts 3 and 1; 2·2=1+3 and 2·1=1+1 | Correct factor of two; empty list can be complete in second case | None |
| §3.19 p-adic completeness | y²=x³−x at p=3 and p=2 | Three rational roots in each field; expected orders (1+3)·1=4 and (1+3)·2=8 | Odd and dyadic cases stay distinct | None |
| §3.20 rational generators over ℝ | y²=x³−x, x=−1/2,2; y²=x³+1, empty list | Generated orders 2 and 1 equal the respective local indices 2 and 1 | Rational abscissae suffice in these cases | None |
| §3.20 rational generators over ℚ₂ | y²=x³−x, x=−4,−16,−23; singleton x=1/4 | f=−60,−4080,−12144, valuations 2,4,4, odd parts 1 modulo 8; square-class vectors have rank 3, order 8; singleton has rank 1, order 2 | Complete list meets 8=8; singleton fails 2<8 | None |
| §3.21 good odd prime | p=5, cubics X³−X, X³+X+1, X³+1 | Residue root counts 3,0,1; factor counts 3,1,2; norm-kernel sizes 4,1,2 equal 1+r | All three cubic splitting types agree | None |
| §3.22 defining saturation implication | A=ℤ,G=6ℤ,p=5,2,3; p=0,1 | 5a∈6ℤ forces 6∣a; 2·3=6 and 3·2=6 give failures; p=0 requires G=A, p=1 is tautological | Natural-parameter definition has correct junk values | None |
| §3.22 torsion/intersection equivalence | A=ℤ×ℤ/2,G=ℤ×0,p=2 | G∩2A=2G=2ℤ×0, but 2·(0,1)=0 and (0,1)∉G | Ambient torsion condition cannot be dropped | None |
| §3.22 finite-index characterization | A=ℤ,G=6ℤ | Index 6; 5∤6, 2∣6, 3∣6 agree with saturation true,false,false | Prime/index hypotheses retained | None |
| §3.22 whole-group and all-prime claims | G=A; G=6ℤ in ℤ | Index 1 has no prime divisors; index 6 has failing primes 2 and 3 | Both directions agree | None |
| §3.22 cyclic-group sweep | All subgroups of ℤ/n for 1≤n≤24; p=0,1,2,3,5,7 | 504 cases: saturation truth value equals torsion-plus-intersection truth value; prime cases also equal index-coprimality truth value; 0 mismatches | Finite torsion and trivial-group cases covered | None |
| §3.23 finite divisibility criterion | A=ℤ,G=2ℤ,g=2,p=2 | Coefficient 1 gives 1·2=2·1; finite test false and saturation false | Dyadic nonzero class must be tested | None |
| §3.23 quotient-generation variant | A=G=ℤ/3,p=2, empty list; A=ℤ/2,G=0,p=2, empty list | First G/2G has order 1 and saturation true; second finite test true but ambient 2-torsion has order 2 and saturation false | Empty generator list is valid only with retained hypotheses | None |
| §3.24 exact divisibility and zero | p=2, P=0; division-polynomial degree for nonzero P | 2·0=0; leading term degrees 4 versus 3 give monic difference of degree 4 | Zero case and nonzero polynomial separated | None |
| §3.25 joint reduction | A=ℤ,G=3ℤ,p=2; G=2ℤ; A=ℤ/2,G=0 | Generator images modulo 2 are 1 and 0; joint kernels have orders 1 and 2; empty-source map in third case has kernel order 1 but misses ambient torsion of order 2 | Injectivity plus torsion, not injectivity alone | None |
| §3.25 general p-primary target | B=ℤ/9,p=3 | B/3B has order 3 and is killed by 3; B has order 9 and 3·1=3≠0 | Use quotient target, with no p² exclusion | None |
| §3.26 independence in finite criterion | Infinite-order Q, generators (Q,2Q), p=2 and p=3 | Nonzero coefficient vectors (0,1) and (1,1) give 2Q and 3Q, both p-divisible | Saturation alone does not imply the finite independence test | None |
| §4.26 affine sublevel definition | G=I₂,t=0,R=1 | Values 0 at origin and 1 at four unit vectors; five points total | Boundary included | None |
| §4.26 cross terms | G=[[2,1],[1,2]],t=0,R=2 | Values 0 and 2 at seven points; (1,1) has value 6>2 | Coordinate box would overcount | None |
| §4.26 affine centre | G=[1],t=1/2,R=1/4 | x=0,1 each give 1/4; x=−1 gives 9/4 | Two boundary points, no negation symmetry | None |
| §4.26 negative bound and rank zero | Positive-definite G,R=−1; n=0,R=0 and R=−1 | Nonnegative quadratic value cannot be ≤−1; empty vector has value 0, so cardinalities 1 and 0 | Degenerate dimension handled | None |
| §4.26 finiteness hypothesis | G=[0],t=0,R=0 | Quadratic value 0 for every integer, so infinitely many members | Positive definiteness is essential | None |
| §4.26 IntegralLattices comparison | G=[1/2],t=1/3,x=1,a=2,D=3 | Original value 2/9; transformed vector 2 has value 4; aD²·(2/9)=4 | Injective scaling preserves boundary equality | None |
| §4.27 membership/completeness | G=[1],t=1/2,R=1/4 and R′=9/4 | Sets {0,1} and {−1,0,1,2}; added points have value 9/4 | Exact membership and finite cover distinguished | None |
| Ellipsoid consumer adapter | G=[0],R=0 versus positive-definite G=[1],t=1/2,R=1/4 | Native first set is ℤ while totalized downstream output is empty; second sets both {0,1} | Positive-definite restriction cannot be erased | None |

### Build and gates

`lake build TauCetiRoadmap.ComputationalNumberTheory.Suggested` exited 0; only the expected admitted-target warnings occurred. Exact final outcome:

```text
Build completed successfully (9016 jobs).
```

Exact gate summary (exit 0):

```text
gate ComputationalNumberTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Exact dependency-check output (exit 0):

```text
depcheck: 33 roadmaps, 303 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The worktree remains clean at `37b9f6f5ca83439fe4fe5408364f9448ae8681b9`; no source edit, commit or push was made. Passing local checks does not discharge the downstream coordination condition in H01.
