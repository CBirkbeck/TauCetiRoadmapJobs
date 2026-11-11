<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13007#issuecomment-6790354261 -->
Review (codex) of 873f2a1

Verdict: needs_changes

1. **F01** (P3) Cite the actual equivalence of finite precuspidal data

   **Location:** `packages/NonabelianLevelStructures/README.md:312`, repeated in the API at line 319: “The tangential fibre functor at t₀ is an equivalence from gluing data to precuspidal G-data.”

   **Claim:** the attached Definition 4.6.1, Proposition 4.4.3 and §4.5 locators support this equivalence and the displayed definition of H_(δ,x).

   **Witness:** CHEN2024 line 2930 states the equivalence in Proposition 4.6.2, pp. 373–374. Line 2986 gives H_(δ,x) in equation (4.6), p. 375. Proposition 4.4.3, line 2740, gives monodromy identities instead.

   **Exact repair:** retain the existing locators for the datum and tangential identities, but attach Proposition 4.6.2, pp. 373–374, to the equivalence and equation (4.6), p. 375, to H_(δ,x). No formula changes. The singleton datum and the S₃ right-coset test below satisfy both the definition and the actual equivalence; correcting the locator preserves the previous repair.

2. **F02** (P2) State the integral trace-coordinate headline at the pins

   **Location:** `packages/NonabelianLevelStructures/Suggested.lean:42`, corresponding to `packages/NonabelianLevelStructures/README.md:642`: “invariants under the coaction of a group scheme are missing.”

   **Claim:** the integral trace-coordinate isomorphism cannot be stated at the pins and can therefore be omitted from the acceptance test.

   **Witness:** `TauCeti/Algebra/Bialgebra/ComoduleAlgebra.lean:136` defines scheme invariants. `TauCeti/Algebra/AlgebraicGroup/SpecialLinear/Basic.lean:121` provides O(SLₙ), and line 252 identifies its algebra-valued points with SLₙ. The concrete signature below elaborates with one `sorry` warning only.

   **Exact repair:** add the integral trace-coordinate headline, with real definitions on these native coordinate algebras, and remove its “not statable” entry. One precise formulation is injectivity of the three-trace algebra map together with equality of its image and the invariant functions. The following witness uses two abbreviations and five small definitions; it does not construct a new scheme, use sorry'd data, or quantify over an unspecified coaction. Update the README's native supplier contracts and name correspondence for the retained definitions. Retain the declared integral invariant-generation gap: having carriers does not prove that deep supplier theorem.

   The invariance predicate below quantifies over **all R-algebras**, including the universal algebra O(GL₂) ⊗ O(SL₂ × SL₂). Consequently it is equivalent to equality under the scheme coaction, including over nonreduced rings; it is not the weaker fixed-point condition for GL₂(R). Injectivity plus the image characterization gives exactly R[x,y,z] ≅ O(SL₂ × SL₂)^(GL₂). Universal trace evaluation also gives the specified coordinates for base change; the finished signature should retain the README's arbitrary-base-change compatibility.

   This standalone reproduction was elaborated against the pins under default options. Its five definitions have real bodies and its only admission is the headline theorem:

   ```lean
   import Mathlib
   import TauCeti.Algebra.AlgebraicGroup.SpecialLinear.Basic
   open scoped TensorProduct
   open TauCeti
   universe u
   noncomputable section
   variable (R : Type u) [CommRing R]
   abbrev SLCoord := SpecialLinear.coordinateHopfAlgebra R 2
   abbrev PairCoord := SLCoord R ⊗[R] SLCoord R

   def evalPair {S : Type u} [CommRing S] [Algebra R S]
       (A B : Matrix.SpecialLinearGroup (Fin 2) S) : PairCoord R →ₐ[R] S :=
     Algebra.TensorProduct.productMap
       ((SpecialLinear.pointsMulEquiv (R := R) (A := S) 2).symm A).ofConv
       ((SpecialLinear.pointsMulEquiv (R := R) (A := S) 2).symm B).ofConv

   def conjugateSL {S : Type u} [CommRing S]
       (P : Matrix.GeneralLinearGroup (Fin 2) S)
       (A : Matrix.SpecialLinearGroup (Fin 2) S) :
       Matrix.SpecialLinearGroup (Fin 2) S :=
     Matrix.SpecialLinearGroup.toGLKerEquiv.symm
       ⟨P * (Matrix.SpecialLinearGroup.toGLKerEquiv A).val * P⁻¹, by
         change Matrix.GeneralLinearGroup.det _ = 1
         rw [map_mul, map_mul, map_inv,
           (Matrix.SpecialLinearGroup.toGLKerEquiv A).property,
           mul_one, mul_inv_cancel]⟩

   def traceCoordinates : Fin 3 → PairCoord R :=
     let M := (GeneralLinear.genericMatrix R 2).map
       (SpecialLinear.coordinateMap R 2).hom
     let A := M.map (Algebra.TensorProduct.includeLeft :
       SLCoord R →ₐ[R] PairCoord R)
     let B := M.map (Algebra.TensorProduct.includeRight :
       SLCoord R →ₐ[R] PairCoord R)
     ![A.trace, B.trace, (A * B).trace]

   def integralTraceMap : MvPolynomial (Fin 3) R →ₐ[R] PairCoord R :=
     MvPolynomial.aeval (traceCoordinates R)

   def schemeConjugationInvariant (f : PairCoord R) : Prop :=
     ∀ (S : Type u) [CommRing S] [Algebra R S],
       ∀ (P : Matrix.GeneralLinearGroup (Fin 2) S)
         (A B : Matrix.SpecialLinearGroup (Fin 2) S),
         evalPair R (conjugateSL P A) (conjugateSL P B) f =
           evalPair R A B f

   theorem integral_trace_coordinates :
       Function.Injective (integralTraceMap R) ∧
       ∀ f : PairCoord R,
         f ∈ (integralTraceMap R).range ↔ schemeConjugationInvariant R f := by
     sorry
   ```

   **Repair test:** for unit unipotents A=[1,1;0,1], B=[1,0;1,1] over ℤ, evaluation of the three coordinate polynomials is (2,2,3); reduction to 𝔽₂ gives (0,0,1). Over the zero ring both coordinate algebras are zero. Over ℤ, (I,I) and (A,I) have equal traces (2,2,2) but are not conjugate, so the statement correctly concerns invariant functions rather than classification of all orbits. These are the full arbitrary-ring carriers claimed unavailable, not a field-only replacement.

Two findings: one P2 and one P3. The two previous findings are repaired. The existing acceptance file elaborates with only its two `sorry` warnings, and neither theorem is padding. A further headline can be stated at the pins, as the elaborated witness below demonstrates.

## Verified sound

### Previous findings and the changed passages

The prior review and repair report were read first, then compared with the actual files. Neither previous finding was marked not actionable. Both are repaired; neither is re-raised.

| Previous finding | Repaired passage in `packages/NonabelianLevelStructures/README.md` | Status and verification |
| --- | --- | --- |
| F01, duplicated congruence composition-factor obstruction | Line 17 assigns it to “NoncongruenceModularForms §3.5”; line 119 imports that contract. Line 980 applies “NoncongruenceModularForms §3.5” to the projective stabilizer. | Repaired. The duplicate target and its prime-power/CRT proof are deleted. The remaining §7.7 proves the Markoff-specific adapter and application. Main's `TauCetiRoadmap/NoncongruenceModularForms/README.md:861` and `Suggested.lean:211` own the imported obstruction. |
| F02, Hh incorrectly called a left coset | Line 312: “a right coset”; line 318: “a nonempty right coset”; line 323: “the set of right cosets”; line 324 gives the S₃ contrast. | Repaired in the defining paragraph, API, Check and standard-cusp route. Hh={(123),(23)} and hH={(123),(13)} differ. The genuine left cosets gΓ̄_y in §7.7 have correctly retained their name. |

The new §7.7 adapter at lines 978–980 and its Checks at lines 984–987 were reviewed in full. For a right action the map is gΓ̄_y ↦ y·g⁻¹, with left action g·z=z·g⁻¹. An S₃ three-point action gives 12 successful representative-independence checks and 36 successful equivariance checks. On SL₂(𝔽₃), the Γ₁(3) image has order 3 in a group of order 24: index 8. Adjoining −I doubles that order to 6, so its projective image has index 4. The central-kernel hypothesis therefore excludes a concrete wrong comparison. The inverse-unit-unipotent product is [2,−1;−1,1], with trace 3, agreeing with the original pair's triple (2,2,3).

The removed general composition-factor argument was searched for throughout the package; only the properly attributed application remains. The Lean docstring now points to §§7.6,7.7, and the affected gap consumers use the same numbering. There is no incoming cited id requiring an old-to-new table in the overlap evidence. The source-locator defect in R01 is in the repaired §1.3 passage and was found by reopening that passage's source. The inherited round-2 patterns were also checked: unramified marking versus ramification, eigenline periods, extension-field periods, characteristic-two signs, classification-as-proof, obsolete mapping-class/Belyi references and coarse points versus j-values remain repaired.

### Principles, shape and coverage

Read all 46 numbered targets, all conventions, API bullets, Checks, proof routes, Needs lines, supplier contracts and references in the 1,032-line README, plus the complete Lean file, metadata and manifest. Earlier findings are not treated as instructions. For untouched mathematics, only rows of the previous adversarial table with actual computed values were inherited; descriptions without values were reviewed afresh. All fifteen seeded targets and all changed passages were reopened independently. The table below records sampled targets, headlines and finding-related statements, rather than a long per-target catalogue.

The scope is general finite-group level theory, arbitrary commutative coefficient rings, and arbitrary finite-field slices. Characteristic two, nilpotents, nonflat base change, small fields, unramified origins and the trivial group are not removed. The odd-prime endpoint is a genuine application, not a replacement for the general library. No computational algorithm, copied source passage, route-specific shortcut, sorry'd data or `set_option` was found. R02 is an acceptance-test completeness defect, not a rejection of the mathematical scope.

Compared shape with main's StableReduction, SchemeAndStackFoundations and NoncongruenceModularForms. All eight layers have Examples and Dependencies; each target has a Needs line and a locator, subject to R01's incorrect attachment. The seventeen explicit defining/API blocks have Check counts, in order: 4,4,4,4,4,3,3,3,3,5,6,3,4,4,3,4,3. The blocks are §§0.2,0.5,0.6,1.1,1.3,1.4,1.6,1.7,2.1,3.1,3.2,5.1,5.4,5.5,5.6,6.3,7.5. Each was read for discriminating content, not only counted. No source-chapter layer heading, target-number catalogue, process narrative, machine path, HTML anchor, forbidden import or LaTeX delimiter was found in the authored roadmap/Lean text. Metadata is the single topic `math.NT`.

The dependencies force gluing → finite cusp invariants → cusp automorphisms → obstruction pair → combinatorial congruence → simple-group consequence, and trace coordinates → rotation orders → SL₂ vertical automorphisms/Markoff geometry. Layer headings name mathematical objects. The two branches share the inputs their Needs lines specify; the plan does not declare a source's expository order to be the build order.

### Adversarial mathematics with computed values

F denotes computation in this round, including direct algebra and finite enumeration. I denotes a specified unchanged numerical witness inherited from the prior review, with the present statement and hypotheses reread. Finite tests discriminate conventions and counterexamples; they are not proofs of the general statements. D_(2n) below has order 2n.

| Statement | Instances tried | Values computed on both sides | Result / change |
| --- | --- | --- | --- |
| Conventions: commutator/Fricke and precomposition (F) | Integral unit unipotents; triple (2,3,5) | tr[A,B]=3=4+4+9−12−2. Correct composite (2,1,3), reversed composite (2,5,7). | Correct sign and anti-action; no change. |
| §0.1 marking versus ramification (I) | G=1; unramified C₂; S₃ inertia C₃ | Marking/R degrees 1/0, 2/0, 2/2. | No implicit assumption that an unramified marking is empty. |
| §0.2 Higman invariant/strata (F) | Cyclic groups; S₃; noncentral trace −2 over 𝔽₇ | Commutator orders 1 and 3. (−I+E₁₂)⁻¹=−I−E₁₂; coefficient ratio 6 is outside square set {1,2,4}. | Boundary word and root convention distinguish inverse Higman classes. |
| §§0.3,3.1 stack versus coarse orbits (F) | C₁,C₂,C₃ | Generating-pair counts 1,3,8; inversion quotient orbit sizes 1,3,4. Inversion fixes 0 generating C₃ pairs. | Central inversion is essential; no mistaken factor two. |
| §0.4 boundary hull/density (I) | r=1,2; dual-number tangent; C₂³ | Basis sizes for T=t^r are 1,2; tangent derivatives 1,0. Two generators span ≤4<8 elements in C₂³. | Ramified tangent and empty level are retained; gap supplies the geometric comparison. |
| §0.5 quotient functoriality (F) | Identity; C₂→1; C₂²→C₂; C₂³→C₂² | Coarse degrees 3→1. Six generating pairs map onto three, each fibre size 2. Non-two-generated source has 0 pairs over 6 target pairs. | Source two-generation is necessary for surjectivity. |
| §0.6 absolute levels (I) | C₂; SL₂(𝔽₇), determinant-3 conjugation | Out(C₂) has order 1 and degree stays 3; multiplier 3 is nonsquare and swaps the two trace −2 Higman classes. | Must use an outer-stable union of strata. |
| §0.7 cofinality (F) | β=t on ℚ̄(t) | Degree 1, branch set ∅⊆{0,1,∞}; complement of U has 3 points. | The finite étale conclusion is on U, not all proper X. |
| §§1.1–1.2 normalization/gluing (I) | One- and two-gons; balanced node of index 2 | V=E=1 or 2 gives b₁=1. Node fibre basis {1,ξ,η} has length 3 versus generic rank 2. | Loops retained; ramified-node flatness not imposed. |
| §1.3 finite precuspidal data (F) | H=⟨(12)⟩,h=(123) in S₃; G=1 | Hh={(123),(23)}; hH={(123),(13)}. Singleton datum has 1 action orbit and 1 gluing map. | Coset repair is correct; R01 corrects the equivalence locator. |
| §§1.4–1.5 inertia and connectedness (I) | S₃ rotation/reflection; C₂²,u=1,h≠1 | h⁻¹u⁻¹h=u; M=C₃, index 2. In C₂², generated subgroup size 2<4; graph has 2 components. | Balance and connectedness iff exclude disconnected wrong model. |
| §§1.6–1.7 invariant set/standard cusp (I) | C₂,C₃,S₃,D₁₀; cyclic polygons | I-set counts 2,4,2,4. u=1 polygons have respectively 2 and 3 vertices and edges, so b₁=1. | Twisted conjugacy/gluing quotient has the intended size. |
| §1.8 cusp classification/Higman class (F/I) | S₃; trivial group | [u,h]=(132), [u⁻¹,h⁻¹]=(123); uh=(13) conjugates them. G=1 has 1 cusp with Higman 1. | Correct transport word and degenerate cusp. |
| §1.9 inversion (F) | C₃,u=1; C₂ | h↦h² yields two distinct C₃ classes; C₂ inverse equals h. | Both directions of the lift criterion distinguish the cases. |
| §§2.1–2.3 vertical groups/representability (I) | S₃ rotation/reflection; C₃,u=1 | (|Z|,|u|,k,|A|)=(1,3,1,3),(3,1,1,3); |Z||u|/k=3 in both. Evaluation kernel/image sizes 1/3 and 3/1. | Noninjective evaluation is necessary in cyclic case. |
| §2.4 abelian full levels (I) | n=2,3 | |SL₂(𝔽₂)|=6 with −I=I; n=3 coarse degree 24/2=12, φ(3)=2 components. | n≥3 stabilizer restriction is substantive. |
| §2.5 odd-dihedral obstruction (F) | D₆,D₁₀,D₁₄ | 18,60,126 generating pairs; 1,2,3 coarse orbits of size 3. (|c|,m′,d′)=(3,3,1),(5,5,1),(7,7,1). | Divisor k/gcd(k,k)=1 divides 3; source d′=2 not copied. |
| §3.1 positive Nielsen orbit (F) | C₁,C₂,C₃,S₃,S₄ | Orbit sizes 1,3,4,3,9; C₃ raw orbit size 8. In S₃ the two moves give commutators (132),(123). | Conjugacy, not literal equality of the commutator, is preserved. |
| §3.2 m′ and d′ (F) | D₁₆; empty family in C₃; G=1 | D₁₆ has 96 generating pairs, intersection orders {2,4}, lcm 4 (not 8), d′=8/4=2. Empty lcm=1; G=1 has m′=d′=1. | No zero denominator in finite headlines. Infinite-order junk is excluded by Fintype. |
| §3.3 combinatorial headline (F/I) | C₁,C₂,C₃,S₄; SL₂(𝔽₅); A₇ | Divisor/orbit 1/1,1/3,1/4,3/9; SL₂(𝔽₅): 5/40 and 3/72; A₇: 7/42. | Actual coarse-orbit statement is substantive and agrees with Lean. |
| §4.1 square-subgroup bound (I) | SL₂(𝔽₅),ℓ=5; D₁₀ | First r=1,s=0,v₅(m′)=0≤⌊1/2⌋. Second v₅(m′)=1, with normal C₅ of size 5 and no subgroup of size 25. | Normal-subgroup hypothesis excludes the negative control. |
| §4.2 simple-group headline (I/F arithmetic) | A₇,ℓ=7,17; excluded A₅ | 2520≤7⁶=117649; r=1 yields 7 dividing 42. For ℓ=17,r=0, 17³=4913≥2520 and divisor 1. A₅ has C₅ with 5³=125>60. | Threshold, ceiling, nonabelian and PSL₂ exclusions agree. |
| §5.1 integral trace headline (F/I) | ℤ unit unipotents; zero ring; 𝔽₂; reducible pairs | Triple (2,2,3) reduces to (0,0,1). Over zero ring both algebras are zero. (I,I) and (unipotent,I) both give (2,2,2) but are not conjugate. | Mathematical target passes; R02 adds its statable acceptance signature. |
| §5.2 outer trace action (F) | ℤ,𝔽₃,𝔽₂,𝔽₂[ε]/ε²,ℤ/4 | Vieta/permutations fix (2,2,2); double sign gives (−2,−2,2). Distinct when 4≠0; in char 2 all signs equal 1; at ℤ/4 this witness coincides. Single-sign levels of (1,1,1) are 2 and 4. | Exact sufficient strictness hypothesis retained, including nilpotents. |
| §§5.3–5.4 algebra criterion and trace order (I) | Off-diagonal entries 1 and 2; diag(3,4) over 𝔽₁₁ | Fricke-minus-2 is 1 or 4; generated integral lattice index 1 or 4, both full over ℚ. Diagonal order 5, trace 7, square trace 3, inverse trace 7. | Unit condition is stronger than nonzero; primitive powers need not preserve trace. |
| §§5.5–5.7 admissible traces/normalizers (I) | q=2,3,5,7; q=4,5; n=1 | Admissible traces {1},{0},{1,3},{3,4,5,6}. Diagonal outer orders 1,2. At q=5, |N/C|=120 versus inner size 60; at q=4 transvection coefficient 1 becomes ω≠1. | Small-field and scalar exceptions retained; quotient by G·C is correct. |
| §6.1 epimorphic trace loci (F/I) | q=2,3; identity pair; p=3,5 zero level | Generated groups have sizes 6 and 24, triples (0,0,1),(2,0,1), commutator traces 1,0. Identity pair trace 2. Punctured zero-level counts 0,40. | Epimorphic need not mean non-dihedral at q=2; prime zero-level identity is imported. |
| §6.2 branch words (F) | Nine prime fields; p=5 specifically | γ∞γ₁₇₂₈γ₀ fixes all points. At p=5, D=40 and cycle counts 14,20,8. γ∞(3,3,3)=(3,3,6). | Product convention matches the pinned permutation triple. |
| §6.3 arbitrary-level slices (F/I) | All a,t≠2 in q=3,5,7,11,13; 𝔽₅→𝔽₂₅ | 334 full slices: 0/2q, q−1/2q−1, q+1/1 in repeated/split/nonsplit cases; zero mismatches. Nonsplit-degenerate slice sizes 1 over 𝔽₅,49 over 𝔽₂₅ (one fixed and 48 of period 6). | Counts distinguish full and punctured slices; old points retain their periods. |
| §6.4 exact rotation order (F) | 502 non-dihedral cycles in those fields; 𝔽₇ eigenline | 502 periods equal companion-matrix orders. L₁(1,3)=(3,2)=3(1,3), with six-cycle (1,3),(3,2),(2,6),(6,4),(4,5),(5,1); ord₇(3)=6. | Eigenline points included; no period mismatch. |
| §§6.3–6.5 characteristic two (F) | 𝔽₄, a²+a+1=0 | X²+aX+1 takes values 1,a,1,a, hence has 0 roots. Companion orbit (1,0),(0,1),(1,a),(a,a),(a,1) has period 5. For a=0,t=1, four points form two 2-cycles. | Quadratic splitting criterion, not odd-field discriminant language, is used. |
| §6.6 SL₂ vertical-group headline (I) | 𝔽₇ traces 3,6; D₁₀ in SL₂(𝔽₄) | Companion orders 8,3; scalar intersections have sizes 2,1. Dihedral cusp group has size 5 versus center size 1. | Non-dihedral hypothesis excludes a counterexample. |
| §§7.1–7.3 components, degree and genus (F) | Nine primes below; trace −2 Higman classes over 𝔽₇ | Two distinct classes from nonsquare ratio 6; degrees/cycles below give 2−2g=c₀+c₁₇₂₈+c∞−D. | Two-component interpretation and all nine genus rows agree. |
| §7.3 genus lower bound (F/I) | All 337 primes 13≤p<2304; p≥2304 estimate | Exact minimum is 5 at 13. At 2304, p²/12=4p^(3/2); subtracted divisor-sum bound is <3p^(3/2). | g≥2; no truncated natural subtraction used. |
| §7.4 finiteness headline (F/I) | p=13,j=1 | Degree 208, genus 5≥2; 208 geometric points above one nonbranch j-value. | Faltings controls rational points and their j-image, not all twists. |
| §§7.5–7.6 projective quotient/monodromy (F/I) | Nine primes below; p=7 order condition | Sign orbits all size 4; quotient degrees 10,7,22,52,85,76,115,232,217. Branch parities (0,1,1) at 5,7,11,23 and (0,0,0) at 13,17,19,29,31. At 7, 8<32√8. | Parity agrees; p=7 fails P_MP and is not a contrary S/A case. |
| Repaired §7.7 central quotient adapter (F) | Integral unipotents; Γ₁(3); S₃ coset action | Trace triples both (2,2,3); indices 8 versus 4 without −I; 12/12 representative and 36/36 equivariance equalities with the inverse convention. | Added adapter passes; no recurrence of F02. |
| Repaired §7.7 noncongruence (F/I) | d=5,6,10; abelian level n=3 | |A₅|=60=|PSL₂(𝔽₅)|; 6!=720>216; |A₁₀|=1814400 versus prime candidates 60,168. Abelian monodromy factors through SL₂(𝔽₃), order 24. | Main supplier obstruction applies at actual d≥10; abelian negative control is excluded. |

The inherited A₇ example is fully specified: in image-list notation on {0,…,6}, u=(1,2,3,4,5,6,0), v=(0,2,1,4,6,3,5). Its generated group has order 2520, its commutator (6,3,1,0,2,4,5) has order 7, and its coarse orbit has size 42. This is numerical evidence inherited under the rule, not a new claim of enumeration in this round.

All nine branch/genus rows were freshly recomputed:

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

### Source sample and manifest

All fifteen seeded targets were checked in the legal cached texts, comparing theorem numbers, printed pages, hypotheses and conclusions. CHEN2024 is the published author copy, using published numbering. BBCL22, MP18 and CHEN2018 use the manifest's specified preprint versions; page references below identify those versions. Every cited work has one manifest key: four available texts and two settled uncertified texts. No additional source fetch, manifest edit or reference request was needed. No additional author-flagged unverified locator was found.

| Seeded target | Exact source passages opened | Outcome |
| --- | --- | --- |
| 0.2 Higman invariant and strata | CHEN2024 line 1070, Definition 2.3.1, and line 1090, Proposition 2.3.2, p.327; line 1101, Remark 2.3.3, and line 1118, Definition 2.3.4, p.328 | Fixed roots, cotangent character, peripheral orientation and clopen strata agree. |
| 0.5 Functoriality under quotients | CHEN2024 line 1448, Theorem 2.5.2(6), p.337; line 1699, Proposition 2.5.10, especially (f) at line 1723, pp.344–345 | Quotient map, properness, fibres and surjectivity agree with the two-generated source hypothesis. Gaschütz is separately contracted. |
| 0.7 Cofinality | CHEN2024 line 1464, Theorem 2.5.2(7), and proof at line 1492, pp.337–338; BBCL22 line 612, Theorem 2.2.3, and proof at line 638, preprint pp.14–15 | Supports domination of finite étale covers and the strengthened Galois cover of a nonempty open U. Asada's original remains uncertified. |
| 1.3 Finite precuspidal data | CHEN2024 line 2912, Definition 4.6.1, p.373; line 2930, Proposition 4.6.2, pp.373–374; line 2740, Proposition 4.4.3, p.369; line 2986, equation (4.6), p.375 | Mathematics supported; R01 corrects the locators attached to the equivalence and H. |
| 1.8 Cusps and Higman class | CHEN2024 line 3139, Theorem 4.8.4, pp.379–380; line 3150, Definition 4.8.5; line 3178, Proposition 4.8.6, p.380 | Generating-pair quotient, standard cusp and transported Higman word agree. |
| 1.9 Inversion of the target | CHEN2024 line 3205, Proposition 4.9.1, pp.380–382 | Symmetric-path hypothesis and twisted-conjugacy criterion retained; inverse class need not be equal. |
| 2.5 Odd-dihedral example | CHEN2024 line 3493, §4.11, p.388; CHEN2018 line 1386, Theorem 4.2.2, preprint p.29 | Odd k≥3 gives φ(k)/2 degree-three components. The roadmap correctly changes the source's d′ to 1. |
| 3.1 Positive Nielsen orbits | CHEN2024 line 184, §1.1, p.305; line 3440, discussion of Theorem 4.10.5, p.387; line 3473, footnote 28 | Exterior and central-inversion quotients agree; orientation convention checked. The introductory degree slip is not copied. |
| 3.2 Obstruction pair | CHEN2024 line 3429, Theorem 4.10.5(a),(b), pp.386–387; d′ at line 3432 and m′ at line 3433 | Centralizer quotient and least common killing exponent match the Lean bodies, including empty lcm=1. |
| 5.2 Outer automorphisms | CHEN2024 line 3835, Proposition 5.2.5, pp.396–397; formulas at line 3852 | Three polynomial formulas agree. Right precomposition gives an anti-homomorphism; inner automorphisms and −I prevent injectivity. |
| 6.1 Epimorphic trace loci | CHEN2024 lines 4012,4020, Definitions 5.2.14–5.2.15; line 4037, Proposition 5.2.16, pp.401–402; line 4073, Proposition 5.2.17, pp.402–403 | General finite-field statements and small-field exceptions agree; prime trace −2 equality is imported. |
| 6.3 Arbitrary-level rotation slices | CHEN2024 lines 4232–4389, proof of Lemma 5.3.1, pp.406–409 | Companion action and conic equation match; split, nonsplit, repeated-root and characteristic-two cases checked. The singleton correction is necessary. |
| 6.4 Exact rotation order | CHEN2024 line 4193, Lemma 5.3.1, p.405; diagonalization at line 4291, p.408; even characteristic at line 4375, p.409 | Non-dihedral hypothesis and all period cases supported; package includes eigenline points and avoids the misleading parenthesis. |
| 7.1 Markoff components/Higman classes | CHEN2024 line 4645, Theorem 5.5.7(b), p.416; line 4703, §5.6, p.417; line 4763, Theorem 5.6.3, p.418 | Conditional transitivity, two Higman classes and component degrees match; no unconditional connectedness claim substituted. |
| 7.3 Genus formula | CHEN2024 line 4763, Theorem 5.6.3, pp.418–419; line 4788, Theorem 5.6.4, p.419 | All divisor-sum and residue-class terms agree; nine independent cycle calculations above reproduce the formula. |

Also reopened the integral headline at CHEN2024 line 3786, Theorem 5.2.1, pp.395–396; the simple-group consequence at line 3607, Corollary 4.12.5(b), p.391; and MP18 lines 90 and 96, Theorems 1.3 and 1.4, preprint p.3. The 3-mod-4 result retains transitivity and the full MP order condition. Source mistakes are recorded below independently of whether the roadmap already corrects them.

### Pinned declarations and duplication by object

These files were opened at the supplied pins. Search results and near-match lists were used as leads, not proofs of ownership or absence.

| Object | Pinned declaration locations and semantic check |
| --- | --- |
| Commutator/order | `Mathlib/Algebra/Group/Commutator.lean:28`; `Mathlib/GroupTheory/OrderOfElement.lean:179`. Convention xyx⁻¹y⁻¹; infinite-order zero junk cannot enter the finite-group headlines. |
| Centralizer, cyclic subgroup, generation | `Mathlib/GroupTheory/Subgroup/Centralizer.lean:30`, 35,118; `Mathlib/Algebra/Group/Subgroup/ZPowers/Basic.lean:31`; `Mathlib/Algebra/Group/Subgroup/Lattice.lean:329`. Native closure and membership, not new carriers here. |
| Pair permutations | `Mathlib/Logic/Equiv/Prod.lean:84`,302; `Mathlib/Algebra/Group/Units/Equiv.lean:100`; `Mathlib/Algebra/Group/Equiv/Basic.lean:242`. Shear has the correct multiplication order; inversion is a permutation, not a nonabelian group homomorphism. |
| Conjugation/orbit quotient | `Mathlib/GroupTheory/GroupAction/ConjAct.lean:43`,128,223; `Mathlib/Algebra/Group/Action/Prod.lean:88`; `Mathlib/Algebra/Group/Action/End.lean:184`; `Mathlib/GroupTheory/GroupAction/Defs.lean:49`,287,349. No geometric orbit identification is silently included in the definitions. |
| Cosets | `Mathlib/GroupTheory/Coset/Basic.lean:56`,60,170. Left multiplication orbits are Hh; this is the repaired right-coset convention. |
| lcm, valuation, simple groups | `Mathlib/Algebra/GCDMonoid/Finset.lean:48`,57; `Mathlib/Data/Nat/Factorization/Defs.lean:51`; `Mathlib/GroupTheory/Subgroup/Simple.lean:38`. Empty lcm=1; simplicity includes nontriviality, not nonabelianness. |
| SL/PSL/trace | `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:70`; `Mathlib/LinearAlgebra/Matrix/Trace.lean:43`; `Mathlib/LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean:36`. Determinant-one matrices, diagonal sum, and quotient by center; coefficient-ring hypotheses read. |
| Other cited native carriers | `Mathlib/GroupTheory/FreeGroup/Basic.lean:459`; `Mathlib/Data/Nat/Totient.lean:38`; `Mathlib/Dynamics/PeriodicPts/Defs.lean:246`; `Mathlib/GroupTheory/Exponent.lean:72`; `Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean:35`. Finite hypotheses exclude zero period/exponent where a positive order is used. |
| Alternating/congruence | `Mathlib/GroupTheory/SpecificGroups/Alternating/Simple.lean:201`; `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean:42`,164. Simplicity needs degree at least five; congruence means containing Γ(N) for N≠0. |
| Fricke | `TauCeti/LinearAlgebra/Matrix/Trace/FinTwo.lean:231`,250. Arbitrary commutative-ring trace identity; imported, not duplicated. |
| Branch triples and genus | `TauCeti/Combinatorics/PermutationTriple/Basic.lean:76`; `TauCeti/Combinatorics/PermutationTriple/EulerCharacteristic.lean:67`,169,208. Product order infinity,one,zero; integer Euler characteristic and geometric connectedness requirements. |
| Belyi | `TauCeti/FieldTheory/FunctionField/Belyi/Existence.lean:62`,109,163. Algebraicity over ℚ and exact constants accompany the existence statement. |
| Classification | `TauCeti/GroupTheory/SpecificGroups/CFSG/Classification.lean:54`,60,67. A Prop-valued definition, tautological iff and transfer from an assumed proof do not prove classification. |
| Covering monodromy | `TauCeti/Topology/Covering/Monodromy/Basic.lean:63`. Topological covering monodromy does not supply the moduli-stack or algebraic level-curve comparison. |
| Native invariant subalgebra | `TauCeti/Algebra/Bialgebra/ComoduleAlgebra.lean:95`,112,136,142. The coaction equalizer is exactly scheme-invariant functions. R02 corrects the contrary absence claim. |
| Native coordinate algebra and universal conjugation | `TauCeti/Algebra/AlgebraicGroup/SpecialLinear/Basic.lean:121`,127,159,252; `TauCeti/Algebra/AlgebraicGroup/Hopf/Conjugation.lean:66`,88,107. O(SL), its generic determinant-one matrix and all algebra-valued points exist. Generic conjugation has the stated left-action convention. |

The extra native invariant/coaction files matter: the previous review's broad assertion of nonstatability was not accepted as evidence. Their presence does not duplicate the integral invariant-generation theorem, but does make its trace-coordinate consequence statable.

Object searches covered current main, board packages and indexed open heads with `roadmaps grep`/`show`, and pinned source files with text searches. The nine-name near-match list was read. Opened candidate objects include matrix transvections (`Mathlib/LinearAlgebra/Matrix/Transvection.lean:81`), coset-action normal core (`Mathlib/GroupTheory/GroupAction/Quotient.lean:428`), commutator sets/representatives (`Mathlib/GroupTheory/Commutator/Basic.lean:418`,533,541), and cyclic subgroup cardinality (`Mathlib/Data/ZMod/QuotientGroup.lean:160`). None is either orbit congruence. `TauCeti/GroupTheory/FreeGroup/Nielsen.lean:45` supplies a free-group Nielsen automorphism, not the positive pair-orbit congruence or Out(F₂) ≅ GL₂(ℤ). No collision with any of this package's nine fully qualified names was found.

The specific cusp invariant, cusp automorphism calculation and resulting obstruction congruence remain this roadmap's ownership beyond the earlier stack and coarse-degree supplier. Its arbitrary-level finite-field slice theory extends the prime zero-level supplier. General integral invariant generation remains with LanglandsParameterStacks; this package owns the three-trace specialization. The general congruence composition-factor obstruction is now correctly left with NoncongruenceModularForms.

### Cross-roadmap citations, overlap and supplier order

Every Needs line and supplier citation was read against the following main or supplied open-head text. Locations are in `TauCetiRoadmap/<Name>/README.md`, unless another path is specified. Pull-request numbers here identify reviewed evidence, not roadmap dependencies by number.

| Supplier and version | Sections actually resolved |
| --- | --- |
| ArithmeticDynamicsPartII, #1686 | §0.1:99; §1.4:213; §§2.1–2.4:235,256,264,272; §§3.6–3.7:441,451; §4.2:490; §§6.0–6.6:767,796,822,845,853,863,873; §§7.2–7.4a:924,948,970,978. §6.0 includes the quotient map and coarse congruences; §6.1 includes the prime trace −2 equality; §7.4a does not supply the general 3-mod-4 gap. |
| InverseGaloisAndArithmeticFundamentalGroups, #850 | §IG.1.2 tangential fibres at 1094; §IG.1.3 closed-field extension at 1335; §IG.1.4 moduli action at 1438; §IG.3.1 at 2581; §IG.3.2 exterior epimorphisms at 2808; §IG.5.4 admissible covers/stable marking at 5847,5877. Its left e∘α⁻¹ and this package's right precomposition give matching orbit conventions. |
| AnabelianGeometryAndNonabelianChabauty, #1021 | §§1.1–1.2 at 3418,3604, with tangential comparison, inertia orbits, good paths at 3651, symmetry at 3678 and existence at 3704. Product infinity,one,zero agrees. |
| StableReduction, main | Layers 1,2,3 at 372,405,467; node/conductor, pointed dual graphs and clutching. Lines 487–500 retain markings and self-clutching genus +1. |
| SchemeAndStackFoundations, main | §§1.19,1.21,1.23:2923,3055,3124; §3.2:4845; §4.6:5574; §4.15:6037. General stack/Riemann–Hurwitz/stable-curve interfaces exist; equivariant node smoothing is separately contracted. |
| AlgebraicModuliForArithmeticGeometry, #853 | §5.1:8413, with `ArithmeticModuli.Rigidification.vertical_kernel` at 8525; §8.3:9725, `schemeFramedCompletionEquiv` at 9820 and completed-atlas interface at 9960. The geometric-residue extension is not silently inferred from the finite-type point statement. |
| ModularCurvesPartII, #913 | §§3.1,3.11,3.12:900,1203,1220. Full Drinfeld level, compactified coarse j-line and normalized level-H stack; abelian comparisons only. |
| ArithmeticGaloisRepresentations, #856 | §1.7:1170; §4.3:3206; §4.4:3263. Burnside absolute irreducibility, projective linear-group automorphisms and Dickson classification, with their field restrictions. |
| LanglandsParameterStacks, #1202 | §2.1:562; §3.8:886. Coaction/quotient framework and characteristic-zero character comparison do not give arbitrary-ring generation, restriction and base change. |
| ClassicalArithmeticCompletion, main | §§4.57,4.58,4.76:8621,8670,9139. Even-sign-enlarged group, coefficient-one Markoff surface and finite-field point count. The smaller Γ is expressly distinguished. |
| HeightsRationalPointsAndObstructions, #1017 | §4.6:2052 points to the precise §6.4:2932 Mordell/Faltings result; number-field and genus≥2 hypotheses match. |
| MappingClassGroupsAndCanonicalRepresentations, board | `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:864`, §2.3, with genus-one Check at 886. It precedes this package in the order; two exact gap contracts supply the specified strengthening. |
| BelyiMaps, main | Layer 10 §10.4:4115; pinned Belyi existence cited at 4129. No unowned successor is needed. |
| CFSGBasicProperties, main | A0:786. List-entry properties do not establish CFSG; the full universe-independent Vdovin/classification input is explicitly contracted. |
| NoncongruenceModularForms, main | §1.1 for projective coset monodromy; §3.5:841, obstruction at 861; `TauCetiRoadmap/NoncongruenceModularForms/Suggested.lean:211`. These are the owner and statement imported by the repaired §7.7. |

The two resolver alerts are false positives after direct resolution: the mapping-class section exists in the board package, and the named rigidification declaration is a planned supplier declaration at #853, not a claimed pinned lemma. No missing or upward supplier citation was found.

Read the board-package index and the overlap evidence before making absence claims. It reports no conflicting open head changing this roadmap, no dropped cited id, and no cited id available only in an open revision. The five closest heads were inspected: #1686 ArithmeticDynamicsPartII, #850 InverseGaloisAndArithmeticFundamentalGroups and #913 ModularCurvesPartII supply the objects above; #1727 AdelicImagesAndModularCurves imports modular-subgroup geometry from NoncongruenceModularForms (`TauCetiRoadmap/AdelicImagesAndModularCurves/README.md:30`); #1728 GroupActionsOnRiemannSurfaces owns smooth compact surface signatures/generating vectors and leaves Hurwitz/Riemann-existence foundations to InverseGalois (`TauCetiRoadmap/GroupActionsOnRiemannSurfaces/README.md:45`,101). No second owner or reciprocal handoff of this package's specific cusp calculation was found. No overlap-rule finding arose.

The prescribed dependency check completed successfully. Output:

```text
depcheck: 236 roadmaps, 2146 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No merge-order or tooling file was edited.

All eight gap slugs match both the README's Exact supplier contracts and the plan's top-level gaps. Each has a named supplier and precise mathematical hypotheses; no supplier is `none`. They are contracts, not findings:

| Gap | Why the contract remains needed and appropriately bounded |
| --- | --- |
| punctured-torus-nielsen | The mapping-class §2.3 input must include Out(F₂), positive orientation, boundary word and the three specified loops, not just an abstract uniformization. |
| asada-cofinality | The finite-étale domination theorem and its open-curve Galois strengthening go beyond uniformization and are exactly the §0.7 input. |
| gaschutz-generating-pairs | InverseGalois §IG.3.2 supplies exterior epimorphisms; surjectivity on generating pairs along every quotient of a two-generated finite group is additional. |
| equivariant-node-smoothing | Ordinary node deformation is supplied; the tame balanced G-equivariant hull and T↦t^r comparison are the missing specialization. |
| geometric-point-completion | The finite-type residue hypothesis in the available completion comparison excludes the explicitly named geometric points. |
| integral-rank-two-invariants | Native coaction and coordinate carriers exist (R02), but general integral invariant generation, arbitrary base change and restriction to determinant one are not thereby proved. |
| vdovin-abelian-subgroups | Requires all nonabelian finite simple groups in every universe outside PSL₂, including the passage from the classified list to all groups. A Prop definition alone is insufficient. |
| markoff-alternating-three-mod-four | The supplier gives primitivity and 1-mod-4 containment; the specified 3-mod-4 containment under transitivity and MP is additional. |

These are related theorem interfaces, not vague collections of unspecified prerequisites. They do not duplicate any provided theorem found in the ownership audit. A future acceptance remains conditional on them; this needs-changes verdict does not use the accepted-only `conditional_gaps` JSON field.

### Headline completeness, names, elaboration and padding

The README's headlines and their acceptance-test disposition are:

| Headline | Disposition |
| --- | --- |
| Cofinality, §0.7 | Named as not statable in the module docstring; moduli-stack finite étale covers/fundamental group missing. |
| Cusp classification and vertical groups, §§1.8,2.2–2.3 | Named as not statable; admissible-cover stack, cusp fibre and automorphism groupoid missing. |
| Compactified representability, §2.3, and SL₂ vertical specialization, §6.6 | Geometric representability/vertical-group headline is covered by the docstring's missing-stack explanation. A finite scalar-intersection stand-in would not state it. |
| Combinatorial congruence, §3.3 | `combinatorial_congruence` states the actual coarse pair-orbit divisibility. |
| Simple-group congruence, §4.2 | `simple_group_congruence` retains arbitrary universe, nonabelianness, exclusion of all finite-field PSL₂ groups and the precise threshold. |
| Integral three-trace isomorphism, §5.1 | R02: falsely listed as not statable; native coordinate algebras and the elaborated witness make it statable. |
| Two trace −2 components, degrees, branch data and genus, §§7.1–7.3 | Named as not statable on the actual level curve/coarse-space carriers. A bare numerical genus identity would not replace this geometric headline. |
| Rational j-invariant finiteness, §7.4 | Named as not statable; actual level curve and its rational points missing. |
| Large projective monodromy and noncongruence, §§7.6–7.7 | Named as not statable; actual level cover and the punctured-torus identification are not supplied at the pins. Topological monodromy alone is insufficient. |

The original `Suggested.lean` has one `import Mathlib`, one module docstring, the proper namespace, layer comments, seven real definitions and two admitted theorems. It has no options, admitted examples, sorry'd data, placeholder Prop fields, `lemma` declarations or forbidden diagnostics. All nine own names resolve in the README, and every backticked identifier attributed to this roadmap resolves to one of those declarations. External identifiers were checked as pinned declarations or explicitly attributed planned supplier names, not mistaken for own names.

Ran `lake env lean` on `packages/NonabelianLevelStructures/Suggested.lean` from the content checkout: exit 0, with only the two expected declaration-uses-sorry warnings, at lines 106 and 120. No TauCeti import needed building for that file. In a scratch copy, appended `#check @name` for all nine declarations and inspected the elaborated signatures against the README and supplied signature ledger. No needed binder disappeared: Fintype is present on the cusp exponent and both headlines; the simple-group theorem keeps IsSimpleGroup, explicit nonabelianness, finite-field PSL₂ exclusion, primality, generation and the size bound. No author file was changed.

The one-tactic probe was run on **both** sorried theorems, not sampled. For each, tested `simp`, `rfl`, `infer_instance`, and `exact Nat.one_dvd _` inside `fail_if_success`, followed only by the original admission. All eight attempts failed; the probe elaborated with only the two expected sorry warnings. Reading the native definitions and near-matches found no single-library-lemma equivalent. Neither theorem restates a definition, mirrors a small Check or treats only a boundary case. Their nonabelian examples and nontrivial divisors appear above. No padding finding is raised.

Finally, the separate R02 reproduction was elaborated using the already built individual Tau Ceti modules, also under default options. It completed with its single headline sorry warning and no errors. This is an elaboration witness for statability, not a proof of the integral theorem. No processes were left running.

## Not verifiable

- **ASADA2001**, its recorded cofinality locator: the original text remains settled as uncertified. The stated consequence was checked in CHEN2024 and the strengthening in BBCL22; the original proof was not inspected and no repeat request was made.
- **VDOVIN1999**, Theorem A: the original text remains settled as uncertified. The exact all-simple-groups input is a declared supplier contract; neither the original proof nor a formal proof of classification is claimed verified. No repeat request was made.
- The eight declared supplier gaps are unfulfilled formal interfaces, not defects or completed proofs. Numerical tests and source comparisons do not certify their future formal implementations.

Ownership against the indexed open heads was checked as described above; there is no blanket claim that unnamed or unavailable work was searched. All four available manifest texts were readable.

## Source issues

- **Error** in CHEN2024 at §1.1, printed p.305 (CHEN2024 line 195): the source says the coarse degree is equal to or twice the exterior-pair orbit size; it should be equal to or half that size; affects a stated result.
- **Misprint** in CHEN2024 at Proposition 4.4.3(d), printed p.369 (CHEN2024 line 2745): the source says the left-hand loop is based at t∞; it should be based at t₀; affects a stated result.
- **Error** in CHEN2024 at §4.11, printed p.388 (CHEN2024 line 3502): the source says the odd-dihedral centralizer obstruction d′ is two; it should be one, since the rotation centralizer is the rotation subgroup; affects a stated result.
- **Misprint** in CHEN2024 at Proposition 5.2.5, printed p.397 (CHEN2024 line 3848): the source says the trace action has an injective arrow; it should be a noninjective anti-homomorphism for right precomposition, killing inner automorphisms and −I; affects a stated result.
- **Misprint** in CHEN2024 at the proof of Proposition 5.2.16(d), printed p.402 (CHEN2024 line 4052): the source says the absolutely irreducible commutator trace equals two; it should be different from two; affects the proof.
- **Error** in CHEN2024 at the proof of Proposition 5.2.16(d), printed p.402 (CHEN2024 line 4058): the source says both generators of a dihedral generating pair map to involutions; it should allow a rotation and a reflection as well; affects the proof.
- **Error** in CHEN2024 at Lemma 5.3.1, printed p.405 (CHEN2024 line 4195): the source says nonzero last-two trace coordinates imply non-dihedrality; it should distinguish that condition from having at least two nonzero coordinates overall; affects a stated result.
- **Error** in CHEN2024 at the proof of Lemma 5.3.1, printed p.408 (CHEN2024 line 4343): the source says a nonsplit degenerate conic is empty; it should have exactly the point (a,0,0); affects a stated result.
- **Misprint** in CHEN2024 at the proof of Lemma 5.3.1, printed p.409 (CHEN2024 line 4384): the source says the indicated nonsplit diagonalization is over 𝔽_q; it should be over 𝔽_q²; affects the proof.
- **Misprint** in CHEN2024 at Proposition 5.6.1(a), printed p.418 (CHEN2024 line 4734): the source says the relevant branch-cycle count is (D−3)/3; it should be (D+2)/3; affects a stated result.
- **Gap** in CHEN2024 at Theorem 5.6.4, printed p.419 (CHEN2024 line 4791): the source says coarse-curve rational-point finiteness gives finitely many elliptic K-isomorphism classes; it should conclude finite j-image unless twists are controlled separately; affects the proof.

For the non-dihedrality source error, a concrete witness is over 𝔽₇: A=[0,6;1,0], B=diag(2,4) has triple (0,6,0), commutator trace 6≠2 and dihedral projective image. Its last-two pair is nonzero while it has only one nonzero coordinate. The roadmap already uses the stronger correct hypothesis. No source text has been copied into the repository, and these errata use descriptions rather than quotations.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "873f2a12cc24a0a133a7de8e5cb8bd5f657e79e4", "job": "REV-PKG-NonabelianLevelStructures~4", "model": "gpt-6-astra", "worker": "chris-10"} -->
