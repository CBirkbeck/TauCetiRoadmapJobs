<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1205#issuecomment-6402883167 -->
Red team round 1 pass b (claude) of 73538ce

Verdict: needs_changes

1. **F01** (P2) The modified adelic carrier is attributed to a HeightsRationalPointsAndObstructions section that does not build it

   Location: `packages/GaloisSectionsPadicPeriodMaps/README.md:65` ("Section 3.17d supplies the modified adelic carrier and its projection, replacing the archimedean factors by connected components"), `README.md:237` ("Use the modified adelic points of HeightsRationalPointsAndObstructions §3.17d, `X(A_K)_• = …`, with the projection"), `README.md:9` (Scope: "the modified archimedean quotient belong[s] to HeightsRationalPointsAndObstructions §§2.3–2.4, 3.1–3.5 and 3.17d"), and the `*Needs:*` line at `README.md:261`.

   Claim: HeightsRationalPointsAndObstructions §3.17d supplies, for a smooth projective geometrically connected X over a number field, the carrier X(A_K)_• = ∏_{u finite} X(K_u) × ∏_{u|∞} π₀(X(K_u)) and the projection X(A_K) → X(A_K)_•.

   Witness: at the open head of HeightsRationalPointsAndObstructions, §3.17d is "Multiplication covers and Pic⁰ obstruction"; its only mention of the notion is the clause "own `nCoverSet_eq_BrauerPic0_n` on modified adeles (archimedean factors replaced by components), or its inverse image on ordinary adeles", stated for an A-torsor X and n>0. No section of that roadmap defines the carrier for a general X, its projection, or any API (the only other hit for the notion is that clause; a search for "modified adel", "archimedean factors", "connected component", "π₀" over the whole README finds nothing else). The carrier is therefore unowned while §0.4, §0.5(b) and Theorem B (§9.5) are stated on it.

   Repair: in §0.4 make the carrier this roadmap's own target. Replace the sentence at `README.md:237` beginning "Use the modified adelic points of HeightsRationalPointsAndObstructions §3.17d" by: "Define the modified adelic points `X(A_K)_• := ∏_{u finite} X(K_u) × ∏_{u|∞} π₀(X(K_u))`, with π₀ the quotient `ConnectedComponents` of the archimedean point set in its analytic topology, and the projection `X(A_K) → X(A_K)_•` that replaces each archimedean component by its connected component; it is surjective and natural in X." Add to the §0.4 API list: "`X(A_K)_•` and the projection `X(A_K) → X(A_K)_•`, surjective, with `(f(P))_• = f_•(P_•)` for a K-morphism f." At `README.md:65` replace "Section 3.17d supplies the modified adelic carrier and its projection, replacing the archimedean factors by connected components. Its finite-cover locus and the global-section equivalence are constructed here." by "The modified adelic carrier, its projection, its finite-cover locus and the global-section equivalence are constructed here (§0.4)." At `README.md:9` delete " and 3.17d" and change "the modified archimedean quotient belong to" to "belong to"; at `README.md:261` and `README.md:287` delete "3.17d". (Alternative: declare `gap:modified-adelic-points` with supplier HeightsRationalPointsAndObstructions §3.17d in `design/plan.json` and the README; owning it here is the smaller change, since the construction is a product of sets and the README already owns the locus on it.) Tested on the instance that refuted the original: for an elliptic curve E/ℚ with two real components, the carrier's archimedean factor has exactly two elements and the projection identifies points in one component (the §0.4 Check at `README.md:257`), with no input from the A-torsor theorem of §3.17d.

2. **F02** (P3) The root-degree bound B = 2d_iδ in §7.1 presumes constant relative dimension, which §7.1's setting does not assume

   Location: `packages/GaloisSectionsPadicPeriodMaps/README.md:1127` ("every Frobenius eigenvalue there being an algebraic integer of degree over ℚ at most B=2d_iδ") and `README.md:1137` ("whose monic polynomial in ℤ[X] has degree 2d_iδ").

   Claim: in the setting of §5.4 (any abelian-by-finite family over a smooth K_v-variety, with d_i := dim X_{y′_i} allowed to depend on the component), the fibre eigenvalues of an S-good pair of total algebra dimension δ have degree over ℚ at most 2d_iδ.

   Witness: take Y′ = Y ⊔ Y (δ = 2) with X → Y′ of relative dimension 1 over the first copy and 2 over the second, an abelian-by-finite family in the sense of MordellLawrenceVenkatesh §2.1 (no constancy is imposed there). Then dim_{ℚₚ} V = 2·1 + 2·2 = 6 while B = 2·d_1·δ = 4 for the first component, so an eigenvalue of degree 5 or 6 on the fibre V_ψ is not excluded by the integer polynomial of V, and the enlarged T_1 need not contain that fibre class, contradicting `README.md:1133`.

   Repair: at `README.md:1127` replace "In the setting of §5.4, with S suitable, let d_i := dim `X_{y′_i}` (the relative dimension) and δ := deg(Y′ → Y)." by "In the setting of §5.4, for a family of constant relative dimension d > 0 (as in §6.9), with S suitable, let d_i := d and δ := deg(Y′ → Y)." and at `README.md:1127`, `README.md:1133`, `README.md:1137`, `README.md:1161` replace "2d_iδ" by "2dδ = dim_{ℚₚ}V". Tested on the refuting instance: with constant d the total dimension is 2dδ and every fibre eigenvalue is a power of a root of a degree-2dδ polynomial in ℤ[X], so its degree is at most 2dδ.

3. **F03** (P3) HeightsRationalPointsAndObstructions §2.3a is a function-field section, cited for number-field compactness

   Location: `packages/GaloisSectionsPadicPeriodMaps/README.md:65` ("§§2.3a and 2.11 supply the proper local-point compactness and product topology") and `README.md:988` (§6.3 `*Needs:*` "§§2.3a, 2.11, proper local-point compactness and product topology").

   Claim: §2.3a supplies compactness of X(K_v) and the product description of adelic points for proper X over a number field.

   Witness: at the open head, §2.3a is "Function-field models and products of local rings", whose first sentence fixes "global function field K with exact finite constants k"; the number-field product and compactness statements are §2.4 (`restrictedProductHomeomorph`) and §2.11 (`homeomorph_pi_of_proper`, Check "proper P¹ the full compact product").

   Repair: at `README.md:65` replace "§§2.3a and 2.11 supply the proper local-point compactness and product topology" by "§§2.4 and 2.11 supply the proper local-point compactness and product topology"; at `README.md:988` replace "§§2.3a, 2.11" by "§§2.4, 2.11". Tested on the instance: P¹ over a number field, where §2.11's Check gives the full compact product directly.

## Verified sound

Counts: Suggested.lean declarations read: 0 (the file states nothing and names 14 non-statable headlines in its docstring); README sections read: 59 numbered targets plus Conventions, supplier contracts and all Examples and Dependencies blocks, every line; Betts–Stix locators verified against `bs` text: 57 (Theorems A, B, 2.9, 3.3, 3.22, 6.5, 7.1; Definitions 1.1, 1.2, 1.7, 2.1, 2.6, 2.7, 2.13, 2.17, 3.1, 4.3, 4.4, 4.10, 6.1, 6.2, 6.8, 6.11; Propositions 1.8, 2.16, 2.19, 3.5, 4.11, 6.7, 6.9, 6.15, 6.20, 7.2; Lemmas 2.15, 3.23, 4.2, 4.12, 6.4, 6.12, 6.13, 6.17; Sublemma 6.18; Corollaries 2.21, 6.10, 6.16, 6.22; Remarks 1.3, 1.4, 1.5, 1.9, 2.14, 2.18, 2.20, 3.4, 6.3, 6.6, 6.14, 6.19, 6.21, 6.23; §7.1; footnotes 6, 7, 8, 17, 20–24); other-source locators verified: Harari–Stix Theorem 2.1 with Remarks (1)–(4) and Propositions 1.1–1.2 (`hs` lines 155, 391, 416, 442), Stix Theorem 45 and Remark 46 (`stix08` lines 1109–1116), Stoll §2, Definitions 5.2, 5.4, Lemma 5.8, Proposition 5.9, Conjecture 9.1 (`stoll` lines 127, 552, 633, 759, 778, 1536); Checks recomputed: 46 (table below); supplier citations resolved at main or the open heads: 31 sections or layers across 22 roadmaps; pinned declarations located: 15 (`Field.absoluteGaloisGroup`, `Field.absoluteGaloisGroup.map`, `ContinuousMonoidHom`, `ConnectedComponents` in `Mathlib/Topology/Connected/Clopen.lean`, `IsDedekindDomain.HeightOneSpectrum.adicCompletion`, `LinearMap.IsAlt`, `LinearMap.Nondegenerate`, `Matrix.symplecticGroup`, `NumberField.IsCMField`, `NumberField.IsCMField.ringOfIntegersComplexConj`, `IntermediateField`, `MulAction.orbit`, `Nat.forall_exists_prime_gt_and_eq_mod`, `hasSum_zeta_four`, `TauCeti.Symplectic.groupScheme`), all at the stated files.

Dependency direction. Output of the gate:

```
depcheck: 56 roadmaps, 647 edges, 0 problem(s)
```

Every cited roadmap is earlier in `merge-order/ORDER.txt` (AnabelianGeometryAndNonabelianChabauty at 198, CohomologyComparisons at 207, this roadmap at 208) or on main (ClassFieldTheory, GlobalNumberFields, LocalFieldsRamification, LocalGaloisGroups, ReductiveGroups, Chebotarev, AdicEtaleGeometry, AdicSpacesPartII). `roadmaps resolve` reports no missing cross-roadmap citation and no missing Lean name.

Headlines and Suggested.lean. The 14 headlines listed in the module docstring all need étale fundamental groups of schemes, section classes, abelian-by-finite families, p-adic Galois representations or filtered (φ,N,G_v)-modules; none of these exists at the pins (Mathlib has `CategoryTheory.Galois` and `Field.absoluteGaloisGroup` but no scheme-theoretic π₁^ét and no Galois representations; Tau Ceti has `AbelianVariety K` over a field but no étale cohomology or Tate module). No headline is statable, so an empty declaration list is correct; the docstring has the required form, there is a single `import Mathlib`, no `set_option`, no sorry'd data, no padding. §3.1 (self-conjugate places) and §8.2 (n_v = 7) are statable in principle but are definitions and a counting lemma, not headlines.

Supplier contents checked against the text at the heads (not only the titles): AnabelianGeometryAndNonabelianChabauty §7.1 has the four named paragraphs, the field-general injectivity criterion ("no nonzero element divisible by every n ≥ 1 invertible in k") and `SectionConjecture`; InverseGaloisAndArithmeticFundamentalGroups IG.1.3 has "Invariance under algebraically closed base extension in characteristic zero" and IG.0.3 the inverse-system lisse ℤ_p-sheaves; ArithmeticGaloisRepresentations §1.3 has Frobenius reciprocity and Shapiro on invariants, §1.12 the Mackey decomposition, §2.1 decomposition groups; PadicHodgeTheory §7.2 has `LisseZpSheaf.ofEtale`, §7.3 `DeRhamPair` with proper smooth pushforward and the dual Tate local system, §5.3 D_pst over K₀^nr, §7.5 the relative analytic periods named by the gap; CohomologyComparisons §6.5 constructs `a:B_dR(−1)≃B_dR⟨−1⟩` for the Betts–Stix comparison; EtaleDualityAndPerverseSheaves §0.3 contains the paragraph "Poincaré duality on a smooth curve over an algebraically closed field" (Jacobian and Kummer proof, cup product identified with the Weil pairing); ArithmeticGaloisDuality Layer R02.3 contains "Hermite: finitely many extensions of bounded degree unramified outside a finite set"; ComplexComparisonPartII has C5.2 (Gauss–Manin), C6.0 (stratified topology) and C6.2 (Riemann existence); AnalyticNumberTheoryPartI §0.32 is Siegel–Walfisz with no Linnik statement, so the Linnik gap is minimal; LocalGaloisGroups Layer 7 proves generation of G_K by (N+2)-tuples with N = [K:ℚ_p], as §8.2 uses; LocalFieldsRamification Layer 1 has "Power classes, the primary statement" and "The dyadic square-class count" (#(ℚ₂ˣ/(ℚ₂ˣ)²) = 8); ClassFieldTheory Layer 5 has the Kummer class; MordellLawrenceVenkatesh §1.5 defines friendly exactly as "unramified over ℚ and above a place of E_K⁺ inert in E_K" (so §3.1(3) holds), §1.12 defines t_H = Σ j·dim gr^j (so §3.4's "filtration weight" is the jump average), §0.18 gives dim closure(G·x) ≤ dim G, §3.8 the period variety over a finite étale algebra, §7.1 the Frobenius-orbit size_v (unramified sets), LV.8 §§8.13–8.14 the Kodaira–Parshin family of relative dimension (2g−1)(q−1)/2 and LV.10 §10.10 full monodromy, LV.11 the Mordell theorem; HeightsRationalPointsAndObstructions §3.1 uses the twist convention "fibre splits iff eval(x)=τ" matching `README.md:65`, §3.5 defines `etaleSet`, §4.4 "Kodaira–Parshin covers" is Parshin's classical construction, a different object from the Lawrence–Venkatesh family, so no double ownership.

Sign and normalisation witnesses recomputed against the suppliers: PadicHodgeTheory ("Weight h counts C(h); filtration jump −h; ℚ_p(1) has Frobenius p^(−1) and jump −1") and CohomologyComparisons ("ℚ_p(1) has Hodge–Tate weight +1") have the sign the README says they have, and the README's jump −1 for ℚ_p(1) is their filtration; MordellLawrenceVenkatesh and WeightsInEtaleCohomology use geometric Frobenius with ℚ_p(n) of weight −2n, matching "ℚ_p(−1) has eigenvalue q, weight 2"; WeightsInEtaleCohomology defines "integral" as descent of the whole polynomial to ℤ[X] and records that a factor in a larger coefficient field need not be rational, matching the README's Conventions and §7.1; Betts–Stix footnote 7 defines Hodge–Tate weights by (C_p(r)⊗V)^{G_v} ≠ 0, so ℚ_p(1) has weight −1 there too and §3.2 needs no sign translation.

Ownership: the symplectic-pair category, the section pair, the Selmer and adelic Lawrence–Venkatesh loci, the self-conjugate average-weight identity, the model-free horizontal transport and the finite-cover locus on the modified carrier were searched by object across main and the open heads (`roadmaps grep` for Selmer section, Lawrence–Venkatesh locus, self-conjugate, Betts, Harari–Stix, finite descent locus, Kodaira–Parshin, filtered discrete, symplectic pair): the only hits outside this package are CohomologyComparisons §§6.4–6.7 (cited as the supplier), SchemeAndStackFoundations (a reference to the trace-normalised period line, also cited through CohomologyComparisons), PadicHodgeTheory §7.3 (cited), MordellLawrenceVenkatesh LV.7–LV.11 (cited), HeightsRationalPointsAndObstructions §4.4 (a different object) and incidental uses of "self-conjugate" for representations. No sibling in the brief states the same carriers. Ownership against open pull requests whose files the brief does not give was not checked.

Adversarial mathematics pass (one row per statement checked; values on both sides):

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: arithmetic reciprocity, χ_cyc(Art(u)) = N(u)⁻¹ | ℚ₃, u = 4 | χ_cyc value 1/4; χ_cyc⁻¹ value 4; bs lines 663–666 state the inverse norm | true, matches source | none |
| Conventions: jumps and weights of ℚ_p ⊕ ℚ_p(−1) | geometric Frobenius | jumps 0,1; eigenvalues 1,q; weights 0,2; sum of jumps 1 ≠ 1·2/2 unless pure | not pure of weight 1, as stated | none |
| Nφ = pφN witness | φ(e)=e, φ(f)=pf, N(f)=e | Nφ(f) = pe; pφN(f) = pφ(e) = pe; reversed relation gives p²e vs pe | consistent with bs Def 2.6(iv) and PHT | none |
| Period map pulls back along transport | T = [[1,0],[a,1]], F¹ = ⟨e₁⟩ | T⁻¹e₁ = e₁ − ae₂, point (1:−a); push-forward (1:a); bs Def 3.1 pulls back | README convention correct (bs E1 recorded by the design) | none |
| Induction convention (gψ)(h)=ψ(hg), (λψ)(g)=g(λ)ψ(g) | H-equivariance and associativity | (gψ)(hx)=ψ(hxg)=hψ(xg); (g₁(g₂ψ))(x)=ψ(xg₁g₂); (λψ)(hg)=hg(λ)hψ(g)=h((λψ)(g)) | well defined, semilinear | none |
| §0.1 real G_m model | Ẑ(1)⋊C₂, c inverts | (a,1)(2,c)(−a,1) = (2a+2,c); a = −2 gives (−2,c); both (±2,c) square to (0,1) | distinct sections, conjugate classes | none |
| §0.1 complex and real places | G_u trivial / order 2 | one-point target / two-element group | as stated | none |
| §0.2 injectivity over ℚ_p vs ℝ | E(ℚ_p) profinite; E(ℝ)⁰ divisible | divisible elements 0 / all of the circle component | injective / not injective; matches stix08 Thm 45, Rem 46 | none |
| §0.3 Selmer at archimedean places | Y(ℝ) = ∅ at a real place | Sec^Sel = ∅ while finite-place conditions can hold | definition must use all places, as bs Def 1.1 does | none |
| §0.4 modified carrier | E/ℚ with two real components | archimedean factor has 2 points; distinct points in one component identified | carrier correct, but supplier does not own it | R01 |
| §0.4 vs Stoll Lemma 5.8(1) | X = P¹ | π₁(X̄) = 1 so f-cov locus = all modified adelic points | matches stoll line 760 | none |
| §0.5(a) vs Harari–Stix Thm 2.1 | S = ∅, U trivial, X(k_v) ≠ ∅ given by the adelic point | (i) survives every torsor ⇔ (iii) global section with s_v = s∘θ_v up to conjugation in π₁(X̄) | matches hs lines 391–410, Remark (1) | none |
| §0.5(b) projection equals loc_v image | genus ≥ 1, finite v | from (a) every surviving adelic point has κ(P_v) = res_v(c) and P_v = loc_v(c) by injectivity; converse by choosing archimedean points | equality holds | none |
| §1.1 rank-zero pair | (A, 0), L = A | ∧²0 = 0 → A; Hom_A(0, A) = 0 ≅ 0 | perfect, rank 0 admitted | none |
| §1.1 non-split algebra | A = ℚ_{p²}, trivial action | Σ_A = Hom(ℚ_{p²}, ℚ_p) = ∅, dim A = 2 | #Σ ≠ dim A | none |
| §1.1 nilpotent algebra | A = ℚ_p[ε]/ε² | #Σ = 1, dim A = 2 | not detected by Σ | none |
| §1.2 algebra of a fibre | Y′_y with closed points of degrees 1 and 2 | H⁰ = ℚ_p³, Σ has 3 points, orbits of sizes 1 and 2 | split, #Σ = deg | none |
| §2.1 full faithfulness on units and Tate lines | V = W = ℚ_p; V = ℚ_p, W = ℚ_p(1) | Hom = {λ : φ(λ) = λ} = ℚ_p; {λ : φ(λ) = pλ} = 0 since Frobenius preserves valuation | matches bs Thm 2.9 | none |
| §2.1 induction lax monoidal | [L:K] = r = 2 | dim Ind1⊗Ind1 = 4; dim Ind(1⊗1) = 2 | lax, not strong | none |
| §2.2 End(1) needs φ | K_v = ℚ_{p²}, D = ℚ_p^nr | G_v-equivariant scalars ℚ_{p²}; with φ, ℚ_p | φ essential, as bs Prop 2.16 | none |
| §2.2 ordinary elliptic D | α, β roots of X²−a_pX+p, v(α)=0, v(β)=1 | End = ℚ_p×ℚ_p, dim Aut = 2 ≤ 4; multiplier of diag(a,b) is ab | within bound | none |
| §2.2 similitude of scalars | diag(2,3); scalar 2 | multipliers 6 and 4 | λ ↦ (λ, λ²) correct | none |
| §2.2 D = 0 | Aut vs Aut^GSp | trivial group vs G_m | matches bs footnote 6 | none |
| §2.3 orbit lemma | K_v = ℚ_p, G_m² on P¹ | orbits [1:0], [0:1], open orbit (transitive on ℚ_p^×) | 3 classes | none |
| §2.4 dimension bounds | d = 1 | d² = 1; d(2d+1)+1 = 4 = dim GSp₂ | as stated | none |
| §2.4 injectivity ℚ_p^nr⊗End(D) → End(D) | Dedekind argument | normalise λ₁ = 1, Σ(σ(λ_i)−λ_i)ψ_i = 0 shorter, so λ_i ∈ ℚ_p | injective | none |
| §3.1 conjugate places in ℚ(i) | 3, 5, 2 | (3) fixed; (2±i) exchanged; (1+i) fixed but ramified | self-conjugate / conjugate pair / self-conjugate not friendly; MLV §1.5 agrees | none |
| §3.1 maximal CM subfield | E ⊆ E_K | condition on E_K restricts to every CM E | (2) follows | none |
| §3.2 r_v + r_{v′} = n | ℚ_p(−1); finite order; ℚ_p(1) | (1,1,2); (0,0,0); (−1,−1,−2) | identity holds in README's convention, which equals bs footnote 7 | none |
| §3.3 χ = χ_cyc⁻¹ | n = 2 | χ|G_v = χ_cyc^{−1}·1 | as stated | none |
| §3.4 weighted sum | A/K of dimension g, V = H¹ | LHS 1·(0·g+1·g) = g; RHS 1·1·2g/2 = g | equal | none |
| §3.4 V = 0 | both sides | 0 = 0; average undefined | restricted correctly | none |
| §4.1 quadratic cover over ℚ₃ | z² = t at t = 1, 2 | ±1 ∈ ℚ₃ fixed; √2 ∉ ℚ₃, unramified, swapped | sign system trivial / nontrivial | none |
| §4.2 residue field 𝔽₂ | degrees 2 and 3 | 𝔽₄, 𝔽₈ have a third residue; G_{w,2}, G_{w,3} generate G_v (gcd(2,3) = 1) | reduction valid, matches bs Lemma 3.23 | none |
| §5.1 symplectic basis | (e,f) | ω(e,f) = 1, ω(f,e) = −1, target jump 1 | alternating, correct twist | none |
| §5.2 non-Lagrangian Φ | span(e₁,f₁) in a four-space | ω(Φ,Φ) ≠ 0, F² of the line is 0 | not a filtered pairing | none |
| §5.4 dimension | closed points of degrees 1 and 2, d = 1 | 1·1 + 2·1 = 3 | as stated | none |
| §6.1 non-S-good pairs | ℚ_p ⊕ ℚ_p(−1); H¹(E)(1) | weights 0,2 / −1; jumps {0,1} / {−1,0} | both excluded | none |
| §6.6 non-isomorphic symplectic pairs with equal module pairs | ω₁⊕ω₂ vs ω₁⊕cω₂, c nonsquare | b = a₁² = ca₂² forces c a square | non-isomorphic | none |
| §6.6 numerics | g = 3 | d₂₃ = 2.5·22 = 55; d₁₁ = 25; condition (3) at q = 11, n_v = 2: 16ζ(6)/1000 ≈ 0.0163 < 1/26 ≈ 0.0385 | matches bs Remark 1.4 and 6.23(III) | none |
| §6.8 trichotomy inequality | m ≤ d, orbit Σ₀ | m#Σ₀/2 ≤ (m−1)(#Σ₀−#Σ₀_{<4})/2 + m#Σ₀_{<4} ⇒ (m+1)#Σ₀_{<4} ≥ #Σ₀ | (c) with #Σ | none (source uses dim A: see Source issues) |
| §6.8 (c) with dim A instead of #Σ | A = ℚ_p[ε]/ε³, trivial action, V = A⊗H¹(E), d = 1 | #Σ_{<4} = 1; dim A/(d+1) = 3/2; #Σ/(d+1) = 1/2 | README's form true, source's form false | Source issue |
| §6.9 type (c) cases | A = ℚ_p; degree-5 point; empty algebra | 1 ≥ 1/(d+1); 0 ≥ 5/(d+1) false; 0 ≥ 0 true | as stated | none |
| §7.1 bounded-degree class set | non-constant relative dimension (1 and 2, δ = 2) | dim V = 6 > 2d_1δ = 4 | bound presumes constant d | R02 |
| §7.2 unipotent family | ρ_λ = [[1,λ],[0,1]] over ℚ(i) | det 1, polynomial (X−1)², B = 1, stable isotropic line ⟨e₁⟩ | infinitely many classes, excluded by GSp-irreducibility | none |
| §7.3 dimension count | (d,r) = (1,4), (1,3), (2,4) | 3 < 4; 3 = 3; 10 < 12 | r ≥ 4 needed; K_v-descent via base change of the orbit morphism | none |
| §7.6 four lines | ⟨e⟩,⟨f⟩,⟨e+f⟩,⟨e+2f⟩ | pairwise intersections 0; no common line | exceptional locus proper | none |
| §7.7 CM example at 5 | y² = x³ − x over 𝔽₅ | #E(𝔽₅) = 8, a₅ = −2, ordinary; 5 splits in ℚ(i); weight-one line has jump 1 ≥ 1/2; index 4 | Hodge point of type (b) | none |
| §8.1 size_v monotonicity | 4 fixed points ⊔ regular C₄-orbit → 1 fixed ⊔ orbit | fibres 4,1,1,1,1; 1/2 > 1/5 | equal fibres necessary | none |
| §8.1 size_v values | trivial; transitive 5; 3 ⊔ 4; S₃ regular; S₃/C₂ | 1; 0; 3/7; 0; 1 | as stated | none |
| §8.2 n_v | ℚ₅; ℚ₇; ℚ₂ | 3+1+3 = 7; 3+4 = 7; 7+4 = 11 | v ∤ 6 gives 7, ℚ₂ gives 11 | none |
| §8.2 bound 2^t + 6^t | t = N+2 from LocalGaloisGroups Layer 7 | index-2 ≤ #Hom(G,S₂), index-3 ≤ #Hom(G,S₃) | valid | none |
| §8.3 isotropy of M^{G_w} | g = 2, k = 5, q_v = 7 | gcd(5,6) = gcd(5,48) = gcd(5,342) = 1; #W² ≤ k^{2g} ⇒ #W ≤ 25; 7·25 = 175 of 625 | as stated | none |
| §8.4 inequality chain | g ≥ 2, 2k ≥ 9n_v | ζ(4) = π⁴/90 ≈ 1.0823 < 9/8; (9/8)(2k/9)/k^g = 1/(4k^{g−1}); 4k^{g−1} > (2g−1)k+1 for k > 1 | strict exclusion | none |
| §8.4 condition (1) ⇒ k coprime | 3 | q_v | 3 divides q_v(q_v+1)(q_v³−1) in every residue class | 3 ∤ q−1 forced | none |
| §8.5 auxiliary prime | q_v = 2, q = 11; q = p | 42 = 2·3·7; 10 ∤ 4, 3 ∤ 10, 7 ∤ 10; q = p forces q−1 = 2, failing (2) | q ≠ p automatic | none |
| Layer 8 Examples | q_v = 5, q = 83, g = 2 | k = 41, d_q = 123, 82 ≥ 63; odd primes of 5·6·124 are 3, 5, 31; (9/8)·7/1681 = 63/13448 < 1/124; 5·33 = 165 ≡ 1 mod 41 | all values correct | none |
| §9.1–9.5 assembly | empty local curve | all loci and images of cardinality 0 | consistent | none |
| gap four-isotropic-lagrangians | d = 1, r = 2 vs r = 4 general | fixed-W codimension j(2d+j+1−2m)/2 ≥ j(j+1)/2; r·codim > m(4d−3m+1)/2 for r ≥ 4 | proper closed subset, r ≥ 4 is the right threshold | none |

Policy: the diff touches only `packages/GaloisSectionsPadicPeriodMaps/`; the README has no pull-request numbers, no process narrative, no machine paths and no `set_option`; every target has a locator; every definition with an API has at least three discriminating Checks (sections with a single Check are theorems). Declared gaps: the seven slugs in `design/plan.json` are stated in the README under the supplier's subsection with identical wording; each `needs` is precise, none is already supplied (checked PadicHodgeTheory §7.5, MordellLawrenceVenkatesh §§1.2, 2.1–2.9, 3.12–3.19, 7.4, 8.13–8.14, AnalyticNumberTheoryPartI §0.32).

## Not verifiable

- The published Annals version (DOI 10.4007/annals.2025.201.1.2) could not be read; all locators were checked on arXiv v1 only, as the manifest records.
- Harari–Stix Corollary 1.7 and the published Theorem 11 numbering were taken from the arXiv v2 text and the Betts–Stix citation "[HS12, Theorem 11]" (bs line 64); the published text was not read.
- Ownership against open pull requests whose files the brief does not provide was not checked.
- The `#check` elaboration step does not apply: `Suggested.lean` contains no declaration.

## Source issues

- **Error** in bs at Proposition 6.7(c) (and Proposition 1.8(c)), printed pages 46 and 6: the source says the number of coefficient points in small G_v-orbits is at least dim_{ℚₚ}(A)/(d+1), but its orbit reduction only proves the bound with #Σ_A, and A = ℚₚ[ε]/(ε³) with trivial action, V = A⊗H¹(E), d = 1 has #Σ_{<4} = 1 < 3/2 with neither (a) nor (b); it should be #Σ_A/(d+1), which equals dim A/(d+1) for split A; affects a stated result (the proposition as stated; every application has A split, so Theorem 6.5 is unaffected).
- **Gap** in bs at proof of Proposition 6.9, printed page 49: the source says the fibre V_ψ of an S-good pair of type (a) satisfies the integrality condition of Definition 6.11 (Frobenius polynomials in ℤ[X]); only algebraic-integer eigenvalues of degree at most dim V follow, since a ℚₚ-factor of a polynomial in ℤ[X] need not have rational coefficients; it should enlarge T_i to bounded root degree, with the corresponding Faltings finiteness; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "73538ceaadfb92da361b97e7cf8e9d2e8e319074", "job": "RT-GaloisSectionsPadicPeriodMaps~1b", "model": "fable", "worker": "chris-k"} -->
