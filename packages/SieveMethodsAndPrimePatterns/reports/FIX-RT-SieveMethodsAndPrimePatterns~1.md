# Repair findings: RT-SieveMethodsAndPrimePatterns_r1a.md

All locations below refer to `packages/SieveMethodsAndPrimePatterns/README.md` and `packages/SieveMethodsAndPrimePatterns/Suggested.lean` unless another repository-relative file is specified. Overlapping claims are settled once; the four additional findings from pass b follow separately.

## F01 (P3) — applied differently

68 admitted examples → no Lean examples. Their mathematical boundary cases stay in README Checks; imported-object tests and unused definitions leave the acceptance file. No replacement boundary theorems were added: that part of the suggested repair conflicts with the acceptance-test contract.

## F02 (P1) — applied

The dimension-κ denominator now sums over positive d with μ(d)². Added the 2ᵃ3ᵇ negative control: each contributes 1/2 without squarefree support. Rechecked the optimizer denominator, dimension-one diagonal sums and Maynard uses; these already include squarefree support. KED-ANT-14 §14.2 is the locator.

## F03 (P2) — applied differently

The one-dimensional native-divisor comparison now requires n+h₁>0. The weight construction explicitly sums its finite support, including zero labels. The R=2 Check now includes zero: finite weight 1, native divisor sum 0. No Lean example or construction was added.

## F04 (P1) — applied

Deleted the square-sum convergence inference and the resulting invalid coprime-sum replacement. The route now uses the complete H–R argument under Ω₁ and Ω₂, retaining the corrections. Added the sparse-prime counterexample and its divergent harmonic lower bound. GGPY-2009 lines 410–440 state precisely these hypotheses and conclusion; H–R remains a waived source.

## F05 (P1) — applied

Added the positive lower sieve for each fixed s>9t after the general beta sieve in §5.2, with strict local density, a uniform dimension product, positive constants and an absolute remainder threshold. Added the required lower-sifting-limit property to that prerequisite. Both affine consumers now use it, rather than the elementary u≥9t+1 estimate. BGS-10 Theorem 3.1 and §3.3 are uncertified locators.

## F06 (P2) — applied

Deleted the Lean affine finite-sum stand-in and its unused supporting definitions. The actual expansion-to-level theorem remains a README target on word populations and squarefree reductions. The module docstring identifies the missing population/mixing interfaces; it states no substitute.

## F07 (P1) — applied differently

Replaced every nonexistent AN/FF/AC/circle-method supplier label. Actual inputs come from AnalyticNumberTheoryPartI's numbered sections and InverseGaloisAndArithmeticFundamentalGroups §IG.2.5. Stronger analytic and geometric interfaces have named gaps. Polynomial counts and uniform-Q Cₘ (KM-21 lines 340–345) live here; no invented supplier declaration is asserted. The downstream ST.2 correction is recorded under pass b F04.

## F08 (P1) — not actionable in this package: supplier extensions require their owners

Registered distinct sliced-lattice, codimension-two, subgroup-approximation, squarefree-ring sum-product and SL₂-flattening gaps, with matching README contracts and plan entries. Tail and expansion consumers name them explicitly; Type I retains the geometric contracts. The latter two requests are assigned to AdelicAlgebraicGroups §4.2 as missing group-expansion inputs, not advertised exports. This package cannot supply those owners' proofs or acceptance decisions.

## F09 (P1) — applied

Deleted the three unweighted Gram target blocks and the duplicated Lean corollary; consumers import ErdosProgressionPowers §3.1. Its supplied head states all three forms, including the empty family, at `TauCetiRoadmap/ErdosProgressionPowers/README.md:1001`. The review's historical Lean name is absent at that head, so the contract cites the mathematical section. The stronger weighted-denominator theorem remains here.

## F10 (P1) — applied

The dyadic/Jacobi construction and periodicity development → a real natural-argument adapter to ThetaSeries §2H. Its zero extension and nontrivial-modulus comparison are explicit. Deleted the duplicated Lean character, periodicity theorem and dependent Jutila signature; the docstring explains the absent supplier carrier. `TauCetiRoadmap/ThetaSeries/README.md:562` establish ownership, including nonfundamental discriminants.

## F11 (P2) — applied

The fundamental-character comparison now takes hD explicitly and requires 1<D.natAbs. Added D=1,n=0: adapter value 0 versus native character value 1. `TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Basic.lean:76` includes D=1, and `TauCeti/NumberTheory/Multiquadratic/FundamentalDiscriminant/Character.lean:34` takes hD. The odd/dyadic and zero Checks agree with the adapter.

## F12 (P1) — not actionable in this package: conductor-prime counts belong to GlobalNumberFields

Registered gap:quadratic-order-conductor-counts against GlobalNumberFields Layer 11. The arbitrary-order growth target retains conductor primes and cites this gap, rather than importing maximal-order norm fibres for them. `TauCetiRoadmap/GlobalNumberFields/README.md:586` restrict extension/contraction to ideals away from the conductor; the missing conductor-local theorem cannot be added by editing this package.

## F13 (P1) — applied

Cohomological reciprocity stays with ClassFieldTheory Layer 14; classical comparisons and local computations come from QuadraticFormInvariants §6C. Added the ideal-symbol exchange adapter, finite support and odd-residue identifications before spin consumers. Its Checks compute (3/7)(7/3)=−1, the two signs for (−1,−1), and the excluded noncoprime case. `TauCetiRoadmap/QuadraticFormInvariants/README.md:1873` fix the ownership.

## F14 (P1) — applied differently

Added owned ideal divisor-subpower and weighted subpower-moment prerequisites in §5.6, with fixed-field, weight and ε dependence. They use AnalyticNumberTheoryPartI §§3.3–3.4 and 3.26. The logarithmic Λ bound is imported, not replanned: `TauCeti/NumberTheory/ArithmeticDirichletSeries/VonMangoldt.lean:180`. FIMR conversion now names these inputs; prime-power removal remains separate.

## F15 (P2) — applied

Added the Smith bilinear and Koymans–Pagano normalized-row headlines with finite odd-prime sets, disjointness, real bounds, growth and cardinality hypotheses. Quantifiers put ε before C and c₂,c₄,a before ε. Verified SMITH-17 lines 3226–3231 and KP-22 lines 2989–2997; mechanically checked both elaborated signatures against the README.

## F16 (P3) — applied differently

No Check-mirroring Lean declarations were added. Retained the nonempty dimension and χ₅(0) Checks, expanded prime-count/window/range Checks, and expanded the functional block to distinguish simplex support, I, every J, admissibility, ratio, M and the radial polynomial separately. Computed I=1/3150 and J=0 for the separating polynomial. The hypothesis-only Elliott–Halberstam examples were deleted with all admitted examples.

## F17 (P3) — applied differently

Deleted the closing declaration catalogue and the unused BinaryPolynomial abbreviation; no README alias is needed. Every retained declaration has its own mathematical docstring. Checks and absent APIs are prose, without fictitious Lean names. All 44 retained names occur in the README.

## F18 (P3) — applied

Updated both pin hashes to the supplied lake manifest. Replaced the later-library assertion with the pinned fundamental-discriminant character, its module and explicit hD argument. Both the requested file and the 44-signature probe elaborate against these pins. No Tau Ceti module import or build was needed by the retained acceptance statements.

## F19 (P3) — applied

Added `packages/SieveMethodsAndPrimePatterns/sources.toml`: 29 works, each with required metadata, locators and provenance/status. Available sources were fetched through the service; settled keys were reused. Four waived works and three uncertified works remain settled, with no renewed request. The manifest validator reports zero problems. This also clears the missing-manifest gate.

## F20 (P2) — applied

Added a uniform strict prime-density margin and the linear sieve's Euler-product condition; every omitted prime remains accounted for. The multiples-of-30 negative control now excludes g(2)=g(3)=g(5)=1. Direct evaluation gives f(4)=0.9783540 and integral term 0.5332102, hence positive margin 0.4451438; the review's larger decimal is unnecessary to its valid obstruction.

## F21 (P2) — applied differently

Restored the full cutoff and named the conservative intermediate. A≤πR² resolves the lcm range. Added a general character-Gram bound with error exponent 7−2θ; w=z^(5/max(5,7−2θ)) and the existing Euler-product comparison recover the full binary bound uniformly in θ. This avoids the source's coarse θ≥1/2-only step without narrowing the target. KHAYUTIN-19 lines 3460–3469 and 3573–3646 fix the source data.

# Additional findings: RT-SieveMethodsAndPrimePatterns_r1b.md

## F01 (P2) — applied

Added `SieveApplications.progression_upper` beside the interval and twin/Goldbach headlines. It includes k≥1, gcd(a,k)=1 and x≥4k, with one positive absolute constant chosen before k,a,x. The denominator is positive throughout this range. The supplied Mathlib elaborates the signature without any override.

## F02 (P3) — applied

The empty taper dependency line now names Mathlib `max_def` and `Int.cast_abs`. Verified at `Mathlib/Order/Defs/LinearOrder.lean:132` and `Mathlib/Algebra/Order/Ring/Cast.lean:81`. The taper computations remain 1 at the core endpoint, 1/2 at N=1,L=2,n=2, and 0 at the outer endpoint.

## F03 (P3) — applied

Replaced all three references to a “finding” with timeless mathematical descriptions of the inference, smooth-number count and cited edition. Removed the other affected stale-library/current-plan language during the supplier repair. No review narrative remains in the README.

## F04 (P3) — applied

Added the completed ArithmeticDirichletSeries link in Exact supplier contracts and separated its actual norm-fibre/convolution/prime-power inputs from the new owned moment estimates. Deleted the nonexistent ArithmeticStatistics ST.2 consumer assertion. The content issue overlapping pass a F14 is settled there, without attributing extra analytic estimates to the completed supplier.

# Gate repairs and validation

| Original gate failure | Repair | Final result |
|---|---|---|
| Missing sources.toml | Added all 29 cited works with required metadata, locators and legal provenance/status. | Package files and manifest checks: 0 problems. |
| tex=520 | Put TeX-bearing mathematical expressions in code spans; used Unicode in the three dependency titles exposed by prose conversion. No heading slug changed. | tex=0; latex=0. |
| sorry-examples=68 | Deleted all 68 admitted examples. Their boundary computations remain README Checks; no boundary theorem padding was introduced. | sorry-examples=0; example count 0. |
| readme-ids-missing=286 | Removed absent API identifiers and Check labels; dependency references use mathematical target descriptions. Kept only the 44 acceptance names and actual library/supplier names in code. | readme-ids-missing=0; all 44 retained names present. |

The worker's package text scanners, required-file check, source-manifest validator and plan-gap-reference check all return zero counts. Dependency validation is the separate required movable-order command. The content-tree CLI gate cannot itself be pointed at a board package as a normal roadmap checkout; its text scanners are the same functions used by the package gate.

Requested Lean elaboration: **exit 0**, with exactly **29** `declaration uses sorry` warnings and no errors or other diagnostics. The file has 29 headline theorems, 15 simple definitions and zero examples. Its sole import is `Mathlib`; no targeted Tau Ceti build was necessary.

The single scratch signature probe contains `#check @name` for **every one of the 44 retained declarations**. It elaborated with **exit 0**, the same 29 expected warnings, and 44 printed signatures. I compared each with its README statement: no required section binder disappeared. The new three headlines carry their hypotheses explicitly; Smith and Koymans–Pagano retain the stated constant order. Definitions unused by a headline were deleted rather than padded with test declarations.

The required dependency command returned **exit 0**, exactly:

```text
moved: SieveMethodsAndPrimePatterns moved in the merge order from #82 to #186, right after its last supplier ErdosProgressionPowers; checked as moved (the worker moves it there when it submits)
depcheck: 14 roadmaps, 106 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The merge-order file was not edited.

The citation resolver reports no unresolved cross-roadmap citations or Lean names. Its notice that it did not scan Lake packages is not treated as a library certificate: the new pinned inputs were separately read at their actual source locations. Source validation returns `packages/SieveMethodsAndPrimePatterns/sources.toml: 0 problem(s)`. All initial source-discovery failures were resolved; there is no outstanding missing-text request. BGS-10, FIMR-ERRATUM-2015 and DFI-1997 remain uncertified, not textually collated. CHEN-73-CN, HR-SIEVE, RICHERT-1969 and KM-16RANK-published retain their waived status.

# Ownership and consequences

Ownership searches used the roadmap search service, active/completed main and the supplied sibling heads, including ComputationalNumberTheory, EffectiveClassNumbers and ErdosProgressionPowers. No other package was edited. The general Gram and Kronecker constructions return to their existing owners. The new targets here are sieve-specific comparisons, the general finite-character Gram estimate, finite polynomial counts and ideal coefficient estimates needed by these findings; generic arithmetic carriers, Hilbert symbols and isoperimetry are consumed by section or pinned declaration.

The five expansion/spin supplier requests and the conductor-prime request require work outside this package. The additional analytic and bounded-degree geometric gaps are also explicit contracts, not claims that their owners have already delivered them. Their placement and implementation remain for those owners and the maintainer. The 12 slugs in `packages/SieveMethodsAndPrimePatterns/design/plan.json` match Exact supplier contracts. That file was absent; the created file contains only its permitted top-level gaps list.

ErdosProgressionPowers consumers should use its §3.1 unweighted Gram forms. The old local discriminant-character construction and affine finite-sum signature are no longer acceptance declarations; their actual adapter/expansion targets remain in prose. The appendix below lists every removed signature name so consumers can distinguish a removed acceptance declaration from deleted mathematics. No commits, pushes, issue writes or pull-request writes were made.

# Adversarial mathematics record

Finite computations test definitions, signs, zero conventions and hypotheses; they do not prove analytic asymptotics. Source theorem checks and the proof of the curvature implication are the evidence for the repaired mathematical statements. Asymptotic rows below report finite normalizations rather than pretending that a small input is beyond an unspecified threshold. Supplier-gap rows remain obligations, not accepted supplier theorems.

The following ledger has one row for each of the 228 target paragraphs, including the analytic proof requirement. The displayed values are finite input/output evaluations, not sampled proofs of asymptotic assertions.

| Statement (README section and line) | Instances tried | Values on the two sides / object values | Result | Change |
|---|---|---|---|---|
| §0.1, line 121: Weighted divisibility interchange | P=1, population {0,1}, weights 1, c(1)=−2 | −4 = −4; gcd(1,0)=1 | Matches stated boundary | Prose/API formatting only |
| §0.1, line 133: Exact Legendre sieve identity | P=6, support {0,1,2,3,6}, weights 1 | 5−3−3+2 = S = 1 | Matches stated boundary | Prose/API formatting only |
| §0.1, line 143: Euler-product main term with signed remainder | P=1, A₁=10, X=7 | 10 = 7+3; R₁=3 | Matches stated boundary | Prose/API formatting only |
| §0.1, line 155: Absolute Legendre error bound | P=1, A₁=10, X=7 | ‖10−7‖ = ‖R₁‖ = 3 | Matches stated boundary | Prose/API formatting only |
| §0.1, line 165: Lower sieve coefficient inequality | P=6, c=μ, support {0,1,2,3,6} | lower divisor sums at 1,2,3,6: 1,0,0,0; weighted sum = S = 1 | Matches stated boundary | Prose/API formatting only |
| §0.1, line 177: Lower main term minus absolute remainder | P=1, A₁=10, X=7, c(1)=1 | X main−err=7−3=4 ≤ S=10 | Matches stated boundary | Prose/API formatting only |
| §0.1, line 189: Remainder bound at a coefficient cutoff | P=1, R₁=3, c(1)=−2, D=1, C=2 | err=6 = 2·3; removing d=1 gives 0 incorrectly | Matches stated boundary | Prose/API formatting only |
| §0.1, line 201: First Bonferroni lower sieve bound | P=6, support {0,1,2,3,6} | A₁−A₂−A₃=−1 ≤ S=1 | Matches stated boundary | Prose/API formatting only |
| §0.2, line 215: Weighted finite-family sieve | labels 7,7; weights 2,3; P=2 | pushforward weight = A₇ = S = 2+3 = 5; empty family 0 = 0 | Matches stated boundary | Prose/API formatting only |
| §0.2, line 242: Divisibility sums of a weighted family | labels 7,7; weights 2,3; P=2 | pushforward weight = A₇ = S = 2+3 = 5; empty family 0 = 0 | Matches stated boundary | Prose/API formatting only |
| §0.2, line 252: Sifted sums of a weighted family | labels 7,7; weights 2,3; P=2 | pushforward weight = A₇ = S = 2+3 = 5; empty family 0 = 0 | Matches stated boundary | Prose/API formatting only |
| §0.3, line 266: Prime divisibility of a residue label | Q={2}, Ω₂={1}; integer labels 0 and 1 | L(0)=1, L(1)=2; divisibility false/true; coprimality true/false | Matches stated boundary | Prose/API formatting only |
| §0.3, line 278: Simultaneous local conditions as divisibility | Q={2}, Ω₂={1}; integer labels 0 and 1 | L(0)=1, L(1)=2; divisibility false/true; coprimality true/false | Matches stated boundary | Prose/API formatting only |
| §0.3, line 290: Local avoidance as coprimality | Q={2}, Ω₂={1}; integer labels 0 and 1 | L(0)=1, L(1)=2; divisibility false/true; coprimality true/false | Matches stated boundary | Prose/API formatting only |
| §0.3, line 302: Sieve with arbitrary excluded residue classes | Q={2}, Ω₂={1}; integer labels 0 and 1 | L(0)=1, L(1)=2; divisibility false/true; coprimality true/false | Matches stated boundary | Prose/API formatting only |
| §0.3, line 330: Divisibility sum equals the local intersection | Q={2}, Ω₂={1}; integer labels 0 and 1 | L(0)=1, L(1)=2; divisibility false/true; coprimality true/false | Matches stated boundary | Prose/API formatting only |
| §0.3, line 340: Sifted sum equals the original local avoidance count | Q={2}, Ω₂={1}; integer labels 0 and 1 | L(0)=1, L(1)=2; divisibility false/true; coprimality true/false | Matches stated boundary | Prose/API formatting only |
| §0.3, line 350: Deleting empty local conditions preserves the Euler product | Q={2,3}, Ω₂={1}, Ω₃=∅ | (1−1/2)(1−0)=1/2 = active-prime product | Matches stated boundary | Prose/API formatting only |
| §0.3, line 360: A fully excluded residue space leaves no survivors | Q={2}, Ω₂={0,1}, labels 0,1 | survivors 0 = asserted 0 | Matches stated boundary | Prose/API formatting only |
| §0.3, line 376: Legendre error for arbitrary local residue conditions | labels 0,1; weights 1,2; Q={2}, Ω₂={1}, X=3 | S=1; X V=3/2; ‖error‖=1/2=‖R₂‖+‖R₁‖ | Matches stated boundary | Prose/API formatting only |
| §0.4, line 396: Vanishing Gram row detects the zero vector | y=0 versus y=1 | row 0 iff vector 0; row 1 iff vector nonzero | Matches stated boundary | Prose/API formatting only |
| §0.4, line 406: Gram-row bound for a finite linear combination | real y=(1,2), c=(1,1) | ‖1+2‖²=9 = 3+6 | Matches stated boundary | Prose/API formatting only |
| §0.4, line 416: Selberg's normalized projection defect bound | real x=1,y=(1,2), c=(1/3,1/3) | defect 0 = 1−(1/3+4/6) | Matches stated boundary | Prose/API formatting only |
| §0.4, line 428: Selberg's weighted inner-product inequality | real x=1,y=(1,2); complex x=1,y=i | 1/3+4/6=1=‖x‖²; coefficient −i gives reconstruction 1 | Matches stated boundary | Prose/API formatting only |
| §0.5, line 442: Logarithmic sieve dimension | P={2}, g(2)=1/2,z=2,κ=0,C=log2/2 | sum = C = 0.3465735903; empty P,C=−1 gives 0>−1 | Matches stated boundary | Prose/API formatting only |
| §0.5, line 469: Euler-product sieve dimension | P={2},g(2)=1/2, [2,2), [2,3) | products 1 and 2; empty interval forces K≥1 | Matches stated boundary | Prose/API formatting only |
| §0.5, line 496: Truncated remainder mass | P=1,R₁=3,D=1 then 2; c(1)=2 | masses 0 and 3; at D=2 coefficient error 6=2·3 | Matches stated boundary | Prose/API formatting only |
| §0.5, line 523: Level of distribution of a sieve family | X=1 with all R=0; then R₁=1 | remainder masses 0 versus 1 for D>1; θ=0 excluded in both cases | Matches stated boundary | Prose/API formatting only |
| §0.5, line 550: Coefficient error controlled by remainder mass | P=1,R₁=3,D=1 then 2; c(1)=2 | masses 0 and 3; at D=2 coefficient error 6=2·3 | Matches stated boundary | Prose/API formatting only |
| §0.5, line 562: Finite tilted density Euler product | P=1,ν(1)=1,x=1; empty selected prime set | divisor sum 1 = Euler product 1; Rankin bound 1≤1 | Matches stated boundary | Prose/API formatting only |
| §0.5, line 574: Weighted Rankin cutoff bound | P=1,ν(1)=1,x=1; empty selected prime set | divisor sum 1 = Euler product 1; Rankin bound 1≤1 | Matches stated boundary | Prose/API formatting only |
| §0.5, line 586: Weighted Rankin remainder-tail bound | P=1,ν(1)=1,x=1 | strict tail 0 ≤ product bound 1 | Matches stated boundary | Prose/API formatting only |
| §0.5, line 598: Tilted Euler-product estimate from logarithmic dimension | P=1,ν(1)=1,x=1; empty selected prime set | divisor sum 1 = Euler product 1; Rankin bound 1≤1 | Matches stated boundary | Prose/API formatting only |
| §0.5, line 610: Dimension-controlled weighted divisor count | P=1,ν(1)=1,x=1; empty selected prime set | divisor sum 1 = Euler product 1; Rankin bound 1≤1 | Matches stated boundary | Prose/API formatting only |
| §0.5, line 622: Dimension-controlled divisor-density tail | P=1,ν(1)=1,x=1 | strict tail 0 ≤ product bound 1 | Matches stated boundary | Prose/API formatting only |
| §0.5, line 634: Eratosthenes estimate with a justified mass and divisor cutoff | P=1, support {1},X=M=x=1,c=0 | ‖S−X‖=0 ≤ 1; cutoff at d=1 retains the mass | Matches stated boundary | Prose/API formatting only |
| §0.6, line 648: Real discriminant character adapter | D=5,8,1; n=0,1,2,3 | χ₅(2)=−1; χ₈(2)=0; χ₈(3)=−1; χ₁(0)=0≠1 (native modulus one) | Matches stated boundary | Supplier adapter and modulus restriction |
| §0.7, line 669: Binary polynomial local densities | Q=x²; moduli 0,1,4,8,9 | ρ=0,1,8,16,27 respectively; at p²=9, 27>degree·p²=18 | Matches stated boundary | Prose/API formatting only |
| §0.7, line 700: Curve lifting and singular correction | Q=x²,p=2,k=2 | ρ(4)=8, ρ̃(4)=4, singular ρ(8)=16; 4·4=4·8−16 | Matches stated boundary | Prose/API formatting only |
| §0.7, line 710: Binary Schwartz–Zippel specialization | Q=x²,p=3; Q=0 as excluded control | ρ(3)=3≤3·2=6; zero reduction has 9 zeros | Matches stated boundary | Prose/API formatting only |
| §0.7, line 720: Multiplicative sieve growth class | f(n)=1 for n>0, A=B=1,ε=1 | f(1)=1=min(1,1); f(2)=1≤min(1,2); f(n)=n fails A=1 at n=2 | Matches stated boundary | Prose/API formatting only |
| §0.7, line 745: Binary density correction factor | Q=x,p=3, n=3 and 9 | ρ(3)=3; λ(3)=2/3; θ(3)=θ(9)=5/3=1+2/3 | Matches stated boundary | Prose/API formatting only |
| §0.8, line 773: Integral local normal forms for conic counts | q=x²+y²; even-bilinear matrix diag(2,2) | half-norm(1,1)=2=q(1,1); D=−4 | Matches stated boundary | Prose/API formatting only |
| §0.8, line 783: Regular-prime conic densities | Q=x²+y²+4; moduli 3,5,9 | counts 4,4,12 = p^(n−1)(p−χ₋₄(p)) | Matches stated boundary | Prose/API formatting only |
| §0.8, line 793: Singular-prime conic density recursion | q₀=x²−y²,p=3; (n,m)=(1,1),(2,1),(2,2) | R=5=4+1; 12=12+0; 21=12+9 | Matches stated boundary | Prose/API formatting only |
| §0.8, line 805: Uniform conic local-density bound | q=x²+y²,D=−4,ω=1,p=3,n=2 | ρ(9)=12 ≤16·3³=432 | Matches stated boundary | Prose/API formatting only |
| §0.8, line 815: Genus-restricted conic density sum | p=3,u=u_A=ω=1,k=1,ε=−1 | actual count 18 = corrected formula; opposite sign gives 9 | Matches stated boundary | Prose/API formatting only |
| §0.9, line 827: Quadratic-order ideal counts in the growth class | maximal order ℤ[i], norms 1,2,5,9 | invertible ideal counts 1,1,2,1 ≤ divisor majorants 1,2,2,3; conductor cases require gap | Boundary matches; supplier obligation remains | Conductor gap registered |
| §0.10, line 839: Polynomial-vector sieve data | p=2,D=T³; A=T²,D=T,I={T}; coupled Bernoulli labels | norm 8; rough event 0 although divisibility 1; joint probability 1/2≠1/4 | Matches stated boundary | Prose/API formatting only |
| §0.10, line 869: Finite-field polynomial counts for the vector sieve | 𝔽₂, j=0,1,2 | monic counts 1,2,4; irreducible counts 0,2,1; harmonic sum through 2 is 5/4≤3/2 | Matches stated boundary | Owned finite count prerequisite |
| §1.1, line 911: Selberg's diagonal sum in dimension one (GGPY Lemma 3, κ=1) | γ(p)=1; sparse γ(pⱼ)/pⱼ=log2/logpⱼ | cγ=1 in the first case; sparse weighted square term ≥log2/(j+1), divergent; no square-sum inference | Finite normalization | Proof route repaired |
| §1.1, line 929: Smoothly weighted diagonal sum (Maynard Lemma 6.1, GGPY Lemma 4) | γ(p)=1; sparse γ(pⱼ)/pⱼ=log2/logpⱼ | cγ=1 in the first case; sparse weighted square term ≥log2/(j+1), divergent; no square-sum inference | Matches stated boundary | Prose/API formatting only |
| §1.2, line 943: Brun combinatorial coefficients | P=2,y=8,β=2 | λ⁺(1)=λ⁻(1)=1; λ⁺(2)=0,λ⁻(2)=−1; brackets at r=2: 0≤0≤1; support 2<8 | Matches stated boundary | Prose/API formatting only |
| §1.2, line 970: Brun pointwise divisor brackets | P=2,y=8,β=2 | λ⁺(1)=λ⁻(1)=1; λ⁺(2)=0,λ⁻(2)=−1; brackets at r=2: 0≤0≤1; support 2<8 | Matches stated boundary | Prose/API formatting only |
| §1.2, line 982: Brun coefficient modulus bound | P=2,y=8,β=2 | λ⁺(1)=λ⁻(1)=1; λ⁺(2)=0,λ⁻(2)=−1; brackets at r=2: 0≤0≤1; support 2<8 | Matches stated boundary | Prose/API formatting only |
| §1.2, line 994: Strict Brun coefficient support | P=2,y=8,β=2 | λ⁺(1)=λ⁻(1)=1; λ⁺(2)=0,λ⁻(2)=−1; brackets at r=2: 0≤0≤1; support 2<8 | Matches stated boundary | Prose/API formatting only |
| §1.2, line 1006: Dimension-controlled Brun main terms | P=1,X=1,R₁=0,κ=1,K=2,u=10 | V=main±=S=1; δ=2¹⁰=1024; elementary lower main factor −1023 is not positive | Matches stated boundary | Prose/API formatting only |
| §1.2, line 1018: Brun fundamental sieve estimate | P=1,X=1,R₁=0,κ=1,K=2,u=10 | V=main±=S=1; δ=2¹⁰=1024; elementary lower main factor −1023 is not positive | Matches stated boundary | Prose/API formatting only |
| §1.3, line 1032: Selberg optimal weights | P=6,ν(2)=1/2,ν(3)=1/3,z=4; P=1,z=1 | G=5/2,λ=(1,−4/5,−3/5,0), main=2/5; strict G(1)=0 excludes z=1 | Matches stated boundary | Prose/API formatting only |
| §1.3, line 1058: Selberg upper-bound sieve | P=6,ν(2)=1/2,ν(3)=1/3,z=4; P=1,z=1 | G=5/2,λ=(1,−4/5,−3/5,0), main=2/5; strict G(1)=0 excludes z=1 | Matches stated boundary | Prose/API formatting only |
| §1.4, line 1070: Binary sieve Euler denominator | g(p)=0, z=2, degree bound 1 | squarefree sum 1 = Euler product 1 | Matches stated boundary | Prose/API formatting only |
| §1.4, line 1080: Curvature-to-area and lcm cutoff comparison | circle R=32,θ=1,z=2; unrelated-R control | 1024≤A=3216.990877; z²=4≤√A=56.7185; unrelated data give 14400>10000 | Matches stated boundary | New comparison |
| §1.4, line 1095: Finite-character Gram bound from lattice discrepancies | circle R=32,θ=1,w=2,Cₗ=1000, coefficient1 only at origin | N=3209; four frequency sums1 give left4; right=3209+2048·1000=2051209 | Matches stated boundary | Owned general Gram bound |
| §1.4, line 1121: Binary-form large sieve on convex domains | disk radius 32,Q=x,θ=1,z=2,a=k₀=k₁=k₂=1 | positive-x lattice count 1572; rough-product scale A=3216.990877; modulus-one comparisons are identities | Finite normalization | Full cutoff restored |
| §1.4, line 1131: Binary-form large sieve with a conservative cutoff | disk radius 32,Q=x,θ=1,z=2,a=k₀=k₁=k₂=1 | positive-x lattice count 1572; rough-product scale A=3216.990877; modulus-one comparisons are identities | Finite normalization | Named intermediate |
| §1.4, line 1137: Binary sieve cutoff comparison | Q=x,z=3,s=1 | both Euler products 1/2; multiplicative cutoff factor s^degree=1 | Matches stated boundary | Prose/API formatting only |
| §1.4, line 1147: Binary polynomial sieve at power level | disk radius 32,Q=x,θ=1,z=2,a=k₀=k₁=k₂=1 | positive-x lattice count 1572; rough-product scale A=3216.990877; modulus-one comparisons are identities | Matches stated boundary | Prose/API formatting only |
| §1.4, line 1157: Binary sieve with divisibility conditions | disk radius 32,Q=x,θ=1,z=2,a=k₀=k₁=k₂=1 | positive-x lattice count 1572; rough-product scale A=3216.990877; modulus-one comparisons are identities | Matches stated boundary | Prose/API formatting only |
| §1.4, line 1167: Multiplicative decoupling inequality | Z=1,g=δ₁,ψ=δ₁ (so ψ(pʲ)=0 for j≥1) | sum 1 = 1·empty product 1 | Matches stated boundary | Prose/API formatting only |
| §1.4, line 1177: Average absorption of the density correction | Q=x,f=1,z=3 | base 11/6; corrected 23/9; ratio 46/33<2 | Matches stated boundary | Prose/API formatting only |
| §1.4, line 1187: Large smooth-factor saving | Q=x,f=δ₁,z=e⁴,α=1/2,s=κ=1,r=1,ε=1/10 | left 0; right scale e^(−1/2)=0.60653066; κ≤1.8 | Matches stated boundary | Prose/API formatting only |
| §1.4, line 1197: Extremely smooth-factor saving | Q=x,z=16,r=1; α=0,β=1 and α=1,β=1/2 | left 31/16≤16; endpoint left 1/16≤1/4; constants fixed after α | Matches stated boundary | Prose/API formatting only |
| §1.4, line 1207: Binary multiplicative-function sieve | disk radius 32,Q=x,θ=1,z=2,a=k₀=k₁=k₂=1 | positive-x lattice count 1572; rough-product scale A=3216.990877; modulus-one comparisons are identities | Matches stated boundary | Prose/API formatting only |
| §1.4, line 1215: Analytic proof requirement | Q=x²,p=3 | ordinary ρ(9)=27>18; corrected ρ̃(3)=0; ordinary bound is not implied | Matches stated boundary | Prose/API formatting only |
| §1.4, line 1219: Binary sieve with a fixed divisor | disk radius 32,Q=x,θ=1,z=2,a=k₀=k₁=k₂=1 | positive-x lattice count 1572; rough-product scale A=3216.990877; modulus-one comparisons are identities | Matches stated boundary | Prose/API formatting only |
| §1.4, line 1229: Binary sieve with a unit congruence | disk radius 32,Q=x,θ=1,z=2,a=k₀=k₁=k₂=1 | positive-x lattice count 1572; rough-product scale A=3216.990877; modulus-one comparisons are identities | Matches stated boundary | Prose/API formatting only |
| §1.5, line 1241: Polynomial Bonferroni brackets | bad subset cardinalities 0,1,2; v=1 | lower sums 1,0,−1; indicators 1,0,0; upper sums 1,0,0 | Matches stated boundary | Prose/API formatting only |
| §1.5, line 1251: Brun sieve for polynomial vectors | one 𝔽₂ component A=D=1,I={T},ℓ=11 | rough probability 1; product main scale 2·1/2=1; defect term for T is 1/2 | Matches stated boundary | Prose/API formatting only |
| §1.5, line 1261: Polynomial Euler product excluding T | p=2,m=0 and 1 | products 1 and 1/2; upper bounds 2 and 1 | Matches stated boundary | Prose/API formatting only |
| §1.6, line 1273: Prime upper bound in intervals | x=y=2 | π(4)−π(2)=1; leading scale 4/log2=5.77078 | Finite normalization | Prose/API formatting only |
| §1.6, line 1283: Prime upper bound in progressions | (k,a,x)=(1,0,4),(3,1,12) | counts 2 and 1; C=1 scales 4/log4 and 12/(2log4), both positive | Finite normalization | Prose/API formatting only |
| §1.6, line 1293: Selberg bounds for twin primes and Goldbach | x=7; even N=4 and 10 | twin count 2; ordered Goldbach counts 1 and 3; odd-prime local products 1 and 4/3 | Matches stated boundary | Prose/API formatting only |
| §1.6, line 1303: Brun reciprocal convergence | twin primes p≤7: 3 and 5 | partial sums 1/3+1/5=8/15 and 1/5+1/7=12/35 | Matches stated boundary | Prose/API formatting only |
| §1.6, line 1313: Selberg denominator in dimension κ | g=μ²/n, z=10000 | squarefree denominator 10.5433421; 2ᵃ3ᵇ overcount alone 22.5, versus log z=9.2103404 | Finite normalization | μ² support |
| §1.6, line 1329: Selberg parity sequences | n=4,12,0 | (even,odd) weights (1,0),(0,1),(0,0); Ω(12)=3 versus ω(12)=2 | Matches stated boundary | Prose/API formatting only |
| §2.1, line 1387: Multiplicity of an integer difference | M=2,n=0,1,2 | pair counts 2,1,0 = truncated 2−‖n‖ | Matches stated boundary | Prose/API formatting only |
| §2.1, line 1399: Triangular Fourier sum as a squared modulus | M=2,t=1/2; t=0 control | K=0 = sin²π/sin²(π/2); integral phase K=4 while quotient is undefined mathematically | Matches stated boundary | Prose/API formatting only |
| §2.1, line 1409: Sine quotient for a finite Fourier sum | M=2,t=1/2; t=0 control | K=0 = sin²π/sin²(π/2); integral phase K=4 while quotient is undefined mathematically | Matches stated boundary | Prose/API formatting only |
| §2.1, line 1421: Piecewise taper weights and their bounds | N=1,L=2,n=1,2,3; L=0 control | W=1,1/2,0; totalized L=0 gives 0 | Matches stated boundary | Prose/API formatting only |
| §2.1, line 1433: Finite tapered Fourier vector | N=1,L=2, frequency −1,x=1/4, coefficient 1 | coordinate i; pairing −i=e(−1/4); core weight 1; L=0 vector 0 | Matches stated boundary | Prose/API formatting only |
| §2.1, line 1459: Coordinates of the tapered Fourier vector | N=1,L=2, frequency −1,x=1/4, coefficient 1 | coordinate i; pairing −i=e(−1/4); core weight 1; L=0 vector 0 | Matches stated boundary | Prose/API formatting only |
| §2.1, line 1471: Untapered coordinates on the core | N=1,L=2, frequency −1,x=1/4, coefficient 1 | coordinate i; pairing −i=e(−1/4); core weight 1; L=0 vector 0 | Matches stated boundary | Prose/API formatting only |
| §2.1, line 1481: Signed Gram kernel of tapered vectors | N=L=1,x−y=1/2 | Gram=−1=(K₂−K₁)/1; modulus 1≠−1 | Matches stated boundary | Prose/API formatting only |
| §2.1, line 1491: Squared norm of the tapered Fourier vector | N=1,L=2 | weight sum 1/2+1+1+1+1/2=4=2N+L | Matches stated boundary | Prose/API formatting only |
| §2.1, line 1501: Off-diagonal tapered Gram bound | N=L=1,x−y=1/2 | modulus 1 ≤1/(1·sin²(π/2))=1 | Matches stated boundary | Prose/API formatting only |
| §2.1, line 1511: Tapered pairing recovers a core Fourier sum | N=1,L=2, frequency −1,x=1/4, coefficient 1 | coordinate i; pairing −i=e(−1/4); core weight 1; L=0 vector 0 | Matches stated boundary | Prose/API formatting only |
| §2.1, line 1523: Large-sieve bound from cosecant row control | two frequencies 0,1/2; N=L=1; f at frequency 0 | Fourier energy 2≤(2+1+1)·1=4 | Matches stated boundary | Prose/API formatting only |
| §2.2, line 1539: Sine lower bound from circular distance | t=1/2 and 1/4 | 4d²=1 and 1/4; sin²=1 and 1/2 | Matches stated boundary | Prose/API formatting only |
| §2.2, line 1549: Two-point bound for circular radial bins | δ=3/10, points 0 and 2/5 | radial floor 1; bin count 1≤2, despite upper endpoint 3/5>1/2 | Matches stated boundary | Prose/API formatting only |
| §2.2, line 1559: Separated cosecant-square row bound | δ=1/2, points 0 and 1/2 | row sum 1≤π²/3=3.2898681 | Matches stated boundary | Prose/API formatting only |
| §2.2, line 1569: Explicit positive integer taper width | δ=1/2,L=2 | L+π²/(12δ²L)=3.6449341≤4=2/δ | Matches stated boundary | Prose/API formatting only |
| §2.2, line 1579: Large sieve on the centered finite core | H=2,a=(1,1), frequencies 0,1/2,δ=1/2 | energy 4≤(2+4)·2=12; H=0 gives 0≤0 | Finite normalization | Prose/API formatting only |
| §2.2, line 1591: Centered interval coefficient vector | H=2,L=2,a=(1,i); H=0 control | padded frequencies 0,1; norm²=2=1+1; translation centre at M=0 is 1; empty norm 0 | Matches stated boundary | Prose/API formatting only |
| §2.2, line 1617: Coordinates of the centered interval vector | H=2,L=2,a=(1,i); H=0 control | padded frequencies 0,1; norm²=2=1+1; translation centre at M=0 is 1; empty norm 0 | Matches stated boundary | Prose/API formatting only |
| §2.2, line 1629: Core support of the interval vector | H=2,L=2,a=(1,i); H=0 control | padded frequencies 0,1; norm²=2=1+1; translation centre at M=0 is 1; empty norm 0 | Matches stated boundary | Prose/API formatting only |
| §2.2, line 1639: Norm preservation under interval padding | H=2,L=2,a=(1,i); H=0 control | padded frequencies 0,1; norm²=2=1+1; translation centre at M=0 is 1; empty norm 0 | Matches stated boundary | Prose/API formatting only |
| §2.2, line 1649: Fourier translation of the padded interval | H=2,L=2,a=(1,i); H=0 control | padded frequencies 0,1; norm²=2=1+1; translation centre at M=0 is 1; empty norm 0 | Matches stated boundary | Prose/API formatting only |
| §2.2, line 1659: Cardinality above the circle diameter | δ=3/5 | two points impossible since maximum distance 1/2<3/5; singleton cardinal 1 | Matches stated boundary | Prose/API formatting only |
| §2.2, line 1669: Bombieri's additive large sieve | H=2,a=(1,1), frequencies 0,1/2,δ=1/2 | energy 4≤(2+4)·2=12; H=0 gives 0≤0 | Finite normalization | Prose/API formatting only |
| §2.3, line 1685: Circular separation of reduced fractions | Q=2, fractions 0/1 and 1/2 | circle distance 1/2≥1/Q²=1/4 | Matches stated boundary | Prose/API formatting only |
| §2.3, line 1695: Additive large sieve over reduced residues | Q=H=1,a=1,M=0 | primitive/reduced energy 1≤(1+2)·1=3; q/φ(q)=1 | Finite normalization | Prose/API formatting only |
| §2.3, line 1705: Integer phase of the standard residue character | q=2,u=1,n=1 | stdAddChar(1)=−1=e(1/2); q=1 gives 1=1 | Matches stated boundary | Prose/API formatting only |
| §2.3, line 1715: Squared norm of a primitive Dirichlet Gauss sum | q=1, unit coefficient/function 1; principal q=4 control | primitive energy and Gauss norm² 1=1; q=4 principal Gauss sum 0 and not primitive | Matches stated boundary | Prose/API formatting only |
| §2.3, line 1727: Gauss expansion of a finite character sum | q=1, unit coefficient/function 1; principal q=4 control | primitive energy and Gauss norm² 1=1; q=4 principal Gauss sum 0 and not primitive | Matches stated boundary | Prose/API formatting only |
| §2.3, line 1739: Parseval identity over Dirichlet characters | q=1, unit coefficient/function 1; principal q=4 control | primitive energy and Gauss norm² 1=1; q=4 principal Gauss sum 0 and not primitive | Matches stated boundary | Prose/API formatting only |
| §2.3, line 1749: Primitive character energy at one modulus | Q=H=1,a=1,M=0 | primitive/reduced energy 1≤(1+2)·1=3; q/φ(q)=1 | Matches stated boundary | Prose/API formatting only |
| §2.3, line 1759: Primitive-character large sieve | Q=H=1,a=1,M=0 | primitive/reduced energy 1≤(1+2)·1=3; q/φ(q)=1 | Finite normalization | Prose/API formatting only |
| §2.4, line 1773: Incomplete logarithm | n=0..40,U,V=0..6; n=8,U=V=2 witness | 2009 exact prime-log coefficient identities; n=0: 0=0; n=8: log2=log2 | Matches stated boundary | Prose/API formatting only |
| §2.4, line 1800: Subtracting the short von Mangoldt divisor sum | n=0..40,U,V=0..6; n=8,U=V=2 witness | 2009 exact prime-log coefficient identities; n=0: 0=0; n=8: log2=log2 | Matches stated boundary | Prose/API formatting only |
| §2.4, line 1810: Vanishing below the incomplete-log cutoff | V=3,n=2; n=0 | λ₃(2)=0 and λ₃(0)=0 | Matches stated boundary | Prose/API formatting only |
| §2.4, line 1820: Pointwise incomplete-log coefficient bounds | n=0..40,U,V=0..6; n=8,U=V=2 witness | 2009 exact prime-log coefficient identities; n=0: 0=0; n=8: log2=log2 | Matches stated boundary | Prose/API formatting only |
| §2.4, line 1830: Möbius inversion of the incomplete logarithm | n=0..40,U,V=0..6; n=8,U=V=2 witness | 2009 exact prime-log coefficient identities; n=0: 0=0; n=8: log2=log2 | Matches stated boundary | Prose/API formatting only |
| §2.4, line 1840: Vaughan's identity with its boundary term | n=0..40,U,V=0..6; n=8,U=V=2 witness | 2009 exact prime-log coefficient identities; n=0: 0=0; n=8: log2=log2 | Matches stated boundary | Prose/API formatting only |
| §2.4, line 1850: Weighted Vaughan identity on a finite hyperbola | n=0..40,U,V=0..6; n=8,U=V=2 witness | 2009 exact prime-log coefficient identities; n=0: 0=0; n=8: log2=log2 | Matches stated boundary | Prose/API formatting only |
| §2.4, line 1860: Exact support of the bilinear Vaughan term | V=2,ℓ=4,m=1,N=4 | λ₂(4)=log2≠0; 2<4 and 1≤floor(4/3)=1 | Matches stated boundary | Prose/API formatting only |
| §2.4, line 1870: Finite Type I–Type II Vaughan decomposition | n=0..40,U,V=0..6; n=8,U=V=2 witness | 2009 exact prime-log coefficient identities; n=0: 0=0; n=8: log2=log2 | Finite normalization | Prose/API formatting only |
| §2.4, line 1880: Elementary Vaughan coefficient energies | V=2,L=1,M=2 | λ₂(2)=0; first energy 0≤log²2; μ(2)²=1=M−L | Matches stated boundary | Prose/API formatting only |
| §2.5, line 1894: Primitive character energy on a dyadic band | all coefficients zero; empty dyadic band J=0 | E_a=E_b=T=0; both sides 0, including every cofactor mask | Matches stated boundary | Prose/API formatting only |
| §2.5, line 1906: Bilinear primitive character bound on one band | all coefficients zero; empty dyadic band J=0 | E_a=E_b=T=0; both sides 0, including every cofactor mask | Matches stated boundary | Prose/API formatting only |
| §2.5, line 1918: Exact partition of the dyadic modulus interval | R=1,J=2,c(q)=1 | 3 integers in (1,4]; bands have 1+2=3 | Matches stated boundary | Prose/API formatting only |
| §2.5, line 1930: Finite sum of the bilinear dyadic coefficients | R=1,H=K=0,J=1 and 0 | coefficient sum 8≤9; at J=0 both sides 0 | Matches stated boundary | Prose/API formatting only |
| §2.5, line 1942: Primitive bilinear tail through a dyadic endpoint | all coefficients zero; empty dyadic band J=0 | E_a=E_b=T=0; both sides 0, including every cofactor mask | Matches stated boundary | Prose/API formatting only |
| §2.5, line 1954: Primitive bilinear tail at an arbitrary cutoff | all coefficients zero; empty dyadic band J=0 | E_a=E_b=T=0; both sides 0, including every cofactor mask | Matches stated boundary | Prose/API formatting only |
| §2.6, line 1968: Squared finite large-sieve duality | matrix [[1,i]]; coefficient (1,−i) | forward energy 4≤2·2=4; adjoint energy at b=1 is 2=2·1 | Matches stated boundary | Prose/API formatting only |
| §2.7, line 1980: Heath-Brown quadratic large sieve | M=N=1,a₁=1 | Jacobi(1,1)=1; energy 1≤C·2 with C=1 | Finite normalization | Prose/API formatting only |
| §2.7, line 1990: Heath-Brown quadratic bilinear estimate | M=N=1,a=b=1 | sum modulus 1≤C(1+1)=2 at C=1 | Matches stated boundary | Prose/API formatting only |
| §2.7, line 2000: Prime-denominator quadratic symbol | p=2,3; a=3,6,2,9 | symbol₂(3,2)=1; symbol₂(6,2)=0; (2/3)=−1; (9/3)=0 | Matches stated boundary | Prose/API formatting only |
| §2.7, line 2024: Prime quadratic-symbol bilinear estimate | K=3,L=2,a=b=1 | sum=2 from odd numerators 1,3; even numerator contributes 0 | Matches stated boundary | Prose/API formatting only |
| §2.7, line 2034: Jutila mean value lemma | X=8,N=2,a supported at 2 | six nonsquare discriminants; energy 3; square-product diagonal scale 8≥3 | Matches stated boundary | Prose/API formatting only |
| §2.7, line 2044: Smith prime Legendre-symbol estimate | X₁={3,5},X₂={7,13},t₁=5,t₂=13,ε=1/10,c₂=c₄=1,a=1/10 | symbol rows (−1,1),(−1,−1); absolute row sum 2; cardinal lower bounds 0.311,0.507<2; log13<5 | Matches stated boundary | Lean headline added |
| §2.7, line 2054: Koymans–Pagano normalized row mean | X₁={3,5},X₂={7,13},t₁=5,t₂=13,ε=1/10,c₂=c₄=1,a=1/10 | symbol rows (−1,1),(−1,−1); absolute row sum 2; cardinal lower bounds 0.311,0.507<2; log13<5 | Matches stated boundary | Lean headline added |
| §2.8, line 2068: Polynomial Farey coefficient adapter | p=2,G=1,H=T+1,ℓ=1; one-point coefficient population | reciprocal expansion at infinity has c₀=c₁=1; additive phase −1; squared norm 1 | Matches stated boundary | Prose/API formatting only |
| §2.8, line 2094: Polynomial Farey large sieve | p=2,ℓ=m=1,all f₀=1 | two reduced fractions (one per monic linear denominator); left 2≤2^(2−1)·2=4 | Finite normalization | Prose/API formatting only |
| §2.8, line 2104: Additive sieve for bounded integer coefficients | H=Y=1,a₀=1,all other a=0 | only q=1 contributes; left 1≤3(1+1)·1=6 | Matches stated boundary | Prose/API formatting only |
| §2.9, line 2116: Separated Hilbert inequality | x=(0,1/2),a=(1,i),δ=1/2 | Hilbert sum modulus 4≤(π/δ)·2=4π | Matches stated boundary | Prose/API formatting only |
| §2.9, line 2126: Sharp separated additive large sieve | H=2,a=(1,1),x=(0,1/2),δ=1/2 | left 4≤(H−1+δ⁻¹)·2=6 | Finite normalization | Prose/API formatting only |
| §2.9, line 2136: Sharp primitive-character large sieve | Q=H=1,a=1 | left 1 = (H−1+Q²)·1 | Finite normalization | Prose/API formatting only |
| §2.9, line 2146: Large sieve for forbidden residues | P={2},Ω₂={0}, interval {1,2}, surviving indicator | Z=1; L denominator 1+1=2; energy uses coefficient at 2 equal 0 | Finite normalization | Prose/API formatting only |
| §2.9, line 2156: Least quadratic nonresidue | p=3,7,2 | least nonresidues 2,3,0 (the last is outside the odd-prime domain) | Matches stated boundary | Prose/API formatting only |
| §2.9, line 2181: Linnik bounded exceptional primes | N=7,ε=1/2 | exceptional set {7}, cardinal 1; 2²≤7<3² distinguishes p=3 and p=7 | Finite normalization | Prose/API formatting only |
| §3.1, line 2221: Level of distribution of the primes (Maynard (1.3)) | x=10,q=3 and q=1; θ=0 | class counts 1,2 versus mean 2 give discrepancy 1; q=1 discrepancy 0, so level-zero sum 0 | Matches stated boundary | Prose/API formatting only |
| §3.2, line 2260: Arithmetic progression discrepancy | f=δ₂,x=3,q=3,a=1; q=2 control | D=0−1/2=−1/2; at q=2 the nonunit is omitted, D=0 | Matches stated boundary | Prose/API formatting only |
| §3.2, line 2287: Discrepancy to restricted character sums | f=g=0, positive cutoffs; q=1 principal-conductor control | discrepancies, energies and restricted sums 0=0; nonprincipal character family at q=1 is empty | Matches stated boundary | Prose/API formatting only |
| §3.2, line 2297: Primitive-conductor reduction of discrepancies | f=g=0, positive cutoffs; q=1 principal-conductor control | discrepancies, energies and restricted sums 0=0; nonprincipal character family at q=1 is empty | Matches stated boundary | Prose/API formatting only |
| §3.2, line 2307: Convolution discrepancy mean value | f=g=0, positive cutoffs; q=1 principal-conductor control | discrepancies, energies and restricted sums 0=0; nonprincipal character family at q=1 is empty | Matches stated boundary | Prose/API formatting only |
| §3.2, line 2317: Maximal Bombieri–Vinogradov theorem | q=1,x=4, with every real y≤4 | sup error 3−log2=2.3068528; at y=4 error 4−log12=1.5150934 | Matches stated boundary | Prose/API formatting only |
| §3.3, line 2329: Bombieri–Vinogradov: every level θ<1/2 | θ=0, q=1 | prime-count discrepancy 0, summed error 0≤C x/log(x)^A; θ<1/2 includes this endpoint | Matches stated boundary | Prose/API formatting only |
| §3.4, line 2343: Weighted prime-distribution transfer | q=1; zero coefficients for bilinear terms | prime-count error 0, window error 1; coefficient correlation discrepancy 0=0 | Matches stated boundary | Prose/API formatting only |
| §3.4, line 2355: Arithmetic discrepancy second moment | x=4,Q=1 | ψ(4)=log12=2.48490665; residual log12−4=−1.51509335; square 2.29550786 | Matches stated boundary | Prose/API formatting only |
| §3.4, line 2365: Barban–Davenport–Halberstam theorem | x=4,Q=1 | ψ(4)=log12=2.48490665; residual log12−4=−1.51509335; square 2.29550786 | Matches stated boundary | Prose/API formatting only |
| §3.4, line 2375: Bilinear congruence correlation | q=1; zero coefficients for bilinear terms | prime-count error 0, window error 1; coefficient correlation discrepancy 0=0 | Matches stated boundary | Prose/API formatting only |
| §4.1, line 2407: Admissible tuple | H={0,2},{0,1},{0,2,4},∅ | mod-2 images have cardinal 1,2; latter prime-translate sets {2},{3}; empty tuple translates all naturals | Matches stated boundary | Prose/API formatting only |
| §4.1, line 2434: The prime k-tuples conjecture, as a named statement | H={0,2},{0,1},{0,2,4},∅ | mod-2 images have cardinal 1,2; latter prime-translate sets {2},{3}; empty tuple translates all naturals | Matches stated boundary | Prose/API formatting only |
| §4.2, line 2462: The W-trick residue v₀ (Maynard (4.1)) | H={0,2}, W=6 | v₀=5 gives gcd(5·7,6)=1; v₀=1 gives gcd(1·3,6)=3 | Matches stated boundary | Prose/API formatting only |
| §4.2, line 2489: Maynard's multidimensional sieve weights | k=W=1,R=2,F(0)=1; n=h=0 | λ₁=1; finite weight 1 versus native divisor-at-zero sum 0 | Matches stated boundary | Zero-label support repaired |
| §4.3, line 2525: Maynard's variational quantity M_k | k=2 triangle indicator; twice it; zero-fibre polynomial | I=1/2,2,1/3150; each J=1/3,4/3,0; ratios 4/3,4/3,0; zero function I=J=0 | Matches stated boundary | Expanded discriminating Checks |
| §4.3, line 2569: Smooth approximation within the simplex | k=1, positive smooth compactly supported interval bump; δ=1 | choosing F₁=F gives ratio difference 0>−1; I and J are strictly positive | Matches stated boundary | Prose/API formatting only |
| §4.4, line 2585: Size of λ in terms of y (Maynard (5.9)) | k=1,W=1,R=2,y₁=1 and other y=0 | max λ=1 = Σ_(u<2)μ²(u)τ₁(u)/φ(u) | Matches stated boundary | Prose/API formatting only |
| §4.4, line 2597: Diagonal form of S₁ (Maynard Lemma 5.1) | finite normalization k=2,H={0,2},N=2,R=2,W=1,F(0)=1 | weights at 2,3 are 1,1; S₁=2; prime coordinates give S₂=1+2=3; not an assertion about the asymptotic threshold | Matches stated boundary | Prose/API formatting only |
| §4.4, line 2607: Diagonal form of `S₂^{(m)}` (Maynard Lemma 5.2) | finite normalization k=2,H={0,2},N=2,R=2,W=1,F(0)=1 | weights at 2,3 are 1,1; S₁=2; prime coordinates give S₂=1+2=3; not an assertion about the asymptotic threshold | Matches stated boundary | Prose/API formatting only |
| §4.4, line 2629: Asymptotic for S₁ (Maynard Lemma 6.2) | finite normalization k=2,H={0,2},N=2,R=2,W=1,F(0)=1 | weights at 2,3 are 1,1; S₁=2; prime coordinates give S₂=1+2=3; not an assertion about the asymptotic threshold | Finite normalization | Prose/API formatting only |
| §4.4, line 2641: Asymptotic for `S₂^{(m)}` (Maynard Lemma 6.3) | finite normalization k=2,H={0,2},N=2,R=2,W=1,F(0)=1 | weights at 2,3 are 1,1; S₁=2; prime coordinates give S₂=1+2=3; not an assertion about the asymptotic threshold | Finite normalization | Prose/API formatting only |
| §4.4, line 2653: Maynard's asymptotics for S₁ and S₂ (Proposition 4.1) | finite normalization k=2,H={0,2},N=2,R=2,W=1,F(0)=1 | weights at 2,3 are 1,1; S₁=2; prime coordinates give S₂=1+2=3; not an assertion about the asymptotic threshold | Finite normalization | Prose/API formatting only |
| §4.5, line 2667: The GPY positivity criterion | weights 1 at n=2,3, H={0,2},ρ=1 | weighted positivity (1−1)+(2−1)=1>0; n=3 has 2>1 primes | Matches stated boundary | Prose/API formatting only |
| §4.5, line 2679: From prime clusters to prime gaps | n=3,H={0,2},r=2 | primes 3,5 have consecutive gap 2 = diameter H | Matches stated boundary | Prose/API formatting only |
| §4.5, line 2691: Primes in admissible tuples (Maynard Proposition 4.2) | k=0 and k=1 boundary normalizations | M₀=0 gives r₀=0; M₁=1 and 0<θ≤1 gives ceil(θ/2)=1 | Matches stated boundary | Prose/API formatting only |
| §4.6, line 2705: Lower bound for M_k when k is large (Maynard Proposition 4.3(3)) | k=22026, expression normalization only | log k−2loglog k−2 = 3.394812896; not a claimed finite threshold | Matches stated boundary | Prose/API formatting only |
| §4.6, line 2717: Moments on the simplex (Maynard Lemma 8.1, corrected) | k=5,a=2,b=0; k=1,a=0,b=j=1 | 2!/7!=1/2520≠0; ∫₀¹t=1/2 | Matches stated boundary | Prose/API formatting only |
| §4.6, line 2729: I_k and J_k as quadratic forms (Maynard Lemma 8.2) | k=5, four monomials of (8.16) | I=29509/1222452000; sumJ=40493/838252800; ratio=1417255/708216>2 | Matches stated boundary | Prose/API formatting only |
| §4.6, line 2741: M₅ > 2 (Maynard Proposition 4.3(1)) | k=5, four monomials of (8.16) | I=29509/1222452000; sumJ=40493/838252800; ratio=1417255/708216>2 | Matches stated boundary | Prose/API formatting only |
| §4.6, line 2753: M₁₀₅ > 4 (Maynard Proposition 4.3(2)) | k=5, four monomials of (8.16) | I=29509/1222452000; sumJ=40493/838252800; ratio=1417255/708216>2 | Matches stated boundary | Prose/API formatting only |
| §4.7, line 2822: Engelsma's admissible 105-tuple of diameter 600 | all 105 listed shifts; 27 primes through 103 | cardinality 105; diameter 600; missing residues at 2,3,5,7,11,13: 1,2,1,4,7,6 | Matches stated boundary | Prose/API formatting only |
| §4.7, line 2834: The first k primes above k are admissible | k=5 and k=0 | {7,11,13,17,19} has diameter 12 and misses 0 mod5; empty diameter convention unused | Matches stated boundary | Prose/API formatting only |
| §4.7, line 2846: Bounded gaps between primes (Maynard Theorem 1.3) | ratio₁₀₅=4.000543795842186; θ=0.49999 | θ ratio/2=1.00011594>1; ceil is 2; diameter conversion gives 600 | Finite normalization | Prose/API formatting only |
| §4.7, line 2858: Gaps under Elliott–Halberstam (Maynard Theorem 1.4) | variational ratios at k=5 and 105 | 2/ratio₅=0.99941930<1; 4/ratio₁₀₅=0.99986407<1; strict θ<1 choices exist | Matches stated boundary | Prose/API formatting only |
| §4.7, line 2870: m + 1 primes in bounded intervals (Maynard Theorem 1.1) | m=1 normalizing scale | m³exp(4m)=exp4=54.598150; constant chosen before m | Matches stated boundary | Prose/API formatting only |
| §4.7, line 2882: A positive proportion of admissible m-tuples are prime (Maynard Theorem 1.2) | m=1,A={0,1}; m=0 excluded | both singleton subsets have infinite prime shifts; count 2=choose(2,1) | Finite normalization | Prose/API formatting only |
| §4.8, line 2896: Bouniakowsky and Schinzel hypotheses | f=X²+1, X²+X+2, 1; tuple X,X+1 | f(0),f(1) for middle polynomial are 2,4 (fixed parity obstruction); constant 1 is reducibility control; tuple covers mod2 | Matches stated boundary | Prose/API formatting only |
| §5.1, line 2962: From roughness to an almost-prime bound | z=2,n=1,8,25 and n=0 control | Ω=0,3,2; 8<2³ is false; 25<5³ and roughness at 5 give P₂; zero excluded | Matches stated boundary | Prose/API formatting only |
| §5.2, line 2976: Linear sieve functions | s=1,2,3,4 | F(1)=2e^γ; f(2)=0; f(4)=e^γlog3/2=0.9783540; F(3)=2e^γ/3 | Matches stated boundary | Prose/API formatting only |
| §5.2, line 3004: Rosser sieve weights | D=8; d=1,2,3 | upper weights 1,0,0 since p³≥8; lower weights 1,−1,−1 | Matches stated boundary | Prose/API formatting only |
| §5.2, line 3031: Rosser–Iwaniec linear sieve | P=1,X=1, all R=0; z=D=2 | V=1,S=1; lower coefficient f(1)=0 and upper coefficient F(1)=2e^γ bound 1 | Matches stated boundary | Prose/API formatting only |
| §5.2, line 3041: Beta sieve in general dimension | κ=1 and κ=1/2 endpoints | (β,A,B)=(2,2e^γ,0) and (1,2sqrt(e^γ/π),0); β₁=2<9 | Matches stated boundary | Lower sifting limit made explicit |
| §5.2, line 3051: Positive lower sieve above 9t | t=1,s=9.5; elementary u=10,K=2 control | 9.5>9; β₁=2<9.5; elementary error 1024>1 so cannot yield positivity | Finite normalization | New positive lower input |
| §5.2, line 3069: Fundamental lemma for the linear sieve | exact population, all remainders 0; s→∞ | relative remainder 0; limiting upper/lower function values both 1 | Finite normalization | Prose/API formatting only |
| §5.2, line 3079: Richert logarithmic weights | N=8,α=1/4,β=1,r=1,n=8 | only distinct prime 2 is weighted; Ω(8)=3; square exception 2² divides 8 | Matches stated boundary | Prose/API formatting only |
| §5.2, line 3105: Richert weighted sieve | multiples of 30; r=2,γ=.9,α=.225,β=.81 | g(2)=g(3)=g(5)=1 fails margin; f(4)−integral=0.44514382>0 while Ω≥3 | Matches stated boundary | Strict local margin |
| §5.2, line 3121: Richert explicit level threshold | r=2 and 3 | Λ₂=1.83404377, Λ₃=2.77124375; 1/Λ₃<1/2<1/Λ₂ | Matches stated boundary | Prose/API formatting only |
| §5.3, line 3133: Joint-spin arithmetic data | σ of order 2 versus 3; empty S control | order2 has σ=σ⁻¹ and cannot belong; order3 singleton obeys inverse exclusion; ‖S‖=0 rejected | Matches stated boundary | Prose/API formatting only |
| §5.3, line 3159: Short character input for joint spins | q=15,k=3 and k=15; subset sizes 2 then 1 | reduced conductors 5>1 and 1 excluded; δ transfers to δ/2 | Matches stated boundary | Prose/API formatting only |
| §5.3, line 3175: Squarefull norm tail for spin divisors | β with norm radical g₀=1, Z=1; zero difference excluded | tail indicator 0; Z^(−1+2/3)=1 at Z=1; zero difference cannot enter factorization | Boundary matches; supplier obligation remains | Supplier gap registered |
| §5.3, line 3185: Common norm tail for two spin differences | norm differences 1 and 1,Z=1; zero-difference control | gcd=1 so tail indicator 0; zero differences are separated rather than factored | Boundary matches; supplier obligation remains | Supplier gap registered |
| §5.4, line 3197: Primitive affine sieve pair | values {2,3}; coordinate on all ℤ; empty orbit | gcd values 1 but no value coprime to 6; value1 avoids every q; empty orbit fails q=2 | Matches stated boundary | Prose/API formatting only |
| §5.4, line 3223: Affine almost-prime locus and saturation | values −6,8,0,±1; r=2 then 0 | Ω(abs)=2,3; −6 in,8 out,0 out; r=0 includes ±1 | Matches stated boundary | Prose/API formatting only |
| §5.4, line 3251: Affine walk sieve data | length0 identity word; two distinct words with same value | mass 1 at length0; collision weight 2=1+1, not 1 | Matches stated boundary | Prose/API formatting only |
| §5.4, line 3277: Local densities for affine orbits | G=SL₂, f=upper-left entry, prime p | zero-locus density 1/(p+1); at p=2 density 1/3<1; β(p)=1/p+O(p^(−2)) | Matches stated boundary | Prose/API formatting only |
| §5.4, line 3287: Affine sieve level from expansion | dim=3,τ=1/2,δ=1/12; R supported only at d=1 | τ+δdim=3/4<1; Σ‖R‖=1; at R=0 both sides 0 | Matches stated boundary | Prose/API formatting only |
| §5.4, line 3297: Escape from proper algebraic subvarieties | proper empty subvariety; entire G as excluded control | empty count 0; count in G is X, incompatible with a strict power saving | Matches stated boundary | Prose/API formatting only |
| §5.4, line 3307: Affine sieve saturation with expansion | G=SL₂,Γ=SL₂(ℤ),f=upper-left entry; matrices [[2,1],[1,1]] and [[8,1],[7,1]] | determinants 1,1; f-values 2 and 8 have Ω=1 and 3; first lies in P₁, second is outside P₂ | Matches stated boundary | Prose/API formatting only |
| §5.4, line 3317: Explicit affine almost-prime bound | q=1 trivial quotient; bipartite degree2k control | no nonconstant q=1 eigenvector; nonconstant eigenvalue −2k survives one-sided expansion and prevents absolute mixing | Matches stated boundary | Prose/API formatting only |
| §5.4, line 3327: Squarefree congruence expansion for SL₂ | q=1 trivial quotient; bipartite degree2k control | no nonconstant q=1 eigenvector; nonconstant eigenvalue −2k survives one-sided expansion and prevents absolute mixing | Boundary matches; supplier obligation remains | Supplier gaps registered |
| §5.5, line 3339: Chen switching weight | N=1000,n=11,286,3,27 | weights 1,0,1/2,1/2; n=27 violates squarefreeness and Ω=3 | Finite normalization | Prose/API formatting only |
| §5.5, line 3364: Goldbach local factor | N=6,10,18,0 | C₆/C₂=2,C₁₀/C₂=4/3,C₁₈/C₂=2,C₀=0 | Matches stated boundary | Prose/API formatting only |
| §5.5, line 3389: Chen switched triple upper bound | normalizing constants in the Chen subtraction | 3.9404/2=1.9702; 2.6408−1.9702=0.6706; tuples retain ordered multiplicity | Finite normalization | Prose/API formatting only |
| §5.5, line 3401: Chen primes with an almost-prime shift | h=2,x=10 | qualifying primes 2,3,5,7 give count 4; nonunit condition excludes Ω=0 | Finite normalization | Prose/API formatting only |
| §5.5, line 3411: Chen original-family lower estimate | corrected logarithmic expression V | V≈−0.0164726270754; valid lower endpoint −0.0164727; final lower margin >2.6408077 | Finite normalization | Prose/API formatting only |
| §5.5, line 3421: Chen’s Goldbach theorem | N=10 finite normalization | qualifying p=3,5,7 give count 3; complement Ω values 1,1,1; asymptotic threshold not asserted at 10 | Finite normalization | Prose/API formatting only |
| §5.6, line 3433: Quadratic ideal residue symbol adapter | K=ℚ, denominator unit,5 and even ideal; K degree2 control | (0/unit)=1; (2/5)=−1,(4/5)=1,(15/5)=0; rational ideal in degree2 gives +1 | Matches stated boundary | Prose/API formatting only |
| §5.6, line 3464: Ideal-symbol reciprocity adapter | ℚ, (α,β)=(3,7),(−1,−1),(3,3) | products −1=(−1)·1; 1=(−1)·(−1); last excluded: ideal product 0 versus Hilbert ±1 | Matches stated boundary | New comparison |
| §5.6, line 3480: Joint spin of ideals | ψ=0; unit element/ideal for symbol normalizations | all joint coefficients and Type I/II sums 0; individual spin of 1 is 1; bound scales with fixed sup‖ψ‖ | Matches stated boundary | Prose/API formatting only |
| §5.6, line 3509: Type I estimate for joint spins | ψ=0; unit element/ideal for symbol normalizations | all joint coefficients and Type I/II sums 0; individual spin of 1 is 1; bound scales with fixed sup‖ψ‖ | Boundary matches; supplier obligation remains | Geometric gaps propagated |
| §5.6, line 3519: Joint-spin bilinear kernel | β=1 and α=1; nonunit denominator control | Φ(1,1)=1; denominator prime dividing α makes a factor 0; rational norm period for β=1 is unit ideal | Matches stated boundary | Prose/API formatting only |
| §5.6, line 3545: Bilinear bound for spin kernels | ψ=0; unit element/ideal for symbol normalizations | all joint coefficients and Type I/II sums 0; individual spin of 1 is 1; bound scales with fixed sup‖ψ‖ | Matches stated boundary | Prose/API formatting only |
| §5.6, line 3555: Type II estimate for joint spins | ψ=0; unit element/ideal for symbol normalizations | all joint coefficients and Type I/II sums 0; individual spin of 1 is 1; bound scales with fixed sup‖ψ‖ | Finite normalization | Prose/API formatting only |
| §5.6, line 3565: Ideal divisor and logarithmic coefficient bounds | K=ℚ; unit ideal,(4); square moment through 4 | τ=1,3; Λ=0,log2≤log4; Στ²=1+4+4+9=18 | Matches stated boundary | Owned estimates; native Λ bound imported |
| §5.6, line 3583: FIMR sieve conversion to prime ideals | ϑ=δ/(54n‖S‖²), θ=1/(6n); n=3,‖S‖=1,δ=1 | saving ϑθ/(2+θ)=1/5994 with denominator 54·3·37=5994; ψ=0 sums 0 | Matches stated boundary | Prose/API formatting only |
| §5.6, line 3593: Oscillation of joint spins over prime ideals | ϑ=δ/(54n‖S‖²), θ=1/(6n); n=3,‖S‖=1,δ=1 | saving ϑθ/(2+θ)=1/5994 with denominator 54·3·37=5994; ψ=0 sums 0 | Finite normalization | Prose/API formatting only |
| §5.6, line 3603: Equidistribution of joint spin signs | one sign coordinate e,s∈{±1} | (1+es)/2 equals 1 when e=s and 0 otherwise; two coordinates give uniform coefficient 1/4 | Finite normalization | Prose/API formatting only |

# Retained-definition and convention witnesses

| Definition | Instances tried | Computed values | Result |
|---|---|---|---|
| SieveSelberg.diagonalMass | P=1,z=1,2; P=2,ν₂=1/2,z=2,3 | G=0,1,1,2 | Strict cutoff retained |
| SieveApplications.leastNonresidue | p=3,7,2 | 2,3,0 | Odd-prime domain and invalid-input convention |
| SieveQuadratic.primeDenominatorSymbol | (a,p)=(3,2),(6,2),(2,3),(9,3) | 1,0,−1,0 | Dyadic convention differs from Kronecker |
| SieveDistribution.primeCountAP | (x,q,a)=(5,1,0),(10,2,0),(5,0,5),(4,0,5) | 3,1,1,0 | Endpoint, nonunit class and zero-modulus junk values |
| SieveDistribution.discrepancy | (x,q)=(10,3),(5,3),(5,1),(5,0) | 1,3/2,0,0 | All-prime mean and empty supremum |
| SieveDistribution.PrimesHaveLevel | θ=−1,0,2 | modulus sums eventually 0,0; θ=2 has ≫x² obstruction | Both trivial endpoints and false larger level |
| SieveDistribution.ElliottHalberstam | indices θ=1/2,3/4,1,2 | first two required; 1 and 2 excluded by θ<1 | Range discrimination; no conjectural estimate asserted |
| SieveMaynard.IsAdmissible | ∅,{0,2},{0,1},{0,2,4} | true,true,false,false | Missing residue classes verified at 2 and 3 |
| SieveMaynard.primeTranslates | ∅,{0},{0,1},{0,2,4} | ℕ, primes, {2}, {3} | Nonempty finite examples cannot replace infinitude |
| SieveMaynard.maynardSimplex | empty vector; (1/2,1/2),(1,1),(−1,0) | sums 0,1,2,−1; membership true,true,false,false | Last fails coordinate nonnegativity |
| SieveMaynard.maynardI | zero, triangle, twice triangle, zero-fibre polynomial | 0,1/2,2,1/3150 | Exact rational integration |
| SieveMaynard.maynardJ | same four functions, either coordinate | 0,1/3,4/3,0 | Each fibre polynomial of the last example is identically zero |
| SieveMaynard.IsMaynardAdmissible | triangle, zero, global one, zero-fibre polynomial | true,false,false,false; last I=1/3150 but J=0 | Independent support, I and J conditions |
| SieveMaynard.maynardRatio | zero, triangle, twice triangle, global one in dimension 2 | 0,4/3,4/3,2 | Totalized zero division and scaling |
| SieveMaynard.maynardM | k=0,1,2 | M₀=0,M₁=1,4/3≤M₂≤2 | Empty product measure has mass 1 |

| Mathematical convention | Instances tried | Computed values on each side | Result/change |
|---|---|---|---|
| Approximate mass and signed remainder | P=1,A₁=1,X=−1 | R₁=2; S=1=−1+2 | X positivity is imposed only where needed. |
| Nonnegative sample weights | P=1,w=−1,c=0 | coefficient bracket 0≤1 but asserted lower output would be 0≤−1 | Negative weights excluded. |
| Zero labels and empty prime product | label 0, P=1 then 2 | gcd(1,0)=1; gcd(2,0)=2; survivor indicators 1 then 0 | Same convention in constructors and weights. |
| Natural divisor zero | n=0, finite λ₁=1 | native divisor sum 0; supported weight 1 | Positive-label hypothesis added to the comparison. |
| Inner-product conjugation | x=1,y=i | ⟨i,1⟩=−i; (−i)i=1; defect 0 | Coefficient direction fixed. |
| Fourier phase | n=−1,x=1/4 | vector i; pairing with coefficient 1 is −i=e(−1/4) | Minus phase and first-slot conjugation agree. |
| Strict primes and divisors | z=2; D=1,2; R₁=3 | prime product 1; remainder masses 0,3 | Endpoints differ intentionally. |
| Factor multiplicity | n=1,8,12,25,0 | Ω=0,3,3,2; zero excluded; ω(12)=2 | Ω used for almost primality. |
| Discriminant sign and half-norm | matrix diag(2,2), vector (1,1) | half-norm 2=x²+y²; discriminant −4 | Conic character sign matches p=3,5 counts 4,4. |
| Modulus one | trivial primitive character | Gauss sum 1; prime discrepancy 0; window error 1 | No deleted modulus-one character. |
| Noncommutative affine group | upper/lower unipotents in SL₂(ℤ) | products [[2,1],[1,1]] and [[1,1],[1,2]] differ | No abelian-group assumption used. |
| Nonabelian Galois data | S₃: transposition and 3-cycle; cyclic C₃ | orders 2 and 3; first equals inverse, second does not | Transposition excluded, singleton 3-cycle permitted. |
| Rank zero | Fin 0 simplex and functionals | coordinate sum 0, empty product measure 1, ratio 0, M₀=0 | No positive-rank assumption silently used. |
| Ideal zero and units | zero ideal versus unit ideal | norm 0 versus 1; unit symbol 1, τ=1, Λ=0 | Zero ideal excluded from coefficient estimates. |
| Short-character input | χ mod3 with values 1,−1,0; q=15,k=3 or15 | sums on (0,2],(1,3] are 0,−1; reduced conductors 5,1 | Arbitrary origins, nonprincipalness and reduced conductor retained. |

# Source-sensitive convention ledger

| Statement | Instances tried | Computed values | Result/change |
|---|---|---|---|
| HB-SIEVES, arXiv v1 p.1, introductory question (i); not collated with the published proceedings | n=2; n=4 | minimum prime sum 2+2=4>2; at 4 equality holds | Finite normalization; edition-specific correction retained. |
| HB-SIEVES, arXiv v1 p.2, Example 1; related divisor-count equality on p.4; not collated with the published proceedings | x=10,z=5 | survivors {1,5,7}: 3=1+4−2; divisors of P=6 number 4≠8 | Finite normalization; edition-specific correction retained. |
| HB-SIEVES, arXiv v1 pp.2-3, Example 2 image set and the next page's first counting equality; not collated with the published proceedings | n=2..8,2N=10 | 7 labels, image {16,21,24,25} of cardinality 4 | Finite normalization; edition-specific correction retained. |
| HB-SIEVES, arXiv v1 p.2, Example 2 displayed prime-pair count; distinct from the image-multiplicity convention above | 2N=10,p=7 | product 21 divisible by 3<√10; sifted image {25} has cardinality 1 | Finite normalization; edition-specific correction retained. |
| HB-SIEVES, arXiv v1 p.2, Example 3 primitive sum-of-two-squares interpretation; not collated with the published proceedings | n=4 and 9 | 4=2²+0² has coordinate gcd2; 9=3²+0² is removed by prime3 | Finite normalization; edition-specific correction retained. |
| HB-SIEVES, arXiv v1 p.4, Corollary 1.2 and its immediately preceding asymptotic argument; not collated with the published proceedings | z=5/2 and fixed x→∞ | exact density 1/2; e^(−γ)/log(5/2)≈0.61275255≠1/2 | Finite normalization; edition-specific correction retained. |
| KED-ANT-11, §11.5, proof of Theorem 11.11 invoking Theorem 11.9 | x=n=33,z=11 | d=1155 divides 33·35, yet 1155>33 | Finite normalization; edition-specific correction retained. |
| KED-ANT-11, §11.5, proof of Theorem 11.11 between (11.5.1) and the asserted sieve estimate | F(z)=3log z at z=e¹⁰,e²⁰ | F−2log z=10,20: no bounded additive error follows from O(log z) | Finite normalization; edition-specific correction retained. |
| BOMBIERI-1971, Published Acta Arithmetica 18 (1971), p.402, coefficient choice immediately after equation (4) | real f=1,y=2 | wrong coefficient 1/8 gives defect9/16; coefficient1/2 gives defect0 | Finite normalization; edition-specific correction retained. |
| BOMBIERI-1971, Published Acta Arithmetica 18 (1971), p.403, display immediately after the definition of K_M | N=L=1,t=1/2 | K₂=0,K₁=1; signed Gram −1, modulus1 | Finite normalization; edition-specific correction retained. |
| BOMBIERI-1971, Published Acta Arithmetica 18 (1971), p.404, opening definition of I_m and the immediately following assertion that the bins cover all points | δ=3/10,t=2/5 | floor(t/δ)=1; upper edge3/5>1/2; one point is omitted by printed restriction | Finite normalization; edition-specific correction retained. |
| KED-ANT-16, §16.1, display (16.1.2), and §16.3, proof of Theorem 16.7 | phase sum over two integer indices at t=1/2 | −1+1=0; renaming a bound dummy preserves0, a free dummy does not define the sum | Finite normalization; edition-specific correction retained. |
| KED-ANT-16, §16.3, Definition 16.3, Theorem 16.4 and Lemma 16.5 | P={2},Ω₂={0},a₁=a₂=1 | S(0)=2,S(1/2)=0; unmasked claim4≤0 fails; masked coefficients give energy1 | Finite normalization; edition-specific correction retained. |
| KED-ANT-16, §16.3, proof of Theorem 16.4 | q=2,one coefficient at n=1 | primitive-character energy0; reduced additive energy1; upper control of0 cannot control1 | Finite normalization; edition-specific correction retained. |
| KED-ANT-16, §16.3, proof of Lemma 16.5, Chinese-remainder display | q₁=2,q₂=3,a₁=a₂=1 | correct phase1/2+1/3=5/6; printed phase3/7 has wrong denominator | Finite normalization; edition-specific correction retained. |
| KED-ANT-16, §16.3, proof of Theorem 16.7, the density of the sieved classes | p=3 and101 | (p−1)/(p+1)=1/2 and50/51; subtraction by1 gives −1/2 and−1/51 | Finite normalization; edition-specific correction retained. |
| KED-ANT-16, §16.3, proof of Theorem 16.7, final lower bound for smooth integers | N=100000 and1000000, exact strict prime window | ordered floor sums36745,387659; distinct smooth counts35819,344299 (recomputed) | Finite normalization; edition-specific correction retained. |
| KED-ANT-16, §16.3, Definition 16.6 | p=2 and3 | all residues mod2 are 0²,1²; at3 residue2 is nonsquare | Finite normalization; edition-specific correction retained. |
| KED-ANT-18, §18.1, Theorem 18.3 proof, small-r bound after (18.1.2) | x=y=4,Δ=1,r=τ(s)=1, unit coefficient norms | √x√y=4; omitting √x yields2 | Finite normalization; edition-specific correction retained. |
| KED-ANT-18, §18.1, Theorem 18.3 proof, summation of the dyadic large-r estimates | k=3,t=8 | block lower sum2kt²=384; claimed aggregate t+2t²+1=137 | Finite normalization; edition-specific correction retained. |
| KED-ANT-18, §18.2, boundary explanation following (18.2.2) | x=32,n=2 | cutoff x^(1/5)=2; incomplete-log convolution0 versus Λ(2)=log2 | Finite normalization; edition-specific correction retained. |
| KED-ANT-18, §18.2, multiplicative partition parameter after (18.2.3) | Δ=1/16 | δ=√Δ=1/4≤1; cannot satisfy a lower endpoint greater than1 | Finite normalization; edition-specific correction retained. |
| KED-ANT-18, §18.2, multiplicative partition and rectangles after (18.2.3) | δ=1,x=8; L=M=2,ℓ=m=3 | 3 intervals needed since2³=8; ℓm=9>LM=4 so rectangle is above the hyperbola | Finite normalization; edition-specific correction retained. |
| KED-ANT-18, §18.2, display defining D(L,M;N,m) | unit point-mass coefficient, modulus3, class1 or2 | discrepancies 1/2,−1/2; residue in the summand must follow the bound index | Finite normalization; edition-specific correction retained. |
| KED-ANT-18, §18.2, last aggregate bound and substitution δ=Δ^(1/2) | x=16,Δ=1/16,δ=1/4 | δ+Δ/δ=1/2; printed ratio lower bound x/Δ=256 | Finite normalization; edition-specific correction retained. |
| KED-ANT-18, §18.3, Theorem 18.5 display | f=δ₁,x=1,q=3 | two class discrepancies1/2,−1/2; sum of squares1/2 | Finite normalization; edition-specific correction retained. |
| MAYNARD-2015, Proof of Proposition 4.2, display (4.4), p. 389 (arXiv v3 p. 6) | F=x on triangle, zero elsewhere | I=1/12,J_x=1/20,J_y=1/30; summed J=1/12, not2J_x=1/10 | Finite normalization; edition-specific correction retained. |
| MAYNARD-2015, Proof of Lemma 5.1, display (5.8), p. 393 (arXiv v3 p. 9) | d=2,e=6 and d=e=2 | Σ_(2|r|6)μ(r)=−1+1=0; Σ_(2|r|2)μ(r)=−1=μ(2) | Finite normalization; edition-specific correction retained. |
| MAYNARD-2015, Proof of Theorem 1.1, p. 391 (arXiv v3 p. 7) | k=5,H={7,11,13,17,19} | five residues omit0 modulo5; p=k is an essential tested prime | Finite normalization; edition-specific correction retained. |
| MAYNARD-2015, §7, sentence before (7.10), p. 407 (arXiv v3 p. 19) | k=2,T=1,u₂=2 | remaining-coordinate sum2>k−T=1; there is no u₁ coordinate in the integral | Finite normalization; edition-specific correction retained. |
| MAYNARD-2015, Lemma 8.1, definition of `G_{b,j},` p. 409 (arXiv v3 p. 21); also (8.6) | k=5,a=2,b=0 | correct integral1/2520; omitting r=0 gives0; M₅ ratio recomputed as1417255/708216 | Finite normalization; edition-specific correction retained. |
| MAYNARD-2015, Proof of Lemma 8.2, display (8.10), p. 411 (arXiv v3 p. 23) | k=3,b=1,c=c′=1 | correct integral4/5!=1/30; printed denominator4! instead of5! gives4/4!=1/6 | Finite normalization; edition-specific correction retained. |
| KED-ANT-12, §12.4, Theorem 12.2, second inequality | empty prime set,β=s,K=2 | V⁻=V=1; wrong positive factor1+2¹⁰=1025 cannot be a lower estimate | Finite normalization; edition-specific correction retained. |
| KED-ANT-12, §12.1, paragraph beginning with the all-prime specialization, and the prime-indicator example before §12.2 | x=25,z=5 | sifted prime count6 versus π(25)=9 and twin count4 | Finite normalization; edition-specific correction retained. |
| KED-ANT-12, §12.1 inclusive P(z) definition versus Lemma 12.1 V(p_n) and p₁<z, and Exercise 12.6.1 hint | P={2},g(2)=1/2,z=3 | correct V=1−(1/2)·1=1/2; inclusive substitution gives3/4 | Finite normalization; edition-specific correction retained. |
| KHAYUTIN-19, Published Lemma 9.9, pp.224–225, lcm discrepancy step | circle R=32,θ=1,z=2 | z⁵R=1024≤A=1024π; lcm≤4<√A≈56.7185 | Finite normalization; edition-specific correction retained. |
| KHAYUTIN-19, Published Lemma 9.11, pp.225–226 | z=1,degree1,s→0 | both products1; factor s tends0, so restrict s≥1 | Finite normalization; edition-specific correction retained. |
| KHAYUTIN-19, Published Theorem 9.7 proof, equation (47), p.233 | Q=x²,p=3 | ρ(9)=27>degree·p²=18; corrected-density saving does not bound it | Finite normalization; edition-specific correction retained. |
| KHAYUTIN-19, Published Proposition 9.25, pp.235–236, scaled-domain hypothesis | A=10⁶,R=10⁴,k₀=10,θ=1,η=1/10 | new area10000; new R1000≤10000 but >10000^.7≈630.957 | Finite normalization; edition-specific correction retained. |
| KHAYUTIN-19, Published Proposition 9.26, pp.236–237, local factor and first proof congruence | k₀=2,k₁=1,k₂=3,ℓ=1,Q=2 | Q≡2 mod6 gives Q≡2 mod3, not1; inverse transport applies to Q/2 | Finite normalization; edition-specific correction retained. |
| KHAYUTIN-19, Published Lemma B.4, pp.266–267, m≥1 smooth term and closed formula | p=3,q=x²−y²,n=m=1 | 5 zeros =4 smooth+1 singular; printed smooth omission leaves1 | Finite normalization; edition-specific correction retained. |
| KHAYUTIN-19, Published Proposition B.5, equation (68) and odd-valuation branch, pp.268–269 | q=x²+3y²,p=3,ω=1,n=2 | q+12 has0 zeros mod9; wrong sign branch gives18 | Finite normalization; edition-specific correction retained. |
| KHAYUTIN-19, Published Proposition B.5, p.268, second displayed branch | same q,p=3,ω=1,n=2 | ρ_Q(9)=0 and the count is at modulus9; left-hand exponent is n=2 | Finite normalization; edition-specific correction retained. |
| KHAYUTIN-19, Published Corollary B.7, p.269, n≤ℓ branch and n=ℓ formula | same q,p=3,ℓ=n=1 | ρ(3)=3,ρ(9)=0; all3 roots fail lifting; corrected density3 not0 | Finite normalization; edition-specific correction retained. |
| KHAYUTIN-19, Published Proposition B.8, equations (69)–(72), pp.270–271 | p=3,u=u_A=ω=1,k=1,ε=−1 | residue sum18=corrected expression; printed sign gives9 | Finite normalization; edition-specific correction retained. |
| HB-SIEVES, arXiv math/0209360v1, Theorem 5.1, p.35 | empty primes,V=1, exact remainders0 | lower main1≥f(s)−error; an upper comparison cannot supply this direction | Finite normalization; edition-specific correction retained. |
| HB-SIEVES, arXiv math/0209360v1, Example 1 after Corollary 5.1, p.36 | x=e¹⁰ | y=x/100; summing a unit per modulus costs O(x/100), not O(100) | Finite normalization; edition-specific correction retained. |
| HB-SIEVES, arXiv math/0209360v1, Example 4, p.38 | θ=.45; endpoints .4 and.5 | 1/θ≈2.222>2;5θ=2.25>2; endpoints lose one of these strict margins | Finite normalization; edition-specific correction retained. |
| HB-SIEVES, arXiv math/0209360v1, fundamental lemma at end of §5, p.38 | XW=1,x=10⁶, remainder1 | remainder/x=10⁻⁶ while remainder/(XW)=1; relative normalization is essential | Finite normalization; edition-specific correction retained. |
| HB-SIEVES, arXiv math/0209360v1, partial summation after (6.3), p.44 | N=16,α=1/4,β=1/2 | prime weight window [2,4); upper endpoint N^β=4, not N^α=2 | Finite normalization; edition-specific correction retained. |
| HB-SIEVES, arXiv math/0209360v1, Chen theorem local constant, p.46 | N=6 and10 | finite corrections2 and4/3; universal source factor is2 times its prime product | Finite normalization; edition-specific correction retained. |
| KM-21, arXiv:1809.09597v1, definition (2.4), pp.5–6 | F divisible by3 and odd ideal(3) | residue3 is a nonunit, so ψ extends by0; oddness alone is insufficient | Finite normalization; edition-specific correction retained. |
| KM-21, arXiv:1809.09597v1, Lemma 4.1 domain, p.20 | K=ℚ, element w=3 versus ideal(3) | element product3·5=15; embedding back gives ideal(15); mixed-carrier product is not typed | Finite normalization; edition-specific correction retained. |
| KM-21, arXiv:1809.09597v1, Lemma 4.1(P3), p.20 | K=ℚ(i),w=1+2i | Nw=5; quotient sizes by(w) and5O are5 and25 | Finite normalization; edition-specific correction retained. |
| KM-21, arXiv:1809.09597v1, Theorem 1, p.2, implied-constant dependence | ψ replaced by2ψ or0 | joint coefficient and sum multiply by2 or become0; fixed norm factor cannot be suppressed | Finite normalization; edition-specific correction retained. |
| HB-SIEVES, arXiv math/0209360v1, p.24, definition of E_c and the Liouville summatory bound; p.25 second-moment calculation | Liouville sums at n=1,2,3 | 1,0,−1; consecutive differences−1,−1 rule out eventual identically zero sums | Finite normalization; edition-specific correction retained. |
| HB-SIEVES, arXiv math/0209360v1, p.25, cutoff choice following (4.2) | x=e¹⁶,c=1 | correct y=e¹²,z=e⁶; missing x gives y=e^(−4)<1 | Finite normalization; edition-specific correction retained. |
| HB-SIEVES, arXiv math/0209360v1, p.33, (5.3) and the immediately following normalized main-sum display | support1..10,P=2,upper coefficient only at1 | S=5=10−5; normalized upper main1=5/10+5/10 | Finite normalization; edition-specific correction retained. |
| HB-SIEVES, arXiv math/0209360v1, p.28, Theorem 4.1 induction, before (4.5) | s=4,p=x^(1/4), then p=x | transformed arguments3 and0; second violates positive-domain branch | Finite normalization; edition-specific correction retained. |
| MAYNARD-2015, Published Ann. Math. 181 (2015), p.404, (6.18) | k=2,m=1 | only coordinate index2 remains; index1 is removed by its integration | Finite normalization; edition-specific correction retained. |
| MAYNARD-2015, Published Ann. Math. 181 (2015), p.411, matrix-positivity assertion after Lemma 8.2 | zero-fibre polynomial on the triangle | I=1/3150>0; J₁+J₂=0, giving a kernel of A₂ | Finite normalization; edition-specific correction retained. |
| KHAYUTIN-19, Published Ann. Math. 189 (2019), pp.230–231, Lemma 9.21, (43)–(44) and final prime-sum estimate | β=1,j=1; prime cutoff growing | difference p−1 is retained; replacing it by p loses cancellation and leaves divergent Σ1/p | Finite normalization; edition-specific correction retained. |
| KHAYUTIN-19, Published Ann. Math. 189 (2019), p.231, Lemma 9.23, the two-case proof | α=0,z=16,Q=x,r=1 | smooth reciprocal sum31/16≤16 for β=1; no log α is evaluated | Finite normalization; edition-specific correction retained. |
| FIMR-13, Public author manuscript, §5, Proposition 5.1 proof, pp.21–24, dyadic block sizes | x=100,y=z=10,last endpoint20,N=5 | 20>z but20·5=100≤2x=200; factor2 range suffices | Finite normalization; edition-specific correction retained. |
| FIMR-13, Published Invent. Math. 193 (2013), pp.723,727–730 and §9 progression reduction, as corrected by the published 2015 erratum, pp.923–925 | q=15,k=3 or15 | reduced conductors5 and1; second excluded; uncertified locator not textually verified | Finite normalization; edition-specific correction retained. |
| BGS-10, Published Invent. Math. 179 (2010), p.577, (3.23) and (3.28) | bipartite 4-regular quotient | nonconstant eigenvalue−4 has modulus4, despite a one-sided upper spectral gap | Finite normalization; edition-specific correction retained. |
| BGS-10, Published Invent. Math. 179 (2010), p.581, (3.47), compared with Theorem 3.1 and (3.33) | t=1,dim=3,τ=1/2,d=1,C=r=3 | factor threshold54 requires R>54; δ<1/6 and s>9 retain strict margins | Finite normalization; edition-specific correction retained. |
| CHEN-73-CN, Chinese original, p.127, (27) | Chen logarithmic expression (27) | −0.0164726270754>−0.0164727; resulting main margin>2.6408077 | Finite normalization; edition-specific correction retained. |

# Removed acceptance names

These are removed signatures, not a claim that their README mathematics was abandoned. The unweighted Gram and general Kronecker developments are supplied by their named owners.

- `BoundingSieve.abs_siftedSum_sub_eulerProduct_le`
- `BoundingSieve.mainSum_sub_errSum_le_siftedSum`
- `SieveGram.bombieri_diagonal_offDiagonal`
- `SieveQuantitative.HasLogSieveDimension`
- `SieveQuantitative.HasProductSieveDimension`
- `SieveQuantitative.remainderMass`
- `SieveQuantitative.HasSieveLevel`
- `SieveBinary.BinaryPolynomial`
- `SieveBinary.rho`
- `SieveQuadratic.discriminantCharacter`
- `SieveQuadratic.discriminantCharacter_periodic`
- `SieveApplications.parityWeight`
- `SieveQuadratic.jutila_real_character_mean`
- `SieveVaughan.incompleteLog`
- `SieveDistribution.windowError`
- `SieveArithmeticDistribution.discrepancy`
- `SieveMaynard.PrimeTuplesConjecture`
- `SieveAlmostPrime.rough_to_at_most_almost_prime`
- `SieveAffine.IsPrimitivePair`
- `SieveAffine.almostPrimeLocus`
- `SieveAffine.affine_expansion_level`
