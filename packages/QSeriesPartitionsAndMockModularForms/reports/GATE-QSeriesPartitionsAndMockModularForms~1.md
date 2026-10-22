## H01 (CBirkbeck) — applied

`TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/Suggested.lean:11` now lists the headline results, and the module contains 15 admitted headline theorems with only 12 necessary definitions, instead of 66 declarations. The completed Lerch elliptic and full SL₂(ℤ) laws are stated at lines 236 and 248 using four explicit definitions at lines 207–231; the eta-quotient multiplier is algebraically identical to Zwegers2002 line 741, with its pole and upper-half-plane hypotheses retained.

## H02 (CBirkbeck) — applied

`TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/Suggested.lean:17` identifies the missing constructions for general indefinite-theta transformations, harmonic-Maass Fourier and xi exact sequences, arbitrary-pole Jacobi decomposition, and the full mock-vector/root-of-unity completion statements with shadows and all-cusp conditions. The former free-function operator statements and theta-coordinate comparisons no longer stand in for those headlines.

## H03 (CBirkbeck) — applied

`TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/Suggested.lean` drops 45 former declarations and all 25 value-computing examples, including coefficient checks, empty cases, character-filter API, decimation API, and differential-operator API. Their mathematical specifications and Checks remain in the corresponding README sections as prose; the final module has no proved or admitted examples, sorry-defined data, or option overrides.

## H04 (CBirkbeck) — applied

`TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md:125` describes the acceptance test, the API lists throughout are prose bullets, and every one of its 27 retained own declaration names occurs in `Suggested.lean`. All 27 declarations were elaborated with `#check @name` and compared with their README statements: no section hypothesis disappeared, and §4.4 now explicitly records the residue-count adapter's full natural-modulus domain, including t=0, while keeping positivity on the character-filter laws.

### Source, ownership and signature evidence

The new completion statements use Zwegers2002 line 336 for the odd theta, Zwegers2002 line 362 for μ, Zwegers2002 line 485 for E, Zwegers2002 line 506 for R, and Zwegers2002 line 734 for the completion and both transformation laws. The real specialization E(x)=erf(√π·x) follows by substitution from `TauCeti/Analysis/SpecialFunctions/Erf.lean:51`; the imported real erf does not supply the complex entire extension. The eta quotient has the exact factor w²(η(τ)/η(γτ))³: since η(γτ)/η(τ)=ν(γ)√w, this equals ν(γ)⁻³√w, and determinant one with Im(τ)>0 ensures w≠0 and Im(γτ)>0.

The unchanged headline formulas were compared with Gasper1995 line 135 (binomial), Gasper1995 line 301 (Euler), Gasper1995 line 317 (large base), Gasper1995 line 478 (regular bilateral quotient), Gasper1995 line 501 (1-psi-1), Gasper1995 line 605 (quintuple product), Andrews1986 line 93 (Bailey), Pak2002 line 3703 and Pak2002 line 3745 (both Rogers–Ramanujan identities and counting), AndrewsGarvan1988 line 10 and AndrewsGarvan1988 line 69 (equidistributions, together with its Theorem 1 at line 87), BevilacquaChandranChoi2019 line 39 (prime powers), and Zagier2009 line 912 (rank specialization). Settled waived and uncertified references were not reopened; no new work was cited.

Object searches covered the pinned Mathlib and Tau Ceti, main, the board packages, the indexed roadmap heads and all twelve provided sibling checkouts. No competing owner was found for the newly stated completed Lerch laws: GeometryOfNumbersAndQuadraticArithmetic §4.3 owns the uncompleted product and Appell–Lerch difference theory; the nonholomorphic correction and its cancellation are this roadmap's extension. The native definitions used here were checked at `Mathlib/Combinatorics/Enumerative/Partition/Basic.lean:52` (positive multisets with fixed sum, without distinctness or sorting), `Mathlib/NumberTheory/ModularForms/JacobiTheta/TwoVariable.lean:45` and line 251, `Mathlib/NumberTheory/ModularForms/DedekindEta.lean:56`, and the erf file above. Searches for Maass, mock modular, indefinite theta and meromorphic Jacobi carriers at the pins found no carriers realizing the omitted full headlines.

Supplier citations were resolved against main for PadicMeasuresIwasawaAlgebras §2.9, ClassicalArithmeticCompletion §§2.10, 2.31, 4.20, 4.40, 4.60–4.61, ThetaSeries Layers 1–3, ModularForms Layer 0/10B and the η²⁴=Δ example, ContourIntegration Layers 2–3, PDE Lane E and IntegralLattices §§0G, 1G–1H; the new-roadmap heads supply HabiroCyclotomicCompletions §1.1, ArithmeticStatisticsPartIV §3.2, GeometryOfNumbersAndQuadraticArithmetic §4.3, MetaplecticAutomorphicForms §§2.4b–2.6, 4.7, 6.18–6.20, 7.1–7.2 and 7.49, and AutomorphicSpectralTheory §1.16. No ownership moved and no dependency was added. The resolver's remaining “BruinierFunke2003, §3” lead is the literature citation identified in References, not a roadmap citation; the Cartier and QToolkit names are verified supplier targets, rather than claims that they exist at the pins.

### Adversarial mathematics pass

Each row below records computed values. Finite counts and congruences are exact; decimal series values are numerical falsification checks, not proofs. All retained theorem hypotheses were compared with the elaborated types; the new matrix law was tested on I, −I, S, T, ST and TS, so its group checks include noncommuting elements. The API-to-prose edits retain their mathematical hypotheses and formulas.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| qBinomial | (a,q,z)=(2,0,1/4), (0.4,0.2,0.3) | 2/3=2/3; 1.317173077564435≈1.317173077564436 | Agreement; q=0 included | Kept headline |
| qBinomial_largeBase | (a,q,z)=(−1/2,2,3); terminating a=1/2 | −0.0152582473763925≈−0.0152582473763930; 1−3/2=−1/2 | Correct radius and termination | Kept headline |
| euler_qExponential | q=0,z=0.3; q=0.2,z=0.3 | 10/7=10/7 and 1.3=1.3; 1.542841634859783≈1.542841634859784 and 1.398721700006436≈1.398721700006437 | Both Euler formulas agree | Kept headline |
| ramanujanOnePsiOneTerm | j=0; j=−1,a=2,q=z=1/2,b=0 or b=q | 1; −2/3; 0 | b=0 permitted; b=q terminates negative tail | Kept necessary definition |
| ramanujanOnePsiOne_hasSum | a=2,b=0,q=1/4,z=1/2; a=b | bilateral sum ≈1.6·10⁻¹⁷, product 0; inner radius=1 when a=b | Cancellation agrees; empty annulus excluded | Kept headline |
| baileyPair | α=δ₀,a=1/3,q=1/2; α=β=δ₁,a=1,q=1/2 | β₀=1,β₁=12/5,β₂=192/55; wrong pair gives 1≠8/3 at n=1 | Positive and negative models separated | Kept necessary definition |
| baileyLemma_transform | preceding unit pair, ρ₁=2,ρ₂=3, n=0,1,2; q=a=0 | transformed β=1,12/5,192/55, equal to original β; at q=a=0 both sequences remain δ₀ and 1 | Agreement; unit guards retained | Kept headline |
| IsGapTwo | empty, (4), (3,1), (2,2) | true,true,true,false | Multiplicity and gap endpoint detected | Kept necessary definition |
| IsPlusMinusOneMod5 | empty, (4), (3,1), (2,2) | true,true,false,false | Correct residues, distinct from gap predicate | Kept necessary definition |
| rogersRamanujan_count | n=0,…,10 | both counts: 1,1,1,1,2,2,3,3,4,5,6 | Exact agreement | Kept headline |
| rogersRamanujan_count_two | n=0,…,10 | both counts: 1,0,1,1,1,1,2,2,3,3,4 | Exact agreement; size-one count zero | Kept headline |
| rogersRamanujan_hasSum | q=0 and q=0.2 | at zero 1=1 twice; first 1.252084005384960≈1.252084005384960, second 1.050083338709691≈1.050083338709692 | Both products agree | Kept headline |
| quintupleProduct_hasSum | q=0.2,z=0.8; n=−1,0,1 | sum 1.291702935848088≈product 1.291702935848086; exponents n(3n−1)/2 are 2,0,1 | Correct integer parity and signs; qz≠0 retained | Kept headline |
| partitionRank | empty,(1),(3,2,1,1),(3,3),(2,2,2) | 0,0,−1,1,−1 | Largest-part minus length, including conjugate pair | Kept necessary definition |
| partitionCrank | same first four partitions | 0,−1,−1,3; non-strict filter on (3,2,1,1) gives 0 | Strict inequality necessary | Kept necessary definition |
| partitionResidueCount | size 1; t=0 exact rank fibers, t=2 rank/crank fibers; t=1,size 2 | exact rank-zero fiber 1, rank-one fiber 0; rank class 0=1, crank class 1=1; sole t=1 fiber=2 | Total natural-modulus domain agrees | README explicitly records t=0 |
| rank_equidistribution_five_seven | sizes 4,9 modulo 5; sizes 5,12 modulo 7 | every fiber respectively 1,6,1,11 | Exact agreement; modulo 11 at size 6 gives unequal vector (1,2,1,1,0,1,1,0,1,1,2) | Kept headline |
| crank_equidistribution_five_seven_eleven | first progressions; modulo 11,size 17 | every fiber 1 at sizes 4,5,6; every fiber 27 at size 17 | Exact agreement; ordinary size-one crank remains exceptional | Kept headline |
| partition_primePowerCongruences | (ℓ,r,δ)=(5,2,24),(7,2,47),(7,3,243),(11,2,116) | p(24)=1575≡0 mod25; p(47)=124754≡0 mod49; p(243)=133978259344888≡0 mod49 but ≡245 mod343; p(116)=1188908248≡0 mod121 | Seven-adic exponent is sharp in the stated example | Kept headline |
| zwegersOddTheta | τ=i,z=0,1/4; central half-integer pair | 0; −0.643589764; central pair −0.644793884=−2exp(−π/4)sin(π/4) | Zero and nonzero examples fix the phase | Added explicit native-theta specialization |
| zwegersR | τ=i,u=0,1,1/12 | 0.334531670; −0.334531670; 0.323196786 | Unit shift negates R; nonzero correction detected | Added explicit erf series |
| zwegersMu | τ=i,u=1/3,v=1/4; u+1 | −0.894187284i; +0.894187284i | Zero and doubled-phase models excluded; u=0 is a pole | Added explicit bilateral series |
| zwegersMuHat | same point | μ+(i/2)R=−0.732588891i; opposite correction gives −1.055785678i | Correct correction coefficient fixed | Added explicit sum |
| zwegersMuHat_elliptic | (k,l,m,n)=(0,1,0,0),(1,0,0,0),(1,0,1,0), at τ=0.3+0.8i,u=0.2+0.1i,v=0.4+0.05i | respectively both 0.392750760+0.393863046i; both 0.029300546+0.014981600i; both −0.392750760−0.393863046i | Errors below 8·10⁻¹⁷; mixed negative shift also agrees within 1.2·10⁻¹⁸ | Added full joint law |
| zwegersMuHat_modular | same point, matrices I,−I,S,T,ST,TS; S at τ=i | I/−I both −0.392750760−0.393863046i; S both 0.356363251+0.258668224i; T both −0.556219957−0.000786505i; ST both 0.542479304−0.334326683i; TS both 0.434892927−0.069080816i; fixed-point S both 0.716779363i | Errors below 6.4·10⁻¹⁶; opposite correction gives 0.371192104i≠1.033001448i | Added full matrix law and negative-control Checks |
| thirdOrderF | q=0,0.2; coefficients through degree 3 | 1; 1.139916497107998; (1,1,−2,3) | Initial term and signed coefficients fixed | Kept necessary definition |
| thirdOrderF_rank | sizes 0,…,6; q=0.2 | signed rank sums (1,1,−2,3,−3,3,−5); truncated count sum 1.139916497108284≈f=1.139916497107998 | Coefficients agree; decimal discrepancy is truncation | Kept headline |

The following rows cover the former Lean API and Check statements, whose formulas remain README specifications rather than acceptance-test declarations.

| Statement retained in README prose | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Finite inverse-base identity | a=3,q=2,n=0,2; q=1,n=2 | 1=1; 10=10; 4=4 | Agreement, including n=0 and q=1 | Removed Lean API theorem |
| Formal positive tail | a=0,1,2; degrees 0,1,2 | (1,0,0),(1,−1,−1),(1,−2,−2) | Correct coefficients | Removed Lean construction |
| Full formal product | a=0,1,2; degrees 0,1,2 | (1,0,0),(0,0,0),(−1,2,2) | Index-zero factor retained | Removed Lean construction |
| Tail constant coefficient and unit | a=1,2; zero ring | 1,1; zero ring 1=0 is its unit | Correct unit criterion | Removed Lean API theorem |
| Full first coefficients | a=2 | coefficient formula gives (−1,2,2), equal to finite-product expansion | Agreement | Removed value theorem |
| Tail modulo two | a=1 over 𝔽₂ | (1,−1,−1) mod2=(1,1,1) | Agreement | Removed value theorem |
| Tail coefficient stabilization | a=2,d=2,N=2,3; N=1 negative control | coefficient −2=−2; with N=1 coefficient 0≠−2 | N≥d guard necessary | Removed Lean API theorem |
| Pointwise finite-prefix convergence | a=2,q=0; a=1,q=1/2 | every nonempty prefix and product −1; every prefix and product 0 | Correct at zero base and vanishing factors | Removed Lean API theorem |
| Locally uniform finite-prefix convergence | same two pairs, plus n=0 | limits −1 and 0; empty prefix 1 in both cases | Empty prefix does not assert equality with limit | Removed Lean API theorem |
| First Bailey relation | a=1,q=1/2,α=δ₁ | right side 8/3; proposed β=δ₁ gives 1 | Negative control detects n+r denominator | Removed value theorem |
| Ordinary partition coefficient | n=0,1,2 | native counts and coefficients (1,1,2) | Agreement, including empty partition | Removed library-specialization theorem |
| Empty rank and crank | unique partition of zero | (0,0) | Agreement | Removed boundary theorem |
| Rank under conjugation | (3,3) and (2,2,2) | ranks 1 and −1 | Conjugation negates | Removed Lean API theorem |
| Sum of residue fibers | t=2,n=2 | fibers (0,2), sum 2=p(2) | Correct finite partition | Removed Lean API theorem |
| Modulus-one fiber | t=1,n=2 | sole fiber 2=p(2) | Agreement | Removed boundary theorem |
| Multiplied character filter | t=2,ζ=−1,n=2,r=0,1 | r=0: 0=2−2; r=1: 4=2+2 | Both signs verified | Removed Lean API theorem |
| Size-one modulo-two fibers | rank and crank | rank-zero count 1; crank-one count 1 | Different residues retained | Removed value theorem |
| Crank size forty-nine | t=11 | all eleven fibers 15775, total 173525=p(49) | Exact enumeration agrees | Removed value theorem |
| Rank failure modulo eleven | n=6 | rank-one count 2, total count 11 | Not equidistributed | Removed value theorem |
| Bounded inverse predicate | M=1,13,65 | unique d=0,6,19; 24·19=7·65+1 | Correct including modulus one | Removed Lean predicate |
| Unique bounded inverse | M=13,1; M=2 negative control | solution sets {6},{0},∅ | Coprimality needed | Removed elementary theorem |
| Bounded inverse reduction | M=65,N=13,d=19 | 19 mod13=6; 24·6=11·13+1 | Agreement | Removed elementary theorem |
| Seven-adic sharpness Check | r=3,n=0 | p(243) mod49=0, mod343=245 | Stronger exponent false | Removed value theorem |
| Decimation definition | t=2,f=1+X+2X²; t=0,f=1 | 1+2X; every coefficient of U₀1 is 1 | Positive and junk moduli distinguished | Removed Lean construction |
| Decimation composition | s=2,t=3,f=X⁶ | U₂U₃(X⁶)=X=U₆(X⁶) | Agreement | Removed elementary theorem |
| Decimation linearity | t=2,f=1+X,g=X²,c=2 | both 1+2X | Agreement | Removed elementary theorem |
| Decimation pullout | t=2,f=1+X,g=X² | both X+X² | Agreement; t>0 retained | Removed Lean API theorem |
| Decimation nonmultiplicativity | t=2 | U₂X=0, U₂(X²)=X≠0 | Ring-hom model excluded | Removed control theorem |
| Degree-five eta equation | τ=i | X⁵=3.330190676785558, remaining polynomial=3.330190676785561 | Residual below 2.7·10⁻¹⁵ | Removed proof-route theorem |
| Degree-seven eta equation | τ=i | X⁷=64.83074746408877, remaining polynomial=64.83074746408877 | Agreement | Removed proof-route theorem |
| Odd-theta derivative at zero | τ=i | −2πη(i)³=−2.848694603987787 | Matches phase convention of central pair | Removed normalization API theorem |
| Odd-theta central pair | τ=i,z=1/4 | both −0.644793883889669 | Sign and shift fixed | Removed value theorem |
| Wirtinger derivative | F=constant,y,τ | 0,i/2,0 | Correct antiholomorphic convention | Removed Lean definition |
| Xi operator | k=0,F=y,iy; k=1,F=log y | 1,−i,1 | Correct conjugation and normalization | Removed Lean definition |
| Xi of constants | c=1,i; k=0,1 | 0 in every case | Agreement | Removed boundary theorem |
| Holomorphic Wirtinger derivative | F=τ,1 | 0=0 twice | Agreement | Removed elementary theorem |
| Xi antilinearity | k=0,c=i,F=y | −i=conj(i)·1 | Complex-linear alternative false | Removed Lean API theorem |
| Xi/Laplacian factorization | k=0,F=y²,y=1 | Δ₀(y²)=−2=−ξ₂(2y) | Correct composition sign | Removed free-function theorem |
| Weight-one logarithmic mode | k=1,F=log y | Δ₁(log y)=1−1=0; ξ₁(log y)=1 | Logarithm cannot be replaced by constant 1 | Removed boundary theorem |
| Polar shadow mode | k=0,F=conj(q⁻¹),τ=i | both 4πexp(2π)=6729.186604220947 | Polar shadow allowed in full growth space | Removed single-mode theorem |
| Native theta component | m=1,l=0,z=0,τ=i | both 1.003734885487739 | Coordinate comparison agrees; m=0 excluded | Removed adapter theorem |
| Convergence of third-order f | q=0,0.2 | 1; 1.139916497107998 | Agreement with actual summands | Removed separate API theorem |
| First third-order Taylor coefficients | coefficients 1,−2,3 | derivatives 1,−4,18 | Factorials retained | Removed value theorem |
| Bilateral rank bridge | q=0.2,z=−1 | both 0.433357948652933 | Correct 1−z factor | Removed proof-route theorem |
| Bilateral omega bridge | q=0.2 | both 1.499934967742198 | Negative-index pairing retained; q=0 outside summands | Removed proof-route theorem |

### Exact validation outcomes

Build: `lake build TauCetiRoadmap.QSeriesPartitionsAndMockModularForms.Suggested` exited 0 with the exact final line `Build completed successfully (8978 jobs).`; its 15 warnings are the intended admitted headline theorems. The temporary signature checks were removed before this final build.

Dependency-check output: `depcheck: 13 roadmaps, 99 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.

Commit: `3f9c8900d2c6d4e08ff0593fcf9ded8e9903ec5c`. The worktree is clean; no push was made.

Gate exited 0. Exact summary:

```text
gate QSeriesPartitionsAndMockModularForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
