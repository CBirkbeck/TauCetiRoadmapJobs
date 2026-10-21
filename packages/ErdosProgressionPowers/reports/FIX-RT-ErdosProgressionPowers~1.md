# ErdosProgressionPowers repair report

The first 18 finding sections refer to review a (R01–R18); the next 12 refer to review b (R01–R12). Cross-references use `a-` and `b-` prefixes to distinguish the two reports’ repeated identifiers. Overlapping findings share one mathematical resolution, with cross-references below. The repair commits already present at the start of this run were audited against the actual files; this report covers their retained changes and the final corrections together. No independent acceptance is asserted.

## R01 (P1) — not actionable in this package: exact supplier section and design entry require external edits

Unowned classification → `gap:rational-isogenies`, naming EisensteinIdealAndRationalTorsion, its required classification and both torsion-sensitive cutoffs. No supplier section is invented: that roadmap is absent from the supplied checkouts. The local consequences consume the gap. Its supplier statement and design registration require maintainer action. Evidence: BS20pub lines 294–296 and 334–336; Mazur1978 is uncertified.

## R02 (P1) — applied

Modulus uniqueness → `pageZero` plus `boundedPage`, asserting real character values, real simple zeros and unique character/zero pairs across positive moduli. Both exceptional-set consumers retain the same positive c and full contract. `realExceptionalZero_upper` is stated before use, excluding the principal pole. Evidence: BS20pub lines 1434–1438; BMOR2018v3 lines 377–379. Also resolves b-R04.

## R03 (P1) — applied

Implicit conductor estimate → `quadraticConductor_maxPrime_lower`, for all positive primitive quadratic conductors N>1, with the dyadic part 1,4,8. Its Checks include 4,8,24 and exclude 16. The harmonic criterion now names it and both numerical reciprocal inequalities. Evidence: BS20pub lines 872–890. A θ bound handles P≥23; the eight smaller prime cutoffs have minimum ratio 3/log24.

## R04 (P2) — applied

Strict growth at every index → Nⱼ≥N₁^(2^(j−1)), with strictness only for j≥2, throughout the roadmap. The strict prime-factor estimate remains separate. At j=1 equality is unavoidable; repeated squaring of Nⱼ₊₁>Nⱼ² proves the corrected chain. Evidence: BS20pub lines 813–819; line 904 contains the endpoint slip.

## R05 (P2) — applied

Missing signed milestone → real-bodied `SignedFactorization` and `signed_factorization_exists_unique` on Fin k families, for positive odd ell, nonzero terms and large-prime valuation divisibility. Two proved examples cover negative cubes, mixed signs, p=k and retained small-prime powers. All introduced names are in §0.4. Evidence: BS20pub lines 249–257 and unique factorization with odd-power injectivity.

## R06 (P2) — applied

Length k≥5 → k≥3, ell≥2 and 2ell+k<kell for `fixed_exponent_finiteness` and the signed diagonal adapter. `fixed_exponent_finiteness_length_ge_five` retains the application specialization. Checks add genera 3 and 10 at (3,4),(4,3), with genus 1 at (4,2). Evidence: DG95 lines 338–367; the signed extension explicitly retains its geometric proof obligations.

## R07 (P2) — applied

Unnamed cancellation → `smoothModulusCharacterSum`, with positive moduli, squarefree primitive first factor, coprimality, integer interval, real length/powers, explicit length threshold and τ(q)^(r²). The correlation theorem consumes it. Evidence: BS20pub lines 939–946. IwaniecKowalski2004 Theorem 12.13 is waived in the authoritative source record; the stated version is the one printed in BS20.

## R08 (P2) — applied

Gram-only signatures → `smoothCharacterCorrelation`, with uniform c₃,K for each c₂>0, both conductor/prime-factor bounds, primitive quadratic characters and inequality of pulled-back integer functions. Nonzero moduli are explicit. The closed conductor bound matches the source’s more general statement. Evidence: BS20pub lines 948–956.

## R09 (P2) — applied

Stable-lattice construction → consumption of EtaleCohomologyFoundations §F.4.0, naming `ContinuousRep`, `ContinuousRep.exists_stable_lattice_iff` and `GaloisLattice.IntegralModel`. Joint continuity, compact Galois group and local coefficient field are retained. Only residual semisimplification independence remains local. The supplier’s compact-group consequence and its topology conditions were read directly.

## R10 (P2) — applied

Numerical inputs “in the range used” → quantified prime-product bound for x≥10⁸ and `factorialLargePrimeContribution` at k≥exp(exp(10⁷)), with separate dependencies. Evidence: BS20pub lines 428–438 and 1309–1323. The weighted-factorial bound retains the full prime interval and (k−1)! rather than an unspecified error term. Also resolves the corresponding part of b-R05.

## R11 (P3) — applied

Both `padicValInt.mul` citations → the defining equality with `padicValNat` on natAbs, `Int.natAbs_mul` and `padicValNat.mul`, with a prime instance and nonzero factors. At Mathlib 6b7abb3c, `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` lines 88–124 define/end the integer namespace without mul; lines 415–422 give natural multiplicativity. The contrary assertion in review b’s soundness summary is rejected.

## R12 (P3) — applied

Coefficient comparison attributed to ClassicalArithmeticCompletion → integer squareclass character from §1.51, followed by existing coefficient-change APIs. The character-family contract now names `MulChar.ringHomComp`, its value/quadraticity lemmas and Tau Ceti’s conductor/primitivity transport with injective casts and positive level. Evidence: Tau Ceti a91d3aaf, `TauCeti/NumberTheory/DirichletCharacter/Conductor.lean` lines 50–61.

## R13 (P3) — applied

Repeated or nondiscriminating Checks → unequal-sum quadruple, twice-square Case II, thin sets distinguishing mass/primality/member bound, and separate Page-region tests including a genuine wide-strip trivial zero. The signed positivity boundary is grouped with the original solution example. At most two examples per affected definition remain. Pole and height exclusion now test `pageZero` itself.

## R14 (P3) — applied

Impossible prime endpoint equality test → Tpr(1)=∅, Tpr(2)={2}, Tpr(16)={5,7,11,13}, with proved mirrors. Upr has empty zero/unit cases and actual membership 2∈Upr(2). The open endpoint convention remains. A prime equality would imply k⁷=p¹⁶, hence 7vₚ(k)=16, impossible in ℕ.

## R15 (P3) — applied differently

Missing mirrors → weightedHalf(4,1)=log 3+log 2 and native `twistedLegendre` equation/discriminant examples. `roth_cutoff_substitution` is a proved named theorem; `granville_scale` is a named admitted target including the equality at 64. These avoid unrelated standalone library examples. See b-R11 for the index formula. Evidence: BS20pub lines 647–653, 703–719, 1135–1141 and 1489–1502.

## R16 (P3) — applied

Unused single-inequality predicate `certifiedThreshold` → direct k≥exp(exp(10⁷)) in the witness and its API. The mathematical threshold and numerical substitution are retained. `thinSet` remains because it combines prime membership, a length bound and reciprocal mass. No Lean consumer used the deleted name.

## R17 (P3) — applied

Secondary-only attribution → Kraus1997 §3.1 Théorème 4 p.1144, Lemos2017v2 Theorem 1.1 p.2, Faltings1983 §6 Satz 7 p.365, and ErdosSelfridge1975 Theorem 1 p.292. Kraus retains prime ell≥5 and Serre weight two. Evidence: Kraus1997 lines 249–293; Lemos2017v2 lines 44–46; Faltings1983 lines 682–683; ErdosSelfridge1975 lines 29–30.

## R18 (P3) — not actionable in this package: sources.toml is outside the authorized edit list

The package source manifest remains absent. Legal provenance was collected in a valid scratch source-record bundle, including BS20pub and DG95; it cannot be installed in the package under this brief. The authoritative external manifest’s waived entries remain settled. The maintainer must copy the records into the permitted destination in a separately authorized change. Also resolves b-R07’s manifest demand.

## R01 (P1) — not actionable in this package: the supplier contract’s section is unavailable

Local proof target `faltingsFiniteness` → `gap:faltings`, naming FaltingsFinitenessAndIsogenyTheorems and the precise smooth-projective, geometrically connected, genus≥2 number-field statement. §6.1 imports it; the signed adapter remains local. That supplier is absent from the supplied checkouts, so its section cannot be certified or edited here. Evidence: Faltings1983 lines 682–683; DG95 lines 355–367.

## R02 (P1) — not actionable in this package: missing supplier contracts require external resolution

Generic modularity and level-lowering proof targets → `gap:elliptic-modularity` and `gap:weight-two-lowering`, naming the earlier owners and deletion-level/coefficient-prime hypotheses. Local trace and progression adapters remain. §1.10 now points to §1.1’s supplier bridge instead of itself. Actual supplier section locators and design registration cannot be supplied from the available checkouts. Evidence: BS20pub lines 178–193.

## R03 (P1) — not actionable in this package: supplier statements and design registration are external

Generic deep inputs → explicit gaps for newform representations, coefficient bounds, isogenies/uniformity, character PNT/repulsion, finite zero exclusion and log-free density. The finite verification is consumed as a mathematical input, with no computation target. Each gap names its owner and required statement. a-R01 covers isogeny classification. Exact absent supplier sections cannot be invented; the source bibliography is repaired locally.

## R04 (P2) — applied

Same mathematical finding as a-R02. That single repair supplies reality and simplicity before applying `realExceptionalZero_upper`, whose quadraticity, q≥3 and β>0 hypotheses match BMOR2018v3 lines 377–379. Its regularity guard retains the roadmap’s pole convention; pinned `IsQuadratic` also allows principal characters. `exceptional_moduli_bounds` and `exceptional_indices_sparse` both retain the full `boundedPage c` hypothesis with the same c.

## R05 (P2) — applied differently

Unspecified tail/count/product/zero bounds → exact inequalities and ranges in §§0.9 and 5.1. Schoenfeld1976 lines 729–733 support the stronger coefficient 1.001093 for all x>0; the proposed 1.001102 restriction is unnecessary. The half-tail, prime-count cutoff and totient product are explicit. a-R02 and a-R10 contain the shared zero/product resolutions.

## R06 (P2) — applied

Locally planned good/multiplicative Artin comparisons → EllipticCurves Layer 8’s semistable algorithmic–Artin comparison. Its exact Szpiro block was read; it expressly owns exponents 0 and 1. Local Artin/Swan construction, isomorphism invariance and residual multiplicative deletion remain. Both the scope and §1.1 dependency contract name the supplier.

## R07 (P2) — not actionable in this package: source manifest changes are excluded

a-R17 supplies the primary theorem citations; a-R18 records the uneditable manifest obligation. Additional analytic references and legal versions are listed in References, with Martin2003v1 Theorem 2 verified at lines 113–114. The four previously unavailable works are now waived in the authoritative manifest, and Mazur1978 remains uncertified. No waived text is re-requested.

## R08 (P3) — applied

Descent attributed to Layers 2–5 → EllipticCurves Layer 6’s `x − θ` Kummer map with kernel 2E(K), in scope, supplier contract and §2.1 dependencies. Layers 2–5 retain their other elliptic inputs. The Tau Ceti contract also names the pinned descent/halving declarations in `TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/XSubT.lean`; no general descent theory is replanned.

## R09 (P3) — applied differently

Unnamed θ,ψ carriers → `Chebyshev.theta` and `Chebyshev.psi`, with exact Mathlib file in the supplier contract and explicit estimate statements. Their small-value proofs are grouped with the roadmap’s own `weightedHalf` example, preserving the requirement against unrelated library-object examples. This also tests the contribution at 4 and vanishing at 1.

## R10 (P3) — applied differently

Missing definition Checks → grouped term/H/Hplus, kappa, Upr, removedIndex, thinSet, zeroHeight and full Page-contract tests, with proved mirrors. `certifiedThreshold` is deleted under a-R16 instead of receiving tests for a prohibited wrapper. Survivors also have a nonempty unit-length Check; `zeroWithin` tests real-part rejection independently. Page tests distinguish actual region membership, pole/height rejection and pair uniqueness.

## R11 (P3) — applied differently

Missing index definition → rational `gammaZeroIndex` on all natural levels, with two grouped examples covering 0,1,4,11,44. a-R15 supplies the shared twisted-curve and numerical targets. The Roth calculation is proved as a named theorem; the real-power scale including its k=64 equality is a named roadmap target, as permitted for a boundary proof beyond compact examples.

## R12 (P3) — applied

`composite_exponent_reduction` → `pow_eq_pow_div_prime`, `primitive_solution_natAbs_y_gt_one` and `finite_root_exponent_pairs`, each with its own hypotheses, dependency and locator in §6.4. The power identity allows every divisor p, the product argument requires only k≥3 and nonzero yd, and root-pair finiteness assumes only |Y|>1. Downstream consumers use the separate results.

## Adversarial mathematics pass

Every named theorem and real-bodied definition in Suggested.lean was read; all hypotheses are in declaration signatures, with no section-variable block. The following table also covers the README-only interfaces, identities and conventions. Numerical instances here are mathematical boundary checks, not proof of the admitted general targets. Supplier gaps remain assumptions to be filled by their named owners.

| Statement / section | Instances tried | Result | Change |
| --- | --- | --- | --- |
| 0.1 term, primitive_solution, H, Hplus | i=0,1,2; k=0,1,2; positive and signed square samples; gcd=2 | Indexing, signs, nonzero and nested bounds retained | Grouped proved Checks |
| 0.2 term_gcd | d=0,n=±1; adjacent indices; signed terms | Bezout cancellation gives a natural divisor of j−i | None |
| 0.3 large_prime_valuations | k=1; q=k prime; negative term | Nonzero product and uniqueness of a divisible term suffice | Correct natural-valuation supplier |
| 0.4 signed factors | ell=1,3; −8; p=k=2; coefficient 64 | Odd-power uniqueness; small-prime powers cannot move to z | Full predicate, theorem, examples |
| 0.5 ap_triples | k=0,1,2,3,5; constant triple | Counts 0,0,0,1,4 and strict spacing | Retained |
| 0.6 quadruples and kappa | repeated middle; unequal sums; nonzero first index | Negative kappa; ordering alone is insufficient | Unequal-sum and sign Checks |
| 0.7 divisibility_indices | k=0; r=0,1; endpoint index k | Total definition, empty boundary, correct range | Retained |
| 0.8 residue_class_count | r=1; r>k; p dividing d; k=0 | One class; +1 loss necessary; strict prime discrepancy | Retained |
| 0.9 prime arithmetic | x=1,2,4; k=2·10¹⁰; n=p^a | Prime powers differ from primes; explicit domains necessary | Native Chebyshev carriers and exact inequalities |
| 1.1 representations/lattices | p=ell; rank-two compact action; change of lattice | Frobenius assertion excludes ell; only semisimplification is independent | Earlier lattice owner and deep-input gaps |
| 1.1 Artin/residual conductors | good; split/nonsplit multiplicative; valuation divisible by ell | Tate exponents 0/1; residual exponent may drop to 0 | Import semistable comparison |
| 1.1 level-lowering traces | retained prime; removed multiplicative prime; coefficient prime | Good trace and ±(p+1) clauses have different domains | Supplier gap; local trace adapters retained |
| 1.1 Kraus/index/irreducibility | N=0,1,4,11,44; ell=2,3,5,7,11 | μ=0,1,6,12,72; threshold max retains dyadic constraint | Index definition; prime/weight hypotheses and classification gap |
| 1.2 normalized first family | n=d=1; n=2,d=1; n=−3,d=2 | g=1,2,1 and normalized sums/gcds correct | Retained |
| 1.3 first invariants/local tests | same samples; p=2; odd p dividing discriminant | Native factor is 16(abc)²; dyadic minimization separate | Retained |
| 1.4 linear identity | consecutive and unequal spacings; signed terms | Both n and d coefficients cancel | Retained |
| 1.5 equal-sum family | (0,1,1,2); positive/signed terms | A−B=κd² and middle-coefficient sign correct | Retained |
| 1.6 second local invariants | d=0 identity; p=2,3; paired divisible terms | Δ=−64κ³A²B; half-interval test has p≥5 | Retained |
| 1.7 first reduced level | ell=7; p=k; odd versus dyadic support | Needs classification and lowering; odd part squarefree | Explicit upstream gaps through §1.1 |
| 1.8 second reduced level | ell=11; p=3; primes dividing κ | Wild 2/3 and κ² factors cannot be dropped | Upstream gaps through §1.1 |
| 1.9 half_primes_divide_d | one/two p-divisible terms; upper endpoint p=k | Two-term quadruple has κ=1−p, a p-unit | Retained |
| 1.10 coefficient_prime_bridge | good ell; finite-flat multiplicative ell | Deletion level is not a conductor by definition | Replace self-dependency by supplier bridge |
| 1.11 Kraus progression threshold | N=1,4,11; lcm(N,4) | Newspace and dyadic term both necessary | Quantified prime-product input |
| 1.12 comparison_curve | fixed triple; all triples at once | Same residual prime and same chosen curve retained | Retained |
| 1.13 good traces | p≡3 mod4; p=3 versus ≥5 | Hasse congruence gives integer equality; supersingular range retained | Retained |
| 2.1 Legendre/twist equation | λ=0,1,1/2,2; t=v=1/2 | Singular endpoints; complex equation equals −2i | Native model and proved equation/discriminant tests |
| 2.1 two-primary/trace/image interfaces | odd finite fields; p=5; CM λ=1/2; ell>37 | Halving and CM normalizer domains retained | Correct descent owner and uniformity gap |
| 2.2 case_partition/inCaseSquareclasses | k=0; parameters −1,0,2,3 | Both squareclass branches needed; partition exhaustive/disjoint | Twice-square and zero Checks |
| 2.3 Case I projection | residue classes 1,3,5,7 mod8 | Coefficients 0,4,0,0; absolute-value lower bound | Retained |
| 2.4 Case II normalization | t=v=1/2; p≡5 mod8 | Twist by 2 and exact two-part 8 are essential | Native witness test |
| 2.5 non-CM exclusion | a=b; b=c; a=c | First two force d dividing 3; last forces d=0 | Retained |
| 2.6 Case II projection | odd conductor 1; tv square/twice-square | Positivity and primitive quartic normalization required | Uniformity supplier gap |
| 2.7 character_family | modulus 1; χ(0),χ(1); prime power 4 | Same character must satisfy mass and support | Correct pinned coefficient transport |
| 3.1 weightedHalf | k=0,1,2,4 | Values 0,0,log2,log3+log2 | Prime-power proved Check |
| 3.1 exceptional repulsion | one character; j=1,2 | Equality at first index; strictness thereafter | Correct conductor chain |
| 3.1 conductor-largest-prime | N=4,8,24,16,1; P≥23 and all eight smaller primes | 24 is tight small case; 16 not a primitive quadratic conductor | General named estimate |
| 3.1 smooth product/correlation | r=1; principal remaining factors; unequal levels; equal characters | Empty maximum convention explicit; equal functions excluded | Full general and specialized signatures |
| 3.1 finiteGramBound | empty family; equal/orthogonal unit vectors | Row sum 0,2,1 respectively | Retained |
| 3.2 harmonic criterion | c₁ below/above 1/2; first exceptional conductor | PNT decay uses min(c₁,1/2); 2/0.94<2.13 | Named missing conductor estimate |
| 3.3 many-character criterion | equal versus distinct characters; diagonal rows | Squared margin 1/68<0.1239² | Correlation dependency made explicit |
| 4.1 quantitativeThreeAP/substitution | singleton; constant triple; δ=10⁻⁵ | Strict AP necessary; numerical substitution lies between 10⁶ and 10⁷ | Proved substitution theorem |
| 4.2 Tpr, Upr, survivors | k=0,1,2,16; membership of 2 | Nonempty unit-length survivor; open prime endpoint equality impossible; actual memberships discriminate | Replace vacuous endpoint test |
| 4.3 deletion/removedIndex | empty J; unit coefficients; sample and tie | Retained {0,1,4}; least tie index 1 | Empty/singleton/least-tie Checks |
| 4.4 Stirling adapter | m=1; telescoping adjacent terms; zero excluded | Positive denominator and sqrt(pi) normalization retained | Existing Mathlib sequence used |
| 4.5 survivor_density | S empty; +1 losses; smooth/large prime split | Exact factorial input and 0.00319−0.44/139>10⁻⁵ | Quantified factorial input |
| 4.6 thinSet/witness | k=9 with ∅,{7},{2},{9}; k=6,{7} | Distinguishes mass, primality and upper bound | Grouped proved Checks; delete threshold wrapper |
| 4.7 maximal family | empty family; duplicate largest primes; outside witness | Inclusion maximality forces mass dichotomy | Retained |
| 4.8 original_route_bound | 17log k split; closed small-prime endpoint | c₁=1/20000 absorbs endpoint; 0.1683>0.166 | Correct exceptional chain retained |
| 5.1 bounded analytic inputs | real/nonreal candidates; q=3; β>0; ρ→0 | Reality needed before real-zero bound; integral remains finite | Full zero contract and exact upper bound |
| 5.2 zeroHeight/zeroWithin/hasZeroWithin | k=0,1; c=0; principal pole; above-height zero | Height 1 in total boundary cases; pole, high candidate and wrong real part excluded | Grouped proved Checks |
| 5.2 pageZero/pageException/boundedPage | q=0; T<0; c=4log2,T=2,ρ=−2; c′≤c | Genuine region witness; real/simple pair uniqueness distinguished | Full predicate and discriminating examples |
| 5.2 exceptional_moduli | q=0; q>k⁴ | Positivity and finite cutoff enforced before zero witness | Retained |
| 5.3 exceptional_moduli_bounds | q<T and q≥T; conjugate zeros at one level | Modulus uniqueness alone insufficient | Full Page hypothesis |
| 5.4 nonexceptional_half_sum | principal character; ρ near0; fixed small c | Principal excluded; integral controls quotient uniformly | Retained |
| 5.5 exceptional_indices | empty moduli; q=8,r=1; q=1000,r=1000>k | Large divisors and cube-root equality retained | Retained |
| 5.6 exceptional_indices_sparse | q just above logk; q≥T; r>k | +1 summed before becoming negligible; constants uniform in n,d | Same Page hypothesis |
| 5.7 witness/granville_scale | disjoint blocks; k=64; x≥64 | 8k^(7/2)≤k⁴ exactly from 64 | Named scale target including equality |
| 5.8 conductor_detection | squarefree odd part; dyadic part 8 | Gcd-product ≥N/8 gives the required divisor | Retained |
| 5.9 granville_route_bound | same witness for size/avoidance; nonprincipal χ | O(k/logk) contradicts fixed positive mass | Retained |
| 6.1 curve finiteness | genus1 versus ≥2; number field; geometrically connected curve | Genus1 excluded; rational-point theorem is supplier input | Faltings gap |
| 6.2 effective_prime_bound | yd=0; ell=2; fixed k; signed terms | Trivial branch explicit; effectivity additional to existential signature | Retained |
| 6.3 fixed_exponent_finiteness | (3,4),(4,3),(5,2),(4,2); sign patterns | Genera 3,10,5,1; hyperbolic range exact | General range and ≥5 specialization |
| 6.4 power/root reductions | p dividing ell, including ell=0; y=0,±1; Y=−8 | Power law unconditional beyond divisibility; nontrivial root variable >1 | Split three targets |
| 6.5 fixed_length_finiteness | fixed versus varying k; composite exponents; signed lifts | Finite union over bounded primes and finite root fibres | Update reduction consumers |
| 7.1 consecutive product | k=1,n=4; k=2,n=1; signed square product | Length/positivity essential | Primary theorem locator |
| 7.2 erdos_threshold | K=0,3; signed n<0; increasing threshold | Known positive sample excludes 0,3; signed sample outside domain | Remove duplicate primitive_solution example |
| 7.3 smooth_multiplier | b=0,1,2; tau<1/2 | Zero excluded; unit support empty; boundary sample fails support | Retained |

## Checks and maintainer handoff

- `lake build TauCetiRoadmap.ErdosProgressionPowers.Suggested`: exit 0; first uncached run ended `Build completed successfully (8983 jobs).` The final-source rerun also exited 0 and ended `Build completed successfully (8976 jobs).` Its only warnings were the 31 expected declarations using `sorry`; all 45 proved examples elaborated without admissions. The rerun verifies the source fingerprint after edits made during dependency compilation.
- Requested package gate with `--base origin/main`: the pre-commit run exited 1 solely for `dirty=2` (the two authorized edited files); every content check was zero. After commit it exited 0 with this exact output:

```text
gate ErdosProgressionPowers: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 check-labels-missing=0 empty-sections=0 round-labels=0 long-fences=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

- Requested merge-order dependency check: exit 0, exact output below. There is no UPWARD or CYCLE line.

```text
depcheck: 2 roadmaps, 14 edges, 0 problem(s)
```

- `git diff --check`: exit 0, no output. Final `git status --short`: exit 0, no output. The repair diff from the reviewed commit touches only `TauCetiRoadmap/ErdosProgressionPowers/README.md` and `TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean`.
- Commit: `42053a57c08415a9ec0808d442eb654702586215`, `ErdosProgressionPowers: red-team repairs (pinned APIs, regular zeros, conductor proof, and discriminating checks)`, on `roadmap/erdos-progression-powers`. The two pre-existing repair commits were retained. A per-command Codex identity was used; no Git configuration file was edited. No push or GitHub write was performed. No Lean process from this job remains running.

These are elaboration and mechanical checks, not an independent mathematical acceptance. No unrestricted Lean build or cache-update command was run.

The source-service bundle contains legal provenance for the cited readable texts. IwaniecKowalski2004, RosserSchoenfeld1962, Tenenbaum1995 and RahmanRoth are waived in the authoritative external source manifest. Mazur1978 is uncertified and is cited only by its published locator. No missing legal text remains to request under these settled statuses. No source passage is copied into this report or the roadmap.

External actions remain: provide the exact sections/statements for the ten supplier gaps in the README; register those gaps in the design; install and complete the package source manifest. These are not silently assumed proven. The supplied ArithmeticDynamics roadmap was searched and has no relevant overlap or reverse dependency.

Changed exported names: `fixed_exponent_finiteness` now has the full hyperbolic range; its old application is `fixed_exponent_finiteness_length_ge_five`. `composite_exponent_reduction` is replaced by the three targets in §6.4. `certifiedThreshold` is deleted. `boundedPage` is strengthened, and both exceptional-set consumers require it. `realExceptionalZero_upper` explicitly excludes the principal pole. Generic supplier-owned proof targets are replaced by named gaps or supplier imports. The pinned prime/prime-power subgroup-index declarations and descent/halving APIs are named in the Tau Ceti contract, without duplicating their theory. No other roadmap was edited, and no supplier was moved later in the merge order.
