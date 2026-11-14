<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14777#issuecomment-6868700134 -->
Review (codex) of 35fb1a6

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) Restore the flat-coefficient Künneth theorem

   **Location.** `packages/CohomologyOfGroups/design/README.md:1088`: “`N` is projective over `k`”; line 1091: “split (not naturally) when also `M` is projective”. The restrictions are repeated in `packages/CohomologyOfGroups/design/plan.json:1116` and its hypotheses.

   **Claim.** The projective-coefficient theorem is true, but omits source-supported generality. Over a PID, the cited theorem permits one flat complex and an arbitrary second complex, and gives noncanonical splitting. Group chains with flat coefficients meet that hypothesis. The current signature excludes flat nonprojective coefficients and unnecessarily restricts splitting in this PID case. This violates the general-library requirement; availability of a projective-only native proof input does not settle the intended scope.

   **Witness.** Loh19 lines 5854–5866, Theorem 3.2.22, printed p. 135, allows one flat complex. For `k = ℤ`, `G = H = C₂`, `M = 𝔽₂`, `N = ℤ[1/3]`, it gives `0 → 𝔽₂² → 𝔽₂³ → 𝔽₂ → 0`.

   Here all actions are trivial. The module N is flat and nonprojective: every homomorphism N → ℤ is zero, since its value at 1 is divisible by every power of 3; a nonzero projective ℤ-module is free and has a nonzero coordinate map to ℤ. Its cyclic homology is H₀ = N, H₂j+1 = 𝔽₂, H₂j+2 = 0. For M the cyclic homology is 𝔽₂ in every degree. In total degree 2 the tensor terms are 𝔽₂² and the Tor term is 𝔽₂. The product coefficient is 𝔽₂ and H₂(C₂ × C₂,𝔽₂) = 𝔽₂³. Thus the missing case has both nonzero tensor and Tor contributions.

   **Exact repair.** Keep the existing hereditary-ring statement, and add to 5.1 and the plan: “Over a principal ideal domain k, the same natural short exact sequence exists when either M or N is flat over k, with the other arbitrary, and splits noncanonically.” Add the preceding C₂ example as a Check, explicitly saying N is flat but nonprojective.

   Make its proof input explicit. The presently cited `HomologicalComplex.homologyKunnethShortComplex_shortExact` assumes projective cycles and projective quotients by cycles; its splitting additionally assumes split cycle inclusions in the other complex (`TauCeti/Algebra/Homology/Monoidal/Homology/Kunneth/Sequence.lean:729`, `:786`). It does not directly supply this extension. Declare a supplier gap, for example `gap:flat-kunneth`, to DerivedModuleAlgebra §S.1, in both the README and plan, with 5.1 as consumer and this precise need: “For a PID k and nonnegative chain complexes C,D of k-modules with D degreewise flat, the canonical sequence 0 → ⊕_{p+q=n} H_p(C) ⊗ H_q(D) → Hₙ(C ⊗ D) → ⊕_{p+q+1=n} Tor₁^k(H_p(C),H_q(D)) → 0 is naturally exact and noncanonically split for every n ≥ 0.” This is one general homological-algebra theorem, owned by the earlier supplier; its group-coefficient application belongs here. Alternatively resolve that exact input to an existing declaration, with its hypotheses verified, if it becomes available.

   **Repair tested.** The repaired PID clause admits N = ℤ[1/3] and M = 𝔽₂ and gives the displayed sequence. In degree 0 it gives the tensor isomorphism 𝔽₂ → 𝔽₂ with no Tor summand. For N = ℤ it retains the existing projective examples. No restriction on the general coefficient ring of the other targets is introduced.

One finding, P2. Both findings from round 6 are repaired. This review changes neither the design nor its source manifest.

## Verified sound

### Previous findings and changed passages

The previous review was checked finding by finding before the new pass. Neither finding was marked not actionable.

| Previous finding | Status | Repaired passage and direct check |
|---|---|---|
| F01: AlgebraicTopology §8.15 disappears in open revision #1808 | Repaired | README 61–66 now cites only §§4.1–4.3, 5.3 and 5.4; the contract at 329–334 contains only 5.3 and 5.4. The Check at 1758 says “`C_p × C_p` is not periodic: `dim Hⁿ(C_p × C_p, 𝔽_p) = n + 1` is unbounded.” Plan supplier numbering agrees. Main and #1808 retain the cited cover and torus sections; the deleted sphere attribution is absent throughout the design. |
| F02: cyclic Hopf negative control fails at n = 0 | Repaired | README 1474–1476 says “For `n ≥ 1`” and “At `n = 0`, `G = ℤ` and `R = 0`, and both give `0`”. The plan's `hopf_cyclic` agrees. Correct/wrong-model values are (0,0) at n = 0, (0,ℤ) at n = 1, and (0,2ℤ) at n = 2. |

The repair also changed the free cyclic resolution Check at README 781–783 to “`m ≥ 1` (so that the norm `N` exists)”, and changed the corresponding plan test. Loh19 line 2205 explicitly assumes a positive order. For m = 1 the positive homology vanishes; for m = 2 odd positive homology is ℤ/2 and even positive homology is zero. At m = 0 the proposed infinite norm is not in ℤ[ℤ], and H₃(ℤ,ℤ) is zero. The new bound is necessary.

The same pattern was checked elsewhere: H₂(ℤ/n,ℤ) = Λ²(ℤ/n) = 0 in 5.4 remains true for n = 0,1,2; Layer 8's finite-group convention already excludes zero modulus. The cover comparison still restricts constant-coefficient conclusions appropriately: the sign local system on a circle has H₀ = ℤ/2 and H₁ = 0, unlike constant coefficients, whose two groups are ℤ. The periodicity Check uses only the algebraic dimension calculation, so no lost topological supplier is hidden in its proof.

I read all 41 current statements and hypotheses in both the README and plan, including every Needs line. For unchanged text I reused round 6's adversarial evidence only where its table records computed values; I checked that those statements have not changed. All seeded targets, headline theorems and repaired passages received a fresh pass. R01 concerns a generality restriction not tested by the earlier projective-coefficient instances.

### Principles, shape and headline coverage

There are 8 layers and 41 plan targets: 10 definitions, 3 constructions and 28 theorems, with 137 tests and at least three per target. Every target has a locator, every definition retains API statements and Checks, and no target prerequisite points forward to a later target. The README has the required Summary, scope, conventions, supplier contracts, build explanation, Examples and Dependencies, consumers and references. Its layers are mathematical constructions needed by the end theorems. Apart from R01, the pass found no additional scope narrowing, computational algorithm, re-planned roadmap, forbidden supplier, circular proof input, process residue, source table reuse or undeclared local Lean API.

The headline list at README 18–20 is: Hochschild–Serre with its structure (6.2–6.7), the tree sequence (3.5), Künneth (5.1), double cosets (7.1), stable elements (7.2), Tate duality (8.1), and periodicity (8.5). The Summary additionally promises universal coefficients (5.2), the Pontryagin ring (5.4), Hopf's formula (6.8), all-degree cyclic cup periodicity (8.4), and periodicity from cohomologically trivial resolutions (8.3). Each has a named target.

There is no Suggested.lean in this design. Elaboration: **not available (this lane does not elaborate)**. There are zero sorried acceptance theorems for the one-tactic probe and zero local acceptance declarations for a `#check @name` binder audit. Consequently this is not a passing elaboration, a completed package headline-coverage check, or a claim that any headline is unstatable. The package must perform those checks when it supplies that file. No acceptance-file padding, sorry'd data or set_option can be certified present or absent in a nonexistent file.

### Computed adversarial table

Cₙ denotes a cyclic group. Coefficients and actions are trivial unless otherwise specified. The table covers the seeded targets, all headlines, the changed passages and R01; remaining unchanged targets retain the computed round-6 rows described above. Values distinguish the asserted construction from the plausible wrong one, rather than merely recording that a statement was read.

| Statement | Instances tried | Computed values on both sides / wrong model | Result and change |
|---|---|---|---|
| Conventions; 1.1 conjugation | S₃, H = ⟨(12)⟩, g = (123); A₃ with 𝔽₃ | gHg⁻¹ = ⟨(23)⟩; inverse convention gives ⟨(13)⟩. Transposition acts by −1 on H¹(A₃,𝔽₃); invariants are 0 = H¹(S₃,𝔽₃). G = 1 gives id. | Correct direction and coefficient transport. |
| 1.2 quotient action | N = 2ℤ/4 in C₄, sign ℤ; N = 1,G | H⁰(N,ℤ) = ℤ and quotient generator acts −1, not +1. At N = 1 the action is M's G-action; at N = G it is trivial. | Quotient action is determined. |
| 1.3 additivity | C₂, sums of ℤ; empty family; infinite-rank free A | H₁(C₂,⊕ℤ) = ⊕ℤ/2; empty family yields 0 = 0. The identity A → ⊕ℕℤ has infinitely many nonzero coordinates, unlike elements of ⊕ℕHom(A,ℤ). | No unjustified infinite coproduct assertion in cohomology. |
| 1.4 permutation and twisted Shapiro | C₂ on C₂ disjoint union one point; sign character | H₀ = ℤ², H₁ = ℤ/2 from stabilizers; counting points gives wrong H₀ = ℤ³. Sign rank-one coefficients give (H₀,H₁) = (ℤ/2,0), versus (ℤ,ℤ/2) for trivial coefficients. | Monomial coefficients not collapsed to permutation coefficients. |
| 1.5 discrete comparison | ℤ discrete versus profinite-induced topology, target discrete ℤ | Abstract Hom(ℤ,ℤ) = ℤ; continuous Hom for the latter topology is 0. For discrete C₃ the identity character takes 1 to 1, its negative to 2. | Topology and comparison normalization matter. |
| 2.1,2.3 hyperhomology | S₃, ℤ[S₃/A₃] → ℤ in degrees 1,0; G = 1 | Naive coinvariants give ℤ →id ℤ and zero homology. Derived values H₁ = ℤ/2, H₂ = ℤ/3. For G = 1 a complex concentrated in degree −1 has ℤ in degree −1. Zero complex gives 0. | Derived construction and shift retained. |
| 2.2 long exact sequences | G = 1, 0 → ℤ →×2 ℤ → 𝔽₂ → 0 | H₁ = 0, degree-zero maps ×2 and reduction mod 2; kernel of the latter and image of the former are both 2ℤ. Tensoring this sequence with 𝔽₂ would instead give first map 0, not an injection. | Actual degreewise exactness is required and stated. |
| 3.1–3.3 free complexes | C₂ rotating a two-edge circle; ℤ acting on a line with sign coefficients | Constant coinvariant circle complex has differential 0 and (H₀,H₁) = (ℤ,ℤ). Sign line has differential t⁻¹−1 = −2, giving (ℤ/2,0). | Topological comparison does not erase local coefficients. |
| 3.3 repaired cyclic Check | m = 0,1,2 | For m ≥ 1, coinvariant differentials alternate 0,m: H₁ = ℤ/m, H₂ = 0, H₃ = ℤ/m. At m = 0 the norm is undefined and actual H₃(ℤ,ℤ) = 0, not ℤ. | Repaired bound verified. |
| 3.4 tree chains | Vertex, single edge, loop, empty graph | Single vertex: 0 → 0 → k →id k. Edge boundary is [v₁]−[v₀], augmentation 1−1 = 0. Loop has nonzero edge module with zero boundary; empty graph would give 0 → k. | Native tree excludes the two counterexamples. |
| 3.5 tree sequence; 3.6 HNN/free groups | ℤ on its line; BS(1,2); free group on two sign generators | Line yields (H₁,H₀) = (ℤ,ℤ) or (0,ℤ/2). BS(1,2) edge map on H₁ is 1−2 = −1, giving H₁ = ℤ. For two sign generators, ker[−2,−2] = ℤ, although each cyclic factor has H₁ = 0. | Signs and exceptional twisted degree-one sequence pass. |
| 3.6 amalgam | C₄ amalgamated with C₆ over C₂ | Edge generator maps to (−2,3); cokernel in C₄ ⊕ C₆ is C₁₂, agreeing with abelianization. | Minus/plus convention works. |
| 4.1–4.3 cup identities | Torus cycle z = [e₁,e₂]−[e₂,e₁]; C₂,𝔽₂ | (x cup y)(z) = 1, (y cup x)(z) = −1. On the individual cochain pair (e₁,e₂) the values are 1 and 0, so commutativity is not asserted on cochains. The degree-one generator of H*(C₂,𝔽₂) has nonzero square. | Graded sign and characteristic-two exception retained. |
| 4.4 diagonal approximations | Oriented interval [a,b] | AW gives [a]⊗[a,b] + [a,b]⊗[b]. Its boundary is [b]⊗[b]−[a]⊗[a], equal to the diagonal of the boundary. The naive [a,b]⊗[a,b] has degree 2 instead of 1. | Chain-map and degree requirements exclude wrong diagonal. |
| 4.5 projection formula | C₂, H = 1, degree zero over ℤ; positive degree | cor(1) = 2; cor(1·res y) = 2y = cor(1)·y. In positive degree from H = 1 both sides are zero. | Normalization consistent. |
| 4.6 evaluation | C₂, sign ℤ and its dual; torus | Boundary of 1[g] is −2; both ⟨dφ,1[g]⟩ and ⟨φ,∂1[g]⟩ are −2. Torus pairing above is 1. | No extra differential sign. |
| 4.7 comparison of cups | Finite C₂, trivial ℤ, degrees 0 and 2 | H⁰ = ℤ → Ĥ⁰ = ℤ/2 is reduction, not an isomorphism; the positive even cup generator maps to the Tate generator. Trivial group has positive groups 0. | Degree-zero qualification retained. |
| 5.1 Künneth existing cases | C₂ × C₂ over ℤ; over 𝔽₂; zero ring | H₂ = ℤ/2 from one tensor term; H₃ = (ℤ/2)³ from two tensor terms plus Tor = ℤ/2. Over 𝔽₂ dimensions in degrees 0,1,2 are 1,2,3. Zero ring gives 0 on every side. | Existing theorem true; no field-only shortcut. |
| 5.1 flat coefficients, R01 | k = ℤ, G = H = C₂, M = 𝔽₂, N = ℤ[1/3] | Tensor terms in degree 2 = 𝔽₂²; product homology = 𝔽₂³; Tor terms = 𝔽₂. In degree 0, 𝔽₂ ⊗ N = 𝔽₂ = H₀. | Source-supported instance excluded; restore it. |
| 5.2 universal coefficients | C₂ and coefficient 𝔽₂ over ℤ | H¹ = Hom(ℤ/2,𝔽₂) = 𝔽₂; H² = Ext¹(ℤ/2,𝔽₂) = 𝔽₂ while Hom(H₂,𝔽₂) = 0. H₂ with 𝔽₂ coefficients is Tor₁(ℤ/2,𝔽₂) = 𝔽₂. | Both correction terms necessary. |
| 5.3 cohomological cross product | Cₚ²,𝔽ₚ; infinite-rank free groups over ℚ | Dimensions are 1,2,3 in degrees 0,1,2. For two free abelian groups of infinite rank, tensors of degree-one duals give finite-rank matrices; the infinite identity matrix is a bilinear form outside their image. | One-factor finite-dimensionality prevents failure. |
| 5.4 Pontryagin ring | ℤ²; C₂; ℤ/n at n = 0,1,2 | Exterior ranks for ℤ² are 1,2,1. Λ³(C₂) = 0 but H₃(C₂,ℤ) = ℤ/2, excluding unrestricted exterior identification. H₂(ℤ/n,ℤ) = Λ²(ℤ/n) = 0 in all three boundary cases. | Integral and torsion qualifications pass. |
| 6.1–6.2 filtration and cohomological HS | S₃/A₃ with 𝔽₃; N = 1,G | E₂ has only base column p = 0; invariant fibre groups are 𝔽₃ for q ≡ 0,3 mod 4 and zero otherwise. At N = 1 only q = 0 remains; at N = G only p = 0 remains. Index substitution gives native coordinates (2p+q+1,−p−1); local stabilization bound is max(q+3,p+2). | Degenerate filtrations and local, not global, convergence bound agree. |
| 6.3–6.4 homological HS and edges | C₂ ⊂ C₄ versus split C₂ × C₂, coefficient 𝔽₂ | Both have E² entries 𝔽₂. Abutment dimensions are 1 for C₄ and n+1 for C₂²; differentials cannot be discarded. In degree 1 with ℤ, inclusion and quotient are ×2: C₂ → C₄ and reduction: C₄ → C₂. | Edges match named maps; gap is explicit. |
| 6.5 multiplicativity | Split torus, fibre class y and base class x | Fibre-first identification gives y cup x = xy, x cup y = −xy; exponent pq′ is 0 in the first order and 1 in the second. | Correct sign for the chosen identification. |
| 6.6 transgression | C₃ ⊂ C₉, f(3a+r) = a modulo 3 | df(2,1) = f(1)−f(3)+f(2) = −1 = 2; extension carry is +1. Split extension has carry 0 and transgression 0. | τ = −c cup u confirmed. |
| 6.7 low-degree sequences | C₂ ⊂ C₄, ℤ and 𝔽₂ | Integral low-degree tail is 0 → C₂ →×2 C₄ → C₂ → 0. With 𝔽₂, inflation H²(C₂) → H²(C₄) is zero, not injective; H¹(N,𝔽₂) = 𝔽₂ violates the higher-degree vanishing assumption. | Missing-vanishing counterexample excluded. |
| 6.8 Hopf | Torus free presentation; cyclic n = 0,1,2 | Lifted torus boundary is [ba]−[ab], giving ba(ab)⁻¹ = [a,b]⁻¹, not [a,b]. Cyclic correct/wrong outputs are (0,0), (0,ℤ), (0,2ℤ). | Sign fixed by construction; previous repair passes. |
| 6.9 finite/profinite comparison | C₃ ⊂ C₉; N = G | Every finite section is continuous and the pinned lift has df(2,1) = 2, the same negative carry. For N = G the target H²(1,−) = 0. | Comparison is with the actual pinned lift, not a remembered sign. |
| 7.1 double cosets | S₃, H = K = C₂; normal A₃ with 𝔽₃ | In degree 0 the two double cosets contribute 1+2 = 3 = index. In positive degree the trivial-intersection summand is 0. On H¹(A₃,𝔽₃), normal-subgroup sum is 1+(−1) = 0. | Conjugation and indices both necessary. |
| 7.2 stable elements | S₃ at p = 3; degree zero over ℤ; twisted C₂ × S₃ | H²(C₃,ℤ) invariants are 0, whereas H⁴ invariants are ℤ/3. In degree 0 stable elements are ℤ but its p-primary torsion is 0. For the stated permutation-coefficient example, normalizer invariants have dimension 3, stable elements dimension 2. | n ≥ 1 and trivial-action qualification on the simplification are necessary. |
| 8.1 Tate duality | C₂, M = ℤ; proposed integral dual of ℤ/2 | Ĥ⁰(C₂,ℚ/ℤ) = 0 = Hom(Ĥ⁻¹(C₂,ℤ),ℚ/ℤ); Ĥ¹(C₂,ℚ/ℤ) = ℤ/2 = Hom(Ĥ⁻²(C₂,ℤ),ℚ/ℤ). Hom(ℤ/2,ℤ) = 0 but Tate groups of ℤ/2 are nonzero. | Shift −1−i and free-integral restriction pass. |
| 8.2 finite p-groups | Q₈, D₈; prime omitted at 21 | Q₈'s maximal abelian subgroups are C₄; D₈ contains C₂². In C₇ ⋊ C₃ all elements have order dividing 21 but (1,0)(0,1) = (1,1) differs from (0,1)(1,0) = (2,1). | Prime condition is substantive; cyclic/quaternion alternatives correct. |
| 8.3 CT resolutions | C₂ sign sequence at n = 0; repeated twist; Cₚ² | Ĥ⁰(C₂,ℤ) = ℤ/2 maps isomorphically to Ĥ¹(C₂,ℤ_sgn) = ℤ/2. Two sign twists are trivial and shift by 2. For Cₚ² the dimensions n+1 cannot satisfy fixed positive periodicity. | Orientation twist and period doubling necessary. |
| 8.4 periods | S₃ at 3; Q₈ at 2; prime not dividing group order | For S₃, d = 4 and 8 both have cyclic primary group of order 3, but least d is 4. For Q₈, Ĥ² = C₂² versus Ĥ⁴ = C₈. At a prime away from the order all primary groups are 0 and the least qualifying positive degree would be 1. | Least-degree definition and p dividing order retained. |
| 8.5 periodicity equivalences | Trivial group, S₃, A₄, SL₂(𝔽₉) | Trivial group has all Tate groups 0 and order 1, so conditions hold. S₃ has period 4. A₄ contains C₂² and fails. SL₂(𝔽₉) has order 720 and Sylow 3 subgroup C₃², hence fails; its 𝔽₃ dimensions on that subgroup grow as n+1. | Both directions survive boundary and nonabelian tests. |

### Seeded source verification

These locators were read in the supplied legal, line-numbered extractions. A source supporting a special case is not described here as proving the wider target verbatim: the named native or supplier route must supply the extension. Brown82 and CE56 remain uncertified, and SwanPPeriod60 remains waived; none was requested again.

| Seeded target | Text and locator checked | Support and limit |
|---|---|---|
| 1.1 | HS53 lines 154–160, Corollary to Proposition 2, p. 113; Loh19 lines 5322–5353, Proposition 3.2.13, p. 124 | Inner conjugation triviality and the compatible-pair action; arbitrary-k maps are instantiated on the native carriers. |
| 1.4 | SerreArbres lines 5154–5164, p. 168 | Orbit/stabilizer decomposition and integral permutation Shapiro. Twisted arbitrary-k statements use the pinned induction projection and Shapiro isomorphisms, not an assertion that Serre states this full variant. |
| 2.2 | CE56, Ch. XVII, as recorded | Uncertified. Direct exactness check uses degreewise sums/products of module complexes and native homology sequences. |
| 3.3 | HS53 lines 283–288, Proposition 5, p. 116; lines 355–362; Loh19 lines 2205–2214, Proposition 1.6.11, p. 48 | Acyclic-term comparison; homological counterpart; positive cyclic order in the resolution Check. |
| 3.6 | SerreArbres lines 5170–5196, Proposition 13 and Remark 1, p. 169 | Integral amalgam sequences with arbitrary modules. General coefficient and HNN/free-group forms follow the stated tree route. Brown82 II §7 is uncertified. |
| 4.3 | MilneCFT lines 3485–3507, Proposition 1.39 and following pairing discussion, pp. 73–74 | Naturality, associativity and graded sign. Integral source convention agrees; k-linear variant uses the defined pairing and dimension shift. |
| 4.4 | HS53 lines 389–395, pp. 118–119; Brown82 Ch. V | HS verifies the standard cochain cup formula, not the full arbitrary-resolution diagonal theorem. Brown's locator is uncertified. The chain-map interval test and native comparison route were checked. |
| 5.1 | Loh19 lines 5854–5932, Theorem 3.2.22 and Corollary 3.2.23, pp. 135–136 | Flat PID theorem and tensor-resolution route verified. R01 records the lost generality. |
| 5.2 | Loh19 lines 5841–5851, Corollary 3.2.21, p. 135; lines 5985–5994, Outlook 3.2.26, p. 138 | Integral homological UCT is stated. Cohomological UCT is announced, not proved there. The hereditary-ring route uses projective cycles and the pinned Ext/evaluation sequence. |
| 5.3 | Loh19 lines 5985–5994, Outlook 3.2.26, p. 138 | The source announces the cohomological theorem with a finiteness qualification. The roadmap supplies the exact finite-dimensional hypothesis and derives it from 5.1–5.2; it does not rely on an unstated unrestricted dual-tensor identity. |
| 6.6 | HS53 lines 792–823, Proposition 1, pp. 128–129; lines 984–1015, Theorem 4, p. 133 | Transgressive representatives and the negative extension-class cup formula, with trivial N-action for that formula. |
| 6.7 | HS53 lines 825–830, Theorem 2, p. 129; lines 854–856, p. 130; Loh19 lines 5568–5598, Theorem 3.2.18/proof, p. 129 | Vanishing range and cohomological exact sequence; homological Hopf application. General homological low-degree input is the declared supplier gap. |
| 6.9 | HS53 lines 854–856; pinned continuous lift and transgression definitions | HS supplies the sequence only. The finite/profinite identification was checked against the actual pinned cochain differential and section lift. |
| 8.1 | Brown82 VI §7; CE56 XII, as recorded | Both uncertified. Algebraic dual exactness and the integral free-module condition were checked independently; the report does not certify unread source wording. |
| 8.3 | Loh19 lines 7012–7023, Theorem 4.3.7, p. 165, and lines 7069–7088, proof, p. 167 | Free sphere action supplies the periodic-resolution special case. General CT and orientation-twist statement is an algebraic extension using the native projectivity criterion and connecting products; Brown82 VI §9 remains uncertified. |

All eight cited works have existing manifest keys. No new source was needed and no settled source was reopened. The manifest's source locators and statuses were read. The available notes, paper and book extractions were used at their recorded versions; no external formalization was imported.

### Pinned declarations and conventions

The pins match the design baseline: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Qualified native names were searched by declaration and object; 93 README identifiers were located. The citation resolver reported no unresolved cross-roadmap citations, but explicitly did not check native names. The following are direct readings at the pins, not conclusions from that resolver.

| Input opened | File and line at pin | Relevant fact checked |
|---|---|---|
| Rep, restriction, internal Hom | `Mathlib/RepresentationTheory/Rep/Basic.lean:30`, `:774`; `Mathlib/RepresentationTheory/Rep/Res.lean:43` | Native representation carrier and contragredient action; group and coefficient universes are shared. |
| Group cohomology/homology and resolution comparisons | `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:183`, `:210`; `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:226`, `:246`, `:254` | Actual module-valued carriers and Ext/Tor/resolution comparison, not opaque substitutes. |
| Inhomogeneous chains and signs | `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:132`, `:153` | First boundary term acts by g⁻¹. For one generator with sign action, boundary is −2. |
| Functorial maps and low-degree edge carriers | `Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean:141`, `:376`, `:522`, `:534`, `:552`, `:566`; `Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean:157`, `:543`, `:818`, `:831`, `:850`, `:864` | Sources and targets of restriction, inflation, corestriction and coinflation; no transfer/corestriction reversal. |
| Shapiro and standard/bar resolutions | `Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean:58`; `Mathlib/RepresentationTheory/Homological/GroupHomology/Shapiro.lean:65`; `Mathlib/RepresentationTheory/Homological/Resolution.lean:321`, `:427` | Arbitrary representation coefficients; induction for homology and coinduction for cohomology. |
| Projection and dimension shift | `TauCeti/RepresentationTheory/Induction/Permutation.lean:166`, `:339`; `TauCeti/RepresentationTheory/Induction/DimensionShift.lean:83` | Coset and coefficient transport for 1.4; coinduction input for cup uniqueness. |
| Transfer and induced vanishing | `TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean:79`, `:121`; `TauCeti/RepresentationTheory/Homological/GroupHomology/Induced.lean:49`; `TauCeti/RepresentationTheory/Homological/GroupHomology/DirectedUnion.lean:113` | Finite-index transfer; induced-from-trivial positive vanishing needs no finite G; directed-union class representatives. |
| Continuous comparison and transgression | `TauCeti/RepresentationTheory/Homological/ContCohomology/Transgression.lean:147`, `:354`, `:702`, `:779` | Lift condition, actual coboundary, transgression and exactness; finite discrete groups satisfy the topological prerequisites. |
| Tate products and projectivity | `TauCeti/RepresentationTheory/Homological/TateCohomology/Cup/Product.lean:131`; `TauCeti/RepresentationTheory/Homological/TateCohomology/Projective/Basic.lean:123`, `:232` | Existing Tate product is consumed. Converse projectivity has ring and underlying-projectivity assumptions; these hold in the stated free-abelian CT application. |
| Cyclic character periodicity | `TauCeti/RepresentationTheory/Homological/TateCohomology/Character.lean:65`; `TauCeti/RepresentationTheory/Homological/TateCohomology/Periodic.lean:302`, `:346`; `TauCeti/RepresentationTheory/Homological/TateCohomology/Cup/Cyclic.lean:146` | Existing cyclic character/periodicity is not confused with the new all-degree cup comparison; the latter cited native cup-character result is degree zero. |
| Künneth | `TauCeti/Algebra/Homology/Monoidal/Homology/Kunneth/Basic.lean:112`; `TauCeti/Algebra/Homology/Monoidal/Homology/Kunneth/Sequence.lean:729`, `:786` | Projective cycles and quotients; split inclusions for splitting. This is the precise limit behind R01. |
| Universal coefficients | `TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean:121`, `:153`, `:180` | Ext-to-homology map, injection and exactness use the stated cycle hypotheses. |
| Filtered spectral sequences | `TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean:304`, `:409`, `:425`; `TauCeti/Algebra/Homology/SpectralSequence/Filtered/Stabilization.lean:83` | Native page offset and local stabilization inequalities; local first-quadrant bounds are enough. |

The integral clauses correctly specialize the common universe to `Type`, notably Hopf's formula and Layer 8. The Native SerreGraph tree predicate was read as connected and acyclic; it does not admit the empty graph. No promise that a native declaration lacks a hypothesis was inferred merely from its name. Ordinary discrete cup/coefficient variants are distinguished from existing finite Tate and continuous products.

### Ownership, supplier resolution and order

No second copy of CohomologyOfGroups is present on main or under Completed. The supplied board-package index was read before making that check. Open-head ownership searches used the roadmap tools by object, including group hyperhomology, stable elements, Hopf, periodicity, Künneth and continuous comparisons. The supplied overlap report has no conflicting head or dropped/introduced cited id for this design. The previous AlgebraicTopology issue was nevertheless verified directly at main and #1808; it is repaired, not merely absent from a tool report.

The following cross-roadmap sections were opened in this round. Line numbers for open heads refer to their actual README, excluding the tool's display header.

| Supplier / head | Resolved section and witness | Ownership boundary |
|---|---|---|
| DerivedModuleAlgebra, main | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:955`, §S.1 through 1006; §0.2 for flat derived-tensor machinery | Generic spectral sequences and homological algebra. The homological low-degree contract is a declared gap, not falsely claimed supplied. |
| ProfiniteCohomology, main | `TauCetiRoadmap/ProfiniteCohomology/README.md:1140`, §§3.1–3.2; `:1571`, §5.5; `:1770`, §6.4; `:2622`, §10.1; `:2763`, §10.5; `:3519`, Layer 12 | Continuous comparisons, exact sequences and products; this roadmap supplies the stated discrete/coefficient extensions. |
| ClassFieldTheory, main | `TauCetiRoadmap/ClassFieldTheory/README.md:778`, §0.1 | Cohomological triviality, Nakayama–Rim and Tate–Nakayama/class formations are consumed, not planned again. |
| FreeGroupsAndLimitGroups, main | `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:385`, §2.2; `:773`, §4.1; `:803`, §4.2; `:863`, §4.5; `:875`, §4.6; `:906`, §4.7; `:937`, §4.8 | Tree and Bass–Serre geometry, including stable-letter convention; group-(co)homology sequences belong here. |
| AlgebraicTopology, main and #1808 | `TauCetiRoadmap/AlgebraicTopology/README.md:1945`, §5.3; `:2005`, §5.4 on main; #1808 Stage 5 items 3–4 at 1215–1275 | Cover-chain comparison and torus calculation. The scope's cellular §§4.1–4.3 are retained in the revision. No §8.15 dependency remains. |
| StableHomotopyKTheory, main | `TauCetiRoadmap/StableHomotopyKTheory/README.md:1347`, §3.29 | Perfect-group kernel identification does not fix a map; the general Hopf map here fixes a normalization and states that distinction. |
| SchemeKTheoryOperations, #1229 | `TauCetiRoadmap/SchemeKTheoryOperations/README.md:2547`, §6.7 integral hyperhomology paragraph; directed unions at 2581 | Integral homological sequences are imported. Arbitrary k, hypercohomology and monomial coefficients here are explicit extensions. |
| K3BlochGroups, #1430 | `TauCetiRoadmap/K3BlochGroups/README.md:1188`, §4.1; `:1854`, §5.2 | Integral reindexing, stable elements, integral duality, quaternion periodicity and Swan period formula are imported. The current contract explicitly assumes the least-period convention, which the supplier leaves undefined. |
| MappingClassGroupsAndCanonicalRepresentations, #2266 | `TauCetiRoadmap/MappingClassGroupsAndCanonicalRepresentations/README.md:846`, §1.1 | Abstract cohomological HS and section-lift five-term sequence; this design adds the filtered realization and its specified product/transgression structure. |
| IntegralIwasawaTheoryPartII, #2267 | `TauCetiRoadmap/IntegralIwasawaTheoryPartII/README.md:272`, §0.7 | Evaluation specialization and flat homological edge; arbitrary pairings here retain their different scope. |
| InductionRestrictionPartII, #1154 | `TauCetiRoadmap/InductionRestrictionPartII/README.md:311`, §RS.0.1 | Central-extension low-degree exact sequence is not ownership of the normalized general-presentation Hopf map. |
| ModularCurvesPartII, #913 | `TauCetiRoadmap/ModularCurvesPartII/README.md:3934`, §15.4 | Modular amalgam application does not duplicate the arbitrary amalgam/HNN coefficient theorem. |

The closest open scopes were also read: ArithmeticGaloisDuality #858 concerns compact/continuous arithmetic duality; ProfiniteCohomologyPartII #1839 concerns continuous extensions; HomologicalStabilityOfGeneralLinearGroups #2036 concerns stability applications. Those scopes do not own the discrete arbitrary-coefficient variants here. No new foundational carrier was assigned a duplicate fully qualified name.

Overlap check: read K3BlochGroups, ArithmeticGaloisDuality, HomologicalStabilityOfGeneralLinearGroups, IntegralIwasawaTheoryPartII, ProfiniteCohomologyPartII, ProfiniteCohomology, DerivedModuleAlgebra and ClassFieldTheory; K3BlochGroups owns the integral stable-element/duality and quaternion/Swan inputs, IntegralIwasawaTheoryPartII the specialized evaluation/edge input, ProfiniteCohomology and its continuations the continuous theory, DerivedModuleAlgebra the generic homological algebra, ClassFieldTheory the class-formation inputs; CohomologyOfGroups owns the explicit discrete generalizations and comparison maps. The stability roadmap owns its applications. The third closest-roadmap list is empty; no remaining joint ownership was found.

The existing `homological-low-degree` gap has the same slug in the plan and README 294–298, supplier DerivedModuleAlgebra §S.1, and consumers 6.3,6.4,6.7. Its first-quadrant hypothesis, two edge maps and homological five-term sequence specify exactly the missing dual of the supplier's cohomological contract. It asks for no already-provided low-degree homological theorem. It remains a valid declared contract. R01's suggested new gap is a repair proposal, not an existing declaration or acceptance condition silently added by this review.

Dependency check output:

```text
candidate: CohomologyOfGroups is not in the merge order yet; checked as if placed after IntegralIwasawaTheoryPartII (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2173 edges, 0 problem(s)
```

No UPWARD or CYCLE line. No order file or supplier file was changed.

### Wording and arrangement

Alongside the readable seeded passages, five further prose comparisons were made: quotient action (1.2, HS53 lines 345–354), discrete comparison (1.5, HS53 lines 129–141), the cup definition (4.1, HS53 lines 389–395), cup uniqueness (4.2, MilneCFT lines 3459–3484), and least-period convention (8.4, Hutchinson13 lines 494–504). No non-forced sentence, clause-by-clause paraphrase, translated passage, copied table or example list was found. Shared formulas and standard mathematical terminology do not establish copying. There is no Suggested.lean docstring to compare.

Before References there are 100 locator-bearing source-key occurrences: HS53 34, Loh19 22, Brown82 14, Hutchinson13 12, MilneCFT 9, SerreArbres 4, CE56 3 and SwanPPeriod60 2. HS53's outline, lines 22–42, divides its work into general/Cartan–Leray theory, a separate filtered construction, and applications. The roadmap's eight mathematical layers do not map one-to-one to those chapters. Within the extension layer, 6.1 → 6.2 → 6.5 → 6.6 → 6.7 is constrained by the actual filtration, product, transgression and low-degree dependencies; the surrounding orbit/tree, product, subgroup and periodicity layers have different scopes and inputs. No arrangement finding follows from that forced local order. Brown82's contents and wording could not be examined.

Source independence: 18 passages compared with 5 readable sources, no non-forced copying found; largest share HS53, 34 of 100 source-key locator occurrences; contents compared with HS53: independent. Brown82 and CE56 wording/contents were not verified; SwanPPeriod60 remains waived.

## Not verifiable

- Brown82 and CE56 are settled uncertified sources. Their specified locators can be retained, but their theorem wording, exact pages and full hypotheses were not certified from an opened text. In particular this limits source certification for 2.2, the arbitrary-resolution portion of 4.4, and 8.1.
- SwanPPeriod60 is waived. The accessible Hutchinson13 statement and K3BlochGroups contract were checked, not the original Swan paper.
- Loh19 Outlook 3.2.26 announces cohomological UCT/Künneth rather than supplying the detailed proofs or exact finite-dimensional formulation. The roadmap's stated algebraic routes were checked; a claim that this outlook itself proves every stated variant would not be justified.
- Source extraction anomalies listed below are mathematical errors in the available text. No PDF renderer is installed, so typography in the original page images was not independently inspected. This is especially relevant to the numerical subscript/superscript anomalies in Loh19 Examples 3.2.24–3.2.25.
- Package-stage elaboration, one-tactic probes, local binder elaboration and headline-to-Suggested.lean coverage are unavailable for this design, as explained above. No successful build is claimed.

## Source issues

- **Misprint** in Hutchinson13 at Corollary 3.3 proof, printed p. 12 (line 518): the source says the relevant degrees are congruent to 3 modulo 3; it should be congruent to 3 modulo 4; affects the proof.
- **Gap** in Hutchinson13 at the period convention preceding Theorem 3.1, printed p. 12 (lines 494–497): the source says a qualifying positive period is the period used in Swan's formula; it should be the least qualifying positive period; affects a stated result.
- **Misprint** in Loh19 at proof of Corollary 3.2.23, printed p. 136 (lines 5903, 5908, 5927): the source says both tensor factors are chains of G; it should be chains of G and chains of H; affects the proof.
- **Misprint** in Loh19 at Example 3.2.24, printed p. 137 (lines 5954–5955): the source says torus homology vanishes in degrees at least 2; it should be degrees at least 3, with H₂ equal to ℤ; affects a stated result.
- **Misprint** in Loh19 at Example 3.2.25, printed p. 138 (lines 5976–5980): the source says integral coefficients and an n-dimensional result after summing n+1 field terms; it should be 𝔽ₚ coefficients and dimension n+1; affects a stated result.

## For the human reviewers

- Brown82 and CE56 remain uncertified; their wording and contents were not examined. SwanPPeriod60 remains waived. HS53, the most-cited source, was available and its contents were compared.
- The Loh19 extraction anomalies at lines 5954–5955 and 5976–5980 have not been checked against page images because no renderer is available. The roadmap's corresponding torus and Cₚ² computations use the correct values.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "35fb1a61feace094f16a656aeab4f6ee7c26e435", "job": "REV-DESIGN-CohomologyOfGroups~7", "model": "gpt-6-astra", "worker": "chris-6"} -->
