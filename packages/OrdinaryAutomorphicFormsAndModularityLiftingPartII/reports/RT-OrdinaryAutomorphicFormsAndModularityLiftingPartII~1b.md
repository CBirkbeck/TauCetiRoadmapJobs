<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13074#issuecomment-6792538880 -->
Red team round 1 pass b (claude) of 2984461

Verdict: needs_changes

1. **F01** (P2) 1.4 concludes `h¹ ≥ 1` without showing that ψ is nonzero

   **Location.** `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:207`: "Prove that `ψ ∈ H¹_{𝒮_Q^⊥,T}` for every Taylor–Wiles datum … in particular `h¹_{𝒮_Q^⊥,T} ≥ 1` for all such data and `h¹_{𝒮^⊥,T} ≥ 1`", under "Keep the data of 1.1" (only ρ̄ absolutely irreducible).

   **Claim.** The scalar class ψ inflated from `H¹(L⁺/F⁺, k)` gives a nonzero element of the dual Selmer group for every global problem of 1.1.

   **Witness.** n = 2, ρ̄ = Ind from `G_{F·L⁺}` to `G_F` of a character θ with θθ^c = 1 (absolutely irreducible, dihedral). In the induced basis r̄(c) = (B, 1)j with B diagonal. X = diag(1, 0) ∈ ad r̄ satisfies gXg⁻¹ − X = φ(g)·1₂ for g ∈ G_F (φ the quadratic character of F·L⁺/F; in characteristic 2, diag(0,1) = X + 1₂) and c·X = B·ᵗX·B⁻¹ = X. So ψ = ∂X is a coboundary: ψ = 0 in H¹(F(S)/F⁺, ad r̄(1)), and membership of ψ gives no lower bound. The map H¹(L⁺/F⁺, k) → H¹(F(S)/F⁺, ad r̄(1)) is injective exactly when `(ad r̄)^{G_{F·L⁺}} = k`, i.e. when `ρ̄|G_{F·L⁺}` is absolutely irreducible. BCGP25 Lemma 5.5.3 (BCGP25 lines 5640–5687) has the same omission; Tho17 gets the nonvanishing from `ρ̄(G_{F_N}) = ρ̄(G_F)` under adequacy (Tho17 line 631).

   **Repair.** In 1.4 replace "in particular `h¹_{𝒮_Q^⊥,T} ≥ 1` for all such data and `h¹_{𝒮^⊥,T} ≥ 1`" by: "If moreover `ρ̄|G_{F·L⁺}` is absolutely irreducible (automatic when H¹(ρ̄(G_F), k) = 0, in particular under near adequacy, since then ρ̄(G_{F·L⁺}) = ρ̄(G_F)), then ψ ≠ 0 — inflation from Gal(F·L⁺/F⁺) with coefficients `(ad r̄)^{G_{F·L⁺}} = k` is injective — so `h¹_{𝒮_Q^⊥,T} ≥ 1` for all such data and `h¹_{𝒮^⊥,T} ≥ 1`." Add the negative-control Check: "For n = 2 and ρ̄ induced from `G_{F·L⁺}` by a character θ with θθ^c = 1, X = diag(1, 0) has ∂X = ψ, so ψ = 0 and the lemma gives no class; near adequacy excludes this (the dihedral image has a quotient of order 2)." In 1.2(4) and 4.3 nothing changes (near adequacy is assumed there). Add to "Corrections to the sources": "**Lemma 5.5.3, p. 125** (gap; affects a stated result). The class ψ is asserted to bound the dual Selmer group below for every global deformation problem; it can vanish when `ρ̄|G_{F·L⁺}` is reducible. Correction: assume `ρ̄|G_{F·L⁺}` absolutely irreducible (implied by H¹(ρ̄(G_F), k) = 0)." Tested on the witness: the hypothesis fails there (ρ̄ restricted to G_{F·L⁺} is θ ⊕ θ′), so the repaired statement claims nothing.

2. **F02** (P1) 4.3 uses Taylor–Wiles level structures and their local–global compatibility at l = 2, which nothing supplies

   **Location.** `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:445`: "The Hecke modules at level Q_N are finite free over `Λ[Δ_{Q_N}]` … the Galois representations at level Q_N come from 3.3 applied with T ∪ Q_N in place of T".

   **Claim.** The patching data of 4.2 (modules H_N over `R_{𝒮_{Q_N}}`, free over S_N, with H_N/a_∞ ≅ H) exist from 1.2(4), 2.2(1) and 3.3.

   **Witness.** 3.1/3.3 with T ∪ Q_N impose `Lift^□_v` at v ∈ Q_N: they give neither the block condition `D^TW_v` nor the `O[Δ_{Q_N}]`-structure matching diamond operators, nor a level `U₁(Q_N)`, nor H_N/a_∞ ≅ H (which needs the projection of Tho12 Propositions 5.9–5.12). PotentialAutomorphyInfrastructurePartII §4.2 (*Taylor–Wiles level structures and the parahoric projection*) states exactly these, but "Keep Layer 3" with §3.2 "Let `l` be odd"; no target of Layers 2–3 here states them at l = 2, and 4.3's *Needs* cites no owner.

   **Repair.** Add a target to Layer 3 (after 3.3), "3.3a Taylor–Wiles level structures at p = 2": "In the setting of 3.3 with `U(l^{1,1})` sufficiently small, let (Q, (α_v)) be a Taylor–Wiles datum (1.2) with d_v = dim of the α_v-eigenspace. With the parahoric 𝔭_ṽ of type (n − d_v, d_v), 𝔭_{ṽ,1} = ker(𝔭_ṽ → k(ṽ)^×(2)), the levels U₀(Q) ⊃ U₁(Q), the operators V^j_ṽ and the projection pr_{ϖ_ṽ} of PotentialAutomorphyInfrastructurePartII §4.2, prove at l = 2, for the ordinary λ = 0 modules: (1) pr : `S^{ord}_{0,{χ_v}}(U(l^∞), E/O)_m` ≅ pr `S^{ord}_{0,{χ_v}}(U₀(Q)(l^∞), E/O)_{m_Q}`; (2) the Pontryagin dual H_Q of pr `S^{ord}_{0,{χ_v}}(U₁(Q)(l^∞), E/O)_{m_Q}` is finite free over Λ[Δ_Q] with H_Q ⊗_{Λ[Δ_Q]} Λ ≅ H; (3) the representation r_{m_Q} of 3.3 is of type `𝒮_{χ,Q}` (block condition `D^TW_v` at v ∈ Q, LocalGaloisDeformationRings §2.23) and `R_{𝒮_{χ,Q}}` → End(H_Q) is O[Δ_Q]-linear for the diamond operators (Tho12 Propositions 5.9 and 5.12 and Lemmas 5.10–5.11, whose proofs are local at v ∤ l; Tho17 §4, Theorem 4.1, at p = 2). *Needs:* 2.2; 2.3; 3.3; PotentialAutomorphyInfrastructurePartII §4.2 (definitions of 𝔭, V^j, pr); LocalGaloisDeformationRings §2.23." Then in 4.3 replace the sentence at the location by "The Hecke modules at level Q_N, their freeness over `Λ[Δ_{Q_N}]`, the isomorphism modulo a_∞ and the type-`𝒮_{Q_N}` Galois representations are 3.3a" and add 3.3a to 4.3's *Needs* and to the Layer 3 and Layer 4 Dependencies.

3. **F03** (P2) The O-coefficient dyadic polarized formulas have two owners

   **Location.** `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:12` ("This roadmap owns: polarized deformation problems over a weight algebra at p = 2 …"), `:96` ("for p odd; Layer 1 supplies p = 2 over Λ") and 1.1–1.2(1)–(3) (`:152–176`).

   **Claim.** Representability, the T-framed torsor, µ_v, `h^i_{𝒮,T}` and the Euler characteristic at p = 2 (Tho17 Lemmas 2.8–2.17, Corollary 2.14) are targets of this roadmap.

   **Witness.** PotentialAutomorphyInfrastructurePartII (earlier in the merge order), supplier contracts: "What GlobalGaloisDeformations must provide (gap:two-adic-polarized-presentation): Tangent, obstruction and presentation formulas for polarized deformation problems at `p = 2` … (Tho17, §§2.1–2.15)", and gap:cht-archimedean-ring-two-adic on LocalGaloisDeformationRings for the archimedean term n(n+1)/2. The same statements are thus assigned to GlobalGaloisDeformations there and planned again here.

   **Repair.** In "Scope and ownership" replace "polarized deformation problems over a weight algebra at p = 2 with strict equivalence by the full kernel Ĝ_n, Taylor–Wiles presentations over that weight algebra" by "the extension to coefficients in a weight algebra Λ of the dyadic polarized deformation theory (strict equivalence by Ĝ_n), and Taylor–Wiles presentations over Λ under near adequacy". In the GlobalGaloisDeformations contract replace "Layer 1 supplies p = 2 over Λ" by "the O-coefficient case at p = 2 (Tho17 §§2.1–2.15: representability, the framed torsor, µ_v, Lemmas 2.12–2.17 and Corollary 2.14) is the contract gap:two-adic-polarized-presentation that PotentialAutomorphyInfrastructurePartII states on GlobalGaloisDeformations, and the archimedean tangent dimension n(n+1)/2 is its gap:cht-archimedean-ring-two-adic on LocalGaloisDeformationRings; Layer 1 states the Λ-coefficient forms and deduces them from these (the Λ-structure does not enter the tangent and obstruction computation)". In 1.1 (first two API bullets) and 1.2(1)–(3) add "(O-coefficients: GlobalGaloisDeformations, contract gap:two-adic-polarized-presentation; here over Λ)", and add PotentialAutomorphyInfrastructurePartII's two contracts to the *Needs* of 1.1 and 1.2. The corrected value h³ = 1 already agrees with PotentialAutomorphyInfrastructurePartII §4.4.

4. **F04** (P2) `gap:dyadic-flag-ring-dimension` is a compound contract

   **Location.** `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:91`: "every irreducible component of Spec R^△_v has dimension at least … , and every irreducible component of Spec R^△_v/ϖ lies on an irreducible component of Spec R^△_v on which the torsion subgroup … acts … by the trivial character".

   **Claim.** One gap, one `needs`.

   **Witness.** Two unrelated statements: the first is a tangent–obstruction bound (Ger19 Lemma 3.2.3(ii), Ger19 lines 1582–1587) used by 3.2(a) and 4.x; the second is a special-fibre component statement with no source, used only by input (C) of 3.2(b) (`README.md:341`, `:352` "both clauses for (b)"). A supplier cannot discharge half a gap.

   **Repair.** Keep `gap:dyadic-flag-ring-dimension` with needs "For v | 2 and any residual `ρ̄|G_{F_ṽ}` with a stable full flag, every irreducible component of Spec R^△_v has dimension at least 1 + n² + [F_ṽ:ℚ₂]n(n+1)/2." Add to the plan's `gaps` and to the LocalGaloisDeformationRings contract `gap:dyadic-flag-ring-special-fibre` (supplier LocalGaloisDeformationRings, section "§6.24 The flag image ring for trivial residual representation"), needs "For v | 2 and any residual `ρ̄|G_{F_ṽ}` with a stable full flag, every irreducible component of Spec R^△_v/ϖ lies on an irreducible component of Spec R^△_v on which the torsion subgroup of `I^{ab}_{F_ṽ}(2)^n` acts, through Λ_v, by the trivial character." Cite the first in 3.2(a) and both in 3.2(b); update the *Needs* of 3.2 and the Layer 3 Dependencies.

5. **F05** (P3) Flatness and equidimensionality of R^□_v (v ∤ 2) is cited to the wrong supplier section

   **Location.** `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/README.md:339` and `:445`: "R^□_v for v ∤ 2 is O-flat and equidimensional of dimension n² + 1 (Sho18 Theorem 2.5; LocalGaloisDeformationRings §2.24)".

   **Witness.** LocalGaloisDeformationRings §2.24 is *Fixed-type rings away from `p` in rank `n` and constancy of types on components* (full-type rings, constancy, one extension making inertia unipotent). The cited statement is its §2.13, *Unrestricted lifting rings away from `p` are complete intersections*: "`R□` is reduced, flat and a local complete intersection of pure relative dimension `d²`".

   **Repair.** In 3.2(a) and 4.3 write "(Sho18 Theorem 2.5; LocalGaloisDeformationRings §2.13)"; add §2.13 to the Local deformation rings import bullet, to the LocalGaloisDeformationRings contract ("§2.13: for ℓ ≠ p the unrestricted framed ring is reduced, O-flat and equidimensional of relative dimension n²"), and to the *Needs* of 3.2 and 4.3 and the Dependencies of Layers 3–4. §2.24 stays for 3.4, 4.1 and 4.4.

## Verified sound

Counts: 0 Lean declarations (the file has only the module docstring and an empty namespace; read whole); 30 targets read (1.1–1.4, 2.1–2.3, 3.1–3.5, 4.1–4.8, 5.1–5.6, 6.1–6.4), every line of the README; about 60 locators verified against the cached texts (not tallied exactly) (BCGP25 pp. 120–139, 145–151, 182; Tho17 pp. 7–15; Ger19 Definitions/Lemmas 2.3.3, 2.4.4, 2.4.7, 2.5.3–2.5.4, 2.6.1, 2.6.4, 2.7.2–2.7.4, 3.1.4, 3.2.3; WHI22 (3.1)–(3.5), 3.14–3.20, 7.10; BCGP21 Definition 7.5.2, Lemma 7.5.15); every Check read, those with numerical or structural content recomputed (the table below records the values); every cited supplier section (about 50 section citations across 12 roadmaps) resolved by heading at the supplier's current head, with the statements of the 20 most load-bearing ones read (all section numbers and quoted titles exist; R05 is the one cited for a statement it does not make); 8 pinned declarations grepped (`Matrix.trace`, `Matrix.trace_one`, `Module.End.IsSemisimple`, `Submodule.span`, `Matrix.symplecticGroup`, `LieAlgebra.Symplectic.sp`, `groupCohomology`, `TauCeti.completedGroupAlgebra`: all present at the pins in the files named).

The pass, one row per statement (values computed on each side):

| Statement | Instances | Values | Result |
|---|---|---|---|
| 1.1 centralizer / conjugation by (1,a) | γ = (B,b)j, a ∈ 1+m_A | (µ,a)γ(µ,a)⁻¹ = (µ²a⁻¹B, b)j; centralizer {(µ,µ²)} ≅ Ĝ_m; (1,a) ↦ (a⁻¹B,b)j | agrees |
| 1.1 framing dimension | n=4,#T=3; n=2,#T=3 | 17·3−1 = 50; 5·3−1 = 14 | agrees (Tho17 Lemma 2.11) |
| 1.2(1) µ_v | r̄(c)=(B,1)j, char 2 | cocycle c ↦ 1_n; 1_n ∈ {X + BᵗXB⁻¹} ⇔ B alternating; B=Ψ₂ alternating, B=1₂ not | agrees (Tho17 Lemma 2.17) |
| 1.2(2) h³ | p=2 | (ad r̄(1))^{G_{F⁺}} ⊇ k·1_n since −ᵗX = ᵗX; dim 1 | agrees with Tho17 Lemma 2.15 and proof of Prop. 2.21 (h¹ = h² − h³ − χ), not with BCGP25 p. 123 |
| 1.2(3),(4) Euler count | n=2,d=2,#T=3,q=5 and q=6 | χ = −5, h¹ = 0+1−1+5 = 5 = g; χ = −6, h¹ = 6 = g | agrees |
| 1.2(5) | n odd; n even B=Ψ_n | H²(F/F⁺,k) → Ĥ⁰(ad) is 1 ↦ [1_n]; nonzero iff B not alternating | agrees; BCGP25 Remark 5.4.4 too strong |
| 1.3 (1)⇔(3)⇔(U) | H=1 ⊂ GL₂; GL₂(𝔽₂) | U = ad⁰ (dim 3); span H^ss = 𝔽₄ (dim 2), U ≅ V simple of dim 2 (ad ≅ P(1) ⊕ V, 𝔽₄ ≅ P(1)) | agrees |
| 1.4 ψ | F⁺ ∌ √2; F⁺=ℚ(√2); induced ρ̄ | m=3, L⁺=F⁺(√2); m=4, L⁺=ℚ(ζ₁₆)⁺; ψ = ∂diag(1,0) = 0 | R01 |
| Conventions Checks | p=7,q=2; ℚ₃,ℤ₂; n=4; n=2,d=2 | 2⁻¹ ≡ 4; ℤ₂⟦u,X⟧/(u²+2u), h²=1; ε⁻³; dim Λ = 5 | agree |
| 2.1 depth-zero Check | ℚ(√105) ⊂ ℚ(√−7,√−15) | −7 ≡ −15 ≡ 105 ≡ 1 mod 8; disc 105² = (105)²·1; indices 96/32 = 3, 32/16 = 2 | agrees |
| 2.1 idempotent Check | t=s=1 | 27²−27+2 = 704 = 22·32; 6²−6+2 = 32; sum 33 ≡ 1, product 162 ≡ 2 mod 32 | agrees |
| 2.1 Λ components | n=2, two places ℚ₂ | T(l) ≅ ({±1}×ℤ₂)⁴; 2⁴ = 16 components of dim 5 | agrees |
| 2.2 non-faithfulness Check | −1_n ∈ T(l) | twist (−1)^{dn(n−1)/2} = 1 for nd ≡ 0 mod 4; consistent with 2.2(1) because a level containing −1_n forces b₀ > e_v, so −1 ∉ T(l^{b₀}) | agrees |
| 2.2 hypothesis | any level | Iw(ṽ^{b,b}) is torsion-free for b large, so b₀ exists | no missing hypothesis |
| 2.3 constants | n=2 | T¹ = q+1, T² = 1: X²−(q+1)X+q = (X−1)(X−q); r = 1 ⊕ ε⁻¹ (geometric Frobenius) | agrees |
| 3.1 multiplier | n=3, n=4 | ε⁻²δ(c) = −1; ε⁻³(c) = −1 | agrees |
| 3.2(a) | general; n=2,d=2,#T=3 | 1+n²#T+dn(n+1)/2 − 1 − (1−#T+dn(n−1)/2) = (n²+1)#T−1+nd; 19−1 = 18, 18−14 = 4 | agrees |
| 3.2(b) rank one | n=1 | count d versus dim O⟦Γ⟧ = 1+d | agrees; (★) see Not verifiable |
| 3.4, 3.5 Checks | n=1, q ≡ 1 mod 4 | order-4 characters of k^× lift 1; conductor 1 | agrees |
| 4.2 | q=j=0; dim R_∞ = dim S_∞+1 | H free over Λ; depth ≤ dim Supp ≤ dim S_∞ | agrees |
| 4.3 dimensions | (n,d,#T,q) = (2,2,3,5), (2,6,3,5), (2,2,3,6) | 24 = 24; R^loc = 14+14+5−2 = 31, 32 = 32; 25 = 25 | agrees |
| 4.5 route | sandwich | Spec R_X ⊂ C_X ∩ V(a_∞) = Supp H₁ ∩ V(I_X) ⊂ Spec R_X; Krull: dim ≥ dim S_∞ − (q+(n²+1)#T−1) = dim Λ | sound; avoids 3.2 |
| 5.1 | #T=1,3 | 11−1 = 10; 33−1 = 32 | agrees |
| 5.2 vast ⇒ reasonable | h regular semisimple | (𝔰𝔭₄^∨)^h = functionals killing root spaces, nonzero on 𝔱 = 𝔷_h; scalars ∩ 𝔰𝔭₄ = 0 for p odd | agrees |
| 5.3 | WHI22 Prop. 3.18 | proof uses Lemma 3.16, which assumes H⁰ = 0 (WHI22 lines 1001, 1046) | README's added (a) is right |
| 5.4 (6) and Checks | h, q; 𝔽₃ example | Ad(h)-eigenvalues are ratios; 1 ≠ q and ratio set inverse-closed; hJᵗh = J, [h,X] = 2E₁₂+E₄₃, Z = h−h⁻¹ = 2E₁₂+E₄₃ | agrees |
| 5.4 (5) | p=3 | χ₁ ≠ χ₂^{±1} nontrivial needs µ₉: q=19 yes, q=7 no | agrees |
| 6.2 | F⁺=ℚ,#S=3,t=7 | g = 5; 5+30+4 = 39 = 7+33−1 | agrees (WHI22 line 3315) |
| 6.4 | — | nilpotent kernel onto a finite Λ-algebra, R complete Noetherian local ⇒ R/m_ΛR of finite length | agrees |

Headline theorems and padding. Headlines listed from the README: 4.7, 4.8, 3.2(b), 6.3, 6.4, 5.3, 1.2(4). Each is named in the module docstring of `Suggested.lean` with the carrier it lacks; no global deformation ring, automorphic representation, algebraic modular form or Hida module exists at the pins (grep of the pinned Tau Ceti for deformation, adequacy and Hida declarations: none), so none is statable and none is forced through a stand-in. 1.3 (trace condition on the full adjoint ⇔ spanning) and 4.2 (abstract patching) are statable in principle but are a lemma and a tool, not headlines; their absence is correct. Padding: none (no declaration). `#check` audit: no declaration to check, nothing changed. Imports: the single `import Mathlib`. No `set_option`, no `lemma`, no pull-request numbers or process narrative in the README or docstring.

Suppliers, order and gaps. Every roadmap named as a supplier is earlier in the merge order (positions 26–282 against 283); consumers named downstream (GSp4NonregularModularityLifting, AbelianSurfacesModularity) are later and are not cited as suppliers. The seven declared gaps have the same slug, supplier and section in `design/plan.json` and in the README, and each named supplier section exists at the supplier's head (§6.24, §2.17, §SR.3.2, Layer 12, *GSp₄ construction and normalization*); R04 concerns the shape of one of them. The AutomorphicBundles former numbering B5.10–B5.12 = 12.11–12.13 is the mapping that roadmap itself records. GSp4NonregularModularityLifting cites §§1.3, 2.1–2.2, 3.1–3.2, 4.7–4.8, 5.2, 5.4–5.6, 6.3–6.4 of this roadmap; all exist. Ownership against the open pull requests was checked with `roadmaps grep` for near adequacy and reasonableness: no second owner of near adequacy; AbelianSurfacesModularity's gap on ArithmeticGaloisRepresentations for reasonableness is the intake issue already settled as not actionable in this package and is not re-raised.

Dependency check output: `depcheck: 237 roadmaps, 2151 edges, 0 problem(s)`.

## Not verifiable

- **3.2(b), inputs (★) and (C) at an unprepared field.** The README states that the sources do not supply them and makes them part of the target; I could neither prove nor refute them. The rank-one case holds by class field theory (dimension 1 + d). 4.8 depends on 3.2(b); 4.7 and 4.5 do not (checked: 4.5 reads its bound off the patched module).
- **Second clause of gap:dyadic-flag-ring-dimension for nontrivial residual representation.** For trivial residual representation and large degree it follows from §6.24 (the ideals (Q, ϖ) of Λ_v coincide for all minimal Q); in general no source was found.
- **Tho12 Propositions 5.9–5.12 at l = 2** (the repair of R02): Tho12's text in the cache was not opened beyond the locators the sibling quotes; the statement of the new target is taken from PotentialAutomorphyInfrastructurePartII §4.2 and Tho17 §4.
- **6.3, reducedness of `T_{S_{1,π}}`** (needed for "(R)_red ≅ T" rather than only a nilpotent kernel): asserted by BCGP25 Theorem 6.3.4 without argument; not checked.
- BLGHT11 Lemma 3.3, Tay08 Lemma 2.3, CHT08 Lemmas 2.2.11–2.3.5, KW09 Lemma 9.4, Sho18 Theorem 2.5, KT17 Proposition 3.1 and BCGNT25 Lemma 3.2.4 were not opened; they are cited for standard statements.
- No Lean was elaborated (read-only pass; the file has no declaration).

## Source issues

- **Gap** in BCGP25 at Lemma 5.5.3, printed p. 125: the source says the scalar class inflated from the quadratic extension L⁺/F⁺ bounds the dual Selmer group below for every global deformation problem; it should be assumed that ρ̄ restricted to G_{F·L⁺} is absolutely irreducible, otherwise the class can be a coboundary; affects a stated result.
- **Error** in BCGP25 at §5.4, printed p. 123: the source says the cohomology of Thorne's complex vanishes outside degrees 1 and 2 for nonempty T; it should be h³ = h⁰(ad r̄(1)) = 1 at p = 2, as in Tho17 Lemma 2.15 and the proof of Proposition 2.21; affects a stated result.
- **Gap** in BCGP25 at Lemma 5.7.7, proof, printed pp. 133–134: the source says the relation count is at most n²#T + [F⁺:ℚ]n(n−1)/2; it should allow one more relation because h³ = 1, giving only dim Λ − 1 from the count; affects the proof.
- **Misprint** in BCGP25 at Lemma 5.7.7, statement, printed p. 133: the source says dim Λ = 1 + [F:ℚ]n; it should be 1 + [F⁺:ℚ]n; affects nothing.
- **Misprint** in BCGP25 at Remark 5.4.4, display (5.4.5), printed p. 124: the source says the last term is H² of F(S)/F⁺ with coefficients k; it should have coefficients ad r̄; affects nothing.
- **Gap** in BCGP25 at Remark 5.4.4, printed p. 124: the source says restriction is surjective because H²(F/F⁺, k) injects into H² of a real place with trivial coefficients; it should require injectivity into H² with coefficients ad r̄, which fails when r̄(c_v) is of alternating type; affects nothing.
- **Gap** in BCGP25 at Lemma 5.5.3, proof, printed p. 125: the source says one may assume F⁺ lies between two consecutive real 2-power cyclotomic fields; it should take the least m with K⁺_m not contained in F⁺; affects the proof.
- **Misprint** in BCGP25 at Lemma 5.5.3, proof, printed p. 126: the source says the class of ψ comes from L/L⁺ and that L⁺/L is unramified outside 2; it should be L⁺/F⁺ in both places; affects nothing.
- **Misprint** in BCGP25 at Proposition 5.5.6(i), printed p. 126: the source says µ(c_v) = −1; it should be χ(c_v) = −1 (the same slip is in Tho17 Proposition 2.21(i), p. 14); affects nothing.
- **Misprint** in BCGP25 at §5.6.1, definition of the fixed-type problem, printed p. 129: the source says the characters are evaluated at the Artin map of an inertia element; it should be the inverse Artin map; affects nothing.
- **Misprint** in BCGP25 at (5.7.3), printed p. 131: the source says the sequence defining T(l) ends in the product of the k(v)^×; it should end in the product of the T(k(v)); affects nothing.
- **Error** in BCGP25 at §5.7, Hecke operators above 2, printed p. 131: the source says the U-operators are compatible with inclusions of forms for all 0 ≤ b ≤ c; it should require c ≥ 1, as in Ger19 Lemma 2.3.3; affects a stated result.
- **Misprint** in BCGP25 at proof of Theorem 5.7.14, printed p. 137: the source says Spec R_X lies in the support of the primed patched module; it should be the unprimed module H_{1,∞} (equivalently H_1); affects nothing.
- **Misprint** in BCGP25 at proof of Theorem 5.7.14, printed p. 138: the source says T is replaced by R′ ∪ {v′₁} over L; it should also contain the places above 2; affects nothing.
- **Gap** in BCGP25 at Proposition 5.7.9, printed p. 134: the source says a maximal ideal with residual representation ρ̄ exists at every level hyperspecial off T; it should assume π has a fixed vector at the places of T outside R and S_2; affects a stated result.
- **Gap** in WHI22 at Proposition 3.18, printed p. 22 (arXiv v3): the source says condition 2 of Definition 3.15 and the conditional H¹ vanishing suffice; it should also assume the H⁰ vanishing that Lemma 3.16, used in the proof, requires; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2984461158c0b34d4ec7f3f0afbbc76fdebc865b", "job": "RT-OrdinaryAutomorphicFormsAndModularityLiftingPartII~1b", "model": "fable", "worker": "chris-x10"} -->
