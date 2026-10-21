# Red-team review of #1336 ErdosProgressionPowers at 42053a5 (pass a (codex))
**Verdict:** changes needed

## Earlier findings: verification at this head

Here `a-Rnn` and `b-Rnn` distinguish the two first-pass reports. Locations without a filename in the following table are in `TauCetiRoadmap/ErdosProgressionPowers/README.md`; `Lean` means `TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean`. Quotations are from the repaired package, not from sources.

| Earlier finding | Status | Repaired passage and independently checked witness |
| --- | --- | --- |
| a-R01, rational isogenies | Partly repaired; external remainder settled | Line 263: “`gap:rational-isogenies`”; lines 554–558 consume the classification rather than prove it. BS20pub lines 294–296 and 334–336 give the two torsion-sensitive applications. The named supplier section and design registration remain unavailable. |
| a-R02, Page contract | Repaired | Lines 1172–1179: “real character values and a real simple zero”; Lean 601–610 asserts reality, derivative nonvanishing and pair uniqueness. Lean 690–709 retains the same positive c and full contract in both consumers. |
| a-R03, conductor estimate | Repaired | Lines 957–964: “`quadraticConductor_maxPrime_lower`”; Lean 350–352 states the general primitive-quadratic bound. Conductors 4,8,24 satisfy it; 16 is excluded. BS20pub lines 872–890 and the small-prime calculation support it. |
| a-R04, strict first index | Repaired | Line 922: “strictly for 2≤j≤s”; line 984 retains the weak first-index inequality. At j=1 the exponent is 1; iterating strict squaring gives the later strict inequalities. |
| a-R05, signed milestone | Repaired | Lines 341–344: “`signed_factorization_exists_unique`”; Lean 71–80 gives positive odd exponent, nonzero terms and large-prime valuation divisibility. Lean 118–153 tests negative and mixed signs, p=k and a retained small-prime cube. |
| a-R06, hyperbolic range | Repaired for the reported defect | Line 1368: “k≥3, ell≥2 and 2*ell+k<k*ell”; Lean 774–782 matches, with the k≥5 corollary separate. Genera at (3,4),(4,3),(5,2) are 3,10,5. The source’s additional positive elliptic cases are a distinct omission, S03. |
| a-R07, general short sums | Repaired | Line 930: “`smoothModulusCharacterSum`”; Lean 355–364 carries positive moduli, squarefree primitive first factor, coprimality, interval length and divisor loss. Compared with BS20pub lines 939–946, including r=1. |
| a-R08, smooth correlation | Repaired | Lines 947–955: “`smoothCharacterCorrelation`”; Lean 367–377 uses distinct integer-valued pullbacks, positive moduli and uniform constants. Equal characters cannot accidentally satisfy the off-diagonal hypothesis. BS20pub lines 948–956. |
| a-R09, stable lattices | Repaired | Lines 244–251: “Consume §F.4.0”; `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:850`–885 actually supplies the continuous representation/lattice interface. The local target is residual semisimplification independence. |
| a-R10, explicit numerical inputs | Repaired | Lines 448–455 name “`factorialLargePrimeContribution`” and give its enormous but explicit length range. The separate prime-product estimate starts at 10⁸. BS20pub lines 428–438 and 1309–1323 support the two different uses. |
| a-R11, nonexistent valuation name | Repaired | Lines 125–128: “`padicValNat.mul`”; at the Mathlib pin, `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean:415`–422 has precisely natural multiplicativity with prime and nonzero hypotheses. Integer natAbs transport is legitimate. |
| a-R12, coefficient transport owner | Repaired | Lines 182–188: “`conductor_ringHomComp`”; pinned `TauCeti/NumberTheory/DirichletCharacter/Conductor.lean:50`–61 supplies injective-cast conductor/primitivity preservation. ClassicalArithmeticCompletion §1.51 supplies only the original integer character. |
| a-R13, specific weak Checks | Repaired for the listed defects | Line 397: “(0,1,1,3) is excluded”; line 812: “2 lies in the twice-square branch”; line 1114: “thinSet holds for {7}”. Lean 165–168,320–341,512–515 mirrors these, and 665–676 has a positive Page-region witness. S05 concerns the different exceptional-set predicates. |
| a-R14, impossible endpoint | Repaired | Line 1044: “T_pr(2)={2}; T_pr(16)={5,7,11,13}”; Lean 464–510 tests actual prime membership. Equality at the open endpoint would require 7v_p(k)=16 and cannot test a real prime boundary. |
| a-R15, missing mirrors | Repaired | Line 911: “`weightedHalf 4 (fun _ => 1)=log 3+log 2`”; Lean 393–406 proves it. The twist examples are at 301–313; `roth_cutoff_substitution` at 411–413 is proved; `granville_scale` at 762 is an explicitly registered boundary target. |
| a-R16, threshold wrapper | Repaired | Line 1105 directly uses “k≥exp(exp(10⁷))”. `certifiedThreshold` has been removed from both files; the quantitative substitution remains. |
| a-R17, primary attribution | Repaired | Line 559 cites “Kraus1997, §3.1, Théorème 4”; line 790 cites Lemos Theorem 1.1; lines 1350 and 1434 cite Faltings Satz 7 and Erdős–Selfridge Theorem 1. Primary locations independently read; see source table. |
| a-R18, source manifest | Not repaired; settled | There is still no package `sources.toml`, hence no repaired passage to quote. References at 1563–1583 and the external source records exist. The previous repair explicitly excluded this file from its edit authorization; this pass does not reopen that settled external obligation. |
| b-R01, Faltings owner | Partly repaired; external remainder settled | Line 1347: “Consume `gap:faltings`”; line 258 names the earlier owner and full genus≥2 statement. Faltings1983 lines 682–683 support it, but the actual supplier section and registered design contract remain unavailable. |
| b-R02, modularity/lowering | Partly repaired; external remainder settled | Lines 259–260: “`gap:elliptic-modularity`” and “`gap:weight-two-lowering`”; line 692 refers back to the supplier bridge rather than to itself. BS20pub lines 178–193 support the required input; registration is still external. |
| b-R03, other deep inputs | Partly repaired; external remainder settled | Lines 261–267 name the newform, coefficient-bound, uniformity, character-PNT, finite-zero and density gaps; line 266 says “with no computational procedure specified here”. These are explicitly unfulfilled contracts, not silently supplied theorems. |
| b-R04, real/simple zeros | Repaired | Lean 613–617: “`realExceptionalZero_upper`”; q≥3, quadraticity, β>0 and pole exclusion are explicit. The strengthened Page contract supplies the reality needed for BMOR2018v3 lines 377–379. |
| b-R05, hidden explicit estimates | Repaired | Lines 445–455 explicitly state the prime-power tail, prime-count, totient and factorial estimates; lines 1177–1179 name the real-zero bound. Schoenfeld1976 lines 729–733 support the chosen stronger 1.001093 coefficient. |
| b-R06, semistable comparison owner | Repaired | Lines 512–518: “EllipticCurves Layer 8”; `TauCetiRoadmap/EllipticCurves/README.md:1450`–1470 owns the good/multiplicative Artin comparison. Residual deletion is correctly kept separate from rational Tate-module conductor 1. |
| b-R07, sources | Partly repaired; manifest remainder settled | References 1568–1583 name primary works, including “Martin2003v1”. Martin2003v1 lines 113–114 support the newspace bound. The missing package manifest is the same settled remainder as a-R18. |
| b-R08, descent locator | Repaired | Line 195: “Consume Layer 6’s `x − θ` Kummer map”; `TauCetiRoadmap/EllipticCurves/README.md:1207`–1211 contains the descent construction. The separate native XSubT API is named at lines 165–169. |
| b-R09, θ/ψ carriers | Repaired | Lines 147–148: “`Chebyshev.theta` and `Chebyshev.psi`”; their small-value assertions are grouped with the roadmap’s own weighted sum at Lean 393–406. The prime power 4 contributes log 2. |
| b-R10, missing definition Checks | Repaired for the enumerated omissions | Lines 398–399 compute both kappa values; 1045–1047 test Upr at 0,1,2; 1068–1070 test empty/singleton/tied maximizers; 1208–1220 test heights and Page predicates. The generic rejection-only weakness that remains is isolated in S05. |
| b-R11, missing index/twist/numerics | Repaired | Lines 566–568: “μ(0)=0, μ(1)=1 and μ(4)=6”; Lean 183–199 also gives μ(11)=12 and μ(44)=72. Twist and numerical repairs are as in a-R15. |
| b-R12, bundled exponent reduction | Repaired | Lines 1380–1390 separately name “`pow_eq_pow_div_prime`”, “`primitive_solution_natAbs_y_gt_one`” and “`finite_root_exponent_pairs`”, with separate Needs. Lean 785,789,794 retains their different domains. |

The six entries explicitly marked not actionable by the previous repair are respected: a-R01, a-R18, b-R01, b-R02, b-R03 and b-R07. No finding below re-raises them. Their reasons do not certify missing supplier contracts or the absent manifest; those limitations remain recorded at the end. No false identity or missing binder was found to have been introduced by the repairs.

## S01 (P2) — The ordinary Legendre family has an earlier owner

**Location:** `TauCetiRoadmap/ErdosProgressionPowers/README.md:746`, “construct the native Legendre equation y²=x(x−1)(x−λ) and its scaled twists.”

**Claim:** This package constructs the ordinary Legendre family as part of its local interface.

**Witness:** `TauCetiRoadmap/ModularCurves/README.md:1104`–1109 owns the universal Legendre family; `TauCetiRoadmap/ArithmeticDynamics/README.md:8737`–8755 already specifies `legendreCurve` over fields of characteristic different from two, with its coefficients and discriminant.

**Exact repair text:** “Consume ModularCurves §4C’s universal Legendre family and its field fibres; use ArithmeticDynamics §6.35 `legendreCurve` and `legendreCurve_Δ` for the native field-level presentation. Here construct the scaled twists, the full-two-torsion-to-scaled-Legendre adapter and the arithmetic local/halving comparisons.” Add those earlier owners to the supplier contracts and §2.1 Needs. Keep `twistedLegendre` as the genuine scale-two specialization; do not import an unmerged Suggested module.

## S02 (P2) — The common factorial-deletion milestone is an omitted easy signature

**Location:** `TauCetiRoadmap/ErdosProgressionPowers/README.md:1061`, “`valuation_deletion_factorial`”; `TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:443`–461.

**Claim:** Maximal-valuation deletion supplies the factorial divisibility used by both analytic routes, but Suggested.lean defines the deletion and never states its milestone.

**Witness:** `valuation_deletion`, `term`, ℤ, ℕ, Finset, integer divisibility and Nat.factorial are already available. The omission requires no new geometric carrier; §§4.5 and 5.7 both consume precisely this result.

**Exact repair text:** Add the following signature in Layer 4, before its consumers, and retain §4.3’s existing name and locator:

```lean
/-- Removing one maximal valuation per supported prime leaves a product dividing the factorial. -/
theorem valuation_deletion_factorial (n d : ℤ) (k : ℕ)
    (A : ℕ → ℕ) (J : Finset ℕ)
    (hcop : Int.gcd n d = 1) (hJ : J ⊆ Finset.range k)
    (hn : ∀ i ∈ J, term n d i ≠ 0)
    (hA : ∀ i ∈ J, 0 < A i ∧ (A i : ℤ) ∣ term n d i)
    (hs : ∀ i ∈ J, ∀ p : ℕ, p.Prime → p ∣ A i → p < k) :
    (∏ i ∈ valuation_deletion k A J, A i) ∣ (k - 1).factorial := by
  sorry
```

## S03 (P2) — The source’s two elliptic boundary cases remain outside fixed-exponent finiteness

**Location:** `TauCetiRoadmap/ErdosProgressionPowers/README.md:1368`, “for natural k≥3, ell≥2 and 2*ell+k<k*ell.”

**Claim:** The general fixed-exponent development covers only the strict hyperbolic range.

**Witness:** DG95 line 325 states Corollary 2.1 for k≥3, ell≥2, k+ell≥6. DG95 lines 333–338 separately discharge (4,2) and (3,3) before invoking the genus>1 argument. Neither case satisfies the present strict inequality.

**Exact repair text:** “Retain the signed hyperbolic adapter. Add `positive_fixed_exponent_finiteness` for k≥3, ell≥2 and k+ell≥6 on integer triples (n,d,y) with n>0, d>0, y>0 and gcd(n,d)=1 satisfying the progression product equation. Before it, state and prove the positive-domain boundary results `four_term_product_not_square` and `three_term_product_not_cube`, citing DG95 §2.1, p. 520 and identifying their elementary arithmetic inputs. Combine these two cases with `fixed_exponent_finiteness`.” Give the positive finiteness headline an easy Lean signature on the existing integer tuple carrier, and record (3,3) and (4,2) as arithmetic boundary Checks. Do not claim that genus one alone proves either boundary result, or silently extend the positive nonexistence statements to signed progressions.

## S04 (P3) — The multiplier Checks never admit a nonunit multiplier

**Location:** `TauCetiRoadmap/ErdosProgressionPowers/README.md:1474`–1476; `TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:834`–846, “The prime two at k=2 lies above the support threshold when tau < 1/2.”

**Claim:** These Checks discriminate the smooth prime-support condition and its endpoint.

**Witness:** Replacing the support condition by b=1 passes every current Check. For n=d=y=1,k=2,ell=2,b=2, membership holds exactly when tau≥1; 1/2 is not this instance’s boundary.

**Exact repair text:** “For n=d=y=1, k=2, ell=2 and b=2, `smooth_multiplier tau 1 1 2 1 2 2` holds iff 1≤tau. In particular it holds at tau=1 and fails below 1.” Replace the second multiplier example by a proved example of this equivalence; keep the first zero/unit example. This tests a nonunit allowed multiplier and the closed prime-support endpoint without exceeding two examples.

## S05 (P3) — The actual exceptional-set construction still has only rejection tests

**Location:** `TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:715`–733; `TauCetiRoadmap/ErdosProgressionPowers/README.md:1221`–1225, “0 never belongs to Q(k,c)” and “q>k^4 never belongs.”

**Claim:** The Checks validate `zeroWithin`, `hasZeroWithin` and `exceptional_moduli`, including their existential connection.

**Witness:** Setting `zeroWithin` and `hasZeroWithin` constantly false and `exceptional_moduli` constantly empty passes every current example about them. The new positive example at lines 665–676 tests only the separate `pageZero`/`pageException` definitions.

**Exact repair text:** “Let χ₅ be the nonprincipal quadratic character modulo 5, with values cast to ℂ. It is primitive and even, so L(0,χ₅)=0. At k=16,c=0 the height is 1 and 1−3 log(log16)/log16<0. Hence `zeroWithin 16 0 χ₅ 0`, `hasZeroWithin 16 0 5` and `5 ∈ exceptional_moduli 16 0`.” Add this grouped positive Check and a proved Lean mirror using the existing quadratic-character and continued-L-function APIs. If the logarithmic verification exceeds a compact example, register this conjunction as a named boundary theorem in both files, as allowed by the signature policy. Regroup the current negative controls so each kept definition still has at most two proved examples.

## Adversarial mathematics pass

Every declaration’s exact type, section and instance context was recorded in the scratch inventory. There are no ambient `variable` or `include` blocks: required hypotheses must occur in the individual types. The following table covers all 57 numbered target sections, including their README-only targets. “No change” means no additional defect established, not a proof of an admitted theorem. Higher-dimensional, non-Noetherian, inseparable and zero-ring tests are inapplicable where the actual carrier is ℤ, ℚ, ℝ, ℂ or a field with the stated characteristic restriction; the relevant finite-field, zero-length and zero-modulus boundaries were tested instead.

| Statement / section | Instances tried | Result | Change |
| --- | --- | --- | --- |
| 0.1 term, primitive_solution, H, Hplus | k=0,1,2; d=0; gcd=2; signed square and positive square | Nonzero and length restrictions survive; zero-based indexing correct | No change |
| 0.2 term_gcd | Coprime signed n,d; d=0,n=±1; adjacent indices | Gcd divides the index difference; finite sweep 11,424 cases | No change |
| 0.3 large-prime valuations | p=k; p>k; negative factors; zero factor | At most one divisible nonzero term; zero excluded | No change |
| 0.4 signed factors | ell=1,3; −8; small coefficient64; p=k=2 | Odd-power sign recovery and uniqueness hold; not an ell-powerfree small factor | No change |
| 0.5 strict AP triples | k=0,1,2,3,5; repeated index | Empty through2; counts1,4 at3,5; constants excluded | No change |
| 0.6 equal-sum quadruples, kappa | (0,1,1,2),(0,1,2,3),(1,2,2,3); unequal sums | kappa is negative with the stated normalization; repeated middle allowed | No change |
| 0.7 divisibility indices | r=0,1; k=0; r>k; index=k | Total divisibility definition and strict index range behave correctly | No change |
| 0.8 residue count | r=1; r>k; coprime/uncoprime d,r | One residue class under coprimality; additive1 necessary; 13,464 cases | No change |
| 0.9 explicit prime arithmetic | x=1,2,4; n=p^a; stated large cutoffs | ψ counts powers; θ does not; divisor count a+1; no small-x use of large-x bounds | No change |
| 1.1 comparison, conductors, index and Kraus | p=ell; split/nonsplit multiplicative; valuation multiple of ell; N=0,1,4,11,44 | Rational and residual conductors differ; μ=0,1,6,12,72; lattice result has an earlier owner | External gaps remain settled |
| 1.2 first Frey model | n=d=1; n=2,d=1; n=−3,d=2 | Normalized (a,b,c) sum to0; coefficients have correct signs | No change |
| 1.3 first invariants/local properties | Signed samples; odd primes; p=2 | Δ=16(abc)², c4=16(a²−bc); dyadic treatment separate; 4,420 normalized cases | No change |
| 1.4 generalized Fermat identities | Adjacent and nonadjacent triples; signed n,d | Both linear coefficients cancel; no division by a zero gcd in the admissible family | No change |
| 1.5 second Frey family | Repeated middle; positive/signed terms | A−B=kappa*d²; a2 and a4 agree with the native equation | No change |
| 1.6 second invariants/local tests | p=2,3; d=0 algebraic identity; paired divisible factors | Δ=−64*kappa³*A²*B; c4 normalization checked in 10,880 cases | No change |
| 1.7 first reduced level | ell=7; p=k; small/dyadic factors | Odd squarefree support distinct from dyadic bound; uses classified irreducibility | No new change |
| 1.8 second reduced level | ell=11; p=3; prime dividing kappa | Wild/small factors and kappa² retained | No change |
| 1.9 half-interval primes | One versus two p-divisible terms; p=k | The two-term construction uses kappa=1−p, a p-unit | No change |
| 1.10 coefficient-prime bridge | Good and finite-flat multiplicative ell | Weight-two conclusion explicitly supplied, not inferred just from a level name | Settled supplier gap |
| 1.11 Kraus threshold | Level1; lcm(N,4); newspace dimension0,1 | Dyadic maximum necessary; full Γ₁ dimension is not substituted | No change |
| 1.12 comparison curve | One triple and all triples | Curve and residual comparison are chosen together | No change |
| 1.13 good reduction/trace zero | p=3; p≥5; p≡3 mod4 | Hasse congruence and supersingularity ranges distinguished | No change |
| 2.1 Legendre, twists, halving and images | λ=0,1,1/2,2; odd fields through47; t=v=1/2; characteristic2 | Singular exclusions correct; equation and double verified, including 256 finite-field witnesses | S01 ownership |
| 2.2 case partition | Parameters −1,0,2,3; empty triple set | Both squareclass branches retained; partition exhaustive | No change |
| 2.3 Case-I projection | Four odd classes mod8 | Weighted projection selects the intended class; absolute value is required | No change |
| 2.4 Case-II normalization | t=v=1/2; p≡5 mod8 | Scale2 and exact two-primary divisibility retained | No change |
| 2.5 CM exclusion | a=b,b=c,a=c; signed factors | Equalities force small d or d=0, excluded under the application | No change |
| 2.6 Case-II conductor/projection | Odd conductor1; square/twice-square tv | Quartic descent uses positive primitive data; CM and non-CM cases separated | No change |
| 2.7 simultaneous characters | χ(0),χ(1); conductor1; repeated triple | Same selected character carries both mass and support; cast preserves conductor | No change |
| 3.1 analytic inputs | k=0,1,2,4; N=1,4,8,16,24; r=1; equal characters; empty/orthogonal/equal vectors | Correct weights, dyadic cases and diagonal exclusions; Gram row sums0,1,2 | No change |
| 3.2 harmonic criterion | One exceptional character; j=1,2; c1 on each side of1/2 | Weak first-index chain; 2/0.94<2.13; PNT decay exponent remains positive | No change |
| 3.3 many characters | Coincident versus distinct pullbacks; Gram diagonal | Off-diagonal input excludes equality; 1/68<0.1239² | No change |
| 4.1 quantitative Roth | Singleton; constant triple; density10⁻⁵ | Strict AP required; cutoff lies strictly between10⁶ and10⁷ | No change |
| 4.2 thin-prime survivors | k=0,1,2,16; empty deletion set | Nonempty unit-length survivor; actual open/closed prime memberships checked | No change |
| 4.3 maximal valuation deletion | Empty/unit coefficients; zero singleton; least tie; nontrivial sample | Deleted valuations leave factorial divisibility; 3,456 finite cases | S02 missing signature |
| 4.4 Stirling bound | m=1; adjacent telescoping; m=0 | Positive domain excludes zero denominator; sqrt(pi) normalization retained | No change |
| 4.5 survivor density | Empty S; prime versus large-prime losses | Additive counting errors retained; 0.00319−0.44/139>10⁻⁵ | No change |
| 4.6 thinSet and witness | k=9 with ∅,{7},{2},{9}; k=6,{7} | Distinguishes mass, primality and upper cutoff; one witness has all properties | No change |
| 4.7 maximal family | Empty family; duplicate largest prime; outside triple | Maximality and distinct largest primes have separate roles | No change |
| 4.8 original route | 17log k split and its equality endpoint | Endpoint absorbable by stated smaller exponent; 0.1683>0.166 | No change |
| 5.1 analytic zero inputs | Principal pole; nonreal pair; q=3; rho=0 | Real-zero bound requires reality; integral equals log2 at0 | No change |
| 5.2 Page and actual exceptional predicates | q=0; T<0; k=0,1,16; c=0; principal rho1; trivial zero−2 | Full Page contract repaired; actual exceptional-set tests can all pass when empty | S05 positive witness |
| 5.3 exceptional bounds | q<T and q≥T; conjugate zeros at same level | Pair uniqueness and simplicity required and present | No change |
| 5.4 nonexceptional sums | Principal character; rho near0; same c | Pole excluded; integral bound avoids artificial 1/abs(rho) singularity | No change |
| 5.5 bad indices | Empty moduli; q=8,r=1; q=1000,r=1000 | Large divisors retained; cube-root endpoint included | No change |
| 5.6 sparse indices | q just above logk; q≥T; r>k | Additive1 summed before absorption; constants independent of n,d | No change |
| 5.7 conductor witness | Disjoint consecutive blocks; k=64 | Same witness has avoidance/size; 8*k^(7/2)=k^4 at64 | No change |
| 5.8 conductor detection | Odd squarefree part; dyadic factor8 | Product of gcds gives N/8 and a cube-root divisor | No change |
| 5.9 Granville endgame | Same witness/character; principal exclusion | Positive linear mass contradicts the sublinear upper estimate | No change |
| 6.1 rational-point finiteness | Genus1 versus2; number field; connectedness | Genus≥2 and geometric connectedness explicit; no effective height asserted | Settled supplier gap |
| 6.2 effective prime bound | y*d=0; ell=2; fixed k; negative n,d | Trivial branch explicit; effective dependency ledger demanded beyond classical existence | No change |
| 6.3 fixed-exponent finiteness | (3,4),(4,3),(5,2),(4,2),(3,3); sign choices | Hyperbolic genera3,10,5 correct; source separately handles positive elliptic boundaries | S03 |
| 6.4 exponent/root reductions | p=0 dividing ell=0; y=0,±1; Y=−8 | Power identity remains total; root finiteness needs abs(Y)>1; distinct terms force abs(y)>1 | No change |
| 6.5 all-exponent finiteness | Composite exponents; fixed versus varying length | Finite union uses bounded prime exponents and finite root fibres | No change |
| 7.1 consecutive products | k=1,n=4; k=2,n=1; signed square product | Length and positivity restrictions necessary and present | No change |
| 7.2 Erdős threshold | K=0,3; negative starting term | Known positive square excludes both thresholds; signed example outside domain | No change |
| 7.3 smooth multiplier | b=0,1,2; tau=0,1/2,1 | Existing examples never permit b>1; actual sample threshold is1 | S04 |

## Verified sound

Read **1,583 README lines and 849 Lean lines**, without sampling. The inventory contains **115 declarations: 36 definitions, two abbreviations, 32 theorems and 45 proved examples**. Of the theorems, 31 use `sorry`; the Roth substitution is proved. All named Lean declarations occur in the README. Read all **57 numbered target subsections**, all **51 bold spans** (the target headings themselves are not bold), and tested/audited all **139 Check bullets** mathematically against their stated domains. This includes conceptual Checks on future carriers; it is not a claim that all 139 have been executed in Lean.

The declaration inventory records each exact signature and its layer. Integer versus natural valuations, natural truncated subtraction, real powers/logarithms, positive-modulus instances and characteristic restrictions were checked in their actual contexts. The finite sweeps total **44,198 instances** across gcd, residue, first/second models, factorial deletion, Legendre point counts and order-four witnesses. These are falsification tests, not proofs. Native discriminant factor16, negative second-family discriminant sign, scaled Case-II equation, corrected diagonal-cover indexing, the Roth cutoff10⁷, weak first exceptional index and the additive divisor-count error all survive this pass.

Checked **seven cited roadmap supplier groups** against main: EllipticCurves, ModularForms, LocalFieldsRamification, ClassicalArithmeticCompletion, ImaginaryQuadraticClassNumber, AlgebraicCurves and EtaleCohomologyFoundations. Separately checked **two earlier ownership locations** for S01: ModularCurves §4C and the supplied ArithmeticDynamics §6.35. The ten gap rows are not counted as verified supplier declarations. No source or sibling text was treated as an instruction.

Pinned reads used Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. In particular, the natural valuation multiplication, continued L-function rather than its convergence-only series, injective coefficient-change conductor/primitivity and ordinary arithmetic-function carriers are compatible. A current-branch Legendre API search hit was not used as pinned evidence: its file is absent at the Tau Ceti pin. S01 instead uses actual earlier roadmap ownership.

The source audit below records **15 locator groups checked across 13 legally readable works**. BS20 groups include multiple internal locators; this count is groups, not a claim that there are only15 citations. No source prose is reproduced here.

| Source / locator group | Witness and result |
| --- | --- |
| BS20, Theorem2 and §§2–4 | BS20pub lines 107–111 and 174–465; headline and modular input hypotheses, both Frey models, level bounds, half-prime construction and comparison traces checked. |
| BS20, §§5–8 | BS20pub lines 499–1141; character cases, projections, conductor estimate, short sums, correlation, Gram and quantitative Roth checked. |
| BS20, §9 and addendum | BS20pub lines 1162–1502; sieve, factorial deletion, maximality, bounded-height region, density and witness checked. Source endpoint/index slips are already corrected in the package. |
| Darmon–Granville, Corollary2.1 and proof | DG95 lines 325–367; positive domain, full stated range, diagonal equations and genus. S03 records the omitted elliptic cases. |
| Faltings, §6 Satz7 | Faltings1983 lines 682–683; genus≥2 number-field finiteness. |
| Erdős–Selfridge, Theorem1 | ErdosSelfridge1975 lines 29–30; positive consecutive product nonpower theorem. |
| Kraus, §3.1 Théorèmes3–4 | Kraus1997 lines 249–293; weight-two and prime≥5 hypotheses and the threshold construction. |
| Lemos, Theorem1.1, version2 | Lemos2017v2 lines 44–46; non-CM rational curve with nontrivial rational cyclic isogeny and ell>37. |
| Martin, Theorem2, version1 | Martin2003v1 lines 113–114; the newspace bound used in the threshold estimate. |
| BMOR, real-zero estimate | BMOR2018v3 lines 377–379; q≥3, quadratic and positive real zero hypotheses. |
| Schoenfeld, prime-power tail and Note Added in Proof | Schoenfeld1976 lines 729–733 and 1288–1294; the coefficients1.001093 and1.000081 and their stated domains. |
| Ramaré–Rumely, Theorem1 and table for modulus8 | RamareRumely1996 lines 1346–1349 and 1385; stated progression error and cutoff. |
| Platt, version1 abstract | Platt2013v1 lines 8–18; finite conductor/height verification, consumed as a theorem rather than an algorithm. |
| Bombieri1971, Proposition1 | Bombieri1971 OCR lines 50–78 identifies Selberg’s Hilbert-space inequality and Bessel argument; the displayed formula has poor OCR. The roadmap’s unweighted row-maximum corollary was independently checked by the Gram operator bound and BS20’s displayed version. |
| Bombieri1987, Théorème14 and following density discussion | Bombieri1987 lines 1184–1218; real/simple unique pair and effective density discussion, including the exceptional-zero convention. |

The required dependency check returned exactly:

```text
depcheck: 2 roadmaps, 14 edges, 0 problem(s)
```

No UPWARD or CYCLE line occurred. The outside-package diff command produced no output. The single `import Mathlib`, namespace and layer order are retained. No sorry-valued data, admitted example, `set_option`, `lemma` declaration, unrelated algorithm, pull-request number or process narrative was found in the two package documents. No forced headline was identified; S02 is an omitted easy milestone.

## Not verifiable

- No Lean elaboration or build was run: this pass expressly prohibits it. The prior repair’s successful build is recorded evidence from that report, not a build performed or independently reproduced here. Conclusions about types come from source inspection and pinned API reads.
- The ten README supplier gaps have no readable design registration and no certifiable current supplier section. They are not counted as declared design gaps under this job’s definition. The previous repair explicitly marked their external resolution not actionable; this pass respects that settlement without treating the mathematical inputs as already supplied.
- The package still lacks its required `sources.toml`. External legal provenance records were inspected, but they do not install the manifest into this package. This is the settled a-R18/b-R07 remainder.
- IwaniecKowalski2004, RosserSchoenfeld1962, Tenenbaum1995 and RahmanRoth are waived in the authoritative source record. Their primary text was not certified; where BS20 prints the used version, that version was checked. Mazur1978 remains uncertified and is cited by its published locator only. None was re-requested.
- Bombieri1971 is legally readable as a scan and its proposition locator is verified, but OCR does not reliably transcribe the fraction in its displayed inequality. The mathematical row-maximum target has the independent verification noted above; exact primary formula transcription is not claimed.
- There is no new unreadable, unwaived source to request. The no-build restriction also prevents certifying the proposed replacement examples as elaborated Lean proofs; their mathematical witnesses are explicit in S04–S05.
