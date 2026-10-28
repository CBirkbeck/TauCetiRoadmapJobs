<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1041#issuecomment-6404033824 -->
Red team round 2 pass b (claude) of 071f95f

Verdict: needs_changes

1. **F01** (P3) Two Lean definitions have fewer than three README Checks

   Location: `packages/ArithmeticDynamicsPartII/Suggested.lean:44` (`gammaStep`) and `:165` (`orientedStep`); README §0.1 Checks at `README.md:103–107` and §6.1/§6.6 Checks at `README.md:731–735`, `:796–800`.

   Claim: each definition has at least three discriminating Checks.

   Witness: `gammaStep` is tested by one Check only (`README.md:106`, the swap fixing the root); `orientedStep` by two (`README.md:798`, the oriented words at p=2; `:800`, the fixed point (3,3,3) at p=5). The §6.1 Checks test the trace triple, not the step relation.

   Repair: add to the §0.1 Checks: "Over ℤ on the coefficient-one surface, the reversing successors of (3,3,3) are (3,3,3) itself, through each transposition, and (6,3,3), (3,6,3), (3,3,6); the point (3,6,15) is not a reversing successor, only a two-step image." Add to the §6.1 Checks: "Over ℤ, (3,3,6) is an oriented step from (3,3,3): a transposition fixes (3,3,3) and the third Vieta move follows. From (3,6,15), whose stabilizer in Γ is trivial, the Vieta image (87,6,15) and the transposition image (3,15,6) are reversing steps but not oriented steps." Computed here: the six reversing successors of (3,6,15) are (3,6,3), (3,15,6), (3,39,15), (6,3,15), (15,6,3), (87,6,15); its eighteen oriented successors contain none of (87,6,15), (3,15,6); the oriented successors of (3,3,3) are its four reversing successors together with the six orderings of (3,6,15).

One new finding (P3). Every round-1 finding is repaired at this head, and no repair introduced an error. The whole of `packages/ArithmeticDynamicsPartII/README.md` (998 lines, 54 numbered subsections, 27 Check blocks with 90 Check bullets) and the whole of `packages/ArithmeticDynamicsPartII/Suggested.lean` (273 lines, 14 definitions, 19 theorems) were read line by line. Every finite claim that a computation decides was recomputed independently (prime fields through 31, the fields of 4, 8, 9 and 16 elements, the divisor theory to n = 1500, the moduli 65 and 770). No Lean was run; the supplied elaborated signatures were compared declaration by declaration with the source and the README.

## Round-1 findings at this head

| Finding | Status | Witness at 071f95f |
|---|---|---|
| r1a F01 (P2) non-dihedral hypothesis on the SL₂ exponent refinement | repaired | `README.md:711` now reads "For q≥3 and an absolutely irreducible subgroup H≤SL₂(𝔽_q) not of dihedral type, choose a nonempty component with noncentral ramification element c∈H and tr(c)≠2 … m∣24 for odd q and m∣12 for even q"; the semisimple centralizer bound is separated from the prime-field trace −2 case; the D₁₀≤SL₂(𝔽₄) negative Check is at `README.md:709` (C24 lines 3493–3509 confirm degree 3 and commutator order k=5). The related degree Check at `README.md:707` now says "degree 40 or 80", matching C24 lines 4568–4569 (D(q,G) ≤ 2). |
| r1a F02 (P3) five Checks repeating their API | repaired | Replaced by computed witnesses at `README.md:353` (orders 4,6,7 of (0,1,8) at 13; order 12 of 9; parabolic (2,0,3)), `:478` (components 40 and 1 at p=5), `:677` (M₁(5)=2, K₅⁻=48√5, 5/48≤1≤48√5), `:754` (𝔽₇: roots 3,5 of order 6; roots 2,4 of order 3), `:879` (𝔽₁₁: roots 5,9 of order 5; 25<12288). All five recomputed here: correct. |
| r1a F03 (P3) forward edges | repaired | The totient comparison and its three Checks are now at `README.md:323–331` inside §3.0; the root bridge is §3.0a at `README.md:333–339`; §3.3 cites "§3.0 elementary totient comparison" (`:375`); §3.7 cites "§3.0a symmetric-root bridge" (`:413`); §4.0's *Needs* (`:442`) no longer cites §4.3. No reference to a §4.1 remains (grep). |
| r1a F04 (P3) parameters of the genus-one Check | repaired | `README.md:318`: "for a≠0,±2 and αβ=a²/(a²−4) … Over 𝔽₅, a=1, α=1, β=3 gives αβ=3≠0,1. In contrast α=β=1 gives (x−y)(xy−1)=0". Recomputed: κ=1/(1−4)=3 in 𝔽₅. |
| r1b F01 (P1) Kummer bound rested on an unowned input | repaired (option b of the finding) | `README.md:299` now derives the bound from Riemann–Hurwitz (g_f=2g−1+r/2), the deck decomposition (anti-invariant projective H¹ of dimension 2g−2+r, boundary space of dimension s−r), projective purity and the trace formula; *Needs* at `README.md:321` names DeligneWeightsAndPurity §1.7, EtaleCohomologyFoundations §0.7, §§F.2.4–F.2.5, F.3, F.4.5, F.5–F.6 and InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3, each with a contract at `README.md:69–75`. All three sections exist at the cited heads (below) and all three roadmaps precede this one in the merge order (lines 94, 20, 53 versus 276). The dimension count was re-derived here and is correct; the genus-one Check at `README.md:319` (E: y²=x³−x, f=x, sum −2, dimensions 0 and 2) was recomputed. |
| r1b F02 (P2) primitivity headline absent | repaired | `Suggested.lean:224–240` state `signStep` (real body) and `block_action_primitive` with prime, 5≤p, `mpCondition`, Γ-transitivity, equivalence, sign-containment and the two invariance hypotheses; `README.md:843` and `:887` name both. Recomputed: Q₅, Q₇, Q₁₁, Q₁₃ are primitive (every identification of two blocks generates the universal relation). |
| r1b F03 (P3) docstring omissions | repaired | `Suggested.lean:16–20` name §§5.13–5.14 (missing cage/endgame carrier) and §7.4a (missing quotient permutation action) as not stated. |
| r1b F04 (P3) surface-naming clash | repaired | `README.md:19`: "ClassicalArithmeticCompletion §4.3 calls the coefficient-three surface X(R), X*(R); these are M(R), M*(R) here, and its §4.111 predicate targets M*. Its §4.58 trace-coordinate surface is the X(R) used here." Matches `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:7670–7674`, `:9268`, `:10708–10716` on main. |
| r1b F05 (P3) the 770 base case outside the definitions | repaired (with the j≥4 qualification) | §7.1 at `README.md:818` admits every finite set of distinct primes (twist clause "when 3∤n" at `:826`); §7.5 at `:935` admits p=2 with singleton blocks and excludes 3; §7.6 at `:943` starts the full-triple induction at j≥4 after the four auxiliary primes 2,7,11,5 with orders 3,12,30,30 and names Q₂=S₄, Q₇ of prime degree, A₁₀≤Q₅, A₂₂≤Q₁₁. The qualification is right: MP18 line 1196 states Lemma 5.5 for j≥5 only, and MP18 line 1188 notes that Sym(4) has no nonabelian simple subgroup. Recomputed: the Γ-orbit of (3,3,3) on X(ℤ/770) has 394240 points; rotation orders on Y*(2), Y*(7), Y*(11), Y*(5) are 3, 12, 30, 30. |
| r1b F06 (P3) CFSG scope | repaired | `README.md:15`: "Alternating containment for general primes p≡3 modulo 4 under MP(p), proved using the classification of finite simple groups in MP18 Theorem 1.4 (§4.3; MP18 line 483), is outside this roadmap". MP18 line 483 is the CFSG remark. |

No repair introduced a new error: the moved totient target keeps 1=1, 2=2, 3≤6; the moved root bridge keeps its *Needs* (its SchemeAndStackFoundations §§0.1–0.2 edge is unused by the proof route, a note only); the new Kummer route was re-derived; the new Lean declarations elaborate with all seven hypotheses (the worker's elaborated-signature record).

## Verified sound

Dependency gate, run on the head's README with the supplied order and `--movable`, exit 0, output exactly:

```text
depcheck: 56 roadmaps, 642 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. ArithmeticDynamicsPartII is at merge-order line 276; its suppliers are at lines 2 (SchemeAndStackFoundations), 20 (EtaleCohomologyFoundations), 51 (ArithmeticGaloisRepresentations), 53 (InverseGaloisAndArithmeticFundamentalGroups), 94 (DeligneWeightsAndPurity), 109 (ClassicalArithmeticCompletion), 145 (WeilConjectures), 262 (ErdosProgressionPowers), 269 (PolynomialGaloisGroupsPartII). The only roadmap named as a consumer, NonabelianLevelStructures, is a design-stage board package at line 278; its plan cites this roadmap as supplier and still carries its own NL.0–NL.6 items on coarse degree, central rigidification and trace-orbit congruences. This roadmap is the owner of those objects by merge order and by the package report's explicit move-down; the duplication is a matter for that design, not a finding here.

Policy: `git diff --stat origin/main...HEAD` touches nine files, all under `packages/ArithmeticDynamicsPartII/`. The plan's `gaps` list is empty (the design's five internal gaps became targets §6.0–§6.1, §7.5a, §3.3/§5.3–§5.4, §5.1/§5.13–§5.14, §7.6, as recorded by the package and repair reports); no gap is declared and none is needed, since every prerequisite resolves to a target here, a pinned declaration or an existing supplier section. No `lemma`, `set_option`, `#eval`, `#print`, pull-request number or process word in README or Lean; 19 `sorry`, all in theorems; one `import Mathlib`; every Lean name is backticked in the README and every backticked name of this roadmap's own is declared (checked both directions by script); the remaining backticked names are pinned-library or supplier names, each resolved below.

Counts: 33 declarations read and compared with the worker's elaborated-signature record (no section variables exist, so no binder can have been lost; every instance and hypothesis is in the declaration's own signature); 54 numbered subsections read; 90 Check bullets read, 61 of them recomputed (every one whose value a finite computation decides); 35 pinned-library locators verified at the pins (28 Mathlib, 7 Tau Ceti, with namespaces); 44 cross-roadmap citations resolved (ClassicalArithmeticCompletion 16 sections and 7 API names on main; SchemeAndStackFoundations 14 sections on main; EtaleCohomologyFoundations 7 sections on main; InverseGalois §IG.0.T3, §IG.3.2 with "Exterior epimorphisms and T-systems", §IG.5.4 with both bold titles at #850; ArithmeticGaloisRepresentations §4.4 at #856; DeligneWeightsAndPurity §1.7 at #929; WeilConjectures WC.5 both titles and WC.7 "Curves and their Jacobians" at #1208; ErdosProgressionPowers §0.9 at #1336; PolynomialGaloisGroupsPartII §4.4 and `babai_distinguishers` at #1419); 61 source line-locators verified in the cached extractions (EFLMT24 13, C24 27, MP18 13, BGS16 10, CZ13 3, CKSZ14 2); ownership searched by object over main, the open heads and the board packages for Markoff, Penner, maximal divisors, Babai, Jordan, socle, Kummer double cover, Meiri–Puder, Fricke, Vieta.

Supplier texts match the contracts: InverseGalois §IG.5.4 states that rigidification and the (1,1) compactification "are not part of this statement", so §6.0 is the owner; §IG.3.2 defines precomposition as e ↦ e∘α⁻¹, as the Conventions say; §IG.0.T3 is the rational trace formula for separated finite-type schemes over finite fields; DeligneWeightsAndPurity §1.7 gives weights 0, 1, 2 for a smooth projective geometrically connected curve with ℓ∤q; ArithmeticGaloisRepresentations §4.4 contains the characteristic-two dichotomy (solvable dihedral or PSL₂(F_{2^r}), r≥2); ErdosProgressionPowers §0.9 gives τ(n)≤C_ε n^{ε/2} with effective C_ε, hence τ(n)≤n^ε for n≥C_ε^{2/ε}, without the numerical-prime gap of its other estimates; PolynomialGaloisGroupsPartII's `babai_distinguishers` has primitive, not 2-pretransitive, card≥5 and x≠y hypotheses and concludes √n/2 ≤ card of distinguishers; the Tau Ceti Jordan theorem has primitive, prime cycle length p, p+3≤card hypotheses; ClassicalArithmeticCompletion §4.76 gives N_p = p²+1+3pχ(−1) at α=1, β=0, hence p(p±3) nonzero points; §4.108 lists `markoffTwist`, `markoffTwistEquiv` (3 a unit) and the integral bijection; §4.111 lists `MarkoffStrongApproximation` and `markoffStrongApproximation_iff_orbit`.

The MP condition: MP18 Theorem 1.4 and Theorem 4.1 are OCR-rendered as "32√p + 1"; the proof at MP18 lines 978–983 bounds 16(p+1)√p/d by √p·√(p+1), which is exactly d ≥ 16√(p+1), and the Theorem 4.1 proof (line 540–541) passes from |ω| to d_p(±3) ∈ {|ω|, |ω|/2} ≥ 16√(p+1). So the condition is 32√(p+1), as the README and `mpCondition` (1024(p+1) ≤ ord²) state.

### Declaration ledger

Instances are independent recomputations (prime fields through 31; GF(4), GF(8), GF(9), GF(16)); none proves an asymptotic statement.

| Declaration (line) | Context kept | Instances; values on each side | Result |
|---|---|---|---|
| `markoffEquation` (31) | R, c, x | ℤ: (1,1,1) with c=3: 3=3; c=1: 3≠1; (3,3,3), c=1: 27=27; zero ring: every triple satisfies it and none is nonzero | sound |
| `vietaMove` (35) | R, c, i, x | ℤ: R₂(1,1,1)=(1,1,2), R₂(1,1,2)=(1,1,1); 𝔽₂: R₀(1,1,1)=(0,1,1); 𝔽₃: R₂ flips a sign | cyclic indices right |
| `moveStep` (40) | R, c | 𝔽₂: 111→011 true; 011→011 true (R₁ fixes it); 111→000 false | labelled fixed steps kept |
| `gammaStep` (44) | R, c | ℤ, c=1: successors of (3,3,3) are {(3,3,3),(6,3,3),(3,6,3),(3,3,6)}; (3,6,15) not a successor | sound; S01 for Checks |
| `stable_card_dvd` (50) | p, Fact, p≠3, S, hS, hstable | all V-orbits on M*(𝔽_p), p≤31: the only p∤#orbit is (3,8); p=2: sizes 0,4 | hypothesis p≠3 necessary and sufficient |
| `divisorPhi` (59) | n | Φ(0)=0, Φ(1)=1, Φ(2)=3/2, Φ(4)=2, Φ(6)=5/2 | sound |
| `markoffRotation` (62) | R, x | (3,3,3)↦(3,3,6); preserves x²+y²+z²−xyz; order 4 on the a=0 slice at 5, order 5 on a=2 | sound |
| `rotation_orbit_count` (66) | p, Fact, 2<p | orbit counts / formula at 3,5,7,11,13,17,19,23: 0/0, 8/8, 5/5, 14/14, 26/26, 37/37, 34/34, 41/41 | exact |
| `no_finite_orbit` (78) | S over ℚ̄, hS, hstable | real cube [−2,2]³: |uvw|≤(2/3)(u²+v²+w²) with equality only at 0; BGS16 line 722 | sound |
| `orbit_log_lower_bound` (84) | ∃c∃P∀p | BGS16 line 775: l ≥ (log₂₀ p)^{1/3} for every p; the Lean threshold is weaker | sound |
| `giant_orbit` (92) | ε before P | p=5,7,13: complements 0; at p=3 no witness, so P≥3 is forced and allowed | sound |
| `sparse_exceptional_primes` (100) | ε before T | primes ≤31: root reaches all of M*; count 0 | sound |
| `eventual_connectivity` (110), `eventual_positive_lifting` (117) | ∃P∀p | root V-orbits 4,8,40,28,88,208,340 equal #M* at 2,…,17; lifts 111↦111, 112↦112 (6=6) | sound |
| `prime_affine_lifting` (124) | p, hconn, c∈{1,3} | p=3,c=1: X(𝔽₃)={0}, lifted by 0; p=3,c=3: eight points by root words; p=2,c=1: X(𝔽₂)=M(𝔽₂), lifts (3,3,3),(3,3,6) | sound |
| `maximalDivisors` (134) | n, x | M₆(12)={4,6}, M₃(12)={2,3}, M₀(12)=∅, M₁(1)={1} | sound |
| `divisorRank` (140) | n, k | n=12: 1,2,2,1; n=8: C₁=1≠3 | sound |
| `IsMaxDivReduced` (143) | n | reduced n≤120: 1,2,3,4,6,8,9,12,15,16,18,24,30,32,36,45,48,60,64,72,90,96,105,120; 27 false (9<5 fails); 384 true; 768 false | matches EFLMT24 Definition 3.11 |
| `reduced_domination` (150) | n≥2, ∃m∀x | every 2≤n≤300, every cutoff at divisors ±½: a reduced m∈[n,4n−6] dominating n exists | sound |
| `central_rank_bound` (156) | n>0, x | every 1≤n≤1500, every cutoff: both inequalities hold; n=12,x=6: 2≤2, 16≤18 | sound |
| `orientedStep` (165) | R | ℤ: (3,3,3)→(3,3,6) is oriented (transposition fixes the root); (3,6,15)→(87,6,15) is reversing but not oriented; 𝔽₂: oriented successors of 111 are all four points | sound; S01 for Checks |
| `traceOrder` (169) | K, t | 𝔽₅: t=3 gives 10, −I gives 2; 𝔽₄: t=0 gives 2, t=a gives 5; 𝔽₇: t=1 gives 6, t=6 gives 3 | sound |
| `semisimple_orbit_congruence` (174) | K, Fintype, 3≤q, t≠±2, hx, two nonzero coordinates | every admissible t and every orbit at q=4,5,7,8,9,11,13,16 (69 orbits): modulus divides the orbit; q=4,t=a: 5∣10; q=16,t=1: 3∣18 and 3∣252 (the 18-orbit is the non-epimorphic SL₂(𝔽₄) locus); q=9,t=3: 2∣64 | sound, including even q and the non-epimorphic locus |
| `valuation_orbit_congruence` (186) | same, ℓ odd prime | same 69 orbits, ℓ∈{3,5,7,11,13}: no violation; q=4,ℓ=5: r=1,s=0, 5∣10 | sound; r−s truncated equals max(r−s,0) since ord ω∣q±1 |
| `oriented_card_dvd` (198) | p, Fact, hx, x≠0 | Γ⁺-orbit sizes 4,0,40,28,88,208,340 at 2,…,17; each nonempty size divisible by p | sound |
| `oriented_transitivity` (204) | p, Fact, htrans | p=2: one oriented orbit of 4; p=3: no points; p=5: one oriented orbit of 40, not two of 20 | sound |
| `mpCondition` (214) | p, Fact | roots of T²−3T+1: p=5 double root 4 (branch 1); p=7 nonsplit order 8, 64<8192 false; p=11 split roots 5,9 order 5, 25<12288 false; p=13 branch 1; p=19 order 9 false; p=23 order 24 false | matches MP18 (see above) |
| `primitivePoint` (220) | n, x | n=65: (3,3,3) true; (55,55,55) false (zero mod 5); primitive counts 40, 8320, 394240 at 5, 65, 770 | sound |
| `signStep` (224) | R | 𝔽₅: successors of 333 are 322, 232, 223; 233 excluded; 𝔽₂: equality | sound |
| `block_action_primitive` (230) | p, 5≤p, MP, htrans, r, six hypotheses | Q₅, Q₁₃ primitive (every identification of two blocks generates the universal relation); the sign relation satisfies all hypotheses and gives the first disjunct, the universal relation the second | sound |
| `squarefree_transitivity` (243) | n>1, squarefree, hlocal, hprim | n=65: V-orbit of 111 has 8320 = 40·208 points = primitive locus | sound |
| `squarefree_positive_lifting` (252) | same, c∈{1,3} | 112 and 336 lift their reductions with 6=6 and 54=54 | sound |
| `squarefree_integral_image` (263) | same | n=65: image 1+8320=8321 of 8569 points; (40,40,40) on M (3·40²≡3·40³≡55), zero mod 5, (1,1,1) mod 13, no lift; (55,55,55) on X likewise | both directions |

### Target ledger

| Subsection | Instances; values | Result |
|---|---|---|
| Conventions (19–29) | twist 111↦333, 112↦336; 𝔽₃: #M*=8, #X*=0; commutator [A,B] for the two unipotents has trace 3 = 4+4+9−12−2; identity pair 2 = 4+4+4−8−2; 𝔽₄ trace a nonsplit of order 5 with square discriminant | consistent |
| 0.1–0.4 | counts 4,8,40,28,208 at 2,3,5,7,13 equal root V-orbits; 𝔽₂ star: root adjacent to three leaves, R₁ fixes 011 | consistent |
| 1.1–1.4 | weights at (0,1,2) over 𝔽₅: (0,3,3), sum 1; all 3264 points at p=5,…,31 satisfy total 1 and complementarity; 3∤8 at p=3 | consistent |
| 2.1–2.4 | slices at 5: a=0 → 8, a=±2 → 10, a=±1 → 6; at 7: 0,0,0 and 6,8,8,6; at 13: 24,26,26 and 12 or 14; orbit formula exact at eight primes; Φ(ℓ)=2−1/ℓ | consistent |
| 3.0 Kummer bound | ℙ¹∖{1}, f=X, S={0,1,∞}: sum −1 ≤ √5; f=X on ℙ¹: 0≤0; X(X−1): −1; X(X−1)²: −1; E:y²=x³−x: #E=8, sum −2, dimensions 0 and 2, bound 2√5; dim H¹_c anti-invariant = (2g−2+r)+(s−r) = 2g−2+s re-derived | consistent |
| 3.0 CZ13 and low-order | x+y=1 over 𝔽₅, m=n=4: 3 torus points ≤ max(3·32^{1/3}, 38.4); CZ13 line 132 has 3∛2(deg u deg v χ)^{1/3} and 12 deg u deg v/p; BGS16 lines 802–808: exceptional set ≤z^δ, at most 11d³+d points | consistent |
| 3.0 totient | 1=1, 2=2, 3≤6; no violation to n=2000 | consistent |
| 3.0a | Γ·111 = V·111 at 2,3,5 (4,8,40) | consistent |
| 3.1 | (0,1,8), (9,0,6), (2,0,3) on X*(𝔽₁₃) with orders (4,6,7), (12,4,14), (1,4,14) | consistent |
| 3.2 | discriminant a²b²−4(a²+b²), χ(0)=0 | consistent |
| 3.3–3.4 | inverse-pair halving at p=13, φ(12)/2=2 primitive traces; exponents −ε/3 and −1/2+δ decay | consistent |
| 3.5 | |uvw| ≤ (2/3)Σu² on the cube; |α|≤20 under every embedding; BGS16 line 775 | consistent |
| 3.6–3.7 | complements 0 at 5,7,13; coefficient bridge at 3 via M* | consistent |
| 4.0 | x²+1 has residues 2,3 mod 5 and no integer root; (40,40,40) mod 65 | consistent |
| 4.2–4.4 | complement <p and p∣complement give 0; X(𝔽₃)={0}; full graph at 5 has components 40 and 1 | consistent |
| 5.1 | bidegree (2,2), four boundary points, χ=4; (3/2)max((32td)^{1/3},16td/p) from CZ13 Corollary 2 halved | consistent |
| 5.2–5.4 | M₆(12)={4,6}; M₁(5)=2; d≤108M³ or d≥p/(24M) from the two branches; 2√(2p)/M irrational so strictness is immaterial | consistent |
| 5.5–5.6 | D(25)→D(9) ratios 9/25, 3/5, 1; terminal pair (1,1),(3,5): true ratio 3/5, separate minima 1; padding 5→3→6 | consistent |
| 5.7–5.8 | reduced list to 120; 27, 768 rejected; domination to n=300 | consistent |
| 5.9–5.10 | 1+2T+2T²+T³ at 12; C₁(8)=1; central bound to n=1500 | consistent |
| 5.13–5.14 | 108·8=864; 1458·256=373248; ×4=1492992; [4,10],[6,18]⊂[4,18]; p⁵>8·384¹⁶ from p≈2.9·10⁸; M₁(5)=2, K₅⁻=48√5 | consistent |
| 6.0 | C24 Theorem 3.5.1: deg ≡ 0 mod 12e/gcd(12e,md), equivalent to 12e ∣ md·deg; Corollary 4.12.5(a) as stated; D₁₀: k∣m; SL₂(𝔽₅): 120∣960, 120∣1920; SL₂(𝔽₄) nonsplit centralizer 5 | consistent |
| 6.1–6.2 | 𝔽₇: A=diag(2,4), B=[[0,6],[1,0]]: traces (6,0,0), commutator trace 34≡6; C24 Proposition 5.2.16(d): two nonzero coordinates; orders 6 and 3 for traces 1 and 6 | consistent |
| 6.3–6.5 | C24 Theorem 5.4.4: 2|O| ≡ 0 mod n/gcd(n,2m/n), shown equivalent to n/gcd(n,4m/n) ∣ |O| by 2-adic valuation; even q corrected by splitting (5∤3 at q=4); Theorem 5.5.9 as stated | consistent |
| 6.6 | swap fixes (3,3,3), 27=27, nonzero for p≠3; C24 lines 4655–4660 | consistent |
| 7.1–7.3 | 8320 primitive of 8569 at 65; blocks 10 and 7 at 5 and 7; Q₂=S₄ from three star transpositions; MP values as above | consistent |
| 7.4–7.4a | Q₅,Q₇,Q₁₁,Q₁₃ primitive; rotation cycle types [2,3,5], [3,4], [3,3,5,5,6], [2,2,2,3,3,6,7,7,7,13]; the 11-word has type [3,8,11]; swap at 11 has nine 2-cycles (odd); AGL₁(𝔽₅): 20<60, 5<8 | consistent |
| 7.5a–7.5 | Y*(7)=7 prime power, rotation⁴ fixes 4 blocks; p²−1=q(q²−1) with q<203897: only (11,5); orders 30=30 | consistent |
| 7.6 | 394240 at 770; two elliptic coordinates of order ≡0 mod 4 exist for every 11<p≤121, p≡3 mod 4 (e.g. (6,6,8) at 19, orders 20,20) | consistent |
| 7.7–7.8 | 8320, 8321, 8569, 248 mixed | consistent |

## Not verifiable

- M25 (Theorem 1.4, §2, Conjecture 1.1) and DM96 (Theorems 1.6A, 4.3B, 4.7A, 5.3A, 5.5B): settled uncertified, cited by locator only; the weight argument and the primitive-group statements were checked directly or against MP18 lines 1345–1375 instead.
- MP18's typeset threshold: the OCR renders it "32√p + 1" at lines 102, 492, 537, 559 and "32√p − 1" at line 637; the reading 32√(p+1) was established from the proof's inequality chain (lines 978–983), not from the typeset formula.
- §3.3's main term Lφ(p−1)/(2(p−1))+O_ε(p^{1/2+ε}) and the BGS16 equations (25)–(33): not recomputed.
- §3.0's arithmetic elimination constants A_d, C_d (CKSZ14 §4): shape checked at lines 286–292 and 440–444; constants not re-derived.
- §6.0's stack constructions and the m∣24, m∣12 exponents: taken from C24 Theorems 3.5.1, 4.10.5, 5.4.3 as statements; proofs not re-read.
- Lean: nothing was run; the worker's elaborated-signature record (33 declarations) was compared with the source and the README instead.
- Ownership against open pull requests whose files the brief does not list was checked only through the roadmap search service (readme and lean greps listed above).

## Source issues

- **Error** in C24 at Theorems 5.4.3 and 5.4.4, final clauses, printed pages 412–413: the source says that for even q the discriminant is always a square, so the q−1 case applies; it should distinguish by splitting of T²−tT+1 and use q+1 when irreducible (q=4, t=a has order 5, not dividing 3); affects a stated result.
- **Error** in C24 at Theorem 5.5.8(b), printed page 417: the source says X and M satisfy full strong approximation modulo squarefree n; it should say the image is the origin together with the primitive locus ((40,40,40) modulo 65 lies on M and has no integral lift); affects a stated result.
- **Error** in C24 at the proof of Theorem 5.5.8, printed page 417: the source says M(𝔽₃) consists of two singleton orbits; it should be the origin and the eight-point orbit {±1}³; affects the proof.
- **Error** in C24 at Theorem 5.5.7(b), printed page 416: the source says the absolute trace −2 level stack is connected for every prime outside the exceptional set; it should exclude 2 and 3, where the epimorphic locus is empty; affects a stated result.
- **Misprint** in C24 at Theorem 5.5.3, printed page 415: the source says an orbit exists for every prime with the estimate for large p; it should quantify over sufficiently large primes, since X*(3) is empty; affects nothing.
- **Error** in C24 at Lemma 5.3.1, parenthetical remark, printed page 405: the source says a nonzero pair of second and third traces excludes dihedral type; it should require two nonzero coordinates among all three (over 𝔽₇ the dihedral pair with traces (0,6,0) has a nonzero pair); affects nothing.
- **Error** in EFLMT24 at Lemma 2.1 and its proof, printed pages 4–5: the source uses three boundary points and coordinate degrees t and d for the cubic; it should use four boundary points, χ=4 and degrees 2t and 2d, giving (3/2)max((32td)^{1/3},16td/p); affects a stated result (the constants of Lemma 2.1, Proposition 2.4 and Theorem 3.2).
- **Error** in MP18 at the proof of Corollary 5.11, printed page 25: the source says p(p±3)/4 is never a prime power for p≥5; it is 7 at p=7, where the alternative fixed-point argument given in the same sentence applies; affects the proof.
- **Gap** in MP18 at Notation 5.2 and the proof of Theorem 1.6, printed pages 20–22: the source says computer simulations indicate Q_p is symmetric for p=2,5,7,11 and that transitivity at 770 was verified by computer; neither is proved in the text; affects the proof.
- **Misprint** in MP18 at Lemma 5.13, footnote 14, printed page 26: the source says the only equal-order case below one million is p=5; it should be the pair (p,q)=(11,5) under the proof's p>q convention; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "071f95f7717b64a76119156203541373e2ff968b", "job": "RT-ArithmeticDynamicsPartII~2b", "model": "fable", "worker": "chris-k"} -->
