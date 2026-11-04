<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1646#issuecomment-6438072461 -->
Red team round 1 pass a (codex) of a92beaf

Verdict: needs_changes

1. **F01** (P2) Specify the quotient through which matrix coefficients are lifted

   **Location:** `packages/SmallRamificationAndAbelianVarietyBaseCasesPartII/README.md:202`, “Choose lifts λ̂ₛₜ∈O(E)”; the asserted reduction bijection is at line 232.

   **Claim:** The permitted coefficient lifts give an exact-solution set whose coordinate reduction lands in Homₘ𝒻(M,A(E)). No reduction map or congruence modulus is specified. Lifting the coefficients through the residue field, the usual meaning for coefficients in k, is insufficient in a ramified E.

   **Witness:** p=3,r=1,E=ℚ₃(π),π²=−3; take the weight-zero unit M and λ̂=(1+π)². It reduces to λ=1 in the residue field. x=1+π solves x³=λ̂x, but φ₀([x])=1≠1+[π].

   **Exact repair text:** “Regard each λₛₜ∈k as an element of A(E) through W(k)/p→A(E), and choose λ̂ₛₜ∈O(E) mapping to that element under O(E)→A(E). Thus v₀(λ̂ₛₜ−[λₛₜ])>r/(p−1), where [λₛₜ] is its Witt Teichmüller representative. Residue-field lifts alone are not allowed. In §1.5 choose these lifts in W(k).” Add to §1.2 Checks: “For p=3,r=1 and π²=−3, the residue lift λ̂=(1+π)² of 1 is inadmissible: v₀(λ̂−1)=1/2. Its exact solution 1+π does not define a filtered Frobenius morphism.”

   **Retest:** The proposed congruence excludes this lift because 1/2 is not greater than 1/2. With λ̂=1, exact roots 0,1,−1 reduce to the three φ₀-fixed classes. For any permitted lift, its image equals the original coefficient in A(E), so the reduced equation is the required morphism equation. This is a missing specification, not a claim that Fontaine’s intended lifting lemma is false.

2. **F02** (P1) The unramified-lifting supplier has a narrower residue-field domain

   **Location:** `packages/SmallRamificationAndAbelianVarietyBaseCasesPartII/README.md:300`, “LocalFieldsRamification Layer 2 for henselian unramified lifting”; the lifting step is at line 290.

   **Claim:** This supplier supplies the unramified-part lifting used for every perfect residue field in §1.6.

   **Witness:** `TauCetiRoadmap/LocalFieldsRamification/README.md:562` starts Layer 2 with finite extensions of local fields; lines 624–637 use finite residue fields and cyclic unramified extensions. K=Frac W(𝔽₃(t)^perf) is outside that domain.

   **Exact repair text:** Replace that part of the Needs line with “SchemeAndStackFoundations §§0.12 and 0.14 (`exists_etale_lift`, `henselian_pair_permanence`, `henselian_finiteEtale_equivalence`) for finite étale lifting over henselian pairs with arbitrary residue field.” Add to the proof route: “Let L₀/K be the maximal unramified subextension. Its finite étale integral algebra lifts the restricted approximate map uniquely over the henselian pair (O(E),a(E)^m). Equivalently, first descend the finite input to a finite extension inside E and lift there. Use the resulting embedding L₀→E, then apply the totally ramified argument over L₀.” Add these sections to the exact supplier contract and Layer 1 dependency list. If the general DVR identification of O(L₀) as finite étale is not supplied on the intended carrier, declare that precise extension with a named owner instead of citing Layer 2 as already supplying it.

   **Retest:** For k=𝔽₃(t)^perf and the separable residue extension adjoining α with α²=t, the reduced derivative 2α is nonzero. Its unramified Witt lift is finite étale and henselian lifting applies despite k being infinite. The repaired supplier statements explicitly impose no finite-residue-field condition. The valuation normalization and threshold 3/2 are unchanged under this unramified base extension.

## Verified sound

Read all 659 lines of README.md and all 92 lines of Suggested.lean at the requested head. Coverage: **4 Lean declarations** (2 definitions, 2 theorems), **24 numbered README targets**, **28 API bullets**, **79 numbered-section Check bullets**, **24 target locator blocks**, **3 external source works**, and **12 cross-roadmap contract groups** (11 suppliers and the Enriques consumer). The tables below record the actual computations, including failures and conditional examples. A passed example is not a proof of the general theorem.

The supplied elaborated signatures were compared individually with the README and the native definitions. I did **not** run Lean: this pass uses the provided elaboration output, as required by the read-only instructions. No section binder was lost. Both headline conclusions use actual scheme differential sheaves and cohomology. No padding, sorry-valued data, free predicate substitute, or duplicate fully qualified declaration was found. The four local names occur in the README. The import list contains Mathlib and three used, existing Tau Ceti modules.

The headlines are: the higher-weight killed-p ramification/different bound (§§1.7–1.8); finite seven-primary and rational seven-adic exhaustive filtrations (§§2.7–2.8); odd-cohomology vanishing and full degree-two Tate action (§3.1); low-degree Hodge vanishing (§3.2); and the geometric K3 bad-prime obstruction (§4.2). The two geometric headline statements available on the pins are present. The other headlines are named by layer in the module docstring with the missing Fontaine–Laffaille, crystalline-realization or geometric rational étale-action carrier. The integral-model specialization follows from the retained theorem and model base change; it does not require another acceptance theorem. The auxiliary period-solution results retain their intended local generality in the README, subject to R01–R02.

### Elaborated declaration and instance table

All four declarations are in `TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCasesPartII`; there is no standing section-variable block. The explicit universe is `Scheme.{0}`.

| Declaration; section; binders and instances | Instances and computed sides | Result; change |
| --- | --- | --- |
| `hasWittGoodReductionAt`, line 37, §0.1: X, f:X→Spec ℚ, p, `[Fact p.Prime]`; no smooth/proper hypothesis on f | X=ℙ⁰ or ∅: the two generic fibres are respectively Spec K or ∅, and e.hom≫pr₂=pr₂. p=0,1: primality is false; p=2 gives a nonzero characteristic-zero W and K. E:y²=x³−x gives v₃(Δ)=0, v₂(Δ)=6. | Predicate true for projective space and ∅, true at 3 and false at 2 for E; prime binder excludes zero-ring ZMod 1. No change. |
| `hasEverywhereWittGoodReduction`, line 50, §0.1: X,f; quantified p and hp install their own Fact | ℙ¹: model exists for every prime, including 2. E: the p=3 instance is true and the p=2 instance false, so the universal predicate is false. ∅ has the empty model at every p. | No common-model or compatible-choice condition is hidden. No change. |
| `lowDegreeHodgeVanishing`, line 60, §3.2: X,f, `[Smooth f]`, `[IsProper f]`, hX, natural i,j, i≠j, i+j≤3; `X.Over` locally set to f | On ℙ² the eight admissible pairs all give dimension 0, hence a singleton additive group. On ℙ¹ at (1,1), dimension=1 but i≠j is false. On ∅ all groups have dimension 0. At (0,0), 0≠0 is false. | The correct relative sheaf and structure morphism survive elaboration; no projectivity or connectedness binder. No change. |
| `geometricK3_hasBadWittPrime`, line 74, §4.2: X,f, smooth/proper; geometric pullback and its Over instance; five explicit K3 conditions; existential p,hp, Fact installed for the negated predicate | Geometric K3 gives h²⁰=1; everywhere Witt models would give h²⁰=0 since 2+0≤3. ∅ has h²⁰=0 and fails integrality. Abelian surface has h¹(O)=2≠0; ℙ² has Ω²=O(−3), not O. | The five conditions match the supplier, exclude the wrong surfaces, and force a bad prime. No change. |

### README target and Check table

The README presents its targets as numbered subsections rather than bold theorem labels. All 24 are included. For local rows, the standing domain is prime p, perfect characteristic-p k, K=Frac W(k), v₀(p)=1 and integer 0<r<p−1. Zero rings, equal-characteristic K and ramified base K fail that domain; they are not silently admitted. All algebraic E/K are separable because K has characteristic zero.

| Target (README line); instances tried | Computed values on the two sides, including boundary controls | Result; change |
| --- | --- | --- |
| §0.1 (119), Witt models; ℙⁿ, E:y²=x³−x, ramified potential reduction | ℙⁿ gives the same ℙⁿ_K on both sides, for n=0,1,2. Δ=64 gives v₃=0 and v₂=6; j=1728 gives v₂=6. The local property is true at 3 and false at 2; potential good reduction at 2 is true. | The three Checks distinguish local/everywhere and unramified/ramified reduction. No change. |
| §0.2 (145), realization and Hodge–Tate map; point, ℙ¹, two points, ∅ | Point: dimensions (H⁰,H¹)=(1,0). Two points: (2,0). ∅: (0,0). ℙ¹: H² Frobenius at q=2 is 2, dual is 1/2; C₇(i)⊗H² has invariant dimension 1 for i=1 and 0 otherwise, matching H^(2−i)(Ωⁱ). | Weight signs, cofinite purity primes and lack of connectedness assumption agree. Conditional on the two geometric/completion gaps. |
| §1.1 (174), A(E), filtration and divided Frobenius; E=ℚ₃, ℚ₃(π), K̄ | For π²=−3, b=(π²), A=𝔽₃[π]/π², Fil¹=𝔽₃π; [π]≠0 and [π²]=0. φ₁(π)=π³/(−3)=π, whereas division by +3 gives −π≠π. Over ℚ₃, A=𝔽₃, Fil¹=0. Values 1/n, n≥3, survive and a finite nonzero k-linear combination has its distinct minimum value≤1/2. | All four Checks hold; the algebraic-closure object has infinite k-dimension. No finite-length hypothesis belongs on A(E). |
| §1.2 (202), J, exact solutions and matrix convention; zero, unit, weight one, 2×2 example, nongenerating object | d=0 gives 1 tuple=1 Hom. x³=x has roots 0,±1; x³=−3x has 1 root over ℚ₃ and 3 over ℚ₃(π). For rows (1,1),(0,1), (1,θ) gives 1=1 and θ³=−3(1+θ), v₀(θ)=1/3; transposition requires 1=1+θ. 2³=8≠2, so ordinary addition fails. Zero-Frobenius M gives 3 Hom classes versus 1 exact root. | The six stated Checks hold. Generation excludes the last object. Additional permitted-lift ambiguity fails at x=1+π: R01. |
| §1.3 (232), lifting bijection; zero, weight one, cutoff, changed coefficients | Cardinalities are 1=1 for d=0 and weight one over ℚ₃, and 3=3 over ℚ₃(π). e=2 gives n>1, so n=2 is admitted and n=1 excluded. v₀(π−(−π))=1/2, so a weak cutoff would merge two roots. R01’s residue lift gives φ₀([1+π])=1 while the required image is 1+[π]. | Three existing Checks hold, but the bijection needs the explicit coefficient congruence in R01. |
| §1.4 (250), period truncation; zero and rank one | For M=0: dimensions 0=0 and cardinalities 1=1. Weight zero: dimensions 1=1, cardinalities p=p. At p=3 weight one: cardinalities 3=3, φ₁(π)=π on the truncated side; a zero comparison has image cardinality 1. | Correct sign and variance, conditional on the period-presentation contract and R01. |
| §1.5 (268), splitting-field iff; zero, E=K, E=L, extension of L | Zero: L=K and #J(E)=1=p⁰. Weight one at 3: L=ℚ₃(π); over K, #J=1<3 and L⊄K; over L, #J=3 and L⊆L. Over any extension containing L, the same polynomial has exactly 3 roots, not 3[E:L]. | Both directions tested. W(k)-coefficient lifts make exact solutions Galois-equivariant. No new finding. |
| §1.6 (286), approximate embeddings; L=K, tame quadratic, threshold, infinite residue | L=K has identity map and embedding. At p=3,r=1, c=3/2; 2>c but c>c is false. v₀=2 lies in a² while v₀=1/2 survives b. For x=0,…,8, x²+3 modulo 9 is 3,4,7,3,1,1,3,7,4, so no map from O(ℚ₃(π)) to ℤ₃/9 exists. Infinite residue k=𝔽₃(t)^perf has separable quadratic α²=t, derivative 2α≠0. | Numerical Checks hold. Its general henselian lifting is not supplied by the cited finite-residue Layer 2: R02. |
| §1.7 (304), shifted ramification and different; tame, unramified, p=2,3,7 | p=7,r=3: shifted bound 3/2 and Serre bound 1/2. For ℚ₃(ζ₃): u=1, displacement=1/2, different=1/2<3/2. Unramified: different=0<3/2. p=2 admits no positive r<1; p=3 admits exactly r=1. | Strict different bound is supported by Fontaine93 §3.8; the unrefined estimate alone only gives u≤2 when c=3/2,e=2. Declared refinement gap is needed. |
| §1.8 (322), crystalline killed-p subquotients; zero, μ₃, μ₉ | Zero: L=K, different 0. Mod 3 cyclotomic: e=2, different=1/2<3/2. Mod 9 cyclotomic: e=6, integer different exponent 9, normalized different=9/6=3/2. | Killed-p restriction is necessary for the strict bound; μ₉ is excluded. No change. |
| §2.1 (351), global category; exponent 49, four characters, weight four | Trivial ℤ/49 has cardinality 49 and 7·1=7≠0. At χ(t)=3, weights 0,1,2,3 give 1,3,2,6; weight 4 gives 4 and is not in the permitted weight list. Zero has 1 element. | Allows finite 7-power length, not only vector spaces. Essential-image condition, rather than ambient extension closure, is retained. |
| §2.2 (377), character step; cyclic lines, semidirect group, ring coefficients, S₃ | Pure χʲ-line gives dimension 1 iff i≤j. For t=diag(6,1), w=I+E₁₂, twt⁻¹=w⁶; common fixed space=0; orders (3,2,1,0) and (0,1,2,3) give dimensions (1,1,1,2) and (0,0,0,1). Over ℤ/25, 6−16=−10 has 5-element kernel. On ℚ³ with S₃, fixed space=ℚ(1,1,1), dim 1; N=top gives dim 3; (12)e₁=e₂∉ℚe₁. | All four Checks hold. Group stability and field hypothesis are essential where stated. |
| §2.3 (405), trivial endpoints; exponent 49, zero, ramified ambient extension | ℤ/49 has exponent 49 but ℤ/7⊕ℤ/7 has exponent 7; both trivial actions satisfy the conclusion. Zero kernel field: degree=1, rd=1. For χ(g)=8 mod 49, (8⁶−1)/7=37449≡6 mod 7; I+6E₁₂ has order 7. | Action triviality does not mean group splitting. The nontrivial inertia matrix excludes that middle object from the category. |
| §2.4 (423), simple objects and Sylow count; degree boundaries and weights | 42·6=252≤287<294=42·7. A divisor of n″≤6 congruent to 1 mod 7 is 1. Degree≥11 has rd≥7 by the supplied exact bound; degrees containing ℚ(ζ₇) are 6,12,…, so only 6 survives rd<7. Scalars are 1,3,2,6 versus excluded 4. | The weaker supplied degree bound still suffices; normal p-group invariants and faithfulness give the claimed contradiction. |
| §2.5 (441), oriented extensions; a=1,2,3 and unramified relative case | b≡a mod 6 and 0<b≤a give b=a. Exponents 7·5+6(a+1)=47,53,59; root discriminants ≈8.82480,11.65288,15.38727. First two are <12, last >12. Unramified relative exponent=35 and rd≈5.06114<5.72. Tame scalar powers 3¹=3,3²=2; inverses give 5,4. | Five Checks agree with exception quotient 0/subobject 3. The statement asserts no existence of an exceptional global object. |
| §2.6 (461), no-trivial-quotient decomposition; ℤ/49(1), two characters, conditional exception | ℤ/49(1): #g₁=49, #g₀=1. 𝔽₇(1)⊕𝔽₇(2): #g₁=#g₂=7, product 49=#U. A nonsplit sub χ³/quotient 1 has a 1-dimensional trivial quotient and invariant dimension 0; a direct sum would have invariant dimension 1. | First two are actual arithmetic objects. Third is a conditional/representation-theoretic control only, not an existence proof in C₇[0,3]. |
| §2.7 (479), finite exhaustiveness; zero, pure exponent 49, conditional nonsplit | Zero: all terms have cardinality 1. On ℤ/49(i), Uₖ has 49 elements iff k≤i, otherwise 1. Distinct tame weights differ by units. Sub χ³/quotient 1 has dimensions (U₄,…,U₀)=(0,1,1,1,2). | Filtration exhausts without forcing semisimplicity. Last pattern is conditional on such an object, as above. |
| §2.8 (497), rational exhaustiveness; zero, χ⊕χ², compatible reductions | Zero: five dimensions 0. χ⊕χ²: dimensions (0,0,1,2,2). The residues 1 mod 7ⁿ reduce to 1 at every earlier level; 2 mod 49 reduces to 2≠1 mod 7. | Correct direction and need for compatible witnesses. Compact inverse-limit existence is pinned, as identified below. |
| §3.1 (526), zero/Tate cohomology; ℙ¹, odd m, Jordan block | At q=2, H² and dual eigenvalues are 2 and 1/2. Candidate dual-grade absolute values are 1,1/2,1/4,1/8; none equals 2^(−1/2)≈0.707107 or 2^(−3/2)≈0.353553. Matrix ((2,1),(0,2)) has characteristic polynomial (T−2)² but differs from 2I by rank 1. | Purity alone is insufficient; the exhaustive one-grade argument yields the full scalar action. |
| §3.2 (544), Hodge vanishing; ℙ², ℙ¹, ∅, degree boundaries | The admissible pairs (1,0),(0,1),(2,0),(0,2),(3,0),(2,1),(1,2),(0,3) all give 0 on ℙ². ℙ¹ gives h¹¹=1, so deleting i≠j would assert 1=0. ∅ gives dimension 0 throughout. ℙ² has h²²=1 at degree 4; at degree 0 only (0,0) occurs. | All three Checks hold. The diagonal degree-four value is not a counterexample to an off-diagonal degree-four extension, and the README expressly avoids that inference. |
| §3.3 (562), integral models; ℙ¹_ℤ, Spec ℤ, E | ℙ¹ has h¹⁰=h⁰¹=h²⁰=h⁰²=0 but h¹¹=1. Spec ℤ has generic h⁰⁰=1 and all positive groups 0. E has good model at 3, v₃(Δ)=0, but v₂(Δ)=6. | Universal local hypothesis is retained; no reverse globalization is asserted. |
| §4.1 (589), K3 invariant; canonical triviality, rescaling, abelian surface | Ω²≅O gives h²⁰=1 over ℚ̄ and, by base change, over ℚ. Scaling a nonzero form by 2 preserves rank 1; scaling by 0 has rank 0. Abelian surface: (h²⁰,h¹(O))=(1,2); K3: (1,0). | Uses the supplied K3 calculation, not another K3 predicate or choice of volume form. |
| §4.2 (605), bad Witt prime; K3, ∅, quartic | At (2,0), 2≠0 and 2≤3, so everywhere models give 0 against K3’s 1. ∅ gives 0 and fails integrality. A smooth quartic has h²⁰=1, so the same contradiction applies. | Negating all-prime models gives an unspecified prime; 2 remains allowed. |
| §4.3 (621), projective-space endpoint; n=0,1,2 and i>n | ℙ⁰: only h⁰⁰=1. ℙ¹: h¹¹=1,h²⁰=0. ℙ²: h²²=1,h¹²=h²¹=0. For i>n, Ωⁱ=0 gives all Hʲ=0. On ℙ¹, H⁰(Ω¹)=0 while H¹(Ω¹)=ℚ, so global sections cannot replace the sheaf. | Formula is explicitly owned by CrystallineCohomology CR.3.5. No duplicate target or acceptance padding. |

### Remaining API and convention computations

These rows cover every API bullet, in their printed order. The local test field in the middle rows is E=ℚ₃(π), π²=−3, r=1. The unit filtered object has weight zero and φ₀(e)=e.

| API statement | Instances and computed values | Result; change |
| --- | --- | --- |
| §0.1 API 1: existential characterization | ℙ⁰: both predicates have witness Spec W and identity Spec K→Spec K. E at 2: both sides false by nontrivial 3-adic inertia. | Equivalent predicates; no change. |
| §0.1 API 2: ℤₚ base change | ℙ¹_ℤₚ⊗W=ℙ¹_W; both generic fibres are ℙ¹_K. | Witness transport; no change. |
| §0.1 API 3: isomorphism transport | On ℙ¹ the automorphism [x:y]↦[2x:y] and its inverse compose to [x:y]; transported generic-fibre projections both equal pr₂. | Isomorphism is over the base; no change. |
| §0.1 API 4: ℤ model implies all primes | Spec ℤ gives Spec W at p=2 and p=3, with Spec K generic fibre in each case. | No prime omitted; no change. |
| §0.1 API 5: universal elimination | ℙ¹’s all-prime predicate produces its p=2 witness; E’s true p=3 witness does not produce an all-prime witness because p=2 is false. | Only the asserted direction holds; no change. |
| §1.1 API 1: quotient kernel | π² maps to 0; π maps to a nonzero class. Kernel consists of v₀>1/2. | Correct strict ideal. |
| §1.1 API 2: equality iff strict difference | [π]=[−π] is false and v₀(2π)=1/2>1/2 is false; [π²]=[0] is true and 1>1/2 is true. | Both iff directions tested. |
| §1.1 API 3: filtration | Fil⁰=A has k-dimension 2, Fil¹=kπ has dimension 1, Fil²=0 has dimension 0. Over ℚ₃, dimensions are 1,0,0. | Correct threshold and truncation. |
| §1.1 API 4: divided Frobenius | φ₁(π)=π; φ₁(2π)=2π=φ₁(π)+φ₁(π). With k=𝔽₉ and a³=−a, φ₁(aπ)=−aπ=a³φ₁(π). | Sign, addition and nontrivial σ-semilinearity tested. |
| §1.1 API 5: embeddings | Conjugation π↦−π sends φ₁(π) to −π, equal to φ₁(−π); applying conjugation twice sends π to π. | Identity/composition and Frobenius compatibility. |
| §1.1 API 6: factor through p | 3=−π² maps to 0; 1 maps to 1≠0. | O(E)/3→A is a unital quotient, not the zero map. |
| §1.2 API 1: filtered morphisms | Unit e↦1 satisfies φ₀(1)=1; e↦π fails, since φ₀(π)=0≠π. | Distinguishes the desired Hom from arbitrary linear maps. |
| §1.2 API 2: basis extensionality | Rank one maps e↦0 and e↦1 differ on e and are unequal; rank zero has one map. | Empty and nonempty basis cases. |
| §1.2 API 3: embeddings on J | Weight-one J(E)={0,π,−π}; conjugation exchanges the latter two and fixes zero, and its square fixes all 3. | Linear, identity and composition laws hold. |
| §1.2 API 4: contravariance | Precomposing weight-one maps with e↦−e sends π to −π; doing it twice returns π. The map 0→M induces J(M)→J(0), of cardinalities 3→1. | Correct map direction. |
| §1.2 API 5: equations | With matrix rows (1,1),(0,1), (1,θ) has residual equations 0,0; the transposed first equation has residual −θ≠0. | Definition fixes columns; R01 specifies coefficient lifts. |
| §1.2 API 6: period identification | Unit gives cardinalities p=p; zero gives 1=1; contravariance sends 3→1 for 0→M at p=3. | Conditional on the declared period gap. |
| §2.1 API 1: category membership | Trivial ℤ/49 has 49 elements and satisfies both conditions; χ⁴ has scalar 4 at χ=3 and fails the [0,3] condition. | Not merely unramified-outside-7 membership. |
| §2.1 API 2: equivariant Hom | Endomorphisms of trivial ℤ/49 are the 49 multiplications; 0 and 1 differ at 1. Between distinct mod-seven χ and χ² lines, equivariance gives 3a=2a, hence a=0. | Ambient equivariant maps exactly. |
| §2.1 API 3: subquotients | In trivial ℤ/49, subgroup 7ℤ/49 and quotient both have 7 elements and trivial action. | Both inherit membership. |
| §2.1 API 4: sums and zero | Two trivial ℤ/7 objects sum to cardinality 49; empty sum is the one-element group. | Includes zero. |
| §2.1 API 5: lattice reductions | T=ℤ₇(1): T/7T has 7 elements; T/49T has 49 and the generator has order 49. | Full p-power, not only mod-p, functor is needed. |
| §2.2 API 1: membership | S₃ permutation action with χ=1,N=0 fixes (1,1,1); e₁ fails at (12), since e₂−e₁≠0. | Quantification over all g is material. |
| §2.2 API 2: monotonicity and naturality | For the same action, N=0⊆top gives dimensions 1≤3. The equivariant coordinate-sum map sends (a,a,a) to 3a in the trivial target and sends 0 to 0. | Computed image lies in the target step. |
| §2.2 API 3: stable containment | N=ℚ(1,1,1) is stable. In the characteristic-zero permutation module, step₀(N)=N, so N⊆step₀(N) is equality, dimension 1. N=ℚe₁ fails since (12)e₁=e₂. | Stability requirement is not vacuous. |
| §2.2 API 4: quotient eigenspace | χ⊕χ², N=χ²-line: step₁(N)=U has dimension 2, quotient dimension 1, equal to the χ-eigenspace of U/N. At χ=1,N=0 in ℚ³/S₃, both fixed spaces have dimension 1. | Quotient and invariant specializations match. |
| §2.2 API 5: recursive terms | Pure χ²-line gives dimensions (0,0,1,1,1) from U₄ to U₀; zero gives (0,0,0,0,0). | Correct indexing without out-of-range junk. |
| §2.2 API 6: isomorphism invariance | Exchanging the two basis vectors of χ⊕χ² exchanges their coordinate lines; dimensions stay (0,0,1,2,2), and applying the exchange twice is identity. | No chosen-basis dependence. |
| Scheme convention (19) | Spec ℚ[ε]/ε² has nonzero nilpotent ε and is not smooth; 𝔸¹ is smooth but not proper; ∅ is smooth proper and has zero cohomology. | No missing smoothness, finite type or nonemptiness hypothesis. |
| Valuation conventions (21–25) | p=3,r=1: strict cutoff=1/2, φ₁(π)=π, approximate ideal at m=2 kills value 2; different=1−1/2. p=2 gives empty positive range. | Denominator p−1 is nonzero; the two cutoffs are distinct. |
| Tate/Frobenius convention (27,97) | At q=2, χ⁰⊕χ¹ has eigenvalues 1,1/2 and weights 0,−2. H²(ℙ¹) has eigenvalue 2, HT weight −1; dual has 1/2,+1. | Not pure at a common weight; inverse-Frobenius normalization is consistent. |
| Extension orientation (27,91) | χ(t)=3 gives χ³(t)=6; t(I+E₁₂)t⁻¹=I+6E₁₂. Tame powers at b=1,2 are 3,2, not 5,4. | Subobject χ³ and quotient 1 agree across the layers. |
| General character steps outside the arithmetic domain | Trivial group: all stepᵢ(N)=U, hence U₃=U and all lower terms U; zero ring: every unital module is zero; Q₈ acting on itself by permutation with χ=1 has a 1-dimensional fixed line of constant vectors. | These are valid for the algebraic definition; no compactness or finiteness is imposed there. |

### Supplier resolution, ownership and declared gaps

The source of each supplier was checked at main or its indexed current new-roadmap head, not a revision of an existing roadmap. Current head identifiers used for the six additional direct suppliers are: ArithmeticGaloisRepresentations `3e99d0d`, CrystallineCohomology `013a921`, FiniteFlatGroupsAndIntegralPadicHodgeTheory `1a17d7d`, DeligneWeightsAndPurity `6c2402d`, SmallRamificationAndAbelianVarietyBaseCases `d6e456e`, and PadicHodgeTheory `dfb3426`. K3 and Enriques were read in the explicitly supplied checkouts.

| Citation group | Verified location and mathematical contract | Outcome |
| --- | --- | --- |
| SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:848` (§0.9, finite-presentation spreading including proper and smooth); :938 (§0.11, field base change/descent); :3437 (§2.6, qcqs flat cohomology base change and finiteness); :4275 (§2.20, dualizing/differential comparison); :4737 (proper geometrically integral global functions); :5383, :5448, :5487 (completion/formal functions/morphisms on given schemes). | These sections supply what is consumed. The needed general henselian section for §1.6 is instead §§0.12,0.14: R02. |
| EtaleCohomologyFoundations | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:504`, :522 (F.2.1–F.2.2); :776 (henselian traits); :850 (F.4.0 stable lattices); :959 (F.4.1–F.4.6 realizations and continuous actions). | Coefficients away from residue characteristic, finite-type geometric inputs and compact stable-lattice domain agree. |
| PadicHodgeTheory | `TauCetiRoadmap/PadicHodgeTheory/README.md:120`, :198, :665, :682, :732, :1077, :1384. | §§0.1,0.4,3.2–3.5,5.5,8.1 exist; completed-unramified detection is explicitly at §3.5. Geometric §8.1 retains finite K, so the declared Witt-domain extension is not presumed implemented. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:4757` (ambient versus generating torsion); :4805 (strictness); :4875 (contravariant U_S); :4933 (tame weights); :4960, :4983, :5026 (exactness, full faithfulness, subquotients); :5054 (lattices, through §R07.3.17); :8208, :8264, :8309, :8397 (ramification contracts). | Named sections and signs match. Its generic perfect-residue Herbrand contract is accepted as stated; the eight explicit package gaps are not reported merely for lacking implementations. |
| ArithmeticGaloisRepresentations | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:686`, :784, :894, :1007, :1121, :1588. | Operations, restrictions, lattices, reductions and ramification are present. The extra arbitrary finite p-primary dictionary remains an explicit contract. |
| SmallRamificationAndAbelianVarietyBaseCases | `TauCetiRoadmap/SmallRamificationAndAbelianVarietyBaseCases/README.md:282`, :429, :521, :623 and :644. | Exact 7.00 lower bound at n=11 really is in the accompanying prose, despite row (b)’s displayed threshold 6.93. The 19.02/287 and 5.72/8 rows match. The degree-36/12 inequality is supplied in §1.7. No duplicate numerical certificate is needed. |
| LocalFieldsRamification | `TauCetiRoadmap/LocalFieldsRamification/README.md:562` (unramified local fields); :825 and :833 (tame conjugation). | Tame sign agrees; direct arbitrary-residue lifting citation is narrower than the consumer: R02. |
| DeligneWeightsAndPurity | `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:916`, :928, :2678. | §§0.8–0.9 do not assume semisimplicity. §7.15 explicitly allows proper smooth, not only projective, finite-field schemes. |
| K3SurfacesAndSymplecticBoundedness | `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:267`, :296, :310, :328, :451; `Suggested.lean:87`. | Five conditions, arbitrary field extension, projectivity and h²⁰=1 match. The package expands these conditions without introducing a second shared predicate. |
| CrystallineCohomology | `TauCetiRoadmap/CrystallineCohomology/README.md:3344`, within CR.3.5. | Full Ω-cohomology of ℙⁿ over any ring is an explicit target; this is not merely twisting-sheaf cohomology. |
| EllipticCurves | `TauCetiRoadmap/EllipticCurves/README.md:821`, :830, :851. | Integral-j potential reduction, minimal discriminant and NOS for ℓ≠residue characteristic support the elliptic control at 2 with ℓ=3. |
| EnriquesSurfacesAndIntegralNonexistence (consumer) | `TauCetiRoadmap/EnriquesSurfacesAndIntegralNonexistence/README.md:99`, :1099, :1119. | Its geometric requirement matches this endpoint, but its gap still routes to PadicHodgeTheory Part II. This consumer routing is noted in the prior repair report as outside the package; it creates no input edge here and is not re-raised. |

Object searches used `roadmaps grep`, main/Completed, the available board packages, and the supplied sibling checkouts. They distinguish generic filtered modules and periods, owned by the finite-flat/period suppliers; the shared K3 predicate, owned by the K3 supplier; and the new higher-weight truncation, global seven-adic argument and arithmetic Hodge endpoint, owned here. No independently duplicated fully qualified acceptance name was found. Unlisted individual open checkouts were not separately audited; the indexed ownership search is broader than the supplied sibling list and was used only as a lead.

| Gap slug | Agreement and concrete domain/minimality check | Outcome |
| --- | --- | --- |
| witt-proper-smooth-comparison | Same slug, supplier, section and needs in README and plan. ℙ¹/W(𝔽̄₇) has crystalline and étale H² of dimension 1; crystalline Frobenius is 7. Frac W(𝔽̄₇) is not finite over ℚ₇, so finite-K §8.1 alone is insufficient. Earlier geometric period comparisons supply ingredients, not the complete stated arithmetic compatibility contract. | Accepted conditional contract. |
| fl-acris-truncation | Same fields. Weight-zero Hom dimension 1 and weight-one φ₁(π)=π fix the required realization/sign; its period presentation and projection must refer to the same torsion functor. Existing rational S_K inclusion alone does not identify the killed-p Hom functors. | Accepted conditional contract, not a second local theorem. |
| fl-weight-zero-unramified | Same fields. Trivial (ℤ/49)² has 2401 elements and identity inertia; I+6E₁₂ has nonidentity inertia. Rank-one or killed-p results alone do not cover the stated arbitrary length. | Accepted conditional contract. |
| fl-rank-one-inertia | Same fields. ℤ/49(1) has generator order 49; an unramified λ with Frobenius −1 has λ(inertia)=1, so χⁱλ and χⁱ have equal inertial values but different full characters. | Precise inertia-only requirement; accepted. |
| fl-oriented-mod-p-splitting | Same fields. p=3,j=0,i=1,r=1 fits 0<1<2; reversed weights fail j<i; p=2 allows no distinct pair. Split endpoints give matrices diag(1,χ). | Full middle-image and killed-p hypotheses are retained; accepted. |
| pm-remove-inverse-e | Same fields. c=3/2,e=2: unrefined all-m inequalities imply only u≤2, while the requested conclusion is u≤3/2. The tame quadratic test has u=1. | Not redundant with R07.6.3’s displayed estimate; accepted. |
| finite-torsion-kernel-dictionary | Same fields. Zero action gives kernel field K and cardinality 1; weight-one mod-three gives kernel degree 2, cardinalities 1 over K and 3 over L. | Its interrelated module/field/cardinality comparisons are not supplied just by continuous finite free representations. Accepted. |
| completed-unramified-inertia | Same fields. Finite unramified extensions disappear after Frac W(𝔽̄ₚ) base change; the tame quadratic at p=3 remains degree 2. The completed field is larger than the algebraic union. | Requested completion comparison is not the finite-residue correspondence; accepted. |

All eight slugs and needs match mechanically. No supplier is `none`. No definite redundant gap or independently compound obligation requiring a split was found beyond the explicit contract components above.

### Pinned library audit

Pins read from the manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches by object as well as declaration name found no pinned Fontaine–Laffaille/crystalline-realization carrier or geometric rational étale-cohomology action that would make the omitted headlines directly statable.

| Pinned object | Exact location and scope checked |
| --- | --- |
| `Representation`, invariants | `Mathlib/RepresentationTheory/Basic.lean:48` is G→*End_R(V), with no continuity field. `Mathlib/RepresentationTheory/Invariants.lean:73` and :80 define fixed vectors and their membership iff. |
| Inverse images and finrank | `Mathlib/Algebra/Module/Submodule/Map.lean:171`, `Submodule.comap`; `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61`, `Module.finrank`, which alone does not imply finite dimension. |
| Root discriminant | `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean:77`, :83, `NumberField.rootDiscr` and `rootDiscr_rat`; ℚ has value 1. |
| Witt DVR/completeness | `Mathlib/RingTheory/WittVector/DiscreteValuationRing.lean:148`, `WittVector.isDiscreteValuationRing`, assumes a perfect characteristic-p field; `Complete.lean:116`, `isAdicCompleteIdealSpanP`; `Identities.lean:88`, `p_nonzero`; fraction field in `Mathlib/RingTheory/Localization/FractionRing.lean`. The prime instance is explicit. |
| Native geometric carriers | `Mathlib/AlgebraicGeometry/Scheme.lean`, `Spec.lean`, `Over.lean`, and `Mathlib/CategoryTheory/Limits/Shapes/Pullback/HasPullback.lean` supply the schemes, affine base maps, over-structure and pullback projections used in the signatures. `Morphisms/Proper.lean:41` adds separation, universal closedness and locally finite type; `Morphisms/UniversallyClosed.lean:163` gives quasi-compactness. `Morphisms/Smooth.lean:127` and `Geometrically/Integral.lean:40` supply the geometric K3 conditions. |
| Relative differentials | `TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean:85`: `AlgebraicGeometry.Scheme.relativeDifferentials`, sheafification relative to the specified affine base/Over structure. |
| Exterior powers | `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower.lean:49`: `SheafOfModules.exteriorPower`, sheafifies sectionwise exterior powers. It is not exterior power of global sections. |
| Cohomology and scalars | `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:61`: `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`, small Zariski sheaf cohomology; `Cohomology/Module/Base.lean:45`: `AlgebraicGeometry.Scheme.Modules.cohomologyBaseModule`, its base-ring action. Neither declaration supplies a geometric dimension theorem. |
| p-group invariants | `TauCeti/RepresentationTheory/Unipotent/PowerOrder.lean:158`: `Representation.invariants_ne_bot_of_isPGroup`, on nonzero finite-dimensional representations over a field of exponential characteristic p. Normality is additionally used in §2.4 to make the invariant subspace stable under the whole group. |
| Tate sign | `TauCeti/Geometry/Hodge/Tate/Basic.lean:111`: `TauCeti.Hodge.tate_piece`; m=−1 has its sole nonzero piece at 1, as required for H²(ℙ¹). |
| Compact inverse limit | `Mathlib/Topology/Category/TopCat/Limits/Konig.lean:126`: `TopCat.nonempty_limitCone_of_compact_t2_cofiltered_system`; applies to the nonempty finite discrete witness sets in §2.8. It does not justify independently chosen incompatible witnesses. |

The citation resolver reports no cross-roadmap or local Lean name found nowhere. Its disclaimer that it did not check library pins was not treated as a library audit; the declarations above were read separately.

### Dependency and policy check

The prescribed dependency command completed with exit 0 and this exact output:

```text
depcheck: 56 roadmaps, 649 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The local target order has no backward proof edge: the geometric and local preparations feed Layer 2, then the purity/Hodge endpoint and the K3 consequence. R02 concerns the mathematical domain of a supplied input, which the graph checker cannot detect.

`git diff --stat origin/main...HEAD` and the path list show seven changed files, all inside `packages/SmallRamificationAndAbelianVarietyBaseCasesPartII/`. The only additional workspace file created by this pass is this report; scratch notes are separate. No source text was copied into the package. No Git-writing command, Lean command, build or post was performed; package inputs were unchanged. There are no process references or pull-request numbers in the target README or Lean docstrings, no `lemma` declaration, `set_option`, algorithm implementation, or admitted data definition.

## Not verifiable

- The eight declared supplier contracts are accepted as contracts, not certified implementations. Their matching declarations, domains and necessity were checked; this review does not prove those missing supplier results.
- No new Lean elaboration was run. The four provided elaborated signatures were inspected and compared; that establishes the binder review but not theorem truth.
- The nonsplit exceptional arithmetic extension is not constructed in this package. The semidirect-product Check is an actual algebraic representation, while the analogous C₇[0,3] Checks are conditional. They were not counted as evidence that the exceptional global object exists.
- The separate proof of the generic refined Pₘ theorem cited inside Fontaine93 was not audited in its 1985 source; it is an explicitly declared supplier gap. The 1993 statement, use and strict-different deduction were verified against the legal scan. Likewise, supplier bibliographies were not recursively re-reviewed as external sources.
- No missing direct source remains: all three manifest works were available in the legal cache. The cached Fontaine OCR omits some formulas; printed pages 3,4,9,10,11,12 were visually inspected to resolve those formulas and the misprints below. The numbering reviewed is the manifest’s author preprint, not the proceedings pagination. Schröer’s cited page 16 was visually checked as well.

## Source issues

- **Misprint** in Fontaine93 at Plan before §1, printed page 4 (Fontaine93 line 125): the source says §3 proves Theorem 1; it should be §3 proves Theorem 2; affects nothing.
- **Misprint** in Fontaine93 at §3.6, printed page 10 (Fontaine93 line 361): the source says it resumes the notation of Theorem 1; it should be Theorem 2, which defines M, U and L; affects nothing.
- **Misprint** in Fontaine93 at §3.7, proof of Lemma 4, printed page 11 (Fontaine93 lines 379–386): the source says e and the uniformizer a belong to E; it should be e and a belong to L, the source of the approximate homomorphism; affects the proof.
- **Misprint** in Fontaine93 at §3.8, Remark, printed page 12 (Fontaine93 line 410): the source says the largest lower displacement is at most e⁻¹ in the wild case; it should be at least e⁻¹, as needed to bound u−i by u−e⁻¹; affects the proof.
- **Error** in Schroeer23 at Proposition 5.5 proof, printed page 16 (Schroeer23 line 686): the source says W(𝔽₂^sep) is the maximal unramified extension of ℤ₂; it should be the completion of that maximal unramified extension; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a92beafda684fd68962e782799b4fb2d14f612a8", "job": "RT-SmallRamificationAndAbelianVarietyBaseCasesPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
