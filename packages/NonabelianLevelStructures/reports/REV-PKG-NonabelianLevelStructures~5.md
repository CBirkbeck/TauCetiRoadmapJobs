<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13007#issuecomment-6792030084 -->
Review (codex) of e3467a3

Verdict: accepted
Conditional on the announced gaps: `punctured-torus-nielsen`, `asada-cofinality`, `gaschutz-generating-pairs`, `equivariant-node-smoothing`, `geometric-point-completion`, `integral-rank-two-invariants`, `vdovin-abelian-subgroups`, `markoff-alternating-three-mod-four`

No findings. Acceptance is conditional on the eight declared supplier gaps listed below. Both findings of round 4 are repaired. The acceptance file elaborates under default options with only its three expected `sorry` warnings; the dependency check reports no problems.

## Verified sound

### Previous findings, checked first

| Previous finding | Repaired passage | Verification and status |
| --- | --- | --- |
| F01: missing locator for the finite precuspidal equivalence | `packages/NonabelianLevelStructures/README.md:312`: “The tangential fibre functor at t₀, followed by transport along δ, is an equivalence from the category of three-point G-covers of P¹ with gluing data to precuspidal G-data (Chen, Proposition 4.6.2, pp. 373–374).” | **Repaired.** CHEN2024 line 2930 is the claimed proposition. The same paragraph now attaches equation (4.6), p.375, to H; CHEN2024 line 2986 contains that formula. The API repeats the correct proposition at README line 319. Definition 4.6.1 and Proposition 4.4.3 retain their distinct roles. |
| F02: omitted statable integral trace-coordinate headline | `packages/NonabelianLevelStructures/README.md:644`: “Prove that `integralTraceMap` is injective with image the subalgebra of invariant functions”; `packages/NonabelianLevelStructures/Suggested.lean:249` declares `integral_trace_coordinates`. | **Repaired.** The statement uses native coordinate algebras, two abbreviations and five definitions with real bodies. It quantifies over every commutative ring, including the zero ring, and all algebra-valued points. The obsolete nonstatability claim is gone. The independent algebra-valued-point test below distinguishes scheme invariance from invariance under rational points. |

Neither preceding finding was marked not actionable. No finding is re-raised. All additions implementing F02, including supplier names, generic matrices, tensor-factor evaluation, conjugation, the universe quantifier, the proved example and the headline, were reviewed afresh. The locator repair was checked at its source rather than inferred from the repair report.

Searched the rest of the package for the repaired patterns. The other equivalences have theorem locators; no remaining claim treats native coordinate algebras or their invariant equalizer as unavailable. Earlier repairs also remain intact: right cosets Hh; the full unramified marking versus the reduced ramification divisor; central inversion in coarse degree; nonflat ramified nodes; characteristic-two slices; eigenline periods; classification as an assumption rather than a proved proposition; finite j-image rather than uncontrolled twists; and the imported noncongruence obstruction.

### Principles, shape and coverage

Read the complete 1,039-line README, all 46 numbered targets, conventions, APIs, Checks, routes, Needs lines, supplier contracts and references; the 255-line Lean file; metadata; manifest; design gap declarations; previous review and repair; and the supplied citation, overlap, library-match and signature evidence. Helpers located text only; the mathematical review, source comparisons, computations and verdict were performed by this reviewer. For unchanged material, only the preceding review's rows containing actual computed values were inherited. Every seeded target and every changed passage was reopened. Descriptive assertions of soundness in the preceding review were not used as substitutes for evidence.

The scope remains general finite-group level theory, arbitrary commutative coefficient rings and arbitrary finite-field slices. Small characteristics, nilpotents, nonflat base change, empty levels and trivial groups have not been excluded to simplify the route. The prime Markoff endpoint is an application of this library. No re-planning of an existing roadmap, upward supply, computational algorithm target, copied source passage, sorry'd data, `set_option`, or route-specific substitute was found.

Compared the shape with main's StableReduction, SchemeAndStackFoundations and NoncongruenceModularForms. Each of the eight layers has Examples and Dependencies. Every numbered target has a locator and Needs line. The seventeen explicit definition/API blocks have the following numbers of discriminating Checks:

| Sections | Check counts, in the same order |
| --- | --- |
| 0.2, 0.5, 0.6, 1.1, 1.3, 1.4, 1.6, 1.7, 2.1 | 4, 4, 4, 4, 4, 3, 3, 3, 3 |
| 3.1, 3.2, 5.1, 5.4, 5.5, 5.6, 6.3, 7.5 | 5, 6, 6, 4, 4, 3, 4, 3 |

These were read for mathematical discrimination, not merely counted. Generic dependencies force gluing → finite cusp data → vertical automorphisms → obstruction pair → congruence, and trace coordinates → rotation orders → SL₂ automorphisms and Markoff geometry. Layer names describe these mathematical objects. There is no claim to follow a source's arrangement, no chapter-named layer, and no freely ordered run masquerading as a mathematical dependency. No process residue, machine path, HTML anchor, target-number catalogue, LaTeX delimiter or unsupported backticked own declaration was found in the authored README and Lean file. Metadata records `math.NT`.

### Adversarial mathematics

F means freshly computed in this round, by direct algebra or independent finite enumeration. I means an unchanged numerical witness inherited from the previous review's computed table, after rereading the current statement and hypotheses. These finite computations test conventions, definitions and counterexamples; they do not purport to prove the general theorems. D₂ₙ denotes the dihedral group of order 2n. Rows cover the seeded sample, headlines and repaired material; related unchanged statements are grouped to keep the report reviewable.

| Statement | Instances | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| Commutator and Fricke convention (F); anti-action (I) | Unit upper/lower unipotents over ℤ; triple (2,3,5) | Trace triple (2,2,3); tr[A,B]=3=4+4+9−12−2. Composite trace moves give (2,1,3), versus (2,5,7) in reversed order. | Sign and direction agree; no change. |
| §0.1 marking, ramification and reducedness (F) | G=1; unramified C₂; S₃ with inertia C₃; dual numbers | Marking/R degrees 1/0, 2/0, 2/2. An étale degree-one divisor over k[ε]/ε² retains ε²=0 and ε≠0; the empty divisor is reduced even over that base. | e≥2 in the degree formula and surjectivity in the reducedness converse are necessary and present. |
| §0.2 Higman orientation (F) | Noncentral trace −2 in SL₂(𝔽₇) | (−I+E₁₂)⁻¹=−I−E₁₂; coefficient ratio 6 is not in the square set {1,2,4}. Cyclic commutator order 1 versus S₃ order 3. | Inverse boundary word exchanges the two classes; fixed roots are substantive. |
| §§0.3,3.1 coarse versus exterior orbits (F) | C₁,C₂,C₃ | Generating-pair counts 1,3,8; coarse-orbit sizes 1,3,4. C₃ inversion fixes zero generating pairs. | Central inversion gives half, never twice, the exterior degree. |
| §0.4 boundary deformation and density (F) | r=1,2; C₂³ | T=tʳ gives basis ranks 1,2 and tangent derivatives 1,0. Two elements of C₂³ generate at most 4<8 elements. | Includes smooth, ramified and empty-level cases; geometric lifting is explicitly contracted. |
| §0.5 quotient functoriality (I) | Identity; C₂²→C₂; C₂³→C₂² | Identity fibre 1; six generating pairs map to three with fibres 2. Non-two-generated source has 0 pairs over 6 target pairs. | Two-generation is retained for surjectivity. |
| §0.6 absolute levels (I) | C₂; determinant-3 conjugation over 𝔽₇ | Out(C₂) has size 1, degree remains 3; nonsquare multiplier 3 interchanges the two trace −2 classes. | Outer-stable union of strata required and stated. |
| §0.7 cofinality (F) | Identity Belyi map β=t | Degree 1; branch set ∅⊆{0,1,∞}; the chosen open complement removes 3 points. | The étale Galois map is to a nonempty open U, not to all proper X. |
| §§1.1–1.2 normalization equivalence (F/I) | One- and two-gons; x=ξ²,y=η²,ξη=0 | V=E=1 or 2, hence b₁=1. Node fibre has basis 1,ξ,η: length 3 versus generic rank 2. | Loops allowed; equivalence over the fixed target; no false flatness requirement. |
| §1.3 finite data and cosets (F) | H=⟨(12)⟩,h=(123) in S₃; singleton datum | Hh={(123),(23)}; hH={(123),(13)}. For G=1 there is one action orbit and one gluing bijection. | Correct right coset and equivalence locator; no change. |
| §§1.4–1.5 graph, balance, connectedness (F/I) | S₃ rotation/reflection; C₂²,u=1,h≠1 | h⁻¹u⁻¹h=u in S₃; inertia subgroup has size 3 and index 2. C₂² generates subgroup size 2<4 and graph has 2 components. | Balance does not imply connectedness; both directions of the criterion discriminate these cases. |
| §§1.6–1.9 cusp invariant, standard cusp, classification and inversion (F/I) | C₂,C₃,S₃,D₁₀ | I-set sizes 2,4,2,4. Cyclic standard polygons have E=V=2 or 3. In S₃ the relevant commutators (132),(123) are conjugated by uh=(13). For C₃,u=1 inversion sends h to distinct h²; C₂ inversion fixes h. | Standard model, transported Higman class and lift criterion agree. |
| §§2.1–2.3 vertical group and representability (I) | S₃ rotation/reflection; C₃,u=1 | (size Z,order u,k,size A)=(1,3,1,3),(3,1,1,3); size Z·order u/k=3 in both. Evaluation kernel/image sizes 1/3 and 3/1. | Evaluation need not be injective; rigidification and full vertical group distinguished. |
| §2.4 full abelian levels (F) | n=2,3 | size SL₂(𝔽₂)=6 and −I=I; n=3 gives size 24, coarse degree 12 and φ(3)=2 components. | The n≥3 stabilizer qualification excludes the small exception. |
| §2.5 odd dihedral example (F) | D₆,D₁₀,D₁₄ | 18,60,126 generating pairs; 1,2,3 coarse orbits, each size 3. (order c,m′,d′)=(3,3,1),(5,5,1),(7,7,1). | k/gcd(k,k)=1 divides 3; d′=1 is correct. |
| §§3.1–3.2 orbit and obstruction definitions (F) | S₃,S₄,D₁₆,Q₈; trivial/empty case | Coarse sizes 3,9,6,6. D₁₆ has 96 pairs, intersection orders {2,4}, lcm 4 and d′=2; Q₈ gives m′=2,d′=4. Empty lcm=1; trivial group m′=d′=1. | Not an lcm of ambient orders; denominators positive under finite-group hypotheses. |
| §3.3 combinatorial headline (F/I) | C₁,C₂,C₃,S₄; A₇ | Divisor/orbit pairs 1/1,1/3,1/4,3/9; inherited A₇ pair 7/42. | Nontrivial divisibility on the actual coarse orbit; agrees with Lean. |
| §4.1 square-subgroup bound (I) | SL₂(𝔽₅),ℓ=5; D₁₀ | First r=1,s=0,v₅(m′)=0≤floor(1/2). Second v₅(m′)=1, normal C₅ has size 5, no subgroup has size 25. | Normal-subgroup hypothesis excludes the false square conclusion. |
| §4.2 simple-group headline (I, threshold recomputed) | A₇,ℓ=7,17; excluded A₅ | size A₇=2520≤7⁶=117649; r=1 gives divisor 7 and orbit 42. ℓ=17 gives r=0 and divisor 1. In A₅ a C₅ has cube of size 125>60. | Ceiling, size threshold, nonabelian and PSL₂ exclusions retained. |
| §5.1 new coordinate definitions and injectivity/image headline (F) | ℤ→𝔽₂; zero ring; reducible pairs | Unit unipotents evaluate to (2,2,3)→(0,0,1); using the same tensor factor twice would give (2,2,2). Both algebras over the zero ring are zero. (I,I) and (unipotent,I) both have (2,2,2), without being conjugate. | Correct two factors, arbitrary base ring, invariant quotient rather than orbit classification. |
| §5.1 conjugation convention (F) | P=diag(2,1), A=upper unit unipotent over ℚ | PAP⁻¹ has upper entry 2, determinant 1, trace 2; P⁻¹AP has upper entry 1/2. | Real body chooses the specified conjugation; inverse convention excluded. |
| §5.1 scheme invariance versus rational points (F) | 𝔽₄=𝔽₂[w]/(w²+w+1), A=[1,1;1,0], B=I, P=[w,w²;1,1] | det P=1 and P⁻¹AP=diag(w,w²). Product N of the six 𝔽₂-conjugates of a₁₂ is 1 at A, 0 at the diagonal matrix. Both pairs have trace triple (1,0,1). All six rational conjugates give N=1. | Universal-algebra quantifier excludes the extra rational-point invariant; the repaired predicate is substantive. |
| §5.1 universes and nonflat base change (F) | Universal algebra; ℤ→𝔽₂; square-zero coefficients | O(GL₂)⊗O(SL₂×SL₂) has the same universe as R. The three generators remain x,y,z after reduction; 2↦0. In R[ε]/ε² the relation ε²=0 is retained, not replaced by ε=0. | Universal point tests the coaction; no flatness, reducedness or nontriviality assumption silently enters. |
| §5.2 outer action (I) | ℤ,𝔽₂,𝔽₂[ε]/ε²,ℤ/4 | Vieta/permutations fix (2,2,2); double signs give (−2,−2,2). Distinct if 4≠0, equal in ℤ/4 for this witness. In characteristic two signs equal 1. Single sign changes the level of (1,1,1) from 2 to 4. | Exact sufficient strictness hypothesis, no claim from a vacuous witness. |
| §5.3 algebra generation; §5.4 trace strata (F/I) | Upper entry 1 or 2 over ℤ; diag(3,4) over 𝔽₁₁ | Fricke-minus-2 is 1 or 4; integral algebra indices 1 or 4, both full over ℚ. Diagonal order 5, trace 7; square trace 3, inverse trace 7. | Unit versus nonzero distinguished; coprime powers need not preserve trace. |
| §§5.5–5.7 admissible traces and normalizers (I) | q=2,3,5,7; q=4,5; n=1 | Trace sets {1},{0},{1,3},{3,4,5,6}; diagonal-outer sizes 1,2 at q=4,5. At q=5 normalizer/centralizer size 120 versus inner size 60; over 𝔽₄ transvection coefficient 1 becomes w≠1. | Small fields and scalar exceptions are retained; correct quotient by G·C. |
| §6.1 epimorphic loci (I) | q=2,3; zero-level small fields | Generating group sizes 6,24 with triples (0,0,1),(2,0,1), commutator traces 1,0. Punctured zero-level counts at p=3,5 are 0,40. | Epimorphic does not imply non-dihedral at q=2; imported prime zero-level dictionary not duplicated. |
| §6.2 branch cycles (F) | Nine primes in the next table | Product γ∞γ₁₇₂₈γ₀ fixes every enumerated point. At p=5 cycle counts are 14,20,8 on 40 points. Formula γ∞(3,3,3)=(3,3,6). | Product order and positive transvection match the pinned triple. |
| §§6.3,6.5 arbitrary-level conics (F) | Every a,t≠2 over 𝔽₃,𝔽₅,𝔽₇,𝔽₁₁,𝔽₁₃ | 334 slices; counts agree with 0 or 2q in repeated cases, q−1 or 2q−1 in split cases, q+1 or 1 in nonsplit cases: 0 mismatches. | Degenerate nonsplit conic contains (a,0,0), not the empty set. |
| §6.4 exact rotation order (F) | 502 non-dihedral cycles; eigenline over 𝔽₇ | Every period equals the companion-matrix order. For a=1, (1,3)↦(3,2)=3(1,3); the successive points are (2,6),(6,4),(4,5),(5,1),(1,3), period 6=order(3). | Eigenlines included; no use of a generic-point argument to discard them. |
| §§6.4–6.5 characteristic two (F) | 𝔽₄, a=w; a=0,t=1 | X²+wX+1 at 0,1,w,w² gives 1,w,1,w: no root. Companion cycle (1,0),(0,1),(1,w),(w,w),(w,1) has length 5. For a=0,t=1, four points form two 2-cycles. | Splitting defined by roots, not odd-characteristic discriminants. |
| §6.6 SL₂ vertical groups (I) | Traces 3,6 over 𝔽₇; D₁₀ in SL₂(𝔽₄) | Element orders 8,3 and scalar-intersection orders 2,1. Dihedral cusp vertical group has order 5, center order 1. | Non-dihedral hypothesis distinguishes vertical-center conclusion. |
| §§7.1–7.3 components, branches and genus (F) | p=3 and nine primes below | p=3 has D=0; no nonempty component assigned a genus. Nine positive D values have transitive branch action; genus equals 1+(D−c₀−c₁₇₂₈−c∞)/2 in every row. | Conditional two-component claim and small-prime exceptions retained. |
| §7.3 genus threshold (I) | All 337 primes 13≤p<2304; larger-prime bound | Minimum computed genus 5, attained at 13; for p≥2304 the stated estimate yields genus at least 2. | Finite small cases plus mathematical bound cover the claimed range. |
| §7.4 finite j-image (I/F arithmetic) | p=13; generic j=1 | D=208, genus 5; 208 geometric points over one nonbranch j give one j-value. | Faltings applied to the coarse curve; twists not counted as distinct j-values. |
| §§7.5–7.6 projective quotient and large monodromy (F) | Nine primes below | Sign blocks have size 4, d=D/4. Branch-sign parity triples are listed below. At p=7, available eigenvalue order ≤8<32√8, so MP fails. | Small degree does not refute a theorem whose full MP hypothesis fails. |
| §7.7 noncongruence adapter (I) | Γ₁(3); S₃ action; A₅,A₁₀ | SL₂-index 8 versus projective index 4 until adjoining −I. Map gΓ↦y·g⁻¹ passes 12/12 representative and 36/36 equivariance tests. size A₅=60=PSL₂(𝔽₅), whereas size A₁₀=1814400 is not a prime-field PSL₂ order. | Central-kernel and n≥6 conditions matter; general obstruction imported from its main owner. |

The fresh branch enumeration independently reproduces the divisor-sum genus formula. Parity 0 means even and 1 means odd, in the order 0,1728,∞, on the sign blocks.

| p | D | c₀ | c₁₇₂₈ | c∞ | genus | d=D/4 | block parities |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 5 | 40 | 14 | 20 | 8 | 0 | 10 | 0,1,1 |
| 7 | 28 | 10 | 15 | 5 | 0 | 7 | 0,1,1 |
| 11 | 88 | 30 | 44 | 14 | 1 | 22 | 0,1,1 |
| 13 | 208 | 70 | 104 | 26 | 5 | 52 | 0,0,0 |
| 17 | 340 | 114 | 171 | 37 | 10 | 85 | 0,0,0 |
| 19 | 304 | 102 | 152 | 34 | 9 | 76 | 0,0,0 |
| 23 | 460 | 154 | 231 | 41 | 18 | 115 | 0,1,1 |
| 29 | 928 | 310 | 464 | 86 | 35 | 232 | 0,0,0 |
| 31 | 868 | 290 | 435 | 69 | 38 | 217 | 0,0,0 |

### Seeded source sample and manifest

All fifteen selected targets were checked against the available source text, including theorem numbers, printed pages, hypotheses and conclusions. CHEN2024 uses published numbering. BBCL22, MP18 and CHEN2018 use the preprint versions identified in the manifest. The six cited works have six existing keys: four readable legal texts and two settled uncertified originals. No additional author-flagged unverified locator was found. No source fetch or manifest mutation was needed.

| Target in README | Source text opened | Verification |
| --- | --- | --- |
| 0.1, line 135 | CHEN2024 line 943, Definition 2.2.2 and Proposition 2.2.3, p.324; line 991, Proposition 2.2.5, pp.325–326; line 2065, Proposition 3.2.2, pp.352–353 | Reduced ramification, monodromy and degree supported, with the package's explicit e≥2 and surjectivity corrections. |
| 0.4, line 192 | CHEN2024 line 1502, Proposition 2.5.3, pp.338–341; line 1611, Corollary 2.5.4, p.341; lines 5264–5443, Appendix 6.5, pp.430–434 | T↦tʳ and tame hypotheses agree. Equivariant smoothing and the enlarged-residue-field completion interface are declared gaps rather than attributed to a weaker native statement. |
| 0.7, line 250 | CHEN2024 line 1464, Theorem 2.5.2(7), pp.337–338; BBCL22 line 612, Theorem 2.2.3, proof line 638, preprint pp.14–15 | Domination and the stronger finite étale Galois map to an open U are supported. Original Asada remains uncertified. |
| 1.2, line 296 | CHEN2024 line 2459, Proposition 4.1.4, pp.362–363; line 2754, Lemma 4.4.4; line 2800, Theorem 4.4.5, pp.369–371 | Fixed-target category and normalization/gluing equivalence supported. The source's flatness slip is not inherited. |
| 1.3, line 310 | CHEN2024 line 2912, Definition 4.6.1, p.373; line 2930, Proposition 4.6.2, pp.373–374; line 2986, equation (4.6), p.375; line 2740, Proposition 4.4.3, p.369 | Corrected locator now identifies exactly the finite-data equivalence. The H-coset formula has its own locator. |
| 1.5, line 351 | CHEN2024 line 2863, Proposition 4.5.2, pp.372–373; line 2987, Definition 4.7.1, p.375; line 3077, Proposition 4.7.6, p.377; line 3086, Proposition 4.8.1, pp.377–378 | Balance, transitivity and two-generation criteria agree, with the good-path conventions retained. |
| 2.4, line 492 | CHEN2024 line 3418, Remark 4.10.4, p.386 | Abelian full-level comparison and small-level qualifications agree. |
| 2.5, line 506 | CHEN2024 line 3493, §4.11, p.388; CHEN2018 line 1386, Theorem 4.2.2, preprint p.29 | Odd k≥3, φ(k)/2 components, degree three. Package correctly uses d′=1. |
| 3.3, line 573 | CHEN2024 lines 3429–3477, Theorem 4.10.5 and following paragraph/footnote 28, pp.386–387 | Obstruction denominator, central-inversion quotient and coarse-orbit divisibility agree with the Lean statement. |
| 5.1, line 640 | CHEN2024 line 3786, Theorem 5.2.1 and Definitions 5.2.2–5.2.3, pp.395–396; lines 5093–5159, Appendix 6.2, Theorems 6.2.1–6.2.2 and Lemma 6.2.3, pp.426–427 | Arbitrary-ring invariant generation, three traces and algebraic independence support the repaired headline; not merely a characteristic-zero orbit quotient. |
| 5.4, line 698 | CHEN2024 line 3651, Definition 5.1.1 and equation (5.1), p.392 | Fixed root system and trace decomposition into clopen strata supported; arbitrary coprime powers need not preserve the trace. |
| 6.2, line 801 | CHEN2024 line 4097, Proposition 5.2.20; line 4148, Remark 5.2.21, pp.403–404 | Three trace maps and branch orders agree. The source opens with p≥3 while writing 𝔽_q; the package's general q≥3 form follows from the arbitrary-field trace dictionary (Theorem 5.2.10), §0.3 and the polynomial action. Its non-dihedral hypothesis corrects the source's arrow into X*. The column convention also corrects γ∞. |
| 6.4, line 836 | CHEN2024 line 4193, Lemma 5.3.1, p.405; proof lines 4232–4389, pp.406–409 | Non-dihedral points, including eigenlines, have the companion-matrix period; nonsplit diagonalization takes place over the quadratic extension. |
| 6.5, line 851 | CHEN2024 lines 4232–4389, proof of Lemma 5.3.1, pp.406–409 | Split/nonsplit and repeated-root counts, arbitrary level and characteristic two checked directly. Package correctly retains the nonsplit degenerate singleton. |
| 7.1, line 891 | CHEN2024 line 4645, Theorem 5.5.7(b), p.416; line 4703, §5.6, p.417; line 4763, Theorem 5.6.3, p.418 | Transitivity assumption, two Higman classes, their trace-coordinate copies and coarse degrees agree. |

Also reopened the simple-group headline at CHEN2024 line 3607, Corollary 4.12.5(b), p.391, and its abelian-subgroup input; MP18 lines 90 and 96, Theorems 1.3–1.4, preprint p.3; and the branch/genus formulas at CHEN2024 lines 4730–4787. The 3-mod-4 endpoint retains both transitivity and the full MP condition. Source errata below are not package findings where the package already states the correction.

### Pinned library and duplication audit

Read the library declarations, including every README native-name citation and all constants needed by the new Lean definitions/example, at Mathlib pin `1b1ccf4b088b32fa3f23f2de1127433254a81e1e1e` and Tau Ceti pin `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The supplied search matches were treated as leads. These are the main semantic witnesses; paths are relative to the respective library repository.

| Object | Declarations opened at the pin and what they supply |
| --- | --- |
| Commutator, order, generation | `Mathlib/Algebra/Group/Commutator.lean:28`; `Mathlib/GroupTheory/OrderOfElement.lean:179`; `Mathlib/Algebra/Group/Subgroup/Lattice.lean:329`; `Mathlib/GroupTheory/Subgroup/Centralizer.lean:30`; `Mathlib/Algebra/Group/Subgroup/ZPowers/Basic.lean:31`. Correct xyx⁻¹y⁻¹, closure, centralizer and cyclic subgroup. Infinite-order zero junk is excluded in the finite headlines. |
| Permutations, action, orbit quotient | `Mathlib/Logic/Equiv/Prod.lean:84`, line 302; `Mathlib/Algebra/Group/Units/Equiv.lean:100`; `Mathlib/Algebra/Group/Equiv/Basic.lean:242`; `Mathlib/Algebra/Group/Action/End.lean:184`; `Mathlib/GroupTheory/GroupAction/Defs.lean:49`, lines 287,349; `Mathlib/GroupTheory/Coset/Basic.lean:170`. Inversion is a permutation, not a homomorphism of a nonabelian group; left multiplication orbits are Hh. |
| Arithmetic and simplicity | `Mathlib/Algebra/GCDMonoid/Finset.lean:48`, line 57; `Mathlib/Data/Nat/Factorization/Defs.lean:51`; `Mathlib/GroupTheory/Subgroup/Simple.lean:38`. Empty lcm=1; simplicity includes nontriviality, not nonabelianness. |
| Matrix groups and traces | `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:70`; `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:43`; `Mathlib/LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean:36`; `Mathlib/LinearAlgebra/Matrix/Trace.lean:43`, line 215. Determinant-one subtype, units, quotient by center and conjugation-invariant trace; not invariant generation. |
| Other named native notions | `Mathlib/GroupTheory/FreeGroup/Basic.lean:459`; `Mathlib/Data/Nat/Totient.lean:38`; `Mathlib/Dynamics/PeriodicPts/Defs.lean:246`; `Mathlib/GroupTheory/Exponent.lean:72`; `Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean:35`. Free group, totient, minimum period, exponent and algebra adjoin are used with their actual hypotheses. |
| Alternating/congruence | `Mathlib/GroupTheory/SpecificGroups/Alternating/Simple.lean:201`; `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean:42`, line 164. Degree condition for simplicity and nonzero principal level retained. |
| Native tensor/evaluation machinery | `Mathlib/RingTheory/TensorProduct/Maps.lean:804`, lines 812,819; `Mathlib/RingTheory/TensorProduct/Basic.lean:261`, line 273; `Mathlib/Algebra/MvPolynomial/Eval.lean:572`; `Mathlib/Algebra/Algebra/Subalgebra/Basic.lean:545`. Product map, left/right inclusions, polynomial evaluation and algebra-map range. |
| SL₂ coordinate ring and points | `TauCeti/Algebra/AlgebraicGroup/SpecialLinear/Basic.lean:121`, lines 127,252,290; `TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Coordinate/HopfAlgebra.lean:464`. Native coordinate algebra, generic matrix and points over arbitrary coefficient algebras. |
| Invariants and base change | `TauCeti/Algebra/Bialgebra/ComoduleAlgebra.lean:136`, line 142; `TauCeti/Algebra/AlgebraicGroup/SpecialLinear/BaseChange.lean:82`, line 104; `TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Coordinate/BaseChange.lean:374`. Coaction equalizer and generic-matrix base change; none proves the three-trace invariant-generation theorem. |
| Fricke, branch triple, genus | `TauCeti/LinearAlgebra/Matrix/Trace/FinTwo.lean:231`; `TauCeti/Combinatorics/PermutationTriple/Basic.lean:76`; `TauCeti/Combinatorics/PermutationTriple/EulerCharacteristic.lean:67`, lines 169,208. Arbitrary-ring Fricke is imported; triple product order is infinity,one,zero; genus needs connectedness. |
| Belyi, classification, monodromy, Nielsen | `TauCeti/FieldTheory/FunctionField/Belyi/Existence.lean:163`; `TauCeti/GroupTheory/SpecificGroups/CFSG/Classification.lean:54`; `TauCeti/Topology/Covering/Monodromy/Basic.lean:63`; `TauCeti/GroupTheory/FreeGroup/Nielsen.lean:45`. Exact constants/algebraicity accompany Belyi; classification is a Prop, not its proof; ordinary covering monodromy and a Nielsen automorphism do not supply the missing moduli comparison. |

Compared the native near-matches by object, not spelling. `Mathlib/GroupTheory/GroupAction/Quotient.lean:169`, line 428, gives orbit/stabilizer and normal-core facts, not the congruence. `Mathlib/Data/ZMod/QuotientGroup.lean:160` gives cyclic subgroup cardinality. `Mathlib/RingTheory/AlgebraicIndependent/Defs.lean:139` gives the polynomial evaluation equivalence for algebraically independent elements and assumes that independence, rather than proving this invariant-ring identification. Ordinary group invariants in `Mathlib/RingTheory/Invariant/Defs.lean:34` do not replace scheme invariants. No existing proof of any of the three headlines was found. No fully qualified declaration collision was found among this package's seventeen names.

Object searches used the roadmap service's grep/show tools for current main and indexed open heads, local searches in board packages, and native-library searches for coordinate algebras, trace invariants, Nielsen/exterior orbits, cusp stabilizers, normalizers and congruence obstructions. The open-head ownership evidence was actually read. The generic stacks and exterior epimorphisms remain with their earlier owners; this package owns the finite cusp calculation and ensuing congruence. ArithmeticDynamicsPartII owns the prime zero-level dictionary; this package's arbitrary-level slices are broader. LanglandsParameterStacks owns the general invariant-generation input; this package specializes it to the three-trace algebra. NoncongruenceModularForms on main owns the general composition-factor obstruction; §7.7 only applies it through the stabilizer adapter.

### Supplier resolution, overlap and order

All supplier contracts and every Needs citation were resolved anew. The board package index was read before checking local packages. The two resolver alerts are not missing prerequisites: MappingClassGroupsAndCanonicalRepresentations §2.3 exists in its board package, and `ArithmeticModuli.Rigidification.vertical_kernel` is a planned declaration at the cited AlgebraicModuli head, not a claim about the native pin. The following table records the actual owners opened. PR numbers here identify the review evidence; the roadmap itself cites roadmap names and sections.

| Supplier and version | Resolved file/line and sections |
| --- | --- |
| ArithmeticDynamicsPartII, #1686 | `TauCetiRoadmap/ArithmeticDynamicsPartII/README.md:99` §0.1; line 213 §1.4; lines 235,256,264,272 §§2.1–2.4; lines 441,451 §§3.6–3.7; line 490 §4.2; line 767 §6.0, with coarse congruence at 790; lines 796,822,845,853,863,873 §§6.1–6.6; lines 924,948,970,978 §§7.2–7.4a. |
| InverseGaloisAndArithmeticFundamentalGroups, #850 | `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:1026`, lines 1168,1401 §§IG.1.2–1.4; line 2581 §IG.3.1; line 2709 §IG.3.2, exterior pairs at 2808; line 5808 §IG.5.4, admissible covers at 5847 and full marking at 5877. |
| AnabelianGeometryAndNonabelianChabauty, #1021 | `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:3418` §1.1; line 3604 §1.2; good paths at 3651, symmetry at 3678, existence at 3704. Tangential orientation and algebraically closed characteristic-zero hypotheses agree. |
| StableReduction, main | `TauCetiRoadmap/StableReduction/README.md:372`, lines 405,467, Layers 1–3; conductor/graphs at 393,395; Cartier divisors at 445; clutching at 487. |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2923` §1.19; line 3055 §1.21; line 3124 §1.23; line 4845 §3.2; line 5574 §4.6; line 6037 §4.15. Bare node deformation is weaker than equivariant smoothing, hence the declared gap. |
| AlgebraicModuliForArithmeticGeometry, #853 | `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:8413` §5.1; vertical-kernel target at 8525. Line 9725 §8.3; framed completion at 9820 and atlas comparison at 9960. The geometric-residue extension is separately contracted. |
| ModularCurvesPartII, #913 | `TauCetiRoadmap/ModularCurvesPartII/README.md:900`, lines 1203,1220, §§3.1,3.11,3.12. Full levels and compactified j-line, not general nonabelian cusp calculations. |
| ArithmeticGaloisRepresentations, #856 | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:1170` §1.7, Burnside at 1209; line 3206 §4.3, automorphisms at 3241; line 3263 §4.4. |
| LanglandsParameterStacks, #1202 | `TauCetiRoadmap/LanglandsParameterStacks/README.md:562` §2.1; line 886 §3.8. Its characteristic-zero trace interface does not silently supply arbitrary-ring generation/base change. |
| ClassicalArithmeticCompletion, main | `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:8621`, lines 8670,9139, §§4.57,4.58,4.76. Even sign changes and the smaller Vieta/permutation group are explicitly distinguished here. |
| MappingClassGroupsAndCanonicalRepresentations, board | `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:864` §2.3; uniformization at 866 and genus-one specialization at 886. Earlier in the merge order. The stronger Nielsen/loop and cofinality requirements are named gaps. |
| HeightsRationalPointsAndObstructions, #1017 | `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md:2052` §4.6 directs to the Mordell/Faltings endpoint at line 2932, §6.4. |
| BelyiMaps, main | `TauCetiRoadmap/BelyiMaps/README.md:4115` §10.4, native existence reference at 4129. |
| CFSGBasicProperties, main | `TauCetiRoadmap/CFSGBasicProperties/README.md:786`, A0. Properties of listed groups do not by themselves prove the classification proposition or Vdovin's bound for all finite simple groups. |
| NoncongruenceModularForms, main | `TauCetiRoadmap/NoncongruenceModularForms/README.md:458` §1.1; line 841 §3.5, composition-factor theorem at 861; `TauCetiRoadmap/NoncongruenceModularForms/Suggested.lean:211`. Imported rather than restated. |

The supplied overlap ledger has no dropped cited ids, open-revision-only ids, incoming dropped ids or conflicting heads for this package. Checked its closest heads: #1686, #850 and #913 above; #1728 `TauCetiRoadmap/GroupActionsOnRiemannSurfaces/README.md:46` owns compact holomorphic actions and generating vectors, assigning general Nielsen/Hurwitz data to InverseGalois at line 101; #1727 `TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:54` owns adelic congruence models, with exclusions at line 116. Neither owns this finite cusp calculation or integral three-trace specialization. No mutual hand-off or duplicated object was found. A fresh name-based overlaps query cannot identify an unported package as an open roadmap; the supplied ledger and the actual related heads, rather than that empty lookup, are the overlap evidence.

The prescribed dependency command was run against this README, the supplied order and main content. It exited successfully with the exact output:

```text
depcheck: 237 roadmaps, 2149 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No prohibited supplier was cited.

### Declared supplier contracts

Each slug occurs both in `design/plan.json` and under the correct supplier in `packages/NonabelianLevelStructures/README.md`. Each has a named earlier owner, concrete hypotheses and the exact missing interface. Their related clauses specify a single usable interface, rather than unrelated work bundled together. Searches did not find an earlier owner already supplying the full requested assertion. They are contracts, not unowned prerequisites.

| Conditional gap | Owner and minimal missing content |
| --- | --- |
| punctured-torus-nielsen | MappingClassGroupsAndCanonicalRepresentations §2.3: rank-two outer automorphisms, oriented orbifold identification and the three specified loop images. Existing moduli uniformization does not give all of these normalizations. |
| asada-cofinality | MappingClassGroupsAndCanonicalRepresentations §2.3: domination and its finite étale Galois strengthening over a nonempty open curve. |
| gaschutz-generating-pairs | InverseGaloisAndArithmeticFundamentalGroups §IG.3.2: lift every generating pair through a surjection from a two-generated finite group, compatibly with exterior actions. |
| equivariant-node-smoothing | SchemeAndStackFoundations §4.6: unobstructed balanced tame equivariant deformation and the framed map T↦tʳ, including smooth r=1. |
| geometric-point-completion | AlgebraicModuliForArithmeticGeometry §8.3: the specified geometric-residue-field extension of framed completion, retaining point identification and residual automorphisms. |
| integral-rank-two-invariants | LanglandsParameterStacks §3.8: integral invariant generation with arbitrary base change and surjective restriction to determinant-one pairs. Native coordinate carriers alone do not prove this. |
| vdovin-abelian-subgroups | CFSGBasicProperties A0: bound for every nonabelian finite simple non-PSL₂ group, including passage from the list to all groups and every universe. A Prop-valued classification definition is not evidence for the theorem. |
| markoff-alternating-three-mod-four | ArithmeticDynamicsPartII §7.4a: alternating containment for p≡3 mod 4 under transitivity and MP. The head's p≡1 result and primitivity alone do not supply it. |

### Acceptance signatures, headline coverage and padding

The summary's deep endpoints were matched against the acceptance file:

| Headline | Acceptance representation |
| --- | --- |
| Cofinality, §0.7 | Named in module docstring: missing étale fundamental group of the moduli stack. |
| Cusp classification and vertical groups, §§1.8,2.2–2.3, including the SL₂ specialization §6.6 | Named as missing admissible-cover stack, cusp fibre and automorphism groupoid; no unrelated group-theoretic stand-in. |
| Representability, §2.3 | Named in docstring: missing stacks, rigidification and representable stack morphisms. |
| Combinatorial congruence, §3.3 | `combinatorial_congruence`, line 111. |
| Simple-group congruence, §4.2 | `simple_group_congruence`, line 125. |
| Arbitrary-ring trace-coordinate isomorphism, §5.1 | `integral_trace_coordinates`, line 249. Injectivity and exact invariant image specify the isomorphism; native generic-matrix base change gives the promised naturality. |
| Two Markoff components, degrees, branches and genus, §§7.1–7.3 | Named in docstring: missing level stack, coarse curve and its genus. The available combinatorial genus is not the geometric comparison. |
| Number-field j-finiteness, §7.4 | Named in docstring: missing coarse level curve and its rational points. |
| Large projective monodromy and noncongruence, §§7.6–7.7 | Named in docstring: missing cover monodromy and the Out⁺(F₂) comparison. General composition-factor obstruction is imported. |

No further statable headline was found absent or forced through a stand-in. All seventeen named declarations in Lean occur in the README; all backticked own names in the README have declarations. There are twelve definitions, two abbreviations and three sorried theorems. The one proved example exercises generic evaluation through both tensor factors and conjugation for every algebra; it is a substantive test of the retained definitions, not an admitted Check or small-value quota.

Ran `lake env lean` on the unchanged acceptance file from the pinned content checkout. Exit status 0; the only warnings were the three `sorry` declarations at lines 111,125,249. The individual Tau Ceti import's object file was available; no build or toolchain change was needed. Imports are exactly `Mathlib` and the one used SpecialLinear module.

On a scratch copy, appended `#check @name` for every one of the seventeen declarations and elaborated once. Compared all resulting types to the README and the supplied signature evidence. Finite/group/generation hypotheses, nonabelianness, prime and size conditions, the same-universe PSL₂ exclusion, and the ring/algebra binders remain in scope. Universal coordinate algebras lie in that same universe, so the all-algebras predicate detects the coaction. No binder was lost and no signature change is needed.

Probed every sorried theorem, not a sample. For each, attempted closure by `simp`, `rfl`, `infer_instance`, and `exact Nat.one_dvd _`, using `solve` inside `fail_if_success` so that mere simplification would not count as closing the goal. All twelve closure attempts failed, and the probe file elaborated with only the expected three admission warnings. The opened library near-matches provide no single-lemma proof of a headline. None restates a definition, a boundary case or a README Check; no padding deletion is required. No Lean process was left running.

## Not verifiable

- ASADA2001, §7: the original text remains settled as uncertified. The available CHEN2024 and BBCL22 passages were read for their stated use and strengthening; this does not certify Asada's original proof. No repeat reference request was made.
- VDOVIN1999, Theorem A: the original text remains settled as uncertified. Its full finite-simple-group scope is retained in the declared supplier contract; neither finite examples nor the native classification proposition establish that proof. No repeat request was made.
- The eight missing supplier interfaces are explicit conditional contracts, not completed formal proofs. The review verifies their precision, ownership, declaration and nonduplication; it does not claim they are already implemented.

All four available manifest texts were readable. Ownership was checked against main, the supplied board packages and the indexed available open heads; there is no claim about unavailable or unlisted work.

## Source issues

- **Error** in CHEN2024 at §1.1, printed p.305 (CHEN2024 line 195): the source says coarse degree can be twice the exterior orbit size; it should be equal to or half that size; affects a stated result.
- **Error** in CHEN2024 at Remark 2.2.4, printed p.324 (CHEN2024 line 975): the source says reducedness of the ramification divisor characterizes reducedness of the base without a nonemptiness restriction; it should require surjectivity for the converse; affects a stated result.
- **Error** in CHEN2024 at Proposition 3.2.2(a), printed p.352 (CHEN2024 line 2070): the source says the reduced ramification divisor has degree |G|/e without excluding e=1; it should require e≥2, with degree zero when e=1; affects a stated result.
- **Error** in CHEN2024 at the proof of Proposition 3.2.2(b), printed p.353 (CHEN2024 line 2100): the source says the marked-configuration forgetful maps are proper; it should use smooth surjective maps with geometrically connected fibres, since the fibres are open curves; affects the proof.
- **Misprint** in CHEN2024 at Proposition 4.4.3(d), printed p.369 (CHEN2024 line 2745): the source says the left-hand loop is based at t∞; it should be based at t₀; affects a stated result.
- **Error** in CHEN2024 at the proof of Lemma 4.4.4(g), printed p.370 (CHEN2024 line 2797): the source says the glued admissible cover is flat; it should require finiteness, using normalization and the conductor without flatness at ramified nodes; affects the proof.
- **Error** in CHEN2024 at §4.11, printed p.388 (CHEN2024 line 3502): the source says the odd-dihedral centralizer obstruction is two; it should be one, since the rotation centralizer is the rotation subgroup; affects a stated result.
- **Misprint** in CHEN2024 at the proof of Corollary 4.12.4(b), printed p.390 (CHEN2024 line 3592): the source says the indicated abelian subgroup has order exactly ℓ^(r+1); it should give order at least ℓ^(r+1), since the commutator need not have prime-power order; affects the proof.
- **Misprint** in CHEN2024 at Proposition 5.2.5, printed p.397 (CHEN2024 line 3848): the source says the trace-action arrow is injective; it should be noninjective, since inner automorphisms and central inversion act trivially; affects a stated result.
- **Misprint** in CHEN2024 at the proof of Proposition 5.2.16(d), printed p.402 (CHEN2024 line 4052): the source says the absolutely irreducible commutator trace equals two; it should be different from two; affects the proof.
- **Error** in CHEN2024 at the proof of Proposition 5.2.16(d), printed p.402 (CHEN2024 line 4058): the source says both generators of a dihedral generating pair must be involutions; it should allow a rotation and a reflection; affects the proof.
- **Error** in CHEN2024 at Proposition 5.2.20, printed p.403 (CHEN2024 line 4103): the source says all absolutely irreducible image types map into the non-dihedral trace locus X*; it should require non-dihedral image for this target; affects a stated result.
- **Misprint** in CHEN2024 at Remark 5.2.21, printed p.404 (CHEN2024 line 4154): the source says the upper-right entry of γ∞ is −1; it should be +1 for the stated move b↦ab and column convention; affects a stated result.
- **Error** in CHEN2024 at Lemma 5.3.1, printed p.405 (CHEN2024 line 4195): the source says nonzero last-two trace coordinates imply non-dihedrality; it should distinguish that condition from having at least two nonzero coordinates overall; affects a stated result.
- **Error** in CHEN2024 at the proof of Lemma 5.3.1, printed p.408 (CHEN2024 line 4343): the source says a nonsplit degenerate conic is empty; it should contain exactly (a,0,0); affects the proof.
- **Misprint** in CHEN2024 at the proof of Lemma 5.3.1, printed p.409 (CHEN2024 line 4384): the source says the nonsplit diagonalization is over 𝔽_q; it should be over 𝔽_q²; affects the proof.
- **Misprint** in CHEN2024 at Proposition 5.6.1(a), printed p.418 (CHEN2024 line 4734): the source says the branch-cycle count is (D−3)/3; it should be (D+2)/3; affects a stated result.
- **Gap** in CHEN2024 at Theorem 5.6.4, printed p.419 (CHEN2024 line 4791): the source says coarse rational-point finiteness gives finitely many elliptic K-isomorphism classes; it should conclude finite j-image unless twists are controlled separately; affects the proof.

These descriptions are in the reviewer's words. The package already corrects or avoids these source slips; none requires a package repair.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "e3467a3af5a7af660b2d7d3b2fb818b6171d93c7", "job": "REV-PKG-NonabelianLevelStructures~5", "model": "gpt-6-astra", "worker": "chris-4"} -->
