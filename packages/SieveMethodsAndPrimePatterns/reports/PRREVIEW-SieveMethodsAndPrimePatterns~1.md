# Review of SieveMethodsAndPrimePatterns (pull request #1495 at b7b40cf)

**Verdict:** needs changes

## R01 (P2) — Keep the full distribution estimates as targets

Location: `TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:2526`, particularly line 2532: “the sharper log² exponent is outside its scope”; also lines 2580 and 2600.

Claim: the general convolution, variance and correlation interfaces replace the source's logarithmic square by powers three, five and four because the chosen proof route loses logarithms. This leaves a deliberately weaker library interface. The contract requires retaining the general result even when repairing its proof costs more work.

Witness: KED-ANT-18 line 435 states power two; line 635 does so for variance. At Q=eᵗ, the replacement/source logarithmic ratios grow as t, t³ and t². No absolute constant absorbs them.

Repair: keep these conservative inequalities as intermediate targets, and add the full power-two endpoints with their precise support, all-moduli discrepancy and uniform-constant hypotheses. Keep the Δ improvement on f's variable in the correlation statement. Own the refined conductor/dyadic estimates needed to prove them; the documented source proof gap does not justify excluding the endpoint. With normalized logarithms, t=10 and 100 give ratios 11 and 101 for convolution, 1331 and 1030301 for variance, and 121 and 10201 for correlation. Restoring power two makes all three ratios 1. This finding does not assert that the weaker inequalities are false.

## R02 (P2) — State the unweighted Jutila theorem in Suggested.lean

Location: `TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:2185` and `TauCetiRoadmap/SieveMethodsAndPrimePatterns/Suggested.lean:219`.

Claim: §2.7 owns Jutila's unweighted real-character mean-square theorem, a deep input to the weighted theorem, but the acceptance file states only the weighted theorem. The unweighted theorem is neither stated nor identified as unavailable in the module docstring.

Witness: JUTILA-ORIGINAL line 120, Lemma 2, printed p.194, gives XY(log X)⁸. A scratch declaration of that exact estimate using the existing `discriminantValue` elaborates without additional definitions, imports or options.

Repair: add the unweighted theorem, with an absolute positive constant, X≥3, Y≥1, every nonsquare discriminant in the interval (including nonfundamental ones), and the existing numerical character adapter. Name it among the module's headlines. The weighted theorem's all-ones specialization has an extra term of size √X·Y²(log Y)⁶ and is not this uniform estimate. The proposed signature was elaborated; at X=3 its left side is 1 for Y=1 and 0 for Y=2. Including square D=1 would instead add Y², so retain that exclusion.

## Verified sound

Read both complete roadmap files and the normative writing checklist. Compared the shape with `TauCetiRoadmap/IntegralLattices/README.md`, `TauCetiRoadmap/Isoperimetry/README.md` and `TauCetiRoadmap/RiemannianGeometry/README.md`. The head matches the requested commit; the pull request has no changes outside this folder. No worktree files were changed.

The worker's gate reports every scanner, dependency check and targeted build passing, including `set_option=0`, `sorry-data=0`, `stray-files=0`, `outside-folder=0`, `build=0`, and `OK`. Independent direct elaboration of Suggested.lean also passed, with only 31 admitted-theorem warnings. The mechanical dependency check returned:

```text
depcheck: 204 roadmaps, 1497 edges, 0 problem(s)
```

No UPWARD or CYCLE was reported. Read the individual Needs lines and supplier contracts as well as checking the graph. Source proof repairs are owned mathematical targets, not claims that a citation supplies the missing proof.

There are 50 Lean declarations: 19 definitions with real bodies and 31 theorems. A scratch copy with `#check @name` for every declaration elaborated. Comparing the resulting types with the README found no dropped section hypothesis. A one-tactic probe using `simp`, `rfl` and `infer_instance` closed none of the 31 targets; the library/object audit below found no single existing lemma proving one of those complete signatures. No padding finding is raised.

The stated headlines cover: weighted Selberg Gram; Brun's fundamental estimate; optimized Selberg upper sieve; interval, progression, twin and Goldbach upper bounds; Brun convergence; additive and primitive-character large sieves (both constants); Linnik exceptions; prime quadratic-symbol, weighted Jutila, Smith and Koymans–Pagano estimates; polynomial Farey large sieve; Vaughan; prime level, maximal Bombieri–Vinogradov and Barban–Davenport–Halberstam; Maynard's level-to-clusters theorem, asymptotic M_k growth, M₅ and M₁₀₅ bounds, 600 and conditional 12/600 gaps, general m-gap growth and positive-proportion tuples; Chen's Goldbach and even-shift theorems. R02 concerns the additional unweighted Jutila headline. The docstring explicitly names the unavailable convex-domain Gram/binary sieve, weighted general sieve, joint-spin and affine/expansion interfaces and the carriers they lack. The conjectures are not asserted as unconditional theorems.

The seeded source sample was checked at these locators. Web chapters are unpaginated; the extraction's line numbers are the reproducible locator. Source passages were not copied.

| Seeded target | Text opened and result |
|---|---|
| 0.1 weighted divisibility identities | HB-SIEVES lines 137–216, pp.3–4; KED-ANT-11 lines 376–430, §11.2. Finite interchange and inclusion–exclusion support the identities, including zero samples and P=1. |
| 0.2 weighted finite families | HB-SIEVES lines 90–108, pp.2–3; KED-ANT-11 lines 500–520, §11.3. The roadmap's fibre weights repair the source's image/parameter multiplicity mismatch. |
| 0.7 local densities and growth | KHAYUTIN-19 lines 3415–3457, Definition 9.1, pp.221–222, and lines 3479–3484, Definition 9.6, p.222. Corrected density differs from ordinary zeros, and both growth bounds are retained. |
| 0.11 translated lattice discrepancies | KHAYUTIN-19 lines 3460–3477, Definition 9.4 and Remark 9.5, p.222. Translation, dilation, area threshold, maximal curvature radius and regularity are explicit. This definition supplies the class, not a proof of its general lattice estimate. |
| 1.3 Selberg optimum | HB-SIEVES lines 300–585, §§2–3, pp.7–12. Checked diagonalization, optimizer and upper-bound passage against the strict cutoff; z>1 keeps the denominator positive. |
| 1.4 binary polynomial sieve | KHAYUTIN-19 lines 3485–3511, Theorem 9.7, pp.222–223; lines 3522–3745, Lemmas 9.8–9.13; lines 3923–4437, §§9.5–9.7. The README explicitly owns the R₂ and shifted-density repairs, rather than treating the printed proofs as complete. |
| 1.6 Selberg applications/parity | HB-SIEVES lines 810–915, 1005–1060 and 1190–1230, §§3–4. Checked the progression factors, strict endpoints, ordered Goldbach counting and Liouville normalization. |
| 2.1 tapered Fourier vectors | BOMBIERI-1971, printed pp.402–404, equations (4)–(5) and the kernel construction; also inspected the page image. The negative Fourier phase agrees with Mathlib's conjugate-linear first slot. Signed kernel and modulus are kept separate. |
| 2.3 reduced fractions/Gauss/primitive sieve | KED-ANT-16 lines 354–462, §§16.1–16.2, Theorems 16.1–16.2. Checked Q⁻² spacing, primitive restriction, q/φ(q), and the stronger constant separately retained in §2.9. |
| 3.4 transfer/variance/BDH | KED-chap-bombieri lines 381–440, Theorems 17.1 and 17.4; KED-ANT-18 lines 625–714, Theorem 18.5 and Corollary 18.6. Prime powers and the second-moment normalization agree. The weakened generic interfaces are R01. |
| 4.1 admissible tuples | MAYNARD-2015 lines 18–24, p.383. Missing one residue for every prime, distinct shifts, and conjectural status agree; empty/singleton cases do not become twin-prime claims. |
| 4.6 lower bounds for M_k | MAYNARD-2015 lines 353–366, Proposition 4.3, p.390; §8, Lemmas 8.1–8.2, pp.408–411. Independently integrated both rational polynomial witnesses; handled the degree-zero moment and semidefinite numerator matrix. |
| 4.7 admissible sets/gaps | MAYNARD-2015 lines 83–127, Theorems 1.1–1.4, pp.384–385, and lines 380–385, p.390. Checked all 27 primes ≤105 for the displayed tuple; 105 distinct shifts have diameter 600. |
| 4.8 polynomial conjectures | SS-23 lines 44–51 and 86–88, pp.674–675. Positivity, irreducibility and absence of a fixed prime divisor remain distinct, conjectural conditions. |
| 5.4 affine saturation | BGS-10 §2, §3 and §4 locators are settled uncertified. The text could not be certified; see Not verifiable. Independently checked the finite reduction, density, multiplicity, laziness and strict-exponent examples below. |

The main exact computations were I₅=29509/1222452000, ΣJ₅=40493/838252800, hence ratio 1417255/708216. For all 42 displayed rational coefficients at k=105, exact rational integration reproduced the README's I, ΣJ and ratio, giving 4.000543795842186…>4. The admissible 105-tuple misses residues 1,2,1,4,7,6,6,8,14,21,26,22,19,1,3,36,9,38,13,8,11,1,4,3,1,1,3 at primes 2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101,103 respectively. Larger primes cannot be covered by 105 residues.

Pinned-library audit: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Native object opened | Boundary checked |
|---|---|
| `Mathlib/NumberTheory/SelbergSieve.lean:53`, `:162`, `:191`, `:216`, `:236`, `:276`, `:375` | `BoundingSieve`, weighted sums/remainders, upper-Möbius inequality, squared weights, Selberg terms and diagonalization are already supplied. Nonnegative sample weights do not force totalMass≥0. The new optimizer/error estimate is additional. |
| `Mathlib/Combinatorics/Additive/ApproximateSubgroup.lean:63`, `:119`, `:127` | `IsApproximateSubgroup`, subgroup and small-tripling constructions exist; finiteness and probability mass are not fields of the predicate. The new flattening theorem adds those hypotheses. |
| `Mathlib/RingTheory/Polynomial/Basic.lean:114`, `:141` | `degreeLTEquiv`, `monicEquivDegreeLT` give coefficient parametrizations; they do not count irreducibles. |
| `Mathlib/Analysis/Normed/Group/Constructions.lean:310`, `:346`; `Mathlib/Analysis/Calculus/BumpFunction/Normed.lean:32`, `:63`, `:68`, `:76` | Pi supremum norm and normalized bump, positive integral, unit integral and closed support. Finite dimension, local finiteness and positive measure on opens are available for the stated finite real coordinate space. |
| `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean:240`, `:250`; `Mathlib/NumberTheory/Bertrand.lean:222` | Character orthogonality requires a domain for the nontrivial case, supplied by ℂ; Bertrand requires a positive natural input. |
| `TauCeti/NumberTheory/ArithmeticDirichletSeries/VonMangoldt.lean:84`, `:180`; `TauCeti/NumberTheory/ArithmeticDirichletSeries/Convolution.lean:369` | Ideal Mangoldt/log bound and convolution divisor count use nonzero integral ideals. Convolution is not the pointwise product. |
| `TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Character.lean:34`, `:87` | Native fundamental-discriminant character and primitivity carry hD. The sieve adapter also covers nonfundamental discriminants and explicitly treats n=0 and modulus one. |

Object searches used `roadmaps grep` across main and open heads, the supplied sibling checkouts, board package material, and the pinned libraries. No duplicate fully qualified Lean declaration was found. Similar Selberg applications in AnalyticNumberTheoryPartI and ArithmeticStatisticsPartIII do not supply the general optimizer and finite-family interfaces here; the quadratic large sieve itself remains with AnalyticNumberTheoryPartII. ErdosProgressionPowers' maximum-row Gram theorem differs from the row-by-row denominator theorem. Fundamental-discriminant characters differ from the numerical all-discriminant adapter. These distinctions explain the retained ownership rather than relying on different theorem names.

Resolved all 16 named roadmap suppliers against their applicable main text or new-roadmap head:

| Supplier | Resolved contract |
|---|---|
| AnalyticNumberTheoryPartI | §§0.10–0.11, 0.21, 0.26, 0.31–0.32, 1.2a, 3.1, 3.3–3.4, 3.22, 3.26, 3.34–3.35; divisor subpower alone is not a reciprocal-totient moment or a growing-parameter smooth asymptotic. |
| AnalyticNumberTheoryPartII | §5.29 odd-squarefree, primitive-real and square-pair estimates, with arbitrary complex coefficients. |
| ArithmeticStatisticsPartV | §3.30 Conditional joint-spin prime bound, including every nonzero ideal in Type I and the full unit average. Saving at n=3, abs(S)=1, δ=1 is 1/5994. |
| GeometryOfNumbersAndQuadraticArithmetic | §4.1 Henk/Davenport; curvature uniformity is owned here, not inferred from that section. |
| AdelicAlgebraicGroups | §4.2 rational-point strong approximation; subgroup reduction and finite-ring inputs are owned here. |
| InverseGaloisAndArithmeticFundamentalGroups | §IG.2.5 fixed-model Lang–Weil; bounded-degree uniformity is owned here. |
| IntegralLattices | Active main `TauCetiRoadmap/IntegralLattices/README.md:507` and `:829`, Layers 0 and 3, including dyadic local forms. The older Completed introduction is not the cited layer document. |
| GlobalNumberFields | Layers 3/3C and 11; conductor-prime norm counts are additional targets here. |
| ArithmeticDirichletSeries | `Completed/ArithmeticDirichletSeries/README.md`, Layers 1, 2 and 5; norm fibres, convolution and prime-power removal. |
| ClassFieldTheory | Layer 14 cohomological Hilbert reciprocity. |
| QuadraticFormInvariants | §6C and `README.md:1999`, comparison and product-formula exports, including infinite places. |
| Chebotarev | Layer 13, `README.md:594`, natural prime count, not merely Dirichlet density. |
| ThetaSeries | §2H Kronecker symbol and discriminant character. |
| ErdosProgressionPowers | §3.1 finite Gram bound, uniform/maximal row and diagonal/off-diagonal versions. |
| Isoperimetry; RiemannianGeometry | I2 convex-body isoperimetry; R4.9.6a signed planar turning. |

The twelve historical plan gaps were also traced: reciprocal-totient moments and maximal small conductors now belong to §3.0; uniform means to §1.1; smooth tails to §1.4; curvature to §0.11; conductor counts to §0.9; Jutila's unweighted mean to §2.7; subgroup approximation, ring sum-product, flattening and uniform point counts to §5.4. The joint-spin proof strengths are consumed inside ArithmeticStatisticsPartV §3.30's stated theorem. Thus these are not twelve unstated assumptions or assertions that nonexistent supplier sections already provide the strengthened results. The transfer of ownership is recorded here; no new upward dependency is introduced.

The following 231 rows cover the individually headed mathematical targets, including definitions, the sampled sections and all Lean headlines. Each row records an actual finite, boundary or parameter computation; “consistent” means that instance does not refute the target, not that testing proves an asymptotic theorem. Zero/empty cases are identified as such. The remaining infinite arguments stay proof obligations. Locations in this table are lines of `TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md`.

| Statement and line | Instance | Values on the two sides / discriminating computation | Result / change |
|---|---|---|---|
| 166 — Weighted divisibility interchange | P=6, support 1…6, w=1, c=μ | 6−3−2+1=2; survivor indicators sum to 2 | consistent; no change |
| 178 — Exact Legendre sieve identity | P=6, support {0,1,2,3,6} | 5−3−3+2=1; only 1 survives | consistent; no change |
| 188 — Euler-product main term with signed remainder | Same population, X=6, ν(d)=1/d | main=2, signed error=−1, S=1 | consistent; no change |
| 200 — Absolute Legendre error bound | P=1, A₁=10, X=−2 | absolute error=12=abs(R₁) | consistent; no change |
| 210 — Lower sieve coefficient inequality | P=6, c=μ, support 1…6 | lower sum=2=S; c=0 gives 0≤2 | consistent; no change |
| 222 — Lower main term minus absolute remainder | P=1, A₁=10, X=−2, c₁=1 | X main−err=−14≤10; no sign assumption on X used | consistent; no change |
| 234 — Remainder bound at a coefficient cutoff | P=6, R_d=1, c=1 on d≤2, D=2 | err=2=C·(abs R₁+abs R₂); D=0 gives 0 | consistent; no change |
| 246 — First Bonferroni lower sieve bound | Support 1…6, P=6 | A₁−A₂−A₃=1≤S=2; double-divisible 6 has −1≤0 | consistent; no change |
| 260 — Weighted finite-family sieve | Two labels both value 2, weights 1 and 3 | pushed weight(2)=4; image cardinality=1 would lose mass 3 | consistent; no change |
| 287 — Divisibility sums of a weighted family | Same family; d=2 and d=0 | divisibility masses=4 and 0 on both presentations | consistent; no change |
| 297 — Sifted sums of a weighted family | Same family, P=2 versus P=1 | sifted sums=0 and 4 | consistent; no change |
| 311 — Prime divisibility of a residue label | Bad residues {1} mod2, {0} mod3; n=3 | label=6; divisibility by 2 and 3 both true; n=2 label=1 | consistent; no change |
| 323 — Simultaneous local conditions as divisibility | Same residues, d=6, n=3 | 6 divides label=6; both conditions true; n=1 label=2 fails d=6 | consistent; no change |
| 335 — Local avoidance as coprimality | Same residues, n=2 and n=3 | gcd(label,6)=1 and 6; survivor indicators 1 and 0 | consistent; no change |
| 347 — Sieve with arbitrary excluded residue classes | n=0…5, bad odd mod2 and 0 mod3 | survivors {2,4}, count 2; densities 1/2,1/3 | consistent; no change |
| 375 — Divisibility sum equals the local intersection | Same family, d=6 | local intersection {3}, mass 1; divisibility mass 1 | consistent; no change |
| 385 — Sifted sum equals the original local avoidance count | Same family | count 2; weighted label coprimality sum 2 | consistent; no change |
| 395 — Deleting empty local conditions preserves the Euler product | Add empty bad set mod5 | V=(1−1/2)(1−1/3)(1−0)=1/3 unchanged | consistent; no change |
| 405 — A fully excluded residue space leaves no survivors | Full bad set modulo2 | survivor count 0; local factor 1−2/2=0 | consistent; no change |
| 421 — Legendre error for arbitrary local residue conditions | Uniform complete residues mod6 | S=2, XV=2, every R_d=0; error0≤0 | consistent; no change |
| 441 — Vanishing Gram row detects the zero vector | y=(0,2) in ℝ | row masses0,4; zero row iff corresponding vector0 | consistent; no change |
| 451 — Gram-row bound for a finite linear combination | y=(1,2), coefficients(1,−1) | squared combination1≤3+6=9 | consistent; no change |
| 461 — Selberg's normalized projection defect bound | x=1,y=(1,2), rows(3,6) | coefficients(1/3,1/3); defect0≤1−(1/3+4/6)=0 | consistent; no change |
| 473 — Selberg's weighted inner-product inequality | x=1,y=(1,2,0) | 1/3+4/6+0/0=1=norm²x; empty family0≤1 | consistent; no change |
| 487 — Logarithmic sieve dimension | Selected prime2, g₂=1/2, κ=1,C=0 | at x=2: log2/2≤log2; empty set sum0 | consistent; no change |
| 514 — Euler-product sieve dimension | P=2,ν₂=1/2,κ=1,K=2 | product at w=2,z=3 is2≤2 log3/log2; w=z product1≤2 | consistent; no change |
| 541 — Truncated remainder mass | P=6,R=(1,−2,3,−4), D=3 | strict mass=1+2=3; inclusive would6; D=1 gives 0 | consistent; no change |
| 568 — Level of distribution of a sieve family | Family P=1,R₁=x | D eventually>1 gives mass x, ratio to x/log^A x=log^A x→∞; zero remainder gives 0 | consistent; no change |
| 595 — Coefficient error controlled by remainder mass | Same remainders, c=1 on d<3,L=1 | error3=1·remainderMass(3); D=1 forces0 | consistent; no change |
| 607 — Finite tilted density Euler product | P=6,ν(d)=1/d,a=1 | four divisor terms each1: sum4=(1+1)(1+1) | consistent; no change |
| 619 — Weighted Rankin cutoff bound | P=6,ν=1/d,x=3,σ=1 | prefix3≤3·(3/2)(4/3)=6 | consistent; no change |
| 631 — Weighted Rankin remainder-tail bound | Same data,x=3,a=1 | tail1/6≤(1/3)·4=4/3; x=6 gives 0 | consistent; no change |
| 643 — Tilted Euler-product estimate from logarithmic dimension | Empty selected set,κ=1,z=e² | product1≤K·2, e.g. K=1 | consistent; no change |
| 655 — Dimension-controlled weighted divisor count | Empty prime set,x=1,z=e²,κ=1 | prefix1≤2K; x=1/2 prefix0 | consistent; no change |
| 667 — Dimension-controlled divisor-density tail | Empty prime set,x=1,z=e² | tail0; x=1/2 tail1 versus 2K√2 | consistent; no change |
| 679 — Eratosthenes estimate with a justified mass and divisor cutoff | P=1,A={1},X=x=M=1,c=0,σ=1/2 | error0≤1; dropping divisor cutoff with mass at 0 would not justify tail vanishing | consistent; no change |
| 693 — Real discriminant character adapter | D=−3 and D=1 | χ_−3(0,1,2,3)=(0,1,−1,0); χ₁(0)=0 versus modulus-one native value1 | consistent; no change |
| 714 — Binary polynomial local densities | Q=x²,p=2,k=2 | ordinary8, singular8, corrected4; Q=0 at4:16,16,0 | consistent; no change |
| 745 — Curve lifting and singular correction | Q=2,p=2,k=1; Q=x at 2 | singular zeros4 each have0 lifts; smooth zeros2 each have2 lifts; 4·4=4·4−0 | consistent; no change |
| 755 — Binary Schwartz–Zippel specialization | Q=x over F₃; Q=3 over F₃ | ρ=3≤degree·p=3; excluded zero reduction has9>0 | consistent; no change |
| 765 — Multiplicative sieve growth class | f(n)=2^Ω(n),A=2,B=1,ε=1 | f(4)=4=min(4,4); A=1 gives 4>1; ζ(1)=1 | consistent; no change |
| 790 — Binary density correction factor | Q=x,n=6 | θ=(1+1)(1+2/3)=10/3; divisor λ sum=1+1+2/3+2/3=10/3 | consistent; no change |
| 818 — Integral local normal forms for conic counts | q=x²+xy+y² at 2; q=x²+y² at3 | mod2 unit fibre3, zero fibre1; mod3 q=1 has4 roots; half-norm matrix recovers q | consistent; no change |
| 828 — Regular-prime conic densities | q=x²+y²,D=−4,ω=1,p=3 | Q=q+4 has4 roots mod3 and12 mod9; formula3^(n−1)(3−(−1)) agrees | consistent; no change |
| 838 — Singular-prime conic density recursion | q₀=x²−y²,p=3,n=m=1 | roots5=4 smooth+1 singular; q=x²+3y²,ω=1 mod9:0 | consistent; no change |
| 850 — Uniform conic local-density bound | q=x²+y²,ω=0,p=2,n=2 | roots4≤16·2³=128; dyadic case retained | consistent; no change |
| 860 — Genus-restricted conic density sum | p=3,u=u_A=ω=1,ε=−1,k=1 | direct count18=9(2+1+1)/2; opposite final sign gives9 | consistent; no change |
| 872 — Quadratic-order ideal counts in the growth class; conductor-prime norm counts | ℤ[i] norms 1,3,5,9,25 | counts 1,0,2,1,3; 0·0≠1 at9 excludes complete multiplicativity | consistent; no change |
| 897 — Polynomial-vector sieve data | Correlated Bernoulli coefficients over F₂,F₃ | joint divisibility probability1/2≠1/4; norm(T,T²)=18; zero component norm0 | consistent; no change |
| 928 — Finite-field irreducible counts for the vector sieve | F₂,j=1,2 | irreducibles2,1; jΠ=2,2≤2,4; harmonic sum5/4≤1+log2 | consistent; no change |
| 942 — Translated lattice discrepancies | Open/closed unit disks, a=1,v=0 | counts1,5; errors π−1 and5−π; same areaπ, radius1 | consistent; no change |
| 993 — Uniform multiplicative mean values | k=6,z=4 | squarefree coprime sum1; lower comparison c log4/3; k=1,z=2 sum1 | consistent; no change |
| 1007 — Selberg denominator in dimension κ | g(p)=1/p,κ=1 | H_g=1,Γ(2)=1; z=4 sum1+1+1/2=5/2; z=1 sum0 | consistent; no change |
| 1023 — Selberg's diagonal sum in dimension one (GGPY Lemma 3, κ=1) | γ=1,W=6 | c_γ=φ(6)/6=1/3; d<4 coprime sum1; no complete multiplicativity inferred | consistent; no change |
| 1041 — Smoothly weighted diagonal sum (Maynard Lemma 6.1, GGPY Lemma 4) | γ=1,G(t)=1,z=3 | finite sum 2; main log3, integral1; G=0 gives 0=0 | consistent; no change |
| 1055 — Brun combinatorial coefficients | P=2,y=2,β=2 | λ⁺(1,2)=(1,0), λ⁻(1,2)=(1,−1) | consistent; no change |
| 1082 — Brun pointwise divisor brackets | Same coefficients,r=2 | lower0=indicator≤upper1; r=1 gives 1=1=1 | consistent; no change |
| 1094 — Brun coefficient modulus bound | Same coefficients | absolute values0 or1; no coefficient exceeds1 | consistent; no change |
| 1106 — Strict Brun coefficient support | P=2,y=3,β=2 | nonzero lower at 2 satisfies2<3; upper at 2 is0 | consistent; no change |
| 1118 — Dimension-controlled Brun main terms | P=1,X=1,K=2,u=9κ+1 | V=main⁺=main⁻=1; δ=1024, lower−1023≤1≤1025 | consistent; no change |
| 1130 — Brun fundamental sieve estimate | P=1,A₁=X=1, same parameters | remainder0; −1023≤S=1≤1025; X=0,A empty gives 0≤0≤0 | consistent; no change |
| 1150 — Selberg optimal weights | P=6,ν=1/d,z=4 | G=5/2,λ=(1,−4/5,−3/5,0), quadratic minimum2/5 | consistent; no change |
| 1176 — Selberg upper-bound sieve | P=6,A=1…6,X=6,ν=1/d,z=4 | S=2≤6/(5/2)+0=12/5; all exact remainders0 | consistent; no change |
| 1188 — Binary sieve Euler denominator | d=1,g(p)=1,z=2 | sum3/2 (inclusive), Euler factor2; permits c₁≤3/4; real degree bound requires separate extension | consistent; no change |
| 1198 — Curvature-to-area and lcm cutoff comparison | Disk R=32,θ=1,z=2 | A=1024π, z⁵R=1024, z²=4≤32√π; R=1 would32≤π, false | consistent; no change |
| 1213 — Finite-character Gram bound from lattice discrepancies | Samples(0,0),(1,0),coefficients 1,−1; moduli1,2 | character sums(0,2,0,2); total8, energy 2; error needed beyond N·energy4 | consistent; no change |
| 1239 — Binary sieve cutoff comparison | Q=x,d=1,z=4,s=2 | strict small product1, large product1/3; RHS=(2/3)C₁; s→0 version at z=1 would fail | consistent; no change |
| 1249 — Binary-form large sieve with a conservative cutoff | Q=x,empty positive-value population | S=0; main bound nonnegative; nonempty disk case uses w²≤√A from1198 | consistent; no change |
| 1255 — Binary-form large sieve on convex domains | θ=1/4,w=z^(10/13) | w^(7−2θ)=w^(13/2)=z⁵; at z=2 both equal32 | consistent; no change |
| 1265 — Binary polynomial sieve at power level | Q constant prime2,z=3 | content obstruction: positive rough count 0; retained factor0 if degree0 | consistent; no change |
| 1275 — Binary sieve with divisibility conditions | Q=x²,a=2 | gcd(2,Q/2)=1 impossible; correctedρ(2)=0; a=4 allows x≡2 mod4 andρ̃(4)=4 | consistent; no change |
| 1285 — Multiplicative decoupling inequality | g supported{1,2},g₂=1/2,ψ₂=1,Z=2 | weighted sum 2≤(1+1/2)(1+1/2)=9/4 | consistent; no change |
| 1295 — Average absorption of the density correction | Q=x,f=ζ,z=3 | corrected-density sum11/6; with θ:1+1+5/9=23/9; ratio46/33 | consistent; no change |
| 1305 — Large smooth-factor saving | Q=x,f=ζ,z=4,α=1/2,s=2 | eligible a=2,4; mass3/4 versus full25/12; ratio9/25 | consistent; no change |
| 1317 — Extremely smooth-factor saving | α=0,z=3,Q=x | threshold log3 loglog3<1; only a=1, mass 1 versus C′3^β; no log 0 | consistent; no change |
| 1327 — Binary multiplicative-function sieve | Q=x²,p=2 | ρ(4)=8,ρ̃(4)=4; normalized ordinary1/2 versus corrected1/4; R₂ replacement remains an owned proof objective | consistent; no change |
| 1339 — Binary sieve with a fixed divisor | Q=x²,k₀=6,a≤6,f=1 | shifted mass only a=6, valueφ(6)/36=1/18; all a<6 give0 | consistent; no change |
| 1358 — Short-modulus rough-point estimate | B=4096,η=1/6,a=4,θ=1 | new area256, radius bound16≤256^(5/6); 4096^ς=256^(3ς/2) | consistent; no change |
| 1390 — Binary sieve with a unit congruence | Q=x,k₀=2,k₁=1,k₂=3,ℓ=1 | original residue2 mod3; removing k₀ gives wrong residue1; quotient residue1 | consistent; no change |
| 1408 — Polynomial Bonferroni brackets | Two certain polynomial bad events | alternating sums: order0=1,order1=−1,order2=0; survivor0 bracketed | consistent; no change |
| 1418 — Brun sieve for polynomial vectors | F₂,monic degree1,exclude T | survivor probability1/2; Euler1−1/2=1/2; exact local error0 | consistent; no change |
| 1428 — Polynomial Euler product excluding T | F₂,irreducibles degree≤2 exceptT | Euler=(1−1/2)(1−1/4)=3/8; includingT wrongly gives3/16 | consistent; no change |
| 1440 — Prime upper bound in intervals | x=y=2 | prime interval count1; leading term4/log2≈5.77078; correction positive | consistent; no change |
| 1450 — Prime upper bound in progressions | k=1,a=0,x=4; k=2,a=1,x=8 | counts2 and3; base comparisons4/log4≈2.88539,8/log4≈5.77078 | consistent; no change |
| 1460 — Selberg bounds for twin primes and Goldbach | x=5; N=6,10 | twin counts2; ordered Goldbach counts1,3; local products2 and4/3 | consistent; no change |
| 1480 — Brun reciprocal convergence | Twin primes3,5 | first reciprocal sum1/3+1/5=8/15; second1/5+1/7=12/35; tail integral frome=1 | consistent; no change |
| 1490 — Selberg parity sequences | n=1,2,4,6 | Ω=0,1,2,2; Liouville=1,−1,1,1; parity population weights0/2 distinguish unit | consistent; no change |
| 1548 — Multiplicity of an integer difference | M=2,n=−2,−1,0,1,2 | pair counts0,1,2,1,0 equal max(0,2−abs n) | consistent; no change |
| 1560 — Triangular Fourier sum as a squared modulus | M=2,t=1/4 | triangular sum 2+2cos(π/2)=2; abs(1+i)²=2 | consistent; no change |
| 1570 — Sine quotient for a finite Fourier sum | M=2,t=1/4 and t=0 | sine quotient²=2; at 0 finite sum norm²=4 while totalized quotient0 | consistent; no change |
| 1582 — Piecewise taper weights and their bounds | N=1,L=2,frequencies−3…3 | W=(0,1/2,1,1,1,1/2,0); range[0,1] | consistent; no change |
| 1594 — Finite tapered Fourier vector | N=1,L=2,x=1/4 | core coordinate n=−1 is i; outside n=3 is0; norm²4 | consistent; no change |
| 1620 — Coordinates of the tapered Fourier vector | Same taper,n=2 | coordinate √(1/2)e(−1/2)=−1/√2; squared modulus1/2 | consistent; no change |
| 1632 — Untapered coordinates on the core | Same taper,n=0,1 | coordinates1,−i; weights1,1 | consistent; no change |
| 1642 — Signed Gram kernel of tapered vectors | N=1,L=1,frequency difference1/2 | signed Gram−1=(K₂−K₁)/1=0−1; abs is1 | consistent; no change |
| 1652 — Squared norm of the tapered Fourier vector | N=1,L=2 | sumweights4=2N+L; N=0,L=1 gives 1 | consistent; no change |
| 1662 — Off-diagonal tapered Gram bound | N=L=1,t=1/2 | absGram1≤1/(1·sin²(π/2))=1 | consistent; no change |
| 1672 — Tapered pairing recovers a core Fourier sum | N=L=1,a₀=1,a₁=i,x=1/4 | pairing1+i·i=0 equals Fourier sum0; opposite sign would2 | consistent; no change |
| 1684 — Large-sieve bound from cosecant row control | Same core,frequencies0,1/2,coeff a₀=1 | energies2≤(2N+L+1/L)·1=4 | consistent; no change |
| 1700 — Sine lower bound from circular distance | t=1/4 and1/2 | abs sinπt=√2/2≥1/2 and1≥1; circular distances1/4,1/2 | consistent; no change |
| 1710 — Two-point bound for circular radial bins | δ=1/4,points0,1/4,1/2,3/4 | row at 0: bin1 has2, bin2 has1; both≤2 | consistent; no change |
| 1720 — Separated cosecant-square row bound | Same points | cosecant row2+1+2=5≤4π²/3≈13.1595 | consistent; no change |
| 1730 — Explicit positive integer taper width | δ=1/2,L=2 | L+π²/(12Lδ²)=2+π²/6≈3.64493≤4 | consistent; no change |
| 1740 — Large sieve on the centered finite core | N=0, δ=1/2, frequencies 0,1/2, a₀=1 | left 2≤(0+4)·1=4 | consistent; no change |
| 1752 — Centered interval coefficient vector | H=2,L=1 | N=1; core frequencies0,1, image indices2,3 in Fin5; no collision | consistent; no change |
| 1778 — Coordinates of the centered interval vector | H=2,a=(1,i) | two padded coordinates1,i; every other coordinate0 | consistent; no change |
| 1790 — Core support of the interval vector | H=2,N=L=1 | support frequencies{0,1}⊆[−1,1]; H=0 support empty | consistent; no change |
| 1800 — Norm preservation under interval padding | Same vector | original energy1+1=2=padded energy 2 | consistent; no change |
| 1810 — Fourier translation of the padded interval | M=0,H=2,x=1/4,a=(1,1) | original i−1; centered1+i times phase i gives−1+i | consistent; no change |
| 1820 — Cardinality above the circle diameter | δ=3/4 | two distinct circle points distance≤1/2<3/4 impossible; singleton card1 | consistent; no change |
| 1830 — Bombieri's additive large sieve | H=1,a=1,δ=1/2,points0,1/2 | left2≤(1+4)·1=5; H=0 gives 0≤0 | consistent; no change |
| 1846 — Circular separation of reduced fractions | Q=3,fractions0,1/2,1/3,2/3 | minimum circular distance1/6≥1/9; Q=1 only0 | consistent; no change |
| 1856 — Additive large sieve over reduced residues | Q=2,H=1,a=1 | residues0/1,1/2 give2≤1+8=9 | consistent; no change |
| 1866 — Integer phase of the standard residue character | q=4,u=1,n=−1 | stdAddChar=−i=e(−1/4); q=1 value1 | consistent; no change |
| 1876 — Squared norm of a primitive Dirichlet Gauss sum | Primitive quadratic mod3; principal mod4 | τ=i√3,norm²3=q; imprimitive τ=0≠4 | consistent; no change |
| 1888 — Gauss expansion of a finite character sum | χ mod3,n=2,a=1 | τ(χ⁻¹)χ(2)=−i√3; exponential RHS e(2/3)−e(1/3)=−i√3 | consistent; no change |
| 1900 — Parseval identity over Dirichlet characters | q=3,F(1)=1,F(2)=2 | character energies9+1=10=φ(3)(1+4) | consistent; no change |
| 1910 — Primitive character energy at one modulus | q=3,H=1,n=1 | primitive weighted energy3/2; reduced additive energy 2; 3/2≤2 | consistent; no change |
| 1920 — Primitive-character large sieve | Q=1,H=2,a=(1,1) | left4≤(2+2)·2=8; Q=0 left0 | consistent; no change |
| 1934 — Incomplete logarithm | V=2,n=12 | incomplete log=log12−log2=log6; n=0 gives 0 | consistent; no change |
| 1961 — Subtracting the short von Mangoldt divisor sum | V=2,n=4 | log4−Σ_shortΛ=log4−log2=log2; retained prime powerΛ4=log2 | consistent; no change |
| 1971 — Vanishing below the incomplete-log cutoff | V=4,n=4 | incomplete log=log4−2log2=0; n=1 also0 | consistent; no change |
| 1981 — Pointwise incomplete-log coefficient bounds | V=2,n=12 | 0≤log6≤log12; n=0 totalized value0 | consistent; no change |
| 1991 — Möbius inversion of the incomplete logarithm | V=2,n=4 | μ-convolution gives log2=Λ4−0; n=2 gives 0=Λ2−Λ2 | consistent; no change |
| 2001 — Vaughan's identity with its boundary term | U=V=1,n=4 | Λ4=log2; RHS log4−log2=log2; n=0,1 both0 | consistent; no change |
| 2011 — Weighted Vaughan identity on a finite hyperbola | U=V=1,cutoff4,weights1 | totalΛ=log12 on both finite hyperbola expansions | consistent; no change |
| 2021 — Exact support of the bilinear Vaughan term | U=V=2,n=6 | b>2,c>2 forcesbc≥9>6: bilinear term0; n=9 includes(3,3) | consistent; no change |
| 2031 — Finite Type I–Type II Vaughan decomposition | U=V=1,n=2 | short0,TypeI log2,TypeII0; totalΛ2=log2 | consistent; no change |
| 2041 — Elementary Vaughan coefficient energies | μ on interval(1,3] | energy1+1=2 equals interval length2; incompleteλ₂ at 2=0 | consistent; no change |
| 2055 — Primitive character energy on a dyadic band | P=2,H=1,n=1 | primitive χ at3,4 contribute1/2+1/2=1≤(1+32)/2=33/2 | consistent; no change |
| 2067 — Bilinear primitive character bound on one band | Same singleton coefficient families | T=1≤33/2; distinct character sums retained | consistent; no change |
| 2079 — Exact partition of the dyadic modulus interval | R=2,J=2,c supportedq=4 | total 1, band contributions1+0=1; c at q=2 contributes0 | consistent; no change |
| 2091 — Finite sum of the bilinear dyadic coefficients | H=K=0,R=2,J=3 | left8(2+4+8)=112≤9·2·7=126 | consistent; no change |
| 2103 — Primitive bilinear tail through a dyadic endpoint | R=2, J=1, H=K=1, unit coefficients | T=1≤18+6+1/2=49/2 | consistent; no change |
| 2115 — Primitive bilinear tail at an arbitrary cutoff | R=2,Q=5,J=2 | cover5≤8≤10; RHS coefficient90+12+1=103; J=1 fails5≤4 | consistent; no change |
| 2129 — Squared finite large-sieve duality | Matrix[1 i],a=(1,−i) | output norm²4=2·energy 2; adjoint of scalar1 has energy 2=2·1 | consistent; no change |
| 2141 — Heath-Brown quadratic bilinear estimate | K=L=1,odd squarefree coefficients 1 | bilinear sum1; RHS scale1·(1+1)=2 before Cε | consistent; no change |
| 2151 — Prime-denominator quadratic symbol | a=3,p=2 and a=2,p=2 | symbol1 and0; Kronecker(3,2)=−1 is wrong adapter | consistent; no change |
| 2175 — Prime quadratic-symbol bilinear estimate | K=1,L=2,A=B=1 | sum1; RHS C(2^(1+ε)+1); A=0 forcesleft0 | consistent; no change |
| 2185 — Jutila unweighted mean square | X=3,Y=1 and2 | nonsquare discriminants{−3}; mean1 and0; added D=1 contributesY² | sound instance; add signature (R02) |
| 2199 — Jutila mean value lemma | X=8,N=2,a₂=1 | left3; square-pair main8; eighth moment1; RHS C(8+√8·2^(7/4)log⁶2) | consistent; no change |
| 2215 — Smith prime Legendre-symbol estimate | X₁={3},X₂={5} | abs(3/5)=1; RHS C(3·5^(3/4+ε)+5·3^(3/4+ε)); overlap forbidden | consistent; no change |
| 2225 — Koymans–Pagano normalized row mean | Same prime sets | normalized mean1; power3^(−1/4+c₂c₄+ε), with density hypotheses checked separately | consistent; no change |
| 2239 — Polynomial Farey coefficient adapter | F₂,ℓ=2,G=1,H=T²+T+1 | Laurent coefficients(0,1,1); numerator at degree0 would incorrectly start1 | consistent; no change |
| 2265 — Polynomial Farey large sieve | p=2,ℓ=1,m=2,f≡1 | two monic H and one coprime G each: left2≤2^0·2²=4; ℓ=m=0 gives 1=1 | consistent; no change |
| 2281 — Additive sieve for bounded integer coefficients | One integer coefficient uniform{0,1} mod2 | Fourier sums2,0; energy4=2·2; zero interval contributes0 | consistent; no change |
| 2293 — Separated Hilbert inequality | λ=(0,1),z=(1,i),δ=1 | reciprocal offdiagonal sum 2i, norm2≤2π | consistent; no change |
| 2303 — Sharp separated additive large sieve | H=1,δ=1/2,two antipodal points,a=1 | left2=(1−1+2)·1, sharp equality | consistent; no change |
| 2313 — Sharp primitive-character large sieve | Q=1,H=2,a=(1,1) | left4=(2−1+1)·2, sharp equality | consistent; no change |
| 2329 — Large sieve for forbidden residues | Interval{1,2},forbid0 mod2,Q=2,weights(1,0) | survivorZ=1,H_den=2; 1≤(2+4)/2=3 | consistent; no change |
| 2339 — Least quadratic nonresidue | p=3,5,7;invalid0,1,2 | least nonresidues2,2,3; invalidvalues0,0,0 | consistent; no change |
| 2364 — Linnik bounded exceptional primes | N=10,ε=1/2 | nonresidues2,2,3 for3,5,7 all≤√10; exceptional count 0; ε=1/4 count3 | consistent; no change |
| 2410 — Divisor moments over reciprocal totients | Q=2,j=0,1,2 | sums2,3,5; powers(1+log2)^1,^2,^4; j=0 cannot useτ=0 | consistent; no change |
| 2424 — Maximal small-conductor estimates | χ mod3,x=3,s=1 | max Mangoldt character sum=log2; zero cutoff0; principal sumψ3=log6 excluded | consistent; no change |
| 2440 — Level of distribution of the primes (Maynard (1.3)) | x=10,q=3; q=0,1 | class counts1,2,all-prime mean2: discrepancy1; default0 and modulusone0 | consistent; no change |
| 2479 — Arithmetic progression discrepancy | f=pointmass 1,x=1,q=3 | D(1)=1/2,D(2)=−1/2,sum0; nonunit pointmass2 mod2 gives 0 | consistent; no change |
| 2506 — Discrepancy to restricted character sums | f=pointmass 1,x=1,Δ=1,r=3,s=1 | twisted sum1≤2·1·1·3·1·1=6 | consistent; no change |
| 2516 — Primitive-conductor reduction of discrepancies | f=g=pointmass 1,Q=3 | discrepancy sum1/2; sole primitive r=3 term1/φ3=1/2 | consistent; no change |
| 2526 — Convolution discrepancy mean value | x=y=1,Δ=1,Q=e^t | comparison factors differ by1+t: t=10 gives 11,t=100 gives 101; not uniformly absorbable | weaker endpoint; R01 |
| 2536 — Maximal Bombieri–Vinogradov theorem | x=4,q=1 | max_y error3−log2≈2.30685; endpoint4−log12≈1.51509; supremum is not endpoint | consistent; no change |
| 2548 — Bombieri–Vinogradov: every level θ<1/2 | θ=0 versusθ<0,x≥1 | onlyq1 or empty modulus sum, respectively0; θ=1/4 cutoff grows and invokes BV | consistent; no change |
| 2562 — Weighted prime-distribution transfer | x=4,q=1 | ψ4=log12,θ4=log6; prime-power difference log2; π4=2 | consistent; no change |
| 2580 — Arithmetic discrepancy second moment | f=pointmass 1,x=1,Q=3,Δ=1 | variance at q1,2=0; q3=1/4+1/4=1/2; Ef²=1; replacement/power-two logarithmic ratio is (1+t)³: 1331 at t=10 | weaker endpoint; R01 |
| 2590 — Barban–Davenport–Halberstam theorem | x=4,Q=1 | ψ4=log12; variance(log12−4)²≈2.29550786; omittingΛ4 changes value | consistent; no change |
| 2600 — Bilinear congruence correlation | f=g=pointmass 1,x=y=1,Q=3,a=b=1,Δ=1 | congruence deviations0,0,1/2: total 1/2; both energies1; replacement/power-two logarithmic ratio is (1+t)²: 121 at t=10 | weaker endpoint; R01 |
| 2634 — Admissible tuple | H={0,2} and{0,1} | residue counts mod2=1<2 and2=2; emptyH count 0 for every prime | consistent; no change |
| 2661 — The prime k-tuples conjecture, as a named statement | H=empty and singleton{0} | every n is empty translate; singleton translates exactly primes; H={0,2} remains conjectural | consistent; no change |
| 2689 — The W-trick residue v₀ (Maynard (4.1)) | H={0,2},D₀=3,W=6 | v₀=5: gcd5,6=gcd7,6=1; v₀=1 fails gcd3,6=3 | consistent; no change |
| 2716 — Maynard's multidimensional sieve weights | k=1,W=1,R=2,y₁=1 | only r=1; λ₁=1,other λ=0; overlappingr=(2,2) rejected sinceproduct 4 nonsquarefree | consistent; no change |
| 2755 — Maynard's variational quantity M_k | k=0,1; k=2,F=simplexindicator | M0=0,M1=1; I₂=1/2,J₁=J₂=1/3,ratio4/3; zero F inadmissible | consistent; no change |
| 2799 — Smooth approximation within the simplex | k=2,η=1/10,supnormradius1/100 | total coordinate perturbation≤1/50<η; shifted interior sum remains<1 | consistent; no change |
| 2821 — Size of λ in terms of y (Maynard (5.9)) | k=1,W=1,R=2,y₁=1 | λ max=1; y_max=1; logR=log2>0; zero y gives 0 | consistent; no change |
| 2833 — Diagonal form of S₁ (Maynard Lemma 5.1) | Same weights, N=2,interval[2,4) | S₁=2; diagonalN/W·y₁²=2; noerror | consistent; no change |
| 2843 — Diagonal form of `S₂^{(m)}` (Maynard Lemma 5.2) | Same weights and interval | S₂=2 (primes2,3); m-coordinate supportd₁=1 only; g(2)=0 avoided byW | consistent; no change |
| 2855 — y⁽ᵐ⁾ in terms of y (Maynard Lemma 5.3) | k=1,y₁=1 | transformed y⁽¹⁾₁=1; nonunit coordinate components excluded | consistent; no change |
| 2865 — Asymptotic for S₁ (Maynard Lemma 6.2) | k=1,F=1 on[0,1] | I1=1; leading scaleφ(W)NlogR/W²; W=1,N=2,R=2 gives 2log2 | consistent; no change |
| 2877 — Asymptotic for `S₂^{(m)}` (Maynard Lemma 6.3) | Same F,k=1 | J1=1; leading scaleN(logR)²/logN atW=1; N=R=2 gives 2log2 | consistent; no change |
| 2889 — Maynard's asymptotics for S₁ and S₂ (Proposition 4.1) | k=2,simplexindicator | I=1/2,sumJ=2/3; leading S₂/S₁=(4/3)logR/logN; not ratio1 | consistent; no change |
| 2903 — The GPY positivity criterion | One population point with weight3 and2 prime shifts,ρ=1 | S₂−ρS₁=6−3=3>0; primecount 2>1 | consistent; no change |
| 2915 — From prime clusters to prime gaps | Primecluster{5,11},diameter6 | consecutive primegap5→7=2≤6; internal composite shifts do not break extraction | consistent; no change |
| 2927 — Primes in admissible tuples (Maynard Proposition 4.2) | k=1,M1=1,θ=1/4 | ceil(1/8)=1; k=0 gives ceil 0=0 and all n; θ restrictedpositive | consistent; no change |
| 2941 — Lower bound for M_k when k is large (Maynard Proposition 4.3(3)) | k=10⁶ | logk−2loglogk−2≈6.56393; asymptotic threshold retained, not asserted for every k | consistent; no change |
| 2953 — Moments on the simplex (Maynard Lemma 8.1, corrected) | k=2,a=0,b=0; monomialx² | volumes1/2 and1/12; correctedG₀=1,notempty sum0 | consistent; no change |
| 2965 — I_k and J_k as quadratic forms (Maynard Lemma 8.2) | k=2,F=1 andF=∂x∂y[x²y²(1−x−y)²] | firstI=1/2,sumJ=2/3; secondI=1/3150,sumJ=0; A₂ semidefinite | consistent; no change |
| 2977 — M₅ > 2 (Maynard Proposition 4.3(1)) | Four displayed polynomial terms,k=5 | I=29509/1222452000,sumJ=40493/838252800,ratio1417255/708216>2 | consistent; no change |
| 2989 — M₁₀₅ > 4 (Maynard Proposition 4.3(2)) | All42 displayed rational terms,k=105 | I≈4.035364598e−198,sumJ≈1.614365281e−197; exact ratio4.000543795842186>4 | consistent; no change |
| 3058 — Engelsma's admissible 105-tuple of diameter 600 | Displayed105 shifts | distinct count 105,diameter 600; missed residues at 2,3,5,7,11,13:1,2,1,4,7,6 | consistent; no change |
| 3070 — The first k primes above k are admissible | k=3,first3 primes>3 | {5,7,11}; misses 0 mod2,3; primes>3 have at most 3<p residue classes | consistent; no change |
| 3082 — Bounded gaps between primes (Maynard Theorem 1.3) | M105 certified ratio,θ=.49995 | θM/2≈1.0000359>1; ceil2; admissible diameter 600 | consistent; no change |
| 3094 — Gaps under Elliott–Halberstam (Maynard Theorem 1.4) | M5 ratio,θ=.9995; M105,θ=.9999 | θM5/2>1; θM105/2>2; ceilings2,3; diameters12,600 | consistent; no change |
| 3106 — m + 1 primes in bounded intervals (Maynard Theorem 1.1) | m=1 versusm=2 | growth factors e⁴≈54.5982 and8e⁸≈23847.7; n+m indexing gives 2 versus 3 primes | consistent; no change |
| 3118 — A positive proportion of admissible m-tuples are prime (Maynard Theorem 1.2) | m=1,nonempty A | every singleton has infinitely many prime shifts; count=cardA=choose(cardA,1), c=1 works | consistent; no change |
| 3132 — Bouniakowsky and Schinzel hypotheses | X²+1; X(X+1); X(X+2) | first has no fixed prime and is irreducible; second always even; third locally admissible but reducible, so irreducibility separate | consistent; no change |
| 3198 — From roughness to an almost-prime bound | n=8,z=2,N=8 | Ω=3=log8/log2; ω=1 would wrongly giveP1; n=1 givesΩ0 | consistent; no change |
| 3212 — Linear sieve functions | s=1,2,3 | f1=f2=0; F1=2e^γ,F2=e^γ,F3=2e^γ/3; f3=(2e^γ/3)log2 | consistent; no change |
| 3242 — Rosser sieve weights | d=1 andfirst prime at cubic cutoff | empty prefix λ±1=1; equalityp₁³=D failsstrict upper test | consistent; no change |
| 3269 — Rosser–Iwaniec linear sieve | s=1 versus2 | f1=f2=0; lower raw main onlylicensedat 2; sifted nonnegativity0 valid at 1 | consistent; no change |
| 3287 — Upper sifted-sum bound below s=1 | s=1/2 | F(s)=4e^γ; factor 1/s=2 timesF1; monotonicity givesupperextension | consistent; no change |
| 3303 — Beta sieve in general dimension | t=1 | β₁=2<9; at s≤2 lowerf=0; at s=3 f>0 | consistent; no change |
| 3313 — Positive lower sieve above 9t | t=1,s=10 | s>9t=9; f(10)>0; equalitys=9 not admitted by strict premise | consistent; no change |
| 3331 — Fundamental lemma for the linear sieve | Relative remainder examples | R=XV/10 givesrelative 1/10; R=X/10 withV→0 gives 1/(10V)→∞ | consistent; no change |
| 3341 — Richert logarithmic weights | N=8,α=1/4,β=1,r=1,n=8 | w₂=2/3,summand1/3>0,Ω8=3; square exception true | consistent; no change |
| 3367 — Richert weighted sieve | A={30m≤N} | g2=g3=g5=1; local margin fails and Ω≥3; small remainders do not supply P₂ | consistent; no change |
| 3383 — Richert explicit level threshold | r=2 and 3 | Λ₂≈1.834044, 1/Λ₂≈.545243; Λ₃≈2.771244, 1/Λ₃≈.360849; γ<.5 can serve 3, not 2 | consistent; no change |
| 3395 — Short character input for joint spins | χ3,intervals(0,2],(1,3]; q15,k3 | sums0,−1; reduced conductor5; k15 gives 1andisexcluded | consistent; no change |
| 3413 — Subgroup reduction images | SL₂ at 2,3 and mod 6 | cardinalities6,24,144; principal mod-2 subgroup has image 1, so 2 must divide the bad modulus | consistent; no change |
| 3423 — Uniform algebraic point counts | F₃ line and unionxy=0 | counts 3 and 5; line error 0; union 5≤C·3requires C≥5/3 | consistent; no change |
| 3433 — Squarefree-ring sum-product | A={0,1} in F₇,δ₁=δ₂=1/4 | sumset 3,product set 2,total 5; input 2<7^.75 and2>7^.25 | consistent; no change |
| 3443 — Noncommutative flattening | Uniform S₃ and A₃; pointmass | squared L² norms 1/6,1/3,1 unchanged by convolution; HH=H each case | consistent; no change |
| 3453 — Primitive affine sieve pair | O={2,3},f=identity | gcd of all values=1, but modulo 6 neither value is a unit; primewise avoidance is insufficient | consistent; no change |
| 3479 — Affine almost-prime locus and saturation | Values1,−1,8,0 | Ω of absolute value0,0,3; zero must be excluded; r=2 contains units but not 8 | consistent; no change |
| 3509 — Affine walk sieve data | One generator,labelled alphabet{g,g⁻¹,1,1},L=2 | word mass 16; two identity labels give four words among 16; the image set collapses multiplicity | consistent; no change |
| 3534 — Local densities for affine orbits | SL₂(F₃),f=top-left entry | total 24,zero locus 6,density 1/4; compare1/p=1/3, differ−1/12 | consistent; no change |
| 3555 — Fixed-modulus conditioning and walk remainders | Fixed modulus b=2,Γ=SL₂(Z),L=0,identity coset | population 1,main1/6,R₁=5/6; R₁ cannot be deleted | consistent; no change |
| 3578 — Free-word affine sieve data | Free group rank2,words≤1 | count1+4=5; unrestricted labelled length-one mass 4; populations differ | consistent; no change |
| 3592 — Affine sieve level from expansion | dimG=3,τ=1/2,δ=1/10 | τ+δdim=.8<1; endpoint δ=1/6gives 1,no power saving | consistent; no change |
| 3606 — Escape from proper algebraic subvarieties | dimG=3,ρ=1/2,L=6 | p scaleρ^(−L/3)=4; balanced errorρ^(L/3)=1/4; proper-subvariety count needs a degree bound | consistent; no change |
| 3620 — Affine sieve saturation with expansion | Same expansion parameters,t=1,s=10 | δ/s=.01,z=X^.01; lower-count scale X/logX,escapeX^.8 smaller eventually | consistent; no change |
| 3630 — Explicit affine almost-prime bound | t=1,dimG=3,d=1,τ=1/2,k=2,C=3 | threshold 54; strict R>54 admits 55, not 54 | consistent; no change |
| 3646 — Squarefree congruence expansion for SL₂ | Lazy C₂ quotient | raw adjacency eigenvalue −1 becomes0 under(1+λ)/2; one-sided raw gap does not mix parity | consistent; no change |
| 3658 — Chen switching weight | N=1000; n=11,286,3,27 | switching weights 1,0,1/2,1/2; P₂ indicators 1,0,1,0; last n is not squarefree | consistent; no change |
| 3683 — Goldbach local factor | N=6 and10 | local correction(3−1)/(3−2)=2 and(5−1)/(5−2)=4/3; p=2 omitted | consistent; no change |
| 3708 — Chen switched triple upper bound | Stated Chen coefficients | switched coefficient 3.9404; half contribution 1.9702; positivity needs lower 2.6408 | consistent; no change |
| 3720 — Chen primes with an almost-prime shift | h=2,primes≤10 | qualifying p=2,3,5,7, translates4,5,7,9 all Ω≤2; count 4 | consistent; no change |
| 3730 — Chen original-family lower estimate | Stated original-family coefficient | lower2.6408; subtract half upper 1.9702 leaves.6706>0 | consistent; no change |
| 3740 — Chen’s Goldbach theorem | N=10 | p=2,3,5,7: complements8,7,5,3; Ω(8)=3 excluded, remaining three representations | consistent; no change |
| 3752 — Quadratic ideal residue symbol adapter | K=Q,denominator(3),numerators1,2,3 | symbols 1,−1,0; unit-ideal value 1; even-norm zero extension | consistent; no change |
| 3784 — Ideal-symbol reciprocity adapter | Rational a=b=−1 | odd local product 1,dyadic sign −1,real sign −1; total 1; omitting real would −1 | consistent; no change |
| 3800 — Ideal divisor and logarithmic coefficient bounds | K=Q,ideal(12) | τ=6; Λ((4))=log2≤log4; Λ((1))=0 | consistent; no change |
| 3818 — FIMR sieve conversion to prime ideals | Zero ideal sequence, ϑ=θ=1/2 | both prime sums 0; saving (1/4)/(5/2)=1/10, exponent 9/10 | consistent; no change |
| 3828 — Equidistribution of joint spin signs | n=3,abs(S)=1,δ=1 | saving1/[54·3·37]=1/5994; one sign pattern has main term 1/2; two patterns total 1 | consistent; no change |

## Not verifiable

- BGS-10 is settled **uncertified**. Its §2 subgroup reduction, §3 affine sieve/saturation and §4 sum-product/flattening locators were reviewed as contracts, with the finite countermodels above, but the published source text was not available in the supplied legal cache. In particular, seeded target 5.4 is not source-certified. No new request was made.
- FIMR-ERRATUM-2015 and DFI-1997 are settled **uncertified**. The published erratum and DFI Lemma 9 were not independently read. FIMR-13's supplied author manuscript is a different available text; it cannot certify the erratum's exact wording.
- CHEN-73-CN, HR-SIEVE/HR-1974, RICHERT-1969 and KM-16RANK-published/KM-KERNEL-PUBLISHED remain **waived** under their existing manifest keys. Checked the available Heath-Brown, GGPY and KM supporting texts and the roadmap's numerical examples; this does not certify the unavailable original locators. No renamed source or repeat request was created.
- Consulted the supplied source cache and the package's source manifest/statuses. No paywall was bypassed and no source material was placed in the repository or reports. No additional missing source was discovered that requires an operator response.
- The source gaps below are not resolved by elaboration or finite testing. In particular, the full binary R₂ replacement and uniform shifted-divisor argument, maximal analytic distribution proof, and general affine mixing/escape chain remain substantial owned proof objectives. The report does not certify their proofs as completed.

## Source issues

The following are issues verified in the available editions, not additional roadmap findings where the roadmap already repairs or explicitly owns them. Web chapter locators have no printed page number.

- **Error** in HB-SIEVES at Example 1, p.2: the source says the survivor count is the difference of two prime counts; it should be that difference plus the unit and strict-cutoff prime correction; affects a stated result.
- **Error** in HB-SIEVES at Example 2 and the following counting equality, pp.2–3: the source says a polynomial image set has the parameter count; it should be an indexed population with fibre multiplicities; affects a stated result.
- **Error** in HB-SIEVES at Example 2 prime-pair interpretation, p.2: the source says only one prime needs the lower cutoff; it should be imposed on both complementary primes with the counting convention fixed; affects a stated result.
- **Error** in HB-SIEVES at Example 3, p.2: the source says excluding primes congruent to three modulo four characterizes primitive sums of two squares; it should also exclude divisibility by four; affects a stated result.
- **Misprint** in HB-SIEVES at the divisor-count equality, p.4: the source says the strict prime product has 2^π(z) divisors; it should count primes strictly below z; affects nothing.
- **Gap** in HB-SIEVES at Corollary 1.2 and its preceding asymptotic, p.4: the source says the displayed range alone gives the Mertens asymptotic; it should additionally require z tending to infinity; affects a stated result.
- **Misprint** in HB-SIEVES at the Goldbach correction product, p.20: the source says to include every prime divisor of the even parameter; it should exclude two from the factor with denominator p−2; affects a stated result.
- **Misprint** in HB-SIEVES at the definition of E_c and subsequent Liouville estimate, pp.24–25: the source says the unnormalized error is exp(−c√log x); it should include the multiplier x; affects a stated result.
- **Misprint** in BOMBIERI-1971 at the coefficient substitution after (4), p.402: the source says to divide by a sum of squared Gram moduli; it should divide by the row sum of first powers; affects the proof.
- **Error** in BOMBIERI-1971 at the display following K_M, p.403: the source says an inner-product modulus equals a signed kernel difference; it should take the absolute value of that difference; affects the proof.
- **Gap** in BOMBIERI-1971 at the radial-bin covering argument, p.404: the source says bins whose upper endpoint is at most one half cover the off-diagonal distances; it should retain the final partial bin and antipodal endpoint; affects the proof.
- **Error** in KED-ANT-16 at Lemma 16.5, §16.3, unpaginated: the source says its energy lower bound holds for coefficients nonzero on forbidden classes; it should first mask those coefficients and define the exponential sum accordingly; affects a stated result.
- **Misprint** in KED-ANT-16 at the CRT display in Lemma 16.5's proof, §16.3, unpaginated: the source says the second fraction is inside the first denominator; it should be a₁/q₁+a₂/q₂; affects the proof.
- **Misprint** in KED-ANT-16 at the proof of Theorem 16.7, §16.3, unpaginated: the source says (p−1)/(p+1) is asymptotic to one half; it should be asymptotic to one; affects nothing.
- **Gap** in KED-ANT-16 at the smooth-integer lower bound in Theorem 16.7, §16.3, unpaginated: the source says ordered prime tuples directly bound distinct smooth integers from below; it should control representation multiplicities and use an integer tuple length; affects the proof.
- **Error** in KED-ANT-16 at Definition 16.6, §16.3, unpaginated: the source says the least nonsquare residue is defined for every prime; it should restrict to odd primes or specify a separate value at two; affects a stated result.
- **Gap** in KED-ANT-18 at Theorem 18.3's dyadic summation, §18.1, unpaginated: the source says its block bounds sum without an extra logarithmic loss; it should provide a refined summation or retain that loss; affects the proof.
- **Misprint** in KED-ANT-18 at Theorem 18.3's small-conductor estimate, §18.1, unpaginated: the source says the product bound without the square root of x; it should retain √x from Lemma 18.2; affects the proof.
- **Misprint** in KED-ANT-18 at Corollary 18.6, §18.3, unpaginated: the source says the Δ improvement multiplies the support length of g; it should multiply the support length of f, which carries the discrepancy hypothesis; affects a stated result.
- **Misprint** in KED-ANT-18 at Theorem 18.5, §18.3, unpaginated: the source says the summand uses residue m although the sum binds a; it should use the bound residue a; affects a stated result.
- **Error** in KHAYUTIN-19 at Lemma 9.11, p.225: the source says the product comparison holds for every positive s; it should impose s≥1 for this uniform polynomial factor; affects a stated result.
- **Gap** in KHAYUTIN-19 at Lemma 9.21, (43)–(44), pp.230–231: the source says its final prime sum is uniformly bounded; it should retain the multiplicative tilt differences, since the coarse sum dominates the divergent reciprocal-prime sum; affects the proof.
- **Gap** in KHAYUTIN-19 at Lemma 9.23, p.231: the source says the two-case proof covers α=0 using log α; it should handle that endpoint separately; affects the proof.
- **Gap** in KHAYUTIN-19 at Theorem 9.7, (47), p.233: the source says the corrected-density assumption gives the ordinary prime-power estimate used for R₂; it should supply a separate argument at the stated hypotheses; affects the proof.
- **Error** in KHAYUTIN-19 at Proposition 9.25, terminal density identity, p.236: the source says the unrestricted sum of quotient densities equals the shifted corrected density; it should distinguish primes dividing the fixed divisor but not the residual variable; affects the proof.
- **Gap** in KHAYUTIN-19 at Proposition 9.25, scaled-domain hypotheses, pp.235–236: the source says a curvature bound by scaled area suffices; it should retain the power 1−3η required by Theorem 9.7; affects the proof.
- **Misprint** in MAYNARD-2015 at Lemma 8.1, p.409: the source says the defining sum starts at one also in degree zero; it should set the degree-zero polynomial to one; affects a stated result.
- **Misprint** in MAYNARD-2015 at (8.10), p.411: the source says the factorial denominator uses k+b+c−1; it should use k+b+2c−1; affects the proof.
- **Error** in MAYNARD-2015 at the matrix-positivity assertion after Lemma 8.2, p.411: the source says both quadratic forms are positive definite; it should allow the numerator to be positive semidefinite and require an independent denominator basis; affects the proof.
