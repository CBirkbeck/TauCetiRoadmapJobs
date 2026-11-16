<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13092#issuecomment-6910518741 -->
Red team round 2 pass a (claude) of 41a4c27

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §6.1 compares with the universal family of the base §5.8 at every prime; that section assumes p ≥ 3

   Location: `packages/PadicLocalLanglandsForGL2QpPartII/README.md:1011` ("For absolutely irreducible ρ̄_B, prove its comparison with the universal family Π^univ of the base §5.8 taken for the residual representation ρ̄_B⊗ε̄⁻¹") and `README.md:86` ("§5.8: the universal family Π^univ for absolutely irreducible ρ̄").

   Claim: for every prime p and absolutely irreducible ρ̄_B the base §5.8 supplies Π^univ. Layer 6 opens with no hypothesis on p, and §6.1 has none (§6.4 has p > 2, §§6.5–6.6 have p > 3).

   Witness: PadicLocalLanglandsForGL2Qp §5.8 at its head: "Assume `p ≥ 3, End(ρ̄) = 𝔽, ρ̄ ≇ χ ⊗ (ε *; 0 1)` and `ρ̄ ≇ χ ⊗ (1 *; 0 ε)`". At p = 2 the family is not constructed there, so the comparison target of §6.1 has no object on its right side.

   Repair. In line 1011 replace "For absolutely irreducible ρ̄_B, prove" by "For p ≥ 3 and absolutely irreducible ρ̄_B (the hypotheses of the base §5.8, whose two reducible exclusions are then empty), prove". In line 86 replace "for absolutely irreducible ρ̄" by "for p ≥ 3 and absolutely irreducible ρ̄". Add to §6.1 the Check: "At p = 2 the base §5.8 constructs no universal family, so the comparison is not asserted; the three bulleted properties of Π*(ρ_(B,M)) are stated for every p." Tested on the refuting instance: at p = 2 the repaired sentence asserts nothing, and at p = 3 an absolutely irreducible ρ̄_B has End = 𝔽 and is no twist of an extension of characters, so the base §5.8 applies.

2. **F02** (P3) Layer 6 takes R_(B,M) and ρ_(B,M) "of the base §5.12" without the shift of §0.4(a)

   Location: `README.md:1001` ("The full-type ring R_(B,M), its integral image R⁺_(B,M) and its free rank-two family ρ_(B,M) are those of the base roadmap §5.12") and `README.md:87`.

   Claim: the base §5.12 objects indexed by M are the README's objects for the type M of Conventions.

   Witness: base §5.12 classifies points by "type `(M, a, b)` (potentially semistable with Hodge–Tate weights `a, b` and `D_pst ≅ M`)". README §0.3 has D_pst(V_(M,ℒ)) ≅ M[−1], and §6.1 Check (line 1023) wants fibres V_(M,ℒ_x). Read literally, the base ring at M has points with D_pst ≅ M, that is, the family of π⊗η∘det with η(p)² ∈ {p², p⁻²} (README line 252), whose LL^[0,1] has non-unitary central character and lies outside the hypothesis of the base §5.12. This is the class of 1b/F01, repaired in §§0.4, 2.4 and 7.2 only.

   Repair. After the first sentence of Layer 6 add: "In the base roadmap's indexing by D_pst these are R^[0,1]_(M°,B) and ρ^[0,1]_(M°) for M° = M[−1] (§0.4(a)); equivalently they are built from the smooth representation LL(M) = LL_p(M°), so that R_(B,M) = End_G(LL_B(M)) and the closed points are the V_(M,ℒ) with reduction in B." Add `§0.4` to the Dependencies of Layer 6 (it is already in the `*Needs:*` of §6.1). Tested: for LL(M) = π with trivial central character, LL^[0,1](M°) = π is unitary and the points have D_pst ≅ M[−1] = M(π), as §6.1 requires; with M in place of M° the central character at p would be p^(±2).

3. **F03** (P3) gap:fixed-radius-divisibility is cited for nontrivial central character, which its `needs` does not cover

   Location: `README.md:1205` ("On a supercuspidal sector ρ of any central character trivial on p, use §3.3(i) to identify O(Σ_n)^ρ with a dual on which ∩_j(u⁺)^j is zero (gap:fixed-radius-divisibility in the base §6.9)").

   Claim: the gap supplies ∩_j(u⁺)^j = 0 on (Π^an_(M,ℒ)/LL(M))′_b for every central character ζ with ζ(p) = 1.

   Witness: the gap (README line 91, `design/plan.json`) is "the vanishing of ∩_(j≥0)(u⁺)^j Π(π,0)′_b … in §6.9", and the base §6.9 at its head is stated for "`π` … supercuspidal … with trivial central character". For ζ = ω at p = 7 (README line 575) the statement is in neither the gap nor a target; §3.3 only says that it "reruns the base §6.9".

   Repair. In §3.3, after "That needs three inputs:", add a fourth bullet: "the vanishing of ∩_j(u⁺)^j on (Π^an_(M,ℒ)/π)′_b for general ζ, proved here by the fixed-radius argument of gap:fixed-radius-divisibility applied to tN_rig(V_(M,ℒ))⊠ℙ¹ on both charts; the argument uses u⁺ = t on the ℤ_p-chart and the Weyl element, and not the central character." In line 1205 replace the parenthesis by "(for trivial central character, the base §6.9 with gap:fixed-radius-divisibility; in general, the rerun of §3.3)". Tested on ζ = ω at p = 7: the vanishing is then a stated part of §3.3, and the gap keeps its declared scope.

4. **F04** (P3) §3.3(ii) writes O[M] for the L-rational space; Layer 4 defines O[M] as the C-valued one; §7.5 uses an undeclared index

   Location: `README.md:553` ("this gives the exact sequences 0 → O[M] → (Π^an_(M,ℒ))′_b → π′_b → 0") against `README.md:596` ("Write O[M] … for the JL(M)-multiplicity spaces of L⊗O(M^p_(n,C)) … Write O[M]^(G_ℚ_p) … the L-rational spaces"). `README.md:1203` ("A function f ∈ O(Σ_n)").

   Witness: with the Layer 4 meaning, the sequence of line 553 has a C-vector space as kernel of a map of L-representations of countable type; §4.12 (line 810) writes the same sequence correctly with Ω¹[M]^(G_ℚ_p). In §7.5, n is the DLB level (Σ_n = M^p_(2n), Conventions), while "fix n" of Layer 4 and §3.3(i), which the route invokes, use the CDN level; Layer 7's opening excludes §7.5 from its conventions and declares no index for it.

   Repair. In line 553 replace "0 → O[M] →" by "0 → (L⊗O(M^p_n))[M] →". In §7.5 replace the first sentence by "For n ≥ 0 let Σ_n be the cover of DLB level n (Σ_n = M^p_(2n) for n ≥ 1, Conventions). A function f ∈ O(Σ_n) is infinitely primitivable when it lies in ∩_(j≥0) (d/dz)^j O(Σ_n)." and in its first route bullet write "use §3.3(i) at CDN level 2n".

5. **F05** (P3) §7.3 asserts that Teitelbaum's model is "the minimal semistable model" with no locator or route

   Location: `README.md:1171` ("It is the minimal semistable model, so the actions of G, Ǧ and Gal(K/ℚ_p) through the descent datum extend to it").

   Witness: TEI90 lines 256–259 speak of a minimal regular model over the unramified base, obtained by blowing up and with no component of multiplicity one; TEI90 lines 260–267 extend only the action of PGL₂(ℚ_p). Neither supports minimality over O_K or the extension of the Ǧ- and Galois actions. The supplier's route is CDN20 Proposition A.1 (line 2227), which extends the automorphisms to the model whose quotient is the stable model of the uniformised curve.

   Repair. Replace the sentence by: "Its irreducible components are the curves y′^(p+1) = ζ(z−z^p) of the Check below, of genus p(p−1)/2 ≥ 1, so no component is rational; hence the quotients Γ_i\Σ̂ are the stable models of the components of the Shimura curve, and Σ̂ is the model of ProetaleCohomologyOfPAdicCurvesAndTowers §7.2 at n = 1 (CDN20 Proposition A.1, line 2227), to which G, Ǧ and the descent datum extend. Prove this identification here." Value used: y^(p+1) = z − z^p is a cyclic cover of degree p+1 of the line, totally ramified over the p points of 𝔽_p and over ∞, so 2g−2 = −2(p+1) + (p+1)p and g = p(p−1)/2, equal to 1 at p = 2 and 3 at p = 3.

Round 2. One P2 finding (S01) and four P3 findings (S02–S05). All fourteen findings of round 1 are repaired at this head and no repair introduced an error. No finding re-raises a settled one: the repair report marks nothing `not actionable in this package`.

Read in full: `packages/PadicLocalLanglandsForGL2QpPartII/README.md` (1295 lines, 51 numbered subsections) and `packages/PadicLocalLanglandsForGL2QpPartII/Suggested.lean` (79 lines, no declaration).

## Round 1 findings at this head

| Id | Status | Repaired passage (quoted) and witness |
|---|---|---|
| 1a/F01 (gap asks for what R16.2.10 states) | repaired | README line 145: "What GL2AutomorphicRepresentationsAndTransfer must provide (gap:cuspidal-projectivity-coefficients): in R16.2.10, the form with coefficients in a field of characteristic zero". `design/plan.json` has the same slug, supplier and section. R16.2.10 exists at the supplier's head, states the complex fixed-ω projectivity and says "The L-coefficient comparison needs scalar descent". Supplier is line 101 of `merge-order/ORDER.txt`, this roadmap line 383. |
| 1a/F02, 1b/F03 (no smooth vectors in Π^an/π unowned) | repaired | README line 441: "Prove also that Π(V)^an/π has no nonzero smooth vector for V in the family of π, and that Π^an_(M,ℒ)/LL(M) has none". Route recomputed (table, row §2.3). `*Needs:*` of §§2.3, 3.1, 3.3 updated. DLB17 line 1207 confirmed as "exercice". |
| 1a/F03 (1+p⁰ℤ_p ⊄ Γ) | repaired | README line 1190: "∫_(Γ_m)μ ∈ H¹_e(G_(ℚ_p(μ_(p^m))), V) for every m ≥ 1 … Here Γ_m = 1+p^mℤ_p ⊂ Γ, so that Γ_1 = Γ at p = 2". DLB17 lines 431–443 print n ≥ 0. |
| 1a/F04 (§1.7 inclusion and m(V)) | repaired | README line 372: "prove first that Π(V)_c^P-fin ⊂ Π(V)^an … there is an index m(V) such that every element z of the image … has Res_ℤ_p(z) and Res_ℤ_p(wz) in D^(]0,r_m(V)])(V̌)". DLB17 lines 1572–1576, 1581. |
| 1a/F05 (X_st(M) undefined) | repaired | README line 697: "put X_st(M) = (B_st⊗_(ℚ_p^nr)M)^(N=0, φ=p) (CDN20 line 860). Since N = 0 on M, it equals (B_cris⊗_(ℚ_p^nr)M)^(φ=p) and contains X⁺_st(M)". CDN20 line 860. |
| 1a/F06 (lim against colim) | repaired | README line 313: "D⁻_dif(V) = colim_n D⁺_dif,n[1/t]/D⁺_dif,n"; line 333 has the same colimit. |
| 1a/F07 (Conjecture 0.10 normalisation) | repaired | README line 1156: "The source twists the natural action on functions on the right … takes the multiplicity of JL(M)* and prints the twist as x⁻²; here the action is the left one". Centre Check at line 1162 recomputed (table). |
| 1a/F08 (ρ-sector of D(G)-modules) | repaired | README line 1218: "the abelian category 𝒞_G of coadmissible D(G,L)-modules of LocallyAnalyticRepresentationsOfLocalGroups §1.1". That section exists under the cited title and states the abelian full subcategory. Supplier is line 253 of the merge order. |
| 1a/F09 (Summary named by source sections) | repaired | README line 7: "the weighted realisation with its BGG row (§7.2) and its first-cover form on Teitelbaum's semistable model (§7.3) …". |
| 1b/F01 (M against M[−1]) | repaired | README line 241: "so M ≅ M(π)[1] … LL(M) = LL_p(M[−1])"; line 455: "M° = M[−1] its module in Colmez's normalisation"; line 1156: "Colmez's objects for M° = M[−1]". Not carried into Layer 6: see S02. |
| 1b/F02 (∂ bijective handed to a circular supplier step) | repaired | README line 282: "Injectivity: choose h with t^hN_rig(V) ⊂ D_rig(V); then (∇−h)(t^hx) = t^(h+1)∂x … Surjectivity: V̌ is again absolutely irreducible". §RD.2.43 step 4 at the supplier's head still quotes DLB Lemma 6.3; the README no longer uses that step. |
| 1b/F04 (central character in §4.10(c)) | repaired | README line 771: "(c) If Π is admissible unitary of finite length with a central character". Base §2.5 at its head: "in the admissible finite-length unitary category with central character". |
| 1b/F05 (two vacuous Checks) | repaired | README line 668: "H_C(V) = (C(−1)⊗_ℚ_p L)^(G_F) = 0 by Tate's theorem"; line 1241: "It is not surjective: Σ_r being Stein, its cokernel is the ρ-part of H¹_c(Σ_r, O)". DLB17 lines 2861–2865 and 2880. |

New errors from the repairs: none found. The new proof of §2.3, the corestriction step of §7.4, the coadmissibility of Ω¹(Σ_r)^ρ in §7.6 and the splitting argument of §3.3(iii) were recomputed (table below).

## Dependency check

    depcheck: 253 roadmaps, 2409 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. Overlaps: none listed; the closest roadmap is the base roadmap (score 0.58), whose §6.9 was read in full against the Scope section: no object is owned twice.

## The pass (values computed this round)

`Suggested.lean` declares nothing, so its row set is empty: no section, variable or instance context exists. The `#check` comparison of elaborated types was not run for that reason and nothing changed. Rows are the README's bold targets and conventions.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Conventions, Lie action | u(b), diag(e^s,1), diag(1,e^s), lower c | −f′; −zf′; zf′; z²f′ | holds | none |
| §0.1 ΦNᵖ, special | δ(p) = −1; χ(p) = 1+p | Nrd(p) = p²: 1; (1+p)² ≠ 1 | holds | none |
| §0.2 type sum | irreducibles of Ǧ/(p^ℤK_D(n)) | dim 1: δ∘Nrd, δ(p)² = 1; dim ≥ 2: JL of supercuspidal with p trivial | holds | none |
| §0.3 shift | ℚ_p(1); V_(M,ℒ) | φ = p⁻¹; slopes of M[−1]: −1/2, t_N = −1 = t_H for jumps −1, 0 | holds | none |
| §0.4(a) | trivial ζ | LL_p(M) = π⊗η∘det, η(p)² = p^(±2) ≠ 1 | holds | none |
| §1.1 sandwich | jumps (−1,0); (0,1) | tN⁺+ℒ[[t]]; N⁺+t⁻¹ℒ[[t]] ⊄ N⁺ | holds | none |
| §1.2 injectivity | h = 1; rank-one trivial | (∇−h)(t^hx) = t^h∇x = t^(h+1)∂x; ∇1 = 0 | holds | none |
| §1.3 third bullet | b = p⁻¹, m = 1, N = 2, k = 1 | S(1−u(c₀)) = (1−u(p^N))Σ_(i<c₀)u(i); 1−u(p^Nc₁) = −Σ_(j≥1)binom(c₁,j)(u(p^N)−1)^j; shell sum p·Σζ_p^(iu) = 0 | holds | none |
| §1.3 P-finiteness of (1−u(b))^k v | b of valuation −s | span of u(c)(u(pⁿ)−1)^j v, c mod pⁿ in p⁻ˢℤ_p, j < k: finite | holds | none |
| §1.5 gl₂ | weights (0,1) | ∇(∇−1) = t²∂², u⁻ = −t∂²; [u⁺,u⁻] = 2∇ = a⁺−a⁻; Casimir 0 | holds | none |
| §1.5 against §2.2 | ∂ on tN_rig | ∂ = ∇t⁻¹: ∂u⁺ = ∇ = a⁺; −∂²u⁺ = −t⁻¹(∇−1)∇ = u⁻; [∂,u⁺] = ∇−(∇−1) = 1 | agree | none |
| §1.7 unipotent-fixed | bx ∈ ℤ_p; bx = p⁻¹ | tφ(x) = 0; (ζ_p−1)φ(x) = 0 | holds | none |
| §1.7 Check | φ_v(1) = t⁻²e | (e^(tp^N)−1)t⁻²e ≡ p^Nt⁻¹e ≠ 0 | holds | none |
| §2.2 | w; u(b) | (−1)(−∂)⁻¹ = ∂⁻¹, −∂²u⁺f = z²f′ = wu⁺wf; ∂−b | holds | none |
| §2.3 smooth vectors | Q smooth | u⁺Π^an ⊂ π, (u⁺)² = 0, Res∘(u⁺)² = t²Res, t injective: Res z = Res wz = 0 | holds | none |
| §2.4 central characters | k; trivial ζ | Π(M,k)′⊗x^kω: (x^kω)⁻¹(x^kω)² = x^kω; Π(M,−k)⊗x^k: x^kω; ω = x⁻¹, det Δ(p) = p⁻¹ | holds | none |
| §2.4 against COLMEZ19POIDS | Théorèmes 0.6, 0.8 | lines 223, 225, 230–236, 264, 270 give the same sequences and (−c∂+a)^k | holds | none |
| §3.1 O(k) | cocycle; Lie derivatives | a′(a−cz)−c′(dz−b) = (aa′+bc′)−(ca′+dc′)z; a⁺ = −zf′−kf = (u⁺∂+1−k)f; u⁻ = z²f′+kzf | holds | none |
| §3.1 Ω¹ dual | O(2)⊗det | a⁺ = ∂U, a⁻ = −U∂−1 = −∂U with [∂,U] = 1, U the dual u⁺ | holds | none |
| §3.1 p-valuation of the contract | p odd, i ≥ 1; p = 2, i ≥ 2 | ω ≥ 1 > 1/(p−1), ω ≥ 2 > 1; commutator: −i+1 ≤ 0, −i+2 ≤ 0; ω > p/(p−1) gives v ≥ i+1, G_(i+1) = G_i^p | (HYP) holds | none |
| §3.3(iii) splitting | kernel K ≠ 0 of Φ_i | K ∩ π^⊥ = 0, K → π′ strict, K ≅ π′, Π^an = π⊕X, completion π̂⊕X̂ reducible | holds | none |
| §4.2, §§4.12–4.14 special | (a,a) in G×Ǧ | δ(a²)⁻¹·δ(a²) = 1; other δ′: Hom ≠ 0 only for δ′ = δ | holds | none |
| §4.5 | V = V_(M,ℒ) | C⊗V^∨ = C⊕C(−1): H_C a line; H_M a line with image ℒ⊗H_C | holds | none |
| §4.6 (i) | shift | φ_D f = f(pφ_(M*)): source M*[1] = M[−1]* | holds | none |
| §4.10 Check | ℓ = ⟨δ_∞−δ₀, u⁺·⟩ | ℓ(f) = f′(0); gℓ = p^mℓ; ‖F_m‖ = p⁻ᵐ, \|ℓ(F_m)\| = p^m | holds | none |
| §6.1 | p = 2, 3; ε-twist | base §5.8 needs p ≥ 3; central characters det ρ_x·ε against det ρ_x·ε⁻¹ | fails at p = 2 | S01 |
| Layer 6 index | M against M[−1] | base §5.12 points have D_pst ≅ its M | ambiguous | S02 |
| §6.2 Check | χ of order 3 at p = 7 | η(a²)ζ₃² on the source, η(a²)⁻¹ζ₃ on the dual and on the twisted dual | holds | none |
| §6.3 | PID with infinitely many primes; DVR; field | H of rank ≤ 1 and saturated; traces differ only in finitely many maximal ideals; rank-one idempotent has traces 1 and 0 | holds | none |
| §6.6 Check | A = L⟨T⟩ | left shift onto, kernel L·ev₀: Ǎ/TǍ = 0, Ǎ[T] = L | holds | none |
| §7.1 | u⁺: E_π → E_π[2]⊗det | det g(a−c∂)⁻²·det g⁻¹(a−c∂)²u⁺g = u⁺g | equivariant | none |
| §7.2 row | (u⁺)^(k+1) | ((a−c∂)²u⁺)^(k+1) = (a−c∂)^(k+2)(u⁺)^(k+1)(a−c∂)^k; centre a^k on all three terms | holds | none |
| §7.2 identification | s = 0, s = −k, s = k+2 | Π(M,−1)′⊗det⁻¹ = E_π; (Π(M,−k−1)⊗x^(k+1))′⊗det^k = Π(M,−k−1)′⊗det⁻¹; centre a⁻ˢζ⁻¹ both sides | holds | none |
| §7.3 Check | y = ϖ_Ky′ | y′^(p²−1)+(z−z^p)^(p−1) = ∏_(ζ^(p−1)=−1)(y′^(p+1)−ζ(z−z^p)); genus p(p−1)/2 | holds | S05 |
| §7.4 | m = 0; p = 2 | ℤ_p ⊄ Γ; Γ_1 = Γ; ∫_Γ = cores∘∫_(Γ_1) | holds | none |
| §7.5 | f = (1,−1) over ℚ_p²; ζ = ω at p = 7 | primitives (z^j/j!, −z^j/j!); vanishing of ∩(u⁺)^j outside the gap's scope | holds; ownership | S03 |
| §7.6 | degree-0 Hom | Hom((Π^an)′, M*_dR⊗π′) = M*_dR, dimension 2; F⁰-part a line | holds | none |
| §7.7 Check | U = ℙ¹(ℚ_p) | cokernel H¹_c(O)^ρ = (Ω¹(Σ_r)^(ρ^∨))′ = (Ω¹(Σ_r)^ρ)′ ≠ 0 | holds | none |

## Verified sound

- Declarations read: 0. The module docstring (lines 3–75) was read in full; its ten bullets match README §§4.14, 4.12–4.13, 6.6, 3.3, 3.1, 2.3–2.4, 7.2–7.3, 7.4, 7.5, 7.6, and it has the required form (title, "the roadmap is `README.md`", the carriers each headline lacks). Single `import Mathlib`, the namespace, no `sorry`, no `set_option`.
- Headline theorems (README Summary): the Galois-socle theorem §4.14, the factorisation §6.6, and §§7.2–7.6. None is statable at the pins: the pinned Tau Ceti has no Robba ring, no (φ,Γ)-module, no Banach or locally analytic representation of GL₂(ℚ_p), no Weil–Deligne type and no Drinfeld cover (grep by object; its only hit for "LocallyAnalytic" is `TauCeti/NumberTheory/Padics/Distribution/LocallyAnalytic.lean`, functions and distributions on ℤ_p). Each is named in the docstring with what it lacks. §§4.3 and 6.3 are statable linear algebra but auxiliary; their absence is correct. No padding: the file declares nothing.
- Targets read: 51 numbered subsections, the Conventions, the supplier contracts and the 25 source corrections.
- Pinned declarations checked (7): `Bornology.IsVonNBounded` (Bounded.lean:61), `NormedSpace.image_isVonNBounded_iff` (Bounded.lean:495), `WithSeminorms.isVonNBounded_iff_seminorm_bounded` (WithSeminorms.lean:659), `WithSeminorms.image_isVonNBounded_iff_seminorm_bounded` (WithSeminorms.lean:679), `WithSeminorms.banach_steinhaus` (Barrelled.lean:164, a protected theorem in that namespace), `DerivedCategory` (DerivedCategory/Basic.lean:87) with `HasDerivedCategory` (line 74), `Mathlib/RingTheory/Perfectoid/BDeRham.lean`.
- Locators verified against the cached texts this round (28): DLB17 lines 431–443, 447, 1198–1209, 1565–1569, 1572–1576, 1581–1586, 2718–2725, 2810–2822, 2856–2865, 2871, 2876–2880; CDN20 lines 857–858, 859–862, 2227, 2247–2254; CDN23 lines 2378–2386, 2396, 2606–2612; COLMEZ19POIDS lines 146–154, 161–166, 177–180, 203–211, 215–236, 237–251, 262–271, 310–332, 333–340; TEI90 lines 251–259, 260–267.
- Checks tested by computation: 38 rows above, covering 61 Checks.
- Sibling citations checked at the cited heads, statement read (17): PadicLocalLanglandsForGL2Qp §§2.5, 3.11, 4.2a, 4.9, 4.11, 5.6, 5.8, 5.12, 6.9; GL2AutomorphicRepresentationsAndTransfer R16.2.10; LocallyAnalyticRepresentationsOfLocalGroups §1.1; PadicDifferentialEquationsAndRigidCohomology §RD.2.43; CompletedCohomologyAndLocalGlobalCompatibility §6.4; headings resolved for §§1.7, 3.8, 4.1k, 6.7 of the base and §§2.7, 4.9, 6.3 of CompletedCohomologyAndLocalGlobalCompatibility.
- Declared gaps: the four slugs of `design/plan.json` are the four of the README, each under its supplier's subsection with a named supplier and section. Not raised. S03 concerns a citation of one of them outside its scope, not the gap.
- Ownership: PadicLocalLanglandsForGL2Qp, ProetaleCohomologyOfPAdicCurvesAndTowers and TriangulineVarietyAndItsLocalModel name this roadmap for §§3.1, 3.3, 7.1–7.5 uses and §1.2; none consumes a target of it, so "No roadmap cites this one as a supplier" holds in the sense of supply. No fully qualified name can clash: the Lean file declares none.
- Policy: `git diff --stat origin/main...HEAD` changes only the package folder. No pull-request number, process narrative, `lemma` declaration or `set_option` in the README or the docstring ("lemma" occurs only as the word in "Schur's lemma" and in references to source lemmas). Every target carries a locator.

## Not verifiable

- That the fibre of the base §5.8 family at x is Π(ρ_x(ε)) in the normalisation of §6.1: the base section states V̌(π*) ≅ MF(π)(ε); the translation to Colmez's Π(·) was not recomputed.
- CDN20 Remarque A.2 (line 2247) as used in §4.9: the source's proof uses properness of the components of the special fibre; that the models of ProetaleCohomologyOfPAdicCurvesAndTowers §7.2 have proper components was not checked there.
- §7.2, the identification O(s)(Σ_r)^ρ ≅ Π(M,s−1)′_b⊗det⁻¹ for every s ∈ ℤ: COLMEZ19POIDS Remarque 0.11(iii) (lines 337–340) says the case k ≥ 0 follows; the central characters and the three values s = 0, −k, k+2 used by the row agree, the general s was not derived.
- The remaining locators (about 210 line references) were not reopened this round; the 28 opened all matched.
- Source corrections E1, E5–E9, E12, E13 (complement step), E16, E17, E21, E23: the locators exist; whether each step fails in the source was not re-derived.
- The existence statements behind gap:three-period-line-globalisation and gap:continuous-galois-tensor-comparison: declared gaps, not examined for truth.
- No Lean was run: the brief allows none, and there is no declaration to elaborate.

## Source issues

- **Error** in DLB17 at Proposition 7.7(b), arXiv v2 line 1568: the source says the orthogonal of the dual unfiltered lattice is t^k times the lattice for weights 0 and k; it should be t times it for every k ≥ 1; affects a stated result.
- **Misprint** in DLB17 at Théorème 1.9, arXiv v2 lines 431–443: the source says the integration domains are 1+pⁿℤ_p for every n ≥ 0, with one letter for the cover and cyclotomic levels; it should be Γ at level zero, with two indices; affects nothing.
- **Error** in DLB17 at Théorème 1.10, arXiv v2 line 447: the source says infinitely primitivable functions on a cover are functions on the half-plane; it should allow locally constant coefficients on the components; affects a stated result.
- **Gap** in DLB17 at the proof of Théorème 5.1, arXiv v2 line 1207: the source says the analytic quotient has no nonzero smooth vector and leaves it as an exercise; it should be derived from irreducibility of the quotient and injectivity of t; affects the proof.
- **Gap** in CDN23 at Lemme 5.3(c), HAL copy lines 2385–2386: the source says the statement holds for every admissible unitary representation of finite length; it should carry the central-character hypothesis of the theorem its proof quotes; affects nothing.
- **Misprint** in COLMEZ19POIDS at Remarque 0.2(ii), author's copy lines 161–166: the source says the quotient of Π(Δ) by its algebraic vectors is Π(M,−k); it should be Π(M,−k) twisted by x^k, as its Théorème 0.6(iii) states; affects nothing.
- **Misprint** in COLMEZ19POIDS at the paragraph before Conjecture 0.10 and Remarque 0.11(i), author's copy lines 321 and 333: the source says the k-th derivative maps weight −k to weight k+2; it should be the (k+1)-st derivative; affects nothing.

Source independence: 16 passages compared with 5 sources (DLB17 lines 431–443, 1198–1209, 1572–1586, 2718–2725, 2810–2822, 2861–2880; CDN20 lines 857–862, 2247–2254; CDN23 lines 2378–2396, 2606–2612; COLMEZ19POIDS lines 153–166, 177–180, 203–211, 215–236, 262–271, 310–340; TEI90 lines 251–259), none shared beyond formulas, theorem statements and one three-step construction that the mathematics fixes (README §6.1 against CDN23 lines 2609–2612); largest share DLB17, 115 of 246 source mentions; contents compared with DLB17 (sections 3–12): independent. Layer 1 draws on its sections 6–7, Layer 2 on 8–9 with COLMEZ19POIDS, Layer 3 on 3, 4, 5 and 11 after them, Layer 7 on Remarque 11.12 and section 12 with TEI90, Layers 4–6 on CDN20 and CDN23; section 10 belongs to the base roadmap. No run of layers maps one to one, in order and scope, onto a run of sections, and Layer 1 before Layer 2 is forced by the `*Needs:*` line of §2.1 (§§1.1, 1.2, 1.6, 1.7). Reuse: no table, figure or list is taken over.

## For the human reviewers

- **Licence.** `sources.toml` records CDN20 and COLMEZ19POIDS as `author-page` copies, not the journal versions; the README's line locators refer to those copies.
- **Not tested.** TEI90 is an OCR of a Numdam scan; its display at line 255 is partly illegible, so the equation of §7.3 was checked against DLB17's recollection and by computation only.
- **Scope.** The four main sources are refereed articles (2017–2023). The README records 25 corrections to them; E2, E10, E15 and E21 change a stated result or need a new global input declared as a gap.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "41a4c272264bf29097e6dd5b125c5600f1493657", "job": "RT-PadicLocalLanglandsForGL2QpPartII~2a", "model": "fable", "worker": "chris-x55"} -->
