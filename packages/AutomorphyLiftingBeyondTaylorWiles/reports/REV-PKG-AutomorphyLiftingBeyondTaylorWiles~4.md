<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/999#issuecomment-6400667143 -->
Review (codex) of 71f6fd0

Verdict: needs_changes

1. **F01** (P1) The character-exponent translation has the wrong sign

   **Location:** `packages/AutomorphyLiftingBeyondTaylorWiles/README.md:1417`, §5.8: “choose n distinct exponents and translate all of them by the inverse of n times their sum.”

   **Claim:** This construction produces pairwise distinct p-power characters whose product is 1, as required for the character-deformed PGLₙ problem.

   **Witness:** Take n=2, p=5, residue norm 11, and a character χ of order 5. Exponents (0,1), translated by 2⁻¹·1=3, become (3,4). Their product is χ²≠1. Subtracting gives (2,3), with product χ⁵=1.

   The failed tuple is not a PGL₂ Iwahori character datum: its restriction to the diagonal scalar subgroup is χ². This is precisely the non-example excluded by §0.1, so the construction contradicts the package's own definition. The phrase also needs to specify the ring in which n is inverted. If “inverse of n times their sum” were instead intended as additive inversion of n times the sum, the same example still gives translation by −2=3 and the same failure.

   **Exact repair:** In the cyclic p-primary character group of order pᵃ, choose a generator χ and distinct exponents a₁,…,aₙ in ℤ/pᵃℤ. Put s=Σaⱼ and explicitly define aᵢ′=aᵢ−n⁻¹s, with n⁻¹ taken in ℤ/pᵃℤ; it exists because p>n. Use χᵢ=χ^{aᵢ′}. Then Σaᵢ′=s−nn⁻¹s=0 and aᵢ′−aⱼ′=aᵢ−aⱼ, so the product is 1 and distinctness is preserved. Add the order-five example above as a negative-control Check. On the refuting instance the repaired exponents are (2,3), with sum 0 and distinct difference −1. The same subtraction was checked on every distinct exponent subset, for every 2≤n<p and p∈{3,5,7,11}; all sums were 0 and all cardinalities were preserved.

   This finding concerns the explicit construction, not the truth of existence of suitable characters or the support theorem. It is new, not a re-raised settled finding. One finding, one blocking P1; no P2 or P3 findings.

## Verified sound

The review read all 43 numbered targets, their API bullets, Checks and proof routes, all 43 Needs lines, six layer examples/dependency summaries, scope, conventions, supplier contracts, the complete acceptance file, metadata and all three source records. All fifteen source targets selected for this round were opened. The previous report's computed rows were reused only for unchanged mathematics; its prose summaries were not accepted as computations. Changed passages were checked afresh, including their consumers. Finite examples test identities, directions and necessary hypotheses; they do not prove the conditional global arithmetic theorems or discharge supplier contracts.

### Finding-by-finding verification of the preceding repair

The preceding review had one blocker, F01 in its repair report: the inverse cohomological Hecke correspondence. It is **repaired**. No preceding finding was marked “not actionable in this package.” Here `README` means `packages/AutomorphyLiftingBeyondTaylorWiles/README.md`.

| Repaired passage | Status and verification |
|---|---|
| README:189, “T(g)=`p_{1*} c_g p_2^*`” with the geometric projections and coefficient map specified | Repaired. Pullback goes from Y(L_g) to Y(K_g), followed by trace. ALS.3.5 gives exactly this positive correspondence. On C₃, pullback of δ₀ is (0,0,1); the former forward pushforward is (0,1,0). |
| README:191, “`T(g)^vee = T_H(g^{-1})`” | Repaired. For f=δ₀ and e₂, the two adjoint pairings are 1 and 1, while pairing with inverse translation is 0. Standard homology and the geometric transpose are explicitly distinguished. |
| README:335, “the scalar action transported directly to the dual is instead T_H(δ⁻¹)” | Repaired. A cohomological eigenvalue ζ₅² becomes ζ₅⁻² for the standard same-labelled homology diamond, but remains ζ₅² for the transported scalar. The coefficient dual is ψ⁻¹ and the ideal is m*. |
| README:515, :563–565 and :707–709, inverse exponent and all-level inertia–diamond compatibility | Repaired. For n=3 and Δ=C₅, 1−n=3 and 3⁻¹=2; (d³)²=d. The map [δ]↦θ(δ²) matches pullback, with the inverse explicitly retained on standard homology. |
| README:989 and :1016, positive squared correspondence and cochain precomposition | Repaired. The oriented tree-chain computation has 4 or 49 positive terminal edges for q=2 or 7, boundary defect 0, and vertex augmentation 1. The backward-edge indicator is 0 where the forward one is 1. |
| README:1112 and :1150, adjoint projector and transported S_N-action | Repaired. The whole projector is transposed, including its local factor; no inverse-eigenvalue assertion is made for an arbitrary noninvertible parahoric operator. The scalar comparison agrees with §§0.5 and 2.2. |

The repair's new cyclic, noncommutative, character, tree and rank-three polynomial Checks were recomputed. In particular, the two cubics agree modulo 5 but differ modulo 25; the README records the stronger test. The pattern search also covered every occurrence of pullback, transfer, trace, translation, adjoint, diamond, square and normalization, including §§0.3, 1.4, 2.1–2.2, 2.7, 3.5–3.7, 4.2–4.4 and 5.6–5.10. No recurrence of the preceding direction defect was found. R01 is a separate exponent-sign error.

### Seeded source verification

CG18 was read in its recorded published-layout author copy, using printed page numbers. CGH20 and KT17 were read in their manifest's arXiv versions. No author-flagged unverified locator was found. All cited works were legally readable in the supplied cache; no source entry was added, rewritten or removed. The following distinguishes source statements from the explicitly owned extensions and corrections.

| Target | Locator opened | Hypotheses and support checked |
|---|---|---|
| §0.2, Hecke operators, V_x and diamonds | CG18 line 4628, especially lines 4632–4648, §9.2, pp.412–413; polynomial at line 4688, p.414 | The homological correspondence and positive diagonal representatives are present. The cohomological direction is now fixed through ALS.3.5, not inferred by copying forward homology arrows. The source's extra normalization conflicts with its polynomial; the package consistently uses unnormalized operators. |
| §1.3, corrected Lemma 8.2 | CG18 line 4440, Lemma 8.2, pp.407–408 | Residual comparison and dimension are present. Literal-ring coefficient flatness and unrestricted irreducibility are not certified. The package restricts character places to trivial residual data and keeps characteristic-zero-minimal-prime/component statements, with the completed-product gap. |
| §1.5, framing and presentation | CG18 line 4494, Lemma 8.3, p.409; line 4521, Proposition 8.4, p.410 | Nonempty T, j=n²·card(T)−1, fixed determinant, trace-zero adjoint and exact annihilator local conditions are retained. The local-to-global presentation uses relative tangent/Selmer dimensions, not an unframed count. |
| §2.2, local compatibility and diamond coordinate | CG18 line 4700, Conjecture B(1)–(3), p.414; line 3156, Conjecture A(3), pp.374–375 | Local deformation types agree. Conjecture B does not itself state the all-intermediate-level, all-finite-coefficient inertia–diamond equality. The README explicitly adds it as clause (6), using the PGL deck coordinate and its inverse exponent. |
| §2.7, O[Δ_Q]-linear surjection | CG18 line 4722, paragraph after Conjecture B, p.415 | The source states the deformation-to-Hecke surjection. Scalar linearity in this strengthened simultaneous setting uses the additional clause of §2.2, which is retained as a hypothesis, not supplied by this source passage. |
| §2.8, small-rank range | CG18 line 4744, Remark 9.3, p.415 | PGL₃/ℚ and PGL₂ over CM quartics are the two cases. H⁰/H¹ vanishing, total cohomological range and duality are separately supplied/contracted. The upper dual degree is d−1, correcting the source's q₀−1. |
| §3.1, determinant-square reduction | CG18 line 4815, proof of Lemma 9.6, p.417 | The source's integral intersection does not give its asserted quotient for every component lattice. The package instead uses Γ∩PSL₂(F), the actual determinant kernel, and prime-to-p invariants. |
| §3.2, every-prime amalgams | CG18 lines 4827–4839, proof of Lemma 9.6, pp.417–418 | The source proves the convenient principal-component case and indicates the other lattice pairs. The README owns the component-indexed construction, names its strong-approximation/tree inputs and uses no generator of a nonprincipal ideal. |
| §3.3, squared operator | CG18 line 4843, proof of Lemma 9.6, p.418 | The scalar representative diag(ϖ,ϖ⁻¹) and distance-two operator are present. The displayed source normalization/augmentation inference is not taken on trust. The package's explicit compatible tree-chain map has augmentation 1 before multiplication by q⁻². |
| §3.7, PGLₙ descent | CG18 lines 4897, 5027 and 5097, §9.4/Theorem 9.16, pp.419–424; CGH20 line 230, proof of Theorem 3.2, arXiv v1 p.6; KT17 lines 1893–1906, Lemma 6.25(4), arXiv v2 p.41 | These detailed comparisons are GLₙ statements in their respective settings. The package owns a conditional PGLₙ comparison, requires the principal-series block at every successive level, and retains derived central descent and the tame-tower contract. The ordinary full-Iwahori KT lemma is not treated as an unconditional PGL theorem. |
| §4.1, minimal complexes | CG18 lines 5111–5159, §9.5, pp.425–426 | Minimal representatives, selected-root localization and the dual coefficient/ideal enter here. The README retains the full transposed projector and transported scalar. Perfectness at p-torsion stabilizers is an explicit contract, not imported from a neat-cover theorem. |
| §4.3, comparison modulo ϖ | CG18 lines 5161, 5183–5187 and 5200–5224, proof of Theorem 9.19, pp.426–427 | Residual coefficient and deformation identifications are present. The package corrects the degree reflection, requires compatibility before augmentation and uses top-cokernel base change, rather than asserting arbitrary-degree ordinary base change. |
| §5.4, near faithfulness | CG18 line 5166, Theorem 9.19, p.426; proof at lines 5228–5239, p.428 | The actual module is H^{q₀}(Y,E/O)^∨_m with the arithmetic deformation action. Paired patching, nonzero support, component transfer and module torsion-freeness are retained. Literal-ring flatness is not silently reintroduced. |
| §5.5, smooth R=T and freeness | CG18 lines 3728–3745, Theorem 6.4(1), p.389; CGH20 lines 287–315, §4, arXiv v1 pp.7–8 | The smooth local factors and nonzero patching seed are required. Positive-rank freeness, faithful action and augmentation justify R=T. This is not asserted for the nonsmooth literal R_triv factors. |
| §5.10, totally real defect zero | CG18 line 4167, §8.1, p.401; line 4339, §8.4, pp.405–406 | This is a stated specialization of the general argument, not a separately numbered source theorem. For n=2, ℓ₀=0 and q₀=[F:ℚ]; the dimension comparison is with the framed scalar ring. All §5.8 hypotheses remain in scope. |

### Computed adversarial pass

“Retained” means the tested statement excludes the wrong model or gives the computed value; it is not a claim that finite testing proves the theorem. Rerun computations cover every repaired convention, the sampled numerical formulas and the R01 repair. Unchanged support, local-ring, finite-coefficient and degree-reflection tests below also retain the preceding review's explicit computed evidence after comparison with the complete present statement.

| Statement | Instances tried | Values on the compared sides | Result/change |
|---|---|---|---|
| Standing domain and defect convention | n=2 over ℚ, imaginary quadratic, real quadratic; n=3 over ℚ; n=2 over a CM quartic | (d,q₀,ℓ₀)=(2,1,0),(3,1,1),(4,2,0),(5,2,1),(6,2,2); each has d=2q₀+ℓ₀ | Retained. n=0,1 and p=2 are outside the standing rank-n domain; rank one is separately scoped. |
| §0.1, scalar descent and residual coefficients | χ of order 5, tuples (χ,χ⁻¹) and (χ,1) | Scalar restriction 1 versus χ≠1; both individual χ reduce to 1 modulo ϖ; χ·χ⁻¹=1 for coefficient evaluation | Retained. R01 constructs the forbidden nontrivial-product case. |
| §0.2, positive action and adjoint | C₃, r(i)=i+1, f=δ₀; identity map | Pullback (0,0,1), forward pushforward (0,1,0); identity gives (1,0,0) on both; adjoint pairings at e₂ are 1=1, wrong inverse gives 0 | Repaired F01 passes. |
| §0.2, nonabelian composition | S₃, g=(12),h=(23), f=δ₁,x=(132) | gh=(123),hg=(132); f(xgh)=1, f(xhg)=0 | Repaired right-translation pullback gives the correct order; a cyclic-only test would not distinguish it. |
| §§0.2, 2.1 and 5.8, polynomial normalization | PGL₃,q=2, normalized roots (2,3,1/6) | Arithmetic roots (4,6,1/3); sum 31/3, pair sum 82/3, product 8. Positive coefficients (1,−31/3,82/3,−8); inverse correspondence gives (1,−41/3,62/3,−8) | Positive formula retained through the endpoint. Mod 5 both tuples are (1,3,4,2); mod 25 they are (1,23,19,17) and (1,3,4,17). |
| §0.3, simultaneous image and coefficient powers | k[ε]/ε² acting on k and itself; O→O with differential ϖ | ε·k=0, ε·1=ε≠0 on the second module; ε²=0 on both. Integral H=(0,k); modulo ϖᵃ, kernel and cokernel each have length 1 | Retained. Neither top-cover-only action nor residue-only action determines the image used here. |
| §0.3, finite local factors | O[t]/t(t−1) | Evaluations give O×O; t=(0,1),1−t=(1,0), product 0 and sum 1 | Existing IHG decomposition is imported. No new generic local-factor construction. |
| §0.4, projector and simple root | V eigenvalues 2,4 over 𝔽₇, Q(X)=X−4; extra eigenvalue 1; repeated root 1 | Q(2)=5,Q(4)=0,Q(1)=4; 6!-powers give 1,0,1. At repeated root, Q(1)=0 | Selected local factor and simplicity are both retained; factorial powers alone do not remove the extra factor. |
| §0.5, coefficient duality and scalar transport | Cohomological eigenvalue ζ₅²; coefficient χ(g)=ζ₃ | Standard same-labelled homology ζ₅⁻², transported scalar ζ₅²; evaluation χχ⁻¹=1 versus χ²≠1 | Repaired inverse coefficient, adjoint ideal and transported action all agree. |
| §0.6, minimal residual modularity | A single k in degree q₀+1; level-one modular boundary; stabilizer C₃ in characteristic 3 | Total residual dimension 1, degree-q₀ dimension 0; H²_c=k versus H²=0; H¹(C₃,k)=H²(C₃,k)=k | Retained total-support definition. No hidden neatness or immediate lowest-degree implication. |
| §1.1, balanced real involution | n=4,p=5, c=I; balanced dimensions (2,2); ranks 2,3,4,5 | tr(I)=4=−1 but dim ad⁰ invariants=15, versus 7 for (2,2). Balanced counts are 1,4,7,12 | Trace-only wrong model excluded; balanced hypothesis retained. |
| §1.2, literal local ring | O=ℤ₃,q=7, a²=6a=0; Φ=diag(1+X,7/(1+X)), Σ=diag(1+a,1−a) | detΦ=7,detΣ=1,trΣ=2,Σ⁷=Σ; tr(Φ(Σ−1)) is killed by 6 but has nonzero mod-3 linear term 2aX | Literal quotient need not be coefficient-flat. Flat-closure replacement remains excluded. |
| §1.3, local comparison and component restrictions | n=2, imaginary quadratic, one p-place,R=∅; trivial versus regular inertia; split nonscalar Frobenius at a character place | Local Krull dimension 1+3+2=6. rank(Σ−1)=0 versus 1. Two reciprocal character assignments give 2 components rather than 1 | Correct smooth factor and trivial-residual restriction retained; completed-product assertions remain contracted. |
| §1.4, arbitrary simple generalized line | Φ=diag(4,J₂(3)) over 𝔽₇ | detΦ=4·9=1; selected line dimension 1; gl centralizer dimension 3, ad⁰ dimension 2; tangent dimension 3 gives 3−2=1 | Nonsemisimple complement belongs to the named supplier extension, not the narrower semisimple theorem. |
| §1.4, two-scalar inertia and deck coordinate | Rank two dual numbers; rank three Δ=C₅ | (1+ε)(1−ε)=1 and ramified tangent dimension 1, versus 0 with unramified complement. 1−n=3, inverse 2; 3·2=1 mod 5 | Correct condition and augmentation. θ=1 forces η=1 on the p-primary group. |
| §1.5, framing/presentation | n=2,card(T)=1,2,0 | j=3,7,−1 respectively; the last instance is excluded by T≠∅. Zero adjoint gives both sides 0 in the relative Euler identity | Integer count and nonempty framing retained; no natural-subtraction junk value. |
| §1.6, numerical coincidence | Imaginary quadratic,n=2,card(T)=1,q=3; q=0 control | g=0,j=3,dim R∞=6=1+3+3−1. q=0 would give g=−3 and cannot be admitted in the presentation range | Retained; exact-cardinality auxiliary selection is its declared rank-n contract. |
| §1.7, characteristic-zero point and weights | O⟦X⟧→O′,X↦0; n=2,p=3 | Image is O, possibly smaller than O′. Weights 0,1 lie in [0,p−2]=[0,1]; contravariant realization has these positive weights, covariant has 0,−1 | Image-order and Fontaine–Laffaille sign dictionary retained. |
| §1.8, separate GL₁ illustration | ℚ, imaginary and real quadratic; Δ=C₃ | ℓ₀=r₁+r₂−1 is 0,0,1; O[C₃] rank 3 and mod-3 relation (t−1)³=0 | Rank-one class-field input is imported, not an extension of the rank≥2 domain. |
| §2.1, Galois type and honest realization | 1⊕ε̄; k[ε]/ε²→k; trace 3,determinant 7 | Reducible polynomial X²−(1+λ)X+λ has roots 1,λ. Quotient kernel (ε)≠0 but square 0. Arithmetic polynomial X²−3X+7; inverse has trace 3/7,determinant 1/7 | Irreducibility, actual Hecke-valued representation and arithmetic Frobenius remain explicit. |
| §2.2, all-coefficient diamond compatibility | n=3,Δ=C₅, θ(d)=ζ₅; square-zero coefficient thickening | [d] acts as ζ₅², [d³] as ζ₅; opposite homology as ζ₅⁻². ε acts 0 on k but nonzero on k[ε]/ε² | Repaired action and the strengthened all-level/all-coefficient clause exclude both wrong models. |
| §2.3, short range and boundary | (q₀,ℓ₀)=(1,1); modular level-one boundary | Allowed degrees {1,2}; excluded 0,3. H²_c=k and H²=0 before boundary localization | Range and boundary vanishing remain separate assumptions; one does not imply the other. |
| §2.4, no new cohomology | Rank two roots α=2,β=4 in 𝔽₇, q≡1 | αβ=1, α+β=6; Gram determinant 4−36=3, α²−1=3, both units; repeated roots 1,1 give 0,0 | Simple-root selection and the chosen summand are essential and retained. |
| §2.5, hypothesis bundle | Zero complex; nonzero k only in degree q₀+1 | Zero complex has every cohomology dimension 0; second has total dimension 1 but bottom 0 | Nonzero seed is separately required; the bundle is not a free predicate replacing missing carriers in Lean. |
| §2.6, dévissage | C₃ over k=𝔽₃; O→O by ϖ | H¹(C₃,k)=k despite 3=0; mod-ϖᵃ kernel and cokernel of ϖ both length 1 | Coefficient exact sequences and p-primary descent, not averaging by group order or arbitrary base change, are retained. |
| §2.7, deformation-to-Hecke scalar map | Δ=C₅,n=3; augmentation | Exponent (1−n)⁻¹=2, composition 3·2=1; augmentation [d]↦1 forces θ(d)=η(d)=1 | Source and target scalar actions agree after repair; ordinary surjectivity alone would not establish this. |
| §2.8, low-rank range | PGL₃/ℚ and PGL₂/CM quartic | (d,q₀,ℓ₀)=(5,2,1),(6,2,2); allowed {2,3},{2,3,4}; H¹ dual degrees 4 and 5, not q₀−1=1 | Correct total-range/duality inputs and d−1 correction retained. |
| §3.1, determinant kernel | Γ=diag(2,1)PSL₂(ℤ)diag(2,1)⁻¹ | Γ∩PSL₂(ℚ)=Γ, index 1; integral intersection index 3 and not normal. C₂ averaging in 𝔽₃ uses 2⁻¹=2; in 𝔽₂, H¹(C₂,k)=k | Rational determinant kernel and odd p retained. |
| §3.2, nonprincipal auxiliary prime | Norm-7 prime of ℚ(√−5); adjacent lattice vertices | a²+5b²=7 has no integral solution; nevertheless local q=7 gives edge index 8. diag(1,ϖ) moves distance 1, diag(ϖ,ϖ⁻¹) distance 2 | Every-prime/component construction retained; no global generator is used. |
| §3.3, positive squared chain map | Regular trees q=2 and 7, oriented e=v₁→v₀ | Edge terms q²=4,49; F(v₁)=A₁v₁−qv₁ and F(v₀)=A₂v₀−qA₁v₀+v₀ both have augmentation 1; every coefficient of ∂F−F∂ is 0 | Repaired direction passes. Normalized augmentation is q⁻², not 1. |
| §3.4, Lyndon grading and normalization | q=7 modulo 9; degree zero of amalgam | q²=4,q⁻²=7 mod 9; normalized edge degree 1, normalized vertex augmentation 7. H⁰(G)→H⁰(Γ₀)⊕H⁰(Γ₁)→H⁰(Γ_e) gives k→k²→k with dimensions 1,2,1 | Correct grading and compatible chain/cochain map retained. (q−1)²=0 mod 9 does not change 7 to 1. |
| §3.5, rank-two comparison | q=29,p=7,α=2,β=4; repeated root control | (q+1)²−(α+β)²=3 mod 7; α²−q⁻²=3; repeated α=β=1 gives 0 | Invertibility on the selected factor verified; the theorem does not assert elimination on the whole anemic localization. |
| §3.6, infinite-tower descent | Trivial k under ℤ_p versus regular smooth C_cts(ℤ_p,k) | Trivial module has H⁰=H¹=k; regular module H⁰=k and H¹=0 | Fixed-exponent continuous derived descent and the block hypotheses remain necessary; finite descent cannot replace them. |
| §3.7, central/successive-level comparison | Q={x,y}; roots 1,2,4 in 𝔽₇; central C_p | Four conditions (x,∅),(x,{y}),(y,∅),(y,{x}); root product 1 and (1−2)(1−4)=3. H¹(C_p,k)=k, not 0 | All successive base levels and derived central terms are retained. Repeated root would give projector value 0. |
| §4.1, minimal models and action type | k→k by 0; O→O by 1; Ext¹_O(k,k) | Minimal ranks (1,1) versus (0,0); Ext¹_O(k,k)=k contains a nonzero map acting 0 on cohomology | No derived action of the cohomological image is inferred. Adjoint projector and transported scalars pass the repaired tests. |
| §4.2, reflected degrees and presentation | q₀=ℓ₀=1; maps (x,z) and (x+z²,z) | T⁰=H²∨,T¹=H¹∨; incorrect i−ℓ₀ gives H⁻¹,H⁰. Presentation maps differ by z² before augmentation and 0 after z=0 | Correct reflection and pre-augmentation compatibility retained. |
| §4.3, top-degree reduction | C=[O→O], differential ϖ | Top cokernel k base-changes to k; lower integral kernel 0 but reduced lower kernel k | Top-cokernel comparison is valid; arbitrary lower-cohomology base change would be false. |
| §4.4, finite framing quotients | O⟦z⟧/(ϖ²,z²,ϖz) | As O-module: O/ϖ²⊕kz, length 3; ϖz=0 with z≠0 | Nonflat finite-quotient actions and commuting reductions remain actual hypotheses of patching, not consequences of a strict derived action. |
| §5.1, depth/amplitude concentration | Framed scalar dimension 7, amplitude 1, codimension at least 1; zero control | Nonzero concentration gives degree 1 and depth 7−1=6; zero module has no nonzero top group | Nonzero arithmetic seed and codimension hypotheses retained. |
| §5.2, near faithfulness versus faithfulness | A=O[ε]/ε², M=O | ann(M)=(ε)≠0, ann(M)²=0, support(M)=Spec A | Correct near-faithfulness conclusion; no unsupported integral faithfulness. |
| §5.3, component transfer | A=O⟦x,y⟧/(xy), M=A/(x) | M is O-torsion-free, but mod-ϖ support is V(x), missing the generic point of V(y) | Module torsion-freeness alone is insufficient; full residual support and component matching are retained. |
| §5.4, actual near-faithful module | Same nilpotent-ring model; zero module control | Nonzero M above has nilpotent annihilator; ann(0)=A, with 1ⁿ=1≠0 | Nonzero patched seed and its actual R_S-action are retained. The theorem is not encoded by arbitrary-ring hypotheses in Lean. |
| §5.5, freeness and R=T | M=Rʳ with r=1 versus r=0 | ann(R)=0 and action image R; ann(0)=R and action image 0 | Positive-rank freeness and nonzero seed retained; rank-zero would not prove R=T. |
| §5.6, cuspidal recognition | Residual Speh block of length 2, n=4 | Roots (a,a,b,b), each multiplicity at least 2; number of simple eigenvalues 0 | Big-image simple-eigenvalue detector rules out this residual alternative, after the separately contracted proper-support dichotomy. |
| §5.7, two seed branches | Characteristic-zero lattice Oᵃ,a≥1; torsion class only in degree q₀+1 | Reduction dimension a≥1; torsion example total dimension 1 but bottom dimension 0 | Branch (a) gives bottom support; branch (b) gives only total support before patching. |
| §5.8, point support and eigenclass | O⟦X⟧→O′ with X=0; O[ε]/ε²→O′ reduced | Image fraction field Frac(O), not necessarily Frac(O′); ε maps to 0; support fibre of the model M=O has dimension 1 | Correct image-field and reduced-point arguments retained. |
| §5.8, determinant-one character construction | n=2,p=5,exponents (0,1) in C₅ | Written positive shift 3 gives (3,4), sum 2 and product χ²≠1; subtraction gives (2,3), sum 0 and product 1 | Fails; R01. Exact subtraction repair tested above. |
| §5.9, imaginary-quadratic specialization | F=ℚ(i),n=2,q=3,R=∅,p=5 and 7 | d=3,q₀=ℓ₀=1; card(T)=2 and 1; g=1 and 0 | Correct specialization of the stated Fontaine–Laffaille/split-ramification domain; remaining conjectural clauses are not dropped. |
| §5.10, defect zero | Real quadratic F,n=2,card(T)=1,q=3 | ℓ₀=0,q₀=2,g=1,j=3; dim R∞=7=dim S∞^□, while dim S∞=4 | Framing is retained; singleton amplitude reduces to module patching. |

The excluded degenerate inputs were also checked against the standing domain: O is the mixed-characteristic integer ring of a finite p-adic extension, so a field as coefficient ring, the zero ring and equal-characteristic DVRs are not silently admitted; ramification of O is allowed and formulas use ϖ rather than p. F is a number field, so inseparable field inputs are excluded. Coefficient exponents satisfy a≥1, n≥2 and p>n; a zero module cannot meet the nonzero seed. R=∅ is allowed, while T=∅ is not allowed in the framing count. Auxiliary residue norm is a genuine finite-field cardinality, not the integer 1. Every denominator used in the computed formulas is either a p-adic unit (n, n−1, q, a prime-to-p index) or belongs to the explicitly indicated characteristic-zero field.

### Supplier resolution, ownership and duplication

The supplied `roadmaps resolve`, `roadmaps show` and object-based `roadmaps grep` interfaces were used against main and the indexed open heads. The resolver snapshot reported main `bbed953` and 365 open pull requests, index 2026-10-25T16:46:16Z; no unresolved cross-roadmap citation or Lean name was reported. Each cited section was located anew, and the substantive contracts/domain restrictions were read. Library-name resolution was checked directly at the pins because the service's library phase did not have Lake packages available.

The table records the resolved supplier locations, not assertions that all prospective supplier theorems are already proved. Main roadmaps are used on main; new roadmaps are used at their supplied open heads. Line numbers below refer to README files, not the one-line wrappers printed by `roadmaps show`.

| Supplier | Resolved sections and representative file locators | Boundary/ownership checked |
|---|---|---|
| ArithmeticLocallySymmetricSpaces | `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:1343`, ALS.0.7–0.10; :1666, ALS.1.1–1.8; ALS.2.2–2.4; :2803, ALS.3.5 within ALS.3.3–3.9; :3240, ALS.3.14; ALS.4.1/4.9–4.12; :4002, ALS.5a.4 within ALS.5a.2–5a.6; ALS.5b.4–5b.6; ALS.6.1–6.3 | Positive correspondence and coefficient map agree. ALS.1.6 requires a free full-group model; ALS.5a.6 has invertible-degree restrictions. Neither silently supplies arbitrary p-stabilizer localization. |
| IntegralHeckeAndGaloisDeterminants | `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:1914`, §§1.2–1.3; :2829, §§2.1–2.3; :1661, §3a.1; :3058, §§3b.1–3b.2 | Generic finite images, local factors, Galois type and the unnormalized polynomial remain imports. The simultaneous orbifold image has its own gap. |
| LocalGaloisDeformationRings | `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:767`, F.2.6–F.2.9; F.1–F.3; :1377/:1465/:1495, §§1.6/1.10/1.13; :1882/:1916/:2003/:2024/:2120/:2146, §§2.8/2.10/2.15/2.16/2.21/2.23 | Fixed determinant, literal quotients and minimal regular-unipotent factors are imported. Semisimple two-scalar §2.16 is not confused with unramified-complement §2.23. Fontaine–Laffaille signs use the separate PadicHodgeTheory dictionary. |
| GlobalGaloisDeformations | `TauCetiRoadmap/GlobalGaloisDeformations/README.md:407`, §§3.3–3.7; :761, §§4.3–4.4; §5.1; :1287, §§5.5–5.8; :1844, §§7.2–7.4 | Representability, presentations, inertia augmentation and framing are supplied. Exact-q general-rank big-image selection remains an extension, not the existing rank-two result. |
| ArithmeticGaloisRepresentations | `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:4126`, §§7.2/7.4; :4661, §§7.7–7.12 | Balanced involutions and trace pairing are supplied; CHT big, adequate and enormous conditions are not identified. |
| ArithmeticGaloisDuality | `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:6413`, R02.5.1; :6562, R02.5.2; :6751/:6856, R02.6.1–6.2 | Exact annihilator local conditions and balanced real-place dimensions remain explicit. Rank-one unit-rank difference is imported. |
| DeformationAndDerivedPatchingAlgebra | `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:276`, §1.12; :526, §§3.1–3.4; :733, §3.10; :979, §4.6; :1213, §§6.1–6.8; :1382/:1450, §§7.3/7.6; :1663, §8.6; :1704, §§9.1–9.2 | Generic support, depth, minimal models and cohomology-action patching are imported. Paired residual action and literal completed-product extensions are separately contracted. |
| CompletedCohomologyPartII | `TauCetiRoadmap/CompletedCohomologyPartII/README.md:1580`, §6.2; §§0.1–0.3/1.1 | Fixed-exponent discrete smooth descent exists at p-level. Tame x-level with stabilizers is the declared extension. |
| SmoothRepresentationsOfLocalGroups | `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:4660`, SR.5.3 | The block and derived hyperspecial/parahoric theorem is GLₙ, with local admissibility and specified simple subquotients; bare distinct residual roots do not replace it. |
| ReductiveGroupsPartII | `TauCetiRoadmap/ReductiveGroupsPartII/README.md:3698`, Ihara statement in RG2.2.4 | Adjacent-vertex SL₂/PSL₂ amalgam is supplied; distance two is not used for edge gluing. |
| FreeGroupsAndLimitGroups | `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md:863`, §4.5; :937, §4.8 | Generic segment pushout and tree-without-inversions theorem are imported. |
| ModularCurvesPartII | `TauCetiRoadmap/ModularCurvesPartII/README.md:4171`, §15.2; :4218, §15.4; :4317, §15.8 | Principal congruence level over ℚ is the supplied case; arbitrary-number-field component assembly is not falsely attributed to it. |
| AdelicAlgebraicGroups | `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:3987`, §4.2; :4926, §5.1 in AA.5 | SL₂ strong approximation with a noncompact local factor and GL₁ logarithmic tori are supplied. The archimedean compact factors give the stated unit-rank dimension. |
| AutomorphicFormsOnReductiveGroups | `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:760`, §5.3; :806, §5.5, within Layers 4–6 | PGL defect/range, purity, centre and Hecke conventions are supplied. The cuspidal infinity-type hypotheses are retained. |
| AutomorphicSpectralTheory | `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:2522`, §4.14a; :2903/:2914/:2925, §§5.12–5.14 | Number-field Speh classification and proper-support objects are imported; the ordinary-cohomology boundary/residual alternative is a separate contract. |
| KTheoryLowDegrees | `TauCetiRoadmap/KTheoryLowDegrees/README.md:1090`, §11.6 | Character factorization through a congruence quotient, including a common neighborhood, is imported. It does not already assert geometric localized H¹ vanishing. |
| PadicHodgeTheory | `TauCetiRoadmap/PadicHodgeTheory/README.md:1134`, §§6.1–6.2 | Covariant negative versus contravariant positive weights and the [0,p−2] interval are explicit. |
| ClassFieldTheory; Chebotarev | `TauCetiRoadmap/ClassFieldTheory/README.md:1312` and :1683, Layers 7/11; `TauCetiRoadmap/Chebotarev/README.md:410`, Layer 10 | Arithmetic Artin normalization and finite-avoidance Chebotarev are supplied, not rebuilt. |
| PotentialAutomorphyInfrastructure | `TauCetiRoadmap/PotentialAutomorphyInfrastructure/README.md:1260`, Layer 3; :2091, Layer 4; :2256, Layer 5 | CM good-level lifting, its ordinary/full-Iwahori structures and nilpotent-quotient actions are distinct from this conditional Res PGLₙ construction. |
| ModularityAndLanglandsExtensions | `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:947`, §2.7; :975, §2.8 | Its GLₙ Conjecture B and lifting endpoint, including its arithmetic-verification ownership sentence, were read. The package explicitly distinguishes its stronger Res PGLₙ/all-level/balanced/split-ramification variant and introduces no duplicate Lean declaration. |

Object searches covered literal character-polynomial rings, Ihara avoidance, paired cohomology-action patching, near faithfulness, Conjecture B, distinct-root comparisons, fixed-exponent descent, determinant-square components and amalgams. Broad search output was followed by narrower untruncated searches. Generic carriers, local rings, smooth local blocks and abstract patching stay with their named owners. This package owns the component-indexed arithmetic assembly, the conditional derived PGLₙ comparison and the verification of these particular arithmetic patching data. The rank-one example and generic support algebra are supplied illustrations, not competing declarations. No ownership move or upward supply is required by this review.

The board package index was read before making any absence assessment. The readable `packages/AutomorphicCongruences/README.md` at head `b9d6195` concerns ordinary/unitary congruences and does not state this component-indexed CG18 construction. Three relevant indexed board heads could not be retrieved, as recorded below; no absence claim is made about them. Ownership against other open heads whose files were not supplied was not checked beyond the supplied roadmap search interface. There are no fully qualified declarations in this acceptance file to collide with a sibling acceptance file.

### Declared supplier gaps

All eleven plan records have named suppliers; their slugs and needs sentences agree with the README's Exact supplier contracts. Every owner is earlier in the dependency order. Each contract specifies the missing hypotheses and interface, and related compatibility clauses concern that same interface. None asks this package to rebuild an existing generic result. Absence from the supplier today is not a finding.

| Slug | Existing section and exact extension retained |
|---|---|
| `localized-orbifold-range-duality` | ALS.5a.6: total range and localized duality at p-torsion stabilizers, independently of the desired short range. |
| `localized-orbifold-perfect-models` | ALS.1.6: localized perfect O[Δ]-models, given short-range and boundary vanishing at every intermediate cover. |
| `congruence-character-localized-h1` | ALS.4.9–4.12: specified PGL₃/ℚ and PGL₂/CM-quartic localized H⁰/H¹ consequence of KTheoryLowDegrees §11.6. |
| `simultaneous-orbifold-hecke-finiteness` | IHG §2.1: simultaneous finite image across intermediate levels, all degrees/coefficient powers and finite-module coefficient actions. |
| `big-image-rank-n-taylor-wiles` | GlobalGaloisDeformations §§5.6–5.8: exact-q selection for the standing rank-n big-image datum with finite avoidance and zero new relative dual Selmer group. |
| `cht-big-image` | ArithmeticGaloisRepresentations §§7.7–7.12: the exact simple-eigenprojector detector, coefficient extension and simple-eigenvalue consequence. |
| `character-ring-completed-products` | DeformationAndDerivedPatchingAlgebra §4.6/§§6.7–6.8: completed products for literal potentially coefficient-torsion character rings, after geometric splitting. |
| `paired-cohomology-action-patching` | DeformationAndDerivedPatchingAlgebra §8.6: paired finite-cutoff residual/top-module actions and augmentation comparisons. |
| `proper-support-boundary-or-residual` | AutomorphicSpectralTheory §§5.12–5.14: ordinary-cohomology proper-support dichotomy over number fields. |
| `nonsemisimple-two-scalar-taylor-wiles` | LocalGaloisDeformationRings §2.16: generalized complementary eigenspaces, two scalar inertia characters, representation, tangent contribution and augmentation. |
| `tame-place-fixed-exponent-descent` | CompletedCohomologyPartII §6.2: actual tame x-level smooth colimits and continuous derived descent, with arithmetic stabilizers retained. |

These eleven contracts would remain conditions of any eventual acceptance. R01 needs no new gap.

### Pinned APIs, headline coverage, shape and elaboration

Pins read from `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Native objects were searched by their mathematical contents, not just proposed declaration names. The following declarations and contexts were opened directly.

| Declaration | File and line at the pin | Content/limit |
|---|---|---|
| `Field.absoluteGaloisGroup` | `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42` | Body `AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K`, with Krull topology in the file. It supplies no deformation condition. |
| `Representation` | `Mathlib/RepresentationTheory/Basic.lean:48` | Body `G →* V →ₗ[k] V`; continuity is not included. |
| `IsHeckeTriple`, `HeckeCoset`, `HeckeRing` | `Mathlib/NumberTheory/HeckeRing/Defs.lean:75`, :157, :189 | Commensurability, double-coset quotient and finitely supported coefficients; convolution instances are separate and arithmetic cohomology is absent. |
| `Module.support_eq_zeroLocus` | `Mathlib/RingTheory/Support.lean:216`, finite-module context at :196 | Finite generation is required. Full support concerns the annihilator's radical, not faithfulness. |
| `Monoid.PushoutI` | `Mathlib/GroupTheory/PushoutI.lean:60` | Native quotient for the generic amalgamation; no need to rebuild it. |
| `groupCohomology.coindIso` | `Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean:58` | Discrete subgroup/representation Shapiro over a commutative ring, with no finite-index requirement. This is not continuous tower descent. |
| `TauCeti.MonoidAlgebra.augmentation` | `TauCeti/Algebra/MonoidAlgebra/Exactness.lean:115`, singleton law :120 | Coefficient sum: [g]↦1, [g]−1↦0, 2[g]+3[h]↦5. |
| `TauCeti.GL2PrincipalSeries` | `TauCeti/RepresentationTheory/CharacterTable/GL2/PrincipalSeries/Basic.lean:245`, context :240 | Finite field F, complex finite-dimensional representation of GL₂(F); not the smooth local rank-n block. |
| `selmerGroupAbove` | `TauCeti/RingTheory/DedekindDomain/PrimesAbove.lean:224` | Subgroup of multiplicative power classes defined by valuations; not the relative adjoint deformation Selmer group. |

The generic complex, module, matrix, representation and support carriers exist. Searches found no native arithmetic quotient/local-system/tower carrier, Fontaine–Laffaille deformation-ring construction or global representing-ring/cohomology action that would make these headlines statable by a few simple definitions. The README headline list and the module docstring agree:

| README headline | Acceptance-file treatment |
|---|---|
| §1.3 corrected local comparison | Named as unstatable: literal arithmetic character-polynomial rings and their completed products are missing. |
| §1.6 auxiliary sets and numerical coincidence | Named: local conditions, relative adjoint Selmer groups, big-image detector and global representing rings are missing. A standalone dimension identity would be a substitute. |
| §3.5 rank-two Taylor–Wiles comparison | Named: arithmetic quotient cohomology, component maps, local systems and selected ideals are missing. |
| §3.6 GLₙ distinct-root comparison | Named: arithmetic tower, localized smooth block module and derived comparison are missing. |
| §3.7 conditional PGLₙ comparison | Named: central-character descent and arithmetic derived-cohomology carriers are missing. |
| Layer 4/§5.1 paired arithmetic patched complexes and top modules | Named: finite-cutoff arithmetic data, actions and paired comparisons are missing. |
| §5.4 near faithfulness | Named: actual minimal deformation ring and lowest arithmetic cohomology dual/action are missing. |
| §5.5 minimal R=T and freeness | Named: actual deformation/Hecke image rings and geometric module are missing. |
| §5.6 cuspidal recognition | Named: locally symmetric eigenspace and automorphic representation carrier are missing. |
| §5.8 support-to-eigenclass deduction | Named: deformation point and arithmetic cohomology action are missing; the existing GLₙ endpoint is explicitly distinguished. |
| §§5.9–5.10 imaginary-quadratic and defect-zero applications | Both named: the same arithmetic/automorphic carriers are missing. |

`Suggested.lean` has one `import Mathlib`, one module docstring, its namespace and no declarations. There are zero theorems, definitions, instances, admitted examples, sorry'd data or `set_option` commands. A mechanical enumeration of declarations produced an empty list of `#check @name` commands; a scratch copy with that complete empty appended list was elaborated. There were no lost binders or signature discrepancies. The one-tactic padding probe has zero candidates. No arbitrary `Prop`, generic algebra stand-in or weakened headline is inserted. A bare numerical formula or generic support lemma would be padding here, not a missing headline.

Main-branch shape examples read were `TauCetiRoadmap/ComplexTori/README.md` and `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md`. The package has the required scope, conventions, per-supplier contracts, build-order paragraph, six numbered layers with examples/dependencies, downstream consumers and references. Definitions have prose API facts and at least three discriminating Checks; targets have hypotheses, locators and Needs lines. The retained mathematics is not an executable computational algorithm. No source passage was copied, no route restricted to principal/good auxiliary primes, and no package file was edited during this review. R01 is the one failing mathematical construction found.

Validation outcomes:

- Prescribed `lake env lean` elaboration of `packages/AutomorphyLiftingBeyondTaylorWiles/Suggested.lean`, using its absolute argument from the pinned content environment: exit 0, no diagnostics and no warnings. No TauCeti import needed a targeted build.
- Mechanical signature-audit copy, elaborated separately after the first command finished: exit 0, no diagnostics or warnings; zero declarations and zero discrepancies. No Lean process was left running.
- Citation resolution: no unresolved cross-roadmap citations or Lean names; direct pin checks supplied the library evidence above.
- Metadata/source TOML and plan JSON parsed; all eleven gaps matched their README contracts.
- Exact finite computations passed the repaired correspondence tests; the positive exponent translation failed and its subtraction repair passed.
- The final prescribed movable dependency check exited 0 with the complete output below. No UPWARD, CYCLE or moved line occurred.

```text
depcheck: 55 roadmaps, 630 edges, 0 problem(s)
```

## Not verifiable

- `packages/ArithmeticLocallySymmetricSpacesPartII/README.md` at the board index's head `c1b8f80`: retrieval of that exact content path returned HTTP 404. Ownership against that package head is not certified; this is not a claim that the package does not exist.
- `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md` at indexed head `777a863`: the exact-path retrieval returned HTTP 404; the same ownership limitation applies.
- `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md` at indexed head `7e88c38`: the exact-path retrieval returned HTTP 404; the same ownership limitation applies.
- CGH20's published-appendix cross-numbering was not independently checked against the published appendix. All substantive CGH20 checks use the explicitly cited arXiv v1 locators, which were readable. No claim of a published correction is made.
- Prospective supplier gaps are not proofs available at the pins. Their precise ownership, hypotheses and declaration were checked; their mathematical construction remains the stated supplier contract. This is not a missing-source request or an additional finding.

All three source texts needed for this round's sample were readable. No new reference request was needed. No absence conclusion is drawn about unavailable open-work files.

## Source issues

The source statements below were compared with the package's corrected claims and the computations above. These are source errata, not additional package findings; the package explicitly corrects or strengthens the relevant input.

- **Error** in CG18 at Lemma 8.2(1), printed p.407 (CG18 line 4441): the source says the literal local character-polynomial rings are p-torsion-free; it should be a statement about characteristic-zero minimal primes without coefficient flatness of the literal quotient; affects a stated result.
- **Error** in CG18 at Lemma 8.2(3), printed p.408 (CG18 line 4448): the source says the character-deformed spectrum is irreducible for its full residual domain; it should require the appropriate trivial residual local data or distinguish character-assignment components; affects a stated result.
- **Error** in CG18 at the proof of Theorem 9.19, printed p.426 (CG18 line 5180): the source says the literal patched rings are p-torsion-free by Lemma 8.2; it should use characteristic-zero minimal primes and prove torsion-freeness of the maximal-depth module; affects the proof.
- **Error** in CG18 at §8.4, equation (1), printed p.406 (CG18 lines 4374–4394): the source says trace in {−1,0,1} implies the displayed real-place adjoint count in positive characteristic; it should require balanced complex-conjugation eigenspace dimensions; affects a stated result.
- **Misprint** in CG18 at §9.2 and Conjecture B, printed pp.413–414 (CG18 lines 4660 and 4688): the source says to divide the Hecke generators by norm powers while retaining the unnormalized characteristic polynomial; it should use unnormalized generators for that polynomial, or consistently change all coefficients; affects a stated result.
- **Misprint** in CG18 at Remark 9.3, printed p.415 (CG18 line 4744): the source says the degree paired with H¹ is q₀−1; it should be dim(Y)−1; affects nothing.
- **Error** in CG18 at the proof of Lemma 9.6, printed p.417 (CG18 line 4823): the source says intersection with PSL₂(O_F) gives the determinant kernel for each component lattice; it should use intersection with PSL₂(F); affects the proof.
- **Misprint** in CG18 at the proof of Lemma 9.6, printed p.416 (CG18 line 4794): the source says the displayed Gram matrix has determinant T_x²−(q+1)²; it should be (q+1)²−T_x²; affects nothing.
- **Error** in CG18 at the proof of Lemma 9.6, printed p.418 (CG18 lines 4862–4865): the source says its q⁻²-normalized squared operator induces scalar 1 on the compatible amalgam term; it should have scalar q⁻² for the compatible chain map of augmentation 1; affects the proof.
- **Misprint** in CG18 at the proof of Lemma 9.6, printed p.418 (CG18 line 4845): the source says H^{i−1}(G) precedes the degree-i vertex term; it should place H^i(G) there, preceded by the degree-(i−1) edge term; affects nothing.
- **Gap** in CG18 at the proof of Lemma 9.6, printed p.418 (CG18 lines 4865–4872): the source says the new contribution vanishes at the whole anemic maximal ideal; it should localize at the selected U_x root before using squared-operator invertibility; affects the proof.
- **Misprint** in CG18 at the proof of Lemma 9.6, printed p.418 (CG18 lines 4873–4874): the source says ordinary powers converge to the root projectors; it should use factorial powers on the specified local factor; affects the proof.
- **Misprint** in CG18 at the proof of Theorem 9.19, printed p.426 (CG18 line 5186): the source says the reflected residual term has degree i−ℓ₀; it should use q₀+ℓ₀−i; affects the proof.
- **Gap** in CG18 at Conjecture B and the proof of Theorem 9.19, printed pp.414–415 and 427 (CG18 lines 4700 and 5211): the source says Conjecture B supplies all required scalar-compatible finite-level actions; it should also require inertia–diamond compatibility on every intermediate level and finite coefficient module; affects the proof.
- **Gap** in CG18 at §9.4, printed p.419 (CG18 line 4897): the source says the GLₙ comparison passes to PGLₙ through the circle-bundle description; it should supply the derived central-character comparison, retaining stabilizers and coefficient naturality; affects the proof.
- **Gap** in CGH20 at the proof of Theorem 3.2, arXiv v1 p.6 (CGH20 line 230): the source says the cited GLₙ arguments yield the required arithmetic level comparison; it should justify the local block hypothesis and the PGLₙ central descent in this setting; affects the proof.
- **Gap** in CGH20 at the proof of Theorem 3.2, arXiv v1 p.6 (CGH20 lines 225–229): the source says Hochschild–Serre detects a nonzero smallest-degree class on the quotient level; it should specify the p-primary cover or restrict the prime-to-p character to its trivial summand; affects the proof.
- **Misprint** in CG18 at §9.1(2), printed p.412 (CG18 lines 4600–4605): the source says the complementary block has size N−1; it should have size n−1; affects nothing.
- **Misprint** in CG18 at §9.2, printed p.412 (CG18 line 4633): the source says the first intersection uses K_Q even when the starting level is K=L_Q; it should use the starting level K; affects nothing.
- **Misprint** in CG18 at Theorem 6.4(1), printed p.389 (CG18 line 3728): the source says R where the patched source ring is meant; it should be R∞; affects nothing.
- **Misprint** in CG18 at Definition 9.1, printed p.413 (CG18 lines 4655–4656): the source says arbitrary units at character places define the stated operators with the preceding restricted definition; it should require identity components there or specify the coefficient intertwiner; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "71f6fd03b5bb918f02b91daee4264d9ad4f1be55", "job": "REV-PKG-AutomorphyLiftingBeyondTaylorWiles~4", "model": "gpt-6-astra", "worker": "chris-32"} -->
