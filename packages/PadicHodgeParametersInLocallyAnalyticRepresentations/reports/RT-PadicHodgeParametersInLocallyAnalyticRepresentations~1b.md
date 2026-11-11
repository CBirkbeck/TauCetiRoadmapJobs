<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12999#issuecomment-6792612499 -->
Red team round 1 pass b (claude) of ad4bb16

Verdict: needs_changes

1. **F01** (P2) The deformation rings of a character of T(K) are attributed to a supplier section that only has the rank-one ring

   - **Location.** `packages/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md:274–275`
     ("its rank-one case gives the deformation rings of a character and of its locally algebraic
     deformations") and `README.md:1087–1089` ("in rank one, the rings R_δ ↠ `R_{δ,g}` of a character δ
     of T(K) … with tangent spaces H_T and Hom_sm(T(K),E)").
   - **Claim.** LocalGaloisDeformationRings §1.23 supplies R_δ and `R_{δ,g}` for a character δ of T(K),
     with tangent spaces H_T and Hom_sm(T(K),E).
   - **Witness.** LocalGaloisDeformationRings §1.23 (open head) has only the Check "`n = 1`:
     `R_D ≅ R_δ ≅ E⟦x₁,…,x_{[K:ℚ_p]+1}⟧`", a character of K^×. At n = 2, K = ℚ_p: that ring has
     tangent dimension 2; §5.1 needs dim H_T = 4. No roadmap or pin states R_δ for T(K) (searched
     LocalGaloisDeformationRings, TriangulineVarietyAndItsLocalModel, PhiGammaModulesAndIwasawaCohomology,
     LocallyAnalyticRepresentationsOfLocalGroups).
   - **Repair.** In the contract (`README.md:274–275`) replace the parenthetical's last clause by:
     "its rank-one case gives, for a continuous character δ_i of K^×, the ring `R_{δ_i}` and, for δ_i
     locally algebraic, its quotient `R_{δ_i,g}` of locally algebraic deformations". In §5.1, before
     "For δ = w(φ)z^h the square …", insert the target: "For a character δ = δ_1 ⊠ ⋯ ⊠ δ_n of
     T(K) = (K^×)^n define R_δ = `⊗̂_{i,E} R_{δ_i}` and, for δ locally algebraic, `R_{δ,g}` =
     `⊗̂_{i,E} R_{δ_i,g}`. Prove that they pro-represent the deformations, respectively the locally
     algebraic deformations, of δ over local Artinian E-algebras with residue field E, that they are
     formally smooth, that R_δ ↠ `R_{δ,g}`, and that their tangent spaces are H_T = H_char^n
     (dimension n(1 + d_K)) and Hom_sm(T(K),E) (dimension n). *Needs:* LocalGaloisDeformationRings
     §1.23 (rank one)." Delete "in rank one," from `README.md:1087`. Tested: n = 2, K = ℚ_p gives
     tangent dimension 2 + 2 = 4 = dim H_T and 1 + 1 = 2 = dim Hom_sm(T(K),E); n = 1 gives the
     supplier's ring.

2. **F02** (P3) The PhiGammaModulesAndIwasawaCohomology contract omits two sections that proof plans use

   - **Location.** `README.md:250–258` (contract lists §§1.0, 1.2, 3.4a, 3.6, 7.1, 7.3, 7.4, 7.5).
   - **Claim.** The contract is the exact list of what is consumed.
   - **Witness.** `README.md:735` (§2.6 *Needs:* "§§7.2a, 7.3 (Sen weights …)") and `README.md:1082–1083`
     (§5.1 *Needs:* "§§7.1–7.2 (Hom between localised rank-one modules …)"). Both sections exist at the
     supplier's head ("7.2 Field cohomology and rank-one submodules", "7.2a Sen modules and
     polynomials over affinoid coefficients").
   - **Repair.** In the contract, after "§7.1 (…the Tate character)," insert: "§7.2 (H⁰, H¹, H² of
     the rank-one modules `R_{K,E}(δ)` and their (φ,Γ)-submodules `∏_σ t_σ^{m_σ} R_{K,E}(δ)`; used in
     §5.1 for Hom(R(φ_i)[1/t], R(φ_j)[1/t]) = 0 when φ_i/φ_j is not algebraic), §7.2a (Sen modules
     and Sen polynomials over affinoid coefficients, applied to E[ε]/ε² in §2.6),".

3. **F03** (P3) Three dependency lines omit a supplier their own sketch cites

   - **Location.** `README.md:560–561` (§1.6 *Needs:*), `README.md:647` (§2.3 *Needs:*),
     `README.md:1237–1240` (Layer 5 Dependencies).
   - **Claim.** Each *Needs:* / Dependencies line lists every input.
   - **Witness.** §1.6 sketch cites "TriangulineVarietyAndItsLocalModel §11.4" (line 560) but *Needs:*
     has only "§1.4; LocallyAnalyticRepresentationsOfLocalGroups §8.14". §2.3 sketch cites
     TriangulineVarietyAndItsLocalModel §11.4 and LocallyAnalyticRepresentationsOfLocalGroups §8.8 (1)
     but *Needs:* is "§§1.6, 2.2". §5.1 *Needs:* has "PadicHodgeTheory §4.5" (line 1084); the Layer 5
     Dependencies do not.
   - **Repair.** §1.6: "*Needs:* §1.4; LocallyAnalyticRepresentationsOfLocalGroups §8.14;
     TriangulineVarietyAndItsLocalModel §11.4." §2.3: "*Needs:* §§1.4, 1.6, 2.2;
     LocallyAnalyticRepresentationsOfLocalGroups §8.8; TriangulineVarietyAndItsLocalModel §11.4."
     Layer 5 Dependencies: insert "PadicHodgeTheory §4.5;" before "Mathlib `TrivSqZeroExt`".

4. **F04** (P3) End_G(π(φ,h)) = E is used but no cited section states it

   - **Location.** `README.md:591–594` (§2.1: "because End_G(π(φ,h)) → End_G(V) → End_G(A) are
     isomorphisms onto E … *Needs:* … §§1.8–1.9, 8.2, 8.7, 8.12–8.13").
   - **Claim.** The cited supplier sections give the two isomorphisms.
   - **Witness.** LocallyAnalyticRepresentationsOfLocalGroups §8.7 proves End_G(π_1) ≅ End_G(π_alg) = E;
     §8.13 (π(φ,h)) proves existence, uniqueness, the socle filtration and the Ext¹ isomorphism, and
     says nothing about End_G(π(φ,h)).
   - **Repair.** In §2.1 after "Prove π_fs(D) ≅ π_min(D) ⊕_V π(φ,h)," insert: "that restriction
     gives End_G(π(φ,h)) ≅ End_G(V) ≅ End_G(A) = E (an endomorphism of π(φ,h) minus its scalar on the
     socle A kills A, and its image, a subrepresentation of π(φ,h) without the constituent A, which
     occurs once, is zero; it preserves V, the first two socle layers, by
     LocallyAnalyticRepresentationsOfLocalGroups §8.13),". Tested at n = 2, K = ℚ_p: π(φ,h) = V and
     the statement is §8.7's.

5. **F05** (P3) The gap restates maps that an earlier roadmap already requests from the same section under another slug

   - **Location.** `README.md:281–288` (gap:principal-series-bernstein-completion: "…the isomorphism
     `𝒥_w : Ĥ_φ ≅ R_{w(φ),g}` … with tangent map compatible with the reordering `w_2w_1^{−1}`").
   - **Claim.** The gap asks only for what no earlier roadmap covers.
   - **Witness.** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:98`:
     gap:ordered-character-map asks SmoothRepresentationsOfLocalGroups (§SR.3.2 in its §8.8 *Needs:*)
     for the same 𝒥_w with `𝒥_(w_2) ∘ p_(w_2w_1⁻¹) = 𝒥_(w_1)` and their differentials on Hom_sm(T(L),E).
     §5.1 of this roadmap takes independence of w from LocallyAnalyticRepresentationsOfLocalGroups
     §8.8 (2), not from the gap's tangent clause.
   - **Repair.** Keep the `What SmoothRepresentationsOfLocalGroups must provide (…)` sentence (it
     matches `design/plan.json`) and add after it: "The maps 𝒥_w and the reordering identity
     `𝒥_{w_2} ∘ p_{w_2w_1^{−1}} = 𝒥_{w_1}` are those of gap:ordered-character-map of
     LocallyAnalyticRepresentationsOfLocalGroups (same supplier section); one construction serves
     both. What this gap adds is the completion Ĥ_φ and the statement that 𝒥_w induces an
     isomorphism of Ĥ_φ onto the completed local ring at w(φ)."

6. **F06** (P3) A (φ,Γ)-module stands where a representation is meant

   - **Location.** `README.md:947–949` (Layer 3 Examples: "receiving the closed induction of
     π_min(M_1) ⊠ M_2 twisted by `ε^{−1}` ∘ θ^P").
   - **Claim.** The induced object is π_min(M_1) ⊠ M_2.
   - **Witness.** §3.2 (ii) (`README.md:802`) induces `⊠̂_i π_min(M_i)`; M_2 is a rank-one Robba
     module, not a representation of GL_1(K). By §2.6 Check 1, π_min of `R_{K,E}(ψz^{h_4})` is the
     character ψz^{h_4}.
   - **Repair.** Replace "π_min(M_1) ⊠ M_2" by "π_min(M_1) ⊠ π_min(M_2), where π_min(M_2) is the
     character ψz^{h_4} of K^× for M_2 = `R_{K,E}(ψz^{h_4})`".

7. **F07** (P3) A source theorem number is used as if it were this roadmap's

   - **Location.** `README.md:299` ("Layer 5 reformulates Theorem 3.21 through first-order Artinian
     algebras").
   - **Claim.** "Theorem 3.21" is identifiable in this roadmap.
   - **Witness.** `README.md:143–144` fixes the roadmap's own numbering for unqualified references;
     the same paragraph, two lines later, says "reformulate Theorem 1.4". This roadmap has no §3.21.
   - **Repair.** "Layer 5 reformulates Theorem 1.4 (DING25 Theorem 3.21) through first-order Artinian
     algebras".

8. **F08** (P3) Scope and headline list are defined by a source's section

   - **Location.** `README.md:16–17` ("The source is Ding, … (DING25), §3.2."), `README.md:21` ("This
     roadmap owns the comparison of §3.2 of DING25 and everything built from it"), and
     `Suggested.lean:11–12` ("The headline theorems are those of Ding, … §3.2:").
   - **Claim.** The organisation and ownership are the roadmap's own.
   - **Witness.** Principle: a roadmap does not say it follows a source; ownership is stated by the
     mathematics, sources are cited by locator. Line 21 names what is owned only by a section number.
   - **Repair.** Line 16–17: "The results are located in DING25 §3.2 (pp. 47–59); each target gives
     its locator." Line 21: "This roadmap owns the comparison between Ext¹_{GL_n(K)}(π_alg(φ,h),
     π_1(φ,h)) and the trianguline first-order deformations of D, and everything built from it: …".
     `Suggested.lean:11–12`: "The headline theorems (located in Ding, *p-adic Hodge parameters in the
     crystabelline representations of GL_n*, Publ. Math. IHÉS 142, 2025, §3.2) are:".

One P2 (R01) and seven P3. No statement of the roadmap was found false. `Suggested.lean` has zero
declarations; no headline is statable at the pins, so there is no padding finding and no missing
headline.

## Adversarial pass (values computed)

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| §0.1 families, w_j | n = 3: (1 2 3), (1 3 2); n = 4, i = 2, j = 1, 2, 3 | (1 2 3)(3) = 1, inverse image of 3 is 2; (1 3 2)(3) = 2; w_1 = (2 4), w_2 = w_3 = (1 2), all in S_j × S_{n−j}; (c·w)(n) = c(n) = 1 | holds |
| §0.2 H_j ⊂ Hom_{P_j,g′} | n = 3, j = 1 | (a,b,b) = a∘det_1 + b∘det_2; supplier §11.8 Hom_(P,g′) = Hom_sm + Σ ψ_i∘det_i | holds |
| §0.3 telescoping | n = 1, 2, 3; H_char = ℤ, 0 | coordinate i: Σ_{j≥i}(v_j − v_{j+1}) + v_n = v_i; (c,c,c)+(a−b,0,0)+(b−c,b−c,0) = (a,b,c); dims 6 vs 10 | holds |
| §0.4 dimensions | n = 2, d = 1, 2 | dim C = 8, 12; dim 𝔈 = dim Q = 5, 8 | holds |
| §1.1 c_n | n = 0…5 | 0, 0, 0, 1, 5, 16; c_5 = 2·5 + 6; c_{n+1} − 2c_n = n(n−1)/2 identically | holds |
| §1.2 weights, sign | n = 3, h = (3,1,−2) | h¹ = (3,1), h² = (1,−2); kernel of 𝔈_F ⊕ 𝔈_G → 𝔈 is {(b,−b)} | holds; matches DING25 line 2097–2099 |
| §1.3 transport | n = 3, w = (2 3) | w_1w = id ∈ S_end; w_2w sends 3 → 2 → 1 ∈ S_start; w_j fixes H_j pointwise (block-constant tuples) | holds |
| §1.4/1.5 | K = ℚ_p, n = 1…5; n = 3, d = 2 | (2,2,0), (5,5,0), (10,9,1), (19,14,5), (36,20,16); (17,15,2) | holds |
| §1.6 | n = 3, ℚ_p | dim 𝔈_w = 6, six of them, dim 𝔈 = 10, kernel a line | holds |
| §2.2 surjectivity of f_D | n = 3, ℚ_p; general 𝒦 | cokernel ⊂ 𝒦 ⊗ Ext¹(A,A), dim 1·4; a nonsplit image class gives, for a C with support ⊄ ker(𝒦 → Ext¹(A,C)), a class of Ext¹(Ã, C) nonzero on the sub A, against Lemma 3.5(2) | holds |
| §2.4 Check 2 | line L, L ∩ 𝔈_{g′} = 0, L ≠ 𝒦_D | soc Π_L = A (L ≠ 0), second layer = ⊕C (L ∩ ker(𝔈 → ⊕Ext¹(A,C)) = 0); ker f = L ≠ 𝒦_D = ker t_D | holds |
| §2.5 χ_D | n = 3; λ_σ = (2,0), λ_τ = (5,1) | |λ| = (2,6); |λ|_σ − N = Σ h_{i,σ} since Σ(i−1) = N; η(xI) = |x|^N | holds |
| §2.6 Check 4 | n = 2, h = (3,1) | λ = (3,2), λ+ρ = (7/2,3/2), e = (5, 21/4); s·h = (0,4), its λ+ρ = (1/2,9/2), e_2 = 9/4; s·(3,2) = (1,4), +θ = (1,3) | holds |
| §3.1–3.3 | n = 3 (2,1); n = 4 (3,1), (2,2) | Σc_{n_i} = 0; 1; 0; dim Ker t_{D,σ} = (n+2^n−1) − (n+n(n+1)/2) = c_n | holds |
| §3.5 | n = 3, d = 2 | 1 + 1 = 2; 𝔈_σ ∩ 𝔈_τ ⊃ 𝔈_g (dim 3), 10 + 10 > 17 | holds |
| §3.7 | n = 2, 3 | 5 = 5; 10 − 1 = 9 = 3 + 6 | holds |
| §4.1 | n = 3; general n | dim E⁻_F = (n + 2^{n−1}) − c_{n−1} = n + 1 + n(n−1)/2 = dim Q_σ(D_{1,σ}) × Hom_σ; ℒ_Π: 14 − 9 = 5 = 2 + 3; unrestricted 20 − 9 = 11; sign: supplier §13.9 pairs ((a,ψ),(b,−ψ)) with I_ι = {(ι⁻M, −ι⁺M)} equal the kernel of the sum map | holds |
| §4.2 Check 2 | a = 2, 3 | (1,1,0)·(1,−1,1) = 0, (1,2,1)·(1,−1,1) = 0; (1,3,1)·(1,−1,2) = 0; x = y forced, (x,2x,z) ∦ (1,3,1); diag(1,1,1/2): (1,2,1/2)·(1,−1,2) = 0 | holds |
| §5.1 fibre products | n = 3, d = 1; n = 1 | cotangent of A_D = {x ∈ Ext¹(D,D)^∨ : x|Ext¹_0 = 0} = Q^∨; dims 10, 7, 3, 11; n = 1: I_id = 0 | holds (given R01) |
| §5.4–5.5 | Q ≠ 0; n = 3, ℚ_p | ΣU_w = U since Σ𝔈_w = 𝔈; 𝔪U = A; U[𝔪]/V = A, U/V = A^{10} | holds |
| Twists | n = 4 (3,1); endpoints | θ^P = (0,0,0,−3) → 1 ⊠ ε³; (0,…,0,−(n−1)) → 1 ⊠ ε^{n−1}; (0,−1,…,−1) → 1 ⊠ ε∘det | holds |
| δ_w versus PS | diag(t_i) | z^h(ε^{−1}∘θ) = z^{h−θ}·∏|t_i|^{i−1} = z^λη | agrees with LocallyAnalyticRepresentationsOfLocalGroups §8.3 |

## Dependency check

```text
depcheck: 237 roadmaps, 2145 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

## Verified sound

- **Declarations read: 0** (`Suggested.lean`, 56 lines, read whole: `import Mathlib`, one module
  docstring, an empty namespace). No `set_option`, no `lemma`, no sorry'd data. The `#check @name`
  comparison has nothing to compare. The docstring names all eight headline groups of the README
  summary with the carrier each lacks; I confirmed at the pins that Mathlib and Tau Ceti have no
  Robba ring, (φ,Γ)-module, admissible locally analytic representation of GL_n(K) or Bernstein
  centre (the only hit is `TauCeti/NumberTheory/Padics/Distribution/LocallyAnalytic.lean`,
  distributions, not representations), so none is statable; nothing is padding.
- **Targets read: 30** (§§0.1–0.4, 1.1–1.6, 2.1–2.6, 3.1–3.7, 4.1–4.2, 5.1–5.5), plus Conventions,
  contracts, examples and Source corrections; every target has a locator.
- **Locators verified: 47** against DING25 page markers and text (Theorem 3.21 p. 48 through
  Corollary 3.37 p. 59, each statement read at DING25 lines 2065–2620; (2.13)–(2.21), (3.10)–(3.18),
  (3.24)–(3.30), Propositions 2.5, 2.10, 2.12, 3.8, 3.13, Corollaries 2.14, 2.15, 2.27, 2.38, 2.40,
  Example 2.9, §§3.1.1–3.1.2), and CEGGPS16 Lemma 3.22 (line 1921, p. 47). Page range 1–74 agrees
  with the 74-page text.
- **Checks tested: 113 read; about 70 carry numbers or explicit elements and were recomputed**
  (table above); the rest are structural and consistent with the theorems of their sections. Every
  definition has at least three Checks.
- **Sibling citations checked: all** section citations of LocallyAnalyticRepresentationsOfLocalGroups
  (board package: §§0.9, 1.5, 1.7–1.9, 4.1 (iv), 6.1, 7.1–7.3 with 7.3 (iv), 8.1–8.14 with the
  numbered parts 8.4 (1)–(2), 8.8 (1)–(2), 8.9 (2), 8.12 (2)–(3), 9.1–9.7 with 9.6 (3)–(4),
  10.1–10.7 with 10.5 (2)–(3)), TriangulineVarietyAndItsLocalModel (open head; §§10.1–10.3, 10.5–10.8,
  11.1–11.8, 12.1–12.2, 12.4, 12.6–12.7, 13.8, 13.13–13.14, 13.16; the board package copy has the
  same headings), PhiGammaModulesAndIwasawaCohomology (§§1.0, 1.2, 1.6, 3.4a, 3.6, 7.1–7.5, 7.2a),
  PadicHodgeTheory (§§4.5, 5.2), LocalGaloisDeformationRings (§§0.4, 1.23 and the five `PhiGamma.*`
  API names), SmoothRepresentationsOfLocalGroups (§SR.3.2), PadicLocalLanglandsForGL2Qp (§0.1),
  LieHighestWeight (Layers 3, 4, 5, 7, 9 on main). Conventions agree across suppliers: w(φ)_i =
  φ_{w⁻¹(i)}, θ^P, η, ε, the b ↦ (b, −b) sequence, the order of the factors of κ_G, dim Ext¹_0 =
  1 − n + dn(n−1)/2 = (n−1)(nd−2)/2.
- **Pins.** `LinearMap.quotKerEquivOfSurjective`, `LinearMap.finrank_range_add_finrank_ker`
  (`Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean:173`), `Submodule.finrank_sup_add_finrank_inf_eq`,
  `TrivSqZeroExt`, `DualNumber`, `CategoryTheory.Abelian.Ext` exist; `TauCeti.hcProjection` and
  `TauCeti.vermaCentralCharacter_eq_lift_cartanProjection` are in
  `TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/HarishChandra.lean` under `[IsKilling K L]`.
- **Gap.** gap:principal-series-bernstein-completion has the same slug, supplier and section in
  `design/plan.json` and the README; supplier is named; see R05 for the overlap.
- **Ownership.** No roadmap on main, board package or open head states t_D, π_min(D), π_fs(D), A_D
  or the recovery theorem (searched by object); TriangulineVarietyAndItsLocalModel and
  LocallyAnalyticRepresentationsOfLocalGroups name this roadmap as consumer only. The citation
  lead "LocallyAnalyticRepresentationsOfLocalGroups §4.1 found nowhere" is a false lead: the
  roadmap is a board package at position 253 of the merge order, before this one.
- **Policy.** The pull request changes only this package's folder; no pull-request numbers or
  process narrative in the README or docstring.

## Not verifiable

- The diagrams (3.52) and (3.54) of DING25 are flattened in the text extraction; I checked their
  terms and the dimension counts, not the arrow layout.
- Whether the closed induction of `⊠̂_i π_min(M_i)` lies in the category on which
  LocallyAnalyticRepresentationsOfLocalGroups §7.3 defines `I_{P⁻}^G` depends on that supplier's
  hypotheses on Rep^(zla.c), which I did not audit.
- SmoothRepresentationsOfLocalGroups §SR.3.2 is stated for complex coefficients; the E-rational
  form is the declared gap and was not assessed.
- No Lean was elaborated (read-only pass).

## Source issues

- **Error** in DING25 at proof of Theorem 3.21, (3.43), p. 49: the source says the character space of T(K) is the direct sum of the n − 1 maximal-Levi-centre character spaces and the centre's; it should be their non-direct sum (dimensions (2n−1)(1+d_K) against n(1+d_K)); affects the proof.
- **Misprint** in DING25 at the definition of χ_D before Proposition 3.26, p. 51: the source says |λ| is the sum of λ_{i,σ} over both i and σ; it should be the tuple |λ|_σ = Σ_i λ_{i,σ}; affects nothing.
- **Gap** in DING25 at proof of Proposition 3.26, p. 51: the source says the invariants' inclusion induces bijections on tangent spaces because the invariant ring is polynomial; it should invoke regularity of h (nonzero Vandermonde); affects the proof.
- **Misprint** in DING25 at proof of Theorem 3.34, first paragraph, p. 56: the source says Corollary 3.32(1) gives "only if" and the induction "if"; it should be the reverse; affects nothing.
- **Misprint** in DING25 at proof of Theorem 3.34, after (3.54), p. 56: the source says replacing D_σ by D′_σ gives the relation of D_σ again; it should be the relation of D′_σ; affects nothing.
- **Error** in DING25 at (3.53)–(3.54), proof of Theorem 3.34, p. 56: the source says the full groups Ext¹_σ(π_alg, π^±) are identified with the block space; it should use the images of the parabolic σ-Ext groups (n = 3: 10 + 10 against 7 + 7); affects the proof.
- **Misprint** in DING25 at (3.58), proof of Theorem 3.36, p. 58: the source says the operator ends in the w-universal extension; it should end in the full universal extension; affects nothing.
- **Misprint** in DING25 at proof of Lemma 2.11, p. 16: the source says the last parameter of the displayed triangulation has algebraic factor z^{h_1}; it should be z^{h_n}; affects nothing.
- **Misprint** in DING25 at proof of Corollary 2.14, p. 19: the source says the quotient paraboline space has dimension d_K dim(B ∩ L_P) − n; it should be + n; affects nothing.
- **Misprint** in DING25 at the definition before Corollary 2.38, p. 31: the source says the relation has third argument D_{2,σ}; it should be C_{1,σ}; affects nothing.
- **Misprint** in DING25 at (3.12), (3.15) and (3.33), pp. 38 and 46: the source says the labels I run over subsets of {1,…,n−1}; it should be subsets of {1,…,n} (the stated dimension needs 2^n − 2 labels); affects nothing.
- **Error** in DING25 at the paragraph after (3.30), p. 43: the source says the endpoint inductions carry ε on the rank-(n−1) block and ε^{n−1} on the character of the second; it should be 1 ⊠ ε^{n−1} and 1 ⊠ (ε ∘ det); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ad4bb16699996f7127187b71bc0e51334b9c336b", "job": "RT-PadicHodgeParametersInLocallyAnalyticRepresentations~1b", "model": "fable", "worker": "chris-l"} -->
