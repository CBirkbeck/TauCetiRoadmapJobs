<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/160#issuecomment-6359753164 -->
Red team round 2 pass a (codex) of 396062e

Verdict: needs_changes

1. **F01** (P2) The arithmetic supplier gap reassigns existing S-integer comparisons

   **Location:** packages/K2SymbolsBrauerPartII/README.md:78: “the number-field S-integer finite/adic isomorphisms”; packages/K2SymbolsBrauerPartII/design/plan.json:13; packages/K2SymbolsBrauerPartII/README.md:669: “ArithmeticKTheory uses the global and S-integer squares”.

   **Claim:** KTheoryFiniteLocalFields must newly supply the number-field ring comparisons, while ArithmeticKTheory is a downstream consumer.

   **Witness:** TauCetiRoadmap/ArithmeticKTheory/README.md:1838–1852 already gives the natural adic and mod-ℓ comparison at i=1; :1931–1950 includes real dyadic degree 2. Its §5.2 supplies coefficient, restriction/corestriction and localization compatibility. ArithmeticKTheory precedes this roadmap.

   **Exact repair text:** “Consume ArithmeticKTheory §§5.2, 6.1 and 6.3 for the number-field S-integer comparisons, including coefficient limits, localization and the real dyadic degree-two row. The remaining arithmetic gap asks for equality of these supplied maps with Tate's adic and finite symbols and commutativity of their finite-reduction square, for every number field F, prime ℓ, r≥1 and finite S containing the archimedean places and places over ℓ, including real places at ℓ=2; it does not reconstruct the ring isomorphisms. ArithmeticKTheory is an earlier supplier.” Remove the already owned ring-isomorphism construction from both the README gap and the matching plan needs sentence; preserve the distinct global-field Picard and adic Tate contracts. Replace the downstream assertion accordingly.

   **Repair test:** At O=ℤ[1/2], ℓ=2, ArithmeticKTheory §6.3's n=2 row already identifies K₂(O){2}=C₂ with H²(O,ℤ₂(2))=C₂. At totally imaginary F or odd ℓ, §6.1 at i=1 provides the same comparison. The proposed repair retains all these cases and assigns only the equality with Tate's map to the new dictionary.

2. **F02** (P3) A global zero-sum Check cannot test map compatibility

   **Location:** packages/K2SymbolsBrauerPartII/README.md:513: “This agreement tests map compatibility, beyond a separate proof that each expression happens to vanish.”

   **Claim:** Comparing the two already vanishing global reciprocity expressions detects the compatibility of the actual maps and their minus sign.

   **Witness:** Replace every local factor λ_v by λ_v⁻¹. Its global product is still 1, while the Brauer sum remains 0; line 513 passes unchanged. A nonzero cubic local factor distinguishes the wrong family immediately.

   **Exact repair text:** Replace this Check with: “Take F=ℚ(μ₃), choose ζ primitive, and choose the place v over 7 at which ζ reduces to 2. For x={3,7}, the product over the single place {v} is ζ⁻¹ and its Brauer-invariant sum is 1/3. The negative-coordinate formula agrees on this partial family; replacing every local factor by its inverse gives ζ instead and fails. The all-place sums alone cannot test that compatibility.”

   **Repair test:** F_v=ℚ₇ and the cubic calculation of §3.5 gives inv_v β(x)=1/3 and λ_v(x)=ζ². Thus the correct partial product is ζ² and the inverted family's value is ζ≠ζ². Both complete global products remain 1.

3. **F03** (P3) Two Checks repeat the general naturality targets

   **Location:** packages/K2SymbolsBrauerPartII/README.md:196: “For F→E→L preserving the transported root, direct restriction agrees with the two successive comparisons.” Also :620: “A field embedding F→E commutes with red_m and ∂_m”.

   **Claim:** These bullets are Checks of the field adapters and the specified Bockstein boundary.

   **Witness:** README:189 already requires the identity and composition laws; :612 already requires ring-map naturality. Neither Check instantiates a field, coefficient, class or computed value. A zero boundary also commutes with every field embedding.

   **Exact repair text:** Delete the Check bullets at lines 196 and 620. Retain the corresponding general identity/composition and naturality requirements at lines 189 and 612. They are targets, not additional test instances.

   **Repair test:** Section 1.5 retains three Checks, including the distinct factors 3 and 4 modulo 5 and the nonzero cubic invariant 1/3 changing to 2/3. Section 5.4 retains three Checks, including the real mod-two Bockstein quotient C₂ and the mod-six coefficient components. Deleting the repetitions removes no target or needed definition.

## Verified sound

Read all **678 README lines**, all **46 Suggested.lean lines**, both earlier reviews, their finding dispositions, the two repository rule files, the plan and source manifest. Coverage below records **3 Lean declarations**, **23 numbered README target subsections** (94 statement/convention rows), **103 Check bullets**, **32 source-locator groups** in four legal cached works, and **40 distinct explicitly cited supplier sections/layers** across eight owners. The two bold mathematical assertions at README:27 are included in the convention and algebra rows. The other bold text consists of labels and a journal volume, not additional targets. The ownership search includes all **22 supplied sibling folders**, the board packages, main and Completed, plus the roadmap service's main/open-head object searches.

### Round-one repair verification

Identifiers below distinguish the two earlier passes. “Repaired” evaluates the defect, not literal adoption of the previous repair suggestion. No settled finding is re-raised. In particular, a-F01's reason for leaving earlier-owner implementation outside this package is valid; S01 concerns a different issue, the nonminimal scope of one newly declared contract.

| Earlier finding | Status | Repaired passage at this head | Verification witness |
| --- | --- | --- | --- |
| a-F01 absent MotivicEtaleKTheory | Repaired within this package, conditional on declared contracts | README:68,78: “What EtaleCohomologyFoundations must provide (gap:field-cup-residue-coherence)” and “What KTheoryFiniteLocalFields must provide (gap:arithmetic-tate-symbol-maps)” | The two slugs, named suppliers and sections also occur in design/plan.json. Existing finite symbols, coefficients and twists resolve at the cited owners. Missing compatibility is explicitly contractual. S01 removes an already owned portion, not the gaps themselves. |
| a-F02 base Matsumoto owner | Repaired | README:62: “using the classical field presentation constructed in K2SymbolsBrauer §0.4” | K2SymbolsBrauer §0.4 constructs the field presentation; §§7.1–7.3 transport it. README:7 now starts at Layer 0. |
| a-F03 undeclared-name catalogue | Repaired | Suggested.lean:11–19 describes absent carriers in mathematical prose | File ends after three real declarations and the namespace; no identifier catalogue remains. |
| a-F04 missing conic/Hilbert theorem | Repaired | Suggested.lean:41: “theorem conicSymbol_eq_hilbertSymbol” | Explicit Field, h2 and unit binders agree with README:407. Pinned HilbertSymbol/Basic.lean:46,56 gives the norm sign. Both exceptional norm/conic transformations are computed below. |
| a-F05 duplicate local map and splitting | Repaired | README:336: “Transport KTheoryFiniteLocalFields §§3.1–3.3's full norm-residue map” | Current supplier §3.1 gives the full map and coefficient powers; §3.3 gives the section. At w=6,m=3, power projection gives ζ², primary projection ζ⁴. |
| a-F06 duplicate finite exactness | Repaired | README:603: “Consume KTheoryFiniteLocalFields §1.1's coeff_exact at n=2” | Supplier §1.1 gives the all-degree sequence, actual reduction/Bockstein, maps and CRT. README:612 expressly owns no new exactness theorem. |
| a-F07 scalar invariant ownership | Repaired | README:436: “Consume ClassicalArithmeticCompletion §1.44's scalar equality and convention comparison.” | Main §1.44 contains the normalized coordinate, universal sign and cubic calibration; §1.14 names normResidueSymbol_eq_localSymbol. Part II extends the supplied scalar equality by symbol generation. |
| a-F08 missing manifest | Repaired | sources.toml:1: “schema = "tauceti-roadmap-sources/v1"” | Exactly four lifetime keys, each with bibliography, locator, cited_for and provenance. The manifest hashes match the cache identifiers in the brief; all four texts contain the cited material. |
| a-F09 missing Lean mirrors for Checks | Repaired by the acceptance-test rule | README:401–403 retains rational, Steinberg and characteristic-two controls | Lean has no admitted examples or rational boundary theorem. The prior instruction to add boundary mirrors conflicts with this round's headline-only rule; the repair correctly keeps these in prose. |
| a-F10 finite global groups | Repaired | README:554: “finite-coefficient source and target groups, which can be infinite for global fields” | README:561 gives the infinite direct sum of C₂ tame quotients of K₂(ℚ)/2; tate line 547 supplies localization. |
| a-F11 native tensor contraction | Repaired by the acceptance-test rule | README:140: “TensorProduct.lift (TauCeti.ClassFieldTheory.kummerCupPairing ζ hζ).bil” | Native Local/Symbol.lean:165 supplies this bilinear map; Mathlib LinearAlgebra/TensorProduct/Basic.lean:126 gives TensorProduct.lift.tmul. The routine lift is correctly absent from Lean; its root-change calculation remains in README. |
| b-F01 title | Repaired | README:1: “K₂ symbols and Brauer groups, part II” | Exact requested mathematical symbol and numeral occur. |
| b-F02 h2MuToBr and character formula | Repaired | README:58 names the pinned map; :88 uses “χ(Art_F(a))=inv(a∪δχ)” | Pinned Brauer/Torsion.lean:58 defines the field-generic map. Main ClassFieldTheory's character formula and milne line 4957 agree. The Kummer transport is routed through ClassicalArithmeticCompletion §1.44. |
| b-F03 missing injectivity premise | Repaired | README:552: “assume the mod-ℓ map h_ℓ of §1.1 is injective” | tate lines 354–360 distinguish the unconditional inclusion from the conditional kernel equality and torsion isomorphism. Global injectivity is tate line 493. |
| b-F04 narrowed Picard sequence | Repaired | README:566: “Let F be a global field”; :584: “This sequence and its localization square hold for every global field” | tate lines 569,575–582 give exactly this scope and nonempty S. F₃[t], S={∞}, gives three zero terms. The ring isomorphisms retain number-field scope. |
| b-F05 Lean layer heading | Repaired | Suggested.lean:24: “Layer 3: local norm-residue and Hilbert symbols” | Matches README:332 exactly. |

### Lean declarations and headline coverage

Compared every supplied elaborated signature with its declaration and README. All three declarations have their necessary binders; there are no section variables or hidden topology hypotheses. No Lean process was run. The supplied signature extraction is evidence of elaboration, not a proof of an admitted theorem.

| Declaration / section | Variables and instances | Instances and computed values on both sides | Result / change |
| --- | --- | --- | --- |
| conicSymbol, Suggested.lean:28 / §3.3 | F : Type u, [Field F], r s : F; ℤˣ output | ℝ,(0,0): equation 0=1 has no solution, output −1. ℝ,(1,−1): (1,0) gives 1, output +1. F₃,(2,2): (1,1) gives 4=1, output +1. | Real body, all characteristics and zero inputs; no change. |
| conicSymbol_real_eq_neg_one_iff, :34 / §3.3 | r s : ℝ, no additional variables | (0,0): −1 and (true,true); (−1,−1): −1 and (true,true); (0,2): +1 via y=1/√2, RHS false; (1,−1): +1, RHS false. | Both iff directions valid, weak inequalities necessary; no change. |
| conicSymbol_eq_hilbertSymbol, :41 / §3.4 | {F : Type u}, [Field F], h2 : (2:F)≠0, r s : Fˣ | ℚ,(2,−1): conic (1,1), norm (1,1), both +1. ℚ,(1,3): conic (1,0), norm (2,1), both +1. ℝ,(−1,−1): neither equation soluble, both −1. F₂(t),(1,t): +1 versus −1, excluded by h2. | Units and h2 present in elaborated type; no change. |

The headline list is: coherent root/coefficient and residue dictionaries; central simplicity and splitting of the specified symbol algebra; its matrix-corner equivalence; algebra/Brauer comparison; local K₂/invariant and conic/Hilbert comparisons; all-place K₂ reciprocity; local/global/adic/S-integer Tate dictionaries; product-normalized and raw finite Chern comparisons. The two conic headlines statable on existing carriers are present. Suggested.lean:11–19 names the absent symbol-algebra, classical/Milnor K₂, K-spectrum/finite-group and coherent twist/comparison carriers for the others. Searches at both pins found generic tensor, crossed-product, Brauer and cohomology infrastructure, but not those specified missing constructions. Building the degree-m algebra or the classical/Milnor comparison would exceed a simple acceptance-file definition.

The one-tactic probe was by reading, as requested. Unfolding conicSymbol leaves existential quadratic equations. HilbertSymbol/Basic.lean:56 removes only the norm-sign wrapper and leaves the conic/norm equivalence, including its two exceptional cases. The real theorem needs both the nonpositive-square obstruction and a square-root existence witness. Neither retained theorem is a defining equation, one pinned lemma, or a single boundary example. The tensor lift and its pure-tensor API would be padding, so they stay out. No new padding finding is raised.

### Adversarial statement ledger

All field rows exclude the zero ring by Field. A root-dependent row assumes ζ∈F primitive of order m; finite étale rows assume m≥1 invertible in F; the algebra rows require m≥2 and unit a,b. Residue rows additionally require invertibility in the residue field. Arithmetic local rows use a complete nontrivially discretely valued field with finite residue field; the archimedean rows are separate. “No change” reports the computed test, not a formal proof. Imported inputs remain subject to the declared contracts.

| Statement / README line | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| Quotient versus torsion, 19 | A=ℤ, m=2; A=0 | ℤ/2=C₂ but ℤ[2]=0; zero-group quotient and torsion both 0 | Distinction necessary; no change. |
| Invertible coefficient convention, 21 | F₂,m=2 and 3; ℚ₂,m=2; m=0 | Casts 0,1 and nonzero 2 respectively; m=0 never a field unit | Exactly the allowed cases; no change. |
| Twists and negative weights, 21 | ℚ,m=3, conjugation; j=0,1,2,−1 | Actions 1,−1,+1,−1; weight-one and weight-two actions differ | No root-free scalarization; no change. |
| Native Kummer cocycle, 23 | a=c^m; a=3 in ℚ₇,m=3 | Root c gives g(c)/c=1, class 0; arithmetic Frobenius on ∛3 gives ζ | Kernel and orientation agree; no change. |
| Ordered cup, 23 | S₃, sign characters into F₂, g=(12),h=(23) | First-character value 1 times second-character value 1 gives cup-cochain 1 | Nonabelian group order does not interchange slots; no change. |
| Negative flip, 52 | C₃, trivial Z/3 coefficients, identity character | Cup at (1,1)=1; coboundary of i↦i² also 1, so classes give 0=−0; ℚ₇ contracted cups give 1/3=−(2/3) | Cochain and class identities distinguished; no change. |
| Root coordinates, 25 | m=7,u=3, weights 0,1,2,−1 | Basis factors 1,3,2,5; inverse weight-two factor 4; contraction factor 5 | Different characters retained; no change. |
| Algebra/crossed-product convention, 27 | m=3; X,Y; carry i(g)=i(h)=2 | YX=ζXY; Y³=b and cocycle carry b | Both bold assertions use this order; no change. |
| Artin and invariant coordinate, 29–36 | ℚ₇,m=3, {3,7}; m=1,2 | e₃(1/3)=1, H(3,7)=ζ², H(7,3)=ζ; multiplication by 3 in Q/Z gives 0; m=1 gives 1; at m=2 both exponents give −1 | Sign and coordinate fixed; no change. |
| Tame/cohomological residue convention, 38 | ℚ₇,m=3,{3,7}; two units | Tame residue 3; its Kummer coordinate 1, cup residue −1=2; units give tame 1 and cohomology 0 | Negative square matches declared convention; no change. |
| Raw/product normalization, 40 | Cubic class with h-invariant 1/3, ε=−1 | θ♮=−θ; Chern on θ♮ gives 2/3, Chern on θ gives 1/3 | Two sign sources distinct; no change. |
| §1.1 ordered symbol dictionary, 104 | ℝ,m=2, {−1,−1}; power slot | Contracted cup and β both invariant 1/2; power-slot Kummer and h both 0 | Concrete map fixed; no change. |
| §1.1 Steinberg and functoriality, 106–108 | ℝ,{−1,2}; ℚ→ℚ(μ₃); identity | First cup 0 because κ₂(2)=0; restriction sends κ(a)⊗κ(b) to the same ordered tensors; identity fixes them | No extra root premise; no change. |
| §1.2 primitive basis definition, 119,123 | m=5,j=1,2; m=1 | τ₁(1)=ζ, τ₂(1)=ζ⊗ζ; m=1 has 1=0 and both modules 0 | Generator prevents zero map; no change. |
| §1.2 weight zero, 124 | m=5, roots ζ and ζ² | Both send 2∈Z/5 to 2, not 4 | Root-independent identity; no change. |
| §1.2 native weight-one formula, 125 | m=5, exponent 3 | Both primitive-root equivalences and closure embedding send 3 to ζ³ | Specified library adapter; no change. |
| §1.2 tensor coherence, 126 | m=7,u=3, weights 1+1 and 1+(−1) | 3·3=2 mod7 equals weight-two factor; 3·5=1 equals weight-zero factor | Positive and mixed weights; no change. |
| §1.2 dual evaluation, 128 | m=5,u=2 | New dual factor 3 on new vector factor 2 gives 6=1 | Excludes arbitrary dual normalization; no change. |
| §1.3 contraction definition, 140 | m=5, ζ²⊗ζ³ | Tensor lift gives ζ⁶=ζ; root multiplication gives ζ⁵=1 | Wrong model rejected; no change. |
| §1.3 pure tensor and pairing identity, 142 | m=5, exponents 2,3; input 1⊗ζ | Both linear lift and bilinear pairing give coordinate 6=1; additive-zero input gives root 1 | Native lift formula; no change. |
| §1.3 equivariance, 140 | ζ∈F; g arbitrary | g(ζ^(ij))=ζ^(ij)=c(gζ^i⊗gζ^j) | Root-containment supplies trivial action; no change. |
| §1.3 uniqueness, 142 | m=5, basis tensor; candidate 2c | c(ζ⊗ζ)=ζ, 2c(ζ⊗ζ)=ζ²≠ζ; a linear map with c's basis value agrees on all 25 tensor inputs | Generator values determine map; no change. |
| §1.4 β definition and symbol formula, 154–163 | ℝ,m=2, Hamilton symbol; split positive slot | Composite and algebraic export have invariant 1/2; split input gives 0 | Nonzero and split tests; no change. |
| §1.4 torsion, 163 | Cubic invariant 1/3; m=1 | 3·1/3=0 in Q/Z; Br[1]=0 | Correct torsion subgroup; no change. |
| §1.4 algebraic transport, 161–163 | Hamilton class under ℝ→ℂ | Algebra splits over ℂ, and restriction of its cohomological class is 0 | Direction of comparison consistent; no change. |
| §1.4 uniqueness on symbols, 163 | {3,7}+{7,3} in ℚ₇ | Each prescribed map gives 1/3+2/3=0; on {3,7} a zero map gives 0≠1/3 | Generation pins map; no change. |
| §1.5 all-weight root change, 174–181 | m=5,u=2,j=0,1,2,−1 | Factors 1,2,4,3; inverse weight-two factor 4 | Integer representatives differing by 5 give same powers; no change. |
| §1.5 contraction change, 178 | Fixed ζ²⊗ζ³, new basis ζ² | New coordinates 1,4; output ζ^(2·1·4)=ζ³ equals 3c | Correct u⁻¹, not u⁻²; no change. |
| §1.5 Brauer change, 178 | ℚ₇,m=3,u=2, invariant 1/3 | New invariant 2/3 equals 2·1/3 | Inversion visible; no change. |
| §1.5 field identity/composition, 183–189 | ℝ→ℂ→ℂ and id_ℝ | Hamilton gives 0 by both composites, identity gives 1/2 on both sides | Transported root fixed; no change. |
| §1.5 inseparable field restriction | F₃(s)⊂F₃(t), s=t³, m=2 | {2,s} restricts to {2,t³}=3{2,t}={2,t} mod2; Kummer κ(s)=3κ(t)=κ(t) | Prime-to-characteristic action agrees; no change. |
| §1.6 residue identity, 200–208 | ℚ₇,m=3,{3,7}; {7,3} | −κ(3)=2 and −κ(3⁻¹)=−2=1; swapping cup changes 2 to 1 | Both slot orders checked; no change. |
| §1.6 units and wild boundary, 206–215 | ℚ₇,{2,3}; ℚ₂,{−1,−1},m=2 | First tame 1 and residue 0; dyadic tame 1 but Hilbert −1, residue premise fails | No wild inference; no change. |
| §2.1 monomial multiplication, 229–236 | m=3, e₂₁e₂₂ | Carries (1,1), exponent 2, coefficient ζ²ab, index (1,0) | No truncation/junk carry; no change. |
| §2.1 associativity and unit, 236 | m=3, e₂₁,e₂₂,e₁₀; e₀₀ | Both triple products ζ²ab e₂₀; e₀₀e₂₁=e₂₁=e₂₁e₀₀ | Carries and ζ³=1 agree; no change. |
| §2.1 generator relations, 236–238 | m=2 and 3 | X^m=a, Y^m=b; YX coefficient ζ, XY coefficient 1; at m=2 (XY)²=−ab | Sign fixed; no change. |
| §2.1 basis and dimension, 238 | m=2,a=1; m=4,a=c² | Dimensions 4 and 16 regardless of radical degrees 1 and 2 | No irreducibility premise; no change. |
| §2.1 universal mapping property, 238 | m=2,a=b=1, X=diag(1,−1), Y=swap; zero F-algebra target | Matrices square to I and satisfy YX=−XY; zero target satisfies 0=1_B, unique zero map | Arbitrary unital algebra, including zero target, causes no false nontriviality assertion; no change. |
| §2.1 scalar extension and coherence, 240 | ℝ→ℂ, a=b=−1; identity | Four basis elements map to four; direct/composite extension both send 1⊗eᵢⱼ to eᵢⱼ | Explicit basis removes dimension-only ambiguity; no change. |
| §2.1 degree-one convention, 242 | d=1 corner; m=0 | Corner F has dimension 1; original algebra dimension m²; m=0 excluded | No Fin 1 index 1 used; no change. |
| §2.2 matrix splitting, 253–261 | m=2, α²=a | X=diag(α,−α), Y=[[0,b],[1,0]]; YX=[[0,−αb],[α,0]]=−XY; Y²=bI | Wrap factor correct; no change. |
| §2.2 interpolation, 261 | m=3 | α,αζ⁻¹,αζ⁻² distinct since α≠0 and ζ order3; all pairwise differences nonzero | Denominators justified; no change. |
| §2.2 central simplicity, 263 | Hamilton ℝ-algebra; split Mat₂(F) | Both dimension4 and center F; over ℂ Hamilton becomes Mat₂(ℂ) | Descent uses actual splitting; no change. |
| §2.2 source misprint control, 265 | Mat₂(D), D division quaternion, μ₄⊂F | diag(1,−1)^4=1 but minimal polynomial degree2; index(D)=2 persists, so not Mat₄(F) | Incorrect source inference explicitly excluded; no change. |
| §2.3 radical degree and fixed scalar, 276–284 | F=ℚ(i),m=4,α²=2 | a=4,d=2,s=2,c=2; c²=4; conjugation α↦−α fixes c | d divides m with c∈F; no change. |
| §2.3 factorization/idempotents, 284–290 | Same case | T⁴−4=(T²−2)(T²+2); Y swaps factors, Y² fixes each | Two distinct degree2 factors; no change. |
| §2.3 corner relations and equivalence, 290–292 | Same case, arbitrary unit b | (eX)²=2e, (eY²)²=be, (eY²)(eX)=−(eX)(eY²); 16=2²·4 | Quaternion corner and matrix size agree; no change. |
| §2.3 extreme degrees, 282 | d=1; d=m | Mat_m(F) dimension m²; Mat₁(A) dimension m² | Both endpoints covered; no change. |
| §2.3 auxiliary-root dependence, 292 | m=4,α↦iα | c changes 2↦−2; corner changes T²−2↦T²+2, but conjugation by Y identifies their Brauer class | No false choice-free corner asserted; no change. |
| §2.4 carry/cochain identity, 305–311 | m=3,i(g)=i(h)=2,j(g)=1 | i(gh)=1; δf=γ³ζ²=bζ²=dζ² | Positive ordered class after negative flip; no change. |
| §2.4 reduced radical cocycle, 313 | m=4,d=2,s=2, i(g)=i(h)=2 | Carry1 gives d=b; δf=bζ^(2j(g)); degree2 corner has same carry | No nonexistent degree4 field used; no change. |
| §2.4 algebra/cup equality, 303,317 | ℚ₇,3,7; real quaternion | Invariants (1/3,1/3); opposite 2/3; at m=2 both Hamilton invariants 1/2 | Distinguishes cubic sign; no change. |
| §3.1 coefficient transport, 336–343 | w=6,m=3; coefficient chain 6→3→1 | ζ₆↦ζ₆² versus primary ζ₆⁴; composite to μ₁ and direct sixth power both1 | Exact earlier map imported; no change. |
| §3.1 local scalar values, 340–347 | ℚ₂,−1,−1; ℚ₃,3,−1; ℚ₅,5,2 | Values −1,−1,−1; dyadic tame1; odd tame for {5,2} is 2⁻¹=3, Legendre3=−1 | Wild/tame distinction sound; no change. |
| §3.1 factorization/naturality, 343 | x=my; power slot; id_F | N(my)=N(y)^m=1; κ(c^m)=0 gives scalar1; identity fixes value | Quotient and coefficient maps supplied; no change. |
| §3.2 exact order and section, 359–373 | μ(F)=μ_m; ℚ₂,m=2; composite m=6 | ζ^e=t^m implies t^(m²)=1, then t^m=1, so m∣e; Q₂ generator maps to order2; ζ₆² has only order3 | Primitive-value condition necessary; no change. |
| §3.3 conic definition and existence, 377–379 | ℝ,(0,0),(1,−1); F₂,(0,1) | No solution/−1; (1,0) gives1/+1; (0,1) gives1/+1 | Total, no algorithm promised; no change. |
| §3.3 symmetry, 379 | ℚ,(2,−1) and (−1,2) | Swapped point (1,1) gives1 for both | Zero coefficients also permitted; no change. |
| §3.3 one-left and Steinberg, 379 | Any field; F₂,r=0,1 | 1·1²+s·0²=1; r+(1−r)=1; F₂ pairs (0,1),(1,0) give1 | Includes characteristic2 and zero entries; no change. |
| §3.3 norm criterion, 379–385 | ℚ,(2,−1), conic u=v=1 | x=1/v=1,y=u/v=1 gives 1−2=−1; inverse gives the same conic | Nonexceptional maps valid; no change. |
| §3.3 exceptional norm cases, 385 | ℚ,(1,3); ℚ,(2,−2) | v=0: conic (1,0), norm (2,1), 4−1=3. x=0: norm (0,1), conic (3/4,1/4), 18/16−2/16=1 | No division by zero; no change. |
| §3.3 real iff, 387–393 | (0,0),(−1,−1),(0,2),(1,−1) | Signs −1,−1,+1,+1; conjunctions true,true,false,false | Both directions and boundary included; no change. |
| §3.3 rational nonmultiplicativity, 401,451 | r=3,7,21;s=−1 | Primitive rA²=B²+C² impossible modulo3 or7; signs all−1, but (−1)(−1)=+1 | Locality not suppressed; no change. |
| §3.3 characteristic-two control, 403 | F₂(t),r=1,s=t | Conic (1,0) gives1; x²−y²=(x+y)²≠t | Norm bridge genuinely needs h2; no change. |
| §3.4 conic/Hilbert equality, 407 | ℚ,(1,3); ℝ,(−1,−1); F₃,(2,2) | Values +1/+1,−1/−1,+1/+1 | Generic statement present in Lean; no change. |
| §3.4 K₂ quadratic and real maps, 407–417 | ℚ₂ and ℝ on {−1,−1}; ℂ | N₂, Hilbert and conic all−1 in first two; all1 over ℂ | Imported maps, correct unit domain; no change. |
| §3.4 uniqueness, 417 | Maps on symbols, {−1,−1} versus {1,b} | Prescribed values −1 and1 exclude constant map; symbols generate | No higher-root scalar inferred from kernel only; no change. |
| §3.5 local invariant formula, 428–438 | ℚ₇,m=3,ζ mod7=2 | Cubes {1,6}; α⁶=9=2 mod7; Frob ratio ζ; inv A(3,7)=1/3; N(3,7)=ζ² | Negative Artin-first and positive transpose agree; no change. |
| §3.5 root independence, 440 | m=3,u=2, e(invβ)=1 | New coordinate2 and new rootζ² give (ζ²)⁻²=ζ², old valueζ⁻¹=ζ² | Final scalar independent; no change. |
| §4.1 place factors, 465–469 | ℚ,m=2,x={−1,−1}; m=1 | Values at2,∞ are−1,−1, others1; μ₁ factors all1 | Separate real case correct; no change. |
| §4.1 common roots and real exclusion, 465–467 | μ₃⊂F; hypothetical real place | A real field has only ±1, so no primitive cube root; global/local μ_m each have m elements | Root maps invertible; no fake real value; no change. |
| §4.2 finite/equal supports, 480–484 | Rational Hamilton class; m=1 | Multiplicative and invariant supports {2,∞}; at m=1 both∅ | Wild/real places included; no change. |
| §4.2 addition support, 484 | y=−x for nonzero Hamilton x | support(x+y)=∅, union={2,∞} | Only inclusion asserted; no change. |
| §4.3 product and sum, 495–506 | Rational Hamilton class | (−1)(−1)=1; 1/2+1/2=1=0 in Q/Z | All-place theorem sound; no change. |
| §4.3 product/sum iff, 502–506 | m=3, finite coordinates (1,2), then (1) | ζ⁻³=1 and sum1=0; ζ⁻¹≠1 and sum1/3≠0 | Both directions via injective coordinates; no change. |
| §4.3 proposed compatibility Check, 513 | Replace all λ_v by inverses | Full product still1 and sum still0; at cubic v values ζ² versusζ differ | S02: full vanishing is not a map-compatibility test. |
| §5.1 finite local Tate dictionary, 529–537 | ℚ₇,ℓ=3; ℚ₂,ℓ=2 | Contracted symbol invariants 1/3 and1/2, respectively; both finite maps include these classes | Actual ordered map, not abstract equivalence; no change. |
| §5.1 archimedean coefficients, 539 | ℝ,2^r; ℝ,odd ℓ; ℂ | H²(C₂,Z/2^r(2))=C₂ and symbol nonzero; odd coefficients give0; trivial complex Galois group gives0 | No mistaken real vanishing; no change. |
| §5.1 equal characteristic, 546 | F₂((t)),ℓ=3 versus2 | μ₃(F) trivial, local dual degree2 target0 and K₂/3=0; ℓ=2 cast0 fails invertibility | No forbidden characteristic symbol; no change. |
| §5.2 completion and residue naturality, 550 | ℚ,{3,7}→ℚ₇; F₃(t),{2,t} at t=0 | Completion sends the same units; invariants1/3 and1/2; residues3 and2, with negative Kummer | Correct maps retained; no change. |
| §5.2 general adic torsion, 552 | ℓ-primary divisible summand Q_ℓ/Z_ℓ; reduced global example | Divisible summand maps0, quotient0; global {2,t} in F₃(t) has order2 and image invariant1/2 | Injectivity premise required and present; no change. |
| §5.2 global infinite finite quotient, 554,561 | ℚ,m=2, odd primes | Each F_p×/(F_p×)²=C₂; arbitrarily many independent coordinates, so infinite cardinality | Finite-group overclaim repaired; no change. |
| §5.2 finite-extension transfer, 554 | F₃(s)⊂F₃(t),s=t³,ℓ=2 | Purely inseparable degree3; norm of t is s, and res∘N multiplies by3=1 mod2 | Transfer must retain degree, not only Galois-group index; expressly in coherence gap. |
| §5.3 ring adic and finite comparisons, 566–573 | O=ℤ[1/2],ℓ=2; O=F₃[t] | Number-ring groups C₂ on both sides, real pair retained; function-ring comparison not asserted here | Mathematical instance consistent; S01 corrects ownership. |
| §5.3 localization/S-enlargement, 575 | ℤ[1/2]⊂ℤ[1/6]⊂ℚ | Hamilton class retains its2/∞ values through either route; local added residue at3 is1 and −κ(1)=0 | Identity/composition of specified maps; no change. |
| §5.3 Picard sequence, 577–584 | F₃[t],S={∞},ℓ=2; nonzero Pic/ℓ | First case 0→0→0→0; in second, μ_ℓ⊗Pic contributes Pic/ℓ and maps0 generically | Class-group kernel cannot be dropped; no change. |
| §5.3 weight-one Kummer contrast, 585–590 | Spec F; ring with Pic/ℓ≠0 | Field Pic term0; ring term nonzero even if field restriction is0 | Distinct weight/coefficient statements; no change. |
| §5.4 finite cofiber exactness, 603–614 | ℝ,m=2; m=1 | C₂ injects in coefficient K₂ with nonzero C₂ quotient; m=1 cofiber identity has all groups0 | Consumed exactness, no splitting; no change. |
| §5.4 inclusion/reduction and CRT, 612 | m=6,d=2; coordinate5 | Reduction sends boundary ζ₆ toζ₆³=−1, inclusion keeps−1; CRT5↦(1,2) | Distinct coefficient maps retained; no change. |
| §5.5 integral Chern coefficient, 634–640 | i=j=1 | −(1)!/(0!0!)=−1, not a modular inverse of a nonunit | All primes allowed on reduction image; no change. |
| §5.5 product-normalized comparison, 625–640 | ℚ₇,m=3,{3,7}; m=1 | Cup inv1/3, Chern inv2/3=−1/3; at m=1 both0 | Minus sign independent of Artin order; no change. |
| §5.5 even correction, 640–642 | ℚ₂,m=2, Bott β with ∂β=−1 | red{−1,−1}=2β has zero boundary, cup/Chern value1 in F₂; globally additive c would give c(2β)=2c(β)=0 | Restriction to integral-reduction image essential; no change. |
| §5.5 raw map/sign replacement, 632,644 | ε=−1, h coordinate1 mod3; θ↦−θ | Raw coefficient−ε=+1, value1; normalized coefficient−1 gives2; changing both θ andε fixes θ♮ | No sign absorbed by an arbitrary equivalence; no change. |
| §5.5 CRT, 642 | m=6, cup coordinate1 | Chern−1=5, projections1 mod2 and2 mod3, inverse CRT5 | One coherent coefficient sign; no change. |

### Complete Check ledger

Each row is one README Check bullet, identified by its section and line. Concrete values also supply negative controls for the adjacent definition.

| Check | Computed instance and values | Result / change |
| --- | --- | --- |
| §1.1, README:112 | ℝ,m=2: κ(2)=0, cup(−1,2)=0; cup(−1,−1) has invariant1/2. | Consistent; no change. |
| §1.1, README:113 | a=c^m: κ(a)=0, cup=0; m=1 has zero coefficient module. | Consistent; no change. |
| §1.1, README:114 | ℚ,m=3: μ₃(ℚ)={1}, while μ₃⊗² exists with trivial conjugation action. | Consistent; no change. |
| §1.1, README:115 | ℝ,m=2: both Hamilton and contracted cup have invariant1/2, unlike zero map. | Consistent; no change. |
| §1.2, README:132 | m=5,j=0,input2: τ sends2↦2 for ζ andζ²; a rescaling by2 sends2↦4 and fails. | Consistent; no change. |
| §1.2, README:133 | m=5,u=2: weight-one factor2, weight-two factor4. | Consistent; no change. |
| §1.2, README:134 | m=5,u=2: inverse3, evaluation2·3=1. | Consistent; no change. |
| §1.2, README:135 | m=2: ζ=−1; additive coordinate1 maps to−1 in both bases. | Consistent; no change. |
| §1.2, README:136 | ℚ,m=3: conjugation factors−1 on μ₃ and(−1)²=1 on μ₃⊗². | Consistent; no change. |
| §1.3, README:146 | m=5: c(ζ²⊗ζ³)=ζ, whereas ζ²ζ³=1. | Consistent; no change. |
| §1.3, README:147 | Root1 is additive0: c(1⊗ζ)=1, wrong multiplication givesζ. | Consistent; no change. |
| §1.3, README:148 | m=1: source0, target0, unique map0. | Consistent; no change. |
| §1.3, README:149 | m=2: tensor of the two nonzero coefficient classes maps to−1; Hamilton invariant1/2. | Consistent; no change. |
| §1.3, README:150 | m=5,new rootζ²: fixed tensor coordinates1,4 giveζ⁸=ζ³; 3c givesζ³, 4c givesζ⁴. | Consistent; no change. |
| §1.4, README:167 | Steinberg {−1,2} overℝ and {a,c^m}: contracted cups0 and0. | Consistent; no change. |
| §1.4, README:168 | m=1: Br[1]=0, β=0. | Consistent; no change. |
| §1.4, README:169 | ℝ: (−1,−1) invariant1/2; (1,−1) invariant0. | Consistent; no change. |
| §1.4, README:170 | m=2: quaternion and cup both1/2 on Hamilton and0 on the split pair. | Consistent; no change. |
| §1.5, README:193 | m=5,u=2: β factor3, inverse weight-two factor4. | Consistent; no change. |
| §1.5, README:194 | Nonzero local cubic invariant1/3 becomes2/3=−1/3 underζ↦ζ². | Consistent; no change. |
| §1.5, README:195 | ℚ has1 cube root, ℚ(μ₃) has3; h exists over both, a primitive-root basis only over the latter. | Consistent; no change. |
| §1.5, README:196 | ℝ→ℂ→ℂ: Hamilton maps0 by each route; id_ℝ preserves1/2. | S03: delete the repeated general-law Check; the value here is a reviewer-supplied instance. |
| §1.6, README:212 | ℚ₇,m=3: tame3, Kummer coordinate1, negative residue2≠1. | Consistent; no change. |
| §1.6, README:213 | Two valuation units: tame1 and cohomological residue0. | Consistent; no change. |
| §1.6, README:214 | ℚ₂,m=2: cast2≠0 in fraction field, cast2=0 in residue; tame1, Hilbert−1. | Consistent; no change. |
| §1.6, README:215 | m=1: finite quotient and residue target0; m=p in residue characteristicp is nonunit0. | Consistent; no change. |
| §2.1, README:246 | m=2: XY=−YX and(XY)²=−ab, matching quaternion generators. | Consistent; no change. |
| §2.1, README:247 | a=c^m: radical degree1; algebra dimensionm², split matrix dimensionm². | Consistent; no change. |
| §2.1, README:248 | m=4,a=c²,c nonsquare: algebra dimension16, quaternion corner dimension4. | Consistent; no change. |
| §2.1, README:249 | YX coefficientζ andXY coefficient1; reversed exponent would exchange these coefficients. | Consistent; no change. |
| §2.2, README:269 | a=1,α=1: matrices already overF, dimensionsm²=m². | Consistent; no change. |
| §2.2, README:270 | ℝ,−1,−1: division algebra, no realα²=−1; overℂ, α=i givesMat₂. | Consistent; no change. |
| §2.2, README:271 | ℚ,m=2,a=1,b=3: X=diag(1,−1),Y²=3I; no square root of3 needed. | Consistent; no change. |
| §2.2, README:272 | m=2: YX=[[0,−αb],[α,0]]=−XY. | Consistent; no change. |
| §2.3, README:296 | ℚ(i),a=4,c=2: d=s=2, dimensions16=4·4. | Consistent; no change. |
| §2.3, README:297 | d=1: cornerF, Mat_m(F) dimensionm². | Consistent; no change. |
| §2.3, README:298 | d=m: s=1,c=a, Mat₁(A)=A. | Consistent; no change. |
| §2.3, README:299 | T⁴−4=(T²−2)(T²+2); Y swaps signs ofX², Y² preserves them. | Consistent; no change. |
| §2.4, README:317 | ℚ₇,ζ mod7=2: invA(3,7)=1/3=invβ; opposite gives2/3. | Consistent; no change. |
| §2.4, README:318 | m=4,a=4 overℚ(i): (eX)²=2e and(eY²)²=be, so corner is(2,b). | Consistent; no change. |
| §2.4, README:319 | Negated comparison sends cubic1/3 to2/3; the specified one preserves1/3. | Consistent; no change. |
| §2.4, README:320 | m=2,Hamilton: algebra and pinned quaternion cup both1/2. | Consistent; no change. |
| §3.1, README:351 | ℚ₂,−1,−1: Hilbert/N value−1. | Consistent; no change. |
| §3.1, README:352 | ℚ₃,3,−1: norm valuations from unramified quadratic extension are even; v(3)=1, so value−1. | Consistent; no change. |
| §3.1, README:353 | ℚ₂,−1,−1: tame1 but N=−1. | Consistent; no change. |
| §3.1, README:354 | ℚ₅,{5,2}: tame3 and Legendre3=−1=Legendre2=N. | Consistent; no change. |
| §3.1, README:355 | m=1: μ₁={1}, N(x)=1=N(c^1,b). | Consistent; no change. |
| §3.2, README:370 | ℚ₂: N{−1,−1}=−1, and2{−1,−1}=0. | Consistent; no change. |
| §3.2, README:371 | ζ^e=t^m implies t^(m²)=1; full roots force t^m=1, hence ζ^e=1 andm∣e. | Consistent; no change. |
| §3.2, README:372 | ζ₆² has order3, so its generated image has3 rather than6 elements. | Consistent; no change. |
| §3.2, README:373 | Projection C_m⊕ℤ→C_m has a section but kernelℤ; 2z=1 has no solution, so splitting alone proves no divisibility. | Consistent; no change. |
| §3.3, README:397 | ℝ,(0,0): LHS equation0=1 false, sign−1, strict-negative predicate false. | Consistent; no change. |
| §3.3, README:398 | ℝ,(−1,−1): no point/sign−1; (1,−1): point(1,0)/sign1. | Consistent; no change. |
| §3.3, README:399 | ℚ₂: primitive integral square triple summing0 modulo4 forces all entries even, impossible; sign−1. | Consistent; no change. |
| §3.3, README:400 | ℚ₃,(3,−1): conic and norm criteria both fail, giving−1; characteristic2 excluded. | Consistent; no change. |
| §3.3, README:401 | ℚ, r=3,7,21,s=−1: primitive integer equations impossible modulo3 or7, signs−1,−1,−1; product of first two1. | Consistent; no change. |
| §3.3, README:402 | AnyF: (1,0) gives1 and(1,1) givesr+(1−r)=1; F₂ pairs(0,1),(1,0) give1. | Consistent; no change. |
| §3.3, README:403 | F₂(t),(1,t): conic1, norm impossible since t not square, Hilbert−1. | Consistent; no change. |
| §3.4, README:421 | ℚ₂,{−1,−1}: all three signs−1. | Consistent; no change. |
| §3.4, README:422 | ℝ, negative pair:−1; (1,−1):1, matching realSignSymbol. | Consistent; no change. |
| §3.4, README:423 | ℝ,(0,0): total sign−1, but0 has no unit inverse, so no K₂ unit symbol. | Consistent; no change. |
| §3.4, README:424 | ℝ,{−1,2}: Steinberg class0, multiplicative value1; witness(1,1) gives1. | Consistent; no change. |
| §3.5, README:444 | ℚ₇,{3,7}: inv1/3,N=ζ²; transposed N=ζ. | Consistent; no change. |
| §3.5, README:445 | m=3,u=2: old rootζ exponent−1 givesζ²; new rootζ² exponent−2 alsoζ². | Consistent; no change. |
| §3.5, README:446 | m=1: coordinate0/root1; m=2: ζ^1=ζ^(−1)=−1. | Consistent; no change. |
| §3.5, README:447 | 3·(1/3)=0 inQ/Z while e₃(1/3)=1; replacing coordinate by0 yields1 instead ofζ². | Consistent; no change. |
| §4.1, README:473 | ℚ,m=1: all factors1, including∞; −1 is not inμ₁. | Consistent; no change. |
| §4.1, README:474 | ℚ,m=2,Hamilton: factors−1 at2,∞, and1 at each oddprime. | Consistent; no change. |
| §4.1, README:475 | Primitive root of order>2 cannot map intoℝ, whose torsion units have order≤2. | Consistent; no change. |
| §4.1, README:476 | ℚ,m=2: global−1 maps to local−1 and back to−1; product(−1)(−1)=1 in commonμ₂. | Consistent; no change. |
| §4.2, README:488 | m=1: each factor1, nontrivial support∅. | Consistent; no change. |
| §4.2, README:489 | Hamilton at m=2: support{2,∞}. | Consistent; no change. |
| §4.2, README:490 | Valuations of−1 are0 at all finite primes, yet support includes2 and∞. | Consistent; no change. |
| §4.2, README:491 | y=−x: support0=∅, union of supports{x,−x}={2,∞}. | Consistent; no change. |
| §4.3, README:510 | Hamilton: product(−1)(−1)=1; invariant sum1/2+1/2=0 inQ/Z. | Consistent; no change. |
| §4.3, README:511 | m=1: factors1, invariants0. | Consistent; no change. |
| §4.3, README:512 | For x+x with Hamilton x: local(−1)²=1 and summed invariant2·1/2=0; x−x likewise. | Consistent; no change. |
| §4.3, README:513 | Wrong familyλ⁻¹: full product1 and Brauer sum0 still pass; cubic partial factor changesζ² toζ. S02. | S02: replace. |
| §5.1, README:543 | ℚ₇,ℓ=3: h{3,7} has contracted invariant1/3, doubled map gives2/3. | Consistent; no change. |
| §5.1, README:544 | ℚ₂,ℓ=2: 2 is field unit, not residue unit; h survives, tame square unavailable. | Consistent; no change. |
| §5.1, README:545 | ℝ,ℓ=2: symbol nonzero inC₂; ℂ: quotient0=H². | Consistent; no change. |
| §5.1, README:546 | F₂((t)),ℓ=3: target0=K₂/3, since μ₃(F)={1}; ℓ=2 nonunit0. | Consistent; no change. |
| §5.2, README:558 | ℚ,ℓ=2: completion of Hamilton at∞ has invariant1/2, not0. | Consistent; no change. |
| §5.2, README:559 | F₃(t),ℓ=2,{2,t}: local invariant1/2 at0 and∞; prime3 case excluded. | Consistent; no change. |
| §5.2, README:560 | ℚ,{3,7} restricted toℚ₇ gives identical ordered unit pair and cup invariant1/3. | Consistent; no change. |
| §5.2, README:561 | For every oddp, residue quotientC₂; N chosen odd primes give at least2^N quotient values. | Consistent; no change. |
| §5.2, README:562 | GlobalF₃(t): ℓ-primary group reduced, so maximal divisible subgroup0; μ₃ étale comparison unavailable. | Consistent; no change. |
| §5.3, README:594 | ℤ[1/2]: Pic0, sum-zero part ofC₂⊕C₂ is diagonalC₂, generated byHamilton. | Consistent; no change. |
| §5.3, README:595 | F₃[t]: Pic0,K₂0,sum-zero subgroup of oneC₂ is0; exact sequence all0. | Consistent; no change. |
| §5.3, README:596 | If Pic/ℓ=C_ℓ then μ_ℓ⊗Pic=C_ℓ injects into ring quotient and maps0 generically. | Consistent; no change. |
| §5.3, README:597 | ℤ[1/2]→ℤ[1/6]→ℚ: Hamilton remains same class; at an added unit residue κ(1)=0; {u,π} gives−κ(ū). | Consistent; no change. |
| §5.3, README:598 | O=ℤ,ℓ=2: 2 is not a unit; O=ℤ[1/2]: it is a unit. | Consistent; no change. |
| §5.3, README:599 | Ring Pic/ℓ=C_ℓ gives generic kernelC_ℓ, while a field's Pic term0. | Consistent; no change. |
| §5.4, README:618 | ℝ,m=2: right termμ₂=C₂≠0; whole finite group has nonzero quotient absent fromK₂/2. | Consistent; no change. |
| §5.4, README:619 | m=1: cofiber(id)=0, all three terms0. | Consistent; no change. |
| §5.4, README:620 | ℝ→ℂ: integralHamilton reduction restricts0; both Bockstein composites give0 on it. | S03: delete the repeated general-law Check; the value here is a reviewer-supplied instance. |
| §5.4, README:621 | Z/6 coordinate5 has components1,2; cofiber boundaries project by their prescribed maps, not by a new product. | Consistent; no change. |
| §5.5, README:648 | ℚ₇,m=3: contracted h invariant1/3, Chern invariant2/3. | Consistent; no change. |
| §5.5, README:649 | −1=5 mod6, projections(1,2), inverseCRT5. | Consistent; no change. |
| §5.5, README:650 | i=j=1: external coefficient−1; diagonal pullback preserves−1. | Consistent; no change. |
| §5.5, README:651 | θ↦−θ,ε↦−ε: θ∘ε unchanged, raw coefficient−ε changes sign. | Consistent; no change. |
| §5.5, README:652 | ℝ,m=2: Bockstein quotientC₂, hence equality on reductions leaves another coset unconstrained. | Consistent; no change. |
| §5.5, README:653 | m=1: finiteK₂0=cohomology0; at m=3 overℚ, tensor h still exists despite μ₃(ℚ)={1}. | Consistent; no change. |

### Resolved source locators

The following are 32 locator groups, counted once even when repeated in several targets. These records identify the supporting text and the hypothesis or convention checked; they do not reproduce source passages. All four works are already certified in sources.toml. No further text or source-manifest change was needed.

| Source and locator | Cached-text witness | What was verified |
| --- | --- | --- |
| Weibel III.6.2.1 | weibel line 13376 | Real sign and negative-pair obstruction; the total zero-input extension is checked directly. |
| Weibel III.6.2.2 | weibel line 13394 | Conic sign; its rational example does not assert bilinearity on arbitrary fields. |
| Weibel III.6.2.3 | weibel line 13406 | Local norm symbol and roots of unity. The package strengthens the source's insufficient nonidentity section condition to a primitive value. |
| Weibel III.6.2.5 | weibel line 13450 | Dyadic value and the necessity of distinguishing wild coefficients from the tame formula. |
| Weibel III.6.3 | weibel line 13461 | Source tame convention has uniformizer first; the package explicitly inverts it to its uniformizer-last convention. |
| Weibel III.6.9 | weibel line 13858 | Degree-m algebra generators and commutation relation, with no irreducibility premise on T^m−a. |
| Weibel III.6.9.1 | weibel line 13884 | Splitting argument; the package repairs the eigenvalue/minimal-polynomial inference by an explicit matrix basis. |
| Weibel III.6.9.2 | weibel line 13893 | Symbol-to-Brauer homomorphism and Steinberg factorization. |
| Weibel III.6.10.1 | weibel line 13950 | Kummer coefficient identification under invertibility. All-weight coherence is correctly attributed separately to EtaleCohomologyFoundations. |
| Weibel III.6.10.2–6.10.3 | weibel line 13968 | Ordered tensor cup and Steinberg symbol; a root-free tensor coefficient module must be retained. |
| Weibel III.6.10.4 | weibel line 14004 | Algebra/cup comparison after choosing a primitive root; the crossed-product and slot conventions are explicitly transported. |
| Weibel VI.8.6 | weibel line 31435 | Finite S-integer comparison with the coefficient inverted; the adjacent special-value discussion is not made a target. |
| Tate Theorem 3.1 | tate line 256 | Specified adic symbol with ℓ different from the field characteristic. |
| Tate Lemma 3.2 | tate line 287 | Transfer/projection formula in its separable source setting. The extra inseparable compatibility is declared in the supplier contract, not attributed to this lemma. |
| Tate Diagram 3.3 | tate line 294 | Finite/adic arrows, coefficient reduction and the distinction between torsion and quotient groups. |
| Tate Theorem 3.5 and corollary | tate line 354 | Mod-ℓ injectivity is a premise of the asserted torsion conclusion. |
| Tate Proposition 4.5 and corollary | tate line 463 | Local comparison and its root-of-unity terms; real and complex specializations are retained. |
| Tate Theorem 5.1 | tate line 493 | Global-field finite-coefficient symbol theorem, including function fields away from their characteristic. |
| Tate Equation 5.3 | tate line 547 | Localization uses a direct sum; this does not make the global finite-coefficient group finite. |
| Tate Theorem 5.4 | tate line 561 | Global-field reduced torsion conclusion and the zero divisible kernel. |
| Tate Theorem 6.2 and proof | tate line 575 | Global field, μ_ℓ containment and nonempty S; the tame calculation at tate line 597 fixes the Picard injection. |
| Milne III.3, Proposition 3.6 | milne line 4957 | Unit/character order in the Artin and Brauer-invariant formula. |
| Milne III.4, Steps 1–4 | milne line 5034 | Cup/cyclic-algebra and character identifications; milne lines 5057, 5064, 5088 and 5093 resolve the intervening conventions. |
| Milne III.4, Remark 4.5 | milne line 5140 | Hilbert-symbol transpose relative to the package's Artin-first convention. |
| Milne V.5, Proposition 5.2 | milne line 8075 | Finite support of the local factors with the required root and number-field hypotheses. |
| Milne V.5, Theorem 5.3 and Example 5.4 | milne line 8123 | Product reciprocity and the real/quadratic example; finite support alone is not reciprocity. |
| Milne VII.8.1(b) | milne line 10042 | Number-field Brauer invariant sum, with archimedean contributions. |
| Soulé Proposition 2.2.2.3 | soule line 1276 | Integral external-product coefficient; i=j=1 gives −1. |
| Soulé §2.2.3.1 | soule line 1401 | Finite-coefficient cofiber exactness and the limited product construction. |
| Soulé §2.2.3.2 and Lemma 2.2.3.2.1 | soule line 1450 | Integral reduction and the factorization used for the Chern comparison. |
| Soulé Proposition 2.2.3.3 and remark | soule line 1523 | Mixed product sign and restriction on finite-by-finite products. The package identifies the transcription's factorial misprint; both readings agree at i=1. |
| Soulé §2.2.4.4 | soule line 1693 | Negative degree-two cup formula and the ring argument under root containment. The package requests the more general arithmetic extension explicitly instead of attributing it to this restricted argument. |

### Supplier and ownership resolution

Each of the 40 distinct cited sections/layers was checked at main or the supplied open head. Roadmap-service searches were also used for object ownership, not only for matching declaration names. The supplied copies of K2SymbolsBrauer, KTheoryFiniteLocalFields and GeneralAlgebraicKTheory were read through that service; the other named owners were read on main. ArithmeticKTheory was checked at its supplied open head.

| Supplier / resolved sections | Contract verified and boundary witness |
| --- | --- |
| K2SymbolsBrauer §§0.4, 5.1–5.2, 7.1–7.3, 8.1–8.3, 12.5 | Classical presentation, universal pairing, transports and raw/product-normalized comparison exist. Its §8.1 fixes ε=−1. A raw comparison cannot be renamed to change the Chern sign. §12.5 owns the real unit symbol; this package's total conic extends to zero inputs. |
| KTheoryFiniteLocalFields §§1.1, 1.8, 3.0a, 3.1–3.4, 7.3 | All-degree coefficient sequence, early Chern operation, all-field finite symbol, local full-root map and section, divisibility and completion maps exist. The finite group has a nonzero Bockstein quotient for ℝ,m=2 and is not replaced by K₂/2. |
| EtaleCohomologyFoundations §§F.0.3, F.4.1–F.4.2 | Finite twists, normalized adic systems and derived limits exist. Native Kummer identification and the specific cup/residue transport are explicitly an extension contract. F.4's constructibility/boundedness is not silently promoted to an arbitrary-system theorem here. |
| SchemeAndStackFoundations §§2.11, 2.15 | Kummer sequence and field étale/Galois equivalence exist. The étale coefficient requires invertibility: μ₂ in characteristic 2 does not furnish that comparison. |
| GeneralAlgebraicKTheory §§1.7–1.8, Layer 5, §§7.4–7.5 | Stable cofiber/exactness, suspension convention, K-spectrum and integral products exist. No arbitrary multiplication on a mod-2 Moore spectrum is inferred. |
| ClassFieldTheory Layers 5, 6, 10, 14 | Local invariant, arithmetic Artin convention, number-field sum and quadratic product law exist. The global-field Tate extension is kept separate from the number-field law. |
| QuadraticFormInvariants §§6C, 6E, 7B | Generic norm-sign carrier, quadratic cohomological comparison and Brauer/crossed-product comparison exist. The conic theorem imports the norm carrier; it does not recreate the quadratic Brauer comparison. |
| ClassicalArithmeticCompletion §§1.14, 1.24–1.25, 1.44, 1.52 | Scalar norm-residue pairing, place factors, Steinberg properties, invariant sign and product law exist. At ℚ₇,m=3 the Artin-first factor ζ² differs from its transpose ζ. |
| ArithmeticKTheory §§5.2, 6.1, 6.3 (additional ownership check) | Earlier owner of the S-integer comparisons: S01. No other supplied sibling claims the new generic conic or the specified all-degree monomial/corner construction. |

The additional object search found K2SymbolsBrauer's §§10.32a–10.32b equal-characteristic prime-order cyclic-algebra specialization. It does not own the arbitrary-field, arbitrary composite-degree monomial construction or the reducible-radical corner comparison. Its positive, transposed normalization agrees with the package after exchanging arguments: over F₇((t)), ζ=2, the class {2,t} has invariant 2/3 and positive-coordinate value 4, whereas {t,2} has invariant 1/3 and positive-coordinate value 2. The package's Artin-first values are their inverses. The generic crossed-product and central-simple infrastructure is already supplied; the specified presentation and its comparison remain this package's work.

Both gap slugs match exactly between README and design/plan.json; both have an earlier named supplier and exact coefficient/field hypotheses. The field-cup-residue-coherence contract requests compatibility, not a second construction of finite twists. The distinct adic Tate and global-field Picard map requirements remain conditional inputs; absence of those implementations today is not a finding. S01 is the minimality defect in the arithmetic contract's already owned ring-isomorphism component.

The 22 supplied sibling folders were searched, together with all board packages and main/Completed, for K₂, Milnor symbols, finite Chern operations, roots/twists, cyclic algebras, Brauer comparisons and the conic object. The service also searched the main/open-head index. No existing declaration has any of the three fully qualified names in this acceptance file. Earlier owners of the generic Kummer, Brauer, tensor and quadratic-symbol APIs are consumed, not redeclared. No additional ownership claim is based merely on a coincidentally similar name.

### Pinned API and proof-input checks

The pins in lake-manifest.json are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The following local reads resolve the native claims and the potentially unowned proof inputs.

| Pinned file and line | Declaration / actual scope |
| --- | --- |
| Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean:461,516 | IsPrimitiveRoot.zmodEquivZPowers is an additive equivalence to powers; zpowers_eq additionally uses a domain and nonzero order. Neither supplies all integer-weight twists by itself. |
| Mathlib/LinearAlgebra/TensorProduct/Basic.lean:126 | TensorProduct.lift.tmul evaluates a real bilinear lift on pure tensors. This makes the contraction API a routine consequence, not an acceptance headline. |
| TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean:125,129,135 | KummerCoeff is Additive rootsOfUnity in the separable closure, with discrete topology and continuous Galois action. Discreteness does not say that action is trivial. |
| TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:249,277,322,330 | kummerMap, its cocycle identification, kernel and power criterion exist under IsUnit (m:F). The multiplicative H¹ type tag is part of the map. |
| TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/Product.lean:595,790 | explicitCup11 uses a continuous equivariant biadditive pairing; the negative-flip theorem also flips that pairing. |
| TauCeti/NumberTheory/ClassFieldTheory/Local/Symbol.lean:165 | kummerCupPairing supplies the actual root pairing, with primitive-root and nonzero-order hypotheses. |
| TauCeti/NumberTheory/ClassFieldTheory/Brauer/RootsOfUnity.lean:89,103 | h2MuEquivZMod and toRatAddCircle_h2MuEquivZMod use a nonarchimedean local field and field invertibility. They identify k with k/m, not with the zero element m·(k/m). |
| TauCeti/NumberTheory/ClassFieldTheory/Brauer/Torsion.lean:58,96,110 | h2MuToBr is field-generic; injectivity and its m-torsion image require the stated invertibility. |
| TauCeti/NumberTheory/ClassFieldTheory/Brauer/Invariant.lean:193,277,327 | invMap and its restriction/corestriction rules exist: restriction multiplies the invariant by extension degree, corestriction preserves it. |
| TauCeti/Algebra/CrossedProduct/Comparison.lean:267,295,305 | brauerCohomologyEquiv goes from the additive algebraic Brauer group to continuous H²; the crossed-product formula requires the finite Galois intermediate extension. Its inverse transports the class back. |
| TauCeti/Algebra/CrossedProduct/CupProduct.lean:318 | brauerCohomologyEquiv_quaternionClass supplies the ordered quadratic comparison under characteristic not 2. |
| TauCeti/NumberTheory/HilbertSymbol/Basic.lean:46,56 | hilbertSymbol is the norm-equation sign on units over any field; its basic positive-value criterion does not assume characteristic not 2. The new conic equivalence correctly adds that assumption. |
| TauCeti/Algebra/CentralSimple/BaseChange.lean:131 | IsSimpleRing.of_baseChange descends simplicity along a faithfully flat extension. A field splitting extension has the required faithful flatness. |
| TauCeti/Algebra/Central/BaseChange.lean:115 | Algebra.IsCentral.of_baseChange supplies centrality descent in its stated nontrivial scalar-extension setting. This is available for the splitting field in §2.2. |

Object searches at both pins found no classical/Milnor K₂ presentation, the specified symbol-algebra carrier, or the completed finite K-theory construction needed to state the other headline theorems directly. The generic tensor algebra, matrix and crossed-product APIs do exist. Their existence does not make the nontrivial monomial algebra construction a simple acceptance-file definition.

### Dependency direction and package policy

The read-only dependency command returned exactly:

```text
depcheck: 23 roadmaps, 192 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. ArithmeticKTheory is at merge-order line 85 and K2SymbolsBrauerPartII at line 87, so S01's additional supplier reference also respects the order. No merge-order file was changed. Each internal dependency was compared with the layer order: coefficients precede the algebra comparison; local comparisons precede the all-place assembly; the Tate supplier is not proved from the downstream dictionaries. Layer 4 is expressly a compatibility check, not an input needed to construct the supplier's Tate map.

The citation resolver found no unresolved roadmap citations or Lean names. Its missing-package warning was not treated as evidence about the libraries: the actual local pins were searched independently, as recorded above.

The git diff from origin/main to the reviewed head contains seven files, all within packages/K2SymbolsBrauerPartII, with 1,051 inserted lines. README and docstrings contain no pull-request numbers or workflow instructions, and no source passage was copied into this report. Suggested.lean has one import Mathlib and one existing Tau Ceti module import, one module docstring, the required namespace, a matching layer heading, a real definition and two sorry theorems. It has no lemma, set_option, sorry data, admitted example, placeholder, extra import or unrelated API catalogue. No computational algorithm is made a roadmap target. Matrix formulas specify algebraic constructions and proofs.

The unrelated adversarial classes do not introduce missing hypotheses here: a Field excludes the zero ring; every algebra dimension is finite m²; tensor and matrix carriers use actual finite indices; empty global support is allowed but the Picard S is explicitly nonempty; the local arithmetic input supplies completeness and finite residue field; nonreduced or nonsmooth general schemes are not asserted to satisfy the field/DVR comparison. The zero target algebra in the universal property is harmless, as computed in the statement ledger. No natural-number division by zero, out-of-range Fin index, unmarked universe shift, arbitrary topology, rank-zero nonvacuity premise, or properness-to-finiteness inference occurs in the retained Lean declarations.

## Not verifiable

- No Lean command was run, as required by the read-only brief. All three provided elaborated signatures were compared with the source and README; compilation was not independently repeated and the two admitted theorems were not proved by the kernel.
- The two declared supplier extensions are future contracts. Their implementation and commutative diagrams cannot be verified at this head. Acceptance of the corresponding mathematical interfaces is conditional on those contracts, with the minimality correction in S01.
- The statements that RefinedTraceMethods and EllipticKTheory will use these outputs are prospective consumer descriptions. Their future use was not certified; neither is an input used to justify a theorem here. ArithmeticKTheory's actual existing ownership was checked separately and is S01.
- No source text remains inaccessible: all four cited works and the 32 locator groups above were readable in the supplied legal cache. There is no new missing-reference request.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "396062eb35c6db5af7b647371ee83e1c4d20d4d6", "job": "RT-K2SymbolsBrauerPartII~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
