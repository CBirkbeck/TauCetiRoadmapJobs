## H01 (CBirkbeck) — applied

`TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:3509` replaces the extracted-subgroup population in the general argument with labelled lazy walks on the original Γ; line 3555 supplies their spectral estimate and simultaneous fixed-modulus conditioning, and lines 3592, 3606 and 3624 use that same population for the level, escape and saturation arguments. The conditioned main scale is X_L/|H_b| with its signed remainder at one retained; the separate free-tree bound at line 3630 explicitly requires its chosen subgroup's own remainder and escape estimates, and the affine requirements at line 3846 follow this distinction.

## H02 (CBirkbeck) — applied

`TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md:2805` replaces the unspecified radius η/√k with a nonnegative integral-one bump on the native supremum-norm carrier, with outer radius r<η/k and the explicit support inequalities η−r>0 and 1−η+kr<1. Checks at lines 2811, 2812 and 2813 compute the four-coordinate counterexample, the repaired upper and lower faces, and dimensions one and zero; the coordinate carrier in `Suggested.lean` already has the required norm and remains unchanged.

**Sources, ownership and signatures.** The pinned norm is `Pi.norm_def` in `Mathlib/Analysis/Normed/Group/Constructions.lean:310`, with the coordinate inequality `norm_le_pi_norm` at line 346. `Mathlib/Analysis/Calculus/BumpFunction/Normed.lean:32`, line 63, line 68 and line 76 supply the normalized bump, positive normalization integral, integral one and closed support, with finite-dimensional Borel Lebesgue measure satisfying their measure hypotheses. MAYNARD-2015 line 330 and line 332 identify the smooth-approximation use in Proposition 4.2; the norm-specific support argument is supplied explicitly here. BGS-10 remains settled as uncertified: the original-group walk citation is published §3.3, p.583, (3.56)–(3.57), and the exceptional-modulus citation is §2.4, Proposition 2.1, p.572; no inaccessible passage is treated as certified. The new mixing and conditioning bounds have the elementary spectral/CRT derivation written in the README.

Object searches across main, the board packages and the open-roadmap catalog, including the supplied heads, found no other owner of these affine sieve conditioning or Maynard simplex-support contracts. These extend the sieve adapters already owned here; they reuse §0.2's finite weighted bridge and native spectral, norm and convolution notions, without introducing a competing general carrier. AdelicAlgebraicGroups §4.2 still supplies rational-point strong approximation only, and AnalyticNumberTheoryPartI §3.26 supplies the divisor-subpower absorption used in the squarefree quotient-size bound; both sections were reopened at their indexed new-roadmap heads. Cross-roadmap resolution found no missing citation; no supplier moved and no additional supplier was introduced.

All 50 declarations were placed in one scratch file as `#check @name`, elaborated successfully, and compared with their README statements and the supplied elaborated signatures. No section hypothesis was lost and no signature changed; in particular the Maynard definitions retain `Fin k → ℝ`, and affine saturation remains documented in `Suggested.lean` as not statable on its missing affine interfaces rather than receiving a proxy statement.

**Adversarial mathematics pass.** The table covers the added or changed statements and their consuming proof steps; counts, fractions and finite-group actions were recomputed. Finite cyclic and nonabelian examples test the walk adapter and spectral implication, rather than asserting that these finite groups satisfy the general algebraic-group endpoint hypotheses.

| Statement | Instances tried | Values on the two sides or competing models | Result | Change |
| --- | --- | --- | --- | --- |
| Original-group labelled population and total mass | m=2; L=0,1,2 | Cardinalities 1,4,16 equal 4^0,4^1,4^2; L=1 has two identity labels | Multiplicities survive even without freeness | Replaced the general reduced-word population |
| Evaluation pushforward and signed divisor remainder | Cyclic quotient C₃, letters 0,0,1,−1; f(x)=x | Endpoint masses at L=2 are (6,5,5), total 16; zero-class count 6 minus main term 16/3 is 2/3 | Distinct values alone would have mass 3, not 16 | Kept fibre weights and exact signed remainders |
| Initial state and modulus one | L=0; H₁ singleton | Empty word count 1; β(1)X₀=1; R₁=0; nonconstant subspace has dimension 0 | Identity and trivial quotient are valid | Explicit base case and β(1)=1 |
| Transition and removal of periodicity | C₂ with its nonidentity generator | P eigenvalues (1,−1); (I+P)/2 eigenvalues (1,0); length-one masses (1,1) versus alternating non-lazy masses (2,0) or (0,2) | One-sided expansion becomes actual lazy mixing | Specified T=(I+P)/2 on the original image |
| Same transition on a nonabelian group | S₃, all three transpositions | P eigenvalues 1,0,−1; T eigenvalues 1,1/2,0; one-step masses 3 at identity, 1 at each transposition, 0 at each 3-cycle, total 6 | No commutativity or distinct endpoint assumption | Added nonabelian Check |
| Spectral error and exponential conversion | m=2, ρ=1/2, L=2; also L=0 | τ=1/2; 16·(1/2)^2=4=16^(1/2); at L=0 both expressions are 1 | No off-by-one length or logarithmic base error | Derived the quantitative error from the given gap |
| Fixed-modulus population and main scale | C₂, b=2, c nonidentity; L=0,1 | Retained counts 0,1; Y=1/2,1; R_(1,c)=−1/2,0 | Main scale differs from exact mass at small L | Retained R_(1,c), with eventual positivity only |
| CRT main term after conditioning | C₆, letters 0,0,1,−1; odd class modulo 2; d=3 | At L=1 retained mass 2=Y; divisible-by-3 count 0; β(3)Y=2/3; R_(3,c)=−2/3 | Conditioning neither changes weights nor erases remainders | Added the joint b·d mixing contract |
| Simultaneous avoidance of exceptional primes | b=6 and values 2,3,5; also b=1 | gcd values 2,3,1; {2,3} has no surviving class at 6; at b=1 every gcd is 1 | Separate single-prime witnesses are insufficient | Chose one primitive γ and its class modulo b |
| Quotient-size and subset error bound | SL₂ at d=6 and d=15; f=a | At d=6, square root of image size is √144=12≤6²=36; at d=15, image size 24·120=2880 and zero subset size 6·20=120≤15⁴=50625 | Cauchy–Schwarz supplies the required d^(g−1) bound after subpower absorption | Avoided an unjustified uniform constant in a product of zero counts |
| Empty/full local bad sets | No residue zeros; or f constantly 2 at p=2 | Empty bad set gives count 0, β=0 and remainder 0; full obstruction gives β(2)=1 and gcd(2,2)=2 | Zero densities may be deleted; full obstructions cannot be omitted | Stated the native strict-density adapter |
| Strict level and logarithmic savings | g=3, τ=1/2; δ=1/12 and δ=1/6 | τ+gδ−1=−1/4 and 0 respectively | Strict margin gives decay; endpoint does not | Specified remainder o(Y/(log X)^t) |
| Remainder cutoff and finite-length limitation | D=1; X=16, τ=1/2, g=3, D=2, image size at b equal to 2 | At D=1 the strict sum is 0; at D=2 the majorant without its constant is 4·8=32 while Y=8 | Small-L positivity is not asserted; d=1 is included for D>1 | Replaced the ambiguous non-strict level sum |
| Escape prime and exponent | g=3, ρ=1/2, L=12 | Balancing scale 16; p=17 gives 1/17+289/4096=9009/69632; at scale 16 both terms are 1/16 | Both terms decay as ρ^(L/g) | Supplied prime choice and δ_W=(1−τ)/g |
| Escape boundary and conditioning | W empty, W={1}, W=G; L=0 | Counts 0,1,1 respectively; X₀=1; a restricted count is at most its unrestricted count | Small lengths require C_W; W=G must be excluded | Preserved properness and enlarged the fixed constant at small L |
| Rational-point density over extension fields | Polynomial X+αY with α irrational; rational (x,y) | At (0,0), both coefficient polynomials X and Y vanish; at (1,0), the value and X are both 1 | A coefficient component supplies a rational vanishing condition | Explained reduction to a proper ℚ-defined subvariety |
| Saturation from roughness and height | f=a²+b², C=3, L=0; t=2,g=3,τ=3/4,δ=1/24,s=20,m=4,d=2 | At identity, |f|=1≤2·3²=18; limiting logarithmic Ω bound is 960 log 3/log 8≈507.1880<508; for f=0 the locus excludes the value despite Ω(0)=0 | Height gives a finite bound after zero-locus escape; repeated degree remains visible | Used conditioned lower count and escape on the same population |
| Independent free-word population | Free rank two, lengths at most 0,1,2 | Counts 1,5,17 versus 1,5,21 for unreduced words up to length two; exact-length-one lazy count is 8 | Free-tree growth is distinct from lazy growth | Kept the adapter separately scoped |
| Explicit free-tree bound and repeated factors | t=2,g=3,d=2,τ=1/2,C=r=3; also f=a versus a² | Threshold 216; at δ=333/2000,s=1801/100, bound 72040/333≈216.336<217; degree doubling changes thresholds 54 to 108; at r=1, log r=0 | Requires its own mixing and escape, plus r>1 and strict margin | Removed dependence on the original-group mixing theorem |
| SL₂ expansion consumed by saturation | Bipartite quotient with eigenvalue −1; ordinary gap capped at ε=1 | Lazy image of −1 is 0; upper nonconstant bound becomes ρ=1/2 | The existing ordinary-gap endpoint suffices for its own lazy population | Connected the SL₂ conclusion to the original-group adapter |
| Supremum-norm counterexample | k=4, η=1/10, t_i=9/40, u_i=1/30 | ‖u‖∞=1/30<η/√4=1/20, but sum(t+u)=31/30>1 | Old radius fails on the actual carrier | Replaced it with r<η/k |
| Repaired upper and lower simplex support | Same k,η,t; r=1/80; lower corner t_i=η | Upper and lower displaced sums 19/20,17/20; lower-corner coordinate η−r=7/80>0 | Closed support stays strictly inside all faces | Added both directions as Checks |
| One- and zero-coordinate support conventions | k=1,η=1/4,r=1/8; k=0 | [1/4,3/4] expands to [1/8,7/8]; empty-vector sum and ratio are both 0 | No η/k calculation is used at k=0 | Kept the direct zero-dimensional case |
| Shrink scaling and continuity of the ratio | Triangle indicator, k=2,η=1/10, scale 7/10 | I: 1/2→49/200; each J: 1/3→343/3000; ratio: 4/3→14/15=(7/10)(4/3) | Shrinking preserves nonzero I,J; loss 2/5 leaves a smoothing margin when δ=1/2 | Retained the scaling argument with explicit norm-compatible mollification |

**Validation.** Commit `b7b40cf7` changes only `TauCetiRoadmap/SieveMethodsAndPrimePatterns/README.md`; `Suggested.lean` is unchanged. The working tree is clean, and nothing was pushed. The first gate invocation reported only the uncommitted README; the committed result below passes.

`lake build TauCetiRoadmap.SieveMethodsAndPrimePatterns.Suggested` exited 0, with the expected admitted-theorem warnings and exact final output:

```text
Build completed successfully (8976 jobs).
```

The single scratch signature elaboration exited 0 for all 50 declarations and the six newly cited native declarations.

Directional dependency check exited 0, with no UPWARD or CYCLE line:

```text
depcheck: 53 roadmaps, 595 edges, 0 problem(s)
```

The final gate exited 0:

```text
gate SieveMethodsAndPrimePatterns: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
