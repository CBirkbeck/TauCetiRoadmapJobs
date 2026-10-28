<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2203#issuecomment-6442482990 -->
Red team round 1 pass a (codex) of adfb460

Verdict: needs_changes

1. **F01** (P1) Unconstrained entries invalidate the defining-system bijection

   **Location:** packages/ProfiniteCohomologyPartII/Suggested.lean:55–67; packages/ProfiniteCohomologyPartII/README.md:412–418, 585–600. “correspond bijectively”

   **Claim:** The Lean structures are determined by their permitted entries, unique at length two, and bijective with quotient lifts.

   **Witness:** Take Γ = 1, R = 𝔽₂, n = 2, χ = 0. Set every entry to zero, then change entry(0,0) to constant 1. Both structures satisfy every field and induce the same trivial lift.

   **Exact repair text:** “Set every entry with i ≥ j or (i,j) = (0,n) equal to zero; only the permitted strictly upper entries are variable.” Add this normalization as a structure field (or index entries only by permitted pairs). Restrict the structure to n ≥ 2, or separately specify the length-one convention, since its adjacent entry is the corner. Update the docstring and README accordingly.

   **Retest:** For the witness, entry(0,0) = 1 is excluded, every permitted entry is forced by χ = 0, and exactly one structure corresponds to the sole lift.

2. **F02** (P3) Representative-change Check has the wrong Leibniz sign

   **Location:** packages/ProfiniteCohomologyPartII/README.md:451–453. “−d(u₀ ∪ a₁₂ + a₀₁ ∪ u₁ + u₀ ∪ du₁)”

   **Claim:** The displayed expression is the change in the negative cup product.

   **Witness:** Γ = C₂ acts on 𝔽₉ by conjugation; i² = −1. Set u₀ = a₁₂ = 0, u₁ = i, a₀₁ = di. At (σ,σ), a₀₁ ∪ du₁ = 1; the sides are −1 = 2 and +1 = 1.

   **Exact repair text:** Replace the coboundary expression by “−d(u₀ ∪ a₁₂ − a₀₁ ∪ u₁ + u₀ ∪ du₁)”. Keep the preceding expression unchanged.

   **Retest:** d(a₀₁ ∪ u₁) = −a₀₁ ∪ du₁; both repaired sides at (σ,σ) are 2 in 𝔽₃.

3. **F03** (P2) The stated reason for omitting DG targets is false at the pin

   **Location:** packages/ProfiniteCohomologyPartII/Suggested.lean:29–33. “carriers (DGAInfinity's DG algebras and DG categories) are not in the pinned libraries”

   **Claim:** The generic DG carriers are missing.

   **Witness:** TauCeti/Algebra/Homology/DG/Algebra/Defs.lean:182 defines `TauCeti.IsDGAlgebra`; TauCeti/CategoryTheory/DG/HomComplexData.lean:74 defines `TauCeti.DGCategoryData`; TauCeti/CategoryTheory/DG/Basic.lean:71 defines `TauCeti.DGCategory`.

   **Exact repair text:** “The pinned generic carriers are TauCeti.IsDGAlgebra and TauCeti.DGCategoryData. The constructions missing from these statements are this roadmap's all-degree continuous inhomogeneous cochain algebra, its comparison, and its Hom-coefficient cochain category.” Cite those pinned declarations in the supplier contracts and distinguish construction of the specialized cochains from availability of the generic carriers. Reassess each omitted headline on that basis.

   **Retest:** The generic DG-algebra structure has degree-raising, square-zero and Leibniz fields; DGCategoryData has Hom complexes, bilinear composition, differential, associativity and units. They supply exactly the generic carriers claimed absent, without constructing this roadmap's cochains.

4. **F04** (P3) Exponent Checks omit the trivial-group case

   **Location:** packages/ProfiniteCohomologyPartII/README.md:819, 843–844. “At n ≤ 2p − 1 the exponent of U¹ is p.”

   **Claim:** The displayed bounds imply equality with p; every elementary abelian group for odd p has outer exponent p.

   **Witness:** Set p = 3 and n = 0 or 1. U¹ = 1 has exponent 1, not 3. The rank-zero elementary abelian 3-group likewise has outer exponent 1, not 3.

   **Exact repair text:** “For 2 ≤ n ≤ 2p − 1 the exponent of U¹ is p; for n ≤ 1 it is 1.” And: “For a nontrivial elementary abelian p-group with p odd the outer exponent is p; for the trivial group and for p = 2 it is 1.”

   **Retest:** At n = 0,1 both exponents are 1. At n = 2, e₀₂(1) has order p, giving equality in the repaired nontrivial range.

5. **F05** (P3) Fixed abelianized vectors need not be allowed conjugacy classes

   **Location:** packages/ProfiniteCohomologyPartII/README.md:1064. “For χ = 1 the allowed h̄ are the σ-fixed vectors of H^ab.”

   **Claim:** Every fixed vector is an allowed evaluation input lifted from a fixed conjugacy class.

   **Witness:** Use the package's §6.1: H = U¹ in U₇(𝔽₂), σ = (1,1,0,0,0,1), χ = 1. The vector e₂₅ is fixed in H^ab, but every fixed-class image has coordinate 25 equal to zero.

   **Exact repair text:** “For χ = 1 every allowed h̄ is σ-fixed; the converse can fail. In §6.1, e₂₅ is fixed but has no σ-fixed conjugacy-class lift.”

   **Retest:** The fixed-vector space has dimension 6; the span of allowed images has dimension 5. The repaired inclusion allows exactly this failure of the converse.

6. **F06** (P2) Small-rank outer powering is an omitted statable headline

   **Location:** packages/ProfiniteCohomologyPartII/README.md:849–862; packages/ProfiniteCohomologyPartII/Suggested.lean:13–33. “Every headline theorem of the roadmap is stated.”

   **Claim:** The acceptance test includes all deep end results of the roadmap.

   **Witness:** §3.4 proves the finite-group powering theorem used in the advertised outer-exponent development. No Lean theorem states it. Its carriers already occur in line 141: the superdiagonal subgroup, natural powers and Mathlib's IsConj.

   **Exact repair text:** Add the headline: “For p prime, 2 ≤ n ≤ 6, Q in UpperUnitriangularGroup.superdiagonalSubgroup (R := ZMod p) (n := n + 1) 2 and a : ℕ with a ≡ 1 mod p, IsConj Q (Q ^ a).” State it with sorry, add its name to the README, and list it in the module docstring. Retain the exact outer-exponent computation in the README.

   **Retest:** At p = 2 it includes conjugacy to the inverse; at p = 3, n = 6, Q = 1 + E₀₂ + E₂₄ + E₄₆ has Q⁴ = Q + E₀₆, and e₂₆(1)Q⁴e₂₆(1)⁻¹ = Q. It tests the substantive conjugacy result, not the false equality Q⁴ = Q.

7. **F07** (P2) The defining-system signatures admit discontinuous products

   **Location:** packages/ProfiniteCohomologyPartII/Suggested.lean:55–89; packages/ProfiniteCohomologyPartII/README.md:405. “The value of a defining system is a continuous `2`-cocycle”.

   **Claim:** The Lean definitions implement the README's discrete-coefficient continuous cochains. Their signatures assume only a topology on R; even continuity of multiplication is absent.

   **Witness:** Let R = 𝔽₂[α]/(α²+α+1), topologized by cosets of 𝔽₂α, Γ = (R,+), n = 2, both inputs identity. The value is xy. Indistinguishable pairs (0,0),(α,α) map to distinguishable 0,1+α.

   **Exact repair text:** Add `[DiscreteTopology R]` to `DefiningSystem`, `DefiningSystem.value`, `MasseyDefined` and `MasseyContainsZero`; describe their coefficients as “a discrete commutative ring”. Carry the instance explicitly in each signature. The topological group hypothesis may remain on the headline theorems, where it is already present.

   **Retest:** The witness topology is excluded. With discrete R every finite sum of products of continuous entries is continuous; in particular xy on the discrete finite field is continuous. This is exactly the coefficient generality promised for these acceptance-test definitions.

8. **F08** (P3) The infinite-Hom negative control needs a nontrivial middle action

   **Location:** packages/ProfiniteCohomologyPartII/README.md:1342–1344. “For Γ = ∏_ℕ ℤ/2 acting trivially”.

   **Claim:** An additively split sequence of trivial modules can have a discontinuous splitting cocycle into discrete Hom.

   **Witness:** With trivial action on all three terms, g·s−s = 0 for every section s: the splitting cocycle is zero and continuous. The cited ArithmeticGaloisDuality §R02.1.4 example instead shears the middle module.

   **Exact repair text:** “Let A = 𝔽₂, C = ⊕ℕ 𝔽₂ and B = A ⊕ C. Give A and C trivial action and B the action g·(a,c) = (a + Σᵢgᵢcᵢ,c). The splitting cocycle g ↦ (c ↦ Σᵢgᵢcᵢ) is not continuous into discrete Hom(C,A).”

   **Retest:** Each c has finite support, so B is a continuous discrete module. The cocycle's zero fibre is {0} in ∏ℕ 𝔽₂, which is not open. Trivializing the middle action gives the continuous zero cocycle instead.

9. **F09** (P3) The nonabelian boundary Check fails over the zero ring

   **Location:** packages/ProfiniteCohomologyPartII/README.md:1314–1315. “[e₀ⱼ(1), e_jn(1)] = e₀ₙ(1) ≠ 1”.

   **Claim:** The Check applies to the section's arbitrary commutative coefficient ring.

   **Witness:** For the zero ring, n = 4 and r = s = 2, U₅(R) and P_(2,2) are trivial. The displayed commutator equals e₀₄(1) = 1, not a nonidentity element.

   **Exact repair text:** “If R is nontrivial and r + s ≥ n, choose n − s ≤ j ≤ r; then [e₀ⱼ(1), e_jn(1)] = e₀ₙ(1) ≠ 1. For the zero ring P_(r,s) is trivial for all indices.”

   **Retest:** Over 𝔽₂ at n = 4, r = s = 2 the commutator has corner entry 1 and is nonidentity; over the zero ring it is the identity as the repaired Check states.

10. **F10** (P3) Three untwisted comparison Checks omit rank-one hypotheses

   **Location:** packages/ProfiniteCohomologyPartII/README.md:1657, 1680, 1719. “For trivial χ this is 1.6.”

   **Claim:** Trivial coefficient actions alone identify the general filtered-module constructions with the scalar unitriangular constructions of Layer 1.

   **Witness:** Take R = ℤ/4 and every Nᵢ = ℤ/2 with trivial action, n = 3. Then U(W) = U₄(𝔽₂), order 64, whereas U₄(R) has order 4096. Corner and adjacent Hom coordinates have order 2, not 4.

   **Exact repair text:** In the Checks of §§9.3, 9.4 and 9.6, qualify each comparison with “when every Nᵢ is free of rank one over R with a chosen basis”. Retain the arbitrary finite modules in the targets. Add: “For R = ℤ/4 and all Nᵢ = ℤ/2, the corresponding scalar model is over 𝔽₂, even when all actions are trivial.”

   **Retest:** The counterexample now gives U₄(𝔽₂) of order 64 as stated; choosing Nᵢ = R instead gives U₄(ℤ/4) of order 4096 and the claimed Layer 1 comparison.

11. **F11** (P3) Some definition Checks repeat the defining laws

   **Location:** packages/ProfiniteCohomologyPartII/README.md:911–912, 939, 1230–1231. “s(b) = b + d + e and s(c) = c + e.”

   **Claim:** Each definition has at least three discriminating Checks.

   **Witness:** §4.1's third Check repeats its comparison target; §4.2's second repeats the defining formula for κ̃. §6.3's first two Checks repeat the assigned basis images. Those definitions each have only two remaining non-repeated Checks.

   **Exact repair text:** Add these concrete Checks: §4.1: “For H = D₈ = U₃(𝔽₂), B_Bog(H) = 0. Push out Q₁₆ → D₈ along its central C₂ → ℚ/ℤ. Its restriction to the subgroup ⟨a²,b⟩/⟨a⁴⟩ ≅ C₂² has commutator 1/2, and hence is nonzero.” §4.2: “For H = S₃, s = (12), r = (123), κ̃(s ⋏ r) = r, and H ⋏ H → A₃ is an isomorphism.” §6.3: “V^Q = ⟨d,e⟩ has dimension two; the action kernel is ⟨t²,r⟩ of order four. On the dual, (s−1)d* = b*, (t−1)e* = b*, and (s·d*)(s·b) = 0 = d*(b), whereas d*(s·b) = 1.” Replace the repeated Checks rather than copying them into Suggested.lean.

   **Retest:** In Q₁₆, a⁸ = 1, b² = a⁴ and bab⁻¹ = a⁻¹ give [a²,b] = a⁴, which maps to 1/2 in ℚ/ℤ; this rejects an unrestricted H² model for the nonabelian group D₈. In S₃, srs⁻¹r⁻¹ = r⁻² = r; crossed relations give a cyclic exterior quotient of order three. The displayed dual calculations use inverse transpose and exclude the untwisted-dual model.

12. **F12** (P3) The all-degree comparison's locator contains no comparison

   **Location:** packages/ProfiniteCohomologyPartII/README.md:360–361. “HW, Introduction, pp. 1–2, which computes Galois cohomology by this model”.

   **Claim:** This locator supports the continuous homogeneous–inhomogeneous comparison, including its topology and compatibility with the graded cup.

   **Witness:** HW line 22 defines an abstract DG ring; HW line 62–77 introduce Galois Massey products. Neither page constructs the cochain comparison, identifies compact-open topologies, or proves cup compatibility.

   **Exact repair text:** Replace that parenthesis with: “This is the explicit comparison with Mathlib's TopRep.resolutionX and TopRep.homogeneousCochains (Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:54,113), extending the degree-one and degree-two comparisons in TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologyComparison.lean:134,232. The displayed chain maps and their cup compatibility are proved here.” Keep HW's introduction only as background for the Massey definition in §0.3.

   **Retest:** The new locators contain the actual complexes and low-degree comparison maps. The new all-degree identification is explicitly a target, rather than a theorem attributed to HW's introduction.

13. **F13** (P2) The local twisting citation drops the supplier's hypotheses

   **Location:** packages/ProfiniteCohomologyPartII/README.md:2000–2004. “Over ℚ or any completion”.

   **Claim:** InverseGaloisAndArithmeticFundamentalGroups §IG.4.2, Twisting abelian-kernel solutions, directly supplies the stated characterization for every completion and its endpoint map.

   **Witness:** TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:3700 assumes a global field and a surjection Γ_K ↠ Q. At ℚ’s real place, Γ_ℝ=C₂ maps into C₈² with image of order at most 2; neither hypothesis holds.

   **Exact repair text:** “For the local statement, use InverseGaloisAndArithmeticFundamentalGroups §IG.4.1, Finite abelian-kernel obstruction and pullback, which allows every profinite source and a nonsurjective quotient map. For the explicit correspondence, if β is a lift of the endpoint pair and s its fixed section, set z(g)=β(g)s(π(g))⁻¹; multiplication gives z(gh)=z(g)·g z(h). Conversely z(g)s(π(g)) is a lift.” Add §IG.4.1 to the Needs line; retain §IG.4.2 for the global endpoint construction.

   **Retest:** At the real place the endpoint image has order at most 2, rather than 64. The endpoint section gives β=sπ and z=0; differences from any other lift satisfy the displayed cocycle identity without surjectivity or a global-field assumption.

14. **F14** (P3) The block-decomposition Check uses an undefined n=2 case

   **Location:** packages/ProfiniteCohomologyPartII/README.md:855–856, 869–870. “n = 2, …, 6, D² = O² = 1”.

   **Claim:** The Check uses the preceding block decomposition D with blocks of sizes 4 and n−3 throughout n=2,…,6.

   **Witness:** At n=2, Q is a 3×3 matrix. The specified first block already has size 4; integer subtraction gives second size −1, and truncated natural subtraction gives total size 4 rather than 3. Such D is undefined.

   **Exact repair text:** “For n=4,5,6, test the stated blocks of sizes 4 and n−3. For n=2,3, U¹ has exponent at most 2; set D=Q and O=1, so D²=O²=1 and Q⁻¹=OD.”

   **Retest:** At n=2, Q=1+E₀₂ over 𝔽₂ is 3×3 and Q²=1. The repaired D=Q,O=1 are both 3×3 and OD=Q=Q⁻¹. At n=4 the original blocks have sizes 4+1=5, as required.

## Verified sound

Read counts: **16** top-level Lean declarations (7 theorems, 7 definitions, 1 structure, 1 necessary normality instance), all **244** Lean lines, all **2089** README lines, **68** numbered README targets and **221** Check bullets. The bold Summary and six bold convention paragraphs were also read; there are no additional bold theorem headings. The sampled table below records computations and distinguishes failures from successful tests. Source-locator groups and supplier-section counts are given with their ledgers below. Both repository rules files were read. **Checks tested/audited: 221**; twelve Check bullets have a refuting or undefined boundary instance recorded in R01, R02, R04, R05, R08, R09, R10 and R14, and four repeat defining laws or their target in R11. These counts include failed tests; they are not a claim that every Check passed.

The seven admitted theorem signatures retain their intended binders in the supplied elaborated-type artifact. This review compared that artifact with the source and README; it did **not** run a fresh elaboration, in accordance with the read-only/no-Lean instruction. The topology defect R07 is an omitted assumption in the definitions themselves, not a silently dropped section binder.

The pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, as recorded in lake-manifest.json. Library checks used those local copies. The git diff against origin/main changes only packages/ProfiniteCohomologyPartII. The plan diff changes only its top-level gaps list. The source has one `import Mathlib`, three existing TauCeti imports, no `set_option`, no admitted data, no `lemma`, no admitted examples and no API-theorem padding. The normality instance is required to form a quotient in a retained headline; it is not an extra theorem offered as an acceptance test.

The two declared gaps have the same slugs in the plan and the README, named earlier suppliers, and precise hypotheses in context. The characteristic-p gap requests the missing additive Artin–Schreier cohomology input; the integral-gauge gap requests independence over arbitrary commutative rings, beyond the available generic Massey plan. Neither is raised as a defect.

Acceptance-test coverage: Dwyer definedness and zero-membership, Bogomolov vanishing, refined local lifting, local Massey vanishing, rank-one twisted lifting, and the defined non-vanishing ℤ/8 triple are present. Small-rank outer powering is missing (R06); the rationale for omitted DG targets needs correction (R03).

### Sampled adversarial computations

These 26 retained rows sample the full audit across every layer. Values are computations, not Lean proofs; symbols follow the README conventions. The exhaustive per-declaration and per-target ledgers are omitted from this report for posting length. Matrix boundaries, zero rings/modules, p=2,3, nonabelian groups, continuity and finite-versus-infinite Hom were audited where applicable.

| Target and context | Instances; computed values on each side | Result/change |
|---|---|---|
| 0.1, profinite Γ, discrete commutative Γ-ring R | Γ=1: differential sequence 0,id,0,id, H⁰=R,H⁺=0. C₂ acting on 𝔽₉: translated cup(1,i)=−i, untranslated=i. C₃, f(σ)=1,f(1)=f(σ²)=0: df(σ,σ)=2, d(f∪f)(σ,σ,σ)=0, signed RHS2−2=0, unsigned RHS2+2=1. Threefold cup is f(x)xg(y)xyh(z) under both bracketings. ∏C₂: m evaluations impose at most m linear conditions on infinitely many character coordinates, so zero is not isolated pointwise. | Strict signs and discrete topology correct. |
| 0.3, n≥1, cocycles; Lean trivial action | C₃²,n=2,x,y: value=−x∪y, evaluated 2 versus positive1. n=4,zero adjacent, a₀₂=x,a₂₄=y: values include0 and−x∪y≠0. n=3,(x,y,0): first cup nonzero, no system. n=1,constant nonhomomorphism: empty sum0 and contains-zero=true. n=2,Γ=1: 128 Lean systems versus one permitted-entry family. | R01, R07; length-one exception must not be used in the unrestricted API claim about cocycles. |
| 0.4, arbitrary discrete Γ-ring | F₉ conjugation: d⁰i(σ)=i≠0. R02 instance: displayed equality gives 2 versus1; repaired equality2=2. Over ℤ/8, U³=0: (1+U)(1−U+U²)=1; no 1/2 occurs. Trivial action: d⁰=0, representatives coincide. | Integral gauge route valid subject to declared supplier gap; repair Check R02. |
| 1.6, topological Γ, discrete R, n≥2, arbitrary cochains | C₃²,n=3,(x,0,y): a₀₂=x,a₁₃=0 gives−xy≠0; a₀₂=a₁₃=0 gives0. Thus some quotient lifts lift and some do not. C₂,χχ: defined true, zero false; C₄: both true. Zero input: lift1. | Both existential iff statements correct as typed. |
| 2.4, sparse S, Q∈U¹ | Independent computation matched1360 entries over 𝔽₃ (40 pairs at each n=3,…,6) and the inverse formula. a₂=Q₀₂=1 gives M₀₃=2 versus wrong-sign1. a=0 gives S=1 and M=Q. | Formula correct including empty sums/products. |
| 2.5, reversal | Independent tests:40 pairs over 𝔽₂/𝔽₃ give τ²g=g and τ(gh)=τgτh. U₄(𝔽₃): e₀₂(1)→e₁₃(2)→e₀₂(1). U₃ with adjacent1,1: τ(S) corner1, sparse lift corner0. | Automorphism, parameter sign and distinction from sparse lifting correct. |
| 3.4, 2≤n≤6 | Fifty independent 𝔽₃ samples satisfy cubic-corner formula and both conjugation directions. Explicit Q-chain: Q⁴−Q=E₀₆. 150 𝔽₂ samples satisfy D²=O²=1 and Q⁻¹=OD, using D=Q,O=1 at n=2,3 and the stated blocks at n=4,5,6. The n=2 block formula as printed is undefined: R14. Nonzero B detects units≠1 mod oddp. | Result true; statable headline omitted, R06; block Check R14. |
| 4.5, all prime p,n≥0 | n=0,1:G=1; n=2:G=C_p; n=3:G=C_p³, H²=C_p³, B_Bog=0. n=4:[e₀₂,e₂₄]=e₀₄≠1 yet kernelκ̃=1. | Uniform theorem preserved. |
| 5.6, G→A×𝔽_pˣ | n=4,p=2,G=C₂²: boundary dual has4 cyclic cocycles and4 coboundaries, quotient0; full B dual8/4, quotientC₂. n=3:boundary=B dimension 3. Prime-to-p restriction degree d acts invertibly on p-torsion; e.g.p=3,d=2,inverse2. | Vanishing applies to boundary, not arbitrary B. |
| 6.1, specified n=6,p=2 | 4096 candidates,1036 commuting-lift successes; image-span dimension5 versus fixed dimension6; all1036 images have coordinate25=0. A sum such as e₀₂+e₄₆ is an image, not a single basis vector. | Reproduced independently; also witnesses R05. |
| 6.2, C₂² module | Inverse-transpose s,t are commuting involutions. Full dual:8 cyclic cocycles,4 coboundaries,H¹_cyc order 2; boundary dual:4/4,order 1. Restriction to each cyclic subgroup lands in its coboundary image. | Computation reproduced with dual, not primal, action. |
| 6.3, V=𝔽₂⁵,Q=C₂×C₄×C₂ | N_s(b)=d+e,N_s(c)=e,N_t(a)=d,N_t(b)=d+e; every second composition is 0. Action kernel=⟨t²,r⟩ of size 4; fixed space⟨d,e⟩ dimension 2. On dual (s−1)d*=b*,(t−1)e*=b*. | Representation and dual right; repeated Checks R11. |
| 6.4, same module,β | All 256 cocycle identities true; all 16 elements have local coboundary witnesses; none of 32 dual vectors gives a global coboundary. At s use d*, at t use e*, at st value 0. | Explicit nonzero cyclically trivial class confirmed. |
| 6.5, same module,γ | All 256 cocycle identities true. γ(t²)=d+e (bitmask 24), γ(s²)=γ(r)=0; b-coordinate equals j mod 2 at all 16 elements. Changing C₄ to C₂ would require d+e=0, false. | Order-four factor necessary even though its action factors through C₂. |
| 7.4, nonarchimedean K, p prime | ℚ₂,p=3: μ₃ has order 1 and H²=0. ℚ₇,p=3: μ₃ has order 3 and H²≅C₃. For 𝔽₂((t)),p=2: H²=0 by the declared Artin–Schreier input. In characteristic ≠2, μ₂ has order 2, so the no-roots branch never applies at p=2. | No good-prime restriction; the two proof branches are separate. |
| 7.5, charK≠p,μ_p⊂K,γ≠0 | Nonzero functional to 𝔽_p has image of dimension 1, hence onto. γ=0 gives image 0 and is excluded. With p=3,o=1:choose δc=2, total obstruction 1+2=0; wrong sign δc=1 gives 2≠0. | Cancellation sign and use of nonsplitting correct. |
| 7.6, normalized row u,column v | u=e₀*,v=eₙ:ρ(e₀ₙ(t))=t. Vary u only after r or v only before n−s:every support term changes by 0. n=3,r=s=1,u=(1,a,0,0),v=(0,0,b,1):ρ(Q)=Q₀₃+aQ₁₃+bQ₀₂, every pair(a,b) gives the desired retraction; corner counted once. | Source/target and row-first convention correct. |
| 7.7, same,r+s+1=n | Independent enumeration over 𝔽₃ at n=4,r=2,s=1 found 2187 elements by conjugation and 2187 by support, zero discrepancies. For all stabilizer M,N, row u(M−1) supported at 3,4 and (N−1)v at 0,1,2:dot product 0. n=3,standard u,v:conditions M₀₁=M₂₃=0 and ρ̃=M₀₃. | Homomorphism identity follows for every pair, not only random tests. |
| 8.3, K≅ℝ or ℂ | ℂ:only ρ=1. ℝ,p=3:Hom(C₂,p-group)=1. ℝ,p=2,n=3:ρ(σ)=class(e₀₂e₂₃) has square 1 in the quotient but any lift squares to e₀₃≠1; corrected lift e₂₃ agrees modulo P. | Archimedean argument is substantive and avoids applying nonarchimedean duality. |
| 8.4, local K,n≥3 | ℝ,p=2,n=2,sign χ:χ∪χ=1 in H²=C₂, excluded. n=3,(χ,0,χ):choose zero remaining entries,value 0. H²=0 branch:every value class 0. ℂ:H¹=H²=0, every product {0}. | Lower bound and definedness required. |
| 9.5, fixed adjacent representatives | Sign action on N₀ over 𝔽₃: d⁰1(σ)=−1−1=1, so this nonzero representative and zero give different adjacent characters. Normalization aij=Lijχj⁻¹ followed by multiplication by χj returns Lij; at χj=2 the two factors give 2·2=1. Trivial χ with Ni=R recovers the negative scalar cup. | Fixing representatives repairs the source bijection. |
| 10.3, local K, prime p, rank one | At p=2, T=U and both statements coincide. Trivial diagonal at any p gives the constant case. At ℝ,p=3 the sign diagonal gives K′=ℂ of degree 2; restricted obstruction is 0, multiplication by 2 is injective, hence original obstruction is 0. | Arbitrary twists retained; descent direction correct. |
| 11.3, global w | At 2, v₂(16)=4 is not divisible by 8, so [16]≠1 before the boundary quotient; p,q are 2-adic squares, so boundary(−1)=([16],[1]). At odd places one of 2,−2,−1 is square, and the factorization supplies an eighth root. At ℝ, positive 16 has a real root. Globally v_p(p⁴)=4 excludes the nonzero boundary choice, and v₂(16)=4 excludes zero. | w is nonzero globally and zero at every place. |
| 11.4, independent degree-64 field L | p=17,q=41 give quadratic radicands 17,82,1394, distinct from 2,−2,−1. At w above 2, √82/√41=√2 and (√2)⁸=16. Globally an eighth root forces one of the excluded quadratic subfields. Thus [16]≠0 but all local classes vanish; Sha={0,[16]} and automorphisms fix both elements. | Arithmetic supplier and quadratic-subfield argument align. |
| 11.5, Sha over L, ordered coordinates | D-dual Sha has 2³ elements; P-dual has 2⁴. Invariance on D forces a₀₃=1 and leaves a₀₂,a₁₃ free: 4 invariants. Invariance on P forces a₀₂=a₀₃=a₁₃=1 and leaves a₁₂ free: 2 invariants. Their image is only the trivial triple; w=(16,1,1) is one of the 4 invariant triples. | Coordinates and coefficient-map direction correct. |
| 11.10, existential triple over ℚ | Local lifts make both adjacent cups 0 everywhere. Sha²(ℚ,C₈)=0 makes them 0 globally, giving a nonempty Massey set. A zero value would give the global lift excluded by η≠0. For mod-2 coefficients, HW Theorem 5.1 rules out a defined non-vanishing triple over ℚ. | End theorem matches source; local vanishing alone is not being used to prove global mod-2 vanishing. |

The arithmetic rows use the source and exact supplier contracts for arithmetic inputs; the finite matrix and module counts were recomputed directly in scratch. The 1360-entry, 40-pair, 50-sample and 150-sample matrix batches used a fixed review seed, rather than assuming the package's unspecified random samples were reproducible. For the last batch the n=2,3 cases use D=Q,O=1; the original n=2 block description is not defined (R14). The stabilizer count was computed twice, from conjugation equations and from the claimed support equations. Multiplicativity follows from the disjoint-support dot product and does not require enumerating 2187² pairs.

### Supplier and dependency ledger

Checked **22 distinct cited supplier sections across seven roadmaps**, including their repeated uses in Needs lines. Existing roadmaps were checked on main; new supplier roadmaps were read through the supplied roadmap service at their indexed heads. The four resolver leads were resolved: three are generated fields of DefiningSystem, and Steinberg.toElementary_upperUnipotent is a planned target in K2SymbolsBrauer §6.14, not a claimed pinned declaration.

| Supplier | Exact location and consumed contract | Outcome |
|---|---|---|
| ProfiniteCohomology, 11 sections | TauCetiRoadmap/ProfiniteCohomology/README.md:583 (L0), :630 (L1), :725 (L2), :777 (L3), :960 (L5), :1060 (L6), :1265 (L8), :1363 (L9), :1549 (L10), :1739 (L11), :2088 (L12) | Discrete modules, canonical carrier, low degrees, finite-group comparison, exact sequences, transfer, cups, Kummer, all-degree operations and cd_p are present. The export table at :209–228 fixes the planned names. Characteristic-p additive vanishing is correctly a declared gap. |
| DGAInfinity, 2 sections | TauCetiRoadmap/DGAInfinity/README.md:293 (L1), :520 (L8) | Generic DG algebras/categories and matric Massey systems are supplied; no duplicate generic ownership is needed here. Integral gauge independence is declared separately. Generic carriers already have pinned implementations: R03. |
| ProfiniteProPGroups, 1 section | TauCetiRoadmap/ProfiniteProPGroups/README.md:678 (L5), especially :781–833 and :868 | Continuous sections, extension classes and weak embedding problems are present. Its own p-primary scope must not be mistaken for arbitrary R, but the package also cites the actual general FactorSet API and IG.4.1 where needed. |
| ClassFieldTheory, 1 section | TauCetiRoadmap/ClassFieldTheory/README.md:920 (L5), especially :1078–1129 | Named local duality owner; applications use the stronger pinned finite-module theorems with a nonarchimedean local field, finite continuous discrete module and n invertible in K. No residue-characteristic exclusion is added. |
| ArithmeticGaloisDuality, 4 sections | TauCetiRoadmap/ArithmeticGaloisDuality/README.md:797–906 (R02.1.4), :1787–1820 (R02.3.0d), :4010–4055 (R02.4.5a), :4069–4137 (R02.4.5b) | Finite-domain discrete Hom, torsor, cup sign, localization, Sha duality and Wang class contracts are present. Infinite-domain negative control is misquoted in this package: R08. |
| InverseGaloisAndArithmeticFundamentalGroups, 2 sections | TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:3651–3696 (IG.4.1), :3700–3769 (IG.4.2) | General profinite-source obstruction and torsor are in IG.4.1. Global twisting and independent cyclic-eight lifts are in IG.4.2. Independence and degree64 match; local use of IG.4.2 needs R13. |
| K2SymbolsBrauer, 1 section | TauCetiRoadmap/K2SymbolsBrauer/README.md:1136–1150 (§6.14) | The lexicographic product and planned Steinberg.toElementary_upperUnipotent are present for commutative rings and size≥3. Increasing-distance factorization is a distinct extension, with sizes1,2 supplied directly here. |

The dependency gate, run without modifying the order, returned:

```text
depcheck: 149 roadmaps, 1015 edges, 0 problem(s)
```

No UPWARD or CYCLE line was returned. The internal Needs references proceed through earlier targets; the explicit local proof of §8.3 follows §7.8, and §10.3 descends along §10.1 rather than supplying an input back to Layer7. The gap contracts attach to earlier suppliers and introduce no reverse edge. No notion was moved from a later roadmap in this review.

Ownership searches used `roadmaps grep` by mathematical objects, the provided open-head checkouts, main/Completed, board packages, and both pinned libraries. Generic DG/Massey structures, local duality, arithmetic Sha and embedding problems have the owners listed above. The new cochain specialization, distance-order factorization, finite unitriangular actions, Bogomolov/commutativity-preserving exterior theory, fixed-class calculations and refined local lifting have no competing construction in those searched files. Topological Toda/Massey interfaces in EllipticCohomology and generic formality in DGAInfinity concern different objects; arithmetic/geometric Bogomolov conjectures in other roadmaps are not Bogomolov multipliers. No other readable roadmap declares a fully qualified name of this package. Searches returned unrelated open heads too; no unprovided revision was adopted as a new supplier.

### Pinned API checks

The following are the substantive native objects used to assess the signatures and proof routes. File references are relative to their respective libraries.

| Object | Pinned witness and scope |
|---|---|
| Continuous canonical complex | Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:54,113,132: resolutionX, homogeneousCochains, continuousCohomology. Continuous cochains are not replaced by all set maps. |
| Explicit low degrees | TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:132,172,185,215,231,248,469,472,478,712,721,779: C1,d0,d1,Z1,Z2,B1,B2,H1,DiscreteH1,H2 and the trivial-action boundary result. The d¹ formula has +g·a(h),−a(gh),+a(g). |
| Low-degree comparisons | TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologyComparison.lean:134,232: explicitH1AddEquivContinuousCohomology and explicitH2AddEquivContinuousCohomology. The comparison uses the discrete cohomology topology. |
| Cyclic groups and all-degree change of groups | TauCeti/RepresentationTheory/Homological/ContCohomology/FiniteCyclic.lean:94: H1pi_eq_zero_iff_exists_smul_sub_eq. TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro/AllDegrees.lean:208: isIso_shapiroMap. The named corestriction_res was also located; its index multiplier is used only at finite-index/open subgroups. |
| Internal Hom | TauCeti/Topology/Algebra/GroupAction/InternalHom/Basic.lean:165,308,350: homAction, InternalHom and evalPairing. Action is by inverse on the argument and by the target action on the output; finiteness is not built into the name Hom. |
| Unitriangular support | TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/UpperUnitriangular/Basic.lean:107; TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/UpperUnitriangular/Nilpotent.lean:137,181,210,220. The indexed subgroup uses distance at least the parameter; the native commutator theorem is an inclusion, so the reverse inclusion is a real new target. |
| Transvections and triangular group | TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean:144,212,248,256: actual invertible transvections, commuting pairs and the two signed chaining commutators. TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/UpperTriangular/Basic.lean:214 identifies the diagonal kernel. |
| Group extensions | TauCeti/GroupTheory/GroupExtension/Cohomology.lean:187,245: factor-set realization and splitting iff zero. TauCeti/Topology/Algebra/Group/Profinite/EmbeddingProblem/Basic.lean:60 requires a surjective π and finite E,Q, with open kernel; TauCeti/Topology/Algebra/Group/Profinite/EmbeddingProblem/Cohomology.lean:87,110 defines the obstruction and solvability equivalence. The package correctly uses IG.4.1 for nonsurjective quotient maps in its main lifting statements. |
| Local duality | TauCeti/NumberTheory/ClassFieldTheory/Local/Duality/FiniteModule.lean:182–187,253,260,267: K : Type, local valuation/topology, n invertible, finite discrete A, continuous action, nA=0. These support the three cited duality maps at the required generality. TauCeti/NumberTheory/ClassFieldTheory/Brauer/RootsOfUnity.lean:89 gives h2MuEquivZMod with invertibility. |
| Local fields | Mathlib/NumberTheory/LocalField/Basic.lean:45 requires nontrivial valuative relation, compatible topology and local compactness. TauCeti/NumberTheory/LocalField/FiniteExtension/Basic.lean:207 supplies finite-extension local-field structure. No arbitrary topology can make a finite field satisfy IsLocalField. |
| Character extension | Mathlib/Algebra/Module/CharacterModule.lean:101: CharacterModule.dual_surjective_of_injective, characters into AddCircle 1 ℚ. This is the divisible ℚ/ℤ coefficient needed in §4.3, not a finite-coefficient extension theorem. |
| DG carriers | TauCeti/Algebra/Homology/DG/Algebra/Defs.lean:182; TauCeti/CategoryTheory/DG/HomComplexData.lean:74; TauCeti/CategoryTheory/DG/Basic.lean:71. These are actual structured carriers with differential/composition laws, contrary to the module docstring. |

### Source-locator ledger

**38 locator groups verified** against the three cached legal texts; the separate all-degree-comparison attribution to HW's introduction was checked and rejected in R12. Dwyer's locator remains uncertified and is not included in that count. The README cites the arXiv versions actually read, rather than silently using published pagination.

| Source locator group | Extract witness | What was verified |
|---|---|---|
| HW Introduction, p.1 | HW line 22–37 | DG rings, degree-one systems, negative value and Kraines/Dwyer sign distinction. |
| HW Introduction, p.3, item(2) | HW line 98–103 | Attribution of local-field vanishing; package also gives a proof route. |
| HW §2, pp.4–5, Proposition2.2, Corollary2.3, Remark2.4 | HW line 154–198 | Unitriangular filtration, central extension, Dwyer correspondence and existential choice of a quotient lift. |
| HW Definition3.2 and evaluation before Proposition3.3, p.9 | HW line 346–369 | Least outer exponent, conjugacy-power condition and evaluation target with trivial action. |
| HW Remark3.4, p.10 | HW line 379–384 | Motivation for an additional obstruction; the package's five-dimensional examples are explicitly its own. |
| HW Proposition4.1 and (4.1),(4.2), pp.11–12 | HW line 459–484 | Bogomolov input and action on abelianized stabilizer. |
| HW Definition4.3, p.13 | HW line 527–535 | Restriction kernel over cyclic subgroups. |
| HW support argument and Lemma4.6, pp.13–14 | HW line 552–565 | Distance multiplication and p-power exponent bound. |
| HW Lemma4.7, p.14 | HW line 566–603 | Small-rank powering proof, with least-exponent and divisibility slips listed below. |
| HW boundary submodule and Remark4.10,(4.8), p.15 | HW line 610–667 | Boundary generators, sparse inverse and exact conjugation formula. |
| HW Remark4.11, p.15 | HW line 668–677 | Inverse-transpose reversal. |
| HW Lemma4.12, p.16 | HW line 682–688 | Fixed second-diagonal lift. |
| HW Lemma4.13, pp.16–17 | HW line 689–743 | Boundary fixed-class generation, including the corrected parameter a₂. |
| HW Lemma4.15, pp.17–18 | HW line 745–771 | Cyclic-quotient blocks and the pointwise-scalar argument; n=3 separated. |
| HW Remark4.17, p.18 | HW line 776–783 | Failure boundary at n=6; package provides its own explicit finite witness. |
| HW Definition5.2 and observations(1)–(3), pp.18–19 | HW line 789–823 | P_(r,s), normality, quotient and abelianness under r+s=n−1. |
| HW Lemma5.5, pp.19–20 | HW line 830–883 | Splitting class and connecting cup, with finite-domain correction. |
| HW Proposition5.3 proof and Remark5.4, pp.19–21 | HW line 843–926 | Easy cases, nonsplit cancellation and split retraction branch. |
| HW (5.5) and (i)–(iii), p.21 | HW line 889–925 | Row/column retractions, their equivalence and stabilizer support. |
| HW proof of Theorem5.1, p.22 | HW line 965–967 | Application at every completion, exposing the archimedean gap repaired here. |
| HW Proposition6.1, pp.23–24 | HW line 974–1019 | n=4,5 fixed-class generation and endpoint-zero reduction. |
| HW Example6.3 and following discussion, p.24 | HW line 1029–1043 | Nonzero cyclic kernel and failure at n=6. |
| HW Remark7.1 and Example7.2, pp.24–25 | HW line 1046–1068 | Twisted cochain composition and degree-one products. |
| HW §7 filtered groups and (7.2), pp.25–26 | HW line 1073–1109 | Finite modules, block filtrations, corner action and extension. |
| HW Proposition7.3 and (7.3), pp.26–27 | HW line 1114–1148 | Fixed-representative block normalization and negative extension value; source's class-level bijection needs correction. |
| HW proof of Theorem7.4, pp.27–28 | HW line 1188–1200 | Boundary subgroup and prime-to-p descent, with overlap correction. |
| HW Theorem7.5 and its final proof, pp.28,30–31 | HW line 1203,1287–1331 | Defined non-vanishing C₈ triple, local lifting and global obstruction. |
| HW Lemma7.6, pp.28–29 | HW line 1207–1219 | Cyclic-eight lifts of the selected quadratic fields. |
| HW Lemma7.7, pp.29–30 | HW line 1226–1286 | Nonzero Wang class, local roots, dual obstruction and Sha kernel. |
| HW (7.4), p.30 | HW line 1264–1286 | Endpoint/field action in invariant coordinates. |
| HW (7.6), p.31 | HW line 1300–1331 | Split endpoint extension and equivalence with the middle lifting problem. |
| Michailov §1, p.1 | Michailov line 24–34 | Bicyclic restriction definition of the multiplier. |
| Michailov §3,(3.2), p.5 | Michailov line 155–165 | Filtration indexing; last-term slip identified. |
| Michailov Theorem3.1, CasesI–II, pp.5–8 | Michailov line 171–308 | Endpoint wedge collection and vanishing for lower-central terms; distance-ℓ correction. |
| Moravec §2, pp.3–4 | Moravec line 137–150 | Left-conjugation relations and xyx⁻¹y⁻¹ convention. |
| Moravec (3.0.1) and Lemma3.1, p.4 | Moravec line 175–214 | Restriction kernel and quotient by commuting pairs. |
| Moravec Theorem3.2, pp.4–5 | Moravec line 218–250 | Natural duality with the exterior-kernel character group. |
| Moravec §4,(4.0.1), pp.9–10 | Moravec line 443–495 | Commutativity-preserving presentation, universal pairing, central kernel and free-presentation formula. |

## Not verifiable

- Dwyer, Theorem2.4: settled as uncertified in the source manifest. It was not requested again. HW Proposition2.2 and Corollary2.3 provide the readable corroborating statement; Dwyer's original text and normalization were not independently inspected.
- A fresh Lean elaboration or proof build was prohibited. The supplied 16 elaborated signatures were compared, but no new `#check` file was elaborated, and no proposed repair is claimed to have been compiled.
- The two declared supplier gaps remain conditional inputs. This review verified their precision, ownership, placement and absence of an already supplied replacement, not their future implementation.
- Open-roadmap ownership was checked against the supplied heads and the requested index/search service. Ownership against unprovided open-PR files was not checked, and no unlisted open revision was independently fetched or treated as an authorized supplier.
- The finite computations are independent reproductions, not verification of the provenance of the README's original random batches. No random seed or original transcript is supplied. The identities, the stated batch sizes and the substantive exhaustive counts were tested as recorded above.

## Source issues

- **Error** in HW at Lemma5.5, printed p.19: the source says arbitrary discrete quotient modules give a discrete Hom module for the splitting cocycle; it should be finite or finitely generated domain, or pointwise Hom with its topology; affects the proof.
- **Error** in HW at Proposition7.3, printed p.26: the source says all defining systems representing fixed classes correspond to lifts of one adjacent character; it should be fixed adjacent cocycles, with changes of representatives handled by conjugation; affects a stated result.
- **Error** in HW at Definition3.2 and Lemma4.7, printed pp.9,14: the source says the least outer exponent is p also for p=2; it should be 1 for p=2, with the powering action still factoring modulo p; affects a stated result.
- **Misprint** in HW at proof of Lemma4.7, printed p.14: the source says the exponent in the p=3 case is divisible by 9; it should be divides 9; affects the proof.
- **Misprint** in HW at proof of Lemma4.13, printed p.17: the source says the last e₀₃ factor has parameter 1; it should be parameter a₂, agreeing with the specified 03 entry; affects the proof.
- **Misprint** in HW at proof of Proposition6.1, printed p.23: the source says the endpoint-zero reduction is a size-four unitriangular group; it should be size five; affects the proof.
- **Error** in HW at §7, printed p.28: the source says the two full boundary parts form an external direct sum; it should be their internal sum, intersecting in the corner and counting it once; affects a stated result.
- **Gap** in HW at Proposition5.3 and proof of Theorem5.1, printed pp.19,22: the source says the local proposition supplies solutions at every place after proving the nonarchimedean case; it should be supplemented by the real and complex cases; affects the proof.
- **Misprint** in HW at proof of Proposition5.3, printed p.19: the source says the easy-case homomorphism lifts to Z; it should be lifts to U; affects the proof.
- **Misprint** in HW at proof of Proposition5.3, printed p.21: the source says ρ has arguments in the order v,u in two later expressions; it should be u,v, with the row first and column second; affects the proof.
- **Misprint** in Michailov at §3 after (3.2), printed p.5: the source says γ_{m−1}(Uₘ) is trivial; it should be the corner subgroup, with γ_m trivial; affects a stated result.
- **Misprint** in Michailov at Theorem3.1, CaseII, printed p.8: the source says the minimal-distance wedge uses a distance-one transvection; it should be the two distance-ℓ transvections belonging to the lower-central term under consideration; affects the proof.
- **Misprint** in Michailov at §1, printed p.2: the source says vanishing of the multiplier obstructs Noether's problem; it should be nonvanishing that provides the obstruction; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "adfb460c81fea545ade4cef994139401b091a76d", "job": "RT-ProfiniteCohomologyPartII~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
