<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13007#issuecomment-6781815054 -->
Review (codex) of 32141ad

Verdict: needs_changes

1. **F01** (P2) Import the existing congruence composition-factor obstruction

   **Location:** `packages/NonabelianLevelStructures/README.md:970`, with its proof at 972, scope claim at 7, and application at 986. The target starts: “For every n ≥ 1, every nonabelian simple composition factor of SL₂(ℤ/n) is isomorphic to PSL₂(𝔽_ℓ)”.

   **Claim:** §7.7 assigns the congruence composition-factor theory to this roadmap, and §7.8 rebuilds the alternating-group obstruction from it.

   **Witness:** `TauCetiRoadmap/NoncongruenceModularForms/README.md:861` on main already owns this obstruction; lines 867–879 give the same prime-power reduction and alternating-group argument. Its `Suggested.lean:211` states `compositionFactor_of_isCongruenceSubgroup`.

   This is duplication by mathematical object, not a same-name collision. The existing owner treats projective coset monodromy and states the constituent SL₂(ℤ/N) argument explicitly. The application here already passes to the projective absolute level curve N_p, so this distinction does not require rebuilding that argument. Its central involution acts trivially, as §5.2 records. The main-branch owner is an admissible earlier supplier.

   **Exact repair:** add NoncongruenceModularForms §3.5 to Scope and ownership and Exact supplier contracts, consuming its composition-factor obstruction and its consequence for alternating/symmetric monodromy of degree at least six. Delete the independently owned §7.7 target and proof. In §7.8 import that obstruction and keep the genuinely new application identifying Markoff monodromy and transferring noncongruence from its projective quotient. Update the layer dependencies and internal references. If an SL₂/projective comparison is needed, state only that adapter, with its central-kernel hypothesis; do not plan the CRT, prime-power-kernel or factorial theory a second time.

   **Repair test:** at p=5, N_p has degree 10 and monodromy S₁₀. The imported obstruction applies because A₁₀ is simple and 10!=3,628,800>10³=1,000. The exception remains correct: A₅≅PSL₂(𝔽₅), with 5!=120=5(25−1). At level 25 the reduction kernel has order 125, SL₂(𝔽₅) has order 120, and the sole nonabelian factor has order 60. These are precisely the existing owner's objects, including the package's three Checks. This is a local ownership repair, not rejection of the roadmap's scope.

2. **F02** (P3) The displayed inertia cosets are right cosets

   **Location:** `packages/NonabelianLevelStructures/README.md:307`: “a left coset ⟨φ_x(γ∞^δ)⟩h”; the terminology recurs at lines 313, 318 and 397.

   **Claim:** the subsets Hh and the orbit set H∖G for the left multiplication action are called left cosets.

   **Witness:** in S₃, with right-to-left composition, H=⟨(12)⟩ and h=(123), Hh={(123),(23)}, whereas hH={(123),(13)}. Mathlib's `GroupTheory/Coset/Basic.lean:170` identifies left multiplication orbits with right cosets.

   **Exact repair:** change these four uses to “right coset(s)”, or “orbits for left multiplication by H”. Preserve the actual Hh formulas and the left Π-action. Add the displayed S₃ computation as a negative-control Check; do not replace Hh by hH. The precise pin conventions are `Mathlib/GroupTheory/Coset/Basic.lean:56` (`mem_leftCoset`), line 60 (`mem_rightCoset`), and `Mathlib/GroupTheory/Coset/Defs.lean:106` (`rightRel`). CHEN2024 line 3134 has the Hh formula and does not justify reversing the terminology.

   **Repair test:** H has two elements; (23) lies in Hh but not hH, and (13) lies in hH but not Hh. Thus the corrected label agrees with the actual gluing orbit and excludes the plausible wrong quotient. All formulas and cusp counts survive the repair.

Two findings: one P2 ownership defect and one P3 convention defect. All nine findings of round 2 are repaired. The authored README, Suggested.lean, metadata, source manifest and design were not changed. The mathematical acceptance statements elaborate; no padding was found.

## Verified sound

### Previous findings, checked before the new pass

The nine-item repair report was checked against the actual package. None was marked not actionable; none is re-raised. Short quotations below are from the repaired roadmap, not from sources.

| Round-2 finding | Repaired passage and location in `packages/NonabelianLevelStructures/README.md` | Status and verification |
| --- | --- | --- |
| R01, truth of CFSG unowned | Line 120: “every nonabelian finite simple group G, in every universe”; “includes the passage from the list to all finite simple groups” | Repaired. The same full statement is in the plan's Vdovin gap. `TauCeti.ClassificationStatement` remains only a proposition, not an assumed proof. A₇: 12³=1728<2520; A₅ is correctly excluded, since 5³=125>60. |
| R02, two ArithmeticDynamicsPartII duplicates | Line 203 takes the quotient map from §6.0; line 776: “ArithmeticDynamicsPartII §6.1 identifies both loci with the punctured Markoff surface X*(𝔽_p)” | Repaired. Current head #1686, README lines 776 and 810, supplies these objects. Retained quotient-map properties and arbitrary-field epimorphic-locus results are distinct. R01 above is a different duplication discovered by object search. |
| R03, strict sign enlargement in characteristic two | Line 657: “Over every ring in which 4 ≠ 0”; “the even sign changes are the identity and the two groups coincide” | Repaired, including Conventions and the new Check. Vieta/permutation moves fix (2,2,2), while a double sign sends it to (−2,−2,2); these differ if 4≠0. Over 𝔽₂ and its dual numbers every sign map is identity. |
| R04, marking versus ramification | Line 132: “where the origin is unramified, the marking is the whole étale origin fibre and R_π is empty”; lines 473 and 547 restrict the R_π interpretation | Repaired throughout. Identity cover: marking degree 1, ramification degree 0. S₃ with inertia C₃: both degrees 2. The origin stabilizer formula itself still includes the unramified case. |
| R05, embeddings allegedly change existing periods | Line 812: “the embedding preserves the γ∞-period of every point of the smaller slice” | Repaired. The F₅ orbit of (0,1,2) has period 4 over both fields. The added F₂₅ slice calculation gives 49 points, one fixed and 48 of period 6; the F₅ slice has one point. |
| R06, eigenlines incorrectly excluded | Line 827: “every nonzero vector has period ord(λ) = n_q(a), whether both of its eigencoordinates are nonzero or it lies on an eigenline” | Repaired. Over F₇, L₁(1,3)=(3,2)=3(1,3); ord(3)=6. The repeated-root exclusion is separately justified by t≠2. |
| R07, obsolete mapping-class locator | Line 185: “MappingClassGroupsAndCanonicalRepresentations §2.3” | Repaired in all uses and both gap entries. Board README line 864 supplies the section; its genus-one Check distinguishes SL₂(ℤ) from PSL₂(ℤ). |
| R08, obsolete Belyi successor caveat | Line 17 names “BelyiMaps Layer 10 §10.4”; line 48 names the pinned existence theorem | Repaired. Main README line 4115 and Tau Ceti's `FieldTheory/FunctionField/Belyi/Existence.lean:163` agree, including exact constants and algebraicity over ℚ. |
| R09, coarse point allegedly only records j | Line 929: “above j = 1 lie 208 distinct geometric points” | Repaired. A coarse level point retains level information; the j-map has 208 distinct points over that value. Twists keep the same j-value. |

The recurrence search covered the rest of the package: unramified markings, eigenline exclusions, field-extension periods, unconditional strictness of sign enlargement, CFSG-as-proof, obsolete C.0, Belyi successor language, and confusion between a coarse level point and its j-image. The new coset terminology finding records its four occurrences.

### Principles, organisation and shape

Read all 47 numbered targets in eight layers, their API bullets, Checks, routes, dependencies, conventions and summary. For unchanged mathematics, only the explicitly computed rows of round 2's adversarial table were inherited; its descriptive assurances were not used as mathematical evidence. Every repaired passage and all 15 newly selected targets were inspected afresh. The report below concentrates the computed table on those targets, the headlines and the new findings, as required by the comment size limit.

The scope builds a general finite-group library, integral rank-two trace theory over arbitrary commutative rings, and arbitrary finite-field slices. Characteristic two, small fields, nilpotents, unramified origins and the trivial group are retained; the odd-prime Markoff endpoint is a stated mathematical application. No route-specific replacement, computational algorithm, copied source passage, sorry'd data or `set_option` was found. R01 is the one ownership violation found.

The shape was compared with main's StableReduction, SchemeAndStackFoundations and NoncongruenceModularForms. All eight layers have Examples and Dependencies. All 47 targets have their individual Needs lines and source locators. The 17 defining/API sections have respectively 4,4,4,4,3,3,3,3,3,5,6,3,4,4,3,4,3 Checks, each read against its formulas. The tests distinguish actions, quotients, exceptional fields, normalizers and degenerate fibres; R02 adds the missing noncommutative coset convention witness. No target-number catalogue, process narrative, machine path, HTML anchor, forbidden import or LaTeX delimiter was found in the authored roadmap or Lean file.

The mathematics forces the main spine: gluing and normalization → finite cusp invariants → automorphism exact sequence → obstruction pair → combinatorial congruence → simple-group bound. Trace coordinates → rotation orders → SL₂ vertical groups and the Markoff endpoints is a second mathematical branch. The headings name these objects, not source chapters. The summary says it develops the remaining theory on the existing stack supplier, not that the build follows a source's chapter order. The source's chapter arrangement alone is not used as a dependency.

### Adversarial mathematics: values and negative controls

F means freshly recomputed here, by explicit algebra or the scratch finite enumerations. I means an unchanged computed witness inherited from round 2, with its hypotheses and current statement reread. No row marked I is merely an earlier “sound” summary. The finite computations test the statements; they do not constitute proofs of the universal targets.

| Statement | Instances tried | Values on the two sides | Result / change |
| --- | --- | --- | --- |
| Conventions: Fricke and anti-action (F) | Integral unit unipotents; trace triple (2,3,5) | tr[A,B]=3=4+4+9−12−2. Correct anti-action gives (2,1,3); reversed order gives (2,5,7). | Signs and precomposition direction discriminate; no change. |
| §0.1 and repaired §§2.3,3.2 (F) | G=1; unramified C₂; S₃ inertia C₃ | Marking/R degrees 1/0, 2/0, 2/2. A∩⟨1⟩ has order 1; S₃ marked inertia intersection has order 3. | Distinction and c≠1 restriction repaired. |
| §0.2 Higman invariant and strata (F) | C₂; S₃; trace −2 over F₇ | Inertia orders 1 and 3. (−I+E₁₂)⁻¹=−I−E₁₂; coefficient ratio 6 is not in square set {1,2,4}. | Peripheral inversion can exchange the two strata; root choices retained. |
| §0.3 branch cycles (F) | C₁,C₂,C₃ | Generating-pair counts 1,3,8; coarse counts after central inversion 1,3,4. C₃ has 0 fixed generating pairs under inversion. | Correct stack/coarse distinction. |
| §0.4 deformation and density (F) | r=1,2; dual-number tangent test; C₂³ | Λ[[t]] has basis {1} or {1,t} over T=t^r; differential at t=0 is 1 or 0. Two generators span at most 4<8 elements of C₂³. | Smooth density compatible with ramification, and the empty level case is accounted for. |
| §0.5 quotient properties, repaired (F) | Identity; C₂→1; C₂²→C₂; C₂³→C₂² | Degree 3→1; six generating pairs map onto three, fibre size 2; zero generating pairs map to a target with six. | Two-generation of the source needed. Construction imported. |
| §0.6 absolute/intermediate levels (F) | C₂; SL₂(F₇) trace −2 | Out(C₂)=1, so degree stays 3. Determinant-3 conjugation multiplies the upper entry by nonsquare 3, exchanging two classes. | Free outer action and need for a stable union of strata hold. |
| §0.7 cofinality/Belyi (F) | ℚ̄(t), β=t; open P¹ minus three points | Degree 1, branch set ∅⊆{0,1,∞}; open complement has size 3. An affine finite cover cannot surject finitely onto proper P¹. | Open U is essential; no replacement by all of X. |
| §1.1 gluing and §1.2 normalization (F) | One-gon, two-gon; index-two node | Graph V=E=1 or 2. Node special fibre basis {1,ξ,η} has length 3; generic rank is 2. | Loops retained; flatness at the ramified node correctly not imposed. |
| §1.3 finite data and §1.7 well-definedness (F) | S₃, H=⟨(12)⟩, h=(123) | Hh={(123),(23)} versus hH={(123),(13)}. Both have size 2, but differ in one element. | R02: call Hh right cosets; size-only checks cannot detect the mistake. |
| §1.5 balance and connectedness (F) | S₃ u=(123),h=(12); C₂² u=1,h≠1 | h⁻¹u⁻¹h=u; M=C₃ has index 2. In C₂², ⟨u,h⟩ has size 2<4 and graph has two components. | Balance word and connectedness iff pass both directions. |
| §1.6 invariant set (I) | C₂,C₃,S₃,D₁₀ | Number of invariant classes 2,4,2,4. Changing h to uh and simultaneous conjugation leave the quotient class unchanged. | Nontrivial quotient examples retained. |
| §1.7 standard cusp (F) | u=1 in C₂,C₃; rotation/reflection in S₃ | M=1 gives 2 or 3 rational polygon components; S₃ gives M=C₃, index 2. In each cyclic polygon b₁=E−V+1=1. | Formula realizes the intended cusp; terminology repair only. |
| §1.8 classification headline and Higman word (F/I) | S₃ pair; trivial group | [u,h]=(132), [u⁻¹,h⁻¹]=(123); conjugator uh=(13) exchanges them. Trivial group has one cusp and Higman 1. | Word transport correct; full groupoid carrier remains unavailable at pins. |
| §1.9 inversion (I) | C₃,u=1; C₂ | C₃ sends [[1,h]] to distinct [[1,h²]]; C₂ sends its class to itself. | Lift criterion distinguishes both cases. |
| §2.2 exact sequence; §§2.1–2.3 headline (F) | S₃ rotation/reflection; C₃ u=1 | (|Z|,|u|,k,|A|)=(1,3,1,3),(3,1,1,3); image/kernel sizes 3/1 and 1/3. | |A|=|Z||u|/k gives 3 in both cases; wrong injective evaluation excluded by C₃. |
| §2.4 full levels (I) | n=2,3 | |SL₂(F₂)|=6 and −I=I; at n=3 coarse degree 24/2=12 with φ(3)=2 components. | n≥3 exceptional-stabilizer restriction is necessary. |
| §2.5 odd-dihedral obstruction (F) | D₆,D₁₀,D₁₄ | Generating pairs 18,60,126; coarse orbits respectively 1,2,3 of size 3. (|c|,m′,d′)=(3,3,1),(5,5,1),(7,7,1). | Divisor k/gcd(k,k)=1 divides 3; source d′=2 is corrected. |
| §3.1 positive Nielsen orbits (F) | C₁,C₂,C₃,S₃ | Coarse orbit sizes 1,3,4,3; C₃ raw orbit has size 8. For S₃, [u,uv]=(132), [vu,v]=(123). | Preserve commutator conjugacy, not its literal value. Real Lean bodies have the right multiplication order. |
| §3.2 obstruction definitions (F/I) | D₁₆; empty family in C₃; G=1 | 96 generating pairs; cusp intersection sizes {2,4}, lcm 4 rather than product 8; d′=8/4=2. Empty lcm=1; at G=1, m′=d′=1. | No zero denominator in finite-group headlines; aggregation discriminates. |
| §3.3 combinatorial headline (F/I) | Trivial and cyclic groups; S₄; SL₂(F₅); A₇ | C₁ divisor/orbit 1/1, C₂ 1/3, C₃ 1/4. S₄ 3 divides 9; SL₂(F₅) 5 divides 40 and 3 divides 72; A₇ 7 divides 42. | Headline is substantive, includes nonabelian examples, and matches the coarse-orbit signature. |
| §4.1 square subgroups (I, arithmetic rechecked) | SL₂(F₅), ℓ=5; D₁₀, ℓ=5 | First: r=1,s=0,v₅(m′)=0, so 0≤⌊1/2⌋=0. Second: v₅(m′)=1 but normal C₅ has order 5, and no order-25 subgroup exists. | The normal-subgroup hypothesis excludes the negative control. j=0 argument avoids the source's faulty general-j powering step. |
| §4.2 simple-group headline and repaired Vdovin gap (I/F) | A₇, ℓ=7 and 17; A₅ | |A₇|=2520≤7⁶=117649; r=1 gives 7^1 dividing 42. At ℓ=17, r=0, threshold 4913≥2520 and divisor 1. A₅ has C₅ with 125>60. | Threshold, ceiling and PSL₂ exclusion pass. Arbitrary-universe statement now has a precise supplier contract. |
| §5.1 integral character quotient headline (I/F) | (I,I), (nontrivial unipotent,I); reduction to F₂; zero ring | Both first triples are (2,2,2), although pairs are not conjugate; reduction is (0,0,0); both coordinate algebras over the zero ring are zero. | Categorical quotient is not all-orbit classification; arbitrary base change not replaced by Reynolds averaging. |
| §5.2 repaired strictness (F) | ℤ,F₃,F₂,F₂[ε]/ε²,ℤ/4 | Vieta fixes (2,2,2); double sign gives (−2,−2,2), distinct over ℤ,F₃. In char 2, −1=1. At ℤ/4, 4=0 and this witness coincides. | Exact sufficient condition 4≠0, no unsupported conclusion at ℤ/4. Single-sign levels over ℤ are 2 versus 4. |
| §§5.3–5.4 ring and trace controls (I) | Unit/off-diagonal entries 2 and 1; diagonal(3,4) over F₁₁ | Fricke-minus-2 values 1 versus 4; generated algebra full versus integral index 4, becoming full over ℚ. Diagonal element order 5, trace 7, square trace 3, inverse trace 7. | Unit rather than nonzero criterion; primitive-root powers need not preserve trace. |
| §§5.5–5.7 admissible traces, outer group, normalizer (I) | q=2,3,5,7; q=4,5; n=1,2 | Admissible traces {1},{0},{1,3},{3,4,5,6}. Diagonal outer orders gcd(2,3)=1, gcd(2,4)=2; at q=5, N/C has 120 elements, inner image 60. diag(ω,1) sends transvection entry 1 to ω≠1 over F₄. | Small-field exceptions and quotient by G·C retained; scalar n=1 case correct. |
| §6.1 epimorphic loci, repaired (F/I) | q=2,3; (I,I); prime zero levels | SL₂(F₂) has an epimorphic pair of trace 1 but no non-dihedral pair. Over F₃, the indicated generators generate 24 elements and trace triple (2,0,1) has commutator trace 0. Identity pair has trace 2 and scalar algebra. Prime p=3 zero locus has 0 points, p=5 has 40. | Claims (a)–(c) survive; prime-field trace −2 equality imported rather than re-owned. |
| §6.2 branch cycles (F) | X*(F₅) and eight further primes | At p=5, cycles (14,20,8); γ∞γ₁₇₂₈γ₀ is identity on all 40 points. Over ℤ, γ∞(3,3,3)=(3,3,6). | Sign and composition convention agree with pinned permutation triples. |
| §6.3 slices and repaired embeddings (F) | F₅→F₂₅; a=0,t=3 and a=1,t=4 | (y,z)=(1,2) cycles through (2,4),(4,3),(3,1), returning after 4 in both fields. Degenerate slice sizes 1 and 49; larger-field orbit distribution: one fixed point, eight 6-cycles. | Every old period preserved; only new points added. |
| §6.4 repaired eigenline proof (F) | F₇,a=1,t=6,(y,z)=(1,3) | Conic value 1+9−3+(1−2−6)=0; L₁(1,3)=(3,2)=3(1,3), period ord₇(3)=6. | Eigenlines included. Fixed Jordan lines give 2−t≠0, so their exclusion is valid. |
| §§6.3–6.5 all finite-field slice cases (F/I) | All a,t≠2 for q=3,5,7,11,13; F₄ | 334 slices, zero count or period mismatches. Counts 0/2q, q−1/2q−1, q+1/1 according to case. F₄,a=0,t=1: four points, two swap 2-cycles. For a²+a+1=0, polynomial values 1,a,1,a have no zero; matrix order 5. | Nonsplit degenerate count is 1, not 0; characteristic-two polynomial criterion needed. |
| §6.6 SL₂ vertical automorphisms headline (I) | F₇ traces 3,6; dihedral subgroup of SL₂(F₄) | Companion orders 8 and 3; intersections with scalars have sizes 2 and 1. Dihedral cusp automorphisms have size 5, center size 1. | Non-dihedral restriction is essential; geometric representability is not replaced by a scalar-only assertion. |
| §§7.1–7.3 component/degree/genus headlines (F) | Nine prime fields, table below | Degree and cycle counts give 2−2g=c₀+c₁₇₂₈+c∞−D, with genera 0,0,1,5,10,9,18,35,38. | Two-copy interpretation uses the two Higman classes; positive orientation action transitive in each computed fibre. |
| §7.3 lower bound (I, arithmetic rechecked) | p≥2304; smaller primes ≥13 | At 2304, p²/12=4p^(3/2); subtracted divisor sums <3p^(3/2). Earlier exact finite check: 337 primes below 2304, minimum genus 5 at p=13. | Threshold and no natural-subtraction truncation; no change. |
| §7.4 rational j finiteness, repaired (F) | p=13, j=1 | D=13·16=208, genus 5≥2, 208 geometric points over one nonbranch j-value. | Faltings applies to rational points on the component; only their j-image is asserted finite. |
| §§7.5–7.6 projective monodromy headline (I/F) | Nine prime fields | All sign blocks have size 4; degrees 10,7,22,52,85,76,115,232,217. Branch parities (0,1,1) at 5,7,11,23; (0,0,0) at 13,17,19,29,31. At 7, root order 8<32√8. | Parity rule consistent; p=7 fails P_MP and is not a counterexample to the headline. |
| §7.7 composition factors (F) | n=1,6,25 | Orders 1,6·24=144,125·120=15000; first two solvable, last has factor PSL₂(F₅) of order 60. | Mathematics correct; R01 moves ownership to existing main supplier. |
| §7.8 noncongruence headline (F) | d=5,6,10 | 5!=5(25−1)=120; 6!=720>216=6³; 10!=3628800>1000=10³. | Correct obstruction for actual d≥10; R01 imports the existing theorem. |

For the inherited A₇ witness, permutations on {0,…,6} are u=(1,2,3,4,5,6,0), v=(0,2,1,4,6,3,5), in image-list notation. The earlier enumeration gives generated group order 2520, commutator (6,3,1,0,2,4,5) of order 7, and coarse orbit 42. Thus the headline test is a specified finite instance, not an unspecified large-simple-group example.

Fresh branch-count table (all nine rows of the package's table):

| p | D | c₀ | c₁₇₂₈ | c∞ | (D−c₀−c₁₇₂₈−c∞)/2+1 |
| ---: | ---: | ---: | ---: | ---: | ---: |
| 5 | 40 | 14 | 20 | 8 | 0 |
| 7 | 28 | 10 | 15 | 5 | 0 |
| 11 | 88 | 30 | 44 | 14 | 1 |
| 13 | 208 | 70 | 104 | 26 | 5 |
| 17 | 340 | 114 | 171 | 37 | 10 |
| 19 | 304 | 102 | 152 | 34 | 9 |
| 23 | 460 | 154 | 231 | 41 | 18 |
| 29 | 928 | 310 | 464 | 86 | 35 |
| 31 | 868 | 290 | 435 | 69 | 38 |

### Sources: all 15 seeded targets

All numbered locators below were opened in the legal cached texts, with theorem numbers, printed pages and hypotheses compared to the statements. CHEN2024 uses the published author copy; its extraction page is printed page minus 300. The source's errors are distinguished from the package's corrected statements below. No unresolved author-flagged locator was found. All six cited works have a single manifest key; four texts are available, two have settled uncertified status. No manifest change or new reference request was necessary.

| Target | Text and exact locator inspected | Support and qualifications |
| --- | --- | --- |
| 0.2 Higman invariant and strata | CHEN2024 line 1070, Definition 2.3.1/Proposition 2.3.2, p.327; line 1101, Remark 2.3.3/Definition 2.3.4, p.328; line 1821, Situation 2.5.14, p.346 | Cotangent character, fixed roots, locally constant strata, peripheral [b,a] orientation agree. |
| 0.3 branch cycles | CHEN2024 line 1380, Theorem 2.5.2(3)–(7), pp.335–338, through line 1494 | Elliptic stabilizers, three words, coarse central quotient and characteristic-zero comparison match. The analytic Nielsen input is declared separately. |
| 0.4 deformation/density | CHEN2024 line 1502, Proposition 2.5.3, pp.338–339; line 1590 through 1620, deformation calculation and Corollary 2.5.4, pp.340–341 | T↦t^r, characteristic prime to group order, framed deformation and density match. Two missing formal comparisons are declared gaps. |
| 0.6 absolute/intermediate levels | CHEN2024 line 1808, discussion and Definition 2.5.13, p.346; line 1821, Situation 2.5.14 | Free Out(G)-action, quotient sheaf, and intermediate subgroup agree. The package puts the sheaf over the correct base despite the source's slip. |
| 1.1 gluing datum | CHEN2024 line 2423, Definitions 4.1.1–4.1.3, pp.361–362; line 2652, Definitions 4.4.1–4.4.2, p.367 | Characteristic zero, equivariant reduced fibres, nodal target and torsor away from markings retained. Source's node-flatness convention is corrected rather than copied. |
| 1.5 balance/connectedness | CHEN2024 line 2863, Proposition 4.5.2, pp.372–373; line 2987, Definition 4.7.1, p.375; line 3077, Proposition 4.7.6/4.8.1, pp.377–378 | Inverse inertia conjugacy and generation/connectedness criterion agree. |
| 1.7 standard cusp | CHEN2024 line 3113, Definition 4.8.3, pp.378–379; line 3364, Theorem 4.10.3(c), p.385 | The two left actions and Hx↦Uhx formula agree; R02 concerns only the package's coset terminology. |
| 2.2 automorphism exact sequence | CHEN2024 line 3290, Proposition 4.10.1, pp.383–384; line 3340, Theorem 4.10.3, pp.384–385 | Central kernel, commutator evaluation, index k and marking stabilizer agree for generating pairs. |
| 2.5 odd-dihedral example | CHEN2024 line 3493, §4.11, p.388; CHEN2018 line 1386, Theorem 4.2.2, preprint p.29 | φ(k)/2 components of degree 3 and ramification k supported for odd k≥3. The package correctly uses d′=1. |
| 3.1 positive Nielsen orbits | CHEN2024 line 184, §1.1, p.305; line 3429, Theorem 4.10.5, pp.386–387; line 3473, following discussion/footnote 28 | Coarse quotient is exterior pairs modulo central inversion. The precise later theorem supports it; the introductory degree sentence has a source error. |
| 4.1 square subgroups | CHEN2024 line 3540, Lemmas 4.12.1–4.12.2, pp.389–390; line 3577, Corollary 4.12.4, p.390 | Package's j=0 proof avoids the faulty general-j step; the imported general degree congruence remains with its supplier. |
| 6.1 epimorphic trace loci | CHEN2024 line 4012, Definitions 5.2.14–5.2.15; line 4038, Proposition 5.2.16(a)–(c), pp.401–402; line 4073, Proposition 5.2.17 | Arbitrary finite-field loci and q=2 exception match; prime trace −2 equality is consumed from ArithmeticDynamicsPartII. |
| 6.2 trace branch cycles | CHEN2024 line 4097, Proposition 5.2.20, pp.403–404; line 4148, Remark 5.2.21, p.404 | Polynomial words and orbit/ramification dictionary agree. Package adds necessary non-dihedrality. Even fields use the supplied general trace dictionary and integral polynomial formulas. |
| 6.3 arbitrary-level slices | CHEN2024 line 4232 through 4389, proof of Lemma 5.3.1, pp.406–409 | L_a and conic equation match; all split, nonsplit and repeated-root cases checked. Embedding preservation follows from injectivity of the coordinate map. |
| 7.7 congruence composition factors | CHEN2024 line 4866, proof of Corollary 5.6.8, p.421 | Supports the mathematics, including prime-field PSL₂ factors. It does not remove R01's obligation to import the existing formal owner. |

Also reopened the headline congruences at CHEN2024 line 3429 (Theorem 4.10.5) and line 3599 (Corollary 4.12.5(b), p.391); quotient properties at line 1699 (Proposition 2.5.10); and the repaired genus/j discussion at line 4730 and line 4788. BBCL22 line 612, Theorem 2.2.3 and its proof, supports the cofinal open-curve consequence. MP18 line 96, Theorem 1.4, retains all three hypotheses, including the order bound 32√(p+1). Neither of the two settled inaccessible texts was requested again.

### Pinned declarations and duplication by object

The following are locations opened at the pins, not names inferred from search results. The native definitions have the limitations recorded here.

| Pinned object | File and line; what was checked |
| --- | --- |
| Commutator and order | `Mathlib/Algebra/Group/Commutator.lean:28`: xyx⁻¹y⁻¹. `Mathlib/GroupTheory/OrderOfElement.lean:179`: order zero for infinite-order elements, excluded by headline finiteness. |
| Centralizer and generation | `Mathlib/GroupTheory/Subgroup/Centralizer.lean:30`, 35, 118; `Mathlib/Algebra/Group/Subgroup/ZPowers/Basic.lean:31`; `Mathlib/Algebra/Group/Subgroup/Lattice.lean:329`. Membership and generated-subgroup centralizer are native. |
| Pair permutations | `Mathlib/Logic/Equiv/Prod.lean:84`, 302; `Mathlib/Algebra/Group/Units/Equiv.lean:100`; `Mathlib/Algebra/Group/Equiv/Basic.lean:242`. Shear is (e₁x,e₂(x)y), and inversion is a permutation, not asserted a nonabelian group homomorphism. |
| Conjugation and orbits | `Mathlib/GroupTheory/GroupAction/ConjAct.lean:43`, 128; `Mathlib/Algebra/Group/Action/Prod.lean:88`; `Mathlib/Algebra/Group/Action/End.lean:184`; `Mathlib/GroupTheory/GroupAction/Defs.lean:49`, 287, 349. Orbit is a range; orbit relation/quotient adds no geometric transitivity. |
| Finite lcm, valuation, simplicity | `Mathlib/Algebra/GCDMonoid/Finset.lean:48`, 57; `Mathlib/Data/Nat/Factorization/Defs.lean:51`; `Mathlib/GroupTheory/Subgroup/Simple.lean:38`. Empty lcm=1; simple includes nontriviality but not nonabelianness. |
| SL, trace, PSL | `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:70`; `Mathlib/LinearAlgebra/Matrix/Trace.lean:43`; `Mathlib/LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean:36`. Determinant-one subtype, diagonal sum, quotient by center; arbitrary commutative rings. |
| Other native objects | `Mathlib/GroupTheory/FreeGroup/Basic.lean:459`; `Mathlib/Data/Nat/Totient.lean:38`; `Mathlib/Dynamics/PeriodicPts/Defs.lean:246`; `Mathlib/GroupTheory/Exponent.lean:72`; `Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean:35`. Period/exponent zero junk is excluded in the finite cases used. |
| Alternating and congruence inputs | `Mathlib/GroupTheory/SpecificGroups/Alternating/Simple.lean:201`; `Mathlib/GroupTheory/SpecificGroups/Alternating.lean:141`; `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean:42`, 164. Simplicity needs ≥5; cardinal factorial formula needs nontrivial carrier; congruence means containing Γ(N) for N≠0. |
| Fricke | `TauCeti/LinearAlgebra/Matrix/Trace/FinTwo.lean:231`, also 250. General commutative-ring identity, already imported in scope; no duplicate headline. |
| Permutation triples and genus | `TauCeti/Combinatorics/PermutationTriple/Basic.lean:76`; `TauCeti/Combinatorics/PermutationTriple/EulerCharacteristic.lean:67`, 169, 208. Product order ∞,1,0; integer Euler characteristic; truncated genus only geometrically meaningful with connectedness. |
| Belyi and exact constants | `TauCeti/FieldTheory/FunctionField/Belyi/Existence.lean:163`, with variables at 62 and 109; `Mathlib/RingTheory/IntegralClosure/IntegrallyClosed.lean:66`. Exact constants are not automatic from an arbitrary field extension. |
| Classification | `TauCeti/GroupTheory/SpecificGroups/CFSG/Classification.lean:54`, 60, 67. Proposition definition, tautological iff and universe transfer from a proof; none proves classification. |
| Ordinary covering monodromy | `TauCeti/Topology/Covering/Monodromy/Basic.lean:63`, in namespace `TauCeti.CoveringSpace`. It is for topological covering spaces, not stack Riemann existence. |

Object searches covered the pinned libraries, main roadmaps, board packages, and indexed open heads using `roadmaps grep`/`show`. The candidate list was treated as leads: generic matrix transvections (`Mathlib/LinearAlgebra/Matrix/Transvection.lean:81`) are not Nielsen pair permutations; `Subgroup.normalCore_eq_ker` (`Mathlib/GroupTheory/GroupAction/Quotient.lean:428`) is generic coset action; `commutatorSet`, `commutatorRepresentatives`, `closureCommutatorRepresentatives` (`Mathlib/GroupTheory/Commutator/Basic.lean:418`, 533, 541) give neither cusp exponents nor orbit congruences. `Subgroup.centralizer_eq_comap_stabilizer` (`Mathlib/GroupTheory/GroupAction/ConjAct.lean:223`) and `Nat.card_zpowers` (`Mathlib/Data/ZMod/QuotientGroup.lean:160`) are supporting facts, not the headline divisibility statements. No duplicate fully qualified declaration among this package's nine names was found.

The specific cusp gluing/automorphism calculation and its obstruction congruence are this roadmap's contribution beyond the already supplied stack, exterior-epimorphism carrier and coarse degree congruence. General rank-two integral invariant theory is requested from LanglandsParameterStacks; this roadmap specializes it to the three trace coordinates. Arbitrary-level finite-field slice refinements extend, rather than duplicate, the prime-field zero-level supplier. R01 records the one additional existing owner found.

### Every cross-roadmap citation resolved

For each entry, the file is `TauCetiRoadmap/<Name>/README.md` unless a board path is given. Numbers identify the supplied current open heads; no revision of an existing main roadmap was used as a new dependency. Every individual Needs line was read against these entries.

| Supplier and version | Resolved sections and evidence |
| --- | --- |
| ArithmeticDynamicsPartII, #1686 | §0.1; §1.4; §§2.1–2.4; §§3.6–3.7,4.2; §§6.0–6.6; §§7.2–7.4a. In particular lines 767–795 give the stacks, quotient map and coarse congruences; 796–821 the finite-field trace dictionary and prime equality; 978–995 give alternating containment for 1 mod 4 and the isolated p=11 case, not the general 3 mod 4 gap. |
| InverseGaloisAndArithmeticFundamentalGroups, #850 | §IG.1.2 at 1094 (tame tangential fibres); §IG.1.3 at 1335 (closed-field extension, with characteristic-zero restriction for nonproper curves); §IG.1.4 at 1438; §IG.3.1 at 2586; §IG.3.2 at 2808; §IG.5.4 at 5847 and 5877. Marking includes unramified fibres. Left action e∘α⁻¹ agrees in orbits with this package's right precomposition. |
| AnabelianGeometryAndNonabelianChabauty, #1021 | §§1.1–1.2: tangential comparison at 3420; inertia orbits at 3606; good paths at 3651; symmetry at 3678; existence at 3704. Functional product order is infinity, one, zero, with integral symmetry adjustments. |
| StableReduction, main | Layers 1–3 at 372,405,467. Normalization/conductor, half-edge valence with loops, dualizing sheaf, pointed curves and external/self-clutching. Lines 490–500 explicitly preserve markings and give self-clutching genus +1. |
| SchemeAndStackFoundations, main | §§1.19,1.21,1.23 at 2923,3055,3124; §3.2 at 4845; §4.6 at 5574; §4.15 at 6037. DM, quotient/coarse stacks, Riemann–Hurwitz, ordinary node deformation, stable pointed moduli. General equivariant smoothing is separately declared. |
| AlgebraicModuliForArithmeticGeometry, #853 | §5.1 at 8413–8467 and 8515–8570; §8.3 at 9725 onward. `ArithmeticModuli.Rigidification.vertical_kernel` is at original line 8525. `schemeFramedCompletionEquiv` at original line 9820 restricts to finite-type points; the geometric-residue comparison is separately declared. |
| ModularCurvesPartII, #913 | §3.1 at 900, §3.11 at 1203, §3.12 at 1220. Drinfeld full levels, coarse compactified j-line, normalized level-H stacks. Used only for abelian comparisons and the elliptic target. |
| ArithmeticGaloisRepresentations, #856 | §1.7 at 1170, §4.3 at 3206, §4.4 at 3263. Burnside absolute irreducibility, finite projective linear-group automorphisms and Dickson classification. |
| LanglandsParameterStacks, #1202 | §2.1 at 562 and §3.8 at 886. Coaction quotients and trace/character comparison exist; arbitrary-ring integral base-change and restriction theorem is not silently inferred from them. |
| ClassicalArithmeticCompletion, main | §§4.57,4.58,4.76 at 8621,8671,9139. Even-sign-enlarged group, coefficient-one Markoff surface, finite-field count. Package explicitly distinguishes its smaller Γ. |
| HeightsRationalPointsAndObstructions, #1017 | §4.6 at 2052 points to the precise Mordell/Faltings statement of §6.4 at 2932. This resolves `mordell_finite` and the genus≥2 number-field hypotheses. |
| MappingClassGroupsAndCanonicalRepresentations, board | `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:864`, §2.3; genus-one Check at 886. Merge order lines 291–292 place it before this package. It is not a nonexistent supplier merely because the main/open resolver omits board packages. |
| BelyiMaps, main | Layer 10 §10.4 at 4115–4132, with the pinned existence theorem at 4129. No successor roadmap is needed. |
| CFSGBasicProperties, main | A0 at 786–794 proves list-entry properties, not CFSG. Its narrower scope is respected by the explicit full Vdovin gap. |

The two resolver leads were resolved manually: the board mapping-class section exists, and the planned rigidification declaration exists at its open head even though it is not pinned library code. No supplier drift was found beyond R01's missing ownership citation.

The overlap file reports no competing head changing this roadmap, no dropped cited id, and no cited id existing only in an open revision. The board-package index was read before making absence claims. Closest-head ownership was checked: #1686 and #850 supply the objects just listed; #913 supplies abelian levels; #1728 GroupActionsOnRiemannSurfaces, README lines 45–64 and 101–107, owns compact complex-surface generating vectors/actions and leaves general Riemann existence and Nielsen classes to InverseGalois; #1841 StableReductionPartII, README lines 7–20, owns tricanonical/expansion/comparison refinements and consumes the same foundational nodes and stable-curve stacks. No second owner of this package's specific cusp invariant/vertical automorphism computation was identified in those heads. No overlap-rule P3 arose.

### Declared gaps and supply direction

All eight slugs match between the plan's top-level gaps and the README's Exact supplier contracts. Each has a named supplier, exact hypotheses and a stated missing extension. None is treated as already proved. No new gap was added.

| Slug | Supplier and precise missing interface |
| --- | --- |
| punctured-torus-nielsen | MappingClassGroupsAndCanonicalRepresentations §2.3: Nielsen abelianization isomorphism together with the oriented elliptic loop identification. |
| asada-cofinality | Same supplier: cofinality and its explicitly stated open-curve Galois strengthening. |
| gaschutz-generating-pairs | InverseGaloisAndArithmeticFundamentalGroups §IG.3.2: generating-pair lifting for finite surjections from a two-generated group. |
| equivariant-node-smoothing | SchemeAndStackFoundations §4.6: tame balanced equivariant hull and T↦t^r. |
| geometric-point-completion | AlgebraicModuliForArithmeticGeometry §8.3: geometric-residue framed completion with automorphisms retained. |
| integral-rank-two-invariants | LanglandsParameterStacks §3.8: arbitrary commutative-ring coaction invariants, arbitrary base change and restriction to SL₂-pairs. |
| vdovin-abelian-subgroups | CFSGBasicProperties A0: Vdovin bound for every finite simple group in every universe, with the classification passage expressly included. |
| markoff-alternating-three-mod-four | ArithmeticDynamicsPartII §7.4a: alternating containment for transitive 3 mod 4 block actions satisfying MP(p). |

These are the supplied gap contracts, not fresh unowned prerequisites. The hypotheses and the required compatibilities make their content determinate; the requested full forms are not supplied by the narrower cited targets. In particular, the p=11 special case does not supply the general 3 mod 4 theorem, and the classification proposition does not supply its proof. Future acceptance would be conditional on these eight contracts.

The required dependency check was run with the supplied name, order, movable flag and content checkout. Exact output:

```text
depcheck: 236 roadmaps, 2143 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No merge-order file was changed. R01's proposed owner is on main, so adding that import does not create an upward edge. No forbidden supplier was introduced or relied on.

### Headline coverage, elaboration, binders and padding

| Headline in the summary/endpoints | Acceptance-file disposition |
| --- | --- |
| Cusp classification and vertical automorphism groups, §§1.8,2.2–2.3 | Named as not statable: admissible-cover stack, cusp fibre and automorphism groupoid absent. |
| Representability of compactified rigidified levels, §2.3 and SL₂ application §6.6 | Named as not statable: stack rigidification and representable stack morphisms absent. |
| Combinatorial congruence, §3.3 | `combinatorial_congruence`, line 106. Native finite-group statement with generating-pair hypothesis and the actual obstruction definitions. |
| Simple-group congruence, §4.2 | `simple_group_congruence`, line 120. All finite simple groups, explicit nonabelianness, PSL₂ exclusion, primality, generation and threshold. |
| Integral trace-coordinate isomorphism, §5.1 | Named as not statable: coordinate coaction invariants of the group scheme are missing. No free predicate or orbit-set substitute. |
| Two Markoff components, degree and genus, §§7.1–7.3 | Named as not statable: level stack, coarse curve and geometric genus carrier missing. |
| Rational j finiteness, §7.4 | Named as not statable: level curve and its rational points missing. |
| Large projective monodromy and noncongruence, §§7.6,7.8 | Named as not statable: geometric level-cover monodromy and Out⁺–SL₂ comparison missing. Generic topological monodromy alone does not supply these objects. |
| Cofinality, §0.7 | Named as not statable: étale fundamental group of the moduli stack missing. |

No additional statable headline was found to be absent. Merely encoding a permutation set or a group-scheme invariant condition as an arbitrary predicate would not state the missing geometric headline.

A fresh `lake env lean` invocation on `packages/NonabelianLevelStructures/Suggested.lean`, run from the pinned content checkout using the required absolute file argument, exited 0. Exactly two warnings: `declaration uses sorry`, at lines 106 and 120. There are no TauCeti imports requiring a preliminary build. The sole import is `import Mathlib`.

A separate scratch copy was elaborated once with `#check @name` for all nine declarations, and one-tactic probes on both sorried theorems. Each theorem was probed with `simp`, `rfl`, `infer_instance`, and `exact Nat.one_dvd _`, guarded by `fail_if_success`; all eight probes failed to close the goals, and the copy exited 0 with only its two expected sorry warnings. The result is consistent with the nontrivial divisors 3,5,7 in the table. No API restatement, boundary-only theorem, Check clone or small-value theorem is present to delete.

All seven definitions have real bodies and are used by the two headlines. The elaborated types retain `[Group G]` throughout, `[Fintype G]` for `cuspVerticalExponent` and both headlines, and every explicit hypothesis of the simple-group theorem. In particular, its exclusion quantifies over finite fields in the same arbitrary universe as G; its threshold is `Nat.card G ≤ (ℓ^(r+1))^3`, and the exponent is `(r+1)/2`. The README uses the equivalent ceiling. No binder loss or generality mismatch was found, and nothing was changed. All nine names occur in the README; its own backticked identifiers resolve to these declarations, with supplier identifiers resolved separately above.

## Not verifiable

- ASADA2001 §7 and VDOVIN1999 Theorem A are settled as uncertified/paywalled in the manifest. Their texts were not available for direct inspection and were not requested again. Their cited consequences were compared with CHEN2024 and, for the open-curve strengthening, BBCL22; this is not certification of the inaccessible originals.
- The complete universal theorems are not proved by a sorry elaboration or finite examples. In particular, no independent exhaustive enumeration of the PSU₃(F₄) example reported in CHEN2024 §4.11 was attempted; that example was checked as a sourced assertion. The eight supplier gaps remain future proof obligations, not claims of existing formal implementations.

## Source issues

The following are issues in the source texts, not additional package findings. The package already avoids the relevant errors. No published correction was established during this review.

- **Error** in CHEN2024 at §1.1, printed p.305, CHEN2024 line 195: the source says coarse degree can be twice the exterior orbit size; it should be the orbit size or half that size after central inversion; affects a stated result.
- **Misprint** in CHEN2024 at discussion before Definition 2.5.13, printed p.346, CHEN2024 line 1814: the source says the quotient level sheaf is on M(G); it should be on the elliptic moduli stack M(1); affects nothing.
- **Error** in CHEN2024 at Definition 4.1.2 and its use in Definition 4.1.3, printed pp.361–362, CHEN2024 line 2442: the source says nodal G-covers are finite flat; it should require finite covers with the admissible local conditions, allowing nonflat ramified nodes; affects a stated result.
- **Error** in CHEN2024 at §4.11, printed p.388, CHEN2024 line 3502: the source says the odd-dihedral centralizer obstruction d′ is two; it should be one, since the commutator generates its cyclic centralizer; affects a stated result.
- **Gap** in CHEN2024 at Lemma 4.12.1 proof, printed p.389, CHEN2024 line 3543: the source says equal-order subgroups of a cyclic group must coincide; it should use equal finite indices when the cyclic group is infinite; affects the proof.
- **Gap** in CHEN2024 at Lemma 4.12.2 proof, printed p.390, CHEN2024 line 3567: the source says the intersection-size bound makes the powered cyclic subgroups disjoint; it should justify the stronger step separately, since C₄ and its C₂ subgroup contradict that inference; affects the proof.
- **Misprint** in CHEN2024 at Corollary 4.12.4 proof, printed p.390, CHEN2024 line 3592: the source says the constructed abelian subgroup has order exactly ℓ^(r+1); it should say its order is at least ℓ^(r+1); affects the proof.
- **Misprint** in CHEN2024 at Corollary 4.12.4 proof, printed p.390, CHEN2024 line 3593: the source refers to part (c); it should refer to the second assertion of part (b); affects nothing.
- **Misprint** in CHEN2024 at Proposition 5.2.16(d) proof, printed p.402, CHEN2024 line 4052: the source says absolute irreducibility is equivalent to commutator trace equal to two; it should say unequal to two; affects the proof.
- **Error** in CHEN2024 at Proposition 5.2.16(d) proof, printed p.402, CHEN2024 line 4058: the source says both images of an arbitrary dihedral generating pair are involutions; it should also treat a rotation and a reflection, whose product is a reflection; affects the proof.
- **Gap** in CHEN2024 at Proposition 5.2.20, printed p.403, CHEN2024 line 4097: the source omits the non-dihedral qualification from the displayed trace-fibre comparison; it should impose it for the indicated non-dihedral target; affects a stated result.
- **Misprint** in CHEN2024 at Remark 5.2.21, printed p.404, CHEN2024 line 4154: the source gives upper-right entry −1 for γ∞; it should be +1 for the stated map a↦a, b↦ab with column abelianization; affects a stated result.
- **Error** in CHEN2024 at proof of Lemma 5.3.1, printed p.408, CHEN2024 line 4343: the source says the nonsplit degenerate full conic is empty; it should contain the unique point (a,0,0), while its non-dihedral locus is empty; affects a stated result.
- **Misprint** in CHEN2024 at proof of Lemma 5.3.1, printed p.409, CHEN2024 line 4384: the source says the distinct-root matrix diagonalizes over F_q; it should say over F_(q²), with descent determining the period; affects the proof.
- **Misprint** in CHEN2024 at Proposition 5.6.1(a), printed p.418, CHEN2024 line 4734: the source gives (D−3)/3 points over zero; it should give (D+2)/3, counting the unique fixed point and remaining three-cycles; affects a stated result.
- **Gap** in CHEN2024 at Theorem 5.6.4 finiteness consequence, printed p.419, CHEN2024 line 4791: the source asserts finiteness of elliptic curves over the number field from coarse rational-point finiteness; it should assert finiteness of their j-invariants unless descent and twists are controlled; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "32141ad25072ad93b56e8453dfca03f8ed7b6912", "job": "REV-PKG-NonabelianLevelStructures~3", "model": "gpt-6-astra", "worker": "chris-30"} -->
