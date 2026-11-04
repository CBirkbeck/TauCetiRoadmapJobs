<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1041#issuecomment-6393572343 -->
Review (codex) of cd26b10

Verdict: needs_changes

1. **F01** (P1) The equal-rotation-order argument lacks alternating containment

   **Location.** `packages/ArithmeticDynamicsPartII/README.md:892`, with its dependency list at line 894: “Equal orders require p²−1=q(q²−1): prove the quantitative large-q exclusion.”

   **Claim.** The inputs supplied by §§7.4 and 7.5a suffice for the equal-order branch of the independence argument.

   **Witness.** MP18 line 1408 uses Q_q containing the alternating group, and lines 1422–1438 compare its order and alternating sections. Section 7.4 supplies only primitivity; §7.5a supplies upper bounds, not alternating containment.

   **Exact repair.** Add a named Markoff-specific target after §7.4: for prime q≥5 with q≡1 modulo 4 and transitive Q_q, prove that Q_q contains the alternating group of Y*(q). Cite MP18 Theorem 1.3, p. 3, and its proof in §3, p. 9. Obtain a single q-cycle from the parabolic rotation, then consume the pinned `TauCeti.alternatingGroup_le_of_isPreprimitive_of_isCycle_mem`, `TauCeti/GroupTheory/Perm/Jordan.lean:154`. Its hypotheses are primitivity, a prime-length cycle of support q in the subgroup, and q+3≤#Y*(q). Add this declaration to the Tau Ceti contract and the new local target to §7.5's Needs. Do not reconstruct the general Jordan theorem. State the separate alternating-containment input used for Q₁₁ in the exceptional pair, or give another complete treatment of that pair, following MP18 line 1420.

   **Repair test.** On Y*(5), the first rotation has cycles of lengths 2,3,5. Its sixth power is a single 5-cycle; 5+3=8≤10=#Y*(5), so the pinned theorem supplies A₁₀≤Q₅ and the lower bound 10!/2=1,814,400. The exceptional equality is 11²−1=120=5(5²−1), with both rotation orders 30. At q=13 the rotation cycles have lengths 2,2,2,3,3,6,7,7,7,13, and 13+3=16≤52. Primitivity alone is insufficient: the primitive affine group AGL₁(𝔽₅) has order 20, whereas A₅ has order 60. This is a missing proof input, not a counterexample to squarefree transitivity.

2. **F02** (P1) The positive-origin example fails in coefficient one at 3

   **Location.** `packages/ArithmeticDynamicsPartII/README.md:459`: “The positive locus never lifts the affine origin, even though the full integral locus does.”

   **Claim.** Positive integral triples cannot reduce to the origin in either coefficient convention, including the prime 3 discussed in the same paragraph.

   **Witness.** The positive coefficient-one solution (3,3,3) satisfies 3²+3²+3²=27=3·3·3 and reduces to (0,0,0) modulo 3. The package itself records this twist at line 21.

   **Exact repair.** Restrict the never-origin assertion to coefficient three at every prime, and coefficient one at primes different from 3. Say explicitly that every positive coefficient-one integral solution reduces to the origin at 3, by the integral factor-three theorem imported from ClassicalArithmeticCompletion §4.108. The zero triple is a possible lift there, not the only kind of lift. Add the positive root as the negative-control Check.

   **Repair test.** The coefficient-three root reduces to (1,1,1) at 3; its coefficient-one twist reduces to (0,0,0) at 3 and to (3,3,3)≠0 at 5. Pairwise coprimality of the divided coefficient-three solution excludes simultaneous vanishing at every other prime.

3. **F03** (P2) The character-sum bound omits the original curve's boundary

   **Location.** `packages/ArithmeticDynamicsPartII/README.md:291`: “a rational function f on a geometrically connected smooth curve” and “deleting the s distinct geometric zeros and poles”.

   **Claim.** The bound (2g−2+s)√q applies to an arbitrary smooth curve, counting only the zeros and poles of f as punctures.

   **Witness.** On C=ℙ¹ over 𝔽₅ with 1 removed, take f=X. Then g=0, s=2, and the remaining character sum is χ(2)+χ(3)+χ(4)=−1. The claimed bound is 0.

   **Exact repair.** Preserve the general smooth-curve statement by taking its smooth projective completion C̄ and a finite Frobenius-stable geometric set S containing the entire boundary C̄∖C and the zeros and poles of f. Put s=#S and sum over (C̄∖S)(𝔽_q). Retain the geometrically nonsquare hypothesis. Equivalently state the complete-curve theorem first, with the general open-curve version and its full boundary explicitly included. Make this domain and boundary part of the Kummer-cover target and its Needs; add the punctured-line negative control.

   **Repair test.** For the witness S={0,1,∞}, the repaired inequality is 1≤√5. For the complete ℙ¹ example f=X, S={0,∞}, the sum is 0 and the bound is 0. For f=X(X−1) on ℙ¹, s=3 and the sum is −1, giving 1≤√5. The polynomial specialization remains valid. The supplier's smooth projective curve bound does not justify silently omitting an extra puncture.

4. **F04** (P3) The trivial-cover Check uses a nonexistent ramification component

   **Location.** `packages/ArithmeticDynamicsPartII/README.md:681`: “For H trivial the exterior epimorphism set has one element, ord(c)=d=deg=1”.

   **Claim.** The trivial cover instantiates the immediately preceding congruence, whose d and cotangent character exponent are constructed from a component of the reduced ramification divisor.

   **Witness.** C24 Definition 2.2.2, p. 324, line 956, indexes that divisor by nontrivial cyclic subgroups. For H=1 it is empty. Theorem 3.5.1, line 2298, requires a component of it.

   **Exact repair.** Replace this Check by the negative control: the identity elliptic cover has one exterior epimorphism but empty reduced ramification divisor, so that construction supplies neither a component degree d nor its marked cotangent exponent. Make the ramified/nonempty-component premise explicit where the congruence is applied. If an unramified analogue is wanted, define the full inverse image of the marked origin separately and prove its degree identity; it is not the reduced ramification divisor. Keep the general finite-group level stack and its unramified objects.

   **Repair test.** For the identity cover the reduced ramification degree is 0, whereas the full marked fibre has degree 1. The SL₂(𝔽₅) noncentral trace −2 example remains ramified, with e=10, d=1 and 120 dividing 24·40=960. This finding corrects the Check; the stated congruence with an actual ramification component is not refuted.

Four findings: two P1, one P2 and one P3; three blocking. The thirteen previous findings are repaired, as recorded below. These findings concern additional defects, not a reversal of a settled repair. The mathematical scope remains repairable and appropriate for this Part II.

## Verified sound

### Previous findings, checked before the new pass

All thirteen repairs were checked against the files, not merely against the repair report. None was marked not actionable. Quotes below are from the repaired README unless a deletion is being checked.

| Previous finding | Repaired passage or deletion | Status |
|---|---|---|
| F01 numerical threshold | §5.14, line 644: “the second order interval is empty at every such prime”; line 644 retains the universal rank bound without a numerical endpoint. `effective_connectivity` is absent from Suggested.lean. | Repaired; constants and quantifier order recomputed below. |
| F02 algorithms | §§5.11–5.12 and their search/certificate instructions are absent. Line 624: “The hypotheses are universal rank inequalities.” The 770 assertion is a mathematical finite-action target. | Repaired. |
| F03 admissible-cover ownership | Line 670: “specialize the connected-cover locus of InverseGaloisAndArithmeticFundamentalGroups §IG.5.4 to (g,n)=(1,1).” | Repaired; current supplier text resolved. R04 concerns a different Check. |
| F04 Babai ownership | Line 884: “apply PolynomialGaloisGroupsPartII §4.4”; the contract at line 75 names `babai_distinguishers`. | Repaired. R01 concerns a different input to the next theorem. |
| F05 supplier gap | `packages/ArithmeticDynamicsPartII/design/plan.json` has an empty top-level gaps list. Line 515 proves n/φ(n)≤τ(n) locally; the unsupported explicit endpoint is gone. | Repaired; no conditional gap. |
| F06 nonexistent supplier aliases | No CA.4, MD.* or FF.2 alias remains. Lines 331, 347, 377 and 920 cite actual local estimates or exact supplier sections. | Repaired; all supplier references re-resolved. |
| F07 locators | Line 249: “Proposition 5.3.3, p. 409”; line 670: “Theorem 2.5.2”; lines 685–687 identify Corollary 4.12.5 and Theorem 4.10.3. Library and ErdosProgressionPowers locators corrected. | Repaired. |
| F08 parabolic cage input | Line 307: “containment in the large orbit is recorded in EFLMT24, p. 4”. | Repaired; EFLMT24 line 141 read. |
| F09 native arithmetic/names | Lines 558 and 591 use `IsMaxDivReduced` and `ArithmeticFunction.cardFactors`; Suggested.lean lines 53, 56, 134, 137 use the corrected names and native Ω. | Repaired. |
| F10 generic Lean padding | The two primitive-group bounds are absent from Suggested.lean; they remain supporting README targets at line 882. | Repaired. |
| F11 oriented small primes | Line 764: “For every prime p”; `oriented_transitivity` has no p≥5 binder; line 772 tests p=2. | Repaired; four-point action recomputed. |
| F12 duplicated approximation equivalence | Line 411: “By ClassicalArithmeticCompletion §4.111 `markoffStrongApproximation_iff_orbit`”. | Repaired; route now uses the supplier. |
| F13 layer supplier lists | Layer dependencies at lines 385, 463, 784 and 930 include the scheme, stack, trace, classification and Babai inputs used there. | Repaired. |

### Scope, shape and acceptance signatures

Reviewed the complete 953-line README, 248-line Lean file, metadata and nine-entry source manifest. The base ArithmeticDynamics roadmap concerns iterated projective self-maps and does not plan this finite-field Markoff extension. ClassicalArithmeticCompletion retains ownership of the surfaces, moves, integer descent, twist, total point count and positive approximation predicate. No general admissible-cover or Babai theory is replanned. There is no good-primes-only replacement of a general target: small characteristics, coefficient-three at 3, arbitrary finite fields in the semisimple congruence and the actual primitive composite locus are explicit. R01 identifies the remaining missing proof input.

The README has the prescribed summary, ownership, conventions, contracts, build guide, eight layers, Examples and Dependencies, consumers and references. Definition/API/Checks blocks were read, including the general primitive socle and level-stack targets. Every such block has at least three Checks; R04 identifies a Check whose carrier does not exist. Compared the shape with `TauCetiRoadmap/DenseGraphLimits/README.md` and `Completed/AlgebraicCodingTheory/README.md`. No copied source passage, executable algorithm, `lemma`, `set_option`, sorry'd data, free condition field, or upward supplier citation was found. The sources are identified by legal cached copies or settled locator-only entries. No package source entry was changed.

The eighteen statable headline theorems are all present:

| README endpoint | Suggested.lean declaration |
|---|---|
| §1.4 invariant finite-set divisibility | `stable_card_dvd` |
| §2.4 exact rotation count | `rotation_orbit_count` |
| §3.5 characteristic-zero and logarithmic orbit bounds | `no_finite_orbit`, `orbit_log_lower_bound` |
| §§3.6–3.7 giant orbit and exceptional-prime estimate | `giant_orbit`, `sparse_exceptional_primes` |
| §§4.2–4.3 eventual connectivity and lifting | `eventual_connectivity`, `eventual_positive_lifting`, `prime_affine_lifting` |
| §§5.8, 5.10 domination and central-rank bound | `reduced_domination`, `central_rank_bound` |
| §§6.3–6.6 oriented congruences and transitivity | `semisimple_orbit_congruence`, `valuation_orbit_congruence`, `oriented_card_dvd`, `oriented_transitivity` |
| §§7.7–7.8 squarefree endpoints | `squarefree_transitivity`, `squarefree_positive_lifting`, `squarefree_integral_image` |

The module docstring names the two nonstatable geometric endpoints: connectedness of the absolute trace-minus-two level stack, and the general coarse-degree congruence. It identifies the missing level stack, rigidified compactification and coarse degree. The generic primitive bounds are supporting results; the all-prime assertion is explicitly a conjecture. The conditional explicit-range criteria have not been replaced by a fabricated numerical headline.

`lake env lean` on the package's Suggested.lean, from the pinned content checkout, exited 0 with exactly eighteen warnings, all “declaration uses `sorry`”. The file has the single `import Mathlib` and needs no Tau Ceti module to elaborate its signatures. A separate copy with `#check @name` for all 31 declarations also elaborated. All thirteen real-body definitions and eighteen theorem signatures were compared with the README; no section binder was lost and no type was changed. In particular ε precedes its uniform threshold, reduced domination chooses one m before every cutoff, the finite-field congruences retain Field/Fintype and the non-dihedral coordinates, and squarefree endpoints retain all local hypotheses.

A scratch copy tried `rfl`, `infer_instance`, and `simp` separately on each of the eighteen sorried theorems, retaining `sorry` only when all failed. It still emitted eighteen sorry warnings: none closed. Object searches and the pinned declarations below found no single-library-lemma proof of one of these headlines. No padding finding is raised. This is an elaboration and padding check, not a proof of the admitted mathematics.

### Source sample and proof inputs

There are fifteen seeded targets. Fourteen could be checked in legal cached text, including corrections needed to a printed source; §1.3's M25 locator is settled uncertified and was checked mathematically instead. No other author-flagged unverified text was found beyond the settled M25 and DM96 entries. The manifest's BGS24 entry is collateral version information, not a substitute for the explicitly cited BGS16 version.

| Sample | Locator read | Hypotheses, page and support |
|---|---|---|
| 1.3 Finite involution balance | M25 §2, equations (2.3)–(2.5), p. 625, locator-only | Text unavailable; direct reindexing proves 2Σf=#C, including empty sets and fixed points. |
| 2.2 Split/nonsplit sections | BGS16 lines 138–156, 267–300, §2, pp. 4–6; C24 lines 4232–4374, proof of Proposition 5.3.1, pp. 406–409 | The generic formula needs a≠0,±2 and κ≠0. Separate zero and repeated-root fibres are correctly included. The source's unqualified generic count must not be applied at a=0. |
| 2.4 Rotation count | C24 lines 4412–4427, Definition 5.3.4 and Proposition 5.3.5, p. 410 | Rational Φ and both residue-class formulas agree. The README's page interval contains the correct printed page. |
| 3.6 Giant orbit | BGS16 lines 44–49, Theorem 1, p. 2 | ε chosen before the prime threshold; complement bounded by p^ε. Coefficient transport excludes 3 when an equivalence is used. |
| 4.4 Conjecture | C24 lines 261–265, Conjecture 1.2.2, p. 307; M25 Conjecture 1.1, p. 624, locator-only | Correct conjectural status; coefficient-three p=3 is the eight-point graph, not an empty connected graph. |
| 5.2 Maximal divisors | EFLMT24 lines 296–308, Definition 3.1 and Theorem 3.2, p. 7 | Divisibility maximality and the sum of the two torus counts, including repeated common divisors, agree. |
| 5.6 Padding antichains | EFLMT24 lines 349–376, Theorem 3.5, pp. 8–9 | Least padding exponent, maximal image and injectivity agree; terminal cutoffs are separated. |
| 5.7 Reduced integers | EFLMT24 lines 539–601, Definition 3.11 and Lemmas 3.12–3.13, pp. 12–13 | All odd-prime pairs and absent odd primes are quantified; the integer-power comparison is equivalent to the logarithmic one. No inequality between the 2- and 3-exponents is invented. |
| 6.3 Generalized congruences | C24 lines 4534–4577, Theorem 5.4.4, pp. 413–414 | t≠2, semisimple versus prime-field unipotent cases, and at least two nonzero coordinates are retained. The package corrects the printed even-characteristic split/nonsplit error; its Dickson and normalizer refinements are explicit local targets. |
| 6.5 Oriented divisibility | C24 lines 4631–4634, Theorem 5.5.4, p. 415 | Prime-field coefficient-one locus; p=2 is a direct case and p=3 has no point instances. |
| 6.6 Oriented transitivity/moduli | C24 lines 4645–4665, Theorem 5.5.7, pp. 415–416; lines 4711–4712 | Finite-action statement includes every prime; geometric conclusion correctly separates the empty epimorphism loci at 2 and 3. |
| 7.1 Primitive squarefree locus | MP18 lines 118–123, §1, p. 3; C24 lines 4680–4687, Theorem 5.5.8(a), p. 417 | Nonzero in every prime factor, not merely globally nonzero. CRT is equivariant for the same word. |
| 7.3 MP condition | MP18 lines 90–103, Theorems 1.3–1.4, p. 3; C24 equation (5.8), line 4676 | q≡1 branch and inverse-paired root order ≥32√(p+1) agree. Squaring gives 1024(p+1), with no real-square-root convention ambiguity. |
| 7.4 Primitivity | MP18 lines 453–474, §3, p. 9; lines 488–549, Theorem 4.1 and Propositions 4.2–4.3, pp. 9–11, continued through p. 17 | The primitivity statement and homogeneous-coordinate/long-cycle route are supported. They do not themselves state the alternating containment subsequently needed; R01. |
| 7.8 Integral image | C24 lines 4688–4693, Theorem 5.5.8(b), p. 417 | The printed full-affine assertion is false. The package's origin-plus-primitive replacement is supported independently by §7.7 and ClassicalArithmeticCompletion §§4.101, 4.103, 4.108; the 65 counterexample verifies both the correction and the source error. |

Also read the repaired proof inputs: CZ13 Theorem 2 and Corollary 2, lines 123–160 (pp. 1929–1930); CKSZ14 §4, lines 286–348 and 440–493 (pp. 585–591), for coefficient-uniform elimination and prime-factor control; EFLMT24 Lemma 2.1, lines 173–187, the reducing-map proof at lines 387–406, and Theorem 4.2 at lines 974–1012; C24 Theorem 2.5.2, Theorem 3.5.1, the finite-group automorphism outputs, and §§5.2–5.5; MP18 Theorems 5.9–5.12 and Lemma 5.13, especially lines 1360–1438. The four-puncture correction and the two-to-one primitive-trace factor were checked as mathematics, not accepted because the source was cited.

### Computed adversarial pass

The 156 rows below distinguish evaluation from a proof of a universal or asymptotic theorem. “Consistent” means the computed instance passes; the source and proof-input audit supplies the general justification. No asymptotic threshold is inferred from small primes. All rows used from the previous review were re-evaluated here except the explicitly identified extension-field batch. The unchanged prior batch is supporting evidence only; the characteristic-two normalization was recomputed directly.

| Statement | Instances tried | Values computed on both sides | Result | Change |
|---|---|---|---|---|
| Conventions: equation and coefficient | Integral roots 111 and 333 | M: 1+1+1=3; X: 9+9+9=27; 111 fails X since 3≠1 | Separates coefficients | None |
| Conventions: twist and second move | 111→112, multiplied by 3 | 333 satisfies 27=27; 336 satisfies 54=54; 3·R₂(111)=336=R₂(333) | Correct direction and normalization | None |
| Twist exceptional characteristic | p=3 | M* has 8 points, X* has 0; multiplying all coordinates by 3 gives 000 | No equivalence at 3 | R02 for later example |
| Zero ring and zero triple | Zero ring; ℤ triple 000 | Equation 0=0; nonzero carrier has cardinality 0; origin fixed by every move | Nonzero arithmetic assertions exclude it | None |
| Ordinary definition `vietaMove` | Integral 111, i=2 and i=0 | R₂=112, R₂²=111; R₀=211; cyclic indices 2+1=0 and 2+2=1 in Fin 3 | Native cyclic convention correct | None |
| §0.1 permutation normalization | σ=(01), x=111, i=0 | σR₀σ⁻¹x=121=R₁x; σx=111 | Correct conjugation direction | None |
| §0.1 smaller/larger actions | Root at p=5; double sign change | V-root orbit has 40 points; signed root 322 lies on X since 9+4+4=17≡2=12 | Sign maps preserve surface; not inserted as defining Γ generators | None |
| `moveStep`, `gammaStep` | p=2, 011; swap(01) at 111 | R₁(011)=011, so labelled step true; swap fixes 111, giving a reversing fixed step | Needed for oriented small-prime action | None |
| §0.2 adjacency | p=2 | Neighbours of 111 are 011,101,110; Adj(011,011)=false while moveStep(011,011)=true | Loopless versus labelled relation separated | None |
| §0.2 origin exclusion | Add 000 to p=2 graph | Four nonzero vertices form 1 component; adding fixed origin gives 2 components | Wrong carrier detected | None |
| §0.3 reachability/orbit quotient | p=2 star; empty word | Reachable(011,011)=true by length 0; V-orbit size 4=component size 4 | Both directions tested | None |
| §0.4 finite graphs | p=2,3,5,7,13 | Vertex counts and root-orbit counts respectively 4=4,8=8,40=40,28=28,208=208 | Correct | None |
| §0.4 cube at 3 | M*, move R₂ | Eight sign triples; 111→11(−1), one sign changes | Not a singleton | None |
| §1.1 nonzero weight branch | ℚ, 111 | Three weights 1/3; sum 1=1 | Denominators 3≠0 | None |
| §1.1 singular weight branch | 𝔽₅, 012 | Weights 0,3,3; sum 6≡1; raw two quotients have denominator 0 | Specified extension essential | None |
| §1.1 carrier and unique zero | Two zero coordinates over a field | Equation z²=0 forces z=0; origin's naive total is 0≠1 | Excludes wrong all-zero model | None |
| §1.1 permutation covariance | Swap first two entries of 012 | At 102 weights 3,0,3, the same permutation of 0,3,3 | Correct | None |
| §1.2 total/complementarity | 012 over 𝔽₅ | R₀ gives 112, changed weight 0→1; R₁ gives 042, changed weights 3+3=1 | Correct at singular fibres | None |
| §1.2 fixed move | 622 over 𝔽₇, R₀ | Equation 44≡2=72; R₀ changes 6 to 12−6=6; weight 6/12=4, so 4+4=1 | Fixed-point complementarity correct | None |
| §1.3 involution balance | Empty set; singleton fixed point; swapped pair over ℚ | Sums 0=0/2, 1/2=1/2, a+(1−a)=1=2/2 | Fixed points allowed | None |
| §1.4 stable-set divisibility | Empty S; full components at p=2,3,5,7 | 0 divisible by p; 2 divides 4, 3 does not divide 8, 5 divides 40, 7 divides 28 | p≠3 essential | None |
| §1.4 field summation | Full p=5 component | #S=40≡0; (3/2)#S=0; 2·0=0 | Complementarity proof consistent | None |
| §2.1 rotation/matrix | X root 333 | Matrix sends (3,3) to (3,6); new triple 336 has 54=54 | Matches `markoffRotation` | None |
| §2.1 repeated root | a=2 at p=5 | Eigenvalue order 1, matrix order 5; at a=−2 order 10 | Eigenvalue order alone wrong | None |
| §2.1 zero trace | p=5, a=0 | Matrix square is −I, fourth power I; order 4≠2 | Correct | None |
| §2.2 κ and split parametrization | p=11, a=3, λ=9, t=1 | κ=4; b=5,c=7; 9+25+49≡6=3·5·7; λ+λ⁻¹=9+5=3 | One concrete split point; rotation multiplies t by λ | None |
| §2.2 nonsplit/degenerate sizes | p=5, a=1,0,2,−2 | Slice sizes 6,8,10,10; claimed p+1,2(p−1),2p,2p give the same | Correct | None |
| §2.2 empty slices | p=7, a=0,2,−2; a=1 | Sizes 0,0,0 and 6=p−1 | Correct | None |
| §2.2 periods | p=5, a=1,0,2,−2 | Periods 6,4,5,10; exceptional fibres not given generic p±1 sizes | Correct | None |
| §2.3 total counts/nonemptiness | p=3,5,7,13 | 0=3(3−3),40=5(5+3),28=7(7−3),208=13(13+3) | Supplier specialization correct | None |
| `divisorPhi`, zero/unit/prime | n=0,1,2,4,6 | Φ=0,1,3/2,2,5/2; Φ(2)=2−1/2 | Totalized zero is empty sum, no denominator zero | None |
| §2.4 rotation orbit formula | p=3,5,7,11,13 | Enumerated counts/formula: 0=0,8=8,5=5,14=14,26=26 | Both residue classes | None |
| §2.4 additional formula cases | p=17,19,23,29,31,37 | 37=37,34=34,41=41,86=86,69=69,96=96 | Correct | None |
| §3.0 complete-curve quadratic sum | f=X and X(X−1), p=5 | 0≤0 and absolute −1=1≤√5 | Correct on complete base | None |
| §3.0 nonsquare necessity | f=X², p=5 | Sum 4; the bound with s=2 would be 0 | Geometrically square case excluded | None |
| §3.0 arbitrary smooth base | ℙ¹ minus 1, f=X, p=5 | Sum −1, absolute 1>0; repaired boundary bound √5 | False as written | R03 |
| §3.0 gcd/torus bound | x+y=1 in μ₄² over 𝔽₅ | 3 points; χ=1; bound max(3·32^(1/3),192/5)≈max(9.524,38.4) | Correct inequality | None |
| §3.0 independence/translated torus exclusion | x=y, μ₄² | 4 points, functions multiplicatively dependent with x/y=1 | Excluded wrong model | None |
| §3.0 low-order arithmetic | Degree 1 line x+y=1, p=5; T=2 | 0 points with order sum <2; budget 11·1³+1=12; all torus points count 3≤12 | Finite consistency only | None |
| §3.0 exceptional-prime quantifiers | Symbolic T=z^(δ/(2A)), A,C>0 | C·T^A=C·z^(δ/2)≤z^δ once z≥C^(2/δ) | Uniform coefficient obstruction supplies stated count | None |
| §3.1 cage definition | p=13, zero trace; p=7 parabolics | Zero trace order 4<12,14; parabolic slices at 7 have cardinality 0 | Both wrong membership rules excluded | None |
| §3.1 cage sign stability | p=5 full orbit | Sign translates of full 40-point orbit give same 40 points; complement 0 | Consistent with uniqueness route | None |
| §3.2 slice intersection | p=5, (a,b)=(1,1),(1,2),(2,1) | Discriminants 3,4,4; counts 0,2,2=1+χ(D) | Nonsquare/square cases | None |
| §3.2 zero discriminant | p=13, a=b=0 (boundary check only) | D=0, equation c²=0 has one solution; nonzero-surface removal leaves 0 | Nonexceptional hypothesis essential before using count on X* | None |
| §3.3 primitive trace factor | 𝔽₇ split torus | Primitive λ=3,5 both give trace 1; two eigenvalues give one trace | Factor 1/2 correct | None |
| §3.3 generic cover exclusion | p=5,a=1 | κ=3≠1 and κ≠0; generic curve hypotheses hold | Correct | None |
| §3.3 long-cycle premise | p=5,δ=1/4, L=6 | p^(3/4)≈3.344<6; orbit lies in sole 40-point Γ orbit | Consistent, not a threshold proof | None |
| §3.4 order growth bookkeeping | Upper middle exponent 1/2+δ | Summed cubic term/L scales as p^(−ε/3+o(1)); linear term/L≤p^(−1/2+δ+o(1)) | Both decrease for fixed ε>0 and δ<1/2 | None |
| §3.4 excluded small order | a=0,p=13 | Order 4; cannot be inferred to meet a large p^ε premise for arbitrary ε | Degenerate adapter necessary and present | None |
| §3.5 characteristic-zero obstruction | Real cube, 222 and 000 | 222: product 8≤(2/3)·12=8, but Markoff equality needs 12=8; 000:0=0 | Only zero survives equality and bound | None |
| §3.5 `no_finite_orbit` | Empty S; singleton X root 333 | Empty S is conclusion; singleton fails stability since rotation gives 336≠333 | No arbitrary-set/vacuous hypothesis | None |
| §3.5 norm constants | Three eigenvalue traces in [−2,2] | Sum of squares ≤12; product absolute ≤8; relation absolute ≤20; N≤L³ | Gives p≤20^(L³), hence L≥(log p/log20)^(1/3) | None |
| §3.5 logarithmic lower bound | p=5 and all primes through 37 | Orbit 40≥0.813 at 5 for c=(log20)^(−1/3); every enumerated orbit exceeds its corresponding bound | Consistent | None |
| §3.6 giant orbit | p=5,7,11,13,17,19,23,29,31,37; ε=1/2 | Complements all 0≤√p; orbit counts 1 | Consistent | None |
| §3.6 uniqueness | p=5, #X*=40 | Existing orbit 40>20; two disjoint orbits >20 would total >40 | Counting implication correct | None |
| §3.7 sparse exceptions | t=37, ε=1/2 | Disconnected-prime count 0≤√37≈6.083, including connected M* at 3 | Consistent; empty-X convention agrees | None |
| §4.0 affine approximation definition | A¹, modulus 5 | Residues 0–4 have lifts 0–4; image size 5=target size 5 | Surjectivity carrier correct | None |
| §4.0 failure example | x²+1=0, modulus 5 | Residue solutions 2,3: squares+1≡0; integer solution count 0 | Genuine negative control | None |
| §4.0 integral-isomorphism transport | M→X twist at n=5; n=3 | Multiplication by 3 permutes 5 residues, inverse 2; at 3 image size 1<3 | Integral-isomorphism premise not replaced by rational one | None |
| §4.1 symmetric root bridge | p=2,3,5,7,13 | Γ-root and V-root sizes both 4,8,40,28,208; permutations fix root exactly | Correct; approximation iff imported | None |
| §4.2 complement divisibility | p=5, complement cardinal k<5 with 5 dividing k | Only k=0 among 0,1,2,3,4 | Strict inequality essential | None |
| §4.2 eventual connectivity/lifting | Enumerated primes through 37 | Root-reachable count equals M* count at every prime; integral R₂ sends111→112 with positive coordinates | Consistent; global threshold from cited theorems | None |
| §4.3 full-affine lifting | p=2,c=1; p=3,c=1 | X residue 011 lifted by 633 since 36+9+9=54=6·3·3; X(𝔽₃)={000} lifted by000 and333 | Correct theorem | None |
| §4.4 conjectural proposition | p=2 and3 | Connected nonzero graph counts 4 and8; positive root-orbits 4 and8 | No asserted universal proof | None |
| Layer4 example | p=3,c=1,positive333 | Residue000; equation27=27 | Refutes universal never-origin claim | R02 |
| §5.1 cubic boundary and degrees | F=αX²Y+βYZ²−XY²−XZ² | div(x)=B+C−A−D, div(y)=A+C−B−D: each degree2; four distinct boundary points, g1, χ4 | Corrected source constant | None |
| §5.1 nonsingularity | α,β≠0, αβ≠1, p>3 | At A,B,C,D gradients contain α,−1,(−1,β),−α respectively; torus singularity forces αβ=1 | Wrong singular model excluded | None |
| §5.1 subgroup bound | Degrees2t,2d, χ4 | 2·(2t)(2d)·4=32td; 12·(2t)(2d)/p=48td/p; half pair bound gives (3/2)max((32td)^(1/3),16td/p) | Constants correct | None |
| `maximalDivisors`/§5.2 | n12, cutoffs0,1,3,6,12 | ∅,{1},{2,3},{4,6},{12}; numerical-maximum-only model misses4 at cutoff6 | Correct definition | None |
| §5.2 antichain and extension API | n12,x6 | 4 does not divide6 and6 does not divide4; 1,2,3 extend to4 or6 | Both API conclusions | None |
| §5.2 upper/lower cutoff and unit | n1; n0 totalized | M₀(1)=∅, M₁(1)={1}; D(0)=∅, so M_x(0)=∅ | Positive-n hypothesis needed for singleton endpoint | None |
| §5.2 multiplicity convention | p5,d1 | #M₁(4)+#M₁(6)=1+1=2; union would have size1 | Correct sum, not union | None |
| §5.3 free signs | Odd p, fixed nonidentity sign change | Two equations 2x=2y=0 force x=y=0, then z²=0; nonzero fixed-point count0 | Four-element free orbits | None |
| §5.3 signed complement | p5 and7 full cage orbit | Complement0; 20 divides0 and28 divides0 | Consistent; explicit sign-invariance hypothesis retained | None |
| §5.4 two algebraic obstruction branches | d≤(3/2)M max((32d²)^(1/3),16d²/p) | Cubing first: d≤108M³; second: p≤24Md, or d≥p/(24M) | Correct weak boundaries | None |
| §5.4 denominators | p5,d1 | M=2>0; φ4=2>0 andφ6=2>0; p/(24M)=5/48 | No zero denominator | None |
| §5.4 n/φ(n)≤τ(n) | n1,2,12; n0 excluded | 1=1;2=2;3≤6; at0 quotient totalizes0/0=0 but positivity false | Local elementary proof valid | None |
| §5.5 identity/composition | D1; q^i→3^i with q5,a2,i1 | All unit ratios1; nonterminal ratio3/5 equals least-prime ratio3/5; composing with identity unchanged | Correct | None |
| §5.5 reducing-map order direction | D3→D5,3↦5 | Required5≤3 is false | Wrong direction excluded | None |
| §5.5 coprime-product terminal case | Quotients (1,1),(3,5) | Product ratio3/5; true λ ratio3/5; ratio of separate minima1 | Repaired proof avoids false equality | None |
| §5.5 2-power condition | Odd q-powers to 3-powers | Ratio3^(i−j) is a power of2 iff i=j, then q^(i−j)=1 | Injectivity modulo powers2 retained | None |
| §5.6 padding domination | n5→m3,least a1, padded6 | At x3: sizes1≤2, image1→2; x5:sizes1≤2, image5→3; x0:0=0; x≥6:1=1 | Image is maximal and injective | None |
| §5.7 `IsMaxDivReduced` | n0,1,3,27 | False,true,true,false; n27 requires9<5, false | Unit and failure controls | None |
| §5.7 two-exponent cutoff | n=2^a·3 | a7:128<200 true; a8:256<200 false | Exact strict boundary | None |
| §5.7 odd support/API | n3 and adjoining5 to obtain15 | Exponents (1,0)→(1,1); first absent prime changes5→7, bounds8·25→8·49 | Both reduced; no a₂≤a₁ requirement | None |
| §5.8 reduced domination | n2,5,27,40 | Witnesses m2,6,30,45; intervals [2,2],[5,14],[27,102],[40,154] | Correct; one m for all cutoffs | None |
| §5.8 exhaustive small cutoffs | Every n2…40, all divisor-transition cutoffs | 39 witnesses found, 0 cutoff failures; counts constant between consecutive integer divisors | Tests every real cutoff in those cases | None |
| `divisorRank`/§5.9 polynomial | n12 | Coefficients1,2,2,1; sum6=τ12; rank reversal1↔1,2↔2 | Correct multiplicities | None |
| §5.9 unit/out-of-range ranks | n1 and n8 | Ω1=0,C₀1=1,C₁1=0; n8 coefficients1,1,1,1 and C₄8=0 | No junk-index symmetry claim | None |
| §5.9 squarefree distinction | n6 versus8 | n6 ranks1,2,1=binomial row2; n8 C₁=1≠binom(3,1)=3 | Hypothesis necessary | None |
| §5.10 central and interval bounds | n12,x6,[r,s]=[2,2] | #M=2=C₂; central C₁=2; normalized16≤18 | Correct | None |
| §5.10 boundary cutoffs | n1,x0 and1; n4 central | 0≤1,1≤1; n4 normalized1·4≤3·2 | All-real headline agrees | None |
| §5.10 additional enumeration | n1…100, all divisor cutoffs | 100 normalized comparisons, 0 failures; all maximal-antichain comparisons pass | Correct on tested range | None |
| §5.13 representative interval | p5 | 4≤n₋≤10,6≤n₊≤18; both in[4,18]; cutoff10 can exclude n₊=18 | 4p−2 retained | None |
| §5.13 obstruction constant | M≤2C | 108·2³=864;1458·2⁸=373248;4·373248=1492992 | Repaired constants correct | None |
| §5.13 strict versus weak guard | p<373248C⁸,n+2≤4p | n+2<1492992C⁸ contradicts n+2≥1492992C⁸, including equality | Correct contradiction | None |
| §5.14 eventual rank bound | C≤τ≤n^(1/16), n=1492992² | n=2229025112064;1492992√n=n≤n+2 | Uniform symbolic threshold correct | None |
| §5.14 second interval | p+1≤2p, p≥2 | 384¹⁶(p+1)³≤8·384¹⁶p³<p⁸ if p⁵>8·384¹⁶ | Correct sufficient inequality | None |
| §6.0 exterior epimorphisms/level structure | H=1; proper-image representation to C₂ | Exterior epimorphism count to1 is1; trivial homomorphism toC₂ has image size1<2 and is excluded | Marked actual group, not an arbitrary representation | None |
| §6.0 connected admissible specialization | (g,n)=(1,1) | Stability integer2g−2+n=1>0; unrigidified trivial-cover center has order1 | Supplier's stable range applies | None |
| §6.0 ramification component Check | Identity cover,H1 | Reduced ramification degree0; full marked fibre degree1; no component d | False Check | R04 |
| §6.0 coarse congruence ramified example | H=SL₂(𝔽₅),trace−2 | e10,d1,m dividing24,component degree40;120 divides960 | Correct | None |
| §6.0 even-characteristic centralizer | SL₂(𝔽₄),nonsplit order5 | Center size1,centralizer5,torus quotient5/5=1;5 does not divideq−1=3 | Split-only model fails | None |
| §6.0 general valuation congruence | SL₂(𝔽₅),ℓ5,c order10,j0 | #H120,r1,s0; proper normal subgroup sizes1,2 contain no5; exponentceil(1/2)=1;5 divides40 | Nontrivial instance | None |
| §6.0 trivial finite-group valuation case | H1,ℓ3,c1,j0 | r=s=0;exponent0;3⁰=1 dividesdegree1 | Unramified valuation statement can be trivial without inventing ramification component | None |
| §6.1 Fricke normalization | A=[[1,1],[0,1]],B=[[1,0],[1,1]] | Traces2,2,3;4+4+9−12−2=3=trace commutator | Supplier and local conventions agree | None |
| §6.1 excluded reducible pair | A=B=I | Traces2,2,2;12−8−2=2 | t≠2 excludes it | None |
| §6.1 non-dihedral condition | 𝔽₇,diag(2,4),[[0,6],[1,0]] | Triple6,0,0;trace36−2≡6≠2; nonzero-coordinate count1<2 | Irreducible alone insufficient | None |
| `orientedStep` and inverse action convention | p2,root111 | A transposition fixes111; following R₀ reaches011 in two reversing steps | Even words reach leaf, not a bipartition obstruction | None |
| §6.1 index and fixed point | p5,swap fixes333 | Γ-orbit40; hypothetical two Γ⁺-orbits20+20 would be exchanged, incompatible with fixed333 | Correct index-two argument | None |
| `traceOrder`/§6.2 Jordan distinction | p5,t=−2;scalar−I | Companion order10, scalar order2; both trace3 | Noncentral condition necessary | None |
| §6.2 split/nonsplit polynomial | 𝔽₄,a²=a+1 | T²+aT+1 at0,1,a,a² gives1,a,1,a; no root; companion order5 dividesq+1=5 | Discriminant a² is square but splitting false | None |
| §6.2 repeated characteristic-two root | 𝔽₄,t0 | Companion squareI but companion≠I;order2 | Correct | None |
| §6.3 odd semisimple modulus | q5,t1 | n6,m6;6/gcd(6,4)=3; orbit size36;3 divides36 | Correct | None |
| §6.3 another torus | q7,t3 | n8,m8;8/gcd(8,4)=2; orbit64;2 divides64 | Correct | None |
| §6.3 multiple oriented orbits | q11,t4 | n10,m10;modulus5;orbit sizes40,60;both divisible5 | Not silently assuming transitivity | None |
| §6.3 empty non-dihedral locus | q5,t4 | Non-dihedral point count0, orbit count0 | Statement has no chosen-point instance | None |
| §6.3 prime-field batch | q3,5,7,11,13;every t≠±2 | 32 non-dihedral orbits tested,0 modulus failures; atq13,t3,modulus7 divides196 | Correct on tested range | None |
| §6.3 even nonsplit modulus | q4,n5,m5 | 5/gcd(5,1)=5; both nonzero semisimple traces in 𝔽₄ give one non-dihedral orbit of size10, divisible5 | Characteristic-two formula retained | None |
| §§6.3–6.4 unchanged prior extension-field batch | q3,4,5,7,8,9,11,13,16,17,19,25;oddℓ through17 | Previous numerical table:136 non-dihedral orbits,0 congruence failures,largest indicated modulus17 atq16 | Inherited computed evidence, not a newly claimed run | None |
| §6.4 valuation subtraction | q5,n6,ℓ3 | v₃(120)=1,r1,s0;3^(1−0)=3 divides36 | Natural subtraction is nonnegative | None |
| §6.4 weaker exponent | q11,n4,ℓ3 | r0,s1;truncatedr−s=0;3⁰=1 divides128 and16 | Junk subtraction controlled | None |
| §6.4 ambient group order | q13,n14,ℓ7 | q³−q=2184,v₇=1,r1,s0;7 divides196 | Correct | None |
| §6.5 `oriented_card_dvd` | p2,3,5,7,11,13 | Oriented point/orbit sizes4,0,40,28,88,208;2 divides4;at3 no point;remaining p divide sizes | Correct | None |
| §6.6 `oriented_transitivity` | p2,3,5 | One orbit size4;empty universally quantified relation;one orbit size40 | All-prime finite statement correct | None |
| §6.6 geometric endpoint | p3 epimorphism locus; p5 | At3 locus empty,so connectedness not claimed;at5 trace orbit40 gives1 component | No empty-carrier stand-in | None |
| §7.1 `primitivePoint`/CRT | n5 and65 | At5 primitive40=X*40;at65 primitive40·208=8320 | Correct local nonzero definition | None |
| §7.1 mixed countermodel | X point555555 modulo65 | Equation residual0;local triple000 at5 and333 at13;global triple nonzero | Global nonzero does not imply primitive | None |
| §7.1 root and diagonal word | n65,root333 | Local roots333 at5 and13;both nonzero; root V-orbit has8320 points | Same word action, not assumed product action | None |
| §7.1 junk modulus | n1; n0 | n1 prime-divisor quantifier empty,primitive predicate true on sole triple; n0 origin fails atp2 | n>1 squarefree headline excludes junk cases | None |
| §7.2 sign blocks/cardinality | p5,7 | #X*40,28;dividing by4 gives10,7 blocks | Correct | None |
| §7.2 free sign quotient | p5 root333; p2 root111 | Four signed points333,322,232,223 at5;all four signs coincide at2 | Odd characteristic essential | None |
| §7.2 action versus orbit quotient | p5 | Sign block size4,Γ-orbit size40,Y* size10 | Distinct quotients not identified | None |
| `mpCondition`/§7.3 branches | p5,13,7 | First residues1,1 give true;at7 order≤8,square≤64<1024·8=8192 | Correct exact squared condition | None |
| §7.3 inverse roots | p11 | Roots5,9,product45≡1;orders5 and5 | Choice independent | None |
| §7.3 characteristic-two/junk domain | p2,p3 | p2 has neither residue1 nor3,so false;p3 polynomial root order4,16<4096 | Endpoint requires p≥5 | None |
| §7.4 primitivity parabolic mechanism | p5 | Rotation cycles2,3,5;isolated 5-cycle under sixth power;degree10 | Source primitivity mechanism represented | R01 for additional alternating target |
| §7.4 order branch | p7 | MP false from64<8192;therefore theorem does not assert its hypothesis | No misuse of small prime | None |
| §7.5a socle transitivity | Natural S₃ action;AGL₁(𝔽₅) | SocleC₃ order3 transitive degree3;affine socleC₅ order5 regular degree5 | Nonabelian group need not have nonabelian socle | None |
| §7.5a regular-centralizer alternatives | Regular S₃ in S₆ | Left and right regular actions each order6;intersection has size#Z(S₃)=1;centralizer of either has size6 | Distinguishes left/right; not asserted primitive | None |
| §7.5a characteristic-simple/product case | A₅ natural;A₅×A₅ left-right action on A₅ | Unique socleA₅ order60;two-factor group order3600, each factor regular degree60, intersection1 | Nonabelian alternatives have actual models | None |
| §7.5a small-index conclusion | A₅ versusC₂ | No nontrivial homA₅→S₃ (60>6,simplicity);index2/3 impossible;C₂ trivial subgroup hasindex2 | Nonabelian hypothesis essential | None |
| §7.5a p7 affine exclusion | Y*(7), first rotation | Cycle lengths3,4;ρ⁴ fixes4 and moves3;nonidentity affine prime-degree map fixes≤1 | Correct repaired exceptional case | None |
| §7.5a base/order estimate | Regular C₅,n5 | Base size1<4√5 log5≈14.40;order5<exp(4√5(log5)²)≈1.15·10¹⁰ | Bound consistent; Babai supplied | None |
| §7.5a two-transitive section bound | n=2¹⁶; affine group with elementary abelian kernel and cyclic multiplicative quotient | No nonabelian alternating section;6logn≈66.542;trivialA₂ section hask2<66.542 | Threshold and quotient-of-subgroup meaning respected | None |
| §7.5 equal-order branch | p11,q5 | 120=5·24;rotationorder30=30;A₁₀ hasorder1814400 | Required alternating lower bound absent | R01 |
| §7.5 different-order branch | p13,p5 | Rotation orders546 and30;546 notdividing30,30 notdividing546 | A power killing one rotation can remain nontrivial in the other | None |
| §7.5 group-order structure at5,7 | Degrees10 and7 | 10 not a prime power;7=7¹ is a prime power | p7 must use fixed points, not blanket numerical assertion | None |
| §7.6 solvable sign quotient | One four-point factor | #S₄=24=2³·3;composition factorsC₂,C₂,C₃,C₂;A₅ order60 containsprime5 | Nonabelian simple factors cannot be killed by that quotient | None |
| §7.6 auxiliary product size | n770 | 2·5·7·11=770;4·40·28·88=394240 | Cardinality checked; transitivity source-only | None |
| §7.6 elliptic-coordinate estimate | p127>121 | (127−11√127)/4≈0.759>0;atp121 expression0 | Strict threshold correct | None |
| §7.7 `squarefree_transitivity` | n65 | M primitive8320;single V-root orbit8320;local factors40,208 | Actual diagonal action enumerated | None |
| §7.7 `squarefree_positive_lifting` | n65,roots111 and333,second moves112 and336 | Integral equalities3=3,27=27,6=6,54=54;all coordinates positive;reductionsprimitive | Both coefficient conventions | None |
| §7.8 necessary image inclusion | n65,mixed M404040 andX555555 | Residuals0;bothzeroat5 andnonzeroat13;divided integral coprimality would require gcd 1,whereas all coordinates would be divisible by 5 | Mixed points have no integral lift | None |
| §7.8 sufficient image inclusion | n65 | Positive root-word image8320;adjoining origin gives8321;predicted1+8320=8321 | Both sides agree | None |
| §7.8 affine-image failure count | n65 | Fullsurface41·209=8569;image8321;difference248=40+208 | Matches both mixed patterns | None |

### Pinned library audit by object

Pins were read from `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following declaration bodies/signatures were opened at those pins. Paths below are relative to the named library repository. Native carriers were not credited with properties absent from their definitions.

| Declaration/object | File and line at the pin | What was actually checked |
|---|---|---|
| `Equiv.Perm` | `Mathlib/Logic/Equiv/Defs.lean:94` | Equivalence of a type with itself; no finite or faithful-action hypothesis supplied. |
| `Subgroup.closure` | `Mathlib/Algebra/Group/Subgroup/Lattice.lean:329` | Intersection of subgroups containing the set; not an extra Markoff construction. |
| `MulAction.orbit` | `Mathlib/GroupTheory/GroupAction/Defs.lean:49` | Range of the orbit map; no transitivity assertion. |
| `SimpleGraph` | `Mathlib/Combinatorics/SimpleGraph/Basic.lean:93` | Symmetric, loopless relation. |
| `SimpleGraph.Reachable`, `ConnectedComponent` | `Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.lean:51`, line 389 | A nonempty walk type permits a zero-length walk; components use its equivalence relation. |
| `Relation.ReflTransGen`, `Relation.EqvGen.setoid` | `Mathlib/Logic/Relation.lean:387`, line 844 | Reflexive/transitive relation and generated equivalence; no preservation of a surface without polynomial invariance. |
| `ZMod` | `Mathlib/Data/ZMod/Defs.lean:138` | Modulus zero is ℤ; positive modulus uses Fin. |
| `ZMod.castHom`, `natCast_eq_zero_iff`, `chineseRemainder` | `Mathlib/Data/ZMod/Basic.lean:331`, lines 519, 889 | Divisibility for reduction, characteristic for cast equality, coprimality for CRT. |
| `orderOf`, `Function.minimalPeriod` | `Mathlib/GroupTheory/OrderOfElement.lean:181`; `Mathlib/Dynamics/PeriodicPts/Defs.lean:245` | Order as a multiplication period; zero for no positive period. Companion matrices in finite fields have determinant 1 and positive finite order. |
| `Nat.divisors`, `Nat.factorization` | `Mathlib/NumberTheory/Divisors.lean:52`; `Mathlib/Data/Nat/Factorization/Defs.lean:50` | Empty divisors at zero; multiplicities in prime factorization. |
| `Nat.totient`, `totient_eq_prod_factorization` | `Mathlib/Data/Nat/Totient.lean:37`, line 286 | Native totient; product formula requires nonzero argument. |
| `Nat.minFac` | `Mathlib/Data/Nat/Prime/Defs.lean:218`, line 226 | minFac(1)=1, relevant to terminal reducing quotients. |
| `Nat.card_divisors`, `ArithmeticFunction.cardFactors`, `cardFactors_eq_sum_factorization` | `Mathlib/NumberTheory/ArithmeticFunction/Misc.lean:222`, lines 258, 318 | Nonzero divisor-product formula and native Ω with multiplicities; no replacement bigOmega is needed. |
| `MulAction.IsBlock`, `IsPreprimitive`, `isQuasiPreprimitive` | `Mathlib/GroupTheory/GroupAction/Blocks.lean:171`; `Mathlib/GroupTheory/GroupAction/Primitive.lean:91`, line 287 | Preprimitivity includes pretransitivity, not nonemptiness. Nontrivial normal-subgroup transitivity needs faithfulness/nontrivial action as stated. |
| `Fintype.sum_equiv` | `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:741` | Generated additive finite-sum transport; line 739 cited by the README is in its attribute block. No complementarity or half-cardinality identity is built in. |
| `RingOfIntegers.dvd_norm` | `Mathlib/NumberTheory/NumberField/Norm.lean:76` | Finite Galois setting; applied to cyclotomic extensions. |
| `Algebra.norm_eq_prod_embeddings` | `Mathlib/RingTheory/Norm/Transitivity.lean:261` | Finite separable extension and algebraically closed target. |
| `Algebra.norm_ne_zero_iff` | `Mathlib/RingTheory/Norm/Basic.lean:110` | Domains and finite free extension. |
| `IsCyclotomicExtension.finrank` | `Mathlib/NumberTheory/Cyclotomic/PrimitiveRoots.lean:177` | Cyclotomic irreducibility hypothesis retained over ℚ. |
| `Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two` | `TauCeti/LinearAlgebra/Matrix/Trace/FinTwo.lean:127` | All commutative rings; ABA⁻¹B⁻¹; final −2. The README does not re-own it. |
| `MulAction.IsBlock.of_le`, `MulAction.IsPreprimitive.of_le` | `TauCeti/GroupTheory/GroupAction/Primitive.lean:54`, line 59 | Transport along subgroup inclusion, not socle classification. |
| `TauCeti.MulAction.fixedPoints_stabilizer_eq_singleton` | `TauCeti/GroupTheory/GroupAction/Primitive.lean:71` | Faithful preprimitive nontrivial action and nontrivial stabilizer. |
| `TauCeti.AffineGroup.isPreprimitive`, `natCard_range_toPermHom` | `TauCeti/GroupTheory/SpecificGroups/Affine/Primitive.lean:84`, line 89 | Division-ring affine action; finite image order q(q−1). |
| `TauCeti.alternatingGroup_le_of_isPreprimitive_of_isCycle_mem` | `TauCeti/GroupTheory/Perm/Jordan.lean:154` | The exact general Jordan input available for R01, including the support-size and three-fixed-point bound. |

Searches used Markoff equations/moves and trace objects, finite involution sums, multiplicity counts, maximal divisor antichains, primitive socles, simple sections, and alternating containment, not just the proposed names. No existing pinned Markoff headline or maximal-divisor antichain theorem was found that would turn a kept headline into a one-lemma restatement. Native permutations, graph connectivity, divisors, Ω, primitive actions, trace identities and Jordan theory are explicitly distinguished from the new applications. The namespace search returned no match on main or in any open roadmap pull request. No fully qualified declaration name of another readable roadmap is reused by Suggested.lean.

### Exact supplier resolutions and ownership

Used `roadmaps grep`, `roadmaps show` and `roadmaps resolve`, alongside local main and board searches. The provided twenty-entry board-package index was read before making ownership conclusions. The tool's citation scan found no unresolved roadmap names; it did not replace the manual library audit above. Existing-roadmap revisions were not treated as new dependencies. The citations actually consumed resolve as follows; line numbers are in the named README, without the display header added by `roadmaps show`.

| Supplier and readable version | Resolved locations | Contract comparison |
|---|---|---|
| ClassicalArithmeticCompletion, main | `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:7670` (§4.3), 8293 (§4.23), 8723 (§4.38), 8870/8889/8908 (§§4.42–4.44), 9217/9268/9393 (§§4.57–4.58,4.62) | Surfaces, polynomial moves, preservation, permutation conjugation, larger sign action and nonzero restriction match. The larger action does not silently enlarge Γ. |
| Same | `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:9772` (§4.76), 10204 (§4.92), 10434 (§4.101), 10481 (§4.103), 10551 (§4.106), 10617 (§4.108), 10708 (§4.111; named equivalence at 10718) | Exact point count, root generation, pairwise coprimality, two integral orbits, reduction and factor-three exception are supplied. The positive-root equivalence is cited, not planned twice. |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:487`, 529 (§§0.1–0.2); 2745,2817,2951,3021 (§§1.18–1.19,1.21,1.23) | Relative spectra, stack carriers, quotients and coarse spaces. Arbitrary base change is not supplied by the coarse-space theorem. |
| Same | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4647`, 4671,4713 (§§3.1–3.3), 5725 (§4.15), 7129,7175,7273 (§§5.9–5.11) | Genus/degree, stable marked curves, intersections and smooth projective curve bounds. R03 needs the projective completion's entire boundary. |
| InverseGaloisAndArithmeticFundamentalGroups, supplied open head | `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:2641` (§IG.3.2), 2742 (exterior epimorphisms); 5586 (§IG.5.4), 5588 (general genus), 5655 (admissible stacks) | Surjections modulo inner conjugacy, right precomposition/inverse left action, connected balanced admissible covers and vertical center. The stable (1,1) specialization exists. Center rigidification and its elliptic degree comparison remain local work. |
| ArithmeticGaloisRepresentations, supplied open head | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:2923`, §4.4 | Dickson classification includes characteristic two and subfield images. The particular center/normalizer refinements are explicitly local, not falsely attributed to the supplier. |
| WeilConjectures, open head used by the resolver | `TauCetiRoadmap/WeilConjectures/README.md:868`, 1013 (WC.5 curve comparison and independent surface route), 1291 (WC.7 curves) | Smooth projective geometrically connected curves, every r≥1, error2gq^(r/2), b₁=2g; no missing-boundary character estimate supplied. |
| ErdosProgressionPowers, supplied open head | `TauCetiRoadmap/ErdosProgressionPowers/README.md:724`, §0.9; divisor estimates at 744–747 | Effective τ(n)≤n^ε eventually, after absorbing its constant. The unrelated numerical endpoint is not consumed. |
| PolynomialGaloisGroupsPartII, supplied open head | `TauCetiRoadmap/PolynomialGaloisGroupsPartII/README.md:1056`, §4.4; `babai_distinguishers` at 1057 | Primitive degree n≥5, not two-transitive; at least √n/2 distinguishers. The local small-base deduction has an actual supplier. |
| ArithmeticDynamics, supplied open head | `TauCetiRoadmap/ArithmeticDynamics/README.md`, Scope and Layers 1–6 | Iterated projective maps, heights, measures and preimages; no competing finite-field Markoff orbit programme. This Part II's stated boundary is appropriate. |

The object audit found the admissible-cover and Babai ownership already repaired, and the pinned Jordan theorem needed by R01. No other owner of the general maximal-divisor reductions or the exact primitive-group section targets was found in the searched main/open texts. This is a search result, subject to the unavailable board head below, not a claim that an unread package cannot contain them. ArithmeticDirichletSeriesPartII's Markoff–Hurwitz counting direction is distinct from finite residue orbits.

The local NonabelianLevelStructures design also describes elliptic level objects, but it is later in the merge order (line278, after this package at276). The present package owns the specialization and degree/trace foundations; that later roadmap must import them. The README names it only as a consumer. No edge was added upward to resolve that ownership issue. Generic scheme/stack and admissible-cover constructions remain with the earlier owners.

### Supplier order and dependency command

Every `*Needs:*` line and supplier citation was read. All seven named mathematical suppliers precede this package in the order: SchemeAndStackFoundations2, ArithmeticGaloisRepresentations51, InverseGaloisAndArithmeticFundamentalGroups53, ClassicalArithmeticCompletion109, WeilConjectures145, ErdosProgressionPowers262 and PolynomialGaloisGroupsPartII269; ArithmeticDynamics is267, this Part II276. No cycle or upward citation was found. Local subdivision references, including §4.0's explicitly later §4.3 comparison, do not create a dependency cycle: the affine definition precedes that comparison, and §4.3 uses §4.1 rather than §4.0's comparison assertion.

The required dependency command, with `--depcheck`, `--name ArithmeticDynamicsPartII`, `--order` and `--movable`, returned:

    depcheck: 48 roadmaps, 542 edges, 0 problem(s)

No UPWARD, CYCLE or moved line appeared. There are no declared supplier gaps in the README or the plan, and no conditional acceptance is proposed. R01 is an unlisted local proof input, not a declared supplier gap.

## Not verifiable

- **M25**, settled uncertified: the text of the locators used in Layers 0–1 and 4, and the corresponding historical connectivity argument, could not be read. The involution identity, small primes, weight identities and root bridge were checked directly. No new reference request was made for this settled entry.
- **DM96**, settled uncertified: Theorems 1.6A,4.3B,4.7A,5.3A and5.5B were not read in the book. MP18's explicit restatements in Theorems 5.9–5.12 were read; this checks the requested statements, not every classification input in their proofs. No new request was made.
- **EFLMT24 OCR:** some displayed fractions and interval symbols in Theorem 3.2 and the explicit-bound discussion are degraded in extraction. Constants and inequality directions used here were recomputed from the readable proof and the corrected geometric estimate; this is not certification of every OCR glyph.
- **Large finite source facts:** the product-770 transitivity assertion, the equal-order exclusion for q<203897 and the remaining finite two-elliptic-coordinate existence cases were read in MP18, but their large enumerations were not reproduced. The cardinality 394240, exceptional pair (11,5), and the p>121 character threshold were computed separately.
- **Board head access:** the indexed `packages/SchemeAndStackFoundationsPartII/README.md` at head `accb0a0` returned HTTP404. Its contents could not be checked for competing ownership. The index was read and available board/main/open-roadmap texts were searched; packages existing only on other board branches are not certified by that local scan. This is not a claim that the package is absent. All suppliers actually cited in this README were readable and resolved as listed above.
- General BGS, Chen, Corvaja–Zannier, low-order elimination and permutation-group results were checked through their statement hypotheses, relevant proof inputs, and the recorded instances. Finite computations and successful `sorry` elaboration do not independently prove those deep results.

## Source issues

These are defects in source text encountered during this pass, including previously reported defects rechecked here. They are separate from the four package findings. The package already avoids most of them.

- **Error** in EFLMT24 at Lemma 2.1, proof, pp. 4–5: the source says the cubic has three boundary points and uses degrees t,d; it should be four boundary points, degrees2t,2d, and χ=4, giving the conservative bound in §5.1; affects a stated result.
- **Gap** in EFLMT24 at Lemma 3.7, proof, p. 9: the source says the least-prime-factor product identity applies to all quotient pairs; it should treat quotient1 separately, because λ(1)=1 invalidates that minimum identity; affects the proof.
- **Misprint** in EFLMT24 at §4.1, p. 20: the source says the first obstruction interval belongs to Theorem 3.14; it should be Theorem 3.2; affects nothing.
- **Misprint** in EFLMT24 at Remark 4.1, p. 21: the source says Theorem 3.2 provides a reduced integer in the required interval; it should be Theorem 3.14; affects nothing.
- **Misprint** in EFLMT24 at §4.1 and Theorem 4.2 proof, pp. 20–21: the source says M_d is the cardinality of a union of the two maximal-divisor sets; it should be the sum of their cardinalities, retaining common divisors twice, as in Theorem 3.2; affects the proof.
- **Error** in C24 at Proposition 3.2.2(a), p. 352: the source says the reduced ramification divisor has degree #G/e without excluding e=1; it should impose e≥2; the reduced ramification divisor is empty when e=1; affects a stated result.
- **Error** in C24 at Remark 2.2.4, p. 324: the source says the reduced ramification divisor is absolutely reduced exactly when the base is reduced; it should require a surjective ramification divisor for the converse; an empty divisor is reduced over a nonreduced base; affects a stated result.
- **Error** in C24 at Proposition 5.4.2 and Theorems 5.4.3–5.4.4, pp. 411–413: the source says even characteristic permits only the split torus case; it should classify using polynomial splitting; the nonsplit order5 case over 𝔽₄ requires q+1; affects a stated result.
- **Misprint** in C24 at Proposition 5.4.2 proof, p. 411: the source says conjugacy ACA⁻¹=Cⁿ sends λ-eigenvectors to λⁿ-eigenvectors under A; it should state that direction for A⁻¹; affects nothing.
- **Error** in C24 at Proposition 5.4.2 proof, p. 412: the source says Frobenius proportionality forces an arbitrary eigenvector's coordinates to be Frobenius-fixed; it should normalize one nonzero coordinate and descend the coordinate ratio; affects the proof.
- **Error** in C24 at Theorem 5.5.7's precise prime range, p. 416: the source says the geometric connectedness clause holds at every prime outside the exceptional set; it should restrict that clause to p≥5, since the indicated epimorphism locus is empty at 2 and 3; affects a stated result.
- **Error** in C24 at Theorem 5.5.8(b), p. 417: the source says full affine strong approximation holds at the stated squarefree moduli; it should give the origin plus the primitive locus; the mixed point404040 modulo65 has no lift; affects a stated result.
- **Error** in C24 at Theorem 5.5.8 proof, p. 417: the source says the coefficient-three surface modulo3 consists of two singleton orbits; it should have the origin and one eight-point nonzero orbit; affects the proof.
- **Error** in MP18 at Corollary 5.11 proof, p. 25: the source says the Markoff block degree is never a prime power; it should separate p=7, whose degree is7, and use the supplied fixed-point argument; affects the proof.
- **Misprint** in MP18 at Lemma 5.13 proof, p. 26: the source says both commutator components use h₁; it should use h₂ in the second component; affects nothing.
- **Misprint** in MP18 at Lemma 5.13 proof, p. 26: the source says the relevant normal subgroups belong to Q_p; it should say Q_q; affects nothing.
- **Misprint** in MP18 at Lemma 5.13 proof, p. 26: the source says the resulting socle lies in the image under π_p; it should say π_q; affects nothing.
- **Error** in BGS16 at Lemmas 4–5, pp. 5–6: the source says every hyperbolic or elliptic trace has respectively p−1 or p+1 nonzero slice points; it should exclude trace 0: its counts are 2(p−1) or0; affects a stated result.
- **Misprint** in BGS16 at equation(9), p. 5: the source says a norm-one torus generator is obtained by exponent p+1 from a quadratic-field generator; it should use exponent p−1; at p=5 the printed exponent gives order 4 instead of 6; affects the proof.
- **Misprint** in BGS16 at equation(63), p. 16: the source says the first eigenvalue is paired with the second eigenvalue's inverse; it should pair the first eigenvalue with its own inverse in both occurrences; affects nothing.
- **Misprint** in BGS16 at Proposition 12 proof, p. 17: the source says the all-zero trace exception has three eigenvalue orders equal to 2; it should use order 4, since each eigenvalue is ±i; affects nothing.
- **Misprint** in BGS16 at §1, p. 1: the source says R₂ and R₃ remain to be defined after defining R₃; it should say R₁ and R₂; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "cd26b109a1a52fa2483ed93e6d8a39183ea304b5", "job": "REV-PKG-ArithmeticDynamicsPartII~2", "model": "gpt-6-astra", "worker": "chris-7"} -->
