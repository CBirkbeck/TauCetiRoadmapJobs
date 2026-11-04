# Repair report

## F01 (P1) — applied

Three supplier-less gaps → explicit package ownership in Scope and ownership. Retired those records from the permitted top-level gaps list; retained the generic tensor gap and the targets in §§5.3, 9.2 and 9.4. Their sources remain Dor23 line 1730, Dor23 line 2535 and Dor23 line 2550. No other plan field changed.

## F02 (P1) — applied

Number-field Weil/theta imports → MetaplecticAutomorphicForms §§4.1, 4.1a, 4.2–4.4. Updated Scope, contracts, §§6.1/6.3 and Layer 6 Dependencies. Section 6.3 now proves rational invariance by reindexing, trivial rational phases and adelic Poisson; remaining triality permutations use the rational splitting and partial transforms. Evidence: supplier §§4.5/5.1 explicitly require number fields; Dor23 line 2104–2166.

## F03 (P2) — applied

Generic coherence acceptance declarations → prose target in §5.1 alone. Deleted the structure and supporting theorem, their README names, and all references to a categorical acceptance headline. Suggested.lean lists the actual headlines and their missing carriers. GH11 line 481–500 and GH11 line 705–731 verify the retained theorem, including both compatibility equations and invertibility.

## F04 (P2) — applied

Compound quotient/constituent gap → determinant-pushforward (§6.2), sl2-rational-unipotent-generation (§6.1), and eisenstein-constituent-automorphicity (§6.3), all assigned to FunctionFieldArithmetic. Section 7.3 consumes the first two; §11.6 the third. Removed unrelated requests from §§6.2, 6.5 and 11.4; updated Layers 6, 7 and 11 Dependencies. The generation contract uses the inclusion actually asserted at Dor23 line 2425–2427.

## F05 (P2) — applied

Supplier convergence/unfolding in this package's theta objects → absolute convergence of a Godement–Jacquet double integral on compact quotient functions. Section 6.5 owns Whittaker unfolding and its positive majorant, citing Dor23 line 2181–2208; it includes a cancellation Check. Removed the global contract from local §1.5 and Layer 1 Dependencies. README and plan contracts agree verbatim.

## F06 (P2) — applied

Function-field factorization assigned to number-field GL₂ sections → AutomorphicLFunctionsAndLocalFactors, Representation prerequisites, Restricted tensor realizations. Replaced the old gap by function-field-cuspidal-multiplicity-one at AL.3, requesting ordinary multiplicity one alone, with fixed central character. Updated Scope, both supplier contracts, §11.4 and Layer 11 Dependencies. The supplier explicitly constructs function-field factorization and separately states strong multiplicity one.

## F07 (P3) — applied

Central-lattice automorphic carrier → compact functions from SmoothRepresentationsOfLocalGroups §SR.1.1 on FunctionFieldArithmetic §6.1's quotient, and unrestricted smooth functions on that quotient. Updated Scope, supplier contract, §6.2 and its Needs/Layer Dependencies. FunctionFieldArithmetic §§6.2–6.4 retain their explicit Ξ-quotient conventions. A nonzero Ξ-invariant function with unbounded central translates cannot have compact support on Γ\G.

## F08 (P3) — applied

Implicit reference-vector inputs → explicit §4.2, §5.5 and Completed/RestrictedProducts Layer 1 in §6.1 and Layer 6 Dependencies. Section 6.3 now names the vector Poisson and rational-splitting inputs instead of an unspecified function-field Weil/theta contract. Dor23 line 2032–2038 uses exactly the local counit, cocommutativity and coassociativity for its reference comparisons.

## F09 (P3) — applied

Corrected §0.2 to Dor23 line 496/509, §2.1 to equation (3.2)/Definition 3.2 on p. 19 (Dor23 line 969/976), and §9.2's Remark 3.47 to p. 33 (Dor23 line 1620). Added Dor23 Remark A.2, p. 50 (Dor23 line 2512), and its Armitage attribution to the theta-characteristic contract. Arm67 is recorded as uncertified.

## F10 (P3) — applied

Scalar equal-characteristic Fourier duplication → finite-dimensional and partial transforms for arbitrary nontrivial characters, extending AL.3's residue-character normalization. Dropped reducible-extension language from the irreducible Kirillov request. Added the equivalence between firm and nondegenerate modules over idempotented algebras in Conventions. Evidence: AutomorphicLFunctionsAndLocalFactors AL.3, Curve additive analysis; SmoothRepresentationsOfLocalGroups §SR.1.3.

## F11 (P3) — applied

Unnamed coordinate change → (m,y) ↦ (m,y·det m) in §0.5. Implicit failed compatibility → the explicit values θ(a(0),1) = 2 and a(θ(0,1)) = 5 in §5.1, using a(0) = 0 and a(2) = 5. Recomputed both witnesses and the corresponding Layer 1/5 examples; no Lean padding added.

## Verification

The final `lake env lean` invocation on `packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/Suggested.lean`, from the pinned content checkout, exited 0 with empty output: no errors or warnings. It imports Mathlib alone; no Tau Ceti object build was needed. No full build, update or cache command was run.

Compared both initial elaborated declarations with §5.1: the category, tensor, naturality, pentagon and three defect hypotheses were present; no binder was missing. After deletion, mechanically enumerated the declarations again: zero. Elaborated one signature scratch file containing the final module and every remaining package declaration's generated `#check` list (empty), plus ten native `#check @...` probes. It exited 0. The probes confirmed Matrix determinant/trace, algebraic coinvariant tensor, symmetric category, commutative monoid/module objects, functors and isomorphisms. No declaration required a binder repair.

The pinned manifest specifies Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Opened the declarations at these pins: Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:809; Mathlib/LinearAlgebra/Matrix/Trace.lean:43, 71, 156; Mathlib/RepresentationTheory/Coinvariants.lean:410; Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean:366; Mathlib/CategoryTheory/Monoidal/CommMon_.lean:26; Mathlib/CategoryTheory/Monoidal/Mod.lean:227; Mathlib/CategoryTheory/Functor/Basic.lean:40; Mathlib/CategoryTheory/Iso.lean:54. Algebraic representations have no smoothness requirement; native monoid/module carriers require the actual ambient monoidal category. Neither supplies the exotic category. Object searches found no smooth GL₂, Whittaker, Kirillov or Schwartz–Bruhat representation carrier in either pin. TauCeti/Algebra/Lie/D4/Tripled/Triality.lean:142 constructs an algebraic D₄ group-scheme automorphism, not the triality kernel.

Read the main-branch roadmaps AlgebraicVectorBundles, Completed/RestrictedProducts and ComplexTori for shape. Resolved citations against content main bedeeb4 and the supplied open-head index. Read the actual supplier sections in SmoothRepresentationsOfLocalGroups, AutomorphicLFunctionsAndLocalFactors, MetaplecticAutomorphicForms, FunctionFieldArithmetic, GL2AutomorphicRepresentationsAndTransfer, ArithmeticGaloisDuality, AlgebraicVectorBundles, EnhancedDerivedSheaves and Completed/RestrictedProducts. The citation resolver reports no cross-roadmap citation or package Lean name found nowhere. Its generic statement about unavailable pinned packages was not used as evidence: native names were checked locally as above.

The final direction check, with the specified name, order and `--movable`, exited 0:

```text
depcheck: 50 roadmaps, 582 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. All 15 gap records have exactly slug, supplier, section and needs, and each needs sentence occurs verbatim under the matching README contract. Comparing parsed plans after dropping only gaps gives equality; byte comparison outside that value also gives equality. All 58 target subsections retain at least three Checks. No package declaration remains backticked in the README; the deleted acceptance names have no surviving consumer there. `git diff --check` exits 0.

There were no separate gate failures listed in the brief. The mathematical and ownership repairs above address the review findings; elaboration alone is not evidence of their truth.

## Adversarial mathematics pass

Rows identify the precise README target or convention. Values are boundary computations and countermodel probes, not proofs of the deep targets. Existing targets keep their stated source hypotheses. Local computations use genuine q ≥ 2; characteristic two is tested only for the ring-valued pairing and as an excluded coefficient case. Every target's Checks and worked examples were compared with these values.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Local field and denominator conventions | q = 2, 3; q = 1; y = 0 | q⁻¹ = 1/2, 1/3; q = 1 has no finite residue field; y = 0 is outside F× | Admitted cases have nonzero denominators | None |
| Transpose and regular-bimodule action conventions | g = u(1), h = diag(2,1) over a characteristic-zero field | hᵀgᵀ = (gh)ᵀ = [[2,0],[1,1]]; gᵀhᵀ = [[2,0],[2,1]] | Right-action order works on noncommuting matrices | Locator only |
| Dual/pairing scalar convention | scalar i; two factors with pairing 1 | Bilinear pairing gives i; Hermitian second factor gives −i | Conventions distinguish the two pairings | None |
| Firm versus nondegenerate convention | Z = ℂ², M = ℂ²; Z = ⊕ℕ ℂ and product vector (1,1,…) | e₁+e₂ fixes each vector; finite projector sends infinite vector to finite support, unequal to that vector | Firm = nondegenerate here; product vector excluded | Equivalence stated |
| Pair-category tensor convention | (Z,0), (0,Zsph); zero pair | Mixed product = (0,Zsph); product with (0,0) = (0,0) | Unit and zero have required values | None |
| Universe/smooth-limit convention | vector with stabilizers Jₙ decreasing with nonopen intersection | Tuple belongs to the full product but has smooth-membership value 0 | Smooth limit uses common open stabilizer | None |
| Negative Fourier convention and AL adapter | δ₁ on ℤ/3, ζ³ = 1 ≠ ζ | Transform = (1,ζ⁻¹,ζ⁻²)/√3; square = (0,0,1) = δ₂ | Reflection, not identity | None |
| Compact averaging convention | C₂ swaps (2,0) | Normalized average = (1,1); unnormalized sum = (2,2) | Coefficients and coinvariant normalization agree | None |
| Global degrees/residue convention | places of degrees 2,3; residues r,−r | Degree = 3−2 = 1; phase product = e₀(0) = 1; rational norm = 1 | No rational point assumed | None |
| §0.1 determinant polarization | m = (1,2;3,4), n = (5,6;7,8) | det(m+n)−det m−det n = −8+2+2 = −4; trace formula = 65−69 = −4 | Equality; positive cross terms give 60 | None |
| §0.1 ring generality/perfectness | zero ring, 𝔽₂, ℤ[ε]/ε² | Unique zero-module map is invertible; B(E₀₀,E₁₁) = 1 in 𝔽₂; B(εE₀₀,E₁₁) = ε; Gram determinant = 1 | No field/reducedness restriction on this target | None |
| §0.2 symplectic triple action | scalar triple (−I,I,I); diagonal determinants π,π⁻¹,1 | Scalar determinant product = 1 although scalar product = −1; diagonal multiplier = ππ⁻¹ = 1 | Exact determinant condition preserved | Locator corrected |
| §0.3 rigidified lift | identity and transposition (13) | Identity operator has scalar 1; E₀₁ ↦ E₁₀ ↦ E₀₁ | Scalar rescaling c ≠ 1 fails rigidification | None |
| §0.4 generator formulas | m = 0 and I₂; w twice; y = π, q = 3 | Unipotent phases = 1 and e(bπ); two prefactors give 3⁻⁴, scaled Fourier square gives 3⁴; product = 1 | Reflection agrees with w² = −I | None |
| §0.5 open kernel | (I₂,y), (diag(π,1),y), m = 0 | Coordinate images = (I₂,y), (diag(π,1),yπ); singular membership = 0; Fourier value at 0 of a nonnegative ball indicator = its positive volume | Open carrier and failed middle stability distinguished | Named coordinate map |
| §1.1 Bernstein balance | z = 0,1 and projector e_c | Three actions give 0, identity and e_c; repeated projector gives e_c² = e_c | Same central action; no cross-block contribution | None |
| §1.2 singular/Tor comparison | determinant-only Q; V = 1; supercuspidal V | Residual SL₂ action on Q and Tor₁ = identity; stated hypotheses give E²₀,₀ = E²₁,₀ = E²₀,₁ = 0; V = 1 instead has nonzero SL₂ coinvariants | Missing Tor flatness is not assumed | None |
| §1.3 open spectral integral | Ψ(g,y) = Φ(g)f(y det g); coefficient integral 1; doubled irreducible | μ(Ψ)(y) = 1·f(y); doubling gives 2² = 4 coefficient copies | Formula and irreducibility hypothesis separate models | Coordinate witness retained |
| §1.4 Kirillov extension | supercuspidal; generic principal series | Jacquet boundary = 0 in first case; nonzero torus boundary in second | Compact carrier only suffices in first case | Irreducible supplier wording clarified |
| §1.5 local zeta exponents | y on unit shell or π shell; zero Φ | Unit weight = 1; ‖π‖^(s−1/2)·‖π‖ = ‖π‖^(s+1/2); zero gives 0 = 0 | Exponents agree without global convergence input | Removed unrelated global gap |
| §2.1 left/right conversion | diagonal π; u(1); double transpose | Diagonal stays diag(π,1); u(1)ᵀe₁ = e₁+e₂; double transpose = identity | Inverse transpose fails diagonal witness | Exact locator |
| §2.2 exotic tensor | zero input; flip twice; unit input | 0⊛N = 0; two flips give [m⊗n⊗Ψ]; Iunit⊛N = N | Residual action and symmetry agree | None |
| §2.3 weak data/functor unit square | Vect, c = 2 | Both weak symmetry paths = 2λ; incorrect unit comparison gives 2λ versus λ | Scale is allowed in weak data; functor comparison must change | None |
| §2.4 Whittaker unit | θ(u) = ζ ≠ 1; quotient relation | W(ug) = ζW(g); relation has image ζW−ζW = 0 | Untwisted model fails at nonzero W(g) | None |
| §2.5 trace and unit symmetry | M = Iunit; transpose twice | Φ⁻(Iunit⊛N) = Φ⁻N; surviving transpose scalar = +1 | Trace convention agrees with unit braiding | None |
| §3.1 degeneracy predicates | trivial, Steinberg and nonsplit extension | Φ⁻(1) = 0; Φ⁻St has dimension 1 but Ext¹(St,1) ≠ 0; nonsplit extension has Hom(Eext,1) = 0 | Genericity does not imply degeneracy-free | None |
| §3.2 finite-support Hom | two blocks; infinitely many nonzero blocks | e₁+e₂ acts by 1; finite projector truncates (1,1,…) and cannot equal it | Full Hom/product and enriched Hom/sum differ | Convention aligned |
| §3.3 unit centre isomorphism | f = identity, z = 0; two blocks | ψ(id)_X = id_X; ψ(0)_X = 0; evaluations of e₁,e₂ give (1,0),(0,1) | Both inverse maps have required boundary values | None |
| §3.4 enhanced adjunction | N = Z or one-block module | F(Z) = Iunit; e_dF(e_cN) = 0 for d ≠ c; Φ⁻enhF(N) = N | Unit, orthogonality and reconstruction agree | None |
| §3.5 degeneracy-free equivalence | zero, Z and Steinberg | Images = 0,Iunit; Steinberg's nonzero Ext¹ prevents image membership | Equivalence does not collapse to genericity | None |
| §4.1 spherical generator | determinant character χ ramified on u ∈ O× | SL₂(O) acts by χ(1) = 1; diag(u,1) acts by χ(u) ≠ 1; K-fixed dimension = 0 | SL₂ generator retains missing twists | None |
| §4.2 local counit/coalgebra | ν = 0,1; q = 3; coefficient-of-t⁻¹ character | Scalar/mass pairs = (1,δ₁),(1/3,δπ⁻¹); hKh⁻¹ upper entry = −π⁻¹b; e(t⁻²) = 1 although t⁻² ∉ O | Lattice condition differs from full kernel | Reused exact normalization |
| §4.3 spherical equivalence | local generator and ramified χ det | Each counit composite sends generator to itself; χ det is in image with K-invariants 0 | Both counits and larger image agree | None |
| §4.4 joint generation | pair units; mixed counit map | (Z,0) ↦ Iunit; (0,Zsph) ↦ E; mixed tensor ↦ E; product-category mixed Hom = 0 whereas ε is nonzero | Faithful does not mean full | None |
| §5.1 idempotent coherence | complex line θ = 2xy; zero object; noninvertible scalar 0 | Triple products = 4xyz each; defect = 1; zero-object defect = id; scalar 0 has 0² = 0³ but is not invertible | Hypotheses essential to cancellation | Prose target only |
| §5.1 failed compatibility | Cantor θ; triples (0,0,0),(0,0,1); pair (0,1) | Defect a(0) = 0, a(2) = 5; left square = 2, right square = 5 | Explicit nonexample to omitted compatibility | Recomputed failed square |
| §5.2 unique associator | three E generators; mixed ε | Pentagon paths = a²,a³; invertibility gives a = 1; mixed counit composites both ε | Generator coherence needs mixed naturality | None |
| §5.3 categorical self-duality | Vect and its regular bimodule; zero vector space | Evaluation ℂ⊗ℂ = ℂ; each triangle sends 1 ↦ 1; evaluation with zero = 0 | Ordinary linear, not a stable replacement | Ownership retained |
| §5.4 generic algebra | unit rescaled by c = 2; determinant character | Multiplication scales to m/2, yielding (m/2)(2u,v) = v; determinant character has Whittaker dimension 0 | Chosen nonzero generic unit determines product | None |
| §5.5 local convolution | orthogonal blocks; infinite direct sum | e₁e₂ = 0; product of block-supported inputs stays in block; (1,1,…) is not in ⊕ℂ | Firm algebra need not be unital | Coassociativity dependency exposed |
| §6.1 adelic tensor | two-place elementary tensor plus one unramified reference | [x₁⊗x₂] = [x₁⊗x₂⊗y₃]; local reference counit sends 1_K to its unit class; whole-G indicator has noncompact support | Restricted construction requires all local coalgebra laws | Added actual proof inputs |
| §6.2 function carriers/dual | compact indicator, constant 1, nontrivial central-degree translate | Indicator has finite support on a fixed-level quotient; constant has value 1 at every degree and is not compact; Ξ-periodic nonzero values repeat at unbounded degrees | Supplied Ξ-carrier cannot equal S | Changed carrier source |
| §6.2 transpose pairing | test pair with value 1, scalar i | B(if,f′) = i; B(f,if′) = i; Hermitian alternative gives −i in second slot | Smooth transpose dual retains bilinearity | Recomputed with same quotient |
| §6.3 rational theta invariance | two pairs (E₀₁,1),(E₁₀,1); rational a,b,q | Transpose sums = a+b on both sides; e(bq det ξ) = 1; rational norm factor = 1 | Generator proof uses only in-scope imports | Proof route replaced |
| §6.3 Weyl/other permutations | rational q = 1 or a²; pairing −qB; identity permutation | Fourier prefactor = 1; rational change of lattice covolume = 1; Poisson sums equal; identity lift scalar = 1 | Rational splitting fixes scalar ambiguity | Explicit partial-Fourier input |
| §6.4 theta multiplication | outer rational translate and swapped compact factors | Reindexed finite sum has same terms; transposed two-term sum = a+b again | Middle output stays in unrestricted carrier | Carrier change propagated |
| §6.5 zeta identity | zero input; π shell, q = 3; rational idele | Integrals = 0 = 0; weights combine as 3^(−s+1/2)·3⁻¹ = 3^(−s−1/2); rational norm = 1 | Normalizations unchanged by supplier repair | Own unfolding/convergence target |
| §6.5 positive convergence majorant | two disjoint unit-volume patches with values 1,−1 | Signed integral = 1−1 = 0; absolute integral = 1+1 = 2 | Signed GJ value cannot bound absolute convergence | Added positive-majorant Check |
| §7.1 Poincaré sum | u(b) with rational b; right translate g₀ | e(b) = 1; both translated expressions have terms W(γgg₀) | Quotient representatives and action direction agree | None |
| §7.2 Petersson unit | q det ξ = 0,1 in U quotient integral | ∫ e(−x)dx = 0; ∫1dx = 1 | Determinant-zero term vanishes, unit term survives | None |
| §7.3 determinant ideal/pushforward | unit-volume product patch; Poincaré image | Patch pushforward = 1 on determinant patch; Poincaré pushforward = 0 by ∫θ = 0 | Gives actual compact nonmember and member | Two independent supplier gaps |
| §7.3 rational/unipotent generation | lower unipotent and diagonal rational matrix | w u(b) w⁻¹ = [[1,0],[−b,1]]; det diag(a,1) = a may differ from 1 | Generated subgroup contains SL₂(A), need not equal it | Inclusion stated precisely |
| §7.4 compact algebra | unit composite and two parenthesizations | m_I(e⊛id) = id_I; on unit-generated inputs both parentheses give same element | Epimorphism cancellation is legitimate | None |
| §7.5 ambient action | two actions agreeing after unit precomposition | Difference precomposed with e⊛id = 0; epimorphism forces difference = 0 | Unique action on S and its smooth dual | New carrier propagated |
| §8.1 abstract module criterion | regular I and determinant constituent | Regular unit composite = id_I; determinant Whittaker quotient = 0 while I-module membership = 1 | Whittaker genericity is not the criterion | None |
| §8.2 realization/closure | identity morphism; nonsmooth tuple in infinite product | Identity has one action-compatible lift; tuple with no common open stabilizer has smooth-membership value 0 | Smooth limits, not unrestricted products | None |
| §8.3 matrix Schwartz module | zero matrix and identity matrix | Unipotent phase at 0 = e(0) = 1; rational outer translate of I₂ = that rational matrix | Specified action is used in factorization | None |
| §9.1 spin datum/lattice | ℙ¹, O(−1), dt; local ω of order 2k | Square degree = −2; annihilator exponent of πʲO = −j−2k; fixed exponent j = −k; at infinity k = −1 gives πO | Spin parity and inverse exponent agree | Locator attribution added |
| §9.2 global counit/coalgebra | Λ_v = O_v; ν_v = 0; one extra reference place | Distribution coefficient = 1, mass = δ₁; both counit composites fix generator; reference insertion changes no class | Counit/transport remain actual construction targets | Supplier-less record retired |
| §9.3 spin convolution | orthogonal projectors e,1−e | Mixed convolution = e(1−e)(f⋆g) = 0; same-block product stays in I | Finite/smooth Hom condition respected | None |
| §9.4 section/involution transports | local a = π; global rational a; q = 3 | Lattice exponent decreases by 1; global scale ∏‖a‖ = 1; inverse-transpose square scalar = 9·1/9 = 1 | Involutivity alone does not prove multiplicativity | Transport target retained |
| §10.1 normalization module/injection | λ = 0; (a,d) = (π,1), q = 3; Weyl square | ηf(0,y) = 0; equivariance factors (1/3)·3 = 1 versus unweighted 1/3; Weyl square = (1/3)·3 = 1 | Additive coordinate and weights essential | None |
| §10.2 normalized adjunction | zero module; t:Lnorm→1T replaced by 2t | Both Hom sets at zero have one element; the comparison Hom(Lnorm,V)→V evaluates on t⁻¹(1), so replacing t by 2t changes a value 1 to 1/2 | Direction r̂ ⊣ î and choice dependence retained | None |
| §10.3 rank-one quotient | diag(0,0), diag(0,λ); torus (π,1), q = 3 | Determinants = 0; ordinary U phase = 1; surviving torus scalar = 1/3 | λ = 0 remains in additive carrier | None |
| §10.4 nonunital/unit-localized induction | reducible i(‖a/d‖); localized η | Before localization η has value 0 at λ = 0 against a boundary vector's value 1; after localization η becomes invertible | Unit obstruction and its actual localization distinguished | None |
| §10.5 intertwiner | two composites before/after localizing η,η(w) | Before: η⊗η(w); after identifying both unit comparisons: 1⊗1 = 1 | Extra normalization factors cannot be dropped | None |
| §11.1 torus quotient | trivial character; character nontrivial on rational t | Rational action values = 1 and χ(t) ≠ 1 | Exactly the first descends | None |
| §11.2 automorphic adjunction/global reference | f = 1_O×⊗1_O× at one unramified place, λ = 0,y = 1 | ηf(0,1) = 0; global Lnorm reference at (0,1) = 1 | No reference-preserving global η inferred | None |
| §11.3 four-term lifting identity | formal u,v,z and u = v | Both sides contain D(uz,vz),D(uz²,v),D(v,uz²),D(vz,uz), each once; diagonal S(u,u) = 2D(u,u) | Identity in both directions, division by 2 only over ℂ | None |
| §11.3 degree/stabilizer/weight witnesses | deg(u/v) = −4, N = 9; constant field 𝔽₃ | Needed degrees = 9,5,14 > 0; stabilizer = 2² = 4; conjugated values = 3⁻¹ᐟ² on both swapped pairs | No prime of nonpositive degree requested | None |
| §11.4 cuspidal components | cusp form, anomalous Eisenstein quotient, degree-2/3 places | Constant term of cusp = 0; anomalous restriction = 0 but cuspidal projection = 0; degree difference = 1 | Cuspidal kernel is not characterized by restriction alone | Factorization supplier corrected |
| §11.4 multiplicity/factorization input | fixed-character irreducible cusp summand; one unramified reference insertion | Multiplicity = 1; π^K has product dimension ∏dim π_v^K_v; extra spherical factor contributes 1 | Ordinary multiplicity and tensor factorization are distinct inputs | Gap narrowed and reassigned |
| §11.5 product decomposition | component projector e | e² = e; e(1−e) = 0; nonzero anomalous Eisenstein object has cuspidal projector 0 | Complementary ideal reconstruction consistent | None |
| §11.6 irreducible comparison | Steinberg module; automorphic determinant constituent | Irreducible St-module has one St copy; determinant Whittaker quotient = 0 yet classical automorphic membership = 1 | Includes nongeneric automorphic constituents | Eisenstein-only gap isolated |
| §11.7 finite-length restriction | cusp; Eisenstein; length n = 0,1,2 | Bounds = 0; 1+1 = 2; 2n = 0,2,4 respectively | Zero and repeated-character cases included | None |
| Ordinary categorical tensor gap | Vect × Vect and its unit | Separately cocontinuous bilinear (ℂ,ℂ) ↦ ℂ⊗ℂ = ℂ; unit tensor Vect⊗Vect ≃ Vect | Distinct from replacing objects by chain complexes | Generic owner retained |
| Arbitrary-character finite-dimensional Fourier gap | F² with product test; zero-dimensional F-space | Transform = product of two scalar transforms; dimension 0 transform of 1 = 1 | Scalar input alone is not silently a partial-transform interface | Narrowed extension request |
| Eisenstein constituent gap | reducible rank-two induction | Length-two local constituents include generic St with Whittaker dimension 1 and determinant character with dimension 0 | Whittaker visibility cannot define automorphicity of all constituents | Dedicated supplier contract |

## Maintainer notes

No supplier roadmap, merge-order file, tooling or pull-request text was edited. The report and the four permitted package files are the only repository changes; metadata.toml is unchanged. Within design/plan.json, only gaps changed. The brief permits that list to describe supplier gaps; the obsolete records instead described package-owned work, so their retirement required no edit outside the permitted list. The retained §§5.3, 9.2 and 9.4 still own the substantive coevaluation, counit and transport proofs. Other immutable plan annotations referring to that work were left untouched.

The old function-field-quotient-constituents slug is replaced by the three F04 slugs. The old function-field-cuspidal-factorization slug is replaced by function-field-cuspidal-multiplicity-one, supplied by AutomorphicLFunctionsAndLocalFactors AL.3. Ordinary multiplicity one and the other remaining extensions are declared supplier gaps, not claims that the supplier already states them. The source-dependent spherical computations are not transferred upstream.

The names removed from Suggested.lean are AssociativeTensor and idempotent_coherence. They were supporting acceptance declarations, not public supplier declarations; the mathematical §5.1 target and its applications remain. No new Lean name was introduced.

Ownership searches used the roadmap service across main and the supplied open-head index, plus local board packages, by objects as well as names: exotic products, abstractly automorphic modules, degeneracy-free representations, smooth Eilenberg–Watts, determinant pushforward and theta characteristics. No competing owner for the specific constructions repaired here was found. The unary theta characteristics in QSeriesPartitionsAndMockModularForms and determinant local-system pushforward in PotentialAutomorphyInfrastructure are different objects. Supplied open-head files were checked through the service; unprovided live board heads or newer remote changes were not fetched.

The four cached source texts were available legally. The one additional citation, Arm67, was fetched through the source service; it resolved only to a paywalled publisher and is recorded as uncertified with its page locator. Its attribution is independently readable at Dor23 line 2512 and Dor23 line 2574. No source text was copied into the package, and no unsettled missing-reference request remains.
