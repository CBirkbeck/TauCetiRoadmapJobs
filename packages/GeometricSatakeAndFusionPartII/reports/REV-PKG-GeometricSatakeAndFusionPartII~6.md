<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1177#issuecomment-6405519945 -->
Review (claude) of d2fa63d

Verdict: needs changes

1. **F01** (P2) §7.3 claims S₂ at every parahoric level; route, gap and source prove Iwahori level only

   **Location:** packages/GeometricSatakeAndFusionPartII/README.md:1040 (“The perfected μ-admissible locus has a finite-type deperfection satisfying Serre S₂; its codimension ≤1 Bruhat open remains connected …”), and the route at line 1042.

   **Claim:** Under the Conventions (line 19) the standing level is any smooth affine 𝒢 with 𝒢° parahoric, and §§7.2 and 7.4 (lines 1030, 1050) say “Iwahori” explicitly where they mean it, so line 1040 reads as a statement for every parahoric level. Its only inputs for the S₂ conclusion are gap:s2ification-connectedness (level-free commutative algebra) and input (ii) of gap:algebraic-coherence, which the repaired contract (line 113) requests at “Iwahori level” only; the route (line 1042) transfers the codimension-1 graph criterion to a split G′ “with the same admissible set”, which realizes Adm(μ) inside the Iwahori–Weyl group. The sources are Iwahori statements: GL §3 fixes an Iwahori model (GL line 220), Proposition 3.4 and Corollary 3.5 concern A_(I,μ) (GL line 267–268, 288), and the proof of GL Theorem 1.3 uses Corollary 3.5 only on the codimension ≤1 orbits of A_(I,μ) (GL line 474–476). The parahoric statement is neither proved by the route nor requested from the supplier.

   **Witness:** GL line 220, 288, 474–476 (Iwahori throughout); README line 113 “(ii) … Iwahori level”; computed instance below shows the Iwahori result does not transfer to a parahoric level by smooth descent.

   Computed: GL₂, μ=(1,0), K hyperspecial, I ⊂ K Iwahori, π: Fl_I→Fl_K the P¹-bundle. A_(I,μ) is two P¹ meeting in a point (dimension 1), whereas π⁻¹(A_(K,μ)) = π⁻¹(P¹) is a P¹-bundle over P¹ (dimension 2) ≠ A_(I,μ). So S₂ of A_(K,μ) is equivalent (smooth descent) to S₂ of a strictly larger Bruhat union than the one GL Corollary 3.5 and gap (ii) treat; in this instance both happen to be S₂, but the roadmap's route proves nothing about the larger union. The consumer §7.5 (line 1064) reduces to Iwahori level before it uses §7.3, so the parahoric form is not needed anywhere.

   **Exact repair:** State §7.3 at Iwahori level, as GL does: begin line 1040 with “At Iwahori level 𝒢=I, the perfected μ-admissible locus A_(I,μ) has a finite-type deperfection satisfying Serre S₂; its codimension ≤1 Bruhat open …”, and in the §7.5 route (line 1064) write “Its codimension ≤1 open W is connected by the Iwahori S₂ theorem of §7.3”. Nothing else changes: §7.5 already performs the Iwahori reduction first; gap (ii) stays as written.

   **Test of repair:** With the clause, the statement, the route (Adm(μ) ⊂ W̃ realized by Adm(μ′) of the split G′, input (ii) at Iwahori level, transfer back) and the sources agree on the same object A_(I,μ); the GL₂ hyperspecial instance above is no longer claimed and is not consumed. For GL₂ Iwahori and μ=(1,0) the repaired statement is checked directly: two P¹ meeting in one point have (dim, depth)=(1,1), hence S₂, and the codimension-1 graph is a single edge.

2. **F02** (P3) §7.3's new transfer route uses admissible-set combinatorics not on its Needs line

   **Location:** packages/GeometricSatakeAndFusionPartII/README.md:1042 (“Transfer the codimension 1 criterion to the split group G′ with the same admissible set …”) and the Needs line at line 1046; Layer 7 Dependencies at line 1106.

   **Claim:** The transfer uses the échelonnage root system, the embedding of the Iwahori–Weyl group into affine transformations, the fact that the maximal elements of Adm(μ) form one W₀-orbit of translations, and the realization of Adm(μ) by a split group with the same affine Weyl group (GL line 289–294). The README assigns these to ReductiveGroupsPartII: RG2.1.2–RG2.1.5 valued roots and π₁ (line 65) and RG2.4.1–RG2.4.3 “affine Weyl groups, Bruhat order, lengths and admissible sets” (line 65; Scope, line 11). Line 1046 lists neither RG2.1 nor RG2.4, and line 1106 lists RG2.1 (from §7.2) but not RG2.4.

   **Witness:** RG2.4.3 “cocharacters, lengths and admissible sets” exists at ReductiveGroupsPartII's head (its README line 5993); README line 1046 has no ReductiveGroupsPartII item.

   **Exact repair:** Append “ReductiveGroupsPartII RG2.1; ReductiveGroupsPartII RG2.4” to the §7.3 Needs line and “ReductiveGroupsPartII RG2.4” to the Layer 7 Dependencies. Both suppliers precede this roadmap in the merge order (lines 25 and 290), so depcheck stays at 0 problems.

Round 6 reviewed at head d2fa63d, the current head of the pull request (the checkout was already there; nothing was fetched). All three round-5 findings are repaired and the repairs are sound at their locators. One blocking finding remains in the passage the round-5 repair rewrote: §7.3 states Serre S₂ of the μ-admissible locus at no named level, while its route, its declared supplier input and its sources are Iwahori-only; one non-blocking note follows.

## Verified sound

### Round-5 findings, checked one by one at head d2fa63d

| Round-5 finding | Repaired passage | Status and check |
| --- | --- | --- |
| F01 (P2) `gap:algebraic-coherence` vague and compound | Line 113 and design/plan.json (slug `algebraic-coherence`, supplier GeometricSatakeAndFusion, section “GS0, algebraic Schubert prefix”): “prove two statements. (i) Coherence: for G=∏Res_(K_i/F)H_i with each H_i tamely split, any parahoric level, any dominant … μ and p∤\|π₁(G^der)\|, for n≫0 the dimension of global sections of the n-th power of the ample determinant line bundle on the reduced μ-admissible Schubert union … equals that on the generic Schubert bound Gr_≤μ, so the special fibre of the polynomial closure of §1.2 is that reduced union …; (ii) … for a split group over k((t)) with simply connected derived group, Iwahori level and any dominant μ, the equal-characteristic local model is normal with Frobenius-split reduced special fibre, and that special fibre, the μ-admissible union, is Cohen–Macaulay, hence S₂”. §7.3 (line 1040) now says input (ii) is used only on the split G′ with the same admissible set; §4.11 and §1.3 keep (i). The two `needs` strings are byte-identical in README and plan.json. | Repaired. (i): LEV line 1389–1392 states the coherence equality h⁰(A_(P_a♭)(λ_μ),L^n)=h⁰(S_G(λ_μ)_F̄,L^n) for n≫0 (with the product formula at LEV line 1385–1388 turning the generic bound of the Weil restriction into S_G(λ_μ)); LEV Theorem 4.3.2 (LEV line 1243, p. 29: page marker at 1233) has exactly the hypothesis p∤\|π₁(G^der)\| and concludes the admissible union equals the special fibre; PZ line 2655–2659 gives the inequality and (8.19) as the equality, with “equality iff A=M̄”. (ii): GL Theorem 2.1 (GL line 149, p. 4: marker at 137) is for the tame equal-characteristic model at any parahoric; its proof passes to a z-extension with simply connected derived group, where M^sch is the flat closure (GL line 201–203, Remark 2.5(1) at 208–213); Corollary 3.5 (GL line 288–297, p. 7: marker at 275) realizes Adm(μ) by a split G′ and concludes Cohen–Macaulay from Theorem 2.1 and HMS14 Theorem A.3, with footnote 3 (GL line 320–321) naming HR19 (p>2) and FHLR22. The hypothesis “simply connected derived group” is sufficient for §7.3 since every adjoint split root system admits a z-extension-type cover (G_sc×T_sc)/Z_sc whose cocharacter lattice surjects onto the adjoint one, and it excludes the false reading (HLR Theorem 1.1, HLR line 69–74). The supplier section “GS0, algebraic Schubert prefix” is a requested extension, not an existing section, as for the three sibling gaps. |
| F02 (P3) §1.3 narrowed to minuscule μ | Line 371: “Use the local model datum with general bound of §0.1. If G is quasi-tame, μ is dominant and p∤\|π₁(G^der)\|, M^pol_(𝒢,μ) is normal and its geometric special fibre is reduced … Each geometric irreducible component is normal, Cohen–Macaulay and Frobenius split … (LEV, Theorem 4.2.7, pp. 24–25, LEV line 1024, for every dominant μ, and Theorem 4.3.2 …; minuscule specialization: KPZ … KP …)”; new Check at line 377; Needs line 379 adds “§0.1 (general bound)”. | Repaired. LEV line 1024–1026 has no minuscule hypothesis and lists normal, Cohen–Macaulay, Frobenius split components; LEV line 85 (footnote 1) says μ is not assumed minuscule. The Check is recomputed below (GL₂, μ=(2,0): quadric cone, normal in every characteristic, one singular point). |
| F03 (P3) §7.4 Check names the Grassmannian variety but an Iwahori costandard | Line 1056 adds: “Here ∇ is the costandard sheaf of the quasi-minuscule orbit at that absolutely special level, of dimension 〈2ρ,μ〉=〈(2,0,−2),(1,0,0)〉=2; the example tests the step that geometric unibranchness suffices for the lowest costandard stalk, which GL Lemma 5.4 applies at Iwahori level to the Schubert variety of t^ν, of the same dimension ℓ(t^ν)=2.” | Repaired. HLR line 1863 (absolutely special vertex, standard lattice), GL line 443–445 (∇ as Rj_*F_ℓ[ℓ(t^ν)] on the Iwahori orbit) and GL line 454–459 (the kernel/cokernel argument and the constant lowest stalk) match; 〈(2,0,−2),(1,0,0)〉=2, and the Iwahori Schubert variety of a maximal element of Adm(μ) has dimension 〈2ρ,μ〉 by equidimensionality of the special fibre. |

Round-2 to round-4 findings marked not actionable were not re-raised; their reasons stand.

### Sources: the fifteen seeded targets, read at their locators

All 21 manifest records are certified; the manifest flags no locator as unverified; no fetch was needed and no needs-references file was written. Line numbers are those of the cached extractions; printed pages were checked against the page markers (KPZ, KZ, LEV, GL, HLR: as printed; SW: extraction page minus ten; KP: extraction page plus 120).

| Target | Read | Outcome |
| --- | --- | --- |
| 0.1 Local model data | KPZ §3.1.1, KPZ line 686–696, pp. 15–16; §2.1.1 quasi-parahoric definition, KPZ line 420–427; KZ §3.1.1, KZ line 811–817, p. 18; Definition 3.1.6(1), KZ line 856–861, p. 19 | Matches: triple with minuscule μ, quasi-parahoric stabilizer 𝒢 (𝒢°_x(Ŏ)⊂𝒢(Ŏ)⊂𝒢_x(Ŏ)), morphisms as group homomorphisms carrying {μ}. The README's “smooth affine with 𝒢° parahoric” is equivalent: 𝒢(Ŏ) normalizes 𝒢°(Ŏ), hence lies in the stabilizer of the facet barycentre, KPZ's 𝒢_x for that x. |
| 0.2 Hodge and abelian type | KPZ Definitions 3.1.2–3.1.3, KPZ line 700–711, p. 16; KZ local Hodge embedding, KZ line 827–830, p. 18; Definition 3.1.6(2), KZ line 862–867, p. 19; SW Definition 21.6.8, SW line 7685, pp. 200–201 | Matches: minuscule representation, ρ∘μ conjugate to diag(a^(d),1^(h−d)), scalars in the image; KZ's diag(1^(n−d),(a⁻¹)^(d)) is the inverse convention the README records; SW's quotient t_Λ of rank d. |
| 1.1 Polynomial modification input | KPZ §3.2.2, KPZ line 793–800, p. 18; LEV Definition 4.1.1, LEV line 791, p. 20; Proposition 4.1.4, LEV line 808, p. 20; Theorem 4.2.10, LEV line 1194, p. 28 | Matches: K₀/F unramified, P monic, 𝓗 smooth affine with geometrically connected fibres, the functor of pairs (E,β); representability (4.1.4) and ind-projectivity (4.2.10) are the contract gap:polynomial-bd-projectivity requests. |
| 1.3 Normality and admissible fibre | LEV Theorem 4.2.7, LEV line 1024–1031, p. 25; Theorem 4.3.2, LEV line 1241–1248, p. 29; KPZ Theorem 3.2.9, KPZ line 859, p. 19; KP Theorem 2.1.2 and Corollary 2.1.3, KP line 1279–1286, p. 151 | Matches at the repaired generality (F02); base-change normality from reducedness of the special fibre (KP line 1285–1286). |
| 1.6 One-lattice GL representative | SW Proposition 21.6.9 and proof, SW line 7710–7722, p. 201 | Matches: kernels of Λ⊗B_dR⁺→Λ⊗R→t_Λ form a chain, projective dimension one, ξ-twisted duality in the polarized case. |
| 3.3 Good embeddings by descent endomorphisms | KPZ §3.4.5 and Proposition 3.4.6, KPZ line 1257–1299, pp. 29–30 | Matches: hypotheses p∤\|π₁(G^der)\|, x generic in its facet, no division index divisible by p, tame K̃/K making x hyperspecial; 𝒢 is the intersection of Res(H₀⊗O_K̃) with the centralizers of t_γ (Γ) and t_x (multiplication by O_F-algebra generators of O_K̃). |
| 4.2 Reduced tangent cones | KPZ Remark 4.1.5, KPZ line 1350–1361, p. 31 | Matches: necessary condition (1); the surface x²+xyz=0 with 3-dimensional tangent space and 2-dimensional curve span. Source issue E1 (the source calls the surface normal) confirmed again. |
| 4.5 Affine-root curves | KPZ §4.2.1 and Proposition 4.2.2, KPZ line 1404–1425, pp. 32–33 | Matches: k_α=max{k∈ℤ:(λ−kα∨)^dom≤μ} (k=0 always qualifies, so the README's j≥0 is the same), the curve a↦t^λx_α(t^(−k)a), derivative X_αt^(〈λ,α〉−k), the pair set Φ^cur. |
| 4.8 Cartan directions | KPZ §4.3.1, KPZ line 1737–1747, p. 40 | Matches: u_(−α)=x_(−α)(1) in the stabilizer, conjugate t^(〈λ,α〉−k)(X_α+H_α+X_(−α)), torus projection to H_α; exponent bookkeeping recomputed below. |
| 5.1 Frobenius orbit steps | KZ §5.2.1, KZ line 2120–2150, p. 48 | Matches: special fibre a union of Schubert varieties indexed by Adm({μ})_J in the companion flag; the very special alternative description of the order. |
| 6.1 EL and PEL chains | SW Definitions 21.6.1–21.6.2, SW line 7622–7640, p. 199 | Matches: the four conditions, θ_b, adjacent quotients, the invertible line L in the polarized case. |
| 6.2 Chains and torsors | SW Theorem 21.6.4, Remark 21.6.5, Corollary 21.6.6, Remark 21.6.7, SW line 7644–7672, pp. 199–200 | Matches: smooth 𝒢, étale-local standardness, torsors ⇔ chains, possibly disconnected 𝒢 with 𝒢° parahoric. |
| 7.5 Connected tubes | GL Theorem 1.3, GL line 70–78, p. 2; Lemma 5.2, GL line 428–431, p. 10; proof of 1.3, GL line 471–483; GLX Theorem 3.8, GLX line 886–888 | Matches: unibranch kimberlite for all (G,μ) of Definition 1.1, Iwahori reduction via GLE22 Lemma 5.26, the clopen-splitting argument; GLX restates it for Ĕ⊆F⊆C_p. The GLX extraction has no page markers, so “p. 22 (v3)” was not checked. |
| 7.7 Good embeddings for acceptable data | KZ Proposition 3.1.9 and proof, KZ line 874–900, pp. 19–20 | Matches: p>2, acceptable, Hodge type, p∤\|π₁(G^der)\|, R-smooth centralizer of a maximal F̆-split torus; the proof passes to a (possibly wild) splitting field K and replaces the point and the representation. |
| 7.8 Admissibility as lattice membership | KZ Proposition 3.1.14 and Remark 3.1.15, KZ line 946–964, pp. 21–22 | Matches: 𝒢̃=𝒢, membership iff w∈Adm({μ})_J, the representative by reduction of ϖ_FgΛ, the inverse-cocharacter convention. |

Further locators opened this round at their claimed content: PZ line 2648–2661 (p. 64); HLR line 60–83 (pp. 2) and 1855–1868 (p. 38); GL line 55–88, 136–148, 196–216, 225–252, 253–297, 385–400, 415–432, 440–469; LEV line 80–90, 1018–1032, 1238–1250, 1383–1395; FHLR Theorem 4.1, FHLR line 518–536 (p. 11); KPZ line 1232–1237 (Definition 3.4.4); AGLR line 2180–2182 (Proposition 6.13, the constant-term compatibility cited in the GS0 contract).

### Adversarial pass

Rows cover the repaired passages, the sampled targets, the headline families and the findings; “no change” means the computed instance agrees with the statement as written.

| Statement | Instances | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Gap (i): coherence equality | GL₂ Iwahori, μ=(1,0) | Admissible union: two P¹ meeting in a point; L=O(1) on each component: h⁰(L^n)=(n+1)+(n+1)−1=2n+1. Generic bound P¹ with L of degree 2: h⁰=2n+1. χ constant in the flat family. | Equal for every n; special fibre is the reduced union | No change |
| Gap (i): hypothesis needed | PU₃(F′/F) ramified, p=3, μ=(1,0,0) | \|π₁(G^der)\|=3; HLR line 1867–1868: special fibre nonreduced, so h⁰ of the reduced union is strictly smaller for n≫0 | p∤\|π₁(G^der)\| is necessary | No change |
| Gap (ii): realization by a split group with simply connected derived group | PGL₂ adjoint, μ=1∉2ℤ=Q∨ | Adm(μ)={τ,τs₀,τs₁} (3 elements, Ω-component τ≠1). G′=GL₂, derived SL₂ simply connected, μ′=(1,0)↦1: Adm_(GL₂)((1,0))={t^(1,0),t^(0,1),τ}, order-isomorphic. A_(I,(1,0)) two P¹: (dim,depth)=(1,1), S₂ | The hypothesis suffices for §7.3's use | No change |
| Gap (ii): hypothesis needed | PGL₂ at p=2 vs SL₂ | HLR line 69–74: for PGL₂, p=2, all but finitely many Schubert varieties are not S₂; SL₂ has π₁=1 | Without “simply connected derived group” the request would be false | No change |
| §1.3 general μ (F02) | GL₂ hyperspecial, μ=(2,0); (1,0); 0 | 〈(1,−1),(2,0)〉=2; Adm_K={(2,0),(1,1)}; Gr_≤(2,0) ≅ cone over the conic, coordinate ring k[u²,uv,v²], a saturated semigroup ring, normal in every characteristic including p=2, singular only at t^(1,1); P¹; Spec O_F | Check correct; LEV 4.2.7 covers it | No change |
| §1.3 hypothesis | PGL₂ p=2; GL₂ p=2 | \|π₁(PGL₂)\|=2 excluded; \|π₁(SL₂)\|=1 allowed | Scope right | No change |
| §7.3 level | GL₂, K hyperspecial, μ=(1,0) | A_(I,μ): dimension 1; π⁻¹(A_(K,μ)): P¹-bundle over P¹, dimension 2; gap (ii) requested at Iwahori level; GL line 220, 288, 474–476 Iwahori | Parahoric form unproved and unneeded | R01 |
| §7.3 transfer and criterion | k[x,y]/(xy); two planes meeting in a point | (dim,depth)=(1,1), S₂, graph one edge; (2,1), not S₂, graph two vertices no edge | Criterion consistent | No change |
| §7.3 route inputs | PGL₂↔GL₂ transfer | Uses W̃⊂Aff(Σ), W₀-orbit of maximal elements, realization by a split group: RG2.1/RG2.4 objects absent from the Needs line | Needs line incomplete | R02 |
| §7.4 example (F03) | PU₃, p=3, μ=(1,0,0) | 2ρ=(2,0,−2), 〈2ρ,μ〉=2; ∇=Rj_*F_ℓ[2]; H^(−2)(∇)_x=(j_*F_ℓ)_x=F_ℓ^(#branches at x)=F_ℓ by unibranchness | Bound 1 holds; level named | No change |
| §0.1 datum vs KPZ quasi-parahoric | GL₂ Iwahori I; the swap g=((0,1),(π,0)) | g normalizes I and fixes the edge midpoint x: g∈𝒢_x(Ŏ); any 𝒢(Ŏ)⊃𝒢°(Ŏ) normal lies in the facet stabilizer = 𝒢_x(Ŏ) for x the barycentre | Definitions equivalent | No change |
| §0.2 conventions | h=3, d=1; KZ inverse | Subspace rank 1, SW quotient rank 1 with kernel rank 2; diag(a^(1),1^(2))⁻¹ = diag(a⁻¹,1,1): weights 0,−1 | Dictionary correct | No change |
| §1.1 Checks | GL₁, P=u−π, m; P=1; G_a | t^m, m=0 neutral; R[u][1/1]=R[u], β global so one point; LG_a/L⁺G_a=t⁻¹k[t⁻¹], ind-affine | Checks correct | No change |
| §1.6 duality | h=3, d=1 | P² of lines vs SW rank-1 quotients = dual P²; kernels of rank 2 | Opposite flag as stated | No change |
| §3.3 cutout | K̃=K, Γ=1 | Res_(O_K/O_K)H₀ ∩ {commute with O_K} = H₀, the hyperspecial model; with Γ≠1 commuting with Γ alone misses O_K̃-linearity (line 600) | Both equation families needed | No change |
| §4.2 obstruction | x²+xyz=0, curve (f,g,h) | f(f+gh)=0 in the domain k[[a]] ⇒ f=0 or f=−gh∈(a²); axes give (0,1,0),(0,0,1); span {x=0} of dimension 2 inside T₀=k³; minimal primes (x),(x+yz) | Correct; source misprint E1 | No change |
| §4.5 interval | SL₂, λ=0, μ=α∨; j=2 | k_α=max{k≥0: kα∨≤α∨}=1; derivative t^(0−1)X_α=t⁻¹X_α; (−2α∨)^dom=2α∨>α∨ | Checks correct | No change |
| §4.8 exponents | general; SL₂ λ=0,μ=α∨; λ=μ=α∨ | KPZ exponents ⟨λ,α⟩−k, 1≤k≤k_α, i.e. [−k_(−α), ⟨λ,α⟩−1] by k_α=k_(−α)+⟨λ,α⟩; the Cartan chart is t⁻¹k[t⁻¹]𝔱, so only [−k_(−α),−1] survive = README's i≤k_(−α). λ=0: k_(−α)=1 gives t⁻¹H_α; λ=μ: k_α=2, k_(−α)=0, no Cartan term, root part exponents {0,1}: total dimension 2=〈2ρ,μ〉 | Definitions agree | No change |
| Conventions sign | g=((1,0),(1,1)), E | gEg⁻¹=((−1,1),(−1,1))=E−H−F | Witness correct | No change |
| §5.1 orbit sum | A₂ with reversal | Orbit {α₁∨,α₂∨}, sum counted once; period 4 would double | Distinct members | No change |
| §6.1 chains | B=F, b=π_F; quaternion O_D, R an F_(p²)-algebra | θ_b iso, composite = π_F, zero mod π_F; (O_D/Π)⊗R=F_(p²)⊗_(F_p)R=R×R, ranks (1,1) vs (2,0) | Checks correct | No change |
| §6.2 torsors | One-lattice chain; GL₂ Iwahori chain | 𝒢=GL(Λ), torsors = rank-h locally free modules; the chain automorphism group is I (the swap does not preserve the indexing), connected | Disconnection only in the unitary cases named | No change |
| §7.5 tubes | μ=0; smooth point; node xy=π | Point, open disc, annulus: all connected; Iwahori reduction first (GL line 428–431, 471) | Formula and order correct | No change |
| §7.7 hypotheses | PU₃ ramified p=3; split torus | \|π₁\|=3 excluded; a torus split over a tame extension is R-smooth; K/F may be wild (KZ line 880) | Scope matches KZ | No change |
| §7.8 representative | g with π_FΛ⊂π_Fρ(g)Λ⊂Λ; g=diag(π⁻²,1) | π_Fμ(π_F)Λ=diag(π^(n−d),1^(d))Λ, image mod π_F the rank-d weight-(−1) subspace; for g=diag(π⁻²,1), π_FgΛ⊄Λ: no Grassmannian point, w∉Adm | Both directions consistent | No change |
| Tate normalization | q=9, d=0,1 | (φ,τ)=(1,1),(1,−1/3); κ^ss=(−1)^dτ=1/3 | Retained in Layer 8 | No change |
| Headline statability | each Layer 1–8 family | Object greps at the pins (below): no affine Grassmannian, Schubert, parahoric, kimberlite, Wakimoto or nearby-cycle carrier; `Module.Grassmannian` is a functor of points | None statable; docstring names each | No change |

Context and degenerate cases: the trivial group and μ=0 give Spd O_E, Spec O_E and a point throughout; p=2 enters only where stated (§6.1, §6.6, Dᴴ in §4.9); gap (ii)'s “simply connected derived group” makes its prime-to-p range all p. Locally noetherian is supplied by finite type (line 21).

### Pinned declarations and object greps

Pins: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a, Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 (lake-manifest.json of the content checkout), equal to README lines 39 and 43. Opened at the pin this round: `Submodule.span` Mathlib/LinearAlgebra/Span/Defs.lean:46, `Algebra.trace` Mathlib/RingTheory/Trace/Defs.lean:70, `Module.Grassmannian` Mathlib/RingTheory/Grassmannian.lean:66 (a structure extending `Submodule`), `traceForm_nondegenerate` Mathlib/RingTheory/Trace/Basic.lean:501 (with `FiniteDimensional` and `Algebra.IsSeparable`), `AlgebraicGeometry.Scheme` Mathlib/AlgebraicGeometry/Scheme.lean:40, `AlgebraicGeometry.IsClosedImmersion.iff_isProper_and_mono` Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean:392, `TauCeti.AlgebraicGeometry.ZariskiTangentSpace` TauCeti/AlgebraicGeometry/TangentSpace/Basic.lean:65, `Derivation.adjointWeightSpace` TauCeti/Algebra/AlgebraicGroup/Tangent/RootSpace.lean:100: all eight exist at the cited lines with the cited shapes. Object greps at the pins: “Schubert”, “unibranch”, “affine Grassmannian”, “parahoric”, “kimberlite”, “Wakimoto”, “nearby cycle”: no file in Mathlib or Tau Ceti; “Iwahori”: only Hecke-relation mentions in TauCeti/KnotTheory; “local model”: 49 Tau Ceti files, all meaning the local structure of a sheaf or a function-field place, unrelated; “Grassmannian”: Mathlib/RingTheory/Grassmannian.lean and two TauCeti/LinearAlgebra/TotallyReal files (Lagrangian loops). Nothing this roadmap defines exists at the pins.

### Cross-roadmap citations and ownership

| Supplier (where read, this round) | Resolved |
| --- | --- |
| GeometricSatakeAndFusion (#1235) | “Generic Schubert bounds” (its line 344), “Equal-characteristic Schubert models and coefficient comparison” (785), “Witt affine flags and components” (825), “Integral parahoric ind-properness” (843), “Bounded admissible affine flag loci” (947; the constant-term compatibility it cites is AGLR Proposition 6.13, AGLR line 2180), “Relative-position flag correspondences” (971); Layer GS2 “Satake categories, convolution and rigidity” (1341); GS4 normalized equivalence (anchor at 2026, `normalizedSatakeEquivalence` with the pinned Weil group, 2034). The “algebraic Schubert prefix”, “polynomial BD extension”, “algebraic loop prefix”, “canonical deperfection extension” and “GS2 early central prefix” are requested extensions, consistently named across the gaps. |
| ReductiveGroupsPartII (#785) | RG2.0a.1–RG2.0a.3 (964–1380), RG2.1.1–RG2.1.5 (1468–2447), RG2.2.1–RG2.2.4 (2847–3409), RG2.3.1–RG2.3.7 (3801–5202; the target “Tame realization of stabilizers as fixed points of hyperspecial models” cited in §2.1 is at its line 4708 inside RG2.3.5), RG2.4.1–RG2.4.4 (5534–6214), RG2.5.1–RG2.5.2 (6725–6932). |
| SmoothRepresentationsOfLocalGroups (#785) | SR.1 (974, SR.1.1–SR.1.5), SR.3.2 (2604), SR.4.1 (3084). |
| PELModuli (#966) | M0 (420, M0.1–M0.4). |
| EtaleDualityAndPerverseSheaves (#1040) | §§2.1–2.3, 2.6–2.10 (1344–2540). |
| LefschetzPencilsAndVanishingCycles (#873) | LPV.0 §§0.1–0.8 (330–647), LPV.1 (917), §1.10 (1396) with `VanishingCycles.semisimpleTrace`, `_refinement`, `_additive` at its lines 1412–1414 (targets of the supplier, not pinned declarations: the resolver's lead is expected), LPV.6 §§6.1–6.2 (3275–3295). |
| ClassicalAdicEtaleCohomology (#875) | §4.5a, “Comparison with nearby cycles of the adic generic fibre” (its lines 8, 37–39). |
| SchemeAndStackFoundations (main) | §§0.8, 0.17–0.21, 0.26, 0.28, 0.30, 1.1, 4.6–4.14 (798–5706). |
| ModularCurves (main) | §0G (427). |
| RootSystemsPartII (packages/RootSystemsPartII/design/README.md) | RS2.4 (410), “Existential dominant orbit-sum step” (472), “Coroot step with central directions retained” (501), “Independent continuation briefs” (590), “Minuscule weights and modular representation bounds” (598). The resolver's “no roadmap RootSystemsPartII” is a false lead: merge order line 26. |
| DiamondsAndVStacksPartII (packages/DiamondsAndVStacksPartII/design/README.md) | D10.8, D10.9, D10.12–D10.15 (1150–1297), D11.5 (1425), D11.11–D11.14 (1567–1649), D11.16–D11.20 (1685–1790). Same false lead; merge order line 152. |

All suppliers precede this roadmap (merge order lines 2, 25, 26, 27, 63, 64, 122, 132, 150, 152 versus 290). Ownership by object: `roadmaps grep` over the open heads and main for “admissible locus”, “kimberlite”, “Wakimoto”, “Drinfeld local model”, “formal-curve” and “Pappas–Zhu local model” hits only the suppliers above, AffineLieAlgebras (Wakimoto modules of affine Lie algebras), EndoscopicTransferAndUnitaryTraceComparison and ColemanIntegration (“admissible” in unrelated senses): no second owner. The board index lists 15 packages under review; none builds local models.

### Declared gaps and dependency order

plan.json `gaps` and the README contracts agree on all 42 slugs and suppliers; the `needs` sentences agree on 41 and differ on `gap:algebraic-compatible-schubert-splitting` only by the README-side locator sentence (as in round 5, not a finding). Every slug is cited by a Needs line; none has supplier `none`; the repaired `gap:algebraic-coherence` is now precise and minimal (both statements carry group, level, bound and hypotheses, and neither is provided by Mathlib, Tau Ceti or an earlier roadmap: GeometricSatakeAndFusion at #1235 has no coherence or Cohen–Macaulay statement). The plan changed only in that `needs` string (git diff 54b204b..d2fa63d).

    depcheck: 56 roadmaps, 647 edges, 0 problem(s)

No UPWARD, CYCLE or moved line; the merge-order file was not edited.

### Shape, headlines and Lean

README shape and style: title, Summary, Scope, Conventions, per-supplier contracts, How to read, Layers 0–8 each with Examples and Dependencies, Downstream consumers, Worked examples, References; 60 target sections each with a Needs line; 27 Checks blocks; greps for LaTeX delimiters, process words, pull-request numbers, machine paths, `set_option`, `#eval`, `lemma`: none (the one “lemma” hit is “trait normality lemma” in prose at line 280). The round-6 diff touched README lines 113, 371–379, 1040–1042 and 1056 and plan.json line 4075 only.

Headlines: Suggested.lean is unchanged (52 lines, one module docstring, empty namespace); it names each headline family of Layers 1–8 with the carrier it lacks; none is statable at the pins (object greps above). Zero declarations: nothing to probe with one tactic, no sorry'd data, no lost binders, and the `#check @name` audit has no names to compare.

Elaboration: `lake env lean` on packages/GeometricSatakeAndFusionPartII/Suggested.lean from the content checkout: exit 0, no output, 10 s. The file imports `Mathlib` only; no TauCeti module build was needed.

## Not verifiable

- HMS14 Theorem A.3, cited by GL Corollary 3.5 for the Cohen–Macaulay step of gap (ii), is not in the manifest and was not fetched; FHLR Theorem 4.1 (FHLR line 522–524) was read instead and gives normality, Cohen–Macaulayness and compatible F-splitting of each seminormalized Schubert variety for every reductive group, not of the admissible union, so the union statement still rests on GL's citation. The gap asks the supplier to prove it; nothing here depends on the fetch.
- The GLX extraction carries no page markers, so the printed page of GLX Theorem 3.8 (“p. 22 (v3)”) was not checked; the content at GLX line 886–888 is as cited.
- The published Annals text of KZ was not collated; KZ locators refer to the manifest's author version. KZ Lemma 3.1.10 (cited with Proposition 3.1.9 in §7.7) was not opened this round.
- Ownership against the board packages not read (ArithmeticLocallySymmetricSpacesPartII, HigherHidaAndColemanTheory, LawrenceVenkateshMethod, OrdinaryAutomorphicFormsAndModularityLiftingPartII, PadicLocalLanglandsForGL2QpPartII, VStackSheavesAndLisseCategoriesPartII) is not certified; their subjects do not touch local models.

## Source issues

- **Error** in KPZ at Remark 4.1.5(2), printed page 31: the source calls the surface x²+xyz=0 normal (and prints the ring as k[x,y,x]); it should say the surface is reduced and reducible with minimal primes (x) and (x+yz), hence not normal at the origin; affects nothing (the tangent computation stands; already recorded as this roadmap's E1).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d2fa63d", "job": "REV-PKG-GeometricSatakeAndFusionPartII~6", "model": "fable", "worker": "fable-rev168"} -->

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d2fa63d", "job": "REV-PKG-GeometricSatakeAndFusionPartII~6", "model": "fable", "worker": "fable-rev168"} -->
