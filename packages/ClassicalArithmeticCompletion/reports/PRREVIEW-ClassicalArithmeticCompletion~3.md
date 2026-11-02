# Review of ClassicalArithmeticCompletion (pull request #1409 at b5ee574)

**Verdict:** accepted

🤖 Independent AI review. Incremental re-review of 135 changed lines since 15f67b1. Both previous P2 findings are repaired; one P3 naming issue remains. The gate passes and no blocking finding remains. This verdict means ready for human final approval, not AI approval or merge.

## R01 (P3) — Finish removing the advertised square-class API name

**Location:** `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:857`: “Later API (§1.28), `ratSquarefreePart_mul_sq`”.

**Claim:** The cleanup removes this advertised name from §1.51 but leaves it in the supporting API of §1.18a, the same construction used by the changed passage. It is not a declaration of Suggested.lean.

**Witness:** Neither the 71-declaration elaborated inventory nor searches of the pinned Mathlib and Tau Ceti contain `ratSquarefreePart_mul_sq`. README:857 is its sole remaining occurrence in this folder.

**Exact repair:** Write “Multiplication by a nonzero rational square preserves the squarefree part (§1.28)” without advertising a Lean declaration. Keep the mathematical identity and its nonzero hypotheses. For u=2,t=2/3, both squarefree parts are 2 because u·t²=8/9. No additional acceptance-test declaration is needed.

## Previous findings

- R01 — repaired: README §§4.40 and 4.102 now name the two formal triple-product signatures and the positive-integer four-square count; Suggested.lean:212,224,277 states them with real native carriers and the required hypotheses.
- R02 — repaired: README:15,87 imports both annihilation implications and affine transport. Section 2.22 retains coprimality and affine coordinates; §2.42 now cites the three pinned declarations directly, and §2.43 names the retained statements.
- R03 — partly repaired: The Ramanujan–Nagell and trace-ratio names became prose, and README:13757 uses GaloisModules.IsTamelyRamified. The square-class API name at README:857 remains; this report’s R01 records the residual P3 issue.

## Verified sound

**Scope and counts.** Compared the entire 135-line diff with the previous report and checked all three previous findings. The changes add three admitted theorems and no definitions, replace API labels with mathematical prose, correct a namespace and a source page, and repoint the division-polynomial dependencies. The mathematics of the renamed assertions is preserved. The two substantive additions are the Jacobi endpoints already specified by the README. No route-specific restriction, new computational algorithm, sorry-defined data, option override or new roadmap supplier was introduced.

The checked head is b5ee5747c8fec0e9ab46c10f40daa8b163f4eb09. The diff outside this roadmap folder is empty, and the worktree stayed unchanged. Repository README and CONTRIBUTING were read, together with main’s NewtonPolygons and DiophantineApproximationAndTranscendence roadmaps for form and supplier context.

**Gate and elaboration.** The supplied gate includes a successful targeted build. An independent gate run also passed every reported scanner and dependency category. Direct `lake env lean` elaboration of Suggested.lean succeeded: zero errors, 45 warnings, all for admitted declarations. Imports remain one `import Mathlib` and three individual TauCeti modules. The independent dependency command returned exactly:

```text
depcheck: 205 roadmaps, 1519 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The changed Needs edges in §§2.22,2.42,2.43 resolve to the pinned coordinate and annihilation results or the retained local targets. Section numbers and internal targets cited by the renamed passages remain present.

A scratch copy with `#check @name` elaborated all **71 actual named declarations**. The worker’s “73” inventory had also matched the words “targets” and “group” in the module docstring; removing those two bogus scratch checks resolves its reported unknown-identifier errors. No PR change is needed. The new signatures retain CommRing, TopologicalSpace, T2Space and a unit parameter, or n>0 respectively. The other 68 declarations are unchanged; their inventory and retained hypotheses agree with the previous comparison. Opening the power-series topology scope inside Diophantine does not alter later namespace signatures.

For each of the three new admitted theorems, a scratch probe tried closing rfl, simp and infer_instance. None closed: exactly three deliberate NO_ONE_TACTIC_PROOF errors, while the other 42 admitted statements retained their warnings. Object searches found no exact pinned library theorem for either general formal Jacobi identity or the representation count. The previous report’s padding screen of those 42 untouched theorems is carried forward, not claimed as rerun.

**Headline inventory.** Compatible CRT and power residues; Lucas/Ward divisibility and Christol/Cobham; rectangular Smith forms/cokernels, Perron and Capelli; Jacobi triple products and four-square counting, Markoff descent, three squares, Egyptian fractions and Ramanujan–Nagell; negative Pell, factor-base generation and class/unit completeness; Smyth, both Dobrowolski forms, smallest Pisot, Salem-field generation, Schinzel–Zassenhaus, Dubinin and Bertrandias; reduced norms, Noether, Hilbert–Speiser, strong approximation and tame determinant descent. All three previously missing Jacobi signatures are now present. The unchanged docstring identifies higher reciprocity, GRH analytic interfaces, Fröhlich–Taylor/integral logarithms and Tate/Deligne–Langlands/Artin endpoints with the missing carriers. No surrogate replaces one of them.

**Source checks in this increment.** Five works were retrieved legally through the source service and the following passages read. No source text or manifest was added to the PR.

| Changed target | Source and exact locator read | Result |
|---|---|---|
| §1.51, the seeded target intersecting the diff | bennett-siksek-2020 lines 526–536, Lemma 6.2(ii), printed p.367; lines 746–766, proof of Proposition 6.1, printed p.372 | The source uses the primitive square-class character and the implication from odd conductor part 1 to the four square classes. The general construction is supplied by the pinned fundamental-discriminant API and local §§1.18a,1.28,1.37, not by dropping the elliptic-curve hypotheses of Lemma 6.2. |
| §§2.22,2.42,2.43 | stange-valuations-2014 lines 283–316, §2/Proposition 5 and formulas, pp.6–7; lines 589–595, Theorem 14 proof, p.13 | Correct source scope: the stated multiplication formulas concern elliptic curves; the nonsingular-point theorem for possibly singular curves comes from the pinned Tau Ceti proof. Ayad’s valuation input is used with nonsingular reduction. |
| §4.11, rewritten ring API | banwait-ramanujan-nagell-2026 lines 70–87, §2.1, pp.2–3; lines 96–128, §2.3, pp.3–4 | The norm is x²+xy+2y², the half-integer rounding bound is 11/16, and the units are ±1. The rewritten prose preserves these statements and the nonzero-divisor requirement. |
| §4.40 and both new signatures | pak-partition-2002 lines 3250–3256, §6.1.1, p.35; lines 3319–3349, §6.2.1, p.36; lines 3351–3373, §6.2.2, pp.36–37 | Both exponents and parameter directions agree. The triangular product includes the zero part. The formal generality follows from finite Laurent-coefficient identities and scalar specialization, as the README explains. |
| §4.102 and its new signature | hirschhorn-four-squares-1987 lines 12–18, Theorem 1, author’s p.1 | The changed locator is correct; the count is for positive integers. Counting ordered signed tuples matches the theta-series interpretation. Zero is explicitly excluded. |

Of this round’s fifteen seeded targets, **§1.51 intersects a changed mathematical passage**. The other fourteen (§§2.16,2.17,2.24,2.34,2.35,2.76,4.55,4.106,6.35,7.0,7.57,7.60,7.105,7.115) are outside the delta and were not newly sampled, following the incremental-review instruction. Unchanged marked source limitations are carried below.

**Pinned declarations opened.** Pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

| Native declaration and file:line | Verified content relevant to this repair |
|---|---|
| `WeierstrassCurve.zsmul_point_eq_smulEval`, `TauCeti/AlgebraicGeometry/EllipticCurve/DivisionPolynomial/ZSMul.lean:1016`; `nonsingular_smulEval`, :1059 | Integer multiples and nonsingularity of the evaluated triple, for a nonsingular affine point over a field; no global discriminant or characteristic restriction. |
| `WeierstrassCurve.zsmul_eq_zero_of_evalEval_ψ_eq_zero`, same file:1074; `evalEval_ψ_eq_zero_of_zsmul_eq_zero`, :1088 | Both annihilation implications, including n=0 and negative n. |
| `WeierstrassCurve.zsmul_fromAffine_eq_zero_iff_zsmul_eq_zero`, same file:1128 | Integer-scalar affine/Jacobian transport, with DecidableEq on the field. |
| `TauCeti.Multiquadratic.fundamentalDiscriminant`, `TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/OfSquarefree.lean:51`; `isFundamentalDiscriminant_fundamentalDiscriminant`, :95 | The d versus 4d convention for squarefree d. |
| `fundamentalDiscriminantChar`, `TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Character.lean:34`; `fundamentalDiscriminantChar_neg_one`, :60; `isPrimitive_fundamentalDiscriminantChar`, :87; `fundamentalDiscriminantChar_natCast_eq_legendreSym`, :95 | Fundamental-discriminant character, sign, primitivity and odd-prime values; they do not construct the rational squarefree representative. |
| `QuadraticAlgebra.norm`, `Mathlib/Algebra/QuadraticAlgebra/Basic.lean:251`; `norm_def`, :256 | Native multiplicative norm is re²+b·re·im−a·im². At a=−2,b=1 it is x²+xy+2y². Positivity and norm-Euclidean division for this ring are additional arithmetic facts. |
| `PowerSeries.WithPiTopology`, `Mathlib/RingTheory/PowerSeries/PiTopology.lean:76,85,102` | Scoped coefficientwise topology, Hausdorff inheritance and coefficientwise convergence criterion. No completeness or topological-ring premise is hidden in the new signatures. |
| `Nat.Partition.genFun`, `Mathlib/Combinatorics/Enumerative/Partition/GenFun.lean:56`; `hasProd_genFun`, :170 | Weighted partition series/product on native power series. The strict-partition bijection required for Jacobi remains work here. |
| `PowerSeries.WithPiTopology.hasProd_one_sub_X_pow`, `Mathlib/Combinatorics/Enumerative/Pentagonal/PowerSeries.lean:183` | Euler’s pentagonal product, not the general unit-parameter triple product. |
| `Nat.sum_four_squares`, `Mathlib/NumberTheory/SumFourSquares.lean:199` | Existence of four natural squares, not the cardinality of ordered signed representations. |

**Ownership and citations.** Object searches used the roadmaps tool, the pinned libraries, main and board package files. The formal triple product and four-square count already belong to this roadmap on main (`TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:8809,10455`); this increment supplies their acceptance statements rather than planning a second development. `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md:9,77` at its supplied open head imports §§4.20,4.40,4.60–4.61 with the unit/coefficient hypotheses. Its :13 and :77 also distinguish the Laurent-series Cartier comparison in §2.10 from the ring-valued power-series supplier. No new acceptance-test name was found in the supplied readable siblings. Search hits in open revisions without supplied checkouts were not treated as new suppliers.

The changed trace-ratio paragraph still uses `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:194,227,358` on main: §§0.1–0.3 provide primitive minimal polynomials, degree/height comparisons and bounded-degree finiteness. These sections were reopened. The renamed companion-matrix and EDS references resolve to local §§2.27,2.46 and §§2.21–2.23; the rational-square-class parity reference resolves to §1.37 at README:1342. No supplier contract was invented or moved in this increment. Ownership against open pull requests without a supplied readable head was not checked.

**Adversarial computations for the changed assertions.** The formal products were multiplied as Laurent polynomials in the parameter and truncated in the power-series variable through degree 12, then compared with the finite set of bilateral summands contributing through that degree. Four-square counts were enumerated independently for n=0,…,12. The table also records direct calculations for the renamed assertions and their dependencies; renaming alone is not treated as a new theorem.

| Statement/object | Instances and computed values on both sides | Result/change |
|---|---|---|
| §1.18a squarefree part; §1.37 valuation parity | u=8/9 has squarefree part 2: v₂=3 odd and 2 divides 2; v₃=−2 even and 3 does not divide 2. For u=−12, squarefree part −3: v₃=1, v₂=2. | Arithmetic preserved; one advertised name remains, R01. |
| §1.28 square-class invariance, used in §1.51 | u=2,t=2/3 gives u·t²=8/9, and both squarefree parts are 2. t=0 would give squarefree part 0, not 2, so nonzero t matters. | Prose repair in R01 preserves the correct domain. |
| §1.51 primitive character and conductor | u=−1,2,8/9,3,5,1 give D=−4,8,8,12,5,1 and conductors 4,8,8,12,5,1. For u=8/9 at p=5, num·den=72≡2 and D=8≡3 are both nonsquares, so both characters equal −1; at −1 both equal +1. | Seeded changed passage agrees; trivial conductor 1 retained. |
| §2.1 generating ideal and monic generator | s(n)=2ⁿ over ℚ: (X−2)⋆shiftᵢ(s)=2ⁱ⁺¹−2·2ⁱ=0; generator X−2 equals minpoly ℚ 2. For s=0, G=ℚ[X], generator 1; for s(n)=1, polynomial 1 pairs to 1 and fails. | Renamed ideal/divisibility/linear-generation descriptions agree. |
| §2.1 powers comparison outside integrality | α=X in ℚ[X]: aeval α g=g, kernel {0}, so both sequence generator and minpoly ℚ α are 0. | The extension beyond integral elements retains the intended junk value. |
| §2.6 digit approximation and recovery | p=3,x=14: digits 2,1,1; partial sums 2,5,14 equal residues mod3,9,27. Floor(14/9)=1 is digit 2. For x=−1 the first three digits are 2,2,2, partial sum26≡−1 mod27. | Renamed assertions preserve least-significant-first indexing. |
| §2.10 Cartier decomposition | Over F₂, f=1+X+X²: Λ₀f=1+X, Λ₁f=1; (1+X)²+X·1²=1+X+X²=f. At q=1 decimation Λ₀ is identity, without claiming a finite field of size 1. | Finite-field hypothesis for Frobenius remains. |
| §2.10 q-th-power pullout | F₂, g=1+X,h=X: Λ₁(g²h)=Λ₁(X+X³)=1+X=gΛ₁(h). Over ℚ,q=2,g=2,h=1: left 4 versus right 2; that case is excluded. | Renamed rule keeps its necessary coefficient hypothesis. |
| §2.22 coprimality | y²=x³−x over ℚ, P=(0,0), n=2: ψ₂=0, φ₂=1. At n=0 on any nonsingular affine point: ψ₀=0, φ₀=1. | Both cases give a nonzero numerator; no nonzero-n restriction added. |
| §2.22 affine coordinates | At n=1, φ₁=x, ψ₁=1, ω₁=y, hence (φ₁/ψ₁²,ω₁/ψ₁³)=(x,y). At n=0 the denominator is 0 and the affine implication is inapplicable. | Correct guard; annihilation is imported. |
| §2.42 EDS zero set and criterion | y²+y=x³−x at (0,0) over F₂ has 5 points; ψ₅=2≡0 and 5P=O. For the singular sequence normEDS(2,3,2), Wₙ=n, so its zero set over ℚ is {0}, the multiples annihilating an infinite-order point. | Repointed library references retain characteristic 2 and singular examples. |
| §2.43 valuation/coprimality route | For y²+y=x³−x at P=(0,0), 5P=(1/4,−5/8), ψ₅=2 and φ₅=1. Thus v₂(x(5P))=−2=−2v₂(ψ₅), and ψ₅,φ₅ are not both even. | Renamed references to coprimality and coordinates support the same route. |
| §2.27 monic recurrence | p=X²+1: coefficients (−1,0), so u(n+2)=−u(n). Initial state (2,3) gives (2,3,−2,−3). p=1 has order 0 and equation u(n)=0. | Sign and empty recurrence unchanged. |
| §2.46 transpose comparison; §2.61 state orbit | C(X²+1)=[[0,−1],[1,0]]; Cᵀ(2,3)=(3,−2), agreeing with the recurrence, while C(2,3)=(−3,2) does not. | Explicit monic hypothesis and transpose are correct. |
| §2.46 companion minimal polynomial | For that C, C²=−I and C is not scalar, hence minpoly=X²+1; det C=1=(−1)²·p(0). For p=1 the empty matrix has minpoly 1 and determinant 1. | Renamed conclusion preserves the degree-zero case. |
| §3.16 primitive gcd normalization | Q₁=2X+2,Q₂=−4X−4: primitive normalized gcd X+1, leading coefficient +1, quotients 2 and −4. The opposite associate has leading coefficient −1 and is rejected. | The positivity requirement is preserved. |
| §3.19 row-reduction kernel | A=[[2,4],[0,0]] over ℚ reduces to [[1,2],[0,0]]. Both kernels are {(−2t,t)}; at t=3 both products are (0,0). | Renamed equality is the same statement. |
| §4.11 ring and conjugation | θ²=θ−2 gives θ(1−θ)=2. N(θ)=N(1−θ)=2; N(2)=4=2·2. The zero element has norm 0. | Correct native parameter signs and norm transfer. |
| §4.11 norm coordinates and units | (x,y)=(1,1) gives N(1+θ)=1+1+2=4; (1,−1) gives 1−1+2=2. N=1 forces y=0,x=±1 by (2x+y)²+7y²=4. | Three discriminating ring Checks retained. |
| §4.11 Euclidean division | 1+θ=θ·1+1, with N(remainder)=1<2=N(θ); 2=θ·(1−θ)+0, with 0<2. General rounding bound is 1/4+7/16=11/16<1, versus integer-coordinate bound 2. | Euclidean condition and nonzero divisor preserved. |
| §4.37 weighted-coordinate map | The substitution has y²−x³−x=u²(v²−u⁴−c⁴)/c⁶. At u=c=v=1 both residuals equal −1, so the non-solution is rejected; at u=0,c=1,v=1 both residuals are 0, but positive u excludes this boundary point. | Removing the advertised map name changes neither formula nor hypotheses. |
| §4.40 square-exponent signature | Universal Laurent coefficients agree through degree12. At a=2 both sides are 1,5/2,0,0,17/4,0,0,0,0,65/8,0,0,0. At a=−1 the nonzero coefficients are 1,−2 at degree1,+2 at degree4,−2 at degree9. | New headline passes indexing/sign controls. |
| §4.40 triangular-exponent signature | At s=2 both sides through degree6 are 3/2,9/4,0,33/8,0,0,129/16; at s=1 they are 2,2,0,2,0,0,2. At s=−1 both are zero through degree12. | The initial zero part is present. |
| §4.40 integer exponents and degenerate coefficients | For k=−3,−2,−1,0,1,2, triangular exponents are 3,1,0,0,1,3; no negative value is erased by toNat. In F₂[ε]/ε² with parameter 1+ε, square-form coefficients through degree6 are 1,0,0,0,0,0,0; triangular coefficients are ε,ε,0,ε,0,0,ε on both sides. In the zero ring all coefficients are 0=1. | Arbitrary commutative coefficients, including nonreduced rings, retained. |
| §4.102 four-square count | Independent counts and divisor sums for n=1,…,12 both give 8,24,32,24,48,96,64,24,104,144,96,96. At n=0 the count is 1 and divisor expression 0. | New headline retains n>0; new negative-control Check is correct. |
| §4.118 bounded exceptional representations | k=5 has u²+v²=5 via (1,2), with both coordinates ≤2√5+2≈6.472; k=−2 gives RHSs −2,−12,−6 in the three representation equations, so all are impossible, bounded or unbounded. | Renamed iff retains both signs and bounds. |
| §5.4 HNF corner inverse image | In ℤ[i], I=(1+i) has H=[[2,1],[0,1]] in basis (1,i). A lattice vector (2a+b,b) is rational integral iff b=0; intersection is 2ℤ, exactly the first corner column. Unit ideal gives ℤ=1ℤ. | Prose now names the actual inverse-image statement. |
| §6.1 Pisot projections/uniqueness | φ=(1+√5)/2≈1.618 has other conjugate −0.618, so the sole root with modulus≥1 is φ. √2 has conjugates ±√2, both modulus>1, and fails. Integer2 has no other conjugate; 1 fails the strict lower bound. | Removed API labels preserve all three conditions. |
| §6.2 Salem conjugates/degree | For X⁴−3X³+3X²−3X+1, setting y=X+X⁻¹ gives y²−3y+1=0: y≈2.618 yields τ≈2.154 and τ⁻¹≈0.464; y≈0.382 yields a nonreal unit-circle pair. Degree4 is even; integer2 has no unit-circle conjugate and fails. | Reciprocity, non-Pisot condition and degree requirements preserved. |
| §6.34 exact dyadic prime estimate | x=20.5: five primes in (20.5,41], versus 3x/(5log x)≈4.072275. Application y=13 gives 13.032203>13; y=10 gives 9.786135<10. | Dropping the advertised name does not weaken the required exact bound. |
| §6.76 trace ratio and conjugacy | α=2: trace2/degree1=2. Roots of X²−3X+1: trace3/degree2=3/2 for either root; both are positive. α=0,−1 fail positivity. | Rewritten invariance and positivity requirements agree. |
| §6.76 finite-exception threshold direction | For λ′=1,λ=2,ε=1/4, the thresholds are 3/4 and 7/4; the exceptional set at 3/4 is contained in that at 7/4. The ratio3/2 lies only in the latter. | Downward closure supports supremum, not infimum. |
| §6.76 auxiliary resultants | For P=X²−3X+1 and Q=2, resultant=4, log contribution log4=2log2. With weight1 and λ=−log2, the pointwise lower bound becomes x≥0; the trace inequality is 3≥−2log2. With Q=P the resultant is 0 and coprimality fails. | Nonvanishing is retained before logarithms. |
| §7.2 corrected tameness namespace | Identity ℤ/ℤ at (2): e=1, separable residue F₂/F₂, tame. ℤ[i]/ℤ at (1+i): e=2 in residue characteristic2, not tame. | Corrected name denotes the existing global predicate. |
| §7.4 regular-trace argument | E=M₂(ℚ), basis E₁₁,E₁₂,E₂₁,E₂₂: pairing matrix has entries 2 at (1,1),(2,3),(3,2),(4,4), determinant −16≠0. Over F₂ the same matrix is zero, determinant0. | The explicit nondegeneracy premise remains; separability alone is not substituted. |

**Carried adversarial evidence for untouched statements.** These 84 rows reproduce the previous report’s computed values, with a citation on each row; they were not recomputed in this increment. Five superseded rows (division polynomials, Jacobi products, four squares, the prime estimate and trace ratio) are replaced by the 35 rows above, which also cover the other changed passages. Their previous finding numbers do not carry forward.

[previous]: packages/ClassicalArithmeticCompletion/reports/PRREVIEW-ClassicalArithmeticCompletion~2.md

| Statement/object | Instances and computed values on the two sides | Result/change and provenance |
|---|---|---|
| Compatible CRT | m=6,n=9,a=1,b=4: x=13 mod18, and 1≡4 mod3. Replace b by2: no solution, 1−2≡2 mod3. m=n=0: both conditions are a=b. | Pass; carried from [previous report][previous]. |
| Cyclic power range/kernel | C₆,d=2: additive image {0,2,4}=kernel of multiplication by3. d=0: image {0}=kernel of multiplication by1. Trivial group: both singleton. | Pass; carried from [previous report][previous]. |
| Finite-field Euler criterion | F₇,n=2: nonzero squares {1,2,4}; their cubes are1, while 3³=6. n=0: existence means a=1, exactly a¹=1. | Pass; carried from [previous report][previous]. |
| Nonzero root count | F₇,n=3,a=1: roots {1,2,4}, count3=gcd(6,3). n=0,a=1: six roots=gcd(6,0). | Pass; carried from [previous report][previous]. |
| IsRational | f=1/(1−X): Q=1−X,P=1, Qf=P. f=X²: Q=1,P=X². No numerator-degree bound is built into the predicate. | Pass; carried from [previous report][previous]. |
| lucasU | P=1,Q=−1 gives 0,1,1,2,3,5,8. P=0,Q=1 gives 0,1,0,−1,0,1. | Pass; carried from [previous report][previous]. |
| gcd_lucasU | Fibonacci U₆=8,U₉=34: gcd=2=U₃. m=0,n=6: gcd(0,8)=8. | Pass; carried from [previous report][previous]. |
| DFAO and eval | Two states toggled on digit1, starting0: fold on [1,1,0,1] ends1, equal to digit parity. Empty list ends0; changing the output map changes the sequence. | Pass; carried from [previous report][previous]. |
| IsAutomatic | Binary digit parity begins 0,1,1,0,1,0,0,1; a two-state DFAO realizes it. Constant7 uses one state with output7, not the hard-coded output0. | Pass; carried from [previous report][previous]. |
| kernel | Thue–Morse has the two sequences t and 1−t: t(2n)=t(n), t(2n+1)=1−t(n). For a(n)=n the slopes 2ᵉ give infinitely many distinct kernel sequences. | Pass; carried from [previous report][previous]. |
| Eilenberg equivalence | Constant7: one-state automaton and singleton kernel. Thue–Morse: two states and two kernel sequences. | Pass; carried from [previous report][previous]. |
| Christol | Over F₂, a(n)=1 has series f=1/(1−X), satisfying (1−X)f=1; its kernel is singleton and it is automatic. | Pass; carried from [previous report][previous]. |
| Cobham | Bases2,3 and f(0)=7,f(n)=n mod2 for n≥1: N=1,p=2 works; N=0 fails since f(2)=0≠7. Bases2,4 fail independence because 2²=4¹. | Pass; carried from [previous report][previous]. |
| Ward divisibility | normEDS(2,3,2) is n: m=−6,n=9 gives gcd=3=abs(W₃). For (1,−1,1), W₁₀=−4,W₁₅=−314, gcd2=abs(W₅). For (1,−6,−6), gcd(W₃,W₄)=6≠1; its coprimality premise fails. | Pass; includes singular attached curve; carried from [previous report][previous]. |
| smithDiag | m=2,n=3,r=1,d₀=2 gives rows (2,0,0),(0,0,0). r=0 gives all zeros; no out-of-range diagonal entry is introduced. | Pass; carried from [previous report][previous]. |
| Rectangular Smith existence | A with rows (2,0,0),(0,0,0) has r=1,d=[2], P=I₂,Q=I₃. The empty 0×3 matrix has r=0 and empty determinant1. | Pass; square supplier alone is narrower; carried from [previous report][previous]. |
| Smith cokernel | That 2×3 matrix has image 2ℤ×0, quotient ℤ/2×ℤ; RHS is ZMod2×ℤ^(2−1). Zero map into ℤ² gives ℤ². | Pass; carried from [previous report][previous]. |
| Perron | X²−3X+1: bound2≤3, f(1)=−1,f(−1)=5. (X−1)² has bound2≤2 but f(1)=0 and is excluded. | Pass; carried from [previous report][previous]. |
| Capelli | Over ℚ, X²−2 is irreducible and 2 is not a square. X⁴+4=(X²−2X+2)(X²+2X+2), because −4=−4·1⁴; the extra four-divisibility clause rejects it. n=1: both obstruction lists are empty and X−a is irreducible. | Pass; carried from [previous report][previous]. |
| markoffSet | (1,1,1): 3=3. (3,3,3): 27≠81, distinguishing the coefficient-one convention. | Pass; carried from [previous report][previous]. |
| markoffVieta | Third move on (1,1,2) gives (1,1,1); repeating gives (1,1,2). Both satisfy sum of squares=3xyz. | Pass; carried from [previous report][previous]. |
| Markoff descent | (5,13,194): 37830=37830; third move gives (5,13,1), sum212→19. Root (1,1,1) instead increases sum3→4 and is excluded. | Pass; carried from [previous report][previous]. |
| Three squares | n=0: 0=0²+0²+0²; n=12: 12=2²+2²+2². Squares mod8 give no three-square sum7; 28=4·7 is also excluded. | Pass; carried from [previous report][previous]. |
| IsEgyptianExpansion | {2,3} sums to5/6. Empty set sums0. Including denominator0 fails positivity even though total inversion assigns0 to it. | Pass; carried from [previous report][previous]. |
| Egyptian existence | 5/6=1/2+1/3; 2=1+1/2+1/3+1/6, with distinct positive denominators. | Pass; carried from [previous report][previous]. |
| Ramanujan–Nagell | x=1,3,5,11,181 gives x²+7=8,16,32,128,32768=2³,2⁴,2⁵,2⁷,2¹⁵. Negative x gives the same values. x=0 gives7, not a power of2. | Pass on listed solutions/control; carried from [previous report][previous]. |
| Negative Pell iff norm−1 | d=2: 1²−2·1²=−1=N(1+√2). d=3: impossible mod3, and N(2+√3)=1. d=5: ((1+√5)/2)³=2+√5, norm−1. | Pass; full integer ring matters; carried from [previous report][previous]. |
| Interval completeness | K=ℚ, empty relation/unit families: det=R=h=1, zero errors, strict comparison1<2. A spurious index2 gives2<2, false, rejecting incompleteness. | Pass; carried from [previous report][previous]. |
| IsFactorBaseBound | ℚ: class group trivial, empty generators suffice. ℚ(√−14): norms≤2 generate subgroup order2, not4; including norm3 gives order4. | Pass; carried from [previous report][previous]. |
| Minkowski factor base | ℚ bound1; ℚ(i) bound4/π≈1.27324; ℚ(√−14) bound(2/π)√56≈4.76403, containing norms2,3. | Pass; carried from [previous report][previous]. |
| PowerResidueIndependent | p=2,P=(3),v=−1: residue product1 iff e even. v=1 passes residue test at e=1 but not divisibility, hence is not independent. v=0 only passes at e=0, showing why logarithmic interpretation needs nonzero residues. | Pass; carried from [previous report][previous]. |
| Unit saturation without torsion column | ℚ(√2),p=3,P=(7,√2−3): ε=1+√2 maps to4; 4²=2 mod7≠1, index1 not divisible by3. Rank-zero ℚ with p=3 has index1. | Pass; carried from [previous report][previous]. |
| Unit saturation with torsion column | For p=2 at the two primes over7, columns for ε and −1 form rows (0,1),(1,1), determinant1 over F₂. For u=−ε² both columns coincide, determinant0, rejecting index2. | Pass; carried from [previous report][previous]. |
| Principal-product saturation | ℚ(√−14), J=p₃, J⁴=(5−2√−14): residues of (−1,a) give diagonal character matrix (1,0),(0,1). Claiming order8 replaces a by a² and gives zero second column. | Pass; carried from [previous report][previous]. |
| Class number from saturation | C₄ with n=4 gives order4. Claimed n=8 fails at p=2,e=4: 8 divides2e but not e. Empty family for trivial class group gives1=empty product. | Pass; carried from [previous report][previous]. |
| Class-number/regulator residue bounds | ℚ: κ=1,S=ε=0,w=2,Δ=1,r₁=1,r₂=0; prefactor1, bounds1≤hR=1≤1. | Pass; carried from [previous report][previous]. |
| IsPisot | 2 is degree-one Pisot; 1 fails >1. √2 fails because −√2 also has modulus>1. φ has other conjugate (1−√5)/2 of modulus≈0.618034. | Pass; carried from [previous report][previous]. |
| IsSalem | For X⁴−3X³+3X²−3X+1, τ≈2.153721, inverse≈0.464313 and two conjugates have modulus1. Integer2 has no unit-circle conjugate and fails. | Pass; carried from [previous report][previous]. |
| Salem powers | Squaring that τ gives≈4.6385; squared-root polynomial X⁴−3X³−7X²−3X+1 retains an inverse pair and a unit-circle pair. Exponent0 gives1 and is excluded. | Pass; carried from [previous report][previous]. |
| Pisot powers | 2²=4 is Pisot; φ²≈2.618034 has other conjugate≈0.381966. Exponent0 gives1, excluded. | Pass; carried from [previous report][previous]. |
| Schinzel–Zassenhaus | X−2: house2≥2^(1/4)≈1.189207. X²−X−1: house≈1.618034≥2^(1/8)≈1.090508. X−1 is excluded. | Pass; carried from [previous report][previous]. |
| finiteFeketeDiameter | K={−1,1}: n=2 gives distance2; n=3 forces repetition and product0. Defined junk values n=0,1 are0. | Pass; carried from [previous report][previous]. |
| transfiniteDiameter | K={−1,1}: infimum of 2,0,0,… is0; the unit disc has capacity1 but two-point diameter2. | Pass; carried from [previous report][previous]. |
| radialHedgehog | No endpoints gives∅; endpoint0 gives{0}; endpoint1 gives[0,1]; endpoints−1,1 give[−1,1]. | Pass; carried from [previous report][previous]. |
| Dubinin | One unit spike: capacity1/4=4⁻¹. Opposite unit spikes: capacity1/2=4⁻¹ᐟ². Repeated endpoint1 twice gives1/4≤1/2. | Pass; carried from [previous report][previous]. |
| ExteriorLaurentContinuation | K={2}, G(z)=1/(z−2), a₀=0,aⱼ=2^(j−1): at z=4 the Laurent sum=1/2=G(4). G=0 would give0 and fail the germ equality. | Pass; carried from [previous report][previous]. |
| Bertrandias | Same integral sequence: capacity{2}=0<1 and generating function X/(1−2X), with (1−2X)f=X, Q(0)=1. | Pass; carried from [previous report][previous]. |
| Explicit Dobrowolski | d=2 lower bound≈0.999987364<φ≈1.618034; d=3 bound≈1.000000054<plastic root≈1.324718. Primitive nonmonic 2X²−1 has measure2. | Pass; do not replace negative log-log at d=2; carried from [previous report][previous]. |
| Salem-field generator | For the degree-four τ above, τ² has the degree-four polynomial displayed above, hence ℚ(τ²)=ℚ(τ). This tests preservation of the field, not universal minimal generation. | Pass on this consequence; carried from [previous report][previous]. |
| Smyth | X³−X−1 attains the plastic measure≈1.324718; X−2 has measure2. X−1 has measure1 but is reciprocal up to sign and excluded. | Pass; carried from [previous report][previous]. |
| Smallest Pisot | Plastic root≈1.324718<φ≈1.618034<2; 1 is smaller but fails the definition. Other plastic conjugate moduli≈0.868837<1. | Pass on reference instances; carried from [previous report][previous]. |
| Asymptotic Dobrowolski | At m=1000, L≈91.323962 and exp(1/L)≈1.011010. At m=1 the lower branch can use c=2 for X−2, giving1.648721≤2. These choices test the branches, not uniform existence of C,c. | Pass on branch controls; carried from [previous report][previous]. |
| IsReducedNormLaw | M₂(F₃), swap matrix: determinant2, regular-action determinant1. On F₂[ε]/ε², diag(1+ε,1) has norm1+ε, not1. | Rejects wrong regular determinant and reduction-only models; carried from [previous report][previous]. |
| Unique reduced norm | Degree1 gives identity norm; zero ring has one law with0=1. M₂(ℚ), diag(2,3) gives6 and scalar2 gives4. | Pass on normalization; carried from [previous report][previous]. |
| IsNIBGenerator | Trivial G,A=B=ℤ: α=1 gives singleton basis; α=0 spans0 and fails; α=2 spans2ℤ and fails. | Pass; carried from [previous report][previous]. |
| HasNIB | ℚ(√5): conjugates of (1+√5)/2 have determinant−1 in the integral basis. ℚ(i): a±bi have determinant−2ab, never±1. | Pass; carried from [previous report][previous]. |
| Tameness at a prime | Identity at(3): e=1,separable F₃/F₃, true. ℤ⊂ℤ[i] at2: e=2, false. F_p(s)[[t]]⊂F_p(s^(1/p))[[t]]: e=1 but inseparable residues, false. | Pass; carried from [previous report][previous]. |
| Global tameness | ℚ(ζ₃): e₃=2 prime to3, other e=1, true. ℚ(i): one wild prime at2 makes the all-prime predicate false. | Pass; carried from [previous report][previous]. |
| Tameness in towers | Identity tower: e=1·1=1, true iff true∧true. ℤ⊂ℤ⊂ℤ[i]: e₂=1·2=2, both sides false. Replacing the top by a field makes nonzero-prime quantification empty; finiteness excludes that shortcut. | Pass; carried from [previous report][previous]. |
| Local Noether | Unramified quadratic Q₂ extension: residue basis {ω,ω²} of F₄/F₂ has determinant1 and lifts; e=1. Q₂(i): determinant−2ab is never a2-adic unit, e=2 wild. | Pass; carried from [previous report][previous]. |
| Hilbert–Speiser | ℚ(√5): NIB exists,tame,odd squarefree level5. ℚ(i): no NIB,wild,level4 cannot be replaced by an odd squarefree level. | Pass; carried from [previous report][previous]. |
| Gauss-period generator | n=1,K=ℚ: period1. n=5,K=ℚ(√5): period(√5−1)/2 has conjugate coordinate determinant1. | Pass; carried from [previous report][previous]. |
| groupRingDeterminant | Trivial G,scalar2,dimension1 gives2; dimension0 gives1. S₃ standard representation:3-cycle determinant1,transposition determinant−1. | Pass; carried from [previous report][previous]. |
| Tame determinant descent | R=S,u=1: all representation determinants1=1. R=ℤ₃,S=ℤ₃[√3],trivial G,u=2: v=2 gives2ⁿ=2ⁿ, including n=0. On1+3ℤ/9, squaring swaps4,7; cubing gives1 and misses4. | Pass on these cases; tame degree is essential; carried from [previous report][previous]. |
| Points and evaluation topology | H=F gives one map. H=F[X],R=ℚ_p: evaluating X and X² at a gives a,a²; a=pᵐ→0. Discrete topology would fail this convergence. | Pass; carried from [previous report][previous]. |
| HasStrongApproximation | Trivial group: one-point diagonal is dense. G_m/ℚ at adele x₂=2,x_p=1 elsewhere and U₅=1+5ℤ₅: possible rationals±2 have residues2,3≠1, so density fails. | Pass; not a definition containing its conclusion; carried from [previous report][previous]. |
| Strong approximation | SL₂/ℚ at S={∞}: diag(t,t⁻¹) is unbounded. Hamilton norm-one real group is the compact sphere a²+b²+c²+d²=1. Product with SL₂ still has that compact quotient and is excluded. | Pass on factorwise hypothesis; carried from [previous report][previous]. |
| 2.48 Bernoulli generating function | z=0: sum1, removable value1; total quotient0/0 would be0. z=1: both sides≈0.581976707. B₁=−1/2; positive convention would give≈1.581976707. | Pass; carried from [previous report][previous]. |
| 2.53 Farey | 2/5<3/7 in F₇:5·3−2·7=1,5+7=12>7. F₁ endpoints:1·1−0·1=1,1+1=2>1. | Pass; carried from [previous report][previous]. |
| 3.59 similarity | I₂ and nontrivial Jordan block at1 both have characteristic polynomial(X−1)², but minimal/invariant factors have degrees1 and2. Matrices [[0,−1],[1,0]] and its negative are conjugate by diag(1,−1), invariant factor X²+1. | Pass both directions/negative control; carried from [previous report][previous]. |
| 4.27 Pell bound | d=6,n=3,u=5+2√6: abs(x′)≤3,abs(y′)≤1; representatives(±3,±1) give9−6=3. d=37,n=11,u=73+12√37: bounded box has no integral solution. | Pass; carried from [previous report][previous]. |
| 4.101 Markoff coprimality | (5,13,194): sums37830=3xyz; gcd(5,13)=gcd(5,194)=gcd(13,194)=1. (0,0,0) would have gcd0 and is excluded by positivity. | Pass; carried from [previous report][previous]. |
| 7.12b conductor induction | E=Q₃(√3),V=1: a_E=0, induction1⊕η has a_F=1=1·0+1·1. E=Q₂(i) instead gives2=1·0+2·1. | Pass; discriminant/wild term retained; carried from [previous report][previous]. |
| 7.12b epsilon normalization | Negative trace character at3, ramified quadratic ω: sum−i√3; twist by absolute value gives−i/√3, ratio1/3. Zero representation has epsilon1 and scaling exponent0; rank1 doubles under measure2dx. | Pass; carried from [previous report][previous]. |
| 7.53 split product | In the biquadratic tame compositum Q(ζ₃,√5), take α=ζ₃ and β=(1+√5)/2 in the complementary fixed fields. Factor conjugate-basis determinants−1 and−1 give tensor determinant(−1)²(−1)²=1. | Pass; fixed-field hypotheses are used; carried from [previous report][previous]. |
| 7.69 associated order | e₊(1+i)=1,e₋(1+i)=i; e₊²=e₊,e₋²=e₋,e₊e₋=0. ℤ[C₂] has index2 in ℤe₊⊕ℤe₋. | Pass; carried from [previous report][previous]. |
| 7.93 elementary descent | Identity coefficient extension, G=C₃,p=2,ℓ=3: Δ=1 and both determinant subgroups identical. Trivial group gives(S×)^Δ=R×; u=1 maps to1. | Boundary tests only; primary statement checked above; carried from [previous report][previous]. |
| 7.102 Noether | Q(i)/Q: e₂=2,local conjugate determinant−2ab nonunit,trace ideal2ℤ; tame/local-free/projective all false. Q(ζ₃): e₃=2,normal conjugate basis determinant−1; all true. | Pass; carried from [previous report][previous]. |
| 7.112 adjusted Gauss | Trivial local character over Q_p: τ=1,y=−1,Det(c)=1,so τ*=−1. Zero virtual character:1·1⁻¹·1=1. Unramified χ: χ(D)⁻¹(−χ(P))⁻¹χ(PD)=−1. | Pass; carried from [previous report][previous]. |
| 1.64 quartic supplement | Primary λ=−1+2i: exponent−2, i⁻²=−1; modλ, i=3 in F₅ and(1+i)^1=4=−1. λ=3+2i: exponent−1,−i; mod13,i=5 and6³=8=−i. | Modern formula passes these controls; carried from [previous report][previous]. |
| 5.9 determinant enclosure | H Hadamard4×4,detH=16; H′=1.5H,detH′=81,error65. README bound162≥65; printed source bound64<65. Empty matrices: error0. | Roadmap correction is sound; carried from [previous report][previous]. |
| 7.29 Hasse–Davenport | q=5,n=2,quartic χ withχ(2)=i: g(χ²)²=5 andχ(2)²g(χ)g(χ⁻¹)=(−1)(−5)=5. q=2,n=1: both−1. | Sign/empty product agree; carried from [previous report][previous]. |
| 7.118 torsion control | Q₈: faithful degree-two representation sends i to diag(i,−i),j to[[0,1],[−1,0]],both determinant1. Character homomorphism h with nonlinear value−1 and linear values1 has log0 but differs from every group-element determinant there. −1≡1 mod2, but not mod2𝔪₂. | Correct negative control; logarithm alone insufficient; carried from [previous report][previous]. |
| Fröhlich–Taylor endpoint | Trivial G: O_F is free overℤ of rank[F:Q],so reduced class0; no symplectic irreducible gives root-number class0;2·0=0. | Normalization only; full theorem not certified by this instance; carried from [previous report][previous]. |

## Not verifiable

No source newly needed for the substantive repairs remains unavailable: all five requests succeeded. The initial refusal of the Annals URL was resolved by identifying it as the publisher’s open copy; it is not a missing-text request.

The following limitations are **carried from the previous report**, not fresh failed retrievals or reasons to park this incremental review. Its source-provenance inventory and uncertified statuses remain the evidence for these unchanged passages.

| Source | Unchanged locator/use and inherited limitation |
|---|---|
| kudla-tate-2004 | §3 (3.29), Propositions3.5–3.8, pp.120–125; §4 Corollary4.4,p.128. Title search and Toronto author-page search did not supply a readable legal copy; authorization of the third-party copy was not established. |
| prr | §1.4.1,p.29; §1.4.3,p.33; Proposition2.37,pp.100–101. Cambridge DOI/title search supplied no open chapter. |
| bach-euler-products-1995 | pp.13–28, Layer5. Bibliographic/title search supplied no primary text. |
| prasolov-polynomials-russian-2003 | Chapter2 §7.2,Theorem7.2,pp.68–69. MCCME publisher requests timed out; third-party copy was not used. |
| smyth-1971 | §4,pp.172–174, short-gap multipliers p.173. Author-uploaded copy returned403; webpage formulas were insufficient. |
| silverman-icms-2007 | First slide/full Ward assertion. Brown author PDF timed out; no alternate readable result. |
| simonson-gersonides-2005 | Highlights item5,p.3; pp.6–7. BIU institutional request timed out. |
| berndt-evans-williams-1998 | §11.3 Hasse–Davenport proof. Author contents/publisher listing supplied bibliography, not the chapter. |
| reiner-maximal-orders-1975 | Theorems41.1,41.7. Service search supplied no legal text. |
| froehlich-taylor-gauss-1980 | Theorem5(ii)–(iii),§5.1. Royal Society DOI returned403; Taylor’s later use was available. |
| wall-norms-1974 | Theorem8.3,p.614. Wiley DOI returned403; no alternate legal text. |
| rosser-schoenfeld-1962 | Corollary3, used by renamed §6.34. Project Euclid PDF returned an error page; the exact proof remains uncertified by the secondary quotation and the numerical controls above. |
| ward-memoir-1948 | Arithmetic divisibility,pp.31–74. No readable legal text; full singular/bad-prime proof is not established by the good-prime route. |
| froehlich-galois-modules-1983 | Theorem15A,p.66. Settled uncertified/paywalled Springer citation; not reopened. |
| mignotte-irreducible-factors-1988 | Theorem1′ and remarks,pp.156–166. Settled uncertified/paywalled citation; not reopened. |

The earlier report also did not certify a complete translation of Gauss’s original quartic-character convention. No new claim about that untouched passage is made here. Unchanged source locators outside the delta were not all fetched again. The tables supply finite checks and negative controls, not proofs of the general theorems; the earlier report’s limitations for nonabelian determinant descent and Fröhlich–Taylor remain.

## Source issues

- none

No additional source error was established in this increment. The seven source issues already recorded in the previous report are not withdrawn or relabelled as newly discovered.
