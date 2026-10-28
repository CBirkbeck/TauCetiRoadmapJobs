# Repair report: EllAdicHomotopyTypesAndWeights

The five findings are reported in review order: r2a/F01–F03, then r2b/F01–F02. The review is identified below each heading because finding identifiers repeat. Summaries of previously repaired findings are not new repair requests.

## F01 (P3) — applied

Review r2a.

Section 4.1 defined its localized object using the subsequent finite-component construction → it now localizes the raw algebra directly. Its forward Needs entry is deleted; §4.1a identifies the finite-component algebra with that previously constructed localized object. The dependency chain is §3.5 → §4.1 → §4.1a → §4.2.

Evidence: weil-II line 3798 constructs the homotopy algebra, and weil-II line 3801–3822 realize it and identify its cohomology without requiring the later continuity argument. The point and two-point comparisons have H⁰ respectively ℚ_ℓ and ℚ_ℓ²; both representatives take [γ₂] to 1/2. All subsequent uses of the finite representative remain after §4.1a.

## F02 (P3) — applied

Review r2a.

The constant-system and even-subtower bullets in §3.1 repeated functor laws → a two-point-to-point pullback Check now computes the diagonal map. The point and limit-order Checks remain, giving three distinct tests. The construction and its cofinality laws are unchanged.

Evidence: the compatible-family definition in §2.1 and its filtered colimit in §3.1 give pullback Rγₙ → R²γₙ, a ↦ (a,a). Over 𝔽₃ the coefficient 1 maps to (1,1), whereas the zero construction gives (0,0). Covariant summation has the wrong source. This uses weil-II line 3740 and weil-II line 3762.

## F03 (P3) — applied

Review r2a.

Section 8.3 required finite-dimensional H¹ and H²(A) → it now requires only finite-dimensional H¹. Both occurrences of the extra hypothesis are changed, the finite-kernel induction is explained, and the square-zero infinite-H² example is added as a prose Check. The geometric finite-cohomology inputs of §§8.4–8.5 remain intact.

Evidence: morgan line 1175–1180 state the finite degree-one Hirsch series under finite-dimensional H¹. A finite stage on d degree-one generators has H² dimension at most d(d−1)/2; any kernel mapping to H²(A) is therefore finite-dimensional, regardless of its codomain. For A = K ⊕ ⊕ⱼKeⱼ, |eⱼ| = 2, with zero positive products, K → A has H¹ map 0 → 0 and H² injection 0 → ⊕ⱼKeⱼ. Its Lie tower is zero. The locator now points to morgan line 1175 as well as morgan line 2245.

## F01 (P2) — applied

Review r2b.

Section 6.2’s single-field property → one K-filtration stable up to homotopy over every characteristic-zero extension. Its induction and Needs specify base change; §7.3 uses the extended rational blocks. New Checks test a nonrational ℚ₇-automorphism and a failing admissible filtration. The acceptance-test docstring records the stronger headline.

Evidence: weil-II line 3867–3873 assert the single-field property; weil-II line 3909 uses an adapted ℚ_ℓ lift, and weil-II line 3919–3928 use the rational filtration to define the group whose scalar extension must split. These steps require the compatibility identified by the review. Morgan’s obstruction formula and linear primitive choices are at morgan line 1123–1139. Flat field extension preserves the finite-block kernels, images and obstruction equations; §6.2 owns the uniform block/adaptation theorem. The existing supplier gap:sullivan-scalar-extension supplies model-map base change only and is not represented as proving this stronger result.

The quantifiers are one filtration over K, then every extension L/K, then every L-automorphism, then an adapted representative and L-homotopy. An arbitrary admissible filtration need not work even over K. Thus the two-step filtration in the review witnesses the missing justification, rather than refuting the repaired existence theorem. The new negative Check makes that distinction explicit.

## F02 (P3) — applied

Review r2b.

Section 7.1 had two versions of the same weight-(1,2) shear → the uncomputed version is deleted. The four remaining Checks compute the one-generator section, failure of restriction, scalar factors at λ = 2, and the associated-graded-trivial shear on cohomology. No Lean padding is added.

Evidence: both former bullets used b ↦ b+a, with identity on both associated graded lines and [b] ↦ [b]+[a]. The retained bullet gives these values explicitly. The restriction and scalar-factor tests use different conclusions and remain discriminating.

## Adversarial mathematics pass

The table covers all 37 numbered targets, their API laws and Checks, the conventions, supplier boundaries and worked examples. Values are computations on instances, not a claim that elaboration proves future theorems. Here Λ is alternating even in characteristic 2, and K is a characteristic-zero field. The README has 129 target Check bullets and five convention Check bullets after the edits.

| Statement | Instances tried | Computed values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: coefficients, support, connectedness | Empty scheme; two points; r = 0,1; zero ring | H*(∅) = 0; H⁰(two points) = K² ≠ K; ℤ/ℓ⁰ = 0, while ℤ/ℓ has ℓ elements; all γₙ become 0 over the zero ring | Boundaries respected | None |
| Conventions: differential, Frobenius and Lie signs | dy = x²; ℙ¹ at q = 2,3; dc = ab; q = 1 | Weights satisfy 4 = 2+2, not 3 = 2+2; geometric spectra (1,2),(1,3) have weights (0,2), inverse spectra have (0,−2); dc(A,B) = 1 = −c(−C); at q = 1 all magnitudes are 1 | Signs and q > 1 necessary | None |
| 0.1 commutative DG refinement and localization | Λ(e) over ℤ and 𝔽₂; 𝔽₂[e]; zero algebra; id and a ↦ 2a | e² = 0 in Λ, e² ≠ 0 in the polynomial algebra; H⁰(0) = 0 ≠ K; [ab] ≠ 0; localized cohomology scalars 1 and 2 have inverses 1 and 1/2 | Predicates exclude wrong carrier | None |
| 1.1 divided-power lattice | ℤ, 𝔽₂, 𝔽₃, ℚ, zero ring; dual-number maps | γ₁² = 2γ₂; mod 2 this is 0 with γ₂ ≠ 0; tγ₂ = 3γ₃ = 0 mod 3 with γ₃ ≠ 0; γ₂ ↦ t²/2; maps with γ₁ ↦ 0 and γ₂ ↦ 0 or ε differ | All divided-power generators matter | None |
| 1.2 bidegrees and direct sums | Integral edge; γ₀+γ₂; infinite support | d takes (0,1) to (1,1); Ω₀¹ = 0, Ω₁¹ = ℤdx₀; finite support {0,2} is allowed, support ℕ is excluded | Support and degree laws agree | None |
| 1.3 relative simplex forms | One vertex; edge; R = 𝔽₂; t = 1 | At a vertex dx₀ = 0 and x₀ = t, so Ω = R{t}; on an edge dx₀ = −dx₁ and dγ₂(x₀) = x₀dx₀; dx₀² = 0 mod 2; t = 1 would impose 2γ₂ = 1 over ℤ | Quotient kills dt only | None |
| 1.4 pullback | Identity, omitted vertex, collapse of two/three vertices | Identity fixes γ₂; omitted coordinate maps to 0; collapse gives γ₂(x₀)+x₀x₁+γ₂(x₁); both three-vertex composites give Σγ₂(xᵢ)+Σᵢ<ⱼxᵢxⱼ | Contravariance and mixed coefficient 1 agree | None |
| 2.1 compatible-family forms | Point; empty set; degenerate edge; two joined edges | Point gives R{t}, empty gives 0; degenerate γ₂ pulls back to γ₂(x₀+x₁); vertex restrictions (0,γ₁) disagree and (γ₁,γ₁) agree | Compatibility determines object | None |
| 2.2 simplicial coefficient homology | (p,n) = (0,0),(0,1),(1,1),(2,2); zero ring | H₀ = R at (0,0); R → R identity has kernel and cokernel 0 at (0,1); H₁ = R at (1,1); Γ²(R) = R at (2,2), also over 𝔽₂; zero ring gives 0 | Simplicial and cochain degrees distinguished | None |
| 2.3 triangular comparison | Circle; two-torus mod 2; empty set | H¹Ω₀(S¹) = 0, H¹Ωₙ(S¹) = R for n ≥ 1; product aγ₁·bγ₁ = 2abγ₂ = 0 mod 2 although ordinary ab ≠ 0; empty gives 0 = 0 | Triangular product retained | None |
| 2.4 principal quotients and diagonal | Point mod 4 → mod 2; infinite discrete set; RP²; p = 0; unit ideal | 3γ₁ ↦ γ₁; kernel of ∏R → ∏R/(a) is a∏R; H¹(RP²,ℤ) = 0 but H¹(RP²,𝔽₂) = 𝔽₂; exterior degree −1 term = 0; R/(1) = 0 | Diagonal and arbitrary ideals stay excluded | None |
| 2.5 rational stabilization | Point; edge; infinitely many edges | γₙ ↦ tⁿ/n!; degree-zero edge image is K·1 and excludes x₁; degrees of x₁ᴺ are N and have no uniform bound; dx₁ = d(x₁), hence H¹(edge) = 0 | Quasi-isomorphism does not imply cochain surjectivity | None |
| 3.1 pro-forms | Two points → one; constant point; tower with coordinates ℓⁱ | Pullback sends 1 ↦ (1,1) over 𝔽₃, versus (0,0) for zero; point gives Rγₙ; (ℓⁱ) mod ℓʳ has support i < r, while over ℤ_ℓ it has infinite support | Three distinct tests | Replace two repeated-law Checks |
| 3.2 finiteness (F) | Point; CP∞; infinite wedge of circles; circle | Cardinalities at point are ℓ,1,1,…; CP∞ has ℓ in every even degree and 1 in odd degrees; wedge H¹ = ∏ℕ𝔽_ℓ is infinite; circle has ℓ,ℓ,1,… | Degreewise finiteness correct | None |
| 3.3 universal coefficients | Two-term complex with d = ℓ in degrees 1,2; CP∞; zero complex | Integral H¹ = 0, H² = ℤ/ℓ; reduced H¹ = 𝔽_ℓ = Tor₁(H²,𝔽_ℓ); CP∞ has even rank 1 in every degree; zero complex has Tor₁(0,𝔽_ℓ) = 0 | Tor degree i+1 necessary | None |
| 3.4 completed forms | Point; unbounded t-support; circle at (1,1) mod 2 | Point piece = ℤ_ℓγₙ, rather than ℤ/ℓʳ; Σγₙ has infinite t-support and is absent; circle cokernel d = ℤ/2 has two elements | Bidegree completion correct | None |
| 3.5 homotopy algebra | Point; ℓ = 2,3; n = 2,m = 3 | [γ₀] = 1, [γ₂] = 1/2; tγ_(ℓ−1) = ℓγ_ℓ has nonunit coefficient before rationalization; 10/120 = 1/12 = (1/2!)(1/3!); [ta]·[b] = [tab] = [ab] in stabilization | Normalizations agree | None |
| 4.1 étale realization | Point; two points; uncountable base; ℓ = char(k) on 𝔸¹ | Raw model gives H⁰ = ℚ_ℓ or ℚ_ℓ² and positive point cohomology 0; finite equations descend to countable k₁; independent Artin–Schreier tᵐ, p ∤ m, give infinite H¹ when ℓ = p | Raw construction suffices before comparison | Remove forward prerequisite |
| 4.1a finite/raw comparison | Point; two points; 𝔾_m | Point H⁰ scalar is 1 on both sides and [γ₂] = 1/2; two component idempotents survive, dimension 2; 𝔾_m H¹ rank is 1 on each side; Et_rig → E_fin gives A_fin → A_rig | Same localized object | State comparison after construction |
| 4.2 actions and continuity | Point; two-point orbit; cycles 2,3; raw orbits 2ʲ | Stabilizer indices 1,2,6; 2ℤ̂ ∩ 3ℤ̂ = 6ℤ̂; raw selected indicators have f(v) = 1, f(Fᴺv) = 0 for j > v₂(N), so no Nℤ̂ fixes all | Finite/raw distinction preserved | None |
| 4.3 good-cover comparison | 𝔾_m(ℂ); two arcs; two singletons | H¹(circle) rank 1; two-arc ordinary nerve has rank 0 while component Čech diagram has rank 1; singletons give H⁰ = (ℤ/ℓʳ)² | Good-cover hypothesis necessary | None |
| 4.4 complex models | 𝔾_m; elliptic curve; two points | Betti ranks of Λ(a) are (1,1,0); Λ(a,b) gives (1,2,1) with ab ≠ 0; two points give H⁰ dimension 2, excluding one connected model | Comparison and connectedness agree | None |
| 5.1 geometric weights | 𝔾_m; elliptic curve; nodal rational C; C × 𝔾_m; dual numbers | H¹ weights respectively 2,1,0; product H¹ weights {0,2}, H² weights {2,2}, H³ weight 4; thickened point has H⁰ = ℚ_ℓ, W₋₁ = 0, W₀ = H⁰ | General bounds and normality distinct | None |
| 5.2 Frobenius–Hodge bridge | ℙ¹ at q = 2,3; inverse convention | Spectra (1,2),(1,3) give W₀ rank 1 and W₂ rank 2; inverses include nonintegral 1/2,1/3 and weight −2 | Universal closed-point convention consistent | None |
| 6.1 admissible filtration | Constant Λ(a,b); span of 1,x₂; algebra generated by y in dy = x² | Constant degree dimensions (1,2,1); x² ∉ span{1,x}; dy = x² ∉ Λ(y); identity carries every stage onto itself | Subalgebra and differential conditions necessary | None |
| 6.2 stable representatives | dy = x²; free group on two generators; two shears | Block {x,y} contains x², block {y} does not; H¹ rank 2, H² = 0 coexist with free Lie ranks 2,1,2,3,…; shears preserve span{a,b} | Finite cohomology does not imply finite model degrees | Retain finite-block construction |
| 6.2 uniform scalar extension | ℚ → ℚ₇; α² = 2, α ≡ 3 mod 7; constant and two-step Λ(a,b) filtrations | Hensel derivative 6 is a unit; α ≡ 10 mod 49 and 10² ≡ 2 mod 49; shear matrix has determinant 1 and inverse off-diagonal −α; [b] ↦ [b]+α[a]; swap sends [a] to [b] outside L·[a] | Nonrational automorphisms included; arbitrary filtration rejected | Add uniform theorem and two Checks |
| 6.3 generalized spectrum | J₂(1); generators with eigenvalues 2,3 | Kernel dimensions of σ−1 and (σ−1)² are 1,2; product eigenvalue 6 ≠ 5; an invertible operator has zero generalized space at 0 | Generalized and multiplicative indexing necessary | None |
| 6.4 eigenvalue products | σx = ax, dy = x²; nonminimal du = v; unit | σy = a²y gives source degree sum 2+2 = 4 ≥ 3; nonminimal pair can have arbitrary β and no positive cohomology; unit uses product 1 with degree sum 0 | Minimality and inequality correct | None |
| 6.5 integer weights and descent | dy = x²; σa = 2a, σb = a+2b; 𝔾_m | Differential weights 4 = 2+2; H¹ Jordan generalized space dimension 2 has weight 2 at q = 2, H² has eigenvalue 4 and weight 4; 𝔾_m has degree 1, weight 2 | Cochain degree need not equal weight | None |
| 6.6 common filtration | Two shears A,B; powers of A; weights 1,2 | AB = ((2,1),(1,1)), BA = ((1,1),(1,2)); Aⁿ = ((1,n),(0,1)); diag(2,4)(a+b) = 2a+4b ∉ K(a+b) | Noncommuting infinite-order maps allowed | None |
| 7.1 automorphism extension | Λ(a); two-step Λ(a,b); λ = 2; weight-lowering shear | G₂ for weight-one a is {(μ,λ): μ = λ}, U = 1; swap has b ∉ Λ(a); weights 1,2 give factors 2,4; shear fixes Gr but [b] ↦ [b]+[a] | Four distinct tests remain | Delete duplicate shear |
| 7.2 compatible splitting/conjugacy | 𝔾_a ⋊ 𝔾_m, s_c(λ) = (c(1−λ),λ) | Product coordinate c(1−λ)+λc(1−μ) = c(1−λμ); at 2,3 both sides are (−5c,6); conjugating s₀ by (c,1) gives s_c; c = 0 gives diagonal section | Algebraic section normalization correct | None |
| 7.3 rational grading | Elliptic curve; 𝔾_m; rational blocks after extension | Elliptic H¹ weights (1,1), product weight 2; 𝔾_m W₁H¹ = 0, W₂H¹ = H¹ of rank 1; scalar-extended stage dimensions equal original dimensions | Lift must preserve extended rational blocks | Invoke uniform §6.2 law |
| 7.4 conjugacy | g(a) = a, g(b) = b+a | g sends (Ka,Kb) to (Ka,K(b+a)), fixes both Gr lines, changes [b] to [b]+[a] | Identity on Gr does not mean homotopic to identity | None |
| 8.1 arbitrary-base grading | Three-punctured line over 𝔽̄₂, ℓ = 3 | H¹ eigenvalues (2,2) at q = 2 have weights (2,2); H² = 0 | No rational Betti model needed | None |
| 8.2 proper smooth formality | Elliptic curve; 𝔾_m; ℙ¹ | Elliptic d = 0; degree-diagonal projection kills 𝔾_m weight-2 H¹, so fails there; for ℙ¹, x ↦ [x], y ↦ 0, dy ↦ [x²] = 0, H* = K[x]/(x²) | Purity and properness used correctly | None |
| 8.3 degree-one Lie tower | Λ(a); Λ(a,b); dc = ab; ℙ¹; infinite square-zero H² | Lie dimensions 1 and 2, both abelian; [A,B] = −C and 1 = −c(−C); ℙ¹ has 1-minimal H² = 0 ↪ K; square-zero example has H¹ = 0, H² = ⊕ℕK, all Lie dimensions 0 | H²(A) need not be finite | Broaden hypothesis, explain finite kernel, add Check |
| 8.4 Tannakian comparison | Three punctures; cyclic C₂ and nonabelian S₃ | Nilpotent depths 1,2 give dimensions 2,3; finite-order unipotent g has N log(g) = 0, hence log(g) = 0 in characteristic zero; both finite groups have trivial unipotent completion | Completion differs from profinite group | None |
| 8.5 normal presentation | Three punctures; elliptic curve; genus g; nodal C; g = 0 | Relation spaces 0 and K·[a,b] respectively; genus g ≥ 1 has 2g weight −1 generators and one weight −2 symplectic relation; g = 0 gives V = R = 0; nodal H¹ weight 0 excluded; [−4,0] ∩ (≤ −2) = {−4,−3,−2} | Relation-weight range consistent | None |

Additional checks on the changed induction: for a finite degree-one stage on d generators, d = 0,1,2 gives upper bounds 0,0,1 on dim H², independent of dim H²(A). For Λ(a,b) mapping to the zero-product algebra on two degree-one classes, the H² kernel is K·ab even if infinitely many unrelated degree-two classes are added to the target; adjoining c with dc = ab kills precisely that one-dimensional kernel. After extending scalars, its kernel is L·ab of the same dimension. This tests both the finite-stage argument and its field-extension input.

For the new scalar-extension law with a nonzero differential, take K[x₂]⊗Λ(y₃), dy = x², over ℚ₇ and x ↦ αx, y ↦ 2y, α² = 2. Then d(2y) = 2x² = (αx)², with inverse scalars α⁻¹ and 1/2. The constant finite-generator filtration stays stable; cohomology scalar on H² is α. Thus the test also covers a genuine Hirsch differential, not only zero-differential exterior algebras. For M = K the extended model is L and the unique automorphism is identity, giving the zero-generator case.

| Supplier contract / worked example | Instances tried | Computed values | Result | Change |
| --- | --- | --- | --- | --- |
| polynomial-forms-de-rham | Point, edge | A_PL(point) = K versus relative K[t]; ∫₀¹dx = 1; d(x) = dx gives H¹(edge) = 0 | Separate relative and barycentric objects | None |
| sullivan-minimal-models | v₂ before u₁, du = v; dc = ab | Induced indecomposable differentials are [u] ↦ [v] ≠ 0 and [c] ↦ 0 respectively | Sullivan need not be minimal | None |
| sullivan-quasi-isomorphism-rigidity | Λ(a), a ↦ 2a | H¹ scalar 2, inverse scalar 1/2 | Minimal rigidity applicable | None |
| sullivan-homotopy-lifting | Interval, maps e ↦ a and e ↦ 2a | Both endpoint values of dt are 0; induced H¹ maps are 1 and 2, hence unequal | Homotopy cannot identify these maps | None |
| sullivan-scalar-extension | Field extension; full and 1-minimal map | Kernels 0 tensor to 0; an H¹ identity remains identity; H² injection 0 ↪ K becomes 0 ↪ L | Supplies model maps, not arbitrary filtration stability | Add explicit use in §6.2 only |
| finite-component-etale-presentation | Finite 2- and 3-cycles versus lengths 2ʲ | Stabilizer 6ℤ̂ has index 6; ⋂ⱼ2ʲℤ̂ has infinite index | Finite-component gap remains necessary | None |
| compatible-good-cover-refinement | Circle covered by two arcs with disconnected overlap | Ordinary nerve H¹ = 0 versus circle/component diagram rank 1 | Triangulation alone does not supply this contract | None |
| geometric-mixed-hodge-realization | ℙ¹; nodal rational curve | W₂H² comes from complex index 0 = 2−2; nodal H¹ has weight 0 | Shift and singular extension necessary | None |
| arbitrary-base-weight-filtration | 𝔾_m over 𝔽̄₂, ℓ = 3 | H¹ eigenvalue 2 has weight 2; H² = 0 | Arbitrary-base cohomological input retained | None |
| ordinary-cohomology-weight-bounds | Nodal C × 𝔾_m | H¹ weights 0,2; H² weights 2,2 ∈ [0,4]; H³ weight 4 ∈ [0,6] | Smooth-only and proper-only bounds insufficient | None |
| normal-h1-weights | Elliptic curve, 𝔾_m, nodal C | H¹ weights 1,2,0; only last example fails normality | Normality excludes weight 0 | None |
| normal-variety-unipotent-category | Three-punctured line in characteristic 2, ℓ = 3 | Unipotent depth dimensions 2,3 rather than 0 | Beyond supplier’s characteristic-zero curve clause | None |
| Circle and two-torus worked example | Circle, elliptic torus, algebraic torus, mod 2 | H¹ ranks 1,2,2; geometric weights 2,(1,1),(2,2); H² weights 2 and 4 for the two tori; integral product 2abγ₂ = 0 mod 2 | Realizations distinguished | None |
| Three-puncture worked example | First two Hirsch stages | Λ(a,b) has H² = K·ab; adjoining c, dc = ab, kills that class; dual bracket [A,B] = −C; defining geometric relation space is 0 | Full model is not its first stage | None |
| Proper smooth curve worked example | g = 1,2 | Exterior H² dimensions 1 and 6, geometric H² dimension 1; relation Σ[aᵢ,bᵢ] has weight −2; at g = 1 bracket = 0 | Formality does not force minimal d = 0 | None |
| Projective-line worked example | x₂,y₃, dy = x² | Minimal d(y) = x² ≠ 0; cohomology x² = 0; weights 2,4; source degree sum for y is 4 ≥ 3 | Formal quasi-isomorphism correct | None |
| Normality worked example | Proper nodal rational curve | Graph H¹ rank 1, weight 0, outside {1,2} | Normal hypothesis necessary | None |
| Infinite discrete coefficient worked example | R = ℚ[x₁,x₂,…], I = (x₁,x₂,…) | (xᵢ) maps to 0 in ∏R/I but is nonzero modulo I∏R; principal kernel is exactly a∏R | Arbitrary-ideal base change false | None |

## Sources, ownership and citation resolution

The repaired mathematical claims use existing certified sources; no new reference or access request is needed. The source already leaves the stable-block argument implicit: weil-II line 3869–3873, followed by its use across coefficient fields at weil-II line 3909 and 3928. Section 6.2 explicitly owns that proof obligation, including the extension compatibility. Morgan’s finite degree-one construction is at morgan line 1175–1180; its lifting calculation is at morgan line 1123–1139. This does not attribute the uniform-filtration theorem to the model-map scalar-extension supplier contract.

Read the main-branch DerivedModuleAlgebra and ReductiveGroups roadmaps for shape and supplier scope. Searched objects with `roadmaps grep` across main and indexed open work, the board packages, and all 54 sibling roadmap folders specified in the brief. No other owner of the finite-block stable-representative theorem or the 1-minimal Lie dualization was found. AlgebraicTopologyPartII §AT2.4/G3 remains the owner of the generic Sullivan prerequisites; this package retains the already planned finite-block refinement and Lie comparison. The unrelated Sullivan-name and admissible-filtration hits concern different objects. No scope move or new dependency is introduced.

Resolved cross-roadmap citations with `roadmaps resolve`, then inspected the named supplier sections against main where present and the supplied new-roadmap heads otherwise. In particular, the finite-coefficient finiteness and field-extension interfaces remain EtaleCohomologyFoundations §§F.2.2–F.3 and F.4; the homogeneous powers, décalage and towers remain DerivedModuleAlgebra §§0.DP.2–0.DP.3, 0.14–0.17 and 1.T.1–1.1; finite unipotent theory and Levi complements remain ReductiveGroups Layers 5, 6 and 6A. The complex comparison, Hodge, weight and unipotent-category contracts retain their stated domains and declared gaps.

The resolver’s three “found nowhere” leads are board designs, not missing supplier identities: AlgebraicTopologyPartII §AT2.4/G3 is in packages/AlgebraicTopologyPartII/design/README.md; EtaleHomotopyTypes §§EH.0, EH.3, EH.6 are in packages/EtaleHomotopyTypes/design/README.md; MixedHodgeModulesAndIrregularHodgeTheory §§H.1/operations and H.1/weight-bounds are in its design README. These citations retain their existing meaning. Its warning that it did not check external Lean names was handled by reading the actual pinned packages.

The manifest pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. At those pins, the named divided-power, exterior, simplicial, Dold–Kan, Mittag–Leffler and localization declarations were read in their cited files. In particular Mathlib/RingTheory/DividedPowerAlgebra/Init.lean:171 gives the binomial coefficient; Mathlib/CategoryTheory/Localization/Construction.lean:106 and :111 give localization and its functor. The native DG predicate at TauCeti/Algebra/Homology/DG/Algebra/Defs.lean:182 contains degree, square-zero and Leibniz laws, not commutativity or nonnegative support. The native mixed Hodge carrier at TauCeti/Geometry/Hodge/Mixed/Basic.lean:72 supplies filtrations, not geometric realization. Neither provides the missing Sullivan/relative-form carriers needed to state the headlines. No acceptance theorem can be made statable by a few simple definitions as a consequence of these repairs.

All 12 supplier gap slugs and needs sentences still match design/plan.json exactly. None of the five findings asks for another supplier target. No plan, metadata or source-manifest edit is needed. The previously settled missing deliveries remain declared contracts rather than claims that their suppliers already state them.

The source-issue notes in the reviews require no additional package repair: §2.4 already restricts the quotient assertion; §2.2 uses divided-power décalage; §2.5 states the bounded image; §4.1 puts countability on k₁; the cross-field filtration issue is r2b/F01 above; and the Morgan correction remains cited for the associated-graded distinction. The supporting sga5 and miller entries remain uncertified and are cited by locator only, without reopening access requests.

## Required checks and maintainer notes

- **Suggested.lean elaboration:** `lake env lean` on packages/EllAdicHomotopyTypesAndWeights/Suggested.lean, from the pinned content checkout: exit 0; stdout and stderr empty. Its only import is `import Mathlib`; no Tau Ceti object-file build was necessary.
- **Elaborated signatures:** mechanically inventoried every declaration and variable/include line. There are zero declarations and zero variable/include lines, so the `#check @name` list is empty. Elaborated a scratch copy carrying this empty inventory; exit 0 with no output. No binder can disappear and no declaration name changed. The initial scratch setup used the wrong working directory and failed to create its input; that setup error was corrected before the successful signature check.
- **Dependency check:** exit 0, with exact output below. There is no UPWARD, CYCLE or moved line.

```text
depcheck: 55 roadmaps, 626 edges, 0 problem(s)
```

- **Consistency:** all 37 targets retain their API and Check sections; §3.1 has three Checks, §6.2 five, §7.1 four and §8.3 seven. There are no added Lean declarations, API stand-ins or boundary-case theorems. The changed §6.2 headline is reflected in the module docstring. The former extra H² finiteness hypothesis appears nowhere else in the general Lie-construction contract.
- **Diff whitespace check:** `git diff --check` exited 0 with no output.
- **Gate failures supplied in the brief:** none. The three citation leads are resolved above; no tooling or merge-order file was changed.
- **Consequences:** §7.3’s rational-descent route now explicitly depends on the uniform form of §6.2. The general §8.3 Lie construction accepts infinite-dimensional H² targets, while its geometric consumers keep their finite geometric cohomology inputs. No downstream declaration names change, and the existing supplier contracts remain unchanged. No commit or external write was made.
