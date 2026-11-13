<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14777#issuecomment-6859079976 -->
Review (codex) of e75c7b5

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P1) Flatness does not justify the cohomological comparison

   **Location:** `packages/CohomologyOfGroups/design/README.md:544`: “if every `C_p` is flat over `k`” introduces both comparisons. The parenthesis at line 547 has the correct stronger hypothesis, but does not qualify the preceding theorem. The statement of target 3.1 in `design/plan.json:460` already distinguishes the two hypotheses.

   **Claim:** A flat resolution of the trivial representation computes both versions of equivariant (co)homology using ordinary tensor and ordinary Hom.

   **Witness:** Over `ℤ`, let `F=⊕ᵢℤeᵢ`, `u(eᵢ)=eᵢ−2eᵢ₊₁`, `v(eᵢ)=2⁻ⁱ`. Append the exact flat complex `F→u F→v ℤ[1/2]` to `ℤ[0]`. For `G=1`, `M=ℤ`, its Hom has nonzero `H²`; group cohomology has zero `H²`.

   **Exact repair:** State the homological comparison under termwise flatness, and the cohomological comparison under termwise projectivity, explicitly in separate clauses. Keep the plan's distinction. Add the telescope as a negative-control Check. Indeed its Hom differential is `(aᵢ)↦(aᵢ−2aᵢ₊₁)`; the alternating sequence `(1,0,1,0,…)` is not in its image, since it would require the integer `a₀` to equal `−1/3` in `ℤ₂`. The repaired cohomological statement excludes this complex because `ℤ[1/2]` is not projective, while retaining the standard resolution.

2. **F02** (P2) Equivariant long exact sequences need exactness after tensor or Hom

   **Location:** `packages/CohomologyOfGroups/design/README.md:543`: “with the long exact sequences and naturality of 2.2”; `design/plan.json:478`, the `equivariantHomology_les` API.

   **Claim:** The long exact sequences of hyper(co)homology apply without qualification after substituting `C⊗M` or `Hom_k(C,M)`.

   **Witness:** For `G=1`, tensor the degree-zero short exact sequence `0→ℤ→2ℤ→ℤ/2→0` with `M=ℤ/2`. It becomes `ℤ/2→0ℤ/2→idℤ/2`. A purported long exact sequence would require the zero map `ℤ/2→ℤ/2` to be injective.

   **Exact repair:** Require the transformed sequence of complexes to be degreewise short exact. State sufficient hypotheses: a degreewise `k`-split sequence in `C` works for both operations; flat `M` works for tensor, injective `M` for contravariant Hom. For sequences in `M`, termwise flatness of `C` works for tensor and termwise projectivity for Hom. Keep 2.2 itself unchanged. The displayed nonsplit sequence fails the new hypothesis; the split tree sequence of 3.4 satisfies it.

3. **F03** (P1) The free-product formula fails in degree one with twisted coefficients

   **Location:** `packages/CohomologyOfGroups/design/README.md:660`: “`Hₙ(A ∗ B, M) ≅ Hₙ(A, M) ⊕ Hₙ(B, M)` for `n ≥ 1`”; target 3.6 in `design/plan.json`.

   **Claim:** Degree-one homology of a free product is the direct sum for arbitrary coefficient representations.

   **Witness:** Take `A=B=ℤ`, `M=ℤ`, with both generators acting by `−1`. The free-group boundary is `(a,b)↦−2(a+b)`, so `H₁(A*B,M)=ℤ(1,−1)`. Each factor has `H₁(ℤ,M)=ker(−2)=0`.

   **Exact repair:** Assert the direct-sum formula for `n≥2` with arbitrary coefficients, and for `n≥1` with trivial action. For arbitrary coefficients retain the degree-one exact tail
   `0→H₁(A,M)⊕H₁(B,M)→H₁(A*B,M)→M→M_A⊕M_B→M_G→0`.
   Add the sign module as a Check. Here the kernel of `ℤ→(ℤ/2)²`, `m↦(−m,m)`, is `2ℤ`, accounting for the missing infinite cyclic summand.

4. **F04** (P1) The cross-product evaluation sign contradicts the declared cup convention

   **Location:** `packages/CohomologyOfGroups/design/README.md:901`: “the evaluation … is `(−1)^{|y||a|}⟨x, a⟩⟨y, b⟩`”; `design/plan.json:1139`, `cross_eval`.

   **Claim:** The unsigned cup convention at lines 107–113 gives a negative evaluation in bidegree `(1,1)`.

   **Witness:** Over `ℚ`, take `G=H=ℤ`, coordinate cocycles `x,y` and degree-one generators `a,b`. The standard cross cycle is `z=[e₁|e₂]−[e₂|e₁]`. The roadmap's cup gives `(x×y)(z)=1−0=1`; its formula gives `−1`.

   **Exact repair:** Pin the homological cross product of 5.1 to this shuffle cycle and write `⟨x×y,a×b⟩=⟨x,a⟩⟨y,b⟩` with the evaluation convention already fixed. Add this bidegree Check to 5.2. Both sides then equal `1`. Do not import the extra sign from the alternative cup convention explicitly excluded in Conventions.

5. **F05** (P1) The Hochschild–Serre product sign uses the other identification

   **Location:** `packages/CohomologyOfGroups/design/README.md:1069`: “on `E₂` the pairing is `(−1)^{qp'}`”; `design/plan.json:1467`. Section 6.2, lines 1004–1006, fixes identification by restricting the first `q` arguments to `N`, with differential `(−1)^qδ`.

   **Claim:** Under that restriction identification the product has the usual quotient-first tensor sign.

   **Witness:** Let `G=ℤ_Q×ℤ_N`, with `x∈E₂^{1,0}`, `y∈E₂^{0,1}` the coordinate classes. Raw restriction evaluates `y∪x` at `(n,q)` as `1`. The stated sign is `−1`. HS53 line 692 gives the opposite cross-exponent for this identification.

   **Exact repair:** Preserve the stated restriction identification and replace the sign by `(−1)^{p q'}` in README and plan. Add the two identified values: `y∪x` corresponds to `+1`, and `x∪y` corresponds to `−1`. The existing anticommutativity Check does not distinguish the two conventions: both sign choices give anticommutativity. HS53 lines 694–700, Chapter II §5 Theorem 3, printed p. 126, support the corrected identification. A renormalized identification would require an explicit change throughout 6.2 and its comparisons; none is presently stated.

6. **F06** (P1) The worked Hochschild–Serre E₃ page is wrong

   **Location:** `packages/CohomologyOfGroups/design/README.md:1178`: “`E₃` is the column `p = 0` and the row `q = 0` in degrees `≤ 1`”.

   **Claim:** This describes the surviving page for `C₂⊂C₄` with `𝔽₂` coefficients.

   **Witness:** Write `E₂=𝔽₂[x,y]`, `|x|=(1,0)`, `|y|=(0,1)`. Since `d₂y=x²`, `d₂x=0`, its homology is `𝔽₂[x,y²]/(x²)`. Thus `E₃^{0,1}=0`, but `E₃^{1,2}=𝔽₂`.

   **Exact repair:** Replace the sentence with: “The E₃ page is `𝔽₂[x,y²]/(x²)`, supported in columns `p=0,1` and even rows. It has no further differential and gives one copy of `𝔽₂` in every total degree.” State the immediate conclusion as cohomology, or separately invoke the homological comparison for the displayed homology conclusion. This gives total-degree dimensions `1,1,1,1,…`, including the two cells above.

7. **F07** (P2) Abelian Sylow subgroups do not remove fusion conditions for twisted coefficients

   **Location:** `packages/CohomologyOfGroups/design/README.md:1223`: “If `P` is abelian, the stable classes are the invariants of `N_G(P)`”; `design/plan.json:1754`.

   **Claim:** The simplification holds for arbitrary `M : Rep k G`.

   **Witness:** Set `G=C₂×S₃`, `P=C₂×⟨(12)⟩`, `M=𝔽₂³` with permutation action. For central generator `z`, the cocycle `z↦e₃`, `(12)↦0` is normalizer-invariant. Conjugation by `(23)` changes its restriction to `⟨z⟩` from `e₃` to `e₂`.

   **Exact repair:** Require trivial `G`-action on coefficients for the abelian-Sylow normalizer simplification. Keep the full fusion-condition theorem with arbitrary coefficients. Add this counterexample. Here `N_G(P)=P`, so inner conjugations fix every cohomology class, while the central intersection has zero coboundaries and `e₂≠e₃`. In fact normalizer invariants in `H¹(P,M)` have dimension `3`, whereas stable classes have dimension `2`. With trivial coefficients fusion control gives the repaired simplification; the `S₃`, trivial integral-coefficient Check remains valid.

8. **F08** (P1) SL₂ over a nonprime odd field need not be periodic

   **Location:** `packages/CohomologyOfGroups/design/README.md:1371`: “`SL₂(𝔽_q)` for odd `q` … cyclic odd Sylow subgroups, so it is periodic”; `design/plan.json:2008`.

   **Claim:** All odd prime powers satisfy the full periodicity criterion.

   **Witness:** In `SL₂(𝔽₉)`, the matrices `[[1,a],[0,1]]`, `a∈𝔽₉`, form a subgroup `C₃×C₃`. Its order is `9`, the full 3-part of `|SL₂(𝔽₉)|=720`. This is a noncyclic abelian Sylow subgroup.

   **Exact repair:** Say that the 2-primary period is four for every odd `q`; for `q=p^f` odd the full group is periodic exactly when `f=1`. Add `q=9` as a negative control for the full criterion. Hutchinson13 lines 494–497 exclude the defining characteristic, and Corollary 3.3, lines 511–520, concerns the 2-primary part only. The repair retains all primes in the general theorem and computes this example correctly: 2-period four, no full period.

9. **F09** (P2) The cited convergence theorem requires a globally finite filtration

   **Location:** `packages/CohomologyOfGroups/design/README.md:1009` and 1014, `CochainComplex.filtrationSpectralSequencePageXIsoGradedOfFinite`; target 6.2's proof inputs in the plan.

   **Claim:** The cited theorem supplies convergence of the degreewise bounded Hochschild–Serre filtration.

   **Witness:** At the pin, `TauCeti/Algebra/Homology/SpectralSequence/Filtered/Convergence.lean:118` requires `F a=⊥` and `F b=⊤`. For `N=1`, `G=C₂`, `M=𝔽₂`, every cochain tail `A_j` is nonzero, although each fixed degree has a finite filtration.

   **Exact repair:** Use `CochainComplex.filtrationSpectralSequencePageXIsoEInfty`, `TauCeti/Algebra/Homology/SpectralSequence/Filtered/Stabilization.lean:83`, with its two homology-vanishing hypotheses, followed by `CategoryTheory.Abelian.SpectralObject.EInftyIsoCokernel`. State the index conversion from the decreasing filtration. For `F_t=A_{−t}`, sufficiently large `r` makes `H^{n+1}(F_{q−r+2})` and `H^{n−1}(K/F_{q+r−1})` zero in each fixed bidegree. These are the actual hypotheses of the more general pinned theorem; they hold in the counterexample even though no global bottom index exists. Update supplier contracts as well as the target.

10. **F10** (P2) Earlier owners are recast as downstream consumers

   **Location:** `packages/CohomologyOfGroups/design/README.md:77`–83, especially “instances of targets here”; Downstream consumers at line 1388; corresponding plan ownership and prerequisites.

   **Claim:** Naming earlier roadmaps' constructions as instances transfers ownership to this design.

   **Witness:** SchemeKTheoryOperations #1229, `TauCetiRoadmap/SchemeKTheoryOperations/README.md:2548`, already owns integral group hyperhomology and its two spectral sequences. K3BlochGroups #1430, `TauCetiRoadmap/K3BlochGroups/README.md:1870`, already owns Swan's general finite-group period theorem, including the Tate period class.

   **Exact repair:** Replace the retrospective ownership paragraph and downstream claims with supplier contracts. Import SchemeKTheoryOperations §6.7's integral hyperhomology and directed-union comparison; keep a genuinely additional `k`-linear/cohomological extension here, with a comparison to the imported integral object. Import MappingClassGroupsAndCanonicalRepresentations §1.1's discrete Hochschild–Serre existence and low-degree package; keep the specified filtered realization, products and further comparisons as extensions. Import InductionRestrictionPartII RS.0.1's central-extension sequence. Import K3BlochGroups §5.2's integral homology duality and quaternion/Swan period package; distinguish this design's arbitrary-module Tate duality and stable-element extensions. Import IntegralIwasawaTheoryPartII §0.7's `ℂ_p` evaluation specialization and prove compatibility with the general pairings here. The ownership table below gives each head and locator.

   Also add the actual directed-union supplier to 5.4: its two listed pinned lemmas provide class-surjectivity and vanishing, not injectivity of the colimit comparison. SchemeKTheoryOperations §6.7, line 2582, supplies the missing injective half for arbitrary coefficients. This is already owned, not a new gap. For a union such as `ℚ=⋃ₘ(1/m!)ℤ`, the imported comparison gives `H₁=colim ℤ=ℚ`; surjectivity alone would not establish that identification. All named owners are earlier. Do not make their existing designs depend upward on this one. The same integral object and the same Swan theorem then have one owner each.

11. **F11** (P3) The two corestriction labels in the cap formula are reversed

   **Location:** `packages/CohomologyOfGroups/design/README.md:809`–810: “the second `cor` homological and the first cohomological”.

   **Claim:** These labels type the formula `cor(x ∩ tr z)=cor(x) ∩ z`.

   **Witness:** The leftmost `cor` receives a homology class `x∩tr z`. The right-hand `cor` receives the cohomology class `x`. Their domains force the reverse labels.

   **Exact repair:** Write `cor_hom(x∩tr z)=cor_cohom(x)∩z` and give their source/target degrees, or simply reverse “first” and “second”. The degree-zero test then remains the same coset sum on both sides; no mathematical formula needs changing.

12. **F12** (P3) Missing or inaccurate locators and local section references

   **Location:** `packages/CohomologyOfGroups/design/README.md:357`, 395, 480, 540, 894 and 1158 (sections 1.3, 1.5, 2.2, 3.1, 5.2, 6.9); line 568's orbit-sequence citation; lines 250 and 1117's references to 6.5.

   **Claim:** Every claim has its source locator at the claim and every local reference identifies the intended input.

   **Witness:** Section 5.2 has no source locator; its plan cites Loh19 Outlook 3.2.26. HS53 line 283, Proposition 5, assumes an acyclic cochain complex and does not state 3.2's arbitrary monomial-complex orbit page. Section 6.5 is multiplicativity, not transgression.

   **Exact repair:** Restore the plan's settled source locators at 1.3, 2.2 and 3.1, retaining their uncertified status in the manifest. For 1.5 cite HS53 I §2, pp. 112–113 only for the cochain conversion, and the precise pinned carriers for the new continuous/discrete comparison. For 5.2 cite Loh19 Outlook 3.2.26, p. 138 as background and state that the exact generality follows from 5.1 and 5.3; that outlook is not a theorem stating this signature. For 3.2 identify the orbit page as the consequence of 2.3 and 1.4, supported by HS53 I §§4–5, pp. 114–116, rather than attributing the whole statement to Proposition 5. For 6.9 cite HS53 III §4, p. 130 only for the underlying five-term sequence and give the supplier/pinned definitions that determine the new compatibility statement. Change the transgression reference at line 1117 to 6.6 and the gap consumer at line 250 from 6.5 to 6.4. These replacements resolve to the indicated statements; they do not invent historical support for a Lean-specific comparison.

13. **F13** (P2) The stated subsection order precedes two of its own prerequisites

   **Location:** `packages/CohomologyOfGroups/design/README.md:726`, “by the uniqueness of 4.3. *Needs:* 4.1, 4.3”; line 901, “*Needs:* 4.2, 4.6, 5.1, 5.3”; matching plan prerequisite lists at lines 791 and 1135.

   **Claim:** The numbered target order is a build order.

   **Witness:** Target 4.2 needs 4.3, which follows it. Target 5.2 needs 5.3, which also follows it. The former's graded-commutativity route explicitly uses uniqueness; the latter explicitly uses universal coefficients.

   **Exact repair:** Place connecting-map uniqueness before cup identities, and universal coefficients before cohomological Künneth. Update target ids, prerequisites and local references consistently, with an old-to-new map where needed. Keep the evaluation definition in 4.6; put its identification with the UCT arrow in the UCT target, so that this comparison does not create a reverse dependency. The two routes then read `cochain cup → uniqueness → identities` and `cap/evaluation → UCT → cohomological Künneth`. This is a local build-order defect, not a mechanical cross-roadmap cycle.

14. **F14** (P3) Several definitions lack the required explicit API lists

   **Location:** `packages/CohomologyOfGroups/design/README.md:540` (3.1), 894 (5.2), 931 (5.4), 973 (6.1), 1084 (6.6); the definitions of stable elements at 1217 and the p-period at 1319.

   **Claim:** Every definition has a prose API bullet list, separate from at least three discriminating Checks.

   **Witness:** Section 5.4 puts naturality, associativity, unit, alternating degree-one product and three comparison ranges into a single paragraph. Its following bullets are Checks, not an API. Section 3.1 has no API list either.

   **Exact repair:** Extract the existing API assertions into mathematical bullet lists with their hypotheses and conclusions; add the corrected exactness hypotheses from R01–R02 to 3.1's list. Do this for each named definition above, preserving its Checks. For example, 5.4 needs separate bullets for functoriality, algebra laws, alternating degree one, the integral degree-≤2 comparison, torsion-free comparison and rational-coefficient comparison. Keep API bullets unnamed unless an eventual headline file really declares the name. No added Lean padding is requested.

Fourteen findings: six P1, five P2 and three P3. This is a repairable design, not a second copy of a roadmap on main. The mathematical counterexamples and ownership conflicts below prevent acceptance. No design file or source-manifest entry was changed. There was no previous review and no maintainer note to adjudicate.

## Verified sound

The audit covered all eight layers and all 41 plan targets, their APIs, the 125 plan Checks (at least three per target), the README's additional examples and conventions, the manifest, the supplied overlaps and board index, and relevant pinned declarations. Counts describe inspected material, not a claim that targets affected by findings are sound. The computed tests below distinguish passing instances from failures. No route-specific prime restriction, computational-algorithm target, sorry'd data, `set_option`, copied external passage or second copy on main was found. Earlier ownership is the separate defect R10.

The scalar convention allows the zero ring, for which all the displayed coefficient modules and (co)homology groups are zero. Tensor/Hom exactness was tested separately from that vacuous instance. The finite-group hypotheses are actually stated for Layers 7.2 and 8; arbitrary groups remain allowed elsewhere. Tate negative-degree comparisons exclude the exceptional degrees −1 and 0 appropriately. The p-period definition explicitly assumes `p∣|G|`: outside this range its proposed least degree would be 1, as its negative-control Check says. Infinite sums in homology and products in cohomology are distinguished. Finite-dimensionality is required in cohomological Künneth; no such condition is needed for the homological field formula.

The following table records concrete values, not merely a source endorsement. `C_m` denotes a cyclic group of order `m`; coefficients are trivial integral coefficients unless specified. A semicolon separates independent instances. Rows for broad targets test their definitions and principal assertions; the findings give the failing API clauses and repairs in detail.

| Target | Instances and computed values on the two sides | Result / change |
| --- | --- | --- |
| 1.1 Conjugation | `C₃◁S₃`, transposition: on `H²(C₃,ℤ)=ℤ/3`, generator `1↦−1=2`; conjugating twice gives `1↦1`. Inner action on the whole subgroup gives `id`. | Correct action direction and quotient behavior. |
| 1.2 Quotient action | `N=C₃◁S₃`: `H₁(N,ℤ)=ℤ/3`, quotient generator acts by `−1`; degree-zero action on `ℤ` is `+1`. For `N=G`, quotient `1` acts identically. | Does not mistakenly give trivial action on every degree. |
| 1.3 Additivity | `G=C₂`, `M=⊕ᵢℤ`: both homological sides in degree 1 are `⊕ᵢℤ/2`. For `A=⊕ℕℤ`, the identity `A→⊕ℕℤ` has infinitely many nonzero coordinate maps, unlike every member of `⊕ℕ Hom(A,ℤ)`. | Sums/products and failure of infinite cohomological sums distinguished. R12 locator. |
| 1.4 Permutation Shapiro | `H=1≤C₂`: `H₁(C₂,ℤ[C₂])=0=H₁(1,ℤ)`; degree zero is `ℤ` on both sides. `H=C₃≤S₃`: degree one is `ℤ/3` on both sides. | Shapiro, rather than un-derived coinvariants. |
| 1.5 Discrete/continuous | Discrete `ℤ`, coefficients `ℤ`: both `H¹` are `Hom(ℤ,ℤ)=ℤ`, and the generator maps to itself. With the profinite topology on `ℤ`, continuous maps to discrete `ℤ` factor through a finite quotient and give `H¹=0`, unlike abstract `ℤ`. | Discreteness matters. Reversing the homogeneous difference gives `−1=2` instead of `1` over `𝔽₃`. R12 locator. |
| 2.1 Hyper(co)homology | `C=ℤ[0]`, `G=C₂`: hyperhomology in degrees 0,1,2 is `ℤ,ℤ/2,0`, equal to group homology; hypercohomology is `ℤ,0,ℤ/2`. For `G=1`, a two-term identity complex has zero homology on both constructions. | Correct derived carrier; existing integral owner R10. |
| 2.2 Long exact sequences | `G=1`, sequence of degree-zero complexes `0→ℤ→2ℤ→ℤ/2→0`: resulting tail is precisely that exact sequence, with zero neighboring positive homology. For a contractible middle cone, connecting maps identify each end homology with its shifted copy. | Correct for short exact input complexes; it does not imply R02's unqualified tensor/Hom substitution. |
| 2.3 Two spectral sequences | For `S₃` and `C=(ℤ[S₃/C₃]→ℤ)`, the `q=0` map is `1:ℤ→ℤ`; `q=1` map is `0:ℤ/3→ℤ/2`. Abutments in degrees 0,1,2 are `0,ℤ/2,ℤ/3`, also `H_{n−1}(S₃,ℤ_sgn)`. | Agreement of filtrations and necessity of hyperhomology; R10 ownership. |
| 3.1 Equivariant (co)homology | Over `ℤ/4`, tensor the acyclic `ℤ/2→ℤ/4→ℤ/2` with `ℤ/2`: differentials become `0,id`, giving `H₂=ℤ/2` versus target `0`. Telescope over `ℤ`: Hom has a nonzero alternating-sequence class in `H²` versus `H²(1,ℤ)=0`. | Flatness Check is correct; missing projectivity and exactness are R01–R02. |
| 3.2 Orbit sequence | Circle with reflection fixing two vertices and swapping edges: `E¹_{0,q}=(ℤ/2)²` for positive odd `q`, while `E¹_{1,q}=0` there; high odd equivariant homology is `(ℤ/2)²`. Free rotation: higher stabilizer rows are zero and quotient-circle homology is `ℤ,ℤ,0,…`. | Free and nonfree actions distinguished. R12 source attribution. |
| 3.3 Free complexes | Cyclic resolution tensored with trivial `ℤ`: differentials alternate `0,m`, yielding `H₀=ℤ`, `H_odd=ℤ/m`, `H_even>0=0`. Nonfree `C=ℤ[0]` has coinvariant-complex `H₁=0` but hyperhomology `H₁(C_m,ℤ)=ℤ/m`. | Correct acyclicity/induced-module use. |
| 3.4 Tree chain complex | Point: `0→0→k→id k→0`. Line: boundary `t−1`, kernel zero, cokernel `k`. Circle with a loop: boundary zero and kernel `k≠0`. | Tree and no-inversion hypotheses, boundary sign discriminated. |
| 3.5 Tree sequences | Translating line with trivial `ℤ`: edge-to-vertex difference is zero, so `H₁=ℤ`, `H₀=ℤ`; changing difference to sum gives multiplication by 2 and `H₀=ℤ/2`. With sign action, `ker(t⁻¹−1)=ker(−2)=0`. | Matches coefficients and orientation. |
| 3.6 Amalgams/HNN/free groups | `C₄*_{C₂}C₆`: cokernel of `1↦(−2,3)` is `ℤ/12`. `BS(1,2)`: degree-one vertex map `−1`, degree-zero map `0`, hence `H₁=ℤ`. Free `ℤ*ℤ` with sign module has `H₁=ℤ` versus asserted `0`. | Amalgam/HNN Checks pass; free-product range R03. |
| 4.1 Cochain cup | On `ℤ²`, coordinate cocycles have cup values `1` at `(e₁,e₂)` and `0` at `(e₂,e₁)`; on the antisymmetric cycle evaluation is `1`. For `G=1` degree-zero cup is the given pairing, e.g. `2·3=6`. | Unsigned convention fixed. |
| 4.2 Cup laws | On the torus cycle, `⟨xy,z⟩=1`, `⟨yx,z⟩=−1`; on the individual pair `(e₁,e₂)` the cochains `xy` and `−yx` give `1` and `0`. In `H*(C₂,𝔽₂)`, the square of the degree-one generator is the nonzero degree-two generator. | Graded commutativity is cohomological; characteristic 2 does not force odd squares to vanish. R13 ordering. |
| 4.3 Connecting rules | Tensoring `0→ℤ→2ℤ→ℤ/2→0` with `ℤ/2` yields the failed injectivity `0:ℤ/2→ℤ/2`, excluded here. Twisting cup by `(−1)^{pq}` changes the torus value `+1` to `−1` and interchanges the connecting-map sign rules. | Exactness condition is present here; excludes the competing normalization. |
| 4.4 Diagonal approximation | Standard diagonal induces the same torus cup evaluation `1` as 4.1; a zero diagonal gives degree-zero product `1·1=0` and fails the augmentation lifting `1↦1⊗1`. A homotopic lift changes a cocycle pairing by a boundary, hence value `0` on cycles. | Augmentation and homotopy independence determine the intended product. |
| 4.5 Projection formula | `H=1≤C₃`, degree zero, `x=2`, `y=5`: `cor(x·res y)=3·10=30`, `(cor x)·y=6·5=30`; `H=G` gives identity on both sides. | Finite index, trace normalization and both projection directions agree. |
| 4.6 Cap/evaluation | `C₂`, `𝔽₂`, degree one: generator evaluates on generator as `1`. In degree zero with `H=1≤C₃` and trivial coefficients: both finite-index sides at `x=2,z=5` are `30`. For `p>n`, both designated cap maps are zero rather than an unguarded natural-subtraction degree. | Mathematical formula passes; its prose labels fail, R11. |
| 4.7 Comparisons | Finite `C₃`, discrete coefficients: the character `1↦1` corresponds to itself in degree one. Integral positive Tate cup generators satisfy `u·u=u²`, coefficient `1 mod 3` in both models. Abstract `H¹(∏ℕC_p,𝔽_p)` is uncountable; continuous `H¹` is the countable direct sum. | Does not identify profinite continuous with arbitrary abstract cohomology. |
| 5.1 Homological Künneth | `C₂×C₂`: integral `H₂=ℤ/2`, `H₃=(ℤ/2)³`; degree-three tensor part has two summands, Tor contributes the third. With `𝔽_p` coefficients, dimensions are `1,2,3` in degrees 0,1,2, and `n+1` generally. | Tor term and split/non-split claims distinguished; hereditary/projectivity inputs checked at pin. |
| 5.2 Cohomological Künneth | Field torus cross evaluation is `1`, asserted signed value `−1`. For two infinite-rank free abelian groups over `ℚ`, the bilinear form with matrix `δᵢⱼ` has infinite rank; every finite sum of tensors of functionals has finite rank. | R04; finite-dimensionality is essential to surjectivity, and R13 orders its UCT input. |
| 5.3 Universal coefficients | `G=C₂`, `A=ℤ/2`, degree two: homological tensor term `0`, Tor term `ℤ/2`, result `ℤ/2`; cohomological Ext term `ℤ/2`, Hom term `0`, result `ℤ/2`. Degree zero gives `A` with no negative-degree correction. | Both correction terms necessary. |
| 5.4 Pontryagin ring | `A=ℤ²`: exterior/homology ranks `1,2,1,0,…`; `A=C₂`: `Λ²A=H₂(A,ℤ)=0`, but `Λ³A=0≠ℤ/2=H₃`. `A=ℚ`: degree one `ℚ`, higher degrees zero; rational homology of `C₂` is zero above degree zero. | Stated comparison ranges survive; R10 supplies the missing full colimit comparison. |
| 6.1 Filtration | `N=1`: `A_j C̄ⁿ=C̄ⁿ` for `j≤n`, zero otherwise. `N=G`: `A_0=C̄`, `A_1=0`. `C₂⊂C₄`, degree one over `𝔽₂`: `A₁` has independent values at 1,3 (dimension 2), while `A*₁` identifies them (dimension 1). | Distinct filtrations not falsely identified as complexes. |
| 6.2 Cohomological HS | `N=1`: only `q=0`; `N=G`: only `p=0`. `C₃◁S₃`, `𝔽₃`: invariant dimensions in degrees 0–4 are `1,0,0,1,1`, from action `(−1)^ceil(q/2)`. `C₂⊂C₄`: each E₂ cell has dimension 1, but the abutment has only one per total degree. | Correct page/abutment; R09 proof-route hypothesis, R10 ownership. |
| 6.3 Homological HS | Split `C₂×C₂`, `𝔽₂`: diagonal E₂ dimensions add to `n+1`, matching `H_n`. Nonsplit `C₂⊂C₄`: E₂ diagonal has `n+1` cells but `H_n(C₄,𝔽₂)` has dimension 1. | Must retain differentials; no unjustified degeneration. |
| 6.4 Edges | `C₂⊂C₄`, `𝔽₂`: inflation in `H¹` is `1↦1`; restriction sends the character of `C₄` to value `0` on 2. For `N=G` restriction is identity; for `N=1` inflation is identity. | Edge directions agree with pinned maps. |
| 6.5 Multiplication | Under first-N-arguments restriction for `ℤ_Q×ℤ_N`, `y∪x` identifies with `+1`, `x∪y` with `−1`; stated sign gives the reverse. Over `𝔽₂` both signs are `+1`, so that Check cannot detect the defect. | R05. |
| 6.6 Transgression | `C₃⊂C₉`, section representatives 0,1,2, lift `f(3a+r)=a`: `df(1,2)=f(2)−f(3)+f(1)=−1=2 mod 3`, whereas the carry is `1`. Thus `τ=−[carry]`. Split extension gives carry and transgression zero. | Minus sign agrees with pinned descended-coboundary definition. |
| 6.7 Low-degree sequences | `C₂⊂C₄`, integral homology tail is `0→ℤ/2→(×2)ℤ/4→ℤ/2→0`. With `𝔽₂` cohomology, the consecutive maps from H¹(Q) are `id,0,id,0`; image equals kernel at each stated position. | Correct maps; gap covers homological edge/sequence machinery. R12 transgression reference. |
| 6.8 Hopf/central extensions | Free presentation of `ℤ²`: `R=[F₂,F₂]`, Hopf quotient `R/[F₂,R]=ℤ=H₂(ℤ²,ℤ)`. A free group itself has `R=1`, giving zero on both sides. Central `C₂→C₄→C₂` gives inclusion `1↦2` and quotient mod 2. | Correct formula; central sequence already owned, R10. |
| 6.9 Finite/profinite comparison | `C₃⊂C₉`, both lift constructions at `(1,2)` give `−1 mod 3`; `N=G` makes both transgressions land in zero. Every map from a finite discrete domain is continuous, including the chosen section. | Actual definitions match; historical citation alone cannot assert this comparison, R12. |
| 7.1 Double cosets | `H=K=C₂≤S₃`, positive degree: two double cosets contribute `id` and a map through zero, giving `id`. For `K=1`, degree zero and trivial coefficients, both sides are `[G:H]·m`. For normal H, terms are exactly conjugations. | Arbitrary K and finite-index H suffice; inverse in homological conjugation has correct target. |
| 7.2 Stable elements | `S₃`, p=3: `H²(C₃,ℤ)` invariants `0`, `H⁴` invariants `ℤ/3`, agreeing with the 3-parts of `ℤ/2,ℤ/6`. Twisted `C₂×S₃` example: normalizer invariants dimension 3, stable dimension 2. Degree-zero integral p-primary side is zero, stable invariants `ℤ`. | Full fusion statement and positive-degree restriction pass; missing trivial-action hypothesis R07. |
| 8.1 Tate duality | `C₂,M=ℤ`: `Ĥ⁰(C₂,ℚ/ℤ)=0=Hom(Ĥ⁻¹(C₂,ℤ),ℚ/ℤ)`; `Ĥ¹(C₂,ℚ/ℤ)=ℤ/2=Hom(H₁,ℚ/ℤ)`. Integral version at `M=ℤ/2` fails: left zero, right `ℤ/2`, and is excluded by freeness. Corollary at d=0 would give `0` versus `ℚ/ℤ`, and is excluded. | Duality degrees and freeness restriction checked; source text unavailable as recorded below. |
| 8.2 p-group classification | `Q₈` has abelian subgroups of orders 1,2,4, all cyclic; `D₈` contains `V₄`, excluded. Odd Heisenberg p³ contains commuting independent central/noncentral elements generating `C_p²`, excluded. | Neither quaternion alternative at odd p nor dihedral alternative at p=2 is admitted. |
| 8.3 CT resolutions | Cyclic norm resolution gives shift 2. For `C₂`, `0→ℤ_sgn→ℤ[C₂]→ℤ→0` gives `Ĥ⁰(C₂,ℤ)=ℤ/2=Ĥ¹(C₂,ℤ_sgn)`. Squaring the sign twist gives the untwisted shift 2. `C_p²` has unbounded dimensions `n+1`, incompatible with a period. | Twist and n=0 example fit the general algebraic statement. |
| 8.4 Periods | `S₃`: 3-period `2·2=4`, 2-period 2. `Q₈`: degree-two integral Tate group `(ℤ/2)²` is not cyclic of order 8, degree four is `ℤ/8`, so period 4. If p does not divide order, all primary groups are zero and least positive degree is 1. | Hypotheses and minimum-degree convention matter; existing owner R10. |
| 8.5 Periodicity | `1`: Tate groups zero, zero class acts as the unique isomorphism `0→0`. `S₃`: cyclic Sylows give period 4. `A₄`: V₄ obstructs it. `SL₂(𝔽₉)`: Sylow 3 is C₃² of order 9, whereas 2-period remains 4. | General criterion survives these tests; its SL₂ Check is false, R08. |
| Layer 6 worked example | `d₂y=x²`; E₃ cells `(0,1)=0`, `(1,2)=𝔽₂`, `(0,2)=𝔽₂`, `(2,0)=0`. Total-degree dimension is 1 in every degree, rather than the described column/row. | R06. |

For R01 the telescope is concentrated in degrees 2,1,0 before adjoining `ℤ[0]`; its augmentation is a quasi-isomorphism. All terms are flat. The nonimage assertion follows from `a₀=Σ_{i<r}2ⁱbᵢ+2ʳa_r` for every r, forcing the incompatible 2-adic value `−1/3`. For R07 the dimension count can be checked without a large group computation: as a P-module the permutation module splits into the two-point orbit module and the fixed point. Shapiro gives `dim H¹(P,M)=1+2=3`. As a G-module it is induced from P, so `dim H¹(G,M)=dim H¹(P,𝔽₂)=2`. The explicit cocycle identifies exactly a class excluded by fusion.

Source sample and locator verification:

| Seeded target | Text and locator actually read | Conclusion |
| --- | --- | --- |
| 1.1 Conjugation | HS53 I §2 corollary to Proposition 2, p. 113, lines 154–160, and I §7, pp. 117–118, lines 345–354; Loh19 Proposition 3.2.13, p. 124, lines 5322–5353. | Inner action triviality and normal-subgroup quotient action support the claim; general compatible-pair maps are pinned. |
| 2.1 Hyperhomology/hypercohomology | HS53 I §4, p. 114, lines 201–216; I §2 Proposition 1, p. 111, lines 83–106; homological transcription at lines 355–362. | Bicomplex route supported. Arbitrary-k formulation is an algebraic extension using the stated standard resolution, not a verbatim source theorem. |
| 2.2 Long exact sequences | CE56 Chapter XVII is settled uncertified. | Could not inspect the text; mathematical short-exact-complex test passes. README citation missing, R12. |
| 3.1 Equivariant (co)homology | Brown82 Chapter VII is settled uncertified. | Could not inspect. Independent counterexamples establish R01–R02. |
| 3.2 Orbit sequence | HS53 I §5 Proposition 5, p. 116, lines 283–288, compared with lines 236–274; SerreArbres II §2.8, p. 168, lines 5150–5166 for permutation/Shapiro mechanism. | Proposition 5 has an acyclicity hypothesis and a different immediate conclusion; derive the orbit page from 2.3 and Shapiro, R12. Brown82 VII unread. |
| 4.1 Cochain cup | HS53 II §1, pp. 118–119, lines 389–400; MilneCFT II Proposition 1.38, p. 73, lines 3459–3483. | Unsigned cup and Leibniz convention supported. |
| 4.5 Projection formula | MilneCFT II Proposition 1.39(d), p. 74, lines 3491–3496. | Supports the finite-index formula; the opposite ordering follows with the stated braiding/sign. |
| 4.6 Cap and evaluation | Brown82 Chapter V is settled uncertified. | Text unread; direct degree-zero and degree-one checks pass, prose domains fail as R11. |
| 5.4 Pontryagin ring | Brown82 Chapter V is settled uncertified. | Text unread; exterior comparison ranges tested above; full colimit input must be imported, R10. |
| 6.2 Cohomological HS | HS53 II §2 Theorem 1, p. 121, lines 476–491; II §4 Theorem 2, p. 125, lines 654–657; II §5 Proposition 3, p. 125, lines 677–679. | Restriction identification and signed d₁ supported. Pinned convergence route has a different hypothesis, R09. |
| 6.3 Homological HS | Loh19 Theorem 3.2.12(1), p. 123, lines 5306–5314; HS53 I §7, p. 118, lines 355–362. | Normal extension, coefficients and E²/abutment supported. |
| 6.9 Finite/profinite comparison | HS53 III §4 remark after Theorem 2, p. 130, lines 854–856; pinned transgression definitions and ProfiniteCohomology §§3.1,5.5. | Historical text supplies the five-term statement, not a comparison with the named formal definitions. R12 distinguishes these roles. |
| 7.1 Double coset formula | Brown82 III §§8–9 is settled uncertified; pinned continuous Mackey formula opened for the finite-group specialization. | Book text unread; subgroup indices, inverse and S₃ tests pass. The pinned profinite result alone is not the arbitrary-discrete theorem. |
| 7.2 Stable elements | Hutchinson13 §3, p. 11, lines 482–491; MilneCFT II Proposition 1.30 and Corollary 1.33, pp. 70–71, lines 3357–3366 and 3382–3389. | Supports integral homological stable elements and restriction/index inputs. It does not justify the arbitrary-twisted-coefficient abelian simplification, R07. Brown82 III §10 unread. |
| 8.1 Tate duality | Brown82 VI §7 and CE56 XII are settled uncertified. | Could not certify source statements, including their full coefficient generality; independent boundary computations and the stated injective-dual route were checked. |

No additional locator was explicitly flagged “unverified” in the plan. The unsettled-access flags are the already settled uncertified/waived entries, all treated below without requesting them again. Further source checks included the tree exact sequence (SerreArbres lines 5170–5196), Künneth (Loh19 lines 5854–5932), transgression (HS53 lines 984–1015), p-group classification (Loh19 lines 2399–2437), sphere periodicity proof (Loh19 lines 7012–7088), and the p-period statement (Hutchinson13 lines 499–520). The latter supports the p-primary result, not R08's all-prime extrapolation. The hereditary-ring Künneth/UCT formulations are supported by the pinned algebraic inputs; Loh19's PID theorem and cohomological outlook do not themselves state all of that generality.

Pinned-library audit:

The manifest pins are Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Searches were by objects as well as identifier names. Ninety-seven identifier candidates were located; generic short-name matches were distinguished from the intended namespace. The citation resolver reported no name found nowhere. The following opened declarations establish the important boundaries of existing ownership and of the proposed extensions; paths here are relative to the corresponding pinned library repository.

| Pinned file and line | Declaration/input and scope checked |
| --- | --- |
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:183`; `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:226` | Native `groupCohomology` and `groupHomology` on representations; no new carriers are needed. |
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean:141`; `Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean:157` | Compatible-pair `map`, with contravariant/covariant group and coefficient directions. |
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean:552`; same file:566; `Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean:850`; same file:864 | Restriction, inflation, homological corestriction and coinflation natural transformations. These are imported, not recreated. |
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean:58`; `Mathlib/RepresentationTheory/Homological/GroupHomology/Shapiro.lean:65` | `coindIso`, `indIso`; cohomology uses coinduction, homology induction. |
| `Mathlib/RepresentationTheory/Homological/Resolution.lean:321`; same file:427 | Standard and bar resolutions. Their augmentation comparisons underlie the proposed extensions. |
| `Mathlib/RepresentationTheory/Invariants.lean:263`; `Mathlib/RepresentationTheory/Coinvariants.lean:442` | Quotient-to-invariants and quotient-to-coinvariants functors, used to express normal-subgroup coefficients on G/N. |
| `Mathlib/RepresentationTheory/Homological/TateCohomology/Basic.lean:146`; same file:233,241 | Native Tate carrier and positive/negative comparisons. The negative comparison requires the stated nonexceptional degree; it is not H₀ at degree −1. |
| `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:113`; same file:131 | Continuous homogeneous cochains and `continuousCohomology`; topology remains part of the carrier. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/DiscreteGroup.lean:166` | Existing finite-discrete comparison; does not by itself supply the proposed all-discrete, k-linear, natural comparison. |
| `TauCeti/RepresentationTheory/Homological/GroupCohomology/Corestriction.lean:136`; `TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean:79` | Existing cohomological corestriction and homological transfer, with finite index. |
| `TauCeti/RepresentationTheory/Homological/GroupCohomology/InflationRestriction.lean:132`; same file:139 | Existing inflation injectivity and exactness input, not a new theorem here. |
| `TauCeti/RepresentationTheory/Homological/TateCohomology/Cup/Product.lean:131`; `TauCeti/RepresentationTheory/Homological/TateCohomology/Cup/Delta.lean:242`; same file:443 | Tate cup and its connecting-map rules; flatness/splitting conditions retained in proof routes. |
| `TauCeti/RepresentationTheory/Homological/TateCohomology/Cup/Cyclic.lean:146` | Character-class cup comparison in the already supplied degree. The all-degree identified cup action is an extension, not just another statement of abstract cyclic periodicity. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction/Mackey/AllDegrees.lean:279` | `corestriction_mackey` for profinite/open/closed input. Giving a finite group the discrete topology is valid; dropping compactness to infer the arbitrary-group theorem is not. |
| `TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean:304`; same file:409,425; `TauCeti/Algebra/Homology/SpectralSequence/Filtered/FirstPage.lean:89` | Filtration functor, spectral sequence, first-page identification and differential. Its native page indexing needs the stated mathematical identification. |
| `TauCeti/Algebra/Homology/SpectralSequence/Filtered/Convergence.lean:51`; same file:118; `TauCeti/Algebra/Homology/SpectralSequence/Filtered/Stabilization.lean:83` | Abutment, global-finite convergence, and the more general stabilization. The distinction is R09. |
| `TauCeti/Algebra/Homology/SpectralSequence/Bicomplex.lean:410`; same file:442,484 | Row/column sequences and abutment supplied, not planned anew. |
| `TauCeti/Algebra/Homology/Monoidal/Homology/Kunneth/Sequence.lean:729`; same file:793 | Short exact and split Künneth sequence. Projective cycles/quotients and the splitting input are obtained under the roadmap's hereditary-ring and projective-coefficient hypotheses. |
| `TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean:121`; same file:153,180 | Ext-to-homology map, injectivity and exactness; these are the UCT algebraic inputs, not a newly owned abstract UCT. |
| `TauCeti/RepresentationTheory/Homological/GroupHomology/DirectedUnion.lean:113`; same file:132 | Class-surjectivity and acyclic-union vanishing only. Neither declaration is the full colimit isomorphism required in 5.4. |
| `Mathlib/GroupTheory/HNNExtension.lean:72`; same file:79 | `t a t⁻¹=φ(a)`; FreeGroupsAndLimitGroups §4.5 sends its oppositely oriented loop edge to `t⁻¹`, so the conventions are compatible. |

Supplier and ownership audit:

Read main's DerivedModuleAlgebra, ProfiniteCohomology and ClassFieldTheory as house-shape examples before assessing this design. The other main supplier sections were resolved against main, not a proposed revision. Open-head reads used the provided index/tools; no unlisted head was guessed. The leading tool-generated provenance line in an open-head extraction is not counted as a README line in the references below.

| Existing owner / head | File and locator inspected | Relationship to this design |
| --- | --- | --- |
| DerivedModuleAlgebra, main | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:955`, §S.1; cohomological edges at 970, homological form at 990. | Owns generic double-complex spectral sequences. The declared gap supplies precisely the missing homological edges/five-term sequence; not a duplicated construction. |
| ProfiniteCohomology, main | `TauCetiRoadmap/ProfiniteCohomology/README.md:1140`, §3.1; §3.2 at 1155; §5.5 at 1571; §6.4 at 1770; §10.1 at 2622; §10.5 at 2763; Layer 12 at 3519. | Owns explicit continuous comparisons, profinite five-term sequence, continuous Mackey and cup/colimit interfaces. This design's discrete comparisons can be genuine extensions. |
| ClassFieldTheory, main | `TauCetiRoadmap/ClassFieldTheory/README.md:778`, §0.1 and Layer 0 contracts. | Owns Tate/CT interface and class formations, which this design imports. General Tate evaluation duality is not silently attributed to a class-formation theorem. |
| FreeGroupsAndLimitGroups, main | `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:385` (§2.2), 773 (§4.1), 803 (§4.2), 863 (§4.5), 875 (§4.6), 906 (§4.7), §4.8. | Owns graph groups and their trees. Checked edge reversal and the `e↦t⁻¹` HNN comparison, not just the section headings. |
| AlgebraicTopology, main | `TauCetiRoadmap/AlgebraicTopology/README.md:1273` (§4.1), 1294 (§4.2), §4.3; 1945 (§5.3), 2005 (§5.4), 4458 (§8.15). | Owns cellular/topological constructions, torus comparison and sphere-action application. General algebraic permutation complexes are a different object. |
| SchemeKTheoryOperations #1229 | `TauCetiRoadmap/SchemeKTheoryOperations/README.md:11` scope, 2548 hyperhomology, 2582 directed-union theorem, all §6.7. | Already owns integral hyperhomology/two sequences and the full arbitrary-coefficient directed-union comparison. R10 imports these rather than reversing supply. |
| K3BlochGroups #1430 | `TauCetiRoadmap/K3BlochGroups/README.md:25` ownership, §4.1 at 1191, §5.2 at 1867–1870. | Imports hyperhomology from SchemeKTheoryOperations; owns localized stable elements, integral homology duality, quaternion resolution and Swan's theorem. Generalizations here must distinguish these existing inputs. |
| MappingClassGroupsAndCanonicalRepresentations #2266 | `TauCetiRoadmap/MappingClassGroupsAndCanonicalRepresentations/README.md:849`, §1.1, especially 851–880. | Already states arbitrary discrete-group HS and its low-degree filtration/transgression package. A title suggesting mapping-class applications does not narrow those quantifiers. |
| InductionRestrictionPartII #1154 | `TauCetiRoadmap/InductionRestrictionPartII/README.md:312`, RS.0.1; statement at 314. | Owns five-term central-extension sequence without finiteness. The identical consequence of 6.8 must be imported. |
| IntegralIwasawaTheoryPartII #2267 | `TauCetiRoadmap/IntegralIwasawaTheoryPartII/README.md:273`, §0.7; evaluation at 275. | Owns arbitrary-group `ℂ_p` evaluation pairing and its coefficient naturality. General pairings here are additional, but the specialization must agree with this owner. |
| ModularCurvesPartII #913 | `TauCetiRoadmap/ModularCurvesPartII/README.md:3937`, §15.4. | Owns the modular amalgam specialization, not all tree sequences. Retain that ownership rather than relabeling existing work as a future import. |
| HomologicalStabilityOfGeneralLinearGroups #2036 | `TauCetiRoadmap/HomologicalStabilityOfGeneralLinearGroups/README.md:43`–55, scope. | Explicitly imports hyperhomology and directed unions from SchemeKTheoryOperations §6.7. It supplies independent confirmation of the earlier owner. |
| ArithmeticGaloisDuality #858 | `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:42`, scope, and R02.2. | Profinite/compact comparison and arithmetic applications; imports its extension spectral sequence from NoncommutativeAndEquivariantIwasawa §F.3. It is not a second owner of arbitrary discrete-group cohomology here. |
| ProfiniteCohomologyPartII #1839 | `TauCetiRoadmap/ProfiniteCohomologyPartII/README.md:22`, Scope and ownership. | Owns continuous cochain algebra refinements, including Massey operations. Ordinary discrete pairings here require comparison on overlap, not a replacement of that object. |

The overlaps file has no second copy, competing head, dropped cited id or revision-only id for this package. Main and the supplied board index were checked before drawing that conclusion. The third, results/headings-based closest-roadmap list was empty. There is no finding based merely on absence from the merge order, nor any request to wait for an open revision of an existing roadmap.

Overlap check: read K3BlochGroups, ArithmeticGaloisDuality, IntegralIwasawaTheoryPartII, ProfiniteCohomologyPartII, HomologicalStabilityOfGeneralLinearGroups, ProfiniteCohomology, ClassFieldTheory and DerivedModuleAlgebra. Hyperhomology/directed unions belong to SchemeKTheoryOperations; the K3 finite-group duality/period package to K3BlochGroups; the `ℂ_p` evaluation specialization to IntegralIwasawaTheoryPartII; generic double-complex machinery to DerivedModuleAlgebra; continuous cohomology/Mackey/cup to ProfiniteCohomology, with continuous refinements in its Part II and compact/arithmetic comparisons in ArithmeticGaloisDuality; the Tate/CT interface to ClassFieldTheory. HomologicalStability imports the shared hyperhomology object. The additional arbitrary-discrete and arbitrary-pairing extensions may belong here once R10 is repaired.

The dependency check, run against the unchanged candidate, returned:

```text
candidate: CohomologyOfGroups is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2170 edges, 0 problem(s)
```

Every `*Needs:*` line and supplier block was read. No UPWARD or CYCLE line occurred. The gate does not settle R10's ownership reversal, R09's hypothesis mismatch or R13's local order. The single declared gap, `homological-low-degree`, has the same slug in the plan and README, names DerivedModuleAlgebra §S.1, specifies first-quadrant homological complexes, both edge arrows and the exact five-term sequence. Main's §S.1 supplies homological E²/convergence but only states those low-degree maps in cohomological indexing. The gap is precise, minimal and owned; its absence today is not a finding. The mistaken consumer number is R12, not a defect in the contract itself.

Headline, shape and Lean audit:

The seven headline families explicitly named at README lines 17–19 are: Hochschild–Serre with edges/products/transgression/low degrees (6.2–6.7), tree sequences (3.5), Künneth (5.1), double cosets (7.1), stable elements (7.2), Tate duality (8.1), and periodicity (8.5). This job supplies a design README and plan, not a package `Suggested.lean`. Accordingly there is no Lean file on which to run a one-tactic padding probe, inspect imports/section binders, enumerate missing headline declarations or run `#check @name`. No missing-file or padding finding is raised at this stage. The plan's prospective names are not declarations. Backticked library names were resolved; mathematical symbols such as Θ are not represented as existing Lean declarations.

Elaboration outcome: **not available (this lane does not elaborate)**. No Lean process was launched and no passing elaboration is claimed. Package acceptance will require the seven headline families to be stated wherever statable, or explicitly named with missing carriers in the module docstring, and the full padding/binder audit. No weakened stand-in is proposed in this review.

The README has the required title, Summary, scope, conventions, contracts, reading guide, eight mathematical layers, layer Examples/Dependencies, consumers and references. Each plan target has at least three Checks. Missing explicit API lists are R14, and missing claim-local citations are R12. The process wording “roadmaps under review” at line 77 disappears when R10 replaces that paragraph with timeless ownership contracts. There are no local machine paths or pull-request numbers in the design prose. The roadmap is algebraic mathematics, not a collection of computational algorithms.

Source independence and arrangement:

Compared 24 distinct roadmap passages against their cited readable sources: HS53 for 1.1, 1.2, 1.5, 2.1, 2.3, 3.2, 4.1, 6.1, 6.2, 6.5, 6.6, 6.7 and 6.9; SerreArbres for 3.4–3.6; MilneCFT for 4.3 and 4.5; Loh19 for 5.1, 5.2 and 6.3; Hutchinson13 for 7.2, 8.4 and 8.5. This includes more than five additional passages outside the seeded sample. No copied prose, clause-by-clause paraphrase, transferred exercise list, table or figure was found. Standard formulas and mathematical terminology were excluded from the copying test. The ownership overlap with existing roadmaps is recorded separately in R10.

Before References, explicit source-key occurrences are HS53 26, Loh19 18, Brown82 12, MilneCFT 7, Hutchinson13 6, SerreArbres 4, CE56 3 and SwanPPeriod60 1: 77 total. Counting each source once per paragraph instead yields 63 citation blocks, led by Loh19 with 17 and HS53 with 16. Both arrangements were therefore inspected. HS53's three chapter headings and opening account (lines 22–42; Chapters I–III) concern auxiliary bicomplexes, the extension filtration and its applications. They do not correspond one-to-one to this roadmap's trees, arbitrary pairings, group products, finite-index operations and duality layers. Within Layer 6, 6.1→6.2→6.4 and 6.1/6.2→6.5→6.6→6.7 are explicit mathematical dependencies. Loh19's contents, lines 76–144, place geometric material before derived cohomology and place Hochschild–Serre before Künneth; this design does neither and does not reproduce the topological/classifying-space chapters. No source-derived layer-order defect is established. The two local forward edges remain R13.

Source independence: 24 passages compared with 5 readable sources; no copied expression or reused source material found. Largest raw locator-key share HS53, 26 of 77; largest paragraph-deduplicated share Loh19, 17 of 63. Contents/chapter arrangement compared with both: independent. Brown82 and CE56 text/contents and SwanPPeriod60 primary text were not read under their settled access statuses.

## Not verifiable

- Brown82 is settled uncertified. Its cited III, V, VI and VII passages could not be read; in particular source certification of sampled 3.1, 4.6, 5.4, 7.1 and 8.1 is unavailable. The secondary references and independent calculations do not turn those inaccessible passages into verified citations.
- CE56 is settled uncertified. Chapter XVII for sampled 2.2 and Chapter XII for 8.1/periodicity could not be read. No new request or renamed manifest key was created.
- SwanPPeriod60 is settled waived. Theorems 1–2 were checked only through Hutchinson13 Theorem 3.1, not against Swan's primary text.
- Lean elaboration, one-tactic probes and elaborated binder signatures are unavailable in this lane, and no `Suggested.lean` was part of this design. This report is not a successful package build.
- Source errata below were read in the supplied line-numbered extractions. A PDF page-rendering utility was unavailable for a second visual check. The displayed surrounding mathematical formulas independently distinguish each proposed correction.

All eight cited works already occur in `sources.toml`. Five were readable in the provided legal cache; the other three have settled statuses. There is no additional missing source and no reason to alter the author's manifest entries or open a new reference request.

## Source issues

- **Misprint** in Hutchinson13 at Corollary 3.3 proof, printed p. 12 (line 518): the source says the nonzero homology residue is 3 modulo 3; it should be 3 modulo 4, as in the corollary; affects the proof.
- **Misprint** in Loh19 at Corollary 3.2.23 proof, printed p. 136 (lines 5903, 5908, 5927): the source says the tensor resolution has G in both factors; it should be G in the first factor and H in the second; affects the proof.
- **Misprint** in Loh19 at Example 3.2.24, printed p. 137 (lines 5954–5955): the source says integral homology of ℤ² vanishes for n≥2; it should be n≥3, since the immediately preceding computation gives H₂=ℤ; affects a stated result.
- **Misprint** in Loh19 at Example 3.2.25 conclusion, printed p. 138 (lines 5976–5980): the source says integral-coefficient Hₙ is an n-dimensional vector space over 𝔽_p; it should be Hₙ with 𝔽_p coefficients, of dimension n+1; affects a stated result.

## For the human reviewers

- Brown82 and CE56 remain uncertified and SwanPPeriod60 waived in `packages/CohomologyOfGroups/sources.toml`. Their inaccessible expression and primary-source details were not tested; no new access or licence decision was assumed. Both most-cited readable sources had their arrangement checked.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "e75c7b5816f9d383e86e77de763d4cdd81b862c2", "job": "REV-DESIGN-CohomologyOfGroups", "model": "gpt-6-astra", "worker": "chris-10"} -->
