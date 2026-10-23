# Repair report: K2SymbolsBrauerPartII

The finding IDs below are the original IDs; the paragraph identifies review r2a or r2b. The overlapping ownership findings share one repair. No finding is omitted. Changes are confined to `packages/K2SymbolsBrauerPartII/README.md`, the top-level gaps of `packages/K2SymbolsBrauerPartII/design/plan.json`, and this report. No commit was made.

## F01 (P2) — applied differently

Review r2a. Ring-isomorphism construction in the arithmetic gap → imports from ArithmeticKTheory §§5.2, 6.1, 6.3. The map comparisons remain §5.3 targets here: assigning comparison with ArithmeticKTheory back to its supplier KTheoryFiniteLocalFields would reverse supply. Scope, exact contracts, §5.3, Layer 5 dependencies and downstream wording agree. The real dyadic Check now includes every r≥1.

## F02 (P3) — applied

Review r2a. Agreement of two vanishing all-place expressions → the singleton-place cubic Check in §4.3. For F=ℚ(μ₃), ζ reducing to 2 at v above 7 and x={3,7}, the invariant is 1/3 and λ_v(x)=ζ⁻¹. Inverting all factors produces ζ at v, while both complete products remain 1.

## F03 (P3) — applied

Review r2a. Deleted the repeated general naturality Checks in §§1.5 and 5.4; their target/API requirements remain. Both sections retain three Checks. The same pattern in §4.1's root transport and §5.3's localization-composition Check now has explicit roots and residue values. Section 5.4's CRT Check now computes its nonzero Bockstein over 𝔽₅. No Lean padding was added.

## F01 (P3) — applied

Review r2b. ArithmeticKTheory as a downstream user → earlier supplier, using the shared repair for r2a F01. The supplied order puts ArithmeticKTheory at 85 and this package at 87. Downstream prose now addresses later arithmetic roadmaps; RefinedTraceMethods and EllipticKTheory are described as possible users, avoiding an unsupported assertion that their texts already import this package.

## F02 (P2) — applied differently

Review r2b. Two compound gaps → six contracts: field cups, DVR residues, adic symbol/diagram, conditional adic torsion, global adic torsion, and the global Picard sequence. Every consumer and plan slug was updated. The suggested extra ring-isomorphism gap is omitted because ArithmeticKTheory owns it. The adic symbol, conditional theorem and global specialization are separated further because their hypotheses differ.

## Verification outcomes

`Suggested.lean` elaboration, run from the content checkout with `lake env lean` on `packages/K2SymbolsBrauerPartII/Suggested.lean`: **exit 0**. The only diagnostics, with paths expressed relative to the repository, were:

```text
packages/K2SymbolsBrauerPartII/Suggested.lean:34:8: warning: declaration uses `sorry`
packages/K2SymbolsBrauerPartII/Suggested.lean:41:8: warning: declaration uses `sorry`
```

The imported Tau Ceti object was present, so no targeted build was needed. No Lean process remains running.

A separate scratch copy containing all three declarations and `#check @` for each elaborated with **exit 0**, the same two expected warnings, and these signatures:

```lean
TauCetiRoadmap.K2SymbolsBrauerPartII.conicSymbol :
  (F : Type u_1) → [Field F] → F → F → ℤˣ
TauCetiRoadmap.K2SymbolsBrauerPartII.conicSymbol_real_eq_neg_one_iff :
  ∀ (r s : ℝ),
    TauCetiRoadmap.K2SymbolsBrauerPartII.conicSymbol ℝ r s = -1 ↔ r ≤ 0 ∧ s ≤ 0
@TauCetiRoadmap.K2SymbolsBrauerPartII.conicSymbol_eq_hilbertSymbol :
  ∀ {F : Type u_1} [inst : Field F], 2 ≠ 0 → ∀ (r s : Fˣ),
    TauCetiRoadmap.K2SymbolsBrauerPartII.conicSymbol F ↑r ↑s = TauCeti.hilbertSymbol r s
```

Each matches README §§3.3–3.4. No section binder is lost; no Lean declaration, hypothesis or docstring required a change. Reading the pinned norm-equation definition leaves a quadratic-solubility equivalence, rather than an imported one-tactic theorem. The two exceptional-coordinate cases are calculated in the table below.

The prescribed dependency command, using this package's README, name K2SymbolsBrauerPartII, the supplied order and `--movable`, returned **exit 0**:

```text
depcheck: 25 roadmaps, 220 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Citation resolution returned **exit 0**, with no unresolved cross-roadmap citation or own Lean name. Its external-library scan was unavailable; the pinned declarations were inspected directly instead. `git diff --check` returned **exit 0**, with no output. No gate failures were supplied with the job.

## Source and ownership evidence

All four manifest works were readable in their supplied legal cache extractions; no additional work or missing-reference request was needed. The existing four lifetime keys and provenance remain unchanged. The following locators, in the authors' own mathematical conventions, support the repairs and the sign calculations; no source passage has been copied into the package.

| Input | Verified locator and use |
| --- | --- |
| weibel | weibel line 13376, III.6.2.1, p.232: real sign; line 13394, III.6.2.2, p.233: conic criterion and the locality restriction on bilinearity; lines 13406–13451, III.6.2.3–6.2.5, pp.233–234: local roots, section and dyadic value. |
| weibel | weibel line 13461, III.6.3, p.234: uniformizer-first tame convention, converted to the base roadmap's inverse. |
| weibel | weibel lines 13858–13895, III.6.9–6.9.2, pp.240–241: YX=ζXY and the algebra/Brauer symbol. The insufficient minimal-polynomial hypothesis at line 13884 is not used. |
| weibel | weibel lines 13950–14012, III.6.10.1–6.10.4, pp.242–243: Kummer, ordered cup, projection formula and root-dependent Brauer transport. |
| weibel | weibel line 31435, VI.8.6, p.515: finite S-integer comparison with the coefficient invertible on the ring. This is a comparison citation, not a special-value target. |
| milne | milne line 4957, III.3, Proposition 3.6, p.109: character/Artin/invariant formula; lines 5071–5146, III.4, Steps 3–4 and Remark 4.5, pp.112–114: ordered cup and transposed Artin argument. |
| milne | milne lines 8075–8150, V.5, Proposition 5.2, Theorem 5.3 and Example 5.4, pp.178–179: place factors, finite support and product law; line 10042, VII.8.1(b), p.221: Brauer-invariant sum. |
| tate | tate lines 235–260, Theorem 3.1, p.262; line 287, Lemma 3.2, p.263; lines 297–344, Diagram 3.3, pp.263–264: adic cup symbol, transfer and coefficient diagram. |
| tate | tate lines 354–360, Theorem 3.5(b) and corollary, p.265: mod-ℓ injectivity and torsion modulo its maximal divisible subgroup. The kernel statement for all K₂ uses maximal ℓ-divisibility; the torsion corollary uses divisibility within the ℓ-primary torsion group, exactly as in the split contract. |
| tate | tate line 463, Proposition 4.5, p.267; line 485, corollary, p.268; line 493, Theorem 5.1, p.268: finite local and global symbols. |
| tate | tate lines 542–566, Equation 5.3 and Theorem 5.4, pp.269–270: finite tame kernel, global torsion, no divisible subgroup and the actual adic map. |
| tate | tate lines 575–607, Theorem 6.2 and proof, pp.270–271: every global field, finite nonempty S, root containment, Picard map and sum-zero local target; line 597 fixes the uniformizer-last tame value. |
| soule | soule lines 1276–1286, Proposition 2.2.2.3, p.42; lines 1447–1469, §2.2.3.2 and Lemma 2.2.3.2.1, pp.46–47; lines 1523–1555, Proposition 2.2.3.3 and remark, p.49: product coefficient, finite reduction and limits on finite-by-finite multiplication. |
| soule | soule lines 1693–1749, §2.2.4.4, pp.53–55: negative degree-two cup and the Picard kernel. Root containment in that proof is retained when discussing its route; the general ring comparisons are imported from ArithmeticKTheory. |

The content checkout is main a07e202. Its manifest and actual checkouts agree on Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Cross-roadmap references were resolved at main or the supplied open heads, then inspected by object and section:

| Supplier | Resolved ownership and interface |
| --- | --- |
| ArithmeticKTheory | Supplied head, §§5.2, 6.1, 6.3. Section 5.2's arithmeticMotivicDescent and arithmeticEtaleComparison specify coefficient, restriction/corestriction and localization maps; §6.1 at i=1 specifies degree-two comparisons; §6.3 at n=2 supplies ordinary H² at real dyadic places. It consumes KTheoryFiniteLocalFields §3.0a, so the added dependency runs from it to this package, never back to that supplier. |
| KTheoryFiniteLocalFields | Roadmap service head: §§1.1, 1.8, 3.0a, 3.1–3.3, 7.3. Its coefficient exactness, early Chern maps, common norm-residue carrier, full-root power maps, section and completion transports remain imports. The six declared gaps do not request another finite field norm-residue isomorphism or another ring comparison. |
| K2SymbolsBrauer | Roadmap service head: §0.4, §§5.1–5.2, 7.1–7.3, 8.1–8.3, 12.5 and tame/localization layers. The field presentation, Milnor adapter, computed ε=−1, product normalization and real sign retain this owner. |
| EtaleCohomologyFoundations | Main, §F.0.3 and §§F.4.1–F.4.2: finite integer twists, normalized adic systems and derived realization with Milnor terms. Splitting field comparison from residue comparison does not turn either compatibility gap into a claimed existing theorem. |
| SchemeAndStackFoundations | Main, §§2.11, 2.15: Kummer with coefficient invertibility for the étale form and field comparison with discrete Galois modules. |
| ClassicalArithmeticCompletion | Main, §§1.14, 1.24, 1.25, 1.44, 1.52: arithmetic scalar pairing, place factors, universal convention comparison and reciprocity. Section 1.44's cubic calibration uses (7,2)=4 and (2,7)=2; the {3,7} calibration here has the same Artin-first orientation. |
| ClassFieldTheory | Main, Layers 5, 6, 10, 14: actual invariant coordinate, arithmetic Artin formula, real invariant 1/2, complex zero, finite support and global laws. |
| QuadraticFormInvariants | Main, §§6C, 6E, 7B: unit-input norm sign, cohomological comparison and actual algebraic/cohomological Brauer equivalence. The total conic sign retains its different domain. |
| GeneralAlgebraicKTheory | Roadmap service head, §§1.7–1.8, Layer 5, §§7.4–7.5: stable cofibers, K-spectrum and ordered integral products. |

The roadmap service's object searches covered main and indexed open heads; direct searches also covered the board package and all 24 sibling checkouts supplied in the brief. ArithmeticKTheory's existing S-integer ownership is the overlap requiring repair. No different owner was found for the specified degree-m monomial algebra, its selected matrix corner, or the total conic sign. These are comparisons/extensions of the base roadmap's objects, not new generic cohomology or K-theory carriers. Main examples consulted for prose shape were ClassicalArithmeticCompletion, EtaleCohomologyFoundations and RestrictedPowerSeries. No new Lean name collides with another roadmap; no Lean name was added.

Pinned APIs were checked by object as well as declaration name:

| Pinned file | Exact declarations/conditions inspected |
| --- | --- |
| Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean:461,516 | IsPrimitiveRoot.zmodEquivZPowers and IsPrimitiveRoot.zpowers_eq; the latter has nonzero order and integral-domain hypotheses. |
| TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean:125 | KummerCoeff is the additive roots-of-unity subgroup in the separable closure. Its discrete topology is at line 129 and continuous action at line 136; the definition does not assert trivial action. |
| TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:249,277,322,330 | kummerMap, kummerMap_eq_kummerCocycleClass, ker_kummerMap, kummerMap_eq_one_iff, with IsUnit (m : F). |
| TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/Product.lean:595,790 | explicitCup11 and explicitCup11_eq_neg_flip, retaining continuity, equivariance, input order and flipped coefficient pairing. |
| TauCeti/NumberTheory/ClassFieldTheory/MuNRep.lean:137 | muNRep is the transported representation of the same native Kummer module. |
| TauCeti/NumberTheory/ClassFieldTheory/Local/Symbol.lean:165 | kummerCupPairing uses the primitive-root logarithm and scalar multiplication, under NeZero m and a primitive root; it is field generic. |
| TauCeti/NumberTheory/ClassFieldTheory/Brauer/Torsion.lean:58,96,110 | h2MuToBr, h2MuToBr_injective and h2MuToBr_range, with coefficient invertibility for injectivity and range. |
| TauCeti/NumberTheory/ClassFieldTheory/Brauer/RootsOfUnity.lean:89,103 | h2MuEquivZMod and toRatAddCircle_h2MuEquivZMod with local-field and IsUnit hypotheses. |
| TauCeti/NumberTheory/ClassFieldTheory/Brauer/Invariant.lean:193 | invMap, normalized by the actual local invariant. |
| TauCeti/Algebra/CrossedProduct/Comparison.lean:267,295 | brauerCohomologyEquiv and brauerCohomologyEquiv_crossedProductClass, in the algebraic-to-cohomological direction used here. |
| TauCeti/Algebra/CrossedProduct/CupProduct.lean:318 | brauerCohomologyEquiv_quaternionClass with invertible 2 and ordered Kummer cup. |
| TauCeti/NumberTheory/HilbertSymbol/Basic.lean:46,56 | hilbertSymbol and hilbertSymbol_eq_one_iff: unit-input sign of b=x²−ay², without a locality hypothesis in the definition. |
| TauCeti/FieldTheory/GaloisCohomology/MuTwo/LocalSymbol.lean:185 | hilbertSymbol_eq_cohomological with invertible 2 and specified primitive root/invariant coordinate. |

Searches of both pinned trees found the tensor, quaternion, crossed-product and Brauer infrastructure, but no classical/Milnor K₂ carrier, specified degree-m symbol-algebra carrier, K-spectrum finite-group carrier or coherent all-weight field comparison supplying the missing headlines. Constructing them would exceed a simple acceptance-file definition. The unchanged module docstring therefore still lists those headlines as not statable, while both statable conic headlines remain stated.

## Adversarial mathematics pass

Rows record computations, not proofs of the entire proposed library. Repeated uses of a convention refer to the same named computation, so the Layer 2 algebra, Layer 3 scalar, Layer 4 factor and Layer 5 Chern values can be compared directly. “Retain” means no repair is indicated by these instances; it is not independent acceptance. All repaired contracts are included. Arithmetic computations of residues, roots, CRT, factorial and the exceptional conic coordinates were also recomputed in scratch with exact integer/rational arithmetic.

| Statement | Instances tried | Computed values on the stated sides | Result | Change |
| --- | --- | --- | --- | --- |
| Native carrier boundaries | zero ring; putative field of size 1; square-zero element ε in F | 0=1 contradicts Field nontriviality; q≥2; ε²=0 implies ε=0 | Nonreduced and zero-ring inputs excluded by Field | Retain |
| Standing field/coefficient domain | 𝔽₂,m=1; 𝔽₂,m=2; m=0 | 1 is a unit; 2=0 is not a unit; m=0 excluded | No zero coefficient Kummer case | Retain |
| Quotient versus torsion versus finite K-group | 𝔽₅,m=6 | K₂/6=0; K₁[6]=C₂; K₂(;ℤ/6)=C₂ | Three objects differ | Concrete §5.4 Check |
| Additive K₂ and multiplicative roots | ℝ, x={−1,−1} | x+x=0; (−1)(−1)=1 | Correct type-tag normalization | Retain |
| Native Kummer action | ℚ,m=3, complex conjugation | ζ↦ζ²; on ζ⊗ζ exponent 2²=1 mod 3 | μ₃ nontrivial; weight two trivial | Retain |
| Kummer cocycle direction | ℝ,m=2,a=−1, α=i | conjugation(i)/i=−1; additive class 1 mod 2 | Matches gα/α | Retain |
| Kummer power-slot kernel | ℚ,m=2,a=4 | κ(4)=0 since 4=2²; κ(−1)≠0 | Zero map excluded | Retain |
| Ordered cup action | S₃ acting on 𝔽₃³, g=(12),h=(23), coboundaries of e₁,e₂ | (e₂−e₁)⊗(e₃−e₁); omission of g gives (e₂−e₁)⊗(e₃−e₂) | Distinct tensors detect action | Retain |
| Negative-flip cup law | ℚ₇,m=3,{3,7} and {7,3} | contracted invariants 1/3 and 2/3; −2/3=1/3 | Both orders consistent | Retain |
| e_m coordinate | m=3, invariant 1/3 | e₃(1/3)=1 mod 3; 3·(1/3)=0 in ℚ/ℤ | Wrong multiplication coordinate excluded | Retain |
| Arithmetic Frobenius | ℚ₇, α³=3 | Frob α/α reduces to α⁶=9=2 mod 7 | Root ratio is ζ, not rational 2 | Retain |
| Uniformizer-last convention | ℚ₇,{3,7} | ∂ᴹ=3; Weibel's inverse convention gives 5 mod 7 | Conventions distinguished | Separate residue gap |
| Raw versus normalized product | cubic ordered symbol, ε=−1 | normalized product is θ₂(−x); raw inverse image is −x | Sign fixed by base §8.1 | Retain |
| Chern versus Artin signs | ℚ₇,m=3,{3,7} | cup invariant 1/3; Artin scalar ζ²; normalized Chern invariant 2/3 | Distinct maps have distinct signs | Retain |
| Field cup coherence contract | ℚ,m=3 and ℝ,m=2 | no scalar μ₃ basis over ℚ; real ordered cup has invariant 1/2 on both models | Root-free scope essential | Split gap |
| Field transfer including inseparability | 𝔽₃(t)⊂𝔽₃(s), s³=t, m=2 | norm(s)=t; res κ(t)=κ(s³)=κ(s); degree factor 3=1 mod 2 | Inseparable case retained | Split gap |
| Field adic coefficient coherence | ℝ,ℓ=2, all r≥1 | H²(ℝ,ℤ₂(2))=C₂; H²(ℝ,ℤ/2^r(2))=C₂; generator reduces to generator | No inverse-limit group substitution | Split gap |
| DVR residue contract | ℚ₇,m=3,u=3,π=7 | ∂κ(π)=1; ∂(κ(3)∪κ(7))=−κ(3), class order 3 | Minus is detectable | Split gap |
| Residue invertibility domain | ℚ₂,m=2 and 𝔽₂((t)),m=3 | 2 not invertible in 𝔽₂; 3=1 invertible in 𝔽₂ | First residue formula excluded, second allowed | Split gap |
| Adic symbol/diagram contract | ℝ,ℓ=2,x={−1,−1} | h(x) is nonzero C₂; reduction at every 2^r remains nonzero C₂ | Fixed map, not arbitrary equivalence | Split gap |
| Conditional adic torsion contract | ℝ,ℓ=2 and ℂ,ℓ=2 | real primary torsion/D=C₂ maps to C₂; complex primary torsion/D=0 maps to 0 | Hypothesis and quotient retained | Separate conditional gap |
| Global adic torsion contract | ℚ,ℓ=2 and 𝔽₃(t),ℓ=2 | ℚ class {−1,−1} is nonzero order 2 with real image nonzero; in both global cases D=0 | Field-scope specialization retained | Separate global gap |
| Global Picard contract | ℚ,S={2,∞},ℓ=2 | Pic=0; (C₂⊕C₂)sum=0=C₂; K₂(O)/2=C₂ | Real and dyadic terms both needed | Split gap |
| Global Picard function-field scope | 𝔽₃(t),S={∞},ℓ=2 | Pic(𝔽₃[t])=0; K₂(𝔽₃[t])=0; singleton sum-zero C₂=0 | 0→0→0→0 | Split gap |
| Ring-comparison owner and generality | ℤ[1/2],ℓ=2,r≥1 | K₂(O)⊗ℤ₂=C₂ and H²_cont(O,ℤ₂(2))=C₂; finite pairs also C₂ | Real dyadic row retained | Import ArithmeticKTheory |
| §1.1 ordered concrete dictionary | ℚ₇,m=3,{3,7} | h and continuous cup both have contracted invariant 1/3 | Zero/inverse comparison fails | Gap reference updated |
| §1.1 Steinberg law | ℝ,m=2,{−1,2} | κ(2)=0; h=0; β=0 | Different from {−1,−1} | Retain |
| §1.1 m-th-power law | ℚ₇,m=3,{27,7} | κ(27)=0; cup=0; h=0 | Actual Kummer kernel used | Retain |
| §1.1 root-free construction | ℚ,m=3 | μ₃(ℚ)=1; tensor μ₃⊗μ₃ still rank-one mod 3 | Missing base root does not remove h | Retain |
| §1.1 coefficient reduction | ℝ,4→2,{−1,−1} | nonzero class in H²(C₂,ℤ/4(2)) reduces to nonzero in H²(C₂,ℤ/2(2)) | Not the zero coefficient map | Retain |
| §1.1 field restriction | ℝ→ℂ,m=2 | Hamilton cup 1/2 restricts to 0; K₂ quotient maps C₂→0 | Both routes give 0 | Retain |
| §1.2 primitive-root basis definition | m=5,j=1,ζ | τ(1)=ζ, τ(2)=ζ²; inverse(ζ²)=2 | Wrong root basis excluded | Retain |
| §1.2 weight zero | m=5,j=0; m=1 | τ(2)=2 mod 5; unique 0↦0 mod 1 | Root independent | Retain |
| §1.2 weight one native agreement | m=5, exponent 3 | both primitive-root adapters send 3 to ζ³ | Compatible chosen generator | Retain |
| §1.2 positive tensor coherence | m=5, weights 1+1,ζ↦ζ² | basis scalar 2·2=4; weight-two scalar 4 | Equal | Retain |
| §1.2 dual evaluation | m=5,weights 1,−1,ζ↦ζ² | factors 2 and 3; evaluation 2·3=1 mod 5 | Wrong dual factor 2 gives 4 | Retain |
| §1.2 arbitrary integer tensor coherence | m=5,weights 2+(−1) | factors 4·3=2; weight-one factor 2 | Equal | Retain |
| §1.2 equivariance hypothesis | ℚ,m=3 versus ℚ(ζ₃) | conjugation ζ→ζ² over ℚ; all base-field roots fixed over ℚ(ζ₃) | Abstract cyclic model insufficient | Retain |
| §1.3 contraction definition | m=5,ζ²⊗ζ³ | c=ζ⁶=ζ; root multiplication=ζ⁵=1 | Wrong pairing excluded | Retain |
| §1.3 bilinearity | m=5,exponents (1+1,3) | 2·3=1 mod 5; 1·3+1·3=1 mod 5 | Equal | Retain |
| §1.3 zero-tensor law | m=5,1⊗ζ² | c=1; wrong root multiplication=ζ² | Additive zero is root 1 | Retain |
| §1.3 native tensor lift | m=5,ζ²⊗ζ³ | native logarithm gives 2•ζ³=ζ; tensor lift gives ζ | Existing pairing used | Retain |
| §1.3 equivariance | m=3,roots in base field | gζ=ζ, so g(c(ζ⊗ζ))=ζ=c(gζ⊗gζ) | Equal | Retain |
| §1.3 uniqueness on pure tensors | m=3,generating ζ⊗ζ | prescribed image ζ≠1 excludes zero map; a linear map is fixed by this generator | Unique map | Retain |
| §1.3 trivial coefficient | m=1 | source=target=0; c(0)=0 | No exceptional root choice | Retain |
| §1.4 Brauer symbol definition | ℝ,m=2,{−1,−1} | cup contracts to Hamilton class; β invariant=1/2 | Zero model excluded | Retain |
| §1.4 quotient factorization | ℚ₇,m=3,x={3,7} | β(3x)=3·1/3=0 | Mod-m domain correct | Retain |
| §1.4 torsion | same x | 3β(x)=0 while β(x)=1/3≠0 | Exact target Br[3] | Retain |
| §1.4 symbol formula | ℚ₇,m=3,{3,7} | contracted ordered cup=1/3=β(x) | Inverse fails | Retain |
| §1.4 algebraic transport | ℝ,m=2 | quaternion [ℍ] maps to cup invariant 1/2; split algebra maps to 0 | Both values fixed | Retain |
| §1.4 uniqueness on symbols | cubic generator x and 2x | prescribed values 1/3 and 2/3; zero/inverse maps disagree on x | Symbol generation applicable | Retain |
| §1.4 field Picard premise | Spec ℚ versus a ring with Pic/ℓ≠0 | Pic(ℚ)=0; nonzero ring Picard class has nonzero Kummer image and zero Brauer image | Field argument not reused on rings | Retain |
| §1.4 Steinberg and power laws | ℝ,{−1,2}, m=2; m=1 | β=0 in first case; Br[1]=0 in second | Both vanish for the stated reasons | Retain |
| §1.5 all-weight root change | m=5,u=2,j=1,2,−1 | scalars 2,4,3 respectively | Different weights detected | Retain |
| §1.5 inverse weight-two change | m=5,u=2 | u⁻²=3²=4 mod 5 | Different from contraction factor 3 | Retain |
| §1.5 contraction root change | m=5,fixed tensor ζ²⊗ζ³ | c_ζ=ζ; c_(ζ²)=ζ³=3c_ζ | Inverse first power correct | Retain |
| §1.5 Brauer root change | ℚ(ζ₃),x={3,7}, chosen v | invariants 1/3→2/3 under ζ→ζ² | Nonzero class distinguishes sign | Retain |
| §1.5 field naturality | ℚ₇⊂unramified quadratic E, cubic x | inv res β=2·1/3=2/3; β of transported symbol=2/3 | Both routes nonzero | Retain target; remove uninstantiated Check |
| §1.5 identity law | identity on ℚ₇,cubic x | 1·1/3=1/3 on both routes | Adapter fixes class | Retain target |
| §1.5 composition law | unramified degrees 2 then 3 over ℚ₇ | 3·(2/3)=0; direct 6·(1/3)=0 | Same composite | Retain target |
| §1.6 residue dictionary | ℚ₇,{3,7},m=3 | ∂ᴹ=3; −κ(∂ᴹ)=−κ(3)=∂h; κ(3) order 3 | Inverse cohomology class required | Residue gap reference |
| §1.6 unramified-unit law | ℚ₇,{2,3},m=3 | ∂ᴹ=1; κ(1)=0; cup residue=0 | No ramification | Retain |
| §1.6 wild exclusion | ℚ₂,{−1,−1},m=2 | tame=1; Hilbert=−1; residue coefficient 2=0 | Tame square cannot apply | Retain |
| §1.6 m=1 | every symbol | K₂/1=0; both finite residues=0 | Consistent zero modules | Retain |
| §2.1 finite-free algebra | m=2 and m=4 | dimensions 4 and 16 before radical choice | Not radical-field dimension | Retain |
| §2.1 multiplication/order | m=3, e_(0,1),e_(1,0) | YX=ζe_(1,1); XY=e_(1,1) | jk exponent correct | Retain |
| §2.1 carries | m=3 | e_(2,0)e_(1,0)=a e_(0,0); e_(0,2)e_(0,1)=b e_(0,0) | Powers a,b recovered | Retain |
| §2.1 unit and associativity | m=3, indices (2,2),(2,1),(1,2) | both associations=a b ζ e_(2,2); multiplication by e_(0,0) fixes it | Carries and root exponent agree | Retain |
| §2.1 universal mapping property | m=2,a=b=1 in Mat₂(F),char≠2 | X=diag(1,−1),Y=swap; X²=Y²=I,YX=−XY; e_(1,1) maps to XY | Generator images determine map | Retain |
| §2.1 unit generators | m=3 | X·(a⁻¹X²)=1; Y·(b⁻¹Y²)=1 | No separate unit witness needed | Retain |
| §2.1 scalar-extension equivalence | ℝ→ℂ,m=2,a=b=−1 | both scalar extensions dimension 4, basis 1,X,Y,XY transported identically | Multiplication relations preserved | Retain |
| §2.1 m=1 corner convention | d=1 | A₁=F, dimension 1; no Fin 1 index 1 used | m=0 excluded | Retain |
| §2.2 splitting representation powers | m=2,α²=a | X²=aI; Y²=bI with wrap b | Root of b not needed | Retain |
| §2.2 splitting commutation | m=3,i=2 wrap | YXv₂=αζ⁻²bv₀=αζbv₀=ζXYv₂ | Last row agrees with first rows | Retain |
| §2.2 distinct eigenvalues | m=3,α≠0 | α,αζ⁻¹,αζ⁻² pairwise unequal; each difference≠0 | Interpolation denominators nonzero | Retain |
| §2.2 matrix equivalence | m=2,a=1,b=2 | displayed matrices already over F; image contains all four matrix units | Mat₂(F), despite b nonsquare | Retain |
| §2.2 central simplicity/descent | ℝ,a=b=−1,m=2 | ℍ has center ℝ,dim4; over ℂ becomes Mat₂(ℂ),dim4 | Splitting extension hypothesis needed | Retain |
| §2.2 minimal-polynomial negative control | Mat₂(D),D nonsplit quaternion, μ₄⊂F | diag(1,−1)^4=1, minimal degree 2, ambient degree 4 and Brauer class [D]≠0 | Full degree cannot be inferred | Retain |
| §2.3 radical degree/divisibility | ℚ(i),m=4,a=4,α²=2 | d=2,s=2,c=2,c²=4 | d divides m,c in F | Retain |
| §2.3 factors/idempotents | same example | T⁴−4=(T²−2)(T²+2); Y swaps two idempotents, Y² preserves each | Reducible case retained | Retain |
| §2.3 corner relations | same example | (eX)²=2e,(eY²)²=be; Y²X=−XY² | Quaternion corner dimension 4 | Retain |
| §2.3 matrix-corner equivalence | same example | dim A=16; dim Mat₂(corner)=2²·4=16 | Dimensions and relations agree | Retain |
| §2.3 d=1 | a=c^m, m=3 | s=3, corner F; Mat₃(F) dimension9=A dimension9 | Split radical included | Retain |
| §2.3 d=m | ℚ₇,m=3,a=3 | d=3,s=1,c=3; Mat₁(A)=A | Identity case included | Retain |
| §2.3 selected-root dependence | m=4,c=2 versus −2 | two factors T²−2,T²+2; changing α selects the other corner; original dimension16 unchanged | No false canonical corner claim | Retain |
| §2.4 algebra/cup class | ℚ₇,m=3,A_ζ(3,7) | cyclic invariant 1/3=contracted ordered cup; opposite gives 2/3 | Sign fixed | Retain |
| §2.4 crossed-product carry cocycle | m=3,i(g)=i(h)=2 | carry floor(4/3)=1,d=b | Cocycle uses b not b⁻¹ | Retain |
| §2.4 cochain identity | same exponents,j(g)=1 | δf=b ζ²=d ζ^(1·2) | Ordered-cup transposition accounted for | Retain |
| §2.4 proper-degree comparison | m=4,d=2,s=2 | degree-four cup equals corner cup; [Mat₂(quaternion)]=[quaternion] | Morita factor preserves class | Retain |
| §2.4 quadratic specialization | ℝ,m=2,a=b=−1 | quaternion invariant1/2=β{−1,−1} | Fixed pinned comparison used | Retain |
| §3.1 coefficient power map | w=6,m=3,full generator ξ | ξ^(6/3)=ξ²; primary projection ξ⁴ | Distinct elements | Retain |
| §3.1 local symbol formula | ℚ₇,m=3,{3,7} | N=ζ²=Art(3)(7^(1/3))/7^(1/3) | Artin-first convention | Retain |
| §3.1 wild local value | ℚ₂,m=2,{−1,−1} | N=−1 while tame=1 | Tame-only construction false | Retain |
| §3.1 unramified norm value | ℚ₃,m=2,{3,−1} | unramified quadratic norms have even valuation; v(3)=1; N=−1 | Non-norm detected | Retain |
| §3.1 odd-prime formula | ℚ₅,m=2,{5,2} | Legendre(2/5)=−1; inverse tame residue3 also nonsquare | Same quadratic value | Retain |
| §3.1 coefficient/field-isomorphism naturality | ℚ₇,m=3,ζ transported by identity | N remains ζ²; m=1 projection gives1 | Fixed coefficient map | Retain |
| §3.2 exact root order | full μ_m,ζ^e=t^m | t^(m²)=1; full-root condition implies t^m=1; ζ^e=1 | Order exactly m, not merely nontrivial | Retain |
| §3.2 section and composite | ℚ₂,m=2 | s(−1)={−1,−1},2s=0,Ns=−1 | Cyclic summand C₂ | Retain |
| §3.2 primitive pairing value | m=6,ζ² | order(ζ²)=3≠6 | Nonidentity value insufficient | Retain |
| §3.2 no kernel-divisibility inference | abstract split map ℤ⊕C₂→C₂ | section exists; kernel=ℤ,2ℤ≠ℤ | Section alone cannot imply divisibility | Retain |
| conicSymbol definition | ℝ,(0,0),(1,−1); 𝔽₃,(2,2) | no solution gives−1; (1,0) gives1; (1,1) gives4=1 and sign1 | Total field-element domain | Retain |
| §3.3 existence criterion | same pairs | sign1 iff equation has witness; (0,0) has 0≠1 and sign−1 | Both directions tested | Retain |
| §3.3 symmetry | ℝ,(0,2),(2,0) | (0,1/√2) and (1/√2,0) each give1 | Swapping witnesses preserves value | Retain |
| §3.3 unit first coefficient | arbitrary F,(1,s) | 1·1²+s·0²=1 | Value1 in every characteristic | Retain |
| §3.3 total Steinberg value | 𝔽₂,(0,1),(1,0) | 0+1=1 and 1+0=1 using (1,1) | Zeros allowed only for conic object | Retain |
| §3.3 norm bridge, ordinary coordinates | ℚ,r=2,s=−1 | conic (1,1):2−1=1; norm (1,1):1−2=−1 | Both soluble | Retain |
| §3.3 norm bridge, conic v=0 | ℚ,r=1,s=3 | conic (1,0):1; norm (2,1):4−1=3 | No division by v | Retain |
| §3.3 norm bridge, norm x=0 | ℚ,r=2,s=−2 | norm (0,1):−2; conic (3/4,−1/4):18/16−2/16=1 | No division by x | Retain |
| §3.3 bridge characteristic hypothesis | 𝔽₂(t),r=1,s=t | conic(1,0)=1; x²−y²=(x+y)²≠t | Characteristic two excluded from bridge | Retain |
| conicSymbol_real_eq_neg_one_iff | (0,0),(−1,−1),(0,2),(1,−1) | signs −1,−1,1,1; nonpositive-pair truth values true,true,false,false | Weak inequalities necessary | Retain |
| §3.3 generic bilinearity negative control | ℚ,r=3,7,21;s=−1 | all signs−1 by primitive descent at3 or7; product of first two signs1≠−1 | Locality necessary for homomorphism | Retain |
| conicSymbol_eq_hilbertSymbol | ℚ,(2,−1),(1,3); ℝ,(−1,−1) | signs1=1,1=1,−1=−1 | Units and 2≠0 retained in signature | Retain |
| §3.4 quadratic K₂ symbol formula | ℚ₂,{−1,−1} | HilbertK₂=−1=Hilbert norm sign=conic sign | Nonzero local class | Retain |
| §3.4 real comparison | (−1,−1),(1,−1) | −1 and1 in both real K₂ and conic models | Supplied real sign retained | Retain |
| §3.4 complex values | ℂ,(−1,−1) | conic (i,0) gives1; K₂ sign value1 | Archimedean complex case | Retain |
| §3.4 zero-input boundary | ℝ,(0,0) | conic−1; 0 is not a field unit | No HilbertK₂ evaluation at zero | Retain |
| §3.4 Steinberg and uniqueness | ℝ,{−1,2}; ℚ₂,{−1,−1} | prescribed values1 and−1 exclude constant map; symbols generate | Map fixed on both sign values | Retain |
| §3.5 negative-invariant formula | ℚ₇,m=3,x={3,7} | invβ=1/3,e=1,ζ⁻¹=ζ²=N(x) | Positive exponent would be ζ | Retain |
| §3.5 transposed formula | same x | H₃(7,3)=ζ=ζ^e | Opposite order positive | Retain |
| §3.5 root independence | m=3,ζ′=ζ² | new coordinate2; (ζ²)^(-2)=ζ² | Same scalar value | Retain |
| §3.5 m=1,2 | m=1; ℚ₂,m=2 | value1 with coordinate0; (−1)^1=(−1)^(-1)=−1 | Quadratic sign cannot calibrate cubic | Retain |
| §4.1 finite-place factor | ℚ,m=2,x={−1,−1},v=2 | completion N=−1; inverse root transport returns−1 in μ₂(ℚ) | Correct common target | Retain |
| §4.1 root-transport identity | ℚ(ζ₃),two places over7 | ζ→lift(2)→ζ; ζ→lift(4)→ζ; raw residues2·4=1 but transported roots giveζ² | Codomain transport matters | Concrete Check |
| §4.1 complex factor | every m,complex place | H²=0,λ=1 | Unique trivial factor | Retain |
| §4.1 real factors | ℚ,x={−1,−1},m=1,2 | μ₁ factor1; μ₂ factor−1 | No real−1 at m=1 | Retain |
| §4.1 real-domain root bound | μ₃⊂F | a primitive cube root has no real image; number of real places0 | No artificial m>2 real value | Retain |
| §4.2 finite support | ℚ,m=2,x={−1,−1} | λ₂=λ∞=−1; λ_p=1 for odd p | Support exactly {2,∞} | Retain |
| §4.2 support equality | same x | nonzero Brauer invariants at2,∞ both1/2; same two roots−1 | Both supports agree | Retain |
| §4.2 exceptional-set bound | same x | valuations of both arguments0 everywhere finite; dyadic factor still−1 | Primes above m must be allowed | Retain |
| §4.2 support of sum | y=−x | λ_v(x+y)=1 at every v; union of supports={2,∞} | Inclusion can be strict | Retain |
| §4.2 m=1 | every x | λ=1 and invariants0 at every place; both supports empty | Degenerate coefficient included | Retain |
| §4.3 product law | ℚ,m=2,Hamilton x | (−1)(−1)=1, all odd factors1 | Both exceptional places necessary | Retain |
| §4.3 invariant sum | same x | 1/2+1/2=1=0 in ℚ/ℤ | Real term necessary | Retain |
| §4.3 equivalence via coordinates | same x | coordinate sum1+1=0 mod2; (−1)^0=1 | Both directions of zero/product criterion | Retain |
| §4.3 nonzero partial-family compatibility | ℚ(ζ₃),v above7,x={3,7} | singleton sum1/3; correct productζ²; inverted productζ | Wrong sign detected | Replace vacuous Check |
| §4.3 all-place inversion negative control | complete family and its inverse | 1⁻¹=1 while partialζ² inverts toζ | Complete zero identities cannot test sign | Explicit Check |
| §4.3 sums of symbols | x+(−x) | every local product1; additive invariant1/3−1/3=0 at cubic place | Formula concerns all K₂ classes | Retain |
| §5.1 local finite Tate dictionary | ℚ₇,ℓ=3,r=1 | source cubic generator and target cup both invariant1/3 | Not an arbitrary scalar multiple | Retain |
| §5.1 wild prime scope | ℚ₂,ℓ=2 | h({−1,−1})≠0 despite 2=0 in residue field | Finite comparison retained; tame formula excluded | Retain |
| §5.1 archimedean prime powers | ℝ,ℓ=2,r≥1; oddℓ; ℂ | respective source/target quotients C₂/C₂,0/0,0/0 | No nonarchimedean-only restriction | Retain |
| §5.1 equal characteristic | 𝔽₂((t)),ℓ=3 | μ₃(F)=1; duality H²(F,μ₃^⊗2)=0; K₂/3=0 | ℓ=2 excluded by characteristic | Retain |
| §5.2 global finite comparison | ℚ,m=2 | quotient surjects onto infinitely many C₂ residues; target also infinite | “Finite coefficients” not group finiteness | Retain |
| §5.2 completion square | ℚ,m=2,Hamilton x at∞ and2 | h maps to nonzero real C₂ and dyadic quaternion1/2 by either route | Actual maps retained | Gap references |
| §5.2 adic primary torsion | ℚ,ℓ=2,Hamilton x | x order2,D=0,h_F(x) nonzero order2 by real restriction | No divisible quotient lost | Separate global gap |
| §5.2 absence of global divisible subgroup | global tame localization | divisible subgroup maps to0 in each finite residue factor; remaining image lies in finite tame kernel, hence0 | Zero subgroup, not a completion kernel | Separate global gap |
| §5.2 coefficient and transfer compatibility | unramified degree2 overℚ₇,cubic class | res invariant1/3→2/3; cor res=2·1/3=2/3 | Projection formula degree retained | Separate adic gap |
| §5.3 adic ring comparison | ℤ[1/2],ℓ=2,x={−1,−1} | x⊗1 generatesC₂; supplied H²_cont image generatesC₂ | Earlier owner supplies isomorphism | Import ArithmeticKTheory |
| §5.3 finite ring comparison | same O,r≥1 | x mod2^r generatesC₂; supplied finite H² image nonzeroC₂ | Real dyadic scope preserved | Strengthen Check |
| §5.3 adic generic-restriction dictionary | same x,then real completion | res of ring adic image and h_F(loc x) both nonzeroC₂ | Source x⊗1 explicitly specified | Restate target on actual maps |
| §5.3 finite generic-restriction dictionary | same x,r=1,then real completion | both paths give Hamilton invariant1/2 | Not chosen up to scalar | Restate target |
| §5.3 finite-reduction square | same x,all r≥1 | adic generator→finite generator; finite comparison of x mod2^r gives same nonzeroC₂ | Coefficient maps fixed | Retain comparison target |
| §5.3 S-enlargement/composition | ℚ,S={2,∞}⊂{2,3,∞}⊂{2,3,5,∞} | Hamilton class remains nonzero by real restriction; tame values at3,5 are1; cohomological residues0 | Both composites have these values | Concrete Check |
| §5.3 residue-column sign | ℚ₇,m=3,{3,7} | tame3; −κ(3)≠+κ(3) | Cubic column detects inversion | Concrete Check |
| §5.3 Picard kernel | global μ_ℓ⊂F and nonzero class z⊗c | supplied injection sends z⊗c≠0 to nonzero class; generic restriction sends it to0 | Integral injectivity does not imply quotient injectivity | Retain |
| §5.3 weight-one Kummer row | SpecF versus O with Pic(O)/ℓ≠0 | field kernel0; ring Picard class maps nonzero to H² and zero to Br[ℓ] | Weight one not replaced by weight two | Retain |
| §5.3 omitted coefficient prime | ℤ,ℓ=2,S={∞} | 2 not a unit; residue at2 has characteristic2 | Outside invertible-coefficient ring hypotheses | Retain |
| §5.4 coefficient cofiber | m=1 | cofiber(id)=0, quotient0,boundary target0 | No invertibility needed | Retain import |
| §5.4 actual reduction image | 𝔽₅,m=6 | K₂/6=0=ker(Bockstein); middleC₂ maps isomorphically to μ₆=C₂ | Cannot identify full middle with quotient | Retain import |
| §5.4 nonzero root quotient | ℝ,m=2 | K₁[2]=μ₂=C₂≠0 | Extra quotient cannot be discarded | Retain |
| §5.4 naturality target | 𝔽₅→𝔽₂₅,m=6 | boundary root−1 maps to−1; inclusion of roots commutes | Both routes nonzero | Remove generic Check only |
| §5.4 CRT/Bockstein | 𝔽₅,m=6 | middleC₂; boundary−1; mod2 boundary(−1)^3=−1; mod3 boundary(−1)^2=1 | Components nonzeroC₂ and0 | Replace generic CRT wording |
| §5.5 normalized finite Chern identity | ℚ₇,m=3,x={3,7} | contracted h invariant1/3; Chern invariant−1/3=2/3 | Minus sign necessary | Retain |
| §5.5 integral unit-product coefficient | i=j=1 | −1!/(0!0!)=−1 | No denominator inversion modulo m | Retain |
| §5.5 even correction on reduction image | red₂ of integral x | both Bocksteins0; correction bilinear/quadratic term at(0,0)=0 | Arbitrary finite classes not included | Retain |
| §5.5 external/internal product | ℚ₇,cubic units3,7 | external coefficient−1; diagonal pullback coefficient−1 | Pullback cannot remove coefficient | Retain |
| §5.5 CRT for arbitrary m | m=6,cup coordinate1 | Chern−1=5 mod6; components1 mod2,2 mod3 | CRT reconstructs5 | Retain |
| §5.5 raw comparison scalar | ε=−1,cubic cup invariant1/3 | −εh=+h,raw Chern invariant1/3; normalized invariant2/3 | Both formulas consistent | Retain |
| §5.5 change of raw orientation | θ₂′=−θ₂,ε′=+1 | θ₂′ε′=−θ₂=θ₂ε; raw scalar changes+1→−1 | Intrinsic normalized map fixed | Retain |
| §5.5 Bockstein boundary restriction | 𝔽₅,m=6,nonzero finite class | boundary−1≠1; class not in integral-reduction image0 | No formula inferred on extra quotient | Retain |
| §5.5 trivial coefficient | m=1 | finiteK₂=0,finiteH²=0,Chern=−h=0 | No primitive root required for intrinsic formula | Retain |

## Maintainer consequences

The original gaps field-cup-residue-coherence and arithmetic-tate-symbol-maps are replaced by field-cup-coherence, dvr-residue-coherence, adic-tate-symbol, adic-tate-torsion, global-tate-torsion and global-picard-sequence. Each has exactly the matching “What … must provide (gap:…)” contract and a plan entry with supplier, section and one needs sentence. Filling those earlier-supplier gaps remains work outside this package; declaring them does not certify their implementation.

ArithmeticKTheory supplies the number-field ring constructions; §5.3 here owns equality after the specified generic restrictions and finite reduction. Its statements explicitly evaluate the adic map on x⊗1 for x∈K₂(O), avoiding an equality of maps with different domains. The Picard sequence keeps all-global-field scope and the number-field ring isomorphisms keep number-field scope. No supplier is asked to depend on a later comparison in this package or on a later ArithmeticKTheory map.

All three exported Lean names are unchanged. No other roadmap file, merge-order file, tool, source manifest or metadata was edited. The independent follow-up review is still required; this report is a repair record, not acceptance.
