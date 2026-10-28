<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2165#issuecomment-6421364822 -->
Red team round 1 pass a (codex) of 14bd7f6

Verdict: needs_changes

1. **F01** (P1) Condensification does not commute with all six operations

   Location: `packages/AnalyticStacks/README.md:365`, “commutes with all six operations along maps of affines.”

   Claim: the discrete embedding commutes with exceptional inverse image and internal Hom without finiteness conditions.

   Witness: take A = ℤ, B = ℤ[T]. Discrete f^!ℤ is (∏ₙ ℤ)^disc, whereas condensed f^!ℤ is ∏ₙ ℤ^disc. On S = ℕ∪{∞}, n ↦ eₙ, ∞ ↦ 0 belongs only to the latter.

   Exact repair text: “The embedding commutes with tensor products, pullbacks and affine pushforwards f_! = f_*. It commutes with internal Hom when the first argument is perfect, and with f^! when B is perfect over A.” Add the displayed infinite-polynomial example as a negative-control Check. For B = ℤ[T]/T² both Hom objects are ℤ², so the repaired clause agrees on the finite-free test. README 2.2 itself notes the failure to preserve ∏ₙℤ at line 511. RCSolid line 2971 only supplies the fully faithful embedding, not the six-operation assertion.

2. **F02** (P3) The projective-line Check denies ordinary Serre duality

   Location: `packages/AnalyticStacks/README.md:405`, “ℙ¹ → Spec ℤ is not D-suave in the algebraic formalism”.

   Claim: ℙ¹ provides a prim map that is not suave.

   Witness: for f: ℙ¹_ℤ → Spec ℤ, proper smooth duality gives f^!ℤ = O(−2)[1], compatible with base change. This is invertible, hence f is D-smooth and D-suave by 0.9.

   Exact repair text: “Primness does not imply suaveness: Spec ℤ[T] → Spec ℤ is prim but not suave by 1.1. In contrast, ℙ¹_ℤ → Spec ℤ is D-smooth, with dualizing complex O(−2)[1].” This restores the distinction: ℤ[T] has infinite ℤ-rank, whereas proper smooth duality gives the stated invertible line on ℙ¹. The existing supplier contract for SchemeAndStackFoundations §2.19 at line 70 already includes the needed smooth/proper formulas.

3. **F03** (P1) Nilpotent kernel is insufficient for invariance

   Location: `packages/AnalyticStacks/README.md:529`, 2.4(3), “the same holds if the kernel … is nilpotent.”

   Claim: a ring map with nilpotent kernel induces a bijection of analytic structures.

   Witness: ℤ → ℤ[T] has zero kernel. The induced structure (ℤ[T],ℤ)_■ and ℤ[T]_■ are distinct, although both restrict to ℤ_■; ℚ_p with T = p⁻¹ is complete only for the former (README582).

   Exact repair text: “The same holds when π₀A▷ → π₀B▷ is surjective with nilpotent kernel.” Keep ℤ[ε]/ε² → ℤ as the positive Check; add ℤ → ℤ[T] as the negative Check showing surjectivity is necessary. RCSolid Proposition 4.4.5, lines 1968–1975, omits surjectivity too: its proof treats M/IM as a B-module, which requires B = A/I. This is a source error copied into the target.

4. **F04** (P2) Shearing requires a specified t-structure on V

   Location: `packages/AnalyticStacks/README.md:452`, “V a presentable stable symmetric monoidal QCoh(ℚ)-linear ∞-category”.

   Claim: every such V has the asserted Beilinson t-structure and heart of chain complexes in V♡.

   Witness: no t-structure on V is assumed. Take V = Mod_{ℚ[u,u⁻¹]}, |u| = 2: suspension by two is the identity, so no nonzero separated t-structure with the advertised static pieces exists.

   Exact repair text: “The equivalence of categories holds for every presentable stable symmetric monoidal QCoh(ℚ)-linear V. For the t-structure and heart statements, additionally equip V with an accessible t-structure compatible with filtered colimits and tensor products, with the tensor unit connective. Define the Beilinson connective and coconnective halves by the corresponding sheared pieces M_n[n]. In particular these conclusions apply to V = D(A), A a ℚ-algebra, with its standard t-structure.” Supply the precise general t-structure construction as a target rather than inferring a t-structure from ℚ-linearity. The two-term ℚ → ℚ witness remains valid for D(ℚ); the periodic category is covered only by the categorical equivalence.

5. **F05** (P2) The conservative projection is a pushforward

   Location: `packages/AnalyticStacks/README.md:272`, “π₂*: D(Y ×_X Y) → D(Y) is conservative”.

   Claim: the displayed functor is pullback along π₂.

   Witness: π₂: Y×_X Y → Y has pullback D(Y) → D(Y×_X Y). HM Lemma 4.5.10, lines 3598–3600, requires the pushforward π₂_*, with the displayed direction.

   Exact repair text: replace “π₂*” by “π₂_*”. For Y = {0,1} over a point, the corrected functor sends a 2×2 matrix to its two fibrewise sums; pullback instead duplicates a two-entry vector. The affine application 1.1 now correctly uses conservative restriction of scalars.

6. **F06** (P1) Formal-completion self-intersection drops all but one generator

   Location: `packages/AnalyticStacks/README.md:411`, “Z ×_(X^∧) Z = Spec(A/^L f ⊕ (A/^L f)[1])”.

   Claim: the self-intersection in the n-generator setting of 1.4(3) has only one degree-one summand.

   Witness: A = ℤ[x,y], Z = Spec ℤ at the origin. Its self-intersection has π₀=ℤ, π₁=ℤ² and π₂=ℤ; the displayed algebra has π₁=ℤ and π₂=0.

   Exact repair text: “Reduce to a principal ideal by iterating formal completion for the finitely many generators. For I=(f), put B=A/^L f; then Z×_(X^∧)Z=Spec(B⊕B[1]), whose projections are suave because B⊕B[1] is perfect over B.” RCSolid lines 4709–4715 explicitly make this reduction. For the two-variable origin the iteration gives the tensor product of two exterior factors, with ranks 1,2,1 as required.

7. **F07** (P1) Solid-spectrum invariance repeats the missing quotient hypothesis

   Location: `packages/AnalyticStacks/README.md:619`, “is insensitive to nilpotent kernels on π₀”.

   Claim: a map with nilpotent π₀-kernel induces a homeomorphism of solid spectra.

   Witness: ℤ_■ → ℚ_■ has zero kernel. Spec_■(ℚ_■) is a point, whereas Spec_■(ℤ_■) surjects onto Spec ℤ and is not a point (README625).

   Exact repair text: “For A→A′ with induced analytic structure and π₀A▷→π₀A′▷ surjective with nilpotent kernel, Spec_■(A′)→Spec_■(A) is a homeomorphism identifying rational opens.” Add the injective localization as a negative Check; ℤ[ε]/ε²→ℤ remains a positive test. RCSolid Lemma 7.2.10, lines 5034–5039, has the same omission and relies on the erroneous Proposition 4.4.5.

8. **F08** (P1) Connectivity estimates include the false zeroth-power case

   Location: `packages/AnalyticStacks/README.md:887`, “Sym^m_A M is (m + n − 1)-connective” and the exterior-power bound.

   Claim: the bounds hold with no restriction on m.

   Witness: A=ℤ^cond, M=A[2], m=0, n=2. Sym⁰M=∧⁰M=A has π₀=ℤ, but the first symmetric and exterior bounds require 1-connectivity.

   Exact repair text: “For m≥1 and n≥1 the symmetric-power bounds hold as stated; for m≥1 and n≥1, ∧^m_A M is (n+m−1)-connective. For m=0 both powers are A, hence only connective in general.” Add M=ℤ[2], m=0 as the boundary Check. RCSolid Lemma 7.4.5, lines 5315–5317, also omits m≥1. Its Corollary 7.4.6, lines 5324–5327, instead wrongly allows n=0: ∧²ℤ²=ℤ is not 1-connective. The package's standing n≥1 avoids that second source error.

9. **F09** (P1) Lci duality loses the virtual-dimension shift

   Location: `packages/AnalyticStacks/README.md:961`, “f^!1 ≅ det(L_(X/Y))”.

   Claim: the unshifted determinant is the dualizing object for lci maps.

   Witness: for ℤ_■→ℤ[T]_■, L=O in degree 0, so det(L)=O by README36. But 6.4 and 6.6 give f^!1=O[1], with π₁=O rather than π₀=O.

   Exact repair text: “For an lci map of virtual relative dimension d, f^!1≅det(L_(X/Y))[d], where det is the degree-zero determinant line of the perfect cotangent complex.” For a codimension-c regular immersion this is det(I/I²)^∨[−c], matching 6.3(1); for the affine line it is O[1]. SixFF Theorem 9.17, lines 3423–3426, uses determinant notation requiring this graded interpretation; the package explicitly chose the ungraded convention.

10. **F10** (P1) Contravariant Cartier duality does not preserve arbitrary fibre sequences

   Location: `packages/AnalyticStacks/README.md:1033`, “sends … fibre sequences of grouplike objects to fibre sequences.”

   Claim: the unrestricted fibre-sequence assertion follows from the right-adjoint property.

   Witness: the fibre of 0→ℤ^Betti is 0, so 0→0→ℤ^Betti is a fibre sequence of grouplike presheaves. Dualizing would give 𝔾_m→0→0, whose first object cannot be the fibre 0.

   Exact repair text: “D is contravariant and sends colimit diagrams of commutative monoids to limit diagrams. In particular it sends cofiber sequences to fibre sequences. No assertion is made for arbitrary fibre sequences without a cofiber/descent hypothesis.” The counterexample is not a cofiber sequence; the special delooping descent result of 7.3(3) retains its stated hypotheses.

11. **F11** (P2) Cartesian structure on the admissible subcategory needs a terminal object

   Location: `packages/AnalyticStacks/README.md:137`, “the second for the Cartesian structure on C_E”.

   Claim: C_E always has the asserted Cartesian symmetric monoidal structure.

   Witness: take C=finite sets and E=injections. This is a geometric setup, but C_E has no terminal object: neither ∅ nor a singleton receives injections from every finite set. HM lines 1320–1322 require ∗ terminal in C_E.

   Exact repair text: “If C has finite products and its final object is also final in C_E, the second functor is symmetric monoidal for the Cartesian structure on C_E.” The all-maps finite-set case satisfies this; injections fail exactly the added hypothesis.

12. **F12** (P1) The compactification proof omits its existing supplier

   Location: `packages/AnalyticStacks/README.md:704`, “Nagata compactification gives the decomposition (I, P)”; the Needs line at 706 has no compactification supplier.

   Claim: the construction principle can be applied using compactifications supplied by the listed inputs.

   Witness: `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:105` owns G.2, Nagata compactification over qcqs bases. `TauCetiRoadmap/SchemeAndStackFoundations/README.md:141` expressly assigns compactifications there; its §2.18 supplies complexes, not Nagata.

   Exact repair text: add “EtaleCohomologyFoundations §§G.1–G.3 (compactification objects, Nagata existence for separated finite-type maps over qcqs bases, and common refinements)” to the supplier contracts and 3.4 Needs, and cite G.2 in the route and 0.3's compactification Check. On 𝔸¹_ℤ→Spec ℤ this supplies 𝔸¹⊂ℙ¹→Spec ℤ with the required open/proper legs. The owner is earlier in the permitted order; no new ownership is needed.

13. **F13** (P2) The spectral Stone-duality headline is statable but missing

   Location: `packages/AnalyticStacks/README.md:619`, “Prove Stone duality for spectral spaces”; `packages/AnalyticStacks/Suggested.lean:14` begins the list of unstated headlines without it.

   Claim: the Lean file contains all headline theorems statable at the pins.

   Witness: pinned `Mathlib/Topology/Spectral/Basic.lean:38` has SpectralSpace, `Mathlib/Topology/Spectral/Hom.lean:69` has SpectralMap, and `Mathlib/Order/Category/BddDistLat.lean:28` has BddDistLat. SpectralMap supplies identity/composition; only ordinary bundling is needed.

   Exact repair: add real definitions bundling spectral spaces and spectral maps into a category, and state with sorry the category equivalence with BddDistLatᵒᵖ, identified with the compact-open functor. Add its name and locator to README 2.10 and the module docstring. A minimal theorem shape is `Nonempty (SpectralSpaceCat.{u} ≌ BddDistLat.{u}ᵒᵖ)`; specify the compact-open object map as well. The empty space corresponds to the one-element lattice, the point to the two-element lattice, and a two-point discrete space to the four-element Boolean lattice. This is a full deep theorem, not the existing opens/ideal order isomorphism.

14. **F14** (P3) Filtered-colimit compact descent cites the wrong supplier target

   Location: `packages/AnalyticStacks/README.md:828`, “E5:presentability.1 (compact objects in filtered colimits of compactly generated categories)”.

   Claim: the cited subsection provides the compact-object descent used for Fredholm filtered colimits.

   Witness: `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1597` starts compact objects/Ind; the filtered-colimit comparison is `dualizable_filteredColimit` at line 1758 in E5:presentability.4, requiring strongly continuous transitions.

   Exact repair text: “EnhancedDerivedSheaves E5:presentability.4, dualizable_filteredColimit; the scalar-extension transitions are strongly continuous because restriction of complete modules preserves colimits.” Retain .1 for Ind if used. For a constant ring diagram this gives the identity compact category; for filtered scalar extensions it supplies the actual compact-descent step in 4.4(7).

15. **F15** (P2) Setup morphisms need not induce strong monoidal functors

   Location: `packages/AnalyticStacks/README.md:139`, “A morphism of geometric setups induces a symmetric monoidal functor”.

   Claim: preservation of admissible pullbacks suffices for a strong symmetric monoidal correspondence functor.

   Witness: the functor from the terminal category to finite sets selecting two elements preserves pullbacks of identity maps. Its correspondence functor sends the tensor unit to a two-element object, not the singleton unit. HM lines 1303–1311 give only lax monoidality.

   Exact repair text: “A morphism of geometric setups induces a lax symmetric monoidal correspondence functor; it is symmetric monoidal when the underlying functor preserves finite products.” The singleton-valued functor satisfies the added condition; the two-element-valued functor fails it.

16. **F16** (P1) The coefficient comparison uses the wrong category of linear functors

   Location: `packages/AnalyticStacks/README.md:746`, “D_A = Fun_(D(ℤ))(D_!, D(A))”.

   Claim: the absolute ℤ-linear internal Hom computes the formalism over A▷(∗).

   Witness: take A=𝔽_p^cond and evaluate at Spec 𝔽_p. The required category is D(A); the displayed internal Hom is modules over 𝔽_p⊗ᴸ_ℤ𝔽_p inside condensed modules, with an extra π₁=𝔽_p. Relative tensoring over 𝔽_p has π₁=0.

   Exact repair text: “D_A = Fun_(D(A▷(∗)))(D_!, D(A)) = D* ⊗_(D(A▷(∗))) D(A), when D(A) is dualizable as a D(A▷(∗))-linear category.” Retain compact generation as the stated sufficient condition. At Spec 𝔽_p the corrected relative Hom is D(A), with no extra derived self-intersection. RCSolid line 4474 contains the same incorrect ℤ subscript.

17. **F17** (P2) Square-zero improvement drops the connectivity range

   Location: `packages/AnalyticStacks/README.md:887`, “for f with induced structure and k-connective fibre”.

   Claim: the universal square-zero construction improves arbitrary k-connective fibres by one degree.

   Witness: for 𝔽_p→𝔽_p[T], the fibre is (−1)-connective. The pullback along d and zero has π₀=ker(d/dT)=𝔽_p[Tᵖ]. Its map from 𝔽_p is not surjective, so its fibre is not 0-connective. RCSolid line 5348 requires k>0.

   Exact repair text: “For f with induced analytic structure and k-connective fibre, where k>0, the square-zero extension B̃ has A→B̃ with (k+1)-connective fibre.” Add the characteristic-p polynomial example as a negative Check outside this range; the identity map has zero fibre on both sides in every positive degree.

18. **F18** (P3) A trivial pairing can induce duality in a constant formalism

   Location: `packages/AnalyticStacks/README.md:1058`, “The trivial pairing … between nontrivial monoids never induces a duality”.

   Claim: nontriviality of the monoids alone rules out duality for every Künneth formalism.

   Witness: on finite sets with all maps admissible, use the constant formalism D(X)=D(k), every operation the identity. It is Künneth. For X=Y=C₂ and h=1, the kernel is 1 and FM_h=id, an equivalence.

   Exact repair text: “A trivial pairing need not induce duality: for X=Y=ℤ^Betti over ℤ^cond, the skyscrapers at 0 and 1 have the same image ℤ, so this transform is not faithful.” Retain that concrete negative Check; the constant formalism is a positive control against the discarded universal assertion.

19. **F19** (P2) Disc radii need to be positive

   Location: `packages/AnalyticStacks/README.md:1089`, “the Banach spaces ℓ^ℕ_R(r)” and “D^(<1/r)_R”; also 7.6(2).

   Claim: the disc constructions and reciprocal-radius dualities have no stated range for r.

   Witness: at r=0, the coefficient vector e₁ has weighted norm 0 despite e₁≠0, and 1/r is undefined. RC26a lines 1723, 1729 and 1751 require positive real radii.

   Exact repair text: “Throughout 7.5(3)–(4) and 7.6(2), r and r′ are positive real numbers; r→0 means the limit through positive radii. In the Poincaré sequence the second map is ∂_T(T^[n])=T^[n−1], with ∂_T(1)=0.” At r=1, e₁ has norm 1 and reciprocal radius 1; the forbidden zero radius no longer defines a Banach norm.

20. **F20** (P2) One point does not cover all ranks of Vect

   Location: `packages/AnalyticStacks/README.md:1105`, “Vect^R is covered by the point”.

   Claim: descent along a single point reduces the universal vector-bundle theorem to rank one.

   Witness: the rank-one point maps into BGL₁^R and has empty pullback to BGL₀^R and BGL₂^R. It cannot cover their disjoint union. The decomposition into all ranks is stated at README1103 and RC26a line 2028.

   Exact repair text: “Use the coproduct of the frame atlases S→BGL_n^R for every n≥0. Over each atlas, obtain rank-n duality as the n-fold product of the rank-one duality, using Künneth, and descend.” The n=0 component gives the unit duality; n=2 uses two factors and is now reached by the cover.

21. **F21** (P1) Shearing does not remove the square-zero relation

   Location: `packages/AnalyticStacks/README.md:454`, “modules over a polynomial algebra on a weight-one degree-zero class”.

   Claim: this polynomial-module description yields differentials satisfying d²=0 and the asserted heart of complexes.

   Witness: the polynomial module ℚ[t] has weight pieces ℚ and consecutive multiplication maps both equal to 1. Their composite is 1, whereas the corresponding consecutive differentials of a complex must compose to 0. Shearing changes degrees, not this relation.

   Exact repair text: “Dualize the finite exterior coalgebra; its generator acts square-zero. After shearing, its comodules are graded objects with a degree-zero differential raising weight by one, together with the square-zero relation and its coherences.” The two-term identity complex satisfies the relation because the next piece is zero; the three-term sequence with both arrows identity is excluded.

22. **F22** (P3) The free Huber-pair mapping spaces are reversed

   Location: `packages/AnalyticStacks/README.md:594`, “mapping spaces out of them are R and R ×_π₀R R⁺”.

   Claim: in the order just displayed, (ℤ[T],ℤ[T]) represents R and (ℤ[T],ℤ) represents the integral elements.

   Witness: take the discrete Huber pair (ℚ,ℤ). T↦1/2 is a map from (ℤ[T],ℤ), but not from (ℤ[T],ℤ[T]). RCSolid lines 3254–3256 give the opposite assignment.

   Exact repair text: “Maps from (ℤ[T],ℤ) form R; maps from (ℤ[T],ℤ[T]) form R×_π₀R R⁺.” The witness 1/2 belongs only to the first space; 0 belongs to both.

23. **F23** (P3) The negative dualizability Check fails for the zero ring

   Location: `packages/AnalyticStacks/README.md:260`, “⊕_ℕ Λ is neither”; also the last sentence of line 262.

   Claim: the countable free module is never suave or prim over Λ.

   Witness: for Λ=0, ⊕_ℕΛ=0=1 in D(Λ). Its dual is 0, and both triangle identities are the unique identity of 0. It is both suave and prim, as README261 itself asserts.

   Exact repair text: “For a nonzero coefficient ring Λ, ⊕_ℕΛ is neither suave nor prim for id; likewise (Λ^(⊕ℕ),0) is not suave in the finite-set example. For Λ=0 these objects are zero and have both properties.” This preserves the negative Check for ℤ and resolves the zero-ring instance.

24. **F24** (P2) Two internal proof dependencies point forward

   Location: `packages/AnalyticStacks/README.md:133`, “Needs: 0.1; 0.3”; and line 746, “prove that the realization of 3.8 is compatible with base change”.

   Claim: the numbered order is an executable build order.

   Witness: 0.2 constructs Corr using the restricted nerve theorem only constructed in 0.3. More seriously, 3.7 requires the realization of 3.8, whose Needs line 760 requires 3.7; this is an internal two-node cycle, absent from the cross-roadmap gate.

   Exact repair text: “Build restricted multisimplicial nerves before correspondences. Section 3.7 constructs the coefficient formalism only; section 3.8 constructs realization and proves its compatibility with coefficient base change using 3.7.” Reorder/renumber 0.2–0.3 and update their references. The resulting edges are nerves→Corr and coefficient formalism→realization, with no return edge.

25. **F25** (P2) A general locally profinite group need not have an open pro-p subgroup

   Location: `packages/AnalyticStacks/README.md:36`, “for an open pro-p subgroup K”.

   Claim: the displayed expression defines the modulus for every locally profinite group.

   Witness: G=∏_ℓ ℤ_ℓ is profinite. Every open subgroup contains full ℤ_ℓ factors for all but finitely many primes, so none is pro-p. Nevertheless its modulus exists and is identically 1.

   Exact repair text: “For a locally profinite group, δ(g)=[gKg⁻¹:K] for any compact open subgroup K, with generalized index. In the locally pro-p cases of 4.2, K may be chosen pro-p.” This gives δ=1 for the product group and retains δ(diag(p,1))=p⁻¹ for the Borel example.

26. **F26** (P3) The finite Cartier-duality Check needs a nonzero integer

   Location: `packages/AnalyticStacks/README.md:1039`, “A = ℤ[ℤ/n] (the group algebra, dualizable)”.

   Claim: this is an object of finite free ℤ-modules for the unstated range of n.

   Witness: n=0 gives ℤ/0=ℤ and ℤ[ℤ]=ℤ[T,T⁻¹], of infinite rank. It is not an object of the stated category and is not dualizable. For n=1 the rank is 1; for n=2 it is 2.

   Exact repair text: “For an integer n≥1, take A=ℤ[ℤ/n], finite free of rank n.” Retain n=1 and n=2, including characteristic 2 after base change, as positive instances and n=0 as the excluded infinite-rank control.

27. **F27** (P2) The interval poset lacks its order relation

   Location: `packages/AnalyticStacks/README.md:129`, “the poset Σ_n = {(i, j) : 0 ≤ i ≤ j ≤ n}”.

   Claim: this specifies the indexing poset for correspondence simplices.

   Witness: at n=1 the required order has (0,1)→(0,0) and (0,1)→(1,1), a span. The componentwise order instead gives the chain (0,0)→(0,1)→(1,1). HM line 990 explicitly reverses the second coordinate.

   Exact repair text: “Order Σ_n by (i,j)≤(k,l) iff i≤k and l≤j.” Add the n=1 span as a Check, distinguishing Σ_n from the componentwise order used for the Cpt_n vertices in 0.3. For n=0 both orders give one object; n=1 distinguishes them.

28. **F28** (P2) The formal-completion proof identifies the wrong essential image

   Location: `packages/AnalyticStacks/README.md:411`, “the image of j_! is computed by derived Nakayama”.

   Claim: the complete-module image in 1.4(3) is the image of extension by zero.

   Witness: for completion of Spec ℤ at (p), j_*ℤ_p=ℤ_p, whereas j_!ℤ_p=RΓ_(p)(ℤ_p)=(ℚ_p/ℤ_p)[−1]. The former is derived complete; the latter is derived torsion. They have different nonzero homotopy degrees.

   Exact repair text: “The essential image of j_* is computed by derived Nakayama and consists of derived I-complete objects; the essential image of j_! is the corresponding derived I-torsion subcategory.” This matches the right adjoint already correctly named in the target at line 409 and distinguishes the two embeddings on ℤ_p.

29. **F29** (P2) Nuclear closure is planned again under an existing owner

   Location: `packages/AnalyticStacks/README.md:812`, “Prove: (1) Nuc(A) is closed under colimits and tensor products”.

   Claim: the closure, basic-nuclear generation and scalar-extension assertions are new targets of this roadmap.

   Witness: `TauCetiRoadmap/RefinedTraceMethods/README.md:1595` and its “Closure and generation of nuclear objects” at line 1628 already state these results with compact generation and compact unit. AnalyticStacks 2.2 supplies exactly these hypotheses.

   Exact repair text: “Import (1) from RefinedTraceMethods §4.3, Closure and generation of nuclear objects, applied to D(A); the new targets here are (2)–(3) and their analytic comparisons.” Keep the declared Hom-criterion gap. For A=ℚ_p, scalar extension along the identity preserves every nuclear object; no extra specialized theorem is required to obtain this instance.

30. **F30** (P3) The solid dual of ℤ_p is missing a quotient by ℤ

   Location: `packages/AnalyticStacks/README.md:667`, “RHom_(ℤ_■)(ℤ_p, ℤ) = ℤ[1/p][−1]”.

   Claim: dualizing the displayed power-series resolution gives the localization itself in degree −1.

   Witness: on ⊕ₙℤeₙ the dual differential is e₀↦−pe₀ and eₙ↦eₙ₋₁−peₙ. Its cokernel has pe₀=0 and eₙ₋₁=peₙ, hence is ℤ[1/p]/ℤ, not the torsion-free ℤ[1/p].

   Exact repair text: “RHom_(ℤ_■)(ℤ_p,ℤ)=(ℤ[1/p]/ℤ)[−1]. In particular Hom_(ℤ_■)(ℤ_p,ℤ)=0, so ℤ_p is no retract of ℤ.” For p=2, e₀ maps to 1/2 modulo ℤ and has order 2; for p=3 it maps to 1/3 and has order 3. The original non-retract conclusion survives.

31. **F31** (P3) The diagonal Check merely repeats the definition

   Location: `packages/AnalyticStacks/README.md:341`, “A map … inducing an equivalence on D_! but not on its diagonal is not a !-equivalence”.

   Claim: this is a discriminating Check of the diagonal condition.

   Witness: line 331 defines !-equivalence by precisely this condition. Line 341 specifies no map, computes neither image, and simply negates one of the defining conjuncts; its source-history sentence supplies no test instance.

   Exact repair text: “In the finite-set formalism with coefficients 𝔽_p, extend D_! to presheaves. Let X be K(ℚ,2) tensored with the representable point. For f:X→∗, D_!(f) is an equivalence because C_*(K(ℚ,1);𝔽_p)≃𝔽_p. Pulling its diagonal back to the point gives K(ℚ,1)→∗, whose category is Mod_(𝔽_p[ℚ]); the regular ℚ-action is nontrivial, so this map is not an equivalence.” This computes both tests and detects omitting the diagonal requirement. Retain the ABLB erratum locator as background.

32. **F32** (P2) Discrete coefficient structures are rebuilt after their supplier comparison

   Location: `packages/AnalyticStacks/README.md:588`, 2.8(2), “(R, S)_■ = (R, R⁺[S])_■”; also the generator-test clause of 2.7(7).

   Claim: the discrete Huber coefficient construction and its integral-closure/generator independence are new results to prove here.

   Witness: `packages/SolidAnalyticRings/README.md:749` already constructs these coefficient structures, identifies their coefficient units, and proves generator/integral-closure independence. AnalyticStacks 2.6 explicitly transports those same structures to its Hℤ-linear setting.

   Exact repair text: “Import the discrete animated Huber-pair coefficient structures, coefficient-unit identification and generator/integral-closure independence from SolidAnalyticRings §7.3 through 2.6. The new targets here concern their geometric localizations, spectra and descent.” Retain the new general solid-Huber-ring construction of 2.9. For R=𝔽₂[ε]/ε² and f=εT, the supplied inverse 1+εTσ* gives the required identical completion before and after adding the integral element; no second construction is needed.

33. **F33** (P3) The new sequence-space definition has no discriminating Checks

   Location: `packages/AnalyticStacks/README.md:1089`, definition of ℓ^ℕ_R(r); Checks at lines 1097–1099.

   Claim: the new Banach sequence space and its overconvergent colimit have the required definition Checks.

   Witness: all three existing bullets test exponential coefficients, a p-adic radius conversion, or Amice normalization. None tests membership in ℓ^ℕ_R(r) over R=ℤ((π)) or distinguishes its single-radius space from the colimit over larger radii.

   Exact repair text: “For r>0, use norm sup_n |a_n|rⁿ. The vectors e₀ and e₁ have norms 1 and r. For a_n=πⁿ the weighted terms are (r/2)ⁿ, tending to zero exactly for r<2. For a_n=π^⌈√n⌉, the sequence belongs to ℓ(1), but belongs to no ℓ(r′) with r′>1, since r′ⁿ2^−⌈√n⌉ diverges; hence it is absent from the overconvergent colimit at radius 1.” Add these as three Checks. They separate the zero seminorm, a bounded-sequence replacement, and a single-radius replacement of the colimit.

## Verified sound

Read all 1173 lines of README.md and all 108 lines of Suggested.lean: 60 numbered target sections, all 189 Check bullets, and five Lean declarations (four definitions and one theorem). The counts refer to sections and bullets, not a claim that all the mathematics is correct. Findings above identify failed tests. All 460 distinct source-line addresses were resolved in the 27 cached, legally sourced works; semantic checks used the statements and proof passages identified below. This address count is not a claim to have independently reproved 460 cited results.

The supplied elaborated signatures were compared with the source and README for all five declarations. No section binder disappeared, no missing instance was found, and no Lean command or build was run. No declaration is padding: the four definitions make the restricted-diagonal headline statable, and the theorem is LZ12b Theorem 4.27, not a one-tactic library consequence. There is no sorry'd data, set_option, extra import, lemma declaration, or placeholder proposition. Every own Lean name in the README matches one of these five declarations.

The git comparison to origin/main is confined to the package: eight changed files, 1731 insertions and 11 deletions. The existing repair report marks its three findings applied; none is recorded as not actionable, so none of the findings here re-raises a settled disposition. No package source was changed in this pass.

### Lean declaration and context table

All names below have namespace TauCetiRoadmap.AnalyticStacks. There are no section variables. The universe is u; ULift enlarges the object values of the representables, as required. X has type Δᵒᵖ×Δᵒᵖ→Type u. All comparison counts include degenerate simplices.

| Declaration, location | Explicit context | Instances and computed values | Result/change |
|---|---|---|---|
| bisimplex, Suggested.lean:60 / 0.3 | u only; no instances | n=0: one pair in every bidegree. n=1: four vertices, six (1,0)-simplices. Identity postcomposition fixes all six; composing constant maps gives the same constant pair on both sides. | Body and representability agree. |
| compactificationBisimplex, :70 / 0.3 | u only; no instances | n=0: one element. n=1: vertices 00,01,11, cardinality 3; (1,0)-simplices 4 of 6. (id,id) fails because 1≤0 is false. n=2: six vertices, with 20 excluded. | Subobject and orientation agree. |
| restrictedDiagonal, :82 / 0.3 | X explicit; no instances | X=∅: both vertex and edge sets empty. X=∗: each has one element. X=Cpt₁: vertices 3, edges 6, including the new edge 00→11. | The Yoneda composition has the claimed direction. |
| restrictedDiagonalMap, :88 / 0.3 | X explicit; no instances | X=∗: identity 1→1. X=Cpt₁: vertices 3→3 bijective, edges 5→6 not onto. Two squares glued along their boundary: their distinct top cells have the same two-edge image. | Neither an isomorphism nor wrongly asserted to be one. |
| restrictedDiagonalMap_isEquivalence_hoFunctor, :102 / 0.3(1) | X,Q explicit, [Q.Quasicategory] explicit, same u | X=∅: both functor categories terminal. X=∗: both homotopy categories hQ. X=Cpt₁: the map is the two-edge spine into Δ²; composing the two arrows fills the missing long edge, yielding equivalent functor quasicategories. | LZ12b lines 1884–1899 agree; no dropped context. |

### Headline inventory

| README headline | Acceptance-test disposition |
|---|---|
| 0.3(1), restricted diagonal | Stated, on native simplicial sets. |
| 0.3(2), restricted-nerve gluing | Named in module docstring; coherent limits/marked nerves missing. |
| 0.5–0.6, construction and extension | Named; Cat∞, operads, Corr and sheaf ∞-topoi missing. |
| 0.12–0.13, Künneth descent and D-stacks | Named; presentable ∞-categories and their tensor/localization missing. |
| 2.10, spectral Stone duality | Statable with simple native bundling; absent: R13. |
| 3.3, analytic-stack formalism | Named; analytic rings and module ∞-categories missing. |
| 3.8, algebraic realization | Named; algebraic !-stacks and quasi-coherent ∞-categories missing. |
| 4.2, locally profinite classifying-stack duality | Named; enhanced coefficient formalism and representation category missing. |
| 6.6, solid Serre duality | Named; solid Huber cotangent complexes and exceptional inverse image missing. |
| 7.6, vector-bundle and gerbe Cartier duality | Named; ring stacks, kernel categories and transmutation missing. |

The summary's six explicitly designated end theorems are all in this inventory. Other deep intermediate results (analytic invariance, Fredholm descent, cotangent descent, and the individual Cartier dualities) use the same missing carriers; their precise formulations stay in the README, rather than being replaced by unrelated scalar equalities.

### Sampled adversarial computations

These samples cover every layer. Passing instances do not prove the general statements; failed samples refer to the numbered findings. The five-declaration table above records the Lean contexts and computations.

| Statement | Instances and computed values | Result/change |
|---|---|---|
| Higher-category convention | N(∗) has one filler; N([1]) has arrows 00,01,11 and no 10. A noninvertible map of spans remains noninvertible in SpanBicat but is excluded from the mapping anima of Corr. | The distinction from the pinned ordinary bicategory is retained. |
| Kernel orientation and unit | Rank matrices M=[[1,2],[0,1]], N=[[1,0],[3,1]] give MN=[[7,2],[3,1]], while NM=[[1,2],[3,7]]; MI=IM=M. | Order matters and matches X×Y convention. |
| Signs, Rees and determinant | A¹ dual O[1], zero-section dual ℤ[−1], composite ℤ[0]; t⁻¹ has weight +1; det(ℤ²)=ℤ in degree 0. | Agrees except R09's unshifted lci formula. |
| 0.1 setup, diagonal and right cancellation | Surjection 2→1 has diagonal 2→4 with image size 2, so fails. Open immersion has diagonal identity. A¹→Spec ℤ and its zero-section composite are smooth; zero-section Jacobian gives nonzero conormal. | Three discriminating controls pass. |
| 0.4 base change negative control | j:(0,1)→[0,1], pullback to 0: (j_*ℤ)₀=ℤ but empty-fibre pushforward 0. | Agrees. |
| 0.5 construction and mixed interchange | Two folds give ⊕_(i,j)M_ij on both sides. Infinite fold gives ⊕_m∏_nΛ versus ∏_n⊕_mΛ; identity matrix belongs only to the latter. | Retained projection hypothesis excludes failure. |
| 0.13 !-equivalence / images / topoi | Image of Spec(ℤ²)→Spec ℤ is the full representable because of a section. Its image inclusion is id; the cover map itself induces sum D(ℤ)²→D(ℤ), not an equivalence. | Read line 340's “map” as the image inclusion specified in (1). |
| 1.1 affine formalism and suave criterion | ℤ[T]/T² has rank 2 and dual free rank 1 over itself; ℤ[x,y]/(x²,xy,y²) has socle rank 2, dual not cyclic. ℤ[T] has infinite ℤ-rank. Zero ring has zero dual. | Agrees. |
| 1.2 descent and algebraic !-stacks | Finite extension k⊂l, including inseparable 𝔽_p(t)⊂𝔽_p(t^(1/p)), is a k-vector-space extension with k as summand, index 1. ℤ→ℚ kills 𝔽_p. | No separability restriction needed. |
| 1.4 cover and self-intersection | Principal regular quotient: Tor ranks (1,1). Two-generator origin: (1,2,1). | R06. |
| 1.6 supplier convention | t^k has degree k in DerivedDeRhamCohomology and weight −k here; t=1 gives R on both sides. | Explicit sign conversion works. |
| 2.1 Cond(C), modules, discrete adjunction | Empty value 0; two-point free module ℤ²; Z[N∪∞](∗)=⊕_(N∪∞)Z, whereas the solid free module is Z×∏_N Z. The all-one vector belongs only to the product. | Object and solid/discrete distinction pass. |
| 2.3(5) Tate localization and Frobenius | Free C_p-set C_p: Tate cohomology 0 and fixed set empty gives 0. Point with trivial action over F_p: both Tate objects have F_p in each Tate degree. Frobenius over F₂ sends 0↦0,1↦1. | Both free and fixed tests pass. |
| 2.4(3) nilpotent kernel | Z[ε]/ε²→Z: square of kernel 0. Z→Z[T]: kernel 0 but induced and T-solid structures differ. | R03. |
| 2.5 unions and intersections | Z[1/2]⊗Z[1/3]=Z[1/6]; difference map onto Z[1/6], kernel diagonal Z. Thus union is 1 and intersection is Z[1/6]. | Sign a−b is correct. |
| 2.10 Stone duality | ∅↔one-element lattice, point↔2 elements, discrete 2↔4; M₃ has a∧(b∨c)=a but (a∧b)∨(a∧c)=0. | Missing Lean headline R13. |
| 2.11 field structure and sums | (∏Z_p)[1/p] has one bound on all denominators; (p⁻ⁿ)_n lies in ∏Q_p but not that module. Completed sums on singleton×singleton give Q_p⊗Q_p=Q_p; empty index gives 0. | Agrees. |
| 3.1 intersection I∩P | Projection Z_■²→Z_■ splits and is open/closed. Z_■→Z_p is induced/idempotent, but Hom(Z_p,Z)=0, so is not a retract and not I; the shifted derived dual is (Z[1/p]/Z)[−1], not Z[1/p][−1] (R30). | Correct stronger intersection condition. |
| 3.3 full embedding / size | Hom between Z^m,Z^n corresponds to n→m; for m=1,n=2 there is one ring map, while reverse has two. All analytic rings have unbounded cardinalities and are not the fixed essentially small C₀. | Correct variance and size restriction. |
| 3.7 coefficient formalism | A=0 gives 0; A=Z_■,R=Z[T] gives induced (Z[T],Z)_■. A=F_p^cond adds π₁(F_p⊗ᴸ_Z F_p)=F_p under the erroneous absolute Hom. | R16 and internal dependency R24. |
| 4.2 smooth representations / finite groups | G=1: D(BG)=D(Λ). S₃ or C₂ over Q: averaging idempotent (1/6)Σg or (1/2)Σg, invariants exact. C₂ over F₂: Hⁿ(C₂,F₂)=F₂ for all n≥0, cd=∞. | Fine-map hypothesis rules out bad characteristic. |
| 4.2 modulus | Conjugating the Borel unipotent Z_p by diag(p,1) gives pZ_p: generalized index p⁻¹, for p=2 and p=3 alike. | Matches supplier's normalization. |
| 4.4(4)–(5) perfect descent / Nakayama | Identity cover preserves rank and amplitude. Nilpotent thickening k[ε]/ε²→k: a finite module with M/εM=0 has M=εM=ε²M=0. | Valid nonreduced test. |
| 5.1 derivations, square-zero extension, L | A[T]/A has Der into M equal to M (value of dT), L=A[T]dT. Identity and A→0 give L=0. F_p/Z has π₁=F_p,π₀=0. | Static-only cotangent would fail. |
| 5.2 symmetric / exterior estimates | m=0,n=2: power=A, π₀≠0, demanded lower bound 1 false. m=1: power=M, lower bound n exact. Over Q, M=Q[2],m=2: Sym²M=Q[4]. | R08. |
| 5.2 isomorphism criterion | Identity: π₀-iso,L=0. Induced Z→F_p: π₀ not iso,L≠0. Changing only Z^cond→Z_■ gives π₀-iso,L=0 but not an isomorphism. | Read the criterion under the preceding induced-structure hypothesis; without it it is false. |
| 6.2 standard rational localization | gT_i−f_i has derivative gδ_ij; unit ideal and relations give g invertible. For g=0,f₁=1, B=0. | Degenerate denominator produces empty localization, not 0/0. |
| 6.5 derived adic filtration | (x) regular: gr=Z[u]. (x²) in Z[x]: gr=B[u], u represents x². k[ε]/ε²→k: L=k[1]⊕k[2], derived gr has π₀=k[u],π₁=k[u]v; classical gr=k[u]/u². | Nonregular derived/classical distinction passes, including char 2. |
| 6.6 Serre duality | A¹: O[1]; A²: ∧²O²[2]=O[2], whereas L[2]=O²[2]. P¹: ω=O(−2)[1], H⁰(O)=H¹(O(−2))=Z, but H¹(O)=0. | Determinant, shift and proper comparison pass. |
| 7.1 definitions of D, bialgebra, Hopf, dual | Unit bialgebra dual=unit. For n=2, group basis e₀,e₁ dual to two function idempotents, ranks 2 and 2. The Hopf antipode sends index a to −a on both sides. | Works in characteristic 2 without etaleness. |
| 7.1 API fibre sequences | 0→0→Z is a fibre sequence, but D gives G_m→0→0 with nonzero first term. | R10. |
| 7.2 kernels and FM | Trivial monoids: FM=id. Constant Künneth formalism and C₂,C₂: FM=id even for trivial pairing. In the Betti Z example, δ₀ and δ₁ both map to constant Z. | R18; concrete negative example valid. |
| 7.5(3) radii and Poincaré sequence | r=0 gives norm(e₁)=0, invalid. r=1 gives norm(e₁)=1. ∂T^[n+1]=T^[n] is onto; kernel consists of constants R. | R19. |
| 7.5 p-adic radius Check | p=2: factor 2⁻¹; p=3: factor 3⁻¹ᐟ². v₂(2!)=1, v₃(3!)=1 agree with (n−s_p(n))/(p−1). | Exponential normalization passes both small primes. |
| 7.6 vector bundles / transmutation / descent | Rank 0 duality=id; rank 1 is 7.5; rank 2 pairing is sum of two evaluation pairings. One rank-one point has empty pullback to rank 2. | R20 fixes the cover. |
| 7.7 tempered sequence algebra | a_n=1: choose r=1/2, weighted norm→0. a_n=p^(−n²): p^(n²)r^abs(n)→∞ for every r>0. Product bounds multiply r and s; convolution of two constant sequences diverges. | Pointwise multiplication and growth condition discriminate. |

### Supplier, ownership and pin register

Eleven named supplier-roadmap contracts were resolved against main or their current open heads, plus the two downstream interface descriptions. Searches by object covered main, Completed, board packages and all 35 explicitly supplied sibling checkouts; the required roadmap grep/show tools were also used. No duplicate fully qualified name for any of the five Lean declarations was found. The generic kernel bicategory and analytic-stack constructions are owned here: VStackSheavesAndLisseCategories supplies specialized v-stack kernels, and the finite-group-scheme Cartier duality at the pin supplies a special comparison, not these general constructions. The actual duplication exceptions are R29 and R32.

| Supplier / boundary | Resolved location and result |
|---|---|
| EnhancedDerivedSheaves | E0.2–E0.8 at README191–413; E3.1–E3.4 at 1121–1259; E5:abstract at 1440–1590; E5:presentability at 1597–1780; descent 1791; animation 1900–2010; E2.6–E2.7 at 2293/2375; E4.1 at 2569; cotangent-export at 2869–2915. The filtered-colimit citation needs R14. |
| DerivedModuleAlgebra | README516 (Koszul), 815/973 (cotangent and universality), 1132/1151/1171 (smooth/regular/exterior), 2049 (perfect complexes). Regular quotient shift +1 agrees. |
| SchemeAndStackFoundations | README2502,2745–2989 for groupoid stacks and graded/comodule hearts; 3959 for quasi-coherent derived categories; 4094–4137 for Noetherian bounded-below duality; 4275–4310 for flat lfp relative dualizing complexes; 6768 for classical normal cones. Non-Noetherian extension is not attributed to §2.19. |
| DerivedDeRhamCohomology | Current-head README654–841, §§1.14–1.19. Rees degree is minus the weight here; coconnective graded testing is restricted to complete filtrations. |
| AdicSpaces / AdicSpacesPartII | Main README358,372,455 / 5987,8427: Huber pairs, rational localizations, smooth/étale maps and rigid affinoids. Discrete topology is stated for the discrete comparison. |
| SolidAnalyticRings | Current package README193–215,293–307,689–805: light-solid categories, HZ comparison, analytic structures and summability coefficients. Its §7.4 comparison retains common-presentation bounds. Coefficient construction duplication: R32. |
| RefinedTraceMethods | Supplied head README1507–1652, §§4.1–4.3. Nuclear closure already owned; R29. The Hom criterion is explicitly a gap, not asserted already supplied. |
| SmoothRepresentationsOfLocalGroups | Current-head README175–185,558–631,981,1593–1713: modulus, smooth representations and dg enhancement. The generic ∞-enhancement must pass through EnhancedDerivedSheaves, not a new theorem claimed in SR alone. |
| LocallyAnalyticDistributions | Current-head README63,768–783: unbounded Amice transform; δ_a maps to (1+T)^a. Mathlib's bounded integral transform is kept distinct. |
| VStackSheavesAndLisseCategories | Current-head README709–744, VS2.2: integer/solid coefficients and site comparisons; 273 and 987–1007 concern specialized kernels. Used only on common light presentations, as stated. |
| Missing compactification owner | EtaleCohomologyFoundations README105, G.2, supplies Nagata; SchemeAndStackFoundations README141 assigns it there. Add the missing contract, R12. |
| MotivesAndAlgebraicCyclesPartII | Design README2132–2144 contains AS.0/AS.1. Generic formalism and tensor descent are supplied here; the operator descriptions remain the consumer's work. |
| AutomorphicBundlesPartII | Design README1746–1748 and 1784 contain G-solid and identify generic solid operations as a separate direction. The package's consumer paragraph keeps filtered support applications there. |

The stated gap has the same slug nuclear-hom-criterion in design/plan.json and README88, names RefinedTraceMethods §4.3, and its detail specifies compact generation, stable presentable symmetric monoidal structure, compact unit, and every compact test P. It asks for one equivalence of definitions and not a second closure theorem. It is a declared contract and is not a finding. Acceptance remains conditional on that contract being supplied.

At the pins, the category-theoretic, light-condensed, spectral-space, scheme-morphism and Amice names in the supplier contracts exist. Their native definitions were read: LightCondensed is ordinary sheaves, not an enhanced derived category; SpanBicat retains noninvertible 2-morphisms; SpectralSpace includes T0, compactness, quasi-sobriety, quasi-separatedness and a compact-open basis; spa itself has no Huber hypothesis. No unproved enhancement was inferred from these carriers. The three Tau Ceti declarations are the finite Cartier anti-equivalence, Huber.Pair and ValuationSpectrum.spa. The missing general ∞-carriers listed in Suggested.lean were not found at the pins. Stone duality is the separate statable exception R13.

Dependency command output, obtained without changing the merge order:

```text
depcheck: 56 roadmaps, 647 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line and no moved line. R24 concerns internal target order, which this cross-roadmap check does not inspect.

## Not verifiable

- No fresh Lean elaboration was run, as required by the read-only brief. The five supplied elaborated signatures were inspected instead. No claim here certifies a new build or a repaired file.
- The projectivity of A▷[S] for every light profinite S in 2.1 was not independently established. The cached material explicitly treats the point and the convergent sequence, while SolidAnalyticRings §1.5 supplies projective solid generators. Finite S and the free-versus-solid examples pass; these do not certify the unrestricted projectivity assertion. No counterexample is asserted.
- The transfer of And21's complete-Huber Fredholm proof from extremally disconnected tests to all light profinite tests in 4.4(6) was not completely reconstructed. The printed theorem and the retained sheafy analytic Huber hypotheses were checked; its proof is not already a theorem about the light category. This depends in particular on the generator/resolution input above.
- The highest coherence and transfinite arguments of the construction/extension, cotopological localization and gerbe transmutation theorems were compared with their cited statements and the displayed elementary instances, not independently re-proved. The 460 count records resolved addresses; it does not certify every proof step behind each address. The report's counterexamples do not depend on accepting those unchecked proof steps.
- No legal source was missing from the 27-work manifest, and no new source was fetched or added. Gest is cited as scope/background rather than through a numbered target locator. No further open-head ownership beyond the supplied local checkouts and the roadmap-tool index is certified.

## Source issues

- **Error** in RCSolid at Proposition 4.4.5, printed page 41 (RCSolid line 1968): the source says nilpotent kernel suffices for invariance of analytic structures; it should be surjectivity on π₀ with nilpotent kernel; affects a stated result.
- **Misprint** in RCSolid at Remark 5.1.5, printed page 47 (RCSolid line 2275): the source says the open localization is the quotient by itself; it should be the quotient by the closed localization C(Z); affects a stated result.
- **Error** in RCSolid at Corollary 5.4.4, printed page 60 (RCSolid line 3024): the source says the reversed topology is spectral for every scheme; it should be formulated for qcqs schemes using quasi-compact opens, with a separate locale treatment otherwise; affects a stated result.
- **Error** in RCSolid at Proposition 5.4.11, printed page 62 (RCSolid line 3132): the source says solidification into all analytic rings preserves every colimit; it should be nonempty colimits, or all colimits relative to ℤ_■; affects a stated result.
- **Error** in RCSolid at Proposition 5.5.6, printed page 65 (RCSolid line 3284): the source says the discrete Huber-pair functor preserves all colimits into analytic rings; it should be nonempty colimits, or all colimits into analytic rings over ℤ_■; affects a stated result.
- **Misprint** in RCSolid at Proposition 5.6.4, printed page 67 (RCSolid line 3379): the source says numerator indices run up to the denominator g; it should be indices 1 through n; affects nothing.
- **Misprint** in RCSolid at Lemma 6.3.10, printed page 86 (RCSolid line 4246): the source says the finite subfamily index set J contains I; it should be J contained in I; affects a stated result.
- **Misprint** in RCSolid at Remark 6.4.1, printed page 91 (RCSolid line 4474): the source says the relative coefficient comparison uses ℤ-linear functors; it should be functors linear over D(A▷(∗)); affects a stated result.
- **Misprint** in RCSolid at Proposition 6.4.7, printed page 93 (RCSolid line 4569): the source says δ_f is the dualizing sheaf; it should be the codualizing sheaf; affects nothing.
- **Misprint** in RCSolid at the proof of Proposition 6.4.7, printed page 93 (RCSolid line 4571): the source says source locality makes the target X affine; it should be target locality in this first reduction; affects the proof.
- **Misprint** in RCSolid at Lemma 6.4.13, printed page 96 (RCSolid line 4687): the source says the defining kernel is from π₀A to π₀A; it should be from π₀A to π₀B; affects a stated result.
- **Misprint** in RCSolid at Lemma 6.4.15, printed page 96 (RCSolid line 4702): the source says the completion pushforward lands in D(Z); it should be D(X); affects a stated result.
- **Error** in RCSolid at Lemma 7.2.10, printed page 103 (RCSolid line 5034): the source says nilpotent π₀-kernel implies a homeomorphism of solid spectra; it should be a nilpotent surjection with the induced analytic structure; affects a stated result.
- **Misprint** in RCSolid at Lemma 7.4.5, printed page 109 (RCSolid line 5315): the source says the connectivity estimates without restricting the power m; it should be m≥1, treating the zeroth power separately; affects a stated result.
- **Error** in RCSolid at Corollary 7.4.6, printed page 109 (RCSolid line 5324): the source says the exterior-power bound holds for n≥0; it should be n≥1 for that bound, since ∧²ℤ² is not 1-connective; affects a stated result.
- **Misprint** in HM at Definition 4.5.1(b), printed page 70 (HM line 3515): the source says the prim dual is the associated right adjoint; it should be the associated left adjoint; affects a stated result.
- **Misprint** in HM at Lemma 4.5.8(ii), printed page 71 (HM line 3576): the source says the prim source-locality cover consists of suave maps; it should be prim maps, retaining the sieve-limit preservation hypothesis; affects a stated result.
- **Misprint** in ALRS at Remark 2.9.2, printed page 36 (ALRS line 1902): the source says the shifted differential lowers the weight while shearing uses M_n[n]; it should be a weight-raising differential for that shear and composition indexing; affects a stated result.
- **Error** in ALRS at Remark 6.5.6, printed page 163 (ALRS line 8825): the source says the smooth dualizing object is L_g[d]; it should be det(L_g)[d], already different for relative dimension zero or two; affects a stated result.
- **Misprint** in RC26a at Lemma 3.1.1, printed page 30 (RC26a line 1482): the source says the canonical direct sum for ℤ^Betti is indexed by ℕ; it should be indexed by ℤ, as its point decomposition and Laurent monomials require; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "14bd7f607df2a68387f5e8a54fada4484d4d2556", "job": "RT-AnalyticStacks~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
