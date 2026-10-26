<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1623#issuecomment-6410365628 -->
Red team round 1 pass b (claude) of 02f336a

Verdict: needs changes

1. **F01** (P1) §12.2 parabolic invariance is false as stated (and so is its source lemma)

   **Location.** README.md:1318, §12.2: "invariant under p·(F₁,F₂,ψ)=(pF₁,F₂,ψ) for p∈P_w. Every component Z_v with a_(w,v)>0 is individually P_w-stable for this ambient action"; proof route README.md:1320: "Its induced cycle is invariant under the second-flag action with simultaneous Ad action on ψ."

   **Claim.** For every w, the cycle ℒ_w (hence each Z_v with a_(w,v)>0) is stable under left multiplication by the standard parabolic P_w on the first flag only. This is BHS19 Lemma 2.4.8 restated (BHS19 lines 1017–1030).

   **Witness.** G=SL₂, w=e: README.md:1309 gives P_e=B, README.md:1239 gives ℒ_e=[Z_e], README.md:668 gives Z_e={(F,F,ψ):ψ∈u_F}. Take (ke₂,ke₂,0)∈Z_e and u=[[1,1],[0,1]]∈B: u·ke₂=k(e₁+e₂)≠ke₂, so (uF₁,F₂,0)∉Z_e. Hence u(Z_e)≠Z_e and u·ℒ_e≠ℒ_e. The same failure occurs in SL₃ for w=s₁ (P_w moves the plane of a generic F₁ off the plane of F₂, leaving Z_{s₁}). The README's own Check README.md:1324 already records that the first-flag G-action does not preserve Z_e, but the theorem for w=e asserts B-stability of exactly Z_e.

   **Where the proof breaks.** Strong P_w-equivariance of Loc(L_w) on F gives stability of Ch on F, i.e. of the slice Z_v∩({eB}×F×g) under (eB,F₂,ψ)↦(eB,pF₂,Ad(p)ψ). Under Ind, [g,hB]↦(gB,ghB), the second-flag action of p pulls back to [g,(g⁻¹pg)hB], the action of the conjugate g⁻¹pg on the fibre; so the induced module is not P_w-equivariant for the second-flag action on all of F×F (the step at README.md:1320 and BHS19 lines 1033–1038). Composing the slice statement with diagonal G-invariance gives only: for F₁=gB, Z_v is stable under F₁↦gp⁻¹B, i.e. under replacing F₁ by any flag with the same image in G/P_w. For w=e (P_e=B) that is the identity, consistent with the witness; for w=w₀ (P=G) it is unrestricted, consistent with Z_{w₀}=F×F×{0}.

   **Repair (statement, README.md:1318).** Replace the two sentences by: "Every component Z_v with a_(w,v)>0 is the full inverse image of its image under ϖ:F×F×g→G/P_w×F×g, (F₁,F₂,ψ)↦(F₁P_w,F₂,ψ): if (F₁,F₂,ψ)∈Z_v and F₁′ has the same image as F₁ in G/P_w, then (F₁′,F₂,ψ)∈Z_v. Equivalently the slice Z_v∩({eB}×F×g) is stable under p·(eB,F₂,ψ)=(eB,pF₂,Ad(p)ψ), p∈P_w, and ℒ_w is invariant under this slice action. Left multiplication by the standard P_w on F₁ alone need not preserve ℒ_w." Keep "This action need not preserve all of Z."

   **Repair (proof route, README.md:1320).** Replace "Its induced cycle is invariant under the second-flag action with simultaneous Ad action on ψ. Compose with the inverse diagonal G-action to obtain the displayed first-flag-only invariance." by: "Strong P_w-equivariance makes Ch(Loc L_w)⊂T*F stable under (F₂,ψ)↦(pF₂,Ad(p)ψ); this is the slice of Ch(Ind)=G×ᴮCh(Loc L_w) over F₁=eB. Diagonal G-invariance transports slice stability at F₁=gB to the conjugate gP_wg⁻¹, i.e. to replacing F₁ by gp⁻¹B. The identification G×ᴮF≅F×F conjugates P_w by the first coordinate, so no second-flag action of the standard P_w on all of F×F×g is an equivariance of the induced module."

   **Repair (Checks, README.md:1324–1325).** Add the negative control: "For SL₂, w=e, P_e=B and ℒ_e=[Z_e]: (ke₂,ke₂,0)∈Z_e, and u=[[1,1],[0,1]]∈B sends it to (k(e₁+e₂),ke₂,0)∉Z_e; the first-flag B-action moves [Z_e], while the slice action and the same-image-in-G/B replacement fix it." Tested on the refuting instance: for w=e the corrected statement is the identity, for w=s it is G-stability of F×F×{0}; both hold.

   **Consequences.** The Summary (README.md:3) lists parabolic invariance among the end theorems; the corrected form is what the proof supplies. Also list the source error under References (BHS19 entry, README.md:1529): "Lemma 2.4.8 and Remark 2.4.9 are used in the slice form stated in §12.2."

2. **F02** (P3) §8.6's locator attributes generic-length multiplicity to G98 Definition 1.1.12

   **Location.** README.md:903: "G98, Definition 1.1.12, p. 5, using generic length (G98 line 151)".

   **Claim.** G98 Definition 1.1.12 supports the generic-length coefficient of CC.

   **Witness.** G98 lines 191–194 define the multiplicity at a component S as the rank of gr M⊗_{gr A}A′ over the coordinate ring A′ of the reduced component, not the generic length. For M=D_{A¹}/D x² with the order filtration, gr M=k[x,ξ]/(x²): rank of k[x,ξ]/(x²)⊗k[ξ]=k[ξ] is 1, while the generic length on x=0 is 2 (the README's own Check README.md:920). The References entry README.md:1533 states the distinction correctly; the §8.6 parenthetical does not.

   **Repair.** README.md:903: replace "G98, Definition 1.1.12, p. 5, using generic length (G98 line 151)" by "G98, Definition 1.1.12, p. 5, for the reduced characteristic variety only; its rank-over-the-component multiplicity is not used (G98 line 191)".

3. **F03** (P3) garbled or self-referential input sentences leave the inputs unnamed

   **Location and claim.** Five sentences name a subsection's own number, or nothing, as the input of a proof route or API law:
   - README.md:680 (§6.5): "Reducedness of Q is the separate the conditional comparison in §6.5 input."
   - README.md:942 (§9.1): "The sheaf-derived operations needed beyond the existing carrier are the §9.1 and the derived-bimodule contract input."
   - README.md:966 (§9.2): "bounded by the §9.1 and the derived-bimodule contract input input."
   - README.md:1060 (§9.7 API): "descent is required in §§9.7 and 9.9."
   - README.md:1097 (§9.9): "General-field comparisons are the §§9.7 and 9.9 input."

   **Witness.** Each is a mechanical substitution residue: the §6.5 sentence has no grammatical subject-complement; §9.1 and §9.9 cite themselves as their own supplier, so a reader cannot tell which target proves the sheaf-level derived operations (§9.1 itself plus gap:derived-bimodule-sheaves) or the field descent of regularity (§9.7, README.md:1051, owns it).

   **Repair.** README.md:680 → "Reducedness of Q is a hypothesis of this conditional comparison, not an input supplied elsewhere." README.md:942 → "The sheaf-derived operations needed beyond the existing carrier are constructed here on top of gap:derived-bimodule-sheaves (EnhancedDerivedSheaves)." README.md:966 → "is bounded by §9.1 and gap:derived-bimodule-sheaves." README.md:1060 → "descent to arbitrary characteristic-zero k is proved in this subsection and consumed by §9.9." README.md:1097 → "General-field comparisons are the §9.7 field-descent input."

Package reviewed: `packages/SpringerResolutionAndCharacteristicCycles/README.md` (1535 lines, 69 numbered targets, 14 layers) and `packages/SpringerResolutionAndCharacteristicCycles/Suggested.lean` (module docstring only, zero declarations), at the pull request's current head. No pass-a red-team report exists on the pull request (its comments are the automated review, a codex review of 892285f, the fix notice and a claude review of 02f336a), so there are no pass-a findings to confirm or reject. The last repair report marks F03 `not actionable in this package`; nothing below re-raises it.

## Pass-a findings

No pass-a red-team report exists on the pull request; nothing to confirm.

## Adversarial pass record

Suggested.lean declares nothing (one module docstring, an empty namespace), so the declaration table is empty: there is no `#check @name` list to elaborate and no section-variable loss to check; I ran no Lean. The headline theorems listed in the docstring (fifteen groups) are the README's end theorems; each names the missing carrier (flag quotient, double incidence scheme, D_Y, holonomic heart, Verma localisation, completed local schemes). I checked that none is statable at the pins with a few native definitions: Mathlib at the pin has `AlgebraicGeometry.Scheme`, `AlgebraicCycle` (= `Function.locallyFinsupp X R`, no grading), `Module.length`, no flag scheme, no sheaf of differential operators, no Weyl algebra, no Hecke algebra or KL basis; Tau Ceti has `FinitelyPresentedSheaf` (an `abbrev` of the finite-presentation full subcategory) and `TauCeti.VermaModule` (characteristic zero, `IsKilling`, finite-dimensional, Cartan `IsTriangularizable`, a root base) but no simple quotient, composition multiplicity or localisation functor. No stand-in is stated, no padding exists.

Table rows: statement, instances, values on each side, result.

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| Conventions dimensions | trivial, torus rank r, SL₂ | (N,r,D)=(0,0,0),(0,r,r),(1,1,3); dim B=2, dim T*F=2 | agree |
| Conventions Cartan direction | GL₃ cycle e₁→e₂→e₃→e₁, z=diag(1,2,4) | w⁻¹zw=diag(2,4,1); wzw⁻¹=diag(4,1,2) | κ₂=w⁻¹κ₁ matches BHS19 Lemma 2.3.4 and the §3.2 formula κ₂=Ad(b⁻¹ŵ⁻¹g₁⁻¹)ψ |
| Conventions moment sign | A¹ covectors | (−a dx)+(a dx)=0; (a dx)+(a dx)=2a dx | agree |
| Conventions shift and δ | i:{0}→A¹, δ=D/Dx | [x,∂ʲ]=−j∂ʲ⁻¹ so x∂ʲδ=−j∂ʲ⁻¹δ; Tor₀=0, Tor₁=kδ; Li*δ[−1]=k in degree 0 | agree with Hⁱ(K[a])=Hⁱ⁺ᵃ(K) |
| Conventions weights | SL₂ w=e,s | −wρ−ρ = −2ρ, 0; M(0)⊃M(−2ρ) with quotient k | matrix ((1,0),(1,1)) |
| Conventions multiplicity | k[ε]/ε² | lengths 2, 1, 0; 2=1+1 | agree |
| §1.2 | SL₂, torus | dim P¹=1, dim B=2, D=3; torus F=pt, D=r; 2ρ∈X*(T) regular dominant for the embedding | agree |
| §1.4 | SL₂ e,s; general | dim U_w=N+ℓ(w): 1,2; stabiliser Lie algebra t⊕(u∩Ad(ŵ)u) of dim r+N−ℓ(w) | agree |
| §1.5 | k[ε]/ε², (1,0),(1,ε) | a(1,0)=b(1,ε) ⇒ a=b, bε=0: intersection ε·k(1,0), closed fibre ke₁ | not a summand; hypothesis needed |
| §2.2 | SL₂ E₁₂, 0, diag(1,−1) | centraliser dims 1,3,1 | regular yes,no,yes |
| §2.3 | SL₂ | q⁻¹(z) regular semisimple has 2 flags; q⁻¹(E₁₂) one flag | degree 2, ramified |
| §3.4 | SL₂ e,s; torus | 1+2=3, 2+1=3; 0+r=r | =D |
| §3.5/3.6 | SL₂ | V_e closed (U_e diagonal closed) so X_e=V_e; (ke₁,ke₁,E₁₂): x=y=0,b=1 satisfies 2a+b(x+y)=0 so lies in X_s∩V_e with ψ≠0 | agree with Worked examples |
| §3.7 | SL₂, torus | ambient 1+1+3=5, equations 2N=2, dim 3; torus r | lci |
| §3.8 | k[t,x]/(x²−t) | reduced total space, fibre t=0 length 2 | reducedness does not kill fibre multiplicity |
| §3.9 | SL₂ e,s | degree 1 each over regular locus; q degree 2; (ke₁,E₁₂) has one preimage in X_s | iso over g̃ʳᵉᵍ needs normal target: smooth |
| §4.1 | SL₂, torus | 3−1=2; r−r=0 | agree |
| §4.2 hypotheses | A₁ at p=5,3,2 | h=2: 5>2, 3>2, 2>2 false; ⟨ρ,α∨⟩=1, ⟨3ρ,α∨⟩=3≡0 mod 3 | regular weights correct; G simply connected semisimple matches BR12 line 160 |
| §4.2 Weyl relation over F₃ | ∂³,x³ | [∂³,x]=3∂²=0, [∂,x³]=3x²=0 | Frobenius centre needed |
| §4.2 empty word | diagonal kernel | O_Δ, Δ≅g̃ smooth of dim 3 | depth=dim=3 |
| §4.3 flatness counterexample | Spec Z_(p)⊔Spec Q[x,y]/(x²,xy) | A-flat; special fibre Spec F_p CM; generic component depth 0 < dim 1 | scaling argument needed and sound (closed G_m-stable model, A′-point by properness of flags, non-CM locus closed and G_m-stable) |
| §4.3 isogeny degree | types A_n,B,C,D,E,F,G with p>h | |π₁(G_ad)| divides n+1,2,2,4,3,2,1,1,1 and p>h exceeds each | kernel order invertible |
| §4.4 | pt⊔A¹→A¹ | fibres pure dim 0 = dim Y−dim Z, local 0≠1+0 at the isolated point, not flat | local hypothesis essential (BHS19 Lemma 2.3.2 as stated is false) |
| §5.3 | SL₂ z=0,E₁₂; GL₃ diag(a,a,c)+E₁₂ | centraliser dims 1 and 3 = ranks; ℓ(s_αv)>ℓ(v) ⇔ v⁻¹α>0 so e_α∈u∩Ad(v)u | regular on the wall |
| §5.4 codimension count | boundary C⊂V_v | dim of U_v×ker(wv⁻¹−id) inverse image = D−codim; dim C=D−1 forces codim 1, a reflection | sound |
| §6.1 | PGL₂, GL₂, torus over k[ε] | a²+bc=0; trace and det; ε has ad ε=0 but central coordinate ε≠0 | zero-fibre definition excludes ε |
| §6.3 | SL₂ trace vs 2·trace | tr(E₁₂E₂₁)=1, 2tr((E₁₂/2)E₂₁)=1 | form must be matched |
| §6.4/6.6 | SL₂ | Z_e=diag T*P¹ dim 2, Z_s=P¹×P¹×{0} dim 2, meet in diagonal P¹; ranks N−ℓ(w)=1,0 | agree |
| §7.2 | k[ε]/ε², k[x,y]/xy | 2[pt]; [V(x)]+[V(y)]; 2=1+1 | agree |
| §7.3 | SL₂ | X̄_s: on 2a+b(x+y)=0, κ₁=b(x−y)/2, zero divisor b(x−y) with coefficients 1,1 | [X̄_s]=[Z_s]+[Z_e] |
| §8.1 order | A¹ | [∂,x]=1; (p+1)-fold commutators vanish ⇔ order ≤p, F₀=O | agree |
| §8.2 | A¹ orders 0,1,2 | ranks 1,2,3; gr=k[x,ξ] | agree |
| §8.3 | O, D, constant filtration | gr O=k[x] (ξ=0); gr D=k[x,ξ]; constant filtration unbounded below, gr=0 | excluded |
| §8.4 | two good filtrations | M23 Prop 3.24: F_k⊆G_{k+ℓ} and G_{k−ℓ}⊆F_k | agree |
| §8.6 independence | F⊂G⊂F[1] adjacent | 0→K(−1)→gr^F→gr^G→K→0 (M23 lines 2748–2750); equal lengths at every common support generic point | sound for all components |
| §8.6 additivity boundary | D⊕O on A¹ | CC=[A²]; ends [A²] and [ξ=0] | unrestricted additivity false, as stated |
| §8.6 D/Dx² | order filtration | gr=k[x,ξ]/(x²), length 2 on x=0; G98 rank convention gives 1 | R02 |
| §9.1 duality of O | A¹ | resolution D→D by ·∂, Hom gives ∂·: D→D, cokernel D/∂D≅ω in degree 1; ⊗ω⁻¹[1] gives O in degree 0 | agree; the Check at README.md:958 states the O-module Ext computation, which also lands in degree 1 |
| §9.2 | δ, δ⊕δ | ker x of dim 1,2; coker x=0; Tor₁ in degree −1 then [−1] gives degree 0 | agree |
| §9.3/9.4 | O, δ, D, 0 | dims 1,1,2 ≥1; holonomic ≤1 except D | agree |
| §9.6 | G_m⊂A¹ | j_+O=k[x,x⁻¹], quotient by O generated by x⁻¹ with x·x⁻¹≡0, so ≅δ | boundary quotient as stated |
| §9.7 | ∂e=e | at t=1/x the form dx=−dt/t², pole order 2 | irregular |
| §9.8 | G_m on a point, weights 0,1 | D_pt=k so Lie action 0; differential 1≠0 | only trivial weights |
| §10.1 | SL₂, PGL₂ | X*(SL₂)=0 but ω∈X*(T); PGL₂: X*(T)=Zα=Z·2ω, ω∉ | lattice statement correct |
| §10.3/10.4 | SL₂ | Loc(M(−2ρ))=δ_{eB} (simple with infinite Γ); Ind gives diagonal direct image, cycle [Z_e]; Loc(k)=O_F, Ind gives O_{F×F}, cycle [Z_{w₀}]=[Z_s] | labels L_w↔U_w correct |
| §11.3 index | SL₂ | m_(s,e)=P_{w₀s,w₀e}(1)=P_{e,s}(1)=1; m_(e,s)=P_{s,e}(1)=0; Humphreys 8.4 form with M_w=M(w·(−2ρ))=M(−wρ−ρ) | both w₀ prefixes correct; A₃: P_{s₂,s₂s₁s₃s₂}=1+q matches BR12 line 1757 |
| §11.4 | A₁ | M=((1,0),(1,1)), det 1, inverse ((1,0),(−1,1)) | integral |
| §12.1 | SL₂, PGL₂ | ⟨−2ρ,α∨⟩=−2, ⟨0,α∨⟩=0; I_e=∅, I_s={α}; −α=−2ω∈X*(T_PGL₂), ω∉ | agree; P_w=G iff w=w₀ |
| §12.2 | SL₂ w=e, u∈B | (ke₂,ke₂,0)∈Z_e ↦ (k(e₁+e₂),ke₂,0)∉Z_e | R01 |
| §13.1/13.2 | SL₂, char 2 | k[x,y]/(x²−y²) graphs y=±x; char 2: W acts trivially on t, invariants k[t], fibre product the diagonal with coordinate ring k[t]; Z[x,y]/(x²−y²)⊗F₂=k[x,ε]/ε² | two constructions distinguished |
| §13.3 | k[x]_(x)→k[x,y]_(x,y) | completion k[[x]]→k[[x,y]], closed fibre k[[y]], 2=1+1; faithful flatness of the flat local map gives surjectivity onto Spec of the completed graph, so factoring through 𝒯̂_{w′}∩𝒯̂_w (dimension <r) is impossible | route sound and simpler than the source's |
| §13.4 tangent bound | SL₂ (e,e),(s,e),(s,s); torus | 1+1+1=3, 2+0+1=3, 2+1+0=3; 0+r+0=r; toral tangent z satisfies w⁻¹z=v⁻¹z ⇔ z∈ker(wv⁻¹−id) | matches BHS19 Prop 2.5.3(i) |
| §13.5 | general | (N+ℓ(w))+(r−ℓ(w)+ℓ(v))+(N−ℓ(v))=D | agree |
| §14.1 | y²=x²(1+x) at 0 | √(1+x)=1+x/2−x²/8+…, two branches y∓x√(1+x), lengths 1,1 | sum of branches |
| §14.4 | SL₂ w=s at a point of Z_e∩Z_s; off Z_s | (1,1)=(1,0)+(0,1); 1=1+0 | agree with Cor 2.5.6 |
| gap:lie-invariants | p=3, A₁; p-isogeny G_m→G_m | centraliser of E₁₂ dim 1=r; x↦xᵖ has zero differential, degree p, excluded by "invertible degree" | hypotheses explicit |
| gap:associated-bundle-descent | frame torsor of O(1), weights 1,−1,0 | (p,v)∼(pg,g⁻¹v): O(1),O(−1),O | inverse convention pinned by the Checks |
| gap:local-geometric-comparisons | node, closed point, generic point of A¹ | branch dims 1,1; at the generic point the completion is a field of dim 0≠1 | closed-point hypothesis needed; SchemeAndStackFoundations §§0.16/0.21 state no equidimensional-completion theorem, so the gap is minimal |
| gap:derived-bimodule-sheaves | EnhancedDerivedSheaves §0.3 | its tensor/Hom are stated "for a commutative R" | gap minimal |

## Verified sound

- Declarations read: 0 (Suggested.lean has none; docstring form, single `import Mathlib`, no `set_option`, no `lemma`, no `#check`, no sorry'd data). Targets read: 69 of 69, every line of the README.
- Locators verified against the cached texts: BHS19 — §2.1 p. 309 (line 458: the bound char 0 or p>h, called "good" there), (2.1)–(2.2) p. 310, Prop 2.1.1, (2.3)–(2.5) p. 311, Prop 2.2.1 and (2.6)–(2.7), Lemma 2.2.2 p. 312, Def 2.2.3, Lemma 2.2.4, Prop 2.2.5 p. 313, Thm 2.2.6(i)(ii), Lemma 2.3.1, Lemma 2.3.2 p. 315, Prop 2.3.3 pp. 315–316, Lemma 2.3.4 (κ₂,w=Ad(w⁻¹)∘κ₁,w), Lemma 2.3.5, Thm 2.3.6 and proof pp. 318–319, Conj 2.3.7, §2.4 (2.11)–(2.15), Prop 2.4.1, Rem 2.4.2, Rem 2.4.3, Prop 2.4.4, Rem 2.4.5, Prop 2.4.6, Thm 2.4.7(i)–(iii) with P_{w₀w,w₀w′}(1), Lemma 2.4.8 (R01), Lemma 2.5.1, Lemma 2.5.2 and its generic-point misprint (line 1107), Prop 2.5.3(i)(ii), Lemma 2.5.5, (2.16), Cor 2.5.6 (33 locators). BR12 — §1.1 line 160 (split simply connected semisimple), §2.1 R=Z[1/h!], §2.2 line 953 (algebraically closed, p>h) and Z_w as closure over the orbit of w⁻¹, Thm 2.2.1 p. 557 (convolution, CM, dualizing sheaf O_{Z_{sₙ}}(−ρ,ρ−αₙ)⋆…), Rem 2.2.2(2), (2.2.3), §2.3 Frobenius centre and Artin–Schreier map, Thm 2.4.1 (generalized character, regular λ), Prop 2.6.7 p. 565, Prop 2.8.1 p. 567, §2.10 lines 1575–1584 (f*f_*K→K surjective), Rem 2.11.1 p. 572, Prop 2.14.2 p. 574, Rem 2.14.3 and the SL(4) example p. 575 (16 locators; printed page = extraction page + 533). M23 — Thms 2.11, 2.21, Cor 2.22, Def 3.1, Defs 3.19/3.21, Props 3.22, 3.24, 3.25, 3.33, Def 3.28, Prop 3.30, §5.1, §6.1, Thm 6.20, Prop 6.24, §6.3, Prop 6.37, Def 6.40, Props 6.41, 6.42, Ex 6.55, Rems 6.56–6.57, Def 6.77, Thms 6.79, 6.83, Defs 7.25, 7.30, 7.32, Thm 7.33 (28 locators; printed page = extraction page − 6). G98 — Def 1.1.12 line 191 and the multiplicity convention (R02). ElliottBB — Thm 1 line 174, Def 3 line 227, Thm 2 line 234, Thm 3 line 270, §4 lines 275–312. EH18 — chapter convention line 1581, §4.3.1 line 1725, Def 4.10 line 1738 (p. 63).
- Checks tested with values: 58 (table above plus the Conventions block); none false, none vacuous. The Check at README.md:958 is stated on the O-module resolution [k[x]→k[x]] rather than [D→D]; both give cohomology in degree 1, so it is loose, not false.
- Sibling citations checked at the copies named in the brief: NilpotentOrbits N1 (cone χ⁻¹(0), flag variety, incidence scheme, G×ᴮ𝔫), N5.0 (reduced zero fibre, complete intersection, uses F4.3's Kostant section), N7 (Killing-form T*ℬ≃G×ᴮ𝔫, μ proper birational, scheme fibres); scope is adjoint semisimple over ℂ, so the field and central-factor adapters of §§6.1–6.3 are this roadmap's. ReductiveGroups Layers 2, 3 (fppf sheaf quotient G/H), 7, 8, 9, 10A, 10B, 11C, 11D all exist. SchubertGeometry S1 item 2 (standard and opposite cells over G/P⁻) and S2 item 3 (subword/Bruhat criterion) exist; "S2.3" denotes that item. AlgebraicVectorBundles L0A–L2B exist. SchemeAndStackFoundations §§0.4, 0.7–0.9, 0.16–0.21, 0.30, 1.1, 1.16 (contractedProduct with base change), 2.6, 2.18, 2.22 (Azumaya), 4.11 (*IsModification.isIso_of_isFinite*), 4.13, 5.1 (`cyclesOfDimension`, `CH_top_free`) exist and say what is cited. EnhancedDerivedSheaves §§0.1–0.4 (commutative coefficients), E1.3–E1.4. RepresentationTheory/LieHighestWeight Layers 3, 4, 7 (Harish-Chandra, dot action, central characters), 9 (reductive). DeformationAndDerivedPatchingAlgebra at its open head: §1.16 (localCompletionMap, flat, closed fibre k[[y]] example), §3.3 (module miracle flatness: A regular, M CM over B, dim Supp M=dim A+dim fibre support ⇒ A-flat), §3.4 (regular-sequence ideals, CI), §6.7 (moduleCycle D M, exact additivity, vanishing below D). FormalConnectionsOpers at its open head (another author's new folder): F2 item 2 (all-order operators, principal parts, Lie–Rinehart PBW under projectivity, gr D_X≅Sym T_X smooth char 0) and F4 item 3 (S(𝔤*)^G≃S(𝔥*)^W with descent to ℚ and flat base change to every char-0 field, homogeneous generators of degrees d_i+1, central factors, regular nilpotents one orbit with a unique containing Borel). 56 citations; none missing, none drifted.
- Library declarations at the pins (Mathlib 6b7abb3, Tau Ceti a91d3aa, files fetched at those commits): `AlgebraicCycle` is `Function.locallyFinsupp X R` (no grading, no rational equivalence) as stated; `IsFinite.of_isProper_of_locallyQuasiFinite` has exactly `[IsProper f] [LocallyQuasiFinite f]`; `Module.length : ℕ∞` and `Module.length_eq_add_of_exact` with injective, surjective and `Function.Exact` hypotheses; `FinitelyPresentedSheaf` is an `abbrev` of the finite-presentation full subcategory; `TauCeti.VermaModule` carries `[CharZero K] [IsKilling K L] [FiniteDimensional K L] [H.IsCartanSubalgebra] [IsTriangularizable K H L]` and a root base, as the README says; the sheaf tensor/dual files (`Dual.lean`, `Closed.lean`, `FiniteLocallyFree.lean`) exist. All 18 backticked names are library names; none is claimed as this roadmap's own.
- Ownership by object: `roadmaps grep` (index 2026-10-26) over main and the 367 open heads finds no other owner of "characteristic cycle", "Steinberg variety", "Grothendieck simultaneous", "Kazhdan–Lusztig polynomial" or "strongly equivariant"; "Springer resolution" only in NilpotentOrbits (cited) and two consumers; "Beilinson–Bernstein" hits are BBD or a reference entry; "D-module" hits in CrystallineCohomology are modules over its PD-ring D; "Weyl algebra" hits are the p-adic overconvergent algebra of a later roadmap. Separate board heads were not individually read beyond the index.
- Gaps: the four slugs, suppliers and `needs` sentences in `design/plan.json` are byte-identical to the README contract lines; each need carries its hypotheses; minimality checked for the two gaps above. No gap has supplier `none`.
- Dependency check, run from the board checkout with the brief's command: `depcheck: 56 roadmaps, 640 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. The package changes only its own folder (`git diff --stat origin/main...HEAD`: README.md, Suggested.lean, design/plan.json, metadata.toml, two reports, sources.toml).
- Policy: no `lemma`, no `set_option`, no pull-request numbers, no process narrative in the README or the docstring; every target has a locator; no computational algorithm. The arguments in §4.3 (scaling into the special fibre), §5.4 (codimension-one count) and §13.3 (faithful flatness of the completed Cartan map) were recomputed and hold.

## Not verifiable

- ElliottBB Theorem 3's sign convention (its condition λ(α∨)∉ℕ is called "dominant" while its ample bundles have negative pairings); the README fixes its parameters independently (Conventions, README.md:28), so nothing depends on it.
- BR12 Proposition 2.9.4 and Lemma 1.4.1(2), used inside §2.10 and §2.11, were not read; the README consumes only the stated results of §§2.6–2.11.
- Whether the slice form of §12.2 (R01) suffices for the board package TriangulineVarietyAndItsLocalModel, which the README names as a consumer of Layers 5, 13, 14 only; its text was not part of this brief.
- Ownership against open pull requests was checked through the roadmap index and `roadmaps grep`, not by reading every file of every open head.

## Source issues

- **Error** in BHS19 at Lemma 2.4.8 and Remark 2.4.9, printed p. 324: the source says the cycle of the simple module is stable under left multiplication by the standard parabolic P_w on the first flag; it should be stability of the slice over the base flag under P_w acting on the second flag and the operator (equivalently, under replacing the first flag by any flag with the same image in G/P_w); affects a stated result (fails for w=e, G=SL₂; the proof's second-factor equivariance claim is false because the induction identification conjugates P_w).
- **Error** in BHS19 at Lemma 2.3.2, printed p. 315: the source says a map from a Cohen–Macaulay to a regular Noetherian scheme with fibres equidimensional of dimension dim Y−dim Z is flat; it should assume the local equality dim O_{Y,y}=dim O_{Z,z}+dim O_{Y_z,y} at every point (Spec k⊔A¹→A¹ satisfies the stated hypotheses and is not flat); affects the proof (the applications to the irreducible X_w and the equidimensional X are unaffected).
- **Gap** in BHS19 at proof of Proposition 2.3.3, printed p. 316: the source says CM of the A-flat model with CM special fibre gives CM of the generic fibre; it should add that generic points not specializing into the special fibre are reached by the G_m-scaling of the operator (or use BR12 Remark 2.2.2(2)); affects the proof.
- **Misprint** in BHS19 at proof of Lemma 2.5.2, printed p. 326: the source says the generic point of the completed graph component lies in Spec of the completed local ring of X; it should be Spec of the completed local ring of T at the image point; affects nothing.
- **Misprint** in BHS19 at §2.1, printed p. 309: the source says the hypothesis "char 0 or char > Coxeter number" is the characteristic being good for G; it should say very good or simply p>h, since good characteristic is the weaker standard notion; affects nothing.
- **Error** in G98 at Definition 1.1.12 and Theorem 1.1.13, printed p. 5: the source says the multiplicity at a component is the rank of gr M tensored with the reduced component ring and that it is additive; it should be the length of gr M at the component's generic point (D/Dx² on the fibre x=0 has rank 1 but length 2, and additivity fails for 0→δ→D/Dx²→δ→0); affects a stated result.
- **Misprint** in ElliottBB at Theorem 3 and the following Claim, printed p. 9: the source says the condition λ(α∨)∉ℕ is "dominant" while using ample line bundles with negative pairings; it should fix one sign convention for λ and the twist; affects nothing here.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "02f336a", "job": "RT-SpringerResolutionAndCharacteristicCycles~1b", "model": "fable", "worker": "fable-rt212"} -->
