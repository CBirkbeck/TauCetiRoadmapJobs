# Repair report

The first eleven finding sections follow review a (F01–F11); the next four follow review b (F01–F04). Cross-references use a-F… and b-F… to distinguish repeated identifiers. Overlapping ownership and kernel issues have one mathematical resolution and a separate verdict for every finding.

## F01 (P2) — applied

Absent polynomial Farey headline → `SievePolynomialFarey.coefficient` and `SievePolynomialFarey.large_sieve`, on native polynomials and power series. Native `Polynomial.ofFn` enumerates the full degree-bounded range, including zero at degree zero. README §2.8 names both declarations and computes the two binary words, the indicator equality, and 0/1. Evidence: BSKK-23 lines 1832–1865, Lemma 6.2.

## F02 (P1) — applied

Unregistered Jutila input → gap:jutila-unweighted-mean-square, owned by AnalyticNumberTheoryPartII §5.29, in both supplier contracts and the plan. Divisor inputs now cite AnalyticNumberTheoryPartI §§3.22 and 1.2a. The scanned Lemma 2 has log⁸ X; Lemma 3 has log⁶ N. Updated §2.7 and Layer 2 requirements accordingly. Evidence: JUTILA-ORIGINAL lines 111–159, printed pp.194–195.

## F03 (P2) — applied

“Coprime cofactor” → unrestricted cofactor s=q/r with the exact coprimality mask. The modulus-4 character inflated to modulus 8 has r=4,s=2, values 1,−1,0 at 1,3,2. Layer 3’s analytic requirements and Examples now retain this case; §3.2 already allowed it. All-cofactor moment and small-conductor contracts remain required.

## F04 (P3) — applied

§1.4’s forward local dependencies → Euler denominator, curvature comparison, Gram estimate, cutoff comparison, conservative theorem, full theorem, consequences. The conservative theorem now states its count, hypotheses and constant dependence directly. At θ=1/4, b=13/2, w=z^(10/13), so w^b=z⁵ and s=b/5=13/10. No cutoff is weakened.

## F05 (P3) — applied differently

README-only Checks now compute every bundled Maynard quantity, the empty and two-component polynomial norms, both linear sieve functions at three arguments, and saturation/least-index examples. No acceptance padding was added. The kernel’s repeated-law Checks disappear with its duplicate construction; its distinct cubic values are retained under the supplier contract. Full numerical computations appear below.

## F06 (P1) — applied

Local quadratic foundation and reconstruction → AnalyticNumberTheoryPartII §5.29 supplier contract. Deleted `SieveQuadratic.quadratic_largeSieve`; repointed the unrestricted bilinear consequence and Layer 2 analytic requirements. The prime-denominator adapter and applications remain. The supplier’s README §5.29 and `quadratic_large_sieve` include arbitrary complex coefficients, both odd-squarefree ranges and 1. Its 0-versus-4 sign witness is retained in the contract.

## F07 (P1) — applied

Duplicate joint-spin setup, unit average, tails, kernel, Type I/II and prime cancellation → ArithmeticStatisticsPartV §3.30 import. Equidistribution consumes that theorem. General character transfer, ideal-symbol comparison, coefficient bounds and arbitrary-sequence FIMR conversion remain, with their differences stated. Two geometry gaps move into gap:joint-spin-proof-strengths under the chain’s owner; their mathematical obligations are retained. No supplier implementation was edited.

## F08 (P3) — applied

Quantitative PNT at §§0.10–0.11 → §0.32 at q=1; fixed-interval primes and logarithmically weighted primes remain at §§0.10 and 0.11. Undeclared `smoothCount_rankin` → §3.35 by title. Corrected the Maynard PNT use and individual analytic dependencies throughout. Supplier statements were read at their open heads; §0.32 gives the required saving, and §3.35 retains x≥1,y≥2,σ>0.

## F09 (P2) — applied

Absent general Brun test → `SieveBrun.fundamental_estimate`, using the native sieve, its actual prime factors, product dimension and strict remainder mass. Its two simple definitions are named in §0.5. The statement retains X≥0, κ>0,K>1,y>1,u≥9κ+1 and every prime below y^(1/u). README computes δ=1024 and δ≈0.04649, including the lower minus sign and R₁.

## F10 (P2) — applied differently

Unavailable-headline assertion → `SieveRealCharacters.discriminantValue` with a finite prime-factor body and `SieveQuadratic.jutila_mean_value`. ThetaSeries §2H still owns character theory and the comparison. The proposed log⁵ N factor is replaced by the source’s log⁶ N, read directly in scanned (12), printed p.194. The same correction covers §2.7, the module docstring and Layer 2 requirements; Smith’s ε-absorption is unchanged.

## F11 (P1) — not actionable in this package: the kernel is owned by ArithmeticStatisticsPartV §3.30

The false arbitrary-element residue-only law was deleted with the duplicate kernel under a-F07. Gap:joint-spin-proof-strengths requests the owner’s dyadic/infinite-place comparison, and the README records the cubic negative control and zero-kernel case. This package cannot edit the supplier’s kernel or its proof. KM-21 lines 1238–1276 are used on positive generator domains; FIMR-13 Lemma 2.1 retains the infinite factors.

## F01 (P1) — applied differently

Dangling “bombieri-row-bound” → ErdosProgressionPowers §3.1 uniform Gram-row inequality. The ownership/upward premise is disputed at the revisions specified in this brief: `TauCetiRoadmap/ErdosProgressionPowers/README.md:1278`–1306 states all three bounds. The supplied order places ErdosProgressionPowers at 263, this roadmap at 264 and ProbabilisticAndMetricNumberTheory at 265. Thus the existing owner is retained; no duplicate corollaries or consumer edits were added.

The head’s §3.1 explicitly states the maximum-row bound, the nonnegative uniform-row version including an empty family, and the diagonal/off-diagonal separation. Its Checks include orthogonal and repeated unit vectors. The final dependency check has no UPWARD or CYCLE line. The review’s EP.0–EP.7 package witness describes a different revision, not the supplied open head.

## F02 (P3) — applied

The repeated five-section/two-gap string → inputs selected separately for every affected target and layer summary. Definition-only level data use native carriers; λ-size uses §0.21; Goldbach’s product uses pinned summability/product declarations; conductor transfers retain only their needed moment powers; the general denominator retains uniform-wirsing. Also corrected the matching prose, Maynard y⁽ᵐ⁾ dependency, and layer summaries. No copy of that string remains.

## F03 (P3) — applied

DFI-1997 authors “Duke” → “W. Duke, J. Friedlander, H. Iwaniec”, agreeing with the existing reference and DOI identity. The manifest key, locator, and settled uncertified status are preserved. No source was requested again.

## F04 (P3) — applied

“Routed equation (7.11)” → “equation (7.11)” in the normalized Koymans–Pagano row mean. Searched the whole roadmap; that was the only occurrence. The mathematical hypotheses and conclusion are unchanged.

## Verification and ownership record

Read the main-branch ThetaSeries, IntegralLattices and completed ArithmeticDirichletSeries roadmaps for shape and ownership. Re-resolved every cross-roadmap citation against main or its applicable open head, and read the supplier sections used by the repairs. In particular: AnalyticNumberTheoryPartI §§0.10–0.11, 0.21, 0.26, 0.32, 1.2a, 3.22, 3.26 and 3.34–3.35; AnalyticNumberTheoryPartII §5.29; ArithmeticStatisticsPartV §3.30; ErdosProgressionPowers §3.1; ThetaSeries §2H; IntegralLattices Layers 0/3; GlobalNumberFields Layers 3/3C/11; ArithmeticDirichletSeries Layers 1/2/5; QuadraticFormInvariants §6C; ClassFieldTheory Layer 14; Chebotarev Layer 13; GeometryOfNumbersAndQuadraticArithmetic §4.1; AdelicAlgebraicGroups §4.2; InverseGaloisAndArithmeticFundamentalGroups §IG.2.5; Isoperimetry I2; RiemannianGeometry R4.9.6a.

Ownership searches used `roadmaps grep` by object across main and open roadmap heads, board-package searches, and searches of the pinned libraries. There is no competing polynomial Farey, Jutila or general Brun headline in those results. The new numerical adapter specializes the existing Jacobi/factorization data; it does not own Kronecker character theory. The unrestricted ideal prime-extraction interface has arbitrary bounded coefficients and explicit analytic hypotheses, unlike the supplier’s fixed joint-spin application. Existing geometry prerequisites are requested from the imported chain’s owner rather than silently assumed. No later-supplier notion was introduced.

Pinned definitions inspected: `BoundingSieve` in `Mathlib/NumberTheory/SelbergSieve.lean:53`–74 has nonnegative weights and strict prime densities, but no positivity or normalization for totalMass. `jacobiSym` in `Mathlib/NumberTheory/LegendreSymbol/JacobiSymbol.lean:86`, `Nat.primeFactors` in `Mathlib/Data/Nat/PrimeFin.lean:37`, and `Nat.factorization` in `Mathlib/Data/Nat/Factorization/Defs.lean:50` supply the numerical adapter. `Polynomial.ofFn` and its degree/injectivity theorems are in `Mathlib/Algebra/Polynomial/OfFn.lean:44`, 85, 103; `Polynomial.reverse` is in `Mathlib/Algebra/Polynomial/Reverse.lean:217`; `PowerSeries.invOfUnit` and its multiplication theorem are in `Mathlib/RingTheory/PowerSeries/Inverse.lean:82`, 100. Inversion needs the monic denominator’s constant reverse coefficient 1. All these names and the new product/summability citations elaborate at the pins.

The cached Jutila PDF was visually read at printed pp.194–195 after decoding its existing page image. Lemma 2 has log⁸ X, and Lemma 3 (12) has log⁶ N. The same source key now records both locators. No new source, duplicate key, access request or unsettled missing reference was added; waived and uncertified works keep their settled statuses.

## Adversarial mathematics pass

The tables record instances and computed quantities, not proofs of the analytic theorems. C denotes the positive constant quantified by the relevant bound; an inequality involving C records a necessary boundary condition, not a choice proving a uniform theorem. Source-level proof requirements and supplier gaps remain explicit. Rows are in README order, one per named statement, with extra rows for bundled acceptance definitions and supplier conventions. “Retained” means the computed instance is consistent and the statement was not changed.

### Roadmap statements

| Statement | Instances tried | Values computed | Result and change |
| --- | --- | --- | --- |
| 1. Weighted divisibility interchange. | P=1, one unit-weight label, c(1)=−2; empty support | −2=−2; 0=0 | Retained; signed coefficients allowed. |
| 2. Exact Legendre sieve identity. | P=6, labels 1,…,10; labels 0,1,2,3,6 | 10−5−3+1=3; 5−3−3+2=1 | Retained; zero label contributes before sifting. |
| 3. Euler-product main term with signed remainder. | P=1,A₁=10,X=7; P=6 | 10=7+3; error signs R₁−R₂−R₃+R₆ | Retained; no mass normalization. |
| 4. Absolute Legendre error bound. | P=1,A₁=10,X=7; equal masses | 3≤3; 0≤0 | Retained. |
| 5. Lower sieve coefficient inequality. | P=6,c=μ, labels 1,…,10 | Weighted divisor sum=3=S; r=6 gives 0≤0 | Retained. |
| 6. Lower main term minus absolute remainder. | P=1,c(1)=1,A₁=10,X=7 | 7−3=4≤10 | Retained; error absolute. |
| 7. Remainder bound at a coefficient cutoff. | P=6,D=2,C=1,R_d=1, c supported at 1,2 | errSum=2≤2; D=0 and c=0 give 0≤0 | Retained inclusive cutoff. |
| 8. First Bonferroni lower sieve bound. | Labels 1,…,10,P=6 | 10−5−3=2≤S=3 | Retained. |
| 9. Weighted finite-family sieve. | Two indices both labelled 2 with weights 1,3; empty index | Pushforward weight=4, mass=4; empty mass=0 | Retained multiplicities. |
| 10. Divisibility sums of a weighted family. | Same labels, d=2,1,0 | Divisibility sums=4,4,0 on both sides | Retained. |
| 11. Sifted sums of a weighted family. | Same labels, P=2 then P=1 | Sifted sums=0 then 4 on both sides | Retained. |
| 12. Prime divisibility of a residue label. | Q={2}, bad residue 1, a=3 then 2 | Labels=2 then 1; divisibility and bad membership both true then false | Retained both directions. |
| 13. Simultaneous local conditions as divisibility. | Q={2,3}, bad residues 0, a=6, d=6 then 1 | Label=6; both conditions true for 6; empty condition true for 1 | Retained; d=5 excluded. |
| 14. Local avoidance as coprimality. | Same data, a=1 then 2 | gcd(6,1)=1 with no bad residues; gcd(6,2)=2 with one bad residue | Retained both directions. |
| 15. Sieve with arbitrary excluded residue classes. | Q={2}, bad residue 1, labels 1,2, weights 1 | P=2,ν(2)=1/2,A₁=2,A₂=1,S=1 | Retained nonzero excluded class. |
| 16. Divisibility sum equals the local intersection. | Same sieve,d=1,2 | Both local intersection sums=2,1 | Retained. |
| 17. Sifted sum equals the original local avoidance count. | Same sieve | Both avoidance and sifted sums=1 | Retained. |
| 18. Deleting empty local conditions preserves the Euler product. | Q={2,3}, Ω₂ empty, Ω₃={0} | Both Euler products=2/3 | Retained empty-condition deletion. |
| 19. A fully excluded residue space leaves no survivors. | Q={2}, Ω₂={0,1}, labels 1,2 | Survivor sum=0 for either label and arbitrary weights | Retained; no strict-density carrier constructed. |
| 20. Legendre error for arbitrary local residue conditions. | One odd bad class at 2, labels 1,2,X=2 | S=1, main=1, both remainders=0; 0≤0 | Retained. |
| 21. Vanishing Gram row detects the zero vector. | Real y=0 then y=2 | r=0 iff y=0; r=4≠0 when y=2 | Retained both directions. |
| 22. Gram-row bound for a finite linear combination. | y=(1,1),c=(1,1); c=(1,−1) | 4≤4; 0≤4 | Retained dependence and cancellation. |
| 23. Selberg's normalized projection defect bound. | x=1,y=2; x=1,y=i | c=1/2 then −i; defect=0 and right side=0 in both | Retained conjugation. |
| 24. Selberg's weighted inner-product inequality. | x=1,y=(1,2); empty family; y=1/2 | 1/3+4/6=1; 0≤1; weighted term=1 but squared denominator would give 4 | Retained headline. |
| 25. Logarithmic sieve dimension. | Empty P,κ=C=0; κ=0,C=−1 | 0≤0 true; 0≤−1 false | Retained negative control. |
| 26. Euler-product sieve dimension. | Zero density,κ=0,K=1; P={2},g(2)=1/2,w=2,z=3 | 1≤1; interval product=2 and log ratio=log3/log2 | Named native-sieve specialization; endpoints preserved. |
| 27. Truncated remainder mass. | P=6,R_d=1,D=1,2,3,6,7 | Masses=0,1,2,3,4; R₂=1,R₃=−1 give absolute contribution 2 | Named definition; no cancellation. |
| 28. Level of distribution of a sieve family. | Constant P=1 family with A₁=X=1; same with A₁=2,X=1 | R=0 in first family; persistent R₁=1 defeats arbitrary logarithmic saving in second | Retained quantifiers and positive θ. |
| 29. Coefficient error controlled by remainder mass. | P=1,D=2,c(1)=−2,R₁=3,L=2 | errSum=6≤2·3=6 | Retained. |
| 30. Finite tilted density Euler product. | P=2,ν(2)=1/2,a=0 then 1 | 1+1/2=3/2; 1+1=2 on both sides | Retained. |
| 31. Weighted Rankin cutoff bound. | Same sieve,x=2,σ=1 | Σdν(d)=2≤2(1+1/2)=3 | Retained. |
| 32. Weighted Rankin remainder-tail bound. | Same sieve,x=1,a=1; x=2 | Tail=1/2≤2; tail=0≤1 | Retained strict tail. |
| 33. Tilted Euler-product estimate from logarithmic dimension. | g=0,κ=1,C=0,z=e² | Product=1≤K·2, compatible with K=1 | Retained asymptotic input boundary. |
| 34. Dimension-controlled weighted divisor count. | Same zero-prime family,P=1,x=2,z=e²,κ=1 | Prefix=1≤2·2·exp(−log2/2)=2√2 for K=1 | Retained. |
| 35. Dimension-controlled divisor-density tail. | Same data,x=2 then x=1/2 | Tails=0 then 1; majorants=√2 then 2√2 | Retained. |
| 36. Eratosthenes estimate with a justified mass and divisor cutoff. | P=1,A₁=X=1,x=2,c=0,M=1,σ=1/2 | Error=0≤√2 | Retained; cutoff and mass assumptions satisfied. |
| 37. Real discriminant character adapter. | D,n=(5,2),(8,2),(8,3),(1,0),(1,1) | Values=−1,0,−1,0,1; negative D=−3 gives χ(2)=−1 | Finite body added; zero extension and dyadic sign preserved. |
| 38. Binary polynomial local densities. | Q=x over F₃; Q=x²+3 over F₃ | ρ(3)=3, corrected=3 in both; first has 3 smooth zeros, second 3 nonlifting zeros | Retained; correction includes both classes. |
| 39. Curve lifting and singular correction. | Those two polynomials,p=3,k=1 | 9·3=9·3−0=27 in each; smooth lifts=3 each in first, nonlifting lifts=0 in second | Retained lift multiplicities. |
| 40. Binary Schwartz–Zippel specialization. | Q=x,p=3; Q=0 | ρ=3≤3·1; zero polynomial has ρ=9 and is excluded | Retained nonzero reduction. |
| 41. Multiplicative sieve growth class. | f=ζ on positive integers,A=B=1,ε=1 | f(12)=1=min(1,12); f(0)=0 | Retained native zero convention. |
| 42. Binary density correction factor. | Q=x,p=3,k=1 | θ(3)=5/3, λ(3)=2/3, (ζ∗λ)(3)=1+2/3 | Retained convolution normalization. |
| 43. Integral local normal forms for conic counts. | q=x²+xy+y² and x²+xy+2y² at 2 | D=−3≡5 mod8 versus D=−7≡1 mod8; their local models are the nonsplit form and xy | Retained distinct dyadic branches. |
| 44. Regular-prime conic densities. | q=x²+y²,ω=1,p=3,n=1,2; q=x²+xy+y²,p=2 | Counts=4,12; dyadic count=3=2−χ_(−3)(2) | Retained signs. |
| 45. Singular-prime conic density recursion. | p=3,q₀=x²−y²,n=m=1; q=x²+3y²,ω=1,n=2 | 5=4 smooth+1 singular; shifted conic count=0 | Retained recursion and plus sign. |
| 46. Uniform conic local-density bound. | q=x²+y²,ω=1,p=3,n=1 | 4≤16·3^(3/2)≈83.138 | Retained uniform bound. |
| 47. Genus-restricted conic density sum. | p=3,u=u_A=ω=1,ε=−1,k=1 | Sum=18=9(2+1+1)/2; wrong sign gives 9 | Retained. |
| 48. Quadratic-order ideal counts in the growth class. | Maximal order Z[i],n=1,5,25 | Ideal counts=1,2,3; multiplicativity cannot be inferred at the same prime | Dependency narrowed to divisor subpower plus conductor-count gap. |
| 49. Polynomial-vector sieve data. | Empty vector; T³ over F₂; (T over F₂,T² over F₃); zero component | Norms=1,8,18,0; correlated Bernoulli divisibility=1/2 versus 1/4 | Added missing norm evaluations. |
| 50. Finite-field polynomial counts for the vector sieve. | F₂,degree 0,1,2 | Monic counts=1,2,4; irreducible counts at 1,2 are 2,1; 2Π₂=2≤4 | Retained. |
| 51. Selberg's diagonal sum in dimension one (GGPY Lemma 3, κ=1). | γ(p)=1,z=4 | Strict diagonal sum=1+1+1/2=5/2; cγ=1 and leading term log4 | Removed unrelated gaps; finite value leaves the stated error. |
| 52. Smoothly weighted diagonal sum (Maynard Lemma 6.1, GGPY Lemma 4). | Same γ,G=0 then G=1,z=4 | Sums=0 then 5/2; integrals=0 then 1 | Removed unrelated gaps; smooth weighting retained. |
| 53. Brun combinatorial coefficients. | P=6,y=4,β=2; P=2,y=8 | λ⁺=(1,0,0,0), λ⁻=(1,−1,−1,0); equality 2³=8 fails strict prefix | Retained. |
| 54. Brun pointwise divisor brackets. | P=6,r=6 with preceding coefficients | −1≤0≤1; r=1 gives 1=1=1 | Retained. |
| 55. Brun coefficient modulus bound. | Selected d=2; unselected d=6 | Moduli=1,0≤1 | Retained. |
| 56. Strict Brun coefficient support. | P=6,y=4,z=4; isolated prime 5 without prime cutoff | Selected lower divisors 1,2,3<4; λ⁻(5)=−1 would violate support | Retained cutoff hypothesis. |
| 57. Dimension-controlled Brun main terms. | P=1,κ=1,K=2,u=10 then 20 | V=V⁺=V⁻=1; δ=1024 then 0.0464895281 | Retained lower minus sign. |
| 58. Brun fundamental sieve estimate. | Same data,X=S=1,R₁=0; X=0,A₁=1 | −1023≤1≤1025; 0.953510472≤1≤1.046489528; −1≤1≤1 | Added headline and discriminating Checks. |
| 59. Selberg optimal weights. | P=2,ν(2)=1/2,z=2 then 3; P=6,z=4 | G=1 then 2, λ₂=0 then −1; G=5/2,λ₂=−4/5,λ₃=−3/5 | Retained strict diagonal mass. |
| 60. Selberg upper-bound sieve. | P=1,A₁=10,X=7,z=2 | S=10≤7+3=10 | Retained R₁ in headline. |
| 61. Binary sieve Euler denominator. | g(p)=0,z=2,d=1 | Squarefree sum=1 and Euler product=1; c₁ must be≤1 | Dependency now names only squarefree lower mean and Mertens input. |
| 62. Curvature-to-area and lcm cutoff comparison. | Circle R=32,θ=1,z=2; unrelated R=10⁻⁸,A=10⁸,z=120 | 1024≤1024π,4≤32√π; false surrogate gives 14400>10000 | Retained geometry; reordered before consumers. |
| 63. Finite-character Gram bound from lattice discrepancies. | w=1,constant coefficients on N points; two points at moduli 1,2; θ=1/4 | N²=N·N; energy sum=8, coefficient energy=2; w^(13/2)=z⁵ | Retained ErdosProgressionPowers supplier. |
| 64. Binary sieve cutoff comparison. | s=1; Q=x,d=1,z=2; s=13/10 | Both products identical at s=1; products=1 at z=2; z^(1/s)=z^(10/13) | Moved before both consumers; only Mertens dependency. |
| 65. Binary-form large sieve with a conservative cutoff. | Open radius-32 disk,Q=x,θ=1,z=2 | Positive-value population=1571, A=1024π≈3216.99, product=1; lcm cutoff 4≤√A | Moved and made self-contained; bound requires C≥1571/(1024π). |
| 66. Binary-form large sieve on convex domains. | Same disk; θ=1/4,b=13/2,w=z^(10/13) | 1571≤C·1024π; R^θw^b=R^θz⁵; s=13/10 | Full range retained, with prerequisites preceding it. |
| 67. Binary polynomial sieve at power level. | Same disk,η=1/4,ς=1,z=2 | 32≤(1024π)^(3/4); count=1571, product=1 | Retained; θ range unchanged. |
| 68. Binary sieve with divisibility conditions. | Same disk,Q=x,a=1 | Corrected density ρ̃(1)=1, quotient unchanged; count=1571≤C·1024π | Retained scaling/unit boundary. |
| 69. Multiplicative decoupling inequality. | g=δ₁,ψ=δ₁,Z=2 | Left sum=1; base sum=1 and correction product=1 | Retained finite nonnegative expansion. |
| 70. Average absorption of the density correction. | f=δ₁,Q=x,z=2 | Both corrected and uncorrected sums=1; C′≥1 | Only p-series convergence remains as analytic input. |
| 71. Large smooth-factor saving. | f=δ₁,z=4,α=s=1,κ=1/2,r=1,ε=1/10 | Restricted tail=0; total=1, upper bound=C′e^(−1/2) | Retained parameter inequality 1/2≤0.9log4/2. |
| 72. Extremely smooth-factor saving. | Q=x,α=0,z=e^e,β=1 | Allowed values 1,2,4,8 give 15/8; upper bound=C′e^e | Retained fixed-α convention; smooth-tail gap stays. |
| 73. Binary multiplicative-function sieve. | f=δ₁,Q=x on open radius-32 disk,z-range X=32 | Only x=1 contributes 63 points; density sum=1; bound=C′A times the stated prime product | Retained full target and explicit R₂ proof requirement. |
| 74. Analytic proof requirement. | Q=x²,p=3 | Ordinary ρ(9)=27; corrected ρ̃(9)=18, while ρ̃(3)=0 | Retained demonstration that ordinary and corrected inputs differ. |
| 75. Binary sieve with a fixed divisor. | k₀=1 in fixed-divisor theorem | A/k₀²=A,R/k₀=R,X/k₀=X; both counts identical | Retained strengthened rescaled hypothesis. |
| 76. Binary sieve with a unit congruence. | k₀=2,k₁=1,k₂=3,ℓ=1 | Q≡2 mod6 reduces to Q≡2 mod3; dropping k₀ would give 1 | Retained corrected residue transport. |
| 77. Polynomial Bonferroni brackets. | Candidate divisor count B=2,v=1; B empty,v=0 upper | Odd bracket=1−2=−1≤0; even bracket=1−2+1=0; empty upper=1 | Retained unordered subsets. |
| 78. Brun sieve for polynomial vectors. | Empty prime-label vector; one component with empty candidate set,D=1 | Probability=1; main bound=1 in empty vector, 2 in one component | Retained joint law; no independence. |
| 79. Polynomial Euler product excluding T. | p=2,m=0 then 1 | Products=1 then 1/2; upper bounds=2 then 1 | Retained T-only omission. |
| 80. Prime upper bound in intervals. | x=y=2 | Prime interval count=1; leading majorant=4/log2≈5.771 | Dependencies now diagonal sum and harmonic divisor count. |
| 81. Prime upper bound in progressions. | k=1,x=4; k=2,a=1,x=8 | Counts=2,3; majorants=4C/log4,8C/log4 | Uniform progression denominator input retained; unrelated gaps removed. |
| 82. Selberg bounds for twin primes and Goldbach. | Twin count x=3; Goldbach N=4 and 6 | Counts=1,1,1; Goldbach corrections=1,2 | Retained odd-prime local product and even domain. |
| 83. Brun reciprocal convergence. | Twin pairs (3,5),(5,7) | Reciprocal pair masses=8/15 and 12/35; tail integral ∫_e^∞dt/(t log²t)=1 | Retained convergence route. |
| 84. Selberg denominator in dimension κ. | g=μ²/n,z=4 and 1 | Diagonal=5/2 then 0; H_g=1; omitting μ² gives 1/2 at each 2^a3^b | Only normalized mean-value gap retained. |
| 85. Selberg parity sequences. | n=0,1,4,12; support≤10,z=4 | Weights (even,odd)=(0,0),(1,0),(1,0),(0,1); sifted masses=1,2 | Retained multiplicity parity. |
| 86. Multiplicity of an integer difference. | M=3,n=−1,3; M=0,n=0 | Pair counts=2,0,0 | max(0,M−abs n) matches. |
| 87. Triangular Fourier sum as a squared modulus. | M=0,1,2,t=0 | Fourier triangular sums=0,1,4=K_M(0) | Retained unnormalized kernel. |
| 88. Sine quotient for a finite Fourier sum. | M=2,t=1/2; M=1,t=1/2; M=3,t=0 | Ratios squared=0,1; actual K=9 at excluded zero denominator | Retained denominator hypothesis. |
| 89. Piecewise taper weights and their bounds. | N=1,L=2,n=1,2,3; L=0 | Weights=1,1/2,0; totalized zero-width formula=0 | Retained. |
| 90. Finite tapered Fourier vector. | N=L=1,x=1/4,frequency −1; N=0,L=2 | Coordinates=i; squared modulus at −1=1/2 | Retained square root and negative phase. |
| 91. Coordinates of the tapered Fourier vector. | Same vector,frequencies −1,0,1 | Coordinates=i,1,−i | Retained coordinate law. |
| 92. Untapered coordinates on the core. | N=L=1,core frequencies −1,0,1 | Weights=1,1,1, so untapered coordinates=i,1,−i | Retained. |
| 93. Signed Gram kernel of tapered vectors. | N=L=1,phase difference 1/2 | Signed kernel=(K₂−K₁)/1=−1; norm=1 | Retained absolute value. |
| 94. Squared norm of the tapered Fourier vector. | N=L=1; N=0,L=2 | Norm squares=3=2N+L; 2=2N+L | Retained. |
| 95. Off-diagonal tapered Gram bound. | N=L=1,t=1/2 | Norm=1≤1/(L sin²πt)=1 | Retained nonzero sine. |
| 96. Tapered pairing recovers a core Fourier sum. | x=1/4,f supported at frequency −1 with value 1 | Pairing=−i=e(−1/4) | Retained first-slot convention. |
| 97. Large-sieve bound from cosecant row control. | One frequency,N=0,L=1,f₀=1,C=0 | Left=1,right=1·(0+1+0)=1 | Dangling row-bound citation corrected; native supplier kept. |
| 98. Sine lower bound from circular distance. | t=1/2,0,1/4 | Sines squared=1,0,1/2; 4d²=1,0,1/4 | Retained. |
| 99. Two-point bound for circular radial bins. | δ=3/10,points 0,2/5; antipodal pair 0,1/2 | 2/5 belongs to final partial bin [3/10,3/5); antipode counted once | Retained boundary bin. |
| 100. Separated cosecant-square row bound. | Two points 0,1/2,δ=1/2; singleton | Row=1≤π²/3≈3.290; singleton row=0 | Retained. |
| 101. Explicit positive integer taper width. | δ=1/2 then 3/10; δ=2 excluded | L=2,3; L+C/L≈3.645,6.046≤4,6.667; excluded L=0 | Retained positive taper. |
| 102. Large sieve on the centered finite core. | N=0,one unit coefficient,δ=1/2 | Left=1≤4; ambient length=2L+1=5 | Retained ambient width. |
| 103. Centered interval coefficient vector. | H=2,L=1,a=(a,b); H=3,L=1 | Vectors=(0,0,a,b,0),(0,a,b,c,0) | Retained endpoint padding. |
| 104. Coordinates of the centered interval vector. | H=2,L=0,a=(1,2) | Coordinates=(0,1,2) | Retained evaluation rule. |
| 105. Core support of the interval vector. | H=2,L=1 | Occupied frequencies=0,1; frequency −1 has coefficient 0 | Retained core support. |
| 106. Norm preservation under interval padding. | H=2,L=1,a=(1,2) | Padded and original energies=1+4=5 | Retained norm preservation. |
| 107. Fourier translation of the padded interval. | H=2,M=0,a=(1,0),x=1/4 | Original sum=i; centered sum=1 and translation phase=i | Retained phase direction. |
| 108. Cardinality above the circle diameter. | δ=3/4; two proposed frequencies 0,1/2 | Distance=1/2<3/4, so two labels excluded; singleton cardinality=1 | Retained circle diameter boundary. |
| 109. Bombieri's additive large sieve. | H=0; H=1,one frequency,a=1,δ=1/2 | 0≤0; 1≤(1+4)·1=5 | Retained headline. |
| 110. Circular separation of reduced fractions. | Fractions 0/1,1/2,Q=2 | Circular distance=1/2≥1/4 | Retained modulus-one phase. |
| 111. Additive large sieve over reduced residues. | Q=1,H=1,a=1 | Single rational phase gives 1≤1+2=3 | Retained. |
| 112. Integer phase of the standard residue character. | q=4,a=1,n=−1 | Standard character=−i=e(−1/4) | Retained integer cast. |
| 113. Squared norm of a primitive Dirichlet Gauss sum. | Primitive conductor-one character; χ₄ | Gauss norm squares=1 and 4 | Retained modulus one. |
| 114. Gauss expansion of a finite character sum. | χ₄,a supported at n=1 | Gauss sum=2i; normalized Fourier expansion recovers χ₄(1)=1 | Retained conjugate expansion. |
| 115. Parseval identity over Dirichlet characters. | q=1,one coefficient at n=1 | One character norm square=1=φ(1)·1 | Retained. |
| 116. Primitive character energy at one modulus. | q=1,H=1,a=1 | Character energy=1 equals additive energy 1 | Retained. |
| 117. Primitive-character large sieve. | Q=H=1,a=1 | Primitive left=1; bound=(1+2)·1=3 | Retained. |
| 118. Incomplete logarithm. | λ₂ at n=0,4,12 | 0,log2,log6; λ₀(1)=0 | Retained prime-power divisors. |
| 119. Subtracting the short von Mangoldt divisor sum. | n=4,V=2 | log4−log2=log2 | Retained subtraction. |
| 120. Vanishing below the incomplete-log cutoff. | n=V=4; n=0,V=2 | Incomplete logarithms=0,0 | Retained inclusive vanishing. |
| 121. Pointwise incomplete-log coefficient bounds. | n=4,V=2 | 0≤log2≤log4 | Retained. |
| 122. Möbius inversion of the incomplete logarithm. | n=2,V=1; n=2,V=2 | μ∗λ values=log2 then 0 | Retained cutoff inversion. |
| 123. Vaughan's identity with its boundary term. | n=V=2,U=1; n=0 and 1 | log2=log2+log2−log2+0; 0=0 in both junk cases | Retained boundary term. |
| 124. Weighted Vaughan identity on a finite hyperbola. | Weight supported only at n=2,U=1,V=2 | Weighted identity has both sides log2 | Retained hyperbola boundary. |
| 125. Exact support of the bilinear Vaughan term. | n=6,U=V=2; n=4,U=V=2 | Allowed long pair (3,2) fails c>2, so none; no long pair for 4 | Retained simultaneous strict bounds. |
| 126. Finite Type I–Type II Vaughan decomposition. | U=V=0,n=2 | Short terms vanish; long convolution gives log2 | Retained zero cutoffs. |
| 127. Elementary Vaughan coefficient energies. | U=1,x=4 | μ-prefix squared energy=1; log coefficients at 1,…,4 give 0,log2,log3,log4 | Retained coefficient bounds. |
| 128. Primitive character energy on a dyadic band. | R=1,H=0 then H=1,a=1 | Empty energy=0; modulus 2 has no primitive characters, so left=0 | Retained band endpoints. |
| 129. Bilinear primitive character bound on one band. | Same band with one coefficient in each factor | Bilinear left=0; right nonnegative; zero energy gives 0=0 | Retained. |
| 130. Exact partition of the dyadic modulus interval. | R=2,J=2 | Bands=(2,4],(4,8]; modulus 4 occurs once, 8 retained | Retained exact partition. |
| 131. Finite sum of the bilinear dyadic coefficients. | H=K=0,R=2,J=3; J=0 | Kernel sum=112≤126; empty sum=0=0 | Retained dyadic J term. |
| 132. Primitive bilinear tail through a dyadic endpoint. | J=0; zero a | Tail and bound=0; both vanish for zero energy | Retained. |
| 133. Primitive bilinear tail at an arbitrary cutoff. | R=2,Q=5,J=2; J=1 | 2·2²=8 lies in [5,10]; 4<5 fails the latter cover | Retained partial band. |
| 134. Squared finite large-sieve duality. | 1×1 matrix A=i,C=1 | Primal and adjoint energies=abs a² and abs b²; C=0 would force A=0 | Retained conjugate transpose. |
| 135. Heath-Brown quadratic bilinear estimate. | M=N=1,a₁=b₁=1 | Bilinear left=1, shape M√N+√M N=2 | Now consumes earlier quadratic large sieve. |
| 136. Prime-denominator quadratic symbol. | Numerator/denominator (3,2),(6,2),(2,3),(9,3) | Values=1,0,−1,0 | Retained separate dyadic convention. |
| 137. Prime quadratic-symbol bilinear estimate. | K=1,L=2,a=b=1 | Left=1 from p=2; right=C(2^(1+ε)+1) | Retained additive K term. |
| 138. Jutila mean value lemma. | X=8,N=2,a₂=1; X=3,N=2,a₂=1 | Mean squares=3,1; square-product main sums=1,1; sixth-log moment nonnegative | Added full headline, corrected source exponent. |
| 139. Smith prime Legendre-symbol estimate. | X₁={3},X₂={5},t₁=3,t₂=5; either set empty | Row sum=1; empty row sum=0 | Retained disjoint odd primes and ε-dependent constant. |
| 140. Koymans–Pagano normalized row mean. | Same singleton sets,c₂=c₄=1,a=1/10 | log5≤3; cardinality lower bounds≈0.273,0.311≤1; row sum=1 | Terminology only changed; growth and density retained. |
| 141. Polynomial Farey coefficient adapter. | G/H=1/T,1/(T+1),1/T²; zero numerator | Words begin (1,0),(1,−1),(0,1); zero gives (0,0) | Added real power-series body with fixed reversal length. |
| 142. Polynomial Farey large sieve. | p=2,ℓ=1,m=2,f=1; word (1,0) indicator; ℓ=m=0 | 2≤4; 1=1; 0/1 gives 1=1 | Added full finite-field headline. |
| 143. Additive sieve for bounded integer coefficients. | H=Y=1,only a₀=1 | Left=1,energy=1,majorant=3(1+1)=6 | Retained. |
| 144. Separated Hilbert inequality. | λ=(0,1),z=(1,i),δ=1; singleton | Off-diagonal sum=2i, norm=2≤2π; singleton=0 | Retained π/δ. |
| 145. Sharp separated additive large sieve. | H=1,points 0,1/2,δ=1/2,a=1 | Left=2,energy=1,right=0+2=2 | Retained sharp endpoint. |
| 146. Sharp primitive-character large sieve. | Q=H=1,a=1 | Left=1,right=(1−1+1)·1=1 | Retained modulus one. |
| 147. Large sieve for forbidden residues. | P={2},bad {0},a supported at 1; unmasked a₁=a₂=1 | Masked S(0)=1,S(1/2)=−1; unmasked energies would assert 4≤0 | Retained coefficient masking. |
| 148. Least quadratic nonresidue. | p=3,7,2 and numerator 3 mod3 | Least values=2,3,0; Jacobi(3,3)=0 | Retained invalid-domain zero. |
| 149. Linnik bounded exceptional primes. | N=2,ε=1; N=7,ε=1 | No odd exceptional primes in either case, count=0 | Retained bounded-exception formulation. |
| 150. Level of distribution of the primes (Maynard (1.3)). | x=5,q=3; q=1,0; x=−1,q=1 | Prime counts 0,2 versus mean 3/2 give discrepancy 3/2; q=1,0 discrepancies=0; negative cutoff count=0 | Only native inputs on definition’s Needs line; analytic non-example cites its own inputs. |
| 151. Arithmetic progression discrepancy. | Point mass at n=1,q=3; point mass at 2,q=2 | Reduced discrepancies=1/2,−1/2; at q=2 both terms=0 | Retained reduced-residue mean. |
| 152. Discrepancy to restricted character sums. | Same q=3 mass,χ₃ | Character sum=1,energy E=1; residue maximum=1/2 | Retained all-moduli hypothesis. |
| 153. Primitive-conductor reduction of discrepancies. | Primitive χ₄ inflated to q=8 | r=4,s=2,gcd=2; values at 1,3,2 are 1,−1,0 | Corrected cofactor prose and added Check. |
| 154. Convolution discrepancy mean value. | f=g=0; Q=2,x=y=1 | Both coefficient energies=0 and discrepancy sum=0 | Only j=1 cofactor moment retained. |
| 155. Maximal Bombieri–Vinogradov theorem. | x=4,q=1,y=0 and 4 | ψ(0)−0=0; ψ(4)−4=3log2+log3−4≈−0.822 | Quantitative PNT now cites §0.32; maximal input remains separate. |
| 156. Bombieri–Vinogradov: every level θ<1/2. | θ=0; θ<0 with x>1 | Only q=1 then no moduli; discrepancy sums=0 | Retained every θ<1/2 headline. |
| 157. Weighted prime-distribution transfer. | q=1,y=4; zero coefficient modulus weights | π(4)=2 versus li(4); centered π discrepancy=0; zero weights give sum 0 | Only actual divisor moments/PNT retained; centers distinct. |
| 158. Arithmetic discrepancy second moment. | Point mass at 1,q=3; zero function | Residue second moment=1/4+1/4=1/2; zero function gives 0 | Only j=2 cofactor moment retained. |
| 159. Barban–Davenport–Halberstam theorem. | x=4,q=1 | Variance=(3log2+log3−4)²≈0.6756 | Retained all-residue second moment and logarithmic range. |
| 160. Bilinear congruence correlation. | f=g=0; q=1 | Bilinear correlation=0; reduced-residue centering contributes 0 at q=1 | Retained f-side Δ dependence. |
| 161. Admissible tuple. | H empty,{0,1},{0,2} | Empty admissible; {0,1} covers F₂; {0,2} misses 1 mod2 | Retained both directions. |
| 162. The prime k-tuples conjecture, as a named statement. | H empty; {0,1}; {0,2,4} | Prime-translate set all naturals for empty; latter two have only n=2 and n=3 | Retained conjectural status. |
| 163. The W-trick residue v₀ (Maynard (4.1)). | H={0,2},primes p<D₀ with 3<D₀≤5 | W=6,v₀=5 avoids both shifts modulo 2 and 3 | Retained common residue. |
| 164. Maynard's multidimensional sieve weights. | k=1,W=1,h=v₀=0,F=1,N=2,R=4 then 2; F=0 | R=4: λ=(5/2,−2,−3/2),w=(1/4,1),S₁=S₂=5/4,y⁽¹⁾₁=5/2; R=2: S₁=S₂=2,y⁽¹⁾₁=1; F=0 gives all zero; g(1,2,5,25)=(1,0,3,9) | Added Checks for every bundled quantity. |
| 165. Maynard's variational quantity M_k. | Triangle F=1; zero F; k=0,1 | I₂=1/2,J₁=J₂=1/3,ratio=4/3; zero I=J=0 inadmissible; M₀=0,M₁=1 | Retained native square-integrable class. |
| 166. Smooth approximation within the simplex. | k=1,indicator of [0,1]; zero function | I=J=1,ratio=1; zero has I=0, so inadmissible | Retained nonzero-energy requirement. |
| 167. Size of λ in terms of y (Maynard (5.9)). | k=1,R=4,y=1 | max abs λ=5/2≤Σ_(u<4)μ²(u)/φ(u)=5/2 | Only reciprocal-prime Mertens retained. |
| 168. Diagonal form of S₁ (Maynard Lemma 5.1). | k=1,R=2,F=1,W=1,N=2 | S₁=2; diagonal main=N·1=2 | Only ordered-divisor and local diagonal inputs retained. |
| 169. Diagonal form of `S₂^{(m)}` (Maynard Lemma 5.2). | Same weights with k=1; k=2,F=0 | First case outside k≥2 hypothesis; second has S₂=main=errors=0 | PNT and actual moment inputs retained. |
| 170. y⁽ᵐ⁾` in terms of y (Maynard Lemma 5.3). | k=1,R=4,r=1; r=2 | y⁽¹⁾₁=5/2=Σ_(a<4)1/φ(a); r=2 gives 0 | Removed prime-level and unrelated analytic gaps. |
| 171. Asymptotic for S₁ (Maynard Lemma 6.2). | F=0; k=1,unit cube | S₁=main=error=0; cube mass=1 | Only logarithmically weighted prime input retained beyond earlier diagonal targets. |
| 172. Asymptotic for `S₂^{(m)}` (Maynard Lemma 6.3). | F=0; k=0 | S₂⁽ᵐ⁾=main=error=0; at k=0 no index m exists | Retained k=1 direct-count route and relevant PNT input. |
| 173. Maynard's asymptotics for S₁ and S₂ (Proposition 4.1). | k=1,F=1 on [0,1] | I=J=1; main S₂/S₁=logR/logN=θ/2−δ | Retained cutoff dependence. |
| 174. The GPY positivity criterion. | k=1,weight at one prime n+h=3 | S₁=S₂=1; S₂−ρS₁=1−ρ positive exactly when ρ<1 | Retained positivity criterion. |
| 175. From prime clusters to prime gaps. | Primes 5,7 and triple 3,5,7 | Consecutive gap=2≤diameter 2; triple diameter=4 | Retained counting-to-diameter step. |
| 176. Primes in admissible tuples (Maynard Proposition 4.2). | k=0; k=1,M₁=1,θ=1/2 | Required counts ceil0=0 and ceil(1/4)=1 | Retained zero and rank-one endpoints. |
| 177. Lower bound for M_k when k is large (Maynard Proposition 4.3(3)). | k=e⁸ formally in the real comparison; integer k=2981 | log k−2loglog k−2≈1.84<k | Retained large-k asymptotic; no small-k assertion. |
| 178. Moments on the simplex (Maynard Lemma 8.1, corrected). | k=5,a=2,b=0; k=2,a=b=c=0 | Integrals=1/2520 and 1/2; G_(0,2)=1 | Retained empty-composition term. |
| 179. I_k and J_k as quadratic forms (Maynard Lemma 8.2). | Triangle F=∂x∂y[x²y²(1−x−y)²] | I=1/3150,J₁=J₂=0; F(1/4,1/4)=1/128 | Retained semidefinite J and positive I distinction. |
| 180. M₅ > 2 (Maynard Proposition 4.3(1)). | Displayed k=5 polynomial witness | I=29509/1222452000; ratio=1417255/708216≈2.001162 | Retained rational headline. |
| 181. M₁₀₅ > 4 (Maynard Proposition 4.3(2)). | Displayed 42-coefficient k=105 witness | Ratio≈4.000543795842>4 | Retained; finite witness does not prove distribution. |
| 182. Engelsma's admissible 105-tuple of diameter 600. | Displayed 105-tuple | Cardinality=105,minimum=0,maximum=600; each of 27 primes≤105 misses a residue | Retained local admissibility. |
| 183. The first k primes above k are admissible. | k=0 and 5 | Empty tuple; first five primes above 5 are 7,11,13,17,19, missing 0 modulo 5 | Retained inclusive p≤k check. |
| 184. Bounded gaps between primes (Maynard Theorem 1.3). | Consecutive primes 3,5 then 5,7 | Gaps=2,2≤600 | Retained; finite instances do not assert infinitude. |
| 185. Gaps under Elliott–Halberstam (Maynard Theorem 1.4). | Primes 3,5,7 under the explicit EH hypothesis | Gap=2≤12 and three-prime diameter=4≤600 | Retained conditional headline. |
| 186. m + 1 primes in bounded intervals (Maynard Theorem 1.1). | m=1 and prime pair 3,5 | Diameter=2; main scale m³e^(4m)=e⁴ | Retained positive m domain. |
| 187. A positive proportion of admissible m-tuples are prime (Maynard Theorem 1.2). | m=1,A empty below threshold; A={0} | Choose(0,1)=0; singleton shift has infinitely many prime translates, count=1 | Retained threshold and positive-proportion quantifiers. |
| 188. Bouniakowsky and Schinzel hypotheses. | X+1; X²+X+2; pair X,X+1; empty tuple | First has no fixed prime divisor; second always even; pair covers both classes mod2; empty simultaneous set=all naturals | Retained conjunction of local/irreducibility conditions. |
| 189. From roughness to an almost-prime bound. | n=1,8,12 and roughness at z=2 | Ω=0,3,3; 8 has ω=1; at strict z=2 no sieving prime | Retained multiplicity transfer and unit boundary. |
| 190. Linear sieve functions. | s=1,2,3,4 | F(1)=2e^γ,F(2)=e^γ,F(3)=2e^γ/3; f(2)=0,f(3)=2e^γlog2/3,f(4)=e^γlog3/2 | Added third evaluations for each function. |
| 191. Rosser sieve weights. | D=8,d=2; d=D=2; d=4,D=100 | Upper=0,lower=−1; boundary lower=0; nonsquarefree weights=0 | Retained strict prefixes/support. |
| 192. Rosser–Iwaniec linear sieve. | s=2 and 3,zero population | Upper/lower sieve values=0; lower f(2)=0, f(3)>0 | Retained lower direction and hypotheses. |
| 193. Beta sieve in general dimension. | κ=1 and 1/2 | β=2,A=2e^γ,B=0; β=1,A=2√(e^γ/π),B=0 | Retained dimension-specific normalization. |
| 194. Positive lower sieve above 9t. | t=1,s=9.5; elementary u=10,K=2 | 9.5>9 but <10; elementary δ=1024 gives negative lower bracket | Retained distinct positive lower-sieve input. |
| 195. Fundamental lemma for the linear sieve. | Exact-remainder family, s→∞ | Relative remainder=0; limiting upper/lower multipliers=1,1 | Retained normalization by XV. |
| 196. Richert logarithmic weights. | N=8,α=1/4,β=1,r=1,n=8 | w₂=1−1/3=2/3; point weight=1/3,Ω(8)=3 | Retained distinct-prime weight and square exception. |
| 197. Richert weighted sieve. | A_N=multiples of 30; g(p)=1/p family | g(2,3,5)=1,1,1 violates margin; second has g(2)=1/2≤1−1/2 | Removed unrelated imported analytic gaps; strict margin stays. |
| 198. Richert explicit level threshold. | r=2,3 | Λ₂≈1.834,Λ₃≈2.771; thresholds≈0.545,0.361 | Retained distinction P₃ versus P₂ at level below 1/2. |
| 199. Short character input for joint spins. | χ₃,intervals (0,2],(1,3]; q=15,k=3 then 15 | Sums=0,−1; reduced conductors=5,1; subset t=2,abs T=1 gives saving δ/2 | Arithmetic data imported; general transfer retained. |
| 200. Primitive affine sieve pair. | O=Z,f=X; f=2X+2; values {2,3}; empty O | Witness 1 avoids every q; second fails q=2; third fails q=6; empty fails q=2 | Retained simultaneous primitivity. |
| 201. Affine almost-prime locus and saturation. | Singleton values 6,1,0; value −6; value 8 | Least dense indices=2,0,none (default 0); −6∈O₂; 8∉O₂; empty subset not dense in singleton | Added actual density and minimum Checks. |
| 202. Affine walk sieve data. | Length-zero word ball; two words with equal value | Population mass=1; repeated value has pushforward mass=2 | Retained word multiplicities. |
| 203. Local densities for affine orbits. | One forbidden residue modulo p=3; full and empty sets | Densities=1/3,1,0; full obstruction cannot enter strict native sieve | Retained bad-prime handling. |
| 204. Affine sieve level from expansion. | Zero remainder sequence; total mass X=1,δ positive | R_d=0 and remainder sum=0≤C·1^(1−ε) | Retained absolute-mixing hypothesis. |
| 205. Escape from proper algebraic subvarieties. | Polynomial f=1 then f=0 | Zero loci have populations 0 then X; latter violates nonzero-polynomial hypothesis | Retained proper-subvariety condition. |
| 206. Affine sieve saturation with expansion. | Singleton unit value versus primitive orbit f=X on Z | Unit has saturation 0; integer orbit r=1 contains infinitely many primes | Retained fixed zero-locus removal. |
| 207. Explicit affine almost-prime bound. | Strict threshold parameters s>9t and δ<(1−τ)/dim G | At t=1,s=10,dim G=3,τ=1/2,δ=1/7: 10>9 and 1/7<1/6 | Retained strict margins. |
| 208. Squarefree congruence expansion for SL₂. | Squarefree modulus q=1 then 6 | Quotient sizes=1 and abs SL₂(Z/6Z)=6·24=144 | Retained all squarefree moduli outside fixed bad modulus. |
| 209. Chen switching weight. | N=1000,values 11,2·11·13,3,27 | Switching weights=1,0,1/2,1/2 | Retained square-exception distinction. |
| 210. Goldbach local factor. | N=6,10,18,0 | C_N/C₂=2,4/3,2,0 | Only pinned positive-product inputs remain. |
| 211. Chen switched triple upper bound. | Chen constants | 8·0.49246325640747≈3.9397060513<3.9404 | Retained strict switched-triple margin. |
| 212. Chen primes with an almost-prime shift. | h=2,p=3,5,7 | Translated Ω(5),Ω(7),Ω(9)=1,1,2; all are nonunit P₂ values | Retained shifted family and fixed even h. |
| 213. Chen original-family lower estimate. | Original-family constant versus switched half | 2.6408−3.9404/2=0.6706 | Retained lower estimate and local factor. |
| 214. Chen’s Goldbach theorem. | N=10 | p=2,3,5,7 give complementary 8,7,5,3; exactly 3 have 1≤Ω≤2 | Retained nonunit/multiplicity condition. |
| 215. Quadratic ideal residue symbol adapter. | K=Q,denominators O,(5),numerators 0,2,4,15 | Values=1,−1,1,0; degree-two rational ideal denominator gives (2/(5O_K))=1 | Retained ideal/rational-prime distinction. |
| 216. Ideal-symbol reciprocity adapter. | K=Q,α=3,β=7; α=β=−1 | Products=−1,1; dyadic/real factors=(−1,1),(−1,−1) | Retained both infinite and dyadic places. |
| 217. Ideal divisor and logarithmic coefficient bounds. | K=Q,unit,(4); j=0,k=2,X=4 | τ=1,3; Λ=0,log2≤log4; moment=1+4+4+9=18 | Retained nonzero ideals and coefficient absorption. |
| 218. FIMR sieve conversion to prime ideals. | Zero ideal sequence; ϑ=δ/(54nabs S²),θ=1/(6n),n=3,abs S=δ=1 | All sums=0; saving ϑθ/(2+θ)=1/5994 | Generic theorem retained; spin-specific premises imported. |
| 219. Equidistribution of joint spin signs. | One sign variable,zero nonempty Fourier moments; two variables | Sign densities=(1/2,1/2); joint densities=1/4 each | Now consumes ArithmeticStatisticsPartV §3.30 and the explicit subset transfer. |

### Source-sensitive conventions

| Statement | Instances tried | Values computed | Result and change |
| --- | --- | --- | --- |
| 1. HB-SIEVES, arXiv v1 p.1, introductory question (i); not collated with the published proceedings. | n=2 then 4 | No two primes sum to 2; 4=2+2 | Retained lower endpoint 4. |
| 2. HB-SIEVES, arXiv v1 p.2, Example 1; related divisor-count equality on p.4; not collated with the published proceedings. | x=10,z=5 | Survivors 1,5,7: count 3; π(10)−π(5)=1; prime product 6 has 4 divisors | Retained unit/strict endpoint. |
| 3. HB-SIEVES, arXiv v1 pp.2-3, Example 2 image set and the next page's first counting equality; not collated with the published proceedings. | 2N=10,parameters 2,…,8 | Image {16,21,24,25}: 4 values versus 7 labels | Retained multiplicity. |
| 4. HB-SIEVES, arXiv v1 p.2, Example 2 displayed prime-pair count; distinct from the image-multiplicity convention above. | 2N=10,p=7 | Product 21 has factor 3<√10 and is removed; 25 survives | Retained two-sided roughness. |
| 5. HB-SIEVES, arXiv v1 p.2, Example 3 primitive sum-of-two-squares interpretation; not collated with the published proceedings. | n=4 and 9 | All representations of 4 have gcd2; 9 is a nonprimitive square but has forbidden factor3 | Retained primitive criterion. |
| 6. HB-SIEVES, arXiv v1 p.4, Corollary 1.2 and its immediately preceding asymptotic argument; not collated with the published proceedings. | Fixed z=5/2 | Actual density=1/2; e^(−γ)/log(5/2)≈0.6127≠1/2 | Retained z→∞ requirement. |
| 7. KED-ANT-11, §11.5, proof of Theorem 11.11 invoking Theorem 11.9. | x=n=33,z=11,d=1155 | 33·35=1155, all primes≤11; d>x | Retained missing linear cutoff warning. |
| 8. KED-ANT-11, §11.5, proof of Theorem 11.11 between (11.5.1) and the asserted sieve estimate. | Unspecified O(log z) model 3log z, at z=e¹⁰ then e¹⁰⁰ | Values 30 versus 2log z=20, then 300 versus 200; excesses 10,100 cannot have a uniform additive bound | Retained coefficient-one prime-sum input. |
| 9. BOMBIERI-1971, Published Acta Arithmetica 18 (1971), p.402, coefficient choice immediately after equation (4). | f=1,φ=2 | Correct coefficient=1/2,defect=0; squared-denominator coefficient=1/8,defect=9/16 | Retained corrected coefficient. |
| 10. BOMBIERI-1971, Published Acta Arithmetica 18 (1971), p.403, display immediately after the definition of K_M. | N=L=1,t=1/2 | K₂=0,K₁=1; signed difference=−1,modulus=1 | Retained absolute value. |
| 11. BOMBIERI-1971, Published Acta Arithmetica 18 (1971), p.404, opening definition of I_m and the immediately following assertion that the bins cover all points. | δ=3/10,d=2/5; d=1/2 | Final bin [3/10,3/5) contains both distances; upper-endpoint cutoff wrongly omits it | Retained final partial bin and single antipode. |
| 12. KED-ANT-16, §16.1, display (16.1.2), and §16.3, proof of Theorem 16.7. | q=4,m=1,n=−1; smooth count at fixed cutoff | Integer character phase=−i; asymptotic variable N has infinitely many values while constant c is fixed | Retained bound-variable distinction. |
| 13. KED-ANT-16, §16.3, Definition 16.3, Theorem 16.4 and Lemma 16.5. | P={2},bad {0},a₁=a₂=1 | Unmasked S(0)=2,S(1/2)=0 gives false 4≤0; masking leaves 1 and −1 | Retained masked coefficients. |
| 14. KED-ANT-16, §16.3, proof of Theorem 16.4. | Same masked coefficients | Additive reduced energy at modulus2=1; primitive multiplicative family at modulus2 is empty with energy0 | Retained correct inequality direction. |
| 15. KED-ANT-16, §16.3, proof of Lemma 16.5, Chinese-remainder display. | q₁=2,q₂=3,a₁=a₂=1 | Correct phase=5/6; printed nesting=3/7 | Retained CRT addition. |
| 16. KED-ANT-16, §16.3, proof of Theorem 16.7, the density of the sieved classes. | p=3,large p limit | (p−1)/(p+1)=1/2 at3 and tends to1; difference from1 is −2/(p+1) | Retained density distinction. |
| 17. KED-ANT-16, §16.3, proof of Theorem 16.7, final lower bound for smooth integers. | N=100000,k=2; N=1000000,k=2 | Ordered-tuple counts=36745,387659; distinct smooth counts=35819,344299 | Retained multiplicity warning; recomputed finite counts. |
| 18. KED-ANT-16, §16.3, Definition 16.6. | F₂ | 0=0²,1=1²; no nonresidue, outside-domain q(2)=0 | Retained odd-prime restriction. |
| 19. KED-ANT-18, §18.1, Theorem 18.3 proof, small-r bound after (18.1.2). | x=4,y=1,unit energies | Product of square-root factors includes √(xy)=2 rather than1 | Retained missing x factor. |
| 20. KED-ANT-18, §18.1, Theorem 18.3 proof, summation of the dyadic large-r estimates. | R=1,Q=t=4,x=t⁴,y=1 | Two bands each≥2t²=32,total≥64; candidate aggregate=t+2t²+1=37 | Retained logarithmic-loss warning. |
| 21. KED-ANT-18, §18.2, boundary explanation following (18.2.2). | x=32,n=2 | Incomplete convolution at cutoff2=0; Λ(2)=log2 | Retained endpoint inclusion. |
| 22. KED-ANT-18, §18.2, multiplicative partition parameter after (18.2.3). | x=16,Δ=1/4 | δ=√Δ=1/2≤1; printed lower bound>1 is incompatible | Retained nonempty mesh range requirement. |
| 23. KED-ANT-18, §18.2, multiplicative partition and rectangles after (18.2.3). | x=16,δ=1,LM=16 | Four doubling intervals reach16; L<M-style boxes with ℓ>L,m>M have ℓm>16 | Retained hyperbola covering requirement. |
| 24. KED-ANT-18, §18.2, display defining D(L,M;N,m). | λ=μ=point mass at1,q=3,a=1 | Bilinear coefficient at1=1; reduced average=1/2; discrepancy=1/2 | Retained weighted average and distinct variables. |
| 25. KED-ANT-18, §18.2, last aggregate bound and substitution δ=Δ^(1/2). | x=4,Δ=1/4,δ=1/2 | Printed factor (δ⁻¹x+δ⁻²Δ)x=36; claimed Δ^(1/2)x=2 | Retained invalid-balance warning. |
| 26. KED-ANT-18, §18.3, Theorem 18.5 display. | Point mass at1 modulo3 | Residue variances=1/4+1/4=1/2 | Retained bound-residue summation. |
| 27. MAYNARD-2015, Proof of Proposition 4.2, display (4.4), p. 389 (arXiv v3 p. 6) | k=2,triangle indicator | J₁=J₂=1/3; correctly bound sum=2/3 | Retained index m. |
| 28. MAYNARD-2015, Proof of Lemma 5.1, display (5.8), p. 393 (arXiv v3 p. 9) | d=2 | μ(2)·2=−2; no independently indexed μ_i exists | Retained Möbius normalization. |
| 29. MAYNARD-2015, Proof of Theorem 1.1, p. 391 (arXiv v3 p. 7) | k=5,first primes above5 | 7,11,13,17,19 all avoid0 mod5 | Retained inclusive prime bound. |
| 30. MAYNARD-2015, §7, sentence before (7.10), p. 407 (arXiv v3 p. 19) | k=3 | Remaining variables are u₂,u₃, two coordinates; u₁ is absent | Retained variable domain. |
| 31. MAYNARD-2015, Lemma 8.1, definition of G_{b,j}, p. 409 (arXiv v3 p. 21); also (8.6) | k=5,a=2,b=0; displayed k=5 witness | Integral=1/2520; corrected ratio=1417255/708216>2; empty-sum convention would give 0 for the first integral | Retained G₀=1. |
| 32. MAYNARD-2015, Proof of Lemma 8.2, display (8.10), p. 411 (arXiv v3 p. 23) | b=0,c′=1,k=3 | Denominator factorial=(3+0+2−1)!=4!=24; G_(1,2)(2)=4, quotient=1/6 | Retained coefficient2 and c′. |
| 33. KED-ANT-12, §12.4, Theorem 12.2, second inequality. | P=1,κ=1,K=2,u=20 | V⁻=1; wrong lower multiplier 1+δ=1.046489528>1; corrected 1−δ=0.953510472 | Recomputed for new Brun headline. |
| 34. KED-ANT-12, §12.1, paragraph beginning with the all-prime specialization, and the prime-indicator example before §12.2 | x=25,z=5,prime indicator | Sifted primes 7,11,13,17,19,23 give6; primes≤25 give9; twin starts give4 | Retained shifted versus unshifted sieve. |
| 35. KED-ANT-12, §12.1 inclusive P(z) definition versus Lemma 12.1 V(p_n) and p₁<z, and Exercise 12.6.1 hint | P={2},g(2)=1/2,z=3 | Correct V=1/2; inclusive failure product gives1−1/4=3/4; strict left limit gives1−1/2=1/2 | Recomputed matching new dimension predicate. |
| 36. KHAYUTIN-19, Published Lemma 9.9, pp.224–225, lcm discrepancy step | R=32,θ=1,z=2; θ=1/4 | z⁵R=1024≤A=1024π; z²=4≤√A; w^(13/2)=z⁵ | Recomputed reordered binary dependencies. |
| 37. KHAYUTIN-19, Published Lemma 9.11, pp.225–226 | z=1,s→0,degree d>0 | Both products=1; C_d s^d→0 | Retained s≥1. |
| 38. KHAYUTIN-19, Published Theorem 9.7 proof, equation (47), p.233 | Q=x²,p=3,n=2 | Ordinary count27; corrected count18 | Retained distinct ordinary-density requirement. |
| 39. KHAYUTIN-19, Published Proposition 9.25, pp.235–236, scaled-domain hypothesis | A=10⁶,k₀=10,η=1/10 | Rescaled area=10⁴; required power=(10⁴)^0.7≈630.96 versus coarse10⁴ | Retained strengthened rescaled hypothesis. |
| 40. KHAYUTIN-19, Published Proposition 9.26, pp.236–237, local factor and first proof congruence | k₀=2,k₁=1,k₂=3,ℓ=1 | Original Q≡2 mod6 gives2 mod3, not1 | Retained local transport. |
| 41. KHAYUTIN-19, Published Lemma B.4, pp.266–267, m≥1 smooth term and closed formula | p=3,q₀=x²−y²,m=n=1 | 5 zeros=4 smooth+1 singular; printed count1 fails | Retained correction. |
| 42. KHAYUTIN-19, Published Proposition B.5, equation (68) and odd-valuation branch, pp.268–269 | p=3,q=x²+3y²,ω=1,n=2 | Correct shifted equation has0 solutions; opposite sign yields18 | Retained discriminant sign/parity. |
| 43. KHAYUTIN-19, Published Proposition B.5, p.268, second displayed branch | p=3,ℓ=1,n=2 | Count is over modulus9, with 81 residue pairs, not modulus3 with9 pairs | Retained bound variable n. |
| 44. KHAYUTIN-19, Published Corollary B.7, p.269, n≤ℓ branch and n=ℓ formula | Same conic,n=ℓ=1 | Three roots modulo3, no lifts modulo9, corrected density3 | Retained threshold branch. |
| 45. KHAYUTIN-19, Published Proposition B.8, equations (69)–(72), pp.270–271 | p=3,u=u_A=ω=1,ε=−1,k=1 | 9(2+1+1)/2=18; printed expression9 | Retained. |
| 46. HB-SIEVES, arXiv math/0209360v1, Theorem 5.1, p.35 | s=2,nonnegative exact remainder | f(2)=0; lower coefficient must be≥negative error, not≤it | Retained lower-inequality direction. |
| 47. HB-SIEVES, arXiv math/0209360v1, Example 1 after Corollary 5.1, p.36 | x=e⁴ | Correct y=e⁴/16; summed O(1) errors have size y, not x | Retained logarithmic saving. |
| 48. HB-SIEVES, arXiv math/0209360v1, Example 4, p.38 | θ=9/20 | 1/θ=20/9>2 and 2/θ=40/9<5, hence at most4 rough factors; θ=1/2 loses positive lower sieve | Retained open θ interval. |
| 49. HB-SIEVES, arXiv math/0209360v1, fundamental lemma at end of §5, p.38 | XV=x/logx and remainder=x/logx | Remainder/XV=1 although remainder/X=1/logx→0 | Retained relative normalization. |
| 50. HB-SIEVES, arXiv math/0209360v1, partial summation after (6.3), p.44 | N=16,β=1/2 | Upper prime/integral endpoint=N^β=4 | Retained endpoint. |
| 51. HB-SIEVES, arXiv math/0209360v1, Chen theorem local constant, p.46 | N=6 | Universal odd-prime product C₂, finite correction2; doubled Chen normalization=4C₂ | Retained separate universal/fixed-prime factors. |
| 52. KM-21, arXiv:1809.09597v1, definition (2.4), pp.5–6 | ψ=0; ideal divisible by a prime of F | Coefficient0 in both cases; ψ is undefined off units before zero extension | Imported owner retains this domain obligation. |
| 53. KM-21, arXiv:1809.09597v1, Lemma 4.1 domain, p.20 | α=1,β=1 then β=3 | Element products and norms=1 then3^[K:Q]; these are not operations on a mixed ideal/element pair | Imported chain owns corrected element domain. |
| 54. KM-21, arXiv:1809.09597v1, Lemma 4.1(P3), p.20 | K=Q,β=3 | Rational norm modulus=3; in degree3 with rational β=3 it is27O_K versus principal ideal3O_K | Imported chain retains rational norm period. |
| 55. KM-21, arXiv:1809.09597v1, Theorem 1, p.2, implied-constant dependence | ψ→2ψ; ψ=0 | All coefficients and sums scale by2; zero gives0 | Imported constant dependence preserved. |
| 56. HB-SIEVES, arXiv math/0209360v1, p.24, definition of E_c and the Liouville summatory bound; p.25 second-moment calculation | x=2,Liouville prefix | λ(1)+λ(2)=0; next prefix at3=−1, so eventually vanishing integer sums impossible | Retained missing mass factor. |
| 57. HB-SIEVES, arXiv math/0209360v1, p.25, cutoff choice following (4.2) | x=e⁴,c=1 | Correct y=e²>1,z=e>1; expression lacking x gives e^(−2)<1 | Retained growing cutoff. |
| 58. HB-SIEVES, arXiv math/0209360v1, p.33, (5.3) and the immediately following normalized main-sum display | P={2},ν(2)=1/2,upper weight only1,X=2 | Full main=1,upper main=2,tail=1; 1=2−1 and normalized1/2=1−1/2 | Retained tail sign and division by X. |
| 59. HB-SIEVES, arXiv math/0209360v1, p.28, Theorem 4.1 induction, before (4.5) | s=4,p=x^(1/4) then p=x | Reciprocal logarithmic arguments=4 then1; shifted arguments=3 then0 | Retained strict lower endpoint. |
| 60. MAYNARD-2015, Published Ann. Math. 181 (2015), p.404, (6.18) | k=2,m=1 | After fibre integration the remaining product has only coordinate2, one factor | Retained excluded coordinate. |
| 61. MAYNARD-2015, Published Ann. Math. 181 (2015), p.411, matrix-positivity assertion after Lemma 8.2 | F=∂x∂y[x²y²(1−x−y)²] | I=1/3150>0,J₁=J₂=0 | Retained semidefinite J. |
| 62. KHAYUTIN-19, Published Ann. Math. 189 (2019), pp.230–231, Lemma 9.21, (43)–(44) and final prime-sum estimate | Coarse prime summand at each p | Lower bound1/p; partial sums grow as loglog z rather than staying bounded | Retained proof gap; no uniform constant inferred. |
| 63. KHAYUTIN-19, Published Ann. Math. 189 (2019), p.231, Lemma 9.23, the two-case proof | α=0; α=1/2 | log0 undefined; for fixed positive α bounded a²≤z² is finite after fixing the cutoff | Retained separate endpoint. |
| 64. FIMR-13, Public author manuscript, §5, Proposition 5.1 proof, pp.21–24, dyadic block sizes | x=16,y=z=4,last block begins just above4 | Next dyadic endpoint8=2z,not z; MN≤2x remains possible | Retained factor-two allowance. |
| 65. FIMR-13, Published Invent. Math. 193 (2013), pp.723,727–730 and §9 progression reduction, as corrected by the published 2015 erratum, pp.923–925 | q=15,k=3 then15 | Reduced conductors5 then1; q∤k true then false | Retained corrected progression condition. |
| 66. BGS-10, Published Invent. Math. 179 (2010), p.577, (3.23) and (3.28) | Connected two-vertex,2k-parallel-edge bipartite graph | Adjacency eigenvalues=2k,−2k; alternating mode has modulus2k | Retained absolute-mixing distinction. |
| 67. BGS-10, Published Invent. Math. 179 (2010), p.581, (3.47), compared with Theorem 3.1 and (3.33) | t=1,s=10,dimG=3,τ=1/2,δ=1/7 | s>9 and δ<1/6; endpoint choices s=9,δ=1/6 remove both margins | Retained strict factor bound. |
| 68. CHEN-73-CN, Chinese original, p.127, (27) | Chen logarithmic expression V | −0.016472627076<V<−0.016472627074; corrected lower constant>2.6408077 | Retained safe endpoint. |

### Standing conventions and bundled acceptance definitions

| Statement | Instances tried | Values computed | Result and change |
| --- | --- | --- | --- |
| Native sieve mass and weights | P=1,A₁=10,X=7; zero label | R₁=3; zero survives P=1 and fails P=2 | No normalization or positivity of X silently assumed; Brun explicitly requires X≥0. |
| Positive divisors, indexed multiplicity and local obstruction | Divisors of 0; two equal labels; full F₂ bad set | Divisor finset empty; pushed mass 2; survivor count 0 | Native total-function conventions retained. |
| Factor counts and units | 1,8,12,0 | Ω=0,3,3,0; ω(8)=1; zero excluded from almost-prime locus | Multiplicity and nonunit Chen condition retained. |
| Fourier and inner-product direction | x=1/4,frequency −1; x=1,y=i | Vector coordinate i; projection coefficient −i, projected vector1 | Both conjugations agree. |
| Cutoffs, empty sums, total division and suprema | d=D=2; empty prime set; q=0; K₃(0) | Strict remainder excludes2; empty product1; discrepancy0; actual kernel9 versus totalized sine quotient0 | Denominator hypotheses retained; no cancellation at zero. |
| Prime indexing and discrepancy centers | First primes; x=5,q=3; x=4,q=1 | p₀=2,p₁=3; π-center3/2 versus coprime center1; ψ(4)=3log2+log3 | Distinct centers and endpoints retained. |
| Binary discriminant and dyadic symbol | q=x²+xy+y²; p=2 | D=1−4=−3; χ_D(2)=−1; prime-denominator symbol₂(3,2)=1 | Distinct characters retained. |
| Constant quantifiers and fixed cutoffs | θ=1/2,δ=1/8; α=0 | θ/2−δ=1/8>0; log α undefined at endpoint | Fixed-parameter order retained; α=0 treated separately. |
| SieveBrun.HasProductDimension | Native sieve P=1; interval w=z=2 | Product1≤K, and log ratio1 | Explicit s,κ,K binders retained. |
| SieveBrun.remainderMass | D=1,2 and P=1,R₁=3 | Mass0 then3 | Explicit s,D binders retained. |
| SieveRealCharacters.discriminantValue | n=0,1,2,3 with D=8 | 0,1,0,−1 | Both D and n remain in the elaborated type. |
| SieveSelberg.diagonalMass | P=2,ν₂=1/2,z=2,3 | G=1,2 | Strict divisor cutoff retained. |
| SievePolynomialFarey.coefficient | ℓ=0,H=1,G=0; ℓ=2,H=T²,G=1 | All0; c₀=0,c₁=1 | Prime p is an explicit Fact binder, matching the README. |
| SieveApplications.leastNonresidue | p=0,1,2,3,7 | 0,0,0,2,3 | Invalid-prime convention retained. |
| SieveQuadratic.primeDenominatorSymbol | Numerators3,6 at2; 9 at3 | 1,0,0 | Explicit numerical convention retained. |
| SieveDistribution.primeCountAP | x=5,q=0,a=5; x=4; x=5,q=1,a=0 | 1,0,3 | Natural floor and modulus-zero equality retained. |
| SieveDistribution.discrepancy | x=5,q=3,1,0 | 3/2,0,0 | Empty supremum and all-prime mean retained. |
| SieveDistribution.PrimesHaveLevel | θ=0,−1 and x>1 | Only q=1 gives0; negative level gives empty sum0 | All A>0, big-O along infinity and θ binder retained. |
| SieveDistribution.ElliottHalberstam | Levels1/2,3/4,1 | First two included, last excluded | Predicate is a hypothesis, not asserted. |
| SieveMaynard.IsAdmissible | Empty set; {0,1}; {0,2} at2 | Vacuous true; residue image size2; residue image size1 | Universal-prime condition retained. |
| SieveMaynard.primeTranslates | H empty; H={0,1} | All naturals; singleton {2} | Infinite and merely nonempty remain distinct. |
| SieveMaynard.maynardSimplex | k=0; k=1 with t=0,1,2 | Singleton empty tuple; first two allowed,2 excluded | Rank-zero and closed boundary retained. |
| SieveMaynard.maynardI | k=0,F=1; k=1,F=indicator[0,1]; zero F | 1,1,0 | Cube and empty-product measure retained. |
| SieveMaynard.maynardJ | k=1,indicator; k=2,triangle indicator | 1; 1/3 in each coordinate | Fibre/cube normalization retained. |
| SieveMaynard.IsMaynardAdmissible | Zero F; triangle indicator; constant1 on square | False at I=0; true with I=1/2,J=1/3; false outside simplex | Support, MemLp and every nonzero J retained. |
| SieveMaynard.maynardRatio | Triangle; zero function | (1/3+1/3)/(1/2)=4/3; 0/0=0 by total division | Ratio’s own domain convention retained; admissibility excludes zero. |
| SieveMaynard.maynardM | k=0,1 | Supremum of {0}=0; Cauchy–Schwarz bound1 attained by interval indicator | Supremum and native carriers retained. |

### Kernel sign computation and supplier boundary

For the cubic example under Exact supplier contracts, the real roots are approximately 1.2469796, −0.4450419, −1.8019377. Thus α has signs (+,−,−), and β has signs (−,−,+). Their two conjugate sign pairings give infinite factor −1. Both elements are 1 modulo8 and hence dyadic squares. The finite-field computations are:

| Kernel | Rational prime | Denominator roots | Numerator Legendre values | Product |
| --- | --- | --- | --- | --- |
| Φ(α,β) | 43 | 8,19 | −1,1 | −1 |
| Φ(α,β) | 83 | 10,57 | 1,−1 | −1 |
| Φ(β,α) | 13 | 7,10 | 1,1 | 1 |
| Φ(β,α) | 29 | 3,7 | −1,1 | −1 |

The full kernel values are therefore 1 and −1. The norms are obtained from −d³f(−1/d) at d=8,16, giving 377 and 3569. The cubic has no rational root and discriminant49, so its Galois group is cyclic of order3; the field has discriminant49 and Minkowski bound14/9<2, giving class number1. The signs of t,σ(t),−1 span all three sign coordinates. Since the unit-square quotient has dimension3, every totally positive unit is a square. Split primes41 and71 give the two class representatives and an F coprime to the displayed norms. Thus the witness satisfies the imported arithmetic hypotheses, rather than merely refuting an unrestricted auxiliary formula outside them.

## Check outcomes and maintainer consequences

- Requested acceptance elaboration, from the pinned content checkout: final exit code **0**, exactly **31** `declaration uses 'sorry'` warnings, no errors or other warnings. The file has **475 lines**, **19 definitions**, **31 headline theorems**, no examples, one `import Mathlib`, no additional imports, no sorry-valued data and no `set_option`. No Tau Ceti object build was needed. An initial filter inferred a real index; adding its explicit natural-number binder corrected that elaboration error.
- Mechanically appended `#check @name` for **all 50 declarations** to a scratch copy of the final acceptance file and elaborated it once after the final binder change: exit code **0**, the same **31** sorry warnings, no errors. Compared every elaborated type with its README statement. No standing binder disappeared. The three new headline signatures retain their dimension/cutoff, primality/nonnegativity, and full discriminant-range hypotheses; the coefficient definition now explicitly retains primality. All 14 additionally probed pinned declaration names elaborate.
- Re-ran citation resolution: **no unresolved cross-roadmap citation or own Lean name**. Its service-side pin lookup was unavailable, so the added library citations were checked locally at the pins with the signature probe and source files instead. Every own Lean name occurs in the README, and the deleted quadratic name does not remain there.
- TOML and JSON parsing pass; all **12** gap slugs are unique and have the matching owner/section line under Exact supplier contracts. Only the top-level `gaps` list changed in `design/plan.json`. `git diff --check` passes.
- Requested dependency check: exit code **0**, exact output:

```text
depcheck: 35 roadmaps, 333 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No additional gate failures were listed in the brief.

The declaration removed from the acceptance file is `SieveQuadratic.quadratic_largeSieve`; a consumer of that local spelling should instead cite AnalyticNumberTheoryPartII §5.29 and its `quadratic_large_sieve`. The seven new names are `SieveBrun.HasProductDimension`, `SieveBrun.remainderMass`, `SieveBrun.fundamental_estimate`, `SieveRealCharacters.discriminantValue`, `SieveQuadratic.jutila_mean_value`, `SievePolynomialFarey.coefficient` and `SievePolynomialFarey.large_sieve`. No other Lean declaration was renamed.

ArithmeticStatisticsPartV must discharge gap:joint-spin-proof-strengths, including the real-place sign correction; AnalyticNumberTheoryPartII must supply gap:jutila-unweighted-mean-square. The former geometry-tail requests were moved to the chain’s owner, not rejected as mathematical requirements. The general character/ideal interfaces here retain their full hypotheses. No supplier, consumer, tooling, merge order, issue or pull-request text was edited. No commit or push was made. This repair remains subject to the fresh independent review requested in the brief.
