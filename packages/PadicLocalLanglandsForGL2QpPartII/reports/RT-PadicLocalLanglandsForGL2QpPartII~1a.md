<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13092#issuecomment-6907780235 -->
Red team round 1 pass a (claude) of 82e78e7

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) gap:cuspidal-projectivity-coefficients asks for what an earlier roadmap already states, from a section that does not state it

   Location: `packages/PadicLocalLanglandsForGL2QpPartII/README.md:151` ("What SmoothRepresentationsOfLocalGroups must provide (gap:cuspidal-projectivity-coefficients): §SR.3.2, *cuspidal-splitting*, for a field L of characteristic zero rather than ℂ …"), used at lines 39, 553, 576, 584.

   Claim: the fixed-central-character projectivity of a supercuspidal representation is the `L`-coefficient form of §SR.3.2 *cuspidal-splitting*, and nothing earlier provides it.

   Witness: `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md` §R16.2.10 (*Supercuspidals in a fixed central-character category*, `supercuspidalProjective`) proves projectivity in the fixed-ω category for every ω over ℂ and names the L-descent as open. §SR.3.2 *cuspidal-splitting* (SmoothRepresentationsOfLocalGroups) is the Bernstein splitting of `SmoothRep ℂ G`, with no fixed-ω category.

   Why it is a defect: the gap is not minimal (the complex statement for general ω exists in a named supplier that is earlier in the merge order), the README never cites §R16.2.10, and as written two roadmaps would own fixed-character cuspidal projectivity. What is actually missing is only (i) descent from ℂ to a characteristic-zero field `L`, and (ii) injectivity.

   Repair (README line 151; the plan's `needs` for the same slug must carry the same sentence): replace the gap sentence by

   > What SmoothRepresentationsOfLocalGroups must provide (gap:cuspidal-projectivity-coefficients): the coefficient descent of GL2AutomorphicRepresentationsAndTransfer §R16.2.10, built on §SR.3.2 *cuspidal-splitting*. §R16.2.10 proves that a supercuspidal complex representation of GL₂(F) with central character ω is projective in the category of smooth complex representations with central character ω. Needed: for G = GL₂(ℚ_p), a field L of characteristic zero and a smooth character ζ: Z → L^×, a smooth absolutely irreducible supercuspidal L-representation with central character ζ is projective and injective in the category of smooth L-representations with central character ζ.

   and add to the list "From the global and smooth suppliers" the bullet

   > - GL2AutomorphicRepresentationsAndTransfer R16.2.10: over ℂ, a supercuspidal representation of GL₂(F) with central character ω is projective in the fixed-ω smooth category.

   and add `GL2AutomorphicRepresentationsAndTransfer R16.2.10` to the `*Needs:*` line of §3.3 and to the Dependencies of Layer 3. Tested on the witness: for ζ = ω at p = 7 (§3.3, Checks) the complex statement is §R16.2.10 with ω = ζ, and only the passage to `L` and the injective half remain in the gap.

2. **F02** (P2) §3.1(a) uses "Π^an/π has no nonzero smooth vector" with no owner

   Location: `README.md:508` ("its dual H¹_dR,c(Σ_r)^ρ → Π^an/π goes from a smooth representation (the smoothness above) to one without nonzero smooth vectors"); the same step is reused at line 562 ("As in the proof of (i) and §3.1(a)").

   Claim: the composite of the restricted map with Ω¹ → H¹_dR vanishes because Π^an/π has no nonzero smooth vector.

   Witness: DLB17 line 1207 leaves exactly this fact as an exercise. No target of this roadmap states it, the base roadmap §§4.11 and 6.9 do not state it (§6.9 has only the extension `0 → π → Π^an → Π(π,0) → 0`), and the `*Needs:*` line of §3.1 (line 526) lists only §§0.2 and 2.1 of this roadmap.

   Repair: state it once, where it is provable, and add the edge.

   1. Add to §2.3, after the statement, the sentence: "Consequently Π(π,0) ≅ Π(V)^an/π has no nonzero smooth vector, for every V in the family: the vectors killed by gl₂ form a closed G-stable subspace (LocallyAnalyticRepresentationsOfLocalGroups §0.3), which by irreducibility is 0 or everything, and it is not everything because u⁺ is nonzero on the dual E_π: after Res_ℤ_p it is multiplication by t (§1.5), which is injective on tN_rig(π), and Res_ℤ_p(E_π) contains tN_rig(π)^(ψ=1) ≠ 0 (§2.1)."
   2. Add to §2.3 the Check: "π itself is smooth and nonzero, so the statement fails for Π(V)^an before the quotient: the smooth vectors of Π(V)^an are π (the definition of V(π)), those of Π(V)^an/π are 0."
   3. Add `§1.5` and `LocallyAnalyticRepresentationsOfLocalGroups §0.3` to the `*Needs:*` of §2.3, and `§2.3` to the `*Needs:*` of §3.1 (line 526) and of §3.3 (line 576). No cycle arises: §2.3 then needs only §§1.5 and 2.1, the base roadmap and that supplier.
   4. In line 508 replace "to one without nonzero smooth vectors" by "to one without nonzero smooth vectors (§2.3)".

   Tested on the instance: with the trivial representation in place of Π^an/π the argument of line 508 would fail (every vector is smooth), which is the case the added sentence excludes by u⁺ ≠ 0.

3. **F03** (P3) §7.4: the integration domain 1+p^mℤ_p is not a subgroup of Γ at m = 0

   Location: `README.md:1181` ("∫_(1+p^mℤ_p)μ ∈ H¹_e(G_(ℚ_p(μ_(p^m))), V) for every m ≥ 0").

   Witness: at m = 0, 1+p⁰ℤ_p = ℤ_p contains 0 and is not contained in Γ = ℤ_p^×; this is the same slip the README's own Check at line 181 records for 1+O_D. The print (DLB17 lines 431–443) has the same range and is copied.

   Repair: replace the displayed set by "{μ ∈ H¹(G_ℚ_p, D(Γ)⊗_L V) : ∫_(Γ_m)μ ∈ H¹_e(G_(ℚ_p(μ_(p^m))), V) for every m ≥ 1}, where Γ_m = 1+p^mℤ_p ⊂ Γ (so Γ_1 = Γ at p = 2); the condition at Γ_0 = Γ and ℚ_p follows from m = 1 by corestriction, which carries H¹_e into H¹_e", and add the Check "At m = 0 the set 1+p⁰ℤ_p = ℤ_p is not a subset of Γ; the level-zero condition is on Γ itself." Record the slip under Source corrections (see Source issues below).

4. **F04** (P3) §1.7 pairs functionals on Π(V)^an with vectors not stated to be analytic, and uses an undefined m(V)

   Location: `README.md:370` ("For V in the family of π, n ≥ m(V), v ∈ Π(V)_c^P-fin and ℓ ∈ (Π(V)^an)′_b, prove {ℓ, v}_ℙ¹ = …").

   Witness: the pairing needs v ∈ Π(V)^an; the inclusion Π(V)_c^P-fin ⊂ Π(V)^an is the first assertion of DLB17 Théorème 7.8 (line 1581) and is stated nowhere in the README (§1.3 defines the space on the Banach representation). m(V) is defined in DLB17 lines 1572–1576 and nowhere in the README. The same inclusion is needed for "ker u⁺ ∩ ker a⁺ ∩ Π(V)_c^P-fin" at line 372.

   Repair: begin §1.7 with "Prove that Π(V)_c^P-fin ⊂ Π(V)^an (DLB17, Théorème 7.8, line 1581), so that u⁺ and a⁺ act on it. Let m(V) be an index such that (Π(V)^an)′_b ⊂ D_rig(V̌)⊠ℙ¹ has both chart restrictions Res_ℤ_p(z) and Res_ℤ_p(wz) in D^(]0,r_m(V)])(V̌) (base roadmap §3.11; DLB17 lines 1572–1576); for n ≥ m(V) the maps i_(j,n) take values in D⁺_dif,n(V̌)."

5. **F05** (P3) §4.6 uses X_st(M), which the README never defines

   Location: `README.md:691` ("Hom_(G_F)(V, X_st(M)) ≅ Hom_(WD_F)(M[−1]*, D_pst(V*))").

   Witness: only X⁺_st(M) = (B⁺_cris⊗M)^(φ=p) is defined (line 214). CDN20 line 860 defines the other space with B_st and N = 0.

   Repair: in §4.6, after "V a representation of G_F", insert "put X_st(M) = (B_st⊗_(ℚ_p^nr)M)^(N=0, φ=p), which contains X⁺_st(M) of §0.3", and add to the third bullet "(H_M(V) is the Hom into the subspace X⁺_st(M))".

6. **F06** (P3) §1.4 and §1.5 define D⁻_dif(V) by a limit and by a colimit

   Location: `README.md:311` ("D⁻_dif(V) = lim_n D⁺_dif,n[1/t]/D⁺_dif,n") against `README.md:331` ("D⁻_dif(V) = colim_n D⁺_dif,n(V)[1/t]/D⁺_dif,n(V)").

   Witness: the transition maps are the inclusions L_n((t)) ⊂ L_(n+1)((t)); the object is the union. A projective limit along inclusions is not defined, and the Check at line 325 (t⁻ʲe killed by tʲ, not by tʲ⁻¹) is computed in the union.

   Repair: in line 311 replace "lim_n" by "colim_n".

7. **F07** (P3) §7.2 says "This is COLMEZ19POIDS Conjecture 0.10" but states it in another normalisation, with no dictionary

   Location: `README.md:1148` ("This is COLMEZ19POIDS Conjecture 0.10 (lines 328–332) … identifies O(s)(Σ_r)^ρ with Π(M,s−1)′_b⊗det⁻¹").

   Witness: COLMEZ19POIDS lines 329–330 print the multiplicity of JL(M)* in O_n(k), with a right action, as Π(M,k−1)*⊗x⁻². The README takes Hom_Ǧ(JL(M), −) with left actions and twist det⁻¹. Central characters: the README's left side has x⁻ˢ·(xω)⁻¹ = x⁻ˢ⁻¹ω⁻¹ and its right side (xˢ⁻¹ω)⁻¹·x⁻² = x⁻ˢ⁻¹ω⁻¹, equal for every ω; with det⁻² the right side would be x⁻ˢ⁻³ω⁻¹.

   Repair: replace "This is COLMEZ19POIDS Conjecture 0.10 (lines 328–332)" by "This is COLMEZ19POIDS Conjecture 0.10 (lines 328–332) in the normalisation of Conventions: the source uses a right action on O_n(k) and the multiplicity of JL(M)*, and prints the twist as x⁻²; here the action is the left one of §3.1, the multiplicity is Hom_Ǧ(JL(M), −) and the twist is det⁻¹", and add the Check: "The centre fixes the twist. aI₂ acts on O(s)(Σ_r)[M] by a⁻ˢ times the inverse of the central character xω of LL(M) (§2.4(ii): x^kω = ω_(LL(M))·x^(k−1)), that is by a⁻ˢ⁻¹ω(a)⁻¹, and on Π(M,s−1)′_b⊗det⁻¹ by (a^(s−1)ω(a))⁻¹a⁻² = a⁻ˢ⁻¹ω(a)⁻¹. With det⁻² the scalar would be a⁻ˢ⁻³ω(a)⁻¹, off by a⁻² ≠ 1 at a = p."

8. **F08** (P3) §7.6: "coadmissible D(G)-modules in the fixed ρ-sector" is not a defined category

   Location: `README.md:1208` ("D^b(D(G)) is the bounded derived category of coadmissible D(G)-modules in the fixed ρ-sector … Construct here the bounded derived category of the fixed-sector coadmissible modules, as an exact subcategory of the coadmissible modules of the base roadmap §0.1").

   Witness: ρ is a representation of Ǧ; a D(G)-module carries no Ǧ-action, so "in the ρ-sector" selects no subcategory, and (Π(V)^an)′_b, the source of the Hom, lies in no sector. DLB17 line 2815 uses the abelian category of all coadmissible D(G)-modules.

   Repair: replace the two sentences by "Here D^b(D(G)) is the bounded derived category of the abelian category of coadmissible D(G,L)-modules of the base roadmap §0.1 (modules coadmissible over D(H,L) for one, equivalently every, compact open subgroup H). The complex RΓ_dR(Σ_r)^ρ = [O(Σ_r)^ρ → Ω¹(Σ_r)^ρ], in degrees 0 and 1, is an object of it: O(Σ_r)^ρ ≅ (Π^an/π)′_b and Ω¹(Σ_r)^ρ, an extension of M*_dR⊗π′_b by it, are coadmissible (base §6.9, §3.1). The unprojected complex of Σ_r is not asserted to be coadmissible (source correction E8)." Keep the remaining sentences.

9. **F09** (P3) The Summary names the third group of end theorems by a source's sections

   Location: `README.md:7` ("the weighted, Iwasawa, primitive and filtered derived consequences of Dospinescu–Le Bras §§11–12").

   Witness: the principle that results are named by their mathematics and cited by locator in the target, not by a source's chapters; §§7.2, 7.4, 7.5 and 7.6 already carry the locators.

   Repair: replace the bullet by "the weighted realisation with its BGG row (§7.2), the description of the diag(p,1)-invariant functions on a Drinfeld cover by Iwasawa classes with exponential specialisations (§7.4), the infinitely primitivable functions (§7.5) and the filtered derived realisation of D_dR(V) (§7.6)."

Two P2 findings (R01, R02) and seven P3 findings (R03–R09). No P1 finding: no statement was found
false, and every cross-roadmap citation resolves at the cited head. `Suggested.lean` states no
declaration, so there is no elaborated signature to compare; the `#check` comparison was not run for
that reason, and nothing changed.

Dependency check (`gate --depcheck … --name PadicLocalLanglandsForGL2QpPartII --movable --pr 13092`):

    depcheck: 248 roadmaps, 2341 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The roadmap is line 383 of `merge-order/ORDER.txt`; every named
supplier is earlier (the base roadmap is line 33, SmoothRepresentationsOfLocalGroups 26,
GL2AutomorphicRepresentationsAndTransfer 101).

## The pass (values computed)

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| Conventions, Lie action on O(Ω) | u(b), diag(a,1), diag(1,d), lower unipotent c | −f′; −zf′; zf′; z²f′ from d/dc f(z/(1−cz)) | agrees |
| §0.1 levels | n = 0, 1; p = 2, 3 | K_D(0)/K_D(1) order p²−1 = 3, 8; Nrd(p) = p² so δ(p)² | agrees |
| §0.1 Check, χ(p) = 1+p | p on JL(M) | χ(Nrd p) = (1+p)² ≠ 1 | agrees |
| §0.2 H¹(p^ℤ, H⁰) | a_h = 1, f₀ = f₁ = 0 | f_h ∈ ℤ, \|f_h\| ≤ 1; coker(T−1) = 0 | agrees |
| §0.3 shift | ℚ_p(1) | φ = p⁻¹ on D_cris, [1] gives φ = 1; slope of M[−1] = −1/2, weights {0,1} sum −1 | agrees |
| §0.4(c) | ℒ = Le₁ | e₁ ↦ (e₁ ↦ 0, e₂ ↦ e₁∧e₂), image Le₂*⊗∧² = ℒ^⊥⊗∧² | agrees |
| Example p = 7 | θ = θ₀³ on 𝔽₄₉^× | θ(g⁸) = ζ₆³ = −1 (order 2), θ⁶ ≠ 1; squares on μ₆ have order \| 3 | agrees; such π exists |
| §1.1 sandwich | jumps (−1,0); (0,1); (−k,0) | tN⁺+ℒ[[t]]; N⁺+t⁻¹ℒ; t^kN⁺+ℒ[[t]] | agrees |
| §1.2 Check | h = 1 | ∇(tx)−tx = t∇x = t²∂x | agrees |
| §1.3 third API bullet | c = p^m b = c₀+p^N c₁ | T(1−u(c₀)) = (1−u(p^N))·Σ_(i<c₀)u(i); 1−u(p^N c₁) divisible by u(p^N)−1; k-th power zero | agrees |
| §1.3 Check, b = p⁻¹ | x = 1; shell p⁻¹ℤ_p^× | 1−ζ_p ≠ 0; Σ_(i<p²) ζ_p^(iu) = 0 | agrees |
| §1.4 action | g₁g₂ = (a₁a₂, a₁b₂+b₁) | ε(b₁x)e^(tb₁x)ε(b₂a₁x)e^(tb₂a₁x)φ(a₁a₂x) on both sides | left action |
| §1.5 Lie relations | general (a,b) | [u⁺,u⁻] = 2∇+1−k = a⁺−a⁻; Casimir = (k²−4ab−1)/2 | agrees |
| §1.5 Checks | (0,1); (1,2); X²−c | 0; 0, a⁻ = 2−∇; (4c−1)/2 | agrees |
| §1.6 | V = L; weights {0,2} | orthogonal tL_∞[[t]]; te pairs to 0, te ∉ t²N⁺ | agrees (E4) |
| §1.7 unipotent-fixed vectors | bx ∈ ℤ_p; bx = p⁻¹ | tφ(x) = 0; (ζ_p−1)φ(x) = 0 | agrees |
| §2.2 | w; u(b); aI₂; general g via Ad | ∂⁻¹ and −∂²u⁺ = u⁻; ∂−b; 1; (a²u⁺−c²u⁻−ac·2∂u⁺)/det = (a−c∂)²u⁺/det | agrees |
| §2.2 on tN_rig | ∂ = ∇t⁻¹ | a⁺ = ∂u⁺ = ∇; ∂²u⁺ = t⁻¹(∇−1)∇ | agrees with §1.5 |
| §2.4 central characters | k; trivial ζ | Π(M,k): x^kω; dual twisted: x^kω; Π(M,−k)⊗x^k: x^kω; ω = x⁻¹, det Δ = \|x\| | agrees |
| §2.4 étaleness | k = 1, 2 | det(p) = 1; p, twist δ₂(p)² = p⁻¹ gives 1 | agrees |
| §3.1 O(k) | cocycle with adjugates; Lie derivatives | a⁺ = u⁺∂+1−k; u⁻ = −∂²u⁺+k∂; Ω¹ = O(2)⊗det from d(g⁻¹z) = det g·(a−cz)⁻²dz | agrees |
| §3.1 duals | Ω¹′; O′ | a⁺ = ∂u⁺, a⁻ = −∂u⁺, u⁻ = −u⁺∂²−2∂ = −∂²u⁺; a⁺ = ∂u⁺−1 | agrees (DLB17 Lemme 3.5) |
| §3.1 Check, u(p⁻¹) | lattice ℤ_p² | elementary divisors of (p 1; 0 p): (1, p²), distance 2 | agrees |
| §3.3 uniqueness | A = diag(1,2); three lines | fixes Le₁, Le₂, moves L(e₁+e₂); α = β forced | agrees |
| §4.2 twists | sector δ∘Nrd, supplier's arithmetic rec | G by δ⁻¹∘det, W by δ⁻¹∘rec_arith = δ∘rec_geom; (a,a) acts by δ(a²)⁻¹δ(a²) = 1 | agrees with Conventions |
| §4.2 Check, δ_(pⁿ)−δ₀ | indicator of pⁿℤ_p^× | pairs to 1, norm 1; pointwise → 0 | agrees |
| §4.3 | d = 2 companion; S = 0; S = E; two chains in d = 4 | X²−(λ₁+λ₂)X+λ₁λ₂; diagonal; excluded; block companions | agrees; true by the Kronecker form of the pencil (inclusion, A) |
| §4.8 | trivial action; ℤ on ℚ_p; rescaled seminorms | bounded; \|pⁿx\| unbounded as n → −∞; ∀i∃C_i | agrees |
| §4.10 Check, ℓ = ⟨δ_∞−δ₀, u⁺·⟩ | g = diag(pᵐ,1); F_m | gℓ = pᵐℓ; ‖F_m‖ ≤ p⁻ᵐ, \|ℓ(F_m)\| = pᵐ | agrees |
| §4.12–4.14 | χ(p) = 1+p twist; V = δ; dim 3 | 0; Steinberg branch; 0 | agrees with CDN23 lines 2357–2473 and E15 |
| §5.1 Check | μ_j = δ_(5^j)−δ₀ | indicator of 5^jℤ₅^× separates the reductions; u(5^j)(δ₀−δ_∞)−(δ₀−δ_∞) = μ_j | agrees |
| §5.2 Check | ϖ² = p | O_L/p = O_L/ϖ², two k_L factors | agrees |
| §5.6 | special M | δ_M = δ⁻² | agrees with §4.2 |
| §6.1 Check | ρ_x(ε) | central characters det·ε against det·ε⁻¹, ratio ε² | agrees |
| §6.3 | rank 1; A a DVR; char p traces | χ−χ′ in every maximal ideal; fails with one closed point; idempotent of trace 1 against 0 | agrees |
| §6.6 Check, A = L⟨T⟩ | Ǎ = bounded sequences | T = left shift, onto, kernel L·ev₀; Ǎ/T = 0, Ǎ[T] = L | agrees |
| §7.1 cocycle | g, g′ | (a−c∂)a′−c′(d∂−b) = (aa′+bc′)−(ca′+dc′)∂ | agrees |
| §7.2 row | k = 0, 1, general | scalars a^k on all three terms; preimage a⁻ᵏa²ᵏ | agrees |
| §7.2 identification | s ∈ ℤ, general ω | x⁻ˢ⁻¹ω⁻¹ on both sides | agrees (R07 asks for the dictionary) |
| §7.3 Check | y = ϖ_K y′ | y′^(p²−1)+(z−z^p)^(p−1) = ∏_(ζ^(p−1)=−1)(y′^(p+1)−ζ(z−z^p)), ζ ∈ ℚ_p² | agrees |
| §7.4 | m = 0 | 1+p⁰ℤ_p = ℤ_p ⊄ Γ | R03 |
| §7.5 | f = (1,−1) over ℚ_p²; type χ∘Nrd | primitives (z^j/j!, −z^j/j!); sector = π₀-functions·O(Ω) since O_D^×/(ker Nrd·K_D(n)) is π₀ | agrees |
| §7.6 | filtration | Hom into F⁰ is a line, total Hom 2-dimensional | agrees |

## Verified sound

- Declarations read: 0 (the Lean file states none; its module docstring was read in full, 74 lines, and each of its ten bullets was matched to its README section: §§4.14, 4.12–4.13, 6.6, 3.3, 3.1, 2.3–2.4, 7.2–7.3, 7.4, 7.5, 7.6).
- Targets read: all 51 numbered sections of Layers 0–7, the Conventions, the supplier contracts and the 25 source corrections; every line of the README (1285 lines).
- Headline theorems: none is statable at the pins. Checked by grep of the pinned Mathlib and Tau Ceti: no Robba ring, no locally analytic or Banach representation carrier, no Drinfeld half-plane or tower, no (φ,Γ)-module carrier; Mathlib has `Mathlib/RingTheory/Perfectoid/BDeRham.lean`, as the docstring says. No padding: the file has no declaration.
- Pinned declarations checked (7): `Bornology.IsVonNBounded` (Bounded.lean:61; quoted definition: every neighbourhood of 0 absorbs the set; no Hausdorff or convexity hypothesis), `NormedSpace.image_isVonNBounded_iff` (Bounded.lean:495), `WithSeminorms.isVonNBounded_iff_seminorm_bounded` (WithSeminorms.lean:659), `WithSeminorms.image_isVonNBounded_iff_seminorm_bounded` (WithSeminorms.lean:679), `WithSeminorms.banach_steinhaus` (Barrelled.lean:164), `Module.Basis` (Basis/Defs.lean:89), `Mathlib/RingTheory/Perfectoid/BDeRham.lean`.
- Locators verified against the cached texts (41): DLB17 lines 104–106, 114–116, 152–158, 159, 189, 232–236, 410, 431–447, 643–651, 652–664, 759–771, 783–787, 804–807, 1184–1209, 1250–1262, 1460–1465, 1473–1499, 1550–1569, 1572–1586, 1593–1597, 1946–1981, 2718–2725, 2785–2804, 2810–2822; CDN20 lines 130–134, 240–252, 809–821, 857–858, 859–877, 905–916, 1090–1095, 1171–1194; CDN23 lines 93, 178–184, 2339–2349, 2357–2377, 2378–2386, 2420–2437, 2465–2476, 2541–2557, 2620–2626; COLMEZ19POIDS lines 146–166, 177–180, 203–211, 215–236, 237–251, 256–271, 310–340; TEI90 lines 177, 232–236, 251–259, 298–302.
- Checks tested by computation: 63 (the table above lists them by section).
- Sibling citations checked at the cited heads (heading exists and the cited content is there): base roadmap §§0.1–0.2, 1.7, 2.5, 3.8, 3.11, 4.1k, 4.2a, 4.9, 4.11, 5.12, 6.7, 6.9 (read in full); CompletedCohomologyAndLocalGlobalCompatibility §§2.7, 4.9, 6.3, 6.4; ProetaleCohomologyOfPAdicCurvesAndTowers §§0.3, 0.4, 6.2, 6.5, 6.9, 7.1–7.5 (7.1–7.5 read in full); ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4; LocallyAnalyticRepresentationsOfLocalGroups §§0.3, 0.5; LocallyAnalyticDistributions §§0.0, 0.2, 0.3; LocallyAnalyticDistributionsPartII §§1.5, 2.2, 2.3; PhiGammaModulesAndIwasawaCohomology §§2.4, 5.4, 5.6a, 5.7; PadicHodgeTheory §§3.3, 4.4, 5.1–5.4, 8.1; PadicDifferentialEquationsAndRigidCohomology §§RD.1.73, RD.2.43; GL2AutomorphicRepresentationsAndTransfer R16.1.8, R16.3, R17.3; LocalGaloisDeformationRings §3.8; EndoscopicTransferAndUnitaryTraceComparison §§12.4, 12.5, 12.7, 12.14, 12.19; HilbertModularVarietiesAndShimuraCurves §§R18.3.29, R18.4.24a, R18.4.25, R18.5.3, R18.5.16, R18.5.21; SmoothRepresentationsOfLocalGroups SR.0, SR.2, SR.3.2 (59 sections).
- Conventions across roadmaps: the supplier ProetaleCohomologyOfPAdicCurvesAndTowers §7.1 uses the arithmetic reciprocity map and the translation character Nrd⁻¹; recomputed in the sector δ∘Nrd this gives the README's (St^cont⊗δ_G)*⊗δ with δ read through geometric reciprocity. PhiGammaModulesAndIwasawaCohomology §5.7 uses the opposite Hodge–Tate sign and says so; the README states its own.
- Declared gaps: the four slugs agree between `design/plan.json` and the README, each with a named supplier and section. Three were not raised. The fourth is R01.
- Ownership: searched the open heads and main by object (weight change and Π(M,k), Teitelbaum's model, G-bounded vectors, infinitely primitivable functions, the analytic Steinberg representation, P-finite vectors, the factorisation of CDN23). No second owner except the one of R01. No declaration name can clash: the Lean file declares none.
- Policy: the pull request changes only the package folder (`git diff --stat origin/main...HEAD`: README.md, Suggested.lean, design/plan.json, reports, sources.toml). No `lemma`, `set_option`, pull-request number or process narrative in the README or the docstring. Single `import Mathlib`.
- Overlaps: none listed; the closest roadmap is the base roadmap, whose §6.9 was compared with the Scope section: no object is owned twice.

## Not verifiable

- The remaining locators (about 190 line references, mostly inside proofs of DLB17 §§8–11 and CDN23 §5.3–5.4): not opened in this pass; the 41 opened all matched.
- Source corrections E5, E6, E9, E13 (second half), E17, E21, E23: each concerns a proof step whose repair is a target or a declared gap here; the pass checked that the README's replacement is consistent, not that the source's step fails.
- R07: whether the printed twist x⁻² of COLMEZ19POIDS Conjecture 0.10(i) is a misprint or an effect of its right-action convention could not be settled from the introduction alone; it is therefore not listed under Source issues.
- §7.3, "It is the minimal semistable model, so the actions … extend": TEI90 lines 256–259 speak of the minimal regular model over the unramified base; the claim over O_K is the README's own and was not checked.
- The existence statement behind gap:three-period-line-globalisation, and the strict cohomology model of gap:continuous-galois-tensor-comparison: declared gaps, not examined for truth beyond the README's Checks.
- TEI90 equation (3) (the curve y^(p+1) = z − z^p): the scan's text at that display is not legible.

## Source issues

- **Misprint** in DLB17 at Théorème 1.9, arXiv v2 p. 11: the source says the integration domains are 1+pⁿℤ_p for all n ≥ 0, with fields ℚ_p(μ_(pⁿ)); it should be Γ itself at n = 0, since 1+p⁰ℤ_p = ℤ_p is not contained in Γ; affects nothing.
- **Gap** in DLB17 at the proof of Théorème 5.1, §5.3, arXiv v2 p. 30: the source says the analytic quotient has no nonzero smooth vector and leaves it as an exercise; it should be derived, for instance from the irreducibility of the quotient and the nonvanishing of u⁺; affects the proof.
- **Misprint** in DLB17 at Proposition 7.7(b), arXiv v2 p. 38: the source says the orthogonal of the dual de Rham lattice is t^k times the lattice for weights 0 and k; it should be t times it for every k ≥ 1; affects a stated result. (Confirms the README's E4 on V = L and on weights {0,2}.)
- **Error** in DLB17 at Théorème 1.10, arXiv v2 p. 11: the source says an infinitely primitivable function on a cover is a function on the half-plane; it should allow locally constant coefficients on the components, already ℚ_p² ⊂ O(Σ₀); affects a stated result. (Confirms the README's E2.)
- **Error** in CDN23 at Proposition 5.7 and Théorème 5.8, HAL copy pp. 63–64: the source says the nonzero cases on the p-central quotient are those of level at most n; it should also require p to act trivially on the Jacquet–Langlands factor; affects a stated result. (Confirms the README's E15 on the twist χ(p) = 1+p.)
- **Misprint** in CDN23 at Théorème 5.15, HAL copy p. 68: the source says the dual coefficient module is the dual of itself; it should be the continuous dual of the type ring; affects nothing. (Confirms the README's E11.)
- **Misprint** in CDN20 at the proof of Lemme 2.18, authors' copy p. 30: the source says the completing column has the elementary symmetric functions as coefficients; it should carry alternating signs, as d = 2 shows (determinant −λ₁λ₂ otherwise); affects the proof. (Confirms the README's E13.)
- **Misprint** in COLMEZ19POIDS at Remarque 0.2(ii), author's copy p. 4: the source says Π(Δ) is an extension of Π(M,−k) by the locally algebraic part; it should be Π(M,−k)⊗x^k, as its Théorème 0.6(iii) states; affects nothing. (Confirms the README's E25 by central characters.)

Source independence: 16 passages compared with 5 sources (DLB17 Définition 7.4, Lemme 3.5, §5.3, Théorèmes 1.9, 1.10 and 7.8, Remarque 11.12, §12.1–12.2; CDN20 §2.1.2, Proposition 2.5, Lemme 2.18; CDN23 Théorèmes 5.1, 5.8, 5.10; COLMEZ19POIDS Théorèmes 0.6 and 0.8; TEI90 lines 251–259), none shared beyond formulas and case lists that the mathematics forces (the longest run of shared words is under a dozen, in translated theorem statements); largest share DLB17, 109 of 235 locators; contents compared with DLB17 (chapters 3–12): independent. Layer 1 covers its chapters 6–7, Layer 2 its chapters 8–9 together with COLMEZ19POIDS, Layer 3 its chapters 3, 4, 5 and 11 after them, Layer 7 its Remarque 11.12 and chapter 12 with TEI90; Layers 4–6 draw on CDN20 §2 and CDN23 §5 in the order 5.1, 5.3, 5.2 with 5.4. No run of layers maps one to one, in order and scope, onto a run of chapters; the order of §§1.3–1.7 and 2.1–2.2 is forced by the `*Needs:*` lines of §§1.5, 1.7, 2.1 and 2.2.

## For the human reviewers

- **Licence.** CDN20, COLMEZ19POIDS: `sources.toml` records them as `author-page` copies (the authors' institutional pages), not as the published versions; the README cites line numbers of those copies.
- **Not tested.** TEI90 is an OCR of a Numdam scan; its displays (equations (3) and the one at line 255) are partly illegible, so the wording comparison with it covered prose only.
- **Scope.** The roadmap's main sources are four refereed articles (Ann. of Math. 2017, J. Amer. Math. Soc. 2020, Forum Math. Pi 2023, J. Eur. Math. Soc. 2019); it records 25 corrections to them, of which E2, E10, E15 and E21 change a stated result or need a new global input (a declared gap).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "82e78e7b6291db4746d1e7343abd28eb51926753", "job": "RT-PadicLocalLanglandsForGL2QpPartII~1a", "model": "fable", "worker": "chris-x52"} -->
