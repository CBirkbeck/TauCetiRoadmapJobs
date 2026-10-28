<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1041#issuecomment-6398504099 -->
Red team round 1 pass b (claude) of 15c525e

Verdict: needs changes

1. **F01** (P1) §3.0 Kummer character-sum bound: the proof route rests on an unowned cohomological input

   Location: `packages/ArithmeticDynamicsPartII/README.md:291` ("The bound comes from the anti-invariant compactly supported cohomology of this cover; its dimension is 2g−2+s, and its Frobenius eigenvalues have absolute value at most √q") and the `*Needs:*` line at `README.md:312`; supplier contract at `README.md:67`.

   Claim: for a geometrically connected smooth curve C of genus g, S ⊇ boundary ∪ zeros ∪ poles of f (s = #S), |Σ_{x∈U(𝔽_q)} χ_q(f(x))| ≤ (2g−2+s)√q, proved from the WeilConjectures contract.

   Witness: the WeilConjectures contract as stated here (`README.md:67`) supplies only |#C̄(𝔽_{q^r})−q^r−1| ≤ 2g q^{r/2} for smooth projective curves plus "removing b points changes the count by at most b". From that alone one gets, with g_f the genus of the smooth completion of the double cover (2g_f = 4g−2+r, r = number of odd-order points of S), |Σχ| ≤ (2g_f+2g)√q + s = (6g−2+r)√q + s. For g = 1, s = r = 4 this is 8√q+4, not the claimed 4√q. The sharp constant needs the cancellation of the weight-one part of C̄ inside C̄_f (equivalently: H¹_c of the lisse rank-one Kummer sheaf on U has dimension 2g−2+s and weights ≤ 1, or P₁(C̄) ∣ P₁(C̄_f) via the Jacobian pull-back). No section of any supplier named in §3.0 provides this; WeilConjectures WC.5 and WC.7 at #1208 concern projective curves only. For g = 0 (every consumer in this roadmap: §3.2 and §7.4, §7.6 sum over 𝔽_p or over the norm-one conic) the sharp bound does follow from the projective count, because P₁(C̄) = 1: |Σχ| ≤ 2g_f√q + (s−r) = (r−2)√q + (s−r) ≤ (s−2)√q.

   Repair (either): (a) In §3.0 restrict the Kummer target to genus-0 bases: replace "let C be a geometrically connected smooth curve over 𝔽_q, C̄ its smooth projective completion of genus g" by "let C be a geometrically connected smooth curve of genus 0 over 𝔽_q (an open subset of ℙ¹ or of a conic), C̄ = ℙ¹_{𝔽_q} or the conic", keep (2g−2+s)√q = (s−2)√q, and replace the cohomological sentence by "The bound follows from the supplier count on the smooth projective completion of the double cover, of genus (r−2)/2 where r is the number of odd-order points of S, together with the boundary correction of at most one per unramified rational point of S"; drop "Its dimension is 2g−2+s" and "anti-invariant compactly supported cohomology". (b) Keep the general-genus statement and add to the `*Needs:*` line of §3.0: "DeligneWeightsAndPurity §1.7 (weights of H⁰, H¹, H² of a projective curve) and §5.9 (generalized majoration for lisse sheaves on curves); InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3 (rational constructible trace formula); EtaleCohomologyFoundations §§F.3, F.5–F.6 (curve cohomology with compact support)", and add the matching subsections under "Exact supplier contracts". All three suppliers precede this roadmap in the merge order (DeligneWeightsAndPurity line 94, InverseGalois… and EtaleCohomologyFoundations earlier). Option (a) is the smaller change and covers every consumer.

2. **F02** (P2) Statable headline absent: Meiri–Puder primitivity of the block action (§7.4)

   Location: `packages/ArithmeticDynamicsPartII/README.md:873` ("For p≥5, if Γ is transitive on X*(F_p) and MP(p) holds, then Q_p acts primitively on Y*(p)"); `packages/ArithmeticDynamicsPartII/Suggested.lean:205-246` (Layer 7 states only the three squarefree theorems); module docstring `Suggested.lean:11-15`.

   Claim: the acceptance test states the roadmap's headline theorems and names in the docstring those that are not statable.

   Witness: §7.4 is MP18 Theorem 1.3 (proof, MP18 line 460) and Theorem 4.1 (MP18 line 488), the engine of all of Layer 7, and it is statable at the pins with one simple definition: for a transitive action, primitivity is equivalent to "every invariant equivalence relation is trivial or universal", and invariance under the six generating involutions is equivalent to invariance under the group they generate. It is neither stated nor named in the docstring (the docstring names only §6.0, §6.6's stack and §7.5a).

   Repair: add to Layer 7 of `Suggested.lean`, before `squarefree_transitivity`:

   ```lean
   /-- One double sign change: negate the two coordinates other than i. -/
   def signStep {R : Type*} [CommRing R] (x y : Fin 3 → R) : Prop :=
     ∃ i : Fin 3, y = fun j => if j = i then x j else -x j

   /-- Meiri–Puder primitivity: for p ≥ 5 with Γ transitive on X*(F_p) and MP(p), every
   Γ-invariant equivalence relation containing the double sign changes restricts on X*(F_p)
   to the sign relation or to the universal relation. -/
   theorem block_action_primitive (p : ℕ) [Fact p.Prime] (hp : 5 ≤ p) (hmp : mpCondition p)
       (htrans : ∀ x y : Fin 3 → ZMod p, markoffEquation 1 x → x ≠ 0 →
         markoffEquation 1 y → y ≠ 0 → Relation.ReflTransGen (gammaStep 1) x y)
       (r : (Fin 3 → ZMod p) → (Fin 3 → ZMod p) → Prop) (hr : Equivalence r)
       (hsign : ∀ x y, signStep x y → r x y)
       (hvieta : ∀ i x y, r x y → r (vietaMove 1 i x) (vietaMove 1 i y))
       (hperm : ∀ (σ : Equiv.Perm (Fin 3)) x y, r x y → r (x ∘ σ) (y ∘ σ)) :
       (∀ x y, markoffEquation 1 x → x ≠ 0 → markoffEquation 1 y → y ≠ 0 → r x y →
           Relation.ReflTransGen signStep x y) ∨
         (∀ x y, markoffEquation 1 x → x ≠ 0 → markoffEquation 1 y → y ≠ 0 → r x y) := by
     sorry
   ```

   Tested on the refuting instances: p = 5 (Y*(5) has 10 blocks, A₁₀ ≤ Q₅, so the only invariant relations on blocks are equality and the universal one; the sign relation itself satisfies the hypotheses, since R_i(εx) = ε R_i(x) for ε in the Klein group, and realises the first disjunct); p = 7 is excluded by `mpCondition` (order 8, 64 < 8192); p = 3 is vacuous. Add `signStep` and `block_action_primitive` to §7.2/§7.4 of the README so that README and Lean names agree.

3. **F03** (P3) Module docstring omits headline targets that are not stated

   Location: `packages/ArithmeticDynamicsPartII/Suggested.lean:11-15`.

   Claim: "which headline theorems are not statable at the pins and what each lacks" is recorded in the docstring.

   Witness: §§5.13–5.14 (EFLMT24 Theorem 4.2: connectivity on an explicit prime interval / above a uniform threshold, the endpoint of "the explicit-bound direction" of the summary, `README.md:3`) and §7.4a (MP18 Theorem 1.3: A(Y*(q)) ≤ Q_q) are not in the file and the docstring does not mention them; their missing carriers are the cage/endgame hypotheses of §§5.3–5.4 and the permutation group of the sign quotient.

   Repair: append to the docstring: "The explicit connectivity criteria of §§5.13–5.14 are not stated: their cage and endgame hypotheses have no simple carrier. Alternating containment for the block action (§7.4a) is a supporting target in README.md: it needs the permutation group of the sign quotient."

4. **F04** (P3) Convention clash with the supplier's naming of the two surfaces

   Location: `packages/ArithmeticDynamicsPartII/README.md:19` ("Put M(R)={x²+y²+z²=3xyz} and X(R)={x²+y²+z²=xyz}") against `README.md:51` ("Consume §§4.3 and 4.58 for the two surfaces") and `README.md:420` (§4.111 predicate).

   Witness: ClassicalArithmeticCompletion on main, `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:7670-7674`, defines X(R) and X*(R) as the coefficient-three surface (`markoffSet`, "The coefficient is 3"), and its §4.111 (`README.md:10708-10716`) has `red_p : M → X*(𝔽_p)` with that coefficient-three X*. So the supplier's X is this roadmap's M; this roadmap's X is the supplier's §4.58 trace surface. The mathematics is consistent, the names are not.

   Repair: add to Conventions after "Put M(R)=…": "ClassicalArithmeticCompletion §4.3 writes X(R), X*(R) for the coefficient-three surface called M(R), M*(R) here, and its §4.111 predicate targets that locus; its §4.58 trace-coordinate surface is the X(R) of this roadmap."

5. **F05** (P3) The 770 base case lies outside the roadmap's own definitions

   Location: `packages/ArithmeticDynamicsPartII/README.md:929` ("Γ acts transitively on the primitive coefficient-one locus at 770=2·5·7·11, of size 4·40·28·88=394240 … then project away auxiliary factors"); definitions at `README.md:807` (§7.1: "S a nonempty finite set of distinct primes ≥5"), `README.md:830` (§7.2: "For odd p"); induction statement at `README.md:921` (§7.5: "distinct primes p₁,…,pᵣ≥5").

   Witness: X_prim(770) involves the prime 2, which §7.1 excludes, and §7.5's induction is quantified over primes ≥ 5, so the auxiliary prime 2 cannot enter the induction as the sections are written. (MP18 Notation 5.2, lines 1150–1153, orders the auxiliary primes 2, 7, 11, 5 and needs four of them so that Lemma 5.5 applies from the fifth prime, p_j ≥ 13.) The number 394240 = 4·40·28·88 is correct.

   Repair: in §7.1 replace "distinct primes ≥5" by "distinct primes (the twist clause requires 3 ∤ n)"; in §7.5 replace "distinct primes p₁,…,pᵣ≥5 with primitive Q_p-actions" by "distinct primes with primitive block actions, where for p = 2 the block set is X*(𝔽₂) itself"; in §7.6 add after "project away auxiliary factors": "The auxiliary primes 2, 7, 11, 5 have primitive block actions: Q₂ is the symmetric group on the four points of X*(𝔽₂), Q₇ is transitive of prime degree 7, and §7.4a gives A₁₀ ≤ Q₅ and A₂₂ ≤ Q₁₁."

6. **F06** (P3) §7.4 states less than MP18 Theorem 1.4 without saying why

   Location: `packages/ArithmeticDynamicsPartII/README.md:873` and `README.md:881` (§7.4a covers q ≡ 1 mod 4 and q = 11 only); Scope `README.md:15`.

   Witness: MP18 Theorem 1.4 (MP18 lines 96–103) concludes that Q_p is the full alternating or symmetric group for p ≡ 3 mod 4 under MP(p); its proof uses the classification of finite simple groups (MP18 line 483). The roadmap states only primitivity for these p and uses the CFSG-free route of §7.5, but nowhere says that the CFSG-dependent containment is out of scope.

   Repair: add to Scope (`README.md:15`): "Alternating containment of the block action for p ≡ 3 mod 4 (MP18 Theorem 1.4, which uses the classification of finite simple groups) is not planned; §7.5 needs only primitivity."

Scope of this pass: the whole of `packages/ArithmeticDynamicsPartII/README.md` (984 lines) and `packages/ArithmeticDynamicsPartII/Suggested.lean` (248 lines; 13 definitions, 18 theorems) were read line by line. Every numerical claim that a finite computation can decide was recomputed (orbit sizes, divisibility, the rotation-orbit formula, the Γ⁺-orbit congruences over GF(4), GF(5), GF(7), GF(8), GF(9), GF(11), GF(13), block cycle types, the divisor-antichain theorems for n < 3000). All library locators were checked at the pinned Mathlib (`6b7abb3c`) and Tau Ceti (`a91d3aaf`) checkouts; all cross-roadmap citations were resolved on main or at the heads the brief gives; all source locators were checked in the cached extractions (M25 and DM96 are settled uncertified and were not read). The dependency gate output is in "Verified sound". Lean: not built (no Lean was run; the file contains no `variable` block, so the binder-loss failure mode the brief describes cannot occur, and every hypothesis is carried in the declaration's own signature).

## Verified sound

Dependency gate: `depcheck: 52 roadmaps, 589 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. ArithmeticDynamicsPartII is at merge-order line 276; every supplier (ClassicalArithmeticCompletion, InverseGaloisAndArithmeticFundamentalGroups, ArithmeticGaloisRepresentations, SchemeAndStackFoundations, WeilConjectures, ErdosProgressionPowers, PolynomialGaloisGroupsPartII) is earlier; the only roadmap cited as a consumer, NonabelianLevelStructures, is a design-stage board package at line 278 whose plan cites this roadmap. `git diff --stat origin/main...HEAD` touches only `packages/ArithmeticDynamicsPartII/`. No `lemma`, `set_option`, `#check`, `#eval`, pull-request number or process word in README or Lean. No declared gaps (plan `gaps: []`), none needed.

Counts: 31 declarations read (13 definitions, 18 theorems); 54 README subsections read; 35 library locators verified at the pins (28 Mathlib, 7 Tau Ceti; `Fintype.sum_equiv` is cited at line 739, the `@[to_additive]` attribute line, the `lemma` keyword is at 741); 64 source line-locators verified against the extractions (EFLMT24 13, C24 22, MP18 14, BGS16 10, CZ13 3, CKSZ14 2); 45 cross-roadmap citations checked (ClassicalArithmeticCompletion 16 sections and 6 backticked names, SchemeAndStackFoundations 13 sections, WeilConjectures 3, InverseGalois… 4, ArithmeticGaloisRepresentations 1, ErdosProgressionPowers 1, PolynomialGaloisGroupsPartII 1); 41 README Checks recomputed, all correct; ownership searched by object (`markoff`, `Markoff–Hurwitz`, level stacks) over main, the open heads and the board packages: ArithmeticDynamics (#1335) has no Markoff content; ArithmeticDirichletSeriesPartII counts integer points on Markoff–Hurwitz varieties (excluded here by Scope); no second owner of the finite-field orbit theory, the maximal-divisor theory or the (1,1) level-stack rigidification (InverseGalois §IG.5.4 at #850 explicitly leaves (g,n)=(1,1) rigidification and compactification out).

Computed record (one row per Lean statement; values on each side):

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `markoffEquation`, `vietaMove`, `moveStep`, `gammaStep` | p=2,3,5: R₂(1,1,1), R₀(0,1,1) over 𝔽₂, R₀ over 𝔽₃ | (1,1,2); (1,1,1); sign flip; M*(𝔽₂)={111,011,101,110}, root adjacent to the three leaves, R₁ fixes 011 | matches Conventions and §0.2 Checks |
| `stable_card_dvd` | p=2,3,5,7,11,13,17, S = each V-orbit; p=3 negative control | #M* = 4, 8, 40, 28, 88, 208, 340; one V-orbit each; p ∣ #S for p≠3; 3 ∤ 8 | true; hypothesis p≠3 necessary |
| `divisorPhi` | n=1,2,3,4,6,8,12 | 1, 3/2, 5/3, 2, 5/2, 5/2, 10/3 | matches §2.4 Checks |
| `markoffRotation` | (a,b,c)↦(a,c,ac−b) on X | a²+c²+(ac−b)² − ac(ac−b) = a²+b²+c²−abc = 0 | preserves X; (3,3,3)↦(3,3,6) |
| `rotation_orbit_count` | p=3,5,7,11,13,17,19,23 | orbits 0, 8, 5, 14, 26, 37, 34, 41 = formula at every p | true |
| slices (§2.2–2.3) | p=5,7,13 | p=5: a=0:8 (two 4-cycles), a=±2:10 (5-cycles / one 10-cycle), a=±1:6; p=7: a=0,±2 empty; p=13: 24, 26, 26; totals 40, 28, 208 | matches |
| `no_finite_orbit` | real triples in [−2,2]³ | |xyz| ≤ y²+z² with equality only at the origin; BGS16 Prop 11 (line 722) | true |
| `orbit_log_lower_bound` | BGS16 Prop 12 (line 775) | source gives l ≥ (log₂₀ p)^{1/3} for all p; Lean has a threshold P | true (weaker than the source; harmless) |
| `giant_orbit`, `sparse_exceptional_primes`, `eventual_connectivity`, `eventual_positive_lifting` | p=2,3 (root-connected: 4 and 8 points), BGS16 Theorems 1, 2, 13 | E contains neither 2 nor 3; p^{1/2} < p | true |
| `prime_affine_lifting` | c=1 at p=3; c=3 at p=3; c=1,3 at p=5 | X(𝔽₃)={0} lifted by 0; cube lifted by V-words from (1,1,1); 3·M = X when 3 is a unit | true |
| `maximalDivisors` | M₆(12), M₃(12), M₀(12), M₁(1) | {4,6}, {2,3}, ∅, {1} | matches §5.2 Checks |
| `IsMaxDivReduced` | 3, 27, 2⁷·3, 2⁸·3, 2⁶, 2⁷, 15, 45, 75, 30 | T, F, T, F, T, F, T, T, F, T; reduced n ≤ 120 are 1,2,3,4,6,8,9,12,15,16,18,24,30,32,36,45,48,60,64,72,90,96,105,120 | matches EFLMT24 Def. 3.11 and Table 1 claim at line 546 |
| `reduced_domination` | all 2 ≤ n < 260, all cutoffs x at divisors ± ½ | a reduced m ∈ [n, 4n−6] dominating n exists for every n; worst m/n = 120/66 | true |
| `central_rank_bound` | all 1 ≤ n < 3000, all cutoffs | #M_x(n) ≤ C_{⌊Ω/2⌋}(n) and C·2^Ω ≤ τ·binom(Ω,⌊Ω/2⌋) with no failure; n=12 polynomial 1+2T+2T²+T³; C₁(8)=1 | true |
| `divisorRank` | n=4: ranks (1,1,1); proportion 1/3 vs 1/4 | matches Layer 5 Examples | |
| `orientedStep`, `oriented_card_dvd`, `oriented_transitivity` | p=2,3,5,7,11,13,17 | one Γ-orbit and one Γ⁺-orbit of size 4, 0, 40, 28, 88, 208, 340; p divides each | true |
| `traceOrder`, `semisimple_orbit_congruence` | GF(4), GF(5), GF(7), GF(8), GF(9), GF(11), GF(13), every t ≠ ±2, every Γ⁺-orbit through a point with ≥2 nonzero coordinates | e.g. q=4, t=a: nonsplit, m=5, n=5, modulus 5 ∣ 10; q=9, t=5: m=10, n=10, modulus 5 ∣ 40, 60; q=13, t=3: m=14, n=14, modulus 7 ∣ 196; q=8, t=2: m=9, n=9, modulus 9 ∣ 54; no violation in 52 (q,t) pairs | true; the char-2 splitting dichotomy is necessary (5 ∤ 3) |
| `valuation_orbit_congruence` | same data, ℓ ∈ {3,5,7,11,13} | ℓ^{max(r−s,0)} divides every orbit size; C24 Thm 5.5.9 (line 4697) | true |
| `mpCondition` | p=5,7,11,13 | roots of T²−3T+1 have orders (double root 4 at 5), 8, 5, 14; 64 < 8192, 25 < 12288; first branch at 5, 13 | matches §7.3 Checks; MP(7), MP(11) fail |
| `primitivePoint` | (40,40,40) mod 65 on M, (55,55,55) mod 65 on X | 3·40² ≡ 3·40³ ≡ 55; 3·55² ≡ 55³ ≡ 40; zero mod 5, (1,1,1) mod 13 | not primitive, no integral lift (Hurwitz) |
| `squarefree_*` | n=65: sizes | 40·208 = 8320 primitive; 8321 image; 41·209 = 8569 total; 248 mixed | matches §7.8 and Worked examples |
| Y*(p) blocks (§7.2, §7.4a, §7.5a) | p=5,7,11,13 | #Y* = 10, 7, 22, 52; rotation cycle types [2,3,5], [3,4], [3,3,5,5,6], [2,2,2,3,3,6,7,7,7,13]; orders 30, 12, 30, 546; rotation odd at 5; transposition odd at 11, 13; p=11 word R₁τ₁₂R₀R₂R₁R₂R₀R₂ has type [3,8,11], 88th power a 3-cycle; Q₁₁ primitive (every identification of two blocks generates the universal relation); p=7: rotation⁴ fixes 4 of 7 blocks; 11²−1 = 120 = 5·24 | all §7.4a and §7.5a Checks correct |
| §1.1 weights | (0,1,2) over 𝔽₅ | 1/2 = 3; weights (0,3,3), sum 1 | matches |
| §3.0 Checks | f = X, X(X−1), X(X−1)² on {2,3,4} ⊂ 𝔽₅; f = X² | sums −1, −1, −1; 4; x+y=1 has 3 torus points in μ₄×μ₄; 3·32^{1/3} ≈ 9.52, 192/5 = 38.4 | matches |
| §6.1 Check | A = diag(2,4), B = [[0,6],[1,0]] over 𝔽₇ | det 1, 1; traces (6,0,0); 36−2 ≡ 6 | matches |
| §5.13–5.14 constants | 108·2³, 1458·256, ·4, 384¹⁶·8 | 864; 373248; 1492992; p⁵ > 8·384¹⁶ holds from p ≈ 2.9·10⁸ | matches |

Source statements checked against the extractions and found to support the README as written: EFLMT24 Definition 3.1, Theorems 3.2 (constants 81/4 and 6, replaced here by the conservative 108 and 24 derived from CZ13 Corollary 2 with deg = 2, χ = 4), 3.5, 3.14, 3.21, 4.2, Notation 3.17, Definition 3.11, Lemma 2.2, Proposition 6.1; C24 Theorems 1.1.1, 2.5.2, 3.5.1, 4.10.3, 4.10.5, 5.2.10, 5.4.3, 5.4.4, 5.5.4, 5.5.7, 5.5.8(a), 5.5.9, Corollary 4.12.5, Propositions 2.2.3, 3.5.2, 5.1.5, 5.2.17, 5.3.3, 5.3.5, Definitions 2.2.2, 5.5.6, (5.8); MP18 Theorems 1.3, 1.4, 1.6, 1.9, 4.1, 5.10, 5.12, Corollaries 1.7, 5.11, Lemmas 5.3–5.5, 5.13, Proposition 5.6, the 770 computation and the 203897 bound; BGS16 Propositions 6, 7, 11, 12, Theorems 1, 2, 13; CZ13 Theorem 2 and Corollary 2; CKSZ14 §4 (4.1), (4.6)–(4.7). Supplier statements checked at their heads: ErdosProgressionPowers §0.9 (#1336) does give τ(n) ≤ n^ε for n ≥ N_ε effectively; PolynomialGaloisGroupsPartII §4.4 (#1419) states `babai_distinguishers` exactly as cited; ArithmeticGaloisRepresentations §4.4 (#856) contains the characteristic-two dichotomy as cited; WeilConjectures WC.5 and WC.7 (#1208) carry the two bold titles and WC.7's title; the Tau Ceti Jordan theorem has exactly the hypotheses §7.4a lists (primitive, cycle of prime length p, p+3 ≤ degree).

## Not verifiable

- M25 (Theorem 1.4, §2) and DM96 (Theorems 1.6A, 4.3B, 4.7A, 5.3A, 5.5B): settled uncertified, cited by locator only; the weight argument was checked directly instead.
- §6.0 Check 2: "the degree 40 of the Markoff component" for H = SL₂(𝔽₅). C24's proof of Theorem 5.4.4 (lines 4568–4575) gives deg(X → M(1)) ∈ {40, 80} for the orbit of size 40; the divisibility 120 ∣ 24·deg holds in both cases, but the printed value 40 was not confirmed.
- §3.3's main term Lφ(p−1)/(2(p−1)) + O_ε(p^{1/2+ε}) and the halving: BGS16 equations (25)–(33) were not recomputed.
- §3.0's arithmetic elimination target (constants A_d, C_d from CKSZ14 §4): the shape was checked at CKSZ14 lines 286–450; the constants were not re-derived.
- §6.0's general finite-group degree congruence and the m ∣ 24, m ∣ 12 exponents: taken from C24 Theorems 3.5.1, 4.10.5, 5.4.3 as statements; proofs not re-read.
- Lean elaboration: not built; the `#check @name` comparison was replaced by reading each signature (no section variables exist).
- Ownership against open pull requests whose files the brief does not list was checked only through `roadmaps grep` (lean-only `markoff`: hits only in ClassicalArithmeticCompletion).

## Source issues

- **Error** in C24 at Theorem 5.5.8(b) with Definition 5.5.6, printed page 417: the source says X and M satisfy strong approximation modulo squarefree n, that is V(ℤ) → V(ℤ/n) is onto; it should be that the image is the origin together with the primitive locus (the point (40,40,40) modulo 65 lies on M and has no integral lift by Hurwitz's theorem); affects a stated result. (Recorded in the design as E2.)
- **Error** in C24 at proof of Theorem 5.5.8(b), printed page 417: the source says M(𝔽₃) consists of two singleton orbits, the origin and (1,1,1); it should be the origin and the eight-point orbit {±1}³, on which each Vieta move flips one sign; affects the proof. (Recorded as E3.)
- **Error** in C24 at Theorems 5.4.3 and 5.4.4, final clauses, printed pages 412–413: the source says that for even q the discriminant t²−4 is always a square so case (b) with q−1 applies; it should distinguish by whether T²−tT+1 splits over 𝔽_q and use q+1 when it is irreducible (q = 4, t = a: the companion matrix has order 5, which does not divide 3); affects a stated result.
- **Error** in EFLMT24 at Lemma 2.1 and its proof, printed pages 4–5: the source computes the Euler characteristic of the cubic with three removed points and takes deg u = t, deg v = d; it should use the four points at infinity and on the axes (the line at infinity meets the cubic in [1:0:0], [0:1:0], [1:α:0]) and deg u = 2t, deg v = 2d, giving (3/2)·max((32td)^{1/3}, 16td/p); affects the constants of Lemma 2.1, Proposition 2.4, Theorem 3.2 and Algorithm 1 (a stated result). (Recorded as E4.)
- **Gap** in MP18 at Notation 5.2, printed page 20, and proof of Theorem 1.6, printed page 22: the source says one may assume 2·5·7·11 divides n because computer simulations indicate Q_p is the full symmetric group for these four primes, and verifies transitivity at 770 by computer; neither fact is proved in the text; affects the proof of Theorems 1.6 and 1.9.
- **Misprint** in MP18 at proof of Corollary 5.11, printed page 25: the source says #Y*(p) = p(p±3)/4 is never a prime power for p ≥ 5; it is 7 at p = 7; the alternative fixed-point argument in the same sentence covers that case; affects the proof. (Recorded as E13.)

<!-- tauceti-roadmap-review {"agent": "claude", "head": "15c525e", "job": "RT-ArithmeticDynamicsPartII~1b", "model": "fable", "worker": "fable-rt34"} -->
